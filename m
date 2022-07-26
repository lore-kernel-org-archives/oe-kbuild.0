Content-Type: multipart/mixed; boundary="===============7802720528386459808=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/hi847.c:2295:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Tue, 26 Jul 2022 20:32:38 +0800
Message-ID: <202207262004.zvFk3W2T-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7802720528386459808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/i2c/hi847.c:2295:13: warning: use of uninitialized value '<unknown>' [=
CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Shawn Tu <shawnx.tu@intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e0dccc3b76fb35bb257b4118367a883073d7390e
commit: da15b409ef4c56e9741deddb91798370802d1d02 media: hi847: Add support =
for Hi-847 sensor
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220726/202207262004.zvFk3W2T-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dda15b409ef4c56e9741deddb91798370802d1d02
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout da15b409ef4c56e9741deddb91798370802d1d02
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/media/i2c/hi847.c: In function 'hi847_test_pattern':
>> drivers/media/i2c/hi847.c:2295:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    2295 |         u32 val;
         |             ^~~
     'hi847_test_pattern': event 1
       |
       | 2295 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/media/i2c/hi847.c: In function 'hi847_set_ctrl_hflip':
   drivers/media/i2c/hi847.c:2375:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    2375 |         u32 val;
         |             ^~~
     'hi847_set_ctrl_hflip': event 1
       |
       | 2375 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/media/i2c/hi847.c: In function 'hi847_set_ctrl_vflip':
   drivers/media/i2c/hi847.c:2394:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    2394 |         u32 val;
         |             ^~~
     'hi847_set_ctrl_vflip': event 1
       |
       | 2394 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/media/i2c/hi847.c: In function 'hi847_identify_module':
   drivers/media/i2c/hi847.c:2822:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    2822 |         u32 val;
         |             ^~~
     'hi847_identify_module': event 1
       |
       | 2822 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/media/i2c/hi847.c: In function 'hi847_check_hwcfg':
   drivers/media/i2c/hi847.c:2845:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    2845 |         u32 mclk;
         |             ^~~~
     'hi847_check_hwcfg': event 1
       |
       | 2845 |         u32 mclk;
       |      |             ^~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +2295 drivers/media/i2c/hi847.c

da15b409ef4c56 Shawn Tu 2022-01-11  2291  =

da15b409ef4c56 Shawn Tu 2022-01-11  2292  static int hi847_test_pattern(str=
uct hi847 *hi847, u32 pattern)
da15b409ef4c56 Shawn Tu 2022-01-11  2293  {
da15b409ef4c56 Shawn Tu 2022-01-11  2294  	int ret;
da15b409ef4c56 Shawn Tu 2022-01-11 @2295  	u32 val;
da15b409ef4c56 Shawn Tu 2022-01-11  2296  =

da15b409ef4c56 Shawn Tu 2022-01-11  2297  	if (pattern) {
da15b409ef4c56 Shawn Tu 2022-01-11  2298  		ret =3D hi847_read_reg(hi847, H=
I847_REG_ISP,
da15b409ef4c56 Shawn Tu 2022-01-11  2299  				     HI847_REG_VALUE_16BIT, &=
val);
da15b409ef4c56 Shawn Tu 2022-01-11  2300  		if (ret)
da15b409ef4c56 Shawn Tu 2022-01-11  2301  			return ret;
da15b409ef4c56 Shawn Tu 2022-01-11  2302  =

da15b409ef4c56 Shawn Tu 2022-01-11  2303  		ret =3D hi847_write_reg(hi847, =
HI847_REG_ISP,
da15b409ef4c56 Shawn Tu 2022-01-11  2304  				      HI847_REG_VALUE_16BIT,
da15b409ef4c56 Shawn Tu 2022-01-11  2305  				      val | HI847_REG_ISP_TPG=
_EN);
da15b409ef4c56 Shawn Tu 2022-01-11  2306  		if (ret)
da15b409ef4c56 Shawn Tu 2022-01-11  2307  			return ret;
da15b409ef4c56 Shawn Tu 2022-01-11  2308  	}
da15b409ef4c56 Shawn Tu 2022-01-11  2309  =

da15b409ef4c56 Shawn Tu 2022-01-11  2310  	ret =3D hi847_read_reg(hi847, HI=
847_REG_TEST_PATTERN,
da15b409ef4c56 Shawn Tu 2022-01-11  2311  			     HI847_REG_VALUE_16BIT, &v=
al);
da15b409ef4c56 Shawn Tu 2022-01-11  2312  	if (ret)
da15b409ef4c56 Shawn Tu 2022-01-11  2313  		return ret;
da15b409ef4c56 Shawn Tu 2022-01-11  2314  =

da15b409ef4c56 Shawn Tu 2022-01-11  2315  	return hi847_write_reg(hi847, HI=
847_REG_TEST_PATTERN,
da15b409ef4c56 Shawn Tu 2022-01-11  2316  			       HI847_REG_VALUE_16BIT, =
val | pattern << 8);
da15b409ef4c56 Shawn Tu 2022-01-11  2317  }
da15b409ef4c56 Shawn Tu 2022-01-11  2318  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7802720528386459808==--

