Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4497F1D5CFE
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Jan 2025 21:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736024425; cv=none; b=ejHwEC56SAFTvqkY9K//vuH6peoFZP4TYc8JZ9wO5KjeuX88DujpI71NBvgC1IM34saOWr5xa/7g+yz2a6FgIaGqcxtwWw98iDyJoVu/J5lERKJscALovwEx8rqZ9SexbVlu0BtUi11rzgEVhHV5hfmcRrShOmfNEE+qtn0r8Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736024425; c=relaxed/simple;
	bh=lADtHy3qTgOlB3G7VWtD/MQoZwQfco46gJOrOwOufc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W5RLZPJp8qC4jom7PfvLsXeuC9urvjwMUmD8GiNWPLKvGNIrfwV9ZkEOnLNBOHV50a7GkSH5eznJVucqchcb+bqQYVxqLon5ybVa49Zq+nfRF/JwpzCxVoe2WLb3aX56ZkCjlGXJ8WJB9hMYiaPsJc9ApdZvg3GUmbMilpNcbl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTjzitl9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTjzitl9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736024423; x=1767560423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lADtHy3qTgOlB3G7VWtD/MQoZwQfco46gJOrOwOufc0=;
  b=MTjzitl9U4nk6j1o77naUf9TyHumm3M3D9p1BUsjIZfqJGr66X1p1jms
   FihcjdXANr/3vflqnuLHsJlHnlrKL5pE9pEmUD/1uKncKI2F5Qo8doNoE
   XpkU9qTNYO9itrTsR/rz/Axfu36hMf7k3bwZ/01noQLnyE7GRRmzFHlca
   /jNjMNhFrxLliXBzxaU70QuTq7DuGrBy7r9QWv4L9ck+ibW38Uu0oCU9z
   1/molqPKNdhwcmFKbAxViFPU451W/P48xIV8NkWuc+XWqSjp/PJlFFgXY
   qHgdM2x0Yk/duHaO5DfrEMQ4JAONmS89TITIXedwj1uCu2LdrOLHq/E04
   A==;
X-CSE-ConnectionGUID: Xn2Igk0XSauuTSSxJO/mzA==
X-CSE-MsgGUID: GKuAqHo2SP2d6wN13hXs4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="47214481"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="47214481"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 13:00:22 -0800
X-CSE-ConnectionGUID: lZIsuu5AStyxyj84C55svw==
X-CSE-MsgGUID: IqYIP/IETZmTlvpB2WDmEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107123669"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jan 2025 13:00:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUBFq-000BCF-3C;
	Sat, 04 Jan 2025 21:00:18 +0000
Date: Sun, 5 Jan 2025 05:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V1 6/6] spi: tegra210-quad: Introduce native DMA support
Message-ID: <202501050449.DliDXUbw-lkp@intel.com>
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
In-Reply-To: <20250103060407.1064107-7-va@nvidia.com>
References: <20250103060407.1064107-7-va@nvidia.com>
TO: Vishwaroop A <va@nvidia.com>
TO: thierry.reding@gmail.com
TO: jonathanh@nvidia.com
TO: skomatineni@nvidia.com
TO: ldewangan@nvidia.com
TO: broonie@kernel.org
TO: linux-spi@vger.kernel.org
TO: linux-tegra@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: kyarlagadda@nvidia.com
TO: smangipudi@nvidia.com
CC: va@nvidia.com

