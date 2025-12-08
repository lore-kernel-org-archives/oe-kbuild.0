Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6D1156236
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 06:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765174985; cv=none; b=qEe+Z9nNtck+LbTl2iS4RxSGC6XoAw79gUdfDGwEL6Mb5Q9/nHeE5lQ9a5Hvw79y0ZEclP+bn1lUg5yLnIavZrFTJw35LB4sx61jzg/FPwy7tZpwaqIWGGm994eUqUmteAU0TMcdzT+GSaGFX6NgFzJZvwt38j852d3DUbX6Ufo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765174985; c=relaxed/simple;
	bh=hsyF5eYFWpOLxbsyKOStKMzoSkmMvMH6HNx00HnbLEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MtvBt9h7PmXVsoTSMLfq4Vq9uhgLQSFjIt8gPFEAAAUzZoKnDb4G3l2BYo0TvUZqotj/2IXphtVyTLp9s01gE3rINeWylINMXtlm19qzp7Ew3M2pFMVO0d8oZwdZ5Ty6nl/09HEngOebFDZbYFYpXAFYxlWCITTWhZFG8kyb4c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdsiOhQ2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdsiOhQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765174983; x=1796710983;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hsyF5eYFWpOLxbsyKOStKMzoSkmMvMH6HNx00HnbLEA=;
  b=hdsiOhQ2Y089U17fF0QuFGeoE0vvf/Q+yaWMB0lxaKFVlJcXIBCJj/GY
   HhlniA+Y/SNppoNoEgqk89KnHCAUDndd4KgnTHYX8X4AlvAibXLgmUyKn
   wFEgGlTwiPwN7JhnX2mRoUmluPXsbWR1BPA+gOiaKD1/uzNoSwM9eRX5V
   KONXIRBa4tgegMVDuS9Ek1Rql2EUjoXX0ktYe0oIDe4IqTbrOCEaPpgaC
   uooED+iBWf6SrNT0n93wqg0g/qcFBgNMrWGAWDO8WI3aoA7jLQXoxuxRa
   ExyCg0fPkd/QJ2pSoXKycctbUZHpV2lcsFRa7ntx/+epgpIriECFYIrnU
   Q==;
X-CSE-ConnectionGUID: 8M81ZNg0SFSUJDIMZun9Zg==
X-CSE-MsgGUID: MGDumwmaQjas0boLWpt0lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="77730568"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="77730568"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 22:23:02 -0800
X-CSE-ConnectionGUID: MnzshXgFSiW3te/37hzNbA==
X-CSE-MsgGUID: 75lL7KoaT/aezDGigv/UMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="226519698"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Dec 2025 22:23:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSUe9-00000000K29-2UEW;
	Mon, 08 Dec 2025 06:22:57 +0000
Date: Mon, 8 Dec 2025 14:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [frank-w-bpi-r2-4.14:6.18-netnext-rss 5/5]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5678 mtk_probe() error: buffer
 overflow 'eth->irq_pdma' 4 <= 4
