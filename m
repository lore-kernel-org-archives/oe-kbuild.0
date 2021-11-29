Content-Type: multipart/mixed; boundary="===============9110064179555422056=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/compat.c:444:5: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Tue, 30 Nov 2021 04:32:54 +0800
Message-ID: <202111300429.yXuxMpIr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9110064179555422056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Miguel Ojeda <ojeda@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d58071a8a76d779eedab38033ae4c821c30295a5
commit: c80d92fbb67b2c80b8eeb8759ee79d676eb33520 compiler_types.h: Remove _=
_compiletime_object_size()
date:   9 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-c007-20211118 (https://download.01.org/0day-ci/ar=
chive/20211130/202111300429.yXuxMpIr-lkp(a)intel.com/config)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc80d92fbb67b2c80b8eeb8759ee79d676eb33520
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c80d92fbb67b2c80b8eeb8759ee79d676eb33520
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/gfs2/dir.c:815:6: note: Assuming the condition is false
           if (ip->i_diskflags & GFS2_DIF_EXHASH) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/dir.c:815:2: note: Taking false branch
           if (ip->i_diskflags & GFS2_DIF_EXHASH) {
           ^
   fs/gfs2/dir.c:848:6: note: Assuming 'error' is not equal to 0
           if (error)
               ^~~~~
   fs/gfs2/dir.c:848:2: note: Taking true branch
           if (error)
           ^
   fs/gfs2/dir.c:849:3: note: Returning without writing to '*pbh'
                   return ERR_PTR(error);
                   ^
   fs/gfs2/dir.c:2169:9: note: Returning from 'gfs2_dirent_search'
           dent =3D gfs2_dirent_search(inode, name, gfs2_dirent_find_space,=
 &bh);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/gfs2/dir.c:2170:6: note: Assuming 'dent' is non-null
           if (!dent) {
               ^~~~~
   fs/gfs2/dir.c:2170:2: note: Taking false branch
           if (!dent) {
           ^
   fs/gfs2/dir.c:2177:6: note: Calling 'IS_ERR'
           if (IS_ERR(dent))
               ^~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/dir.c:2177:6: note: Returning from 'IS_ERR'
           if (IS_ERR(dent))
               ^~~~~~~~~~~~
   fs/gfs2/dir.c:2177:2: note: Taking false branch
           if (IS_ERR(dent))
           ^
   fs/gfs2/dir.c:2180:6: note: Assuming field 'save_loc' is 0
           if (da->save_loc) {
               ^~~~~~~~~~~~
   fs/gfs2/dir.c:2180:2: note: Taking false branch
           if (da->save_loc) {
           ^
   fs/gfs2/dir.c:2184:3: note: 1st function call argument is an uninitializ=
ed value
                   brelse(bh);
                   ^      ~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/core/net-sysfs.c:1719:2: warning: Value stored to 'txq' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           txq =3D real_tx;
           ^     ~~~~~~~
   net/core/net-sysfs.c:1719:2: note: Value stored to 'txq' is never read
           txq =3D real_tx;
           ^     ~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> net/compat.c:444:5: warning: Assigned value is garbage or undefined [cla=
ng-analyzer-core.uninitialized.Assign]
           a0 =3D a[0];
              ^
   net/compat.c:424:1: note: Calling '__se_compat_sys_socketcall'
   COMPAT_SYSCALL_DEFINE2(socketcall, int, call, u32 __user *, args)
   ^
   include/linux/compat.h:55:2: note: expanded from macro 'COMPAT_SYSCALL_D=
EFINE2'
           COMPAT_SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:206:2: note: expanded from macro =
'COMPAT_SYSCALL_DEFINEx'
           __X32_COMPAT_SYS_STUBx(x, name, __VA_ARGS__)                    =
        \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:172:2: note: expanded from macro =
'__X32_COMPAT_SYS_STUBx'
           __SYS_STUBx(x64, compat_sys##name,                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:79:10: note: expanded from macro =
'__SYS_STUBx'
                   return __se_##name(__VA_ARGS__);                        \
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   net/compat.c:424:1: note: Calling '__do_compat_sys_socketcall'
   COMPAT_SYSCALL_DEFINE2(socketcall, int, call, u32 __user *, args)
   ^
   include/linux/compat.h:55:2: note: expanded from macro 'COMPAT_SYSCALL_D=
EFINE2'
           COMPAT_SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:209:10: note: expanded from macro=
 'COMPAT_SYSCALL_DEFINEx'
                   return __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_A=
RGS__));\
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   note: expanded from here
   net/compat.c:431:6: note: Assuming 'call' is >=3D SYS_SOCKET
           if (call < SYS_SOCKET || call > SYS_SENDMMSG)
               ^~~~~~~~~~~~~~~~~
   net/compat.c:431:6: note: Left side of '||' is false
   net/compat.c:431:27: note: Assuming 'call' is <=3D SYS_SENDMMSG
           if (call < SYS_SOCKET || call > SYS_SENDMMSG)
                                    ^~~~~~~~~~~~~~~~~~~
   net/compat.c:431:2: note: Taking false branch
           if (call < SYS_SOCKET || call > SYS_SENDMMSG)
           ^
   net/compat.c:434:6: note: Assuming the condition is false
           if (len > sizeof(a))
               ^~~~~~~~~~~~~~~
   net/compat.c:434:2: note: Taking false branch
           if (len > sizeof(a))
           ^
   net/compat.c:437:6: note: Calling 'copy_from_user'
           if (copy_from_user(a, args, len))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:13: note: Calling 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/thread_info.h:207:15: note: Assuming 'sz' is >=3D 0
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:207:15: note: Left side of '&&' is true
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/thread_info.h:207:26: note: Assuming 'sz' is < 'bytes', wh=
ich participates in a condition later
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                                   ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:207:2: note: Taking true branch
           if (unlikely(sz >=3D 0 && sz < bytes)) {
           ^
   include/linux/thread_info.h:208:3: note: Taking true branch
                   if (!__builtin_constant_p(bytes))
                   ^
   include/linux/uaccess.h:191:13: note: Returning from 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning without writing to '*to'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning value (loaded from 'n'), =
which participates in a condition later
           return n;
           ^~~~~~~~
   net/compat.c:437:6: note: Returning from 'copy_from_user'
           if (copy_from_user(a, args, len))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/compat.c:437:6: note: Assuming the condition is false
           if (copy_from_user(a, args, len))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/compat.c:437:2: note: Taking false branch
           if (copy_from_user(a, args, len))
           ^
   net/compat.c:440:8: note: Calling 'audit_socketcall_compat'
           ret =3D audit_socketcall_compat(len / sizeof(a[0]), a);

vim +444 net/compat.c

157b334aa84dc5 Dominik Brodowski  2018-03-16  423  =

361d93c46f688d Heiko Carstens     2014-03-03  424  COMPAT_SYSCALL_DEFINE2(s=
ocketcall, int, call, u32 __user *, args)
^1da177e4c3f41 Linus Torvalds     2005-04-16  425  {
62bc306e208343 Richard Guy Briggs 2017-01-17  426  	u32 a[AUDITSC_ARGS];
62bc306e208343 Richard Guy Briggs 2017-01-17  427  	unsigned int len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  428  	u32 a0, a1;
62bc306e208343 Richard Guy Briggs 2017-01-17  429  	int ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  430  =

228e548e602061 Anton Blanchard    2011-05-02  431  	if (call < SYS_SOCKET |=
| call > SYS_SENDMMSG)
^1da177e4c3f41 Linus Torvalds     2005-04-16  432  		return -EINVAL;
62bc306e208343 Richard Guy Briggs 2017-01-17  433  	len =3D nas[call];
62bc306e208343 Richard Guy Briggs 2017-01-17  434  	if (len > sizeof(a))
62bc306e208343 Richard Guy Briggs 2017-01-17  435  		return -EINVAL;
62bc306e208343 Richard Guy Briggs 2017-01-17  436  =

62bc306e208343 Richard Guy Briggs 2017-01-17  437  	if (copy_from_user(a, a=
rgs, len))
^1da177e4c3f41 Linus Torvalds     2005-04-16  438  		return -EFAULT;
62bc306e208343 Richard Guy Briggs 2017-01-17  439  =

62bc306e208343 Richard Guy Briggs 2017-01-17  440  	ret =3D audit_socketcal=
l_compat(len / sizeof(a[0]), a);
62bc306e208343 Richard Guy Briggs 2017-01-17  441  	if (ret)
62bc306e208343 Richard Guy Briggs 2017-01-17  442  		return ret;
62bc306e208343 Richard Guy Briggs 2017-01-17  443  =

^1da177e4c3f41 Linus Torvalds     2005-04-16 @444  	a0 =3D a[0];

:::::: The code at line 444 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9110064179555422056==--

