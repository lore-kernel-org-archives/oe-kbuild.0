Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AC829AB05
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 17:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766425511; cv=none; b=SDvWtfy843LguhXuBpnFHni7tWMoKWmvynfPrUQwi4SkzNTJuyGofvO1g5xcRETYLhGgLmk9pO2rk9cz28Q/UyzTTdz/wUhYU8f7GIUybAnX8x2Wd7LPMau2wkZcgIVQmaY/b4IXDJDvjkDhxe0qDlImiYObgbjgY32n7pyv8E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766425511; c=relaxed/simple;
	bh=n1FyJYhgCBPXW56PA4yknk4Fev5TRwwEam7VH85m9Os=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n5Kc8hvXr9jYIpR+D3f4nculViGev/u7lUL9e1Fpwhf5nVFwVPMZfZRyN8114zgYwh1xudFtSHBhNfEPcWZ5lkeJ2unULFq3a+HvKzH9LHMgw6C0/pSPIkszDGEu06aCFEFk5aCWzXXOAnKfPv3+anRvi/eB4MUsZLaUMNqYoh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXf0YAS6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXf0YAS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766425509; x=1797961509;
  h=date:from:to:cc:subject:message-id;
  bh=n1FyJYhgCBPXW56PA4yknk4Fev5TRwwEam7VH85m9Os=;
  b=CXf0YAS67oTum1Cu2nZ2TxyVYnNpPY2iI+TBptSvQmvEVRTUFheH50YS
   OquZSvrc+k2jJYosUHuesYJlSsK9b15ynLiJ0X5xQHpI1BjBwhg/fgxgm
   UVWAPHd/utB3xDgQXGaJ/DpRGl7pTW0ZC+GvmKzp4yYgNRn6uVaOZGtPd
   2cs/w7L9lztPfTVfD2I8pxU4nJ4RJh4EHSvZADGxx+AMRL5MDNjr0n2jz
   3Kzpm3l2TZcj3XMAdxj/8S5i9V0VWNyPXkl1WjxXaZUZmLRMP+HynaKRB
   N/U5zZSaPOlCwBhNJUbHjQNAn27oykb1dH5Iq1MXv467CYVAIuU7nPCG5
   A==;
X-CSE-ConnectionGUID: +zlk2aO1QPuJuQIz/mB2ww==
X-CSE-MsgGUID: 4MHBKzw+Sc6b6YP0kQmXxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68355800"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68355800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 09:45:07 -0800
X-CSE-ConnectionGUID: csEVNmvsRvmVA/f8ek4zzA==
X-CSE-MsgGUID: YTa5ZhmqQZ6VjAyGY2pviQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204623370"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Dec 2025 09:45:06 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXjxw-000000000wV-0F2l;
	Mon, 22 Dec 2025 17:45:04 +0000
Date: Tue, 23 Dec 2025 01:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kexec/ranges.c:612 get_crash_memory_ranges()
 warn: we never enter this loop
Message-ID: <202512230147.o4Lpc7Tk-lkp@intel.com>
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
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: b4a96ab50f368afc2360ff539a20254ca2c9a889 powerpc/kdump: Add support for crashkernel CMA reservation
date:   6 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 weeks ago
config: powerpc64-randconfig-r072-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230147.o4Lpc7Tk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512230147.o4Lpc7Tk-lkp@intel.com/

smatch warnings:
arch/powerpc/kexec/ranges.c:612 get_crash_memory_ranges() warn: we never enter this loop
arch/powerpc/kexec/ranges.c:612 get_crash_memory_ranges() warn: unsigned 'i' is never less than zero.
arch/powerpc/kexec/ranges.c:612 get_crash_memory_ranges() warn: unsigned 'i' is never less than zero.

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
