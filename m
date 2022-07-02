Content-Type: multipart/mixed; boundary="===============0099546433736650893=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:725 bdisp_g_fmt() warn: passing a valid pointer to 'PTR_ERR'
Date: Sat, 02 Jul 2022 23:41:35 +0800
Message-ID: <202207022316.M1ACysvG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0099546433736650893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

Hi Mauro,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   089866061428ec9bf67221247c936792078c41a4
commit: e7b8153e2a4f0c9c8d1450aa7328d54ea64fe8b2 media: platform: place stm=
32/ and sti/ under st/ dir
date:   4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
config: m68k-randconfig-m031-20220702 (https://download.01.org/0day-ci/arch=
ive/20220702/202207022316.M1ACysvG-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:725 bdisp_g_fmt() warn: pa=
ssing a valid pointer to 'PTR_ERR'
drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:852 bdisp_g_selection() wa=
rn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +725 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  716  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  717  static int bdisp_g_fmt(struct file *file, void *fh, stru=
ct v4l2_format *f)
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  718  {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  719  	struct bdisp_ctx *ctx =3D fh_to_ctx(fh);
bf3881707b6f63 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Colin Ian King=
  2017-10-29  720  	struct v4l2_pix_format *pix;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  721  	struct bdisp_frame *frame  =3D ctx_get_frame(ctx, f->ty=
pe);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  722  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  723  	if (IS_ERR(frame)) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  724  		dev_err(ctx->bdisp_dev->dev, "Invalid frame (%p)\n", f=
rame);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12 @725  		return PTR_ERR(frame);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  726  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  727  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  728  	pix =3D &f->fmt.pix;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  729  	pix->width =3D frame->width;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  730  	pix->height =3D frame->height;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  731  	pix->pixelformat =3D frame->fmt->pixelformat;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  732  	pix->field =3D frame->field;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  733  	pix->bytesperline =3D frame->bytesperline;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  734  	pix->sizeimage =3D frame->sizeimage;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  735  	pix->colorspace =3D (f->type =3D=3D V4L2_BUF_TYPE_VIDEO=
_OUTPUT) ?
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  736  				frame->colorspace : bdisp_dflt_fmt.colorspace;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  737  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  738  	return 0;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  739  }
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  740  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  741  static int bdisp_try_fmt(struct file *file, void *fh, st=
ruct v4l2_format *f)
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  742  {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  743  	struct bdisp_ctx *ctx =3D fh_to_ctx(fh);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  744  	struct v4l2_pix_format *pix =3D &f->fmt.pix;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  745  	const struct bdisp_fmt *format;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  746  	u32 in_w, in_h;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  747  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  748  	format =3D bdisp_find_fmt(pix->pixelformat);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  749  	if (!format) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  750  		dev_dbg(ctx->bdisp_dev->dev, "Unknown format 0x%x\n",
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  751  			pix->pixelformat);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  752  		return -EINVAL;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  753  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  754  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  755  	/* YUV420P only supported for VIDEO_OUTPUT */
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  756  	if ((format->pixelformat =3D=3D V4L2_PIX_FMT_YUV420) &&
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  757  	    (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  758  		dev_dbg(ctx->bdisp_dev->dev, "No YU12 on capture\n");
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  759  		return -EINVAL;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  760  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  761  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  762  	/* Field (interlaced only supported on OUTPUT) */
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  763  	if ((f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  764  	    (pix->field !=3D V4L2_FIELD_INTERLACED))
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  765  		pix->field =3D V4L2_FIELD_NONE;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  766  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  767  	/* Adjust width & height */
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  768  	in_w =3D pix->width;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  769  	in_h =3D pix->height;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  770  	v4l_bound_align_image(&pix->width,
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  771  			      BDISP_MIN_W, BDISP_MAX_W,
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  772  			      ffs(format->w_align) - 1,
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  773  			      &pix->height,
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  774  			      BDISP_MIN_H, BDISP_MAX_H,
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  775  			      ffs(format->h_align) - 1,
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  776  			      0);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  777  	if ((pix->width !=3D in_w) || (pix->height !=3D in_h))
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  778  		dev_dbg(ctx->bdisp_dev->dev,
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  779  			"%s size updated: %dx%d -> %dx%d\n", __func__,
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  780  			in_w, in_h, pix->width, pix->height);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  781  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  782  	pix->bytesperline =3D (pix->width * format->bpp_plane0)=
 / 8;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  783  	pix->sizeimage =3D (pix->width * pix->height * format->=
bpp) / 8;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  784  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  785  	if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  786  		pix->colorspace =3D bdisp_dflt_fmt.colorspace;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  787  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  788  	return 0;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  789  }
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  790  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  791  static int bdisp_s_fmt(struct file *file, void *fh, stru=
ct v4l2_format *f)
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  792  {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  793  	struct bdisp_ctx *ctx =3D fh_to_ctx(fh);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  794  	struct vb2_queue *vq;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  795  	struct bdisp_frame *frame;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  796  	struct v4l2_pix_format *pix;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  797  	int ret;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  798  	u32 state;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  799  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  800  	ret =3D bdisp_try_fmt(file, fh, f);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  801  	if (ret) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  802  		dev_err(ctx->bdisp_dev->dev, "Cannot set format\n");
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  803  		return ret;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  804  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  805  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  806  	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  807  	if (vb2_is_streaming(vq)) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  808  		dev_err(ctx->bdisp_dev->dev, "queue (%d) busy\n", f->t=
ype);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  809  		return -EBUSY;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  810  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  811  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  812  	frame =3D (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT) ?
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  813  			&ctx->src : &ctx->dst;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  814  	pix =3D &f->fmt.pix;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  815  	frame->fmt =3D bdisp_find_fmt(pix->pixelformat);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  816  	if (!frame->fmt) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  817  		dev_err(ctx->bdisp_dev->dev, "Unknown format 0x%x\n",
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  818  			pix->pixelformat);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  819  		return -EINVAL;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  820  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  821  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  822  	frame->width =3D pix->width;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  823  	frame->height =3D pix->height;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  824  	frame->bytesperline =3D pix->bytesperline;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  825  	frame->sizeimage =3D pix->sizeimage;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  826  	frame->field =3D pix->field;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  827  	if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  828  		frame->colorspace =3D pix->colorspace;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  829  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  830  	frame->crop.width =3D frame->width;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  831  	frame->crop.height =3D frame->height;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  832  	frame->crop.left =3D 0;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  833  	frame->crop.top =3D 0;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  834  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  835  	state =3D BDISP_PARAMS;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  836  	state |=3D (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)=
 ?
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  837  			BDISP_DST_FMT : BDISP_SRC_FMT;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  838  	bdisp_ctx_state_lock_set(state, ctx);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  839  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  840  	return 0;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  841  }
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  842  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  843  static int bdisp_g_selection(struct file *file, void *fh,
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  844  			     struct v4l2_selection *s)
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  845  {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  846  	struct bdisp_frame *frame;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  847  	struct bdisp_ctx *ctx =3D fh_to_ctx(fh);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  848  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  849  	frame =3D ctx_get_frame(ctx, s->type);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  850  	if (IS_ERR(frame)) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  851  		dev_err(ctx->bdisp_dev->dev, "Invalid frame (%p)\n", f=
rame);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12 @852  		return PTR_ERR(frame);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  853  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  854  =

3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  855  	switch (s->type) {
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  856  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  857  		switch (s->target) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  858  		case V4L2_SEL_TGT_CROP:
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  859  			/* cropped frame */
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  860  			s->r =3D frame->crop;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  861  			break;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  862  		case V4L2_SEL_TGT_CROP_DEFAULT:
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  863  		case V4L2_SEL_TGT_CROP_BOUNDS:
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  864  			/* complete frame */
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  865  			s->r.left =3D 0;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  866  			s->r.top =3D 0;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  867  			s->r.width =3D frame->width;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  868  			s->r.height =3D frame->height;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  869  			break;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  870  		default:
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  871  			dev_err(ctx->bdisp_dev->dev, "Invalid target\n");
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  872  			return -EINVAL;
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  873  		}
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  874  		break;
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  875  =

3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  876  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  877  		switch (s->target) {
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  878  		case V4L2_SEL_TGT_COMPOSE:
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  879  		case V4L2_SEL_TGT_COMPOSE_PADDED:
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  880  			/* composed (cropped) frame */
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  881  			s->r =3D frame->crop;
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  882  			break;
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  883  		case V4L2_SEL_TGT_COMPOSE_DEFAULT:
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  884  		case V4L2_SEL_TGT_COMPOSE_BOUNDS:
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  885  			/* complete frame */
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  886  			s->r.left =3D 0;
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  887  			s->r.top =3D 0;
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  888  			s->r.width =3D frame->width;
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  889  			s->r.height =3D frame->height;
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  890  			break;
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  891  		default:
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  892  			dev_err(ctx->bdisp_dev->dev, "Invalid target\n");
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  893  			return -EINVAL;
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  894  		}
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  895  		break;
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  896  =

3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  897  	default:
3d8bffe88316c0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-07-10  898  		dev_err(ctx->bdisp_dev->dev, "Invalid type\n");
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  899  		return -EINVAL;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  900  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  901  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  902  	return 0;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  903  }
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e 2015-05-12  904  =


:::::: The code at line 725 was first introduced by commit
:::::: 28ffeebbb7bdc0dd7899286b63f3c359d43d0a1a [media] bdisp: 2D blitter d=
river using v4l2 mem2mem framework

:::::: TO: Fabien Dessenne <fabien.dessenne@st.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0099546433736650893==--

