Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471D9377EC6
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Aug 2026 19:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787600147; cv=none; b=fA7RSbU2WSWMyrKlHuPZmzzu42QbkAxQrPmITHpR6jLa9aQK/G61vrKCUn1/crUKCQHtA7zBbGiduFcad3fK9ED1D9tT1zr3VwIgTjiY4VtOmPwcKLsxQ+dLzpC09pMV+V2ckWhuMS66gN9mnh3okFRGkk+YiaFD6eqNDgXJQ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787600147; c=relaxed/simple;
	bh=ZgbsXPJqJ3imbsnosNtCiBKcnpWVItyj4mXRGJN6bPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TadxmXoLdF+nqPj5HbmCY8XaOT9rrf23J9puFmGhR+qb+CEJMmhuajPRRJCgUgg7/lOZHSrWBTu7Tr32H65o5JhgHtLW7mQBX7A/U5PNwATu59R1diqsv0hGqsZq4T5ONy6Qw+OxrhcRcP+YYbf7HJqeA/63XlycdGPOs7x2zEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f47/yAll; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f47/yAll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787600145; x=1819136145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZgbsXPJqJ3imbsnosNtCiBKcnpWVItyj4mXRGJN6bPw=;
  b=f47/yAlla36i2GjS592kwu3qEi0Fz9bCymrQvaGO48yJ+/3YffODdzuO
   KFV7j+RZQe6sab8ZSak1tATp0+OUFMJU8lme8nb3FnhFUN9mfymx/NV3O
   zegoDj2yQ9c4wCk7JUjDSzowHoeklDhr2zI+7qawBGE4Q9KYc99ERKmb0
   m1+e7RexklT52z/Pm6Xj5gyW4M0QPX/i3UiaYKPBBkzOy+IGfLdinEsW4
   IUmNMmaHsKWpHDzSfFjirdrkXCEOGL05ataI0/Osai+/pE8jrcgEMdVEY
   uVgjZm+TPptPlv2ewLiOlhhfGG12zpv30aOwxC+Qqqq39dHcwI7SAbI76
   w==;
X-CSE-ConnectionGUID: rI15F/EhRiCBtDAWt7iP9w==
X-CSE-MsgGUID: bg7s9LYES/+I28Quy32zag==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99408800"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="99408800"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:35:45 -0700
X-CSE-ConnectionGUID: 0dA9Im77TXeeON1/3cbgJQ==
X-CSE-MsgGUID: /VB0Q6/mSm24bxCYZG02Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="264465910"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Aug 2026 12:35:43 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyaSF-000000003uB-0cJT;
	Mon, 24 Aug 2026 19:35:37 +0000
Date: Tue, 25 Aug 2026 03:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] sched/fair: Restart hrtick after same-task repicks
Message-ID: <202608250340.cxCp0maB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260813-sched-fair-hrtick-restart-v1-1-4230d1e18fbb@gentwo.org>
References: <20260813-sched-fair-hrtick-restart-v1-1-4230d1e18fbb@gentwo.org>
TO: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Juri Lelli <juri.lelli@redhat.com>
TO: Vincent Guittot <vincent.guittot@linaro.org>
TO: Dietmar Eggemann <dietmar.eggemann@arm.com>
TO: Steven Rostedt <rostedt@goodmis.org>
TO: Ben Segall <bsegall@google.com>
TO: Mel Gorman <mgorman@suse.de>
TO: Valentin Schneider <vschneid@redhat.com>
TO: K Prateek Nayak <kprateek.nayak@amd.com>
TO: Shubhang Kaushik <shubhang@os.amperecomputing.com>
TO: Christoph Lameter <cl@linux-foundation.org>
CC: linux-kernel@vger.kernel.org
CC: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>

Hi Shubhang,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3aa1dcaa4f6f5ae08936491e08bd456f331f2d40]

