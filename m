Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79AFD30B
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Mar 2024 02:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710297215; cv=none; b=tl61MKyJ/WB7vLBX7PCH/F2LRIq6P2CVBCZ54MFNHqr5TGZX4IctGyGcI9QA822KzdblIFw7fOgB1zuP6HMrMNtaYaF9sMprP4PAsX2KMCbAzMmS0Bpn37IrIgCaVL87m6+urbu2BJ4odkttmjJ5XDmlkc9OrB7+nKNtIstcVeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710297215; c=relaxed/simple;
	bh=0ejyOpxAIyPh1h1I19i86uYCXP4iTlfdX5rz796lpoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HHcrxAYlyhpTZj8XGMc2tr9D+W0C+ymdeC4ho/ySe1rvMOFs5B6HHJmiF7nNm/yc3wzL22ewPDRdyjJjGg+DiVbbY60W+0avdMRpNycadf84vzxDiSLOMJTZ9UBPxVkZtrcI9MdZEpOndMcwb+I4un+85lBQt9N7OVEmidIrEjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gT3RrUHY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gT3RrUHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710297213; x=1741833213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ejyOpxAIyPh1h1I19i86uYCXP4iTlfdX5rz796lpoQ=;
  b=gT3RrUHYuCMD4mnKbYXubcfSsgtk5qMme7z8kfKmngkij88IPGScQmS1
   GwMy1DA7B7RH6ahkeMBCzXoHtOOyrXAHMz40AtQIZCMYfyJ2S30Fbm00B
   EwZjvaAcZc9/l/7X7O8NQLl65AdCbAV8gb73jx0Oz4PmudVJgQ1ZECzUu
   2gJsSA69RA5EDy8QsgJjFpUMM7bVtZIfpQftqYlbZtdi16xE8Mws2ZWjH
   W8PhO1M8bvj3qtXvAlZs8OtkhCMdEJCsJxGfLComjuK2vo7KSHIk5QfP7
   t/wvBE4tcWnghAn3+cxPSUPS4ngHRMcm4ZMgOZCMRcoOgi6cMG+1C6s4v
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4969822"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4969822"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 19:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="34895383"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Mar 2024 19:33:30 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkEQp-000Bv7-32;
	Wed, 13 Mar 2024 02:33:27 +0000
Date: Wed, 13 Mar 2024 10:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:sched/core 12/23] kernel/sched/core.c:5693 sched_tick() error:
 uninitialized symbol 'resched_latency'.
Message-ID: <202403131030.YdmFKHGB-lkp@intel.com>
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
TO: Ingo Molnar <mingo@kernel.org>
CC: Shrikanth Hegde <sshegde@linux.ibm.com>

