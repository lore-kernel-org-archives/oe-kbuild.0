Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01AC8801
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Nov 2023 03:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bb8obq3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700709436; x=1732245436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=82c7r+pcMWc3l7tq4X13m3wudaV1ZHG/Nojs+/LkddI=;
  b=Bb8obq3twqgc19EPOE2jrS92FsWm9twBX82NEVTc9taiwozSRcmRHcHO
   YcLjRS60sDtmWuMiA38IkHPTdsFp26cu8FPmrdEM+SxiAKya9Sh00y+6l
   VCN7Ga9AnPrI5lyHOxN+ItCuroCaFaujecsVGlKSD/rXzmPaX/PoFR0+i
   VJ4ERQY7KtO730V5RAWLrqCipIo3eCSxX9/XVee8nTy1lJ2mq2oD5N4Zu
   8FTZ5IozpThQ3tEa/QqbEzxSfDHQavz0F7PW1jXJQlGZAP3bcapsu7ZMe
   v/fAEKj0qCjmUEXYRp/ft8z5/LxhDP/1I2eSGS9KdEd/DtYxARimOWKWK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372348531"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="372348531"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 19:17:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="8521859"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2023 19:17:15 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r60DI-0001Ak-0U;
	Thu, 23 Nov 2023 03:17:12 +0000
Date: Thu, 23 Nov 2023 11:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/090-spi-hid 14/21]
 drivers/soc/apple/dockchannel.c:240 dockchannel_init() warn: passing zero to
 'dev_err_probe'
