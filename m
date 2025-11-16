Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F151A9FB5
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Nov 2025 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763282912; cv=none; b=tqKkRn73mDkMz3VmNpu9Z7idpDcj7j4x9n9XVEzvVb7dFOrCCICGXHEbAEOoubitxAa1ZqNxl2Eo80dLCO0ag/f+1ryvfJQbsH36DYAGtY+4u4JZOOMD1gLzduTGlMQalyCCm+yQfC5vI4BpbRnu+kXizKsjkXwbbOJY8vN2iio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763282912; c=relaxed/simple;
	bh=g6o2TzE6aD3ctbraj7oUarq8f3Nv3vnKvhnYlxhjwYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DxU/uLs3HEbWxncEDzgcYMrIpwj8Nor1t7gKXFiWWzcyIama843rCUS2YfqOGM0w6ZlptXNxX2Uzs8LNPLeqBWIs6Cyrk3+ce4e10dCnXgBmwHn9mORm/IIodk2Gv3zNKGm3RJurwbYTJ/ijipvpZ7ttXLBvUvYHf93mGtwWQkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R71B9nzI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R71B9nzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763282910; x=1794818910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g6o2TzE6aD3ctbraj7oUarq8f3Nv3vnKvhnYlxhjwYw=;
  b=R71B9nzI9sYFP1Qwx3YmwBInuklxWruLX4BHvh1883e++6jqIp3Ld6zB
   ++Z3qv7tuql6Gk8oF0Juuhzj2cxHHrUxZCZ+JDUf2+F2M1KmSBShKOVk9
   UCEMS5LL5AYOud1EhhQ2ubwgWST8mG5GbrJeF6I5tnRFBQ8R5QdCaHBDE
   0veL8dYWM37Hpv1KZytRTv5O2lAb45nnhP4AtsSyDxmE3RrMhGHXo8x0D
   AjCRKd/svB9ydpJ0GBTLH1nWV34+yOMa+lMpAjQxezJ9vAg8vRCjXoj5g
   +qRAqjKw2ZvLHBLYN1VTOCiODcMHHYp4gC8XtwfOvwaJB7CnBIyyXhNix
   w==;
X-CSE-ConnectionGUID: JOhrGGm+RZSekGA2vbRWYA==
X-CSE-MsgGUID: t+NSKTO9QuiTC3evpqTeVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="76416157"
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="76416157"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 00:48:29 -0800
X-CSE-ConnectionGUID: BlVNOM+rRT+hyLWchd3tLQ==
X-CSE-MsgGUID: BdBuuRuQTrW+doRoRcdQOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="190342895"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Nov 2025 00:48:29 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKYQs-0008dP-0R;
	Sun, 16 Nov 2025 08:48:26 +0000
Date: Sun, 16 Nov 2025 16:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] sched/psi: Streamline the flow in psi_group_change
Message-ID: <202511161642.NB7XYtH9-lkp@intel.com>
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
In-Reply-To: <20251113122254.40445-1-tvrtko.ursulin@igalia.com>
References: <20251113122254.40445-1-tvrtko.ursulin@igalia.com>
TO: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
TO: linux-kernel@vger.kernel.org
CC: kernel-dev@igalia.com
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: Suren Baghdasaryan <surenb@google.com>
CC: Peter Ziljstra <peterz@infradead.org>

