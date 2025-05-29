Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8E0221552
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 01:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748483720; cv=none; b=nwISZuLJ2XjJaIOxRflwnX/Q/kWRlzLvnrqvl4DyBGTCtDiCcqLsGOtEQtOYNADk7uwji0DpigeG9lngakiSb2erjZCFeMkmyNjberhXfWfzt2ZahzJh4hhjYi1l7pyAUxveFKYCosML9Hnv9jN62N178gZ6EG/W3/2ScT2n88c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748483720; c=relaxed/simple;
	bh=adhwrqwl1ekxbwTZJ3s+b8B0pnEB41+bebIlM0DoGsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5IkT5A008XPODj+2DoFP4l2AGdgy+I/iFtvHzJTWofvHXQdPrPJwTG934HWe0O1xxtPBYj0FY4yEWwyDRwbXa3MzDWJEzuZ9TTpdPagTj3A7WHQTFMxjWkZuE5goPM4dJ/Jfd9fYu44Da7Mdvtw8MCIWfe5vtcmY1CdvvIDPsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZcxReV3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZcxReV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748483719; x=1780019719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=adhwrqwl1ekxbwTZJ3s+b8B0pnEB41+bebIlM0DoGsE=;
  b=MZcxReV3lYKoJMEZ7R/y19hReXLik81C4TnG5FRjcKR2xvXAPAPaEAoS
   VFRMdn1fFj/s70iLiZkxzeFh5E7Y5fI6v0aSQcVftGPSCFfmaxqwdR3A3
   uoIKEQuqXOHvF54ELSgXsupchzNC7XmJexxOK+CPPJesrBuymHY5E38tJ
   AAf/JKTtew8qb+EoJeJmqy2R5iEiu9PWXZdwCR5hlXaWbb1E4wH6cpIhy
   981thD/9ZSbSvpE8n/JmmAv01tuu/w7ntELKpeaIfFZLKSfX7e3lGXxqi
   t55S0YeBaui32PpyacumzpzIiRTPLFvDaELApqlSrYBPbyHZ4BnKzppJd
   g==;
X-CSE-ConnectionGUID: c1BUZlgSRyWsLYMSr6jzuw==
X-CSE-MsgGUID: JggSUoMJSZOhZcQg4nsWEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50228703"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="50228703"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 18:55:15 -0700
X-CSE-ConnectionGUID: mvOzIaQvQ6Sgb6FtmUge0g==
X-CSE-MsgGUID: qOVV4bxJR7qo54NuSJWguA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="144402805"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 18:55:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKSUB-000WDk-2w;
	Thu, 29 May 2025 01:55:11 +0000
Date: Thu, 29 May 2025 09:55:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [mingo-tip:WIP.sched/core 20/43] kernel/sched/fair.c:7369
 sched_balance_find_dst_group_cpu() warn: missing error code? 'i'
Message-ID: <202505290955.gXGMGwFg-lkp@intel.com>
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
commit: 943d3739b413d4131787c79640c3e30b6f88b4bd [20/43] sched/smp: Make SMP unconditional
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290955.gXGMGwFg-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505290955.gXGMGwFg-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:7369 sched_balance_find_dst_group_cpu() warn: missing error code? 'i'
kernel/sched/fair.c:7697 select_idle_capacity() warn: missing error code? 'cpu'
kernel/sched/deadline.c:2482 find_later_rq() warn: missing error code? 'cpu'
kernel/sched/deadline.c:2515 find_later_rq() warn: missing error code? 'best_cpu'

vim +/i +7369 kernel/sched/fair.c

