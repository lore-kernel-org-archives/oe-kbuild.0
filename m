Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E722AE8D
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Sep 2025 17:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758822340; cv=none; b=RmyOxP5FitQhlQXvq+KNHG795wr4LfROKpNF9wc5me8ii1BpSfAePsHz5mUhUh5MZWQ6Hj2IaEqWuTO1lrBEwgP4aN20ESq6rBiuasBzUg2r1lB2v3xAzT0GAQ+pRe8/5QyX5uuWfvsZuViAP91Jq5uXvk+Xpe1z8oI23iB2BHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758822340; c=relaxed/simple;
	bh=rkZL1K//QzXZWSpTb3SAL88kzjNcsENxfaPpCTOgq/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kRbAowbniMJZXQJNdYYFwsiyIw0f6UqxX/gmBxWFCKR+8Zam4jy/yxAWVqlZ9RF+7orxcycL/EqzI90AHi3emYFvMlMjF1AgD+gpr6gkSZGRJrbwB7giKRNjvniRTRMGaBY0k8IvUcZEpVIp6WJ2jFIdwTPrm51Z7m/YPkSB6wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTec6+R8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTec6+R8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758822338; x=1790358338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rkZL1K//QzXZWSpTb3SAL88kzjNcsENxfaPpCTOgq/Y=;
  b=NTec6+R8xUjWbAyNRfC0ftjvFSB3wbKT95297ufWmYWgwn/buZni5pky
   xIraGgRkeFeWgliYyWfifsq+zk9hHQ7PQlVvgEdrLycaEL6Ne8nemmAUm
   2w7ZC6KPbxQaYT/qKm8qTTVZVIMP0MV30iLlxm/9AFjpxQ9m+ECU6cSPb
   XKBtds/2e/dHjdhP+frupAZVchYHMlYpKegt8M07wN7Jty1+eHof73lZt
   2EHGWbU4lZ7hV3XE2ukis4WDaPNed0a+//MY0Bc7mck7iWiggbwQ39LrY
   Uq+Mt5T4G8znR6uzKZ27odYgJC91wEe2Kr0q0cCx2dND5IhZ1HjUQttUi
   w==;
X-CSE-ConnectionGUID: sakAFJ0GTfqFRLkYzl325g==
X-CSE-MsgGUID: 48eFYamuRn6h1xe+djSftQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61063099"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61063099"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 10:45:37 -0700
X-CSE-ConnectionGUID: wOQZP6EnQdO5F1YlP784Ww==
X-CSE-MsgGUID: 99vU0dBMSDKh7VxUJ+/o+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="201077660"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Sep 2025 10:45:35 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1q25-0005TF-2U;
	Thu, 25 Sep 2025 17:45:30 +0000
Date: Fri, 26 Sep 2025 01:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/4] mm/page_alloc/vmstat: Simplify
 refresh_cpu_vm_stats change detection
Message-ID: <202509260132.awvdNKqF-lkp@intel.com>
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
In-Reply-To: <20250924204409.1706524-2-joshua.hahnjy@gmail.com>
References: <20250924204409.1706524-2-joshua.hahnjy@gmail.com>
TO: Joshua Hahn <joshua.hahnjy@gmail.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Johannes Weiner <hannes@cmpxchg.org>
CC: Chris Mason <chris.mason@fusionio.com>
CC: Kiryl Shutsemau <kirill@shutemov.name>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: Brendan Jackman <jackmanb@google.com>
CC: David Hildenbrand <david@redhat.com>
CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Michal Hocko <mhocko@suse.com>
CC: Mike Rapoport <rppt@kernel.org>
CC: Suren Baghdasaryan <surenb@google.com>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: Zi Yan <ziy@nvidia.com>
CC: linux-kernel@vger.kernel.org
CC: kernel-team@meta.com

