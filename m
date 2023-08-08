Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B591B7C3
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Aug 2023 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691514668; x=1723050668;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ksRG3lq38UVp69JzDQsb2YJg6j3YE/xRTudmgM7tXWY=;
  b=fp8HlOmd8MxnWNuxwiAHAtuB8EU1GNSlMztcqNIqXaRP7ns6qsPIYdvE
   PATvtPTHVa9i67152/6bbEa0Qlaje6Q4RZ1it2AOFCbMMQYl0jTplh2GV
   aYtkL2KaTtb/cL7DjjFK+srin2L2UDqG53fJQiT86m069Mr4LxKp1nVlT
   KLGjXf2JAA17rIpvtQJAwS2oq8rcd4rK1X08zhy6AA3SRFEJJSMS0GjbQ
   OUz3XO1rE0xC7gN5dwnrWFvFD4o2I5vRMCdcMtPulWaEjwMr2anlthQwp
   UtBCMrP8eybTtWHQSJJIlUdxwkdon4pUjd9/C2zd20LzD4d2sWeMI14le
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457279150"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="457279150"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 10:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="855152539"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="855152539"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Aug 2023 10:11:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTQEb-0005UY-1c;
	Tue, 08 Aug 2023 17:11:05 +0000
Date: Wed, 9 Aug 2023 01:11:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6993/7933] kernel/futex/waitwake.c:422
 futex_wait_multiple_setup() warn: bitwise AND condition is false here
Message-ID: <202308090141.sVrgTsDP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Peter Zijlstra <peterz@infradead.org>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   71cd4fc492ec41e4acd85e98bbf7a13753fc1e03
commit: 4a5fb5bbed57575f8e4df73968e6dd4a4fd8c346 [6993/7933] futex: Flag conversion
:::::: branch date: 12 hours ago
:::::: commit date: 23 hours ago
config: riscv-randconfig-m031-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090141.sVrgTsDP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090141.sVrgTsDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308090141.sVrgTsDP-lkp@intel.com/

smatch warnings:
kernel/futex/waitwake.c:422 futex_wait_multiple_setup() warn: bitwise AND condition is false here

vim +422 kernel/futex/waitwake.c

