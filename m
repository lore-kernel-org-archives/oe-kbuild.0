Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C58725DB12
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766258206; cv=none; b=hi1FwBZ2UIansrE+geMGvswWU2tkC0mCby6t43/tV08pOpkNvf9kknEp3vlYWz+UUwvpYrJt1WmwlT5X8W/aAP/9vStGpP3OrBa1XXcBGDnbLlhGQgMfMv0aDPYviB997rdxs7bh9jylYH1bueabrta9DZO3hAODitfnOvfk8PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766258206; c=relaxed/simple;
	bh=jYRFlFljOVQSg2+2u2AfCzKJCkZsUUc4pHB+0L4MWwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AeJJqe8zKlQnUWBuXNUvBdxsNBuMzWYsNURdC4zv57fMTFpo4jxnx7Pb23F+yiiZ12UXN1N5whmArx23moF5yXZk83u+1uW4WG5Xjsq/eh76kLhdwpUeTRBTbu1V/CTYvj289PGKORkz0g9X3Qbi5xFE10kLRbNERefrUv9LuYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2dd2hqt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2dd2hqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766258205; x=1797794205;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jYRFlFljOVQSg2+2u2AfCzKJCkZsUUc4pHB+0L4MWwY=;
  b=C2dd2hqtxIEPjufiMjTJwEBoxND8lNvL9gvQ/d+jqOH9jLmnDJsXsk6n
   /ePEUPFdV/6T+oMx4XK4W9qIPNZWQpqRnM0zhFJgvNDKEEwLx+VhRtUZT
   8xPK3otGkecnGEUXCoo595uj7cHHsu6j1FZyXaL2WUZaxnSAEyfoBDqP0
   SlYHyS0HPHcNfKMfn09FBAj0byN5bG0yG+ouhYeFxtP0BGAh/i0qOZ86x
   6OOsCXVjD3LM8x8i7KOtHPK3S+Ycn7pbqD/SEfJtxqg4RZHBJdJqjaT6/
   2Sco4LjXDyqEnTebpYofjPpfWwhajvH9rBE3ei/iujNb3xj1ku7SOOOCW
   w==;
X-CSE-ConnectionGUID: 3McE4QYGQEq1kviFNES5Ag==
X-CSE-MsgGUID: AVKMhjZERhGNKftEmWwewQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72043513"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72043513"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:16:42 -0800
X-CSE-ConnectionGUID: 9WzHjO6uQFe3XrXyF1tfIA==
X-CSE-MsgGUID: 0g8BNfYJSoW+5qS4lVs6EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203287273"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Dec 2025 11:16:41 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2RS-0000000053z-49qu;
	Sat, 20 Dec 2025 19:16:38 +0000
Date: Sun, 21 Dec 2025 03:16:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 547/2671]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:640
 kfd_procfs_add_sysfs_counters() warn: Calling kobject_put|get with
 state->initialized unset from line: 631
