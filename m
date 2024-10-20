Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB82405FB
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 21:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729460271; cv=none; b=Yq7biFrWZFE8BhtqBXRETvZJMKuTY3IZImhxbcvqujbdSmlKrqvd7zf+gCyx/UQoIV22o/qu013Uz8K41p0Yw3urUWv20JPs6ovMm2a0Zhslavn3T2HEUeJIpIjO+BWe9Q7k1LczhN76KJwRQp5SuZQO5FabF3gD5A8PSFmk/rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729460271; c=relaxed/simple;
	bh=4Nd2jyI/3mQaoDIJ2XJJdeLAj2PI/O/m3nl3MRzjAuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o7SAHmyEIPls3gzHx2ZyGrML8Kwjj43XDBpXIMqzKslQtt90fLit0n5c+kF1dm4ujSPGLgzrWXkgGyjzELHFXrRbfHN0D0QPrgGED5uIfoglLTSe7G3f/N4pswJTcn6a1xV5H1mk8jZMKpCERmjvyDzmvpIkzQimiebwmaUoNBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KK0So1NM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KK0So1NM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729460268; x=1760996268;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4Nd2jyI/3mQaoDIJ2XJJdeLAj2PI/O/m3nl3MRzjAuo=;
  b=KK0So1NMbIJ3Zue7gw/DuSVEWGbMKvgnzJpy5/59Fto196Tgki30zGv+
   G/GVne2MW8ZV2q9TVhJLzePrOMtP21KNYsIA3tjg+TefTYvBuG6PfkynK
   1y9Q+YjD2ze6i6tHC04+lafvSa4pSK45gOH1O6arFNbRPgXEe1drbKGR/
   TFCD+GdtUjg2Kq+b9WnnFRkC2RTshcsuSN30QXJ8MYuonkkB2qxvadslr
   DGu0wX3UDu31zFHCHRYNUysiXJh++s44ya+7JGTLxKPzxU7Tnc5+eqz2s
   5oWs6zO4yS2+MkeogPHUsvzx+tP4GrcTucTu425wCkySJAEaMVtTxVCia
   A==;
X-CSE-ConnectionGUID: ouiAGKL2SwW8LIytvUtCGQ==
X-CSE-MsgGUID: I/K5WiCUTqWIL0z6MxHeWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46403392"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46403392"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 14:37:47 -0700
X-CSE-ConnectionGUID: p02p1N0JTU2CFnrvdvTx/A==
X-CSE-MsgGUID: Nf/tfLwPQkmob70RroOgSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="83331843"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Oct 2024 14:37:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2dcO-000Qol-2I;
	Sun, 20 Oct 2024 21:37:44 +0000
Date: Mon, 21 Oct 2024 05:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 3/5] media: mediatek: vcodec: Get SRC buffer from
 bitstream instead of M2M
Message-ID: <202410210753.AzGgWmKA-lkp@intel.com>
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
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241021/202410210753.AzGgWmKA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410210753.AzGgWmKA-lkp@intel.com/

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
