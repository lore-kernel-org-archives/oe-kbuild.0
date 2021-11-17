Content-Type: multipart/mixed; boundary="===============3496366853483966419=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/ccs/ccs-core.c:2073:0: warning: syntax error [syntaxError]
Date: Thu, 18 Nov 2021 04:01:15 +0800
Message-ID: <202111180401.LvH9Zimb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3496366853483966419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ab774587903771821b59471cc723bba6d893942
commit: b24cc2a18c50e4e315abc76a86b26b4c49652f79 media: smiapp: Rename as "=
ccs"
date:   12 months ago
:::::: branch date: 3 days ago
:::::: commit date: 12 months ago
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/i2c/ccs/ccs-core.c:2073:0: warning: syntax error [syntaxEr=
ror]
   =

   ^

vim +2073 drivers/media/i2c/ccs/ccs-core.c

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
2-10  2040  		/ CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
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
2-10 @2073  			/ try[i] * CCS_LIM(sensor, SCALER_N_MIN),
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


:::::: The code at line 2073 was first introduced by commit
:::::: 3e158e1f1ec2aca4287bc12323c7e88d4e3b4f38 media: smiapp: Switch to CC=
S limits

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3496366853483966419==--

