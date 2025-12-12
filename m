Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A3283FDB
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 14:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765550644; cv=none; b=ZXcUMfDsqEQL3LxERyqX0U2zLYyTVyXpwPRvcK4PqAe4+LsH7kFwctearqrSvyx3KFImQYu3KwEhCNv6Iq4i2Rr/M26X4vGnSAE9WbqR0GoHAjwGDBq/lyrtdFPLon9/k8UqQh3922YH2W4Y6E+hTie1FnKyh1OIK1ihPotByCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765550644; c=relaxed/simple;
	bh=1ZsECamxvlqbdQDcqJnBQ93NxCwVanNvrpTp8Yn+FuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RFJD45nLS/XrPzftUPAbsmTcS3noqPug/f4rLiomVoHkz/pWBR6Ov0QlXrpRIyLr3Om46+EZfGMuFDaDu46gmbpxQMpPJTXPXAA4ldmXswMtzeCSErWSSEWwnDivNTSbSfSClrtSc4K0AJv0ktlWe3kRj2G7USGwQe17IrBWyfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACPZDx8G; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACPZDx8G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765550643; x=1797086643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZsECamxvlqbdQDcqJnBQ93NxCwVanNvrpTp8Yn+FuQ=;
  b=ACPZDx8G44HWS5epivw6oO9YF+K5VkgDACjTAUBQnAJSH7HNuOJVhuDN
   UxTEvpbvDoq+v7Sxdw3dmP/gGnXVxLEE6EPMoYQKBGCFx4/0sRtQuRY0n
   fx9Nda4cU3UAAwNMOKJ4R3PZiZM0c53lK+2nVx4DtB+3syQH+DqIfroZB
   yZ+CDy/PiENlHKrwuaSyPNblSg62PATn+rFqgD240EYuXSjEiwDo3o+L/
   qxUy6UKI1wD7IsuFvBKCDww5u88LU0k7JlAAA4U4V72AFB4IIeHv/llX/
   GLXobAosNJ2IG09xVv8n4pw0z7SB7ZrcqRRC8iOfsOSpEdWZB5Il0QoEP
   g==;
X-CSE-ConnectionGUID: 64AZH7OHS4amcgHO4CTIag==
X-CSE-MsgGUID: Xbi/NvghROapfvGpuUoCkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="77867736"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="77867736"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 06:44:03 -0800
X-CSE-ConnectionGUID: q+ckltA4SD2aojgvjKf+LQ==
X-CSE-MsgGUID: AQof8mqoQZ6x9//8F6eekw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196179949"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 06:44:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU4NC-000000006B1-34J7;
	Fri, 12 Dec 2025 14:43:58 +0000
Date: Fri, 12 Dec 2025 22:43:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_drm_client.c:350 show_run_ticks() warn:
 iterator 'i' not incremented
Message-ID: <202512122249.QloCDbxo-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Harry Austen <hpausten@protonmail.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: aa18d5769fcafe645a3ba01a9a69dde4f8dc8cc3 drm/xe: Allow dropping kunit dependency as built-in
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: um-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122249.QloCDbxo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512122249.QloCDbxo-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_drm_client.c:350 show_run_ticks() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_exec_queue.c:559 calc_validate_logical_mask() error: uninitialized symbol 'gt_id'.
drivers/gpu/drm/xe/xe_exec_queue.c:560 calc_validate_logical_mask() error: uninitialized symbol 'class'.
drivers/gpu/drm/xe/xe_gsc.c:283 gsc_upload_and_init() error: uninitialized symbol 'fw_ref'.
drivers/gpu/drm/xe/xe_vm.c:3850 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/gpu/drm/xe/xe_exec_queue.c:572 calc_validate_logical_mask() error: uninitialized symbol 'prev_mask'.
drivers/gpu/drm/xe/xe_exec_queue.c:679 xe_exec_queue_create_ioctl() warn: missing unwind goto?
drivers/gpu/drm/xe/xe_exec_queue.c:643 xe_exec_queue_create_ioctl() warn: address of NULL pointer 'q'
drivers/gpu/drm/xe/xe_vm.c:2345 new_vma() error: we previously assumed 'bo' could be null (see line 2319)

