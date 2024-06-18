Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4192139DD
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Jun 2024 17:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718731393; cv=none; b=FEMIKkunXm3T8uiEcFKEeNuc/k1b46i0jhXpm0+87hneYqqsIBrJ3i2z24wd6Qq0yD+Hwxs9rrtpXR1h4pid2BEAyN8hI13d+LcH8sGebTCsMqXTWYgchjSURRi2GzM2Oh2U0M6MLRRDwXUVo0BjfYVwCtvFA71NdFSu8O9jK1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718731393; c=relaxed/simple;
	bh=ramk8qrzfayOpxPuli8NTtFb5AjtHcSJuAA9shhuwd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UPJScA3WxODRAAEjouaW+oweMFREod1NMtkAWaKDYF/9+nUnmaXYa44ZYMLE/gVr0Cg/54PqIK7vIBpplwJEg+3iGNtRBswhbKoaymrp8kgqjyVWmnZq3nBZzBQQ2dNB3LhLNfTxobN5nT0nHNw0014NVySOX36P5c0oh359/XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kz7anmWR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kz7anmWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718731392; x=1750267392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ramk8qrzfayOpxPuli8NTtFb5AjtHcSJuAA9shhuwd4=;
  b=Kz7anmWRt750VkNbRwgdBwD6QV8vQlxO2webrkrOhydzWhvDpna3pio6
   ThWVEElClrIb04/29JMPyrZw1U7U3iWDn1xdnxAj6iBzgycK71kfKwBlE
   evxoWEYCRTESDGptY97XqR2BdN3hNxNOQHzzn5ahOGVqccnDTCYj/j2Bz
   P849H3elDDnyMdLbYqy/qyK1UPTumpzBIKpJeaAmBQ8iBvjck5WUi353b
   1pYjKLTUtQpg8/5FsyPQoIZn7SzWugirp+FAv1amI9EklxaSNa6u9zeKK
   KJ10UduaV0tPZBDL5wmWQv4C+AKUaazx6tCMvR2j72FUqxf/o1uY8R88C
   w==;
X-CSE-ConnectionGUID: gqni/GIjTV+43sxJIrUw+g==
X-CSE-MsgGUID: lo9I0AaHQYmGMNKvEi6TXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27047002"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="27047002"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 10:23:11 -0700
X-CSE-ConnectionGUID: kCfAEnSRTeuF0dS6wsDdOQ==
X-CSE-MsgGUID: h3UcCUfRSXelnxavFsnlfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="64869939"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jun 2024 10:23:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJcXz-0005lG-1f;
	Tue, 18 Jun 2024 17:23:07 +0000
Date: Wed, 19 Jun 2024 01:22:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:gpu/prev 166/191] drivers/gpu/drm/drm_gpuvm.c:2706
 drm_gpuvm_bo_unmap() error: uninitialized symbol 'ret'.
Message-ID: <202406190112.dM9sf1iu-lkp@intel.com>
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

tree:   https://github.com/AsahiLinux/linux gpu/prev
head:   ebb83ce10cb43a9ff5fecbe85d37bd2187e5d07f
commit: 436416207fac1011fc79899107b63858640e7489 [166/191] drm/gpuvm: Add drm_gpuvm_bo_unmap()
:::::: branch date: 3 days ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-141-20240618 (https://download.01.org/0day-ci/archive/20240619/202406190112.dM9sf1iu-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406190112.dM9sf1iu-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/drm_gpuvm.c:2706 drm_gpuvm_bo_unmap() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/gpu/drm/drm_gpuvm.c:1354 drm_gpuvm_exec_lock_range() error: uninitialized symbol 'ret'.

vim +/ret +2706 drivers/gpu/drm/drm_gpuvm.c

e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  2666  
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2667  /**
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2668   * drm_gpuvm_bo_unmap() - unmaps a GEM
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2669   * @vm_bo: the &drm_gpuvm_bo abstraction
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2670   *
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2671   * This function calls the unmap callback for every GPUVA attached to a GEM.
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2672   *
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2673   * It is the callers responsibility to protect the GEMs GPUVA list against
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2674   * concurrent access using the GEMs dma_resv lock.
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2675   *
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2676   * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2677   */
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2678  int
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2679  drm_gpuvm_bo_unmap(struct drm_gpuvm_bo *vm_bo, void *priv)
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2680  {
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2681  	struct drm_gpuva_op *op;
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2682  	int ret;
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2683  
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2684  	if (unlikely(!vm_bo->vm))
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2685  		return -EINVAL;
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2686  
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2687  	const struct drm_gpuvm_ops *vm_ops = vm_bo->vm->ops;
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2688  
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2689  	if (unlikely(!(vm_ops && vm_ops->sm_step_unmap)))
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2690  		return -EINVAL;
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2691  
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2692  	struct drm_gpuva_ops *ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2693          if (IS_ERR(ops))
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2694                  return PTR_ERR(ops);
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2695  
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2696  	drm_gpuva_for_each_op(op, ops) {
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2697  		drm_WARN_ON(vm_bo->vm->drm, op->op != DRM_GPUVA_OP_UNMAP);
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2698  
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2699  		ret = op_unmap_cb(vm_ops, priv, op->unmap.va, false);
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2700  		if (ret)
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2701  			goto cleanup;
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2702  	}
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2703  
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2704  cleanup:
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2705  	drm_gpuva_ops_free(vm_bo->vm, ops);
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08 @2706  	return ret;
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2707  }
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2708  EXPORT_SYMBOL_GPL(drm_gpuvm_bo_unmap);
436416207fac10 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2709  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