bf69bad38cf63d André Almeida  2021-09-23  382  
bf69bad38cf63d André Almeida  2021-09-23  383  /**
bf69bad38cf63d André Almeida  2021-09-23  384   * futex_wait_multiple_setup - Prepare to wait and enqueue multiple futexes
bf69bad38cf63d André Almeida  2021-09-23  385   * @vs:		The futex list to wait on
bf69bad38cf63d André Almeida  2021-09-23  386   * @count:	The size of the list
bf69bad38cf63d André Almeida  2021-09-23  387   * @woken:	Index of the last woken futex, if any. Used to notify the
bf69bad38cf63d André Almeida  2021-09-23  388   *		caller that it can return this index to userspace (return parameter)
bf69bad38cf63d André Almeida  2021-09-23  389   *
bf69bad38cf63d André Almeida  2021-09-23  390   * Prepare multiple futexes in a single step and enqueue them. This may fail if
bf69bad38cf63d André Almeida  2021-09-23  391   * the futex list is invalid or if any futex was already awoken. On success the
bf69bad38cf63d André Almeida  2021-09-23  392   * task is ready to interruptible sleep.
bf69bad38cf63d André Almeida  2021-09-23  393   *
bf69bad38cf63d André Almeida  2021-09-23  394   * Return:
bf69bad38cf63d André Almeida  2021-09-23  395   *  -  1 - One of the futexes was woken by another thread
bf69bad38cf63d André Almeida  2021-09-23  396   *  -  0 - Success
bf69bad38cf63d André Almeida  2021-09-23  397   *  - <0 - -EFAULT, -EWOULDBLOCK or -EINVAL
bf69bad38cf63d André Almeida  2021-09-23  398   */
bf69bad38cf63d André Almeida  2021-09-23  399  static int futex_wait_multiple_setup(struct futex_vector *vs, int count, int *woken)
bf69bad38cf63d André Almeida  2021-09-23  400  {
bf69bad38cf63d André Almeida  2021-09-23  401  	struct futex_hash_bucket *hb;
bf69bad38cf63d André Almeida  2021-09-23  402  	bool retry = false;
bf69bad38cf63d André Almeida  2021-09-23  403  	int ret, i;
bf69bad38cf63d André Almeida  2021-09-23  404  	u32 uval;
bf69bad38cf63d André Almeida  2021-09-23  405  
bf69bad38cf63d André Almeida  2021-09-23  406  	/*
bf69bad38cf63d André Almeida  2021-09-23  407  	 * Enqueuing multiple futexes is tricky, because we need to enqueue
bf69bad38cf63d André Almeida  2021-09-23  408  	 * each futex on the list before dealing with the next one to avoid
bf69bad38cf63d André Almeida  2021-09-23  409  	 * deadlocking on the hash bucket. But, before enqueuing, we need to
bf69bad38cf63d André Almeida  2021-09-23  410  	 * make sure that current->state is TASK_INTERRUPTIBLE, so we don't
bf69bad38cf63d André Almeida  2021-09-23  411  	 * lose any wake events, which cannot be done before the get_futex_key
bf69bad38cf63d André Almeida  2021-09-23  412  	 * of the next key, because it calls get_user_pages, which can sleep.
bf69bad38cf63d André Almeida  2021-09-23  413  	 * Thus, we fetch the list of futexes keys in two steps, by first
bf69bad38cf63d André Almeida  2021-09-23  414  	 * pinning all the memory keys in the futex key, and only then we read
bf69bad38cf63d André Almeida  2021-09-23  415  	 * each key and queue the corresponding futex.
bf69bad38cf63d André Almeida  2021-09-23  416  	 *
bf69bad38cf63d André Almeida  2021-09-23  417  	 * Private futexes doesn't need to recalculate hash in retry, so skip
bf69bad38cf63d André Almeida  2021-09-23  418  	 * get_futex_key() when retrying.
bf69bad38cf63d André Almeida  2021-09-23  419  	 */
bf69bad38cf63d André Almeida  2021-09-23  420  retry:
bf69bad38cf63d André Almeida  2021-09-23  421  	for (i = 0; i < count; i++) {
4a5fb5bbed5757 Peter Zijlstra 2023-08-07 @422  		if (!(vs[i].w.flags & FLAGS_SHARED) && retry)
bf69bad38cf63d André Almeida  2021-09-23  423  			continue;
bf69bad38cf63d André Almeida  2021-09-23  424  
bf69bad38cf63d André Almeida  2021-09-23  425  		ret = get_futex_key(u64_to_user_ptr(vs[i].w.uaddr),
4a5fb5bbed5757 Peter Zijlstra 2023-08-07  426  				    vs[i].w.flags & FLAGS_SHARED,
bf69bad38cf63d André Almeida  2021-09-23  427  				    &vs[i].q.key, FUTEX_READ);
bf69bad38cf63d André Almeida  2021-09-23  428  
bf69bad38cf63d André Almeida  2021-09-23  429  		if (unlikely(ret))
bf69bad38cf63d André Almeida  2021-09-23  430  			return ret;
bf69bad38cf63d André Almeida  2021-09-23  431  	}
bf69bad38cf63d André Almeida  2021-09-23  432  
f5d39b02080914 Peter Zijlstra 2022-08-22  433  	set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
bf69bad38cf63d André Almeida  2021-09-23  434  
bf69bad38cf63d André Almeida  2021-09-23  435  	for (i = 0; i < count; i++) {
bf69bad38cf63d André Almeida  2021-09-23  436  		u32 __user *uaddr = (u32 __user *)(unsigned long)vs[i].w.uaddr;
bf69bad38cf63d André Almeida  2021-09-23  437  		struct futex_q *q = &vs[i].q;
bf69bad38cf63d André Almeida  2021-09-23  438  		u32 val = (u32)vs[i].w.val;
bf69bad38cf63d André Almeida  2021-09-23  439  
bf69bad38cf63d André Almeida  2021-09-23  440  		hb = futex_q_lock(q);
bf69bad38cf63d André Almeida  2021-09-23  441  		ret = futex_get_value_locked(&uval, uaddr);
bf69bad38cf63d André Almeida  2021-09-23  442  
bf69bad38cf63d André Almeida  2021-09-23  443  		if (!ret && uval == val) {
bf69bad38cf63d André Almeida  2021-09-23  444  			/*
bf69bad38cf63d André Almeida  2021-09-23  445  			 * The bucket lock can't be held while dealing with the
bf69bad38cf63d André Almeida  2021-09-23  446  			 * next futex. Queue each futex at this moment so hb can
bf69bad38cf63d André Almeida  2021-09-23  447  			 * be unlocked.
bf69bad38cf63d André Almeida  2021-09-23  448  			 */
bf69bad38cf63d André Almeida  2021-09-23  449  			futex_queue(q, hb);
bf69bad38cf63d André Almeida  2021-09-23  450  			continue;
bf69bad38cf63d André Almeida  2021-09-23  451  		}
bf69bad38cf63d André Almeida  2021-09-23  452  
bf69bad38cf63d André Almeida  2021-09-23  453  		futex_q_unlock(hb);
bf69bad38cf63d André Almeida  2021-09-23  454  		__set_current_state(TASK_RUNNING);
bf69bad38cf63d André Almeida  2021-09-23  455  
bf69bad38cf63d André Almeida  2021-09-23  456  		/*
bf69bad38cf63d André Almeida  2021-09-23  457  		 * Even if something went wrong, if we find out that a futex
bf69bad38cf63d André Almeida  2021-09-23  458  		 * was woken, we don't return error and return this index to
bf69bad38cf63d André Almeida  2021-09-23  459  		 * userspace
bf69bad38cf63d André Almeida  2021-09-23  460  		 */
bf69bad38cf63d André Almeida  2021-09-23  461  		*woken = unqueue_multiple(vs, i);
bf69bad38cf63d André Almeida  2021-09-23  462  		if (*woken >= 0)
bf69bad38cf63d André Almeida  2021-09-23  463  			return 1;
bf69bad38cf63d André Almeida  2021-09-23  464  
bf69bad38cf63d André Almeida  2021-09-23  465  		if (ret) {
bf69bad38cf63d André Almeida  2021-09-23  466  			/*
bf69bad38cf63d André Almeida  2021-09-23  467  			 * If we need to handle a page fault, we need to do so
bf69bad38cf63d André Almeida  2021-09-23  468  			 * without any lock and any enqueued futex (otherwise
bf69bad38cf63d André Almeida  2021-09-23  469  			 * we could lose some wakeup). So we do it here, after
bf69bad38cf63d André Almeida  2021-09-23  470  			 * undoing all the work done so far. In success, we
bf69bad38cf63d André Almeida  2021-09-23  471  			 * retry all the work.
bf69bad38cf63d André Almeida  2021-09-23  472  			 */
bf69bad38cf63d André Almeida  2021-09-23  473  			if (get_user(uval, uaddr))
bf69bad38cf63d André Almeida  2021-09-23  474  				return -EFAULT;
bf69bad38cf63d André Almeida  2021-09-23  475  
bf69bad38cf63d André Almeida  2021-09-23  476  			retry = true;
bf69bad38cf63d André Almeida  2021-09-23  477  			goto retry;
bf69bad38cf63d André Almeida  2021-09-23  478  		}
bf69bad38cf63d André Almeida  2021-09-23  479  
bf69bad38cf63d André Almeida  2021-09-23  480  		if (uval != val)
bf69bad38cf63d André Almeida  2021-09-23  481  			return -EWOULDBLOCK;
bf69bad38cf63d André Almeida  2021-09-23  482  	}
bf69bad38cf63d André Almeida  2021-09-23  483  
bf69bad38cf63d André Almeida  2021-09-23  484  	return 0;
bf69bad38cf63d André Almeida  2021-09-23  485  }
bf69bad38cf63d André Almeida  2021-09-23  486  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
