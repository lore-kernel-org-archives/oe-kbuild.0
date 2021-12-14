Content-Type: multipart/mixed; boundary="===============1956671091875325107=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/efi/capsule.c:172 efi_capsule_update_locked() warn: should '((((sg_pages[0]) - mem_map) + riscv_pfn_base)) << (12)' be a 64 bit type?
Date: Tue, 14 Dec 2021 11:05:06 +0800
Message-ID: <202112141017.CV4p6OTz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1956671091875325107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kenneth Lee <liguozhu@hisilicon.com>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
commit: fb31f0a499332a053477ed57312b214e42476e6d riscv: fix the global name=
 pfn_base confliction error
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-m031-20211213 (https://download.01.org/0day-ci/arc=
hive/20211214/202112141017.CV4p6OTz-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/firmware/efi/capsule.c:172 efi_capsule_update_locked() warn: should=
 '((((sg_pages[0]) - mem_map) + riscv_pfn_base)) << (12)' be a 64 bit type?
drivers/firmware/efi/capsule.c:267 efi_capsule_update() warn: should '((((s=
g_pages[i + 1]) - mem_map) + riscv_pfn_base)) << (12)' be a 64 bit type?

vim +172 drivers/firmware/efi/capsule.c

f0133f3c5b8bb3 Matt Fleming   2016-04-25  126  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  127  /**
f0133f3c5b8bb3 Matt Fleming   2016-04-25  128   * efi_capsule_update_locked=
 - pass a single capsule to the firmware
f0133f3c5b8bb3 Matt Fleming   2016-04-25  129   * @capsule: capsule to send=
 to the firmware
f0133f3c5b8bb3 Matt Fleming   2016-04-25  130   * @sg_pages: array of scatt=
er gather (block descriptor) pages
f0133f3c5b8bb3 Matt Fleming   2016-04-25  131   * @reset: the reset type re=
quired for @capsule
f0133f3c5b8bb3 Matt Fleming   2016-04-25  132   *
f0133f3c5b8bb3 Matt Fleming   2016-04-25  133   * Since this function must =
be called under capsule_mutex check
f0133f3c5b8bb3 Matt Fleming   2016-04-25  134   * whether efi_reset_type wi=
ll conflict with @reset, and atomically
f0133f3c5b8bb3 Matt Fleming   2016-04-25  135   * set it and capsule_pendin=
g if a capsule was successfully sent to
f0133f3c5b8bb3 Matt Fleming   2016-04-25  136   * the firmware.
f0133f3c5b8bb3 Matt Fleming   2016-04-25  137   *
f0133f3c5b8bb3 Matt Fleming   2016-04-25  138   * We also check to see if t=
he system is about to restart, and if so,
f0133f3c5b8bb3 Matt Fleming   2016-04-25  139   * abort. This avoids races =
between efi_capsule_update() and
f0133f3c5b8bb3 Matt Fleming   2016-04-25  140   * efi_capsule_pending().
f0133f3c5b8bb3 Matt Fleming   2016-04-25  141   */
f0133f3c5b8bb3 Matt Fleming   2016-04-25  142  static int
f0133f3c5b8bb3 Matt Fleming   2016-04-25  143  efi_capsule_update_locked(ef=
i_capsule_header_t *capsule,
f0133f3c5b8bb3 Matt Fleming   2016-04-25  144  			  struct page **sg_pages,=
 int reset)
