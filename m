Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEA3308F3A
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765626881; cv=none; b=fx5VVAZQn9FPeay/B4+nd1bSJL8gx2buovWGToD2krRhESle16xPTYr/76Qu6CQPB/rtpub8OUME5Q/ltD5z33K7lYymm4wmbDpfFaehSdaFDHeVxN6lI+qiXpUEpyH7cSywHy/H7QtZ3PTkeDrcpSriIDdSvF1GuYzjzk7Mm3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765626881; c=relaxed/simple;
	bh=ROPXOqPLXrIYDCz6ItAvvcDLOS8J3W7T1Y+K2PxjAsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GqhazemBfTjrwPIM11BcXvg0JTi47bFpeyRGSn2G95nYk+Zbn+RfLoOrl8p6wtYlrETfltcFc9qL27hJjZ8nTAGTrqby+OYAyJLUMBR/pMAJxjfsPpXWY3MJRK5ZSYj1zvsRVLCy9CNXLNvchM9eLPHfe5kX3B977cV4eS9Axhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpAVn2Be; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpAVn2Be"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765626879; x=1797162879;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ROPXOqPLXrIYDCz6ItAvvcDLOS8J3W7T1Y+K2PxjAsU=;
  b=BpAVn2Beu8LcvWtCeYJcTXSHE9c7nTnH5nJMnZTiVCSLnLMFrX5WG73u
   13BBGyzQU1bn541izEssTd0EuRVsvfVXcb1F0MId+udQN3ICpukQdRLUG
   XOymvGyseICopJQnAdQUesSNWM+bbaYepMAfdDebziz7yNJuBQFLkBkh0
   1R+vCT1cHu04nG6sLRnJDnUr/kZLo2ZXz409xlufhUA5LL0ziE6bto6es
   enL55W9sXAz5wXYtflzR1flq9K4p95QJ5AFuM+Rx3CjYYqZ6d2cGjundU
   FTFRMvS9woEmILQIOU/P3Jmpn9UT07cNAHy4KmsQ679GSgJRn3mdO3izy
   A==;
X-CSE-ConnectionGUID: 7QtyLPK8SYSkuchl/gVNCA==
X-CSE-MsgGUID: KeTIl1AzTwuW+sjmVxfULw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67569774"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67569774"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 03:54:37 -0800
X-CSE-ConnectionGUID: 1T5qNwCWQZOXZvso0fHaLQ==
X-CSE-MsgGUID: emEJTC+FTAaqGEX5zGgDkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197061222"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 03:54:36 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUOCn-000000007Zb-1Edl;
	Sat, 13 Dec 2025 11:54:33 +0000
Date: Sat, 13 Dec 2025 19:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_vm.c:2910 prefetch_ranges() warn: iterator 'i'
 not incremented
Message-ID: <202512131915.Uxpw25Mx-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Harry Austen <hpausten@protonmail.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: a559434880b320b83733d739733250815aecf1b0 drm/xe: Allow dropping kunit dependency as built-in
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: s390-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131915.Uxpw25Mx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131915.Uxpw25Mx-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2910 prefetch_ranges() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2481 new_vma() error: we previously assumed 'bo' could be null (see line 2455)
drivers/gpu/drm/xe/xe_vm.c:3904 xe_vm_range_tilemask_tlb_invalidation() error: uninitialized symbol 'err'.
drivers/gpu/drm/xe/xe_vm.c:4119 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'

vim +/i +2910 drivers/gpu/drm/xe/xe_vm.c

fda75ef80bddf2 Matthew Brost         2024-04-24  2887  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2888  static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2889  {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2890  	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2891  	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2892  	int err = 0;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2893  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2894  	struct xe_svm_range *svm_range;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2895  	struct drm_gpusvm_ctx ctx = {};
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2896  	struct xe_tile *tile;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2897  	unsigned long i;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2898  	u32 region;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2899  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2900  	if (!xe_vma_is_cpu_addr_mirror(vma))
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2901  		return 0;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2902  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2903  	region = op->prefetch_range.region;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2904  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2905  	ctx.read_only = xe_vma_read_only(vma);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2906  	ctx.devmem_possible = devmem_possible;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2907  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2908  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2909  	/* TODO: Threading the migration */
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13 @2910  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2911  		if (!region)
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2912  			xe_svm_range_migrate_to_smem(vm, svm_range);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2913  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2914  		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2915  			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
b5870168783168 Thomas Hellström      2025-06-19  2916  			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2917  			if (err) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2918  				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2919  					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2920  				return -ENODATA;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2921  			}
5aee6e33e19593 Himal Prasad Ghimiray 2025-05-13  2922  			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2923  		}
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2924  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2925  		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2926  		if (err) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2927  			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2928  				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
10201c7de5de94 Matthew Brost         2025-06-09  2929  			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
10201c7de5de94 Matthew Brost         2025-06-09  2930  				err = -ENODATA;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2931  			return err;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2932  		}
5aee6e33e19593 Himal Prasad Ghimiray 2025-05-13  2933  		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2934  	}
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2935  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2936  	return err;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2937  }
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2938  

:::::: The code at line 2910 was first introduced by commit
:::::: 09ba0a8f06cd69d93eef0dc3bee33546880e46f8 drm/xe/svm: Implement prefetch support for SVM ranges

:::::: TO: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
:::::: CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