Hi Ingo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   d72cf62438d67b911212f8d4cf65d6167c1541ba
commit: 86dd6c04ef9f213e14d60c9f64bce1cc019f816e [12/23] sched/balancing: Rename scheduler_tick() => sched_tick()
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-141-20240313 (https://download.01.org/0day-ci/archive/20240313/202403131030.YdmFKHGB-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403131030.YdmFKHGB-lkp@intel.com/

smatch warnings:
kernel/sched/core.c:5693 sched_tick() error: uninitialized symbol 'resched_latency'.

vim +/resched_latency +5693 kernel/sched/core.c

c006fac556e401 kernel/sched/core.c Paul Turner         2021-04-16  5660  
7835b98bc6de2c kernel/sched.c      Christoph Lameter   2006-12-10  5661  /*
7835b98bc6de2c kernel/sched.c      Christoph Lameter   2006-12-10  5662   * This function gets called by the timer code, with HZ frequency.
7835b98bc6de2c kernel/sched.c      Christoph Lameter   2006-12-10  5663   * We call it with interrupts disabled.
7835b98bc6de2c kernel/sched.c      Christoph Lameter   2006-12-10  5664   */
86dd6c04ef9f21 kernel/sched/core.c Ingo Molnar         2024-03-08  5665  void sched_tick(void)
7835b98bc6de2c kernel/sched.c      Christoph Lameter   2006-12-10  5666  {
7835b98bc6de2c kernel/sched.c      Christoph Lameter   2006-12-10  5667  	int cpu = smp_processor_id();
7835b98bc6de2c kernel/sched.c      Christoph Lameter   2006-12-10  5668  	struct rq *rq = cpu_rq(cpu);
dd41f596cda0d7 kernel/sched.c      Ingo Molnar         2007-07-09  5669  	struct task_struct *curr = rq->curr;
8a8c69c3277886 kernel/sched/core.c Peter Zijlstra      2016-10-04  5670  	struct rq_flags rf;
b4eccf5f8e1dca kernel/sched/core.c Thara Gopinath      2020-02-21  5671  	unsigned long thermal_pressure;
c006fac556e401 kernel/sched/core.c Paul Turner         2021-04-16  5672  	u64 resched_latency;
3e51f33fcc7f55 kernel/sched.c      Peter Zijlstra      2008-05-03  5673  
7fb3ff22ad8772 kernel/sched/core.c Yair Podemsky       2022-11-30  5674  	if (housekeeping_cpu(cpu, HK_TYPE_TICK))
1567c3e3467cdd kernel/sched/core.c Giovanni Gherdovich 2020-01-22  5675  		arch_scale_freq_tick();
7fb3ff22ad8772 kernel/sched/core.c Yair Podemsky       2022-11-30  5676  
3e51f33fcc7f55 kernel/sched.c      Peter Zijlstra      2008-05-03  5677  	sched_clock_tick();
dd41f596cda0d7 kernel/sched.c      Ingo Molnar         2007-07-09  5678  
8a8c69c3277886 kernel/sched/core.c Peter Zijlstra      2016-10-04  5679  	rq_lock(rq, &rf);
8a8c69c3277886 kernel/sched/core.c Peter Zijlstra      2016-10-04  5680  
3e51f33fcc7f55 kernel/sched.c      Peter Zijlstra      2008-05-03  5681  	update_rq_clock(rq);
b4eccf5f8e1dca kernel/sched/core.c Thara Gopinath      2020-02-21  5682  	thermal_pressure = arch_scale_thermal_pressure(cpu_of(rq));
05289b90c2e40a kernel/sched/core.c Thara Gopinath      2020-02-21  5683  	update_thermal_load_avg(rq_clock_thermal(rq), rq, thermal_pressure);
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra      2008-01-25  5684  	curr->sched_class->task_tick(rq, curr, 0);
c006fac556e401 kernel/sched/core.c Paul Turner         2021-04-16  5685  	if (sched_feat(LATENCY_WARN))
c006fac556e401 kernel/sched/core.c Paul Turner         2021-04-16  5686  		resched_latency = cpu_resched_latency(rq);
3289bdb429884c kernel/sched/core.c Peter Zijlstra      2015-04-14  5687  	calc_global_load_tick(rq);
4feee7d12603de kernel/sched/core.c Josh Don            2021-10-18  5688  	sched_core_tick(rq);
223baf9d17f25e kernel/sched/core.c Mathieu Desnoyers   2023-04-20  5689  	task_tick_mm_cid(rq, curr);
8a8c69c3277886 kernel/sched/core.c Peter Zijlstra      2016-10-04  5690  
8a8c69c3277886 kernel/sched/core.c Peter Zijlstra      2016-10-04  5691  	rq_unlock(rq, &rf);
7835b98bc6de2c kernel/sched.c      Christoph Lameter   2006-12-10  5692  
c006fac556e401 kernel/sched/core.c Paul Turner         2021-04-16 @5693  	if (sched_feat(LATENCY_WARN) && resched_latency)
c006fac556e401 kernel/sched/core.c Paul Turner         2021-04-16  5694  		resched_latency_warn(cpu, resched_latency);
c006fac556e401 kernel/sched/core.c Paul Turner         2021-04-16  5695  
e9d2b064149ff7 kernel/sched.c      Peter Zijlstra      2010-09-17  5696  	perf_event_task_tick();
e220d2dcb944c5 kernel/sched.c      Peter Zijlstra      2009-05-23  5697  
616db8779b1e3f kernel/sched/core.c Tejun Heo           2023-05-17  5698  	if (curr->flags & PF_WQ_WORKER)
616db8779b1e3f kernel/sched/core.c Tejun Heo           2023-05-17  5699  		wq_worker_tick(curr);
616db8779b1e3f kernel/sched/core.c Tejun Heo           2023-05-17  5700  

:::::: The code at line 5693 was first introduced by commit
:::::: c006fac556e401a62054d065da168099ea5a5b10 sched: Warn on long periods of pending need_resched

:::::: TO: Paul Turner <pjt@google.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
