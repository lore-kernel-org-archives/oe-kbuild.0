Content-Type: multipart/mixed; boundary="===============8550381771493933879=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 434/11713] drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2927:5: warning: Value stored to 'smc_result' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 10 Mar 2022 12:54:35 +0800
Message-ID: <202203101227.3bUx012G-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8550381771493933879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Evan Quan <evan.quan@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Lijo Lazar <lijo.lazar@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4e7a74a6856f8613dab9794da4b5cfb8fd54fb8c
commit: 837d542a09cd533055423dfca7e621a9c1d13c5b [434/11713] drm/amd/pm: re=
locate the power related headers
:::::: branch date: 17 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220302 (https://download.01.org/0day-ci/arc=
hive/20220310/202203101227.3bUx012G-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
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
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:6782:6: note:=
 Assuming field 'DSC' is 0
           if (!crtc_timing->flags.DSC)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:6782:2: note:=
 Taking true branch
           if (!crtc_timing->flags.DSC)
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:6783:3: note:=
 Calling 'decide_edp_link_settings'
                   decide_edp_link_settings(link, &link_setting, req_bw);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3930:6: note:=
 Assuming field 'raw' is >=3D DPCD_REV_13
           if (link->dpcd_caps.dpcd_rev.raw < DPCD_REV_13 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3930:6: note:=
 Left side of '||' is false
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3931:4: note:=
 Assuming field 'edp_supported_link_rates_count' is not equal to 0
                           link->dpcd_caps.edp_supported_link_rates_count =
=3D=3D 0) {
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3930:2: note:=
 Taking false branch
           if (link->dpcd_caps.dpcd_rev.raw < DPCD_REV_13 ||
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3948:9: note:=
 Assuming 'current_link_setting.link_rate' is > 'link->verified_link_cap.li=
nk_rate'
           while (current_link_setting.link_rate <=3D
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3948:2: note:=
 Loop condition is false. Execution continues on line 3974
           while (current_link_setting.link_rate <=3D
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3974:2: note:=
 Returning without writing to 'link_setting->link_rate'
           return false;
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:6783:3: note:=
 Returning from 'decide_edp_link_settings'
                   decide_edp_link_settings(link, &link_setting, req_bw);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:6787:62: note=
: The right operand of '!=3D' is a garbage value
           if (link->dpcd_caps.edp_supported_link_rates[link_rate_set] !=3D=
 link_setting.link_rate ||
                                                                       ^  ~=
~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (13 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
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
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2570:21: warning: A=
ccess to field 'enable_dte' results in a dereference of a null pointer (loa=
ded from variable 'si_pi') [clang-analyzer-core.NullDereference]
                   si_pi->enable_dte =3D false;
                   ~~~~~             ^
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
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:379:27: warning: The r=
esult of the left shift is undefined because the left operand is negative [=
clang-analyzer-core.UndefinedBinaryOperatorResult]
           timing[2] =3D (T(CWL) - 1) << 24 |
                                    ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:515:6: note: Assuming =
field 'state' is not equal to NVA3_TRAIN_ONCE
           if (ram->ltrain.state =3D=3D NVA3_TRAIN_ONCE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:515:2: note: Taking fa=
lse branch
           if (ram->ltrain.state =3D=3D NVA3_TRAIN_ONCE)
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:521:6: note: Assuming =
'data' is not equal to 0
           if (!data || ver !=3D 0x10 || hdr < 0x05) {
               ^~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:521:6: note: Left side=
 of '||' is false
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:521:15: note: Assuming=
 'ver' is equal to 16
           if (!data || ver !=3D 0x10 || hdr < 0x05) {
                        ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:521:6: note: Left side=
 of '||' is false
           if (!data || ver !=3D 0x10 || hdr < 0x05) {
               ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:521:30: note: Assuming=
 'hdr' is >=3D 5
           if (!data || ver !=3D 0x10 || hdr < 0x05) {
                                       ^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:521:2: note: Taking fa=
lse branch
           if (!data || ver !=3D 0x10 || hdr < 0x05) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:528:6: note: Assuming =
'strap' is < 'cnt'
           if (strap >=3D cnt) {
               ^~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:528:2: note: Taking fa=
lse branch
           if (strap >=3D cnt) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:535:6: note: Assuming =
'data' is not equal to 0
           if (!data || ver !=3D 0x10 || hdr < 0x09) {
               ^~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:535:6: note: Left side=
 of '||' is false
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:535:15: note: Assuming=
 'ver' is equal to 16
           if (!data || ver !=3D 0x10 || hdr < 0x09) {
                        ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:535:6: note: Left side=
 of '||' is false
           if (!data || ver !=3D 0x10 || hdr < 0x09) {
               ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:535:30: note: Assuming=
 'hdr' is >=3D 9
           if (!data || ver !=3D 0x10 || hdr < 0x09) {
                                       ^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:535:2: note: Taking fa=
lse branch
           if (!data || ver !=3D 0x10 || hdr < 0x09) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:541:6: note: Assuming =
field 'ramcfg_timing' is equal to 255
           if (next->bios.ramcfg_timing !=3D 0xff) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:541:2: note: Taking fa=
lse branch
           if (next->bios.ramcfg_timing !=3D 0xff) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:552:6: note: Assuming =
'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:552:2: note: Taking fa=
lse branch
           if (ret < 0) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:557:2: note: Calling '=
gt215_ram_timing_calc'
           gt215_ram_timing_calc(ram, timing);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:362:11: note: Assuming=
 field 'timing_10_CWL' is 0
           switch ((!T(CWL)) * ram->base.type) {
                    ^~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:362:2: note: 'Default'=
 branch taken. Execution continues on line 371
           switch ((!T(CWL)) * ram->base.type) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:376:7: note: Assuming =
'__UNIQUE_ID___x299' is <=3D '__UNIQUE_ID___y300'
                       max_t(u8,T(18), 1) << 16 |
                       ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:376:7: note: '?' condi=
tion is false
                       max_t(u8,T(18), 1) << 16 |
                       ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^

vim +/smc_result +2927 drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c

841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2892  =

841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2893  static int si_enable_smc_cac(struct amdgpu_device *adev,
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2894  			     struct amdgpu_ps *amdgpu_new_state,
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2895  			     bool enable)
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2896  {
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2897  	struct ni_power_info *ni_pi =3D ni_get_pi(adev);
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2898  	struct si_power_info *si_pi =3D si_get_pi(adev);
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2899  	PPSMC_Result smc_result;
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2900  	int ret =3D 0;
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2901  =

841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2902  	if (ni_pi->enable_cac) {
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2903  		if (enable) {
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2904  			if (!si_should_disable_uvd_powertune(adev, amdgpu_new_sta=
te)) {
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2905  				if (ni_pi->support_cac_long_term_average) {
6861c837e28e1b1 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Deucher        201=
6-09-13  2906  					smc_result =3D amdgpu_si_send_msg_to_smc(adev, PPSMC_CA=
CLongTermAvgEnable);
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2907  					if (smc_result !=3D PPSMC_Result_OK)
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2908  						ni_pi->support_cac_long_term_average =3D false;
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2909  				}
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2910  =

6861c837e28e1b1 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Deucher        201=
6-09-13  2911  				smc_result =3D amdgpu_si_send_msg_to_smc(adev, PPSMC_MSG=
_EnableCac);
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2912  				if (smc_result !=3D PPSMC_Result_OK) {
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2913  					ret =3D -EINVAL;
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2914  					ni_pi->cac_enabled =3D false;
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2915  				} else {
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2916  					ni_pi->cac_enabled =3D true;
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2917  				}
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2918  =

841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2919  				if (si_pi->enable_dte) {
6861c837e28e1b1 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Deucher        201=
6-09-13  2920  					smc_result =3D amdgpu_si_send_msg_to_smc(adev, PPSMC_MS=
G_EnableDTE);
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2921  					if (smc_result !=3D PPSMC_Result_OK)
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2922  						ret =3D -EINVAL;
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2923  				}
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2924  			}
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2925  		} else if (ni_pi->cac_enabled) {
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2926  			if (si_pi->enable_dte)
6861c837e28e1b1 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Deucher        201=
6-09-13 @2927  				smc_result =3D amdgpu_si_send_msg_to_smc(adev, PPSMC_MSG=
_DisableDTE);
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2928  =

6861c837e28e1b1 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Deucher        201=
6-09-13 @2929  			smc_result =3D amdgpu_si_send_msg_to_smc(adev, PPSMC_MSG_=
DisableCac);
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2930  =

841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2931  			ni_pi->cac_enabled =3D false;
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2932  =

841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2933  			if (ni_pi->support_cac_long_term_average)
6861c837e28e1b1 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Deucher        201=
6-09-13  2934  				smc_result =3D amdgpu_si_send_msg_to_smc(adev, PPSMC_CAC=
LongTermAvgDisable);
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2935  		}
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2936  	}
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2937  	return ret;
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2938  }
841686df9f7d294 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 201=
6-08-01  2939  =


:::::: The code at line 2927 was first introduced by commit
:::::: 6861c837e28e1b1300a1b24ddab748c8ee50da3b drm/amdgpu/si/dpm: fix symb=
ol conflicts with radeon

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8550381771493933879==--

