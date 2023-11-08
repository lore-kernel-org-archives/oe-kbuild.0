Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034F91EB46
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Nov 2023 17:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lyeudhv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699463782; x=1730999782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5O1e8GgGairKYz5yfpUgso9WUxwHSwqTxUmL38sZkm0=;
  b=Lyeudhv7Lf5eD9w3Nw1W1qvCCaFxEFoqntziwz1iDlq7GMb6QWC7zk8E
   JbEk0UVVBmBYEyxT6z3wMlIYSPiRx+vU72g2IxJvvDU8vO2iZhQrVof6h
   9f6fazkE2NplWC9yOhecz1UYJxy+GwIlyj6baA2fYxnkxWkq6rDxHxzJa
   /wGzoIMHe5P4bI3N6vObhWmu7pYMMiq2N8r7nkBgEs/5oXX/CbwqfJiN/
   bwc/6mxme1pBGH10O1HH85Wb9yAnEq+N5e1hp/5ILaJpX2wDmWBhkZyqy
   hHVEEDtj1wbBZAxnR/MlGw7DnfYLt6pKgYSGh90867md1rQ5+9xCr6+VS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="370021853"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="370021853"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 09:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="936581704"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="936581704"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Nov 2023 09:16:18 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0mA4-00085D-22;
	Wed, 08 Nov 2023 17:16:16 +0000
Date: Thu, 9 Nov 2023 01:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 16144/16682] kernel/rcu/rcutorture.c:2502
 rcu_torture_stall() error: uninitialized symbol 'ret'.
