Content-Type: multipart/mixed; boundary="===============4276309474275794799=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:208:23: warning: Value stored to 'afe' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 09 Apr 2022 14:33:59 +0800
Message-ID: <202204091437.0IjYZuYK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4276309474275794799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Trevor Wu <trevor.wu@mediatek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6c7376da23587738ab0e84b8b90b6cc02db5181e
commit: 6746cc858259985a945a07075a19ec4d24352407 ASoC: mediatek: mt8195: ad=
d platform driver
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: riscv-randconfig-c006-20220405 (https://download.01.org/0day-ci/arc=
hive/20220409/202204091437.0IjYZuYK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
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
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/pcm_params.h:315:2: note: Returning the value 93
           return (__force snd_pcm_format_t)snd_mask_min(hw_param_mask_c(p,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/meson/meson-codec-glue.c:77:47: note: Returning from 'params_f=
ormat'
           data->params.formats =3D 1ULL << (__force int) params_format(par=
ams);
                                                        ^~~~~~~~~~~~~~~~~~~=
~~
   sound/soc/meson/meson-codec-glue.c:77:30: note: The result of the left s=
hift is undefined due to shifting by '93', which is greater or equal to the=
 width of type 'unsigned long long'
           data->params.formats =3D 1ULL << (__force int) params_format(par=
ams);
                                       ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   sound/soc/meson/meson-codec-glue.c:77:30: warning: The result of the lef=
t shift is undefined due to shifting by '94', which is greater or equal to =
the width of type 'unsigned long long' [clang-analyzer-core.UndefinedBinary=
OperatorResult]
           data->params.formats =3D 1ULL << (__force int) params_format(par=
ams);
                                       ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   sound/soc/meson/meson-codec-glue.c:77:47: note: Calling 'params_format'
           data->params.formats =3D 1ULL << (__force int) params_format(par=
ams);
                                                        ^~~~~~~~~~~~~~~~~~~=
~~
   include/sound/pcm_params.h:315:35: note: Calling 'snd_mask_min'
           return (__force snd_pcm_format_t)snd_mask_min(hw_param_mask_c(p,
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/pcm_params.h:48:2: note: Loop condition is true.  Entering=
 loop body
           for (i =3D 0; i < SNDRV_MASK_SIZE; i++) {
           ^
   include/sound/pcm_params.h:49:7: note: Assuming the condition is false
                   if (mask->bits[i])
                       ^~~~~~~~~~~~~
   include/sound/pcm_params.h:49:3: note: Taking false branch
                   if (mask->bits[i])
                   ^
   include/sound/pcm_params.h:48:2: note: Loop condition is true.  Entering=
 loop body
           for (i =3D 0; i < SNDRV_MASK_SIZE; i++) {
           ^
   include/sound/pcm_params.h:49:7: note: Assuming the condition is true
                   if (mask->bits[i])
                       ^~~~~~~~~~~~~
   include/sound/pcm_params.h:49:3: note: Taking true branch
                   if (mask->bits[i])
                   ^
   include/sound/pcm_params.h:50:4: note: Returning the value 94
                           return __ffs(mask->bits[i]) + (i << 5);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/pcm_params.h:315:35: note: Returning from 'snd_mask_min'
           return (__force snd_pcm_format_t)snd_mask_min(hw_param_mask_c(p,
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/pcm_params.h:315:2: note: Returning the value 94
           return (__force snd_pcm_format_t)snd_mask_min(hw_param_mask_c(p,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/meson/meson-codec-glue.c:77:47: note: Returning from 'params_f=
ormat'
           data->params.formats =3D 1ULL << (__force int) params_format(par=
ams);
                                                        ^~~~~~~~~~~~~~~~~~~=
~~
   sound/soc/meson/meson-codec-glue.c:77:30: note: The result of the left s=
hift is undefined due to shifting by '94', which is greater or equal to the=
 width of type 'unsigned long long'
           data->params.formats =3D 1ULL << (__force int) params_format(par=
ams);
                                       ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   sound/soc/meson/meson-codec-glue.c:77:30: warning: The result of the lef=
t shift is undefined due to shifting by '95', which is greater or equal to =
the width of type 'unsigned long long' [clang-analyzer-core.UndefinedBinary=
OperatorResult]
           data->params.formats =3D 1ULL << (__force int) params_format(par=
ams);
                                       ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   sound/soc/meson/meson-codec-glue.c:77:47: note: Calling 'params_format'
           data->params.formats =3D 1ULL << (__force int) params_format(par=
ams);
                                                        ^~~~~~~~~~~~~~~~~~~=
~~
   include/sound/pcm_params.h:315:35: note: Calling 'snd_mask_min'
           return (__force snd_pcm_format_t)snd_mask_min(hw_param_mask_c(p,
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/pcm_params.h:48:2: note: Loop condition is true.  Entering=
 loop body
           for (i =3D 0; i < SNDRV_MASK_SIZE; i++) {
           ^
   include/sound/pcm_params.h:49:7: note: Assuming the condition is false
                   if (mask->bits[i])
                       ^~~~~~~~~~~~~
   include/sound/pcm_params.h:49:3: note: Taking false branch
                   if (mask->bits[i])
                   ^
   include/sound/pcm_params.h:48:2: note: Loop condition is true.  Entering=
 loop body
           for (i =3D 0; i < SNDRV_MASK_SIZE; i++) {
           ^
   include/sound/pcm_params.h:49:7: note: Assuming the condition is true
                   if (mask->bits[i])
                       ^~~~~~~~~~~~~
   include/sound/pcm_params.h:49:3: note: Taking true branch
                   if (mask->bits[i])
                   ^
   include/sound/pcm_params.h:50:4: note: Returning the value 95
                           return __ffs(mask->bits[i]) + (i << 5);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/pcm_params.h:315:35: note: Returning from 'snd_mask_min'
           return (__force snd_pcm_format_t)snd_mask_min(hw_param_mask_c(p,
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/pcm_params.h:315:2: note: Returning the value 95
           return (__force snd_pcm_format_t)snd_mask_min(hw_param_mask_c(p,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/meson/meson-codec-glue.c:77:47: note: Returning from 'params_f=
ormat'
           data->params.formats =3D 1ULL << (__force int) params_format(par=
ams);
                                                        ^~~~~~~~~~~~~~~~~~~=
~~
   sound/soc/meson/meson-codec-glue.c:77:30: note: The result of the left s=
hift is undefined due to shifting by '95', which is greater or equal to the=
 width of type 'unsigned long long'
           data->params.formats =3D 1ULL << (__force int) params_format(par=
ams);
                                       ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
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
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   sound/soc/bcm/bcm63xx-pcm-whistler.c:281:31: warning: The left operand o=
f '+' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   prtd->dma_addr_next =3D val_1 + val_2;
                                         ~~~~~ ^
   sound/soc/bcm/bcm63xx-pcm-whistler.c:252:59: note: 'val_1' declared with=
out an initial value
           unsigned int availdepth, ifflevel, offlevel, int_status, val_1, =
val_2;
                                                                    ^~~~~
   sound/soc/bcm/bcm63xx-pcm-whistler.c:267:6: note: Assuming the condition=
 is true
           if (int_status & I2S_RX_DESC_OFF_INTR_EN_MSK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/bcm/bcm63xx-pcm-whistler.c:267:2: note: Taking true branch
           if (int_status & I2S_RX_DESC_OFF_INTR_EN_MSK) {
           ^
   sound/soc/bcm/bcm63xx-pcm-whistler.c:276:3: note: Loop condition is fals=
e. Execution continues on line 281
                   while (offlevel) {
                   ^
   sound/soc/bcm/bcm63xx-pcm-whistler.c:281:31: note: The left operand of '=
+' is a garbage value
                   prtd->dma_addr_next =3D val_1 + val_2;
                                         ~~~~~ ^
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   sound/soc/fsl/fsl_sai.c:63:17: warning: Value stored to 'dev' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &sai->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_sai.c:63:17: note: Value stored to 'dev' during its in=
itialization is never read
           struct device *dev =3D &sai->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
--
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
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
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
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
   Suppressed 11 warnings (3 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
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
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/core/oss/pcm_plugin.c:472:4: warning: Value stored to 'src_access'=
 is never read [clang-analyzer-deadcode.DeadStores]
                           src_access =3D dst_access;
                           ^            ~~~~~~~~~~
   sound/core/oss/pcm_plugin.c:472:4: note: Value stored to 'src_access' is=
 never read
                           src_access =3D dst_access;
                           ^            ~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   sound/soc/xtensa/xtfpga-i2s.c:285:11: warning: Value stored to 'channels=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           unsigned channels =3D params_channels(params);
                    ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/xtensa/xtfpga-i2s.c:285:11: note: Value stored to 'channels' d=
uring its initialization is never read
           unsigned channels =3D params_channels(params);
                    ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/nvme/target/core.c:1123:10: warning: Although the value stored t=
o 'cc_css' is used in the enclosing expression, the value is never actually=
 read from 'cc_css' [clang-analyzer-deadcode.DeadStores]
           switch (cc_css <<=3D NVME_CC_CSS_SHIFT) {
                   ^          ~~~~~~~~~~~~~~~~~
   drivers/nvme/target/core.c:1123:10: note: Although the value stored to '=
cc_css' is used in the enclosing expression, the value is never actually re=
ad from 'cc_css'
           switch (cc_css <<=3D NVME_CC_CSS_SHIFT) {
                   ^          ~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/afe +208 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c

6746cc85825998 Trevor Wu 2021-08-19  204  =

6746cc85825998 Trevor Wu 2021-08-19  205  static const struct mt8195_afe_ch=
annel_merge*
6746cc85825998 Trevor Wu 2021-08-19  206  mt8195_afe_found_cm(struct snd_so=
c_dai *dai)
6746cc85825998 Trevor Wu 2021-08-19  207  {
6746cc85825998 Trevor Wu 2021-08-19 @208  	struct mtk_base_afe *afe =3D snd=
_soc_dai_get_drvdata(dai);
6746cc85825998 Trevor Wu 2021-08-19  209  	int id =3D -EINVAL;
6746cc85825998 Trevor Wu 2021-08-19  210  =

6746cc85825998 Trevor Wu 2021-08-19  211  	if (mt8195_afe_memif_is_ul(dai->=
id) =3D=3D 0)
6746cc85825998 Trevor Wu 2021-08-19  212  		return NULL;
6746cc85825998 Trevor Wu 2021-08-19  213  =

6746cc85825998 Trevor Wu 2021-08-19  214  	switch (dai->id) {
6746cc85825998 Trevor Wu 2021-08-19  215  	case MT8195_AFE_MEMIF_UL9:
6746cc85825998 Trevor Wu 2021-08-19  216  		id =3D MT8195_AFE_CM0;
6746cc85825998 Trevor Wu 2021-08-19  217  		break;
6746cc85825998 Trevor Wu 2021-08-19  218  	case MT8195_AFE_MEMIF_UL2:
6746cc85825998 Trevor Wu 2021-08-19  219  		id =3D MT8195_AFE_CM1;
6746cc85825998 Trevor Wu 2021-08-19  220  		break;
6746cc85825998 Trevor Wu 2021-08-19  221  	case MT8195_AFE_MEMIF_UL10:
6746cc85825998 Trevor Wu 2021-08-19  222  		id =3D MT8195_AFE_CM2;
6746cc85825998 Trevor Wu 2021-08-19  223  		break;
6746cc85825998 Trevor Wu 2021-08-19  224  	default:
6746cc85825998 Trevor Wu 2021-08-19  225  		break;
6746cc85825998 Trevor Wu 2021-08-19  226  	}
6746cc85825998 Trevor Wu 2021-08-19  227  =

6746cc85825998 Trevor Wu 2021-08-19  228  	if (id < 0) {
6746cc85825998 Trevor Wu 2021-08-19  229  		dev_dbg(afe->dev, "%s, memif %d=
 cannot find CM!\n",
6746cc85825998 Trevor Wu 2021-08-19  230  			__func__, dai->id);
6746cc85825998 Trevor Wu 2021-08-19  231  		return NULL;
6746cc85825998 Trevor Wu 2021-08-19  232  	}
6746cc85825998 Trevor Wu 2021-08-19  233  =

6746cc85825998 Trevor Wu 2021-08-19  234  	return &mt8195_afe_cm[id];
6746cc85825998 Trevor Wu 2021-08-19  235  }
6746cc85825998 Trevor Wu 2021-08-19  236  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4276309474275794799==--