Message-ID: <202512210334.ZRd8j65a-lkp@intel.com>
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
TO: Philipp Stanner <phasta@kernel.org>
CC: "Christian König" <christian.koenig@amd.com>
CC: Felix Kuehling <felix.kuehling@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: 06bc18e0def7d926265480faa555bf0b67a35a90 [547/2671] amd/amdkfd: Use dma_fence_check_and_signal()
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20251218 (https://download.01.org/0day-ci/archive/20251221/202512210334.ZRd8j65a-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512210334.ZRd8j65a-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:640 kfd_procfs_add_sysfs_counters() warn: Calling kobject_put|get with state->initialized unset from line: 631

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:594 kfd_procfs_add_sysfs_stats() warn: Calling kobject_put|get with state->initialized unset from line: 582
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:887 kfd_create_process() warn: Calling kobject_put|get with state->initialized unset from line: 877
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1999 signal_eviction_fence() warn: signedness bug returning '(-22)'

vim +640 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c

4327bed2ff8e3d Philip Cox  2020-06-30  608  
751580b3ff9ac6 Philip Yang 2021-06-16  609  static void kfd_procfs_add_sysfs_counters(struct kfd_process *p)
751580b3ff9ac6 Philip Yang 2021-06-16  610  {
751580b3ff9ac6 Philip Yang 2021-06-16  611  	int ret = 0;
751580b3ff9ac6 Philip Yang 2021-06-16  612  	int i;
751580b3ff9ac6 Philip Yang 2021-06-16  613  	char counters_dir_filename[MAX_SYSFS_FILENAME_LEN];
751580b3ff9ac6 Philip Yang 2021-06-16  614  
751580b3ff9ac6 Philip Yang 2021-06-16  615  	if (!p || !p->kobj)
751580b3ff9ac6 Philip Yang 2021-06-16  616  		return;
751580b3ff9ac6 Philip Yang 2021-06-16  617  
751580b3ff9ac6 Philip Yang 2021-06-16  618  	/*
751580b3ff9ac6 Philip Yang 2021-06-16  619  	 * Create sysfs files for each GPU which supports SVM
751580b3ff9ac6 Philip Yang 2021-06-16  620  	 * - proc/<pid>/counters_<gpuid>/
751580b3ff9ac6 Philip Yang 2021-06-16  621  	 * - proc/<pid>/counters_<gpuid>/faults
751580b3ff9ac6 Philip Yang 2021-06-16  622  	 * - proc/<pid>/counters_<gpuid>/page_in
751580b3ff9ac6 Philip Yang 2021-06-16  623  	 * - proc/<pid>/counters_<gpuid>/page_out
751580b3ff9ac6 Philip Yang 2021-06-16  624  	 */
751580b3ff9ac6 Philip Yang 2021-06-16  625  	for_each_set_bit(i, p->svms.bitmap_supported, p->n_pdds) {
751580b3ff9ac6 Philip Yang 2021-06-16  626  		struct kfd_process_device *pdd = p->pdds[i];
751580b3ff9ac6 Philip Yang 2021-06-16  627  		struct kobject *kobj_counters;
751580b3ff9ac6 Philip Yang 2021-06-16  628  
751580b3ff9ac6 Philip Yang 2021-06-16  629  		snprintf(counters_dir_filename, MAX_SYSFS_FILENAME_LEN,
751580b3ff9ac6 Philip Yang 2021-06-16  630  			"counters_%u", pdd->dev->id);
751580b3ff9ac6 Philip Yang 2021-06-16  631  		kobj_counters = kfd_alloc_struct(kobj_counters);
751580b3ff9ac6 Philip Yang 2021-06-16  632  		if (!kobj_counters)
751580b3ff9ac6 Philip Yang 2021-06-16  633  			return;
751580b3ff9ac6 Philip Yang 2021-06-16  634  
751580b3ff9ac6 Philip Yang 2021-06-16  635  		ret = kobject_init_and_add(kobj_counters, &sysfs_counters_type,
751580b3ff9ac6 Philip Yang 2021-06-16  636  					   p->kobj, counters_dir_filename);
751580b3ff9ac6 Philip Yang 2021-06-16  637  		if (ret) {
751580b3ff9ac6 Philip Yang 2021-06-16  638  			pr_warn("Creating KFD proc/%s folder failed",
751580b3ff9ac6 Philip Yang 2021-06-16  639  				counters_dir_filename);
751580b3ff9ac6 Philip Yang 2021-06-16 @640  			kobject_put(kobj_counters);
751580b3ff9ac6 Philip Yang 2021-06-16  641  			return;
751580b3ff9ac6 Philip Yang 2021-06-16  642  		}
751580b3ff9ac6 Philip Yang 2021-06-16  643  
751580b3ff9ac6 Philip Yang 2021-06-16  644  		pdd->kobj_counters = kobj_counters;
751580b3ff9ac6 Philip Yang 2021-06-16  645  		kfd_sysfs_create_file(kobj_counters, &pdd->attr_faults,
751580b3ff9ac6 Philip Yang 2021-06-16  646  				      "faults");
751580b3ff9ac6 Philip Yang 2021-06-16  647  		kfd_sysfs_create_file(kobj_counters, &pdd->attr_page_in,
751580b3ff9ac6 Philip Yang 2021-06-16  648  				      "page_in");
751580b3ff9ac6 Philip Yang 2021-06-16  649  		kfd_sysfs_create_file(kobj_counters, &pdd->attr_page_out,
751580b3ff9ac6 Philip Yang 2021-06-16  650  				      "page_out");
751580b3ff9ac6 Philip Yang 2021-06-16  651  	}
751580b3ff9ac6 Philip Yang 2021-06-16  652  }
4327bed2ff8e3d Philip Cox  2020-06-30  653  

:::::: The code at line 640 was first introduced by commit
:::::: 751580b3ff9ac6bf39da8586e132dbebee2409ef drm/amdkfd: add sysfs counters for vm fault and migration

:::::: TO: Philip Yang <Philip.Yang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
