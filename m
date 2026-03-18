Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ECA246783
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 06:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773816579; cv=none; b=rOYZBNg+BKqHI1ufXX/Szn4gu4RD+xvuUuskvwKKFp0gCp3A5JQe3kJ6k4RCuk+FsOKqyzZKKp2JSd2m2PJ7/ZdkWWZwzSS6EdUQFiQtbn8ncU8V1BCKHqguWWvIMT1atQOFX+eAiqTYMX+4f+BE3p6JQlQpjPaQG02HjjcGnJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773816579; c=relaxed/simple;
	bh=O3iShPKyh1//SjpzgaXfOLdi3SAAEBUzHgNG3KEDwYw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HRk6JKdNNIzOqoj5ilGuoFOOP4knFu2iBS1+NiQhyhF8lKpI3ubYjpPONo5PY1KWgW/B/h5H8Kr3avvwgq2FTvOHYzJjAanSnNqpRb/4FxHWoXWVsIxhmTySqTTG7i1lXwmDWDWMwNz9SQtrQVYaDx0WNFxSTusEZRikYGW8fsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWxE+v5H; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWxE+v5H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773816577; x=1805352577;
  h=date:from:to:cc:subject:message-id;
  bh=O3iShPKyh1//SjpzgaXfOLdi3SAAEBUzHgNG3KEDwYw=;
  b=GWxE+v5HpOaFc3/WFtIj5J3lkHRNkeT/EN+uSp9/x3tAZWcD74fS3uR8
   oKnXf35UDaxr0an4zpKXu8tGuveyGX5/gtqsrXq5y+ikHWplWNH4OTF8g
   Z5O9O6bTXS/6FOxw0V7EsWloWISx4P1UG9opo9JD/Y62qL8VOrdLti1Re
   MOYV7piWOs+u95jlIe06Y4VCCTyivhN2xuTtfu1wDYsFF7xslLxynRy7m
   oDY6P6hweBXQExs/yUbyNNcrnoq5F3sglq9XK5w4+RAkJb6VnXXTSJHMs
   VjC592HjCST6Zu94tiWW2nS1MCaSGr6ommP1VjMkCA6V7zSLCU5fTmo+D
   g==;
X-CSE-ConnectionGUID: JEVMR8MtTC6lKXoIqVPCMw==
X-CSE-MsgGUID: 229L0jOyTG6QltlZhvncow==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92246096"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="92246096"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 23:49:36 -0700
X-CSE-ConnectionGUID: TfoywjlcSRa6GxzYJx74/g==
X-CSE-MsgGUID: iJQH0z/JQd6xZSAveYoMdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="224617518"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Mar 2026 23:49:34 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2kih-000000002db-3eNI;
	Wed, 18 Mar 2026 06:49:31 +0000
Date: Wed, 18 Mar 2026 14:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6796/6828]
 drivers/dma/loongson/loongson2-apb-cmc-dma.c:677:34: sparse: sparse: unsigned
 value that used to be signed checked against zero?
Message-ID: <202603181427.pQvuVk3i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/dma/loongson/loongson2-apb-cmc-dma.c:677:34: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vinod Koul <vkoul@kernel.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
commit: ce6c5e3a0777401434fb9a06fcc0670354276639 [6796/6828] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git
:::::: branch date: 14 hours ago
:::::: commit date: 15 hours ago
config: alpha-randconfig-r111-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181427.pQvuVk3i-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181427.pQvuVk3i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603181427.pQvuVk3i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/loongson/loongson2-apb-cmc-dma.c:677:34: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/dma/loongson/loongson2-apb-cmc-dma.c:676:46: sparse: signed value source

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

:::::: The code at line 677 was first introduced by commit
:::::: 1c0028e725f156ebabe68b0025f9c8e7a6170ffd dmaengine: loongson: New driver for the Loongson Multi-Channel DMA controller

:::::: TO: Binbin Zhou <zhoubinbin@loongson.cn>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
