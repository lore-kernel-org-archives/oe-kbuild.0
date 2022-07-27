Content-Type: multipart/mixed; boundary="===============3499411778691258708=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/ov08d10.c:1352:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Wed, 27 Jul 2022 12:10:43 +0800
Message-ID: <202207271229.s2H99DMS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3499411778691258708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/i2c/ov08d10.c:1352:13: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jimmy Su <jimmy.su@intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5de64d44968e4ae66ebdb0a2d08b443f189d3651
commit: 7be91e02ed578234b1c29a0f5fa9e5ecdd954e06 media: i2c: Add ov08d10 ca=
mera sensor driver
date:   6 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220727/202207271229.s2H99DMS-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7be91e02ed578234b1c29a0f5fa9e5ecdd954e06
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7be91e02ed578234b1c29a0f5fa9e5ecdd954e06
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/media/i2c/ov08d10.c: In function 'ov08d10_get_hwcfg':
>> drivers/media/i2c/ov08d10.c:1352:13: warning: use of uninitialized value=
 '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1352 |         u32 xvclk_rate;
         |             ^~~~~~~~~~
     'ov08d10_get_hwcfg': event 1
       |
       | 1352 |         u32 xvclk_rate;
       |      |             ^~~~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +1352 drivers/media/i2c/ov08d10.c

7be91e02ed57823 Jimmy Su 2022-01-12  1344  =

