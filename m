Content-Type: multipart/mixed; boundary="===============2316460888339440771=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7798/12552] drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_mipi_csi2_s_stream() warn: missing error code 'ret'
Date: Mon, 25 Jul 2022 16:58:24 +0000
Message-ID: <202207240610.LL9VmyK3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2316460888339440771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18c107a1f120d095404d141dfad8f594bdc44020
commit: af54b4f4c17f54e8c7c43fb34571bc361cfa4ab4 [7798/12552] media: sunxi:=
 Add support for the A31 MIPI CSI-2 controller
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: xtensa-randconfig-m041-20220721 (https://download.01.org/0day-ci/ar=
chive/20220724/202207240610.LL9VmyK3-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_mi=
pi_csi2_s_stream() warn: missing error code 'ret'

vim +/ret +193 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2=
.c

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  170  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  171  static int sun6i_mipi_csi=
2_s_stream(struct v4l2_subdev *subdev, int on)
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  172  {
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  173  	struct sun6i_mipi_csi2_d=
evice *csi2_dev =3D v4l2_get_subdevdata(subdev);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  174  	struct v4l2_subdev *sour=
ce_subdev =3D csi2_dev->bridge.source_subdev;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  175  	union phy_configure_opts=
 dphy_opts =3D { 0 };
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  176  	struct phy_configure_opt=
s_mipi_dphy *dphy_cfg =3D &dphy_opts.mipi_dphy;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  177  	struct v4l2_mbus_framefm=
t *mbus_format =3D &csi2_dev->bridge.mbus_format;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  178  	const struct sun6i_mipi_=
csi2_format *format;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  179  	struct phy *dphy =3D csi=
2_dev->dphy;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  180  	struct device *dev =3D c=
si2_dev->dev;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  181  	struct v4l2_ctrl *ctrl;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  182  	unsigned int lanes_count=
 =3D
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  183  		csi2_dev->bridge.endpoi=
nt.bus.mipi_csi2.num_data_lanes;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  184  	unsigned long pixel_rate;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  185  	/* Initialize to 0 to us=
e both in disable label (ret !=3D 0) and off. */
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  186  	int ret =3D 0;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  187  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  188  	if (!source_subdev)
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  189  		return -ENODEV;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  190  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  191  	if (!on) {
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  192  		v4l2_subdev_call(source=
_subdev, video, s_stream, 0);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25 @193  		goto disable;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  194  	}
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  195  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  196  	/* Runtime PM */
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  197  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  198  	ret =3D pm_runtime_resum=
e_and_get(dev);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  199  	if (ret < 0)
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  200  		return ret;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  201  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  202  	/* Sensor Pixel Rate */
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  203  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  204  	ctrl =3D v4l2_ctrl_find(=
source_subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  205  	if (!ctrl) {
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  206  		dev_err(dev, "missing s=
ensor pixel rate\n");
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  207  		ret =3D -ENODEV;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  208  		goto error_pm;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  209  	}
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  210  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  211  	pixel_rate =3D (unsigned=
 long)v4l2_ctrl_g_ctrl_int64(ctrl);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  212  	if (!pixel_rate) {
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  213  		dev_err(dev, "missing (=
zero) sensor pixel rate\n");
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  214  		ret =3D -ENODEV;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  215  		goto error_pm;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  216  	}
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  217  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  218  	/* D-PHY */
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  219  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  220  	if (!lanes_count) {
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  221  		dev_err(dev, "missing (=
zero) MIPI CSI-2 lanes count\n");
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  222  		ret =3D -ENODEV;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  223  		goto error_pm;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  224  	}
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  225  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  226  	format =3D sun6i_mipi_cs=
i2_format_find(mbus_format->code);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  227  	if (WARN_ON(!format)) {
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  228  		ret =3D -ENODEV;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  229  		goto error_pm;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  230  	}
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  231  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  232  	phy_mipi_dphy_get_defaul=
t_config(pixel_rate, format->bpp, lanes_count,
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  233  					 dphy_cfg);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  234  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  235  	/*
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  236  	 * Note that our hardwar=
e is using DDR, which is not taken in account by
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  237  	 * phy_mipi_dphy_get_def=
ault_config when calculating hs_clk_rate from
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  238  	 * the pixel rate, lanes=
 count and bpp.
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  239  	 *
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  240  	 * The resulting clock r=
ate is basically the symbol rate over the whole
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  241  	 * link. The actual cloc=
k rate is calculated with division by two since
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  242  	 * DDR samples both on r=
ising and falling edges.
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  243  	 */
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  244  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  245  	dev_dbg(dev, "A31 MIPI C=
SI-2 config:\n");
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  246  	dev_dbg(dev, "%ld pixels=
/s, %u bits/pixel, %u lanes, %lu Hz clock\n",
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  247  		pixel_rate, format->bpp=
, lanes_count,
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  248  		dphy_cfg->hs_clk_rate /=
 2);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  249  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  250  	ret =3D phy_reset(dphy);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  251  	if (ret) {
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  252  		dev_err(dev, "failed to=
 reset MIPI D-PHY\n");
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  253  		goto error_pm;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  254  	}
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  255  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  256  	ret =3D phy_configure(dp=
hy, &dphy_opts);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  257  	if (ret) {
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  258  		dev_err(dev, "failed to=
 configure MIPI D-PHY\n");
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  259  		goto error_pm;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  260  	}
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  261  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  262  	/* Controller */
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  263  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  264  	sun6i_mipi_csi2_configur=
e(csi2_dev);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  265  	sun6i_mipi_csi2_enable(c=
si2_dev);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  266  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  267  	/* D-PHY */
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  268  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  269  	ret =3D phy_power_on(dph=
y);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  270  	if (ret) {
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  271  		dev_err(dev, "failed to=
 power on MIPI D-PHY\n");
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  272  		goto error_pm;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  273  	}
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  274  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  275  	/* Source */
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  276  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  277  	ret =3D v4l2_subdev_call=
(source_subdev, video, s_stream, 1);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  278  	if (ret && ret !=3D -ENO=
IOCTLCMD)
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  279  		goto disable;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  280  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  281  	return 0;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  282  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  283  disable:
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  284  	phy_power_off(dphy);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  285  	sun6i_mipi_csi2_disable(=
csi2_dev);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  286  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  287  error_pm:
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  288  	pm_runtime_put(dev);
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  289  =

af54b4f4c17f54 Paul Kocialkowski 2022-05-25  290  	return ret;
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  291  }
af54b4f4c17f54 Paul Kocialkowski 2022-05-25  292  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2316460888339440771==--

