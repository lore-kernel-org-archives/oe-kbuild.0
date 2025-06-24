Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D90428D8CA
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 12:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769781; cv=none; b=m6tgZBnLj3xNvXFZtPDF17u1GTmxs5YRtWSvY9Ql19IzTFDRgANz6UgFFu0HVv3+s6JHkSo0CGFe+PYsgSQJZD8bd/vMCt1xlqk57g8/Vbr/EXeVDbRE4ShpOMibs8bMwB2Fhlihe/OOzF3Ef1xs8IhstRteucqLLyF+L/k43eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769781; c=relaxed/simple;
	bh=iLMIwTjXcIsLwrfFvTzi/tcCwCBMrXsjGHo8nQ9LAxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GZgHsUxcQOtIsLna7r3QUrBqTZnBhd1/17IF6oUIUAevAfquljoYuTQHuVZZLf7UqO94JRsR2lsrs6k/STHNsuo/q+qsSRMnAcSIGzx7keZQULblTLeb5Wcl3VdsAoEhlnBazQUur1+3qhWPBuTrp0pXZz0hcuZWCw/FsyuIg3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AR1uM6J2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AR1uM6J2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750769780; x=1782305780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iLMIwTjXcIsLwrfFvTzi/tcCwCBMrXsjGHo8nQ9LAxo=;
  b=AR1uM6J2fb7dD488iw1Mhm8+HNaFakekHZzk/z3uGlnv1WSKl0s5ekzB
   z0t/2jZ0K9exVuQ0Kwic0WeYU2g3RZUEwsMm7J/+oa8lpxF+6oFE902u9
   GDGk/Pd8UjcmrjX5LGwQRtNyijV9E3abH3A6NmSXt/61EUyiYFbg35/g2
   X+jLe3536KvrGwvBGb9G8hMY7UOrsMirEPasjiF10OyTd2zVsxu8C6Ld9
   zC/md+udGDk+Y1PMzv9Mt7jDfZzD0ksuxo0pZpF5FRg1+GBmwP3eRzEdq
   wukZLBDGBRq84qtmj4ykX/Yr18db9wgvw2j/5gE1+nUXJ0gsZE+AVrLJ0
   g==;
X-CSE-ConnectionGUID: HkJKpzNcRwWhvvUHUdxf6w==
X-CSE-MsgGUID: IeEsrj0JTr+Sjh3/CEjyHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64434848"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="64434848"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 05:56:19 -0700
X-CSE-ConnectionGUID: gyQh3LHIRxCscWztwSnBqA==
X-CSE-MsgGUID: rPeLq35ZTpOcfxVTCH+LwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="157403992"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jun 2025 05:56:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU3CB-000S8I-2G;
	Tue, 24 Jun 2025 12:56:15 +0000
Date: Tue, 24 Jun 2025 20:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] mm: memcg: introduce PF_MEMALLOC_ACCOUNTFORCE to
 postpone reclaim to return-to-userland path
Message-ID: <202506242032.uShv7ASV-lkp@intel.com>
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
In-Reply-To: <71a4bbc284048ceb38eaac53dfa1031f92ac52b7.1750234270.git.hezhongkun.hzk@bytedance.com>
References: <71a4bbc284048ceb38eaac53dfa1031f92ac52b7.1750234270.git.hezhongkun.hzk@bytedance.com>
TO: Zhongkun He <hezhongkun.hzk@bytedance.com>
TO: akpm@linux-foundation.org
TO: tytso@mit.edu
TO: jack@suse.com
TO: hannes@cmpxchg.org
TO: mhocko@kernel.org
CC: muchun.song@linux.dev
CC: linux-ext4@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-mm@kvack.org
CC: cgroups@vger.kernel.org
CC: Zhongkun He <hezhongkun.hzk@bytedance.com>
CC: Muchun Song <songmuchun@bytedance.com>

