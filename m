Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD4D285CB8
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765632346; cv=none; b=lp9fbsUazIA+iu2ESzInSVJ4jzQMNGgB+lt5wqjLQxzx3063xr0bSvnCs6ketnIKCeYw2gQzKKbeZdzeCUFaaT3kfvqLNeuAEWQxd0aTRTvAUfCD8cBEZg/vbzPWYd0uCD9s3YF+IZx0uEBF3xcd3CEyJw1GJyLN+FZqWuRiSKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765632346; c=relaxed/simple;
	bh=SEkRzgEGDrFQuNMcOLiBkTEwhPmRMFP+2gZ1N4kbjtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WcwvfrLYFlYmrkK4FzViY55D3Xdqzp3lf5eSfIPcVdXcb3n6s0IrLlDtlZh87iuEMtF5APLGSjfQRWtImoR1kbLVHJKD9ppJPC71zQF2jjGaqwyWkq0ENCMxFvS0EL7Ad4ODk0oMS7AThw9YpDJWv5QuepeCT5ajWgyHBs/TN/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxFnFphH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxFnFphH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765632344; x=1797168344;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SEkRzgEGDrFQuNMcOLiBkTEwhPmRMFP+2gZ1N4kbjtw=;
  b=IxFnFphH4oi1bBonztQcjAjMra7Io9lI0sd5eAAAZGpgzvveE3neV28K
   KfuLScBs5ApPbMXO7Jbf4kkwFUgDTgB0w31Bpt2WDatXTZ+qu4adu2N3e
   OOQe9MUBVok9BIMhyWykSI4n7viU4UUqTREcE0gAKV9rbEyuSVRCoGYFm
   Z7R2jMb+GzKYpkPK70lmhf932xEtJGfdBakJuX+c41mktucxs9UWBzteq
   GezaDboDSGSq/+PYBeENxEdjb3H+WmwkBDXsb6MrKLF1ThVAcOixxkFw+
   PxhFWWoL5+B4l08bnIM4u6tZn+4n0CM96trAGG718cnydA45G1Snwzp9B
   A==;
X-CSE-ConnectionGUID: dvjgY+nUQoGE/tIVUrmK8g==
X-CSE-MsgGUID: ebeTipFaS7uet1EgphCezA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="77925195"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="77925195"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 05:25:44 -0800
X-CSE-ConnectionGUID: 0NmvTDJsTamgH4oIHo/j+Q==
X-CSE-MsgGUID: PrKltNxESoCtNUu7nLCYgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="220695433"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 05:25:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUPcy-000000007g1-3JxG;
	Sat, 13 Dec 2025 13:25:40 +0000
Date: Sat, 13 Dec 2025 21:24:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-misc:drm-misc-next 3/7]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:594
 kfd_procfs_add_sysfs_stats() warn: Calling kobject_put|get with
 state->initialized unset from line: 582
Message-ID: <202512132152.Ftx1yfio-lkp@intel.com>
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
CC: dri-devel@lists.freedesktop.org
TO: Philipp Stanner <phasta@kernel.org>
CC: "Christian König" <christian.koenig@amd.com>
CC: Felix Kuehling <felix.kuehling@amd.com>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   d8684ae1cdcf848d21e00bc0e0de821d694a207b
commit: 06bc18e0def7d926265480faa555bf0b67a35a90 [3/7] amd/amdkfd: Use dma_fence_check_and_signal()
:::::: branch date: 5 hours ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-161-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132152.Ftx1yfio-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512132152.Ftx1yfio-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:594 kfd_procfs_add_sysfs_stats() warn: Calling kobject_put|get with state->initialized unset from line: 582
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:887 kfd_create_process() warn: Calling kobject_put|get with state->initialized unset from line: 877
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1999 signal_eviction_fence() warn: signedness bug returning '(-22)'

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:640 kfd_procfs_add_sysfs_counters() warn: Calling kobject_put|get with state->initialized unset from line: 631

vim +594 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c

