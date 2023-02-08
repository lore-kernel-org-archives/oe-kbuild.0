Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1652933FF
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Feb 2023 16:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675872560; x=1707408560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wrUFbOUnmNIf7c508M79EktzeRBpx/qGmZSQZ/qM8Gg=;
  b=IMgteqcXawYWliXTyBgLuN1uy8czg8yIiFegn/iEJorbLitI1UWQ64SL
   2c1EQJFKKo2QHR7v48EoGVHR+4GEFNARFzUMhJcNPJrwNv8lSApPLmrGx
   GraeJoiqsvTkxW1CZlm3dQgIzTbTnzsFKkBCtEv5xmbSZ/ZFqgUCdM1hU
   lwLtMHej1earDh7CXr0YpDrq6lkZeMIlRYtOGQFmB2KVRgTtEnTg3yDll
   51exjecl/kPw6pqvqEL0MvrL7LAml1zlE6/CZKqwHN6ReoNXyxKlqyENt
   gGLIMsOWYe8CtFSoJcCflu9DAb770RKqZyKRBmRb3NXgx5c6SNHsbPntR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="317845822"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="317845822"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 08:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="617246808"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="617246808"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Feb 2023 08:09:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPn0N-0004Wf-1u;
	Wed, 08 Feb 2023 16:09:07 +0000
Date: Thu, 9 Feb 2023 00:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:725 bdisp_g_fmt()
 warn: passing a valid pointer to 'PTR_ERR'
