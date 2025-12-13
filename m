Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00762E7658
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 17:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765645213; cv=none; b=SYV2I+AS8qRdZ8JETyTatWowLGBHtthRjKHh5Dk6SuQ28VzHLjTFly0ec9Dp+4KJDyim9ZT4cPten7yYv+l28BO0rqnFdoi0sl9v8XIIZn6OOhr/Hf48PUBEVlRu1nJ8YGgO273US5Chz1JsmztXn0MGe85vf6htNk8EJlnbUl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765645213; c=relaxed/simple;
	bh=24juU8eN/vSDmRsJgH/GtV9xK0rnTefLNCrN4YkqYzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7cKxh3DiaKTZiwNxYgvEOwdofxJfn6LuFGdgzpx28zB4V2Uo2XGElapRLNQW4dcSMVVUAD2bA6U03LVUwsG/Kopi5wcpejwLLyfuVqjo+TmHRzUM+8fkSLrRno6IBKOvcI9tLb98eWg76yEEQ8eDCYkt+rqeC2robxIQ22Ph1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwnAT1qN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwnAT1qN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765645209; x=1797181209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=24juU8eN/vSDmRsJgH/GtV9xK0rnTefLNCrN4YkqYzY=;
  b=UwnAT1qN7fqoWZsdKYT1emFGVyuRpRvqnaqjfPz2MjhGMYuguQMentuk
   DiUoq3c1VMFz6MCjQamIjEM2X3T4Z68Z7pSmUoTV9Nn0MsLps6LJ5Yh6G
   h9vlT/xTYfUmgakDCl+0NXO2EQAexRbEiZwf6s8p6PAYebqlcGKml/OMV
   m87Ly7TFufQf92dmWlXCho2Fin3jmGHfskSlaWiZuHTUfkB7AgQPd3hTJ
   QdMRj66j0odcTk1iTke5rcZaSKK/xyB8RmVGSONnlM4H0sdpvnsvvQXfV
   /CMrZDT6/TNuuXJkqnlUW50mvkbhGf/8I6aUrHZzwqwFY531dqWG4x2Kw
   w==;
X-CSE-ConnectionGUID: I7hZJibNR4yYFFmdh6Oebw==
X-CSE-MsgGUID: qdnppVI1SiCFpdnHXzByAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66789663"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="66789663"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 09:00:06 -0800
X-CSE-ConnectionGUID: UArVZLKeQ3Okv+vr070SPQ==
X-CSE-MsgGUID: fYv5zghaRPOF9udfRocIrQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Dec 2025 09:00:05 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUSyQ-000000007xM-3aLp;
	Sat, 13 Dec 2025 17:00:02 +0000
Date: Sun, 14 Dec 2025 00:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_vm.c:3049 op_lock_and_prep() error:
 uninitialized symbol 'region'.
Message-ID: <202512140053.G9urRDtY-lkp@intel.com>
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
TO: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: c1bb69a2e8e2d55c3725e304d8b8fd189ee43fbe drm/xe/svm: Consult madvise preferred location in prefetch
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140053.G9urRDtY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140053.G9urRDtY-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:3049 op_lock_and_prep() error: uninitialized symbol 'region'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2532 new_vma() error: we previously assumed 'bo' could be null (see line 2506)
drivers/gpu/drm/xe/xe_vm.c:2971 prefetch_ranges() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_vm.c:3967 xe_vm_range_tilemask_tlb_invalidation() error: uninitialized symbol 'err'.
drivers/gpu/drm/xe/xe_vm.c:4182 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'

vim +/region +3049 drivers/gpu/drm/xe/xe_vm.c

