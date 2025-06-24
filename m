Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E9E2E7620;
	Tue, 24 Jun 2025 18:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791422; cv=none; b=GmuJc/paKfBhuoZ5T7lEBNQFTo9r7/K4zfPRzHmmuRpLbeEcEauUr0kIQEjGjiuyAI6FwK9K0NFD6et9zGj0mP1ehaoQkAv0+g1xN600cy54opdvwFtDlGveBZtKQ/xVBDQS7G5MIE5DQ4Jjx61ZnnoX8uTlFWQfu+63re/+Tvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791422; c=relaxed/simple;
	bh=SSXC3e48USMbpuPmqx2dcohPFCeZruu4ibh0zndlMS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACHG7fyO/+847TUOTDkba4YPmbG+jotgsugi/SeeUBAAu3SkTwX5ZdGOga/uwaVGDL8ofxhaUNnvatIsZU/NvC6VQ7wN74o5Fa+pU6A4Dv44dnxK50esqxc5LfsRKQy+FhaHlF4gkOChOQ/lEf9msSKlDElgw0QA2fZrPXKoEJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+lbyZd9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+lbyZd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750791419; x=1782327419;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SSXC3e48USMbpuPmqx2dcohPFCeZruu4ibh0zndlMS8=;
  b=g+lbyZd98po/Zrsxr5ELyKSnJbscufild5mq8lVOk1iX34yo0E2RSI3f
   Zh0Rl7ZxR3q7pP1Trxs0XM21t7/7eIKtRX1sU0LIdm5gyCx9j1RfUMVJ1
   7xBl9w1tDtnOvdPGf9kgQpKuvt2+rk1OXKbr6Lyyc8taCNiAoYZSgNPG/
   W3PUEyEOdh6bgNNBAsZQPTyaZ3M5QfZLDvNxrHcnRt1HYq639DHh0w9vT
   7JwIZMIWJ+n+L2oaIZyNAtFyzN+l0PcIL0ISrokUK6j6b937VnWOIjaeA
   tAKQX6z8t9m4henjzGrXKWO1wjcd44t9nDSacaRNExPzM5eOz3wpjzh9w
   w==;
X-CSE-ConnectionGUID: 3+HKO1bNTym/2A1Lw257xQ==
X-CSE-MsgGUID: e8yh3IxRTRS/YR9eYkv9/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56851214"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="56851214"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 11:56:58 -0700
X-CSE-ConnectionGUID: CcEvV0UIR4uNtYHA9QiSZA==
X-CSE-MsgGUID: b/XCed1NSVqPhBuDGbToTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="151500033"
Received: from xpardee-mobl.amr.corp.intel.com (HELO [10.246.154.149]) ([10.246.154.149])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 11:56:58 -0700
Message-ID: <9767fc35-e190-4274-991d-17129a914528@linux.intel.com>
Date: Tue, 24 Jun 2025 11:56:37 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] platform/x86:intel/pmc: Show substate requirement
 for S0ix blockers
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <a0500c45-993d-4daa-b35f-48c9ff4cf50b@suswa.mountain>
Content-Language: en-US
From: Xi Pardee <xi.pardee@linux.intel.com>
In-Reply-To: <a0500c45-993d-4daa-b35f-48c9ff4cf50b@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

Thanks for reviewing. My responses are in line.

Xi

