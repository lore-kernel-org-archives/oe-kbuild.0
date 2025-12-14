Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C311E3DED
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 19:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765740344; cv=none; b=Oz3PEfnMGCRh2zYTSP4Xw6oe+b31/wQ4Fq/38CIyolT2cBPTlT0zPsxHrhbj93Lk1Yw/AHiXiscaMxvaZpqcy0M94Klbl4TTBwc/aeBsJN03K0vw67rZVOe4zuI6wWNnxz7cLW/2vE0VjeA4QLdgiVbbcmlwbWQ/wWGRjzKZcOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765740344; c=relaxed/simple;
	bh=3lz8fSNZ2bLh/wARDCJs3MaiIs4xy/q6OnE47kL3lTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E8s2fJmkrHjf0L2aJO43erTvhNuLFHLA28QbHdgMMYrdBdaVdsBsc9PEiHJVJhz5b3kpCta2kSfhp2DFpMrsUNDF9QvxJ47nWCJ4RRDftesLRlWxbYMfvcCMTZP3tDA/ajxYL0n8GPsoRSM2jhDu+B/QNQD80KSAbVjX0JDy0PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyU/uxrX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyU/uxrX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765740342; x=1797276342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3lz8fSNZ2bLh/wARDCJs3MaiIs4xy/q6OnE47kL3lTY=;
  b=SyU/uxrX68LCV9WYBwOLXFVgdiXoqaz/K3MewlcTV2F5RFTH5MZwUpv9
   gI545pX8k1RKbDy9JqoTxs8C9yEkv9RsIiXnk+mf9QtGe2Jztq9zsSbFH
   Y7jJunjAi7GSfHKtXFsdx1/3J/OCqE/wDJCb/N00WZHhYylTislBFeJCf
   8zlMOqoMvkSZglIi6BfXgdJUwdzcEXbehT+blEbOA5ImVty1LMcyRic4M
   5fBPLvnMVtVlCm888+gTXdo0bGK/7RGH+N7ZeL8R2T9aTHfZYdR8oYBEr
   rTV6vjWgZx3ZL03O6/FXFuPdNhEo39Gnzc4fMEq2U0Zc+KtK8AU62iL/+
   A==;
X-CSE-ConnectionGUID: TQMcbIx2TaOW61EpxkseQw==
X-CSE-MsgGUID: 5CqgPr2ARxCCUbMvuKdKTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85066079"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="85066079"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 11:25:42 -0800
X-CSE-ConnectionGUID: eJpKNk4cT2KqclCqoSA0ow==
X-CSE-MsgGUID: r7TqE9xfQdWqcIvdo3ym8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228620794"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2025 11:25:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUrir-000000009JN-3tcv;
	Sun, 14 Dec 2025 19:25:37 +0000
Date: Mon, 15 Dec 2025 03:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] sched: psi: loosen clock sync between scheduler and
 aggregator
Message-ID: <202512150343.oUe3PPQm-lkp@intel.com>
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
In-Reply-To: <20251210155805.752523-1-hannes@cmpxchg.org>
References: <20251210155805.752523-1-hannes@cmpxchg.org>
TO: Johannes Weiner <hannes@cmpxchg.org>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Suren Baghdasaryan <surenb@google.com>
TO: Ingo Molnar <mingo@kernel.org>
CC: Chengming Zhou <chengming.zhou@linux.dev>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>
CC: John Stultz <jstultz@google.com>
CC: linux-kernel@vger.kernel.org

