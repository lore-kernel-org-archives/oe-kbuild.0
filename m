Content-Type: multipart/mixed; boundary="===============4672030775616826512=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/lpass-cdc-dma.c:274:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Fri, 08 Apr 2022 05:22:48 +0800
Message-ID: <202204080500.DekgLkn3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4672030775616826512==
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
head:   42e7a03d3badebd4e70aea5362d6914dfc7c220b
commit: b62c4e5fba2f910bc9f23ae152d11627e4c2f00f ASoC: qcom: lpass-sc7280: =
Add platform driver for lpass audio
date:   6 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220406 (https://download.01.org/0day-ci/archi=
ve/20220408/202204080500.DekgLkn3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
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
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   sound/soc/sh/rcar/rsnd.h:818:41: note: expanded from macro 'rsnd_src_get=
_out_rate'
   #define rsnd_src_get_out_rate(priv, io) rsnd_src_get_rate(priv, io, 0)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/src.c:117:29: note: RSND_MOD_SRC is < RSND_MOD_MAX
           struct rsnd_mod *src_mod =3D rsnd_io_to_mod_src(io);
                                      ^
   sound/soc/sh/rcar/rsnd.h:521:32: note: expanded from macro 'rsnd_io_to_m=
od_src'
   #define rsnd_io_to_mod_src(io)  rsnd_io_to_mod((io), RSND_MOD_SRC)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/rsnd.h:517:32: note: expanded from macro 'rsnd_io_to_m=
od'
   #define rsnd_io_to_mod(io, i)   ((i) < RSND_MOD_MAX ? (io)->mod[(i)] : N=
ULL)
                                    ^~~
   sound/soc/sh/rcar/src.c:117:29: note: '?' condition is true
           struct rsnd_mod *src_mod =3D rsnd_io_to_mod_src(io);
                                      ^
   sound/soc/sh/rcar/rsnd.h:521:32: note: expanded from macro 'rsnd_io_to_m=
od_src'
   #define rsnd_io_to_mod_src(io)  rsnd_io_to_mod((io), RSND_MOD_SRC)
                                   ^
   sound/soc/sh/rcar/rsnd.h:517:32: note: expanded from macro 'rsnd_io_to_m=
od'
   #define rsnd_io_to_mod(io, i)   ((i) < RSND_MOD_MAX ? (io)->mod[(i)] : N=
ULL)
                                    ^
   sound/soc/sh/rcar/src.c:118:36: note: Field 'substream' is non-null
           struct snd_pcm_runtime *runtime =3D rsnd_io_to_runtime(io);
                                             ^
   sound/soc/sh/rcar/rsnd.h:529:39: note: expanded from macro 'rsnd_io_to_r=
untime'
   #define rsnd_io_to_runtime(io) ((io)->substream ? \
                                         ^
   sound/soc/sh/rcar/src.c:118:36: note: '?' condition is true
           struct snd_pcm_runtime *runtime =3D rsnd_io_to_runtime(io);
                                             ^
   sound/soc/sh/rcar/rsnd.h:529:33: note: expanded from macro 'rsnd_io_to_r=
untime'
   #define rsnd_io_to_runtime(io) ((io)->substream ? \
                                   ^
   sound/soc/sh/rcar/src.c:130:6: note: Assuming 'is_play' is equal to 'is_=
in'
           if (is_play =3D=3D is_in)
               ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/src.c:130:2: note: Taking true branch
           if (is_play =3D=3D is_in)
           ^
   sound/soc/sh/rcar/src.c:131:3: note: Returning zero
                   return runtime->rate;
                   ^~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/src.c:222:9: note: Returning from 'rsnd_src_get_rate'
           fout =3D rsnd_src_get_out_rate(priv, io);
                  ^
   sound/soc/sh/rcar/rsnd.h:818:41: note: expanded from macro 'rsnd_src_get=
