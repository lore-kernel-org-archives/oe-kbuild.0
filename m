Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A7B347FEC
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Apr 2026 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776427238; cv=none; b=FV6BmhslhqbSFt4VgatSvLw2aoC3IMxpNcJybWRvYgtGEm3OIMKaoutL5nEGHOnV/U8HE8nCGzgsXganc/3XCLL+mMsQBOiPqntoJ6MzddfWr8abiGTMy5a7KHFbsa9e45n62Wu5OO6J5x0lDrbK6r6NuRhf6zKN+Na6KAbVepQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776427238; c=relaxed/simple;
	bh=UndS1qtjXaoHrsgLLez7NHUzrKV9QajRwKTZbZ8Er9w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=azF/CGP4oOoDP2sUhfYUziQ9SjEYaUjgz9M26fz88e8v8OviE9h2fXKCrL3igrUrbQcYzIUY+Gv0NoonmcuuSCe/VrS9s0p/CkZ3q6Od5/YM3TMegNV2xdxeOyiJfcUMCSDIeuZvAruh/uRyengehl24L8C2u1KMQkoodiNQdJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESp3WJmm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESp3WJmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776427236; x=1807963236;
  h=date:from:to:cc:subject:message-id;
  bh=UndS1qtjXaoHrsgLLez7NHUzrKV9QajRwKTZbZ8Er9w=;
  b=ESp3WJmmUOkQAzKEz8/tmKIZojCYbzdPVYluoKNWKrUQDgsgH32Ltupo
   tuLVPG5V2HesINVsZS9GHTnKNyneb7kBdd7MTHIEmlSsFYXTXpjy4OQtz
   rFGvE0FisHJCLgp7hiBDlmWTc01GZfqxauxSu3JxkGxnExLS6kwqFH/Xt
   oBw0FDvgWOvzTMTmkwaJImIfyHxSY5S6rjqvUGxZcSD9X3j3bQJ5Gd1iU
   uZEdhFzUOowfhyRHsf59H+uHG9uTQ3yHAUMN105Ci45exTDzNWaYeuo6l
   WOVmJjPQMN5qpSBnF9gw4NOoavD4ZW53OM/tvS9J2xdowaJ13GgMMBz3G
   w==;
X-CSE-ConnectionGUID: j6+aioR4RPSE2oLnCNYLRw==
X-CSE-MsgGUID: 8xbfAUcOSvyaBCZD3Brd8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81320300"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="81320300"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:00:35 -0700
X-CSE-ConnectionGUID: 1W1BEhWdTa+DF3Vs1QG+gA==
X-CSE-MsgGUID: 1YJkMyt6QvGN+6XwFxvf0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="228345396"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Apr 2026 05:00:34 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDhs8-000000000Jn-1yaJ;
	Fri, 17 Apr 2026 12:00:32 +0000
Date: Fri, 17 Apr 2026 19:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/power/energy_model.c:649
 em_dev_register_pd_no_update() error: we previously assumed 'dev->em_pd'
 could be null (see line 594)
