Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8D078C91
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Apr 2025 04:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744517507; cv=none; b=uoJPgrTM6jBsqk0iBJ51z4rG94LbJj9MhX1e9dD+j3PcUytV9ltIULFxsqreYWaD9odSmG+aCRtYfng99IjBzrReK9zoZ767aRKzOyvcFBNpzK32Bkxtbnf6Iy/7rubnlZqQJJm4BHChvofI3D8s+T3SBUSHTocSgqA5ZHjyoyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744517507; c=relaxed/simple;
	bh=5+1oM48sGu1v6XOwQjgju8U6Wkqjovc0Gd9VJOSR1qw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQEp6cfu1ChNPitoR0myL3zQTq2AO7qDaBfB+8J5jmggZlc629cjvmgxScQ3KwUFVrn4UkZ9Y5RmH19cWy5Q+hCIJj5CozN4htsHGrHzuVW4yhfaq1cexYy6VK83bQSRrLZDCI+ErR0I8iEdqd/4hzG9+obhr17pvLLBLJi/rKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdy5su0d; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdy5su0d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744517502; x=1776053502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5+1oM48sGu1v6XOwQjgju8U6Wkqjovc0Gd9VJOSR1qw=;
  b=cdy5su0dmLT6aW8LC7GiqQYNBPeVpMlfFRHSy6t7NtDApKmVTJ+4Vbor
   UtaZGRGqrNFZMgsUEWmSEA/qH0mWMza2nvR/cbq3NDj1w6wBI0z8qaFwL
   XN9TkMTkVS7kPbUMtDBVA0jvOj6+bbvVDCOFKPULY/870D+LLlSGwUZ7F
   IKB2pumD25Si2HfMn9VL5pt3/QyEkLDwnKFd1i6a8dSu5AfdPrIlGdS7V
   idfUTum7M8A85idkfBfRpwXMz2V6yBZg5tKDGUftHmSdhVDINrj7ptkSq
   vmF4mTEU9Va4kLyzVbK7r5HLfAwAukQm/uXrdcJAPP/XJo/dakWQSIZxf
   A==;
X-CSE-ConnectionGUID: Uua0xkRcTj2CmPl691Ydvw==
X-CSE-MsgGUID: 4xzMNvVVTTG+xBRO0Rg45g==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46152983"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="46152983"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 21:11:39 -0700
X-CSE-ConnectionGUID: ebav7eZtQlu+AYXewFsVvQ==
X-CSE-MsgGUID: ee/Bn22MSfOOsb3ADnwhxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="129861075"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Apr 2025 21:11:38 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3ogx-000CMi-2n;
	Sun, 13 Apr 2025 04:11:35 +0000
Date: Sun, 13 Apr 2025 12:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tip:perf/core 5/13] kernel/events/core.c:5774:6-11: ERROR: iterator
 variable bound on line 5733 cannot be NULL
Message-ID: <202504131217.uBg7uyR2-lkp@intel.com>
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
CC: x86@kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ravi Bangoria <ravi.bangoria@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
head:   1734d98fbcce343eafba16e18e3a3001b3e94ab5
commit: 3e8671e00e57b3d006ed8ae5ef055807506e44b2 [5/13] perf: Simplify perf_event_release_kernel()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arc-randconfig-r051-20250413 (https://download.01.org/0day-ci/archive/20250413/202504131217.uBg7uyR2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504131217.uBg7uyR2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/events/core.c:5774:6-11: ERROR: iterator variable bound on line 5733 cannot be NULL
--
>> kernel/events/core.c:5733:1-20: iterator with update on line 5768

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
3e8671e00e57b3 kernel/events/core.c Peter Zijlstra      2025-01-17 @5768  			child = NULL;
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