_out_rate'
   #define rsnd_src_get_out_rate(priv, io) rsnd_src_get_rate(priv, io, 0)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/src.c:222:2: note: The value 0 is assigned to 'fout'
           fout =3D rsnd_src_get_out_rate(priv, io);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/src.c:227:6: note: 'fin' is equal to 'fout'
           if (fin =3D=3D fout)
               ^~~
   sound/soc/sh/rcar/src.c:227:2: note: Taking true branch
           if (fin =3D=3D fout)
           ^
   sound/soc/sh/rcar/src.c:234:6: note: 'ratio' is <=3D 600
           if (ratio > 600) {
               ^~~~~
   sound/soc/sh/rcar/src.c:234:2: note: Taking false branch
           if (ratio > 600) {
           ^
   sound/soc/sh/rcar/src.c:251:6: note: Assuming 'use_src' is not equal to 0
           if (use_src) {
               ^~~~~~~
   sound/soc/sh/rcar/src.c:251:2: note: Taking true branch
           if (use_src) {
           ^
   sound/soc/sh/rcar/src.c:256:3: note: '__base' initialized to 0
                   do_div(n, fout);
                   ^
   include/asm-generic/div64.h:220:2: note: expanded from macro 'do_div'
           uint32_t __base =3D (base);                       \
           ^~~~~~~~~~~~~~~
   sound/soc/sh/rcar/src.c:256:3: note: Left side of '&&' is false
                   do_div(n, fout);
                   ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   sound/soc/sh/rcar/src.c:256:3: note: Left side of '&&' is false
                   do_div(n, fout);
                   ^
   include/asm-generic/div64.h:227:42: note: expanded from macro 'do_div'
           } else if (__builtin_constant_p(__base) &&      \
                                                   ^
   sound/soc/sh/rcar/src.c:256:3: note: Taking true branch
                   do_div(n, fout);
                   ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   sound/soc/sh/rcar/src.c:256:3: note: Division by zero
                   do_div(n, fout);
                   ^
   include/asm-generic/div64.h:235:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                           ~~~~~~~~~~~~~~^~~~~~~~
   1 warning generated.
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
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   sound/soc/qcom/lpass-cdc-dma.c:58:3: note:  Execution continues on line =
57
                   break;
                   ^
   sound/soc/qcom/lpass-cdc-dma.c:60:1: note: Returning without writing to =
'*dmactl'
   }
   ^
   sound/soc/qcom/lpass-cdc-dma.c:273:3: note: Returning from '__lpass_get_=
dmactl_handle'
                   __lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/lpass-cdc-dma.c:274:7: note: Branch condition evaluates t=
o a garbage value
                   if (!dmactl)
                       ^~~~~~~
   1 warning generated.
   drivers/iio/gyro/fxas21002c_core.c:137:8: warning: Excessive padding in =
'struct fxas21002c_data' (51 padding bytes, where 19 is optimal). =

   Optimal fields order: =

   buffer, =

   timestamp, =

   mode, =

   prev_mode, =

   regmap, =

   dready_trig, =

   irq, =

   vdd, =

   vddio, =

   lock, =

   regmap_fields, =

   chip_id, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct fxas21002c_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/iio/gyro/fxas21002c_core.c:137:8: note: Excessive padding in 'st=
ruct fxas21002c_data' (51 padding bytes, where 19 is optimal). Optimal fiel=
ds order: buffer, timestamp, mode, prev_mode, regmap, dready_trig, irq, vdd=
, vddio, lock, regmap_fields, chip_id, consider reordering the fields or ad=
ding explicit padding members
   struct fxas21002c_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/iio/frequency/adf4371.c:157:8: warning: Excessive padding in 'st=
ruct adf4371_state' (42 padding bytes, where 10 is optimal). =

   Optimal fields order: =

   buf, =

   spi, =

   regmap, =

   clkin, =

   chip_info, =

   clkin_freq, =

   fpfd, =

   integer, =

   fract1, =

   fract2, =

   mod2, =

   rf_div_sel, =

   ref_div_factor, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adf4371_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/frequency/adf4371.c:157:8: note: Excessive padding in 'struc=
t adf4371_state' (42 padding bytes, where 10 is optimal). Optimal fields or=
der: buf, spi, regmap, clkin, chip_info, clkin_freq, fpfd, integer, fract1,=
 fract2, mod2, rf_div_sel, ref_div_factor, lock, consider reordering the fi=
elds or adding explicit padding members
   struct adf4371_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   1 warning generated.
   drivers/iio/frequency/admv1013.c:93:8: warning: Excessive padding in 'st=
ruct admv1013_state' (32 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   data, =

   det_en, =

   spi, =

   clkin, =

   reg, =

   input_mode, =

   quad_se_mode, =

   nb, =

   lock, =


vim +274 sound/soc/qcom/lpass-cdc-dma.c

b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  256  =

b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  257  static int lpass_c=
dc_dma_daiops_trigger(struct snd_pcm_substream *substream,
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  258  				    int cmd, s=
truct snd_soc_dai *dai)
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  259  {
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  260  	struct snd_soc_pc=
m_runtime *soc_runtime =3D asoc_substream_to_rtd(substream);
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  261  	struct lpaif_dmac=
tl *dmactl;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  262  	int ret =3D 0, id;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  263  =

b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  264  	switch (cmd) {
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  265  	case SNDRV_PCM_TR=
IGGER_START:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  266  	case SNDRV_PCM_TR=
IGGER_RESUME:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  267  	case SNDRV_PCM_TR=
IGGER_PAUSE_RELEASE:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  268  		__lpass_platform=
_codec_intf_init(dai, substream);
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  269  		break;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  270  	case SNDRV_PCM_TR=
IGGER_STOP:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  271  	case SNDRV_PCM_TR=
IGGER_SUSPEND:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  272  	case SNDRV_PCM_TR=
IGGER_PAUSE_PUSH:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  273  		__lpass_get_dmac=
tl_handle(substream, dai, &dmactl, &id);
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24 @274  		if (!dmactl)
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  275  			return -EINVAL;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  276  =

b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  277  		ret =3D regmap_f=
ields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_OFF);
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  278  		if (ret) {
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  279  			dev_err(soc_run=
time->dev,
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  280  				"error writing=
 to dmactl codec_enable reg: %d\n", ret);
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  281  			return ret;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  282  		}
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  283  		break;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  284  	default:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  285  		ret =3D -EINVAL;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  286  		dev_err(soc_runt=
ime->dev, "%s: invalid %d interface\n", __func__, cmd);
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  287  		break;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  288  	}
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  289  	return ret;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  290  }
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  291  =


:::::: The code at line 274 was first introduced by commit
:::::: b81af585ea54ee9f749391e594ee9cbd44061eae ASoC: qcom: Add lpass CPU d=
river for codec dma control

:::::: TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4672030775616826512==--

