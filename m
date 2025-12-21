Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6428634C
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 22:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766357304; cv=none; b=Iab/a/TWJpi5gWtd8M2hDYgDHz61xFnXWVUD/td34B5gykgWFHKhFf1RB0LB85sbar/AOCcW1rs+xYOun/WLYxbpK1nBvU+or4tTBgvJa7vhIGPeHAbY9a+DoEcCXJcqc8TUcJauxrjc4OeyccrXUMEsu9f1Xe4O1y3/0VzQ0MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766357304; c=relaxed/simple;
	bh=pnH5UZpzEEP9KI/w/V+SzzQe/Da/qLIC9EHI4irndL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XHEEEi7ohDI16p2tB0LrgTy83pvUngiULWIokp3otvzG+Rp2Auur0MuMPUKPqxaG0pQRvXJG4QvLSXrTMiXmBrfDanSg2aNo++5u2zmLK2EaEOx6xPLlNXHrjjvprfsLDDjG0rSnFfu26tSxwcwjCwfztU6tjhgkSPp2p5FcBUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bN71RsdS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bN71RsdS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766357302; x=1797893302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pnH5UZpzEEP9KI/w/V+SzzQe/Da/qLIC9EHI4irndL8=;
  b=bN71RsdSMJ4CFulzxOfYLPN6VPx0jHX51z58wU+gvtKmXTy1Ech0Q4iA
   YcTsEjZ7FnVrmt8TEUIUfKH0PZ9skkIayU68vKxCzpcGT5sufU9nkQZvC
   kwNOTpD7xc7bQAGLnX8NrWvGQ/JiGybGdfyCSLg6UzOk8fUUyR2FA62zw
   b+omyo+377h/KebeK8n0zYwx8hN42l4YJOTRWygOyRd3YNjunDJ3LCoNE
   Psecf6j/SAv2kEhZKFKQjIswMMRzK8tbPIJL5tAf6bOsrqnNbQTVJg4TQ
   xybWkCpgmafih8kzajVgF8nrgzobohNcv1tNYWVm+M+Lq4MJCFCA1tkqZ
   g==;
X-CSE-ConnectionGUID: FOxHw9ZSQH+C2TTdT01r3Q==
X-CSE-MsgGUID: hdi0HuG/SpiKQyEeRUo2OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78858471"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78858471"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 14:48:21 -0800
X-CSE-ConnectionGUID: YOmhNX9CSNKwn4KR43REoQ==
X-CSE-MsgGUID: jNydeuSRS9qrMj/ruEUmTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="222866121"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2025 14:48:20 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXSDp-000000000GD-46Mb;
	Sun, 21 Dec 2025 22:48:17 +0000
Date: Mon, 22 Dec 2025 06:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:ctx-analysis/dev 24/36]
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c:897
 assert_pending_valid() error: uninitialized symbol 'flags'.
