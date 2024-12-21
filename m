Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148A11D9320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 22:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734821217; cv=none; b=E6QqS2kHs11KBmW1OdxZah6dVNkfwVS9HxL6yqV2FB+Pe9sVnc/lF1xwym5k4lPhgD/kH7Twb+dc3AoqvD2WB+2EOPR1NfQmUW3Txp0FniQ0MY56WED+iw+8nI6saKiQXjcQspZKioJw7xE+azr+clLuf4F/EJHdsaE2wvq+Xxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734821217; c=relaxed/simple;
	bh=aHNDGrPksuwmByvbJ9KjJP/0DmgnLg2rsi3C4xQyDx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HqWnB56Be/+DHsZWmHukGc0u3DJUG7m9XOESKSXdq/nqJGIKdDeUa1mTrvS3Nu5u+uAPKFrOFCBVEiY22gsjJp5HfWqSIWuSvB3n+m41lmTIznJFN5iijXvBhSHIfKdKQeCVkCK13+1qjohx0d0XrP9F0TxPo16wFWs7UjSv3mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6FwyqzI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6FwyqzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734821215; x=1766357215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aHNDGrPksuwmByvbJ9KjJP/0DmgnLg2rsi3C4xQyDx8=;
  b=C6FwyqzILT6Hn8AwTrdrDBeJLZu9JsiIHfDOBKM7y8OPjCMIX60N9dB3
   B0LuB1JGStIjE2gIMJYApwJ0rNVMyztbYataSkmiaSF5ZX46S7OrxRDNR
   2l6SUtxvAMNy+J9GeKgHPx1kbAXadMLhUYRzJJQ2AVcrWxI4gLB9xjGU2
   3RutoFdmdhGDHmW1WyqmTMpUq5+GWu+ekmtnyAUFOsooBs7k9FrC0ad+i
   5wtiEx20mbbmj3WiXowlAgtl/g7Ez0YPJka3YuRFV+DZoTepcfPuQi2UH
   6d+mSlZGDeeyhstaRq/O5qm24WJXgSCxjYfDbSg1bGKUQ/DotbaEtTb6Q
   g==;
X-CSE-ConnectionGUID: tyctWDl8RlS88xBFwzrvkQ==
X-CSE-MsgGUID: Mfw4q/sQTS2CkYQZFV8USw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="22924000"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="22924000"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 14:46:54 -0800
X-CSE-ConnectionGUID: zPZxTmAdQFW9OK4/D25YuQ==
X-CSE-MsgGUID: HgkTyd/NRt666YxJz+SF4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129805467"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Dec 2024 14:46:53 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP8FH-0002Xz-05;
	Sat, 21 Dec 2024 22:46:51 +0000
Date: Sun, 22 Dec 2024 06:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12 7230/7786]
 kernel/sched/deadline.c:2548 find_later_rq() error: we previously assumed
 'exec_ctx' could be null (see line 2541)
Message-ID: <202412220603.ZrMZILYo-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0ad60853620e2bd7a2f165162fde4729cba0b46d
commit: a70dd213296b2f2524c2b4440cb60d46f85ab2e4 [7230/7786] ANDROID: sched: Add find_exec_ctx helper
:::::: branch date: 24 hours ago
:::::: commit date: 8 days ago
config: i386-randconfig-141-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220603.ZrMZILYo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412220603.ZrMZILYo-lkp@intel.com/

smatch warnings:
kernel/sched/deadline.c:2548 find_later_rq() error: we previously assumed 'exec_ctx' could be null (see line 2541)

vim +/exec_ctx +2548 kernel/sched/deadline.c

