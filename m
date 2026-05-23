Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D25317162
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 19:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779564048; cv=none; b=EdyIGPSqr49E3w8O1WR7+haR4x++w+tDBjQna0IClYow6Fw0vf1dubkuD1XpRnUnBSATyvVoorO90RuSBnDwsUBiV7vJUTAfqCvuPROdS3Tvuw686ZJ3GzcaofBfBN4d9FsTHgMMnQlwESWwFOSXpoSkypv8m0d1TgM9fUf2qiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779564048; c=relaxed/simple;
	bh=FqTq3sgJyvBUDUl1LQEVkvRZsbyLPK3AHIWH/iLcrpg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rQeQEg1/EAi4YEx1mKuKoR4pRfNAl466dKhSTtCPZACTXRz7iMTw9QfziQ4TYNPh0xGaZ3ixQu6qUI9FKMtTzdCKjQULBtCulLXpg6hNvnJBOBoHhr4HWtisyITVFvGfjXEVwza2KyjHJy4ZIomoki6XEo6+glnwZ5VF778X2zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoxjtXcC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoxjtXcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779564046; x=1811100046;
  h=date:from:to:cc:subject:message-id;
  bh=FqTq3sgJyvBUDUl1LQEVkvRZsbyLPK3AHIWH/iLcrpg=;
  b=CoxjtXcC+F5WvbhszBpy3aF3YGWqkG832uzeU5U6eTyuR3VCknqT1yY1
   GdTkN896co7rrjEclNp0eZhyf6f6UWgE5r5l9h5N8L91UcOKKXCQag5Ek
   irJdA97dJKGC9MbfXCYX7YgGs4uU6qDetFp9DK0YvwgQX2lQoE3lz9zxE
   bOYgZ55IS2Q7neWXnjxLc9bUmifToS5EF7Ahjq/G3cwYzb8lAh64wCg4F
   UxFy3See+vz9XrRJAvVcwZJv7KKiFo4ym2+XNE12ABjEw3uC6/vm/lJ6A
   ymJ3OSaNCMGKQAF/ss1+cWsHxxhMD3CIdE37wUY1KODBln8fsMJs/T1zf
   Q==;
X-CSE-ConnectionGUID: md46RwQRSeqpiM+ixnx+hw==
X-CSE-MsgGUID: G51CswnUReeFZXdHfGgKrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="80182421"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="80182421"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 12:20:46 -0700
X-CSE-ConnectionGUID: vLOtcXWYSVq34yIkqSNc/g==
X-CSE-MsgGUID: 7dzA2MadTvKkObrgS87cWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="245494049"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2026 12:20:45 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQrtq-000000000J3-1gM9;
	Sat, 23 May 2026 19:20:42 +0000
Date: Sun, 24 May 2026 03:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/msm_gem_vma.c:392 msm_gem_vma_new()
 error: we previously assumed 'obj' could be null (see line 377)
Message-ID: <202605240304.WXDESai7-lkp@intel.com>
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
head:   eed108edc1170404bbef9e7d0189d18a3cc354f5
commit: c07612365087c8873f3faa2a47642ffa73b12c54 drm/msm: Disallow foreign mapping of _NO_SHARE
date:   8 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 weeks ago
config: powerpc64-randconfig-r071-20260523 (https://download.01.org/0day-ci/archive/20260524/202605240304.WXDESai7-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c07612365087 ("drm/msm: Disallow foreign mapping of _NO_SHARE")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605240304.WXDESai7-lkp@intel.com/

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