e7693a362ec84b kernel/sched_fair.c Gregory Haskins           2008-01-25  7343  
ac192d3921a14e kernel/sched_fair.c Ingo Molnar               2008-03-16  7344  /*
646ebaf51c64c6 kernel/sched/fair.c Ingo Molnar               2024-03-08  7345   * sched_balance_find_dst_group_cpu - find the idlest CPU among the CPUs in the group.
ac192d3921a14e kernel/sched_fair.c Ingo Molnar               2008-03-16  7346   */
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7347  static int
646ebaf51c64c6 kernel/sched/fair.c Ingo Molnar               2024-03-08  7348  sched_balance_find_dst_group_cpu(struct sched_group *group, struct task_struct *p, int this_cpu)
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7349  {
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7350  	unsigned long load, min_load = ULONG_MAX;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7351  	unsigned int min_exit_latency = UINT_MAX;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7352  	u64 latest_idle_timestamp = 0;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7353  	int least_loaded_cpu = this_cpu;
17346452b25b98 kernel/sched/fair.c Viresh Kumar              2019-11-14  7354  	int shallowest_idle_cpu = -1;
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7355  	int i;
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7356  
eaecf41f5abf80 kernel/sched/fair.c Morten Rasmussen          2016-06-22  7357  	/* Check if we have any choice: */
eaecf41f5abf80 kernel/sched/fair.c Morten Rasmussen          2016-06-22  7358  	if (group->group_weight == 1)
ae4df9d6c93510 kernel/sched/fair.c Peter Zijlstra            2017-05-01  7359  		return cpumask_first(sched_group_span(group));
eaecf41f5abf80 kernel/sched/fair.c Morten Rasmussen          2016-06-22  7360  
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7361  	/* Traverse only the allowed CPUs */
3bd3706251ee8a kernel/sched/fair.c Sebastian Andrzej Siewior 2019-04-23  7362  	for_each_cpu_and(i, sched_group_span(group), p->cpus_ptr) {
97886d9dcd8682 kernel/sched/fair.c Aubrey Li                 2021-03-24  7363  		struct rq *rq = cpu_rq(i);
97886d9dcd8682 kernel/sched/fair.c Aubrey Li                 2021-03-24  7364  
97886d9dcd8682 kernel/sched/fair.c Aubrey Li                 2021-03-24  7365  		if (!sched_core_cookie_match(rq, p))
97886d9dcd8682 kernel/sched/fair.c Aubrey Li                 2021-03-24  7366  			continue;
97886d9dcd8682 kernel/sched/fair.c Aubrey Li                 2021-03-24  7367  
17346452b25b98 kernel/sched/fair.c Viresh Kumar              2019-11-14  7368  		if (sched_idle_cpu(i))
17346452b25b98 kernel/sched/fair.c Viresh Kumar              2019-11-14 @7369  			return i;
17346452b25b98 kernel/sched/fair.c Viresh Kumar              2019-11-14  7370  
943d355d7feef3 kernel/sched/fair.c Rohit Jain                2018-05-09  7371  		if (available_idle_cpu(i)) {
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7372  			struct cpuidle_state *idle = idle_get_state(rq);
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7373  			if (idle && idle->exit_latency < min_exit_latency) {
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7374  				/*
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7375  				 * We give priority to a CPU whose idle state
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7376  				 * has the smallest exit latency irrespective
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7377  				 * of any idle timestamp.
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7378  				 */
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7379  				min_exit_latency = idle->exit_latency;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7380  				latest_idle_timestamp = rq->idle_stamp;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7381  				shallowest_idle_cpu = i;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7382  			} else if ((!idle || idle->exit_latency == min_exit_latency) &&
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7383  				   rq->idle_stamp > latest_idle_timestamp) {
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7384  				/*
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7385  				 * If equal or no active idle state, then
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7386  				 * the most recently idled CPU might have
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7387  				 * a warmer cache.
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7388  				 */
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7389  				latest_idle_timestamp = rq->idle_stamp;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7390  				shallowest_idle_cpu = i;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7391  			}
17346452b25b98 kernel/sched/fair.c Viresh Kumar              2019-11-14  7392  		} else if (shallowest_idle_cpu == -1) {
11f10e5420f6ce kernel/sched/fair.c Vincent Guittot           2019-10-18  7393  			load = cpu_load(cpu_rq(i));
18cec7e0ddd5e2 kernel/sched/fair.c Joel Fernandes            2017-12-15  7394  			if (load < min_load) {
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7395  				min_load = load;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7396  				least_loaded_cpu = i;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7397  			}
e7693a362ec84b kernel/sched_fair.c Gregory Haskins           2008-01-25  7398  		}
e7693a362ec84b kernel/sched_fair.c Gregory Haskins           2008-01-25  7399  	}
e7693a362ec84b kernel/sched_fair.c Gregory Haskins           2008-01-25  7400  
17346452b25b98 kernel/sched/fair.c Viresh Kumar              2019-11-14  7401  	return shallowest_idle_cpu != -1 ? shallowest_idle_cpu : least_loaded_cpu;
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7402  }
e7693a362ec84b kernel/sched_fair.c Gregory Haskins           2008-01-25  7403  

:::::: The code at line 7369 was first introduced by commit
:::::: 17346452b25b98acfb395d2a82ec2e4ad0cb7a01 sched/fair: Make sched-idle CPU selection consistent throughout

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
