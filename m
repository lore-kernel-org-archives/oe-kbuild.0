Content-Type: multipart/mixed; boundary="===============8532635025735115301=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:208:23: warning: Value stored to 'afe' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 23 Dec 2021 04:02:13 +0800
Message-ID: <202112230355.6AMe4n1J-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8532635025735115301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Trevor Wu <trevor.wu@mediatek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2f47a9a4dfa3674fad19a49b40c5103a9a8e1589
commit: 6746cc858259985a945a07075a19ec4d24352407 ASoC: mediatek: mt8195: ad=
d platform driver
date:   4 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-c006-20211220 (https://download.01.org/0day-ci/arc=
hive/20211223/202112230355.6AMe4n1J-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eac=
f75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6746cc858259985a945a07075a19ec4d24352407
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6746cc858259985a945a07075a19ec4d24352407
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/rpmsg/qcom_smd.c:799:2: note: Loop condition is false.  Exiting =
loop
           SET_TX_CHANNEL_FLAG(channel, fHEAD, 1);
           ^
   drivers/rpmsg/qcom_smd.c:327:3: note: expanded from macro 'SET_TX_CHANNE=
L_FLAG'
                   BUILD_BUG_ON(sizeof(channel->info->tx.param) !=3D sizeof=
(u8)); \
                   ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/rpmsg/qcom_smd.c:799:2: note: Field 'info_word' is non-null
           SET_TX_CHANNEL_FLAG(channel, fHEAD, 1);
           ^
   drivers/rpmsg/qcom_smd.c:328:16: note: expanded from macro 'SET_TX_CHANN=
EL_FLAG'
                   if (channel->info_word)                                 =
     \
                                ^
   drivers/rpmsg/qcom_smd.c:799:2: note: Taking true branch
           SET_TX_CHANNEL_FLAG(channel, fHEAD, 1);
           ^
   drivers/rpmsg/qcom_smd.c:328:3: note: expanded from macro 'SET_TX_CHANNE=
L_FLAG'
                   if (channel->info_word)                                 =
     \
                   ^
   drivers/rpmsg/qcom_smd.c:809:2: note: Undefined or garbage value returne=
d to caller
           return ret;
           ^      ~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   sound/soc/codecs/lpass-tx-macro.c:771:4: warning: 2nd function call argu=
ment is an uninitialized value [clang-analyzer-core.CallAndMessage]
                           snd_soc_component_write_field(component, mic_sel=
_reg,
                           ^                                        ~~~~~~~=
~~~~
   sound/soc/codecs/lpass-tx-macro.c:736:2: note: 'mic_sel_reg' declared wi=
thout an initial value
           u16 mic_sel_reg;
           ^~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:742:2: note: 'Default' branch taken. E=
xecution continues on line 769
           switch (e->reg) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:769:6: note: Assuming 'val' is not equ=
al to 0
           if (val !=3D 0) {
               ^~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:769:2: note: Taking true branch
           if (val !=3D 0) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:770:7: note: Assuming 'val' is < 5
                   if (val < 5) {
                       ^~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:770:3: note: Taking true branch
                   if (val < 5) {
                   ^
   sound/soc/codecs/lpass-tx-macro.c:771:4: note: 2nd function call argumen=
t is an uninitialized value
                           snd_soc_component_write_field(component, mic_sel=
_reg,
                           ^                                        ~~~~~~~=
~~~~
   sound/soc/codecs/lpass-tx-macro.c:774:4: warning: 2nd function call argu=
ment is an uninitialized value [clang-analyzer-core.CallAndMessage]
                           snd_soc_component_write_field(component, mic_sel=
_reg,
                           ^                                        ~~~~~~~=
~~~~
   sound/soc/codecs/lpass-tx-macro.c:736:2: note: 'mic_sel_reg' declared wi=
thout an initial value
           u16 mic_sel_reg;
           ^~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:742:2: note: 'Default' branch taken. E=
xecution continues on line 769
           switch (e->reg) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:769:6: note: Assuming 'val' is not equ=
al to 0
           if (val !=3D 0) {
               ^~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:769:2: note: Taking true branch
           if (val !=3D 0) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:770:7: note: Assuming 'val' is >=3D 5
                   if (val < 5) {
                       ^~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:770:3: note: Taking false branch
                   if (val < 5) {
                   ^
   sound/soc/codecs/lpass-tx-macro.c:774:4: note: 2nd function call argumen=
t is an uninitialized value
                           snd_soc_component_write_field(component, mic_sel=
_reg,
                           ^                                        ~~~~~~~=
~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
>> sound/soc/mediatek/common/mtk-afe-fe-dai.c:126:29: warning: Value stored=
 to 'memif' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct mtk_base_afe_memif *memif =3D &afe->memif[id];
                                      ^~~~~   ~~~~~~~~~~~~~~~
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:126:29: note: Value stored to=
 'memif' during its initialization is never read
           struct mtk_base_afe_memif *memif =3D &afe->memif[id];
                                      ^~~~~   ~~~~~~~~~~~~~~~
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:364:6: warning: Array access =
(via field 'reg_back_up') results in a null pointer dereference [clang-anal=
yzer-core.NullDereference]
                                    afe->reg_back_up[i]);
                                    ^    ~~~~~~~~~~~
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:354:6: note: Calling 'pm_runt=
ime_status_suspended'
           if (pm_runtime_status_suspended(dev) || !afe->suspended)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm_runtime.h:261:70: note: Returning zero, which participa=
tes in a condition later
   static inline bool pm_runtime_status_suspended(struct device *dev) { ret=
urn false; }
                                                                        ^~~=
~~~~~~~~~
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:354:6: note: Returning from '=
pm_runtime_status_suspended'
           if (pm_runtime_status_suspended(dev) || !afe->suspended)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:354:6: note: Left side of '||=
' is false
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:354:42: note: Assuming field =
'suspended' is true
           if (pm_runtime_status_suspended(dev) || !afe->suspended)
                                                   ^~~~~~~~~~~~~~~
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:354:2: note: Taking false bra=
nch
           if (pm_runtime_status_suspended(dev) || !afe->suspended)
           ^
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:359:6: note: Assuming field '=
reg_back_up' is null
           if (!afe->reg_back_up)
               ^~~~~~~~~~~~~~~~~
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:359:2: note: Taking true bran=
ch
           if (!afe->reg_back_up)
           ^
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:360:3: note: Taking false bra=
nch
                   dev_dbg(dev, "%s no reg_backup\n", __func__);
                   ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:362:14: note: Assuming 'i' is=
 < field 'reg_back_up_list_num'
           for (i =3D 0; i < afe->reg_back_up_list_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:362:2: note: Loop condition i=
s true.  Entering loop body
           for (i =3D 0; i < afe->reg_back_up_list_num; i++)
           ^
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:364:6: note: Array access (vi=
a field 'reg_back_up') results in a null pointer dereference
                                    afe->reg_back_up[i]);
                                    ^    ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   sound/pci/lola/lola.c:675:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->mixername, card->shortname);
           ^~~~~~
   sound/pci/lola/lola.c:675:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(card->mixername, card->shortname);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   4 warnings generated.
   sound/pci/lola/lola_mixer.c:480:15: warning: Division by zero [clang-ana=
lyzer-core.DivideZero]
                   int src =3D i % chip->mixer.src_phys_ins;
                               ^
   sound/pci/lola/lola_mixer.c:834:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   sound/pci/lola/lola_mixer.c:834:2: note: Taking false branch
           if (err < 0)
           ^
   sound/pci/lola/lola_mixer.c:836:8: note: Calling 'create_analog_mixer'
           err =3D create_analog_mixer(chip, CAPT, "Analog Capture Volume");
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lola/lola_mixer.c:583:6: note: Assuming field 'num_pins' is 0
           if (!chip->pin[dir].num_pins)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lola/lola_mixer.c:583:2: note: Taking true branch
           if (!chip->pin[dir].num_pins)
           ^
   sound/pci/lola/lola_mixer.c:584:3: note: Returning without writing to 'c=
hip->mixer.src_phys_ins'
                   return 0;
                   ^
   sound/pci/lola/lola_mixer.c:836:8: note: Returning from 'create_analog_m=
ixer'
--
   drivers/usb/host/xhci-ring.c:1021:6: note: Assuming the condition is true
           if (unlikely(TRB_TO_SUSPEND_PORT(le32_to_cpu(trb->generic.field[=
3])))) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/usb/host/xhci-ring.c:1021:2: note: Taking false branch
           if (unlikely(TRB_TO_SUSPEND_PORT(le32_to_cpu(trb->generic.field[=
3])))) {
           ^
   drivers/usb/host/xhci-ring.c:1030:6: note: Assuming 'ep' is non-null
           if (!ep)
               ^~~
   drivers/usb/host/xhci-ring.c:1030:2: note: Taking false branch
           if (!ep)
           ^
   drivers/usb/host/xhci-ring.c:1037:6: note: Assuming 'comp_code' is equal=
 to COMP_CONTEXT_STATE_ERROR
           if (comp_code =3D=3D COMP_CONTEXT_STATE_ERROR) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:1037:2: note: Taking true branch
           if (comp_code =3D=3D COMP_CONTEXT_STATE_ERROR) {
           ^
   drivers/usb/host/xhci-ring.c:1052:3: note: Control jumps to 'case 1:'  a=
t line 1070
                   switch (GET_EP_CTX_STATE(ep_ctx)) {
                   ^
   drivers/usb/host/xhci-ring.c:1072:4: note: Value assigned to 'command'
                           command =3D xhci_alloc_command(xhci, false, GFP_=
ATOMIC);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/usb/host/xhci-ring.c:1073:8: note: Assuming pointer value is null
                           if (!command)
                               ^~~~~~~~
   drivers/usb/host/xhci-ring.c:1073:8: note: Assuming 'command' is null
                           if (!command)
                               ^~~~~~~~
   drivers/usb/host/xhci-ring.c:1073:4: note: Taking true branch
                           if (!command)
                           ^
   drivers/usb/host/xhci-ring.c:1078:35: note: Passing null pointer value v=
ia 2nd parameter 'cmd'
                           xhci_queue_stop_endpoint(xhci, command, slot_id,=
 ep_index, 0);
                                                          ^~~~~~~
   drivers/usb/host/xhci-ring.c:1078:4: note: Calling 'xhci_queue_stop_endp=
oint'
                           xhci_queue_stop_endpoint(xhci, command, slot_id,=
 ep_index, 0);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:4355:29: note: Passing null pointer value v=
ia 2nd parameter 'cmd'
           return queue_command(xhci, cmd, 0, 0, 0,
                                      ^~~
   drivers/usb/host/xhci-ring.c:4355:9: note: Calling 'queue_command'
           return queue_command(xhci, cmd, 0, 0, 0,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:4255:7: note: Assuming the condition is fal=
se
           if ((xhci->xhc_state & XHCI_STATE_DYING) ||
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:4255:6: note: Left side of '||' is false
           if ((xhci->xhc_state & XHCI_STATE_DYING) ||
               ^
   drivers/usb/host/xhci-ring.c:4256:4: note: Assuming the condition is fal=
se
                   (xhci->xhc_state & XHCI_STATE_HALTED)) {
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:4255:2: note: Taking false branch
           if ((xhci->xhc_state & XHCI_STATE_DYING) ||
           ^
   drivers/usb/host/xhci-ring.c:4261:7: note: 'command_must_succeed' is fal=
se
           if (!command_must_succeed)
                ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:4261:2: note: Taking true branch
           if (!command_must_succeed)
           ^
   drivers/usb/host/xhci-ring.c:4266:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/usb/host/xhci-ring.c:4266:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/usb/host/xhci-ring.c:4274:19: note: Access to field 'command_trb=
' results in a dereference of a null pointer (loaded from variable 'cmd')
           cmd->command_trb =3D xhci->cmd_ring->enqueue;
           ~~~              ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/soc/mediatek/mt8195/mt8195-audsys-clk.c:17:8: warning: Excessive p=
adding in 'struct afe_gate' (14 padding bytes, where 6 is optimal). =

   Optimal fields order: =

   name, =

   parent_name, =

   ops, =

   flags, =

   id, =

   reg, =

   bit, =

   cg_flags, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct afe_gate {
   ~~~~~~~^~~~~~~~~~
   sound/soc/mediatek/mt8195/mt8195-audsys-clk.c:17:8: note: Excessive padd=
ing in 'struct afe_gate' (14 padding bytes, where 6 is optimal). Optimal fi=
elds order: name, parent_name, ops, flags, id, reg, bit, cg_flags, consider=
 reordering the fields or adding explicit padding members
   struct afe_gate {
   ~~~~~~~^~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:208:23: warning: Value stored=
 to 'afe' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
                                ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:208:23: note: Value stored to=
 'afe' during its initialization is never read
           struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
                                ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:345:23: warning: Value stored=
 to 'afe' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
                                ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:345:23: note: Value stored to=
 'afe' during its initialization is never read
           struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
                                ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> sound/soc/mediatek/mt8195/mt8195-dai-adda.c:218:23: warning: Value store=
d to 'afe' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt=
);
                                ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8195/mt8195-dai-adda.c:218:23: note: Value stored t=
o 'afe' during its initialization is never read
           struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt=
);
                                ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/accel/bmc150-accel-core.c:144:8: warning: Excessive padding =
in 'struct bmc150_accel_chip_info' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   name, =

   channels, =

   num_channels, =

   scale_table, =

   chip_id, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bmc150_accel_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bmc150-accel-core.c:144:8: note: Excessive padding in =
'struct bmc150_accel_chip_info' (11 padding bytes, where 3 is optimal). Opt=
imal fields order: name, channels, num_channels, scale_table, chip_id, cons=
ider reordering the fields or adding explicit padding members
   struct bmc150_accel_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   lib/vsprintf.c:398:20: warning: Assigned value is garbage or undefined [=
clang-analyzer-core.uninitialized.Assign]
                   buf[idx + width] =3D tmp[len - idx - 1];
                                    ^ ~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:379:6: note: Assuming 'num' is > 9
           if (num <=3D 9) {
               ^~~~~~~~
   lib/vsprintf.c:379:2: note: Taking false branch

vim +/afe +208 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c

6746cc858259985 Trevor Wu 2021-08-19  204  =

6746cc858259985 Trevor Wu 2021-08-19  205  static const struct mt8195_afe_c=
hannel_merge*
6746cc858259985 Trevor Wu 2021-08-19  206  mt8195_afe_found_cm(struct snd_s=
oc_dai *dai)
6746cc858259985 Trevor Wu 2021-08-19  207  {
6746cc858259985 Trevor Wu 2021-08-19 @208  	struct mtk_base_afe *afe =3D sn=
d_soc_dai_get_drvdata(dai);
6746cc858259985 Trevor Wu 2021-08-19  209  	int id =3D -EINVAL;
6746cc858259985 Trevor Wu 2021-08-19  210  =

6746cc858259985 Trevor Wu 2021-08-19  211  	if (mt8195_afe_memif_is_ul(dai-=
>id) =3D=3D 0)
6746cc858259985 Trevor Wu 2021-08-19  212  		return NULL;
6746cc858259985 Trevor Wu 2021-08-19  213  =

6746cc858259985 Trevor Wu 2021-08-19  214  	switch (dai->id) {
6746cc858259985 Trevor Wu 2021-08-19  215  	case MT8195_AFE_MEMIF_UL9:
6746cc858259985 Trevor Wu 2021-08-19  216  		id =3D MT8195_AFE_CM0;
6746cc858259985 Trevor Wu 2021-08-19  217  		break;
6746cc858259985 Trevor Wu 2021-08-19  218  	case MT8195_AFE_MEMIF_UL2:
6746cc858259985 Trevor Wu 2021-08-19  219  		id =3D MT8195_AFE_CM1;
6746cc858259985 Trevor Wu 2021-08-19  220  		break;
6746cc858259985 Trevor Wu 2021-08-19  221  	case MT8195_AFE_MEMIF_UL10:
6746cc858259985 Trevor Wu 2021-08-19  222  		id =3D MT8195_AFE_CM2;
6746cc858259985 Trevor Wu 2021-08-19  223  		break;
6746cc858259985 Trevor Wu 2021-08-19  224  	default:
6746cc858259985 Trevor Wu 2021-08-19  225  		break;
6746cc858259985 Trevor Wu 2021-08-19  226  	}
6746cc858259985 Trevor Wu 2021-08-19  227  =

6746cc858259985 Trevor Wu 2021-08-19  228  	if (id < 0) {
6746cc858259985 Trevor Wu 2021-08-19  229  		dev_dbg(afe->dev, "%s, memif %=
d cannot find CM!\n",
6746cc858259985 Trevor Wu 2021-08-19  230  			__func__, dai->id);
6746cc858259985 Trevor Wu 2021-08-19  231  		return NULL;
6746cc858259985 Trevor Wu 2021-08-19  232  	}
6746cc858259985 Trevor Wu 2021-08-19  233  =

6746cc858259985 Trevor Wu 2021-08-19  234  	return &mt8195_afe_cm[id];
6746cc858259985 Trevor Wu 2021-08-19  235  }
6746cc858259985 Trevor Wu 2021-08-19  236  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8532635025735115301==--

