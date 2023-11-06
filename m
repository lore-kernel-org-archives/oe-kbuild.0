Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9489F7465
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C86i9Uj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699282494; x=1730818494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mVdEreQ7v/AVzPf/nu5yH569S51WuZKQla5nDgAoBiI=;
  b=C86i9Uj5ExDfxkZpUEutbUtyS+70OjrV9xsxCcpDMUITOaIoXGxNFMO1
   ki1Ys1jFQDXahpePbUFbjEG3BAKaACg5LX9zA+UAEHjIk/u1PFRB/f0BA
   N0xj4jFn3pz1VV/Q3IRP52wmKYM+XafHjj2CIESkIFWKTkzFfvdki0bii
   Y1CcXDbEIbsQtD7u45m5nSmNS2ktR7kRoxQEftgOdFGApqkCvAenwGm41
   PYqebeT5cDvL/bvHRbvv70eIUENWU4E5+Ebv9B3mOAtLrzilWzbeZdCHB
   C8VXIdBCzlWQNG5Kiaf57CrNvlvHGX9NdZ8zs1Vo3EjdWMszMuRWXHnXq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="379680552"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="379680552"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 06:54:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="828239883"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="828239883"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Nov 2023 06:54:52 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0106-0006UK-16;
	Mon, 06 Nov 2023 14:54:50 +0000
Date: Mon, 6 Nov 2023 22:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/six.c:283 __do_six_trylock() error: uninitialized symbol
 'old'.
Message-ID: <202311062227.0GUulHgD-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: b60c8e9e7b082abac290ebdb9166b806e7d83fb7 six locks: lock->state.seq no longer used for write lock held
date:   2 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231106/202311062227.0GUulHgD-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311062227.0GUulHgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311062227.0GUulHgD-lkp@intel.com/

New smatch warnings:
fs/bcachefs/six.c:283 __do_six_trylock() error: uninitialized symbol 'old'.

Old smatch warnings:
fs/bcachefs/six.c:617 six_lock_slowpath() error: uninitialized symbol 'old'.

