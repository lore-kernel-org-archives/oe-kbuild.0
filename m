Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6831DEFE8
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 21:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748553783; cv=none; b=rpu80FOBFyGK60jv0X0L/Tms0lHhEMfoXE+y/l1rzzYRCSlmhaJPMdENdD74nzpn5J2Yu3LmaPP33Ar5HVQ9d6EpfLT0rc2LB1kLvTTVgVqD5034FapDh0K7sYIT1s5uYYeuRL9vl3fSHrMm52OEnJ2e2yLDt+500mJl0y26CBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748553783; c=relaxed/simple;
	bh=MfJ29iUjxkMQB/NwkkaPKmq6EdqmIzw7He2H4pmls/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PrBO9UMMAhdQrM4GHE4+svJ4mHXhbNPDMwVr4gT+aum/fSoBqesNlDGPU+l8/Clkypu9b2QGFiVd/EsN07V3Y7Pqth7guJlhcmIYU8aIepN8TxBmRAVIDXazxR81MYO/UXZIuQOHOiT1LPyrvWvmRykQEGpiY/X1HGF1N8GqifA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B54dtLnk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B54dtLnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748553781; x=1780089781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MfJ29iUjxkMQB/NwkkaPKmq6EdqmIzw7He2H4pmls/M=;
  b=B54dtLnkTjTwQ22sqRTiyGU/TReiTeZaaTpxh4VUlsLvGE4/a1t0b3ya
   R4ryzKmGBsJRbVE96jxBkziQuZp9FMvvDTQrIT3SEoTub+85Yn9n6HE4T
   Ifx+cztO2YSJYr85z7Pkk1UyLNTBC1GoUaHot2enqAJmXOjRO3tfWwwvl
   aVH6fEF2R/EaatGO9U9/3l5U39E86agRI1nX2PiTTZ7CZWWf5uGIdNALP
   3AjWwXVF7hrBqUVTVoEHMJEuPIIsKDtQSqvjhmdzeRIZNdvWsrAUIXd4h
   gU5mirdlU5rR+LVFVDmi2qZvQbMjzKyDA1jednYup8VjNsiuFSuB8+cCt
   g==;
X-CSE-ConnectionGUID: ecuB+JLRTJW397ErqAb9fw==
X-CSE-MsgGUID: bhpokI85SKiG+d18zepA4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68059297"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="68059297"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 14:22:59 -0700
X-CSE-ConnectionGUID: MDeQIHfTTl6/46DXXTXgCw==
X-CSE-MsgGUID: PpG+HqT5RYmhH+AXQd49Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="147555298"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 May 2025 14:22:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKkiF-000X7M-0t;
	Thu, 29 May 2025 21:22:55 +0000
Date: Fri, 30 May 2025 05:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 07/19] drm/xe/vm: Add a helper
 xe_vm_range_tilemask_tlb_invalidation()
Message-ID: <202505300542.iz30Sd3K-lkp@intel.com>
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
In-Reply-To: <20250527164003.1068118-8-himal.prasad.ghimiray@intel.com>
References: <20250527164003.1068118-8-himal.prasad.ghimiray@intel.com>
TO: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
TO: intel-xe@lists.freedesktop.org
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

Hi Himal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on linus/master v6.15 next-20250529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/Introduce-drm_gpuvm_sm_map_ops_flags-enums-for-sm_map_ops/20250528-041919
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250527164003.1068118-8-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v3 07/19] drm/xe/vm: Add a helper xe_vm_range_tilemask_tlb_invalidation()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r073-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300542.iz30Sd3K-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505300542.iz30Sd3K-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:3913 xe_vm_range_tilemask_tlb_invalidation() error: uninitialized symbol 'err'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2480 new_vma() error: we previously assumed 'bo' could be null (see line 2454)
drivers/gpu/drm/xe/xe_vm.c:2492 new_vma() error: 'vma' dereferencing possible ERR_PTR()
drivers/gpu/drm/xe/xe_vm.c:2919 prefetch_ranges() warn: iterator 'i' not incremented
arch/loongarch/include/asm/atomic.h:135 arch_atomic_fetch_add_unless() warn: inconsistent indenting
drivers/gpu/drm/xe/xe_vm.c:4119 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'

vim +/err +3913 drivers/gpu/drm/xe/xe_vm.c

dd08ebf6c3525a Matthew Brost         2023-03-30  3853  
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3854  /**
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3855   * xe_vm_range_tilemask_tlb_invalidation - Issue a TLB invalidation on this tilemask for an
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3856   * address range
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3857   * @vm: The VM
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3858   * @start: start address
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3859   * @end: end address
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3860   * @tile_mask: mask for which gt's issue tlb invalidation
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3861   *
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3862   * Issue a range based TLB invalidation for gt's in tilemask
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3863   *
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3864   * Returns 0 for success, negative error code otherwise.
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3865   */
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3866  int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3867  					  u64 end, u8 tile_mask)
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3868  {
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3869  	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3870  	struct xe_tile *tile;
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3871  	u32 fence_id = 0;
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3872  	u8 id;
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3873  	int err;
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3874  
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3875  	if (!tile_mask)
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3876  		return 0;
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3877  
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3878  	for_each_tile(tile, vm->xe, id) {
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3879  		if (tile_mask & BIT(id)) {
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3880  			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3881  							  &fence[fence_id], true);
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3882  
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3883  			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3884  							   &fence[fence_id],
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3885  							   start,
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3886  							   end,
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3887  							   vm->usm.asid);
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3888  			if (WARN_ON_ONCE(err < 0))
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3889  				goto wait;
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3890  			++fence_id;
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3891  
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3892  			if (!tile->media_gt)
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3893  				continue;
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3894  
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3895  			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3896  							  &fence[fence_id], true);
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3897  
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3898  			err = xe_gt_tlb_invalidation_range(tile->media_gt,
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3899  							   &fence[fence_id],
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3900  							   start,
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3901  							   end,
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3902  							   vm->usm.asid);
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3903  			if (WARN_ON_ONCE(err < 0))
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3904  				goto wait;
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3905  			++fence_id;
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3906  		}
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3907  	}
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3908  
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3909  wait:
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3910  	for (id = 0; id < fence_id; ++id)
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3911  		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3912  
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27 @3913  	return err;
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3914  }
511b2f09f331fc Himal Prasad Ghimiray 2025-05-27  3915  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
