Content-Type: multipart/mixed; boundary="===============0300039804039530140=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-sound:for-6.1 3/22] sound/soc/codecs/src4xxx.c:288 src4xxx_hw_params() error: uninitialized symbol 'pj'.
Date: Wed, 17 Aug 2022 03:55:17 +0800
Message-ID: <202208170317.bCGqTwpU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0300039804039530140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Matt Flax <flatmax@flatmax.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-6.1
head:   6256547352fa21356de8d26b058e50d719ecc0d2
commit: 4e6bedd3c396014ba70de2b4c9995c8e024e82b3 [3/22] ASoC: codecs: add s=
upport for the TI SRC4392 codec
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-m031-20220815 (https://download.01.org/0day-ci/archi=
ve/20220817/202208170317.bCGqTwpU-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/codecs/src4xxx.c:288 src4xxx_hw_params() error: uninitialized sym=
bol 'pj'.
sound/soc/codecs/src4xxx.c:293 src4xxx_hw_params() error: uninitialized sym=
bol 'jd'.
sound/soc/codecs/src4xxx.c:298 src4xxx_hw_params() error: uninitialized sym=
bol 'd'.

vim +/pj +288 sound/soc/codecs/src4xxx.c

4e6bedd3c396014 Matt Flax 2022-08-10  215  =

4e6bedd3c396014 Matt Flax 2022-08-10  216  static int src4xxx_hw_params(str=
uct snd_pcm_substream *substream,
4e6bedd3c396014 Matt Flax 2022-08-10  217  			struct snd_pcm_hw_params *par=
ams,
4e6bedd3c396014 Matt Flax 2022-08-10  218  			struct snd_soc_dai *dai)
4e6bedd3c396014 Matt Flax 2022-08-10  219  {
4e6bedd3c396014 Matt Flax 2022-08-10  220  	struct snd_soc_component *compo=
nent =3D dai->component;
4e6bedd3c396014 Matt Flax 2022-08-10  221  	struct src4xxx *src4xxx =3D snd=
_soc_component_get_drvdata(component);
4e6bedd3c396014 Matt Flax 2022-08-10  222  	unsigned int mclk_div;
4e6bedd3c396014 Matt Flax 2022-08-10  223  	int val, pj, jd, d;
4e6bedd3c396014 Matt Flax 2022-08-10  224  	int reg;
4e6bedd3c396014 Matt Flax 2022-08-10  225  	int ret;
4e6bedd3c396014 Matt Flax 2022-08-10  226  =

4e6bedd3c396014 Matt Flax 2022-08-10  227  	switch (dai->id) {
4e6bedd3c396014 Matt Flax 2022-08-10  228  	case SRC4XXX_PORTB:
4e6bedd3c396014 Matt Flax 2022-08-10  229  		reg =3D SRC4XXX_PORTB_CTL_06;
4e6bedd3c396014 Matt Flax 2022-08-10  230  		break;
4e6bedd3c396014 Matt Flax 2022-08-10  231  	default:
4e6bedd3c396014 Matt Flax 2022-08-10  232  		reg =3D SRC4XXX_PORTA_CTL_04;
4e6bedd3c396014 Matt Flax 2022-08-10  233  		break;
4e6bedd3c396014 Matt Flax 2022-08-10  234  	}
4e6bedd3c396014 Matt Flax 2022-08-10  235  =

4e6bedd3c396014 Matt Flax 2022-08-10  236  	if (src4xxx->master[dai->id]) {
4e6bedd3c396014 Matt Flax 2022-08-10  237  		mclk_div =3D src4xxx->mclk_hz/=
params_rate(params);
4e6bedd3c396014 Matt Flax 2022-08-10  238  		if (src4xxx->mclk_hz !=3D mclk=
_div*params_rate(params)) {
4e6bedd3c396014 Matt Flax 2022-08-10  239  			dev_err(component->dev,
4e6bedd3c396014 Matt Flax 2022-08-10  240  				"mclk %d / rate %d has a rem=
ainder.\n",
4e6bedd3c396014 Matt Flax 2022-08-10  241  				src4xxx->mclk_hz, params_rat=
e(params));
4e6bedd3c396014 Matt Flax 2022-08-10  242  			return -EINVAL;
4e6bedd3c396014 Matt Flax 2022-08-10  243  		}
4e6bedd3c396014 Matt Flax 2022-08-10  244  =

4e6bedd3c396014 Matt Flax 2022-08-10  245  		val =3D ((int)mclk_div - 128) =
/ 128;
4e6bedd3c396014 Matt Flax 2022-08-10  246  		if ((val < 0) | (val > 3)) {
4e6bedd3c396014 Matt Flax 2022-08-10  247  			dev_err(component->dev,
4e6bedd3c396014 Matt Flax 2022-08-10  248  				"div register setting %d is =
out of range\n",
4e6bedd3c396014 Matt Flax 2022-08-10  249  				val);
4e6bedd3c396014 Matt Flax 2022-08-10  250  			dev_err(component->dev,
4e6bedd3c396014 Matt Flax 2022-08-10  251  				"unsupported sample rate %d =
Hz for the master clock of %d Hz\n",
4e6bedd3c396014 Matt Flax 2022-08-10  252  				params_rate(params), src4xxx=
->mclk_hz);
4e6bedd3c396014 Matt Flax 2022-08-10  253  			return -EINVAL;
4e6bedd3c396014 Matt Flax 2022-08-10  254  		}
4e6bedd3c396014 Matt Flax 2022-08-10  255  =

4e6bedd3c396014 Matt Flax 2022-08-10  256  		/* set the TX DIV */
4e6bedd3c396014 Matt Flax 2022-08-10  257  		ret =3D regmap_update_bits(src=
4xxx->regmap,
4e6bedd3c396014 Matt Flax 2022-08-10  258  			SRC4XXX_TX_CTL_07, SRC4XXX_TX=
_MCLK_DIV_MASK,
4e6bedd3c396014 Matt Flax 2022-08-10  259  			val<<SRC4XXX_TX_MCLK_DIV_SHIF=
T);
4e6bedd3c396014 Matt Flax 2022-08-10  260  		if (ret) {
4e6bedd3c396014 Matt Flax 2022-08-10  261  			dev_err(component->dev,
4e6bedd3c396014 Matt Flax 2022-08-10  262  				"Couldn't set the TX's div r=
egister to %d << %d =3D 0x%x\n",
4e6bedd3c396014 Matt Flax 2022-08-10  263  				val, SRC4XXX_TX_MCLK_DIV_SHI=
FT,
4e6bedd3c396014 Matt Flax 2022-08-10  264  				val<<SRC4XXX_TX_MCLK_DIV_SHI=
FT);
4e6bedd3c396014 Matt Flax 2022-08-10  265  			return ret;
4e6bedd3c396014 Matt Flax 2022-08-10  266  		}
4e6bedd3c396014 Matt Flax 2022-08-10  267  =

4e6bedd3c396014 Matt Flax 2022-08-10  268  		/* set the PLL for the digital=
 receiver */
4e6bedd3c396014 Matt Flax 2022-08-10  269  		switch (src4xxx->mclk_hz) {
4e6bedd3c396014 Matt Flax 2022-08-10  270  		case 24576000:
4e6bedd3c396014 Matt Flax 2022-08-10  271  			pj =3D 0x22;
4e6bedd3c396014 Matt Flax 2022-08-10  272  			jd =3D 0x00;
4e6bedd3c396014 Matt Flax 2022-08-10  273  			d =3D 0x00;
4e6bedd3c396014 Matt Flax 2022-08-10  274  			break;
4e6bedd3c396014 Matt Flax 2022-08-10  275  		case 22579200:
4e6bedd3c396014 Matt Flax 2022-08-10  276  			pj =3D 0x22;
4e6bedd3c396014 Matt Flax 2022-08-10  277  			jd =3D 0x1b;
4e6bedd3c396014 Matt Flax 2022-08-10  278  			d =3D 0xa3;
4e6bedd3c396014 Matt Flax 2022-08-10  279  			break;
4e6bedd3c396014 Matt Flax 2022-08-10  280  		default:
4e6bedd3c396014 Matt Flax 2022-08-10  281  			/* don't error out here,
4e6bedd3c396014 Matt Flax 2022-08-10  282  			 * other parts of the chip ar=
e still functional
4e6bedd3c396014 Matt Flax 2022-08-10  283  			 */
4e6bedd3c396014 Matt Flax 2022-08-10  284  			dev_info(component->dev,
4e6bedd3c396014 Matt Flax 2022-08-10  285  				"Couldn't set the RCV PLL as=
 this master clock rate is unknown\n");
4e6bedd3c396014 Matt Flax 2022-08-10  286  			break;
4e6bedd3c396014 Matt Flax 2022-08-10  287  		}
4e6bedd3c396014 Matt Flax 2022-08-10 @288  		ret =3D regmap_write(src4xxx->=
regmap, SRC4XXX_RCV_PLL_0F, pj);
4e6bedd3c396014 Matt Flax 2022-08-10  289  		if (ret < 0)
4e6bedd3c396014 Matt Flax 2022-08-10  290  			dev_err(component->dev,
4e6bedd3c396014 Matt Flax 2022-08-10  291  				"Failed to update PLL regist=
er 0x%x\n",
4e6bedd3c396014 Matt Flax 2022-08-10  292  				SRC4XXX_RCV_PLL_0F);
4e6bedd3c396014 Matt Flax 2022-08-10 @293  		ret =3D regmap_write(src4xxx->=
regmap, SRC4XXX_RCV_PLL_10, jd);
4e6bedd3c396014 Matt Flax 2022-08-10  294  		if (ret < 0)
4e6bedd3c396014 Matt Flax 2022-08-10  295  			dev_err(component->dev,
4e6bedd3c396014 Matt Flax 2022-08-10  296  				"Failed to update PLL regist=
er 0x%x\n",
4e6bedd3c396014 Matt Flax 2022-08-10  297  				SRC4XXX_RCV_PLL_10);
4e6bedd3c396014 Matt Flax 2022-08-10 @298  		ret =3D regmap_write(src4xxx->=
regmap, SRC4XXX_RCV_PLL_11, d);
4e6bedd3c396014 Matt Flax 2022-08-10  299  		if (ret < 0)
4e6bedd3c396014 Matt Flax 2022-08-10  300  			dev_err(component->dev,
4e6bedd3c396014 Matt Flax 2022-08-10  301  				"Failed to update PLL regist=
er 0x%x\n",
4e6bedd3c396014 Matt Flax 2022-08-10  302  				SRC4XXX_RCV_PLL_11);
4e6bedd3c396014 Matt Flax 2022-08-10  303  =

4e6bedd3c396014 Matt Flax 2022-08-10  304  		ret =3D regmap_update_bits(src=
4xxx->regmap,
4e6bedd3c396014 Matt Flax 2022-08-10  305  			SRC4XXX_TX_CTL_07, SRC4XXX_TX=
_MCLK_DIV_MASK,
4e6bedd3c396014 Matt Flax 2022-08-10  306  			val<<SRC4XXX_TX_MCLK_DIV_SHIF=
T);
4e6bedd3c396014 Matt Flax 2022-08-10  307  		if (ret < 0) {
4e6bedd3c396014 Matt Flax 2022-08-10  308  			dev_err(component->dev,
4e6bedd3c396014 Matt Flax 2022-08-10  309  				"Couldn't set the TX's div r=
egister to %d << %d =3D 0x%x\n",
4e6bedd3c396014 Matt Flax 2022-08-10  310  				val, SRC4XXX_TX_MCLK_DIV_SHI=
FT,
4e6bedd3c396014 Matt Flax 2022-08-10  311  				val<<SRC4XXX_TX_MCLK_DIV_SHI=
FT);
4e6bedd3c396014 Matt Flax 2022-08-10  312  			return ret;
4e6bedd3c396014 Matt Flax 2022-08-10  313  		}
4e6bedd3c396014 Matt Flax 2022-08-10  314  =

4e6bedd3c396014 Matt Flax 2022-08-10  315  		return regmap_update_bits(src4=
xxx->regmap, reg,
4e6bedd3c396014 Matt Flax 2022-08-10  316  					SRC4XXX_MCLK_DIV_MASK, val);
4e6bedd3c396014 Matt Flax 2022-08-10  317  	} else {
4e6bedd3c396014 Matt Flax 2022-08-10  318  		dev_info(dai->dev, "not settin=
g up MCLK as not master\n");
4e6bedd3c396014 Matt Flax 2022-08-10  319  	}
4e6bedd3c396014 Matt Flax 2022-08-10  320  =

4e6bedd3c396014 Matt Flax 2022-08-10  321  	return 0;
4e6bedd3c396014 Matt Flax 2022-08-10  322  };
4e6bedd3c396014 Matt Flax 2022-08-10  323  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0300039804039530140==--

