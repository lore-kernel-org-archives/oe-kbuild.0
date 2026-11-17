Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888522;
	b=fbKx2qnqI9Tyx+/Q5W1eJChd6ByRYC3sQND1kpQXDeU4U9IVL9fLD4JOYA3+RARUFtI0
	 1QPuzi4DiNwn6LJ22vyvforcBMf8vB3fHR5UEcr0K6ejb2LUnfi/NPfgXCcmz7hDTVRCj
	 qSAlN7icreK8WHk1QK64G4pPOWBJicLrPHMe5qbWykpx0nK/KI89YaAnR8UPR1hYAg2HZ
	 Zbc9zXg3l724AaoY12/sHsiSVE85NNkGRDVwIBQG+7rt1PiIyvdb+hzvVI8K3Ugbp8zzg
	 DuraIkhTNu3aka4ze7Oo1IVXO6fpZLv4dGoU/yWuUsbiSmOt1CgSoN2LQsrinzIN9/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888522;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BMn4uceK92hv2Z6X46+56K3dSj863w7lr+rbnvqf8Ys=;
	b=lhHAsOB+DJozTRPzs5EtMBsvRBYU9Mx0DD0BePp4v+8Ee1klBkmPIBLZ0QkdQWPFWiYU
	 U5eSYD8FtlOFrLFKtpa/k+46ipgPtCgLY9wL1RGTdhntZmynMAayKpnLnnd78C5Kptvvs
	 3U8KldH8CnlCcmOnxISYfao88gKdej+NDPUfFLCYYYhm1+kIGf3AmQDIMbcl5AvVBBIF0
	 v/hbxlDRUN0ZzpwG9bi1ff8aa83P0ZTQFm0sztzv3KPLHuJcbqHJHT3MhjKmC1pljNmOg
	 VZ5UG1FqCQdKN97FICLh5hqOhesaz8Mp1s4oKIMcdidLFJUiASSJn4PzFGuqOs61n0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aRgxmlHX;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6421D606A331
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 04:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6421D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aRgxmlHX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794888520; x=1826424520;
  h=date:from:to:cc:subject:message-id;
  bh=xCqoY4PkfNh0gBYI7aLrUKogjMHwStSQ9M51DDkxmSw=;
  b=aRgxmlHXmLStYlCmsmWM9WAvQmpCyG6o74YPAB5NKtvlsJx2ZrfCGdKn
   py7AoT5WEcvjke16ItcNvSROfZhoCUjZ3l48tH8NhKjhPkBcxeiFdMz3F
   AvgnjTtbUTeJ7E5z6MYvq5rewEFEovG5VMU7Xqsvi/4zLhHXIVMkRXR3s
   1z5qRMvQItD176XByTvlxFP2CPedFgnXIbalJj/gBR0VXsVgpyEyeX2o+
   ZvwSiqvwXAfTtl94v2161G2/hPv3CLRCg9HALlVYSDhzfju8bQlBZH3dA
   wgtYgR53s4/3VXX+M13t2m7stN36zrGKJcu/Z7coiXYjptMQBTGwMANqM
   Q==;
X-CSE-ConnectionGUID: lp11dPg0QxC6oEPJZL9z3g==
X-CSE-MsgGUID: WOVJ6qeaR4KEcrsmuAOjiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3541319"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3541319"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 20:08:39 -0800
X-CSE-ConnectionGUID: cv9yxhDoRZK1aN8BbKoCGQ==
X-CSE-MsgGUID: lsTiSUfCT5KYLXpRXcgZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9847477"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 16 Nov 2026 20:08:38 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTAUk-000000002xY-2uQu;
	Tue, 17 Nov 2026 04:08:34 +0000
Date: Tue, 17 Nov 2026 05:07:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma/bcm2835-dma.c:994:36-37: WARNING opportunity for
 min()
