Content-Type: multipart/mixed; boundary="===============6602144404950725917=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/ccs/ccs-core.c:2040:3: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Mon, 13 Sep 2021 15:53:05 +0800
Message-ID: <202109131557.7TdynkZN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6602144404950725917==
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
head:   6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
commit: b24cc2a18c50e4e315abc76a86b26b4c49652f79 media: smiapp: Rename as "=
ccs"
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-c006-20210908 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9c4761=
72b93367d2cb88d7d3f4b1b5b456fa6020)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db24cc2a18c50e4e315abc76a86b26b4c49652f79
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b24cc2a18c50e4e315abc76a86b26b4c49652f79
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


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
x417' is <=3D '__UNIQUE_ID___y418'
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
x419' is <=3D '__UNIQUE_ID___y420'
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

--===============6602144404950725917==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6602144404950725917==--

