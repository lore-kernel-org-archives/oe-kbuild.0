Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070731171C
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 04:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710043919; cv=none; b=TDWlO7Afz0pM6TTpP11LsWen0wVjQ8yFjkA5U+mkped9+Q/LHoj5nomWc++DIcoioPYbX2audxmX/th9TMquEFMPHRZ5UENfuY7R9s0Dxo6vqvEafnNEPNZJ4QnnhSkG+aMf5Flmw747tHx2eiFPeErM5OaDmaXAx8ZbapmZlfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710043919; c=relaxed/simple;
	bh=J/YIdqm3sv3Yf6lOaNKNC2dOwDcIPcZoiH9dbXpWKYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RT97Dx8tl2t+Q/KPFpK9oRL80R+Q5OCTJjNL0mVtWXCdaMxVAm+n4HSrG54ElB+AvBjwjvWZKtLxeftq2pFGkT8SLTbNRIxPaOmKMscUPxCVBZmN0mYQyuxTtnINVlcu5X1G3c0nPcVy8x+FO7j8DSrVnPT9ARF/I+L4wAA3Cog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnkTx7F/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnkTx7F/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710043917; x=1741579917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J/YIdqm3sv3Yf6lOaNKNC2dOwDcIPcZoiH9dbXpWKYA=;
  b=bnkTx7F/GinZs+iC17temHO9X9xwbkyTiYS5Gsmv/NLg95iYRM2rsafL
   cHhElQ8PvPB9YqDMwWs6SxY8t9u103WV10CkPL37sXgPGzoN+IYJDELwR
   pagd1OIqYVuUFYrqR1udUe8ujU4imM8HSoAqFQhlW3RDGIAa7dliai6TU
   H/npYgMOHl1i+ba7iuaOmjT4P0iosPDYsl3y9jfM5vFNhXPsjelTv3UBK
   0nsIibH+ywFLB5QOAKWvqbJhH2tItQ48bEJtXEcbppww/nunjUsxWdCFN
   gJeePKHGUSL7nu9jtzTllApGkm5kSxFB0W+Vgl10eJnbqoIW8eKSVKXC9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4596615"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="4596615"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 20:11:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="10843543"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Mar 2024 20:11:53 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjAXN-0007uB-27;
	Sun, 10 Mar 2024 04:11:49 +0000
Date: Sun, 10 Mar 2024 12:11:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-intel:for-linux-next-gt 1/4]
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2680
 guc_context_policy_init_v70() warn: variable dereferenced before check 'ce'
 (see line 2663)
