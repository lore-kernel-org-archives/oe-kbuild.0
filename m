Content-Type: multipart/mixed; boundary="===============2882916011914359726=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/temperature/max31865.c:238:22: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 08 Aug 2022 22:30:30 +0800
Message-ID: <202208082213.GvFaWHca-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2882916011914359726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/i=
io/temperature/max31865.c:238:22: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Navin Sankar Velliangiri <navin@linumiz.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4e23eeebb2e57f5a28b36221aa776b5a1122dde5
commit: e112dc4e18eafc5ee9d5700e3c059ac9897ae2a1 iio: temperature: Add MAX3=
1865 RTD Support
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220807 (https://download.01.org/0day-ci/archi=
ve/20220808/202208082213.GvFaWHca-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De112dc4e18eafc5ee9d5700e3c059ac9897ae2a1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e112dc4e18eafc5ee9d5700e3c059ac9897ae2a1
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
              |      |            ~   =

              |      |            |
              |      |            (43) following 'false' branch (when 'ret =
=3D=3D 0')...
              |......
              |  131 |         if (data->filter_50hz) {
              |      |             ~~~~~~~~~~~~~~~~~
              |      |                 |
              |      |                 (44) ...to here
              |......
              |  140 |         if (ret)
              |      |            ~   =

              |      |            |
              |      |            (45) following 'false' branch (when 'ret =
=3D=3D 0')...
              |
            'max31865_rtd_read': event 46
              |
              |include/asm-generic/unaligned.h:14:15:
              |   14 |         __pptr->x;                                  =
                            \
              |      |         ~~~~~~^~~
              |      |               |
              |      |               (46) ...to here
   include/uapi/linux/swab.h:102:54: note: in definition of macro '__swab16'
              |  102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)=
(x))
              |      |                                                     =
 ^
   include/linux/byteorder/generic.h:97:21: note: in expansion of macro '__=
be16_to_cpu'
              |   97 | #define be16_to_cpu __be16_to_cpu
              |      |                     ^~~~~~~~~~~~~
   include/asm-generic/unaligned.h:57:28: note: in expansion of macro '__ge=
t_unaligned_t'
              |   57 |         return be16_to_cpu(__get_unaligned_t(__be16,=
 p));
              |      |                            ^~~~~~~~~~~~~~~~~
              |
            'max31865_rtd_read': event 47
              |
              |drivers/iio/temperature/max31865.c:145:16:
              |  145 |         return disable_bias(data);
              |      |                ^~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (47) calling 'disable_bias' from 'max=
31865_rtd_read'
              |
              +--> 'disable_bias': events 48-51
                     |
                     |   87 | static int disable_bias(struct max31865_data =
*data)
                     |      |            ^~~~~~~~~~~~
                     |      |            |
                     |      |            (48) entry to 'disable_bias'
                     |......
                     |   93 |         if (ret)
                     |      |            ~
                     |      |            |
                     |      |            (49) following 'false' branch (whe=
n 'ret =3D=3D 0')...
                     |......
                     |   96 |         cfg =3D data->buf[0];
                     |      |         ~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (50) ...to here
                     |......
                     |  102 |         return max31865_write(data, 2);
                     |      |                ~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                |
                     |      |                (51) calling 'max31865_write' =
from 'disable_bias'
                     |
                     +--> 'max31865_write': events 52-53
                            |
                            |   65 | static int max31865_write(struct max31=
865_data *data, size_t len)
                            |      |            ^~~~~~~~~~~~~~
                            |      |            |
                            |      |            (52) entry to 'max31865_wri=
te'
                            |   66 | {
                            |   67 |         return spi_write(data->spi, da=
ta->buf, len);
                            |      |                ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
                            |      |                |
                            |      |                (53) calling 'spi_write=
' from 'max31865_write'
                            |
                            +--> 'spi_write': events 54-55
                                   |
                                   |include/linux/spi/spi.h:1265:1:
                                   | 1265 | spi_write(struct spi_device *sp=
i, const void *buf, size_t len)
                                   |      | ^~~~~~~~~
                                   |      | |
                                   |      | (54) entry to 'spi_write'
                                   |......
                                   | 1272 |         return spi_sync_transfe=
r(spi, &t, 1);
                                   |      |                ~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
                                   |      |                |
                                   |      |                (55) calling 'sp=
i_sync_transfer' from 'spi_write'
                                   |
                                   +--> 'spi_sync_transfer': events 56-58
                                          |
                                          | 1242 | spi_sync_transfer(struct=
 spi_device *spi, struct spi_transfer *xfers,
                                          |      | ^~~~~~~~~~~~~~~~~
                                          |      | |
                                          |      | (56) entry to 'spi_sync_=
transfer'
                                          |......
                                          | 1245 |         struct spi_messa=
ge msg;
                                          |      |                         =
   ~~~
                                          |      |                         =
   |
                                          |      |                         =
   (57) region created on stack here
                                          |      |                         =
   (58) use of uninitialized value '*(int *)((char *)&msg + offsetof(struct=
 spi_message, is_dma_mapped))' here
                                          |
   drivers/iio/temperature/max31865.c: In function 'set_filter':
>> drivers/iio/temperature/max31865.c:238:22: warning: use of uninitialized=
 value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     238 |         unsigned int freq;
         |                      ^~~~
     'set_filter': event 1
       |
       |  238 |         unsigned int freq;
       |      |                      ^~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |

vim +238 drivers/iio/temperature/max31865.c

e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  230  =

e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  231  static ssize_t se=
t_filter(struct device *dev,
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  232  			  struct devic=
e_attribute *attr,
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  233  			  const char *=
buf,
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  234  			  size_t len)
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  235  {
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  236  	struct iio_dev *=
indio_dev =3D dev_to_iio_dev(dev);
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  237  	struct max31865_=
data *data =3D iio_priv(indio_dev);
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24 @238  	unsigned int fre=
q;
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  239  	int ret;
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  240  =

e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  241  	ret =3D kstrtoui=
nt(buf, 10, &freq);
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  242  	if (ret)
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  243  		return ret;
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  244  =

e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  245  	switch (freq) {
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  246  	case 50:
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  247  		data->filter_50=
hz =3D true;
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  248  		break;
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  249  	case 60:
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  250  		data->filter_50=
hz =3D false;
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  251  		break;
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  252  	default:
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  253  		return -EINVAL;
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  254  	}
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  255  =

e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  256  	mutex_lock(&data=
->lock);
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  257  	ret =3D max31865=
_init(data);
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  258  	mutex_unlock(&da=
ta->lock);
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  259  	if (ret)
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  260  		return ret;
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  261  =

e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  262  	return len;
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  263  }
e112dc4e18eafc5 Navin Sankar Velliangiri 2021-08-24  264  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2882916011914359726==--

