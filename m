Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510D3357735
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 04:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534619; cv=none; b=Jug5+WFcuzUm1ahACLYuD/gsbmQdhY1AS06+SFv9RRHoGdCmn0hyVd5GF8ZQf1+YLTstk6eXxAWeNznI9IBKN3t18Lqoa4L4CZBM0avncJtnL6Ayg6F9LmfEndilpo3z/F3d+UA1Kq+6P7Cbb/e1GiWV+FBqCQouoN5VfNdrjZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534619; c=relaxed/simple;
	bh=A6vpavnNnlFtBaZgg/mGaaI1o7YzZN5VzyYNGd++3e4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bwn2l3z/lQzTDaaHn/mhcnNpbK/3WRdcJBszT8d1/b+8pT/GNFDbRYUzn5PGpNv+FvrVaADQJvNZBCbZiYD02kh2MmFtxtV3Y1RK3D4vxnZXCv4dr8tYF9fyinCfHoMFvzIvnbftDlgbsDrLwrSQXUNiRe36Tf27lJH+cfugiFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfSlYE2C; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfSlYE2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534618; x=1807070618;
  h=date:from:to:cc:subject:message-id;
  bh=A6vpavnNnlFtBaZgg/mGaaI1o7YzZN5VzyYNGd++3e4=;
  b=NfSlYE2CXFBbgmi1NbDq6f+svNWgGJMzA9P3KCKwXLUydp3Wp63a8/ts
   z4UsE5C/TnMqcdcBXl6BAl84iN5Blvh+pHyD9fRCk3DY8iZxnYY+gKj0D
   BRewoQNOkUNajyC9Olcz1HyI7LwmDhO+72ruhlZNNHE3ToSZqgsGKlY1v
   uXPVCqxbRhXBBEX/aTHLp7j5p3K/GgJ/k49xx/B+pkSNW4jjVdwoaCE7q
   d+1LCRTGeo5dQC6HGaKGV16V27hUEZ4h/jwACbAZXtNHTUisQhiOaVBrV
   Iks8EsuAdKFT1fyNmWHjCYEo2vHzVWtZ9tjK18usUrCKkvQbwsBaqW31J
   A==;
X-CSE-ConnectionGUID: w34AeFfnQ222dEQzFUZMzg==
X-CSE-MsgGUID: wbvzSxxeSp+iC9v0Z31FKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87114707"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87114707"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:03:37 -0700
X-CSE-ConnectionGUID: b5LNGIKIQO+9fCbyhihRiA==
X-CSE-MsgGUID: BMbKa6XgTU2YV1H9etiIdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223261232"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2026 21:03:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xf4-0000000008x-0gf1;
	Tue, 07 Apr 2026 04:03:34 +0000
Date: Tue, 07 Apr 2026 12:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kexec/ranges.c:612 get_crash_memory_ranges()
 warn: we never enter this loop