vim +/i +350 drivers/gpu/drm/xe/xe_drm_client.c

db696095b08fb7 Lucas De Marchi       2024-11-07  315  
45bb564de0a6f8 Umesh Nerlige Ramappa 2024-05-24  316  static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
188ced1e0ff892 Lucas De Marchi       2024-05-17  317  {
188ced1e0ff892 Lucas De Marchi       2024-05-17  318  	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] = { };
188ced1e0ff892 Lucas De Marchi       2024-05-17  319  	struct xe_file *xef = file->driver_priv;
188ced1e0ff892 Lucas De Marchi       2024-05-17  320  	struct xe_device *xe = xef->xe;
188ced1e0ff892 Lucas De Marchi       2024-05-17  321  	struct xe_gt *gt;
188ced1e0ff892 Lucas De Marchi       2024-05-17  322  	struct xe_hw_engine *hwe;
188ced1e0ff892 Lucas De Marchi       2024-05-17  323  	struct xe_exec_queue *q;
188ced1e0ff892 Lucas De Marchi       2024-05-17  324  	u64 gpu_timestamp;
7fe17fa5ec67e6 Himal Prasad Ghimiray 2024-10-14  325  	unsigned int fw_ref;
188ced1e0ff892 Lucas De Marchi       2024-05-17  326  
94030a1d328325 Marcin Bernatowicz    2025-02-05  327  	/*
94030a1d328325 Marcin Bernatowicz    2025-02-05  328  	 * RING_TIMESTAMP registers are inaccessible in VF mode.
94030a1d328325 Marcin Bernatowicz    2025-02-05  329  	 * Without drm-total-cycles-*, other keys provide little value.
94030a1d328325 Marcin Bernatowicz    2025-02-05  330  	 * Show all or none of the optional "run_ticks" keys in this case.
94030a1d328325 Marcin Bernatowicz    2025-02-05  331  	 */
94030a1d328325 Marcin Bernatowicz    2025-02-05  332  	if (IS_SRIOV_VF(xe))
94030a1d328325 Marcin Bernatowicz    2025-02-05  333  		return;
94030a1d328325 Marcin Bernatowicz    2025-02-05  334  
0fd4380c050d71 Lucas De Marchi       2024-11-07  335  	/*
0fd4380c050d71 Lucas De Marchi       2024-11-07  336  	 * Wait for any exec queue going away: their cycles will get updated on
0fd4380c050d71 Lucas De Marchi       2024-11-07  337  	 * context switch out, so wait for that to happen
0fd4380c050d71 Lucas De Marchi       2024-11-07  338  	 */
0fd4380c050d71 Lucas De Marchi       2024-11-07  339  	wait_var_event(&xef->exec_queue.pending_removal,
0fd4380c050d71 Lucas De Marchi       2024-11-07  340  		       !atomic_read(&xef->exec_queue.pending_removal));
0fd4380c050d71 Lucas De Marchi       2024-11-07  341  
188ced1e0ff892 Lucas De Marchi       2024-05-17  342  	xe_pm_runtime_get(xe);
db696095b08fb7 Lucas De Marchi       2024-11-07  343  	if (!force_wake_get_any_engine(xe, &hwe, &fw_ref)) {
db696095b08fb7 Lucas De Marchi       2024-11-07  344  		xe_pm_runtime_put(xe);
db696095b08fb7 Lucas De Marchi       2024-11-07  345  		return;
db696095b08fb7 Lucas De Marchi       2024-11-07  346  	}
188ced1e0ff892 Lucas De Marchi       2024-05-17  347  
188ced1e0ff892 Lucas De Marchi       2024-05-17  348  	/* Accumulate all the exec queues from this client */
188ced1e0ff892 Lucas De Marchi       2024-05-17  349  	mutex_lock(&xef->exec_queue.lock);
fe4f5d4b661666 Matthew Brost         2024-09-20 @350  	xa_for_each(&xef->exec_queue.xa, i, q) {
fe4f5d4b661666 Matthew Brost         2024-09-20  351  		xe_exec_queue_get(q);
fe4f5d4b661666 Matthew Brost         2024-09-20  352  		mutex_unlock(&xef->exec_queue.lock);
fe4f5d4b661666 Matthew Brost         2024-09-20  353  
45bb564de0a6f8 Umesh Nerlige Ramappa 2024-05-24  354  		xe_exec_queue_update_run_ticks(q);
fe4f5d4b661666 Matthew Brost         2024-09-20  355  
fe4f5d4b661666 Matthew Brost         2024-09-20  356  		mutex_lock(&xef->exec_queue.lock);
fe4f5d4b661666 Matthew Brost         2024-09-20  357  		xe_exec_queue_put(q);
fe4f5d4b661666 Matthew Brost         2024-09-20  358  	}
188ced1e0ff892 Lucas De Marchi       2024-05-17  359  	mutex_unlock(&xef->exec_queue.lock);
188ced1e0ff892 Lucas De Marchi       2024-05-17  360  
188ced1e0ff892 Lucas De Marchi       2024-05-17  361  	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
188ced1e0ff892 Lucas De Marchi       2024-05-17  362  
db696095b08fb7 Lucas De Marchi       2024-11-07  363  	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
188ced1e0ff892 Lucas De Marchi       2024-05-17  364  	xe_pm_runtime_put(xe);
188ced1e0ff892 Lucas De Marchi       2024-05-17  365  
188ced1e0ff892 Lucas De Marchi       2024-05-17  366  	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
188ced1e0ff892 Lucas De Marchi       2024-05-17  367  		const char *class_name;
188ced1e0ff892 Lucas De Marchi       2024-05-17  368  
188ced1e0ff892 Lucas De Marchi       2024-05-17  369  		for_each_gt(gt, xe, gt_id)
188ced1e0ff892 Lucas De Marchi       2024-05-17  370  			capacity[class] += gt->user_engines.instances_per_class[class];
188ced1e0ff892 Lucas De Marchi       2024-05-17  371  
188ced1e0ff892 Lucas De Marchi       2024-05-17  372  		/*
188ced1e0ff892 Lucas De Marchi       2024-05-17  373  		 * Engines may be fused off or not exposed to userspace. Don't
188ced1e0ff892 Lucas De Marchi       2024-05-17  374  		 * return anything if this entire class is not available
188ced1e0ff892 Lucas De Marchi       2024-05-17  375  		 */
188ced1e0ff892 Lucas De Marchi       2024-05-17  376  		if (!capacity[class])
188ced1e0ff892 Lucas De Marchi       2024-05-17  377  			continue;
188ced1e0ff892 Lucas De Marchi       2024-05-17  378  
188ced1e0ff892 Lucas De Marchi       2024-05-17  379  		class_name = xe_hw_engine_class_to_str(class);
188ced1e0ff892 Lucas De Marchi       2024-05-17  380  		drm_printf(p, "drm-cycles-%s:\t%llu\n",
45bb564de0a6f8 Umesh Nerlige Ramappa 2024-05-24  381  			   class_name, xef->run_ticks[class]);
188ced1e0ff892 Lucas De Marchi       2024-05-17  382  		drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
188ced1e0ff892 Lucas De Marchi       2024-05-17  383  			   class_name, gpu_timestamp);
188ced1e0ff892 Lucas De Marchi       2024-05-17  384  
188ced1e0ff892 Lucas De Marchi       2024-05-17  385  		if (capacity[class] > 1)
188ced1e0ff892 Lucas De Marchi       2024-05-17  386  			drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
188ced1e0ff892 Lucas De Marchi       2024-05-17  387  				   class_name, capacity[class]);
188ced1e0ff892 Lucas De Marchi       2024-05-17  388  	}
188ced1e0ff892 Lucas De Marchi       2024-05-17  389  }
188ced1e0ff892 Lucas De Marchi       2024-05-17  390  

:::::: The code at line 350 was first introduced by commit
:::::: fe4f5d4b661666a45b48fe7f95443f8fefc09c8c drm/xe: Clean up VM / exec queue file lock usage.

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Matthew Brost <matthew.brost@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
