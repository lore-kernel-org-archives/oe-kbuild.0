Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28123C17
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Apr 2023 11:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681904212; x=1713440212;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YN3AyieTKsm1pMLGX6hrHn1DzXKpC44/N+33hkxCU2A=;
  b=j8wrT5U4iAi/iXygC0QapAYIQRDqUnY8jtm/AZPHndhQFnieZGDbPpUe
   vIfQMEvU7plPIJpkG7jnyP7CeSkWA6nmRU7ucszyNIFKcqDR20T9pxWRR
   RMge881ZpYnqVnhKQ5cyCZA/b83bdIoW5UBiPjiehbn+Ffc1PrWKUAySS
   odvJRpGE9DK7xzuPdbBV/TquUKTmsTmagX7d+x61NusDuKj7W0/Q4e7CP
   KnJszsN7bX7CfMI8GupaSYkPBoziKHjxjP1bAaYKCyPqPBXkvv+/TubSf
   QbQk7CUNQ2GqgBIEDrXjp+YDNabX/58sjtiTa0ycDzCgXpjRWFPr8qARM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334230530"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="334230530"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 04:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="760715442"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="760715442"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 04:36:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp67F-000er4-0k;
	Wed, 19 Apr 2023 11:36:49 +0000
Date: Wed, 19 Apr 2023 19:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/controller/pci-v3-semi.c:892 v3_pci_probe() warn: 'clk'
 from clk_prepare_enable() not released on lines: 743.
Message-ID: <202304191923.3kij7DTm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Stafford Horne <shorne@gmail.com>

