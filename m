Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF86C8EA
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 16:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690473867; x=1722009867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ow1XikXoWO82F031Bmt9I9KUswIcy89qqMscANFZOH0=;
  b=lvSDlwvwppRF22KiCBFXucYbEqynMttv5YyO18vdO5ecMgCqAAWeh4iQ
   A2TwMcb2sR50/mKoOJLQ6ROhM2wOGOLygE8KTTC4xy1UuZr07fOTTD2V5
   +idDcXjpsMgev3oLFXsWE6A7z0oxUer0yfRzunQaBx3Kts0gwX/UA5vkD
   uKiOQeevMiOq0e4vWEMwawAK/6du6nnv5r4pR42buj5QknLC/vfGjWe2q
   L/+EBDz3L0gv4xth6ay0pttpJpft9GBg+Yscp78F/ud+VrkagLwwJs8j6
   HgQ0tB9tvkkU02D7N6o6s6yDXBpw7jUSktF0Sv/Z39oNapFKQRhIr7Ykx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348630833"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="348630833"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 09:03:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="677194558"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="677194558"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 27 Jul 2023 09:03:53 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP3Sy-0002OZ-1m;
	Thu, 27 Jul 2023 16:03:52 +0000
Date: Fri, 28 Jul 2023 00:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i2c/busses/i2c-qcom-geni.c:937 geni_i2c_probe() warn:
 'gi2c->core_clk' from clk_prepare_enable() not released on lines: 863,896.
Message-ID: <202307280005.OmBtyLC0-lkp@intel.com>
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
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a8db05b571ad5b8d5c8774a004c0424260a90bd
commit: 14d02fbadb5dc1cdf66078ef8430dd1cd22bfd53 i2c: qcom-geni: add desc struct to prepare support for I2C Master Hub variant
date:   8 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-m041-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280005.OmBtyLC0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280005.OmBtyLC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307280005.OmBtyLC0-lkp@intel.com/

New smatch warnings:
drivers/i2c/busses/i2c-qcom-geni.c:937 geni_i2c_probe() warn: 'gi2c->core_clk' from clk_prepare_enable() not released on lines: 863,896.
drivers/i2c/busses/i2c-qcom-geni.c:997 geni_i2c_runtime_resume() warn: 'gi2c->core_clk' from clk_prepare_enable() not released on lines: 993.

Old smatch warnings:
drivers/i2c/busses/i2c-qcom-geni.c:645 geni_i2c_gpi_xfer() error: uninitialized symbol 'rx_addr'.
drivers/i2c/busses/i2c-qcom-geni.c:654 geni_i2c_gpi_xfer() error: uninitialized symbol 'tx_addr'.
drivers/i2c/busses/i2c-qcom-geni.c:654 geni_i2c_gpi_xfer() error: uninitialized symbol 'rx_addr'.

vim +937 drivers/i2c/busses/i2c-qcom-geni.c

