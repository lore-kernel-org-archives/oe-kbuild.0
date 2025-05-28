Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112B21FBEBE
	for <oe-kbuild@lists.linux.dev>; Wed, 28 May 2025 07:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748415744; cv=none; b=foPU+Jnr2P/O368tKwGAqVkGr4BSFaZ4aVfi20gcNArRbqP7OC0l6a2UV9UitLD2/cDCD5gDcjU00M78MBxe4ljiSw55aAIhzxS/Lg6NT3ftkgyu/IHuydN1lRqsTlRpOhl/i6SnE14sDQVV9ibl+8DnxLD+uJkoZCq2dR4D3CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748415744; c=relaxed/simple;
	bh=wjTOeEzg7TTrbzIVPcmz/NnObhocOkaN5xD2lrkVke4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DPrPbLRvNxG43FFrMjv7EuGiKKmViMND4llYQPB8RGo/RJaasUJwzvopo4IwujDWkZCQmtxWtrYEotSG4Vu6AqJnwdqrO/n0pbX2vpvlD4vlZqrTbxikpyZA1NuX7qCxpL1s5apXj/RBlY3xX5wtYv6P5oxNZaQ/rGC6lQe9+0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkiJ9ZNr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkiJ9ZNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748415742; x=1779951742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wjTOeEzg7TTrbzIVPcmz/NnObhocOkaN5xD2lrkVke4=;
  b=hkiJ9ZNrusLIS0mIaU5kHumuJH4cNCXt7Z/qkd9jGTyaIkYvTl7xfw75
   MMYu5ywzEMST36JLzm9l/C4/TXyIA34Gx1hRhE2y+STUlhthtBZ7jsLBp
   DUkbV6raNsq1HpBgNYcPu/ZPb7lIB8sW6+4BHjt8wRPEbVQZ7VfYf2fq4
   gGMK0AiSRujV7msA9nI8nhVwBSzWES1E14yhHaSk1hNql1e0OdflbRvXf
   69L/Mm9gtzA+p6W62mKpAoP7dFrWrzfOfNum4RC2R/kbwJaezOxoqB+He
   DNID5pdABCF4h8xLkBe4usxgnEudI3P0Mtu5WHvTgNWMfSWCZk+MwMiik
   A==;
X-CSE-ConnectionGUID: dQKPtpcHTJq+wJjtBarb2A==
X-CSE-MsgGUID: dO0ndM7ERmySYwUzupcmig==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49676891"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="49676891"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 00:02:21 -0700
X-CSE-ConnectionGUID: /iBfGOfYSJGXQ88p7F5uLQ==
X-CSE-MsgGUID: 035GWhmiSTmD6LyIPGSiNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="143067829"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 May 2025 00:02:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKAnp-000VMU-1L;
	Wed, 28 May 2025 07:02:17 +0000
Date: Wed, 28 May 2025 15:02:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-spi:for-next 9/11] drivers/spi/spi-pci1xxxx.c:768
 pci1xxxx_spi_probe() warn: missing error code? 'ret'