Message-ID: <202512220631.8tsIaLvX-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   716611610a85ff05508277ffc92888daae793783
commit: 0dc9f525e4453407edb250e4be6cab8a0422bcb2 [24/36] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251222 (https://download.01.org/0day-ci/archive/20251222/202512220631.8tsIaLvX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512220631.8tsIaLvX-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:897 assert_pending_valid() error: uninitialized symbol 'flags'.

Old smatch warnings:
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:399 __unwind_incomplete_requests() error: uninitialized symbol 'pl'.
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3948 execlists_create_virtual() warn: assigning (-2) to unsigned variable 've->base.instance'
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3949 execlists_create_virtual() warn: assigning (-2) to unsigned variable 've->base.uabi_instance'

vim +/flags +897 drivers/gpu/drm/i915/gt/intel_execlists_submission.c

f1042cc8537713 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-01-29  774  
e73263367088bf drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2021-01-13  775  static __maybe_unused noinline bool
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  776  assert_pending_valid(const struct intel_engine_execlists *execlists,
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  777  		     const char *msg)
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  778  {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  779  	struct intel_engine_cs *engine =
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  780  		container_of(execlists, typeof(*engine), execlists);
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  781  	struct i915_request * const *port, *rq, *prev = NULL;
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  782  	struct intel_context *ce = NULL;
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  783  	u32 ccid = -1;
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  784  
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  785  	trace_ports(execlists, msg, execlists->pending);
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  786  
f1042cc8537713 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-01-29  787  	/* We may be messing around with the lists during reset, lalala */
22916bad07a5d4 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Matthew Brost  2021-06-17  788  	if (reset_in_progress(engine))
f1042cc8537713 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-01-29  789  		return true;
f1042cc8537713 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-01-29  790  
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  791  	if (!execlists->pending[0]) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  792  		GEM_TRACE_ERR("%s: Nothing pending for promotion!\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  793  			      engine->name);
df403069029dc6 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-08-16  794  		return false;
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  795  	}
df403069029dc6 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-08-16  796  
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  797  	if (execlists->pending[execlists_num_ports(execlists)]) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  798  		GEM_TRACE_ERR("%s: Excess pending[%d] for promotion!\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  799  			      engine->name, execlists_num_ports(execlists));
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  800  		return false;
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  801  	}
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  802  
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  803  	for (port = execlists->pending; (rq = *port); port++) {
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  804  		unsigned long flags;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  805  		bool ok = true;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  806  
80aac91b27e130 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-03  807  		GEM_BUG_ON(!kref_read(&rq->fence.refcount));
80aac91b27e130 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-03  808  		GEM_BUG_ON(!i915_request_is_active(rq));
80aac91b27e130 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-03  809  
9f3ccd40acf4a3 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-20  810  		if (ce == rq->context) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  811  			GEM_TRACE_ERR("%s: Dup context:%llx in pending[%zd]\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  812  				      engine->name,
38098750719cb5 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-01  813  				      ce->timeline->fence_context,
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  814  				      port - execlists->pending);
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  815  			return false;
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  816  		}
9f3ccd40acf4a3 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-20  817  		ce = rq->context;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  818  
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  819  		if (ccid == ce->lrc.ccid) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  820  			GEM_TRACE_ERR("%s: Dup ccid:%x context:%llx in pending[%zd]\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  821  				      engine->name,
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  822  				      ccid, ce->timeline->fence_context,
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  823  				      port - execlists->pending);
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  824  			return false;
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  825  		}
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  826  		ccid = ce->lrc.ccid;
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  827  
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  828  		/*
8733a06323d40e drivers/gpu/drm/i915/gt/intel_lrc.c                  Tvrtko Ursulin 2020-06-07  829  		 * Sentinels are supposed to be the last request so they flush
8733a06323d40e drivers/gpu/drm/i915/gt/intel_lrc.c                  Tvrtko Ursulin 2020-06-07  830  		 * the current execution off the HW. Check that they are the only
8733a06323d40e drivers/gpu/drm/i915/gt/intel_lrc.c                  Tvrtko Ursulin 2020-06-07  831  		 * request in the pending submission.
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  832  		 *
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  833  		 * NB: Due to the async nature of preempt-to-busy and request
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  834  		 * cancellation we need to handle the case where request
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  835  		 * becomes a sentinel in parallel to CSB processing.
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  836  		 */
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  837  		if (prev && i915_request_has_sentinel(prev) &&
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  838  		    !READ_ONCE(prev->fence.error)) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  839  			GEM_TRACE_ERR("%s: context:%llx after sentinel in pending[%zd]\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  840  				      engine->name,
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  841  				      ce->timeline->fence_context,
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  842  				      port - execlists->pending);
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  843  			return false;
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  844  		}
90a79a91dcc0e8 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Tvrtko Ursulin 2021-03-24  845  		prev = rq;
15db5fcce9c8e8 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-03-02  846  
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  847  		/*
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  848  		 * We want virtual requests to only be in the first slot so
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  849  		 * that they are never stuck behind a hog and can be immediately
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  850  		 * transferred onto the next idle engine.
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  851  		 */
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  852  		if (rq->execution_mask != engine->mask &&
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  853  		    port != execlists->pending) {
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  854  			GEM_TRACE_ERR("%s: virtual engine:%llx not in prime position[%zd]\n",
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  855  				      engine->name,
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  856  				      ce->timeline->fence_context,
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  857  				      port - execlists->pending);
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  858  			return false;
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  859  		}
f81475bb5bb483 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  860  
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  861  		/* Hold tightly onto the lock to prevent concurrent retires! */
49e74c8f9ae635 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-03  862  		if (!spin_trylock_irqsave(&rq->lock, flags))
49e74c8f9ae635 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-03  863  			continue;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  864  
6f0726b4807c1e drivers/gpu/drm/i915/gt/intel_execlists_submission.c Chris Wilson   2020-12-24  865  		if (__i915_request_is_complete(rq))
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  866  			goto unlock;
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  867  
e6ba76480299a0 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-21  868  		if (i915_active_is_idle(&ce->active) &&
e6ba76480299a0 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-12-21  869  		    !intel_context_is_barrier(ce)) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  870  			GEM_TRACE_ERR("%s: Inactive context:%llx in pending[%zd]\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  871  				      engine->name,
38098750719cb5 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-01  872  				      ce->timeline->fence_context,
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  873  				      port - execlists->pending);
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  874  			ok = false;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  875  			goto unlock;
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  876  		}
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  877  
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  878  		if (!i915_vma_is_pinned(ce->state)) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  879  			GEM_TRACE_ERR("%s: Unpinned context:%llx in pending[%zd]\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  880  				      engine->name,
38098750719cb5 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-01  881  				      ce->timeline->fence_context,
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  882  				      port - execlists->pending);
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  883  			ok = false;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  884  			goto unlock;
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  885  		}
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  886  
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  887  		if (!i915_vma_is_pinned(ce->ring->vma)) {
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  888  			GEM_TRACE_ERR("%s: Unpinned ring:%llx in pending[%zd]\n",
f6a7c21c991062 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2020-04-28  889  				      engine->name,
38098750719cb5 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-01  890  				      ce->timeline->fence_context,
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  891  				      port - execlists->pending);
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  892  			ok = false;
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  893  			goto unlock;
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  894  		}
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  895  
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  896  unlock:
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21 @897  		spin_unlock_irqrestore(&rq->lock, flags);
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  898  		if (!ok)
c95d31c3df1b9f drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-11-21  899  			return false;
c97fb526ca0666 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-10-10  900  	}
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  901  
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  902  	return ce;
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  903  }
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris Wilson   2019-06-20  904  

:::::: The code at line 897 was first introduced by commit
:::::: c95d31c3df1b9ff29bcd85c47324e16d430bbd5a drm/i915/execlists: Lock the request while validating it during promotion

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