Hi Stafford,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af67688dca57999fd848f051eeea1d375ba546b2
commit: ded2ee36313c941f1a12b6f85cde295b575264ae openrisc: Add pci bus support
date:   9 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-m031-20230416 (https://download.01.org/0day-ci/archive/20230419/202304191923.3kij7DTm-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304191923.3kij7DTm-lkp@intel.com/

smatch warnings:
drivers/pci/controller/pci-v3-semi.c:892 v3_pci_probe() warn: 'clk' from clk_prepare_enable() not released on lines: 743.

vim +/clk +892 drivers/pci/controller/pci-v3-semi.c

68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  705  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  706  static int v3_pci_probe(struct platform_device *pdev)
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  707  {
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  708  	struct device *dev = &pdev->dev;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  709  	struct device_node *np = dev->of_node;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  710  	struct resource *regs;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  711  	struct resource_entry *win;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  712  	struct v3_pci *v3;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  713  	struct pci_host_bridge *host;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  714  	struct clk *clk;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  715  	u16 val;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  716  	int irq;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  717  	int ret;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  718  
bca718988b9008 drivers/pci/controller/pci-v3-semi.c Christophe JAILLET   2020-04-18  719  	host = devm_pci_alloc_host_bridge(dev, sizeof(*v3));
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  720  	if (!host)
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  721  		return -ENOMEM;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  722  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  723  	host->ops = &v3_pci_ops;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  724  	v3 = pci_host_bridge_priv(host);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  725  	host->sysdata = v3;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  726  	v3->dev = dev;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  727  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  728  	/* Get and enable host clock */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  729  	clk = devm_clk_get(dev, NULL);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  730  	if (IS_ERR(clk)) {
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  731  		dev_err(dev, "clock not found\n");
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  732  		return PTR_ERR(clk);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  733  	}
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  734  	ret = clk_prepare_enable(clk);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  735  	if (ret) {
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  736  		dev_err(dev, "unable to enable clock\n");
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  737  		return ret;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  738  	}
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  739  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  740  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  741  	v3->base = devm_ioremap_resource(dev, regs);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  742  	if (IS_ERR(v3->base))
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  743  		return PTR_ERR(v3->base);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  744  	/*
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  745  	 * The hardware has a register with the physical base address
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  746  	 * of the V3 controller itself, verify that this is the same
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  747  	 * as the physical memory we've remapped it from.
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  748  	 */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  749  	if (readl(v3->base + V3_LB_IO_BASE) != (regs->start >> 16))
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  750  		dev_err(dev, "V3_LB_IO_BASE = %08x but device is @%pR\n",
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  751  			readl(v3->base + V3_LB_IO_BASE), regs);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  752  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  753  	/* Configuration space is 16MB directly mapped */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  754  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  755  	if (resource_size(regs) != SZ_16M) {
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  756  		dev_err(dev, "config mem is not 16MB!\n");
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  757  		return -EINVAL;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  758  	}
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  759  	v3->config_mem = regs->start;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  760  	v3->config_base = devm_ioremap_resource(dev, regs);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  761  	if (IS_ERR(v3->config_base))
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  762  		return PTR_ERR(v3->config_base);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  763  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  764  	/* Get and request error IRQ resource */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  765  	irq = platform_get_irq(pdev, 0);
caecb05c800081 drivers/pci/controller/pci-v3-semi.c Krzysztof Wilczyński 2020-08-02  766  	if (irq < 0)
0584bff0962966 drivers/pci/controller/pci-v3-semi.c Aman Sharma          2020-03-12  767  		return irq;
caecb05c800081 drivers/pci/controller/pci-v3-semi.c Krzysztof Wilczyński 2020-08-02  768  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  769  	ret = devm_request_irq(dev, irq, v3_irq, 0,
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  770  			"PCIv3 error", v3);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  771  	if (ret < 0) {
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  772  		dev_err(dev,
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  773  			"unable to request PCIv3 error IRQ %d (%d)\n",
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  774  			irq, ret);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  775  		return ret;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  776  	}
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  777  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  778  	/*
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  779  	 * Unlock V3 registers, but only if they were previously locked.
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  780  	 */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  781  	if (readw(v3->base + V3_SYSTEM) & V3_SYSTEM_M_LOCK)
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  782  		writew(V3_SYSTEM_UNLOCK, v3->base + V3_SYSTEM);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  783  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  784  	/* Disable all slave access while we set up the windows */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  785  	val = readw(v3->base + V3_PCI_CMD);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  786  	val &= ~(PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  787  	writew(val, v3->base + V3_PCI_CMD);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  788  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  789  	/* Put the PCI bus into reset */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  790  	val = readw(v3->base + V3_SYSTEM);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  791  	val &= ~V3_SYSTEM_M_RST_OUT;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  792  	writew(val, v3->base + V3_SYSTEM);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  793  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  794  	/* Retry until we're ready */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  795  	val = readw(v3->base + V3_PCI_CFG);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  796  	val |= V3_PCI_CFG_M_RETRY_EN;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  797  	writew(val, v3->base + V3_PCI_CFG);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  798  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  799  	/* Set up the local bus protocol */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  800  	val = readw(v3->base + V3_LB_CFG);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  801  	val |= V3_LB_CFG_LB_BE_IMODE; /* Byte enable input */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  802  	val |= V3_LB_CFG_LB_BE_OMODE; /* Byte enable output */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  803  	val &= ~V3_LB_CFG_LB_ENDIAN; /* Little endian */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  804  	val &= ~V3_LB_CFG_LB_PPC_RDY; /* TODO: when using on PPC403Gx, set to 1 */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  805  	writew(val, v3->base + V3_LB_CFG);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  806  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  807  	/* Enable the PCI bus master */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  808  	val = readw(v3->base + V3_PCI_CMD);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  809  	val |= PCI_COMMAND_MASTER;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  810  	writew(val, v3->base + V3_PCI_CMD);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  811  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  812  	/* Get the I/O and memory ranges from DT */
e0aebfe84a2fb0 drivers/pci/controller/pci-v3-semi.c Rob Herring          2019-10-28  813  	resource_list_for_each_entry(win, &host->windows) {
e0aebfe84a2fb0 drivers/pci/controller/pci-v3-semi.c Rob Herring          2019-10-28  814  		ret = v3_pci_setup_resource(v3, host, win);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  815  		if (ret) {
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  816  			dev_err(dev, "error setting up resources\n");
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  817  			return ret;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  818  		}
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  819  	}
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  820  	ret = v3_pci_parse_map_dma_ranges(v3, np);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  821  	if (ret)
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  822  		return ret;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  823  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  824  	/*
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  825  	 * Disable PCI to host IO cycles, enable I/O buffers @3.3V,
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  826  	 * set AD_LOW0 to 1 if one of the LB_MAP registers choose
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  827  	 * to use this (should be unused).
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  828  	 */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  829  	writel(0x00000000, v3->base + V3_PCI_IO_BASE);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  830  	val = V3_PCI_CFG_M_IO_REG_DIS | V3_PCI_CFG_M_IO_DIS |
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  831  		V3_PCI_CFG_M_EN3V | V3_PCI_CFG_M_AD_LOW0;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  832  	/*
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  833  	 * DMA read and write from PCI bus commands types
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  834  	 */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  835  	val |=  V3_PCI_CFG_TYPE_DEFAULT << V3_PCI_CFG_M_RTYPE_SHIFT;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  836  	val |=  V3_PCI_CFG_TYPE_DEFAULT << V3_PCI_CFG_M_WTYPE_SHIFT;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  837  	writew(val, v3->base + V3_PCI_CFG);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  838  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  839  	/*
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  840  	 * Set the V3 FIFO such that writes have higher priority than
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  841  	 * reads, and local bus write causes local bus read fifo flush
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  842  	 * on aperture 1. Same for PCI.
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  843  	 */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  844  	writew(V3_FIFO_PRIO_LB_RD1_FLUSH_AP1 |
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  845  	       V3_FIFO_PRIO_LB_RD0_FLUSH_AP1 |
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  846  	       V3_FIFO_PRIO_PCI_RD1_FLUSH_AP1 |
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  847  	       V3_FIFO_PRIO_PCI_RD0_FLUSH_AP1,
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  848  	       v3->base + V3_FIFO_PRIORITY);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  849  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  850  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  851  	/*
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  852  	 * Clear any error interrupts, and enable parity and write error
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  853  	 * interrupts
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  854  	 */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  855  	writeb(0, v3->base + V3_LB_ISTAT);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  856  	val = readw(v3->base + V3_LB_CFG);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  857  	val |= V3_LB_CFG_LB_LB_INT;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  858  	writew(val, v3->base + V3_LB_CFG);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  859  	writeb(V3_LB_ISTAT_PCI_WR | V3_LB_ISTAT_PCI_PERR,
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  860  	       v3->base + V3_LB_IMASK);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  861  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  862  	/* Special Integrator initialization */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  863  	if (of_device_is_compatible(np, "arm,integrator-ap-pci")) {
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  864  		ret = v3_integrator_init(v3);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  865  		if (ret)
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  866  			return ret;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  867  	}
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  868  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  869  	/* Post-init: enable PCI memory and invalidate (master already on) */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  870  	val = readw(v3->base + V3_PCI_CMD);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  871  	val |= PCI_COMMAND_MEMORY | PCI_COMMAND_INVALIDATE;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  872  	writew(val, v3->base + V3_PCI_CMD);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  873  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  874  	/* Clear pending interrupts */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  875  	writeb(0, v3->base + V3_LB_ISTAT);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  876  	/* Read or write errors and parity errors cause interrupts */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  877  	writeb(V3_LB_ISTAT_PCI_RD | V3_LB_ISTAT_PCI_WR | V3_LB_ISTAT_PCI_PERR,
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  878  	       v3->base + V3_LB_IMASK);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  879  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  880  	/* Take the PCI bus out of reset so devices can initialize */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  881  	val = readw(v3->base + V3_SYSTEM);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  882  	val |= V3_SYSTEM_M_RST_OUT;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  883  	writew(val, v3->base + V3_SYSTEM);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  884  
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  885  	/*
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  886  	 * Re-lock the system register.
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  887  	 */
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  888  	val = readw(v3->base + V3_SYSTEM);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  889  	val |= V3_SYSTEM_M_LOCK;
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  890  	writew(val, v3->base + V3_SYSTEM);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  891  
d7169a94f1ba8c drivers/pci/controller/pci-v3-semi.c Rob Herring          2020-05-22 @892  	return pci_host_probe(host);
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  893  }
68a15eb7bd0cf1 drivers/pci/host/pci-v3-semi.c       Linus Walleij        2017-09-26  894  

:::::: The code at line 892 was first introduced by commit
:::::: d7169a94f1ba8c14db465fe3e410a4feceea35a5 PCI: v3: Use pci_host_probe() to register host

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
