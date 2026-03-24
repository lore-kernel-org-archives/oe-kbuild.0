Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C031684BE
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 03:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321731; cv=none; b=QbjIUUSeec4bJIddq9jE4tO8UtKVioGqrfMEj3h5Hm0wML0RWKtTxBYETrlykwHY9PmisqDF3uy9p73NBDSUBmh99D8SArwyFDK4hzOCbxsd0xCpNetOpYPiMBekIZap5g9oj2aVIwCySmAZJmqxXDogolRBl3A4Fr6jX5jmzdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321731; c=relaxed/simple;
	bh=kkxkpmxsPiRr5/wmVbk+Ek3gX6cpKG4pL3U8iRYE+SA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uxSLElOIyMrC0YaKWPlTND/TqAVY1VHQ7QENHOeipsi/6Kxu3krAi4V/TcNfXOYLqLcKC0oxVVrzVpG1YtqcWyd9c3/t/9ceUtwiLfqjzKFZFMg4/7j4AwVvismbqeYp5larRpu4WAbILiaFL3Kriw1D8gTQy8jGOOr4OJwdyoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y88ECuIc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y88ECuIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774321730; x=1805857730;
  h=date:from:to:cc:subject:message-id;
  bh=kkxkpmxsPiRr5/wmVbk+Ek3gX6cpKG4pL3U8iRYE+SA=;
  b=Y88ECuIcqYgVUjvSM1qkPKlcCbkpYb/Zvgs1DE9SPdbZfwT6Ld4K2Q90
   4FNM90c70VINHIyAoAPvOzE+IUi6b86uGQSlZIvy9of3AbLyiGYdQE5/y
   cQXple8APFN6RrEITltiRSojlSYA10s7UQjkexDwIQAt1MW17s3glC2Ze
   8NGXbZJbpVwL9ri4m0xfbz5+7CFhvUs86aVCKirIzxBtAit8Ko5/U9x9W
   0x3lU8khika2XkxXq24Aj/0i7+owgPJlEEsHiTb06Uv7st9Nc92G7FoSA
   D88QY7GdWpy2xgKo5ZlDOxXwg91ZfmJ1NJYQHvNiYBvSSWzQGxmsffasz
   Q==;
X-CSE-ConnectionGUID: yQr91BUVR0e4KGUeCfLAag==
X-CSE-MsgGUID: pEoSvJyHTWaKS7PtA/F4GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="85951261"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="85951261"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 20:08:49 -0700
X-CSE-ConnectionGUID: Zt3rEEBBTn6WUmobsNceUA==
X-CSE-MsgGUID: IHtJ4deLSJK1P5jHJh2NMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224441986"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Mar 2026 20:08:47 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4s8K-000000003i9-2Q1O;
	Tue, 24 Mar 2026 03:08:44 +0000
Date: Tue, 24 Mar 2026 11:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/spi/spi-tegra210-quad.c:710
 tegra_qspi_start_dma_based_transfer() error: we previously assumed
 'tqspi->tx_dma_chan' could be null (see line 664)
Message-ID: <202603241132.v6L5mOBv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vishwaroop A <va@nvidia.com>
CC: Mark Brown <broonie@kernel.org>
CC: Jon Hunter <jonathanh@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 017f1b0bae08e8b456cf35cbdaae93ec19b50f0a spi: tegra210-quad: Add support for internal DMA
date:   10 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-r073-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241132.v6L5mOBv-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603241132.v6L5mOBv-lkp@intel.com/

New smatch warnings:
drivers/spi/spi-tegra210-quad.c:710 tegra_qspi_start_dma_based_transfer() error: we previously assumed 'tqspi->tx_dma_chan' could be null (see line 664)

Old smatch warnings:
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +710 drivers/spi/spi-tegra210-quad.c

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
017f1b0bae08e8 Vishwaroop A        2025-05-13 @664  		if (tqspi->tx_dma_chan) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  665  			dma_sconfig.dst_addr = tqspi->phys + QSPI_TX_FIFO;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  666  			dma_sconfig.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  667  			dma_sconfig.dst_maxburst = dma_burst;
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
921fc1838fb036 Sowjanya Komatineni 2020-12-21 @710  					dmaengine_terminate_all(tqspi->tx_dma_chan);
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

:::::: The code at line 710 was first introduced by commit
:::::: 921fc1838fb036f690b8ba52e6a6d3644b475cbb spi: tegra210-quad: Add support for Tegra210 QSPI controller

:::::: TO: Sowjanya Komatineni <skomatineni@nvidia.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
