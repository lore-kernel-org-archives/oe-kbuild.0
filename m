Content-Type: multipart/mixed; boundary="===============1365208867516470839=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 436/13576] drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2927:5: warning: Value stored to 'smc_result' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 20 Mar 2022 07:57:21 +0800
Message-ID: <202203200715.QV3vyi8I-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1365208867516470839==
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
head:   6d72dda014a4753974eb08950089ddf71fec4f60
commit: 837d542a09cd533055423dfca7e621a9c1d13c5b [436/13576] drm/amd/pm: re=
locate the power related headers
:::::: branch date: 2 days ago
:::::: commit date: 9 weeks ago
config: riscv-randconfig-c006-20220310 (https://download.01.org/0day-ci/arc=
hive/20220320/202203200715.QV3vyi8I-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
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
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_bo_api.h:240:6: note: Assuming the condition is true
           if (!kref_get_unless_zero(&bo->kref))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_bo_api.h:240:2: note: Taking true branch
           if (!kref_get_unless_zero(&bo->kref))
           ^
   include/drm/ttm/ttm_bo_api.h:241:3: note: Returning null pointer, which =
participates in a condition later
                   return NULL;
                   ^~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo.c:693:9: note: Returning from 'ttm_bo_get_unl=
ess_zero'
                           if (!ttm_bo_get_unless_zero(bo)) {
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo.c:693:4: note: Taking true branch
                           if (!ttm_bo_get_unless_zero(bo)) {
                           ^
   drivers/gpu/drm/ttm/ttm_bo.c:694:9: note: Assuming 'locked' is false
                                   if (locked)
                                       ^~~~~~
   drivers/gpu/drm/ttm/ttm_bo.c:694:5: note: Taking false branch
                                   if (locked)
                                   ^
   drivers/gpu/drm/ttm/ttm_bo.c:696:5: note:  Execution continues on line 6=
82
                                   continue;
                                   ^
   drivers/gpu/drm/ttm/ttm_bo.c:682:3: note: Dereference of null pointer
                   list_for_each_entry(bo, &man->lru[i], lru) {
                   ^
   include/linux/list.h:632:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
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
   Suppressed 8 warnings (8 in non-user code).
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
   drivers/video/backlight/adp8860_bl.c:230:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D adp8860_write(client, ADP8860_ISCFR, pdata->led_fade_law=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/adp8860_bl.c:230:2: note: Value stored to 'ret' =
is never read
           ret =3D adp8860_write(client, ADP8860_ISCFR, pdata->led_fade_law=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:439:3: warn=
ing: Value stored to 'id' is never read [clang-analyzer-deadcode.DeadStores]
                   id =3D GPIO_ID_HPD;
                   ^    ~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:439:3: note=
: Value stored to 'id' is never read
                   id =3D GPIO_ID_HPD;
                   ^    ~~~~~~~~~~~
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
   3 warnings generated.
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
   5 warnings generated.
   drivers/media/v4l2-core/v4l2-mc.c:176:4: warning: Value stored to 'if_au=
d' is never read [clang-analyzer-deadcode.DeadStores]
                           if_aud =3D tuner;
                           ^        ~~~~~
   drivers/media/v4l2-core/v4l2-mc.c:176:4: note: Value stored to 'if_aud' =
is never read
                           if_aud =3D tuner;
                           ^        ~~~~~
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
   drivers/media/v4l2-core/v4l2-async.c:447:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D
                          ^~~
   drivers/media/v4l2-core/v4l2-async.c:447:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D
                          ^~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:277:13=
: note: Assuming the condition is false
           } else if (last_render_time_in_us > (max_render_time_in_us + in_=
out_vrr->btr.margin_in_us / 2)) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:277:9:=
 note: Taking false branch
           } else if (last_render_time_in_us > (max_render_time_in_us + in_=
out_vrr->btr.margin_in_us / 2)) {
                  ^
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:285:6:=
 note: Assuming field 'btr_active' is true
           if (!in_out_vrr->btr.btr_active) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:285:2:=
 note: Taking false branch
           if (!in_out_vrr->btr.btr_active) {
           ^
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:307:7:=
 note: Assuming 'mid_point_frames_ceil' is > 0
                   if (mid_point_frames_ceil > 0) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:307:3:=
 note: Taking true branch
                   if (mid_point_frames_ceil > 0) {
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:311:6:=
 note: Assuming 'frame_time_in_us' is >=3D field 'mid_point_in_us'
                                   (in_out_vrr->btr.mid_point_in_us >
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:311:5:=
 note: '?' condition is false
                                   (in_out_vrr->btr.mid_point_in_us >
                                   ^
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:320:3:=
 note: Value assigned to 'mid_point_frames_floor'
                   mid_point_frames_floor =3D last_render_time_in_us /
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:323:7:=
 note: Assuming 'mid_point_frames_floor' is <=3D 0
                   if (mid_point_frames_floor > 0) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:323:3:=
 note: Taking false branch
                   if (mid_point_frames_floor > 0) {
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:339:7:=
 note: Assuming the condition is true
                   if ((last_render_time_in_us / mid_point_frames_ceil) < i=
n_out_vrr->min_duration_in_us) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:339:3:=
 note: Taking true branch
                   if ((last_render_time_in_us / mid_point_frames_ceil) < i=
n_out_vrr->min_duration_in_us) {
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:344:4:=
 note: The value 0 is assigned to 'frames_to_insert'
                           frames_to_insert =3D mid_point_frames_floor;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:367:7:=
 note: Assuming 'delta_from_mid_point_in_us_1' is >=3D 'delta_from_mid_poin=
t_in_us_2'
                   if (delta_from_mid_point_in_us_1 < delta_from_mid_point_=
in_us_2) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:367:3:=
 note: Taking false branch
                   if (delta_from_mid_point_in_us_1 < delta_from_mid_point_=
in_us_2) {
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:374:7:=
 note: Assuming field 'frames_to_insert' is equal to 0
                   if (in_out_vrr->btr.frames_to_insert !=3D 0 &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:374:45=
: note: Left side of '&&' is false
                   if (in_out_vrr->btr.frames_to_insert !=3D 0 &&
                                                             ^
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:386:30=
: note: Division by zero
                   if (last_render_time_in_us / frames_to_insert <
                       ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:1168:3=
: warning: Value stored to 'average_render_time_in_us' is never read [clang=
-analyzer-deadcode.DeadStores]
                   average_render_time_in_us /=3D DC_PLANE_UPDATE_TIMES_MAX;
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:1168:3=
: note: Value stored to 'average_render_time_in_us' is never read
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
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
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
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
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).

vim +/smc_result +2927 drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c

841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2892  =

841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2893  static int si_enable_smc_cac(struct amdgpu_device *adev,
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2894  			     struct amdgpu_ps *amdgpu_new_state,
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2895  			     bool enable)
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2896  {
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2897  	struct ni_power_info *ni_pi =3D ni_get_pi(adev);
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2898  	struct si_power_info *si_pi =3D si_get_pi(adev);
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2899  	PPSMC_Result smc_result;
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2900  	int ret =3D 0;
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2901  =

841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2902  	if (ni_pi->enable_cac) {
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2903  		if (enable) {
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2904  			if (!si_should_disable_uvd_powertune(adev, amdgpu_new_stat=
e)) {
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2905  				if (ni_pi->support_cac_long_term_average) {
6861c837e28e1b drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Deucher        2016=
-09-13  2906  					smc_result =3D amdgpu_si_send_msg_to_smc(adev, PPSMC_CAC=
LongTermAvgEnable);
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2907  					if (smc_result !=3D PPSMC_Result_OK)
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2908  						ni_pi->support_cac_long_term_average =3D false;
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2909  				}
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2910  =

6861c837e28e1b drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Deucher        2016=
-09-13  2911  				smc_result =3D amdgpu_si_send_msg_to_smc(adev, PPSMC_MSG_=
EnableCac);
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2912  				if (smc_result !=3D PPSMC_Result_OK) {
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2913  					ret =3D -EINVAL;
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2914  					ni_pi->cac_enabled =3D false;
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2915  				} else {
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2916  					ni_pi->cac_enabled =3D true;
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2917  				}
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2918  =

841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2919  				if (si_pi->enable_dte) {
6861c837e28e1b drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Deucher        2016=
-09-13  2920  					smc_result =3D amdgpu_si_send_msg_to_smc(adev, PPSMC_MSG=
_EnableDTE);
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2921  					if (smc_result !=3D PPSMC_Result_OK)
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2922  						ret =3D -EINVAL;
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2923  				}
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2924  			}
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2925  		} else if (ni_pi->cac_enabled) {
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2926  			if (si_pi->enable_dte)
6861c837e28e1b drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Deucher        2016=
-09-13 @2927  				smc_result =3D amdgpu_si_send_msg_to_smc(adev, PPSMC_MSG_=
DisableDTE);
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2928  =

6861c837e28e1b drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Deucher        2016=
-09-13  2929  			smc_result =3D amdgpu_si_send_msg_to_smc(adev, PPSMC_MSG_D=
isableCac);
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2930  =

841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2931  			ni_pi->cac_enabled =3D false;
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2932  =

841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2933  			if (ni_pi->support_cac_long_term_average)
6861c837e28e1b drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Deucher        2016=
-09-13  2934  				smc_result =3D amdgpu_si_send_msg_to_smc(adev, PPSMC_CACL=
ongTermAvgDisable);
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2935  		}
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2936  	}
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2937  	return ret;
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2938  }
841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  2939  =


:::::: The code at line 2927 was first introduced by commit
:::::: 6861c837e28e1b1300a1b24ddab748c8ee50da3b drm/amdgpu/si/dpm: fix symb=
ol conflicts with radeon

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1365208867516470839==--

