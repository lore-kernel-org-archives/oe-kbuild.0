Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982C927874F
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 12:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768738410; cv=none; b=rKVgNXYub1Sld59oHdQr2s2JAfLq6A+JKcFNn5J3EUXXgWcIjMnZyuwzxnb1RPneihL2kpO+AoSOeLrvMATnNSbx330VJK4JGOkJySXb6Qhe7zDfDy+mEROgMY7p3JllpuID+5bVjDFiACMjJ5YJyMa1k24XMNNTf2t24h/eocE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768738410; c=relaxed/simple;
	bh=81inlu39WRiqkFmD/RzaUNgmYqe9T+DCK1sptuiH/0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IsfGyfDJAW3ti9K8YI7TUG2Y9F/lLHD4ejGNJ72nx4U635UJusSdcX7svq5e64AdRQdfiWiY3LFnEC9QQdM0LKvhXjTTz/A7nquIUmLChnDn1MNH0nFKWbrL4zfF4BoKYd+hwj5zgW7t/VcN9k84NGz/D84ZxGCeDYXT9Kygcgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t/6uCiyJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t/6uCiyJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801d1daf53so21476285e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 04:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768738407; x=1769343207; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6FBFi9bObcM6IuIKAwe383oQSfYg+3/6KJuY+702zMY=;
        b=t/6uCiyJqUhH6X9tovPWAdFhyFIkdFyDKza0kIkPM264H4TZ0nul+81+a5tGJ5hoHz
         amTBSAjhoSzAkSx24iQqIN8EJ3TE/94wZXw8fl5FOh240fUidZqLeb6KmeES33OfQUxL
         RwXnHF1qTsbTXm+k2Jpd4UpEkfRZdbYhigxptk2VrMAvCL53hYDBeRha7qk6GXsZ7wz0
         PO0YBtbbyqIVV1kbdVgau+DousUEXnFpLh/m1b2dSlPr6m70cOKjDFyHkQjz9CKRQFkH
         VCZwI6gRsiwR03UYHkmDeNu/+PpUTmGEJIQggkLpURnzxPYPnsG2MyHM1rP/EHLEkP8V
         eGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768738407; x=1769343207;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FBFi9bObcM6IuIKAwe383oQSfYg+3/6KJuY+702zMY=;
        b=sPrVttc+3XEguAsA3QKrki1qK+MYhTuHPlVrHurDFlJs1Yv4YT/QdKzZvB+zXDJX9l
         O/HhpUb0LSdPgc4ULYT3v3qGI3ERoEBCVk+iZix8/nMqNGAwXtI4MbBxYhqYOK/WS2XQ
         5e4cwU6Qp3OA9i9lef0o8xunrLQhzXBMlfNOh4rmPi0csOp0obwtEVjOXJF+tDQejk27
         00qMLnK0Cfq2eqYsdLpGTEfl9HlCpO7ldOYRaBX6kMmre2NwxKBRlrYEjsDCni60ZuBi
         u/RDBJbDtMCGaTCUPQ34IDsTZTp6rh067dYNqCrbtT6gTwgMOq+Qn045CzSnTfwyw4R0
         yHkA==
X-Gm-Message-State: AOJu0Yz791bNestfdz+dF0O677fcICLZUdNbyVzbgckGTpz9Mbz4XTPZ
	z/7R6CsUX86E7rGJayDOaTC0U7Xp8CX+fG2mHPW8bNMaF4KqukQHnWgXNsE+21B6oXOjoCrhPQ8
	suooe
X-Gm-Gg: AY/fxX6/Jw498bP5PFZusetAsQQH+gUBHUbgb1vaO3wsa+EDG+zFx1BAUjTAefBq5xF
	Uj22CFYXpfezNK1ewOp5VSQ3SrP5Jo9d/0+imTwtjsIs65l1RLoCgIxeUTJrdMg2/806fDMAuHh
	o7POpockCUwpSPBSAKXEvVrZSfn38XsYytxNZdb47sDlL1GM7Lg61TsyzxGcnIjcv6Q1zUvAdjf
	6hecuGFEE806z2qv9CpKH38RRaBWOGPx9c3SlhIbPQBo3V0nmoW/fWyxYYwRLt/JjZgXOrRNvWe
	2Jbx7woDEBPrLA24MhHeHNSsPme+UIQlJuIi48ULwvU3uRB+DyA43Ed0QUd8D/PB9tXwg+U3zbt
	ngjwQ9D2ax9RQOEoRz8htfd60O+kkZLZSIb0DR6Giy3xwXROlqBLUmiYtIVIdZg2hAzDplxmEIr
	A6v05QleGUAfo811rZOpoCq4v9TQ4=
X-Received: by 2002:a05:600c:6994:b0:47d:3690:7490 with SMTP id 5b1f17b1804b1-4801e2fd5c9mr86813935e9.9.1768738406800;
        Sun, 18 Jan 2026 04:13:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm194796255e9.12.2026.01.18.04.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:13:26 -0800 (PST)
Date: Sun, 18 Jan 2026 15:13:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/4] kernel/workqueue.c:2644
 process_one_work() warn: variable dereferenced before check 'worker->task'
 (see line 2567)
Message-ID: <202601161425.T56neBEJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260118121323.lEXgux1s4ucEiKj6CxbGeYFYxyt69FrnNpoxbg4cotk@z>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a58a97026588e9128868c7778ca1ffacbb53c931
commit: 6dc676743a7a8d292b2cc39016ba8f92d4c0ef49 [4/4] workqueue: Update lock debugging code
config: i386-randconfig-141-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161425.T56neBEJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601161425.T56neBEJ-lkp@intel.com/

smatch warnings:
kernel/workqueue.c:2644 process_one_work() warn: variable dereferenced before check 'worker->task' (see line 2567)

vim +2644 kernel/workqueue.c

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
                                                                                     ^^^^^^^^^^^^
Dereferenced.

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
                                                                              ^^^^^^^^^^^^
Checked too late.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

