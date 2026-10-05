Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25E24A385A
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 14:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210584; cv=none; b=hr+9sphD/K6g6qs+xip4BDAd6ZG+JQsshc1/9JY0hwykTVFhi2uDIYHs3uaT5SQT7UeXIC0tvIs/l7l7QASbOKZVjR9en3LrL8l4v9CSl+o4ezzxh8JraXr2hVsYAf2K/MlFpN/qS7ATDV8agrn5V18sFS4thl1YK03iNZAC/Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210584; c=relaxed/simple;
	bh=+xvyL7s5Xh/Fz7KSyw0PNOKUkhR4CKs7ShKo5AJvl64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uIU9EH9s4lbSVMjrDfZ76nfSF82kmjp5jATRriwb85r11Tg4FoVXeA9uvrHNXETO/0an6u+RZ3dzsgJA6aJvO2rkyzBkkbvX5cEy7+rmal067JkAr5e+3T26twuHGZfPbjTepf3fVbeV7MH/kHIM7vP2MNQAETHivJiqpKGXRZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9IqQGPK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9IqQGPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791210581; x=1822746581;
  h=date:from:to:cc:subject:message-id;
  bh=+xvyL7s5Xh/Fz7KSyw0PNOKUkhR4CKs7ShKo5AJvl64=;
  b=H9IqQGPKYC2dOFSQRppJdQvp2BEyGznuJ7UrUN44+TGYmdMZfDlXWzJz
   vUXVOhiByTEktSo39odzt5TnOuL2tiiNZmOg5C5v34BHfs2zFZAn1z1MO
   Mga1Uy8K3e/N73HjMG3EmhOMPawLrMMrmzKUH2Aosr92CFvcsAakwDZsq
   iIrEWaXPME2flYG6QijFbglKM9mlmamvm0dogzGkOCsN2oQeL+h9FYtM1
   kyjnncTHjNTFt/H7jYsSPMNhcp9OqfPxE0kmEXSq08Wa1ze/FKmTaciuk
   sPkQtF5oqI1v94p6215lfTp57hKwCLMysqZdfJViPIe3PCsg0ZzRYYPgA
   A==;
X-CSE-ConnectionGUID: NGgHDeWxQfWiOhCHvWon9w==
X-CSE-MsgGUID: oW38O92YRDqVAYAPW4b63w==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="103251014"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="103251014"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 07:29:27 -0700
X-CSE-ConnectionGUID: N8c0d6EvRdGhjueaAPfx0A==
X-CSE-MsgGUID: +Jd4HRDQSHezISZUEH7eVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="913052"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 05 Oct 2026 07:29:26 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDjgy-0000000009Z-0Cyh;
	Mon, 05 Oct 2026 14:29:24 +0000
Date: Mon, 05 Oct 2026 16:29:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13574/14242] drivers/perf/cxl_pmu.c:1044
 cxl_pmu_probe() warn: right shifting more than type allows 64 vs 64
Message-ID: <202610051608.pBAgujgg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dave Jiang <dave.jiang@intel.com>
CC: Will Deacon <will@kernel.org>
CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
commit: 05d82cf377f706d0b566b572bc66e3a2057bd68e [13574/14242] perf/cxl: Clear stale overflow status before using a counter
:::::: branch date: 2 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-2200-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051608.pBAgujgg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610051608.pBAgujgg-lkp@intel.com/

smatch warnings:
drivers/perf/cxl_pmu.c:1044 cxl_pmu_probe() warn: right shifting more than type allows 64 vs 64

vim +1044 drivers/perf/cxl_pmu.c

