Content-Type: multipart/mixed; boundary="===============8479125350323323810=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1126/1472] drivers/iio/cdc/ad7746.c:336:14: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Wed, 17 Aug 2022 20:29:24 +0800
Message-ID: <202208172004.6EUBN7yD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8479125350323323810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/i=
io/cdc/ad7746.c:336:14: warning: use of uninitialized value '<unknown>' [CW=
E-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   95d10484d66e54d5c01e36389e9318221fb8f60b
commit: 40b5c4d5b5a67e79eef86a653cdc8b10b4d73f11 [1126/1472] iio: cdc: ad77=
46: Move driver out of staging.
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220817 (https://download.01.org/0day-ci/archi=
ve/20220817/202208172004.6EUBN7yD-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D40b5c4d5b5a67e79eef86a653cdc8b10b4d73f11
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 40b5c4d5b5a67e79eef86a653cdc8b10b4d73f11
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/iio/cdc/ad7746.c: In function 'ad7746_start_calib':
>> drivers/iio/cdc/ad7746.c:336:14: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     336 |         bool doit;
         |              ^~~~
     'ad7746_start_calib': event 1
       |
       |  336 |         bool doit;
       |      |              ^~~~
       |      |              |
       |      |              (1) use of uninitialized value '<unknown>' here
       |
   drivers/iio/cdc/ad7746.c: In function 'ad7746_probe':
   drivers/iio/cdc/ad7746.c:727:22: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     727 |         unsigned int vdd_permille;
         |                      ^~~~~~~~~~~~
     'ad7746_probe': event 1
       |
       |  727 |         unsigned int vdd_permille;
       |      |                      ^~~~~~~~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |

vim +336 drivers/iio/cdc/ad7746.c

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  326  =

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  327  static inline ssize_t ad7746_start_calib(struct device *dev,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  328  					 struct device_attribute *attr,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  329  					 const char *buf,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  330  					 size_t len,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  331  					 u8 regval)
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  332  {
d30a7f9df02232 drivers/staging/iio/cdc/ad7746.c Lars-Peter Clausen 2012-05-=
12  333  	struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  334  	struct ad7746_chip_info *chip =3D iio_priv(indio_dev);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  335  	int ret, timeout =3D 10;
afcd0b22e35e0b drivers/staging/iio/cdc/ad7746.c Hern=C3=A1n Gonzalez    201=
8-04-13 @336  	bool doit;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  337  =

74f582ec127e3b drivers/staging/iio/cdc/ad7746.c Lars-Peter Clausen 2022-04-=
09  338  	ret =3D kstrtobool(buf, &doit);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  339  	if (ret < 0)
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  340  		return ret;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  341  =

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  342  	if (!doit)
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  343  		return 0;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  344  =

9854a1b5c46573 drivers/staging/iio/cdc/ad7746.c Aishwarya Pant     2017-03-=
14  345  	mutex_lock(&chip->lock);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  346  	regval |=3D chip->config;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  347  	ret =3D i2c_smbus_write_byte_data(chip->client, AD7746_REG_CFG, r=
egval);
aa6b707c146d4d drivers/staging/iio/cdc/ad7746.c Markus Elfring     2017-11-=
03  348  	if (ret < 0)
aa6b707c146d4d drivers/staging/iio/cdc/ad7746.c Markus Elfring     2017-11-=
03  349  		goto unlock;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  350  =

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  351  	do {
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  352  		msleep(20);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  353  		ret =3D i2c_smbus_read_byte_data(chip->client, AD7746_REG_CFG);
aa6b707c146d4d drivers/staging/iio/cdc/ad7746.c Markus Elfring     2017-11-=
03  354  		if (ret < 0)
aa6b707c146d4d drivers/staging/iio/cdc/ad7746.c Markus Elfring     2017-11-=
03  355  			goto unlock;
aa6b707c146d4d drivers/staging/iio/cdc/ad7746.c Markus Elfring     2017-11-=
03  356  =

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  357  	} while ((ret =3D=3D regval) && timeout--);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  358  =

9854a1b5c46573 drivers/staging/iio/cdc/ad7746.c Aishwarya Pant     2017-03-=
14  359  	mutex_unlock(&chip->lock);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  360  =

83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  361  	return len;
aa6b707c146d4d drivers/staging/iio/cdc/ad7746.c Markus Elfring     2017-11-=
03  362  =

aa6b707c146d4d drivers/staging/iio/cdc/ad7746.c Markus Elfring     2017-11-=
03  363  unlock:
aa6b707c146d4d drivers/staging/iio/cdc/ad7746.c Markus Elfring     2017-11-=
03  364  	mutex_unlock(&chip->lock);
aa6b707c146d4d drivers/staging/iio/cdc/ad7746.c Markus Elfring     2017-11-=
03  365  	return ret;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  366  }
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich  2011-09-=
21  367  =


:::::: The code at line 336 was first introduced by commit
:::::: afcd0b22e35e0b3375e524c220ec52e549e9b9cb staging: iio: ad7746: Reord=
er variable declarations

:::::: TO: Hern=C3=A1n Gonzalez <hernan@vanguardiasur.com.ar>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8479125350323323810==--

