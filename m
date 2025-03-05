Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060B81EE03B
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Mar 2025 23:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741216792; cv=none; b=bW/SzWUd4M/h0spLO0TmwWl7QTk0WUk+QGMEgnxWsttdUgDzwGmPmBfuOVoUapcaqJ+8QTzCaJuGeX/4/pqpnSOTCQ4qbsEGBdV5UzJXDSqhpwxG+piInxiOMAdqmkhq72Kj887TH7QAlBjSMwNHARI3h5HViZZa2lbE2/GBcTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741216792; c=relaxed/simple;
	bh=h47uZkxf2fMcvMrVQWuHKT7vwbnIUxxhWEmcg7ftNhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wd/Z/HRinC13mGMAsaizrnuNPg43d56Ha/oEzbO7sIEn7cwNUoIii3ZAul5++wBhf3RMbPEZYUFXLYiaedSZUTH9uqWzFlqs4qPbkH0RyTEgqbMqtcUiEe4WKnw7ADeXdwlCaeIivoX06sdeg/GTm4nmh4F5TIitpoUs5uEVWAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6binAsp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6binAsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741216790; x=1772752790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h47uZkxf2fMcvMrVQWuHKT7vwbnIUxxhWEmcg7ftNhI=;
  b=A6binAspjTg0vQpJmoZbtSGUrrv+Csop7WfDieMh4VwhPoQJhy7L3CHB
   Lm339TK/AlJBDUto5dcleIwqRpKTa/YsLpuAeptyNyiB1bLOsfYr5TrKB
   ylZGbM2gFp/rlxbINvdSsxwvlVubRXQ2ncGivFDTfnNQZRokiRl337TWd
   +wJzf8pZ6ToO+9gWl3qoBYHKtt6aHgB5IJlK7Odej9o8Kuc69PRbO7rl1
   8BZ2/SDntl3vP76JsbMraE2mzfsy84c3mVTZPbqCTu20YkZOKEsW+4ucV
   DsJqglOznB28I16PXb87yDdZuDev5GvLD1QxP/G3lv8AKORFvEDabpqh8
   A==;
X-CSE-ConnectionGUID: 9hqQlnhOT8CLmMDnzY2e7g==
X-CSE-MsgGUID: 2Xx/Bv1DRMKRk1JH7H/a5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59613102"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="59613102"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 15:19:50 -0800
X-CSE-ConnectionGUID: HCVsBvRfRfCHwGmnBzRWRg==
X-CSE-MsgGUID: DvmQsbPJTMqH9mOrKD5xIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="149607169"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2025 15:19:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpy1h-000MJ8-2d;
	Wed, 05 Mar 2025 23:19:45 +0000
Date: Thu, 6 Mar 2025 07:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:locking/core 24/35]
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c:891
 assert_pending_valid() error: uninitialized symbol 'flags'.
