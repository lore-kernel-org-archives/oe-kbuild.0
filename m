Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E32D515
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Apr 2024 02:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714445710; cv=none; b=RbhparFat2+TyujyjoLuDsVuO7V1P7pITK9X6oquaTS6M3OfqZNsyIaefaLnXDAfXFFPqNRwGhxjTf7AjJFdVuP5i95T7/Hykq53S5XEqnvCEhniCPGKPYdNLwpVxSg2y4cq4sS5Qo3o7g2RQFb0Ptay5AII6Nzy1j9YPMTZqJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714445710; c=relaxed/simple;
	bh=+OlCaVypan2bnV/WjxR4UHYy70rb/wj4pp89xYjoot8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FM7fXXxeJCCPL5mFMvlJWLZWxRkmNd20AG8WDTQt7wuM/B12M3qIl7v3+xiWtUdER90ndoEIYwPnrFNhyL/95YvnD8hOZ3mIJMDolnu6lwGu7tLR/YDSNfxDdVSI9PKnSmDBrNaIrDpbJV5XguQXNcjrgx3ixf0hWXEvZR7OKr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJgc5uRr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJgc5uRr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714445709; x=1745981709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+OlCaVypan2bnV/WjxR4UHYy70rb/wj4pp89xYjoot8=;
  b=IJgc5uRratAhZPLhgAsyt9vVFgrSBOWff9RCkVkWdIuFiH32e6N59yE6
   hkQsv5/g4WQx4f/EnKPq6gw+tdllJ0rtTOI/ML/Rt207W8Qyd3fdVKfj7
   1tCWePRCnARNiEpRa6ciIh1V0TU9Ut1XaiNDbLoQ58cbTdRd4VimcqlXW
   XZhZWWoRiBa8v14VuPhZJZXdGJumh98gCIp7JT1wl0M62Jd/fNfguLaNo
   aHFzxEQj8BkGGysGQBzpHl/Geq97TZXM/kkDiu7Mj7bs2/OnYcqt8PPZZ
   +xcSIuZS0C+igoROY3JYnZtHpaiHzM6MAi36S8ibT8fQNaZeapwE2PhFO
   Q==;
X-CSE-ConnectionGUID: ZrBT4t5mQQmrX6ZtlumnLA==
X-CSE-MsgGUID: lK3JtQtzR1+eVSSygcpTfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10299255"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10299255"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 19:55:08 -0700
X-CSE-ConnectionGUID: 1hrOagPJQSawY3krfUotrw==
X-CSE-MsgGUID: PGk1jcogSEWuvhTf0TJCzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="49508143"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Apr 2024 19:55:06 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1de4-0007e4-0m;
	Tue, 30 Apr 2024 02:55:04 +0000
Date: Tue, 30 Apr 2024 10:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:openEuler-1.0-LTS 21254/22260]
 drivers/gpu/drm/phytium/phytium_plane.c:218:7-9: WARNING: possible condition
 with no effect (if == else)
