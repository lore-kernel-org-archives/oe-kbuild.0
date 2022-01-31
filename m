Content-Type: multipart/mixed; boundary="===============2291162702424182259=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 507/2855] drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1463:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 31 Jan 2022 13:48:22 +0800
Message-ID: <202201311314.uEd32s1e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2291162702424182259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Evan Quan <evan.quan@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Lijo Lazar <lijo.lazar@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b605fdc54c2b28c30ef06d9db99282d8a32ae4be
commit: 837d542a09cd533055423dfca7e621a9c1d13c5b [507/2855] drm/amd/pm: rel=
ocate the power related headers
:::::: branch date: 3 days ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20220125 (https://download.01.org/0day-ci/arc=
hive/20220131/202201311314.uEd32s1e-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D837d542a09cd533055423dfca7e621a9c1d13c5b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 837d542a09cd533055423dfca7e621a9c1d13c5b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/gpu/drm/radeon/radeon_sa.c:163:3: note: Taking false branch
                   if (sa_bo->fence =3D=3D NULL || !radeon_fence_signaled(s=
a_bo->fence)) {
                   ^
   drivers/gpu/drm/radeon/radeon_sa.c:166:3: note: Calling 'radeon_sa_bo_re=
move_locked'
                   radeon_sa_bo_remove_locked(sa_bo);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_sa.c:145:6: note: Assuming the condition i=
s true
           if (sa_manager->hole =3D=3D &sa_bo->olist) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_sa.c:145:2: note: Taking true branch
           if (sa_manager->hole =3D=3D &sa_bo->olist) {
           ^
   drivers/gpu/drm/radeon/radeon_sa.c:151:2: note: Memory is released
           kfree(sa_bo);
           ^~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_sa.c:166:3: note: Returning; memory was re=
leased via 1st parameter
                   radeon_sa_bo_remove_locked(sa_bo);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_sa.c:162:2: note: Loop condition is false.=
 Execution continues on line 162
           list_for_each_entry_safe_from(sa_bo, tmp, &sa_manager->olist, ol=
ist) {
           ^
   include/linux/list.h:749:2: note: expanded from macro 'list_for_each_ent=
ry_safe_from'
           for (n =3D list_next_entry(pos, member);                        =
          \
           ^
   drivers/gpu/drm/radeon/radeon_sa.c:84:3: note: Returning; memory was rel=
eased
                   radeon_sa_bo_try_free(sa_manager);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_sa.c:85:7: note: Assuming the condition is=
 false
                   if (!list_empty(&sa_manager->olist)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_sa.c:85:3: note: Taking false branch
                   if (!list_empty(&sa_manager->olist)) {
                   ^
   drivers/gpu/drm/radeon/radeon_sa.c:89:2: note: Use of memory after it is=
 freed
           list_for_each_entry_safe(sa_bo, tmp, &sa_manager->olist, olist) {
           ^
   include/linux/list.h:718:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.c:161:6: warnin=
g: Access to field 'hwmgr_func' results in a dereference of a null pointer =
(loaded from variable 'hwmgr') [clang-analyzer-core.NullDereference]
           if (hwmgr->hwmgr_func->notify_cac_buffer_info)
               ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.c:181:6: note: =
Assuming 'hwmgr' is null
           if (hwmgr && hwmgr->pm_en) {
               ^~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.c:181:12: note:=
 Left side of '&&' is false
           if (hwmgr && hwmgr->pm_en) {
                     ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.c:187:6: note: =
Assuming field 'smu_prv_buffer_size' is not equal to 0
           if (adev->pm.smu_prv_buffer_size !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.c:187:2: note: =
Taking true branch
           if (adev->pm.smu_prv_buffer_size !=3D 0)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.c:188:3: note: =
Calling 'pp_reserve_vram_for_smu'
                   pp_reserve_vram_for_smu(adev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.c:150:2: note: =
'hwmgr' initialized to a null pointer value
           struct pp_hwmgr *hwmgr =3D adev->powerplay.pp_handle;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.c:152:6: note: =
Assuming the condition is false
           if (amdgpu_bo_create_kernel(adev, adev->pm.smu_prv_buffer_size,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.c:152:2: note: =
Taking false branch
           if (amdgpu_bo_create_kernel(adev, adev->pm.smu_prv_buffer_size,
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.c:161:6: note: =
Access to field 'hwmgr_func' results in a dereference of a null pointer (lo=
aded from variable 'hwmgr')
           if (hwmgr->hwmgr_func->notify_cac_buffer_info)
               ^~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1463:3: warning: Va=
lue stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D amdgpu_kv_copy_bytes_to_smc(adev,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1463:3: note: Value=
 stored to 'ret' is never read
                   ret =3D amdgpu_kv_copy_bytes_to_smc(adev,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1662:13: warning: T=
he result of the left shift is undefined due to shifting by '255', which is=
 greater or equal to the width of type 'int' [clang-analyzer-core.Undefined=
BinaryOperatorResult]
                                                             (1 << pi->acp_=
boot_level));
                                                                ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1950:6: note: Assum=
ing field 'bapm_enable' is false
           if (pi->bapm_enable) {
               ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1950:2: note: Takin=
g false branch
           if (pi->bapm_enable) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1958:6: note: Assum=
ing field 'asic_type' is not equal to CHIP_KABINI
           if (adev->asic_type =3D=3D CHIP_KABINI || adev->asic_type =3D=3D=
 CHIP_MULLINS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1958:6: note: Left =
side of '||' is false
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1958:40: note: Assu=
ming field 'asic_type' is not equal to CHIP_MULLINS
           if (adev->asic_type =3D=3D CHIP_KABINI || adev->asic_type =3D=3D=
 CHIP_MULLINS) {
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1958:2: note: Takin=
g false branch
           if (adev->asic_type =3D=3D CHIP_KABINI || adev->asic_type =3D=3D=
 CHIP_MULLINS) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1988:7: note: Assum=
ing field 'enable_dpm' is true
                   if (pi->enable_dpm) {
                       ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1988:3: note: Takin=
g true branch
                   if (pi->enable_dpm) {
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1992:8: note: Assum=
ing 'ret' is 0
                           if (ret) {
                               ^~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1992:4: note: Takin=
g false branch
                           if (ret) {
                           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2004:8: note: Assum=
ing 'ret' is 0
                           if (ret) {
                               ^~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2004:4: note: Takin=
g false branch
                           if (ret) {
                           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2008:4: note: Calli=
ng 'kv_update_acp_boot_level'
                           kv_update_acp_boot_level(adev);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1656:6: note: Assum=
ing field 'caps_stable_p_state' is false
           if (!pi->caps_stable_p_state) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1656:2: note: Takin=
g true branch
           if (!pi->caps_stable_p_state) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1657:20: note: Call=
ing 'kv_get_acp_boot_level'
                   acp_boot_level =3D kv_get_acp_boot_level(adev);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1640:14: note: Assu=
ming 'i' is >=3D field 'count'
           for (i =3D 0; i < table->count; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1640:2: note: Loop =
condition is false. Execution continues on line 1645
           for (i =3D 0; i < table->count; i++) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1645:6: note: 'i' i=
s >=3D field 'count'
           if (i >=3D table->count)
               ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1645:2: note: Takin=
g true branch
           if (i >=3D table->count)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1646:3: note: The v=
alue 255 is assigned to 'i'
                   i =3D table->count - 1;
                   ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1648:2: note: Retur=
ning the value 255 (loaded from 'i')
           return i;
           ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1657:20: note: Retu=
rning from 'kv_get_acp_boot_level'
                   acp_boot_level =3D kv_get_acp_boot_level(adev);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1657:3: note: The v=
alue 255 is assigned to 'acp_boot_level'
                   acp_boot_level =3D kv_get_acp_boot_level(adev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1658:7: note: Assum=
ing 'acp_boot_level' is not equal to field 'acp_boot_level'
                   if (acp_boot_level !=3D pi->acp_boot_level) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1658:3: note: Takin=
g true branch
                   if (acp_boot_level !=3D pi->acp_boot_level) {
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1659:4: note: The v=
alue 255 is assigned to field 'acp_boot_level'
                           pi->acp_boot_level =3D acp_boot_level;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1662:13: note: The =
result of the left shift is undefined due to shifting by '255', which is gr=
eater or equal to the width of type 'int'
                                                             (1 << pi->acp_=
boot_level));
                                                                ^  ~~~~~~~~=
~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/regulator/rk808-regulator.c:255:10: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           old_sel >>=3D ffs(mask) - 1;
                   ^
   drivers/regulator/rk808-regulator.c:302:6: note: Assuming 'gpio' is null
           if (!gpio)
               ^~~~~
   drivers/regulator/rk808-regulator.c:302:2: note: Taking true branch

vim +/ret +1463 drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c

a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1452  =

a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1453  static int kv_init_fps_limits(struct amdgpu_device *adev)
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1454  {
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1455  	struct kv_power_info *pi =3D kv_get_pi(adev);
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1456  	int ret =3D 0;
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1457  =

a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1458  	if (pi->caps_fps) {
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1459  		u16 tmp;
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1460  =

a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1461  		tmp =3D 45;
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1462  		pi->fps_high_t =3D cpu_to_be16(tmp);
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
@1463  		ret =3D amdgpu_kv_copy_bytes_to_smc(adev,
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1464  					   pi->dpm_table_start +
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1465  					   offsetof(SMU7_Fusion_DpmTable, FpsHighT),
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1466  					   (u8 *)&pi->fps_high_t,
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1467  					   sizeof(u16), pi->sram_end);
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1468  =

a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1469  		tmp =3D 30;
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1470  		pi->fps_low_t =3D cpu_to_be16(tmp);
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1471  =

a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1472  		ret =3D amdgpu_kv_copy_bytes_to_smc(adev,
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1473  					   pi->dpm_table_start +
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1474  					   offsetof(SMU7_Fusion_DpmTable, FpsLowT),
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1475  					   (u8 *)&pi->fps_low_t,
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1476  					   sizeof(u16), pi->sram_end);
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1477  =

a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1478  	}
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1479  	return ret;
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1480  }
a2e73f56fa6282 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20 =
 1481  =


:::::: The code at line 1463 was first introduced by commit
:::::: a2e73f56fa6282481927ec43aa9362c03c2e2104 drm/amdgpu: Add support for=
 CIK parts

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2291162702424182259==--

