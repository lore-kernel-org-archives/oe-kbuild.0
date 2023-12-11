Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F174F1FD
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBeMr615"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702318288; x=1733854288;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6Ak9bm0qxm3rtY8qwQ8vX1FIAoBR5Hf2X+wjPR0IRg8=;
  b=kBeMr6159bkPNRfvrVzwDZRAcTBVeEGs/UmMzIimJE9rDjgpaK6R4kFv
   ae+Fis1fJjURJfyB5I99PlBtV7z9V1iE633j2JdOiF6Byt40vOdcL/UzX
   07yxzk8nfIG9iMpEgbCowAx8vMyGoIYjHsoztpbSi6g0ceFKirdFdRfVl
   UyMQBWMaFSf2D2mFa1M//KUouPA95Vild+qXmXQbQYatSzBkFo2fFIv8y
   AurWkbmEjVOYTpENdT+Fb5ckdyZe6tPePOxkA9B7WOGPFpGDJDcGxo2nH
   YtsKzYK4w6h7sHAluW9hUh5uYcrggH8Vq+C6lKRY6DKw/ah1gndg70y3G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="13384107"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="13384107"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 10:11:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="722901784"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="722901784"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Dec 2023 10:11:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCkkV-000ILK-0I;
	Mon, 11 Dec 2023 18:11:23 +0000
Date: Tue, 12 Dec 2023 02:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/controller/pcie-xilinx-dma-pl.c:638
 xilinx_pl_dma_pcie_setup_irq() error: uninitialized symbol 'irq'.
Message-ID: <202312120248.5DblxkBp-lkp@intel.com>
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
TO: Thippeswamy Havalige <thippeswamy.havalige@amd.com>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
CC: Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: 8d786149d78c7784144c7179e25134b6530b714b PCI: xilinx-xdma: Add Xilinx XDMA Root Port driver
date:   7 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-r071-20231211 (https://download.01.org/0day-ci/archive/20231212/202312120248.5DblxkBp-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312120248.5DblxkBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312120248.5DblxkBp-lkp@intel.com/

New smatch warnings:
drivers/pci/controller/pcie-xilinx-dma-pl.c:638 xilinx_pl_dma_pcie_setup_irq() error: uninitialized symbol 'irq'.

Old smatch warnings:
drivers/pci/controller/pcie-xilinx-dma-pl.c:579 xilinx_pl_dma_pcie_init_irq_domain() warn: passing zero to 'PTR_ERR'
drivers/pci/controller/pcie-xilinx-dma-pl.c:645 xilinx_pl_dma_pcie_setup_irq() error: uninitialized symbol 'irq'.

vim +/irq +638 drivers/pci/controller/pcie-xilinx-dma-pl.c

8d786149d78c77 Thippeswamy Havalige 2023-10-03  595  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  596  static int xilinx_pl_dma_pcie_setup_irq(struct pl_dma_pcie *port)
8d786149d78c77 Thippeswamy Havalige 2023-10-03  597  {
8d786149d78c77 Thippeswamy Havalige 2023-10-03  598  	struct device *dev = port->dev;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  599  	struct platform_device *pdev = to_platform_device(dev);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  600  	int i, irq, err;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  601  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  602  	port->irq = platform_get_irq(pdev, 0);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  603  	if (port->irq < 0)
8d786149d78c77 Thippeswamy Havalige 2023-10-03  604  		return port->irq;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  605  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  606  	for (i = 0; i < ARRAY_SIZE(intr_cause); i++) {
8d786149d78c77 Thippeswamy Havalige 2023-10-03  607  		int err;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  608  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  609  		if (!intr_cause[i].str)
8d786149d78c77 Thippeswamy Havalige 2023-10-03  610  			continue;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  611  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  612  		irq = irq_create_mapping(port->pldma_domain, i);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  613  		if (!irq) {
8d786149d78c77 Thippeswamy Havalige 2023-10-03  614  			dev_err(dev, "Failed to map interrupt\n");
8d786149d78c77 Thippeswamy Havalige 2023-10-03  615  			return -ENXIO;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  616  		}
8d786149d78c77 Thippeswamy Havalige 2023-10-03  617  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  618  		err = devm_request_irq(dev, irq,
8d786149d78c77 Thippeswamy Havalige 2023-10-03  619  				       xilinx_pl_dma_pcie_intr_handler,
8d786149d78c77 Thippeswamy Havalige 2023-10-03  620  				       IRQF_SHARED | IRQF_NO_THREAD,
8d786149d78c77 Thippeswamy Havalige 2023-10-03  621  				       intr_cause[i].sym, port);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  622  		if (err) {
8d786149d78c77 Thippeswamy Havalige 2023-10-03  623  			dev_err(dev, "Failed to request IRQ %d\n", irq);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  624  			return err;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  625  		}
8d786149d78c77 Thippeswamy Havalige 2023-10-03  626  	}
8d786149d78c77 Thippeswamy Havalige 2023-10-03  627  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  628  	port->intx_irq = irq_create_mapping(port->pldma_domain,
8d786149d78c77 Thippeswamy Havalige 2023-10-03  629  					    XILINX_PCIE_INTR_INTX);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  630  	if (!port->intx_irq) {
8d786149d78c77 Thippeswamy Havalige 2023-10-03  631  		dev_err(dev, "Failed to map INTx interrupt\n");
8d786149d78c77 Thippeswamy Havalige 2023-10-03  632  		return -ENXIO;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  633  	}
8d786149d78c77 Thippeswamy Havalige 2023-10-03  634  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  635  	err = devm_request_irq(dev, port->intx_irq, xilinx_pl_dma_pcie_intx_flow,
8d786149d78c77 Thippeswamy Havalige 2023-10-03  636  			       IRQF_SHARED | IRQF_NO_THREAD, NULL, port);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  637  	if (err) {
8d786149d78c77 Thippeswamy Havalige 2023-10-03 @638  		dev_err(dev, "Failed to request INTx IRQ %d\n", irq);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  639  		return err;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  640  	}
8d786149d78c77 Thippeswamy Havalige 2023-10-03  641  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  642  	err = devm_request_irq(dev, port->irq, xilinx_pl_dma_pcie_event_flow,
8d786149d78c77 Thippeswamy Havalige 2023-10-03  643  			       IRQF_SHARED | IRQF_NO_THREAD, NULL, port);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  644  	if (err) {
8d786149d78c77 Thippeswamy Havalige 2023-10-03  645  		dev_err(dev, "Failed to request event IRQ %d\n", irq);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  646  		return err;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  647  	}
8d786149d78c77 Thippeswamy Havalige 2023-10-03  648  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  649  	return 0;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  650  }
8d786149d78c77 Thippeswamy Havalige 2023-10-03  651  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
