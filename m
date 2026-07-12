Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1FE28CF5F
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858345; cv=none; b=bGcHWLfPljBERVbUOy0myIibTRmohHoii2iSrVGd8wW3k0sL9tNQx6xgWFkISa4RY7UwxmFDAnmoRSoIx7oYPN+tPrUjG1pk+dAsYXX9K0UXDPVTd/5siohcM0E9NzWx8S4ciJr+W8lmwWn6CYdkA/gkOGVw9RA2RZ56oft2njE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858345; c=relaxed/simple;
	bh=Lf3Z6CsO3v1vXd4cUer6ZOjTVEAs9tWdpmaptlJ6xTE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h2h2nHQzFINDQt2khpcW1AkfH9JtCgDtZPRQ7NmPC6P9V2wzUR4hdGp25tDi/zEikXTS3E2bu0gopqt6SGJx1FGOkx0Y84VGbwXLgKvxtj/zLKAjR2300POSHOkw3gcKAtHijQ5uVgb+Uj/RCqxiKArSyH/gPJN4NldJg/S7feM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhY6kNes; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhY6kNes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783858342; x=1815394342;
  h=date:from:to:cc:subject:message-id;
  bh=Lf3Z6CsO3v1vXd4cUer6ZOjTVEAs9tWdpmaptlJ6xTE=;
  b=hhY6kNesCeAMZXRxNO8hyEGdyKP8LyP/nb1/EtXhlxfWYFCOJPv0qp3c
   AQ8noLd4UsJk+CQpvdGOsCD3w3n/ZuxzlI4ipPeIjsSS5JkRQ5627cWHM
   kgm5ZRCBVwt4XR/jLlqEEOJo4LvCTYG2HYadixV/1b71Ia97Rl9UUVvEN
   C6j3Tjd2db7rZ5tbVPd9f8GBm26NLpazttXs2oEGTHbfznaxgUulNoJTz
   r38ChsJGmQPy4QoHjdSMu3VpsZGaT/gunv3GO4cVi+hZpQ9C3Fi8MvgYj
   ftEbyz0XCNrr6N5k2cUIpXEYP0esVnB1949UgqA/qWvzS+Be3KfkUlfsy
   A==;
X-CSE-ConnectionGUID: 5T7RIQE1THqF4pGylVGgKg==
X-CSE-MsgGUID: NUmWwFJfQF2Zssw8ILTXqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95861862"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95861862"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 05:12:21 -0700
X-CSE-ConnectionGUID: GkOdNnC0RUecWzduzDGI/g==
X-CSE-MsgGUID: 8voOn+BNQYi72W7EHJ1jKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="257249915"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jul 2026 05:12:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wit2g-00000000KrK-069L;
	Sun, 12 Jul 2026 12:12:18 +0000
Date: Sun, 12 Jul 2026 20:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/spi/spi-axiado.c:433:8-10: WARNING: possible
 condition with no effect (if == else)
Message-ID: <202607121827.djB0zLAj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vladimir Moravcevic <vmoravcevic@axiado.com>
CC: Mark Brown <broonie@kernel.org>
CC: Prasad Bolisetty <pbolisetty@axiado.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd3210c47e8d3ac6b4e9141fc68acc03b38c0ba3
commit: e75a6b00ad7962a7ed1c9c777e9ab1eb29043ec8 spi: axiado: Add driver for Axiado SPI DB controller
date:   6 months ago
:::::: branch date: 33 hours ago
:::::: commit date: 6 months ago
config: hexagon-randconfig-r051-20260709 (https://download.01.org/0day-ci/archive/20260712/202607121827.djB0zLAj-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e75a6b00ad79 ("spi: axiado: Add driver for Axiado SPI DB controller")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607121827.djB0zLAj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-axiado.c:433:8-10: WARNING: possible condition with no effect (if == else)

vim +433 drivers/spi/spi-axiado.c

e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  386  
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  387  /**
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  388   * ax_transfer_one - Initiates the SPI transfer
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  389   * @ctlr:	Pointer to spi_controller structure
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  390   * @spi:	Pointer to the spi_device structure
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  391   * @transfer:	Pointer to the spi_transfer structure which provides
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  392   *		information about next transfer parameters
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  393   *
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  394   * This function fills the TX FIFO, starts the SPI transfer and
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  395   * returns a positive transfer count so that core will wait for completion.
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  396   *
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  397   * Return:	Number of bytes transferred in the last transfer
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  398   */
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  399  static int ax_transfer_one(struct spi_controller *ctlr,
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  400  			   struct spi_device *spi,
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  401  			   struct spi_transfer *transfer)
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  402  {
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  403  	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  404  	int drain_limit;
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  405  
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  406  	/* Pre-transfer cleanup:Flush the RX FIFO to discard any stale data.
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  407  	 * This is the crucial part. Before every new transfer, we must ensure
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  408  	 * the HW is in a clean state to avoid processing stale data
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  409  	 * from a previous, possibly failed or interrupted, transfer.
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  410  	 */
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  411  	drain_limit = AX_SPI_RX_FIFO_DRAIN_LIMIT; // Sane limit to prevent infinite loop on HW error
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  412  	while (ax_spi_read(xspi, AX_SPI_RX_FBCAR) > 0 && drain_limit-- > 0)
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  413  		ax_spi_read(xspi, AX_SPI_RXFIFO); // Read and discard
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  414  
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  415  	if (drain_limit <= 0)
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  416  		dev_warn(&ctlr->dev, "RX FIFO drain timeout before transfer\n");
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  417  
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  418  	/* Clear any stale interrupt flags from a previous transfer.
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  419  	 * This prevents an immediate, false interrupt trigger.
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  420  	 */
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  421  	ax_spi_write(xspi, AX_SPI_ISR, AX_SPI_ISR_CLR);
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  422  
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  423  	xspi->tx_buf = transfer->tx_buf;
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  424  	xspi->rx_buf = transfer->rx_buf;
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  425  	xspi->tx_bytes = transfer->len;
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  426  	xspi->rx_bytes = transfer->len;
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  427  
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  428  	/* Reset RX 32-bit to byte buffer for each new transfer */
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  429  	if (transfer->tx_buf && !transfer->rx_buf) {
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  430  		/* TX mode: discard all received data */
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  431  		xspi->rx_discard = transfer->len;
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  432  		xspi->rx_copy_remaining = 0;
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07 @433  	} else if ((!transfer->tx_buf && transfer->rx_buf) ||
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  434  		   (transfer->tx_buf && transfer->rx_buf)) {
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  435  		/* RX mode: generate clock by filling TX FIFO with dummy bytes
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  436  		 * Full-duplex mode: generate clock by filling TX FIFO
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  437  		 */
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  438  		xspi->rx_discard = 0;
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  439  		xspi->rx_copy_remaining = transfer->len;
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  440  	} else {
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  441  		/* No TX and RX */
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  442  		xspi->rx_discard = 0;
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  443  		xspi->rx_copy_remaining = transfer->len;
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  444  	}
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  445  
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  446  	ax_spi_setup_transfer(spi, transfer);
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  447  	ax_spi_fill_tx_fifo(xspi);
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  448  	ax_spi_write(xspi, AX_SPI_CR2, (AX_SPI_CR2_HTE | AX_SPI_CR2_SRD | AX_SPI_CR2_SWD));
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  449  
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  450  	ax_spi_write(xspi, AX_SPI_IMR, (AX_SPI_IMR_MTCM | AX_SPI_IMR_RFFM));
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  451  	return transfer->len;
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  452  }
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  453  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
