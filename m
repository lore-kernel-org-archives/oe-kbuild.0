Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB44530101C
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 11:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677818; cv=none; b=MAh5iCCW6EipWfpVKUXtgQkNjwkImmOkPH67W0aCbfmQWArT+mDUNwOBhCZXnX2CrhDkKl8/E6XDgVrGVlKbcuT3A3l9RgzjY/eKQElc3X4OauOaSGblazYS8sZoYURZWxOItiN/U8/Y2Nlyh5VY+Jw/tFu5xBC1DzPG+EsBUUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677818; c=relaxed/simple;
	bh=uUGCabRYPYN4kdCRTEZGZcy+1wMEg4KPwRhwBoRDZQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iMA4++ippSUu3KdKvp+j1rBgWrqPemoKmpFiy60UbmgEFrUzd7Ji1ktNA4gPyAyZ0G2bzzIiu1mtYGlbcv2sHjprNrCZv+0K3r3jEUUPUV6clmfl5en6B1JAchY47pdNNIPMTae6GTxG1Xwdq/2jChc0hp3xhutj9ro6vgt0mWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBkYta/O; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBkYta/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757677817; x=1789213817;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uUGCabRYPYN4kdCRTEZGZcy+1wMEg4KPwRhwBoRDZQE=;
  b=IBkYta/Ok/7pcawvMjb+mClNTb8LfiWUc4EORyXmIaL5M3JIo4d1LqVL
   rvgPRbVUo3GtSgbRI3otcyX/MatIbVgjl9CCqq+ufeRnwwuYhtqCzql/s
   JNPVLOmsCWXrpMoRfUM6CNZIcf5h1SKaHyU9EwYm3UNkRZkDNvLjCoU3Y
   R4/U06WQs9lEF89v39AmvpLDoAIR8Tz1aZieq14EpyGJCM9RV3Yz+oNvR
   VZI0CbRDM5ns1b/XneuOHbnBjKVRjoSroyCTPYvc3lvSSb8jfE+fOu1S3
   Y23LHnvOoEHFYl5ecf6rFLfDw8c/mYBLUfDQgp63ElyWcIAhPPBaSwEpg
   g==;
X-CSE-ConnectionGUID: rD5r/VJUSm+kuclw8yLf8Q==
X-CSE-MsgGUID: QRuT+QJAQJGaNbph4eqcIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="63652595"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="63652595"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 04:50:14 -0700
X-CSE-ConnectionGUID: mDjWK4AORNSIRKIfn/gLWw==
X-CSE-MsgGUID: C6BUP70YSrWSH6ZA0kAh4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="173247305"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 12 Sep 2025 04:50:14 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux2I6-0000zw-2y;
	Fri, 12 Sep 2025 11:50:10 +0000
Date: Fri, 12 Sep 2025 19:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7387/8719] drivers/gpu/drm/xe/xe_bo.c:2513
 xe_bo_create_pin_map_at_novm() error: uninitialized symbol 'bo'.
