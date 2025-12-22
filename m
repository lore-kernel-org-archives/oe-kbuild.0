Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A333B6E6
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 23:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766446679; cv=none; b=gurPUkdjIdxz0TWZsUiikkA85cDKYdSpIuvNQ7vcnFLUtpKkZ+lOvi4wY3Lq/FW9TlO/8VYB0/cKwTRnHEhZCS/gpwXyok4cgIADxxIigLrkwMhgh/QQOXXFFuvrxXcIG+EuPQHgt14fqXnXEcbNG9wy+GtUyTA1UHffTc0pLJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766446679; c=relaxed/simple;
	bh=rQKaoIUdYAOyOnF0jyFHGO76npvt99dUtAoNUoTTlbo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pl7FPXT7+6yInk9FWNHzO2tc1eHl4szc5UyebXmKmfHgXY7yLMRX99P1tT6IclX5xTp81HGROvDE3F4r3zuvdMl5Z4SIsbbWQREm4o84ZrzJjI0/L9+64ZGz+5aXbiFTJXrPiag+vs9ix+pclV2yTBg+u7jAK4rPW54ZRAiomVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBddBgsV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBddBgsV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766446677; x=1797982677;
  h=date:from:to:cc:subject:message-id;
  bh=rQKaoIUdYAOyOnF0jyFHGO76npvt99dUtAoNUoTTlbo=;
  b=NBddBgsVJ5vwO+ELe1ry+aLm0edEedRR3jv2MwwZY58vxx4PKX81oy56
   rpTEw42yIOebhwBWFo64M6in/QfYcA1fHtx0ra+8dMuFszhHJbqLhs7eC
   ftQW3SEJClJXAfnY/bfd5Gh2Wa7f68YtGTMz7cWr2xF70DqKFuEq4BwrB
   8vYjEOPmt5jqHJNPHTySZ5pscxIa0oNcKbBsfUJTMvIDyIN3klYoGk0dD
   1cCVkrGRjQED66PlA7UMl3/lrUjpCsMVOv8TKcBk6M+Z/VQS6xbrxjhEM
   qCY+u+H9WW2FqqYJWPqI/eBX3GtLNmbQn566vcKhpXAGYEEAjj0GhrAKU
   A==;
X-CSE-ConnectionGUID: Z3C8QGiMTXeN55rMEyqiXA==
X-CSE-MsgGUID: TLcSP3F7TPOdmv31yawgIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68285651"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68285651"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:37:45 -0800
X-CSE-ConnectionGUID: y9HA/256QNK+dp+DLt+PDQ==
X-CSE-MsgGUID: UIZWzhr7TxC+W+A38ZUVAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199946008"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2025 15:37:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXpTC-000000001EB-0beD;
	Mon, 22 Dec 2025 23:37:42 +0000
Date: Tue, 23 Dec 2025 07:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c:270
 vmw_cursor_mob_get() error: we previously assumed 'vps->cursor.mob' could be
 null (see line 241)
