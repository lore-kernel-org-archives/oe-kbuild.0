Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FA0A40
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Apr 2023 02:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681611482; x=1713147482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y4kKTaIbZ0wJdw0bZSFtpbnRebOUyDdV7LWT7e9fvlI=;
  b=NXWnKCv5P1sLAvGS1Ad15ZvrBTh5XxpCKSpqOzkyEq5L1SkQVNMhuzl/
   Rx0czaeE8rHBquZVT394R0hd22bNQ5ml+309ouDfE5s6/lsEzKhg7skIo
   QmGuBcEoyOaQGv8hzcFzf/hOoP3GrYNMYhLSIk5ex3smCpV0qtTEmlFvb
   sRUx2v8AV1P143As35k7e/Frgb72CPnNAo93ZNBulKjyxUM8FwAlyPNWp
   OJa1mjMxHQMnBOonL9tMDkgb9uUqIrtMsBGlBEtUU6RRWnGoIzN8fRrRV
   cte+5a7mOv0zzyCT4sOfN3Na6YEHsqFetHSFTujywZ1otZg9YgLzdWzxU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="325039169"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="325039169"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 19:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="814364176"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="814364176"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Apr 2023 19:18:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnrxn-000bTn-00;
	Sun, 16 Apr 2023 02:17:59 +0000
Date: Sun, 16 Apr 2023 10:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:548
 vop2_afbc_transform_offset() error: uninitialized symbol 'tx'.
