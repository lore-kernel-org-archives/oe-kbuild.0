Content-Type: multipart/mixed; boundary="===============0856363496238570941=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/include/asm/uaccess.h:574:2: warning: Null pointer passed as 1st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Sun, 27 Feb 2022 16:19:10 +0800
Message-ID: <202202271656.XF2nVU77-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0856363496238570941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Micha=C5=82 K=C4=99pie=C5=84" <kernel@kempniu.pl>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2293be58d6a18cab800e25e42081bacb75c05752
commit: 6420ac0af95dbcb2fd8452e2d551ab50e1bbad83 mtdchar: prevent unbounded=
 allocation in MEMWRITE ioctl
date:   3 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220227 (https://download.01.org/0day-ci/archi=
ve/20220227/202202271656.XF2nVU77-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6420ac0af95dbcb2fd8452e2d551ab50e1bbad83
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6420ac0af95dbcb2fd8452e2d551ab50e1bbad83
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/input/joystick/sidewinder.c:720:2: warning: Value stored to 'k' =
is never read [clang-analyzer-deadcode.DeadStores]
           k =3D i;
           ^   ~
   drivers/input/joystick/sidewinder.c:720:2: note: Value stored to 'k' is =
never read
           k =3D i;
           ^   ~
   drivers/input/joystick/sidewinder.c:721:2: warning: Value stored to 'l' =
is never read [clang-analyzer-deadcode.DeadStores]
           l =3D j;
           ^   ~
   drivers/input/joystick/sidewinder.c:721:2: note: Value stored to 'l' is =
never read
           l =3D j;
           ^   ~
   1 warning generated.
   drivers/input/touchscreen/ad7877.c:142:8: warning: Excessive padding in =
'struct ser_req' (32 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   sample, =

   reset, =

   msg, =

   xfer, =

   ref_on, =

   command, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ser_req {
   ~~~~~~~^~~~~~~~~
   drivers/input/touchscreen/ad7877.c:142:8: note: Excessive padding in 'st=
ruct ser_req' (32 padding bytes, where 0 is optimal). Optimal fields order:=
 sample, reset, msg, xfer, ref_on, command, consider reordering the fields =
or adding explicit padding members
   struct ser_req {
   ~~~~~~~^~~~~~~~~
   3 warnings generated.
   drivers/input/touchscreen/ads7846.c:329:8: warning: Excessive padding in=
 'struct ser_req' (33 padding bytes, where 1 is optimal). =

   Optimal fields order: =

   sample, =

   scratch, =

   msg, =

   xfer, =

   ref_on, =

   command, =

   ref_off, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ser_req {
   ~~~~~~~^~~~~~~~~
   drivers/input/touchscreen/ads7846.c:329:8: note: Excessive padding in 's=
truct ser_req' (33 padding bytes, where 1 is optimal). Optimal fields order=
: sample, scratch, msg, xfer, ref_on, command, ref_off, consider reordering=
 the fields or adding explicit padding members
   struct ser_req {
   ~~~~~~~^~~~~~~~~
   drivers/input/touchscreen/ads7846.c:343:8: warning: Excessive padding in=
 'struct ads7845_ser_req' (34 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   sample, =

   command, =

   msg, =

   xfer, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ads7845_ser_req {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/ads7846.c:343:8: note: Excessive padding in 's=
truct ads7845_ser_req' (34 padding bytes, where 2 is optimal). Optimal fiel=
ds order: sample, command, msg, xfer, consider reordering the fields or add=
ing explicit padding members
   struct ads7845_ser_req {
   ~~~~~~~^~~~~~~~~~~~~~~~~
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
   2 warnings generated.
   drivers/mtd/mtdcore.c:660:3: warning: Value stored to 'error' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   error =3D 0;
                   ^       ~
   drivers/mtd/mtdcore.c:660:3: note: Value stored to 'error' is never read
                   error =3D 0;
                   ^       ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mtd/mtdconcat.c:67:4: warning: Value stored to 'size' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:67:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:159:4: warning: Value stored to 'size' is never =
read [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:159:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:492:4: warning: Value stored to 'size' is never =
read [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:492:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> arch/arm/include/asm/uaccess.h:574:2: warning: Null pointer passed as 1s=
t argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(to, (const void __force *)from, n);
           ^
   drivers/mtd/mtdchar.c:697:2: note: Taking false branch
           pr_debug("MTD_ioctl\n");
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/mtd/mtdchar.c:697:2: note: Loop condition is false.  Exiting loop
           pr_debug("MTD_ioctl\n");
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/mtd/mtdchar.c:703:2: note: Control jumps to 'case 3224390936:'  =
at line 731
           switch (cmd) {
           ^
   drivers/mtd/mtdchar.c:734:7: note: Assuming the condition is false
                   if (!(file->f_mode & FMODE_WRITE))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtdchar.c:734:3: note: Taking false branch
                   if (!(file->f_mode & FMODE_WRITE))
                   ^
   drivers/mtd/mtdchar.c:736:3: note:  Execution continues on line 742
                   break;
                   ^
   drivers/mtd/mtdchar.c:742:2: note: Control jumps to 'case 3224390936:'  =
at line 877
           switch (cmd) {
           ^
   drivers/mtd/mtdchar.c:879:9: note: Calling 'mtdchar_write_ioctl'
                   ret =3D mtdchar_write_ioctl(mtd,
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtdchar.c:599:11: note: 'datbuf' initialized to a null point=
er value
           uint8_t *datbuf =3D NULL, *oobbuf =3D NULL;
                    ^~~~~~
   drivers/mtd/mtdchar.c:603:6: note: Calling 'copy_from_user'
           if (copy_from_user(&req, argp, sizeof(req)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:575:2: note: Returning zero, which partic=
ipates in a condition later
           return 0;
           ^~~~~~~~
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   drivers/mtd/mtdchar.c:603:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&req, argp, sizeof(req)))

vim +574 arch/arm/include/asm/uaccess.h

3fba7e23f754a9a arch/arm/include/asm/uaccess.h Russell King   2015-08-19  5=
69  =

9641c7cc5a7f6d5 include/asm-arm/uaccess.h      Russell King   2006-06-21  5=
70  #else
4de5b63e76b2e67 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  5=
71  static inline unsigned long
4de5b63e76b2e67 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  5=
72  raw_copy_from_user(void *to, const void __user *from, unsigned long n)
32b143637e8180f arch/arm/include/asm/uaccess.h Kees Cook      2017-02-16  5=
73  {
4de5b63e76b2e67 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21 @5=
74  	memcpy(to, (const void __force *)from, n);
4de5b63e76b2e67 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  5=
75  	return 0;
32b143637e8180f arch/arm/include/asm/uaccess.h Kees Cook      2017-02-16  5=
76  }
4de5b63e76b2e67 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  5=
77  static inline unsigned long
4de5b63e76b2e67 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  5=
78  raw_copy_to_user(void __user *to, const void *from, unsigned long n)
32b143637e8180f arch/arm/include/asm/uaccess.h Kees Cook      2017-02-16  5=
79  {
4de5b63e76b2e67 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  5=
80  	memcpy((void __force *)to, from, n);
4de5b63e76b2e67 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  5=
81  	return 0;
^1da177e4c3f415 include/asm-arm/uaccess.h      Linus Torvalds 2005-04-16  5=
82  }
4de5b63e76b2e67 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  5=
83  #define __clear_user(addr, n)		(memset((void __force *)addr, 0, n), 0)
4de5b63e76b2e67 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  5=
84  #endif
4de5b63e76b2e67 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  5=
85  #define INLINE_COPY_TO_USER
4de5b63e76b2e67 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  5=
86  #define INLINE_COPY_FROM_USER
^1da177e4c3f415 include/asm-arm/uaccess.h      Linus Torvalds 2005-04-16  5=
87  =


:::::: The code at line 574 was first introduced by commit
:::::: 4de5b63e76b2e672478e49622dabe2666b7f727f arm: switch to RAW_COPY_USER

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0856363496238570941==--

