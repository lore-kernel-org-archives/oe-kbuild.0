Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE331FD4
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Nov 2025 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764510000; cv=none; b=l9sk2T1jvAiTlGcSPZvk5EkO4wXzFgt0rpsIikpJqyrOnlM3E/Q5Rx9IjPVcyh9fyCac37CXLOzyUJmCNjV1+/HF63cNuGesi1E7BJDWT0R9Q8HgJOt+njLmTDNrMOeIiMWhSvo0dD/k+ZIA/l8fgjDwualLRKDAas9faXVSYkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764510000; c=relaxed/simple;
	bh=q8uakbEckXsL+vLMYZXJtxqqXDpDB1+9h+77xF37Rd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDSZyLvYG9dEtIeWmWyWlDDsM//X1h3/MUhLamqxPUJbMFYZiegl/gWAdN/YgPmA+7hcADFm+cLe1uci+8W1xuSvhTNXVeoWFfUxLuMpI+H2l/TH/da2Cc8Ev3tOhwcs7PNJs40iDoVL41Qbx7l3NQrjsdqhXH7nQtTijFV1Iw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtaVfWpC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtaVfWpC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764509995; x=1796045995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q8uakbEckXsL+vLMYZXJtxqqXDpDB1+9h+77xF37Rd4=;
  b=VtaVfWpCG+/4YXMyrvCgOcxrp9h1K29jVcl1rkC4nTHoL7cbCAUlXqjK
   MjGpdUWBs3bM/z1NMAVlL9XGNAk+XAx03lhxfkAwSB0BNwwXZl7K+Dn7/
   xw4yPlU2S/US41rd96KBIRajtLLOWYuqAC9GcOVHqhet+X0nvIM5uVQTu
   v6+flQeQ4dV/V0K3bKNGqqUB92i+vIVhPTXyZlFQ2X7F5weyCWw/NPVjn
   23S5JKMvEZB1QUTr4gIw4CPnUMSecKqTbzIjnXHjcPaDMHy/++JHOWwrB
   yEzAi39iTdz7fFrheRfVa3Z0atGW7YUHQGLKrsLZU+qp4LE5/I2Om2zfx
   g==;
X-CSE-ConnectionGUID: WftM/mNrQ6SXSQ4kG9F7vQ==
X-CSE-MsgGUID: UYnYYng5RniPQu4mvEVF6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="70319514"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="70319514"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 05:39:55 -0800
X-CSE-ConnectionGUID: eCIl2cY3QYGzlFkiCYZQWA==
X-CSE-MsgGUID: JqGa+pMbRymA1BxcnRjDOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="193728740"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Nov 2025 05:39:55 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPhea-000000007yv-3u0Z;
	Sun, 30 Nov 2025 13:39:52 +0000
Date: Sun, 30 Nov 2025 21:38:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-desktop 52/52]
 kernel/sched/core.c:7556 find_proxy_task() warn: inconsistent returns
 '&mutex->wait_lock'.