On 6/24/2025 7:45 AM, Dan Carpenter wrote:
> Hi Xi,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Xi-Pardee/platform-x86-intel-pmc-Enable-SSRAM-support-for-Lunar-Lake/20250622-050804
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250621210529.237964-5-xi.pardee%40linux.intel.com
> patch subject: [PATCH v1 4/5] platform/x86:intel/pmc: Show substate requirement for S0ix blockers
> config: i386-randconfig-141-20250623 (https://download.01.org/0day-ci/archive/20250624/202506241840.0POVt4tf-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202506241840.0POVt4tf-lkp@intel.com/
>
> New smatch warnings:
> drivers/platform/x86/intel/pmc/core.c:1525 pmc_core_pmt_get_blk_sub_req() error: uninitialized symbol 'ret'.
> drivers/platform/x86/intel/pmc/core.c:1559 pmc_core_get_telem_info() error: uninitialized symbol 'ret'.
>
> vim +/ret +1525 drivers/platform/x86/intel/pmc/core.c
>
> f3435ca196060d Xi Pardee 2025-06-21  1497  static int pmc_core_pmt_get_blk_sub_req(struct pmc_dev *pmcdev, struct pmc *pmc,
> f3435ca196060d Xi Pardee 2025-06-21  1498  					struct telem_endpoint *ep)
> f3435ca196060d Xi Pardee 2025-06-21  1499  {
> f3435ca196060d Xi Pardee 2025-06-21  1500  	u32 num_blocker, sample_id;
> f3435ca196060d Xi Pardee 2025-06-21  1501  	unsigned int index;
> f3435ca196060d Xi Pardee 2025-06-21  1502  	u32 *req_offset;
> f3435ca196060d Xi Pardee 2025-06-21  1503  	int ret;
> f3435ca196060d Xi Pardee 2025-06-21  1504
> f3435ca196060d Xi Pardee 2025-06-21  1505  	num_blocker = pmc->map->num_s0ix_blocker;
> f3435ca196060d Xi Pardee 2025-06-21  1506  	sample_id = pmc->map->blocker_req_offset;
> f3435ca196060d Xi Pardee 2025-06-21  1507
> f3435ca196060d Xi Pardee 2025-06-21  1508  	pmc->blk_sub_req_regs = devm_kzalloc(&pmcdev->pdev->dev,
> f3435ca196060d Xi Pardee 2025-06-21  1509  					 num_blocker * sizeof(u32),
>
> Use devm_kcalloc() so we don't have to check if num_blocker can be
> greater than UINT_MAX / 4 on 32bit systems.
Will change to use devm_kcalloc() in next version.
>
> f3435ca196060d Xi Pardee 2025-06-21  1510  					 GFP_KERNEL);
> f3435ca196060d Xi Pardee 2025-06-21  1511  	if (!pmc->blk_sub_req_regs)
> f3435ca196060d Xi Pardee 2025-06-21  1512  		ret = -ENOMEM;
>
> s/ret = /return /.  Otherwise it leads to a NULL pointer dereference.
Will change to return in next version
>
> f3435ca196060d Xi Pardee 2025-06-21  1513
> f3435ca196060d Xi Pardee 2025-06-21  1514  	req_offset = pmc->blk_sub_req_regs;
> f3435ca196060d Xi Pardee 2025-06-21  1515  	for (index = 0; index < num_blocker; index++) {
>
> smatch doesn't know if num_blocker can be zero.
Will initialize ret to be 0 in next version.
>
> f3435ca196060d Xi Pardee 2025-06-21  1516  		ret = pmt_telem_read32(ep, sample_id, req_offset, 1);
> f3435ca196060d Xi Pardee 2025-06-21  1517  		if (ret) {
> f3435ca196060d Xi Pardee 2025-06-21  1518  			dev_err(&pmcdev->pdev->dev,
> f3435ca196060d Xi Pardee 2025-06-21  1519  				"couldn't read Low Power Mode requirements: %d\n", ret);
> f3435ca196060d Xi Pardee 2025-06-21  1520  			return ret;
> f3435ca196060d Xi Pardee 2025-06-21  1521  		}
> f3435ca196060d Xi Pardee 2025-06-21  1522  		sample_id++;
> f3435ca196060d Xi Pardee 2025-06-21  1523  		req_offset++;
> f3435ca196060d Xi Pardee 2025-06-21  1524  	}
> f3435ca196060d Xi Pardee 2025-06-21 @1525  	return ret;
> f3435ca196060d Xi Pardee 2025-06-21  1526  }
> f3435ca196060d Xi Pardee 2025-06-21  1527
> f3435ca196060d Xi Pardee 2025-06-21  1528  static int pmc_core_get_telem_info(struct pmc_dev *pmcdev, int func, unsigned int telem_info)
> 78a7491d5cba8b Xi Pardee 2025-04-09  1529  {
> b5d46539626833 Xi Pardee 2025-04-25  1530  	struct pci_dev *pcidev __free(pci_dev_put) = NULL;
> d7bc7e19147769 Xi Pardee 2025-06-21  1531  	struct telem_endpoint *ep;
> 052fabddeaa70b Xi Pardee 2025-04-09  1532  	unsigned int i;
> d7bc7e19147769 Xi Pardee 2025-06-21  1533  	u32 guid;
> 052fabddeaa70b Xi Pardee 2025-04-09  1534  	int ret;
> 78a7491d5cba8b Xi Pardee 2025-04-09  1535
> b5d46539626833 Xi Pardee 2025-04-25  1536  	pcidev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(20, func));
> b5d46539626833 Xi Pardee 2025-04-25  1537  	if (!pcidev)
> 78a7491d5cba8b Xi Pardee 2025-04-09  1538  		return -ENODEV;
> 78a7491d5cba8b Xi Pardee 2025-04-09  1539
> 78a7491d5cba8b Xi Pardee 2025-04-09  1540  	for (i = 0; i < ARRAY_SIZE(pmcdev->pmcs); ++i) {
> d7bc7e19147769 Xi Pardee 2025-06-21  1541  		struct pmc *pmc;
> d7bc7e19147769 Xi Pardee 2025-06-21  1542
> d7bc7e19147769 Xi Pardee 2025-06-21  1543  		pmc = pmcdev->pmcs[i];
> d7bc7e19147769 Xi Pardee 2025-06-21  1544  		if (!pmc)
> 78a7491d5cba8b Xi Pardee 2025-04-09  1545  			continue;
> 78a7491d5cba8b Xi Pardee 2025-04-09  1546
> d7bc7e19147769 Xi Pardee 2025-06-21  1547  		guid = pmc_core_find_guid(pmcdev->regmap_list, pmc->map);
> d7bc7e19147769 Xi Pardee 2025-06-21  1548  		if (!guid)
> d7bc7e19147769 Xi Pardee 2025-06-21  1549  			return -ENXIO;
> d7bc7e19147769 Xi Pardee 2025-06-21  1550
> d7bc7e19147769 Xi Pardee 2025-06-21  1551  		ep = pmt_telem_find_and_register_endpoint(pcidev, guid, 0);
> d7bc7e19147769 Xi Pardee 2025-06-21  1552  		if (IS_ERR(ep)) {
> d7bc7e19147769 Xi Pardee 2025-06-21  1553  			dev_dbg(&pmcdev->pdev->dev, "couldn't get telem endpoint %pe", ep);
> d7bc7e19147769 Xi Pardee 2025-06-21  1554  			return -EPROBE_DEFER;
> d7bc7e19147769 Xi Pardee 2025-06-21  1555  		}
> d7bc7e19147769 Xi Pardee 2025-06-21  1556
> f3435ca196060d Xi Pardee 2025-06-21  1557  		if (telem_info & SUB_REQ_LPM)
> d7bc7e19147769 Xi Pardee 2025-06-21  1558  			ret = pmc_core_pmt_get_lpm_req(pmcdev, pmc, ep);
>
> ret is uninitialized on else path.  I generally encourage developers
> to set CONFIG_INIT_STACK_ALL_PATTERN=y for their testing.

Will initialize ret to be 0 in next version. Thanks for your suggestion. 
Will try this option when testing.

Thanks!

Xi

> 78a7491d5cba8b Xi Pardee 2025-04-09 @1559  		if (ret)
> f3435ca196060d Xi Pardee 2025-06-21  1560  			goto unregister_ep;
> f3435ca196060d Xi Pardee 2025-06-21  1561
> f3435ca196060d Xi Pardee 2025-06-21  1562  		if (telem_info & SUB_REQ_BLK)
> f3435ca196060d Xi Pardee 2025-06-21  1563  			ret = pmc_core_pmt_get_blk_sub_req(pmcdev, pmc, ep);
> f3435ca196060d Xi Pardee 2025-06-21  1564  		if (ret)
> f3435ca196060d Xi Pardee 2025-06-21  1565  			goto unregister_ep;
> f3435ca196060d Xi Pardee 2025-06-21  1566
> f3435ca196060d Xi Pardee 2025-06-21  1567  		pmt_telem_unregister_endpoint(ep);
> 78a7491d5cba8b Xi Pardee 2025-04-09  1568  	}
> 78a7491d5cba8b Xi Pardee 2025-04-09  1569
> 78a7491d5cba8b Xi Pardee 2025-04-09  1570  	return 0;
> f3435ca196060d Xi Pardee 2025-06-21  1571
> f3435ca196060d Xi Pardee 2025-06-21  1572  unregister_ep:
> f3435ca196060d Xi Pardee 2025-06-21  1573  	pmt_telem_unregister_endpoint(ep);
> f3435ca196060d Xi Pardee 2025-06-21  1574  	return ret;
> 78a7491d5cba8b Xi Pardee 2025-04-09  1575  }
>