Hi Zhongkun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on tytso-ext4/dev tip/sched/core brauner-vfs/vfs.all linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhongkun-He/mm-memcg-introduce-PF_MEMALLOC_ACCOUNTFORCE-to-postpone-reclaim-to-return-to-userland-path/20250618-194101
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/71a4bbc284048ceb38eaac53dfa1031f92ac52b7.1750234270.git.hezhongkun.hzk%40bytedance.com
patch subject: [PATCH 1/2] mm: memcg: introduce PF_MEMALLOC_ACCOUNTFORCE to postpone reclaim to return-to-userland path
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20250619 (https://download.01.org/0day-ci/archive/20250624/202506242032.uShv7ASV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506242032.uShv7ASV-lkp@intel.com/

smatch warnings:
mm/memcontrol.c:2341 mem_cgroup_handle_over_max() warn: use 'gfp_mask' here instead of GFP_KERNEL?

vim +/gfp_mask +2341 mm/memcontrol.c

b5db553cc19549 Zhongkun He 2025-06-18  2319  
b5db553cc19549 Zhongkun He 2025-06-18  2320  void mem_cgroup_handle_over_max(gfp_t gfp_mask)
b5db553cc19549 Zhongkun He 2025-06-18  2321  {
b5db553cc19549 Zhongkun He 2025-06-18  2322  	unsigned long nr_reclaimed = 0;
b5db553cc19549 Zhongkun He 2025-06-18  2323  	unsigned int nr_pages = current->memcg_nr_pages_over_max;
b5db553cc19549 Zhongkun He 2025-06-18  2324  	int nr_retries = MAX_RECLAIM_RETRIES;
b5db553cc19549 Zhongkun He 2025-06-18  2325  	struct mem_cgroup *memcg, *mem_over_limit;
b5db553cc19549 Zhongkun He 2025-06-18  2326  
b5db553cc19549 Zhongkun He 2025-06-18  2327  	if (likely(!nr_pages))
b5db553cc19549 Zhongkun He 2025-06-18  2328  		return;
b5db553cc19549 Zhongkun He 2025-06-18  2329  
b5db553cc19549 Zhongkun He 2025-06-18  2330  	memcg = get_mem_cgroup_from_mm(current->mm);
b5db553cc19549 Zhongkun He 2025-06-18  2331  	current->memcg_nr_pages_over_max = 0;
b5db553cc19549 Zhongkun He 2025-06-18  2332  
b5db553cc19549 Zhongkun He 2025-06-18  2333  retry:
b5db553cc19549 Zhongkun He 2025-06-18  2334  	mem_over_limit = get_over_limit_memcg(memcg);
b5db553cc19549 Zhongkun He 2025-06-18  2335  	if (!mem_over_limit)
b5db553cc19549 Zhongkun He 2025-06-18  2336  		goto out;
b5db553cc19549 Zhongkun He 2025-06-18  2337  
b5db553cc19549 Zhongkun He 2025-06-18  2338  	while (nr_reclaimed < nr_pages) {
b5db553cc19549 Zhongkun He 2025-06-18  2339  		unsigned long reclaimed;
b5db553cc19549 Zhongkun He 2025-06-18  2340  
b5db553cc19549 Zhongkun He 2025-06-18 @2341  		reclaimed = try_to_free_mem_cgroup_pages(mem_over_limit,
b5db553cc19549 Zhongkun He 2025-06-18  2342  					nr_pages, GFP_KERNEL,
b5db553cc19549 Zhongkun He 2025-06-18  2343  					MEMCG_RECLAIM_MAY_SWAP,
b5db553cc19549 Zhongkun He 2025-06-18  2344  					NULL);
b5db553cc19549 Zhongkun He 2025-06-18  2345  
b5db553cc19549 Zhongkun He 2025-06-18  2346  		if (!reclaimed && !nr_retries--)
b5db553cc19549 Zhongkun He 2025-06-18  2347  			break;
b5db553cc19549 Zhongkun He 2025-06-18  2348  
b5db553cc19549 Zhongkun He 2025-06-18  2349  		nr_reclaimed += reclaimed;
b5db553cc19549 Zhongkun He 2025-06-18  2350  	}
b5db553cc19549 Zhongkun He 2025-06-18  2351  
b5db553cc19549 Zhongkun He 2025-06-18  2352  	if ((nr_reclaimed < nr_pages) &&
b5db553cc19549 Zhongkun He 2025-06-18  2353  	    (page_counter_read(&mem_over_limit->memory) >
b5db553cc19549 Zhongkun He 2025-06-18  2354  	    READ_ONCE(mem_over_limit->memory.max)) &&
b5db553cc19549 Zhongkun He 2025-06-18  2355  	    mem_cgroup_oom(mem_over_limit, gfp_mask,
b5db553cc19549 Zhongkun He 2025-06-18  2356  			  get_order((nr_pages - nr_reclaimed)  * PAGE_SIZE))) {
b5db553cc19549 Zhongkun He 2025-06-18  2357  		nr_retries = MAX_RECLAIM_RETRIES;
b5db553cc19549 Zhongkun He 2025-06-18  2358  		goto retry;
b5db553cc19549 Zhongkun He 2025-06-18  2359  	}
b5db553cc19549 Zhongkun He 2025-06-18  2360  
b5db553cc19549 Zhongkun He 2025-06-18  2361  out:
b5db553cc19549 Zhongkun He 2025-06-18  2362  	css_put(&memcg->css);
b5db553cc19549 Zhongkun He 2025-06-18  2363  }
b5db553cc19549 Zhongkun He 2025-06-18  2364  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
