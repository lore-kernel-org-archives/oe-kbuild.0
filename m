Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8F12AEE4
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Oct 2025 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760354121; cv=none; b=U8fLhejjmHLKWDf3vdI2yQg8OiFO+YYeYDF6IOHvWOHw/XVEZqYgNoY2ukzINS+hvk3noxgc8wWC9sALm8xbZeMYby+WSaLckTQbDEnpLDloknKAvubNr8PvTI/0FXnh0QldzJ+EOZYgZs+RO5nIjEA3JasUyOAdfV8dawrnN3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760354121; c=relaxed/simple;
	bh=MklD9NBF0bALoZsPAxM5uykLjLuw9Ftt6TiEQLRIvQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jl6Zca665u1ZWMgiNlyQ2FcFzbN1+J2YQuRNl4rHLPfnktpsg9eg2UFZE1MEXSLb5AOFIjSDa5H9ZQFr00Em4kzkz/SlBCHLIk0o9yvAJ5PGGNGvI4JkW3wzFB+2Bvz3fdqkm5EXxO+ia2820eOQV4ADk/KYhatCCJ4jS8ormkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ig1J1F6A; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ig1J1F6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760354119; x=1791890119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MklD9NBF0bALoZsPAxM5uykLjLuw9Ftt6TiEQLRIvQU=;
  b=Ig1J1F6ACDO78o/aRlMqqtKiAqgc0t+YDpvC4INg/xtstxyfTGg43Gu4
   hA8T5DlI8Pvb0Ks0TjUScDp36jTVeTh/MiHb1/duFyI7Dmn9L5sRaR24e
   S7FnQQPgrj+LYkSnGRTihzWIjX8Ok+0KQPLR0SnvinwU01md8spzMvtGX
   N6Rl8TATuxJXP73E5rDq53QL6npXMvhBFEBuc8ta66Ork9VuYB6WlGI+M
   795lbOjlIt684DBF9GU06w0Ny2Ket/r4CSKx2La8pp9+2uWrz2i/9Ao6W
   dHwlM7z2A4fIzOAJQ5N/tHvX2C6AO3eq+xVPYknWbDhMJfD6MzFLVAxu5
   w==;
X-CSE-ConnectionGUID: /R9nC7DRSI2kBe2sQmsafw==
X-CSE-MsgGUID: FmicnY1WQsmuLhBiyBlODg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66315068"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66315068"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 04:15:18 -0700
X-CSE-ConnectionGUID: kROVZm4kQoWEpO23F8vejA==
X-CSE-MsgGUID: vq9Hi9mPSQ2ESh3mMwH+1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="181584709"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 13 Oct 2025 04:15:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8GWI-0000O7-24;
	Mon, 13 Oct 2025 11:15:14 +0000
Date: Mon, 13 Oct 2025 19:14:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:master 460/569] fs/bcachefs/util/six.c:204
 __do_six_trylock() error: uninitialized symbol 'old'.
