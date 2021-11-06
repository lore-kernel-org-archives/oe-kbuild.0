Content-Type: multipart/mixed; boundary="===============3158276089459397695=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:236:9: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 07 Nov 2021 02:20:17 +0800
Message-ID: <202111070213.v16ZzQZy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3158276089459397695==
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
date:   7 weeks ago
:::::: branch date: 7 weeks ago
:::::: commit date: 7 weeks ago
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
   drivers/slimbus/messaging.c:267:2: note: Taking true branch
           if (slim_tid_txn(txn->mt, txn->mc))
           ^
   drivers/slimbus/messaging.c:270:9: note: Calling 'slim_do_transfer'
           return slim_do_transfer(ctrl, txn);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:120:6: note: Assuming field 'clk_state' is n=
ot equal to SLIM_CLK_ENTERING_PAUSE
           if (ctrl->sched.clk_state =3D=3D SLIM_CLK_ENTERING_PAUSE &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:120:55: note: Left side of '&&' is false
           if (ctrl->sched.clk_state =3D=3D SLIM_CLK_ENTERING_PAUSE &&
                                                                ^
   drivers/slimbus/messaging.c:126:7: note: 'clk_pause_msg' is false
           if (!clk_pause_msg) {
                ^~~~~~~~~~~~~
   drivers/slimbus/messaging.c:126:2: note: Taking true branch
           if (!clk_pause_msg) {
           ^
   drivers/slimbus/messaging.c:128:7: note: Assuming field 'clk_state' is n=
ot equal to SLIM_CLK_ACTIVE
                   if (ctrl->sched.clk_state !=3D SLIM_CLK_ACTIVE) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:128:3: note: Taking true branch
                   if (ctrl->sched.clk_state !=3D SLIM_CLK_ACTIVE) {
                   ^
   drivers/slimbus/messaging.c:129:4: note: Loop condition is false.  Exiti=
ng loop
                           dev_err(ctrl->dev, "ctrl wrong state:%d, ret:%d\=
n",
                           ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/slimbus/messaging.c:131:4: note: Control jumps to line 167
                           goto slim_xfer_err;
                           ^
   drivers/slimbus/messaging.c:167:7: note: 'clk_pause_msg' is false
           if (!clk_pause_msg && (txn->tid =3D=3D 0  || ret =3D=3D -ETIMEDO=
UT)) {
                ^~~~~~~~~~~~~
   drivers/slimbus/messaging.c:167:6: note: Left side of '&&' is true
           if (!clk_pause_msg && (txn->tid =3D=3D 0  || ret =3D=3D -ETIMEDO=
UT)) {
               ^
   drivers/slimbus/messaging.c:167:30: note: Field 'tid' is equal to 0
           if (!clk_pause_msg && (txn->tid =3D=3D 0  || ret =3D=3D -ETIMEDO=
UT)) {
                                       ^
   drivers/slimbus/messaging.c:167:40: note: Left side of '||' is true
           if (!clk_pause_msg && (txn->tid =3D=3D 0  || ret =3D=3D -ETIMEDO=
UT)) {
                                                 ^
   drivers/slimbus/messaging.c:175:2: note: Returning without writing to '-=
>msg->rbuf'
           return ret;
           ^
   drivers/slimbus/messaging.c:270:9: note: Returning from 'slim_do_transfe=
r'
           return slim_do_transfer(ctrl, txn);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:270:2: note: Returning without writing to '-=
>rbuf'
           return slim_do_transfer(ctrl, txn);
           ^
   drivers/slimbus/messaging.c:302:9: note: Returning from 'slim_xfer_msg'
           return slim_xfer_msg(sdev, &msg, SLIM_MSG_MC_REQUEST_VALUE);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:302:2: note: Returning without writing to '*'
           return slim_xfer_msg(sdev, &msg, SLIM_MSG_MC_REQUEST_VALUE);
           ^
   drivers/slimbus/messaging.c:319:8: note: Returning from 'slim_read'
           ret =3D slim_read(sdev, addr, 1, &buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:320:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/slimbus/messaging.c:320:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/slimbus/messaging.c:323:3: note: Undefined or garbage value retu=
rned to caller
                   return buf;
                   ^      ~~~
   Suppressed 6 warnings (6 in non-user code).
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

71b3775a5ce7b5 Arunpravin      2021-09-21  235  	list_for_each_entry(block,=
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

--===============3158276089459397695==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
O9f/AHaJzITRIAIA
--===============3158276089459397695==--

