Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7C034F461
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 06:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768370864; cv=none; b=oWNugQlJUZoUN5RmRnHSUIyYskYxxeLtog8LVOb7S09wfRoxd9RVLgWrCAipRn9G+ZcgH49C0oi5wqj4qhO2nKapWOgDIGDpSuOUNupU7HFAVDQsn8HjXNsiFhzBWAhiY2+2WF9NpB0lrMQcX7wlUfwpWzKqtmzLGGVXwW6c3V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768370864; c=relaxed/simple;
	bh=/UNzzpkYpHSszzHIhtBMCYPnXassLhW3c895dy24Rz8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fGkIr0iWmG1aIMOMXd2b5+YcPHiWtUtMKdPIw3UhPZT5ksZoTQDADUe/8xxZ+Zufm3cj+OInAbtDKgVgNs+9lqmX1FN0zcEF7qAFTh2m0OO5Bv40slUWSI3v4Kex5SeOIUgQoPk/63IzeADWBbmCyC+aFXzfMRLoxLklkWVJt/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPvE0xG3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPvE0xG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768370854; x=1799906854;
  h=date:from:to:cc:subject:message-id;
  bh=/UNzzpkYpHSszzHIhtBMCYPnXassLhW3c895dy24Rz8=;
  b=mPvE0xG3KAKCuRHcDJaLZ/813UBW4AlYA9Fp5X0eXhLqgz8sOia2P5kk
   0LVt8+CwSLBnIXjpF0uOU24CHiUNqhEyO5ib0XxfuA42rMqYjI/LJnv6s
   ZvFdux/cRuJ1IHsiFt+nkewKWphw3unThwZILooUs54qUkkjmn4zC558Z
   Gqe97s6v9bYdZ6OqQRcqMntCI/avsTrRL0K1uKr3bR6TEPgp697QdNv82
   ZzlDQ56vXG71qUNHCzXbudyJmCOKM/UsG2z0EnRk6TUKWzvAM8kHWW4Tt
   kvYCi33aP24unQ8mQgxrXrLVKPF2/76kq2EQp0FGzg94kjcz2TGJl6FBi
   A==;
X-CSE-ConnectionGUID: VghzCEnAQtiu9KX0i9Farg==
X-CSE-MsgGUID: g1yW8xxETpqlXBIcqPy7Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81028787"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="81028787"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 22:07:17 -0800
X-CSE-ConnectionGUID: shOp0BlMRI6BwVBXs8WiSQ==
X-CSE-MsgGUID: /Giz9i4KSHyat88DjW550A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="205007542"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jan 2026 22:07:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfu2D-00000000FuA-17XV;
	Wed, 14 Jan 2026 06:07:13 +0000
Date: Wed, 14 Jan 2026 14:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/events/core.c:5774:6-11: ERROR: iterator variable
 bound on line 5733 cannot be NULL
Message-ID: <202601141439.xjfygGT1-lkp@intel.com>
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
head:   b54345928fa1dbde534e32ecaa138678fd5d2135
commit: 3e8671e00e57b3d006ed8ae5ef055807506e44b2 perf: Simplify perf_event_release_kernel()
date:   9 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 months ago
config: hexagon-randconfig-r054-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141439.xjfygGT1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601141439.xjfygGT1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/events/core.c:5774:6-11: ERROR: iterator variable bound on line 5733 cannot be NULL

vim +5774 kernel/events/core.c