url:    https://github.com/intel-lab-lkp/linux/commits/Shubhang-Kaushik-Ampere/sched-fair-Restart-hrtick-after-same-task-repicks/20260813-142348
base:   3aa1dcaa4f6f5ae08936491e08bd456f331f2d40
patch link:    https://lore.kernel.org/r/20260813-sched-fair-hrtick-restart-v1-1-4230d1e18fbb%40gentwo.org
patch subject: [PATCH] sched/fair: Restart hrtick after same-task repicks
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: s390-randconfig-002-20260825 (https://download.01.org/0day-ci/archive/20260825/202608250340.cxCp0maB-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608250340.cxCp0maB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608250340.cxCp0maB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:14885:7: error: no member named 'hrtick_rearm_fair' in 'struct rq'
    14885 |                 rq->hrtick_rearm_fair = hrtick_enabled_fair(rq) &&
          |                 ~~  ^
   1 error generated.


vim +14885 kernel/sched/fair.c

8039e96fcc1de3 kernel/sched/fair.c Vineeth Pillai            2020-11-17  14858  
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar               2007-07-09  14859  /*
d84b31313ef8a8 kernel/sched/fair.c Frederic Weisbecker       2018-02-21  14860   * scheduler tick hitting a task of our scheduling class.
d84b31313ef8a8 kernel/sched/fair.c Frederic Weisbecker       2018-02-21  14861   *
d84b31313ef8a8 kernel/sched/fair.c Frederic Weisbecker       2018-02-21  14862   * NOTE: This function can be called remotely by the tick offload that
d84b31313ef8a8 kernel/sched/fair.c Frederic Weisbecker       2018-02-21  14863   * goes along full dynticks. Therefore no local assumption can be made
d84b31313ef8a8 kernel/sched/fair.c Frederic Weisbecker       2018-02-21  14864   * and everything must be accessed through the @rq and @curr passed in
d84b31313ef8a8 kernel/sched/fair.c Frederic Weisbecker       2018-02-21  14865   * parameters.
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar               2007-07-09  14866   */
8f4d37ec073c17 kernel/sched_fair.c Peter Zijlstra            2008-01-25  14867  static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar               2007-07-09  14868  {
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar               2007-07-09  14869  	struct sched_entity *se = &curr->se;
f666241e6bd5d9 kernel/sched/fair.c Peter Zijlstra            2026-06-02  14870  	struct cfs_rq *cfs_rq;
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar               2007-07-09  14871  
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar               2007-07-09  14872  	for_each_sched_entity(se) {
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar               2007-07-09  14873  		cfs_rq = cfs_rq_of(se);
8f4d37ec073c17 kernel/sched_fair.c Peter Zijlstra            2008-01-25  14874  		entity_tick(cfs_rq, se, queued);
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar               2007-07-09  14875  	}
18bf2805d9b30c kernel/sched/fair.c Ben Segall                2012-10-04  14876  
c6c981b4c656c8 kernel/sched/fair.c Shubhang Kaushik (Ampere  2026-08-13  14877) 	if (queued) {
c6c981b4c656c8 kernel/sched/fair.c Shubhang Kaushik (Ampere  2026-08-13  14878) 		/*
c6c981b4c656c8 kernel/sched/fair.c Shubhang Kaushik (Ampere  2026-08-13  14879) 		 * Fair hrtick is one-shot. If this hrtick-triggered
c6c981b4c656c8 kernel/sched/fair.c Shubhang Kaushik (Ampere  2026-08-13  14880) 		 * reschedule picks the same task again, set_next_task_fair()
c6c981b4c656c8 kernel/sched/fair.c Shubhang Kaushik (Ampere  2026-08-13  14881) 		 * will be skipped. Mark that path for a possible restart, but
c6c981b4c656c8 kernel/sched/fair.c Shubhang Kaushik (Ampere  2026-08-13  14882) 		 * avoid delayed-dequeue cases where queued entities are not all
c6c981b4c656c8 kernel/sched/fair.c Shubhang Kaushik (Ampere  2026-08-13  14883) 		 * runnable.
c6c981b4c656c8 kernel/sched/fair.c Shubhang Kaushik (Ampere  2026-08-13  14884) 		 */
c6c981b4c656c8 kernel/sched/fair.c Shubhang Kaushik (Ampere  2026-08-13 @14885) 		rq->hrtick_rearm_fair = hrtick_enabled_fair(rq) &&
c6c981b4c656c8 kernel/sched/fair.c Shubhang Kaushik (Ampere  2026-08-13  14886) 					rq->cfs.h_nr_runnable > 1 &&
c6c981b4c656c8 kernel/sched/fair.c Shubhang Kaushik (Ampere  2026-08-13  14887) 					rq->cfs.h_nr_runnable == rq->cfs.h_nr_queued;
95a0155224a658 kernel/sched/fair.c Peter Zijlstra            2025-09-01  14888  		return;
c6c981b4c656c8 kernel/sched/fair.c Shubhang Kaushik (Ampere  2026-08-13  14889) 	}
95a0155224a658 kernel/sched/fair.c Peter Zijlstra            2025-09-01  14890  
b52da86e0ad58f kernel/sched/fair.c Srikar Dronamraju         2015-10-02  14891  	if (static_branch_unlikely(&sched_numa_balancing))
cbee9f88ec1b8d kernel/sched/fair.c Peter Zijlstra            2012-10-25  14892  		task_tick_numa(rq, curr);
3b1baa6496e6b7 kernel/sched/fair.c Morten Rasmussen          2018-07-04  14893  
df0d98475954d6 kernel/sched/fair.c Peter Zijlstra (Intel     2026-04-01  14894) 	task_tick_cache(rq, curr);
df0d98475954d6 kernel/sched/fair.c Peter Zijlstra (Intel     2026-04-01  14895) 
3b1baa6496e6b7 kernel/sched/fair.c Morten Rasmussen          2018-07-04  14896  	update_misfit_status(curr, rq);
be3a51e68f2f1b kernel/sched/fair.c Shrikanth Hegde           2024-03-07  14897  	check_update_overutilized_status(task_rq(curr));
8039e96fcc1de3 kernel/sched/fair.c Vineeth Pillai            2020-11-17  14898  
8039e96fcc1de3 kernel/sched/fair.c Vineeth Pillai            2020-11-17  14899  	task_tick_core(rq, curr);
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar               2007-07-09  14900  }
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar               2007-07-09  14901  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
