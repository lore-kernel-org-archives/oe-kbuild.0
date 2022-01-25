Content-Type: multipart/mixed; boundary="===============6019254680994154218=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/pata_amd.c:280:9: warning: Although the value stored to 'saved_udma' is used in the enclosing expression, the value is never actually read from 'saved_udma' [clang-analyzer-deadcode.DeadStores]
Date: Tue, 25 Jan 2022 08:26:28 +0800
Message-ID: <202201250743.p1jyEhJ8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6019254680994154218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.de>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 742bef476ca5352b16063161fb73a56629a6d995 ata: libata: move ata_{por=
t,link,dev}_dbg to standard pr_XXX() macros
date:   3 weeks ago
:::::: branch date: 31 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220125/202201250743.p1jyEhJ8-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D742bef476ca5352b16063161fb73a56629a6d995
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 742bef476ca5352b16063161fb73a56629a6d995
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/ata/pata_ali.c:126:10: warning: Although the value stored to 'ma=
sk' is used in the enclosing expression, the value is never actually read f=
rom 'mask' [clang-analyzer-deadcode.DeadStores]
                   return mask &=3D ~ATA_MASK_UDMA;
                          ^       ~~~~~~~~~~~~~~
   drivers/ata/pata_ali.c:126:10: note: Although the value stored to 'mask'=
 is used in the enclosing expression, the value is never actually read from=
 'mask'
                   return mask &=3D ~ATA_MASK_UDMA;
                          ^       ~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/ata/pata_amd.c:280:9: warning: Although the value stored to 'sav=
ed_udma' is used in the enclosing expression, the value is never actually r=
ead from 'saved_udma' [clang-analyzer-deadcode.DeadStores]
           udma =3D saved_udma =3D (unsigned long)ap->host->private_data;
                  ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_amd.c:280:9: note: Although the value stored to 'saved_=