Message-ID: <202302090003.U6FocY0F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0983f6bf2bfc0789b51ddf7315f644ff4da50acb
commit: e7b8153e2a4f0c9c8d1450aa7328d54ea64fe8b2 media: platform: place stm32/ and sti/ under st/ dir
date:   11 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 11 months ago
config: powerpc-randconfig-m041-20230208 (https://download.01.org/0day-ci/archive/20230209/202302090003.U6FocY0F-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:725 bdisp_g_fmt() warn: passing a valid pointer to 'PTR_ERR'
drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:852 bdisp_g_selection() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +725 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c

28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  716  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  717  static int bdisp_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  718  {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  719  	struct bdisp_ctx *ctx = fh_to_ctx(fh);
bf3881707b6f635 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Colin Ian King  2017-10-29  720  	struct v4l2_pix_format *pix;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  721  	struct bdisp_frame *frame  = ctx_get_frame(ctx, f->type);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  722  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  723  	if (IS_ERR(frame)) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  724  		dev_err(ctx->bdisp_dev->dev, "Invalid frame (%p)\n", frame);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12 @725  		return PTR_ERR(frame);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  726  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  727  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  728  	pix = &f->fmt.pix;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  729  	pix->width = frame->width;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  730  	pix->height = frame->height;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  731  	pix->pixelformat = frame->fmt->pixelformat;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  732  	pix->field = frame->field;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  733  	pix->bytesperline = frame->bytesperline;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  734  	pix->sizeimage = frame->sizeimage;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  735  	pix->colorspace = (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) ?
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  736  				frame->colorspace : bdisp_dflt_fmt.colorspace;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  737  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  738  	return 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  739  }
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  740  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  741  static int bdisp_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  742  {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  743  	struct bdisp_ctx *ctx = fh_to_ctx(fh);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  744  	struct v4l2_pix_format *pix = &f->fmt.pix;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  745  	const struct bdisp_fmt *format;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  746  	u32 in_w, in_h;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  747  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  748  	format = bdisp_find_fmt(pix->pixelformat);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  749  	if (!format) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  750  		dev_dbg(ctx->bdisp_dev->dev, "Unknown format 0x%x\n",
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  751  			pix->pixelformat);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  752  		return -EINVAL;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  753  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  754  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  755  	/* YUV420P only supported for VIDEO_OUTPUT */
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  756  	if ((format->pixelformat == V4L2_PIX_FMT_YUV420) &&
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  757  	    (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  758  		dev_dbg(ctx->bdisp_dev->dev, "No YU12 on capture\n");
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  759  		return -EINVAL;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  760  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  761  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  762  	/* Field (interlaced only supported on OUTPUT) */
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  763  	if ((f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  764  	    (pix->field != V4L2_FIELD_INTERLACED))
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  765  		pix->field = V4L2_FIELD_NONE;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  766  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  767  	/* Adjust width & height */
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  768  	in_w = pix->width;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  769  	in_h = pix->height;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  770  	v4l_bound_align_image(&pix->width,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  771  			      BDISP_MIN_W, BDISP_MAX_W,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  772  			      ffs(format->w_align) - 1,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  773  			      &pix->height,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  774  			      BDISP_MIN_H, BDISP_MAX_H,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  775  			      ffs(format->h_align) - 1,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  776  			      0);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  777  	if ((pix->width != in_w) || (pix->height != in_h))
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  778  		dev_dbg(ctx->bdisp_dev->dev,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  779  			"%s size updated: %dx%d -> %dx%d\n", __func__,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  780  			in_w, in_h, pix->width, pix->height);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  781  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  782  	pix->bytesperline = (pix->width * format->bpp_plane0) / 8;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  783  	pix->sizeimage = (pix->width * pix->height * format->bpp) / 8;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  784  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  785  	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  786  		pix->colorspace = bdisp_dflt_fmt.colorspace;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  787  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  788  	return 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  789  }
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  790  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  791  static int bdisp_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  792  {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  793  	struct bdisp_ctx *ctx = fh_to_ctx(fh);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  794  	struct vb2_queue *vq;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  795  	struct bdisp_frame *frame;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  796  	struct v4l2_pix_format *pix;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  797  	int ret;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  798  	u32 state;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  799  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  800  	ret = bdisp_try_fmt(file, fh, f);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  801  	if (ret) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  802  		dev_err(ctx->bdisp_dev->dev, "Cannot set format\n");
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  803  		return ret;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  804  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  805  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  806  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  807  	if (vb2_is_streaming(vq)) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  808  		dev_err(ctx->bdisp_dev->dev, "queue (%d) busy\n", f->type);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  809  		return -EBUSY;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  810  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  811  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  812  	frame = (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) ?
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  813  			&ctx->src : &ctx->dst;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  814  	pix = &f->fmt.pix;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  815  	frame->fmt = bdisp_find_fmt(pix->pixelformat);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  816  	if (!frame->fmt) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  817  		dev_err(ctx->bdisp_dev->dev, "Unknown format 0x%x\n",
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  818  			pix->pixelformat);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  819  		return -EINVAL;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  820  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  821  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  822  	frame->width = pix->width;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  823  	frame->height = pix->height;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  824  	frame->bytesperline = pix->bytesperline;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  825  	frame->sizeimage = pix->sizeimage;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  826  	frame->field = pix->field;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  827  	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  828  		frame->colorspace = pix->colorspace;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  829  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  830  	frame->crop.width = frame->width;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  831  	frame->crop.height = frame->height;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  832  	frame->crop.left = 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  833  	frame->crop.top = 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  834  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  835  	state = BDISP_PARAMS;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  836  	state |= (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ?
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  837  			BDISP_DST_FMT : BDISP_SRC_FMT;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  838  	bdisp_ctx_state_lock_set(state, ctx);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  839  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  840  	return 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  841  }
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  842  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  843  static int bdisp_g_selection(struct file *file, void *fh,
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  844  			     struct v4l2_selection *s)
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  845  {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  846  	struct bdisp_frame *frame;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  847  	struct bdisp_ctx *ctx = fh_to_ctx(fh);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  848  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  849  	frame = ctx_get_frame(ctx, s->type);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  850  	if (IS_ERR(frame)) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  851  		dev_err(ctx->bdisp_dev->dev, "Invalid frame (%p)\n", frame);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12 @852  		return PTR_ERR(frame);
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  853  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  854  
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  855  	switch (s->type) {
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  856  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  857  		switch (s->target) {
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  858  		case V4L2_SEL_TGT_CROP:
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  859  			/* cropped frame */
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  860  			s->r = frame->crop;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  861  			break;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  862  		case V4L2_SEL_TGT_CROP_DEFAULT:
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  863  		case V4L2_SEL_TGT_CROP_BOUNDS:
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  864  			/* complete frame */
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  865  			s->r.left = 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  866  			s->r.top = 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  867  			s->r.width = frame->width;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  868  			s->r.height = frame->height;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  869  			break;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  870  		default:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  871  			dev_err(ctx->bdisp_dev->dev, "Invalid target\n");
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  872  			return -EINVAL;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  873  		}
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  874  		break;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  875  
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  876  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  877  		switch (s->target) {
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  878  		case V4L2_SEL_TGT_COMPOSE:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  879  		case V4L2_SEL_TGT_COMPOSE_PADDED:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  880  			/* composed (cropped) frame */
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  881  			s->r = frame->crop;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  882  			break;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  883  		case V4L2_SEL_TGT_COMPOSE_DEFAULT:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  884  		case V4L2_SEL_TGT_COMPOSE_BOUNDS:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  885  			/* complete frame */
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  886  			s->r.left = 0;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  887  			s->r.top = 0;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  888  			s->r.width = frame->width;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  889  			s->r.height = frame->height;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  890  			break;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  891  		default:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  892  			dev_err(ctx->bdisp_dev->dev, "Invalid target\n");
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  893  			return -EINVAL;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  894  		}
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  895  		break;
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  896  
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  897  	default:
3d8bffe88316c0c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-07-10  898  		dev_err(ctx->bdisp_dev->dev, "Invalid type\n");
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  899  		return -EINVAL;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  900  	}
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  901  
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  902  	return 0;
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  903  }
28ffeebbb7bdc0d drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenne 2015-05-12  904  

:::::: The code at line 725 was first introduced by commit
:::::: 28ffeebbb7bdc0dd7899286b63f3c359d43d0a1a [media] bdisp: 2D blitter driver using v4l2 mem2mem framework

:::::: TO: Fabien Dessenne <fabien.dessenne@st.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
