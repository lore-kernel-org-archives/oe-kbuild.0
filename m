Content-Type: multipart/mixed; boundary="===============6425310682241239162=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/exynos4-is/fimc-m2m.c:261 fimc_m2m_g_fmt_mplane() warn: passing a valid pointer to 'PTR_ERR'
Date: Mon, 21 Feb 2022 20:47:03 +0800
Message-ID: <202202212016.GIvnU1Pb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6425310682241239162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cfb92440ee71adcc2105b0890bb01ac3cddb8507
commit: b408b611eb951594691abfee8ca687b405d27757 mips: ar7: convert to CONF=
IG_COMMON_CLK
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-m031-20220221 (https://download.01.org/0day-ci/arch=
ive/20220221/202202212016.GIvnU1Pb-lkp(a)intel.com/config)
compiler: mipsel-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/platform/exynos4-is/fimc-m2m.c:261 fimc_m2m_g_fmt_mplane() wa=
rn: passing a valid pointer to 'PTR_ERR'
drivers/media/platform/exynos4-is/fimc-m2m.c:388 fimc_m2m_g_selection() war=
n: passing a valid pointer to 'PTR_ERR'
drivers/media/platform/omap3isp/isphist.c:526 omap3isp_hist_init() warn: po=
ssible memory leak of 'hist_cfg'

