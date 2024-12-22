Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE1224FA
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 06:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734847474; cv=none; b=hxjGVtMNG3aB001tyoJ7jxIq+NUucjt2521VlzNf4sFS46rnegLIUQDOniBmQcyV07MXF9yBDOGPEH0DLQJxbA4hxIFij+esNc6yIwZJs3zJbsaJySL3T+4cO+mTFc4PZdnftfA+SeqbzdoYGcrLTPpBSutga/ao24Xjepm5IiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734847474; c=relaxed/simple;
	bh=ditJdmQIwTSxqVkCdHimMt1z8k2Y/83mvVtGlCZ3Q50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qkHhsUwO8Shvo5gcC2nqt2RzAEN+G89383pqkWv6Nf2Gr3ybayOx58ejYl7Ojpk/S5g0Z8PYElmZCoDcAQfG7yKwxaZ84mewKeyHHbAAM2vUUje4g5lSpezE7BDhwqlZFRSxGe/qsFd/HNuC2i9uonk871D/Q4Gky4fk4izYjRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlETItEf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlETItEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734847472; x=1766383472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ditJdmQIwTSxqVkCdHimMt1z8k2Y/83mvVtGlCZ3Q50=;
  b=ZlETItEf88QJiGncfCMI05kJRA3dsLu2LxJfhJY0m3LYJetso97wscVW
   0CdA8gtZRYhIkP0vbNl0zmG47bLntpL0903bnhVtJq/0E+x+f2PhnH6yB
   CJvT83ZemLxta0vqmR28lNKnTdApz18lTB09eMTZOEm1eCbDwjAdYjGLt
   /GTIMqekFNK4L1N7K8V1YS2i9Q5UC9oUjDVuu6nvy5s1PnzPOmDw98Vzi
   3Ztocf3TxGPMAcmlaCDFJgDvWTZdpyguyYCtP43FgLUjcm2TybnCNTDCH
   58ly4byidAy/R//QaKgV4WVpOz+EYTSzwrIzCtOS1BwN9HFlIoL+6hOz4
   A==;
X-CSE-ConnectionGUID: Ji9fQw9SSEObshNhd6VNhA==
X-CSE-MsgGUID: EcGJ5WLKSeywOfjXvNCreA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="34623879"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="34623879"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 22:04:31 -0800
X-CSE-ConnectionGUID: 0EmQSKXlQeuNB8aGlo1OdQ==
X-CSE-MsgGUID: 19f43ehfQ3aByUvAENrZEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="129727771"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2024 22:04:30 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPF4l-0002kv-15;
	Sun, 22 Dec 2024 06:04:27 +0000
Date: Sun, 22 Dec 2024 14:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/pci.c:186
 mt7996_pci_probe() error: uninitialized symbol 'hif2_irq'.
