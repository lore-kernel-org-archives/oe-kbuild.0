Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7098D16F824
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 10:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270816; cv=none; b=YZ+KcpfuLvsU+GMsfnihbrDihglZh9cLZR7xIMTmKv+q4TykPE908W5462K44NHuYldWszDLp6Vx78mWe6a/OvlSz5lStjbgPQNa28/jxU2VMDcsC6LgXc8uOobhLVtYzNPbmUM7HDW9LXk0BwOtO14NnOXOxzHxHtgldHIi7t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270816; c=relaxed/simple;
	bh=Fgd425EW2gU0BmZBsdEo9t67i/7cD/FmKQDWH5Wxef8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j8zo9JRw6CQYKnFZUXp9uhE+f7UXgHJSHhgnKTxOL8hqu9QAvW9FQLUcclo5aTg5p0aFziW3ovEBLZIu5Whko0GDLa19sV4mERkqnfOH1AAEPuIGvmB0dh8yzjHsPprTb1YIgkWa/dqC2vJnAHROSRpUgvYa1ayVEp94Isymwuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9382Xs+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9382Xs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732270815; x=1763806815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fgd425EW2gU0BmZBsdEo9t67i/7cD/FmKQDWH5Wxef8=;
  b=i9382Xs+t1pk7YANEkLVs804wsvu3iXC1xIM5mwsSblyR7lMz5Ajubio
   gn+Kuyy1EQk6Iy0V1kUf4UMZpBYjChV+jD8G4z93zhWzybT9hLzc6GHd6
   GNf5yPdFPj1RUDmMErL1SGdeilC3/NWm67hCuYC8TdAX6VKShttgt3CG3
   DBP6f1pxswiLTjIkgibBP206WaX+KUrB/7zZp202bjoY0CsjpUGNEvakn
   yVOV6p/uTLRxIBbXqnZBMQodKpwmxmwvJ5ie9ZaIyZZJIKiA5N8rBQwsh
   wFbohC2heg5oDbLWD+iWpyvEADZ3O+HJdXI2L5+HkZSXv7Kcu0itk9aem
   A==;
X-CSE-ConnectionGUID: ILTL5jwOTYmSXiRHRjLDYA==
X-CSE-MsgGUID: wcX4JxFfRGeScjt7+kbb5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="35280463"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="35280463"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:20:14 -0800
X-CSE-ConnectionGUID: +QMioIXMTcqc+DzQX1gkiQ==
X-CSE-MsgGUID: 1qBzuoj9QACHTPFw+Lkkag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90680580"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2024 02:20:13 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEQlm-0003pZ-0w;
	Fri, 22 Nov 2024 10:20:10 +0000
Date: Fri, 22 Nov 2024 18:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH 27/29] drm/xe: Teach xe_sync layer about
 drm_xe_semaphore
