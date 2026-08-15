Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F0330C366
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786805573; cv=none; b=ryAeRlIvE42hHK64/701ANg+6LPm1E8cLp48AYVBUWiOVjA0nGaVGO6he+4fwJOkd43sKhbgeTSa1BkoSCNI/CfqDdaAzBxRezICCuTo5zf22UQIaWtzurYgAaksen2sM06mBUdYM4KBOZtEzLcb5Z1XkfMgPtAAZE5eparQTbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786805573; c=relaxed/simple;
	bh=jGF71ak2MGmAIaVGKbYF+jtN0hsuQ/8jQV4QrEykfP4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WCRwbjz47kbrRfNM3C9UQDMlwCby7nyCBseRtjzmuWMYMEIKQ73Zwr2l5zPZMQwGAspUlQCb8YccL/83ZAB1dqgqS92Nbe8JWGTYId7SW6T4rUauOXF2g0h4zOK9lyJ7uEN8oON2MyhN5JKHYyPsiyr39zSWTw6VeMHE7ZSCrQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtQVFfsr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtQVFfsr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786805570; x=1818341570;
  h=date:from:to:cc:subject:message-id;
  bh=jGF71ak2MGmAIaVGKbYF+jtN0hsuQ/8jQV4QrEykfP4=;
  b=NtQVFfsrLB80FQS/J0z3RtPgpiGfFVP1Vh9w8mAhAtjDqIezUTEwU8jy
   j95oRtBE+Rjwp0dWpcLok48Wnvher9CG/OnMZGht8ZAfnbpMBeFJ6rvU4
   VDJ6pdR5JJx+uWL4fjThRLnNMDxALcnkH30IYN7eswBvtB3sLNKXHfLVX
   wU9IvRkmL22t2Gmy/UirePHqS43GEX2PWCkkOhyR2tm0vxrYeikjggqFC
   XYCgn6GHpKM9yK/1YguZdK0pU/PU8xqq8wMEinBvQF4wlIi+r6ME3k7K1
   QHoNHNO/ekTzB4+Q4/LsLq6bgN+o9WBYCKqtDk1M8x52hMMTbAKT/xOuL
   g==;
X-CSE-ConnectionGUID: UBkj/EYnR6SG6uGgyx0aOQ==
X-CSE-MsgGUID: hnxQnKcRR2OKpGj6CeUtsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="86314644"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="86314644"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 07:52:49 -0700
X-CSE-ConnectionGUID: tXzfNCqjRCmoJTWGzBdVsA==
X-CSE-MsgGUID: b9AILPQXTPKWAnVdnlQq6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="258278611"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Aug 2026 07:52:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvFkb-00000000cGc-3XCS;
	Sat, 15 Aug 2026 14:52:45 +0000
Date: Sat, 15 Aug 2026 22:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma/loongson/loongson2-apb-cmc-dma.c:677:6-16:
 WARNING: Unsigned expression compared with zero: lchan -> irq < 0
