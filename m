Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DDB2264C0
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 05:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787116417; cv=none; b=u6uZOjdZuOnUycrHR4aSMaW1tYPHu1VRXXZb0SF3ZAd/3gvynf9WCueG32Rujgh4baJgYfOobdywLZ6HbPdgJosCkiASPIsmnV8VAUU5E+lk9m0KqCx4iiwC9SF6N3RxZ8XmBbbnGI3hIyLyEZacKV/o5VJKh/WH8PlY2qTbMPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787116417; c=relaxed/simple;
	bh=FbBzdKo312FnTOVwSofzZqqDJTCe3tyR0jTZlhQJ9rg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q9XWZvfTP10zV9qJojmwROhmAWBV2JUoYZQ5zU4RwuY9rD6X4zgM4womAroNbNA8XIKdMX9FTDGwwcK4kTbfsVWps6TYoRNFZK78vBp/LPTHvNJshAc0lwFbEbVBK+oCGVYoeHX2DJyXL0UvPiQBj3g5YkIhuuSrvmcE0xVtCWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhMegTdO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhMegTdO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787116415; x=1818652415;
  h=date:from:to:cc:subject:message-id;
  bh=FbBzdKo312FnTOVwSofzZqqDJTCe3tyR0jTZlhQJ9rg=;
  b=LhMegTdOcFPXcI0YxO03drzQZAFrcAzx8CeKWpow9OjkP0pwGaxHKOCp
   DeJAvDimCu/UKoNwO7X2SgHZf+wMexkXb2QE/S2sME2wLRWp7+jnAFZBl
   IhbSWp2r4Ru+OrkVhkO0B+ZGOr4IJoeh46635L8l6XCxzY6dw/2Vmipe4
   M/btrbcP2IDRz+zkHhRTGi5vnxHkcFSyD0C0MGQYGn5aIUDMPUnSKY/uE
   3kf8whSw3U9UYuosG3JMJgmjAniBHYl9NwwcOaEOk2bwd3eTTMbSyN1EH
   4dMJTTc5dcUOn7rPJqs/cy9ZGieRC3TGL4Brn4RjsOGQdW7HmGCk1xWoQ
   Q==;
X-CSE-ConnectionGUID: XWoZlS0pS7ifJsGPjfnnug==
X-CSE-MsgGUID: 5h1AViJGSjqSh/7lwRWiDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98776651"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="98776651"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 22:13:34 -0700
X-CSE-ConnectionGUID: kABtaDb0Tla4tH4Bf7riEA==
X-CSE-MsgGUID: H1u6OlSnQVWCv/6QSclr9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="259244386"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Aug 2026 22:13:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwYcE-00000000etw-1Rjn;
	Wed, 19 Aug 2026 05:13:30 +0000
Date: Wed, 19 Aug 2026 13:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tglx-devel:futex/robust 6/6] kernel/futex/waitwake.c:348
 __futex_robust_unlock() warn: inconsistent returns '&hb->lock'.
Message-ID: <202608191348.FyNtCzXC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git futex/robust
head:   2a0abd0337cfb4c84bff14c41903cb8ee9b1cc89
commit: 2a0abd0337cfb4c84bff14c41903cb8ee9b1cc89 [6/6] futex: Plug another exit race for robust futexes
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm64-randconfig-r072-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191348.FyNtCzXC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608191348.FyNtCzXC-lkp@intel.com/

smatch warnings:
kernel/futex/waitwake.c:348 __futex_robust_unlock() warn: inconsistent returns '&hb->lock'.

vim +348 kernel/futex/waitwake.c

