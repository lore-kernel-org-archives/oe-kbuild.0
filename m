Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACCC328269
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Nov 2025 02:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763434344; cv=none; b=YfkkFVqYLS1TRTXP87kVZw+qfJ3+GBBRbQhyYekgOJLsCBuTGwsCfXSZuipnT6ZAQP2uMvEs7d8XkiwuMPLHaqdesBi6MVi54c96eBjGp1Man84rKoDLVWRbJmeEPP5FKjvU3QtW/OBZrJ4UaKZTVOxx9HbQsmZ0FMMrXuhGJSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763434344; c=relaxed/simple;
	bh=PxxG7KAPQ7ZcfbXHOZ36yM5xCgWsjcPtSKSXCo3gAUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JjQ6h2+dYv4uQnygaN6r7m3/1+YK/XYt6sDrdYnEkJRFYFCIYYCPn0EW11F3GQL23pG8RxyNVZv64mg1Hqg6J3/+a2zs3wp60XU7UKN3LR1WVczBqkVjiIgxmvNPU3OCJEbSZvAT1MlFNF1NQsc7t5MpX4JOzC0jAuSoxwfV/2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHKRYFZs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHKRYFZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763434343; x=1794970343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PxxG7KAPQ7ZcfbXHOZ36yM5xCgWsjcPtSKSXCo3gAUg=;
  b=DHKRYFZssdYm15rwtcgq8BHBk0DSor1WSpSOVl8gQOPuLHMNUrW3MxzW
   A5T8J/4RafTEr4NZyliTTVjAUobHz4Ek+ha/Fb83L3aSki7mSlp+M4Two
   HZfzTL6w2hF1WACxdnmPFPqEhgYZiq8Ky1NGtpa46n3PqcVDMCr7GCIcB
   chWklX8AC9haxtNlNvXKXUwdavzrJGIV27WfMkOqFDnkbfGIsV+Vp1ED0
   Gj4xJGGjuKnLbj8hcdB+Cr0b/IJUdBc4h4SFy0IIGImT7gSWyXkGuSJ1z
   MpTwPquzluzQ45A0I74jrBKGUu2eEXgVx/joGrcEyJn5QHWyea4GhLNWQ
   g==;
X-CSE-ConnectionGUID: eLiRzgYxR6yKzM8OK9ETdQ==
X-CSE-MsgGUID: Ues+JGh8Tdug78banpCwWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69299521"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="69299521"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 18:52:22 -0800
X-CSE-ConnectionGUID: gTyeu9k4Tf6ZCE6a6Hw9Ow==
X-CSE-MsgGUID: JWbuhgqgQDWzo5zFe7CQig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="189918761"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2025 18:52:22 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLBpK-0001Ga-30;
	Tue, 18 Nov 2025 02:52:18 +0000
Date: Tue, 18 Nov 2025 10:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/msm/msm_iommu.c:341:16-17: WARNING kvmalloc is used
 to allocate this memory at line 335
Message-ID: <202511181058.kGAA7N2y-lkp@intel.com>
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
TO: Rob Clark <robin.clark@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7c375b181600caf135cfd03eadbc45eb530f2cb
commit: 830d68f2cb8ab6fb798bb9555016709a9e012af0 drm/msm: Fix pgtable prealloc error path
date:   5 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: um-randconfig-r053-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181058.kGAA7N2y-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511181058.kGAA7N2y-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/msm_iommu.c:341:16-17: WARNING kvmalloc is used to allocate this memory at line 335

vim +341 drivers/gpu/drm/msm/msm_iommu.c

e601ea31d66ba8 Rob Clark 2025-06-29  328  
e601ea31d66ba8 Rob Clark 2025-06-29  329  static int
e601ea31d66ba8 Rob Clark 2025-06-29  330  msm_iommu_pagetable_prealloc_allocate(struct msm_mmu *mmu, struct msm_mmu_prealloc *p)
e601ea31d66ba8 Rob Clark 2025-06-29  331  {
e601ea31d66ba8 Rob Clark 2025-06-29  332  	struct kmem_cache *pt_cache = get_pt_cache(mmu);
e601ea31d66ba8 Rob Clark 2025-06-29  333  	int ret;
e601ea31d66ba8 Rob Clark 2025-06-29  334  
e601ea31d66ba8 Rob Clark 2025-06-29 @335  	p->pages = kvmalloc_array(p->count, sizeof(p->pages), GFP_KERNEL);
e601ea31d66ba8 Rob Clark 2025-06-29  336  	if (!p->pages)
e601ea31d66ba8 Rob Clark 2025-06-29  337  		return -ENOMEM;
e601ea31d66ba8 Rob Clark 2025-06-29  338  
e601ea31d66ba8 Rob Clark 2025-06-29  339  	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, p->count, p->pages);
e601ea31d66ba8 Rob Clark 2025-06-29  340  	if (ret != p->count) {
830d68f2cb8ab6 Rob Clark 2025-10-06 @341  		kfree(p->pages);
830d68f2cb8ab6 Rob Clark 2025-10-06  342  		p->pages = NULL;
e601ea31d66ba8 Rob Clark 2025-06-29  343  		p->count = ret;
e601ea31d66ba8 Rob Clark 2025-06-29  344  		return -ENOMEM;
e601ea31d66ba8 Rob Clark 2025-06-29  345  	}
e601ea31d66ba8 Rob Clark 2025-06-29  346  
e601ea31d66ba8 Rob Clark 2025-06-29  347  	return 0;
e601ea31d66ba8 Rob Clark 2025-06-29  348  }
e601ea31d66ba8 Rob Clark 2025-06-29  349  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
