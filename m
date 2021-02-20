Content-Type: multipart/mixed; boundary="===============6861483443846345823=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/tvp5150.c:1114 tvp5150_set_selection() warn: passing a valid pointer to 'PTR_ERR'
Date: Sat, 20 Feb 2021 09:41:08 +0800
Message-ID: <202102200902.wFvxNv80-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6861483443846345823==
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
head:   f40ddce88593482919761f74910f42f4b84c004b
commit: 46fe6e7dcededcf4aba88163fee80f4f7df23deb media: tvp5150: add FORMAT=
_TRY support for get/set selection handlers
date:   11 months ago
:::::: branch date: 5 days ago
:::::: commit date: 11 months ago
config: mips-randconfig-m031-20210219 (attached as .config)
compiler: mipsel-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/media/i2c/tvp5150.c:1114 tvp5150_set_selection() warn: passing a va=
lid pointer to 'PTR_ERR'
drivers/media/i2c/tvp5150.c:1157 tvp5150_get_selection() warn: passing a va=
lid pointer to 'PTR_ERR'

Old smatch warnings:
drivers/media/i2c/tvp5150.c:1951 tvp5150_parse_dt() warn: missing error cod=
e 'ret'

vim +/PTR_ERR +1114 drivers/media/i2c/tvp5150.c

46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1076  =

10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1077  static int tvp5150_set_selection(struct v4l2_subdev *sd,
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1078  				 struct v4l2_subdev_pad_config *cfg,
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1079  				 struct v4l2_subdev_selection *sel)
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1080  {
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1081  	struct tvp5150 *decoder =3D to_tvp5150(sd);
b4125e5b1bd70d drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1082  	struct v4l2_rect *rect =3D &sel->r;
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1083  	struct v4l2_rect *crop;
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1084  	unsigned int hmax;
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1085  =

46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1086  	if (sel->target !=3D V4L2_SEL_TGT_CROP)
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1087  		return -EINVAL;
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1088  =

257e29f84e377d drivers/media/i2c/tvp5150.c   Mauro Carvalho Chehab 2016-11-=
16  1089  	dev_dbg_lvl(sd->dev, 1, debug, "%s left=3D%d, top=3D%d, width=3D=
%d, height=3D%d\n",
b4125e5b1bd70d drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1090  		__func__, rect->left, rect->top, rect->width, rect->height);
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1091  =

963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1092  	/* tvp5150 has some special limits */
b4125e5b1bd70d drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1093  	rect->left =3D clamp(rect->left, 0, TVP5150_MAX_CROP_LEFT);
b4125e5b1bd70d drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1094  	rect->top =3D clamp(rect->top, 0, TVP5150_MAX_CROP_TOP);
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1095  	hmax =3D tvp5150_get_hmax(sd);
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1096  =

bd24db04101f45 drivers/media/i2c/tvp5150.c   Marco Felsch          2018-06-=
28  1097  	/*
bd24db04101f45 drivers/media/i2c/tvp5150.c   Marco Felsch          2018-06-=
28  1098  	 * alignments:
bd24db04101f45 drivers/media/i2c/tvp5150.c   Marco Felsch          2018-06-=
28  1099  	 *  - width =3D 2 due to UYVY colorspace
bd24db04101f45 drivers/media/i2c/tvp5150.c   Marco Felsch          2018-06-=
28  1100  	 *  - height, image =3D no special alignment
bd24db04101f45 drivers/media/i2c/tvp5150.c   Marco Felsch          2018-06-=
28  1101  	 */
b4125e5b1bd70d drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1102  	v4l_bound_align_image(&rect->width,
b4125e5b1bd70d drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1103  			      TVP5150_H_MAX - TVP5150_MAX_CROP_LEFT - rect->left,
b4125e5b1bd70d drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1104  			      TVP5150_H_MAX - rect->left, 1, &rect->height,
b4125e5b1bd70d drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1105  			      hmax - TVP5150_MAX_CROP_TOP - rect->top,
b4125e5b1bd70d drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1106  			      hmax - rect->top, 0, 0);
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1107  =

46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1108  	if (!IS_ENABLED(CONFIG_VIDEO_V4L2_SUBDEV_API) &&
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1109  	    sel->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1110  		return 0;
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1111  =

46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1112  	crop =3D tvp5150_get_pad_crop(decoder, cfg, sel->pad, sel->which=
);
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1113  	if (IS_ERR(crop))
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12 @1114  		return PTR_ERR(crop);
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1115  =

46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1116  	/*
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1117  	 * Update output image size if the selection (crop) rectangle si=
ze or
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1118  	 * position has been modified.
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1119  	 */
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1120  	if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1121  	    !v4l2_rect_equal(rect, crop))
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1122  		tvp5150_set_hw_selection(sd, rect);
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1123  =

46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1124  	*crop =3D *rect;
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1125  =

963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1126  	return 0;
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1127  }
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1128  =

10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1129  static int tvp5150_get_selection(struct v4l2_subdev *sd,
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1130  				 struct v4l2_subdev_pad_config *cfg,
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1131  				 struct v4l2_subdev_selection *sel)
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1132  {
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1133  	struct tvp5150 *decoder =3D container_of(sd, struct tvp5150, sd);
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1134  	struct v4l2_rect *crop;
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1135  	v4l2_std_id std;
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1136  =

10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1137  	switch (sel->target) {
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1138  	case V4L2_SEL_TGT_CROP_BOUNDS:
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1139  		sel->r.left =3D 0;
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1140  		sel->r.top =3D 0;
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1141  		sel->r.width =3D TVP5150_H_MAX;
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1142  =

963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1143  		/* Calculate height based on current standard */
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1144  		if (decoder->norm =3D=3D V4L2_STD_ALL)
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1145  			std =3D tvp5150_read_std(sd);
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1146  		else
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1147  			std =3D decoder->norm;
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1148  		if (std & V4L2_STD_525_60)
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1149  			sel->r.height =3D TVP5150_V_MAX_525_60;
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1150  		else
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1151  			sel->r.height =3D TVP5150_V_MAX_OTHERS;
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1152  		return 0;
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1153  	case V4L2_SEL_TGT_CROP:
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1154  		crop =3D tvp5150_get_pad_crop(decoder, cfg, sel->pad,
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1155  					    sel->which);
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1156  		if (IS_ERR(crop))
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12 @1157  			return PTR_ERR(crop);
46fe6e7dcededc drivers/media/i2c/tvp5150.c   Marco Felsch          2020-03-=
12  1158  		sel->r =3D *crop;
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1159  		return 0;
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1160  	default:
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1161  		return -EINVAL;
10d5509c8d50a2 drivers/media/i2c/tvp5150.c   Hans Verkuil          2015-12-=
14  1162  	}
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1163  }
963ddc63e20d5e drivers/media/video/tvp5150.c Javier Martin         2012-01-=
31  1164  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6861483443846345823==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
UmwL/A+ajO688ZIBAA==
--===============6861483443846345823==--