d8703554f4dea9 Vinod Koul                  2022-02-21  767  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  768  static int geni_i2c_probe(struct platform_device *pdev)
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  769  {
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  770  	struct geni_i2c_dev *gi2c;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  771  	struct resource *res;
d8703554f4dea9 Vinod Koul                  2022-02-21  772  	u32 proto, tx_depth, fifo_disable;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  773  	int ret;
3b7d81f08a6a2b Stephen Boyd                2020-03-10  774  	struct device *dev = &pdev->dev;
14d02fbadb5dc1 Neil Armstrong              2022-11-29  775  	const struct geni_i2c_desc *desc = NULL;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  776  
3b7d81f08a6a2b Stephen Boyd                2020-03-10  777  	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  778  	if (!gi2c)
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  779  		return -ENOMEM;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  780  
3b7d81f08a6a2b Stephen Boyd                2020-03-10  781  	gi2c->se.dev = dev;
3b7d81f08a6a2b Stephen Boyd                2020-03-10  782  	gi2c->se.wrapper = dev_get_drvdata(dev->parent);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  783  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
3b7d81f08a6a2b Stephen Boyd                2020-03-10  784  	gi2c->se.base = devm_ioremap_resource(dev, res);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  785  	if (IS_ERR(gi2c->se.base))
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  786  		return PTR_ERR(gi2c->se.base);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  787  
14d02fbadb5dc1 Neil Armstrong              2022-11-29  788  	desc = device_get_match_data(&pdev->dev);
14d02fbadb5dc1 Neil Armstrong              2022-11-29  789  
14d02fbadb5dc1 Neil Armstrong              2022-11-29  790  	if (desc && desc->has_core_clk) {
14d02fbadb5dc1 Neil Armstrong              2022-11-29  791  		gi2c->core_clk = devm_clk_get(dev, "core");
14d02fbadb5dc1 Neil Armstrong              2022-11-29  792  		if (IS_ERR(gi2c->core_clk))
14d02fbadb5dc1 Neil Armstrong              2022-11-29  793  			return PTR_ERR(gi2c->core_clk);
14d02fbadb5dc1 Neil Armstrong              2022-11-29  794  	}
14d02fbadb5dc1 Neil Armstrong              2022-11-29  795  
3b7d81f08a6a2b Stephen Boyd                2020-03-10  796  	gi2c->se.clk = devm_clk_get(dev, "se");
3b7d81f08a6a2b Stephen Boyd                2020-03-10  797  	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(dev))
3b7d81f08a6a2b Stephen Boyd                2020-03-10  798  		return PTR_ERR(gi2c->se.clk);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  799  
3b7d81f08a6a2b Stephen Boyd                2020-03-10  800  	ret = device_property_read_u32(dev, "clock-frequency",
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  801  				       &gi2c->clk_freq_out);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  802  	if (ret) {
3b7d81f08a6a2b Stephen Boyd                2020-03-10  803  		dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  804  		gi2c->clk_freq_out = KHZ(100);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  805  	}
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  806  
3b7d81f08a6a2b Stephen Boyd                2020-03-10  807  	if (has_acpi_companion(dev))
3b7d81f08a6a2b Stephen Boyd                2020-03-10  808  		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
c9913ac42135cf Lee Jones                   2019-06-12  809  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  810  	gi2c->irq = platform_get_irq(pdev, 0);
3b7d81f08a6a2b Stephen Boyd                2020-03-10  811  	if (gi2c->irq < 0)
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  812  		return gi2c->irq;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  813  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  814  	ret = geni_i2c_clk_map_idx(gi2c);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  815  	if (ret) {
3b7d81f08a6a2b Stephen Boyd                2020-03-10  816  		dev_err(dev, "Invalid clk frequency %d Hz: %d\n",
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  817  			gi2c->clk_freq_out, ret);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  818  		return ret;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  819  	}
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  820  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  821  	gi2c->adap.algo = &geni_i2c_algo;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  822  	init_completion(&gi2c->done);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  823  	spin_lock_init(&gi2c->lock);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  824  	platform_set_drvdata(pdev, gi2c);
3b7d81f08a6a2b Stephen Boyd                2020-03-10  825  	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
3b7d81f08a6a2b Stephen Boyd                2020-03-10  826  			       dev_name(dev), gi2c);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  827  	if (ret) {
3b7d81f08a6a2b Stephen Boyd                2020-03-10  828  		dev_err(dev, "Request_irq failed:%d: err:%d\n",
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  829  			gi2c->irq, ret);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  830  		return ret;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  831  	}
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  832  	/* Disable the interrupt so that the system can enter low-power mode */
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  833  	disable_irq(gi2c->irq);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  834  	i2c_set_adapdata(&gi2c->adap, gi2c);
3b7d81f08a6a2b Stephen Boyd                2020-03-10  835  	gi2c->adap.dev.parent = dev;
3b7d81f08a6a2b Stephen Boyd                2020-03-10  836  	gi2c->adap.dev.of_node = dev->of_node;
ea1558ce149d28 Wolfram Sang                2022-08-11  837  	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  838  
14d02fbadb5dc1 Neil Armstrong              2022-11-29  839  	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");
bf225ed357c65e Akash Asthana               2020-06-23  840  	if (ret)
bf225ed357c65e Akash Asthana               2020-06-23  841  		return ret;
bf225ed357c65e Akash Asthana               2020-06-23  842  	/*
bf225ed357c65e Akash Asthana               2020-06-23  843  	 * Set the bus quota for core and cpu to a reasonable value for
bf225ed357c65e Akash Asthana               2020-06-23  844  	 * register access.
bf225ed357c65e Akash Asthana               2020-06-23  845  	 * Set quota for DDR based on bus speed.
bf225ed357c65e Akash Asthana               2020-06-23  846  	 */
bf225ed357c65e Akash Asthana               2020-06-23  847  	gi2c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
bf225ed357c65e Akash Asthana               2020-06-23  848  	gi2c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
14d02fbadb5dc1 Neil Armstrong              2022-11-29  849  	if (!desc || desc->icc_ddr)
bf225ed357c65e Akash Asthana               2020-06-23  850  		gi2c->se.icc_paths[GENI_TO_DDR].avg_bw = Bps_to_icc(gi2c->clk_freq_out);
bf225ed357c65e Akash Asthana               2020-06-23  851  
bf225ed357c65e Akash Asthana               2020-06-23  852  	ret = geni_icc_set_bw(&gi2c->se);
bf225ed357c65e Akash Asthana               2020-06-23  853  	if (ret)
bf225ed357c65e Akash Asthana               2020-06-23  854  		return ret;
bf225ed357c65e Akash Asthana               2020-06-23  855  
14d02fbadb5dc1 Neil Armstrong              2022-11-29  856  	ret = clk_prepare_enable(gi2c->core_clk);
14d02fbadb5dc1 Neil Armstrong              2022-11-29  857  	if (ret)
14d02fbadb5dc1 Neil Armstrong              2022-11-29  858  		return ret;
14d02fbadb5dc1 Neil Armstrong              2022-11-29  859  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  860  	ret = geni_se_resources_on(&gi2c->se);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  861  	if (ret) {
3b7d81f08a6a2b Stephen Boyd                2020-03-10  862  		dev_err(dev, "Error turning on resources %d\n", ret);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  863  		return ret;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  864  	}
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  865  	proto = geni_se_read_proto(&gi2c->se);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  866  	if (proto != GENI_SE_I2C) {
3b7d81f08a6a2b Stephen Boyd                2020-03-10  867  		dev_err(dev, "Invalid proto %d\n", proto);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  868  		geni_se_resources_off(&gi2c->se);
14d02fbadb5dc1 Neil Armstrong              2022-11-29  869  		clk_disable_unprepare(gi2c->core_clk);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  870  		return -ENXIO;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  871  	}
d8703554f4dea9 Vinod Koul                  2022-02-21  872  
14d02fbadb5dc1 Neil Armstrong              2022-11-29  873  	if (desc && desc->no_dma_support)
14d02fbadb5dc1 Neil Armstrong              2022-11-29  874  		fifo_disable = false;
14d02fbadb5dc1 Neil Armstrong              2022-11-29  875  	else
d8703554f4dea9 Vinod Koul                  2022-02-21  876  		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
14d02fbadb5dc1 Neil Armstrong              2022-11-29  877  
d8703554f4dea9 Vinod Koul                  2022-02-21  878  	if (fifo_disable) {
d8703554f4dea9 Vinod Koul                  2022-02-21  879  		/* FIFO is disabled, so we can only use GPI DMA */
d8703554f4dea9 Vinod Koul                  2022-02-21  880  		gi2c->gpi_mode = true;
d8703554f4dea9 Vinod Koul                  2022-02-21  881  		ret = setup_gpi_dma(gi2c);
c60bd968c74749 Bjorn Andersson             2022-04-12  882  		if (ret)
c60bd968c74749 Bjorn Andersson             2022-04-12  883  			return dev_err_probe(dev, ret, "Failed to setup GPI DMA mode\n");
d8703554f4dea9 Vinod Koul                  2022-02-21  884  
d8703554f4dea9 Vinod Koul                  2022-02-21  885  		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
d8703554f4dea9 Vinod Koul                  2022-02-21  886  	} else {
d8703554f4dea9 Vinod Koul                  2022-02-21  887  		gi2c->gpi_mode = false;
d8703554f4dea9 Vinod Koul                  2022-02-21  888  		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
14d02fbadb5dc1 Neil Armstrong              2022-11-29  889  
14d02fbadb5dc1 Neil Armstrong              2022-11-29  890  		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
14d02fbadb5dc1 Neil Armstrong              2022-11-29  891  		if (!tx_depth && desc)
14d02fbadb5dc1 Neil Armstrong              2022-11-29  892  			tx_depth = desc->tx_fifo_depth;
14d02fbadb5dc1 Neil Armstrong              2022-11-29  893  
14d02fbadb5dc1 Neil Armstrong              2022-11-29  894  		if (!tx_depth) {
14d02fbadb5dc1 Neil Armstrong              2022-11-29  895  			dev_err(dev, "Invalid TX FIFO depth\n");
14d02fbadb5dc1 Neil Armstrong              2022-11-29  896  			return -EINVAL;
14d02fbadb5dc1 Neil Armstrong              2022-11-29  897  		}
14d02fbadb5dc1 Neil Armstrong              2022-11-29  898  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  899  		gi2c->tx_wm = tx_depth - 1;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  900  		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
d8703554f4dea9 Vinod Koul                  2022-02-21  901  		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
d8703554f4dea9 Vinod Koul                  2022-02-21  902  				       PACKING_BYTES_PW, true, true, true);
d8703554f4dea9 Vinod Koul                  2022-02-21  903  
d8703554f4dea9 Vinod Koul                  2022-02-21  904  		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
d8703554f4dea9 Vinod Koul                  2022-02-21  905  	}
d8703554f4dea9 Vinod Koul                  2022-02-21  906  
14d02fbadb5dc1 Neil Armstrong              2022-11-29  907  	clk_disable_unprepare(gi2c->core_clk);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  908  	ret = geni_se_resources_off(&gi2c->se);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  909  	if (ret) {
3b7d81f08a6a2b Stephen Boyd                2020-03-10  910  		dev_err(dev, "Error turning off resources %d\n", ret);
d8703554f4dea9 Vinod Koul                  2022-02-21  911  		goto err_dma;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  912  	}
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  913  
bf225ed357c65e Akash Asthana               2020-06-23  914  	ret = geni_icc_disable(&gi2c->se);
bf225ed357c65e Akash Asthana               2020-06-23  915  	if (ret)
d8703554f4dea9 Vinod Koul                  2022-02-21  916  		goto err_dma;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  917  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  918  	gi2c->suspended = 1;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  919  	pm_runtime_set_suspended(gi2c->se.dev);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  920  	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  921  	pm_runtime_use_autosuspend(gi2c->se.dev);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  922  	pm_runtime_enable(gi2c->se.dev);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  923  
848bd3f3de9d44 Stephen Boyd                2018-11-02  924  	ret = i2c_add_adapter(&gi2c->adap);
848bd3f3de9d44 Stephen Boyd                2018-11-02  925  	if (ret) {
3b7d81f08a6a2b Stephen Boyd                2020-03-10  926  		dev_err(dev, "Error adding i2c adapter %d\n", ret);
848bd3f3de9d44 Stephen Boyd                2018-11-02  927  		pm_runtime_disable(gi2c->se.dev);
d8703554f4dea9 Vinod Koul                  2022-02-21  928  		goto err_dma;
848bd3f3de9d44 Stephen Boyd                2018-11-02  929  	}
848bd3f3de9d44 Stephen Boyd                2018-11-02  930  
3b7d81f08a6a2b Stephen Boyd                2020-03-10  931  	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
c3c2889b8a2c9d Lee Jones                   2019-06-12  932  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  933  	return 0;
d8703554f4dea9 Vinod Koul                  2022-02-21  934  
d8703554f4dea9 Vinod Koul                  2022-02-21  935  err_dma:
d8703554f4dea9 Vinod Koul                  2022-02-21  936  	release_gpi_dma(gi2c);
d8703554f4dea9 Vinod Koul                  2022-02-21 @937  	return ret;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  938  }
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  939  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  940  static int geni_i2c_remove(struct platform_device *pdev)
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  941  {
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  942  	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  943  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  944  	i2c_del_adapter(&gi2c->adap);
d8703554f4dea9 Vinod Koul                  2022-02-21  945  	release_gpi_dma(gi2c);
848bd3f3de9d44 Stephen Boyd                2018-11-02  946  	pm_runtime_disable(gi2c->se.dev);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  947  	return 0;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  948  }
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  949  
9f78c607600ce4 Roja Rani Yarubandi         2021-05-25  950  static void geni_i2c_shutdown(struct platform_device *pdev)
9f78c607600ce4 Roja Rani Yarubandi         2021-05-25  951  {
9f78c607600ce4 Roja Rani Yarubandi         2021-05-25  952  	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
9f78c607600ce4 Roja Rani Yarubandi         2021-05-25  953  
9f78c607600ce4 Roja Rani Yarubandi         2021-05-25  954  	/* Make client i2c transfers start failing */
9f78c607600ce4 Roja Rani Yarubandi         2021-05-25  955  	i2c_mark_adapter_suspended(&gi2c->adap);
9f78c607600ce4 Roja Rani Yarubandi         2021-05-25  956  }
9f78c607600ce4 Roja Rani Yarubandi         2021-05-25  957  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  958  static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  959  {
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  960  	int ret;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  961  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  962  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  963  	disable_irq(gi2c->irq);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  964  	ret = geni_se_resources_off(&gi2c->se);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  965  	if (ret) {
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  966  		enable_irq(gi2c->irq);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  967  		return ret;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  968  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  969  	} else {
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  970  		gi2c->suspended = 1;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  971  	}
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  972  
14d02fbadb5dc1 Neil Armstrong              2022-11-29  973  	clk_disable_unprepare(gi2c->core_clk);
14d02fbadb5dc1 Neil Armstrong              2022-11-29  974  
bf225ed357c65e Akash Asthana               2020-06-23  975  	return geni_icc_disable(&gi2c->se);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  976  }
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  977  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  978  static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  979  {
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  980  	int ret;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  981  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  982  
bf225ed357c65e Akash Asthana               2020-06-23  983  	ret = geni_icc_enable(&gi2c->se);
bf225ed357c65e Akash Asthana               2020-06-23  984  	if (ret)
bf225ed357c65e Akash Asthana               2020-06-23  985  		return ret;
bf225ed357c65e Akash Asthana               2020-06-23  986  
14d02fbadb5dc1 Neil Armstrong              2022-11-29  987  	ret = clk_prepare_enable(gi2c->core_clk);
14d02fbadb5dc1 Neil Armstrong              2022-11-29  988  	if (ret)
14d02fbadb5dc1 Neil Armstrong              2022-11-29  989  		return ret;
14d02fbadb5dc1 Neil Armstrong              2022-11-29  990  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  991  	ret = geni_se_resources_on(&gi2c->se);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  992  	if (ret)
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  993  		return ret;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  994  
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  995  	enable_irq(gi2c->irq);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  996  	gi2c->suspended = 0;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30 @997  	return 0;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  998  }
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  999  

:::::: The code at line 937 was first introduced by commit
:::::: d8703554f4dea9775417525b22b3d65ed1c6b16e i2c: qcom-geni: Add support for GPI DMA

:::::: TO: Vinod Koul <vkoul@kernel.org>
:::::: CC: Wolfram Sang <wsa@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
