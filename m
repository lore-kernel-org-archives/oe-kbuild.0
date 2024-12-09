Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7084914F126
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718862; cv=none; b=NKSEj3kO1ZzLhoHJUAS81lA3FWLlC81/WlAkTOM1zzSFhf9oQDgBk7yXWxnrfILXcEC82H0Mw96ggLXe8ZRnxIBXMU6djjhndf/l8HzuP56lK8Jzrjh9f9AxQXSfOoZS8pvNZ1Xbkpv8TxNbZCUorwnUloDPniXNwLNL3v5r0bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718862; c=relaxed/simple;
	bh=O1vkSuM9KvcH1BexV3mROgJ7HX89dh55YwGYVn5cCfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=swDduT/ZyPY8TOuN4/t1Xg8UaOm3W5ms+S5/EsoMt3YvHRKSVv3LwaatsG7zG4lMHhLpQ8Uru/EG5zKbhfFjXSNMkTbA4dEaZSqhUn3dQReThK6FRFvkImLo9a8iP+yGm4ia4s+v3I42euAeQp1IhlPnxkPizWUy3sJlSoLdjew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/+6EYGH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/+6EYGH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718861; x=1765254861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O1vkSuM9KvcH1BexV3mROgJ7HX89dh55YwGYVn5cCfo=;
  b=K/+6EYGHv+61za5n8YohF6wztKIPO9WORcjOPzu4K7urpNv732wnLekQ
   nKSbZoiQygblwMBCLD7mT1nv2FIUrwlFVnOX3sY7nxqcRblT9c3X4tG7Y
   MNNmCzbHfqF9Qmn3K1wm5Am5faCkldELg45NlbtG1jfN+C9FmsAeSWXGO
   5/c9IJdDxl3Nxi9blcI7P/XIRIZSsWMXp8WG700DsDdY5fB5G1JlnMxB3
   UBwwh1JYLFIWf7BAadiUrXzT0SOhqyVuSjygNIPujWqNjx22p7kYgAQ4V
   utGYjL7b//TtoOEXG6okFL4AXvvak/5uEGgo9h95n1KY4ZtoazqnVzrNe
   Q==;
X-CSE-ConnectionGUID: i7p8x2yQSraBz5USUb6OxQ==
X-CSE-MsgGUID: 4JvcqoHOT5eFI5I9JpIU/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="45014123"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="45014123"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:34:20 -0800
X-CSE-ConnectionGUID: ZPITC+E9TZ+/HB9I4ssxEg==
X-CSE-MsgGUID: Uo8Pjy2DT9upyCelysuXIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95048932"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 20:34:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVTM-0003sS-1j;
	Mon, 09 Dec 2024 04:34:16 +0000
Date: Mon, 9 Dec 2024 12:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 1590/1590] drivers/cpufreq/acpi-cpufreq.c:661
 get_max_boost_ratio() error: uninitialized symbol 'highest_perf'.
Message-ID: <202412080814.UU32PXsv-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: "leoliu-oc" <leoliu-oc@zhaoxin.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   330348879858de86a15cef38738cbf022633f403
commit: a5456c60ffb4f5d4147d8b8da36b81f729cac83b [1590/1590] cpufreq: ACPI: add ITMT support when CPPC enabled
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20241208/202412080814.UU32PXsv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412080814.UU32PXsv-lkp@intel.com/

smatch warnings:
drivers/cpufreq/acpi-cpufreq.c:661 get_max_boost_ratio() error: uninitialized symbol 'highest_perf'.
drivers/cpufreq/acpi-cpufreq.c:661 get_max_boost_ratio() error: uninitialized symbol 'nominal_perf'.
drivers/cpufreq/acpi-cpufreq.c:689 cpufreq_set_itmt_prio() error: uninitialized symbol 'highest_perf'.

vim +/highest_perf +661 drivers/cpufreq/acpi-cpufreq.c