7be91e02ed57823 Jimmy Su 2022-01-12  1345  static int ov08d10_get_hwcfg(str=
uct ov08d10 *ov08d10, struct device *dev)
7be91e02ed57823 Jimmy Su 2022-01-12  1346  {
7be91e02ed57823 Jimmy Su 2022-01-12  1347  	struct fwnode_handle *ep;
7be91e02ed57823 Jimmy Su 2022-01-12  1348  	struct fwnode_handle *fwnode =
=3D dev_fwnode(dev);
7be91e02ed57823 Jimmy Su 2022-01-12  1349  	struct v4l2_fwnode_endpoint bus=
_cfg =3D {
7be91e02ed57823 Jimmy Su 2022-01-12  1350  		.bus_type =3D V4L2_MBUS_CSI2_D=
PHY
7be91e02ed57823 Jimmy Su 2022-01-12  1351  	};
7be91e02ed57823 Jimmy Su 2022-01-12 @1352  	u32 xvclk_rate;
7be91e02ed57823 Jimmy Su 2022-01-12  1353  	unsigned int i, j;
7be91e02ed57823 Jimmy Su 2022-01-12  1354  	int ret;
7be91e02ed57823 Jimmy Su 2022-01-12  1355  =

7be91e02ed57823 Jimmy Su 2022-01-12  1356  	if (!fwnode)
7be91e02ed57823 Jimmy Su 2022-01-12  1357  		return -ENXIO;
7be91e02ed57823 Jimmy Su 2022-01-12  1358  =

7be91e02ed57823 Jimmy Su 2022-01-12  1359  	ret =3D fwnode_property_read_u3=
2(fwnode, "clock-frequency", &xvclk_rate);
7be91e02ed57823 Jimmy Su 2022-01-12  1360  	if (ret)
7be91e02ed57823 Jimmy Su 2022-01-12  1361  		return ret;
7be91e02ed57823 Jimmy Su 2022-01-12  1362  =

7be91e02ed57823 Jimmy Su 2022-01-12  1363  	if (xvclk_rate !=3D OV08D10_XVC=
LK_19_2)
7be91e02ed57823 Jimmy Su 2022-01-12  1364  		dev_warn(dev, "external clock =
rate %u is unsupported",
7be91e02ed57823 Jimmy Su 2022-01-12  1365  			 xvclk_rate);
7be91e02ed57823 Jimmy Su 2022-01-12  1366  =

7be91e02ed57823 Jimmy Su 2022-01-12  1367  	ep =3D fwnode_graph_get_next_en=
dpoint(fwnode, NULL);
7be91e02ed57823 Jimmy Su 2022-01-12  1368  	if (!ep)
7be91e02ed57823 Jimmy Su 2022-01-12  1369  		return -ENXIO;
7be91e02ed57823 Jimmy Su 2022-01-12  1370  =

7be91e02ed57823 Jimmy Su 2022-01-12  1371  	ret =3D v4l2_fwnode_endpoint_al=
loc_parse(ep, &bus_cfg);
7be91e02ed57823 Jimmy Su 2022-01-12  1372  	fwnode_handle_put(ep);
7be91e02ed57823 Jimmy Su 2022-01-12  1373  	if (ret)
7be91e02ed57823 Jimmy Su 2022-01-12  1374  		return ret;
7be91e02ed57823 Jimmy Su 2022-01-12  1375  =

7be91e02ed57823 Jimmy Su 2022-01-12  1376  	/* Get number of data lanes */
7be91e02ed57823 Jimmy Su 2022-01-12  1377  	if (bus_cfg.bus.mipi_csi2.num_d=
ata_lanes !=3D 2) {
7be91e02ed57823 Jimmy Su 2022-01-12  1378  		dev_err(dev, "number of CSI2 d=
ata lanes %d is not supported",
7be91e02ed57823 Jimmy Su 2022-01-12  1379  			bus_cfg.bus.mipi_csi2.num_dat=
a_lanes);
7be91e02ed57823 Jimmy Su 2022-01-12  1380  		ret =3D -EINVAL;
7be91e02ed57823 Jimmy Su 2022-01-12  1381  		goto check_hwcfg_error;
7be91e02ed57823 Jimmy Su 2022-01-12  1382  	}
7be91e02ed57823 Jimmy Su 2022-01-12  1383  =

7be91e02ed57823 Jimmy Su 2022-01-12  1384  	dev_dbg(dev, "Using %u data lan=
es\n", ov08d10->cur_mode->data_lanes);
7be91e02ed57823 Jimmy Su 2022-01-12  1385  =

7be91e02ed57823 Jimmy Su 2022-01-12  1386  	ov08d10->priv_lane =3D &lane_cf=
g_2;
7be91e02ed57823 Jimmy Su 2022-01-12  1387  	ov08d10->modes_size =3D ov08d10=
_modes_num(ov08d10);
7be91e02ed57823 Jimmy Su 2022-01-12  1388  =

7be91e02ed57823 Jimmy Su 2022-01-12  1389  	if (!bus_cfg.nr_of_link_frequen=
cies) {
7be91e02ed57823 Jimmy Su 2022-01-12  1390  		dev_err(dev, "no link frequenc=
ies defined");
7be91e02ed57823 Jimmy Su 2022-01-12  1391  		ret =3D -EINVAL;
7be91e02ed57823 Jimmy Su 2022-01-12  1392  		goto check_hwcfg_error;
7be91e02ed57823 Jimmy Su 2022-01-12  1393  	}
7be91e02ed57823 Jimmy Su 2022-01-12  1394  =

7be91e02ed57823 Jimmy Su 2022-01-12  1395  	for (i =3D 0; i < ARRAY_SIZE(ov=
08d10->priv_lane->link_freq_menu); i++) {
7be91e02ed57823 Jimmy Su 2022-01-12  1396  		for (j =3D 0; j < bus_cfg.nr_o=
f_link_frequencies; j++) {
7be91e02ed57823 Jimmy Su 2022-01-12  1397  			if (ov08d10->priv_lane->link_=
freq_menu[i] =3D=3D
7be91e02ed57823 Jimmy Su 2022-01-12  1398  			    bus_cfg.link_frequencies[=
j])
7be91e02ed57823 Jimmy Su 2022-01-12  1399  				break;
7be91e02ed57823 Jimmy Su 2022-01-12  1400  		}
7be91e02ed57823 Jimmy Su 2022-01-12  1401  =

7be91e02ed57823 Jimmy Su 2022-01-12  1402  		if (j =3D=3D bus_cfg.nr_of_lin=
k_frequencies) {
7be91e02ed57823 Jimmy Su 2022-01-12  1403  			dev_err(dev, "no link frequen=
cy %lld supported",
7be91e02ed57823 Jimmy Su 2022-01-12  1404  				ov08d10->priv_lane->link_fre=
q_menu[i]);
7be91e02ed57823 Jimmy Su 2022-01-12  1405  			ret =3D -EINVAL;
7be91e02ed57823 Jimmy Su 2022-01-12  1406  			goto check_hwcfg_error;
7be91e02ed57823 Jimmy Su 2022-01-12  1407  		}
7be91e02ed57823 Jimmy Su 2022-01-12  1408  	}
7be91e02ed57823 Jimmy Su 2022-01-12  1409  =

7be91e02ed57823 Jimmy Su 2022-01-12  1410  check_hwcfg_error:
7be91e02ed57823 Jimmy Su 2022-01-12  1411  	v4l2_fwnode_endpoint_free(&bus_=
cfg);
7be91e02ed57823 Jimmy Su 2022-01-12  1412  =

7be91e02ed57823 Jimmy Su 2022-01-12  1413  	return ret;
7be91e02ed57823 Jimmy Su 2022-01-12  1414  }
7be91e02ed57823 Jimmy Su 2022-01-12  1415  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3499411778691258708==--

