Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDFE19FA9D
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732975726; cv=none; b=mxx8NxUt+N6cv+l3WfYlPE3CmDUC2BFxK2b7VH0Vr2nm2WwUO5zO4qE4sTT+yGFwXHksxTFEEYLvs/sJGaEoYlfM7uhdqJ2t2AoQa6xKr7PXv+c4AgeZz/mchJjgF+UxMUo0ZR2IGyhA4GQSZDjyNUAdkDlfF6kGjXG7VbnTXy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732975726; c=relaxed/simple;
	bh=StiUni/jWip95WG0dKyw78yKczmVmfqt4TRV4Inq7Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jXj24qASnjUpRIczDa0JigJo+PnJNKHAS7fEJij4IthVj0gAApHftIVTrPXzVbqbJlsv8fIRumCb5Ugxd5AImSq/QlKFcgnJ+FNovLR0nJT+RST8oOKUQkmExHydksfHkUAbggi9urhPgc64jPFPmlFmeYXCHEFSqZMVBI+jnFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4UYYQKE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4UYYQKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732975724; x=1764511724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=StiUni/jWip95WG0dKyw78yKczmVmfqt4TRV4Inq7Vg=;
  b=A4UYYQKE1Rjzzv7bL/HEDcVyBW/jaiwLkP/ilHpp/pMGBdyCUn6PMSIn
   ccrtDpC2LlANtwMBZCJbXbo3EpV0oX57zTA9v+gfcWBRJPZ06gJvKX6yJ
   iPpQ4ZtKgDLAh0iAzaRxptrjYzRpo6yktzQJcfRAyJRowm0Djnww5W/6W
   YHocT2JyG5y3IpeB5F/618hi25zjzmaMq3F4YP50aKxxZ5AspSMBamxCN
   wwfhC8qSlPP5I91GowzJGRhpuwAtBFT0Sx4TbELdzV9Vo9b9I1s1S4bD7
   kHvVI5XXj7z0rk06Ayfn7sWhnPuUbTZfT+lhvRhdIWgf/56OF6T9V/zjk
   g==;
X-CSE-ConnectionGUID: a5AvlNiKSL+zNh0VDvttaA==
X-CSE-MsgGUID: NLyY4rNZSb6sx1RzF/Av/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="36848380"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="36848380"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 06:08:43 -0800
X-CSE-ConnectionGUID: R77sSVQXSLK6HLL35xEtYg==
X-CSE-MsgGUID: cmtLyVp1S4C9p/dRYpEthg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="93079462"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 30 Nov 2024 06:08:42 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHO8r-0000iX-0x;
	Sat, 30 Nov 2024 14:08:17 +0000
Date: Sat, 30 Nov 2024 22:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:perf/core 16/23] arch/x86/events/rapl.c:385
 rapl_pmu_event_init() warn: can 'rapl_pmus' even be NULL?
