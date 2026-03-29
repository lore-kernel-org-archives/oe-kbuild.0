Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3254226B2CE
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 05:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774763976; cv=none; b=Ujv/bgXYfnNNEsG/mxaSszhA9bX1CUmLy3G9agexDUjxsHOXEpdOvITasAfRckYIEX3qAMKHS9R6V+3cEM1zuPLMsFz5geIv194lYWitftfJABVWlKz+Z/96RbslDNOmHh9NDmfdNDl83Q1FlVDJFO7XoP4Li3WlIn6i82cEA48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774763976; c=relaxed/simple;
	bh=3A2LJJUI8RjbcYDmMdYSX6XbsUDDcdccnzQQlpDoKkA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N8a8YvWQ3uPlR2xyaVZQGkcu33n7R4/I1Q2kMpcOOw03gDHKkDlMluhN8R8SBrHHfQC31xcdxfKDJARtfIooNuZMKE60rszVVTCCInlWrJi9qdZNj6SDfU3frW7KHt58XkkuyAXAWzraX2fVDUrAovTc2PP54Hec2Vr+4nrCCPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxHGWq/o; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxHGWq/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774763973; x=1806299973;
  h=date:from:to:cc:subject:message-id;
  bh=3A2LJJUI8RjbcYDmMdYSX6XbsUDDcdccnzQQlpDoKkA=;
  b=YxHGWq/oejLUS9hLwcmyDrSiSkDHt7B4nJoAY0heZ7xYaucWE9EWY4SV
   Or3YQX8e1rC4RycMJ4M4Qs+UUa5qOf4Q0nPjgt50tOVDMnYJ2xJNg7RZG
   BtE68WVfTpSFMD90wlLu0IbwR+CaQImoAMFcgv4DUxSWStpgT8rdMMu9e
   j9DOUp0IQOQB3OssucPualqSKFuRmOddc87a4OPwyy9VovF5W4ysNSqAX
   gXHJpF+i7wxaIPN+9NCicLyrPQgsFcwfUZrFxVnU6/H013Er77Ozo4aF5
   LHihuRI0LQtKRliXM+Uf6feZ1MGBgcGzUmst0yR24e90dJ9G4iEbsOX5E
   Q==;
X-CSE-ConnectionGUID: QjlTkQ1oTmCIQl0g4OL+Pw==
X-CSE-MsgGUID: QHK9wEQTTGqmicsEIsN4hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79689764"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="79689764"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 22:59:32 -0700
X-CSE-ConnectionGUID: mz6kXCeEQi6nJNfWCZ0taw==
X-CSE-MsgGUID: yOnuh4gwSXuvW91pHTvFJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="220862321"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Mar 2026 22:59:31 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6jBI-00000000C85-3dOV;
	Sun, 29 Mar 2026 05:59:28 +0000
Date: Sun, 29 Mar 2026 13:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c:270
 vmw_cursor_mob_get() error: we previously assumed 'vps->cursor.mob' could be
 null (see line 241)
Message-ID: <202603291323.ZnGQVR4j-lkp@intel.com>
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
head:   cbfffcca2bf0622b601b7eaf477aa29035169184
commit: 965544150d1cadf0e8f5bb6c13c19697e46e1429 drm/vmwgfx: Refactor cursor handling
date:   1 year, 1 month ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20260329 (https://download.01.org/0day-ci/archive/20260329/202603291323.ZnGQVR4j-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603291323.ZnGQVR4j-lkp@intel.com/

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
