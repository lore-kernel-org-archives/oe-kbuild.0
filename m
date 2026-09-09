Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9173B3B0ACB
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 00:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788915337; cv=none; b=jLUms80z1AEYPBpOLd//4awCS71grt2BY+/+iO7vONcSXlz8V3B2fGHVB9wkY8Jbk+TCV4cynlm84uljPaw3FJ/n2FCiqs+FYxHjwZ8XjHVFX6SRUvnnPcnGas8f9JPx3ZiJLZWJyTCdGLhGDYUtaxEL9GSatHItFyrjHrdtM0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788915337; c=relaxed/simple;
	bh=7GSXlYiI28WxJkxrfA4l4WkDCx8UP9AfRAqDA+wuzEo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fukLvCYMvMN291g0neD+4Ov4a38ogUTFmdpolgZZqOx+d8Eg3bh3OczTbPWZp+GJhwDOeIEBZpAMk5IKffHaE1v4EvJdy/rnjvtpucWyWsX2ZQhs4oWxtRQ0Gc/zcrvjhTMdzGbaFXS2FiKyJXha6Bm7HNNWqvM58e+oaAHZIrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQuTQRF1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQuTQRF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788915325; x=1820451325;
  h=date:from:to:cc:subject:message-id;
  bh=7GSXlYiI28WxJkxrfA4l4WkDCx8UP9AfRAqDA+wuzEo=;
  b=KQuTQRF1PYj1fR7usf11yMqBVAaL8fpTo3D/6RSjoM7CKoiSdqdkpOqy
   dAotK7l74oD9b/0j96J+itA4uxTaAcjfGsYk2Mst+OVJezvLLPtfN144v
   UupMfD7hjYd3zIGbwa2vBeuBi5PKoA90iMdSKGnWISL0IFI9vXZSVk6NW
   0gqCdRlGgSqyHXZu3EHfzIe9r91QM5x9kTYUrhoP7LhacSgQyJr96xY/g
   10nkPI2VB9He8UHNjFsPWX20LDSPLBX/iLQjz8fKoLV0CrGuKrR445w6m
   8Z4SLjnTAgz0+ulKuw8XbrWp0kqptmeAOC0F4bf+MMOEoNnRyLwK0pU6O
   w==;
X-CSE-ConnectionGUID: eHtqyWD6STuqvopyMCfcNA==
X-CSE-MsgGUID: vWGgw2A2QB+ptHSyc+13uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89256267"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="89256267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 17:55:24 -0700
X-CSE-ConnectionGUID: HkN+wVF1RLCGEvTYbTDd3g==
X-CSE-MsgGUID: XQiEBLNYSH6G0RLKkON3IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="301028166"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2026 17:55:22 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x46at-00000000187-0N6E;
	Wed, 09 Sep 2026 00:55:19 +0000
Date: Wed, 09 Sep 2026 08:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/msm_gem_vma.c:392 msm_gem_vma_new()
 error: we previously assumed 'obj' could be null (see line 377)
Message-ID: <202609090807.LTN2GI7H-lkp@intel.com>
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
head:   893e11787f78e43b534e252249ac3fff4d1333f8
commit: c07612365087c8873f3faa2a47642ffa73b12c54 drm/msm: Disallow foreign mapping of _NO_SHARE
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: arc-randconfig-r072-20260907 (https://download.01.org/0day-ci/archive/20260909/202609090807.LTN2GI7H-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c07612365087 ("drm/msm: Disallow foreign mapping of _NO_SHARE")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609090807.LTN2GI7H-lkp@intel.com/

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
