Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D913B8D68
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 21:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765748511; cv=none; b=H+Ttsi6sfnMYs6DBMK3gjaX2NlHMSA28U9UA1EEM06PQGcNseAojOwov5VbmYKZCkm99a9XFHpHO8HDE0fAno7CvgO3MOAI1fCVYfn5gkuUirbbU+M0od4APaOwgDvJLz+KzVo9wp1BVK30SOn4irmP0rUAcYLqhcumkwDj5XzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765748511; c=relaxed/simple;
	bh=PXVJ5wF6aQAtdYGpMOvKOxt/ZI5b66YsjB+a5mt3v/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AlbTjct4F0g37/2fLMBO892lsVRSslmYeIXciALq7PKveb7PVPdJR3AU4a/DlHBl46k8fttwxXQtdudPmU5tMZYdDMqbTwS/eMbjOD0Obp/1t64a/yGjvWpCtfeeknJoQ9M+gV2+bYBuIG2xnevUyXMiemagYIRkm6BrPmNpikg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAQ94P2y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAQ94P2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765748509; x=1797284509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PXVJ5wF6aQAtdYGpMOvKOxt/ZI5b66YsjB+a5mt3v/E=;
  b=RAQ94P2yMu+OuncNd2KNfpJ8WBDk7wKli9AJ7q9wfxl7uIj8hIqGEMIe
   WSj+wr3lP4X6B0KJSd14dg5mhK8CCvldGBHPWX6N7p1hYgFRYLIPNaoSZ
   J8MIbLdG+/IgyuIakJKpM8c4HqOwxUXciBTtn1HE0p8I0ANcxNBUVl4p9
   xcYSmUjGNxFl6D7fw8LsNaUSeIXBRT87Fm/bqqjiQE54XZ1N5NhzeWExs
   M08FCIhrGndw17dKwEf9sZKRT9t5QSqW+7bS86dzvai2y5lcK6cW1bwnU
   ZQat9EWdd1mmVRRltXRHTz1MlqHYGcUL+X31beJrSDccSKe2TpkLYTSrK
   Q==;
X-CSE-ConnectionGUID: GoiZ+vmGRlKDMlkh0RqQBA==
X-CSE-MsgGUID: WfAV6Sa9RBSi7wrfffTUyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67534647"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67534647"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 13:41:49 -0800
X-CSE-ConnectionGUID: Sog5Zz27Txy6W4Srrkz4Ew==
X-CSE-MsgGUID: yy9VpCeHQXOS2YM6cksT3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228637950"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2025 13:41:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUtqb-000000009Pl-0dku;
	Sun, 14 Dec 2025 21:41:45 +0000
Date: Mon, 15 Dec 2025 05:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/spi/spi-tegra210-quad.c:667
 tegra_qspi_start_dma_based_transfer() error: uninitialized symbol
 'dma_burst'.
Message-ID: <202512150515.nmEZr9M6-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Vishwaroop A <va@nvidia.com>
CC: Mark Brown <broonie@kernel.org>
CC: Jon Hunter <jonathanh@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 017f1b0bae08e8b456cf35cbdaae93ec19b50f0a spi: tegra210-quad: Add support for internal DMA
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: csky-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150515.nmEZr9M6-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512150515.nmEZr9M6-lkp@intel.com/

New smatch warnings:
drivers/spi/spi-tegra210-quad.c:667 tegra_qspi_start_dma_based_transfer() error: uninitialized symbol 'dma_burst'.

Old smatch warnings:
drivers/spi/spi-tegra210-quad.c:697 tegra_qspi_start_dma_based_transfer() error: uninitialized symbol 'dma_burst'.
drivers/spi/spi-tegra210-quad.c:710 tegra_qspi_start_dma_based_transfer() error: we previously assumed 'tqspi->tx_dma_chan' could be null (see line 664)

vim +/dma_burst +667 drivers/spi/spi-tegra210-quad.c

