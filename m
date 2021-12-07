Content-Type: multipart/mixed; boundary="===============8716644346754230048=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [freescale-fslc:5.10-2.1.x-imx 13135/15840] drivers/rpmsg/rpmsg_ctrl.c:82:13: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Tue, 07 Dec 2021 08:10:32 +0800
Message-ID: <202112070821.pBzj5kSZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8716644346754230048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Otavio Salvador <otavio@ossystems.com.br>

tree:   https://github.com/Freescale/linux-fslc 5.10-2.1.x-imx
head:   c0604ebbd45934a2c42df8382b674244d1963fa2
commit: 8b42bbc1841708fb512b5696fa2624a187c08185 [13135/15840] rpmsg: Move =
the rpmsg control device from rpmsg_char to rpmsg_ctrl
:::::: branch date: 5 days ago
:::::: commit date: 4 months ago
config: mips-randconfig-c004-20211203 (https://download.01.org/0day-ci/arch=
ive/20211207/202112070821.pBzj5kSZ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d18=
54eb1450d352663ee732235893c5782237)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/Freescale/linux-fslc/commit/8b42bbc1841708fb51=
2b5696fa2624a187c08185
        git remote add freescale-fslc https://github.com/Freescale/linux-fs=
lc
        git fetch --no-tags freescale-fslc 5.10-2.1.x-imx
        git checkout 8b42bbc1841708fb512b5696fa2624a187c08185
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/utimes.c:207:1: note: Calling '__do_sys_utimes'
   SYSCALL_DEFINE2(utimes, char __user *, filename,
   ^
   include/linux/syscalls.h:214:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:224:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:245:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/utimes.c:210:9: note: Calling 'do_futimesat'
           return do_futimesat(AT_FDCWD, filename, utimes);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/utimes.c:178:6: note: Assuming 'utimes' is non-null
           if (utimes) {
               ^~~~~~
   fs/utimes.c:178:2: note: Taking true branch
           if (utimes) {
           ^
   fs/utimes.c:179:7: note: Calling 'copy_from_user'
                   if (copy_from_user(&times, utimes, sizeof(times)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/uaccess.h:157:33: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:616:2: note: Taking false branch
           if (eva_kernel_access())
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
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
   fs/utimes.c:179:7: note: Returning from 'copy_from_user'
                   if (copy_from_user(&times, utimes, sizeof(times)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/utimes.c:179:3: note: Taking false branch
                   if (copy_from_user(&times, utimes, sizeof(times)))
                   ^
   fs/utimes.c:187:24: note: The left operand of '>=3D' is a garbage value
                   if (times[0].tv_usec >=3D 1000000 || times[0].tv_usec < =
0 ||
                       ~~~~~~~~~~~~~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/rpmsg/rpmsg_ctrl.c:82:13: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
           chinfo.src =3D eptinfo.src;
                      ^ ~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:74:13: note: Left side of '&&' is true
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
                      ^
   include/uapi/linux/rpmsg.h:29:32: note: expanded from macro 'RPMSG_CREAT=
E_EPT_IOCTL'
   #define RPMSG_CREATE_EPT_IOCTL  _IOW(0xb5, 0x1, struct rpmsg_endpoint_in=
fo)
                                   ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECH=
ECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
             ^
   drivers/rpmsg/rpmsg_ctrl.c:74:13: note: '?' condition is true
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
                      ^
   include/uapi/linux/rpmsg.h:29:32: note: expanded from macro 'RPMSG_CREAT=
E_EPT_IOCTL'
   #define RPMSG_CREATE_EPT_IOCTL  _IOW(0xb5, 0x1, struct rpmsg_endpoint_in=
fo)
                                   ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECH=
ECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:3: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
            ^
   drivers/rpmsg/rpmsg_ctrl.c:74:6: note: Assuming the condition is false
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:74:2: note: Taking false branch
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
           ^
   drivers/rpmsg/rpmsg_ctrl.c:77:6: note: Calling 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/uaccess.h:157:33: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:616:2: note: Taking false branch
           if (eva_kernel_access())
           ^
   arch/mips/include/asm/uaccess.h:619:3: note: Returning without writing t=
o 'to->src'
                   return __invoke_copy_from_user(to, from, n);
                   ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->s=
rc'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->s=
rc'
           return n;

vim +82 drivers/rpmsg/rpmsg_ctrl.c

8b42bbc1841708 Arnaud Pouliquen 2021-05-17  65  =

8b42bbc1841708 Arnaud Pouliquen 2021-05-17  66  static long rpmsg_ctrldev_i=
octl(struct file *fp, unsigned int cmd,
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  67  				unsigned long arg)
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  68  {
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  69  	struct rpmsg_ctrldev *ctrl=
dev =3D fp->private_data;
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  70  	void __user *argp =3D (voi=
d __user *)arg;
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  71  	struct rpmsg_endpoint_info=
 eptinfo;
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  72  	struct rpmsg_channel_info =
chinfo;
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  73  =

8b42bbc1841708 Arnaud Pouliquen 2021-05-17  74  	if (cmd !=3D RPMSG_CREATE_=
EPT_IOCTL)
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  75  		return -EINVAL;
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  76  =

8b42bbc1841708 Arnaud Pouliquen 2021-05-17  77  	if (copy_from_user(&eptinf=
o, argp, sizeof(eptinfo)))
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  78  		return -EFAULT;
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  79  =

8b42bbc1841708 Arnaud Pouliquen 2021-05-17  80  	memcpy(chinfo.name, eptinf=
o.name, RPMSG_NAME_SIZE);
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  81  	chinfo.name[RPMSG_NAME_SIZ=
E - 1] =3D '\0';
8b42bbc1841708 Arnaud Pouliquen 2021-05-17 @82  	chinfo.src =3D eptinfo.src;
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  83  	chinfo.dst =3D eptinfo.dst;
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  84  =

8b42bbc1841708 Arnaud Pouliquen 2021-05-17  85  	return rpmsg_chrdev_eptdev=
_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  86  };
8b42bbc1841708 Arnaud Pouliquen 2021-05-17  87  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8716644346754230048==--

