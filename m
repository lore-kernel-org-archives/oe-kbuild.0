Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037A3244687
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 02:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791081644; cv=none; b=UAL5b/kZw/v0ayc2KavpgdIUGZTcTa5ZYrqpCZpbVt7+rsIHAi5Nm9NDg/7NaZ4zexqe0DM0F6D88VLL0tAaWUcf2wyqpJmbVsfBBI73Ig14U8cSGgwg5Wa8C6k2l2NXL5bKYPsz6W0v8+FHFBy8Poc9GIIVcuCP3J4ioBkF2wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791081644; c=relaxed/simple;
	bh=gA4wxs701x1hTACJeZBueQV4tp7N6V3wX/iHcornmE8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qti0GtdGqfhYJ4PlyfoUHrgPnLiHoUZZRUKOi2w/Jj4pjVrl52cb+XKYyDQT/VAMJpyZAJ9qqke99rWE7ueUSxIzbIZYVch0y/38BRrKfKUZxau7/06YDOQUI47UqoSaEHBh9/INHlVEUz7HBbaxVoGaTDFg6nCw9p1auw8+yGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHkDe39V; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHkDe39V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791081642; x=1822617642;
  h=date:from:to:cc:subject:message-id;
  bh=gA4wxs701x1hTACJeZBueQV4tp7N6V3wX/iHcornmE8=;
  b=LHkDe39VLh7cmfDbrFbKTbKkTBnEqz7MxDPCL/JgMcem+A6LJvos1cce
   LsffoQOE041zqrJ6PEVXeAYwF2VhAq2A79IXuGoTEr9SOhY/sRM53RM/j
   p8UeEjQD/3JWS0Doy9KiTqhEQyIzRioYhQwrrMqPHAjewWExz2tPfrQYS
   OPHmK/L62euKadsxSJxdNMi4tEFo79GU1RNaaVx4zN0Ub515EwVaYrWrV
   UzPqgijmK4Ds74v1cZzaLpJSQ9bPCGRqgDQ2jPYt8MfjRf/mI5jmYabbW
   kAxHhdgLLxomBeFCEFybpQytPwPlDm3cGTJ2R9hXN5mj5U+FXRGazH5ml
   A==;
X-CSE-ConnectionGUID: ob1buXNUQYqmYSSvHD/BcQ==
X-CSE-MsgGUID: x3FTOvnVQLOiOxIdJScOyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="109281619"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="109281619"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 19:40:42 -0700
X-CSE-ConnectionGUID: fZQgjPh4TR+kuWJ+rBMJRA==
X-CSE-MsgGUID: MQ1OK8pHQVCEPRyWEN1wnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="559687"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 03 Oct 2026 19:40:41 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDC9W-00000000UO9-0t9s;
	Sun, 04 Oct 2026 02:40:38 +0000
Date: Sun, 04 Oct 2026 10:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/mm_inline.h:131:19: warning: overflow in
 conversion from 'long unsigned int' to 'int' changes value from
 '18446744073709551615' to '-1'
Message-ID: <202610041009.rRGnlvdY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Kairui-Song-via-B4-Relay/mm-memcontrol-allow-update-of-LRU-statistic-without-holding-LRU-lock/20261003-205512, commit: a24ab9c3982c5dca7d02d319bddb26221bbe433c"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kairui Song <kasong@tencent.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-B4-Relay/mm-memcontrol-allow-update-of-LRU-statistic-without-holding-LRU-lock/20261003-205512
head:   fb7e985a90aa08774d1149de30384a36bb55bafb
commit: a24ab9c3982c5dca7d02d319bddb26221bbe433c mm/mglru: make folio lru referenced times count a generic API
date:   14 hours ago
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20261004/202610041009.rRGnlvdY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041009.rRGnlvdY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610041009.rRGnlvdY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:47:
   include/linux/mm_inline.h: In function 'lru_get_gen_flags':
>> include/linux/mm_inline.h:131:19: warning: overflow in conversion from 'long unsigned int' to 'int' changes value from '18446744073709551615' to '-1' [-Woverflow]
     131 |         int gen = ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
         |                   ^


vim +131 include/linux/mm_inline.h

49ccf47e2e054a Kairui Song 2026-09-06  121  
49ccf47e2e054a Kairui Song 2026-09-06  122  /**
49ccf47e2e054a Kairui Song 2026-09-06  123   * lru_get_gen_flags - Return the LRU generation number from folio flags.
49ccf47e2e054a Kairui Song 2026-09-06  124   * @flags: folio flags
49ccf47e2e054a Kairui Song 2026-09-06  125   *
49ccf47e2e054a Kairui Song 2026-09-06  126   * Returns: A number between 0 and (MAX_NR_GENS - 1), inclusive. Returns
49ccf47e2e054a Kairui Song 2026-09-06  127   * -1 if the flags indicate the folio is off the list (e.g., isolated).
49ccf47e2e054a Kairui Song 2026-09-06  128   */
49ccf47e2e054a Kairui Song 2026-09-06  129  static inline int lru_get_gen_flags(unsigned long flags)
ac35a490237446 Yu Zhao     2022-09-18  130  {
49ccf47e2e054a Kairui Song 2026-09-06 @131  	int gen = ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
ac35a490237446 Yu Zhao     2022-09-18  132  
49ccf47e2e054a Kairui Song 2026-09-06  133  	/* Exclude the legal -1 from the unsigned MAX_NR_GENS comparison */
49ccf47e2e054a Kairui Song 2026-09-06  134  	VM_WARN_ON_ONCE(gen != -1 && gen >= MAX_NR_GENS);
49ccf47e2e054a Kairui Song 2026-09-06  135  	return gen;
49ccf47e2e054a Kairui Song 2026-09-06  136  }
49ccf47e2e054a Kairui Song 2026-09-06  137  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