921fc1838fb036 Sowjanya Komatineni 2020-12-21  616  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  617  static int tegra_qspi_start_dma_based_transfer(struct tegra_qspi *tqspi, struct spi_transfer *t)
921fc1838fb036 Sowjanya Komatineni 2020-12-21  618  {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  619  	struct dma_slave_config dma_sconfig = { 0 };
017f1b0bae08e8 Vishwaroop A        2025-05-13  620  	dma_addr_t rx_dma_phys, tx_dma_phys;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  621  	unsigned int len;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  622  	u8 dma_burst;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  623  	int ret = 0;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  624  	u32 val;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  625  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  626  	if (tqspi->is_packed) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  627  		ret = tegra_qspi_dma_map_xfer(tqspi, t);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  628  		if (ret < 0)
921fc1838fb036 Sowjanya Komatineni 2020-12-21  629  			return ret;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  630  	}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  631  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  632  	val = QSPI_DMA_BLK_SET(tqspi->curr_dma_words - 1);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  633  	tegra_qspi_writel(tqspi, val, QSPI_DMA_BLK);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  634  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  635  	tegra_qspi_unmask_irq(tqspi);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  636  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  637  	if (tqspi->is_packed)
921fc1838fb036 Sowjanya Komatineni 2020-12-21  638  		len = DIV_ROUND_UP(tqspi->curr_dma_words * tqspi->bytes_per_word, 4) * 4;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  639  	else
921fc1838fb036 Sowjanya Komatineni 2020-12-21  640  		len = tqspi->curr_dma_words * 4;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  641  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  642  	/* set attention level based on length of transfer */
017f1b0bae08e8 Vishwaroop A        2025-05-13  643  	if (tqspi->soc_data->has_ext_dma) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  644  		val = 0;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  645  		if (len & 0xf) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  646  			val |= QSPI_TX_TRIG_1 | QSPI_RX_TRIG_1;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  647  			dma_burst = 1;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  648  		} else if (((len) >> 4) & 0x1) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  649  			val |= QSPI_TX_TRIG_4 | QSPI_RX_TRIG_4;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  650  			dma_burst = 4;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  651  		} else {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  652  			val |= QSPI_TX_TRIG_8 | QSPI_RX_TRIG_8;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  653  			dma_burst = 8;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  654  		}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  655  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  656  		tegra_qspi_writel(tqspi, val, QSPI_DMA_CTL);
017f1b0bae08e8 Vishwaroop A        2025-05-13  657  	}
017f1b0bae08e8 Vishwaroop A        2025-05-13  658  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  659  	tqspi->dma_control_reg = val;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  660  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  661  	dma_sconfig.device_fc = true;
017f1b0bae08e8 Vishwaroop A        2025-05-13  662  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  663  	if (tqspi->cur_direction & DATA_DIR_TX) {
017f1b0bae08e8 Vishwaroop A        2025-05-13  664  		if (tqspi->tx_dma_chan) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  665  			dma_sconfig.dst_addr = tqspi->phys + QSPI_TX_FIFO;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  666  			dma_sconfig.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
921fc1838fb036 Sowjanya Komatineni 2020-12-21 @667  			dma_sconfig.dst_maxburst = dma_burst;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  668  			ret = dmaengine_slave_config(tqspi->tx_dma_chan, &dma_sconfig);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  669  			if (ret < 0) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  670  				dev_err(tqspi->dev, "failed DMA slave config: %d\n", ret);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  671  				return ret;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  672  			}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  673  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  674  			tegra_qspi_copy_client_txbuf_to_qspi_txbuf(tqspi, t);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  675  			ret = tegra_qspi_start_tx_dma(tqspi, t, len);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  676  			if (ret < 0) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  677  				dev_err(tqspi->dev, "failed to starting TX DMA: %d\n", ret);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  678  				return ret;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  679  			}
017f1b0bae08e8 Vishwaroop A        2025-05-13  680  		} else {
017f1b0bae08e8 Vishwaroop A        2025-05-13  681  			if (tqspi->is_packed)
017f1b0bae08e8 Vishwaroop A        2025-05-13  682  				tx_dma_phys = t->tx_dma;
017f1b0bae08e8 Vishwaroop A        2025-05-13  683  			else
017f1b0bae08e8 Vishwaroop A        2025-05-13  684  				tx_dma_phys = tqspi->tx_dma_phys;
017f1b0bae08e8 Vishwaroop A        2025-05-13  685  			tegra_qspi_copy_client_txbuf_to_qspi_txbuf(tqspi, t);
017f1b0bae08e8 Vishwaroop A        2025-05-13  686  			tegra_qspi_writel(tqspi, lower_32_bits(tx_dma_phys),
017f1b0bae08e8 Vishwaroop A        2025-05-13  687  					  QSPI_DMA_MEM_ADDRESS);
017f1b0bae08e8 Vishwaroop A        2025-05-13  688  			tegra_qspi_writel(tqspi, (upper_32_bits(tx_dma_phys) & 0xff),
017f1b0bae08e8 Vishwaroop A        2025-05-13  689  					  QSPI_DMA_HI_ADDRESS);
017f1b0bae08e8 Vishwaroop A        2025-05-13  690  		}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  691  	}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  692  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  693  	if (tqspi->cur_direction & DATA_DIR_RX) {
017f1b0bae08e8 Vishwaroop A        2025-05-13  694  		if (tqspi->rx_dma_chan) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  695  			dma_sconfig.src_addr = tqspi->phys + QSPI_RX_FIFO;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  696  			dma_sconfig.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  697  			dma_sconfig.src_maxburst = dma_burst;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  698  			ret = dmaengine_slave_config(tqspi->rx_dma_chan, &dma_sconfig);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  699  			if (ret < 0) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  700  				dev_err(tqspi->dev, "failed DMA slave config: %d\n", ret);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  701  				return ret;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  702  			}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  703  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  704  			dma_sync_single_for_device(tqspi->dev, tqspi->rx_dma_phys,
017f1b0bae08e8 Vishwaroop A        2025-05-13  705  						   tqspi->dma_buf_size, DMA_FROM_DEVICE);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  706  			ret = tegra_qspi_start_rx_dma(tqspi, t, len);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  707  			if (ret < 0) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  708  				dev_err(tqspi->dev, "failed to start RX DMA: %d\n", ret);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  709  				if (tqspi->cur_direction & DATA_DIR_TX)
921fc1838fb036 Sowjanya Komatineni 2020-12-21  710  					dmaengine_terminate_all(tqspi->tx_dma_chan);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  711  				return ret;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  712  			}
017f1b0bae08e8 Vishwaroop A        2025-05-13  713  		} else {
017f1b0bae08e8 Vishwaroop A        2025-05-13  714  			if (tqspi->is_packed)
017f1b0bae08e8 Vishwaroop A        2025-05-13  715  				rx_dma_phys = t->rx_dma;
017f1b0bae08e8 Vishwaroop A        2025-05-13  716  			else
017f1b0bae08e8 Vishwaroop A        2025-05-13  717  				rx_dma_phys = tqspi->rx_dma_phys;
017f1b0bae08e8 Vishwaroop A        2025-05-13  718  
017f1b0bae08e8 Vishwaroop A        2025-05-13  719  			tegra_qspi_writel(tqspi, lower_32_bits(rx_dma_phys),
017f1b0bae08e8 Vishwaroop A        2025-05-13  720  					  QSPI_DMA_MEM_ADDRESS);
017f1b0bae08e8 Vishwaroop A        2025-05-13  721  			tegra_qspi_writel(tqspi, (upper_32_bits(rx_dma_phys) & 0xff),
017f1b0bae08e8 Vishwaroop A        2025-05-13  722  					  QSPI_DMA_HI_ADDRESS);
017f1b0bae08e8 Vishwaroop A        2025-05-13  723  		}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  724  	}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  725  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  726  	tegra_qspi_writel(tqspi, tqspi->command1_reg, QSPI_COMMAND1);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  727  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  728  	tqspi->is_curr_dma_xfer = true;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  729  	tqspi->dma_control_reg = val;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  730  	val |= QSPI_DMA_EN;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  731  	tegra_qspi_writel(tqspi, val, QSPI_DMA_CTL);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  732  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  733  	return ret;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  734  }
921fc1838fb036 Sowjanya Komatineni 2020-12-21  735  

:::::: The code at line 667 was first introduced by commit
:::::: 921fc1838fb036f690b8ba52e6a6d3644b475cbb spi: tegra210-quad: Add support for Tegra210 QSPI controller

:::::: TO: Sowjanya Komatineni <skomatineni@nvidia.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
