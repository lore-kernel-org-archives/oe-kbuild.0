Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8AA38DD8
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 16:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729354663; cv=none; b=W0ji9T+zTxPptuYHCWycAiVLXnbrQ6EOuopU7rsAVrM/zr9E/uNaY/FdgGnAwdjKSegW3M7qLK94wGmgYiLvPo/NHvCzxOB89TIJV9B33csYiZCju8c+wFG0m/lSrCyIef+CU3Jx7s0NZoCNfwDjeyGOXtjXYhI2daT4xwsbTlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729354663; c=relaxed/simple;
	bh=0RXuoD11cx/sZJd+leSJz8OeW2QMNGfkePQS0XGy76Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YY86xrlBBPbub2BneXix916EbLV95JfKKLSxMHPjhI8WGbOmE508oTgqnDyesrZlHVbRiYNINBJP38VmnxKmMse10GpbFn01b5HBT5fakYyGkoV4mJG4wb4j4Q5t+XlUak+QRMeoDZI8mnHTTEE/wEp0YAYRZsy56OaJXmhbwe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtDFaEDq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtDFaEDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729354661; x=1760890661;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0RXuoD11cx/sZJd+leSJz8OeW2QMNGfkePQS0XGy76Q=;
  b=TtDFaEDqp9G1CMeLRvg0J7HwJ0Ggm10At3hj7/BIFZVdZlGRCD86V7JX
   DSYmFYHlJVMmmV1AVWKy6tJoNgs7f0SesR+zwSY7L/84juPcoc4dhkTeV
   q5aaW278DveUP7GnGCsoO8rmkm/fsF/dfTY0OyadgQjQPxBccOHiWxEdq
   fFPgQBB/qx2Rn2PmLddEcI+q5KC0yu0xmIq7uxjIFsCokfmXj79YCYEnd
   79ObSv4LUXgYyKur+b1Y83dgzi7QogpR/Xk988B4sUa+wNf/4noJwoGWC
   A+nIS17HriZrXDTjrUUlmQgWmlJUC3lO8QkwXmKorwptWj+DM9yAZ5LU3
   g==;
X-CSE-ConnectionGUID: Zv8kci7GRtiguA3SBJUWQw==
X-CSE-MsgGUID: HWrVBSylTlqBDSG4FMnpGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="46373708"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="46373708"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 09:17:40 -0700
X-CSE-ConnectionGUID: aNG1aCwQRaaEKgiYd2ScKA==
X-CSE-MsgGUID: CQngFWnlT8G7Lrfrsu4EcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79190113"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Oct 2024 09:17:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2C92-000P9l-2W;
	Sat, 19 Oct 2024 16:17:36 +0000
Date: Sun, 20 Oct 2024 00:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 3/5] media: mediatek: vcodec: Get SRC buffer from
 bitstream instead of M2M
Message-ID: <202410200022.8uNnjxzj-lkp@intel.com>
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
In-Reply-To: <20241012064333.27269-4-yunfei.dong@mediatek.com>
References: <20241012064333.27269-4-yunfei.dong@mediatek.com>
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
patch link:    https://lore.kernel.org/r/20241012064333.27269-4-yunfei.dong%40mediatek.com
patch subject: [PATCH v5 3/5] media: mediatek: vcodec: Get SRC buffer from bitstream instead of M2M
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241020/202410200022.8uNnjxzj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410200022.8uNnjxzj-lkp@intel.com/

smatch warnings:
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:721 vdec_vp9_slice_setup_lat_from_src_buf() warn: can 'src_buf_info' even be NULL?
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c:1072 vdec_av1_slice_setup_lat_from_src_buf() warn: can 'src_buf_info' even be NULL?

vim +/src_buf_info +721 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c

b0f407c19648ae drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c         Yunfei Dong 2022-05-13  713  
5d418351ca8f17 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c         Yunfei Dong 2022-05-12  714  static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance *instance,
af58c67202dda7 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c Yunfei Dong 2024-10-12  715  						 struct mtk_vcodec_mem *bs,
5d418351ca8f17 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c         Yunfei Dong 2022-05-12  716  						 struct vdec_lat_buf *lat_buf)
5d418351ca8f17 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c         Yunfei Dong 2022-05-12  717  {
af58c67202dda7 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c Yunfei Dong 2024-10-12  718  	struct mtk_video_dec_buf *src_buf_info;
5d418351ca8f17 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c         Yunfei Dong 2022-05-12  719  
af58c67202dda7 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c Yunfei Dong 2024-10-12  720  	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
af58c67202dda7 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c Yunfei Dong 2024-10-12 @721  	if (!src_buf_info)
5d418351ca8f17 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c         Yunfei Dong 2022-05-12  722  		return -EINVAL;
5d418351ca8f17 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c         Yunfei Dong 2022-05-12  723  
af58c67202dda7 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c Yunfei Dong 2024-10-12  724  	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
5d418351ca8f17 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c         Yunfei Dong 2022-05-12  725  
af58c67202dda7 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c Yunfei Dong 2024-10-12  726  	v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, &lat_buf->ts_info, true);
5d418351ca8f17 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c         Yunfei Dong 2022-05-12  727  	return 0;
5d418351ca8f17 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c         Yunfei Dong 2022-05-12  728  }
5d418351ca8f17 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c         Yunfei Dong 2022-05-12  729  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