udma' is used in the enclosing expression, the value is never actually read=
 from 'saved_udma'
           udma =3D saved_udma =3D (unsigned long)ap->host->private_data;
                  ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/input/joystick/a3d.c:94:44: warning: The left operand of '<<' is=
 a garbage value due to array index out of bounds [clang-analyzer-core.Unde=
finedBinaryOperatorResult]
           return (csum & 0x3f) !=3D ((data[count - 2] << 3) | data[count -=
 1]);
                                                     ^
   drivers/input/joystick/a3d.c:257:6: note: Assuming 'a3d' is non-null
           if (!a3d || !input_dev) {
               ^~~~
   drivers/input/joystick/a3d.c:257:6: note: Left side of '||' is false
   drivers/input/joystick/a3d.c:257:14: note: Assuming 'input_dev' is non-n=
ull
           if (!a3d || !input_dev) {
                       ^~~~~~~~~~
   drivers/input/joystick/a3d.c:257:2: note: Taking false branch

vim +280 drivers/ata/pata_amd.c

669a5db411d85a Jeff Garzik    2006-08-29  260  =

ce54d161630211 Tejun Heo      2007-12-18  261  /* Both host-side and drive-=
side detection results are worthless on NV
ce54d161630211 Tejun Heo      2007-12-18  262   * PATAs.  Ignore them and j=
ust follow what BIOS configured.  Both the
ce54d161630211 Tejun Heo      2007-12-18  263   * current configuration in =
PCI config reg and ACPI GTM result are
ce54d161630211 Tejun Heo      2007-12-18  264   * cached during driver atta=
ch and are consulted to select transfer
ce54d161630211 Tejun Heo      2007-12-18  265   * mode.
ce54d161630211 Tejun Heo      2007-12-18  266   */
ce54d161630211 Tejun Heo      2007-12-18  267  static unsigned long nv_mode=
_filter(struct ata_device *dev,
ce54d161630211 Tejun Heo      2007-12-18  268  				    unsigned long xfer_m=
ask)
ce54d161630211 Tejun Heo      2007-12-18  269  {
ce54d161630211 Tejun Heo      2007-12-18  270  	static const unsigned int u=
dma_mask_map[] =3D
ce54d161630211 Tejun Heo      2007-12-18  271  		{ ATA_UDMA2, ATA_UDMA1, AT=
A_UDMA0, 0,
ce54d161630211 Tejun Heo      2007-12-18  272  		  ATA_UDMA3, ATA_UDMA4, AT=
A_UDMA5, ATA_UDMA6 };
ce54d161630211 Tejun Heo      2007-12-18  273  	struct ata_port *ap =3D dev=
->link->ap;
ce54d161630211 Tejun Heo      2007-12-18  274  	char acpi_str[32] =3D "";
ce54d161630211 Tejun Heo      2007-12-18  275  	u32 saved_udma, udma;
ce54d161630211 Tejun Heo      2007-12-18  276  	const struct ata_acpi_gtm *=
gtm;
ce54d161630211 Tejun Heo      2007-12-18  277  	unsigned long bios_limit =
=3D 0, acpi_limit =3D 0, limit;
ce54d161630211 Tejun Heo      2007-12-18  278  =

ce54d161630211 Tejun Heo      2007-12-18  279  	/* find out what BIOS confi=
gured */
ce54d161630211 Tejun Heo      2007-12-18 @280  	udma =3D saved_udma =3D (un=
signed long)ap->host->private_data;
ce54d161630211 Tejun Heo      2007-12-18  281  =

ce54d161630211 Tejun Heo      2007-12-18  282  	if (ap->port_no =3D=3D 0)
ce54d161630211 Tejun Heo      2007-12-18  283  		udma >>=3D 16;
ce54d161630211 Tejun Heo      2007-12-18  284  	if (dev->devno =3D=3D 0)
ce54d161630211 Tejun Heo      2007-12-18  285  		udma >>=3D 8;
ce54d161630211 Tejun Heo      2007-12-18  286  =

ce54d161630211 Tejun Heo      2007-12-18  287  	if ((udma & 0xc0) =3D=3D 0x=
c0)
ce54d161630211 Tejun Heo      2007-12-18  288  		bios_limit =3D ata_pack_xf=
ermask(0, 0, udma_mask_map[udma & 0x7]);
ce54d161630211 Tejun Heo      2007-12-18  289  =

ce54d161630211 Tejun Heo      2007-12-18  290  	/* consult ACPI GTM too */
ce54d161630211 Tejun Heo      2007-12-18  291  	gtm =3D ata_acpi_init_gtm(a=
p);
ce54d161630211 Tejun Heo      2007-12-18  292  	if (gtm) {
ce54d161630211 Tejun Heo      2007-12-18  293  		acpi_limit =3D ata_acpi_gt=
m_xfermask(dev, gtm);
ce54d161630211 Tejun Heo      2007-12-18  294  =

ce54d161630211 Tejun Heo      2007-12-18  295  		snprintf(acpi_str, sizeof(=
acpi_str), " (%u:%u:0x%x)",
ce54d161630211 Tejun Heo      2007-12-18  296  			 gtm->drive[0].dma, gtm->=
drive[1].dma, gtm->flags);
ce54d161630211 Tejun Heo      2007-12-18  297  	}
ce54d161630211 Tejun Heo      2007-12-18  298  =

ce54d161630211 Tejun Heo      2007-12-18  299  	/* be optimistic, EH can ta=
ke care of things if something goes wrong */
ce54d161630211 Tejun Heo      2007-12-18  300  	limit =3D bios_limit | acpi=
_limit;
ce54d161630211 Tejun Heo      2007-12-18  301  =

ce54d161630211 Tejun Heo      2007-12-18  302  	/* If PIO or DMA isn't conf=
igured at all, don't limit.  Let EH
ce54d161630211 Tejun Heo      2007-12-18  303  	 * handle it.
ce54d161630211 Tejun Heo      2007-12-18  304  	 */
ce54d161630211 Tejun Heo      2007-12-18  305  	if (!(limit & ATA_MASK_PIO))
ce54d161630211 Tejun Heo      2007-12-18  306  		limit |=3D ATA_MASK_PIO;
ce54d161630211 Tejun Heo      2007-12-18  307  	if (!(limit & (ATA_MASK_MWD=
MA | ATA_MASK_UDMA)))
ce54d161630211 Tejun Heo      2007-12-18  308  		limit |=3D ATA_MASK_MWDMA =
| ATA_MASK_UDMA;
90950a2504b66d Robert Hancock 2009-09-12  309  	/* PIO4, MWDMA2, UDMA2 shou=
ld always be supported regardless of
90950a2504b66d Robert Hancock 2009-09-12  310  	   cable detection result */
90950a2504b66d Robert Hancock 2009-09-12  311  	limit |=3D ata_pack_xfermas=
k(ATA_PIO4, ATA_MWDMA2, ATA_UDMA2);
ce54d161630211 Tejun Heo      2007-12-18  312  =

a9a79dfec23956 Joe Perches    2011-04-15  313  	ata_port_dbg(ap, "nv_mode_f=
ilter: 0x%lx&0x%lx->0x%lx, "
ce54d161630211 Tejun Heo      2007-12-18  314  			"BIOS=3D0x%lx (0x%x) ACPI=
=3D0x%lx%s\n",
ce54d161630211 Tejun Heo      2007-12-18  315  			xfer_mask, limit, xfer_ma=
sk & limit, bios_limit,
ce54d161630211 Tejun Heo      2007-12-18  316  			saved_udma, acpi_limit, a=
cpi_str);
ce54d161630211 Tejun Heo      2007-12-18  317  =

ce54d161630211 Tejun Heo      2007-12-18  318  	return xfer_mask & limit;
ce54d161630211 Tejun Heo      2007-12-18  319  }
669a5db411d85a Jeff Garzik    2006-08-29  320  =


:::::: The code at line 280 was first introduced by commit
:::::: ce54d1616302117fa98513ae916bb3333e1c02ea pata_amd: update mode selec=
tion for NV PATAs

:::::: TO: Tejun Heo <htejun@gmail.com>
:::::: CC: Jeff Garzik <jeff@garzik.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6019254680994154218==--

