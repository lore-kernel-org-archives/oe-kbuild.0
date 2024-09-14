Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB04518AE4
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Sep 2024 05:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726290165; cv=none; b=V/7CrbvtOxF6F3YAtWt5J8GU2uGa6KqOHBtGAMrbRehz4gdJevnHdbSPmFTsB8qIL3yYU4Dggm5RxQ1khdPQJnLeYF1r428Boj4URjOou47yOvU6hy/yU/YbH2YbgvwBuKUTGK+Dkz0TTcZrzcbNU0F/JXtfoYztm2HZxaJVgRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726290165; c=relaxed/simple;
	bh=dfRhcjt2d94IiZUGsi8e1at/TM0jHg/9V7VJrOa8wTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hKrtqCnDPI7JM3I+wym3VVRf9GLCMM2O55gOW4pB0+S+fMWrRKMRloPuj3jDgObu/BhAHQwLuzEefRguW9cnLLkK+fDXr4LuD3TswiwixB/Kx7vku4OhNBuoGCdMKERQ9Kyawe+sPgb3nHWjXAzVAOJ/W62ngOqR+tMoSqgUvk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUyyBFBb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUyyBFBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726290164; x=1757826164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dfRhcjt2d94IiZUGsi8e1at/TM0jHg/9V7VJrOa8wTs=;
  b=LUyyBFBbXC9v3lUraOgfSaORSoIkSCe5bSa38PA4urAs4aPyZDk0HDsN
   PpguxD8hooXHWDkmblKDAlWvOnIkq5/TOfPHt2JA3QzP4QOv8claxZdkF
   aLQj/N1SAjP8akYY4SYAfKTzG6Jyi8cglDZytdAtXINRiXEIqWYm/4U7E
   CooHPO+EdUBD+TdlNT/FwwH7PjLQErirnt4+BnP6GMsl08vdxc56CESub
   WPTUhVamYGhffs+yndzcXD6EcjCRAQQt2Dr/tMuxgnr1wq/xmaJ619NBM
   upHWCO5PFDu680Mhajt+JJnZ8fN2wCNrlf3dxq622A3ig0LQcMnwy/CvL
   w==;
X-CSE-ConnectionGUID: VpKoqlKGQgGDoo1580XkdA==
X-CSE-MsgGUID: fZrX05DVRRKUlnXPsAEAqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24738182"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="24738182"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 22:02:42 -0700
X-CSE-ConnectionGUID: x81YMpOqRo6VjWylyHxj/g==
X-CSE-MsgGUID: kZFIiCrrR+GSQgeW+05CcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="98984637"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Sep 2024 22:02:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spKve-0007OI-1d;
	Sat, 14 Sep 2024 05:02:38 +0000
Date: Sat, 14 Sep 2024 13:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:asahi-wip 2895/2964] drivers/gpu/drm/drm_gpuvm.c:2706
 drm_gpuvm_bo_unmap() error: uninitialized symbol 'ret'.
Message-ID: <202409141207.i7QJw55f-lkp@intel.com>
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
TO: Asahi Lina <lina@asahilina.net>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   a95dcde0380c1e7acfbb26b05e02b45f60bb44aa
commit: 0d8c42a2b3b0266134b806b1e1e15a3dc1ab8120 [2895/2964] drm/gpuvm: Add drm_gpuvm_bo_unmap()
:::::: branch date: 21 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20240913 (https://download.01.org/0day-ci/archive/20240914/202409141207.i7QJw55f-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409141207.i7QJw55f-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/drm_gpuvm.c:2706 drm_gpuvm_bo_unmap() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/gpu/drm/drm_gpuvm.c:1354 drm_gpuvm_exec_lock_range() error: uninitialized symbol 'ret'.

vim +/ret +2706 drivers/gpu/drm/drm_gpuvm.c

e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  2666  
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2667  /**
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2668   * drm_gpuvm_bo_unmap() - unmaps a GEM
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2669   * @vm_bo: the &drm_gpuvm_bo abstraction
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2670   *
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2671   * This function calls the unmap callback for every GPUVA attached to a GEM.
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2672   *
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2673   * It is the callers responsibility to protect the GEMs GPUVA list against
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2674   * concurrent access using the GEMs dma_resv lock.
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2675   *
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2676   * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2677   */
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2678  int
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2679  drm_gpuvm_bo_unmap(struct drm_gpuvm_bo *vm_bo, void *priv)
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2680  {
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2681  	struct drm_gpuva_op *op;
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2682  	int ret;
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2683  
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2684  	if (unlikely(!vm_bo->vm))
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2685  		return -EINVAL;
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2686  
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2687  	const struct drm_gpuvm_ops *vm_ops = vm_bo->vm->ops;
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2688  
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2689  	if (unlikely(!(vm_ops && vm_ops->sm_step_unmap)))
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2690  		return -EINVAL;
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2691  
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2692  	struct drm_gpuva_ops *ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2693          if (IS_ERR(ops))
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2694                  return PTR_ERR(ops);
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2695  
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2696  	drm_gpuva_for_each_op(op, ops) {
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2697  		drm_WARN_ON(vm_bo->vm->drm, op->op != DRM_GPUVA_OP_UNMAP);
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2698  
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2699  		ret = op_unmap_cb(vm_ops, priv, op->unmap.va, false);
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2700  		if (ret)
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2701  			goto cleanup;
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2702  	}
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2703  
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2704  cleanup:
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2705  	drm_gpuva_ops_free(vm_bo->vm, ops);
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08 @2706  	return ret;
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2707  }
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2708  EXPORT_SYMBOL_GPL(drm_gpuvm_bo_unmap);
0d8c42a2b3b026 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2709  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
