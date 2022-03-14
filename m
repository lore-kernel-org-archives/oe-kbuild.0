Content-Type: multipart/mixed; boundary="===============3986782162593849919=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 434/11953] drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2927:5: warning: Value stored to 'smc_result' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 14 Mar 2022 11:51:49 +0800
Message-ID: <202203141106.91ToFPZT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3986782162593849919==
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
head:   71941773e143369a73c9c4a3b62fbb60736a1182
commit: 837d542a09cd533055423dfca7e621a9c1d13c5b [434/11953] drm/amd/pm: re=
locate the power related headers
:::::: branch date: 4 days ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220310 (https://download.01.org/0day-ci/arc=
hive/20220314/202203141106.91ToFPZT-lkp(a)intel.com/config)
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_mem_input_v.c:79:=
2: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.D=
eadStores]
           temp =3D 0;
           ^      ~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_mem_input_v.c:79:=
2: note: Value stored to 'temp' is never read
           temp =3D 0;
           ^      ~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_mem_input_v.c:115=
:2: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.=
DeadStores]
           temp =3D 0;
           ^      ~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_mem_input_v.c:115=
:2: note: Value stored to 'temp' is never read
           temp =3D 0;
           ^      ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   lib/rbtree_test.c:309:3: warning: Value stored to 'node' is never read [=
clang-analyzer-deadcode.DeadStores]
                   node =3D rb_first(&root.rb_root);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~
   lib/rbtree_test.c:309:3: note: Value stored to 'node' is never read
                   node =3D rb_first(&root.rb_root);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~
   lib/rbtree_test.c:321:3: warning: Value stored to 'node' is never read [=
clang-analyzer-deadcode.DeadStores]
                   node =3D rb_first_cached(&root);
                   ^
   lib/rbtree_test.c:321:3: note: Value stored to 'node' is never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   lib/percpu_test.c:115:2: warning: Value stored to 'ul' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           ul =3D 3;
           ^    ~
   lib/percpu_test.c:115:2: note: Value stored to 'ul' is never read
           ul =3D 3;
           ^    ~
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
   8 warnings generated.
   drivers/gpu/drm/mgag200/mgag200_mode.c:98:2: warning: Value stored to 's=
tatus' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D 0;
           ^        ~
   drivers/gpu/drm/mgag200/mgag200_mode.c:98:2: note: Value stored to 'stat=
us' is never read
           status =3D 0;
           ^        ~
   drivers/gpu/drm/mgag200/mgag200_mode.c:220:21: warning: Value stored to =
'dev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_mode.c:220:21: note: Value stored to 'de=
v' during its initialization is never read
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_mode.c:480:21: warning: Value stored to =
'dev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_mode.c:480:21: note: Value stored to 'de=
v' during its initialization is never read
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/gpu/drm/mgag200/mgag200_pll.c:204:14: warning: Although the valu=
e stored to 's' is used in the enclosing expression, the value is never act=
ually read from 's' [clang-analyzer-deadcode.DeadStores]
           m =3D n =3D p =3D s =3D 0;
                       ^   ~
   drivers/gpu/drm/mgag200/mgag200_pll.c:204:14: note: Although the value s=
tored to 's' is used in the enclosing expression, the value is never actual=
ly read from 's'
           m =3D n =3D p =3D s =3D 0;
                       ^   ~
   drivers/gpu/drm/mgag200/mgag200_pll.c:953:21: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_pll.c:953:21: note: Value stored to 'dev=
' during its initialization is never read
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/savage/savage_bci.c:271:14: warning: Access to field 'ne=
xt' results in a dereference of a null pointer (loaded from variable 'prev'=
) [clang-analyzer-core.NullDereference]
                   prev->next =3D next;
                              ^
   drivers/gpu/drm/savage/savage_bci.c:1011:2: note: Assuming the condition=
 is false
           LOCK_TEST_WITH_RETURN(dev, file_priv);
           ^
   include/drm/drm_legacy.h:196:6: note: expanded from macro 'LOCK_TEST_WIT=