Message-ID: <202604071051.dNysR5MD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sourabh Jain <sourabhjain@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bfe62a454542cfad3379f6ef5680b125f41e20f4
commit: b4a96ab50f368afc2360ff539a20254ca2c9a889 powerpc/kdump: Add support for crashkernel CMA reservation
date:   5 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-r072-20260407 (https://download.01.org/0day-ci/archive/20260407/202604071051.dNysR5MD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b4a96ab50f36 ("powerpc/kdump: Add support for crashkernel CMA reservation")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604071051.dNysR5MD-lkp@intel.com/

New smatch warnings:
arch/powerpc/kexec/ranges.c:612 get_crash_memory_ranges() warn: we never enter this loop

Old smatch warnings:
arch/powerpc/kexec/ranges.c:531 get_usable_memory_ranges() warn: we never enter this loop

vim +612 arch/powerpc/kexec/ranges.c

b4a96ab50f368af Sourabh Jain 2025-11-07  571  
f5f0da5a7b18fab Sourabh Jain 2024-03-26  572  /**
f5f0da5a7b18fab Sourabh Jain 2024-03-26  573   * get_crash_memory_ranges - Get crash memory ranges. This list includes
f5f0da5a7b18fab Sourabh Jain 2024-03-26  574   *                           first/crashing kernel's memory regions that
f5f0da5a7b18fab Sourabh Jain 2024-03-26  575   *                           would be exported via an elfcore.
f5f0da5a7b18fab Sourabh Jain 2024-03-26  576   * @mem_ranges:              Range list to add the memory ranges to.
f5f0da5a7b18fab Sourabh Jain 2024-03-26  577   *
f5f0da5a7b18fab Sourabh Jain 2024-03-26  578   * Returns 0 on success, negative errno on error.
f5f0da5a7b18fab Sourabh Jain 2024-03-26  579   */
f5f0da5a7b18fab Sourabh Jain 2024-03-26  580  int get_crash_memory_ranges(struct crash_mem **mem_ranges)
f5f0da5a7b18fab Sourabh Jain 2024-03-26  581  {
f5f0da5a7b18fab Sourabh Jain 2024-03-26  582  	phys_addr_t base, end;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  583  	u64 i;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  584  	int ret;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  585  
f5f0da5a7b18fab Sourabh Jain 2024-03-26  586  	for_each_mem_range(i, &base, &end) {
f5f0da5a7b18fab Sourabh Jain 2024-03-26  587  		u64 size = end - base;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  588  
f5f0da5a7b18fab Sourabh Jain 2024-03-26  589  		/* Skip backup memory region, which needs a separate entry */
f5f0da5a7b18fab Sourabh Jain 2024-03-26  590  		if (base == BACKUP_SRC_START) {
f5f0da5a7b18fab Sourabh Jain 2024-03-26  591  			if (size > BACKUP_SRC_SIZE) {
f5f0da5a7b18fab Sourabh Jain 2024-03-26  592  				base = BACKUP_SRC_END + 1;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  593  				size -= BACKUP_SRC_SIZE;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  594  			} else
f5f0da5a7b18fab Sourabh Jain 2024-03-26  595  				continue;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  596  		}
f5f0da5a7b18fab Sourabh Jain 2024-03-26  597  
f5f0da5a7b18fab Sourabh Jain 2024-03-26  598  		ret = add_mem_range(mem_ranges, base, size);
f5f0da5a7b18fab Sourabh Jain 2024-03-26  599  		if (ret)
f5f0da5a7b18fab Sourabh Jain 2024-03-26  600  			goto out;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  601  
f5f0da5a7b18fab Sourabh Jain 2024-03-26  602  		/* Try merging adjacent ranges before reallocation attempt */
f5f0da5a7b18fab Sourabh Jain 2024-03-26  603  		if ((*mem_ranges)->nr_ranges == (*mem_ranges)->max_nr_ranges)
f5f0da5a7b18fab Sourabh Jain 2024-03-26  604  			sort_memory_ranges(*mem_ranges, true);
f5f0da5a7b18fab Sourabh Jain 2024-03-26  605  	}
f5f0da5a7b18fab Sourabh Jain 2024-03-26  606  
b4a96ab50f368af Sourabh Jain 2025-11-07  607  	/* Exclude crashkernel region */
b4a96ab50f368af Sourabh Jain 2025-11-07  608  	ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_res.start, crashk_res.end);
b4a96ab50f368af Sourabh Jain 2025-11-07  609  	if (ret)
f5f0da5a7b18fab Sourabh Jain 2024-03-26  610  		goto out;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  611  
b4a96ab50f368af Sourabh Jain 2025-11-07 @612  	for (i = 0; i < crashk_cma_cnt; ++i) {
b4a96ab50f368af Sourabh Jain 2025-11-07  613  		ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_cma_ranges[i].start,
b4a96ab50f368af Sourabh Jain 2025-11-07  614  					      crashk_cma_ranges[i].end);
f5f0da5a7b18fab Sourabh Jain 2024-03-26  615  		if (ret)
f5f0da5a7b18fab Sourabh Jain 2024-03-26  616  			goto out;
b4a96ab50f368af Sourabh Jain 2025-11-07  617  	}
f5f0da5a7b18fab Sourabh Jain 2024-03-26  618  
f5f0da5a7b18fab Sourabh Jain 2024-03-26  619  	/*
f5f0da5a7b18fab Sourabh Jain 2024-03-26  620  	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
f5f0da5a7b18fab Sourabh Jain 2024-03-26  621  	 *        regions are exported to save their context at the time of
f5f0da5a7b18fab Sourabh Jain 2024-03-26  622  	 *        crash, they should actually be backed up just like the
f5f0da5a7b18fab Sourabh Jain 2024-03-26  623  	 *        first 64K bytes of memory.
f5f0da5a7b18fab Sourabh Jain 2024-03-26  624  	 */
f5f0da5a7b18fab Sourabh Jain 2024-03-26  625  	ret = add_rtas_mem_range(mem_ranges);
f5f0da5a7b18fab Sourabh Jain 2024-03-26  626  	if (ret)
f5f0da5a7b18fab Sourabh Jain 2024-03-26  627  		goto out;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  628  
f5f0da5a7b18fab Sourabh Jain 2024-03-26  629  	ret = add_opal_mem_range(mem_ranges);
f5f0da5a7b18fab Sourabh Jain 2024-03-26  630  	if (ret)
f5f0da5a7b18fab Sourabh Jain 2024-03-26  631  		goto out;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  632  
f5f0da5a7b18fab Sourabh Jain 2024-03-26  633  	/* create a separate program header for the backup region */
f5f0da5a7b18fab Sourabh Jain 2024-03-26  634  	ret = add_mem_range(mem_ranges, BACKUP_SRC_START, BACKUP_SRC_SIZE);
f5f0da5a7b18fab Sourabh Jain 2024-03-26  635  	if (ret)
f5f0da5a7b18fab Sourabh Jain 2024-03-26  636  		goto out;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  637  
f5f0da5a7b18fab Sourabh Jain 2024-03-26  638  	sort_memory_ranges(*mem_ranges, false);
f5f0da5a7b18fab Sourabh Jain 2024-03-26  639  out:
f5f0da5a7b18fab Sourabh Jain 2024-03-26  640  	if (ret)
f5f0da5a7b18fab Sourabh Jain 2024-03-26  641  		pr_err("Failed to setup crash memory ranges\n");
f5f0da5a7b18fab Sourabh Jain 2024-03-26  642  	return ret;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  643  }
849599b702ef897 Sourabh Jain 2024-03-26  644  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
