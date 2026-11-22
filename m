Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370580;
	b=B7psKBexJFC7U8R4AEWAkjD15hXezrNz0UX6jua5j5hcFPj4AbNEahcyAzehfQJX/dt2
	 w41X5S5dNm6C+WFv1tWh+WGssQn6IjHcdMU00DxIMt/QViXE2DFpdx40RdXh2i4MGy080
	 tNiXSi2CeSesKH4fJNnrUV/BiiAxKIC2SEqHSSGDleRMPo+5P4o8ipveALvsOXaPZtKoK
	 onWm2zqEX+/6KzvuuyhjP98VrzoltWGp8npO29wluT37kMOaMSYSozB7L4hIbgRbBXizy
	 lQeBTiNg3IVI8AIHXGnIiy6wtebla7QdnzmgNZTm5wpx6z0Y5P/x52vGVJSEMv2sg5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370580;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XmEpUXvUv71fC+0rNzKohMu4YAScza/Dq8uvRpt03Qs=;
	b=LR5Z97mekeXRNhsa/eYWJIGvzte5kgVlCAHNyDOLJ8fbc32KE7RRXP215Nucbdf+eOWp
	 6KKOzcMzfMSCktL7itR4ic/9WgMZwc5wyKewI6l15ouL8E0rgKeVpegNArt4JLeSSqbVf
	 BWFWJtJD+AmqkSUoaTwAnleZIk0RGGLBgCxOd4bcMgER+Hz/WUDKV9rDKCzct2uc1Q/mS
	 9wQBaIPDKo1Ym/aTl7NL/2ncBEu7KmZ0T65xLrQ6YXNLUQo9qJqjDh8QAKktVLXjCFW6d
	 PvMJsTS/GAn9aZJtOdNGiqKHCK6XLUgulaAeCfgb5XmI8kJ44opbJLh9cBP9YeRvpYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OEyTpSYQ;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DFF606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 18:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35DFF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OEyTpSYQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795370578; x=1826906578;
  h=date:from:to:cc:subject:message-id;
  bh=AwJuf2OQKXpq7dpqqBQOBIKIsJ9MrAHEi8jUc+6NZrw=;
  b=OEyTpSYQOSf4LHndKmNdpxZvFBLbNLDNvAJOc9JnIs3rrP2Jp7mV4Hol
   J+vYqn/ymTDH4K/MrYq228qKyoc/CPwizQYbzs/sYiGwBWJenyDUe6idq
   GtACG7lZDnYZ2gUL6ynLerqtnhHlGQu7zU4Qirn9Ebn/OJun6S8jFIARL
   cQf6ygTYmBXRnwtJ6X7wNrmwfF1Oa11OR8mNmh5GlU8zyYCU1OsnKC1z/
   Go/FGxGmruN82OCRjJ6BgxTZVfIZFNosyWIfLtzz1MzNjX12Fpg8sA8Fi
   ED1+P9clE4tGl8icH1uhOIZel8zQGVFktgrt02UjFKtvsCr/J6V6dweqx
   w==;
X-CSE-ConnectionGUID: E81zLSkMSdavJR96FcRmtw==
X-CSE-MsgGUID: Q8Ye88E/R+CBW68q7ym/5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4226770"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4226770"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 10:02:57 -0800
X-CSE-ConnectionGUID: ycaphY7mQeCGC3B1MHCwGw==
X-CSE-MsgGUID: rVHCRBAUQdKW8yVHQqOuYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="12825793"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 22 Nov 2026 10:02:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVBtu-000000004aM-0DnI;
	Sun, 22 Nov 2026 18:02:54 +0000
Date: Sun, 22 Nov 2026 19:02:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_sbi_watchdog_v3 118/122]
 drivers/perf/riscv_ctr.c:435 riscv_pmu_ctr_sched_task() warn: variable
 dereferenced before check 'pmu_ctx' (see line 427)
Message-ID: <20261122185842.ByS8sFyu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vikram Singh <vikram.singh3@oss.qualcomm.com>
CC: Anup Patel <anup@brainfault.org>
CC: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>