Hi Joshua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 097a6c336d0080725c626fda118ecfec448acd0f]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-page_alloc-vmstat-Simplify-refresh_cpu_vm_stats-change-detection/20250925-044532
base:   097a6c336d0080725c626fda118ecfec448acd0f
patch link:    https://lore.kernel.org/r/20250924204409.1706524-2-joshua.hahnjy%40gmail.com
patch subject: [PATCH v2 1/4] mm/page_alloc/vmstat: Simplify refresh_cpu_vm_stats change detection
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: mips-randconfig-r073-20250925 (https://download.01.org/0day-ci/archive/20250926/202509260132.awvdNKqF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509260132.awvdNKqF-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:2591 decay_pcp_high() error: uninitialized symbol 'todo'.

vim +/todo +2591 mm/page_alloc.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  2559  
51a755c56dc05a Ying Huang     2023-10-16  2560  /*
51a755c56dc05a Ying Huang     2023-10-16  2561   * Called from the vmstat counter updater to decay the PCP high.
51a755c56dc05a Ying Huang     2023-10-16  2562   * Return whether there are addition works to do.
51a755c56dc05a Ying Huang     2023-10-16  2563   */
06fb80866d37b0 Joshua Hahn    2025-09-24  2564  bool decay_pcp_high(struct zone *zone, struct per_cpu_pages *pcp)
51a755c56dc05a Ying Huang     2023-10-16  2565  {
51a755c56dc05a Ying Huang     2023-10-16  2566  	int high_min, to_drain, batch;
06fb80866d37b0 Joshua Hahn    2025-09-24  2567  	bool todo;
51a755c56dc05a Ying Huang     2023-10-16  2568  
51a755c56dc05a Ying Huang     2023-10-16  2569  	high_min = READ_ONCE(pcp->high_min);
51a755c56dc05a Ying Huang     2023-10-16  2570  	batch = READ_ONCE(pcp->batch);
51a755c56dc05a Ying Huang     2023-10-16  2571  	/*
51a755c56dc05a Ying Huang     2023-10-16  2572  	 * Decrease pcp->high periodically to try to free possible
51a755c56dc05a Ying Huang     2023-10-16  2573  	 * idle PCP pages.  And, avoid to free too many pages to
51a755c56dc05a Ying Huang     2023-10-16  2574  	 * control latency.  This caps pcp->high decrement too.
51a755c56dc05a Ying Huang     2023-10-16  2575  	 */
51a755c56dc05a Ying Huang     2023-10-16  2576  	if (pcp->high > high_min) {
51a755c56dc05a Ying Huang     2023-10-16  2577  		pcp->high = max3(pcp->count - (batch << CONFIG_PCP_BATCH_SCALE_MAX),
51a755c56dc05a Ying Huang     2023-10-16  2578  				 pcp->high - (pcp->high >> 3), high_min);
51a755c56dc05a Ying Huang     2023-10-16  2579  		if (pcp->high > high_min)
06fb80866d37b0 Joshua Hahn    2025-09-24  2580  			todo = true;
51a755c56dc05a Ying Huang     2023-10-16  2581  	}
51a755c56dc05a Ying Huang     2023-10-16  2582  
51a755c56dc05a Ying Huang     2023-10-16  2583  	to_drain = pcp->count - pcp->high;
51a755c56dc05a Ying Huang     2023-10-16  2584  	if (to_drain > 0) {
51a755c56dc05a Ying Huang     2023-10-16  2585  		spin_lock(&pcp->lock);
51a755c56dc05a Ying Huang     2023-10-16  2586  		free_pcppages_bulk(zone, to_drain, pcp, 0);
51a755c56dc05a Ying Huang     2023-10-16  2587  		spin_unlock(&pcp->lock);
06fb80866d37b0 Joshua Hahn    2025-09-24  2588  		todo = true;
51a755c56dc05a Ying Huang     2023-10-16  2589  	}
51a755c56dc05a Ying Huang     2023-10-16  2590  
51a755c56dc05a Ying Huang     2023-10-16 @2591  	return todo;
51a755c56dc05a Ying Huang     2023-10-16  2592  }
51a755c56dc05a Ying Huang     2023-10-16  2593  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
