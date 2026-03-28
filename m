Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B76D2F3C0A
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774704456; cv=none; b=fVIgvgnY0/0hVS4P9svdT/AIbmGhInhlBqRDHpyrbiMWqlNdJHmHV06sVBCTF65ICnpJpysGScFj7BQtitP1LX1eGOTWLjy5YROob6WfeLdKar4YB0UUztAi+5ewpcv5hyW8mkH0BRqOsYDAbdELZWfglhnOQq684jcjXVx6Y3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774704456; c=relaxed/simple;
	bh=Kylr1QAv5f65bXBnvHWLAPISCUuYTdnbZ+JD9oaiA0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V1ivYxwvcAX0S/J9MrByLAnPLjYJYVPr3XbZvckqFjUXQXT0ndyfREfAntP8IfNh7hmlcJaAC0FwXwXvrWOB6o9Q8Ea17QNAcGmwZZLaT8cBwel2h5i74w1/4A2seE7UlazbUidCuw/4TBwMy/cpE76w+8LxNSV3uyC9zv109to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGsQhCiT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGsQhCiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774704453; x=1806240453;
  h=date:from:to:cc:subject:message-id;
  bh=Kylr1QAv5f65bXBnvHWLAPISCUuYTdnbZ+JD9oaiA0g=;
  b=PGsQhCiTxQDrlMTj4+cKuNyTTBziRpYLgZ7gwuPj0Jga/ikGcInC5lHx
   TsLNx9kn/hfkOTWurcs3MaIKgWx058rZQPvLFbCLfxwsik3pbJ1p8MR1r
   XmSLPUwzwuqOZ6c/9k+/EtwVnJu1CUot2ps2vPTcW14DZcejJNk+Fox31
   QDSiy0tfTHQPZZKhsrFw3XClaNcx9b2v27kQX6ryNM1FGTEZ94H06KJt2
   ETIUGri9+NvuI3Kg0ZoRMThKEO+bwcDOxRRLMwv+TKmkOBgqukPdg+q3W
   iVXXkB5uJAUbXXdD04J0+Ts9dLopTDz1+N0NHyLSdqLfULtRWPhFZOBz4
   w==;
X-CSE-ConnectionGUID: I+CXjzFoQImsTELKYMcReA==
X-CSE-MsgGUID: M0fGEt+8S6+tRzyJVIlWtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79663946"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="79663946"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 06:27:33 -0700
X-CSE-ConnectionGUID: heeQpbdXRJmehVC0S6qLHw==
X-CSE-MsgGUID: bkxMLb93Rk6UmOrx9+lipA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="256080288"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Mar 2026 06:27:31 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6ThI-00000000BRj-23Fg;
	Sat, 28 Mar 2026 13:27:28 +0000
Date: Sat, 28 Mar 2026 21:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18 7/7]
 kernel/sched/deadline.c:2501 find_later_rq() error: we previously assumed
 'exec_ctx' could be null (see line 2494)