Hi Vishwaroop,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on robh/for-next broonie-sound/for-next linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishwaroop-A/arm64-tegra-Configure-QSPI-clocks-and-add-DMA/20250103-141217
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20250103060407.1064107-7-va%40nvidia.com
patch subject: [PATCH V1 6/6] spi: tegra210-quad: Introduce native DMA support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: hexagon-randconfig-r072-20250104 (https://download.01.org/0day-ci/archive/20250105/202501050449.DliDXUbw-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501050449.DliDXUbw-lkp@intel.com/

smatch warnings:
drivers/spi/spi-tegra210-quad.c:721 tegra_qspi_start_dma_based_transfer() warn: right shifting more than type allows 32 vs 32

vim +721 drivers/spi/spi-tegra210-quad.c

921fc1838fb036 Sowjanya Komatineni 2020-12-21  616  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  617  static int tegra_qspi_start_dma_based_transfer(struct tegra_qspi *tqspi, struct spi_transfer *t)
921fc1838fb036 Sowjanya Komatineni 2020-12-21  618  {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  619  	struct dma_slave_config dma_sconfig = { 0 };
5c423922546fcf Vishwaroop A        2025-01-03  620  	dma_addr_t rx_dma_phys, tx_dma_phys;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  621  	unsigned int len;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  622  	u8 dma_burst;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  623  	int ret = 0;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  624  	u32 val;
5c423922546fcf Vishwaroop A        2025-01-03  625  	bool has_ext_dma = tqspi->soc_data->has_ext_dma;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  626  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  627  	if (tqspi->is_packed) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  628  		ret = tegra_qspi_dma_map_xfer(tqspi, t);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  629  		if (ret < 0)
921fc1838fb036 Sowjanya Komatineni 2020-12-21  630  			return ret;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  631  	}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  632  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  633  	val = QSPI_DMA_BLK_SET(tqspi->curr_dma_words - 1);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  634  	tegra_qspi_writel(tqspi, val, QSPI_DMA_BLK);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  635  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  636  	tegra_qspi_unmask_irq(tqspi);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  637  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  638  	if (tqspi->is_packed)
921fc1838fb036 Sowjanya Komatineni 2020-12-21  639  		len = DIV_ROUND_UP(tqspi->curr_dma_words * tqspi->bytes_per_word, 4) * 4;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  640  	else
921fc1838fb036 Sowjanya Komatineni 2020-12-21  641  		len = tqspi->curr_dma_words * 4;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  642  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  643  	/* set attention level based on length of transfer */
5c423922546fcf Vishwaroop A        2025-01-03  644  	if (has_ext_dma) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  645  		val = 0;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  646  		if (len & 0xf) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  647  			val |= QSPI_TX_TRIG_1 | QSPI_RX_TRIG_1;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  648  			dma_burst = 1;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  649  		} else if (((len) >> 4) & 0x1) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  650  			val |= QSPI_TX_TRIG_4 | QSPI_RX_TRIG_4;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  651  			dma_burst = 4;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  652  		} else {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  653  			val |= QSPI_TX_TRIG_8 | QSPI_RX_TRIG_8;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  654  			dma_burst = 8;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  655  		}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  656  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  657  		tegra_qspi_writel(tqspi, val, QSPI_DMA_CTL);
5c423922546fcf Vishwaroop A        2025-01-03  658  	}
5c423922546fcf Vishwaroop A        2025-01-03  659  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  660  	tqspi->dma_control_reg = val;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  661  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  662  	dma_sconfig.device_fc = true;
5c423922546fcf Vishwaroop A        2025-01-03  663  
5c423922546fcf Vishwaroop A        2025-01-03  664  	if ((tqspi->cur_direction & DATA_DIR_TX)) {
5c423922546fcf Vishwaroop A        2025-01-03  665  		if (has_ext_dma) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  666  			dma_sconfig.dst_addr = tqspi->phys + QSPI_TX_FIFO;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  667  			dma_sconfig.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  668  			dma_sconfig.dst_maxburst = dma_burst;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  669  			ret = dmaengine_slave_config(tqspi->tx_dma_chan, &dma_sconfig);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  670  			if (ret < 0) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  671  				dev_err(tqspi->dev, "failed DMA slave config: %d\n", ret);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  672  				return ret;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  673  			}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  674  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  675  			tegra_qspi_copy_client_txbuf_to_qspi_txbuf(tqspi, t);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  676  			ret = tegra_qspi_start_tx_dma(tqspi, t, len);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  677  			if (ret < 0) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  678  				dev_err(tqspi->dev, "failed to starting TX DMA: %d\n", ret);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  679  				return ret;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  680  			}
5c423922546fcf Vishwaroop A        2025-01-03  681  		} else {
5c423922546fcf Vishwaroop A        2025-01-03  682  			if (tqspi->is_packed)
5c423922546fcf Vishwaroop A        2025-01-03  683  				tx_dma_phys = t->tx_dma;
5c423922546fcf Vishwaroop A        2025-01-03  684  			else
5c423922546fcf Vishwaroop A        2025-01-03  685  				tx_dma_phys = tqspi->tx_dma_phys;
5c423922546fcf Vishwaroop A        2025-01-03  686  			tegra_qspi_copy_client_txbuf_to_qspi_txbuf(tqspi, t);
5c423922546fcf Vishwaroop A        2025-01-03  687  			tegra_qspi_writel(tqspi, lower_32_bits(tx_dma_phys),
5c423922546fcf Vishwaroop A        2025-01-03  688  					  QSPI_DMA_MEM_ADDRESS_REG);
5c423922546fcf Vishwaroop A        2025-01-03  689  			tegra_qspi_writel(tqspi, (upper_32_bits(tx_dma_phys) & 0xff),
5c423922546fcf Vishwaroop A        2025-01-03  690  					  QSPI_DMA_HI_ADDRESS_REG);
5c423922546fcf Vishwaroop A        2025-01-03  691  		}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  692  	}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  693  
921fc1838fb036 Sowjanya Komatineni 2020-12-21  694  	if (tqspi->cur_direction & DATA_DIR_RX) {
5c423922546fcf Vishwaroop A        2025-01-03  695  		if (has_ext_dma) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  696  			dma_sconfig.src_addr = tqspi->phys + QSPI_RX_FIFO;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  697  			dma_sconfig.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  698  			dma_sconfig.src_maxburst = dma_burst;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  699  			ret = dmaengine_slave_config(tqspi->rx_dma_chan, &dma_sconfig);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  700  			if (ret < 0) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  701  				dev_err(tqspi->dev, "failed DMA slave config: %d\n", ret);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  702  				return ret;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  703  			}
921fc1838fb036 Sowjanya Komatineni 2020-12-21  704  			dma_sync_single_for_device(tqspi->dev, tqspi->rx_dma_phys,
5c423922546fcf Vishwaroop A        2025-01-03  705  						   tqspi->dma_buf_size, DMA_FROM_DEVICE);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  706  			ret = tegra_qspi_start_rx_dma(tqspi, t, len);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  707  			if (ret < 0) {
921fc1838fb036 Sowjanya Komatineni 2020-12-21  708  				dev_err(tqspi->dev, "failed to start RX DMA: %d\n", ret);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  709  				if (tqspi->cur_direction & DATA_DIR_TX)
921fc1838fb036 Sowjanya Komatineni 2020-12-21  710  					dmaengine_terminate_all(tqspi->tx_dma_chan);
921fc1838fb036 Sowjanya Komatineni 2020-12-21  711  				return ret;
921fc1838fb036 Sowjanya Komatineni 2020-12-21  712  			}
5c423922546fcf Vishwaroop A        2025-01-03  713  		} else {
5c423922546fcf Vishwaroop A        2025-01-03  714  			if (tqspi->is_packed)
5c423922546fcf Vishwaroop A        2025-01-03  715  				rx_dma_phys = t->rx_dma;
5c423922546fcf Vishwaroop A        2025-01-03  716  			else
5c423922546fcf Vishwaroop A        2025-01-03  717  				rx_dma_phys = tqspi->rx_dma_phys;
5c423922546fcf Vishwaroop A        2025-01-03  718  
5c423922546fcf Vishwaroop A        2025-01-03  719  			tegra_qspi_writel(tqspi, (rx_dma_phys & 0xffffffff),
5c423922546fcf Vishwaroop A        2025-01-03  720  					  QSPI_DMA_MEM_ADDRESS_REG);
5c423922546fcf Vishwaroop A        2025-01-03 @721  			tegra_qspi_writel(tqspi, ((rx_dma_phys >> 32) & 0xff),
5c423922546fcf Vishwaroop A        2025-01-03  722  					  QSPI_DMA_HI_ADDRESS_REG);
5c423922546fcf Vishwaroop A        2025-01-03  723  		}
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