vim +/old +283 fs/bcachefs/six.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  189  
37f612bea5bd92 Kent Overstreet 2023-05-21  190  /*
37f612bea5bd92 Kent Overstreet 2023-05-21  191   * __do_six_trylock() - main trylock routine
37f612bea5bd92 Kent Overstreet 2023-05-21  192   *
37f612bea5bd92 Kent Overstreet 2023-05-21  193   * Returns 1 on success, 0 on failure
37f612bea5bd92 Kent Overstreet 2023-05-21  194   *
37f612bea5bd92 Kent Overstreet 2023-05-21  195   * In percpu reader mode, a failed trylock may cause a spurious trylock failure
37f612bea5bd92 Kent Overstreet 2023-05-21  196   * for anoter thread taking the competing lock type, and we may havve to do a
37f612bea5bd92 Kent Overstreet 2023-05-21  197   * wakeup: when a wakeup is required, we return -1 - wakeup_type.
37f612bea5bd92 Kent Overstreet 2023-05-21  198   */
91d16f16d0fd4b Kent Overstreet 2023-05-21  199  static int __do_six_trylock(struct six_lock *lock, enum six_lock_type type,
91d16f16d0fd4b Kent Overstreet 2023-05-21  200  			    struct task_struct *task, bool try)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  201  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  202  	const struct six_lock_vals l[] = LOCK_VALS;
84a37cbf62e044 Kent Overstreet 2022-08-26  203  	int ret;
1fb4fe63178881 Kent Overstreet 2023-05-20  204  	u64 old, new, v;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  205  
84a37cbf62e044 Kent Overstreet 2022-08-26  206  	EBUG_ON(type == SIX_LOCK_write && lock->owner != task);
1fb4fe63178881 Kent Overstreet 2023-05-20  207  	EBUG_ON(type == SIX_LOCK_write &&
b60c8e9e7b082a Kent Overstreet 2023-06-16  208  		(try != !(atomic64_read(&lock->state) & SIX_LOCK_HELD_write)));
1fb4fe63178881 Kent Overstreet 2023-05-20  209  	EBUG_ON(type == SIX_LOCK_write &&
b60c8e9e7b082a Kent Overstreet 2023-06-16  210  		(try != !(atomic64_read(&lock->state) & SIX_STATE_WRITE_LOCK)));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  211  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  212  	/*
1c6fdbd8f2465d Kent Overstreet 2017-03-16  213  	 * Percpu reader mode:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  214  	 *
1c6fdbd8f2465d Kent Overstreet 2017-03-16  215  	 * The basic idea behind this algorithm is that you can implement a lock
1c6fdbd8f2465d Kent Overstreet 2017-03-16  216  	 * between two threads without any atomics, just memory barriers:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  217  	 *
1c6fdbd8f2465d Kent Overstreet 2017-03-16  218  	 * For two threads you'll need two variables, one variable for "thread a
1c6fdbd8f2465d Kent Overstreet 2017-03-16  219  	 * has the lock" and another for "thread b has the lock".
1c6fdbd8f2465d Kent Overstreet 2017-03-16  220  	 *
1c6fdbd8f2465d Kent Overstreet 2017-03-16  221  	 * To take the lock, a thread sets its variable indicating that it holds
1c6fdbd8f2465d Kent Overstreet 2017-03-16  222  	 * the lock, then issues a full memory barrier, then reads from the
1c6fdbd8f2465d Kent Overstreet 2017-03-16  223  	 * other thread's variable to check if the other thread thinks it has
1c6fdbd8f2465d Kent Overstreet 2017-03-16  224  	 * the lock. If we raced, we backoff and retry/sleep.
37f612bea5bd92 Kent Overstreet 2023-05-21  225  	 *
37f612bea5bd92 Kent Overstreet 2023-05-21  226  	 * Failure to take the lock may cause a spurious trylock failure in
37f612bea5bd92 Kent Overstreet 2023-05-21  227  	 * another thread, because we temporarily set the lock to indicate that
37f612bea5bd92 Kent Overstreet 2023-05-21  228  	 * we held it. This would be a problem for a thread in six_lock(), when
37f612bea5bd92 Kent Overstreet 2023-05-21  229  	 * they are calling trylock after adding themself to the waitlist and
37f612bea5bd92 Kent Overstreet 2023-05-21  230  	 * prior to sleeping.
37f612bea5bd92 Kent Overstreet 2023-05-21  231  	 *
37f612bea5bd92 Kent Overstreet 2023-05-21  232  	 * Therefore, if we fail to get the lock, and there were waiters of the
37f612bea5bd92 Kent Overstreet 2023-05-21  233  	 * type we conflict with, we will have to issue a wakeup.
37f612bea5bd92 Kent Overstreet 2023-05-21  234  	 *
37f612bea5bd92 Kent Overstreet 2023-05-21  235  	 * Since we may be called under wait_lock (and by the wakeup code
37f612bea5bd92 Kent Overstreet 2023-05-21  236  	 * itself), we return that the wakeup has to be done instead of doing it
37f612bea5bd92 Kent Overstreet 2023-05-21  237  	 * here.
1c6fdbd8f2465d Kent Overstreet 2017-03-16  238  	 */
1c6fdbd8f2465d Kent Overstreet 2017-03-16  239  	if (type == SIX_LOCK_read && lock->readers) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  240  		preempt_disable();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  241  		this_cpu_inc(*lock->readers); /* signal that we own lock */
1c6fdbd8f2465d Kent Overstreet 2017-03-16  242  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  243  		smp_mb();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  244  
1fb4fe63178881 Kent Overstreet 2023-05-20  245  		old = atomic64_read(&lock->state);
1fb4fe63178881 Kent Overstreet 2023-05-20  246  		ret = !(old & l[type].lock_fail);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  247  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  248  		this_cpu_sub(*lock->readers, !ret);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  249  		preempt_enable();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  250  
37f612bea5bd92 Kent Overstreet 2023-05-21  251  		if (!ret && (old & SIX_STATE_WAITING_WRITE))
84a37cbf62e044 Kent Overstreet 2022-08-26  252  			ret = -1 - SIX_LOCK_write;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  253  	} else if (type == SIX_LOCK_write && lock->readers) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  254  		if (try) {
b60c8e9e7b082a Kent Overstreet 2023-06-16  255  			atomic64_add(SIX_STATE_WRITE_LOCK, &lock->state);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  256  			smp_mb__after_atomic();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  257  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  258  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  259  		ret = !pcpu_read_count(lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  260  
b60c8e9e7b082a Kent Overstreet 2023-06-16  261  		if (try && !ret) {
b60c8e9e7b082a Kent Overstreet 2023-06-16  262  			old = atomic64_sub_return(SIX_STATE_WRITE_LOCK, &lock->state);
b60c8e9e7b082a Kent Overstreet 2023-06-16  263  			if (old & SIX_STATE_WAITING_READ)
84a37cbf62e044 Kent Overstreet 2022-08-26  264  				ret = -1 - SIX_LOCK_read;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  265  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  266  	} else {
1fb4fe63178881 Kent Overstreet 2023-05-20  267  		v = atomic64_read(&lock->state);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  268  		do {
1fb4fe63178881 Kent Overstreet 2023-05-20  269  			new = old = v;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  270  
b60c8e9e7b082a Kent Overstreet 2023-06-16  271  			ret = !(old & l[type].lock_fail);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  272  
b60c8e9e7b082a Kent Overstreet 2023-06-16  273  			if (!ret || (type == SIX_LOCK_write && !try))
d2c86b77de5894 Kent Overstreet 2023-05-20  274  				break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  275  
b60c8e9e7b082a Kent Overstreet 2023-06-16  276  			new += l[type].lock_val;
b60c8e9e7b082a Kent Overstreet 2023-06-16  277  		} while ((v = atomic64_cmpxchg_acquire(&lock->state, old, new)) != old);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  278  
1fb4fe63178881 Kent Overstreet 2023-05-20  279  		EBUG_ON(ret && !(atomic64_read(&lock->state) & l[type].held_mask));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  280  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  281  
84a37cbf62e044 Kent Overstreet 2022-08-26  282  	if (ret > 0)
84a37cbf62e044 Kent Overstreet 2022-08-26 @283  		six_set_owner(lock, type, old, task);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  284  
b60c8e9e7b082a Kent Overstreet 2023-06-16  285  	EBUG_ON(type == SIX_LOCK_write && try && ret <= 0 &&
b60c8e9e7b082a Kent Overstreet 2023-06-16  286  		(atomic64_read(&lock->state) & SIX_STATE_WRITE_LOCK));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  287  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  288  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  289  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  290  

:::::: The code at line 283 was first introduced by commit
:::::: 84a37cbf62e04480607ddd1940e3d8ce65b3828d six locks: Wakeup now takes lock on behalf of waiter

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