Message-ID: <202510131846.4zWlxnIg-lkp@intel.com>
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
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   ab6262d0e3688744f5ecdd6086e0c15e3ec22c79
commit: 4508362ccc8225ee767c69a7f3bfb545d96db594 [460/569] bcachefs: move utility code to subdir
:::::: branch date: 2 hours ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20251013 (https://download.01.org/0day-ci/archive/20251013/202510131846.4zWlxnIg-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510131846.4zWlxnIg-lkp@intel.com/

smatch warnings:
fs/bcachefs/util/six.c:204 __do_six_trylock() error: uninitialized symbol 'old'.
fs/bcachefs/util/rcu_pending.c:515 __rcu_pending_enqueue() error: we previously assumed 'head' could be null (see line 468)

vim +/old +204 fs/bcachefs/util/six.c

1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  107  
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  108  /*
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  109   * __do_six_trylock() - main trylock routine
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  110   *
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  111   * Returns 1 on success, 0 on failure
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  112   *
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  113   * In percpu reader mode, a failed trylock may cause a spurious trylock failure
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  114   * for anoter thread taking the competing lock type, and we may havve to do a
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  115   * wakeup: when a wakeup is required, we return -1 - wakeup_type.
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  116   */
91d16f16d0fd4b fs/bcachefs/six.c Kent Overstreet 2023-05-21  117  static int __do_six_trylock(struct six_lock *lock, enum six_lock_type type,
91d16f16d0fd4b fs/bcachefs/six.c Kent Overstreet 2023-05-21  118  			    struct task_struct *task, bool try)
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  119  {
84a37cbf62e044 fs/bcachefs/six.c Kent Overstreet 2022-08-26  120  	int ret;
2d9200cfe004b8 fs/bcachefs/six.c Kent Overstreet 2023-05-25  121  	u32 old;
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  122  
84a37cbf62e044 fs/bcachefs/six.c Kent Overstreet 2022-08-26  123  	EBUG_ON(type == SIX_LOCK_write && lock->owner != task);
1fb4fe63178881 fs/bcachefs/six.c Kent Overstreet 2023-05-20  124  	EBUG_ON(type == SIX_LOCK_write &&
2ab62310fd1c72 fs/bcachefs/six.c Kent Overstreet 2023-05-22  125  		(try != !(atomic_read(&lock->state) & SIX_LOCK_HELD_write)));
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  126  
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  127  	/*
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  128  	 * Percpu reader mode:
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  129  	 *
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  130  	 * The basic idea behind this algorithm is that you can implement a lock
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  131  	 * between two threads without any atomics, just memory barriers:
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  132  	 *
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  133  	 * For two threads you'll need two variables, one variable for "thread a
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  134  	 * has the lock" and another for "thread b has the lock".
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  135  	 *
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  136  	 * To take the lock, a thread sets its variable indicating that it holds
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  137  	 * the lock, then issues a full memory barrier, then reads from the
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  138  	 * other thread's variable to check if the other thread thinks it has
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  139  	 * the lock. If we raced, we backoff and retry/sleep.
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  140  	 *
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  141  	 * Failure to take the lock may cause a spurious trylock failure in
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  142  	 * another thread, because we temporarily set the lock to indicate that
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  143  	 * we held it. This would be a problem for a thread in six_lock(), when
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  144  	 * they are calling trylock after adding themself to the waitlist and
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  145  	 * prior to sleeping.
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  146  	 *
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  147  	 * Therefore, if we fail to get the lock, and there were waiters of the
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  148  	 * type we conflict with, we will have to issue a wakeup.
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  149  	 *
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  150  	 * Since we may be called under wait_lock (and by the wakeup code
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  151  	 * itself), we return that the wakeup has to be done instead of doing it
37f612bea5bd92 fs/bcachefs/six.c Kent Overstreet 2023-05-21  152  	 * here.
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  153  	 */
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  154  	if (type == SIX_LOCK_read && lock->readers) {
8da653281247ec fs/bcachefs/six.c Kent Overstreet 2025-07-14  155  		scoped_guard(preempt) {
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  156  			this_cpu_inc(*lock->readers); /* signal that we own lock */
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  157  
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  158  			smp_mb();
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  159  
2804d0f15bda38 fs/bcachefs/six.c Kent Overstreet 2023-05-22  160  			old = atomic_read(&lock->state);
1fb4fe63178881 fs/bcachefs/six.c Kent Overstreet 2023-05-20  161  			ret = !(old & l[type].lock_fail);
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  162  
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  163  			this_cpu_sub(*lock->readers, !ret);
8da653281247ec fs/bcachefs/six.c Kent Overstreet 2025-07-14  164  		}
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  165  
61b85cb0d77311 fs/bcachefs/six.c Kent Overstreet 2023-11-14  166  		if (!ret) {
61b85cb0d77311 fs/bcachefs/six.c Kent Overstreet 2023-11-14  167  			smp_mb();
61b85cb0d77311 fs/bcachefs/six.c Kent Overstreet 2023-11-14  168  			if (atomic_read(&lock->state) & SIX_LOCK_WAITING_write)
84a37cbf62e044 fs/bcachefs/six.c Kent Overstreet 2022-08-26  169  				ret = -1 - SIX_LOCK_write;
61b85cb0d77311 fs/bcachefs/six.c Kent Overstreet 2023-11-14  170  		}
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  171  	} else if (type == SIX_LOCK_write && lock->readers) {
e057a290ef715d fs/bcachefs/six.c Alan Huang      2024-08-27  172  		if (try)
2ab62310fd1c72 fs/bcachefs/six.c Kent Overstreet 2023-05-22  173  			atomic_add(SIX_LOCK_HELD_write, &lock->state);
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  174  
e057a290ef715d fs/bcachefs/six.c Alan Huang      2024-08-27  175  		/*
e057a290ef715d fs/bcachefs/six.c Alan Huang      2024-08-27  176  		 * Make sure atomic_add happens before pcpu_read_count and
e057a290ef715d fs/bcachefs/six.c Alan Huang      2024-08-27  177  		 * six_set_bitmask in slow path happens before pcpu_read_count.
e057a290ef715d fs/bcachefs/six.c Alan Huang      2024-08-27  178  		 *
e057a290ef715d fs/bcachefs/six.c Alan Huang      2024-08-27  179  		 * Paired with the smp_mb() in read lock fast path (per-cpu mode)
e057a290ef715d fs/bcachefs/six.c Alan Huang      2024-08-27  180  		 * and the one before atomic_read in read unlock path.
e057a290ef715d fs/bcachefs/six.c Alan Huang      2024-08-27  181  		 */
e057a290ef715d fs/bcachefs/six.c Alan Huang      2024-08-27  182  		smp_mb();
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  183  		ret = !pcpu_read_count(lock);
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  184  
b60c8e9e7b082a fs/bcachefs/six.c Kent Overstreet 2023-06-16  185  		if (try && !ret) {
2ab62310fd1c72 fs/bcachefs/six.c Kent Overstreet 2023-05-22  186  			old = atomic_sub_return(SIX_LOCK_HELD_write, &lock->state);
2ab62310fd1c72 fs/bcachefs/six.c Kent Overstreet 2023-05-22  187  			if (old & SIX_LOCK_WAITING_read)
84a37cbf62e044 fs/bcachefs/six.c Kent Overstreet 2022-08-26  188  				ret = -1 - SIX_LOCK_read;
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  189  		}
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  190  	} else {
2d9200cfe004b8 fs/bcachefs/six.c Kent Overstreet 2023-05-25  191  		old = atomic_read(&lock->state);
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  192  		do {
b60c8e9e7b082a fs/bcachefs/six.c Kent Overstreet 2023-06-16  193  			ret = !(old & l[type].lock_fail);
2ab62310fd1c72 fs/bcachefs/six.c Kent Overstreet 2023-05-22  194  			if (!ret || (type == SIX_LOCK_write && !try)) {
2ab62310fd1c72 fs/bcachefs/six.c Kent Overstreet 2023-05-22  195  				smp_mb();
d2c86b77de5894 fs/bcachefs/six.c Kent Overstreet 2023-05-20  196  				break;
2ab62310fd1c72 fs/bcachefs/six.c Kent Overstreet 2023-05-22  197  			}
2d9200cfe004b8 fs/bcachefs/six.c Kent Overstreet 2023-05-25  198  		} while (!atomic_try_cmpxchg_acquire(&lock->state, &old, old + l[type].lock_val));
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  199  
2804d0f15bda38 fs/bcachefs/six.c Kent Overstreet 2023-05-22  200  		EBUG_ON(ret && !(atomic_read(&lock->state) & l[type].held_mask));
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  201  	}
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  202  
84a37cbf62e044 fs/bcachefs/six.c Kent Overstreet 2022-08-26  203  	if (ret > 0)
84a37cbf62e044 fs/bcachefs/six.c Kent Overstreet 2022-08-26 @204  		six_set_owner(lock, type, old, task);
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  205  
b60c8e9e7b082a fs/bcachefs/six.c Kent Overstreet 2023-06-16  206  	EBUG_ON(type == SIX_LOCK_write && try && ret <= 0 &&
2ab62310fd1c72 fs/bcachefs/six.c Kent Overstreet 2023-05-22  207  		(atomic_read(&lock->state) & SIX_LOCK_HELD_write));
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  208  
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  209  	return ret;
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  210  }
1c6fdbd8f2465d fs/bcachefs/six.c Kent Overstreet 2017-03-16  211  

:::::: The code at line 204 was first introduced by commit
:::::: 84a37cbf62e04480607ddd1940e3d8ce65b3828d six locks: Wakeup now takes lock on behalf of waiter

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
