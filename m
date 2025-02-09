Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9404F4C9F
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Feb 2025 06:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739083151; cv=none; b=UUDTo95a/g0HR3ej14yDjyCAXLxeYtlSnmavIxViPak/gis6HbicHMia2KLN+FiiT+S14/HoIXIbWBg+2L2jh9+j1TRix8WHW3s2+7h+hwGkVmiXpJRSNnJq1PD0Dl7Smkg/vOOpJe5tTs5OD80YVSdDExltZnNZ/gnPwG2rZPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739083151; c=relaxed/simple;
	bh=b5RNFyrP2h5snpPg5wm9VVtfZ2ckmbF6cSwWTOhQ9FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eMWk7ZwiUY4sqB5u0XfP14crqjVC/3UrQZvFjTta5L4C0R6i2NvTFoYCKpXru4gHDIRjWHUeq5pFg7aiYuIXxxlNxFHDMaRyiwFGz5y3rh75kBoQdpQANvgfPo7ne3AGcJ1vpe0APYWYUwckEtLJ2HVGfmFOJ/svRmcN8wA6dIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alkde/DZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alkde/DZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739083148; x=1770619148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b5RNFyrP2h5snpPg5wm9VVtfZ2ckmbF6cSwWTOhQ9FQ=;
  b=alkde/DZ21OcVNAe465/Bos8qEefqhw2expxfO0JejOBa+35crt5zDZQ
   jJNmN6DZGi1gRjuaNGkkBRKSPV9BOEs37Y+uRJApl+CMfgf3A1lms/XOV
   mXKTfnMf7mA7gUgLJJM4Elx0HLmuQmru07uEP/SJGWdtrNJ9b95l4ZAXa
   Zh/wJr3RbOczHo7VBza4kRSNC/llhltct/tekDtgL6FBmQQdi540JSoEJ
   JLSqYQte8eHtZFVlXA2WoXPKISSHG+u9XEA1pmXeJM4ajWMMr1YP+wky7
   SRK7jgVF9RzYNr2QiQD5qUNbjY4J9wrfymBOFLr7OkeSvde43PmepXBTE
   A==;
X-CSE-ConnectionGUID: 3xza8D/TRHG5ehMPRv47gw==
X-CSE-MsgGUID: xdfCfnogRECJEQgDVSsguA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="62159682"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="62159682"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 22:39:08 -0800
X-CSE-ConnectionGUID: lUgi+dHdTZ2joSIJ0Laodw==
X-CSE-MsgGUID: tE3tGJOfTKuH5Pcn5XXn7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="116943465"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Feb 2025 22:39:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th0y8-0011A9-1H;
	Sun, 09 Feb 2025 06:39:04 +0000
Date: Sun, 9 Feb 2025 14:38:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:566
 kfd_procfs_add_sysfs_stats() warn: Calling kobject_put|get with
 state->initialized unset from line: 554
