Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C3F212548
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 17:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765475081; cv=none; b=nY8vRvpuMYYAxTiKSHZgMdgdQJ8JML4VElm+l3fHJ6WAPqZw5dfbiV9JVBI4IyFyxv5Utqg7w/8TeC3G/hwE41gyZuMLM9s2NnCJMmgVOEvb9p5yzsL4sh2lW/ll6+29Kn2Nzl+L2vDDm64ZHOUNPL03ktODDuu+F3/NhpPu5xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765475081; c=relaxed/simple;
	bh=jwV7GKozCx5B9p7L/uomXvwQ2dggpipbzpDtbVVu2Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=amrh9/0J2Y29Jlv1rJP0IveYc6qRjcmJNMOK8k/bXf5xwUQT0ZKnZyjQQVNBiMVW/4gHAYRW5fLqaBwWWRS6R3DW/qwdfm1BgyT8/Etz8gWK8V/keRi6pMR4fORZn32clYo60UFi9FV/8NQitLvHlZuWyfTZhD4k7TUDAbcI9j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5pNSVSw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5pNSVSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765475079; x=1797011079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jwV7GKozCx5B9p7L/uomXvwQ2dggpipbzpDtbVVu2Rs=;
  b=A5pNSVSwNDq39/UIKw23HJGYpx/4xRKD9koNI6sLRN5H8HnrOSJW6l6L
   ijE9IhxfhYXmNM5MV7j4yCqrWZbR1lnBT6IYF12keHHS4sF7vuUVeYgbu
   IdAFjqZ1bIfy7Hkw0WsQ0nCqtC27P1bhwRGde67gW5nB/xVx4veQq0wib
   B1UmIN5UOUOtO8cA5SkzKQxqY9NCJZcWVQogEFiM/51pRvlXAIture/6e
   RaTpxoilb/nMA8g1mH3nCSnes+b1pUykvKLYBOzZWBN9qqXBRVHWS3fw9
   HbXW7sY9hsX8G9hO7QFvwmgrr4J7jGJBfiEbK6275b2eB7vx+GdGdabjB
   w==;
X-CSE-ConnectionGUID: X0YS2m4dRw6IDLA8mELyWA==
X-CSE-MsgGUID: TKowPqwuTwGTk37vRy+mwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67421921"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67421921"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 09:44:39 -0800
X-CSE-ConnectionGUID: 9aPkSvmDSYqb3aYVjy8cUQ==
X-CSE-MsgGUID: X1vNO2LTTBGyVtI/P43YtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201326483"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 09:44:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTkiR-000000004vN-3DtO;
	Thu, 11 Dec 2025 17:44:35 +0000
Date: Fri, 12 Dec 2025 01:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/sched/deadline.c:2519 find_later_rq() warn: missing error
 code? 'best_cpu'