Message-ID: <202509121952.ChfqonoQ-lkp@intel.com>
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
commit: e6108eade1b6d8a5ebe0c872fae646df10b024f8 [7387/8719] drm/xe: Convert xe_bo_create_pin_map_at() for exhaustive eviction
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250911 (https://download.01.org/0day-ci/archive/20250912/202509121952.ChfqonoQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509121952.ChfqonoQ-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_bo.c:2513 xe_bo_create_pin_map_at_novm() error: uninitialized symbol 'bo'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_bo.c:2390 xe_bo_create_novm() error: uninitialized symbol 'bo'.
drivers/gpu/drm/xe/xe_bo.c:3115 xe_gem_create_ioctl() error: uninitialized symbol 'bo'.
drivers/gpu/drm/xe/xe_bo.c:3120 xe_gem_create_ioctl() error: uninitialized symbol 'bo'.

vim +/bo +2513 drivers/gpu/drm/xe/xe_bo.c

dd08ebf6c3525a Matthew Brost    2023-03-30  2472  
e6108eade1b6d8 Thomas Hellström 2025-09-08  2473  /**
e6108eade1b6d8 Thomas Hellström 2025-09-08  2474   * xe_bo_create_pin_map_at_novm() - Create pinned and mapped bo at optional VRAM offset
e6108eade1b6d8 Thomas Hellström 2025-09-08  2475   * @xe: The xe device.
e6108eade1b6d8 Thomas Hellström 2025-09-08  2476   * @tile: The tile to select for migration of this bo, and the tile used for
e6108eade1b6d8 Thomas Hellström 2025-09-08  2477   * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
e6108eade1b6d8 Thomas Hellström 2025-09-08  2478   * @size: The storage size to use for the bo.
e6108eade1b6d8 Thomas Hellström 2025-09-08  2479   * @offset: Optional VRAM offset or %~0ull for don't care.
e6108eade1b6d8 Thomas Hellström 2025-09-08  2480   * @type: The TTM buffer object type.
e6108eade1b6d8 Thomas Hellström 2025-09-08  2481   * @flags: XE_BO_FLAG_ flags.
e6108eade1b6d8 Thomas Hellström 2025-09-08  2482   * @alignment: GGTT alignment.
e6108eade1b6d8 Thomas Hellström 2025-09-08  2483   * @intr: Whether to execute any waits for backing store interruptible.
e6108eade1b6d8 Thomas Hellström 2025-09-08  2484   *
e6108eade1b6d8 Thomas Hellström 2025-09-08  2485   * Create a pinned and optionally mapped bo with VRAM offset and GGTT alignment
e6108eade1b6d8 Thomas Hellström 2025-09-08  2486   * options. The bo will be external and not associated with a VM.
e6108eade1b6d8 Thomas Hellström 2025-09-08  2487   *
e6108eade1b6d8 Thomas Hellström 2025-09-08  2488   * Return: The buffer object on success. Negative error pointer on failure.
e6108eade1b6d8 Thomas Hellström 2025-09-08  2489   * In particular, the function may return ERR_PTR(%-EINTR) if @intr was set
e6108eade1b6d8 Thomas Hellström 2025-09-08  2490   * to true on entry.
e6108eade1b6d8 Thomas Hellström 2025-09-08  2491   */
e6108eade1b6d8 Thomas Hellström 2025-09-08  2492  struct xe_bo *
e6108eade1b6d8 Thomas Hellström 2025-09-08  2493  xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
e6108eade1b6d8 Thomas Hellström 2025-09-08  2494  			     size_t size, u64 offset, enum ttm_bo_type type, u32 flags,
e6108eade1b6d8 Thomas Hellström 2025-09-08  2495  			     u64 alignment, bool intr)
e6108eade1b6d8 Thomas Hellström 2025-09-08  2496  {
e6108eade1b6d8 Thomas Hellström 2025-09-08  2497  	struct xe_validation_ctx ctx;
e6108eade1b6d8 Thomas Hellström 2025-09-08  2498  	struct drm_exec exec;
e6108eade1b6d8 Thomas Hellström 2025-09-08  2499  	struct xe_bo *bo;
e6108eade1b6d8 Thomas Hellström 2025-09-08  2500  	int ret = 0;
e6108eade1b6d8 Thomas Hellström 2025-09-08  2501  
e6108eade1b6d8 Thomas Hellström 2025-09-08  2502  	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = intr},
e6108eade1b6d8 Thomas Hellström 2025-09-08  2503  			    ret) {
e6108eade1b6d8 Thomas Hellström 2025-09-08  2504  		bo = xe_bo_create_pin_map_at_aligned(xe, tile, NULL, size, offset,
e6108eade1b6d8 Thomas Hellström 2025-09-08  2505  						     type, flags, alignment, &exec);
e6108eade1b6d8 Thomas Hellström 2025-09-08  2506  		if (IS_ERR(bo)) {
e6108eade1b6d8 Thomas Hellström 2025-09-08  2507  			drm_exec_retry_on_contention(&exec);
e6108eade1b6d8 Thomas Hellström 2025-09-08  2508  			ret = PTR_ERR(bo);
e6108eade1b6d8 Thomas Hellström 2025-09-08  2509  			xe_validation_retry_on_oom(&ctx, &ret);
e6108eade1b6d8 Thomas Hellström 2025-09-08  2510  		}
e6108eade1b6d8 Thomas Hellström 2025-09-08  2511  	}
e6108eade1b6d8 Thomas Hellström 2025-09-08  2512  
e6108eade1b6d8 Thomas Hellström 2025-09-08 @2513  	return ret ? ERR_PTR(ret) : bo;
e6108eade1b6d8 Thomas Hellström 2025-09-08  2514  }
e6108eade1b6d8 Thomas Hellström 2025-09-08  2515  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
