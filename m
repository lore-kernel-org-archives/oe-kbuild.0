Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924B61946B9
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 18:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729448409; cv=none; b=kdlhrkWAKVyEODxqeoMTzMcIr+o88Z9CiZw0HRXRT2AO8cJsEsD3OwhUv7f1Q2+VXQ07VqPGT+KDgbwvTXT0DkYoSlt99CHprGgnXfJySQFz6QrpAujS0kNYURXZtiQlE3KDAa1bXVly/+d6Hpy+mrSgSLwByBMhoyVKUid21d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729448409; c=relaxed/simple;
	bh=6xLXDaYFfyVLgTFS+bdqS388Me8R/kXUUFJJbjnTkCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W3Abz9oB/sS4Q3iNJd47AJ3u0sTGrhHCB/FntTXQYfFNY6i28IjnOa5DNal1BOUuOR2YRZNlPSQyZWW/Rn4icmaXZDN6Hccx2oHs8hSl2OkBrTOn45/ZX7cO7yyYRsZXXwUe7G0cTFkOQGUGOHKnvxBUhDQEcT5bpyy1xFrM0EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7SNwB9r; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7SNwB9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729448408; x=1760984408;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6xLXDaYFfyVLgTFS+bdqS388Me8R/kXUUFJJbjnTkCA=;
  b=n7SNwB9r2g1NNOazOvvwxp8yQYi29HEipLnxoNukjzlTuRDDpTUqxmfQ
   xqxuZrG7DRdsQLQzW4wuUlcdtmyNiiAIa71IlEZulcsJu+hi4rmhgzjEr
   N+JtvU4wGUlJYLA+Uk4F1MXlEI8jXAfaGCqdRpcr1vEwoWBGbDxxpG2Fd
   0l410Z9hag/M9zAZHJfVbKoEdyDdU4kFaKITJePgnc5Y5P+uTzZnD4n//
   8J6oKwbfeAL5Kj+deB9bxEwfwMOzQV9Flxg27glhnw/PVE6gPf4Klag8u
   dMGWFEatdxyqpP42r2xhwOo1TI1bWj2laHEIOzdLHUx6rpitw3DRFKZfy
   g==;
X-CSE-ConnectionGUID: NFbVEEEZT56CbDw1d/z8WA==
X-CSE-MsgGUID: kuoErkbzQyCCGQ1XBQWvSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28878353"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28878353"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 11:20:05 -0700
X-CSE-ConnectionGUID: At7c4aplRiKUf0fyY5k44A==
X-CSE-MsgGUID: a0x1C/uHT2exKdW6rDUtDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="110088238"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2024 11:20:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2aX1-000Qg1-2C;
	Sun, 20 Oct 2024 18:19:59 +0000
Date: Mon, 21 Oct 2024 02:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 1/5] media: mediatek: vcodec: setting request complete
 before buffer done
Message-ID: <202410210341.tHV0MOtw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241012064333.27269-2-yunfei.dong@mediatek.com>
References: <20241012064333.27269-2-yunfei.dong@mediatek.com>
TO: Yunfei Dong <yunfei.dong@mediatek.com>
TO: "Nícolas F . R . A . Prado" <nfraprado@collabora.com>
TO: Sebastian Fricke <sebastian.fricke@collabora.com>
TO: Nicolas Dufresne <nicolas.dufresne@collabora.com>
TO: Hans Verkuil <hverkuil@xs4all.nl>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Benjamin Gaignard <benjamin.gaignard@collabora.com>
TO: Nathan Hebert <nhebert@chromium.org>
TO: Daniel Almeida <daniel.almeida@collabora.com>
CC: "Hsin-Yi Wang" <hsinyi@chromium.org>
CC: Fritz Koenig <frkoenig@chromium.org>
CC: Daniel Vetter <daniel@ffwll.ch>
CC: Steve Cho <stevecho@chromium.org>
CC: Yunfei Dong <yunfei.dong@mediatek.com>
CC: linux-media@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: Project_Global_Chrome_Upstream_Group@mediatek.com

Hi Yunfei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunfei-Dong/media-mediatek-vcodec-setting-request-complete-before-buffer-done/20241012-144607
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20241012064333.27269-2-yunfei.dong%40mediatek.com
patch subject: [PATCH v5 1/5] media: mediatek: vcodec: setting request complete before buffer done
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241021/202410210341.tHV0MOtw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410210341.tHV0MOtw-lkp@intel.com/

smatch warnings:
drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c:272 mtk_vdec_stateless_cap_to_disp() warn: variable dereferenced before check 'vb2_v4l2_src' (see line 268)

vim +/vb2_v4l2_src +272 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c

8cdc3794b2e34b drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c              Yunfei Dong 2021-08-06  246  
01abf5fbb081c0 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2023-07-29  247  static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int error,
5c46486b8d2760 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c Yunfei Dong 2024-10-12  248  					   struct vb2_v4l2_buffer *vb2_v4l2_src)
8cdc3794b2e34b drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c              Yunfei Dong 2021-08-06  249  {
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  250  	struct vb2_v4l2_buffer *vb2_dst;
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  251  	enum vb2_buffer_state state;
5c46486b8d2760 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c Yunfei Dong 2024-10-12  252  	struct media_request *src_buf_req;
8cdc3794b2e34b drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c              Yunfei Dong 2021-08-06  253  
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  254  	if (error)
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  255  		state = VB2_BUF_STATE_ERROR;
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  256  	else
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  257  		state = VB2_BUF_STATE_DONE;
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  258  
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  259  	vb2_dst = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
d879f770e4d1d5 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-11-17  260  	if (vb2_dst) {
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  261  		v4l2_m2m_buf_done(vb2_dst, state);
41f03c673cb7b5 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2023-07-29  262  		mtk_v4l2_vdec_dbg(2, ctx, "free frame buffer id:%d to done list",
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  263  				  vb2_dst->vb2_buf.index);
d879f770e4d1d5 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-11-17  264  	} else {
41f03c673cb7b5 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2023-07-29  265  		mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
d879f770e4d1d5 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-11-17  266  	}
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  267  
5c46486b8d2760 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c Yunfei Dong 2024-10-12 @268  	src_buf_req = vb2_v4l2_src->vb2_buf.req_obj.req;
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  269  	if (src_buf_req)
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  270  		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
5c46486b8d2760 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c Yunfei Dong 2024-10-12  271  
5c46486b8d2760 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c Yunfei Dong 2024-10-12 @272  	if (vb2_v4l2_src)
5c46486b8d2760 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c Yunfei Dong 2024-10-12  273  		v4l2_m2m_buf_done(vb2_v4l2_src, state);
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  274  }
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
