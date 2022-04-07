Content-Type: multipart/mixed; boundary="===============7677624037543419754=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/damon/dbgfs.c:359:11: warning: Array access (from variable 'pids') results in a null pointer dereference [clang-analyzer-core.NullDereference]
Date: Thu, 07 Apr 2022 20:31:02 +0800
Message-ID: <202204072022.rlztvkxW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7677624037543419754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: 1971bd630452e943380429336a851c55b027eed1 mm/damon: remove the targe=
t id concept
date:   2 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-c007-20220404 (https://download.01.org/0day-ci/ar=
chive/20220407/202204072022.rlztvkxW-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1971bd630452e943380429336a851c55b027eed1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1971bd630452e943380429336a851c55b027eed1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           __SYS_STUBx(x64, sys##name,                                     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:79:10: note: expanded from macro =
'__SYS_STUBx'
                   return __se_##name(__VA_ARGS__);                        \
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/pipe.c:1031:1: note: Calling '__do_sys_pipe'
   SYSCALL_DEFINE1(pipe, int __user *, fildes)
   ^
   include/linux/syscalls.h:217:36: note: expanded from macro 'SYSCALL_DEFI=
NE1'
   #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS=
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
   fs/pipe.c:1033:9: note: Calling 'do_pipe2'
           return do_pipe2(fildes, 0);
                  ^~~~~~~~~~~~~~~~~~~
   fs/pipe.c:1010:10: note: Calling '__do_pipe_flags'
           error =3D __do_pipe_flags(fd, files, flags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:959:2: note: Taking false branch
           if (flags & ~(O_CLOEXEC | O_NONBLOCK | O_DIRECT | O_NOTIFICATION=
_PIPE))
           ^
   fs/pipe.c:962:10: note: Calling 'create_pipe_files'
           error =3D create_pipe_files(files, flags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:917:7: note: 'inode' is non-null
           if (!inode)
                ^~~~~
   fs/pipe.c:917:2: note: Taking false branch
           if (!inode)
           ^
   fs/pipe.c:920:2: note: Taking false branch
           if (flags & O_NOTIFICATION_PIPE) {
           ^
   fs/pipe.c:932:2: note: Taking false branch
           if (IS_ERR(f)) {
           ^
   fs/pipe.c:942:2: note: Taking true branch
           if (IS_ERR(res[0])) {
           ^
   fs/pipe.c:962:10: note: Returning from 'create_pipe_files'
           error =3D create_pipe_files(files, flags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:963:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/pipe.c:963:2: note: Taking false branch
           if (error)
           ^
   fs/pipe.c:967:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   fs/pipe.c:967:2: note: Taking false branch
           if (error < 0)
           ^
   fs/pipe.c:972:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   fs/pipe.c:972:2: note: Taking false branch
           if (error < 0)
           ^
   fs/pipe.c:979:2: note: Returning zero, which participates in a condition=
 later
           return 0;
           ^~~~~~~~
   fs/pipe.c:1010:10: note: Returning from '__do_pipe_flags'
           error =3D __do_pipe_flags(fd, files, flags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:1011:7: note: 'error' is 0
           if (!error) {
                ^~~~~
   fs/pipe.c:1011:2: note: Taking true branch
           if (!error) {
           ^
   fs/pipe.c:1012:7: note: Assuming the condition is true
                   if (unlikely(copy_to_user(fildes, fd, sizeof(fd)))) {
                       ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/pipe.c:1012:3: note: Taking false branch
                   if (unlikely(copy_to_user(fildes, fd, sizeof(fd)))) {
                   ^
   fs/pipe.c:1020:4: note: 2nd function call argument is an uninitialized v=
alue
                           fd_install(fd[1], files[1]);
                           ^                 ~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> mm/damon/dbgfs.c:359:11: warning: Array access (from variable 'pids') re=
sults in a null pointer dereference [clang-analyzer-core.NullDereference]
                   put_pid(pids[i]);
                           ^
   mm/damon/dbgfs.c:446:2: note: 'target_pids' initialized to a null pointe=
r value
           struct pid **target_pids =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/dbgfs.c:451:6: note: Calling 'IS_ERR'
           if (IS_ERR(kbuf))
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
   mm/damon/dbgfs.c:451:6: note: Returning from 'IS_ERR'
           if (IS_ERR(kbuf))
               ^~~~~~~~~~~~
   mm/damon/dbgfs.c:451:2: note: Taking false branch
           if (IS_ERR(kbuf))
           ^
   mm/damon/dbgfs.c:454:2: note: Taking true branch
           if (!strncmp(kbuf, "paddr\n", count)) {
           ^
   mm/damon/dbgfs.c:459:6: note: 'id_is_pid' is false
           if (id_is_pid) {
               ^~~~~~~~~
   mm/damon/dbgfs.c:459:2: note: Taking false branch
           if (id_is_pid) {
           ^
   mm/damon/dbgfs.c:468:6: note: Assuming field 'kdamond' is null
           if (ctx->kdamond) {
               ^~~~~~~~~~~~
   mm/damon/dbgfs.c:468:2: note: Taking false branch
           if (ctx->kdamond) {
           ^
   mm/damon/dbgfs.c:479:6: note: 'id_is_pid' is false
           if (id_is_pid)
               ^~~~~~~~~
   mm/damon/dbgfs.c:479:2: note: Taking false branch
           if (id_is_pid)
           ^
   mm/damon/dbgfs.c:484:43: note: Passing null pointer value via 3rd parame=
ter 'pids'
           ret =3D dbgfs_set_targets(ctx, nr_targets, target_pids);
                                                    ^~~~~~~~~~~
   mm/damon/dbgfs.c:484:8: note: Calling 'dbgfs_set_targets'
           ret =3D dbgfs_set_targets(ctx, nr_targets, target_pids);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/dbgfs.c:417:2: note: Loop condition is false. Execution continu=
es on line 423
           damon_for_each_target_safe(t, next, ctx) {
           ^
   include/linux/damon.h:442:2: note: expanded from macro 'damon_for_each_t=
arget_safe'
           list_for_each_entry_safe(t, next, &(ctx)->adaptive_targets, list)
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   mm/damon/dbgfs.c:423:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < nr_targets; i++) {
           ^
   mm/damon/dbgfs.c:425:7: note: Assuming 't' is null
                   if (!t) {
                       ^~
   mm/damon/dbgfs.c:425:3: note: Taking true branch
                   if (!t) {
                   ^
   mm/damon/dbgfs.c:426:4: note: Loop condition is false. Execution continu=
es on line 428
                           damon_for_each_target_safe(t, next, ctx)
                           ^
   include/linux/damon.h:442:2: note: expanded from macro 'damon_for_each_t=
arget_safe'
           list_for_each_entry_safe(t, next, &(ctx)->adaptive_targets, list)
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   mm/damon/dbgfs.c:428:8: note: Assuming the condition is true
                           if (target_has_pid(ctx))
                               ^~~~~~~~~~~~~~~~~~~
   mm/damon/dbgfs.c:428:4: note: Taking true branch
                           if (target_has_pid(ctx))
                           ^
   mm/damon/dbgfs.c:429:20: note: Passing null pointer value via 1st parame=
ter 'pids'
                                   dbgfs_put_pids(pids, nr_targets);
                                                  ^~~~
   mm/damon/dbgfs.c:429:5: note: Calling 'dbgfs_put_pids'
                                   dbgfs_put_pids(pids, nr_targets);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/dbgfs.c:358:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < nr_pids; i++)
           ^
   mm/damon/dbgfs.c:359:11: note: Array access (from variable 'pids') resul=
ts in a null pointer dereference
                   put_pid(pids[i]);
                           ^~~~
   mm/damon/dbgfs.c:433:13: warning: Array access (from variable 'pids') re=
sults in a null pointer dereference [clang-analyzer-core.NullDereference]
                           t->pid =3D pids[i];

vim +/pids +359 mm/damon/dbgfs.c

4bc05954d007665 SeongJae Park 2021-09-07  353  =

1971bd630452e94 SeongJae Park 2022-03-22  354  static void dbgfs_put_pids(s=
truct pid **pids, int nr_pids)
4bc05954d007665 SeongJae Park 2021-09-07  355  {
4bc05954d007665 SeongJae Park 2021-09-07  356  	int i;
4bc05954d007665 SeongJae Park 2021-09-07  357  =

1971bd630452e94 SeongJae Park 2022-03-22  358  	for (i =3D 0; i < nr_pids; =
i++)
1971bd630452e94 SeongJae Park 2022-03-22 @359  		put_pid(pids[i]);
1971bd630452e94 SeongJae Park 2022-03-22  360  }
1971bd630452e94 SeongJae Park 2022-03-22  361  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7677624037543419754==--

