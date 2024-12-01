Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E932AF12
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 15:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733066989; cv=none; b=RzIcON4Wxcn7FJhZ9w6bkVZSZeDSD137DYbh+RiZzgL99/rUAy2ZUY0Tl57g9fXV2Cvsfye/YMyZGn4/DnW1kRRZecXL+JTRkws9SlUEBAgqWDTDr7KI5L6CScCKaoquVHBTRp+mMnAw1g4mD5u/12aNj1twL23v0H9qybjJBow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733066989; c=relaxed/simple;
	bh=BidTRHD6mLzouvX59gLF4Cjtt5Ewj17+OFAa6Hmek0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TTpYQBa0aTKEKJDKfStMXkhRqBuRJPFxoxlY+j3qCQNmbZYLENDFg1XpNasdpHu7zKCj5Wh6XnFiTstjSHvTKSkjFPEP4B8D3U3eXzCbvQ9Eh5PNFr8xU19I1dTA2lJ4jrSrm7qzMr1qDP4QhyFTIpZw93W+OuR0UAnaXGj5sN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLg3Bwdd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLg3Bwdd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733066987; x=1764602987;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BidTRHD6mLzouvX59gLF4Cjtt5Ewj17+OFAa6Hmek0g=;
  b=PLg3BwddySLNdUY0wQNNe3JifcWs3oEhOxLMZBm4WJE0pVEIeQqtyW+d
   w26NoclAVxd0yFEZl+M8nFksRKNVMI4DxWsLkUotwM4qpUT3Iy7BokmN7
   ll101R1ynI3Bk1S0H+gJrBlsHghG9QPKQFn3EMk7m1287PtDMqPlwi4yO
   Q5++F2A1IQ2qcbYz1+rTQDJTsvcUiPuRIJxK4l+CT1mdC/sIWa5qBwoEe
   9gpbkEEgNq7WWlYZrKHUed9np7KZ3xyIWpF8sCci7pseXve0a51i4+0kM
   pPRsb46lK1vkA3qa/uVxN3WWTJ58iA7LQdS324nO5HqOosvBjjt4V3Njb
   Q==;
X-CSE-ConnectionGUID: w1ddcnUmR9Ob9r1nZacdYQ==
X-CSE-MsgGUID: GH+r8CkbTqit9WUNMI31ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="32982962"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="32982962"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 07:29:46 -0800
X-CSE-ConnectionGUID: Dy/qr46vQ0Cjeix65t/r9g==
X-CSE-MsgGUID: ZwQZLHSFQpeXqox0G4OtRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="123753556"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Dec 2024 07:29:45 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHltH-0001ct-0M;
	Sun, 01 Dec 2024 15:29:43 +0000
