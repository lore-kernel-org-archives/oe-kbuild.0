Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B1634CD6
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jan 2024 01:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705801502; cv=none; b=YXVBH2N7Aha4Vi5gKENlJiqJL9+5znSr1E4yJ1JE1h9xtqIkJH22exHj6Qh0nh23lD/Q2Ur/9Knedw/nxMQ+rocuHsW4GJq7WykI7VVfvPQ2D3T0TfQT+Sa92e+gj15IULpG708VVzPCT+PiGtc328zuL6R2Kr02D8FmFi8s5gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705801502; c=relaxed/simple;
	bh=YW4uKMeRuvQVin+admMppVsxhXbhBw519WfPlNDlPEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LYbAgvn0T9OpuqifzAmj/bVJ/hIkt30RIVgRJHYfTLmsIhEuxtsCIe68MOkNA/bvphcKFgOZXm+idJRk20wRzUVu7erD2tLpaarL39VeOv00I61vwakY1cLlVyuh7UkE8yq6mFlXRgyUN1mHnghT/OFkpcSC/cyjdQYZHHxFEWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZyLuxQiX; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZyLuxQiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705801500; x=1737337500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YW4uKMeRuvQVin+admMppVsxhXbhBw519WfPlNDlPEg=;
  b=ZyLuxQiX9U+b74DWO88LjQ0DLVZYyWy29D3vfmWpIxCpcdn6ZN/Wggk7
   edUd/YIGmhW+pyjA2AHdaW96yC6dQGEfpvw0UEc1aGS4N0pPBc3k4bK/E
   sMAyPTm0SZDLf46vE1HvhRyK/ivQppMC9LmhyFqyaoW7kovJ6ck0wOoFt
   UAto60U+JanYGzeqAaFE9wXIIohpOMbssYCu/+48ELKKhm9w1iRMRKtPT
   fhhvCu2g4lh2sfypAfAntPYriaoykOHTcjF8soyfcMi5X2MKB9Jbh10sF
   Mgfsl5F/ibm42oRTLnV74it3rqF1xmYZ62Afj6cY4DEvisOvyNmXa41Jw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="399866665"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="399866665"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 17:44:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="788663527"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="788663527"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2024 17:44:58 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRMtM-0005ak-0x;
	Sun, 21 Jan 2024 01:44:56 +0000
Date: Sun, 21 Jan 2024 09:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/pci.c:186
 mt7996_pci_probe() error: uninitialized symbol 'hif2_irq'.
