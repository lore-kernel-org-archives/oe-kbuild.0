Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E0E21362
	for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 04:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716438499; cv=none; b=ka/W/GKSeFXBNUL7Rf9D5t9IzR1Yh/CHimIK2nJxG+fHucCDl1Zn1jLQekh1m6FXxHCZsRWm39V4tcnYceTA/rP2o/17qhmQZv3tFNFDgixCZhI2+KnWXrFKDo7/lp1Md7HaxxX8SgYx8LMVPFCL0xQ0V3HtQe+BpMMzbQgkOss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716438499; c=relaxed/simple;
	bh=8xPtlaHwuvNPZyumAH9nzZ93yaP2hCtGbTIkBEyrAco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XbMt0Q6gVMDsoBTuO8EmsKfgU5AIQ1/NQxBIEpK7r2hyEvZGkFg3dma1orDlq0Ofr1Oh0W8sZlI+l9R7aW2yKVPzy0Rev+fRnQCxhNKhnViIhrY143QfjsTWtcBZ0s4NeNgp1Ec4CSes5u4mOENZzmy4yHwXkXKH5SOCMj09C6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrIcXrDj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrIcXrDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716438497; x=1747974497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8xPtlaHwuvNPZyumAH9nzZ93yaP2hCtGbTIkBEyrAco=;
  b=UrIcXrDjnjm+LdwIpvDeVa4UcrOH8wmzwRgUQcdrYkbmgb1Rhkt+Wkub
   hnqB2OFFS75UJb2gESlzTJdXvomOW5wci9/+/ynq4Xa+7V56GDrx3tZDP
   9LYCWNcB3ZNEofUjq1gq4S6i3zmS/hSPErPcNrwjPveUdS+PPDDqgylKr
   lI0RpTCWCVJ0tL1SSXllOV63Dp9d823hj4BlVwKql+fCi9S7D2fltq2bq
   2SZWYBVV952+LXmkyXGVWp0zZHnsb81U/EdVlHZj5P1RoO6kiLgGP6P01
   pAkohFWkaLsEPOFNWlj+K6MTEYeC9YgbvXAVEJWWXPNkdkhwr6R/OewGW
   Q==;
X-CSE-ConnectionGUID: XQ2gyNIuTiuRecbppGNtLw==
X-CSE-MsgGUID: MehEc9w7RPKT+pO9KzgFuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12605791"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="12605791"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 21:28:16 -0700
X-CSE-ConnectionGUID: lqlsF5GYThegHTGR63cucg==
X-CSE-MsgGUID: f+bA7i4XTcOajpdNqpDODg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="56768324"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 May 2024 21:28:15 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA03o-0002RV-1r;
	Thu, 23 May 2024 04:28:12 +0000
Date: Thu, 23 May 2024 12:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13439/13737]
 drivers/gpu/drm/xe/xe_drm_client.c:272 show_runtime() error: uninitialized
 symbol 'hwe'.
