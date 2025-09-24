Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6563B9
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Sep 2025 05:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758691144; cv=none; b=M7Iq5FjKu4UChx2a/jBzWhv4ewmOa4F0C7yf8acLiShmYC0i2o0otUS6e2kM/TnwLsjlXg7qA1tFmkcC3fPPqkabkWHpS7qxIswOO1gg8j2AIf9q1bo6hts6LBCwp0czCnWgEeFD5p5hzroGEeDEGnHWIgFGSA/P7pP5FeThgiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758691144; c=relaxed/simple;
	bh=dZpCITk0pD8xhjL+wg8SaswR4HYUF6FqnKakIDuqOQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ntm/LxIuDCRC01QedsqWp7OoXynTYfdkeFCcYQ0kiuHVsUJvMcez8zApDYPmql0keVVJb/DIxZx/lqNitg0k/HGXbt/99pS1TPWOOiNJH54VFY4KByov5AF0av3lae+Bc4qPg0TZH+u5iJMSvK9gAl+lzm2iHtIzgXKM8VzWEiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpFWduO6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpFWduO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758691142; x=1790227142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZpCITk0pD8xhjL+wg8SaswR4HYUF6FqnKakIDuqOQI=;
  b=BpFWduO62Wp6jBsIE812rAOJ/H5PABPxARyuSGfmb3PTamXkMm+TCYy+
   DI0iBj5SWXRg2LGxjsfN/n79N4YfiutaO8858XK4PCyy8DifouS/L9LK9
   uT/cydP+66rY9guuil0SBdy6NngsNV0eB5xjNBaEWFVnEt9FxjjvoGfag
   bPqTzePpXqIvSeNmnoCeuPLiUYw2/8pcXJtKOLBBFSHYv8CWzZQyqs0cO
   S1+Zc5FwR3HebB8C8EqgucjOa+CnDTUtB768fCMyDK5YDV7GLZci2bMJx
   +s/8SQSqLcyBBoThxim9I1xIpGPXz6OEzctY3KEiswknsKTAFBcXrae4x
   w==;
X-CSE-ConnectionGUID: hi1klpm6QA21lzUSsD3Gjw==
X-CSE-MsgGUID: tPOWSYgQRYq33il7TyZnpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60685541"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="60685541"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 22:19:01 -0700
X-CSE-ConnectionGUID: ZIIjxNdcSnGJdlb/ug7BKQ==
X-CSE-MsgGUID: RbMSrRNgSIqlAr/rF2tZ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="177020250"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Sep 2025 22:19:00 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Hu5-0003oj-19;
	Wed, 24 Sep 2025 05:18:57 +0000
Date: Wed, 24 Sep 2025 13:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/4] sched/fair: Still look for the idlest cpu with no
 matching cookie
Message-ID: <202509241239.5vFGUEzm-lkp@intel.com>
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
In-Reply-To: <beefbc1474a94868c22b0351dedc0d7398b79c33.1758543008.git.sieberf@amazon.com>
References: <beefbc1474a94868c22b0351dedc0d7398b79c33.1758543008.git.sieberf@amazon.com>
TO: Fernand Sieber <sieberf@amazon.com>
TO: mingo@redhat.com
TO: peterz@infradead.org
CC: linux-kernel@vger.kernel.org
CC: juri.lelli@redhat.com
CC: vincent.guittot@linaro.org
CC: dietmar.eggemann@arm.com
CC: rostedt@goodmis.org
CC: bsegall@google.com
CC: mgorman@suse.de
CC: bristot@redhat.com
CC: vschneid@redhat.com
CC: dwmw@amazon.co.uk
CC: jschoenh@amazon.de
CC: liuyuxua@amazon.com

