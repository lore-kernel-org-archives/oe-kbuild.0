Content-Type: multipart/mixed; boundary="===============1512473246250924158=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/sm8250.c:31:22: warning: Value stored to 'codec_dai' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 18 Apr 2022 00:49:54 +0800
Message-ID: <202204180031.zTWeKofA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1512473246250924158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a2c29ccd9477861b16ddc02c411a6c9665250558
commit: 810532e7392e764be5ee1b85603585065fa3e86b ASoC: qcom: sm8250: Add Ja=
ck support
date:   6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220417 (https://download.01.org/0day-ci/archi=
ve/20220418/202204180031.zTWeKofA-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 64c045=
e25b8471bbb572bd29159c294a82a86a25)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D810532e7392e764be5ee1b85603585065fa3e86b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 810532e7392e764be5ee1b85603585065fa3e86b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/platform_device.h:243:2: note: Returning from 'dev_set_drv=
data'
           dev_set_drvdata(&pdev->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:244:1: note: Returning without writing t=
o 'data->lock_release'
   }
   ^
   sound/soc/img/img-spdif-in.c:731:2: note: Returning from 'platform_set_d=
rvdata'
           platform_set_drvdata(pdev, spdif);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:736:2: note: Taking false branch
           if (IS_ERR(base))
           ^
   sound/soc/img/img-spdif-in.c:742:2: note: Taking false branch
           if (IS_ERR(spdif->clk_sys)) {
           ^
   sound/soc/img/img-spdif-in.c:749:2: note: Taking false branch
           if (!pm_runtime_enabled(&pdev->dev)) {
           ^
   sound/soc/img/img-spdif-in.c:755:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   sound/soc/img/img-spdif-in.c:755:2: note: Taking false branch
           if (ret < 0) {
           ^
   sound/soc/img/img-spdif-in.c:761:2: note: Taking false branch
           if (IS_ERR(rst)) {
           ^
   sound/soc/img/img-spdif-in.c:775:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_init(&spdif->lock);
           ^
   include/linux/spinlock.h:353:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   sound/soc/img/img-spdif-in.c:782:2: note: The value -128 is assigned to =
field 'lock_release'
           spdif->lock_release =3D -128;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:786:30: note: The result of the left shift =
is undefined because the left operand is negative
           reg |=3D (spdif->lock_release << IMG_SPDIF_IN_CTL_LOCKLO_SHIFT) &
                   ~~~~~~~~~~~~~~~~~~~ ^
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   sound/soc/ti/davinci-i2s.c:407:11: warning: The result of the left shift=
 is undefined because the left operand is negative [clang-analyzer-core.Und=
efinedBinaryOperatorResult]
                   srgr |=3D DAVINCI_MCBSP_SRGR_FWID(mcbsp_word_length *
                           ^
   sound/soc/ti/davinci-i2s.c:87:41: note: expanded from macro 'DAVINCI_MCB=
SP_SRGR_FWID'
   #define DAVINCI_MCBSP_SRGR_FWID(v)      ((v) << 8)
                                            ~~~ ^
   sound/soc/ti/davinci-i2s.c:390:6: note: Assuming field 'stream' is not e=
qual to SNDRV_PCM_STREAM_CAPTURE
           if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/ti/davinci-i2s.c:390:2: note: Taking false branch
           if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
           ^
   sound/soc/ti/davinci-i2s.c:402:2: note: Control jumps to 'case 16384:'  =
at line 403
           switch (master) {
           ^
   sound/soc/ti/davinci-i2s.c:407:11: note: The result of the left shift is=
 undefined because the left operand is negative
                   srgr |=3D DAVINCI_MCBSP_SRGR_FWID(mcbsp_word_length *
                           ^
   sound/soc/ti/davinci-i2s.c:87:41: note: expanded from macro 'DAVINCI_MCB=
SP_SRGR_FWID'
   #define DAVINCI_MCBSP_SRGR_FWID(v)      ((v) << 8)
                                            ~~~ ^
   sound/soc/ti/davinci-i2s.c:432:11: warning: The result of the left shift=
 is undefined because the left operand is negative [clang-analyzer-core.Und=
efinedBinaryOperatorResult]
                   srgr |=3D DAVINCI_MCBSP_SRGR_FWID(mcbsp_word_length * 8 =
- 1);
                           ^
   sound/soc/ti/davinci-i2s.c:87:41: note: expanded from macro 'DAVINCI_MCB=
SP_SRGR_FWID'
   #define DAVINCI_MCBSP_SRGR_FWID(v)      ((v) << 8)
                                            ~~~ ^
   sound/soc/ti/davinci-i2s.c:390:6: note: Assuming field 'stream' is not e=
qual to SNDRV_PCM_STREAM_CAPTURE
           if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/ti/davinci-i2s.c:390:2: note: Taking false branch
           if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
           ^
   sound/soc/ti/davinci-i2s.c:402:2: note: Control jumps to 'case 12288:'  =
at line 429
           switch (master) {
           ^
   sound/soc/ti/davinci-i2s.c:432:11: note: The result of the left shift is=
 undefined because the left operand is negative
                   srgr |=3D DAVINCI_MCBSP_SRGR_FWID(mcbsp_word_length * 8 =
- 1);
                           ^
   sound/soc/ti/davinci-i2s.c:87:41: note: expanded from macro 'DAVINCI_MCB=
SP_SRGR_FWID'
   #define DAVINCI_MCBSP_SRGR_FWID(v)      ((v) << 8)
                                            ~~~ ^
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   sound/soc/qcom/sdm845.c:76:4: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                           ret =3D snd_soc_dai_set_channel_map(cpu_dai, 0, =
NULL,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   sound/soc/qcom/sdm845.c:76:4: note: Value stored to 'ret' is never read
                           ret =3D snd_soc_dai_set_channel_map(cpu_dai, 0, =
NULL,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   sound/soc/qcom/sdm845.c:79:4: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                           ret =3D snd_soc_dai_set_channel_map(cpu_dai, tx_=
ch_cnt,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   sound/soc/qcom/sdm845.c:79:4: note: Value stored to 'ret' is never read
                           ret =3D snd_soc_dai_set_channel_map(cpu_dai, tx_=
ch_cnt,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   1 warning generated.
>> sound/soc/qcom/sm8250.c:31:22: warning: Value stored to 'codec_dai' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct snd_soc_dai *codec_dai =3D asoc_rtd_to_codec(rtd, 0);
                               ^~~~~~~~~
   sound/soc/qcom/sm8250.c:31:22: note: Value stored to 'codec_dai' during =
its initialization is never read
           struct snd_soc_dai *codec_dai =3D asoc_rtd_to_codec(rtd, 0);
                               ^~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/mtd/nand/raw/nand_bbt.c:579:3: warning: Value stored to 'bbtbloc=
ks' is never read [clang-analyzer-deadcode.DeadStores]
                   bbtblocks =3D mtd->size >> this->bbt_erase_shift;
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_bbt.c:579:3: note: Value stored to 'bbtblocks'=
 is never read
                   bbtblocks =3D mtd->size >> this->bbt_erase_shift;
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/crypto/caam/ctrl.c:388:2: warning: Value stored to 'val' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           val =3D rd_reg32(&r4tst->rtmctl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/caam/ctrl.c:388:2: note: Value stored to 'val' is never r=
ead
           val =3D rd_reg32(&r4tst->rtmctl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   sound/soc/codecs/tas2770.c:50:23: warning: Value stored to 'tas2770' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tas2770_priv *tas2770 =3D
                                ^~~~~~~
   sound/soc/codecs/tas2770.c:50:23: note: Value stored to 'tas2770' during=
 its initialization is never read
           struct tas2770_priv *tas2770 =3D
                                ^~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   net/core/bpf_sk_storage.c:754:4: warning: Value stored to 'b' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           b =3D &smap->buckets[bucket_id++];
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/bpf_sk_storage.c:754:4: note: Value stored to 'b' is never read
                           b =3D &smap->buckets[bucket_id++];
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/iio/gyro/adxrs450.c:73:8: warning: Excessive padding in 'struct =
adxrs450_state' (36 padding bytes, where 4 is optimal). =

   Optimal fields order: =

   tx, =

   us, =

   rx, =

   buf_lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adxrs450_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/iio/gyro/adxrs450.c:73:8: note: Excessive padding in 'struct adx=
rs450_state' (36 padding bytes, where 4 is optimal). Optimal fields order: =
tx, us, rx, buf_lock, consider reordering the fields or adding explicit pad=
ding members
   struct adxrs450_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/iio/gyro/itg3200_core.c:94:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D itg3200_read_reg_s16(indio_dev, reg, val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/gyro/itg3200_core.c:94:3: note: Value stored to 'ret' is nev=
er read
                   ret =3D itg3200_read_reg_s16(indio_dev, reg, val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/iio/frequency/ad9523.c:266:8: warning: Excessive padding in 'str=
uct ad9523_state' (34 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   reg, =

   pdata, =

   pwrdown_gpio, =

   reset_gpio, =

   sync_gpio, =

   vcxo_freq, =

   vco_freq, =

   vco_out_freq, =

   lock, =

   ad9523_channels, =

   vco_out_map, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad9523_state {

vim +/codec_dai +31 sound/soc/qcom/sm8250.c

aa2e2785545aab2 Srinivas Kandagatla 2020-10-26  26  =

810532e7392e764 Srinivas Kandagatla 2021-10-06  27  static int sm8250_snd_i=
nit(struct snd_soc_pcm_runtime *rtd)
810532e7392e764 Srinivas Kandagatla 2021-10-06  28  {
810532e7392e764 Srinivas Kandagatla 2021-10-06  29  	struct sm8250_snd_data=
 *data =3D snd_soc_card_get_drvdata(rtd->card);
810532e7392e764 Srinivas Kandagatla 2021-10-06  30  	struct snd_soc_dai *cp=
u_dai =3D asoc_rtd_to_cpu(rtd, 0);
810532e7392e764 Srinivas Kandagatla 2021-10-06 @31  	struct snd_soc_dai *co=
dec_dai =3D asoc_rtd_to_codec(rtd, 0);
810532e7392e764 Srinivas Kandagatla 2021-10-06  32  	struct snd_soc_card *c=
ard =3D rtd->card;
810532e7392e764 Srinivas Kandagatla 2021-10-06  33  	int rval, i;
810532e7392e764 Srinivas Kandagatla 2021-10-06  34  =

810532e7392e764 Srinivas Kandagatla 2021-10-06  35  	if (!data->jack_setup)=
 {
810532e7392e764 Srinivas Kandagatla 2021-10-06  36  		struct snd_jack *jack;
810532e7392e764 Srinivas Kandagatla 2021-10-06  37  =

810532e7392e764 Srinivas Kandagatla 2021-10-06  38  		rval =3D snd_soc_card=
_jack_new(card, "Headset Jack",
810532e7392e764 Srinivas Kandagatla 2021-10-06  39  					     SND_JACK_HEAD=
SET | SND_JACK_LINEOUT |
810532e7392e764 Srinivas Kandagatla 2021-10-06  40  					     SND_JACK_MECH=
ANICAL |
810532e7392e764 Srinivas Kandagatla 2021-10-06  41  					     SND_JACK_BTN_=
0 | SND_JACK_BTN_1 |
810532e7392e764 Srinivas Kandagatla 2021-10-06  42  					     SND_JACK_BTN_=
2 | SND_JACK_BTN_3 |
810532e7392e764 Srinivas Kandagatla 2021-10-06  43  					     SND_JACK_BTN_=
4 | SND_JACK_BTN_5,
810532e7392e764 Srinivas Kandagatla 2021-10-06  44  					     &data->jack, =
NULL, 0);
810532e7392e764 Srinivas Kandagatla 2021-10-06  45  =

810532e7392e764 Srinivas Kandagatla 2021-10-06  46  		if (rval < 0) {
810532e7392e764 Srinivas Kandagatla 2021-10-06  47  			dev_err(card->dev, "=
Unable to add Headphone Jack\n");
810532e7392e764 Srinivas Kandagatla 2021-10-06  48  			return rval;
810532e7392e764 Srinivas Kandagatla 2021-10-06  49  		}
810532e7392e764 Srinivas Kandagatla 2021-10-06  50  =

810532e7392e764 Srinivas Kandagatla 2021-10-06  51  		jack =3D data->jack.j=
ack;
810532e7392e764 Srinivas Kandagatla 2021-10-06  52  =

810532e7392e764 Srinivas Kandagatla 2021-10-06  53  		snd_jack_set_key(jack=
, SND_JACK_BTN_0, KEY_MEDIA);
810532e7392e764 Srinivas Kandagatla 2021-10-06  54  		snd_jack_set_key(jack=
, SND_JACK_BTN_1, KEY_VOICECOMMAND);
810532e7392e764 Srinivas Kandagatla 2021-10-06  55  		snd_jack_set_key(jack=
, SND_JACK_BTN_2, KEY_VOLUMEUP);
810532e7392e764 Srinivas Kandagatla 2021-10-06  56  		snd_jack_set_key(jack=
, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
810532e7392e764 Srinivas Kandagatla 2021-10-06  57  		data->jack_setup =3D =
true;
810532e7392e764 Srinivas Kandagatla 2021-10-06  58  	}
810532e7392e764 Srinivas Kandagatla 2021-10-06  59  =

810532e7392e764 Srinivas Kandagatla 2021-10-06  60  	switch (cpu_dai->id) {
810532e7392e764 Srinivas Kandagatla 2021-10-06  61  	case TX_CODEC_DMA_TX_0:
810532e7392e764 Srinivas Kandagatla 2021-10-06  62  	case TX_CODEC_DMA_TX_1:
810532e7392e764 Srinivas Kandagatla 2021-10-06  63  	case TX_CODEC_DMA_TX_2:
810532e7392e764 Srinivas Kandagatla 2021-10-06  64  	case TX_CODEC_DMA_TX_3:
810532e7392e764 Srinivas Kandagatla 2021-10-06  65  		for_each_rtd_codec_da=
is(rtd, i, codec_dai) {
810532e7392e764 Srinivas Kandagatla 2021-10-06  66  			rval =3D snd_soc_com=
ponent_set_jack(codec_dai->component,
810532e7392e764 Srinivas Kandagatla 2021-10-06  67  							  &data->jack, N=
ULL);
810532e7392e764 Srinivas Kandagatla 2021-10-06  68  			if (rval !=3D 0 && r=
val !=3D -ENOTSUPP) {
810532e7392e764 Srinivas Kandagatla 2021-10-06  69  				dev_warn(card->dev,=
 "Failed to set jack: %d\n", rval);
810532e7392e764 Srinivas Kandagatla 2021-10-06  70  				return rval;
810532e7392e764 Srinivas Kandagatla 2021-10-06  71  			}
810532e7392e764 Srinivas Kandagatla 2021-10-06  72  		}
810532e7392e764 Srinivas Kandagatla 2021-10-06  73  =

810532e7392e764 Srinivas Kandagatla 2021-10-06  74  		break;
810532e7392e764 Srinivas Kandagatla 2021-10-06  75  	default:
810532e7392e764 Srinivas Kandagatla 2021-10-06  76  		break;
810532e7392e764 Srinivas Kandagatla 2021-10-06  77  	}
810532e7392e764 Srinivas Kandagatla 2021-10-06  78  =

810532e7392e764 Srinivas Kandagatla 2021-10-06  79  =

810532e7392e764 Srinivas Kandagatla 2021-10-06  80  	return 0;
810532e7392e764 Srinivas Kandagatla 2021-10-06  81  }
810532e7392e764 Srinivas Kandagatla 2021-10-06  82  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1512473246250924158==--

