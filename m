Content-Type: multipart/mixed; boundary="===============0875833640612077412=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/hi846.c:1320:12: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 25 Jul 2022 16:58:23 +0000
Message-ID: <202207231330.KP4Aw8KT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0875833640612077412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/i2c/hi846.c:1320:12: warning: use of uninitialized value '<unknown>' [=
CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Martin Kepplinger <martin.kepplinger@puri.sm>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Pavel Machek <pavel@ucw.cz>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   70664fc10c0d722ec79d746d8ac1db8546c94114
commit: e8c0882685f9152f0d729664a12bcbe749cb7736 media: i2c: add driver for=
 the SK Hynix Hi-846 8M pixel camera
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220723/202207231330.KP4Aw8KT-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c0882685f9152f0d729664a12bcbe749cb7736
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c0882685f9152f0d729664a12bcbe749cb7736
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/media/i2c/hi846.c: In function 'hi846_test_pattern':
>> drivers/media/i2c/hi846.c:1320:12: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1320 |         u8 val;
         |            ^~~
     'hi846_test_pattern': event 1
       |
       | 1320 |         u8 val;
       |      |            ^~~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |
   drivers/media/i2c/hi846.c: In function 'hi846_start_streaming':
   drivers/media/i2c/hi846.c:1526:12: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1526 |         u8 val;
         |            ^~~
     'hi846_start_streaming': event 1
       |
       | 1526 |         u8 val;
       |      |            ^~~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |
   drivers/media/i2c/hi846.c: In function 'hi846_identify_module':
   drivers/media/i2c/hi846.c:1942:12: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1942 |         u8 hi, lo;
         |            ^~
     'hi846_identify_module': event 1
       |
       | 1942 |         u8 hi, lo;
       |      |            ^~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |
   drivers/media/i2c/hi846.c:1942:16: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1942 |         u8 hi, lo;
         |                ^~
     'hi846_identify_module': event 1
       |
       | 1942 |         u8 hi, lo;
       |      |                ^~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |

vim +1320 drivers/media/i2c/hi846.c

e8c0882685f9152 Martin Kepplinger 2021-09-06  1316  =

e8c0882685f9152 Martin Kepplinger 2021-09-06  1317  static int hi846_test_p=
attern(struct hi846 *hi846, u32 pattern)
e8c0882685f9152 Martin Kepplinger 2021-09-06  1318  {
e8c0882685f9152 Martin Kepplinger 2021-09-06  1319  	int ret;
e8c0882685f9152 Martin Kepplinger 2021-09-06 @1320  	u8 val;
e8c0882685f9152 Martin Kepplinger 2021-09-06  1321  =

e8c0882685f9152 Martin Kepplinger 2021-09-06  1322  	if (pattern) {
e8c0882685f9152 Martin Kepplinger 2021-09-06  1323  		ret =3D hi846_read_re=
g(hi846, HI846_REG_ISP, &val);
e8c0882685f9152 Martin Kepplinger 2021-09-06  1324  		if (ret)
e8c0882685f9152 Martin Kepplinger 2021-09-06  1325  			return ret;
e8c0882685f9152 Martin Kepplinger 2021-09-06  1326  =

e8c0882685f9152 Martin Kepplinger 2021-09-06  1327  		ret =3D hi846_write_r=
eg(hi846, HI846_REG_ISP,
e8c0882685f9152 Martin Kepplinger 2021-09-06  1328  				      val | HI846_R=
EG_ISP_TPG_EN);
e8c0882685f9152 Martin Kepplinger 2021-09-06  1329  		if (ret)
e8c0882685f9152 Martin Kepplinger 2021-09-06  1330  			return ret;
e8c0882685f9152 Martin Kepplinger 2021-09-06  1331  	}
e8c0882685f9152 Martin Kepplinger 2021-09-06  1332  =

e8c0882685f9152 Martin Kepplinger 2021-09-06  1333  	return hi846_write_reg=
(hi846, HI846_REG_TEST_PATTERN, pattern);
e8c0882685f9152 Martin Kepplinger 2021-09-06  1334  }
e8c0882685f9152 Martin Kepplinger 2021-09-06  1335  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0875833640612077412==--

