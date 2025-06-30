Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED134242909
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jun 2025 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751276816; cv=none; b=qJK/vqS7WlSfQHAaAj/htsjZajCS0v4VcOG8Fp/wQlHEU6tyrrk/gOpwyE37o3Y/BF/KWIzEKmzKYHsv71asBubUUbG4eGZzZQIX8ZJJaDj2qnOzjuX9sw0DcXKMhSqwKY5/5dHdpVmxTH4VosgSowgno+G0RGL7+TtfY9maMfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751276816; c=relaxed/simple;
	bh=hsH2hOsqLDnoJelv1afnl58BXHmDOpHa2DTyyvkQfSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a95tfFzbi0QVu6Ub1nUf++oQFX65IIyL/b5g60xRkOzj+Bz1Xgy3fCZmv+jsBrrlUN5YIkjNjH+FwjY9QprRA6NTghZxcYGy1i6Oq3vOdK27bBxvowWCoVdgEShn86+9TqFDPYBEv+fydhIn9qCHJnLOQNBHuxcEY3nFZ9eChp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lm/L3sWV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lm/L3sWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751276815; x=1782812815;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hsH2hOsqLDnoJelv1afnl58BXHmDOpHa2DTyyvkQfSI=;
  b=Lm/L3sWVJs/ANMy2AHjZYz8+EhKfYCgGMtOKiF9V3ZHwf8NfiFrjQ9ME
   hTbbFZVlq02hooD+aWuS7wE/QlaK2NQmFsg3k2QxCZbk1oLuYMaiJGRdu
   QZolcOngo9ZUMiC1FOtYHNQlCJfXIDN+VbBbIhPAOtPnY4PzceFsDSHT+
   7zvG8twDrkYRFmeZvxcvYRrfD3XrrA/Te3qcnejb4O0Pg/BoVgefYRuRk
   gYxCqpsihOx5i8xWtYf/Zf0p46iyEf20CCN8UdPBJaLSExi2jqmriNv1L
   n7BtNPI+xqe6vuwSck5fWFhvNCcjuQsK3xMfZnlnMB6rEa20rvbt+4Jh0
   g==;
X-CSE-ConnectionGUID: bZQZuknMTa+gyMM/hHcVsw==
X-CSE-MsgGUID: eHE5NWHlSCaBW0WrT5j76A==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53372391"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53372391"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:46:35 -0700
X-CSE-ConnectionGUID: Ya5Z/86CSJS3cfO8cPGzEQ==
X-CSE-MsgGUID: X1YsMN9IRUO2e2wgqtp/sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="184335820"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jun 2025 02:46:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWB5q-000YkI-2v;
	Mon, 30 Jun 2025 09:46:30 +0000
Date: Mon, 30 Jun 2025 17:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4406/6007] drivers/spi/spi-stm32.c:1649
 stm32_spi_transfer_one_dma() error: we previously assumed 'spi->mdma_rx'
 could be null (see line 1595)
Message-ID: <202506301711.dpgDtmQt-lkp@intel.com>
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
TO: "Clément Le Goffic" <clement.legoffic@foss.st.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1343433ed38923a21425c602e92120a1f1db5f7a
commit: d17dd2f1d8a1d919e39c6302b024f135a2f90773 [4406/6007] spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use
:::::: branch date: 3 hours ago
:::::: commit date: 6 days ago
config: arm-randconfig-r072-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301711.dpgDtmQt-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506301711.dpgDtmQt-lkp@intel.com/

New smatch warnings:
drivers/spi/spi-stm32.c:1649 stm32_spi_transfer_one_dma() error: we previously assumed 'spi->mdma_rx' could be null (see line 1595)

Old smatch warnings:
drivers/spi/spi-stm32.c:1532 stm32_spi_prepare_rx_dma_mdma_chaining() warn: variable dereferenced before check 'rx_dma_desc' (see line 1527)
drivers/spi/spi-stm32.c:1566 stm32_spi_prepare_rx_dma_mdma_chaining() warn: variable dereferenced before check 'rx_mdma_desc' (see line 1561)

vim +1649 drivers/spi/spi-stm32.c

