Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4918B1EF0B0
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 22:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766355384; cv=none; b=Wu4zyEZ9t5/iAXH41+vV1N8XGOoUvy2D0Dveb1liaiKEnDfUEyBlB5GOm3XjCOE1rWoGN9CfEVKJA55nUZ+xW9FHScOJLaaeeA8cVkIZZO1RNLvbVWgd6DxaL4cz/lZ6L8v6s/Iy+Q5jGBO8rCBE4wcMClFEPkEeoVZmpCWgIBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766355384; c=relaxed/simple;
	bh=DGWkpasVGduDvXRR9YG1V4hhTk9JNjoBlOvuAwytRUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hn8IUG9gp/KXG2UNUuJ+5fv8/P7OyrnrAfHEjwuqtfLAIZECOzXjzMiNbRcVlfskWkBQG50jY8KjEqEWFoj19TvkruZysmNpMAPoX0f+vKdKUDWHt1caif73ZMNzZ+B49JTo+MUZI675e2ZG+nCTUaTYfx5aYtwyu7LPbOg61AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFtzIFeH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFtzIFeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766355382; x=1797891382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DGWkpasVGduDvXRR9YG1V4hhTk9JNjoBlOvuAwytRUw=;
  b=fFtzIFeH0X0810sfjQrScEByA1GyugY90xgCDr9zzthNN3rOF6vL2J3l
   S0eyfd/d4Qw3pio3iZVlZKQmtIFkn3UzKfsy2g6fI94okjgyW69/4s52n
   yvWqjf5bCNS/tiD14VLfyZuPAo9v94U0Z4heIOo2stBIKVoc9BBqHlIpr
   RxSPFmJMVjT/eLAwFAJcwEzAVPp34YNm3sn+hroKMEH6uQJgL/4zAWWON
   IxrIMvCgtLC9XDWAQ2Dj22cpIQoGYSnBIP2k6nx82+4VY4VaRv9jGt88l
   6CoFkWs5gpXXsZBhxNbMcwHFCORejq0krUhRvT1Ajn4jFp3Thm7d9V1bE
   A==;
X-CSE-ConnectionGUID: ZkUKk9SqRGG8U77tkN63yw==
X-CSE-MsgGUID: 6smvNWW9S0qXTaEWakGHHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="93694882"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="93694882"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 14:16:19 -0800
X-CSE-ConnectionGUID: apEzkR/OReyMN9qpZjMkfw==
X-CSE-MsgGUID: YxxHmtw+RjySP9Ad/2QSxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199018412"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2025 14:16:18 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXRiq-000000000Ev-0A8s;
	Sun, 21 Dec 2025 22:16:16 +0000
Date: Mon, 22 Dec 2025 06:15:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/power/energy_model.c:649 em_dev_register_pd_no_update()
 error: we previously assumed 'dev->em_pd' could be null (see line 594)
Message-ID: <202512220613.9bpzlxd7-lkp@intel.com>
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
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9094662f6707d1d4b53d18baba459604e8bb0783
commit: e0423541477dfb684fbc6e6b5386054bc650f264 PM: EM: Add function for registering a PD without capacity update
date:   3 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: powerpc64-randconfig-r072-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220613.9bpzlxd7-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512220613.9bpzlxd7-lkp@intel.com/

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
