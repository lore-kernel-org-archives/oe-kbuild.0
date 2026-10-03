Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917AC30C165
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 01:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990100; cv=none; b=dQPTRHG5fvNfkdcWe/s4fjK6l6eeDkIE0xBKaIycEUDlEfr1Te9PRhZrs7w0mwggs286Tm4Gmey2B0zt54atldhie9Mrb7S3TK1qjPorJiR2vp38+IMzXDAa/LkP68vT4b0cle/t70KkEjkvk3DDMY0S6mAZsO+PAE2sj47RgO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990100; c=relaxed/simple;
	bh=xdN2al1htpZCrRSah/sahH57ubVVqFqIZFdeKAgCcJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=odJIJDYIiQZqAOB74RxH73QrWrparS1ToXP1UEZ1NFGstlNNh34q8cRMcVeLNLpRvSg95/3/GQVM86AAwzFlk/w7LetjhTM1BMCsDCbaPBt0g0OihLV+w+2eWEPuj0F3ShYO3Q91ads8IAYU33pFwkpUQye5aHVpwBX4Mt/XgW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTDQxbkL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTDQxbkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790990088; x=1822526088;
  h=date:from:to:cc:subject:message-id;
  bh=xdN2al1htpZCrRSah/sahH57ubVVqFqIZFdeKAgCcJ4=;
  b=iTDQxbkLDwI1+iBOaFXAl1FPgNcgi1/hk/Hv7HTu7l94Lj9Mz3RAmqWh
   oL2jGSSXE3dsdahZJ+ScnYlAcL/SRPduiu3qoDVUipUHwWSw+Euu223c8
   YtLptR6Uc4u98aWwPwaXlk+YW6EEBqxyxO6M7bXyP8+M+ID+Ub8qXK1zs
   ttQhv2NMEJ0s21126D+W7SHtB3iCN7/zyAR40oX91a36+TiLTJ72k6IAg
   RbnjodKmkeRP9dgV1fgdf/8F68hQPi1irW9brJ0kPoVb4TUDakOjwXK6o
   S+zLVI5HCEBrV6Xxuoewmo3KMG6wXep5eTaUi+75KIWhcybhi98bohWhn
   A==;
X-CSE-ConnectionGUID: BqP55b+nR5mr2yF0O2xuDQ==
X-CSE-MsgGUID: 7U9cu8+2Te+s9JW+AoVkVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90656833"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90656833"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 18:14:45 -0700
X-CSE-ConnectionGUID: 1wAA9K4mTwmTqQGEC4QKqA==
X-CSE-MsgGUID: SwrBBvWsQ1+FTj50JpAfwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="397983"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 02 Oct 2026 18:14:44 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCoKo-00000000Tdh-0nKM;
	Sat, 03 Oct 2026 01:14:42 +0000
Date: Sat, 03 Oct 2026 09:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/cgroup/cpuset.c:1462:6: warning: variable
 'newly_deisolated' is used uninitialized whenever '||' condition is true
