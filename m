Content-Type: multipart/mixed; boundary="===============4319138207793911710=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 3/3] media: imx378: Add imx378 camera sensor driver
Date: Wed, 15 Apr 2020 15:26:45 +0800
Message-ID: <202004151548.A7CrfgXd%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4319138207793911710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200414200151.80089-4-daniel@qtec.com>
References: <20200414200151.80089-4-daniel@qtec.com>
TO: Daniel Gomez <daniel@qtec.com>

Hi Daniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v5.7-rc1 next-20200414]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Daniel-Gomez/v4l2-api-chan=
ges-for-imx378-driver/20200415-053427
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/media/i2c/imx378.c:978:2-8: preceding lock on line 975

# https://github.com/0day-ci/linux/commit/f64d4e1406bfb5507f25b050f49c07d89=
711772d
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout f64d4e1406bfb5507f25b050f49c07d89711772d
vim +978 drivers/media/i2c/imx378.c

f64d4e1406bfb5 Daniel Gomez 2020-04-14   965  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14   966  static int imx378_set_fmt(str=
uct v4l2_subdev *sd,
f64d4e1406bfb5 Daniel Gomez 2020-04-14   967  			  struct v4l2_subdev_pad_c=
onfig *cfg,
f64d4e1406bfb5 Daniel Gomez 2020-04-14   968  			  struct v4l2_subdev_forma=
t *fmt)
f64d4e1406bfb5 Daniel Gomez 2020-04-14   969  {
f64d4e1406bfb5 Daniel Gomez 2020-04-14   970  	struct imx378 *imx378 =3D to=
_imx378(sd);
f64d4e1406bfb5 Daniel Gomez 2020-04-14   971  	struct v4l2_mbus_framefmt *_=
_fmt;
f64d4e1406bfb5 Daniel Gomez 2020-04-14   972  	struct v4l2_rect *__crop;
f64d4e1406bfb5 Daniel Gomez 2020-04-14   973  	struct v4l2_subdev_frame_int=
erval fival =3D { };
f64d4e1406bfb5 Daniel Gomez 2020-04-14   974  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14  @975  	mutex_lock(&imx378->mutex);
f64d4e1406bfb5 Daniel Gomez 2020-04-14   976  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14   977  	if (imx378->streaming && fmt=
->which !=3D V4L2_SUBDEV_FORMAT_TRY)
f64d4e1406bfb5 Daniel Gomez 2020-04-14  @978  		return -EBUSY;
f64d4e1406bfb5 Daniel Gomez 2020-04-14   979  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14   980  	__crop =3D __imx378_get_pad_=
crop(imx378, cfg, fmt->pad, fmt->which);
f64d4e1406bfb5 Daniel Gomez 2020-04-14   981  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14   982  	v4l_bound_align_image(&fmt->=
format.width, IMX378_MIN_WIDTH,
f64d4e1406bfb5 Daniel Gomez 2020-04-14   983  			      IMX378_MAX_BOUNDS_WI=
DTH, ilog2(4),
f64d4e1406bfb5 Daniel Gomez 2020-04-14   984  			      &fmt->format.height,=
 IMX378_MIN_HEIGHT,
f64d4e1406bfb5 Daniel Gomez 2020-04-14   985  			      IMX378_MAX_BOUNDS_HE=
IGHT, ilog2(8), 0);
f64d4e1406bfb5 Daniel Gomez 2020-04-14   986  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14   987  	__crop->width =3D fmt->forma=
t.width;
f64d4e1406bfb5 Daniel Gomez 2020-04-14   988  	__crop->height =3D fmt->form=
at.height;
f64d4e1406bfb5 Daniel Gomez 2020-04-14   989  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14   990  	v4l_bound_align_image(&__cro=
p->left, 0,
f64d4e1406bfb5 Daniel Gomez 2020-04-14   991  			      IMX378_MAX_BOUNDS_WI=
DTH - __crop->width, ilog2(4),
f64d4e1406bfb5 Daniel Gomez 2020-04-14   992  			      &__crop->top, 0,
f64d4e1406bfb5 Daniel Gomez 2020-04-14   993  			      IMX378_MAX_BOUNDS_HE=
IGHT - __crop->height,
f64d4e1406bfb5 Daniel Gomez 2020-04-14   994  			      ilog2(8), 0);
f64d4e1406bfb5 Daniel Gomez 2020-04-14   995  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14   996  	__fmt =3D __imx378_get_pad_f=
ormat(imx378, cfg, fmt->pad, fmt->which);
f64d4e1406bfb5 Daniel Gomez 2020-04-14   997  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14   998  	__fmt->width =3D __crop->wid=
th;
f64d4e1406bfb5 Daniel Gomez 2020-04-14   999  	__fmt->height =3D __crop->he=
ight;
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1000  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14  1001  	if (fmt->format.code && fmt-=
>which !=3D V4L2_SUBDEV_FORMAT_TRY)
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1002  		imx378_set_flip_mode(imx378=
, fmt->format.code);
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1003  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14  1004  	__fmt->code =3D imx378_get_f=
ormat_code(imx378);
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1005  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14  1006  	__fmt->field =3D V4L2_FIELD_=
NONE;
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1007  	__fmt->colorspace =3D V4L2_C=
OLORSPACE_SRGB;
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1008  	__fmt->ycbcr_enc =3D V4L2_MA=
P_YCBCR_ENC_DEFAULT(fmt->format.colorspace);
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1009  	__fmt->quantization =3D V4L2=
_MAP_QUANTIZATION_DEFAULT(true,
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1010  			      __fmt->colorspace, _=
_fmt->ycbcr_enc);
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1011  	__fmt->xfer_func =3D V4L2_MA=
P_XFER_FUNC_DEFAULT(__fmt->colorspace);
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1012  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14  1013  	fmt->format =3D *__fmt;
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1014  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14  1015  	/* Frame interval depends on=
 the format so, update it accordingly */
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1016  	if (fmt->which !=3D V4L2_SUB=
DEV_FORMAT_TRY) {
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1017  		fival.interval =3D imx378->=
fival;
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1018  		imx378_s_frame_interval(sd,=
 &fival);
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1019  	}
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1020  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14  1021  	mutex_unlock(&imx378->mutex);
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1022  =

f64d4e1406bfb5 Daniel Gomez 2020-04-14  1023  	return 0;
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1024  }
f64d4e1406bfb5 Daniel Gomez 2020-04-14  1025  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4319138207793911710==--

