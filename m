Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1135115748D
	for <oe-kbuild@lists.linux.dev>; Fri, 31 May 2024 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717159891; cv=none; b=XRntD3V+v1AIvsL1heZS2zS4se0Q1NzPVme/r1zg6cqnx0czt1nRlY6imRSfXQaNk85PUdi/yA7O5+jeTFcO9O5QPTUcEkc9QKi6qU872WXrDV4Mn+6Ol45OMqh8oY9y7KVh1U5AxpyMc9NnYaaoU3sC7pyqTTz7PzSFY6D5U8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717159891; c=relaxed/simple;
	bh=4kG6kxVidP73Xv6lTRg3G0B12FpXTATxamYm/Bd/rnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LcdvJjWnTq3E/Nr5N6yrkGYq29RBAKsjv6r3cI7Kai6PI310Bm+3BffVnZpX+uyYFyWy8rco9StbbWUb4IXfmdTTXKUgMLcPpHdF83PMR5jVm1aLSTrqlYzhKmlkWrjC7oXyfBpZkrUFDteyfC4HxcPRAKsy/9lgOMesq0VOfYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hT9oDat3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hT9oDat3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717159889; x=1748695889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4kG6kxVidP73Xv6lTRg3G0B12FpXTATxamYm/Bd/rnY=;
  b=hT9oDat3PAp276or1fr0mhp2XfMlD4ZyLmN2pwhoCCfymvhXTWq+aW0Z
   RCOUYhN3q1UMt/3FWgx3jomyv5QRIbAia1QT2H6Y7BmUcJ9t6qCATHDgT
   kQpiIN8Op3YbPzhinYy9GAMgGyU/rRF7Nh/U18Cb2Re9+tVNFF2sNPRIQ
   v1TxVDa0+t+EJ8d1wvIzTeIYfH4aWlwBCj8u7diV3N8E3gznrj+XmzIw0
   KwFpYlA/KzyEVb47fuePUTb6+eOYE8HYaDWr4I3exHcWI98gSfx0T3l32
   BXSpGg2Nlz7gxY+BgWuY2e8VEaOpJRDOI4ElfP9AAm7uX274ahs7XZy+3
   w==;
X-CSE-ConnectionGUID: LdV0GcW6Sy6COXYIl495NQ==
X-CSE-MsgGUID: ipXpzuXKRwyU2lEeqAW/oQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13569596"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13569596"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 05:51:28 -0700
X-CSE-ConnectionGUID: tNUsKh2zQT2ZVlxEY85MaA==
X-CSE-MsgGUID: Ylsy9sEmRHW58O1kusfgSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="67009862"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 31 May 2024 05:51:27 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD1jA-000H6X-2H;
	Fri, 31 May 2024 12:51:24 +0000
Date: Fri, 31 May 2024 20:50:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1818/3060] drivers/gpu/drm/xe/xe_drm_client.c:272
 show_run_ticks() error: uninitialized symbol 'hwe'.