Message-ID: <202512230757.DjcJntFX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Zack Rusin <zack.rusin@broadcom.com>
CC: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
CC: Martin Krastev <martin.krastev@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: 965544150d1cadf0e8f5bb6c13c19697e46e1429 drm/vmwgfx: Refactor cursor handling
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r071-20251214 (https://download.01.org/0day-ci/archive/20251223/202512230757.DjcJntFX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512230757.DjcJntFX-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c:270 vmw_cursor_mob_get() error: we previously assumed 'vps->cursor.mob' could be null (see line 241)

vim +270 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c

965544150d1cad Zack Rusin 2025-03-07  218  
965544150d1cad Zack Rusin 2025-03-07  219  static int vmw_cursor_mob_get(struct vmw_cursor_plane *vcp,
965544150d1cad Zack Rusin 2025-03-07  220  			      struct vmw_plane_state *vps)
965544150d1cad Zack Rusin 2025-03-07  221  {
965544150d1cad Zack Rusin 2025-03-07  222  	struct vmw_private *dev_priv = vmw_priv(vcp->base.dev);
965544150d1cad Zack Rusin 2025-03-07  223  	u32 size = vmw_cursor_mob_size(vps->cursor.update_type,
965544150d1cad Zack Rusin 2025-03-07  224  				       vps->base.crtc_w, vps->base.crtc_h);
965544150d1cad Zack Rusin 2025-03-07  225  	u32 i;
965544150d1cad Zack Rusin 2025-03-07  226  	u32 cursor_max_dim, mob_max_size;
965544150d1cad Zack Rusin 2025-03-07  227  	struct vmw_fence_obj *fence = NULL;
965544150d1cad Zack Rusin 2025-03-07  228  	int ret;
965544150d1cad Zack Rusin 2025-03-07  229  
965544150d1cad Zack Rusin 2025-03-07  230  	if (!dev_priv->has_mob ||
965544150d1cad Zack Rusin 2025-03-07  231  	    (dev_priv->capabilities2 & SVGA_CAP2_CURSOR_MOB) == 0)
965544150d1cad Zack Rusin 2025-03-07  232  		return -EINVAL;
965544150d1cad Zack Rusin 2025-03-07  233  
965544150d1cad Zack Rusin 2025-03-07  234  	mob_max_size = vmw_read(dev_priv, SVGA_REG_MOB_MAX_SIZE);
965544150d1cad Zack Rusin 2025-03-07  235  	cursor_max_dim = vmw_read(dev_priv, SVGA_REG_CURSOR_MAX_DIMENSION);
965544150d1cad Zack Rusin 2025-03-07  236  
965544150d1cad Zack Rusin 2025-03-07  237  	if (size > mob_max_size || vps->base.crtc_w > cursor_max_dim ||
965544150d1cad Zack Rusin 2025-03-07  238  	    vps->base.crtc_h > cursor_max_dim)
965544150d1cad Zack Rusin 2025-03-07  239  		return -EINVAL;
965544150d1cad Zack Rusin 2025-03-07  240  
965544150d1cad Zack Rusin 2025-03-07 @241  	if (vps->cursor.mob) {
965544150d1cad Zack Rusin 2025-03-07  242  		if (vps->cursor.mob->tbo.base.size >= size)
965544150d1cad Zack Rusin 2025-03-07  243  			return 0;
965544150d1cad Zack Rusin 2025-03-07  244  		vmw_cursor_mob_put(vcp, vps);
965544150d1cad Zack Rusin 2025-03-07  245  	}
965544150d1cad Zack Rusin 2025-03-07  246  
965544150d1cad Zack Rusin 2025-03-07  247  	/* Look for an unused mob in the cache. */
965544150d1cad Zack Rusin 2025-03-07  248  	for (i = 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
965544150d1cad Zack Rusin 2025-03-07  249  		if (vcp->cursor_mobs[i] &&
965544150d1cad Zack Rusin 2025-03-07  250  		    vcp->cursor_mobs[i]->tbo.base.size >= size) {
965544150d1cad Zack Rusin 2025-03-07  251  			vps->cursor.mob = vcp->cursor_mobs[i];
965544150d1cad Zack Rusin 2025-03-07  252  			vcp->cursor_mobs[i] = NULL;
965544150d1cad Zack Rusin 2025-03-07  253  			return 0;
965544150d1cad Zack Rusin 2025-03-07  254  		}
965544150d1cad Zack Rusin 2025-03-07  255  	}
965544150d1cad Zack Rusin 2025-03-07  256  	/* Create a new mob if we can't find an existing one. */
965544150d1cad Zack Rusin 2025-03-07  257  	ret = vmw_bo_create_and_populate(dev_priv, size, VMW_BO_DOMAIN_MOB,
965544150d1cad Zack Rusin 2025-03-07  258  					 &vps->cursor.mob);
965544150d1cad Zack Rusin 2025-03-07  259  
965544150d1cad Zack Rusin 2025-03-07  260  	if (ret != 0)
965544150d1cad Zack Rusin 2025-03-07  261  		return ret;
965544150d1cad Zack Rusin 2025-03-07  262  
965544150d1cad Zack Rusin 2025-03-07  263  	/* Fence the mob creation so we are guarateed to have the mob */
965544150d1cad Zack Rusin 2025-03-07  264  	ret = ttm_bo_reserve(&vps->cursor.mob->tbo, false, false, NULL);
965544150d1cad Zack Rusin 2025-03-07  265  	if (ret != 0)
965544150d1cad Zack Rusin 2025-03-07  266  		goto teardown;
965544150d1cad Zack Rusin 2025-03-07  267  
965544150d1cad Zack Rusin 2025-03-07  268  	ret = vmw_execbuf_fence_commands(NULL, dev_priv, &fence, NULL);
965544150d1cad Zack Rusin 2025-03-07  269  	if (ret != 0) {
965544150d1cad Zack Rusin 2025-03-07 @270  		ttm_bo_unreserve(&vps->cursor.mob->tbo);
965544150d1cad Zack Rusin 2025-03-07  271  		goto teardown;
965544150d1cad Zack Rusin 2025-03-07  272  	}
965544150d1cad Zack Rusin 2025-03-07  273  
965544150d1cad Zack Rusin 2025-03-07  274  	dma_fence_wait(&fence->base, false);
965544150d1cad Zack Rusin 2025-03-07  275  	dma_fence_put(&fence->base);
965544150d1cad Zack Rusin 2025-03-07  276  
965544150d1cad Zack Rusin 2025-03-07  277  	ttm_bo_unreserve(&vps->cursor.mob->tbo);
965544150d1cad Zack Rusin 2025-03-07  278  
965544150d1cad Zack Rusin 2025-03-07  279  	return 0;
965544150d1cad Zack Rusin 2025-03-07  280  
965544150d1cad Zack Rusin 2025-03-07  281  teardown:
965544150d1cad Zack Rusin 2025-03-07  282  	vmw_cursor_mob_destroy(&vps->cursor.mob);
965544150d1cad Zack Rusin 2025-03-07  283  	return ret;
965544150d1cad Zack Rusin 2025-03-07  284  }
965544150d1cad Zack Rusin 2025-03-07  285  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