Message-ID: <202610030953.i6dpaY25-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Qiliang-Yuan/sched-isolation-Enforce-nohz_full-as-a-subset-of-isolcpus-domain-at-boot/20261002-211021, commit: c1c04aa117466e6eb7c6cdcdf16ef9ecd795550b"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Qiliang Yuan <odys.yuan@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Qiliang-Yuan/sched-isolation-Enforce-nohz_full-as-a-subset-of-isolcpus-domain-at-boot/20261002-211021
head:   c3a5f0c6807cf259630c01943fd6469c3f256e91
commit: c1c04aa117466e6eb7c6cdcdf16ef9ecd795550b cpuset: Drive kernel-noise isolation via per-CPU hotplug cycling
date:   12 hours ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-1002-20261003 (https://download.01.org/0day-ci/archive/20261003/202610030953.i6dpaY25-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030953.i6dpaY25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030953.i6dpaY25-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cpuset.c:1462:6: warning: variable 'newly_deisolated' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
    1462 |         if (!alloc_cpumask_var(&newly_isolated, GFP_KERNEL) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:1466:20: note: uninitialized use occurs here
    1466 |                 free_cpumask_var(newly_deisolated);
         |                                  ^~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:1462:6: note: remove the '||' if its condition is always false
    1462 |         if (!alloc_cpumask_var(&newly_isolated, GFP_KERNEL) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:1459:48: note: initialize the variable 'newly_deisolated' to silence this warning
    1459 |         cpumask_var_t newly_isolated, newly_deisolated, cur_isolated;
         |                                                       ^
         |                                                        = NULL
   1 warning generated.


vim +1462 kernel/cgroup/cpuset.c

6cfeddbf4ade920 Waiman Long  2025-11-04  1437  
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1438  /*
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1439   * dhm_cycle_isolated_cpus - Apply kernel-noise isolation via hotplug cycling
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1440   *
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1441   * For each CPU newly entering isolation: cycle it offline, configure tick
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1442   * suppression and RCU callback offloading while it is offline, then bring
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1443   * it back online.  The managed-IRQ state is handled automatically by the
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1444   * existing irq_migrate_all_off_this_cpu() dying callback and the
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1445   * irq_affinity_online_cpu() online callback which both consult the
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1446   * already-updated HK_TYPE_MANAGED_IRQ mask.
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1447   *
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1448   * For each CPU leaving isolation: cycle it offline, de-offload RCU and
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1449   * restore the tick, then bring it back online.
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1450   *
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1451   * Called with cpuset_top_mutex held and no other cpuset or hotplug locks
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1452   * held: cpuset_top_mutex is the outermost lock, so remove_cpu()/add_cpu()
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1453   * may freely take cpus_write_lock() underneath it.
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1454   */
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1455  static void dhm_cycle_isolated_cpus(const struct cpumask *new_isolated)
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1456  {
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1457  	static const unsigned long noise_types =
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1458  		BIT(HK_TYPE_KERNEL_NOISE) | BIT(HK_TYPE_MANAGED_IRQ);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1459  	cpumask_var_t newly_isolated, newly_deisolated, cur_isolated;
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1460  	int cpu;
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1461  
c1c04aa117466e6 Qiliang Yuan 2026-10-02 @1462  	if (!alloc_cpumask_var(&newly_isolated, GFP_KERNEL) ||
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1463  	    !alloc_cpumask_var(&newly_deisolated, GFP_KERNEL) ||
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1464  	    !alloc_cpumask_var(&cur_isolated, GFP_KERNEL)) {
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1465  		free_cpumask_var(newly_isolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1466  		free_cpumask_var(newly_deisolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1467  		return;
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1468  	}
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1469  
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1470  	cpumask_andnot(newly_isolated, new_isolated, dhm_prev_isolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1471  	cpumask_andnot(newly_deisolated, dhm_prev_isolated, new_isolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1472  	/* cur_isolated tracks the mask actually published so far. */
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1473  	cpumask_copy(cur_isolated, dhm_prev_isolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1474  	cpumask_copy(dhm_prev_isolated, new_isolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1475  
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1476  	if (cpumask_empty(newly_isolated) && cpumask_empty(newly_deisolated))
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1477  		goto out_free;
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1478  
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1479  	/* Mark cycling CPUs so cpuset_hotplug_update_tasks skips invalidation */
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1480  	spin_lock(&dhm_cycling_lock);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1481  	cpumask_or(dhm_cycling_cpus, newly_isolated, newly_deisolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1482  	spin_unlock(&dhm_cycling_lock);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1483  
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1484  	/*
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1485  	 * Publish each CPU's kernel-noise/managed-IRQ housekeeping state
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1486  	 * strictly between its own remove_cpu() succeeding and add_cpu()
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1487  	 * bringing it back, never as a batch before the whole cycle.
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1488  	 * housekeeping_update_types() then always describes exactly which
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1489  	 * CPUs are actually ticking and running RCU callbacks normally at
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1490  	 * that instant, including the current tick_do_timer_cpu holder,
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1491  	 * which tick_nohz_cpu_hotpluggable() must see as still a
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1492  	 * housekeeping CPU for as long as it is still online and un-cycled.
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1493  	 */
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1494  	for_each_cpu(cpu, newly_isolated) {
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1495  		if (!cpu_is_hotpluggable(cpu)) {
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1496  			pr_warn_once("cpuset: CPU%d cannot be isolated (hotplug disabled)\n",
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1497  				     cpu);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1498  			cpumask_clear_cpu(cpu, dhm_prev_isolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1499  			continue;
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1500  		}
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1501  		if (remove_cpu(cpu)) {
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1502  			pr_warn_once("cpuset: failed to offline CPU%d for isolation\n",
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1503  				     cpu);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1504  			cpumask_clear_cpu(cpu, dhm_prev_isolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1505  			continue;
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1506  		}
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1507  		cpumask_set_cpu(cpu, cur_isolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1508  		WARN_ON_ONCE(housekeeping_update_types(noise_types, cur_isolated));
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1509  		WARN_ON_ONCE(tick_nohz_cpu_isolate(cpu));
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1510  		WARN_ON_ONCE(rcu_nocb_cpu_isolate(cpu));
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1511  		WARN_ON_ONCE(add_cpu(cpu));
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1512  	}
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1513  
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1514  	for_each_cpu(cpu, newly_deisolated) {
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1515  		if (remove_cpu(cpu)) {
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1516  			pr_warn_once("cpuset: failed to offline CPU%d for de-isolation\n",
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1517  				     cpu);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1518  			cpumask_set_cpu(cpu, dhm_prev_isolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1519  			continue;
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1520  		}
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1521  		cpumask_clear_cpu(cpu, cur_isolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1522  		WARN_ON_ONCE(housekeeping_update_types(noise_types, cur_isolated));
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1523  		WARN_ON_ONCE(rcu_nocb_cpu_deoffload(cpu));
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1524  		tick_nohz_cpu_deisolate(cpu);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1525  		WARN_ON_ONCE(add_cpu(cpu));
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1526  	}
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1527  
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1528  	spin_lock(&dhm_cycling_lock);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1529  	cpumask_clear(dhm_cycling_cpus);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1530  	spin_unlock(&dhm_cycling_lock);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1531  
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1532  	lockup_detector_hk_update();
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1533  
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1534  out_free:
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1535  	free_cpumask_var(newly_isolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1536  	free_cpumask_var(newly_deisolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1537  	free_cpumask_var(cur_isolated);
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1538  }
c1c04aa117466e6 Qiliang Yuan 2026-10-02  1539  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
