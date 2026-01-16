Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313BDE555
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 07:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768546968; cv=none; b=TC9uR2NjYtik+huirXq3xwRjJBWSwOOKBXh0v5zTiPjmNX0ms+/gauF4z8u5Be2vLwN7D6I0c7W6+ae3muxmJg5haGbC/DGqoO/uKzlzr+tDxuo5UCTszCfSS53EGfNw90kcVAr1FjggHvOJM93X1aL2qydKHumKrsEMiic6Q0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768546968; c=relaxed/simple;
	bh=bc9pDSQ1egsHYxNvphdWehRUxFCiEqSvSsV33SraLyc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iee3yUuShvDNCK8lDIqj8bYRuno4RW+6AN36gchvBvFYYFh0nDDCbDClIMA80XeVEeE6vOnrl/v5JVk0+KLd957V6QXik7GyS3rombxvvKTzDqOW8OMxZyKdoqxwmUtJcLuam/66jbpP+XAA7yXB5R153Rw4QIn9MfAP+LVQejo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6oOR9/1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6oOR9/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768546966; x=1800082966;
  h=date:from:to:cc:subject:message-id;
  bh=bc9pDSQ1egsHYxNvphdWehRUxFCiEqSvSsV33SraLyc=;
  b=m6oOR9/1elp0Lyn48Mqu1Q3gFQK/RStLCLMdKoWTLC6RD+zRNz/nBTdZ
   XfzHQVBAHTj7CnDEJ9qsAAgsJpF1LOS1FV9lIX6v3ycOgl/r6ENldxm32
   5o5Ag14RLxpy9nU1Cbe1OOsWkqPOKgwBRUj+T3VSv+j1HTeHrvSBM5Y6I
   Jj6SDb6lrBEa58P+fyKM0mJjCJOIN/PLC7NPXqgvEpFqeLNKBdpUGsURN
   8oAwoub8zk1SEry3+NfZ66LHAcmozGBqVXLiWRiUyNCnSKKnjXvqZ05OM
   ITFMGV0LqiUngZmxtS7v4wkP82fJBnYM0epTaeMHJQq6VNz1KBYJMxG+s
   g==;
X-CSE-ConnectionGUID: 1SX7wSkVRaWEzAUepTNkhA==
X-CSE-MsgGUID: EywyXwHSRkqw4CG2GVfNYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="95338397"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="95338397"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 23:02:45 -0800
X-CSE-ConnectionGUID: tQ+D8SsZTr2LXR0Hvimo7A==
X-CSE-MsgGUID: k/0yguroTXaXPfWvnVDNYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="204373152"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jan 2026 23:02:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgdqz-00000000KVc-1Smr;
	Fri, 16 Jan 2026 07:02:41 +0000
Date: Fri, 16 Jan 2026 15:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 4/4] kernel/workqueue.c:2644
 process_one_work() warn: variable dereferenced before check 'worker->task'
 (see line 2567)
Message-ID: <202601161425.T56neBEJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a58a97026588e9128868c7778ca1ffacbb53c931
commit: 6dc676743a7a8d292b2cc39016ba8f92d4c0ef49 [4/4] workqueue: Update lock debugging code
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-141-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161425.T56neBEJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601161425.T56neBEJ-lkp@intel.com/

smatch warnings:
kernel/workqueue.c:2644 process_one_work() warn: variable dereferenced before check 'worker->task' (see line 2567)

vim +2644 kernel/workqueue.c

