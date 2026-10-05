Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810214A440D
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210580; cv=none; b=ctQqZfR1n/8rv3GO5vxlnXB0+xrkYhxjejfpsIsnGInH3gbjqd/rq/zspoyelwrUykqAgaUdTPzjffqbx+dJUp0LEBvBOxS/hh+eN6yS1VHBFrth1Oi+pxwZLxEe3va4uXX2Dw1ocdTXipJ0BCNe0LsbJx/FxqmBdy+S68K4LYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210580; c=relaxed/simple;
	bh=0YsL68QT9nxg89MXkK7vwvwVmZps1dwUzbijc9kL0Fg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TXiG/A2WyXhDkxW6ZXE71cnXAH4ZeyeJkO0tVTfQnlQk43a6VghO4188Fl/4c7Je2ED2oTH9fQW6jtCJIGi07kF0xS/uqFZBKm9TwTFoHjYN9O9ElDEYQONTTR3ngUPTIGq5S1I5fHbEwBpbD2xjY01T1jjQc3a4KObpusvOqIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=je3z9Woy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="je3z9Woy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791210570; x=1822746570;
  h=date:from:to:cc:subject:message-id;
  bh=0YsL68QT9nxg89MXkK7vwvwVmZps1dwUzbijc9kL0Fg=;
  b=je3z9WoyLFE0yTd9O9Fc6GNPBF9cFszgTJEs+xbqIfMsX30XVlAxmOyF
   LaNJNNA5llxE9/PfGcOZXb45FTbkVTvp6QykJynWopLCSMy2zgMk1OhL4
   YxT25zbLjUnYrgmU7E36sDZE5sA6Yi3ZNq8CrxUlfFNh1x8MSmNKkGT2a
   DJWywvN0TCbuj4/bWxK7WoEVKfmwBC6zZcDaKEw1kk2m1zqm4Sg6HVAze
   i8mJQaeL2Pqv9U7V88xKLg8Ls2GWgvYnLM88x595b1RaMCcSNsoHfTuxB
   ql5/Q300xoaES9NPwT03m7PrTGAtjb5kVyl+tjYzqSVkP+jg20mIvE+WJ
   w==;
X-CSE-ConnectionGUID: F88qAPI1Q5+43I/dc5RdlQ==
X-CSE-MsgGUID: 4ICP/PmPRIWJ77CeLQ2NHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="103251012"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="103251012"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 07:29:27 -0700
X-CSE-ConnectionGUID: P6oVg3cvSN6ikoTdC1Mb7Q==
X-CSE-MsgGUID: SrvZEnQJSTi1P1ZFvXEbZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="913049"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 05 Oct 2026 07:29:26 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDjgy-0000000009b-0PUc;
	Mon, 05 Oct 2026 14:29:24 +0000
Date: Mon, 05 Oct 2026 16:29:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/sched/fair.c:9070 select_slice_cpu() warn: missing
 error code? 'cpu'
Message-ID: <202610051657.edNCMGy5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vincent Guittot <vincent.guittot@linaro.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Christian-Loehle/sched-eevdf-Cap-protection-when-current-has-the-shortest-slice/20260930-094737
head:   36883d29d7f46d450252ebe303f37131e2b837d2
commit: 8f8df1b98a5a60901a80f3f74b1c9ada4513f095 sched/eevdf: Add min slice check when selecting CPU
date:   2 weeks ago
:::::: branch date: 5 days ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-r2201-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051657.edNCMGy5-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project dbeca9a3a3ba0b46471efb339b0ea8f2194f6f68)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610051657.edNCMGy5-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:9070 select_slice_cpu() warn: missing error code? 'cpu'

vim +/cpu +9070 kernel/sched/fair.c

b4c9c9f15649c9 Vincent Guittot 2020-10-29  9025  
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9026  static int select_slice_cpu(struct task_struct *p, struct sched_domain *sd, int target)
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9027  {
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9028  	unsigned long task_util, util_min, util_max;
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9029  	int cpu, nr = INT_MAX;
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9030  	u64 slice = p->se.slice;
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9031  	struct cpumask *cpus;
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9032  
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9033  	if (sched_feat(SIS_UTIL) && sd->shared) {
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9034  		/*
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9035  		 * Same nr_idle_scan hint as select_idle_cpu(), nr only limits
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9036  		 * the scan when not preferring an idle core.
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9037  		 */
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9038  		nr = READ_ONCE(sd->shared->nr_idle_scan) + 1;
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9039  		/* overloaded domain is unlikely to have idle cpu/core */
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9040  		if (nr == 1)
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9041  			return -1;
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9042  	}
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9043  
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9044  	cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9045  	cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9046  
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9047  	if (sched_asym_cpucap_active()) {
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9048  		task_util = task_util_est(p);
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9049  		util_min = uclamp_eff_value(p, UCLAMP_MIN);
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9050  		util_max = uclamp_eff_value(p, UCLAMP_MAX);
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9051  	}
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9052  
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9053  	/* Those CPUs have been tested not being idle and fiting */
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9054  	for_each_cpu_wrap(cpu, cpus, target) {
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9055  		/*
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9056  		 * Stop when the nr_idle_scan is exhausted (mirrors
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9057  		 * select_idle_cpu() logic).
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9058  		 */
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9059  		if (--nr <= 0)
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9060  			return -1;
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9061  
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9062  		if (slice >= get_rq_min_slice(cpu_rq(cpu)))
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9063  			continue;
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9064  
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9065  		if (sched_asym_cpucap_active()) {
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9066  			int fits = util_fits_cpu(task_util, util_min, util_max, cpu);
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9067  
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9068  			/* Perfect fit: capacity satisfies util + uclamp */
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9069  			if (fits > 0)
8f8df1b98a5a60 Vincent Guittot 2026-09-21 @9070  				return cpu;
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9071  		} else {
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9072  			return cpu;
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9073  		}
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9074  	}
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9075  
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9076  	return -1;
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9077  }
8f8df1b98a5a60 Vincent Guittot 2026-09-21  9078  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