1baca4ce16b8cc Juri Lelli        2013-11-07  2529  
eb7630f95f837d Connor O'Brien    2023-11-08  2530  static int find_later_rq(struct task_struct *sched_ctx, struct task_struct *exec_ctx)
1baca4ce16b8cc Juri Lelli        2013-11-07  2531  {
1baca4ce16b8cc Juri Lelli        2013-11-07  2532  	struct sched_domain *sd;
4ba2968420fa9d Christoph Lameter 2014-08-26  2533  	struct cpumask *later_mask = this_cpu_cpumask_var_ptr(local_cpu_mask_dl);
1baca4ce16b8cc Juri Lelli        2013-11-07  2534  	int this_cpu = smp_processor_id();
eb7630f95f837d Connor O'Brien    2023-11-08  2535  	int cpu = task_cpu(sched_ctx);
1baca4ce16b8cc Juri Lelli        2013-11-07  2536  
1baca4ce16b8cc Juri Lelli        2013-11-07  2537  	/* Make sure the mask is initialized first */
1baca4ce16b8cc Juri Lelli        2013-11-07  2538  	if (unlikely(!later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2539  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2540  
a70dd213296b2f Connor O'Brien    2023-11-08 @2541  	if (exec_ctx && exec_ctx->nr_cpus_allowed == 1)
1baca4ce16b8cc Juri Lelli        2013-11-07  2542  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2543  
91ec6778ec4f96 Juri Lelli        2014-09-19  2544  	/*
91ec6778ec4f96 Juri Lelli        2014-09-19  2545  	 * We have to consider system topology and task affinity
97fb7a0a8944bd Ingo Molnar       2018-03-03  2546  	 * first, then we can look for a suitable CPU.
91ec6778ec4f96 Juri Lelli        2014-09-19  2547  	 */
eb7630f95f837d Connor O'Brien    2023-11-08 @2548  	if (!cpudl_find(&task_rq(exec_ctx)->rd->cpudl, sched_ctx, exec_ctx, later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2549  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2550  
1baca4ce16b8cc Juri Lelli        2013-11-07  2551  	/*
b18c3ca11c20ca Byungchul Park    2017-05-23  2552  	 * If we are here, some targets have been found, including
b18c3ca11c20ca Byungchul Park    2017-05-23  2553  	 * the most suitable which is, among the runqueues where the
b18c3ca11c20ca Byungchul Park    2017-05-23  2554  	 * current tasks have later deadlines than the task's one, the
b18c3ca11c20ca Byungchul Park    2017-05-23  2555  	 * rq with the latest possible one.
1baca4ce16b8cc Juri Lelli        2013-11-07  2556  	 *
1baca4ce16b8cc Juri Lelli        2013-11-07  2557  	 * Now we check how well this matches with task's
1baca4ce16b8cc Juri Lelli        2013-11-07  2558  	 * affinity and system topology.
1baca4ce16b8cc Juri Lelli        2013-11-07  2559  	 *
97fb7a0a8944bd Ingo Molnar       2018-03-03  2560  	 * The last CPU where the task run is our first
1baca4ce16b8cc Juri Lelli        2013-11-07  2561  	 * guess, since it is most likely cache-hot there.
1baca4ce16b8cc Juri Lelli        2013-11-07  2562  	 */
1baca4ce16b8cc Juri Lelli        2013-11-07  2563  	if (cpumask_test_cpu(cpu, later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2564  		return cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2565  	/*
1baca4ce16b8cc Juri Lelli        2013-11-07  2566  	 * Check if this_cpu is to be skipped (i.e., it is
1baca4ce16b8cc Juri Lelli        2013-11-07  2567  	 * not in the mask) or not.
1baca4ce16b8cc Juri Lelli        2013-11-07  2568  	 */
1baca4ce16b8cc Juri Lelli        2013-11-07  2569  	if (!cpumask_test_cpu(this_cpu, later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2570  		this_cpu = -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2571  
1baca4ce16b8cc Juri Lelli        2013-11-07  2572  	rcu_read_lock();
1baca4ce16b8cc Juri Lelli        2013-11-07  2573  	for_each_domain(cpu, sd) {
1baca4ce16b8cc Juri Lelli        2013-11-07  2574  		if (sd->flags & SD_WAKE_AFFINE) {
b18c3ca11c20ca Byungchul Park    2017-05-23  2575  			int best_cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2576  
1baca4ce16b8cc Juri Lelli        2013-11-07  2577  			/*
1baca4ce16b8cc Juri Lelli        2013-11-07  2578  			 * If possible, preempting this_cpu is
1baca4ce16b8cc Juri Lelli        2013-11-07  2579  			 * cheaper than migrating.
1baca4ce16b8cc Juri Lelli        2013-11-07  2580  			 */
1baca4ce16b8cc Juri Lelli        2013-11-07  2581  			if (this_cpu != -1 &&
1baca4ce16b8cc Juri Lelli        2013-11-07  2582  			    cpumask_test_cpu(this_cpu, sched_domain_span(sd))) {
1baca4ce16b8cc Juri Lelli        2013-11-07  2583  				rcu_read_unlock();
1baca4ce16b8cc Juri Lelli        2013-11-07  2584  				return this_cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2585  			}
1baca4ce16b8cc Juri Lelli        2013-11-07  2586  
14e292f8d45380 Peter Zijlstra    2020-10-01  2587  			best_cpu = cpumask_any_and_distribute(later_mask,
b18c3ca11c20ca Byungchul Park    2017-05-23  2588  							      sched_domain_span(sd));
1baca4ce16b8cc Juri Lelli        2013-11-07  2589  			/*
97fb7a0a8944bd Ingo Molnar       2018-03-03  2590  			 * Last chance: if a CPU being in both later_mask
b18c3ca11c20ca Byungchul Park    2017-05-23  2591  			 * and current sd span is valid, that becomes our
97fb7a0a8944bd Ingo Molnar       2018-03-03  2592  			 * choice. Of course, the latest possible CPU is
b18c3ca11c20ca Byungchul Park    2017-05-23  2593  			 * already under consideration through later_mask.
1baca4ce16b8cc Juri Lelli        2013-11-07  2594  			 */
b18c3ca11c20ca Byungchul Park    2017-05-23  2595  			if (best_cpu < nr_cpu_ids) {
1baca4ce16b8cc Juri Lelli        2013-11-07  2596  				rcu_read_unlock();
1baca4ce16b8cc Juri Lelli        2013-11-07  2597  				return best_cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2598  			}
1baca4ce16b8cc Juri Lelli        2013-11-07  2599  		}
1baca4ce16b8cc Juri Lelli        2013-11-07  2600  	}
1baca4ce16b8cc Juri Lelli        2013-11-07  2601  	rcu_read_unlock();
1baca4ce16b8cc Juri Lelli        2013-11-07  2602  
1baca4ce16b8cc Juri Lelli        2013-11-07  2603  	/*
1baca4ce16b8cc Juri Lelli        2013-11-07  2604  	 * At this point, all our guesses failed, we just return
1baca4ce16b8cc Juri Lelli        2013-11-07  2605  	 * 'something', and let the caller sort the things out.
1baca4ce16b8cc Juri Lelli        2013-11-07  2606  	 */
1baca4ce16b8cc Juri Lelli        2013-11-07  2607  	if (this_cpu != -1)
1baca4ce16b8cc Juri Lelli        2013-11-07  2608  		return this_cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2609  
14e292f8d45380 Peter Zijlstra    2020-10-01  2610  	cpu = cpumask_any_distribute(later_mask);
1baca4ce16b8cc Juri Lelli        2013-11-07  2611  	if (cpu < nr_cpu_ids)
1baca4ce16b8cc Juri Lelli        2013-11-07  2612  		return cpu;
1baca4ce16b8cc Juri Lelli        2013-11-07  2613  
1baca4ce16b8cc Juri Lelli        2013-11-07  2614  	return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2615  }
1baca4ce16b8cc Juri Lelli        2013-11-07  2616  

:::::: The code at line 2548 was first introduced by commit
:::::: eb7630f95f837de97eee0f6e1fb9c2f96fc90742 ANDROID: sched: Push execution and scheduler context split into deadline and rt

:::::: TO: Connor O'Brien <connoro@google.com>
:::::: CC: John Stultz <jstultz@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
