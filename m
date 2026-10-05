Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C642E2DDD
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791236537; cv=none; b=McEsfUuU/fEsfSwrtVkxLOGKW6HQ1ecu62FwtDCbM9uq+c2Eb+vu8QoE3Et9CC8OUZXhLZw2Go5dU7iQ0gQyIKQ1B6oYKeXr3HGeiqLdk7gCblf6ffHsODTim1Fy20HDbtyt9C+E/QWAWIeWkK0CxVplhqwxn6HWXTDglD+O8yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791236537; c=relaxed/simple;
	bh=czoqsB3VgRhsFReiADXuSqtj9vxThbkjina4RFjrd3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ArWeiZ0M5teLiCf+qLp946btD/oKGm0CqqxzImP2JkvqbrAb4dNlFhUeuddJ+aovueY289wHEQorudHYfWUt9P/xRkZhUhW3lHs1I56woUbsYusOuVCFjDU+SFYXcDb/iqC9L4U7U0a7W7WK4nomuzcT9bhZ/+cdQWREzxWO4i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MblWJTgX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MblWJTgX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791236535; x=1822772535;
  h=date:from:to:cc:subject:message-id;
  bh=czoqsB3VgRhsFReiADXuSqtj9vxThbkjina4RFjrd3U=;
  b=MblWJTgXkh1Nd9AthcmB3nNK6WYgVtbbooOOgkx7e0hGjmlQkcROrqqp
   kjSCTyJYmdpk8w8U9st4ojFXIfajOde5YhklTOFvj/IUJWsXifzZ+Xcue
   YRQX/OiES3DxWnXxfroby37Di6EH0dtwOJkRprDTCFwzJ4OCESMz4wLkP
   vCAjLeHCBOlCayVeO8I5+lQyaS11CqzGwhGr65SnUz/yYhOhiPsjZmPCy
   UjDF6l8BTkIhCkOSu6vDyoqDL/lPEYtcrQdV92kFkj76hl6cLPjyxZ3G3
   IbQDHfpMyDjmjFt1PB+1JVLBK2TdrFSqbBt5nTC+1CxTrDFh+UkcgTb5W
   g==;
X-CSE-ConnectionGUID: 3QYM/N6kRlCeF3mEVG5eog==
X-CSE-MsgGUID: N1xrfJMaSP2CjHtTvDuu1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90690917"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="90690917"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 14:42:14 -0700
X-CSE-ConnectionGUID: KGQiJihuTseX9DyTL50Gpw==
X-CSE-MsgGUID: K7/NMN4aQsqaA1/Z0xi/lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="273329862"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Oct 2026 14:42:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDqRn-000000000sk-0dmv;
	Mon, 05 Oct 2026 21:42:11 +0000
Date: Tue, 06 Oct 2026 05:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/watchdog/riscv_sbi_wdt.c:327:16: warning: assignment
 discards 'const' qualifier from pointer target type