5d7107c72796df3 Jonathan Cameron 2023-05-26   971  
5d7107c72796df3 Jonathan Cameron 2023-05-26   972  static int cxl_pmu_probe(struct device *dev)
5d7107c72796df3 Jonathan Cameron 2023-05-26   973  {
5d7107c72796df3 Jonathan Cameron 2023-05-26   974  	struct cxl_pmu *pmu = to_cxl_pmu(dev);
5d7107c72796df3 Jonathan Cameron 2023-05-26   975  	struct pci_dev *pdev = to_pci_dev(dev->parent);
5d7107c72796df3 Jonathan Cameron 2023-05-26   976  	struct cxl_pmu_info *info;
5d7107c72796df3 Jonathan Cameron 2023-05-26   977  	char *irq_name;
5d7107c72796df3 Jonathan Cameron 2023-05-26   978  	char *dev_name;
5d7107c72796df3 Jonathan Cameron 2023-05-26   979  	int rc, irq;
5d7107c72796df3 Jonathan Cameron 2023-05-26   980  
5d7107c72796df3 Jonathan Cameron 2023-05-26   981  	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
5d7107c72796df3 Jonathan Cameron 2023-05-26   982  	if (!info)
5d7107c72796df3 Jonathan Cameron 2023-05-26   983  		return -ENOMEM;
5d7107c72796df3 Jonathan Cameron 2023-05-26   984  
5d7107c72796df3 Jonathan Cameron 2023-05-26   985  	dev_set_drvdata(dev, info);
5d7107c72796df3 Jonathan Cameron 2023-05-26   986  	INIT_LIST_HEAD(&info->event_caps_fixed);
5d7107c72796df3 Jonathan Cameron 2023-05-26   987  	INIT_LIST_HEAD(&info->event_caps_configurable);
5d7107c72796df3 Jonathan Cameron 2023-05-26   988  
5d7107c72796df3 Jonathan Cameron 2023-05-26   989  	info->base = pmu->base;
5d7107c72796df3 Jonathan Cameron 2023-05-26   990  
5d7107c72796df3 Jonathan Cameron 2023-05-26   991  	info->on_cpu = -1;
5d7107c72796df3 Jonathan Cameron 2023-05-26   992  	rc = cxl_pmu_parse_caps(dev, info);
5d7107c72796df3 Jonathan Cameron 2023-05-26   993  	if (rc)
5d7107c72796df3 Jonathan Cameron 2023-05-26   994  		return rc;
5d7107c72796df3 Jonathan Cameron 2023-05-26   995  
6ae58c74e7aa9aa Alok Tiwari      2025-06-24   996  	info->hw_events = devm_kcalloc(dev, info->num_counters,
6ae58c74e7aa9aa Alok Tiwari      2025-06-24   997  				       sizeof(*info->hw_events), GFP_KERNEL);
5d7107c72796df3 Jonathan Cameron 2023-05-26   998  	if (!info->hw_events)
5d7107c72796df3 Jonathan Cameron 2023-05-26   999  		return -ENOMEM;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1000  
5d7107c72796df3 Jonathan Cameron 2023-05-26  1001  	switch (pmu->type) {
5d7107c72796df3 Jonathan Cameron 2023-05-26  1002  	case CXL_PMU_MEMDEV:
5d7107c72796df3 Jonathan Cameron 2023-05-26  1003  		dev_name = devm_kasprintf(dev, GFP_KERNEL, "cxl_pmu_mem%d.%d",
5d7107c72796df3 Jonathan Cameron 2023-05-26  1004  					  pmu->assoc_id, pmu->index);
5d7107c72796df3 Jonathan Cameron 2023-05-26  1005  		break;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1006  	}
5d7107c72796df3 Jonathan Cameron 2023-05-26  1007  	if (!dev_name)
5d7107c72796df3 Jonathan Cameron 2023-05-26  1008  		return -ENOMEM;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1009  
5d7107c72796df3 Jonathan Cameron 2023-05-26  1010  	info->pmu = (struct pmu) {
5d7107c72796df3 Jonathan Cameron 2023-05-26  1011  		.name = dev_name,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1012  		.parent = dev,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1013  		.module = THIS_MODULE,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1014  		.event_init = cxl_pmu_event_init,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1015  		.pmu_enable = cxl_pmu_enable,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1016  		.pmu_disable = cxl_pmu_disable,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1017  		.add = cxl_pmu_event_add,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1018  		.del = cxl_pmu_event_del,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1019  		.start = cxl_pmu_event_start,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1020  		.stop = cxl_pmu_event_stop,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1021  		.read = cxl_pmu_read,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1022  		.task_ctx_nr = perf_invalid_context,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1023  		.attr_groups = cxl_pmu_attr_groups,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1024  		.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1025  	};
5d7107c72796df3 Jonathan Cameron 2023-05-26  1026  
97fe5d94b7cebff Dave Jiang       2026-08-05  1027  	if (info->msi_vec < 0)
5d7107c72796df3 Jonathan Cameron 2023-05-26  1028  		return -EINVAL;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1029  
97fe5d94b7cebff Dave Jiang       2026-08-05  1030  	rc = pci_irq_vector(pdev, info->msi_vec);
5d7107c72796df3 Jonathan Cameron 2023-05-26  1031  	if (rc < 0)
5d7107c72796df3 Jonathan Cameron 2023-05-26  1032  		return rc;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1033  	irq = rc;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1034  
3e870815ccf5bc7 Alok Tiwari      2025-06-24  1035  	irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s_overflow", dev_name);
5d7107c72796df3 Jonathan Cameron 2023-05-26  1036  	if (!irq_name)
5d7107c72796df3 Jonathan Cameron 2023-05-26  1037  		return -ENOMEM;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1038  
05d82cf377f706d Dave Jiang       2026-08-05  1039  	/*
05d82cf377f706d Dave Jiang       2026-08-05  1040  	 * Same for counters no event owns yet: clear whatever firmware or a
05d82cf377f706d Dave Jiang       2026-08-05  1041  	 * previous kernel left set before the handler goes live. Bits above the
05d82cf377f706d Dave Jiang       2026-08-05  1042  	 * implemented counters are reserved, so only write those.
05d82cf377f706d Dave Jiang       2026-08-05  1043  	 */
05d82cf377f706d Dave Jiang       2026-08-05 @1044  	writeq(GENMASK_ULL(info->num_counters - 1, 0),
05d82cf377f706d Dave Jiang       2026-08-05  1045  	       info->base + CXL_PMU_OVERFLOW_REG);
05d82cf377f706d Dave Jiang       2026-08-05  1046  
b899fd3487b0d40 Dave Jiang       2026-08-05  1047  	/*
b899fd3487b0d40 Dave Jiang       2026-08-05  1048  	 * The handler must run on info->on_cpu, so the interrupt cannot be
b899fd3487b0d40 Dave Jiang       2026-08-05  1049  	 * shared - IRQF_NOBALANCING is only honoured for the first action on a
b899fd3487b0d40 Dave Jiang       2026-08-05  1050  	 * line, and a co-owner would keep taking the interrupt wherever its own
b899fd3487b0d40 Dave Jiang       2026-08-05  1051  	 * affinity points.
b899fd3487b0d40 Dave Jiang       2026-08-05  1052  	 */
b899fd3487b0d40 Dave Jiang       2026-08-05  1053  	rc = devm_request_irq(dev, irq, cxl_pmu_irq,
b899fd3487b0d40 Dave Jiang       2026-08-05  1054  			      IRQF_NO_THREAD | IRQF_NOBALANCING,
5d7107c72796df3 Jonathan Cameron 2023-05-26  1055  			      irq_name, info);
5d7107c72796df3 Jonathan Cameron 2023-05-26  1056  	if (rc)
5d7107c72796df3 Jonathan Cameron 2023-05-26  1057  		return rc;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1058  	info->irq = irq;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1059  
5d7107c72796df3 Jonathan Cameron 2023-05-26  1060  	rc = cpuhp_state_add_instance(cxl_pmu_cpuhp_state_num, &info->node);
5d7107c72796df3 Jonathan Cameron 2023-05-26  1061  	if (rc)
5d7107c72796df3 Jonathan Cameron 2023-05-26  1062  		return rc;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1063  
5d7107c72796df3 Jonathan Cameron 2023-05-26  1064  	rc = devm_add_action_or_reset(dev, cxl_pmu_cpuhp_remove, info);
5d7107c72796df3 Jonathan Cameron 2023-05-26  1065  	if (rc)
5d7107c72796df3 Jonathan Cameron 2023-05-26  1066  		return rc;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1067  
5d7107c72796df3 Jonathan Cameron 2023-05-26  1068  	rc = perf_pmu_register(&info->pmu, info->pmu.name, -1);
5d7107c72796df3 Jonathan Cameron 2023-05-26  1069  	if (rc)
5d7107c72796df3 Jonathan Cameron 2023-05-26  1070  		return rc;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1071  
5d7107c72796df3 Jonathan Cameron 2023-05-26  1072  	rc = devm_add_action_or_reset(dev, cxl_pmu_perf_unregister, info);
5d7107c72796df3 Jonathan Cameron 2023-05-26  1073  	if (rc)
5d7107c72796df3 Jonathan Cameron 2023-05-26  1074  		return rc;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1075  
5d7107c72796df3 Jonathan Cameron 2023-05-26  1076  	return 0;
5d7107c72796df3 Jonathan Cameron 2023-05-26  1077  }
5d7107c72796df3 Jonathan Cameron 2023-05-26  1078  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