Message-ID: <202311090136.Tvkm3hNO-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2220f68f4504aa1ccce0fac721ccdb301e9da32f
commit: 7939f0d7b28cf0482209674d90f15b9e75dbd68e [16144/16682] rcu: Restrict access to RCU CPU stall notifiers
:::::: branch date: 12 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20231108 (https://download.01.org/0day-ci/archive/20231109/202311090136.Tvkm3hNO-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231109/202311090136.Tvkm3hNO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311090136.Tvkm3hNO-lkp@intel.com/

smatch warnings:
kernel/rcu/rcutorture.c:2502 rcu_torture_stall() error: uninitialized symbol 'ret'.

vim +/ret +2502 kernel/rcu/rcutorture.c

7c1b3e0c988f290 kernel/rcu/rcutorture.c Paul E. McKenney     2023-08-15  2441  
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2442  /*
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2443   * CPU-stall kthread.  It waits as specified by stall_cpu_holdoff, then
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2444   * induces a CPU stall for the time specified by stall_cpu.
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2445   */
49fb4c6290c70c4 kernel/rcutorture.c     Paul Gortmaker       2013-06-19  2446  static int rcu_torture_stall(void *args)
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2447  {
19a8ff956c5abaa kernel/rcu/rcutorture.c Paul E. McKenney     2020-03-11  2448  	int idx;
7c1b3e0c988f290 kernel/rcu/rcutorture.c Paul E. McKenney     2023-08-15  2449  	int ret;
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2450  	unsigned long stop_at;
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2451  
5ccf60f23d33afd kernel/rcu/rcutorture.c Paul E. McKenney     2014-01-29  2452  	VERBOSE_TOROUT_STRING("rcu_torture_stall task started");
7939f0d7b28cf04 kernel/rcu/rcutorture.c Paul E. McKenney     2023-11-01  2453  	if (rcu_cpu_stall_notifiers) {
7c1b3e0c988f290 kernel/rcu/rcutorture.c Paul E. McKenney     2023-08-15  2454  		ret = rcu_stall_chain_notifier_register(&rcu_torture_stall_block);
7c1b3e0c988f290 kernel/rcu/rcutorture.c Paul E. McKenney     2023-08-15  2455  		if (ret)
7c1b3e0c988f290 kernel/rcu/rcutorture.c Paul E. McKenney     2023-08-15  2456  			pr_info("%s: rcu_stall_chain_notifier_register() returned %d, %sexpected.\n",
7c1b3e0c988f290 kernel/rcu/rcutorture.c Paul E. McKenney     2023-08-15  2457  				__func__, ret, !IS_ENABLED(CONFIG_RCU_STALL_COMMON) ? "un" : "");
7939f0d7b28cf04 kernel/rcu/rcutorture.c Paul E. McKenney     2023-11-01  2458  	}
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2459  	if (stall_cpu_holdoff > 0) {
5ccf60f23d33afd kernel/rcu/rcutorture.c Paul E. McKenney     2014-01-29  2460  		VERBOSE_TOROUT_STRING("rcu_torture_stall begin holdoff");
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2461  		schedule_timeout_interruptible(stall_cpu_holdoff * HZ);
5ccf60f23d33afd kernel/rcu/rcutorture.c Paul E. McKenney     2014-01-29  2462  		VERBOSE_TOROUT_STRING("rcu_torture_stall end holdoff");
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2463  	}
55b2dcf58700041 kernel/rcu/rcutorture.c Paul E. McKenney     2020-04-01  2464  	if (!kthread_should_stop() && stall_gp_kthread > 0) {
55b2dcf58700041 kernel/rcu/rcutorture.c Paul E. McKenney     2020-04-01  2465  		VERBOSE_TOROUT_STRING("rcu_torture_stall begin GP stall");
55b2dcf58700041 kernel/rcu/rcutorture.c Paul E. McKenney     2020-04-01  2466  		rcu_gp_set_torture_wait(stall_gp_kthread * HZ);
55b2dcf58700041 kernel/rcu/rcutorture.c Paul E. McKenney     2020-04-01  2467  		for (idx = 0; idx < stall_gp_kthread + 2; idx++) {
55b2dcf58700041 kernel/rcu/rcutorture.c Paul E. McKenney     2020-04-01  2468  			if (kthread_should_stop())
55b2dcf58700041 kernel/rcu/rcutorture.c Paul E. McKenney     2020-04-01  2469  				break;
55b2dcf58700041 kernel/rcu/rcutorture.c Paul E. McKenney     2020-04-01  2470  			schedule_timeout_uninterruptible(HZ);
55b2dcf58700041 kernel/rcu/rcutorture.c Paul E. McKenney     2020-04-01  2471  		}
55b2dcf58700041 kernel/rcu/rcutorture.c Paul E. McKenney     2020-04-01  2472  	}
55b2dcf58700041 kernel/rcu/rcutorture.c Paul E. McKenney     2020-04-01  2473  	if (!kthread_should_stop() && stall_cpu > 0) {
55b2dcf58700041 kernel/rcu/rcutorture.c Paul E. McKenney     2020-04-01  2474  		VERBOSE_TOROUT_STRING("rcu_torture_stall begin CPU stall");
622be33fcbc93e9 kernel/rcu/rcutorture.c Arnd Bergmann        2018-06-18  2475  		stop_at = ktime_get_seconds() + stall_cpu;
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2476  		/* RCU CPU stall is expected behavior in following code. */
19a8ff956c5abaa kernel/rcu/rcutorture.c Paul E. McKenney     2020-03-11  2477  		idx = cur_ops->readlock();
2b1516e55f8416a kernel/rcu/rcutorture.c Paul E. McKenney     2017-08-18  2478  		if (stall_cpu_irqsoff)
2b1516e55f8416a kernel/rcu/rcutorture.c Paul E. McKenney     2017-08-18  2479  			local_irq_disable();
19a8ff956c5abaa kernel/rcu/rcutorture.c Paul E. McKenney     2020-03-11  2480  		else if (!stall_cpu_block)
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2481  			preempt_disable();
0a27fff30a5e561 kernel/rcu/rcutorture.c Stephen Zhang        2021-01-23  2482  		pr_alert("%s start on CPU %d.\n",
0a27fff30a5e561 kernel/rcu/rcutorture.c Stephen Zhang        2021-01-23  2483  			  __func__, raw_smp_processor_id());
622be33fcbc93e9 kernel/rcu/rcutorture.c Arnd Bergmann        2018-06-18  2484  		while (ULONG_CMP_LT((unsigned long)ktime_get_seconds(),
622be33fcbc93e9 kernel/rcu/rcutorture.c Arnd Bergmann        2018-06-18  2485  				    stop_at))
59e836662860a28 kernel/rcu/rcutorture.c Paul E. McKenney     2021-05-16  2486  			if (stall_cpu_block) {
59e836662860a28 kernel/rcu/rcutorture.c Paul E. McKenney     2021-05-16  2487  #ifdef CONFIG_PREEMPTION
59e836662860a28 kernel/rcu/rcutorture.c Paul E. McKenney     2021-05-16  2488  				preempt_schedule();
59e836662860a28 kernel/rcu/rcutorture.c Paul E. McKenney     2021-05-16  2489  #else
19a8ff956c5abaa kernel/rcu/rcutorture.c Paul E. McKenney     2020-03-11  2490  				schedule_timeout_uninterruptible(HZ);
59e836662860a28 kernel/rcu/rcutorture.c Paul E. McKenney     2021-05-16  2491  #endif
5ff7c9f9d7e3e0f kernel/rcu/rcutorture.c Wander Lairson Costa 2021-11-10  2492  			} else if (stall_no_softlockup) {
5ff7c9f9d7e3e0f kernel/rcu/rcutorture.c Wander Lairson Costa 2021-11-10  2493  				touch_softlockup_watchdog();
59e836662860a28 kernel/rcu/rcutorture.c Paul E. McKenney     2021-05-16  2494  			}
2b1516e55f8416a kernel/rcu/rcutorture.c Paul E. McKenney     2017-08-18  2495  		if (stall_cpu_irqsoff)
2b1516e55f8416a kernel/rcu/rcutorture.c Paul E. McKenney     2017-08-18  2496  			local_irq_enable();
19a8ff956c5abaa kernel/rcu/rcutorture.c Paul E. McKenney     2020-03-11  2497  		else if (!stall_cpu_block)
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2498  			preempt_enable();
19a8ff956c5abaa kernel/rcu/rcutorture.c Paul E. McKenney     2020-03-11  2499  		cur_ops->readunlock(idx);
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2500  	}
0a27fff30a5e561 kernel/rcu/rcutorture.c Stephen Zhang        2021-01-23  2501  	pr_alert("%s end.\n", __func__);
7c1b3e0c988f290 kernel/rcu/rcutorture.c Paul E. McKenney     2023-08-15 @2502  	if (!ret) {
7939f0d7b28cf04 kernel/rcu/rcutorture.c Paul E. McKenney     2023-11-01  2503  		if (rcu_cpu_stall_notifiers) {
7c1b3e0c988f290 kernel/rcu/rcutorture.c Paul E. McKenney     2023-08-15  2504  			ret = rcu_stall_chain_notifier_unregister(&rcu_torture_stall_block);
7c1b3e0c988f290 kernel/rcu/rcutorture.c Paul E. McKenney     2023-08-15  2505  			if (ret)
7c1b3e0c988f290 kernel/rcu/rcutorture.c Paul E. McKenney     2023-08-15  2506  				pr_info("%s: rcu_stall_chain_notifier_unregister() returned %d.\n", __func__, ret);
7c1b3e0c988f290 kernel/rcu/rcutorture.c Paul E. McKenney     2023-08-15  2507  		}
7939f0d7b28cf04 kernel/rcu/rcutorture.c Paul E. McKenney     2023-11-01  2508  	}
f67a33561e6e546 kernel/rcu/rcutorture.c Paul E. McKenney     2014-01-29  2509  	torture_shutdown_absorb("rcu_torture_stall");
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2510  	while (!kthread_should_stop())
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2511  		schedule_timeout_interruptible(10 * HZ);
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2512  	return 0;
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2513  }
c13f3757d0fcdcc kernel/rcutorture.c     Paul E. McKenney     2012-01-20  2514  

:::::: The code at line 2502 was first introduced by commit
:::::: 7c1b3e0c988f2902695ef6175ab8ad00c0e8b65f rcutorture: Add test of RCU CPU stall notifiers

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Frederic Weisbecker <frederic@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
