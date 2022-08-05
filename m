Content-Type: multipart/mixed; boundary="===============4214508701865226439=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:725 bdisp_g_fmt() warn: passing a valid pointer to 'PTR_ERR'
Date: Sat, 06 Aug 2022 01:38:42 +0800
Message-ID: <202208060157.L10VqOrb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4214508701865226439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2a88c212e652e94f1e4b635910972ac57ba4e97
commit: e7b8153e2a4f0c9c8d1450aa7328d54ea64fe8b2 media: platform: place stm=
32/ and sti/ under st/ dir
date:   5 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 months ago
config: microblaze-randconfig-m031-20220805
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:725 bdisp_g_fmt() warn: pa=
ssing a valid pointer to 'PTR_ERR'
drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:852 bdisp_g_selection() wa=
rn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +725 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  716  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  717  static int bdisp_g_fmt(struct file *file, void *fh, str=
uct v4l2_format *f)
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  718  {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  719  	struct bdisp_ctx *ctx =3D fh_to_ctx(fh);
bf3881707b6f635 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Colin Ian Kin=
g  2017-10-29  720  	struct v4l2_pix_format *pix;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  721  	struct bdisp_frame *frame  =3D ctx_get_frame(ctx, f->t=
ype);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  722  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  723  	if (IS_ERR(frame)) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  724  		dev_err(ctx->bdisp_dev->dev, "Invalid frame (%p)\n", =
frame);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12 @725  		return PTR_ERR(frame);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  726  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  727  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  728  	pix =3D &f->fmt.pix;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  729  	pix->width =3D frame->width;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  730  	pix->height =3D frame->height;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  731  	pix->pixelformat =3D frame->fmt->pixelformat;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  732  	pix->field =3D frame->field;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  733  	pix->bytesperline =3D frame->bytesperline;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  734  	pix->sizeimage =3D frame->sizeimage;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  735  	pix->colorspace =3D (f->type =3D=3D V4L2_BUF_TYPE_VIDE=
O_OUTPUT) ?
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  736  				frame->colorspace : bdisp_dflt_fmt.colorspace;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  737  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  738  	return 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  739  }
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  740  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  741  static int bdisp_try_fmt(struct file *file, void *fh, s=
truct v4l2_format *f)
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  742  {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  743  	struct bdisp_ctx *ctx =3D fh_to_ctx(fh);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  744  	struct v4l2_pix_format *pix =3D &f->fmt.pix;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  745  	const struct bdisp_fmt *format;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  746  	u32 in_w, in_h;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  747  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  748  	format =3D bdisp_find_fmt(pix->pixelformat);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  749  	if (!format) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  750  		dev_dbg(ctx->bdisp_dev->dev, "Unknown format 0x%x\n",
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  751  			pix->pixelformat);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  752  		return -EINVAL;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  753  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  754  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  755  	/* YUV420P only supported for VIDEO_OUTPUT */
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  756  	if ((format->pixelformat =3D=3D V4L2_PIX_FMT_YUV420) &&
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  757  	    (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  758  		dev_dbg(ctx->bdisp_dev->dev, "No YU12 on capture\n");
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  759  		return -EINVAL;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  760  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  761  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  762  	/* Field (interlaced only supported on OUTPUT) */
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  763  	if ((f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  764  	    (pix->field !=3D V4L2_FIELD_INTERLACED))
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  765  		pix->field =3D V4L2_FIELD_NONE;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  766  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  767  	/* Adjust width & height */
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  768  	in_w =3D pix->width;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  769  	in_h =3D pix->height;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  770  	v4l_bound_align_image(&pix->width,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  771  			      BDISP_MIN_W, BDISP_MAX_W,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  772  			      ffs(format->w_align) - 1,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  773  			      &pix->height,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  774  			      BDISP_MIN_H, BDISP_MAX_H,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  775  			      ffs(format->h_align) - 1,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  776  			      0);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  777  	if ((pix->width !=3D in_w) || (pix->height !=3D in_h))
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  778  		dev_dbg(ctx->bdisp_dev->dev,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  779  			"%s size updated: %dx%d -> %dx%d\n", __func__,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  780  			in_w, in_h, pix->width, pix->height);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  781  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  782  	pix->bytesperline =3D (pix->width * format->bpp_plane0=
) / 8;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  783  	pix->sizeimage =3D (pix->width * pix->height * format-=
>bpp) / 8;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  784  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  785  	if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  786  		pix->colorspace =3D bdisp_dflt_fmt.colorspace;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  787  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  788  	return 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  789  }
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  790  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  791  static int bdisp_s_fmt(struct file *file, void *fh, str=
uct v4l2_format *f)
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  792  {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  793  	struct bdisp_ctx *ctx =3D fh_to_ctx(fh);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  794  	struct vb2_queue *vq;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  795  	struct bdisp_frame *frame;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  796  	struct v4l2_pix_format *pix;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  797  	int ret;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  798  	u32 state;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  799  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  800  	ret =3D bdisp_try_fmt(file, fh, f);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  801  	if (ret) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  802  		dev_err(ctx->bdisp_dev->dev, "Cannot set format\n");
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  803  		return ret;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  804  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  805  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  806  	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  807  	if (vb2_is_streaming(vq)) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  808  		dev_err(ctx->bdisp_dev->dev, "queue (%d) busy\n", f->=
type);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  809  		return -EBUSY;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  810  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  811  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  812  	frame =3D (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT) ?
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  813  			&ctx->src : &ctx->dst;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  814  	pix =3D &f->fmt.pix;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  815  	frame->fmt =3D bdisp_find_fmt(pix->pixelformat);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  816  	if (!frame->fmt) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  817  		dev_err(ctx->bdisp_dev->dev, "Unknown format 0x%x\n",
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  818  			pix->pixelformat);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  819  		return -EINVAL;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  820  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  821  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  822  	frame->width =3D pix->width;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  823  	frame->height =3D pix->height;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  824  	frame->bytesperline =3D pix->bytesperline;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  825  	frame->sizeimage =3D pix->sizeimage;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  826  	frame->field =3D pix->field;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  827  	if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  828  		frame->colorspace =3D pix->colorspace;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  829  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  830  	frame->crop.width =3D frame->width;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  831  	frame->crop.height =3D frame->height;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  832  	frame->crop.left =3D 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  833  	frame->crop.top =3D 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  834  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  835  	state =3D BDISP_PARAMS;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  836  	state |=3D (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE=
) ?
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  837  			BDISP_DST_FMT : BDISP_SRC_FMT;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  838  	bdisp_ctx_state_lock_set(state, ctx);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  839  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  840  	return 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  841  }
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  842  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  843  static int bdisp_g_selection(struct file *file, void *f=
h,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  844  			     struct v4l2_selection *s)
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  845  {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  846  	struct bdisp_frame *frame;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  847  	struct bdisp_ctx *ctx =3D fh_to_ctx(fh);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  848  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  849  	frame =3D ctx_get_frame(ctx, s->type);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  850  	if (IS_ERR(frame)) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  851  		dev_err(ctx->bdisp_dev->dev, "Invalid frame (%p)\n", =
frame);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12 @852  		return PTR_ERR(frame);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  853  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  854  =

3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  855  	switch (s->type) {
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  856  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  857  		switch (s->target) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  858  		case V4L2_SEL_TGT_CROP:
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  859  			/* cropped frame */
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  860  			s->r =3D frame->crop;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  861  			break;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  862  		case V4L2_SEL_TGT_CROP_DEFAULT:
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  863  		case V4L2_SEL_TGT_CROP_BOUNDS:
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  864  			/* complete frame */
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  865  			s->r.left =3D 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  866  			s->r.top =3D 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  867  			s->r.width =3D frame->width;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  868  			s->r.height =3D frame->height;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  869  			break;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  870  		default:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  871  			dev_err(ctx->bdisp_dev->dev, "Invalid target\n");
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  872  			return -EINVAL;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  873  		}
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  874  		break;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  875  =

3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  876  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  877  		switch (s->target) {
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  878  		case V4L2_SEL_TGT_COMPOSE:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  879  		case V4L2_SEL_TGT_COMPOSE_PADDED:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  880  			/* composed (cropped) frame */
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  881  			s->r =3D frame->crop;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  882  			break;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  883  		case V4L2_SEL_TGT_COMPOSE_DEFAULT:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  884  		case V4L2_SEL_TGT_COMPOSE_BOUNDS:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  885  			/* complete frame */
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  886  			s->r.left =3D 0;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  887  			s->r.top =3D 0;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  888  			s->r.width =3D frame->width;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  889  			s->r.height =3D frame->height;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  890  			break;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  891  		default:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  892  			dev_err(ctx->bdisp_dev->dev, "Invalid target\n");
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  893  			return -EINVAL;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  894  		}
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  895  		break;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  896  =

3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  897  	default:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-07-10  898  		dev_err(ctx->bdisp_dev->dev, "Invalid type\n");
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  899  		return -EINVAL;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  900  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  901  =

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  902  	return 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  903  }
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessen=
ne 2015-05-12  904  =


:::::: The code at line 725 was first introduced by commit
:::::: 28ffeebbb7bdc0dd7899286b63f3c359d43d0a1a [media] bdisp: 2D blitter d=
river using v4l2 mem2mem framework

:::::: TO: Fabien Dessenne <fabien.dessenne@st.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp

--===============4214508701865226439==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.ksh"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L21p
Y3JvYmxhemUgNS4xNy4wLXJjMSBLZXJuZWwgQ29uZmlndXJhdGlvbgojCkNPTkZJR19DQ19WRVJT
SU9OX1RFWFQ9Im1pY3JvYmxhemUtbGludXgtZ2NjIChHQ0MpIDEyLjEuMCIKQ09ORklHX0NDX0lT
X0dDQz15CkNPTkZJR19HQ0NfVkVSU0lPTj0xMjAxMDAKQ09ORklHX0NMQU5HX1ZFUlNJT049MApD
T05GSUdfQVNfSVNfR05VPXkKQ09ORklHX0FTX1ZFUlNJT049MjM4MDAKQ09ORklHX0xEX0lTX0JG
RD15CkNPTkZJR19MRF9WRVJTSU9OPTIzODAwCkNPTkZJR19MTERfVkVSU0lPTj0wCkNPTkZJR19D
Q19IQVNfQVNNX0dPVE89eQpDT05GSUdfQ0NfSEFTX0FTTV9JTkxJTkU9eQpDT05GSUdfQ0NfSEFT
X05PX1BST0ZJTEVfRk5fQVRUUj15CkNPTkZJR19DT05TVFJVQ1RPUlM9eQpDT05GSUdfSVJRX1dP
Uks9eQpDT05GSUdfQlVJTERUSU1FX1RBQkxFX1NPUlQ9eQoKIwojIEdlbmVyYWwgc2V0dXAKIwpD
T05GSUdfQlJPS0VOX09OX1NNUD15CkNPTkZJR19JTklUX0VOVl9BUkdfTElNSVQ9MzIKQ09ORklH
X0NPTVBJTEVfVEVTVD15CiMgQ09ORklHX1dFUlJPUiBpcyBub3Qgc2V0CkNPTkZJR19MT0NBTFZF
UlNJT049IiIKQ09ORklHX0JVSUxEX1NBTFQ9IiIKQ09ORklHX0RFRkFVTFRfSU5JVD0iIgpDT05G
SUdfREVGQVVMVF9IT1NUTkFNRT0iKG5vbmUpIgpDT05GSUdfQVJDSF9OT19TV0FQPXkKQ09ORklH
X1NZU1ZJUEM9eQojIENPTkZJR19XQVRDSF9RVUVVRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NST1NT
X01FTU9SWV9BVFRBQ0ggaXMgbm90IHNldApDT05GSUdfVVNFTElCPXkKCiMKIyBJUlEgc3Vic3lz
dGVtCiMKQ09ORklHX0dFTkVSSUNfSVJRX1BST0JFPXkKQ09ORklHX0dFTkVSSUNfSVJRX1NIT1c9
eQpDT05GSUdfR0VORVJJQ19JUlFfSU5KRUNUSU9OPXkKQ09ORklHX0dFTkVSSUNfSVJRX0NISVA9
eQpDT05GSUdfSVJRX0RPTUFJTj15CkNPTkZJR19JUlFfU0lNPXkKQ09ORklHX0lSUV9ET01BSU5f
SElFUkFSQ0hZPXkKQ09ORklHX1NQQVJTRV9JUlE9eQpDT05GSUdfR0VORVJJQ19JUlFfREVCVUdG
Uz15CiMgZW5kIG9mIElSUSBzdWJzeXN0ZW0KCkNPTkZJR19HRU5FUklDX0NMT0NLRVZFTlRTPXkK
Q09ORklHX1RJTUVfS1VOSVRfVEVTVD1tCgojCiMgVGltZXJzIHN1YnN5c3RlbQojCkNPTkZJR19U
SUNLX09ORVNIT1Q9eQpDT05GSUdfSFpfUEVSSU9ESUM9eQojIENPTkZJR19OT19IWl9JRExFIGlz
IG5vdCBzZXQKIyBDT05GSUdfTk9fSFogaXMgbm90IHNldApDT05GSUdfSElHSF9SRVNfVElNRVJT
PXkKIyBlbmQgb2YgVGltZXJzIHN1YnN5c3RlbQoKIwojIEJQRiBzdWJzeXN0ZW0KIwojIENPTkZJ
R19CUEZfU1lTQ0FMTCBpcyBub3Qgc2V0CiMgZW5kIG9mIEJQRiBzdWJzeXN0ZW0KCkNPTkZJR19Q
UkVFTVBUX05PTkVfQlVJTEQ9eQpDT05GSUdfUFJFRU1QVF9OT05FPXkKIyBDT05GSUdfUFJFRU1Q
VF9WT0xVTlRBUlkgaXMgbm90IHNldAojIENPTkZJR19QUkVFTVBUIGlzIG5vdCBzZXQKQ09ORklH
X1BSRUVNUFRfQ09VTlQ9eQoKIwojIENQVS9UYXNrIHRpbWUgYW5kIHN0YXRzIGFjY291bnRpbmcK
IwpDT05GSUdfVElDS19DUFVfQUNDT1VOVElORz15CiMgQ09ORklHX1BTSSBpcyBub3Qgc2V0CiMg
ZW5kIG9mIENQVS9UYXNrIHRpbWUgYW5kIHN0YXRzIGFjY291bnRpbmcKCiMgQ09ORklHX0NQVV9J
U09MQVRJT04gaXMgbm90IHNldAoKIwojIFJDVSBTdWJzeXN0ZW0KIwpDT05GSUdfVElOWV9SQ1U9
eQojIENPTkZJR19SQ1VfRVhQRVJUIGlzIG5vdCBzZXQKQ09ORklHX1NSQ1U9eQpDT05GSUdfVElO
WV9TUkNVPXkKQ09ORklHX1RBU0tTX1JDVV9HRU5FUklDPXkKQ09ORklHX1RBU0tTX1JDVT15CkNP
TkZJR19UQVNLU19SVURFX1JDVT15CkNPTkZJR19UQVNLU19UUkFDRV9SQ1U9eQpDT05GSUdfUkNV
X05FRURfU0VHQ0JMSVNUPXkKIyBlbmQgb2YgUkNVIFN1YnN5c3RlbQoKQ09ORklHX0lLQ09ORklH
PW0KQ09ORklHX0lLSEVBREVSUz1tCkNPTkZJR19MT0dfQlVGX1NISUZUPTE3CkNPTkZJR19QUklO
VEtfU0FGRV9MT0dfQlVGX1NISUZUPTEzCkNPTkZJR19QUklOVEtfSU5ERVg9eQpDT05GSUdfR0VO
RVJJQ19TQ0hFRF9DTE9DSz15CgojCiMgU2NoZWR1bGVyIGZlYXR1cmVzCiMKIyBlbmQgb2YgU2No
ZWR1bGVyIGZlYXR1cmVzCgpDT05GSUdfQ0NfSU1QTElDSVRfRkFMTFRIUk9VR0g9Ii1XaW1wbGlj
aXQtZmFsbHRocm91Z2g9NSIKQ09ORklHX0NHUk9VUFM9eQpDT05GSUdfUEFHRV9DT1VOVEVSPXkK
Q09ORklHX01FTUNHPXkKIyBDT05GSUdfQ0dST1VQX1NDSEVEIGlzIG5vdCBzZXQKQ09ORklHX0NH
Uk9VUF9QSURTPXkKQ09ORklHX0NHUk9VUF9SRE1BPXkKIyBDT05GSUdfQ0dST1VQX0ZSRUVaRVIg
aXMgbm90IHNldAojIENPTkZJR19DR1JPVVBfREVWSUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0dS
T1VQX0NQVUFDQ1QgaXMgbm90IHNldAojIENPTkZJR19DR1JPVVBfTUlTQyBpcyBub3Qgc2V0CiMg
Q09ORklHX0NHUk9VUF9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19DSEVDS1BPSU5UX1JFU1RPUkU9
eQojIENPTkZJR19TQ0hFRF9BVVRPR1JPVVAgaXMgbm90IHNldAojIENPTkZJR19TWVNGU19ERVBS
RUNBVEVEIGlzIG5vdCBzZXQKQ09ORklHX1JFTEFZPXkKQ09ORklHX0JMS19ERVZfSU5JVFJEPXkK
Q09ORklHX0lOSVRSQU1GU19TT1VSQ0U9IiIKQ09ORklHX1JEX0daSVA9eQpDT05GSUdfUkRfQlpJ
UDI9eQpDT05GSUdfUkRfTFpNQT15CkNPTkZJR19SRF9YWj15CkNPTkZJR19SRF9MWk89eQpDT05G
SUdfUkRfTFo0PXkKQ09ORklHX1JEX1pTVEQ9eQpDT05GSUdfQk9PVF9DT05GSUc9eQpDT05GSUdf
Q0NfT1BUSU1JWkVfRk9SX1BFUkZPUk1BTkNFPXkKIyBDT05GSUdfQ0NfT1BUSU1JWkVfRk9SX1NJ
WkUgaXMgbm90IHNldApDT05GSUdfRVhQRVJUPXkKIyBDT05GSUdfTVVMVElVU0VSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0dFVE1BU0tfU1lTQ0FMTCBpcyBub3Qgc2V0CkNPTkZJR19TWVNGU19TWVND
QUxMPXkKIyBDT05GSUdfRkhBTkRMRSBpcyBub3Qgc2V0CkNPTkZJR19QT1NJWF9USU1FUlM9eQpD
T05GSUdfUFJJTlRLPXkKIyBDT05GSUdfQlVHIGlzIG5vdCBzZXQKQ09ORklHX0VMRl9DT1JFPXkK
Q09ORklHX0JBU0VfRlVMTD15CiMgQ09ORklHX0ZVVEVYIGlzIG5vdCBzZXQKQ09ORklHX0VQT0xM
PXkKIyBDT05GSUdfU0lHTkFMRkQgaXMgbm90IHNldApDT05GSUdfVElNRVJGRD15CkNPTkZJR19F
VkVOVEZEPXkKIyBDT05GSUdfU0hNRU0gaXMgbm90IHNldAojIENPTkZJR19BSU8gaXMgbm90IHNl
dAojIENPTkZJR19JT19VUklORyBpcyBub3Qgc2V0CiMgQ09ORklHX0FEVklTRV9TWVNDQUxMUyBp
cyBub3Qgc2V0CiMgQ09ORklHX01FTUJBUlJJRVIgaXMgbm90IHNldApDT05GSUdfS0FMTFNZTVM9
eQpDT05GSUdfS0FMTFNZTVNfQUxMPXkKQ09ORklHX0tBTExTWU1TX0JBU0VfUkVMQVRJVkU9eQpD
T05GSUdfVVNFUkZBVUxURkQ9eQpDT05GSUdfS0NNUD15CkNPTkZJR19FTUJFRERFRD15CiMgQ09O
RklHX1BDMTA0IGlzIG5vdCBzZXQKCiMKIyBLZXJuZWwgUGVyZm9ybWFuY2UgRXZlbnRzIEFuZCBD
b3VudGVycwojCiMgZW5kIG9mIEtlcm5lbCBQZXJmb3JtYW5jZSBFdmVudHMgQW5kIENvdW50ZXJz
CgojIENPTkZJR19WTV9FVkVOVF9DT1VOVEVSUyBpcyBub3Qgc2V0CkNPTkZJR19DT01QQVRfQlJL
PXkKIyBDT05GSUdfU0xBQiBpcyBub3Qgc2V0CiMgQ09ORklHX1NMVUIgaXMgbm90IHNldApDT05G
SUdfU0xPQj15CiMgQ09ORklHX1NIVUZGTEVfUEFHRV9BTExPQ0FUT1IgaXMgbm90IHNldApDT05G
SUdfU1lTVEVNX0RBVEFfVkVSSUZJQ0FUSU9OPXkKIyBDT05GSUdfUFJPRklMSU5HIGlzIG5vdCBz
ZXQKQ09ORklHX1RSQUNFUE9JTlRTPXkKIyBlbmQgb2YgR2VuZXJhbCBzZXR1cAoKQ09ORklHX01J
Q1JPQkxBWkU9eQpDT05GSUdfQ1BVX0JJR19FTkRJQU49eQojIENPTkZJR19DUFVfTElUVExFX0VO
RElBTiBpcyBub3Qgc2V0CkNPTkZJR19HRU5FUklDX0hXRUlHSFQ9eQpDT05GSUdfR0VORVJJQ19D
QUxJQlJBVEVfREVMQVk9eQpDT05GSUdfR0VORVJJQ19DU1VNPXkKQ09ORklHX1NUQUNLVFJBQ0Vf
U1VQUE9SVD15CkNPTkZJR19MT0NLREVQX1NVUFBPUlQ9eQoKIwojIFBsYXRmb3JtIG9wdGlvbnMK
IwpDT05GSUdfT1BUX0xJQl9GVU5DVElPTj15CgojCiMgRGVmaW5pdGlvbnMgZm9yIE1JQ1JPQkxB
WkUwCiMKQ09ORklHX0tFUk5FTF9CQVNFX0FERFI9MHg5MDAwMDAwMApDT05GSUdfWElMSU5YX01J
Q1JPQkxBWkUwX0ZBTUlMWT0idmlydGV4NSIKQ09ORklHX1hJTElOWF9NSUNST0JMQVpFMF9VU0Vf
TVNSX0lOU1RSPTAKQ09ORklHX1hJTElOWF9NSUNST0JMQVpFMF9VU0VfUENNUF9JTlNUUj0wCkNP
TkZJR19YSUxJTlhfTUlDUk9CTEFaRTBfVVNFX0JBUlJFTD0wCkNPTkZJR19YSUxJTlhfTUlDUk9C
TEFaRTBfVVNFX0RJVj0wCkNPTkZJR19YSUxJTlhfTUlDUk9CTEFaRTBfVVNFX0hXX01VTD0wCkNP
TkZJR19YSUxJTlhfTUlDUk9CTEFaRTBfVVNFX0ZQVT0wCkNPTkZJR19YSUxJTlhfTUlDUk9CTEFa
RTBfSFdfVkVSPSI3LjEwLmQiCiMgZW5kIG9mIFBsYXRmb3JtIG9wdGlvbnMKCiMKIyBQcm9jZXNz
b3IgdHlwZSBhbmQgZmVhdHVyZXMKIwpDT05GSUdfSFpfMTAwPXkKIyBDT05GSUdfSFpfMjUwIGlz
IG5vdCBzZXQKIyBDT05GSUdfSFpfMzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfSFpfMTAwMCBpcyBu
b3Qgc2V0CkNPTkZJR19IWj0xMDAKQ09ORklHX1NDSEVEX0hSVElDSz15CkNPTkZJR19NTVU9eQoK
IwojIEJvb3Qgb3B0aW9ucwojCkNPTkZJR19DTURMSU5FX0JPT0w9eQpDT05GSUdfQ01ETElORT0i
Y29uc29sZT10dHlVTDAsMTE1MjAwIgojIENPTkZJR19DTURMSU5FX0ZPUkNFIGlzIG5vdCBzZXQK
IyBlbmQgb2YgUHJvY2Vzc29yIHR5cGUgYW5kIGZlYXR1cmVzCgojCiMgS2VybmVsIGZlYXR1cmVz
CiMKQ09ORklHX05SX0NQVVM9MQpDT05GSUdfQURWQU5DRURfT1BUSU9OUz15CiMgQ09ORklHX0hJ
R0hNRU0gaXMgbm90IHNldApDT05GSUdfTE9XTUVNX1NJWkVfQk9PTD15CkNPTkZJR19MT1dNRU1f
U0laRT0weDMwMDAwMDAwCkNPTkZJR19NQU5VQUxfUkVTRVRfVkVDVE9SPTB4MApDT05GSUdfS0VS
TkVMX1NUQVJUX0JPT0w9eQpDT05GSUdfS0VSTkVMX1NUQVJUPTB4YzAwMDAwMDAKQ09ORklHX1RB
U0tfU0laRV9CT09MPXkKQ09ORklHX1RBU0tfU0laRT0weDgwMDAwMDAwCiMgZW5kIG9mIEtlcm5l
bCBmZWF0dXJlcwoKIwojIEJ1cyBPcHRpb25zCiMKIyBlbmQgb2YgQnVzIE9wdGlvbnMKCiMKIyBH
ZW5lcmFsIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgb3B0aW9ucwojCkNPTkZJR19TRVRfRlM9eQpD
T05GSUdfVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVD15CkNPTkZJR19IQVZFX0RNQV9DT05USUdVT1VT
PXkKQ09ORklHX0dFTkVSSUNfSURMRV9QT0xMX1NFVFVQPXkKQ09ORklHX0FSQ0hfMzJCSVRfT0ZG
X1Q9eQpDT05GSUdfTU1VX0dBVEhFUl9OT19SQU5HRT15CkNPTkZJR19BUkNIX1dBTlRfSVBDX1BB
UlNFX1ZFUlNJT049eQpDT05GSUdfSEFWRV9BUkNIX1NFQ0NPTVA9eQojIENPTkZJR19TRUNDT01Q
IGlzIG5vdCBzZXQKQ09ORklHX0xUT19OT05FPXkKQ09ORklHX01PRFVMRVNfVVNFX0VMRl9SRUxB
PXkKQ09ORklHX1BHVEFCTEVfTEVWRUxTPTIKQ09ORklHX1BBR0VfU0laRV9MRVNTX1RIQU5fNjRL
Qj15CkNPTkZJR19QQUdFX1NJWkVfTEVTU19USEFOXzI1NktCPXkKQ09ORklHX0hBVkVfQVJDSF9I
QVNIPXkKQ09ORklHX0NMT05FX0JBQ0tXQVJEUzM9eQpDT05GSUdfQ09NUEFUXzMyQklUX1RJTUU9
eQpDT05GSUdfQ1BVX05PX0VGRklDSUVOVF9GRlM9eQojIENPTkZJR19MT0NLX0VWRU5UX0NPVU5U
UyBpcyBub3Qgc2V0CgojCiMgR0NPVi1iYXNlZCBrZXJuZWwgcHJvZmlsaW5nCiMKQ09ORklHX0dD
T1ZfS0VSTkVMPXkKQ09ORklHX0FSQ0hfSEFTX0dDT1ZfUFJPRklMRV9BTEw9eQojIGVuZCBvZiBH
Q09WLWJhc2VkIGtlcm5lbCBwcm9maWxpbmcKIyBlbmQgb2YgR2VuZXJhbCBhcmNoaXRlY3R1cmUt
ZGVwZW5kZW50IG9wdGlvbnMKCkNPTkZJR19SVF9NVVRFWEVTPXkKQ09ORklHX0JBU0VfU01BTEw9
MApDT05GSUdfTU9EVUxFX1NJR19GT1JNQVQ9eQpDT05GSUdfTU9EVUxFUz15CiMgQ09ORklHX01P
RFVMRV9GT1JDRV9MT0FEIGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRV9VTkxPQUQ9eQojIENPTkZJ
R19NT0RVTEVfRk9SQ0VfVU5MT0FEIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVkVSU0lPTlMgaXMg
bm90IHNldApDT05GSUdfTU9EVUxFX1NSQ1ZFUlNJT05fQUxMPXkKQ09ORklHX01PRFVMRV9TSUc9
eQojIENPTkZJR19NT0RVTEVfU0lHX0ZPUkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX1NJ
R19BTEwgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfU0lHX1NIQTEgaXMgbm90IHNldApDT05G
SUdfTU9EVUxFX1NJR19TSEEyMjQ9eQojIENPTkZJR19NT0RVTEVfU0lHX1NIQTI1NiBpcyBub3Qg
c2V0CiMgQ09ORklHX01PRFVMRV9TSUdfU0hBMzg0IGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxF
X1NJR19TSEE1MTIgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX1NJR19IQVNIPSJzaGEyMjQiCiMg
Q09ORklHX01PRFVMRV9DT01QUkVTU19OT05FIGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRV9DT01Q
UkVTU19HWklQPXkKIyBDT05GSUdfTU9EVUxFX0NPTVBSRVNTX1haIGlzIG5vdCBzZXQKIyBDT05G
SUdfTU9EVUxFX0NPTVBSRVNTX1pTVEQgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfREVDT01Q
UkVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9BTExPV19NSVNTSU5HX05BTUVTUEFDRV9J
TVBPUlRTIGlzIG5vdCBzZXQKQ09ORklHX01PRFBST0JFX1BBVEg9Ii9zYmluL21vZHByb2JlIgpD
T05GSUdfTU9EVUxFU19UUkVFX0xPT0tVUD15CiMgQ09ORklHX0JMT0NLIGlzIG5vdCBzZXQKQ09O
RklHX0FTTjE9eQpDT05GSUdfVU5JTkxJTkVfU1BJTl9VTkxPQ0s9eQoKIwojIEV4ZWN1dGFibGUg
ZmlsZSBmb3JtYXRzCiMKQ09ORklHX0JJTkZNVF9FTEY9eQpDT05GSUdfRUxGQ09SRT15CkNPTkZJ
R19DT1JFX0RVTVBfREVGQVVMVF9FTEZfSEVBREVSUz15CkNPTkZJR19CSU5GTVRfU0NSSVBUPXkK
Q09ORklHX0JJTkZNVF9NSVNDPXkKQ09ORklHX0NPUkVEVU1QPXkKIyBlbmQgb2YgRXhlY3V0YWJs
ZSBmaWxlIGZvcm1hdHMKCiMKIyBNZW1vcnkgTWFuYWdlbWVudCBvcHRpb25zCiMKQ09ORklHX0ZM
QVRNRU09eQpDT05GSUdfTUVNT1JZX0lTT0xBVElPTj15CkNPTkZJR19TUExJVF9QVExPQ0tfQ1BV
Uz00CiMgQ09ORklHX0NPTVBBQ1RJT04gaXMgbm90IHNldAojIENPTkZJR19QQUdFX1JFUE9SVElO
RyBpcyBub3Qgc2V0CkNPTkZJR19NSUdSQVRJT049eQpDT05GSUdfQ09OVElHX0FMTE9DPXkKQ09O
RklHX1ZJUlRfVE9fQlVTPXkKQ09ORklHX0tTTT15CkNPTkZJR19ERUZBVUxUX01NQVBfTUlOX0FE
RFI9NDA5NgpDT05GSUdfTkVFRF9QRVJfQ1BVX0tNPXkKQ09ORklHX0NNQT15CkNPTkZJR19DTUFf
REVCVUc9eQpDT05GSUdfQ01BX0RFQlVHRlM9eQpDT05GSUdfQ01BX1NZU0ZTPXkKQ09ORklHX0NN
QV9BUkVBUz03CiMgQ09ORklHX1pQT09MIGlzIG5vdCBzZXQKIyBDT05GSUdfWlNNQUxMT0MgaXMg
bm90IHNldApDT05GSUdfUEFHRV9JRExFX0ZMQUc9eQpDT05GSUdfSURMRV9QQUdFX1RSQUNLSU5H
PXkKQ09ORklHX1pPTkVfRE1BPXkKQ09ORklHX1BFUkNQVV9TVEFUUz15CkNPTkZJR19HVVBfVEVT
VD15CgojCiMgRGF0YSBBY2Nlc3MgTW9uaXRvcmluZwojCiMgQ09ORklHX0RBTU9OIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgRGF0YSBBY2Nlc3MgTW9uaXRvcmluZwojIGVuZCBvZiBNZW1vcnkgTWFuYWdl
bWVudCBvcHRpb25zCgojIENPTkZJR19ORVQgaXMgbm90IHNldAoKIwojIERldmljZSBEcml2ZXJz
CiMKQ09ORklHX0hBVkVfUENJPXkKIyBDT05GSUdfUENJIGlzIG5vdCBzZXQKQ09ORklHX1BDQ0FS
RD15CkNPTkZJR19QQ01DSUE9eQpDT05GSUdfUENNQ0lBX0xPQURfQ0lTPXkKCiMKIyBQQy1jYXJk
IGJyaWRnZXMKIwoKIwojIEdlbmVyaWMgRHJpdmVyIE9wdGlvbnMKIwojIENPTkZJR19VRVZFTlRf
SEVMUEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfREVWVE1QRlMgaXMgbm90IHNldApDT05GSUdfU1RB
TkRBTE9ORT15CiMgQ09ORklHX1BSRVZFTlRfRklSTVdBUkVfQlVJTEQgaXMgbm90IHNldAoKIwoj
IEZpcm13YXJlIGxvYWRlcgojCkNPTkZJR19GV19MT0FERVI9eQpDT05GSUdfRldfTE9BREVSX1BB
R0VEX0JVRj15CkNPTkZJR19FWFRSQV9GSVJNV0FSRT0iIgpDT05GSUdfRldfTE9BREVSX1VTRVJf
SEVMUEVSPXkKQ09ORklHX0ZXX0xPQURFUl9VU0VSX0hFTFBFUl9GQUxMQkFDSz15CiMgQ09ORklH
X0ZXX0xPQURFUl9DT01QUkVTUyBpcyBub3Qgc2V0CiMgZW5kIG9mIEZpcm13YXJlIGxvYWRlcgoK
Q09ORklHX1dBTlRfREVWX0NPUkVEVU1QPXkKQ09ORklHX0FMTE9XX0RFVl9DT1JFRFVNUD15CkNP
TkZJR19ERVZfQ09SRURVTVA9eQpDT05GSUdfREVCVUdfRFJJVkVSPXkKQ09ORklHX0RFQlVHX0RF
VlJFUz15CkNPTkZJR19ERUJVR19URVNUX0RSSVZFUl9SRU1PVkU9eQpDT05GSUdfVEVTVF9BU1lO
Q19EUklWRVJfUFJPQkU9bQpDT05GSUdfR0VORVJJQ19DUFVfREVWSUNFUz15CkNPTkZJR19TT0Nf
QlVTPXkKQ09ORklHX1JFR01BUD15CkNPTkZJR19SRUdNQVBfSTJDPXkKQ09ORklHX1JFR01BUF9T
UE1JPW0KQ09ORklHX1JFR01BUF9XMT1tCkNPTkZJR19SRUdNQVBfTU1JTz15CkNPTkZJR19SRUdN
QVBfSVJRPXkKQ09ORklHX1JFR01BUF9JM0M9bQpDT05GSUdfRE1BX1NIQVJFRF9CVUZGRVI9eQoj
IENPTkZJR19ETUFfRkVOQ0VfVFJBQ0UgaXMgbm90IHNldAojIGVuZCBvZiBHZW5lcmljIERyaXZl
ciBPcHRpb25zCgojCiMgQnVzIGRldmljZXMKIwojIENPTkZJR19BUk1fSU5URUdSQVRPUl9MTSBp
cyBub3Qgc2V0CiMgQ09ORklHX0JUMV9BUEIgaXMgbm90IHNldApDT05GSUdfQlQxX0FYST15CkNP
TkZJR19ISVNJTElDT05fTFBDPXkKIyBDT05GSUdfSU5URUxfSVhQNFhYX0VCIGlzIG5vdCBzZXQK
IyBDT05GSUdfUUNPTV9FQkkyIGlzIG5vdCBzZXQKQ09ORklHX01ISV9CVVM9bQpDT05GSUdfTUhJ
X0JVU19ERUJVRz15CiMgZW5kIG9mIEJ1cyBkZXZpY2VzCgojCiMgRmlybXdhcmUgRHJpdmVycwoj
CgojCiMgQVJNIFN5c3RlbSBDb250cm9sIGFuZCBNYW5hZ2VtZW50IEludGVyZmFjZSBQcm90b2Nv
bAojCiMgQ09ORklHX0FSTV9TQ01JX1BST1RPQ09MIGlzIG5vdCBzZXQKQ09ORklHX0FSTV9TQ01J
X1BPV0VSX0RPTUFJTj1tCiMgZW5kIG9mIEFSTSBTeXN0ZW0gQ29udHJvbCBhbmQgTWFuYWdlbWVu
dCBJbnRlcmZhY2UgUHJvdG9jb2wKCkNPTkZJR19BUk1fU0NQSV9QUk9UT0NPTD1tCkNPTkZJR19B
Uk1fU0NQSV9QT1dFUl9ET01BSU49eQpDT05GSUdfRklSTVdBUkVfTUVNTUFQPXkKIyBDT05GSUdf
VFVSUklTX01PWF9SV1RNIGlzIG5vdCBzZXQKQ09ORklHX0JDTTQ3WFhfTlZSQU09eQpDT05GSUdf
QkNNNDdYWF9TUFJPTT15CiMgQ09ORklHX1RFRV9CTlhUX0ZXIGlzIG5vdCBzZXQKQ09ORklHX0dP
T0dMRV9GSVJNV0FSRT15CkNPTkZJR19HT09HTEVfQ09SRUJPT1RfVEFCTEU9bQpDT05GSUdfR09P
R0xFX01FTUNPTlNPTEU9bQpDT05GSUdfR09PR0xFX01FTUNPTlNPTEVfQ09SRUJPT1Q9bQpDT05G
SUdfR09PR0xFX1ZQRD1tCiMgQ09ORklHX0lNWF9EU1AgaXMgbm90IHNldAojIENPTkZJR19JTVhf
U0NVIGlzIG5vdCBzZXQKCiMKIyBUZWdyYSBmaXJtd2FyZSBkcml2ZXIKIwojIGVuZCBvZiBUZWdy
YSBmaXJtd2FyZSBkcml2ZXIKIyBlbmQgb2YgRmlybXdhcmUgRHJpdmVycwoKIyBDT05GSUdfR05T
UyBpcyBub3Qgc2V0CiMgQ09ORklHX01URCBpcyBub3Qgc2V0CkNPTkZJR19EVEM9eQpDT05GSUdf
T0Y9eQojIENPTkZJR19PRl9VTklUVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX09GX0FMTF9EVEJT
IGlzIG5vdCBzZXQKQ09ORklHX09GX0ZMQVRUUkVFPXkKQ09ORklHX09GX0VBUkxZX0ZMQVRUUkVF
PXkKQ09ORklHX09GX0tPQko9eQpDT05GSUdfT0ZfQUREUkVTUz15CkNPTkZJR19PRl9JUlE9eQpD
T05GSUdfT0ZfUkVTRVJWRURfTUVNPXkKIyBDT05GSUdfT0ZfT1ZFUkxBWSBpcyBub3Qgc2V0CkNP
TkZJR19BUkNIX01JR0hUX0hBVkVfUENfUEFSUE9SVD15CiMgQ09ORklHX1BBUlBPUlQgaXMgbm90
IHNldAoKIwojIE5WTUUgU3VwcG9ydAojCiMgZW5kIG9mIE5WTUUgU3VwcG9ydAoKIwojIE1pc2Mg
ZGV2aWNlcwojCkNPTkZJR19BRDUyNVhfRFBPVD15CkNPTkZJR19BRDUyNVhfRFBPVF9JMkM9eQpD
T05GSUdfRFVNTVlfSVJRPXkKQ09ORklHX0lDUzkzMlM0MDE9eQpDT05GSUdfQVRNRUxfU1NDPXkK
Q09ORklHX0VOQ0xPU1VSRV9TRVJWSUNFUz15CkNPTkZJR19ISTY0MjFWNjAwX0lSUT1tCkNPTkZJ
R19RQ09NX0NPSU5DRUxMPW0KQ09ORklHX1FDT01fRkFTVFJQQz1tCkNPTkZJR19BUERTOTgwMkFM
Uz1tCiMgQ09ORklHX0lTTDI5MDAzIGlzIG5vdCBzZXQKIyBDT05GSUdfSVNMMjkwMjAgaXMgbm90
IHNldApDT05GSUdfU0VOU09SU19UU0wyNTUwPW0KQ09ORklHX1NFTlNPUlNfQkgxNzcwPW0KQ09O
RklHX1NFTlNPUlNfQVBEUzk5MFg9eQojIENPTkZJR19ITUM2MzUyIGlzIG5vdCBzZXQKQ09ORklH
X0RTMTY4Mj1tCkNPTkZJR19TUkFNPXkKQ09ORklHX1hJTElOWF9TREZFQz1tCkNPTkZJR19NSVND
X1JUU1g9bQpDT05GSUdfSElTSV9ISUtFWV9VU0I9bQojIENPTkZJR19DMlBPUlQgaXMgbm90IHNl
dAoKIwojIEVFUFJPTSBzdXBwb3J0CiMKIyBDT05GSUdfRUVQUk9NX0FUMjQgaXMgbm90IHNldApD
T05GSUdfRUVQUk9NX0xFR0FDWT1tCkNPTkZJR19FRVBST01fTUFYNjg3NT15CkNPTkZJR19FRVBS
T01fOTNDWDY9bQojIENPTkZJR19FRVBST01fSURUXzg5SFBFU1ggaXMgbm90IHNldApDT05GSUdf
RUVQUk9NX0VFMTAwND15CiMgZW5kIG9mIEVFUFJPTSBzdXBwb3J0CgojCiMgVGV4YXMgSW5zdHJ1
bWVudHMgc2hhcmVkIHRyYW5zcG9ydCBsaW5lIGRpc2NpcGxpbmUKIwojIGVuZCBvZiBUZXhhcyBJ
bnN0cnVtZW50cyBzaGFyZWQgdHJhbnNwb3J0IGxpbmUgZGlzY2lwbGluZQoKQ09ORklHX0FMVEVS
QV9TVEFQTD15CkNPTkZJR19FQ0hPPXkKQ09ORklHX01JU0NfUlRTWF9VU0I9bQpDT05GSUdfVUFD
Q0U9eQojIENPTkZJR19QVlBBTklDIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWlzYyBkZXZpY2VzCgoj
CiMgU0NTSSBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19TQ1NJX01PRD15CiMgZW5kIG9mIFNDU0kg
ZGV2aWNlIHN1cHBvcnQKCiMKIyBJRUVFIDEzOTQgKEZpcmVXaXJlKSBzdXBwb3J0CiMKIyBDT05G
SUdfRklSRVdJUkUgaXMgbm90IHNldAojIGVuZCBvZiBJRUVFIDEzOTQgKEZpcmVXaXJlKSBzdXBw
b3J0CgojCiMgSW5wdXQgZGV2aWNlIHN1cHBvcnQKIwojIENPTkZJR19JTlBVVCBpcyBub3Qgc2V0
CgojCiMgSGFyZHdhcmUgSS9PIHBvcnRzCiMKQ09ORklHX1NFUklPPXkKQ09ORklHX1NFUklPX0xJ
QlBTMj1tCiMgQ09ORklHX1NFUklPX1JBVyBpcyBub3Qgc2V0CkNPTkZJR19TRVJJT19YSUxJTlhf
WFBTX1BTMj15CkNPTkZJR19TRVJJT19BTFRFUkFfUFMyPW0KIyBDT05GSUdfU0VSSU9fUFMyTVVM
VCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklPX0FSQ19QUzIgaXMgbm90IHNldAojIENPTkZJR19T
RVJJT19BUEJQUzIgaXMgbm90IHNldAojIENPTkZJR19TRVJJT19PTFBDX0FQU1AgaXMgbm90IHNl
dAojIENPTkZJR19TRVJJT19TVU40SV9QUzIgaXMgbm90IHNldAojIENPTkZJR19TRVJJT19HUElP
X1BTMiBpcyBub3Qgc2V0CkNPTkZJR19VU0VSSU89eQpDT05GSUdfR0FNRVBPUlQ9eQpDT05GSUdf
R0FNRVBPUlRfTlM1NTg9bQpDT05GSUdfR0FNRVBPUlRfTDQ9eQojIGVuZCBvZiBIYXJkd2FyZSBJ
L08gcG9ydHMKIyBlbmQgb2YgSW5wdXQgZGV2aWNlIHN1cHBvcnQKCiMKIyBDaGFyYWN0ZXIgZGV2
aWNlcwojCiMgQ09ORklHX1RUWSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9ERVZfQlVTIGlz
IG5vdCBzZXQKQ09ORklHX0lQTUlfSEFORExFUj15CiMgQ09ORklHX0lQTUlfUEFOSUNfRVZFTlQg
aXMgbm90IHNldAojIENPTkZJR19JUE1JX0RFVklDRV9JTlRFUkZBQ0UgaXMgbm90IHNldAojIENP
TkZJR19JUE1JX1NJIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBNSV9TU0lGIGlzIG5vdCBzZXQKQ09O
RklHX0lQTUlfSVBNQj15CkNPTkZJR19JUE1JX1dBVENIRE9HPW0KQ09ORklHX0lQTUlfUE9XRVJP
RkY9bQpDT05GSUdfSVBNSV9LQ1NfQk1DPXkKIyBDT05GSUdfQVNQRUVEX0tDU19JUE1JX0JNQyBp
cyBub3Qgc2V0CkNPTkZJR19OUENNN1hYX0tDU19JUE1JX0JNQz15CkNPTkZJR19JUE1JX0tDU19C
TUNfQ0RFVl9JUE1JPW0KQ09ORklHX0lQTUlfS0NTX0JNQ19TRVJJTz15CkNPTkZJR19BU1BFRURf
QlRfSVBNSV9CTUM9bQojIENPTkZJR19JUE1CX0RFVklDRV9JTlRFUkZBQ0UgaXMgbm90IHNldApD
T05GSUdfSFdfUkFORE9NPXkKIyBDT05GSUdfSFdfUkFORE9NX1RJTUVSSU9NRU0gaXMgbm90IHNl
dAojIENPTkZJR19IV19SQU5ET01fQVRNRUwgaXMgbm90IHNldApDT05GSUdfSFdfUkFORE9NX0JB
NDMxPXkKQ09ORklHX0hXX1JBTkRPTV9CQ00yODM1PW0KIyBDT05GSUdfSFdfUkFORE9NX0lQUk9D
X1JORzIwMCBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET01fSVhQNFhYPXkKQ09ORklHX0hXX1JB
TkRPTV9PTUFQPXkKQ09ORklHX0hXX1JBTkRPTV9PTUFQM19ST009bQojIENPTkZJR19IV19SQU5E
T01fVklSVElPIGlzIG5vdCBzZXQKQ09ORklHX0hXX1JBTkRPTV9JTVhfUk5HQz15CiMgQ09ORklH
X0hXX1JBTkRPTV9OT01BRElLIGlzIG5vdCBzZXQKQ09ORklHX0hXX1JBTkRPTV9TVE0zMj15CkNP
TkZJR19IV19SQU5ET01fTUVTT049eQojIENPTkZJR19IV19SQU5ET01fTVRLIGlzIG5vdCBzZXQK
Q09ORklHX0hXX1JBTkRPTV9FWFlOT1M9bQojIENPTkZJR19IV19SQU5ET01fTlBDTSBpcyBub3Qg
c2V0CiMgQ09ORklHX0hXX1JBTkRPTV9LRVlTVE9ORSBpcyBub3Qgc2V0CiMgQ09ORklHX0hXX1JB
TkRPTV9DQ1RSTkcgaXMgbm90IHNldAojIENPTkZJR19IV19SQU5ET01fWElQSEVSQSBpcyBub3Qg
c2V0CiMgQ09ORklHX1hJTElOWF9IV0lDQVAgaXMgbm90IHNldAoKIwojIFBDTUNJQSBjaGFyYWN0
ZXIgZGV2aWNlcwojCkNPTkZJR19DQVJETUFOXzQwMDA9eQpDT05GSUdfQ0FSRE1BTl80MDQwPW0K
Q09ORklHX1NDUjI0WD15CiMgZW5kIG9mIFBDTUNJQSBjaGFyYWN0ZXIgZGV2aWNlcwoKQ09ORklH
X0RFVk1FTT15CkNPTkZJR19UQ0dfVFBNPXkKIyBDT05GSUdfSFdfUkFORE9NX1RQTSBpcyBub3Qg
c2V0CiMgQ09ORklHX1RDR19USVMgaXMgbm90IHNldAojIENPTkZJR19UQ0dfVElTX1NZTlFVQUNF
UiBpcyBub3Qgc2V0CkNPTkZJR19UQ0dfVElTX0kyQ19DUjUwPW0KIyBDT05GSUdfVENHX1RJU19J
MkNfQVRNRUwgaXMgbm90IHNldApDT05GSUdfVENHX1RJU19JMkNfSU5GSU5FT049eQpDT05GSUdf
VENHX1RJU19JMkNfTlVWT1RPTj15CkNPTkZJR19UQ0dfQVRNRUw9eQpDT05GSUdfVENHX1ZUUE1f
UFJPWFk9bQpDT05GSUdfVENHX1RJU19TVDMzWlAyND15CkNPTkZJR19UQ0dfVElTX1NUMzNaUDI0
X0kyQz15CkNPTkZJR19YSUxMWUJVU19DTEFTUz15CkNPTkZJR19YSUxMWUJVUz15CkNPTkZJR19Y
SUxMWUJVU19PRj1tCiMgQ09ORklHX1hJTExZVVNCIGlzIG5vdCBzZXQKQ09ORklHX1JBTkRPTV9U
UlVTVF9CT09UTE9BREVSPXkKIyBlbmQgb2YgQ2hhcmFjdGVyIGRldmljZXMKCiMKIyBJMkMgc3Vw
cG9ydAojCkNPTkZJR19JMkM9eQpDT05GSUdfSTJDX0JPQVJESU5GTz15CiMgQ09ORklHX0kyQ19D
T01QQVQgaXMgbm90IHNldApDT05GSUdfSTJDX0NIQVJERVY9bQpDT05GSUdfSTJDX01VWD1tCgoj
CiMgTXVsdGlwbGV4ZXIgSTJDIENoaXAgc3VwcG9ydAojCiMgQ09ORklHX0kyQ19BUkJfR1BJT19D
SEFMTEVOR0UgaXMgbm90IHNldApDT05GSUdfSTJDX01VWF9HUElPPW0KQ09ORklHX0kyQ19NVVhf
R1BNVVg9bQpDT05GSUdfSTJDX01VWF9MVEM0MzA2PW0KQ09ORklHX0kyQ19NVVhfUENBOTU0MT1t
CiMgQ09ORklHX0kyQ19NVVhfUENBOTU0eCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19NVVhfUkVH
IGlzIG5vdCBzZXQKQ09ORklHX0kyQ19NVVhfTUxYQ1BMRD1tCiMgZW5kIG9mIE11bHRpcGxleGVy
IEkyQyBDaGlwIHN1cHBvcnQKCiMgQ09ORklHX0kyQ19IRUxQRVJfQVVUTyBpcyBub3Qgc2V0CkNP
TkZJR19JMkNfU01CVVM9eQoKIwojIEkyQyBBbGdvcml0aG1zCiMKQ09ORklHX0kyQ19BTEdPQklU
PXkKQ09ORklHX0kyQ19BTEdPUENGPXkKQ09ORklHX0kyQ19BTEdPUENBPXkKIyBlbmQgb2YgSTJD
IEFsZ29yaXRobXMKCiMKIyBJMkMgSGFyZHdhcmUgQnVzIHN1cHBvcnQKIwpDT05GSUdfSTJDX0hJ
WDVIRDI9bQoKIwojIEkyQyBzeXN0ZW0gYnVzIGRyaXZlcnMgKG1vc3RseSBlbWJlZGRlZCAvIHN5
c3RlbS1vbi1jaGlwKQojCkNPTkZJR19JMkNfQUxURVJBPXkKQ09ORklHX0kyQ19BU1BFRUQ9eQpD
T05GSUdfSTJDX0FUOTE9bQojIENPTkZJR19JMkNfQVQ5MV9TTEFWRV9FWFBFUklNRU5UQUwgaXMg
bm90IHNldApDT05GSUdfSTJDX0FYWElBPW0KQ09ORklHX0kyQ19CQ00yODM1PXkKQ09ORklHX0ky
Q19CQ01fSVBST0M9bQpDT05GSUdfSTJDX0JDTV9LT05BPXkKIyBDT05GSUdfSTJDX0JSQ01TVEIg
aXMgbm90IHNldApDT05GSUdfSTJDX0NCVVNfR1BJTz15CkNPTkZJR19JMkNfREFWSU5DST1tCkNP
TkZJR19JMkNfREVTSUdOV0FSRV9DT1JFPW0KIyBDT05GSUdfSTJDX0RFU0lHTldBUkVfU0xBVkUg
aXMgbm90IHNldApDT05GSUdfSTJDX0RFU0lHTldBUkVfUExBVEZPUk09bQpDT05GSUdfSTJDX0RJ
R0lDT0xPUj1tCiMgQ09ORklHX0kyQ19FTUVWMiBpcyBub3Qgc2V0CkNPTkZJR19JMkNfRVhZTk9T
NT15CkNPTkZJR19JMkNfR1BJTz15CiMgQ09ORklHX0kyQ19HUElPX0ZBVUxUX0lOSkVDVE9SIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX0hJR0hMQU5ERVIgaXMgbm90IHNldApDT05GSUdfSTJDX0hJ
U0k9bQojIENPTkZJR19JMkNfSU1HIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0lNWF9MUEkyQyBp
cyBub3Qgc2V0CkNPTkZJR19JMkNfSU9QM1hYPXkKIyBDT05GSUdfSTJDX0paNDc4MCBpcyBub3Qg
c2V0CkNPTkZJR19JMkNfS0VNUExEPW0KQ09ORklHX0kyQ19MUEMySz15CkNPTkZJR19JMkNfTUVT
T049eQpDT05GSUdfSTJDX01UNjVYWD1tCkNPTkZJR19JMkNfTVQ3NjIxPXkKQ09ORklHX0kyQ19N
VjY0WFhYPW0KQ09ORklHX0kyQ19NWFM9bQojIENPTkZJR19JMkNfTlBDTTdYWCBpcyBub3Qgc2V0
CiMgQ09ORklHX0kyQ19PQ09SRVMgaXMgbm90IHNldApDT05GSUdfSTJDX09NQVA9bQojIENPTkZJ
R19JMkNfT1dMIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19BUFBMRT15CiMgQ09ORklHX0kyQ19QQ0Ff
UExBVEZPUk0gaXMgbm90IHNldApDT05GSUdfSTJDX1BOWD15CiMgQ09ORklHX0kyQ19QWEEgaXMg
bm90IHNldAojIENPTkZJR19JMkNfUUNPTV9DQ0kgaXMgbm90IHNldApDT05GSUdfSTJDX1JJSUM9
eQpDT05GSUdfSTJDX1JLM1g9eQpDT05GSUdfSTJDX1MzQzI0MTA9bQpDT05GSUdfSTJDX1NIX01P
QklMRT15CkNPTkZJR19JMkNfU0lNVEVDPW0KQ09ORklHX0kyQ19TUFJEPW0KQ09ORklHX0kyQ19T
VD15CkNPTkZJR19JMkNfU1RNMzJGND1tCkNPTkZJR19JMkNfU1RNMzJGNz15CkNPTkZJR19JMkNf
U1VONklfUDJXST1tCiMgQ09ORklHX0kyQ19TWU5RVUFDRVIgaXMgbm90IHNldApDT05GSUdfSTJD
X1RFR1JBX0JQTVA9bQpDT05GSUdfSTJDX1VOSVBISUVSPW0KIyBDT05GSUdfSTJDX1VOSVBISUVS
X0YgaXMgbm90IHNldAojIENPTkZJR19JMkNfVkVSU0FUSUxFIGlzIG5vdCBzZXQKQ09ORklHX0ky
Q19XTVQ9bQojIENPTkZJR19JMkNfWElMSU5YIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1hMUDlY
WCBpcyBub3Qgc2V0CkNPTkZJR19JMkNfUkNBUj1tCgojCiMgRXh0ZXJuYWwgSTJDL1NNQnVzIGFk
YXB0ZXIgZHJpdmVycwojCkNPTkZJR19JMkNfRElPTEFOX1UyQz1tCkNPTkZJR19JMkNfRExOMj1t
CiMgQ09ORklHX0kyQ19DUDI2MTUgaXMgbm90IHNldAojIENPTkZJR19JMkNfUk9CT1RGVVpaX09T
SUYgaXMgbm90IHNldApDT05GSUdfSTJDX1RJTllfVVNCPW0KQ09ORklHX0kyQ19WSVBFUkJPQVJE
PW0KCiMKIyBPdGhlciBJMkMvU01CdXMgYnVzIGRyaXZlcnMKIwpDT05GSUdfSTJDX01MWENQTEQ9
bQpDT05GSUdfSTJDX1ZJUlRJTz15CiMgZW5kIG9mIEkyQyBIYXJkd2FyZSBCdXMgc3VwcG9ydAoK
Q09ORklHX0kyQ19TVFVCPW0KQ09ORklHX0kyQ19TTEFWRT15CkNPTkZJR19JMkNfU0xBVkVfRUVQ
Uk9NPXkKQ09ORklHX0kyQ19TTEFWRV9URVNUVU5JVD1tCiMgQ09ORklHX0kyQ19ERUJVR19DT1JF
IGlzIG5vdCBzZXQKQ09ORklHX0kyQ19ERUJVR19BTEdPPXkKIyBDT05GSUdfSTJDX0RFQlVHX0JV
UyBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBzdXBwb3J0CgpDT05GSUdfSTNDPW0KIyBDT05GSUdf
Q0ROU19JM0NfTUFTVEVSIGlzIG5vdCBzZXQKQ09ORklHX0RXX0kzQ19NQVNURVI9bQojIENPTkZJ
R19TVkNfSTNDX01BU1RFUiBpcyBub3Qgc2V0CkNPTkZJR19NSVBJX0kzQ19IQ0k9bQojIENPTkZJ
R19TUEkgaXMgbm90IHNldApDT05GSUdfU1BNST1tCkNPTkZJR19TUE1JX0hJU0kzNjcwPW0KIyBD
T05GSUdfU1BNSV9NU01fUE1JQ19BUkIgaXMgbm90IHNldApDT05GSUdfU1BNSV9NVEtfUE1JRj1t
CkNPTkZJR19IU0k9eQpDT05GSUdfSFNJX0JPQVJESU5GTz15CgojCiMgSFNJIGNvbnRyb2xsZXJz
CiMKCiMKIyBIU0kgY2xpZW50cwojCkNPTkZJR19IU0lfQ0hBUj1tCkNPTkZJR19QUFM9eQpDT05G
SUdfUFBTX0RFQlVHPXkKIyBDT05GSUdfTlRQX1BQUyBpcyBub3Qgc2V0CgojCiMgUFBTIGNsaWVu
dHMgc3VwcG9ydAojCiMgQ09ORklHX1BQU19DTElFTlRfS1RJTUVSIGlzIG5vdCBzZXQKQ09ORklH
X1BQU19DTElFTlRfR1BJTz1tCgojCiMgUFBTIGdlbmVyYXRvcnMgc3VwcG9ydAojCgojCiMgUFRQ
IGNsb2NrIHN1cHBvcnQKIwpDT05GSUdfUFRQXzE1ODhfQ0xPQ0tfT1BUSU9OQUw9eQoKIwojIEVu
YWJsZSBQSFlMSUIgYW5kIE5FVFdPUktfUEhZX1RJTUVTVEFNUElORyB0byBzZWUgdGhlIGFkZGl0
aW9uYWwgY2xvY2tzLgojCiMgZW5kIG9mIFBUUCBjbG9jayBzdXBwb3J0CgojIENPTkZJR19QSU5D
VFJMIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9MSUI9eQpDT05GSUdfR1BJT0xJQl9GQVNUUEFUSF9M
SU1JVD01MTIKQ09ORklHX09GX0dQSU89eQpDT05GSUdfR1BJT0xJQl9JUlFDSElQPXkKQ09ORklH
X0RFQlVHX0dQSU89eQpDT05GSUdfR1BJT19TWVNGUz15CkNPTkZJR19HUElPX0NERVY9eQojIENP
TkZJR19HUElPX0NERVZfVjEgaXMgbm90IHNldApDT05GSUdfR1BJT19HRU5FUklDPXkKQ09ORklH
X0dQSU9fUkVHTUFQPW0KQ09ORklHX0dQSU9fTUFYNzMwWD1tCgojCiMgTWVtb3J5IG1hcHBlZCBH
UElPIGRyaXZlcnMKIwpDT05GSUdfR1BJT183NFhYX01NSU89bQpDT05GSUdfR1BJT19BTFRFUkE9
eQpDT05GSUdfR1BJT19BU1BFRUQ9bQpDT05GSUdfR1BJT19BU1BFRURfU0dQSU89eQpDT05GSUdf
R1BJT19BVEg3OT15CkNPTkZJR19HUElPX1JBU1BCRVJSWVBJX0VYUD1tCiMgQ09ORklHX0dQSU9f
QkNNX0tPTkEgaXMgbm90IHNldApDT05GSUdfR1BJT19CQ01fWEdTX0lQUk9DPXkKQ09ORklHX0dQ
SU9fQlJDTVNUQj1tCkNPTkZJR19HUElPX0NBREVOQ0U9eQpDT05GSUdfR1BJT19DTFBTNzExWD1t
CiMgQ09ORklHX0dQSU9fRFdBUEIgaXMgbm90IHNldAojIENPTkZJR19HUElPX0VJQ19TUFJEIGlz
IG5vdCBzZXQKQ09ORklHX0dQSU9fRU09bQojIENPTkZJR19HUElPX0ZUR1BJTzAxMCBpcyBub3Qg
c2V0CkNPTkZJR19HUElPX0dFTkVSSUNfUExBVEZPUk09eQojIENPTkZJR19HUElPX0dSR1BJTyBp
cyBub3Qgc2V0CkNPTkZJR19HUElPX0hJU0k9eQpDT05GSUdfR1BJT19ITFdEPW0KQ09ORklHX0dQ
SU9fSU9QPXkKIyBDT05GSUdfR1BJT19MT0dJQ1ZDIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19M
UEMxOFhYIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fTFBDMzJYWD15CkNPTkZJR19HUElPX01CODZT
N1g9bQpDT05GSUdfR1BJT19NRU5aMTI3PW0KIyBDT05GSUdfR1BJT19NUEM4WFhYIGlzIG5vdCBz
ZXQKQ09ORklHX0dQSU9fTVQ3NjIxPXkKIyBDT05GSUdfR1BJT19NWEMgaXMgbm90IHNldApDT05G
SUdfR1BJT19NWFM9eQojIENPTkZJR19HUElPX1BNSUNfRUlDX1NQUkQgaXMgbm90IHNldAojIENP
TkZJR19HUElPX1BYQSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fUkNBUiBpcyBub3Qgc2V0CiMg
Q09ORklHX0dQSU9fUkRBIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fUk9DS0NISVA9bQpDT05GSUdf
R1BJT19TQU1BNUQyX1BJT0JVPXkKIyBDT05GSUdfR1BJT19TSUZJVkUgaXMgbm90IHNldAojIENP
TkZJR19HUElPX1NJT1ggaXMgbm90IHNldAojIENPTkZJR19HUElPX1NOUFNfQ1JFRyBpcyBub3Qg
c2V0CkNPTkZJR19HUElPX1NQUkQ9bQojIENPTkZJR19HUElPX1NUUF9YV0FZIGlzIG5vdCBzZXQK
Q09ORklHX0dQSU9fU1lTQ09OPXkKIyBDT05GSUdfR1BJT19URUdSQSBpcyBub3Qgc2V0CiMgQ09O
RklHX0dQSU9fVEVHUkExODYgaXMgbm90IHNldApDT05GSUdfR1BJT19UUzQ4MDA9eQpDT05GSUdf
R1BJT19VTklQSElFUj15CkNPTkZJR19HUElPX1ZJU0NPTlRJPXkKQ09ORklHX0dQSU9fWEdFTkVf
U0I9bQpDT05GSUdfR1BJT19YSUxJTlg9eQojIENPTkZJR19HUElPX1hMUCBpcyBub3Qgc2V0CkNP
TkZJR19HUElPX0FNRF9GQ0g9eQpDT05GSUdfR1BJT19JRFQzMjQzWD1tCiMgZW5kIG9mIE1lbW9y
eSBtYXBwZWQgR1BJTyBkcml2ZXJzCgojCiMgSTJDIEdQSU8gZXhwYW5kZXJzCiMKIyBDT05GSUdf
R1BJT19BRFA1NTg4IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19BRE5QIGlzIG5vdCBzZXQKIyBD
T05GSUdfR1BJT19HV19QTEQgaXMgbm90IHNldApDT05GSUdfR1BJT19NQVg3MzAwPW0KQ09ORklH
X0dQSU9fTUFYNzMyWD15CiMgQ09ORklHX0dQSU9fTUFYNzMyWF9JUlEgaXMgbm90IHNldApDT05G
SUdfR1BJT19QQ0E5NTNYPW0KIyBDT05GSUdfR1BJT19QQ0E5NTNYX0lSUSBpcyBub3Qgc2V0CiMg
Q09ORklHX0dQSU9fUENBOTU3MCBpcyBub3Qgc2V0CkNPTkZJR19HUElPX1BDRjg1N1g9eQpDT05G
SUdfR1BJT19UUElDMjgxMD1tCiMgQ09ORklHX0dQSU9fVFM0OTAwIGlzIG5vdCBzZXQKIyBlbmQg
b2YgSTJDIEdQSU8gZXhwYW5kZXJzCgojCiMgTUZEIEdQSU8gZXhwYW5kZXJzCiMKQ09ORklHX0dQ
SU9fQURQNTUyMD15CiMgQ09ORklHX0dQSU9fQVJJWk9OQSBpcyBub3Qgc2V0CkNPTkZJR19HUElP
X0JENzE4MTU9bQpDT05GSUdfR1BJT19CRDcxODI4PW0KQ09ORklHX0dQSU9fQkQ5NTcxTVdWPXkK
IyBDT05GSUdfR1BJT19EQTkwNTIgaXMgbm90IHNldApDT05GSUdfR1BJT19ETE4yPW0KIyBDT05G
SUdfR1BJT19LRU1QTEQgaXMgbm90IHNldAojIENPTkZJR19HUElPX0xQMzk0MyBpcyBub3Qgc2V0
CkNPTkZJR19HUElPX0xQODc1NjU9eQojIENPTkZJR19HUElPX01BWDc3NjIwIGlzIG5vdCBzZXQK
IyBDT05GSUdfR1BJT19QQUxNQVMgaXMgbm90IHNldApDT05GSUdfR1BJT19SQzVUNTgzPXkKQ09O
RklHX0dQSU9fU0wyOENQTEQ9bQpDT05GSUdfR1BJT19TVE1QRT15CkNPTkZJR19HUElPX1RDMzU4
OVg9eQpDT05GSUdfR1BJT19UUFM2NTA4Nj1tCiMgQ09ORklHX0dQSU9fVFBTNjUyMTggaXMgbm90
IHNldAojIENPTkZJR19HUElPX1RQUzY1ODZYIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fVFBTNjU5
MTA9eQpDT05GSUdfR1BJT19UUFM2NTkxMj1tCkNPTkZJR19HUElPX1RRTVg4Nj15CkNPTkZJR19H
UElPX1RXTDQwMzA9bQojIENPTkZJR19HUElPX1RXTDYwNDAgaXMgbm90IHNldAojIENPTkZJR19H
UElPX1dNODM1MCBpcyBub3Qgc2V0CiMgZW5kIG9mIE1GRCBHUElPIGV4cGFuZGVycwoKIwojIFVT
QiBHUElPIGV4cGFuZGVycwojCkNPTkZJR19HUElPX1ZJUEVSQk9BUkQ9bQojIGVuZCBvZiBVU0Ig
R1BJTyBleHBhbmRlcnMKCiMKIyBWaXJ0dWFsIEdQSU8gZHJpdmVycwojCkNPTkZJR19HUElPX0FH
R1JFR0FUT1I9bQpDT05GSUdfR1BJT19NT0NLVVA9bQpDT05GSUdfR1BJT19WSVJUSU89bQojIENP
TkZJR19HUElPX1NJTSBpcyBub3Qgc2V0CiMgZW5kIG9mIFZpcnR1YWwgR1BJTyBkcml2ZXJzCgpD
T05GSUdfVzE9bQoKIwojIDEtd2lyZSBCdXMgTWFzdGVycwojCkNPTkZJR19XMV9NQVNURVJfRFMy
NDkwPW0KIyBDT05GSUdfVzFfTUFTVEVSX0RTMjQ4MiBpcyBub3Qgc2V0CkNPTkZJR19XMV9NQVNU
RVJfTVhDPW0KIyBDT05GSUdfVzFfTUFTVEVSX0RTMVdNIGlzIG5vdCBzZXQKIyBDT05GSUdfVzFf
TUFTVEVSX0dQSU8gaXMgbm90IHNldApDT05GSUdfVzFfTUFTVEVSX1NHST1tCiMgZW5kIG9mIDEt
d2lyZSBCdXMgTWFzdGVycwoKIwojIDEtd2lyZSBTbGF2ZXMKIwpDT05GSUdfVzFfU0xBVkVfVEhF
Uk09bQpDT05GSUdfVzFfU0xBVkVfU01FTT1tCkNPTkZJR19XMV9TTEFWRV9EUzI0MDU9bQpDT05G
SUdfVzFfU0xBVkVfRFMyNDA4PW0KIyBDT05GSUdfVzFfU0xBVkVfRFMyNDA4X1JFQURCQUNLIGlz
IG5vdCBzZXQKQ09ORklHX1cxX1NMQVZFX0RTMjQxMz1tCkNPTkZJR19XMV9TTEFWRV9EUzI0MDY9
bQojIENPTkZJR19XMV9TTEFWRV9EUzI0MjMgaXMgbm90IHNldAojIENPTkZJR19XMV9TTEFWRV9E
UzI4MDUgaXMgbm90IHNldApDT05GSUdfVzFfU0xBVkVfRFMyNDMwPW0KQ09ORklHX1cxX1NMQVZF
X0RTMjQzMT1tCkNPTkZJR19XMV9TTEFWRV9EUzI0MzM9bQojIENPTkZJR19XMV9TTEFWRV9EUzI0
MzNfQ1JDIGlzIG5vdCBzZXQKIyBDT05GSUdfVzFfU0xBVkVfRFMyNDM4IGlzIG5vdCBzZXQKQ09O
RklHX1cxX1NMQVZFX0RTMjUwWD1tCkNPTkZJR19XMV9TTEFWRV9EUzI3ODA9bQpDT05GSUdfVzFf
U0xBVkVfRFMyNzgxPW0KQ09ORklHX1cxX1NMQVZFX0RTMjhFMDQ9bQojIENPTkZJR19XMV9TTEFW
RV9EUzI4RTE3IGlzIG5vdCBzZXQKIyBlbmQgb2YgMS13aXJlIFNsYXZlcwoKQ09ORklHX1BPV0VS
X1JFU0VUPXkKIyBDT05GSUdfUE9XRVJfUkVTRVRfQVMzNzIyIGlzIG5vdCBzZXQKQ09ORklHX1BP
V0VSX1JFU0VUX0FUQzI2MFg9eQpDT05GSUdfUE9XRVJfUkVTRVRfQlJDTUtPTkE9eQojIENPTkZJ
R19QT1dFUl9SRVNFVF9CUkNNU1RCIGlzIG5vdCBzZXQKIyBDT05GSUdfUE9XRVJfUkVTRVRfR0VN
SU5JX1BPV0VST0ZGIGlzIG5vdCBzZXQKQ09ORklHX1BPV0VSX1JFU0VUX0dQSU89eQojIENPTkZJ
R19QT1dFUl9SRVNFVF9HUElPX1JFU1RBUlQgaXMgbm90IHNldAojIENPTkZJR19QT1dFUl9SRVNF
VF9PQ0VMT1RfUkVTRVQgaXMgbm90IHNldApDT05GSUdfUE9XRVJfUkVTRVRfTFRDMjk1Mj15CkNP
TkZJR19QT1dFUl9SRVNFVF9SRUdVTEFUT1I9eQojIENPTkZJR19QT1dFUl9SRVNFVF9SRVNUQVJU
IGlzIG5vdCBzZXQKQ09ORklHX1BPV0VSX1JFU0VUX1RQUzY1MDg2PXkKIyBDT05GSUdfUE9XRVJf
UkVTRVRfS0VZU1RPTkUgaXMgbm90IHNldAojIENPTkZJR19QT1dFUl9SRVNFVF9TWVNDT04gaXMg
bm90IHNldAojIENPTkZJR19QT1dFUl9SRVNFVF9TWVNDT05fUE9XRVJPRkYgaXMgbm90IHNldAoj
IENPTkZJR19QT1dFUl9SRVNFVF9STU9CSUxFIGlzIG5vdCBzZXQKQ09ORklHX1JFQk9PVF9NT0RF
PW0KQ09ORklHX1NZU0NPTl9SRUJPT1RfTU9ERT1tCkNPTkZJR19QT1dFUl9SRVNFVF9TQzI3WFg9
bQojIENPTkZJR19OVk1FTV9SRUJPT1RfTU9ERSBpcyBub3Qgc2V0CkNPTkZJR19QT1dFUl9TVVBQ
TFk9eQpDT05GSUdfUE9XRVJfU1VQUExZX0RFQlVHPXkKIyBDT05GSUdfUERBX1BPV0VSIGlzIG5v
dCBzZXQKIyBDT05GSUdfR0VORVJJQ19BRENfQkFUVEVSWSBpcyBub3Qgc2V0CkNPTkZJR19XTTgz
NTBfUE9XRVI9bQojIENPTkZJR19URVNUX1BPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVS
WV84OFBNODYwWCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQURQNTA2MSBpcyBub3Qgc2V0
CiMgQ09ORklHX0JBVFRFUllfQUNUODk0NUEgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0NX
MjAxNSBpcyBub3Qgc2V0CkNPTkZJR19CQVRURVJZX0RTMjc2MD1tCiMgQ09ORklHX0JBVFRFUllf
RFMyNzgwIGlzIG5vdCBzZXQKQ09ORklHX0JBVFRFUllfRFMyNzgxPW0KIyBDT05GSUdfQkFUVEVS
WV9EUzI3ODIgaXMgbm90IHNldApDT05GSUdfQkFUVEVSWV9MRUdPX0VWMz1tCiMgQ09ORklHX0JB
VFRFUllfSU5HRU5JQyBpcyBub3Qgc2V0CkNPTkZJR19CQVRURVJZX1NCUz15CkNPTkZJR19DSEFS
R0VSX1NCUz1tCiMgQ09ORklHX01BTkFHRVJfU0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVS
WV9CUTI3WFhYIGlzIG5vdCBzZXQKQ09ORklHX0JBVFRFUllfREE5MDUyPXkKQ09ORklHX0NIQVJH
RVJfREE5MTUwPW0KIyBDT05GSUdfQkFUVEVSWV9EQTkxNTAgaXMgbm90IHNldApDT05GSUdfQ0hB
UkdFUl9BWFAyMFg9bQojIENPTkZJR19CQVRURVJZX0FYUDIwWCBpcyBub3Qgc2V0CkNPTkZJR19B
WFAyMFhfUE9XRVI9bQojIENPTkZJR19CQVRURVJZX01BWDE3MDQwIGlzIG5vdCBzZXQKQ09ORklH
X0JBVFRFUllfTUFYMTcwNDI9bQpDT05GSUdfQkFUVEVSWV9NQVgxNzIxWD1tCiMgQ09ORklHX0JB
VFRFUllfVFdMNDAzMF9NQURDIGlzIG5vdCBzZXQKQ09ORklHX0JBVFRFUllfUlg1MT1tCiMgQ09O
RklHX0NIQVJHRVJfSVNQMTcwNCBpcyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX01BWDg5MDM9eQpD
T05GSUdfQ0hBUkdFUl9UV0w0MDMwPW0KQ09ORklHX0NIQVJHRVJfTFA4NzI3PXkKQ09ORklHX0NI
QVJHRVJfTFA4Nzg4PW0KIyBDT05GSUdfQ0hBUkdFUl9HUElPIGlzIG5vdCBzZXQKQ09ORklHX0NI
QVJHRVJfTUFOQUdFUj15CkNPTkZJR19DSEFSR0VSX0xUMzY1MT15CiMgQ09ORklHX0NIQVJHRVJf
TFRDNDE2MkwgaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9NQVgxNDU3Nz1tCkNPTkZJR19DSEFS
R0VSX0RFVEVDVE9SX01BWDE0NjU2PXkKQ09ORklHX0NIQVJHRVJfTUFYNzc2OTM9bQpDT05GSUdf
Q0hBUkdFUl9NQVg3Nzk3Nj1tCiMgQ09ORklHX0NIQVJHRVJfTUFYODk5OCBpcyBub3Qgc2V0CkNP
TkZJR19DSEFSR0VSX01UNjM2MD1tCkNPTkZJR19DSEFSR0VSX1FDT01fU01CQj15CkNPTkZJR19D
SEFSR0VSX0JRMjQxNVg9eQojIENPTkZJR19DSEFSR0VSX0JRMjQxOTAgaXMgbm90IHNldAojIENP
TkZJR19DSEFSR0VSX0JRMjQyNTcgaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9CUTI0NzM1PW0K
Q09ORklHX0NIQVJHRVJfQlEyNTE1WD1tCkNPTkZJR19DSEFSR0VSX0JRMjU4OTA9bQpDT05GSUdf
Q0hBUkdFUl9CUTI1OTgwPXkKIyBDT05GSUdfQ0hBUkdFUl9CUTI1NlhYIGlzIG5vdCBzZXQKQ09O
RklHX0NIQVJHRVJfU01CMzQ3PW0KQ09ORklHX0JBVFRFUllfR0FVR0VfTFRDMjk0MT15CkNPTkZJ
R19CQVRURVJZX0dPTERGSVNIPW0KQ09ORklHX0JBVFRFUllfUlQ1MDMzPW0KIyBDT05GSUdfQ0hB
UkdFUl9SVDk0NTUgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX1NDMjczMSBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZVRUxfR0FVR0VfU0MyN1hYIGlzIG5vdCBzZXQKQ09ORklHX0NIQVJHRVJfVUNT
MTAwMj15CiMgQ09ORklHX0NIQVJHRVJfQkQ5OTk1NCBpcyBub3Qgc2V0CkNPTkZJR19CQVRURVJZ
X0FDRVJfQTUwMD1tCiMgQ09ORklHX0hXTU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhFUk1BTCBp
cyBub3Qgc2V0CkNPTkZJR19XQVRDSERPRz15CkNPTkZJR19XQVRDSERPR19DT1JFPXkKIyBDT05G
SUdfV0FUQ0hET0dfTk9XQVlPVVQgaXMgbm90IHNldApDT05GSUdfV0FUQ0hET0dfSEFORExFX0JP
T1RfRU5BQkxFRD15CkNPTkZJR19XQVRDSERPR19PUEVOX1RJTUVPVVQ9MApDT05GSUdfV0FUQ0hE
T0dfU1lTRlM9eQojIENPTkZJR19XQVRDSERPR19IUlRJTUVSX1BSRVRJTUVPVVQgaXMgbm90IHNl
dAoKIwojIFdhdGNoZG9nIFByZXRpbWVvdXQgR292ZXJub3JzCiMKIyBDT05GSUdfV0FUQ0hET0df
UFJFVElNRU9VVF9HT1YgaXMgbm90IHNldAoKIwojIFdhdGNoZG9nIERldmljZSBEcml2ZXJzCiMK
Q09ORklHX1NPRlRfV0FUQ0hET0c9eQpDT05GSUdfQkQ5NTdYTVVGX1dBVENIRE9HPW0KQ09ORklH
X0RBOTA1Ml9XQVRDSERPRz15CkNPTkZJR19EQTkwNTVfV0FUQ0hET0c9eQojIENPTkZJR19EQTkw
NjNfV0FUQ0hET0cgaXMgbm90IHNldApDT05GSUdfREE5MDYyX1dBVENIRE9HPW0KIyBDT05GSUdf
R1BJT19XQVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJR19NRU5GMjFCTUNfV0FUQ0hET0c9bQpDT05G
SUdfTUVOWjA2OV9XQVRDSERPRz15CiMgQ09ORklHX1dNODM1MF9XQVRDSERPRyBpcyBub3Qgc2V0
CiMgQ09ORklHX1hJTElOWF9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1pJSVJBVkVfV0FU
Q0hET0cgaXMgbm90IHNldApDT05GSUdfU0wyOENQTERfV0FUQ0hET0c9bQojIENPTkZJR19BUk1B
REFfMzdYWF9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0FTTTkyNjBfV0FUQ0hET0cgaXMg
bm90IHNldApDT05GSUdfQVQ5MVJNOTIwMF9XQVRDSERPRz15CkNPTkZJR19BVDkxU0FNOVhfV0FU
Q0hET0c9eQpDT05GSUdfU0FNQTVENF9XQVRDSERPRz1tCiMgQ09ORklHX0NBREVOQ0VfV0FUQ0hE
T0cgaXMgbm90IHNldApDT05GSUdfRlRXRFQwMTBfV0FUQ0hET0c9eQojIENPTkZJR19TM0MyNDEw
X1dBVENIRE9HIGlzIG5vdCBzZXQKQ09ORklHX0RXX1dBVENIRE9HPW0KQ09ORklHX0VQOTNYWF9X
QVRDSERPRz1tCkNPTkZJR19PTUFQX1dBVENIRE9HPXkKQ09ORklHX1BOWDQwMDhfV0FUQ0hET0c9
bQpDT05GSUdfREFWSU5DSV9XQVRDSERPRz15CkNPTkZJR19LM19SVElfV0FUQ0hET0c9bQojIENP
TkZJR19STjVUNjE4X1dBVENIRE9HIGlzIG5vdCBzZXQKQ09ORklHX1NVTlhJX1dBVENIRE9HPW0K
Q09ORklHX05QQ003WFhfV0FUQ0hET0c9bQpDT05GSUdfVFdMNDAzMF9XQVRDSERPRz15CkNPTkZJ
R19TVE1QM1hYWF9SVENfV0FUQ0hET0c9eQpDT05GSUdfVFM0ODAwX1dBVENIRE9HPXkKQ09ORklH
X1RTNzJYWF9XQVRDSERPRz15CiMgQ09ORklHX01BWDYzWFhfV0FUQ0hET0cgaXMgbm90IHNldApD
T05GSUdfTUFYNzc2MjBfV0FUQ0hET0c9bQpDT05GSUdfSU1YMl9XRFQ9bQpDT05GSUdfSU1YN1VM
UF9XRFQ9bQpDT05GSUdfUkVUVV9XQVRDSERPRz1tCkNPTkZJR19NT1hBUlRfV0RUPXkKQ09ORklH
X1NUX0xQQ19XQVRDSERPRz1tCiMgQ09ORklHX1RFR1JBX1dBVENIRE9HIGlzIG5vdCBzZXQKQ09O
RklHX1FDT01fV0RUPXkKQ09ORklHX01FU09OX0dYQkJfV0FUQ0hET0c9eQpDT05GSUdfTUVTT05f
V0FUQ0hET0c9bQpDT05GSUdfTUVESUFURUtfV0FUQ0hET0c9bQojIENPTkZJR19ESUdJQ09MT1Jf
V0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19MUEMxOFhYX1dBVENIRE9HIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkVORVNBU19XRFQgaXMgbm90IHNldApDT05GSUdfUkVORVNBU19SWkFXRFQ9eQpD
T05GSUdfUkVORVNBU19SWkcyTFdEVD1tCkNPTkZJR19BU1BFRURfV0FUQ0hET0c9eQpDT05GSUdf
VU5JUEhJRVJfV0FUQ0hET0c9eQpDT05GSUdfUlREMTE5WF9XQVRDSERPRz15CiMgQ09ORklHX1JF
QUxURUtfT1RUT19XRFQgaXMgbm90IHNldApDT05GSUdfU1BSRF9XQVRDSERPRz1tCkNPTkZJR19Q
TTg5MTZfV0FUQ0hET0c9bQojIENPTkZJR19WSVNDT05USV9XQVRDSERPRyBpcyBub3Qgc2V0CiMg
Q09ORklHX01TQzMxM0VfV0FUQ0hET0cgaXMgbm90IHNldApDT05GSUdfQVBQTEVfV0FUQ0hET0c9
eQojIENPTkZJR19TQzUyMF9XRFQgaXMgbm90IHNldAojIENPTkZJR19LRU1QTERfV0RUIGlzIG5v
dCBzZXQKQ09ORklHX0JDTTQ3WFhfV0RUPW0KIyBDT05GSUdfQkNNMjgzNV9XRFQgaXMgbm90IHNl
dApDT05GSUdfQkNNX0tPTkFfV0RUPXkKQ09ORklHX0JDTV9LT05BX1dEVF9ERUJVRz15CkNPTkZJ
R19CQ003MDM4X1dEVD15CkNPTkZJR19JTUdQRENfV0RUPXkKQ09ORklHX01QQzUyMDBfV0RUPXkK
IyBDT05GSUdfTUVOX0EyMV9XRFQgaXMgbm90IHNldApDT05GSUdfVU1MX1dBVENIRE9HPW0KCiMK
IyBVU0ItYmFzZWQgV2F0Y2hkb2cgQ2FyZHMKIwpDT05GSUdfVVNCUENXQVRDSERPRz1tCkNPTkZJ
R19TU0JfUE9TU0lCTEU9eQpDT05GSUdfU1NCPW0KQ09ORklHX1NTQl9TUFJPTT15CkNPTkZJR19T
U0JfUENNQ0lBSE9TVF9QT1NTSUJMRT15CkNPTkZJR19TU0JfUENNQ0lBSE9TVD15CkNPTkZJR19T
U0JfU0RJT0hPU1RfUE9TU0lCTEU9eQpDT05GSUdfU1NCX1NESU9IT1NUPXkKIyBDT05GSUdfU1NC
X0hPU1RfU09DIGlzIG5vdCBzZXQKIyBDT05GSUdfU1NCX0RSSVZFUl9HUElPIGlzIG5vdCBzZXQK
Q09ORklHX0JDTUFfUE9TU0lCTEU9eQpDT05GSUdfQkNNQT15CkNPTkZJR19CQ01BX0hPU1RfU09D
PXkKIyBDT05GSUdfQkNNQV9EUklWRVJfTUlQUyBpcyBub3Qgc2V0CkNPTkZJR19CQ01BX1NGTEFT
SD15CkNPTkZJR19CQ01BX0RSSVZFUl9HTUFDX0NNTj15CiMgQ09ORklHX0JDTUFfRFJJVkVSX0dQ
SU8gaXMgbm90IHNldAojIENPTkZJR19CQ01BX0RFQlVHIGlzIG5vdCBzZXQKCiMKIyBNdWx0aWZ1
bmN0aW9uIGRldmljZSBkcml2ZXJzCiMKQ09ORklHX01GRF9DT1JFPXkKIyBDT05GSUdfTUZEX0FD
VDg5NDVBIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NVTjRJX0dQQURDIGlzIG5vdCBzZXQKQ09O
RklHX01GRF9BUzM3MTE9eQpDT05GSUdfTUZEX0FTMzcyMj15CkNPTkZJR19QTUlDX0FEUDU1MjA9
eQpDT05GSUdfTUZEX0FBVDI4NzBfQ09SRT15CkNPTkZJR19NRkRfQVQ5MV9VU0FSVD1tCiMgQ09O
RklHX01GRF9BVE1FTF9GTEVYQ09NIGlzIG5vdCBzZXQKQ09ORklHX01GRF9BVE1FTF9ITENEQz15
CkNPTkZJR19NRkRfQVRNRUxfU01DPXkKIyBDT05GSUdfTUZEX0JDTTU5MFhYIGlzIG5vdCBzZXQK
Q09ORklHX01GRF9CRDk1NzFNV1Y9eQpDT05GSUdfTUZEX0FYUDIwWD1tCkNPTkZJR19NRkRfQVhQ
MjBYX0kyQz1tCiMgQ09ORklHX01GRF9NQURFUkEgaXMgbm90IHNldAojIENPTkZJR19NRkRfQVNJ
QzMgaXMgbm90IHNldAojIENPTkZJR19QTUlDX0RBOTAzWCBpcyBub3Qgc2V0CkNPTkZJR19QTUlD
X0RBOTA1Mj15CkNPTkZJR19NRkRfREE5MDUyX0kyQz15CiMgQ09ORklHX01GRF9EQTkwNTUgaXMg
bm90IHNldApDT05GSUdfTUZEX0RBOTA2Mj15CiMgQ09ORklHX01GRF9EQTkwNjMgaXMgbm90IHNl
dApDT05GSUdfTUZEX0RBOTE1MD15CkNPTkZJR19NRkRfRExOMj1tCiMgQ09ORklHX01GRF9FTkVf
S0IzOTMwIGlzIG5vdCBzZXQKQ09ORklHX01GRF9FWFlOT1NfTFBBU1M9bQpDT05GSUdfTUZEX0dB
VEVXT1JLU19HU0M9bQojIENPTkZJR19NRkRfTUMxM1hYWF9JMkMgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfTVAyNjI5IGlzIG5vdCBzZXQKQ09ORklHX01GRF9NWFNfTFJBREM9bQpDT05GSUdfTUZE
X01YMjVfVFNBREM9bQpDT05GSUdfTUZEX0hJNjQyMV9QTUlDPW0KQ09ORklHX01GRF9ISTY0MjFf
U1BNST1tCiMgQ09ORklHX01GRF9ISTY1NVhfUE1JQyBpcyBub3Qgc2V0CiMgQ09ORklHX0hUQ19Q
QVNJQzMgaXMgbm90IHNldAojIENPTkZJR19IVENfSTJDUExEIGlzIG5vdCBzZXQKQ09ORklHX01G
RF9JUVM2Mlg9eQpDT05GSUdfTUZEX0tFTVBMRD1tCkNPTkZJR19NRkRfODhQTTgwMD1tCkNPTkZJ
R19NRkRfODhQTTgwNT1tCkNPTkZJR19NRkRfODhQTTg2MFg9eQpDT05GSUdfTUZEX01BWDE0NTc3
PW0KQ09ORklHX01GRF9NQVg3NzYyMD15CiMgQ09ORklHX01GRF9NQVg3NzY1MCBpcyBub3Qgc2V0
CkNPTkZJR19NRkRfTUFYNzc2ODY9bQpDT05GSUdfTUZEX01BWDc3NjkzPW0KIyBDT05GSUdfTUZE
X01BWDc3ODQzIGlzIG5vdCBzZXQKQ09ORklHX01GRF9NQVg4OTA3PXkKIyBDT05GSUdfTUZEX01B
WDg5MjUgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYODk5NyBpcyBub3Qgc2V0CkNPTkZJR19N
RkRfTUFYODk5OD15CkNPTkZJR19NRkRfTVQ2MzYwPW0KIyBDT05GSUdfTUZEX01UNjM5NyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9NRU5GMjFCTUMgaXMgbm90IHNldApDT05GSUdfTUZEX1ZJUEVS
Qk9BUkQ9bQojIENPTkZJR19NRkRfTlRYRUMgaXMgbm90IHNldApDT05GSUdfTUZEX1JFVFU9eQoj
IENPTkZJR19NRkRfUENGNTA2MzMgaXMgbm90IHNldApDT05GSUdfTUZEX1BNOFhYWD15CkNPTkZJ
R19NRkRfU1BNSV9QTUlDPW0KQ09ORklHX01GRF9SVDQ4MzE9eQojIENPTkZJR19NRkRfUlQ1MDMz
IGlzIG5vdCBzZXQKQ09ORklHX01GRF9SQzVUNTgzPXkKIyBDT05GSUdfTUZEX1JLODA4IGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX1JONVQ2MTggaXMgbm90IHNldAojIENPTkZJR19NRkRfU0VDX0NP
UkUgaXMgbm90IHNldAojIENPTkZJR19NRkRfU0k0NzZYX0NPUkUgaXMgbm90IHNldApDT05GSUdf
TUZEX1NJTVBMRV9NRkRfSTJDPXkKQ09ORklHX01GRF9TTDI4Q1BMRD15CiMgQ09ORklHX01GRF9T
TTUwMSBpcyBub3Qgc2V0CkNPTkZJR19NRkRfU0tZODE0NTI9eQpDT05GSUdfQUJYNTAwX0NPUkU9
eQpDT05GSUdfTUZEX1NUTVBFPXkKCiMKIyBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNUEUgSW50ZXJm
YWNlIERyaXZlcnMKIwpDT05GSUdfU1RNUEVfSTJDPXkKIyBlbmQgb2YgU1RNaWNyb2VsZWN0cm9u
aWNzIFNUTVBFIEludGVyZmFjZSBEcml2ZXJzCgpDT05GSUdfTUZEX1NVTjZJX1BSQ009eQpDT05G
SUdfTUZEX1NZU0NPTj15CiMgQ09ORklHX01GRF9USV9BTTMzNVhfVFNDQURDIGlzIG5vdCBzZXQK
Q09ORklHX01GRF9MUDM5NDM9bQpDT05GSUdfTUZEX0xQODc4OD15CkNPTkZJR19NRkRfVElfTE1V
PW0KQ09ORklHX01GRF9QQUxNQVM9eQpDT05GSUdfVFBTNjEwNVg9bQpDT05GSUdfVFBTNjUwMTA9
bQojIENPTkZJR19UUFM2NTA3WCBpcyBub3Qgc2V0CkNPTkZJR19NRkRfVFBTNjUwODY9eQojIENP
TkZJR19NRkRfVFBTNjUwOTAgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjUyMTcgaXMgbm90
IHNldAojIENPTkZJR19NRkRfVElfTFA4NzNYIGlzIG5vdCBzZXQKQ09ORklHX01GRF9USV9MUDg3
NTY1PXkKQ09ORklHX01GRF9UUFM2NTIxOD15CkNPTkZJR19NRkRfVFBTNjU4Nlg9eQpDT05GSUdf
TUZEX1RQUzY1OTEwPXkKQ09ORklHX01GRF9UUFM2NTkxMj1tCkNPTkZJR19NRkRfVFBTNjU5MTJf
STJDPW0KQ09ORklHX1RXTDQwMzBfQ09SRT15CiMgQ09ORklHX01GRF9UV0w0MDMwX0FVRElPIGlz
IG5vdCBzZXQKQ09ORklHX1RXTDYwNDBfQ09SRT15CiMgQ09ORklHX01GRF9XTDEyNzNfQ09SRSBp
cyBub3Qgc2V0CkNPTkZJR19NRkRfTE0zNTMzPW0KQ09ORklHX01GRF9UQzM1ODlYPXkKIyBDT05G
SUdfTUZEX1RRTVg4NiBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MT0NITkFHQVIgaXMgbm90IHNl
dApDT05GSUdfTUZEX0FSSVpPTkE9eQpDT05GSUdfTUZEX0FSSVpPTkFfSTJDPXkKQ09ORklHX01G
RF9DUzQ3TDI0PXkKQ09ORklHX01GRF9XTTUxMDI9eQpDT05GSUdfTUZEX1dNNTExMD15CkNPTkZJ
R19NRkRfV004OTk3PXkKQ09ORklHX01GRF9XTTg5OTg9eQpDT05GSUdfTUZEX1dNODQwMD15CiMg
Q09ORklHX01GRF9XTTgzMVhfSTJDIGlzIG5vdCBzZXQKQ09ORklHX01GRF9XTTgzNTA9eQpDT05G
SUdfTUZEX1dNODM1MF9JMkM9eQojIENPTkZJR19NRkRfV004OTk0IGlzIG5vdCBzZXQKQ09ORklH
X01GRF9TVFc0ODFYPXkKIyBDT05GSUdfTUZEX1JPSE1fQkQ3MThYWCBpcyBub3Qgc2V0CkNPTkZJ
R19NRkRfUk9ITV9CRDcxODI4PXkKQ09ORklHX01GRF9ST0hNX0JEOTU3WE1VRj1tCkNPTkZJR19N
RkRfU1RNMzJfTFBUSU1FUj15CkNPTkZJR19NRkRfU1RNMzJfVElNRVJTPXkKIyBDT05GSUdfTUZE
X1NUUE1JQzEgaXMgbm90IHNldApDT05GSUdfTUZEX1NUTUZYPXkKQ09ORklHX01GRF9BVEMyNjBY
PXkKQ09ORklHX01GRF9BVEMyNjBYX0kyQz15CkNPTkZJR19NRkRfS0hBREFTX01DVT1tCkNPTkZJ
R19NRkRfQUNFUl9BNTAwX0VDPW0KIyBDT05GSUdfTUZEX1FDT01fUE04MDA4IGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX1JTTVVfSTJDIGlzIG5vdCBzZXQKIyBlbmQgb2YgTXVsdGlmdW5jdGlvbiBk
ZXZpY2UgZHJpdmVycwoKQ09ORklHX1JFR1VMQVRPUj15CkNPTkZJR19SRUdVTEFUT1JfREVCVUc9
eQpDT05GSUdfUkVHVUxBVE9SX0ZJWEVEX1ZPTFRBR0U9eQpDT05GSUdfUkVHVUxBVE9SX1ZJUlRV
QUxfQ09OU1VNRVI9eQojIENPTkZJR19SRUdVTEFUT1JfVVNFUlNQQUNFX0NPTlNVTUVSIGlzIG5v
dCBzZXQKQ09ORklHX1JFR1VMQVRPUl84OFBHODZYPXkKQ09ORklHX1JFR1VMQVRPUl84OFBNODAw
PW0KQ09ORklHX1JFR1VMQVRPUl84OFBNODYwNz1tCiMgQ09ORklHX1JFR1VMQVRPUl9BQ1Q4ODY1
IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0FENTM5OCBpcyBub3Qgc2V0CkNPTkZJR19S
RUdVTEFUT1JfQU5BVE9QPW0KQ09ORklHX1JFR1VMQVRPUl9BQVQyODcwPW0KIyBDT05GSUdfUkVH
VUxBVE9SX0FTMzcxMSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfQVMzNzIyPXkKQ09ORklH
X1JFR1VMQVRPUl9BVEMyNjBYPW0KIyBDT05GSUdfUkVHVUxBVE9SX0FYUDIwWCBpcyBub3Qgc2V0
CiMgQ09ORklHX1JFR1VMQVRPUl9CRDcxODE1IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9S
X0JENzE4MjggaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfQkQ5NTcxTVdWIGlzIG5vdCBz
ZXQKQ09ORklHX1JFR1VMQVRPUl9CRDk1N1hNVUY9bQpDT05GSUdfUkVHVUxBVE9SX0RBOTA1Mj15
CkNPTkZJR19SRUdVTEFUT1JfREE5MDYyPW0KQ09ORklHX1JFR1VMQVRPUl9EQTkxMjE9bQojIENP
TkZJR19SRUdVTEFUT1JfREE5MjEwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0RBOTIx
MSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfRkFONTM1NTU9eQojIENPTkZJR19SRUdVTEFU
T1JfRkFONTM4ODAgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX0dQSU89eQpDT05GSUdfUkVH
VUxBVE9SX0hJNjQyMT1tCiMgQ09ORklHX1JFR1VMQVRPUl9ISTY0MjFWNTMwIGlzIG5vdCBzZXQK
Q09ORklHX1JFR1VMQVRPUl9ISTY0MjFWNjAwPW0KQ09ORklHX1JFR1VMQVRPUl9JU0w5MzA1PW0K
Q09ORklHX1JFR1VMQVRPUl9JU0w2MjcxQT15CiMgQ09ORklHX1JFR1VMQVRPUl9MTTM2M1ggaXMg
bm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTFAzOTcxIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VM
QVRPUl9MUDM5NzI9eQpDT05GSUdfUkVHVUxBVE9SX0xQODcyWD1tCkNPTkZJR19SRUdVTEFUT1Jf
TFA4NzU1PXkKIyBDT05GSUdfUkVHVUxBVE9SX0xQODc1NjUgaXMgbm90IHNldApDT05GSUdfUkVH
VUxBVE9SX0xQODc4OD1tCkNPTkZJR19SRUdVTEFUT1JfTFRDMzU4OT15CiMgQ09ORklHX1JFR1VM
QVRPUl9MVEMzNjc2IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX01BWDE0NTc3IGlzIG5v
dCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX01BWDE1ODYgaXMgbm90IHNldApDT05GSUdfUkVHVUxB
VE9SX01BWDc3NjIwPXkKIyBDT05GSUdfUkVHVUxBVE9SX01BWDc3NjUwIGlzIG5vdCBzZXQKQ09O
RklHX1JFR1VMQVRPUl9NQVg4NjQ5PW0KIyBDT05GSUdfUkVHVUxBVE9SX01BWDg2NjAgaXMgbm90
IHNldApDT05GSUdfUkVHVUxBVE9SX01BWDg4OTM9eQpDT05GSUdfUkVHVUxBVE9SX01BWDg5MDc9
eQojIENPTkZJR19SRUdVTEFUT1JfTUFYODk1MiBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1Jf
TUFYODk5OD15CkNPTkZJR19SRUdVTEFUT1JfTUFYMjAwODY9eQpDT05GSUdfUkVHVUxBVE9SX01B
WDc3Njg2PXkKQ09ORklHX1JFR1VMQVRPUl9NQVg3NzY5Mz15CkNPTkZJR19SRUdVTEFUT1JfTUFY
Nzc4MDI9bQpDT05GSUdfUkVHVUxBVE9SX01BWDc3ODI2PXkKIyBDT05GSUdfUkVHVUxBVE9SX01D
UDE2NTAyIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9NUDU0MTY9eQpDT05GSUdfUkVHVUxB
VE9SX01QODg1OT1tCkNPTkZJR19SRUdVTEFUT1JfTVA4ODZYPW0KQ09ORklHX1JFR1VMQVRPUl9N
UFE3OTIwPXkKQ09ORklHX1JFR1VMQVRPUl9NVDYzMTE9bQpDT05GSUdfUkVHVUxBVE9SX01UNjMx
NT1tCkNPTkZJR19SRUdVTEFUT1JfTVQ2MzYwPW0KQ09ORklHX1JFR1VMQVRPUl9NVDYzODA9bQoj
IENPTkZJR19SRUdVTEFUT1JfUEFMTUFTIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9QQklB
Uz15CkNPTkZJR19SRUdVTEFUT1JfUENBOTQ1MD15CkNPTkZJR19SRUdVTEFUT1JfUEY4WDAwPW0K
Q09ORklHX1JFR1VMQVRPUl9QRlVaRTEwMD15CkNPTkZJR19SRUdVTEFUT1JfUFY4ODA2MD1tCkNP
TkZJR19SRUdVTEFUT1JfUFY4ODA4MD1tCkNPTkZJR19SRUdVTEFUT1JfUFY4ODA5MD1tCiMgQ09O
RklHX1JFR1VMQVRPUl9RQ09NX1JQTUggaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1FDT01f
U1BNST15CiMgQ09ORklHX1JFR1VMQVRPUl9RQ09NX1VTQl9WQlVTIGlzIG5vdCBzZXQKQ09ORklH
X1JFR1VMQVRPUl9SQVNQQkVSUllQSV9UT1VDSFNDUkVFTl9BVFRJTlk9bQojIENPTkZJR19SRUdV
TEFUT1JfUkM1VDU4MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9SVDQ4MDEgaXMgbm90
IHNldApDT05GSUdfUkVHVUxBVE9SX1JUNDgzMT15CkNPTkZJR19SRUdVTEFUT1JfUlQ2MTYwPXkK
Q09ORklHX1JFR1VMQVRPUl9SVDYyNDU9eQojIENPTkZJR19SRUdVTEFUT1JfUlRRMjEzNCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9SVE1WMjAgaXMgbm90IHNldAojIENPTkZJR19SRUdV
TEFUT1JfUlRRNjc1MiBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfUzJNUEEwMT15CkNPTkZJ
R19SRUdVTEFUT1JfUzJNUFMxMT1tCkNPTkZJR19SRUdVTEFUT1JfUzVNODc2Nz1tCkNPTkZJR19S
RUdVTEFUT1JfU0MyNzMxPW0KQ09ORklHX1JFR1VMQVRPUl9TS1k4MTQ1Mj1tCkNPTkZJR19SRUdV
TEFUT1JfU0xHNTEwMDA9eQojIENPTkZJR19SRUdVTEFUT1JfU1RNMzJfQk9PU1RFUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1JFR1VMQVRPUl9TVE0zMl9WUkVGQlVGIGlzIG5vdCBzZXQKQ09ORklHX1JF
R1VMQVRPUl9TVE0zMl9QV1I9eQojIENPTkZJR19SRUdVTEFUT1JfVElfQUJCIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkVHVUxBVE9SX1NUVzQ4MVhfVk1NQyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VM
QVRPUl9TWTgxMDZBIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9TWTg4MjRYPXkKQ09ORklH
X1JFR1VMQVRPUl9TWTg4MjdOPW0KQ09ORklHX1JFR1VMQVRPUl9UUFM1MTYzMj1tCkNPTkZJR19S
RUdVTEFUT1JfVFBTNjEwNVg9bQojIENPTkZJR19SRUdVTEFUT1JfVFBTNjIzNjAgaXMgbm90IHNl
dApDT05GSUdfUkVHVUxBVE9SX1RQUzY1MDIzPXkKQ09ORklHX1JFR1VMQVRPUl9UUFM2NTA3WD15
CiMgQ09ORklHX1JFR1VMQVRPUl9UUFM2NTA4NiBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1Jf
VFBTNjUxMzI9eQpDT05GSUdfUkVHVUxBVE9SX1RQUzY1MjE4PXkKQ09ORklHX1JFR1VMQVRPUl9U
UFM2NTg2WD15CkNPTkZJR19SRUdVTEFUT1JfVFBTNjU5MTA9eQojIENPTkZJR19SRUdVTEFUT1Jf
VFBTNjU5MTIgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1RQUzY4NDcwPXkKIyBDT05GSUdf
UkVHVUxBVE9SX1RXTDQwMzAgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1VOSVBISUVSPXkK
Q09ORklHX1JFR1VMQVRPUl9WQ1RSTD1tCiMgQ09ORklHX1JFR1VMQVRPUl9XTTgzNTAgaXMgbm90
IHNldApDT05GSUdfUkVHVUxBVE9SX1dNODQwMD1tCkNPTkZJR19SRUdVTEFUT1JfUUNPTV9MQUJJ
QkI9eQpDT05GSUdfQ0VDX0NPUkU9bQoKIwojIENFQyBzdXBwb3J0CiMKIyBDT05GSUdfTUVESUFf
Q0VDX1NVUFBPUlQgaXMgbm90IHNldAojIGVuZCBvZiBDRUMgc3VwcG9ydAoKQ09ORklHX01FRElB
X1NVUFBPUlQ9bQpDT05GSUdfTUVESUFfU1VQUE9SVF9GSUxURVI9eQojIENPTkZJR19NRURJQV9T
VUJEUlZfQVVUT1NFTEVDVCBpcyBub3Qgc2V0CgojCiMgTWVkaWEgZGV2aWNlIHR5cGVzCiMKIyBD
T05GSUdfTUVESUFfQ0FNRVJBX1NVUFBPUlQgaXMgbm90IHNldAojIENPTkZJR19NRURJQV9BTkFM
T0dfVFZfU1VQUE9SVCBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9ESUdJVEFMX1RWX1NVUFBPUlQ9
eQojIENPTkZJR19NRURJQV9SQURJT19TVVBQT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVESUFf
U0RSX1NVUFBPUlQgaXMgbm90IHNldApDT05GSUdfTUVESUFfUExBVEZPUk1fU1VQUE9SVD15CkNP
TkZJR19NRURJQV9URVNUX1NVUFBPUlQ9eQojIGVuZCBvZiBNZWRpYSBkZXZpY2UgdHlwZXMKCkNP
TkZJR19WSURFT19ERVY9bQpDT05GSUdfTUVESUFfQ09OVFJPTExFUj15CkNPTkZJR19EVkJfQ09S
RT1tCgojCiMgVmlkZW80TGludXggb3B0aW9ucwojCkNPTkZJR19WSURFT19WNEwyPW0KQ09ORklH
X1ZJREVPX1Y0TDJfSTJDPXkKQ09ORklHX1ZJREVPX1Y0TDJfU1VCREVWX0FQST15CiMgQ09ORklH
X1ZJREVPX0FEVl9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0ZJWEVEX01JTk9SX1JB
TkdFUyBpcyBub3Qgc2V0CkNPTkZJR19WNEwyX0pQRUdfSEVMUEVSPW0KQ09ORklHX1Y0TDJfTUVN
Mk1FTV9ERVY9bQpDT05GSUdfVjRMMl9GV05PREU9bQpDT05GSUdfVjRMMl9BU1lOQz1tCkNPTkZJ
R19WSURFT0JVRl9HRU49bQpDT05GSUdfVklERU9CVUZfRE1BX0NPTlRJRz1tCiMgZW5kIG9mIFZp
ZGVvNExpbnV4IG9wdGlvbnMKCiMKIyBNZWRpYSBjb250cm9sbGVyIG9wdGlvbnMKIwojIENPTkZJ
R19NRURJQV9DT05UUk9MTEVSX0RWQiBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lZGlhIGNvbnRyb2xs
ZXIgb3B0aW9ucwoKIwojIERpZ2l0YWwgVFYgb3B0aW9ucwojCiMgQ09ORklHX0RWQl9NTUFQIGlz
IG5vdCBzZXQKQ09ORklHX0RWQl9NQVhfQURBUFRFUlM9MTYKQ09ORklHX0RWQl9EWU5BTUlDX01J
Tk9SUz15CiMgQ09ORklHX0RWQl9ERU1VWF9TRUNUSU9OX0xPU1NfTE9HIGlzIG5vdCBzZXQKQ09O
RklHX0RWQl9VTEVfREVCVUc9eQojIGVuZCBvZiBEaWdpdGFsIFRWIG9wdGlvbnMKCiMKIyBNZWRp
YSBkcml2ZXJzCiMKCiMKIyBEcml2ZXJzIGZpbHRlcmVkIGFzIHNlbGVjdGVkIGF0ICdGaWx0ZXIg
bWVkaWEgZHJpdmVycycKIwoKIwojIE1lZGlhIGRyaXZlcnMKIwojIENPTkZJR19NRURJQV9VU0Jf
U1VQUE9SVCBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9QTEFURk9STV9EUklWRVJTPXkKQ09ORklH
X1Y0TF9QTEFURk9STV9EUklWRVJTPXkKIyBDT05GSUdfRFZCX1BMQVRGT1JNX0RSSVZFUlMgaXMg
bm90IHNldApDT05GSUdfVjRMX01FTTJNRU1fRFJJVkVSUz15CkNPTkZJR19WSURFT19NRU0yTUVN
X0RFSU5URVJMQUNFPW0KIyBDT05GSUdfVklERU9fTVVYIGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fQUxMRUdST19EVlQgaXMgbm90IHNldApDT05GSUdfVklERU9fQU00MzdYX1ZQRkU9bQojIENP
TkZJR19WSURFT19NRVNPTl9HRTJEIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQU1QSElPTl9W
UFUgaXMgbm90IHNldApDT05GSUdfVklERU9fQVNQRUVEPW0KIyBDT05GSUdfVklERU9fQVRNRUxf
SVNDIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQVRNRUxfWElTQyBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZJREVPX0FUTUVMX0lTSSBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19NSUNST0NISVBfQ1NJ
MkRDPW0KIyBDT05GSUdfVklERU9fQ0FERU5DRSBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19DT0RB
PW0KQ09ORklHX1ZJREVPX0lNWF9WRE9BPW0KQ09ORklHX1ZJREVPX0RBVklOQ0lfVlBJRl9ESVNQ
TEFZPW0KQ09ORklHX1ZJREVPX0RBVklOQ0lfVlBJRl9DQVBUVVJFPW0KQ09ORklHX1ZJREVPX0RN
NjQ0Nl9DQ0RDPW0KQ09ORklHX1ZJREVPX0RNMzU1X0NDREM9bQpDT05GSUdfVklERU9fRE0zNjVf
SVNJRj1tCkNPTkZJR19WSURFT19EQVZJTkNJX1ZQQkVfRElTUExBWT1tCkNPTkZJR19WSURFT19Q
WEEyN3g9bQpDT05GSUdfVklERU9fTU1QX0NBTUVSQT1tCkNPTkZJR19WSURFT19NRURJQVRFS19K
UEVHPW0KQ09ORklHX1ZJREVPX01FRElBVEVLX01EUD1tCiMgQ09ORklHX1ZJREVPX01FRElBVEVL
X1ZDT0RFQyBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19NRURJQVRFS19WUFU9bQojIENPTkZJR19W
SURFT19URUdSQV9WREUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19JTVggaXMgbm90IHNldApD
T05GSUdfVklERU9fVklVPW0KQ09ORklHX1ZJREVPX0lNWF9QWFA9bQojIENPTkZJR19WSURFT19N
WDJfRU1NQVBSUCBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19JTVg4X0pQRUc9bQojIENPTkZJR19W
SURFT19PTUFQMl9WT1VUIGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX09NQVAzPW0KQ09ORklHX1ZJ
REVPX09NQVAzX0RFQlVHPXkKQ09ORklHX1ZJREVPX1FDT01fQ0FNU1M9bQojIENPTkZJR19WSURF
T19SQ0FSX0lTUCBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19SRU5FU0FTX0NFVT1tCkNPTkZJR19W
SURFT19TSF9WT1U9bQpDT05GSUdfVklERU9fUkNBUl9DU0kyPW0KIyBDT05GSUdfVklERU9fUkNB
Ul9WSU4gaXMgbm90IHNldAojIENPTkZJR19WSURFT19SRU5FU0FTX0ZDUCBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJREVPX1JFTkVTQVNfRkRQMSBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19SRU5FU0FT
X0pQVT1tCkNPTkZJR19WSURFT19SRU5FU0FTX1ZTUDE9bQpDT05GSUdfVklERU9fUk9DS0NISVBf
UkdBPW0KQ09ORklHX1ZJREVPX1JPQ0tDSElQX0lTUDE9bQpDT05GSUdfVklERU9fU0FNU1VOR19F
WFlOT1NfR1NDPW0KQ09ORklHX1ZJREVPX1NBTVNVTkdfRVhZTk9TNF9JUz1tCkNPTkZJR19WSURF
T19FWFlOT1M0X0lTX0NPTU1PTj1tCkNPTkZJR19WSURFT19TNVBfRklNQz1tCkNPTkZJR19WSURF
T19TNVBfTUlQSV9DU0lTPW0KQ09ORklHX1ZJREVPX0VYWU5PU19GSU1DX0xJVEU9bQojIENPTkZJ
R19WSURFT19FWFlOT1M0X0ZJTUNfSVMgaXMgbm90IHNldApDT05GSUdfVklERU9fU0FNU1VOR19T
NVBfRzJEPW0KQ09ORklHX1ZJREVPX1NBTVNVTkdfUzVQX0pQRUc9bQpDT05GSUdfVklERU9fU0FN
U1VOR19TNVBfTUZDPW0KQ09ORklHX1ZJREVPX1NVTjRJX0NTST1tCkNPTkZJR19WSURFT19TVU42
SV9DU0k9bQpDT05GSUdfVklERU9fU1RJX0JESVNQPW0KIyBDT05GSUdfVklERU9fU1RJX0RFTFRB
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fU1RJX0hWQSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
REVPX1NUTTMyX0RDTUkgaXMgbm90IHNldApDT05GSUdfVklERU9fU1RNMzJfRE1BMkQ9bQpDT05G
SUdfVklERU9fVElfVlBETUE9bQpDT05GSUdfVklERU9fVElfU0M9bQpDT05GSUdfVklERU9fVElf
Q1NDPW0KQ09ORklHX1ZJREVPX1RJX0NBTD1tCkNPTkZJR19WSURFT19USV9DQUxfTUM9eQpDT05G
SUdfVklERU9fVElfVlBFPW0KIyBDT05GSUdfVklERU9fVElfVlBFX0RFQlVHIGlzIG5vdCBzZXQK
Q09ORklHX1ZJREVPX1hJTElOWD1tCkNPTkZJR19WSURFT19YSUxJTlhfQ1NJMlJYU1M9bQpDT05G
SUdfVklERU9fWElMSU5YX1RQRz1tCkNPTkZJR19WSURFT19YSUxJTlhfVlRDPW0KCiMKIyBNTUMv
U0RJTyBEVkIgYWRhcHRlcnMKIwpDT05GSUdfU01TX1NESU9fRFJWPW0KIyBDT05GSUdfVjRMX1RF
U1RfRFJJVkVSUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9URVNUX0RSSVZFUlMgaXMgbm90IHNl
dApDT05GSUdfTUVESUFfQ09NTU9OX09QVElPTlM9eQoKIwojIGNvbW1vbiBkcml2ZXIgb3B0aW9u
cwojCkNPTkZJR19WSURFT0JVRjJfQ09SRT1tCkNPTkZJR19WSURFT0JVRjJfVjRMMj1tCkNPTkZJ
R19WSURFT0JVRjJfTUVNT1BTPW0KQ09ORklHX1ZJREVPQlVGMl9ETUFfQ09OVElHPW0KQ09ORklH
X1ZJREVPQlVGMl9WTUFMTE9DPW0KQ09ORklHX1ZJREVPQlVGMl9ETUFfU0c9bQpDT05GSUdfU01T
X1NJQU5PX01EVFY9bQojIGVuZCBvZiBNZWRpYSBkcml2ZXJzCgojCiMgTWVkaWEgYW5jaWxsYXJ5
IGRyaXZlcnMKIwpDT05GSUdfTUVESUFfQVRUQUNIPXkKCiMKIyBBdWRpbyBkZWNvZGVycywgcHJv
Y2Vzc29ycyBhbmQgbWl4ZXJzCiMKIyBDT05GSUdfVklERU9fVFZBVURJTyBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJREVPX1REQTc0MzIgaXMgbm90IHNldApDT05GSUdfVklERU9fVERBOTg0MD1tCkNP
TkZJR19WSURFT19URUE2NDE1Qz1tCkNPTkZJR19WSURFT19URUE2NDIwPW0KQ09ORklHX1ZJREVP
X01TUDM0MDA9bQpDT05GSUdfVklERU9fQ1MzMzA4PW0KIyBDT05GSUdfVklERU9fQ1M1MzQ1IGlz
IG5vdCBzZXQKQ09ORklHX1ZJREVPX0NTNTNMMzJBPW0KQ09ORklHX1ZJREVPX1RMVjMyMEFJQzIz
Qj1tCiMgQ09ORklHX1ZJREVPX1VEQTEzNDIgaXMgbm90IHNldAojIENPTkZJR19WSURFT19XTTg3
NzUgaXMgbm90IHNldApDT05GSUdfVklERU9fV004NzM5PW0KQ09ORklHX1ZJREVPX1ZQMjdTTVBY
PW0KQ09ORklHX1ZJREVPX1NPTllfQlRGX01QWD1tCiMgZW5kIG9mIEF1ZGlvIGRlY29kZXJzLCBw
cm9jZXNzb3JzIGFuZCBtaXhlcnMKCiMKIyBSRFMgZGVjb2RlcnMKIwojIENPTkZJR19WSURFT19T
QUE2NTg4IGlzIG5vdCBzZXQKIyBlbmQgb2YgUkRTIGRlY29kZXJzCgojCiMgVmlkZW8gZGVjb2Rl
cnMKIwpDT05GSUdfVklERU9fQURWNzE4MD1tCkNPTkZJR19WSURFT19BRFY3MTgzPW0KQ09ORklH
X1ZJREVPX0FEVjc0OFg9bQpDT05GSUdfVklERU9fQURWNzYwND1tCiMgQ09ORklHX1ZJREVPX0FE
Vjc2MDRfQ0VDIGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX0FEVjc4NDI9bQpDT05GSUdfVklERU9f
QURWNzg0Ml9DRUM9eQpDT05GSUdfVklERU9fQlQ4MTk9bQpDT05GSUdfVklERU9fQlQ4NTY9bQpD
T05GSUdfVklERU9fQlQ4NjY9bQpDT05GSUdfVklERU9fSVNMNzk5OFg9bQpDT05GSUdfVklERU9f
S1MwMTI3PW0KIyBDT05GSUdfVklERU9fTUw4NlY3NjY3IGlzIG5vdCBzZXQKQ09ORklHX1ZJREVP
X1NBQTcxMTA9bQojIENPTkZJR19WSURFT19TQUE3MTFYIGlzIG5vdCBzZXQKQ09ORklHX1ZJREVP
X1RDMzU4NzQzPW0KQ09ORklHX1ZJREVPX1RDMzU4NzQzX0NFQz15CiMgQ09ORklHX1ZJREVPX1RW
UDUxNFggaXMgbm90IHNldApDT05GSUdfVklERU9fVFZQNTE1MD1tCkNPTkZJR19WSURFT19UVlA3
MDAyPW0KIyBDT05GSUdfVklERU9fVFcyODA0IGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX1RXOTkw
Mz1tCiMgQ09ORklHX1ZJREVPX1RXOTkwNiBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19UVzk5MTA9
bQpDT05GSUdfVklERU9fVlBYMzIyMD1tCiMgQ09ORklHX1ZJREVPX01BWDkyODYgaXMgbm90IHNl
dAoKIwojIFZpZGVvIGFuZCBhdWRpbyBkZWNvZGVycwojCkNPTkZJR19WSURFT19TQUE3MTdYPW0K
IyBDT05GSUdfVklERU9fQ1gyNTg0MCBpcyBub3Qgc2V0CiMgZW5kIG9mIFZpZGVvIGRlY29kZXJz
CgojCiMgVmlkZW8gZW5jb2RlcnMKIwojIENPTkZJR19WSURFT19TQUE3MTI3IGlzIG5vdCBzZXQK
Q09ORklHX1ZJREVPX1NBQTcxODU9bQpDT05GSUdfVklERU9fQURWNzE3MD1tCiMgQ09ORklHX1ZJ
REVPX0FEVjcxNzUgaXMgbm90IHNldApDT05GSUdfVklERU9fQURWNzM0Mz1tCkNPTkZJR19WSURF
T19BRFY3MzkzPW0KQ09ORklHX1ZJREVPX0FEVjc1MTE9bQojIENPTkZJR19WSURFT19BRFY3NTEx
X0NFQyBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19BRDkzODlCPW0KQ09ORklHX1ZJREVPX0FLODgx
WD1tCkNPTkZJR19WSURFT19USFM4MjAwPW0KIyBlbmQgb2YgVmlkZW8gZW5jb2RlcnMKCiMKIyBW
aWRlbyBpbXByb3ZlbWVudCBjaGlwcwojCiMgQ09ORklHX1ZJREVPX1VQRDY0MDMxQSBpcyBub3Qg
c2V0CkNPTkZJR19WSURFT19VUEQ2NDA4Mz1tCiMgZW5kIG9mIFZpZGVvIGltcHJvdmVtZW50IGNo
aXBzCgojCiMgQXVkaW8vVmlkZW8gY29tcHJlc3Npb24gY2hpcHMKIwpDT05GSUdfVklERU9fU0FB
Njc1MkhTPW0KIyBlbmQgb2YgQXVkaW8vVmlkZW8gY29tcHJlc3Npb24gY2hpcHMKCiMKIyBTRFIg
dHVuZXIgY2hpcHMKIwojIGVuZCBvZiBTRFIgdHVuZXIgY2hpcHMKCiMKIyBNaXNjZWxsYW5lb3Vz
IGhlbHBlciBjaGlwcwojCkNPTkZJR19WSURFT19USFM3MzAzPW0KIyBDT05GSUdfVklERU9fTTUy
NzkwIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSTJDIGlzIG5vdCBzZXQKQ09ORklHX1ZJREVP
X1NUX01JUElEMDI9bQojIGVuZCBvZiBNaXNjZWxsYW5lb3VzIGhlbHBlciBjaGlwcwoKQ09ORklH
X1ZJREVPX09WNzY3MD1tCgojCiMgU1BJIGhlbHBlciBjaGlwcwojCiMgZW5kIG9mIFNQSSBoZWxw
ZXIgY2hpcHMKCkNPTkZJR19NRURJQV9UVU5FUj1tCgojCiMgQ3VzdG9taXplIFRWIHR1bmVycwoj
CkNPTkZJR19NRURJQV9UVU5FUl9TSU1QTEU9bQojIENPTkZJR19NRURJQV9UVU5FUl9UREExODI1
MCBpcyBub3Qgc2V0CiMgQ09ORklHX01FRElBX1RVTkVSX1REQTgyOTAgaXMgbm90IHNldAojIENP
TkZJR19NRURJQV9UVU5FUl9UREE4MjdYIGlzIG5vdCBzZXQKQ09ORklHX01FRElBX1RVTkVSX1RE
QTE4MjcxPW0KQ09ORklHX01FRElBX1RVTkVSX1REQTk4ODc9bQpDT05GSUdfTUVESUFfVFVORVJf
VEVBNTc2MT1tCkNPTkZJR19NRURJQV9UVU5FUl9URUE1NzY3PW0KQ09ORklHX01FRElBX1RVTkVS
X01UMjBYWD1tCkNPTkZJR19NRURJQV9UVU5FUl9NVDIwNjA9bQpDT05GSUdfTUVESUFfVFVORVJf
TVQyMDYzPW0KQ09ORklHX01FRElBX1RVTkVSX01UMjI2Nj1tCkNPTkZJR19NRURJQV9UVU5FUl9N
VDIxMzE9bQpDT05GSUdfTUVESUFfVFVORVJfUVQxMDEwPW0KQ09ORklHX01FRElBX1RVTkVSX1hD
MjAyOD1tCkNPTkZJR19NRURJQV9UVU5FUl9YQzUwMDA9bQpDT05GSUdfTUVESUFfVFVORVJfWEM0
MDAwPW0KQ09ORklHX01FRElBX1RVTkVSX01YTDUwMDVTPW0KQ09ORklHX01FRElBX1RVTkVSX01Y
TDUwMDdUPW0KQ09ORklHX01FRElBX1RVTkVSX01DNDRTODAzPW0KIyBDT05GSUdfTUVESUFfVFVO
RVJfTUFYMjE2NSBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9UVU5FUl9UREExODIxOD1tCiMgQ09O
RklHX01FRElBX1RVTkVSX0ZDMDAxMSBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9UVU5FUl9GQzAw
MTI9bQojIENPTkZJR19NRURJQV9UVU5FUl9GQzAwMTMgaXMgbm90IHNldAojIENPTkZJR19NRURJ
QV9UVU5FUl9UREExODIxMiBpcyBub3Qgc2V0CiMgQ09ORklHX01FRElBX1RVTkVSX0U0MDAwIGlz
IG5vdCBzZXQKQ09ORklHX01FRElBX1RVTkVSX0ZDMjU4MD1tCkNPTkZJR19NRURJQV9UVU5FUl9N
ODhSUzYwMDBUPW0KQ09ORklHX01FRElBX1RVTkVSX1RVQTkwMDE9bQojIENPTkZJR19NRURJQV9U
VU5FUl9TSTIxNTcgaXMgbm90IHNldAojIENPTkZJR19NRURJQV9UVU5FUl9JVDkxM1ggaXMgbm90
IHNldApDT05GSUdfTUVESUFfVFVORVJfUjgyMFQ9bQojIENPTkZJR19NRURJQV9UVU5FUl9NWEwz
MDFSRiBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9UVU5FUl9RTTFEMUMwMDQyPW0KQ09ORklHX01F
RElBX1RVTkVSX1FNMUQxQjAwMDQ9bQojIGVuZCBvZiBDdXN0b21pemUgVFYgdHVuZXJzCgojCiMg
Q3VzdG9taXNlIERWQiBGcm9udGVuZHMKIwoKIwojIE11bHRpc3RhbmRhcmQgKHNhdGVsbGl0ZSkg
ZnJvbnRlbmRzCiMKIyBDT05GSUdfRFZCX1NUQjA4OTkgaXMgbm90IHNldAojIENPTkZJR19EVkJf
U1RCNjEwMCBpcyBub3Qgc2V0CkNPTkZJR19EVkJfU1RWMDkweD1tCiMgQ09ORklHX0RWQl9TVFYw
OTEwIGlzIG5vdCBzZXQKQ09ORklHX0RWQl9TVFY2MTEweD1tCiMgQ09ORklHX0RWQl9TVFY2MTEx
IGlzIG5vdCBzZXQKQ09ORklHX0RWQl9NWEw1WFg9bQojIENPTkZJR19EVkJfTTg4RFMzMTAzIGlz
IG5vdCBzZXQKCiMKIyBNdWx0aXN0YW5kYXJkIChjYWJsZSArIHRlcnJlc3RyaWFsKSBmcm9udGVu
ZHMKIwpDT05GSUdfRFZCX0RSWEs9bQpDT05GSUdfRFZCX1REQTE4MjcxQzJERD1tCiMgQ09ORklH
X0RWQl9TSTIxNjUgaXMgbm90IHNldApDT05GSUdfRFZCX01OODg0NzI9bQpDT05GSUdfRFZCX01O
ODg0NzM9bQoKIwojIERWQi1TIChzYXRlbGxpdGUpIGZyb250ZW5kcwojCiMgQ09ORklHX0RWQl9D
WDI0MTEwIGlzIG5vdCBzZXQKQ09ORklHX0RWQl9DWDI0MTIzPW0KQ09ORklHX0RWQl9NVDMxMj1t
CkNPTkZJR19EVkJfWkwxMDAzNj1tCkNPTkZJR19EVkJfWkwxMDAzOT1tCiMgQ09ORklHX0RWQl9T
NUgxNDIwIGlzIG5vdCBzZXQKQ09ORklHX0RWQl9TVFYwMjg4PW0KIyBDT05GSUdfRFZCX1NUQjYw
MDAgaXMgbm90IHNldApDT05GSUdfRFZCX1NUVjAyOTk9bQpDT05GSUdfRFZCX1NUVjYxMTA9bQpD
T05GSUdfRFZCX1NUVjA5MDA9bQpDT05GSUdfRFZCX1REQTgwODM9bQojIENPTkZJR19EVkJfVERB
MTAwODYgaXMgbm90IHNldApDT05GSUdfRFZCX1REQTgyNjE9bQpDT05GSUdfRFZCX1ZFUzFYOTM9
bQpDT05GSUdfRFZCX1RVTkVSX0lURDEwMDA9bQpDT05GSUdfRFZCX1RVTkVSX0NYMjQxMTM9bQoj
IENPTkZJR19EVkJfVERBODI2WCBpcyBub3Qgc2V0CkNPTkZJR19EVkJfVFVBNjEwMD1tCiMgQ09O
RklHX0RWQl9DWDI0MTE2IGlzIG5vdCBzZXQKQ09ORklHX0RWQl9DWDI0MTE3PW0KIyBDT05GSUdf
RFZCX0NYMjQxMjAgaXMgbm90IHNldApDT05GSUdfRFZCX1NJMjFYWD1tCkNPTkZJR19EVkJfVFMy
MDIwPW0KIyBDT05GSUdfRFZCX0RTMzAwMCBpcyBub3Qgc2V0CkNPTkZJR19EVkJfTUI4NkExNj1t
CiMgQ09ORklHX0RWQl9UREExMDA3MSBpcyBub3Qgc2V0CgojCiMgRFZCLVQgKHRlcnJlc3RyaWFs
KSBmcm9udGVuZHMKIwpDT05GSUdfRFZCX1NQODg3WD1tCiMgQ09ORklHX0RWQl9DWDIyNzAwIGlz
IG5vdCBzZXQKQ09ORklHX0RWQl9DWDIyNzAyPW0KQ09ORklHX0RWQl9TNUgxNDMyPW0KIyBDT05G
SUdfRFZCX0RSWEQgaXMgbm90IHNldApDT05GSUdfRFZCX0w2NDc4MT1tCkNPTkZJR19EVkJfVERB
MTAwNFg9bQpDT05GSUdfRFZCX05YVDYwMDA9bQpDT05GSUdfRFZCX01UMzUyPW0KIyBDT05GSUdf
RFZCX1pMMTAzNTMgaXMgbm90IHNldAojIENPTkZJR19EVkJfRElCMzAwME1CIGlzIG5vdCBzZXQK
Q09ORklHX0RWQl9ESUIzMDAwTUM9bQpDT05GSUdfRFZCX0RJQjcwMDBNPW0KQ09ORklHX0RWQl9E
SUI3MDAwUD1tCkNPTkZJR19EVkJfRElCOTAwMD1tCkNPTkZJR19EVkJfVERBMTAwNDg9bQojIENP
TkZJR19EVkJfQUY5MDEzIGlzIG5vdCBzZXQKQ09ORklHX0RWQl9FQzEwMD1tCkNPTkZJR19EVkJf
U1RWMDM2Nz1tCkNPTkZJR19EVkJfQ1hEMjgyMFI9bQpDT05GSUdfRFZCX0NYRDI4NDFFUj1tCkNP
TkZJR19EVkJfUlRMMjgzMD1tCkNPTkZJR19EVkJfUlRMMjgzMj1tCiMgQ09ORklHX0RWQl9TSTIx
NjggaXMgbm90IHNldAojIENPTkZJR19EVkJfWkQxMzAxX0RFTU9EIGlzIG5vdCBzZXQKCiMKIyBE
VkItQyAoY2FibGUpIGZyb250ZW5kcwojCkNPTkZJR19EVkJfVkVTMTgyMD1tCkNPTkZJR19EVkJf
VERBMTAwMjE9bQpDT05GSUdfRFZCX1REQTEwMDIzPW0KIyBDT05GSUdfRFZCX1NUVjAyOTcgaXMg
bm90IHNldAoKIwojIEFUU0MgKE5vcnRoIEFtZXJpY2FuL0tvcmVhbiBUZXJyZXN0cmlhbC9DYWJs
ZSBEVFYpIGZyb250ZW5kcwojCkNPTkZJR19EVkJfTlhUMjAwWD1tCkNPTkZJR19EVkJfT1I1MTIx
MT1tCkNPTkZJR19EVkJfT1I1MTEzMj1tCkNPTkZJR19EVkJfQkNNMzUxMD1tCkNPTkZJR19EVkJf
TEdEVDMzMFg9bQpDT05GSUdfRFZCX0xHRFQzMzA1PW0KQ09ORklHX0RWQl9MR0RUMzMwNkE9bQpD
T05GSUdfRFZCX0xHMjE2MD1tCkNPTkZJR19EVkJfUzVIMTQwOT1tCiMgQ09ORklHX0RWQl9BVTg1
MjJfRFRWIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX0FVODUyMl9WNEwgaXMgbm90IHNldApDT05G
SUdfRFZCX1M1SDE0MTE9bQpDT05GSUdfRFZCX01YTDY5Mj1tCgojCiMgSVNEQi1UICh0ZXJyZXN0
cmlhbCkgZnJvbnRlbmRzCiMKIyBDT05GSUdfRFZCX1M5MjEgaXMgbm90IHNldApDT05GSUdfRFZC
X0RJQjgwMDA9bQojIENPTkZJR19EVkJfTUI4NkEyMFMgaXMgbm90IHNldAoKIwojIElTREItUyAo
c2F0ZWxsaXRlKSAmIElTREItVCAodGVycmVzdHJpYWwpIGZyb250ZW5kcwojCiMgQ09ORklHX0RW
Ql9UQzkwNTIyIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX01OODg0NDNYIGlzIG5vdCBzZXQKCiMK
IyBEaWdpdGFsIHRlcnJlc3RyaWFsIG9ubHkgdHVuZXJzL1BMTAojCiMgQ09ORklHX0RWQl9QTEwg
aXMgbm90IHNldApDT05GSUdfRFZCX1RVTkVSX0RJQjAwNzA9bQojIENPTkZJR19EVkJfVFVORVJf
RElCMDA5MCBpcyBub3Qgc2V0CgojCiMgU0VDIGNvbnRyb2wgZGV2aWNlcyBmb3IgRFZCLVMKIwpD
T05GSUdfRFZCX0RSWDM5WFlKPW0KIyBDT05GSUdfRFZCX0xOQkgyNSBpcyBub3Qgc2V0CkNPTkZJ
R19EVkJfTE5CSDI5PW0KQ09ORklHX0RWQl9MTkJQMjE9bQpDT05GSUdfRFZCX0xOQlAyMj1tCkNP
TkZJR19EVkJfSVNMNjQwNT1tCiMgQ09ORklHX0RWQl9JU0w2NDIxIGlzIG5vdCBzZXQKQ09ORklH
X0RWQl9JU0w2NDIzPW0KQ09ORklHX0RWQl9BODI5Mz1tCkNPTkZJR19EVkJfTEdTOEdMNT1tCkNP
TkZJR19EVkJfTEdTOEdYWD1tCkNPTkZJR19EVkJfQVRCTTg4MzA9bQojIENPTkZJR19EVkJfVERB
NjY1eCBpcyBub3Qgc2V0CkNPTkZJR19EVkJfSVgyNTA1Vj1tCkNPTkZJR19EVkJfTTg4UlMyMDAw
PW0KQ09ORklHX0RWQl9BRjkwMzM9bQojIENPTkZJR19EVkJfSE9SVVMzQSBpcyBub3Qgc2V0CiMg
Q09ORklHX0RWQl9BU0NPVDJFIGlzIG5vdCBzZXQKQ09ORklHX0RWQl9IRUxFTkU9bQoKIwojIENv
bW1vbiBJbnRlcmZhY2UgKEVONTAyMjEpIGNvbnRyb2xsZXIgZHJpdmVycwojCkNPTkZJR19EVkJf
Q1hEMjA5OT1tCiMgQ09ORklHX0RWQl9TUDIgaXMgbm90IHNldAojIGVuZCBvZiBDdXN0b21pc2Ug
RFZCIEZyb250ZW5kcwoKIwojIFRvb2xzIHRvIGRldmVsb3AgbmV3IGZyb250ZW5kcwojCiMgQ09O
RklHX0RWQl9EVU1NWV9GRSBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lZGlhIGFuY2lsbGFyeSBkcml2
ZXJzCgojCiMgR3JhcGhpY3Mgc3VwcG9ydAojCiMgQ09ORklHX0lNWF9JUFVWM19DT1JFIGlzIG5v
dCBzZXQKIyBDT05GSUdfRFJNIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9ERUJVR19NT0RFU0VUX0xP
Q0s9eQoKIwojIEFSTSBkZXZpY2VzCiMKIyBlbmQgb2YgQVJNIGRldmljZXMKCiMKIyBGcmFtZSBi
dWZmZXIgRGV2aWNlcwojCiMgQ09ORklHX0ZCIGlzIG5vdCBzZXQKQ09ORklHX01NUF9ESVNQPW0K
IyBDT05GSUdfTU1QX0RJU1BfQ09OVFJPTExFUiBpcyBub3Qgc2V0CiMgZW5kIG9mIEZyYW1lIGJ1
ZmZlciBEZXZpY2VzCgojCiMgQmFja2xpZ2h0ICYgTENEIGRldmljZSBzdXBwb3J0CiMKQ09ORklH
X0xDRF9DTEFTU19ERVZJQ0U9bQpDT05GSUdfTENEX1BMQVRGT1JNPW0KQ09ORklHX0JBQ0tMSUdI
VF9DTEFTU19ERVZJQ0U9bQojIENPTkZJR19CQUNLTElHSFRfS1REMjUzIGlzIG5vdCBzZXQKQ09O
RklHX0JBQ0tMSUdIVF9MTTM1MzM9bQpDT05GSUdfQkFDS0xJR0hUX0RBOTA1Mj1tCiMgQ09ORklH
X0JBQ0tMSUdIVF9RQ09NX1dMRUQgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfUlQ0ODMx
IGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tMSUdIVF9BRFA1NTIwPW0KQ09ORklHX0JBQ0tMSUdIVF9B
RFA4ODYwPW0KIyBDT05GSUdfQkFDS0xJR0hUX0FEUDg4NzAgaXMgbm90IHNldApDT05GSUdfQkFD
S0xJR0hUXzg4UE04NjBYPW0KIyBDT05GSUdfQkFDS0xJR0hUX0FBVDI4NzAgaXMgbm90IHNldApD
T05GSUdfQkFDS0xJR0hUX0xNMzYzOT1tCiMgQ09ORklHX0JBQ0tMSUdIVF9QQU5ET1JBIGlzIG5v
dCBzZXQKQ09ORklHX0JBQ0tMSUdIVF9TS1k4MTQ1Mj1tCkNPTkZJR19CQUNLTElHSFRfQVMzNzEx
PW0KQ09ORklHX0JBQ0tMSUdIVF9HUElPPW0KQ09ORklHX0JBQ0tMSUdIVF9MVjUyMDdMUD1tCiMg
Q09ORklHX0JBQ0tMSUdIVF9CRDYxMDcgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfQVJD
WENOTiBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9MRUQgaXMgbm90IHNldAojIGVuZCBv
ZiBCYWNrbGlnaHQgJiBMQ0QgZGV2aWNlIHN1cHBvcnQKCkNPTkZJR19IRE1JPXkKIyBlbmQgb2Yg
R3JhcGhpY3Mgc3VwcG9ydAoKQ09ORklHX1NPVU5EPW0KIyBDT05GSUdfU05EIGlzIG5vdCBzZXQK
Q09ORklHX1VTQl9PSENJX0xJVFRMRV9FTkRJQU49eQpDT05GSUdfVVNCX0VIQ0lfQklHX0VORElB
Tl9NTUlPPXkKQ09ORklHX1VTQl9FSENJX0JJR19FTkRJQU5fREVTQz15CkNPTkZJR19VU0JfU1VQ
UE9SVD15CkNPTkZJR19VU0JfQ09NTU9OPXkKQ09ORklHX1VTQl9MRURfVFJJRz15CkNPTkZJR19V
U0JfVUxQSV9CVVM9bQpDT05GSUdfVVNCX0NPTk5fR1BJTz15CkNPTkZJR19VU0JfQVJDSF9IQVNf
SENEPXkKQ09ORklHX1VTQj1tCkNPTkZJR19VU0JfQU5OT1VOQ0VfTkVXX0RFVklDRVM9eQoKIwoj
IE1pc2NlbGxhbmVvdXMgVVNCIG9wdGlvbnMKIwpDT05GSUdfVVNCX0RFRkFVTFRfUEVSU0lTVD15
CkNPTkZJR19VU0JfRkVXX0lOSVRfUkVUUklFUz15CkNPTkZJR19VU0JfRFlOQU1JQ19NSU5PUlM9
eQpDT05GSUdfVVNCX09UR19QUk9EVUNUTElTVD15CkNPTkZJR19VU0JfT1RHX0RJU0FCTEVfRVhU
RVJOQUxfSFVCPXkKIyBDT05GSUdfVVNCX0xFRFNfVFJJR0dFUl9VU0JQT1JUIGlzIG5vdCBzZXQK
Q09ORklHX1VTQl9BVVRPU1VTUEVORF9ERUxBWT0yCiMgQ09ORklHX1VTQl9NT04gaXMgbm90IHNl
dAoKIwojIFVTQiBIb3N0IENvbnRyb2xsZXIgRHJpdmVycwojCiMgQ09ORklHX1VTQl9DNjdYMDBf
SENEIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9YSENJX0hDRD1tCkNPTkZJR19VU0JfWEhDSV9QQ0lf
UkVORVNBUz1tCkNPTkZJR19VU0JfWEhDSV9QTEFURk9STT1tCkNPTkZJR19VU0JfWEhDSV9ISVNU
Qj1tCkNPTkZJR19VU0JfWEhDSV9NVEs9bQpDT05GSUdfVVNCX1hIQ0lfTVZFQlU9bQpDT05GSUdf
VVNCX1hIQ0lfUkNBUj1tCiMgQ09ORklHX1VTQl9CUkNNU1RCIGlzIG5vdCBzZXQKQ09ORklHX1VT
Ql9FSENJX0hDRD1tCkNPTkZJR19VU0JfRUhDSV9ST09UX0hVQl9UVD15CiMgQ09ORklHX1VTQl9F
SENJX1RUX05FV1NDSEVEIGlzIG5vdCBzZXQKQ09ORklHX1hQU19VU0JfSENEX1hJTElOWD15CkNP
TkZJR19VU0JfRUhDSV9GU0w9bQpDT05GSUdfVVNCX0VIQ0lfSENEX05QQ003WFg9bQpDT05GSUdf
VVNCX0VIQ0lfSENEX09SSU9OPW0KQ09ORklHX1VTQl9FSENJX0hDRF9TUEVBUj1tCiMgQ09ORklH
X1VTQl9FSENJX0hDRF9TVEkgaXMgbm90IHNldAojIENPTkZJR19VU0JfRUhDSV9IQ0RfQVQ5MSBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9FSENJX1NIIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9FSENJ
X0VYWU5PUz1tCkNPTkZJR19VU0JfRUhDSV9NVj1tCiMgQ09ORklHX1VTQl9DTlMzWFhYX0VIQ0kg
aXMgbm90IHNldApDT05GSUdfVVNCX0VIQ0lfSENEX1BMQVRGT1JNPW0KIyBDT05GSUdfVVNCX09Y
VTIxMEhQX0hDRCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfSVNQMTE2WF9IQ0Q9bQpDT05GSUdfVVNC
X0lTUDEzNjJfSENEPW0KQ09ORklHX1VTQl9GT1RHMjEwX0hDRD1tCiMgQ09ORklHX1VTQl9PSENJ
X0hDRCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfVTEzMl9IQ0Q9bQpDT05GSUdfVVNCX1NMODExX0hD
RD1tCkNPTkZJR19VU0JfU0w4MTFfSENEX0lTTz15CkNPTkZJR19VU0JfU0w4MTFfQ1M9bQpDT05G
SUdfVVNCX1I4QTY2NTk3X0hDRD1tCiMgQ09ORklHX1VTQl9IQ0RfQkNNQSBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9IQ0RfU1NCIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9IQ0RfVEVTVF9NT0RFPXkK
CiMKIyBVU0IgRGV2aWNlIENsYXNzIGRyaXZlcnMKIwpDT05GSUdfVVNCX1BSSU5URVI9bQpDT05G
SUdfVVNCX1dETT1tCkNPTkZJR19VU0JfVE1DPW0KCiMKIyBOT1RFOiBVU0JfU1RPUkFHRSBkZXBl
bmRzIG9uIFNDU0kgYnV0IEJMS19ERVZfU0QgbWF5CiMKCiMKIyBhbHNvIGJlIG5lZWRlZDsgc2Vl
IFVTQl9TVE9SQUdFIEhlbHAgZm9yIG1vcmUgaW5mbwojCgojCiMgVVNCIEltYWdpbmcgZGV2aWNl
cwojCiMgQ09ORklHX1VTQl9NREM4MDAgaXMgbm90IHNldApDT05GSUdfVVNCX0NETlNfU1VQUE9S
VD1tCkNPTkZJR19VU0JfQ0ROU19IT1NUPXkKQ09ORklHX1VTQl9DRE5TMz1tCkNPTkZJR19VU0Jf
Q0ROUzNfSE9TVD15CkNPTkZJR19VU0JfQ0ROUzNfVEk9bQpDT05GSUdfVVNCX0NETlMzX0lNWD1t
CiMgQ09ORklHX1VTQl9NVFUzIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9NVVNCX0hEUkM9bQpDT05G
SUdfVVNCX01VU0JfSE9TVD15CgojCiMgUGxhdGZvcm0gR2x1ZSBMYXllcgojCiMgQ09ORklHX1VT
Ql9NVVNCX0RTUFMgaXMgbm90IHNldApDT05GSUdfVVNCX01VU0JfVVg1MDA9bQoKIwojIE1VU0Ig
RE1BIG1vZGUKIwojIENPTkZJR19NVVNCX1BJT19PTkxZIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9V
WDUwMF9ETUE9eQpDT05GSUdfVVNCX0RXQzM9bQpDT05GSUdfVVNCX0RXQzNfVUxQST15CkNPTkZJ
R19VU0JfRFdDM19IT1NUPXkKCiMKIyBQbGF0Zm9ybSBHbHVlIERyaXZlciBTdXBwb3J0CiMKQ09O
RklHX1VTQl9EV0MzX09NQVA9bQpDT05GSUdfVVNCX0RXQzNfRVhZTk9TPW0KQ09ORklHX1VTQl9E
V0MzX0tFWVNUT05FPW0KQ09ORklHX1VTQl9EV0MzX01FU09OX0cxMkE9bQpDT05GSUdfVVNCX0RX
QzNfT0ZfU0lNUExFPW0KQ09ORklHX1VTQl9EV0MzX1NUPW0KIyBDT05GSUdfVVNCX0RXQzNfUUNP
TSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfRFdDM19JTVg4TVA9bQojIENPTkZJR19VU0JfRFdDMiBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9DSElQSURFQSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfSVNQ
MTc2MD1tCkNPTkZJR19VU0JfSVNQMTc2MF9IQ0Q9eQpDT05GSUdfVVNCX0lTUDE3NjBfSE9TVF9S
T0xFPXkKCiMKIyBVU0IgcG9ydCBkcml2ZXJzCiMKCiMKIyBVU0IgTWlzY2VsbGFuZW91cyBkcml2
ZXJzCiMKIyBDT05GSUdfVVNCX0VNSTYyIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9FTUkyNj1tCiMg
Q09ORklHX1VTQl9BRFVUVVggaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VWU0VHIGlzIG5vdCBz
ZXQKQ09ORklHX1VTQl9MRUdPVE9XRVI9bQpDT05GSUdfVVNCX0xDRD1tCkNPTkZJR19VU0JfQ1lQ
UkVTU19DWTdDNjM9bQpDT05GSUdfVVNCX0NZVEhFUk09bQpDT05GSUdfVVNCX0lETU9VU0U9bQpD
T05GSUdfVVNCX0ZURElfRUxBTj1tCkNPTkZJR19VU0JfQVBQTEVESVNQTEFZPW0KIyBDT05GSUdf
QVBQTEVfTUZJX0ZBU1RDSEFSR0UgaXMgbm90IHNldApDT05GSUdfVVNCX1NJU1VTQlZHQT1tCkNP
TkZJR19VU0JfTEQ9bQpDT05GSUdfVVNCX1RSQU5DRVZJQlJBVE9SPW0KQ09ORklHX1VTQl9JT1dB
UlJJT1I9bQojIENPTkZJR19VU0JfVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfRUhTRVRfVEVT
VF9GSVhUVVJFPW0KQ09ORklHX1VTQl9JU0lHSFRGVz1tCkNPTkZJR19VU0JfWVVSRVg9bQojIENP
TkZJR19VU0JfRVpVU0JfRlgyIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9IVUJfVVNCMjUxWEI9bQpD
T05GSUdfVVNCX0hTSUNfVVNCMzUwMz1tCkNPTkZJR19VU0JfSFNJQ19VU0I0NjA0PW0KQ09ORklH
X1VTQl9MSU5LX0xBWUVSX1RFU1Q9bQpDT05GSUdfVVNCX0NIQU9TS0VZPW0KQ09ORklHX0JSQ01f
VVNCX1BJTk1BUD1tCgojCiMgVVNCIFBoeXNpY2FsIExheWVyIGRyaXZlcnMKIwpDT05GSUdfVVNC
X1BIWT15CiMgQ09ORklHX05PUF9VU0JfWENFSVYgaXMgbm90IHNldApDT05GSUdfVVNCX0dQSU9f
VkJVUz15CiMgQ09ORklHX1RBSFZPX1VTQiBpcyBub3Qgc2V0CkNPTkZJR19VU0JfSVNQMTMwMT1t
CkNPTkZJR19VU0JfVEVHUkFfUEhZPW0KQ09ORklHX1VTQl9VTFBJPXkKQ09ORklHX1VTQl9VTFBJ
X1ZJRVdQT1JUPXkKQ09ORklHX0paNDc3MF9QSFk9bQojIGVuZCBvZiBVU0IgUGh5c2ljYWwgTGF5
ZXIgZHJpdmVycwoKIyBDT05GSUdfVVNCX0dBREdFVCBpcyBub3Qgc2V0CkNPTkZJR19UWVBFQz15
CkNPTkZJR19UWVBFQ19UQ1BNPW0KQ09ORklHX1RZUEVDX1RDUENJPW0KQ09ORklHX1RZUEVDX1JU
MTcxMUg9bQpDT05GSUdfVFlQRUNfTVQ2MzYwPW0KQ09ORklHX1RZUEVDX1RDUENJX01BWElNPW0K
Q09ORklHX1RZUEVDX0ZVU0IzMDI9bQpDT05GSUdfVFlQRUNfVFBTNjU5OFg9eQpDT05GSUdfVFlQ
RUNfSEQzU1MzMjIwPXkKQ09ORklHX1RZUEVDX1NUVVNCMTYwWD1tCkNPTkZJR19UWVBFQ19RQ09N
X1BNSUM9eQoKIwojIFVTQiBUeXBlLUMgTXVsdGlwbGV4ZXIvRGVNdWx0aXBsZXhlciBTd2l0Y2gg
c3VwcG9ydAojCkNPTkZJR19UWVBFQ19NVVhfUEkzVVNCMzA1MzI9bQojIGVuZCBvZiBVU0IgVHlw
ZS1DIE11bHRpcGxleGVyL0RlTXVsdGlwbGV4ZXIgU3dpdGNoIHN1cHBvcnQKCiMKIyBVU0IgVHlw
ZS1DIEFsdGVybmF0ZSBNb2RlIGRyaXZlcnMKIwojIGVuZCBvZiBVU0IgVHlwZS1DIEFsdGVybmF0
ZSBNb2RlIGRyaXZlcnMKCkNPTkZJR19VU0JfUk9MRV9TV0lUQ0g9eQpDT05GSUdfTU1DPXkKQ09O
RklHX1BXUlNFUV9FTU1DPXkKIyBDT05GSUdfUFdSU0VRX1NJTVBMRSBpcyBub3Qgc2V0CkNPTkZJ
R19NTUNfVEVTVD15CgojCiMgTU1DL1NEL1NESU8gSG9zdCBDb250cm9sbGVyIERyaXZlcnMKIwoj
IENPTkZJR19NTUNfREVCVUcgaXMgbm90IHNldApDT05GSUdfTU1DX1NESENJPW0KQ09ORklHX01N
Q19TREhDSV9JT19BQ0NFU1NPUlM9eQpDT05GSUdfTU1DX1NESENJX1BMVEZNPW0KIyBDT05GSUdf
TU1DX1NESENJX09GX0FSQVNBTiBpcyBub3Qgc2V0CkNPTkZJR19NTUNfU0RIQ0lfT0ZfQVNQRUVE
PW0KIyBDT05GSUdfTU1DX1NESENJX09GX0FUOTEgaXMgbm90IHNldApDT05GSUdfTU1DX1NESENJ
X09GX0VTREhDPW0KQ09ORklHX01NQ19TREhDSV9PRl9EV0NNU0hDPW0KQ09ORklHX01NQ19TREhD
SV9PRl9TUEFSWDU9bQojIENPTkZJR19NTUNfU0RIQ0lfQ0FERU5DRSBpcyBub3Qgc2V0CkNPTkZJ
R19NTUNfU0RIQ0lfQ05TM1hYWD1tCkNPTkZJR19NTUNfU0RIQ0lfRVNESENfSU1YPW0KQ09ORklH
X01NQ19TREhDSV9ET1ZFPW0KQ09ORklHX01NQ19TREhDSV9URUdSQT1tCkNPTkZJR19NTUNfU0RI
Q0lfUzNDPW0KQ09ORklHX01NQ19TREhDSV9QWEFWMz1tCkNPTkZJR19NTUNfU0RIQ0lfUFhBVjI9
bQpDT05GSUdfTU1DX1NESENJX1NQRUFSPW0KIyBDT05GSUdfTU1DX1NESENJX1MzQ19ETUEgaXMg
bm90IHNldApDT05GSUdfTU1DX1NESENJX0JDTV9LT05BPW0KIyBDT05GSUdfTU1DX1NESENJX0Zf
U0RIMzAgaXMgbm90IHNldAojIENPTkZJR19NTUNfU0RIQ0lfTUlMQkVBVVQgaXMgbm90IHNldApD
T05GSUdfTU1DX1NESENJX0lQUk9DPW0KQ09ORklHX01NQ19NRVNPTl9HWD15CiMgQ09ORklHX01N
Q19NRVNPTl9NWF9TREhDIGlzIG5vdCBzZXQKQ09ORklHX01NQ19NRVNPTl9NWF9TRElPPW0KIyBD
T05GSUdfTU1DX01PWEFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX01NQ19TREhDSV9TVCBpcyBub3Qg
c2V0CiMgQ09ORklHX01NQ19PTUFQX0hTIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1NESENJX01T
TSBpcyBub3Qgc2V0CkNPTkZJR19NTUNfREFWSU5DST1tCiMgQ09ORklHX01NQ19TM0MgaXMgbm90
IHNldApDT05GSUdfTU1DX1NESENJX1NQUkQ9bQpDT05GSUdfTU1DX1RNSU9fQ09SRT1tCkNPTkZJ
R19NTUNfVE1JTz1tCiMgQ09ORklHX01NQ19TREhJIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1VO
SVBISUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX0RXIGlzIG5vdCBzZXQKQ09ORklHX01NQ19T
SF9NTUNJRj15CkNPTkZJR19NTUNfVlVCMzAwPW0KQ09ORklHX01NQ19VU0hDPW0KIyBDT05GSUdf
TU1DX1VTREhJNlJPTDAgaXMgbm90IHNldAojIENPTkZJR19NTUNfUkVBTFRFS19VU0IgaXMgbm90
IHNldAojIENPTkZJR19NTUNfU1VOWEkgaXMgbm90IHNldApDT05GSUdfTU1DX0NRSENJPXkKQ09O
RklHX01NQ19IU1E9eQpDT05GSUdfTU1DX0JDTTI4MzU9bQojIENPTkZJR19NTUNfTVRLIGlzIG5v
dCBzZXQKQ09ORklHX01NQ19TREhDSV9YRU5PTj1tCiMgQ09ORklHX01NQ19TREhDSV9PTUFQIGlz
IG5vdCBzZXQKQ09ORklHX01NQ19TREhDSV9BTTY1ND1tCkNPTkZJR19NTUNfT1dMPW0KQ09ORklH
X01FTVNUSUNLPW0KIyBDT05GSUdfTUVNU1RJQ0tfREVCVUcgaXMgbm90IHNldAoKIwojIE1lbW9y
eVN0aWNrIGRyaXZlcnMKIwojIENPTkZJR19NRU1TVElDS19VTlNBRkVfUkVTVU1FIGlzIG5vdCBz
ZXQKCiMKIyBNZW1vcnlTdGljayBIb3N0IENvbnRyb2xsZXIgRHJpdmVycwojCiMgQ09ORklHX01F
TVNUSUNLX1JFQUxURUtfVVNCIGlzIG5vdCBzZXQKQ09ORklHX05FV19MRURTPXkKQ09ORklHX0xF
RFNfQ0xBU1M9bQojIENPTkZJR19MRURTX0NMQVNTX0ZMQVNIIGlzIG5vdCBzZXQKQ09ORklHX0xF
RFNfQ0xBU1NfTVVMVElDT0xPUj1tCiMgQ09ORklHX0xFRFNfQlJJR0hUTkVTU19IV19DSEFOR0VE
IGlzIG5vdCBzZXQKCiMKIyBMRUQgZHJpdmVycwojCkNPTkZJR19MRURTXzg4UE04NjBYPW0KQ09O
RklHX0xFRFNfQU4zMDI1OUE9bQpDT05GSUdfTEVEU19BUklFTD1tCkNPTkZJR19MRURTX0FXMjAx
Mz1tCiMgQ09ORklHX0xFRFNfQkNNNjMyOCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0JDTTYzNTg9
bQpDT05GSUdfTEVEU19UVVJSSVNfT01OSUE9bQpDT05GSUdfTEVEU19MTTM1MzA9bQojIENPTkZJ
R19MRURTX0xNMzUzMiBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xNMzUzMz1tCkNPTkZJR19MRURT
X0xNMzY0Mj1tCkNPTkZJR19MRURTX0xNMzY5Mlg9bQpDT05GSUdfTEVEU19TM0MyNFhYPW0KQ09O
RklHX0xFRFNfQ09CQUxUX1FVQkU9bQpDT05GSUdfTEVEU19HUElPPW0KQ09ORklHX0xFRFNfTFAz
OTQ0PW0KIyBDT05GSUdfTEVEU19MUDM5NTIgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xQNTBY
WCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xQNTVYWF9DT01NT049bQpDT05GSUdfTEVEU19MUDU1
MjE9bQojIENPTkZJR19MRURTX0xQNTUyMyBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xQNTU2Mj1t
CiMgQ09ORklHX0xFRFNfTFA4NTAxIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfTFA4Nzg4PW0KIyBD
T05GSUdfTEVEU19MUDg4NjAgaXMgbm90IHNldAojIENPTkZJR19MRURTX1BDQTk1NVggaXMgbm90
IHNldApDT05GSUdfTEVEU19QQ0E5NjNYPW0KQ09ORklHX0xFRFNfV004MzUwPW0KQ09ORklHX0xF
RFNfREE5MDUyPW0KIyBDT05GSUdfTEVEU19SRUdVTEFUT1IgaXMgbm90IHNldApDT05GSUdfTEVE
U19CRDI4MDI9bQojIENPTkZJR19MRURTX0xUMzU5MyBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0FE
UDU1MjA9bQpDT05GSUdfTEVEU19OUzI9bQojIENPTkZJR19MRURTX05FVFhCSUcgaXMgbm90IHNl
dApDT05GSUdfTEVEU19UQ0E2NTA3PW0KQ09ORklHX0xFRFNfVExDNTkxWFg9bQpDT05GSUdfTEVE
U19MTTM1NXg9bQpDT05GSUdfTEVEU19PVDIwMD1tCkNPTkZJR19MRURTX0lTMzFGTDMxOVg9bQoj
IENPTkZJR19MRURTX0lTMzFGTDMyWFggaXMgbm90IHNldAoKIwojIExFRCBkcml2ZXIgZm9yIGJs
aW5rKDEpIFVTQiBSR0IgTEVEIGlzIHVuZGVyIFNwZWNpYWwgSElEIGRyaXZlcnMgKEhJRF9USElO
R00pCiMKQ09ORklHX0xFRFNfQkxJTktNPW0KQ09ORklHX0xFRFNfUE04MDU4PW0KQ09ORklHX0xF
RFNfTUxYUkVHPW0KQ09ORklHX0xFRFNfVVNFUj1tCkNPTkZJR19MRURTX1RJX0xNVV9DT01NT049
bQojIENPTkZJR19MRURTX0xNMzY5NyBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xNMzYyNzQ9bQpD
T05GSUdfTEVEU19UUFM2MTA1WD1tCiMgQ09ORklHX0xFRFNfSVAzMCBpcyBub3Qgc2V0CiMgQ09O
RklHX0xFRFNfQUNFUl9BNTAwIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfTEdNPW0KCiMKIyBGbGFz
aCBhbmQgVG9yY2ggTEVEIGRyaXZlcnMKIwoKIwojIExFRCBUcmlnZ2VycwojCkNPTkZJR19MRURT
X1RSSUdHRVJTPXkKIyBDT05GSUdfTEVEU19UUklHR0VSX1RJTUVSIGlzIG5vdCBzZXQKQ09ORklH
X0xFRFNfVFJJR0dFUl9PTkVTSE9UPW0KQ09ORklHX0xFRFNfVFJJR0dFUl9IRUFSVEJFQVQ9eQpD
T05GSUdfTEVEU19UUklHR0VSX0JBQ0tMSUdIVD15CkNPTkZJR19MRURTX1RSSUdHRVJfQ1BVPXkK
IyBDT05GSUdfTEVEU19UUklHR0VSX0FDVElWSVRZIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfVFJJ
R0dFUl9HUElPPXkKQ09ORklHX0xFRFNfVFJJR0dFUl9ERUZBVUxUX09OPW0KCiMKIyBpcHRhYmxl
cyB0cmlnZ2VyIGlzIHVuZGVyIE5ldGZpbHRlciBjb25maWcgKExFRCB0YXJnZXQpCiMKIyBDT05G
SUdfTEVEU19UUklHR0VSX1RSQU5TSUVOVCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RSSUdHRVJf
Q0FNRVJBPXkKIyBDT05GSUdfTEVEU19UUklHR0VSX1BBTklDIGlzIG5vdCBzZXQKQ09ORklHX0xF
RFNfVFJJR0dFUl9QQVRURVJOPXkKQ09ORklHX0xFRFNfVFJJR0dFUl9BVURJTz15CgojCiMgU2lt
cGxlIExFRCBkcml2ZXJzCiMKQ09ORklHX0FDQ0VTU0lCSUxJVFk9eQoKIwojIFNwZWFrdXAgY29u
c29sZSBzcGVlY2gKIwojIGVuZCBvZiBTcGVha3VwIGNvbnNvbGUgc3BlZWNoCgojIENPTkZJR19S
VENfQ0xBU1MgaXMgbm90IHNldApDT05GSUdfRE1BREVWSUNFUz15CiMgQ09ORklHX0RNQURFVklD
RVNfREVCVUcgaXMgbm90IHNldAoKIwojIERNQSBEZXZpY2VzCiMKQ09ORklHX0FTWU5DX1RYX0VO
QUJMRV9DSEFOTkVMX1NXSVRDSD15CkNPTkZJR19ETUFfRU5HSU5FPXkKQ09ORklHX0RNQV9WSVJU
VUFMX0NIQU5ORUxTPXkKQ09ORklHX0RNQV9PRj15CkNPTkZJR19BTFRFUkFfTVNHRE1BPXkKIyBD
T05GSUdfQVhJX0RNQUMgaXMgbm90IHNldApDT05GSUdfRE1BX0paNDc4MD1tCkNPTkZJR19ETUFf
U0ExMVgwPW0KIyBDT05GSUdfRE1BX1NVTjZJIGlzIG5vdCBzZXQKQ09ORklHX0RXX0FYSV9ETUFD
PW0KQ09ORklHX0VQOTNYWF9ETUE9eQpDT05GSUdfRlNMX0VETUE9eQpDT05GSUdfSU1HX01EQ19E
TUE9bQpDT05GSUdfSU5URUxfSURNQTY0PW0KQ09ORklHX0lOVEVMX0lPUF9BRE1BPXkKIyBDT05G
SUdfSzNfRE1BIGlzIG5vdCBzZXQKQ09ORklHX01DRl9FRE1BPXkKQ09ORklHX01JTEJFQVVUX0hE
TUFDPXkKIyBDT05GSUdfTUlMQkVBVVRfWERNQUMgaXMgbm90IHNldAojIENPTkZJR19NTVBfUERN
QSBpcyBub3Qgc2V0CkNPTkZJR19NTVBfVERNQT15CkNPTkZJR19NVl9YT1I9eQojIENPTkZJR19N
WFNfRE1BIGlzIG5vdCBzZXQKQ09ORklHX05CUEZBWElfRE1BPW0KQ09ORklHX1NUTTMyX0RNQT15
CiMgQ09ORklHX1NUTTMyX0RNQU1VWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NUTTMyX01ETUEgaXMg
bm90IHNldApDT05GSUdfU1BSRF9ETUE9bQpDT05GSUdfUzNDMjRYWF9ETUFDPXkKQ09ORklHX1RF
R1JBMjBfQVBCX0RNQT15CkNPTkZJR19URUdSQTIxMF9BRE1BPXkKIyBDT05GSUdfVElNQl9ETUEg
aXMgbm90IHNldApDT05GSUdfVU5JUEhJRVJfTURNQUM9eQpDT05GSUdfVU5JUEhJRVJfWERNQUM9
bQpDT05GSUdfWEdFTkVfRE1BPW0KQ09ORklHX1hJTElOWF9ETUE9bQpDT05GSUdfWElMSU5YX1pZ
TlFNUF9ETUE9eQpDT05GSUdfWElMSU5YX1pZTlFNUF9EUERNQT1tCkNPTkZJR19NVEtfSFNETUE9
bQpDT05GSUdfTVRLX0NRRE1BPXkKIyBDT05GSUdfUUNPTV9BRE0gaXMgbm90IHNldApDT05GSUdf
UUNPTV9ISURNQV9NR01UPW0KQ09ORklHX1FDT01fSElETUE9eQpDT05GSUdfRFdfRE1BQ19DT1JF
PXkKQ09ORklHX0RXX0RNQUM9eQpDT05GSUdfU0ZfUERNQT15CkNPTkZJR19SRU5FU0FTX0RNQT15
CkNPTkZJR19TSF9ETUFFX0JBU0U9eQpDT05GSUdfU0hfRE1BRT15CkNPTkZJR19SQ0FSX0RNQUM9
eQojIENPTkZJR19SRU5FU0FTX1VTQl9ETUFDIGlzIG5vdCBzZXQKQ09ORklHX1JaX0RNQUM9eQoj
IENPTkZJR19USV9FRE1BIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BX09NQVAgaXMgbm90IHNldAoj
IENPTkZJR19JTlRFTF9MRE1BIGlzIG5vdCBzZXQKCiMKIyBETUEgQ2xpZW50cwojCkNPTkZJR19B
U1lOQ19UWF9ETUE9eQpDT05GSUdfRE1BVEVTVD15CkNPTkZJR19ETUFfRU5HSU5FX1JBSUQ9eQoK
IwojIERNQUJVRiBvcHRpb25zCiMKIyBDT05GSUdfU1lOQ19GSUxFIGlzIG5vdCBzZXQKQ09ORklH
X1VETUFCVUY9eQojIENPTkZJR19ETUFCVUZfTU9WRV9OT1RJRlkgaXMgbm90IHNldAojIENPTkZJ
R19ETUFCVUZfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19ETUFCVUZfU0VMRlRFU1RTIGlzIG5v
dCBzZXQKQ09ORklHX0RNQUJVRl9IRUFQUz15CiMgQ09ORklHX0RNQUJVRl9TWVNGU19TVEFUUyBp
cyBub3Qgc2V0CkNPTkZJR19ETUFCVUZfSEVBUFNfU1lTVEVNPXkKIyBDT05GSUdfRE1BQlVGX0hF
QVBTX0NNQSBpcyBub3Qgc2V0CiMgZW5kIG9mIERNQUJVRiBvcHRpb25zCgpDT05GSUdfQVVYRElT
UExBWT15CkNPTkZJR19DSEFSTENEPXkKQ09ORklHX0xJTkVESVNQPXkKQ09ORklHX0hENDQ3ODBf
Q09NTU9OPXkKQ09ORklHX0hENDQ3ODA9eQojIENPTkZJR19JTUdfQVNDSUlfTENEIGlzIG5vdCBz
ZXQKQ09ORklHX0xDRDJTPXkKQ09ORklHX1BBTkVMX0NIQU5HRV9NRVNTQUdFPXkKQ09ORklHX1BB
TkVMX0JPT1RfTUVTU0FHRT0iIgojIENPTkZJR19DSEFSTENEX0JMX09GRiBpcyBub3Qgc2V0CiMg
Q09ORklHX0NIQVJMQ0RfQkxfT04gaXMgbm90IHNldApDT05GSUdfQ0hBUkxDRF9CTF9GTEFTSD15
CkNPTkZJR19VSU89bQojIENPTkZJR19VSU9fUERSVl9HRU5JUlEgaXMgbm90IHNldApDT05GSUdf
VUlPX0RNRU1fR0VOSVJRPW0KQ09ORklHX1VJT19QUlVTUz1tCkNPTkZJR19VSU9fREZMPW0KQ09O
RklHX1ZGSU89eQpDT05GSUdfVkZJT19WSVJRRkQ9eQojIENPTkZJR19WRklPX05PSU9NTVUgaXMg
bm90IHNldApDT05GSUdfVkZJT19QTEFURk9STT15CiMgQ09ORklHX1ZGSU9fQU1CQSBpcyBub3Qg
c2V0CkNPTkZJR19WRklPX1BMQVRGT1JNX0NBTFhFREFYR01BQ19SRVNFVD15CiMgQ09ORklHX1ZG
SU9fUExBVEZPUk1fQU1EWEdCRV9SRVNFVCBpcyBub3Qgc2V0CkNPTkZJR19WRklPX1BMQVRGT1JN
X0JDTUZMRVhSTV9SRVNFVD15CiMgQ09ORklHX1ZGSU9fTURFViBpcyBub3Qgc2V0CkNPTkZJR19W
SVJUX0RSSVZFUlM9eQpDT05GSUdfVklSVElPPXkKIyBDT05GSUdfVklSVElPX01FTlUgaXMgbm90
IHNldAojIENPTkZJR19WSE9TVF9NRU5VIGlzIG5vdCBzZXQKCiMKIyBNaWNyb3NvZnQgSHlwZXIt
ViBndWVzdCBzdXBwb3J0CiMKIyBlbmQgb2YgTWljcm9zb2Z0IEh5cGVyLVYgZ3Vlc3Qgc3VwcG9y
dAoKQ09ORklHX0dSRVlCVVM9eQojIENPTkZJR19HUkVZQlVTX0VTMiBpcyBub3Qgc2V0CiMgQ09O
RklHX0NPTUVESSBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQUdJTkcgaXMgbm90IHNldAojIENPTkZJ
R19HT0xERklTSCBpcyBub3Qgc2V0CkNPTkZJR19DSFJPTUVfUExBVEZPUk1TPXkKIyBDT05GSUdf
Q1JPU19FQyBpcyBub3Qgc2V0CiMgQ09ORklHX01FTExBTk9YX1BMQVRGT1JNIGlzIG5vdCBzZXQK
IyBDT05GSUdfT0xQQ19YTzE3NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NVUkZBQ0VfUExBVEZPUk1T
IGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQ0xLPXkKQ09ORklHX0hBVkVfQ0xLX1BSRVBBUkU9eQpD
T05GSUdfQ09NTU9OX0NMSz15CgojCiMgQ2xvY2sgZHJpdmVyIGZvciBBUk0gUmVmZXJlbmNlIGRl
c2lnbnMKIwojIENPTkZJR19DTEtfSUNTVCBpcyBub3Qgc2V0CkNPTkZJR19DTEtfU1A4MTA9eQoj
IGVuZCBvZiBDbG9jayBkcml2ZXIgZm9yIEFSTSBSZWZlcmVuY2UgZGVzaWducwoKQ09ORklHX0NM
S19IU0RLPXkKQ09ORklHX0NPTU1PTl9DTEtfTUFYNzc2ODY9eQpDT05GSUdfQ09NTU9OX0NMS19N
QVg5NDg1PXkKQ09ORklHX0NPTU1PTl9DTEtfSEk2NTVYPXkKQ09ORklHX0NPTU1PTl9DTEtfU0NN
ST1tCkNPTkZJR19DT01NT05fQ0xLX1NDUEk9eQojIENPTkZJR19DT01NT05fQ0xLX1NJNTM0MSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfU0k1MzUxIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q09NTU9OX0NMS19TSTUxNCBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfU0k1NDQgaXMg
bm90IHNldApDT05GSUdfQ09NTU9OX0NMS19TSTU3MD1tCkNPTkZJR19DT01NT05fQ0xLX0JNMTg4
MD15CkNPTkZJR19DT01NT05fQ0xLX0NEQ0U3MDY9eQojIENPTkZJR19DT01NT05fQ0xLX1RQUzY4
NDcwIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19DRENFOTI1IGlzIG5vdCBzZXQKQ09O
RklHX0NPTU1PTl9DTEtfQ1MyMDAwX0NQPW0KIyBDT05GSUdfQ09NTU9OX0NMS19GU0xfRkxFWFNQ
SSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfRlNMX1NBSSBpcyBub3Qgc2V0CkNPTkZJ
R19DT01NT05fQ0xLX0dFTUlOST15CiMgQ09ORklHX0NPTU1PTl9DTEtfTEFOOTY2WCBpcyBub3Qg
c2V0CkNPTkZJR19DT01NT05fQ0xLX0FTUEVFRD15CkNPTkZJR19DT01NT05fQ0xLX1MyTVBTMTE9
eQojIENPTkZJR19DTEtfVFdMNjA0MCBpcyBub3Qgc2V0CkNPTkZJR19DT01NT05fQ0xLX0FYSV9D
TEtHRU49bQojIENPTkZJR19DTEtfUU9SSVEgaXMgbm90IHNldAojIENPTkZJR19DTEtfTFMxMDI4
QV9QTExESUcgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX1hHRU5FIGlzIG5vdCBzZXQK
Q09ORklHX0NPTU1PTl9DTEtfUEFMTUFTPW0KQ09ORklHX0NPTU1PTl9DTEtfT1hOQVM9eQojIENP
TkZJR19DT01NT05fQ0xLX1ZDNSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTU1QMl9B
VURJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfQkQ3MThYWCBpcyBub3Qgc2V0CiMg
Q09ORklHX0NPTU1PTl9DTEtfRklYRURfTU1JTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19BQ1RJ
T05TIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX0JBSUtBTF9UMSBpcyBub3Qgc2V0CkNPTkZJR19D
TEtfQkNNMjcxMV9EVlA9bQojIENPTkZJR19DTEtfQkNNMjgzNSBpcyBub3Qgc2V0CkNPTkZJR19D
TEtfQkNNXzYzWFg9eQojIENPTkZJR19DTEtfQkNNXzYzWFhfR0FURSBpcyBub3Qgc2V0CkNPTkZJ
R19DTEtfQkNNX0tPTkE9eQpDT05GSUdfQ09NTU9OX0NMS19JUFJPQz15CkNPTkZJR19DTEtfQkNN
X0NZR05VUz15CiMgQ09ORklHX0NMS19CQ01fSFIyIGlzIG5vdCBzZXQKQ09ORklHX0NMS19CQ01f
TlNQPXkKQ09ORklHX0NMS19CQ01fTlMyPXkKQ09ORklHX0NMS19CQ01fU1I9eQpDT05GSUdfQ0xL
X1JBU1BCRVJSWVBJPW0KQ09ORklHX0NPTU1PTl9DTEtfSEkzNTE2Q1YzMDA9eQpDT05GSUdfQ09N
TU9OX0NMS19ISTM1MTk9bQojIENPTkZJR19DT01NT05fQ0xLX0hJMzU1OUEgaXMgbm90IHNldAoj
IENPTkZJR19DT01NT05fQ0xLX0hJMzY2MCBpcyBub3Qgc2V0CkNPTkZJR19DT01NT05fQ0xLX0hJ
MzY3MD15CiMgQ09ORklHX0NPTU1PTl9DTEtfSEkzNzk4Q1YyMDAgaXMgbm90IHNldApDT05GSUdf
Q09NTU9OX0NMS19ISTYyMjA9eQpDT05GSUdfUkVTRVRfSElTST15CkNPTkZJR19TVFVCX0NMS19I
STYyMjA9eQpDT05GSUdfU1RVQl9DTEtfSEkzNjYwPXkKQ09ORklHX0NPTU1PTl9DTEtfQk9TVE9O
PXkKQ09ORklHX01YQ19DTEs9eQpDT05GSUdfQ0xLX0lNWDhNTT1tCkNPTkZJR19DTEtfSU1YOE1O
PXkKQ09ORklHX0NMS19JTVg4TVA9bQpDT05GSUdfQ0xLX0lNWDhNUT15CkNPTkZJR19DTEtfSU1Y
OFVMUD15CgojCiMgSW5nZW5pYyBTb0NzIGRyaXZlcnMKIwpDT05GSUdfSU5HRU5JQ19DR1VfQ09N
TU9OPXkKQ09ORklHX0lOR0VOSUNfQ0dVX0paNDc0MD15CiMgQ09ORklHX0lOR0VOSUNfQ0dVX0pa
NDcyNUIgaXMgbm90IHNldApDT05GSUdfSU5HRU5JQ19DR1VfSlo0NzYwPXkKIyBDT05GSUdfSU5H
RU5JQ19DR1VfSlo0NzcwIGlzIG5vdCBzZXQKQ09ORklHX0lOR0VOSUNfQ0dVX0paNDc4MD15CkNP
TkZJR19JTkdFTklDX0NHVV9YMTAwMD15CkNPTkZJR19JTkdFTklDX0NHVV9YMTgzMD15CkNPTkZJ
R19JTkdFTklDX1RDVV9DTEs9eQojIGVuZCBvZiBJbmdlbmljIFNvQ3MgZHJpdmVycwoKQ09ORklH
X0NPTU1PTl9DTEtfS0VZU1RPTkU9eQpDT05GSUdfVElfU1lTQ09OX0NMSz15CgojCiMgQ2xvY2sg
ZHJpdmVyIGZvciBNZWRpYVRlayBTb0MKIwpDT05GSUdfQ09NTU9OX0NMS19NRURJQVRFSz15CiMg
Q09ORklHX0NPTU1PTl9DTEtfTVQyNzAxIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19N
VDI3MTIgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX01UNjc2NSBpcyBub3Qgc2V0CkNP
TkZJR19DT01NT05fQ0xLX01UNjc3OT1tCkNPTkZJR19DT01NT05fQ0xLX01UNjc3OV9NTVNZUz1t
CkNPTkZJR19DT01NT05fQ0xLX01UNjc3OV9JTUdTWVM9bQojIENPTkZJR19DT01NT05fQ0xLX01U
Njc3OV9JUEVTWVMgaXMgbm90IHNldApDT05GSUdfQ09NTU9OX0NMS19NVDY3NzlfQ0FNU1lTPW0K
Q09ORklHX0NPTU1PTl9DTEtfTVQ2Nzc5X1ZERUNTWVM9bQpDT05GSUdfQ09NTU9OX0NMS19NVDY3
NzlfVkVOQ1NZUz1tCkNPTkZJR19DT01NT05fQ0xLX01UNjc3OV9NRkdDRkc9bQpDT05GSUdfQ09N
TU9OX0NMS19NVDY3NzlfQVVEU1lTPW0KIyBDT05GSUdfQ09NTU9OX0NMS19NVDY3OTcgaXMgbm90
IHNldAojIENPTkZJR19DT01NT05fQ0xLX01UNzYyMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1P
Tl9DTEtfTVQ3NjI5IGlzIG5vdCBzZXQKQ09ORklHX0NPTU1PTl9DTEtfTVQ3OTg2PXkKQ09ORklH
X0NPTU1PTl9DTEtfTVQ3OTg2X0VUSFNZUz15CkNPTkZJR19DT01NT05fQ0xLX01UODEzNT15CiMg
Q09ORklHX0NPTU1PTl9DTEtfTVQ4MTY3IGlzIG5vdCBzZXQKQ09ORklHX0NPTU1PTl9DTEtfTVQ4
MTczPXkKIyBDT05GSUdfQ09NTU9OX0NMS19NVDgxNzNfTU1TWVMgaXMgbm90IHNldAojIENPTkZJ
R19DT01NT05fQ0xLX01UODE4MyBpcyBub3Qgc2V0CkNPTkZJR19DT01NT05fQ0xLX01UODE5Mj15
CiMgQ09ORklHX0NPTU1PTl9DTEtfTVQ4MTkyX0FVRFNZUyBpcyBub3Qgc2V0CkNPTkZJR19DT01N
T05fQ0xLX01UODE5Ml9DQU1TWVM9eQojIENPTkZJR19DT01NT05fQ0xLX01UODE5Ml9JTUdTWVMg
aXMgbm90IHNldApDT05GSUdfQ09NTU9OX0NMS19NVDgxOTJfSU1QX0lJQ19XUkFQPXkKIyBDT05G
SUdfQ09NTU9OX0NMS19NVDgxOTJfSVBFU1lTIGlzIG5vdCBzZXQKQ09ORklHX0NPTU1PTl9DTEtf
TVQ4MTkyX01EUFNZUz15CiMgQ09ORklHX0NPTU1PTl9DTEtfTVQ4MTkyX01GR0NGRyBpcyBub3Qg
c2V0CkNPTkZJR19DT01NT05fQ0xLX01UODE5Ml9NTVNZUz15CkNPTkZJR19DT01NT05fQ0xLX01U
ODE5Ml9NU0RDPXkKIyBDT05GSUdfQ09NTU9OX0NMS19NVDgxOTJfU0NQX0FEU1AgaXMgbm90IHNl
dApDT05GSUdfQ09NTU9OX0NMS19NVDgxOTJfVkRFQ1NZUz15CkNPTkZJR19DT01NT05fQ0xLX01U
ODE5Ml9WRU5DU1lTPXkKQ09ORklHX0NPTU1PTl9DTEtfTVQ4MTk1PXkKQ09ORklHX0NPTU1PTl9D
TEtfTVQ4NTE2PXkKQ09ORklHX0NPTU1PTl9DTEtfTVQ4NTE2X0FVRFNZUz15CiMgZW5kIG9mIENs
b2NrIGRyaXZlciBmb3IgTWVkaWFUZWsgU29DCgojCiMgQ2xvY2sgc3VwcG9ydCBmb3IgQW1sb2dp
YyBwbGF0Zm9ybXMKIwojIGVuZCBvZiBDbG9jayBzdXBwb3J0IGZvciBBbWxvZ2ljIHBsYXRmb3Jt
cwoKIyBDT05GSUdfTVNUQVJfTVNDMzEzX01QTEwgaXMgbm90IHNldApDT05GSUdfQ09NTU9OX0NM
S19QSVNUQUNISU89eQpDT05GSUdfUUNPTV9HRFNDPXkKQ09ORklHX0NPTU1PTl9DTEtfUUNPTT1t
CkNPTkZJR19RQ09NX0E1M1BMTD1tCiMgQ09ORklHX1FDT01fQTdQTEwgaXMgbm90IHNldAojIENP
TkZJR19RQ09NX0NMS19BUENTX01TTTg5MTYgaXMgbm90IHNldApDT05GSUdfUUNPTV9DTEtfQVBD
U19TRFg1NT1tCkNPTkZJR19BUFFfR0NDXzgwODQ9bQojIENPTkZJR19BUFFfTU1DQ184MDg0IGlz
IG5vdCBzZXQKQ09ORklHX0lQUV9BUFNTX1BMTD1tCkNPTkZJR19JUFFfQVBTU182MDE4PW0KQ09O
RklHX0lQUV9HQ0NfNDAxOT1tCiMgQ09ORklHX0lQUV9HQ0NfNjAxOCBpcyBub3Qgc2V0CkNPTkZJ
R19JUFFfR0NDXzgwNlg9bQpDT05GSUdfSVBRX0xDQ184MDZYPW0KQ09ORklHX0lQUV9HQ0NfODA3
ND1tCkNPTkZJR19NU01fR0NDXzg2NjA9bQpDT05GSUdfTVNNX0dDQ184OTE2PW0KQ09ORklHX01T
TV9HQ0NfODkzOT1tCkNPTkZJR19NU01fR0NDXzg5NjA9bQojIENPTkZJR19NU01fTENDXzg5NjAg
aXMgbm90IHNldApDT05GSUdfTURNX0dDQ185NjA3PW0KQ09ORklHX01ETV9HQ0NfOTYxNT1tCkNP
TkZJR19NRE1fTENDXzk2MTU9bQpDT05GSUdfTVNNX01NQ0NfODk2MD1tCkNPTkZJR19NU01fR0ND
Xzg5NTM9bQpDT05GSUdfTVNNX0dDQ184OTc0PW0KQ09ORklHX01TTV9NTUNDXzg5NzQ9bQpDT05G
SUdfTVNNX0dDQ184OTc2PW0KQ09ORklHX01TTV9NTUNDXzg5OTQ9bQpDT05GSUdfTVNNX0dDQ184
OTk0PW0KQ09ORklHX01TTV9HQ0NfODk5Nj1tCiMgQ09ORklHX01TTV9NTUNDXzg5OTYgaXMgbm90
IHNldApDT05GSUdfTVNNX0dDQ184OTk4PW0KQ09ORklHX01TTV9HUFVDQ184OTk4PW0KIyBDT05G
SUdfTVNNX01NQ0NfODk5OCBpcyBub3Qgc2V0CkNPTkZJR19RQ01fR0NDXzIyOTA9bQojIENPTkZJ
R19RQ1NfR0NDXzQwNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDX0NBTUNDXzcxODAgaXMgbm90IHNl
dAojIENPTkZJR19TQ19DQU1DQ183MjgwIGlzIG5vdCBzZXQKQ09ORklHX1NDX0RJU1BDQ183MTgw
PW0KQ09ORklHX1NDX0RJU1BDQ183MjgwPW0KQ09ORklHX1NDX0dDQ183MTgwPW0KQ09ORklHX1ND
X0dDQ183MjgwPW0KIyBDT05GSUdfU0NfR0NDXzgxODBYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0Nf
R1BVQ0NfNzE4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDX0dQVUNDXzcyODAgaXMgbm90IHNldApD
T05GSUdfU0NfTFBBU1NDQ183MjgwPW0KIyBDT05GSUdfU0NfTFBBU1NfQ09SRUNDXzcxODAgaXMg
bm90IHNldApDT05GSUdfU0NfTVNTXzcxODA9bQpDT05GSUdfU0NfVklERU9DQ183MTgwPW0KQ09O
RklHX1NDX1ZJREVPQ0NfNzI4MD1tCkNPTkZJR19TRE1fQ0FNQ0NfODQ1PW0KQ09ORklHX1NETV9H
Q0NfNjYwPW0KQ09ORklHX1NETV9NTUNDXzY2MD1tCkNPTkZJR19TRE1fR1BVQ0NfNjYwPW0KQ09O
RklHX1FDU19UVVJJTkdfNDA0PW0KIyBDT05GSUdfUUNTX1E2U1NUT1BfNDA0IGlzIG5vdCBzZXQK
Q09ORklHX1NETV9HQ0NfODQ1PW0KIyBDT05GSUdfU0RNX0dQVUNDXzg0NSBpcyBub3Qgc2V0CkNP
TkZJR19TRE1fVklERU9DQ184NDU9bQpDT05GSUdfU0RNX0RJU1BDQ184NDU9bQpDT05GSUdfU0RN
X0xQQVNTQ0NfODQ1PW0KQ09ORklHX1NEWF9HQ0NfNTU9bQojIENPTkZJR19TTV9DQU1DQ184MjUw
IGlzIG5vdCBzZXQKQ09ORklHX1NEWF9HQ0NfNjU9bQpDT05GSUdfU01fRElTUENDXzgyNTA9bQpD
T05GSUdfU01fR0NDXzYxMTU9bQojIENPTkZJR19TTV9HQ0NfNjEyNSBpcyBub3Qgc2V0CkNPTkZJ
R19TTV9HQ0NfNjM1MD1tCkNPTkZJR19TTV9HQ0NfODE1MD1tCkNPTkZJR19TTV9HQ0NfODI1MD1t
CiMgQ09ORklHX1NNX0dDQ184MzUwIGlzIG5vdCBzZXQKIyBDT05GSUdfU01fR0NDXzg0NTAgaXMg
bm90IHNldApDT05GSUdfU01fR1BVQ0NfODE1MD1tCkNPTkZJR19TTV9HUFVDQ184MjUwPW0KQ09O
RklHX1NNX1ZJREVPQ0NfODE1MD1tCkNPTkZJR19TTV9WSURFT0NDXzgyNTA9bQojIENPTkZJR19T
UE1JX1BNSUNfQ0xLRElWIGlzIG5vdCBzZXQKQ09ORklHX1FDT01fSEZQTEw9bQojIENPTkZJR19L
UFNTX1hDQyBpcyBub3Qgc2V0CkNPTkZJR19DTEtfR0ZNX0xQQVNTX1NNODI1MD1tCkNPTkZJR19D
TEtfTVQ3NjIxPXkKQ09ORklHX0NMS19SRU5FU0FTPXkKIyBDT05GSUdfQ0xLX0VNRVYyIGlzIG5v
dCBzZXQKQ09ORklHX0NMS19SWkExPXkKIyBDT05GSUdfQ0xLX1I3UzkyMTAgaXMgbm90IHNldApD
T05GSUdfQ0xLX1I4QTczQTQ9eQojIENPTkZJR19DTEtfUjhBNzc0MCBpcyBub3Qgc2V0CkNPTkZJ
R19DTEtfUjhBNzc0Mj15CiMgQ09ORklHX0NMS19SOEE3NzQzIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q0xLX1I4QTc3NDUgaXMgbm90IHNldApDT05GSUdfQ0xLX1I4QTc3NDcwPXkKQ09ORklHX0NMS19S
OEE3NzRBMT15CiMgQ09ORklHX0NMS19SOEE3NzRCMSBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19S
OEE3NzRDMCBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19SOEE3NzRFMSBpcyBub3Qgc2V0CkNPTkZJ
R19DTEtfUjhBNzc3OD15CiMgQ09ORklHX0NMS19SOEE3Nzc5IGlzIG5vdCBzZXQKQ09ORklHX0NM
S19SOEE3NzkwPXkKIyBDT05GSUdfQ0xLX1I4QTc3OTEgaXMgbm90IHNldApDT05GSUdfQ0xLX1I4
QTc3OTI9eQpDT05GSUdfQ0xLX1I4QTc3OTQ9eQojIENPTkZJR19DTEtfUjhBNzc5NSBpcyBub3Qg
c2V0CkNPTkZJR19DTEtfUjhBNzc5NjA9eQpDT05GSUdfQ0xLX1I4QTc3OTYxPXkKIyBDT05GSUdf
Q0xLX1I4QTc3OTY1IGlzIG5vdCBzZXQKQ09ORklHX0NMS19SOEE3Nzk3MD15CiMgQ09ORklHX0NM
S19SOEE3Nzk4MCBpcyBub3Qgc2V0CkNPTkZJR19DTEtfUjhBNzc5OTA9eQpDT05GSUdfQ0xLX1I4
QTc3OTk1PXkKIyBDT05GSUdfQ0xLX1I4QTc3OUEwIGlzIG5vdCBzZXQKQ09ORklHX0NMS19SOEE3
NzlGMD15CiMgQ09ORklHX0NMS19SOUEwNkcwMzIgaXMgbm90IHNldApDT05GSUdfQ0xLX1I5QTA3
RzA0ND15CiMgQ09ORklHX0NMS19TSDczQTAgaXMgbm90IHNldApDT05GSUdfQ0xLX1JDQVJfQ1BH
X0xJQj15CkNPTkZJR19DTEtfUkNBUl9HRU4yX0NQRz15CkNPTkZJR19DTEtfUkNBUl9HRU4zX0NQ
Rz15CkNPTkZJR19DTEtfUkNBUl9HRU40X0NQRz15CkNPTkZJR19DTEtfUkNBUl9VU0IyX0NMT0NL
X1NFTD15CkNPTkZJR19DTEtfUlpHMkw9eQpDT05GSUdfQ0xLX1JFTkVTQVNfQ1BHX01TU1I9eQpD
T05GSUdfQ0xLX1JFTkVTQVNfQ1BHX01TVFA9eQpDT05GSUdfQ0xLX1JFTkVTQVNfRElWNj15CkNP
TkZJR19DT01NT05fQ0xLX1NBTVNVTkc9eQojIENPTkZJR19TM0M2NFhYX0NPTU1PTl9DTEsgaXMg
bm90IHNldApDT05GSUdfUzVQVjIxMF9DT01NT05fQ0xLPXkKQ09ORklHX0VYWU5PU18zMjUwX0NP
TU1PTl9DTEs9eQpDT05GSUdfRVhZTk9TXzRfQ09NTU9OX0NMSz15CiMgQ09ORklHX0VYWU5PU181
MjUwX0NPTU1PTl9DTEsgaXMgbm90IHNldApDT05GSUdfRVhZTk9TXzUyNjBfQ09NTU9OX0NMSz15
CiMgQ09ORklHX0VYWU5PU181NDEwX0NPTU1PTl9DTEsgaXMgbm90IHNldApDT05GSUdfRVhZTk9T
XzU0MjBfQ09NTU9OX0NMSz15CiMgQ09ORklHX0VYWU5PU19BUk02NF9DT01NT05fQ0xLIGlzIG5v
dCBzZXQKQ09ORklHX0VYWU5PU19BVURTU19DTEtfQ09OPXkKQ09ORklHX0VYWU5PU19DTEtPVVQ9
eQojIENPTkZJR19TM0MyNDEwX0NPTU1PTl9DTEsgaXMgbm90IHNldAojIENPTkZJR19TM0MyNDEy
X0NPTU1PTl9DTEsgaXMgbm90IHNldApDT05GSUdfUzNDMjQ0M19DT01NT05fQ0xLPXkKIyBDT05G
SUdfQ0xLX1NJRklWRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19JTlRFTF9TT0NGUEdBIGlzIG5v
dCBzZXQKIyBDT05GSUdfU1BSRF9DT01NT05fQ0xLIGlzIG5vdCBzZXQKQ09ORklHX0NMS19TVEFS
RklWRV9KSDcxMDA9eQpDT05GSUdfQ0xLX1NVTlhJPXkKIyBDT05GSUdfQ0xLX1NVTlhJX0NMT0NL
UyBpcyBub3Qgc2V0CkNPTkZJR19DTEtfU1VOWElfUFJDTV9TVU42ST15CiMgQ09ORklHX0NMS19T
VU5YSV9QUkNNX1NVTjhJIGlzIG5vdCBzZXQKQ09ORklHX0NMS19TVU5YSV9QUkNNX1NVTjlJPXkK
Q09ORklHX1NVTlhJX0NDVT15CiMgQ09ORklHX1NVTklWX0YxQzEwMFNfQ0NVIGlzIG5vdCBzZXQK
Q09ORklHX1NVTjIwSV9EMV9DQ1U9eQpDT05GSUdfU1VOMjBJX0QxX1JfQ0NVPW0KQ09ORklHX1NV
TjUwSV9BNjRfQ0NVPXkKQ09ORklHX1NVTjUwSV9BMTAwX0NDVT1tCkNPTkZJR19TVU41MElfQTEw
MF9SX0NDVT15CkNPTkZJR19TVU41MElfSDZfQ0NVPW0KQ09ORklHX1NVTjUwSV9INjE2X0NDVT15
CkNPTkZJR19TVU41MElfSDZfUl9DQ1U9eQojIENPTkZJR19TVU40SV9BMTBfQ0NVIGlzIG5vdCBz
ZXQKQ09ORklHX1NVTjVJX0NDVT15CiMgQ09ORklHX1NVTjZJX0EzMV9DQ1UgaXMgbm90IHNldApD
T05GSUdfU1VOOElfQTIzX0NDVT15CiMgQ09ORklHX1NVTjhJX0EzM19DQ1UgaXMgbm90IHNldAoj
IENPTkZJR19TVU44SV9BODNUX0NDVSBpcyBub3Qgc2V0CkNPTkZJR19TVU44SV9IM19DQ1U9bQpD
T05GSUdfU1VOOElfVjNTX0NDVT1tCkNPTkZJR19TVU44SV9ERTJfQ0NVPW0KQ09ORklHX1NVTjhJ
X1I0MF9DQ1U9bQojIENPTkZJR19TVU45SV9BODBfQ0NVIGlzIG5vdCBzZXQKQ09ORklHX1NVTjhJ
X1JfQ0NVPXkKQ09ORklHX0NPTU1PTl9DTEtfVElfQURQTEw9bQojIENPTkZJR19DTEtfVU5JUEhJ
RVIgaXMgbm90IHNldApDT05GSUdfQ09NTU9OX0NMS19WSVNDT05UST15CiMgQ09ORklHX0NMS19M
R01fQ0dVIGlzIG5vdCBzZXQKQ09ORklHX1hJTElOWF9WQ1U9bQpDT05GSUdfQ09NTU9OX0NMS19a
WU5RTVA9eQpDT05GSUdfSFdTUElOTE9DSz15CiMgQ09ORklHX0hXU1BJTkxPQ0tfT01BUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hXU1BJTkxPQ0tfUUNPTSBpcyBub3Qgc2V0CkNPTkZJR19IV1NQSU5M
T0NLX1NQUkQ9bQpDT05GSUdfSFdTUElOTE9DS19TVE0zMj1tCkNPTkZJR19IV1NQSU5MT0NLX1NV
TjZJPW0KQ09ORklHX0hTRU1fVTg1MDA9bQoKIwojIENsb2NrIFNvdXJjZSBkcml2ZXJzCiMKQ09O
RklHX1RJTUVSX09GPXkKQ09ORklHX1RJTUVSX1BST0JFPXkKQ09ORklHX0NMS1NSQ19NTUlPPXkK
Q09ORklHX0JDTTI4MzVfVElNRVI9eQojIENPTkZJR19CQ01fS09OQV9USU1FUiBpcyBub3Qgc2V0
CiMgQ09ORklHX0RBVklOQ0lfVElNRVIgaXMgbm90IHNldApDT05GSUdfRElHSUNPTE9SX1RJTUVS
PXkKIyBDT05GSUdfRFdfQVBCX1RJTUVSIGlzIG5vdCBzZXQKQ09ORklHX0ZUVE1SMDEwX1RJTUVS
PXkKQ09ORklHX0lYUDRYWF9USU1FUj15CiMgQ09ORklHX01FU09ONl9USU1FUiBpcyBub3Qgc2V0
CiMgQ09ORklHX09XTF9USU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX1JEQV9USU1FUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NVTjRJX1RJTUVSIGlzIG5vdCBzZXQKQ09ORklHX1NVTjVJX0hTVElNRVI9
eQpDT05GSUdfVEVHUkFfVElNRVI9eQojIENPTkZJR19WVDg1MDBfVElNRVIgaXMgbm90IHNldApD
T05GSUdfTlBDTTdYWF9USU1FUj15CkNPTkZJR19DQURFTkNFX1RUQ19USU1FUj15CkNPTkZJR19B
U005MjYwX1RJTUVSPXkKIyBDT05GSUdfQ0xLU1JDX0RCWDUwMF9QUkNNVSBpcyBub3Qgc2V0CiMg
Q09ORklHX0NMUFM3MTFYX1RJTUVSIGlzIG5vdCBzZXQKQ09ORklHX01YU19USU1FUj15CiMgQ09O
RklHX05TUElSRV9USU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVHUkFUT1JfQVBfVElNRVIg
aXMgbm90IHNldAojIENPTkZJR19DTEtTUkNfUElTVEFDSElPIGlzIG5vdCBzZXQKQ09ORklHX0NM
S1NSQ19USV8zMks9eQpDT05GSUdfQ0xLU1JDX1NUTTMyX0xQPXkKQ09ORklHX0NMS1NSQ19NUFMy
PXkKQ09ORklHX0FSQ19USU1FUlM9eQpDT05GSUdfQVJDX1RJTUVSU182NEJJVD15CiMgQ09ORklH
X0FSTV9USU1FUl9TUDgwNCBpcyBub3Qgc2V0CkNPTkZJR19BUk1WN01fU1lTVElDSz15CiMgQ09O
RklHX0FUTUVMX1BJVCBpcyBub3Qgc2V0CkNPTkZJR19BVE1FTF9TVD15CiMgQ09ORklHX0NMS1NS
Q19TQU1TVU5HX1BXTSBpcyBub3Qgc2V0CkNPTkZJR19GU0xfRlRNX1RJTUVSPXkKQ09ORklHX09Y
TkFTX1JQU19USU1FUj15CkNPTkZJR19NVEtfVElNRVI9eQojIENPTkZJR19TUFJEX1RJTUVSIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ0xLU1JDX0pDT1JFX1BJVCBpcyBub3Qgc2V0CkNPTkZJR19TSF9U
SU1FUl9DTVQ9eQpDT05GSUdfU0hfVElNRVJfTVRVMj15CiMgQ09ORklHX1JFTkVTQVNfT1NUTSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NIX1RJTUVSX1RNVSBpcyBub3Qgc2V0CiMgQ09ORklHX0VNX1RJ
TUVSX1NUSSBpcyBub3Qgc2V0CkNPTkZJR19DTEtTUkNfVkVSU0FUSUxFPXkKIyBDT05GSUdfQ0xL
U1JDX1BYQSBpcyBub3Qgc2V0CiMgQ09ORklHX0g4MzAwX1RNUjggaXMgbm90IHNldAojIENPTkZJ
R19IODMwMF9UTVIxNiBpcyBub3Qgc2V0CiMgQ09ORklHX0g4MzAwX1RQVSBpcyBub3Qgc2V0CiMg
Q09ORklHX1RJTUVSX0lNWF9TWVNfQ1RSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLU1JDX1NUX0xQ
QyBpcyBub3Qgc2V0CiMgQ09ORklHX0FUQ1BJVDEwMF9USU1FUiBpcyBub3Qgc2V0CiMgQ09ORklH
X01TQzMxM0VfVElNRVIgaXMgbm90IHNldApDT05GSUdfSU5HRU5JQ19USU1FUj15CiMgQ09ORklH
X0lOR0VOSUNfU1lTT1NUIGlzIG5vdCBzZXQKQ09ORklHX0lOR0VOSUNfT1NUPXkKIyBDT05GSUdf
TUlDUk9DSElQX1BJVDY0QiBpcyBub3Qgc2V0CiMgZW5kIG9mIENsb2NrIFNvdXJjZSBkcml2ZXJz
CgpDT05GSUdfTUFJTEJPWD15CkNPTkZJR19JTVhfTUJPWD1tCiMgQ09ORklHX1BMQVRGT1JNX01I
VSBpcyBub3Qgc2V0CkNPTkZJR19BUk1BREFfMzdYWF9SV1RNX01CT1g9bQpDT05GSUdfUk9DS0NI
SVBfTUJPWD15CkNPTkZJR19BTFRFUkFfTUJPWD1tCkNPTkZJR19ISTM2NjBfTUJPWD15CkNPTkZJ
R19ISTYyMjBfTUJPWD15CkNPTkZJR19NQUlMQk9YX1RFU1Q9bQpDT05GSUdfUE9MQVJGSVJFX1NP
Q19NQUlMQk9YPXkKQ09ORklHX1FDT01fQVBDU19JUEM9bQpDT05GSUdfQkNNX1BEQ19NQk9YPW0K
IyBDT05GSUdfU1RNMzJfSVBDQyBpcyBub3Qgc2V0CkNPTkZJR19NVEtfQ01EUV9NQk9YPXkKQ09O
RklHX1NVTjZJX01TR0JPWD1tCiMgQ09ORklHX1NQUkRfTUJPWCBpcyBub3Qgc2V0CkNPTkZJR19R
Q09NX0lQQ0M9eQpDT05GSUdfSU9NTVVfQVBJPXkKIyBDT05GSUdfSU9NTVVfU1VQUE9SVCBpcyBu
b3Qgc2V0CgojCiMgUmVtb3RlcHJvYyBkcml2ZXJzCiMKQ09ORklHX1JFTU9URVBST0M9eQpDT05G
SUdfUkVNT1RFUFJPQ19DREVWPXkKQ09ORklHX0lOR0VOSUNfVlBVX1JQUk9DPXkKIyBDT05GSUdf
TVRLX1NDUCBpcyBub3Qgc2V0CkNPTkZJR19NRVNPTl9NWF9BT19BUkNfUkVNT1RFUFJPQz15CiMg
Q09ORklHX1JDQVJfUkVNT1RFUFJPQyBpcyBub3Qgc2V0CiMgZW5kIG9mIFJlbW90ZXByb2MgZHJp
dmVycwoKIwojIFJwbXNnIGRyaXZlcnMKIwpDT05GSUdfUlBNU0c9bQpDT05GSUdfUlBNU0dfTlM9
bQpDT05GSUdfUlBNU0dfUUNPTV9HTElOSz1tCkNPTkZJR19SUE1TR19RQ09NX0dMSU5LX1JQTT1t
CiMgQ09ORklHX1JQTVNHX1ZJUlRJTyBpcyBub3Qgc2V0CiMgZW5kIG9mIFJwbXNnIGRyaXZlcnMK
CiMgQ09ORklHX1NPVU5EV0lSRSBpcyBub3Qgc2V0CgojCiMgU09DIChTeXN0ZW0gT24gQ2hpcCkg
c3BlY2lmaWMgRHJpdmVycwojCgojCiMgQW1sb2dpYyBTb0MgZHJpdmVycwojCkNPTkZJR19NRVNP
Tl9DQU5WQVM9bQpDT05GSUdfTUVTT05fQ0xLX01FQVNVUkU9bQojIENPTkZJR19NRVNPTl9HWF9T
T0NJTkZPIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVTT05fTVhfU09DSU5GTyBpcyBub3Qgc2V0CiMg
ZW5kIG9mIEFtbG9naWMgU29DIGRyaXZlcnMKCiMKIyBBcHBsZSBTb0MgZHJpdmVycwojCiMgZW5k
IG9mIEFwcGxlIFNvQyBkcml2ZXJzCgojCiMgQVNQRUVEIFNvQyBkcml2ZXJzCiMKQ09ORklHX0FT
UEVFRF9MUENfQ1RSTD15CiMgQ09ORklHX0FTUEVFRF9MUENfU05PT1AgaXMgbm90IHNldAojIENP
TkZJR19BU1BFRURfVUFSVF9ST1VUSU5HIGlzIG5vdCBzZXQKQ09ORklHX0FTUEVFRF9QMkFfQ1RS
TD1tCiMgQ09ORklHX0FTUEVFRF9TT0NJTkZPIGlzIG5vdCBzZXQKIyBlbmQgb2YgQVNQRUVEIFNv
QyBkcml2ZXJzCgpDT05GSUdfQVQ5MV9TT0NfSUQ9eQpDT05GSUdfQVQ5MV9TT0NfU0ZSPXkKCiMK
IyBCcm9hZGNvbSBTb0MgZHJpdmVycwojCkNPTkZJR19CQ00yODM1X1BPV0VSPXkKIyBDT05GSUdf
U09DX0JDTTYzWFggaXMgbm90IHNldApDT05GSUdfU09DX0JSQ01TVEI9eQojIENPTkZJR19CQ01f
UE1CIGlzIG5vdCBzZXQKIyBlbmQgb2YgQnJvYWRjb20gU29DIGRyaXZlcnMKCiMKIyBOWFAvRnJl
ZXNjYWxlIFFvcklRIFNvQyBkcml2ZXJzCiMKQ09ORklHX1FVSUNDX0VOR0lORT15CkNPTkZJR19G
U0xfR1VUUz15CkNPTkZJR19EUEFBMl9DT05TT0xFPXkKIyBlbmQgb2YgTlhQL0ZyZWVzY2FsZSBR
b3JJUSBTb0MgZHJpdmVycwoKIwojIGkuTVggU29DIGRyaXZlcnMKIwpDT05GSUdfU09DX0lNWDhN
PXkKIyBlbmQgb2YgaS5NWCBTb0MgZHJpdmVycwoKIwojIElYUDR4eCBTb0MgZHJpdmVycwojCiMg
Q09ORklHX0lYUDRYWF9RTUdSIGlzIG5vdCBzZXQKQ09ORklHX0lYUDRYWF9OUEU9bQojIGVuZCBv
ZiBJWFA0eHggU29DIGRyaXZlcnMKCiMKIyBFbmFibGUgTGl0ZVggU29DIEJ1aWxkZXIgc3BlY2lm
aWMgZHJpdmVycwojCkNPTkZJR19MSVRFWD15CkNPTkZJR19MSVRFWF9TT0NfQ09OVFJPTExFUj1t
CiMgZW5kIG9mIEVuYWJsZSBMaXRlWCBTb0MgQnVpbGRlciBzcGVjaWZpYyBkcml2ZXJzCgojCiMg
TWVkaWFUZWsgU29DIGRyaXZlcnMKIwpDT05GSUdfTVRLX0NNRFE9bQojIENPTkZJR19NVEtfREVW
QVBDIGlzIG5vdCBzZXQKQ09ORklHX01US19JTkZSQUNGRz15CkNPTkZJR19NVEtfUE1JQ19XUkFQ
PW0KQ09ORklHX01US19TQ1BTWVM9eQojIENPTkZJR19NVEtfTU1TWVMgaXMgbm90IHNldAojIGVu
ZCBvZiBNZWRpYVRlayBTb0MgZHJpdmVycwoKIwojIFF1YWxjb21tIFNvQyBkcml2ZXJzCiMKQ09O
RklHX1FDT01fQ09NTUFORF9EQj1tCiMgQ09ORklHX1FDT01fR0VOSV9TRSBpcyBub3Qgc2V0CkNP
TkZJR19RQ09NX0dTQkk9eQpDT05GSUdfUUNPTV9MTENDPXkKIyBDT05GSUdfUUNPTV9SUE1IIGlz
IG5vdCBzZXQKIyBDT05GSUdfUUNPTV9TTUVNIGlzIG5vdCBzZXQKIyBDT05GSUdfUUNPTV9TTURf
UlBNIGlzIG5vdCBzZXQKIyBDT05GSUdfUUNPTV9TUE0gaXMgbm90IHNldAojIENPTkZJR19RQ09N
X1dDTlNTX0NUUkwgaXMgbm90IHNldAojIGVuZCBvZiBRdWFsY29tbSBTb0MgZHJpdmVycwoKIyBD
T05GSUdfU09DX1JFTkVTQVMgaXMgbm90IHNldApDT05GSUdfUk9DS0NISVBfR1JGPXkKQ09ORklH
X1JPQ0tDSElQX0lPRE9NQUlOPW0KQ09ORklHX1NPQ19TQU1TVU5HPXkKIyBDT05GSUdfRVhZTk9T
X0FTVl9BUk0gaXMgbm90IHNldApDT05GSUdfRVhZTk9TX0NISVBJRD15CkNPTkZJR19FWFlOT1Nf
VVNJPXkKQ09ORklHX0VYWU5PU19QTV9ET01BSU5TPXkKIyBDT05GSUdfRVhZTk9TX1JFR1VMQVRP
Ul9DT1VQTEVSIGlzIG5vdCBzZXQKQ09ORklHX1NPQ19URUdSQTIwX1ZPTFRBR0VfQ09VUExFUj15
CkNPTkZJR19TT0NfVEVHUkEzMF9WT0xUQUdFX0NPVVBMRVI9eQojIENPTkZJR19TT0NfVEkgaXMg
bm90IHNldApDT05GSUdfVVg1MDBfU09DX0lEPXkKCiMKIyBYaWxpbnggU29DIGRyaXZlcnMKIwoj
IGVuZCBvZiBYaWxpbnggU29DIGRyaXZlcnMKIyBlbmQgb2YgU09DIChTeXN0ZW0gT24gQ2hpcCkg
c3BlY2lmaWMgRHJpdmVycwoKQ09ORklHX1BNX0RFVkZSRVE9eQoKIwojIERFVkZSRVEgR292ZXJu
b3JzCiMKQ09ORklHX0RFVkZSRVFfR09WX1NJTVBMRV9PTkRFTUFORD15CkNPTkZJR19ERVZGUkVR
X0dPVl9QRVJGT1JNQU5DRT1tCiMgQ09ORklHX0RFVkZSRVFfR09WX1BPV0VSU0FWRSBpcyBub3Qg
c2V0CkNPTkZJR19ERVZGUkVRX0dPVl9VU0VSU1BBQ0U9bQpDT05GSUdfREVWRlJFUV9HT1ZfUEFT
U0lWRT15CgojCiMgREVWRlJFUSBEcml2ZXJzCiMKQ09ORklHX0FSTV9FWFlOT1NfQlVTX0RFVkZS
RVE9eQpDT05GSUdfQVJNX0lNWF9CVVNfREVWRlJFUT1tCkNPTkZJR19BUk1fVEVHUkFfREVWRlJF
UT15CiMgQ09ORklHX0FSTV9TVU44SV9BMzNfTUJVU19ERVZGUkVRIGlzIG5vdCBzZXQKQ09ORklH
X1BNX0RFVkZSRVFfRVZFTlQ9eQojIENPTkZJR19ERVZGUkVRX0VWRU5UX0VYWU5PU19OT0NQIGlz
IG5vdCBzZXQKQ09ORklHX0RFVkZSRVFfRVZFTlRfRVhZTk9TX1BQTVU9eQojIENPTkZJR19ERVZG
UkVRX0VWRU5UX1JPQ0tDSElQX0RGSSBpcyBub3Qgc2V0CkNPTkZJR19FWFRDT049eQoKIwojIEV4
dGNvbiBEZXZpY2UgRHJpdmVycwojCkNPTkZJR19FWFRDT05fQURDX0pBQ0s9bQpDT05GSUdfRVhU
Q09OX0dQSU89bQpDT05GSUdfRVhUQ09OX01BWDE0NTc3PW0KQ09ORklHX0VYVENPTl9NQVgzMzU1
PXkKIyBDT05GSUdfRVhUQ09OX1BBTE1BUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VYVENPTl9QVE41
MTUwIGlzIG5vdCBzZXQKQ09ORklHX0VYVENPTl9RQ09NX1NQTUlfTUlTQz1tCiMgQ09ORklHX0VY
VENPTl9SVDg5NzNBIGlzIG5vdCBzZXQKQ09ORklHX0VYVENPTl9TTTU1MDI9eQpDT05GSUdfRVhU
Q09OX1VTQl9HUElPPW0KIyBDT05GSUdfRVhUQ09OX1VTQkNfVFVTQjMyMCBpcyBub3Qgc2V0CkNP
TkZJR19NRU1PUlk9eQpDT05GSUdfRERSPXkKIyBDT05GSUdfQVRNRUxfU0RSQU1DIGlzIG5vdCBz
ZXQKQ09ORklHX0FUTUVMX0VCST15CkNPTkZJR19CUkNNU1RCX0RQRkU9bQojIENPTkZJR19CVDFf
TDJfQ1RMIGlzIG5vdCBzZXQKQ09ORklHX1RJX0FFTUlGPW0KQ09ORklHX1RJX0VNSUY9bQpDT05G
SUdfT01BUF9HUE1DPXkKQ09ORklHX09NQVBfR1BNQ19ERUJVRz15CiMgQ09ORklHX0ZQR0FfREZM
X0VNSUYgaXMgbm90IHNldAojIENPTkZJR19NVkVCVV9ERVZCVVMgaXMgbm90IHNldAojIENPTkZJ
R19GU0xfQ09SRU5FVF9DRiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZTTF9JRkMgaXMgbm90IHNldApD
T05GSUdfSlo0NzgwX05FTUM9eQojIENPTkZJR19NVEtfU01JIGlzIG5vdCBzZXQKIyBDT05GSUdf
REE4WFhfRERSQ1RMIGlzIG5vdCBzZXQKQ09ORklHX1JFTkVTQVNfUlBDSUY9eQpDT05GSUdfU1RN
MzJfRk1DMl9FQkk9eQpDT05GSUdfU0FNU1VOR19NQz15CiMgQ09ORklHX0VYWU5PUzU0MjJfRE1D
IGlzIG5vdCBzZXQKQ09ORklHX0VYWU5PU19TUk9NPXkKQ09ORklHX1RFR1JBX01DPXkKQ09ORklH
X1RFR1JBMjBfRU1DPXkKIyBDT05GSUdfVEVHUkEzMF9FTUMgaXMgbm90IHNldApDT05GSUdfVEVH
UkExMjRfRU1DPXkKQ09ORklHX1RFR1JBMjEwX0VNQ19UQUJMRT15CkNPTkZJR19URUdSQTIxMF9F
TUM9eQpDT05GSUdfSUlPPW0KQ09ORklHX0lJT19CVUZGRVI9eQpDT05GSUdfSUlPX0JVRkZFUl9D
Qj1tCkNPTkZJR19JSU9fQlVGRkVSX0RNQT1tCkNPTkZJR19JSU9fQlVGRkVSX0RNQUVOR0lORT1t
CkNPTkZJR19JSU9fQlVGRkVSX0hXX0NPTlNVTUVSPW0KQ09ORklHX0lJT19LRklGT19CVUY9bQpD
T05GSUdfSUlPX1RSSUdHRVJFRF9CVUZGRVI9bQpDT05GSUdfSUlPX0NPTkZJR0ZTPW0KQ09ORklH
X0lJT19UUklHR0VSPXkKQ09ORklHX0lJT19DT05TVU1FUlNfUEVSX1RSSUdHRVI9MgojIENPTkZJ
R19JSU9fU1dfREVWSUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfSUlPX1NXX1RSSUdHRVIgaXMgbm90
IHNldApDT05GSUdfSUlPX1RSSUdHRVJFRF9FVkVOVD1tCgojCiMgQWNjZWxlcm9tZXRlcnMKIwpD
T05GSUdfQURYTDMxMz1tCkNPTkZJR19BRFhMMzEzX0kyQz1tCkNPTkZJR19BRFhMMzQ1PW0KQ09O
RklHX0FEWEwzNDVfSTJDPW0KIyBDT05GSUdfQURYTDM1NV9JMkMgaXMgbm90IHNldApDT05GSUdf
QURYTDM3Mj1tCkNPTkZJR19BRFhMMzcyX0kyQz1tCkNPTkZJR19CTUExODA9bQpDT05GSUdfQk1B
NDAwPW0KQ09ORklHX0JNQTQwMF9JMkM9bQojIENPTkZJR19CTUMxNTBfQUNDRUwgaXMgbm90IHNl
dAojIENPTkZJR19EQTI4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0RBMzExIGlzIG5vdCBzZXQKQ09O
RklHX0RNQVJEMDY9bQojIENPTkZJR19ETUFSRDA5IGlzIG5vdCBzZXQKQ09ORklHX0RNQVJEMTA9
bQojIENPTkZJR19GWExTODk2MkFGX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lJT19TVF9BQ0NF
TF8zQVhJUyBpcyBub3Qgc2V0CkNPTkZJR19LWFNEOT1tCkNPTkZJR19LWFNEOV9JMkM9bQojIENP
TkZJR19LWENKSzEwMTMgaXMgbm90IHNldApDT05GSUdfTUMzMjMwPW0KQ09ORklHX01NQTc0NTU9
bQpDT05GSUdfTU1BNzQ1NV9JMkM9bQpDT05GSUdfTU1BNzY2MD1tCiMgQ09ORklHX01NQTg0NTIg
aXMgbm90IHNldApDT05GSUdfTU1BOTU1MV9DT1JFPW0KQ09ORklHX01NQTk1NTE9bQpDT05GSUdf
TU1BOTU1Mz1tCiMgQ09ORklHX01YQzQwMDUgaXMgbm90IHNldApDT05GSUdfTVhDNjI1NT1tCkNP
TkZJR19TVEs4MzEyPW0KIyBDT05GSUdfU1RLOEJBNTAgaXMgbm90IHNldAojIGVuZCBvZiBBY2Nl
bGVyb21ldGVycwoKIwojIEFuYWxvZyB0byBkaWdpdGFsIGNvbnZlcnRlcnMKIwpDT05GSUdfQUQ3
MDkxUjU9bQpDT05GSUdfQUQ3MjkxPW0KQ09ORklHX0FENzYwNj1tCkNPTkZJR19BRDc2MDZfSUZB
Q0VfUEFSQUxMRUw9bQpDT05GSUdfQUQ3OTlYPW0KQ09ORklHX0FESV9BWElfQURDPW0KQ09ORklH
X0FTUEVFRF9BREM9bQojIENPTkZJR19BVDkxX1NBTUE1RDJfQURDIGlzIG5vdCBzZXQKQ09ORklH
X0FYUDIwWF9BREM9bQojIENPTkZJR19BWFAyODhfQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNN
X0lQUk9DX0FEQyBpcyBub3Qgc2V0CkNPTkZJR19CRVJMSU4yX0FEQz1tCkNPTkZJR19DQzEwMDAx
X0FEQz1tCkNPTkZJR19EQTkxNTBfR1BBREM9bQpDT05GSUdfRExOMl9BREM9bQojIENPTkZJR19F
TlZFTE9QRV9ERVRFQ1RPUiBpcyBub3Qgc2V0CkNPTkZJR19FWFlOT1NfQURDPW0KQ09ORklHX01Y
U19MUkFEQ19BREM9bQpDT05GSUdfRlNMX01YMjVfQURDPW0KQ09ORklHX0hYNzExPW0KQ09ORklH
X0lOQTJYWF9BREM9bQpDT05GSUdfSU5HRU5JQ19BREM9bQojIENPTkZJR19JTVg3RF9BREMgaXMg
bm90IHNldApDT05GSUdfSU1YOFFYUF9BREM9bQpDT05GSUdfTFA4Nzg4X0FEQz1tCkNPTkZJR19M
UEMxOFhYX0FEQz1tCkNPTkZJR19MUEMzMlhYX0FEQz1tCiMgQ09ORklHX0xUQzI0NzEgaXMgbm90
IHNldApDT05GSUdfTFRDMjQ4NT1tCkNPTkZJR19MVEMyNDk3PW0KIyBDT05GSUdfTUFYMTM2MyBp
cyBub3Qgc2V0CkNPTkZJR19NQVg5NjExPW0KQ09ORklHX01DUDM0MjI9bQojIENPTkZJR19NRURJ
QVRFS19NVDYzNjBfQURDIGlzIG5vdCBzZXQKQ09ORklHX01FRElBVEVLX01UNjU3N19BVVhBREM9
bQpDT05GSUdfTUVOX1oxODhfQURDPW0KIyBDT05GSUdfTUVTT05fU0FSQURDIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkFVNzgwMiBpcyBub3Qgc2V0CkNPTkZJR19OUENNX0FEQz1tCiMgQ09ORklHX1BB
TE1BU19HUEFEQyBpcyBub3Qgc2V0CkNPTkZJR19RQ09NX1ZBRENfQ09NTU9OPW0KIyBDT05GSUdf
UUNPTV9QTThYWFhfWE9BREMgaXMgbm90IHNldApDT05GSUdfUUNPTV9TUE1JX0lBREM9bQpDT05G
SUdfUUNPTV9TUE1JX1ZBREM9bQojIENPTkZJR19RQ09NX1NQTUlfQURDNSBpcyBub3Qgc2V0CkNP
TkZJR19SQ0FSX0dZUk9fQURDPW0KIyBDT05GSUdfUk9DS0NISVBfU0FSQURDIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlpHMkxfQURDIGlzIG5vdCBzZXQKQ09ORklHX1NDMjdYWF9BREM9bQojIENPTkZJ
R19TUEVBUl9BREMgaXMgbm90IHNldAojIENPTkZJR19TRF9BRENfTU9EVUxBVE9SIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU1RNMzJfQURDX0NPUkUgaXMgbm90IHNldApDT05GSUdfU1RNMzJfREZTRE1f
Q09SRT1tCkNPTkZJR19TVE0zMl9ERlNETV9BREM9bQpDT05GSUdfU1RNUEVfQURDPW0KIyBDT05G
SUdfVElfQURDMDgxQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0FEUzEwMTUgaXMgbm90IHNldApD
T05GSUdfVFdMNDAzMF9NQURDPW0KQ09ORklHX1RXTDYwMzBfR1BBREM9bQpDT05GSUdfVkY2MTBf
QURDPW0KQ09ORklHX1ZJUEVSQk9BUkRfQURDPW0KIyBDT05GSUdfWElMSU5YX1hBREMgaXMgbm90
IHNldAojIENPTkZJR19YSUxJTlhfQU1TIGlzIG5vdCBzZXQKIyBlbmQgb2YgQW5hbG9nIHRvIGRp
Z2l0YWwgY29udmVydGVycwoKIwojIEFuYWxvZyB0byBkaWdpdGFsIGFuZCBkaWdpdGFsIHRvIGFu
YWxvZyBjb252ZXJ0ZXJzCiMKIyBlbmQgb2YgQW5hbG9nIHRvIGRpZ2l0YWwgYW5kIGRpZ2l0YWwg
dG8gYW5hbG9nIGNvbnZlcnRlcnMKCiMKIyBBbmFsb2cgRnJvbnQgRW5kcwojCkNPTkZJR19JSU9f
UkVTQ0FMRT1tCiMgZW5kIG9mIEFuYWxvZyBGcm9udCBFbmRzCgojCiMgQW1wbGlmaWVycwojCkNP
TkZJR19ITUM0MjU9bQojIGVuZCBvZiBBbXBsaWZpZXJzCgojCiMgQ2FwYWNpdGFuY2UgdG8gZGln
aXRhbCBjb252ZXJ0ZXJzCiMKQ09ORklHX0FENzE1MD1tCiMgZW5kIG9mIENhcGFjaXRhbmNlIHRv
IGRpZ2l0YWwgY29udmVydGVycwoKIwojIENoZW1pY2FsIFNlbnNvcnMKIwpDT05GSUdfQVRMQVNf
UEhfU0VOU09SPW0KQ09ORklHX0FUTEFTX0VaT19TRU5TT1I9bQojIENPTkZJR19CTUU2ODAgaXMg
bm90IHNldApDT05GSUdfQ0NTODExPW0KQ09ORklHX0lBUUNPUkU9bQojIENPTkZJR19TQ0QzMF9D
T1JFIGlzIG5vdCBzZXQKQ09ORklHX1NDRDRYPW0KQ09ORklHX1NFTlNJUklPTl9TR1AzMD1tCkNP
TkZJR19TRU5TSVJJT05fU0dQNDA9bQojIENPTkZJR19TUFMzMF9JMkMgaXMgbm90IHNldAojIENP
TkZJR19TRU5TRUFJUl9TVU5SSVNFX0NPMiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZaODlYIGlzIG5v
dCBzZXQKIyBlbmQgb2YgQ2hlbWljYWwgU2Vuc29ycwoKIwojIEhpZCBTZW5zb3IgSUlPIENvbW1v
bgojCiMgZW5kIG9mIEhpZCBTZW5zb3IgSUlPIENvbW1vbgoKQ09ORklHX0lJT19NU19TRU5TT1JT
X0kyQz1tCgojCiMgSUlPIFNDTUkgU2Vuc29ycwojCiMgZW5kIG9mIElJTyBTQ01JIFNlbnNvcnMK
CiMKIyBTU1AgU2Vuc29yIENvbW1vbgojCiMgZW5kIG9mIFNTUCBTZW5zb3IgQ29tbW9uCgpDT05G
SUdfSUlPX1NUX1NFTlNPUlNfSTJDPW0KQ09ORklHX0lJT19TVF9TRU5TT1JTX0NPUkU9bQoKIwoj
IERpZ2l0YWwgdG8gYW5hbG9nIGNvbnZlcnRlcnMKIwojIENPTkZJR19BRDUwNjQgaXMgbm90IHNl
dApDT05GSUdfQUQ1MzgwPW0KQ09ORklHX0FENTQ0Nj1tCkNPTkZJR19BRDU1OTJSX0JBU0U9bQpD
T05GSUdfQUQ1NTkzUj1tCkNPTkZJR19BRDU2ODY9bQpDT05GSUdfQUQ1Njk2X0kyQz1tCkNPTkZJ
R19EUE9UX0RBQz1tCkNPTkZJR19EUzQ0MjQ9bQpDT05GSUdfTFBDMThYWF9EQUM9bQojIENPTkZJ
R19NNjIzMzIgaXMgbm90IHNldApDT05GSUdfTUFYNTE3PW0KQ09ORklHX01BWDU4MjE9bQojIENP
TkZJR19NQ1A0NzI1IGlzIG5vdCBzZXQKQ09ORklHX1NUTTMyX0RBQz1tCkNPTkZJR19TVE0zMl9E
QUNfQ09SRT1tCkNPTkZJR19USV9EQUM1NTcxPW0KQ09ORklHX1ZGNjEwX0RBQz1tCiMgZW5kIG9m
IERpZ2l0YWwgdG8gYW5hbG9nIGNvbnZlcnRlcnMKCiMKIyBJSU8gZHVtbXkgZHJpdmVyCiMKIyBl
bmQgb2YgSUlPIGR1bW15IGRyaXZlcgoKIwojIEZpbHRlcnMKIwojIGVuZCBvZiBGaWx0ZXJzCgoj
CiMgRnJlcXVlbmN5IFN5bnRoZXNpemVycyBERFMvUExMCiMKCiMKIyBDbG9jayBHZW5lcmF0b3Iv
RGlzdHJpYnV0aW9uCiMKIyBlbmQgb2YgQ2xvY2sgR2VuZXJhdG9yL0Rpc3RyaWJ1dGlvbgoKIwoj
IFBoYXNlLUxvY2tlZCBMb29wIChQTEwpIGZyZXF1ZW5jeSBzeW50aGVzaXplcnMKIwojIGVuZCBv
ZiBQaGFzZS1Mb2NrZWQgTG9vcCAoUExMKSBmcmVxdWVuY3kgc3ludGhlc2l6ZXJzCiMgZW5kIG9m
IEZyZXF1ZW5jeSBTeW50aGVzaXplcnMgRERTL1BMTAoKIwojIERpZ2l0YWwgZ3lyb3Njb3BlIHNl
bnNvcnMKIwpDT05GSUdfQk1HMTYwPW0KQ09ORklHX0JNRzE2MF9JMkM9bQojIENPTkZJR19GWEFT
MjEwMDJDIGlzIG5vdCBzZXQKQ09ORklHX01QVTMwNTA9bQpDT05GSUdfTVBVMzA1MF9JMkM9bQpD
T05GSUdfSUlPX1NUX0dZUk9fM0FYSVM9bQpDT05GSUdfSUlPX1NUX0dZUk9fSTJDXzNBWElTPW0K
IyBDT05GSUdfSVRHMzIwMCBpcyBub3Qgc2V0CiMgZW5kIG9mIERpZ2l0YWwgZ3lyb3Njb3BlIHNl
bnNvcnMKCiMKIyBIZWFsdGggU2Vuc29ycwojCgojCiMgSGVhcnQgUmF0ZSBNb25pdG9ycwojCkNP
TkZJR19BRkU0NDA0PW0KQ09ORklHX01BWDMwMTAwPW0KIyBDT05GSUdfTUFYMzAxMDIgaXMgbm90
IHNldAojIGVuZCBvZiBIZWFydCBSYXRlIE1vbml0b3JzCiMgZW5kIG9mIEhlYWx0aCBTZW5zb3Jz
CgojCiMgSHVtaWRpdHkgc2Vuc29ycwojCkNPTkZJR19BTTIzMTU9bQpDT05GSUdfREhUMTE9bQoj
IENPTkZJR19IREMxMDBYIGlzIG5vdCBzZXQKQ09ORklHX0hEQzIwMTA9bQpDT05GSUdfSFRTMjIx
PW0KQ09ORklHX0hUUzIyMV9JMkM9bQpDT05GSUdfSFRVMjE9bQpDT05GSUdfU0k3MDA1PW0KQ09O
RklHX1NJNzAyMD1tCiMgZW5kIG9mIEh1bWlkaXR5IHNlbnNvcnMKCiMKIyBJbmVydGlhbCBtZWFz
dXJlbWVudCB1bml0cwojCkNPTkZJR19CTUkxNjA9bQpDT05GSUdfQk1JMTYwX0kyQz1tCkNPTkZJ
R19GWE9TODcwMD1tCkNPTkZJR19GWE9TODcwMF9JMkM9bQojIENPTkZJR19LTVg2MSBpcyBub3Qg
c2V0CiMgQ09ORklHX0lOVl9JQ000MjYwMF9JMkMgaXMgbm90IHNldApDT05GSUdfSU5WX01QVTYw
NTBfSUlPPW0KQ09ORklHX0lOVl9NUFU2MDUwX0kyQz1tCkNPTkZJR19JSU9fU1RfTFNNNkRTWD1t
CkNPTkZJR19JSU9fU1RfTFNNNkRTWF9JMkM9bQpDT05GSUdfSUlPX1NUX0xTTTZEU1hfSTNDPW0K
IyBDT05GSUdfSUlPX1NUX0xTTTlEUzAgaXMgbm90IHNldAojIGVuZCBvZiBJbmVydGlhbCBtZWFz
dXJlbWVudCB1bml0cwoKIwojIExpZ2h0IHNlbnNvcnMKIwojIENPTkZJR19BREpEX1MzMTEgaXMg
bm90IHNldAojIENPTkZJR19BRFVYMTAyMCBpcyBub3Qgc2V0CkNPTkZJR19BTDMwMTA9bQpDT05G
SUdfQUwzMzIwQT1tCiMgQ09ORklHX0FQRFM5MzAwIGlzIG5vdCBzZXQKQ09ORklHX0FQRFM5OTYw
PW0KQ09ORklHX0FTNzMyMTE9bQpDT05GSUdfQkgxNzUwPW0KQ09ORklHX0JIMTc4MD1tCiMgQ09O
RklHX0NNMzIxODEgaXMgbm90IHNldAojIENPTkZJR19DTTMyMzIgaXMgbm90IHNldApDT05GSUdf
Q00zMzIzPW0KQ09ORklHX0NNMzYwNT1tCkNPTkZJR19DTTM2NjUxPW0KQ09ORklHX0dQMkFQMDAy
PW0KIyBDT05GSUdfR1AyQVAwMjBBMDBGIGlzIG5vdCBzZXQKQ09ORklHX0lRUzYyMV9BTFM9bQpD
T05GSUdfU0VOU09SU19JU0wyOTAxOD1tCkNPTkZJR19TRU5TT1JTX0lTTDI5MDI4PW0KIyBDT05G
SUdfSVNMMjkxMjUgaXMgbm90IHNldApDT05GSUdfSlNBMTIxMj1tCkNPTkZJR19SUFIwNTIxPW0K
Q09ORklHX1NFTlNPUlNfTE0zNTMzPW0KQ09ORklHX0xUUjUwMT1tCkNPTkZJR19MVjAxMDRDUz1t
CkNPTkZJR19NQVg0NDAwMD1tCkNPTkZJR19NQVg0NDAwOT1tCkNPTkZJR19OT0ExMzA1PW0KQ09O
RklHX09QVDMwMDE9bQpDT05GSUdfUEExMjIwMzAwMT1tCiMgQ09ORklHX1NJMTEzMyBpcyBub3Qg
c2V0CkNPTkZJR19TSTExNDU9bQpDT05GSUdfU1RLMzMxMD1tCkNPTkZJR19TVF9VVklTMjU9bQpD
T05GSUdfU1RfVVZJUzI1X0kyQz1tCkNPTkZJR19UQ1MzNDE0PW0KQ09ORklHX1RDUzM0NzI9bQpD
T05GSUdfU0VOU09SU19UU0wyNTYzPW0KIyBDT05GSUdfVFNMMjU4MyBpcyBub3Qgc2V0CkNPTkZJ
R19UU0wyNTkxPW0KIyBDT05GSUdfVFNMMjc3MiBpcyBub3Qgc2V0CiMgQ09ORklHX1RTTDQ1MzEg
aXMgbm90IHNldApDT05GSUdfVVM1MTgyRD1tCiMgQ09ORklHX1ZDTkw0MDAwIGlzIG5vdCBzZXQK
IyBDT05GSUdfVkNOTDQwMzUgaXMgbm90IHNldApDT05GSUdfVkVNTDYwMzA9bQpDT05GSUdfVkVN
TDYwNzA9bQpDT05GSUdfVkw2MTgwPW0KQ09ORklHX1pPUFQyMjAxPW0KIyBlbmQgb2YgTGlnaHQg
c2Vuc29ycwoKIwojIE1hZ25ldG9tZXRlciBzZW5zb3JzCiMKQ09ORklHX0FLODk3ND1tCkNPTkZJ
R19BSzg5NzU9bQpDT05GSUdfQUswOTkxMT1tCkNPTkZJR19CTUMxNTBfTUFHTj1tCkNPTkZJR19C
TUMxNTBfTUFHTl9JMkM9bQpDT05GSUdfTUFHMzExMD1tCkNPTkZJR19NTUMzNTI0MD1tCiMgQ09O
RklHX0lJT19TVF9NQUdOXzNBWElTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19ITUM1ODQz
X0kyQyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX1JNMzEwMD1tCkNPTkZJR19TRU5TT1JTX1JN
MzEwMF9JMkM9bQojIENPTkZJR19ZQU1BSEFfWUFTNTMwIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWFn
bmV0b21ldGVyIHNlbnNvcnMKCiMKIyBNdWx0aXBsZXhlcnMKIwpDT05GSUdfSUlPX01VWD1tCiMg
ZW5kIG9mIE11bHRpcGxleGVycwoKIwojIEluY2xpbm9tZXRlciBzZW5zb3JzCiMKIyBlbmQgb2Yg
SW5jbGlub21ldGVyIHNlbnNvcnMKCiMKIyBUcmlnZ2VycyAtIHN0YW5kYWxvbmUKIwpDT05GSUdf
SUlPX0lOVEVSUlVQVF9UUklHR0VSPW0KQ09ORklHX0lJT19TVE0zMl9MUFRJTUVSX1RSSUdHRVI9
bQojIENPTkZJR19JSU9fU1RNMzJfVElNRVJfVFJJR0dFUiBpcyBub3Qgc2V0CkNPTkZJR19JSU9f
U1lTRlNfVFJJR0dFUj1tCiMgZW5kIG9mIFRyaWdnZXJzIC0gc3RhbmRhbG9uZQoKIwojIExpbmVh
ciBhbmQgYW5ndWxhciBwb3NpdGlvbiBzZW5zb3JzCiMKQ09ORklHX0lRUzYyNF9QT1M9bQojIGVu
ZCBvZiBMaW5lYXIgYW5kIGFuZ3VsYXIgcG9zaXRpb24gc2Vuc29ycwoKIwojIERpZ2l0YWwgcG90
ZW50aW9tZXRlcnMKIwpDT05GSUdfQUQ1MTEwPW0KIyBDT05GSUdfQUQ1MjcyIGlzIG5vdCBzZXQK
Q09ORklHX0RTMTgwMz1tCkNPTkZJR19NQVg1NDMyPW0KQ09ORklHX01DUDQwMTg9bQpDT05GSUdf
TUNQNDUzMT1tCkNPTkZJR19UUEwwMTAyPW0KIyBlbmQgb2YgRGlnaXRhbCBwb3RlbnRpb21ldGVy
cwoKIwojIERpZ2l0YWwgcG90ZW50aW9zdGF0cwojCiMgQ09ORklHX0xNUDkxMDAwIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgRGlnaXRhbCBwb3RlbnRpb3N0YXRzCgojCiMgUHJlc3N1cmUgc2Vuc29ycwoj
CiMgQ09ORklHX0FCUDA2ME1HIGlzIG5vdCBzZXQKQ09ORklHX0JNUDI4MD1tCkNPTkZJR19CTVAy
ODBfSTJDPW0KQ09ORklHX0RMSEw2MEQ9bQojIENPTkZJR19EUFMzMTAgaXMgbm90IHNldApDT05G
SUdfSFAwMz1tCkNPTkZJR19JQ1AxMDEwMD1tCiMgQ09ORklHX01QTDExNV9JMkMgaXMgbm90IHNl
dApDT05GSUdfTVBMMzExNT1tCkNPTkZJR19NUzU2MTE9bQojIENPTkZJR19NUzU2MTFfSTJDIGlz
IG5vdCBzZXQKQ09ORklHX01TNTYzNz1tCkNPTkZJR19JSU9fU1RfUFJFU1M9bQpDT05GSUdfSUlP
X1NUX1BSRVNTX0kyQz1tCkNPTkZJR19UNTQwMz1tCiMgQ09ORklHX0hQMjA2QyBpcyBub3Qgc2V0
CkNPTkZJR19aUEEyMzI2PW0KQ09ORklHX1pQQTIzMjZfSTJDPW0KIyBlbmQgb2YgUHJlc3N1cmUg
c2Vuc29ycwoKIwojIExpZ2h0bmluZyBzZW5zb3JzCiMKIyBlbmQgb2YgTGlnaHRuaW5nIHNlbnNv
cnMKCiMKIyBQcm94aW1pdHkgYW5kIGRpc3RhbmNlIHNlbnNvcnMKIwpDT05GSUdfSVNMMjk1MDE9
bQpDT05GSUdfTElEQVJfTElURV9WMj1tCkNPTkZJR19NQjEyMzI9bQojIENPTkZJR19QSU5HIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkZENzc0MDIgaXMgbm90IHNldAojIENPTkZJR19TUkYwNCBpcyBu
b3Qgc2V0CkNPTkZJR19TWDkzMTA9bQojIENPTkZJR19TWDk1MDAgaXMgbm90IHNldApDT05GSUdf
U1JGMDg9bQpDT05GSUdfVkNOTDMwMjA9bQpDT05GSUdfVkw1M0wwWF9JMkM9bQojIGVuZCBvZiBQ
cm94aW1pdHkgYW5kIGRpc3RhbmNlIHNlbnNvcnMKCiMKIyBSZXNvbHZlciB0byBkaWdpdGFsIGNv
bnZlcnRlcnMKIwojIGVuZCBvZiBSZXNvbHZlciB0byBkaWdpdGFsIGNvbnZlcnRlcnMKCiMKIyBU
ZW1wZXJhdHVyZSBzZW5zb3JzCiMKQ09ORklHX0lRUzYyMEFUX1RFTVA9bQpDT05GSUdfTUxYOTA2
MTQ9bQojIENPTkZJR19NTFg5MDYzMiBpcyBub3Qgc2V0CkNPTkZJR19UTVAwMDY9bQpDT05GSUdf
VE1QMDA3PW0KQ09ORklHX1RNUDExNz1tCiMgQ09ORklHX1RTWVMwMSBpcyBub3Qgc2V0CiMgQ09O
RklHX1RTWVMwMkQgaXMgbm90IHNldAojIGVuZCBvZiBUZW1wZXJhdHVyZSBzZW5zb3JzCgojIENP
TkZJR19QV00gaXMgbm90IHNldAoKIwojIElSUSBjaGlwIHN1cHBvcnQKIwpDT05GSUdfSVJRQ0hJ
UD15CkNPTkZJR19BTF9GSUM9eQojIENPTkZJR19KQ09SRV9BSUMgaXMgbm90IHNldApDT05GSUdf
UkVORVNBU19JTlRDX0lSUVBJTj15CkNPTkZJR19SRU5FU0FTX0lSUUM9eQpDT05GSUdfUkVORVNB
U19SWkExX0lSUUM9eQojIENPTkZJR19TTDI4Q1BMRF9JTlRDIGlzIG5vdCBzZXQKIyBDT05GSUdf
VFM0ODAwX0lSUSBpcyBub3Qgc2V0CkNPTkZJR19YSUxJTlhfSU5UQz15CiMgQ09ORklHX0lOR0VO
SUNfVENVX0lSUSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFTkVTQVNfSDhTX0lOVEMgaXMgbm90IHNl
dAojIENPTkZJR19JUlFfVU5JUEhJRVJfQUlERVQgaXMgbm90IHNldApDT05GSUdfTUVTT05fSVJR
X0dQSU89bQpDT05GSUdfSU1YX0lSUVNURUVSPXkKIyBDT05GSUdfSU1YX0lOVE1VWCBpcyBub3Qg
c2V0CkNPTkZJR19FWFlOT1NfSVJRX0NPTUJJTkVSPXkKIyBDT05GSUdfTE9PTkdTT05fUENIX1BJ
QyBpcyBub3Qgc2V0CkNPTkZJR19NU1RfSVJRPXkKQ09ORklHX01DSFBfRUlDPXkKIyBlbmQgb2Yg
SVJRIGNoaXAgc3VwcG9ydAoKIyBDT05GSUdfSVBBQ0tfQlVTIGlzIG5vdCBzZXQKQ09ORklHX1JF
U0VUX0NPTlRST0xMRVI9eQojIENPTkZJR19SRVNFVF9BVEg3OSBpcyBub3Qgc2V0CiMgQ09ORklH
X1JFU0VUX0FYUzEwWCBpcyBub3Qgc2V0CkNPTkZJR19SRVNFVF9CQ002MzQ1PXkKIyBDT05GSUdf
UkVTRVRfQkVSTElOIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRfQlJDTVNUQiBpcyBub3Qgc2V0
CkNPTkZJR19SRVNFVF9CUkNNU1RCX1JFU0NBTD15CiMgQ09ORklHX1JFU0VUX0hTREsgaXMgbm90
IHNldAojIENPTkZJR19SRVNFVF9JTVg3IGlzIG5vdCBzZXQKQ09ORklHX1JFU0VUX0lOVEVMX0dX
PXkKIyBDT05GSUdfUkVTRVRfSzIxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFU0VUX0xBTlRJUSBp
cyBub3Qgc2V0CiMgQ09ORklHX1JFU0VUX0xQQzE4WFggaXMgbm90IHNldAojIENPTkZJR19SRVNF
VF9NQ0hQX1NQQVJYNSBpcyBub3Qgc2V0CkNPTkZJR19SRVNFVF9NRVNPTj1tCiMgQ09ORklHX1JF
U0VUX01FU09OX0FVRElPX0FSQiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFU0VUX05QQ00gaXMgbm90
IHNldApDT05GSUdfUkVTRVRfUElTVEFDSElPPXkKQ09ORklHX1JFU0VUX1FDT01fQU9TUz15CkNP
TkZJR19SRVNFVF9RQ09NX1BEQz15CkNPTkZJR19SRVNFVF9SQVNQQkVSUllQST1tCiMgQ09ORklH
X1JFU0VUX1JaRzJMX1VTQlBIWV9DVFJMIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRfU0NNSSBp
cyBub3Qgc2V0CkNPTkZJR19SRVNFVF9TSU1QTEU9eQojIENPTkZJR19SRVNFVF9TT0NGUEdBIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkVTRVRfU1RBUkZJVkVfSkg3MTAwIGlzIG5vdCBzZXQKQ09ORklH
X1JFU0VUX1NVTlhJPXkKIyBDT05GSUdfUkVTRVRfVElfU1lTQ09OIGlzIG5vdCBzZXQKQ09ORklH
X1JFU0VUX1VOSVBISUVSPW0KIyBDT05GSUdfUkVTRVRfVU5JUEhJRVJfR0xVRSBpcyBub3Qgc2V0
CkNPTkZJR19SRVNFVF9aWU5RPXkKQ09ORklHX0NPTU1PTl9SRVNFVF9ISTM2NjA9eQpDT05GSUdf
Q09NTU9OX1JFU0VUX0hJNjIyMD15CgojCiMgUEhZIFN1YnN5c3RlbQojCkNPTkZJR19HRU5FUklD
X1BIWT15CkNPTkZJR19HRU5FUklDX1BIWV9NSVBJX0RQSFk9eQpDT05GSUdfUEhZX0xQQzE4WFhf
VVNCX09URz15CiMgQ09ORklHX1BIWV9QSVNUQUNISU9fVVNCIGlzIG5vdCBzZXQKQ09ORklHX1BI
WV9YR0VORT15CkNPTkZJR19VU0JfTEdNX1BIWT15CiMgQ09ORklHX1BIWV9DQU5fVFJBTlNDRUlW
RVIgaXMgbm90IHNldApDT05GSUdfUEhZX1NVTjRJX1VTQj1tCkNPTkZJR19QSFlfU1VONklfTUlQ
SV9EUEhZPW0KIyBDT05GSUdfUEhZX1NVTjlJX1VTQiBpcyBub3Qgc2V0CkNPTkZJR19QSFlfU1VO
NTBJX1VTQjM9bQojIENPTkZJR19QSFlfTUVTT044X0hETUlfVFggaXMgbm90IHNldApDT05GSUdf
UEhZX01FU09OOEJfVVNCMj15CkNPTkZJR19QSFlfTUVTT05fR1hMX1VTQjI9eQpDT05GSUdfUEhZ
X01FU09OX0cxMkFfVVNCMj1tCkNPTkZJR19QSFlfTUVTT05fRzEyQV9VU0IzX1BDSUU9bQpDT05G
SUdfUEhZX01FU09OX0FYR19QQ0lFPXkKQ09ORklHX1BIWV9NRVNPTl9BWEdfTUlQSV9QQ0lFX0FO
QUxPRz1tCkNPTkZJR19QSFlfTUVTT05fQVhHX01JUElfRFBIWT1tCgojCiMgUEhZIGRyaXZlcnMg
Zm9yIEJyb2FkY29tIHBsYXRmb3JtcwojCkNPTkZJR19QSFlfQkNNNjNYWF9VU0JIPW0KIyBDT05G
SUdfUEhZX0NZR05VU19QQ0lFIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0JDTV9TUl9VU0IgaXMg
bm90IHNldApDT05GSUdfQkNNX0tPTkFfVVNCMl9QSFk9bQpDT05GSUdfUEhZX0JDTV9OU19VU0Iy
PXkKQ09ORklHX1BIWV9OUzJfVVNCX0RSRD15CkNPTkZJR19QSFlfQlJDTV9TQVRBPW0KIyBDT05G
SUdfUEhZX0JSQ01fVVNCIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9CQ01fU1JfUENJRT15CiMgZW5k
IG9mIFBIWSBkcml2ZXJzIGZvciBCcm9hZGNvbSBwbGF0Zm9ybXMKCkNPTkZJR19QSFlfQ0FERU5D
RV9UT1JSRU5UPXkKIyBDT05GSUdfUEhZX0NBREVOQ0VfRFBIWSBpcyBub3Qgc2V0CkNPTkZJR19Q
SFlfQ0FERU5DRV9TSUVSUkE9bQpDT05GSUdfUEhZX0NBREVOQ0VfU0FMVk89eQojIENPTkZJR19Q
SFlfRlNMX0lNWDhNUV9VU0IgaXMgbm90IHNldApDT05GSUdfUEhZX01JWEVMX01JUElfRFBIWT1t
CiMgQ09ORklHX1BIWV9GU0xfSU1YOE1fUENJRSBpcyBub3Qgc2V0CkNPTkZJR19QSFlfSEk2MjIw
X1VTQj15CiMgQ09ORklHX1BIWV9ISTM2NjBfVVNCIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9ISTM2
NzBfVVNCPXkKQ09ORklHX1BIWV9ISTM2NzBfUENJRT15CkNPTkZJR19QSFlfSElTVEJfQ09NQlBI
WT15CiMgQ09ORklHX1BIWV9ISVNJX0lOTk9fVVNCMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9J
TkdFTklDX1VTQiBpcyBub3Qgc2V0CkNPTkZJR19QSFlfTEFOVElRX1ZSWDIwMF9QQ0lFPXkKQ09O
RklHX1BIWV9MQU5USVFfUkNVX1VTQjI9eQpDT05GSUdfQVJNQURBMzc1X1VTQkNMVVNURVJfUEhZ
PXkKQ09ORklHX1BIWV9CRVJMSU5fU0FUQT1tCiMgQ09ORklHX1BIWV9CRVJMSU5fVVNCIGlzIG5v
dCBzZXQKQ09ORklHX1BIWV9NVkVCVV9BMzcwMF9VVE1JPXkKIyBDT05GSUdfUEhZX01WRUJVX0Ez
OFhfQ09NUEhZIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9NVkVCVV9DUDExMF9VVE1JPXkKQ09ORklH
X1BIWV9QWEFfMjhOTV9IU0lDPXkKQ09ORklHX1BIWV9QWEFfMjhOTV9VU0IyPW0KQ09ORklHX1BI
WV9QWEFfVVNCPXkKQ09ORklHX1BIWV9NTVAzX1VTQj15CkNPTkZJR19QSFlfTU1QM19IU0lDPW0K
Q09ORklHX1BIWV9NVEtfVFBIWT15CkNPTkZJR19QSFlfTVRLX1VGUz15CkNPTkZJR19QSFlfTVRL
X1hTUEhZPW0KIyBDT05GSUdfUEhZX01US19IRE1JIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9NVEtf
TUlQSV9EU0k9bQojIENPTkZJR19QSFlfU1BBUlg1X1NFUkRFUyBpcyBub3Qgc2V0CiMgQ09ORklH
X1BIWV9MQU45NjZYX1NFUkRFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9DUENBUF9VU0IgaXMg
bm90IHNldApDT05GSUdfUEhZX01BUFBIT05FX01ETTY2MDA9bQpDT05GSUdfUEhZX09DRUxPVF9T
RVJERVM9bQpDT05GSUdfUEhZX0FUSDc5X1VTQj1tCkNPTkZJR19QSFlfUUNPTV9FRFA9eQojIENP
TkZJR19QSFlfUUNPTV9JUFE0MDE5X1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9RQ09NX1BD
SUUyIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1FDT01fUU1QIGlzIG5vdCBzZXQKQ09ORklHX1BI
WV9RQ09NX1FVU0IyPXkKQ09ORklHX1BIWV9RQ09NX1VTQl9IUz1tCkNPTkZJR19QSFlfUUNPTV9V
U0JfU05QU19GRU1UT19WMj15CiMgQ09ORklHX1BIWV9RQ09NX1VTQl9IU0lDIGlzIG5vdCBzZXQK
Q09ORklHX1BIWV9RQ09NX1VTQl9IU18yOE5NPW0KQ09ORklHX1BIWV9RQ09NX1VTQl9TUz15CkNP
TkZJR19QSFlfUUNPTV9JUFE4MDZYX1VTQj15CkNPTkZJR19QSFlfTVQ3NjIxX1BDST15CkNPTkZJ
R19QSFlfUkFMSU5LX1VTQj15CkNPTkZJR19QSFlfUkNBUl9HRU4zX1VTQjM9bQpDT05GSUdfUEhZ
X1JPQ0tDSElQX0RQSFlfUlgwPW0KQ09ORklHX1BIWV9ST0NLQ0hJUF9JTk5PX0hETUk9bQojIENP
TkZJR19QSFlfUk9DS0NISVBfSU5OT19VU0IyIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9ST0NLQ0hJ
UF9JTk5PX0NTSURQSFk9bQpDT05GSUdfUEhZX1JPQ0tDSElQX0lOTk9fRFNJRFBIWT15CiMgQ09O
RklHX1BIWV9ST0NLQ0hJUF9QQ0lFIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9ST0NLQ0hJUF9UWVBF
Qz1tCkNPTkZJR19QSFlfRVhZTk9TX0RQX1ZJREVPPW0KQ09ORklHX1BIWV9FWFlOT1NfTUlQSV9W
SURFTz15CiMgQ09ORklHX1BIWV9FWFlOT1NfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9T
QU1TVU5HX1VGUyBpcyBub3Qgc2V0CkNPTkZJR19QSFlfU0FNU1VOR19VU0IyPW0KQ09ORklHX1BI
WV9TNVBWMjEwX1VTQjI9eQpDT05GSUdfUEhZX0VYWU5PUzVfVVNCRFJEPW0KIyBDT05GSUdfUEhZ
X1VOSVBISUVSX1VTQjIgaXMgbm90IHNldApDT05GSUdfUEhZX1VOSVBISUVSX1VTQjM9bQojIENP
TkZJR19QSFlfVU5JUEhJRVJfUENJRSBpcyBub3Qgc2V0CkNPTkZJR19QSFlfVU5JUEhJRVJfQUhD
ST1tCkNPTkZJR19QSFlfU1RfU1BFQVIxMzEwX01JUEhZPXkKIyBDT05GSUdfUEhZX1NUX1NQRUFS
MTM0MF9NSVBIWSBpcyBub3Qgc2V0CkNPTkZJR19QSFlfU1RJSDQwN19VU0I9eQpDT05GSUdfUEhZ
X1NUTTMyX1VTQlBIWUM9eQojIENPTkZJR19QSFlfVEVHUkExOTRfUDJVIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEhZX0RBOFhYX1VTQiBpcyBub3Qgc2V0CkNPTkZJR19QSFlfRE04MTZYX1VTQj1tCkNP
TkZJR19QSFlfQU02NTRfU0VSREVTPW0KQ09ORklHX1BIWV9KNzIxRV9XSVo9bQpDT05GSUdfT01B
UF9DT05UUk9MX1BIWT1tCkNPTkZJR19USV9QSVBFMz1tCkNPTkZJR19QSFlfVFVTQjEyMTA9bQpD
T05GSUdfUEhZX0lOVEVMX0tFRU1CQVlfRU1NQz1tCkNPTkZJR19QSFlfSU5URUxfS0VFTUJBWV9V
U0I9eQojIENPTkZJR19QSFlfSU5URUxfTEdNX0NPTUJPIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9J
TlRFTF9MR01fRU1NQz1tCiMgQ09ORklHX1BIWV9JTlRFTF9USFVOREVSQkFZX0VNTUMgaXMgbm90
IHNldAojIENPTkZJR19QSFlfWElMSU5YX1pZTlFNUCBpcyBub3Qgc2V0CiMgZW5kIG9mIFBIWSBT
dWJzeXN0ZW0KCkNPTkZJR19QT1dFUkNBUD15CkNPTkZJR19EVFBNPXkKQ09ORklHX01DQj15CkNP
TkZJR19NQ0JfTFBDPXkKQ09ORklHX1JBUz15CgojCiMgQW5kcm9pZAojCiMgQ09ORklHX0FORFJP
SUQgaXMgbm90IHNldAojIGVuZCBvZiBBbmRyb2lkCgpDT05GSUdfREFYPW0KIyBDT05GSUdfTlZN
RU0gaXMgbm90IHNldAoKIwojIEhXIHRyYWNpbmcgc3VwcG9ydAojCiMgQ09ORklHX1NUTSBpcyBu
b3Qgc2V0CkNPTkZJR19JTlRFTF9USD15CkNPTkZJR19JTlRFTF9USF9HVEg9eQojIENPTkZJR19J
TlRFTF9USF9NU1UgaXMgbm90IHNldApDT05GSUdfSU5URUxfVEhfUFRJPXkKQ09ORklHX0lOVEVM
X1RIX0RFQlVHPXkKIyBlbmQgb2YgSFcgdHJhY2luZyBzdXBwb3J0CgpDT05GSUdfRlBHQT15CkNP
TkZJR19GUEdBX01HUl9TT0NGUEdBPXkKIyBDT05GSUdfRlBHQV9NR1JfU09DRlBHQV9BMTAgaXMg
bm90IHNldAojIENPTkZJR19BTFRFUkFfUFJfSVBfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZQ
R0FfTUdSX1pZTlFfRlBHQSBpcyBub3Qgc2V0CkNPTkZJR19GUEdBX0JSSURHRT1tCiMgQ09ORklH
X0FMVEVSQV9GUkVFWkVfQlJJREdFIGlzIG5vdCBzZXQKQ09ORklHX1hJTElOWF9QUl9ERUNPVVBM
RVI9bQpDT05GSUdfRlBHQV9SRUdJT049bQojIENPTkZJR19PRl9GUEdBX1JFR0lPTiBpcyBub3Qg
c2V0CkNPTkZJR19GUEdBX0RGTD1tCkNPTkZJR19GUEdBX0RGTF9BRlU9bQojIENPTkZJR19GUEdB
X0RGTF9OSU9TX0lOVEVMX1BBQ19OMzAwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZQR0FfTUdSX1pZ
TlFNUF9GUEdBIGlzIG5vdCBzZXQKQ09ORklHX0ZQR0FfTUdSX1ZFUlNBTF9GUEdBPW0KIyBDT05G
SUdfRlNJIGlzIG5vdCBzZXQKQ09ORklHX1RFRT15CgojCiMgVEVFIGRyaXZlcnMKIwojIGVuZCBv
ZiBURUUgZHJpdmVycwoKQ09ORklHX01VTFRJUExFWEVSPW0KCiMKIyBNdWx0aXBsZXhlciBkcml2
ZXJzCiMKIyBDT05GSUdfTVVYX0FERzc5MkEgaXMgbm90IHNldAojIENPTkZJR19NVVhfR1BJTyBp
cyBub3Qgc2V0CkNPTkZJR19NVVhfTU1JTz1tCiMgZW5kIG9mIE11bHRpcGxleGVyIGRyaXZlcnMK
CkNPTkZJR19QTV9PUFA9eQpDT05GSUdfU0lPWD15CkNPTkZJR19TSU9YX0JVU19HUElPPW0KIyBD
T05GSUdfU0xJTUJVUyBpcyBub3Qgc2V0CkNPTkZJR19JTlRFUkNPTk5FQ1Q9eQojIENPTkZJR19J
TlRFUkNPTk5FQ1RfSU1YIGlzIG5vdCBzZXQKQ09ORklHX0lOVEVSQ09OTkVDVF9RQ09NX09TTV9M
Mz1tCkNPTkZJR19JTlRFUkNPTk5FQ1RfU0FNU1VORz15CkNPTkZJR19JTlRFUkNPTk5FQ1RfRVhZ
Tk9TPXkKIyBDT05GSUdfQ09VTlRFUiBpcyBub3Qgc2V0CkNPTkZJR19NT1NUPW0KQ09ORklHX01P
U1RfVVNCX0hETT1tCkNPTkZJR19NT1NUX0NERVY9bQojIGVuZCBvZiBEZXZpY2UgRHJpdmVycwoK
IwojIEZpbGUgc3lzdGVtcwojCkNPTkZJR19WQUxJREFURV9GU19QQVJTRVI9eQojIENPTkZJR19G
U19EQVggaXMgbm90IHNldApDT05GSUdfRVhQT1JURlM9eQojIENPTkZJR19FWFBPUlRGU19CTE9D
S19PUFMgaXMgbm90IHNldApDT05GSUdfRklMRV9MT0NLSU5HPXkKQ09ORklHX0ZTX0VOQ1JZUFRJ
T049eQpDT05GSUdfRlNfVkVSSVRZPXkKQ09ORklHX0ZTX1ZFUklUWV9ERUJVRz15CiMgQ09ORklH
X0ZTX1ZFUklUWV9CVUlMVElOX1NJR05BVFVSRVMgaXMgbm90IHNldApDT05GSUdfRlNOT1RJRlk9
eQpDT05GSUdfRE5PVElGWT15CiMgQ09ORklHX0lOT1RJRllfVVNFUiBpcyBub3Qgc2V0CkNPTkZJ
R19GQU5PVElGWT15CkNPTkZJR19RVU9UQT15CkNPTkZJR19QUklOVF9RVU9UQV9XQVJOSU5HPXkK
IyBDT05GSUdfUVVPVEFfREVCVUcgaXMgbm90IHNldApDT05GSUdfUVVPVEFfVFJFRT15CkNPTkZJ
R19RRk1UX1YxPXkKQ09ORklHX1FGTVRfVjI9eQpDT05GSUdfUVVPVEFDVEw9eQpDT05GSUdfQVVU
T0ZTNF9GUz1tCkNPTkZJR19BVVRPRlNfRlM9eQojIENPTkZJR19GVVNFX0ZTIGlzIG5vdCBzZXQK
Q09ORklHX09WRVJMQVlfRlM9eQojIENPTkZJR19PVkVSTEFZX0ZTX1JFRElSRUNUX0RJUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX09WRVJMQVlfRlNfUkVESVJFQ1RfQUxXQVlTX0ZPTExPVyBpcyBub3Qg
c2V0CiMgQ09ORklHX09WRVJMQVlfRlNfSU5ERVggaXMgbm90IHNldAojIENPTkZJR19PVkVSTEFZ
X0ZTX01FVEFDT1BZIGlzIG5vdCBzZXQKCiMKIyBDYWNoZXMKIwojIENPTkZJR19GU0NBQ0hFIGlz
IG5vdCBzZXQKIyBlbmQgb2YgQ2FjaGVzCgojCiMgUHNldWRvIGZpbGVzeXN0ZW1zCiMKIyBDT05G
SUdfUFJPQ19GUyBpcyBub3Qgc2V0CkNPTkZJR19QUk9DX0NISUxEUkVOPXkKQ09ORklHX0tFUk5G
Uz15CkNPTkZJR19TWVNGUz15CkNPTkZJR19DT05GSUdGU19GUz15CiMgZW5kIG9mIFBzZXVkbyBm
aWxlc3lzdGVtcwoKIyBDT05GSUdfTUlTQ19GSUxFU1lTVEVNUyBpcyBub3Qgc2V0CkNPTkZJR19O
TFM9bQpDT05GSUdfTkxTX0RFRkFVTFQ9Imlzbzg4NTktMSIKQ09ORklHX05MU19DT0RFUEFHRV80
Mzc9bQpDT05GSUdfTkxTX0NPREVQQUdFXzczNz1tCiMgQ09ORklHX05MU19DT0RFUEFHRV83NzUg
aXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODUwIGlzIG5vdCBzZXQKQ09ORklHX05M
U19DT0RFUEFHRV84NTI9bQojIENPTkZJR19OTFNfQ09ERVBBR0VfODU1IGlzIG5vdCBzZXQKQ09O
RklHX05MU19DT0RFUEFHRV84NTc9bQpDT05GSUdfTkxTX0NPREVQQUdFXzg2MD1tCkNPTkZJR19O
TFNfQ09ERVBBR0VfODYxPW0KQ09ORklHX05MU19DT0RFUEFHRV84NjI9bQojIENPTkZJR19OTFNf
Q09ERVBBR0VfODYzIGlzIG5vdCBzZXQKQ09ORklHX05MU19DT0RFUEFHRV84NjQ9bQojIENPTkZJ
R19OTFNfQ09ERVBBR0VfODY1IGlzIG5vdCBzZXQKQ09ORklHX05MU19DT0RFUEFHRV84NjY9bQpD
T05GSUdfTkxTX0NPREVQQUdFXzg2OT1tCkNPTkZJR19OTFNfQ09ERVBBR0VfOTM2PW0KQ09ORklH
X05MU19DT0RFUEFHRV85NTA9bQpDT05GSUdfTkxTX0NPREVQQUdFXzkzMj1tCkNPTkZJR19OTFNf
Q09ERVBBR0VfOTQ5PW0KQ09ORklHX05MU19DT0RFUEFHRV84NzQ9bQpDT05GSUdfTkxTX0lTTzg4
NTlfOD1tCkNPTkZJR19OTFNfQ09ERVBBR0VfMTI1MD1tCkNPTkZJR19OTFNfQ09ERVBBR0VfMTI1
MT1tCkNPTkZJR19OTFNfQVNDSUk9bQojIENPTkZJR19OTFNfSVNPODg1OV8xIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkxTX0lTTzg4NTlfMiBpcyBub3Qgc2V0CkNPTkZJR19OTFNfSVNPODg1OV8zPW0K
Q09ORklHX05MU19JU084ODU5XzQ9bQpDT05GSUdfTkxTX0lTTzg4NTlfNT1tCiMgQ09ORklHX05M
U19JU084ODU5XzYgaXMgbm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV83IGlzIG5vdCBzZXQK
IyBDT05GSUdfTkxTX0lTTzg4NTlfOSBpcyBub3Qgc2V0CkNPTkZJR19OTFNfSVNPODg1OV8xMz1t
CkNPTkZJR19OTFNfSVNPODg1OV8xND1tCiMgQ09ORklHX05MU19JU084ODU5XzE1IGlzIG5vdCBz
ZXQKQ09ORklHX05MU19LT0k4X1I9bQpDT05GSUdfTkxTX0tPSThfVT1tCkNPTkZJR19OTFNfTUFD
X1JPTUFOPW0KQ09ORklHX05MU19NQUNfQ0VMVElDPW0KQ09ORklHX05MU19NQUNfQ0VOVEVVUk89
bQpDT05GSUdfTkxTX01BQ19DUk9BVElBTj1tCiMgQ09ORklHX05MU19NQUNfQ1lSSUxMSUMgaXMg
bm90IHNldAojIENPTkZJR19OTFNfTUFDX0dBRUxJQyBpcyBub3Qgc2V0CkNPTkZJR19OTFNfTUFD
X0dSRUVLPW0KQ09ORklHX05MU19NQUNfSUNFTEFORD1tCiMgQ09ORklHX05MU19NQUNfSU5VSVQg
aXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX1JPTUFOSUFOIGlzIG5vdCBzZXQKQ09ORklHX05M
U19NQUNfVFVSS0lTSD1tCkNPTkZJR19OTFNfVVRGOD1tCkNPTkZJR19VTklDT0RFPXkKQ09ORklH
X1VOSUNPREVfVVRGOF9EQVRBPXkKIyBDT05GSUdfVU5JQ09ERV9OT1JNQUxJWkFUSU9OX1NFTEZU
RVNUIGlzIG5vdCBzZXQKIyBlbmQgb2YgRmlsZSBzeXN0ZW1zCgojCiMgU2VjdXJpdHkgb3B0aW9u
cwojCkNPTkZJR19LRVlTPXkKIyBDT05GSUdfS0VZU19SRVFVRVNUX0NBQ0hFIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEVSU0lTVEVOVF9LRVlSSU5HUyBpcyBub3Qgc2V0CkNPTkZJR19UUlVTVEVEX0tF
WVM9bQpDT05GSUdfRU5DUllQVEVEX0tFWVM9bQojIENPTkZJR19LRVlfREhfT1BFUkFUSU9OUyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX0RNRVNHX1JFU1RSSUNUIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VDVVJJVFlGUyBpcyBub3Qgc2V0CkNPTkZJR19TVEFUSUNfVVNFUk1PREVIRUxQRVI9
eQpDT05GSUdfU1RBVElDX1VTRVJNT0RFSEVMUEVSX1BBVEg9Ii9zYmluL3VzZXJtb2RlLWhlbHBl
ciIKQ09ORklHX0RFRkFVTFRfU0VDVVJJVFlfREFDPXkKQ09ORklHX0xTTT0ibGFuZGxvY2ssbG9j
a2Rvd24seWFtYSxsb2FkcGluLHNhZmVzZXRpZCxpbnRlZ3JpdHksYnBmIgoKIwojIEtlcm5lbCBo
YXJkZW5pbmcgb3B0aW9ucwojCgojCiMgTWVtb3J5IGluaXRpYWxpemF0aW9uCiMKQ09ORklHX0ND
X0hBU19BVVRPX1ZBUl9JTklUX1BBVFRFUk49eQpDT05GSUdfQ0NfSEFTX0FVVE9fVkFSX0lOSVRf
WkVSTz15CiMgQ09ORklHX0lOSVRfU1RBQ0tfTk9ORSBpcyBub3Qgc2V0CkNPTkZJR19JTklUX1NU
QUNLX0FMTF9QQVRURVJOPXkKIyBDT05GSUdfSU5JVF9TVEFDS19BTExfWkVSTyBpcyBub3Qgc2V0
CkNPTkZJR19JTklUX09OX0FMTE9DX0RFRkFVTFRfT049eQojIENPTkZJR19JTklUX09OX0ZSRUVf
REVGQVVMVF9PTiBpcyBub3Qgc2V0CkNPTkZJR19DQ19IQVNfWkVST19DQUxMX1VTRURfUkVHUz15
CiMgQ09ORklHX1pFUk9fQ0FMTF9VU0VEX1JFR1MgaXMgbm90IHNldAojIGVuZCBvZiBNZW1vcnkg
aW5pdGlhbGl6YXRpb24KIyBlbmQgb2YgS2VybmVsIGhhcmRlbmluZyBvcHRpb25zCiMgZW5kIG9m
IFNlY3VyaXR5IG9wdGlvbnMKCkNPTkZJR19YT1JfQkxPQ0tTPW0KQ09ORklHX0NSWVBUTz15Cgoj
CiMgQ3J5cHRvIGNvcmUgb3IgaGVscGVyCiMKQ09ORklHX0NSWVBUT19BTEdBUEk9eQpDT05GSUdf
Q1JZUFRPX0FMR0FQSTI9eQpDT05GSUdfQ1JZUFRPX0FFQUQ9eQpDT05GSUdfQ1JZUFRPX0FFQUQy
PXkKQ09ORklHX0NSWVBUT19TS0NJUEhFUj15CkNPTkZJR19DUllQVE9fU0tDSVBIRVIyPXkKQ09O
RklHX0NSWVBUT19IQVNIPXkKQ09ORklHX0NSWVBUT19IQVNIMj15CkNPTkZJR19DUllQVE9fUk5H
PXkKQ09ORklHX0NSWVBUT19STkcyPXkKQ09ORklHX0NSWVBUT19STkdfREVGQVVMVD15CkNPTkZJ
R19DUllQVE9fQUtDSVBIRVIyPXkKQ09ORklHX0NSWVBUT19BS0NJUEhFUj15CkNPTkZJR19DUllQ
VE9fS1BQMj15CkNPTkZJR19DUllQVE9fS1BQPXkKQ09ORklHX0NSWVBUT19BQ09NUDI9eQpDT05G
SUdfQ1JZUFRPX01BTkFHRVI9eQpDT05GSUdfQ1JZUFRPX01BTkFHRVIyPXkKQ09ORklHX0NSWVBU
T19NQU5BR0VSX0RJU0FCTEVfVEVTVFM9eQpDT05GSUdfQ1JZUFRPX0dGMTI4TVVMPXkKQ09ORklH
X0NSWVBUT19OVUxMPXkKQ09ORklHX0NSWVBUT19OVUxMMj15CkNPTkZJR19DUllQVE9fQ1JZUFRE
PW0KQ09ORklHX0NSWVBUT19BVVRIRU5DPXkKQ09ORklHX0NSWVBUT19URVNUPXkKCiMKIyBQdWJs
aWMta2V5IGNyeXB0b2dyYXBoeQojCkNPTkZJR19DUllQVE9fUlNBPXkKQ09ORklHX0NSWVBUT19E
SD15CkNPTkZJR19DUllQVE9fRUNDPXkKQ09ORklHX0NSWVBUT19FQ0RIPW0KQ09ORklHX0NSWVBU
T19FQ0RTQT15CkNPTkZJR19DUllQVE9fRUNSRFNBPXkKQ09ORklHX0NSWVBUT19TTTI9eQpDT05G
SUdfQ1JZUFRPX0NVUlZFMjU1MTk9eQoKIwojIEF1dGhlbnRpY2F0ZWQgRW5jcnlwdGlvbiB3aXRo
IEFzc29jaWF0ZWQgRGF0YQojCkNPTkZJR19DUllQVE9fQ0NNPXkKIyBDT05GSUdfQ1JZUFRPX0dD
TSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DSEFDSEEyMFBPTFkxMzA1IGlzIG5vdCBzZXQK
IyBDT05GSUdfQ1JZUFRPX0FFR0lTMTI4IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NFUUlW
IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19FQ0hBSU5JVj15CgojCiMgQmxvY2sgbW9kZXMKIwpD
T05GSUdfQ1JZUFRPX0NCQz15CkNPTkZJR19DUllQVE9fQ0ZCPW0KQ09ORklHX0NSWVBUT19DVFI9
eQpDT05GSUdfQ1JZUFRPX0NUUz1tCkNPTkZJR19DUllQVE9fRUNCPXkKQ09ORklHX0NSWVBUT19M
Ulc9eQpDT05GSUdfQ1JZUFRPX09GQj15CiMgQ09ORklHX0NSWVBUT19QQ0JDIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ1JZUFRPX1hUUyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fS0VZV1JBUD15CkNP
TkZJR19DUllQVE9fTkhQT0xZMTMwNT1tCkNPTkZJR19DUllQVE9fQURJQU5UVU09bQpDT05GSUdf
Q1JZUFRPX0VTU0lWPXkKCiMKIyBIYXNoIG1vZGVzCiMKQ09ORklHX0NSWVBUT19DTUFDPXkKQ09O
RklHX0NSWVBUT19ITUFDPXkKIyBDT05GSUdfQ1JZUFRPX1hDQkMgaXMgbm90IHNldAojIENPTkZJ
R19DUllQVE9fVk1BQyBpcyBub3Qgc2V0CgojCiMgRGlnZXN0CiMKQ09ORklHX0NSWVBUT19DUkMz
MkM9eQpDT05GSUdfQ1JZUFRPX0NSQzMyPW0KQ09ORklHX0NSWVBUT19YWEhBU0g9bQpDT05GSUdf
Q1JZUFRPX0JMQUtFMkI9bQojIENPTkZJR19DUllQVE9fQkxBS0UyUyBpcyBub3Qgc2V0CkNPTkZJ
R19DUllQVE9fQ1JDVDEwRElGPXkKIyBDT05GSUdfQ1JZUFRPX0dIQVNIIGlzIG5vdCBzZXQKQ09O
RklHX0NSWVBUT19QT0xZMTMwNT15CiMgQ09ORklHX0NSWVBUT19NRDQgaXMgbm90IHNldAojIENP
TkZJR19DUllQVE9fTUQ1IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19NSUNIQUVMX01JQz15CkNP
TkZJR19DUllQVE9fUk1EMTYwPW0KQ09ORklHX0NSWVBUT19TSEExPXkKQ09ORklHX0NSWVBUT19T
SEEyNTY9eQpDT05GSUdfQ1JZUFRPX1NIQTUxMj15CiMgQ09ORklHX0NSWVBUT19TSEEzIGlzIG5v
dCBzZXQKQ09ORklHX0NSWVBUT19TTTM9eQpDT05GSUdfQ1JZUFRPX1NUUkVFQk9HPXkKQ09ORklH
X0NSWVBUT19XUDUxMj15CgojCiMgQ2lwaGVycwojCkNPTkZJR19DUllQVE9fQUVTPXkKQ09ORklH
X0NSWVBUT19BRVNfVEk9bQpDT05GSUdfQ1JZUFRPX0JMT1dGSVNIPW0KQ09ORklHX0NSWVBUT19C
TE9XRklTSF9DT01NT049bQojIENPTkZJR19DUllQVE9fQ0FNRUxMSUEgaXMgbm90IHNldApDT05G
SUdfQ1JZUFRPX0NBU1RfQ09NTU9OPW0KQ09ORklHX0NSWVBUT19DQVNUNT1tCiMgQ09ORklHX0NS
WVBUT19DQVNUNiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fREVTPXkKQ09ORklHX0NSWVBUT19G
Q1JZUFQ9bQpDT05GSUdfQ1JZUFRPX0NIQUNIQTIwPW0KQ09ORklHX0NSWVBUT19TRVJQRU5UPW0K
Q09ORklHX0NSWVBUT19TTTQ9eQpDT05GSUdfQ1JZUFRPX1RXT0ZJU0g9eQpDT05GSUdfQ1JZUFRP
X1RXT0ZJU0hfQ09NTU9OPXkKCiMKIyBDb21wcmVzc2lvbgojCkNPTkZJR19DUllQVE9fREVGTEFU
RT15CiMgQ09ORklHX0NSWVBUT19MWk8gaXMgbm90IHNldApDT05GSUdfQ1JZUFRPXzg0Mj15CkNP
TkZJR19DUllQVE9fTFo0PXkKQ09ORklHX0NSWVBUT19MWjRIQz1tCkNPTkZJR19DUllQVE9fWlNU
RD1tCgojCiMgUmFuZG9tIE51bWJlciBHZW5lcmF0aW9uCiMKIyBDT05GSUdfQ1JZUFRPX0FOU0lf
Q1BSTkcgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RSQkdfTUVOVT15CkNPTkZJR19DUllQVE9f
RFJCR19ITUFDPXkKIyBDT05GSUdfQ1JZUFRPX0RSQkdfSEFTSCBpcyBub3Qgc2V0CkNPTkZJR19D
UllQVE9fRFJCR19DVFI9eQpDT05GSUdfQ1JZUFRPX0RSQkc9eQpDT05GSUdfQ1JZUFRPX0pJVFRF
UkVOVFJPUFk9eQpDT05GSUdfQ1JZUFRPX0hBU0hfSU5GTz15CiMgQ09ORklHX0NSWVBUT19IVyBp
cyBub3Qgc2V0CkNPTkZJR19BU1lNTUVUUklDX0tFWV9UWVBFPXkKQ09ORklHX0FTWU1NRVRSSUNf
UFVCTElDX0tFWV9TVUJUWVBFPXkKIyBDT05GSUdfQVNZTU1FVFJJQ19UUE1fS0VZX1NVQlRZUEUg
aXMgbm90IHNldApDT05GSUdfWDUwOV9DRVJUSUZJQ0FURV9QQVJTRVI9eQpDT05GSUdfUEtDUzhf
UFJJVkFURV9LRVlfUEFSU0VSPXkKQ09ORklHX1BLQ1M3X01FU1NBR0VfUEFSU0VSPXkKQ09ORklH
X1BLQ1M3X1RFU1RfS0VZPXkKIyBDT05GSUdfU0lHTkVEX1BFX0ZJTEVfVkVSSUZJQ0FUSU9OIGlz
IG5vdCBzZXQKCiMKIyBDZXJ0aWZpY2F0ZXMgZm9yIHNpZ25hdHVyZSBjaGVja2luZwojCkNPTkZJ
R19NT0RVTEVfU0lHX0tFWT0iY2VydHMvc2lnbmluZ19rZXkucGVtIgojIENPTkZJR19NT0RVTEVf
U0lHX0tFWV9UWVBFX1JTQSBpcyBub3Qgc2V0CkNPTkZJR19NT0RVTEVfU0lHX0tFWV9UWVBFX0VD
RFNBPXkKQ09ORklHX1NZU1RFTV9UUlVTVEVEX0tFWVJJTkc9eQpDT05GSUdfU1lTVEVNX1RSVVNU
RURfS0VZUz0iIgpDT05GSUdfU1lTVEVNX0VYVFJBX0NFUlRJRklDQVRFPXkKQ09ORklHX1NZU1RF
TV9FWFRSQV9DRVJUSUZJQ0FURV9TSVpFPTQwOTYKQ09ORklHX1NFQ09OREFSWV9UUlVTVEVEX0tF
WVJJTkc9eQojIENPTkZJR19TWVNURU1fQkxBQ0tMSVNUX0tFWVJJTkcgaXMgbm90IHNldAojIGVu
ZCBvZiBDZXJ0aWZpY2F0ZXMgZm9yIHNpZ25hdHVyZSBjaGVja2luZwoKQ09ORklHX0JJTkFSWV9Q
UklOVEY9eQoKIwojIExpYnJhcnkgcm91dGluZXMKIwpDT05GSUdfTElORUFSX1JBTkdFUz15CkNP
TkZJR19QQUNLSU5HPXkKQ09ORklHX0JJVFJFVkVSU0U9eQpDT05GSUdfR0VORVJJQ19TVFJOQ1BZ
X0ZST01fVVNFUj15CkNPTkZJR19HRU5FUklDX1NUUk5MRU5fVVNFUj15CkNPTkZJR19HRU5FUklD
X05FVF9VVElMUz15CkNPTkZJR19DT1JESUM9eQpDT05GSUdfUFJJTUVfTlVNQkVSUz1tCkNPTkZJ
R19SQVRJT05BTD15CkNPTkZJR19HRU5FUklDX1BDSV9JT01BUD15CkNPTkZJR19TVE1QX0RFVklD
RT15CgojCiMgQ3J5cHRvIGxpYnJhcnkgcm91dGluZXMKIwpDT05GSUdfQ1JZUFRPX0xJQl9BRVM9
eQpDT05GSUdfQ1JZUFRPX0xJQl9CTEFLRTJTX0dFTkVSSUM9eQpDT05GSUdfQ1JZUFRPX0xJQl9D
SEFDSEFfR0VORVJJQz1tCkNPTkZJR19DUllQVE9fTElCX0NIQUNIQT1tCkNPTkZJR19DUllQVE9f
TElCX0NVUlZFMjU1MTlfR0VORVJJQz15CkNPTkZJR19DUllQVE9fTElCX0NVUlZFMjU1MTk9bQpD
T05GSUdfQ1JZUFRPX0xJQl9ERVM9eQpDT05GSUdfQ1JZUFRPX0xJQl9QT0xZMTMwNV9SU0laRT0x
CkNPTkZJR19DUllQVE9fTElCX1BPTFkxMzA1X0dFTkVSSUM9eQpDT05GSUdfQ1JZUFRPX0xJQl9Q
T0xZMTMwNT15CkNPTkZJR19DUllQVE9fTElCX0NIQUNIQTIwUE9MWTEzMDU9bQpDT05GSUdfQ1JZ
UFRPX0xJQl9TSEEyNTY9eQpDT05GSUdfQ1JZUFRPX0xJQl9TTTQ9eQojIGVuZCBvZiBDcnlwdG8g
bGlicmFyeSByb3V0aW5lcwoKIyBDT05GSUdfQ1JDX0NDSVRUIGlzIG5vdCBzZXQKQ09ORklHX0NS
QzE2PXkKQ09ORklHX0NSQ19UMTBESUY9eQojIENPTkZJR19DUkNfSVRVX1QgaXMgbm90IHNldApD
T05GSUdfQ1JDMzI9eQpDT05GSUdfQ1JDMzJfU0VMRlRFU1Q9bQojIENPTkZJR19DUkMzMl9TTElD
RUJZOCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQzMyX1NMSUNFQlk0IGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1JDMzJfU0FSV0FURSBpcyBub3Qgc2V0CkNPTkZJR19DUkMzMl9CSVQ9eQpDT05GSUdfQ1JD
NjQ9bQpDT05GSUdfQ1JDND15CkNPTkZJR19DUkM3PXkKQ09ORklHX0xJQkNSQzMyQz15CkNPTkZJ
R19DUkM4PW0KQ09ORklHX1hYSEFTSD15CkNPTkZJR19SQU5ET00zMl9TRUxGVEVTVD15CkNPTkZJ
R184NDJfQ09NUFJFU1M9eQpDT05GSUdfODQyX0RFQ09NUFJFU1M9eQpDT05GSUdfWkxJQl9JTkZM
QVRFPXkKQ09ORklHX1pMSUJfREVGTEFURT15CkNPTkZJR19MWk9fREVDT01QUkVTUz15CkNPTkZJ
R19MWjRfQ09NUFJFU1M9eQpDT05GSUdfTFo0SENfQ09NUFJFU1M9bQpDT05GSUdfTFo0X0RFQ09N
UFJFU1M9eQpDT05GSUdfWlNURF9DT01QUkVTUz1tCkNPTkZJR19aU1REX0RFQ09NUFJFU1M9eQpD
T05GSUdfWFpfREVDPXkKQ09ORklHX1haX0RFQ19YODY9eQpDT05GSUdfWFpfREVDX1BPV0VSUEM9
eQpDT05GSUdfWFpfREVDX0lBNjQ9eQpDT05GSUdfWFpfREVDX0FSTT15CkNPTkZJR19YWl9ERUNf
QVJNVEhVTUI9eQpDT05GSUdfWFpfREVDX1NQQVJDPXkKIyBDT05GSUdfWFpfREVDX01JQ1JPTFpN
QSBpcyBub3Qgc2V0CkNPTkZJR19YWl9ERUNfQkNKPXkKIyBDT05GSUdfWFpfREVDX1RFU1QgaXMg
bm90IHNldApDT05GSUdfREVDT01QUkVTU19HWklQPXkKQ09ORklHX0RFQ09NUFJFU1NfQlpJUDI9
eQpDT05GSUdfREVDT01QUkVTU19MWk1BPXkKQ09ORklHX0RFQ09NUFJFU1NfWFo9eQpDT05GSUdf
REVDT01QUkVTU19MWk89eQpDT05GSUdfREVDT01QUkVTU19MWjQ9eQpDT05GSUdfREVDT01QUkVT
U19aU1REPXkKQ09ORklHX0dFTkVSSUNfQUxMT0NBVE9SPXkKQ09ORklHX1JFRURfU09MT01PTj15
CkNPTkZJR19SRUVEX1NPTE9NT05fRU5DMTY9eQpDT05GSUdfUkVFRF9TT0xPTU9OX0RFQzE2PXkK
Q09ORklHX0lOVEVSVkFMX1RSRUU9eQpDT05GSUdfQVNTT0NJQVRJVkVfQVJSQVk9eQpDT05GSUdf
SEFTX0lPTUVNPXkKQ09ORklHX0hBU19JT1BPUlRfTUFQPXkKQ09ORklHX0hBU19ETUE9eQpDT05G
SUdfTkVFRF9ETUFfTUFQX1NUQVRFPXkKQ09ORklHX0RNQV9ERUNMQVJFX0NPSEVSRU5UPXkKQ09O
RklHX0FSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9ERVZJQ0U9eQpDT05GSUdfQVJDSF9IQVNfU1lOQ19E
TUFfRk9SX0NQVT15CkNPTkZJR19BUkNIX0hBU19ETUFfUFJFUF9DT0hFUkVOVD15CkNPTkZJR19E
TUFfTk9OQ09IRVJFTlRfTU1BUD15CkNPTkZJR19ETUFfQ09IRVJFTlRfUE9PTD15CkNPTkZJR19E
TUFfUkVNQVA9eQpDT05GSUdfRE1BX0RJUkVDVF9SRU1BUD15CkNPTkZJR19ETUFfQ01BPXkKQ09O
RklHX0RNQV9QRVJOVU1BX0NNQT15CgojCiMgRGVmYXVsdCBjb250aWd1b3VzIG1lbW9yeSBhcmVh
IHNpemU6CiMKQ09ORklHX0NNQV9TSVpFX01CWVRFUz0xNgpDT05GSUdfQ01BX1NJWkVfU0VMX01C
WVRFUz15CiMgQ09ORklHX0NNQV9TSVpFX1NFTF9QRVJDRU5UQUdFIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ01BX1NJWkVfU0VMX01JTiBpcyBub3Qgc2V0CiMgQ09ORklHX0NNQV9TSVpFX1NFTF9NQVgg
aXMgbm90IHNldApDT05GSUdfQ01BX0FMSUdOTUVOVD04CiMgQ09ORklHX0RNQV9BUElfREVCVUcg
aXMgbm90IHNldAojIENPTkZJR19ETUFfTUFQX0JFTkNITUFSSyBpcyBub3Qgc2V0CkNPTkZJR19T
R0xfQUxMT0M9eQpDT05GSUdfR0xPQj15CiMgQ09ORklHX0dMT0JfU0VMRlRFU1QgaXMgbm90IHNl
dApDT05GSUdfR0VORVJJQ19BVE9NSUM2ND15CkNPTkZJR19DTFpfVEFCPXkKIyBDT05GSUdfSVJR
X1BPTEwgaXMgbm90IHNldApDT05GSUdfTVBJTElCPXkKQ09ORklHX0xJQkZEVD15CkNPTkZJR19P
SURfUkVHSVNUUlk9eQpDT05GSUdfU0dfU1BMSVQ9eQpDT05GSUdfU1RBQ0tERVBPVD15CkNPTkZJ
R19TVEFDS19IQVNIX09SREVSPTIwCkNPTkZJR19SRUZfVFJBQ0tFUj15CkNPTkZJR19QQVJNQU49
eQojIENPTkZJR19PQkpBR0cgaXMgbm90IHNldAojIGVuZCBvZiBMaWJyYXJ5IHJvdXRpbmVzCgpD
T05GSUdfQVNOMV9FTkNPREVSPW0KCiMKIyBLZXJuZWwgaGFja2luZwojCgojCiMgcHJpbnRrIGFu
ZCBkbWVzZyBvcHRpb25zCiMKIyBDT05GSUdfUFJJTlRLX1RJTUUgaXMgbm90IHNldApDT05GSUdf
UFJJTlRLX0NBTExFUj15CiMgQ09ORklHX1NUQUNLVFJBQ0VfQlVJTERfSUQgaXMgbm90IHNldApD
T05GSUdfQ09OU09MRV9MT0dMRVZFTF9ERUZBVUxUPTcKQ09ORklHX0NPTlNPTEVfTE9HTEVWRUxf
UVVJRVQ9NApDT05GSUdfTUVTU0FHRV9MT0dMRVZFTF9ERUZBVUxUPTQKIyBDT05GSUdfQk9PVF9Q
UklOVEtfREVMQVkgaXMgbm90IHNldAojIENPTkZJR19EWU5BTUlDX0RFQlVHIGlzIG5vdCBzZXQK
Q09ORklHX0RZTkFNSUNfREVCVUdfQ09SRT15CiMgQ09ORklHX1NZTUJPTElDX0VSUk5BTUUgaXMg
bm90IHNldAojIGVuZCBvZiBwcmludGsgYW5kIGRtZXNnIG9wdGlvbnMKCiMKIyBDb21waWxlLXRp
bWUgY2hlY2tzIGFuZCBjb21waWxlciBvcHRpb25zCiMKQ09ORklHX0ZSQU1FX1dBUk49MTAyNApD
T05GSUdfU1RSSVBfQVNNX1NZTVM9eQpDT05GSUdfUkVBREFCTEVfQVNNPXkKQ09ORklHX0hFQURF
UlNfSU5TVEFMTD15CkNPTkZJR19ERUJVR19TRUNUSU9OX01JU01BVENIPXkKQ09ORklHX1NFQ1RJ
T05fTUlTTUFUQ0hfV0FSTl9PTkxZPXkKIyBDT05GSUdfREVCVUdfRk9SQ0VfRlVOQ1RJT05fQUxJ
R05fNjRCIGlzIG5vdCBzZXQKIyBDT05GSUdfVk1MSU5VWF9NQVAgaXMgbm90IHNldApDT05GSUdf
REVCVUdfRk9SQ0VfV0VBS19QRVJfQ1BVPXkKIyBlbmQgb2YgQ29tcGlsZS10aW1lIGNoZWNrcyBh
bmQgY29tcGlsZXIgb3B0aW9ucwoKIwojIEdlbmVyaWMgS2VybmVsIERlYnVnZ2luZyBJbnN0cnVt
ZW50cwojCiMgQ09ORklHX01BR0lDX1NZU1JRIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0ZTPXkK
Q09ORklHX0RFQlVHX0ZTX0FMTE9XX0FMTD15CiMgQ09ORklHX0RFQlVHX0ZTX0RJU0FMTE9XX01P
VU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfRlNfQUxMT1dfTk9ORSBpcyBub3Qgc2V0CkNP
TkZJR19IQVZFX0FSQ0hfS0dEQj15CiMgQ09ORklHX0tHREIgaXMgbm90IHNldAojIENPTkZJR19V
QlNBTiBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0tDU0FOX0NPTVBJTEVSPXkKIyBlbmQgb2YgR2Vu
ZXJpYyBLZXJuZWwgRGVidWdnaW5nIEluc3RydW1lbnRzCgpDT05GSUdfREVCVUdfS0VSTkVMPXkK
IyBDT05GSUdfREVCVUdfTUlTQyBpcyBub3Qgc2V0CgojCiMgTmV0d29ya2luZyBEZWJ1Z2dpbmcK
IwpDT05GSUdfTkVUX0RFVl9SRUZDTlRfVFJBQ0tFUj15CkNPTkZJR19ORVRfTlNfUkVGQ05UX1RS
QUNLRVI9eQojIGVuZCBvZiBOZXR3b3JraW5nIERlYnVnZ2luZwoKIwojIE1lbW9yeSBEZWJ1Z2dp
bmcKIwpDT05GSUdfUEFHRV9FWFRFTlNJT049eQpDT05GSUdfREVCVUdfUEFHRUFMTE9DPXkKQ09O
RklHX0RFQlVHX1BBR0VBTExPQ19FTkFCTEVfREVGQVVMVD15CiMgQ09ORklHX1BBR0VfT1dORVIg
aXMgbm90IHNldApDT05GSUdfUEFHRV9QT0lTT05JTkc9eQpDT05GSUdfREVCVUdfUEFHRV9SRUY9
eQojIENPTkZJR19ERUJVR19PQkpFQ1RTIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfREVCVUdfS01F
TUxFQUs9eQojIENPTkZJR19ERUJVR19LTUVNTEVBSyBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19T
VEFDS19VU0FHRT15CiMgQ09ORklHX1NDSEVEX1NUQUNLX0VORF9DSEVDSyBpcyBub3Qgc2V0CkNP
TkZJR19ERUJVR19WTT15CkNPTkZJR19ERUJVR19WTV9WTUFDQUNIRT15CiMgQ09ORklHX0RFQlVH
X1ZNX1JCIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX1ZNX1BHRkxBR1M9eQpDT05GSUdfREVCVUdf
TUVNT1JZX0lOSVQ9eQpDT05GSUdfQ0NfSEFTX1dPUktJTkdfTk9TQU5JVElaRV9BRERSRVNTPXkK
IyBlbmQgb2YgTWVtb3J5IERlYnVnZ2luZwoKQ09ORklHX0RFQlVHX1NISVJRPXkKCiMKIyBEZWJ1
ZyBPb3BzLCBMb2NrdXBzIGFuZCBIYW5ncwojCiMgQ09ORklHX1BBTklDX09OX09PUFMgaXMgbm90
IHNldApDT05GSUdfUEFOSUNfT05fT09QU19WQUxVRT0wCkNPTkZJR19QQU5JQ19USU1FT1VUPTAK
IyBDT05GSUdfU09GVExPQ0tVUF9ERVRFQ1RPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0RFVEVDVF9I
VU5HX1RBU0sgaXMgbm90IHNldApDT05GSUdfV1FfV0FUQ0hET0c9eQojIENPTkZJR19URVNUX0xP
Q0tVUCBpcyBub3Qgc2V0CiMgZW5kIG9mIERlYnVnIE9vcHMsIExvY2t1cHMgYW5kIEhhbmdzCgoj
CiMgU2NoZWR1bGVyIERlYnVnZ2luZwojCiMgZW5kIG9mIFNjaGVkdWxlciBEZWJ1Z2dpbmcKCiMg
Q09ORklHX0RFQlVHX1RJTUVLRUVQSU5HIGlzIG5vdCBzZXQKCiMKIyBMb2NrIERlYnVnZ2luZyAo
c3BpbmxvY2tzLCBtdXRleGVzLCBldGMuLi4pCiMKQ09ORklHX0xPQ0tfREVCVUdHSU5HX1NVUFBP
UlQ9eQpDT05GSUdfUFJPVkVfTE9DS0lORz15CiMgQ09ORklHX1BST1ZFX1JBV19MT0NLX05FU1RJ
TkcgaXMgbm90IHNldApDT05GSUdfTE9DS19TVEFUPXkKQ09ORklHX0RFQlVHX1JUX01VVEVYRVM9
eQpDT05GSUdfREVCVUdfU1BJTkxPQ0s9eQpDT05GSUdfREVCVUdfTVVURVhFUz15CkNPTkZJR19E
RUJVR19XV19NVVRFWF9TTE9XUEFUSD15CkNPTkZJR19ERUJVR19SV1NFTVM9eQpDT05GSUdfREVC
VUdfTE9DS19BTExPQz15CkNPTkZJR19MT0NLREVQPXkKQ09ORklHX0xPQ0tERVBfQklUUz0xNQpD
T05GSUdfTE9DS0RFUF9DSEFJTlNfQklUUz0xNgpDT05GSUdfTE9DS0RFUF9TVEFDS19UUkFDRV9C
SVRTPTE5CkNPTkZJR19MT0NLREVQX1NUQUNLX1RSQUNFX0hBU0hfQklUUz0xNApDT05GSUdfTE9D
S0RFUF9DSVJDVUxBUl9RVUVVRV9CSVRTPTEyCkNPTkZJR19ERUJVR19MT0NLREVQPXkKIyBDT05G
SUdfREVCVUdfQVRPTUlDX1NMRUVQIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0xPQ0tJTkdfQVBJ
X1NFTEZURVNUUz15CiMgQ09ORklHX0xPQ0tfVE9SVFVSRV9URVNUIGlzIG5vdCBzZXQKIyBDT05G
SUdfV1dfTVVURVhfU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdfU0NGX1RPUlRVUkVfVEVTVD1t
CiMgZW5kIG9mIExvY2sgRGVidWdnaW5nIChzcGlubG9ja3MsIG11dGV4ZXMsIGV0Yy4uLikKCkNP
TkZJR19UUkFDRV9JUlFGTEFHUz15CkNPTkZJR19ERUJVR19JUlFGTEFHUz15CkNPTkZJR19TVEFD
S1RSQUNFPXkKIyBDT05GSUdfV0FSTl9BTExfVU5TRUVERURfUkFORE9NIGlzIG5vdCBzZXQKQ09O
RklHX0RFQlVHX0tPQkpFQ1Q9eQoKIwojIERlYnVnIGtlcm5lbCBkYXRhIHN0cnVjdHVyZXMKIwpD
T05GSUdfREVCVUdfTElTVD15CiMgQ09ORklHX0RFQlVHX1BMSVNUIGlzIG5vdCBzZXQKQ09ORklH
X0RFQlVHX1NHPXkKQ09ORklHX0RFQlVHX05PVElGSUVSUz15CkNPTkZJR19CVUdfT05fREFUQV9D
T1JSVVBUSU9OPXkKIyBlbmQgb2YgRGVidWcga2VybmVsIGRhdGEgc3RydWN0dXJlcwoKIyBDT05G
SUdfREVCVUdfQ1JFREVOVElBTFMgaXMgbm90IHNldAoKIwojIFJDVSBEZWJ1Z2dpbmcKIwpDT05G
SUdfUFJPVkVfUkNVPXkKQ09ORklHX1RPUlRVUkVfVEVTVD15CiMgQ09ORklHX1JDVV9TQ0FMRV9U
RVNUIGlzIG5vdCBzZXQKQ09ORklHX1JDVV9UT1JUVVJFX1RFU1Q9eQpDT05GSUdfUkNVX1JFRl9T
Q0FMRV9URVNUPXkKQ09ORklHX1JDVV9UUkFDRT15CkNPTkZJR19SQ1VfRVFTX0RFQlVHPXkKIyBl
bmQgb2YgUkNVIERlYnVnZ2luZwoKIyBDT05GSUdfREVCVUdfV1FfRk9SQ0VfUlJfQ1BVIGlzIG5v
dCBzZXQKQ09ORklHX05PUF9UUkFDRVI9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9UUkFDRVI9eQpD
T05GSUdfSEFWRV9GVU5DVElPTl9HUkFQSF9UUkFDRVI9eQpDT05GSUdfSEFWRV9EWU5BTUlDX0ZU
UkFDRT15CkNPTkZJR19IQVZFX0ZUUkFDRV9NQ09VTlRfUkVDT1JEPXkKQ09ORklHX0JVSUxEVElN
RV9NQ09VTlRfU09SVD15CkNPTkZJR19UUkFDRVJfTUFYX1RSQUNFPXkKQ09ORklHX1RSQUNFX0NM
T0NLPXkKQ09ORklHX1JJTkdfQlVGRkVSPXkKQ09ORklHX0VWRU5UX1RSQUNJTkc9eQpDT05GSUdf
Q09OVEVYVF9TV0lUQ0hfVFJBQ0VSPXkKQ09ORklHX1JJTkdfQlVGRkVSX0FMTE9XX1NXQVA9eQpD
T05GSUdfUFJFRU1QVElSUV9UUkFDRVBPSU5UUz15CkNPTkZJR19UUkFDSU5HPXkKQ09ORklHX0dF
TkVSSUNfVFJBQ0VSPXkKQ09ORklHX1RSQUNJTkdfU1VQUE9SVD15CkNPTkZJR19GVFJBQ0U9eQpD
T05GSUdfQk9PVFRJTUVfVFJBQ0lORz15CkNPTkZJR19GVU5DVElPTl9UUkFDRVI9eQpDT05GSUdf
RlVOQ1RJT05fR1JBUEhfVFJBQ0VSPXkKIyBDT05GSUdfRFlOQU1JQ19GVFJBQ0UgaXMgbm90IHNl
dAojIENPTkZJR19GVU5DVElPTl9QUk9GSUxFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQUNLX1RS
QUNFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lSUVNPRkZfVFJBQ0VSIGlzIG5vdCBzZXQKQ09ORklH
X1NDSEVEX1RSQUNFUj15CkNPTkZJR19IV0xBVF9UUkFDRVI9eQpDT05GSUdfT1NOT0lTRV9UUkFD
RVI9eQpDT05GSUdfVElNRVJMQVRfVFJBQ0VSPXkKQ09ORklHX1RSQUNFUl9TTkFQU0hPVD15CkNP
TkZJR19UUkFDRVJfU05BUFNIT1RfUEVSX0NQVV9TV0FQPXkKQ09ORklHX1RSQUNFX0JSQU5DSF9Q
Uk9GSUxJTkc9eQojIENPTkZJR19CUkFOQ0hfUFJPRklMRV9OT05FIGlzIG5vdCBzZXQKIyBDT05G
SUdfUFJPRklMRV9BTk5PVEFURURfQlJBTkNIRVMgaXMgbm90IHNldApDT05GSUdfUFJPRklMRV9B
TExfQlJBTkNIRVM9eQpDT05GSUdfVFJBQ0lOR19CUkFOQ0hFUz15CkNPTkZJR19CUkFOQ0hfVFJB
Q0VSPXkKQ09ORklHX0RZTkFNSUNfRVZFTlRTPXkKQ09ORklHX1NZTlRIX0VWRU5UUz15CkNPTkZJ
R19UUkFDRV9FVkVOVF9JTkpFQ1Q9eQpDT05GSUdfVFJBQ0VQT0lOVF9CRU5DSE1BUks9eQojIENP
TkZJR19SSU5HX0JVRkZFUl9CRU5DSE1BUksgaXMgbm90IHNldApDT05GSUdfVFJBQ0VfRVZBTF9N
QVBfRklMRT15CiMgQ09ORklHX0ZUUkFDRV9SRUNPUkRfUkVDVVJTSU9OIGlzIG5vdCBzZXQKIyBD
T05GSUdfR0NPVl9QUk9GSUxFX0ZUUkFDRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZUUkFDRV9TVEFS
VFVQX1RFU1QgaXMgbm90IHNldApDT05GSUdfUklOR19CVUZGRVJfU1RBUlRVUF9URVNUPXkKQ09O
RklHX1JJTkdfQlVGRkVSX1ZBTElEQVRFX1RJTUVfREVMVEFTPXkKQ09ORklHX1BSRUVNUFRJUlFf
REVMQVlfVEVTVD1tCkNPTkZJR19TWU5USF9FVkVOVF9HRU5fVEVTVD15CiMgQ09ORklHX1NBTVBM
RVMgaXMgbm90IHNldAoKIwojIG1pY3JvYmxhemUgRGVidWdnaW5nCiMKCiMKIyBLZXJuZWwgVGVz
dGluZyBhbmQgQ292ZXJhZ2UKIwpDT05GSUdfS1VOSVQ9bQojIENPTkZJR19LVU5JVF9ERUJVR0ZT
IGlzIG5vdCBzZXQKIyBDT05GSUdfS1VOSVRfVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19LVU5JVF9F
WEFNUExFX1RFU1Q9bQpDT05GSUdfS1VOSVRfQUxMX1RFU1RTPW0KQ09ORklHX05PVElGSUVSX0VS
Uk9SX0lOSkVDVElPTj15CiMgQ09ORklHX0ZBVUxUX0lOSkVDVElPTiBpcyBub3Qgc2V0CkNPTkZJ
R19DQ19IQVNfU0FOQ09WX1RSQUNFX1BDPXkKQ09ORklHX1JVTlRJTUVfVEVTVElOR19NRU5VPXkK
Q09ORklHX0xLRFRNPW0KQ09ORklHX1RFU1RfTElTVF9TT1JUPW0KQ09ORklHX1RFU1RfTUlOX0hF
QVA9eQpDT05GSUdfVEVTVF9TT1JUPW0KQ09ORklHX1RFU1RfRElWNjQ9bQpDT05GSUdfQkFDS1RS
QUNFX1NFTEZfVEVTVD1tCkNPTkZJR19URVNUX1JFRl9UUkFDS0VSPW0KQ09ORklHX1JCVFJFRV9U
RVNUPXkKQ09ORklHX1JFRURfU09MT01PTl9URVNUPXkKQ09ORklHX0lOVEVSVkFMX1RSRUVfVEVT
VD1tCiMgQ09ORklHX1BFUkNQVV9URVNUIGlzIG5vdCBzZXQKQ09ORklHX0FUT01JQzY0X1NFTEZU
RVNUPW0KQ09ORklHX1RFU1RfSEVYRFVNUD15CkNPTkZJR19TVFJJTkdfU0VMRlRFU1Q9eQpDT05G
SUdfVEVTVF9TVFJJTkdfSEVMUEVSUz1tCkNPTkZJR19URVNUX1NUUlNDUFk9eQpDT05GSUdfVEVT
VF9LU1RSVE9YPW0KIyBDT05GSUdfVEVTVF9QUklOVEYgaXMgbm90IHNldApDT05GSUdfVEVTVF9T
Q0FORj1tCiMgQ09ORklHX1RFU1RfQklUTUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9VVUlE
IGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9YQVJSQVkgaXMgbm90IHNldAojIENPTkZJR19URVNU
X09WRVJGTE9XIGlzIG5vdCBzZXQKQ09ORklHX1RFU1RfUkhBU0hUQUJMRT15CiMgQ09ORklHX1RF
U1RfU0lQSEFTSCBpcyBub3Qgc2V0CkNPTkZJR19URVNUX0lEQT1tCkNPTkZJR19URVNUX1BBUk1B
Tj15CiMgQ09ORklHX1RFU1RfTEtNIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9CSVRPUFMgaXMg
bm90IHNldAojIENPTkZJR19URVNUX1ZNQUxMT0MgaXMgbm90IHNldApDT05GSUdfVEVTVF9VU0VS
X0NPUFk9bQpDT05GSUdfRklORF9CSVRfQkVOQ0hNQVJLPW0KQ09ORklHX1RFU1RfRklSTVdBUkU9
bQpDT05GSUdfQklURklFTERfS1VOSVQ9bQpDT05GSUdfSEFTSF9LVU5JVF9URVNUPW0KIyBDT05G
SUdfUkVTT1VSQ0VfS1VOSVRfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU0NUTF9LVU5JVF9U
RVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfTElTVF9LVU5JVF9URVNUIGlzIG5vdCBzZXQKQ09ORklH
X0xJTkVBUl9SQU5HRVNfVEVTVD1tCkNPTkZJR19DTURMSU5FX0tVTklUX1RFU1Q9bQojIENPTkZJ
R19CSVRTX1RFU1QgaXMgbm90IHNldApDT05GSUdfUkFUSU9OQUxfS1VOSVRfVEVTVD1tCkNPTkZJ
R19NRU1DUFlfS1VOSVRfVEVTVD1tCkNPTkZJR19URVNUX1VERUxBWT1tCiMgQ09ORklHX1RFU1Rf
U1RBVElDX0tFWVMgaXMgbm90IHNldApDT05GSUdfVEVTVF9NRU1DQVRfUD15CiMgQ09ORklHX1RF
U1RfU1RBQ0tJTklUIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9NRU1JTklUIGlzIG5vdCBzZXQK
Q09ORklHX1RFU1RfRlJFRV9QQUdFUz1tCiMgZW5kIG9mIEtlcm5lbCBUZXN0aW5nIGFuZCBDb3Zl
cmFnZQoKQ09ORklHX1dBUk5fTUlTU0lOR19ET0NVTUVOVFM9eQojIENPTkZJR19XQVJOX0FCSV9F
UlJPUlMgaXMgbm90IHNldAojIGVuZCBvZiBLZXJuZWwgaGFja2luZwo=

--===============4214508701865226439==--

