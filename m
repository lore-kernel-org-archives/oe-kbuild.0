Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B633065F
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Nov 2023 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVfU/0pM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840550; x=1732376550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ldEdOXwn3SBfa5L55F5TknfYPSUwHN3ExcG6vJXweNY=;
  b=EVfU/0pMfJaRXXIwwfdN2pNoRv1NJRINR0HYlxuwlswMMSoB1wfkCa13
   6oFtDhmMQ7lOBfu22rzWs651IFGSrT5Q4G8eM7SSsLKRebV8Ub9EhWrpE
   SBR3v3VAiTpdsUwAzQNUlfpKB/OQxO3uyzFdDzYzy0xpnEqx0JfpqH/OO
   2TpWCG0DNrQvGiPSYr6t2uCYSDqT7rH+UJjUPJLnYXNuhZB/6yZn9qQca
   rCyqii7SpjZAGlfYB9RDTo15y7CAlnE2zZQBgudFo2ZQo0MdIj8Mx8Q72
   wUNp1IoRy36G/4j17waG20kTK425jb/p/Cu/M/6yWJAFOzf4DLxxHjlzL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="423577213"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="423577213"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911474561"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="911474561"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 07:42:24 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YJy-0002yQ-0N;
	Fri, 24 Nov 2023 15:42:22 +0000
Date: Fri, 24 Nov 2023 23:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v11 4/5] drivers/perf: add DesignWare PCIe PMU driver
Message-ID: <202311241906.0ymlLjyo-lkp@intel.com>
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
In-Reply-To: <20231121013400.18367-5-xueshuai@linux.alibaba.com>
References: <20231121013400.18367-5-xueshuai@linux.alibaba.com>
TO: Shuai Xue <xueshuai@linux.alibaba.com>
TO: ilkka@os.amperecomputing.com
TO: kaishen@linux.alibaba.com
TO: helgaas@kernel.org
TO: yangyicong@huawei.com
TO: will@kernel.org
TO: Jonathan.Cameron@huawei.com
TO: baolin.wang@linux.alibaba.com
TO: robin.murphy@arm.com
CC: chengyou@linux.alibaba.com
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-pci@vger.kernel.org
CC: rdunlap@infradead.org
CC: mark.rutland@arm.com
CC: zhuo.song@linux.alibaba.com
CC: xueshuai@linux.alibaba.com
CC: renyu.zj@linux.alibaba.com

