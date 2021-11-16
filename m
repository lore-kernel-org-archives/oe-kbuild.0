Content-Type: multipart/mixed; boundary="===============6080445665657575721=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:236:9: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Tue, 16 Nov 2021 08:15:01 +0800
Message-ID: <202111160850.EauMst73-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6080445665657575721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/0day-ci/linux/commits/Arunpravin/Enable-buddy-me=
mory-manager-support/20210921-032602
head:   71b3775a5ce7b59e8c5292ae438284e8569c9e9f
commit: 71b3775a5ce7b59e8c5292ae438284e8569c9e9f Add drm buddy manager supp=
ort to amdgpu driver
date:   8 weeks ago
:::::: branch date: 8 weeks ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20210927 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8d=
fdfe7efecfda318d43a06fae18b40eb498)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/71b3775a5ce7b59e8c5292ae4=
38284e8569c9e9f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arunpravin/Enable-buddy-memory-man=
ager-support/20210921-032602
        git checkout 71b3775a5ce7b59e8c5292ae438284e8569c9e9f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                                           ^
   kernel/sched/topology.c:2218:3: note: Loop condition is true.  Entering =
loop body
                   for (sd =3D *per_cpu_ptr(d.sd, i); sd; sd =3D sd->parent=
) {
                   ^
   kernel/sched/topology.c:2220:8: note: Assuming the condition is false
                           if (sd->flags & SD_OVERLAP) {
                               ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/topology.c:2220:4: note: Taking false branch
                           if (sd->flags & SD_OVERLAP) {
                           ^
   kernel/sched/topology.c:2224:9: note: Calling 'build_sched_groups'
                                   if (build_sched_groups(sd, i))
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/topology.c:1194:37: note: 'last' initialized to a null poin=
ter value
           struct sched_group *first =3D NULL, *last =3D NULL;
                                              ^~~~
   kernel/sched/topology.c:1200:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&sched_domains_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   kernel/sched/topology.c:1200:2: note: Left side of '&&' is false
           lockdep_assert_held(&sched_domains_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   kernel/sched/topology.c:1200:2: note: Taking false branch
           lockdep_assert_held(&sched_domains_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   kernel/sched/topology.c:1200:2: note: Loop condition is false.  Exiting =
loop
           lockdep_assert_held(&sched_domains_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   kernel/sched/topology.c:1205:2: note: Assuming 'i' is >=3D 8
           for_each_cpu_wrap(i, span, cpu) {
           ^
   include/linux/cpumask.h:271:7: note: expanded from macro 'for_each_cpu_w=
rap'
                (cpu) < nr_cpumask_bits;                                   =
        \
                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/topology.c:1205:2: note: Loop condition is false. Execution=
 continues on line 1221
           for_each_cpu_wrap(i, span, cpu) {
           ^
   include/linux/cpumask.h:270:2: note: expanded from macro 'for_each_cpu_w=
rap'
           for ((cpu) =3D cpumask_next_wrap((start)-1, (mask), (start), fal=
se);      \
           ^
   kernel/sched/topology.c:1221:13: note: Access to field 'next' results in=
 a dereference of a null pointer (loaded from variable 'last')
           last->next =3D first;
           ~~~~       ^
   Suppressed 17 warnings (15 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:236:9: warning: The left ex=
pression of the compound assignment is an uninitialized value. The computed=
 value will also be garbage [clang-analyzer-core.uninitialized.Assign]
                   usage +=3D amdgpu_vram_mgr_vis_size(adev, block);
                   ~~~~~ ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:227:2: note: 'usage' declar=
ed without an initial value
           u64 usage;
           ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:229:6: note: Calling 'amdgp=
u_gmc_vram_full_visible'
           if (amdgpu_gmc_vram_full_visible(&adev->gmc))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_gmc.h:286:10: note: Assuming=
 field 'real_vram_size' is >=3D field 'visible_vram_size'
           WARN_ON(gmc->real_vram_size < gmc->visible_vram_size);
                   ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_gmc.h:286:2: note: Taking fa=
lse branch
           WARN_ON(gmc->real_vram_size < gmc->visible_vram_size);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_gmc.h:288:10: note: Assuming=
 field 'real_vram_size' is not equal to field 'visible_vram_size'
           return (gmc->real_vram_size =3D=3D gmc->visible_vram_size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_gmc.h:288:2: note: Returning=
 zero, which participates in a condition later
           return (gmc->real_vram_size =3D=3D gmc->visible_vram_size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:229:6: note: Returning from=
 'amdgpu_gmc_vram_full_visible'
           if (amdgpu_gmc_vram_full_visible(&adev->gmc))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:229:2: note: Taking false b=
ranch
           if (amdgpu_gmc_vram_full_visible(&adev->gmc))
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:232:6: note: Assuming the c=
ondition is false
           if (res->start >=3D adev->gmc.visible_vram_size >> PAGE_SHIFT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:232:2: note: Taking false b=
ranch
           if (res->start >=3D adev->gmc.visible_vram_size >> PAGE_SHIFT)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:235:2: note: Left side of '=
&&' is false
           list_for_each_entry(block, &vnode->blocks, link)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:235:2: note: Taking false b=
ranch
           list_for_each_entry(block, &vnode->blocks, link)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:235:2: note: Loop condition=
 is false.  Exiting loop
           list_for_each_entry(block, &vnode->blocks, link)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:235:2: note: Loop condition=
 is true.  Entering loop body
           list_for_each_entry(block, &vnode->blocks, link)
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:236:9: note: The left expre=
ssion of the compound assignment is an uninitialized value. The computed va=
lue will also be garbage
                   usage +=3D amdgpu_vram_mgr_vis_size(adev, block);
                   ~~~~~ ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:238:2: warning: Undefined o=
r garbage value returned to caller [clang-analyzer-core.uninitialized.Undef=
Return]
           return usage;
           ^      ~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:227:2: note: 'usage' declar=
ed without an initial value
           u64 usage;
           ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:229:6: note: Calling 'amdgp=
u_gmc_vram_full_visible'
           if (amdgpu_gmc_vram_full_visible(&adev->gmc))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_gmc.h:286:10: note: Assuming=
 field 'real_vram_size' is >=3D field 'visible_vram_size'
           WARN_ON(gmc->real_vram_size < gmc->visible_vram_size);
                   ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_gmc.h:286:2: note: Taking fa=
lse branch
           WARN_ON(gmc->real_vram_size < gmc->visible_vram_size);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_gmc.h:288:10: note: Assuming=
 field 'real_vram_size' is not equal to field 'visible_vram_size'
           return (gmc->real_vram_size =3D=3D gmc->visible_vram_size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_gmc.h:288:2: note: Returning=
 zero, which participates in a condition later
           return (gmc->real_vram_size =3D=3D gmc->visible_vram_size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:229:6: note: Returning from=
 'amdgpu_gmc_vram_full_visible'
           if (amdgpu_gmc_vram_full_visible(&adev->gmc))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:229:2: note: Taking false b=
ranch
           if (amdgpu_gmc_vram_full_visible(&adev->gmc))
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:232:6: note: Assuming the c=
ondition is false
           if (res->start >=3D adev->gmc.visible_vram_size >> PAGE_SHIFT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:232:2: note: Taking false b=
ranch
           if (res->start >=3D adev->gmc.visible_vram_size >> PAGE_SHIFT)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:235:2: note: Left side of '=
&&' is false
           list_for_each_entry(block, &vnode->blocks, link)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:235:2: note: Taking false b=
ranch
           list_for_each_entry(block, &vnode->blocks, link)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:235:2: note: Loop condition=
 is false.  Exiting loop
           list_for_each_entry(block, &vnode->blocks, link)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:235:2: note: Loop condition=
 is false. Execution continues on line 238
           list_for_each_entry(block, &vnode->blocks, link)
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:238:2: note: Undefined or g=
arbage value returned to caller
           return usage;
           ^      ~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:590:9: warning: Branch cond=
ition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branc=
h]
           while (cursor.remaining) {
                  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:585:6: note: Assuming the c=
ondition is false
           if (!*sgt)
               ^~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:585:2: note: Taking false b=
ranch
           if (!*sgt)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:589:2: note: Calling 'amdgp=
u_res_first'
           amdgpu_res_first(res, offset, length, &cursor);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:68:6: note: Ass=
uming 'res' is non-null
           if (!res || res->mem_type =3D=3D TTM_PL_SYSTEM) {
               ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:68:6: note: Lef=
t side of '||' is false
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:68:14: note: As=
suming field 'mem_type' is not equal to TTM_PL_SYSTEM
           if (!res || res->mem_type =3D=3D TTM_PL_SYSTEM) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:68:2: note: Tak=
ing false branch
           if (!res || res->mem_type =3D=3D TTM_PL_SYSTEM) {
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:77:9: note: Ass=
uming the condition is false
           BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:77:2: note: Tak=
ing false branch
           BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:77:2: note: Loo=
p condition is false.  Exiting loop
           BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:81:6: note: Ass=
uming field 'mem_type' is not equal to TTM_PL_VRAM
           if (cur->mem_type =3D=3D TTM_PL_VRAM) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:81:2: note: Tak=
ing false branch
           if (cur->mem_type =3D=3D TTM_PL_VRAM) {
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:100:13: note: A=
ssuming field 'mem_type' is not equal to TTM_PL_TT
           } else if (cur->mem_type =3D=3D TTM_PL_TT) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:100:9: note: Ta=
king false branch
           } else if (cur->mem_type =3D=3D TTM_PL_TT) {
                  ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:112:1: note: Re=
turning without writing to 'cur->remaining', which participates in a condit=
ion later
   }
   ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:112:1: note: Re=
turning without writing to 'cur->remaining'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:589:2: note: Returning from=
 'amdgpu_res_first'
           amdgpu_res_first(res, offset, length, &cursor);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:590:9: note: Branch conditi=
on evaluates to a garbage value
           while (cursor.remaining) {
                  ^~~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:383:6: note: Assuming 'lpfn=
' is not equal to 0
           if (!lpfn)
               ^~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:383:2: note: Taking false b=
ranch
           if (!lpfn)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:387:6: note: Assuming field=
 'type' is equal to ttm_bo_type_kernel
           if (tbo->type !=3D ttm_bo_type_kernel)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:387:2: note: Taking false b=
ranch
           if (tbo->type !=3D ttm_bo_type_kernel)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:392:6: note: Assuming the c=
ondition is false
           if (atomic64_add_return(mem_bytes, &mgr->usage) > max_bytes) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:392:2: note: Taking false b=
ranch
           if (atomic64_add_return(mem_bytes, &mgr->usage) > max_bytes) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:397:6: note: Assuming the c=
ondition is false
           if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:397:2: note: Taking false b=
ranch
           if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:406:20: note: Assuming '__U=
NIQUE_ID___x419' is <=3D '__UNIQUE_ID___y420'
                   pages_per_node =3D max_t(uint32_t, pages_per_node,
                                    ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1733:6: note: Left side of '&&' i=
s true
           if (!unlocked && !dma_fence_is_signaled(vm->last_unlocked)) {
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1733:2: note: Taking false branch
           if (!unlocked && !dma_fence_is_signaled(vm->last_unlocked)) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1742:6: note: Assuming 'r' is 0
           if (r)
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1742:2: note: Taking false branch
           if (r)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1745:19: note: 'pages_addr' is nu=
ll
           amdgpu_res_first(pages_addr ? NULL : res, offset,
                            ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1745:19: note: '?' condition is f=
alse
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1747:2: note: Loop condition is t=
rue.  Entering loop body
           while (cursor.remaining) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1751:7: note: 'pages_addr' is null
                   if (pages_addr) {
                       ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1751:3: note: Taking false branch
                   if (pages_addr) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1782:10: note: Taking true branch
                   } else if (flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)) {
                          ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1790:7: note: Calling 'amdgpu_vm_=
update_ptes'
                   r =3D amdgpu_vm_update_ptes(&params, start, tmp, addr, f=
lags);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1538:2: note: Calling 'amdgpu_vm_=
fragment'
           amdgpu_vm_fragment(params, frag_start, end, flags, &frag, &frag_=
end);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1491:6: note: Assuming field 'asi=
c_type' is >=3D CHIP_VEGA10
           if (params->adev->asic_type < CHIP_VEGA10)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1491:2: note: Taking false branch
           if (params->adev->asic_type < CHIP_VEGA10)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1497:6: note: Assuming field 'pag=
es_addr' is non-null
           if (params->pages_addr) {
               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1497:2: note: Taking true branch
           if (params->pages_addr) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1500:3: note: Returning without w=
riting to 'params->unlocked', which participates in a condition later
                   return;
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1538:2: note: Returning from 'amd=
gpu_vm_fragment'
           amdgpu_vm_fragment(params, frag_start, end, flags, &frag, &frag_=
end);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1542:9: note: Assuming 'end' is >=
 field 'pfn'
           while (cursor.pfn < end) {
                  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1542:2: note: Loop condition is t=
rue.  Entering loop body
           while (cursor.pfn < end) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1547:7: note: Assuming field 'unl=
ocked' is true
                   if (!params->unlocked) {
                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1547:3: note: Taking false branch
                   if (!params->unlocked) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1557:11: note: Calling 'amdgpu_vm=
_level_shift'
                   shift =3D amdgpu_vm_level_shift(adev, cursor.level);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:169:2: note: Control jumps to the=
 'default' case at line 177
           switch (level) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:178:3: note: Returning the value =
4294967295
                   return ~0;
                   ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1557:11: note: Returning from 'am=
dgpu_vm_level_shift'
                   shift =3D amdgpu_vm_level_shift(adev, cursor.level);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1557:3: note: The value 429496729=
5 is assigned to 'shift'
                   shift =3D amdgpu_vm_level_shift(adev, cursor.level);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1559:15: note: Field 'unlocked' i=
s true
                   if (params->unlocked) {
                               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1559:3: note: Taking true branch
                   if (params->unlocked) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1561:8: note: Assuming the condit=
ion is false
                           if (amdgpu_vm_pt_descendant(adev, &cursor))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1561:4: note: Taking false branch
                           if (amdgpu_vm_pt_descendant(adev, &cursor))
                           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1588:7: note: Assuming 'pt' is no=
n-null
                   if (!pt) {
                       ^~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1588:3: note: Taking false branch
                   if (!pt) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1606:41: note: The result of the =
left shift is undefined due to shifting by '4294967295', which is greater o=
r equal to the width of type 'uint64_t'
                   incr =3D (uint64_t)AMDGPU_GPU_PAGE_SIZE << shift;
                                                         ^  ~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1747:9: warning: Branch condition=
 evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           while (cursor.remaining) {
                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2196:2: note: Left side of '&&' i=
s false
           list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status)=
 {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2196:2: note: Taking false branch
           list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status)=
 {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2196:2: note: Loop condition is f=
alse.  Exiting loop
           list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status)=
 {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2196:2: note: Left side of '&&' i=
s false
           list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status)=
 {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2196:2: note: Taking false branch
           list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status)=
 {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2196:2: note: Loop condition is f=
alse.  Exiting loop
           list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status)=
 {

vim +236 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c

3c848bb38aca1f Christian K=C3=B6nig 2017-08-07  212  =

5e9244ff585239 Michel D=C3=A4nzer   2018-06-12  213  /**
ddc21af4d0f37f Michel D=C3=A4nzer   2018-07-11  214   * amdgpu_vram_mgr_bo_=
visible_size - CPU visible BO size
5e9244ff585239 Michel D=C3=A4nzer   2018-06-12  215   *
5e9244ff585239 Michel D=C3=A4nzer   2018-06-12  216   * @bo: &amdgpu_bo buf=
fer object (must be in VRAM)
5e9244ff585239 Michel D=C3=A4nzer   2018-06-12  217   *
5e9244ff585239 Michel D=C3=A4nzer   2018-06-12  218   * Returns:
ddc21af4d0f37f Michel D=C3=A4nzer   2018-07-11  219   * How much of the giv=
en &amdgpu_bo buffer object lies in CPU visible VRAM.
5e9244ff585239 Michel D=C3=A4nzer   2018-06-12  220   */
ddc21af4d0f37f Michel D=C3=A4nzer   2018-07-11  221  u64 amdgpu_vram_mgr_bo=
_visible_size(struct amdgpu_bo *bo)
5e9244ff585239 Michel D=C3=A4nzer   2018-06-12  222  {
7303b39e46b2f5 Michel D=C3=A4nzer   2018-06-14  223  	struct amdgpu_device =
*adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
cb1c81467af355 Christian K=C3=B6nig 2021-04-30  224  	struct ttm_resource *=
res =3D bo->tbo.resource;
71b3775a5ce7b5 Arunpravin      2021-09-21  225  	struct amdgpu_vram_mgr_nod=
e *vnode =3D to_amdgpu_vram_mgr_node(res);
71b3775a5ce7b5 Arunpravin      2021-09-21  226  	struct drm_buddy_block *bl=
ock;
ddc21af4d0f37f Michel D=C3=A4nzer   2018-07-11  227  	u64 usage;
5e9244ff585239 Michel D=C3=A4nzer   2018-06-12  228  =

9735bf1930e658 Michel D=C3=A4nzer   2018-06-15  229  	if (amdgpu_gmc_vram_f=
ull_visible(&adev->gmc))
ddc21af4d0f37f Michel D=C3=A4nzer   2018-07-11  230  		return amdgpu_bo_siz=
e(bo);
7303b39e46b2f5 Michel D=C3=A4nzer   2018-06-14  231  =

cb1c81467af355 Christian K=C3=B6nig 2021-04-30  232  	if (res->start >=3D a=
dev->gmc.visible_vram_size >> PAGE_SHIFT)
ddc21af4d0f37f Michel D=C3=A4nzer   2018-07-11  233  		return 0;
7303b39e46b2f5 Michel D=C3=A4nzer   2018-06-14  234  =

71b3775a5ce7b5 Arunpravin      2021-09-21 @235  	list_for_each_entry(block,=
 &vnode->blocks, link)
71b3775a5ce7b5 Arunpravin      2021-09-21 @236  		usage +=3D amdgpu_vram_mg=
r_vis_size(adev, block);
7303b39e46b2f5 Michel D=C3=A4nzer   2018-06-14  237  =

7303b39e46b2f5 Michel D=C3=A4nzer   2018-06-14 @238  	return usage;
5e9244ff585239 Michel D=C3=A4nzer   2018-06-12  239  }
5e9244ff585239 Michel D=C3=A4nzer   2018-06-12  240  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6080445665657575721==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
+h/aKKng0SACAA==
--===============6080445665657575721==--