Message-ID: <202403101225.7AheJhZJ-lkp@intel.com>
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
CC: intel-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
TO: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: John Harrison <John.C.Harrison@Intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   git://anongit.freedesktop.org/drm-intel for-linux-next-gt
head:   7ad6a8fae597af7fae5193efc73276609337c360
commit: cec82816d0d018f178b9b7f88fe4bf80d66954e9 [1/4] drm/i915/guc: Use context hints for GT frequency
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240309 (https://download.01.org/0day-ci/archive/20240310/202403101225.7AheJhZJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403101225.7AheJhZJ-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2680 guc_context_policy_init_v70() warn: variable dereferenced before check 'ce' (see line 2663)

Old smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1795 __unwind_incomplete_requests() error: uninitialized symbol 'pl'.
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:5839 guc_create_virtual() warn: assigning (-2) to unsigned variable 've->base.instance'
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:5840 guc_create_virtual() warn: assigning (-2) to unsigned variable 've->base.uabi_instance'

vim +/ce +2680 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

2584b3549f4c40 John Harrison          2022-04-12  2660  
774ce1510e6ccb Daniele Ceraolo Spurio 2022-07-18  2661  static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
2584b3549f4c40 John Harrison          2022-04-12  2662  {
2584b3549f4c40 John Harrison          2022-04-12 @2663  	struct intel_engine_cs *engine = ce->engine;
3f2f20da79b208 Andi Shyti             2023-12-29  2664  	struct intel_guc *guc = gt_to_guc(engine->gt);
2584b3549f4c40 John Harrison          2022-04-12  2665  	struct context_policy policy;
2584b3549f4c40 John Harrison          2022-04-12  2666  	u32 execution_quantum;
2584b3549f4c40 John Harrison          2022-04-12  2667  	u32 preemption_timeout;
cec82816d0d018 Vinay Belgaumkar       2024-03-05  2668  	u32 slpc_ctx_freq_req = 0;
2584b3549f4c40 John Harrison          2022-04-12  2669  	unsigned long flags;
2584b3549f4c40 John Harrison          2022-04-12  2670  	int ret;
3a4bfa091c46e9 Rahul Kumar Singh      2021-07-26  2671  
7935785240508c John Harrison          2021-07-26  2672  	/* NB: For both of these, zero means disabled. */
568944af44e753 John Harrison          2022-10-06  2673  	GEM_BUG_ON(overflows_type(engine->props.timeslice_duration_ms * 1000,
568944af44e753 John Harrison          2022-10-06  2674  				  execution_quantum));
568944af44e753 John Harrison          2022-10-06  2675  	GEM_BUG_ON(overflows_type(engine->props.preempt_timeout_ms * 1000,
568944af44e753 John Harrison          2022-10-06  2676  				  preemption_timeout));
2584b3549f4c40 John Harrison          2022-04-12  2677  	execution_quantum = engine->props.timeslice_duration_ms * 1000;
2584b3549f4c40 John Harrison          2022-04-12  2678  	preemption_timeout = engine->props.preempt_timeout_ms * 1000;
2584b3549f4c40 John Harrison          2022-04-12  2679  
cec82816d0d018 Vinay Belgaumkar       2024-03-05 @2680  	if (ce && (ce->flags & BIT(CONTEXT_LOW_LATENCY)))
cec82816d0d018 Vinay Belgaumkar       2024-03-05  2681  		slpc_ctx_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
cec82816d0d018 Vinay Belgaumkar       2024-03-05  2682  
2584b3549f4c40 John Harrison          2022-04-12  2683  	__guc_context_policy_start_klv(&policy, ce->guc_id.id);
2584b3549f4c40 John Harrison          2022-04-12  2684  
2584b3549f4c40 John Harrison          2022-04-12  2685  	__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
2584b3549f4c40 John Harrison          2022-04-12  2686  	__guc_context_policy_add_execution_quantum(&policy, execution_quantum);
2584b3549f4c40 John Harrison          2022-04-12  2687  	__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
cec82816d0d018 Vinay Belgaumkar       2024-03-05  2688  	__guc_context_policy_add_slpc_ctx_freq_req(&policy, slpc_ctx_freq_req);
2584b3549f4c40 John Harrison          2022-04-12  2689  
2584b3549f4c40 John Harrison          2022-04-12  2690  	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
2584b3549f4c40 John Harrison          2022-04-12  2691  		__guc_context_policy_add_preempt_to_idle(&policy, 1);
2584b3549f4c40 John Harrison          2022-04-12  2692  
2584b3549f4c40 John Harrison          2022-04-12  2693  	ret = __guc_context_set_context_policies(guc, &policy, loop);
2584b3549f4c40 John Harrison          2022-04-12  2694  
2584b3549f4c40 John Harrison          2022-04-12  2695  	spin_lock_irqsave(&ce->guc_state.lock, flags);
6c82c75230b87d Daniele Ceraolo Spurio 2022-07-27  2696  	if (ret != 0)
2584b3549f4c40 John Harrison          2022-04-12  2697  		set_context_policy_required(ce);
2584b3549f4c40 John Harrison          2022-04-12  2698  	else
2584b3549f4c40 John Harrison          2022-04-12  2699  		clr_context_policy_required(ce);
2584b3549f4c40 John Harrison          2022-04-12  2700  	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
2584b3549f4c40 John Harrison          2022-04-12  2701  
2584b3549f4c40 John Harrison          2022-04-12  2702  	return ret;
3a4cdf1982f05d Matthew Brost          2021-07-21  2703  }
3a4cdf1982f05d Matthew Brost          2021-07-21  2704  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