32cb59f3136248c Mukul Joshi     2020-05-26  561  
75ae84c89b136a5 Philip Yang     2021-06-16  562  static void kfd_procfs_add_sysfs_stats(struct kfd_process *p)
4327bed2ff8e3dd Philip Cox      2020-06-30  563  {
75ae84c89b136a5 Philip Yang     2021-06-16  564  	int ret;
6ae2784114c037c Alex Sierra     2020-04-01  565  	int i;
4327bed2ff8e3dd Philip Cox      2020-06-30  566  	char stats_dir_filename[MAX_SYSFS_FILENAME_LEN];
4327bed2ff8e3dd Philip Cox      2020-06-30  567  
75ae84c89b136a5 Philip Yang     2021-06-16  568  	if (!p || !p->kobj)
75ae84c89b136a5 Philip Yang     2021-06-16  569  		return;
4327bed2ff8e3dd Philip Cox      2020-06-30  570  
4327bed2ff8e3dd Philip Cox      2020-06-30  571  	/*
4327bed2ff8e3dd Philip Cox      2020-06-30  572  	 * Create sysfs files for each GPU:
4327bed2ff8e3dd Philip Cox      2020-06-30  573  	 * - proc/<pid>/stats_<gpuid>/
4327bed2ff8e3dd Philip Cox      2020-06-30  574  	 * - proc/<pid>/stats_<gpuid>/evicted_ms
f2fa07b39fafb2a Ramesh Errabolu 2020-09-29  575  	 * - proc/<pid>/stats_<gpuid>/cu_occupancy
4327bed2ff8e3dd Philip Cox      2020-06-30  576  	 */
6ae2784114c037c Alex Sierra     2020-04-01  577  	for (i = 0; i < p->n_pdds; i++) {
6ae2784114c037c Alex Sierra     2020-04-01  578  		struct kfd_process_device *pdd = p->pdds[i];
4327bed2ff8e3dd Philip Cox      2020-06-30  579  
4327bed2ff8e3dd Philip Cox      2020-06-30  580  		snprintf(stats_dir_filename, MAX_SYSFS_FILENAME_LEN,
4327bed2ff8e3dd Philip Cox      2020-06-30  581  				"stats_%u", pdd->dev->id);
75ae84c89b136a5 Philip Yang     2021-06-16  582  		pdd->kobj_stats = kfd_alloc_struct(pdd->kobj_stats);
75ae84c89b136a5 Philip Yang     2021-06-16  583  		if (!pdd->kobj_stats)
75ae84c89b136a5 Philip Yang     2021-06-16  584  			return;
4327bed2ff8e3dd Philip Cox      2020-06-30  585  
75ae84c89b136a5 Philip Yang     2021-06-16  586  		ret = kobject_init_and_add(pdd->kobj_stats,
4327bed2ff8e3dd Philip Cox      2020-06-30  587  					   &procfs_stats_type,
4327bed2ff8e3dd Philip Cox      2020-06-30  588  					   p->kobj,
4327bed2ff8e3dd Philip Cox      2020-06-30  589  					   stats_dir_filename);
4327bed2ff8e3dd Philip Cox      2020-06-30  590  
4327bed2ff8e3dd Philip Cox      2020-06-30  591  		if (ret) {
4327bed2ff8e3dd Philip Cox      2020-06-30  592  			pr_warn("Creating KFD proc/stats_%s folder failed",
4327bed2ff8e3dd Philip Cox      2020-06-30  593  				stats_dir_filename);
75ae84c89b136a5 Philip Yang     2021-06-16 @594  			kobject_put(pdd->kobj_stats);
75ae84c89b136a5 Philip Yang     2021-06-16  595  			pdd->kobj_stats = NULL;
75ae84c89b136a5 Philip Yang     2021-06-16  596  			return;
4327bed2ff8e3dd Philip Cox      2020-06-30  597  		}
4327bed2ff8e3dd Philip Cox      2020-06-30  598  
75ae84c89b136a5 Philip Yang     2021-06-16  599  		kfd_sysfs_create_file(pdd->kobj_stats, &pdd->attr_evict,
75ae84c89b136a5 Philip Yang     2021-06-16  600  				      "evicted_ms");
f2fa07b39fafb2a Ramesh Errabolu 2020-09-29  601  		/* Add sysfs file to report compute unit occupancy */
75ae84c89b136a5 Philip Yang     2021-06-16  602  		if (pdd->dev->kfd2kgd->get_cu_occupancy)
75ae84c89b136a5 Philip Yang     2021-06-16  603  			kfd_sysfs_create_file(pdd->kobj_stats,
75ae84c89b136a5 Philip Yang     2021-06-16  604  					      &pdd->attr_cu_occupancy,
75ae84c89b136a5 Philip Yang     2021-06-16  605  					      "cu_occupancy");
f2fa07b39fafb2a Ramesh Errabolu 2020-09-29  606  	}
4327bed2ff8e3dd Philip Cox      2020-06-30  607  }
4327bed2ff8e3dd Philip Cox      2020-06-30  608  

:::::: The code at line 594 was first introduced by commit
:::::: 75ae84c89b136a5c0193ab7064b03cddfcebba39 drm/amdkfd: add helper function for kfd sysfs create

:::::: TO: Philip Yang <Philip.Yang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
