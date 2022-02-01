Content-Type: multipart/mixed; boundary="===============2934930828079297898=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/sm8250.c:31:22: warning: Value stored to 'codec_dai' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 02 Feb 2022 06:03:44 +0800
Message-ID: <202202020529.KFMha7KE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2934930828079297898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: 810532e7392e764be5ee1b85603585065fa3e86b ASoC: qcom: sm8250: Add Ja=
ck support
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220131 (https://download.01.org/0day-ci/archi=
ve/20220202/202202020529.KFMha7KE-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e84=
4b69f15bb7dffaf9365cd2b355d2eb7579)
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   10 warnings generated.
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
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> sound/soc/qcom/sm8250.c:31:22: warning: Value stored to 'codec_dai' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct snd_soc_dai *codec_dai =3D asoc_rtd_to_codec(rtd, 0);
                               ^~~~~~~~~
   sound/soc/qcom/sm8250.c:31:22: note: Value stored to 'codec_dai' during =
its initialization is never read
           struct snd_soc_dai *codec_dai =3D asoc_rtd_to_codec(rtd, 0);
                               ^~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   9 warnings generated.
   sound/soc/sunxi/sun8i-codec.c:553:28: warning: The result of the left sh=
ift is undefined because the left operand is negative [clang-analyzer-core.=
UndefinedBinaryOperatorResult]
                              (lrck_div_order - 4) << SUN8I_AIF_CLK_CTRL_LR=
CK_DIV);
                              ~~~~~~~~~~~~~~~~~~~~ ^
   sound/soc/sunxi/sun8i-codec.c:498:23: note: '?' condition is true
           unsigned int slots =3D aif->slots ?: params_channels(params);
                                ^
   sound/soc/sunxi/sun8i-codec.c:499:28: note: '?' condition is true
           unsigned int slot_width =3D aif->slot_width ?: params_width(para=
ms);
                                     ^
   sound/soc/sunxi/sun8i-codec.c:505:2: note: Control jumps to 'case 24:'  =