Message-ID: <202311231037.4kh3kwIP-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   16871bb3228eaf55cbdb1dfb81c1cecec4ee0d52
commit: 7c1543b965b465df17e43246abe9ef43c4bd8358 [14/21] soc: apple: Add DockChannel driver
:::::: branch date: 4 days ago
:::::: commit date: 9 weeks ago
config: mips-randconfig-r081-20231121 (https://download.01.org/0day-ci/archive/20231123/202311231037.4kh3kwIP-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231123/202311231037.4kh3kwIP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311231037.4kh3kwIP-lkp@intel.com/

New smatch warnings:
drivers/soc/apple/dockchannel.c:240 dockchannel_init() warn: passing zero to 'dev_err_probe'
drivers/soc/apple/dockchannel.c:358 dockchannel_probe() warn: passing zero to 'dev_err_probe'

Old smatch warnings:
drivers/soc/apple/dockchannel.c:246 dockchannel_init() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +240 drivers/soc/apple/dockchannel.c

7c1543b965b465 Hector Martin 2022-07-08  211  
7c1543b965b465 Hector Martin 2022-07-08  212  struct dockchannel *dockchannel_init(struct platform_device *pdev)
7c1543b965b465 Hector Martin 2022-07-08  213  {
7c1543b965b465 Hector Martin 2022-07-08  214  	struct device *dev = &pdev->dev;
7c1543b965b465 Hector Martin 2022-07-08  215  	struct dockchannel *dockchannel;
7c1543b965b465 Hector Martin 2022-07-08  216  	int ret;
7c1543b965b465 Hector Martin 2022-07-08  217  
7c1543b965b465 Hector Martin 2022-07-08  218  	dockchannel = devm_kzalloc(dev, sizeof(*dockchannel), GFP_KERNEL);
7c1543b965b465 Hector Martin 2022-07-08  219  	if (!dockchannel)
7c1543b965b465 Hector Martin 2022-07-08  220  		return ERR_PTR(-ENOMEM);
7c1543b965b465 Hector Martin 2022-07-08  221  
7c1543b965b465 Hector Martin 2022-07-08  222  	dockchannel->dev = dev;
7c1543b965b465 Hector Martin 2022-07-08  223  	dockchannel->config_base = devm_platform_ioremap_resource_byname(pdev, "config");
7c1543b965b465 Hector Martin 2022-07-08  224  	if (IS_ERR(dockchannel->config_base))
7c1543b965b465 Hector Martin 2022-07-08  225  		return (__force void *)dockchannel->config_base;
7c1543b965b465 Hector Martin 2022-07-08  226  
7c1543b965b465 Hector Martin 2022-07-08  227  	dockchannel->data_base = devm_platform_ioremap_resource_byname(pdev, "data");
7c1543b965b465 Hector Martin 2022-07-08  228  	if (IS_ERR(dockchannel->data_base))
7c1543b965b465 Hector Martin 2022-07-08  229  		return (__force void *)dockchannel->data_base;
7c1543b965b465 Hector Martin 2022-07-08  230  
7c1543b965b465 Hector Martin 2022-07-08  231  	ret = of_property_read_u32(dev->of_node, "apple,fifo-size", &dockchannel->fifo_size);
7c1543b965b465 Hector Martin 2022-07-08  232  	if (ret)
7c1543b965b465 Hector Martin 2022-07-08  233  		return ERR_PTR(dev_err_probe(dev, ret, "Missing apple,fifo-size property"));
7c1543b965b465 Hector Martin 2022-07-08  234  
7c1543b965b465 Hector Martin 2022-07-08  235  	init_completion(&dockchannel->tx_comp);
7c1543b965b465 Hector Martin 2022-07-08  236  	init_completion(&dockchannel->rx_comp);
7c1543b965b465 Hector Martin 2022-07-08  237  
7c1543b965b465 Hector Martin 2022-07-08  238  	dockchannel->tx_irq = platform_get_irq_byname(pdev, "tx");
7c1543b965b465 Hector Martin 2022-07-08  239  	if (dockchannel->tx_irq <= 0) {
7c1543b965b465 Hector Martin 2022-07-08 @240  		return ERR_PTR(dev_err_probe(dev, dockchannel->tx_irq,
7c1543b965b465 Hector Martin 2022-07-08  241  				     "Failed to get TX IRQ"));
7c1543b965b465 Hector Martin 2022-07-08  242  	}
7c1543b965b465 Hector Martin 2022-07-08  243  
7c1543b965b465 Hector Martin 2022-07-08  244  	dockchannel->rx_irq = platform_get_irq_byname(pdev, "rx");
7c1543b965b465 Hector Martin 2022-07-08  245  	if (dockchannel->rx_irq <= 0) {
7c1543b965b465 Hector Martin 2022-07-08  246  		return ERR_PTR(dev_err_probe(dev, dockchannel->rx_irq,
7c1543b965b465 Hector Martin 2022-07-08  247  				     "Failed to get RX IRQ"));
7c1543b965b465 Hector Martin 2022-07-08  248  	}
7c1543b965b465 Hector Martin 2022-07-08  249  
7c1543b965b465 Hector Martin 2022-07-08  250  	ret = devm_request_irq(dev, dockchannel->tx_irq, dockchannel_tx_irq, IRQF_NO_AUTOEN,
7c1543b965b465 Hector Martin 2022-07-08  251  			       "apple-dockchannel-tx", dockchannel);
7c1543b965b465 Hector Martin 2022-07-08  252  	if (ret)
7c1543b965b465 Hector Martin 2022-07-08  253  		return ERR_PTR(dev_err_probe(dev, ret, "Failed to request TX IRQ"));
7c1543b965b465 Hector Martin 2022-07-08  254  
7c1543b965b465 Hector Martin 2022-07-08  255  	ret = devm_request_threaded_irq(dev, dockchannel->rx_irq, dockchannel_rx_irq,
7c1543b965b465 Hector Martin 2022-07-08  256  					dockchannel_rx_irq_thread, IRQF_NO_AUTOEN,
7c1543b965b465 Hector Martin 2022-07-08  257  					"apple-dockchannel-rx", dockchannel);
7c1543b965b465 Hector Martin 2022-07-08  258  	if (ret)
7c1543b965b465 Hector Martin 2022-07-08  259  		return ERR_PTR(dev_err_probe(dev, ret, "Failed to request RX IRQ"));
7c1543b965b465 Hector Martin 2022-07-08  260  
7c1543b965b465 Hector Martin 2022-07-08  261  	return dockchannel;
7c1543b965b465 Hector Martin 2022-07-08  262  }
7c1543b965b465 Hector Martin 2022-07-08  263  EXPORT_SYMBOL(dockchannel_init);
7c1543b965b465 Hector Martin 2022-07-08  264  
7c1543b965b465 Hector Martin 2022-07-08  265  
7c1543b965b465 Hector Martin 2022-07-08  266  /* Dockchannel IRQchip */
7c1543b965b465 Hector Martin 2022-07-08  267  
7c1543b965b465 Hector Martin 2022-07-08  268  static void dockchannel_irq(struct irq_desc *desc)
7c1543b965b465 Hector Martin 2022-07-08  269  {
7c1543b965b465 Hector Martin 2022-07-08  270  	unsigned int irq = irq_desc_get_irq(desc);
7c1543b965b465 Hector Martin 2022-07-08  271  	struct irq_chip *chip = irq_desc_get_chip(desc);
7c1543b965b465 Hector Martin 2022-07-08  272  	struct dockchannel_common *dcc = irq_get_handler_data(irq);
7c1543b965b465 Hector Martin 2022-07-08  273  	unsigned long flags = readl_relaxed(dcc->irq_base + IRQ_FLAG);
7c1543b965b465 Hector Martin 2022-07-08  274  	int bit;
7c1543b965b465 Hector Martin 2022-07-08  275  
7c1543b965b465 Hector Martin 2022-07-08  276  	chained_irq_enter(chip, desc);
7c1543b965b465 Hector Martin 2022-07-08  277  
7c1543b965b465 Hector Martin 2022-07-08  278  	for_each_set_bit(bit, &flags, DOCKCHANNEL_MAX_IRQ)
7c1543b965b465 Hector Martin 2022-07-08  279  		generic_handle_domain_irq(dcc->domain, bit);
7c1543b965b465 Hector Martin 2022-07-08  280  
7c1543b965b465 Hector Martin 2022-07-08  281  	chained_irq_exit(chip, desc);
7c1543b965b465 Hector Martin 2022-07-08  282  }
7c1543b965b465 Hector Martin 2022-07-08  283  
7c1543b965b465 Hector Martin 2022-07-08  284  static void dockchannel_irq_ack(struct irq_data *data)
7c1543b965b465 Hector Martin 2022-07-08  285  {
7c1543b965b465 Hector Martin 2022-07-08  286  	struct dockchannel_common *dcc = irq_data_get_irq_chip_data(data);
7c1543b965b465 Hector Martin 2022-07-08  287  	unsigned int hwirq = data->hwirq;
7c1543b965b465 Hector Martin 2022-07-08  288  
7c1543b965b465 Hector Martin 2022-07-08  289  	writel_relaxed(BIT(hwirq), dcc->irq_base + IRQ_FLAG);
7c1543b965b465 Hector Martin 2022-07-08  290  }
7c1543b965b465 Hector Martin 2022-07-08  291  
7c1543b965b465 Hector Martin 2022-07-08  292  static void dockchannel_irq_mask(struct irq_data *data)
7c1543b965b465 Hector Martin 2022-07-08  293  {
7c1543b965b465 Hector Martin 2022-07-08  294  	struct dockchannel_common *dcc = irq_data_get_irq_chip_data(data);
7c1543b965b465 Hector Martin 2022-07-08  295  	unsigned int hwirq = data->hwirq;
7c1543b965b465 Hector Martin 2022-07-08  296  	u32 val = readl_relaxed(dcc->irq_base + IRQ_MASK);
7c1543b965b465 Hector Martin 2022-07-08  297  
7c1543b965b465 Hector Martin 2022-07-08  298  	writel_relaxed(val & ~BIT(hwirq), dcc->irq_base + IRQ_MASK);
7c1543b965b465 Hector Martin 2022-07-08  299  }
7c1543b965b465 Hector Martin 2022-07-08  300  
7c1543b965b465 Hector Martin 2022-07-08  301  static void dockchannel_irq_unmask(struct irq_data *data)
7c1543b965b465 Hector Martin 2022-07-08  302  {
7c1543b965b465 Hector Martin 2022-07-08  303  	struct dockchannel_common *dcc = irq_data_get_irq_chip_data(data);
7c1543b965b465 Hector Martin 2022-07-08  304  	unsigned int hwirq = data->hwirq;
7c1543b965b465 Hector Martin 2022-07-08  305  	u32 val = readl_relaxed(dcc->irq_base + IRQ_MASK);
7c1543b965b465 Hector Martin 2022-07-08  306  
7c1543b965b465 Hector Martin 2022-07-08  307  	writel_relaxed(val | BIT(hwirq), dcc->irq_base + IRQ_MASK);
7c1543b965b465 Hector Martin 2022-07-08  308  }
7c1543b965b465 Hector Martin 2022-07-08  309  
7c1543b965b465 Hector Martin 2022-07-08  310  static const struct irq_chip dockchannel_irqchip = {
7c1543b965b465 Hector Martin 2022-07-08  311  	.name = "dockchannel-irqc",
7c1543b965b465 Hector Martin 2022-07-08  312  	.irq_ack = dockchannel_irq_ack,
7c1543b965b465 Hector Martin 2022-07-08  313  	.irq_mask = dockchannel_irq_mask,
7c1543b965b465 Hector Martin 2022-07-08  314  	.irq_unmask = dockchannel_irq_unmask,
7c1543b965b465 Hector Martin 2022-07-08  315  };
7c1543b965b465 Hector Martin 2022-07-08  316  
7c1543b965b465 Hector Martin 2022-07-08  317  static int dockchannel_irq_domain_map(struct irq_domain *d, unsigned int virq,
7c1543b965b465 Hector Martin 2022-07-08  318  				      irq_hw_number_t hw)
7c1543b965b465 Hector Martin 2022-07-08  319  {
7c1543b965b465 Hector Martin 2022-07-08  320  	irq_set_chip_data(virq, d->host_data);
7c1543b965b465 Hector Martin 2022-07-08  321  	irq_set_chip_and_handler(virq, &dockchannel_irqchip, handle_level_irq);
7c1543b965b465 Hector Martin 2022-07-08  322  
7c1543b965b465 Hector Martin 2022-07-08  323  	return 0;
7c1543b965b465 Hector Martin 2022-07-08  324  }
7c1543b965b465 Hector Martin 2022-07-08  325  
7c1543b965b465 Hector Martin 2022-07-08  326  static const struct irq_domain_ops dockchannel_irq_domain_ops = {
7c1543b965b465 Hector Martin 2022-07-08  327  	.xlate	= irq_domain_xlate_twocell,
7c1543b965b465 Hector Martin 2022-07-08  328  	.map	= dockchannel_irq_domain_map,
7c1543b965b465 Hector Martin 2022-07-08  329  };
7c1543b965b465 Hector Martin 2022-07-08  330  
7c1543b965b465 Hector Martin 2022-07-08  331  static int dockchannel_probe(struct platform_device *pdev)
7c1543b965b465 Hector Martin 2022-07-08  332  {
7c1543b965b465 Hector Martin 2022-07-08  333  	struct device *dev = &pdev->dev;
7c1543b965b465 Hector Martin 2022-07-08  334  	struct dockchannel_common *dcc;
7c1543b965b465 Hector Martin 2022-07-08  335  	struct device_node *child;
7c1543b965b465 Hector Martin 2022-07-08  336  
7c1543b965b465 Hector Martin 2022-07-08  337  	dcc = devm_kzalloc(dev, sizeof(*dcc), GFP_KERNEL);
7c1543b965b465 Hector Martin 2022-07-08  338  	if (!dcc)
7c1543b965b465 Hector Martin 2022-07-08  339  		return -ENOMEM;
7c1543b965b465 Hector Martin 2022-07-08  340  
7c1543b965b465 Hector Martin 2022-07-08  341  	dcc->dev = dev;
7c1543b965b465 Hector Martin 2022-07-08  342  	platform_set_drvdata(pdev, dcc);
7c1543b965b465 Hector Martin 2022-07-08  343  
7c1543b965b465 Hector Martin 2022-07-08  344  	dcc->irq_base = devm_platform_ioremap_resource_byname(pdev, "irq");
7c1543b965b465 Hector Martin 2022-07-08  345  	if (IS_ERR(dcc->irq_base))
7c1543b965b465 Hector Martin 2022-07-08  346  		return PTR_ERR(dcc->irq_base);
7c1543b965b465 Hector Martin 2022-07-08  347  
7c1543b965b465 Hector Martin 2022-07-08  348  	writel_relaxed(0, dcc->irq_base + IRQ_MASK);
7c1543b965b465 Hector Martin 2022-07-08  349  	writel_relaxed(~0, dcc->irq_base + IRQ_FLAG);
7c1543b965b465 Hector Martin 2022-07-08  350  
7c1543b965b465 Hector Martin 2022-07-08  351  	dcc->domain = irq_domain_add_linear(dev->of_node, DOCKCHANNEL_MAX_IRQ,
7c1543b965b465 Hector Martin 2022-07-08  352  					    &dockchannel_irq_domain_ops, dcc);
7c1543b965b465 Hector Martin 2022-07-08  353  	if (!dcc->domain)
7c1543b965b465 Hector Martin 2022-07-08  354  		return -ENOMEM;
7c1543b965b465 Hector Martin 2022-07-08  355  
7c1543b965b465 Hector Martin 2022-07-08  356  	dcc->irq = platform_get_irq(pdev, 0);
7c1543b965b465 Hector Martin 2022-07-08  357  	if (dcc->irq <= 0)
7c1543b965b465 Hector Martin 2022-07-08 @358  		return dev_err_probe(dev, dcc->irq, "Failed to get IRQ");
7c1543b965b465 Hector Martin 2022-07-08  359  
7c1543b965b465 Hector Martin 2022-07-08  360  	irq_set_handler_data(dcc->irq, dcc);
7c1543b965b465 Hector Martin 2022-07-08  361  	irq_set_chained_handler(dcc->irq, dockchannel_irq);
7c1543b965b465 Hector Martin 2022-07-08  362  
7c1543b965b465 Hector Martin 2022-07-08  363  	for_each_child_of_node(dev->of_node, child)
7c1543b965b465 Hector Martin 2022-07-08  364  		of_platform_device_create(child, NULL, dev);
7c1543b965b465 Hector Martin 2022-07-08  365  
7c1543b965b465 Hector Martin 2022-07-08  366  	return 0;
7c1543b965b465 Hector Martin 2022-07-08  367  }
7c1543b965b465 Hector Martin 2022-07-08  368  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
