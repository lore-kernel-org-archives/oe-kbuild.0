Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D41743F084
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 12:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662101; cv=none; b=c2BM78IpL/5XH7qQD5NzjvOLMUchGvC3EoiLcv2AKG/gDCR9XiQT0lGbMCG7UG3fBVcnTx2TEgKMNfHAQZQZ5pMskz9F4Y5if5LPDZ7wxoc/wQnMVLkzAE4vN/gmIfaBgHYq4+/ppRgSgw/0/fvdLEqLsTDhkRMw4hx1Xj8RFLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662101; c=relaxed/simple;
	bh=XyceE6S762oBR1jV8ofQhwl0JLcBJF2zAuqg9RGX8ic=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H6U+N+q0KE2A1IdGd1W40oXdjLqOgSCyuNY30ppgpnVu7vEllo13u6DGE/R9w0CTPJEhGC6CnYcyl9MBTlirdzroYWfhXIjA/pj24aFZWsAyxuRhCnkcnG3BMm/ZTDe13BlkaD5MJT+aHwcxNbPMUFh/pbnwlh9Onuu9FoMsm1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bimvX98F; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bimvX98F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787662097; x=1819198097;
  h=date:from:to:cc:subject:message-id;
  bh=XyceE6S762oBR1jV8ofQhwl0JLcBJF2zAuqg9RGX8ic=;
  b=bimvX98FzuaYXqAQT8QdRJGyA+GRVLHgW1QWXMTAf7v0653Y+XivmnJ5
   2s8PdumTUb4MFzToTdX0zjRhUJj+sDXkIjuLcoRe6piqHaGGEJLXYBvm+
   B9z9fleJHzJyVl2cLPPjXW/wOjuEjCOkB0Wnc8hParg4BviTCkpV2+Edx
   mSsJA8dFyNZkqpFB1Ovf16qi8ZdKPGqRnjmVHLg9a64N8R113CTXDT/ce
   wQl4E5yabovEC3pvONeot88FZLzFqKg1gm4mRQhfAyu/IPgT46e3mqsKm
   Otx94pVmUet22qhGnYRDk3WR3Y7fZkbi50cFrSZ7GdYAHsPHEoSaxB3z/
   w==;
X-CSE-ConnectionGUID: ubntflGTTKq7PkNkObeMJg==
X-CSE-MsgGUID: SEjjUnkFRCKx2vCtoYPzbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88153363"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88153363"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 05:48:13 -0700
X-CSE-ConnectionGUID: b4nVs/74SWShdXujO5YxdQ==
X-CSE-MsgGUID: fD/sF5tGQEycR2/zk3+CEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="271078070"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Aug 2026 05:48:12 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyqZV-000000005sB-2A8a;
	Tue, 25 Aug 2026 12:48:09 +0000
Date: Tue, 25 Aug 2026 20:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/sched/ext/ext.c:2538 scx_consume_dispatch_q() warn:
 inconsistent returns '&dsq->lock'.
Message-ID: <202608252024.m6y1SAwi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tejun Heo <tj@kernel.org>
CC: Andrea Righi <arighi@nvidia.com>

