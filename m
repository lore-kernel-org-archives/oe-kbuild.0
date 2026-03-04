Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D61222585
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639886; cv=none; b=GrY/UEUGfDvRw0G9D8DIYRqhzRyVnHutuxCVOzFD6nSTRoq27gLkW0LTYmc8HN2l7QWEVd5k/enst+OnBhZZCRY3hlTrM5BHdHeYeY0XzUuNF9i0APnRh6/6DA74Usz7+9WKpoyNDAd8StG9L3bvafkdhNU8F7Rz9dWGqmyFXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639886; c=relaxed/simple;
	bh=rD6rUncKiabsKLGzOzKqixuVyBrVsAeFTQzXK+qkrdM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qjcJ4ZmBULjNZyc6crmB8dBJXcXYNqwHRWo1XHgudMw5/9VUmX3mqmrRqCbmSJNO1V3yDI67nlB2t5Ts6BqLjBFIb1oWMrOhlwucCIwpbUZ47BsRXxU1jZydZWNYAUrETcnhbGAbNyhQvzfDa+nKmfLjQqoWV7TyJlP7o829N1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWkKbXFa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWkKbXFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772639883; x=1804175883;
  h=date:from:to:cc:subject:message-id;
  bh=rD6rUncKiabsKLGzOzKqixuVyBrVsAeFTQzXK+qkrdM=;
  b=EWkKbXFao+yD+evBo8ltRcmcizqYm0Bk9nHOHViLC5hHh+wBwaLdyehM
   xrbfegWtPJ6EoRgj+kAEW/GFsHAiRO7EmgPQaF1+geZQwB8yjA4KPVEZa
   USuGHZax4MQWL+WY5xgF/Oyj+rYwH9Ses+7KenfOnvVLjlIVK03IReXuT
   Gb7+1Kmi9EDmZnWCFIzCxckUnpjm3dZw4NSuM7ijhMaY9PiF0RabcDB8R
   YsisT/mIIVTcRAFTFwc2c0wF3po0ahk3pFefn8CWyueFK07KBLNRhYBaz
   4xkmC9aFzZUYOVjNEz//92OEjtpWdI/8hBZwiM9/Cayv9vVFwGJaJsonJ
   g==;
X-CSE-ConnectionGUID: nknSetH4RFm1b3tfQYDdOQ==
X-CSE-MsgGUID: AXVUPwCERZ2L38m+m/sWxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85175020"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="85175020"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 07:58:03 -0800
X-CSE-ConnectionGUID: SqfqIb+jRj+lrrdu8YxM6Q==
X-CSE-MsgGUID: HBaSBxQFRQaPJ5//zcWmCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217611447"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2026 07:58:01 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxobn-0000000040N-0bhP;
	Wed, 04 Mar 2026 15:57:59 +0000
Date: Wed, 04 Mar 2026 23:57:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/sched/rt.c:1794 find_lowest_rq() warn: missing error
 code? 'cpu'