Hi Shuai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.7-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Xue/docs-perf-Add-description-for-Synopsys-DesignWare-PCIe-PMU-driver/20231121-093713
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20231121013400.18367-5-xueshuai%40linux.alibaba.com
patch subject: [PATCH v11 4/5] drivers/perf: add DesignWare PCIe PMU driver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-r071-20231123 (https://download.01.org/0day-ci/archive/20231124/202311241906.0ymlLjyo-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311241906.0ymlLjyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311241906.0ymlLjyo-lkp@intel.com/

smatch warnings:
drivers/perf/dwc_pcie_pmu.c:352 dwc_pcie_pmu_event_update() error: uninitialized symbol 'now'.
drivers/perf/dwc_pcie_pmu.c:536 dwc_pcie_match_des_cap() error: uninitialized symbol 'vsec'.

vim +/now +352 drivers/perf/dwc_pcie_pmu.c

3481798a4ec51d1 Shuai Xue 2023-11-21  337  
3481798a4ec51d1 Shuai Xue 2023-11-21  338  static void dwc_pcie_pmu_event_update(struct perf_event *event)
3481798a4ec51d1 Shuai Xue 2023-11-21  339  {
3481798a4ec51d1 Shuai Xue 2023-11-21  340  	struct hw_perf_event *hwc = &event->hw;
3481798a4ec51d1 Shuai Xue 2023-11-21  341  	enum dwc_pcie_event_type type = DWC_PCIE_EVENT_TYPE(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  342  	u64 delta, prev, now;
3481798a4ec51d1 Shuai Xue 2023-11-21  343  
3481798a4ec51d1 Shuai Xue 2023-11-21  344  	do {
3481798a4ec51d1 Shuai Xue 2023-11-21  345  		prev = local64_read(&hwc->prev_count);
3481798a4ec51d1 Shuai Xue 2023-11-21  346  
3481798a4ec51d1 Shuai Xue 2023-11-21  347  		if (type == DWC_PCIE_LANE_EVENT)
3481798a4ec51d1 Shuai Xue 2023-11-21  348  			now = dwc_pcie_pmu_read_lane_event_counter(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  349  		else if (type == DWC_PCIE_TIME_BASE_EVENT)
3481798a4ec51d1 Shuai Xue 2023-11-21  350  			now = dwc_pcie_pmu_read_time_based_counter(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  351  
3481798a4ec51d1 Shuai Xue 2023-11-21 @352  	} while (local64_cmpxchg(&hwc->prev_count, prev, now) != prev);
3481798a4ec51d1 Shuai Xue 2023-11-21  353  
3481798a4ec51d1 Shuai Xue 2023-11-21  354  	delta = (now - prev) & DWC_PCIE_MAX_PERIOD;
3481798a4ec51d1 Shuai Xue 2023-11-21  355  	/* 32-bit counter for Lane Event Counting */
3481798a4ec51d1 Shuai Xue 2023-11-21  356  	if (type == DWC_PCIE_LANE_EVENT)
3481798a4ec51d1 Shuai Xue 2023-11-21  357  		delta &= DWC_PCIE_LANE_EVENT_MAX_PERIOD;
3481798a4ec51d1 Shuai Xue 2023-11-21  358  
3481798a4ec51d1 Shuai Xue 2023-11-21  359  	local64_add(delta, &event->count);
3481798a4ec51d1 Shuai Xue 2023-11-21  360  }
3481798a4ec51d1 Shuai Xue 2023-11-21  361  
3481798a4ec51d1 Shuai Xue 2023-11-21  362  static int dwc_pcie_pmu_event_init(struct perf_event *event)
3481798a4ec51d1 Shuai Xue 2023-11-21  363  {
3481798a4ec51d1 Shuai Xue 2023-11-21  364  	struct dwc_pcie_pmu *pcie_pmu = to_dwc_pcie_pmu(event->pmu);
3481798a4ec51d1 Shuai Xue 2023-11-21  365  	enum dwc_pcie_event_type type = DWC_PCIE_EVENT_TYPE(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  366  	struct perf_event *sibling;
3481798a4ec51d1 Shuai Xue 2023-11-21  367  	u32 lane;
3481798a4ec51d1 Shuai Xue 2023-11-21  368  
3481798a4ec51d1 Shuai Xue 2023-11-21  369  	if (event->attr.type != event->pmu->type)
3481798a4ec51d1 Shuai Xue 2023-11-21  370  		return -ENOENT;
3481798a4ec51d1 Shuai Xue 2023-11-21  371  
3481798a4ec51d1 Shuai Xue 2023-11-21  372  	/* We don't support sampling */
3481798a4ec51d1 Shuai Xue 2023-11-21  373  	if (is_sampling_event(event))
3481798a4ec51d1 Shuai Xue 2023-11-21  374  		return -EINVAL;
3481798a4ec51d1 Shuai Xue 2023-11-21  375  
3481798a4ec51d1 Shuai Xue 2023-11-21  376  	/* We cannot support task bound events */
3481798a4ec51d1 Shuai Xue 2023-11-21  377  	if (event->cpu < 0 || event->attach_state & PERF_ATTACH_TASK)
3481798a4ec51d1 Shuai Xue 2023-11-21  378  		return -EINVAL;
3481798a4ec51d1 Shuai Xue 2023-11-21  379  
3481798a4ec51d1 Shuai Xue 2023-11-21  380  	if (event->group_leader != event &&
3481798a4ec51d1 Shuai Xue 2023-11-21  381  	    !is_software_event(event->group_leader))
3481798a4ec51d1 Shuai Xue 2023-11-21  382  		return -EINVAL;
3481798a4ec51d1 Shuai Xue 2023-11-21  383  
3481798a4ec51d1 Shuai Xue 2023-11-21  384  	for_each_sibling_event(sibling, event->group_leader) {
3481798a4ec51d1 Shuai Xue 2023-11-21  385  		if (sibling->pmu != event->pmu && !is_software_event(sibling))
3481798a4ec51d1 Shuai Xue 2023-11-21  386  			return -EINVAL;
3481798a4ec51d1 Shuai Xue 2023-11-21  387  	}
3481798a4ec51d1 Shuai Xue 2023-11-21  388  
3481798a4ec51d1 Shuai Xue 2023-11-21  389  	if (type < 0 || type >= DWC_PCIE_EVENT_TYPE_MAX)
3481798a4ec51d1 Shuai Xue 2023-11-21  390  		return -EINVAL;
3481798a4ec51d1 Shuai Xue 2023-11-21  391  
3481798a4ec51d1 Shuai Xue 2023-11-21  392  	if (type == DWC_PCIE_LANE_EVENT) {
3481798a4ec51d1 Shuai Xue 2023-11-21  393  		lane = DWC_PCIE_EVENT_LANE(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  394  		if (lane < 0 || lane >= pcie_pmu->nr_lanes)
3481798a4ec51d1 Shuai Xue 2023-11-21  395  			return -EINVAL;
3481798a4ec51d1 Shuai Xue 2023-11-21  396  	}
3481798a4ec51d1 Shuai Xue 2023-11-21  397  
3481798a4ec51d1 Shuai Xue 2023-11-21  398  	event->cpu = pcie_pmu->on_cpu;
3481798a4ec51d1 Shuai Xue 2023-11-21  399  
3481798a4ec51d1 Shuai Xue 2023-11-21  400  	return 0;
3481798a4ec51d1 Shuai Xue 2023-11-21  401  }
3481798a4ec51d1 Shuai Xue 2023-11-21  402  
3481798a4ec51d1 Shuai Xue 2023-11-21  403  static void dwc_pcie_pmu_event_start(struct perf_event *event, int flags)
3481798a4ec51d1 Shuai Xue 2023-11-21  404  {
3481798a4ec51d1 Shuai Xue 2023-11-21  405  	struct hw_perf_event *hwc = &event->hw;
3481798a4ec51d1 Shuai Xue 2023-11-21  406  	struct dwc_pcie_pmu *pcie_pmu = to_dwc_pcie_pmu(event->pmu);
3481798a4ec51d1 Shuai Xue 2023-11-21  407  	enum dwc_pcie_event_type type = DWC_PCIE_EVENT_TYPE(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  408  
3481798a4ec51d1 Shuai Xue 2023-11-21  409  	hwc->state = 0;
3481798a4ec51d1 Shuai Xue 2023-11-21  410  	local64_set(&hwc->prev_count, 0);
3481798a4ec51d1 Shuai Xue 2023-11-21  411  
3481798a4ec51d1 Shuai Xue 2023-11-21  412  	if (type == DWC_PCIE_LANE_EVENT)
3481798a4ec51d1 Shuai Xue 2023-11-21  413  		dwc_pcie_pmu_lane_event_enable(pcie_pmu, true);
3481798a4ec51d1 Shuai Xue 2023-11-21  414  	else if (type == DWC_PCIE_TIME_BASE_EVENT)
3481798a4ec51d1 Shuai Xue 2023-11-21  415  		dwc_pcie_pmu_time_based_event_enable(pcie_pmu, true);
3481798a4ec51d1 Shuai Xue 2023-11-21  416  }
3481798a4ec51d1 Shuai Xue 2023-11-21  417  
3481798a4ec51d1 Shuai Xue 2023-11-21  418  static void dwc_pcie_pmu_event_stop(struct perf_event *event, int flags)
3481798a4ec51d1 Shuai Xue 2023-11-21  419  {
3481798a4ec51d1 Shuai Xue 2023-11-21  420  	struct dwc_pcie_pmu *pcie_pmu = to_dwc_pcie_pmu(event->pmu);
3481798a4ec51d1 Shuai Xue 2023-11-21  421  	enum dwc_pcie_event_type type = DWC_PCIE_EVENT_TYPE(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  422  	struct hw_perf_event *hwc = &event->hw;
3481798a4ec51d1 Shuai Xue 2023-11-21  423  
3481798a4ec51d1 Shuai Xue 2023-11-21  424  	if (event->hw.state & PERF_HES_STOPPED)
3481798a4ec51d1 Shuai Xue 2023-11-21  425  		return;
3481798a4ec51d1 Shuai Xue 2023-11-21  426  
3481798a4ec51d1 Shuai Xue 2023-11-21  427  	if (type == DWC_PCIE_LANE_EVENT)
3481798a4ec51d1 Shuai Xue 2023-11-21  428  		dwc_pcie_pmu_lane_event_enable(pcie_pmu, false);
3481798a4ec51d1 Shuai Xue 2023-11-21  429  	else if (type == DWC_PCIE_TIME_BASE_EVENT)
3481798a4ec51d1 Shuai Xue 2023-11-21  430  		dwc_pcie_pmu_time_based_event_enable(pcie_pmu, false);
3481798a4ec51d1 Shuai Xue 2023-11-21  431  
3481798a4ec51d1 Shuai Xue 2023-11-21  432  	dwc_pcie_pmu_event_update(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  433  	hwc->state |= PERF_HES_STOPPED | PERF_HES_UPTODATE;
3481798a4ec51d1 Shuai Xue 2023-11-21  434  }
3481798a4ec51d1 Shuai Xue 2023-11-21  435  
3481798a4ec51d1 Shuai Xue 2023-11-21  436  static int dwc_pcie_pmu_event_add(struct perf_event *event, int flags)
3481798a4ec51d1 Shuai Xue 2023-11-21  437  {
3481798a4ec51d1 Shuai Xue 2023-11-21  438  	struct dwc_pcie_pmu *pcie_pmu = to_dwc_pcie_pmu(event->pmu);
3481798a4ec51d1 Shuai Xue 2023-11-21  439  	struct pci_dev *pdev = pcie_pmu->pdev;
3481798a4ec51d1 Shuai Xue 2023-11-21  440  	struct hw_perf_event *hwc = &event->hw;
3481798a4ec51d1 Shuai Xue 2023-11-21  441  	enum dwc_pcie_event_type type = DWC_PCIE_EVENT_TYPE(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  442  	int event_id = DWC_PCIE_EVENT_ID(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  443  	int lane = DWC_PCIE_EVENT_LANE(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  444  	u16 ras_des_offset = pcie_pmu->ras_des_offset;
3481798a4ec51d1 Shuai Xue 2023-11-21  445  	u32 ctrl;
3481798a4ec51d1 Shuai Xue 2023-11-21  446  
3481798a4ec51d1 Shuai Xue 2023-11-21  447  	/* one counter for each type and it is in use */
3481798a4ec51d1 Shuai Xue 2023-11-21  448  	if (pcie_pmu->event[type])
3481798a4ec51d1 Shuai Xue 2023-11-21  449  		return -ENOSPC;
3481798a4ec51d1 Shuai Xue 2023-11-21  450  
3481798a4ec51d1 Shuai Xue 2023-11-21  451  	pcie_pmu->event[type] = event;
3481798a4ec51d1 Shuai Xue 2023-11-21  452  	hwc->state = PERF_HES_STOPPED | PERF_HES_UPTODATE;
3481798a4ec51d1 Shuai Xue 2023-11-21  453  
3481798a4ec51d1 Shuai Xue 2023-11-21  454  	if (type == DWC_PCIE_LANE_EVENT) {
3481798a4ec51d1 Shuai Xue 2023-11-21  455  		/* EVENT_COUNTER_DATA_REG needs clear manually */
3481798a4ec51d1 Shuai Xue 2023-11-21  456  		ctrl = FIELD_PREP(DWC_PCIE_CNT_EVENT_SEL, event_id) |
3481798a4ec51d1 Shuai Xue 2023-11-21  457  			FIELD_PREP(DWC_PCIE_CNT_LANE_SEL, lane) |
3481798a4ec51d1 Shuai Xue 2023-11-21  458  			FIELD_PREP(DWC_PCIE_CNT_ENABLE, DWC_PCIE_PER_EVENT_OFF) |
3481798a4ec51d1 Shuai Xue 2023-11-21  459  			FIELD_PREP(DWC_PCIE_EVENT_CLEAR, DWC_PCIE_EVENT_PER_CLEAR);
3481798a4ec51d1 Shuai Xue 2023-11-21  460  		pci_write_config_dword(pdev, ras_des_offset + DWC_PCIE_EVENT_CNT_CTL,
3481798a4ec51d1 Shuai Xue 2023-11-21  461  				       ctrl);
3481798a4ec51d1 Shuai Xue 2023-11-21  462  	} else if (type == DWC_PCIE_TIME_BASE_EVENT) {
3481798a4ec51d1 Shuai Xue 2023-11-21  463  		/*
3481798a4ec51d1 Shuai Xue 2023-11-21  464  		 * TIME_BASED_ANAL_DATA_REG is a 64 bit register, we can safely
3481798a4ec51d1 Shuai Xue 2023-11-21  465  		 * use it with any manually controlled duration. And it is
3481798a4ec51d1 Shuai Xue 2023-11-21  466  		 * cleared when next measurement starts.
3481798a4ec51d1 Shuai Xue 2023-11-21  467  		 */
3481798a4ec51d1 Shuai Xue 2023-11-21  468  		ctrl = FIELD_PREP(DWC_PCIE_TIME_BASED_REPORT_SEL, event_id) |
3481798a4ec51d1 Shuai Xue 2023-11-21  469  			FIELD_PREP(DWC_PCIE_TIME_BASED_DURATION_SEL,
3481798a4ec51d1 Shuai Xue 2023-11-21  470  				   DWC_PCIE_DURATION_MANUAL_CTL) |
3481798a4ec51d1 Shuai Xue 2023-11-21  471  			DWC_PCIE_TIME_BASED_CNT_ENABLE;
3481798a4ec51d1 Shuai Xue 2023-11-21  472  		pci_write_config_dword(
3481798a4ec51d1 Shuai Xue 2023-11-21  473  			pdev, ras_des_offset + DWC_PCIE_TIME_BASED_ANAL_CTL, ctrl);
3481798a4ec51d1 Shuai Xue 2023-11-21  474  	}
3481798a4ec51d1 Shuai Xue 2023-11-21  475  
3481798a4ec51d1 Shuai Xue 2023-11-21  476  	if (flags & PERF_EF_START)
3481798a4ec51d1 Shuai Xue 2023-11-21  477  		dwc_pcie_pmu_event_start(event, PERF_EF_RELOAD);
3481798a4ec51d1 Shuai Xue 2023-11-21  478  
3481798a4ec51d1 Shuai Xue 2023-11-21  479  	perf_event_update_userpage(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  480  
3481798a4ec51d1 Shuai Xue 2023-11-21  481  	return 0;
3481798a4ec51d1 Shuai Xue 2023-11-21  482  }
3481798a4ec51d1 Shuai Xue 2023-11-21  483  
3481798a4ec51d1 Shuai Xue 2023-11-21  484  static void dwc_pcie_pmu_event_del(struct perf_event *event, int flags)
3481798a4ec51d1 Shuai Xue 2023-11-21  485  {
3481798a4ec51d1 Shuai Xue 2023-11-21  486  	struct dwc_pcie_pmu *pcie_pmu = to_dwc_pcie_pmu(event->pmu);
3481798a4ec51d1 Shuai Xue 2023-11-21  487  	enum dwc_pcie_event_type type = DWC_PCIE_EVENT_TYPE(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  488  
3481798a4ec51d1 Shuai Xue 2023-11-21  489  	dwc_pcie_pmu_event_stop(event, flags | PERF_EF_UPDATE);
3481798a4ec51d1 Shuai Xue 2023-11-21  490  	perf_event_update_userpage(event);
3481798a4ec51d1 Shuai Xue 2023-11-21  491  	pcie_pmu->event[type] = NULL;
3481798a4ec51d1 Shuai Xue 2023-11-21  492  }
3481798a4ec51d1 Shuai Xue 2023-11-21  493  
3481798a4ec51d1 Shuai Xue 2023-11-21  494  static void dwc_pcie_pmu_remove_cpuhp_instance(void *hotplug_node)
3481798a4ec51d1 Shuai Xue 2023-11-21  495  {
3481798a4ec51d1 Shuai Xue 2023-11-21  496  	cpuhp_state_remove_instance_nocalls(dwc_pcie_pmu_hp_state, hotplug_node);
3481798a4ec51d1 Shuai Xue 2023-11-21  497  }
3481798a4ec51d1 Shuai Xue 2023-11-21  498  
3481798a4ec51d1 Shuai Xue 2023-11-21  499  /*
3481798a4ec51d1 Shuai Xue 2023-11-21  500   * Find the binded DES capability device info of a PCI device.
3481798a4ec51d1 Shuai Xue 2023-11-21  501   * @pdev: The PCI device.
3481798a4ec51d1 Shuai Xue 2023-11-21  502   */
3481798a4ec51d1 Shuai Xue 2023-11-21  503  static struct dwc_pcie_dev_info *dwc_pcie_find_dev_info(struct pci_dev *pdev)
3481798a4ec51d1 Shuai Xue 2023-11-21  504  {
3481798a4ec51d1 Shuai Xue 2023-11-21  505  	struct dwc_pcie_dev_info *dev_info;
3481798a4ec51d1 Shuai Xue 2023-11-21  506  
3481798a4ec51d1 Shuai Xue 2023-11-21  507  	list_for_each_entry(dev_info, &dwc_pcie_dev_info_head, dev_node)
3481798a4ec51d1 Shuai Xue 2023-11-21  508  		if (dev_info->pdev == pdev)
3481798a4ec51d1 Shuai Xue 2023-11-21  509  			return dev_info;
3481798a4ec51d1 Shuai Xue 2023-11-21  510  
3481798a4ec51d1 Shuai Xue 2023-11-21  511  	return NULL;
3481798a4ec51d1 Shuai Xue 2023-11-21  512  }
3481798a4ec51d1 Shuai Xue 2023-11-21  513  
3481798a4ec51d1 Shuai Xue 2023-11-21  514  static void dwc_pcie_unregister_pmu(void *data)
3481798a4ec51d1 Shuai Xue 2023-11-21  515  {
3481798a4ec51d1 Shuai Xue 2023-11-21  516  	struct dwc_pcie_pmu *pcie_pmu = data;
3481798a4ec51d1 Shuai Xue 2023-11-21  517  
3481798a4ec51d1 Shuai Xue 2023-11-21  518  	perf_pmu_unregister(&pcie_pmu->pmu);
3481798a4ec51d1 Shuai Xue 2023-11-21  519  }
3481798a4ec51d1 Shuai Xue 2023-11-21  520  
3481798a4ec51d1 Shuai Xue 2023-11-21  521  static bool dwc_pcie_match_des_cap(struct pci_dev *pdev)
3481798a4ec51d1 Shuai Xue 2023-11-21  522  {
3481798a4ec51d1 Shuai Xue 2023-11-21  523  	const struct dwc_pcie_vendor_id *vid;
3481798a4ec51d1 Shuai Xue 2023-11-21  524  	u16 vsec;
3481798a4ec51d1 Shuai Xue 2023-11-21  525  	u32 val;
3481798a4ec51d1 Shuai Xue 2023-11-21  526  
3481798a4ec51d1 Shuai Xue 2023-11-21  527  	if (!pci_is_pcie(pdev) || !(pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT))
3481798a4ec51d1 Shuai Xue 2023-11-21  528  		return false;
3481798a4ec51d1 Shuai Xue 2023-11-21  529  
3481798a4ec51d1 Shuai Xue 2023-11-21  530  	for (vid = dwc_pcie_vendor_ids; vid->vendor_id; vid++) {
3481798a4ec51d1 Shuai Xue 2023-11-21  531  		vsec = pci_find_vsec_capability(pdev, vid->vendor_id,
3481798a4ec51d1 Shuai Xue 2023-11-21  532  						DWC_PCIE_VSEC_RAS_DES_ID);
3481798a4ec51d1 Shuai Xue 2023-11-21  533  		if (vsec)
3481798a4ec51d1 Shuai Xue 2023-11-21  534  			break;
3481798a4ec51d1 Shuai Xue 2023-11-21  535  	}
3481798a4ec51d1 Shuai Xue 2023-11-21 @536  	if (!vsec)
3481798a4ec51d1 Shuai Xue 2023-11-21  537  		return false;
3481798a4ec51d1 Shuai Xue 2023-11-21  538  
3481798a4ec51d1 Shuai Xue 2023-11-21  539  	pci_read_config_dword(pdev, vsec + PCI_VNDR_HEADER, &val);
3481798a4ec51d1 Shuai Xue 2023-11-21  540  	if (PCI_VNDR_HEADER_REV(val) != 0x04)
3481798a4ec51d1 Shuai Xue 2023-11-21  541  		return false;
3481798a4ec51d1 Shuai Xue 2023-11-21  542  
3481798a4ec51d1 Shuai Xue 2023-11-21  543  	pci_dbg(pdev,
3481798a4ec51d1 Shuai Xue 2023-11-21  544  		"Detected PCIe Vendor-Specific Extended Capability RAS DES\n");
3481798a4ec51d1 Shuai Xue 2023-11-21  545  	return true;
3481798a4ec51d1 Shuai Xue 2023-11-21  546  }
3481798a4ec51d1 Shuai Xue 2023-11-21  547  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
