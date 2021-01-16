Content-Type: multipart/mixed; boundary="===============7951711752041959437=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [iio:testing 43/50] drivers/iio/dac/ad5766.c:373:10: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'.
Date: Sun, 17 Jan 2021 04:18:30 +0800
Message-ID: <202101170423.7vaxEQEU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7951711752041959437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Cristian Pop <cristian.pop@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testi=
ng
head:   68059e507c6111e435d1dfee0d3bb0564ef2c698
commit: 3225e120e4ef904145dae41505285b88df55dfec [43/50] iio: dac: ad5766: =
add driver support for AD5766
:::::: branch date: 2 hours ago
:::::: commit date: 3 hours ago
compiler: powerpc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +373 drivers/iio/dac/ad5766.c

3225e120e4ef9041 Cristian Pop 2021-01-15  355  =

3225e120e4ef9041 Cristian Pop 2021-01-15  356  static ssize_t ad5766_read_e=
xt(struct iio_dev *indio_dev,
3225e120e4ef9041 Cristian Pop 2021-01-15  357  			       uintptr_t private,
3225e120e4ef9041 Cristian Pop 2021-01-15  358  			       const struct iio_c=
han_spec *chan,
3225e120e4ef9041 Cristian Pop 2021-01-15  359  			       char *buf)
3225e120e4ef9041 Cristian Pop 2021-01-15  360  {
3225e120e4ef9041 Cristian Pop 2021-01-15  361  	struct ad5766_state *st =3D=
 iio_priv(indio_dev);
3225e120e4ef9041 Cristian Pop 2021-01-15  362  =

3225e120e4ef9041 Cristian Pop 2021-01-15  363  	switch (private) {
3225e120e4ef9041 Cristian Pop 2021-01-15  364  	case AD5766_DITHER_ENABLE:
3225e120e4ef9041 Cristian Pop 2021-01-15  365  		return sprintf(buf, "%u\n",
3225e120e4ef9041 Cristian Pop 2021-01-15  366  			       !(st->dither_enabl=
e & BIT(chan->channel)));
3225e120e4ef9041 Cristian Pop 2021-01-15  367  		break;
3225e120e4ef9041 Cristian Pop 2021-01-15  368  	case AD5766_DITHER_INVERT:
3225e120e4ef9041 Cristian Pop 2021-01-15  369  		return sprintf(buf, "%u\n",
3225e120e4ef9041 Cristian Pop 2021-01-15  370  			       !!(st->dither_inve=
rt & BIT(chan->channel)));
3225e120e4ef9041 Cristian Pop 2021-01-15  371  		break;
3225e120e4ef9041 Cristian Pop 2021-01-15  372  	case AD5766_DITHER_SOURCE:
3225e120e4ef9041 Cristian Pop 2021-01-15 @373  		return sprintf(buf, "%u\n",
3225e120e4ef9041 Cristian Pop 2021-01-15  374  			       ad5766_get_dither_=
source(indio_dev, chan));
3225e120e4ef9041 Cristian Pop 2021-01-15  375  	default:
3225e120e4ef9041 Cristian Pop 2021-01-15  376  		return -EINVAL;
3225e120e4ef9041 Cristian Pop 2021-01-15  377  	}
3225e120e4ef9041 Cristian Pop 2021-01-15  378  }
3225e120e4ef9041 Cristian Pop 2021-01-15  379  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7951711752041959437==--

