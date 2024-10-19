Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D292207A
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729344097; cv=none; b=Kb1yymUtbY9MQ7fFeRn805tV2sgyospXUUHR3MqpU2ry8sc8wmrkkP/8Djej7gnazayxEFIwOj/WO2QVBbi5UyygIGCLDy6D6OqxB1078MBizqmL5htReTDKHufmCKW+C+iO2aqC50VS8KEEuEojN3gwc3zHfCyIHlDqhxEO7vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729344097; c=relaxed/simple;
	bh=/h2omJlqDhH6JQY6QqFNKEpDxyNPBKrQXSNu1NHXt64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cSn031bEA1d/UqmYBQ5G2dRIY27kAlRb0LFzlHSjYnoNF6OYuFnNXQSF42TReHc2RTps4FrcZiR7Mwb5/xAyhhdAoizSAVAO/6TrWuya0hkPd81xWHpt+0PgY0VU3JpZmGuYBpYfw5tzcV07exJ+Dwj1hbLB3b0g89nQrRnj/wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIZc1SX7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIZc1SX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729344095; x=1760880095;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/h2omJlqDhH6JQY6QqFNKEpDxyNPBKrQXSNu1NHXt64=;
  b=IIZc1SX7IokK10C3qZ7oRfoo5UL9g3JE2nmQ5bToQm9LLtlpM22bpwGS
   yd68rw8cHGI7K1BaJvY+od5hEWpyqHRXBGb4CfiIguM8XYZqrzDBGYmUJ
   f0TI1qM13XdJUe808ZQntvjgt/e1o+KGZz/9aYsgs3W2Z3imRoW7aF/V7
   PKtG9IKZxMJ/7XxN0f9S8DXwtd9wTqpENZAAGcPjXYNFPgZEyTShr9N1L
   ZqSrC+76zjVWu+Oa0BK9j8Nz/BJfo4NMaLtFTFU8LCYEDVDULUoFaF+m4
   gVBvP1qcRYCcRdZdpbirGu2OuehZP0hE3gSaHT/pcy5pWHSOqfKJyl5Pv
   Q==;
X-CSE-ConnectionGUID: 6gcF8W4PTX2DAIkbOHAOAA==
X-CSE-MsgGUID: HwHCnhRzR2iHipEuu5G5Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39422446"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39422446"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 06:21:35 -0700
X-CSE-ConnectionGUID: 3/DCLSv8QKimAF6K9TnXrQ==
X-CSE-MsgGUID: 1qyv790IR/+KK81c2HL5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="109937919"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Oct 2024 06:21:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t29Oc-000P1d-39;
	Sat, 19 Oct 2024 13:21:30 +0000
Date: Sat, 19 Oct 2024 21:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 1/5] media: mediatek: vcodec: setting request complete
 before buffer done
Message-ID: <202410192150.2YkqysDO-lkp@intel.com>
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
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241019/202410192150.2YkqysDO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410192150.2YkqysDO-lkp@intel.com/

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
