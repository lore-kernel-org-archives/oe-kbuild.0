Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC4A1940AB
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jun 2024 23:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719446085; cv=none; b=gfTMi6k2X+0oNFgx6+WSxu0k8Eb/BXMD7gw//xwhOL4RQkCkKs7BZVJnZBt1q+++19r4SaqIpZzXWCLDAnF2Z+24tLX5ZwvmnDhjg9lTd8PBQu8RBGyOo+zf9A5+p9gX+0o2CSQd7aeyuICDCUtsssurU+arbJcn4xd21j2xExM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719446085; c=relaxed/simple;
	bh=32gk5VN7rCTjDFvkRRkwFjiwhAxxc3nzwjTkcA4gTvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EwdE9szlQaNTSi0ucKIJWsbNZx1xiQ3ilVPSoZo4JiRQqptYDk7KqKhGgL0LjGHo1ufKBEplIY9BP7yrwJrZYg0yCZrYqWAxW5fBk/tAfYxZ6aWf4zETt311T+cPxACFc93kdXA1w6/AP30hPivu5nGKZywj5XZ2319GhAZpEbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVBFdtA4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVBFdtA4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719446083; x=1750982083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=32gk5VN7rCTjDFvkRRkwFjiwhAxxc3nzwjTkcA4gTvU=;
  b=KVBFdtA4CMHnav/Tj9xwf/RIozMP0TDB4a/Jywt1A6qVTMmw/2Dg2F+F
   lI98lDb6rf7Y+t0PT3QJH94nOCTXlygR7NQvWzR+0MFa80rkVTlOXxx2T
   0T1cueei8U6PveX27c8sMr/urWtEDigIbln39Cu2BPajGf43WbheZAGz1
   L8nVYemfA0sriVTKVMUYwzLeb37ieMbzlgVqCmYN9tKBF5RrICdAQvhrL
   kMdTTDiWyuw4LUI6FFBA6p3L3mdSj29SZTNTaokYa4f4N7q5YHfcLaQDm
   iMlt4B7m6Wt+DKMUE4mC2HH7Asrr4UmlniaASzl4pD7VWmOzGzOT7wQHw
   g==;
X-CSE-ConnectionGUID: 6qKtnVEOQrOXGeMM+gLGdA==
X-CSE-MsgGUID: bSMMcCN1TJuzlncl2Kb+aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20370884"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="20370884"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 16:54:42 -0700
X-CSE-ConnectionGUID: bQ255m0SQfa6Fyatr0soOg==
X-CSE-MsgGUID: kfK8ggP7RUic+wz95kV+qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="48793033"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jun 2024 16:54:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMcTG-000FgO-1e;
	Wed, 26 Jun 2024 23:54:38 +0000
Date: Thu, 27 Jun 2024 07:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1767/8719] drivers/gpu/drm/xe/xe_drm_client.c:254
 show_run_ticks() warn: iterator 'i' not incremented
Message-ID: <202406270727.YvprTAi4-lkp@intel.com>
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
head:   df9574a57d02b265322e77fb8628d4d33641dda9
commit: 45bb564de0a6f87e9f502ceb4ff4d9f936365c85 [1767/8719] drm/xe: Use run_ticks instead of runtime for client stats
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-141-20240626 (https://download.01.org/0day-ci/archive/20240627/202406270727.YvprTAi4-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406270727.YvprTAi4-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_drm_client.c:254 show_run_ticks() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/gpu/drm/xe/xe_drm_client.c:272 show_run_ticks() error: uninitialized symbol 'hwe'.
drivers/gpu/drm/xe/xe_drm_client.c:292 show_run_ticks() error: uninitialized symbol 'gpu_timestamp'.

vim +/i +254 drivers/gpu/drm/xe/xe_drm_client.c

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
188ced1e0ff892 Lucas De Marchi       2024-05-17 @254  	xa_for_each(&xef->exec_queue.xa, i, q)
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
188ced1e0ff892 Lucas De Marchi       2024-05-17  272  	if (unlikely(!hwe))
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
188ced1e0ff892 Lucas De Marchi       2024-05-17  292  			   class_name, gpu_timestamp);
188ced1e0ff892 Lucas De Marchi       2024-05-17  293  
188ced1e0ff892 Lucas De Marchi       2024-05-17  294  		if (capacity[class] > 1)
188ced1e0ff892 Lucas De Marchi       2024-05-17  295  			drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
188ced1e0ff892 Lucas De Marchi       2024-05-17  296  				   class_name, capacity[class]);
188ced1e0ff892 Lucas De Marchi       2024-05-17  297  	}
188ced1e0ff892 Lucas De Marchi       2024-05-17  298  }
188ced1e0ff892 Lucas De Marchi       2024-05-17  299  

:::::: The code at line 254 was first introduced by commit
:::::: 188ced1e0ff892f0948f20480e2e0122380ae46d drm/xe/client: Print runtime to fdinfo

:::::: TO: Lucas De Marchi <lucas.demarchi@intel.com>
:::::: CC: Lucas De Marchi <lucas.demarchi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