Message-ID: <202503060731.nwgOwXQP-lkp@intel.com>
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
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   c90cac58f80cc4268e8799fe51a0ced91220428a
commit: 810bdf94357610e2f9fb997a486a16a0acc0efd2 [24/35] compiler-capability-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-141-20250306 (https://download.01.org/0day-ci/archive/20250306/202503060731.nwgOwXQP-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503060731.nwgOwXQP-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:891 assert_pending_valid() error: uninitialized symbol 'flags'.

Old smatch warnings:
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:393 __unwind_incomplete_requests() error: uninitialized symbol 'pl'.
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:1607 execlists_dequeue() warn: inconsistent returns '&sched_engine->lock'.
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3942 execlists_create_virtual() warn: assigning (-2) to unsigned variable 've->base.instance'
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3943 execlists_create_virtual() warn: assigning (-2) to unsigned variable 've->base.uabi_instance'

vim +/flags +891 drivers/gpu/drm/i915/gt/intel_execlists_submission.c

f1042cc8537713 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-01-29  768  
e73263367088bf drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2021-01-13  769  static __maybe_unused noinline bool
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  770  assert_pending_valid(const struct intel_engine_execlists *execlists,
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  771  		     const char *msg)
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  772  {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  773  	struct intel_engine_cs *engine =
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  774  		container_of(execlists, typeof(*engine), execlists);
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  775  	struct i915_request * const *port, *rq, *prev = NULL;
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  776  	struct intel_context *ce = NULL;
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  777  	u32 ccid = -1;
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  778  
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  779  	trace_ports(execlists, msg, execlists->pending);
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  780  
f1042cc8537713 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-01-29  781  	/* We may be messing around with the lists during reset, lalala */
22916bad07a5d4 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Matthew Brost  2021-06-17  782  	if (reset_in_progress(engine))
f1042cc8537713 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-01-29  783  		return true;
f1042cc8537713 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-01-29  784  
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  785  	if (!execlists->pending[0]) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  786  		GEM_TRACE_ERR("%s: Nothing pending for promotion!\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  787  			      engine->name);
df403069029dc6 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-08-16  788  		return false;
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  789  	}
df403069029dc6 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-08-16  790  
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  791  	if (execlists->pending[execlists_num_ports(execlists)]) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  792  		GEM_TRACE_ERR("%s: Excess pending[%d] for promotion!\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  793  			      engine->name, execlists_num_ports(execlists));
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  794  		return false;
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  795  	}
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  796  
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  797  	for (port = execlists->pending; (rq = *port); port++) {
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  798  		unsigned long flags;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  799  		bool ok = true;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  800  
80aac91b27e130 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-03  801  		GEM_BUG_ON(!kref_read(&rq->fence.refcount));
80aac91b27e130 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-03  802  		GEM_BUG_ON(!i915_request_is_active(rq));
80aac91b27e130 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-03  803  
9f3ccd40acf4a3 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-20  804  		if (ce == rq->context) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  805  			GEM_TRACE_ERR("%s: Dup context:%llx in pending[%zd]\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  806  				      engine->name,
38098750719cb5 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-01  807  				      ce->timeline->fence_context,
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  808  				      port - execlists->pending);
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  809  			return false;
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  810  		}
9f3ccd40acf4a3 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-20  811  		ce = rq->context;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  812  
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  813  		if (ccid == ce->lrc.ccid) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  814  			GEM_TRACE_ERR("%s: Dup ccid:%x context:%llx in pending[%zd]\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  815  				      engine->name,
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  816  				      ccid, ce->timeline->fence_context,
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  817  				      port - execlists->pending);
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  818  			return false;
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  819  		}
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  820  		ccid = ce->lrc.ccid;
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  821  
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  822  		/*
8733a06323d40e drivers/gpu/drm/i915/gt/intel_lrc.c                  Tvrtko Ursulin 2020-06-07  823  		 * Sentinels are supposed to be the last request so they flush
8733a06323d40e drivers/gpu/drm/i915/gt/intel_lrc.c                  Tvrtko Ursulin 2020-06-07  824  		 * the current execution off the HW. Check that they are the only
8733a06323d40e drivers/gpu/drm/i915/gt/intel_lrc.c                  Tvrtko Ursulin 2020-06-07  825  		 * request in the pending submission.
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  826  		 *
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  827  		 * NB: Due to the async nature of preempt-to-busy and request
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  828  		 * cancellation we need to handle the case where request
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  829  		 * becomes a sentinel in parallel to CSB processing.
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  830  		 */
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  831  		if (prev && i915_request_has_sentinel(prev) &&
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  832  		    !READ_ONCE(prev->fence.error)) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  833  			GEM_TRACE_ERR("%s: context:%llx after sentinel in pending[%zd]\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  834  				      engine->name,
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  835  				      ce->timeline->fence_context,
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  836  				      port - execlists->pending);
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  837  			return false;
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  838  		}
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  839  		prev = rq;
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  840  
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  841  		/*
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  842  		 * We want virtual requests to only be in the first slot so
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  843  		 * that they are never stuck behind a hog and can be immediately
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  844  		 * transferred onto the next idle engine.
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  845  		 */
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  846  		if (rq->execution_mask != engine->mask &&
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  847  		    port != execlists->pending) {
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  848  			GEM_TRACE_ERR("%s: virtual engine:%llx not in prime position[%zd]\n",
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  849  				      engine->name,
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  850  				      ce->timeline->fence_context,
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  851  				      port - execlists->pending);
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  852  			return false;
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  853  		}
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  854  
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  855  		/* Hold tightly onto the lock to prevent concurrent retires! */
49e74c8f9ae635 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-03  856  		if (!spin_trylock_irqsave(&rq->lock, flags))
49e74c8f9ae635 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-03  857  			continue;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  858  
6f0726b4807c1e drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  859  		if (__i915_request_is_complete(rq))
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  860  			goto unlock;
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  861  
e6ba76480299a0 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-21  862  		if (i915_active_is_idle(&ce->active) &&
e6ba76480299a0 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-21  863  		    !intel_context_is_barrier(ce)) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  864  			GEM_TRACE_ERR("%s: Inactive context:%llx in pending[%zd]\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  865  				      engine->name,
38098750719cb5 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-01  866  				      ce->timeline->fence_context,
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  867  				      port - execlists->pending);
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  868  			ok = false;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  869  			goto unlock;
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  870  		}
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  871  
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  872  		if (!i915_vma_is_pinned(ce->state)) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  873  			GEM_TRACE_ERR("%s: Unpinned context:%llx in pending[%zd]\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  874  				      engine->name,
38098750719cb5 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-01  875  				      ce->timeline->fence_context,
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  876  				      port - execlists->pending);
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  877  			ok = false;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  878  			goto unlock;
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  879  		}
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  880  
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  881  		if (!i915_vma_is_pinned(ce->ring->vma)) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  882  			GEM_TRACE_ERR("%s: Unpinned ring:%llx in pending[%zd]\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  883  				      engine->name,
38098750719cb5 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-01  884  				      ce->timeline->fence_context,
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  885  				      port - execlists->pending);
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  886  			ok = false;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  887  			goto unlock;
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  888  		}
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  889  
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  890  unlock:
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21 @891  		spin_unlock_irqrestore(&rq->lock, flags);
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  892  		if (!ok)
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  893  			return false;
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  894  	}
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  895  
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  896  	return ce;
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  897  }
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  898  

:::::: The code at line 891 was first introduced by commit
:::::: c95d31c3df1b9ff29bcd85c47324e16d430bbd5a drm/i915/execlists: Lock the request while validating it during promotion

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
