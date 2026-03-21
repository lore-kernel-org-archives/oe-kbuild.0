Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3444314F
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Mar 2026 00:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774053839; cv=none; b=taQqFm279hv564H1r/6bQirKkAH0RQGmeXyKpuKqsxrEJ8HEuONEs/3udjOzKpvZEyLMErdDk/cchwQYRu+bCULsi2NLZZNBJVkdFm5Gq9IOjLg4Ne8+VXEq9+xCyGzzouYKzMyrRCs5red3eV6gO0uj/bLMy/ABLLZmUwrX5DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774053839; c=relaxed/simple;
	bh=fcp3vc6O1qzMUVYSZyaJ0xFrKvQtcIHLLxnBIqAoSQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=utBoUSdb7qUojQG37FRZiBa5bBkUskeESJxQu/+gHYCbvj0eQiDuIpux0j/4nWIX/OKQoSfnu8YBmMQiML7Sor3JLGX/lqiXRuSHAehvwL/tAkBTq4EIMVKyVt/lPVQlcbhwBDqARiuE6pxBdzZFGIMYYo/41QJW6aXQOdcEHNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgkVDk/5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgkVDk/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774053837; x=1805589837;
  h=date:from:to:cc:subject:message-id;
  bh=fcp3vc6O1qzMUVYSZyaJ0xFrKvQtcIHLLxnBIqAoSQs=;
  b=dgkVDk/5icJ0jxiMhh+BLmZDv2BFqTSlaUF8Rh9Q4wn2tXrcKjZkMkZA
   ZqPgrHo4p7UB/sCFS/NFCmMMQzIauQAp4o5Dj/vFHcg3C4ybm16XPwSkv
   kyhu9FcoJC6JNdkApBVAyn+w6mykWErfkX7lyhkD/FFku606QgIRF+/ET
   1/gDvnmHXDcODsYsZzX+VzG0yqfiRmJnQI0gH+KS/s3ZfjVqpwCS3Itfr
   /CYUU8MTYkFQLiRG3JnxpenkhStTRjppUZrnMhbolGlHAZ2VgHMFX5vY0
   x4lewyOf4/lcbwtZlRfWxvrvL7OBIkFa0hOEQn/efBdLQKk55LvnQFgIa
   Q==;
X-CSE-ConnectionGUID: G5WqbdzITs6nHt91exSEaQ==
X-CSE-MsgGUID: NFed+eFdR3yHymMMqXhMFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74848462"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="74848462"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 17:43:57 -0700
X-CSE-ConnectionGUID: vuiOkOUfQRaQNlplu3gu/A==
X-CSE-MsgGUID: RqDmBZlXTWmM6bh0WLqtJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="222665636"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Mar 2026 17:43:52 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3kQZ-0000000006L-1ca8;
	Sat, 21 Mar 2026 00:43:12 +0000
Date: Sat, 21 Mar 2026 08:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/uio/uio_pci_generic_sva.c:140 probe() warn: passing
 devm_ allocated variable to kfree. 'udev'
