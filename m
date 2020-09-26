Content-Type: multipart/mixed; boundary="===============0651696833072498793=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/tvp5150.c:1114 tvp5150_set_selection() warn: passing a valid pointer to 'PTR_ERR'
Date: Sun, 27 Sep 2020 06:42:58 +0800
Message-ID: <202009270653.pcDPVAuL%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0651696833072498793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Marco Felsch <m.felsch@pengutronix.de>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a1bffa48745afbb54cb4f873bba783b2ae8be042
commit: 46fe6e7dcededcf4aba88163fee80f4f7df23deb media: tvp5150: add FORMAT=
_TRY support for get/set selection handlers
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: h8300-randconfig-m031-20200927 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/i2c/tvp5150.c:1114 tvp5150_set_selection() warn: passing a va=
lid pointer to 'PTR_ERR'
drivers/media/i2c/tvp5150.c:1157 tvp5150_get_selection() warn: passing a va=
lid pointer to 'PTR_ERR'

vim +/PTR_ERR +1114 drivers/media/i2c/tvp5150.c

46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1076  =

10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1077  static int tvp5150_set_selection(struct v4l2_subdev *sd,
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1078  				 struct v4l2_subdev_pad_config *cfg,
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1079  				 struct v4l2_subdev_selection *sel)
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1080  {
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1081  	struct tvp5150 *decoder =3D to_tvp5150(sd);
b4125e5b1bd70d3 drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1082  	struct v4l2_rect *rect =3D &sel->r;
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1083  	struct v4l2_rect *crop;
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1084  	unsigned int hmax;
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1085  =

46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1086  	if (sel->target !=3D V4L2_SEL_TGT_CROP)
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1087  		return -EINVAL;
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1088  =

257e29f84e377d0 drivers/media/i2c/tvp5150.c   Mauro Carvalho Chehab 2016-11=
-16  1089  	dev_dbg_lvl(sd->dev, 1, debug, "%s left=3D%d, top=3D%d, width=
=3D%d, height=3D%d\n",
b4125e5b1bd70d3 drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1090  		__func__, rect->left, rect->top, rect->width, rect->height);
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1091  =

963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1092  	/* tvp5150 has some special limits */
b4125e5b1bd70d3 drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1093  	rect->left =3D clamp(rect->left, 0, TVP5150_MAX_CROP_LEFT);
b4125e5b1bd70d3 drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1094  	rect->top =3D clamp(rect->top, 0, TVP5150_MAX_CROP_TOP);
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1095  	hmax =3D tvp5150_get_hmax(sd);
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1096  =

bd24db04101f45a drivers/media/i2c/tvp5150.c   Marco Felsch          2018-06=
-28  1097  	/*
bd24db04101f45a drivers/media/i2c/tvp5150.c   Marco Felsch          2018-06=
-28  1098  	 * alignments:
bd24db04101f45a drivers/media/i2c/tvp5150.c   Marco Felsch          2018-06=
-28  1099  	 *  - width =3D 2 due to UYVY colorspace
bd24db04101f45a drivers/media/i2c/tvp5150.c   Marco Felsch          2018-06=
-28  1100  	 *  - height, image =3D no special alignment
bd24db04101f45a drivers/media/i2c/tvp5150.c   Marco Felsch          2018-06=
-28  1101  	 */
b4125e5b1bd70d3 drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1102  	v4l_bound_align_image(&rect->width,
b4125e5b1bd70d3 drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1103  			      TVP5150_H_MAX - TVP5150_MAX_CROP_LEFT - rect->left,
b4125e5b1bd70d3 drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1104  			      TVP5150_H_MAX - rect->left, 1, &rect->height,
b4125e5b1bd70d3 drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1105  			      hmax - TVP5150_MAX_CROP_TOP - rect->top,
b4125e5b1bd70d3 drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1106  			      hmax - rect->top, 0, 0);
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1107  =

46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1108  	if (!IS_ENABLED(CONFIG_VIDEO_V4L2_SUBDEV_API) &&
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1109  	    sel->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1110  		return 0;
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1111  =

46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1112  	crop =3D tvp5150_get_pad_crop(decoder, cfg, sel->pad, sel->whic=
h);
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1113  	if (IS_ERR(crop))
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12 @1114  		return PTR_ERR(crop);
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1115  =

46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1116  	/*
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1117  	 * Update output image size if the selection (crop) rectangle s=
ize or
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1118  	 * position has been modified.
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1119  	 */
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1120  	if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1121  	    !v4l2_rect_equal(rect, crop))
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1122  		tvp5150_set_hw_selection(sd, rect);
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1123  =

46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1124  	*crop =3D *rect;
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1125  =

963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1126  	return 0;
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1127  }
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1128  =

10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1129  static int tvp5150_get_selection(struct v4l2_subdev *sd,
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1130  				 struct v4l2_subdev_pad_config *cfg,
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1131  				 struct v4l2_subdev_selection *sel)
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1132  {
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1133  	struct tvp5150 *decoder =3D container_of(sd, struct tvp5150, sd=
);
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1134  	struct v4l2_rect *crop;
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1135  	v4l2_std_id std;
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1136  =

10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1137  	switch (sel->target) {
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1138  	case V4L2_SEL_TGT_CROP_BOUNDS:
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1139  		sel->r.left =3D 0;
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1140  		sel->r.top =3D 0;
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1141  		sel->r.width =3D TVP5150_H_MAX;
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1142  =

963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1143  		/* Calculate height based on current standard */
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1144  		if (decoder->norm =3D=3D V4L2_STD_ALL)
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1145  			std =3D tvp5150_read_std(sd);
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1146  		else
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1147  			std =3D decoder->norm;
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1148  		if (std & V4L2_STD_525_60)
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1149  			sel->r.height =3D TVP5150_V_MAX_525_60;
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1150  		else
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1151  			sel->r.height =3D TVP5150_V_MAX_OTHERS;
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1152  		return 0;
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1153  	case V4L2_SEL_TGT_CROP:
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1154  		crop =3D tvp5150_get_pad_crop(decoder, cfg, sel->pad,
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1155  					    sel->which);
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1156  		if (IS_ERR(crop))
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12 @1157  			return PTR_ERR(crop);
46fe6e7dcededcf drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03=
-12  1158  		sel->r =3D *crop;
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1159  		return 0;
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1160  	default:
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1161  		return -EINVAL;
10d5509c8d50a2c drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12=
-14  1162  	}
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1163  }
963ddc63e20d5ee drivers/media/video/tvp5150.c Javier Martin         2012-01=
-31  1164  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0651696833072498793==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AQA=
--===============0651696833072498793==--