Hi Tejun,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66498c75b4f8017f62d720d9b59675bdf3abce91
commit: 26e5a408b7a7fead67395a81acebd84090559ed6 sched_ext: Prefix file-local ext.c helpers exposed by the sub.c split
date:   8 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 weeks ago
config: powerpc64-randconfig-r073-20260825 (https://download.01.org/0day-ci/archive/20260825/202608252024.m6y1SAwi-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 26e5a408b7a7 ("sched_ext: Prefix file-local ext.c helpers exposed by the sub.c split")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608252024.m6y1SAwi-lkp@intel.com/

New smatch warnings:
kernel/sched/ext/ext.c:2538 scx_consume_dispatch_q() warn: inconsistent returns '&dsq->lock'.

Old smatch warnings:
arch/powerpc/include/asm/mmu.h:253 mmu_has_feature() warn: bitwise AND condition is false here

vim +2538 kernel/sched/ext/ext.c

8427acb6b5861d kernel/sched/ext.c     Tejun Heo 2024-09-24  2493  
26e5a408b7a7fe kernel/sched/ext/ext.c Tejun Heo 2026-07-01  2494  static bool scx_consume_dispatch_q(struct scx_sched *sch, struct rq *rq,
da32a2986e5fb3 kernel/sched/ext.c     Tejun Heo 2026-03-13  2495  				   struct scx_dispatch_q *dsq, u64 enq_flags)
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2496  {
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2497  	struct task_struct *p;
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2498  retry:
650ba21b131ed1 kernel/sched/ext.c     Tejun Heo 2024-07-08  2499  	/*
650ba21b131ed1 kernel/sched/ext.c     Tejun Heo 2024-07-08  2500  	 * The caller can't expect to successfully consume a task if the task's
650ba21b131ed1 kernel/sched/ext.c     Tejun Heo 2024-07-08  2501  	 * addition to @dsq isn't guaranteed to be visible somehow. Test
650ba21b131ed1 kernel/sched/ext.c     Tejun Heo 2024-07-08  2502  	 * @dsq->list without locking and skip if it seems empty.
650ba21b131ed1 kernel/sched/ext.c     Tejun Heo 2024-07-08  2503  	 */
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2504  	if (list_empty(&dsq->list))
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2505  		return false;
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2506  
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2507  	raw_spin_lock(&dsq->lock);
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2508  
650ba21b131ed1 kernel/sched/ext.c     Tejun Heo 2024-07-08  2509  	nldsq_for_each_task(p, dsq) {
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2510  		struct rq *task_rq = task_rq(p);
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2511  
5ebec443fb96ac kernel/sched/ext.c     Tejun Heo 2025-11-11  2512  		/*
5ebec443fb96ac kernel/sched/ext.c     Tejun Heo 2025-11-11  2513  		 * This loop can lead to multiple lockup scenarios, e.g. the BPF
5ebec443fb96ac kernel/sched/ext.c     Tejun Heo 2025-11-11  2514  		 * scheduler can put an enormous number of affinitized tasks into
5ebec443fb96ac kernel/sched/ext.c     Tejun Heo 2025-11-11  2515  		 * a contended DSQ, or the outer retry loop can repeatedly race
5ebec443fb96ac kernel/sched/ext.c     Tejun Heo 2025-11-11  2516  		 * against scx_bypass() dequeueing tasks from @dsq trying to put
5ebec443fb96ac kernel/sched/ext.c     Tejun Heo 2025-11-11  2517  		 * the system into the bypass mode. This can easily live-lock the
5ebec443fb96ac kernel/sched/ext.c     Tejun Heo 2025-11-11  2518  		 * machine. If aborting, exit from all non-bypass DSQs.
5ebec443fb96ac kernel/sched/ext.c     Tejun Heo 2025-11-11  2519  		 */
c1743da43cf52c kernel/sched/ext.c     Tejun Heo 2026-03-06  2520  		if (unlikely(READ_ONCE(sch->aborting)) && dsq->id != SCX_DSQ_BYPASS)
5ebec443fb96ac kernel/sched/ext.c     Tejun Heo 2025-11-11  2521  			break;
5ebec443fb96ac kernel/sched/ext.c     Tejun Heo 2025-11-11  2522  
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2523  		if (rq == task_rq) {
cf3e94430dd994 kernel/sched/ext.c     Tejun Heo 2024-09-09  2524  			task_unlink_from_dsq(p, dsq);
4e3d7c89e15ac5 kernel/sched/ext.c     zhidao su 2026-04-23  2525  			move_local_task_to_local_dsq(sch, p, enq_flags, dsq, rq);
cf3e94430dd994 kernel/sched/ext.c     Tejun Heo 2024-09-09  2526  			raw_spin_unlock(&dsq->lock);
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2527  			return true;
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2528  		}
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2529  
a8433f7a267f9f kernel/sched/ext.c     Tejun Heo 2025-05-14  2530  		if (task_can_run_on_remote_rq(sch, p, rq, false)) {
da32a2986e5fb3 kernel/sched/ext.c     Tejun Heo 2026-03-13  2531  			if (likely(consume_remote_task(rq, p, enq_flags, dsq, task_rq)))
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2532  				return true;
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2533  			goto retry;
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2534  		}
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2535  	}
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2536  
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2537  	raw_spin_unlock(&dsq->lock);
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18 @2538  	return false;
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2539  }
f0e1a0643a59bf kernel/sched/ext.c     Tejun Heo 2024-06-18  2540  

:::::: The code at line 2538 was first introduced by commit
:::::: f0e1a0643a59bf1f922fa209cec86a170b784f3f sched_ext: Implement BPF extensible scheduler class

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
