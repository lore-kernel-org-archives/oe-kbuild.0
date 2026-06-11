Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D84C331EDA
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 19:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781207861; cv=none; b=AMXOXk/vTkbJcZyyiKJF8Oeh1tOQRqB8+MbUr3Ps5Kie174QpxjX3VzhS8xUjS6htTerf9hthcCKZVrBZsbSDCTIKbz6tQxjM57D+aFDDrYN2Kn2p6Jta7LLmrEnGy9Y0+Wg6qRnaV+UXYeXGn+DrNOzX6ymj0uTlgG6UrVaKNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781207861; c=relaxed/simple;
	bh=ZOOGnDHo460cbP+1TH7fSU8zzM2LSHLmCf3AgJdtrTk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DRP55oBjXQQx97StSWgstNUxH9I2G+kd5GDCFcD22oK/6KUbSEo+gQ2yq1ZawVuNQ4xFtziMx5i5898E2QA1nmZeltHRXbIz3PlMqVd3ivnNl4j62bd8Sm0cCsLoKOpbWrP/PxZMPx9iE0NTGneWvfr6TreNvGouRKetNLiU08M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1kxELzq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1kxELzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781207860; x=1812743860;
  h=date:from:to:cc:subject:message-id;
  bh=ZOOGnDHo460cbP+1TH7fSU8zzM2LSHLmCf3AgJdtrTk=;
  b=Z1kxELzqNwNAL6E1INN5aWVZPPgoqRUtckoU/tz0rVL2RBRthHmyTgeK
   5VmJ5yYm+0WRz5BJvDMZ0FviD3bi/hDXHf24SDcmqeyyCpcNi6zImxxEI
   /7ak2aoWrYMoBhG3J5x/tWoMzwN4u/4rsjmgdWP4FWdn2DHxSzvdkn2ke
   yvZTtLy9bbZ7sA5Bykug07Cx6ynDE6eCsyi5vP1KdXZh5W9sjih8zMgPB
   D0i/75QaRnGo3C/bfkfNo35Dp7IqCWKBR7yHA5ommVWXVBqNCTnsqmMzZ
   Xibx+LHkP/4oez8767hCi2ABV5S6CuDzdSKWBBLX/TAaNtzwSCq18hw0V
   A==;
X-CSE-ConnectionGUID: X0n82BoWS5u7kfLyW7HfzA==
X-CSE-MsgGUID: +WuVi7zMTeGELhndxFl+Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82095357"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82095357"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:57:39 -0700
X-CSE-ConnectionGUID: cOtftfVMRcqR+Rv4qGAmSw==
X-CSE-MsgGUID: TwMXyUP3RVKVJE7gLDq9+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="270259431"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jun 2026 12:57:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXlWx-00000000Nnj-12wb;
	Thu, 11 Jun 2026 19:57:35 +0000
Date: Fri, 12 Jun 2026 03:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/events/core.c:5774:6-11: ERROR: iterator variable
 bound on line 5733 cannot be NULL
