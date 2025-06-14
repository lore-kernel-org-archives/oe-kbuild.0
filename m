Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745FA1DE3A8
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749895947; cv=none; b=BuArt9GenN0ZvGrIvxJlynKjLhxP67VNql9ZCXJFkaynOC4utM8ODd1CxoOl9S5QCkcqlMe/1svH84yvnnObdMrGjz9+xWQfi8jksjEf3zQba9tiGPxd4R117zhGyAW6R0i8ysnh8lTO5Z3ks4D+IDSWPSrGjl0hDWJjGA7/cq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749895947; c=relaxed/simple;
	bh=QT3tesY9uGPRUUlaCICYbi5VH+0CQX7M35KBPElGjdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eeJKaiN4VkBWJhNIYCdw2PIPio+jO6uH8DwNhmAXOEcaQUtwRO9cWyqEiKBQjW/K3IaP1HweR7tGl5tomPQwJReJPc1u/cfVb9eimUPz+/Sezk10t10lfaYaUbQ+otbrJnAcLMj/YJOVJSbvdD1UtKjc3ZzLV74+yENhJGtogB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7atSejt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7atSejt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749895946; x=1781431946;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QT3tesY9uGPRUUlaCICYbi5VH+0CQX7M35KBPElGjdc=;
  b=a7atSejtCLfxMrwSL32tZ8F755UtnFmC6kive6U49Dt9+TsCx68yi4Rx
   +wEHhA7xVHUe2LeaR2zSez8yPJgN2q3KopFj1fYdl5LVKdXA9hx6DJGvh
   Q40B9D7FbArBxV0fGSB0OopgxlSavRfIVF3972NbOM7QQRoybllCLHlk5
   clAvYXf4zzbv/4ggo9xSScxvBMEzsEf8CBSrQ58iDsOQXbt72cI/XpOAu
   L4n+0dZda4NfFqznU49ak2A0bWfscEb/lvukAEmDsXVmYXf+BNSrXY9zy
   9maPdFlZ0otgbm4bGnVcJJVqnIkJjrXgM9sTeV5q7pDOheGeSj2D+xBKe
   Q==;
X-CSE-ConnectionGUID: 2I5LIi60RIKIiT9d4/Yv+Q==
X-CSE-MsgGUID: mYe5wYIrTESYUNIn9qQW7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55780904"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="55780904"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 03:12:25 -0700
X-CSE-ConnectionGUID: HafMCQ8vTO25bLfHygoE1w==
X-CSE-MsgGUID: gkQMD0eDQUG17O2tmpMO8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="147872474"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jun 2025 03:12:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQNs4-000DQs-2z;
	Sat, 14 Jun 2025 10:12:20 +0000
Date: Sat, 14 Jun 2025 18:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/3] drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict()
 using the guarded LRU iteration
Message-ID: <202506141727.FtEuY8xN-lkp@intel.com>
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
In-Reply-To: <20250613151824.178650-4-thomas.hellstrom@linux.intel.com>
References: <20250613151824.178650-4-thomas.hellstrom@linux.intel.com>
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
TO: intel-xe@lists.freedesktop.org
CC: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: dri-devel@lists.freedesktop.org
CC: airlied@gmail.com
CC: Matthew Brost <matthew.brost@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>
CC: "Christian König" <christian.koenig@amd.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Use-a-struct-for-the-common-part-of-struct-ttm_lru_walk-and-struct-ttm_bo_lru_cursor/20250613-232106
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250613151824.178650-4-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 3/3] drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict() using the guarded LRU iteration
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141727.FtEuY8xN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506141727.FtEuY8xN-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_bo_util.c:975 __ttm_bo_lru_cursor_next() error: uninitialized symbol 'ret'.

vim +/ret +975 drivers/gpu/drm/ttm/ttm_bo_util.c

f3bcfd04a52fb1 Thomas Hellström 2025-03-05  926  
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  927  static struct ttm_buffer_object *
a9654c8f32d9f4 Thomas Hellström 2025-06-13  928  __ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs, bool first)
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  929  {
a9654c8f32d9f4 Thomas Hellström 2025-06-13  930  	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  931  	struct ttm_resource *res = NULL;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  932  	struct ttm_buffer_object *bo;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  933  	struct ttm_lru_walk_arg *arg = curs->arg;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  934  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  935  	ttm_bo_lru_cursor_cleanup_bo(curs);
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  936  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  937  	spin_lock(lru_lock);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  938  	for (;;) {
a9654c8f32d9f4 Thomas Hellström 2025-06-13  939  		int mem_type, ret;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  940  		bool bo_locked = false;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  941  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  942  		if (first) {
a9654c8f32d9f4 Thomas Hellström 2025-06-13  943  			res = ttm_resource_manager_first(&curs->res_curs);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  944  			first = false;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  945  		} else {
a9654c8f32d9f4 Thomas Hellström 2025-06-13  946  			res = ttm_resource_manager_next(&curs->res_curs);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  947  		}
a9654c8f32d9f4 Thomas Hellström 2025-06-13  948  		if (!res)
a9654c8f32d9f4 Thomas Hellström 2025-06-13  949  			break;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  950  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  951  		bo = res->bo;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  952  		if (ttm_lru_walk_trylock(arg, bo, &curs->needs_unlock))
a9654c8f32d9f4 Thomas Hellström 2025-06-13  953  			bo_locked = true;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  954  		else if (!arg->ticket || arg->ctx->no_wait_gpu || arg->trylock_only)
a9654c8f32d9f4 Thomas Hellström 2025-06-13  955  			continue;
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  956  
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  957  		if (!ttm_bo_get_unless_zero(bo)) {
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  958  			if (curs->needs_unlock)
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  959  				dma_resv_unlock(bo->base.resv);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  960  			continue;
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  961  		}
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  962  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  963  		mem_type = res->mem_type;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  964  		spin_unlock(lru_lock);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  965  		if (!bo_locked)
a9654c8f32d9f4 Thomas Hellström 2025-06-13  966  			ret = ttm_lru_walk_ticketlock(arg, bo, &curs->needs_unlock);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  967  		/*
a9654c8f32d9f4 Thomas Hellström 2025-06-13  968  		 * Note that in between the release of the lru lock and the
a9654c8f32d9f4 Thomas Hellström 2025-06-13  969  		 * ticketlock, the bo may have switched resource,
a9654c8f32d9f4 Thomas Hellström 2025-06-13  970  		 * and also memory type, since the resource may have been
a9654c8f32d9f4 Thomas Hellström 2025-06-13  971  		 * freed and allocated again with a different memory type.
a9654c8f32d9f4 Thomas Hellström 2025-06-13  972  		 * In that case, just skip it.
a9654c8f32d9f4 Thomas Hellström 2025-06-13  973  		 */
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  974  		curs->bo = bo;
a9654c8f32d9f4 Thomas Hellström 2025-06-13 @975  		if (!ret && bo->resource && bo->resource->mem_type == mem_type)
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  976  			return bo;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  977  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  978  		ttm_bo_lru_cursor_cleanup_bo(curs);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  979  		if (ret)
a9654c8f32d9f4 Thomas Hellström 2025-06-13  980  			return ERR_PTR(ret);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  981  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  982  		spin_lock(lru_lock);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  983  	}
a9654c8f32d9f4 Thomas Hellström 2025-06-13  984  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  985  	spin_unlock(lru_lock);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  986  	return res ? bo : NULL;
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  987  }
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  988  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
