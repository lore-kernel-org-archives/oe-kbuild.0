Content-Type: multipart/mixed; boundary="===============8017534434099869072=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/nouveau/nouveau_bo.c:1327:2: warning: Value stored to 'dev' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 28 Sep 2021 19:27:06 +0800
Message-ID: <202109281901.LErRhgpr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8017534434099869072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0513e464f9007b70b96740271a948ca5ab6e7dd7
commit: 512bce50a41c528fa15c4c014293e7bebf018658 Merge v5.10-rc3 into drm-n=
ext
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20210927 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8d=
fdfe7efecfda318d43a06fae18b40eb498)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D512bce50a41c528fa15c4c014293e7bebf018658
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 512bce50a41c528fa15c4c014293e7bebf018658
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   drivers/leds/leds-pwm.c:111:15: warning: Access to field 'name' results =
in a dereference of a null pointer [clang-analyzer-core.NullDereference]
                           led.name =3D to_of_node(fwnode)->name;
                                      ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/leds/leds-pwm.c:141:6: note: Assuming 'count' is not equal to 0
           if (!count)
               ^~~~~~
   drivers/leds/leds-pwm.c:141:2: note: Taking false branch
           if (!count)
           ^
   drivers/leds/leds-pwm.c:146:6: note: Assuming 'priv' is non-null
           if (!priv)
               ^~~~~
   drivers/leds/leds-pwm.c:146:2: note: Taking false branch
           if (!priv)
           ^
   drivers/leds/leds-pwm.c:149:8: note: Calling 'led_pwm_create_fwnode'
           ret =3D led_pwm_create_fwnode(&pdev->dev, priv);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pwm.c:108:2: note: Loop condition is true.  Entering l=