tree:   https://github.com/avpatel/linux.git riscv_sbi_watchdog_v3
head:   e16e3a60fbbf3fa3da230a7151235d2e7aac1066
commit: 9a740a6a4e590a1cc20dc8aa7d80a73171ba6229 [118/122] riscv: pmu: Add driver for Control Transfer Records Ext
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: riscv-randconfig-2200-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122185842.ByS8sFyu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261122185842.ByS8sFyu-lkp@intel.com/

smatch warnings:
drivers/perf/riscv_ctr.c:435 riscv_pmu_ctr_sched_task() warn: variable dereferenced before check 'pmu_ctx' (see line 427)

vim +/pmu_ctx +435 drivers/perf/riscv_ctr.c

9a740a6a4e590a Vikram Singh 2026-11-18  416  
9a740a6a4e590a Vikram Singh 2026-11-18  417  /*
9a740a6a4e590a Vikram Singh 2026-11-18  418   * On context switch in, we need to make sure no samples from previous tasks
9a740a6a4e590a Vikram Singh 2026-11-18  419   * are left in the CTR.
9a740a6a4e590a Vikram Singh 2026-11-18  420   *
9a740a6a4e590a Vikram Singh 2026-11-18  421   * On ctxswin, sched_in = true, called after the PMU has started
9a740a6a4e590a Vikram Singh 2026-11-18  422   * On ctxswout, sched_in = false, called before the PMU is stopped
9a740a6a4e590a Vikram Singh 2026-11-18  423   */
9a740a6a4e590a Vikram Singh 2026-11-18  424  void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *pmu_ctx, struct task_struct *task,
9a740a6a4e590a Vikram Singh 2026-11-18  425  			      bool sched_in)
9a740a6a4e590a Vikram Singh 2026-11-18  426  {
9a740a6a4e590a Vikram Singh 2026-11-18 @427  	struct riscv_pmu *rvpmu = to_riscv_pmu(pmu_ctx->pmu);
9a740a6a4e590a Vikram Singh 2026-11-18  428  	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
9a740a6a4e590a Vikram Singh 2026-11-18  429  	void *task_ctx;
9a740a6a4e590a Vikram Singh 2026-11-18  430  
9a740a6a4e590a Vikram Singh 2026-11-18  431  	if (!cpuc->ctr_users)
9a740a6a4e590a Vikram Singh 2026-11-18  432  		return;
9a740a6a4e590a Vikram Singh 2026-11-18  433  
9a740a6a4e590a Vikram Singh 2026-11-18  434  	/* Save branch records in task_ctx on sched out */
9a740a6a4e590a Vikram Singh 2026-11-18 @435  	task_ctx = pmu_ctx ? task->perf_ctx_data : NULL;
9a740a6a4e590a Vikram Singh 2026-11-18  436  	if (task_ctx) {
9a740a6a4e590a Vikram Singh 2026-11-18  437  		if (sched_in)
9a740a6a4e590a Vikram Singh 2026-11-18  438  			riscv_pmu_ctr_restore(task_ctx);
9a740a6a4e590a Vikram Singh 2026-11-18  439  		else
9a740a6a4e590a Vikram Singh 2026-11-18  440  			riscv_pmu_ctr_save(task_ctx, rvpmu->ctr_depth);
9a740a6a4e590a Vikram Singh 2026-11-18  441  		return;
9a740a6a4e590a Vikram Singh 2026-11-18  442  	}
9a740a6a4e590a Vikram Singh 2026-11-18  443  
9a740a6a4e590a Vikram Singh 2026-11-18  444  	/* Reset branch records on sched in */
9a740a6a4e590a Vikram Singh 2026-11-18  445  	if (sched_in)
9a740a6a4e590a Vikram Singh 2026-11-18  446  		riscv_pmu_ctr_reset();
9a740a6a4e590a Vikram Singh 2026-11-18  447  }
9a740a6a4e590a Vikram Singh 2026-11-18  448  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
