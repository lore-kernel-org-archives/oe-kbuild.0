Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A46B3D9042
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444213; cv=none; b=I5GOCbIGiY8Lz6lDW5awex3c+cxRzfvzHjS0zw5DZAQSTj1nMpy8Mm6BBaGQv9JeC3pubB72eCEEv44eUUYFhLMLGuN6oLdb0nK7VmkxVAFkOwbgVvb7UGpnsHEFiUxJQh/zVmBHO89mW/6wjjOwDJoKjSOeOSkyae4I15slR1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444213; c=relaxed/simple;
	bh=F8Q7eP7uQQI0ZWDyJMOn/Wh4Gv2mZJh+e7Vn/PPYLHg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rgiIE/2qLhoJUuK3cqiUtfX65bbL+zP+3bUdncexSw7WCNUxjoa2lp2YZ6DDcf1MzGj5TY7kCLZ+tf0ihGYmqE0qBWTTRofl0Zg3X8WOLndziA06Lh/dRoo1gaCQ03LQ3Cng3hrYzU8bqYa9d08V30pSZu1LROZlnvgvkUuEG8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iewE0pq9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iewE0pq9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791444212; x=1822980212;
  h=date:from:to:cc:subject:message-id;
  bh=F8Q7eP7uQQI0ZWDyJMOn/Wh4Gv2mZJh+e7Vn/PPYLHg=;
  b=iewE0pq9kK4F8zJB4C9HXnQ+A4q5Y+dCXKbJ2YlOUIYBKkUDr9L+s3vF
   qESwc+gYcRdcjgl+QxJoQZ86JjHyixcq9PHlJW+AdrgdBG8rNCjbQ0CuV
   maP1EI8UyvpMNLGSMcK1shGc4Ry0oH440B14YzuZq95+uJR7xsf/hJx0T
   0g+BFDlCwxlS15yTGzaaRqUktcBwKgno92v4Ienigp8kIN9C7l5MLInSG
   yRigy4H9DI1hjGdOKUGQ/ydmn7wn7kYQO6dq9l8W8X6wlCwGTVxrPsPVC
   hluv4BRzN4JEVWHbOb90wDBdt4i0BHIkPYS8YmOchSzdDVKkDn7yEHcli
   w==;
X-CSE-ConnectionGUID: 2VYEnM95RAqveqQoDvMhXQ==
X-CSE-MsgGUID: 0JZm9j+wSi+Egv3FTiwKsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="320448"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="320448"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 00:23:31 -0700
X-CSE-ConnectionGUID: oR7cEqfxTM2/fa4yNN1jgQ==
X-CSE-MsgGUID: 6yjGvRM7SFaPNPgdONZ4nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="389055"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Oct 2026 00:23:30 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEiTP-00000000519-2gtx;
	Thu, 08 Oct 2026 07:23:27 +0000