Hi Tvrtko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.18-rc5 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/sched-psi-Streamline-the-flow-in-psi_group_change/20251113-203009
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251113122254.40445-1-tvrtko.ursulin%40igalia.com
patch subject: [PATCH] sched/psi: Streamline the flow in psi_group_change
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: sh-randconfig-r071-20251115 (https://download.01.org/0day-ci/archive/20251116/202511161642.NB7XYtH9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511161642.NB7XYtH9-lkp@intel.com/

smatch warnings:
kernel/sched/psi.c:855 psi_group_change() error: uninitialized symbol 'state_mask'.

vim +/state_mask +855 kernel/sched/psi.c

eb414681d5a07d Johannes Weiner    2018-10-26  792  
570c8efd5eb79c Peter Zijlstra     2025-05-23  793  #define for_each_group(iter, group) \
570c8efd5eb79c Peter Zijlstra     2025-05-23  794  	for (typeof(group) iter = group; iter; iter = iter->parent)
570c8efd5eb79c Peter Zijlstra     2025-05-23  795  
36b238d5717279 Johannes Weiner    2020-03-16  796  static void psi_group_change(struct psi_group *group, int cpu,
3840cbe24cf060 Johannes Weiner    2024-10-03  797  			     unsigned int clear, unsigned int set,
570c8efd5eb79c Peter Zijlstra     2025-05-23  798  			     u64 now, bool wake_clock)
eb414681d5a07d Johannes Weiner    2018-10-26  799  {
eb414681d5a07d Johannes Weiner    2018-10-26  800  	struct psi_group_cpu *groupc;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  801  	unsigned long t, m;
71dbdde7914d32 Johannes Weiner    2022-08-26  802  	u32 state_mask;
eb414681d5a07d Johannes Weiner    2018-10-26  803  
ddae0ca2a8fe12 John Stultz        2024-06-18  804  	lockdep_assert_rq_held(cpu_rq(cpu));
eb414681d5a07d Johannes Weiner    2018-10-26  805  	groupc = per_cpu_ptr(group->pcpu, cpu);
eb414681d5a07d Johannes Weiner    2018-10-26  806  
71dbdde7914d32 Johannes Weiner    2022-08-26  807  	/*
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  808  	 * TSK_ONCPU does not have a corresponding task count - it's just a
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  809  	 * boolean flag directly encoded in the state mask. Clear, set, or carry
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  810  	 * the current state if no changes are requested.
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  811  	 *
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  812  	 * The rest of the state mask is calculated based on the task counts.
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  813  	 * Update those first, then construct the mask.
71dbdde7914d32 Johannes Weiner    2022-08-26  814  	 */
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  815  	m = clear;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  816  	for_each_set_bit(t, &m, ARRAY_SIZE(groupc->tasks)) {
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  817  		if (likely(groupc->tasks[t])) {
9d10a13d1e4c34 Charan Teja Reddy  2021-04-16  818  			groupc->tasks[t]--;
9d10a13d1e4c34 Charan Teja Reddy  2021-04-16  819  		} else if (!psi_bug) {
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  820  			printk_deferred(KERN_ERR "psi: task underflow! cpu=%d t=%lu tasks=[%u %u %u %u] clear=%x set=%x\n",
eb414681d5a07d Johannes Weiner    2018-10-26  821  					cpu, t, groupc->tasks[0],
eb414681d5a07d Johannes Weiner    2018-10-26  822  					groupc->tasks[1], groupc->tasks[2],
71dbdde7914d32 Johannes Weiner    2022-08-26  823  					groupc->tasks[3], clear, set);
eb414681d5a07d Johannes Weiner    2018-10-26  824  			psi_bug = 1;
eb414681d5a07d Johannes Weiner    2018-10-26  825  		}
eb414681d5a07d Johannes Weiner    2018-10-26  826  	}
eb414681d5a07d Johannes Weiner    2018-10-26  827  
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  828  	m = set;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  829  	for_each_set_bit(t, &m, ARRAY_SIZE(groupc->tasks))
eb414681d5a07d Johannes Weiner    2018-10-26  830  		groupc->tasks[t]++;
eb414681d5a07d Johannes Weiner    2018-10-26  831  
34f26a15611afb Chengming Zhou     2022-09-07  832  	if (!group->enabled) {
34f26a15611afb Chengming Zhou     2022-09-07  833  		/*
34f26a15611afb Chengming Zhou     2022-09-07  834  		 * On the first group change after disabling PSI, conclude
34f26a15611afb Chengming Zhou     2022-09-07  835  		 * the current state and flush its time. This is unlikely
34f26a15611afb Chengming Zhou     2022-09-07  836  		 * to matter to the user, but aggregation (get_recent_times)
34f26a15611afb Chengming Zhou     2022-09-07  837  		 * may have already incorporated the live state into times_prev;
34f26a15611afb Chengming Zhou     2022-09-07  838  		 * avoid a delta sample underflow when PSI is later re-enabled.
34f26a15611afb Chengming Zhou     2022-09-07  839  		 */
34f26a15611afb Chengming Zhou     2022-09-07  840  		if (unlikely(groupc->state_mask & (1 << PSI_NONIDLE)))
34f26a15611afb Chengming Zhou     2022-09-07  841  			record_times(groupc, now);
34f26a15611afb Chengming Zhou     2022-09-07  842  
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  843  		if (unlikely(clear & TSK_ONCPU))
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  844  			state_mask = 0;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  845  		else if (unlikely(set & TSK_ONCPU))
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  846  			state_mask = PSI_ONCPU;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  847  		else
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  848  			state_mask = groupc->state_mask & PSI_ONCPU;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  849  
34f26a15611afb Chengming Zhou     2022-09-07  850  		groupc->state_mask = state_mask;
34f26a15611afb Chengming Zhou     2022-09-07  851  
34f26a15611afb Chengming Zhou     2022-09-07  852  		return;
34f26a15611afb Chengming Zhou     2022-09-07  853  	}
34f26a15611afb Chengming Zhou     2022-09-07  854  
0ec208ce983492 Tvrtko Ursulin     2024-06-25 @855  	state_mask = test_states(groupc->tasks, state_mask);
7fae6c8171d20a Chengming Zhou     2021-03-03  856  
7fae6c8171d20a Chengming Zhou     2021-03-03  857  	/*
7fae6c8171d20a Chengming Zhou     2021-03-03  858  	 * Since we care about lost potential, a memstall is FULL
7fae6c8171d20a Chengming Zhou     2021-03-03  859  	 * when there are no other working tasks, but also when
7fae6c8171d20a Chengming Zhou     2021-03-03  860  	 * the CPU is actively reclaiming and nothing productive
7fae6c8171d20a Chengming Zhou     2021-03-03  861  	 * could run even if it were runnable. So when the current
7fae6c8171d20a Chengming Zhou     2021-03-03  862  	 * task in a cgroup is in_memstall, the corresponding groupc
7fae6c8171d20a Chengming Zhou     2021-03-03  863  	 * on that cpu is in PSI_MEM_FULL state.
7fae6c8171d20a Chengming Zhou     2021-03-03  864  	 */
71dbdde7914d32 Johannes Weiner    2022-08-26  865  	if (unlikely((state_mask & PSI_ONCPU) && cpu_curr(cpu)->in_memstall))
7fae6c8171d20a Chengming Zhou     2021-03-03  866  		state_mask |= (1 << PSI_MEM_FULL);
7fae6c8171d20a Chengming Zhou     2021-03-03  867  
34f26a15611afb Chengming Zhou     2022-09-07  868  	record_times(groupc, now);
34f26a15611afb Chengming Zhou     2022-09-07  869  
33b2d6302abc4c Suren Baghdasaryan 2019-05-14  870  	groupc->state_mask = state_mask;
33b2d6302abc4c Suren Baghdasaryan 2019-05-14  871  
65457b74aa9437 Domenico Cerasuolo 2023-03-30  872  	if (state_mask & group->rtpoll_states)
65457b74aa9437 Domenico Cerasuolo 2023-03-30  873  		psi_schedule_rtpoll_work(group, 1, false);
36b238d5717279 Johannes Weiner    2020-03-16  874  
36b238d5717279 Johannes Weiner    2020-03-16  875  	if (wake_clock && !delayed_work_pending(&group->avgs_work))
36b238d5717279 Johannes Weiner    2020-03-16  876  		schedule_delayed_work(&group->avgs_work, PSI_FREQ);
eb414681d5a07d Johannes Weiner    2018-10-26  877  }
eb414681d5a07d Johannes Weiner    2018-10-26  878  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
