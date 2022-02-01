Content-Type: multipart/mixed; boundary="===============6680170321463832017=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/sm8250.c:31:22: warning: Value stored to 'codec_dai' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 01 Feb 2022 09:23:47 +0800
Message-ID: <202202010950.4YpHGG0k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6680170321463832017==
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
config: arm-randconfig-c002-20220122 (https://download.01.org/0day-ci/archi=
ve/20220201/202202010950.4YpHGG0k-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
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
                           if (rkey !=3D keys[level]) {
                               ^~~~~~~~~~~~~~~~~~~
   drivers/md/persistent-data/dm-btree.c:397:4: note: Taking false branch
                           if (rkey !=3D keys[level]) {
                           ^
   drivers/md/persistent-data/dm-btree.c:406:8: note: Assigned value is gar=
bage or undefined
                   root =3D le64_to_cpu(internal_value_le);
                        ^
   drivers/md/persistent-data/dm-btree.c:1091:3: warning: Value stored to '=
node' is never read [clang-analyzer-deadcode.DeadStores]
                   node =3D dm_block_data(shadow_current(s));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/persistent-data/dm-btree.c:1091:3: note: Value stored to 'nod=
e' is never read
                   node =3D dm_block_data(shadow_current(s));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/persistent-data/dm-btree.c:1155:3: warning: Value stored to '=
node' is never read [clang-analyzer-deadcode.DeadStores]
                   node =3D dm_block_data(shadow_current(s));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/persistent-data/dm-btree.c:1155:3: note: Value stored to 'nod=
e' is never read
                   node =3D dm_block_data(shadow_current(s));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/hwspinlock/qcom_hwspinlock.c:158:24: warning: Passed-by-value st=
ruct argument contains uninitialized data (e.g., field: 'id_size') [clang-a=
nalyzer-core.CallAndMessage]
                   bank->lock[i].priv =3D devm_regmap_field_alloc(&pdev->de=
v,
                                        ^
   drivers/hwspinlock/qcom_hwspinlock.c:132:2: note: 'field' initialized he=
re
           struct reg_field field;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:140:21: note: Left side of '&&' is =
false
           if (IS_ERR(regmap) && PTR_ERR(regmap) =3D=3D -ENODEV)
                              ^
   drivers/hwspinlock/qcom_hwspinlock.c:143:6: note: Calling 'IS_ERR'
           if (IS_ERR(regmap))
               ^~~~~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:143:6: note: Returning from 'IS_ERR'
           if (IS_ERR(regmap))
               ^~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:143:2: note: Taking false branch
           if (IS_ERR(regmap))
           ^
   drivers/hwspinlock/qcom_hwspinlock.c:148:6: note: Assuming 'bank' is non=
-null
           if (!bank)
               ^~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:148:2: note: Taking false branch
           if (!bank)
           ^
   drivers/hwspinlock/qcom_hwspinlock.c:153:2: note: Loop condition is true=
.  Entering loop body
           for (i =3D 0; i < QCOM_MUTEX_NUM_LOCKS; i++) {
           ^
   drivers/hwspinlock/qcom_hwspinlock.c:158:24: note: Passed-by-value struc=
t argument contains uninitialized data (e.g., field: 'id_size')
                   bank->lock[i].priv =3D devm_regmap_field_alloc(&pdev->de=
v,
                                        ^
   1 warning generated.
   sound/soc/codecs/tas2562.c:69:23: warning: Value stored to 'tas2562' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tas2562_data *tas2562 =3D
                                ^~~~~~~
   sound/soc/codecs/tas2562.c:69:23: note: Value stored to 'tas2562' during=
 its initialization is never read
           struct tas2562_data *tas2562 =3D
                                ^~~~~~~
   1 warning generated.
   sound/soc/codecs/tas2770.c:50:23: warning: Value stored to 'tas2770' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tas2770_priv *tas2770 =3D
                                ^~~~~~~
   sound/soc/codecs/tas2770.c:50:23: note: Value stored to 'tas2770' during=
 its initialization is never read
           struct tas2770_priv *tas2770 =3D
                                ^~~~~~~
   2 warnings generated.
   block/badblocks.c:68:3: warning: Value stored to 'sectors' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   sectors =3D target - s;
                   ^         ~~~~~~~~~~
   block/badblocks.c:68:3: note: Value stored to 'sectors' is never read
                   sectors =3D target - s;
                   ^         ~~~~~~~~~~
   block/badblocks.c:348:3: warning: Value stored to 'sectors' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   sectors =3D target - s;
                   ^         ~~~~~~~~~~
   block/badblocks.c:348:3: note: Value stored to 'sectors' is never read
                   sectors =3D target - s;
                   ^         ~~~~~~~~~~
   1 warning generated.
   sound/soc/kirkwood/kirkwood-i2s.c:322:2: warning: Value stored to 'value=
' is never read [clang-analyzer-deadcode.DeadStores]
           value =3D readl(priv->io + KIRKWOOD_RECCTL);
           ^
   sound/soc/kirkwood/kirkwood-i2s.c:322:2: note: Value stored to 'value' i=
s never read
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
   sound/soc/codecs/da7213.c:1427:3: warning: Value stored to 'indiv' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   indiv =3D DA7213_PLL_INDIV_9_TO_18_MHZ_VAL;
                   ^
   sound/soc/codecs/da7213.c:1427:3: note: Value stored to 'indiv' is never=
 read
   1 warning generated.
   drivers/input/joystick/adi.c:139:6: warning: Although the value stored t=
o 'z' is used in the enclosing expression, the value is never actually read=
 from 'z' [clang-analyzer-deadcode.DeadStores]
           v =3D z =3D gameport_read(gameport);
               ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/joystick/adi.c:139:6: note: Although the value stored to '=
z' is used in the enclosing expression, the value is never actually read fr=
om 'z'
           v =3D z =3D gameport_read(gameport);
               ^   ~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/iio/dac/ad5449.c:61:8: warning: Excessive padding in 'struct ad5=
449' (39 padding bytes, where 7 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   chip_info, =

   lock, =

   vref_reg, =

   dac_cache, =

   has_sdo, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5449 {
   ~~~~~~~^~~~~~~~
   drivers/iio/dac/ad5449.c:61:8: note: Excessive padding in 'struct ad5449=
' (39 padding bytes, where 7 is optimal). Optimal fields order: data, spi, =
chip_info, lock, vref_reg, dac_cache, has_sdo, consider reordering the fiel=
ds or adding explicit padding members
   struct ad5449 {
   ~~~~~~~^~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   fs/ntfs3/file.c:496:2: warning: Value stored to 'err' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           err =3D attr_set_size(ni, ATTR_DATA, NULL, 0, &ni->file.run, new=
_size,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/file.c:496:2: note: Value stored to 'err' is never read
           err =3D attr_set_size(ni, ATTR_DATA, NULL, 0, &ni->file.run, new=
_size,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/file.c:988:3: warning: Value stored to 'frame' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   frame =3D pos >> frame_bits;
                   ^       ~~~~~~~~~~~~~~~~~
   fs/ntfs3/file.c:988:3: note: Value stored to 'frame' is never read
                   frame =3D pos >> frame_bits;
                   ^       ~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/mtd/nand/spi/gigadevice.c:195:14: warning: The left operand of '=
&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           ((status2 & STATUS_ECC_MASK) >> 4);
                             ~~~~~~~ ^
   drivers/mtd/nand/spi/gigadevice.c:171:2: note: 'status2' declared withou=
t an initial value
           u8 status2;
           ^~~~~~~~~~
   drivers/mtd/nand/spi/gigadevice.c:176:2: note: Control jumps to 'case 16=
:'  at line 180
           switch (status & STATUS_ECC_MASK) {
           ^
   drivers/mtd/nand/spi/gigadevice.c:186:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   drivers/mtd/nand/spi/gigadevice.c:186:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/mtd/nand/spi/gigadevice.c:195:14: note: The left operand of '&' =
is a garbage value
                           ((status2 & STATUS_ECC_MASK) >> 4);
                             ~~~~~~~ ^
   drivers/mtd/nand/spi/gigadevice.c:235:20: warning: The left operand of '=
&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   return ((status2 & STATUS_ECC_MASK) >> 4) + 1;
                            ~~~~~~~ ^
   drivers/mtd/nand/spi/gigadevice.c:213:2: note: 'status2' declared withou=
t an initial value
           u8 status2;
           ^~~~~~~~~~
   drivers/mtd/nand/spi/gigadevice.c:218:2: note: Control jumps to 'case 16=
:'  at line 222
           switch (status & STATUS_ECC_MASK) {
           ^
   drivers/mtd/nand/spi/gigadevice.c:228:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   drivers/mtd/nand/spi/gigadevice.c:228:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/mtd/nand/spi/gigadevice.c:235:20: note: The left operand of '&' =
is a garbage value
                   return ((status2 & STATUS_ECC_MASK) >> 4) + 1;
                            ~~~~~~~ ^
   1 warning generated.
   drivers/mtd/nand/spi/macronix.c:63:9: warning: The left expression of th=
e compound assignment is an uninitialized value. The computed value will al=
so be garbage [clang-analyzer-core.uninitialized.Assign]
           *eccsr &=3D MACRONIX_ECCSR_MASK;
                  ^
   drivers/mtd/nand/spi/macronix.c:71:2: note: 'eccsr' declared without an =
initial value
           u8 eccsr;
           ^~~~~~~~
   drivers/mtd/nand/spi/macronix.c:73:2: note: Control jumps to 'case 16:' =
 at line 80
           switch (status & STATUS_ECC_MASK) {
           ^
   drivers/mtd/nand/spi/macronix.c:86:7: note: Calling 'mx35lf1ge4ab_get_ec=
csr'
                   if (mx35lf1ge4ab_get_eccsr(spinand, &eccsr))

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
--===============6680170321463832017==--