Message-ID: <202411221644.U9ddWy9K-lkp@intel.com>
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
In-Reply-To: <20241118233757.2374041-28-matthew.brost@intel.com>
References: <20241118233757.2374041-28-matthew.brost@intel.com>
TO: Matthew Brost <matthew.brost@intel.com>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20241121]
[cannot apply to drm-exynos/exynos-drm-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/dma-fence-Add-dma_fence_preempt-base-class/20241121-124856
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241118233757.2374041-28-matthew.brost%40intel.com
patch subject: [RFC PATCH 27/29] drm/xe: Teach xe_sync layer about drm_xe_semaphore
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-161-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221644.U9ddWy9K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411221644.U9ddWy9K-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_sync.c:275 xe_sync_semaphore_parse() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +275 drivers/gpu/drm/xe/xe_sync.c

dd08ebf6c3525a Matthew Brost 2023-03-30  218  
0f3343471ed4df Matthew Brost 2024-11-18  219  int xe_sync_semaphore_parse(struct xe_device *xe, struct xe_file *xef,
0f3343471ed4df Matthew Brost 2024-11-18  220  			    struct xe_sync_entry *sync,
0f3343471ed4df Matthew Brost 2024-11-18  221  			    struct drm_xe_semaphore __user *semaphore_user,
0f3343471ed4df Matthew Brost 2024-11-18  222  			    unsigned int flags)
0f3343471ed4df Matthew Brost 2024-11-18  223  {
0f3343471ed4df Matthew Brost 2024-11-18  224  	struct drm_xe_semaphore semaphore_in;
0f3343471ed4df Matthew Brost 2024-11-18  225  	struct drm_gem_object *gem_obj;
0f3343471ed4df Matthew Brost 2024-11-18  226  	struct xe_bo *bo;
0f3343471ed4df Matthew Brost 2024-11-18  227  
0f3343471ed4df Matthew Brost 2024-11-18  228  	if (copy_from_user(&semaphore_in, semaphore_user,
0f3343471ed4df Matthew Brost 2024-11-18  229  			   sizeof(*semaphore_user)))
0f3343471ed4df Matthew Brost 2024-11-18  230  		return -EFAULT;
0f3343471ed4df Matthew Brost 2024-11-18  231  
0f3343471ed4df Matthew Brost 2024-11-18  232  	if (XE_IOCTL_DBG(xe, semaphore_in.offset & 0x7 ||
0f3343471ed4df Matthew Brost 2024-11-18  233  			 !semaphore_in.handle || semaphore_in.token ||
0f3343471ed4df Matthew Brost 2024-11-18  234  			 semaphore_in.reserved[0] || semaphore_in.reserved[1]))
0f3343471ed4df Matthew Brost 2024-11-18  235  		return -EINVAL;
0f3343471ed4df Matthew Brost 2024-11-18  236  
0f3343471ed4df Matthew Brost 2024-11-18  237  	gem_obj = drm_gem_object_lookup(xef->drm, semaphore_in.handle);
0f3343471ed4df Matthew Brost 2024-11-18  238  	if (XE_IOCTL_DBG(xe, !gem_obj))
0f3343471ed4df Matthew Brost 2024-11-18  239  		return -ENOENT;
0f3343471ed4df Matthew Brost 2024-11-18  240  
0f3343471ed4df Matthew Brost 2024-11-18  241  	bo = gem_to_xe_bo(gem_obj);
0f3343471ed4df Matthew Brost 2024-11-18  242  
0f3343471ed4df Matthew Brost 2024-11-18  243  	if (XE_IOCTL_DBG(xe, bo->size < semaphore_in.offset)) {
0f3343471ed4df Matthew Brost 2024-11-18  244  		xe_bo_put(bo);
0f3343471ed4df Matthew Brost 2024-11-18  245  		return -EINVAL;
0f3343471ed4df Matthew Brost 2024-11-18  246  	}
0f3343471ed4df Matthew Brost 2024-11-18  247  
0f3343471ed4df Matthew Brost 2024-11-18  248  	if (flags & DRM_XE_SYNC_FLAG_SIGNAL) {
0f3343471ed4df Matthew Brost 2024-11-18  249  		struct iosys_map vmap = sync->bo->vmap;
0f3343471ed4df Matthew Brost 2024-11-18  250  		struct dma_fence *fence;
0f3343471ed4df Matthew Brost 2024-11-18  251  
0f3343471ed4df Matthew Brost 2024-11-18  252  		sync->chain_fence = dma_fence_chain_alloc();
0f3343471ed4df Matthew Brost 2024-11-18  253  		if (!sync->chain_fence) {
0f3343471ed4df Matthew Brost 2024-11-18  254  			xe_bo_put(bo);
0f3343471ed4df Matthew Brost 2024-11-18  255  			dma_fence_chain_free(sync->chain_fence);
0f3343471ed4df Matthew Brost 2024-11-18  256  			return -ENOMEM;
0f3343471ed4df Matthew Brost 2024-11-18  257  		}
0f3343471ed4df Matthew Brost 2024-11-18  258  
0f3343471ed4df Matthew Brost 2024-11-18  259  		fence = xe_hw_fence_alloc();
0f3343471ed4df Matthew Brost 2024-11-18  260  		if (IS_ERR(fence)) {
0f3343471ed4df Matthew Brost 2024-11-18  261  			xe_bo_put(bo);
0f3343471ed4df Matthew Brost 2024-11-18  262  			return PTR_ERR(fence);
0f3343471ed4df Matthew Brost 2024-11-18  263  		}
0f3343471ed4df Matthew Brost 2024-11-18  264  
0f3343471ed4df Matthew Brost 2024-11-18  265  		vmap = bo->vmap;
0f3343471ed4df Matthew Brost 2024-11-18  266  		iosys_map_incr(&vmap, semaphore_in.offset);
0f3343471ed4df Matthew Brost 2024-11-18  267  
0f3343471ed4df Matthew Brost 2024-11-18  268  		xe_hw_fence_user_init(fence, xe, vmap, semaphore_in.seqno);
0f3343471ed4df Matthew Brost 2024-11-18  269  		sync->fence = fence;
0f3343471ed4df Matthew Brost 2024-11-18  270  		sync->flags = IS_UNINSTALLED_HW_FENCE;
0f3343471ed4df Matthew Brost 2024-11-18  271  	} else {
0f3343471ed4df Matthew Brost 2024-11-18  272  		sync->user_fence = dma_fence_user_fence_alloc();
0f3343471ed4df Matthew Brost 2024-11-18  273  		if (XE_IOCTL_DBG(xe, !sync->user_fence)) {
0f3343471ed4df Matthew Brost 2024-11-18  274  			xe_bo_put(bo);
0f3343471ed4df Matthew Brost 2024-11-18 @275  			return PTR_ERR(sync->ufence);
0f3343471ed4df Matthew Brost 2024-11-18  276  		}
0f3343471ed4df Matthew Brost 2024-11-18  277  
0f3343471ed4df Matthew Brost 2024-11-18  278  		sync->addr = semaphore_in.offset;
0f3343471ed4df Matthew Brost 2024-11-18  279  		sync->timeline_value = semaphore_in.seqno;
0f3343471ed4df Matthew Brost 2024-11-18  280  		sync->flags = DRM_XE_SYNC_FLAG_SIGNAL;
0f3343471ed4df Matthew Brost 2024-11-18  281  	}
0f3343471ed4df Matthew Brost 2024-11-18  282  	sync->bo = bo;
0f3343471ed4df Matthew Brost 2024-11-18  283  
0f3343471ed4df Matthew Brost 2024-11-18  284  	return 0;
0f3343471ed4df Matthew Brost 2024-11-18  285  }
0f3343471ed4df Matthew Brost 2024-11-18  286  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
