Content-Type: multipart/mixed; boundary="===============2436899426252788009=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/dac/ad7293.c:524 ad7293_read_raw() error: uninitialized symbol 'data'.
Date: Tue, 08 Feb 2022 15:06:21 +0800
Message-ID: <202202081433.mPxuLUuj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2436899426252788009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Cai Huoqing <cai.huoqing@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   555f3d7be91a873114c9656069f1a9fa476ec41a
commit: 0bb12606c05fe9737e3056fe76d6e4b9c2a87b57 iio:dac:ad7293: add suppor=
t for AD7293
date:   9 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-m001-20220207 (https://download.01.org/0day-ci/ar=
chive/20220208/202202081433.mPxuLUuj-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iio/dac/ad7293.c:524 ad7293_read_raw() error: uninitialized symbol =
'data'.

vim +/data +524 drivers/iio/dac/ad7293.c

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  475  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  476  static int ad7293_read_raw(=
struct iio_dev *indio_dev,
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  477  			   struct iio_chan_spec =
const *chan,
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  478  			   int *val, int *val2, =
long info)
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  479  {
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  480  	struct ad7293_state *st =
=3D iio_priv(indio_dev);
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  481  	int ret;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  482  	u16 data;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  483  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  484  	switch (info) {
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  485  	case IIO_CHAN_INFO_RAW:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  486  		switch (chan->type) {
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  487  		case IIO_VOLTAGE:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  488  			if (chan->output)
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  489  				ret =3D  ad7293_ch_read=
_raw(st, AD7293_DAC,
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  490  							  chan->channel, &da=
ta);
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  491  			else
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  492  				ret =3D  ad7293_ch_read=
_raw(st, AD7293_ADC_VINX,
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  493  							  chan->channel, &da=
ta);
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  494  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  495  			break;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  496  		case IIO_CURRENT:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  497  			ret =3D  ad7293_ch_read_=
raw(st, AD7293_ADC_ISENSE,
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  498  						  chan->channel, &dat=
a);
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  499  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  500  			break;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  501  		case IIO_TEMP:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  502  			ret =3D  ad7293_ch_read_=
raw(st, AD7293_ADC_TSENSE,
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  503  						  chan->channel, &dat=
a);
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  504  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  505  			break;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  506  		default:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  507  			return -EINVAL;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  508  		}
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  509  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  510  		if (ret)
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  511  			return ret;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  512  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  513  		*val =3D data;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  514  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  515  		return IIO_VAL_INT;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  516  	case IIO_CHAN_INFO_OFFSET:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  517  		switch (chan->type) {
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  518  		case IIO_VOLTAGE:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  519  			if (chan->output) {
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  520  				ret =3D ad7293_get_offs=
et(st,
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  521  							chan->channel + AD72=
93_VOUT_MIN_OFFSET_CH,
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  522  							&data);
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  523  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02 @524  				data =3D FIELD_GET(AD72=
93_REG_VOUT_OFFSET_MSK, data);
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  525  			} else {
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  526  				ret =3D ad7293_get_offs=
et(st, chan->channel, &data);
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  527  			}
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  528  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  529  			break;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  530  		case IIO_CURRENT:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  531  			ret =3D ad7293_get_offse=
t(st,
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  532  						chan->channel + AD729=
3_ISENSE_MIN_OFFSET_CH,
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  533  						&data);
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  534  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  535  			break;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  536  		case IIO_TEMP:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  537  			ret =3D ad7293_get_offse=
t(st,
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  538  						chan->channel + AD729=
3_TSENSE_MIN_OFFSET_CH,
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  539  						&data);
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  540  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  541  			break;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  542  		default:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  543  			return -EINVAL;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  544  		}
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  545  		if (ret)
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  546  			return ret;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  547  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  548  		*val =3D data;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  549  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  550  		return IIO_VAL_INT;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  551  	case IIO_CHAN_INFO_SCALE:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  552  		switch (chan->type) {
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  553  		case IIO_VOLTAGE:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  554  			ret =3D ad7293_adc_get_s=
cale(st, chan->channel, &data);
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  555  			if (ret)
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  556  				return ret;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  557  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  558  			*val =3D data;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  559  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  560  			return IIO_VAL_INT;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  561  		case IIO_CURRENT:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  562  			ret =3D ad7293_isense_ge=
t_scale(st, chan->channel, &data);
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  563  			if (ret)
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  564  				return ret;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  565  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  566  			*val =3D data;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  567  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  568  			return IIO_VAL_INT;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  569  		case IIO_TEMP:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  570  			*val =3D 1;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  571  			*val2 =3D 8;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  572  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  573  			return IIO_VAL_FRACTIONA=
L;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  574  		default:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  575  			return -EINVAL;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  576  		}
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  577  	default:
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  578  		return -EINVAL;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  579  	}
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  580  }
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  581  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2436899426252788009==--

