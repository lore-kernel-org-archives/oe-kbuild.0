Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724B53385BF
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 18:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959354; cv=none; b=E5S7t28t5vxU9ZsIfF4jnFXPx8eIPSVu7Wvp3FgJAkL0GICF73XfjlTaV8j67ZxxQWR+0EiExvQtD9irwHaUzqpw8ilxwlXtbKzAuSIfYilMZ+QprJfTky6OcrTOMOxUCLHvpHEJWik9AIC22x5Z0GCHyn6pq0qxHQMGYkZJH2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959354; c=relaxed/simple;
	bh=eJ/eOOOyrM4bWdrdzhVgBoMUk91oZ1Hz4W+AoQCMZtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LFFFj3HHCzFPvjI3zYsCW6Iife59YiqP/Jm9mcLLbRdPx2Fm+bUVUhqsM1RV8JzVw2US0VuJmq0a1GHcVgr9V1GcBmkqEEbpOG6y3V7WZ+O5NUBcY5HaI2ryi7+IkWGimexLGtEiPvLHJTOiv+Lbn2OAQEefEcpi2oY01XJ9mSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbAAJzCb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbAAJzCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764959353; x=1796495353;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eJ/eOOOyrM4bWdrdzhVgBoMUk91oZ1Hz4W+AoQCMZtI=;
  b=AbAAJzCbLlWQO1EHCETUkU48yiRJu+RzXaVsiP0FxUHYvPwhWkfYeLU3
   LPx/qXjE0E2hqrbBp0PfQ0uLwUOW/cE7Ua6EEsnYRUXdojCKVpP6VHsOE
   VqtwJeAcaxiBVD6xjx1Tlc+k1UIz+On/wnhSyc9t0e8G1soF3AfHuOSYh
   /aRL+X7zubjw5TBPUnmP9PT0HT0U2gqcRZuPN3OCgGRrqmN5xY/60jOBW
   BoippZE79HYB4B5k2ief4zp3UmphNAIqVYCJrI06t9oP9WDFIR4V/EcFX
   zwoLSJ/mMriA0YUI0ZIQYLl/JCTVDOvuPM9gJnn4XYvEsjGkwzN+oGQQ5
   w==;
X-CSE-ConnectionGUID: GS2rnUP4Q0iaEXgcW7tCEA==
X-CSE-MsgGUID: AsLNa4/yQd+0CW6dSwXvbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77321361"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="77321361"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 10:29:10 -0800
X-CSE-ConnectionGUID: 4e2hFz9xRh+5ohw8gihj1Q==
X-CSE-MsgGUID: U8go30cPSUavq6AXsWJXPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="226008665"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Dec 2025 10:29:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRaYE-00000000FMH-1FRd;
	Fri, 05 Dec 2025 18:29:06 +0000
Date: Sat, 6 Dec 2025 02:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agd5f:amd-staging-drm-next 2373/2507]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1867 amdgpu_ttm_mmio_remap_bo_init()
 warn: variable dereferenced before check 'adev->rmmio_remap.bo' (see line
 1851)
Message-ID: <202512060239.vfGlJ37r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
CC: SRINIVASAN SHANMUGAM <SRINIVASAN.SHANMUGAM@amd.com>
CC: "Christian König" <christian.koenig@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   074d1b1468931eefcb1fa54f4509fffe3161a42e
commit: be4c25b157764f6dec4236b0adc1e33f84259d7c [2373/2507] drm/amdgpu/ttm: Pin 4K MMIO_REMAP Singleton BO at Init v2
:::::: branch date: 3 days ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20251205 (https://download.01.org/0day-ci/archive/20251206/202512060239.vfGlJ37r-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512060239.vfGlJ37r-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1867 amdgpu_ttm_mmio_remap_bo_init() warn: variable dereferenced before check 'adev->rmmio_remap.bo' (see line 1851)

vim +1867 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c

1e03322cfef9b8 Philip Yang          2023-02-27  1809  
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1810  /**
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1811   * amdgpu_ttm_mmio_remap_bo_init - Allocate the singleton 4K MMIO_REMAP BO
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1812   * @adev: amdgpu device
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1813   *
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1814   * Allocates a one-page (4K) GEM BO in AMDGPU_GEM_DOMAIN_MMIO_REMAP when the
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1815   * hardware exposes a remap base (adev->rmmio_remap.bus_addr) and the host
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1816   * PAGE_SIZE is <= AMDGPU_GPU_PAGE_SIZE (4K). The BO is created as a regular
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1817   * GEM object (amdgpu_bo_create).
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1818   *
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1819   * The BO is created as a normal GEM object via amdgpu_bo_create(), then
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1820   * reserved and pinned at the TTM level (ttm_bo_pin()) so it can never be
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1821   * migrated or evicted. No CPU mapping is established here.
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1822   *
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1823   * Return:
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1824   *  * 0 on success or intentional skip (feature not present/unsupported)
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1825   *  * negative errno on allocation failure
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1826   */
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1827  static int amdgpu_ttm_mmio_remap_bo_init(struct amdgpu_device *adev)
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1828  {
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1829  	struct amdgpu_bo_param bp;
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1830  	int r;
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1831  
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1832  	/* Skip if HW doesn't expose remap, or if PAGE_SIZE > AMDGPU_GPU_PAGE_SIZE (4K). */
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1833  	if (!adev->rmmio_remap.bus_addr || PAGE_SIZE > AMDGPU_GPU_PAGE_SIZE)
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1834  		return 0;
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1835  
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1836  	memset(&bp, 0, sizeof(bp));
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1837  
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1838  	/* Create exactly one GEM BO in the MMIO_REMAP domain. */
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1839  	bp.type        = ttm_bo_type_device;          /* userspace-mappable GEM */
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1840  	bp.size        = AMDGPU_GPU_PAGE_SIZE;        /* 4K */
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1841  	bp.byte_align  = AMDGPU_GPU_PAGE_SIZE;
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1842  	bp.domain      = AMDGPU_GEM_DOMAIN_MMIO_REMAP;
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1843  	bp.flags       = 0;
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1844  	bp.resv        = NULL;
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1845  	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1846  
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1847  	r = amdgpu_bo_create(adev, &bp, &adev->rmmio_remap.bo);
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1848  	if (r)
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1849  		return r;
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1850  
be4c25b157764f Srinivasan Shanmugam 2025-10-06 @1851  	r = amdgpu_bo_reserve(adev->rmmio_remap.bo, true);
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1852  	if (r)
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1853  		goto err_unref;
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1854  
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1855  	/*
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1856  	 * MMIO_REMAP is a fixed I/O placement (AMDGPU_PL_MMIO_REMAP).
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1857  	 * Use TTM-level pin so the BO cannot be evicted/migrated,
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1858  	 * independent of GEM domains. This
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1859  	 * enforces the “fixed I/O window”
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1860  	 */
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1861  	ttm_bo_pin(&adev->rmmio_remap.bo->tbo);
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1862  
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1863  	amdgpu_bo_unreserve(adev->rmmio_remap.bo);
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1864  	return 0;
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1865  
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1866  err_unref:
be4c25b157764f Srinivasan Shanmugam 2025-10-06 @1867  	if (adev->rmmio_remap.bo)
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1868  		amdgpu_bo_unref(&adev->rmmio_remap.bo);
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1869  	adev->rmmio_remap.bo = NULL;
be4c25b157764f Srinivasan Shanmugam 2025-10-06  1870  	return r;
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1871  }
2f711aebfa6496 Srinivasan Shanmugam 2025-08-28  1872  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
