Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F51B3750C4
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 03:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534069; cv=none; b=n06t1k0nouUP002XGnumOB+GBPYZQSovkSVSrzqqwai3i4PpxpfcHxt4qmOxegAFEJltZf5HTx2n8wD27hiYhDD0gYDxrdCNRKSPm6UDFttGFirzMgs0LKfcdK/cGdug6zU60LLOJhreNy12tkBI/QgSHJsAib7zTgG3lia7M+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534069; c=relaxed/simple;
	bh=nk/xhZSYEVgZsVB9V5l2gZ1XRQkdq7snkfpTsXLGvS0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WyyaDZphY8sl2+eDifkA3lBuYJwFFJ7x0hyIEdDGZcaNJyV6aTvkuZfSUoiGASAM2yTfp2qNzZrT06ClSlrf6PSHtrO7SCdmD3fN1Nq5pNmVgUiTRFH5MNvS8uHSu9q/WYvSzdFQq//aFHGE52KRt9YCC0Et3gwlejL3UGa6sq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UeOHQSbH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UeOHQSbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534069; x=1807070069;
  h=date:from:to:cc:subject:message-id;
  bh=nk/xhZSYEVgZsVB9V5l2gZ1XRQkdq7snkfpTsXLGvS0=;
  b=UeOHQSbHbzut4jH3PMDsD/2jZOygRbGALTADVFUxN5TdtcfjoQdjd7AE
   s7nAdahczlzVKfjjW4w+TDW82gG6anecexK0rndMXE/ArMdo3/pGGbJ8K
   Z5xxg6Nd7xuwerdv8DC7HoAdmVWzdP+V7RDZtufkLOAtjvZGU51QFKM98
   TyrhCxsHLF20rXlLIDtS0J8u8zUmQi+Jf7QeFf6jC+p+SxOybgoU+ULv4
   xGSJDhcHoEvo0VZ8fhkQegSCA0lH+/tyssAcrfgApSV/mvbxMEnwErRaO
   mLv3Wuxsj8lwLHi3TxeSoab0e21sjG7VhefeeDuiu1ZMvjunrJqEIqXcz
   g==;
X-CSE-ConnectionGUID: +5cbJvX9Rrqu0idPv9U4uQ==
X-CSE-MsgGUID: V0ID8EinRkinQI1mOi7n1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80080779"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80080779"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:54:27 -0700
X-CSE-ConnectionGUID: Fa2IBZ72TDm5AjNw1SaALw==
X-CSE-MsgGUID: qVCEh+38TIeZByBe4+8zQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227994792"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:54:25 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xWA-00000000048-1Ch1;
	Tue, 07 Apr 2026 03:54:22 +0000
Date: Tue, 07 Apr 2026 11:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:sched/core 5/12] kernel/sched/core.c:6702
 find_proxy_task() warn: inconsistent returns '&mutex->wait_lock'.
Message-ID: <202604041328.DzWicAKn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: John Stultz <jstultz@google.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: K Prateek Nayak <kprateek.nayak@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   059258b0d424510202b6f2796279dbdbf0c6a83d
commit: 56f4b24267a643b0b9ab73f09feaaabfee5a37ae [5/12] sched: Fix modifying donor->blocked on without proper locking
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: loongarch-randconfig-r071-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041328.DzWicAKn-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604041328.DzWicAKn-lkp@intel.com/

New smatch warnings:
kernel/sched/core.c:6702 find_proxy_task() warn: inconsistent returns '&mutex->wait_lock'.
kernel/sched/core.c:6702 find_proxy_task() warn: inconsistent returns '&p->blocked_lock'.

Old smatch warnings:
arch/loongarch/include/asm/atomic.h:51 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +6702 kernel/sched/core.c