H_RETURN'
           if (!_DRM_LOCK_IS_HELD(_file_priv->master->lock.hw_lock->lock) |=
|       \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/savage/savage_bci.c:1011:2: note: Left side of '||' is f=
alse
           LOCK_TEST_WITH_RETURN(dev, file_priv);
           ^
   include/drm/drm_legacy.h:196:6: note: expanded from macro 'LOCK_TEST_WIT=
H_RETURN'
           if (!_DRM_LOCK_IS_HELD(_file_priv->master->lock.hw_lock->lock) |=
|       \
               ^
   drivers/gpu/drm/savage/savage_bci.c:1011:29: note: Assuming 'file_priv' =
is equal to field 'file_priv'
           LOCK_TEST_WITH_RETURN(dev, file_priv);
                                      ^
   include/drm/drm_legacy.h:197:6: note: expanded from macro 'LOCK_TEST_WIT=
H_RETURN'
               _file_priv->master->lock.file_priv !=3D _file_priv)   {     =
          \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/savage/savage_bci.c:1011:2: note: Taking false branch
           LOCK_TEST_WITH_RETURN(dev, file_priv);
           ^
   include/drm/drm_legacy.h:196:2: note: expanded from macro 'LOCK_TEST_WIT=
H_RETURN'
           if (!_DRM_LOCK_IS_HELD(_file_priv->master->lock.hw_lock->lock) |=
|       \
           ^
   drivers/gpu/drm/savage/savage_bci.c:1011:2: note: Loop condition is fals=
e.  Exiting loop
           LOCK_TEST_WITH_RETURN(dev, file_priv);
           ^
   include/drm/drm_legacy.h:194:53: note: expanded from macro 'LOCK_TEST_WI=
TH_RETURN'
   #define LOCK_TEST_WITH_RETURN( dev, _file_priv )                        =
        \
                                                                           =
        ^
   drivers/gpu/drm/savage/savage_bci.c:1015:6: note: Assuming field 'send_c=
ount' is equal to 0
           if (d->send_count !=3D 0) {
               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/savage/savage_bci.c:1015:2: note: Taking false branch
           if (d->send_count !=3D 0) {
           ^
   drivers/gpu/drm/savage/savage_bci.c:1023:6: note: Assuming field 'reques=
t_count' is >=3D 0
           if (d->request_count < 0 || d->request_count > dma->buf_count) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/savage/savage_bci.c:1023:6: note: Left side of '||' is f=
alse
   drivers/gpu/drm/savage/savage_bci.c:1023:30: note: Assuming field 'reque=
st_count' is <=3D field 'buf_count'
           if (d->request_count < 0 || d->request_count > dma->buf_count) {
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/savage/savage_bci.c:1023:2: note: Taking false branch
           if (d->request_count < 0 || d->request_count > dma->buf_count) {
           ^
   drivers/gpu/drm/savage/savage_bci.c:1031:6: note: Assuming field 'reques=
t_count' is not equal to 0
--
                           ^
   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1499:45: note: The value 2 is ass=
igned to 'i'
                   for (i =3D 0; i < adev->sdma.num_instances; i++) {
                                                             ^~~
   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1499:15: note: Assuming 'i' is < =
field 'num_instances'
                   for (i =3D 0; i < adev->sdma.num_instances; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1499:3: note: Loop condition is t=
rue.  Entering loop body
                   for (i =3D 0; i < adev->sdma.num_instances; i++) {
                   ^
   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1500:44: note: The right operand =
of '+' is a garbage value due to array index out of bounds
                           temp =3D data =3D RREG32(mmSDMA0_POWER_CNTL + sd=
ma_offsets[i]);
                                                                   ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:1174:47: note: expanded fr=
om macro 'RREG32'
   #define RREG32(reg) amdgpu_device_rreg(adev, (reg), 0)
                                                 ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/ubifs/recovery.c:570:8: warning: Use of memory after it is freed [cla=
ng-analyzer-unix.Malloc]
                   ch =3D snod->node;
                        ^~~~~~~~~~
   fs/ubifs/recovery.c:564:2: note: Loop condition is true.  Entering loop =
body
           while (!list_empty(&sleb->nodes)) {
           ^
   fs/ubifs/recovery.c:571:7: note: Assuming field 'group_type' is equal to=
 UBIFS_IN_NODE_GROUP
                   if (ch->group_type !=3D UBIFS_IN_NODE_GROUP)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/recovery.c:571:3: note: Taking false branch
                   if (ch->group_type !=3D UBIFS_IN_NODE_GROUP)
                   ^
   fs/ubifs/recovery.c:574:3: note: Taking false branch
                   dbg_rcvry("dropping grouped node at %d:%d",
                   ^
   fs/ubifs/debug.h:200:29: note: expanded from macro 'dbg_rcvry'
   #define dbg_rcvry(fmt, ...) ubifs_dbg_msg("rcvry", fmt, ##__VA_ARGS__)
                               ^
   fs/ubifs/debug.h:158:2: note: expanded from macro 'ubifs_dbg_msg'
           pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid,=
       \
           ^
   include/linux/printk.h:580:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ubifs/recovery.c:578:3: note: Memory is released
                   kfree(snod);
                   ^~~~~~~~~~~
   fs/ubifs/recovery.c:564:2: note: Loop condition is true.  Entering loop =
body
           while (!list_empty(&sleb->nodes)) {
           ^
   fs/ubifs/recovery.c:570:8: note: Use of memory after it is freed
                   ch =3D snod->node;
                        ^~~~~~~~~~
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/radeon/kv_dpm.c:1190:3: warning: Value stored to 'ret' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D kv_copy_bytes_to_smc(rdev,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/kv_dpm.c:1190:3: note: Value stored to 'ret' is n=
ever read

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
6-09-13  2929  			smc_result =3D amdgpu_si_send_msg_to_smc(adev, PPSMC_MSG_=
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
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3986782162593849919==--