Message-ID: <202603210811.1eXTfndx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yaxing Guo <guoyaxing@bosc.ac.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42bddab0563fe67882b2722620a66dd98c8dbf33
commit: 3397c3cd859a2c51962ad032dcf97961d42f9db2 uio: Add SVA support for PCI devices via uio_pci_generic_sva.c
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20260321 (https://download.01.org/0day-ci/archive/20260321/202603210811.1eXTfndx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603210811.1eXTfndx-lkp@intel.com/

New smatch warnings:
drivers/uio/uio_pci_generic_sva.c:140 probe() warn: passing devm_ allocated variable to kfree. 'udev'

Old smatch warnings:
drivers/uio/uio_pci_generic_sva.c:32 uio_pci_sva_open() error: we previously assumed 'udev' could be null (see line 32)
drivers/uio/uio_pci_generic_sva.c:54 uio_pci_sva_release() error: we previously assumed 'udev' could be null (see line 54)

vim +/udev +140 drivers/uio/uio_pci_generic_sva.c

3397c3cd859a2c Yaxing Guo 2025-09-26   61  
3397c3cd859a2c Yaxing Guo 2025-09-26   62  static int probe(struct pci_dev *pdev, const struct pci_device_id *id)
3397c3cd859a2c Yaxing Guo 2025-09-26   63  {
3397c3cd859a2c Yaxing Guo 2025-09-26   64  	struct uio_pci_sva_dev *udev;
3397c3cd859a2c Yaxing Guo 2025-09-26   65  	int ret, i, irq = 0;
3397c3cd859a2c Yaxing Guo 2025-09-26   66  
3397c3cd859a2c Yaxing Guo 2025-09-26   67  	ret = pci_enable_device(pdev);
3397c3cd859a2c Yaxing Guo 2025-09-26   68  	if (ret) {
3397c3cd859a2c Yaxing Guo 2025-09-26   69  		dev_err(&pdev->dev, "pci_enable_device failed: %d\n", ret);
3397c3cd859a2c Yaxing Guo 2025-09-26   70  		return ret;
3397c3cd859a2c Yaxing Guo 2025-09-26   71  	}
3397c3cd859a2c Yaxing Guo 2025-09-26   72  
3397c3cd859a2c Yaxing Guo 2025-09-26   73  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
3397c3cd859a2c Yaxing Guo 2025-09-26   74  	if (ret)
3397c3cd859a2c Yaxing Guo 2025-09-26   75  		goto out_disable;
3397c3cd859a2c Yaxing Guo 2025-09-26   76  
3397c3cd859a2c Yaxing Guo 2025-09-26   77  	pci_set_master(pdev);
3397c3cd859a2c Yaxing Guo 2025-09-26   78  
3397c3cd859a2c Yaxing Guo 2025-09-26   79  	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX | PCI_IRQ_MSI);
3397c3cd859a2c Yaxing Guo 2025-09-26   80  	if (ret > 0) {
3397c3cd859a2c Yaxing Guo 2025-09-26   81  		irq = pci_irq_vector(pdev, 0);
3397c3cd859a2c Yaxing Guo 2025-09-26   82  		if (irq < 0) {
3397c3cd859a2c Yaxing Guo 2025-09-26   83  			dev_err(&pdev->dev, "Failed to get MSI vector\n");
3397c3cd859a2c Yaxing Guo 2025-09-26   84  			ret = irq;
3397c3cd859a2c Yaxing Guo 2025-09-26   85  			goto out_disable;
3397c3cd859a2c Yaxing Guo 2025-09-26   86  		}
3397c3cd859a2c Yaxing Guo 2025-09-26   87  	} else
3397c3cd859a2c Yaxing Guo 2025-09-26   88  		dev_warn(&pdev->dev,
3397c3cd859a2c Yaxing Guo 2025-09-26   89  			 "No IRQ vectors available (%d), using polling\n", ret);
3397c3cd859a2c Yaxing Guo 2025-09-26   90  
3397c3cd859a2c Yaxing Guo 2025-09-26   91  	udev = devm_kzalloc(&pdev->dev, sizeof(struct uio_pci_sva_dev),
3397c3cd859a2c Yaxing Guo 2025-09-26   92  			    GFP_KERNEL);
3397c3cd859a2c Yaxing Guo 2025-09-26   93  	if (!udev) {
3397c3cd859a2c Yaxing Guo 2025-09-26   94  		ret =  -ENOMEM;
3397c3cd859a2c Yaxing Guo 2025-09-26   95  		goto out_disable;
3397c3cd859a2c Yaxing Guo 2025-09-26   96  	}
3397c3cd859a2c Yaxing Guo 2025-09-26   97  
3397c3cd859a2c Yaxing Guo 2025-09-26   98  	udev->pdev = pdev;
3397c3cd859a2c Yaxing Guo 2025-09-26   99  	udev->info.name = "uio_pci_sva";
3397c3cd859a2c Yaxing Guo 2025-09-26  100  	udev->info.version = "0.0.1";
3397c3cd859a2c Yaxing Guo 2025-09-26  101  	udev->info.open = uio_pci_sva_open;
3397c3cd859a2c Yaxing Guo 2025-09-26  102  	udev->info.release = uio_pci_sva_release;
3397c3cd859a2c Yaxing Guo 2025-09-26  103  	udev->info.irq = irq;
3397c3cd859a2c Yaxing Guo 2025-09-26  104  	udev->info.handler = irq_handler;
3397c3cd859a2c Yaxing Guo 2025-09-26  105  	udev->info.priv = udev;
3397c3cd859a2c Yaxing Guo 2025-09-26  106  
3397c3cd859a2c Yaxing Guo 2025-09-26  107  	for (i = 0; i < MAX_UIO_MAPS; i++) {
3397c3cd859a2c Yaxing Guo 2025-09-26  108  		struct resource *r = &pdev->resource[i];
3397c3cd859a2c Yaxing Guo 2025-09-26  109  		struct uio_mem *uiomem = &udev->info.mem[i];
3397c3cd859a2c Yaxing Guo 2025-09-26  110  
3397c3cd859a2c Yaxing Guo 2025-09-26  111  		if (r->flags != (IORESOURCE_SIZEALIGN | IORESOURCE_MEM))
3397c3cd859a2c Yaxing Guo 2025-09-26  112  			continue;
3397c3cd859a2c Yaxing Guo 2025-09-26  113  
3397c3cd859a2c Yaxing Guo 2025-09-26  114  		if (uiomem >= &udev->info.mem[MAX_UIO_MAPS]) {
3397c3cd859a2c Yaxing Guo 2025-09-26  115  			dev_warn(&pdev->dev, "Do not support more than %d iomem\n",
3397c3cd859a2c Yaxing Guo 2025-09-26  116  				 MAX_UIO_MAPS);
3397c3cd859a2c Yaxing Guo 2025-09-26  117  			break;
3397c3cd859a2c Yaxing Guo 2025-09-26  118  		}
3397c3cd859a2c Yaxing Guo 2025-09-26  119  
3397c3cd859a2c Yaxing Guo 2025-09-26  120  		uiomem->memtype = UIO_MEM_PHYS;
3397c3cd859a2c Yaxing Guo 2025-09-26  121  		uiomem->addr = r->start & PAGE_MASK;
3397c3cd859a2c Yaxing Guo 2025-09-26  122  		uiomem->offs = r->start & ~PAGE_MASK;
3397c3cd859a2c Yaxing Guo 2025-09-26  123  		uiomem->size =
3397c3cd859a2c Yaxing Guo 2025-09-26  124  			(uiomem->offs + resource_size(r) + PAGE_SIZE - 1) &
3397c3cd859a2c Yaxing Guo 2025-09-26  125  			PAGE_MASK;
3397c3cd859a2c Yaxing Guo 2025-09-26  126  		uiomem->name = r->name;
3397c3cd859a2c Yaxing Guo 2025-09-26  127  	}
3397c3cd859a2c Yaxing Guo 2025-09-26  128  
3397c3cd859a2c Yaxing Guo 2025-09-26  129  	ret = devm_uio_register_device(&pdev->dev, &udev->info);
3397c3cd859a2c Yaxing Guo 2025-09-26  130  	if (ret) {
3397c3cd859a2c Yaxing Guo 2025-09-26  131  		dev_err(&pdev->dev, "Failed to register uio device\n");
3397c3cd859a2c Yaxing Guo 2025-09-26  132  		goto out_free;
3397c3cd859a2c Yaxing Guo 2025-09-26  133  	}
3397c3cd859a2c Yaxing Guo 2025-09-26  134  
3397c3cd859a2c Yaxing Guo 2025-09-26  135  	pci_set_drvdata(pdev, udev);
3397c3cd859a2c Yaxing Guo 2025-09-26  136  
3397c3cd859a2c Yaxing Guo 2025-09-26  137  	return 0;
3397c3cd859a2c Yaxing Guo 2025-09-26  138  
3397c3cd859a2c Yaxing Guo 2025-09-26  139  out_free:
3397c3cd859a2c Yaxing Guo 2025-09-26 @140  	kfree(udev);
3397c3cd859a2c Yaxing Guo 2025-09-26  141  out_disable:
3397c3cd859a2c Yaxing Guo 2025-09-26  142  	pci_disable_device(pdev);
3397c3cd859a2c Yaxing Guo 2025-09-26  143  
3397c3cd859a2c Yaxing Guo 2025-09-26  144  	return ret;
3397c3cd859a2c Yaxing Guo 2025-09-26  145  }
3397c3cd859a2c Yaxing Guo 2025-09-26  146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
