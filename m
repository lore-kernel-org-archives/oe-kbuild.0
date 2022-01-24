Content-Type: multipart/mixed; boundary="===============3629117677923990523=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/dac/ad3552r.c:688 ad3552r_reset() warn: impossible condition '(val < 0) => (0-u16max < 0)'
Date: Mon, 24 Jan 2022 21:08:11 +0800
Message-ID: <202201242005.NNLuFLzZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3629117677923990523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mihail Chindris <mihail.chindris@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 8f2b54824b28ba8317c60947b5941d686e3df70d drivers:iio:dac: Add AD355=
2R driver support
date:   6 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 weeks ago
config: nios2-randconfig-m031-20220124 (https://download.01.org/0day-ci/arc=
hive/20220124/202201242005.NNLuFLzZ-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/iio/dac/ad3552r.c:688 ad3552r_reset() warn: impossible condition '(=
val < 0) =3D> (0-u16max < 0)'

Old smatch warnings:
drivers/iio/dac/ad3552r.c:699 ad3552r_reset() warn: impossible condition '(=
val < 0) =3D> (0-u16max < 0)'

vim +688 drivers/iio/dac/ad3552r.c

8f2b54824b28ba Mihail Chindris 2021-12-13  654  =

8f2b54824b28ba Mihail Chindris 2021-12-13  655  static int ad3552r_reset(st=
ruct ad3552r_desc *dac)
8f2b54824b28ba Mihail Chindris 2021-12-13  656  {
8f2b54824b28ba Mihail Chindris 2021-12-13  657  	struct reg_addr_pool addr;
8f2b54824b28ba Mihail Chindris 2021-12-13  658  	int ret;
8f2b54824b28ba Mihail Chindris 2021-12-13  659  	u16 val;
8f2b54824b28ba Mihail Chindris 2021-12-13  660  =

8f2b54824b28ba Mihail Chindris 2021-12-13  661  	dac->gpio_reset =3D devm_g=
piod_get_optional(&dac->spi->dev, "reset",
8f2b54824b28ba Mihail Chindris 2021-12-13  662  						  GPIOD_OUT_LOW);
8f2b54824b28ba Mihail Chindris 2021-12-13  663  	if (IS_ERR(dac->gpio_reset=
))
8f2b54824b28ba Mihail Chindris 2021-12-13  664  		return dev_err_probe(&dac=
->spi->dev, PTR_ERR(dac->gpio_reset),
8f2b54824b28ba Mihail Chindris 2021-12-13  665  				     "Error while getti=
ng gpio reset");
8f2b54824b28ba Mihail Chindris 2021-12-13  666  =

8f2b54824b28ba Mihail Chindris 2021-12-13  667  	if (dac->gpio_reset) {
8f2b54824b28ba Mihail Chindris 2021-12-13  668  		/* Perform hardware reset=
 */
8f2b54824b28ba Mihail Chindris 2021-12-13  669  		usleep_range(10, 20);
8f2b54824b28ba Mihail Chindris 2021-12-13  670  		gpiod_set_value_cansleep(=
dac->gpio_reset, 1);
8f2b54824b28ba Mihail Chindris 2021-12-13  671  	} else {
8f2b54824b28ba Mihail Chindris 2021-12-13  672  		/* Perform software reset=
 if no GPIO provided */
8f2b54824b28ba Mihail Chindris 2021-12-13  673  		ret =3D ad3552r_update_re=
g_field(dac,
8f2b54824b28ba Mihail Chindris 2021-12-13  674  					       AD3552R_REG_ADD=
R_INTERFACE_CONFIG_A,
8f2b54824b28ba Mihail Chindris 2021-12-13  675  					       AD3552R_MASK_SO=
FTWARE_RESET,
8f2b54824b28ba Mihail Chindris 2021-12-13  676  					       AD3552R_MASK_SO=
FTWARE_RESET);
8f2b54824b28ba Mihail Chindris 2021-12-13  677  		if (ret < 0)
8f2b54824b28ba Mihail Chindris 2021-12-13  678  			return ret;
8f2b54824b28ba Mihail Chindris 2021-12-13  679  =

8f2b54824b28ba Mihail Chindris 2021-12-13  680  	}
8f2b54824b28ba Mihail Chindris 2021-12-13  681  =

8f2b54824b28ba Mihail Chindris 2021-12-13  682  	addr.dac =3D dac;
8f2b54824b28ba Mihail Chindris 2021-12-13  683  	addr.addr =3D AD3552R_REG_=
ADDR_INTERFACE_CONFIG_B;
8f2b54824b28ba Mihail Chindris 2021-12-13  684  	ret =3D readx_poll_timeout=
(ad3552r_read_reg_wrapper, &addr, val,
8f2b54824b28ba Mihail Chindris 2021-12-13  685  				 val =3D=3D AD3552R_DEF=
AULT_CONFIG_B_VALUE ||
8f2b54824b28ba Mihail Chindris 2021-12-13  686  				 val < 0,
8f2b54824b28ba Mihail Chindris 2021-12-13  687  				 5000, 50000);
8f2b54824b28ba Mihail Chindris 2021-12-13 @688  	if (val < 0)
8f2b54824b28ba Mihail Chindris 2021-12-13  689  		ret =3D val;
8f2b54824b28ba Mihail Chindris 2021-12-13  690  	if (ret) {
8f2b54824b28ba Mihail Chindris 2021-12-13  691  		dev_err(&dac->spi->dev, "=
Error while resetting");
8f2b54824b28ba Mihail Chindris 2021-12-13  692  		return ret;
8f2b54824b28ba Mihail Chindris 2021-12-13  693  	}
8f2b54824b28ba Mihail Chindris 2021-12-13  694  =

8f2b54824b28ba Mihail Chindris 2021-12-13  695  	ret =3D readx_poll_timeout=
(ad3552r_read_reg_wrapper, &addr, val,
8f2b54824b28ba Mihail Chindris 2021-12-13  696  				 !(val & AD3552R_MASK_I=
NTERFACE_NOT_READY) ||
8f2b54824b28ba Mihail Chindris 2021-12-13  697  				 val < 0,
8f2b54824b28ba Mihail Chindris 2021-12-13  698  				 5000, 50000);
8f2b54824b28ba Mihail Chindris 2021-12-13  699  	if (val < 0)
8f2b54824b28ba Mihail Chindris 2021-12-13  700  		ret =3D val;
8f2b54824b28ba Mihail Chindris 2021-12-13  701  	if (ret) {
8f2b54824b28ba Mihail Chindris 2021-12-13  702  		dev_err(&dac->spi->dev, "=
Error while resetting");
8f2b54824b28ba Mihail Chindris 2021-12-13  703  		return ret;
8f2b54824b28ba Mihail Chindris 2021-12-13  704  	}
8f2b54824b28ba Mihail Chindris 2021-12-13  705  =

8f2b54824b28ba Mihail Chindris 2021-12-13  706  	return ad3552r_update_reg_=
field(dac,
8f2b54824b28ba Mihail Chindris 2021-12-13  707  					addr_mask_map[AD3552R_=
ADDR_ASCENSION][0],
8f2b54824b28ba Mihail Chindris 2021-12-13  708  					addr_mask_map[AD3552R_=
ADDR_ASCENSION][1],
8f2b54824b28ba Mihail Chindris 2021-12-13  709  					val);
8f2b54824b28ba Mihail Chindris 2021-12-13  710  }
8f2b54824b28ba Mihail Chindris 2021-12-13  711  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3629117677923990523==--

