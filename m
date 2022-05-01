Content-Type: multipart/mixed; boundary="===============4452224708049840102=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/iio/cdc/ad7746.c:244:24: warning: The statement 'if (chip->capdac_set!=chan->channel) chip->capdac_set=chan->channel' is logically equivalent to 'chip->capdac_set=chan->channel'. [duplicateConditionalAssign]
Date: Mon, 02 May 2022 06:29:41 +0800
Message-ID: <202205020654.2NsUk8eO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4452224708049840102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Lucas Stankus <lucas.p.stankus@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Alexandru Ardelean <ardeleanalex@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
commit: 6a7e4b04df3f4fb91a1516671a2610a0ac9f0c69 staging: iio: cdc: ad7746:=
 extract capac setup to own function
date:   11 months ago
:::::: branch date: 86 minutes ago
:::::: commit date: 11 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 6a7e4b04df3f4fb91a1516671a2610a0ac9f0c69
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/staging/iio/cdc/ad7746.c:244:24: warning: The statement 'if (chi=
p->capdac_set!=3Dchan->channel) chip->capdac_set=3Dchan->channel' is logica=
lly equivalent to 'chip->capdac_set=3Dchan->channel'. [duplicateConditional=
Assign]
     if (chip->capdac_set !=3D chan->channel) {
                          ^
   drivers/staging/iio/cdc/ad7746.c:246:21: note: Assignment 'chip->capdac_=
set=3Dchan->channel'
      chip->capdac_set =3D chan->channel;
                       ^
   drivers/staging/iio/cdc/ad7746.c:244:24: note: Condition 'chip->capdac_s=
et!=3Dchan->channel' is redundant
     if (chip->capdac_set !=3D chan->channel) {
                          ^

vim +244 drivers/staging/iio/cdc/ad7746.c

6a7e4b04df3f4f drivers/staging/iio/cdc/ad7746.c Lucas Stankus     2021-05-2=
3  224  =

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  225  static int ad7746_select_channel(struct iio_dev *indio_dev,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  226  				 struct iio_chan_spec const *chan)
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  227  {
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  228  	struct ad7746_chip_info *chip =3D iio_priv(indio_dev);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  229  	u8 vt_setup, cap_setup;
afcd0b22e35e0b drivers/staging/iio/cdc/ad7746.c Hern=C3=A1n Gonzalez   2018=
-04-13  230  	int ret, delay, idx;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  231  =

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  232  	switch (chan->type) {
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  233  	case IIO_CAPACITANCE:
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  234  		cap_setup =3D (chan->address & 0xFF) | AD7746_CAPSETUP_CAPEN;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  235  		vt_setup =3D chip->vt_setup & ~AD7746_VTSETUP_VTEN;
579d542534c96c drivers/staging/iio/cdc/ad7746.c Eva Rachel Retuya 2016-10-2=
8  236  		idx =3D (chip->config & AD7746_CONF_CAPFS_MASK) >>
579d542534c96c drivers/staging/iio/cdc/ad7746.c Eva Rachel Retuya 2016-10-2=
8  237  			AD7746_CONF_CAPFS_SHIFT;
579d542534c96c drivers/staging/iio/cdc/ad7746.c Eva Rachel Retuya 2016-10-2=
8  238  		delay =3D ad7746_cap_filter_rate_table[idx][1];
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  239  =

6a7e4b04df3f4f drivers/staging/iio/cdc/ad7746.c Lucas Stankus     2021-05-2=
3  240  		ret =3D ad7746_set_capdac(chip, chan->channel);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  241  		if (ret < 0)
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  242  			return ret;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  243  =

6a7e4b04df3f4f drivers/staging/iio/cdc/ad7746.c Lucas Stankus     2021-05-2=
3 @244  		if (chip->capdac_set !=3D chan->channel) {
6a7e4b04df3f4f drivers/staging/iio/cdc/ad7746.c Lucas Stankus     2021-05-2=
3  245  =

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  246  			chip->capdac_set =3D chan->channel;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  247  		}
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  248  		break;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  249  	case IIO_VOLTAGE:
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  250  	case IIO_TEMP:
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  251  		vt_setup =3D (chan->address & 0xFF) | AD7746_VTSETUP_VTEN;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  252  		cap_setup =3D chip->cap_setup & ~AD7746_CAPSETUP_CAPEN;
579d542534c96c drivers/staging/iio/cdc/ad7746.c Eva Rachel Retuya 2016-10-2=
8  253  		idx =3D (chip->config & AD7746_CONF_VTFS_MASK) >>
579d542534c96c drivers/staging/iio/cdc/ad7746.c Eva Rachel Retuya 2016-10-2=
8  254  			AD7746_CONF_VTFS_SHIFT;
579d542534c96c drivers/staging/iio/cdc/ad7746.c Eva Rachel Retuya 2016-10-2=
8  255  		delay =3D ad7746_cap_filter_rate_table[idx][1];
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  256  		break;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  257  	default:
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  258  		return -EINVAL;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  259  	}
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  260  =

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  261  	if (chip->cap_setup !=3D cap_setup) {
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  262  		ret =3D i2c_smbus_write_byte_data(chip->client,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  263  						AD7746_REG_CAP_SETUP,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  264  						cap_setup);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  265  		if (ret < 0)
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  266  			return ret;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  267  =

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  268  		chip->cap_setup =3D cap_setup;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  269  	}
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  270  =

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  271  	if (chip->vt_setup !=3D vt_setup) {
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  272  		ret =3D i2c_smbus_write_byte_data(chip->client,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  273  						AD7746_REG_VT_SETUP,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  274  						vt_setup);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  275  		if (ret < 0)
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  276  			return ret;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  277  =

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  278  		chip->vt_setup =3D vt_setup;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  279  	}
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  280  =

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  281  	return delay;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  282  }
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-2=
1  283  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4452224708049840102==--