be41bde4c3a86de John Stultz    2025-07-12  6575  
be41bde4c3a86de John Stultz    2025-07-12  6576  /*
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6577   * Find runnable lock owner to proxy for mutex blocked donor
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6578   *
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6579   * Follow the blocked-on relation:
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6580   *   task->blocked_on -> mutex->owner -> task...
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6581   *
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6582   * Lock order:
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6583   *
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6584   *   p->pi_lock
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6585   *     rq->lock
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6586   *       mutex->wait_lock
fa4a1ff8ab235a3 John Stultz    2026-03-24  6587   *         p->blocked_lock
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6588   *
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6589   * Returns the task that is going to be used as execution context (the one
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6590   * that is actually going to be run on cpu_of(rq)).
be41bde4c3a86de John Stultz    2025-07-12  6591   */
be41bde4c3a86de John Stultz    2025-07-12  6592  static struct task_struct *
be41bde4c3a86de John Stultz    2025-07-12  6593  find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
be41bde4c3a86de John Stultz    2025-07-12  6594  {
56f4b24267a643b John Stultz    2026-03-24  6595  	enum { FOUND, DEACTIVATE_DONOR } action = FOUND;
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6596  	struct task_struct *owner = NULL;
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6597  	int this_cpu = cpu_of(rq);
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6598  	struct task_struct *p;
be41bde4c3a86de John Stultz    2025-07-12  6599  	struct mutex *mutex;
be41bde4c3a86de John Stultz    2025-07-12  6600  
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6601  	/* Follow blocked_on chain. */
37341ec573da7c1 John Stultz    2026-03-24  6602  	for (p = donor; (mutex = p->blocked_on); p = owner) {
be41bde4c3a86de John Stultz    2025-07-12  6603  		/*
be41bde4c3a86de John Stultz    2025-07-12  6604  		 * By taking mutex->wait_lock we hold off concurrent mutex_unlock()
be41bde4c3a86de John Stultz    2025-07-12  6605  		 * and ensure @owner sticks around.
be41bde4c3a86de John Stultz    2025-07-12  6606  		 */
be41bde4c3a86de John Stultz    2025-07-12  6607  		guard(raw_spinlock)(&mutex->wait_lock);
fa4a1ff8ab235a3 John Stultz    2026-03-24  6608  		guard(raw_spinlock)(&p->blocked_lock);
be41bde4c3a86de John Stultz    2025-07-12  6609  
fa4a1ff8ab235a3 John Stultz    2026-03-24  6610  		/* Check again that p is blocked with blocked_lock held */
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6611  		if (mutex != __get_task_blocked_on(p)) {
be41bde4c3a86de John Stultz    2025-07-12  6612  			/*
be41bde4c3a86de John Stultz    2025-07-12  6613  			 * Something changed in the blocked_on chain and
be41bde4c3a86de John Stultz    2025-07-12  6614  			 * we don't know if only at this level. So, let's
be41bde4c3a86de John Stultz    2025-07-12  6615  			 * just bail out completely and let __schedule()
be41bde4c3a86de John Stultz    2025-07-12  6616  			 * figure things out (pick_again loop).
be41bde4c3a86de John Stultz    2025-07-12  6617  			 */
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6618  			return NULL;
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6619  		}
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6620  
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6621  		owner = __mutex_owner(mutex);
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6622  		if (!owner) {
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6623  			__clear_task_blocked_on(p, mutex);
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6624  			return p;
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6625  		}
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6626  
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6627  		if (!READ_ONCE(owner->on_rq) || owner->se.sched_delayed) {
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6628  			/* XXX Don't handle blocked owners/delayed dequeue yet */
56f4b24267a643b John Stultz    2026-03-24  6629  			action = DEACTIVATE_DONOR;
56f4b24267a643b John Stultz    2026-03-24  6630  			break;
be41bde4c3a86de John Stultz    2025-07-12  6631  		}
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6632  
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6633  		if (task_cpu(owner) != this_cpu) {
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6634  			/* XXX Don't handle migrations yet */
56f4b24267a643b John Stultz    2026-03-24  6635  			action = DEACTIVATE_DONOR;
56f4b24267a643b John Stultz    2026-03-24  6636  			break;
be41bde4c3a86de John Stultz    2025-07-12  6637  		}
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6638  
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6639  		if (task_on_rq_migrating(owner)) {
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6640  			/*
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6641  			 * One of the chain of mutex owners is currently migrating to this
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6642  			 * CPU, but has not yet been enqueued because we are holding the
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6643  			 * rq lock. As a simple solution, just schedule rq->idle to give
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6644  			 * the migration a chance to complete. Much like the migrate_task
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6645  			 * case we should end up back in find_proxy_task(), this time
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6646  			 * hopefully with all relevant tasks already enqueued.
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6647  			 */
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6648  			return proxy_resched_idle(rq);
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6649  		}
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6650  
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6651  		/*
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6652  		 * Its possible to race where after we check owner->on_rq
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6653  		 * but before we check (owner_cpu != this_cpu) that the
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6654  		 * task on another cpu was migrated back to this cpu. In
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6655  		 * that case it could slip by our  checks. So double check
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6656  		 * we are still on this cpu and not migrating. If we get
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6657  		 * inconsistent results, try again.
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6658  		 */
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6659  		if (!task_on_rq_queued(owner) || task_cpu(owner) != this_cpu)
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6660  			return NULL;
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6661  
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6662  		if (owner == p) {
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6663  			/*
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6664  			 * It's possible we interleave with mutex_unlock like:
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6665  			 *
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6666  			 *				lock(&rq->lock);
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6667  			 *				  find_proxy_task()
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6668  			 * mutex_unlock()
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6669  			 *   lock(&wait_lock);
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6670  			 *   donor(owner) = current->blocked_donor;
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6671  			 *   unlock(&wait_lock);
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6672  			 *
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6673  			 *   wake_up_q();
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6674  			 *     ...
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6675  			 *       ttwu_runnable()
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6676  			 *         __task_rq_lock()
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6677  			 *				  lock(&wait_lock);
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6678  			 *				  owner == p
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6679  			 *
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6680  			 * Which leaves us to finish the ttwu_runnable() and make it go.
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6681  			 *
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6682  			 * So schedule rq->idle so that ttwu_runnable() can get the rq
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6683  			 * lock and mark owner as running.
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6684  			 */
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6685  			return proxy_resched_idle(rq);
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6686  		}
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6687  		/*
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6688  		 * OK, now we're absolutely sure @owner is on this
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6689  		 * rq, therefore holding @rq->lock is sufficient to
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6690  		 * guarantee its existence, as per ttwu_remote().
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6691  		 */
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6692  	}
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6693  
56f4b24267a643b John Stultz    2026-03-24  6694  	/* Handle actions we need to do outside of the guard() scope */
56f4b24267a643b John Stultz    2026-03-24  6695  	switch (action) {
56f4b24267a643b John Stultz    2026-03-24  6696  	case DEACTIVATE_DONOR:
56f4b24267a643b John Stultz    2026-03-24  6697  		return proxy_deactivate(rq, donor);
56f4b24267a643b John Stultz    2026-03-24  6698  	case FOUND:
56f4b24267a643b John Stultz    2026-03-24  6699  		/* fallthrough */;
56f4b24267a643b John Stultz    2026-03-24  6700  	}
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6701  	WARN_ON_ONCE(owner && !owner->on_rq);
7de9d4f946383f4 Peter Zijlstra 2025-07-12 @6702  	return owner;
7de9d4f946383f4 Peter Zijlstra 2025-07-12  6703  }
be41bde4c3a86de John Stultz    2025-07-12  6704  #else /* SCHED_PROXY_EXEC */
be41bde4c3a86de John Stultz    2025-07-12  6705  static struct task_struct *
be41bde4c3a86de John Stultz    2025-07-12  6706  find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
be41bde4c3a86de John Stultz    2025-07-12  6707  {
be41bde4c3a86de John Stultz    2025-07-12  6708  	WARN_ONCE(1, "This should never be called in the !SCHED_PROXY_EXEC case\n");
be41bde4c3a86de John Stultz    2025-07-12  6709  	return donor;
be41bde4c3a86de John Stultz    2025-07-12  6710  }
be41bde4c3a86de John Stultz    2025-07-12  6711  #endif /* SCHED_PROXY_EXEC */
be41bde4c3a86de John Stultz    2025-07-12  6712  

:::::: The code at line 6702 was first introduced by commit
:::::: 7de9d4f946383f48ec393b6e9ad0c20e49e174e7 sched: Start blocked_on chain processing in find_proxy_task()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
