Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B244107A9
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 07:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGjbrVTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702450907; x=1733986907;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RZQnlhG3ftNtXqfdkHHURxZB2sdSANmQPmbfHLz0OzQ=;
  b=DGjbrVTS9zW3TbElH0dW44N7/UHU87LeXkdBP0FNv6DOr38HMT+r4vfQ
   o+ZBvVsZxaxuScx+Gq3cMDuIveuIcZrgDMebeCGdbGncqMUpn17ksAfBR
   k+yp331DdFEDe5a02Na/+UKtJmlzePtdAPY/GafcwDPaMyi2Mqaf5WgqW
   Rza+czyjuwEZN9cFeVgY4KfnOsaJwp+2KEbTTeyFsXtMET4sdbpmrjjxg
   5prEtiAfdiAkYrDl9zyrpngIWCHHxS2Yje6zmA/KeWAr7p/SVTU/dC5Y6
   RzuGpfDX3ejVh7CkPJTaLc3NwE7Ac3Omf7fzbvsug0rH9EbRcUoZdaXe0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="461397793"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="461397793"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 23:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="808056759"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="808056759"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Dec 2023 23:01:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDJFW-000KBL-1z;
	Wed, 13 Dec 2023 07:01:42 +0000
Date: Wed, 13 Dec 2023 15:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/controller/pcie-xilinx-dma-pl.c:638
 xilinx_pl_dma_pcie_setup_irq() error: uninitialized symbol 'irq'.
Message-ID: <202312131444.UVOjSXTF-lkp@intel.com>
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
head:   88035e5694a86a7167d490bb95e9df97a9bb162b
commit: 8d786149d78c7784144c7179e25134b6530b714b PCI: xilinx-xdma: Add Xilinx XDMA Root Port driver
date:   7 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-r071-20231211 (https://download.01.org/0day-ci/archive/20231213/202312131444.UVOjSXTF-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312131444.UVOjSXTF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312131444.UVOjSXTF-lkp@intel.com/

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
