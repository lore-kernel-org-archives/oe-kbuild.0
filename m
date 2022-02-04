Content-Type: multipart/mixed; boundary="===============8161351183640070725=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-misc:asoc-gpiolib-deps 5/6] sound/soc/codecs/tlv320adc3xxx.c:1209:28: error: implicit declaration of function 'devm_gpiod_get'; did you mean 'devm_gpio_free'?
Date: Fri, 04 Feb 2022 09:31:03 +0800
Message-ID: <202202040825.pFgi6s0L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8161351183640070725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git as=
oc-gpiolib-deps
head:   8d32dc434279b927663e6cf549712c8b4e42c9e3
commit: a775038d1ad6dc883e0b5e5c9d1b8a2a7c8b7ff0 [5/6] ASoC: zl38060: Remov=
e spurious gpiolib select
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arc-randconfig-c004-20220131 (https://download.01.org/0day-ci/archi=
ve/20220204/202202040825.pFgi6s0L-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git/=
commit/?id=3Da775038d1ad6dc883e0b5e5c9d1b8a2a7c8b7ff0
        git remote add broonie-misc https://git.kernel.org/pub/scm/linux/ke=
rnel/git/broonie/misc.git
        git fetch --no-tags broonie-misc asoc-gpiolib-deps
        git checkout a775038d1ad6dc883e0b5e5c9d1b8a2a7c8b7ff0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 O=3Dbuild_dir ARCH=3Darc SHELL=3D/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/soc/codecs/tlv320adc3xxx.c: In function 'adc3xxx_i2c_probe':
>> sound/soc/codecs/tlv320adc3xxx.c:1209:28: error: implicit declaration of=
 function 'devm_gpiod_get'; did you mean 'devm_gpio_free'? [-Werror=3Dimpli=
cit-function-declaration]
    1209 |         adc3xxx->rst_pin =3D devm_gpiod_get(dev, "reset", GPIOD_=
OUT_LOW);
         |                            ^~~~~~~~~~~~~~
         |                            devm_gpio_free
>> sound/soc/codecs/tlv320adc3xxx.c:1209:57: error: 'GPIOD_OUT_LOW' undecla=
red (first use in this function); did you mean 'GPIOF_INIT_LOW'?
    1209 |         adc3xxx->rst_pin =3D devm_gpiod_get(dev, "reset", GPIOD_=
OUT_LOW);
         |                                                         ^~~~~~~~=
~~~~~
         |                                                         GPIOF_IN=
IT_LOW
   sound/soc/codecs/tlv320adc3xxx.c:1209:57: note: each undeclared identifi=
er is reported only once for each function it appears in
>> sound/soc/codecs/tlv320adc3xxx.c:1257:9: error: implicit declaration of =
function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'=
? [-Werror=3Dimplicit-function-declaration]
    1257 |         gpiod_set_value_cansleep(adc3xxx->rst_pin, 1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         gpio_set_value_cansleep
   cc1: some warnings being treated as errors


vim +1209 sound/soc/codecs/tlv320adc3xxx.c

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1196  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1197  static int adc3xxx_i2c_pr=
obe(struct i2c_client *i2c,
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1198  			     const struct i2c_=
device_id *id)
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1199  {
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1200  	struct device *dev =3D &=
i2c->dev;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1201  	struct adc3xxx *adc3xxx =
=3D NULL;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1202  	int ret;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1203  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1204  	adc3xxx =3D devm_kzalloc=
(dev, sizeof(struct adc3xxx), GFP_KERNEL);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1205  	if (!adc3xxx)
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1206  		return -ENOMEM;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1207  	adc3xxx->dev =3D dev;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1208  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15 @1209  	adc3xxx->rst_pin =3D dev=
m_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1210  	if (IS_ERR(adc3xxx->rst_=
pin)) {
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1211  		return dev_err_probe(de=
v, PTR_ERR(adc3xxx->rst_pin),
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1212  				     "Failed to reque=
st rst_pin\n");
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1213  	}
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1214  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1215  	adc3xxx->mclk =3D devm_c=
lk_get(dev, NULL);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1216  	if (IS_ERR(adc3xxx->mclk=
)) {
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1217  		/*
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1218  		 * The chip itself supp=
orts running off the BCLK either
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1219  		 * directly or via the =
PLL, but the driver does not (yet), so
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1220  		 * having a specified m=
clk is required. Otherwise, we could
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1221  		 * use the lack of a cl=
ocks property to indicate when BCLK is
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1222  		 * intended as the cloc=
k source.
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1223  		 */
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1224  		return dev_err_probe(de=
v, PTR_ERR(adc3xxx->mclk),
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1225  				     "Failed to acqui=
re MCLK\n");
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1226  	} else if (adc3xxx->mclk=
) {
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1227  		ret =3D clk_prepare_ena=
ble(adc3xxx->mclk);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1228  		if (ret < 0)
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1229  			return ret;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1230  		dev_dbg(dev, "Enabled M=
CLK, freq %lu Hz\n", clk_get_rate(adc3xxx->mclk));
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1231  	}
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1232  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1233  	ret =3D adc3xxx_parse_dt=
_gpio(adc3xxx, "ti,dmdin-gpio1", &adc3xxx->gpio_cfg[0]);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1234  	if (ret < 0)
8a2d8e4fed6d58 Yang Yingliang   2021-12-23  1235  		goto err_unprepare_mclk;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1236  	ret =3D adc3xxx_parse_dt=
_gpio(adc3xxx, "ti,dmclk-gpio2", &adc3xxx->gpio_cfg[1]);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1237  	if (ret < 0)
8a2d8e4fed6d58 Yang Yingliang   2021-12-23  1238  		goto err_unprepare_mclk;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1239  	ret =3D adc3xxx_parse_dt=
_micbias(adc3xxx, "ti,micbias1-vg", &adc3xxx->micbias_vg[0]);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1240  	if (ret < 0)
8a2d8e4fed6d58 Yang Yingliang   2021-12-23  1241  		goto err_unprepare_mclk;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1242  	ret =3D adc3xxx_parse_dt=
_micbias(adc3xxx, "ti,micbias2-vg", &adc3xxx->micbias_vg[1]);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1243  	if (ret < 0)
8a2d8e4fed6d58 Yang Yingliang   2021-12-23  1244  		goto err_unprepare_mclk;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1245  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1246  	adc3xxx->regmap =3D devm=
_regmap_init_i2c(i2c, &adc3xxx_regmap);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1247  	if (IS_ERR(adc3xxx->regm=
ap)) {
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1248  		ret =3D PTR_ERR(adc3xxx=
->regmap);
8a2d8e4fed6d58 Yang Yingliang   2021-12-23  1249  		goto err_unprepare_mclk;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1250  	}
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1251  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1252  	i2c_set_clientdata(i2c, =
adc3xxx);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1253  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1254  	adc3xxx->type =3D id->dr=
iver_data;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1255  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1256  	/* Reset codec chip */
e9a3b57efd28fe Ricard Wanderlof 2021-12-15 @1257  	gpiod_set_value_cansleep=
(adc3xxx->rst_pin, 1);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1258  	usleep_range(2000, 10000=
0); /* Requirement: > 10 ns (datasheet p13) */
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1259  	gpiod_set_value_cansleep=
(adc3xxx->rst_pin, 0);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1260  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1261  	/* Potentially set up pi=
ns used as GPIOs */
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1262  	adc3xxx_init_gpio(adc3xx=
x);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1263  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1264  	ret =3D snd_soc_register=
_component(dev,
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1265  			&soc_component_dev_adc=
3xxx, &adc3xxx_dai, 1);
8a2d8e4fed6d58 Yang Yingliang   2021-12-23  1266  	if (ret < 0) {
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1267  		dev_err(dev, "Failed to=
 register codec: %d\n", ret);
8a2d8e4fed6d58 Yang Yingliang   2021-12-23  1268  		goto err_unprepare_mclk;
8a2d8e4fed6d58 Yang Yingliang   2021-12-23  1269  	}
8a2d8e4fed6d58 Yang Yingliang   2021-12-23  1270  =

8a2d8e4fed6d58 Yang Yingliang   2021-12-23  1271  	return 0;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1272  =

8a2d8e4fed6d58 Yang Yingliang   2021-12-23  1273  err_unprepare_mclk:
8a2d8e4fed6d58 Yang Yingliang   2021-12-23  1274  	clk_disable_unprepare(ad=
c3xxx->mclk);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1275  	return ret;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1276  }
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  1277  =


:::::: The code at line 1209 was first introduced by commit
:::::: e9a3b57efd28fe889a98171bdc1e9e0dd7eb9a50 ASoC: codec: tlv320adc3xxx:=
 New codec driver

:::::: TO: Ricard Wanderlof <ricardw@axis.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8161351183640070725==--