Message-ID: <202412221347.WJeCOwwu-lkp@intel.com>
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
TO: Sujuan Chen <sujuan.chen@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e84a3bf7f4aa669c05e3884497774148ac111468
commit: 83eafc9251d6d30574b629ac637c56d168fcbdd9 wifi: mt76: mt7996: add wed tx support
date:   1 year, 1 month ago
:::::: branch date: 10 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20241215 (https://download.01.org/0day-ci/archive/20241222/202412221347.WJeCOwwu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412221347.WJeCOwwu-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/pci.c:186 mt7996_pci_probe() error: uninitialized symbol 'hif2_irq'.

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/pci.c:192 mt7996_pci_probe() error: uninitialized symbol 'hif2_dev'.

vim +/hif2_irq +186 drivers/net/wireless/mediatek/mt76/mt7996/pci.c

98686cd21624c75 Shayne Chen 2022-11-22   90  
98686cd21624c75 Shayne Chen 2022-11-22   91  static int mt7996_pci_probe(struct pci_dev *pdev,
98686cd21624c75 Shayne Chen 2022-11-22   92  			    const struct pci_device_id *id)
98686cd21624c75 Shayne Chen 2022-11-22   93  {
98686cd21624c75 Shayne Chen 2022-11-22   94  	struct pci_dev *hif2_dev;
83eafc9251d6d30 Sujuan Chen 2023-10-20   95  	struct mt7996_hif *hif2;
98686cd21624c75 Shayne Chen 2022-11-22   96  	struct mt7996_dev *dev;
83eafc9251d6d30 Sujuan Chen 2023-10-20   97  	int irq, hif2_irq, ret;
98686cd21624c75 Shayne Chen 2022-11-22   98  	struct mt76_dev *mdev;
98686cd21624c75 Shayne Chen 2022-11-22   99  
98686cd21624c75 Shayne Chen 2022-11-22  100  	ret = pcim_enable_device(pdev);
98686cd21624c75 Shayne Chen 2022-11-22  101  	if (ret)
98686cd21624c75 Shayne Chen 2022-11-22  102  		return ret;
98686cd21624c75 Shayne Chen 2022-11-22  103  
98686cd21624c75 Shayne Chen 2022-11-22  104  	ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
98686cd21624c75 Shayne Chen 2022-11-22  105  	if (ret)
98686cd21624c75 Shayne Chen 2022-11-22  106  		return ret;
98686cd21624c75 Shayne Chen 2022-11-22  107  
98686cd21624c75 Shayne Chen 2022-11-22  108  	pci_set_master(pdev);
98686cd21624c75 Shayne Chen 2022-11-22  109  
98686cd21624c75 Shayne Chen 2022-11-22  110  	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
98686cd21624c75 Shayne Chen 2022-11-22  111  	if (ret)
98686cd21624c75 Shayne Chen 2022-11-22  112  		return ret;
98686cd21624c75 Shayne Chen 2022-11-22  113  
98686cd21624c75 Shayne Chen 2022-11-22  114  	mt76_pci_disable_aspm(pdev);
98686cd21624c75 Shayne Chen 2022-11-22  115  
98686cd21624c75 Shayne Chen 2022-11-22  116  	if (id->device == 0x7991)
98686cd21624c75 Shayne Chen 2022-11-22  117  		return mt7996_pci_hif2_probe(pdev);
98686cd21624c75 Shayne Chen 2022-11-22  118  
98686cd21624c75 Shayne Chen 2022-11-22  119  	dev = mt7996_mmio_probe(&pdev->dev, pcim_iomap_table(pdev)[0],
98686cd21624c75 Shayne Chen 2022-11-22  120  				id->device);
98686cd21624c75 Shayne Chen 2022-11-22  121  	if (IS_ERR(dev))
98686cd21624c75 Shayne Chen 2022-11-22  122  		return PTR_ERR(dev);
98686cd21624c75 Shayne Chen 2022-11-22  123  
98686cd21624c75 Shayne Chen 2022-11-22  124  	mdev = &dev->mt76;
98686cd21624c75 Shayne Chen 2022-11-22  125  	mt7996_wfsys_reset(dev);
98686cd21624c75 Shayne Chen 2022-11-22  126  	hif2 = mt7996_pci_init_hif2(pdev);
98686cd21624c75 Shayne Chen 2022-11-22  127  
83eafc9251d6d30 Sujuan Chen 2023-10-20  128  	ret = mt7996_mmio_wed_init(dev, pdev, false, &irq);
83eafc9251d6d30 Sujuan Chen 2023-10-20  129  	if (ret < 0)
83eafc9251d6d30 Sujuan Chen 2023-10-20  130  		goto free_wed_or_irq_vector;
83eafc9251d6d30 Sujuan Chen 2023-10-20  131  
83eafc9251d6d30 Sujuan Chen 2023-10-20  132  	if (!ret) {
98686cd21624c75 Shayne Chen 2022-11-22  133  		ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
98686cd21624c75 Shayne Chen 2022-11-22  134  		if (ret < 0)
98686cd21624c75 Shayne Chen 2022-11-22  135  			goto free_device;
98686cd21624c75 Shayne Chen 2022-11-22  136  
98686cd21624c75 Shayne Chen 2022-11-22  137  		irq = pdev->irq;
83eafc9251d6d30 Sujuan Chen 2023-10-20  138  	}
83eafc9251d6d30 Sujuan Chen 2023-10-20  139  
98686cd21624c75 Shayne Chen 2022-11-22  140  	ret = devm_request_irq(mdev->dev, irq, mt7996_irq_handler,
98686cd21624c75 Shayne Chen 2022-11-22  141  			       IRQF_SHARED, KBUILD_MODNAME, dev);
98686cd21624c75 Shayne Chen 2022-11-22  142  	if (ret)
83eafc9251d6d30 Sujuan Chen 2023-10-20  143  		goto free_wed_or_irq_vector;
98686cd21624c75 Shayne Chen 2022-11-22  144  
98686cd21624c75 Shayne Chen 2022-11-22  145  	mt76_wr(dev, MT_INT_MASK_CSR, 0);
98686cd21624c75 Shayne Chen 2022-11-22  146  	/* master switch of PCIe tnterrupt enable */
98686cd21624c75 Shayne Chen 2022-11-22  147  	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
98686cd21624c75 Shayne Chen 2022-11-22  148  
98686cd21624c75 Shayne Chen 2022-11-22  149  	if (hif2) {
98686cd21624c75 Shayne Chen 2022-11-22  150  		hif2_dev = container_of(hif2->dev, struct pci_dev, dev);
98686cd21624c75 Shayne Chen 2022-11-22  151  		dev->hif2 = hif2;
98686cd21624c75 Shayne Chen 2022-11-22  152  
83eafc9251d6d30 Sujuan Chen 2023-10-20  153  		ret = mt7996_mmio_wed_init(dev, hif2_dev, true, &hif2_irq);
83eafc9251d6d30 Sujuan Chen 2023-10-20  154  		if (ret < 0)
83eafc9251d6d30 Sujuan Chen 2023-10-20  155  			goto free_hif2_wed_irq_vector;
83eafc9251d6d30 Sujuan Chen 2023-10-20  156  
83eafc9251d6d30 Sujuan Chen 2023-10-20  157  		if (!ret) {
83eafc9251d6d30 Sujuan Chen 2023-10-20  158  			ret = pci_alloc_irq_vectors(hif2_dev, 1, 1,
83eafc9251d6d30 Sujuan Chen 2023-10-20  159  						    PCI_IRQ_ALL_TYPES);
98686cd21624c75 Shayne Chen 2022-11-22  160  			if (ret < 0)
98686cd21624c75 Shayne Chen 2022-11-22  161  				goto free_hif2;
98686cd21624c75 Shayne Chen 2022-11-22  162  
98686cd21624c75 Shayne Chen 2022-11-22  163  			dev->hif2->irq = hif2_dev->irq;
83eafc9251d6d30 Sujuan Chen 2023-10-20  164  			hif2_irq = dev->hif2->irq;
83eafc9251d6d30 Sujuan Chen 2023-10-20  165  		}
83eafc9251d6d30 Sujuan Chen 2023-10-20  166  
83eafc9251d6d30 Sujuan Chen 2023-10-20  167  		ret = devm_request_irq(mdev->dev, hif2_irq, mt7996_irq_handler,
83eafc9251d6d30 Sujuan Chen 2023-10-20  168  				       IRQF_SHARED, KBUILD_MODNAME "-hif",
83eafc9251d6d30 Sujuan Chen 2023-10-20  169  				       dev);
98686cd21624c75 Shayne Chen 2022-11-22  170  		if (ret)
83eafc9251d6d30 Sujuan Chen 2023-10-20  171  			goto free_hif2_wed_irq_vector;
98686cd21624c75 Shayne Chen 2022-11-22  172  
98686cd21624c75 Shayne Chen 2022-11-22  173  		mt76_wr(dev, MT_INT1_MASK_CSR, 0);
98686cd21624c75 Shayne Chen 2022-11-22  174  		/* master switch of PCIe tnterrupt enable */
98686cd21624c75 Shayne Chen 2022-11-22  175  		mt76_wr(dev, MT_PCIE1_MAC_INT_ENABLE, 0xff);
98686cd21624c75 Shayne Chen 2022-11-22  176  	}
98686cd21624c75 Shayne Chen 2022-11-22  177  
98686cd21624c75 Shayne Chen 2022-11-22  178  	ret = mt7996_register_device(dev);
98686cd21624c75 Shayne Chen 2022-11-22  179  	if (ret)
98686cd21624c75 Shayne Chen 2022-11-22  180  		goto free_hif2_irq;
98686cd21624c75 Shayne Chen 2022-11-22  181  
98686cd21624c75 Shayne Chen 2022-11-22  182  	return 0;
98686cd21624c75 Shayne Chen 2022-11-22  183  
98686cd21624c75 Shayne Chen 2022-11-22  184  free_hif2_irq:
98686cd21624c75 Shayne Chen 2022-11-22  185  	if (dev->hif2)
83eafc9251d6d30 Sujuan Chen 2023-10-20 @186  		devm_free_irq(mdev->dev, hif2_irq, dev);
83eafc9251d6d30 Sujuan Chen 2023-10-20  187  free_hif2_wed_irq_vector:
83eafc9251d6d30 Sujuan Chen 2023-10-20  188  	if (dev->hif2) {
83eafc9251d6d30 Sujuan Chen 2023-10-20  189  		if (mtk_wed_device_active(&dev->mt76.mmio.wed_hif2))
83eafc9251d6d30 Sujuan Chen 2023-10-20  190  			mtk_wed_device_detach(&dev->mt76.mmio.wed_hif2);
83eafc9251d6d30 Sujuan Chen 2023-10-20  191  		else
98686cd21624c75 Shayne Chen 2022-11-22  192  			pci_free_irq_vectors(hif2_dev);
83eafc9251d6d30 Sujuan Chen 2023-10-20  193  	}
98686cd21624c75 Shayne Chen 2022-11-22  194  free_hif2:
98686cd21624c75 Shayne Chen 2022-11-22  195  	if (dev->hif2)
98686cd21624c75 Shayne Chen 2022-11-22  196  		put_device(dev->hif2->dev);
98686cd21624c75 Shayne Chen 2022-11-22  197  	devm_free_irq(mdev->dev, irq, dev);
83eafc9251d6d30 Sujuan Chen 2023-10-20  198  free_wed_or_irq_vector:
83eafc9251d6d30 Sujuan Chen 2023-10-20  199  	if (mtk_wed_device_active(&dev->mt76.mmio.wed))
83eafc9251d6d30 Sujuan Chen 2023-10-20  200  		mtk_wed_device_detach(&dev->mt76.mmio.wed);
83eafc9251d6d30 Sujuan Chen 2023-10-20  201  	else
98686cd21624c75 Shayne Chen 2022-11-22  202  		pci_free_irq_vectors(pdev);
98686cd21624c75 Shayne Chen 2022-11-22  203  free_device:
98686cd21624c75 Shayne Chen 2022-11-22  204  	mt76_free_device(&dev->mt76);
98686cd21624c75 Shayne Chen 2022-11-22  205  
98686cd21624c75 Shayne Chen 2022-11-22  206  	return ret;
98686cd21624c75 Shayne Chen 2022-11-22  207  }
98686cd21624c75 Shayne Chen 2022-11-22  208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