Message-ID: <202512081437.2zpZ8rCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-netnext-rss
head:   4f52683a34556997f6c6ce4920c2ee9608e1c965
commit: 4f52683a34556997f6c6ce4920c2ee9608e1c965 [5/5] net: ethernet: mtk_eth_soc: Add LRO support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r072-20251208 (https://download.01.org/0day-ci/archive/20251208/202512081437.2zpZ8rCt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512081437.2zpZ8rCt-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mediatek/mtk_eth_soc.c:5678 mtk_probe() error: buffer overflow 'eth->irq_pdma' 4 <= 4

vim +5678 drivers/net/ethernet/mediatek/mtk_eth_soc.c

04c7aaccdcf60a0 Daniel Golle       2025-07-02  5441  
656e705243fd0c2 John Crispin       2016-03-08  5442  static int mtk_probe(struct platform_device *pdev)
656e705243fd0c2 John Crispin       2016-03-08  5443  {
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5444  	struct resource *res = NULL;
656e705243fd0c2 John Crispin       2016-03-08  5445  	struct device_node *mac_np;
656e705243fd0c2 John Crispin       2016-03-08  5446  	struct mtk_eth *eth;
e08530d4de75ae7 Mason Chang        2025-03-19  5447  	char *irqname;
b8fc9f30821ec0c René van Dorst     2019-08-25  5448  	int err, i;
656e705243fd0c2 John Crispin       2016-03-08  5449  
656e705243fd0c2 John Crispin       2016-03-08  5450  	eth = devm_kzalloc(&pdev->dev, sizeof(*eth), GFP_KERNEL);
656e705243fd0c2 John Crispin       2016-03-08  5451  	if (!eth)
656e705243fd0c2 John Crispin       2016-03-08  5452  		return -ENOMEM;
656e705243fd0c2 John Crispin       2016-03-08  5453  
eda7d46da443e15 Ryder Lee          2018-04-16  5454  	eth->soc = of_device_get_match_data(&pdev->dev);
2ec50f574e8198b Sean Wang          2017-07-31  5455  
549e5495467ac2a Sean Wang          2016-09-01  5456  	eth->dev = &pdev->dev;
d776a57e4a284b3 Felix Fietkau      2022-04-05  5457  	eth->dma_dev = &pdev->dev;
566495de16580a3 YueHaibing         2019-08-01  5458  	eth->base = devm_platform_ioremap_resource(pdev, 0);
621e49f6d80a731 Vladimir Zapolskiy 2016-03-23  5459  	if (IS_ERR(eth->base))
621e49f6d80a731 Vladimir Zapolskiy 2016-03-23  5460  		return PTR_ERR(eth->base);
656e705243fd0c2 John Crispin       2016-03-08  5461  
160d3a9b192985b Lorenzo Bianconi   2022-05-20  5462  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
296c9120752bab9 Stefan Roese       2019-08-16  5463  		eth->ip_align = NET_IP_ALIGN;
296c9120752bab9 Stefan Roese       2019-08-16  5464  
2d75891ebc09ba9 Daniel Golle       2023-08-22  5465  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
cae1f1c36661f28 Daniel Golle       2024-01-24  5466  		err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(36));
cae1f1c36661f28 Daniel Golle       2024-01-24  5467  		if (!err)
cae1f1c36661f28 Daniel Golle       2024-01-24  5468  			err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
cae1f1c36661f28 Daniel Golle       2024-01-24  5469  
2d75891ebc09ba9 Daniel Golle       2023-08-22  5470  		if (err) {
2d75891ebc09ba9 Daniel Golle       2023-08-22  5471  			dev_err(&pdev->dev, "Wrong DMA config\n");
2d75891ebc09ba9 Daniel Golle       2023-08-22  5472  			return -EINVAL;
2d75891ebc09ba9 Daniel Golle       2023-08-22  5473  		}
2d75891ebc09ba9 Daniel Golle       2023-08-22  5474  	}
2d75891ebc09ba9 Daniel Golle       2023-08-22  5475  
656e705243fd0c2 John Crispin       2016-03-08  5476  	spin_lock_init(&eth->page_lock);
5cce0322cf8cd2c John Crispin       2017-06-19  5477  	spin_lock_init(&eth->tx_irq_lock);
5cce0322cf8cd2c John Crispin       2017-06-19  5478  	spin_lock_init(&eth->rx_irq_lock);
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5479  	spin_lock_init(&eth->dim_lock);
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5480  
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5481  	eth->rx_dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5482  	INIT_WORK(&eth->rx_dim.work, mtk_dim_rx);
93b2591ad0d0c1d Lorenzo Bianconi   2023-01-14  5483  	INIT_DELAYED_WORK(&eth->reset.monitor_work, mtk_hw_reset_monitor_work);
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5484  
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5485  	eth->tx_dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5486  	INIT_WORK(&eth->tx_dim.work, mtk_dim_tx);
656e705243fd0c2 John Crispin       2016-03-08  5487  
296c9120752bab9 Stefan Roese       2019-08-16  5488  	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
656e705243fd0c2 John Crispin       2016-03-08  5489  		eth->ethsys = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
656e705243fd0c2 John Crispin       2016-03-08  5490  							      "mediatek,ethsys");
656e705243fd0c2 John Crispin       2016-03-08  5491  		if (IS_ERR(eth->ethsys)) {
656e705243fd0c2 John Crispin       2016-03-08  5492  			dev_err(&pdev->dev, "no ethsys regmap found\n");
656e705243fd0c2 John Crispin       2016-03-08  5493  			return PTR_ERR(eth->ethsys);
656e705243fd0c2 John Crispin       2016-03-08  5494  		}
296c9120752bab9 Stefan Roese       2019-08-16  5495  	}
656e705243fd0c2 John Crispin       2016-03-08  5496  
7093f9d80c7cb82 Sean Wang          2019-06-01  5497  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_INFRA)) {
7093f9d80c7cb82 Sean Wang          2019-06-01  5498  		eth->infra = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
7093f9d80c7cb82 Sean Wang          2019-06-01  5499  							     "mediatek,infracfg");
7093f9d80c7cb82 Sean Wang          2019-06-01  5500  		if (IS_ERR(eth->infra)) {
7093f9d80c7cb82 Sean Wang          2019-06-01  5501  			dev_err(&pdev->dev, "no infracfg regmap found\n");
7093f9d80c7cb82 Sean Wang          2019-06-01  5502  			return PTR_ERR(eth->infra);
7093f9d80c7cb82 Sean Wang          2019-06-01  5503  		}
7093f9d80c7cb82 Sean Wang          2019-06-01  5504  	}
7093f9d80c7cb82 Sean Wang          2019-06-01  5505  
d776a57e4a284b3 Felix Fietkau      2022-04-05  5506  	if (of_dma_is_coherent(pdev->dev.of_node)) {
d776a57e4a284b3 Felix Fietkau      2022-04-05  5507  		struct regmap *cci;
d776a57e4a284b3 Felix Fietkau      2022-04-05  5508  
d776a57e4a284b3 Felix Fietkau      2022-04-05  5509  		cci = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
4263f77a5144f70 Lorenzo Bianconi   2022-04-11  5510  						      "cci-control-port");
d776a57e4a284b3 Felix Fietkau      2022-04-05  5511  		/* enable CPU/bus coherency */
d776a57e4a284b3 Felix Fietkau      2022-04-05  5512  		if (!IS_ERR(cci))
d776a57e4a284b3 Felix Fietkau      2022-04-05  5513  			regmap_write(cci, 0, 3);
d776a57e4a284b3 Felix Fietkau      2022-04-05  5514  	}
d776a57e4a284b3 Felix Fietkau      2022-04-05  5515  
42c03844e93d564 Sean Wang          2017-07-31  5516  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SGMII)) {
2a3ec7ae313310c Daniel Golle       2023-03-19  5517  		err = mtk_sgmii_init(eth);
9ffee4a8276c734 Sean Wang          2019-06-01  5518  
9ffee4a8276c734 Sean Wang          2019-06-01  5519  		if (err)
9ffee4a8276c734 Sean Wang          2019-06-01  5520  			return err;
42c03844e93d564 Sean Wang          2017-07-31  5521  	}
42c03844e93d564 Sean Wang          2017-07-31  5522  
243dc5fb4697a0d Sean Wang          2017-12-20  5523  	if (eth->soc->required_pctl) {
656e705243fd0c2 John Crispin       2016-03-08  5524  		eth->pctl = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
656e705243fd0c2 John Crispin       2016-03-08  5525  							    "mediatek,pctl");
656e705243fd0c2 John Crispin       2016-03-08  5526  		if (IS_ERR(eth->pctl)) {
656e705243fd0c2 John Crispin       2016-03-08  5527  			dev_err(&pdev->dev, "no pctl regmap found\n");
2a3ec7ae313310c Daniel Golle       2023-03-19  5528  			err = PTR_ERR(eth->pctl);
2a3ec7ae313310c Daniel Golle       2023-03-19  5529  			goto err_destroy_sgmii;
656e705243fd0c2 John Crispin       2016-03-08  5530  		}
243dc5fb4697a0d Sean Wang          2017-12-20  5531  	}
656e705243fd0c2 John Crispin       2016-03-08  5532  
a008e2a84e6b2b5 Lorenzo Bianconi   2023-07-25  5533  	if (mtk_is_netsys_v2_or_greater(eth)) {
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5534  		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
2a3ec7ae313310c Daniel Golle       2023-03-19  5535  		if (!res) {
2a3ec7ae313310c Daniel Golle       2023-03-19  5536  			err = -EINVAL;
2a3ec7ae313310c Daniel Golle       2023-03-19  5537  			goto err_destroy_sgmii;
2a3ec7ae313310c Daniel Golle       2023-03-19  5538  		}
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5539  
ebb1e4f9cf38da2 Daniel Golle       2023-08-22  5540  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5541  			eth->sram_pool = of_gen_pool_get(pdev->dev.of_node,
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5542  							 "sram", 0);
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5543  			if (!eth->sram_pool) {
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5544  				if (!mtk_is_netsys_v3_or_greater(eth)) {
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5545  					err = mtk_setup_legacy_sram(eth, res);
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5546  					if (err)
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5547  						goto err_destroy_sgmii;
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5548  				} else {
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5549  					dev_err(&pdev->dev,
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5550  						"Could not get SRAM pool\n");
ebb1e4f9cf38da2 Daniel Golle       2023-08-22  5551  					err = -EINVAL;
ebb1e4f9cf38da2 Daniel Golle       2023-08-22  5552  					goto err_destroy_sgmii;
ebb1e4f9cf38da2 Daniel Golle       2023-08-22  5553  				}
ebb1e4f9cf38da2 Daniel Golle       2023-08-22  5554  			}
ebb1e4f9cf38da2 Daniel Golle       2023-08-22  5555  		}
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5556  	}
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5557  
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5558  	if (eth->soc->offload_version) {
804775dfc2885e9 Felix Fietkau      2022-04-05  5559  		for (i = 0;; i++) {
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5560  			struct device_node *np;
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5561  			phys_addr_t wdma_phy;
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5562  			u32 wdma_base;
804775dfc2885e9 Felix Fietkau      2022-04-05  5563  
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5564  			if (i >= ARRAY_SIZE(eth->soc->reg_map->wdma_base))
804775dfc2885e9 Felix Fietkau      2022-04-05  5565  				break;
804775dfc2885e9 Felix Fietkau      2022-04-05  5566  
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5567  			np = of_parse_phandle(pdev->dev.of_node,
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5568  					      "mediatek,wed", i);
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5569  			if (!np)
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5570  				break;
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5571  
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5572  			wdma_base = eth->soc->reg_map->wdma_base[i];
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5573  			wdma_phy = res ? res->start + wdma_base : 0;
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5574  			mtk_wed_add_hw(np, eth, eth->base + wdma_base,
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5575  				       wdma_phy, i);
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5576  		}
804775dfc2885e9 Felix Fietkau      2022-04-05  5577  	}
804775dfc2885e9 Felix Fietkau      2022-04-05  5578  
e08530d4de75ae7 Mason Chang        2025-03-19  5579  	err = mtk_get_irqs_fe(pdev, eth);
e08530d4de75ae7 Mason Chang        2025-03-19  5580  	if (err)
e08530d4de75ae7 Mason Chang        2025-03-19  5581  		goto err_wed_exit;
e08530d4de75ae7 Mason Chang        2025-03-19  5582  
e08530d4de75ae7 Mason Chang        2025-03-19  5583  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_PDMA_INT)) {
e08530d4de75ae7 Mason Chang        2025-03-19  5584  		err = mtk_get_irqs_pdma(pdev, eth);
ee85b483fefbbeb Frank Wunderlich   2025-06-19  5585  		if (err)
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5586  			goto err_wed_exit;
e08530d4de75ae7 Mason Chang        2025-03-19  5587  	}
ee85b483fefbbeb Frank Wunderlich   2025-06-19  5588  
549e5495467ac2a Sean Wang          2016-09-01  5589  	for (i = 0; i < ARRAY_SIZE(eth->clks); i++) {
549e5495467ac2a Sean Wang          2016-09-01  5590  		eth->clks[i] = devm_clk_get(eth->dev,
549e5495467ac2a Sean Wang          2016-09-01  5591  					    mtk_clks_source_name[i]);
549e5495467ac2a Sean Wang          2016-09-01  5592  		if (IS_ERR(eth->clks[i])) {
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5593  			if (PTR_ERR(eth->clks[i]) == -EPROBE_DEFER) {
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5594  				err = -EPROBE_DEFER;
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5595  				goto err_wed_exit;
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5596  			}
2ec50f574e8198b Sean Wang          2017-07-31  5597  			if (eth->soc->required_clks & BIT(i)) {
2ec50f574e8198b Sean Wang          2017-07-31  5598  				dev_err(&pdev->dev, "clock %s not found\n",
2ec50f574e8198b Sean Wang          2017-07-31  5599  					mtk_clks_source_name[i]);
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5600  				err = -EINVAL;
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5601  				goto err_wed_exit;
2ec50f574e8198b Sean Wang          2017-07-31  5602  			}
2ec50f574e8198b Sean Wang          2017-07-31  5603  			eth->clks[i] = NULL;
549e5495467ac2a Sean Wang          2016-09-01  5604  		}
549e5495467ac2a Sean Wang          2016-09-01  5605  	}
656e705243fd0c2 John Crispin       2016-03-08  5606  
656e705243fd0c2 John Crispin       2016-03-08  5607  	eth->msg_enable = netif_msg_init(mtk_msg_level, MTK_DEFAULT_MSG_ENABLE);
7c78b4ad9bbdbe0 John Crispin       2016-04-08  5608  	INIT_WORK(&eth->pending_work, mtk_pending_work);
656e705243fd0c2 John Crispin       2016-03-08  5609  
a9724b9c477f63b Lorenzo Bianconi   2023-01-14  5610  	err = mtk_hw_init(eth, false);
656e705243fd0c2 John Crispin       2016-03-08  5611  	if (err)
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5612  		goto err_wed_exit;
656e705243fd0c2 John Crispin       2016-03-08  5613  
2d14ba7228b0c2e Sean Wang          2018-07-28  5614  	eth->hwlro = MTK_HAS_CAPS(eth->soc->caps, MTK_HWLRO);
983e1a6c95abf80 Nelson Chang       2016-10-06  5615  
656e705243fd0c2 John Crispin       2016-03-08  5616  	for_each_child_of_node(pdev->dev.of_node, mac_np) {
656e705243fd0c2 John Crispin       2016-03-08  5617  		if (!of_device_is_compatible(mac_np,
656e705243fd0c2 John Crispin       2016-03-08  5618  					     "mediatek,eth-mac"))
656e705243fd0c2 John Crispin       2016-03-08  5619  			continue;
656e705243fd0c2 John Crispin       2016-03-08  5620  
656e705243fd0c2 John Crispin       2016-03-08  5621  		if (!of_device_is_available(mac_np))
656e705243fd0c2 John Crispin       2016-03-08  5622  			continue;
656e705243fd0c2 John Crispin       2016-03-08  5623  
656e705243fd0c2 John Crispin       2016-03-08  5624  		err = mtk_add_mac(eth, mac_np);
cf36dd2f7793e8b Nishka Dasgupta    2019-07-16  5625  		if (err) {
cf36dd2f7793e8b Nishka Dasgupta    2019-07-16  5626  			of_node_put(mac_np);
8a8a9e89f801ce5 Sean Wang          2016-09-14  5627  			goto err_deinit_hw;
656e705243fd0c2 John Crispin       2016-03-08  5628  		}
cf36dd2f7793e8b Nishka Dasgupta    2019-07-16  5629  	}
656e705243fd0c2 John Crispin       2016-03-08  5630  
e08530d4de75ae7 Mason Chang        2025-03-19  5631  	err = mtk_napi_init(eth);
e08530d4de75ae7 Mason Chang        2025-03-19  5632  	if (err)
e08530d4de75ae7 Mason Chang        2025-03-19  5633  		goto err_free_dev;
e08530d4de75ae7 Mason Chang        2025-03-19  5634  
889bcbdeee57376 Bjørn Mork         2019-01-30  5635  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
e08530d4de75ae7 Mason Chang        2025-03-19  5636  		err = devm_request_irq(eth->dev, eth->irq_fe[MTK_FE_IRQ_SHARED],
889bcbdeee57376 Bjørn Mork         2019-01-30  5637  				       mtk_handle_irq, 0,
889bcbdeee57376 Bjørn Mork         2019-01-30  5638  				       dev_name(eth->dev), eth);
889bcbdeee57376 Bjørn Mork         2019-01-30  5639  	} else {
e08530d4de75ae7 Mason Chang        2025-03-19  5640  		irqname = devm_kasprintf(eth->dev, GFP_KERNEL, "%s TX",
e08530d4de75ae7 Mason Chang        2025-03-19  5641  					 dev_name(eth->dev));
e08530d4de75ae7 Mason Chang        2025-03-19  5642  		err = devm_request_irq(eth->dev, eth->irq_fe[MTK_FE_IRQ_TX],
889bcbdeee57376 Bjørn Mork         2019-01-30  5643  				       mtk_handle_irq_tx, 0,
e08530d4de75ae7 Mason Chang        2025-03-19  5644  				       irqname, eth);
85574dbf9d12b39 Sean Wang          2016-09-14  5645  		if (err)
85574dbf9d12b39 Sean Wang          2016-09-14  5646  			goto err_free_dev;
85574dbf9d12b39 Sean Wang          2016-09-14  5647  
e08530d4de75ae7 Mason Chang        2025-03-19  5648  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_PDMA_INT)) {
e08530d4de75ae7 Mason Chang        2025-03-19  5649  			irqname = devm_kasprintf(eth->dev, GFP_KERNEL, "%s PDMA RX %d",
e08530d4de75ae7 Mason Chang        2025-03-19  5650  						 dev_name(eth->dev), 0);
e08530d4de75ae7 Mason Chang        2025-03-19  5651  			err = devm_request_irq(eth->dev, eth->irq_pdma[0],
e08530d4de75ae7 Mason Chang        2025-03-19  5652  					       mtk_handle_irq_rx, IRQF_SHARED,
e08530d4de75ae7 Mason Chang        2025-03-19  5653  					       irqname, &eth->rx_napi[0]);
e08530d4de75ae7 Mason Chang        2025-03-19  5654  			if (err)
e08530d4de75ae7 Mason Chang        2025-03-19  5655  				goto err_free_dev;
e08530d4de75ae7 Mason Chang        2025-03-19  5656  
e08530d4de75ae7 Mason Chang        2025-03-19  5657  			if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSS)) {
e08530d4de75ae7 Mason Chang        2025-03-19  5658  				for (i = 1; i < MTK_RX_RSS_NUM; i++) {
e08530d4de75ae7 Mason Chang        2025-03-19  5659  					irqname = devm_kasprintf(eth->dev, GFP_KERNEL,
e08530d4de75ae7 Mason Chang        2025-03-19  5660  								 "%s PDMA RX %d",
e08530d4de75ae7 Mason Chang        2025-03-19  5661  								 dev_name(eth->dev), i);
e08530d4de75ae7 Mason Chang        2025-03-19  5662  					err = devm_request_irq(eth->dev,
e08530d4de75ae7 Mason Chang        2025-03-19  5663  							       eth->irq_pdma[MTK_RSS_RING(i)],
e08530d4de75ae7 Mason Chang        2025-03-19  5664  							       mtk_handle_irq_rx, IRQF_SHARED,
e08530d4de75ae7 Mason Chang        2025-03-19  5665  							       irqname,
e08530d4de75ae7 Mason Chang        2025-03-19  5666  							       &eth->rx_napi[MTK_RSS_RING(i)]);
e08530d4de75ae7 Mason Chang        2025-03-19  5667  					if (err)
e08530d4de75ae7 Mason Chang        2025-03-19  5668  						goto err_free_dev;
e08530d4de75ae7 Mason Chang        2025-03-19  5669  				}
889bcbdeee57376 Bjørn Mork         2019-01-30  5670  			}
4f52683a3455699 Mason Chang        2025-03-21  5671  
4f52683a3455699 Mason Chang        2025-03-21  5672  			if (eth->hwlro) {
4f52683a3455699 Mason Chang        2025-03-21  5673  				for (i = 0; i < MTK_HW_LRO_RING_NUM; i++) {
4f52683a3455699 Mason Chang        2025-03-21  5674  					irqname = devm_kasprintf(eth->dev, GFP_KERNEL,
4f52683a3455699 Mason Chang        2025-03-21  5675  								 "%s LRO RX %d",
4f52683a3455699 Mason Chang        2025-03-21  5676  								 dev_name(eth->dev), i);
4f52683a3455699 Mason Chang        2025-03-21  5677  					err = devm_request_irq(eth->dev,
4f52683a3455699 Mason Chang        2025-03-21 @5678  							       eth->irq_pdma[MTK_HW_LRO_IRQ(i)],
4f52683a3455699 Mason Chang        2025-03-21  5679  							       mtk_handle_irq_rx, IRQF_SHARED,
4f52683a3455699 Mason Chang        2025-03-21  5680  							       irqname,
4f52683a3455699 Mason Chang        2025-03-21  5681  							       &eth->rx_napi[MTK_HW_LRO_RING(i)]);
4f52683a3455699 Mason Chang        2025-03-21  5682  					if (err)
4f52683a3455699 Mason Chang        2025-03-21  5683  						goto err_free_dev;
4f52683a3455699 Mason Chang        2025-03-21  5684  				}
4f52683a3455699 Mason Chang        2025-03-21  5685  			}
e08530d4de75ae7 Mason Chang        2025-03-19  5686  		} else {
e08530d4de75ae7 Mason Chang        2025-03-19  5687  			irqname = devm_kasprintf(eth->dev, GFP_KERNEL, "%s RX",
e08530d4de75ae7 Mason Chang        2025-03-19  5688  						 dev_name(eth->dev));
e08530d4de75ae7 Mason Chang        2025-03-19  5689  			err = devm_request_irq(eth->dev, eth->irq_fe[MTK_FE_IRQ_RX],
e08530d4de75ae7 Mason Chang        2025-03-19  5690  					       mtk_handle_irq_rx, 0,
e08530d4de75ae7 Mason Chang        2025-03-19  5691  					       irqname, &eth->rx_napi[0]);
85574dbf9d12b39 Sean Wang          2016-09-14  5692  			if (err)
85574dbf9d12b39 Sean Wang          2016-09-14  5693  				goto err_free_dev;
e08530d4de75ae7 Mason Chang        2025-03-19  5694  		}
e08530d4de75ae7 Mason Chang        2025-03-19  5695  	}
85574dbf9d12b39 Sean Wang          2016-09-14  5696  
296c9120752bab9 Stefan Roese       2019-08-16  5697  	/* No MT7628/88 support yet */
296c9120752bab9 Stefan Roese       2019-08-16  5698  	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
85574dbf9d12b39 Sean Wang          2016-09-14  5699  		err = mtk_mdio_init(eth);
85574dbf9d12b39 Sean Wang          2016-09-14  5700  		if (err)
85574dbf9d12b39 Sean Wang          2016-09-14  5701  			goto err_free_dev;
296c9120752bab9 Stefan Roese       2019-08-16  5702  	}
85574dbf9d12b39 Sean Wang          2016-09-14  5703  
ba37b7caf1ed239 Felix Fietkau      2021-03-24  5704  	if (eth->soc->offload_version) {
dee4dd10c79aaca Elad Yifee         2024-06-07  5705  		u8 ppe_num = eth->soc->ppe_num;
329bce5139cfb00 Lorenzo Bianconi   2022-09-20  5706  
dee4dd10c79aaca Elad Yifee         2024-06-07  5707  		ppe_num = min_t(u8, ARRAY_SIZE(eth->ppe), ppe_num);
dee4dd10c79aaca Elad Yifee         2024-06-07  5708  		for (i = 0; i < ppe_num; i++) {
dee4dd10c79aaca Elad Yifee         2024-06-07  5709  			u32 ppe_addr = eth->soc->reg_map->ppe_base;
4ff1a3fca766aa8 Lorenzo Bianconi   2022-09-20  5710  
dee4dd10c79aaca Elad Yifee         2024-06-07  5711  			ppe_addr += (i == 2 ? 0xc00 : i * 0x400);
3fbe4d8c0e53e40 Daniel Golle       2023-03-19  5712  			eth->ppe[i] = mtk_ppe_init(eth, eth->base + ppe_addr, i);
3fbe4d8c0e53e40 Daniel Golle       2023-03-19  5713  
4ff1a3fca766aa8 Lorenzo Bianconi   2022-09-20  5714  			if (!eth->ppe[i]) {
1ccc723b5829d63 Felix Fietkau      2022-04-05  5715  				err = -ENOMEM;
603ea5e7ffa73c7 Yan Cangang        2022-11-20  5716  				goto err_deinit_ppe;
1ccc723b5829d63 Felix Fietkau      2022-04-05  5717  			}
dee4dd10c79aaca Elad Yifee         2024-06-07  5718  			err = mtk_eth_offload_init(eth, i);
502e84e2382d926 Felix Fietkau      2021-03-24  5719  
502e84e2382d926 Felix Fietkau      2021-03-24  5720  			if (err)
603ea5e7ffa73c7 Yan Cangang        2022-11-20  5721  				goto err_deinit_ppe;
ba37b7caf1ed239 Felix Fietkau      2021-03-24  5722  		}
dee4dd10c79aaca Elad Yifee         2024-06-07  5723  	}
ba37b7caf1ed239 Felix Fietkau      2021-03-24  5724  
85574dbf9d12b39 Sean Wang          2016-09-14  5725  	for (i = 0; i < MTK_MAX_DEVS; i++) {
85574dbf9d12b39 Sean Wang          2016-09-14  5726  		if (!eth->netdev[i])
85574dbf9d12b39 Sean Wang          2016-09-14  5727  			continue;
85574dbf9d12b39 Sean Wang          2016-09-14  5728  
85574dbf9d12b39 Sean Wang          2016-09-14  5729  		err = register_netdev(eth->netdev[i]);
85574dbf9d12b39 Sean Wang          2016-09-14  5730  		if (err) {
85574dbf9d12b39 Sean Wang          2016-09-14  5731  			dev_err(eth->dev, "error bringing up device\n");
603ea5e7ffa73c7 Yan Cangang        2022-11-20  5732  			goto err_deinit_ppe;
85574dbf9d12b39 Sean Wang          2016-09-14  5733  		} else
85574dbf9d12b39 Sean Wang          2016-09-14  5734  			netif_info(eth, probe, eth->netdev[i],
85574dbf9d12b39 Sean Wang          2016-09-14  5735  				   "mediatek frame engine at 0x%08lx, irq %d\n",
e08530d4de75ae7 Mason Chang        2025-03-19  5736  				   eth->netdev[i]->base_addr, eth->irq_fe[MTK_FE_IRQ_SHARED]);
85574dbf9d12b39 Sean Wang          2016-09-14  5737  	}
85574dbf9d12b39 Sean Wang          2016-09-14  5738  
656e705243fd0c2 John Crispin       2016-03-08  5739  	/* we run 2 devices on the same DMA ring so we need a dummy device
656e705243fd0c2 John Crispin       2016-03-08  5740  	 * for NAPI to work
656e705243fd0c2 John Crispin       2016-03-08  5741  	 */
b209bd6d0bffb89 Breno Leitao       2024-04-22  5742  	eth->dummy_dev = alloc_netdev_dummy(0);
b209bd6d0bffb89 Breno Leitao       2024-04-22  5743  	if (!eth->dummy_dev) {
b209bd6d0bffb89 Breno Leitao       2024-04-22  5744  		err = -ENOMEM;
b209bd6d0bffb89 Breno Leitao       2024-04-22  5745  		dev_err(eth->dev, "failed to allocated dummy device\n");
b209bd6d0bffb89 Breno Leitao       2024-04-22  5746  		goto err_unreg_netdev;
b209bd6d0bffb89 Breno Leitao       2024-04-22  5747  	}
b209bd6d0bffb89 Breno Leitao       2024-04-22  5748  	netif_napi_add(eth->dummy_dev, &eth->tx_napi, mtk_napi_tx);
e08530d4de75ae7 Mason Chang        2025-03-19  5749  	netif_napi_add(eth->dummy_dev, &eth->rx_napi[0].napi, mtk_napi_rx);
e08530d4de75ae7 Mason Chang        2025-03-19  5750  
e08530d4de75ae7 Mason Chang        2025-03-19  5751  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSS)) {
e08530d4de75ae7 Mason Chang        2025-03-19  5752  		for (i = 1; i < MTK_RX_RSS_NUM; i++)
e08530d4de75ae7 Mason Chang        2025-03-19  5753  			netif_napi_add(eth->dummy_dev, &eth->rx_napi[MTK_RSS_RING(i)].napi,
e08530d4de75ae7 Mason Chang        2025-03-19  5754  				       mtk_napi_rx);
e08530d4de75ae7 Mason Chang        2025-03-19  5755  	}
656e705243fd0c2 John Crispin       2016-03-08  5756  
4f52683a3455699 Mason Chang        2025-03-21  5757  	if (eth->hwlro) {
4f52683a3455699 Mason Chang        2025-03-21  5758  		for (i = 0; i < MTK_HW_LRO_RING_NUM; i++) {
4f52683a3455699 Mason Chang        2025-03-21  5759  			netif_napi_add(eth->dummy_dev, &eth->rx_napi[MTK_HW_LRO_RING(i)].napi,
4f52683a3455699 Mason Chang        2025-03-21  5760  				       mtk_napi_rx);
4f52683a3455699 Mason Chang        2025-03-21  5761  		}
4f52683a3455699 Mason Chang        2025-03-21  5762  	}
4f52683a3455699 Mason Chang        2025-03-21  5763  
656e705243fd0c2 John Crispin       2016-03-08  5764  	platform_set_drvdata(pdev, eth);
93b2591ad0d0c1d Lorenzo Bianconi   2023-01-14  5765  	schedule_delayed_work(&eth->reset.monitor_work,
93b2591ad0d0c1d Lorenzo Bianconi   2023-01-14  5766  			      MTK_DMA_MONITOR_TIMEOUT);
656e705243fd0c2 John Crispin       2016-03-08  5767  
656e705243fd0c2 John Crispin       2016-03-08  5768  	return 0;
656e705243fd0c2 John Crispin       2016-03-08  5769  
b209bd6d0bffb89 Breno Leitao       2024-04-22  5770  err_unreg_netdev:
b209bd6d0bffb89 Breno Leitao       2024-04-22  5771  	mtk_unreg_dev(eth);
603ea5e7ffa73c7 Yan Cangang        2022-11-20  5772  err_deinit_ppe:
603ea5e7ffa73c7 Yan Cangang        2022-11-20  5773  	mtk_ppe_deinit(eth);
8a8a9e89f801ce5 Sean Wang          2016-09-14  5774  	mtk_mdio_cleanup(eth);
656e705243fd0c2 John Crispin       2016-03-08  5775  err_free_dev:
8a8a9e89f801ce5 Sean Wang          2016-09-14  5776  	mtk_free_dev(eth);
8a8a9e89f801ce5 Sean Wang          2016-09-14  5777  err_deinit_hw:
8a8a9e89f801ce5 Sean Wang          2016-09-14  5778  	mtk_hw_deinit(eth);
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5779  err_wed_exit:
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5780  	mtk_wed_exit();
2a3ec7ae313310c Daniel Golle       2023-03-19  5781  err_destroy_sgmii:
2a3ec7ae313310c Daniel Golle       2023-03-19  5782  	mtk_sgmii_destroy(eth);
8a8a9e89f801ce5 Sean Wang          2016-09-14  5783  
656e705243fd0c2 John Crispin       2016-03-08  5784  	return err;
656e705243fd0c2 John Crispin       2016-03-08  5785  }
656e705243fd0c2 John Crispin       2016-03-08  5786  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