Message-ID: <202405312056.9ZD5tcmO-lkp@intel.com>
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
TO: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0e1980c40b6edfa68b6acf926bab22448a6e40c9
commit: 45bb564de0a6f87e9f502ceb4ff4d9f936365c85 [1818/3060] drm/xe: Use run_ticks instead of runtime for client stats
:::::: branch date: 7 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20240531 (https://download.01.org/0day-ci/archive/20240531/202405312056.9ZD5tcmO-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405312056.9ZD5tcmO-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_drm_client.c:272 show_run_ticks() error: uninitialized symbol 'hwe'.
drivers/gpu/drm/xe/xe_drm_client.c:292 show_run_ticks() error: uninitialized symbol 'gpu_timestamp'.

vim +/hwe +272 drivers/gpu/drm/xe/xe_drm_client.c

0845233388f8a2 Tejas Upadhyay        2023-09-15  239  
45bb564de0a6f8 Umesh Nerlige Ramappa 2024-05-24  240  static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
188ced1e0ff892 Lucas De Marchi       2024-05-17  241  {
188ced1e0ff892 Lucas De Marchi       2024-05-17  242  	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] = { };
188ced1e0ff892 Lucas De Marchi       2024-05-17  243  	struct xe_file *xef = file->driver_priv;
188ced1e0ff892 Lucas De Marchi       2024-05-17  244  	struct xe_device *xe = xef->xe;
188ced1e0ff892 Lucas De Marchi       2024-05-17  245  	struct xe_gt *gt;
188ced1e0ff892 Lucas De Marchi       2024-05-17  246  	struct xe_hw_engine *hwe;
188ced1e0ff892 Lucas De Marchi       2024-05-17  247  	struct xe_exec_queue *q;
188ced1e0ff892 Lucas De Marchi       2024-05-17  248  	u64 gpu_timestamp;
188ced1e0ff892 Lucas De Marchi       2024-05-17  249  
188ced1e0ff892 Lucas De Marchi       2024-05-17  250  	xe_pm_runtime_get(xe);
188ced1e0ff892 Lucas De Marchi       2024-05-17  251  
188ced1e0ff892 Lucas De Marchi       2024-05-17  252  	/* Accumulate all the exec queues from this client */
188ced1e0ff892 Lucas De Marchi       2024-05-17  253  	mutex_lock(&xef->exec_queue.lock);
188ced1e0ff892 Lucas De Marchi       2024-05-17  254  	xa_for_each(&xef->exec_queue.xa, i, q)
45bb564de0a6f8 Umesh Nerlige Ramappa 2024-05-24  255  		xe_exec_queue_update_run_ticks(q);
188ced1e0ff892 Lucas De Marchi       2024-05-17  256  	mutex_unlock(&xef->exec_queue.lock);
188ced1e0ff892 Lucas De Marchi       2024-05-17  257  
188ced1e0ff892 Lucas De Marchi       2024-05-17  258  	/* Get the total GPU cycles */
188ced1e0ff892 Lucas De Marchi       2024-05-17  259  	for_each_gt(gt, xe, gt_id) {
188ced1e0ff892 Lucas De Marchi       2024-05-17  260  		hwe = xe_gt_any_hw_engine(gt);
188ced1e0ff892 Lucas De Marchi       2024-05-17  261  		if (!hwe)
188ced1e0ff892 Lucas De Marchi       2024-05-17  262  			continue;
188ced1e0ff892 Lucas De Marchi       2024-05-17  263  
188ced1e0ff892 Lucas De Marchi       2024-05-17  264  		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
188ced1e0ff892 Lucas De Marchi       2024-05-17  265  		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
188ced1e0ff892 Lucas De Marchi       2024-05-17  266  		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
188ced1e0ff892 Lucas De Marchi       2024-05-17  267  		break;
188ced1e0ff892 Lucas De Marchi       2024-05-17  268  	}
188ced1e0ff892 Lucas De Marchi       2024-05-17  269  
188ced1e0ff892 Lucas De Marchi       2024-05-17  270  	xe_pm_runtime_put(xe);
188ced1e0ff892 Lucas De Marchi       2024-05-17  271  
188ced1e0ff892 Lucas De Marchi       2024-05-17 @272  	if (unlikely(!hwe))
188ced1e0ff892 Lucas De Marchi       2024-05-17  273  		return;
188ced1e0ff892 Lucas De Marchi       2024-05-17  274  
188ced1e0ff892 Lucas De Marchi       2024-05-17  275  	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
188ced1e0ff892 Lucas De Marchi       2024-05-17  276  		const char *class_name;
188ced1e0ff892 Lucas De Marchi       2024-05-17  277  
188ced1e0ff892 Lucas De Marchi       2024-05-17  278  		for_each_gt(gt, xe, gt_id)
188ced1e0ff892 Lucas De Marchi       2024-05-17  279  			capacity[class] += gt->user_engines.instances_per_class[class];
188ced1e0ff892 Lucas De Marchi       2024-05-17  280  
188ced1e0ff892 Lucas De Marchi       2024-05-17  281  		/*
188ced1e0ff892 Lucas De Marchi       2024-05-17  282  		 * Engines may be fused off or not exposed to userspace. Don't
188ced1e0ff892 Lucas De Marchi       2024-05-17  283  		 * return anything if this entire class is not available
188ced1e0ff892 Lucas De Marchi       2024-05-17  284  		 */
188ced1e0ff892 Lucas De Marchi       2024-05-17  285  		if (!capacity[class])
188ced1e0ff892 Lucas De Marchi       2024-05-17  286  			continue;
188ced1e0ff892 Lucas De Marchi       2024-05-17  287  
188ced1e0ff892 Lucas De Marchi       2024-05-17  288  		class_name = xe_hw_engine_class_to_str(class);
188ced1e0ff892 Lucas De Marchi       2024-05-17  289  		drm_printf(p, "drm-cycles-%s:\t%llu\n",
45bb564de0a6f8 Umesh Nerlige Ramappa 2024-05-24  290  			   class_name, xef->run_ticks[class]);
188ced1e0ff892 Lucas De Marchi       2024-05-17  291  		drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
188ced1e0ff892 Lucas De Marchi       2024-05-17 @292  			   class_name, gpu_timestamp);
188ced1e0ff892 Lucas De Marchi       2024-05-17  293  
188ced1e0ff892 Lucas De Marchi       2024-05-17  294  		if (capacity[class] > 1)
188ced1e0ff892 Lucas De Marchi       2024-05-17  295  			drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
188ced1e0ff892 Lucas De Marchi       2024-05-17  296  				   class_name, capacity[class]);
188ced1e0ff892 Lucas De Marchi       2024-05-17  297  	}
188ced1e0ff892 Lucas De Marchi       2024-05-17  298  }
188ced1e0ff892 Lucas De Marchi       2024-05-17  299  

:::::: The code at line 272 was first introduced by commit
:::::: 188ced1e0ff892f0948f20480e2e0122380ae46d drm/xe/client: Print runtime to fdinfo

:::::: TO: Lucas De Marchi <lucas.demarchi@intel.com>
:::::: CC: Lucas De Marchi <lucas.demarchi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
