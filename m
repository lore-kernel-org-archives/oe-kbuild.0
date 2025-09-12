Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE09A3081B8
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757685285; cv=none; b=UcN8qrpxjzAaSzhnNmXrKpq9wzW8W+eUkNJeXxRgIfm062ribV/waMR5moYf9SxI120h82NuG+t32yYvSg4uT0/nqRX9Fkd9DuHPpGjlN0+/19O0nb2DpDuJqVFPqieMFZ7LATIYxCS/mHsTn2aFdeTFNWZ7ndFM088wJVLkvC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757685285; c=relaxed/simple;
	bh=UF1NTypsK0YifXyGHVXLPAQgfVj6LQ+tTwlEo4YCcJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NoXjoXF8Bd1saZQBYIK234D5knMC35vlsmflhehkL09Q1MsR56cC6QU7UwX32czBEVOQ0JpwwlfBHK80qTQ255O1oYQkboMhk5LbYIcYGgYvKn2Eo3OD6l5XDXbRnNdN6+XqrfTRI/aMK46wqBJSU9Nzk9Ull/8ogZxiLC9X2KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zx+Edxq1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zx+Edxq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757685284; x=1789221284;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UF1NTypsK0YifXyGHVXLPAQgfVj6LQ+tTwlEo4YCcJs=;
  b=Zx+Edxq1Ao+yRZmanRcaPKd/U6Xp/8HaFNxa4GyOm5jg+rGKFZul7a4p
   D1iF0+4xVSXBAQH9NyGnk9/Yxt4TwXcEGF+mHWrWQGRlsM8iHzw2zJMym
   3Vk63jQe4ss/3Qz4aP8uWQZyZPgrWFA7gunafjqeKKYIz0ewgpL31ypU5
   Qro1bAyPgRsX+IqGXg7vv6s/WHn9nz+4rg7l+tfHQrQO+HEVgPedJykZp
   fdEf9rRxgEMR+Ajx/C0m2zWm07tu2d2L/KTeg4GQprGUKAiDH9Q74AeZS
   KK6RTgyOAprDpTTRRR58hQg/wIuVZArBJ6T97lOf8zH72sCjeChX0jxL3
   A==;
X-CSE-ConnectionGUID: pmJAkc5DRWuUtdi1uYkAWg==
X-CSE-MsgGUID: nbtPaV8aSpWJZlvjtcVEOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60139409"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="60139409"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 06:54:43 -0700
X-CSE-ConnectionGUID: DOBx+ZHvRG2//qpa00drXw==
X-CSE-MsgGUID: ZaGpu+iKRoqZh8vOtpDbkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="204749942"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 12 Sep 2025 06:54:41 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux4EY-00012O-2w;
	Fri, 12 Sep 2025 13:54:38 +0000
Date: Fri, 12 Sep 2025 21:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7388/8719] drivers/gpu/drm/xe/xe_pxp_submit.c:133
 allocate_gsc_client_resources() error: uninitialized symbol 'bo'.
