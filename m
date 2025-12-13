Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F162E92D2
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765596237; cv=none; b=lpS8i//CtWRKOAf7//3qEvbqc169vyCtDV6MC7/tm+RPryHV810iwR1QV99NuJ8cLvCl+FrTgpk9ADuFg1sUeGZhHJ5WsDyfUwdGM4w+Fqbso0SzcPhb1U5saiWF9Nq1jxjKQTcoex922M8vZnZjLNoydv0DCvAb06HPAK+Od/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765596237; c=relaxed/simple;
	bh=Cdia9pcmSB8aEgxRVLJwbfKXha/Pwwt82wJRdgP7yrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kM7Noe9JwBK9sfAU3veURqyw+Vd6B51Nvc+kidyFScGT3WpZctPa3y2kesyBXf9958vOOIbFtli3FPcR2FU3MTv5JbpzOjhXX2DyM1rBDHcui6zoca7sYUQJ+J/jBZrt35gnx4l+DX1ohxYGOpahKOlwK4PCeE373rZ5YKtEQbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iReKrJKz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iReKrJKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765596236; x=1797132236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cdia9pcmSB8aEgxRVLJwbfKXha/Pwwt82wJRdgP7yrQ=;
  b=iReKrJKzPyoangX0ApJJ3j4liWu7GgikcMktRuqZihnjamdKYKcQQ5MK
   ztBiRZyDnsra8+N9UBN7rJjpmJNhEmWbTcbtzppA6qpMgnyeX+laH9zEw
   VHFujomyI5gfzou5YKreKuyvEQO73/Ax8jvRjRYpuvdrfImuT7DU6he9t
   RrxccqGYxhvZaD/I0GGYWNUtmF8k/KJXni3hQH9jForaFGqOfMJIFXr+6
   yQR9De6+fwSTqRp1XLKYDKQO3OTTxT5MCZx0aqTJPb//s5o+QA5tvVVkN
   diqGcDrjRwc7o1GyFIf93emNQl+jzlYEXlCuOQSn7bD0Cu5mIR7PhbIKN
   A==;
X-CSE-ConnectionGUID: B90lbTZWQRaO/nFuzM97Mw==
X-CSE-MsgGUID: 2ZM0AV3bR7qfRNJB7yx5JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67473348"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67473348"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:23:55 -0800
X-CSE-ConnectionGUID: 8TylxCExRB6kU6L5Cex6eg==
X-CSE-MsgGUID: j27/4DNPS/OFrJ2M/DudkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="202325879"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Dec 2025 19:23:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUGEZ-000000006zL-41Co;
	Sat, 13 Dec 2025 03:23:51 +0000
Date: Sat, 13 Dec 2025 11:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_pt.c:2346 op_commit() warn: iterator 'i' not
 incremented
Message-ID: <202512131124.aJDLQl8Y-lkp@intel.com>
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
TO: Harry Austen <hpausten@protonmail.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: a559434880b320b83733d739733250815aecf1b0 drm/xe: Allow dropping kunit dependency as built-in
date:   6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
config: um-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131124.aJDLQl8Y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131124.aJDLQl8Y-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_pt.c:2346 op_commit() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/gpu/drm/xe/xe_pt.c:762 xe_pt_stage_bind() error: we previously assumed 'bo' could be null (see line 753)
drivers/gpu/drm/xe/xe_pt.c:1575 invalidation_fence_init() warn: passing freed memory '&ifence->base.base' (line 1574)
drivers/gpu/drm/xe/xe_pt.c:2122 op_prepare() warn: iterator 'i' not incremented

vim +/i +2346 drivers/gpu/drm/xe/xe_pt.c