Message-ID: <202505281417.WyCoNJlC-lkp@intel.com>
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
CC: linux-spi@vger.kernel.org
TO: Thangaraj Samynathan <thangaraj.s@microchip.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
head:   6aae49917bd543677e539df17556071edd9a273a
commit: b4608e944177531334a79f3df2cd14275b47808c [9/11] spi: spi-pci1xxxx: Fix Probe failure with Dual SPI instance with INTx interrupts
:::::: branch date: 14 hours ago
:::::: commit date: 20 hours ago
config: riscv-randconfig-r073-20250528 (https://download.01.org/0day-ci/archive/20250528/202505281417.WyCoNJlC-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505281417.WyCoNJlC-lkp@intel.com/

smatch warnings:
drivers/spi/spi-pci1xxxx.c:768 pci1xxxx_spi_probe() warn: missing error code? 'ret'

vim +/ret +768 drivers/spi/spi-pci1xxxx.c

9538edeb72c989a Thangaraj Samynathan 2024-02-07  708  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  709  static int pci1xxxx_spi_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  710  {
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  711  	u8 hw_inst_cnt, iter, start, only_sec_inst;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  712  	struct pci1xxxx_spi_internal *spi_sub_ptr;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  713  	struct device *dev = &pdev->dev;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  714  	struct pci1xxxx_spi *spi_bus;
f9977bb164a26d3 Yang Yingliang       2023-08-18  715  	struct spi_controller *spi_host;
b4608e944177531 Thangaraj Samynathan 2025-05-27  716  	int num_vector = 0;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  717  	u32 regval;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  718  	int ret;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  719  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  720  	hw_inst_cnt = ent->driver_data & 0x0f;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  721  	start = (ent->driver_data & 0xf0) >> 4;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  722  	if (start == 1)
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  723  		only_sec_inst = 1;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  724  	else
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  725  		only_sec_inst = 0;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  726  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  727  	spi_bus = devm_kzalloc(&pdev->dev,
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  728  			       struct_size(spi_bus, spi_int, hw_inst_cnt),
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  729  			       GFP_KERNEL);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  730  	if (!spi_bus)
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  731  		return -ENOMEM;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  732  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  733  	spi_bus->dev = pdev;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  734  	spi_bus->total_hw_instances = hw_inst_cnt;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  735  	pci_set_master(pdev);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  736  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  737  	for (iter = 0; iter < hw_inst_cnt; iter++) {
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  738  		spi_bus->spi_int[iter] = devm_kzalloc(&pdev->dev,
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  739  						      sizeof(struct pci1xxxx_spi_internal),
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  740  						      GFP_KERNEL);
1f886a7bfb3faf4 Huai-Yuan Liu        2024-04-03  741  		if (!spi_bus->spi_int[iter])
1f886a7bfb3faf4 Huai-Yuan Liu        2024-04-03  742  			return -ENOMEM;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  743  		spi_sub_ptr = spi_bus->spi_int[iter];
f9977bb164a26d3 Yang Yingliang       2023-08-18  744  		spi_sub_ptr->spi_host = devm_spi_alloc_host(dev, sizeof(struct spi_controller));
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  745  		if (!spi_sub_ptr->spi_host)
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  746  			return -ENOMEM;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  747  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  748  		spi_sub_ptr->parent = spi_bus;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  749  		spi_sub_ptr->spi_xfer_in_progress = false;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  750  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  751  		if (!iter) {
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  752  			ret = pcim_enable_device(pdev);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  753  			if (ret)
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  754  				return -ENOMEM;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  755  
d981e7b3f25fbab Philipp Stanner      2025-04-17  756  			ret = pcim_request_all_regions(pdev, DRV_NAME);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  757  			if (ret)
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  758  				return -ENOMEM;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  759  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  760  			spi_bus->reg_base = pcim_iomap(pdev, 0, pci_resource_len(pdev, 0));
d981e7b3f25fbab Philipp Stanner      2025-04-17  761  			if (!spi_bus->reg_base)
d981e7b3f25fbab Philipp Stanner      2025-04-17  762  				return -EINVAL;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  763  
b4608e944177531 Thangaraj Samynathan 2025-05-27  764  			num_vector = pci_alloc_irq_vectors(pdev, 1, hw_inst_cnt,
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  765  							   PCI_IRQ_ALL_TYPES);
b4608e944177531 Thangaraj Samynathan 2025-05-27  766  			if (num_vector < 0) {
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  767  				dev_err(&pdev->dev, "Error allocating MSI vectors\n");
d981e7b3f25fbab Philipp Stanner      2025-04-17 @768  				return ret;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  769  			}
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  770  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  771  			init_completion(&spi_sub_ptr->spi_xfer_done);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  772  			/* Initialize Interrupts - SPI_INT */
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  773  			regval = readl(spi_bus->reg_base +
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  774  				       SPI_MST_EVENT_MASK_REG_OFFSET(spi_sub_ptr->hw_inst));
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  775  			regval &= ~SPI_INTR;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  776  			writel(regval, spi_bus->reg_base +
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  777  			       SPI_MST_EVENT_MASK_REG_OFFSET(spi_sub_ptr->hw_inst));
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  778  			spi_sub_ptr->irq = pci_irq_vector(pdev, 0);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  779  
b4608e944177531 Thangaraj Samynathan 2025-05-27  780  			if (num_vector >= hw_inst_cnt)
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  781  				ret = devm_request_irq(&pdev->dev, spi_sub_ptr->irq,
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  782  						       pci1xxxx_spi_isr, PCI1XXXX_IRQ_FLAGS,
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  783  						       pci_name(pdev), spi_sub_ptr);
b4608e944177531 Thangaraj Samynathan 2025-05-27  784  			else
b4608e944177531 Thangaraj Samynathan 2025-05-27  785  				ret = devm_request_irq(&pdev->dev, spi_sub_ptr->irq,
b4608e944177531 Thangaraj Samynathan 2025-05-27  786  						       pci1xxxx_spi_shared_isr,
b4608e944177531 Thangaraj Samynathan 2025-05-27  787  						       PCI1XXXX_IRQ_FLAGS | IRQF_SHARED,
b4608e944177531 Thangaraj Samynathan 2025-05-27  788  						       pci_name(pdev), spi_bus);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  789  			if (ret < 0) {
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  790  				dev_err(&pdev->dev, "Unable to request irq : %d",
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  791  					spi_sub_ptr->irq);
d981e7b3f25fbab Philipp Stanner      2025-04-17  792  				return -ENODEV;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  793  			}
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  794  
3e7cfd6ad29a748 Thangaraj Samynathan 2024-02-07  795  			ret = pci1xxxx_spi_dma_init(spi_bus, spi_sub_ptr->irq);
3e7cfd6ad29a748 Thangaraj Samynathan 2024-02-07  796  			if (ret && ret != -EOPNOTSUPP)
d981e7b3f25fbab Philipp Stanner      2025-04-17  797  				return ret;
3e7cfd6ad29a748 Thangaraj Samynathan 2024-02-07  798  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  799  			/* This register is only applicable for 1st instance */
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  800  			regval = readl(spi_bus->reg_base + SPI_PCI_CTRL_REG_OFFSET(0));
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  801  			if (!only_sec_inst)
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  802  				regval |= (BIT(4));
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  803  			else
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  804  				regval &= ~(BIT(4));
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  805  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  806  			writel(regval, spi_bus->reg_base + SPI_PCI_CTRL_REG_OFFSET(0));
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  807  		}
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  808  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  809  		spi_sub_ptr->hw_inst = start++;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  810  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  811  		if (iter == 1) {
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  812  			init_completion(&spi_sub_ptr->spi_xfer_done);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  813  			/* Initialize Interrupts - SPI_INT */
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  814  			regval = readl(spi_bus->reg_base +
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  815  			       SPI_MST_EVENT_MASK_REG_OFFSET(spi_sub_ptr->hw_inst));
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  816  			regval &= ~SPI_INTR;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  817  			writel(regval, spi_bus->reg_base +
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  818  			       SPI_MST_EVENT_MASK_REG_OFFSET(spi_sub_ptr->hw_inst));
b4608e944177531 Thangaraj Samynathan 2025-05-27  819  			if (num_vector >= hw_inst_cnt) {
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  820  				spi_sub_ptr->irq = pci_irq_vector(pdev, iter);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  821  				ret = devm_request_irq(&pdev->dev, spi_sub_ptr->irq,
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  822  						       pci1xxxx_spi_isr, PCI1XXXX_IRQ_FLAGS,
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  823  						       pci_name(pdev), spi_sub_ptr);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  824  				if (ret < 0) {
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  825  					dev_err(&pdev->dev, "Unable to request irq : %d",
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  826  						spi_sub_ptr->irq);
d981e7b3f25fbab Philipp Stanner      2025-04-17  827  					return -ENODEV;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  828  				}
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  829  			}
b4608e944177531 Thangaraj Samynathan 2025-05-27  830  		}
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  831  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  832  		spi_host = spi_sub_ptr->spi_host;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  833  		spi_host->num_chipselect = SPI_CHIP_SEL_COUNT;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  834  		spi_host->mode_bits = SPI_MODE_0 | SPI_MODE_3 | SPI_RX_DUAL |
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  835  				      SPI_TX_DUAL | SPI_LOOP;
9538edeb72c989a Thangaraj Samynathan 2024-02-07  836  		spi_host->can_dma = pci1xxxx_spi_can_dma;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  837  		spi_host->transfer_one = pci1xxxx_spi_transfer_one;
9538edeb72c989a Thangaraj Samynathan 2024-02-07  838  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  839  		spi_host->set_cs = pci1xxxx_spi_set_cs;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  840  		spi_host->bits_per_word_mask = SPI_BPW_MASK(8);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  841  		spi_host->max_speed_hz = PCI1XXXX_SPI_MAX_CLOCK_HZ;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  842  		spi_host->min_speed_hz = PCI1XXXX_SPI_MIN_CLOCK_HZ;
90366cd60133a9f Andy Shevchenko      2023-07-10  843  		spi_host->flags = SPI_CONTROLLER_MUST_TX;
f9977bb164a26d3 Yang Yingliang       2023-08-18  844  		spi_controller_set_devdata(spi_host, spi_sub_ptr);
f9977bb164a26d3 Yang Yingliang       2023-08-18  845  		ret = devm_spi_register_controller(dev, spi_host);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  846  		if (ret)
d981e7b3f25fbab Philipp Stanner      2025-04-17  847  			return ret;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  848  	}
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  849  	pci_set_drvdata(pdev, spi_bus);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  850  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  851  	return 0;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  852  }
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  853  

:::::: The code at line 768 was first introduced by commit
:::::: d981e7b3f25fbabca9cdd02aa2a8f16d6f235fc2 spi: pci1xxxx: Use non-hybrid PCI devres API

:::::: TO: Philipp Stanner <phasta@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
