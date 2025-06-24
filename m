Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BEC28136F
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750762270; cv=none; b=Ufb4krvt+d+8z8CM30/J5ukjAzAJlwBg4AVdBcDQewahC/465rdRd2LJgJBDjggVGbj6aT+dGBBndGC+sfvD9F6zSnsYPo+cp3dCoMikPPmjmpEfyG16657Z0yH+jDQJcWkqJDOUIBWdGxzOz7rzGL2ZMKl7iTdbY3p/epVujh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750762270; c=relaxed/simple;
	bh=u0Cyp8Yjhv6BbRXgq3Jy84gBx4wLu5RXdUVx23Wu4cM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oJZwWNjPo7h9TLtY2Vl3w8R1FSyUotzzlxLVHIfkv612WDzeYbltja++ccjhgon600LDgyMDz5I3NQmozI25fEFCFClm2jn4sJI/h8DpewOvG1jGPRo1JOQIO4wADhrYkfcFDh2vIOuukB0JdCo8vdYIFpMh4NtbIXqqIQjPzoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exKaVO5D; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exKaVO5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750762269; x=1782298269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0Cyp8Yjhv6BbRXgq3Jy84gBx4wLu5RXdUVx23Wu4cM=;
  b=exKaVO5DwxK3iAsYSj22c3PeLfC2GHUW2If35JkDBz/3jKUwPC3WTgla
   XtLDLN/gmGbGR2deAGWouFI3uW2TnErGlMibT2smWHWHV37U6fswJiM9U
   tQ2C/n9xg1nJCBt9K3RtMkKrRA1M+SCd9Br+LFYB2tNgbbo1egQ9t0N8A
   cK7W9wU++Rr+41wVu1RNmoHJpAsN1yJksLRNizx8KyL218bxZ5LyiZOdp
   OaOxtgX4uP9lljwoFPJwh9fmsYIdjLAmgcM21/SlIUMmxB9TeDnuoAYP+
   uVMlI5WHL9poZ3QUdxa5wLiMa/lI2ub+nwBCMlEIfDblEr0qUBh1R7Cfl
   w==;
X-CSE-ConnectionGUID: LUXnfclLR9mXXmdkzjVriA==
X-CSE-MsgGUID: Ze28bRqxSLizak5t0K9a/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70418124"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="70418124"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:51:08 -0700
X-CSE-ConnectionGUID: TUZpMZxyQHq8BIAtf68Y8g==
X-CSE-MsgGUID: 6cBBTbPVQXyG7BKMylLRZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="182763233"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jun 2025 03:51:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU1F2-000S2Q-0f;
	Tue, 24 Jun 2025 10:51:04 +0000
Date: Tue, 24 Jun 2025 18:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 4/5] platform/x86:intel/pmc: Show substate requirement
 for S0ix blockers
Message-ID: <202506241840.0POVt4tf-lkp@intel.com>
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
In-Reply-To: <20250621210529.237964-5-xi.pardee@linux.intel.com>
References: <20250621210529.237964-5-xi.pardee@linux.intel.com>
TO: Xi Pardee <xi.pardee@linux.intel.com>

