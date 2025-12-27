Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EF7283FF4
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766844314; cv=none; b=b9YYdxzJC6SRzXOK2n4Zxi87t0HQ/ACH8ub3824NznaZbFKTg43GZ3gjmnN1r4hJcZmVqX8yMYDMBchXjrZyMVnQWA7ZwxWTQqhG42XOnOyEhH7RPMfwOvS4P6NKuFaaViCl9wgVZlDNakVR4iLwKKpXNEO7ELws9TbjuljuYic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766844314; c=relaxed/simple;
	bh=sPkaZiiNAtps3hpMKW+BZ8EStDVOXsyU+Ki1n8msLvk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S/8F+PO2QnHj4HWjrpJ6yiJX5slfrvnTyoulTPzbduyeQdi5kmmTu/4Ms0V7tiOREoqXGgkFmBStPQN4+yMufvJDjs3lsAlfiFSjkBnPfauHpB7wVDfR9KHzOoo1RuFW/wBLE/wD5hZGbNFmlTtCnkpiAIcSB3r/1NosJX9/o+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=an802PRK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="an802PRK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766844309; x=1798380309;
  h=date:from:to:cc:subject:message-id;
  bh=sPkaZiiNAtps3hpMKW+BZ8EStDVOXsyU+Ki1n8msLvk=;
  b=an802PRK5bWkX8zYcalH9O9QNXey1obtvxwenqZALtC3uAXpwNZn2G8M
   bo4s/YPvcXQWMIGtGSiG9uX7jmDqRl+JUy3vG4YLuNDp2aYFEMICDJgR3
   eSdUnCvTovi7FHN4pHofJgoytA8GBjvdWAQTBLq+8aa2R5mkPj7HElSaw
   P+6zdKvpu9xHpQJqDFf0uIcWGscCYY6EXvefbLjVPWSvzf04jNhJbICkz
   dlNQOiG/JgIXQATHmgg/XH6b7Rlk+Eu8jMIp/ZDSEf21iXYROOb7HpyJO
   SSIB8IJbAkdGO40OLZGerG9/PBaCO47HhKjA5T0Ip4+Pc3ZP5fPyNvnxT
   w==;
X-CSE-ConnectionGUID: baehc69rRW+RO/k0rMOoBA==
X-CSE-MsgGUID: jiKI/WH3SYiiHX6MF0H6Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="68585875"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68585875"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 06:05:07 -0800
X-CSE-ConnectionGUID: F0IEXtFFSyGkQ3PUOwCHsw==
X-CSE-MsgGUID: dn4jDLHWTjKDN3PmH3kaAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200856726"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 27 Dec 2025 06:05:07 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZUum-000000005s7-3W9d;
	Sat, 27 Dec 2025 14:05:04 +0000
Date: Sat, 27 Dec 2025 22:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kexec/ranges.c:531 get_usable_memory_ranges()
 warn: we never enter this loop
Message-ID: <202512272106.KwwN6ZWB-lkp@intel.com>
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
head:   c53f467229a78287efa5b9f65bd22de64416660f
commit: b4a96ab50f368afc2360ff539a20254ca2c9a889 powerpc/kdump: Add support for crashkernel CMA reservation
date:   7 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 weeks ago
config: powerpc64-randconfig-r073-20251227 (https://download.01.org/0day-ci/archive/20251227/202512272106.KwwN6ZWB-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512272106.KwwN6ZWB-lkp@intel.com/

New smatch warnings:
arch/powerpc/kexec/ranges.c:531 get_usable_memory_ranges() warn: we never enter this loop

Old smatch warnings:
arch/powerpc/kexec/ranges.c:612 get_crash_memory_ranges() warn: we never enter this loop
arch/powerpc/kexec/ranges.c:612 get_crash_memory_ranges() warn: unsigned 'i' is never less than zero.
arch/powerpc/kexec/ranges.c:612 get_crash_memory_ranges() warn: unsigned 'i' is never less than zero.

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