Date: Sun, 1 Dec 2024 23:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/futex/pi.c:723:3-9: preceding lock on line 821
Message-ID: <202412012316.S5UXgGUb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: "André Almeida" <andrealmeid@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: 85dc28fa4ec058645c29bda952d901b29dfaa0b0 futex: Split out PI futex
date:   3 years, 2 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 years, 2 months ago
config: i386-randconfig-051-20241117 (https://download.01.org/0day-ci/archive/20241201/202412012316.S5UXgGUb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412012316.S5UXgGUb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/futex/pi.c:723:3-9: preceding lock on line 821
   kernel/futex/pi.c:728:3-9: preceding lock on line 821
   kernel/futex/pi.c:755:3-9: preceding lock on line 821
   kernel/futex/pi.c:828:2-8: preceding lock on line 821

vim +723 kernel/futex/pi.c

85dc28fa4ec058 Peter Zijlstra 2021-09-23  682  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  683  static int __fixup_pi_state_owner(u32 __user *uaddr, struct futex_q *q,
85dc28fa4ec058 Peter Zijlstra 2021-09-23  684  				  struct task_struct *argowner)
85dc28fa4ec058 Peter Zijlstra 2021-09-23  685  {
85dc28fa4ec058 Peter Zijlstra 2021-09-23  686  	struct futex_pi_state *pi_state = q->pi_state;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  687  	struct task_struct *oldowner, *newowner;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  688  	u32 uval, curval, newval, newtid;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  689  	int err = 0;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  690  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  691  	oldowner = pi_state->owner;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  692  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  693  	/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  694  	 * We are here because either:
85dc28fa4ec058 Peter Zijlstra 2021-09-23  695  	 *
85dc28fa4ec058 Peter Zijlstra 2021-09-23  696  	 *  - we stole the lock and pi_state->owner needs updating to reflect
85dc28fa4ec058 Peter Zijlstra 2021-09-23  697  	 *    that (@argowner == current),
85dc28fa4ec058 Peter Zijlstra 2021-09-23  698  	 *
85dc28fa4ec058 Peter Zijlstra 2021-09-23  699  	 * or:
85dc28fa4ec058 Peter Zijlstra 2021-09-23  700  	 *
85dc28fa4ec058 Peter Zijlstra 2021-09-23  701  	 *  - someone stole our lock and we need to fix things to point to the
85dc28fa4ec058 Peter Zijlstra 2021-09-23  702  	 *    new owner (@argowner == NULL).
85dc28fa4ec058 Peter Zijlstra 2021-09-23  703  	 *
85dc28fa4ec058 Peter Zijlstra 2021-09-23  704  	 * Either way, we have to replace the TID in the user space variable.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  705  	 * This must be atomic as we have to preserve the owner died bit here.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  706  	 *
85dc28fa4ec058 Peter Zijlstra 2021-09-23  707  	 * Note: We write the user space value _before_ changing the pi_state
85dc28fa4ec058 Peter Zijlstra 2021-09-23  708  	 * because we can fault here. Imagine swapped out pages or a fork
85dc28fa4ec058 Peter Zijlstra 2021-09-23  709  	 * that marked all the anonymous memory readonly for cow.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  710  	 *
85dc28fa4ec058 Peter Zijlstra 2021-09-23  711  	 * Modifying pi_state _before_ the user space value would leave the
85dc28fa4ec058 Peter Zijlstra 2021-09-23  712  	 * pi_state in an inconsistent state when we fault here, because we
85dc28fa4ec058 Peter Zijlstra 2021-09-23  713  	 * need to drop the locks to handle the fault. This might be observed
85dc28fa4ec058 Peter Zijlstra 2021-09-23  714  	 * in the PID checks when attaching to PI state .
85dc28fa4ec058 Peter Zijlstra 2021-09-23  715  	 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  716  retry:
85dc28fa4ec058 Peter Zijlstra 2021-09-23  717  	if (!argowner) {
85dc28fa4ec058 Peter Zijlstra 2021-09-23  718  		if (oldowner != current) {
85dc28fa4ec058 Peter Zijlstra 2021-09-23  719  			/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  720  			 * We raced against a concurrent self; things are
85dc28fa4ec058 Peter Zijlstra 2021-09-23  721  			 * already fixed up. Nothing to do.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  722  			 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23 @723  			return 0;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  724  		}
85dc28fa4ec058 Peter Zijlstra 2021-09-23  725  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  726  		if (__rt_mutex_futex_trylock(&pi_state->pi_mutex)) {
85dc28fa4ec058 Peter Zijlstra 2021-09-23  727  			/* We got the lock. pi_state is correct. Tell caller. */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  728  			return 1;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  729  		}
85dc28fa4ec058 Peter Zijlstra 2021-09-23  730  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  731  		/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  732  		 * The trylock just failed, so either there is an owner or
85dc28fa4ec058 Peter Zijlstra 2021-09-23  733  		 * there is a higher priority waiter than this one.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  734  		 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  735  		newowner = rt_mutex_owner(&pi_state->pi_mutex);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  736  		/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  737  		 * If the higher priority waiter has not yet taken over the
85dc28fa4ec058 Peter Zijlstra 2021-09-23  738  		 * rtmutex then newowner is NULL. We can't return here with
85dc28fa4ec058 Peter Zijlstra 2021-09-23  739  		 * that state because it's inconsistent vs. the user space
85dc28fa4ec058 Peter Zijlstra 2021-09-23  740  		 * state. So drop the locks and try again. It's a valid
85dc28fa4ec058 Peter Zijlstra 2021-09-23  741  		 * situation and not any different from the other retry
85dc28fa4ec058 Peter Zijlstra 2021-09-23  742  		 * conditions.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  743  		 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  744  		if (unlikely(!newowner)) {
85dc28fa4ec058 Peter Zijlstra 2021-09-23  745  			err = -EAGAIN;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  746  			goto handle_err;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  747  		}
85dc28fa4ec058 Peter Zijlstra 2021-09-23  748  	} else {
85dc28fa4ec058 Peter Zijlstra 2021-09-23  749  		WARN_ON_ONCE(argowner != current);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  750  		if (oldowner == current) {
85dc28fa4ec058 Peter Zijlstra 2021-09-23  751  			/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  752  			 * We raced against a concurrent self; things are
85dc28fa4ec058 Peter Zijlstra 2021-09-23  753  			 * already fixed up. Nothing to do.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  754  			 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  755  			return 1;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  756  		}
85dc28fa4ec058 Peter Zijlstra 2021-09-23  757  		newowner = argowner;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  758  	}
85dc28fa4ec058 Peter Zijlstra 2021-09-23  759  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  760  	newtid = task_pid_vnr(newowner) | FUTEX_WAITERS;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  761  	/* Owner died? */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  762  	if (!pi_state->owner)
85dc28fa4ec058 Peter Zijlstra 2021-09-23  763  		newtid |= FUTEX_OWNER_DIED;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  764  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  765  	err = futex_get_value_locked(&uval, uaddr);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  766  	if (err)
85dc28fa4ec058 Peter Zijlstra 2021-09-23  767  		goto handle_err;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  768  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  769  	for (;;) {
85dc28fa4ec058 Peter Zijlstra 2021-09-23  770  		newval = (uval & FUTEX_OWNER_DIED) | newtid;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  771  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  772  		err = futex_cmpxchg_value_locked(&curval, uaddr, uval, newval);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  773  		if (err)
85dc28fa4ec058 Peter Zijlstra 2021-09-23  774  			goto handle_err;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  775  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  776  		if (curval == uval)
85dc28fa4ec058 Peter Zijlstra 2021-09-23  777  			break;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  778  		uval = curval;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  779  	}
85dc28fa4ec058 Peter Zijlstra 2021-09-23  780  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  781  	/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  782  	 * We fixed up user space. Now we need to fix the pi_state
85dc28fa4ec058 Peter Zijlstra 2021-09-23  783  	 * itself.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  784  	 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  785  	pi_state_update_owner(pi_state, newowner);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  786  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  787  	return argowner == current;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  788  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  789  	/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  790  	 * In order to reschedule or handle a page fault, we need to drop the
85dc28fa4ec058 Peter Zijlstra 2021-09-23  791  	 * locks here. In the case of a fault, this gives the other task
85dc28fa4ec058 Peter Zijlstra 2021-09-23  792  	 * (either the highest priority waiter itself or the task which stole
85dc28fa4ec058 Peter Zijlstra 2021-09-23  793  	 * the rtmutex) the chance to try the fixup of the pi_state. So once we
85dc28fa4ec058 Peter Zijlstra 2021-09-23  794  	 * are back from handling the fault we need to check the pi_state after
85dc28fa4ec058 Peter Zijlstra 2021-09-23  795  	 * reacquiring the locks and before trying to do another fixup. When
85dc28fa4ec058 Peter Zijlstra 2021-09-23  796  	 * the fixup has been done already we simply return.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  797  	 *
85dc28fa4ec058 Peter Zijlstra 2021-09-23  798  	 * Note: we hold both hb->lock and pi_mutex->wait_lock. We can safely
85dc28fa4ec058 Peter Zijlstra 2021-09-23  799  	 * drop hb->lock since the caller owns the hb -> futex_q relation.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  800  	 * Dropping the pi_mutex->wait_lock requires the state revalidate.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  801  	 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  802  handle_err:
85dc28fa4ec058 Peter Zijlstra 2021-09-23  803  	raw_spin_unlock_irq(&pi_state->pi_mutex.wait_lock);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  804  	spin_unlock(q->lock_ptr);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  805  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  806  	switch (err) {
85dc28fa4ec058 Peter Zijlstra 2021-09-23  807  	case -EFAULT:
85dc28fa4ec058 Peter Zijlstra 2021-09-23  808  		err = fault_in_user_writeable(uaddr);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  809  		break;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  810  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  811  	case -EAGAIN:
85dc28fa4ec058 Peter Zijlstra 2021-09-23  812  		cond_resched();
85dc28fa4ec058 Peter Zijlstra 2021-09-23  813  		err = 0;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  814  		break;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  815  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  816  	default:
85dc28fa4ec058 Peter Zijlstra 2021-09-23  817  		WARN_ON_ONCE(1);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  818  		break;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  819  	}
85dc28fa4ec058 Peter Zijlstra 2021-09-23  820  
85dc28fa4ec058 Peter Zijlstra 2021-09-23 @821  	spin_lock(q->lock_ptr);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  822  	raw_spin_lock_irq(&pi_state->pi_mutex.wait_lock);
85dc28fa4ec058 Peter Zijlstra 2021-09-23  823  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  824  	/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  825  	 * Check if someone else fixed it for us:
85dc28fa4ec058 Peter Zijlstra 2021-09-23  826  	 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  827  	if (pi_state->owner != oldowner)
85dc28fa4ec058 Peter Zijlstra 2021-09-23  828  		return argowner == current;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  829  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  830  	/* Retry if err was -EAGAIN or the fault in succeeded */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  831  	if (!err)
85dc28fa4ec058 Peter Zijlstra 2021-09-23  832  		goto retry;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  833  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  834  	/*
85dc28fa4ec058 Peter Zijlstra 2021-09-23  835  	 * fault_in_user_writeable() failed so user state is immutable. At
85dc28fa4ec058 Peter Zijlstra 2021-09-23  836  	 * best we can make the kernel state consistent but user state will
85dc28fa4ec058 Peter Zijlstra 2021-09-23  837  	 * be most likely hosed and any subsequent unlock operation will be
85dc28fa4ec058 Peter Zijlstra 2021-09-23  838  	 * rejected due to PI futex rule [10].
85dc28fa4ec058 Peter Zijlstra 2021-09-23  839  	 *
85dc28fa4ec058 Peter Zijlstra 2021-09-23  840  	 * Ensure that the rtmutex owner is also the pi_state owner despite
85dc28fa4ec058 Peter Zijlstra 2021-09-23  841  	 * the user space value claiming something different. There is no
85dc28fa4ec058 Peter Zijlstra 2021-09-23  842  	 * point in unlocking the rtmutex if current is the owner as it
85dc28fa4ec058 Peter Zijlstra 2021-09-23  843  	 * would need to wait until the next waiter has taken the rtmutex
85dc28fa4ec058 Peter Zijlstra 2021-09-23  844  	 * to guarantee consistent state. Keep it simple. Userspace asked
85dc28fa4ec058 Peter Zijlstra 2021-09-23  845  	 * for this wreckaged state.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  846  	 *
85dc28fa4ec058 Peter Zijlstra 2021-09-23  847  	 * The rtmutex has an owner - either current or some other
85dc28fa4ec058 Peter Zijlstra 2021-09-23  848  	 * task. See the EAGAIN loop above.
85dc28fa4ec058 Peter Zijlstra 2021-09-23  849  	 */
85dc28fa4ec058 Peter Zijlstra 2021-09-23  850  	pi_state_update_owner(pi_state, rt_mutex_owner(&pi_state->pi_mutex));
85dc28fa4ec058 Peter Zijlstra 2021-09-23  851  
85dc28fa4ec058 Peter Zijlstra 2021-09-23  852  	return err;
85dc28fa4ec058 Peter Zijlstra 2021-09-23  853  }
85dc28fa4ec058 Peter Zijlstra 2021-09-23  854  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
