Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0E8188580
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 15:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757692735; cv=none; b=YE34JQztrTm0t5qaOtPvRmL8OrH1N8GWYrkZ5+WRXvB7GRygZq2SmHyVgbkUCuFFyMppwrdw2lSkMr98naJ1Y1XdVie51LTq89I91c4wN9cHr3vl1bZ6iBsm9cGvq+JsdVJ5nduDIiVtXGK5VUorOYZG8iBNEkG1iH4epETSY/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757692735; c=relaxed/simple;
	bh=eTR/HqAJ8e4/drXQkIa5hHS8rJhMb/reLi1G/2fh3uI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LBSvAX4lgjD3+lCasGBZVX9cf7VjP2LS1YwZ76FgPTtd5X5dXjf2Qs3Y3C0zwogA6fj/QshM/nhzJAJQkjbjO3Ld49O5MJPseswItSOQwMA830vvT3WA4q7NecEGPIeMYB95+IjGaCGorYDMhKrZe2FwOdUqD+LPTbObt0JRpmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmZBfxaT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmZBfxaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757692734; x=1789228734;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eTR/HqAJ8e4/drXQkIa5hHS8rJhMb/reLi1G/2fh3uI=;
  b=bmZBfxaT6eE51074GBL9yrYvQANhlQAzFJ8QUQsqYB/x7/qW4gZoF7wn
   rS+k2c0zQTI6fO9uRMDnP5MjSBvN3zEbVjBbJw6J1j8Vw1nHyLDmrH5fX
   0au8DNov1gzCUlZ7uW5gaLXLSIPKvw+IfpkuRY7ErgZqb5aiN7gNN8Whd
   Lte6v7RkPAdgDa0g7iVmVQYsiTIj933nuTuw2MtGQr6+pMft/hUDBIN+0
   P31qgpXQn/Gtrfa0ObTArF9FqnF/KHwGQPdUZ63N9e6t3K5WQ6XOnXC6A
   cIyoqkq3SsRjMbVgs5bX6YuFeg0ljtys6JK6TUC6RbX8NClpcaYaLXvjR
   w==;
X-CSE-ConnectionGUID: EMjpUVwBReGn66ojUd5Ekw==
X-CSE-MsgGUID: OwrglBU1T2WaDabD+fXJBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="70296420"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="70296420"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 08:58:53 -0700
X-CSE-ConnectionGUID: /hYjh78/ToqOmAnH/dUqsA==
X-CSE-MsgGUID: pqjb+1s5QvewamM/+o1stg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="178346100"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 12 Sep 2025 08:58:51 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux6Aj-00015A-0w;
	Fri, 12 Sep 2025 15:58:49 +0000
Date: Fri, 12 Sep 2025 23:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7389/8719] drivers/gpu/drm/xe/xe_bo.c:2446
 xe_bo_create_pin_range_novm() error: uninitialized symbol 'bo'.
