Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A3B1DFEB
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jan 2024 20:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izXQNA5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704400641; x=1735936641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wWuHVl/Rw2ffgxEQgmQLwjcMfsNwRllic1HfUR10RIs=;
  b=izXQNA5LdH5X3ToDsT9YFYlEXGv1dd1eQRTFf3k33f0skvngMsHpxN9X
   mXSMHSuLHIP0ZZVTtMT5TdAZQ8TLI+1hOMQmLm1CdtTpBhnE782oajmA7
   lGc4sFc7GRXRHpwME2lOjMEv1+n2LN7wMTMQeArms9+6rMKC7k8GHBLFS
   K7Hr13PEWcSK8+PdwQQSg7LxVA+KNUW40O49Z7KrbNsIRYt5a6H3nTw7f
   AQlvj/TzAfhWLccBpqV86G/6ewmEIA1CEfgqs0iiAi5bO+Ms4ghmrKoCz
   8HybnM8ghbJVGdW3n912TjZc+QIQM4NwC/crL2wVb7q2Uxf4dit6+GG2s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4465732"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="4465732"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 12:37:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="22618052"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jan 2024 12:37:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLUSo-0000Ou-2z;
	Thu, 04 Jan 2024 20:37:14 +0000
Date: Fri, 5 Jan 2024 04:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [norov:group_cpus 8/9] lib/group_cpus.c:352 group_cpus_evenly()
 error: uninitialized symbol 'npresmsk'.