Message-ID: <202603282157.m7MFAEFC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1eeff75d058d17b506a97fa282e7bbb55074c8d1
commit: 57d50e9d7fc2f224ab09145b7ba2aae530ec798e [7/7] ANDROID: sched: Add find_exec_ctx helper
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20260328 (https://download.01.org/0day-ci/archive/20260328/202603282157.m7MFAEFC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603282157.m7MFAEFC-lkp@intel.com/

smatch warnings:
kernel/sched/deadline.c:2501 find_later_rq() error: we previously assumed 'exec_ctx' could be null (see line 2494)

vim +/exec_ctx +2501 kernel/sched/deadline.c

1baca4ce16b8cc Juri Lelli        2013-11-07  2482  
c621dead3a640a Connor O'Brien    2023-11-08  2483  static int find_later_rq(struct task_struct *sched_ctx, struct task_struct *exec_ctx)
1baca4ce16b8cc Juri Lelli        2013-11-07  2484  {
1baca4ce16b8cc Juri Lelli        2013-11-07  2485  	struct sched_domain *sd;
4ba2968420fa9d Christoph Lameter 2014-08-26  2486  	struct cpumask *later_mask = this_cpu_cpumask_var_ptr(local_cpu_mask_dl);
1baca4ce16b8cc Juri Lelli        2013-11-07  2487  	int this_cpu = smp_processor_id();
c621dead3a640a Connor O'Brien    2023-11-08  2488  	int cpu = task_cpu(sched_ctx);
1baca4ce16b8cc Juri Lelli        2013-11-07  2489  
1baca4ce16b8cc Juri Lelli        2013-11-07  2490  	/* Make sure the mask is initialized first */
1baca4ce16b8cc Juri Lelli        2013-11-07  2491  	if (unlikely(!later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2492  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2493  
57d50e9d7fc2f2 Connor O'Brien    2023-11-08 @2494  	if (exec_ctx && exec_ctx->nr_cpus_allowed == 1)
1baca4ce16b8cc Juri Lelli        2013-11-07  2495  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2496  
91ec6778ec4f96 Juri Lelli        2014-09-19  2497  	/*
91ec6778ec4f96 Juri Lelli        2014-09-19  2498  	 * We have to consider system topology and task affinity
97fb7a0a8944bd Ingo Molnar       2018-03-03  2499  	 * first, then we can look for a suitable CPU.
91ec6778ec4f96 Juri Lelli        2014-09-19  2500  	 */
c621dead3a640a Connor O'Brien    2023-11-08 @2501  	if (!cpudl_find(&task_rq(exec_ctx)->rd->cpudl, sched_ctx, exec_ctx, later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2502  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2503  
1baca4ce16b8cc Juri Lelli        2013-11-07  2504  	/*
b18c3ca11c20ca Byungchul Park    2017-05-23  2505  	 * If we are here, some targets have been found, including
b18c3ca11c20ca Byungchul Park    2017-05-23  2506  	 * the most suitable which is, among the runqueues where the
b18c3ca11c20ca Byungchul Park    2017-05-23  2507  	 * current tasks have later deadlines than the task's one, the
b18c3ca11c20ca Byungchul Park    2017-05-23  2508  	 * rq with the latest possible one.
1baca4ce16b8cc Juri Lelli        2013-11-07  2509  	 *
1baca4ce16b8cc Juri Lelli        2013-11-07  2510  	 * Now we check how well this matches with task's
1baca4ce16b8cc Juri Lelli        2013-11-07  2511  	 * affinity and system topology.
1baca4ce16b8cc Juri Lelli        2013-11-07  2512  	 *
97fb7a0a8944bd Ingo Molnar       2018-03-03  2513  	 * The last CPU where the task run is our first
1baca4ce16b8cc Juri Lelli        2013-11-07  2514  	 * guess, since it is most likely cache-hot there.
1baca4ce16b8cc Juri Lelli        2013-11-07  2515  	 */
1baca4ce16b8cc Juri Lelli        2013-11-07  2516  	if (cpumask_test_cpu(cpu, later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2517  		return cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2518  	/*
1baca4ce16b8cc Juri Lelli        2013-11-07  2519  	 * Check if this_cpu is to be skipped (i.e., it is
1baca4ce16b8cc Juri Lelli        2013-11-07  2520  	 * not in the mask) or not.
1baca4ce16b8cc Juri Lelli        2013-11-07  2521  	 */
1baca4ce16b8cc Juri Lelli        2013-11-07  2522  	if (!cpumask_test_cpu(this_cpu, later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2523  		this_cpu = -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2524  
1baca4ce16b8cc Juri Lelli        2013-11-07  2525  	rcu_read_lock();
1baca4ce16b8cc Juri Lelli        2013-11-07  2526  	for_each_domain(cpu, sd) {
1baca4ce16b8cc Juri Lelli        2013-11-07  2527  		if (sd->flags & SD_WAKE_AFFINE) {
b18c3ca11c20ca Byungchul Park    2017-05-23  2528  			int best_cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2529  
1baca4ce16b8cc Juri Lelli        2013-11-07  2530  			/*
1baca4ce16b8cc Juri Lelli        2013-11-07  2531  			 * If possible, preempting this_cpu is
1baca4ce16b8cc Juri Lelli        2013-11-07  2532  			 * cheaper than migrating.
1baca4ce16b8cc Juri Lelli        2013-11-07  2533  			 */
1baca4ce16b8cc Juri Lelli        2013-11-07  2534  			if (this_cpu != -1 &&
1baca4ce16b8cc Juri Lelli        2013-11-07  2535  			    cpumask_test_cpu(this_cpu, sched_domain_span(sd))) {
1baca4ce16b8cc Juri Lelli        2013-11-07  2536  				rcu_read_unlock();
1baca4ce16b8cc Juri Lelli        2013-11-07  2537  				return this_cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2538  			}
1baca4ce16b8cc Juri Lelli        2013-11-07  2539  
14e292f8d45380 Peter Zijlstra    2020-10-01  2540  			best_cpu = cpumask_any_and_distribute(later_mask,
b18c3ca11c20ca Byungchul Park    2017-05-23  2541  							      sched_domain_span(sd));
1baca4ce16b8cc Juri Lelli        2013-11-07  2542  			/*
97fb7a0a8944bd Ingo Molnar       2018-03-03  2543  			 * Last chance: if a CPU being in both later_mask
b18c3ca11c20ca Byungchul Park    2017-05-23  2544  			 * and current sd span is valid, that becomes our
97fb7a0a8944bd Ingo Molnar       2018-03-03  2545  			 * choice. Of course, the latest possible CPU is
b18c3ca11c20ca Byungchul Park    2017-05-23  2546  			 * already under consideration through later_mask.
1baca4ce16b8cc Juri Lelli        2013-11-07  2547  			 */
b18c3ca11c20ca Byungchul Park    2017-05-23  2548  			if (best_cpu < nr_cpu_ids) {
1baca4ce16b8cc Juri Lelli        2013-11-07  2549  				rcu_read_unlock();
1baca4ce16b8cc Juri Lelli        2013-11-07  2550  				return best_cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2551  			}
1baca4ce16b8cc Juri Lelli        2013-11-07  2552  		}
1baca4ce16b8cc Juri Lelli        2013-11-07  2553  	}
1baca4ce16b8cc Juri Lelli        2013-11-07  2554  	rcu_read_unlock();
1baca4ce16b8cc Juri Lelli        2013-11-07  2555  
1baca4ce16b8cc Juri Lelli        2013-11-07  2556  	/*
1baca4ce16b8cc Juri Lelli        2013-11-07  2557  	 * At this point, all our guesses failed, we just return
1baca4ce16b8cc Juri Lelli        2013-11-07  2558  	 * 'something', and let the caller sort the things out.
1baca4ce16b8cc Juri Lelli        2013-11-07  2559  	 */
1baca4ce16b8cc Juri Lelli        2013-11-07  2560  	if (this_cpu != -1)
1baca4ce16b8cc Juri Lelli        2013-11-07  2561  		return this_cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2562  
14e292f8d45380 Peter Zijlstra    2020-10-01  2563  	cpu = cpumask_any_distribute(later_mask);
1baca4ce16b8cc Juri Lelli        2013-11-07  2564  	if (cpu < nr_cpu_ids)
1baca4ce16b8cc Juri Lelli        2013-11-07  2565  		return cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2566  
1baca4ce16b8cc Juri Lelli        2013-11-07  2567  	return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2568  }
1baca4ce16b8cc Juri Lelli        2013-11-07  2569  

:::::: The code at line 2501 was first introduced by commit
:::::: c621dead3a640a6055afcb80a78a16be3eff3b8b ANDROID: sched: Push execution and scheduler context split into deadline and rt

:::::: TO: Connor O'Brien <connoro@google.com>
:::::: CC: John Stultz <jstultz@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