73f53c4aa732ec Tejun Heo                 2010-06-29  2522  
a62428c0ae54a3 Tejun Heo                 2010-06-29  2523  /**
a62428c0ae54a3 Tejun Heo                 2010-06-29  2524   * process_one_work - process single work
c34056a3fdde77 Tejun Heo                 2010-06-29  2525   * @worker: self
a62428c0ae54a3 Tejun Heo                 2010-06-29  2526   * @work: work to process
a62428c0ae54a3 Tejun Heo                 2010-06-29  2527   *
a62428c0ae54a3 Tejun Heo                 2010-06-29  2528   * Process @work.  This function contains all the logics necessary to
a62428c0ae54a3 Tejun Heo                 2010-06-29  2529   * process a single work including synchronization against and
a62428c0ae54a3 Tejun Heo                 2010-06-29  2530   * interaction with other workers on the same cpu, queueing and
a62428c0ae54a3 Tejun Heo                 2010-06-29  2531   * flushing.  As long as context requirement is met, any worker can
a62428c0ae54a3 Tejun Heo                 2010-06-29  2532   * call this function to process a work.
a62428c0ae54a3 Tejun Heo                 2010-06-29  2533   *
a62428c0ae54a3 Tejun Heo                 2010-06-29  2534   * CONTEXT:
a9b8a985294deb Sebastian Andrzej Siewior 2020-05-27  2535   * raw_spin_lock_irq(pool->lock) which is released and regrabbed.
a62428c0ae54a3 Tejun Heo                 2010-06-29  2536   */
c34056a3fdde77 Tejun Heo                 2010-06-29  2537  static void process_one_work(struct worker *worker, struct work_struct *work)
d565ed63093003 Tejun Heo                 2013-01-24  2538  __releases(&pool->lock)
d565ed63093003 Tejun Heo                 2013-01-24  2539  __acquires(&pool->lock)
^1da177e4c3f41 Linus Torvalds            2005-04-16  2540  {
112202d9098aae Tejun Heo                 2013-02-13  2541  	struct pool_workqueue *pwq = get_work_pwq(work);
bd7bdd43dcb81b Tejun Heo                 2012-07-12  2542  	struct worker_pool *pool = worker->pool;
c4560c2c88a4c8 Lai Jiangshan             2021-08-17  2543  	unsigned long work_data;
6dc676743a7a8d Tejun Heo                 2024-02-04  2544  	int lockdep_start_depth, rcu_start_depth;
4e6045f134784f Johannes Berg             2007-10-18  2545  #ifdef CONFIG_LOCKDEP
4e6045f134784f Johannes Berg             2007-10-18  2546  	/*
a62428c0ae54a3 Tejun Heo                 2010-06-29  2547  	 * It is permissible to free the struct work_struct from
a62428c0ae54a3 Tejun Heo                 2010-06-29  2548  	 * inside the function that is called from it, this we need to
a62428c0ae54a3 Tejun Heo                 2010-06-29  2549  	 * take into account for lockdep too.  To avoid bogus "held
a62428c0ae54a3 Tejun Heo                 2010-06-29  2550  	 * lock freed" warnings as well as problems when looking into
a62428c0ae54a3 Tejun Heo                 2010-06-29  2551  	 * work->lockdep_map, make a copy and use that here.
4e6045f134784f Johannes Berg             2007-10-18  2552  	 */
4d82a1debbffec Peter Zijlstra            2012-05-15  2553  	struct lockdep_map lockdep_map;
4d82a1debbffec Peter Zijlstra            2012-05-15  2554  
4d82a1debbffec Peter Zijlstra            2012-05-15  2555  	lockdep_copy_map(&lockdep_map, &work->lockdep_map);
4e6045f134784f Johannes Berg             2007-10-18  2556  #endif
807407c0a29b1e Lai Jiangshan             2014-06-03  2557  	/* ensure we're on the correct CPU */
85327af61d4cb1 Lai Jiangshan             2014-06-03  2558  	WARN_ON_ONCE(!(pool->flags & POOL_DISASSOCIATED) &&
ec22ca5eab0bd2 Tejun Heo                 2013-01-24  2559  		     raw_smp_processor_id() != pool->cpu);
25511a47765788 Tejun Heo                 2012-07-17  2560  
8930caba3dbdd8 Tejun Heo                 2012-08-03  2561  	/* claim and dequeue */
dc186ad741c12a Thomas Gleixner           2009-11-16  2562  	debug_work_deactivate(work);
c9e7cf273fa187 Tejun Heo                 2013-01-24  2563  	hash_add(pool->busy_hash, &worker->hentry, (unsigned long)work);
c34056a3fdde77 Tejun Heo                 2010-06-29  2564  	worker->current_work = work;
a2c1c57be8d9fd Tejun Heo                 2012-12-18  2565  	worker->current_func = work->func;
112202d9098aae Tejun Heo                 2013-02-13  2566  	worker->current_pwq = pwq;
616db8779b1e3f Tejun Heo                 2023-05-17 @2567  	worker->current_at = worker->task->se.sum_exec_runtime;
c4560c2c88a4c8 Lai Jiangshan             2021-08-17  2568  	work_data = *work_data_bits(work);
d812796eb39064 Lai Jiangshan             2021-08-17  2569  	worker->current_color = get_work_color(work_data);
7a22ad757ec751 Tejun Heo                 2010-06-29  2570  
8bf895931ee3b6 Tejun Heo                 2018-05-18  2571  	/*
8bf895931ee3b6 Tejun Heo                 2018-05-18  2572  	 * Record wq name for cmdline and debug reporting, may get
8bf895931ee3b6 Tejun Heo                 2018-05-18  2573  	 * overridden through set_worker_desc().
8bf895931ee3b6 Tejun Heo                 2018-05-18  2574  	 */
8bf895931ee3b6 Tejun Heo                 2018-05-18  2575  	strscpy(worker->desc, pwq->wq->name, WORKER_DESC_LEN);
8bf895931ee3b6 Tejun Heo                 2018-05-18  2576  
a62428c0ae54a3 Tejun Heo                 2010-06-29  2577  	list_del_init(&work->entry);
a62428c0ae54a3 Tejun Heo                 2010-06-29  2578  
fb0e7beb5c1b6f Tejun Heo                 2010-06-29  2579  	/*
228f1d0018ba6b Lai Jiangshan             2014-07-22  2580  	 * CPU intensive works don't participate in concurrency management.
228f1d0018ba6b Lai Jiangshan             2014-07-22  2581  	 * They're the scheduler's responsibility.  This takes @worker out
228f1d0018ba6b Lai Jiangshan             2014-07-22  2582  	 * of concurrency management and the next code block will chain
228f1d0018ba6b Lai Jiangshan             2014-07-22  2583  	 * execution of the pending work items.
fb0e7beb5c1b6f Tejun Heo                 2010-06-29  2584  	 */
616db8779b1e3f Tejun Heo                 2023-05-17  2585  	if (unlikely(pwq->wq->flags & WQ_CPU_INTENSIVE))
228f1d0018ba6b Lai Jiangshan             2014-07-22  2586  		worker_set_flags(worker, WORKER_CPU_INTENSIVE);
fb0e7beb5c1b6f Tejun Heo                 2010-06-29  2587  
974271c485a4d8 Tejun Heo                 2012-07-12  2588  	/*
0219a3528d7214 Tejun Heo                 2023-08-07  2589  	 * Kick @pool if necessary. It's always noop for per-cpu worker pools
0219a3528d7214 Tejun Heo                 2023-08-07  2590  	 * since nr_running would always be >= 1 at this point. This is used to
0219a3528d7214 Tejun Heo                 2023-08-07  2591  	 * chain execution of the pending work items for WORKER_NOT_RUNNING
0219a3528d7214 Tejun Heo                 2023-08-07  2592  	 * workers such as the UNBOUND and CPU_INTENSIVE ones.
974271c485a4d8 Tejun Heo                 2012-07-12  2593  	 */
0219a3528d7214 Tejun Heo                 2023-08-07  2594  	kick_pool(pool);
974271c485a4d8 Tejun Heo                 2012-07-12  2595  
8930caba3dbdd8 Tejun Heo                 2012-08-03  2596  	/*
7c3eed5cd60d0f Tejun Heo                 2013-01-24  2597  	 * Record the last pool and clear PENDING which should be the last
d565ed63093003 Tejun Heo                 2013-01-24  2598  	 * update to @work.  Also, do this inside @pool->lock so that
23657bb192f14b Tejun Heo                 2012-08-13  2599  	 * PENDING and queued state changes happen together while IRQ is
23657bb192f14b Tejun Heo                 2012-08-13  2600  	 * disabled.
8930caba3dbdd8 Tejun Heo                 2012-08-03  2601  	 */
7c3eed5cd60d0f Tejun Heo                 2013-01-24  2602  	set_work_pool_and_clear_pending(work, pool->id);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2603  
fe48ba7daefe75 Mirsad Goran Todorovac    2023-08-26  2604  	pwq->stats[PWQ_STAT_STARTED]++;
a9b8a985294deb Sebastian Andrzej Siewior 2020-05-27  2605  	raw_spin_unlock_irq(&pool->lock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2606  
6dc676743a7a8d Tejun Heo                 2024-02-04  2607  	rcu_start_depth = rcu_preempt_depth();
6dc676743a7a8d Tejun Heo                 2024-02-04  2608  	lockdep_start_depth = lockdep_depth(current);
a1d14934ea4b9d Peter Zijlstra            2017-08-23  2609  	lock_map_acquire(&pwq->wq->lockdep_map);
3295f0ef9ff048 Ingo Molnar               2008-08-11  2610  	lock_map_acquire(&lockdep_map);
e6f3faa734a00c Peter Zijlstra            2017-08-23  2611  	/*
f52be5708076b7 Peter Zijlstra            2017-08-29  2612  	 * Strictly speaking we should mark the invariant state without holding
f52be5708076b7 Peter Zijlstra            2017-08-29  2613  	 * any locks, that is, before these two lock_map_acquire()'s.
e6f3faa734a00c Peter Zijlstra            2017-08-23  2614  	 *
e6f3faa734a00c Peter Zijlstra            2017-08-23  2615  	 * However, that would result in:
e6f3faa734a00c Peter Zijlstra            2017-08-23  2616  	 *
e6f3faa734a00c Peter Zijlstra            2017-08-23  2617  	 *   A(W1)
e6f3faa734a00c Peter Zijlstra            2017-08-23  2618  	 *   WFC(C)
e6f3faa734a00c Peter Zijlstra            2017-08-23  2619  	 *		A(W1)
e6f3faa734a00c Peter Zijlstra            2017-08-23  2620  	 *		C(C)
e6f3faa734a00c Peter Zijlstra            2017-08-23  2621  	 *
e6f3faa734a00c Peter Zijlstra            2017-08-23  2622  	 * Which would create W1->C->W1 dependencies, even though there is no
e6f3faa734a00c Peter Zijlstra            2017-08-23  2623  	 * actual deadlock possible. There are two solutions, using a
e6f3faa734a00c Peter Zijlstra            2017-08-23  2624  	 * read-recursive acquire on the work(queue) 'locks', but this will then
f52be5708076b7 Peter Zijlstra            2017-08-29  2625  	 * hit the lockdep limitation on recursive locks, or simply discard
e6f3faa734a00c Peter Zijlstra            2017-08-23  2626  	 * these locks.
e6f3faa734a00c Peter Zijlstra            2017-08-23  2627  	 *
e6f3faa734a00c Peter Zijlstra            2017-08-23  2628  	 * AFAICT there is no possible deadlock scenario between the
e6f3faa734a00c Peter Zijlstra            2017-08-23  2629  	 * flush_work() and complete() primitives (except for single-threaded
e6f3faa734a00c Peter Zijlstra            2017-08-23  2630  	 * workqueues), so hiding them isn't a problem.
e6f3faa734a00c Peter Zijlstra            2017-08-23  2631  	 */
f52be5708076b7 Peter Zijlstra            2017-08-29  2632  	lockdep_invariant_state(true);
e36c886a0f9d62 Arjan van de Ven          2010-08-21  2633  	trace_workqueue_execute_start(work);
a2c1c57be8d9fd Tejun Heo                 2012-12-18  2634  	worker->current_func(work);
e36c886a0f9d62 Arjan van de Ven          2010-08-21  2635  	/*
e36c886a0f9d62 Arjan van de Ven          2010-08-21  2636  	 * While we must be careful to not use "work" after this, the trace
e36c886a0f9d62 Arjan van de Ven          2010-08-21  2637  	 * point will only record its address.
e36c886a0f9d62 Arjan van de Ven          2010-08-21  2638  	 */
1c5da0ec7f20df Daniel Jordan             2020-01-13  2639  	trace_workqueue_execute_end(work, worker->current_func);
725e8ec59c56c6 Tejun Heo                 2023-05-17  2640  	pwq->stats[PWQ_STAT_COMPLETED]++;
3295f0ef9ff048 Ingo Molnar               2008-08-11  2641  	lock_map_release(&lockdep_map);
112202d9098aae Tejun Heo                 2013-02-13  2642  	lock_map_release(&pwq->wq->lockdep_map);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2643  
6dc676743a7a8d Tejun Heo                 2024-02-04 @2644  	if (unlikely((worker->task && in_atomic()) ||
6dc676743a7a8d Tejun Heo                 2024-02-04  2645  		     lockdep_depth(current) != lockdep_start_depth ||
6dc676743a7a8d Tejun Heo                 2024-02-04  2646  		     rcu_preempt_depth() != rcu_start_depth)) {
6dc676743a7a8d Tejun Heo                 2024-02-04  2647  		pr_err("BUG: workqueue leaked atomic, lock or RCU: %s[%d]\n"
6dc676743a7a8d Tejun Heo                 2024-02-04  2648  		       "     preempt=0x%08x lock=%d->%d RCU=%d->%d workfn=%ps\n",
6dc676743a7a8d Tejun Heo                 2024-02-04  2649  		       current->comm, task_pid_nr(current), preempt_count(),
6dc676743a7a8d Tejun Heo                 2024-02-04  2650  		       lockdep_start_depth, lockdep_depth(current),
6dc676743a7a8d Tejun Heo                 2024-02-04  2651  		       rcu_start_depth, rcu_preempt_depth(),
6dc676743a7a8d Tejun Heo                 2024-02-04  2652  		       worker->current_func);
d5abe669172f20 Peter Zijlstra            2006-12-06  2653  		debug_show_held_locks(current);
d5abe669172f20 Peter Zijlstra            2006-12-06  2654  		dump_stack();
d5abe669172f20 Peter Zijlstra            2006-12-06  2655  	}
d5abe669172f20 Peter Zijlstra            2006-12-06  2656  
b22ce2785d9742 Tejun Heo                 2013-08-28  2657  	/*
025f50f3866486 Sebastian Andrzej Siewior 2019-10-15  2658  	 * The following prevents a kworker from hogging CPU on !PREEMPTION
b22ce2785d9742 Tejun Heo                 2013-08-28  2659  	 * kernels, where a requeueing work item waiting for something to
b22ce2785d9742 Tejun Heo                 2013-08-28  2660  	 * happen could deadlock with stop_machine as such work item could
b22ce2785d9742 Tejun Heo                 2013-08-28  2661  	 * indefinitely requeue itself while all other CPUs are trapped in
789cbbeca4eb71 Joe Lawrence              2014-10-05  2662  	 * stop_machine. At the same time, report a quiescent RCU state so
789cbbeca4eb71 Joe Lawrence              2014-10-05  2663  	 * the same condition doesn't freeze RCU.
b22ce2785d9742 Tejun Heo                 2013-08-28  2664  	 */
a7e6425ea58169 Paul E. McKenney          2017-10-24  2665  	cond_resched();
b22ce2785d9742 Tejun Heo                 2013-08-28  2666  
a9b8a985294deb Sebastian Andrzej Siewior 2020-05-27  2667  	raw_spin_lock_irq(&pool->lock);
a62428c0ae54a3 Tejun Heo                 2010-06-29  2668  
616db8779b1e3f Tejun Heo                 2023-05-17  2669  	/*
616db8779b1e3f Tejun Heo                 2023-05-17  2670  	 * In addition to %WQ_CPU_INTENSIVE, @worker may also have been marked
616db8779b1e3f Tejun Heo                 2023-05-17  2671  	 * CPU intensive by wq_worker_tick() if @work hogged CPU longer than
616db8779b1e3f Tejun Heo                 2023-05-17  2672  	 * wq_cpu_intensive_thresh_us. Clear it.
616db8779b1e3f Tejun Heo                 2023-05-17  2673  	 */
fb0e7beb5c1b6f Tejun Heo                 2010-06-29  2674  	worker_clr_flags(worker, WORKER_CPU_INTENSIVE);
fb0e7beb5c1b6f Tejun Heo                 2010-06-29  2675  
1b69ac6b40ebd8 Johannes Weiner           2019-02-01  2676  	/* tag the worker for identification in schedule() */
1b69ac6b40ebd8 Johannes Weiner           2019-02-01  2677  	worker->last_func = worker->current_func;
1b69ac6b40ebd8 Johannes Weiner           2019-02-01  2678  
a62428c0ae54a3 Tejun Heo                 2010-06-29  2679  	/* we're done with it, release */
42f8570f437b65 Sasha Levin               2012-12-17  2680  	hash_del(&worker->hentry);
c34056a3fdde77 Tejun Heo                 2010-06-29  2681  	worker->current_work = NULL;
a2c1c57be8d9fd Tejun Heo                 2012-12-18  2682  	worker->current_func = NULL;
112202d9098aae Tejun Heo                 2013-02-13  2683  	worker->current_pwq = NULL;
d812796eb39064 Lai Jiangshan             2021-08-17  2684  	worker->current_color = INT_MAX;
c4560c2c88a4c8 Lai Jiangshan             2021-08-17  2685  	pwq_dec_nr_in_flight(pwq, work_data);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2686  }
a62428c0ae54a3 Tejun Heo                 2010-06-29  2687  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
