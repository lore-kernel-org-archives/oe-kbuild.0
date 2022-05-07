Content-Type: multipart/mixed; boundary="===============4931928301649938056=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/lpass-cdc-dma.c:274:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sat, 07 May 2022 13:22:27 +0800
Message-ID: <202205071323.fqOeSJTn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4931928301649938056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
CC: Mark Brown <broonie@kernel.org>
CC: Venkata Prasad Potturu <quic_potturu@quicinc.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b97bac0756a81cda5afd45417a99b5bccdcff67
commit: b62c4e5fba2f910bc9f23ae152d11627e4c2f00f ASoC: qcom: lpass-sc7280: =
Add platform driver for lpass audio
date:   2 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 2 months ago
config: arm-randconfig-c002-20220506 (https://download.01.org/0day-ci/archi=
ve/20220507/202205071323.fqOeSJTn-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db62c4e5fba2f910bc9f23ae152d11627e4c2f00f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b62c4e5fba2f910bc9f23ae152d11627e4c2f00f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/dma/xgene-dma.c:932:7: note: 'len' is not equal to 0
                   if (len) {
                       ^~~
   drivers/dma/xgene-dma.c:932:3: note: Taking true branch
                   if (len) {
                   ^
   drivers/dma/xgene-dma.c:933:4: note: Calling 'xgene_dma_prep_xor_desc'
                           xgene_dma_prep_xor_desc(chan, new, &dst[0], src,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xgene-dma.c:440:14: note: 'i' is < 'src_cnt'
           for (i =3D 0; i < src_cnt; i++) {
                       ^
   drivers/dma/xgene-dma.c:440:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < src_cnt; i++) {
           ^
   drivers/dma/xgene-dma.c:442:29: note: 'i' is equal to 0
                   xgene_dma_set_src_buffer((i =3D=3D 0) ? &desc1->m1 :
                                             ^
   drivers/dma/xgene-dma.c:442:28: note: '?' condition is true
                   xgene_dma_set_src_buffer((i =3D=3D 0) ? &desc1->m1 :
                                            ^
   drivers/dma/xgene-dma.c:440:14: note: Assuming 'i' is < 'src_cnt'
           for (i =3D 0; i < src_cnt; i++) {
                       ^~~~~~~~~~~
   drivers/dma/xgene-dma.c:440:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < src_cnt; i++) {
           ^
   drivers/dma/xgene-dma.c:442:29: note: 'i' is not equal to 0
                   xgene_dma_set_src_buffer((i =3D=3D 0) ? &desc1->m1 :
                                             ^
   drivers/dma/xgene-dma.c:442:28: note: '?' condition is false
                   xgene_dma_set_src_buffer((i =3D=3D 0) ? &desc1->m1 :
                                            ^
   drivers/dma/xgene-dma.c:440:14: note: Assuming 'i' is < 'src_cnt'
           for (i =3D 0; i < src_cnt; i++) {
                       ^~~~~~~~~~~
   drivers/dma/xgene-dma.c:440:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < src_cnt; i++) {
           ^
   drivers/dma/xgene-dma.c:442:29: note: 'i' is not equal to 0
                   xgene_dma_set_src_buffer((i =3D=3D 0) ? &desc1->m1 :
                                             ^
   drivers/dma/xgene-dma.c:442:28: note: '?' condition is false
                   xgene_dma_set_src_buffer((i =3D=3D 0) ? &desc1->m1 :
                                            ^
   drivers/dma/xgene-dma.c:440:14: note: Assuming 'i' is < 'src_cnt'
           for (i =3D 0; i < src_cnt; i++) {
                       ^~~~~~~~~~~
   drivers/dma/xgene-dma.c:440:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < src_cnt; i++) {
           ^
   drivers/dma/xgene-dma.c:442:29: note: 'i' is not equal to 0
                   xgene_dma_set_src_buffer((i =3D=3D 0) ? &desc1->m1 :
                                             ^
   drivers/dma/xgene-dma.c:442:28: note: '?' condition is false
                   xgene_dma_set_src_buffer((i =3D=3D 0) ? &desc1->m1 :
                                            ^
   drivers/dma/xgene-dma.c:445:36: note: The result of the left shift is un=
defined due to shifting by '32', which is greater or equal to the width of =
type 'int'
                   desc1->m2 |=3D cpu_to_le64((scf[i] << ((i + 1) * 8)));
                                                    ^
   include/linux/byteorder/generic.h:86:21: note: expanded from macro 'cpu_=
to_le64'
   #define cpu_to_le64 __cpu_to_le64
                       ^
   include/uapi/linux/byteorder/little_endian.h:32:51: note: expanded from =
macro '__cpu_to_le64'
   #define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
                                                     ^
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   sound/soc/kirkwood/kirkwood-i2s.c:322:2: warning: Value stored to 'value=
' is never read [clang-analyzer-deadcode.DeadStores]
           value =3D readl(priv->io + KIRKWOOD_RECCTL);
           ^
   sound/soc/kirkwood/kirkwood-i2s.c:322:2: note: Value stored to 'value' i=
s never read
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> sound/soc/qcom/lpass-cdc-dma.c:274:7: warning: Branch condition evaluate=
s to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (!dmactl)
                       ^~~~~~~
   sound/soc/qcom/lpass-cdc-dma.c:261:2: note: 'dmactl' declared without an=
 initial value
           struct lpaif_dmactl *dmactl;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/lpass-cdc-dma.c:264:2: note: Control jumps to 'case 3:'  =
at line 272
           switch (cmd) {
           ^
   sound/soc/qcom/lpass-cdc-dma.c:273:3: note: Calling '__lpass_get_dmactl_=
handle'
                   __lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/lpass-cdc-dma.c:43:2: note: Control jumps to the 'default=
' case at line 56
           switch (dai_id) {
           ^
   sound/soc/qcom/lpass-cdc-dma.c:57:3: note: Left side of '&&' is true
                   dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %=
d\n", dai_id);
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
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   sound/soc/qcom/lpass-cdc-dma.c:57:3: note: Taking true branch
                   dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %=
d\n", dai_id);
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
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   sound/soc/qcom/lpass-cdc-dma.c:57:3: note: '?' condition is true
                   dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %=
d\n", dai_id);
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
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   sound/soc/qcom/lpass-cdc-dma.c:57:3: note: '?' condition is true
                   dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %=
d\n", dai_id);
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
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   sound/soc/qcom/lpass-cdc-dma.c:57:3: note: Loop condition is false.  Exi=
ting loop
                   dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %=
d\n", dai_id);
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

vim +274 sound/soc/qcom/lpass-cdc-dma.c

b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  256  =

b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  257  static int lpass_cd=
c_dma_daiops_trigger(struct snd_pcm_substream *substream,
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  258  				    int cmd, st=
ruct snd_soc_dai *dai)
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  259  {
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  260  	struct snd_soc_pcm=
_runtime *soc_runtime =3D asoc_substream_to_rtd(substream);
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  261  	struct lpaif_dmact=
l *dmactl;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  262  	int ret =3D 0, id;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  263  =

b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  264  	switch (cmd) {
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  265  	case SNDRV_PCM_TRI=
GGER_START:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  266  	case SNDRV_PCM_TRI=
GGER_RESUME:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  267  	case SNDRV_PCM_TRI=
GGER_PAUSE_RELEASE:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  268  		__lpass_platform_=
codec_intf_init(dai, substream);
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  269  		break;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  270  	case SNDRV_PCM_TRI=
GGER_STOP:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  271  	case SNDRV_PCM_TRI=
GGER_SUSPEND:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  272  	case SNDRV_PCM_TRI=
GGER_PAUSE_PUSH:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  273  		__lpass_get_dmact=
l_handle(substream, dai, &dmactl, &id);
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24 @274  		if (!dmactl)
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  275  			return -EINVAL;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  276  =

b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  277  		ret =3D regmap_fi=
elds_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_OFF);
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  278  		if (ret) {
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  279  			dev_err(soc_runt=
ime->dev,
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  280  				"error writing =
to dmactl codec_enable reg: %d\n", ret);
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  281  			return ret;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  282  		}
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  283  		break;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  284  	default:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  285  		ret =3D -EINVAL;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  286  		dev_err(soc_runti=
me->dev, "%s: invalid %d interface\n", __func__, cmd);
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  287  		break;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  288  	}
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  289  	return ret;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  290  }
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  291  =


:::::: The code at line 274 was first introduced by commit
:::::: b81af585ea54ee9f749391e594ee9cbd44061eae ASoC: qcom: Add lpass CPU d=
river for codec dma control

:::::: TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4931928301649938056==--