Message-ID: <202304161033.nSvRmoU0-lkp@intel.com>
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
TO: Andy Yan <andy.yan@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Sascha Hauer <s.hauer@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a7a55e27ad72fb0dc9281d6211cffeebef8dde65
commit: 604be85547ce4d61b89292d2f9a78c721b778c16 drm/rockchip: Add VOP2 driver
date:   12 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-m031-20230415 (https://download.01.org/0day-ci/archive/20230416/202304161033.nSvRmoU0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304161033.nSvRmoU0-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:548 vop2_afbc_transform_offset() error: uninitialized symbol 'tx'.
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:549 vop2_afbc_transform_offset() error: uninitialized symbol 'ty'.
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2317 vop2_create_crtc() error: uninitialized symbol 'possible_crtcs'.

Old smatch warnings:
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1616 vop2_crtc_atomic_enable() warn: inconsistent returns '&vop2->vop2_lock'.

vim +/tx +548 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

604be85547ce4d Andy Yan 2022-04-22  476  
604be85547ce4d Andy Yan 2022-04-22  477  static u32 vop2_afbc_transform_offset(struct drm_plane_state *pstate,
604be85547ce4d Andy Yan 2022-04-22  478  				      bool afbc_half_block_en)
604be85547ce4d Andy Yan 2022-04-22  479  {
604be85547ce4d Andy Yan 2022-04-22  480  	struct drm_rect *src = &pstate->src;
604be85547ce4d Andy Yan 2022-04-22  481  	struct drm_framebuffer *fb = pstate->fb;
604be85547ce4d Andy Yan 2022-04-22  482  	u32 bpp = fb->format->cpp[0] * 8;
604be85547ce4d Andy Yan 2022-04-22  483  	u32 vir_width = (fb->pitches[0] << 3) / bpp;
604be85547ce4d Andy Yan 2022-04-22  484  	u32 width = drm_rect_width(src) >> 16;
604be85547ce4d Andy Yan 2022-04-22  485  	u32 height = drm_rect_height(src) >> 16;
604be85547ce4d Andy Yan 2022-04-22  486  	u32 act_xoffset = src->x1 >> 16;
604be85547ce4d Andy Yan 2022-04-22  487  	u32 act_yoffset = src->y1 >> 16;
604be85547ce4d Andy Yan 2022-04-22  488  	u32 align16_crop = 0;
604be85547ce4d Andy Yan 2022-04-22  489  	u32 align64_crop = 0;
604be85547ce4d Andy Yan 2022-04-22  490  	u32 height_tmp;
604be85547ce4d Andy Yan 2022-04-22  491  	u8 tx, ty;
604be85547ce4d Andy Yan 2022-04-22  492  	u8 bottom_crop_line_num = 0;
604be85547ce4d Andy Yan 2022-04-22  493  
604be85547ce4d Andy Yan 2022-04-22  494  	/* 16 pixel align */
604be85547ce4d Andy Yan 2022-04-22  495  	if (height & 0xf)
604be85547ce4d Andy Yan 2022-04-22  496  		align16_crop = 16 - (height & 0xf);
604be85547ce4d Andy Yan 2022-04-22  497  
604be85547ce4d Andy Yan 2022-04-22  498  	height_tmp = height + align16_crop;
604be85547ce4d Andy Yan 2022-04-22  499  
604be85547ce4d Andy Yan 2022-04-22  500  	/* 64 pixel align */
604be85547ce4d Andy Yan 2022-04-22  501  	if (height_tmp & 0x3f)
604be85547ce4d Andy Yan 2022-04-22  502  		align64_crop = 64 - (height_tmp & 0x3f);
604be85547ce4d Andy Yan 2022-04-22  503  
604be85547ce4d Andy Yan 2022-04-22  504  	bottom_crop_line_num = align16_crop + align64_crop;
604be85547ce4d Andy Yan 2022-04-22  505  
604be85547ce4d Andy Yan 2022-04-22  506  	switch (pstate->rotation &
604be85547ce4d Andy Yan 2022-04-22  507  		(DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y |
604be85547ce4d Andy Yan 2022-04-22  508  		 DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270)) {
604be85547ce4d Andy Yan 2022-04-22  509  	case DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y:
604be85547ce4d Andy Yan 2022-04-22  510  		tx = 16 - ((act_xoffset + width) & 0xf);
604be85547ce4d Andy Yan 2022-04-22  511  		ty = bottom_crop_line_num - act_yoffset;
604be85547ce4d Andy Yan 2022-04-22  512  		break;
604be85547ce4d Andy Yan 2022-04-22  513  	case DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90:
604be85547ce4d Andy Yan 2022-04-22  514  		tx = bottom_crop_line_num - act_yoffset;
604be85547ce4d Andy Yan 2022-04-22  515  		ty = vir_width - width - act_xoffset;
604be85547ce4d Andy Yan 2022-04-22  516  		break;
604be85547ce4d Andy Yan 2022-04-22  517  	case DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270:
604be85547ce4d Andy Yan 2022-04-22  518  		tx = act_yoffset;
604be85547ce4d Andy Yan 2022-04-22  519  		ty = act_xoffset;
604be85547ce4d Andy Yan 2022-04-22  520  		break;
604be85547ce4d Andy Yan 2022-04-22  521  	case DRM_MODE_REFLECT_X:
604be85547ce4d Andy Yan 2022-04-22  522  		tx = 16 - ((act_xoffset + width) & 0xf);
604be85547ce4d Andy Yan 2022-04-22  523  		ty = act_yoffset;
604be85547ce4d Andy Yan 2022-04-22  524  		break;
604be85547ce4d Andy Yan 2022-04-22  525  	case DRM_MODE_REFLECT_Y:
604be85547ce4d Andy Yan 2022-04-22  526  		tx = act_xoffset;
604be85547ce4d Andy Yan 2022-04-22  527  		ty = bottom_crop_line_num - act_yoffset;
604be85547ce4d Andy Yan 2022-04-22  528  		break;
604be85547ce4d Andy Yan 2022-04-22  529  	case DRM_MODE_ROTATE_90:
604be85547ce4d Andy Yan 2022-04-22  530  		tx = bottom_crop_line_num - act_yoffset;
604be85547ce4d Andy Yan 2022-04-22  531  		ty = act_xoffset;
604be85547ce4d Andy Yan 2022-04-22  532  		break;
604be85547ce4d Andy Yan 2022-04-22  533  	case DRM_MODE_ROTATE_270:
604be85547ce4d Andy Yan 2022-04-22  534  		tx = act_yoffset;
604be85547ce4d Andy Yan 2022-04-22  535  		ty = vir_width - width - act_xoffset;
604be85547ce4d Andy Yan 2022-04-22  536  		break;
604be85547ce4d Andy Yan 2022-04-22  537  	case 0:
604be85547ce4d Andy Yan 2022-04-22  538  		tx = act_xoffset;
604be85547ce4d Andy Yan 2022-04-22  539  		ty = act_yoffset;
604be85547ce4d Andy Yan 2022-04-22  540  		break;
604be85547ce4d Andy Yan 2022-04-22  541  	}
604be85547ce4d Andy Yan 2022-04-22  542  
604be85547ce4d Andy Yan 2022-04-22  543  	if (afbc_half_block_en)
604be85547ce4d Andy Yan 2022-04-22  544  		ty &= 0x7f;
604be85547ce4d Andy Yan 2022-04-22  545  
604be85547ce4d Andy Yan 2022-04-22  546  #define TRANSFORM_XOFFSET GENMASK(7, 0)
604be85547ce4d Andy Yan 2022-04-22  547  #define TRANSFORM_YOFFSET GENMASK(23, 16)
604be85547ce4d Andy Yan 2022-04-22 @548  	return FIELD_PREP(TRANSFORM_XOFFSET, tx) |
604be85547ce4d Andy Yan 2022-04-22 @549  		FIELD_PREP(TRANSFORM_YOFFSET, ty);
604be85547ce4d Andy Yan 2022-04-22  550  }
604be85547ce4d Andy Yan 2022-04-22  551  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
