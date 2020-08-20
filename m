Content-Type: multipart/mixed; boundary="===============1167035696784852459=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/imx219.c:1163:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Thu, 20 Aug 2020 15:37:46 +0800
Message-ID: <202008201541.AxxQ4tXO%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1167035696784852459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Andrey Konovalov <andrey.konovalov@linaro.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   18445bf405cb331117bc98427b1ba6f12418ad17
commit: 1283b3b8f82b9004fbb94398cade5c8e797a2c8d media: i2c: Add driver for=
 Sony IMX219 sensor
date:   6 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 6 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/media/i2c/imx219.c:1163:6: warning: Variable 'ret' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/media/i2c/imx219.c:1131:0: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    int ret =3D -EINVAL;
   ^
   drivers/media/i2c/imx219.c:1163:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D 0;
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D1283b3b8f82b9004fbb94398cade5c8e797a2c8d
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 1283b3b8f82b9004fbb94398cade5c8e797a2c8d
vim +/ret +1163 drivers/media/i2c/imx219.c

1283b3b8f82b90 Dave Stevenson 2020-01-20  1124  =

1283b3b8f82b90 Dave Stevenson 2020-01-20  1125  static int imx219_check_hwc=
fg(struct device *dev)
1283b3b8f82b90 Dave Stevenson 2020-01-20  1126  {
1283b3b8f82b90 Dave Stevenson 2020-01-20  1127  	struct fwnode_handle *endp=
oint;
1283b3b8f82b90 Dave Stevenson 2020-01-20  1128  	struct v4l2_fwnode_endpoin=
t ep_cfg =3D {
1283b3b8f82b90 Dave Stevenson 2020-01-20  1129  		.bus_type =3D V4L2_MBUS_C=
SI2_DPHY
1283b3b8f82b90 Dave Stevenson 2020-01-20  1130  	};
1283b3b8f82b90 Dave Stevenson 2020-01-20  1131  	int ret =3D -EINVAL;
1283b3b8f82b90 Dave Stevenson 2020-01-20  1132  =

1283b3b8f82b90 Dave Stevenson 2020-01-20  1133  	endpoint =3D fwnode_graph_=
get_next_endpoint(dev_fwnode(dev), NULL);
1283b3b8f82b90 Dave Stevenson 2020-01-20  1134  	if (!endpoint) {
1283b3b8f82b90 Dave Stevenson 2020-01-20  1135  		dev_err(dev, "endpoint no=
de not found\n");
1283b3b8f82b90 Dave Stevenson 2020-01-20  1136  		return -EINVAL;
1283b3b8f82b90 Dave Stevenson 2020-01-20  1137  	}
1283b3b8f82b90 Dave Stevenson 2020-01-20  1138  =

1283b3b8f82b90 Dave Stevenson 2020-01-20  1139  	if (v4l2_fwnode_endpoint_a=
lloc_parse(endpoint, &ep_cfg)) {
1283b3b8f82b90 Dave Stevenson 2020-01-20  1140  		dev_err(dev, "could not p=
arse endpoint\n");
1283b3b8f82b90 Dave Stevenson 2020-01-20  1141  		goto error_out;
1283b3b8f82b90 Dave Stevenson 2020-01-20  1142  	}
1283b3b8f82b90 Dave Stevenson 2020-01-20  1143  =

1283b3b8f82b90 Dave Stevenson 2020-01-20  1144  	/* Check the number of MIP=
I CSI2 data lanes */
1283b3b8f82b90 Dave Stevenson 2020-01-20  1145  	if (ep_cfg.bus.mipi_csi2.n=
um_data_lanes !=3D 2) {
1283b3b8f82b90 Dave Stevenson 2020-01-20  1146  		dev_err(dev, "only 2 data=
 lanes are currently supported\n");
1283b3b8f82b90 Dave Stevenson 2020-01-20  1147  		goto error_out;
1283b3b8f82b90 Dave Stevenson 2020-01-20  1148  	}
1283b3b8f82b90 Dave Stevenson 2020-01-20  1149  =

1283b3b8f82b90 Dave Stevenson 2020-01-20  1150  	/* Check the link frequenc=
y set in device tree */
1283b3b8f82b90 Dave Stevenson 2020-01-20  1151  	if (!ep_cfg.nr_of_link_fre=
quencies) {
1283b3b8f82b90 Dave Stevenson 2020-01-20  1152  		dev_err(dev, "link-freque=
ncy property not found in DT\n");
1283b3b8f82b90 Dave Stevenson 2020-01-20  1153  		goto error_out;
1283b3b8f82b90 Dave Stevenson 2020-01-20  1154  	}
1283b3b8f82b90 Dave Stevenson 2020-01-20  1155  =

1283b3b8f82b90 Dave Stevenson 2020-01-20  1156  	if (ep_cfg.nr_of_link_freq=
uencies !=3D 1 ||
1283b3b8f82b90 Dave Stevenson 2020-01-20  1157  	    ep_cfg.link_frequencie=
s[0] !=3D IMX219_DEFAULT_LINK_FREQ) {
1283b3b8f82b90 Dave Stevenson 2020-01-20  1158  		dev_err(dev, "Link freque=
ncy not supported: %lld\n",
1283b3b8f82b90 Dave Stevenson 2020-01-20  1159  			ep_cfg.link_frequencies[=
0]);
1283b3b8f82b90 Dave Stevenson 2020-01-20  1160  		goto error_out;
1283b3b8f82b90 Dave Stevenson 2020-01-20  1161  	}
1283b3b8f82b90 Dave Stevenson 2020-01-20  1162  =

1283b3b8f82b90 Dave Stevenson 2020-01-20 @1163  	ret =3D 0;
1283b3b8f82b90 Dave Stevenson 2020-01-20  1164  =

1283b3b8f82b90 Dave Stevenson 2020-01-20  1165  error_out:
1283b3b8f82b90 Dave Stevenson 2020-01-20  1166  	v4l2_fwnode_endpoint_free(=
&ep_cfg);
1283b3b8f82b90 Dave Stevenson 2020-01-20  1167  	fwnode_handle_put(endpoint=
);
1283b3b8f82b90 Dave Stevenson 2020-01-20  1168  =

1283b3b8f82b90 Dave Stevenson 2020-01-20  1169  	return ret;
1283b3b8f82b90 Dave Stevenson 2020-01-20  1170  }
1283b3b8f82b90 Dave Stevenson 2020-01-20  1171  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1167035696784852459==--