Message-ID: <202509122123.Tv76XiqQ-lkp@intel.com>
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
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
commit: 59eabff2a3524d7f3bf6c24890cd197c4c116fcb [7388/8719] drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250911 (https://download.01.org/0day-ci/archive/20250912/202509122123.Tv76XiqQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509122123.Tv76XiqQ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_pxp_submit.c:133 allocate_gsc_client_resources() error: uninitialized symbol 'bo'.

vim +/bo +133 drivers/gpu/drm/xe/xe_pxp_submit.c

dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   83  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   84  #define PXP_BB_SIZE		XE_PAGE_SIZE
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   85  static int allocate_gsc_client_resources(struct xe_gt *gt,
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   86  					 struct xe_pxp_gsc_client_resources *gsc_res,
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   87  					 size_t inout_size)
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   88  {
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   89  	struct xe_tile *tile = gt_to_tile(gt);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   90  	struct xe_device *xe = tile_to_xe(tile);
59eabff2a3524d Thomas Hellström       2025-09-08   91  	struct xe_validation_ctx ctx;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   92  	struct xe_hw_engine *hwe;
59eabff2a3524d Thomas Hellström       2025-09-08   93  	struct drm_exec exec;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   94  	struct xe_vm *vm;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   95  	struct xe_bo *bo;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   96  	struct xe_exec_queue *q;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   97  	struct dma_fence *fence;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   98  	long timeout;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29   99  	int err = 0;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  100  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  101  	hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_OTHER, 0, true);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  102  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  103  	/* we shouldn't reach here if the GSC engine is not available */
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  104  	xe_assert(xe, hwe);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  105  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  106  	/* PXP instructions must be issued from PPGTT */
9337166fa1d80f Piotr Piórkowski       2025-08-11  107  	vm = xe_vm_create(xe, XE_VM_FLAG_GSC, NULL);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  108  	if (IS_ERR(vm))
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  109  		return PTR_ERR(vm);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  110  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  111  	/* We allocate a single object for the batch and the in/out memory */
59eabff2a3524d Thomas Hellström       2025-09-08  112  
59eabff2a3524d Thomas Hellström       2025-09-08  113  	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags){}, err) {
59eabff2a3524d Thomas Hellström       2025-09-08  114  		err = xe_vm_drm_exec_lock(vm, &exec);
59eabff2a3524d Thomas Hellström       2025-09-08  115  		drm_exec_retry_on_contention(&exec);
59eabff2a3524d Thomas Hellström       2025-09-08  116  		if (err)
59eabff2a3524d Thomas Hellström       2025-09-08  117  			break;
59eabff2a3524d Thomas Hellström       2025-09-08  118  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  119  		bo = xe_bo_create_pin_map(xe, tile, vm, PXP_BB_SIZE + inout_size * 2,
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  120  					  ttm_bo_type_kernel,
59eabff2a3524d Thomas Hellström       2025-09-08  121  					  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED |
59eabff2a3524d Thomas Hellström       2025-09-08  122  					  XE_BO_FLAG_NEEDS_UC, &exec);
59eabff2a3524d Thomas Hellström       2025-09-08  123  		drm_exec_retry_on_contention(&exec);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  124  		if (IS_ERR(bo)) {
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  125  			err = PTR_ERR(bo);
59eabff2a3524d Thomas Hellström       2025-09-08  126  			xe_validation_retry_on_oom(&ctx, &err);
59eabff2a3524d Thomas Hellström       2025-09-08  127  			break;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  128  		}
59eabff2a3524d Thomas Hellström       2025-09-08  129  	}
59eabff2a3524d Thomas Hellström       2025-09-08  130  	if (err)
59eabff2a3524d Thomas Hellström       2025-09-08  131  		goto vm_out;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  132  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29 @133  	fence = xe_vm_bind_kernel_bo(vm, bo, NULL, 0, XE_CACHE_WB);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  134  	if (IS_ERR(fence)) {
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  135  		err = PTR_ERR(fence);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  136  		goto bo_out;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  137  	}
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  138  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  139  	timeout = dma_fence_wait_timeout(fence, false, HZ);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  140  	dma_fence_put(fence);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  141  	if (timeout <= 0) {
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  142  		err = timeout ?: -ETIME;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  143  		goto bo_out;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  144  	}
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  145  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  146  	q = xe_exec_queue_create(xe, vm, BIT(hwe->logical_instance), 1, hwe,
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  147  				 EXEC_QUEUE_FLAG_KERNEL |
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  148  				 EXEC_QUEUE_FLAG_PERMANENT, 0);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  149  	if (IS_ERR(q)) {
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  150  		err = PTR_ERR(q);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  151  		goto bo_out;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  152  	}
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  153  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  154  	gsc_res->vm = vm;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  155  	gsc_res->bo = bo;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  156  	gsc_res->inout_size = inout_size;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  157  	gsc_res->batch = IOSYS_MAP_INIT_OFFSET(&bo->vmap, 0);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  158  	gsc_res->msg_in = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_BB_SIZE);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  159  	gsc_res->msg_out = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_BB_SIZE + inout_size);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  160  	gsc_res->q = q;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  161  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  162  	/* initialize host-session-handle (for all Xe-to-gsc-firmware PXP cmds) */
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  163  	gsc_res->host_session_handle = xe_gsc_create_host_session_id();
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  164  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  165  	return 0;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  166  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  167  bo_out:
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  168  	xe_bo_unpin_map_no_vm(bo);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  169  vm_out:
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  170  	xe_vm_close_and_put(vm);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  171  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  172  	return err;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  173  }
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  174  

:::::: The code at line 133 was first introduced by commit
:::::: dcdd6b84d9acaa0794c29de7024cfdb20cfd7b92 drm/xe/pxp: Allocate PXP execution resources

:::::: TO: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
:::::: CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