Hi Johannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on peterz-queue/sched/core tip/master linus/master v6.19-rc1 next-20251212]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Weiner/sched-psi-use-rq_clock-during-task-state-changes/20251211-000110
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251210155805.752523-1-hannes%40cmpxchg.org
patch subject: [PATCH 1/2] sched: psi: loosen clock sync between scheduler and aggregator
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20251211 (https://download.01.org/0day-ci/archive/20251215/202512150343.oUe3PPQm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512150343.oUe3PPQm-lkp@intel.com/

smatch warnings:
kernel/sched/psi.c:311 get_recent_times() error: uninitialized symbol 'now'.

vim +/now +311 kernel/sched/psi.c

eb414681d5a07d Johannes Weiner    2018-10-26  270  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  271  static void get_recent_times(struct psi_group *group, int cpu,
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  272  			     enum psi_aggregators aggregator, u32 *times,
333f3017c5a893 Suren Baghdasaryan 2019-05-14  273  			     u32 *pchanged_states)
eb414681d5a07d Johannes Weiner    2018-10-26  274  {
eb414681d5a07d Johannes Weiner    2018-10-26  275  	struct psi_group_cpu *groupc = per_cpu_ptr(group->pcpu, cpu);
2fcd7bbae90a6d Chengming Zhou     2022-10-14  276  	int current_cpu = raw_smp_processor_id();
2fcd7bbae90a6d Chengming Zhou     2022-10-14  277  	unsigned int tasks[NR_PSI_TASK_COUNTS];
eb414681d5a07d Johannes Weiner    2018-10-26  278  	u64 now, state_start;
33b2d6302abc4c Suren Baghdasaryan 2019-05-14  279  	enum psi_states s;
eb414681d5a07d Johannes Weiner    2018-10-26  280  	unsigned int seq;
33b2d6302abc4c Suren Baghdasaryan 2019-05-14  281  	u32 state_mask;
eb414681d5a07d Johannes Weiner    2018-10-26  282  
333f3017c5a893 Suren Baghdasaryan 2019-05-14  283  	*pchanged_states = 0;
333f3017c5a893 Suren Baghdasaryan 2019-05-14  284  
eb414681d5a07d Johannes Weiner    2018-10-26  285  	/* Snapshot a coherent view of the CPU state */
eb414681d5a07d Johannes Weiner    2018-10-26  286  	do {
570c8efd5eb79c Peter Zijlstra     2025-05-23  287  		seq = psi_read_begin(cpu);
eb414681d5a07d Johannes Weiner    2018-10-26  288  		memcpy(times, groupc->times, sizeof(groupc->times));
33b2d6302abc4c Suren Baghdasaryan 2019-05-14  289  		state_mask = groupc->state_mask;
eb414681d5a07d Johannes Weiner    2018-10-26  290  		state_start = groupc->state_start;
2fcd7bbae90a6d Chengming Zhou     2022-10-14  291  		if (cpu == current_cpu)
2fcd7bbae90a6d Chengming Zhou     2022-10-14  292  			memcpy(tasks, groupc->tasks, sizeof(groupc->tasks));
570c8efd5eb79c Peter Zijlstra     2025-05-23  293  	} while (psi_read_retry(cpu, seq));
eb414681d5a07d Johannes Weiner    2018-10-26  294  
8b5b0ad08dd61a Johannes Weiner    2025-12-10  295  	if (state_mask)
8b5b0ad08dd61a Johannes Weiner    2025-12-10  296  		now = cpu_clock(cpu);
8b5b0ad08dd61a Johannes Weiner    2025-12-10  297  
eb414681d5a07d Johannes Weiner    2018-10-26  298  	/* Calculate state time deltas against the previous snapshot */
eb414681d5a07d Johannes Weiner    2018-10-26  299  	for (s = 0; s < NR_PSI_STATES; s++) {
eb414681d5a07d Johannes Weiner    2018-10-26  300  		u32 delta;
eb414681d5a07d Johannes Weiner    2018-10-26  301  		/*
eb414681d5a07d Johannes Weiner    2018-10-26  302  		 * In addition to already concluded states, we also
eb414681d5a07d Johannes Weiner    2018-10-26  303  		 * incorporate currently active states on the CPU,
eb414681d5a07d Johannes Weiner    2018-10-26  304  		 * since states may last for many sampling periods.
eb414681d5a07d Johannes Weiner    2018-10-26  305  		 *
eb414681d5a07d Johannes Weiner    2018-10-26  306  		 * This way we keep our delta sampling buckets small
eb414681d5a07d Johannes Weiner    2018-10-26  307  		 * (u32) and our reported pressure close to what's
eb414681d5a07d Johannes Weiner    2018-10-26  308  		 * actually happening.
eb414681d5a07d Johannes Weiner    2018-10-26  309  		 */
33b2d6302abc4c Suren Baghdasaryan 2019-05-14  310  		if (state_mask & (1 << s))
eb414681d5a07d Johannes Weiner    2018-10-26 @311  			times[s] += now - state_start;
eb414681d5a07d Johannes Weiner    2018-10-26  312  
8b5b0ad08dd61a Johannes Weiner    2025-12-10  313  		/*
8b5b0ad08dd61a Johannes Weiner    2025-12-10  314  		 * This snooping ahead can obviously race with the
8b5b0ad08dd61a Johannes Weiner    2025-12-10  315  		 * state concluding on the cpu. If we previously
8b5b0ad08dd61a Johannes Weiner    2025-12-10  316  		 * snooped to a time past where the state concludes,
8b5b0ad08dd61a Johannes Weiner    2025-12-10  317  		 * times[s] can now be behind times_prev[s].
8b5b0ad08dd61a Johannes Weiner    2025-12-10  318  		 *
8b5b0ad08dd61a Johannes Weiner    2025-12-10  319  		 * time_after32() would be the obvious choice, but
8b5b0ad08dd61a Johannes Weiner    2025-12-10  320  		 * S32_MAX is right around two seconds, which is the
8b5b0ad08dd61a Johannes Weiner    2025-12-10  321  		 * aggregation interval; if the aggregator gets
8b5b0ad08dd61a Johannes Weiner    2025-12-10  322  		 * delayed, there would be a risk of dismissing
8b5b0ad08dd61a Johannes Weiner    2025-12-10  323  		 * genuinely large samples. Use a larger margin.
8b5b0ad08dd61a Johannes Weiner    2025-12-10  324  		 */
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  325  		delta = times[s] - groupc->times_prev[aggregator][s];
8b5b0ad08dd61a Johannes Weiner    2025-12-10  326  		if (delta > psi_period + (psi_period >> 1))
8b5b0ad08dd61a Johannes Weiner    2025-12-10  327  			delta = 0;
8b5b0ad08dd61a Johannes Weiner    2025-12-10  328  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  329  		groupc->times_prev[aggregator][s] = times[s];
eb414681d5a07d Johannes Weiner    2018-10-26  330  
eb414681d5a07d Johannes Weiner    2018-10-26  331  		times[s] = delta;
333f3017c5a893 Suren Baghdasaryan 2019-05-14  332  		if (delta)
333f3017c5a893 Suren Baghdasaryan 2019-05-14  333  			*pchanged_states |= (1 << s);
eb414681d5a07d Johannes Weiner    2018-10-26  334  	}
2fcd7bbae90a6d Chengming Zhou     2022-10-14  335  
2fcd7bbae90a6d Chengming Zhou     2022-10-14  336  	/*
2fcd7bbae90a6d Chengming Zhou     2022-10-14  337  	 * When collect_percpu_times() from the avgs_work, we don't want to
2fcd7bbae90a6d Chengming Zhou     2022-10-14  338  	 * re-arm avgs_work when all CPUs are IDLE. But the current CPU running
2fcd7bbae90a6d Chengming Zhou     2022-10-14  339  	 * this avgs_work is never IDLE, cause avgs_work can't be shut off.
2fcd7bbae90a6d Chengming Zhou     2022-10-14  340  	 * So for the current CPU, we need to re-arm avgs_work only when
2fcd7bbae90a6d Chengming Zhou     2022-10-14  341  	 * (NR_RUNNING > 1 || NR_IOWAIT > 0 || NR_MEMSTALL > 0), for other CPUs
2fcd7bbae90a6d Chengming Zhou     2022-10-14  342  	 * we can just check PSI_NONIDLE delta.
2fcd7bbae90a6d Chengming Zhou     2022-10-14  343  	 */
2fcd7bbae90a6d Chengming Zhou     2022-10-14  344  	if (current_work() == &group->avgs_work.work) {
2fcd7bbae90a6d Chengming Zhou     2022-10-14  345  		bool reschedule;
2fcd7bbae90a6d Chengming Zhou     2022-10-14  346  
2fcd7bbae90a6d Chengming Zhou     2022-10-14  347  		if (cpu == current_cpu)
2fcd7bbae90a6d Chengming Zhou     2022-10-14  348  			reschedule = tasks[NR_RUNNING] +
2fcd7bbae90a6d Chengming Zhou     2022-10-14  349  				     tasks[NR_IOWAIT] +
2fcd7bbae90a6d Chengming Zhou     2022-10-14  350  				     tasks[NR_MEMSTALL] > 1;
2fcd7bbae90a6d Chengming Zhou     2022-10-14  351  		else
2fcd7bbae90a6d Chengming Zhou     2022-10-14  352  			reschedule = *pchanged_states & (1 << PSI_NONIDLE);
2fcd7bbae90a6d Chengming Zhou     2022-10-14  353  
2fcd7bbae90a6d Chengming Zhou     2022-10-14  354  		if (reschedule)
2fcd7bbae90a6d Chengming Zhou     2022-10-14  355  			*pchanged_states |= PSI_STATE_RESCHEDULE;
2fcd7bbae90a6d Chengming Zhou     2022-10-14  356  	}
eb414681d5a07d Johannes Weiner    2018-10-26  357  }
eb414681d5a07d Johannes Weiner    2018-10-26  358  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
