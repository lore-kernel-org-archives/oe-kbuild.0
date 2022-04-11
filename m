Content-Type: multipart/mixed; boundary="===============1268275259937202203=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/dac/ltc2688.c:859:70: warning: Parameter 'vref' can be declared with const [constParameter]
Date: Tue, 12 Apr 2022 03:35:47 +0800
Message-ID: <202204120345.RS7078ls-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1268275259937202203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Nuno S=C3=A1" <nuno.sa@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: 832cb9eeb9312dd2e14133681d3920b773ef1eac iio: dac: add support for =
ltc2688
date:   6 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 weeks ago
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 832cb9eeb9312dd2e14133681d3920b773ef1eac
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iio/dac/ltc2688.c:859:70: warning: Parameter 'vref' can be decla=
red with const [constParameter]
   static int ltc2688_setup(struct ltc2688_state *st, struct regulator *vre=
f)
                                                                        ^

vim +/vref +859 drivers/iio/dac/ltc2688.c

832cb9eeb9312d Nuno S=C3=A1 2022-02-25  858  =

832cb9eeb9312d Nuno S=C3=A1 2022-02-25 @859  static int ltc2688_setup(struc=
t ltc2688_state *st, struct regulator *vref)
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  860  {
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  861  	struct gpio_desc *gpio;
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  862  	int ret;
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  863  =

832cb9eeb9312d Nuno S=C3=A1 2022-02-25  864  	/*
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  865  	 * If we have a reset pin, us=
e that to reset the board, If not, use
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  866  	 * the reset bit.
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  867  	 */
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  868  	gpio =3D devm_gpiod_get_optio=
nal(&st->spi->dev, "clr", GPIOD_OUT_HIGH);
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  869  	if (IS_ERR(gpio))
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  870  		return dev_err_probe(&st->sp=
i->dev, PTR_ERR(gpio),
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  871  				     "Failed to get reset =
gpio");
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  872  	if (gpio) {
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  873  		usleep_range(1000, 1200);
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  874  		/* bring device out of reset=
 */
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  875  		gpiod_set_value_cansleep(gpi=
o, 0);
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  876  	} else {
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  877  		ret =3D regmap_update_bits(s=
t->regmap, LTC2688_CMD_CONFIG,
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  878  					 LTC2688_CONFIG_RST,
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  879  					 LTC2688_CONFIG_RST);
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  880  		if (ret)
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  881  			return ret;
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  882  	}
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  883  =

832cb9eeb9312d Nuno S=C3=A1 2022-02-25  884  	usleep_range(10000, 12000);
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  885  =

832cb9eeb9312d Nuno S=C3=A1 2022-02-25  886  	/*
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  887  	 * Duplicate the default chan=
nel configuration as it can change during
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  888  	 * @ltc2688_channel_config()
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  889  	 */
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  890  	st->iio_chan =3D devm_kmemdup=
(&st->spi->dev, ltc2688_channels,
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  891  				    sizeof(ltc2688_channel=
s), GFP_KERNEL);
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  892  	if (!st->iio_chan)
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  893  		return -ENOMEM;
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  894  =

832cb9eeb9312d Nuno S=C3=A1 2022-02-25  895  	ret =3D ltc2688_channel_confi=
g(st);
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  896  	if (ret)
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  897  		return ret;
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  898  =

832cb9eeb9312d Nuno S=C3=A1 2022-02-25  899  	if (!vref)
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  900  		return 0;
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  901  =

832cb9eeb9312d Nuno S=C3=A1 2022-02-25  902  	return regmap_set_bits(st->re=
gmap, LTC2688_CMD_CONFIG,
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  903  			       LTC2688_CONFIG_EXT_R=
EF);
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  904  }
832cb9eeb9312d Nuno S=C3=A1 2022-02-25  905  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1268275259937202203==--

