Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319AC23E358
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 15:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053127; cv=none; b=avkuLIEs8SnPImv0+W8vrMp6lIrabtAZ7tIV6fhNI5o/qq5jRQZQy5Aqev0eGadN0g+7gyiiB77dsr97sryVRBp0bcK5JpFSAqX/u2Z4D6FZ8BctS5hU4mc7YH5f+BvAK3qRzIic8yNT2HeEzGS+NgJ1gLFwI1a0KTCRuY+tkHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053127; c=relaxed/simple;
	bh=mtuCA85iApTwKofE5EDXifGuNW0Cl1FEc1GAe6iB22s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SE+5T4PWIV2G/ssBo9UXl3sAX8vhJ0RPowoLfYHIA0DhrRWNxjtr4rHppUrYDWY2o9NLyMFMas0RgXp6G4v/YSgJTBlUxBfIr2bwqFE6Fuj/+102ByFBeUVp++EN3cvl9Bmm6Sfm3yQlVfzwfaLhy9SIQ2cObN3S0Dg8wphT9y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JiVa/+P9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiVa/+P9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789053121; x=1820589121;
  h=date:from:to:cc:subject:message-id;
  bh=mtuCA85iApTwKofE5EDXifGuNW0Cl1FEc1GAe6iB22s=;
  b=JiVa/+P921frrCSoP5ip5laU44a2z87gBEWF/C69hS29qN1rK+4yKBjt
   ITxdlrqFsTBU4mQXzYbvCJ+0HzcltJ8pUZMIt7+A3foU6nUc3fzRPJY6s
   7pMz8HvG71kP4ub2a040ReG6IWtghkgtYmc0qlU1vLM4O76fUszzUcbo5
   /MfksRSDlNRM4szQvSFMXUJavK4caNtBIobj1RUBbCOLYAOPcyDPC+2Pq
   QzggrslyCiDGqMSrvTIGJ2QaiLvz3UsazgmBQwOmayeSNIDiQAE2an9Nv
   W4We5WZY75ektetjbOr3blEVnm8iPxOVg69Pd9hPLg5fiwU+tyRFDBg0p
   w==;
X-CSE-ConnectionGUID: 3il7eR0nThqaa5OqzIYAoQ==
X-CSE-MsgGUID: TOAoLYUoRfapB7qwwTDFuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89439126"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89439126"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:11:57 -0700
X-CSE-ConnectionGUID: K5WUXdPAREOdQP1yyFn0Fg==
X-CSE-MsgGUID: UjWrAwsDT7aET/ujI5OB5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="301562319"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2026 08:11:55 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gQe-000000000B8-2CtC;
	Thu, 10 Sep 2026 15:11:15 +0000
Date: Thu, 10 Sep 2026 22:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/msm_gem_vma.c:392 msm_gem_vma_new()
 error: we previously assumed 'obj' could be null (see line 377)