oop body
           device_for_each_child_node(dev, fwnode) {
           ^
   include/linux/property.h:108:2: note: expanded from macro 'device_for_ea=
ch_child_node'
           for (child =3D device_get_next_child_node(dev, NULL); child;    =
  \
           ^
   drivers/leds/leds-pwm.c:110:7: note: Assuming 'ret' is not equal to 0
                   if (ret && is_of_node(fwnode))
                       ^~~
   drivers/leds/leds-pwm.c:110:7: note: Left side of '&&' is true
   drivers/leds/leds-pwm.c:110:14: note: Assuming the condition is true
                   if (ret && is_of_node(fwnode))
                              ^~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pwm.c:110:3: note: Taking true branch
                   if (ret && is_of_node(fwnode))
                   ^
   drivers/leds/leds-pwm.c:111:15: note: Assuming the condition is false
                           led.name =3D to_of_node(fwnode)->name;
                                      ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pwm.c:111:15: note: '?' condition is false
                           led.name =3D to_of_node(fwnode)->name;
                                      ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/leds/leds-pwm.c:111:15: note: Access to field 'name' results in =
a dereference of a null pointer
                           led.name =3D to_of_node(fwnode)->name;
                                      ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   Suppressed 5 warnings (5 in non-user code).
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
   13 warnings generated.
   drivers/gpu/drm/nouveau/nouveau_bo.c:1228:10: warning: The left operand =
of '=3D=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperator=
Result]
           if (ret =3D=3D -ENOSPC) {
               ~~~ ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:1146:2: note: 'ret' declared withou=
t an initial value
           int ret;
           ^~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:1150:2: note: Control jumps to 'cas=
e 2:'  at line 1171
           switch (reg->mem_type) {
           ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:1177:7: note: Assuming field 'famil=
y' is < NV_DEVICE_INFO_V0_TESLA
                   if (drm->client.device.info.family >=3D NV_DEVICE_INFO_V=
0_TESLA &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:1177:65: note: Left side of '&&' is=
 false
                   if (drm->client.device.info.family >=3D NV_DEVICE_INFO_V=
0_TESLA &&
                                                                           =
      ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:1183:7: note: Assuming field 'oclas=
s' is < NVIF_CLASS_MEM_NV50
                   if (drm->client.mem->oclass >=3D NVIF_CLASS_MEM_NV50) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:1183:3: note: Taking false branch
                   if (drm->client.mem->oclass >=3D NVIF_CLASS_MEM_NV50) {
                   ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:1222:3: note:  Execution continues =
on line 1228
                   break;
                   ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:1228:10: note: The left operand of =
'=3D=3D' is a garbage value
           if (ret =3D=3D -ENOSPC) {
               ~~~ ^
>> drivers/gpu/drm/nouveau/nouveau_bo.c:1327:2: warning: Value stored to 'd=
ev' is never read [clang-analyzer-deadcode.DeadStores]
           dev =3D drm->dev->dev;
           ^     ~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:1327:2: note: Value stored to 'dev'=
 is never read
           dev =3D drm->dev->dev;
           ^     ~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:1344:2: warning: Value stored to 'd=
ev' is never read [clang-analyzer-deadcode.DeadStores]
           dev =3D drm->dev->dev;
           ^     ~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:1344:2: note: Value stored to 'dev'=
 is never read
           dev =3D drm->dev->dev;
           ^     ~~~~~~~~~~~~~
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:55:6: warning: Value stored to =
'page_count' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           u32 page_count =3D new_reg->num_pages;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:55:6: note: Value stored to 'pa=
ge_count' during its initialization is never read
           u32 page_count =3D new_reg->num_pages;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
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
   9 warnings generated.
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/media/cec/core/cec-api.c:637:29: note: Left side of '&&' is false
           struct cec_adapter *adap =3D to_cec_adapter(devnode);
                                      ^
   drivers/media/cec/core/cec-priv.h:21:30: note: expanded from macro 'to_c=
ec_adapter'
   #define to_cec_adapter(node) container_of(node, struct cec_adapter, devn=
ode)
                                ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/cec/core/cec-api.c:637:29: note: Taking false branch
           struct cec_adapter *adap =3D to_cec_adapter(devnode);
                                      ^
   drivers/media/cec/core/cec-priv.h:21:30: note: expanded from macro 'to_c=
ec_adapter'
   #define to_cec_adapter(node) container_of(node, struct cec_adapter, devn=
ode)
                                ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:319:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:299:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/cec/core/cec-api.c:637:29: note: Loop condition is false. =
 Exiting loop
           struct cec_adapter *adap =3D to_cec_adapter(devnode);
                                      ^
   drivers/media/cec/core/cec-priv.h:21:30: note: expanded from macro 'to_c=
ec_adapter'
   #define to_cec_adapter(node) container_of(node, struct cec_adapter, devn=
ode)
                                ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:319:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/media/cec/core/cec-api.c:642:6: note: Assuming 'fh' is equal to =
field 'cec_initiator'
           if (adap->cec_initiator =3D=3D fh)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:642:2: note: Taking true branch
           if (adap->cec_initiator =3D=3D fh)
           ^
   drivers/media/cec/core/cec-api.c:644:6: note: Assuming 'fh' is equal to =
field 'cec_follower'
           if (adap->cec_follower =3D=3D fh) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:644:2: note: Taking true branch
           if (adap->cec_follower =3D=3D fh) {
           ^
   drivers/media/cec/core/cec-api.c:648:6: note: Assuming the condition is =
false
           if (fh->mode_follower =3D=3D CEC_MODE_FOLLOWER)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:648:2: note: Taking false branch
           if (fh->mode_follower =3D=3D CEC_MODE_FOLLOWER)
--
   include/linux/compiler_types.h:297:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/ubifs/super.c:1176:3: note: Calling 'list_del'
                   list_del(&ucleb->list);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:135:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/clocksource/timer-of.c:191:3: warning: Value stored to 'flags' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   flags |=3D TIMER_OF_IRQ;
                   ^
   drivers/clocksource/timer-of.c:191:3: note: Value stored to 'flags' is n=
ever read
   Suppressed 5 warnings (5 in non-user code).
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
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:734:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm1));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:734:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm1));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:738:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm2));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:738:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm2));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:742:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm3));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:742:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm3));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:746:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm4));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:746:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm4));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:750:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm5));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:750:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm5));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:754:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm6));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:754:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm6));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:758:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm7));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:758:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm7));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:763:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(1);
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:763:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(1);
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:994:2: war=
ning: Value stored to 'fA_Term' is never read [clang-analyzer-deadcode.Dead=
Stores]
           fA_Term =3D fAdd(fMargin_RO_a, fAdd(fMultiply(fSM_A4, fSclk), fS=
M_A5));
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:994:2: not=
e: Value stored to 'fA_Term' is never read
           fA_Term =3D fAdd(fMargin_RO_a, fAdd(fMultiply(fSM_A4, fSclk), fS=
M_A5));
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:995:2: war=
ning: Value stored to 'fB_Term' is never read [clang-analyzer-deadcode.Dead=
Stores]
           fB_Term =3D fAdd(fAdd(fMultiply(fSM_A2, fSclk), fSM_A6), fMargin=
_RO_b);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:995:2: not=
e: Value stored to 'fB_Term' is never read
           fB_Term =3D fAdd(fAdd(fMultiply(fSM_A2, fSclk), fSM_A6), fMargin=
_RO_b);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:996:2: war=
ning: Value stored to 'fC_Term' is never read [clang-analyzer-deadcode.Dead=
Stores]
           fC_Term =3D fAdd(fMargin_RO_c,
           ^         ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:996:2: not=
e: Value stored to 'fC_Term' is never read
           fC_Term =3D fAdd(fMargin_RO_c,
           ^         ~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:1661:2: wa=
rning: Value stored to 'table_address' is never read [clang-analyzer-deadco=
de.DeadStores]
           table_address +=3D offset;
           ^                ~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:1661:2: no=
te: Value stored to 'table_address' is never read
           table_address +=3D offset;
           ^                ~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppevvmath.h:223:18: war=
ning: The result of the left shift is undefined because the left operand is=
 negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   temp.full =3D (X << SHIFT_AMOUNT);
                                  ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:718:6: not=
e: Assuming 'getASICProfilingInfo' is non-null
           if (!getASICProfilingInfo)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:718:2: not=
e: Taking false branch
           if (!getASICProfilingInfo)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:721:6: not=
e: Assuming field 'ucTableFormatRevision' is >=3D 3
           if (getASICProfilingInfo->asHeader.ucTableFormatRevision < 3 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:721:6: not=
e: Left side of '||' is false
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:722:7: not=
e: Assuming field 'ucTableFormatRevision' is not equal to 3
               (getASICProfilingInfo->asHeader.ucTableFormatRevision =3D=3D=
 3 &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:722:65: no=
te: Left side of '&&' is false
               (getASICProfilingInfo->asHeader.ucTableFormatRevision =3D=3D=
 3 &&
                                                                          ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:732:2: not=
e: Control jumps to the 'default' case at line 761
           switch (dpm_level) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:784:6: not=
e: Assuming 'result' is 0
           if (result)
               ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:784:2: not=
e: Taking false branch
           if (result)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:805:6: not=
e: Assuming 'result' is 0
           if (result)
               ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:805:2: not=
e: Taking false branch
           if (result)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:825:6: not=
e: Assuming 'result' is 0
           if (result)
               ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:825:2: not=
e: Taking false branch
           if (result)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:846:6: not=
e: Assuming 'result' is 0
           if (result)
               ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:846:2: not=
e: Taking false branch
           if (result)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:853:19: no=
te: Calling 'fDecodeLogisticFuse'
           fKt_Beta_fused =3D fDecodeLogisticFuse(ul_Kt_Beta_fused,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppevvmath.h:192:44: not=
e: Passing the value -13 via 1st parameter 'X'
           fInt f_CONSTANT_NEG13 =3D ConvertToFraction(-13);
                                                     ^~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppevvmath.h:192:26: not=
e: Calling 'ConvertToFraction'
           fInt f_CONSTANT_NEG13 =3D ConvertToFraction(-13);
                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppevvmath.h:222:2: note=
: Taking true branch
           if (X <=3D MAX)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppevvmath.h:223:18: not=
e: The result of the left shift is undefined because the left operand is ne=
gative
                   temp.full =3D (X << SHIFT_AMOUNT);
                                ~ ^
   Suppressed 49 warnings (10 in non-user code, 39 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   7 warnings generated.
   include/asm-generic/bitops/non-atomic.h:21:6: warning: The left expressi=
on of the compound assignment is an uninitialized value. The computed value=
 will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p  |=3D mask;
               ^
   crypto/lrw.c:82:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   crypto/lrw.c:82:2: note: Taking false branch
           if (err)
           ^
   crypto/lrw.c:85:6: note: Assuming field 'table' is null
           if (ctx->table)
               ^~~~~~~~~~
   crypto/lrw.c:85:2: note: Taking false branch
           if (ctx->table)
           ^
   crypto/lrw.c:90:6: note: Assuming field 'table' is non-null
           if (!ctx->table)
               ^~~~~~~~~~~
   crypto/lrw.c:90:2: note: Taking false branch
--
           tmp =3D RREG32(BIF_SCRATCH0);
           ^
   drivers/gpu/drm/radeon/r600.c:1862:2: note: Value stored to 'tmp' is nev=
er read
   drivers/gpu/drm/radeon/r600.c:2572:3: warning: Value stored to 'err' is =
never read [clang-analyzer-deadcode.DeadStores]
                   err =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/gpu/drm/radeon/r600.c:2572:3: note: Value stored to 'err' is nev=
er read
                   err =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/gpu/drm/radeon/r600.c:4396:3: warning: Value stored to 'tmp' is =
never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D readl((void __iomem *)ptr);
                   ^
   drivers/gpu/drm/radeon/r600.c:4396:3: note: Value stored to 'tmp' is nev=
er read
   Suppressed 12 warnings (7 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/splice.c:722:2: warning: Undefined or garbage value returned to calle=
r [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   fs/splice.c:630:2: note: 'ret' declared without an initial value
           ssize_t ret;
           ^~~~~~~~~~~
   fs/splice.c:632:15: note: Assuming 'array' is non-null
           if (unlikely(!array))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/splice.c:632:2: note: Taking false branch
           if (unlikely(!array))
           ^
   fs/splice.c:638:2: note: Loop condition is false. Execution continues on=
 line 714
           while (sd.total_len) {
           ^
   fs/splice.c:719:9: note: Field 'num_spliced' is 0
           if (sd.num_spliced)
                  ^
   fs/splice.c:719:2: note: Taking false branch
           if (sd.num_spliced)
           ^
   fs/splice.c:722:2: note: Undefined or garbage value returned to caller
           return ret;
           ^      ~~~
   fs/splice.c:845:2: warning: Value stored to 'ret' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/splice.c:845:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
   Suppressed 8 warnings (8 in non-user code).
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
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
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
   13 warnings generated.
   drivers/gpu/drm/nouveau/nouveau_bo.c:1228:10: warning: The left operand =
of '=3D=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperator=
Result]
           if (ret =3D=3D -ENOSPC) {
               ~~~ ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:1146:2: note: 'ret' declared withou=
t an initial value
           int ret;
           ^~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:1150:2: note: Control jumps to 'cas=
e 2:'  at line 1171
           switch (reg->mem_type) {
           ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:1177:7: note: Assuming field 'famil=
y' is < NV_DEVICE_INFO_V0_TESLA
                   if (drm->client.device.info.family >=3D NV_DEVICE_INFO_V=
0_TESLA &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:1177:65: note: Left side of '&&' is=
 false
                   if (drm->client.device.info.family >=3D NV_DEVICE_INFO_V=
0_TESLA &&
                                                                           =
      ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:1183:7: note: Assuming field 'oclas=
s' is < NVIF_CLASS_MEM_NV50
                   if (drm->client.mem->oclass >=3D NVIF_CLASS_MEM_NV50) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:1183:3: note: Taking false branch
                   if (drm->client.mem->oclass >=3D NVIF_CLASS_MEM_NV50) {
                   ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:1222:3: note:  Execution continues =
on line 1228
                   break;
                   ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:1228:10: note: The left operand of =
'=3D=3D' is a garbage value
           if (ret =3D=3D -ENOSPC) {
               ~~~ ^
>> drivers/gpu/drm/nouveau/nouveau_bo.c:1327:2: warning: Value stored to 'd=
ev' is never read [clang-analyzer-deadcode.DeadStores]
           dev =3D drm->dev->dev;
           ^     ~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:1327:2: note: Value stored to 'dev'=
 is never read
           dev =3D drm->dev->dev;
           ^     ~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:1344:2: warning: Value stored to 'd=
ev' is never read [clang-analyzer-deadcode.DeadStores]
           dev =3D drm->dev->dev;
           ^     ~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:1344:2: note: Value stored to 'dev'=
 is never read
           dev =3D drm->dev->dev;
           ^     ~~~~~~~~~~~~~
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:55:6: warning: Value stored to =
'page_count' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           u32 page_count =3D new_reg->num_pages;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:55:6: note: Value stored to 'pa=
ge_count' during its initialization is never read
           u32 page_count =3D new_reg->num_pages;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/autofs/root.c:560:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(cp, symname);
           ^~~~~~
   fs/autofs/root.c:560:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(cp, symname);
           ^~~~~~
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
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
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
   62 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:734:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm1));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:734:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm1));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:738:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm2));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:738:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm2));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:742:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm3));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:742:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm3));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:746:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm4));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:746:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm4));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:750:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm5));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:750:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm5));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:754:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm6));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:754:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm6));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:758:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm7));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:758:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(le16_to_cpu(getA=
SICProfilingInfo->usPowerDpm7));
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:763:3: war=
ning: Value stored to 'fPowerDPMx' is never read [clang-analyzer-deadcode.D=
eadStores]
                   fPowerDPMx =3D Convert_ULONG_ToFraction(1);
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:763:3: not=
e: Value stored to 'fPowerDPMx' is never read
                   fPowerDPMx =3D Convert_ULONG_ToFraction(1);
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:994:2: war=
ning: Value stored to 'fA_Term' is never read [clang-analyzer-deadcode.Dead=
Stores]
           fA_Term =3D fAdd(fMargin_RO_a, fAdd(fMultiply(fSM_A4, fSclk), fS=
M_A5));
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:994:2: not=
e: Value stored to 'fA_Term' is never read
           fA_Term =3D fAdd(fMargin_RO_a, fAdd(fMultiply(fSM_A4, fSclk), fS=
M_A5));
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:995:2: war=
ning: Value stored to 'fB_Term' is never read [clang-analyzer-deadcode.Dead=
Stores]
           fB_Term =3D fAdd(fAdd(fMultiply(fSM_A2, fSclk), fSM_A6), fMargin=
_RO_b);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:995:2: not=
e: Value stored to 'fB_Term' is never read
           fB_Term =3D fAdd(fAdd(fMultiply(fSM_A2, fSclk), fSM_A6), fMargin=
_RO_b);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:996:2: war=
ning: Value stored to 'fC_Term' is never read [clang-analyzer-deadcode.Dead=
Stores]
           fC_Term =3D fAdd(fMargin_RO_c,
           ^         ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:996:2: not=
e: Value stored to 'fC_Term' is never read
           fC_Term =3D fAdd(fMargin_RO_c,
           ^         ~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:1661:2: wa=
rning: Value stored to 'table_address' is never read [clang-analyzer-deadco=
de.DeadStores]
           table_address +=3D offset;
           ^                ~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:1661:2: no=
te: Value stored to 'table_address' is never read
           table_address +=3D offset;
           ^                ~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppevvmath.h:223:18: war=
ning: The result of the left shift is undefined because the left operand is=
 negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   temp.full =3D (X << SHIFT_AMOUNT);
                                  ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:718:6: not=
e: Assuming 'getASICProfilingInfo' is non-null
           if (!getASICProfilingInfo)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:718:2: not=
e: Taking false branch
           if (!getASICProfilingInfo)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:721:6: not=
e: Assuming field 'ucTableFormatRevision' is >=3D 3
           if (getASICProfilingInfo->asHeader.ucTableFormatRevision < 3 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:721:6: not=
e: Left side of '||' is false
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:722:7: not=
e: Assuming field 'ucTableFormatRevision' is not equal to 3
               (getASICProfilingInfo->asHeader.ucTableFormatRevision =3D=3D=
 3 &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:722:65: no=
te: Left side of '&&' is false
               (getASICProfilingInfo->asHeader.ucTableFormatRevision =3D=3D=
 3 &&
                                                                          ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:732:2: not=
e: Control jumps to the 'default' case at line 761
           switch (dpm_level) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:784:6: not=
e: Assuming 'result' is 0
           if (result)
               ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:784:2: not=
e: Taking false branch
           if (result)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:805:6: not=
e: Assuming 'result' is 0
           if (result)
               ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:805:2: not=
e: Taking false branch
           if (result)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:825:6: not=
e: Assuming 'result' is 0
           if (result)
               ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:825:2: not=
e: Taking false branch
           if (result)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:846:6: not=
e: Assuming 'result' is 0
           if (result)
               ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:846:2: not=
e: Taking false branch
           if (result)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.c:853:19: no=
te: Calling 'fDecodeLogisticFuse'
           fKt_Beta_fused =3D fDecodeLogisticFuse(ul_Kt_Beta_fused,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppevvmath.h:192:44: not=
e: Passing the value -13 via 1st parameter 'X'
           fInt f_CONSTANT_NEG13 =3D ConvertToFraction(-13);
                                                     ^~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppevvmath.h:192:26: not=
e: Calling 'ConvertToFraction'
           fInt f_CONSTANT_NEG13 =3D ConvertToFraction(-13);
                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppevvmath.h:222:2: note=
: Taking true branch
           if (X <=3D MAX)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppevvmath.h:223:18: not=
e: The result of the left shift is undefined because the left operand is ne=
gative
                   temp.full =3D (X << SHIFT_AMOUNT);
                                ~ ^
   Suppressed 49 warnings (10 in non-user code, 39 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/fscache/object.c:454:25: warning: Value stored to 'cookie' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct fscache_cookie *cookie =3D object->cookie;
                                  ^~~~~~   ~~~~~~~~~~~~~~
   fs/fscache/object.c:454:25: note: Value stored to 'cookie' during its in=
itialization is never read
           struct fscache_cookie *cookie =3D object->cookie;
                                  ^~~~~~   ~~~~~~~~~~~~~~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/fscache/page.c:409:32: warning: Value stored to 'state' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
                   enum fscache_operation_state state =3D op->state;
                                                ^~~~~   ~~~~~~~~~
   fs/fscache/page.c:409:32: note: Value stored to 'state' during its initi=
alization is never read
                   enum fscache_operation_state state =3D op->state;
                                                ^~~~~   ~~~~~~~~~
   fs/fscache/page.c:998:2: warning: Value stored to 'ret' is never read [c=
lang-analyzer-deadcode.DeadStores]
           ret =3D -ENOBUFS;
           ^     ~~~~~~~~
   fs/fscache/page.c:998:2: note: Value stored to 'ret' is never read
           ret =3D -ENOBUFS;
           ^     ~~~~~~~~
   fs/fscache/page.c:1080:2: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
           ret =3D -ENOBUFS;
           ^     ~~~~~~~~
   fs/fscache/page.c:1080:2: note: Value stored to 'ret' is never read
           ret =3D -ENOBUFS;
           ^     ~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).

vim +/dev +1327 drivers/gpu/drm/nouveau/nouveau_bo.c

e1429b4c3c7951 Ben Skeggs            2010-09-10  1306  =

3230cfc34fca9d Konrad Rzeszutek Wilk 2011-10-17  1307  static int
0a667b500703db Dave Airlie           2020-08-25  1308  nouveau_ttm_tt_popul=
ate(struct ttm_bo_device *bdev,
0a667b500703db Dave Airlie           2020-08-25  1309  			struct ttm_tt *tt=
m, struct ttm_operation_ctx *ctx)
3230cfc34fca9d Konrad Rzeszutek Wilk 2011-10-17  1310  {
e34b8feeaa4b65 Christian K=C3=B6nig       2020-10-21  1311  	struct ttm_tt =
*ttm_dma =3D (void *)ttm;
ebb945a94bba2c Ben Skeggs            2012-07-20  1312  	struct nouveau_drm =
*drm;
359088d5b8ec06 Ben Skeggs            2017-11-01  1313  	struct device *dev;
22b33e8ed0e38b Dave Airlie           2012-04-02  1314  	bool slave =3D !!(t=
tm->page_flags & TTM_PAGE_FLAG_SG);
3230cfc34fca9d Konrad Rzeszutek Wilk 2011-10-17  1315  =

7eec915138279d Dave Airlie           2020-09-15  1316  	if (ttm_tt_is_popul=
ated(ttm))
3230cfc34fca9d Konrad Rzeszutek Wilk 2011-10-17  1317  		return 0;
3230cfc34fca9d Konrad Rzeszutek Wilk 2011-10-17  1318  =

22b33e8ed0e38b Dave Airlie           2012-04-02  1319  	if (slave && ttm->s=
g) {
22b33e8ed0e38b Dave Airlie           2012-04-02  1320  		/* make userspace =
faulting work */
22b33e8ed0e38b Dave Airlie           2012-04-02  1321  		drm_prime_sg_to_pa=
ge_addr_arrays(ttm->sg, ttm->pages,
22b33e8ed0e38b Dave Airlie           2012-04-02  1322  						 ttm_dma->dma_=
address, ttm->num_pages);
22b33e8ed0e38b Dave Airlie           2012-04-02  1323  		return 0;
22b33e8ed0e38b Dave Airlie           2012-04-02  1324  	}
22b33e8ed0e38b Dave Airlie           2012-04-02  1325  =

0a667b500703db Dave Airlie           2020-08-25  1326  	drm =3D nouveau_bde=
v(bdev);
359088d5b8ec06 Ben Skeggs            2017-11-01 @1327  	dev =3D drm->dev->d=
ev;
3230cfc34fca9d Konrad Rzeszutek Wilk 2011-10-17  1328  =

461619f5c3242a Christian K=C3=B6nig       2020-10-24  1329  	return ttm_poo=
l_alloc(&drm->ttm.bdev.pool, ttm, ctx);
3230cfc34fca9d Konrad Rzeszutek Wilk 2011-10-17  1330  }
3230cfc34fca9d Konrad Rzeszutek Wilk 2011-10-17  1331  =


:::::: The code at line 1327 was first introduced by commit
:::::: 359088d5b8ec06196a9ea53e7e59167514220465 drm/nouveau: remove trivial=
 cases of nvxx_device() usage

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8017534434099869072==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
J91WDTw1/wKcOR/buwICAA==
--===============8017534434099869072==--