56b77172f31394 Thomas Gleixner 2026-07-31  225  
56b77172f31394 Thomas Gleixner 2026-07-31  226  static int __futex_robust_unlock(u32 __user *uaddr, void __user *pop, unsigned int flags,
56b77172f31394 Thomas Gleixner 2026-07-31  227  				 unsigned int nr_wake, u32 bitset,
56b77172f31394 Thomas Gleixner 2026-07-31  228  				 struct wake_q_head *wake_q)
56b77172f31394 Thomas Gleixner 2026-07-31  229  {
56b77172f31394 Thomas Gleixner 2026-07-31  230  	union futex_key key = FUTEX_KEY_INIT;
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  231  	int ret, nr_woken = 0;
3ca9595d9fb6cc Thomas Gleixner 2026-06-02  232  
3ca9595d9fb6cc Thomas Gleixner 2026-06-02  233  	/*
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  234  	 * In the case that unlocking of the user space lock faulted, this could
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  235  	 * be optimized to not re-evaluate the key for private futexes, but
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  236  	 * there is actually zero benefit to do so. It's very unlikely that the
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  237  	 * unlock faults right after user space attempted a TID -> 0 transition
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  238  	 * on that address, so optimizing for that corner case is pointless.
3ca9595d9fb6cc Thomas Gleixner 2026-06-02  239  	 */
56b77172f31394 Thomas Gleixner 2026-07-31  240  	ret = get_futex_key(uaddr, flags, &key, FUTEX_WRITE);
56b77172f31394 Thomas Gleixner 2026-07-31  241  	if (unlikely(ret))
56b77172f31394 Thomas Gleixner 2026-07-31  242  		return ret;
56b77172f31394 Thomas Gleixner 2026-07-31  243  
56b77172f31394 Thomas Gleixner 2026-07-31  244  	CLASS(hbr, hbr)(&key);
56b77172f31394 Thomas Gleixner 2026-07-31  245  	auto hb = hbr.hb;
56b77172f31394 Thomas Gleixner 2026-07-31  246  
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  247  	/*
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  248  	 * This has to take the hash bucket lock unconditionally and cannot rely
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  249  	 * on futex_hb_waiters_pending(hb) as that would open a race condition
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  250  	 * between the unlock operation and a concurrent incoming waiter:
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  251  	 *
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  252  	 *						user_lock |= FUTEX_WAITERS;
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  253  	 *   if (!futex_hb_waiters_pending(hb))
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  254  	 *	robust_unlock(0)			atomic_inc(hb::waiters);
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  255  	 *						lock(hb)
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  256  	 *						// Succeeds!
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  257  	 *						compare_user_lock()
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  258  	 *
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  259  	 *	    user_lock = 0; // clears the FUTEX_WAITERS bit
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  260  	 *
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  261  	 * Though it's likely that there is at least one waiter queued because
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  262  	 * the userspace TID -> 0 transition failed due to the FUTEX_WAITERS bit
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  263  	 * being set, which means the lock has to be taken in the majority of
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  264  	 * cases anyway.
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  265  	 *
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  266  	 * As the FUTEX_WAITERS bit stays consistent, the optimization of the
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  267  	 * lockless quick check is not that relevant anymore because this avoids
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  268  	 * that the bit has to be set unconditionally by woken up waiters when
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  269  	 * they return to user space and acquire the lock. Which means if there
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  270  	 * was only one waiter queued the unlock is uncontended and avoids the
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  271  	 * syscall completely.
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  272  	 */
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  273  	scoped_guard(spinlock, &hb->lock) {
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  274  		struct futex_q *to_wake = NULL;
56b77172f31394 Thomas Gleixner 2026-07-31  275  
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  276  		/*
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  277  		 * The unlock has to happen _before_ waiters are collected
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  278  		 * because they can return from futex_wait() without taking the
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  279  		 * hash bucket lock when collect_waiters() sets futex_q::lock_ptr
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  280  		 * to NULL. That can result in the following situation:
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  281  		 *
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  282  		 * collect_waiters()
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  283  		 *   collects T2		kill(T2);
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  284  		 *	q->lock_ptr = NULL	T2 runs
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  285  		 *				if (!q->lock_ptr)
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  286  		 *				    return;
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  287  		 *				exit_to_user()
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  288  		 *				  handle_signal()
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  289  		 *				    do_exit()
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  290  		 *				      handle_futex_death()
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  291  		 *				      // observes lock = TID(OWNER)
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  292  		 * lock = FUTEX_WAITERS;
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  293  		 *
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  294  		 * That means all waiters which are still queued can become
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  295  		 * stale unless there is another lock/unlock operation on the
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  296  		 * futex later.
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  297  		 *
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  298  		 * Evaluate waiters and wakees to keep the FUTEX_WAITERS bit in
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  299  		 * the user space lock consistent.
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  300  		 */
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  301  		ret = evaluate_waiters(hb, &key, nr_wake, bitset, &to_wake);
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  302  		if (ret < 0)
56b77172f31394 Thomas Gleixner 2026-07-31  303  			return ret;
56b77172f31394 Thomas Gleixner 2026-07-31  304  
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  305  		/*
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  306  		 * Unlock the futex in user space while holding the hash bucket
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  307  		 * lock to keep the FUTEX_WAITERS bit consistent. Newly incoming
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  308  		 * waiters are serialized on the hash bucket lock and will
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  309  		 * observe that the user space value has changed once they
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  310  		 * acquired it.
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  311  		 */
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  312  		u32 uval = ret ? FUTEX_WAITERS : 0;
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  313  
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  314  		guard(pagefault)();
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  315  		scoped_user_write_access(uaddr, efault_uaddr)
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  316  			unsafe_atomic_store_release_user(uval, uaddr, efault_uaddr);
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  317  
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  318  		/*
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  319  		 * Now that the unlock has been successful, collect the waiters
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  320  		 * for wake up. If @nr_wake is 1, which is the common case, then
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  321  		 * evaluate_waiters() has stored the first eligible waiter in
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  322  		 * @to_wake, if it found one.  Spare another hash bucket walk
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  323  		 * for that case.
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  324  		 */
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  325  		if (likely(nr_wake == 1))
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  326  			nr_woken = collect_cached_waiter(wake_q, to_wake);
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  327  		else
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  328  			nr_woken = collect_waiters(hb, wake_q, &key, nr_wake, bitset);
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  329  
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  330  		/*
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  331  		 * This should never happen because evaluate_waiters() would
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  332  		 * have detected a PI futex mixup already.
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  333  		 */
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  334  		if (WARN_ON_ONCE(nr_woken < 0))
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  335  			return nr_woken;
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  336  	}
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  337  
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  338  	/*
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  339  	 * Clear the pending list op now that everything is done. If clearing
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  340  	 * the pending op fails, then the task is in deeper trouble as the
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  341  	 * robust list head is usually part of the TLS. The chance of survival
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  342  	 * is close to zero and retry is pointless as the fault is terminal.
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  343  	 */
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  344  	return futex_robust_list_clear_pending(pop, flags) ? nr_woken : -EFAULT;
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  345  
56b77172f31394 Thomas Gleixner 2026-07-31  346  efault_uaddr:
2a0abd0337cfb4 Thomas Gleixner 2026-07-27  347  	/* Unlock faulted. Try to fault in @uaddr and repeat if successful */
2a0abd0337cfb4 Thomas Gleixner 2026-07-27 @348  	return fault_in_user_writeable(uaddr) ? : -EAGAIN;
3ca9595d9fb6cc Thomas Gleixner 2026-06-02  349  }
3ca9595d9fb6cc Thomas Gleixner 2026-06-02  350  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
