Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A33946BF
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 00:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765843556; cv=none; b=tvj9EBRz6GU1+KEEjVaOLOkpgOLXsr3oVgWhLh5NPr3KrCyZIka3pOD9wR91lJcR/Utt2MgVAqJGvWP/HMukbNWceJu3TpvpWq1MnO9rtjVW8nBTzfC8XpklmBDKP38K03SBecDVEPVC+2JL9//38eOxt380cTyCytGbDwkC9Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765843556; c=relaxed/simple;
	bh=0fFw0qKfnb9Ans6CPaf7HB95CyoiVhFeMem+sSWjRMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZJFPcznGjE+oQq2ts4mhwqWD9LypVbxZicfTCVkV0YXzAvPnwSnTHfVvZDwRfLxjvSbu3S0Y5cxXA8RsIZWi1jxwqNScv5MHgYNbZuQNv+V3ugb/PWzsbko+ABAeuZrbrk57qKaDdhmyYZ1Ms9cDoJvv5XlTatDkVc2RUmUn3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhDkn+wA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhDkn+wA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765843554; x=1797379554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0fFw0qKfnb9Ans6CPaf7HB95CyoiVhFeMem+sSWjRMQ=;
  b=WhDkn+wArjYOJjlttfFKcrJFMcO/DJd4k3OZ7lLbHTs/+twdozpmDUKc
   MZa1XTzfHMpgdnoA12B2oajTDUNpbE47rAfKbP9arhJdLa0hLWtq4TzY6
   QEjhkM2RmN1D4h83JVLKkgYfkkP6fgBn0m3bqfy3GutAOD6Gs131XTVOh
   TYAoJO9yfR6wQsUD0xD/W0xiicKryxnzm9K2FRNwysx92KsyH2spx9mim
   y6rExYEichZoXdA8c00WkYBL7bCbEMnk8SZIQasD0UV70KmGf9eIC1XlI
   Q83ZMG5YOgI/bDP6Ug6tLFjicpVDHYziXrpPCcxd/xzLiO/9IBD+NreJ5
   A==;
X-CSE-ConnectionGUID: QDI1kdOPTUqAxTquQQOvhQ==
X-CSE-MsgGUID: HbuOog41QxymWCF8dgdQ/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67827128"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67827128"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 16:05:54 -0800
X-CSE-ConnectionGUID: uyTvNKVRR0+gacnznCSjhA==
X-CSE-MsgGUID: Ih/UabnARpO0GkbborHW2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197911451"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 15 Dec 2025 16:05:51 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVIZZ-000000000x1-2RXe;
	Tue, 16 Dec 2025 00:05:49 +0000
Date: Tue, 16 Dec 2025 08:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/events/rapl.c:385 rapl_pmu_event_init() warn: can
 'rapl_pmus' even be NULL?