Message-ID: <202401050452.IcgrcQON-lkp@intel.com>
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
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/norov/linux group_cpus
head:   1117349d164c1dec91f4ace657c7964c587cee24
commit: 4c2e6aa6ff56057cd68a80f19e9d06ef4ce51d46 [8/9] lib/group_cpus: rework group_cpus_evenly()
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20240104 (https://download.01.org/0day-ci/archive/20240105/202401050452.IcgrcQON-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401050452.IcgrcQON-lkp@intel.com/

New smatch warnings:
lib/group_cpus.c:352 group_cpus_evenly() error: uninitialized symbol 'npresmsk'.

Old smatch warnings:
lib/group_cpus.c:353 group_cpus_evenly() error: uninitialized symbol 'nmsk'.
lib/group_cpus.c:378 group_cpus_evenly() warn: unsigned 'nr_present' is never less than zero.
lib/group_cpus.c:395 group_cpus_evenly() warn: unsigned 'nr_others' is never less than zero.

vim +/npresmsk +352 lib/group_cpus.c

f7b3ea8cf72f3d Ming Lei   2022-12-27  332  
f7b3ea8cf72f3d Ming Lei   2022-12-27  333  /**
f7b3ea8cf72f3d Ming Lei   2022-12-27  334   * group_cpus_evenly - Group all CPUs evenly per NUMA/CPU locality
f7b3ea8cf72f3d Ming Lei   2022-12-27  335   * @numgrps: number of groups
f7b3ea8cf72f3d Ming Lei   2022-12-27  336   *
f7b3ea8cf72f3d Ming Lei   2022-12-27  337   * Return: cpumask array if successful, NULL otherwise. And each element
f7b3ea8cf72f3d Ming Lei   2022-12-27  338   * includes CPUs assigned to this group
f7b3ea8cf72f3d Ming Lei   2022-12-27  339   *
f7b3ea8cf72f3d Ming Lei   2022-12-27  340   * Try to put close CPUs from viewpoint of CPU and NUMA locality into
f7b3ea8cf72f3d Ming Lei   2022-12-27  341   * same group, and run two-stage grouping:
f7b3ea8cf72f3d Ming Lei   2022-12-27  342   *	1) allocate present CPUs on these groups evenly first
f7b3ea8cf72f3d Ming Lei   2022-12-27  343   *	2) allocate other possible CPUs on these groups evenly
f7b3ea8cf72f3d Ming Lei   2022-12-27  344   *
f7b3ea8cf72f3d Ming Lei   2022-12-27  345   * We guarantee in the resulted grouping that all CPUs are covered, and
f7b3ea8cf72f3d Ming Lei   2022-12-27  346   * no same CPU is assigned to multiple groups
f7b3ea8cf72f3d Ming Lei   2022-12-27  347   */
f7b3ea8cf72f3d Ming Lei   2022-12-27  348  struct cpumask *group_cpus_evenly(unsigned int numgrps)
f7b3ea8cf72f3d Ming Lei   2022-12-27  349  {
4c2e6aa6ff5605 Yury Norov 2023-12-25  350  	cpumask_var_t *node_to_cpumask __free(free_node_to_cpumask) = alloc_node_to_cpumask();
4c2e6aa6ff5605 Yury Norov 2023-12-25  351  	struct cpumask *masks __free(kfree) = kcalloc(numgrps, sizeof(*masks), GFP_KERNEL);
4c2e6aa6ff5605 Yury Norov 2023-12-25 @352  	cpumask_var_t npresmsk __free(free_cpumask_var);
4c2e6aa6ff5605 Yury Norov 2023-12-25  353  	cpumask_var_t nmsk __free(free_cpumask_var);
4c2e6aa6ff5605 Yury Norov 2023-12-25  354  	unsigned int curgrp, nr_present, nr_others;
4c2e6aa6ff5605 Yury Norov 2023-12-25  355  
4c2e6aa6ff5605 Yury Norov 2023-12-25  356  	if (!masks || !node_to_cpumask || !alloc_cpumask_var(&nmsk, GFP_KERNEL)
4c2e6aa6ff5605 Yury Norov 2023-12-25  357  			|| !alloc_cpumask_var(&npresmsk, GFP_KERNEL))
f7b3ea8cf72f3d Ming Lei   2022-12-27  358  		return NULL;
f7b3ea8cf72f3d Ming Lei   2022-12-27  359  
f7b3ea8cf72f3d Ming Lei   2022-12-27  360  	build_node_to_cpumask(node_to_cpumask);
f7b3ea8cf72f3d Ming Lei   2022-12-27  361  
0263f92fadbb9d Ming Lei   2023-11-20  362  	/*
0263f92fadbb9d Ming Lei   2023-11-20  363  	 * Make a local cache of 'cpu_present_mask', so the two stages
0263f92fadbb9d Ming Lei   2023-11-20  364  	 * spread can observe consistent 'cpu_present_mask' without holding
0263f92fadbb9d Ming Lei   2023-11-20  365  	 * cpu hotplug lock, then we can reduce deadlock risk with cpu
0263f92fadbb9d Ming Lei   2023-11-20  366  	 * hotplug code.
0263f92fadbb9d Ming Lei   2023-11-20  367  	 *
0263f92fadbb9d Ming Lei   2023-11-20  368  	 * Here CPU hotplug may happen when reading `cpu_present_mask`, and
0263f92fadbb9d Ming Lei   2023-11-20  369  	 * we can live with the case because it only affects that hotplug
0263f92fadbb9d Ming Lei   2023-11-20  370  	 * CPU is handled in the 1st or 2nd stage, and either way is correct
0263f92fadbb9d Ming Lei   2023-11-20  371  	 * from API user viewpoint since 2-stage spread is sort of
0263f92fadbb9d Ming Lei   2023-11-20  372  	 * optimization.
0263f92fadbb9d Ming Lei   2023-11-20  373  	 */
0263f92fadbb9d Ming Lei   2023-11-20  374  	cpumask_copy(npresmsk, data_race(cpu_present_mask));
0263f92fadbb9d Ming Lei   2023-11-20  375  
f7b3ea8cf72f3d Ming Lei   2022-12-27  376  	/* grouping present CPUs first */
4c2e6aa6ff5605 Yury Norov 2023-12-25  377  	nr_present = __group_cpus_evenly(0, numgrps, node_to_cpumask, npresmsk, nmsk, masks);
4c2e6aa6ff5605 Yury Norov 2023-12-25  378  	if (nr_present < 0)
4c2e6aa6ff5605 Yury Norov 2023-12-25  379  		return NULL;
4c2e6aa6ff5605 Yury Norov 2023-12-25  380  
4c2e6aa6ff5605 Yury Norov 2023-12-25  381  	/* If npresmsk is empty */
4c2e6aa6ff5605 Yury Norov 2023-12-25  382  	if (!cpumask_andnot(npresmsk, cpu_possible_mask, npresmsk))
4c2e6aa6ff5605 Yury Norov 2023-12-25  383  		return_ptr(masks);
4c2e6aa6ff5605 Yury Norov 2023-12-25  384  
4c2e6aa6ff5605 Yury Norov 2023-12-25  385  	curgrp = nr_present < numgrps ? nr_present : 0;
f7b3ea8cf72f3d Ming Lei   2022-12-27  386  
f7b3ea8cf72f3d Ming Lei   2022-12-27  387  	/*
f7b3ea8cf72f3d Ming Lei   2022-12-27  388  	 * Allocate non present CPUs starting from the next group to be
f7b3ea8cf72f3d Ming Lei   2022-12-27  389  	 * handled. If the grouping of present CPUs already exhausted the
f7b3ea8cf72f3d Ming Lei   2022-12-27  390  	 * group space, assign the non present CPUs to the already
f7b3ea8cf72f3d Ming Lei   2022-12-27  391  	 * allocated out groups.
f7b3ea8cf72f3d Ming Lei   2022-12-27  392  	 */
4c2e6aa6ff5605 Yury Norov 2023-12-25  393  	nr_others = __group_cpus_evenly(curgrp, numgrps, node_to_cpumask,
f7b3ea8cf72f3d Ming Lei   2022-12-27  394  					npresmsk, nmsk, masks);
4c2e6aa6ff5605 Yury Norov 2023-12-25  395  	if (nr_others < 0)
4c2e6aa6ff5605 Yury Norov 2023-12-25  396  		return NULL;
f7b3ea8cf72f3d Ming Lei   2022-12-27  397  
f7b3ea8cf72f3d Ming Lei   2022-12-27  398  	WARN_ON(nr_present + nr_others < numgrps);
4c2e6aa6ff5605 Yury Norov 2023-12-25  399  	return_ptr(masks);
f7b3ea8cf72f3d Ming Lei   2022-12-27  400  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