vim +/PTR_ERR +261 drivers/media/platform/exynos4-is/fimc-m2m.c

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  253  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  254  static int fimc_m2m_g_fmt_mplane(struct file *file, vo=
id *fh,
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  255  				 struct v4l2_format *f)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  256  {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  257  	struct fimc_ctx *ctx =3D fh_to_ctx(fh);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  258  	struct fimc_frame *frame =3D ctx_get_frame(ctx, f->ty=
pe);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  259  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  260  	if (IS_ERR(frame))
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08 @261  		return PTR_ERR(frame);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  262  =

fa8880bece7321 drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-11  263  	__fimc_get_format(frame, f);
fa8880bece7321 drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-11  264  	return 0;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  265  }
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  266  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  267  static int fimc_try_fmt_mplane(struct fimc_ctx *ctx, s=
truct v4l2_format *f)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  268  {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  269  	struct fimc_dev *fimc =3D ctx->fimc_dev;
405f230c44d809 drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2012-08-02  270  	const struct fimc_variant *variant =3D fimc->variant;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  271  	struct v4l2_pix_format_mplane *pix =3D &f->fmt.pix_mp;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  272  	struct fimc_fmt *fmt;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  273  	u32 max_w, mod_x, mod_y;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  274  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  275  	if (!IS_M2M(f->type))
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  276  		return -EINVAL;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  277  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  278  	fmt =3D fimc_find_format(&pix->pixelformat, NULL,
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  279  			       get_m2m_fmt_flags(f->type), 0);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  280  	if (WARN(fmt =3D=3D NULL, "Pixel format lookup failed=
"))
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  281  		return -EINVAL;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  282  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  283  	if (pix->field =3D=3D V4L2_FIELD_ANY)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  284  		pix->field =3D V4L2_FIELD_NONE;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  285  	else if (pix->field !=3D V4L2_FIELD_NONE)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  286  		return -EINVAL;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  287  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  288  	if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)=
 {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  289  		max_w =3D variant->pix_limit->scaler_dis_w;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  290  		mod_x =3D ffs(variant->min_inp_pixsize) - 1;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  291  	} else {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  292  		max_w =3D variant->pix_limit->out_rot_dis_w;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  293  		mod_x =3D ffs(variant->min_out_pixsize) - 1;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  294  	}
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  295  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  296  	if (tiled_fmt(fmt)) {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  297  		mod_x =3D 6; /* 64 x 32 pixels tile */
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  298  		mod_y =3D 5;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  299  	} else {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  300  		if (variant->min_vsize_align =3D=3D 1)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  301  			mod_y =3D fimc_fmt_is_rgb(fmt->color) ? 0 : 1;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  302  		else
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  303  			mod_y =3D ffs(variant->min_vsize_align) - 1;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  304  	}
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  305  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  306  	v4l_bound_align_image(&pix->width, 16, max_w, mod_x,
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  307  		&pix->height, 8, variant->pix_limit->scaler_dis_w, m=
od_y, 0);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  308  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  309  	fimc_adjust_mplane_format(fmt, pix->width, pix->heigh=
t, &f->fmt.pix_mp);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  310  	return 0;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  311  }
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  312  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  313  static int fimc_m2m_try_fmt_mplane(struct file *file, =
void *fh,
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  314  				   struct v4l2_format *f)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  315  {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  316  	struct fimc_ctx *ctx =3D fh_to_ctx(fh);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  317  	return fimc_try_fmt_mplane(ctx, f);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  318  }
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  319  =

81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  320  static void __set_frame_format(struct fimc_frame *fram=
e, struct fimc_fmt *fmt,
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  321  			       struct v4l2_pix_format_mplane *pixm)
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  322  {
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  323  	int i;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  324  =

8411323f8e04fc drivers/media/platform/exynos4-is/fimc-m2m.c Nicolas Dufresn=
e   2014-03-25  325  	for (i =3D 0; i < fmt->memplanes; i++) {
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  326  		frame->bytesperline[i] =3D pixm->plane_fmt[i].bytesp=
erline;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  327  		frame->payload[i] =3D pixm->plane_fmt[i].sizeimage;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  328  	}
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  329  =

81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  330  	frame->f_width =3D pixm->width;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  331  	frame->f_height	=3D pixm->height;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  332  	frame->o_width =3D pixm->width;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  333  	frame->o_height =3D pixm->height;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  334  	frame->width =3D pixm->width;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  335  	frame->height =3D pixm->height;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  336  	frame->offs_h =3D 0;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  337  	frame->offs_v =3D 0;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  338  	frame->fmt =3D fmt;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  339  }
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  340  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  341  static int fimc_m2m_s_fmt_mplane(struct file *file, vo=
id *fh,
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  342  				 struct v4l2_format *f)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  343  {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  344  	struct fimc_ctx *ctx =3D fh_to_ctx(fh);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  345  	struct fimc_dev *fimc =3D ctx->fimc_dev;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  346  	struct fimc_fmt *fmt;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  347  	struct vb2_queue *vq;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  348  	struct fimc_frame *frame;
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  349  	int ret;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  350  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  351  	ret =3D fimc_try_fmt_mplane(ctx, f);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  352  	if (ret)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  353  		return ret;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  354  =

43894d848a4007 drivers/media/platform/exynos4-is/fimc-m2m.c Sylwester Nawro=
cki 2013-08-25  355  	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  356  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  357  	if (vb2_is_busy(vq)) {
bbc5296f205707 drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2012-07-26  358  		v4l2_err(&fimc->m2m.vfd, "queue (%d) busy\n", f->typ=
e);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  359  		return -EBUSY;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  360  	}
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  361  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  362  	if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  363  		frame =3D &ctx->s_frame;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  364  	else
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  365  		frame =3D &ctx->d_frame;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  366  =

81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  367  	fmt =3D fimc_find_format(&f->fmt.pix_mp.pixelformat, =
NULL,
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  368  			       get_m2m_fmt_flags(f->type), 0);
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  369  	if (!fmt)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  370  		return -EINVAL;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  371  =

81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  372  	__set_frame_format(frame, fmt, &f->fmt.pix_mp);
81619ce1931a1d drivers/media/platform/s5p-fimc/fimc-m2m.c   Sylwester Nawro=
cki 2013-01-30  373  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  374  	/* Update RGB Alpha control state and value range */
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  375  	fimc_alpha_ctrl_update(ctx);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  376  =

97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  377  	return 0;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  378  }
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  379  =

158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  380  static int fimc_m2m_g_selection(struct file *file, voi=
d *fh,
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  381  				struct v4l2_selection *s)
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  382  {
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  383  	struct fimc_ctx *ctx =3D fh_to_ctx(fh);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  384  	struct fimc_frame *frame;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  385  =

158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  386  	frame =3D ctx_get_frame(ctx, s->type);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  387  	if (IS_ERR(frame))
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08 @388  		return PTR_ERR(frame);
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  389  =

158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  390  	switch (s->target) {
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  391  	case V4L2_SEL_TGT_CROP:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  392  	case V4L2_SEL_TGT_CROP_DEFAULT:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  393  	case V4L2_SEL_TGT_CROP_BOUNDS:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  394  		if (s->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  395  			return -EINVAL;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  396  		break;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  397  	case V4L2_SEL_TGT_COMPOSE:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  398  	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  399  	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  400  		if (s->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  401  			return -EINVAL;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  402  		break;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  403  	default:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  404  		return -EINVAL;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  405  	}
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  406  =

158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  407  	switch (s->target) {
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  408  	case V4L2_SEL_TGT_CROP:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  409  	case V4L2_SEL_TGT_COMPOSE:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  410  		s->r.left =3D frame->offs_h;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  411  		s->r.top =3D frame->offs_v;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  412  		s->r.width =3D frame->width;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  413  		s->r.height =3D frame->height;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  414  		break;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  415  	case V4L2_SEL_TGT_CROP_DEFAULT:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  416  	case V4L2_SEL_TGT_CROP_BOUNDS:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  417  	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  418  	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  419  		s->r.left =3D 0;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  420  		s->r.top =3D 0;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  421  		s->r.width =3D frame->o_width;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  422  		s->r.height =3D frame->o_height;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  423  		break;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  424  	default:
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  425  		return -EINVAL;
158efdeebc4871 drivers/media/platform/exynos4-is/fimc-m2m.c Hans Verkuil   =
    2018-10-04  426  	}
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  427  	return 0;
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  428  }
97d97422657522 drivers/media/video/s5p-fimc/fimc-m2m.c      Sylwester Nawro=
cki 2012-05-08  429  =


:::::: The code at line 261 was first introduced by commit
:::::: 97d974226575227ebafdf3ab009f0212d8a7e223 [media] s5p-fimc: Move m2m =
node driver into separate file

:::::: TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6425310682241239162==--

