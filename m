Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946BD17625B
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jul 2024 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721979827; cv=none; b=pMdVfaENxafmxHcsPoIn21UiXDDztGLPg9+2vY/5ShpS0y+34IVbxbcXhco4KbvdTllegNnMxHoc8qU6T3y9wAnU41ns8/nvoI4oRB5jrMhV9rSKrrR7dkFm95TVqssLcAGL4wYVLG2S/wcx/7K2OsbMtplS0eFV4Rj2uwrQxL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721979827; c=relaxed/simple;
	bh=x/hghes+dVIBdZGXNpGaG+1v17KtLPhhrJa0uOkFs/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W++jNXmZ2hNXcY32GDHovjRc4nS5dlOEp068sPaSunXITcVRE4aCS5J4tTyGGkeX4Y//Y3UGHx37ishMpzbd/mrdHqujOwqRKw+PYTJu5Nzg4iiv0jpZo9UwYnAJl4y983OYkuItdjrArtPJItl6XXE1otlks2EGvnoEhZSjpW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1qYM84r; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1qYM84r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721979825; x=1753515825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/hghes+dVIBdZGXNpGaG+1v17KtLPhhrJa0uOkFs/w=;
  b=j1qYM84rsd9SbQVzM063J9FJCgF4NmPB57d5iuogB2jozLk7WDhsqbv1
   7fm8fMxecApvpWsb22LViSxNyUNoKjbz6TjjBKKTbGDGaNNTJ3fSz0i0D
   feLAn1I5ju/an7J5jYCCLFKGmJP/6D+8lyBeyvaOVDwbNF1qxx6WXzFMG
   IagWKwuPiXJBpOkJfZuRIuDHWwYoZ8GY1l7T76QEvfq6d/ICrN/Z0+Ull
   cY8O5XdMCRwA6dLvU59wJGCjMwHreGSg8jT5xXLzI4SIdfRQKcEO2BC1P
   7VaOVO6xRpdi52AmDRKskeDL0KzXGnLqrrSVXAkSUbFEN72Y9B3jwI6qB
   w==;
X-CSE-ConnectionGUID: D7AvH2VCSvumu1cT8ERdQw==
X-CSE-MsgGUID: tiAV/iwxRMq+t5NXG5rW6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="42290231"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="42290231"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 00:43:43 -0700
X-CSE-ConnectionGUID: Se7cl1SFRryXDrrqZ8rBIg==
X-CSE-MsgGUID: QefFYmgjSeeRnwsdrn08AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="53121179"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jul 2024 00:43:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXFc3-000ot2-1T;
	Fri, 26 Jul 2024 07:43:39 +0000
Date: Fri, 26 Jul 2024 15:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [paulmckrcu:dev.2024.07.18b 23/89] kernel/rcu/rcutorture.c:1502
 rcu_torture_writer() error: we previously assumed 'cur_ops->get_comp_state'
 could be null (see line 1436)