Hi Fernand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on peterz-queue/sched/core linus/master v6.17-rc7 next-20250923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fernand-Sieber/sched-fair-Fix-cookie-check-on-__select_idle_cpu/20250922-204814
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/beefbc1474a94868c22b0351dedc0d7398b79c33.1758543008.git.sieberf%40amazon.com
patch subject: [PATCH 2/4] sched/fair: Still look for the idlest cpu with no matching cookie
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250923 (https://download.01.org/0day-ci/archive/20250924/202509241239.5vFGUEzm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509241239.5vFGUEzm-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:7446 __sched_balance_find_dst_group_cpu() warn: missing error code? 'i'

vim +/i +7446 kernel/sched/fair.c

e7693a362ec84b kernel/sched_fair.c Gregory Haskins           2008-01-25  7418  
ac192d3921a14e kernel/sched_fair.c Ingo Molnar               2008-03-16  7419  /*
646ebaf51c64c6 kernel/sched/fair.c Ingo Molnar               2024-03-08  7420   * sched_balance_find_dst_group_cpu - find the idlest CPU among the CPUs in the group.
ac192d3921a14e kernel/sched_fair.c Ingo Molnar               2008-03-16  7421   */
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7422  static int
4ac1e1a66223eb kernel/sched/fair.c Fernand Sieber            2025-09-22  7423  __sched_balance_find_dst_group_cpu(struct sched_group *group, struct task_struct *p,
4ac1e1a66223eb kernel/sched/fair.c Fernand Sieber            2025-09-22  7424  				   int this_cpu, bool cookie_match)
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7425  {
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7426  	unsigned long load, min_load = ULONG_MAX;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7427  	unsigned int min_exit_latency = UINT_MAX;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7428  	u64 latest_idle_timestamp = 0;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7429  	int least_loaded_cpu = this_cpu;
17346452b25b98 kernel/sched/fair.c Viresh Kumar              2019-11-14  7430  	int shallowest_idle_cpu = -1;
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7431  	int i;
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7432  
eaecf41f5abf80 kernel/sched/fair.c Morten Rasmussen          2016-06-22  7433  	/* Check if we have any choice: */
eaecf41f5abf80 kernel/sched/fair.c Morten Rasmussen          2016-06-22  7434  	if (group->group_weight == 1)
ae4df9d6c93510 kernel/sched/fair.c Peter Zijlstra            2017-05-01  7435  		return cpumask_first(sched_group_span(group));
eaecf41f5abf80 kernel/sched/fair.c Morten Rasmussen          2016-06-22  7436  
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7437  	/* Traverse only the allowed CPUs */
3bd3706251ee8a kernel/sched/fair.c Sebastian Andrzej Siewior 2019-04-23  7438  	for_each_cpu_and(i, sched_group_span(group), p->cpus_ptr) {
97886d9dcd8682 kernel/sched/fair.c Aubrey Li                 2021-03-24  7439  		struct rq *rq = cpu_rq(i);
97886d9dcd8682 kernel/sched/fair.c Aubrey Li                 2021-03-24  7440  
4ac1e1a66223eb kernel/sched/fair.c Fernand Sieber            2025-09-22  7441  		/* Only matching tasks if cookie_match, else only unmatching tasks */
4ac1e1a66223eb kernel/sched/fair.c Fernand Sieber            2025-09-22  7442  		if (cookie_match ^ sched_core_cookie_match(rq, p))
97886d9dcd8682 kernel/sched/fair.c Aubrey Li                 2021-03-24  7443  			continue;
97886d9dcd8682 kernel/sched/fair.c Aubrey Li                 2021-03-24  7444  
17346452b25b98 kernel/sched/fair.c Viresh Kumar              2019-11-14  7445  		if (sched_idle_cpu(i))
17346452b25b98 kernel/sched/fair.c Viresh Kumar              2019-11-14 @7446  			return i;
17346452b25b98 kernel/sched/fair.c Viresh Kumar              2019-11-14  7447  
943d355d7feef3 kernel/sched/fair.c Rohit Jain                2018-05-09  7448  		if (available_idle_cpu(i)) {
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7449  			struct cpuidle_state *idle = idle_get_state(rq);
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7450  			if (idle && idle->exit_latency < min_exit_latency) {
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7451  				/*
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7452  				 * We give priority to a CPU whose idle state
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7453  				 * has the smallest exit latency irrespective
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7454  				 * of any idle timestamp.
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7455  				 */
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7456  				min_exit_latency = idle->exit_latency;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7457  				latest_idle_timestamp = rq->idle_stamp;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7458  				shallowest_idle_cpu = i;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7459  			} else if ((!idle || idle->exit_latency == min_exit_latency) &&
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7460  				   rq->idle_stamp > latest_idle_timestamp) {
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7461  				/*
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7462  				 * If equal or no active idle state, then
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7463  				 * the most recently idled CPU might have
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7464  				 * a warmer cache.
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7465  				 */
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7466  				latest_idle_timestamp = rq->idle_stamp;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7467  				shallowest_idle_cpu = i;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7468  			}
17346452b25b98 kernel/sched/fair.c Viresh Kumar              2019-11-14  7469  		} else if (shallowest_idle_cpu == -1) {
11f10e5420f6ce kernel/sched/fair.c Vincent Guittot           2019-10-18  7470  			load = cpu_load(cpu_rq(i));
18cec7e0ddd5e2 kernel/sched/fair.c Joel Fernandes            2017-12-15  7471  			if (load < min_load) {
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7472  				min_load = load;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7473  				least_loaded_cpu = i;
83a0a96a5f26d9 kernel/sched/fair.c Nicolas Pitre             2014-09-04  7474  			}
e7693a362ec84b kernel/sched_fair.c Gregory Haskins           2008-01-25  7475  		}
e7693a362ec84b kernel/sched_fair.c Gregory Haskins           2008-01-25  7476  	}
e7693a362ec84b kernel/sched_fair.c Gregory Haskins           2008-01-25  7477  
17346452b25b98 kernel/sched/fair.c Viresh Kumar              2019-11-14  7478  	return shallowest_idle_cpu != -1 ? shallowest_idle_cpu : least_loaded_cpu;
aaee1203ca52b9 kernel/sched_fair.c Peter Zijlstra            2009-09-10  7479  }
e7693a362ec84b kernel/sched_fair.c Gregory Haskins           2008-01-25  7480  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
