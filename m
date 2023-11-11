Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B36366
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Nov 2023 22:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llRWjPH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699743372; x=1731279372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bLpY1xbIYhVCXtZZrJlNvDYgeN7OACuJ0DDYkMHvT/w=;
  b=llRWjPH0ZKxk7/5qpJc+wEYSSVNdCfHB9gnFrYaPXrJuBnS0eft+/sno
   49YLoxnnwfwpnQDG845Z/uOqGGjsR8r2TkpkATXbnn/hLmvgi2/g1tmfC
   3Pg2MmV+DSQpxueaW344BTqBrfsmyqaRI5u052jPlht2aDzb/1ZoA+eNH
   bDUpNg0MQqpWUZJ+PxRbkpQemFq/u/xhrC4xTr4AEo1WxBomryHwAGvTS
   5dfAPBk8IBdlYROitnOuvwVtdOmoGIOj0yMNTcdOp2WJimwFZFjn0Nowo
   1DbPvifu7/WsRrQdgfohgveQQJVxJ5pXHg9ustXKPUagjq5rkxm7IZTta
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="375329047"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="375329047"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 14:56:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="12135529"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Nov 2023 14:56:10 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1wtc-000Any-1k;
	Sat, 11 Nov 2023 22:56:08 +0000
Date: Sun, 12 Nov 2023 06:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hwspinlock/hwspinlock_core.c:180: warning: Function
 parameter or member 'to' not described in '__hwspin_lock_timeout'
