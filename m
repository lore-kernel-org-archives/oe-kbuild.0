Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799122CCC0
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748520010; cv=none; b=OrZ7gNkVeR8luxiOi4UMD0JLDd9vF9P3NHvTfCRlFEK3ZKLHfN4WKldJsi9lBqytbPQ1Wb9qjIEKe5e/rWcwqf1DOK6qe3tgNYqqNXeRKybLa2/32f5DtnNPHXsT0TRhX9bvFawVx8h5zOBqUMZbVG5euqoNF8PjgRND+JiMgLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748520010; c=relaxed/simple;
	bh=DrYLmRpWbC1dpLlt4omcS949kBNnQRMtzJ2LZIqEEGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jlHCyh80qideChQF6e0ugZLpb5668nR4FvpGU44tJaUzbsYGZ+bFnXiKDkro6Ub1QY3p4MPM7sw/cJTRs/xFhCWo1FTv9Z9JTB9o1MMjpkkKETh5RCtj47p29+Vg2Jnb5OmEYPs9VZ9kWZM0Jn76YYbFKsRB60yWEJciciUdht4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsDCctY7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsDCctY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748520008; x=1780056008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DrYLmRpWbC1dpLlt4omcS949kBNnQRMtzJ2LZIqEEGk=;
  b=lsDCctY7BCvthqhl30cbybno4p5so9UWQ6X3wnmuo4MeONjXWn8+wmE3
   7+NTKckkDERa9NBycF3X7rtqcOI7Qw26ONJNimB0t7PdPhO4cF8U2xJWq
   1AdHafe2TF9EovPA2IyJDOux/QzFtlYm3KXRFYaw+fF7v6f0R8mGbtwh2
   1cVBw2jU1I5nUuqQt7n/e46TEx/9NaVKCz/3EvRH68LnMwU/6NZgnc7Jc
   EvatRytQBiFNuJcleqdl1VaYBKtwYOZbLCoNVt2NJYIYRxQr5T6LwEaN7
   /4kq+7PMgzYJ8yKYr4uGPPRjFe8aq6g4FtvqQdHg+JAkF0/vQpC6bp0wT
   g==;
X-CSE-ConnectionGUID: K2E5T5NUSXqw77TeKQnmVA==
X-CSE-MsgGUID: XeOgdsiaTTWPZISXMzrJjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50726271"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="50726271"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 05:00:07 -0700
X-CSE-ConnectionGUID: /7Z4StScTLicMw4OCg012g==
X-CSE-MsgGUID: tHIGHL60S5mfLxP1dbcYOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="148829023"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2025 05:00:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKbvX-000Wes-2p;
	Thu, 29 May 2025 12:00:03 +0000
Date: Thu, 29 May 2025 19:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [mingo-tip:WIP.sched/core 28/43] kernel/sched/rt.c:1791
 find_lowest_rq() warn: missing error code? 'cpu'
