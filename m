Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71371C08
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Jan 2023 16:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673799659; x=1705335659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EGTBWjpfiIYl4i+zsSctrPAc760I0Jkna8d7LX0Hmfo=;
  b=M7llc0DnnGZiM+1Iwybx9lMN0y9CJUXovOMRKHevyKg1r7PP/lAcnoeM
   heFStB7wa2WTaGKUbgnpGV9E3wSv9RPmh4JnZCCKK1kOgfsPaAu62Wr6U
   SwF2LLvGWYLBg2mzhcL4c/jYQlzCm4iVdS/U6isqshSSGB8ZMlCCLSe84
   mHz+COHeDPVgPuPfhnGZglwubs9XfaFbZhZoQFMUj/swvEjJ06MWN/KJh
   9HtmXDygfD6qTE2yt2lXPekoykMMlukXCI9tQZSZDQv3mmnbjLCh/IFHU
   qoIcZzmq1fbxnFmUSn9hhPn62P1ArLLWufoj8wFIRrqfo1nQSZoBOugoM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="351545260"
X-IronPort-AV: E=Sophos;i="5.97,219,1669104000"; 
   d="scan'208";a="351545260"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2023 08:20:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="766624093"
X-IronPort-AV: E=Sophos;i="5.97,219,1669104000"; 
   d="scan'208";a="766624093"
Received: from lkp-server01.sh.intel.com (HELO 82361ecceba2) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jan 2023 08:20:57 -0800
Received: from kbuild by 82361ecceba2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pH5ke-0000Om-1v;
	Sun, 15 Jan 2023 16:20:56 +0000
Date: Mon, 16 Jan 2023 00:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.01.12a 44/53]
 kernel/locking/qspinlock.c:386:7: warning: Local variable 'val' shadows
 outer argument [shadowArgument]
