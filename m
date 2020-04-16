Content-Type: multipart/mixed; boundary="===============7389825475108444133=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] iio: adc: ti-ads8344: properly byte swap value
Date: Fri, 17 Apr 2020 04:16:01 +0800
Message-ID: <202004170455.2KUX57mk%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7389825475108444133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200415212257.161238-2-alexandre.belloni@bootlin.com>
References: <20200415212257.161238-2-alexandre.belloni@bootlin.com>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Jonathan Cameron <jic23@kernel.org>
CC: Hartmut Knaack <knaack.h@gmx.de>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: "Peter Meerwald-Stadler" <pmeerw@pmeerw.net>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>
CC: linux-iio(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

Hi Alexandre,

I love your patch! Perhaps something to improve:

[auto build test WARNING on iio/togreg]
[also build test WARNING on v5.7-rc1 next-20200416]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Alexandre-Belloni/iio-adc-=
ti-ads8344-improve-the-driver/20200416-073357
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/iio/adc/ti-ads8344.c:96:43: sparse: sparse: No right hand side o=
f '|'-expression
   drivers/iio/adc/ti-ads8344.c:96:43: sparse: sparse: Expected ; at end of=
 statement
   drivers/iio/adc/ti-ads8344.c:96:43: sparse: sparse: got =EF=BF=BD

# https://github.com/0day-ci/linux/commit/f4710fdd10c9cf84bd09d8b295a435b37=
1800bd0
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout f4710fdd10c9cf84bd09d8b295a435b371800bd0
vim +96 drivers/iio/adc/ti-ads8344.c

8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  72  =

8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  73  static int ads8344_adc_con=
version(struct ads8344 *adc, int channel,
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  74  				  bool differential)
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  75  {
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  76  	struct spi_device *spi =
=3D adc->spi;
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  77  	int ret;
f4710fdd10c9cf Alexandre Belloni 2020-04-15  78  	u8 buf[3];
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  79  =

8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  80  	adc->tx_buf =3D ADS8344_S=
TART;
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  81  	if (!differential)
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  82  		adc->tx_buf |=3D ADS8344=
_SINGLE_END;
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  83  	adc->tx_buf |=3D ADS8344_=
CHANNEL(channel);
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  84  	adc->tx_buf |=3D ADS8344_=
CLOCK_INTERNAL;
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  85  =

8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  86  	ret =3D spi_write(spi, &a=
dc->tx_buf, 1);
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  87  	if (ret)
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  88  		return ret;
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  89  =

8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  90  	udelay(9);
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  91  =

f4710fdd10c9cf Alexandre Belloni 2020-04-15  92  	ret =3D spi_read(spi, buf=
, sizeof(buf));
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  93  	if (ret)
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  94  		return ret;
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  95  =

f4710fdd10c9cf Alexandre Belloni 2020-04-15 @96  	return buf[0] << 9 | buf[=
1] << 1 |=C2=A0buf[2] >> 7;
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  97  }
8dd2d7c0fed778 Gregory CLEMENT   2019-04-12  98  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7389825475108444133==--