Message-ID: <202610060557.qyC1dD0C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Prajwal-N/include-sbi_ecall_interface-Add-defines-for-the-RISC-V-SBI-watchdog-extension/20261002-220757, commit: aa91eed7420580c83c9c8d500ef9379e539ca8c7"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Prajwal N <prajwal.n@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Prajwal-N/include-sbi_ecall_interface-Add-defines-for-the-RISC-V-SBI-watchdog-extension/20261002-220757
head:   aa91eed7420580c83c9c8d500ef9379e539ca8c7
commit: aa91eed7420580c83c9c8d500ef9379e539ca8c7 drivers/watchdog: Add RISC-V SBI watchdog driver
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-1000-20261006 (https://download.01.org/0day-ci/archive/20261006/202610060557.qyC1dD0C-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610060557.qyC1dD0C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610060557.qyC1dD0C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/riscv_sbi_wdt.c: In function 'sbiwdt_probe':
>> drivers/watchdog/riscv_sbi_wdt.c:327:16: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      imsic_global = imsic_get_global_config();
                   ^
   drivers/watchdog/riscv_sbi_wdt.c:333:53: error: 'struct imsic_global_config' has no member named 'fwnode'
      msi_domain = irq_find_matching_fwnode(imsic_global->fwnode,
                                                        ^~


vim +/const +327 drivers/watchdog/riscv_sbi_wdt.c

aa91eed7420580 Prajwal N 2026-10-02  298  
aa91eed7420580 Prajwal N 2026-10-02  299  static int sbiwdt_probe(struct platform_device *pdev)
aa91eed7420580 Prajwal N 2026-10-02  300  {
aa91eed7420580 Prajwal N 2026-10-02  301  	struct sbiwdt *wdt;
aa91eed7420580 Prajwal N 2026-10-02  302  	struct imsic_global_config *imsic_global;
aa91eed7420580 Prajwal N 2026-10-02  303  	struct irq_domain *msi_domain;
aa91eed7420580 Prajwal N 2026-10-02  304  	struct device *dev = &pdev->dev;
aa91eed7420580 Prajwal N 2026-10-02  305  	int rc;
aa91eed7420580 Prajwal N 2026-10-02  306  
aa91eed7420580 Prajwal N 2026-10-02  307  	/* Allocate memory for the global watchdog structure */
aa91eed7420580 Prajwal N 2026-10-02  308  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
aa91eed7420580 Prajwal N 2026-10-02  309  	if (!wdt)
aa91eed7420580 Prajwal N 2026-10-02  310  		return -ENOMEM;
aa91eed7420580 Prajwal N 2026-10-02  311  
aa91eed7420580 Prajwal N 2026-10-02  312  	platform_set_drvdata(pdev, wdt);
aa91eed7420580 Prajwal N 2026-10-02  313  	watchdog_set_drvdata(&wdt->wdd, wdt);
aa91eed7420580 Prajwal N 2026-10-02  314  
aa91eed7420580 Prajwal N 2026-10-02  315  	/* Initialiaze watchdog attributes */
aa91eed7420580 Prajwal N 2026-10-02  316  	rc = sbiwdt_init_attributes(wdt);
aa91eed7420580 Prajwal N 2026-10-02  317  	if (rc) {
aa91eed7420580 Prajwal N 2026-10-02  318  		dev_err(dev, "Failed to read SBI watchdog attributes: %d\n", rc);
aa91eed7420580 Prajwal N 2026-10-02  319  		return rc;
aa91eed7420580 Prajwal N 2026-10-02  320  	}
aa91eed7420580 Prajwal N 2026-10-02  321  
aa91eed7420580 Prajwal N 2026-10-02  322  	wdt->wdd.info = &sbiwdt_info;
aa91eed7420580 Prajwal N 2026-10-02  323  	wdt->wdd.ops = &sbiwdt_ops;
aa91eed7420580 Prajwal N 2026-10-02  324  
aa91eed7420580 Prajwal N 2026-10-02  325  	/* Setup MSI if the capability is available */
aa91eed7420580 Prajwal N 2026-10-02  326  	if (wdt->attrs.wdt_capability & SBI_WDT_CAP_MSI_SUPPORT_MASK) {
aa91eed7420580 Prajwal N 2026-10-02 @327  		imsic_global = imsic_get_global_config();
aa91eed7420580 Prajwal N 2026-10-02  328  		if (!imsic_global) {
aa91eed7420580 Prajwal N 2026-10-02  329  			dev_err(dev, "IMSIC firmware node is unavailable\n");
aa91eed7420580 Prajwal N 2026-10-02  330  			return -ENODEV;
aa91eed7420580 Prajwal N 2026-10-02  331  		}
aa91eed7420580 Prajwal N 2026-10-02  332  
aa91eed7420580 Prajwal N 2026-10-02  333  		msi_domain = irq_find_matching_fwnode(imsic_global->fwnode,
aa91eed7420580 Prajwal N 2026-10-02  334  							DOMAIN_BUS_PLATFORM_MSI);
aa91eed7420580 Prajwal N 2026-10-02  335  
aa91eed7420580 Prajwal N 2026-10-02  336  		if (!msi_domain) {
aa91eed7420580 Prajwal N 2026-10-02  337  			dev_err(dev, "IMSIC platform MSI domain is unavailable\n");
aa91eed7420580 Prajwal N 2026-10-02  338  			return -ENODEV;
aa91eed7420580 Prajwal N 2026-10-02  339  		}
aa91eed7420580 Prajwal N 2026-10-02  340  
aa91eed7420580 Prajwal N 2026-10-02  341  		dev_set_msi_domain(&pdev->dev, msi_domain);
aa91eed7420580 Prajwal N 2026-10-02  342  
aa91eed7420580 Prajwal N 2026-10-02  343  		/* MSI setup*/
aa91eed7420580 Prajwal N 2026-10-02  344  		rc = platform_device_msi_init_and_alloc_irqs(dev, 1, sbiwdt_msi_write);
aa91eed7420580 Prajwal N 2026-10-02  345  		if (rc) {
aa91eed7420580 Prajwal N 2026-10-02  346  			dev_err(dev, "Failed to allocate MSIs\n");
aa91eed7420580 Prajwal N 2026-10-02  347  			return rc;
aa91eed7420580 Prajwal N 2026-10-02  348  		}
aa91eed7420580 Prajwal N 2026-10-02  349  
aa91eed7420580 Prajwal N 2026-10-02  350  		wdt->virq = msi_get_virq(dev, 0);
aa91eed7420580 Prajwal N 2026-10-02  351  		if (!wdt->virq) {
aa91eed7420580 Prajwal N 2026-10-02  352  			dev_err(dev, "Failed to get MSI virtual IRQ: %d\n", wdt->virq);
aa91eed7420580 Prajwal N 2026-10-02  353  			return wdt->virq;
aa91eed7420580 Prajwal N 2026-10-02  354  		}
aa91eed7420580 Prajwal N 2026-10-02  355  
aa91eed7420580 Prajwal N 2026-10-02  356  		rc = devm_request_irq(dev, wdt->virq,
aa91eed7420580 Prajwal N 2026-10-02  357  					sbiwdt_pretimeout_handler,
aa91eed7420580 Prajwal N 2026-10-02  358  					0, "sbiwdt-pretimeout", wdt);
aa91eed7420580 Prajwal N 2026-10-02  359  		if (rc) {
aa91eed7420580 Prajwal N 2026-10-02  360  			dev_err(dev, "Failed to request pretimeout IRQ: %d\n", rc);
aa91eed7420580 Prajwal N 2026-10-02  361  			return rc;
aa91eed7420580 Prajwal N 2026-10-02  362  		}
aa91eed7420580 Prajwal N 2026-10-02  363  	}
aa91eed7420580 Prajwal N 2026-10-02  364  
aa91eed7420580 Prajwal N 2026-10-02  365  	rc = devm_watchdog_register_device(dev, &wdt->wdd);
aa91eed7420580 Prajwal N 2026-10-02  366  	if (rc) {
aa91eed7420580 Prajwal N 2026-10-02  367  		dev_err(dev, "Failed to register RISC-V SBI watchdog device\n");
aa91eed7420580 Prajwal N 2026-10-02  368  		return rc;
aa91eed7420580 Prajwal N 2026-10-02  369  	}
aa91eed7420580 Prajwal N 2026-10-02  370  
aa91eed7420580 Prajwal N 2026-10-02  371  	dev_info(&pdev->dev, "RISC-V SBI Watchdog registered\n");
aa91eed7420580 Prajwal N 2026-10-02  372  
aa91eed7420580 Prajwal N 2026-10-02  373  	return 0;
aa91eed7420580 Prajwal N 2026-10-02  374  }
aa91eed7420580 Prajwal N 2026-10-02  375  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