Message-ID: <202606120326.TJymRY2a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ravi Bangoria <ravi.bangoria@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 3e8671e00e57b3d006ed8ae5ef055807506e44b2 perf: Simplify perf_event_release_kernel()
date:   1 year, 2 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm-randconfig-r052-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120326.TJymRY2a-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3e8671e00e57 ("perf: Simplify perf_event_release_kernel()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606120326.TJymRY2a-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/events/core.c:5774:6-11: ERROR: iterator variable bound on line 5733 cannot be NULL

vim +5774 kernel/events/core.c

c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5689  
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5690  /*
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5691   * Kill an event dead; while event:refcount will preserve the event
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5692   * object, it will not preserve its functionality. Once the last 'user'
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5693   * gives up the object, we'll destroy the thing.
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5694   */
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5695  int perf_event_release_kernel(struct perf_event *event)
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5696  {
a4f4bb6d0c69d0 kernel/events/core.c Peter Zijlstra      2016-02-24  5697  	struct perf_event_context *ctx = event->ctx;
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5698  	struct perf_event *child, *tmp;
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5699  
a4f4bb6d0c69d0 kernel/events/core.c Peter Zijlstra      2016-02-24  5700  	/*
bd27568117664b kernel/events/core.c Peter Zijlstra      2022-10-08  5701  	 * If we got here through err_alloc: free_event(event); we will not
bd27568117664b kernel/events/core.c Peter Zijlstra      2022-10-08  5702  	 * have attached to a context yet.
a4f4bb6d0c69d0 kernel/events/core.c Peter Zijlstra      2016-02-24  5703  	 */
a4f4bb6d0c69d0 kernel/events/core.c Peter Zijlstra      2016-02-24  5704  	if (!ctx) {
a4f4bb6d0c69d0 kernel/events/core.c Peter Zijlstra      2016-02-24  5705  		WARN_ON_ONCE(event->attach_state &
a4f4bb6d0c69d0 kernel/events/core.c Peter Zijlstra      2016-02-24  5706  				(PERF_ATTACH_CONTEXT|PERF_ATTACH_GROUP));
a4f4bb6d0c69d0 kernel/events/core.c Peter Zijlstra      2016-02-24  5707  		goto no_ctx;
a4f4bb6d0c69d0 kernel/events/core.c Peter Zijlstra      2016-02-24  5708  	}
a4f4bb6d0c69d0 kernel/events/core.c Peter Zijlstra      2016-02-24  5709  
f86977620ee463 kernel/events/core.c Jiri Olsa           2014-08-01  5710  	if (!is_kernel_event(event))
f86977620ee463 kernel/events/core.c Jiri Olsa           2014-08-01  5711  		perf_remove_from_owner(event);
8882135bcd332f kernel/perf_event.c  Peter Zijlstra      2010-11-09  5712  
5fa7c8ec57f70a kernel/events/core.c Peter Zijlstra      2016-01-26  5713  	ctx = perf_event_ctx_lock(event);
a83fe28e2e4539 kernel/events/core.c Peter Zijlstra      2015-01-29  5714  	WARN_ON_ONCE(ctx->parent_ctx);
683ede43dd412c kernel/events/core.c Peter Zijlstra      2014-05-05  5715  
683ede43dd412c kernel/events/core.c Peter Zijlstra      2014-05-05  5716  	/*
d8a8cfc76919b6 kernel/events/core.c Peter Zijlstra      2017-03-16  5717  	 * Mark this event as STATE_DEAD, there is no external reference to it
a69b0ca4ac3bf5 kernel/events/core.c Peter Zijlstra      2016-02-24  5718  	 * anymore.
683ede43dd412c kernel/events/core.c Peter Zijlstra      2014-05-05  5719  	 *
a69b0ca4ac3bf5 kernel/events/core.c Peter Zijlstra      2016-02-24  5720  	 * Anybody acquiring event->child_mutex after the below loop _must_
a69b0ca4ac3bf5 kernel/events/core.c Peter Zijlstra      2016-02-24  5721  	 * also see this, most importantly inherit_event() which will avoid
a69b0ca4ac3bf5 kernel/events/core.c Peter Zijlstra      2016-02-24  5722  	 * placing more children on the list.
683ede43dd412c kernel/events/core.c Peter Zijlstra      2014-05-05  5723  	 *
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5724  	 * Thus this guarantees that we will in fact observe and kill _ALL_
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5725  	 * child events.
683ede43dd412c kernel/events/core.c Peter Zijlstra      2014-05-05  5726  	 */
517e6a301f3461 kernel/events/core.c Peter Zijlstra      2022-11-24  5727  	perf_remove_from_context(event, DETACH_GROUP|DETACH_DEAD);
a69b0ca4ac3bf5 kernel/events/core.c Peter Zijlstra      2016-02-24  5728  
a69b0ca4ac3bf5 kernel/events/core.c Peter Zijlstra      2016-02-24  5729  	perf_event_ctx_unlock(event, ctx);
683ede43dd412c kernel/events/core.c Peter Zijlstra      2014-05-05  5730  
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5731  again:
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5732  	mutex_lock(&event->child_mutex);
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15 @5733  	list_for_each_entry(child, &event->child_list, child_list) {
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5734  		/*
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5735  		 * Cannot change, child events are not migrated, see the
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5736  		 * comment with perf_event_ctx_lock_nested().
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5737  		 */
506458efaf153c kernel/events/core.c Will Deacon         2017-10-24  5738  		ctx = READ_ONCE(child->ctx);
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5739  		/*
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5740  		 * Since child_mutex nests inside ctx::mutex, we must jump
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5741  		 * through hoops. We start by grabbing a reference on the ctx.
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5742  		 *
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5743  		 * Since the event cannot get freed while we hold the
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5744  		 * child_mutex, the context must also exist and have a !0
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5745  		 * reference count.
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5746  		 */
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5747  		get_ctx(ctx);
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5748  
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5749  		/*
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5750  		 * Now that we have a ctx ref, we can drop child_mutex, and
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5751  		 * acquire ctx::mutex without fear of it going away. Then we
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5752  		 * can re-acquire child_mutex.
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5753  		 */
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5754  		mutex_unlock(&event->child_mutex);
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5755  		mutex_lock(&ctx->mutex);
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5756  		mutex_lock(&event->child_mutex);
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5757  
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5758  		/*
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5759  		 * Now that we hold ctx::mutex and child_mutex, revalidate our
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5760  		 * state, if child is still the first entry, it didn't get freed
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5761  		 * and we can continue doing so.
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5762  		 */
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5763  		tmp = list_first_entry_or_null(&event->child_list,
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5764  					       struct perf_event, child_list);
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5765  		if (tmp == child) {
0a00a43b8c200d kernel/events/core.c Peter Zijlstra      2025-01-17  5766  			perf_remove_from_context(child, DETACH_GROUP | DETACH_CHILD);
3e8671e00e57b3 kernel/events/core.c Peter Zijlstra      2025-01-17  5767  		} else {
3e8671e00e57b3 kernel/events/core.c Peter Zijlstra      2025-01-17  5768  			child = NULL;
a6fa941d94b411 kernel/events/core.c Al Viro             2012-08-20  5769  		}
a6fa941d94b411 kernel/events/core.c Al Viro             2012-08-20  5770  
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5771  		mutex_unlock(&event->child_mutex);
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5772  		mutex_unlock(&ctx->mutex);
3e8671e00e57b3 kernel/events/core.c Peter Zijlstra      2025-01-17  5773  
3e8671e00e57b3 kernel/events/core.c Peter Zijlstra      2025-01-17 @5774  		if (child) {
3e8671e00e57b3 kernel/events/core.c Peter Zijlstra      2025-01-17  5775  			/* Last reference unless ->pending_task work is pending */
3e8671e00e57b3 kernel/events/core.c Peter Zijlstra      2025-01-17  5776  			put_event(child);
3e8671e00e57b3 kernel/events/core.c Peter Zijlstra      2025-01-17  5777  		}
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5778  		put_ctx(ctx);
74751ef5c1912e kernel/events/core.c Haifeng Xu          2024-05-13  5779  
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5780  		goto again;
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5781  	}
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5782  	mutex_unlock(&event->child_mutex);
c6e5b73242d2d9 kernel/events/core.c Peter Zijlstra      2016-01-15  5783  
a4f4bb6d0c69d0 kernel/events/core.c Peter Zijlstra      2016-02-24  5784  no_ctx:
56799bc0356587 kernel/events/core.c Frederic Weisbecker 2025-03-04  5785  	/*
56799bc0356587 kernel/events/core.c Frederic Weisbecker 2025-03-04  5786  	 * Last reference unless ->pending_task work is pending on this event
56799bc0356587 kernel/events/core.c Frederic Weisbecker 2025-03-04  5787  	 * or any of its children.
56799bc0356587 kernel/events/core.c Frederic Weisbecker 2025-03-04  5788  	 */
56799bc0356587 kernel/events/core.c Frederic Weisbecker 2025-03-04  5789  	put_event(event);
683ede43dd412c kernel/events/core.c Peter Zijlstra      2014-05-05  5790  	return 0;
a6fa941d94b411 kernel/events/core.c Al Viro             2012-08-20  5791  }
683ede43dd412c kernel/events/core.c Peter Zijlstra      2014-05-05  5792  EXPORT_SYMBOL_GPL(perf_event_release_kernel);
a6fa941d94b411 kernel/events/core.c Al Viro             2012-08-20  5793  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
