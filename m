Content-Type: multipart/mixed; boundary="===============1504369807076770061=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/damon/dbgfs.c:359:11: warning: Array access (from variable 'pids') results in a null pointer dereference [clang-analyzer-core.NullDereference]
Date: Wed, 06 Apr 2022 17:51:21 +0800
Message-ID: <202204061700.1AfRYNQ0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1504369807076770061==
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
:::::: branch date: 16 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-c007-20220404 (https://download.01.org/0day-ci/ar=
chive/20220406/202204061700.1AfRYNQ0-lkp(a)intel.com/config)
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
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:405:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^       ~~~~~
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   kernel/static_call.c:275:47: warning: Access to field 'func' results in =
a dereference of a null pointer (loaded from variable 'key') [clang-analyze=
r-core.NullDereference]
                   arch_static_call_transform(site_addr, NULL, key->func,
                                                               ^
   kernel/static_call.c:500:16: note: Calling 'static_call_init'
   early_initcall(static_call_init);
                  ^
   include/linux/init.h:269:47: note: expanded from macro 'early_initcall'
   #define early_initcall(fn)              __define_initcall(fn, early)
                                           ~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/linux/init.h:262:54: note: expanded from macro '__define_initcal=
l'
   #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##=
id)
                                     ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/init.h:260:20: note: expanded from macro '___define_initca=
ll'
           __unique_initcall(fn, id, __sec, __initcall_id(fn))
           ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:254:22: note: expanded from macro '__unique_initcal=
l'
           ____define_initcall(fn,                                 \
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:241:33: note: expanded from macro '____define_initc=
all'
           __define_initcall_stub(__stub, fn)                      \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/init.h:226:10: note: expanded from macro '__define_initcal=
l_stub'
                   return fn();                                    \
                          ^~~~
   kernel/static_call.c:478:6: note: Assuming 'static_call_initialized' is =
false
           if (static_call_initialized)
               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/static_call.c:478:2: note: Taking false branch
           if (static_call_initialized)
           ^
   kernel/static_call.c:483:8: note: Calling '__static_call_init'
           ret =3D __static_call_init(NULL, __start_static_call_sites,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/static_call.c:217:6: note: 'start' is not equal to 'stop'
           if (start =3D=3D stop)
               ^~~~~
   kernel/static_call.c:217:2: note: Taking false branch
           if (start =3D=3D stop)
           ^
   kernel/static_call.c:222:2: note: Loop condition is true.  Entering loop=
 body
           for (site =3D start; site < stop; site++) {
           ^
   kernel/static_call.c:225:8: note: 'mod' is null
                   if ((mod && within_module_init((unsigned long)site_addr,=
 mod)) ||
                        ^~~
   kernel/static_call.c:225:12: note: Left side of '&&' is false
                   if ((mod && within_module_init((unsigned long)site_addr,=
 mod)) ||
                            ^
   kernel/static_call.c:226:9: note: 'mod' is null
                       (!mod && init_section_contains(site_addr, 1)))
                         ^~~
   kernel/static_call.c:226:8: note: Left side of '&&' is true
                       (!mod && init_section_contains(site_addr, 1)))
                        ^
   kernel/static_call.c:225:3: note: Taking false branch
                   if ((mod && within_module_init((unsigned long)site_addr,=
 mod)) ||
                   ^
   kernel/static_call.c:229:3: note: Value assigned to 'key'
                   key =3D static_call_key(site);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/static_call.c:230:7: note: Assuming 'key' is equal to 'prev_key'
                   if (key !=3D prev_key) {
                       ^~~~~~~~~~~~~~~
   kernel/static_call.c:230:7: note: Assuming pointer value is null
                   if (key !=3D prev_key) {
                       ^~~~~~~~~~~~~~~
   kernel/static_call.c:230:3: note: Taking false branch
                   if (key !=3D prev_key) {
                   ^
   kernel/static_call.c:275:47: note: Access to field 'func' results in a d=
ereference of a null pointer (loaded from variable 'key')
                   arch_static_call_transform(site_addr, NULL, key->func,
                                                               ^~~
   Suppressed 3 warnings (3 in non-user code).
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

4bc05954d00766 SeongJae Park 2021-09-07  353  =

1971bd630452e9 SeongJae Park 2022-03-22  354  static void dbgfs_put_pids(st=
ruct pid **pids, int nr_pids)
4bc05954d00766 SeongJae Park 2021-09-07  355  {
4bc05954d00766 SeongJae Park 2021-09-07  356  	int i;
4bc05954d00766 SeongJae Park 2021-09-07  357  =

1971bd630452e9 SeongJae Park 2022-03-22  358  	for (i =3D 0; i < nr_pids; i=
++)
1971bd630452e9 SeongJae Park 2022-03-22 @359  		put_pid(pids[i]);
1971bd630452e9 SeongJae Park 2022-03-22  360  }
1971bd630452e9 SeongJae Park 2022-03-22  361  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1504369807076770061==--