d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1573  
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1574  /**
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1575   * stm32_spi_transfer_one_dma - transfer a single spi_transfer using DMA
1c52be8bed83e1 Alain Volmat      2020-03-20  1576   * @spi: pointer to the spi controller data structure
1c52be8bed83e1 Alain Volmat      2020-03-20  1577   * @xfer: pointer to the spi_transfer structure
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1578   *
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1579   * It must returns 0 if the transfer is finished or 1 if the transfer is still
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1580   * in progress.
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1581   */
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1582  static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1583  				      struct spi_transfer *xfer)
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1584  {
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1585  	struct dma_async_tx_descriptor *rx_mdma_desc = NULL, *rx_dma_desc = NULL;
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1586  	struct dma_async_tx_descriptor *tx_dma_desc = NULL;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1587  	struct dma_slave_config tx_dma_conf, rx_dma_conf;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1588  	unsigned long flags;
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1589  	int ret = 0;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1590  
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1591  	spin_lock_irqsave(&spi->lock, flags);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1592  
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1593  	if (spi->rx_buf && spi->dma_rx) {
6f98f25247b7ef Alain Volmat      2023-12-18  1594  		stm32_spi_dma_config(spi, spi->dma_rx, &rx_dma_conf, DMA_DEV_TO_MEM);
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16 @1595  		if (spi->mdma_rx) {
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1596  			rx_dma_conf.peripheral_size = 1;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1597  			dmaengine_slave_config(spi->dma_rx, &rx_dma_conf);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1598  
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1599  			ret = stm32_spi_prepare_rx_dma_mdma_chaining(spi, xfer, &rx_dma_conf,
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1600  								     &rx_dma_desc, &rx_mdma_desc);
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1601  			if (ret) { /* RX DMA MDMA chaining not possible, fallback to DMA only */
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1602  				rx_dma_conf.peripheral_config = 0;
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1603  				rx_dma_desc = NULL;
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1604  			}
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1605  		}
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1606  		if (!rx_dma_desc) {
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1607  			dmaengine_slave_config(spi->dma_rx, &rx_dma_conf);
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1608  			rx_dma_desc = dmaengine_prep_slave_sg(spi->dma_rx, xfer->rx_sg.sgl,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1609  							      xfer->rx_sg.nents,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1610  							      rx_dma_conf.direction,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1611  							      DMA_PREP_INTERRUPT);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1612  		}
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1613  	}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1614  
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1615  	if (spi->tx_buf && spi->dma_tx) {
6f98f25247b7ef Alain Volmat      2023-12-18  1616  		stm32_spi_dma_config(spi, spi->dma_tx, &tx_dma_conf, DMA_MEM_TO_DEV);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1617  		dmaengine_slave_config(spi->dma_tx, &tx_dma_conf);
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1618  		tx_dma_desc = dmaengine_prep_slave_sg(spi->dma_tx, xfer->tx_sg.sgl,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1619  						      xfer->tx_sg.nents,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1620  						      tx_dma_conf.direction,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1621  						      DMA_PREP_INTERRUPT);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1622  	}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1623  
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1624  	if ((spi->tx_buf && spi->dma_tx && !tx_dma_desc) ||
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1625  	    (spi->rx_buf && spi->dma_rx && !rx_dma_desc))
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1626  		goto dma_desc_error;
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1627  
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1628  	if (spi->cur_comm == SPI_FULL_DUPLEX && (!tx_dma_desc || !rx_dma_desc))
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1629  		goto dma_desc_error;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1630  
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1631  	if (rx_dma_desc) {
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1632  		if (rx_mdma_desc) {
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1633  			rx_mdma_desc->callback = spi->cfg->dma_rx_cb;
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1634  			rx_mdma_desc->callback_param = spi;
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1635  		} else {
55166853b2f56c Cezary Gapinski   2018-12-24  1636  			rx_dma_desc->callback = spi->cfg->dma_rx_cb;
7b821a6485c943 Amelie Delaunay   2017-06-27  1637  			rx_dma_desc->callback_param = spi;
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1638  		}
7b821a6485c943 Amelie Delaunay   2017-06-27  1639  
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1640  		/* Enable Rx DMA request */
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1641  		stm32_spi_set_bits(spi, spi->cfg->regs->dma_rx_en.reg,
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1642  				   spi->cfg->regs->dma_rx_en.mask);
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1643  		if (rx_mdma_desc) {
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1644  			if (dma_submit_error(dmaengine_submit(rx_mdma_desc))) {
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1645  				dev_err(spi->dev, "Rx MDMA submit failed\n");
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1646  				goto dma_desc_error;
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1647  			}
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1648  			/* Enable Rx MDMA channel */
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16 @1649  			dma_async_issue_pending(spi->mdma_rx);
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1650  		}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1651  		if (dma_submit_error(dmaengine_submit(rx_dma_desc))) {
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1652  			dev_err(spi->dev, "Rx DMA submit failed\n");
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1653  			goto dma_desc_error;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1654  		}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1655  		/* Enable Rx DMA channel */
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1656  		dma_async_issue_pending(spi->dma_rx);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1657  	}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1658  
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1659  	if (tx_dma_desc) {
9d5fce166c7a26 Cezary Gapinski   2018-12-24  1660  		if (spi->cur_comm == SPI_SIMPLEX_TX ||
9d5fce166c7a26 Cezary Gapinski   2018-12-24  1661  		    spi->cur_comm == SPI_3WIRE_TX) {
55166853b2f56c Cezary Gapinski   2018-12-24  1662  			tx_dma_desc->callback = spi->cfg->dma_tx_cb;
7b821a6485c943 Amelie Delaunay   2017-06-27  1663  			tx_dma_desc->callback_param = spi;
7b821a6485c943 Amelie Delaunay   2017-06-27  1664  		}
7b821a6485c943 Amelie Delaunay   2017-06-27  1665  
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1666  		if (dma_submit_error(dmaengine_submit(tx_dma_desc))) {
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1667  			dev_err(spi->dev, "Tx DMA submit failed\n");
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1668  			goto dma_submit_error;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1669  		}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1670  		/* Enable Tx DMA channel */
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1671  		dma_async_issue_pending(spi->dma_tx);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1672  
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1673  		/* Enable Tx DMA request */
55166853b2f56c Cezary Gapinski   2018-12-24  1674  		stm32_spi_set_bits(spi, spi->cfg->regs->dma_tx_en.reg,
55166853b2f56c Cezary Gapinski   2018-12-24  1675  				   spi->cfg->regs->dma_tx_en.mask);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1676  	}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1677  
55166853b2f56c Cezary Gapinski   2018-12-24  1678  	spi->cfg->transfer_one_dma_start(spi);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1679  
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1680  	spin_unlock_irqrestore(&spi->lock, flags);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1681  
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1682  	return 1;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1683  
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1684  dma_submit_error:
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1685  	if (spi->mdma_rx)
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1686  		dmaengine_terminate_sync(spi->mdma_rx);
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1687  	if (spi->dma_rx)
4f2b39dc2d14d4 Alain Volmat      2023-06-15  1688  		dmaengine_terminate_sync(spi->dma_rx);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1689  
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1690  dma_desc_error:
55166853b2f56c Cezary Gapinski   2018-12-24  1691  	stm32_spi_clr_bits(spi, spi->cfg->regs->dma_rx_en.reg,
55166853b2f56c Cezary Gapinski   2018-12-24  1692  			   spi->cfg->regs->dma_rx_en.mask);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1693  
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1694  	spin_unlock_irqrestore(&spi->lock, flags);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1695  
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1696  	dev_info(spi->dev, "DMA issue: fall back to irq transfer\n");
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1697  
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1698  	if (spi->sram_rx_buf)
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1699  		memset(spi->sram_rx_buf, 0, spi->sram_rx_buf_size);
d17dd2f1d8a1d9 Clément Le Goffic 2025-06-16  1700  
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1701  	spi->cur_usedma = false;
55166853b2f56c Cezary Gapinski   2018-12-24  1702  	return spi->cfg->transfer_one_irq(spi);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1703  }
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1704  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
