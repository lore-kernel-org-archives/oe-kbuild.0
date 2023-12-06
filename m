Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6429B1775A
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSD2x7RT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701848918; x=1733384918;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=R9Hm7a1lPjkCJUnfQ78iUGX5Sq2j75fdqN43RE9GJ28=;
  b=cSD2x7RT7ZrNw0Hl0JyLtNgcUsk0cQ5ymKJUYQIxmRlCo+WA/t+53U55
   5po8nHGxFOH/wQ94SZ/FQRJwjFbCAlRlwDuWDGxWXS/Gb3gm7bsb3XFa3
   7tnODbR33dQiTVx7mpoPFAk+7UNou4YnNZplA2iE/ZPGKKpX4VxP/Zv8m
   vALNro4r7flXDK+3xQEfPD9sp0+iaA8JyEgiqX+k8tGSdwjQH9xClzCvY
   yI41GOPViDNxgwOo9ZUL5GWGOClpQssZhpl1iyYgcaKhW90B5ea4dqOau
   7l69L/1Yfkxto+CESTVmchuV3T4S/sSDie/02K9LKZJ19RLHSbqt9w91n
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1082897"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1082897"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 23:48:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102732471"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1102732471"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 23:48:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAmdx-000AUE-0q;
	Wed, 06 Dec 2023 07:48:30 +0000
Date: Wed, 6 Dec 2023 15:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [xilinx-xlnx:lkp_test 31/42] drivers/spi/spi-xilinx.c:848
 xilinx_spi_probe() error: uninitialized symbol 'cs_num'.
