Content-Type: multipart/mixed; boundary="===============6334342928701633966=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:208:23: warning: Value stored to 'afe' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 10 Apr 2022 12:16:05 +0800
Message-ID: <202204101256.W3CJRYrS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6334342928701633966==
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
head:   e1f700ebd6bea293abe3c7e2807b252018efde01
commit: 6746cc858259985a945a07075a19ec4d24352407 ASoC: mediatek: mt8195: ad=
d platform driver
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: riscv-randconfig-c006-20220405 (https://download.01.org/0day-ci/arc=
hive/20220410/202204101256.W3CJRYrS-lkp(a)intel.com/config)
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
           if (ncp_div > 128 || dac_rate / ncp_div > 2048000) {
                                ~~~~~~~~~^~~~~~~~~
   sound/soc/codecs/pcm512x.c:911:6: note: Assuming field 'bclk_ratio' is >=
 0
           if (pcm512x->bclk_ratio > 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:911:2: note: Taking true branch
           if (pcm512x->bclk_ratio > 0) {
           ^
   sound/soc/codecs/pcm512x.c:922:6: note: Assuming field 'pll_out' is 0
           if (!pcm512x->pll_out) {
               ^~~~~~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:922:2: note: Taking true branch
           if (!pcm512x->pll_out) {
           ^
   sound/soc/codecs/pcm512x.c:925:14: note: Left side of '||' is true
                   bclk_div =3D DIV_ROUND_CLOSEST(sck_rate, bclk_rate);
                              ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   sound/soc/codecs/pcm512x.c:991:6: note: Assuming 'bclk_div' is <=3D 128
           if (bclk_div > 128) {
               ^~~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:991:2: note: Taking false branch
           if (bclk_div > 128) {
           ^
   sound/soc/codecs/pcm512x.c:1001:12: note: Assuming the condition is false
           dsp_div =3D mck_rate > pcm512x_dsp_max(pcm512x) ? 2 : 1;
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:1001:12: note: '?' condition is false
   sound/soc/codecs/pcm512x.c:1004:6: note: Assuming 'dac_rate' is not equa=
l to 0
           if (dac_rate) {
               ^~~~~~~~
   sound/soc/codecs/pcm512x.c:1004:2: note: Taking true branch
           if (dac_rate) {
           ^
   sound/soc/codecs/pcm512x.c:1010:3: note: Taking false branch
                   dev_dbg(dev, "using pll input as dac input\n");
                   ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   sound/soc/codecs/pcm512x.c:1013:7: note: Assuming 'ret' is equal to 0
                   if (ret !=3D 0) {
                       ^~~~~~~~
   sound/soc/codecs/pcm512x.c:1013:3: note: Taking false branch
                   if (ret !=3D 0) {
                   ^
   sound/soc/codecs/pcm512x.c:1022:7: note: Assuming 'ret' is equal to 0
                   if (ret !=3D 0) {
                       ^~~~~~~~
   sound/soc/codecs/pcm512x.c:1022:3: note: Taking false branch
                   if (ret !=3D 0) {
                   ^
   sound/soc/codecs/pcm512x.c:1060:12: note: Left side of '||' is true
           osr_div =3D DIV_ROUND_CLOSEST(dac_rate, osr_rate);
                     ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   sound/soc/codecs/pcm512x.c:1061:6: note: Assuming 'osr_div' is <=3D 128
           if (osr_div > 128) {
               ^~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:1061:2: note: Taking false branch
           if (osr_div > 128) {
           ^
   sound/soc/codecs/pcm512x.c:1066:12: note: Left side of '||' is true
           dac_div =3D DIV_ROUND_CLOSEST(dacsrc_rate, dac_rate);
                     ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   sound/soc/codecs/pcm512x.c:1067:6: note: Assuming 'dac_div' is <=3D 128
           if (dac_div > 128) {
               ^~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:1067:2: note: Taking false branch
           if (dac_div > 128) {
           ^
   sound/soc/codecs/pcm512x.c:1073:12: note: Left side of '||' is true
           ncp_div =3D DIV_ROUND_CLOSEST(dac_rate,
                     ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   sound/soc/codecs/pcm512x.c:1073:2: note: The value 0 is assigned to 'ncp=
_div'
           ncp_div =3D DIV_ROUND_CLOSEST(dac_rate,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:1075:6: note: 'ncp_div' is <=3D 128
           if (ncp_div > 128 || dac_rate / ncp_div > 2048000) {
               ^~~~~~~
   sound/soc/codecs/pcm512x.c:1075:6: note: Left side of '||' is false
   sound/soc/codecs/pcm512x.c:1075:32: note: Division by zero
           if (ncp_div > 128 || dac_rate / ncp_div > 2048000) {
                                ~~~~~~~~~^~~~~~~~~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
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
   sound/soc/mediatek/common/mtk-afe-fe-dai.c:354:6: note: Left side of '||=
' is false
           if (pm_runtime_status_suspended(dev) || !afe->suspended)
               ^
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
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/hwmon/adm1031.c:245:6: warning: Value stored to 'range' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           int range =3D val - AUTO_TEMP_MIN_FROM_REG(reg);
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/adm1031.c:245:6: note: Value stored to 'range' during its =
initialization is never read
           int range =3D val - AUTO_TEMP_MIN_FROM_REG(reg);
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   Suppressed 10 warnings (2 in non-user code, 8 with check filters).
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
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
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
--
   fs/btrfs/file.c:3234:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file.c:3240:4: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file.c:3240:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file.c:3251:4: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file.c:3251:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file.c:3258:4: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file.c:3258:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
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
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
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
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   sound/soc/codecs/wm8903.c:434:3: warning: Value stored to 'best' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   best =3D 0;
                   ^      ~
   sound/soc/codecs/wm8903.c:434:3: note: Value stored to 'best' is never r=
ead
                   best =3D 0;
                   ^      ~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   sound/soc/codecs/wm8996.c:1562:3: warning: Value stored to 'bclk_rate' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   bclk_rate =3D wm8996->sysclk / bclk_divs[best];
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8996.c:1562:3: note: Value stored to 'bclk_rate' is n=
ever read
                   bclk_rate =3D wm8996->sysclk / bclk_divs[best];
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
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
   13 warnings generated.
   fs/btrfs/file-item.c:715:2: warning: Value stored to 'this_sum_bytes' is=
 never read [clang-analyzer-deadcode.DeadStores]
           this_sum_bytes =3D 0;
           ^                ~
   fs/btrfs/file-item.c:715:2: note: Value stored to 'this_sum_bytes' is ne=
ver read
           this_sum_bytes =3D 0;
           ^                ~
   fs/btrfs/file-item.c:912:4: warning: Value stored to 'ret' is never read=
 [clang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/file-item.c:912:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   fs/btrfs/file-item.c:512:9: note: Assuming the condition is false
           ASSERT(IS_ALIGNED(start, fs_info->sectorsize) &&
                  ^
   include/linux/align.h:13:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) =
=3D=3D 0)
                                            ^
   fs/btrfs/ctree.h:3439:29: note: expanded from macro 'ASSERT'
   #define ASSERT(expr)    (void)(expr)
                                  ^~~~
   fs/btrfs/file-item.c:512:48: note: Left side of '&&' is false
           ASSERT(IS_ALIGNED(start, fs_info->sectorsize) &&
                                                         ^
   fs/btrfs/file-item.c:516:6: note: Assuming 'path' is non-null
           if (!path)
               ^~~~~
   fs/btrfs/file-item.c:516:2: note: Taking false branch
           if (!path)
           ^
   fs/btrfs/file-item.c:519:6: note: Assuming 'search_commit' is 0
           if (search_commit) {
               ^~~~~~~~~~~~~
   fs/btrfs/file-item.c:519:2: note: Taking false branch
           if (search_commit) {
           ^
   fs/btrfs/file-item.c:530:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   fs/btrfs/file-item.c:530:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/btrfs/file-item.c:532:6: note: Assuming 'ret' is <=3D 0
           if (ret > 0 && path->slots[0] > 0) {
               ^~~~~~~
   fs/btrfs/file-item.c:532:14: note: Left side of '&&' is false
           if (ret > 0 && path->slots[0] > 0) {
                       ^
   fs/btrfs/file-item.c:544:9: note: Assuming 'start' is <=3D 'end'
           while (start <=3D end) {
                  ^~~~~~~~~~~~
   fs/btrfs/file-item.c:544:2: note: Loop condition is true.  Entering loop=
 body
           while (start <=3D end) {
           ^
   fs/btrfs/file-item.c:546:7: note: Assuming the condition is false
                   if (path->slots[0] >=3D btrfs_header_nritems(leaf)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/file-item.c:546:3: note: Taking false branch
                   if (path->slots[0] >=3D btrfs_header_nritems(leaf)) {
                   ^
   fs/btrfs/file-item.c:556:7: note: Assuming the condition is false
                   if (key.objectid !=3D BTRFS_EXTENT_CSUM_OBJECTID ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/file-item.c:556:7: note: Left side of '||' is false
   fs/btrfs/file-item.c:557:7: note: Assuming field 'type' is equal to BTRF=
S_EXTENT_CSUM_KEY
                       key.type !=3D BTRFS_EXTENT_CSUM_KEY ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/file-item.c:556:7: note: Left side of '||' is false
                   if (key.objectid !=3D BTRFS_EXTENT_CSUM_OBJECTID ||
                       ^
   fs/btrfs/file-item.c:558:7: note: Assuming 'end' is >=3D field 'offset'
                       key.offset > end)
                       ^~~~~~~~~~~~~~~~
   fs/btrfs/file-item.c:556:3: note: Taking false branch
                   if (key.objectid !=3D BTRFS_EXTENT_CSUM_OBJECTID ||
                   ^
   fs/btrfs/file-item.c:561:7: note: Assuming 'start' is >=3D field 'offset'
                   if (key.offset > start)
                       ^~~~~~~~~~~~~~~~~~
   fs/btrfs/file-item.c:561:3: note: Taking false branch

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
--===============6334342928701633966==--

