Content-Type: multipart/mixed; boundary="===============4129492990083086930=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/msm_gem.c:461:9: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 17 Jan 2022 08:37:31 +0800
Message-ID: <202201170851.ZV3anvuz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4129492990083086930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Rob Clark <robdclark@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79e06c4c4950be2abd8ca5d2428a8c915aa62c24
commit: b3ed524f84f573ece1aa2f26e9db3c34a593e0d1 drm/msm: allow compile_tes=
t on !ARM
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-c006-20220116 (https://download.01.org/0day-ci/arc=
hive/20220117/202201170851.ZV3anvuz-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 650fc4=
0b6d8d9a5869b4fca525d5f237b0ee2803)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db3ed524f84f573ece1aa2f26e9db3c34a593e0d1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b3ed524f84f573ece1aa2f26e9db3c34a593e0d1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   if (!list_empty(&file_priv->event_list)) {
                   ^
   drivers/gpu/drm/drm_file.c:585:8: note: Left side of '&&' is false
                           e =3D list_first_entry(&file_priv->event_list,
                               ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/drm_file.c:585:8: note: Taking false branch
                           e =3D list_first_entry(&file_priv->event_list,
                               ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/drm_file.c:585:8: note: Loop condition is false.  Exitin=
g loop
                           e =3D list_first_entry(&file_priv->event_list,
                               ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/drm_file.c:587:30: note: Use of memory after it is freed
                           file_priv->event_space +=3D e->event->length;
                                                     ^~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:8: warning: Excessive pad=
ding in 'struct a6xx_gpu_state' (32 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   gmu_registers, =

   registers, =

   shaders, =

   clusters, =

   dbgahb_clusters, =

   indexed_regs, =

   debugbus, =

   vbif_debugbus, =

   cx_debugbus, =

   objs, =

   base, =

   nr_gmu_registers, =

   nr_registers, =

   nr_shaders, =

   nr_clusters, =

   nr_dbgahb_clusters, =

   nr_indexed_regs, =

   nr_debugbus, =

   nr_cx_debugbus, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct a6xx_gpu_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:8: note: Excessive paddin=
g in 'struct a6xx_gpu_state' (32 padding bytes, where 0 is optimal). Optima=
l fields order: gmu_registers, registers, shaders, clusters, dbgahb_cluster=
s, indexed_regs, debugbus, vbif_debugbus, cx_debugbus, objs, base, nr_gmu_r=
egisters, nr_registers, nr_shaders, nr_clusters, nr_dbgahb_clusters, nr_ind=
exed_regs, nr_debugbus, nr_cx_debugbus, consider reordering the fields or a=
dding explicit padding members
   struct a6xx_gpu_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   kernel/locking/lockdep.c:1836:30: warning: Access to field 'class' resul=
ts in a dereference of a null pointer (loaded from variable 'prt') [clang-a=
nalyzer-core.NullDereference]
           struct lock_class *parent =3D prt->class;
                                       ^
   kernel/locking/lockdep.c:3159:6: note: Assuming 'depth' is not equal to 0
           if (!depth)
               ^~~~~~
   kernel/locking/lockdep.c:3159:2: note: Taking false branch
           if (!depth)
           ^
   kernel/locking/lockdep.c:3165:6: note: Assuming 'curr->held_locks[depth]=
.irq_context' is equal to 'curr->held_locks[depth-1].irq_context'
           if (curr->held_locks[depth].irq_context !=3D
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:3165:2: note: Taking false branch
           if (curr->held_locks[depth].irq_context !=3D
           ^
   kernel/locking/lockdep.c:3169:2: note: Loop condition is true.  Entering=
 loop body
           for (;;) {
           ^
   kernel/locking/lockdep.c:3173:7: note: Assuming field 'check' is not equ=
al to 0
                   if (hlock->check) {
                       ^~~~~~~~~~~~
   kernel/locking/lockdep.c:3173:3: note: Taking true branch
                   if (hlock->check) {
                   ^
   kernel/locking/lockdep.c:3174:14: note: Calling 'check_prev_add'
                           int ret =3D check_prev_add(curr, hlock, next, di=
stance, &trace);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   kernel/locking/lockdep.c:3023:6: note: Assuming field 'key' is non-null
           if (!hlock_class(prev)->key || !hlock_class(next)->key) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:3023:6: note: Left side of '||' is false
   kernel/locking/lockdep.c:3023:33: note: Assuming field 'key' is non-null
           if (!hlock_class(prev)->key || !hlock_class(next)->key) {
                                          ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:3023:2: note: Taking false branch
           if (!hlock_class(prev)->key || !hlock_class(next)->key) {
           ^
   kernel/locking/lockdep.c:3051:8: note: Calling 'check_noncircular'
           ret =3D check_noncircular(next, prev, trace);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:2115:2: note: Calling 'bfs_init_root'
           bfs_init_root(&src_entry, src);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1622:2: note: Calling '__bfs_init_root'
           __bfs_init_root(lock, hlock_class(hlock));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1609:1: note: Returning without writing to 'loc=
k->trace', which participates in a condition later
   }
   ^
   kernel/locking/lockdep.c:1622:2: note: Returning from '__bfs_init_root'
           __bfs_init_root(lock, hlock_class(hlock));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1623:19: note: Assuming field 'read' is not equ=
al to 2
           lock->only_xr =3D (hlock->read =3D=3D 2);
                            ^~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1624:1: note: Returning without writing to 'loc=
k->trace', which participates in a condition later
   }
   ^
   kernel/locking/lockdep.c:2115:2: note: Returning from 'bfs_init_root'
           bfs_init_root(&src_entry, src);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:2117:2: note: Loop condition is false.  Exiting=
 loop
           debug_atomic_inc(nr_cyclic_checks);
           ^
   kernel/locking/lockdep_internals.h:255:33: note: expanded from macro 'de=
bug_atomic_inc'
   # define debug_atomic_inc(ptr)          do { } while (0)
                                           ^
   kernel/locking/lockdep.c:2119:8: note: Calling 'check_path'
--
            ^
   include/linux/list.h:282:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:282:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:282:9: note: Left side of '||' is true
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   include/linux/list.h:282:9: note: Taking false branch
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/list.h:282:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/list.h:282:9: note: Dereference of null pointer
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/gpu/drm/msm/msm_gem.c:461:9: warning: Assigned value is garbage =
or undefined [clang-analyzer-core.uninitialized.Assign]
                   *iova =3D local;
                         ^
   drivers/gpu/drm/msm/msm_gem.c:486:9: note: Calling 'get_and_pin_iova_ran=
ge_locked'
           return get_and_pin_iova_range_locked(obj, aspace, iova, 0, U64_M=
AX);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/msm/msm_gem.c:449:2: note: 'local' declared without an i=
nitial value
           u64 local;
           ^~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:452:14: note: Assuming the condition is fa=
lse
           GEM_WARN_ON(!msm_gem_is_locked(obj));
                       ^
   drivers/gpu/drm/msm/msm_gem.h:18:40: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                                          ^
   include/linux/ratelimit.h:58:15: note: expanded from macro 'WARN_RATELIM=
IT'
           int rtn =3D !!(condition);                                \
                        ^~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:452:2: note: 'rtn' is 0
           GEM_WARN_ON(!msm_gem_is_locked(obj));
           ^
   drivers/gpu/drm/msm/msm_gem.h:18:25: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ratelimit.h:60:15: note: expanded from macro 'WARN_RATELIM=
IT'
           if (unlikely(rtn && __ratelimit(&_rs)))                 \
                        ^~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/gpu/drm/msm/msm_gem.c:452:2: note: Left side of '&&' is false
           GEM_WARN_ON(!msm_gem_is_locked(obj));
           ^
   drivers/gpu/drm/msm/msm_gem.h:18:25: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                           ^
   include/linux/ratelimit.h:60:19: note: expanded from macro 'WARN_RATELIM=
IT'
           if (unlikely(rtn && __ratelimit(&_rs)))                 \
                            ^
   drivers/gpu/drm/msm/msm_gem.c:452:2: note: Taking false branch
           GEM_WARN_ON(!msm_gem_is_locked(obj));
           ^
   drivers/gpu/drm/msm/msm_gem.h:18:25: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                           ^
   include/linux/ratelimit.h:60:2: note: expanded from macro 'WARN_RATELIMI=
T'
           if (unlikely(rtn && __ratelimit(&_rs)))                 \
           ^
   drivers/gpu/drm/msm/msm_gem.c:454:8: note: Calling 'get_iova_locked'
           ret =3D get_iova_locked(obj, aspace, &local,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:385:14: note: Assuming the condition is fa=
lse
           GEM_WARN_ON(!msm_gem_is_locked(obj));
                       ^
   drivers/gpu/drm/msm/msm_gem.h:18:40: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                                          ^
   include/linux/ratelimit.h:58:15: note: expanded from macro 'WARN_RATELIM=
IT'
           int rtn =3D !!(condition);                                \
                        ^~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:385:2: note: 'rtn' is 0
           GEM_WARN_ON(!msm_gem_is_locked(obj));
           ^
   drivers/gpu/drm/msm/msm_gem.h:18:25: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ratelimit.h:60:15: note: expanded from macro 'WARN_RATELIM=
IT'
           if (unlikely(rtn && __ratelimit(&_rs)))                 \
                        ^~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/gpu/drm/msm/msm_gem.c:385:2: note: Left side of '&&' is false
           GEM_WARN_ON(!msm_gem_is_locked(obj));
           ^
   drivers/gpu/drm/msm/msm_gem.h:18:25: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                           ^
   include/linux/ratelimit.h:60:19: note: expanded from macro 'WARN_RATELIM=
IT'
           if (unlikely(rtn && __ratelimit(&_rs)))                 \
                            ^
   drivers/gpu/drm/msm/msm_gem.c:385:2: note: Taking false branch
           GEM_WARN_ON(!msm_gem_is_locked(obj));
           ^
   drivers/gpu/drm/msm/msm_gem.h:18:25: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                           ^
   include/linux/ratelimit.h:60:2: note: expanded from macro 'WARN_RATELIMI=
T'
           if (unlikely(rtn && __ratelimit(&_rs)))                 \
           ^
   drivers/gpu/drm/msm/msm_gem.c:389:6: note: Assuming 'vma' is null, which=
 participates in a condition later
           if (!vma) {
               ^~~~
   drivers/gpu/drm/msm/msm_gem.c:389:2: note: Taking true branch
           if (!vma) {
           ^
   drivers/gpu/drm/msm/msm_gem.c:391:7: note: Calling 'IS_ERR'
                   if (IS_ERR(vma))
                       ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
--
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pwm.c:146:15: note: '?' condition is false
                           led.name =3D to_of_node(fwnode)->name;
                                      ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/leds/leds-pwm.c:146:15: note: Access to field 'name' results in =
a dereference of a null pointer
                           led.name =3D to_of_node(fwnode)->name;
                                      ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/comedi/drivers/das800.c:90:8: warning: Excessive padding in 'str=
uct das800_board' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   ai_range, =

   ai_speed, =

   resolution, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct das800_board {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/comedi/drivers/das800.c:90:8: note: Excessive padding in 'struct=
 das800_board' (8 padding bytes, where 0 is optimal). Optimal fields order:=
 name, ai_range, ai_speed, resolution, consider reordering the fields or ad=
ding explicit padding members
   struct das800_board {
   ~~~~~~~^~~~~~~~~~~~~~
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
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   12 warnings generated.
>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:172:8: warning: Excessive pa=
dding in 'struct dpu_encoder_virt' (33 padding bytes, where 1 is optimal). =

   Optimal fields order: =

   cur_master, =

   cur_slave, =

   crtc, =

   debugfs_root, =

   frame_busy_mask, =

   crtc_frame_event_cb, =

   crtc_frame_event_cb_data, =

   hw_pp, =

   phys_encs, =

   vsync_event_work, =

   enc_spinlock, =

   frame_done_timer, =

   vsync_event_timer, =

   base, =

   enc_lock, =

   rc_lock, =

   delayed_off_work, =

   bus_scaling_client, =

   num_phys_encs, =

   frame_done_timeout_ms, =

   rc_state, =

   idle_timeout, =

   topology, =

   disp_info, =

   enabled, =

   intfs_swapped, =

   idle_pc_supported, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct dpu_encoder_virt {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:172:8: note: Excessive paddi=
ng in 'struct dpu_encoder_virt' (33 padding bytes, where 1 is optimal). Opt=
imal fields order: cur_master, cur_slave, crtc, debugfs_root, frame_busy_ma=
sk, crtc_frame_event_cb, crtc_frame_event_cb_data, hw_pp, phys_encs, vsync_=
event_work, enc_spinlock, frame_done_timer, vsync_event_timer, base, enc_lo=
ck, rc_lock, delayed_off_work, bus_scaling_client, num_phys_encs, frame_don=
e_timeout_ms, rc_state, idle_timeout, topology, disp_info, enabled, intfs_s=
wapped, idle_pc_supported, consider reordering the fields or adding explici=
t padding members
   struct dpu_encoder_virt {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/gpu/drm/msm/msm_perf.c:112:2: warning: Value stored to 'rem' is =
never read [clang-analyzer-deadcode.DeadStores]
           rem -=3D n;
           ^      ~
   drivers/gpu/drm/msm/msm_perf.c:112:2: note: Value stored to 'rem' is nev=
er read
           rem -=3D n;
           ^      ~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   2 warnings generated.
--
               ^~~~~~
   drivers/spmi/spmi-pmic-arb.c:348:2: note: Taking true branch
           if (rc < 0)
           ^
   drivers/spmi/spmi-pmic-arb.c:479:6: note: Returning from 'pmic_arb_read_=
cmd'
           if (pmic_arb_read_cmd(pmic_arb->spmic, SPMI_CMD_EXT_READL, sid,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:479:2: note: Taking true branch
           if (pmic_arb_read_cmd(pmic_arb->spmic, SPMI_CMD_EXT_READL, sid,
           ^
   drivers/spmi/spmi-pmic-arb.c:481:3: note: Assuming the condition is false
                   dev_err_ratelimited(&pmic_arb->spmic->dev, "failed irqch=
ip transaction on %x\n",
                   ^
   include/linux/dev_printk.h:218:2: note: expanded from macro 'dev_err_rat=
elimited'
           dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:207:6: note: expanded from macro 'dev_level_r=
atelimited'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:481:3: note: Taking false branch
                   dev_err_ratelimited(&pmic_arb->spmic->dev, "failed irqch=
ip transaction on %x\n",
                   ^
   include/linux/dev_printk.h:218:2: note: expanded from macro 'dev_err_rat=
elimited'
           dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:207:2: note: expanded from macro 'dev_level_r=
atelimited'
           if (__ratelimit(&_rs))                                          \
           ^
   drivers/spmi/spmi-pmic-arb.c:481:3: note: Loop condition is false.  Exit=
ing loop
                   dev_err_ratelimited(&pmic_arb->spmic->dev, "failed irqch=
ip transaction on %x\n",
                   ^
   include/linux/dev_printk.h:218:2: note: expanded from macro 'dev_err_rat=
elimited'
           dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:202:59: note: expanded from macro 'dev_level_=
ratelimited'
   #define dev_level_ratelimited(dev_level, dev, fmt, ...)                 \
                                                                           ^
   drivers/spmi/spmi-pmic-arb.c:483:1: note: Returning without writing to '=
buf->type'
   }
   ^
   drivers/spmi/spmi-pmic-arb.c:607:2: note: Returning from 'qpnpint_spmi_r=
ead'
           qpnpint_spmi_read(d, QPNPINT_REG_SET_TYPE, &type, sizeof(type));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:609:6: note: Assuming the condition is false
           if (flow_type & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:609:2: note: Taking false branch
           if (flow_type & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) {
           ^
   drivers/spmi/spmi-pmic-arb.c:618:8: note: Assuming the condition is false
                   if ((flow_type & (IRQF_TRIGGER_HIGH)) &&
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:618:41: note: Left side of '&&' is false
                   if ((flow_type & (IRQF_TRIGGER_HIGH)) &&
                                                         ^
   drivers/spmi/spmi-pmic-arb.c:622:13: note: The left expression of the co=
mpound assignment is an uninitialized value. The computed value will also b=
e garbage
                   type.type &=3D ~BIT(irq); /* level trig */
                   ~~~~~~~~~ ^
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:8: warning: Excessive pad=
ding in 'struct a6xx_gpu_state' (32 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   gmu_registers, =

   registers, =

   shaders, =

   clusters, =

   dbgahb_clusters, =

   indexed_regs, =

   debugbus, =

   vbif_debugbus, =

   cx_debugbus, =

   objs, =

   base, =

   nr_gmu_registers, =

   nr_registers, =

   nr_shaders, =

   nr_clusters, =

   nr_dbgahb_clusters, =

   nr_indexed_regs, =

   nr_debugbus, =

   nr_cx_debugbus, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct a6xx_gpu_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:8: note: Excessive paddin=
g in 'struct a6xx_gpu_state' (32 padding bytes, where 0 is optimal). Optima=
l fields order: gmu_registers, registers, shaders, clusters, dbgahb_cluster=
s, indexed_regs, debugbus, vbif_debugbus, cx_debugbus, objs, base, nr_gmu_r=
egisters, nr_registers, nr_shaders, nr_clusters, nr_dbgahb_clusters, nr_ind=
exed_regs, nr_debugbus, nr_cx_debugbus, consider reordering the fields or a=
dding explicit padding members
   struct a6xx_gpu_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/spi/spi-imx.c:446:17: warning: The result of the left shift is u=
ndefined due to shifting by '32', which is greater or equal to the width of=
 type 'unsigned int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (fin > fspi << post)
                          ^
   drivers/spi/spi-imx.c:612:13: note: Loop condition is false.  Exiting lo=
op
           u32 ctrl =3D readl(spi_imx->base + MX51_ECSPI_CTRL);
                      ^
   arch/riscv/include/asm/mmio.h:140:30: note: expanded from macro 'readl'
   #define readl(c)        ({ u32 __v; __io_br(); __v =3D readl_cpu(c); __i=
o_ar(__v); __v; })
                                       ^
   arch/riscv/include/asm/mmio.h:133:19: note: expanded from macro '__io_br'
   #define __io_br()       do {} while (0)
                           ^
   drivers/spi/spi-imx.c:617:6: note: Assuming field 'slave_mode' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
               ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:617:26: note: Left side of '&&' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
                                   ^
   drivers/spi/spi-imx.c:627:10: note: Calling 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:442:15: note: Assuming 'fspi' is <=3D 'fin'
           if (unlikely(fspi > fin))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/spi/spi-imx.c:442:2: note: Taking false branch
           if (unlikely(fspi > fin))
           ^
   drivers/spi/spi-imx.c:445:2: note: The value 32 is assigned to 'post'
           post =3D fls(fin) - fls(fspi);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:446:17: note: The result of the left shift is unde=
fined due to shifting by '32', which is greater or equal to the width of ty=
pe 'unsigned int'
           if (fin > fspi << post)
                          ^  ~~~~
   drivers/spi/spi-imx.c:458:8: warning: Division by zero [clang-analyzer-c=
ore.DivideZero]
           pre =3D DIV_ROUND_UP(fin, fspi << post) - 1;
                 ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   drivers/spi/spi-imx.c:612:13: note: Loop condition is false.  Exiting lo=
op
           u32 ctrl =3D readl(spi_imx->base + MX51_ECSPI_CTRL);
                      ^
   arch/riscv/include/asm/mmio.h:140:30: note: expanded from macro 'readl'
   #define readl(c)        ({ u32 __v; __io_br(); __v =3D readl_cpu(c); __i=
o_ar(__v); __v; })
                                       ^
   arch/riscv/include/asm/mmio.h:133:19: note: expanded from macro '__io_br'
   #define __io_br()       do {} while (0)
                           ^
   drivers/spi/spi-imx.c:617:6: note: Assuming field 'slave_mode' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
               ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:617:26: note: Left side of '&&' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
                                   ^
   drivers/spi/spi-imx.c:627:10: note: Calling 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:442:15: note: Assuming 'fspi' is <=3D 'fin'
           if (unlikely(fspi > fin))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
--
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/clk/ralink/clk-mt7621.c:50:8: warning: Excessive padding in 'str=
uct mt7621_gate' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   name, =

   parent_name, =

   priv, =

   hw, =

   bit_idx, =

   idx, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct mt7621_gate {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/clk/ralink/clk-mt7621.c:50:8: note: Excessive padding in 'struct=
 mt7621_gate' (11 padding bytes, where 3 is optimal). Optimal fields order:=
 name, parent_name, priv, hw, bit_idx, idx, consider reordering the fields =
or adding explicit padding members
   struct mt7621_gate {
   ~~~~~~~^~~~~~~~~~~~~
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/phy/cadence/phy-cadence-torrent.c:1320:25: warning: The result o=
f the left shift is undefined because the left operand is negative [clang-a=
nalyzer-core.UndefinedBinaryOperatorResult]
           value |=3D ((~lane_mask) << PMA_TX_ELEC_IDLE_SHIFT) &
                                  ^
   drivers/phy/cadence/phy-cadence-torrent.c:1444:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/phy/cadence/phy-cadence-torrent.c:1444:2: note: Taking false bra=
nch
           if (ret) {
           ^
   drivers/phy/cadence/phy-cadence-torrent.c:1449:6: note: Assuming field '=
set_lanes' is not equal to 0
           if (opts->dp.set_lanes) {
               ^~~~~~~~~~~~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:1449:2: note: Taking true bran=
ch
           if (opts->dp.set_lanes) {
           ^
   drivers/phy/cadence/phy-cadence-torrent.c:1450:9: note: Calling 'cdns_to=
rrent_dp_set_lanes'
                   ret =3D cdns_torrent_dp_set_lanes(cdns_phy, &opts->dp);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:1320:25: note: The result of t=
he left shift is undefined because the left operand is negative
           value |=3D ((~lane_mask) << PMA_TX_ELEC_IDLE_SHIFT) &
                     ~~~~~~~~~~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/phy/cadence/phy-cadence-salvo.c:227:2: warning: Value stored to =
'value' is never read [clang-analyzer-deadcode.DeadStores]
           value |=3D RXDET_IN_P3_32KHZ;
           ^
   drivers/phy/cadence/phy-cadence-salvo.c:227:2: note: Value stored to 'va=
lue' is never read
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/gpu/drm/msm/msm_gem.c:461:9: warning: Assigned value is garbage =
or undefined [clang-analyzer-core.uninitialized.Assign]
                   *iova =3D local;
                         ^
   drivers/gpu/drm/msm/msm_gem.c:486:9: note: Calling 'get_and_pin_iova_ran=
ge_locked'
           return get_and_pin_iova_range_locked(obj, aspace, iova, 0, U64_M=
AX);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/msm/msm_gem.c:449:2: note: 'local' declared without an i=
nitial value
           u64 local;
           ^~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:452:14: note: Assuming the condition is fa=
lse
           GEM_WARN_ON(!msm_gem_is_locked(obj));
                       ^
   drivers/gpu/drm/msm/msm_gem.h:18:40: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                                          ^
   include/linux/ratelimit.h:58:15: note: expanded from macro 'WARN_RATELIM=
IT'
           int rtn =3D !!(condition);                                \
                        ^~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:452:2: note: 'rtn' is 0
           GEM_WARN_ON(!msm_gem_is_locked(obj));
           ^
   drivers/gpu/drm/msm/msm_gem.h:18:25: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ratelimit.h:60:15: note: expanded from macro 'WARN_RATELIM=
IT'
           if (unlikely(rtn && __ratelimit(&_rs)))                 \
                        ^~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/gpu/drm/msm/msm_gem.c:452:2: note: Left side of '&&' is false
           GEM_WARN_ON(!msm_gem_is_locked(obj));
           ^
   drivers/gpu/drm/msm/msm_gem.h:18:25: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                           ^
   include/linux/ratelimit.h:60:19: note: expanded from macro 'WARN_RATELIM=
IT'
           if (unlikely(rtn && __ratelimit(&_rs)))                 \
                            ^
   drivers/gpu/drm/msm/msm_gem.c:452:2: note: Taking false branch
           GEM_WARN_ON(!msm_gem_is_locked(obj));
           ^
   drivers/gpu/drm/msm/msm_gem.h:18:25: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                           ^
   include/linux/ratelimit.h:60:2: note: expanded from macro 'WARN_RATELIMI=
T'
           if (unlikely(rtn && __ratelimit(&_rs)))                 \
           ^
   drivers/gpu/drm/msm/msm_gem.c:454:8: note: Calling 'get_iova_locked'
           ret =3D get_iova_locked(obj, aspace, &local,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:385:14: note: Assuming the condition is fa=
lse
           GEM_WARN_ON(!msm_gem_is_locked(obj));
                       ^
   drivers/gpu/drm/msm/msm_gem.h:18:40: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                                          ^
   include/linux/ratelimit.h:58:15: note: expanded from macro 'WARN_RATELIM=
IT'
           int rtn =3D !!(condition);                                \
                        ^~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:385:2: note: 'rtn' is 0
           GEM_WARN_ON(!msm_gem_is_locked(obj));
           ^
   drivers/gpu/drm/msm/msm_gem.h:18:25: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ratelimit.h:60:15: note: expanded from macro 'WARN_RATELIM=
IT'
           if (unlikely(rtn && __ratelimit(&_rs)))                 \
                        ^~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/gpu/drm/msm/msm_gem.c:385:2: note: Left side of '&&' is false
           GEM_WARN_ON(!msm_gem_is_locked(obj));
           ^
   drivers/gpu/drm/msm/msm_gem.h:18:25: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                           ^
   include/linux/ratelimit.h:60:19: note: expanded from macro 'WARN_RATELIM=
IT'
           if (unlikely(rtn && __ratelimit(&_rs)))                 \
                            ^
   drivers/gpu/drm/msm/msm_gem.c:385:2: note: Taking false branch
           GEM_WARN_ON(!msm_gem_is_locked(obj));
           ^
   drivers/gpu/drm/msm/msm_gem.h:18:25: note: expanded from macro 'GEM_WARN=
_ON'
   #define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
                           ^
   include/linux/ratelimit.h:60:2: note: expanded from macro 'WARN_RATELIMI=
T'
           if (unlikely(rtn && __ratelimit(&_rs)))                 \
           ^
   drivers/gpu/drm/msm/msm_gem.c:389:6: note: Assuming 'vma' is null, which=
 participates in a condition later
           if (!vma) {
               ^~~~
   drivers/gpu/drm/msm/msm_gem.c:389:2: note: Taking true branch
           if (!vma) {
           ^
   drivers/gpu/drm/msm/msm_gem.c:391:7: note: Calling 'IS_ERR'
                   if (IS_ERR(vma))
                       ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);

vim +461 drivers/gpu/drm/msm/msm_gem.c

c8afe684c95cd1 Rob Clark      2013-06-26  444  =

e4b87d227f9e82 Rob Clark      2020-10-23  445  static int get_and_pin_iova_=
range_locked(struct drm_gem_object *obj,
d3b8877e57247c Jonathan Marek 2020-04-23  446  		struct msm_gem_address_spa=
ce *aspace, uint64_t *iova,
d3b8877e57247c Jonathan Marek 2020-04-23  447  		u64 range_start, u64 range=
_end)
c0ee9794693c1f Jordan Crouse  2018-11-07  448  {
c0ee9794693c1f Jordan Crouse  2018-11-07  449  	u64 local;
c0ee9794693c1f Jordan Crouse  2018-11-07  450  	int ret;
c0ee9794693c1f Jordan Crouse  2018-11-07  451  =

90643a24a7bfbe Rob Clark      2021-04-05  452  	GEM_WARN_ON(!msm_gem_is_loc=
ked(obj));
c0ee9794693c1f Jordan Crouse  2018-11-07  453  =

8117e5e5bc1a37 Rob Clark      2020-10-23  454  	ret =3D get_iova_locked(obj=
, aspace, &local,
d3b8877e57247c Jonathan Marek 2020-04-23  455  		range_start, range_end);
c0ee9794693c1f Jordan Crouse  2018-11-07  456  =

c0ee9794693c1f Jordan Crouse  2018-11-07  457  	if (!ret)
c0ee9794693c1f Jordan Crouse  2018-11-07  458  		ret =3D msm_gem_pin_iova(o=
bj, aspace);
c0ee9794693c1f Jordan Crouse  2018-11-07  459  =

c0ee9794693c1f Jordan Crouse  2018-11-07  460  	if (!ret)
c0ee9794693c1f Jordan Crouse  2018-11-07 @461  		*iova =3D local;
4b85f7f5cf776b Rob Clark      2017-06-13  462  =

c8afe684c95cd1 Rob Clark      2013-06-26  463  	return ret;
c8afe684c95cd1 Rob Clark      2013-06-26  464  }
c8afe684c95cd1 Rob Clark      2013-06-26  465  =


:::::: The code at line 461 was first introduced by commit
:::::: c0ee9794693c1ff5bf540fc642fac954e39234a0 drm/msm: Split msm_gem_get_=
iova into two steps

:::::: TO: Jordan Crouse <jcrouse@codeaurora.org>
:::::: CC: Rob Clark <robdclark@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4129492990083086930==--

