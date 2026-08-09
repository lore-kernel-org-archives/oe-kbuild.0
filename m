Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5314A1AA1D5
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Aug 2026 01:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786237768; cv=none; b=If/pTJ6hlkQSrRmWfHv6W2eE7OC4dtIUA5qLiO2g5mCf1sIqgSBZQisShBNtSJBux90QZ+Tft7Apq0MxmPtnngKpgA349XFSE/gQksIQ86PHfvhyvHYYb1A4MBo5pCeDQmalnY7PEX22EP4rFCjRCtUWVXBGZMk4eJd3UaDDjxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786237768; c=relaxed/simple;
	bh=NJuJMPruGk0wt2XWZgWKmzGIV7cHaHFEpeCdpgdgGG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ni120yopap4LNMw8bg1i9+knkNou7mkCi0bqt/4pl/2rqYbhutT01SsPolGwgM+x1y3jhwlYzyl4/LijAN7rgYrFFBAtmU2NsZZ4SEnEUyD5KszwFxiN35tB40VpegQtDvnuhxPCFuRMkBrH9/4m/rrNWEB3paxl/Eg4fEmXwxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mc0ZRguE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mc0ZRguE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786237766; x=1817773766;
  h=date:from:to:cc:subject:message-id;
  bh=NJuJMPruGk0wt2XWZgWKmzGIV7cHaHFEpeCdpgdgGG8=;
  b=mc0ZRguEiXW1WRqGHxRf3MpsznYfWbCxFVC7Nkjh7GgkggyAPXYdSkgE
   UmWZS9MRj1f+mCmU8jTojK/P2yN19lrXcBxwbAXqIF5tnuJSKpLwbuP5C
   7rxzhCwcs6Icdz/3G6VXuqTW2p8Dz3CWfMbtNoYsQ0H62rHnlejTzpx4h
   21w3ajgM2kvCDY4H1YJAwrf5WYiK/ZDOWksgNXaXWwaLpgDUOtBzoQf55
   qxD5/mpoZpvrzoHZDsQ7F5lPKp6yaZ+ZxLpj8PMek+n216q0gEMqDdSyR
   vl8z2igaIPzOucyLUxyEYekb3tGyybBzo5lE76FHg0VlApQCf4zcgVoF3
   A==;
X-CSE-ConnectionGUID: 2mIKMw17R4iCXRzuFGSvUQ==
X-CSE-MsgGUID: VkXa2KGSTsmOpfVZ5977Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="85915341"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="85915341"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 18:09:25 -0700
X-CSE-ConnectionGUID: KzR/jbMERi2Uigg2rkPIsQ==
X-CSE-MsgGUID: Vq3OI7FORWOe3DHTwv5gMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="266564242"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2026 18:09:24 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wss2U-00000000LE1-0ndD;
	Sun, 09 Aug 2026 01:09:22 +0000
Date: Sun, 09 Aug 2026 09:08:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kexec/ranges.c:531 get_usable_memory_ranges()
 warn: we never enter this loop
