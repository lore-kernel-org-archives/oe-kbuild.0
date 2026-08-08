Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A3D38BF81
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 17:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786210471; cv=none; b=Y/WR47RJM2gDBRGQKHzjGOc/Flrlh5UeFoYkFUDa4sR1GpIzC+Ln5xqAEjUw3qDGCYnNX3EjU976qFIji9rqnsmLBoLqNZ9noBj316ItzS2Tsk08fENTMaAwJuxhRH2Jz9xNMePGRsSi8Hhf5rNiD+CjZnLzkWbHe49ctuFyAMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786210471; c=relaxed/simple;
	bh=sHmU9+rPddqDV+Kf8Bu5mgUTKNfBOsKu0a0FECT0XHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f2wPGSHvDK3toTRVqEYu1BGkwO7f3zEvHyNoNgSwnaY6960m0oHHrIJuHEkPA6eowM7ed0rm4r/rCRk4XAVXkSpv3KiGMBe3WDKMbr0+I1vQIg41Vlyftim+Gdxg74jAt8DhrxiXrTJjoER3Wi1Tje9bZ0I2JbH5hg2saVwgt8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eqi1z4ZA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eqi1z4ZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786210469; x=1817746469;
  h=date:from:to:cc:subject:message-id;
  bh=sHmU9+rPddqDV+Kf8Bu5mgUTKNfBOsKu0a0FECT0XHQ=;
  b=Eqi1z4ZAKpzKEILgFKgDKmYJpc0HEeSOG2r2cYW9sYPHz+CPJ4PQHDHX
   X7TkdKPILY5k7JiC6fWvSziJGBAZgnEbXLpVCNJa/72NV/JXbmP2Ws6CY
   meId+iGIEe1QjLVxdS+qHSncoveOk3cdQ1VKkvd0frCHgKVJuWYgEDEE8
   UjxZ8Cw/s2n1WXt16PsQj7PLyWTkQ/j17UF1HtFqBxQGsjQfG42kM3yQs
   /T5vuxib1yOdqJ+7CrvqDL4NS7A3KiZyAQL321yttpsr5BYZh3E01TQ06
   f2EKGSiU12npSjtzhj7uBzlO+70/Fsl9QkEjTEkfMmcG/xekWkKXXnqwQ
   g==;
X-CSE-ConnectionGUID: aqtHENd3T96Oc4OYrFYCqA==
X-CSE-MsgGUID: qepC0qF5SOWrJDOVDAu/lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="86865047"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="86865047"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 10:34:28 -0700
X-CSE-ConnectionGUID: FZkBVYTkTwuxDoRx9n/ibg==
X-CSE-MsgGUID: JnPSJf7OTGeLinOXg9+CjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="259341077"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Aug 2026 10:34:27 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wskwC-00000000KZL-3hN3;
	Sat, 08 Aug 2026 17:34:24 +0000
Date: Sun, 09 Aug 2026 01:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:2342
 gfx_v12_1_xcc_kcq_resume() error: buffer overflow 'adev->gfx.compute_ring' 64
 <= u32max
Message-ID: <202608090154.0inl91XY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Likun Gao <Likun.Gao@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>
CC: Mukul Joshi <mukul.joshi@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: ad5f1ee0a9b03200b86db65fd946b686088b4b03 drm/amdgpu: Add initial support for gfx v12_1
date:   8 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-141-20260806 (https://download.01.org/0day-ci/archive/20260809/202608090154.0inl91XY-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ad5f1ee0a9b0 ("drm/amdgpu: Add initial support for gfx v12_1")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608090154.0inl91XY-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:2342 gfx_v12_1_xcc_kcq_resume() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max
drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:2397 gfx_v12_1_xcc_cp_resume() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max
drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:3723 gfx_v12_1_set_ring_funcs() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max

vim +2342 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c

ad5f1ee0a9b0320 Likun Gao 2025-02-17  2331  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2332  static int gfx_v12_1_xcc_kcq_resume(struct amdgpu_device *adev,
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2333  				    int xcc_id)
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2334  {
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2335  	struct amdgpu_ring *ring = NULL;
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2336  	int r = 0, i;
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2337  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2338  	if (!amdgpu_async_gfx_ring)
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2339  		gfx_v12_1_xcc_cp_compute_enable(adev, true, xcc_id);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2340  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2341  	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
ad5f1ee0a9b0320 Likun Gao 2025-02-17 @2342  		ring = &adev->gfx.compute_ring[i + xcc_id * adev->gfx.num_compute_rings];
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2343  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2344  		r = amdgpu_bo_reserve(ring->mqd_obj, false);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2345  		if (unlikely(r != 0))
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2346  			goto done;
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2347  		r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2348  		if (!r) {
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2349  			r = gfx_v12_1_xcc_kcq_init_queue(ring, xcc_id);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2350  			amdgpu_bo_kunmap(ring->mqd_obj);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2351  			ring->mqd_ptr = NULL;
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2352  		}
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2353  		amdgpu_bo_unreserve(ring->mqd_obj);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2354  		if (r)
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2355  			goto done;
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2356  	}
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2357  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2358  	r = amdgpu_gfx_enable_kcq(adev, xcc_id);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2359  done:
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2360  	return r;
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2361  }
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2362  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2363  static int gfx_v12_1_xcc_cp_resume(struct amdgpu_device *adev,
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2364  				   int xcc_id)
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2365  {
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2366  	int r, i;
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2367  	struct amdgpu_ring *ring;
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2368  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2369  	if (!(adev->flags & AMD_IS_APU))
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2370  		gfx_v12_1_xcc_enable_gui_idle_interrupt(adev, false, xcc_id);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2371  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2372  	if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2373  		/* legacy firmware loading */
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2374  		r = gfx_v12_1_xcc_cp_compute_load_microcode_rs64(adev, xcc_id);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2375  		if (r)
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2376  			return r;
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2377  	}
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2378  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2379  	gfx_v12_1_xcc_cp_set_doorbell_range(adev, xcc_id);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2380  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2381  	if (amdgpu_async_gfx_ring) {
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2382  		gfx_v12_1_xcc_cp_compute_enable(adev, true, xcc_id);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2383  	}
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2384  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2385  	if (adev->enable_mes_kiq && adev->mes.kiq_hw_init)
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2386  		r = amdgpu_mes_kiq_hw_init(adev, xcc_id);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2387  	else
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2388  		r = gfx_v12_1_xcc_kiq_resume(adev, xcc_id);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2389  	if (r)
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2390  		return r;
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2391  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2392  	r = gfx_v12_1_xcc_kcq_resume(adev, xcc_id);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2393  	if (r)
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2394  		return r;
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2395  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2396  	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
ad5f1ee0a9b0320 Likun Gao 2025-02-17 @2397  		ring = &adev->gfx.compute_ring[i + xcc_id * adev->gfx.num_compute_rings];
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2398  		r = amdgpu_ring_test_helper(ring);
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2399  		if (r)
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2400  			return r;
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2401  	}
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2402  
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2403  	return 0;
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2404  }
ad5f1ee0a9b0320 Likun Gao 2025-02-17  2405  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