3743d55b289c20 Huang Rui         2021-04-25  651  
a5456c60ffb4f5 leoliu-oc         2024-07-10  652  static u64 get_max_boost_ratio(unsigned int cpu)
a5456c60ffb4f5 leoliu-oc         2024-07-10  653  {
a5456c60ffb4f5 leoliu-oc         2024-07-10  654  	u64 highest_perf, nominal_perf;
a5456c60ffb4f5 leoliu-oc         2024-07-10  655  
a5456c60ffb4f5 leoliu-oc         2024-07-10  656  	if (acpi_pstate_strict)
a5456c60ffb4f5 leoliu-oc         2024-07-10  657  		return 0;
a5456c60ffb4f5 leoliu-oc         2024-07-10  658  
a5456c60ffb4f5 leoliu-oc         2024-07-10  659  	cppc_get_highest_nominal_perf(cpu, &highest_perf, &nominal_perf);
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  660  
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04 @661  	if (!highest_perf || !nominal_perf) {
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  662  		pr_debug("CPU%d: highest or nominal performance missing\n", cpu);
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  663  		return 0;
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  664  	}
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  665  
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  666  	if (highest_perf < nominal_perf) {
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  667  		pr_debug("CPU%d: nominal performance above highest\n", cpu);
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  668  		return 0;
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  669  	}
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  670  
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  671  	return div_u64(highest_perf << SCHED_CAPACITY_SHIFT, nominal_perf);
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  672  }
a5456c60ffb4f5 leoliu-oc         2024-07-10  673  
a5456c60ffb4f5 leoliu-oc         2024-07-10  674  /* The work item is needed to avoid CPU hotplug locking issues */
a5456c60ffb4f5 leoliu-oc         2024-07-10  675  static void cpufreq_sched_itmt_work_fn(struct work_struct *work)
a5456c60ffb4f5 leoliu-oc         2024-07-10  676  {
a5456c60ffb4f5 leoliu-oc         2024-07-10  677  	sched_set_itmt_support();
a5456c60ffb4f5 leoliu-oc         2024-07-10  678  }
a5456c60ffb4f5 leoliu-oc         2024-07-10  679  
a5456c60ffb4f5 leoliu-oc         2024-07-10  680  static DECLARE_WORK(sched_itmt_work, cpufreq_sched_itmt_work_fn);
a5456c60ffb4f5 leoliu-oc         2024-07-10  681  
a5456c60ffb4f5 leoliu-oc         2024-07-10  682  static void cpufreq_set_itmt_prio(int cpu)
a5456c60ffb4f5 leoliu-oc         2024-07-10  683  {
a5456c60ffb4f5 leoliu-oc         2024-07-10  684  	u64 highest_perf, nominal_perf;
a5456c60ffb4f5 leoliu-oc         2024-07-10  685  	static u64 max_highest_perf = 0, min_highest_perf = U64_MAX;
a5456c60ffb4f5 leoliu-oc         2024-07-10  686  
a5456c60ffb4f5 leoliu-oc         2024-07-10  687  	cppc_get_highest_nominal_perf(cpu, &highest_perf, &nominal_perf);
a5456c60ffb4f5 leoliu-oc         2024-07-10  688  
a5456c60ffb4f5 leoliu-oc         2024-07-10 @689  	sched_set_itmt_core_prio(highest_perf, cpu);
a5456c60ffb4f5 leoliu-oc         2024-07-10  690  	cpumask_set_cpu(cpu, &core_prior_mask);
a5456c60ffb4f5 leoliu-oc         2024-07-10  691  
a5456c60ffb4f5 leoliu-oc         2024-07-10  692  	if (max_highest_perf <= min_highest_perf) {
a5456c60ffb4f5 leoliu-oc         2024-07-10  693  		if (highest_perf > max_highest_perf)
a5456c60ffb4f5 leoliu-oc         2024-07-10  694  			max_highest_perf = highest_perf;
a5456c60ffb4f5 leoliu-oc         2024-07-10  695  
a5456c60ffb4f5 leoliu-oc         2024-07-10  696  		if (highest_perf < min_highest_perf)
a5456c60ffb4f5 leoliu-oc         2024-07-10  697  			min_highest_perf = highest_perf;
a5456c60ffb4f5 leoliu-oc         2024-07-10  698  
a5456c60ffb4f5 leoliu-oc         2024-07-10  699  		if (max_highest_perf > min_highest_perf) {
a5456c60ffb4f5 leoliu-oc         2024-07-10  700  			/*
a5456c60ffb4f5 leoliu-oc         2024-07-10  701  			 * This code can be run during CPU online under the
a5456c60ffb4f5 leoliu-oc         2024-07-10  702  			 * CPU hotplug locks, so sched_set_itmt_support()
a5456c60ffb4f5 leoliu-oc         2024-07-10  703  			 * cannot be called from here.  Queue up a work item
a5456c60ffb4f5 leoliu-oc         2024-07-10  704  			 * to invoke it.
a5456c60ffb4f5 leoliu-oc         2024-07-10  705  			 */
a5456c60ffb4f5 leoliu-oc         2024-07-10  706  			cppc_highest_perf_diff = true;
a5456c60ffb4f5 leoliu-oc         2024-07-10  707  		}
a5456c60ffb4f5 leoliu-oc         2024-07-10  708  	}
a5456c60ffb4f5 leoliu-oc         2024-07-10  709  
a5456c60ffb4f5 leoliu-oc         2024-07-10  710  	if (cppc_highest_perf_diff && cpumask_equal(&core_prior_mask, cpu_online_mask)) {
a5456c60ffb4f5 leoliu-oc         2024-07-10  711  		pr_debug("queue a work to set itmt enabled\n");
a5456c60ffb4f5 leoliu-oc         2024-07-10  712  		schedule_work(&sched_itmt_work);
a5456c60ffb4f5 leoliu-oc         2024-07-10  713  	}
a5456c60ffb4f5 leoliu-oc         2024-07-10  714  }
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  715  #else
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  716  static inline u64 get_max_boost_ratio(unsigned int cpu) { return 0; }
a5456c60ffb4f5 leoliu-oc         2024-07-10  717  static inline void cpufreq_set_itmt_prio(int cpu) { }
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  718  #endif
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  719  

:::::: The code at line 661 was first introduced by commit
:::::: 3c55e94c0adea4a5389c4b80f6ae9927dd6a4501 cpufreq: ACPI: Extend frequency tables to cover boost frequencies

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
