Content-Type: multipart/mixed; boundary="===============0108702274824576676=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/ccs/ccs-core.c:2040:3: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Sun, 21 Nov 2021 12:32:01 +0800
Message-ID: <202111211247.4fqMo9fI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0108702274824576676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   923dcc5eb0c111eccd51cc7ce1658537e3c38b25
commit: b24cc2a18c50e4e315abc76a86b26b4c49652f79 media: smiapp: Rename as "=
ccs"
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20211119 (attached as .config)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db24cc2a18c50e4e315abc76a86b26b4c49652f79
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b24cc2a18c50e4e315abc76a86b26b4c49652f79
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   if (crops)
                       ^~~~~
   drivers/media/i2c/ccs/ccs-core.c:1749:3: note: Taking true branch
                   if (crops)
                   ^
   drivers/media/i2c/ccs/ccs-core.c:1750:16: note: Assuming 'i' is >=3D fie=
ld 'num_pads'
                           for (i =3D 0; i < subdev->entity.num_pads; i++)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:1750:4: note: Loop condition is false. =
Execution continues on line 1752
                           for (i =3D 0; i < subdev->entity.num_pads; i++)
                           ^
   drivers/media/i2c/ccs/ccs-core.c:1752:7: note: 'comps' is non-null
                   if (comps)
                       ^~~~~
   drivers/media/i2c/ccs/ccs-core.c:1752:3: note: Taking true branch
                   if (comps)
                   ^
   drivers/media/i2c/ccs/ccs-core.c:1767:1: note: Returning without writing=
 to '*crops'
   }
   ^
   drivers/media/i2c/ccs/ccs-core.c:2136:2: note: Returning from 'ccs_get_c=
rop_compose'
           ccs_get_crop_compose(subdev, cfg, crops, &comp, sel->which);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:2141:6: note: Assuming 'ssd' is not equ=
al to field 'binner'
           if (ssd =3D=3D sensor->binner)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:2141:2: note: Taking false branch
           if (ssd =3D=3D sensor->binner)
           ^
   drivers/media/i2c/ccs/ccs-core.c:2144:3: note: Calling 'ccs_set_compose_=
scaler'
                   ccs_set_compose_scaler(subdev, cfg, sel, crops, comp);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:2020:30: note: Left side of '&&' is fal=
se
           struct ccs_sensor *sensor =3D to_ccs_sensor(subdev);
                                       ^
   drivers/media/i2c/ccs/ccs.h:276:3: note: expanded from macro 'to_ccs_sen=
sor'
           (to_ccs_subdev(_sd)->sensor)
            ^
   drivers/media/i2c/ccs/ccs.h:273:2: note: expanded from macro 'to_ccs_sub=
dev'
           container_of(_sd, struct ccs_subdev, sd)
           ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/i2c/ccs/ccs-core.c:2020:30: note: Taking false branch
           struct ccs_sensor *sensor =3D to_ccs_sensor(subdev);
                                       ^
   drivers/media/i2c/ccs/ccs.h:276:3: note: expanded from macro 'to_ccs_sen=
sor'
           (to_ccs_subdev(_sd)->sensor)
            ^
   drivers/media/i2c/ccs/ccs.h:273:2: note: expanded from macro 'to_ccs_sub=
dev'
           container_of(_sd, struct ccs_subdev, sd)
           ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/i2c/ccs/ccs-core.c:2020:30: note: Loop condition is false.=
  Exiting loop
           struct ccs_sensor *sensor =3D to_ccs_sensor(subdev);
                                       ^
   drivers/media/i2c/ccs/ccs.h:276:3: note: expanded from macro 'to_ccs_sen=
sor'
           (to_ccs_subdev(_sd)->sensor)
            ^
   drivers/media/i2c/ccs/ccs.h:273:2: note: expanded from macro 'to_ccs_sub=
dev'
           container_of(_sd, struct ccs_subdev, sd)
           ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/media/i2c/ccs/ccs-core.c:2029:17: note: Access to field 'width' =
