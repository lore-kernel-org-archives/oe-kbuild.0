Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCFA405C38
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591239; cv=none; b=i+EWWAepA3i5kUcjeCdUm+pe+Jpt9QnK8QqAKUczAMQjRSFoy4VdHBTKtm4mUJ2tX+WvvtCCYJqfE9y6gtLggE0MuycLOw99a4biG1MDN6BKbG/Wr+bTCYdOwaorGBiL76fKYPeIfk2QHnCNsAl3hNjLtW7fdfBh5muIWVOeML8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591239; c=relaxed/simple;
	bh=RScrVSksk8k+10bTx/c/RymYM+izUzJh14UXzvg61N0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FdUqGjEkO3oUvXc0EOKxTWUoOyA+LjzM+dM39JFNVh0T4GYvfPljjm2A9GQ5eo7UX+Qdj1WpszcCu8xih06R2KMvs9mnILIpLNvl6OuctnVKhxFQ9yKgvNPEXFxt1OejcINFjtnXMSENFViQ7HfgBXklll22y0lt+TRutjvaMGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTo/I59d; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTo/I59d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783591236; x=1815127236;
  h=date:from:to:cc:subject:message-id;
  bh=RScrVSksk8k+10bTx/c/RymYM+izUzJh14UXzvg61N0=;
  b=jTo/I59dlT8VGqMCscW38jBpnGfGOepyiOoEkpuBO235qywc4zNeG4rB
   dvWoe9ed1VspKAv91ksNl8nuWyTcl0RbPqlCyLaHwrq9k05wNoft/SkAy
   NkpUn1fqNfPKTXqtdcobXEwp7ajCcuot6GejpaEQ0pUSircf6E6q8E+Zp
   uk/KkrtpbsaWLZk9qh+AH0gPQcdbJx99oukKGvnxz89dCbytIloj6viHC
   cbJZLfyyuyboqM023kKSGS748zNt4eBjNvH3zDUzIiQuBTFqQdwHC+Ozp
   JqxkI2rzcRpVGVxyN8z+46n3WoDElQgDSOnV+gfMQe+ZwBTgUAg1hAK4k
   w==;
X-CSE-ConnectionGUID: KAQ4gjGnR++gSzORgOMsEQ==
X-CSE-MsgGUID: ABmR3VIuSSKqXp4Q91IYcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71787459"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71787459"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:00:36 -0700
X-CSE-ConnectionGUID: i6DFD6kKQ0y0evySoaY2TA==
X-CSE-MsgGUID: KiLCq96UQA2kx27srEMJow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258845035"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 09 Jul 2026 03:00:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whlYV-00000000HXF-0OcW;
	Thu, 09 Jul 2026 10:00:31 +0000
Date: Thu, 09 Jul 2026 17:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hwspinlock/hwspinlock_core.c:139 __hwspin_trylock()
 warn: mixing irq and irqsave
Message-ID: <202607091718.s8YXDPzQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: e4588c25c9d122b5847b88e18b184404b6959160 compiler-context-analysis: Remove __cond_lock() function-like helper
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: nios2-randconfig-r071-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091718.s8YXDPzQ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e4588c25c9d1 ("compiler-context-analysis: Remove __cond_lock() function-like helper")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607091718.s8YXDPzQ-lkp@intel.com/

New smatch warnings:
drivers/hwspinlock/hwspinlock_core.c:139 __hwspin_trylock() warn: mixing irq and irqsave

Old smatch warnings:
drivers/hwspinlock/hwspinlock_core.c:295 __hwspin_unlock() warn: mixing irqsave and irq

vim +139 drivers/hwspinlock/hwspinlock_core.c

