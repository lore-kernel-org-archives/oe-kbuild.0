Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD421EEAB
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 05:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765604228; cv=none; b=eDJ16E6tq8q3WR1gN3tdIkl3G8w5fE7rFPdpxrpIirJB/jHw29OehP0AW6Uu00GgHT1a4YFtjQv/1/bayYmK+VR4G2UiVNXzfKj9pBArtqKa29sWXuFY6i5BWJtfixAPkNf6qkpwEAt65ipmXHtiZ9OufIA5GyGCuPNceE0qkZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765604228; c=relaxed/simple;
	bh=vyoVMk4JmCY1WkcV6sj1ucuL57mRkuzqW8mYL58ppWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JNnBzyKPGSBiz9acKR8FpSYx9C7kJdiRU2gYNFWzL3IJGqTq1G+xsfEYZ3bpUyOHLE6aGbV4s1OEWmr7vjor2gVL/UbZT5TtfuEMEjCBaqtq/Zjt4W/QA4NIzCBDEczJmjMccb1Nzf35FUuZbjRFBR02iirUXRbefxfdMdTIME0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2bZKaol; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2bZKaol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765604227; x=1797140227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vyoVMk4JmCY1WkcV6sj1ucuL57mRkuzqW8mYL58ppWM=;
  b=X2bZKaoll9fE0W2UwaDqhuw8jPauU1dat7bzAgszbZbfmlS5ZVs2tEda
   6JIWgtaJTPY39v/PbAMhUoWzYEwMmHpzapUdQ7weVwZShYMdVYcJZFrJy
   A7ykhGIzrTynGYoyiVl+3HOIetERkchWdF5ohYghohoRVvXqIGG6VF2aE
   KSkXJhxBFF+2LrjhmBlOKgdSpZRs+qJX8K8zL/kkwYMzV+8c+ND0MXrBo
   cFgLWjIg3+/RlpjW5fDi0xs7APzVO7C94SVsySVVnv0sq+C17YQ3dE8vf
   IOoSHvvWOWqQcRc8tRYknRP1K8W2u7vhtzjGy3bgH59OUajzVma9LOvxg
   g==;
X-CSE-ConnectionGUID: RgmfeSrbTJCha49urrw6IA==
X-CSE-MsgGUID: 28s+wWwhSsibEyoC4hxEUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66589829"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="66589829"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 21:37:04 -0800
X-CSE-ConnectionGUID: 9kP4jJUgRPWHBZAh2fKHlw==
X-CSE-MsgGUID: jJujuQkQQaqOIxEQlyFNmQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Dec 2025 21:37:03 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUIJQ-0000000077D-2h0b;
	Sat, 13 Dec 2025 05:37:00 +0000
Date: Sat, 13 Dec 2025 13:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_vm.c:4089 xe_vm_range_tilemask_tlb_inval()
 error: uninitialized symbol 'err'.
Message-ID: <202512131320.hTvvDrdj-lkp@intel.com>
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
TO: Matthew Brost <matthew.brost@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9551a26f17d9445eed497bd7c639d48dfc3c0af4
commit: c697ddcf27bd5c71b89539a9b79b7d078777b394 drm/xe: s/tlb_invalidation/tlb_inval
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: um-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131320.hTvvDrdj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131320.hTvvDrdj-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:4089 xe_vm_range_tilemask_tlb_inval() error: uninitialized symbol 'err'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2298 xe_vm_query_vmas_attrs_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/gpu/drm/xe/xe_vm.c:2634 new_vma() error: we previously assumed 'bo' could be null (see line 2608)
drivers/gpu/drm/xe/xe_vm.c:3097 prefetch_ranges() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_vm.c:3175 op_lock_and_prep() error: uninitialized symbol 'region'.
drivers/gpu/drm/xe/xe_vm.c:4304 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/xe/xe_vm.c:4438 xe_vm_alloc_vma() error: uninitialized symbol 'default_pat'.

vim +/err +4089 drivers/gpu/drm/xe/xe_vm.c

dd08ebf6c3525a Matthew Brost         2023-03-30  4033  
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4034  /**
c697ddcf27bd5c Matthew Brost         2025-08-26  4035   * xe_vm_range_tilemask_tlb_inval - Issue a TLB invalidation on this tilemask for an
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4036   * address range
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4037   * @vm: The VM
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4038   * @start: start address
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4039   * @end: end address
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4040   * @tile_mask: mask for which gt's issue tlb invalidation
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4041   *
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4042   * Issue a range based TLB invalidation for gt's in tilemask
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4043   *
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4044   * Returns 0 for success, negative error code otherwise.
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4045   */
c697ddcf27bd5c Matthew Brost         2025-08-26  4046  int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4047  				   u64 end, u8 tile_mask)
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4048  {
c697ddcf27bd5c Matthew Brost         2025-08-26  4049  	struct xe_gt_tlb_inval_fence
c697ddcf27bd5c Matthew Brost         2025-08-26  4050  		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4051  	struct xe_tile *tile;
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4052  	u32 fence_id = 0;
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4053  	u8 id;
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4054  	int err;
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4055  
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4056  	if (!tile_mask)
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4057  		return 0;
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4058  
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4059  	for_each_tile(tile, vm->xe, id) {
c697ddcf27bd5c Matthew Brost         2025-08-26  4060  		if (!(tile_mask & BIT(id)))
c697ddcf27bd5c Matthew Brost         2025-08-26  4061  			continue;
c697ddcf27bd5c Matthew Brost         2025-08-26  4062  
c697ddcf27bd5c Matthew Brost         2025-08-26  4063  		xe_gt_tlb_inval_fence_init(tile->primary_gt,
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4064  					   &fence[fence_id], true);
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4065  
c697ddcf27bd5c Matthew Brost         2025-08-26  4066  		err = xe_gt_tlb_inval_range(tile->primary_gt, &fence[fence_id],
c697ddcf27bd5c Matthew Brost         2025-08-26  4067  					    start, end, vm->usm.asid);
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4068  		if (err)
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4069  			goto wait;
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4070  		++fence_id;
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4071  
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4072  		if (!tile->media_gt)
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4073  			continue;
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4074  
c697ddcf27bd5c Matthew Brost         2025-08-26  4075  		xe_gt_tlb_inval_fence_init(tile->media_gt,
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4076  					   &fence[fence_id], true);
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4077  
c697ddcf27bd5c Matthew Brost         2025-08-26  4078  		err = xe_gt_tlb_inval_range(tile->media_gt, &fence[fence_id],
c697ddcf27bd5c Matthew Brost         2025-08-26  4079  					    start, end, vm->usm.asid);
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4080  		if (err)
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4081  			goto wait;
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4082  		++fence_id;
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4083  	}
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4084  
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4085  wait:
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4086  	for (id = 0; id < fence_id; ++id)
c697ddcf27bd5c Matthew Brost         2025-08-26  4087  		xe_gt_tlb_inval_fence_wait(&fence[id]);
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4088  
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09 @4089  	return err;
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4090  }
3ee9f2058ab202 Himal Prasad Ghimiray 2025-06-09  4091  

:::::: The code at line 4089 was first introduced by commit
:::::: 3ee9f2058ab202fd29d6a4adbf520d8878530520 drm/xe/vm: Add a helper xe_vm_range_tilemask_tlb_invalidation()

:::::: TO: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
:::::: CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