results in a dereference of an undefined pointer value
           sel->r.width =3D min_t(unsigned int, sel->r.width,
                          ^
   include/linux/minmax.h:110:58: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/minmax.h:44:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
>> drivers/media/i2c/ccs/ccs-core.c:2040:3: warning: Division by zero [clan=
g-analyzer-core.DivideZero]
                   / CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
                   ^
   drivers/media/i2c/ccs/ccs-core.c:2319:30: note: Left side of '&&' is fal=
se
           struct ccs_sensor *sensor =3D to_ccs_sensor(subdev);
                                       ^
   drivers/media/i2c/ccs/ccs.h:276:3: note: expanded from macro 'to_ccs_sen=
sor'
           (to_ccs_subdev(_sd)->sensor)
            ^
   drivers/media/i2c/ccs/ccs.h:273:2: note: expanded from macro 'to_ccs_sub=
dev'
           container_of(_sd, struct ccs_subdev, sd)
           ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/i2c/ccs/ccs-core.c:2319:30: note: Taking false branch
           struct ccs_sensor *sensor =3D to_ccs_sensor(subdev);
                                       ^
   drivers/media/i2c/ccs/ccs.h:276:3: note: expanded from macro 'to_ccs_sen=
sor'
           (to_ccs_subdev(_sd)->sensor)
            ^
   drivers/media/i2c/ccs/ccs.h:273:2: note: expanded from macro 'to_ccs_sub=
dev'
           container_of(_sd, struct ccs_subdev, sd)
           ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/i2c/ccs/ccs-core.c:2319:30: note: Loop condition is false.=
  Exiting loop
           struct ccs_sensor *sensor =3D to_ccs_sensor(subdev);
                                       ^
   drivers/media/i2c/ccs/ccs.h:276:3: note: expanded from macro 'to_ccs_sen=
sor'
           (to_ccs_subdev(_sd)->sensor)
            ^
   drivers/media/i2c/ccs/ccs.h:273:2: note: expanded from macro 'to_ccs_sub=
dev'
           container_of(_sd, struct ccs_subdev, sd)
           ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/media/i2c/ccs/ccs-core.c:2323:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/ccs/ccs-core.c:2323:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/ccs/ccs-core.c:2328:16: note: Assuming '__UNIQUE_ID___=
x367' is <=3D '__UNIQUE_ID___y368'
           sel->r.left =3D max(0, sel->r.left & ~1);
                         ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:2328:16: note: '?' condition is false
           sel->r.left =3D max(0, sel->r.left & ~1);
                         ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/media/i2c/ccs/ccs-core.c:2329:15: note: Assuming '__UNIQUE_ID___=
x369' is <=3D '__UNIQUE_ID___y370'
           sel->r.top =3D max(0, sel->r.top & ~1);
                        ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~

vim +2040 drivers/media/i2c/ccs/ccs-core.c

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2003  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2004  /*
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2005   * Calculate best scaling ratio and mode for given output resol=
ution.
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2006   *
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2007   * Try all of these: horizontal ratio, vertical ratio and small=
est
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2008   * size possible (horizontally).
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2009   *
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2010   * Also try whether horizontal scaler or full scaler gives a be=
tter
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2011   * result.
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2012   */
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2013  static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
f7234138f14c22 drivers/media/i2c/smiapp/smiapp-core.c   Hans Verkuil 2015-0=
3-04  2014  				   struct v4l2_subdev_pad_config *cfg,
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2015  				   struct v4l2_subdev_selection *sel,
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2016  				   struct v4l2_rect **crops,
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2017  				   struct v4l2_rect *comp)
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2018  {
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2019  	struct i2c_client *client =3D v4l2_get_subdevdata(subdev);
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2020  	struct ccs_sensor *sensor =3D to_ccs_sensor(subdev);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2021  	u32 min, max, a, b, max_m;
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2022  	u32 scale_m =3D CCS_LIM(sensor, SCALER_N_MIN);
42aab58f456a28 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-11  2023  	int mode =3D CCS_SCALING_MODE_HORIZONTAL;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2024  	u32 try[4];
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2025  	u32 ntry =3D 0;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2026  	unsigned int i;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2027  	int best =3D INT_MIN;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2028  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2029  	sel->r.width =3D min_t(unsigned int, sel->r.width,
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2030  			     crops[CCS_PAD_SINK]->width);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2031  	sel->r.height =3D min_t(unsigned int, sel->r.height,
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2032  			      crops[CCS_PAD_SINK]->height);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2033  =

161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2034  	a =3D crops[CCS_PAD_SINK]->width
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2035  		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.width;
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2036  	b =3D crops[CCS_PAD_SINK]->height
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2037  		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2038  	max_m =3D crops[CCS_PAD_SINK]->width
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2039  		* CCS_LIM(sensor, SCALER_N_MIN)
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10 @2040  		/ CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2041  =

3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2042  	a =3D clamp(a, CCS_LIM(sensor, SCALER_M_MIN),
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2043  		  CCS_LIM(sensor, SCALER_M_MAX));
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2044  	b =3D clamp(b, CCS_LIM(sensor, SCALER_M_MIN),
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2045  		  CCS_LIM(sensor, SCALER_M_MAX));
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2046  	max_m =3D clamp(max_m, CCS_LIM(sensor, SCALER_M_MIN),
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2047  		      CCS_LIM(sensor, SCALER_M_MAX));
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2048  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2049  	dev_dbg(&client->dev, "scaling: a %d b %d max_m %d\n", a, b, m=
ax_m);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2050  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2051  	min =3D min(max_m, min(a, b));
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2052  	max =3D min(max_m, max(a, b));
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2053  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2054  	try[ntry] =3D min;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2055  	ntry++;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2056  	if (min !=3D max) {
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2057  		try[ntry] =3D max;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2058  		ntry++;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2059  	}
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2060  	if (max !=3D max_m) {
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2061  		try[ntry] =3D min + 1;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2062  		ntry++;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2063  		if (min !=3D max) {
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2064  			try[ntry] =3D max + 1;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2065  			ntry++;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2066  		}
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2067  	}
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2068  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2069  	for (i =3D 0; i < ntry; i++) {
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2070  		int this =3D scaling_goodness(
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2071  			subdev,
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2072  			crops[CCS_PAD_SINK]->width
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2073  			/ try[i] * CCS_LIM(sensor, SCALER_N_MIN),
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2074  			sel->r.width,
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2075  			crops[CCS_PAD_SINK]->height,
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2076  			sel->r.height,
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2077  			sel->flags);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2078  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2079  		dev_dbg(&client->dev, "trying factor %d (%d)\n", try[i], i);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2080  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2081  		if (this > best) {
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2082  			scale_m =3D try[i];
42aab58f456a28 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-11  2083  			mode =3D CCS_SCALING_MODE_HORIZONTAL;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2084  			best =3D this;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2085  		}
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2086  =

3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2087  		if (CCS_LIM(sensor, SCALING_CAPABILITY)
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2088  		    =3D=3D CCS_SCALING_CAPABILITY_HORIZONTAL)
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2089  			continue;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2090  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2091  		this =3D scaling_goodness(
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2092  			subdev, crops[CCS_PAD_SINK]->width
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2093  			/ try[i]
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2094  			* CCS_LIM(sensor, SCALER_N_MIN),
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2095  			sel->r.width,
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2096  			crops[CCS_PAD_SINK]->height
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2097  			/ try[i]
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2098  			* CCS_LIM(sensor, SCALER_N_MIN),
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2099  			sel->r.height,
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2100  			sel->flags);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2101  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2102  		if (this > best) {
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2103  			scale_m =3D try[i];
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2104  			mode =3D SMIAPP_SCALING_MODE_BOTH;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2105  			best =3D this;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2106  		}
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2107  	}
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2108  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2109  	sel->r.width =3D
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2110  		(crops[CCS_PAD_SINK]->width
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2111  		 / scale_m
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2112  		 * CCS_LIM(sensor, SCALER_N_MIN)) & ~1;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2113  	if (mode =3D=3D SMIAPP_SCALING_MODE_BOTH)
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2114  		sel->r.height =3D
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2115  			(crops[CCS_PAD_SINK]->height
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2116  			 / scale_m
3e158e1f1ec2ac drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-0=
2-10  2117  			 * CCS_LIM(sensor, SCALER_N_MIN))
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2118  			& ~1;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2119  	else
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2120  		sel->r.height =3D crops[CCS_PAD_SINK]->height;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2121  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2122  	if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2123  		sensor->scale_m =3D scale_m;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2124  		sensor->scaling_mode =3D mode;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2125  	}
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2126  }
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2127  /* We're only called on source pads. This function sets scaling=
. */
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2128  static int ccs_set_compose(struct v4l2_subdev *subdev,
f7234138f14c22 drivers/media/i2c/smiapp/smiapp-core.c   Hans Verkuil 2015-0=
3-04  2129  			   struct v4l2_subdev_pad_config *cfg,
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2130  			   struct v4l2_subdev_selection *sel)
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2131  {
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2132  	struct ccs_sensor *sensor =3D to_ccs_sensor(subdev);
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2133  	struct ccs_subdev *ssd =3D to_ccs_subdev(subdev);
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2134  	struct v4l2_rect *comp, *crops[CCS_PADS];
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2135  =

161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2136  	ccs_get_crop_compose(subdev, cfg, crops, &comp, sel->which);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2137  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2138  	sel->r.top =3D 0;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2139  	sel->r.left =3D 0;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2140  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2141  	if (ssd =3D=3D sensor->binner)
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2142  		ccs_set_compose_binner(subdev, cfg, sel, crops, comp);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2143  	else
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2144  		ccs_set_compose_scaler(subdev, cfg, sel, crops, comp);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2145  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2146  	*comp =3D sel->r;
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2147  	ccs_propagate(subdev, cfg, sel->which, V4L2_SEL_TGT_COMPOSE);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2148  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2149  	if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
161cc847370a92 drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-0=
2-11  2150  		return ccs_pll_blanking_update(sensor);
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2151  =

ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2152  	return 0;
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2153  }
ccfc97bdb5ae8b drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-0=
3-03  2154  =


:::::: The code at line 2040 was first introduced by commit
:::::: 3e158e1f1ec2aca4287bc12323c7e88d4e3b4f38 media: smiapp: Switch to CC=
S limits

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0108702274824576676==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
QgIA
--===============0108702274824576676==--

