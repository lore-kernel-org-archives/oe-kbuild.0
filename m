Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02653CBE6E
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jul 2026 17:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783792450; cv=none; b=n+26dMXoaHf8xz7cv1aPLZBuugFieImWhsBVVphdxu2tMy2JqTwRI8r7h8gHdbmRnEoZ2PqibHbod+sqg1/Um8VG3G40YJu9Dd+LA5wIyLNg6mkB7EjXgcQkkeOe+gZN4BgDSRkBcKOlKluloiambtEc9O9XY82Wx2y4mCbIAyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783792450; c=relaxed/simple;
	bh=iPkTXuH/RguXVyfeTgaw+AJETkyLdJUa6JwkVkWcvKk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fqtz1dd5pVJ46fddz4MJtF8HoeVj8zF+tgNuMyypIApz58gFckxuDJNbDSyAaqotBC/OhgYCnXg4m9dFZZan0CL8mKMFm21jMRIbeg5hpcUz0OBXu5ush/nKAxnavvqWy61TOpBZroqxZs1e6Pxslv/bSmQ/9/mMpuTsVrfXJgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AiHeoQgb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AiHeoQgb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783792447; x=1815328447;
  h=date:from:to:cc:subject:message-id;
  bh=iPkTXuH/RguXVyfeTgaw+AJETkyLdJUa6JwkVkWcvKk=;
  b=AiHeoQgbb03T/fkbmO83OK51f2QTibnMaBWBTSkL6+M7VKEabof55ujG
   hGrYA1VTwu9pA+E7cofcvzFzuhd5RUzqV9Rcb+H0XuBieeOGYk6x8qmWL
   +TwlbItYSZwwcTDMwLUGrpntHsLvXC/a9zidM0p84yODOZX6RdPNHN9TT
   fwGLsK98hDvBOWSvFD7y1fHL4BiTwwBBROdHDtyXRN1KknGYXHh0a/tRO
   +G2U7pUfQ4TfQfu9Ev0JmECqS+W9Ck9sxdv1sfQr2RIi9KIorYtaiI55y
   5LBvjcrck6I1Mgmhf4ZgJHQMBKyT7y3oQw3lxEy9vg4asmvVKqC2Xhxzf
   w==;
X-CSE-ConnectionGUID: 22LKhJYUTEiwaN1BPSqd7g==
X-CSE-MsgGUID: 6b+8rT0xQi6NH3P9XdDHGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88150673"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88150673"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 10:54:07 -0700
X-CSE-ConnectionGUID: tima4OKMRrqmOEZIjB0Rug==
X-CSE-MsgGUID: 1dtwf2OmQLOKZQ1gh2Gw5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254660447"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Jul 2026 10:54:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wibtc-00000000KGC-1zWf;
	Sat, 11 Jul 2026 17:53:54 +0000
Date: Sun, 12 Jul 2026 01:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma/bcm2835-dma.c:994:36-37: WARNING opportunity for
 min()
Message-ID: <202607120109.E43IucLt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Johan Hovold <johan@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>

Hi Johan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd3210c47e8d3ac6b4e9141fc68acc03b38c0ba3
commit: d3e1935fba8d71ef1889cbc2d6e2447cb829070f dmaengine: bcm2835: enable compile testing
date:   8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
config: hexagon-randconfig-r051-20260709 (https://download.01.org/0day-ci/archive/20260712/202607120109.E43IucLt-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d3e1935fba8d ("dmaengine: bcm2835: enable compile testing")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607120109.E43IucLt-lkp@intel.com/

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