Message-ID: <202512120135.sFguNXZF-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: cac5cefbade90ff0bb0b393d301fa3b5234cf056 sched/smp: Make SMP unconditional
date:   6 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
config: m68k-randconfig-r072-20251211 (https://download.01.org/0day-ci/archive/20251212/202512120135.sFguNXZF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512120135.sFguNXZF-lkp@intel.com/

smatch warnings:
kernel/sched/deadline.c:2519 find_later_rq() warn: missing error code? 'best_cpu'
kernel/sched/fair.c:7379 sched_balance_find_dst_group_cpu() warn: missing error code? 'i'
kernel/sched/fair.c:7707 select_idle_capacity() warn: missing error code? 'cpu'

vim +/best_cpu +2519 kernel/sched/deadline.c

1baca4ce16b8cc Juri Lelli        2013-11-07  2451  
1baca4ce16b8cc Juri Lelli        2013-11-07  2452  static int find_later_rq(struct task_struct *task)
1baca4ce16b8cc Juri Lelli        2013-11-07  2453  {
1baca4ce16b8cc Juri Lelli        2013-11-07  2454  	struct sched_domain *sd;
4ba2968420fa9d Christoph Lameter 2014-08-26  2455  	struct cpumask *later_mask = this_cpu_cpumask_var_ptr(local_cpu_mask_dl);
1baca4ce16b8cc Juri Lelli        2013-11-07  2456  	int this_cpu = smp_processor_id();
b18c3ca11c20ca Byungchul Park    2017-05-23  2457  	int cpu = task_cpu(task);
1baca4ce16b8cc Juri Lelli        2013-11-07  2458  
1baca4ce16b8cc Juri Lelli        2013-11-07  2459  	/* Make sure the mask is initialized first */
1baca4ce16b8cc Juri Lelli        2013-11-07  2460  	if (unlikely(!later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2461  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2462  
4b53a3412d6663 Ingo Molnar       2017-02-05  2463  	if (task->nr_cpus_allowed == 1)
1baca4ce16b8cc Juri Lelli        2013-11-07  2464  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2465  
91ec6778ec4f96 Juri Lelli        2014-09-19  2466  	/*
91ec6778ec4f96 Juri Lelli        2014-09-19  2467  	 * We have to consider system topology and task affinity
97fb7a0a8944bd Ingo Molnar       2018-03-03  2468  	 * first, then we can look for a suitable CPU.
91ec6778ec4f96 Juri Lelli        2014-09-19  2469  	 */
3261ed0b25098f Byungchul Park    2017-05-23  2470  	if (!cpudl_find(&task_rq(task)->rd->cpudl, task, later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2471  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2472  
1baca4ce16b8cc Juri Lelli        2013-11-07  2473  	/*
b18c3ca11c20ca Byungchul Park    2017-05-23  2474  	 * If we are here, some targets have been found, including
b18c3ca11c20ca Byungchul Park    2017-05-23  2475  	 * the most suitable which is, among the runqueues where the
b18c3ca11c20ca Byungchul Park    2017-05-23  2476  	 * current tasks have later deadlines than the task's one, the
b18c3ca11c20ca Byungchul Park    2017-05-23  2477  	 * rq with the latest possible one.
1baca4ce16b8cc Juri Lelli        2013-11-07  2478  	 *
1baca4ce16b8cc Juri Lelli        2013-11-07  2479  	 * Now we check how well this matches with task's
1baca4ce16b8cc Juri Lelli        2013-11-07  2480  	 * affinity and system topology.
1baca4ce16b8cc Juri Lelli        2013-11-07  2481  	 *
97fb7a0a8944bd Ingo Molnar       2018-03-03  2482  	 * The last CPU where the task run is our first
1baca4ce16b8cc Juri Lelli        2013-11-07  2483  	 * guess, since it is most likely cache-hot there.
1baca4ce16b8cc Juri Lelli        2013-11-07  2484  	 */
1baca4ce16b8cc Juri Lelli        2013-11-07  2485  	if (cpumask_test_cpu(cpu, later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2486  		return cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2487  	/*
1baca4ce16b8cc Juri Lelli        2013-11-07  2488  	 * Check if this_cpu is to be skipped (i.e., it is
1baca4ce16b8cc Juri Lelli        2013-11-07  2489  	 * not in the mask) or not.
1baca4ce16b8cc Juri Lelli        2013-11-07  2490  	 */
1baca4ce16b8cc Juri Lelli        2013-11-07  2491  	if (!cpumask_test_cpu(this_cpu, later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2492  		this_cpu = -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2493  
1baca4ce16b8cc Juri Lelli        2013-11-07  2494  	rcu_read_lock();
1baca4ce16b8cc Juri Lelli        2013-11-07  2495  	for_each_domain(cpu, sd) {
1baca4ce16b8cc Juri Lelli        2013-11-07  2496  		if (sd->flags & SD_WAKE_AFFINE) {
b18c3ca11c20ca Byungchul Park    2017-05-23  2497  			int best_cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2498  
1baca4ce16b8cc Juri Lelli        2013-11-07  2499  			/*
1baca4ce16b8cc Juri Lelli        2013-11-07  2500  			 * If possible, preempting this_cpu is
1baca4ce16b8cc Juri Lelli        2013-11-07  2501  			 * cheaper than migrating.
1baca4ce16b8cc Juri Lelli        2013-11-07  2502  			 */
1baca4ce16b8cc Juri Lelli        2013-11-07  2503  			if (this_cpu != -1 &&
1baca4ce16b8cc Juri Lelli        2013-11-07  2504  			    cpumask_test_cpu(this_cpu, sched_domain_span(sd))) {
1baca4ce16b8cc Juri Lelli        2013-11-07  2505  				rcu_read_unlock();
1baca4ce16b8cc Juri Lelli        2013-11-07  2506  				return this_cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2507  			}
1baca4ce16b8cc Juri Lelli        2013-11-07  2508  
14e292f8d45380 Peter Zijlstra    2020-10-01  2509  			best_cpu = cpumask_any_and_distribute(later_mask,
b18c3ca11c20ca Byungchul Park    2017-05-23  2510  							      sched_domain_span(sd));
1baca4ce16b8cc Juri Lelli        2013-11-07  2511  			/*
97fb7a0a8944bd Ingo Molnar       2018-03-03  2512  			 * Last chance: if a CPU being in both later_mask
b18c3ca11c20ca Byungchul Park    2017-05-23  2513  			 * and current sd span is valid, that becomes our
97fb7a0a8944bd Ingo Molnar       2018-03-03  2514  			 * choice. Of course, the latest possible CPU is
b18c3ca11c20ca Byungchul Park    2017-05-23  2515  			 * already under consideration through later_mask.
1baca4ce16b8cc Juri Lelli        2013-11-07  2516  			 */
b18c3ca11c20ca Byungchul Park    2017-05-23  2517  			if (best_cpu < nr_cpu_ids) {
1baca4ce16b8cc Juri Lelli        2013-11-07  2518  				rcu_read_unlock();
1baca4ce16b8cc Juri Lelli        2013-11-07 @2519  				return best_cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2520  			}
1baca4ce16b8cc Juri Lelli        2013-11-07  2521  		}
1baca4ce16b8cc Juri Lelli        2013-11-07  2522  	}
1baca4ce16b8cc Juri Lelli        2013-11-07  2523  	rcu_read_unlock();
1baca4ce16b8cc Juri Lelli        2013-11-07  2524  
1baca4ce16b8cc Juri Lelli        2013-11-07  2525  	/*
1baca4ce16b8cc Juri Lelli        2013-11-07  2526  	 * At this point, all our guesses failed, we just return
1baca4ce16b8cc Juri Lelli        2013-11-07  2527  	 * 'something', and let the caller sort the things out.
1baca4ce16b8cc Juri Lelli        2013-11-07  2528  	 */
1baca4ce16b8cc Juri Lelli        2013-11-07  2529  	if (this_cpu != -1)
1baca4ce16b8cc Juri Lelli        2013-11-07  2530  		return this_cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2531  
14e292f8d45380 Peter Zijlstra    2020-10-01  2532  	cpu = cpumask_any_distribute(later_mask);
1baca4ce16b8cc Juri Lelli        2013-11-07  2533  	if (cpu < nr_cpu_ids)
1baca4ce16b8cc Juri Lelli        2013-11-07  2534  		return cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2535  
1baca4ce16b8cc Juri Lelli        2013-11-07  2536  	return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2537  }
1baca4ce16b8cc Juri Lelli        2013-11-07  2538  

:::::: The code at line 2519 was first introduced by commit
:::::: 1baca4ce16b8cc7d4f50be1f7914799af30a2861 sched/deadline: Add SCHED_DEADLINE SMP-related data structures & logic

:::::: TO: Juri Lelli <juri.lelli@gmail.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
