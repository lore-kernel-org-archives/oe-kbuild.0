Content-Type: multipart/mixed; boundary="===============8691880237222108576=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/s390/boot/startup.c:300 startup_kernel() error: uninitialized symbol 'img'.
Date: Tue, 15 Feb 2022 17:10:59 +0800
Message-ID: <202202151705.VvdfFQH4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8691880237222108576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d567f5db412ed52de0b3b3efca4a451263de6108
commit: e8f06683d40e705da2d85bc6bc498e651d1ef31b s390/boot: factor out offs=
et_vmlinux_info() function
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: s390-randconfig-m031-20220214 (https://download.01.org/0day-ci/arch=
ive/20220215/202202151705.VvdfFQH4-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/s390/boot/startup.c:300 startup_kernel() error: uninitialized symbol '=
img'.

vim +/img +300 arch/s390/boot/startup.c

e8f06683d40e70 Alexander Gordeev   2021-08-06  261  =

8f75582a2fb6e2 Vasily Gorbik       2018-07-19  262  void startup_kernel(voi=
d)
8f75582a2fb6e2 Vasily Gorbik       2018-07-19  263  {
b2d24b97b2a969 Gerald Schaefer     2019-02-03  264  	unsigned long random_l=
ma;
9641b8cc733f70 Martin Schwidefsky  2019-02-21  265  	unsigned long safe_add=
r;
369f91c374514f Vasily Gorbik       2018-07-19  266  	void *img;
8f75582a2fb6e2 Vasily Gorbik       2018-07-19  267  =

84733284f67b1a Alexander Egorenkov 2021-06-15  268  	initrd_data.start =3D =
parmarea.initrd_start;
84733284f67b1a Alexander Egorenkov 2021-06-15  269  	initrd_data.size =3D p=
armarea.initrd_size;
e9e7870f90e358 Alexander Egorenkov 2021-06-15  270  	oldmem_data.start =3D =
parmarea.oldmem_base;
e9e7870f90e358 Alexander Egorenkov 2021-06-15  271  	oldmem_data.size =3D p=
armarea.oldmem_size;
84733284f67b1a Alexander Egorenkov 2021-06-15  272  =

d7e7fbba67a32a Vasily Gorbik       2020-10-09  273  	setup_lpp();
9641b8cc733f70 Martin Schwidefsky  2019-02-21  274  	store_ipl_parmblock();
9641b8cc733f70 Martin Schwidefsky  2019-02-21  275  	safe_addr =3D mem_safe=
_offset();
9641b8cc733f70 Martin Schwidefsky  2019-02-21  276  	safe_addr =3D read_ipl=
_report(safe_addr);
5abb9351dfd937 Vasily Gorbik       2019-04-01  277  	uv_query_info();
9641b8cc733f70 Martin Schwidefsky  2019-02-21  278  	rescue_initrd(safe_add=
r);
17aacfbfa1ae38 Vasily Gorbik       2018-05-23  279  	sclp_early_read_info();
49698745e53c41 Vasily Gorbik       2018-05-15  280  	setup_boot_command_lin=
e();
b5e804598d5949 Vasily Gorbik       2019-02-27  281  	parse_boot_command_lin=
e();
42c89439b9fa03 Alexander Egorenkov 2021-07-05  282  	sanitize_prot_virt_hos=
t();
73045a08cf5549 Vasily Gorbik       2020-10-19  283  	setup_ident_map_size(d=
etect_memory());
90178c19007986 Heiko Carstens      2020-09-18  284  	setup_vmalloc_size();
0c4f2623b95779 Vasily Gorbik       2020-10-06  285  	setup_kernel_memory_la=
yout();
b2d24b97b2a969 Gerald Schaefer     2019-02-03  286  =

b2d24b97b2a969 Gerald Schaefer     2019-02-03  287  	if (IS_ENABLED(CONFIG_=
RANDOMIZE_BASE) && kaslr_enabled) {
b2d24b97b2a969 Gerald Schaefer     2019-02-03  288  		random_lma =3D get_ra=
ndom_base(safe_addr);
b2d24b97b2a969 Gerald Schaefer     2019-02-03  289  		if (random_lma) {
b2d24b97b2a969 Gerald Schaefer     2019-02-03  290  			__kaslr_offset =3D r=
andom_lma - vmlinux.default_lma;
b2d24b97b2a969 Gerald Schaefer     2019-02-03  291  			img =3D (void *)vmli=
nux.default_lma;
e8f06683d40e70 Alexander Gordeev   2021-08-06  292  			offset_vmlinux_info(=
__kaslr_offset);
b2d24b97b2a969 Gerald Schaefer     2019-02-03  293  		}
b2d24b97b2a969 Gerald Schaefer     2019-02-03  294  	}
b2d24b97b2a969 Gerald Schaefer     2019-02-03  295  =

8f75582a2fb6e2 Vasily Gorbik       2018-07-19  296  	if (!IS_ENABLED(CONFIG=
_KERNEL_UNCOMPRESSED)) {
369f91c374514f Vasily Gorbik       2018-07-19  297  		img =3D decompress_ke=
rnel();
369f91c374514f Vasily Gorbik       2018-07-19  298  		memmove((void *)vmlin=
ux.default_lma, img, vmlinux.image_size);
b2d24b97b2a969 Gerald Schaefer     2019-02-03  299  	} else if (__kaslr_off=
set)
b2d24b97b2a969 Gerald Schaefer     2019-02-03 @300  		memcpy((void *)vmlinu=
x.default_lma, img, vmlinux.image_size);

:::::: The code at line 300 was first introduced by commit
:::::: b2d24b97b2a9691351920e700bfda4368c177232 s390/kernel: add support fo=
r kernel address space layout randomization (KASLR)

:::::: TO: Gerald Schaefer <gerald.schaefer@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8691880237222108576==--