Message-ID: <202312061510.A4fPKNsG-lkp@intel.com>
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
CC: git@amd.com
TO: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
CC: Tejas Prajapati Rameshchandra <tejaspra@xilinx.com>
CC: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
CC: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   414b0dc753ec961cf8e532b86412522e78a00169
commit: acbef9b5f7320871aa5567de891ac454923c72b7 [31/42] spi: spi-xilinx: Updated axi-qspi controller driver
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20231201 (https://download.01.org/0day-ci/archive/20231206/202312061510.A4fPKNsG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061510.A4fPKNsG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312061510.A4fPKNsG-lkp@intel.com/

smatch warnings:
drivers/spi/spi-xilinx.c:848 xilinx_spi_probe() error: uninitialized symbol 'cs_num'.

vim +/cs_num +848 drivers/spi/spi-xilinx.c

ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  607  
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  608  /* This driver supports single master mode only. Hence Tx FIFO Empty
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  609   * is the only interrupt we care about.
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  610   * Receive FIFO Overrun, Transmit FIFO Underrun, Mode Fault, and Slave Mode
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  611   * Fault are not to happen.
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  612   */
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  613  static irqreturn_t xilinx_spi_irq(int irq, void *dev_id)
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  614  {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  615  	struct spi_master *master = dev_id;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  616  	struct xilinx_spi *xspi = spi_master_get_devdata(dev_id);
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  617  	u32 ipif_isr;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  618  	irqreturn_t status = IRQ_NONE;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  619  
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  620  	/* Get the IPIF interrupts, and clear them immediately */
86fc593599c11b drivers/spi/xilinx_spi.c Richard Röjfors        2009-11-13  621  	ipif_isr = xspi->read_fn(xspi->regs + XIPIF_V123B_IISR_OFFSET);
86fc593599c11b drivers/spi/xilinx_spi.c Richard Röjfors        2009-11-13  622  	xspi->write_fn(ipif_isr, xspi->regs + XIPIF_V123B_IISR_OFFSET);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  623  	if (ipif_isr & XSPI_INTR_TX_EMPTY)  {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  624  		/* Transmission completed */
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  625  		xspi->rx_fifo(xspi);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  626  		if (xspi->bytes_to_transfer) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  627  			/* There is more data to send */
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  628  			xspi->tx_fifo(xspi);
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  629  		}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  630  		status = IRQ_HANDLED;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  631  	}
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  632  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  633  	if (!xspi->bytes_to_receive && !xspi->bytes_to_transfer) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  634  		/* Disable the interrupts here. */
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  635  		xspi->write_fn(0x0, xspi->regs + XIPIF_V123B_DGIER_OFFSET);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  636  		spi_finalize_current_transfer(master);
4c9a761402d780 drivers/spi/spi-xilinx.c Ricardo Ribalda        2015-01-28  637  	}
4c9a761402d780 drivers/spi/spi-xilinx.c Ricardo Ribalda        2015-01-28  638  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  639  	return status;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  640  }
7cb2abd05fe1f9 drivers/spi/spi-xilinx.c Mark Brown             2013-07-05  641  static int xilinx_spi_probe(struct platform_device *pdev)
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  642  {
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  643  	struct xilinx_spi *xspi;
ad3fdbcaf98dc1 drivers/spi/spi-xilinx.c Michal Simek           2013-07-08  644  	struct resource *res;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  645  	int ret;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  646  	u32 num_cs = 0, bits_per_word = 8;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  647  	u32 cs_num;
d81c0bbbf84086 drivers/spi/spi-xilinx.c Mark Brown             2013-07-03  648  	struct spi_master *master;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  649  	struct device_node *nc;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  650  	u32 tmp, rx_bus_width, fifo_size;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  651  	bool startup_block;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  652  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  653  	if (of_property_read_u32(pdev->dev.of_node, "num-cs", &num_cs))
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  654  		dev_info(&pdev->dev,
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  655  			 "Missing num-cs optional property, assuming default as <1>\n");
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  656  	if (!num_cs)
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  657  		num_cs = 1;
d81c0bbbf84086 drivers/spi/spi-xilinx.c Mark Brown             2013-07-03  658  
eb25f16c6f4469 drivers/spi/spi-xilinx.c Ricardo Ribalda        2015-01-28  659  	if (num_cs > XILINX_SPI_MAX_CS) {
eb25f16c6f4469 drivers/spi/spi-xilinx.c Ricardo Ribalda        2015-01-28  660  		dev_err(&pdev->dev, "Invalid number of spi slaves\n");
eb25f16c6f4469 drivers/spi/spi-xilinx.c Ricardo Ribalda        2015-01-28  661  		return -EINVAL;
eb25f16c6f4469 drivers/spi/spi-xilinx.c Ricardo Ribalda        2015-01-28  662  	}
eb25f16c6f4469 drivers/spi/spi-xilinx.c Ricardo Ribalda        2015-01-28  663  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  664  	startup_block = of_property_read_bool(pdev->dev.of_node,
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  665  					      "xlnx,startup-block");
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  666  	master = spi_alloc_master(&pdev->dev, sizeof(struct xilinx_spi));
d5af91a1faca68 drivers/spi/xilinx_spi.c Richard Röjfors        2009-11-13  667  	if (!master)
d81c0bbbf84086 drivers/spi/spi-xilinx.c Mark Brown             2013-07-03  668  		return -ENODEV;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  669  
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  670  	xspi = spi_master_get_devdata(master);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  671  	master->dev.of_node = pdev->dev.of_node;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  672  	platform_set_drvdata(pdev, master);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  673  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  674  	xspi->regs = devm_ioremap_resource(&pdev->dev, res);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  675  	if (IS_ERR(xspi->regs)) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  676  		ret = PTR_ERR(xspi->regs);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  677  		goto put_master;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  678  	}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  679  	ret = of_property_read_u32(pdev->dev.of_node, "fifo-size",
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  680  				   &fifo_size);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  681  	if (ret < 0) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  682  		dev_err(&pdev->dev,
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  683  			"Missing fifo size\n");
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  684  		return -EINVAL;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  685  	}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  686  	if (of_property_read_u32(pdev->dev.of_node, "bits-per-word",
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  687  				 &bits_per_word))
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  688  		dev_info(&pdev->dev,
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  689  			 "Missing bits-per-word optional property, assuming default as <8>\n");
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  690  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  691  	xspi->rx_bus_width = XSPI_ONE_BITS_PER_WORD;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  692  	for_each_available_child_of_node(pdev->dev.of_node, nc) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  693  		if (startup_block) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  694  			ret = of_property_read_u32(nc, "reg",
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  695  						   &cs_num);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  696  			if (ret < 0)
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  697  				return -EINVAL;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  698  		}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  699  		ret = of_property_read_u32(nc, "spi-rx-bus-width",
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  700  					   &rx_bus_width);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  701  		if (!ret) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  702  			xspi->rx_bus_width = rx_bus_width;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  703  			break;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  704  		}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  705  	}
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  706  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  707  	xspi->axi_clk = devm_clk_get(&pdev->dev, "axi_clk");
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  708  	if (IS_ERR(xspi->axi_clk)) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  709  		if (PTR_ERR(xspi->axi_clk) != -ENOENT) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  710  			ret = PTR_ERR(xspi->axi_clk);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  711  			goto put_master;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  712  		}
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  713  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  714  		/*
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  715  		 * Clock framework support is optional, continue on,
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  716  		 * anyways if we don't find a matching clock
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  717  		 */
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  718  		xspi->axi_clk = NULL;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  719  	}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  720  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  721  	ret = clk_prepare(xspi->axi_clk);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  722  	if (ret) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  723  		dev_err(&pdev->dev, "Failed to prepare AXI clock\n");
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  724  		goto put_master;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  725  	}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  726  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  727  	xspi->axi4_clk = devm_clk_get(&pdev->dev, "axi4_clk");
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  728  	if (IS_ERR(xspi->axi4_clk)) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  729  		if (PTR_ERR(xspi->axi4_clk) != -ENOENT) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  730  			ret = PTR_ERR(xspi->axi4_clk);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  731  			goto clk_unprepare_axi_clk;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  732  		}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  733  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  734  		/*
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  735  		 * Clock framework support is optional, continue on,
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  736  		 * anyways if we don't find a matching clock
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  737  		 */
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  738  		xspi->axi4_clk = NULL;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  739  	}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  740  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  741  	ret = clk_prepare(xspi->axi4_clk);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  742  	if (ret) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  743  		dev_err(&pdev->dev, "Failed to prepare AXI4 clock\n");
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  744  		goto clk_unprepare_axi_clk;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  745  	}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  746  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  747  	xspi->spi_clk = devm_clk_get(&pdev->dev, "spi_clk");
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  748  	if (IS_ERR(xspi->spi_clk)) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  749  		if (PTR_ERR(xspi->spi_clk) != -ENOENT) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  750  			ret = PTR_ERR(xspi->spi_clk);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  751  			goto clk_unprepare_axi4_clk;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  752  		}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  753  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  754  		/*
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  755  		 * Clock framework support is optional, continue on,
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  756  		 * anyways if we don't find a matching clock
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  757  		 */
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  758  		xspi->spi_clk = NULL;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  759  	}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  760  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  761  	ret = clk_prepare(xspi->spi_clk);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  762  	if (ret) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  763  		dev_err(&pdev->dev, "Failed to prepare SPI clock\n");
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  764  		goto clk_unprepare_axi4_clk;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  765  	}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  766  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  767  	pm_runtime_set_autosuspend_delay(&pdev->dev, SPI_AUTOSUSPEND_TIMEOUT);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  768  	pm_runtime_use_autosuspend(&pdev->dev);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  769  	pm_runtime_enable(&pdev->dev);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  770  	ret = pm_runtime_get_sync(&pdev->dev);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  771  	if (ret < 0)
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  772  		goto clk_unprepare_all;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  773  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  774  	xspi->dev = &pdev->dev;
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  775  
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  776  	/*
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  777  	 * Detect endianess on the IP via loop bit in CR. Detection
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  778  	 * must be done before reset is sent because incorrect reset
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  779  	 * value generates error interrupt.
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  780  	 * Setup little endian helper functions first and try to use them
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  781  	 * and check if bit was correctly setup or not.
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  782  	 */
0635287a308d38 drivers/spi/spi-xilinx.c Mark Brown             2015-01-30  783  	xspi->read_fn = xspi_read32;
0635287a308d38 drivers/spi/spi-xilinx.c Mark Brown             2015-01-30  784  	xspi->write_fn = xspi_write32;
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  785  
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  786  	xspi->write_fn(XSPI_CR_LOOP, xspi->regs + XSPI_CR_OFFSET);
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  787  	tmp = xspi->read_fn(xspi->regs + XSPI_CR_OFFSET);
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  788  	tmp &= XSPI_CR_LOOP;
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  789  	if (tmp != XSPI_CR_LOOP) {
0635287a308d38 drivers/spi/spi-xilinx.c Mark Brown             2015-01-30  790  		xspi->read_fn = xspi_read32_be;
0635287a308d38 drivers/spi/spi-xilinx.c Mark Brown             2015-01-30  791  		xspi->write_fn = xspi_write32_be;
86fc593599c11b drivers/spi/xilinx_spi.c Richard Röjfors        2009-11-13  792  	}
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek           2013-06-04  793  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  794  	xspi->buffer_size = fifo_size;
7b3b7432ae7848 drivers/spi/spi-xilinx.c Michal Simek           2013-07-09  795  	xspi->irq = platform_get_irq(pdev, 0);
4db9bf548bb00d drivers/spi/spi-xilinx.c Lars-Peter Clausen     2016-07-15  796  	if (xspi->irq < 0 && xspi->irq != -ENXIO) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  797  		ret = xspi->irq;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  798  		goto clk_unprepare_all;
4db9bf548bb00d drivers/spi/spi-xilinx.c Lars-Peter Clausen     2016-07-15  799  	} else if (xspi->irq >= 0) {
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  800  		/* Register for SPI Interrupt */
7b3b7432ae7848 drivers/spi/spi-xilinx.c Michal Simek           2013-07-09  801  		ret = devm_request_irq(&pdev->dev, xspi->irq, xilinx_spi_irq, 0,
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  802  				       dev_name(&pdev->dev), master);
d5af91a1faca68 drivers/spi/xilinx_spi.c Richard Röjfors        2009-11-13  803  		if (ret)
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  804  			goto clk_unprepare_all;
5fe11cc09ce81b drivers/spi/spi-xilinx.c Ricardo Ribalda        2015-01-28  805  	}
5fe11cc09ce81b drivers/spi/spi-xilinx.c Ricardo Ribalda        2015-01-28  806  
5fe11cc09ce81b drivers/spi/spi-xilinx.c Ricardo Ribalda        2015-01-28  807  	/* SPI controller initializations */
5fe11cc09ce81b drivers/spi/spi-xilinx.c Ricardo Ribalda        2015-01-28  808  	xspi_init_hw(xspi);
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  809  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  810  	pm_runtime_put(&pdev->dev);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  811  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  812  	master->bus_num = pdev->id;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  813  	master->num_chipselect = num_cs;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  814  	master->setup = xspi_setup;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  815  	master->set_cs = xspi_chipselect;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  816  	master->transfer_one = xspi_start_transfer;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  817  	master->prepare_transfer_hardware = xspi_prepare_transfer_hardware;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  818  	master->unprepare_transfer_hardware = xspi_unprepare_transfer_hardware;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  819  	master->bits_per_word_mask = SPI_BPW_MASK(bits_per_word);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  820  	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  821  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  822  	xspi->bytes_per_word = bits_per_word / 8;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  823  	xspi->tx_fifo = xspi_fill_tx_fifo_8;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  824  	xspi->rx_fifo = xspi_read_rx_fifo_8;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  825  	if (xspi->rx_bus_width == XSPI_RX_ONE_WIRE) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  826  		if (xspi->bytes_per_word == XSPI_TWO_BITS_PER_WORD) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  827  			xspi->tx_fifo = xspi_fill_tx_fifo_16;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  828  			xspi->rx_fifo = xspi_read_rx_fifo_16;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  829  		} else if (xspi->bytes_per_word == XSPI_FOUR_BITS_PER_WORD) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  830  			xspi->tx_fifo = xspi_fill_tx_fifo_32;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  831  			xspi->rx_fifo = xspi_read_rx_fifo_32;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  832  		}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  833  	} else if (xspi->rx_bus_width == XSPI_RX_FOUR_WIRE) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  834  		master->mode_bits |= SPI_TX_QUAD | SPI_RX_QUAD;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  835  	} else {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  836  		dev_err(&pdev->dev, "Dual Mode not supported\n");
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  837  		goto clk_unprepare_all;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  838  	}
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  839  	xspi->cs_inactive = 0xffffffff;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov       2007-07-17  840  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  841  	/*
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  842  	 * This is the work around for the startup block issue in
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  843  	 * the spi controller. SPI clock is passing through STARTUP
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  844  	 * block to FLASH. STARTUP block don't provide clock as soon
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  845  	 * as QSPI provides command. So first command fails.
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  846  	 */
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  847  	if (startup_block)
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23 @848  		xilinx_spi_startup_block(xspi, cs_num);
8fd8821b62397f drivers/spi/xilinx_spi.c Grant Likely           2010-10-14  849  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  850  	ret = spi_register_master(master);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  851  	if (ret) {
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  852  		dev_err(&pdev->dev, "spi_register_master failed\n");
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  853  		goto clk_unprepare_all;
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely           2010-10-14  854  	}
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely           2010-10-14  855  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  856  	return ret;
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  857  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  858  clk_unprepare_all:
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  859  	pm_runtime_disable(&pdev->dev);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  860  	pm_runtime_set_suspended(&pdev->dev);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  861  	clk_unprepare(xspi->spi_clk);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  862  clk_unprepare_axi4_clk:
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  863  	clk_unprepare(xspi->axi4_clk);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  864  clk_unprepare_axi_clk:
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  865  	clk_unprepare(xspi->axi_clk);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  866  put_master:
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  867  	spi_master_put(master);
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  868  
acbef9b5f73208 drivers/spi/spi-xilinx.c Naga Sureshkumar Relli 2023-01-23  869  	return ret;
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely           2010-10-14  870  }
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely           2010-10-14  871  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