09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2998  
77f2ef3f16f511 Matthew Brost         2024-04-24  2999  static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
77f2ef3f16f511 Matthew Brost         2024-04-24  3000  			    struct xe_vma_op *op)
77f2ef3f16f511 Matthew Brost         2024-04-24  3001  {
77f2ef3f16f511 Matthew Brost         2024-04-24  3002  	int err = 0;
77f2ef3f16f511 Matthew Brost         2024-04-24  3003  
77f2ef3f16f511 Matthew Brost         2024-04-24  3004  	switch (op->base.op) {
77f2ef3f16f511 Matthew Brost         2024-04-24  3005  	case DRM_GPUVA_OP_MAP:
5b658b7e89c312 Oak Zeng              2025-04-03  3006  		if (!op->map.invalidate_on_bind)
77f2ef3f16f511 Matthew Brost         2024-04-24  3007  			err = vma_lock_and_validate(exec, op->map.vma,
77f2ef3f16f511 Matthew Brost         2024-04-24  3008  						    !xe_vm_in_fault_mode(vm) ||
77f2ef3f16f511 Matthew Brost         2024-04-24  3009  						    op->map.immediate);
77f2ef3f16f511 Matthew Brost         2024-04-24  3010  		break;
77f2ef3f16f511 Matthew Brost         2024-04-24  3011  	case DRM_GPUVA_OP_REMAP:
fda75ef80bddf2 Matthew Brost         2024-04-24  3012  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
fda75ef80bddf2 Matthew Brost         2024-04-24  3013  		if (err)
fda75ef80bddf2 Matthew Brost         2024-04-24  3014  			break;
fda75ef80bddf2 Matthew Brost         2024-04-24  3015  
77f2ef3f16f511 Matthew Brost         2024-04-24  3016  		err = vma_lock_and_validate(exec,
77f2ef3f16f511 Matthew Brost         2024-04-24  3017  					    gpuva_to_vma(op->base.remap.unmap->va),
77f2ef3f16f511 Matthew Brost         2024-04-24  3018  					    false);
77f2ef3f16f511 Matthew Brost         2024-04-24  3019  		if (!err && op->remap.prev)
77f2ef3f16f511 Matthew Brost         2024-04-24  3020  			err = vma_lock_and_validate(exec, op->remap.prev, true);
77f2ef3f16f511 Matthew Brost         2024-04-24  3021  		if (!err && op->remap.next)
77f2ef3f16f511 Matthew Brost         2024-04-24  3022  			err = vma_lock_and_validate(exec, op->remap.next, true);
77f2ef3f16f511 Matthew Brost         2024-04-24  3023  		break;
77f2ef3f16f511 Matthew Brost         2024-04-24  3024  	case DRM_GPUVA_OP_UNMAP:
fda75ef80bddf2 Matthew Brost         2024-04-24  3025  		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
fda75ef80bddf2 Matthew Brost         2024-04-24  3026  		if (err)
fda75ef80bddf2 Matthew Brost         2024-04-24  3027  			break;
fda75ef80bddf2 Matthew Brost         2024-04-24  3028  
77f2ef3f16f511 Matthew Brost         2024-04-24  3029  		err = vma_lock_and_validate(exec,
77f2ef3f16f511 Matthew Brost         2024-04-24  3030  					    gpuva_to_vma(op->base.unmap.va),
77f2ef3f16f511 Matthew Brost         2024-04-24  3031  					    false);
77f2ef3f16f511 Matthew Brost         2024-04-24  3032  		break;
77f2ef3f16f511 Matthew Brost         2024-04-24  3033  	case DRM_GPUVA_OP_PREFETCH:
0a34c12449de4b Matthew Brost         2024-04-24  3034  	{
0a34c12449de4b Matthew Brost         2024-04-24  3035  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  3036  		u32 region;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  3037  
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  3038  		if (!xe_vma_is_cpu_addr_mirror(vma)) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  3039  			region = op->prefetch.region;
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  3040  			xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  3041  				  region <= ARRAY_SIZE(region_to_mem_type));
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  3042  		}
0a34c12449de4b Matthew Brost         2024-04-24  3043  
77f2ef3f16f511 Matthew Brost         2024-04-24  3044  		err = vma_lock_and_validate(exec,
0a34c12449de4b Matthew Brost         2024-04-24  3045  					    gpuva_to_vma(op->base.prefetch.va),
0a34c12449de4b Matthew Brost         2024-04-24  3046  					    false);
0a34c12449de4b Matthew Brost         2024-04-24  3047  		if (!err && !xe_vma_has_no_bo(vma))
0a34c12449de4b Matthew Brost         2024-04-24  3048  			err = xe_bo_migrate(xe_vma_bo(vma),
0a34c12449de4b Matthew Brost         2024-04-24 @3049  					    region_to_mem_type[region]);
77f2ef3f16f511 Matthew Brost         2024-04-24  3050  		break;
0a34c12449de4b Matthew Brost         2024-04-24  3051  	}
77f2ef3f16f511 Matthew Brost         2024-04-24  3052  	default:
77f2ef3f16f511 Matthew Brost         2024-04-24  3053  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
77f2ef3f16f511 Matthew Brost         2024-04-24  3054  	}
77f2ef3f16f511 Matthew Brost         2024-04-24  3055  
77f2ef3f16f511 Matthew Brost         2024-04-24  3056  	return err;
77f2ef3f16f511 Matthew Brost         2024-04-24  3057  }
77f2ef3f16f511 Matthew Brost         2024-04-24  3058  

:::::: The code at line 3049 was first introduced by commit
:::::: 0a34c12449de4b09f74808c6f6c39205ee5071f0 drm/xe: Move migrate to prefetch to op_lock_and_prep function

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Matthew Brost <matthew.brost@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