Message-ID: <202405231226.hSDvgv0G-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3689b0ef08b70e4e03b82ebd37730a03a672853a
commit: 188ced1e0ff892f0948f20480e2e0122380ae46d [13439/13737] drm/xe/client: Print runtime to fdinfo
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240523 (https://download.01.org/0day-ci/archive/20240523/202405231226.hSDvgv0G-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405231226.hSDvgv0G-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_drm_client.c:272 show_runtime() error: uninitialized symbol 'hwe'.
drivers/gpu/drm/xe/xe_drm_client.c:292 show_runtime() error: uninitialized symbol 'gpu_timestamp'.

vim +/hwe +272 drivers/gpu/drm/xe/xe_drm_client.c

0845233388f8a2 Tejas Upadhyay  2023-09-15  239  
188ced1e0ff892 Lucas De Marchi 2024-05-17  240  static void show_runtime(struct drm_printer *p, struct drm_file *file)
188ced1e0ff892 Lucas De Marchi 2024-05-17  241  {
188ced1e0ff892 Lucas De Marchi 2024-05-17  242  	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] = { };
188ced1e0ff892 Lucas De Marchi 2024-05-17  243  	struct xe_file *xef = file->driver_priv;
188ced1e0ff892 Lucas De Marchi 2024-05-17  244  	struct xe_device *xe = xef->xe;
188ced1e0ff892 Lucas De Marchi 2024-05-17  245  	struct xe_gt *gt;
188ced1e0ff892 Lucas De Marchi 2024-05-17  246  	struct xe_hw_engine *hwe;
188ced1e0ff892 Lucas De Marchi 2024-05-17  247  	struct xe_exec_queue *q;
188ced1e0ff892 Lucas De Marchi 2024-05-17  248  	u64 gpu_timestamp;
188ced1e0ff892 Lucas De Marchi 2024-05-17  249  
188ced1e0ff892 Lucas De Marchi 2024-05-17  250  	xe_pm_runtime_get(xe);
188ced1e0ff892 Lucas De Marchi 2024-05-17  251  
188ced1e0ff892 Lucas De Marchi 2024-05-17  252  	/* Accumulate all the exec queues from this client */
188ced1e0ff892 Lucas De Marchi 2024-05-17  253  	mutex_lock(&xef->exec_queue.lock);
188ced1e0ff892 Lucas De Marchi 2024-05-17  254  	xa_for_each(&xef->exec_queue.xa, i, q)
188ced1e0ff892 Lucas De Marchi 2024-05-17  255  		xe_exec_queue_update_runtime(q);
188ced1e0ff892 Lucas De Marchi 2024-05-17  256  	mutex_unlock(&xef->exec_queue.lock);
188ced1e0ff892 Lucas De Marchi 2024-05-17  257  
188ced1e0ff892 Lucas De Marchi 2024-05-17  258  	/* Get the total GPU cycles */
188ced1e0ff892 Lucas De Marchi 2024-05-17  259  	for_each_gt(gt, xe, gt_id) {
188ced1e0ff892 Lucas De Marchi 2024-05-17  260  		hwe = xe_gt_any_hw_engine(gt);
188ced1e0ff892 Lucas De Marchi 2024-05-17  261  		if (!hwe)
188ced1e0ff892 Lucas De Marchi 2024-05-17  262  			continue;
188ced1e0ff892 Lucas De Marchi 2024-05-17  263  
188ced1e0ff892 Lucas De Marchi 2024-05-17  264  		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
188ced1e0ff892 Lucas De Marchi 2024-05-17  265  		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
188ced1e0ff892 Lucas De Marchi 2024-05-17  266  		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
188ced1e0ff892 Lucas De Marchi 2024-05-17  267  		break;
188ced1e0ff892 Lucas De Marchi 2024-05-17  268  	}
188ced1e0ff892 Lucas De Marchi 2024-05-17  269  
188ced1e0ff892 Lucas De Marchi 2024-05-17  270  	xe_pm_runtime_put(xe);
188ced1e0ff892 Lucas De Marchi 2024-05-17  271  
188ced1e0ff892 Lucas De Marchi 2024-05-17 @272  	if (unlikely(!hwe))
188ced1e0ff892 Lucas De Marchi 2024-05-17  273  		return;
188ced1e0ff892 Lucas De Marchi 2024-05-17  274  
188ced1e0ff892 Lucas De Marchi 2024-05-17  275  	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
188ced1e0ff892 Lucas De Marchi 2024-05-17  276  		const char *class_name;
188ced1e0ff892 Lucas De Marchi 2024-05-17  277  
188ced1e0ff892 Lucas De Marchi 2024-05-17  278  		for_each_gt(gt, xe, gt_id)
188ced1e0ff892 Lucas De Marchi 2024-05-17  279  			capacity[class] += gt->user_engines.instances_per_class[class];
188ced1e0ff892 Lucas De Marchi 2024-05-17  280  
188ced1e0ff892 Lucas De Marchi 2024-05-17  281  		/*
188ced1e0ff892 Lucas De Marchi 2024-05-17  282  		 * Engines may be fused off or not exposed to userspace. Don't
188ced1e0ff892 Lucas De Marchi 2024-05-17  283  		 * return anything if this entire class is not available
188ced1e0ff892 Lucas De Marchi 2024-05-17  284  		 */
188ced1e0ff892 Lucas De Marchi 2024-05-17  285  		if (!capacity[class])
188ced1e0ff892 Lucas De Marchi 2024-05-17  286  			continue;
188ced1e0ff892 Lucas De Marchi 2024-05-17  287  
188ced1e0ff892 Lucas De Marchi 2024-05-17  288  		class_name = xe_hw_engine_class_to_str(class);
188ced1e0ff892 Lucas De Marchi 2024-05-17  289  		drm_printf(p, "drm-cycles-%s:\t%llu\n",
188ced1e0ff892 Lucas De Marchi 2024-05-17  290  			   class_name, xef->runtime[class]);
188ced1e0ff892 Lucas De Marchi 2024-05-17  291  		drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
188ced1e0ff892 Lucas De Marchi 2024-05-17 @292  			   class_name, gpu_timestamp);
188ced1e0ff892 Lucas De Marchi 2024-05-17  293  
188ced1e0ff892 Lucas De Marchi 2024-05-17  294  		if (capacity[class] > 1)
188ced1e0ff892 Lucas De Marchi 2024-05-17  295  			drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
188ced1e0ff892 Lucas De Marchi 2024-05-17  296  				   class_name, capacity[class]);
188ced1e0ff892 Lucas De Marchi 2024-05-17  297  	}
188ced1e0ff892 Lucas De Marchi 2024-05-17  298  }
188ced1e0ff892 Lucas De Marchi 2024-05-17  299  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
