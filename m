Content-Type: multipart/mixed; boundary="===============6853609958665658444=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/7] iio: adc: sc27xx: add support for PMIC sc2720 and sc2721
Date: Sat, 08 Jan 2022 00:21:46 +0800
Message-ID: <202201080030.L51zYw0G-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6853609958665658444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220106125947.139523-5-gengcixi@gmail.com>
References: <20220106125947.139523-5-gengcixi@gmail.com>
TO: Cixi Geng <gengcixi@gmail.com>
TO: orsonzhai(a)gmail.com
TO: baolin.wang7(a)gmail.com
TO: zhang.lyra(a)gmail.com
TO: jic23(a)kernel.org
TO: lars(a)metafoo.de
TO: robh+dt(a)kernel.org
TO: lgirdwood(a)gmail.com
TO: broonie(a)kernel.org
CC: yuming.zhu1(a)unisoc.com
CC: linux-iio(a)vger.kernel.org

Hi Cixi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on v5.16-rc8 next-20220106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Cixi-Geng/iio-adc-sc27xx-a=
djust-structure-and-add-PMIC-s-support/20220106-210151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: openrisc-randconfig-m031-20220106 (https://download.01.org/0day-ci/=
archive/20220108/202201080030.L51zYw0G-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iio/adc/sc27xx_adc.c:461 sc27xx_adc_read() error: uninitialized sym=
bol 'value'.
drivers/iio/adc/sc27xx_adc.c:775 sc27xx_adc_probe() warn: passing zero to '=
PTR_ERR'

vim +/value +461 drivers/iio/adc/sc27xx_adc.c

b39db3bcbc9a96 Cixi Geng   2022-01-06  363  =

5df362a6cf49ca Freeman Liu 2018-06-21  364  static int sc27xx_adc_read(stru=
ct sc27xx_adc_data *data, int channel,
5df362a6cf49ca Freeman Liu 2018-06-21  365  			   int scale, int *val)
5df362a6cf49ca Freeman Liu 2018-06-21  366  {
5df362a6cf49ca Freeman Liu 2018-06-21  367  	int ret;
8de877d2bba5c3 Freeman Liu 2019-07-25  368  	u32 tmp, value, status;
5df362a6cf49ca Freeman Liu 2018-06-21  369  =

5df362a6cf49ca Freeman Liu 2018-06-21  370  	ret =3D hwspin_lock_timeout_ra=
w(data->hwlock, SC27XX_ADC_HWLOCK_TIMEOUT);
5df362a6cf49ca Freeman Liu 2018-06-21  371  	if (ret) {
5df362a6cf49ca Freeman Liu 2018-06-21  372  		dev_err(data->dev, "timeout t=
o get the hwspinlock\n");
5df362a6cf49ca Freeman Liu 2018-06-21  373  		return ret;
5df362a6cf49ca Freeman Liu 2018-06-21  374  	}
5df362a6cf49ca Freeman Liu 2018-06-21  375  =

cd6ab0edd81be2 Cixi Geng   2022-01-06  376  	/*
cd6ab0edd81be2 Cixi Geng   2022-01-06  377  	 * According to the sc2721 chi=
p data sheet, the reference voltage of
cd6ab0edd81be2 Cixi Geng   2022-01-06  378  	 * specific channel 30 and cha=
nnel 31 in ADC module needs to be set from
cd6ab0edd81be2 Cixi Geng   2022-01-06  379  	 * the default 2.8v to 3.5v.
cd6ab0edd81be2 Cixi Geng   2022-01-06  380  	 */
cd6ab0edd81be2 Cixi Geng   2022-01-06  381  	if (data->var_data->pmic_type =
=3D=3D SC2721_ADC) {
cd6ab0edd81be2 Cixi Geng   2022-01-06  382  		if ((channel =3D=3D 30) || (c=
hannel =3D=3D 31)) {
cd6ab0edd81be2 Cixi Geng   2022-01-06  383  			ret =3D regulator_set_voltag=
e(data->volref,
cd6ab0edd81be2 Cixi Geng   2022-01-06  384  						SC27XX_ADC_REFVOL_VDD35,
cd6ab0edd81be2 Cixi Geng   2022-01-06  385  						SC27XX_ADC_REFVOL_VDD35);
cd6ab0edd81be2 Cixi Geng   2022-01-06  386  			if (ret) {
cd6ab0edd81be2 Cixi Geng   2022-01-06  387  				dev_err(data->dev, "failed =
to set the volref 3.5V\n");
cd6ab0edd81be2 Cixi Geng   2022-01-06  388  				hwspin_unlock_raw(data->hwl=
ock);
cd6ab0edd81be2 Cixi Geng   2022-01-06  389  				return ret;
cd6ab0edd81be2 Cixi Geng   2022-01-06  390  			}
cd6ab0edd81be2 Cixi Geng   2022-01-06  391  		}
cd6ab0edd81be2 Cixi Geng   2022-01-06  392  	}
cd6ab0edd81be2 Cixi Geng   2022-01-06  393  =

5df362a6cf49ca Freeman Liu 2018-06-21  394  	ret =3D regmap_update_bits(dat=
a->regmap, data->base + SC27XX_ADC_CTL,
5df362a6cf49ca Freeman Liu 2018-06-21  395  				 SC27XX_ADC_EN, SC27XX_ADC_=
EN);
5df362a6cf49ca Freeman Liu 2018-06-21  396  	if (ret)
5df362a6cf49ca Freeman Liu 2018-06-21  397  		goto unlock_adc;
5df362a6cf49ca Freeman Liu 2018-06-21  398  =

8de877d2bba5c3 Freeman Liu 2019-07-25  399  	ret =3D regmap_update_bits(dat=
a->regmap, data->base + SC27XX_ADC_INT_CLR,
8de877d2bba5c3 Freeman Liu 2019-07-25  400  				 SC27XX_ADC_IRQ_CLR, SC27XX=
_ADC_IRQ_CLR);
8de877d2bba5c3 Freeman Liu 2019-07-25  401  	if (ret)
8de877d2bba5c3 Freeman Liu 2019-07-25  402  		goto disable_adc;
8de877d2bba5c3 Freeman Liu 2019-07-25  403  =

5df362a6cf49ca Freeman Liu 2018-06-21  404  	/* Configure the channel id an=
d scale */
b39db3bcbc9a96 Cixi Geng   2022-01-06  405  	tmp =3D (scale << data->var_da=
ta->scale_shift) & data->var_data->scale_mask;
5df362a6cf49ca Freeman Liu 2018-06-21  406  	tmp |=3D channel & SC27XX_ADC_=
CHN_ID_MASK;
5df362a6cf49ca Freeman Liu 2018-06-21  407  	ret =3D regmap_update_bits(dat=
a->regmap, data->base + SC27XX_ADC_CH_CFG,
b39db3bcbc9a96 Cixi Geng   2022-01-06  408  				 SC27XX_ADC_CHN_ID_MASK |
b39db3bcbc9a96 Cixi Geng   2022-01-06  409  				 data->var_data->scale_mask,
5df362a6cf49ca Freeman Liu 2018-06-21  410  				 tmp);
5df362a6cf49ca Freeman Liu 2018-06-21  411  	if (ret)
5df362a6cf49ca Freeman Liu 2018-06-21  412  		goto disable_adc;
5df362a6cf49ca Freeman Liu 2018-06-21  413  =

5df362a6cf49ca Freeman Liu 2018-06-21  414  	/* Select 12bit conversion mod=
e, and only sample 1 time */
5df362a6cf49ca Freeman Liu 2018-06-21  415  	tmp =3D SC27XX_ADC_12BIT_MODE;
5df362a6cf49ca Freeman Liu 2018-06-21  416  	tmp |=3D (0 << SC27XX_ADC_RUN_=
NUM_SHIFT) & SC27XX_ADC_RUN_NUM_MASK;
5df362a6cf49ca Freeman Liu 2018-06-21  417  	ret =3D regmap_update_bits(dat=
a->regmap, data->base + SC27XX_ADC_CTL,
5df362a6cf49ca Freeman Liu 2018-06-21  418  				 SC27XX_ADC_RUN_NUM_MASK | =
SC27XX_ADC_12BIT_MODE,
5df362a6cf49ca Freeman Liu 2018-06-21  419  				 tmp);
5df362a6cf49ca Freeman Liu 2018-06-21  420  	if (ret)
5df362a6cf49ca Freeman Liu 2018-06-21  421  		goto disable_adc;
5df362a6cf49ca Freeman Liu 2018-06-21  422  =

5df362a6cf49ca Freeman Liu 2018-06-21  423  	ret =3D regmap_update_bits(dat=
a->regmap, data->base + SC27XX_ADC_CTL,
5df362a6cf49ca Freeman Liu 2018-06-21  424  				 SC27XX_ADC_CHN_RUN, SC27XX=
_ADC_CHN_RUN);
5df362a6cf49ca Freeman Liu 2018-06-21  425  	if (ret)
5df362a6cf49ca Freeman Liu 2018-06-21  426  		goto disable_adc;
5df362a6cf49ca Freeman Liu 2018-06-21  427  =

8de877d2bba5c3 Freeman Liu 2019-07-25  428  	ret =3D regmap_read_poll_timeo=
ut(data->regmap,
8de877d2bba5c3 Freeman Liu 2019-07-25  429  				       data->base + SC27XX_=
ADC_INT_RAW,
8de877d2bba5c3 Freeman Liu 2019-07-25  430  				       status, (status & SC=
27XX_ADC_IRQ_RAW),
8de877d2bba5c3 Freeman Liu 2019-07-25  431  				       SC27XX_ADC_POLL_RAW_=
STATUS,
8de877d2bba5c3 Freeman Liu 2019-07-25  432  				       SC27XX_ADC_RDY_TIMEO=
UT);
8de877d2bba5c3 Freeman Liu 2019-07-25  433  	if (ret) {
8de877d2bba5c3 Freeman Liu 2019-07-25  434  		dev_err(data->dev, "read adc =
timeout, status =3D 0x%x\n", status);
8de877d2bba5c3 Freeman Liu 2019-07-25  435  		goto disable_adc;
750ac07eb2c856 Freeman Liu 2018-11-09  436  	}
5df362a6cf49ca Freeman Liu 2018-06-21  437  =

8de877d2bba5c3 Freeman Liu 2019-07-25  438  	ret =3D regmap_read(data->regm=
ap, data->base + SC27XX_ADC_DATA, &value);
8de877d2bba5c3 Freeman Liu 2019-07-25  439  	if (ret)
8de877d2bba5c3 Freeman Liu 2019-07-25  440  		goto disable_adc;
8de877d2bba5c3 Freeman Liu 2019-07-25  441  =

8de877d2bba5c3 Freeman Liu 2019-07-25  442  	value &=3D SC27XX_ADC_DATA_MAS=
K;
8de877d2bba5c3 Freeman Liu 2019-07-25  443  =

5df362a6cf49ca Freeman Liu 2018-06-21  444  disable_adc:
5df362a6cf49ca Freeman Liu 2018-06-21  445  	regmap_update_bits(data->regma=
p, data->base + SC27XX_ADC_CTL,
5df362a6cf49ca Freeman Liu 2018-06-21  446  			   SC27XX_ADC_EN, 0);
5df362a6cf49ca Freeman Liu 2018-06-21  447  unlock_adc:
cd6ab0edd81be2 Cixi Geng   2022-01-06  448  	if (data->var_data->pmic_type =
=3D=3D SC2721_ADC) {
cd6ab0edd81be2 Cixi Geng   2022-01-06  449  		if ((channel =3D=3D 30) || (c=
hannel =3D=3D 31)) {
cd6ab0edd81be2 Cixi Geng   2022-01-06  450  			ret =3D regulator_set_voltag=
e(data->volref,
cd6ab0edd81be2 Cixi Geng   2022-01-06  451  						    SC27XX_ADC_REFVOL_VDD=
28,
cd6ab0edd81be2 Cixi Geng   2022-01-06  452  						    SC27XX_ADC_REFVOL_VDD=
28);
cd6ab0edd81be2 Cixi Geng   2022-01-06  453  			if (ret)
cd6ab0edd81be2 Cixi Geng   2022-01-06  454  				dev_err(data->dev, "failed =
to set the volref 2.8V\n");
cd6ab0edd81be2 Cixi Geng   2022-01-06  455  		}
cd6ab0edd81be2 Cixi Geng   2022-01-06  456  	}
cd6ab0edd81be2 Cixi Geng   2022-01-06  457  =

5df362a6cf49ca Freeman Liu 2018-06-21  458  	hwspin_unlock_raw(data->hwlock=
);
5df362a6cf49ca Freeman Liu 2018-06-21  459  =

5df362a6cf49ca Freeman Liu 2018-06-21  460  	if (!ret)
8de877d2bba5c3 Freeman Liu 2019-07-25 @461  		*val =3D value;
5df362a6cf49ca Freeman Liu 2018-06-21  462  =

5df362a6cf49ca Freeman Liu 2018-06-21  463  	return ret;
5df362a6cf49ca Freeman Liu 2018-06-21  464  }
5df362a6cf49ca Freeman Liu 2018-06-21  465  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6853609958665658444==--