eb07c2fc10bf9b Himal Prasad Ghimiray 2025-05-13  2294  
e8babb280b5ef9 Matthew Brost         2024-07-03  2295  static void op_commit(struct xe_vm *vm,
e8babb280b5ef9 Matthew Brost         2024-07-03  2296  		      struct xe_tile *tile,
e8babb280b5ef9 Matthew Brost         2024-07-03  2297  		      struct xe_vm_pgtable_update_ops *pt_update_ops,
bf758226c7e692 Matthew Brost         2024-08-26  2298  		      struct xe_vma_op *op, struct dma_fence *fence,
bf758226c7e692 Matthew Brost         2024-08-26  2299  		      struct dma_fence *fence2)
e8babb280b5ef9 Matthew Brost         2024-07-03  2300  {
e8babb280b5ef9 Matthew Brost         2024-07-03  2301  	xe_vm_assert_held(vm);
e8babb280b5ef9 Matthew Brost         2024-07-03  2302  
e8babb280b5ef9 Matthew Brost         2024-07-03  2303  	switch (op->base.op) {
e8babb280b5ef9 Matthew Brost         2024-07-03  2304  	case DRM_GPUVA_OP_MAP:
b43e864af0d4e7 Matthew Brost         2025-03-05  2305  		if ((!op->map.immediate && xe_vm_in_fault_mode(vm)) ||
b43e864af0d4e7 Matthew Brost         2025-03-05  2306  		    op->map.is_cpu_addr_mirror)
e8babb280b5ef9 Matthew Brost         2024-07-03  2307  			break;
e8babb280b5ef9 Matthew Brost         2024-07-03  2308  
bf758226c7e692 Matthew Brost         2024-08-26  2309  		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
5b658b7e89c312 Oak Zeng              2025-04-03  2310  			       fence2, op->map.invalidate_on_bind);
e8babb280b5ef9 Matthew Brost         2024-07-03  2311  		break;
e8babb280b5ef9 Matthew Brost         2024-07-03  2312  	case DRM_GPUVA_OP_REMAP:
b43e864af0d4e7 Matthew Brost         2025-03-05  2313  	{
b43e864af0d4e7 Matthew Brost         2025-03-05  2314  		struct xe_vma *old = gpuva_to_vma(op->base.remap.unmap->va);
b43e864af0d4e7 Matthew Brost         2025-03-05  2315  
b43e864af0d4e7 Matthew Brost         2025-03-05  2316  		if (xe_vma_is_cpu_addr_mirror(old))
b43e864af0d4e7 Matthew Brost         2025-03-05  2317  			break;
b43e864af0d4e7 Matthew Brost         2025-03-05  2318  
b43e864af0d4e7 Matthew Brost         2025-03-05  2319  		unbind_op_commit(vm, tile, pt_update_ops, old, fence, fence2);
e8babb280b5ef9 Matthew Brost         2024-07-03  2320  
e8babb280b5ef9 Matthew Brost         2024-07-03  2321  		if (op->remap.prev)
e8babb280b5ef9 Matthew Brost         2024-07-03  2322  			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
5b658b7e89c312 Oak Zeng              2025-04-03  2323  				       fence, fence2, false);
e8babb280b5ef9 Matthew Brost         2024-07-03  2324  		if (op->remap.next)
e8babb280b5ef9 Matthew Brost         2024-07-03  2325  			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
5b658b7e89c312 Oak Zeng              2025-04-03  2326  				       fence, fence2, false);
e8babb280b5ef9 Matthew Brost         2024-07-03  2327  		break;
b43e864af0d4e7 Matthew Brost         2025-03-05  2328  	}
e8babb280b5ef9 Matthew Brost         2024-07-03  2329  	case DRM_GPUVA_OP_UNMAP:
b43e864af0d4e7 Matthew Brost         2025-03-05  2330  	{
b43e864af0d4e7 Matthew Brost         2025-03-05  2331  		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
b43e864af0d4e7 Matthew Brost         2025-03-05  2332  
b43e864af0d4e7 Matthew Brost         2025-03-05  2333  		if (!xe_vma_is_cpu_addr_mirror(vma))
b43e864af0d4e7 Matthew Brost         2025-03-05  2334  			unbind_op_commit(vm, tile, pt_update_ops, vma, fence,
b43e864af0d4e7 Matthew Brost         2025-03-05  2335  					 fence2);
e8babb280b5ef9 Matthew Brost         2024-07-03  2336  		break;
b43e864af0d4e7 Matthew Brost         2025-03-05  2337  	}
e8babb280b5ef9 Matthew Brost         2024-07-03  2338  	case DRM_GPUVA_OP_PREFETCH:
b43e864af0d4e7 Matthew Brost         2025-03-05  2339  	{
b43e864af0d4e7 Matthew Brost         2025-03-05  2340  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
b43e864af0d4e7 Matthew Brost         2025-03-05  2341  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2342  		if (xe_vma_is_cpu_addr_mirror(vma)) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2343  			struct xe_svm_range *range = NULL;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2344  			unsigned long i;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2345  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13 @2346  			xa_for_each(&op->prefetch_range.range, i, range)
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2347  				range_present_and_invalidated_tile(vm, range, tile->id);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2348  		} else {
b43e864af0d4e7 Matthew Brost         2025-03-05  2349  			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
5b658b7e89c312 Oak Zeng              2025-04-03  2350  				       fence2, false);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2351  		}
e8babb280b5ef9 Matthew Brost         2024-07-03  2352  		break;
b43e864af0d4e7 Matthew Brost         2025-03-05  2353  	}
7d1d48fb1724b3 Matthew Brost         2025-03-05  2354  	case DRM_GPUVA_OP_DRIVER:
7d1d48fb1724b3 Matthew Brost         2025-03-05  2355  	{
fab76ce56538fd Matthew Brost         2025-06-15  2356  		/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
eb07c2fc10bf9b Himal Prasad Ghimiray 2025-05-13  2357  		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
eb07c2fc10bf9b Himal Prasad Ghimiray 2025-05-13  2358  			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
eb07c2fc10bf9b Himal Prasad Ghimiray 2025-05-13  2359  		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
a9ac0fa455b050 Matthew Brost         2025-05-12  2360  			WRITE_ONCE(op->unmap_range.range->tile_present,
a9ac0fa455b050 Matthew Brost         2025-05-12  2361  				   op->unmap_range.range->tile_present &
a9ac0fa455b050 Matthew Brost         2025-05-12  2362  				   ~BIT(tile->id));
eb07c2fc10bf9b Himal Prasad Ghimiray 2025-05-13  2363  
7d1d48fb1724b3 Matthew Brost         2025-03-05  2364  		break;
7d1d48fb1724b3 Matthew Brost         2025-03-05  2365  	}
e8babb280b5ef9 Matthew Brost         2024-07-03  2366  	default:
e8babb280b5ef9 Matthew Brost         2024-07-03  2367  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
e8babb280b5ef9 Matthew Brost         2024-07-03  2368  	}
e8babb280b5ef9 Matthew Brost         2024-07-03  2369  }
e8babb280b5ef9 Matthew Brost         2024-07-03  2370  

:::::: The code at line 2346 was first introduced by commit
:::::: 09ba0a8f06cd69d93eef0dc3bee33546880e46f8 drm/xe/svm: Implement prefetch support for SVM ranges

:::::: TO: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
:::::: CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
