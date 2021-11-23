Content-Type: multipart/mixed; boundary="===============2565510823484525612=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/csky/include/asm/uaccess.h:202 __get_user_fn() error: uninitialized symbol 'retval'.
Date: Wed, 24 Nov 2021 06:09:32 +0800
Message-ID: <202111240603.fOcKJDNK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2565510823484525612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Guo Ren <guoren@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   136057256686de39cc3a07c2e39ef6bc43003ff6
commit: e58a41c2226847fb1446f3942dc1b55af8acfe02 csky: uaccess.h: Coding co=
nvention with asm generic
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: csky-randconfig-m031-20211123 (https://download.01.org/0day-ci/arch=
ive/20211124/202111240603.fOcKJDNK-lkp(a)intel.com/config.gz)
compiler: csky-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/csky/include/asm/uaccess.h:202 __get_user_fn() error: uninitialized sy=
mbol 'retval'.
arch/csky/kernel/signal.c:146 setup_rt_frame() warn: ignoring unreachable c=
ode.
arch/csky/include/asm/uaccess.h:202 __get_user_fn() error: uninitialized sy=
mbol 'retval'.
arch/csky/include/asm/uaccess.h:202 __get_user_fn() error: uninitialized sy=
mbol 'retval'.

Old smatch warnings:
lib/test_user_copy.c:240 test_user_copy_init() warn: ignoring unreachable c=
ode.
lib/test_user_copy.c:241 test_user_copy_init() warn: ignoring unreachable c=
ode.
lib/test_user_copy.c:243 test_user_copy_init() warn: ignoring unreachable c=
ode.

vim +/retval +202 arch/csky/include/asm/uaccess.h

da551281947cb2c Guo Ren 2018-09-05  178  =

e58a41c2226847f Guo Ren 2021-04-21  179  static inline int __get_user_fn(si=
ze_t size, const void __user *ptr, void *x)
e58a41c2226847f Guo Ren 2021-04-21  180  {
e58a41c2226847f Guo Ren 2021-04-21  181  	int retval;
e58a41c2226847f Guo Ren 2021-04-21  182  	u32 tmp;
e58a41c2226847f Guo Ren 2021-04-21  183  =

e58a41c2226847f Guo Ren 2021-04-21  184  	switch (size) {
e58a41c2226847f Guo Ren 2021-04-21  185  	case 1:
e58a41c2226847f Guo Ren 2021-04-21  186  		__get_user_asm_common(tmp, ptr, =
"ldb", retval);
e58a41c2226847f Guo Ren 2021-04-21  187  		*(u8 *)x =3D (u8)tmp;
e58a41c2226847f Guo Ren 2021-04-21  188  		break;
e58a41c2226847f Guo Ren 2021-04-21  189  	case 2:
e58a41c2226847f Guo Ren 2021-04-21  190  		__get_user_asm_common(tmp, ptr, =
"ldh", retval);
e58a41c2226847f Guo Ren 2021-04-21  191  		*(u16 *)x =3D (u16)tmp;
e58a41c2226847f Guo Ren 2021-04-21  192  		break;
e58a41c2226847f Guo Ren 2021-04-21  193  	case 4:
e58a41c2226847f Guo Ren 2021-04-21  194  		__get_user_asm_common(tmp, ptr, =
"ldw", retval);
e58a41c2226847f Guo Ren 2021-04-21  195  		*(u32 *)x =3D (u32)tmp;
e58a41c2226847f Guo Ren 2021-04-21  196  		break;
e58a41c2226847f Guo Ren 2021-04-21  197  	case 8:
e58a41c2226847f Guo Ren 2021-04-21  198  		__get_user_asm_64(x, ptr, retval=
);
e58a41c2226847f Guo Ren 2021-04-21  199  		break;
e58a41c2226847f Guo Ren 2021-04-21  200  	}
e58a41c2226847f Guo Ren 2021-04-21  201  =

e58a41c2226847f Guo Ren 2021-04-21 @202  	return retval;
e58a41c2226847f Guo Ren 2021-04-21  203  }
e58a41c2226847f Guo Ren 2021-04-21  204  #define __get_user_fn __get_user_fn
e58a41c2226847f Guo Ren 2021-04-21  205  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2565510823484525612==--

