Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B501837BE80
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Aug 2026 18:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787596036; cv=none; b=G11p8oWHNAsaVJVwX0KYS6yo3Sp/oNrsPrJUFANaWm33m8B007mBDnc76uYANtMwn8pnpiSIFcEsbdd9QdUrzddSYOCsz/tybc/i20f5F1gBwJjBHQ3j4tw5OMRNmY/7jNFSqZCex+DHi4cVpTq/+nASSfkt5QIonC4ejPudXk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787596036; c=relaxed/simple;
	bh=R+6JWrKB0R21Bgk0s7SGGchLBmFJ3G4Trqk5UG3ECxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MYv7H1BLWUZcIsuZLPHmnOs9gxYIpVQC4/2Z65hCpynkk7pD4AKrZ9LD5FsH0FCpyJxZxA9DPniKazx4/s2RHfwwujlc0HMv2jpkV+VTRcscjGG4KMyGRYC0dWwORa42MpGGPsY4v9Lx7qAcUiNndar2mR0bKHKCEj52dsannRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBXDjem4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBXDjem4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787596034; x=1819132034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R+6JWrKB0R21Bgk0s7SGGchLBmFJ3G4Trqk5UG3ECxA=;
  b=ZBXDjem4Bmk+bJ7kW0ExwiAdmTlMK1hZ6tDn35j92A3trfa5RptKz1jm
   jgm37CX+iA88LQIEcQo4mCvKGvDUxxFwYcBwwY7kXNepyk7X1W6Vpmaim
   2k9fQNZoD7bP5YWkUH07hvOYuMztzZSjhz+uel4k+zKDMKnM9zCIP6CAH
   ijkXFHLjodopZsMdj8bc1fKjq24yURmHVSU7fn5vSdz0qPeXJMz6HHm/D
   BPgID20mDztbP9Xg9lgb34AGl5dPOLAOwQexneYgpzalfEGH9kvXRol3U
   uZ+s/8uGfboeVMbSLKnfz70c4yvDiF91yUar3aqzr5PQZ0YYWxKb7XCj6
   g==;
X-CSE-ConnectionGUID: 8Cw0sr73R1WFADONXcb/tg==
X-CSE-MsgGUID: PO2iwYSgRg+hUlaJVYxwrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="113593797"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="113593797"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:27:13 -0700
X-CSE-ConnectionGUID: +UGjIFpMSS6XREIaZqT5ew==
X-CSE-MsgGUID: ztCOfY0QQHaHbG9wrjpByg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="296978658"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Aug 2026 11:27:13 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyZNu-000000003kV-2IKL;
	Mon, 24 Aug 2026 18:27:05 +0000
Date: Tue, 25 Aug 2026 02:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] sched/fair: Restart hrtick after same-task repicks
Message-ID: <202608250251.11earlUX-lkp@intel.com>
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
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260825/202608250251.11earlUX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608250251.11earlUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608250251.11earlUX-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'task_tick_fair':
>> kernel/sched/fair.c:14885:19: error: 'struct rq' has no member named 'hrtick_rearm_fair'
   14885 |                 rq->hrtick_rearm_fair = hrtick_enabled_fair(rq) &&
         |                   ^~


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