Message-ID: <202512160722.i8NvZcQF-lkp@intel.com>
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
TO: Dhananjay Ugwekar <Dhananjay.Ugwekar@amd.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: "Gautham R. Shenoy" <gautham.shenoy@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: b4943b8bfc41ddd3796f3b87e1efa71a0c689f22 perf/x86/rapl: Add core energy counter support for AMD CPUs
date:   1 year ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20251214 (https://download.01.org/0day-ci/archive/20251216/202512160722.i8NvZcQF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160722.i8NvZcQF-lkp@intel.com/

smatch warnings:
arch/x86/events/rapl.c:385 rapl_pmu_event_init() warn: can 'rapl_pmus' even be NULL?

vim +/rapl_pmus +385 arch/x86/events/rapl.c

4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  364  
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  365  static int rapl_pmu_event_init(struct perf_event *event)
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  366  {
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  367  	u64 cfg = event->attr.config & RAPL_EVENT_MASK;
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  368  	int bit, rapl_pmus_scope, ret = 0;
8bf1c86e5ac828 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  369  	struct rapl_pmu *rapl_pmu;
1d5e2f637a94a8 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  370  	unsigned int rapl_pmu_idx;
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  371  	struct rapl_pmus *rapl_pmus;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  372  
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  373  	/* unsupported modes and filters */
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  374  	if (event->attr.sample_period) /* no sampling */
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  375  		return -EINVAL;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  376  
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  377  	/* check only supported bits are set */
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  378  	if (event->attr.config & ~RAPL_EVENT_MASK)
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  379  		return -EINVAL;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  380  
8a6d2f8f73caa8 arch/x86/events/intel/rapl.c                Thomas Gleixner   2016-02-22  381  	if (event->cpu < 0)
8a6d2f8f73caa8 arch/x86/events/intel/rapl.c                Thomas Gleixner   2016-02-22  382  		return -EINVAL;
8a6d2f8f73caa8 arch/x86/events/intel/rapl.c                Thomas Gleixner   2016-02-22  383  
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  384  	rapl_pmus = container_of(event->pmu, struct rapl_pmus, pmu);
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15 @385  	if (!rapl_pmus)
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  386  		return -EINVAL;
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  387  	rapl_pmus_scope = rapl_pmus->pmu.scope;
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  388  
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  389  	if (rapl_pmus_scope == PERF_PMU_SCOPE_PKG || rapl_pmus_scope == PERF_PMU_SCOPE_DIE) {
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  390  		/* only look at RAPL package events */
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  391  		if (event->attr.type != rapl_pmus_pkg->pmu.type)
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  392  			return -ENOENT;
122f1c51b11a9e arch/x86/events/intel/rapl.c                Jiri Olsa         2019-06-16  393  
abf03d9bd20cf5 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  394  		cfg = array_index_nospec((long)cfg, NR_RAPL_PKG_DOMAINS + 1);
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  395  		if (!cfg || cfg >= NR_RAPL_PKG_DOMAINS + 1)
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  396  			return -EINVAL;
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  397  
122f1c51b11a9e arch/x86/events/intel/rapl.c                Jiri Olsa         2019-06-16  398  		bit = cfg - 1;
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  399  		event->hw.event_base = rapl_model->rapl_pkg_msrs[bit].msr;
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  400  	} else if (rapl_pmus_scope == PERF_PMU_SCOPE_CORE) {
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  401  		/* only look at RAPL core events */
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  402  		if (event->attr.type != rapl_pmus_core->pmu.type)
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  403  			return -ENOENT;
122f1c51b11a9e arch/x86/events/intel/rapl.c                Jiri Olsa         2019-06-16  404  
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  405  		cfg = array_index_nospec((long)cfg, NR_RAPL_CORE_DOMAINS + 1);
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  406  		if (!cfg || cfg >= NR_RAPL_PKG_DOMAINS + 1)
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  407  			return -EINVAL;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  408  
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  409  		bit = cfg - 1;
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  410  		event->hw.event_base = rapl_model->rapl_core_msrs[bit].msr;
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  411  	} else
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  412  		return -EINVAL;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  413  
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  414  	/* check event supported */
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  415  	if (!(rapl_pmus->cntr_mask & (1 << bit)))
1d5e2f637a94a8 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  416  		return -EINVAL;
1d5e2f637a94a8 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  417  
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  418  	rapl_pmu_idx = get_rapl_pmu_idx(event->cpu, rapl_pmus_scope);
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  419  	if (rapl_pmu_idx >= rapl_pmus->nr_rapl_pmu)
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  420  		return -EINVAL;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  421  	/* must be done before validate_group */
b4943b8bfc41dd arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  422  	rapl_pmu = rapl_pmus->rapl_pmu[rapl_pmu_idx];
8bf1c86e5ac828 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  423  	if (!rapl_pmu)
dd86e373e09fb1 arch/x86/events/intel/rapl.c                Thomas Gleixner   2017-01-31  424  		return -EINVAL;
8bf1c86e5ac828 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  425  
8bf1c86e5ac828 arch/x86/events/rapl.c                      Dhananjay Ugwekar 2024-11-15  426  	event->pmu_private = rapl_pmu;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  427  	event->hw.config = cfg;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  428  	event->hw.idx = bit;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  429  
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  430  	return ret;
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  431  }
4788e5b4b2338f arch/x86/kernel/cpu/perf_event_intel_rapl.c Stephane Eranian  2013-11-12  432  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
