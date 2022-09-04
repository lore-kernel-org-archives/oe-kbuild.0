Content-Type: multipart/mixed; boundary="===============2705608410130238660=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/dac/ad3552r.c:401:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 04 Sep 2022 19:54:32 +0800
Message-ID: <202209041914.XwTn0oyY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2705608410130238660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/i=
io/dac/ad3552r.c:401:13: warning: use of uninitialized value '<unknown>' [C=
WE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mihail Chindris <mihail.chindris@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7726d4c3e60bfe206738894267414a5f10510f1a
commit: 8f2b54824b28ba8317c60947b5941d686e3df70d drivers:iio:dac: Add AD355=
2R driver support
date:   9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220901 (https://download.01.org/0day-ci/archi=
ve/20220904/202209041914.XwTn0oyY-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8f2b54824b28ba8317c60947b5941d686e3df70d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8f2b54824b28ba8317c60947b5941d686e3df70d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/iio/dac/ad3552r.c: In function 'ad3552r_update_reg_field':
>> drivers/iio/dac/ad3552r.c:401:13: warning: use of uninitialized value '<=
unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     401 |         u16 reg;
         |             ^~~
     'ad3552r_probe': events 1-2
       |
       | 1069 | static int ad3552r_probe(struct spi_device *spi)
       |      |            ^~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ad3552r_probe'
       |......
       | 1077 |         if (!indio_dev)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'indio_dev' i=
s non-NULL)...
       |
     'ad3552r_probe': event 3
       |
       |include/linux/iio/iio.h:667:25:
       |  667 |         return indio_dev->priv;
       |      |                ~~~~~~~~~^~~~~~
       |      |                         |
       |      |                         (3) ...to here
       |
     'ad3552r_probe': event 4
       |
       |drivers/iio/dac/ad3552r.c:1086:15:
       | 1086 |         err =3D ad3552r_init(dac);
       |      |               ^~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (4) calling 'ad3552r_init' from 'ad3552r_prob=
e'
       |
       +--> 'ad3552r_init': events 5-6
              |
              | 1030 | static int ad3552r_init(struct ad3552r_desc *dac)
              |      |            ^~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'ad3552r_init'
              |......
              | 1035 |         err =3D ad3552r_reset(dac);
              |      |               ~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (6) calling 'ad3552r_reset' from 'ad35=
52r_init'
              |
              +--> 'ad3552r_reset': events 7-12
                     |
                     |  655 | static int ad3552r_reset(struct ad3552r_desc =
*dac)
                     |      |            ^~~~~~~~~~~~~
                     |      |            |
                     |      |            (7) entry to 'ad3552r_reset'
                     |......
                     |  663 |         if (IS_ERR(dac->gpio_reset))
                     |      |            ~
                     |      |            |
                     |      |            (8) following 'false' branch...
                     |......
                     |  667 |         if (dac->gpio_reset) {
                     |      |            ~
                     |      |            |
                     |      |            (9) ...to here
                     |      |            (10) following 'false' branch...
                     |......
                     |  673 |                 ret =3D ad3552r_update_reg_fi=
eld(dac,
                     |      |                       ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
                     |      |                       |
                     |      |                       (11) ...to here
                     |      |                       (12) calling 'ad3552r_u=
pdate_reg_field' from 'ad3552r_reset'
                     |  674 |                                              =
  AD3552R_REG_ADDR_INTERFACE_CONFIG_A,
                     |      |                                              =
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |  675 |                                              =
  AD3552R_MASK_SOFTWARE_RESET,
                     |      |                                              =
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |  676 |                                              =
  AD3552R_MASK_SOFTWARE_RESET);
                     |      |                                              =
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |
                     +--> 'ad3552r_update_reg_field': events 13-14
                            |
                            |  397 | static int ad3552r_update_reg_field(st=
ruct ad3552r_desc *dac, u8 addr, u16 mask,
                            |      |            ^~~~~~~~~~~~~~~~~~~~~~~~
                            |      |            |
                            |      |            (13) entry to 'ad3552r_upda=
te_reg_field'
                            |......
                            |  401 |         u16 reg;
                            |      |             ~~~
                            |      |             |
                            |      |             (14) use of uninitialized =
value '<unknown>' here
                            |
   drivers/iio/dac/ad3552r.c: In function 'ad3552r_check_scratch_pad':
   drivers/iio/dac/ad3552r.c:610:13: warning: use of uninitialized value '<=
unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     610 |         u16 val;
         |             ^~~
     'ad3552r_probe': events 1-2
       |
       | 1069 | static int ad3552r_probe(struct spi_device *spi)
       |      |            ^~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ad3552r_probe'
       |......
       | 1077 |         if (!indio_dev)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'indio_dev' i=
s non-NULL)...
       |

vim +401 drivers/iio/dac/ad3552r.c

8f2b54824b28ba Mihail Chindris 2021-12-13  395  =

8f2b54824b28ba Mihail Chindris 2021-12-13  396  /* Update field of a regist=
er, shift val if needed */
8f2b54824b28ba Mihail Chindris 2021-12-13  397  static int ad3552r_update_r=
eg_field(struct ad3552r_desc *dac, u8 addr, u16 mask,
8f2b54824b28ba Mihail Chindris 2021-12-13  398  				    u16 val)
8f2b54824b28ba Mihail Chindris 2021-12-13  399  {
8f2b54824b28ba Mihail Chindris 2021-12-13  400  	int ret;
8f2b54824b28ba Mihail Chindris 2021-12-13 @401  	u16 reg;
8f2b54824b28ba Mihail Chindris 2021-12-13  402  =

8f2b54824b28ba Mihail Chindris 2021-12-13  403  	ret =3D ad3552r_read_reg(d=
ac, addr, &reg);
8f2b54824b28ba Mihail Chindris 2021-12-13  404  	if (ret < 0)
8f2b54824b28ba Mihail Chindris 2021-12-13  405  		return ret;
8f2b54824b28ba Mihail Chindris 2021-12-13  406  =

8f2b54824b28ba Mihail Chindris 2021-12-13  407  	reg &=3D ~mask;
8f2b54824b28ba Mihail Chindris 2021-12-13  408  	reg |=3D ad3552r_field_pre=
p(val, mask);
8f2b54824b28ba Mihail Chindris 2021-12-13  409  =

8f2b54824b28ba Mihail Chindris 2021-12-13  410  	return ad3552r_write_reg(d=
ac, addr, reg);
8f2b54824b28ba Mihail Chindris 2021-12-13  411  }
8f2b54824b28ba Mihail Chindris 2021-12-13  412  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2705608410130238660==--

