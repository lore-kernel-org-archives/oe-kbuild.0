Content-Type: multipart/mixed; boundary="===============5196316161042459002=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7802/12552] drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'
Date: Mon, 25 Jul 2022 16:58:25 +0000
Message-ID: <202207240836.h9b0oWS0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5196316161042459002==
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
commit: 576d196c522bd0e17bf9c5ff92ef963c0960a201 [7802/12552] media: sunxi:=
 Add support for the A83T MIPI CSI-2 controller
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: xtensa-randconfig-m041-20220721 (https://download.01.org/0day-ci/ar=
chive/20220724/202207240836.h9b0oWS0-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:22=
5 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'

vim +/ret +225 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_mipi_csi2.c

576d196c522bd0 Paul Kocialkowski 2022-05-25  201  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  202  static int sun8i_a83t_mip=
i_csi2_s_stream(struct v4l2_subdev *subdev, int on)
576d196c522bd0 Paul Kocialkowski 2022-05-25  203  {
576d196c522bd0 Paul Kocialkowski 2022-05-25  204  	struct sun8i_a83t_mipi_c=
si2_device *csi2_dev =3D
576d196c522bd0 Paul Kocialkowski 2022-05-25  205  		v4l2_get_subdevdata(sub=
dev);
576d196c522bd0 Paul Kocialkowski 2022-05-25  206  	struct v4l2_subdev *sour=
ce_subdev =3D csi2_dev->bridge.source_subdev;
576d196c522bd0 Paul Kocialkowski 2022-05-25  207  	union phy_configure_opts=
 dphy_opts =3D { 0 };
576d196c522bd0 Paul Kocialkowski 2022-05-25  208  	struct phy_configure_opt=
s_mipi_dphy *dphy_cfg =3D &dphy_opts.mipi_dphy;
576d196c522bd0 Paul Kocialkowski 2022-05-25  209  	struct v4l2_mbus_framefm=
t *mbus_format =3D &csi2_dev->bridge.mbus_format;
576d196c522bd0 Paul Kocialkowski 2022-05-25  210  	const struct sun8i_a83t_=
mipi_csi2_format *format;
576d196c522bd0 Paul Kocialkowski 2022-05-25  211  	struct phy *dphy =3D csi=
2_dev->dphy;
576d196c522bd0 Paul Kocialkowski 2022-05-25  212  	struct device *dev =3D c=
si2_dev->dev;
576d196c522bd0 Paul Kocialkowski 2022-05-25  213  	struct v4l2_ctrl *ctrl;
576d196c522bd0 Paul Kocialkowski 2022-05-25  214  	unsigned int lanes_count=
 =3D
576d196c522bd0 Paul Kocialkowski 2022-05-25  215  		csi2_dev->bridge.endpoi=
nt.bus.mipi_csi2.num_data_lanes;
576d196c522bd0 Paul Kocialkowski 2022-05-25  216  	unsigned long pixel_rate;
576d196c522bd0 Paul Kocialkowski 2022-05-25  217  	/* Initialize to 0 to us=
e both in disable label (ret !=3D 0) and off. */
576d196c522bd0 Paul Kocialkowski 2022-05-25  218  	int ret =3D 0;
576d196c522bd0 Paul Kocialkowski 2022-05-25  219  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  220  	if (!source_subdev)
576d196c522bd0 Paul Kocialkowski 2022-05-25  221  		return -ENODEV;
576d196c522bd0 Paul Kocialkowski 2022-05-25  222  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  223  	if (!on) {
576d196c522bd0 Paul Kocialkowski 2022-05-25  224  		v4l2_subdev_call(source=
_subdev, video, s_stream, 0);
576d196c522bd0 Paul Kocialkowski 2022-05-25 @225  		goto disable;
576d196c522bd0 Paul Kocialkowski 2022-05-25  226  	}
576d196c522bd0 Paul Kocialkowski 2022-05-25  227  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  228  	/* Runtime PM */
576d196c522bd0 Paul Kocialkowski 2022-05-25  229  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  230  	ret =3D pm_runtime_resum=
e_and_get(dev);
576d196c522bd0 Paul Kocialkowski 2022-05-25  231  	if (ret < 0)
576d196c522bd0 Paul Kocialkowski 2022-05-25  232  		return ret;
576d196c522bd0 Paul Kocialkowski 2022-05-25  233  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  234  	/* Sensor pixel rate */
576d196c522bd0 Paul Kocialkowski 2022-05-25  235  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  236  	ctrl =3D v4l2_ctrl_find(=
source_subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
576d196c522bd0 Paul Kocialkowski 2022-05-25  237  	if (!ctrl) {
576d196c522bd0 Paul Kocialkowski 2022-05-25  238  		dev_err(dev, "missing s=
ensor pixel rate\n");
576d196c522bd0 Paul Kocialkowski 2022-05-25  239  		ret =3D -ENODEV;
576d196c522bd0 Paul Kocialkowski 2022-05-25  240  		goto error_pm;
576d196c522bd0 Paul Kocialkowski 2022-05-25  241  	}
576d196c522bd0 Paul Kocialkowski 2022-05-25  242  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  243  	pixel_rate =3D (unsigned=
 long)v4l2_ctrl_g_ctrl_int64(ctrl);
576d196c522bd0 Paul Kocialkowski 2022-05-25  244  	if (!pixel_rate) {
576d196c522bd0 Paul Kocialkowski 2022-05-25  245  		dev_err(dev, "missing (=
zero) sensor pixel rate\n");
576d196c522bd0 Paul Kocialkowski 2022-05-25  246  		ret =3D -ENODEV;
576d196c522bd0 Paul Kocialkowski 2022-05-25  247  		goto error_pm;
576d196c522bd0 Paul Kocialkowski 2022-05-25  248  	}
576d196c522bd0 Paul Kocialkowski 2022-05-25  249  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  250  	/* D-PHY */
576d196c522bd0 Paul Kocialkowski 2022-05-25  251  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  252  	if (!lanes_count) {
576d196c522bd0 Paul Kocialkowski 2022-05-25  253  		dev_err(dev, "missing (=
zero) MIPI CSI-2 lanes count\n");
576d196c522bd0 Paul Kocialkowski 2022-05-25  254  		ret =3D -ENODEV;
576d196c522bd0 Paul Kocialkowski 2022-05-25  255  		goto error_pm;
576d196c522bd0 Paul Kocialkowski 2022-05-25  256  	}
576d196c522bd0 Paul Kocialkowski 2022-05-25  257  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  258  	format =3D sun8i_a83t_mi=
pi_csi2_format_find(mbus_format->code);
576d196c522bd0 Paul Kocialkowski 2022-05-25  259  	if (WARN_ON(!format)) {
576d196c522bd0 Paul Kocialkowski 2022-05-25  260  		ret =3D -ENODEV;
576d196c522bd0 Paul Kocialkowski 2022-05-25  261  		goto error_pm;
576d196c522bd0 Paul Kocialkowski 2022-05-25  262  	}
576d196c522bd0 Paul Kocialkowski 2022-05-25  263  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  264  	phy_mipi_dphy_get_defaul=
t_config(pixel_rate, format->bpp, lanes_count,
576d196c522bd0 Paul Kocialkowski 2022-05-25  265  					 dphy_cfg);
576d196c522bd0 Paul Kocialkowski 2022-05-25  266  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  267  	/*
576d196c522bd0 Paul Kocialkowski 2022-05-25  268  	 * Note that our hardwar=
e is using DDR, which is not taken in account by
576d196c522bd0 Paul Kocialkowski 2022-05-25  269  	 * phy_mipi_dphy_get_def=
ault_config when calculating hs_clk_rate from
576d196c522bd0 Paul Kocialkowski 2022-05-25  270  	 * the pixel rate, lanes=
 count and bpp.
576d196c522bd0 Paul Kocialkowski 2022-05-25  271  	 *
576d196c522bd0 Paul Kocialkowski 2022-05-25  272  	 * The resulting clock r=
ate is basically the symbol rate over the whole
576d196c522bd0 Paul Kocialkowski 2022-05-25  273  	 * link. The actual cloc=
k rate is calculated with division by two since
576d196c522bd0 Paul Kocialkowski 2022-05-25  274  	 * DDR samples both on r=
ising and falling edges.
576d196c522bd0 Paul Kocialkowski 2022-05-25  275  	 */
576d196c522bd0 Paul Kocialkowski 2022-05-25  276  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  277  	dev_dbg(dev, "A83T MIPI =
CSI-2 config:\n");
576d196c522bd0 Paul Kocialkowski 2022-05-25  278  	dev_dbg(dev, "%ld pixels=
/s, %u bits/pixel, %u lanes, %lu Hz clock\n",
576d196c522bd0 Paul Kocialkowski 2022-05-25  279  		pixel_rate, format->bpp=
, lanes_count,
576d196c522bd0 Paul Kocialkowski 2022-05-25  280  		dphy_cfg->hs_clk_rate /=
 2);
576d196c522bd0 Paul Kocialkowski 2022-05-25  281  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  282  	ret =3D phy_reset(dphy);
576d196c522bd0 Paul Kocialkowski 2022-05-25  283  	if (ret) {
576d196c522bd0 Paul Kocialkowski 2022-05-25  284  		dev_err(dev, "failed to=
 reset MIPI D-PHY\n");
576d196c522bd0 Paul Kocialkowski 2022-05-25  285  		goto error_pm;
576d196c522bd0 Paul Kocialkowski 2022-05-25  286  	}
576d196c522bd0 Paul Kocialkowski 2022-05-25  287  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  288  	ret =3D phy_configure(dp=
hy, &dphy_opts);
576d196c522bd0 Paul Kocialkowski 2022-05-25  289  	if (ret) {
576d196c522bd0 Paul Kocialkowski 2022-05-25  290  		dev_err(dev, "failed to=
 configure MIPI D-PHY\n");
576d196c522bd0 Paul Kocialkowski 2022-05-25  291  		goto error_pm;
576d196c522bd0 Paul Kocialkowski 2022-05-25  292  	}
576d196c522bd0 Paul Kocialkowski 2022-05-25  293  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  294  	/* Controller */
576d196c522bd0 Paul Kocialkowski 2022-05-25  295  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  296  	sun8i_a83t_mipi_csi2_con=
figure(csi2_dev);
576d196c522bd0 Paul Kocialkowski 2022-05-25  297  	sun8i_a83t_mipi_csi2_ena=
ble(csi2_dev);
576d196c522bd0 Paul Kocialkowski 2022-05-25  298  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  299  	/* D-PHY */
576d196c522bd0 Paul Kocialkowski 2022-05-25  300  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  301  	ret =3D phy_power_on(dph=
y);
576d196c522bd0 Paul Kocialkowski 2022-05-25  302  	if (ret) {
576d196c522bd0 Paul Kocialkowski 2022-05-25  303  		dev_err(dev, "failed to=
 power on MIPI D-PHY\n");
576d196c522bd0 Paul Kocialkowski 2022-05-25  304  		goto error_pm;
576d196c522bd0 Paul Kocialkowski 2022-05-25  305  	}
576d196c522bd0 Paul Kocialkowski 2022-05-25  306  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  307  	/* Source */
576d196c522bd0 Paul Kocialkowski 2022-05-25  308  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  309  	ret =3D v4l2_subdev_call=
(source_subdev, video, s_stream, 1);
576d196c522bd0 Paul Kocialkowski 2022-05-25  310  	if (ret && ret !=3D -ENO=
IOCTLCMD)
576d196c522bd0 Paul Kocialkowski 2022-05-25  311  		goto disable;
576d196c522bd0 Paul Kocialkowski 2022-05-25  312  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  313  	return 0;
576d196c522bd0 Paul Kocialkowski 2022-05-25  314  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  315  disable:
576d196c522bd0 Paul Kocialkowski 2022-05-25  316  	phy_power_off(dphy);
576d196c522bd0 Paul Kocialkowski 2022-05-25  317  	sun8i_a83t_mipi_csi2_dis=
able(csi2_dev);
576d196c522bd0 Paul Kocialkowski 2022-05-25  318  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  319  error_pm:
576d196c522bd0 Paul Kocialkowski 2022-05-25  320  	pm_runtime_put(dev);
576d196c522bd0 Paul Kocialkowski 2022-05-25  321  =

576d196c522bd0 Paul Kocialkowski 2022-05-25  322  	return ret;
576d196c522bd0 Paul Kocialkowski 2022-05-25  323  }
576d196c522bd0 Paul Kocialkowski 2022-05-25  324  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5196316161042459002==--

