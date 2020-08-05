Content-Type: multipart/mixed; boundary="===============4753000742577571133=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/test-drivers/vivid/vivid-vid-cap.c:979:22: warning: Local variable max_rect shadows outer variable
Date: Wed, 05 Aug 2020 23:24:21 +0800
Message-ID: <202008052318.INfBlPyL%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4753000742577571133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hans Verkuil <hverkuil@xs4all.nl>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2324d50d051ec0f14a548e78554fb02513d6dcef
commit: dacca5f0fa69f04c2e70aad9847e8250b459971c media: media/test_drivers:=
 rename to test-drivers
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/media/test-drivers/vivid/vivid-vid-cap.c:979:22: warning: Local =
variable max_rect shadows outer variable [shadowVar]
       struct v4l2_rect max_rect =3D {
                        ^
   drivers/media/test-drivers/vivid/vivid-vid-cap.c:966:21: note: Shadowed =
declaration
      struct v4l2_rect max_rect =3D {
                       ^
   drivers/media/test-drivers/vivid/vivid-vid-cap.c:979:22: note: Shadow va=
riable
       struct v4l2_rect max_rect =3D {
                        ^
--
>> drivers/media/test-drivers/vivid/vivid-vid-out.c:960:9: warning: Identic=
al condition 'ret', second condition is always false [identicalConditionAft=
erEarlyExit]
    return ret;
           ^
   drivers/media/test-drivers/vivid/vivid-vid-out.c:937:6: note: first cond=
ition
    if (ret)
        ^
   drivers/media/test-drivers/vivid/vivid-vid-out.c:960:9: note: second con=
dition
    return ret;
           ^
>> drivers/media/test-drivers/vivid/vivid-vid-out.c:1028:22: warning: Varia=
ble 'dev->fbuf_out_flags' is reassigned a value before the old one has been=
 used. [redundantAssignment]
    dev->fbuf_out_flags =3D a->flags & (chroma_flags | alpha_flags);
                        ^
   drivers/media/test-drivers/vivid/vivid-vid-out.c:1027:22: note: Variable=
 'dev->fbuf_out_flags' is reassigned a value before the old one has been us=
ed.
    dev->fbuf_out_flags &=3D ~(chroma_flags | alpha_flags);
                        ^
   drivers/media/test-drivers/vivid/vivid-vid-out.c:1028:22: note: Variable=
 'dev->fbuf_out_flags' is reassigned a value before the old one has been us=
ed.
    dev->fbuf_out_flags =3D a->flags & (chroma_flags | alpha_flags);
                        ^
>> drivers/media/test-drivers/vivid/vivid-vid-out.c:715:22: warning: Local =
variable max_rect shadows outer variable [shadowVar]
       struct v4l2_rect max_rect =3D {
                        ^
   drivers/media/test-drivers/vivid/vivid-vid-out.c:702:21: note: Shadowed =
declaration
      struct v4l2_rect max_rect =3D {
                       ^
   drivers/media/test-drivers/vivid/vivid-vid-out.c:715:22: note: Shadow va=
riable
       struct v4l2_rect max_rect =3D {
                        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Ddacca5f0fa69f04c2e70aad9847e8250b459971c
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout dacca5f0fa69f04c2e70aad9847e8250b459971c
vim +979 drivers/media/test-drivers/vivid/vivid-vid-cap.c

ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   880  =

ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   881  int vivid_vid_cap_s_selection(struct file *file, vo=
id *fh, struct v4l2_selection *s)
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   882  {
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   883  	struct vivid_dev *dev =3D video_drvdata(file);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   884  	struct v4l2_rect *crop =3D &dev->crop_cap;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   885  	struct v4l2_rect *compose =3D &dev->compose_cap;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   886  	unsigned factor =3D V4L2_FIELD_HAS_T_OR_B(dev->fie=
ld_cap) ? 2 : 1;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   887  	int ret;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   888  =

ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   889  	if (!dev->has_crop_cap && !dev->has_compose_cap)
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   890  		return -ENOTTY;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   891  	if (s->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   892  		return -EINVAL;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   893  	if (vivid_is_webcam(dev))
0d0abef8d457c96 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-07-20   894  		return -ENODATA;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   895  =

ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   896  	switch (s->target) {
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   897  	case V4L2_SEL_TGT_CROP:
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   898  		if (!dev->has_crop_cap)
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   899  			return -EINVAL;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   900  		ret =3D vivid_vid_adjust_sel(s->flags, &s->r);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   901  		if (ret)
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   902  			return ret;
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   903  		v4l2_rect_set_min_size(&s->r, &vivid_min_rect);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   904  		v4l2_rect_set_max_size(&s->r, &dev->src_rect);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   905  		v4l2_rect_map_inside(&s->r, &dev->crop_bounds_cap=
);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   906  		s->r.top /=3D factor;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   907  		s->r.height /=3D factor;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   908  		if (dev->has_scaler_cap) {
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   909  			struct v4l2_rect fmt =3D dev->fmt_cap_rect;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   910  			struct v4l2_rect max_rect =3D {
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   911  				0, 0,
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   912  				s->r.width * MAX_ZOOM,
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   913  				s->r.height * MAX_ZOOM
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   914  			};
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   915  			struct v4l2_rect min_rect =3D {
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   916  				0, 0,
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   917  				s->r.width / MAX_ZOOM,
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   918  				s->r.height / MAX_ZOOM
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   919  			};
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   920  =

d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   921  			v4l2_rect_set_min_size(&fmt, &min_rect);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   922  			if (!dev->has_compose_cap)
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   923  				v4l2_rect_set_max_size(&fmt, &max_rect);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   924  			if (!v4l2_rect_same_size(&dev->fmt_cap_rect, &fm=
t) &&
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   925  			    vb2_is_busy(&dev->vb_vid_cap_q))
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   926  				return -EBUSY;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   927  			if (dev->has_compose_cap) {
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   928  				v4l2_rect_set_min_size(compose, &min_rect);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   929  				v4l2_rect_set_max_size(compose, &max_rect);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   930  			}
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   931  			dev->fmt_cap_rect =3D fmt;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   932  			tpg_s_buf_height(&dev->tpg, fmt.height);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   933  		} else if (dev->has_compose_cap) {
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   934  			struct v4l2_rect fmt =3D dev->fmt_cap_rect;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   935  =

d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   936  			v4l2_rect_set_min_size(&fmt, &s->r);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   937  			if (!v4l2_rect_same_size(&dev->fmt_cap_rect, &fm=
t) &&
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   938  			    vb2_is_busy(&dev->vb_vid_cap_q))
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   939  				return -EBUSY;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   940  			dev->fmt_cap_rect =3D fmt;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   941  			tpg_s_buf_height(&dev->tpg, fmt.height);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   942  			v4l2_rect_set_size_to(compose, &s->r);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   943  			v4l2_rect_map_inside(compose, &dev->fmt_cap_rect=
);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   944  		} else {
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   945  			if (!v4l2_rect_same_size(&s->r, &dev->fmt_cap_re=
ct) &&
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   946  			    vb2_is_busy(&dev->vb_vid_cap_q))
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   947  				return -EBUSY;
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   948  			v4l2_rect_set_size_to(&dev->fmt_cap_rect, &s->r);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   949  			v4l2_rect_set_size_to(compose, &s->r);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   950  			v4l2_rect_map_inside(compose, &dev->fmt_cap_rect=
);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   951  			tpg_s_buf_height(&dev->tpg, dev->fmt_cap_rect.he=
ight);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   952  		}
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   953  		s->r.top *=3D factor;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   954  		s->r.height *=3D factor;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   955  		*crop =3D s->r;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   956  		break;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   957  	case V4L2_SEL_TGT_COMPOSE:
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   958  		if (!dev->has_compose_cap)
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   959  			return -EINVAL;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   960  		ret =3D vivid_vid_adjust_sel(s->flags, &s->r);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   961  		if (ret)
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   962  			return ret;
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   963  		v4l2_rect_set_min_size(&s->r, &vivid_min_rect);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   964  		v4l2_rect_set_max_size(&s->r, &dev->fmt_cap_rect);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   965  		if (dev->has_scaler_cap) {
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   966  			struct v4l2_rect max_rect =3D {
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   967  				0, 0,
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   968  				dev->src_rect.width * MAX_ZOOM,
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   969  				(dev->src_rect.height / factor) * MAX_ZOOM
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   970  			};
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   971  =

d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   972  			v4l2_rect_set_max_size(&s->r, &max_rect);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   973  			if (dev->has_crop_cap) {
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   974  				struct v4l2_rect min_rect =3D {
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   975  					0, 0,
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   976  					s->r.width / MAX_ZOOM,
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   977  					(s->r.height * factor) / MAX_ZOOM
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   978  				};
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  @979  				struct v4l2_rect max_rect =3D {
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   980  					0, 0,
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   981  					s->r.width * MAX_ZOOM,
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   982  					(s->r.height * factor) * MAX_ZOOM
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   983  				};
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   984  =

d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   985  				v4l2_rect_set_min_size(crop, &min_rect);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   986  				v4l2_rect_set_max_size(crop, &max_rect);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   987  				v4l2_rect_map_inside(crop, &dev->crop_bounds_ca=
p);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   988  			}
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   989  		} else if (dev->has_crop_cap) {
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   990  			s->r.top *=3D factor;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   991  			s->r.height *=3D factor;
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   992  			v4l2_rect_set_max_size(&s->r, &dev->src_rect);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   993  			v4l2_rect_set_size_to(crop, &s->r);
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   994  			v4l2_rect_map_inside(crop, &dev->crop_bounds_cap=
);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   995  			s->r.top /=3D factor;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   996  			s->r.height /=3D factor;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   997  		} else {
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03   998  			v4l2_rect_set_size_to(&s->r, &dev->src_rect);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25   999  			s->r.height /=3D factor;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1000  		}
d1e5d8bd49d9a83 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2016-04-03  1001  		v4l2_rect_map_inside(&s->r, &dev->fmt_cap_rect);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1002  		if (dev->bitmap_cap && (compose->width !=3D s->r.=
width ||
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1003  					compose->height !=3D s->r.height)) {
dad7e270ba712ba drivers/media/platform/vivid/vivid-vid-cap.c Alexander Pota=
penko 2019-04-04  1004  			vfree(dev->bitmap_cap);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1005  			dev->bitmap_cap =3D NULL;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1006  		}
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1007  		*compose =3D s->r;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1008  		break;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1009  	default:
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1010  		return -EINVAL;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1011  	}
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1012  =

ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1013  	tpg_s_crop_compose(&dev->tpg, crop, compose);
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1014  	return 0;
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1015  }
ef834f7836ec050 drivers/media/platform/vivid/vivid-vid-cap.c Hans Verkuil  =
      2014-08-25  1016  =


:::::: The code at line 979 was first introduced by commit
:::::: ef834f7836ec0502f49f20bbc42f1240577a9c83 [media] vivid: add the vide=
o capture and output parts

:::::: TO: Hans Verkuil <hans.verkuil@cisco.com>
:::::: CC: Mauro Carvalho Chehab <m.chehab@samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4753000742577571133==--

