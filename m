Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A612E7F00
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Sep 2025 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756826957; cv=none; b=EQ9z1roPTyon/lgg28J50meD16HOLVo/K/p0/YE78TIpuCl1Au9o9XmvNyxwKgcDrSSEkDJ/C05qCaS5QVJ7xvh/H8INCrLgoS81z82DOtCjDWyQSLyrsV4A2QszhF9cxaUbNRyY8v04ISWNyUgXZDGV6H2e/1ngW5j3PUenzWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756826957; c=relaxed/simple;
	bh=nEIioeZAk/Seq6SNU7vaOhcDdx/3N7kgSkiNzcHuqmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o83ZXsFQie3VN+JFpWreIBNIwRE9EQJYBlYU8+whmgmCa+mneHmAcWsQ8RbAAjwHLoj/UFbUh2AOFQONge8OckJ/w4OxYvWijyQV7kk/lLH/sV0B7TmxNuM4gU+TQXmOvpBbLsxt+NLY9on+ukfweNAobIDroNZr2R1crCvi5YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyESfT3o; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyESfT3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756826956; x=1788362956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nEIioeZAk/Seq6SNU7vaOhcDdx/3N7kgSkiNzcHuqmQ=;
  b=FyESfT3oP1JINxzZLriw/b7Vkjeu9QjjIX+A9XbvtFTeCZooyUfkCtLp
   xwxaSTAn7okvZF5dRT0Eqjk2EIB8jm0AjC70j5wYrX3e4rqtcLEFx4FkJ
   Ag0gCT4ZJmhOXVTjWpqAABtDhhmME/yMLRC4ZRzQYXx/lD80ZdNVwvCFn
   gsOMysrmu0RnzrE2Ik5lJiRwTOOKZrnOWHoojO9SWofRyJ8opEkNAKjFk
   dfrBtLCRnPPQENpXC7wHVCNcPTLNuejVQSYdjuprRcCZPPhJmL6rkv8tm
   52Z4VktBWmt5eXHkePCJtUms79xmFtGn5aptyc3rvmLmrUxNdiuEcUK7T
   Q==;
X-CSE-ConnectionGUID: uaNoGtxqQ5KV/Dndq3LSgw==
X-CSE-MsgGUID: erTl+VYpQh+Omvp0fkuzTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59243834"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59243834"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 08:29:16 -0700
X-CSE-ConnectionGUID: VQbnDNWQQMmi60QaTXcZUQ==
X-CSE-MsgGUID: qFhXktzaQcmGrjdvYMVK/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170600007"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 08:29:14 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utSuX-0002gn-0u;
	Tue, 02 Sep 2025 15:27:44 +0000
Date: Tue, 2 Sep 2025 23:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 12/12] PM: EM: Use scope-based cleanup helper
Message-ID: <202509022308.CeaKUqJM-lkp@intel.com>
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
In-Reply-To: <20250901085748.36795-13-zhangzihuan@kylinos.cn>
References: <20250901085748.36795-13-zhangzihuan@kylinos.cn>
TO: Zihuan Zhang <zhangzihuan@kylinos.cn>
TO: "Rafael J . wysocki" <rafael@kernel.org>
TO: Viresh Kumar <viresh.kumar@linaro.org>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Borislav Petkov <bp@alien8.de>
TO: Dave Hansen <dave.hansen@linux.intel.com>
TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: MyungJoo Ham <myungjoo.ham@samsung.com>
TO: Kyungmin Park <kyungmin.park@samsung.com>
TO: Chanwoo Choi <cw00.choi@samsung.com>
TO: Jani Nikula <jani.nikula@linux.intel.com>
TO: Rodrigo Vivi <rodrigo.vivi@intel.com>
TO: Tvrtko Ursulin <tursulin@ursulin.net>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Daniel Lezcano <daniel.lezcano@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Eduardo Valentin <edubezval@gmail.com>
TO: Keerthy <j-keerthy@ti.com>
CC: Ben Horgan <ben.horgan@arm.com>
CC: zhenglifeng <zhenglifeng1@huawei.com>
CC: Zhang Rui <rui.zhang@intel.com>
CC: Len Brown <lenb@kernel.org>
CC: Lukasz Luba <lukasz.luba@arm.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>