Message-ID: <202401210951.jg9Jvhdi-lkp@intel.com>
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
head:   e5075d8ec5647322fb9e699bfb76331cc8ee098d
commit: 83eafc9251d6d30574b629ac637c56d168fcbdd9 wifi: mt76: mt7996: add wed tx support
date:   6 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-161-20240120 (https://download.01.org/0day-ci/archive/20240121/202401210951.jg9Jvhdi-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401210951.jg9Jvhdi-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/pci.c:186 mt7996_pci_probe() error: uninitialized symbol 'hif2_irq'.

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/pci.c:192 mt7996_pci_probe() error: uninitialized symbol 'hif2_dev'.

vim +/hif2_irq +186 drivers/net/wireless/mediatek/mt76/mt7996/pci.c

98686cd21624c7 Shayne Chen 2022-11-22   90  
98686cd21624c7 Shayne Chen 2022-11-22   91  static int mt7996_pci_probe(struct pci_dev *pdev,
98686cd21624c7 Shayne Chen 2022-11-22   92  			    const struct pci_device_id *id)
98686cd21624c7 Shayne Chen 2022-11-22   93  {
98686cd21624c7 Shayne Chen 2022-11-22   94  	struct pci_dev *hif2_dev;
83eafc9251d6d3 Sujuan Chen 2023-10-20   95  	struct mt7996_hif *hif2;
98686cd21624c7 Shayne Chen 2022-11-22   96  	struct mt7996_dev *dev;
83eafc9251d6d3 Sujuan Chen 2023-10-20   97  	int irq, hif2_irq, ret;
98686cd21624c7 Shayne Chen 2022-11-22   98  	struct mt76_dev *mdev;
98686cd21624c7 Shayne Chen 2022-11-22   99  
98686cd21624c7 Shayne Chen 2022-11-22  100  	ret = pcim_enable_device(pdev);
98686cd21624c7 Shayne Chen 2022-11-22  101  	if (ret)
98686cd21624c7 Shayne Chen 2022-11-22  102  		return ret;
98686cd21624c7 Shayne Chen 2022-11-22  103  
98686cd21624c7 Shayne Chen 2022-11-22  104  	ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
98686cd21624c7 Shayne Chen 2022-11-22  105  	if (ret)
98686cd21624c7 Shayne Chen 2022-11-22  106  		return ret;
98686cd21624c7 Shayne Chen 2022-11-22  107  
98686cd21624c7 Shayne Chen 2022-11-22  108  	pci_set_master(pdev);
98686cd21624c7 Shayne Chen 2022-11-22  109  
98686cd21624c7 Shayne Chen 2022-11-22  110  	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
98686cd21624c7 Shayne Chen 2022-11-22  111  	if (ret)
98686cd21624c7 Shayne Chen 2022-11-22  112  		return ret;
98686cd21624c7 Shayne Chen 2022-11-22  113  
98686cd21624c7 Shayne Chen 2022-11-22  114  	mt76_pci_disable_aspm(pdev);
98686cd21624c7 Shayne Chen 2022-11-22  115  
98686cd21624c7 Shayne Chen 2022-11-22  116  	if (id->device == 0x7991)
98686cd21624c7 Shayne Chen 2022-11-22  117  		return mt7996_pci_hif2_probe(pdev);
98686cd21624c7 Shayne Chen 2022-11-22  118  
98686cd21624c7 Shayne Chen 2022-11-22  119  	dev = mt7996_mmio_probe(&pdev->dev, pcim_iomap_table(pdev)[0],
98686cd21624c7 Shayne Chen 2022-11-22  120  				id->device);
98686cd21624c7 Shayne Chen 2022-11-22  121  	if (IS_ERR(dev))
98686cd21624c7 Shayne Chen 2022-11-22  122  		return PTR_ERR(dev);
98686cd21624c7 Shayne Chen 2022-11-22  123  
98686cd21624c7 Shayne Chen 2022-11-22  124  	mdev = &dev->mt76;
98686cd21624c7 Shayne Chen 2022-11-22  125  	mt7996_wfsys_reset(dev);
98686cd21624c7 Shayne Chen 2022-11-22  126  	hif2 = mt7996_pci_init_hif2(pdev);
98686cd21624c7 Shayne Chen 2022-11-22  127  
83eafc9251d6d3 Sujuan Chen 2023-10-20  128  	ret = mt7996_mmio_wed_init(dev, pdev, false, &irq);
83eafc9251d6d3 Sujuan Chen 2023-10-20  129  	if (ret < 0)
83eafc9251d6d3 Sujuan Chen 2023-10-20  130  		goto free_wed_or_irq_vector;
83eafc9251d6d3 Sujuan Chen 2023-10-20  131  
83eafc9251d6d3 Sujuan Chen 2023-10-20  132  	if (!ret) {
98686cd21624c7 Shayne Chen 2022-11-22  133  		ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
98686cd21624c7 Shayne Chen 2022-11-22  134  		if (ret < 0)
98686cd21624c7 Shayne Chen 2022-11-22  135  			goto free_device;
98686cd21624c7 Shayne Chen 2022-11-22  136  
98686cd21624c7 Shayne Chen 2022-11-22  137  		irq = pdev->irq;
83eafc9251d6d3 Sujuan Chen 2023-10-20  138  	}
83eafc9251d6d3 Sujuan Chen 2023-10-20  139  
98686cd21624c7 Shayne Chen 2022-11-22  140  	ret = devm_request_irq(mdev->dev, irq, mt7996_irq_handler,
98686cd21624c7 Shayne Chen 2022-11-22  141  			       IRQF_SHARED, KBUILD_MODNAME, dev);
98686cd21624c7 Shayne Chen 2022-11-22  142  	if (ret)
83eafc9251d6d3 Sujuan Chen 2023-10-20  143  		goto free_wed_or_irq_vector;
98686cd21624c7 Shayne Chen 2022-11-22  144  
98686cd21624c7 Shayne Chen 2022-11-22  145  	mt76_wr(dev, MT_INT_MASK_CSR, 0);
98686cd21624c7 Shayne Chen 2022-11-22  146  	/* master switch of PCIe tnterrupt enable */
98686cd21624c7 Shayne Chen 2022-11-22  147  	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
98686cd21624c7 Shayne Chen 2022-11-22  148  
98686cd21624c7 Shayne Chen 2022-11-22  149  	if (hif2) {
98686cd21624c7 Shayne Chen 2022-11-22  150  		hif2_dev = container_of(hif2->dev, struct pci_dev, dev);
98686cd21624c7 Shayne Chen 2022-11-22  151  		dev->hif2 = hif2;
98686cd21624c7 Shayne Chen 2022-11-22  152  
83eafc9251d6d3 Sujuan Chen 2023-10-20  153  		ret = mt7996_mmio_wed_init(dev, hif2_dev, true, &hif2_irq);
83eafc9251d6d3 Sujuan Chen 2023-10-20  154  		if (ret < 0)
83eafc9251d6d3 Sujuan Chen 2023-10-20  155  			goto free_hif2_wed_irq_vector;
83eafc9251d6d3 Sujuan Chen 2023-10-20  156  
83eafc9251d6d3 Sujuan Chen 2023-10-20  157  		if (!ret) {
83eafc9251d6d3 Sujuan Chen 2023-10-20  158  			ret = pci_alloc_irq_vectors(hif2_dev, 1, 1,
83eafc9251d6d3 Sujuan Chen 2023-10-20  159  						    PCI_IRQ_ALL_TYPES);
98686cd21624c7 Shayne Chen 2022-11-22  160  			if (ret < 0)
98686cd21624c7 Shayne Chen 2022-11-22  161  				goto free_hif2;
98686cd21624c7 Shayne Chen 2022-11-22  162  
98686cd21624c7 Shayne Chen 2022-11-22  163  			dev->hif2->irq = hif2_dev->irq;
83eafc9251d6d3 Sujuan Chen 2023-10-20  164  			hif2_irq = dev->hif2->irq;
83eafc9251d6d3 Sujuan Chen 2023-10-20  165  		}
83eafc9251d6d3 Sujuan Chen 2023-10-20  166  
83eafc9251d6d3 Sujuan Chen 2023-10-20  167  		ret = devm_request_irq(mdev->dev, hif2_irq, mt7996_irq_handler,
83eafc9251d6d3 Sujuan Chen 2023-10-20  168  				       IRQF_SHARED, KBUILD_MODNAME "-hif",
83eafc9251d6d3 Sujuan Chen 2023-10-20  169  				       dev);
98686cd21624c7 Shayne Chen 2022-11-22  170  		if (ret)
83eafc9251d6d3 Sujuan Chen 2023-10-20  171  			goto free_hif2_wed_irq_vector;
98686cd21624c7 Shayne Chen 2022-11-22  172  
98686cd21624c7 Shayne Chen 2022-11-22  173  		mt76_wr(dev, MT_INT1_MASK_CSR, 0);
98686cd21624c7 Shayne Chen 2022-11-22  174  		/* master switch of PCIe tnterrupt enable */
98686cd21624c7 Shayne Chen 2022-11-22  175  		mt76_wr(dev, MT_PCIE1_MAC_INT_ENABLE, 0xff);
98686cd21624c7 Shayne Chen 2022-11-22  176  	}
98686cd21624c7 Shayne Chen 2022-11-22  177  
98686cd21624c7 Shayne Chen 2022-11-22  178  	ret = mt7996_register_device(dev);
98686cd21624c7 Shayne Chen 2022-11-22  179  	if (ret)
98686cd21624c7 Shayne Chen 2022-11-22  180  		goto free_hif2_irq;
98686cd21624c7 Shayne Chen 2022-11-22  181  
98686cd21624c7 Shayne Chen 2022-11-22  182  	return 0;
98686cd21624c7 Shayne Chen 2022-11-22  183  
98686cd21624c7 Shayne Chen 2022-11-22  184  free_hif2_irq:
98686cd21624c7 Shayne Chen 2022-11-22  185  	if (dev->hif2)
83eafc9251d6d3 Sujuan Chen 2023-10-20 @186  		devm_free_irq(mdev->dev, hif2_irq, dev);
83eafc9251d6d3 Sujuan Chen 2023-10-20  187  free_hif2_wed_irq_vector:
83eafc9251d6d3 Sujuan Chen 2023-10-20  188  	if (dev->hif2) {
83eafc9251d6d3 Sujuan Chen 2023-10-20  189  		if (mtk_wed_device_active(&dev->mt76.mmio.wed_hif2))
83eafc9251d6d3 Sujuan Chen 2023-10-20  190  			mtk_wed_device_detach(&dev->mt76.mmio.wed_hif2);
83eafc9251d6d3 Sujuan Chen 2023-10-20  191  		else
98686cd21624c7 Shayne Chen 2022-11-22  192  			pci_free_irq_vectors(hif2_dev);
83eafc9251d6d3 Sujuan Chen 2023-10-20  193  	}
98686cd21624c7 Shayne Chen 2022-11-22  194  free_hif2:
98686cd21624c7 Shayne Chen 2022-11-22  195  	if (dev->hif2)
98686cd21624c7 Shayne Chen 2022-11-22  196  		put_device(dev->hif2->dev);
98686cd21624c7 Shayne Chen 2022-11-22  197  	devm_free_irq(mdev->dev, irq, dev);
83eafc9251d6d3 Sujuan Chen 2023-10-20  198  free_wed_or_irq_vector:
83eafc9251d6d3 Sujuan Chen 2023-10-20  199  	if (mtk_wed_device_active(&dev->mt76.mmio.wed))
83eafc9251d6d3 Sujuan Chen 2023-10-20  200  		mtk_wed_device_detach(&dev->mt76.mmio.wed);
83eafc9251d6d3 Sujuan Chen 2023-10-20  201  	else
98686cd21624c7 Shayne Chen 2022-11-22  202  		pci_free_irq_vectors(pdev);
98686cd21624c7 Shayne Chen 2022-11-22  203  free_device:
98686cd21624c7 Shayne Chen 2022-11-22  204  	mt76_free_device(&dev->mt76);
98686cd21624c7 Shayne Chen 2022-11-22  205  
98686cd21624c7 Shayne Chen 2022-11-22  206  	return ret;
98686cd21624c7 Shayne Chen 2022-11-22  207  }
98686cd21624c7 Shayne Chen 2022-11-22  208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
