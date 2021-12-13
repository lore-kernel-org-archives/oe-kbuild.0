Content-Type: multipart/mixed; boundary="===============3132058626804293170=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/chemical/sunrise_co2.c:410 sunrise_read_raw() error: uninitialized symbol 'value'.
Date: Mon, 13 Dec 2021 21:43:39 +0800
Message-ID: <202112132135.I1VHSvJD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3132058626804293170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jacopo Mondi <jacopo@jmondi.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2585cf9dfaaddf00b069673f27bb3f8530e2039c
commit: c397894e24f1c7281376c14dfdd4df8fe0e84754 iio: chemical: Add Senseai=
r Sunrise 006-0-007 driver
date:   8 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-m021-20211207 (https://download.01.org/0day-ci/arch=
ive/20211213/202112132135.I1VHSvJD-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/iio/chemical/sunrise_co2.c:410 sunrise_read_raw() error: uninitiali=
zed symbol 'value'.

Old smatch warnings:
drivers/iio/chemical/sunrise_co2.c:422 sunrise_read_raw() error: uninitiali=
zed symbol 'value'.

vim +/value +410 drivers/iio/chemical/sunrise_co2.c

c397894e24f1c7 Jacopo Mondi 2021-09-20  394  =

c397894e24f1c7 Jacopo Mondi 2021-09-20  395  static int sunrise_read_raw(st=
ruct iio_dev *iio_dev,
c397894e24f1c7 Jacopo Mondi 2021-09-20  396  			    const struct iio_chan_s=
pec *chan,
c397894e24f1c7 Jacopo Mondi 2021-09-20  397  			    int *val, int *val2, lo=
ng mask)
c397894e24f1c7 Jacopo Mondi 2021-09-20  398  {
c397894e24f1c7 Jacopo Mondi 2021-09-20  399  	struct sunrise_dev *sunrise =
=3D iio_priv(iio_dev);
c397894e24f1c7 Jacopo Mondi 2021-09-20  400  	u16 value;
c397894e24f1c7 Jacopo Mondi 2021-09-20  401  	int ret;
c397894e24f1c7 Jacopo Mondi 2021-09-20  402  =

c397894e24f1c7 Jacopo Mondi 2021-09-20  403  	switch (mask) {
c397894e24f1c7 Jacopo Mondi 2021-09-20  404  	case IIO_CHAN_INFO_RAW:
c397894e24f1c7 Jacopo Mondi 2021-09-20  405  		switch (chan->type) {
c397894e24f1c7 Jacopo Mondi 2021-09-20  406  		case IIO_CONCENTRATION:
c397894e24f1c7 Jacopo Mondi 2021-09-20  407  			mutex_lock(&sunrise->lock);
c397894e24f1c7 Jacopo Mondi 2021-09-20  408  			ret =3D sunrise_read_word(s=
unrise, SUNRISE_CO2_FILTERED_COMP_REG,
c397894e24f1c7 Jacopo Mondi 2021-09-20  409  						&value);
c397894e24f1c7 Jacopo Mondi 2021-09-20 @410  			*val =3D value;
c397894e24f1c7 Jacopo Mondi 2021-09-20  411  			mutex_unlock(&sunrise->lock=
);
c397894e24f1c7 Jacopo Mondi 2021-09-20  412  =

c397894e24f1c7 Jacopo Mondi 2021-09-20  413  			if (ret)
c397894e24f1c7 Jacopo Mondi 2021-09-20  414  				return ret;
c397894e24f1c7 Jacopo Mondi 2021-09-20  415  =

c397894e24f1c7 Jacopo Mondi 2021-09-20  416  			return IIO_VAL_INT;
c397894e24f1c7 Jacopo Mondi 2021-09-20  417  =

c397894e24f1c7 Jacopo Mondi 2021-09-20  418  		case IIO_TEMP:
c397894e24f1c7 Jacopo Mondi 2021-09-20  419  			mutex_lock(&sunrise->lock);
c397894e24f1c7 Jacopo Mondi 2021-09-20  420  			ret =3D sunrise_read_word(s=
unrise, SUNRISE_CHIP_TEMPERATURE_REG,
c397894e24f1c7 Jacopo Mondi 2021-09-20  421  						&value);
c397894e24f1c7 Jacopo Mondi 2021-09-20  422  			*val =3D value;
c397894e24f1c7 Jacopo Mondi 2021-09-20  423  			mutex_unlock(&sunrise->lock=
);
c397894e24f1c7 Jacopo Mondi 2021-09-20  424  =

c397894e24f1c7 Jacopo Mondi 2021-09-20  425  			if (ret)
c397894e24f1c7 Jacopo Mondi 2021-09-20  426  				return ret;
c397894e24f1c7 Jacopo Mondi 2021-09-20  427  =

c397894e24f1c7 Jacopo Mondi 2021-09-20  428  			return IIO_VAL_INT;
c397894e24f1c7 Jacopo Mondi 2021-09-20  429  =

c397894e24f1c7 Jacopo Mondi 2021-09-20  430  		default:
c397894e24f1c7 Jacopo Mondi 2021-09-20  431  			return -EINVAL;
c397894e24f1c7 Jacopo Mondi 2021-09-20  432  		}
c397894e24f1c7 Jacopo Mondi 2021-09-20  433  =

c397894e24f1c7 Jacopo Mondi 2021-09-20  434  	case IIO_CHAN_INFO_SCALE:
c397894e24f1c7 Jacopo Mondi 2021-09-20  435  		switch (chan->type) {
c397894e24f1c7 Jacopo Mondi 2021-09-20  436  		case IIO_CONCENTRATION:
c397894e24f1c7 Jacopo Mondi 2021-09-20  437  			/*
c397894e24f1c7 Jacopo Mondi 2021-09-20  438  			 * 1 / 10^4 to comply with =
IIO scale for CO2
c397894e24f1c7 Jacopo Mondi 2021-09-20  439  			 * (percentage). The chip C=
O2 reading range is [400 -
c397894e24f1c7 Jacopo Mondi 2021-09-20  440  			 * 5000] ppm which correspo=
nds to [0,004 - 0,5] %.
c397894e24f1c7 Jacopo Mondi 2021-09-20  441  			 */
c397894e24f1c7 Jacopo Mondi 2021-09-20  442  			*val =3D 1;
c397894e24f1c7 Jacopo Mondi 2021-09-20  443  			*val2 =3D 10000;
c397894e24f1c7 Jacopo Mondi 2021-09-20  444  			return IIO_VAL_FRACTIONAL;
c397894e24f1c7 Jacopo Mondi 2021-09-20  445  =

c397894e24f1c7 Jacopo Mondi 2021-09-20  446  		case IIO_TEMP:
c397894e24f1c7 Jacopo Mondi 2021-09-20  447  			/* x10 to comply with IIO s=
cale (millidegrees celsius). */
c397894e24f1c7 Jacopo Mondi 2021-09-20  448  			*val =3D 10;
c397894e24f1c7 Jacopo Mondi 2021-09-20  449  			return IIO_VAL_INT;
c397894e24f1c7 Jacopo Mondi 2021-09-20  450  =

c397894e24f1c7 Jacopo Mondi 2021-09-20  451  		default:
c397894e24f1c7 Jacopo Mondi 2021-09-20  452  			return -EINVAL;
c397894e24f1c7 Jacopo Mondi 2021-09-20  453  		}
c397894e24f1c7 Jacopo Mondi 2021-09-20  454  =

c397894e24f1c7 Jacopo Mondi 2021-09-20  455  	default:
c397894e24f1c7 Jacopo Mondi 2021-09-20  456  		return -EINVAL;
c397894e24f1c7 Jacopo Mondi 2021-09-20  457  	}
c397894e24f1c7 Jacopo Mondi 2021-09-20  458  }
c397894e24f1c7 Jacopo Mondi 2021-09-20  459  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3132058626804293170==--

