Content-Type: multipart/mixed; boundary="===============1323423865922884993=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11460/12279] drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1463:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 14 Jan 2022 20:16:51 +0800
Message-ID: <202201142049.CdsjN5ei-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1323423865922884993==
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
head:   468c1d50222ce9439c9835e00ab55ae9ced389fb
commit: 50ae9fbc32ce4ae283b273b5d28fb873e5d7e862 [11460/12279] drm/amd/pm: =
relocate the power related headers
:::::: branch date: 7 hours ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220113 (https://download.01.org/0day-ci/archi=
ve/20220114/202201142049.CdsjN5ei-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d10219=
78b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D50ae9fbc32ce4ae283b273b5d28fb873e5d7e862
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 50ae9fbc32ce4ae283b273b5d28fb873e5d7e862
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   mm/swap.c:963:13: note: Calling 'folio_lruvec_relock_irqsave'
                           lruvec =3D folio_lruvec_relock_irqsave(folio, lr=
uvec,
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/memcontrol.h:1591:6: note: 'locked_lruvec' is null
           if (locked_lruvec) {
               ^~~~~~~~~~~~~
   include/linux/memcontrol.h:1591:2: note: Taking false branch
           if (locked_lruvec) {
           ^
   include/linux/memcontrol.h:1598:2: note: Returning pointer
           return folio_lruvec_lock_irqsave(folio, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap.c:963:13: note: Returning from 'folio_lruvec_relock_irqsave'
                           lruvec =3D folio_lruvec_relock_irqsave(folio, lr=
uvec,
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   mm/swap.c:963:4: note: Value assigned to 'lruvec'
                           lruvec =3D folio_lruvec_relock_irqsave(folio, lr=
uvec,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   mm/swap.c:965:8: note: Assuming pointer value is null
                           if (prev_lruvec !=3D lruvec)
                               ^~~~~~~~~~~~~~~~~~~~~
   mm/swap.c:965:8: note: Assuming 'prev_lruvec' is equal to 'lruvec'
                           if (prev_lruvec !=3D lruvec)
                               ^~~~~~~~~~~~~~~~~~~~~
   mm/swap.c:965:4: note: Taking false branch
                           if (prev_lruvec !=3D lruvec)
                           ^
   mm/swap.c:968:33: note: Passing null pointer value via 2nd parameter 'lr=
uvec'
                           del_page_from_lru_list(page, lruvec);
                                                        ^~~~~~
   mm/swap.c:968:4: note: Calling 'del_page_from_lru_list'
                           del_page_from_lru_list(page, lruvec);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_inline.h:136:19: note: Passing null pointer value via 1=
st parameter 'lruvec'
           lruvec_del_folio(lruvec, page_folio(page));
                            ^~~~~~
   include/linux/mm_inline.h:136:2: note: Calling 'lruvec_del_folio'
           lruvec_del_folio(lruvec, page_folio(page));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_inline.h:129:18: note: Passing null pointer value via 1=
st parameter 'lruvec'
           update_lru_size(lruvec, folio_lru_list(folio), folio_zonenum(fol=
io),
                           ^~~~~~
   include/linux/mm_inline.h:129:2: note: Calling 'update_lru_size'
           update_lru_size(lruvec, folio_lru_list(folio), folio_zonenum(fol=
io),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/mm_inline.h:37:43: note: Passing null pointer value via 1s=
t parameter 'lruvec'
           struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
                                                    ^~~~~~
   include/linux/mm_inline.h:37:30: note: Calling 'lruvec_pgdat'
           struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
                                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:972:9: note: Access to field 'pgdat' results in a=
 dereference of a null pointer (loaded from variable 'lruvec')
           return lruvec->pgdat;
                  ^~~~~~
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
   8 warnings generated.
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
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
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
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/rcar-du/rcar_du_of.c:143:13: warning: Access to field 'p=
handle' results in a dereference of a null pointer (loaded from field 'np')=
 [clang-analyzer-core.NullDereference]
           value[0] =3D cpu_to_be32(clk->np->phandle);
                      ^
   include/linux/byteorder/generic.h:94:21: note: expanded from macro 'cpu_=
to_be32'
   #define cpu_to_be32 __cpu_to_be32
                       ^
   include/uapi/linux/byteorder/little_endian.h:39:43: note: expanded from =
macro '__cpu_to_be32'
--
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2840:2: note: Loop =
condition is false. Execution continues on line 2867
           while (config_regs->offset !=3D 0xFFFFFFFF) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2867:2: note: Retur=
ning without writing to 'adev->pm.dpm.priv'
           return 0;
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2883:8: note: Retur=
ning from 'si_program_cac_config_registers'
           ret =3D si_program_cac_config_registers(adev, si_pi->cac_overrid=
e);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2884:6: note: 'ret'=
 is 0
           if (ret)
               ^~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2884:2: note: Takin=
g false branch
           if (ret)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2886:8: note: Calli=
ng 'si_program_cac_config_registers'
           ret =3D si_program_cac_config_registers(adev, si_pi->cac_weights=
);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2837:6: note: Assum=
ing 'config_regs' is non-null
           if (!config_regs)
               ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2837:2: note: Takin=
g false branch
           if (!config_regs)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2840:9: note: Assum=
ing field 'offset' is not equal to -1
           while (config_regs->offset !=3D 0xFFFFFFFF) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2840:2: note: Loop =
condition is true.  Entering loop body
           while (config_regs->offset !=3D 0xFFFFFFFF) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2841:3: note: Contr=
ol jumps to the 'default' case at line 2847
                   switch (config_regs->type) {
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2849:4: note:  Exec=
ution continues on line 2852
                           break;
                           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2855:3: note: Contr=
ol jumps to the 'default' case at line 2861
                   switch (config_regs->type) {
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2862:4: note: Value=
 assigned to field 'priv'
                           WREG32(config_regs->offset, data);
                           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:1176:24: note: expanded fr=
om macro 'WREG32'
   #define WREG32(reg, v) amdgpu_device_wreg(adev, (reg), (v), 0)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2863:4: note:  Exec=
ution continues on line 2865
                           break;
                           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2840:9: note: Assum=
ing field 'offset' is equal to -1
           while (config_regs->offset !=3D 0xFFFFFFFF) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2840:2: note: Loop =
condition is false. Execution continues on line 2867
           while (config_regs->offset !=3D 0xFFFFFFFF) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2886:8: note: Retur=
ning from 'si_program_cac_config_registers'
           ret =3D si_program_cac_config_registers(adev, si_pi->cac_weights=
);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2887:6: note: 'ret'=
 is 0
           if (ret)
               ^~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2887:2: note: Takin=
g false branch
           if (ret)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:6909:8: note: Retur=
ning from 'si_initialize_hardware_cac_manager'
           ret =3D si_initialize_hardware_cac_manager(adev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:6910:6: note: 'ret'=
 is 0
           if (ret) {
               ^~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:6910:2: note: Takin=
g false branch
           if (ret) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:6914:8: note: Calli=
ng 'si_initialize_smc_dte_tables'
           ret =3D si_initialize_smc_dte_tables(adev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2561:32: note: Call=
ing 'si_get_pi'
           struct si_power_info *si_pi =3D si_get_pi(adev);
                                         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:1853:2: note: 'pi' =
initialized here
           struct si_power_info *pi =3D adev->pm.dpm.priv;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:1854:2: note: Retur=
ning pointer (loaded from 'pi')
           return pi;
           ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2561:32: note: Retu=
rning from 'si_get_pi'
           struct si_power_info *si_pi =3D si_get_pi(adev);
                                         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2561:2: note: 'si_p=
i' initialized here
           struct si_power_info *si_pi =3D si_get_pi(adev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2569:6: note: Assum=
ing 'dte_data' is equal to NULL
           if (dte_data =3D=3D NULL)
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2569:2: note: Takin=
g true branch
           if (dte_data =3D=3D NULL)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2570:21: note: Acce=
ss to field 'enable_dte' results in a dereference of a null pointer (loaded=
 from variable 'si_pi')
                   si_pi->enable_dte =3D false;
                   ~~~~~             ^
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2927:5: warning: Va=
lue stored to 'smc_result' is never read [clang-analyzer-deadcode.DeadStore=
s]
                                   smc_result =3D amdgpu_si_send_msg_to_smc=
(adev, PPSMC_MSG_DisableDTE);
                                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2927:5: note: Value=
 stored to 'smc_result' is never read
                                   smc_result =3D amdgpu_si_send_msg_to_smc=
(adev, PPSMC_MSG_DisableDTE);
                                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2929:4: warning: Va=
lue stored to 'smc_result' is never read [clang-analyzer-deadcode.DeadStore=
s]
                           smc_result =3D amdgpu_si_send_msg_to_smc(adev, P=
PSMC_MSG_DisableCac);
                           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2929:4: note: Value=
 stored to 'smc_result' is never read
                           smc_result =3D amdgpu_si_send_msg_to_smc(adev, P=
PSMC_MSG_DisableCac);
                           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2934:5: warning: Va=
lue stored to 'smc_result' is never read [clang-analyzer-deadcode.DeadStore=
s]
                                   smc_result =3D amdgpu_si_send_msg_to_smc=
(adev, PPSMC_CACLongTermAvgDisable);
                                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2934:5: note: Value=
 stored to 'smc_result' is never read
                                   smc_result =3D amdgpu_si_send_msg_to_smc=
(adev, PPSMC_CACLongTermAvgDisable);
                                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:4668:7: warning: Va=
lue stored to 'voltage_found' is never read [clang-analyzer-deadcode.DeadSt=
ores]
                                                   voltage_found =3D true;
                                                   ^               ~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:4668:7: note: Value=
 stored to 'voltage_found' is never read
                                                   voltage_found =3D true;
                                                   ^               ~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/btrfs/ioctl.c:2078:3: warning: Value stored to 'i' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   i =3D nritems;
                   ^   ~~~~~~~
   fs/btrfs/ioctl.c:2078:3: note: Value stored to 'i' is never read
                   i =3D nritems;
                   ^   ~~~~~~~
   fs/btrfs/ioctl.c:2391:3: warning: Value stored to 'dirid' is never read =
[clang-analyzer-deadcode.DeadStores]
                   dirid =3D key.objectid;
                   ^       ~~~~~~~~~~~~
   fs/btrfs/ioctl.c:2391:3: note: Value stored to 'dirid' is never read
                   dirid =3D key.objectid;
                   ^       ~~~~~~~~~~~~
   fs/btrfs/ioctl.c:3272:8: warning: 3rd function call argument is an unini=
tialized value [clang-analyzer-core.CallAndMessage]
           ret =3D exclop_start_or_cancel_reloc(fs_info, BTRFS_EXCLOP_DEV_R=
EMOVE,
                 ^
   fs/btrfs/ioctl.c:4872:2: note: Control jumps to 'case 1342215179:'  at l=
ine 4907
           switch (cmd) {
           ^
   fs/btrfs/ioctl.c:4908:10: note: Calling 'btrfs_ioctl_rm_dev'
                   return btrfs_ioctl_rm_dev(file, argp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:3250:2: note: 'cancel' declared without an initial value
           bool cancel;
           ^~~~~~~~~~~
   fs/btrfs/ioctl.c:3252:7: note: Calling 'capable'
           if (!capable(CAP_SYS_ADMIN))
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/capability.h:235:2: note: Returning the value 1, which par=
ticipates in a condition later
           return true;
           ^~~~~~~~~~~
   fs/btrfs/ioctl.c:3252:7: note: Returning from 'capable'
           if (!capable(CAP_SYS_ADMIN))
                ^~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:3252:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   fs/btrfs/ioctl.c:3256:6: note: Calling 'IS_ERR'
           if (IS_ERR(vol_args))
               ^~~~~~~~~~~~~~~~
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
   fs/btrfs/ioctl.c:3256:6: note: Returning from 'IS_ERR'
           if (IS_ERR(vol_args))
               ^~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:3256:2: note: Taking false branch
           if (IS_ERR(vol_args))
           ^
   fs/btrfs/ioctl.c:3260:6: note: Assuming the condition is false
           if (!strcmp("cancel", vol_args->name)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:3260:2: note: Taking false branch
           if (!strcmp("cancel", vol_args->name)) {
           ^
   fs/btrfs/ioctl.c:3264:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   fs/btrfs/ioctl.c:3264:3: note: Taking false branch
                   if (ret)
                   ^
   fs/btrfs/ioctl.c:3269:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   fs/btrfs/ioctl.c:3269:2: note: Taking false branch
           if (ret)
           ^
   fs/btrfs/ioctl.c:3272:8: note: 3rd function call argument is an uninitia=
lized value
           ret =3D exclop_start_or_cancel_reloc(fs_info, BTRFS_EXCLOP_DEV_R=
EMOVE,
                 ^
   fs/btrfs/ioctl.c:4649:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(super_block->label, label);
           ^~~~~~
   fs/btrfs/ioctl.c:4649:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(super_block->label, label);
           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/ret +1463 drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c

a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1452  =

a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1453  static int kv_init_fps_limits(struct amdgpu_device *adev)
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1454  {
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1455  	struct kv_power_info *pi =3D kv_get_pi(adev);
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1456  	int ret =3D 0;
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1457  =

a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1458  	if (pi->caps_fps) {
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1459  		u16 tmp;
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1460  =

a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1461  		tmp =3D 45;
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1462  		pi->fps_high_t =3D cpu_to_be16(tmp);
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
 @1463  		ret =3D amdgpu_kv_copy_bytes_to_smc(adev,
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1464  					   pi->dpm_table_start +
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1465  					   offsetof(SMU7_Fusion_DpmTable, FpsHighT),
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1466  					   (u8 *)&pi->fps_high_t,
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1467  					   sizeof(u16), pi->sram_end);
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1468  =

a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1469  		tmp =3D 30;
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1470  		pi->fps_low_t =3D cpu_to_be16(tmp);
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1471  =

a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1472  		ret =3D amdgpu_kv_copy_bytes_to_smc(adev,
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1473  					   pi->dpm_table_start +
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1474  					   offsetof(SMU7_Fusion_DpmTable, FpsLowT),
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1475  					   (u8 *)&pi->fps_low_t,
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1476  					   sizeof(u16), pi->sram_end);
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1477  =

a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1478  	}
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1479  	return ret;
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1480  }
a2e73f56fa62824 drivers/gpu/drm/amd/amdgpu/kv_dpm.c Alex Deucher 2015-04-20=
  1481  =


:::::: The code at line 1463 was first introduced by commit
:::::: a2e73f56fa6282481927ec43aa9362c03c2e2104 drm/amdgpu: Add support for=
 CIK parts

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1323423865922884993==--