at line 515
           switch (params_width(params)) {
           ^
   sound/soc/sunxi/sun8i-codec.c:517:3: note:  Execution continues on line =
522
                   break;
                   ^
   sound/soc/sunxi/sun8i-codec.c:528:6: note: 'lrck_div_order' is >=3D 0
           if (lrck_div_order < 0)
               ^~~~~~~~~~~~~~
   sound/soc/sunxi/sun8i-codec.c:528:2: note: Taking false branch
           if (lrck_div_order < 0)
           ^
   sound/soc/sunxi/sun8i-codec.c:531:6: note: Assuming field 'id' is not eq=
ual to SUN8I_CODEC_AIF2
           if (dai->id =3D=3D SUN8I_CODEC_AIF2 || dai->id =3D=3D SUN8I_CODE=
C_AIF3) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sunxi/sun8i-codec.c:531:6: note: Left side of '||' is false
   sound/soc/sunxi/sun8i-codec.c:531:37: note: Assuming field 'id' is not e=
qual to SUN8I_CODEC_AIF3
           if (dai->id =3D=3D SUN8I_CODEC_AIF2 || dai->id =3D=3D SUN8I_CODE=
C_AIF3) {
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sunxi/sun8i-codec.c:531:2: note: Taking false branch
           if (dai->id =3D=3D SUN8I_CODEC_AIF2 || dai->id =3D=3D SUN8I_CODE=
C_AIF3) {
           ^
   sound/soc/sunxi/sun8i-codec.c:553:28: note: The result of the left shift=
 is undefined because the left operand is negative
                              (lrck_div_order - 4) << SUN8I_AIF_CLK_CTRL_LR=
CK_DIV);
                              ~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 8 warnings (8 in non-user code).
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
   sound/soc/codecs/rt715-sdca.c:358:25: warning: The result of the left sh=
ift is undefined due to shifting by '32', which is greater or equal to the =
width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           unsigned int mask =3D (1 << fls(max)) - 1;
                                  ^  ~~~~~~~~
   sound/soc/codecs/rt715-sdca.c:358:28: note: Calling 'fls'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                     ^~~~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse

vim +/codec_dai +31 sound/soc/qcom/sm8250.c

aa2e2785545aab Srinivas Kandagatla 2020-10-26  26  =

810532e7392e76 Srinivas Kandagatla 2021-10-06  27  static int sm8250_snd_in=
it(struct snd_soc_pcm_runtime *rtd)
810532e7392e76 Srinivas Kandagatla 2021-10-06  28  {
810532e7392e76 Srinivas Kandagatla 2021-10-06  29  	struct sm8250_snd_data =
*data =3D snd_soc_card_get_drvdata(rtd->card);
810532e7392e76 Srinivas Kandagatla 2021-10-06  30  	struct snd_soc_dai *cpu=
_dai =3D asoc_rtd_to_cpu(rtd, 0);
810532e7392e76 Srinivas Kandagatla 2021-10-06 @31  	struct snd_soc_dai *cod=
ec_dai =3D asoc_rtd_to_codec(rtd, 0);
810532e7392e76 Srinivas Kandagatla 2021-10-06  32  	struct snd_soc_card *ca=
rd =3D rtd->card;
810532e7392e76 Srinivas Kandagatla 2021-10-06  33  	int rval, i;
810532e7392e76 Srinivas Kandagatla 2021-10-06  34  =

810532e7392e76 Srinivas Kandagatla 2021-10-06  35  	if (!data->jack_setup) {
810532e7392e76 Srinivas Kandagatla 2021-10-06  36  		struct snd_jack *jack;
810532e7392e76 Srinivas Kandagatla 2021-10-06  37  =

810532e7392e76 Srinivas Kandagatla 2021-10-06  38  		rval =3D snd_soc_card_=
jack_new(card, "Headset Jack",
810532e7392e76 Srinivas Kandagatla 2021-10-06  39  					     SND_JACK_HEADS=
ET | SND_JACK_LINEOUT |
810532e7392e76 Srinivas Kandagatla 2021-10-06  40  					     SND_JACK_MECHA=
NICAL |
810532e7392e76 Srinivas Kandagatla 2021-10-06  41  					     SND_JACK_BTN_0=
 | SND_JACK_BTN_1 |
810532e7392e76 Srinivas Kandagatla 2021-10-06  42  					     SND_JACK_BTN_2=
 | SND_JACK_BTN_3 |
810532e7392e76 Srinivas Kandagatla 2021-10-06  43  					     SND_JACK_BTN_4=
 | SND_JACK_BTN_5,
810532e7392e76 Srinivas Kandagatla 2021-10-06  44  					     &data->jack, N=
ULL, 0);
810532e7392e76 Srinivas Kandagatla 2021-10-06  45  =

810532e7392e76 Srinivas Kandagatla 2021-10-06  46  		if (rval < 0) {
810532e7392e76 Srinivas Kandagatla 2021-10-06  47  			dev_err(card->dev, "U=
nable to add Headphone Jack\n");
810532e7392e76 Srinivas Kandagatla 2021-10-06  48  			return rval;
810532e7392e76 Srinivas Kandagatla 2021-10-06  49  		}
810532e7392e76 Srinivas Kandagatla 2021-10-06  50  =

810532e7392e76 Srinivas Kandagatla 2021-10-06  51  		jack =3D data->jack.ja=
ck;
810532e7392e76 Srinivas Kandagatla 2021-10-06  52  =

810532e7392e76 Srinivas Kandagatla 2021-10-06  53  		snd_jack_set_key(jack,=
 SND_JACK_BTN_0, KEY_MEDIA);
810532e7392e76 Srinivas Kandagatla 2021-10-06  54  		snd_jack_set_key(jack,=
 SND_JACK_BTN_1, KEY_VOICECOMMAND);
810532e7392e76 Srinivas Kandagatla 2021-10-06  55  		snd_jack_set_key(jack,=
 SND_JACK_BTN_2, KEY_VOLUMEUP);
810532e7392e76 Srinivas Kandagatla 2021-10-06  56  		snd_jack_set_key(jack,=
 SND_JACK_BTN_3, KEY_VOLUMEDOWN);
810532e7392e76 Srinivas Kandagatla 2021-10-06  57  		data->jack_setup =3D t=
rue;
810532e7392e76 Srinivas Kandagatla 2021-10-06  58  	}
810532e7392e76 Srinivas Kandagatla 2021-10-06  59  =

810532e7392e76 Srinivas Kandagatla 2021-10-06  60  	switch (cpu_dai->id) {
810532e7392e76 Srinivas Kandagatla 2021-10-06  61  	case TX_CODEC_DMA_TX_0:
810532e7392e76 Srinivas Kandagatla 2021-10-06  62  	case TX_CODEC_DMA_TX_1:
810532e7392e76 Srinivas Kandagatla 2021-10-06  63  	case TX_CODEC_DMA_TX_2:
810532e7392e76 Srinivas Kandagatla 2021-10-06  64  	case TX_CODEC_DMA_TX_3:
810532e7392e76 Srinivas Kandagatla 2021-10-06  65  		for_each_rtd_codec_dai=
s(rtd, i, codec_dai) {
810532e7392e76 Srinivas Kandagatla 2021-10-06  66  			rval =3D snd_soc_comp=
onent_set_jack(codec_dai->component,
810532e7392e76 Srinivas Kandagatla 2021-10-06  67  							  &data->jack, NU=
LL);
810532e7392e76 Srinivas Kandagatla 2021-10-06  68  			if (rval !=3D 0 && rv=
al !=3D -ENOTSUPP) {
810532e7392e76 Srinivas Kandagatla 2021-10-06  69  				dev_warn(card->dev, =
"Failed to set jack: %d\n", rval);
810532e7392e76 Srinivas Kandagatla 2021-10-06  70  				return rval;
810532e7392e76 Srinivas Kandagatla 2021-10-06  71  			}
810532e7392e76 Srinivas Kandagatla 2021-10-06  72  		}
810532e7392e76 Srinivas Kandagatla 2021-10-06  73  =

810532e7392e76 Srinivas Kandagatla 2021-10-06  74  		break;
810532e7392e76 Srinivas Kandagatla 2021-10-06  75  	default:
810532e7392e76 Srinivas Kandagatla 2021-10-06  76  		break;
810532e7392e76 Srinivas Kandagatla 2021-10-06  77  	}
810532e7392e76 Srinivas Kandagatla 2021-10-06  78  =

810532e7392e76 Srinivas Kandagatla 2021-10-06  79  =

810532e7392e76 Srinivas Kandagatla 2021-10-06  80  	return 0;
810532e7392e76 Srinivas Kandagatla 2021-10-06  81  }
810532e7392e76 Srinivas Kandagatla 2021-10-06  82  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2934930828079297898==--

