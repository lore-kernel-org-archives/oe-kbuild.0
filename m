Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D966446E019
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389312; cv=none; b=mNlQEmRDknDA4lb0S6NcjIBW1e2cRjk3Vq/85dbJ4hLPNioTrd+AcTM54W2jJIVNx99v+2ylj9WRNTzynOHicRlj6/YgPJ1j0g0J1ASQz9cY5OeQ/Kv83ejQTxfC409sXgaKFpHLHm4iMCswz63tteFuYEb5V0smjFVgRhtGjks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389312; c=relaxed/simple;
	bh=dAU38HDpyTuvJ+hyYHJGWIWowVtwiPaDXrZ/HaFz+xc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=do5oqyFfGwU2/N5A75aRVLw5SFP9BOCr59MqlPBSdmZKoEtOdc7ljjwcL1aoid8ZlltCDUrAsUlFDHkKIl2LxX6xoZkTfmzX+T5FlbgNQVKoVBYmpBf0/sHPZAuiSHKfo6WGIIrWYOAqtfullQl+Dysr0gEMFQiLeytBIN93EUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bI3P4F7o; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bI3P4F7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789389310; x=1820925310;
  h=date:from:to:cc:subject:message-id;
  bh=dAU38HDpyTuvJ+hyYHJGWIWowVtwiPaDXrZ/HaFz+xc=;
  b=bI3P4F7ovAURaAi7i9iXKh05DMzC6aQsMzG2W/FFfKuUWkx2csGz4Vli
   MXEWnhVd3G9TzhRfNdCxhr8rY7ELGYyLe7ll0QeuThZKkZxImhn2Nc5Ed
   reLjnm7/BBv8WtlDIUM9lHBSDHtMNI0WWOTWATQN2Mkbk5Gs7mgB+CYtS
   GOvzlKVTC9F8jDWyBobDHFokkaDcWM+HDoCfGEy8EFfVmxnm2rOZsRceh
   hYZu3ZEv96HMAz217za4L2om0iKG3YG1M6r+0/VQO/q5HkmEGWkGD2GIb
   eUE+ktv1wa7ZJOSEvNZaMPFQchpEvWO9gBPc59YNsPy7hmHpPr5SI4TW2
   Q==;
X-CSE-ConnectionGUID: EasG26vQQeSmNanCAK3exg==
X-CSE-MsgGUID: 54UJFg5PRk6gcnnmrRxUjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89502317"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89502317"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 05:35:09 -0700
X-CSE-ConnectionGUID: EgchbYX5SqWVsvhHqe3TmQ==
X-CSE-MsgGUID: qtxq4eHIQLyH3zfkv2sVlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273144366"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 14 Sep 2026 05:35:09 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x65tp-000000000B5-2ame;
	Mon, 14 Sep 2026 12:35:05 +0000
Date: Mon, 14 Sep 2026 14:34:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/show_mem.c:435:4-33: opportunity for
 str_on_off(mem_alloc_profiling_enabled ( ))
Message-ID: <202609141435.Nq7c9tUX-lkp@intel.com>
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
head:   704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
commit: 9abd8bd4c6b16d152b7149ef2f27a606ae4ebf4e mm/show_mem: dump the status of the mem alloc profiling before printing
date:   12 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-104-20260913 (https://download.01.org/0day-ci/archive/20260914/202609141435.Nq7c9tUX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9abd8bd4c6b1 ("mm/show_mem: dump the status of the mem alloc profiling before printing")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609141435.Nq7c9tUX-lkp@intel.com/

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
