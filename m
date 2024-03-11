Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E5F8C15
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Mar 2024 05:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710134973; cv=none; b=lxyaB2z0hcmsYVYEjUoojXiP4WnbvPaft1GYk9pWbRt1Mswq3oQO0fcaM/Sw3pOrF1QEEuN4t85Cid8SSAW92IV0NLtJL3BBPSFaDIXPnoCZLENTB8+fu7FZwVxR5a5VGlWCPj9EsjGsScAVVAYTkdlccTjRz9GDuDq3NuNw1e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710134973; c=relaxed/simple;
	bh=pwuIp+1MJMvsZG3nJd/zA9MfDPekeKGOCLA11FRqlfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F3YaoD6rSt7zfmm3KiAzq8m1N2DvK+fcmAVtrJZhqda1kZQ6TRxl9RbLd9HGfq8/pIsIfqiZvpRoGI0Mt8DxnmUeWjjJShbv4bjnYklKeeNYwW9EPGCyt2RFMDBnbGwWobdDOhnhaAcJMYmtcRiykGjf828dSqzbKmwHnOAVtcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yCIZB7Ed; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yCIZB7Ed"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41325ccf493so4311065e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 22:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710134969; x=1710739769; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yXtTMiB8yTd0V/j3N7+/pDxtaVI46E/s8QpgcfA5miU=;
        b=yCIZB7EdCKEz2ol1fAtj9gq8/AhPdyxo3jYSE53vRDOuXE+I5PpgpQLoxMbdTCWlQv
         0c54avEsmXG29BBiJZSGeB5qCaQuFELU1SRp7vi3muGpp+fvg4aQXXxpb9XLoHMYm1V+
         VQUqFBxXPclP9T3bHbDvUMds9X9ZW5MWNwqFRTTGTm2AuDGVSXkIOBL7WXWho4+aBn+I
         jnzhKkx2aEqiLdSV3KrOU7Gv5j5C4xgM1IuATyTX3CoFlIWzKhEfYHZkmhjBexJ26Rk/
         z4RNRAi9kWIm9OTTlr4Hr1A6os2LL7glMfXpM1kUb0V2rvTIfrjSg7SvLXKT/CLrOzU3
         d/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710134969; x=1710739769;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXtTMiB8yTd0V/j3N7+/pDxtaVI46E/s8QpgcfA5miU=;
        b=qANLPPWVsl+bZjpCedi0Xca7yPSBB170sMGmD5OW8smQNzwx3B0HfvJYLJ5aJGXXpx
         Aeb9otCwMPZJnQk9BH1nElz+h7FwZuYXgQMoklJMbcUFFeOY3bkN/HZdehX+rbg8wDXy
         KRAGlJa5GAofYK0Hiqv9qX+5BUHb4+/C+pWgG92Qh8q9nhVT3yXk1uvf/xU1+iodrZ3m
         t03l7772hr266qkR2i6egATHPKsNnovtZFTRqUNFGF64ZSIwWrYNWrnnrtG05xgsUqsU
         +pnRGkK5WjE5EpQjs7Y9TSY8QTR5i7umvDkGCj0m498Hxdi8VT1JQUhdPn0Vr4lWJ7P3
         dtsg==
X-Gm-Message-State: AOJu0YwNKcOPiaHySSeE70zPeiIOBseH8NYo9Xj0FbHY/bnjdsagZKCi
	wjFaYpUAW5/6nftjjtPikGVAqSbUrGXG1mSeVhQVWo2Gnc+dyNXkFbJ6Y5WWtNmUyuTRoMnQ8TT
	t
X-Google-Smtp-Source: AGHT+IHYUa4ArbYV8kRh62gYfLFJDZQGldanR4MfH6+U3Md4RBM8ptSDsifeiueN7QKuXmCkWJp9SA==
X-Received: by 2002:a05:600c:5120:b0:413:2e49:3e05 with SMTP id o32-20020a05600c512000b004132e493e05mr920wms.12.1710134969020;
        Sun, 10 Mar 2024 22:29:29 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b0041312e8ef2bsm7784219wmo.26.2024.03.10.22.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 22:29:28 -0700 (PDT)
Date: Mon, 11 Mar 2024 08:29:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	John Harrison <John.C.Harrison@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [drm-intel:for-linux-next-gt 1/4]
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2680
 guc_context_policy_init_v70() warn: variable dereferenced before check 'ce'
 (see line 2663)
Message-ID: <17e29db7-04a8-4894-bf4b-6773b14d113f@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm-intel for-linux-next-gt
head:   7ad6a8fae597af7fae5193efc73276609337c360
commit: cec82816d0d018f178b9b7f88fe4bf80d66954e9 [1/4] drm/i915/guc: Use context hints for GT frequency
config: i386-randconfig-141-20240309 (https://download.01.org/0day-ci/archive/20240310/202403101225.7AheJhZJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403101225.7AheJhZJ-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2680 guc_context_policy_init_v70() warn: variable dereferenced before check 'ce' (see line 2663)

vim +/ce +2680 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

774ce1510e6ccb Daniele Ceraolo Spurio 2022-07-18  2661  static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
2584b3549f4c40 John Harrison          2022-04-12  2662  {
2584b3549f4c40 John Harrison          2022-04-12 @2663  	struct intel_engine_cs *engine = ce->engine;
                                                                                                 ^^^^^^^^^^
Unchecked dereference

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
                                                                    ^^
NULL check is too late.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