Message-ID: <202611170559.WE9Vzy0G-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Johan Hovold <johan@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: d3e1935fba8d71ef1889cbc2d6e2447cb829070f dmaengine: bcm2835: enable compile testing
date:   12 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-r2109-20261116 (https://download.01.org/0day-ci/archive/20261117/202611170559.WE9Vzy0G-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5637411ce5dc86d0b7f87cde0f7ee47406d29db6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d3e1935fba8d ("dmaengine: bcm2835: enable compile testing")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611170559.WE9Vzy0G-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/bcm2835-dma.c:994:36-37: WARNING opportunity for min()

vim +994 drivers/dma/bcm2835-dma.c

9602a843cb3a16 Stefan Wahren  2024-12-04   898  
96286b57669073 Florian Meier  2014-01-06   899  static int bcm2835_dma_probe(struct platform_device *pdev)
96286b57669073 Florian Meier  2014-01-06   900  {
96286b57669073 Florian Meier  2014-01-06   901  	struct bcm2835_dmadev *od;
96286b57669073 Florian Meier  2014-01-06   902  	void __iomem *base;
96286b57669073 Florian Meier  2014-01-06   903  	int rc;
e2eca6389b031c Martin Sperl   2016-04-11   904  	int i, j;
e2eca6389b031c Martin Sperl   2016-04-11   905  	int irq[BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED + 1];
e2eca6389b031c Martin Sperl   2016-04-11   906  	int irq_flags;
96286b57669073 Florian Meier  2014-01-06   907  	uint32_t chans_available;
e2eca6389b031c Martin Sperl   2016-04-11   908  	char chan_name[BCM2835_DMA_CHAN_NAME_SIZE];
96286b57669073 Florian Meier  2014-01-06   909  
96286b57669073 Florian Meier  2014-01-06   910  	if (!pdev->dev.dma_mask)
96286b57669073 Florian Meier  2014-01-06   911  		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
96286b57669073 Florian Meier  2014-01-06   912  
96286b57669073 Florian Meier  2014-01-06   913  	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
72503b25ee3638 Stefan Wahren  2019-07-16   914  	if (rc) {
72503b25ee3638 Stefan Wahren  2019-07-16   915  		dev_err(&pdev->dev, "Unable to set DMA mask\n");
96286b57669073 Florian Meier  2014-01-06   916  		return rc;
72503b25ee3638 Stefan Wahren  2019-07-16   917  	}
96286b57669073 Florian Meier  2014-01-06   918  
96286b57669073 Florian Meier  2014-01-06   919  	od = devm_kzalloc(&pdev->dev, sizeof(*od), GFP_KERNEL);
96286b57669073 Florian Meier  2014-01-06   920  	if (!od)
96286b57669073 Florian Meier  2014-01-06   921  		return -ENOMEM;
96286b57669073 Florian Meier  2014-01-06   922  
96286b57669073 Florian Meier  2014-01-06   923  	dma_set_max_seg_size(&pdev->dev, 0x3FFFFFFF);
96286b57669073 Florian Meier  2014-01-06   924  
4b23603a251d24 Tudor Ambarus  2022-11-10   925  	base = devm_platform_ioremap_resource(pdev, 0);
96286b57669073 Florian Meier  2014-01-06   926  	if (IS_ERR(base))
96286b57669073 Florian Meier  2014-01-06   927  		return PTR_ERR(base);
96286b57669073 Florian Meier  2014-01-06   928  
96286b57669073 Florian Meier  2014-01-06   929  	od->base = base;
96286b57669073 Florian Meier  2014-01-06   930  
96286b57669073 Florian Meier  2014-01-06   931  	dma_cap_set(DMA_SLAVE, od->ddev.cap_mask);
7f5ae3553685d5 Florian Meier  2014-01-17   932  	dma_cap_set(DMA_PRIVATE, od->ddev.cap_mask);
96286b57669073 Florian Meier  2014-01-06   933  	dma_cap_set(DMA_CYCLIC, od->ddev.cap_mask);
d9f094a02f3051 Martin Sperl   2016-03-16   934  	dma_cap_set(DMA_MEMCPY, od->ddev.cap_mask);
96286b57669073 Florian Meier  2014-01-06   935  	od->ddev.device_alloc_chan_resources = bcm2835_dma_alloc_chan_resources;
96286b57669073 Florian Meier  2014-01-06   936  	od->ddev.device_free_chan_resources = bcm2835_dma_free_chan_resources;
96286b57669073 Florian Meier  2014-01-06   937  	od->ddev.device_tx_status = bcm2835_dma_tx_status;
96286b57669073 Florian Meier  2014-01-06   938  	od->ddev.device_issue_pending = bcm2835_dma_issue_pending;
96286b57669073 Florian Meier  2014-01-06   939  	od->ddev.device_prep_dma_cyclic = bcm2835_dma_prep_dma_cyclic;
388cc7a281c06e Martin Sperl   2016-03-16   940  	od->ddev.device_prep_slave_sg = bcm2835_dma_prep_slave_sg;
d9f094a02f3051 Martin Sperl   2016-03-16   941  	od->ddev.device_prep_dma_memcpy = bcm2835_dma_prep_dma_memcpy;
39159bea78ed05 Maxime Ripard  2014-11-17   942  	od->ddev.device_config = bcm2835_dma_slave_config;
39159bea78ed05 Maxime Ripard  2014-11-17   943  	od->ddev.device_terminate_all = bcm2835_dma_terminate_all;
de92436ac40ffe Peter Ujfalusi 2017-11-14   944  	od->ddev.device_synchronize = bcm2835_dma_synchronize;
b574368024670a Maxime Ripard  2014-11-17   945  	od->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
b574368024670a Maxime Ripard  2014-11-17   946  	od->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
d9f094a02f3051 Martin Sperl   2016-03-16   947  	od->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV) |
d9f094a02f3051 Martin Sperl   2016-03-16   948  			      BIT(DMA_MEM_TO_MEM);
0fa5867e6a2c61 Martin Sperl   2016-03-16   949  	od->ddev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
6f6869dc97e865 Lukas Wunner   2019-09-11   950  	od->ddev.descriptor_reuse = true;
96286b57669073 Florian Meier  2014-01-06   951  	od->ddev.dev = &pdev->dev;
96286b57669073 Florian Meier  2014-01-06   952  	INIT_LIST_HEAD(&od->ddev.channels);
96286b57669073 Florian Meier  2014-01-06   953  
96286b57669073 Florian Meier  2014-01-06   954  	platform_set_drvdata(pdev, od);
96286b57669073 Florian Meier  2014-01-06   955  
bf75703d0912da Lukas Wunner   2019-09-11   956  	od->zero_page = dma_map_page_attrs(od->ddev.dev, ZERO_PAGE(0), 0,
bf75703d0912da Lukas Wunner   2019-09-11   957  					   PAGE_SIZE, DMA_TO_DEVICE,
bf75703d0912da Lukas Wunner   2019-09-11   958  					   DMA_ATTR_SKIP_CPU_SYNC);
bf75703d0912da Lukas Wunner   2019-09-11   959  	if (dma_mapping_error(od->ddev.dev, od->zero_page)) {
bf75703d0912da Lukas Wunner   2019-09-11   960  		dev_err(&pdev->dev, "Failed to map zero page\n");
bf75703d0912da Lukas Wunner   2019-09-11   961  		return -ENOMEM;
bf75703d0912da Lukas Wunner   2019-09-11   962  	}
bf75703d0912da Lukas Wunner   2019-09-11   963  
96286b57669073 Florian Meier  2014-01-06   964  	/* Request DMA channel mask from device tree */
96286b57669073 Florian Meier  2014-01-06   965  	if (of_property_read_u32(pdev->dev.of_node,
96286b57669073 Florian Meier  2014-01-06   966  			"brcm,dma-channel-mask",
96286b57669073 Florian Meier  2014-01-06   967  			&chans_available)) {
96286b57669073 Florian Meier  2014-01-06   968  		dev_err(&pdev->dev, "Failed to get channel mask\n");
96286b57669073 Florian Meier  2014-01-06   969  		rc = -EINVAL;
96286b57669073 Florian Meier  2014-01-06   970  		goto err_no_dma;
96286b57669073 Florian Meier  2014-01-06   971  	}
96286b57669073 Florian Meier  2014-01-06   972  
e2eca6389b031c Martin Sperl   2016-04-11   973  	/* get irqs for each channel that we support */
e2eca6389b031c Martin Sperl   2016-04-11   974  	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
e2eca6389b031c Martin Sperl   2016-04-11   975  		/* skip masked out channels */
e2eca6389b031c Martin Sperl   2016-04-11   976  		if (!(chans_available & (1 << i))) {
e2eca6389b031c Martin Sperl   2016-04-11   977  			irq[i] = -1;
e2eca6389b031c Martin Sperl   2016-04-11   978  			continue;
e2eca6389b031c Martin Sperl   2016-04-11   979  		}
e2eca6389b031c Martin Sperl   2016-04-11   980  
e2eca6389b031c Martin Sperl   2016-04-11   981  		/* get the named irq */
e2eca6389b031c Martin Sperl   2016-04-11   982  		snprintf(chan_name, sizeof(chan_name), "dma%i", i);
e2eca6389b031c Martin Sperl   2016-04-11   983  		irq[i] = platform_get_irq_byname(pdev, chan_name);
e2eca6389b031c Martin Sperl   2016-04-11   984  		if (irq[i] >= 0)
e2eca6389b031c Martin Sperl   2016-04-11   985  			continue;
e2eca6389b031c Martin Sperl   2016-04-11   986  
e2eca6389b031c Martin Sperl   2016-04-11   987  		/* legacy device tree case handling */
e2eca6389b031c Martin Sperl   2016-04-11   988  		dev_warn_once(&pdev->dev,
0eef727a47c5ea Martin Sperl   2016-04-22   989  			      "missing interrupt-names property in device tree - legacy interpretation is used\n");
e2eca6389b031c Martin Sperl   2016-04-11   990  		/*
e2eca6389b031c Martin Sperl   2016-04-11   991  		 * in case of channel >= 11
e2eca6389b031c Martin Sperl   2016-04-11   992  		 * use the 11th interrupt and that is shared
e2eca6389b031c Martin Sperl   2016-04-11   993  		 */
e2eca6389b031c Martin Sperl   2016-04-11  @994  		irq[i] = platform_get_irq(pdev, i < 11 ? i : 11);
e2eca6389b031c Martin Sperl   2016-04-11   995  	}
e2eca6389b031c Martin Sperl   2016-04-11   996  
e2eca6389b031c Martin Sperl   2016-04-11   997  	/* get irqs for each channel */
e2eca6389b031c Martin Sperl   2016-04-11   998  	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
e2eca6389b031c Martin Sperl   2016-04-11   999  		/* skip channels without irq */
e2eca6389b031c Martin Sperl   2016-04-11  1000  		if (irq[i] < 0)
e2eca6389b031c Martin Sperl   2016-04-11  1001  			continue;
e2eca6389b031c Martin Sperl   2016-04-11  1002  
e2eca6389b031c Martin Sperl   2016-04-11  1003  		/* check if there are other channels that also use this irq */
e2eca6389b031c Martin Sperl   2016-04-11  1004  		irq_flags = 0;
e2eca6389b031c Martin Sperl   2016-04-11  1005  		for (j = 0; j <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; j++)
e2eca6389b031c Martin Sperl   2016-04-11  1006  			if ((i != j) && (irq[j] == irq[i])) {
e2eca6389b031c Martin Sperl   2016-04-11  1007  				irq_flags = IRQF_SHARED;
96286b57669073 Florian Meier  2014-01-06  1008  				break;
e2eca6389b031c Martin Sperl   2016-04-11  1009  			}
96286b57669073 Florian Meier  2014-01-06  1010  
e2eca6389b031c Martin Sperl   2016-04-11  1011  		/* initialize the channel */
e2eca6389b031c Martin Sperl   2016-04-11  1012  		rc = bcm2835_dma_chan_init(od, i, irq[i], irq_flags);
96286b57669073 Florian Meier  2014-01-06  1013  		if (rc)
96286b57669073 Florian Meier  2014-01-06  1014  			goto err_no_dma;
96286b57669073 Florian Meier  2014-01-06  1015  	}
96286b57669073 Florian Meier  2014-01-06  1016  
96286b57669073 Florian Meier  2014-01-06  1017  	dev_dbg(&pdev->dev, "Initialized %i DMA channels\n", i);
96286b57669073 Florian Meier  2014-01-06  1018  
96286b57669073 Florian Meier  2014-01-06  1019  	/* Device-tree DMA controller registration */
96286b57669073 Florian Meier  2014-01-06  1020  	rc = of_dma_controller_register(pdev->dev.of_node,
96286b57669073 Florian Meier  2014-01-06  1021  			bcm2835_dma_xlate, od);
96286b57669073 Florian Meier  2014-01-06  1022  	if (rc) {
96286b57669073 Florian Meier  2014-01-06  1023  		dev_err(&pdev->dev, "Failed to register DMA controller\n");
96286b57669073 Florian Meier  2014-01-06  1024  		goto err_no_dma;
96286b57669073 Florian Meier  2014-01-06  1025  	}
96286b57669073 Florian Meier  2014-01-06  1026  
96286b57669073 Florian Meier  2014-01-06  1027  	rc = dma_async_device_register(&od->ddev);
96286b57669073 Florian Meier  2014-01-06  1028  	if (rc) {
96286b57669073 Florian Meier  2014-01-06  1029  		dev_err(&pdev->dev,
96286b57669073 Florian Meier  2014-01-06  1030  			"Failed to register slave DMA engine device: %d\n", rc);
96286b57669073 Florian Meier  2014-01-06  1031  		goto err_no_dma;
96286b57669073 Florian Meier  2014-01-06  1032  	}
96286b57669073 Florian Meier  2014-01-06  1033  
96286b57669073 Florian Meier  2014-01-06  1034  	dev_dbg(&pdev->dev, "Load BCM2835 DMA engine driver\n");
96286b57669073 Florian Meier  2014-01-06  1035  
96286b57669073 Florian Meier  2014-01-06  1036  	return 0;
96286b57669073 Florian Meier  2014-01-06  1037  
96286b57669073 Florian Meier  2014-01-06  1038  err_no_dma:
96286b57669073 Florian Meier  2014-01-06  1039  	bcm2835_dma_free(od);
96286b57669073 Florian Meier  2014-01-06  1040  	return rc;
96286b57669073 Florian Meier  2014-01-06  1041  }
96286b57669073 Florian Meier  2014-01-06  1042  

:::::: The code at line 994 was first introduced by commit
:::::: e2eca6389b031cdbbc4172eee89ce271c00cb672 dmaengine: bcm2835: use platform_get_irq_byname

:::::: TO: Martin Sperl <kernel@martin.sperl.org>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
