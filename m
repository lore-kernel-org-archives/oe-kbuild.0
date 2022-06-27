Content-Type: multipart/mixed; boundary="===============8116693806300006728=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/3] iio: pressure: bmp280: Add support for BMP380 sensor family
Date: Mon, 27 Jun 2022 03:04:31 +0000
Message-ID: <202206260803.ctZKSyI9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8116693806300006728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220625150921.47769-1-ang.iglesiasg@gmail.com>
References: <20220625150921.47769-1-ang.iglesiasg@gmail.com>
TO: Angel Iglesias <ang.iglesiasg@gmail.com>
CC: Angel Iglesias <ang.iglesiasg@gmail.com>
CC: Jonathan Cameron <jic23@kernel.org>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: Paul Cercueil <paul@crapouillou.net>
CC: linux-iio(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Angel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v5.19-rc3 next-20220=
624]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Angel-Iglesias/dt-bi=
ndings-iio-pressure-bmp085-Add-BMP380-compatible-string/20220625-231424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iio/pressure/bmp280-core.c:1000 bmp380_chip_config() warn: should t=
his be a bitwise op?

vim +1000 drivers/iio/pressure/bmp280-core.c

56e3f8aecddacd Angel Iglesias 2022-06-25   945  =

56e3f8aecddacd Angel Iglesias 2022-06-25   946  static int bmp380_chip_conf=
ig(struct bmp280_data *data)
56e3f8aecddacd Angel Iglesias 2022-06-25   947  {
56e3f8aecddacd Angel Iglesias 2022-06-25   948  	u8 osrs;
56e3f8aecddacd Angel Iglesias 2022-06-25   949  	unsigned int tmp;
56e3f8aecddacd Angel Iglesias 2022-06-25   950  	int ret;
56e3f8aecddacd Angel Iglesias 2022-06-25   951  =

56e3f8aecddacd Angel Iglesias 2022-06-25   952  	/* configure power control=
 register */
56e3f8aecddacd Angel Iglesias 2022-06-25   953  	ret =3D regmap_write_bits(=
data->regmap, BMP380_REG_POWER_CONTROL,
56e3f8aecddacd Angel Iglesias 2022-06-25   954  				BMP380_CTRL_SENSORS_MAS=
K |
56e3f8aecddacd Angel Iglesias 2022-06-25   955  				BMP380_MODE_MASK,
56e3f8aecddacd Angel Iglesias 2022-06-25   956  				BMP380_CTRL_SENSORS_PRE=
SS_EN |
56e3f8aecddacd Angel Iglesias 2022-06-25   957  				BMP380_CTRL_SENSORS_TEM=
P_EN |
56e3f8aecddacd Angel Iglesias 2022-06-25   958  				BMP380_MODE_NORMAL);
56e3f8aecddacd Angel Iglesias 2022-06-25   959  	if (ret < 0) {
56e3f8aecddacd Angel Iglesias 2022-06-25   960  		dev_err(data->dev,
56e3f8aecddacd Angel Iglesias 2022-06-25   961  			"failed to write operati=
on control register\n");
56e3f8aecddacd Angel Iglesias 2022-06-25   962  		return ret;
56e3f8aecddacd Angel Iglesias 2022-06-25   963  	}
56e3f8aecddacd Angel Iglesias 2022-06-25   964  =

56e3f8aecddacd Angel Iglesias 2022-06-25   965  	/* configure oversampling =
*/
56e3f8aecddacd Angel Iglesias 2022-06-25   966  	osrs =3D BMP380_OSRS_TEMP_=
X(data->oversampling_temp) |
56e3f8aecddacd Angel Iglesias 2022-06-25   967  				BMP380_OSRS_PRESS_X(dat=
a->oversampling_press);
56e3f8aecddacd Angel Iglesias 2022-06-25   968  =

56e3f8aecddacd Angel Iglesias 2022-06-25   969  	ret =3D regmap_write_bits(=
data->regmap, BMP380_REG_OSR,
56e3f8aecddacd Angel Iglesias 2022-06-25   970  				BMP380_OSRS_TEMP_MASK |=
 BMP380_OSRS_PRESS_MASK,
56e3f8aecddacd Angel Iglesias 2022-06-25   971  				osrs);
56e3f8aecddacd Angel Iglesias 2022-06-25   972  	if (ret < 0) {
56e3f8aecddacd Angel Iglesias 2022-06-25   973  		dev_err(data->dev, "faile=
d to write oversampling register\n");
56e3f8aecddacd Angel Iglesias 2022-06-25   974  		return ret;
56e3f8aecddacd Angel Iglesias 2022-06-25   975  	}
56e3f8aecddacd Angel Iglesias 2022-06-25   976  =

56e3f8aecddacd Angel Iglesias 2022-06-25   977  	/* configure output data r=
ate */
56e3f8aecddacd Angel Iglesias 2022-06-25   978  	ret =3D regmap_write_bits(=
data->regmap, BMP380_REG_ODR,
56e3f8aecddacd Angel Iglesias 2022-06-25   979  				BMP380_ODRS_MASK, BMP38=
0_ODRS_50HZ);
56e3f8aecddacd Angel Iglesias 2022-06-25   980  	if (ret < 0) {
56e3f8aecddacd Angel Iglesias 2022-06-25   981  		dev_err(data->dev, "faile=
d to write ODR selection register\n");
56e3f8aecddacd Angel Iglesias 2022-06-25   982  		return ret;
56e3f8aecddacd Angel Iglesias 2022-06-25   983  	}
56e3f8aecddacd Angel Iglesias 2022-06-25   984  =

56e3f8aecddacd Angel Iglesias 2022-06-25   985  	/* set filter data */
56e3f8aecddacd Angel Iglesias 2022-06-25   986  	ret =3D regmap_update_bits=
(data->regmap, BMP380_REG_CONFIG,
56e3f8aecddacd Angel Iglesias 2022-06-25   987  				BMP380_FILTER_MASK, BMP=
380_FILTER_3X);
56e3f8aecddacd Angel Iglesias 2022-06-25   988  	if (ret < 0) {
56e3f8aecddacd Angel Iglesias 2022-06-25   989  		dev_err(data->dev, "faile=
d to write config register\n");
56e3f8aecddacd Angel Iglesias 2022-06-25   990  		return ret;
56e3f8aecddacd Angel Iglesias 2022-06-25   991  	}
56e3f8aecddacd Angel Iglesias 2022-06-25   992  =

56e3f8aecddacd Angel Iglesias 2022-06-25   993  	/* check config error flag=
 */
56e3f8aecddacd Angel Iglesias 2022-06-25   994  	ret =3D regmap_read(data->=
regmap, BMP380_REG_ERROR, &tmp);
56e3f8aecddacd Angel Iglesias 2022-06-25   995  	if (ret < 0) {
56e3f8aecddacd Angel Iglesias 2022-06-25   996  		dev_err(data->dev,
56e3f8aecddacd Angel Iglesias 2022-06-25   997  			"failed to read error re=
gister\n");
56e3f8aecddacd Angel Iglesias 2022-06-25   998  		return ret;
56e3f8aecddacd Angel Iglesias 2022-06-25   999  	}
56e3f8aecddacd Angel Iglesias 2022-06-25 @1000  	if (tmp && BMP380_ERR_CONF=
_MASK) {
56e3f8aecddacd Angel Iglesias 2022-06-25  1001  		dev_warn(data->dev,
56e3f8aecddacd Angel Iglesias 2022-06-25  1002  			 "sensor flagged configu=
ration as incompatible\n");
56e3f8aecddacd Angel Iglesias 2022-06-25  1003  		ret =3D -EINVAL;
56e3f8aecddacd Angel Iglesias 2022-06-25  1004  	}
56e3f8aecddacd Angel Iglesias 2022-06-25  1005  =

56e3f8aecddacd Angel Iglesias 2022-06-25  1006  	return ret;
56e3f8aecddacd Angel Iglesias 2022-06-25  1007  }
56e3f8aecddacd Angel Iglesias 2022-06-25  1008  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8116693806300006728==--