Message-ID: <202505291951.IOun80wJ-lkp@intel.com>
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
CC: Ingo Molnar <mingo@kernel.org>
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/core
head:   cab92ff1aee4c2ad30895f33dab4610b24c9f8eb
commit: c66f6d8059b7c861b8cc0c916e0631cb5e0f726a [28/43] sched/smp: Use the SMP version of the RT scheduling class
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: i386-randconfig-141-20250529 (https://download.01.org/0day-ci/archive/20250529/202505291951.IOun80wJ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505291951.IOun80wJ-lkp@intel.com/

smatch warnings:
kernel/sched/rt.c:1791 find_lowest_rq() warn: missing error code? 'cpu'

vim +/cpu +1791 kernel/sched/rt.c

e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1748  
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1749  static int find_lowest_rq(struct task_struct *task)
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1750  {
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1751  	struct sched_domain *sd;
4ba2968420fa9d kernel/sched/rt.c Christoph Lameter 2014-08-26  1752  	struct cpumask *lowest_mask = this_cpu_cpumask_var_ptr(local_cpu_mask);
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1753  	int this_cpu = smp_processor_id();
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1754  	int cpu      = task_cpu(task);
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1755  	int ret;
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1756  
0da938c44921cf kernel/sched_rt.c Steven Rostedt    2011-06-14  1757  	/* Make sure the mask is initialized first */
0da938c44921cf kernel/sched_rt.c Steven Rostedt    2011-06-14  1758  	if (unlikely(!lowest_mask))
0da938c44921cf kernel/sched_rt.c Steven Rostedt    2011-06-14  1759  		return -1;
0da938c44921cf kernel/sched_rt.c Steven Rostedt    2011-06-14  1760  
4b53a3412d6663 kernel/sched/rt.c Ingo Molnar       2017-02-05  1761  	if (task->nr_cpus_allowed == 1)
6e0534f278199f kernel/sched_rt.c Gregory Haskins   2008-05-12  1762  		return -1; /* No other targets possible */
06f90dbd7610d5 kernel/sched_rt.c Gregory Haskins   2008-01-25  1763  
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1764  	/*
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1765  	 * If we're on asym system ensure we consider the different capacities
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1766  	 * of the CPUs when searching for the lowest_mask.
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1767  	 */
740cf8a760b73e kernel/sched/rt.c Dietmar Eggemann  2022-07-29  1768  	if (sched_asym_cpucap_active()) {
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1769  
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1770  		ret = cpupri_find_fitness(&task_rq(task)->rd->cpupri,
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1771  					  task, lowest_mask,
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1772  					  rt_task_fits_capacity);
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1773  	} else {
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1774  
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1775  		ret = cpupri_find(&task_rq(task)->rd->cpupri,
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1776  				  task, lowest_mask);
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1777  	}
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1778  
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1779  	if (!ret)
6e0534f278199f kernel/sched_rt.c Gregory Haskins   2008-05-12  1780  		return -1; /* No targets found */
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1781  
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1782  	/*
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar       2018-03-03  1783  	 * At this point we have built a mask of CPUs representing the
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1784  	 * lowest priority tasks in the system.  Now we want to elect
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1785  	 * the best one based on our affinity and topology.
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1786  	 *
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar       2018-03-03  1787  	 * We prioritize the last CPU that the task executed on since
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1788  	 * it is most likely cache-hot in that location.
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1789  	 */
96f874e26428ab kernel/sched_rt.c Rusty Russell     2008-11-25  1790  	if (cpumask_test_cpu(cpu, lowest_mask))
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25 @1791  		return cpu;
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1792  
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1793  	/*
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1794  	 * Otherwise, we consult the sched_domains span maps to figure
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar       2018-03-03  1795  	 * out which CPU is logically closest to our hot cache data.
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1796  	 */
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1797  	if (!cpumask_test_cpu(this_cpu, lowest_mask))
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1798  		this_cpu = -1; /* Skip this_cpu opt if not among lowest */
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1799  
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1800  	rcu_read_lock();
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1801  	for_each_domain(cpu, sd) {
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1802  		if (sd->flags & SD_WAKE_AFFINE) {
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1803  			int best_cpu;
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1804  
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1805  			/*
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1806  			 * "this_cpu" is cheaper to preempt than a
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1807  			 * remote processor.
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1808  			 */
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1809  			if (this_cpu != -1 &&
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1810  			    cpumask_test_cpu(this_cpu, sched_domain_span(sd))) {
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1811  				rcu_read_unlock();
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1812  				return this_cpu;
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1813  			}
d38b223c86db31 kernel/sched_rt.c Mike Travis       2009-01-10  1814  
14e292f8d45380 kernel/sched/rt.c Peter Zijlstra    2020-10-01  1815  			best_cpu = cpumask_any_and_distribute(lowest_mask,
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1816  							      sched_domain_span(sd));
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1817  			if (best_cpu < nr_cpu_ids) {
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1818  				rcu_read_unlock();
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1819  				return best_cpu;
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1820  			}
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1821  		}
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1822  	}
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1823  	rcu_read_unlock();
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1824  
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1825  	/*
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1826  	 * And finally, if there were no matches within the domains
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1827  	 * just give the caller *something* to work with from the compatible
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1828  	 * locations.
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1829  	 */
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1830  	if (this_cpu != -1)
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1831  		return this_cpu;
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1832  
14e292f8d45380 kernel/sched/rt.c Peter Zijlstra    2020-10-01  1833  	cpu = cpumask_any_distribute(lowest_mask);
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1834  	if (cpu < nr_cpu_ids)
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1835  		return cpu;
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar       2018-03-03  1836  
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1837  	return -1;
07b4032c9e505e kernel/sched_rt.c Gregory Haskins   2008-01-25  1838  }
07b4032c9e505e kernel/sched_rt.c Gregory Haskins   2008-01-25  1839  

:::::: The code at line 1791 was first introduced by commit
:::::: 6e1254d2c41215da27025add8900ed187bca121d sched: optimize RT affinity

:::::: TO: Gregory Haskins <ghaskins@novell.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