Message-ID: <202608090854.EMSLbhfP-lkp@intel.com>
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
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: b4a96ab50f368afc2360ff539a20254ca2c9a889 powerpc/kdump: Add support for crashkernel CMA reservation
date:   9 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 9 months ago
config: powerpc64-randconfig-r073-20260809 (https://download.01.org/0day-ci/archive/20260809/202608090854.EMSLbhfP-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b4a96ab50f36 ("powerpc/kdump: Add support for crashkernel CMA reservation")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608090854.EMSLbhfP-lkp@intel.com/

New smatch warnings:
arch/powerpc/kexec/ranges.c:531 get_usable_memory_ranges() warn: we never enter this loop

Old smatch warnings:
arch/powerpc/kexec/ranges.c:612 get_crash_memory_ranges() warn: we never enter this loop

vim +531 arch/powerpc/kexec/ranges.c

f5f0da5a7b18fa Sourabh Jain 2024-03-26  506  
f5f0da5a7b18fa Sourabh Jain 2024-03-26  507  #ifdef CONFIG_CRASH_DUMP
f5f0da5a7b18fa Sourabh Jain 2024-03-26  508  /**
f5f0da5a7b18fa Sourabh Jain 2024-03-26  509   * get_usable_memory_ranges - Get usable memory ranges. This list includes
f5f0da5a7b18fa Sourabh Jain 2024-03-26  510   *                            regions like crashkernel, opal/rtas & tce-table,
f5f0da5a7b18fa Sourabh Jain 2024-03-26  511   *                            that kdump kernel could use.
f5f0da5a7b18fa Sourabh Jain 2024-03-26  512   * @mem_ranges:               Range list to add the memory ranges to.
f5f0da5a7b18fa Sourabh Jain 2024-03-26  513   *
f5f0da5a7b18fa Sourabh Jain 2024-03-26  514   * Returns 0 on success, negative errno on error.
f5f0da5a7b18fa Sourabh Jain 2024-03-26  515   */
f5f0da5a7b18fa Sourabh Jain 2024-03-26  516  int get_usable_memory_ranges(struct crash_mem **mem_ranges)
f5f0da5a7b18fa Sourabh Jain 2024-03-26  517  {
b4a96ab50f368a Sourabh Jain 2025-11-07  518  	int ret, i;
f5f0da5a7b18fa Sourabh Jain 2024-03-26  519  
f5f0da5a7b18fa Sourabh Jain 2024-03-26  520  	/*
f5f0da5a7b18fa Sourabh Jain 2024-03-26  521  	 * Early boot failure observed on guests when low memory (first memory
f5f0da5a7b18fa Sourabh Jain 2024-03-26  522  	 * block?) is not added to usable memory. So, add [0, crashk_res.end]
f5f0da5a7b18fa Sourabh Jain 2024-03-26  523  	 * instead of [crashk_res.start, crashk_res.end] to workaround it.
f5f0da5a7b18fa Sourabh Jain 2024-03-26  524  	 * Also, crashed kernel's memory must be added to reserve map to
f5f0da5a7b18fa Sourabh Jain 2024-03-26  525  	 * avoid kdump kernel from using it.
f5f0da5a7b18fa Sourabh Jain 2024-03-26  526  	 */
f5f0da5a7b18fa Sourabh Jain 2024-03-26  527  	ret = add_mem_range(mem_ranges, 0, crashk_res.end + 1);
f5f0da5a7b18fa Sourabh Jain 2024-03-26  528  	if (ret)
f5f0da5a7b18fa Sourabh Jain 2024-03-26  529  		goto out;
f5f0da5a7b18fa Sourabh Jain 2024-03-26  530  
b4a96ab50f368a Sourabh Jain 2025-11-07 @531  	for (i = 0; i < crashk_cma_cnt; i++) {
b4a96ab50f368a Sourabh Jain 2025-11-07  532  		ret = add_mem_range(mem_ranges, crashk_cma_ranges[i].start,
b4a96ab50f368a Sourabh Jain 2025-11-07  533  				    crashk_cma_ranges[i].end - crashk_cma_ranges[i].start + 1);
b4a96ab50f368a Sourabh Jain 2025-11-07  534  		if (ret)
b4a96ab50f368a Sourabh Jain 2025-11-07  535  			goto out;
b4a96ab50f368a Sourabh Jain 2025-11-07  536  	}
b4a96ab50f368a Sourabh Jain 2025-11-07  537  
f5f0da5a7b18fa Sourabh Jain 2024-03-26  538  	ret = add_rtas_mem_range(mem_ranges);
f5f0da5a7b18fa Sourabh Jain 2024-03-26  539  	if (ret)
f5f0da5a7b18fa Sourabh Jain 2024-03-26  540  		goto out;
f5f0da5a7b18fa Sourabh Jain 2024-03-26  541  
f5f0da5a7b18fa Sourabh Jain 2024-03-26  542  	ret = add_opal_mem_range(mem_ranges);
f5f0da5a7b18fa Sourabh Jain 2024-03-26  543  	if (ret)
f5f0da5a7b18fa Sourabh Jain 2024-03-26  544  		goto out;
f5f0da5a7b18fa Sourabh Jain 2024-03-26  545  
f5f0da5a7b18fa Sourabh Jain 2024-03-26  546  	ret = add_tce_mem_ranges(mem_ranges);
f5f0da5a7b18fa Sourabh Jain 2024-03-26  547  out:
f5f0da5a7b18fa Sourabh Jain 2024-03-26  548  	if (ret)
f5f0da5a7b18fa Sourabh Jain 2024-03-26  549  		pr_err("Failed to setup usable memory ranges\n");
f5f0da5a7b18fa Sourabh Jain 2024-03-26  550  	return ret;
f5f0da5a7b18fa Sourabh Jain 2024-03-26  551  }
f5f0da5a7b18fa Sourabh Jain 2024-03-26  552  #endif /* CONFIG_CRASH_DUMP */
f5f0da5a7b18fa Sourabh Jain 2024-03-26  553  #endif /* CONFIG_KEXEC_FILE */
f5f0da5a7b18fa Sourabh Jain 2024-03-26  554  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
