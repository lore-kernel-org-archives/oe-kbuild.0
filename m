Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9AE33D4E6
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771408729; cv=none; b=nWAE12Wcnj3PhSWrfLIZXeAH+p9moG+osw00YQh4OfOEkBWSivhkLeJfB4NXgtikZZyH7LXaD/8sZMnTeDk2N2J4ao0mc1UortUWYeqMzzZ7OjvaGDlG7LBOPZCIFiGBiyFH23sbfM3DRuQxTw1+57epO5yEB+az9lEuvS09cJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771408729; c=relaxed/simple;
	bh=gLuyoiL+vIZqJCQka9g4OXw0keXH+msM/DHM9plD6xE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uq3a4C27klfNURpGAa8qU0ZwTSgdtvsTXrRt8EPiZENtD/2m6gZqwdJUkgmCHeHoCzzjgumCkdU7baM/weGV/+kxvRM6fC7pOQCQ2w7EzvbE/2g9IlkBFMhWmRPJKtKuiBSB1lKh4vymYiA+ehZ5nYqEc3QzUNZIZKKcSKDwR1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEGRFfjO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEGRFfjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771408728; x=1802944728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gLuyoiL+vIZqJCQka9g4OXw0keXH+msM/DHM9plD6xE=;
  b=FEGRFfjOfV+hj5XvFzCkOSBNjzmj1/sLKqG1JytN/p1fqG5XFYGDE0ZV
   wCnV5gdn0iG9n0f9W6UJ7iayqVukwg8Z/vzPFKSbUVVld8R67GCHgDjaR
   dicY2oMVvTaaolv0ZnOBcKg3FGNY3kLpn1oQBJU78vT87oYeelLRPIkI7
   njt7GNvXEl8KxVZsOo8IQqCenVDETNmmwKoOFiCTHaEZG4zHDJ+494wl6
   IyxJmK55VTr3hKT3tbeWLqbtMpKJT4eD875xN7XaZ/bRgulv130Cmz+Ak
   QmIOA6gp6tw3tns33V08Je9VfPwfedcxMpkcs39sGoUa4qy8lUBaskHaH
   A==;
X-CSE-ConnectionGUID: SigP2VdRQmKtL5jYyJQQFQ==
X-CSE-MsgGUID: gAvU954pS7SYlBAVLpeO6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="82808543"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="82808543"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 01:58:48 -0800
X-CSE-ConnectionGUID: wroWl2UmShqIEOEA0C9TQQ==
X-CSE-MsgGUID: ZlCUa5AwSDO9hvff6UA76Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="214258921"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Feb 2026 01:58:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vseKR-000000012Fs-0p5e;
	Wed, 18 Feb 2026 09:58:43 +0000