Message-ID: <202604171910.UyL0lHLt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   43cfbdda5af60ffc6272a7b8c5c37d1d0a181ca9
commit: e0423541477dfb684fbc6e6b5386054bc650f264 PM: EM: Add function for registering a PD without capacity update
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: powerpc64-randconfig-r073-20260417 (https://download.01.org/0day-ci/archive/20260417/202604171910.UyL0lHLt-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e0423541477d ("PM: EM: Add function for registering a PD without capacity update")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604171910.UyL0lHLt-lkp@intel.com/

smatch warnings:
kernel/power/energy_model.c:649 em_dev_register_pd_no_update() error: we previously assumed 'dev->em_pd' could be null (see line 594)

vim +649 kernel/power/energy_model.c

e0423541477dfb Rafael J. Wysocki 2025-09-05  564  
e0423541477dfb Rafael J. Wysocki 2025-09-05  565  /**
e0423541477dfb Rafael J. Wysocki 2025-09-05  566   * em_dev_register_pd_no_update() - Register a perf domain for a device
e0423541477dfb Rafael J. Wysocki 2025-09-05  567   * @dev : Device to register the PD for
e0423541477dfb Rafael J. Wysocki 2025-09-05  568   * @nr_states : Number of performance states in the new PD
e0423541477dfb Rafael J. Wysocki 2025-09-05  569   * @cb : Callback functions for populating the energy model
e0423541477dfb Rafael J. Wysocki 2025-09-05  570   * @cpus : CPUs to include in the new PD (mandatory if @dev is a CPU device)
e0423541477dfb Rafael J. Wysocki 2025-09-05  571   * @microwatts : Whether or not the power values in the EM will be in uW
e0423541477dfb Rafael J. Wysocki 2025-09-05  572   *
e0423541477dfb Rafael J. Wysocki 2025-09-05  573   * Like em_dev_register_perf_domain(), but does not trigger a CPU capacity
e0423541477dfb Rafael J. Wysocki 2025-09-05  574   * update after registering the PD, even if @dev is a CPU device.
e0423541477dfb Rafael J. Wysocki 2025-09-05  575   */
e0423541477dfb Rafael J. Wysocki 2025-09-05  576  int em_dev_register_pd_no_update(struct device *dev, unsigned int nr_states,
e0423541477dfb Rafael J. Wysocki 2025-09-05  577  				 const struct em_data_callback *cb,
e0423541477dfb Rafael J. Wysocki 2025-09-05  578  				 const cpumask_t *cpus, bool microwatts)
27871f7a8a341e Quentin Perret    2018-12-03  579  {
3ee7be9e10dd5f Rafael J. Wysocki 2025-03-06  580  	struct em_perf_table *em_table;
27871f7a8a341e Quentin Perret    2018-12-03  581  	unsigned long cap, prev_cap = 0;
91362463114eb6 Lukasz Luba       2022-03-21  582  	unsigned long flags = 0;
1bc138c6229599 Lukasz Luba       2020-06-10  583  	int cpu, ret;
27871f7a8a341e Quentin Perret    2018-12-03  584  
1bc138c6229599 Lukasz Luba       2020-06-10  585  	if (!dev || !nr_states || !cb)
27871f7a8a341e Quentin Perret    2018-12-03  586  		return -EINVAL;
27871f7a8a341e Quentin Perret    2018-12-03  587  
27871f7a8a341e Quentin Perret    2018-12-03  588  	/*
27871f7a8a341e Quentin Perret    2018-12-03  589  	 * Use a mutex to serialize the registration of performance domains and
27871f7a8a341e Quentin Perret    2018-12-03  590  	 * let the driver-defined callback functions sleep.
27871f7a8a341e Quentin Perret    2018-12-03  591  	 */
27871f7a8a341e Quentin Perret    2018-12-03  592  	mutex_lock(&em_pd_mutex);
27871f7a8a341e Quentin Perret    2018-12-03  593  
1bc138c6229599 Lukasz Luba       2020-06-10 @594  	if (dev->em_pd) {
27871f7a8a341e Quentin Perret    2018-12-03  595  		ret = -EEXIST;
27871f7a8a341e Quentin Perret    2018-12-03  596  		goto unlock;
27871f7a8a341e Quentin Perret    2018-12-03  597  	}
27871f7a8a341e Quentin Perret    2018-12-03  598  
1bc138c6229599 Lukasz Luba       2020-06-10  599  	if (_is_cpu_device(dev)) {
1bc138c6229599 Lukasz Luba       2020-06-10  600  		if (!cpus) {
1bc138c6229599 Lukasz Luba       2020-06-10  601  			dev_err(dev, "EM: invalid CPU mask\n");
1bc138c6229599 Lukasz Luba       2020-06-10  602  			ret = -EINVAL;
1bc138c6229599 Lukasz Luba       2020-06-10  603  			goto unlock;
1bc138c6229599 Lukasz Luba       2020-06-10  604  		}
1bc138c6229599 Lukasz Luba       2020-06-10  605  
1bc138c6229599 Lukasz Luba       2020-06-10  606  		for_each_cpu(cpu, cpus) {
1bc138c6229599 Lukasz Luba       2020-06-10  607  			if (em_cpu_get(cpu)) {
1bc138c6229599 Lukasz Luba       2020-06-10  608  				dev_err(dev, "EM: exists for CPU%d\n", cpu);
1bc138c6229599 Lukasz Luba       2020-06-10  609  				ret = -EEXIST;
1bc138c6229599 Lukasz Luba       2020-06-10  610  				goto unlock;
1bc138c6229599 Lukasz Luba       2020-06-10  611  			}
27871f7a8a341e Quentin Perret    2018-12-03  612  			/*
1bc138c6229599 Lukasz Luba       2020-06-10  613  			 * All CPUs of a domain must have the same
1bc138c6229599 Lukasz Luba       2020-06-10  614  			 * micro-architecture since they all share the same
1bc138c6229599 Lukasz Luba       2020-06-10  615  			 * table.
27871f7a8a341e Quentin Perret    2018-12-03  616  			 */
8ec59c0f5f4966 Vincent Guittot   2019-06-17  617  			cap = arch_scale_cpu_capacity(cpu);
27871f7a8a341e Quentin Perret    2018-12-03  618  			if (prev_cap && prev_cap != cap) {
1bc138c6229599 Lukasz Luba       2020-06-10  619  				dev_err(dev, "EM: CPUs of %*pbl must have the same capacity\n",
1bc138c6229599 Lukasz Luba       2020-06-10  620  					cpumask_pr_args(cpus));
1bc138c6229599 Lukasz Luba       2020-06-10  621  
27871f7a8a341e Quentin Perret    2018-12-03  622  				ret = -EINVAL;
27871f7a8a341e Quentin Perret    2018-12-03  623  				goto unlock;
27871f7a8a341e Quentin Perret    2018-12-03  624  			}
27871f7a8a341e Quentin Perret    2018-12-03  625  			prev_cap = cap;
27871f7a8a341e Quentin Perret    2018-12-03  626  		}
1bc138c6229599 Lukasz Luba       2020-06-10  627  	}
27871f7a8a341e Quentin Perret    2018-12-03  628  
ae6ccaa650380d Lukasz Luba       2022-07-07  629  	if (microwatts)
ae6ccaa650380d Lukasz Luba       2022-07-07  630  		flags |= EM_PERF_DOMAIN_MICROWATTS;
91362463114eb6 Lukasz Luba       2022-03-21  631  	else if (cb->get_cost)
91362463114eb6 Lukasz Luba       2022-03-21  632  		flags |= EM_PERF_DOMAIN_ARTIFICIAL;
91362463114eb6 Lukasz Luba       2022-03-21  633  
3acec69a94eaaf Lukasz Luba       2024-03-08  634  	/*
3acec69a94eaaf Lukasz Luba       2024-03-08  635  	 * EM only supports uW (exception is artificial EM).
3acec69a94eaaf Lukasz Luba       2024-03-08  636  	 * Therefore, check and force the drivers to provide
3acec69a94eaaf Lukasz Luba       2024-03-08  637  	 * power in uW.
3acec69a94eaaf Lukasz Luba       2024-03-08  638  	 */
3acec69a94eaaf Lukasz Luba       2024-03-08  639  	if (!microwatts && !(flags & EM_PERF_DOMAIN_ARTIFICIAL)) {
3acec69a94eaaf Lukasz Luba       2024-03-08  640  		dev_err(dev, "EM: only supports uW power values\n");
3acec69a94eaaf Lukasz Luba       2024-03-08  641  		ret = -EINVAL;
3acec69a94eaaf Lukasz Luba       2024-03-08  642  		goto unlock;
3acec69a94eaaf Lukasz Luba       2024-03-08  643  	}
3acec69a94eaaf Lukasz Luba       2024-03-08  644  
91362463114eb6 Lukasz Luba       2022-03-21  645  	ret = em_create_pd(dev, nr_states, cb, cpus, flags);
1bc138c6229599 Lukasz Luba       2020-06-10  646  	if (ret)
27871f7a8a341e Quentin Perret    2018-12-03  647  		goto unlock;
27871f7a8a341e Quentin Perret    2018-12-03  648  
91362463114eb6 Lukasz Luba       2022-03-21 @649  	dev->em_pd->flags |= flags;
5609296750afd6 Lukasz Luba       2024-10-30  650  	dev->em_pd->min_perf_state = 0;
5609296750afd6 Lukasz Luba       2024-10-30  651  	dev->em_pd->max_perf_state = nr_states - 1;
c250d50fe2ce62 Lukasz Luba       2020-11-05  652  
3ee7be9e10dd5f Rafael J. Wysocki 2025-03-06  653  	em_table = rcu_dereference_protected(dev->em_pd->em_table,
3ee7be9e10dd5f Rafael J. Wysocki 2025-03-06  654  					     lockdep_is_held(&em_pd_mutex));
3ee7be9e10dd5f Rafael J. Wysocki 2025-03-06  655  	em_cpufreq_update_efficiencies(dev, em_table->state);
e458716a92b57f Vincent Donnefort 2021-09-08  656  
1bc138c6229599 Lukasz Luba       2020-06-10  657  	em_debug_create_pd(dev);
1bc138c6229599 Lukasz Luba       2020-06-10  658  	dev_info(dev, "EM: created perf domain\n");
27871f7a8a341e Quentin Perret    2018-12-03  659  
27871f7a8a341e Quentin Perret    2018-12-03  660  unlock:
27871f7a8a341e Quentin Perret    2018-12-03  661  	mutex_unlock(&em_pd_mutex);
e3f1164fc9ee84 Lukasz Luba       2024-02-08  662  
27871f7a8a341e Quentin Perret    2018-12-03  663  	return ret;
27871f7a8a341e Quentin Perret    2018-12-03  664  }
e0423541477dfb Rafael J. Wysocki 2025-09-05  665  EXPORT_SYMBOL_GPL(em_dev_register_pd_no_update);
7d9895c7fbfc9c Lukasz Luba       2020-05-27  666  

:::::: The code at line 649 was first introduced by commit
:::::: 91362463114eb63ead5f02c11d58c46064c339e7 PM: EM: Use the new .get_cost() callback while registering EM

:::::: TO: Lukasz Luba <lukasz.luba@arm.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
