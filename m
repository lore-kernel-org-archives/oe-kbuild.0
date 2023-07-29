Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28BD7C
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Jul 2023 02:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690596106; x=1722132106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d2a/R0hv8OS4Evn86SfviycdCPNvW1KGMOMz6r8Ap9Q=;
  b=Mikb1krX3M1i0DwvuOUmtZSW+q9cYsk0hbHNPTvAGe38iNfnxt0SrHrA
   ESBZTrgtvJw4/kx5d0sAkpzVps+xmoUqi0gfZm6g9/NEOqQVJ6ovhLnS4
   EdB7eBoXvrScYDglRd6zgf39cA4tdPCkYKW/15nIV6PdSpIExH1mPmMzA
   0bNuLDInprPO5/snXKWot9dNTLoYExhRr5S9ZCpAEnpRQ8nh0Ygjb9wqR
   6cb9aZQVeJgEGW/2x2Y83ohZfdHv8MECQ0/RBsOYb7iL635Ib8+1fNvP9
   5n6Cwk4MlWOnwpKNJ9DvyGfS8Pf18HNveun6wwfFB21op2GgDEq6YC1Gj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="348325952"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="348325952"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 19:01:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871024703"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2023 19:01:46 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPZH6-0003kZ-0H;
	Sat, 29 Jul 2023 02:01:44 +0000
Date: Sat, 29 Jul 2023 10:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307290936.NsOTbkUu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: kernel/sched/fair.c:2427:31: sparse: sparse: static assertion failed: "clamp() low limit task_scan_min(p) greater than high limit task_scan_max(p)""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master crng-random/master v6.5-rc3 next-20230728]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: s390-randconfig-r083-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290936.NsOTbkUu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290936.NsOTbkUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307290936.NsOTbkUu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:2427:31: sparse: sparse: bad integer constant expression
>> kernel/sched/fair.c:2427:31: sparse: sparse: static assertion failed: "clamp() low limit task_scan_min(p) greater than high limit task_scan_max(p)"
   kernel/sched/fair.c:3521:16: sparse: sparse: bad integer constant expression
   kernel/sched/fair.c:3521:16: sparse: sparse: static assertion failed: "clamp() low limit (long)((1UL << 1)) greater than high limit (long)(tg_shares)"
   kernel/sched/fair.c:9226:20: sparse: sparse: bad integer constant expression
   kernel/sched/fair.c:9226:20: sparse: sparse: static assertion failed: "clamp() low limit 1UL greater than high limit max_load_balance_interval"
   kernel/sched/fair.c:11091:20: sparse: sparse: bad integer constant expression
   kernel/sched/fair.c:11091:20: sparse: sparse: static assertion failed: "clamp() low limit 1UL greater than high limit max_load_balance_interval"
   kernel/sched/fair.c:5566:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5566:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5566:22: sparse:    struct task_struct *
   kernel/sched/fair.c:9762:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9762:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9762:22: sparse:    struct task_struct *
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *

vim +2427 kernel/sched/fair.c