Message-ID: <202502091412.mRxGHIw1-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kent Overstreet <kent.overstreet@linux.dev>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9946eaf552b194bb352c2945b54ff98c8193b3f1
commit: 7bd230a26648ac68ab3731ebbc449090f0ac6a37 mm/slab: enable slab allocation tagging for kmalloc and friends
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: powerpc64-randconfig-r073-20250207 (https://download.01.org/0day-ci/archive/20250209/202502091412.mRxGHIw1-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project ee3bccab34f57387bdf33853cdd5f214fef349a2)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502091412.mRxGHIw1-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:566 kfd_procfs_add_sysfs_stats() warn: Calling kobject_put|get with state->initialized unset from line: 554
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:612 kfd_procfs_add_sysfs_counters() warn: Calling kobject_put|get with state->initialized unset from line: 603
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:849 kfd_create_process() warn: Calling kobject_put|get with state->initialized unset from line: 839

vim +566 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c

32cb59f3136248 Mukul Joshi     2020-05-26  533  
75ae84c89b136a Philip Yang     2021-06-16  534  static void kfd_procfs_add_sysfs_stats(struct kfd_process *p)
4327bed2ff8e3d Philip Cox      2020-06-30  535  {
75ae84c89b136a Philip Yang     2021-06-16  536  	int ret;
6ae2784114c037 Alex Sierra     2020-04-01  537  	int i;
4327bed2ff8e3d Philip Cox      2020-06-30  538  	char stats_dir_filename[MAX_SYSFS_FILENAME_LEN];
4327bed2ff8e3d Philip Cox      2020-06-30  539  
75ae84c89b136a Philip Yang     2021-06-16  540  	if (!p || !p->kobj)
75ae84c89b136a Philip Yang     2021-06-16  541  		return;
4327bed2ff8e3d Philip Cox      2020-06-30  542  
4327bed2ff8e3d Philip Cox      2020-06-30  543  	/*
4327bed2ff8e3d Philip Cox      2020-06-30  544  	 * Create sysfs files for each GPU:
4327bed2ff8e3d Philip Cox      2020-06-30  545  	 * - proc/<pid>/stats_<gpuid>/
4327bed2ff8e3d Philip Cox      2020-06-30  546  	 * - proc/<pid>/stats_<gpuid>/evicted_ms
f2fa07b39fafb2 Ramesh Errabolu 2020-09-29  547  	 * - proc/<pid>/stats_<gpuid>/cu_occupancy
4327bed2ff8e3d Philip Cox      2020-06-30  548  	 */
6ae2784114c037 Alex Sierra     2020-04-01  549  	for (i = 0; i < p->n_pdds; i++) {
6ae2784114c037 Alex Sierra     2020-04-01  550  		struct kfd_process_device *pdd = p->pdds[i];
4327bed2ff8e3d Philip Cox      2020-06-30  551  
4327bed2ff8e3d Philip Cox      2020-06-30  552  		snprintf(stats_dir_filename, MAX_SYSFS_FILENAME_LEN,
4327bed2ff8e3d Philip Cox      2020-06-30  553  				"stats_%u", pdd->dev->id);
75ae84c89b136a Philip Yang     2021-06-16  554  		pdd->kobj_stats = kfd_alloc_struct(pdd->kobj_stats);
75ae84c89b136a Philip Yang     2021-06-16  555  		if (!pdd->kobj_stats)
75ae84c89b136a Philip Yang     2021-06-16  556  			return;
4327bed2ff8e3d Philip Cox      2020-06-30  557  
75ae84c89b136a Philip Yang     2021-06-16  558  		ret = kobject_init_and_add(pdd->kobj_stats,
4327bed2ff8e3d Philip Cox      2020-06-30  559  					   &procfs_stats_type,
4327bed2ff8e3d Philip Cox      2020-06-30  560  					   p->kobj,
4327bed2ff8e3d Philip Cox      2020-06-30  561  					   stats_dir_filename);
4327bed2ff8e3d Philip Cox      2020-06-30  562  
4327bed2ff8e3d Philip Cox      2020-06-30  563  		if (ret) {
4327bed2ff8e3d Philip Cox      2020-06-30  564  			pr_warn("Creating KFD proc/stats_%s folder failed",
4327bed2ff8e3d Philip Cox      2020-06-30  565  				stats_dir_filename);
75ae84c89b136a Philip Yang     2021-06-16 @566  			kobject_put(pdd->kobj_stats);
75ae84c89b136a Philip Yang     2021-06-16  567  			pdd->kobj_stats = NULL;
75ae84c89b136a Philip Yang     2021-06-16  568  			return;
4327bed2ff8e3d Philip Cox      2020-06-30  569  		}
4327bed2ff8e3d Philip Cox      2020-06-30  570  
75ae84c89b136a Philip Yang     2021-06-16  571  		kfd_sysfs_create_file(pdd->kobj_stats, &pdd->attr_evict,
75ae84c89b136a Philip Yang     2021-06-16  572  				      "evicted_ms");
f2fa07b39fafb2 Ramesh Errabolu 2020-09-29  573  		/* Add sysfs file to report compute unit occupancy */
75ae84c89b136a Philip Yang     2021-06-16  574  		if (pdd->dev->kfd2kgd->get_cu_occupancy)
75ae84c89b136a Philip Yang     2021-06-16  575  			kfd_sysfs_create_file(pdd->kobj_stats,
75ae84c89b136a Philip Yang     2021-06-16  576  					      &pdd->attr_cu_occupancy,
75ae84c89b136a Philip Yang     2021-06-16  577  					      "cu_occupancy");
f2fa07b39fafb2 Ramesh Errabolu 2020-09-29  578  	}
4327bed2ff8e3d Philip Cox      2020-06-30  579  }
4327bed2ff8e3d Philip Cox      2020-06-30  580  
751580b3ff9ac6 Philip Yang     2021-06-16  581  static void kfd_procfs_add_sysfs_counters(struct kfd_process *p)
751580b3ff9ac6 Philip Yang     2021-06-16  582  {
751580b3ff9ac6 Philip Yang     2021-06-16  583  	int ret = 0;
751580b3ff9ac6 Philip Yang     2021-06-16  584  	int i;
751580b3ff9ac6 Philip Yang     2021-06-16  585  	char counters_dir_filename[MAX_SYSFS_FILENAME_LEN];
751580b3ff9ac6 Philip Yang     2021-06-16  586  
751580b3ff9ac6 Philip Yang     2021-06-16  587  	if (!p || !p->kobj)
751580b3ff9ac6 Philip Yang     2021-06-16  588  		return;
751580b3ff9ac6 Philip Yang     2021-06-16  589  
751580b3ff9ac6 Philip Yang     2021-06-16  590  	/*
751580b3ff9ac6 Philip Yang     2021-06-16  591  	 * Create sysfs files for each GPU which supports SVM
751580b3ff9ac6 Philip Yang     2021-06-16  592  	 * - proc/<pid>/counters_<gpuid>/
751580b3ff9ac6 Philip Yang     2021-06-16  593  	 * - proc/<pid>/counters_<gpuid>/faults
751580b3ff9ac6 Philip Yang     2021-06-16  594  	 * - proc/<pid>/counters_<gpuid>/page_in
751580b3ff9ac6 Philip Yang     2021-06-16  595  	 * - proc/<pid>/counters_<gpuid>/page_out
751580b3ff9ac6 Philip Yang     2021-06-16  596  	 */
751580b3ff9ac6 Philip Yang     2021-06-16  597  	for_each_set_bit(i, p->svms.bitmap_supported, p->n_pdds) {
751580b3ff9ac6 Philip Yang     2021-06-16  598  		struct kfd_process_device *pdd = p->pdds[i];
751580b3ff9ac6 Philip Yang     2021-06-16  599  		struct kobject *kobj_counters;
751580b3ff9ac6 Philip Yang     2021-06-16  600  
751580b3ff9ac6 Philip Yang     2021-06-16  601  		snprintf(counters_dir_filename, MAX_SYSFS_FILENAME_LEN,
751580b3ff9ac6 Philip Yang     2021-06-16  602  			"counters_%u", pdd->dev->id);
751580b3ff9ac6 Philip Yang     2021-06-16  603  		kobj_counters = kfd_alloc_struct(kobj_counters);
751580b3ff9ac6 Philip Yang     2021-06-16  604  		if (!kobj_counters)
751580b3ff9ac6 Philip Yang     2021-06-16  605  			return;
751580b3ff9ac6 Philip Yang     2021-06-16  606  
751580b3ff9ac6 Philip Yang     2021-06-16  607  		ret = kobject_init_and_add(kobj_counters, &sysfs_counters_type,
751580b3ff9ac6 Philip Yang     2021-06-16  608  					   p->kobj, counters_dir_filename);
751580b3ff9ac6 Philip Yang     2021-06-16  609  		if (ret) {
751580b3ff9ac6 Philip Yang     2021-06-16  610  			pr_warn("Creating KFD proc/%s folder failed",
751580b3ff9ac6 Philip Yang     2021-06-16  611  				counters_dir_filename);
751580b3ff9ac6 Philip Yang     2021-06-16 @612  			kobject_put(kobj_counters);
751580b3ff9ac6 Philip Yang     2021-06-16  613  			return;
751580b3ff9ac6 Philip Yang     2021-06-16  614  		}
751580b3ff9ac6 Philip Yang     2021-06-16  615  
751580b3ff9ac6 Philip Yang     2021-06-16  616  		pdd->kobj_counters = kobj_counters;
751580b3ff9ac6 Philip Yang     2021-06-16  617  		kfd_sysfs_create_file(kobj_counters, &pdd->attr_faults,
751580b3ff9ac6 Philip Yang     2021-06-16  618  				      "faults");
751580b3ff9ac6 Philip Yang     2021-06-16  619  		kfd_sysfs_create_file(kobj_counters, &pdd->attr_page_in,
751580b3ff9ac6 Philip Yang     2021-06-16  620  				      "page_in");
751580b3ff9ac6 Philip Yang     2021-06-16  621  		kfd_sysfs_create_file(kobj_counters, &pdd->attr_page_out,
751580b3ff9ac6 Philip Yang     2021-06-16  622  				      "page_out");
751580b3ff9ac6 Philip Yang     2021-06-16  623  	}
751580b3ff9ac6 Philip Yang     2021-06-16  624  }
4327bed2ff8e3d Philip Cox      2020-06-30  625  

:::::: The code at line 566 was first introduced by commit
:::::: 75ae84c89b136a5c0193ab7064b03cddfcebba39 drm/amdkfd: add helper function for kfd sysfs create

:::::: TO: Philip Yang <Philip.Yang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