Message-ID: <202311120622.zCLkxQeD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vincent Legoll <vincent.legoll@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: 35fc8a07d7f921333311662590765af5645fd3e4 Make HWSPINLOCK a menuconfig to ease disabling
date:   6 years ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 years ago
config: x86_64-randconfig-r035-20230822 (https://download.01.org/0day-ci/archive/20231112/202311120622.zCLkxQeD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120622.zCLkxQeD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311120622.zCLkxQeD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwspinlock/hwspinlock_core.c:180: warning: Function parameter or member 'to' not described in '__hwspin_lock_timeout'
>> drivers/hwspinlock/hwspinlock_core.c:180: warning: Excess function parameter 'timeout' description in '__hwspin_lock_timeout'
>> drivers/hwspinlock/hwspinlock_core.c:274: warning: Excess function parameter 'bank' description in 'of_hwspin_lock_simple_xlate'
>> drivers/hwspinlock/hwspinlock_core.c:487: warning: Function parameter or member 'hwlock' not described in '__hwspin_lock_request'


vim +180 drivers/hwspinlock/hwspinlock_core.c

bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  150  
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  151  /**
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  152   * __hwspin_lock_timeout() - lock an hwspinlock with timeout limit
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  153   * @hwlock: the hwspinlock to be locked
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  154   * @timeout: timeout value in msecs
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  155   * @mode: mode which controls whether local interrupts are disabled or not
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  156   * @flags: a pointer to where the caller's interrupt state will be saved at (if
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  157   *         requested)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  158   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  159   * This function locks the given @hwlock. If the @hwlock
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  160   * is already taken, the function will busy loop waiting for it to
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  161   * be released, but give up after @timeout msecs have elapsed.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  162   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  163   * Upon a successful return from this function, preemption is disabled
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  164   * (and possibly local interrupts, too), so the caller must not sleep,
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  165   * and is advised to release the hwspinlock as soon as possible.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  166   * This is required in order to minimize remote cores polling on the
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  167   * hardware interconnect.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  168   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  169   * The user decides whether local interrupts are disabled or not, and if yes,
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  170   * whether he wants their previous state to be saved. It is up to the user
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  171   * to choose the appropriate @mode of operation, exactly the same way users
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  172   * should decide between spin_lock, spin_lock_irq and spin_lock_irqsave.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  173   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  174   * Returns 0 when the @hwlock was successfully taken, and an appropriate
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  175   * error code otherwise (most notably -ETIMEDOUT if the @hwlock is still
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  176   * busy after @timeout msecs). The function will never sleep.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  177   */
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  178  int __hwspin_lock_timeout(struct hwspinlock *hwlock, unsigned int to,
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  179  					int mode, unsigned long *flags)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17 @180  {
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  181  	int ret;
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  182  	unsigned long expire;
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  183  
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  184  	expire = msecs_to_jiffies(to) + jiffies;
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  185  
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  186  	for (;;) {
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  187  		/* Try to take the hwspinlock */
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  188  		ret = __hwspin_trylock(hwlock, mode, flags);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  189  		if (ret != -EBUSY)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  190  			break;
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  191  
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  192  		/*
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  193  		 * The lock is already taken, let's check if the user wants
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  194  		 * us to try again
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  195  		 */
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  196  		if (time_is_before_eq_jiffies(expire))
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  197  			return -ETIMEDOUT;
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  198  
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  199  		/*
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  200  		 * Allow platform-specific relax handlers to prevent
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  201  		 * hogging the interconnect (no sleeping, though)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  202  		 */
300bab9770e2bd Ohad Ben-Cohen 2011-09-06  203  		if (hwlock->bank->ops->relax)
300bab9770e2bd Ohad Ben-Cohen 2011-09-06  204  			hwlock->bank->ops->relax(hwlock);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  205  	}
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  206  
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  207  	return ret;
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  208  }
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  209  EXPORT_SYMBOL_GPL(__hwspin_lock_timeout);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  210  
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  211  /**
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  212   * __hwspin_unlock() - unlock a specific hwspinlock
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  213   * @hwlock: a previously-acquired hwspinlock which we want to unlock
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  214   * @mode: controls whether local interrupts needs to be restored or not
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  215   * @flags: previous caller's interrupt state to restore (if requested)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  216   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  217   * This function will unlock a specific hwspinlock, enable preemption and
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  218   * (possibly) enable interrupts or restore their previous state.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  219   * @hwlock must be already locked before calling this function: it is a bug
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  220   * to call unlock on a @hwlock that is already unlocked.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  221   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  222   * The user decides whether local interrupts should be enabled or not, and
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  223   * if yes, whether he wants their previous state to be restored. It is up
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  224   * to the user to choose the appropriate @mode of operation, exactly the
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  225   * same way users decide between spin_unlock, spin_unlock_irq and
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  226   * spin_unlock_irqrestore.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  227   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  228   * The function will never sleep.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  229   */
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  230  void __hwspin_unlock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  231  {
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  232  	BUG_ON(!hwlock);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  233  	BUG_ON(!flags && mode == HWLOCK_IRQSTATE);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  234  
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  235  	/*
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  236  	 * We must make sure that memory operations (both reads and writes),
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  237  	 * done before unlocking the hwspinlock, will not be reordered
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  238  	 * after the lock is released.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  239  	 *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  240  	 * That's the purpose of this explicit memory barrier.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  241  	 *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  242  	 * Note: the memory barrier induced by the spin_unlock below is too
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  243  	 * late; the other core is going to access memory soon after it will
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  244  	 * take the hwspinlock, and by then we want to be sure our memory
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  245  	 * operations are already observable.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  246  	 */
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  247  	mb();
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  248  
300bab9770e2bd Ohad Ben-Cohen 2011-09-06  249  	hwlock->bank->ops->unlock(hwlock);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  250  
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  251  	/* Undo the spin_trylock{_irq, _irqsave} called while locking */
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  252  	if (mode == HWLOCK_IRQSTATE)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  253  		spin_unlock_irqrestore(&hwlock->lock, *flags);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  254  	else if (mode == HWLOCK_IRQ)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  255  		spin_unlock_irq(&hwlock->lock);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  256  	else
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  257  		spin_unlock(&hwlock->lock);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  258  }
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  259  EXPORT_SYMBOL_GPL(__hwspin_unlock);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  260  
fb7737e949e31d Suman Anna     2015-03-04  261  /**
fb7737e949e31d Suman Anna     2015-03-04  262   * of_hwspin_lock_simple_xlate - translate hwlock_spec to return a lock id
fb7737e949e31d Suman Anna     2015-03-04  263   * @bank: the hwspinlock device bank
fb7737e949e31d Suman Anna     2015-03-04  264   * @hwlock_spec: hwlock specifier as found in the device tree
fb7737e949e31d Suman Anna     2015-03-04  265   *
fb7737e949e31d Suman Anna     2015-03-04  266   * This is a simple translation function, suitable for hwspinlock platform
fb7737e949e31d Suman Anna     2015-03-04  267   * drivers that only has a lock specifier length of 1.
fb7737e949e31d Suman Anna     2015-03-04  268   *
fb7737e949e31d Suman Anna     2015-03-04  269   * Returns a relative index of the lock within a specified bank on success,
fb7737e949e31d Suman Anna     2015-03-04  270   * or -EINVAL on invalid specifier cell count.
fb7737e949e31d Suman Anna     2015-03-04  271   */
fb7737e949e31d Suman Anna     2015-03-04  272  static inline int
fb7737e949e31d Suman Anna     2015-03-04  273  of_hwspin_lock_simple_xlate(const struct of_phandle_args *hwlock_spec)
fb7737e949e31d Suman Anna     2015-03-04 @274  {
fb7737e949e31d Suman Anna     2015-03-04  275  	if (WARN_ON(hwlock_spec->args_count != 1))
fb7737e949e31d Suman Anna     2015-03-04  276  		return -EINVAL;
fb7737e949e31d Suman Anna     2015-03-04  277  
fb7737e949e31d Suman Anna     2015-03-04  278  	return hwlock_spec->args[0];
fb7737e949e31d Suman Anna     2015-03-04  279  }
fb7737e949e31d Suman Anna     2015-03-04  280  

:::::: The code at line 180 was first introduced by commit
:::::: bd9a4c7df256cee4e9f6a4b56baa3b89d63f0f1e drivers: hwspinlock: add framework

:::::: TO: Ohad Ben-Cohen <ohad@wizery.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
