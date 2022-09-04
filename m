Content-Type: multipart/mixed; boundary="===============8523219059312742692=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/frequency/adrf6780.c:153:22: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 04 Sep 2022 12:02:01 +0800
Message-ID: <202209041140.6EuvF1p9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8523219059312742692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/i=
io/frequency/adrf6780.c:153:22: warning: use of uninitialized value '<unkno=
wn>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   65eea2c060aee3bf6d27ea365360059fbd4eeff4
commit: 63aaf6d06d87866dd6b58265711a979ed4968420 iio: frequency: adrf6780: =
add support for ADRF6780
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220901 (https://download.01.org/0day-ci/archi=
ve/20220904/202209041140.6EuvF1p9-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D63aaf6d06d87866dd6b58265711a979ed4968420
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 63aaf6d06d87866dd6b58265711a979ed4968420
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/iio/frequency/adrf6780.c: In function 'adrf6780_spi_write':
   drivers/iio/frequency/adrf6780.c:136:12: warning: infinite recursion det=
ected [-Winfinite-recursion]
     136 | static int adrf6780_spi_write(struct adrf6780_state *st, unsigne=
d int reg,
         |            ^~~~~~~~~~~~~~~~~~
   drivers/iio/frequency/adrf6780.c:142:15: note: recursive call
     142 |         ret =3D adrf6780_spi_write(st, reg, val);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/frequency/adrf6780.c: In function 'adrf6780_spi_read':
   drivers/iio/frequency/adrf6780.c:115:12: warning: infinite recursion det=
ected [-Winfinite-recursion]
     115 | static int adrf6780_spi_read(struct adrf6780_state *st, unsigned=
 int reg,
         |            ^~~~~~~~~~~~~~~~~
   drivers/iio/frequency/adrf6780.c:121:15: note: recursive call
     121 |         ret =3D adrf6780_spi_read(st, reg, val);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/frequency/adrf6780.c: In function '__adrf6780_spi_update_bit=
s':
>> drivers/iio/frequency/adrf6780.c:153:22: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     153 |         unsigned int data, temp;
         |                      ^~~~
     'adrf6780_reset': events 1-2
       |
       |  347 | static int adrf6780_reset(struct adrf6780_state *st)
       |      |            ^~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'adrf6780_reset'
       |......
       |  352 |         ret =3D __adrf6780_spi_update_bits(st, ADRF6780_REG=
_CONTROL,
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |               |
       |      |               (2) calling '__adrf6780_spi_update_bits' from=
 'adrf6780_reset'
       |  353 |                                          ADRF6780_SOFT_RESE=
T_MSK,
       |      |                                          ~~~~~~~~~~~~~~~~~~=
~~~~~~
       |  354 |                                          FIELD_PREP(ADRF678=
0_SOFT_RESET_MSK, 1));
       |      |                                          ~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
       |
       +--> '__adrf6780_spi_update_bits': events 3-4
              |
              |  148 | static int __adrf6780_spi_update_bits(struct adrf678=
0_state *st,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to '__adrf6780_spi_update_bits'
              |......
              |  153 |         unsigned int data, temp;
              |      |                      ~~~~
              |      |                      |
              |      |                      (4) use of uninitialized value =
'<unknown>' here
              |
   drivers/iio/frequency/adrf6780.c: In function 'adrf6780_init':
   drivers/iio/frequency/adrf6780.c:374:22: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     374 |         unsigned int chip_id, enable_reg, enable_reg_msk;
         |                      ^~~~~~~
     'adrf6780_init': event 1
       |
       |  374 |         unsigned int chip_id, enable_reg, enable_reg_msk;
       |      |                      ^~~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |

vim +153 drivers/iio/frequency/adrf6780.c

63aaf6d06d8786 Antoniu Miclaus 2021-10-21  114  =

63aaf6d06d8786 Antoniu Miclaus 2021-10-21 @115  static int adrf6780_spi_rea=
d(struct adrf6780_state *st, unsigned int reg,
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  116  			     unsigned int *val)
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  117  {
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  118  	int ret;
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  119  =

63aaf6d06d8786 Antoniu Miclaus 2021-10-21  120  	mutex_lock(&st->lock);
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  121  	ret =3D adrf6780_spi_read(=
st, reg, val);
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  122  	mutex_unlock(&st->lock);
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  123  =

63aaf6d06d8786 Antoniu Miclaus 2021-10-21  124  	return ret;
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  125  }
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  126  =

63aaf6d06d8786 Antoniu Miclaus 2021-10-21  127  static int __adrf6780_spi_w=
rite(struct adrf6780_state *st,
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  128  				unsigned int reg,
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  129  				unsigned int val)
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  130  {
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  131  	put_unaligned_be24((val <<=
 1) | (reg << 17), &st->data[0]);
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  132  =

63aaf6d06d8786 Antoniu Miclaus 2021-10-21  133  	return spi_write(st->spi, =
&st->data[0], 3);
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  134  }
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  135  =

63aaf6d06d8786 Antoniu Miclaus 2021-10-21  136  static int adrf6780_spi_wri=
te(struct adrf6780_state *st, unsigned int reg,
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  137  			      unsigned int val)
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  138  {
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  139  	int ret;
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  140  =

63aaf6d06d8786 Antoniu Miclaus 2021-10-21  141  	mutex_lock(&st->lock);
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  142  	ret =3D adrf6780_spi_write=
(st, reg, val);
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  143  	mutex_unlock(&st->lock);
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  144  =

63aaf6d06d8786 Antoniu Miclaus 2021-10-21  145  	return ret;
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  146  }
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  147  =

63aaf6d06d8786 Antoniu Miclaus 2021-10-21  148  static int __adrf6780_spi_u=
pdate_bits(struct adrf6780_state *st,
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  149  				      unsigned int reg,=
 unsigned int mask,
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  150  				      unsigned int val)
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  151  {
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  152  	int ret;
63aaf6d06d8786 Antoniu Miclaus 2021-10-21 @153  	unsigned int data, temp;
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  154  =

63aaf6d06d8786 Antoniu Miclaus 2021-10-21  155  	ret =3D __adrf6780_spi_rea=
d(st, reg, &data);
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  156  	if (ret)
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  157  		return ret;
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  158  =

63aaf6d06d8786 Antoniu Miclaus 2021-10-21  159  	temp =3D (data & ~mask) | =
(val & mask);
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  160  =

63aaf6d06d8786 Antoniu Miclaus 2021-10-21  161  	return __adrf6780_spi_writ=
e(st, reg, temp);
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  162  }
63aaf6d06d8786 Antoniu Miclaus 2021-10-21  163  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8523219059312742692==--