93b465c2e186d9 Juan Gutierrez  2011-09-06   58  
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   59  
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   60  /**
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   61   * __hwspin_trylock() - attempt to lock a specific hwspinlock
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   62   * @hwlock: an hwspinlock which we want to trylock
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   63   * @mode: controls whether local interrupts are disabled or not
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   64   * @flags: a pointer where the caller's interrupt state will be saved at (if
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   65   *         requested)
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   66   *
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   67   * This function attempts to lock an hwspinlock, and will immediately
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   68   * fail if the hwspinlock is already taken.
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   69   *
1e6c06a7e88c25 Baolin Wang     2018-04-08   70   * Caution: If the mode is HWLOCK_RAW, that means user must protect the routine
1e6c06a7e88c25 Baolin Wang     2018-04-08   71   * of getting hardware lock with mutex or spinlock. Since in some scenarios,
1e6c06a7e88c25 Baolin Wang     2018-04-08   72   * user need some time-consuming or sleepable operations under the hardware
1e6c06a7e88c25 Baolin Wang     2018-04-08   73   * lock, they need one sleepable lock (like mutex) to protect the operations.
1e6c06a7e88c25 Baolin Wang     2018-04-08   74   *
360aa640a59f26 Fabien Dessenne 2019-03-07   75   * If the mode is neither HWLOCK_IN_ATOMIC nor HWLOCK_RAW, upon a successful
360aa640a59f26 Fabien Dessenne 2019-03-07   76   * return from this function, preemption (and possibly interrupts) is disabled,
360aa640a59f26 Fabien Dessenne 2019-03-07   77   * so the caller must not sleep, and is advised to release the hwspinlock as
360aa640a59f26 Fabien Dessenne 2019-03-07   78   * soon as possible. This is required in order to minimize remote cores polling
360aa640a59f26 Fabien Dessenne 2019-03-07   79   * on the hardware interconnect.
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   80   *
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   81   * The user decides whether local interrupts are disabled or not, and if yes,
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   82   * whether he wants their previous state to be saved. It is up to the user
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   83   * to choose the appropriate @mode of operation, exactly the same way users
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   84   * should decide between spin_trylock, spin_trylock_irq and
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   85   * spin_trylock_irqsave.
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   86   *
bcd0f5d18b0b11 Randy Dunlap    2023-12-05   87   * Returns: %0 if we successfully locked the hwspinlock or -EBUSY if
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   88   * the hwspinlock was already taken.
bcd0f5d18b0b11 Randy Dunlap    2023-12-05   89   *
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   90   * This function will never sleep.
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   91   */
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   92  int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   93  {
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   94  	int ret;
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   95  
b2547dce4d4a23 Baolin Wang     2019-10-14   96  	if (WARN_ON(!hwlock || (!flags && mode == HWLOCK_IRQSTATE)))
b2547dce4d4a23 Baolin Wang     2019-10-14   97  		return -EINVAL;
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   98  
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17   99  	/*
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  100  	 * This spin_lock{_irq, _irqsave} serves three purposes:
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  101  	 *
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  102  	 * 1. Disable preemption, in order to minimize the period of time
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  103  	 *    in which the hwspinlock is taken. This is important in order
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  104  	 *    to minimize the possible polling on the hardware interconnect
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  105  	 *    by a remote user of this lock.
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  106  	 * 2. Make the hwspinlock SMP-safe (so we can take it from
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  107  	 *    additional contexts on the local host).
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  108  	 * 3. Ensure that in_atomic/might_sleep checks catch potential
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  109  	 *    problems with hwspinlock usage (e.g. scheduler checks like
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  110  	 *    'scheduling while atomic' etc.)
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  111  	 */
66742b19e5e0d0 Baolin Wang     2018-04-08  112  	switch (mode) {
66742b19e5e0d0 Baolin Wang     2018-04-08  113  	case HWLOCK_IRQSTATE:
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  114  		ret = spin_trylock_irqsave(&hwlock->lock, *flags);
66742b19e5e0d0 Baolin Wang     2018-04-08  115  		break;
66742b19e5e0d0 Baolin Wang     2018-04-08  116  	case HWLOCK_IRQ:
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  117  		ret = spin_trylock_irq(&hwlock->lock);
66742b19e5e0d0 Baolin Wang     2018-04-08  118  		break;
1e6c06a7e88c25 Baolin Wang     2018-04-08  119  	case HWLOCK_RAW:
360aa640a59f26 Fabien Dessenne 2019-03-07  120  	case HWLOCK_IN_ATOMIC:
1e6c06a7e88c25 Baolin Wang     2018-04-08  121  		ret = 1;
1e6c06a7e88c25 Baolin Wang     2018-04-08  122  		break;
66742b19e5e0d0 Baolin Wang     2018-04-08  123  	default:
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  124  		ret = spin_trylock(&hwlock->lock);
66742b19e5e0d0 Baolin Wang     2018-04-08  125  		break;
66742b19e5e0d0 Baolin Wang     2018-04-08  126  	}
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  127  
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  128  	/* is lock already taken by another context on the local cpu ? */
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  129  	if (!ret)
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  130  		return -EBUSY;
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  131  
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  132  	/* try to take the hwspinlock device */
300bab9770e2bd Ohad Ben-Cohen  2011-09-06  133  	ret = hwlock->bank->ops->trylock(hwlock);
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  134  
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  135  	/* if hwlock is already taken, undo spin_trylock_* and exit */
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  136  	if (!ret) {
66742b19e5e0d0 Baolin Wang     2018-04-08  137  		switch (mode) {
66742b19e5e0d0 Baolin Wang     2018-04-08  138  		case HWLOCK_IRQSTATE:
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17 @139  			spin_unlock_irqrestore(&hwlock->lock, *flags);
66742b19e5e0d0 Baolin Wang     2018-04-08  140  			break;
66742b19e5e0d0 Baolin Wang     2018-04-08  141  		case HWLOCK_IRQ:
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  142  			spin_unlock_irq(&hwlock->lock);
66742b19e5e0d0 Baolin Wang     2018-04-08  143  			break;
1e6c06a7e88c25 Baolin Wang     2018-04-08  144  		case HWLOCK_RAW:
360aa640a59f26 Fabien Dessenne 2019-03-07  145  		case HWLOCK_IN_ATOMIC:
1e6c06a7e88c25 Baolin Wang     2018-04-08  146  			/* Nothing to do */
1e6c06a7e88c25 Baolin Wang     2018-04-08  147  			break;
66742b19e5e0d0 Baolin Wang     2018-04-08  148  		default:
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  149  			spin_unlock(&hwlock->lock);
66742b19e5e0d0 Baolin Wang     2018-04-08  150  			break;
66742b19e5e0d0 Baolin Wang     2018-04-08  151  		}
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  152  
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  153  		return -EBUSY;
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  154  	}
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  155  
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  156  	/*
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  157  	 * We can be sure the other core's memory operations
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  158  	 * are observable to us only _after_ we successfully take
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  159  	 * the hwspinlock, and we must make sure that subsequent memory
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  160  	 * operations (both reads and writes) will not be reordered before
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  161  	 * we actually took the hwspinlock.
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  162  	 *
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  163  	 * Note: the implicit memory barrier of the spinlock above is too
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  164  	 * early, so we need this additional explicit memory barrier.
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  165  	 */
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  166  	mb();
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  167  
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  168  	return 0;
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  169  }
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  170  EXPORT_SYMBOL_GPL(__hwspin_trylock);
bd9a4c7df256ce Ohad Ben-Cohen  2011-02-17  171  

:::::: The code at line 139 was first introduced by commit
:::::: bd9a4c7df256cee4e9f6a4b56baa3b89d63f0f1e drivers: hwspinlock: add framework

:::::: TO: Ohad Ben-Cohen <ohad@wizery.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