Message-ID: <202608152230.p20WPlS0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Binbin Zhou <zhoubinbin@loongson.cn>
CC: Vinod Koul <vkoul@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>
CC: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   15ef2f78c49d20d53ec7c0f1c9b40b02e089f2d6
commit: 1c0028e725f156ebabe68b0025f9c8e7a6170ffd dmaengine: loongson: New driver for the Loongson Multi-Channel DMA controller
date:   5 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 months ago
config: powerpc-randconfig-r053-20260812 (https://download.01.org/0day-ci/archive/20260815/202608152230.p20WPlS0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1c0028e725f1 ("dmaengine: loongson: New driver for the Loongson Multi-Channel DMA controller")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608152230.p20WPlS0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/loongson/loongson2-apb-cmc-dma.c:677:6-16: WARNING: Unsigned expression compared with zero: lchan -> irq < 0

vim +677 drivers/dma/loongson/loongson2-apb-cmc-dma.c

1c0028e725f156 Binbin Zhou 2026-03-07  601  
1c0028e725f156 Binbin Zhou 2026-03-07  602  static int loongson2_cmc_dma_probe(struct platform_device *pdev)
1c0028e725f156 Binbin Zhou 2026-03-07  603  {
1c0028e725f156 Binbin Zhou 2026-03-07  604  	const struct loongson2_cmc_dma_config *config;
1c0028e725f156 Binbin Zhou 2026-03-07  605  	struct loongson2_cmc_dma_chan *lchan;
1c0028e725f156 Binbin Zhou 2026-03-07  606  	struct loongson2_cmc_dma_dev *lddev;
1c0028e725f156 Binbin Zhou 2026-03-07  607  	struct device *dev = &pdev->dev;
1c0028e725f156 Binbin Zhou 2026-03-07  608  	struct dma_device *ddev;
1c0028e725f156 Binbin Zhou 2026-03-07  609  	u32 nr_chans, i;
1c0028e725f156 Binbin Zhou 2026-03-07  610  	int ret;
1c0028e725f156 Binbin Zhou 2026-03-07  611  
1c0028e725f156 Binbin Zhou 2026-03-07  612  	config = (const struct loongson2_cmc_dma_config *)device_get_match_data(dev);
1c0028e725f156 Binbin Zhou 2026-03-07  613  	if (!config)
1c0028e725f156 Binbin Zhou 2026-03-07  614  		return -EINVAL;
1c0028e725f156 Binbin Zhou 2026-03-07  615  
1c0028e725f156 Binbin Zhou 2026-03-07  616  	ret = device_property_read_u32(dev, "dma-channels", &nr_chans);
1c0028e725f156 Binbin Zhou 2026-03-07  617  	if (ret || nr_chans > config->max_channels) {
1c0028e725f156 Binbin Zhou 2026-03-07  618  		dev_err(dev, "missing or invalid dma-channels property\n");
1c0028e725f156 Binbin Zhou 2026-03-07  619  		nr_chans = config->max_channels;
1c0028e725f156 Binbin Zhou 2026-03-07  620  	}
1c0028e725f156 Binbin Zhou 2026-03-07  621  
1c0028e725f156 Binbin Zhou 2026-03-07  622  	lddev = devm_kzalloc(dev, struct_size(lddev, chan, nr_chans), GFP_KERNEL);
1c0028e725f156 Binbin Zhou 2026-03-07  623  	if (!lddev)
1c0028e725f156 Binbin Zhou 2026-03-07  624  		return -ENOMEM;
1c0028e725f156 Binbin Zhou 2026-03-07  625  
1c0028e725f156 Binbin Zhou 2026-03-07  626  	lddev->base = devm_platform_ioremap_resource(pdev, 0);
1c0028e725f156 Binbin Zhou 2026-03-07  627  	if (IS_ERR(lddev->base))
1c0028e725f156 Binbin Zhou 2026-03-07  628  		return PTR_ERR(lddev->base);
1c0028e725f156 Binbin Zhou 2026-03-07  629  
1c0028e725f156 Binbin Zhou 2026-03-07  630  	platform_set_drvdata(pdev, lddev);
1c0028e725f156 Binbin Zhou 2026-03-07  631  	lddev->nr_channels = nr_chans;
1c0028e725f156 Binbin Zhou 2026-03-07  632  	lddev->chan_reg_offset = config->chan_reg_offset;
1c0028e725f156 Binbin Zhou 2026-03-07  633  
1c0028e725f156 Binbin Zhou 2026-03-07  634  	lddev->dma_clk = devm_clk_get_optional_enabled(dev, NULL);
1c0028e725f156 Binbin Zhou 2026-03-07  635  	if (IS_ERR(lddev->dma_clk))
1c0028e725f156 Binbin Zhou 2026-03-07  636  		return dev_err_probe(dev, PTR_ERR(lddev->dma_clk), "Failed to get dma clock\n");
1c0028e725f156 Binbin Zhou 2026-03-07  637  
1c0028e725f156 Binbin Zhou 2026-03-07  638  	ddev = &lddev->ddev;
1c0028e725f156 Binbin Zhou 2026-03-07  639  	ddev->dev = dev;
1c0028e725f156 Binbin Zhou 2026-03-07  640  
1c0028e725f156 Binbin Zhou 2026-03-07  641  	dma_cap_zero(ddev->cap_mask);
1c0028e725f156 Binbin Zhou 2026-03-07  642  	dma_cap_set(DMA_SLAVE, ddev->cap_mask);
1c0028e725f156 Binbin Zhou 2026-03-07  643  	dma_cap_set(DMA_PRIVATE, ddev->cap_mask);
1c0028e725f156 Binbin Zhou 2026-03-07  644  	dma_cap_set(DMA_CYCLIC, ddev->cap_mask);
1c0028e725f156 Binbin Zhou 2026-03-07  645  
1c0028e725f156 Binbin Zhou 2026-03-07  646  	ddev->device_free_chan_resources = loongson2_cmc_dma_free_chan_resources;
1c0028e725f156 Binbin Zhou 2026-03-07  647  	ddev->device_config = loongson2_cmc_dma_slave_config;
1c0028e725f156 Binbin Zhou 2026-03-07  648  	ddev->device_prep_slave_sg = loongson2_cmc_dma_prep_slave_sg;
1c0028e725f156 Binbin Zhou 2026-03-07  649  	ddev->device_prep_dma_cyclic = loongson2_cmc_dma_prep_dma_cyclic;
1c0028e725f156 Binbin Zhou 2026-03-07  650  	ddev->device_issue_pending = loongson2_cmc_dma_issue_pending;
1c0028e725f156 Binbin Zhou 2026-03-07  651  	ddev->device_synchronize = loongson2_cmc_dma_synchronize;
1c0028e725f156 Binbin Zhou 2026-03-07  652  	ddev->device_tx_status = loongson2_cmc_dma_tx_status;
1c0028e725f156 Binbin Zhou 2026-03-07  653  	ddev->device_terminate_all = loongson2_cmc_dma_terminate_all;
1c0028e725f156 Binbin Zhou 2026-03-07  654  
1c0028e725f156 Binbin Zhou 2026-03-07  655  	ddev->max_sg_burst = LOONSON2_CMCDMA_MAX_DATA_ITEMS;
1c0028e725f156 Binbin Zhou 2026-03-07  656  	ddev->src_addr_widths = LOONGSON2_CMCDMA_BUSWIDTHS;
1c0028e725f156 Binbin Zhou 2026-03-07  657  	ddev->dst_addr_widths = LOONGSON2_CMCDMA_BUSWIDTHS;
1c0028e725f156 Binbin Zhou 2026-03-07  658  	ddev->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
1c0028e725f156 Binbin Zhou 2026-03-07  659  	INIT_LIST_HEAD(&ddev->channels);
1c0028e725f156 Binbin Zhou 2026-03-07  660  
1c0028e725f156 Binbin Zhou 2026-03-07  661  	for (i = 0; i < nr_chans; i++) {
1c0028e725f156 Binbin Zhou 2026-03-07  662  		lchan = &lddev->chan[i];
1c0028e725f156 Binbin Zhou 2026-03-07  663  
1c0028e725f156 Binbin Zhou 2026-03-07  664  		lchan->id = i;
1c0028e725f156 Binbin Zhou 2026-03-07  665  		lchan->vchan.desc_free = loongson2_cmc_dma_desc_free;
1c0028e725f156 Binbin Zhou 2026-03-07  666  		vchan_init(&lchan->vchan, ddev);
1c0028e725f156 Binbin Zhou 2026-03-07  667  	}
1c0028e725f156 Binbin Zhou 2026-03-07  668  
1c0028e725f156 Binbin Zhou 2026-03-07  669  	ret = dmaenginem_async_device_register(ddev);
1c0028e725f156 Binbin Zhou 2026-03-07  670  	if (ret)
1c0028e725f156 Binbin Zhou 2026-03-07  671  		return dev_err_probe(dev, ret, "Failed to register DMA engine device.\n");
1c0028e725f156 Binbin Zhou 2026-03-07  672  
1c0028e725f156 Binbin Zhou 2026-03-07  673  	for (i = 0; i < nr_chans; i++) {
1c0028e725f156 Binbin Zhou 2026-03-07  674  		lchan = &lddev->chan[i];
1c0028e725f156 Binbin Zhou 2026-03-07  675  
1c0028e725f156 Binbin Zhou 2026-03-07  676  		lchan->irq = platform_get_irq(pdev, i);
1c0028e725f156 Binbin Zhou 2026-03-07 @677  		if (lchan->irq < 0)
1c0028e725f156 Binbin Zhou 2026-03-07  678  			return lchan->irq;
1c0028e725f156 Binbin Zhou 2026-03-07  679  
1c0028e725f156 Binbin Zhou 2026-03-07  680  		ret = devm_request_irq(dev, lchan->irq, loongson2_cmc_dma_chan_irq, IRQF_SHARED,
1c0028e725f156 Binbin Zhou 2026-03-07  681  				       dev_name(chan2dev(lchan)), lchan);
1c0028e725f156 Binbin Zhou 2026-03-07  682  		if (ret)
1c0028e725f156 Binbin Zhou 2026-03-07  683  			return ret;
1c0028e725f156 Binbin Zhou 2026-03-07  684  	}
1c0028e725f156 Binbin Zhou 2026-03-07  685  
1c0028e725f156 Binbin Zhou 2026-03-07  686  	ret = loongson2_cmc_dma_acpi_controller_register(lddev);
1c0028e725f156 Binbin Zhou 2026-03-07  687  	if (ret)
1c0028e725f156 Binbin Zhou 2026-03-07  688  		return dev_err_probe(dev, ret, "Failed to register dma controller with ACPI.\n");
1c0028e725f156 Binbin Zhou 2026-03-07  689  
1c0028e725f156 Binbin Zhou 2026-03-07  690  	ret = loongson2_cmc_dma_of_controller_register(lddev);
1c0028e725f156 Binbin Zhou 2026-03-07  691  	if (ret)
1c0028e725f156 Binbin Zhou 2026-03-07  692  		return dev_err_probe(dev, ret, "Failed to register dma controller with FDT.\n");
1c0028e725f156 Binbin Zhou 2026-03-07  693  
1c0028e725f156 Binbin Zhou 2026-03-07  694  	dev_info(dev, "Loongson-2 Multi-Channel DMA Controller registered successfully.\n");
1c0028e725f156 Binbin Zhou 2026-03-07  695  
1c0028e725f156 Binbin Zhou 2026-03-07  696  	return 0;
1c0028e725f156 Binbin Zhou 2026-03-07  697  }
1c0028e725f156 Binbin Zhou 2026-03-07  698  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
