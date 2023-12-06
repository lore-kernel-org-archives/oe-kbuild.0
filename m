Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1F5D2FE
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 03:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L27UcxTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701834755; x=1733370755;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=y/PzskDGADpwuEVx/Y/cRYpbMJUeJULb2yjQIuFxg/U=;
  b=L27UcxTb9S9Caqha7+LcTVdJw5HQQTnDvnqdiW9ueJYZtCPu2cqa/Cqa
   Wq/Sl1rnDuXwtmLJiXg6L6vSW4lac0D0oehp+M2LngupuW34B/m0P/aI3
   7T6iyUCgDb7MeOxz86QhYI70oFMvR5WmQ5tqcDDim8Xy+n5zJAI6DJ0Z0
   CBSlEhH4Kgvem84hXsgrOEdo8C/862xwlMuph6YoZpvXPkANbxAcEIGZO
   KMqJ3GlpRG1b5elrmj/5fpxMSahkqQdbkJcYJJyqEw1OlQEUkGajYQysU
   lIZ7y1Kt0SYmHwhV42VFWIdKeYmYrIu757gmPTMmKm0Ecc+vmoUnBJlY7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1060979"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1060979"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 19:52:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="764565742"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="764565742"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 05 Dec 2023 19:52:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAixa-000ADF-0F;
	Wed, 06 Dec 2023 03:52:30 +0000
Date: Wed, 6 Dec 2023 11:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3766/4884]
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c:111 intel_fbdev_fb_fill_info()
 error: uninitialized symbol 'vaddr'.
Message-ID: <202312061126.zeFuqvVC-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Jouni Högander" <jouni.hogander@intel.com>
CC: Vinod Govindapillai <vinod.govindapillai@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: 80d20fd99124800749d605c733911a8d9da78e2b [3766/4884] drm/i915/display: split i915 specific code from intel_fbdev
:::::: branch date: 25 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20231206 (https://download.01.org/0day-ci/archive/20231206/202312061126.zeFuqvVC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061126.zeFuqvVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312061126.zeFuqvVC-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_fbdev_fb.c:111 intel_fbdev_fb_fill_info() error: uninitialized symbol 'vaddr'.

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_object.h:183 __i915_gem_object_lock() error: we previously assumed 'ww' could be null (see line 172)

vim +/vaddr +111 drivers/gpu/drm/i915/display/intel_fbdev_fb.c

80d20fd9912480 Jouni Högander 2023-11-15   68  
80d20fd9912480 Jouni Högander 2023-11-15   69  int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
80d20fd9912480 Jouni Högander 2023-11-15   70  			     struct drm_i915_gem_object *obj, struct i915_vma *vma)
80d20fd9912480 Jouni Högander 2023-11-15   71  {
80d20fd9912480 Jouni Högander 2023-11-15   72  	struct i915_gem_ww_ctx ww;
80d20fd9912480 Jouni Högander 2023-11-15   73  	void __iomem *vaddr;
80d20fd9912480 Jouni Högander 2023-11-15   74  	int ret;
80d20fd9912480 Jouni Högander 2023-11-15   75  
80d20fd9912480 Jouni Högander 2023-11-15   76  	if (i915_gem_object_is_lmem(obj)) {
80d20fd9912480 Jouni Högander 2023-11-15   77  		struct intel_memory_region *mem = obj->mm.region;
80d20fd9912480 Jouni Högander 2023-11-15   78  
80d20fd9912480 Jouni Högander 2023-11-15   79  		/* Use fbdev's framebuffer from lmem for discrete */
80d20fd9912480 Jouni Högander 2023-11-15   80  		info->fix.smem_start =
80d20fd9912480 Jouni Högander 2023-11-15   81  			(unsigned long)(mem->io_start +
80d20fd9912480 Jouni Högander 2023-11-15   82  					i915_gem_object_get_dma_address(obj, 0));
80d20fd9912480 Jouni Högander 2023-11-15   83  		info->fix.smem_len = obj->base.size;
80d20fd9912480 Jouni Högander 2023-11-15   84  	} else {
80d20fd9912480 Jouni Högander 2023-11-15   85  		struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
80d20fd9912480 Jouni Högander 2023-11-15   86  
80d20fd9912480 Jouni Högander 2023-11-15   87  		/* Our framebuffer is the entirety of fbdev's system memory */
80d20fd9912480 Jouni Högander 2023-11-15   88  		info->fix.smem_start =
80d20fd9912480 Jouni Högander 2023-11-15   89  			(unsigned long)(ggtt->gmadr.start + i915_ggtt_offset(vma));
80d20fd9912480 Jouni Högander 2023-11-15   90  		info->fix.smem_len = vma->size;
80d20fd9912480 Jouni Högander 2023-11-15   91  	}
80d20fd9912480 Jouni Högander 2023-11-15   92  
80d20fd9912480 Jouni Högander 2023-11-15   93  	for_i915_gem_ww(&ww, ret, false) {
80d20fd9912480 Jouni Högander 2023-11-15   94  		ret = i915_gem_object_lock(vma->obj, &ww);
80d20fd9912480 Jouni Högander 2023-11-15   95  
80d20fd9912480 Jouni Högander 2023-11-15   96  		if (ret)
80d20fd9912480 Jouni Högander 2023-11-15   97  			continue;
80d20fd9912480 Jouni Högander 2023-11-15   98  
80d20fd9912480 Jouni Högander 2023-11-15   99  		vaddr = i915_vma_pin_iomap(vma);
80d20fd9912480 Jouni Högander 2023-11-15  100  		if (IS_ERR(vaddr)) {
80d20fd9912480 Jouni Högander 2023-11-15  101  			drm_err(&i915->drm,
80d20fd9912480 Jouni Högander 2023-11-15  102  				"Failed to remap framebuffer into virtual memory (%pe)\n", vaddr);
80d20fd9912480 Jouni Högander 2023-11-15  103  			ret = PTR_ERR(vaddr);
80d20fd9912480 Jouni Högander 2023-11-15  104  			continue;
80d20fd9912480 Jouni Högander 2023-11-15  105  		}
80d20fd9912480 Jouni Högander 2023-11-15  106  	}
80d20fd9912480 Jouni Högander 2023-11-15  107  
80d20fd9912480 Jouni Högander 2023-11-15  108  	if (ret)
80d20fd9912480 Jouni Högander 2023-11-15  109  		return ret;
80d20fd9912480 Jouni Högander 2023-11-15  110  
80d20fd9912480 Jouni Högander 2023-11-15 @111  	info->screen_base = vaddr;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
