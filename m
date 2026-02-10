Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC0F1DC198
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 12:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770728144; cv=none; b=ilSJvJA5ysC7OV1lLovx2xzN5+dh8dpHlpdjBRpwvTmz5rjxxC0zB6+53Wg1qgA77e7X6N2oJD914R6NA2bpYo+QbFeq2yZ9V5+2NZCkm5uwPlj35EsZ+2ssnYtKiVDZkUdkNy6BwaQ6hN/iFuiusvjDPtz4wGXsR9HYmmRcRtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770728144; c=relaxed/simple;
	bh=PvLiR9ysiWbjuVbJjTdS+Nwe7UIZhT8gmKwtbQ6sb4U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q9G2TFv2Uy3Hdfad/tp74LBtk52l39mn9CAGvpl6xdpRy9BTT4CFKuUwMAQGnGaKGEmivTBu/2fjGfdhW641VHMIt11s8ucG7nO23hc4GXmOuvXWatRfJYgQocmyh0vDSRZfOEqTXkioBSuGUHGvVGagO28jOeu3zu5LnCBSmO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cc3FVhLF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cc3FVhLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770728142; x=1802264142;
  h=date:from:to:cc:subject:message-id;
  bh=PvLiR9ysiWbjuVbJjTdS+Nwe7UIZhT8gmKwtbQ6sb4U=;
  b=Cc3FVhLFeKsrzeuZIIVHjDzlluH5EtL1P5Q4c19q21TYLflX7yfWeEBz
   oY0oFoYxPiY2PktrfiRdTo7Lu3j76l3bfLSf327dIVQ84gT7U7e3gwm6c
   ZxN5r0B+DXAlYSRTe2vayrp1ka511qJrNeyyBwLzb5sPASF2FfQSiFf1D
   sUCMmKlyJMPymt9g0clxH/kiRT8J8dXHNZc9NYw3o4aq/xNpv1YhZPYSs
   bBEWDUZrWsrcwQtHXLn8AjmvJ4A4zDwC+sZw9yNggL89BqckAyJdCfI1L
   qMSoZdHeScqE6onwZ332VxPH3FMu6IWa5NM1FHdzu5uxl2WJGj8VrZmgi
   Q==;
X-CSE-ConnectionGUID: m7qfJo9LRSGNHXhlVQuokg==
X-CSE-MsgGUID: hF5Tcd5WQZSJ9XasvD6LXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71956231"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71956231"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 04:55:41 -0800
X-CSE-ConnectionGUID: e3ODThanQU6VUOAyPPeW6Q==
X-CSE-MsgGUID: Lzi41QvcStuAj3H4F3P4Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216444742"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Feb 2026 04:55:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpnHF-00000000p1I-3anl;
	Tue, 10 Feb 2026 12:55:37 +0000
Date: Tue, 10 Feb 2026 20:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/show_mem.c:435:4-33: opportunity for
 str_on_off(mem_alloc_profiling_enabled ( ))
Message-ID: <202602102044.4GTrI4L8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yueyang Pan <pyyjason@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72c395024dac5e215136cbff793455f065603b06
commit: 9abd8bd4c6b16d152b7149ef2f27a606ae4ebf4e mm/show_mem: dump the status of the mem alloc profiling before printing
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: um-randconfig-r061-20260210 (https://download.01.org/0day-ci/archive/20260210/202602102044.4GTrI4L8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602102044.4GTrI4L8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/show_mem.c:435:4-33: opportunity for str_on_off(mem_alloc_profiling_enabled ( ))

vim +435 mm/show_mem.c

e9aae1709264b2 Kefeng Wang        2023-05-16  400  
e9aae1709264b2 Kefeng Wang        2023-05-16  401  void __show_mem(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
e9aae1709264b2 Kefeng Wang        2023-05-16  402  {
e9aae1709264b2 Kefeng Wang        2023-05-16  403  	unsigned long total = 0, reserved = 0, highmem = 0;
e9aae1709264b2 Kefeng Wang        2023-05-16  404  	struct zone *zone;
e9aae1709264b2 Kefeng Wang        2023-05-16  405  
e9aae1709264b2 Kefeng Wang        2023-05-16  406  	printk("Mem-Info:\n");
1279aa0656bbeb Kefeng Wang        2023-06-30  407  	show_free_areas(filter, nodemask, max_zone_idx);
e9aae1709264b2 Kefeng Wang        2023-05-16  408  
e9aae1709264b2 Kefeng Wang        2023-05-16  409  	for_each_populated_zone(zone) {
e9aae1709264b2 Kefeng Wang        2023-05-16  410  
e9aae1709264b2 Kefeng Wang        2023-05-16  411  		total += zone->present_pages;
e9aae1709264b2 Kefeng Wang        2023-05-16  412  		reserved += zone->present_pages - zone_managed_pages(zone);
e9aae1709264b2 Kefeng Wang        2023-05-16  413  
e9aae1709264b2 Kefeng Wang        2023-05-16  414  		if (is_highmem(zone))
e9aae1709264b2 Kefeng Wang        2023-05-16  415  			highmem += zone->present_pages;
e9aae1709264b2 Kefeng Wang        2023-05-16  416  	}
e9aae1709264b2 Kefeng Wang        2023-05-16  417  
e9aae1709264b2 Kefeng Wang        2023-05-16  418  	printk("%lu pages RAM\n", total);
e9aae1709264b2 Kefeng Wang        2023-05-16  419  	printk("%lu pages HighMem/MovableOnly\n", highmem);
e9aae1709264b2 Kefeng Wang        2023-05-16  420  	printk("%lu pages reserved\n", reserved);
e9aae1709264b2 Kefeng Wang        2023-05-16  421  #ifdef CONFIG_CMA
e9aae1709264b2 Kefeng Wang        2023-05-16  422  	printk("%lu pages cma reserved\n", totalcma_pages);
e9aae1709264b2 Kefeng Wang        2023-05-16  423  #endif
e9aae1709264b2 Kefeng Wang        2023-05-16  424  #ifdef CONFIG_MEMORY_FAILURE
e9aae1709264b2 Kefeng Wang        2023-05-16  425  	printk("%lu pages hwpoisoned\n", atomic_long_read(&num_poisoned_pages));
e9aae1709264b2 Kefeng Wang        2023-05-16  426  #endif
1438d349d16b78 Suren Baghdasaryan 2024-03-21  427  #ifdef CONFIG_MEM_ALLOC_PROFILING
1438d349d16b78 Suren Baghdasaryan 2024-03-21  428  	{
1438d349d16b78 Suren Baghdasaryan 2024-03-21  429  		struct codetag_bytes tags[10];
1438d349d16b78 Suren Baghdasaryan 2024-03-21  430  		size_t i, nr;
1438d349d16b78 Suren Baghdasaryan 2024-03-21  431  
1438d349d16b78 Suren Baghdasaryan 2024-03-21  432  		nr = alloc_tag_top_users(tags, ARRAY_SIZE(tags), false);
1438d349d16b78 Suren Baghdasaryan 2024-03-21  433  		if (nr) {
9abd8bd4c6b16d Yueyang Pan        2025-09-03  434  			pr_notice("Memory allocations (profiling is currently turned %s):\n",
9abd8bd4c6b16d Yueyang Pan        2025-09-03 @435  				mem_alloc_profiling_enabled() ? "on" : "off");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
