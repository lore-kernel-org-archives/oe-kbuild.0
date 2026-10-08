Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5801436F914
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 03:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791429382; cv=none; b=r39kyXnMwz6lN2GRlGGICW2gBn7WjE9/KKxI7E/EnOhgU4cD1NgS/xvqk4zQUZNMocpFb/NJ1k7lgl6h6l+dSrceKxVdUqQOxCDOBCNmzi7fo9s1GGF3wRd/sexWEx7IqNExRw+PeNmZyelmnf849erfv0xUX3Y8WGR6c60hBsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791429382; c=relaxed/simple;
	bh=6WZC/rPrKoN4F4UHN+8q7MqQP7vkMMFNtnrLWjbwNS8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NRiPY/nZhlp5xFSMX5kbve/+wzfFEuOs/Lo11eN0/nTnCNcG1f/5p0R2lw8wyvUlpT7gSp2PGzLpDILQikD2x+h+/wLnqxXb/VV4J7lTa/P5cMIURt8kbv2sMKm2hv/5jkjTVt6y0af0MTfAJr2i1D+AhM3EWxtbAeeTDLBByMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+cnwAlV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+cnwAlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791429374; x=1822965374;
  h=date:from:to:cc:subject:message-id;
  bh=6WZC/rPrKoN4F4UHN+8q7MqQP7vkMMFNtnrLWjbwNS8=;
  b=E+cnwAlVm9ZooCUWjiwBXeMk2saY94zuFVCtu/4sL14YIpwdr4egiC/5
   4zOcjou+/JP3EB3CGQSreiezDxE1wGnW2hRI0UZegXiJTQYMyA3he38ZB
   g1MhUFpT7I81+JIsKZp7Vrcb6fg4pCsuvS5kWT3CzLYPSFBi8idOlQiI0
   D8tc1eSbk4LUeIkd8xf5xqDFVSVsefqe5wdh7CnYWb26tHktKhQQq62Pm
   +802aAGItZWego0h7N9SLmNMQsmPMF+JoKVI78aB9HTcSFYOITpjxyhh4
   routp4n6QCAsx5tSPQkx6uq4WHsRG5nPAfM1TE2LFMJrgpyl+4jZKZjYI
   A==;
X-CSE-ConnectionGUID: ZHXaoJtDSsWkE0kxLXwzVg==
X-CSE-MsgGUID: v+WKBrH5R4ydglDIEPu6Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="208408"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="208408"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 20:16:14 -0700
X-CSE-ConnectionGUID: sYFOtaTOQ5qO7ILiTEGidw==
X-CSE-MsgGUID: YCECc3zOR6GiGdG1DoUZWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="277743860"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 07 Oct 2026 20:16:12 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEec5-000000004fl-1ra2;
	Thu, 08 Oct 2026 03:16:09 +0000
Date: Thu, 08 Oct 2026 05:16:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/linux/mm_inline.h:131 lru_get_gen_flags() warn: mask
 and shift to zero: expr='(flags & ((((((1))) << (0)) - 1) << (((((((4 * 8) -
 0) - 0) - 1) - 0) - 0) - 0))) >> (((((((4 * 8) - 0) - 0) - 1) - 0) - 0) - 0)'
Message-ID: <202610080506.maQBOXyi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kairui Song <kasong@tencent.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-B4-Relay/mm-memcontrol-allow-update-of-LRU-statistic-without-holding-LRU-lock/20261003-205512
head:   fb7e985a90aa08774d1149de30384a36bb55bafb
commit: 484b378ce18958b2f1eef68305e242c351e2d2e5 mm/mglru: folio LRU refs based active/inactive number accounting
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: openrisc-randconfig-r2202-20261008 (https://download.01.org/0day-ci/archive/20261008/202610080506.maQBOXyi-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610080506.maQBOXyi-lkp@intel.com/

smatch warnings:
include/linux/mm_inline.h:131 lru_get_gen_flags() warn: mask and shift to zero: expr='(flags & ((((((1))) << (0)) - 1) << (((((((4 * 8) - 0) - 0) - 1) - 0) - 0) - 0))) >> (((((((4 * 8) - 0) - 0) - 1) - 0) - 0) - 0)'
include/linux/mm_inline.h:131 lru_get_gen_flags() warn: mask and shift to zero: expr='(flags & ((((((1))) << (0)) - 1) << (((((((4 * 8) - 0) - 0) - 1) - 0) - 0) - 0))) >> (((((((4 * 8) - 0) - 0) - 1) - 0) - 0) - 0)'

vim +131 include/linux/mm_inline.h

49ccf47e2e054aa Kairui Song 2026-09-06  121  
49ccf47e2e054aa Kairui Song 2026-09-06  122  /**
49ccf47e2e054aa Kairui Song 2026-09-06  123   * lru_get_gen_flags - Return the LRU generation number from folio flags.
49ccf47e2e054aa Kairui Song 2026-09-06  124   * @flags: folio flags
49ccf47e2e054aa Kairui Song 2026-09-06  125   *
49ccf47e2e054aa Kairui Song 2026-09-06  126   * Returns: A number between 0 and (MAX_NR_GENS - 1), inclusive. Returns
49ccf47e2e054aa Kairui Song 2026-09-06  127   * -1 if the flags indicate the folio is off the list (e.g., isolated).
49ccf47e2e054aa Kairui Song 2026-09-06  128   */
49ccf47e2e054aa Kairui Song 2026-09-06  129  static inline int lru_get_gen_flags(unsigned long flags)
ac35a490237446b Yu Zhao     2022-09-18  130  {
49ccf47e2e054aa Kairui Song 2026-09-06 @131  	int gen = ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
ac35a490237446b Yu Zhao     2022-09-18  132  
49ccf47e2e054aa Kairui Song 2026-09-06  133  	/* Exclude the legal -1 from the unsigned MAX_NR_GENS comparison */
49ccf47e2e054aa Kairui Song 2026-09-06  134  	VM_WARN_ON_ONCE(gen != -1 && gen >= MAX_NR_GENS);
49ccf47e2e054aa Kairui Song 2026-09-06  135  	return gen;
49ccf47e2e054aa Kairui Song 2026-09-06  136  }
49ccf47e2e054aa Kairui Song 2026-09-06  137  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