Message-ID: <202509122328.JDGUFyAN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
commit: 1f1541720f651727591411e68c16299de0447b43 [7389/8719] drm/xe: Rework instances of variants of xe_bo_create_locked()
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250911 (https://download.01.org/0day-ci/archive/20250912/202509122328.JDGUFyAN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509122328.JDGUFyAN-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_bo.c:2446 xe_bo_create_pin_range_novm() error: uninitialized symbol 'bo'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_bo.c:2359 xe_bo_create_novm() error: uninitialized symbol 'bo'.
drivers/gpu/drm/xe/xe_bo.c:2531 xe_bo_create_pin_map_at_novm() error: uninitialized symbol 'bo'.
drivers/gpu/drm/xe/xe_bo.c:3175 xe_gem_create_ioctl() error: uninitialized symbol 'bo'.
drivers/gpu/drm/xe/xe_bo.c:3180 xe_gem_create_ioctl() error: uninitialized symbol 'bo'.

vim +/bo +2446 drivers/gpu/drm/xe/xe_bo.c

dd08ebf6c3525a Matthew Brost    2023-03-30  2399  
1f1541720f6517 Thomas Hellström 2025-09-08  2400  /**
1f1541720f6517 Thomas Hellström 2025-09-08  2401   * xe_bo_create_pin_range_novm() - Create and pin a BO with range options.
1f1541720f6517 Thomas Hellström 2025-09-08  2402   * @xe: The xe device.
1f1541720f6517 Thomas Hellström 2025-09-08  2403   * @tile: The tile to select for migration of this bo, and the tile used for
1f1541720f6517 Thomas Hellström 2025-09-08  2404   * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
1f1541720f6517 Thomas Hellström 2025-09-08  2405   * @size: The storage size to use for the bo.
1f1541720f6517 Thomas Hellström 2025-09-08  2406   * @start: Start of fixed VRAM range or 0.
1f1541720f6517 Thomas Hellström 2025-09-08  2407   * @end: End of fixed VRAM range or ~0ULL.
1f1541720f6517 Thomas Hellström 2025-09-08  2408   * @type: The TTM buffer object type.
1f1541720f6517 Thomas Hellström 2025-09-08  2409   * @flags: XE_BO_FLAG_ flags.
1f1541720f6517 Thomas Hellström 2025-09-08  2410   *
1f1541720f6517 Thomas Hellström 2025-09-08  2411   * Create an Xe BO with range- and options. If @start and @end indicate
1f1541720f6517 Thomas Hellström 2025-09-08  2412   * a fixed VRAM range, this must be a ttm_bo_type_kernel bo with VRAM placement
1f1541720f6517 Thomas Hellström 2025-09-08  2413   * only.
1f1541720f6517 Thomas Hellström 2025-09-08  2414   *
1f1541720f6517 Thomas Hellström 2025-09-08  2415   * Return: The buffer object on success. Negative error pointer on failure.
1f1541720f6517 Thomas Hellström 2025-09-08  2416   */
1f1541720f6517 Thomas Hellström 2025-09-08  2417  struct xe_bo *xe_bo_create_pin_range_novm(struct xe_device *xe, struct xe_tile *tile,
1f1541720f6517 Thomas Hellström 2025-09-08  2418  					  size_t size, u64 start, u64 end,
1f1541720f6517 Thomas Hellström 2025-09-08  2419  					  enum ttm_bo_type type, u32 flags)
1f1541720f6517 Thomas Hellström 2025-09-08  2420  {
1f1541720f6517 Thomas Hellström 2025-09-08  2421  	struct xe_validation_ctx ctx;
1f1541720f6517 Thomas Hellström 2025-09-08  2422  	struct drm_exec exec;
1f1541720f6517 Thomas Hellström 2025-09-08  2423  	struct xe_bo *bo;
1f1541720f6517 Thomas Hellström 2025-09-08  2424  	int err = 0;
1f1541720f6517 Thomas Hellström 2025-09-08  2425  
1f1541720f6517 Thomas Hellström 2025-09-08  2426  	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
1f1541720f6517 Thomas Hellström 2025-09-08  2427  		bo = __xe_bo_create_locked(xe, tile, NULL, size, start, end,
1f1541720f6517 Thomas Hellström 2025-09-08  2428  					   0, type, flags, 0, &exec);
1f1541720f6517 Thomas Hellström 2025-09-08  2429  		if (IS_ERR(bo)) {
1f1541720f6517 Thomas Hellström 2025-09-08  2430  			drm_exec_retry_on_contention(&exec);
1f1541720f6517 Thomas Hellström 2025-09-08  2431  			err = PTR_ERR(bo);
1f1541720f6517 Thomas Hellström 2025-09-08  2432  			xe_validation_retry_on_oom(&ctx, &err);
1f1541720f6517 Thomas Hellström 2025-09-08  2433  			break;
1f1541720f6517 Thomas Hellström 2025-09-08  2434  		}
1f1541720f6517 Thomas Hellström 2025-09-08  2435  
1f1541720f6517 Thomas Hellström 2025-09-08  2436  		err = xe_bo_pin(bo, &exec);
1f1541720f6517 Thomas Hellström 2025-09-08  2437  		xe_bo_unlock(bo);
1f1541720f6517 Thomas Hellström 2025-09-08  2438  		if (err) {
1f1541720f6517 Thomas Hellström 2025-09-08  2439  			xe_bo_put(bo);
1f1541720f6517 Thomas Hellström 2025-09-08  2440  			drm_exec_retry_on_contention(&exec);
1f1541720f6517 Thomas Hellström 2025-09-08  2441  			xe_validation_retry_on_oom(&ctx, &err);
1f1541720f6517 Thomas Hellström 2025-09-08  2442  			break;
1f1541720f6517 Thomas Hellström 2025-09-08  2443  		}
1f1541720f6517 Thomas Hellström 2025-09-08  2444  	}
1f1541720f6517 Thomas Hellström 2025-09-08  2445  
1f1541720f6517 Thomas Hellström 2025-09-08 @2446  	return err ? ERR_PTR(err) : bo;
1f1541720f6517 Thomas Hellström 2025-09-08  2447  }
1f1541720f6517 Thomas Hellström 2025-09-08  2448  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
