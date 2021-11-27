Content-Type: multipart/mixed; boundary="===============6565744015790086336=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm64/kernel/machine_kexec_file.c:152 load_other_segments() warn: missing error code 'ret'
Date: Sun, 28 Nov 2021 04:07:22 +0800
Message-ID: <202111280304.FL2314qf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6565744015790086336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rob Herring <robh@kernel.org>
CC: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
CC: Thiago Jung Bauermann <bauerman@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: ac10be5cdbfa852139658d52c2f1c608782ce992 arm64: Use common of_kexec=
_alloc_and_setup_fdt()
date:   9 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-m031-20211127 (https://download.01.org/0day-ci/arc=
hive/20211128/202111280304.FL2314qf-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/arm64/kernel/machine_kexec_file.c:152 load_other_segments() warn: miss=
ing error code 'ret'

vim +/ret +152 arch/arm64/kernel/machine_kexec_file.c

3751e728cef290 AKASHI Takahiro         2019-12-16   75  =

108aa503657ee2 Benjamin Gwin           2020-11-03   76  /*
108aa503657ee2 Benjamin Gwin           2020-11-03   77   * Tries to add the=
 initrd and DTB to the image. If it is not possible to find
108aa503657ee2 Benjamin Gwin           2020-11-03   78   * valid locations,=
 this function will undo changes to the image and return non
108aa503657ee2 Benjamin Gwin           2020-11-03   79   * zero.
108aa503657ee2 Benjamin Gwin           2020-11-03   80   */
52b2a8af743604 AKASHI Takahiro         2018-11-15   81  int load_other_segm=
ents(struct kimage *image,
52b2a8af743604 AKASHI Takahiro         2018-11-15   82  			unsigned long ke=
rnel_load_addr,
52b2a8af743604 AKASHI Takahiro         2018-11-15   83  			unsigned long ke=
rnel_size,
52b2a8af743604 AKASHI Takahiro         2018-11-15   84  			char *initrd, un=
signed long initrd_len,
52b2a8af743604 AKASHI Takahiro         2018-11-15   85  			char *cmdline)
52b2a8af743604 AKASHI Takahiro         2018-11-15   86  {
52b2a8af743604 AKASHI Takahiro         2018-11-15   87  	struct kexec_buf k=
buf;
3751e728cef290 AKASHI Takahiro         2019-12-16   88  	void *headers, *dt=
b =3D NULL;
108aa503657ee2 Benjamin Gwin           2020-11-03   89  	unsigned long head=
ers_sz, initrd_load_addr =3D 0, dtb_len,
108aa503657ee2 Benjamin Gwin           2020-11-03   90  		      orig_segmen=
ts =3D image->nr_segments;
52b2a8af743604 AKASHI Takahiro         2018-11-15   91  	int ret =3D 0;
52b2a8af743604 AKASHI Takahiro         2018-11-15   92  =

52b2a8af743604 AKASHI Takahiro         2018-11-15   93  	kbuf.image =3D ima=
ge;
52b2a8af743604 AKASHI Takahiro         2018-11-15   94  	/* not allocate an=
ything below the kernel */
52b2a8af743604 AKASHI Takahiro         2018-11-15   95  	kbuf.buf_min =3D k=
ernel_load_addr + kernel_size;
52b2a8af743604 AKASHI Takahiro         2018-11-15   96  =

3751e728cef290 AKASHI Takahiro         2019-12-16   97  	/* load elf core h=
eader */
3751e728cef290 AKASHI Takahiro         2019-12-16   98  	if (image->type =
=3D=3D KEXEC_TYPE_CRASH) {
3751e728cef290 AKASHI Takahiro         2019-12-16   99  		ret =3D prepare_e=
lf_headers(&headers, &headers_sz);
3751e728cef290 AKASHI Takahiro         2019-12-16  100  		if (ret) {
3751e728cef290 AKASHI Takahiro         2019-12-16  101  			pr_err("Preparin=
g elf core header failed\n");
3751e728cef290 AKASHI Takahiro         2019-12-16  102  			goto out_err;
3751e728cef290 AKASHI Takahiro         2019-12-16  103  		}
3751e728cef290 AKASHI Takahiro         2019-12-16  104  =

3751e728cef290 AKASHI Takahiro         2019-12-16  105  		kbuf.buffer =3D h=
eaders;
3751e728cef290 AKASHI Takahiro         2019-12-16  106  		kbuf.bufsz =3D he=
aders_sz;
3751e728cef290 AKASHI Takahiro         2019-12-16  107  		kbuf.mem =3D KEXE=
C_BUF_MEM_UNKNOWN;
3751e728cef290 AKASHI Takahiro         2019-12-16  108  		kbuf.memsz =3D he=
aders_sz;
3751e728cef290 AKASHI Takahiro         2019-12-16  109  		kbuf.buf_align =
=3D SZ_64K; /* largest supported page size */
3751e728cef290 AKASHI Takahiro         2019-12-16  110  		kbuf.buf_max =3D =
ULONG_MAX;
3751e728cef290 AKASHI Takahiro         2019-12-16  111  		kbuf.top_down =3D=
 true;
3751e728cef290 AKASHI Takahiro         2019-12-16  112  =

3751e728cef290 AKASHI Takahiro         2019-12-16  113  		ret =3D kexec_add=
_buffer(&kbuf);
3751e728cef290 AKASHI Takahiro         2019-12-16  114  		if (ret) {
3751e728cef290 AKASHI Takahiro         2019-12-16  115  			vfree(headers);
3751e728cef290 AKASHI Takahiro         2019-12-16  116  			goto out_err;
3751e728cef290 AKASHI Takahiro         2019-12-16  117  		}
7b558cc3564e6c Lakshmi Ramasubramanian 2021-02-21  118  		image->elf_header=
s =3D headers;
7b558cc3564e6c Lakshmi Ramasubramanian 2021-02-21  119  		image->elf_load_a=
ddr =3D kbuf.mem;
7b558cc3564e6c Lakshmi Ramasubramanian 2021-02-21  120  		image->elf_header=
s_sz =3D headers_sz;
3751e728cef290 AKASHI Takahiro         2019-12-16  121  =

3751e728cef290 AKASHI Takahiro         2019-12-16  122  		pr_debug("Loaded =
elf core header at 0x%lx bufsz=3D0x%lx memsz=3D0x%lx\n",
7b558cc3564e6c Lakshmi Ramasubramanian 2021-02-21  123  			 image->elf_load=
_addr, kbuf.bufsz, kbuf.memsz);
3751e728cef290 AKASHI Takahiro         2019-12-16  124  	}
3751e728cef290 AKASHI Takahiro         2019-12-16  125  =

52b2a8af743604 AKASHI Takahiro         2018-11-15  126  	/* load initrd */
52b2a8af743604 AKASHI Takahiro         2018-11-15  127  	if (initrd) {
52b2a8af743604 AKASHI Takahiro         2018-11-15  128  		kbuf.buffer =3D i=
nitrd;
52b2a8af743604 AKASHI Takahiro         2018-11-15  129  		kbuf.bufsz =3D in=
itrd_len;
c19d050f808812 Bhupesh Sharma          2019-07-11  130  		kbuf.mem =3D KEXE=
C_BUF_MEM_UNKNOWN;
52b2a8af743604 AKASHI Takahiro         2018-11-15  131  		kbuf.memsz =3D in=
itrd_len;
52b2a8af743604 AKASHI Takahiro         2018-11-15  132  		kbuf.buf_align =
=3D 0;
52b2a8af743604 AKASHI Takahiro         2018-11-15  133  		/* within 1GB-ali=
gned window of up to 32GB in size */
52b2a8af743604 AKASHI Takahiro         2018-11-15  134  		kbuf.buf_max =3D =
round_down(kernel_load_addr, SZ_1G)
52b2a8af743604 AKASHI Takahiro         2018-11-15  135  						+ (unsigned l=
ong)SZ_1G * 32;
52b2a8af743604 AKASHI Takahiro         2018-11-15  136  		kbuf.top_down =3D=
 false;
52b2a8af743604 AKASHI Takahiro         2018-11-15  137  =

52b2a8af743604 AKASHI Takahiro         2018-11-15  138  		ret =3D kexec_add=
_buffer(&kbuf);
52b2a8af743604 AKASHI Takahiro         2018-11-15  139  		if (ret)
52b2a8af743604 AKASHI Takahiro         2018-11-15  140  			goto out_err;
52b2a8af743604 AKASHI Takahiro         2018-11-15  141  		initrd_load_addr =
=3D kbuf.mem;
52b2a8af743604 AKASHI Takahiro         2018-11-15  142  =

52b2a8af743604 AKASHI Takahiro         2018-11-15  143  		pr_debug("Loaded =
initrd at 0x%lx bufsz=3D0x%lx memsz=3D0x%lx\n",
51075e0cb759a7 =C5=81ukasz Stelmach         2020-04-30  144  				initrd_loa=
d_addr, kbuf.bufsz, kbuf.memsz);
52b2a8af743604 AKASHI Takahiro         2018-11-15  145  	}
52b2a8af743604 AKASHI Takahiro         2018-11-15  146  =

52b2a8af743604 AKASHI Takahiro         2018-11-15  147  	/* load dtb */
ac10be5cdbfa85 Rob Herring             2021-02-21  148  	dtb =3D of_kexec_a=
lloc_and_setup_fdt(image, initrd_load_addr,
ac10be5cdbfa85 Rob Herring             2021-02-21  149  					   initrd_len,=
 cmdline, 0);
ac10be5cdbfa85 Rob Herring             2021-02-21  150  	if (!dtb) {
52b2a8af743604 AKASHI Takahiro         2018-11-15  151  		pr_err("Preparing=
 for new dtb failed\n");
52b2a8af743604 AKASHI Takahiro         2018-11-15 @152  		goto out_err;

:::::: The code at line 152 was first introduced by commit
:::::: 52b2a8af7436044cfcb27e4b0f72c2ce1f3890da arm64: kexec_file: load ini=
trd and device-tree

:::::: TO: AKASHI Takahiro <takahiro.akashi@linaro.org>
:::::: CC: Will Deacon <will.deacon@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6565744015790086336==--

