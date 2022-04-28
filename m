Content-Type: multipart/mixed; boundary="===============5213594324334634980=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:258 fimc_m2m_g_fmt_mplane() warn: passing a valid pointer to 'PTR_ERR'
Date: Fri, 29 Apr 2022 02:27:58 +0800
Message-ID: <202204290245.R2pFTsdC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5213594324334634980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8f4dd16603ce834d1c5c4da67803ea82dd282511
commit: 238c84f71120f41c45301359902a912a19370f3d media: platform: rename ex=
ynos4-is/ to samsung/exynos4-is/
date:   6 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 weeks ago
config: microblaze-randconfig-m031-20220427 (https://download.01.org/0day-c=
i/archive/20220429/202204290245.R2pFTsdC-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:258 fimc_m2m_g_fmt_mpl=
ane() warn: passing a valid pointer to 'PTR_ERR'
drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:385 fimc_m2m_g_selecti=
on() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +258 drivers/media/platform/samsung/exynos4-is/fimc-m2m.c

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  250  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  251  static int fimc_m2m_g_fmt_mplane(struct file *file, vo=
id *fh,
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  252  				 struct v4l2_format *f)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  253  {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  254  	struct fimc_ctx *ctx =3D fh_to_ctx(fh);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  255  	struct fimc_frame *frame =3D ctx_get_frame(ctx, f->ty=
pe);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  256  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  257  	if (IS_ERR(frame))
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08 @258  		return PTR_ERR(frame);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  259  =

fa8880bece7321 drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-11  260  	__fimc_get_format(frame, f);
fa8880bece7321 drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-11  261  	return 0;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  262  }
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  263  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  264  static int fimc_try_fmt_mplane(struct fimc_ctx *ctx, s=
truct v4l2_format *f)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  265  {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  266  	struct fimc_dev *fimc =3D ctx->fimc_dev;
405f230c44d809 drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2012-08-02  267  	const struct fimc_variant *variant =3D fimc->variant;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  268  	struct v4l2_pix_format_mplane *pix =3D &f->fmt.pix_mp;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  269  	struct fimc_fmt *fmt;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  270  	u32 max_w, mod_x, mod_y;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  271  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  272  	if (!IS_M2M(f->type))
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  273  		return -EINVAL;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  274  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  275  	fmt =3D fimc_find_format(&pix->pixelformat, NULL,
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  276  			       get_m2m_fmt_flags(f->type), 0);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  277  	if (WARN(fmt =3D=3D NULL, "Pixel format lookup failed=
"))
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  278  		return -EINVAL;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  279  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  280  	if (pix->field =3D=3D V4L2_FIELD_ANY)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  281  		pix->field =3D V4L2_FIELD_NONE;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  282  	else if (pix->field !=3D V4L2_FIELD_NONE)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  283  		return -EINVAL;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  284  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  285  	if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)=
 {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  286  		max_w =3D variant->pix_limit->scaler_dis_w;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  287  		mod_x =3D ffs(variant->min_inp_pixsize) - 1;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  288  	} else {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  289  		max_w =3D variant->pix_limit->out_rot_dis_w;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  290  		mod_x =3D ffs(variant->min_out_pixsize) - 1;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  291  	}
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  292  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  293  	if (tiled_fmt(fmt)) {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  294  		mod_x =3D 6; /* 64 x 32 pixels tile */
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  295  		mod_y =3D 5;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  296  	} else {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  297  		if (variant->min_vsize_align =3D=3D 1)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  298  			mod_y =3D fimc_fmt_is_rgb(fmt->color) ? 0 : 1;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  299  		else
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  300  			mod_y =3D ffs(variant->min_vsize_align) - 1;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  301  	}
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  302  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  303  	v4l_bound_align_image(&pix->width, 16, max_w, mod_x,
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  304  		&pix->height, 8, variant->pix_limit->scaler_dis_w, m=
od_y, 0);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  305  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  306  	fimc_adjust_mplane_format(fmt, pix->width, pix->heigh=
t, &f->fmt.pix_mp);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  307  	return 0;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  308  }
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  309  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  310  static int fimc_m2m_try_fmt_mplane(struct file *file, =
void *fh,
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  311  				   struct v4l2_format *f)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  312  {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  313  	struct fimc_ctx *ctx =3D fh_to_ctx(fh);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  314  	return fimc_try_fmt_mplane(ctx, f);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  315  }
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  316  =

81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  317  static void __set_frame_format(struct fimc_frame *fram=
e, struct fimc_fmt *fmt,
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  318  			       struct v4l2_pix_format_mplane *pixm)
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  319  {
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  320  	int i;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  321  =

8411323f8e04fc drivers/media/platform/exynos4-is/fimc-m2m.c Nicolas Dufresn=
e   2014-03-25  322  	for (i =3D 0; i < fmt->memplanes; i++) {
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  323  		frame->bytesperline[i] =3D pixm->plane_fmt[i].bytesp=
erline;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  324  		frame->payload[i] =3D pixm->plane_fmt[i].sizeimage;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  325  	}
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  326  =

81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  327  	frame->f_width =3D pixm->width;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  328  	frame->f_height	=3D pixm->height;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  329  	frame->o_width =3D pixm->width;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  330  	frame->o_height =3D pixm->height;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  331  	frame->width =3D pixm->width;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  332  	frame->height =3D pixm->height;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  333  	frame->offs_h =3D 0;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  334  	frame->offs_v =3D 0;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  335  	frame->fmt =3D fmt;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  336  }
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  337  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  338  static int fimc_m2m_s_fmt_mplane(struct file *file, vo=
id *fh,
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  339  				 struct v4l2_format *f)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  340  {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  341  	struct fimc_ctx *ctx =3D fh_to_ctx(fh);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  342  	struct fimc_dev *fimc =3D ctx->fimc_dev;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  343  	struct fimc_fmt *fmt;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  344  	struct vb2_queue *vq;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  345  	struct fimc_frame *frame;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  346  	int ret;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  347  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  348  	ret =3D fimc_try_fmt_mplane(ctx, f);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  349  	if (ret)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  350  		return ret;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  351  =

43894d848a4007 drivers/media/platform/exynos4-is/fimc-m2m.c Sylwester Nawro=
cki 2013-08-25  352  	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  353  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  354  	if (vb2_is_busy(vq)) {
bbc5296f205707 drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2012-07-26  355  		v4l2_err(&fimc->m2m.vfd, "queue (%d) busy\n", f->typ=
e);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  356  		return -EBUSY;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  357  	}
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  358  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  359  	if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  360  		frame =3D &ctx->s_frame;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  361  	else
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  362  		frame =3D &ctx->d_frame;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  363  =

81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  364  	fmt =3D fimc_find_format(&f->fmt.pix_mp.pixelformat, =
NULL,
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  365  			       get_m2m_fmt_flags(f->type), 0);
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  366  	if (!fmt)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  367  		return -EINVAL;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  368  =

81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  369  	__set_frame_format(frame, fmt, &f->fmt.pix_mp);
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  370  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  371  	/* Update RGB Alpha control state and value range */
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  372  	fimc_alpha_ctrl_update(ctx);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  373  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  374  	return 0;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  375  }
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  376  =

158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  377  static int fimc_m2m_g_selection(struct file *file, voi=
d *fh,
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  378  				struct v4l2_selection *s)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  379  {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  380  	struct fimc_ctx *ctx =3D fh_to_ctx(fh);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  381  	struct fimc_frame *frame;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  382  =

158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  383  	frame =3D ctx_get_frame(ctx, s->type);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  384  	if (IS_ERR(frame))
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08 @385  		return PTR_ERR(frame);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  386  =

158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  387  	switch (s->target) {
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  388  	case V4L2_SEL_TGT_CROP:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  389  	case V4L2_SEL_TGT_CROP_DEFAULT:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  390  	case V4L2_SEL_TGT_CROP_BOUNDS:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  391  		if (s->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  392  			return -EINVAL;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  393  		break;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  394  	case V4L2_SEL_TGT_COMPOSE:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  395  	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  396  	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  397  		if (s->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  398  			return -EINVAL;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  399  		break;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  400  	default:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  401  		return -EINVAL;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  402  	}
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  403  =

158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  404  	switch (s->target) {
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  405  	case V4L2_SEL_TGT_CROP:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  406  	case V4L2_SEL_TGT_COMPOSE:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  407  		s->r.left =3D frame->offs_h;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  408  		s->r.top =3D frame->offs_v;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  409  		s->r.width =3D frame->width;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  410  		s->r.height =3D frame->height;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  411  		break;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  412  	case V4L2_SEL_TGT_CROP_DEFAULT:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  413  	case V4L2_SEL_TGT_CROP_BOUNDS:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  414  	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  415  	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  416  		s->r.left =3D 0;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  417  		s->r.top =3D 0;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  418  		s->r.width =3D frame->o_width;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  419  		s->r.height =3D frame->o_height;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  420  		break;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  421  	default:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  422  		return -EINVAL;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  423  	}
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  424  	return 0;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  425  }
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  426  =


:::::: The code at line 258 was first introduced by commit
:::::: 97d974226575227ebafdf3ab009f0212d8a7e223 [media] s5p-fimc: Move m2m =
node driver into separate file

:::::: TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5213594324334634980==--