Hi Zihuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge rafael-pm/thermal arm64/for-next/core linus/master v6.17-rc4 next-20250902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zihuan-Zhang/arm64-topology-Use-scope-based-cleanup-helper/20250901-170106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250901085748.36795-13-zhangzihuan%40kylinos.cn
patch subject: [PATCH v3 12/12] PM: EM: Use scope-based cleanup helper
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: powerpc64-randconfig-r071-20250902 (https://download.01.org/0day-ci/archive/20250902/202509022308.CeaKUqJM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509022308.CeaKUqJM-lkp@intel.com/

smatch warnings:
kernel/power/energy_model.c:454 em_cpufreq_update_efficiencies() error: uninitialized symbol 'policy'.
kernel/power/energy_model.c:454 em_cpufreq_update_efficiencies() error: uninitialized symbol 'policy'.

vim +/policy +454 kernel/power/energy_model.c

1bc138c6229599 Lukasz Luba       2020-06-10  449  
e7b1cc9a7ea6d7 Lukasz Luba       2024-02-08  450  static void
e7b1cc9a7ea6d7 Lukasz Luba       2024-02-08  451  em_cpufreq_update_efficiencies(struct device *dev, struct em_perf_state *table)
e458716a92b57f Vincent Donnefort 2021-09-08  452  {
e458716a92b57f Vincent Donnefort 2021-09-08  453  	struct em_perf_domain *pd = dev->em_pd;
3a096464b04b72 Zihuan Zhang      2025-09-01 @454  	struct cpufreq_policy *policy __free(put_cpufreq_policy);
e458716a92b57f Vincent Donnefort 2021-09-08  455  	int found = 0;
99907d6054f2d3 Lukasz Luba       2024-02-08  456  	int i, cpu;
e458716a92b57f Vincent Donnefort 2021-09-08  457  
e7b1cc9a7ea6d7 Lukasz Luba       2024-02-08  458  	if (!_is_cpu_device(dev))
e458716a92b57f Vincent Donnefort 2021-09-08  459  		return;
e458716a92b57f Vincent Donnefort 2021-09-08  460  
99907d6054f2d3 Lukasz Luba       2024-02-08  461  	/* Try to get a CPU which is active and in this PD */
99907d6054f2d3 Lukasz Luba       2024-02-08  462  	cpu = cpumask_first_and(em_span_cpus(pd), cpu_active_mask);
99907d6054f2d3 Lukasz Luba       2024-02-08  463  	if (cpu >= nr_cpu_ids) {
99907d6054f2d3 Lukasz Luba       2024-02-08  464  		dev_warn(dev, "EM: No online CPU for CPUFreq policy\n");
99907d6054f2d3 Lukasz Luba       2024-02-08  465  		return;
99907d6054f2d3 Lukasz Luba       2024-02-08  466  	}
99907d6054f2d3 Lukasz Luba       2024-02-08  467  
99907d6054f2d3 Lukasz Luba       2024-02-08  468  	policy = cpufreq_cpu_get(cpu);
e458716a92b57f Vincent Donnefort 2021-09-08  469  	if (!policy) {
4274521fabee05 Lukasz Luba       2024-02-08  470  		dev_warn(dev, "EM: Access to CPUFreq policy failed\n");
e458716a92b57f Vincent Donnefort 2021-09-08  471  		return;
e458716a92b57f Vincent Donnefort 2021-09-08  472  	}
e458716a92b57f Vincent Donnefort 2021-09-08  473  
e458716a92b57f Vincent Donnefort 2021-09-08  474  	for (i = 0; i < pd->nr_perf_states; i++) {
e458716a92b57f Vincent Donnefort 2021-09-08  475  		if (!(table[i].flags & EM_PERF_STATE_INEFFICIENT))
e458716a92b57f Vincent Donnefort 2021-09-08  476  			continue;
e458716a92b57f Vincent Donnefort 2021-09-08  477  
e458716a92b57f Vincent Donnefort 2021-09-08  478  		if (!cpufreq_table_set_inefficient(policy, table[i].frequency))
e458716a92b57f Vincent Donnefort 2021-09-08  479  			found++;
e458716a92b57f Vincent Donnefort 2021-09-08  480  	}
e458716a92b57f Vincent Donnefort 2021-09-08  481  
e458716a92b57f Vincent Donnefort 2021-09-08  482  	if (!found)
e458716a92b57f Vincent Donnefort 2021-09-08  483  		return;
e458716a92b57f Vincent Donnefort 2021-09-08  484  
e458716a92b57f Vincent Donnefort 2021-09-08  485  	/*
e458716a92b57f Vincent Donnefort 2021-09-08  486  	 * Efficiencies have been installed in CPUFreq, inefficient frequencies
e458716a92b57f Vincent Donnefort 2021-09-08  487  	 * will be skipped. The EM can do the same.
e458716a92b57f Vincent Donnefort 2021-09-08  488  	 */
e458716a92b57f Vincent Donnefort 2021-09-08  489  	pd->flags |= EM_PERF_DOMAIN_SKIP_INEFFICIENCIES;
e458716a92b57f Vincent Donnefort 2021-09-08  490  }
e458716a92b57f Vincent Donnefort 2021-09-08  491  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