Message-ID: <202411302252.kUNWVTgj-lkp@intel.com>
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
TO: Dhananjay Ugwekar <Dhananjay.Ugwekar@amd.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: "Gautham R. Shenoy" <gautham.shenoy@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
head:   ba0be87f1aa7f9c86cdd1b86b99fb18d80246a59
commit: 72d3db217c3b0e202437e9e4f4218e6f9785e232 [16/23] perf/x86/rapl: Add core energy counter support for AMD CPUs
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-161-20241130 (https://download.01.org/0day-ci/archive/20241130/202411302252.kUNWVTgj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411302252.kUNWVTgj-lkp@intel.com/

smatch warnings:
arch/x86/events/rapl.c:385 rapl_pmu_event_init() warn: can 'rapl_pmus' even be NULL?

vim +/rapl_pmus +385 arch/x86/events/rapl.c

4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  364  
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  365  static int rapl_pmu_event_init(struct perf_event *event)
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  366  {
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  367  	u64 cfg = event->attr.config & RAPL_EVENT_MASK;
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  368  	int bit, rapl_pmus_scope, ret = 0;
84edcae7fa0ea4 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  369  	struct rapl_pmu *rapl_pmu;
dbcbe43b6c37d2 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  370  	unsigned int rapl_pmu_idx;
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  371  	struct rapl_pmus *rapl_pmus;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  372  
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  373  	/* unsupported modes and filters */
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  374  	if (event->attr.sample_period) /* no sampling */
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  375  		return -EINVAL;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  376  
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  377  	/* check only supported bits are set */
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  378  	if (event->attr.config & ~RAPL_EVENT_MASK)
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  379  		return -EINVAL;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  380  
8a6d2f8f73caa8 arch/x86/events/intel/rapl.c                Thomas Gleixner   2016-02-22  381  	if (event->cpu < 0)
8a6d2f8f73caa8 arch/x86/events/intel/rapl.c                Thomas Gleixner   2016-02-22  382  		return -EINVAL;
8a6d2f8f73caa8 arch/x86/events/intel/rapl.c                Thomas Gleixner   2016-02-22  383  
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  384  	rapl_pmus = container_of(event->pmu, struct rapl_pmus, pmu);
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15 @385  	if (!rapl_pmus)
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  386  		return -EINVAL;
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  387  	rapl_pmus_scope = rapl_pmus->pmu.scope;
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  388  
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  389  	if (rapl_pmus_scope == PERF_PMU_SCOPE_PKG || rapl_pmus_scope == PERF_PMU_SCOPE_DIE) {
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  390  		/* only look at RAPL package events */
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  391  		if (event->attr.type != rapl_pmus_pkg->pmu.type)
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  392  			return -ENOENT;
122f1c51b11a9e arch/x86/events/intel/rapl.c                Jiri Olsa         2019-06-16  393  
cd117efb268bbc arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  394  		cfg = array_index_nospec((long)cfg, NR_RAPL_PKG_DOMAINS + 1);
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  395  		if (!cfg || cfg >= NR_RAPL_PKG_DOMAINS + 1)
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  396  			return -EINVAL;
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  397  
122f1c51b11a9e arch/x86/events/intel/rapl.c                Jiri Olsa         2019-06-16  398  		bit = cfg - 1;
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  399  		event->hw.event_base = rapl_model->rapl_pkg_msrs[bit].msr;
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  400  	} else if (rapl_pmus_scope == PERF_PMU_SCOPE_CORE) {
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  401  		/* only look at RAPL core events */
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  402  		if (event->attr.type != rapl_pmus_core->pmu.type)
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  403  			return -ENOENT;
122f1c51b11a9e arch/x86/events/intel/rapl.c                Jiri Olsa         2019-06-16  404  
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  405  		cfg = array_index_nospec((long)cfg, NR_RAPL_CORE_DOMAINS + 1);
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  406  		if (!cfg || cfg >= NR_RAPL_PKG_DOMAINS + 1)
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  407  			return -EINVAL;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  408  
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  409  		bit = cfg - 1;
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  410  		event->hw.event_base = rapl_model->rapl_core_msrs[bit].msr;
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  411  	} else
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  412  		return -EINVAL;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  413  
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  414  	/* check event supported */
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  415  	if (!(rapl_pmus->cntr_mask & (1 << bit)))
dbcbe43b6c37d2 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  416  		return -EINVAL;
dbcbe43b6c37d2 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  417  
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  418  	rapl_pmu_idx = get_rapl_pmu_idx(event->cpu, rapl_pmus_scope);
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  419  	if (rapl_pmu_idx >= rapl_pmus->nr_rapl_pmu)
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  420  		return -EINVAL;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  421  	/* must be done before validate_group */
72d3db217c3b0e arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  422  	rapl_pmu = rapl_pmus->rapl_pmu[rapl_pmu_idx];
84edcae7fa0ea4 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  423  	if (!rapl_pmu)
dd86e373e09fb1 arch/x86/events/intel/rapl.c                Thomas Gleixner   2017-01-31  424  		return -EINVAL;
84edcae7fa0ea4 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  425  
84edcae7fa0ea4 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  426  	event->pmu_private = rapl_pmu;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  427  	event->hw.config = cfg;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  428  	event->hw.idx = bit;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  429  
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  430  	return ret;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  431  }
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  432  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