Message-ID: <202603042343.TsFLtcm6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0031c06807cfa8aa51a759ff8aa09e1aa48149af
commit: 15125a229abc2404a264ce493e64a9ffa7850f6e sched/smp: Use the SMP version of the RT scheduling class
date:   9 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 9 months ago
config: m68k-randconfig-r073-20260304 (https://download.01.org/0day-ci/archive/20260304/202603042343.TsFLtcm6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603042343.TsFLtcm6-lkp@intel.com/

smatch warnings:
kernel/sched/rt.c:1794 find_lowest_rq() warn: missing error code? 'cpu'

vim +/cpu +1794 kernel/sched/rt.c

e8fa136262e1121 kernel/sched_rt.c Steven Rostedt    2008-01-25  1751  
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1752  static int find_lowest_rq(struct task_struct *task)
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1753  {
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1754  	struct sched_domain *sd;
4ba2968420fa9d0 kernel/sched/rt.c Christoph Lameter 2014-08-26  1755  	struct cpumask *lowest_mask = this_cpu_cpumask_var_ptr(local_cpu_mask);
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1756  	int this_cpu = smp_processor_id();
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1757  	int cpu      = task_cpu(task);
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1758  	int ret;
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1759  
0da938c44921cfb kernel/sched_rt.c Steven Rostedt    2011-06-14  1760  	/* Make sure the mask is initialized first */
0da938c44921cfb kernel/sched_rt.c Steven Rostedt    2011-06-14  1761  	if (unlikely(!lowest_mask))
0da938c44921cfb kernel/sched_rt.c Steven Rostedt    2011-06-14  1762  		return -1;
0da938c44921cfb kernel/sched_rt.c Steven Rostedt    2011-06-14  1763  
4b53a3412d66632 kernel/sched/rt.c Ingo Molnar       2017-02-05  1764  	if (task->nr_cpus_allowed == 1)
6e0534f278199f1 kernel/sched_rt.c Gregory Haskins   2008-05-12  1765  		return -1; /* No other targets possible */
06f90dbd7610d51 kernel/sched_rt.c Gregory Haskins   2008-01-25  1766  
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1767  	/*
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1768  	 * If we're on asym system ensure we consider the different capacities
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1769  	 * of the CPUs when searching for the lowest_mask.
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1770  	 */
740cf8a760b73e8 kernel/sched/rt.c Dietmar Eggemann  2022-07-29  1771  	if (sched_asym_cpucap_active()) {
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1772  
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1773  		ret = cpupri_find_fitness(&task_rq(task)->rd->cpupri,
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1774  					  task, lowest_mask,
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1775  					  rt_task_fits_capacity);
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1776  	} else {
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1777  
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1778  		ret = cpupri_find(&task_rq(task)->rd->cpupri,
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1779  				  task, lowest_mask);
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1780  	}
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1781  
a1bd02e1f28b193 kernel/sched/rt.c Qais Yousef       2020-03-02  1782  	if (!ret)
6e0534f278199f1 kernel/sched_rt.c Gregory Haskins   2008-05-12  1783  		return -1; /* No targets found */
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1784  
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1785  	/*
97fb7a0a8944bd6 kernel/sched/rt.c Ingo Molnar       2018-03-03  1786  	 * At this point we have built a mask of CPUs representing the
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1787  	 * lowest priority tasks in the system.  Now we want to elect
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1788  	 * the best one based on our affinity and topology.
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1789  	 *
97fb7a0a8944bd6 kernel/sched/rt.c Ingo Molnar       2018-03-03  1790  	 * We prioritize the last CPU that the task executed on since
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1791  	 * it is most likely cache-hot in that location.
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1792  	 */
96f874e26428ab5 kernel/sched_rt.c Rusty Russell     2008-11-25  1793  	if (cpumask_test_cpu(cpu, lowest_mask))
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25 @1794  		return cpu;
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1795  
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1796  	/*
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1797  	 * Otherwise, we consult the sched_domains span maps to figure
97fb7a0a8944bd6 kernel/sched/rt.c Ingo Molnar       2018-03-03  1798  	 * out which CPU is logically closest to our hot cache data.
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1799  	 */
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1800  	if (!cpumask_test_cpu(this_cpu, lowest_mask))
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1801  		this_cpu = -1; /* Skip this_cpu opt if not among lowest */
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1802  
cd4ae6adf8b1c21 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1803  	rcu_read_lock();
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1804  	for_each_domain(cpu, sd) {
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1805  		if (sd->flags & SD_WAKE_AFFINE) {
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1806  			int best_cpu;
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1807  
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1808  			/*
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1809  			 * "this_cpu" is cheaper to preempt than a
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1810  			 * remote processor.
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1811  			 */
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1812  			if (this_cpu != -1 &&
cd4ae6adf8b1c21 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1813  			    cpumask_test_cpu(this_cpu, sched_domain_span(sd))) {
cd4ae6adf8b1c21 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1814  				rcu_read_unlock();
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1815  				return this_cpu;
cd4ae6adf8b1c21 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1816  			}
d38b223c86db316 kernel/sched_rt.c Mike Travis       2009-01-10  1817  
14e292f8d45380c kernel/sched/rt.c Peter Zijlstra    2020-10-01  1818  			best_cpu = cpumask_any_and_distribute(lowest_mask,
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1819  							      sched_domain_span(sd));
cd4ae6adf8b1c21 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1820  			if (best_cpu < nr_cpu_ids) {
cd4ae6adf8b1c21 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1821  				rcu_read_unlock();
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1822  				return best_cpu;
e8fa136262e1121 kernel/sched_rt.c Steven Rostedt    2008-01-25  1823  			}
e8fa136262e1121 kernel/sched_rt.c Steven Rostedt    2008-01-25  1824  		}
cd4ae6adf8b1c21 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1825  	}
cd4ae6adf8b1c21 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1826  	rcu_read_unlock();
e8fa136262e1121 kernel/sched_rt.c Steven Rostedt    2008-01-25  1827  
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1828  	/*
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1829  	 * And finally, if there were no matches within the domains
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1830  	 * just give the caller *something* to work with from the compatible
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1831  	 * locations.
6e1254d2c41215d kernel/sched_rt.c Gregory Haskins   2008-01-25  1832  	 */
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1833  	if (this_cpu != -1)
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1834  		return this_cpu;
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1835  
14e292f8d45380c kernel/sched/rt.c Peter Zijlstra    2020-10-01  1836  	cpu = cpumask_any_distribute(lowest_mask);
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1837  	if (cpu < nr_cpu_ids)
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1838  		return cpu;
97fb7a0a8944bd6 kernel/sched/rt.c Ingo Molnar       2018-03-03  1839  
e2c880630438f80 kernel/sched_rt.c Rusty Russell     2009-11-03  1840  	return -1;
07b4032c9e505e2 kernel/sched_rt.c Gregory Haskins   2008-01-25  1841  }
07b4032c9e505e2 kernel/sched_rt.c Gregory Haskins   2008-01-25  1842  

:::::: The code at line 1794 was first introduced by commit
:::::: 6e1254d2c41215da27025add8900ed187bca121d sched: optimize RT affinity

:::::: TO: Gregory Haskins <ghaskins@novell.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
