Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51761BD035
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Aug 2025 06:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978629; cv=none; b=nzRAILgjxD+MzRjXNedp9uDd1yQ9wUKHKWi1ZVZQ6D/4iQCS/2iuYDlcBo83IE2Ucnwl305NUpz2AnJp9NR4gz0xdBFSJHKqY8eyqnjalmrQbgx5/EI0K14Qnfk72jOQ5pM2D0O4SXJbGqg3Q/VOGOj0XLBaZGOjoU+PDlGa6qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978629; c=relaxed/simple;
	bh=532ihOwxzZB8VSBGJVznxD/y+4l+1fKrTYGSixhiqmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hhrJqHusu/FTSwHpfHrwvSYqi0oEO/4VgwPqPDMovG2OG0uqzcys7bKrWc8+dsTKrjJpxhcFxaqwEKPRLg3BT7N7IWyLmfZvhh8M5yVIqBlgA/ZHst9unmzWRYIIH0kLR+VUgY3eqCv3scJYdSLJjthRBxE65DMe6pKdGEcWAa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6QWa2JH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6QWa2JH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754978628; x=1786514628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=532ihOwxzZB8VSBGJVznxD/y+4l+1fKrTYGSixhiqmM=;
  b=G6QWa2JHF25lB3Pxbbwfczx3zwyhoC8askFafEFYmbusuMFSzaS6aSBb
   RmcFtzFVShiRVt46UmNRPW6FZTW35r5U8fKY7bjh1qZ0Oqo3f/g+u5ZaG
   GJ+zmKn67hqZLtJuOv6F9lZ9ZHbDIF8sZ5sWgFIqpnu/zdNlQs/cqcRYp
   vL6O0rRXsX0aaMTM2Sshe0/VXBNOI5whFCDIjr6J28NFwHtWbohFvRxqK
   w13E1KsAd2i5xOlhFaH6WWwN5+SHwjqH24YBoIHKKzvV3g+G2iztvGvD/
   G7xHw/xe3E0ixE5cYjj9AXaF1hA5ef6skiCyGSCjNXL73Bbpc8lDRRc9T
   g==;
X-CSE-ConnectionGUID: WB58XzvhSxW//nOFXIKphg==
X-CSE-MsgGUID: 4msLCUE/SQe66NSRxIgqpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="82681661"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="82681661"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 23:03:47 -0700
X-CSE-ConnectionGUID: pnXFaTViSpSETsfilP1OiQ==
X-CSE-MsgGUID: eSgh3wExQdeOh7rNExRClg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="171451199"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 11 Aug 2025 23:03:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uli6R-0006SG-2u;
	Tue, 12 Aug 2025 06:03:32 +0000
Date: Tue, 12 Aug 2025 14:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/events/core.c:5774:6-11: ERROR: iterator variable bound on
 line 5733 cannot be NULL
Message-ID: <202508121433.z4SqmQDl-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ravi Bangoria <ravi.bangoria@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   53e760d8949895390e256e723e7ee46618310361
commit: 3e8671e00e57b3d006ed8ae5ef055807506e44b2 perf: Simplify perf_event_release_kernel()
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-r063-20250812 (https://download.01.org/0day-ci/archive/20250812/202508121433.z4SqmQDl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508121433.z4SqmQDl-lkp@intel.com/

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