Message-ID: <202407261510.wlO5jrpo-lkp@intel.com>
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
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/paulmckrcu/linux dev.2024.07.18b
head:   a6c7779283d67a409b81616a5b485ac21637d7e7
commit: 45e1c92f5e5c4b6c18ae06f075daf4b0471bb80a [23/89] rcutorture: Remove redundant rcu_torture_ops get_gp_completed fields
:::::: branch date: 16 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20240726 (https://download.01.org/0day-ci/archive/20240726/202407261510.wlO5jrpo-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407261510.wlO5jrpo-lkp@intel.com/

smatch warnings:
kernel/rcu/rcutorture.c:1502 rcu_torture_writer() error: we previously assumed 'cur_ops->get_comp_state' could be null (see line 1436)
kernel/rcu/rcutorture.c:1522 rcu_torture_writer() error: we previously assumed 'cur_ops->get_comp_state_full' could be null (see line 1451)

vim +1502 kernel/rcu/rcutorture.c

ccb42229fb34bc kernel/rcu/rcutorture.c Paul E. McKenney   2022-07-29  1352  
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1353  /*
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1354   * RCU torture writer kthread.  Repeatedly substitutes a new structure
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1355   * for that pointed to by rcu_torture_current, freeing the old structure
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1356   * after a series of grace periods (the "pipeline").
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1357   */
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1358  static int
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1359  rcu_torture_writer(void *arg)
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1360  {
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1361  	bool boot_ended;
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1362  	bool can_expedite = !rcu_gp_is_expedited() && !rcu_gp_is_normal();
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1363  	unsigned long cookie;
91a967fd6934ab kernel/rcu/rcutorture.c Paul E. McKenney   2022-07-28  1364  	struct rcu_gp_oldstate cookie_full;
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1365  	int expediting = 0;
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1366  	unsigned long gp_snap;
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1367  	unsigned long gp_snap1;
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1368  	struct rcu_gp_oldstate gp_snap_full;
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1369  	struct rcu_gp_oldstate gp_snap1_full;
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1370  	int i;
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1371  	int idx;
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1372  	int oldnice = task_nice(current);
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1373  	struct rcu_gp_oldstate rgo[NUM_ACTIVE_RCU_POLL_FULL_OLDSTATE];
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1374  	struct rcu_torture *rp;
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1375  	struct rcu_torture *old_rp;
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1376  	static DEFINE_TORTURE_RANDOM(rand);
fd2a749d3f4f7f kernel/rcu/rcutorture.c Paul E. McKenney   2024-01-03  1377  	unsigned long stallsdone = jiffies;
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1378  	bool stutter_waited;
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1379  	unsigned long ulo[NUM_ACTIVE_RCU_POLL_OLDSTATE];
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1380  
fd2a749d3f4f7f kernel/rcu/rcutorture.c Paul E. McKenney   2024-01-03  1381  	// If a new stall test is added, this must be adjusted.
fd2a749d3f4f7f kernel/rcu/rcutorture.c Paul E. McKenney   2024-01-03  1382  	if (stall_cpu_holdoff + stall_gp_kthread + stall_cpu)
fd2a749d3f4f7f kernel/rcu/rcutorture.c Paul E. McKenney   2024-01-03  1383  		stallsdone += (stall_cpu_holdoff + stall_gp_kthread + stall_cpu + 60) * HZ;
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1384  	VERBOSE_TOROUT_STRING("rcu_torture_writer task started");
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1385  	if (!can_expedite)
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1386  		pr_alert("%s" TORTURE_FLAG
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1387  			 " GP expediting controlled from boot/sysfs for %s.\n",
18fbf307b7319a kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1388  			 torture_type, cur_ops->name);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1389  	if (WARN_ONCE(nsynctypes == 0,
80dcee69514325 kernel/rcu/rcutorture.c David Vernet       2022-03-07  1390  		      "%s: No update-side primitives.\n", __func__)) {
f0bf8fab4f311c kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-21  1391  		/*
f0bf8fab4f311c kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-21  1392  		 * No updates primitives, so don't try updating.
f0bf8fab4f311c kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-21  1393  		 * The resulting test won't be testing much, hence the
f0bf8fab4f311c kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-21  1394  		 * above WARN_ONCE().
f0bf8fab4f311c kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-21  1395  		 */
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1396  		rcu_torture_writer_state = RTWS_STOPPING;
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1397  		torture_kthread_stopping("rcu_torture_writer");
80dcee69514325 kernel/rcu/rcutorture.c David Vernet       2022-03-07  1398  		return 0;
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1399  	}
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1400  
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1401  	do {
ad0dc7f94dbf41 kernel/rcu/rcutorture.c Paul E. McKenney   2014-02-19  1402  		rcu_torture_writer_state = RTWS_FIXED_DELAY;
1eba0ef981fd3b kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-17  1403  		torture_hrtimeout_us(500, 1000, &rand);
a71fca58b7f4ab kernel/rcutorture.c     Paul E. McKenney   2009-09-18  1404  		rp = rcu_torture_alloc();
a71fca58b7f4ab kernel/rcutorture.c     Paul E. McKenney   2009-09-18  1405  		if (rp == NULL)
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1406  			continue;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1407  		rp->rtort_pipe_count = 0;
c507e195016ccc kernel/rcu/rcutorture.c Paul E. McKenney   2024-03-06  1408  		ASSERT_EXCLUSIVE_WRITER(rp->rtort_pipe_count);
ad0dc7f94dbf41 kernel/rcu/rcutorture.c Paul E. McKenney   2014-02-19  1409  		rcu_torture_writer_state = RTWS_DELAY;
51b1130eb5823d kernel/rcu/rcutorture.c Paul E. McKenney   2014-01-27  1410  		udelay(torture_random(&rand) & 0x3ff);
ad0dc7f94dbf41 kernel/rcu/rcutorture.c Paul E. McKenney   2014-02-19  1411  		rcu_torture_writer_state = RTWS_REPLACE;
0ddea0ead2ced9 kernel/rcutorture.c     Paul E. McKenney   2010-09-19  1412  		old_rp = rcu_dereference_check(rcu_torture_current,
0ddea0ead2ced9 kernel/rcutorture.c     Paul E. McKenney   2010-09-19  1413  					       current == writer_task);
996417d2c4eb58 kernel/rcutorture.c     Paul E. McKenney   2005-11-18  1414  		rp->rtort_mbtest = 1;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1415  		rcu_assign_pointer(rcu_torture_current, rp);
9b2619aff0332e kernel/rcutorture.c     Paul E. McKenney   2009-09-23  1416  		smp_wmb(); /* Mods to old_rp must follow rcu_assign_pointer() */
c8e5b163101c5d kernel/rcutorture.c     Josh Triplett      2007-05-08  1417  		if (old_rp) {
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1418  			i = old_rp->rtort_pipe_count;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1419  			if (i > RCU_TORTURE_PIPE_LEN)
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1420  				i = RCU_TORTURE_PIPE_LEN;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1421  			atomic_inc(&rcu_torture_wcount[i]);
202489101f2e6c kernel/rcu/rcutorture.c Paul E. McKenney   2019-12-21  1422  			WRITE_ONCE(old_rp->rtort_pipe_count,
202489101f2e6c kernel/rcu/rcutorture.c Paul E. McKenney   2019-12-21  1423  				   old_rp->rtort_pipe_count + 1);
c507e195016ccc kernel/rcu/rcutorture.c Paul E. McKenney   2024-03-06  1424  			ASSERT_EXCLUSIVE_WRITER(old_rp->rtort_pipe_count);
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1425  
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1426  			// Make sure readers block polled grace periods.
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1427  			if (cur_ops->get_gp_state && cur_ops->poll_gp_state) {
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1428  				idx = cur_ops->readlock();
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1429  				cookie = cur_ops->get_gp_state();
37d6ade31cf833 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1430  				WARN_ONCE(cur_ops->poll_gp_state(cookie),
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1431  					  "%s: Cookie check 1 failed %s(%d) %lu->%lu\n",
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1432  					  __func__,
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1433  					  rcu_torture_writer_state_getname(),
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1434  					  rcu_torture_writer_state,
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1435  					  cookie, cur_ops->get_gp_state());
45e1c92f5e5c4b kernel/rcu/rcutorture.c Paul E. McKenney   2024-06-14 @1436  				if (cur_ops->get_comp_state) {
45e1c92f5e5c4b kernel/rcu/rcutorture.c Paul E. McKenney   2024-06-14  1437  					cookie = cur_ops->get_comp_state();
d0eac20f9909de kernel/rcu/rcutorture.c Paul E. McKenney   2022-04-13  1438  					WARN_ON_ONCE(!cur_ops->poll_gp_state(cookie));
d0eac20f9909de kernel/rcu/rcutorture.c Paul E. McKenney   2022-04-13  1439  				}
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1440  				cur_ops->readunlock(idx);
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1441  			}
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1442  			if (cur_ops->get_gp_state_full && cur_ops->poll_gp_state_full) {
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1443  				idx = cur_ops->readlock();
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1444  				cur_ops->get_gp_state_full(&cookie_full);
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1445  				WARN_ONCE(cur_ops->poll_gp_state_full(&cookie_full),
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1446  					  "%s: Cookie check 5 failed %s(%d) online %*pbl\n",
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1447  					  __func__,
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1448  					  rcu_torture_writer_state_getname(),
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1449  					  rcu_torture_writer_state,
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1450  					  cpumask_pr_args(cpu_online_mask));
45e1c92f5e5c4b kernel/rcu/rcutorture.c Paul E. McKenney   2024-06-14 @1451  				if (cur_ops->get_comp_state_full) {
45e1c92f5e5c4b kernel/rcu/rcutorture.c Paul E. McKenney   2024-06-14  1452  					cur_ops->get_comp_state_full(&cookie_full);
91a967fd6934ab kernel/rcu/rcutorture.c Paul E. McKenney   2022-07-28  1453  					WARN_ON_ONCE(!cur_ops->poll_gp_state_full(&cookie_full));
91a967fd6934ab kernel/rcu/rcutorture.c Paul E. McKenney   2022-07-28  1454  				}
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1455  				cur_ops->readunlock(idx);
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1456  			}
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1457  			switch (synctype[torture_random(&rand) % nsynctypes]) {
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1458  			case RTWS_DEF_FREE:
ad0dc7f94dbf41 kernel/rcu/rcutorture.c Paul E. McKenney   2014-02-19  1459  				rcu_torture_writer_state = RTWS_DEF_FREE;
0acc512cb1a296 kernel/rcutorture.c     Paul E. McKenney   2009-06-25  1460  				cur_ops->deferred_free(old_rp);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1461  				break;
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1462  			case RTWS_EXP_SYNC:
ad0dc7f94dbf41 kernel/rcu/rcutorture.c Paul E. McKenney   2014-02-19  1463  				rcu_torture_writer_state = RTWS_EXP_SYNC;
ccb42229fb34bc kernel/rcu/rcutorture.c Paul E. McKenney   2022-07-29  1464  				do_rtws_sync(&rand, cur_ops->exp_sync);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1465  				rcu_torture_pipe_update(old_rp);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1466  				break;
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1467  			case RTWS_COND_GET:
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1468  				rcu_torture_writer_state = RTWS_COND_GET;
fd56f64b4e3b9c kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1469  				gp_snap = cur_ops->get_gp_state();
ea31fd9ca87399 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-17  1470  				torture_hrtimeout_jiffies(torture_random(&rand) % 16, &rand);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1471  				rcu_torture_writer_state = RTWS_COND_SYNC;
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1472  				cur_ops->cond_sync(gp_snap);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1473  				rcu_torture_pipe_update(old_rp);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1474  				break;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1475  			case RTWS_COND_GET_EXP:
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1476  				rcu_torture_writer_state = RTWS_COND_GET_EXP;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1477  				gp_snap = cur_ops->get_gp_state_exp();
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1478  				torture_hrtimeout_jiffies(torture_random(&rand) % 16, &rand);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1479  				rcu_torture_writer_state = RTWS_COND_SYNC_EXP;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1480  				cur_ops->cond_sync_exp(gp_snap);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1481  				rcu_torture_pipe_update(old_rp);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1482  				break;
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1483  			case RTWS_COND_GET_FULL:
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1484  				rcu_torture_writer_state = RTWS_COND_GET_FULL;
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1485  				cur_ops->get_gp_state_full(&gp_snap_full);
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1486  				torture_hrtimeout_jiffies(torture_random(&rand) % 16, &rand);
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1487  				rcu_torture_writer_state = RTWS_COND_SYNC_FULL;
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1488  				cur_ops->cond_sync_full(&gp_snap_full);
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1489  				rcu_torture_pipe_update(old_rp);
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1490  				break;
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1491  			case RTWS_COND_GET_EXP_FULL:
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1492  				rcu_torture_writer_state = RTWS_COND_GET_EXP_FULL;
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1493  				cur_ops->get_gp_state_full(&gp_snap_full);
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1494  				torture_hrtimeout_jiffies(torture_random(&rand) % 16, &rand);
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1495  				rcu_torture_writer_state = RTWS_COND_SYNC_EXP_FULL;
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1496  				cur_ops->cond_sync_exp_full(&gp_snap_full);
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1497  				rcu_torture_pipe_update(old_rp);
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1498  				break;
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1499  			case RTWS_POLL_GET:
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1500  				rcu_torture_writer_state = RTWS_POLL_GET;
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1501  				for (i = 0; i < ARRAY_SIZE(ulo); i++)
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25 @1502  					ulo[i] = cur_ops->get_comp_state();
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1503  				gp_snap = cur_ops->start_gp_poll();
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1504  				rcu_torture_writer_state = RTWS_POLL_WAIT;
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1505  				while (!cur_ops->poll_gp_state(gp_snap)) {
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1506  					gp_snap1 = cur_ops->get_gp_state();
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1507  					for (i = 0; i < ARRAY_SIZE(ulo); i++)
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1508  						if (cur_ops->poll_gp_state(ulo[i]) ||
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1509  						    cur_ops->same_gp_state(ulo[i], gp_snap1)) {
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1510  							ulo[i] = gp_snap1;
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1511  							break;
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1512  						}
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1513  					WARN_ON_ONCE(i >= ARRAY_SIZE(ulo));
ea31fd9ca87399 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-17  1514  					torture_hrtimeout_jiffies(torture_random(&rand) % 16,
ea31fd9ca87399 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-17  1515  								  &rand);
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1516  				}
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1517  				rcu_torture_pipe_update(old_rp);
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1518  				break;
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1519  			case RTWS_POLL_GET_FULL:
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1520  				rcu_torture_writer_state = RTWS_POLL_GET_FULL;
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1521  				for (i = 0; i < ARRAY_SIZE(rgo); i++)
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25 @1522  					cur_ops->get_comp_state_full(&rgo[i]);
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1523  				cur_ops->start_gp_poll_full(&gp_snap_full);
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1524  				rcu_torture_writer_state = RTWS_POLL_WAIT_FULL;
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1525  				while (!cur_ops->poll_gp_state_full(&gp_snap_full)) {
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1526  					cur_ops->get_gp_state_full(&gp_snap1_full);
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1527  					for (i = 0; i < ARRAY_SIZE(rgo); i++)
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1528  						if (cur_ops->poll_gp_state_full(&rgo[i]) ||
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1529  						    cur_ops->same_gp_state_full(&rgo[i],
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1530  										&gp_snap1_full)) {
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1531  							rgo[i] = gp_snap1_full;
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1532  							break;
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1533  						}
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1534  					WARN_ON_ONCE(i >= ARRAY_SIZE(rgo));
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1535  					torture_hrtimeout_jiffies(torture_random(&rand) % 16,
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1536  								  &rand);
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1537  				}
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1538  				rcu_torture_pipe_update(old_rp);
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1539  				break;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1540  			case RTWS_POLL_GET_EXP:
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1541  				rcu_torture_writer_state = RTWS_POLL_GET_EXP;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1542  				gp_snap = cur_ops->start_gp_poll_exp();
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1543  				rcu_torture_writer_state = RTWS_POLL_WAIT_EXP;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1544  				while (!cur_ops->poll_gp_state_exp(gp_snap))
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1545  					torture_hrtimeout_jiffies(torture_random(&rand) % 16,
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1546  								  &rand);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1547  				rcu_torture_pipe_update(old_rp);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1548  				break;
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1549  			case RTWS_POLL_GET_EXP_FULL:
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1550  				rcu_torture_writer_state = RTWS_POLL_GET_EXP_FULL;
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1551  				cur_ops->start_gp_poll_exp_full(&gp_snap_full);
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1552  				rcu_torture_writer_state = RTWS_POLL_WAIT_EXP_FULL;
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1553  				while (!cur_ops->poll_gp_state_full(&gp_snap_full))
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1554  					torture_hrtimeout_jiffies(torture_random(&rand) % 16,
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1555  								  &rand);
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1556  				rcu_torture_pipe_update(old_rp);
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1557  				break;
f0bf8fab4f311c kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-21  1558  			case RTWS_SYNC:
f0bf8fab4f311c kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-21  1559  				rcu_torture_writer_state = RTWS_SYNC;
ccb42229fb34bc kernel/rcu/rcutorture.c Paul E. McKenney   2022-07-29  1560  				do_rtws_sync(&rand, cur_ops->sync);
f0bf8fab4f311c kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-21  1561  				rcu_torture_pipe_update(old_rp);
f0bf8fab4f311c kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-21  1562  				break;
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1563  			default:
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1564  				WARN_ON_ONCE(1);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1565  				break;
2ec1f2d9875229 kernel/rcutorture.c     Paul E. McKenney   2013-06-12  1566  			}
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1567  		}
1b27291b1ea4f1 kernel/rcu/rcutorture.c Paul E. McKenney   2018-07-18  1568  		WRITE_ONCE(rcu_torture_current_version,
1b27291b1ea4f1 kernel/rcu/rcutorture.c Paul E. McKenney   2018-07-18  1569  			   rcu_torture_current_version + 1);
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1570  		/* Cycle through nesting levels of rcu_expedite_gp() calls. */
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1571  		if (can_expedite &&
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1572  		    !(torture_random(&rand) & 0xff & (!!expediting - 1))) {
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1573  			WARN_ON_ONCE(expediting == 0 && rcu_gp_is_expedited());
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1574  			if (expediting >= 0)
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1575  				rcu_expedite_gp();
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1576  			else
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1577  				rcu_unexpedite_gp();
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1578  			if (++expediting > 3)
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1579  				expediting = -expediting;
f7c0e6ad4bb1ab kernel/rcu/rcutorture.c Paul E. McKenney   2017-12-08  1580  		} else if (!can_expedite) { /* Disabled during boot, recheck. */
f7c0e6ad4bb1ab kernel/rcu/rcutorture.c Paul E. McKenney   2017-12-08  1581  			can_expedite = !rcu_gp_is_expedited() &&
f7c0e6ad4bb1ab kernel/rcu/rcutorture.c Paul E. McKenney   2017-12-08  1582  				       !rcu_gp_is_normal();
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1583  		}
ad0dc7f94dbf41 kernel/rcu/rcutorture.c Paul E. McKenney   2014-02-19  1584  		rcu_torture_writer_state = RTWS_STUTTER;
12a910e3cd3d11 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-16  1585  		boot_ended = rcu_inkernel_boot_has_ended();
ab1b7880dec86b kernel/rcu/rcutorture.c Paul E. McKenney   2020-09-22  1586  		stutter_waited = stutter_wait("rcu_torture_writer");
ab1b7880dec86b kernel/rcu/rcutorture.c Paul E. McKenney   2020-09-22  1587  		if (stutter_waited &&
e22ef8df415d92 kernel/rcu/rcutorture.c Paul E. McKenney   2021-12-17  1588  		    !atomic_read(&rcu_fwd_cb_nodelay) &&
3432d765c59ba0 kernel/rcu/rcutorture.c Paul E. McKenney   2019-04-15  1589  		    !cur_ops->slow_gps &&
59ee0326ccf712 kernel/rcu/rcutorture.c Paul E. McKenney   2019-11-28  1590  		    !torture_must_stop() &&
fd2a749d3f4f7f kernel/rcu/rcutorture.c Paul E. McKenney   2024-01-03  1591  		    boot_ended &&
fd2a749d3f4f7f kernel/rcu/rcutorture.c Paul E. McKenney   2024-01-03  1592  		    time_after(jiffies, stallsdone))
474e59b476b339 kernel/rcu/rcutorture.c Paul E. McKenney   2018-08-07  1593  			for (i = 0; i < ARRAY_SIZE(rcu_tortures); i++)
e8516c64fe97e2 kernel/rcu/rcutorture.c Paul E. McKenney   2019-04-09  1594  				if (list_empty(&rcu_tortures[i].rtort_free) &&
fd2a749d3f4f7f kernel/rcu/rcutorture.c Paul E. McKenney   2024-01-03  1595  				    rcu_access_pointer(rcu_torture_current) != &rcu_tortures[i]) {
14c0017c19ead1 kernel/rcu/rcutorture.c Anna-Maria Behnsen 2022-04-11  1596  					tracing_off();
e38bf06d509a90 kernel/rcu/rcutorture.c Zqiang             2024-03-15  1597  					if (cur_ops->gp_kthread_dbg)
e38bf06d509a90 kernel/rcu/rcutorture.c Zqiang             2024-03-15  1598  						cur_ops->gp_kthread_dbg();
e8516c64fe97e2 kernel/rcu/rcutorture.c Paul E. McKenney   2019-04-09  1599  					WARN(1, "%s: rtort_pipe_count: %d\n", __func__, rcu_tortures[i].rtort_pipe_count);
14c0017c19ead1 kernel/rcu/rcutorture.c Anna-Maria Behnsen 2022-04-11  1600  					rcu_ftrace_dump(DUMP_ALL);
34aa34b818407b kernel/rcu/rcutorture.c Paul E. McKenney   2019-05-16  1601  				}
ab1b7880dec86b kernel/rcu/rcutorture.c Paul E. McKenney   2020-09-22  1602  		if (stutter_waited)
ab1b7880dec86b kernel/rcu/rcutorture.c Paul E. McKenney   2020-09-22  1603  			sched_set_normal(current, oldnice);
36970bb91d8961 kernel/rcu/rcutorture.c Paul E. McKenney   2014-01-30  1604  	} while (!torture_must_stop());
cae7cc6ba5bad3 kernel/rcu/rcutorture.c Paul E. McKenney   2020-04-26  1605  	rcu_torture_current = NULL;  // Let stats task know that we are done.
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1606  	/* Reset expediting back to unexpedited. */
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1607  	if (expediting > 0)
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1608  		expediting = -expediting;
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1609  	while (can_expedite && expediting++ < 0)
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1610  		rcu_unexpedite_gp();
4bb3c5f4142a35 kernel/rcu/rcutorture.c Paul E. McKenney   2015-02-18  1611  	WARN_ON_ONCE(can_expedite && rcu_gp_is_expedited());
f7c0e6ad4bb1ab kernel/rcu/rcutorture.c Paul E. McKenney   2017-12-08  1612  	if (!can_expedite)
f7c0e6ad4bb1ab kernel/rcu/rcutorture.c Paul E. McKenney   2017-12-08  1613  		pr_alert("%s" TORTURE_FLAG
f7c0e6ad4bb1ab kernel/rcu/rcutorture.c Paul E. McKenney   2017-12-08  1614  			 " Dynamic grace-period expediting was disabled.\n",
f7c0e6ad4bb1ab kernel/rcu/rcutorture.c Paul E. McKenney   2017-12-08  1615  			 torture_type);
ad0dc7f94dbf41 kernel/rcu/rcutorture.c Paul E. McKenney   2014-02-19  1616  	rcu_torture_writer_state = RTWS_STOPPING;
7fafaac5b9ce22 kernel/rcu/rcutorture.c Paul E. McKenney   2014-01-31  1617  	torture_kthread_stopping("rcu_torture_writer");
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1618  	return 0;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1619  }
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1620  

:::::: The code at line 1502 was first introduced by commit
:::::: 1324d95b1c22d1c50d0c710dd5a8e2104d097cfc rcutorture: Verify NUM_ACTIVE_RCU_POLL_OLDSTATE

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