04bb2f94750542 Rik van Riel  2013-10-07  2354  
04bb2f94750542 Rik van Riel  2013-10-07  2355  /*
04bb2f94750542 Rik van Riel  2013-10-07  2356   * Increase the scan period (slow down scanning) if the majority of
04bb2f94750542 Rik van Riel  2013-10-07  2357   * our memory is already on our local node, or if the majority of
04bb2f94750542 Rik van Riel  2013-10-07  2358   * the page accesses are shared with other processes.
04bb2f94750542 Rik van Riel  2013-10-07  2359   * Otherwise, decrease the scan period.
04bb2f94750542 Rik van Riel  2013-10-07  2360   */
04bb2f94750542 Rik van Riel  2013-10-07  2361  static void update_task_scan_period(struct task_struct *p,
04bb2f94750542 Rik van Riel  2013-10-07  2362  			unsigned long shared, unsigned long private)
04bb2f94750542 Rik van Riel  2013-10-07  2363  {
04bb2f94750542 Rik van Riel  2013-10-07  2364  	unsigned int period_slot;
37ec97deb3a8c6 Rik van Riel  2017-07-31  2365  	int lr_ratio, ps_ratio;
04bb2f94750542 Rik van Riel  2013-10-07  2366  	int diff;
04bb2f94750542 Rik van Riel  2013-10-07  2367  
04bb2f94750542 Rik van Riel  2013-10-07  2368  	unsigned long remote = p->numa_faults_locality[0];
04bb2f94750542 Rik van Riel  2013-10-07  2369  	unsigned long local = p->numa_faults_locality[1];
04bb2f94750542 Rik van Riel  2013-10-07  2370  
04bb2f94750542 Rik van Riel  2013-10-07  2371  	/*
04bb2f94750542 Rik van Riel  2013-10-07  2372  	 * If there were no record hinting faults then either the task is
7d380f24fe6620 Bharata B Rao 2021-10-04  2373  	 * completely idle or all activity is in areas that are not of interest
074c238177a75f Mel Gorman    2015-03-25  2374  	 * to automatic numa balancing. Related to that, if there were failed
074c238177a75f Mel Gorman    2015-03-25  2375  	 * migration then it implies we are migrating too quickly or the local
074c238177a75f Mel Gorman    2015-03-25  2376  	 * node is overloaded. In either case, scan slower
04bb2f94750542 Rik van Riel  2013-10-07  2377  	 */
074c238177a75f Mel Gorman    2015-03-25  2378  	if (local + shared == 0 || p->numa_faults_locality[2]) {
04bb2f94750542 Rik van Riel  2013-10-07  2379  		p->numa_scan_period = min(p->numa_scan_period_max,
04bb2f94750542 Rik van Riel  2013-10-07  2380  			p->numa_scan_period << 1);
04bb2f94750542 Rik van Riel  2013-10-07  2381  
04bb2f94750542 Rik van Riel  2013-10-07  2382  		p->mm->numa_next_scan = jiffies +
04bb2f94750542 Rik van Riel  2013-10-07  2383  			msecs_to_jiffies(p->numa_scan_period);
04bb2f94750542 Rik van Riel  2013-10-07  2384  
04bb2f94750542 Rik van Riel  2013-10-07  2385  		return;
04bb2f94750542 Rik van Riel  2013-10-07  2386  	}
04bb2f94750542 Rik van Riel  2013-10-07  2387  
04bb2f94750542 Rik van Riel  2013-10-07  2388  	/*
04bb2f94750542 Rik van Riel  2013-10-07  2389  	 * Prepare to scale scan period relative to the current period.
04bb2f94750542 Rik van Riel  2013-10-07  2390  	 *	 == NUMA_PERIOD_THRESHOLD scan period stays the same
04bb2f94750542 Rik van Riel  2013-10-07  2391  	 *       <  NUMA_PERIOD_THRESHOLD scan period decreases (scan faster)
04bb2f94750542 Rik van Riel  2013-10-07  2392  	 *	 >= NUMA_PERIOD_THRESHOLD scan period increases (scan slower)
04bb2f94750542 Rik van Riel  2013-10-07  2393  	 */
04bb2f94750542 Rik van Riel  2013-10-07  2394  	period_slot = DIV_ROUND_UP(p->numa_scan_period, NUMA_PERIOD_SLOTS);
37ec97deb3a8c6 Rik van Riel  2017-07-31  2395  	lr_ratio = (local * NUMA_PERIOD_SLOTS) / (local + remote);
37ec97deb3a8c6 Rik van Riel  2017-07-31  2396  	ps_ratio = (private * NUMA_PERIOD_SLOTS) / (private + shared);
37ec97deb3a8c6 Rik van Riel  2017-07-31  2397  
37ec97deb3a8c6 Rik van Riel  2017-07-31  2398  	if (ps_ratio >= NUMA_PERIOD_THRESHOLD) {
37ec97deb3a8c6 Rik van Riel  2017-07-31  2399  		/*
37ec97deb3a8c6 Rik van Riel  2017-07-31  2400  		 * Most memory accesses are local. There is no need to
37ec97deb3a8c6 Rik van Riel  2017-07-31  2401  		 * do fast NUMA scanning, since memory is already local.
37ec97deb3a8c6 Rik van Riel  2017-07-31  2402  		 */
37ec97deb3a8c6 Rik van Riel  2017-07-31  2403  		int slot = ps_ratio - NUMA_PERIOD_THRESHOLD;
37ec97deb3a8c6 Rik van Riel  2017-07-31  2404  		if (!slot)
37ec97deb3a8c6 Rik van Riel  2017-07-31  2405  			slot = 1;
37ec97deb3a8c6 Rik van Riel  2017-07-31  2406  		diff = slot * period_slot;
37ec97deb3a8c6 Rik van Riel  2017-07-31  2407  	} else if (lr_ratio >= NUMA_PERIOD_THRESHOLD) {
37ec97deb3a8c6 Rik van Riel  2017-07-31  2408  		/*
37ec97deb3a8c6 Rik van Riel  2017-07-31  2409  		 * Most memory accesses are shared with other tasks.
37ec97deb3a8c6 Rik van Riel  2017-07-31  2410  		 * There is no point in continuing fast NUMA scanning,
37ec97deb3a8c6 Rik van Riel  2017-07-31  2411  		 * since other tasks may just move the memory elsewhere.
37ec97deb3a8c6 Rik van Riel  2017-07-31  2412  		 */
37ec97deb3a8c6 Rik van Riel  2017-07-31  2413  		int slot = lr_ratio - NUMA_PERIOD_THRESHOLD;
04bb2f94750542 Rik van Riel  2013-10-07  2414  		if (!slot)
04bb2f94750542 Rik van Riel  2013-10-07  2415  			slot = 1;
04bb2f94750542 Rik van Riel  2013-10-07  2416  		diff = slot * period_slot;
04bb2f94750542 Rik van Riel  2013-10-07  2417  	} else {
04bb2f94750542 Rik van Riel  2013-10-07  2418  		/*
37ec97deb3a8c6 Rik van Riel  2017-07-31  2419  		 * Private memory faults exceed (SLOTS-THRESHOLD)/SLOTS,
37ec97deb3a8c6 Rik van Riel  2017-07-31  2420  		 * yet they are not on the local NUMA node. Speed up
37ec97deb3a8c6 Rik van Riel  2017-07-31  2421  		 * NUMA scanning to get the memory moved over.
04bb2f94750542 Rik van Riel  2013-10-07  2422  		 */
37ec97deb3a8c6 Rik van Riel  2017-07-31  2423  		int ratio = max(lr_ratio, ps_ratio);
37ec97deb3a8c6 Rik van Riel  2017-07-31  2424  		diff = -(NUMA_PERIOD_THRESHOLD - ratio) * period_slot;
04bb2f94750542 Rik van Riel  2013-10-07  2425  	}
04bb2f94750542 Rik van Riel  2013-10-07  2426  
04bb2f94750542 Rik van Riel  2013-10-07 @2427  	p->numa_scan_period = clamp(p->numa_scan_period + diff,
04bb2f94750542 Rik van Riel  2013-10-07  2428  			task_scan_min(p), task_scan_max(p));
04bb2f94750542 Rik van Riel  2013-10-07  2429  	memset(p->numa_faults_locality, 0, sizeof(p->numa_faults_locality));
04bb2f94750542 Rik van Riel  2013-10-07  2430  }
04bb2f94750542 Rik van Riel  2013-10-07  2431  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
