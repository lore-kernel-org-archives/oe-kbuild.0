Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F599175A71
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 05:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778392356; cv=none; b=ctrG7M0PyxaFB4bCjN4wAVuDGq43qtNqsBhne2PVm7u8+2tSy9UJeG0EeRC8JREl5/mnjeNI3DsdEh6JdVF/NEl9CRatLfqeVN4eEsl3zumS75bfZRQK45LB46z1Au7oN/h63CtZC/Qi4O6D8Q+Wznuc1nEmwfJ56bRlCxUrAsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778392356; c=relaxed/simple;
	bh=Jh/QnacOAEtDIv3dyGn0/SMkjuLPpZhzlOIbyAqIAVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r4VHqXlC31KVNz0tohX168AnQ5mLHPJ2hva+dhIjJ5xksBKxFiyRzZdNsE46MLQt6J6eQTu6DWnnPuiIWYaD5QK3WWg1Qy7oVSB4flIm4QAAGkNARS9+eXJaUvLzymZE3gZb6/KsBMIQg+fSsEILIBHVOECJWQdypCAymnhYl/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PACnWA5i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PACnWA5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778392354; x=1809928354;
  h=date:from:to:cc:subject:message-id;
  bh=Jh/QnacOAEtDIv3dyGn0/SMkjuLPpZhzlOIbyAqIAVg=;
  b=PACnWA5i77/muFfHS3C4i9CBHAjA5Ihw5U2gcgxrIxNz0XxreyXJYbyT
   Jl5Bf63pkTYVSa7Jc5KZGiy1XRNEDMgoleRT0XwaLyEXBgAAUt07Ailie
   WFeQgukoofheinnuokozN7KbsADVP1CpNUnGdaek6CV76LHowQL5Ouc5D
   B5w7iZuyvipQs+qx2HSdEqdYEGXZ/c76R+qjkROTXv+fghYWI6SfBn3j+
   6IxN2KZKg5QLKX1j4FgsmwY3anXd9c2Hx/G6pFmIyTlrB5vXO7alW7FP8
   sR91nmcHKQXGLhCNU29hPSgWQwHccE5Qu73U33NQXiP0BtBxFdd8/qThu
   Q==;
X-CSE-ConnectionGUID: kjBpYEbdTpCty26rGPFxOw==
X-CSE-MsgGUID: A46tyV6rRYqVeq/z5Ikv1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="89902377"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="89902377"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 22:52:34 -0700
X-CSE-ConnectionGUID: ltbTXAMtTtieHOHwSbxVeA==
X-CSE-MsgGUID: gdwkNow3SFOT3yjgbfsngA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="236310372"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 May 2026 22:52:32 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLx5Z-000000001oL-2fCc;
	Sun, 10 May 2026 05:52:29 +0000
Date: Sun, 10 May 2026 13:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/090-spi-hid 17/19]
 drivers/soc/apple/dockchannel.c:241 dockchannel_init() warn: passing zero to
 'dev_err_probe'
