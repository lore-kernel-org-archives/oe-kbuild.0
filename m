Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA8E256D
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 00:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765585366; cv=none; b=SrnUBEI0pVFdYb0Utn7xMbafWZPUDDA4TsKWVxXFainUm5sztE9n50EjhB/g6kxnX7dFsgTIYgqxZeTT9hZwg+LS9/AtQeQSUun6gYuCIeg8WjzH+BjWIeDDGPwm0WRY8qVYPyddVo4YiQ4Dt3FDZVn/dntz6g+YArjMth3dYJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765585366; c=relaxed/simple;
	bh=osTYjHcDGL2vaW9QNJC8wyJ2fvbQNnob8f69w1Fy1xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5UrtzlFTsxtTbI3ZtewReU7Zj56FiBjvm97DTjah5fhO/1kdGvjO0aM0koPa52HlhvZJPtuOpmOHgE/R234XNMRVkm/px8oI0qO57YX8jWvbpr0RU43D7VbTQsmW7LzcJaO6GbB8bPs6svBXI8aj6Ih9IsBlN9+gEECEQY3Ed8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvrBi+nh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvrBi+nh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765585365; x=1797121365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=osTYjHcDGL2vaW9QNJC8wyJ2fvbQNnob8f69w1Fy1xQ=;
  b=gvrBi+nh8Tilg6qWHz8JzrEwRVzpW1yTGxdG3yNbhvRV+/eSyCT7a6tL
   aMak//PKUBpyJ7LZYJ4cwXWLUTTBVAWAGlG+hMGQN37jrwh2aWwaQwU6f
   ZPFBXWITFucaf4U3IYQkXTVeKsgJLY8jqtDIFj1NvSfqIbugy7xWFsiH5
   VmaWkFW0MIiH453SRsvnnnEB6XTDG3UfZsINom53Y4IxYorUF986Rouch
   PoP9l6uZ6+ouaJ8BqDwgtHULysciodqlDNpWVngNCFPaTblC6P9y7OA64
   PEAOScJS56zN9PgETJbYk/l2+9HZ8ZRf35owyhccdQcDVPtPCHZPx+LUD
   A==;
X-CSE-ConnectionGUID: 3eLRsHqRTN64TuhvM7/QtQ==
X-CSE-MsgGUID: Blqm3c4ESGC+zQRkR8qTTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67533199"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67533199"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 16:22:44 -0800
X-CSE-ConnectionGUID: 2qi/Q8ocRy2zCfyE5JUJXQ==
X-CSE-MsgGUID: Suk2XuilRUSavE8MxPAbEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="234614699"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 16:22:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUDPE-000000006ot-2W5P;
	Sat, 13 Dec 2025 00:22:40 +0000
Date: Sat, 13 Dec 2025 08:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_drm_client.c:350 show_run_ticks() warn:
 iterator 'i' not incremented
Message-ID: <202512130823.wOBpF3tt-lkp@intel.com>
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
:::::: branch date: 14 hours ago
:::::: commit date: 5 months ago
config: um-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130823.wOBpF3tt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130823.wOBpF3tt-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_drm_client.c:350 show_run_ticks() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_gsc.c:283 gsc_upload_and_init() error: uninitialized symbol 'fw_ref'.
drivers/gpu/drm/xe/xe_exec_queue.c:559 calc_validate_logical_mask() error: uninitialized symbol 'gt_id'.
drivers/gpu/drm/xe/xe_exec_queue.c:560 calc_validate_logical_mask() error: uninitialized symbol 'class'.
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