Date: Thu, 08 Oct 2026 09:22:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13311/15025]
 drivers/dma/amlogic-dma.c:636 aml_dma_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <202610080953.C5TYlCaA-lkp@intel.com>
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
TO: Xianwei Zhao <xianwei.zhao@amlogic.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b018686719706a781c45a874ed51374a2dc4b767
commit: b84b5197e344e2d378a9edf5d782b6fbddff8d06 [13311/15025] dmaengine: amlogic: Add general DMA driver for A9
:::::: branch date: 18 hours ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r2202-20261008 (https://download.01.org/0day-ci/archive/20261008/202610080953.C5TYlCaA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610080953.C5TYlCaA-lkp@intel.com/

smatch warnings:
drivers/dma/amlogic-dma.c:636 aml_dma_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +636 drivers/dma/amlogic-dma.c

b84b5197e344e2 Xianwei Zhao 2026-09-03  596  
b84b5197e344e2 Xianwei Zhao 2026-09-03  597  static int aml_dma_probe(struct platform_device *pdev)
b84b5197e344e2 Xianwei Zhao 2026-09-03  598  {
b84b5197e344e2 Xianwei Zhao 2026-09-03  599  	struct device_node *np = pdev->dev.of_node;
b84b5197e344e2 Xianwei Zhao 2026-09-03  600  	struct dma_device *dma_dev;
b84b5197e344e2 Xianwei Zhao 2026-09-03  601  	struct aml_dma_dev *aml_dma;
b84b5197e344e2 Xianwei Zhao 2026-09-03  602  	int ret, i, len;
b84b5197e344e2 Xianwei Zhao 2026-09-03  603  	u32 chan_nr;
b84b5197e344e2 Xianwei Zhao 2026-09-03  604  
b84b5197e344e2 Xianwei Zhao 2026-09-03  605  	const struct regmap_config aml_regmap_config = {
b84b5197e344e2 Xianwei Zhao 2026-09-03  606  		.reg_bits = 32,
b84b5197e344e2 Xianwei Zhao 2026-09-03  607  		.val_bits = 32,
b84b5197e344e2 Xianwei Zhao 2026-09-03  608  		.reg_stride = 4,
b84b5197e344e2 Xianwei Zhao 2026-09-03  609  		.max_register = 0x3000,
b84b5197e344e2 Xianwei Zhao 2026-09-03  610  	};
b84b5197e344e2 Xianwei Zhao 2026-09-03  611  
b84b5197e344e2 Xianwei Zhao 2026-09-03  612  	ret = of_property_read_u32(np, "dma-channels", &chan_nr);
b84b5197e344e2 Xianwei Zhao 2026-09-03  613  	if (ret)
b84b5197e344e2 Xianwei Zhao 2026-09-03  614  		return dev_err_probe(&pdev->dev, ret, "failed to read dma-channels\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  615  	if (chan_nr > (MAX_CHAN_ID * 2))
b84b5197e344e2 Xianwei Zhao 2026-09-03  616  		return dev_err_probe(&pdev->dev, -EINVAL, "dma-channels unusual\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  617  
b84b5197e344e2 Xianwei Zhao 2026-09-03  618  	len = sizeof(struct aml_dma_dev) + sizeof(struct aml_dma_chan) * chan_nr;
b84b5197e344e2 Xianwei Zhao 2026-09-03  619  	aml_dma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
b84b5197e344e2 Xianwei Zhao 2026-09-03  620  	if (!aml_dma)
b84b5197e344e2 Xianwei Zhao 2026-09-03  621  		return -ENOMEM;
b84b5197e344e2 Xianwei Zhao 2026-09-03  622  
b84b5197e344e2 Xianwei Zhao 2026-09-03  623  	aml_dma->free_wq = alloc_ordered_workqueue("aml_dma_free", 0);
b84b5197e344e2 Xianwei Zhao 2026-09-03  624  	if (!aml_dma->free_wq)
b84b5197e344e2 Xianwei Zhao 2026-09-03  625  		return -ENOMEM;
b84b5197e344e2 Xianwei Zhao 2026-09-03  626  
b84b5197e344e2 Xianwei Zhao 2026-09-03  627  	aml_dma->chan_nr = chan_nr;
b84b5197e344e2 Xianwei Zhao 2026-09-03  628  
b84b5197e344e2 Xianwei Zhao 2026-09-03  629  	aml_dma->base = devm_platform_ioremap_resource(pdev, 0);
b84b5197e344e2 Xianwei Zhao 2026-09-03  630  	if (IS_ERR(aml_dma->base))
b84b5197e344e2 Xianwei Zhao 2026-09-03  631  		return PTR_ERR(aml_dma->base);
b84b5197e344e2 Xianwei Zhao 2026-09-03  632  
b84b5197e344e2 Xianwei Zhao 2026-09-03  633  	aml_dma->regmap = devm_regmap_init_mmio(&pdev->dev, aml_dma->base,
b84b5197e344e2 Xianwei Zhao 2026-09-03  634  						&aml_regmap_config);
b84b5197e344e2 Xianwei Zhao 2026-09-03  635  	if (IS_ERR_OR_NULL(aml_dma->regmap))
b84b5197e344e2 Xianwei Zhao 2026-09-03 @636  		return PTR_ERR(aml_dma->regmap);
b84b5197e344e2 Xianwei Zhao 2026-09-03  637  
b84b5197e344e2 Xianwei Zhao 2026-09-03  638  	aml_dma->clk = devm_clk_get_enabled(&pdev->dev, NULL);
b84b5197e344e2 Xianwei Zhao 2026-09-03  639  	if (IS_ERR(aml_dma->clk))
b84b5197e344e2 Xianwei Zhao 2026-09-03  640  		return PTR_ERR(aml_dma->clk);
b84b5197e344e2 Xianwei Zhao 2026-09-03  641  
b84b5197e344e2 Xianwei Zhao 2026-09-03  642  	aml_dma->irq = platform_get_irq(pdev, 0);
b84b5197e344e2 Xianwei Zhao 2026-09-03  643  
b84b5197e344e2 Xianwei Zhao 2026-09-03  644  	aml_dma->pdev = pdev;
b84b5197e344e2 Xianwei Zhao 2026-09-03  645  	aml_dma->dma_device.dev = &pdev->dev;
b84b5197e344e2 Xianwei Zhao 2026-09-03  646  
b84b5197e344e2 Xianwei Zhao 2026-09-03  647  	dma_dev = &aml_dma->dma_device;
b84b5197e344e2 Xianwei Zhao 2026-09-03  648  	INIT_LIST_HEAD(&dma_dev->channels);
b84b5197e344e2 Xianwei Zhao 2026-09-03  649  
b84b5197e344e2 Xianwei Zhao 2026-09-03  650  	/* Initialize channel parameters */
b84b5197e344e2 Xianwei Zhao 2026-09-03  651  	for (i = 0; i < chan_nr; i++) {
b84b5197e344e2 Xianwei Zhao 2026-09-03  652  		struct aml_dma_chan *aml_chan = &aml_dma->aml_chans[i];
b84b5197e344e2 Xianwei Zhao 2026-09-03  653  
b84b5197e344e2 Xianwei Zhao 2026-09-03  654  		aml_chan->aml_dma = aml_dma;
b84b5197e344e2 Xianwei Zhao 2026-09-03  655  		aml_chan->vchan.desc_free = aml_dma_free_desc;
b84b5197e344e2 Xianwei Zhao 2026-09-03  656  		vchan_init(&aml_chan->vchan, &aml_dma->dma_device);
b84b5197e344e2 Xianwei Zhao 2026-09-03  657  	}
b84b5197e344e2 Xianwei Zhao 2026-09-03  658  	aml_dma->chan_used = 0;
b84b5197e344e2 Xianwei Zhao 2026-09-03  659  
b84b5197e344e2 Xianwei Zhao 2026-09-03  660  	dma_set_max_seg_size(dma_dev->dev, SG_MAX_LEN);
b84b5197e344e2 Xianwei Zhao 2026-09-03  661  	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
b84b5197e344e2 Xianwei Zhao 2026-09-03  662  	dma_dev->device_alloc_chan_resources = aml_dma_alloc_chan_resources;
b84b5197e344e2 Xianwei Zhao 2026-09-03  663  	dma_dev->device_free_chan_resources = aml_dma_free_chan_resources;
b84b5197e344e2 Xianwei Zhao 2026-09-03  664  	dma_dev->device_tx_status = aml_dma_tx_status;
b84b5197e344e2 Xianwei Zhao 2026-09-03  665  	dma_dev->device_prep_slave_sg = aml_dma_prep_slave_sg;
b84b5197e344e2 Xianwei Zhao 2026-09-03  666  	dma_dev->device_pause = aml_dma_chan_pause;
b84b5197e344e2 Xianwei Zhao 2026-09-03  667  	dma_dev->device_resume = aml_dma_chan_resume;
b84b5197e344e2 Xianwei Zhao 2026-09-03  668  	dma_dev->device_terminate_all = aml_dma_terminate_all;
b84b5197e344e2 Xianwei Zhao 2026-09-03  669  	dma_dev->device_issue_pending = aml_dma_issue_pending;
b84b5197e344e2 Xianwei Zhao 2026-09-03  670  	/* PIO 4 bytes and I2C 1 byte */
b84b5197e344e2 Xianwei Zhao 2026-09-03  671  	dma_dev->dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
b84b5197e344e2 Xianwei Zhao 2026-09-03  672  	dma_dev->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
b84b5197e344e2 Xianwei Zhao 2026-09-03  673  	dma_dev->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
b84b5197e344e2 Xianwei Zhao 2026-09-03  674  
b84b5197e344e2 Xianwei Zhao 2026-09-03  675  	regmap_write(aml_dma->regmap, RCH_INT_MASK, INT_MASK);
b84b5197e344e2 Xianwei Zhao 2026-09-03  676  	regmap_write(aml_dma->regmap, WCH_INT_MASK, INT_MASK);
b84b5197e344e2 Xianwei Zhao 2026-09-03  677  
b84b5197e344e2 Xianwei Zhao 2026-09-03  678  	ret = devm_request_irq(&pdev->dev, aml_dma->irq, aml_dma_interrupt_handler,
b84b5197e344e2 Xianwei Zhao 2026-09-03  679  			       0, dev_name(&pdev->dev), aml_dma);
b84b5197e344e2 Xianwei Zhao 2026-09-03  680  	if (ret)
b84b5197e344e2 Xianwei Zhao 2026-09-03  681  		return dev_err_probe(&pdev->dev, ret, "failed to register irq\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  682  
b84b5197e344e2 Xianwei Zhao 2026-09-03  683  	ret = dmaenginem_async_device_register(dma_dev);
b84b5197e344e2 Xianwei Zhao 2026-09-03  684  	if (ret)
b84b5197e344e2 Xianwei Zhao 2026-09-03  685  		return dev_err_probe(&pdev->dev, ret, "failed to register dmaenginem\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  686  
b84b5197e344e2 Xianwei Zhao 2026-09-03  687  	ret = of_dma_controller_register(np, aml_of_dma_xlate, aml_dma);
b84b5197e344e2 Xianwei Zhao 2026-09-03  688  	if (ret)
b84b5197e344e2 Xianwei Zhao 2026-09-03  689  		return dev_err_probe(&pdev->dev, ret, "failed to register xlate\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  690  
b84b5197e344e2 Xianwei Zhao 2026-09-03  691  	platform_set_drvdata(pdev, aml_dma);
b84b5197e344e2 Xianwei Zhao 2026-09-03  692  
b84b5197e344e2 Xianwei Zhao 2026-09-03  693  	return 0;
b84b5197e344e2 Xianwei Zhao 2026-09-03  694  }
b84b5197e344e2 Xianwei Zhao 2026-09-03  695  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
