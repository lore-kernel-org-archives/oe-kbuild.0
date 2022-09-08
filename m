Content-Type: multipart/mixed; boundary="===============3217488580061610166=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 7/8] ASoC: codecs: Add RK3308 internal audio codec driver
Date: Thu, 08 Sep 2022 21:24:36 +0800
Message-ID: <202209082103.F4ICyyHT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3217488580061610166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220907142124.2532620-8-luca.ceresoli@bootlin.com>
References: <20220907142124.2532620-8-luca.ceresoli@bootlin.com>
TO: luca.ceresoli(a)bootlin.com
TO: alsa-devel(a)alsa-project.org
TO: linux-rockchip(a)lists.infradead.org
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: devicetree(a)vger.kernel.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: Johan Jonker <jbx6244@gmail.com>
CC: Chris Morgan <macromorgan@hotmail.com>

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on rockchip/for-next tiwai-sound/for-next linus/ma=
ster v6.0-rc4 next-20220908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/luca-ceresoli-bootli=
n-com/Add-support-for-the-internal-RK3308-audio-codec/20220907-222555
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arc-randconfig-m031-20220908 (https://download.01.org/0day-ci/archi=
ve/20220908/202209082103.F4ICyyHT-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/codecs/rk3308_codec.c:748 rk3308_set_dai_fmt() error: uninitializ=
ed symbol 'is_master'.
sound/soc/codecs/rk3308_codec.c:998 rk3308_codec_digital_fadeout() warn: al=
ways true condition '(l_dgain >=3D (0 << 0)) =3D> (0-u32max >=3D 0)'
sound/soc/codecs/rk3308_codec.c:998 rk3308_codec_digital_fadeout() warn: al=
ways true condition '(l_dgain >=3D (0 << 0)) =3D> (0-u32max >=3D 0)'

vim +/is_master +748 sound/soc/codecs/rk3308_codec.c

786c160ad64ae5 Luca Ceresoli 2022-09-07  679  =

786c160ad64ae5 Luca Ceresoli 2022-09-07  680  static int rk3308_set_dai_fmt=
(struct snd_soc_dai *codec_dai,
786c160ad64ae5 Luca Ceresoli 2022-09-07  681  			      unsigned int fmt)
786c160ad64ae5 Luca Ceresoli 2022-09-07  682  {
786c160ad64ae5 Luca Ceresoli 2022-09-07  683  	struct snd_soc_component *co=
mponent =3D codec_dai->component;
786c160ad64ae5 Luca Ceresoli 2022-09-07  684  	struct rk3308_codec_priv *rk=
3308 =3D snd_soc_component_get_drvdata(component);
786c160ad64ae5 Luca Ceresoli 2022-09-07  685  	const unsigned int inv_bits =
=3D fmt & SND_SOC_DAIFMT_INV_MASK;
786c160ad64ae5 Luca Ceresoli 2022-09-07  686  	const bool inv_bitclk =3D
786c160ad64ae5 Luca Ceresoli 2022-09-07  687  		(inv_bits & SND_SOC_DAIFMT_=
IB_IF) ||
786c160ad64ae5 Luca Ceresoli 2022-09-07  688  		(inv_bits & SND_SOC_DAIFMT_=
IB_NF);
786c160ad64ae5 Luca Ceresoli 2022-09-07  689  	const bool inv_frmclk =3D
786c160ad64ae5 Luca Ceresoli 2022-09-07  690  		(inv_bits & SND_SOC_DAIFMT_=
IB_IF) ||
786c160ad64ae5 Luca Ceresoli 2022-09-07  691  		(inv_bits & SND_SOC_DAIFMT_=
NB_IF);
786c160ad64ae5 Luca Ceresoli 2022-09-07  692  =

786c160ad64ae5 Luca Ceresoli 2022-09-07  693  	unsigned int adc_aif1 =3D 0,=
 adc_aif2 =3D 0, dac_aif1 =3D 0, dac_aif2 =3D 0;
786c160ad64ae5 Luca Ceresoli 2022-09-07  694  	int grp, is_master;
786c160ad64ae5 Luca Ceresoli 2022-09-07  695  =

786c160ad64ae5 Luca Ceresoli 2022-09-07  696  	switch (fmt & SND_SOC_DAIFMT=
_MASTER_MASK) {
786c160ad64ae5 Luca Ceresoli 2022-09-07  697  	case SND_SOC_DAIFMT_CBC_CFC:
786c160ad64ae5 Luca Ceresoli 2022-09-07  698  		break;
786c160ad64ae5 Luca Ceresoli 2022-09-07  699  	case SND_SOC_DAIFMT_CBP_CFP:
786c160ad64ae5 Luca Ceresoli 2022-09-07  700  		adc_aif2 |=3D RK3308_ADC_IO=
_MODE_MASTER;
786c160ad64ae5 Luca Ceresoli 2022-09-07  701  		adc_aif2 |=3D RK3308_ADC_MO=
DE_MASTER;
786c160ad64ae5 Luca Ceresoli 2022-09-07  702  		dac_aif2 |=3D RK3308_DAC_IO=
_MODE_MASTER;
786c160ad64ae5 Luca Ceresoli 2022-09-07  703  		dac_aif2 |=3D RK3308_DAC_MO=
DE_MASTER;
786c160ad64ae5 Luca Ceresoli 2022-09-07  704  		is_master =3D 1;
786c160ad64ae5 Luca Ceresoli 2022-09-07  705  		break;
786c160ad64ae5 Luca Ceresoli 2022-09-07  706  	default:
786c160ad64ae5 Luca Ceresoli 2022-09-07  707  		return -EINVAL;
786c160ad64ae5 Luca Ceresoli 2022-09-07  708  	}
786c160ad64ae5 Luca Ceresoli 2022-09-07  709  =

786c160ad64ae5 Luca Ceresoli 2022-09-07  710  	switch (fmt & SND_SOC_DAIFMT=
_FORMAT_MASK) {
786c160ad64ae5 Luca Ceresoli 2022-09-07  711  	case SND_SOC_DAIFMT_DSP_A:
786c160ad64ae5 Luca Ceresoli 2022-09-07  712  		adc_aif1 |=3D RK3308_ADC_I2=
S_MODE_PCM;
786c160ad64ae5 Luca Ceresoli 2022-09-07  713  		dac_aif1 |=3D RK3308_DAC_I2=
S_MODE_PCM;
786c160ad64ae5 Luca Ceresoli 2022-09-07  714  		break;
786c160ad64ae5 Luca Ceresoli 2022-09-07  715  	case SND_SOC_DAIFMT_I2S:
786c160ad64ae5 Luca Ceresoli 2022-09-07  716  		adc_aif1 |=3D RK3308_ADC_I2=
S_MODE_I2S;
786c160ad64ae5 Luca Ceresoli 2022-09-07  717  		dac_aif1 |=3D RK3308_DAC_I2=
S_MODE_I2S;
786c160ad64ae5 Luca Ceresoli 2022-09-07  718  		break;
786c160ad64ae5 Luca Ceresoli 2022-09-07  719  	case SND_SOC_DAIFMT_RIGHT_J:
786c160ad64ae5 Luca Ceresoli 2022-09-07  720  		adc_aif1 |=3D RK3308_ADC_I2=
S_MODE_RJ;
786c160ad64ae5 Luca Ceresoli 2022-09-07  721  		dac_aif1 |=3D RK3308_DAC_I2=
S_MODE_RJ;
786c160ad64ae5 Luca Ceresoli 2022-09-07  722  		break;
786c160ad64ae5 Luca Ceresoli 2022-09-07  723  	case SND_SOC_DAIFMT_LEFT_J:
786c160ad64ae5 Luca Ceresoli 2022-09-07  724  		adc_aif1 |=3D RK3308_ADC_I2=
S_MODE_LJ;
786c160ad64ae5 Luca Ceresoli 2022-09-07  725  		dac_aif1 |=3D RK3308_DAC_I2=
S_MODE_LJ;
786c160ad64ae5 Luca Ceresoli 2022-09-07  726  		break;
786c160ad64ae5 Luca Ceresoli 2022-09-07  727  	default:
786c160ad64ae5 Luca Ceresoli 2022-09-07  728  		return -EINVAL;
786c160ad64ae5 Luca Ceresoli 2022-09-07  729  	}
786c160ad64ae5 Luca Ceresoli 2022-09-07  730  =

786c160ad64ae5 Luca Ceresoli 2022-09-07  731  	if (inv_bitclk) {
786c160ad64ae5 Luca Ceresoli 2022-09-07  732  		adc_aif2 |=3D RK3308_ADC_I2=
S_BIT_CLK_POL_REVERSAL;
786c160ad64ae5 Luca Ceresoli 2022-09-07  733  		dac_aif2 |=3D RK3308_DAC_I2=
S_BIT_CLK_POL_REVERSAL;
786c160ad64ae5 Luca Ceresoli 2022-09-07  734  	}
786c160ad64ae5 Luca Ceresoli 2022-09-07  735  =

786c160ad64ae5 Luca Ceresoli 2022-09-07  736  	if (inv_frmclk) {
786c160ad64ae5 Luca Ceresoli 2022-09-07  737  		adc_aif1 |=3D RK3308_ADC_I2=
S_LRC_POL_REVERSAL;
786c160ad64ae5 Luca Ceresoli 2022-09-07  738  		dac_aif1 |=3D RK3308_DAC_I2=
S_LRC_POL_REVERSAL;
786c160ad64ae5 Luca Ceresoli 2022-09-07  739  	}
786c160ad64ae5 Luca Ceresoli 2022-09-07  740  =

786c160ad64ae5 Luca Ceresoli 2022-09-07  741  	/*
786c160ad64ae5 Luca Ceresoli 2022-09-07  742  	 * Hold ADC Digital register=
s start at master mode
786c160ad64ae5 Luca Ceresoli 2022-09-07  743  	 *
786c160ad64ae5 Luca Ceresoli 2022-09-07  744  	 * There are 8 ADCs and use =
the same SCLK and LRCK internal for master
786c160ad64ae5 Luca Ceresoli 2022-09-07  745  	 * mode, We need to make sur=
e that they are in effect at the same time,
786c160ad64ae5 Luca Ceresoli 2022-09-07  746  	 * otherwise they will cause=
 the abnormal clocks.
786c160ad64ae5 Luca Ceresoli 2022-09-07  747  	 */
786c160ad64ae5 Luca Ceresoli 2022-09-07 @748  	if (is_master)
786c160ad64ae5 Luca Ceresoli 2022-09-07  749  		regmap_clear_bits(rk3308->r=
egmap, RK3308_GLB_CON, RK3308_ADC_DIG_WORK);
786c160ad64ae5 Luca Ceresoli 2022-09-07  750  =

786c160ad64ae5 Luca Ceresoli 2022-09-07  751  	for (grp =3D 0; grp < ADC_LR=
_GROUP_MAX; grp++) {
786c160ad64ae5 Luca Ceresoli 2022-09-07  752  		regmap_update_bits(rk3308->=
regmap, RK3308_ADC_DIG_CON01(grp),
786c160ad64ae5 Luca Ceresoli 2022-09-07  753  				   RK3308_ADC_I2S_LRC_POL=
_REVERSAL |
786c160ad64ae5 Luca Ceresoli 2022-09-07  754  				   RK3308_ADC_I2S_MODE_MS=
K,
786c160ad64ae5 Luca Ceresoli 2022-09-07  755  				   adc_aif1);
786c160ad64ae5 Luca Ceresoli 2022-09-07  756  		regmap_update_bits(rk3308->=
regmap, RK3308_ADC_DIG_CON02(grp),
786c160ad64ae5 Luca Ceresoli 2022-09-07  757  				   RK3308_ADC_IO_MODE_MAS=
TER |
786c160ad64ae5 Luca Ceresoli 2022-09-07  758  				   RK3308_ADC_MODE_MASTER=
 |
786c160ad64ae5 Luca Ceresoli 2022-09-07  759  				   RK3308_ADC_I2S_BIT_CLK=
_POL_REVERSAL,
786c160ad64ae5 Luca Ceresoli 2022-09-07  760  				   adc_aif2);
786c160ad64ae5 Luca Ceresoli 2022-09-07  761  	}
786c160ad64ae5 Luca Ceresoli 2022-09-07  762  =

786c160ad64ae5 Luca Ceresoli 2022-09-07  763  	/* Hold ADC Digital register=
s end at master mode */
786c160ad64ae5 Luca Ceresoli 2022-09-07  764  	if (is_master)
786c160ad64ae5 Luca Ceresoli 2022-09-07  765  		regmap_set_bits(rk3308->reg=
map, RK3308_GLB_CON, RK3308_ADC_DIG_WORK);
786c160ad64ae5 Luca Ceresoli 2022-09-07  766  =

786c160ad64ae5 Luca Ceresoli 2022-09-07  767  	regmap_update_bits(rk3308->r=
egmap, RK3308_DAC_DIG_CON01,
786c160ad64ae5 Luca Ceresoli 2022-09-07  768  			   RK3308_DAC_I2S_LRC_POL_=
REVERSAL |
786c160ad64ae5 Luca Ceresoli 2022-09-07  769  			   RK3308_DAC_I2S_MODE_MSK,
786c160ad64ae5 Luca Ceresoli 2022-09-07  770  			   dac_aif1);
786c160ad64ae5 Luca Ceresoli 2022-09-07  771  	regmap_update_bits(rk3308->r=
egmap, RK3308_DAC_DIG_CON02,
786c160ad64ae5 Luca Ceresoli 2022-09-07  772  			   RK3308_DAC_IO_MODE_MAST=
ER |
786c160ad64ae5 Luca Ceresoli 2022-09-07  773  			   RK3308_DAC_MODE_MASTER |
786c160ad64ae5 Luca Ceresoli 2022-09-07  774  			   RK3308_DAC_I2S_BIT_CLK_=
POL_REVERSAL,
786c160ad64ae5 Luca Ceresoli 2022-09-07  775  			   dac_aif2);
786c160ad64ae5 Luca Ceresoli 2022-09-07  776  =

786c160ad64ae5 Luca Ceresoli 2022-09-07  777  	return 0;
786c160ad64ae5 Luca Ceresoli 2022-09-07  778  }
786c160ad64ae5 Luca Ceresoli 2022-09-07  779  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3217488580061610166==--