Date: Wed, 18 Feb 2026 17:58:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 6/8] dmaengine: tegra: Use iommu-map for stream ID
Message-ID: <202602181757.Amx49qCP-lkp@intel.com>
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
In-Reply-To: <20260217173457.18628-7-akhilrajeev@nvidia.com>
References: <20260217173457.18628-7-akhilrajeev@nvidia.com>
TO: Akhil R <akhilrajeev@nvidia.com>
TO: dmaengine@vger.kernel.org
TO: linux-tegra@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: vkoul@kernel.org
CC: Frank.Li@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: thierry.reding@gmail.com
CC: jonathanh@nvidia.com
CC: p.zabel@pengutronix.de
CC: Akhil R <akhilrajeev@nvidia.com>

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next tegra/for-next linus/master v6.19 next-20260217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-dma-nvidia-tegra186-gpc-dma-Add-iommu-map-property/20260218-014114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260217173457.18628-7-akhilrajeev%40nvidia.com
patch subject: [PATCH 6/8] dmaengine: tegra: Use iommu-map for stream ID
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: sparc64-randconfig-r072-20260218 (https://download.01.org/0day-ci/archive/20260218/202602181757.Amx49qCP-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602181757.Amx49qCP-lkp@intel.com/

smatch warnings:
drivers/dma/tegra186-gpc-dma.c:1543 tegra_dma_probe() warn: missing error code 'ret'

vim +/ret +1543 drivers/dma/tegra186-gpc-dma.c

ee17028009d49f Akhil R         2022-02-25  1403  
ee17028009d49f Akhil R         2022-02-25  1404  static int tegra_dma_probe(struct platform_device *pdev)
ee17028009d49f Akhil R         2022-02-25  1405  {
ee17028009d49f Akhil R         2022-02-25  1406  	const struct tegra_dma_chip_data *cdata = NULL;
43f59d3fa0deca Akhil R         2026-02-17  1407  	struct tegra_dma_channel *tdc;
43f59d3fa0deca Akhil R         2026-02-17  1408  	struct tegra_dma *tdma;
43f59d3fa0deca Akhil R         2026-02-17  1409  	struct dma_chan *chan;
43f59d3fa0deca Akhil R         2026-02-17  1410  	bool use_iommu_map = false;
bf9cd9fef9f155 Jason Gunthorpe 2023-12-07  1411  	unsigned int i;
bf9cd9fef9f155 Jason Gunthorpe 2023-12-07  1412  	u32 stream_id;
ee17028009d49f Akhil R         2022-02-25  1413  	int ret;
ee17028009d49f Akhil R         2022-02-25  1414  
ee17028009d49f Akhil R         2022-02-25  1415  	cdata = of_device_get_match_data(&pdev->dev);
ee17028009d49f Akhil R         2022-02-25  1416  
ee17028009d49f Akhil R         2022-02-25  1417  	tdma = devm_kzalloc(&pdev->dev,
ee17028009d49f Akhil R         2022-02-25  1418  			    struct_size(tdma, channels, cdata->nr_channels),
ee17028009d49f Akhil R         2022-02-25  1419  			    GFP_KERNEL);
ee17028009d49f Akhil R         2022-02-25  1420  	if (!tdma)
ee17028009d49f Akhil R         2022-02-25  1421  		return -ENOMEM;
ee17028009d49f Akhil R         2022-02-25  1422  
ee17028009d49f Akhil R         2022-02-25  1423  	tdma->dev = &pdev->dev;
ee17028009d49f Akhil R         2022-02-25  1424  	tdma->chip_data = cdata;
ee17028009d49f Akhil R         2022-02-25  1425  	platform_set_drvdata(pdev, tdma);
ee17028009d49f Akhil R         2022-02-25  1426  
ee17028009d49f Akhil R         2022-02-25  1427  	tdma->base_addr = devm_platform_ioremap_resource(pdev, 0);
ee17028009d49f Akhil R         2022-02-25  1428  	if (IS_ERR(tdma->base_addr))
ee17028009d49f Akhil R         2022-02-25  1429  		return PTR_ERR(tdma->base_addr);
ee17028009d49f Akhil R         2022-02-25  1430  
7181fb0994bcb9 Akhil R         2026-02-17  1431  	tdma->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, "gpcdma");
ee17028009d49f Akhil R         2022-02-25  1432  	if (IS_ERR(tdma->rst)) {
ee17028009d49f Akhil R         2022-02-25  1433  		return dev_err_probe(&pdev->dev, PTR_ERR(tdma->rst),
ee17028009d49f Akhil R         2022-02-25  1434  			      "Missing controller reset\n");
ee17028009d49f Akhil R         2022-02-25  1435  	}
ee17028009d49f Akhil R         2022-02-25  1436  	reset_control_reset(tdma->rst);
ee17028009d49f Akhil R         2022-02-25  1437  
ee17028009d49f Akhil R         2022-02-25  1438  	tdma->dma_dev.dev = &pdev->dev;
ee17028009d49f Akhil R         2022-02-25  1439  
43f59d3fa0deca Akhil R         2026-02-17  1440  	use_iommu_map = of_property_present(pdev->dev.of_node, "iommu-map");
43f59d3fa0deca Akhil R         2026-02-17  1441  	if (!use_iommu_map) {
bf9cd9fef9f155 Jason Gunthorpe 2023-12-07  1442  		if (!tegra_dev_iommu_get_stream_id(&pdev->dev, &stream_id)) {
ee17028009d49f Akhil R         2022-02-25  1443  			dev_err(&pdev->dev, "Missing iommu stream-id\n");
ee17028009d49f Akhil R         2022-02-25  1444  			return -EINVAL;
ee17028009d49f Akhil R         2022-02-25  1445  		}
43f59d3fa0deca Akhil R         2026-02-17  1446  	}
ee17028009d49f Akhil R         2022-02-25  1447  
3a0c95b61385f5 Akhil R         2022-11-10  1448  	ret = device_property_read_u32(&pdev->dev, "dma-channel-mask",
3a0c95b61385f5 Akhil R         2022-11-10  1449  				       &tdma->chan_mask);
3a0c95b61385f5 Akhil R         2022-11-10  1450  	if (ret) {
3a0c95b61385f5 Akhil R         2022-11-10  1451  		dev_warn(&pdev->dev,
3a0c95b61385f5 Akhil R         2022-11-10  1452  			 "Missing dma-channel-mask property, using default channel mask %#x\n",
3a0c95b61385f5 Akhil R         2022-11-10  1453  			 TEGRA_GPCDMA_DEFAULT_CHANNEL_MASK);
3a0c95b61385f5 Akhil R         2022-11-10  1454  		tdma->chan_mask = TEGRA_GPCDMA_DEFAULT_CHANNEL_MASK;
3a0c95b61385f5 Akhil R         2022-11-10  1455  	}
3a0c95b61385f5 Akhil R         2022-11-10  1456  
ee17028009d49f Akhil R         2022-02-25  1457  	INIT_LIST_HEAD(&tdma->dma_dev.channels);
ee17028009d49f Akhil R         2022-02-25  1458  	for (i = 0; i < cdata->nr_channels; i++) {
43f59d3fa0deca Akhil R         2026-02-17  1459  		tdc = &tdma->channels[i];
ee17028009d49f Akhil R         2022-02-25  1460  
3a0c95b61385f5 Akhil R         2022-11-10  1461  		/* Check for channel mask */
3a0c95b61385f5 Akhil R         2022-11-10  1462  		if (!(tdma->chan_mask & BIT(i)))
3a0c95b61385f5 Akhil R         2022-11-10  1463  			continue;
3a0c95b61385f5 Akhil R         2022-11-10  1464  
461cd3709f266d Akhil R         2022-05-05  1465  		tdc->irq = platform_get_irq(pdev, i);
461cd3709f266d Akhil R         2022-05-05  1466  		if (tdc->irq < 0)
461cd3709f266d Akhil R         2022-05-05  1467  			return tdc->irq;
461cd3709f266d Akhil R         2022-05-05  1468  
3a0c95b61385f5 Akhil R         2022-11-10  1469  		tdc->chan_base_offset = TEGRA_GPCDMA_CHANNEL_BASE_ADDR_OFFSET +
ee17028009d49f Akhil R         2022-02-25  1470  					i * cdata->channel_reg_size;
ee17028009d49f Akhil R         2022-02-25  1471  		snprintf(tdc->name, sizeof(tdc->name), "gpcdma.%d", i);
301b85c6b644e4 Akhil R         2026-02-17  1472  		tdc->regs = cdata->channel_regs;
ee17028009d49f Akhil R         2022-02-25  1473  		tdc->tdma = tdma;
ee17028009d49f Akhil R         2022-02-25  1474  		tdc->id = i;
ee17028009d49f Akhil R         2022-02-25  1475  		tdc->slave_id = -1;
ee17028009d49f Akhil R         2022-02-25  1476  
ee17028009d49f Akhil R         2022-02-25  1477  		vchan_init(&tdc->vc, &tdma->dma_dev);
ee17028009d49f Akhil R         2022-02-25  1478  		tdc->vc.desc_free = tegra_dma_desc_free;
ee17028009d49f Akhil R         2022-02-25  1479  	}
ee17028009d49f Akhil R         2022-02-25  1480  
df0e316ca2f909 Akhil R         2026-02-17  1481  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(cdata->addr_bits));
df0e316ca2f909 Akhil R         2026-02-17  1482  	if (ret) {
df0e316ca2f909 Akhil R         2026-02-17  1483  		dev_err(&pdev->dev, "Failed to set DMA mask: %d\n", ret);
df0e316ca2f909 Akhil R         2026-02-17  1484  		return ret;
df0e316ca2f909 Akhil R         2026-02-17  1485  	}
df0e316ca2f909 Akhil R         2026-02-17  1486  
ee17028009d49f Akhil R         2022-02-25  1487  	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
ee17028009d49f Akhil R         2022-02-25  1488  	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
ee17028009d49f Akhil R         2022-02-25  1489  	dma_cap_set(DMA_MEMCPY, tdma->dma_dev.cap_mask);
ee17028009d49f Akhil R         2022-02-25  1490  	dma_cap_set(DMA_MEMSET, tdma->dma_dev.cap_mask);
ee17028009d49f Akhil R         2022-02-25  1491  	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
ee17028009d49f Akhil R         2022-02-25  1492  
ee17028009d49f Akhil R         2022-02-25  1493  	/*
ee17028009d49f Akhil R         2022-02-25  1494  	 * Only word aligned transfers are supported. Set the copy
ee17028009d49f Akhil R         2022-02-25  1495  	 * alignment shift.
ee17028009d49f Akhil R         2022-02-25  1496  	 */
ee17028009d49f Akhil R         2022-02-25  1497  	tdma->dma_dev.copy_align = 2;
ee17028009d49f Akhil R         2022-02-25  1498  	tdma->dma_dev.fill_align = 2;
ee17028009d49f Akhil R         2022-02-25  1499  	tdma->dma_dev.device_alloc_chan_resources =
ee17028009d49f Akhil R         2022-02-25  1500  					tegra_dma_alloc_chan_resources;
ee17028009d49f Akhil R         2022-02-25  1501  	tdma->dma_dev.device_free_chan_resources =
ee17028009d49f Akhil R         2022-02-25  1502  					tegra_dma_free_chan_resources;
ee17028009d49f Akhil R         2022-02-25  1503  	tdma->dma_dev.device_prep_slave_sg = tegra_dma_prep_slave_sg;
ee17028009d49f Akhil R         2022-02-25  1504  	tdma->dma_dev.device_prep_dma_memcpy = tegra_dma_prep_dma_memcpy;
ee17028009d49f Akhil R         2022-02-25  1505  	tdma->dma_dev.device_prep_dma_memset = tegra_dma_prep_dma_memset;
ee17028009d49f Akhil R         2022-02-25  1506  	tdma->dma_dev.device_prep_dma_cyclic = tegra_dma_prep_dma_cyclic;
ee17028009d49f Akhil R         2022-02-25  1507  	tdma->dma_dev.device_config = tegra_dma_slave_config;
ee17028009d49f Akhil R         2022-02-25  1508  	tdma->dma_dev.device_terminate_all = tegra_dma_terminate_all;
ee17028009d49f Akhil R         2022-02-25  1509  	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
ee17028009d49f Akhil R         2022-02-25  1510  	tdma->dma_dev.device_issue_pending = tegra_dma_issue_pending;
ee17028009d49f Akhil R         2022-02-25  1511  	tdma->dma_dev.device_pause = tegra_dma_device_pause;
ee17028009d49f Akhil R         2022-02-25  1512  	tdma->dma_dev.device_resume = tegra_dma_device_resume;
ee17028009d49f Akhil R         2022-02-25  1513  	tdma->dma_dev.device_synchronize = tegra_dma_chan_synchronize;
ee17028009d49f Akhil R         2022-02-25  1514  	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
ee17028009d49f Akhil R         2022-02-25  1515  
ee17028009d49f Akhil R         2022-02-25  1516  	ret = dma_async_device_register(&tdma->dma_dev);
ee17028009d49f Akhil R         2022-02-25  1517  	if (ret < 0) {
ee17028009d49f Akhil R         2022-02-25  1518  		dev_err_probe(&pdev->dev, ret,
ee17028009d49f Akhil R         2022-02-25  1519  			      "GPC DMA driver registration failed\n");
ee17028009d49f Akhil R         2022-02-25  1520  		return ret;
ee17028009d49f Akhil R         2022-02-25  1521  	}
ee17028009d49f Akhil R         2022-02-25  1522  
43f59d3fa0deca Akhil R         2026-02-17  1523  	list_for_each_entry(chan, &tdma->dma_dev.channels, device_node) {
43f59d3fa0deca Akhil R         2026-02-17  1524  		struct device *chdev = &chan->dev->device;
43f59d3fa0deca Akhil R         2026-02-17  1525  
43f59d3fa0deca Akhil R         2026-02-17  1526  		tdc = to_tegra_dma_chan(chan);
43f59d3fa0deca Akhil R         2026-02-17  1527  		if (use_iommu_map) {
43f59d3fa0deca Akhil R         2026-02-17  1528  			chdev->coherent_dma_mask = pdev->dev.coherent_dma_mask;
43f59d3fa0deca Akhil R         2026-02-17  1529  			chdev->dma_mask = &chdev->coherent_dma_mask;
43f59d3fa0deca Akhil R         2026-02-17  1530  			chdev->bus = pdev->dev.bus;
43f59d3fa0deca Akhil R         2026-02-17  1531  
43f59d3fa0deca Akhil R         2026-02-17  1532  			ret = of_dma_configure_id(chdev, pdev->dev.of_node,
43f59d3fa0deca Akhil R         2026-02-17  1533  						  true, &tdc->id);
43f59d3fa0deca Akhil R         2026-02-17  1534  			if (ret) {
43f59d3fa0deca Akhil R         2026-02-17  1535  				dev_err(chdev, "Failed to configure IOMMU for channel %d: %d\n",
43f59d3fa0deca Akhil R         2026-02-17  1536  					tdc->id, ret);
43f59d3fa0deca Akhil R         2026-02-17  1537  				goto err_unregister;
43f59d3fa0deca Akhil R         2026-02-17  1538  			}
43f59d3fa0deca Akhil R         2026-02-17  1539  
43f59d3fa0deca Akhil R         2026-02-17  1540  			if (!tegra_dev_iommu_get_stream_id(chdev, &stream_id)) {
43f59d3fa0deca Akhil R         2026-02-17  1541  				dev_err(chdev, "Failed to get stream ID for channel %d\n",
43f59d3fa0deca Akhil R         2026-02-17  1542  					tdc->id);
43f59d3fa0deca Akhil R         2026-02-17 @1543  				goto err_unregister;
43f59d3fa0deca Akhil R         2026-02-17  1544  			}
43f59d3fa0deca Akhil R         2026-02-17  1545  
43f59d3fa0deca Akhil R         2026-02-17  1546  			chan->dev->chan_dma_dev = true;
43f59d3fa0deca Akhil R         2026-02-17  1547  		}
43f59d3fa0deca Akhil R         2026-02-17  1548  
43f59d3fa0deca Akhil R         2026-02-17  1549  		/* program stream-id for this channel */
43f59d3fa0deca Akhil R         2026-02-17  1550  		tegra_dma_program_sid(tdc, stream_id);
43f59d3fa0deca Akhil R         2026-02-17  1551  		tdc->stream_id = stream_id;
43f59d3fa0deca Akhil R         2026-02-17  1552  	}
43f59d3fa0deca Akhil R         2026-02-17  1553  
ee17028009d49f Akhil R         2022-02-25  1554  	ret = of_dma_controller_register(pdev->dev.of_node,
ee17028009d49f Akhil R         2022-02-25  1555  					 tegra_dma_of_xlate, tdma);
ee17028009d49f Akhil R         2022-02-25  1556  	if (ret < 0) {
ee17028009d49f Akhil R         2022-02-25  1557  		dev_err_probe(&pdev->dev, ret,
ee17028009d49f Akhil R         2022-02-25  1558  			      "GPC DMA OF registration failed\n");
43f59d3fa0deca Akhil R         2026-02-17  1559  		goto err_unregister;
ee17028009d49f Akhil R         2022-02-25  1560  	}
ee17028009d49f Akhil R         2022-02-25  1561  
43f59d3fa0deca Akhil R         2026-02-17  1562  	dev_info(&pdev->dev, "GPC DMA driver registered %lu channels\n",
3a0c95b61385f5 Akhil R         2022-11-10  1563  		 hweight_long(tdma->chan_mask));
ee17028009d49f Akhil R         2022-02-25  1564  
ee17028009d49f Akhil R         2022-02-25  1565  	return 0;
43f59d3fa0deca Akhil R         2026-02-17  1566  
43f59d3fa0deca Akhil R         2026-02-17  1567  err_unregister:
43f59d3fa0deca Akhil R         2026-02-17  1568  	dma_async_device_unregister(&tdma->dma_dev);
43f59d3fa0deca Akhil R         2026-02-17  1569  	return ret;
ee17028009d49f Akhil R         2022-02-25  1570  }
ee17028009d49f Akhil R         2022-02-25  1571  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
