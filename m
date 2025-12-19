Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41662749C5
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 06:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766124721; cv=none; b=nCH4SOphAYzq4AT3texvhBV+Y2p81di6ukTh0G+5VwE1GSZn1Q99/sxJzt1sI9wZ4lrQt5Jc6Rwn5E7dxVLpdWuVDwWdlJG3eZYDUnSV32+37yLJCJgOW9Ywj310TMAZqNnJeSMjqpb+oajE3mUZ7Ddo8KNAQ5i1bLjWru2eIsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766124721; c=relaxed/simple;
	bh=BTnQ+2ET+ZYFM1gtcMZlgKbsPDH/xO0ml7zyVIBPmDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KQkyGztd7WTULaC2O0Om827q/n4zsSu7/XKsRRMh7cpDUsaomMYyiq/cgECUvIj1SpTu1IHATWOBO8rvKVimoMJNQIqjJWs6QoBdF8KJvNZbzAabNIOC83Yrn+n7bIw4h9i7ApADpnS8pF6oiqLDH27M9N4aJKU8eTt+xGsD2mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FxhIF93g; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FxhIF93g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766124718; x=1797660718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BTnQ+2ET+ZYFM1gtcMZlgKbsPDH/xO0ml7zyVIBPmDg=;
  b=FxhIF93g3OTSuxHLuk6ymn3cKidAbYDgXqpP1B+QFdoF+JQq9djhNAs/
   DBuE5BcUZtrfUgO4dzD3Wq04OMz73IxFDmU+MrNAN3DTjvHoatogaAgnb
   iEysDkGmUEKQQn+SEZ8eNT/W4bQwg/GJWHIfLrlpkq9xJTSaDBrDdpU60
   eVle0qOWC1HqdrPplSaTIVYDh52lFAzxWdq9WdIko0j793KY9Y3Aq+vL/
   Hl4w9GDFGHV5N3LT14Oooq1cwJ+fk2YSDpi+Zy1XtLcdUwExeiOyez31r
   cMda5XqZkZNRuSnmlzvVLepHDp6McS1HFNJSsQQVnxlPlDAGCQNVB+1Nn
   Q==;
X-CSE-ConnectionGUID: roHyZnMaRmiDRhATc3vYeQ==
X-CSE-MsgGUID: Dxvsb4V4RrylodaGraF1LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="90742811"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="90742811"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 22:11:58 -0800
X-CSE-ConnectionGUID: uLJUiuPTSKWviWWbdbuMkg==
X-CSE-MsgGUID: xuwvjC2OTayY93zweEBNKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203872744"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Dec 2025 22:11:57 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWTiU-00000000375-3ERx;
	Fri, 19 Dec 2025 06:11:54 +0000
Date: Fri, 19 Dec 2025 14:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:ctx-analysis/dev 24/36]
 drivers/hwspinlock/hwspinlock_core.c:139 __hwspin_trylock() warn: mixing irq
 and irqsave
Message-ID: <202512191453.1BTMM4mN-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   3b4ba9b3b7c8365712656e62d0ca5a09504b5074
commit: 752b5e42738a61eaad41dd5c0b9352f7a123b43b [24/36] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251218 (https://download.01.org/0day-ci/archive/20251219/202512191453.1BTMM4mN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512191453.1BTMM4mN-lkp@intel.com/

New smatch warnings:
drivers/hwspinlock/hwspinlock_core.c:139 __hwspin_trylock() warn: mixing irq and irqsave
arch/x86/platform/efi/efi_64.c:648 efi_thunk_set_variable_nonblocking() error: uninitialized symbol 'flags'.
arch/x86/platform/efi/efi_64.c:766 efi_thunk_query_variable_info_nonblocking() error: uninitialized symbol 'flags'.

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