Message-ID: <202511302121.XZk82lEx-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   520e11ce6f5596dca544fdc96adbb85b54e8e26f
commit: 4f9e4406e4981511e1348e4483eae7c21cd5fe24 [52/52] ANDROID: Update proxy-exec logic from v14 to v18
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20251130 (https://download.01.org/0day-ci/archive/20251130/202511302121.XZk82lEx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511302121.XZk82lEx-lkp@intel.com/

smatch warnings:
kernel/sched/core.c:7556 find_proxy_task() warn: inconsistent returns '&mutex->wait_lock'.
kernel/sched/core.c:7556 find_proxy_task() warn: inconsistent returns '&p->blocked_lock'.

vim +7556 kernel/sched/core.c

f86b854c986a7f Peter Zijlstra 2023-07-14  7340  
7236283bb8acfb John Stultz    2023-06-24  7341  /*
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7342   * Find runnable lock owner to proxy for mutex blocked donor
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7343   *
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7344   * Follow the blocked-on relation:
465f85fe913342 Peter Zijlstra 2023-07-24  7345   *
465f85fe913342 Peter Zijlstra 2023-07-24  7346   *                ,-> task
465f85fe913342 Peter Zijlstra 2023-07-24  7347   *                |     | blocked-on
465f85fe913342 Peter Zijlstra 2023-07-24  7348   *                |     v
465f85fe913342 Peter Zijlstra 2023-07-24  7349   *  blocked_donor |   mutex
465f85fe913342 Peter Zijlstra 2023-07-24  7350   *                |     | owner
465f85fe913342 Peter Zijlstra 2023-07-24  7351   *                |     v
465f85fe913342 Peter Zijlstra 2023-07-24  7352   *                `-- task
465f85fe913342 Peter Zijlstra 2023-07-24  7353   *
465f85fe913342 Peter Zijlstra 2023-07-24  7354   * and set the blocked_donor relation, this latter is used by the mutex
465f85fe913342 Peter Zijlstra 2023-07-24  7355   * code to find which (blocked) task to hand-off to.
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7356   *
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7357   * Lock order:
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7358   *
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7359   *   p->pi_lock
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7360   *     rq->lock
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7361   *       mutex->wait_lock
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7362   *         p->blocked_lock
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7363   *
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7364   * Returns the task that is going to be used as execution context (the one
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7365   * that is actually going to be run on cpu_of(rq)).
7236283bb8acfb John Stultz    2023-06-24  7366   */
7236283bb8acfb John Stultz    2023-06-24  7367  static struct task_struct *
7236283bb8acfb John Stultz    2023-06-24  7368  find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
7236283bb8acfb John Stultz    2023-06-24  7369  {
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7370  	struct task_struct *owner = NULL;
e4239ea599c633 John Stultz    2023-07-24  7371  	bool curr_in_chain = false;
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7372  	int this_cpu = cpu_of(rq);
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7373  	struct task_struct *p;
7236283bb8acfb John Stultz    2023-06-24  7374  	struct mutex *mutex;
e4239ea599c633 John Stultz    2023-07-24  7375  	int owner_cpu;
7236283bb8acfb John Stultz    2023-06-24  7376  
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7377  	/* Follow blocked_on chain. */
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7378  	for (p = donor; task_is_blocked(p); p = owner) {
7236283bb8acfb John Stultz    2023-06-24  7379  		mutex = p->blocked_on;
7236283bb8acfb John Stultz    2023-06-24  7380  		/* Something changed in the chain, so pick again */
7236283bb8acfb John Stultz    2023-06-24  7381  		if (!mutex)
7236283bb8acfb John Stultz    2023-06-24  7382  			return NULL;
7236283bb8acfb John Stultz    2023-06-24  7383  		/*
7236283bb8acfb John Stultz    2023-06-24  7384  		 * By taking mutex->wait_lock we hold off concurrent mutex_unlock()
7236283bb8acfb John Stultz    2023-06-24  7385  		 * and ensure @owner sticks around.
7236283bb8acfb John Stultz    2023-06-24  7386  		 */
4f9e4406e49815 John Stultz    2025-06-25  7387  		guard(raw_spinlock)(&mutex->wait_lock);
4f9e4406e49815 John Stultz    2025-06-25  7388  		guard(raw_spinlock)(&p->blocked_lock);
7236283bb8acfb John Stultz    2023-06-24  7389  
7236283bb8acfb John Stultz    2023-06-24  7390  		/* Check again that p is blocked with blocked_lock held */
4f9e4406e49815 John Stultz    2025-06-25  7391  		if (mutex != __get_task_blocked_on(p)) {
7236283bb8acfb John Stultz    2023-06-24  7392  			/*
7236283bb8acfb John Stultz    2023-06-24  7393  			 * Something changed in the blocked_on chain and
7236283bb8acfb John Stultz    2023-06-24  7394  			 * we don't know if only at this level. So, let's
4f9e4406e49815 John Stultz    2025-06-25  7395  			 * just bail out completely and let __schedule()
7236283bb8acfb John Stultz    2023-06-24  7396  			 * figure things out (pick_again loop).
7236283bb8acfb John Stultz    2023-06-24  7397  			 */
4f9e4406e49815 John Stultz    2025-06-25  7398  			return NULL;
4f9e4406e49815 John Stultz    2025-06-25  7399  		}
4f9e4406e49815 John Stultz    2025-06-25  7400  
4f9e4406e49815 John Stultz    2025-06-25  7401  		/* Double check blocked_on_state now we're holding the lock */
4f9e4406e49815 John Stultz    2025-06-25  7402  		if (p->blocked_on_state == BO_RUNNABLE)
4f9e4406e49815 John Stultz    2025-06-25  7403  			return p;
4f9e4406e49815 John Stultz    2025-06-25  7404  
4f9e4406e49815 John Stultz    2025-06-25  7405  		/*
4f9e4406e49815 John Stultz    2025-06-25  7406  		 * If a ww_mutex hits the die/wound case, it marks the task as
4f9e4406e49815 John Stultz    2025-06-25  7407  		 * BO_WAKING and calls try_to_wake_up(), so that the mutex
4f9e4406e49815 John Stultz    2025-06-25  7408  		 * cycle can be broken and we avoid a deadlock.
4f9e4406e49815 John Stultz    2025-06-25  7409  		 *
4f9e4406e49815 John Stultz    2025-06-25  7410  		 * However, if at that moment, we are here on the cpu which the
4f9e4406e49815 John Stultz    2025-06-25  7411  		 * die/wounded task is enqueued, we might loop on the cycle as
4f9e4406e49815 John Stultz    2025-06-25  7412  		 * BO_WAKING still causes task_is_blocked() to return true
4f9e4406e49815 John Stultz    2025-06-25  7413  		 * (since we want return migration to occur before we run the
4f9e4406e49815 John Stultz    2025-06-25  7414  		 * task).
4f9e4406e49815 John Stultz    2025-06-25  7415  		 *
4f9e4406e49815 John Stultz    2025-06-25  7416  		 * Unfortunately since we hold the rq lock, it will block
4f9e4406e49815 John Stultz    2025-06-25  7417  		 * try_to_wake_up from completing and doing the return
4f9e4406e49815 John Stultz    2025-06-25  7418  		 * migration.
4f9e4406e49815 John Stultz    2025-06-25  7419  		 *
4f9e4406e49815 John Stultz    2025-06-25  7420  		 * So when we hit a BO_WAKING task try to wake it up ourselves.
4f9e4406e49815 John Stultz    2025-06-25  7421  		 */
4f9e4406e49815 John Stultz    2025-06-25  7422  		if (p->blocked_on_state == BO_WAKING) {
4f9e4406e49815 John Stultz    2025-06-25  7423  			if (task_current(rq, p)) {
4f9e4406e49815 John Stultz    2025-06-25  7424  				/* If its current just set it runnable */
4f9e4406e49815 John Stultz    2025-06-25  7425  				__force_blocked_on_runnable(p);
4f9e4406e49815 John Stultz    2025-06-25  7426  				return p;
4f9e4406e49815 John Stultz    2025-06-25  7427  			}
4f9e4406e49815 John Stultz    2025-06-25  7428  			goto needs_return;
7236283bb8acfb John Stultz    2023-06-24  7429  		}
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7430  
e4239ea599c633 John Stultz    2023-07-24  7431  		if (task_current(rq, p))
e4239ea599c633 John Stultz    2023-07-24  7432  			curr_in_chain = true;
e4239ea599c633 John Stultz    2023-07-24  7433  
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7434  		owner = __mutex_owner(mutex);
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7435  		if (!owner) {
e4239ea599c633 John Stultz    2023-07-24  7436  			/* If the owner is null, we may have some work to do */
4f9e4406e49815 John Stultz    2025-06-25  7437  			if (!proxy_can_run_here(rq, p))
e4239ea599c633 John Stultz    2023-07-24  7438  				goto needs_return;
e4239ea599c633 John Stultz    2023-07-24  7439  
4f9e4406e49815 John Stultz    2025-06-25  7440  			__force_blocked_on_runnable(p);
4f9e4406e49815 John Stultz    2025-06-25  7441  			return p;
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7442  		}
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7443  
4f9e4406e49815 John Stultz    2025-06-25  7444  		if (!READ_ONCE(owner->on_rq) || owner->se.sched_delayed) {
f86b854c986a7f Peter Zijlstra 2023-07-14  7445  			/*
f86b854c986a7f Peter Zijlstra 2023-07-14  7446  			 * rq->curr must not be added to the blocked_head list or else
f86b854c986a7f Peter Zijlstra 2023-07-14  7447  			 * ttwu_do_activate could enqueue it elsewhere before it switches
f86b854c986a7f Peter Zijlstra 2023-07-14  7448  			 * out here. The approach to avoid this is the same as in the
f86b854c986a7f Peter Zijlstra 2023-07-14  7449  			 * migrate_task case.
f86b854c986a7f Peter Zijlstra 2023-07-14  7450  			 */
4f9e4406e49815 John Stultz    2025-06-25  7451  			if (curr_in_chain)
f86b854c986a7f Peter Zijlstra 2023-07-14  7452  				return proxy_resched_idle(rq);
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7453  
f86b854c986a7f Peter Zijlstra 2023-07-14  7454  			/*
f86b854c986a7f Peter Zijlstra 2023-07-14  7455  			 * If !@owner->on_rq, holding @rq->lock will not pin the task,
f86b854c986a7f Peter Zijlstra 2023-07-14  7456  			 * so we cannot drop @mutex->wait_lock until we're sure its a blocked
f86b854c986a7f Peter Zijlstra 2023-07-14  7457  			 * task on this rq.
f86b854c986a7f Peter Zijlstra 2023-07-14  7458  			 *
f86b854c986a7f Peter Zijlstra 2023-07-14  7459  			 * We use @owner->blocked_lock to serialize against ttwu_activate().
f86b854c986a7f Peter Zijlstra 2023-07-14  7460  			 * Either we see its new owner->on_rq or it will see our list_add().
f86b854c986a7f Peter Zijlstra 2023-07-14  7461  			 */
4f9e4406e49815 John Stultz    2025-06-25  7462  			WARN_ON(owner == p);
f86b854c986a7f Peter Zijlstra 2023-07-14  7463  			raw_spin_unlock(&p->blocked_lock);
f86b854c986a7f Peter Zijlstra 2023-07-14  7464  			raw_spin_lock(&owner->blocked_lock);
f86b854c986a7f Peter Zijlstra 2023-07-14  7465  			proxy_resched_idle(rq);
f86b854c986a7f Peter Zijlstra 2023-07-14  7466  			proxy_enqueue_on_owner(rq, owner, p);
f86b854c986a7f Peter Zijlstra 2023-07-14  7467  			raw_spin_unlock(&owner->blocked_lock);
4f9e4406e49815 John Stultz    2025-06-25  7468  			raw_spin_lock(&p->blocked_lock);
4f9e4406e49815 John Stultz    2025-06-25  7469  
f86b854c986a7f Peter Zijlstra 2023-07-14  7470  			return NULL; /* retry task selection */
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7471  		}
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7472  
4f9e4406e49815 John Stultz    2025-06-25  7473  		owner_cpu = task_cpu(owner);
4f9e4406e49815 John Stultz    2025-06-25  7474  		if (owner_cpu != this_cpu) {
4f9e4406e49815 John Stultz    2025-06-25  7475  			trace_sched_pe_migration(donor, owner);
e4239ea599c633 John Stultz    2023-07-24  7476  			/*
4f9e4406e49815 John Stultz    2025-06-25  7477  			 * @owner can disappear, simply migrate to @owner_cpu
4f9e4406e49815 John Stultz    2025-06-25  7478  			 * and leave that CPU to sort things out.
e4239ea599c633 John Stultz    2023-07-24  7479  			 */
4f9e4406e49815 John Stultz    2025-06-25  7480  			if (curr_in_chain)
4f9e4406e49815 John Stultz    2025-06-25  7481  				return proxy_resched_idle(rq);
4f9e4406e49815 John Stultz    2025-06-25  7482  			goto migrate;
4f9e4406e49815 John Stultz    2025-06-25  7483  		}
4f9e4406e49815 John Stultz    2025-06-25  7484  
4f9e4406e49815 John Stultz    2025-06-25  7485  		if (task_on_rq_migrating(owner)) {
4f9e4406e49815 John Stultz    2025-06-25  7486  			trace_sched_pe_owner_is_migrating(owner, p);
4f9e4406e49815 John Stultz    2025-06-25  7487  			/*
4f9e4406e49815 John Stultz    2025-06-25  7488  			 * One of the chain of mutex owners is currently migrating to this
4f9e4406e49815 John Stultz    2025-06-25  7489  			 * CPU, but has not yet been enqueued because we are holding the
4f9e4406e49815 John Stultz    2025-06-25  7490  			 * rq lock. As a simple solution, just schedule rq->idle to give
4f9e4406e49815 John Stultz    2025-06-25  7491  			 * the migration a chance to complete. Much like the migrate_task
4f9e4406e49815 John Stultz    2025-06-25  7492  			 * case we should end up back in find_proxy_task(), this time
4f9e4406e49815 John Stultz    2025-06-25  7493  			 * hopefully with all relevant tasks already enqueued.
4f9e4406e49815 John Stultz    2025-06-25  7494  			 */
4f9e4406e49815 John Stultz    2025-06-25  7495  			return proxy_resched_idle(rq);
4f9e4406e49815 John Stultz    2025-06-25  7496  		}
4f9e4406e49815 John Stultz    2025-06-25  7497  
4f9e4406e49815 John Stultz    2025-06-25  7498  		/*
4f9e4406e49815 John Stultz    2025-06-25  7499  		 * Its possible to race where after we check owner->on_rq
4f9e4406e49815 John Stultz    2025-06-25  7500  		 * but before we check (owner_cpu != this_cpu) that the
4f9e4406e49815 John Stultz    2025-06-25  7501  		 * task on another cpu was migrated back to this cpu. In
4f9e4406e49815 John Stultz    2025-06-25  7502  		 * that case it could slip by our  checks. So double check
4f9e4406e49815 John Stultz    2025-06-25  7503  		 * we are still on this cpu and not migrating. If we get
4f9e4406e49815 John Stultz    2025-06-25  7504  		 * inconsistent results, try again.
4f9e4406e49815 John Stultz    2025-06-25  7505  		 */
4f9e4406e49815 John Stultz    2025-06-25  7506  		if (!task_on_rq_queued(owner) || task_cpu(owner) != this_cpu)
4f9e4406e49815 John Stultz    2025-06-25  7507  			return NULL;
e4239ea599c633 John Stultz    2023-07-24  7508  
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7509  		if (owner == p) {
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7510  			/*
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7511  			 * It's possible we interleave with mutex_unlock like:
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7512  			 *
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7513  			 *				lock(&rq->lock);
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7514  			 *				  find_proxy_task()
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7515  			 * mutex_unlock()
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7516  			 *   lock(&wait_lock);
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7517  			 *   donor(owner) = current->blocked_donor;
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7518  			 *   unlock(&wait_lock);
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7519  			 *
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7520  			 *   wake_up_q();
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7521  			 *     ...
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7522  			 *       ttwu_runnable()
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7523  			 *         __task_rq_lock()
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7524  			 *				  lock(&wait_lock);
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7525  			 *				  owner == p
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7526  			 *
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7527  			 * Which leaves us to finish the ttwu_runnable() and make it go.
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7528  			 *
4f9e4406e49815 John Stultz    2025-06-25  7529  			 * So schedule rq->idle so that ttwu_runnable() can get the rq
4f9e4406e49815 John Stultz    2025-06-25  7530  			 * lock and mark owner as running.
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7531  			 */
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7532  			return proxy_resched_idle(rq);
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7533  		}
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7534  		/*
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7535  		 * OK, now we're absolutely sure @owner is on this
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7536  		 * rq, therefore holding @rq->lock is sufficient to
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7537  		 * guarantee its existence, as per ttwu_remote().
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7538  		 */
465f85fe913342 Peter Zijlstra 2023-07-24  7539  		owner->blocked_donor = p;
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7540  	}
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7541  
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7542  	WARN_ON_ONCE(owner && !owner->on_rq);
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7543  	return owner;
d2f9f2613abad7 Peter Zijlstra 2023-07-24  7544  
4f9e4406e49815 John Stultz    2025-06-25  7545  	/*
4f9e4406e49815 John Stultz    2025-06-25  7546  	 * NOTE: This logic is down here, because we need to call
4f9e4406e49815 John Stultz    2025-06-25  7547  	 * the functions with the mutex wait_lock and task
4f9e4406e49815 John Stultz    2025-06-25  7548  	 * blocked_lock released, so we have to get out of the
4f9e4406e49815 John Stultz    2025-06-25  7549  	 * guard() scope.
4f9e4406e49815 John Stultz    2025-06-25  7550  	 */
4f9e4406e49815 John Stultz    2025-06-25  7551  migrate:
4f9e4406e49815 John Stultz    2025-06-25  7552  	proxy_migrate_task(rq, rf, p, owner_cpu);
4f9e4406e49815 John Stultz    2025-06-25  7553  	return NULL;
e4239ea599c633 John Stultz    2023-07-24  7554  needs_return:
4f9e4406e49815 John Stultz    2025-06-25  7555  	proxy_force_return(rq, rf, p);
7236283bb8acfb John Stultz    2023-06-24 @7556  	return NULL;
7236283bb8acfb John Stultz    2023-06-24  7557  }
7236283bb8acfb John Stultz    2023-06-24  7558  #else /* SCHED_PROXY_EXEC */
7236283bb8acfb John Stultz    2023-06-24  7559  static struct task_struct *
7236283bb8acfb John Stultz    2023-06-24  7560  find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
7236283bb8acfb John Stultz    2023-06-24  7561  {
7236283bb8acfb John Stultz    2023-06-24  7562  	WARN_ONCE(1, "This should never be called in the !SCHED_PROXY_EXEC case\n");
7236283bb8acfb John Stultz    2023-06-24  7563  	return donor;
7236283bb8acfb John Stultz    2023-06-24  7564  }
7236283bb8acfb John Stultz    2023-06-24  7565  #endif /* SCHED_PROXY_EXEC */
7236283bb8acfb John Stultz    2023-06-24  7566  

:::::: The code at line 7556 was first introduced by commit
:::::: 7236283bb8acfbee811da21affcbc56674999b02 FROMLIST: sched: Add an initial sketch of the find_proxy_task() function

:::::: TO: John Stultz <jstultz@google.com>
:::::: CC: John Stultz <jstultz@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