Message-ID: <202605101332.SfUuii8x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   7b3c6e8461f3035d025ece758919facbc1c6d854
commit: 9ac13ff0fc75010681a6ea5fd694db592dea9069 [17/19] soc: apple: Add DockChannel driver
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: um-randconfig-r072-20260509 (https://download.01.org/0day-ci/archive/20260510/202605101332.SfUuii8x-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605101332.SfUuii8x-lkp@intel.com/

New smatch warnings:
drivers/soc/apple/dockchannel.c:241 dockchannel_init() warn: passing zero to 'dev_err_probe'
drivers/soc/apple/dockchannel.c:358 dockchannel_probe() warn: passing zero to 'dev_err_probe'

Old smatch warnings:
drivers/soc/apple/dockchannel.c:247 dockchannel_init() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +241 drivers/soc/apple/dockchannel.c

9ac13ff0fc7501 Hector Martin 2022-07-08  212  
9ac13ff0fc7501 Hector Martin 2022-07-08  213  struct dockchannel *dockchannel_init(struct platform_device *pdev)
9ac13ff0fc7501 Hector Martin 2022-07-08  214  {
9ac13ff0fc7501 Hector Martin 2022-07-08  215  	struct device *dev = &pdev->dev;
9ac13ff0fc7501 Hector Martin 2022-07-08  216  	struct dockchannel *dockchannel;
9ac13ff0fc7501 Hector Martin 2022-07-08  217  	int ret;
9ac13ff0fc7501 Hector Martin 2022-07-08  218  
9ac13ff0fc7501 Hector Martin 2022-07-08  219  	dockchannel = devm_kzalloc(dev, sizeof(*dockchannel), GFP_KERNEL);
9ac13ff0fc7501 Hector Martin 2022-07-08  220  	if (!dockchannel)
9ac13ff0fc7501 Hector Martin 2022-07-08  221  		return ERR_PTR(-ENOMEM);
9ac13ff0fc7501 Hector Martin 2022-07-08  222  
9ac13ff0fc7501 Hector Martin 2022-07-08  223  	dockchannel->dev = dev;
9ac13ff0fc7501 Hector Martin 2022-07-08  224  	dockchannel->config_base = devm_platform_ioremap_resource_byname(pdev, "config");
9ac13ff0fc7501 Hector Martin 2022-07-08  225  	if (IS_ERR(dockchannel->config_base))
9ac13ff0fc7501 Hector Martin 2022-07-08  226  		return (__force void *)dockchannel->config_base;
9ac13ff0fc7501 Hector Martin 2022-07-08  227  
9ac13ff0fc7501 Hector Martin 2022-07-08  228  	dockchannel->data_base = devm_platform_ioremap_resource_byname(pdev, "data");
9ac13ff0fc7501 Hector Martin 2022-07-08  229  	if (IS_ERR(dockchannel->data_base))
9ac13ff0fc7501 Hector Martin 2022-07-08  230  		return (__force void *)dockchannel->data_base;
9ac13ff0fc7501 Hector Martin 2022-07-08  231  
9ac13ff0fc7501 Hector Martin 2022-07-08  232  	ret = of_property_read_u32(dev->of_node, "apple,fifo-size", &dockchannel->fifo_size);
9ac13ff0fc7501 Hector Martin 2022-07-08  233  	if (ret)
9ac13ff0fc7501 Hector Martin 2022-07-08  234  		return ERR_PTR(dev_err_probe(dev, ret, "Missing apple,fifo-size property"));
9ac13ff0fc7501 Hector Martin 2022-07-08  235  
9ac13ff0fc7501 Hector Martin 2022-07-08  236  	init_completion(&dockchannel->tx_comp);
9ac13ff0fc7501 Hector Martin 2022-07-08  237  	init_completion(&dockchannel->rx_comp);
9ac13ff0fc7501 Hector Martin 2022-07-08  238  
9ac13ff0fc7501 Hector Martin 2022-07-08  239  	dockchannel->tx_irq = platform_get_irq_byname(pdev, "tx");
9ac13ff0fc7501 Hector Martin 2022-07-08  240  	if (dockchannel->tx_irq <= 0) {
9ac13ff0fc7501 Hector Martin 2022-07-08 @241  		return ERR_PTR(dev_err_probe(dev, dockchannel->tx_irq,
9ac13ff0fc7501 Hector Martin 2022-07-08  242  				     "Failed to get TX IRQ"));
9ac13ff0fc7501 Hector Martin 2022-07-08  243  	}
9ac13ff0fc7501 Hector Martin 2022-07-08  244  
9ac13ff0fc7501 Hector Martin 2022-07-08  245  	dockchannel->rx_irq = platform_get_irq_byname(pdev, "rx");
9ac13ff0fc7501 Hector Martin 2022-07-08  246  	if (dockchannel->rx_irq <= 0) {
9ac13ff0fc7501 Hector Martin 2022-07-08  247  		return ERR_PTR(dev_err_probe(dev, dockchannel->rx_irq,
9ac13ff0fc7501 Hector Martin 2022-07-08  248  				     "Failed to get RX IRQ"));
9ac13ff0fc7501 Hector Martin 2022-07-08  249  	}
9ac13ff0fc7501 Hector Martin 2022-07-08  250  
9ac13ff0fc7501 Hector Martin 2022-07-08  251  	ret = devm_request_irq(dev, dockchannel->tx_irq, dockchannel_tx_irq, IRQF_NO_AUTOEN,
9ac13ff0fc7501 Hector Martin 2022-07-08  252  			       "apple-dockchannel-tx", dockchannel);
9ac13ff0fc7501 Hector Martin 2022-07-08  253  	if (ret)
9ac13ff0fc7501 Hector Martin 2022-07-08  254  		return ERR_PTR(dev_err_probe(dev, ret, "Failed to request TX IRQ"));
9ac13ff0fc7501 Hector Martin 2022-07-08  255  
9ac13ff0fc7501 Hector Martin 2022-07-08  256  	ret = devm_request_threaded_irq(dev, dockchannel->rx_irq, dockchannel_rx_irq,
9ac13ff0fc7501 Hector Martin 2022-07-08  257  					dockchannel_rx_irq_thread, IRQF_NO_AUTOEN,
9ac13ff0fc7501 Hector Martin 2022-07-08  258  					"apple-dockchannel-rx", dockchannel);
9ac13ff0fc7501 Hector Martin 2022-07-08  259  	if (ret)
9ac13ff0fc7501 Hector Martin 2022-07-08  260  		return ERR_PTR(dev_err_probe(dev, ret, "Failed to request RX IRQ"));
9ac13ff0fc7501 Hector Martin 2022-07-08  261  
9ac13ff0fc7501 Hector Martin 2022-07-08  262  	return dockchannel;
9ac13ff0fc7501 Hector Martin 2022-07-08  263  }
9ac13ff0fc7501 Hector Martin 2022-07-08  264  EXPORT_SYMBOL(dockchannel_init);
9ac13ff0fc7501 Hector Martin 2022-07-08  265  
9ac13ff0fc7501 Hector Martin 2022-07-08  266  
9ac13ff0fc7501 Hector Martin 2022-07-08  267  /* Dockchannel IRQchip */
9ac13ff0fc7501 Hector Martin 2022-07-08  268  
9ac13ff0fc7501 Hector Martin 2022-07-08  269  static void dockchannel_irq(struct irq_desc *desc)
9ac13ff0fc7501 Hector Martin 2022-07-08  270  {
9ac13ff0fc7501 Hector Martin 2022-07-08  271  	unsigned int irq = irq_desc_get_irq(desc);
9ac13ff0fc7501 Hector Martin 2022-07-08  272  	struct irq_chip *chip = irq_desc_get_chip(desc);
9ac13ff0fc7501 Hector Martin 2022-07-08  273  	struct dockchannel_common *dcc = irq_get_handler_data(irq);
9ac13ff0fc7501 Hector Martin 2022-07-08  274  	unsigned long flags = readl_relaxed(dcc->irq_base + IRQ_FLAG);
9ac13ff0fc7501 Hector Martin 2022-07-08  275  	int bit;
9ac13ff0fc7501 Hector Martin 2022-07-08  276  
9ac13ff0fc7501 Hector Martin 2022-07-08  277  	chained_irq_enter(chip, desc);
9ac13ff0fc7501 Hector Martin 2022-07-08  278  
9ac13ff0fc7501 Hector Martin 2022-07-08  279  	for_each_set_bit(bit, &flags, DOCKCHANNEL_MAX_IRQ)
9ac13ff0fc7501 Hector Martin 2022-07-08  280  		generic_handle_domain_irq(dcc->domain, bit);
9ac13ff0fc7501 Hector Martin 2022-07-08  281  
9ac13ff0fc7501 Hector Martin 2022-07-08  282  	chained_irq_exit(chip, desc);
9ac13ff0fc7501 Hector Martin 2022-07-08  283  }
9ac13ff0fc7501 Hector Martin 2022-07-08  284  
9ac13ff0fc7501 Hector Martin 2022-07-08  285  static void dockchannel_irq_ack(struct irq_data *data)
9ac13ff0fc7501 Hector Martin 2022-07-08  286  {
9ac13ff0fc7501 Hector Martin 2022-07-08  287  	struct dockchannel_common *dcc = irq_data_get_irq_chip_data(data);
9ac13ff0fc7501 Hector Martin 2022-07-08  288  	unsigned int hwirq = data->hwirq;
9ac13ff0fc7501 Hector Martin 2022-07-08  289  
9ac13ff0fc7501 Hector Martin 2022-07-08  290  	writel_relaxed(BIT(hwirq), dcc->irq_base + IRQ_FLAG);
9ac13ff0fc7501 Hector Martin 2022-07-08  291  }
9ac13ff0fc7501 Hector Martin 2022-07-08  292  
9ac13ff0fc7501 Hector Martin 2022-07-08  293  static void dockchannel_irq_mask(struct irq_data *data)
9ac13ff0fc7501 Hector Martin 2022-07-08  294  {
9ac13ff0fc7501 Hector Martin 2022-07-08  295  	struct dockchannel_common *dcc = irq_data_get_irq_chip_data(data);
9ac13ff0fc7501 Hector Martin 2022-07-08  296  	unsigned int hwirq = data->hwirq;
9ac13ff0fc7501 Hector Martin 2022-07-08  297  	u32 val = readl_relaxed(dcc->irq_base + IRQ_MASK);
9ac13ff0fc7501 Hector Martin 2022-07-08  298  
9ac13ff0fc7501 Hector Martin 2022-07-08  299  	writel_relaxed(val & ~BIT(hwirq), dcc->irq_base + IRQ_MASK);
9ac13ff0fc7501 Hector Martin 2022-07-08  300  }
9ac13ff0fc7501 Hector Martin 2022-07-08  301  
9ac13ff0fc7501 Hector Martin 2022-07-08  302  static void dockchannel_irq_unmask(struct irq_data *data)
9ac13ff0fc7501 Hector Martin 2022-07-08  303  {
9ac13ff0fc7501 Hector Martin 2022-07-08  304  	struct dockchannel_common *dcc = irq_data_get_irq_chip_data(data);
9ac13ff0fc7501 Hector Martin 2022-07-08  305  	unsigned int hwirq = data->hwirq;
9ac13ff0fc7501 Hector Martin 2022-07-08  306  	u32 val = readl_relaxed(dcc->irq_base + IRQ_MASK);
9ac13ff0fc7501 Hector Martin 2022-07-08  307  
9ac13ff0fc7501 Hector Martin 2022-07-08  308  	writel_relaxed(val | BIT(hwirq), dcc->irq_base + IRQ_MASK);
9ac13ff0fc7501 Hector Martin 2022-07-08  309  }
9ac13ff0fc7501 Hector Martin 2022-07-08  310  
9ac13ff0fc7501 Hector Martin 2022-07-08  311  static const struct irq_chip dockchannel_irqchip = {
9ac13ff0fc7501 Hector Martin 2022-07-08  312  	.name = "dockchannel-irqc",
9ac13ff0fc7501 Hector Martin 2022-07-08  313  	.irq_ack = dockchannel_irq_ack,
9ac13ff0fc7501 Hector Martin 2022-07-08  314  	.irq_mask = dockchannel_irq_mask,
9ac13ff0fc7501 Hector Martin 2022-07-08  315  	.irq_unmask = dockchannel_irq_unmask,
9ac13ff0fc7501 Hector Martin 2022-07-08  316  };
9ac13ff0fc7501 Hector Martin 2022-07-08  317  
9ac13ff0fc7501 Hector Martin 2022-07-08  318  static int dockchannel_irq_domain_map(struct irq_domain *d, unsigned int virq,
9ac13ff0fc7501 Hector Martin 2022-07-08  319  				      irq_hw_number_t hw)
9ac13ff0fc7501 Hector Martin 2022-07-08  320  {
9ac13ff0fc7501 Hector Martin 2022-07-08  321  	irq_set_chip_data(virq, d->host_data);
9ac13ff0fc7501 Hector Martin 2022-07-08  322  	irq_set_chip_and_handler(virq, &dockchannel_irqchip, handle_level_irq);
9ac13ff0fc7501 Hector Martin 2022-07-08  323  
9ac13ff0fc7501 Hector Martin 2022-07-08  324  	return 0;
9ac13ff0fc7501 Hector Martin 2022-07-08  325  }
9ac13ff0fc7501 Hector Martin 2022-07-08  326  
9ac13ff0fc7501 Hector Martin 2022-07-08  327  static const struct irq_domain_ops dockchannel_irq_domain_ops = {
9ac13ff0fc7501 Hector Martin 2022-07-08  328  	.xlate	= irq_domain_xlate_twocell,
9ac13ff0fc7501 Hector Martin 2022-07-08  329  	.map	= dockchannel_irq_domain_map,
9ac13ff0fc7501 Hector Martin 2022-07-08  330  };
9ac13ff0fc7501 Hector Martin 2022-07-08  331  
9ac13ff0fc7501 Hector Martin 2022-07-08  332  static int dockchannel_probe(struct platform_device *pdev)
9ac13ff0fc7501 Hector Martin 2022-07-08  333  {
9ac13ff0fc7501 Hector Martin 2022-07-08  334  	struct device *dev = &pdev->dev;
9ac13ff0fc7501 Hector Martin 2022-07-08  335  	struct dockchannel_common *dcc;
9ac13ff0fc7501 Hector Martin 2022-07-08  336  
9ac13ff0fc7501 Hector Martin 2022-07-08  337  	dcc = devm_kzalloc(dev, sizeof(*dcc), GFP_KERNEL);
9ac13ff0fc7501 Hector Martin 2022-07-08  338  	if (!dcc)
9ac13ff0fc7501 Hector Martin 2022-07-08  339  		return -ENOMEM;
9ac13ff0fc7501 Hector Martin 2022-07-08  340  
9ac13ff0fc7501 Hector Martin 2022-07-08  341  	dcc->dev = dev;
9ac13ff0fc7501 Hector Martin 2022-07-08  342  	platform_set_drvdata(pdev, dcc);
9ac13ff0fc7501 Hector Martin 2022-07-08  343  
9ac13ff0fc7501 Hector Martin 2022-07-08  344  	dcc->irq_base = devm_platform_ioremap_resource_byname(pdev, "irq");
9ac13ff0fc7501 Hector Martin 2022-07-08  345  	if (IS_ERR(dcc->irq_base))
9ac13ff0fc7501 Hector Martin 2022-07-08  346  		return PTR_ERR(dcc->irq_base);
9ac13ff0fc7501 Hector Martin 2022-07-08  347  
9ac13ff0fc7501 Hector Martin 2022-07-08  348  	writel_relaxed(0, dcc->irq_base + IRQ_MASK);
9ac13ff0fc7501 Hector Martin 2022-07-08  349  	writel_relaxed(~0, dcc->irq_base + IRQ_FLAG);
9ac13ff0fc7501 Hector Martin 2022-07-08  350  
9ac13ff0fc7501 Hector Martin 2022-07-08  351  	dcc->domain = irq_domain_add_linear(dev->of_node, DOCKCHANNEL_MAX_IRQ,
9ac13ff0fc7501 Hector Martin 2022-07-08  352  					    &dockchannel_irq_domain_ops, dcc);
9ac13ff0fc7501 Hector Martin 2022-07-08  353  	if (!dcc->domain)
9ac13ff0fc7501 Hector Martin 2022-07-08  354  		return -ENOMEM;
9ac13ff0fc7501 Hector Martin 2022-07-08  355  
9ac13ff0fc7501 Hector Martin 2022-07-08  356  	dcc->irq = platform_get_irq(pdev, 0);
9ac13ff0fc7501 Hector Martin 2022-07-08  357  	if (dcc->irq <= 0)
9ac13ff0fc7501 Hector Martin 2022-07-08 @358  		return dev_err_probe(dev, dcc->irq, "Failed to get IRQ");
9ac13ff0fc7501 Hector Martin 2022-07-08  359  
9ac13ff0fc7501 Hector Martin 2022-07-08  360  	irq_set_handler_data(dcc->irq, dcc);
9ac13ff0fc7501 Hector Martin 2022-07-08  361  	irq_set_chained_handler(dcc->irq, dockchannel_irq);
9ac13ff0fc7501 Hector Martin 2022-07-08  362  
9ac13ff0fc7501 Hector Martin 2022-07-08  363  	devm_of_platform_populate(dev);
9ac13ff0fc7501 Hector Martin 2022-07-08  364  
9ac13ff0fc7501 Hector Martin 2022-07-08  365  	return 0;
9ac13ff0fc7501 Hector Martin 2022-07-08  366  }
9ac13ff0fc7501 Hector Martin 2022-07-08  367  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
