Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F34B20B22
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 00:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764290752; cv=none; b=LzMu3LIb14N5oWIpTnsiLisAo3+gD35CRmtJHA2GU3SaQiDQmsL8kViwjAuH/LXmpfvZLGJ6OxqfuhR7Mm0Gy0BiVlNo0FFNA1hruhYbqoYWFjeQElLiFWVHZKlZ3FvH4pWs78CUGjmTIZk3HOJAR4LWq3q3b31SfYVBfiLTjPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764290752; c=relaxed/simple;
	bh=WwlGa//W4uhfaEIlvvroOzbZZOlClKQhfawN5EBDus4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lc0nXKW+vxXLhSkd07CPp6vuCl+ZJM0KduamMo0Um0tzxxLhshOTwxsn7NaqHMlziwdfTswsL6QKVsfWDH8bGwYxClLPxx7mtgmDnlGSCPkrtyDIbYcxdEdwEabfIlgpBoEmhp9xOfp7z8KwL+3Uz88YZET3lXb2Zl4nn3EwJDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyBzmoXo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyBzmoXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764290750; x=1795826750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WwlGa//W4uhfaEIlvvroOzbZZOlClKQhfawN5EBDus4=;
  b=MyBzmoXoI4uUFU6Em1TAif0k6O+IUBPOFCMA77CrZkg1W53eVrSwl/Qx
   sR9CU/zMHJfHkKgyih0aktOATtUSSsVtCmYE5bOfPRtbzDFx7XWmJKaFM
   j6vWubNvWdUC28DgBjLvHf6lmFPztl2rhNC77syaNRGqSKy7pGRyYGrh7
   8XDiq1PeTm0fTrAZmzAEp+t7G95z3clAfWHLLj7GkDYm92TvlFL0lcQtU
   907Pl1XiCURj3/hs9e5GLsPRSQDzq7wf6d6hsX0KTYJcpIflKa7Yp7BiX
   E3R4pbx9KFi79wVe+o/ulGf7FXc8q9wUch8wd9BseiWKQsOaO0V71rne9
   g==;
X-CSE-ConnectionGUID: jOy9lmP3QqqAkHIOXEelyw==
X-CSE-MsgGUID: aiKZyCuNSpuUKen6wk7cig==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66220059"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66220059"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 16:45:48 -0800
X-CSE-ConnectionGUID: Rgn/kZMhQuGN/4lSlupuLg==
X-CSE-MsgGUID: OTdU9kVVRT2iXJxTUjXzXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193001051"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Nov 2025 16:45:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOmcK-000000005sr-3voP;
	Fri, 28 Nov 2025 00:45:44 +0000
Date: Fri, 28 Nov 2025 08:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [char-misc:char-misc-next 57/60]
 drivers/uio/uio_pci_generic_sva.c:32 uio_pci_sva_open() error: we previously
 assumed 'udev' could be null (see line 32)
Message-ID: <202511280815.WV9iCJZb-lkp@intel.com>
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
TO: Yaxing Guo <guoyaxing@bosc.ac.cn>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
head:   cbe1d77ed84ae9ab3355d61aca0c30d561a61d5a
commit: 3397c3cd859a2c51962ad032dcf97961d42f9db2 [57/60] uio: Add SVA support for PCI devices via uio_pci_generic_sva.c
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: x86_64-randconfig-161-20251128 (https://download.01.org/0day-ci/archive/20251128/202511280815.WV9iCJZb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/

smatch warnings:
drivers/uio/uio_pci_generic_sva.c:32 uio_pci_sva_open() error: we previously assumed 'udev' could be null (see line 32)
drivers/uio/uio_pci_generic_sva.c:54 uio_pci_sva_release() error: we previously assumed 'udev' could be null (see line 54)
drivers/uio/uio_pci_generic_sva.c:140 probe() warn: passing devm_ allocated variable to kfree. 'udev'

vim +/udev +32 drivers/uio/uio_pci_generic_sva.c

3397c3cd859a2c Yaxing Guo 2025-09-26   25  
3397c3cd859a2c Yaxing Guo 2025-09-26   26  static int uio_pci_sva_open(struct uio_info *info, struct inode *inode)
3397c3cd859a2c Yaxing Guo 2025-09-26   27  {
3397c3cd859a2c Yaxing Guo 2025-09-26   28  	struct iommu_sva *handle;
3397c3cd859a2c Yaxing Guo 2025-09-26   29  	struct uio_pci_sva_dev *udev = info->priv;
3397c3cd859a2c Yaxing Guo 2025-09-26   30  	struct iommu_domain *domain;
3397c3cd859a2c Yaxing Guo 2025-09-26   31  
3397c3cd859a2c Yaxing Guo 2025-09-26  @32  	if (!udev && !udev->pdev)
3397c3cd859a2c Yaxing Guo 2025-09-26   33  		return -ENODEV;
3397c3cd859a2c Yaxing Guo 2025-09-26   34  
3397c3cd859a2c Yaxing Guo 2025-09-26   35  	domain = iommu_get_domain_for_dev(&udev->pdev->dev);
3397c3cd859a2c Yaxing Guo 2025-09-26   36  	if (domain)
3397c3cd859a2c Yaxing Guo 2025-09-26   37  		iommu_detach_device(domain, &udev->pdev->dev);
3397c3cd859a2c Yaxing Guo 2025-09-26   38  
3397c3cd859a2c Yaxing Guo 2025-09-26   39  	handle = iommu_sva_bind_device(&udev->pdev->dev, current->mm);
3397c3cd859a2c Yaxing Guo 2025-09-26   40  	if (IS_ERR(handle))
3397c3cd859a2c Yaxing Guo 2025-09-26   41  		return -EINVAL;
3397c3cd859a2c Yaxing Guo 2025-09-26   42  
3397c3cd859a2c Yaxing Guo 2025-09-26   43  	udev->pasid = iommu_sva_get_pasid(handle);
3397c3cd859a2c Yaxing Guo 2025-09-26   44  
3397c3cd859a2c Yaxing Guo 2025-09-26   45  	udev->sva_handle = handle;
3397c3cd859a2c Yaxing Guo 2025-09-26   46  
3397c3cd859a2c Yaxing Guo 2025-09-26   47  	return 0;
3397c3cd859a2c Yaxing Guo 2025-09-26   48  }
3397c3cd859a2c Yaxing Guo 2025-09-26   49  
3397c3cd859a2c Yaxing Guo 2025-09-26   50  static int uio_pci_sva_release(struct uio_info *info, struct inode *inode)
3397c3cd859a2c Yaxing Guo 2025-09-26   51  {
3397c3cd859a2c Yaxing Guo 2025-09-26   52  	struct uio_pci_sva_dev *udev = info->priv;
3397c3cd859a2c Yaxing Guo 2025-09-26   53  
3397c3cd859a2c Yaxing Guo 2025-09-26  @54  	if (!udev && !udev->pdev)
3397c3cd859a2c Yaxing Guo 2025-09-26   55  		return -ENODEV;
3397c3cd859a2c Yaxing Guo 2025-09-26   56  
3397c3cd859a2c Yaxing Guo 2025-09-26   57  	iommu_sva_unbind_device(udev->sva_handle);
3397c3cd859a2c Yaxing Guo 2025-09-26   58  
3397c3cd859a2c Yaxing Guo 2025-09-26   59  	return 0;
3397c3cd859a2c Yaxing Guo 2025-09-26   60  }
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