Message-ID: <202301160002.wdKhIk6s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/locking/qspinlock.c:386:7: warning: Local variable 'val' shadows outer argument [shadowArgument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.01.12a
head:   f7bc7c9aba2d47ec051aabb0aaecb5613422aa07
commit: b9c0ca4c0d3845012af003a6a8cb3dded45bb736 [44/53] qspinlock: Diagnostics for excessive lock-drop wait loop time
:::::: branch date: 23 hours ago
:::::: commit date: 3 days ago
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b9c0ca4c0d3845012af003a6a8cb3dded45bb736
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/locking/qspinlock.c:386:7: warning: Local variable 'val' shadows outer argument [shadowArgument]
     int val;
         ^
   kernel/locking/qspinlock.c:316:71: note: Shadowed declaration
   void __lockfunc queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
                                                                         ^
   kernel/locking/qspinlock.c:386:7: note: Shadow variable
     int val;
         ^
>> kernel/time/clocksource.c:719:56: warning: Parameter 'cs' can be declared as pointer to const [constParameter]
   static bool clocksource_is_suspend(struct clocksource *cs)
                                                          ^

vim +/val +386 kernel/locking/qspinlock.c

2aa79af6426319 Peter Zijlstra (Intel  2015-04-24  329) 
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  330) 	/*
6512276d97b160 Will Deacon            2018-04-26  331  	 * Wait for in-progress pending->locked hand-overs with a bounded
6512276d97b160 Will Deacon            2018-04-26  332  	 * number of spins so that we guarantee forward progress.
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  333) 	 *
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  334) 	 * 0,1,0 -> 0,0,1
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  335) 	 */
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  336) 	if (val == _Q_PENDING_VAL) {
6512276d97b160 Will Deacon            2018-04-26  337  		int cnt = _Q_PENDING_LOOPS;
6512276d97b160 Will Deacon            2018-04-26  338  		val = atomic_cond_read_relaxed(&lock->val,
6512276d97b160 Will Deacon            2018-04-26  339  					       (VAL != _Q_PENDING_VAL) || !cnt--);
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  340) 	}
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  341) 
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  342) 	/*
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  343) 	 * If we observe any contention; queue.
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  344) 	 */
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  345) 	if (val & ~_Q_LOCKED_MASK)
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  346) 		goto queue;
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  347) 
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  348) 	/*
59fb586b4a07b4 Will Deacon            2018-04-26  349  	 * trylock || pending
59fb586b4a07b4 Will Deacon            2018-04-26  350  	 *
756b1df4c2c82a Peter Zijlstra         2018-09-26  351  	 * 0,0,* -> 0,1,* -> 0,0,1 pending, trylock
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  352) 	 */
7aa54be2976550 Peter Zijlstra         2018-09-26  353  	val = queued_fetch_set_pending_acquire(lock);
756b1df4c2c82a Peter Zijlstra         2018-09-26  354  
53bf57fab7321f Peter Zijlstra         2018-09-26  355  	/*
756b1df4c2c82a Peter Zijlstra         2018-09-26  356  	 * If we observe contention, there is a concurrent locker.
756b1df4c2c82a Peter Zijlstra         2018-09-26  357  	 *
756b1df4c2c82a Peter Zijlstra         2018-09-26  358  	 * Undo and queue; our setting of PENDING might have made the
756b1df4c2c82a Peter Zijlstra         2018-09-26  359  	 * n,0,0 -> 0,0,0 transition fail and it will now be waiting
756b1df4c2c82a Peter Zijlstra         2018-09-26  360  	 * on @next to become !NULL.
53bf57fab7321f Peter Zijlstra         2018-09-26  361  	 */
53bf57fab7321f Peter Zijlstra         2018-09-26  362  	if (unlikely(val & ~_Q_LOCKED_MASK)) {
756b1df4c2c82a Peter Zijlstra         2018-09-26  363  
756b1df4c2c82a Peter Zijlstra         2018-09-26  364  		/* Undo PENDING if we set it. */
53bf57fab7321f Peter Zijlstra         2018-09-26  365  		if (!(val & _Q_PENDING_MASK))
53bf57fab7321f Peter Zijlstra         2018-09-26  366  			clear_pending(lock);
756b1df4c2c82a Peter Zijlstra         2018-09-26  367  
53bf57fab7321f Peter Zijlstra         2018-09-26  368  		goto queue;
53bf57fab7321f Peter Zijlstra         2018-09-26  369  	}
53bf57fab7321f Peter Zijlstra         2018-09-26  370  
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  371) 	/*
59fb586b4a07b4 Will Deacon            2018-04-26  372  	 * We're pending, wait for the owner to go away.
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  373) 	 *
53bf57fab7321f Peter Zijlstra         2018-09-26  374  	 * 0,1,1 -> 0,1,0
69f9cae90907e0 Peter Zijlstra (Intel  2015-04-24  375) 	 *
69f9cae90907e0 Peter Zijlstra (Intel  2015-04-24  376) 	 * this wait loop must be a load-acquire such that we match the
69f9cae90907e0 Peter Zijlstra (Intel  2015-04-24  377) 	 * store-release that clears the locked bit and create lock
59fb586b4a07b4 Will Deacon            2018-04-26  378  	 * sequentiality; this is because not all
59fb586b4a07b4 Will Deacon            2018-04-26  379  	 * clear_pending_set_locked() implementations imply full
59fb586b4a07b4 Will Deacon            2018-04-26  380  	 * barriers.
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  381) 	 */
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  382  	if (val & _Q_LOCKED_MASK) {
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  383  		int cnt = _Q_PENDING_LOOPS;
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  384  		unsigned long j = jiffies + 10 * HZ;
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  385  		struct qspinlock qval;
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11 @386  		int val;
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  387  
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  388  		for (;;) {
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  389  			val = atomic_read_acquire(&lock->val);
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  390  			atomic_set(&qval.val, val);
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  391  			WARN_ON_ONCE(!(val & _Q_PENDING_VAL));
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  392  			if (!(val & _Q_LOCKED_MASK))
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  393  				break;
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  394  			if (!--cnt && !WARN(time_after(jiffies, j), "%s: Still pending and locked: %#x (%c%c%#x)\n", __func__, val, ".L"[!!qval.locked], ".P"[!!qval.pending], qval.tail))
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  395  				cnt = _Q_PENDING_LOOPS;
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  396  		}
b9c0ca4c0d3845 Paul E. McKenney       2023-01-11  397  	}
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  398) 
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  399) 	/*
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  400) 	 * take ownership and clear the pending bit.
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  401) 	 *
53bf57fab7321f Peter Zijlstra         2018-09-26  402  	 * 0,1,0 -> 0,0,1
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  403) 	 */
6403bd7d0ea187 Waiman Long            2015-04-24  404  	clear_pending_set_locked(lock);
ad53fa10fa9e81 Waiman Long            2019-04-04  405  	lockevent_inc(lock_pending);
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  406) 	return;
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  407) 
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  408) 	/*
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  409) 	 * End of pending bit optimistic spinning and beginning of MCS
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  410) 	 * queuing.
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  411) 	 */
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  412) queue:
ad53fa10fa9e81 Waiman Long            2019-04-04  413  	lockevent_inc(lock_slowpath);
81d3dc9a349b1e Waiman Long            2018-04-26  414  pv_queue:
0fa809ca7f81c4 Waiman Long            2018-10-16  415  	node = this_cpu_ptr(&qnodes[0].mcs);
a33fda35e3a765 Waiman Long            2015-04-24  416  	idx = node->count++;
a33fda35e3a765 Waiman Long            2015-04-24  417  	tail = encode_tail(smp_processor_id(), idx);
a33fda35e3a765 Waiman Long            2015-04-24  418  
ee042be16cb455 Namhyung Kim           2022-03-22  419  	trace_contention_begin(lock, LCB_F_SPIN);
ee042be16cb455 Namhyung Kim           2022-03-22  420  
d682b596d99345 Waiman Long            2019-01-29  421  	/*
d682b596d99345 Waiman Long            2019-01-29  422  	 * 4 nodes are allocated based on the assumption that there will
d682b596d99345 Waiman Long            2019-01-29  423  	 * not be nested NMIs taking spinlocks. That may not be true in
d682b596d99345 Waiman Long            2019-01-29  424  	 * some architectures even though the chance of needing more than
d682b596d99345 Waiman Long            2019-01-29  425  	 * 4 nodes will still be extremely unlikely. When that happens,
d682b596d99345 Waiman Long            2019-01-29  426  	 * we fall back to spinning on the lock directly without using
d682b596d99345 Waiman Long            2019-01-29  427  	 * any MCS node. This is not the most elegant solution, but is
d682b596d99345 Waiman Long            2019-01-29  428  	 * simple enough.
d682b596d99345 Waiman Long            2019-01-29  429  	 */
d682b596d99345 Waiman Long            2019-01-29  430  	if (unlikely(idx >= MAX_NODES)) {
ad53fa10fa9e81 Waiman Long            2019-04-04  431  		lockevent_inc(lock_no_node);
d682b596d99345 Waiman Long            2019-01-29  432  		while (!queued_spin_trylock(lock))
d682b596d99345 Waiman Long            2019-01-29  433  			cpu_relax();
d682b596d99345 Waiman Long            2019-01-29  434  		goto release;
d682b596d99345 Waiman Long            2019-01-29  435  	}
d682b596d99345 Waiman Long            2019-01-29  436  
0fa809ca7f81c4 Waiman Long            2018-10-16  437  	node = grab_mcs_node(node, idx);
11dc13224c975e Will Deacon            2018-02-13  438  
1222109a53637f Waiman Long            2018-10-16  439  	/*
1222109a53637f Waiman Long            2018-10-16  440  	 * Keep counts of non-zero index values:
1222109a53637f Waiman Long            2018-10-16  441  	 */
ad53fa10fa9e81 Waiman Long            2019-04-04  442  	lockevent_cond_inc(lock_use_node2 + idx - 1, idx);
1222109a53637f Waiman Long            2018-10-16  443  
11dc13224c975e Will Deacon            2018-02-13  444  	/*
11dc13224c975e Will Deacon            2018-02-13  445  	 * Ensure that we increment the head node->count before initialising
11dc13224c975e Will Deacon            2018-02-13  446  	 * the actual node. If the compiler is kind enough to reorder these
11dc13224c975e Will Deacon            2018-02-13  447  	 * stores, then an IRQ could overwrite our assignments.
11dc13224c975e Will Deacon            2018-02-13  448  	 */
11dc13224c975e Will Deacon            2018-02-13  449  	barrier();
11dc13224c975e Will Deacon            2018-02-13  450  
a33fda35e3a765 Waiman Long            2015-04-24  451  	node->locked = 0;
a33fda35e3a765 Waiman Long            2015-04-24  452  	node->next = NULL;
a23db284fe0d18 Waiman Long            2015-04-24  453  	pv_init_node(node);
a33fda35e3a765 Waiman Long            2015-04-24  454  
a33fda35e3a765 Waiman Long            2015-04-24  455  	/*
6403bd7d0ea187 Waiman Long            2015-04-24  456  	 * We touched a (possibly) cold cacheline in the per-cpu queue node;
6403bd7d0ea187 Waiman Long            2015-04-24  457  	 * attempt the trylock once more in the hope someone let go while we
6403bd7d0ea187 Waiman Long            2015-04-24  458  	 * weren't watching.
a33fda35e3a765 Waiman Long            2015-04-24  459  	 */
6403bd7d0ea187 Waiman Long            2015-04-24  460  	if (queued_spin_trylock(lock))
6403bd7d0ea187 Waiman Long            2015-04-24  461  		goto release;
a33fda35e3a765 Waiman Long            2015-04-24  462  
a33fda35e3a765 Waiman Long            2015-04-24  463  	/*
9d4646d14d51d6 Will Deacon            2018-04-26  464  	 * Ensure that the initialisation of @node is complete before we
9d4646d14d51d6 Will Deacon            2018-04-26  465  	 * publish the updated tail via xchg_tail() and potentially link
9d4646d14d51d6 Will Deacon            2018-04-26  466  	 * @node into the waitqueue via WRITE_ONCE(prev->next, node) below.
9d4646d14d51d6 Will Deacon            2018-04-26  467  	 */
9d4646d14d51d6 Will Deacon            2018-04-26  468  	smp_wmb();
9d4646d14d51d6 Will Deacon            2018-04-26  469  
9d4646d14d51d6 Will Deacon            2018-04-26  470  	/*
9d4646d14d51d6 Will Deacon            2018-04-26  471  	 * Publish the updated tail.
6403bd7d0ea187 Waiman Long            2015-04-24  472  	 * We have already touched the queueing cacheline; don't bother with
6403bd7d0ea187 Waiman Long            2015-04-24  473  	 * pending stuff.
6403bd7d0ea187 Waiman Long            2015-04-24  474  	 *
6403bd7d0ea187 Waiman Long            2015-04-24  475  	 * p,*,* -> n,*,*
a33fda35e3a765 Waiman Long            2015-04-24  476  	 */
6403bd7d0ea187 Waiman Long            2015-04-24  477  	old = xchg_tail(lock, tail);
aa68744f80bfb6 Waiman Long            2015-11-09  478  	next = NULL;
a33fda35e3a765 Waiman Long            2015-04-24  479  
a33fda35e3a765 Waiman Long            2015-04-24  480  	/*
a33fda35e3a765 Waiman Long            2015-04-24  481  	 * if there was a previous node; link it and wait until reaching the
a33fda35e3a765 Waiman Long            2015-04-24  482  	 * head of the waitqueue.
a33fda35e3a765 Waiman Long            2015-04-24  483  	 */
6403bd7d0ea187 Waiman Long            2015-04-24  484  	if (old & _Q_TAIL_MASK) {
a33fda35e3a765 Waiman Long            2015-04-24  485  		prev = decode_tail(old);
95bcade33a8af3 Will Deacon            2018-02-13  486  
9d4646d14d51d6 Will Deacon            2018-04-26  487  		/* Link @node into the waitqueue. */
9d4646d14d51d6 Will Deacon            2018-04-26  488  		WRITE_ONCE(prev->next, node);
a33fda35e3a765 Waiman Long            2015-04-24  489  
cd0272fab78507 Waiman Long            2015-11-09  490  		pv_wait_node(node, prev);
a33fda35e3a765 Waiman Long            2015-04-24  491  		arch_mcs_spin_lock_contended(&node->locked);
81b5598665a240 Waiman Long            2015-11-09  492  
81b5598665a240 Waiman Long            2015-11-09  493  		/*
81b5598665a240 Waiman Long            2015-11-09  494  		 * While waiting for the MCS lock, the next pointer may have
81b5598665a240 Waiman Long            2015-11-09  495  		 * been set by another lock waiter. We optimistically load
81b5598665a240 Waiman Long            2015-11-09  496  		 * the next pointer & prefetch the cacheline for writing
81b5598665a240 Waiman Long            2015-11-09  497  		 * to reduce latency in the upcoming MCS unlock operation.
81b5598665a240 Waiman Long            2015-11-09  498  		 */
81b5598665a240 Waiman Long            2015-11-09  499  		next = READ_ONCE(node->next);
81b5598665a240 Waiman Long            2015-11-09  500  		if (next)
81b5598665a240 Waiman Long            2015-11-09  501  			prefetchw(next);
a33fda35e3a765 Waiman Long            2015-04-24  502  	}
a33fda35e3a765 Waiman Long            2015-04-24  503  
a33fda35e3a765 Waiman Long            2015-04-24  504  	/*
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  505) 	 * we're at the head of the waitqueue, wait for the owner & pending to
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  506) 	 * go away.
a33fda35e3a765 Waiman Long            2015-04-24  507  	 *
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  508) 	 * *,x,y -> *,0,0
2c83e8e9492dc8 Waiman Long            2015-04-24  509  	 *
2c83e8e9492dc8 Waiman Long            2015-04-24  510  	 * this wait loop must use a load-acquire such that we match the
2c83e8e9492dc8 Waiman Long            2015-04-24  511  	 * store-release that clears the locked bit and create lock
2c83e8e9492dc8 Waiman Long            2015-04-24  512  	 * sequentiality; this is because the set_locked() function below
2c83e8e9492dc8 Waiman Long            2015-04-24  513  	 * does not imply a full barrier.
2c83e8e9492dc8 Waiman Long            2015-04-24  514  	 *
1c4941fd53afb4 Waiman Long            2015-11-10  515  	 * The PV pv_wait_head_or_lock function, if active, will acquire
1c4941fd53afb4 Waiman Long            2015-11-10  516  	 * the lock and return a non-zero value. So we have to skip the
f9c811fac48cfb Will Deacon            2018-04-26  517  	 * atomic_cond_read_acquire() call. As the next PV queue head hasn't
f9c811fac48cfb Will Deacon            2018-04-26  518  	 * been designated yet, there is no way for the locked value to become
1c4941fd53afb4 Waiman Long            2015-11-10  519  	 * _Q_SLOW_VAL. So both the set_locked() and the
1c4941fd53afb4 Waiman Long            2015-11-10  520  	 * atomic_cmpxchg_relaxed() calls will be safe.
1c4941fd53afb4 Waiman Long            2015-11-10  521  	 *
1c4941fd53afb4 Waiman Long            2015-11-10  522  	 * If PV isn't active, 0 will be returned instead.
1c4941fd53afb4 Waiman Long            2015-11-10  523  	 *
a33fda35e3a765 Waiman Long            2015-04-24  524  	 */
1c4941fd53afb4 Waiman Long            2015-11-10  525  	if ((val = pv_wait_head_or_lock(lock, node)))
1c4941fd53afb4 Waiman Long            2015-11-10  526  		goto locked;
1c4941fd53afb4 Waiman Long            2015-11-10  527  
f9c811fac48cfb Will Deacon            2018-04-26  528  	val = atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK));
a33fda35e3a765 Waiman Long            2015-04-24  529  
1c4941fd53afb4 Waiman Long            2015-11-10  530  locked:
a33fda35e3a765 Waiman Long            2015-04-24  531  	/*
a33fda35e3a765 Waiman Long            2015-04-24  532  	 * claim the lock:
a33fda35e3a765 Waiman Long            2015-04-24  533  	 *
c1fb159db9f2e5 Peter Zijlstra (Intel  2015-04-24  534) 	 * n,0,0 -> 0,0,1 : lock, uncontended
59fb586b4a07b4 Will Deacon            2018-04-26  535  	 * *,*,0 -> *,*,1 : lock, contended
2c83e8e9492dc8 Waiman Long            2015-04-24  536  	 *
59fb586b4a07b4 Will Deacon            2018-04-26  537  	 * If the queue head is the only one in the queue (lock value == tail)
59fb586b4a07b4 Will Deacon            2018-04-26  538  	 * and nobody is pending, clear the tail code and grab the lock.
59fb586b4a07b4 Will Deacon            2018-04-26  539  	 * Otherwise, we only need to grab the lock.
a33fda35e3a765 Waiman Long            2015-04-24  540  	 */
c61da58d8a9ba9 Will Deacon            2018-04-26  541  
64d816cba06c67 Waiman Long            2015-11-09  542  	/*
756b1df4c2c82a Peter Zijlstra         2018-09-26  543  	 * In the PV case we might already have _Q_LOCKED_VAL set, because
756b1df4c2c82a Peter Zijlstra         2018-09-26  544  	 * of lock stealing; therefore we must also allow:
ae75d9089ff709 Will Deacon            2018-04-26  545  	 *
756b1df4c2c82a Peter Zijlstra         2018-09-26  546  	 * n,0,1 -> 0,0,1
756b1df4c2c82a Peter Zijlstra         2018-09-26  547  	 *
756b1df4c2c82a Peter Zijlstra         2018-09-26  548  	 * Note: at this point: (val & _Q_PENDING_MASK) == 0, because of the
756b1df4c2c82a Peter Zijlstra         2018-09-26  549  	 *       above wait condition, therefore any concurrent setting of
756b1df4c2c82a Peter Zijlstra         2018-09-26  550  	 *       PENDING will make the uncontended transition fail.
64d816cba06c67 Waiman Long            2015-11-09  551  	 */
756b1df4c2c82a Peter Zijlstra         2018-09-26  552  	if ((val & _Q_TAIL_MASK) == tail) {
756b1df4c2c82a Peter Zijlstra         2018-09-26  553  		if (atomic_try_cmpxchg_relaxed(&lock->val, &val, _Q_LOCKED_VAL))
2c83e8e9492dc8 Waiman Long            2015-04-24  554  			goto release; /* No contention */
756b1df4c2c82a Peter Zijlstra         2018-09-26  555  	}
a33fda35e3a765 Waiman Long            2015-04-24  556  
756b1df4c2c82a Peter Zijlstra         2018-09-26  557  	/*
756b1df4c2c82a Peter Zijlstra         2018-09-26  558  	 * Either somebody is queued behind us or _Q_PENDING_VAL got set
756b1df4c2c82a Peter Zijlstra         2018-09-26  559  	 * which will then detect the remaining tail and queue behind us
756b1df4c2c82a Peter Zijlstra         2018-09-26  560  	 * ensuring we'll see a @next.
756b1df4c2c82a Peter Zijlstra         2018-09-26  561  	 */
c61da58d8a9ba9 Will Deacon            2018-04-26  562  	set_locked(lock);
c61da58d8a9ba9 Will Deacon            2018-04-26  563  
a33fda35e3a765 Waiman Long            2015-04-24  564  	/*
aa68744f80bfb6 Waiman Long            2015-11-09  565  	 * contended path; wait for next if not observed yet, release.
a33fda35e3a765 Waiman Long            2015-04-24  566  	 */
c131a198c497db Will Deacon            2018-04-26  567  	if (!next)
c131a198c497db Will Deacon            2018-04-26  568  		next = smp_cond_load_relaxed(&node->next, (VAL));
a33fda35e3a765 Waiman Long            2015-04-24  569  
a33fda35e3a765 Waiman Long            2015-04-24  570  	arch_mcs_spin_unlock_contended(&next->locked);
75d2270280686b Waiman Long            2015-07-11  571  	pv_kick_node(lock, next);
a33fda35e3a765 Waiman Long            2015-04-24  572  
a33fda35e3a765 Waiman Long            2015-04-24  573  release:
ee042be16cb455 Namhyung Kim           2022-03-22  574  	trace_contention_end(lock, 0);
ee042be16cb455 Namhyung Kim           2022-03-22  575  
a33fda35e3a765 Waiman Long            2015-04-24  576  	/*
a33fda35e3a765 Waiman Long            2015-04-24  577  	 * release the node
a33fda35e3a765 Waiman Long            2015-04-24  578  	 */
0fa809ca7f81c4 Waiman Long            2018-10-16  579  	__this_cpu_dec(qnodes[0].mcs.count);
a33fda35e3a765 Waiman Long            2015-04-24  580  }
a33fda35e3a765 Waiman Long            2015-04-24  581  EXPORT_SYMBOL(queued_spin_lock_slowpath);
a23db284fe0d18 Waiman Long            2015-04-24  582  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
