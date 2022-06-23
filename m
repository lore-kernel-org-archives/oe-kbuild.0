Content-Type: multipart/mixed; boundary="===============5294193107537205844=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/regulator/mt6397-regulator.c:179:13: warning: shift by negative count ('-1')
Date: Thu, 23 Jun 2022 08:36:14 +0800
Message-ID: <202206230801.8S3TqXeH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5294193107537205844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/r=
egulator/mt6397-regulator.c:179:13: warning: shift by negative count ('-1')=
 [-Wanalyzer-shift-count-negative]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Axel Lin <axel.lin@ingics.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   de5c208d533a46a074eb46ea17f672cc005a7269
commit: 12401a1cef787167aff52ef2dd28286e61054c38 regulator: mt6397: Remove =
modeset_shift from struct mt6397_regulator_info
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220622 (https://download.01.org/0day-ci/archi=
ve/20220623/202206230801.8S3TqXeH-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D12401a1cef787167aff52ef2dd28286e61054c38
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 12401a1cef787167aff52ef2dd28286e61054c38
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In function 'mt6397_regulator_set_mode':
>> drivers/regulator/mt6397-regulator.c:179:13: warning: shift by negative =
count ('-1') [-Wanalyzer-shift-count-negative]
     179 |         val <<=3D ffs(info->modeset_mask) - 1;
         |             ^~~
     'mt6397_regulator_set_mode': events 1-2
       |
       |  158 | static int mt6397_regulator_set_mode(struct regulator_dev *=
rdev,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'mt6397_regulator_set_mode'
       |......
       |  179 |         val <<=3D ffs(info->modeset_mask) - 1;
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (2) calling 'ffs' from 'mt6397_regulator_se=
t_mode'
       |
       +--> 'ffs': events 3-4
              |
              |include/asm-generic/bitops/ffs.h:13:19:
              |   13 | static inline int ffs(int x)
              |      |                   ^~~
              |      |                   |
              |      |                   (3) entry to 'ffs'
              |......
              |   17 |         if (!x)
              |      |            ~       =

              |      |            |
              |      |            (4) following 'true' branch (when 'x =3D=
=3D 0')...
              |
            'ffs': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'mt6397_regulator_set_mode': events 6-7
       |
       |drivers/regulator/mt6397-regulator.c:179:17:
       |  179 |         val <<=3D ffs(info->modeset_mask) - 1;
       |      |             ~~~ ^~~~~~~~~~~~~~~~~~~~~~~
       |      |             |   |
       |      |             |   (6) returning to 'mt6397_regulator_set_mode=
' from 'ffs'
       |      |             (7) shift by negative amount here ('-1')
       |
   In function 'mt6397_regulator_get_mode':
   drivers/regulator/mt6397-regulator.c:206:16: warning: shift by negative =
count ('-1') [-Wanalyzer-shift-count-negative]
     206 |         regval >>=3D ffs(info->modeset_mask) - 1;
         |                ^~~
     'mt6397_regulator_get_mode': events 1-4
       |
       |  193 | static unsigned int mt6397_regulator_get_mode(struct regula=
tor_dev *rdev)
       |      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (1) entry to 'mt6397_regulator_get_mode'
       |......
       |  199 |         if (ret !=3D 0) {
       |      |            ~         =

       |      |            |
       |      |            (2) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       |  205 |         regval &=3D info->modeset_mask;
       |      |                   ~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (3) ...to here
       |  206 |         regval >>=3D ffs(info->modeset_mask) - 1;
       |      |                    ~~~~~~~~~~~~~~~~~~~~~~~
       |      |                    |
       |      |                    (4) calling 'ffs' from 'mt6397_regulator=
_get_mode'
       |
       +--> 'ffs': events 5-6
              |
              |include/asm-generic/bitops/ffs.h:13:19:
              |   13 | static inline int ffs(int x)
              |      |                   ^~~
              |      |                   |
              |      |                   (5) entry to 'ffs'
              |......
              |   17 |         if (!x)
              |      |            ~       =

              |      |            |
              |      |            (6) following 'true' branch (when 'x =3D=
=3D 0')...
              |
            'ffs': event 7
              |
              |cc1:
              | (7): ...to here
              |
       <------+
       |
     'mt6397_regulator_get_mode': events 8-9
       |
       |drivers/regulator/mt6397-regulator.c:206:20:
       |  206 |         regval >>=3D ffs(info->modeset_mask) - 1;
       |      |                ~~~ ^~~~~~~~~~~~~~~~~~~~~~~
       |      |                |   |
       |      |                |   (8) returning to 'mt6397_regulator_get_m=
ode' from 'ffs'
       |      |                (9) shift by negative amount here ('-1')
       |

vim +179 drivers/regulator/mt6397-regulator.c

8096236db4349c4 Anand K Mistry 2020-07-02  157  =

056925132722312 Henry Chen     2016-05-23  158  static int mt6397_regulator=
_set_mode(struct regulator_dev *rdev,
056925132722312 Henry Chen     2016-05-23  159  				     unsigned int mode)
056925132722312 Henry Chen     2016-05-23  160  {
056925132722312 Henry Chen     2016-05-23  161  	struct mt6397_regulator_in=
fo *info =3D rdev_get_drvdata(rdev);
056925132722312 Henry Chen     2016-05-23  162  	int ret, val;
056925132722312 Henry Chen     2016-05-23  163  =

056925132722312 Henry Chen     2016-05-23  164  	switch (mode) {
056925132722312 Henry Chen     2016-05-23  165  	case REGULATOR_MODE_FAST:
056925132722312 Henry Chen     2016-05-23  166  		val =3D MT6397_BUCK_MODE_=
FORCE_PWM;
056925132722312 Henry Chen     2016-05-23  167  		break;
056925132722312 Henry Chen     2016-05-23  168  	case REGULATOR_MODE_NORMAL:
056925132722312 Henry Chen     2016-05-23  169  		val =3D MT6397_BUCK_MODE_=
AUTO;
056925132722312 Henry Chen     2016-05-23  170  		break;
056925132722312 Henry Chen     2016-05-23  171  	default:
056925132722312 Henry Chen     2016-05-23  172  		ret =3D -EINVAL;
056925132722312 Henry Chen     2016-05-23  173  		goto err_mode;
056925132722312 Henry Chen     2016-05-23  174  	}
056925132722312 Henry Chen     2016-05-23  175  =

12401a1cef78716 Axel Lin       2021-06-29  176  	dev_dbg(&rdev->dev, "mt639=
7 buck set_mode %#x, %#x, %#x\n",
12401a1cef78716 Axel Lin       2021-06-29  177  		info->modeset_reg, info->=
modeset_mask, val);
12401a1cef78716 Axel Lin       2021-06-29  178  =

12401a1cef78716 Axel Lin       2021-06-29 @179  	val <<=3D ffs(info->modese=
t_mask) - 1;
056925132722312 Henry Chen     2016-05-23  180  =

056925132722312 Henry Chen     2016-05-23  181  	ret =3D regmap_update_bits=
(rdev->regmap, info->modeset_reg,
056925132722312 Henry Chen     2016-05-23  182  				 info->modeset_mask, va=
l);
056925132722312 Henry Chen     2016-05-23  183  err_mode:
056925132722312 Henry Chen     2016-05-23  184  	if (ret !=3D 0) {
056925132722312 Henry Chen     2016-05-23  185  		dev_err(&rdev->dev,
056925132722312 Henry Chen     2016-05-23  186  			"Failed to set mt6397 bu=
ck mode: %d\n", ret);
056925132722312 Henry Chen     2016-05-23  187  		return ret;
056925132722312 Henry Chen     2016-05-23  188  	}
056925132722312 Henry Chen     2016-05-23  189  =

056925132722312 Henry Chen     2016-05-23  190  	return 0;
056925132722312 Henry Chen     2016-05-23  191  }
056925132722312 Henry Chen     2016-05-23  192  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5294193107537205844==--