Message-ID: <202404301017.LO0G9z7D-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: lishuo <lishuo@phytium.com.cn>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   534530510857129d59e723e50cc93349b4a59fb2
commit: cad0702e5286d3cc80afe545de027858b855dd5a [21254/22260] DRM: Phytium display DRM driver
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r054-20240430 (https://download.01.org/0day-ci/archive/20240430/202404301017.LO0G9z7D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404301017.LO0G9z7D-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/phytium/phytium_plane.c:218:7-9: WARNING: possible condition with no effect (if == else)
--
>> drivers/gpu/drm/phytium/phytium_platform.c:149:2-9: line 149 is redundant because platform_get_irq() already prints an error

vim +218 drivers/gpu/drm/phytium/phytium_plane.c

cad0702e5286d3 lishuo 2023-10-27  196  
cad0702e5286d3 lishuo 2023-10-27  197  static void phytium_dc_get_plane_parameter(struct drm_plane *plane)
cad0702e5286d3 lishuo 2023-10-27  198  {
cad0702e5286d3 lishuo 2023-10-27  199  	struct phytium_plane *phytium_plane = to_phytium_plane(plane);
cad0702e5286d3 lishuo 2023-10-27  200  	struct drm_framebuffer *fb = plane->state->fb;
cad0702e5286d3 lishuo 2023-10-27  201  	struct phytium_framebuffer *phytium_fb = to_phytium_framebuffer(fb);
cad0702e5286d3 lishuo 2023-10-27  202  	struct phytium_gem_object *phytium_gem_obj = NULL;
cad0702e5286d3 lishuo 2023-10-27  203  	int i, num_planes = 0;
cad0702e5286d3 lishuo 2023-10-27  204  	const struct drm_format_info *info;
cad0702e5286d3 lishuo 2023-10-27  205  
cad0702e5286d3 lishuo 2023-10-27  206  	info = drm_format_info(fb->format->format);
cad0702e5286d3 lishuo 2023-10-27  207  	num_planes = info ? info->num_planes : 1;
cad0702e5286d3 lishuo 2023-10-27  208  
cad0702e5286d3 lishuo 2023-10-27  209  	for (i = 0; i < num_planes; i++) {
cad0702e5286d3 lishuo 2023-10-27  210  		phytium_gem_obj = phytium_fb->phytium_gem_obj[i];
cad0702e5286d3 lishuo 2023-10-27  211  		phytium_plane->iova[i] =  phytium_gem_obj->iova + fb->offsets[i];
cad0702e5286d3 lishuo 2023-10-27  212  		phytium_plane->size[i] = phytium_gem_obj->size - fb->offsets[i];
cad0702e5286d3 lishuo 2023-10-27  213  
cad0702e5286d3 lishuo 2023-10-27  214  		if (fb->modifier == DRM_FORMAT_MOD_PHYTIUM_TILE_MODE0_FBCDC)
cad0702e5286d3 lishuo 2023-10-27  215  			phytium_plane->tiling[i] = FRAMEBUFFER_TILE_MODE0;
cad0702e5286d3 lishuo 2023-10-27  216  		else if (fb->modifier == DRM_FORMAT_MOD_PHYTIUM_TILE_MODE3_FBCDC)
cad0702e5286d3 lishuo 2023-10-27  217  			phytium_plane->tiling[i] = FRAMEBUFFER_TILE_MODE3;
cad0702e5286d3 lishuo 2023-10-27 @218  		else if (fb->modifier == DRM_FORMAT_MOD_LINEAR)
cad0702e5286d3 lishuo 2023-10-27  219  			phytium_plane->tiling[i] = FRAMEBUFFER_LINEAR;
cad0702e5286d3 lishuo 2023-10-27  220  		else
cad0702e5286d3 lishuo 2023-10-27  221  			phytium_plane->tiling[i] = FRAMEBUFFER_LINEAR;
cad0702e5286d3 lishuo 2023-10-27  222  
cad0702e5286d3 lishuo 2023-10-27  223  		if (i == 0) {
cad0702e5286d3 lishuo 2023-10-27  224  			switch (fb->format->format) {
cad0702e5286d3 lishuo 2023-10-27  225  			case DRM_FORMAT_ARGB2101010:
cad0702e5286d3 lishuo 2023-10-27  226  			case DRM_FORMAT_ABGR2101010:
cad0702e5286d3 lishuo 2023-10-27  227  			case DRM_FORMAT_RGBA1010102:
cad0702e5286d3 lishuo 2023-10-27  228  			case DRM_FORMAT_BGRA1010102:
cad0702e5286d3 lishuo 2023-10-27  229  				phytium_plane->format = FRAMEBUFFER_FORMAT_ARGB2101010;
cad0702e5286d3 lishuo 2023-10-27  230  				break;
cad0702e5286d3 lishuo 2023-10-27  231  
cad0702e5286d3 lishuo 2023-10-27  232  			case DRM_FORMAT_ARGB8888:
cad0702e5286d3 lishuo 2023-10-27  233  			case DRM_FORMAT_ABGR8888:
cad0702e5286d3 lishuo 2023-10-27  234  			case DRM_FORMAT_RGBA8888:
cad0702e5286d3 lishuo 2023-10-27  235  			case DRM_FORMAT_BGRA8888:
cad0702e5286d3 lishuo 2023-10-27  236  				phytium_plane->format = FRAMEBUFFER_FORMAT_ARGB8888;
cad0702e5286d3 lishuo 2023-10-27  237  				break;
cad0702e5286d3 lishuo 2023-10-27  238  
cad0702e5286d3 lishuo 2023-10-27  239  			case DRM_FORMAT_XRGB8888:
cad0702e5286d3 lishuo 2023-10-27  240  			case DRM_FORMAT_XBGR8888:
cad0702e5286d3 lishuo 2023-10-27  241  			case DRM_FORMAT_RGBX8888:
cad0702e5286d3 lishuo 2023-10-27  242  			case DRM_FORMAT_BGRX8888:
cad0702e5286d3 lishuo 2023-10-27  243  				phytium_plane->format = FRAMEBUFFER_FORMAT_XRGB8888;
cad0702e5286d3 lishuo 2023-10-27  244  				break;
cad0702e5286d3 lishuo 2023-10-27  245  
cad0702e5286d3 lishuo 2023-10-27  246  			case DRM_FORMAT_ARGB4444:
cad0702e5286d3 lishuo 2023-10-27  247  			case DRM_FORMAT_ABGR4444:
cad0702e5286d3 lishuo 2023-10-27  248  			case DRM_FORMAT_RGBA4444:
cad0702e5286d3 lishuo 2023-10-27  249  			case DRM_FORMAT_BGRA4444:
cad0702e5286d3 lishuo 2023-10-27  250  				phytium_plane->format = FRAMEBUFFER_FORMAT_ARGB4444;
cad0702e5286d3 lishuo 2023-10-27  251  				break;
cad0702e5286d3 lishuo 2023-10-27  252  
cad0702e5286d3 lishuo 2023-10-27  253  			case DRM_FORMAT_XRGB4444:
cad0702e5286d3 lishuo 2023-10-27  254  			case DRM_FORMAT_XBGR4444:
cad0702e5286d3 lishuo 2023-10-27  255  			case DRM_FORMAT_RGBX4444:
cad0702e5286d3 lishuo 2023-10-27  256  			case DRM_FORMAT_BGRX4444:
cad0702e5286d3 lishuo 2023-10-27  257  				phytium_plane->format = FRAMEBUFFER_FORMAT_XRGB4444;
cad0702e5286d3 lishuo 2023-10-27  258  				break;
cad0702e5286d3 lishuo 2023-10-27  259  
cad0702e5286d3 lishuo 2023-10-27  260  			case DRM_FORMAT_ARGB1555:
cad0702e5286d3 lishuo 2023-10-27  261  			case DRM_FORMAT_ABGR1555:
cad0702e5286d3 lishuo 2023-10-27  262  			case DRM_FORMAT_RGBA5551:
cad0702e5286d3 lishuo 2023-10-27  263  			case DRM_FORMAT_BGRA5551:
cad0702e5286d3 lishuo 2023-10-27  264  				phytium_plane->format = FRAMEBUFFER_FORMAT_ARGB1555;
cad0702e5286d3 lishuo 2023-10-27  265  				break;
cad0702e5286d3 lishuo 2023-10-27  266  
cad0702e5286d3 lishuo 2023-10-27  267  			case DRM_FORMAT_XRGB1555:
cad0702e5286d3 lishuo 2023-10-27  268  			case DRM_FORMAT_XBGR1555:
cad0702e5286d3 lishuo 2023-10-27  269  			case DRM_FORMAT_RGBX5551:
cad0702e5286d3 lishuo 2023-10-27  270  			case DRM_FORMAT_BGRX5551:
cad0702e5286d3 lishuo 2023-10-27  271  				phytium_plane->format = FRAMEBUFFER_FORMAT_XRGB1555;
cad0702e5286d3 lishuo 2023-10-27  272  				break;
cad0702e5286d3 lishuo 2023-10-27  273  
cad0702e5286d3 lishuo 2023-10-27  274  			case DRM_FORMAT_RGB565:
cad0702e5286d3 lishuo 2023-10-27  275  			case DRM_FORMAT_BGR565:
cad0702e5286d3 lishuo 2023-10-27  276  				phytium_plane->format = FRAMEBUFFER_FORMAT_RGB565;
cad0702e5286d3 lishuo 2023-10-27  277  				break;
cad0702e5286d3 lishuo 2023-10-27  278  
cad0702e5286d3 lishuo 2023-10-27  279  			case DRM_FORMAT_YUYV:
cad0702e5286d3 lishuo 2023-10-27  280  				phytium_plane->format = FRAMEBUFFER_FORMAT_YUYV;
cad0702e5286d3 lishuo 2023-10-27  281  				break;
cad0702e5286d3 lishuo 2023-10-27  282  
cad0702e5286d3 lishuo 2023-10-27  283  			case DRM_FORMAT_UYVY:
cad0702e5286d3 lishuo 2023-10-27  284  				phytium_plane->format = FRAMEBUFFER_FORMAT_UYVY;
cad0702e5286d3 lishuo 2023-10-27  285  				break;
cad0702e5286d3 lishuo 2023-10-27  286  			case DRM_FORMAT_NV16:
cad0702e5286d3 lishuo 2023-10-27  287  				phytium_plane->format = FRAMEBUFFER_FORMAT_NV16;
cad0702e5286d3 lishuo 2023-10-27  288  				break;
cad0702e5286d3 lishuo 2023-10-27  289  			case DRM_FORMAT_NV12:
cad0702e5286d3 lishuo 2023-10-27  290  				phytium_plane->format = FRAMEBUFFER_FORMAT_NV12;
cad0702e5286d3 lishuo 2023-10-27  291  				break;
cad0702e5286d3 lishuo 2023-10-27  292  			case DRM_FORMAT_NV21:
cad0702e5286d3 lishuo 2023-10-27  293  				phytium_plane->format = FRAMEBUFFER_FORMAT_NV12;
cad0702e5286d3 lishuo 2023-10-27  294  				break;
cad0702e5286d3 lishuo 2023-10-27  295  			default:
cad0702e5286d3 lishuo 2023-10-27  296  				DRM_ERROR("unsupported pixel format (format = %d)\n",
cad0702e5286d3 lishuo 2023-10-27  297  					  fb->format->format);
cad0702e5286d3 lishuo 2023-10-27  298  				return;
cad0702e5286d3 lishuo 2023-10-27  299  			}
cad0702e5286d3 lishuo 2023-10-27  300  
cad0702e5286d3 lishuo 2023-10-27  301  			switch (fb->format->format) {
cad0702e5286d3 lishuo 2023-10-27  302  			case DRM_FORMAT_ARGB2101010:
cad0702e5286d3 lishuo 2023-10-27  303  			case DRM_FORMAT_ARGB8888:
cad0702e5286d3 lishuo 2023-10-27  304  			case DRM_FORMAT_XRGB8888:
cad0702e5286d3 lishuo 2023-10-27  305  			case DRM_FORMAT_ARGB4444:
cad0702e5286d3 lishuo 2023-10-27  306  			case DRM_FORMAT_XRGB4444:
cad0702e5286d3 lishuo 2023-10-27  307  			case DRM_FORMAT_ARGB1555:
cad0702e5286d3 lishuo 2023-10-27  308  			case DRM_FORMAT_XRGB1555:
cad0702e5286d3 lishuo 2023-10-27  309  			case DRM_FORMAT_RGB565:
cad0702e5286d3 lishuo 2023-10-27  310  				phytium_plane->swizzle = FRAMEBUFFER_SWIZZLE_ARGB;
cad0702e5286d3 lishuo 2023-10-27  311  				phytium_plane->uv_swizzle = FRAMEBUFFER_UVSWIZZLE_DISABLE;
cad0702e5286d3 lishuo 2023-10-27  312  				break;
cad0702e5286d3 lishuo 2023-10-27  313  
cad0702e5286d3 lishuo 2023-10-27  314  			case DRM_FORMAT_ABGR2101010:
cad0702e5286d3 lishuo 2023-10-27  315  			case DRM_FORMAT_ABGR8888:
cad0702e5286d3 lishuo 2023-10-27  316  			case DRM_FORMAT_XBGR8888:
cad0702e5286d3 lishuo 2023-10-27  317  			case DRM_FORMAT_ABGR4444:
cad0702e5286d3 lishuo 2023-10-27  318  			case DRM_FORMAT_XBGR4444:
cad0702e5286d3 lishuo 2023-10-27  319  			case DRM_FORMAT_ABGR1555:
cad0702e5286d3 lishuo 2023-10-27  320  			case DRM_FORMAT_XBGR1555:
cad0702e5286d3 lishuo 2023-10-27  321  			case DRM_FORMAT_BGR565:
cad0702e5286d3 lishuo 2023-10-27  322  				phytium_plane->swizzle = FRAMEBUFFER_SWIZZLE_ABGR;
cad0702e5286d3 lishuo 2023-10-27  323  				phytium_plane->uv_swizzle = FRAMEBUFFER_UVSWIZZLE_DISABLE;
cad0702e5286d3 lishuo 2023-10-27  324  				break;
cad0702e5286d3 lishuo 2023-10-27  325  
cad0702e5286d3 lishuo 2023-10-27  326  			case DRM_FORMAT_RGBA1010102:
cad0702e5286d3 lishuo 2023-10-27  327  			case DRM_FORMAT_RGBA8888:
cad0702e5286d3 lishuo 2023-10-27  328  			case DRM_FORMAT_RGBX8888:
cad0702e5286d3 lishuo 2023-10-27  329  			case DRM_FORMAT_RGBA4444:
cad0702e5286d3 lishuo 2023-10-27  330  			case DRM_FORMAT_RGBX4444:
cad0702e5286d3 lishuo 2023-10-27  331  			case DRM_FORMAT_RGBA5551:
cad0702e5286d3 lishuo 2023-10-27  332  			case DRM_FORMAT_RGBX5551:
cad0702e5286d3 lishuo 2023-10-27  333  				phytium_plane->swizzle = FRAMEBUFFER_SWIZZLE_RGBA;
cad0702e5286d3 lishuo 2023-10-27  334  				phytium_plane->uv_swizzle = FRAMEBUFFER_UVSWIZZLE_DISABLE;
cad0702e5286d3 lishuo 2023-10-27  335  				break;
cad0702e5286d3 lishuo 2023-10-27  336  
cad0702e5286d3 lishuo 2023-10-27  337  			case DRM_FORMAT_BGRA1010102:
cad0702e5286d3 lishuo 2023-10-27  338  			case DRM_FORMAT_BGRA8888:
cad0702e5286d3 lishuo 2023-10-27  339  			case DRM_FORMAT_BGRX8888:
cad0702e5286d3 lishuo 2023-10-27  340  			case DRM_FORMAT_BGRA4444:
cad0702e5286d3 lishuo 2023-10-27  341  			case DRM_FORMAT_BGRX4444:
cad0702e5286d3 lishuo 2023-10-27  342  			case DRM_FORMAT_BGRA5551:
cad0702e5286d3 lishuo 2023-10-27  343  			case DRM_FORMAT_BGRX5551:
cad0702e5286d3 lishuo 2023-10-27  344  				phytium_plane->swizzle = FRAMEBUFFER_SWIZZLE_BGRA;
cad0702e5286d3 lishuo 2023-10-27  345  				phytium_plane->uv_swizzle = FRAMEBUFFER_UVSWIZZLE_DISABLE;
cad0702e5286d3 lishuo 2023-10-27  346  				break;
cad0702e5286d3 lishuo 2023-10-27  347  
cad0702e5286d3 lishuo 2023-10-27  348  			case DRM_FORMAT_YUYV:
cad0702e5286d3 lishuo 2023-10-27  349  			case DRM_FORMAT_UYVY:
cad0702e5286d3 lishuo 2023-10-27  350  			case DRM_FORMAT_NV16:
cad0702e5286d3 lishuo 2023-10-27  351  			case DRM_FORMAT_NV12:
cad0702e5286d3 lishuo 2023-10-27  352  				phytium_plane->swizzle = FRAMEBUFFER_SWIZZLE_ARGB;
cad0702e5286d3 lishuo 2023-10-27  353  				phytium_plane->uv_swizzle = FRAMEBUFFER_UVSWIZZLE_DISABLE;
cad0702e5286d3 lishuo 2023-10-27  354  				break;
cad0702e5286d3 lishuo 2023-10-27  355  
cad0702e5286d3 lishuo 2023-10-27  356  			default:
cad0702e5286d3 lishuo 2023-10-27  357  				DRM_ERROR("unsupported pixel format (format = %d)\n",
cad0702e5286d3 lishuo 2023-10-27  358  					   fb->format->format);
cad0702e5286d3 lishuo 2023-10-27  359  				return;
cad0702e5286d3 lishuo 2023-10-27  360  			}
cad0702e5286d3 lishuo 2023-10-27  361  		}
cad0702e5286d3 lishuo 2023-10-27  362  	}
cad0702e5286d3 lishuo 2023-10-27  363  }
cad0702e5286d3 lishuo 2023-10-27  364  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
