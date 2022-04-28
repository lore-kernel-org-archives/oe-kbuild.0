Content-Type: multipart/mixed; boundary="===============8846601316379653028=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [daniel-thompson:clang-analyzer/initial_review 4/6] fs/ceph/super.c:859:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 28 Apr 2022 19:29:46 +0800
Message-ID: <202204281932.rmgD4tif-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8846601316379653028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Thompson <daniel.thompson@linaro.org>

tree:   https://git.linaro.org/people/daniel.thompson/linux.git clang-analy=
zer/initial_review
head:   9a4791991f0501aaed0ec1b3f4bbbc8950418818
commit: 54ea8a7c9b6da22299c93c15cfa385ecba84cb29 [4/6] [RFC] printk: Allows=
 static analyzer to observe no_printk() arguments
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20428/202204281932.rmgD4tif-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add daniel-thompson https://git.linaro.org/people/daniel=
.thompson/linux.git
        git fetch --no-tags daniel-thompson clang-analyzer/initial_review
        git checkout 54ea8a7c9b6da22299c93c15cfa385ecba84cb29
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:235:14: note: expanded from macro=
 '__SYSCALL_DEFINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   ipc/sem.c:1709:9: note: Calling 'ksys_semctl'
           return ksys_semctl(semid, semnum, cmd, arg, IPC_64);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/sem.c:1660:6: note: 'semid' is >=3D 0
           if (semid < 0)
               ^~~~~
   ipc/sem.c:1660:2: note: Taking false branch
           if (semid < 0)
           ^
   ipc/sem.c:1665:2: note: Control jumps to 'case 17:' @line 1683
           switch (cmd) {
           ^
   ipc/sem.c:1684:10: note: Calling 'semctl_main'
                   return semctl_main(ns, semid, semnum, cmd, p);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/sem.c:1418:2: note: Taking false branch
           if (IS_ERR(sma)) {
           ^
   ipc/sem.c:1426:35: note: 'cmd' is equal to SETALL
           if (ipcperms(ns, &sma->sem_perm, cmd =3D=3D SETALL ? S_IWUGO : S=
_IRUGO))
                                            ^~~
   ipc/sem.c:1426:35: note: '?' condition is true
   ipc/sem.c:1426:6: note: Assuming the condition is false
           if (ipcperms(ns, &sma->sem_perm, cmd =3D=3D SETALL ? S_IWUGO : S=
_IRUGO))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   ipc/sem.c:1426:2: note: Taking false branch
           if (ipcperms(ns, &sma->sem_perm, cmd =3D=3D SETALL ? S_IWUGO : S=
_IRUGO))
           ^
   ipc/sem.c:1430:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   ipc/sem.c:1430:2: note: Taking false branch
           if (err)
           ^
   ipc/sem.c:1434:2: note: Control jumps to 'case 17:'  at line 1475
           switch (cmd) {
           ^
   ipc/sem.c:1480:7: note: Assuming the condition is false
                   if (!ipc_rcu_getref(&sma->sem_perm)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/sem.c:1480:3: note: Taking false branch
                   if (!ipc_rcu_getref(&sma->sem_perm)) {
                   ^
   ipc/sem.c:1486:7: note: Assuming 'nsems' is <=3D SEMMSL_FAST
                   if (nsems > SEMMSL_FAST) {
                       ^~~~~~~~~~~~~~~~~~~
   ipc/sem.c:1486:3: note: Taking false branch
                   if (nsems > SEMMSL_FAST) {
                   ^
   ipc/sem.c:1495:7: note: Calling 'copy_from_user'
                   if (copy_from_user(sem_io, p, nsems*sizeof(ushort))) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning without writing to '*to'
           return n;
           ^
   ipc/sem.c:1495:7: note: Returning from 'copy_from_user'
                   if (copy_from_user(sem_io, p, nsems*sizeof(ushort))) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/sem.c:1495:7: note: Assuming the condition is false
                   if (copy_from_user(sem_io, p, nsems*sizeof(ushort))) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/sem.c:1495:3: note: Taking false branch
                   if (copy_from_user(sem_io, p, nsems*sizeof(ushort))) {
                   ^
   ipc/sem.c:1501:8: note: The value 0 is assigned to 'i'
                   for (i =3D 0; i < nsems; i++) {
                        ^~~~~
   ipc/sem.c:1501:15: note: Assuming 'i' is < 'nsems'
                   for (i =3D 0; i < nsems; i++) {
                               ^~~~~~~~~
   ipc/sem.c:1501:3: note: Loop condition is true.  Entering loop body
                   for (i =3D 0; i < nsems; i++) {
                   ^
   ipc/sem.c:1502:18: note: The left operand of '>' is a garbage value
                           if (sem_io[i] > SEMVMX) {
                               ~~~~~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> fs/ceph/super.c:859:2: warning: Use of memory after it is freed [clang-a=
nalyzer-unix.Malloc]
           dout("destroy_fs_client %p done\n", fsc);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:132:3: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                   ^
   include/linux/printk.h:446:44: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                              ^
   fs/ceph/super.c:1358:2: note: Taking true branch
           dout("kill_sb %p\n", s);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (__is_defined(CC_IS_STATIC_ANALYZER))        \
           ^
   fs/ceph/super.c:1358:2: note: Loop condition is false.  Exiting loop
           dout("kill_sb %p\n", s);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:132:3: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   fs/ceph/super.c:1370:2: note: Calling 'destroy_fs_client'
           destroy_fs_client(fsc);
           ^~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/super.c:844:2: note: Taking true branch
           dout("destroy_fs_client %p\n", fsc);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (__is_defined(CC_IS_STATIC_ANALYZER))        \
           ^
   fs/ceph/super.c:844:2: note: Loop condition is false.  Exiting loop
           dout("destroy_fs_client %p\n", fsc);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:132:3: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   fs/ceph/super.c:858:2: note: Memory is released
           kfree(fsc);
           ^~~~~~~~~~
   fs/ceph/super.c:859:2: note: Taking true branch
           dout("destroy_fs_client %p done\n", fsc);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (__is_defined(CC_IS_STATIC_ANALYZER))        \
           ^
   fs/ceph/super.c:859:2: note: Loop condition is false.  Exiting loop
           dout("destroy_fs_client %p done\n", fsc);
--
           ^
   fs/fat/namei_vfat.c:931:7: note: 'is_dir' is 0
                   if (is_dir) {
                       ^~~~~~
   fs/fat/namei_vfat.c:931:3: note: Taking false branch
                   if (is_dir) {
                   ^
   fs/fat/namei_vfat.c:949:6: note: Assuming the condition is true
           if (IS_DIRSYNC(new_dir)) {
               ^
   include/linux/fs.h:2185:28: note: expanded from macro 'IS_DIRSYNC'
   #define IS_DIRSYNC(inode)       (__IS_FLG(inode, SB_SYNCHRONOUS|SB_DIRSY=
NC) || \
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/fs.h:2179:31: note: expanded from macro '__IS_FLG'
   #define __IS_FLG(inode, flg)    ((inode)->i_sb->s_flags & (flg))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/namei_vfat.c:949:6: note: Left side of '||' is true
           if (IS_DIRSYNC(new_dir)) {
               ^
   include/linux/fs.h:2185:71: note: expanded from macro 'IS_DIRSYNC'
   #define IS_DIRSYNC(inode)       (__IS_FLG(inode, SB_SYNCHRONOUS|SB_DIRSY=
NC) || \
                                                                           =
    ^
   fs/fat/namei_vfat.c:951:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   fs/fat/namei_vfat.c:951:3: note: Taking false branch
                   if (err)
                   ^
   fs/fat/namei_vfat.c:956:6: note: 'update_dotdot' is 0
           if (update_dotdot) {
               ^~~~~~~~~~~~~
   fs/fat/namei_vfat.c:956:2: note: Taking false branch
           if (update_dotdot) {
           ^
   fs/fat/namei_vfat.c:971:6: note: Assuming 'err' is not equal to 0
           if (err)
               ^~~
   fs/fat/namei_vfat.c:971:2: note: Taking true branch
           if (err)
           ^
   fs/fat/namei_vfat.c:972:3: note: Control jumps to line 996
                   goto error_dotdot;
                   ^
   fs/fat/namei_vfat.c:998:6: note: 'update_dotdot' is 0
           if (update_dotdot) {
               ^~~~~~~~~~~~~
   fs/fat/namei_vfat.c:998:2: note: Taking false branch
           if (update_dotdot) {
           ^
   fs/fat/namei_vfat.c:1006:6: note: 'new_inode' is non-null
           if (new_inode) {
               ^~~~~~~~~
   fs/fat/namei_vfat.c:1006:2: note: Taking true branch
           if (new_inode) {
           ^
   fs/fat/namei_vfat.c:1008:7: note: 'corrupt' is 1
                   if (corrupt)
                       ^~~~~~~
   fs/fat/namei_vfat.c:1008:3: note: Taking true branch
                   if (corrupt)
                   ^
   fs/fat/namei_vfat.c:1020:6: note: Assuming 'corrupt' is < 0
           if (corrupt < 0) {
               ^~~~~~~~~~~
   fs/fat/namei_vfat.c:1020:2: note: Taking true branch
           if (corrupt < 0) {
           ^
   fs/fat/namei_vfat.c:1021:3: note: 5th function call argument is an unini=
tialized value
                   fat_fs_error(new_dir->i_sb,
                   ^
   fs/fat/fat.h:433:2: note: expanded from macro 'fat_fs_error'
           __fat_fs_error(sb, 1, fmt , ## args)
           ^                              ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/core/info.c:114:3: warning: Value stored to 'offset' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   offset =3D entry->c.ops->llseek(entry,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/info.c:114:3: note: Value stored to 'offset' is never read
                   offset =3D entry->c.ops->llseek(entry,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> net/ceph/ceph_common.c:776:2: warning: Use of memory after it is freed [=
clang-analyzer-unix.Malloc]
           dout("destroy_client %p done\n", client);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^                   ~~~~~~~~~~~
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^                                   ~~~~~~~~~~~
   include/linux/printk.h:132:3: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                   ^             ~~~~~~~~~~~
   include/linux/printk.h:446:44: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                              ^               ~~~~~~~~~~~
   include/linux/printk.h:418:3: note: expanded from macro 'printk_index_wr=
ap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                   ^               ~~~~~~~~~~~
   net/ceph/ceph_common.c:762:2: note: Taking true branch
           dout("destroy_client %p\n", client);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (__is_defined(CC_IS_STATIC_ANALYZER))        \
           ^
   net/ceph/ceph_common.c:762:2: note: Loop condition is false.  Exiting lo=
op
           dout("destroy_client %p\n", client);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:132:3: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   net/ceph/ceph_common.c:775:2: note: Memory is released
           kfree(client);
           ^~~~~~~~~~~~~
   net/ceph/ceph_common.c:776:2: note: Taking true branch
           dout("destroy_client %p done\n", client);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (__is_defined(CC_IS_STATIC_ANALYZER))        \
           ^
   net/ceph/ceph_common.c:776:2: note: Loop condition is false.  Exiting lo=
op
           dout("destroy_client %p done\n", client);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:132:3: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   net/ceph/ceph_common.c:776:2: note: Use of memory after it is freed
           dout("destroy_client %p done\n", client);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^                   ~~~~~~~~~~~
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^                                   ~~~~~~~~~~~
   include/linux/printk.h:132:3: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                   ^             ~~~~~~~~~~~
   include/linux/printk.h:446:44: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)

vim +859 fs/ceph/super.c

a57d9064e4ee4e9 Yan, Zheng        2018-05-18  841  =

0c6d4b4e22a513f H Hartley Sweeten 2011-09-23  842  static void destroy_fs_c=
lient(struct ceph_fs_client *fsc)
16725b9d2a2e3d0 Sage Weil         2009-10-06  843  {
3d14c5d2b6e15c2 Yehuda Sadeh      2010-04-06  844  	dout("destroy_fs_client=
 %p\n", fsc);
16725b9d2a2e3d0 Sage Weil         2009-10-06  845  =

18f473b384a64ce Xiubo Li          2020-07-16  846  	spin_lock(&ceph_fsc_loc=
k);
18f473b384a64ce Xiubo Li          2020-07-16  847  	list_del(&fsc->metric_w=
akeup);
18f473b384a64ce Xiubo Li          2020-07-16  848  	spin_unlock(&ceph_fsc_l=
ock);
18f473b384a64ce Xiubo Li          2020-07-16  849  =

3ee5a7015c8b7cb Jeff Layton       2019-09-12  850  	ceph_mdsc_destroy(fsc);
1cf89a8dee5e6e9 Yan, Zheng        2019-05-18  851  	destroy_workqueue(fsc->=
inode_wq);
e3ec8d6898f7163 Yan, Zheng        2019-01-14  852  	destroy_workqueue(fsc->=
cap_wq);
a922d38fd10d55d Sage Weil         2010-05-29  853  =

3d14c5d2b6e15c2 Yehuda Sadeh      2010-04-06  854  	destroy_mount_options(f=
sc->mount_options);
5dfc589a8467470 Sage Weil         2010-05-04  855  =

3d14c5d2b6e15c2 Yehuda Sadeh      2010-04-06  856  	ceph_destroy_client(fsc=
->client);
16725b9d2a2e3d0 Sage Weil         2009-10-06  857  =

3d14c5d2b6e15c2 Yehuda Sadeh      2010-04-06  858  	kfree(fsc);
3d14c5d2b6e15c2 Yehuda Sadeh      2010-04-06 @859  	dout("destroy_fs_client=
 %p done\n", fsc);
16725b9d2a2e3d0 Sage Weil         2009-10-06  860  }
16725b9d2a2e3d0 Sage Weil         2009-10-06  861  =


:::::: The code at line 859 was first introduced by commit
:::::: 3d14c5d2b6e15c21d8e5467dc62d33127c23a644 ceph: factor out libceph fr=
om Ceph file system

:::::: TO: Yehuda Sadeh <yehuda@hq.newdream.net>
:::::: CC: Sage Weil <sage@newdream.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8846601316379653028==--