Message-ID: <202609102210.J9Ag5Rin-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rob Clark <robin.clark@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: c07612365087c8873f3faa2a47642ffa73b12c54 drm/msm: Disallow foreign mapping of _NO_SHARE
date:   5 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
config: arc-randconfig-r072-20260907 (https://download.01.org/0day-ci/archive/20260910/202609102210.J9Ag5Rin-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c07612365087 ("drm/msm: Disallow foreign mapping of _NO_SHARE")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609102210.J9Ag5Rin-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/msm_gem_vma.c:392 msm_gem_vma_new() error: we previously assumed 'obj' could be null (see line 377)

vim +/obj +392 drivers/gpu/drm/msm/msm_gem_vma.c

7ad0e8cf631782 Jordan Crouse         2018-11-07  365  
da0e1407beb3a4 Rob Clark             2025-06-29  366  /* Create a new vma and allocate an iova for it */
37889600f58ea5 Rob Clark             2025-06-29  367  struct drm_gpuva *
37889600f58ea5 Rob Clark             2025-06-29  368  msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
2c7ad9925523f6 Rob Clark             2025-06-29  369  		u64 offset, u64 range_start, u64 range_end)
fc2f07566a2cb1 Rob Clark             2023-03-20  370  {
37889600f58ea5 Rob Clark             2025-06-29  371  	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
111fdd2198e63b Rob Clark             2025-06-29  372  	struct drm_gpuvm_bo *vm_bo;
fc2f07566a2cb1 Rob Clark             2023-03-20  373  	struct msm_gem_vma *vma;
da0e1407beb3a4 Rob Clark             2025-06-29  374  	int ret;
fc2f07566a2cb1 Rob Clark             2023-03-20  375  
c07612365087c8 Rob Clark             2026-03-24  376  	/* _NO_SHARE objs cannot be mapped outside of their "host" vm: */
c07612365087c8 Rob Clark             2026-03-24 @377  	if (obj && (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE) &&
c07612365087c8 Rob Clark             2026-03-24  378  	    GEM_WARN_ON(obj->resv != drm_gpuvm_resv(gpuvm))) {
c07612365087c8 Rob Clark             2026-03-24  379  		return ERR_PTR(-EINVAL);
c07612365087c8 Rob Clark             2026-03-24  380  	}
c07612365087c8 Rob Clark             2026-03-24  381  
fe4952b5f27cca Rob Clark             2025-06-29  382  	drm_gpuvm_resv_assert_held(&vm->base);
fe4952b5f27cca Rob Clark             2025-06-29  383  
fc2f07566a2cb1 Rob Clark             2023-03-20  384  	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
fc2f07566a2cb1 Rob Clark             2023-03-20  385  	if (!vma)
da0e1407beb3a4 Rob Clark             2025-06-29  386  		return ERR_PTR(-ENOMEM);
fc2f07566a2cb1 Rob Clark             2023-03-20  387  
111fdd2198e63b Rob Clark             2025-06-29  388  	if (vm->managed) {
2c7ad9925523f6 Rob Clark             2025-06-29  389  		BUG_ON(offset != 0);
2e6a8a1fe2b262 Rob Clark             2025-06-29  390  		BUG_ON(!obj);  /* NULL mappings not valid for kernel managed VM */
057e55f337c5bb Rob Clark             2025-06-29  391  		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
da0e1407beb3a4 Rob Clark             2025-06-29 @392  						obj->size, PAGE_SIZE, 0,
2ee4b5d265363f Rob Clark             2022-04-11  393  						range_start, range_end, 0);
0e08270a1f01bc Sushmita Susheelendra 2017-06-13  394  
667ce33e57d0de Rob Clark             2016-09-28  395  		if (ret)
da0e1407beb3a4 Rob Clark             2025-06-29  396  			goto err_free_vma;
667ce33e57d0de Rob Clark             2016-09-28  397  
111fdd2198e63b Rob Clark             2025-06-29  398  		range_start = vma->node.start;
111fdd2198e63b Rob Clark             2025-06-29  399  		range_end   = range_start + obj->size;
111fdd2198e63b Rob Clark             2025-06-29  400  	}
111fdd2198e63b Rob Clark             2025-06-29  401  
2e6a8a1fe2b262 Rob Clark             2025-06-29  402  	if (obj)
111fdd2198e63b Rob Clark             2025-06-29  403  		GEM_WARN_ON((range_end - range_start) > obj->size);
111fdd2198e63b Rob Clark             2025-06-29  404  
efe927b9702643 Dmitry Baryshkov      2025-08-23  405  	struct drm_gpuva_op_map op_map = {
efe927b9702643 Dmitry Baryshkov      2025-08-23  406  		.va.addr = range_start,
efe927b9702643 Dmitry Baryshkov      2025-08-23  407  		.va.range = range_end - range_start,
efe927b9702643 Dmitry Baryshkov      2025-08-23  408  		.gem.obj = obj,
efe927b9702643 Dmitry Baryshkov      2025-08-23  409  		.gem.offset = offset,
efe927b9702643 Dmitry Baryshkov      2025-08-23  410  	};
efe927b9702643 Dmitry Baryshkov      2025-08-23  411  
3309323241fbb3 Boris Brezillon       2025-08-19  412  	drm_gpuva_init_from_op(&vma->base, &op_map);
c0ee9794693c1f Jordan Crouse         2018-11-07  413  	vma->mapped = false;
667ce33e57d0de Rob Clark             2016-09-28  414  
111fdd2198e63b Rob Clark             2025-06-29  415  	ret = drm_gpuva_insert(&vm->base, &vma->base);
111fdd2198e63b Rob Clark             2025-06-29  416  	if (ret)
111fdd2198e63b Rob Clark             2025-06-29  417  		goto err_free_range;
da0e1407beb3a4 Rob Clark             2025-06-29  418  
2e6a8a1fe2b262 Rob Clark             2025-06-29  419  	if (!obj)
2e6a8a1fe2b262 Rob Clark             2025-06-29  420  		return &vma->base;
2e6a8a1fe2b262 Rob Clark             2025-06-29  421  
111fdd2198e63b Rob Clark             2025-06-29  422  	vm_bo = drm_gpuvm_bo_obtain(&vm->base, obj);
111fdd2198e63b Rob Clark             2025-06-29  423  	if (IS_ERR(vm_bo)) {
111fdd2198e63b Rob Clark             2025-06-29  424  		ret = PTR_ERR(vm_bo);
111fdd2198e63b Rob Clark             2025-06-29  425  		goto err_va_remove;
111fdd2198e63b Rob Clark             2025-06-29  426  	}
111fdd2198e63b Rob Clark             2025-06-29  427  
111fdd2198e63b Rob Clark             2025-06-29  428  	drm_gpuvm_bo_extobj_add(vm_bo);
111fdd2198e63b Rob Clark             2025-06-29  429  	drm_gpuva_link(&vma->base, vm_bo);
111fdd2198e63b Rob Clark             2025-06-29  430  	GEM_WARN_ON(drm_gpuvm_bo_put(vm_bo));
667ce33e57d0de Rob Clark             2016-09-28  431  
37889600f58ea5 Rob Clark             2025-06-29  432  	return &vma->base;
da0e1407beb3a4 Rob Clark             2025-06-29  433  
111fdd2198e63b Rob Clark             2025-06-29  434  err_va_remove:
111fdd2198e63b Rob Clark             2025-06-29  435  	drm_gpuva_remove(&vma->base);
111fdd2198e63b Rob Clark             2025-06-29  436  err_free_range:
111fdd2198e63b Rob Clark             2025-06-29  437  	if (vm->managed)
111fdd2198e63b Rob Clark             2025-06-29  438  		drm_mm_remove_node(&vma->node);
da0e1407beb3a4 Rob Clark             2025-06-29  439  err_free_vma:
da0e1407beb3a4 Rob Clark             2025-06-29  440  	kfree(vma);
da0e1407beb3a4 Rob Clark             2025-06-29  441  	return ERR_PTR(ret);
667ce33e57d0de Rob Clark             2016-09-28  442  }
667ce33e57d0de Rob Clark             2016-09-28  443  

:::::: The code at line 392 was first introduced by commit
:::::: da0e1407beb3a40e1b78418b257b849befb24bc6 drm/msm: Collapse vma allocation and initialization

:::::: TO: Rob Clark <robdclark@chromium.org>
:::::: CC: Rob Clark <robin.clark@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
