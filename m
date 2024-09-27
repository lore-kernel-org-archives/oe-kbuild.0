Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0173136352
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727471206; cv=none; b=TXz1olPmS2qTnnFUJgmN7ckeOCcdTPGvR5OuIxxmO4mjp9sW96MAV0GA3AO+r06U2dp7AQQp3Fy29O8Iql+ri5Se+g87bnS/iRcY3h7z0MmbnT/toHF6mRnjMgg+/bgh6lm3qGcovs5bV06o2RlX5+7AmvjforAbPYXmE0wUmAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727471206; c=relaxed/simple;
	bh=KtxiMaCy2ql39N7m7Dd2aaDnV6MHjrD5OVJj7+eO8/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mnl01odOyrz8V7VQS0CfeTBkMKG64e2fhOeudPbls1XmUqWvRLIVyzD+OITCq+0MX9A+Z2L8ZKjZ9ct0wEYTNgjYbQMSY6SyP77/iCF4N33rd/AbK/ATSW6mk69evzGfhYZLF7C4T6FcIUZnkq64yqSFOFlrTLkhAHaJjqSrE1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKUANjtk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKUANjtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727471204; x=1759007204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KtxiMaCy2ql39N7m7Dd2aaDnV6MHjrD5OVJj7+eO8/w=;
  b=LKUANjtkNlX61TkMZj3T8493yfj6rD5In7KYrJEPOLxQK4LMWuSf+Mgw
   foOHkymdj25BjXgcMThSbgTvdyB9fY6tE1G6NigX6ZJeeJVUGaQFTvL3w
   lQnKdjEPwEyQINGyr2ajLMgYLuxc7APwaVgcLET4CC0sTCIShevYzKnFT
   AUpRNujDhyxBKCZdAadJXSPXo+UQ/zTtaQ5y4BA5SHkfvdpuLuHRZZiT7
   IST/h5CuCaxWNHoZG/zEz1Gdo7fx/AOYX2i8151mGzN5OuthYTknOxwbw
   Qh/WcXpBPORX6pkaRexKIxqbjF99qbJUGEPCIkZlA4lHXeUcgMEOStlsQ
   w==;
X-CSE-ConnectionGUID: h8gISsbiTvuMTNuB4c+hgw==
X-CSE-MsgGUID: 0Lw9ULj8QAWF3FDBS546hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="44150479"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="44150479"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 14:06:43 -0700
X-CSE-ConnectionGUID: 6QiDZi2LRZ6Qodkq+bqSeQ==
X-CSE-MsgGUID: ENZlINWGTkaG4N63uo7WyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72328332"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Sep 2024 14:06:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suIAi-000Mcn-0p;
	Fri, 27 Sep 2024 21:06:40 +0000
Date: Sat, 28 Sep 2024 05:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:asahi-wip 574/1039] drivers/gpu/drm/drm_gpuvm.c:2706
 drm_gpuvm_bo_unmap() error: uninitialized symbol 'ret'.
Message-ID: <202409280451.cOhPsAHm-lkp@intel.com>
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
head:   de1c5a8be0ee99602e472f3ca861cc2d249597da
commit: 3071faed85b4c2fc9d6de681d2059c02d56388ef [574/1039] drm/gpuvm: Add drm_gpuvm_bo_unmap()
:::::: branch date: 3 days ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-161-20240927 (https://download.01.org/0day-ci/archive/20240928/202409280451.cOhPsAHm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409280451.cOhPsAHm-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/drm_gpuvm.c:2706 drm_gpuvm_bo_unmap() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/gpu/drm/drm_gpuvm.c:1354 drm_gpuvm_exec_lock_range() error: uninitialized symbol 'ret'.

vim +/ret +2706 drivers/gpu/drm/drm_gpuvm.c

e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  2666  
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2667  /**
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2668   * drm_gpuvm_bo_unmap() - unmaps a GEM
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2669   * @vm_bo: the &drm_gpuvm_bo abstraction
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2670   *
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2671   * This function calls the unmap callback for every GPUVA attached to a GEM.
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2672   *
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2673   * It is the callers responsibility to protect the GEMs GPUVA list against
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2674   * concurrent access using the GEMs dma_resv lock.
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2675   *
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2676   * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2677   */
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2678  int
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2679  drm_gpuvm_bo_unmap(struct drm_gpuvm_bo *vm_bo, void *priv)
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2680  {
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2681  	struct drm_gpuva_op *op;
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2682  	int ret;
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2683  
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2684  	if (unlikely(!vm_bo->vm))
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2685  		return -EINVAL;
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2686  
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2687  	const struct drm_gpuvm_ops *vm_ops = vm_bo->vm->ops;
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2688  
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2689  	if (unlikely(!(vm_ops && vm_ops->sm_step_unmap)))
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2690  		return -EINVAL;
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2691  
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2692  	struct drm_gpuva_ops *ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2693          if (IS_ERR(ops))
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2694                  return PTR_ERR(ops);
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2695  
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2696  	drm_gpuva_for_each_op(op, ops) {
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2697  		drm_WARN_ON(vm_bo->vm->drm, op->op != DRM_GPUVA_OP_UNMAP);
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2698  
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2699  		ret = op_unmap_cb(vm_ops, priv, op->unmap.va, false);
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2700  		if (ret)
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2701  			goto cleanup;
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2702  	}
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2703  
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2704  cleanup:
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2705  	drm_gpuva_ops_free(vm_bo->vm, ops);
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08 @2706  	return ret;
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2707  }
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2708  EXPORT_SYMBOL_GPL(drm_gpuvm_bo_unmap);
3071faed85b4c2 drivers/gpu/drm/drm_gpuvm.c     Asahi Lina       2024-05-08  2709  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