f0133f3c5b8bb3 Matt Fleming   2016-04-25  145  {
f0133f3c5b8bb3 Matt Fleming   2016-04-25  146  	efi_physical_addr_t sglist_=
phys;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  147  	efi_status_t status;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  148  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  149  	lockdep_assert_held(&capsul=
e_mutex);
f0133f3c5b8bb3 Matt Fleming   2016-04-25  150  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  151  	/*
f0133f3c5b8bb3 Matt Fleming   2016-04-25  152  	 * If someone has already r=
egistered a capsule that requires a
f0133f3c5b8bb3 Matt Fleming   2016-04-25  153  	 * different reset type, we=
're out of luck and must abort.
f0133f3c5b8bb3 Matt Fleming   2016-04-25  154  	 */
f0133f3c5b8bb3 Matt Fleming   2016-04-25  155  	if (efi_reset_type >=3D 0 &=
& efi_reset_type !=3D reset) {
f0133f3c5b8bb3 Matt Fleming   2016-04-25  156  		pr_err("Conflicting capsul=
e reset type %d (%d).\n",
f0133f3c5b8bb3 Matt Fleming   2016-04-25  157  		       reset, efi_reset_ty=
pe);
f0133f3c5b8bb3 Matt Fleming   2016-04-25  158  		return -EINVAL;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  159  	}
f0133f3c5b8bb3 Matt Fleming   2016-04-25  160  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  161  	/*
f0133f3c5b8bb3 Matt Fleming   2016-04-25  162  	 * If the system is getting=
 ready to restart it may have
f0133f3c5b8bb3 Matt Fleming   2016-04-25  163  	 * called efi_capsule_pendi=
ng() to make decisions (such as
f0133f3c5b8bb3 Matt Fleming   2016-04-25  164  	 * whether to force an EFI =
reboot), and we're racing against
f0133f3c5b8bb3 Matt Fleming   2016-04-25  165  	 * that call. Abort in that=
 case.
f0133f3c5b8bb3 Matt Fleming   2016-04-25  166  	 */
62075e581802ea Matt Fleming   2016-05-06  167  	if (unlikely(stop_capsules)=
) {
f0133f3c5b8bb3 Matt Fleming   2016-04-25  168  		pr_warn("Capsule update ra=
ced with reboot, aborting.\n");
f0133f3c5b8bb3 Matt Fleming   2016-04-25  169  		return -EINVAL;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  170  	}
f0133f3c5b8bb3 Matt Fleming   2016-04-25  171  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25 @172  	sglist_phys =3D page_to_phy=
s(sg_pages[0]);
f0133f3c5b8bb3 Matt Fleming   2016-04-25  173  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  174  	status =3D efi.update_capsu=
le(&capsule, 1, sglist_phys);
f0133f3c5b8bb3 Matt Fleming   2016-04-25  175  	if (status =3D=3D EFI_SUCCE=
SS) {
f0133f3c5b8bb3 Matt Fleming   2016-04-25  176  		capsule_pending =3D true;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  177  		efi_reset_type =3D reset;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  178  	}
f0133f3c5b8bb3 Matt Fleming   2016-04-25  179  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  180  	return efi_status_to_err(st=
atus);
f0133f3c5b8bb3 Matt Fleming   2016-04-25  181  }
f0133f3c5b8bb3 Matt Fleming   2016-04-25  182  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  183  /**
f0133f3c5b8bb3 Matt Fleming   2016-04-25  184   * efi_capsule_update - send=
 a capsule to the firmware
f0133f3c5b8bb3 Matt Fleming   2016-04-25  185   * @capsule: capsule to send=
 to firmware
f0133f3c5b8bb3 Matt Fleming   2016-04-25  186   * @pages: an array of capsu=
le data pages
f0133f3c5b8bb3 Matt Fleming   2016-04-25  187   *
f0133f3c5b8bb3 Matt Fleming   2016-04-25  188   * Build a scatter gather li=
st with EFI capsule block descriptors to
f0133f3c5b8bb3 Matt Fleming   2016-04-25  189   * map the capsule described=
 by @capsule with its data in @pages and
f0133f3c5b8bb3 Matt Fleming   2016-04-25  190   * send it to the firmware v=
ia the UpdateCapsule() runtime service.
f0133f3c5b8bb3 Matt Fleming   2016-04-25  191   *
6862e6ad95e984 Austin Christ  2016-08-11  192   * @capsule must be a virtua=
l mapping of the complete capsule update in the
6862e6ad95e984 Austin Christ  2016-08-11  193   * kernel address space, as =
the capsule can be consumed immediately.
6862e6ad95e984 Austin Christ  2016-08-11  194   * A capsule_header_t that d=
escribes the entire contents of the capsule
f0133f3c5b8bb3 Matt Fleming   2016-04-25  195   * must be at the start of t=
he first data page.
f0133f3c5b8bb3 Matt Fleming   2016-04-25  196   *
f0133f3c5b8bb3 Matt Fleming   2016-04-25  197   * Even though this function=
 will validate that the firmware supports
f0133f3c5b8bb3 Matt Fleming   2016-04-25  198   * the capsule guid, users w=
ill likely want to check that
f0133f3c5b8bb3 Matt Fleming   2016-04-25  199   * efi_capsule_supported() r=
eturns true before calling this function
f0133f3c5b8bb3 Matt Fleming   2016-04-25  200   * because it makes it easie=
r to print helpful error messages.
f0133f3c5b8bb3 Matt Fleming   2016-04-25  201   *
f0133f3c5b8bb3 Matt Fleming   2016-04-25  202   * If the capsule is success=
fully submitted to the firmware, any
f0133f3c5b8bb3 Matt Fleming   2016-04-25  203   * subsequent calls to efi_c=
apsule_pending() will return true. @pages
f0133f3c5b8bb3 Matt Fleming   2016-04-25  204   * must not be released or m=
odified if this function returns
f0133f3c5b8bb3 Matt Fleming   2016-04-25  205   * successfully.
f0133f3c5b8bb3 Matt Fleming   2016-04-25  206   *
f0133f3c5b8bb3 Matt Fleming   2016-04-25  207   * Callers must be prepared =
for this function to fail, which can
f0133f3c5b8bb3 Matt Fleming   2016-04-25  208   * happen if we raced with s=
ystem reboot or if there is already a
f0133f3c5b8bb3 Matt Fleming   2016-04-25  209   * pending capsule that has =
a reset type that conflicts with the one
f0133f3c5b8bb3 Matt Fleming   2016-04-25  210   * required by @capsule. Do =
NOT use efi_capsule_pending() to detect
f0133f3c5b8bb3 Matt Fleming   2016-04-25  211   * this conflict since that =
would be racy. Instead, submit the capsule
f0133f3c5b8bb3 Matt Fleming   2016-04-25  212   * to efi_capsule_update() a=
nd check the return value.
f0133f3c5b8bb3 Matt Fleming   2016-04-25  213   *
f0133f3c5b8bb3 Matt Fleming   2016-04-25  214   * Return 0 on success, a co=
nverted EFI status code on failure.
f0133f3c5b8bb3 Matt Fleming   2016-04-25  215   */
2a457fb31df62c Ard Biesheuvel 2017-06-02  216  int efi_capsule_update(efi_c=
apsule_header_t *capsule, phys_addr_t *pages)
f0133f3c5b8bb3 Matt Fleming   2016-04-25  217  {
f0133f3c5b8bb3 Matt Fleming   2016-04-25  218  	u32 imagesize =3D capsule->=
imagesize;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  219  	efi_guid_t guid =3D capsule=
->guid;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  220  	unsigned int count, sg_coun=
t;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  221  	u32 flags =3D capsule->flag=
s;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  222  	struct page **sg_pages;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  223  	int rv, reset_type;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  224  	int i, j;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  225  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  226  	rv =3D efi_capsule_supporte=
d(guid, flags, imagesize, &reset_type);
f0133f3c5b8bb3 Matt Fleming   2016-04-25  227  	if (rv)
f0133f3c5b8bb3 Matt Fleming   2016-04-25  228  		return rv;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  229  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  230  	count =3D DIV_ROUND_UP(imag=
esize, PAGE_SIZE);
f0133f3c5b8bb3 Matt Fleming   2016-04-25  231  	sg_count =3D sg_pages_num(c=
ount);
f0133f3c5b8bb3 Matt Fleming   2016-04-25  232  =

6396bb221514d2 Kees Cook      2018-06-12  233  	sg_pages =3D kcalloc(sg_cou=
nt, sizeof(*sg_pages), GFP_KERNEL);
f0133f3c5b8bb3 Matt Fleming   2016-04-25  234  	if (!sg_pages)
f0133f3c5b8bb3 Matt Fleming   2016-04-25  235  		return -ENOMEM;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  236  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  237  	for (i =3D 0; i < sg_count;=
 i++) {
f0133f3c5b8bb3 Matt Fleming   2016-04-25  238  		sg_pages[i] =3D alloc_page=
(GFP_KERNEL);
f0133f3c5b8bb3 Matt Fleming   2016-04-25  239  		if (!sg_pages[i]) {
f0133f3c5b8bb3 Matt Fleming   2016-04-25  240  			rv =3D -ENOMEM;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  241  			goto out;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  242  		}
f0133f3c5b8bb3 Matt Fleming   2016-04-25  243  	}
f0133f3c5b8bb3 Matt Fleming   2016-04-25  244  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  245  	for (i =3D 0; i < sg_count;=
 i++) {
f0133f3c5b8bb3 Matt Fleming   2016-04-25  246  		efi_capsule_block_desc_t *=
sglist;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  247  =

91c1c092f27da4 Ard Biesheuvel 2020-12-07  248  		sglist =3D kmap_atomic(sg_=
pages[i]);
f0133f3c5b8bb3 Matt Fleming   2016-04-25  249  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  250  		for (j =3D 0; j < SGLIST_P=
ER_PAGE && count > 0; j++) {
2a457fb31df62c Ard Biesheuvel 2017-06-02  251  			u64 sz =3D min_t(u64, ima=
gesize,
2a457fb31df62c Ard Biesheuvel 2017-06-02  252  				       PAGE_SIZE - (u64)=
*pages % PAGE_SIZE);
f0133f3c5b8bb3 Matt Fleming   2016-04-25  253  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  254  			sglist[j].length =3D sz;
2a457fb31df62c Ard Biesheuvel 2017-06-02  255  			sglist[j].data =3D *pages=
++;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  256  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  257  			imagesize -=3D sz;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  258  			count--;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  259  		}
f0133f3c5b8bb3 Matt Fleming   2016-04-25  260  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  261  		/* Continuation pointer */
f0133f3c5b8bb3 Matt Fleming   2016-04-25  262  		sglist[j].length =3D 0;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  263  =

f0133f3c5b8bb3 Matt Fleming   2016-04-25  264  		if (i + 1 =3D=3D sg_count)
f0133f3c5b8bb3 Matt Fleming   2016-04-25  265  			sglist[j].data =3D 0;
f0133f3c5b8bb3 Matt Fleming   2016-04-25  266  		else
f0133f3c5b8bb3 Matt Fleming   2016-04-25 @267  			sglist[j].data =3D page_t=
o_phys(sg_pages[i + 1]);
f0133f3c5b8bb3 Matt Fleming   2016-04-25  268  =


:::::: The code at line 172 was first introduced by commit
:::::: f0133f3c5b8bb34ec4dec50c27e7a655aeee8935 efi: Add 'capsule' update s=
upport

:::::: TO: Matt Fleming <matt@codeblueprint.co.uk>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1956671091875325107==--