c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5689  
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5690  /*
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5691   * Kill an event dead; while event:refcount will preserve the event
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5692   * object, it will not preserve its functionality. Once the last 'user'
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5693   * gives up the object, we'll destroy the thing.
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5694   */
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5695  int perf_event_release_kernel(struct perf_event *event)
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5696  {
a4f4bb6d0c69d0b kernel/events/core.c Peter Zijlstra      2016-02-24  5697  	struct perf_event_context *ctx = event->ctx;
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5698  	struct perf_event *child, *tmp;
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5699  
a4f4bb6d0c69d0b kernel/events/core.c Peter Zijlstra      2016-02-24  5700  	/*
bd27568117664b8 kernel/events/core.c Peter Zijlstra      2022-10-08  5701  	 * If we got here through err_alloc: free_event(event); we will not
bd27568117664b8 kernel/events/core.c Peter Zijlstra      2022-10-08  5702  	 * have attached to a context yet.
a4f4bb6d0c69d0b kernel/events/core.c Peter Zijlstra      2016-02-24  5703  	 */
a4f4bb6d0c69d0b kernel/events/core.c Peter Zijlstra      2016-02-24  5704  	if (!ctx) {
a4f4bb6d0c69d0b kernel/events/core.c Peter Zijlstra      2016-02-24  5705  		WARN_ON_ONCE(event->attach_state &
a4f4bb6d0c69d0b kernel/events/core.c Peter Zijlstra      2016-02-24  5706  				(PERF_ATTACH_CONTEXT|PERF_ATTACH_GROUP));
a4f4bb6d0c69d0b kernel/events/core.c Peter Zijlstra      2016-02-24  5707  		goto no_ctx;
a4f4bb6d0c69d0b kernel/events/core.c Peter Zijlstra      2016-02-24  5708  	}
a4f4bb6d0c69d0b kernel/events/core.c Peter Zijlstra      2016-02-24  5709  
f86977620ee4635 kernel/events/core.c Jiri Olsa           2014-08-01  5710  	if (!is_kernel_event(event))
f86977620ee4635 kernel/events/core.c Jiri Olsa           2014-08-01  5711  		perf_remove_from_owner(event);
8882135bcd332f2 kernel/perf_event.c  Peter Zijlstra      2010-11-09  5712  
5fa7c8ec57f70a7 kernel/events/core.c Peter Zijlstra      2016-01-26  5713  	ctx = perf_event_ctx_lock(event);
a83fe28e2e45392 kernel/events/core.c Peter Zijlstra      2015-01-29  5714  	WARN_ON_ONCE(ctx->parent_ctx);
683ede43dd412c6 kernel/events/core.c Peter Zijlstra      2014-05-05  5715  
683ede43dd412c6 kernel/events/core.c Peter Zijlstra      2014-05-05  5716  	/*
d8a8cfc76919b6c kernel/events/core.c Peter Zijlstra      2017-03-16  5717  	 * Mark this event as STATE_DEAD, there is no external reference to it
a69b0ca4ac3bf54 kernel/events/core.c Peter Zijlstra      2016-02-24  5718  	 * anymore.
683ede43dd412c6 kernel/events/core.c Peter Zijlstra      2014-05-05  5719  	 *
a69b0ca4ac3bf54 kernel/events/core.c Peter Zijlstra      2016-02-24  5720  	 * Anybody acquiring event->child_mutex after the below loop _must_
a69b0ca4ac3bf54 kernel/events/core.c Peter Zijlstra      2016-02-24  5721  	 * also see this, most importantly inherit_event() which will avoid
a69b0ca4ac3bf54 kernel/events/core.c Peter Zijlstra      2016-02-24  5722  	 * placing more children on the list.
683ede43dd412c6 kernel/events/core.c Peter Zijlstra      2014-05-05  5723  	 *
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5724  	 * Thus this guarantees that we will in fact observe and kill _ALL_
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5725  	 * child events.
683ede43dd412c6 kernel/events/core.c Peter Zijlstra      2014-05-05  5726  	 */
517e6a301f34613 kernel/events/core.c Peter Zijlstra      2022-11-24  5727  	perf_remove_from_context(event, DETACH_GROUP|DETACH_DEAD);
a69b0ca4ac3bf54 kernel/events/core.c Peter Zijlstra      2016-02-24  5728  
a69b0ca4ac3bf54 kernel/events/core.c Peter Zijlstra      2016-02-24  5729  	perf_event_ctx_unlock(event, ctx);
683ede43dd412c6 kernel/events/core.c Peter Zijlstra      2014-05-05  5730  
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5731  again:
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5732  	mutex_lock(&event->child_mutex);
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15 @5733  	list_for_each_entry(child, &event->child_list, child_list) {
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5734  		/*
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5735  		 * Cannot change, child events are not migrated, see the
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5736  		 * comment with perf_event_ctx_lock_nested().
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5737  		 */
506458efaf153c1 kernel/events/core.c Will Deacon         2017-10-24  5738  		ctx = READ_ONCE(child->ctx);
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5739  		/*
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5740  		 * Since child_mutex nests inside ctx::mutex, we must jump
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5741  		 * through hoops. We start by grabbing a reference on the ctx.
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5742  		 *
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5743  		 * Since the event cannot get freed while we hold the
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5744  		 * child_mutex, the context must also exist and have a !0
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5745  		 * reference count.
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5746  		 */
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5747  		get_ctx(ctx);
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5748  
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5749  		/*
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5750  		 * Now that we have a ctx ref, we can drop child_mutex, and
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5751  		 * acquire ctx::mutex without fear of it going away. Then we
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5752  		 * can re-acquire child_mutex.
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5753  		 */
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5754  		mutex_unlock(&event->child_mutex);
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5755  		mutex_lock(&ctx->mutex);
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5756  		mutex_lock(&event->child_mutex);
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5757  
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5758  		/*
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5759  		 * Now that we hold ctx::mutex and child_mutex, revalidate our
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5760  		 * state, if child is still the first entry, it didn't get freed
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5761  		 * and we can continue doing so.
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5762  		 */
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5763  		tmp = list_first_entry_or_null(&event->child_list,
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5764  					       struct perf_event, child_list);
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5765  		if (tmp == child) {
0a00a43b8c200df kernel/events/core.c Peter Zijlstra      2025-01-17  5766  			perf_remove_from_context(child, DETACH_GROUP | DETACH_CHILD);
3e8671e00e57b3d kernel/events/core.c Peter Zijlstra      2025-01-17  5767  		} else {
3e8671e00e57b3d kernel/events/core.c Peter Zijlstra      2025-01-17  5768  			child = NULL;
a6fa941d94b411b kernel/events/core.c Al Viro             2012-08-20  5769  		}
a6fa941d94b411b kernel/events/core.c Al Viro             2012-08-20  5770  
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5771  		mutex_unlock(&event->child_mutex);
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5772  		mutex_unlock(&ctx->mutex);
3e8671e00e57b3d kernel/events/core.c Peter Zijlstra      2025-01-17  5773  
3e8671e00e57b3d kernel/events/core.c Peter Zijlstra      2025-01-17 @5774  		if (child) {
3e8671e00e57b3d kernel/events/core.c Peter Zijlstra      2025-01-17  5775  			/* Last reference unless ->pending_task work is pending */
3e8671e00e57b3d kernel/events/core.c Peter Zijlstra      2025-01-17  5776  			put_event(child);
3e8671e00e57b3d kernel/events/core.c Peter Zijlstra      2025-01-17  5777  		}
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5778  		put_ctx(ctx);
74751ef5c1912eb kernel/events/core.c Haifeng Xu          2024-05-13  5779  
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5780  		goto again;
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5781  	}
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5782  	mutex_unlock(&event->child_mutex);
c6e5b73242d2d91 kernel/events/core.c Peter Zijlstra      2016-01-15  5783  
a4f4bb6d0c69d0b kernel/events/core.c Peter Zijlstra      2016-02-24  5784  no_ctx:
56799bc03565873 kernel/events/core.c Frederic Weisbecker 2025-03-04  5785  	/*
56799bc03565873 kernel/events/core.c Frederic Weisbecker 2025-03-04  5786  	 * Last reference unless ->pending_task work is pending on this event
56799bc03565873 kernel/events/core.c Frederic Weisbecker 2025-03-04  5787  	 * or any of its children.
56799bc03565873 kernel/events/core.c Frederic Weisbecker 2025-03-04  5788  	 */
56799bc03565873 kernel/events/core.c Frederic Weisbecker 2025-03-04  5789  	put_event(event);
683ede43dd412c6 kernel/events/core.c Peter Zijlstra      2014-05-05  5790  	return 0;
a6fa941d94b411b kernel/events/core.c Al Viro             2012-08-20  5791  }
683ede43dd412c6 kernel/events/core.c Peter Zijlstra      2014-05-05  5792  EXPORT_SYMBOL_GPL(perf_event_release_kernel);
a6fa941d94b411b kernel/events/core.c Al Viro             2012-08-20  5793  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