Hi Xi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc3 next-20250623]
[cannot apply to amd-pstate/linux-next amd-pstate/bleeding-edge]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xi-Pardee/platform-x86-intel-pmc-Enable-SSRAM-support-for-Lunar-Lake/20250622-050804
base:   linus/master
patch link:    https://lore.kernel.org/r/20250621210529.237964-5-xi.pardee%40linux.intel.com
patch subject: [PATCH v1 4/5] platform/x86:intel/pmc: Show substate requirement for S0ix blockers
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20250623 (https://download.01.org/0day-ci/archive/20250624/202506241840.0POVt4tf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506241840.0POVt4tf-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel/pmc/core.c:1525 pmc_core_pmt_get_blk_sub_req() error: uninitialized symbol 'ret'.
drivers/platform/x86/intel/pmc/core.c:1559 pmc_core_get_telem_info() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/platform/x86/intel/pmc/core.c:502 pmc_core_send_ltr_ignore() error: uninitialized symbol 'pmc'.
drivers/platform/x86/intel/pmc/core.c:502 pmc_core_send_ltr_ignore() error: uninitialized symbol 'map'.
drivers/platform/x86/intel/pmc/core.c:502 pmc_core_send_ltr_ignore() error: we previously assumed 'pmc' could be null (see line 480)
drivers/platform/x86/intel/pmc/core.c:1494 pmc_core_pmt_get_lpm_req() error: uninitialized symbol 'ret'.

vim +/ret +1525 drivers/platform/x86/intel/pmc/core.c

78a7491d5cba8b Xi Pardee 2025-04-09  1496  
f3435ca196060d Xi Pardee 2025-06-21  1497  static int pmc_core_pmt_get_blk_sub_req(struct pmc_dev *pmcdev, struct pmc *pmc,
f3435ca196060d Xi Pardee 2025-06-21  1498  					struct telem_endpoint *ep)
f3435ca196060d Xi Pardee 2025-06-21  1499  {
f3435ca196060d Xi Pardee 2025-06-21  1500  	u32 num_blocker, sample_id;
f3435ca196060d Xi Pardee 2025-06-21  1501  	unsigned int index;
f3435ca196060d Xi Pardee 2025-06-21  1502  	u32 *req_offset;
f3435ca196060d Xi Pardee 2025-06-21  1503  	int ret;
f3435ca196060d Xi Pardee 2025-06-21  1504  
f3435ca196060d Xi Pardee 2025-06-21  1505  	num_blocker = pmc->map->num_s0ix_blocker;
f3435ca196060d Xi Pardee 2025-06-21  1506  	sample_id = pmc->map->blocker_req_offset;
f3435ca196060d Xi Pardee 2025-06-21  1507  
f3435ca196060d Xi Pardee 2025-06-21  1508  	pmc->blk_sub_req_regs = devm_kzalloc(&pmcdev->pdev->dev,
f3435ca196060d Xi Pardee 2025-06-21  1509  					 num_blocker * sizeof(u32),
f3435ca196060d Xi Pardee 2025-06-21  1510  					 GFP_KERNEL);
f3435ca196060d Xi Pardee 2025-06-21  1511  	if (!pmc->blk_sub_req_regs)
f3435ca196060d Xi Pardee 2025-06-21  1512  		ret = -ENOMEM;
f3435ca196060d Xi Pardee 2025-06-21  1513  
f3435ca196060d Xi Pardee 2025-06-21  1514  	req_offset = pmc->blk_sub_req_regs;
f3435ca196060d Xi Pardee 2025-06-21  1515  	for (index = 0; index < num_blocker; index++) {
f3435ca196060d Xi Pardee 2025-06-21  1516  		ret = pmt_telem_read32(ep, sample_id, req_offset, 1);
f3435ca196060d Xi Pardee 2025-06-21  1517  		if (ret) {
f3435ca196060d Xi Pardee 2025-06-21  1518  			dev_err(&pmcdev->pdev->dev,
f3435ca196060d Xi Pardee 2025-06-21  1519  				"couldn't read Low Power Mode requirements: %d\n", ret);
f3435ca196060d Xi Pardee 2025-06-21  1520  			return ret;
f3435ca196060d Xi Pardee 2025-06-21  1521  		}
f3435ca196060d Xi Pardee 2025-06-21  1522  		sample_id++;
f3435ca196060d Xi Pardee 2025-06-21  1523  		req_offset++;
f3435ca196060d Xi Pardee 2025-06-21  1524  	}
f3435ca196060d Xi Pardee 2025-06-21 @1525  	return ret;
f3435ca196060d Xi Pardee 2025-06-21  1526  }
f3435ca196060d Xi Pardee 2025-06-21  1527  
f3435ca196060d Xi Pardee 2025-06-21  1528  static int pmc_core_get_telem_info(struct pmc_dev *pmcdev, int func, unsigned int telem_info)
78a7491d5cba8b Xi Pardee 2025-04-09  1529  {
b5d46539626833 Xi Pardee 2025-04-25  1530  	struct pci_dev *pcidev __free(pci_dev_put) = NULL;
d7bc7e19147769 Xi Pardee 2025-06-21  1531  	struct telem_endpoint *ep;
052fabddeaa70b Xi Pardee 2025-04-09  1532  	unsigned int i;
d7bc7e19147769 Xi Pardee 2025-06-21  1533  	u32 guid;
052fabddeaa70b Xi Pardee 2025-04-09  1534  	int ret;
78a7491d5cba8b Xi Pardee 2025-04-09  1535  
b5d46539626833 Xi Pardee 2025-04-25  1536  	pcidev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(20, func));
b5d46539626833 Xi Pardee 2025-04-25  1537  	if (!pcidev)
78a7491d5cba8b Xi Pardee 2025-04-09  1538  		return -ENODEV;
78a7491d5cba8b Xi Pardee 2025-04-09  1539  
78a7491d5cba8b Xi Pardee 2025-04-09  1540  	for (i = 0; i < ARRAY_SIZE(pmcdev->pmcs); ++i) {
d7bc7e19147769 Xi Pardee 2025-06-21  1541  		struct pmc *pmc;
d7bc7e19147769 Xi Pardee 2025-06-21  1542  
d7bc7e19147769 Xi Pardee 2025-06-21  1543  		pmc = pmcdev->pmcs[i];
d7bc7e19147769 Xi Pardee 2025-06-21  1544  		if (!pmc)
78a7491d5cba8b Xi Pardee 2025-04-09  1545  			continue;
78a7491d5cba8b Xi Pardee 2025-04-09  1546  
d7bc7e19147769 Xi Pardee 2025-06-21  1547  		guid = pmc_core_find_guid(pmcdev->regmap_list, pmc->map);
d7bc7e19147769 Xi Pardee 2025-06-21  1548  		if (!guid)
d7bc7e19147769 Xi Pardee 2025-06-21  1549  			return -ENXIO;
d7bc7e19147769 Xi Pardee 2025-06-21  1550  
d7bc7e19147769 Xi Pardee 2025-06-21  1551  		ep = pmt_telem_find_and_register_endpoint(pcidev, guid, 0);
d7bc7e19147769 Xi Pardee 2025-06-21  1552  		if (IS_ERR(ep)) {
d7bc7e19147769 Xi Pardee 2025-06-21  1553  			dev_dbg(&pmcdev->pdev->dev, "couldn't get telem endpoint %pe", ep);
d7bc7e19147769 Xi Pardee 2025-06-21  1554  			return -EPROBE_DEFER;
d7bc7e19147769 Xi Pardee 2025-06-21  1555  		}
d7bc7e19147769 Xi Pardee 2025-06-21  1556  
f3435ca196060d Xi Pardee 2025-06-21  1557  		if (telem_info & SUB_REQ_LPM)
d7bc7e19147769 Xi Pardee 2025-06-21  1558  			ret = pmc_core_pmt_get_lpm_req(pmcdev, pmc, ep);
78a7491d5cba8b Xi Pardee 2025-04-09 @1559  		if (ret)
f3435ca196060d Xi Pardee 2025-06-21  1560  			goto unregister_ep;
f3435ca196060d Xi Pardee 2025-06-21  1561  
f3435ca196060d Xi Pardee 2025-06-21  1562  		if (telem_info & SUB_REQ_BLK)
f3435ca196060d Xi Pardee 2025-06-21  1563  			ret = pmc_core_pmt_get_blk_sub_req(pmcdev, pmc, ep);
f3435ca196060d Xi Pardee 2025-06-21  1564  		if (ret)
f3435ca196060d Xi Pardee 2025-06-21  1565  			goto unregister_ep;
f3435ca196060d Xi Pardee 2025-06-21  1566  
f3435ca196060d Xi Pardee 2025-06-21  1567  		pmt_telem_unregister_endpoint(ep);
78a7491d5cba8b Xi Pardee 2025-04-09  1568  	}
78a7491d5cba8b Xi Pardee 2025-04-09  1569  
78a7491d5cba8b Xi Pardee 2025-04-09  1570  	return 0;
f3435ca196060d Xi Pardee 2025-06-21  1571  
f3435ca196060d Xi Pardee 2025-06-21  1572  unregister_ep:
f3435ca196060d Xi Pardee 2025-06-21  1573  	pmt_telem_unregister_endpoint(ep);
f3435ca196060d Xi Pardee 2025-06-21  1574  	return ret;
78a7491d5cba8b Xi Pardee 2025-04-09  1575  }
78a7491d5cba8b Xi Pardee 2025-04-09  1576  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
