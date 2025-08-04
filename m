Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0AA4C8F
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 00:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754268464; cv=none; b=KavL6S8YCdxovtueObeibkQtzN6cK19yFQbo1tKsXI9VexAeFxXe9mB9kEaY9DwH1FGd671jf8VM/TsFqv4VskLoPjjIntscpnovA8gxTwfMTIanG4kAKoFFkCFueQCylE3hCBxBLaUEn2xj7TDykWV1yWHMNbQxJvvohRoreG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754268464; c=relaxed/simple;
	bh=G3Oq6hcg2prcWZILW7bs0zewGhDriVRhGrHWAZaHqNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nf2cbmKQbP6tHLJg49ij0OTfy5c6yPAPTwZwCu39RQIPkLdC5Ode9+Nwz3quiWAuiguvmkyQVnRE/ZzU3OL68viywNrfMZ4HAKppYdfF8uS48/D3fbLZ6+nGFQ2lpxNG4hFWOCavNj01cPKkKNFDOurxpmU7s6wtF75bmQxEKV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOqHmTWy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOqHmTWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754268462; x=1785804462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G3Oq6hcg2prcWZILW7bs0zewGhDriVRhGrHWAZaHqNU=;
  b=WOqHmTWyXNV+ohNlXyp26MnexkxP/YxzqBdC1pSqspY5XwnpRavQ9Rf+
   3Vi4cHIm/drh6wUETQUUIxhjWwOgkJbtpQinZ/zpKC0g1IRxMRsyQm7YN
   QRmfgYjttvM/k3bLPHexVTeGQU9JvSDrpQRvTLQT4J5V0F/v7CGINWxOl
   u0txBgr4+dQSlm4SabnbpZvClUx9H0JeB5nCJGoUidtnf2Xn9/Pa0hh9s
   eJ9PLFWmA3GLCY7YtQZ5Xr1T1Wfmtd6Wpwhk7kfHVs5Xn6hgf1I/NF8vX
   WFNapI6bPkCJQoZQrCIGnGMAgIxy2Qg2hLrVfmNRLVA/VX+nMlbn2XPWp
   Q==;
X-CSE-ConnectionGUID: RKrxNu6lRL+AnkGckI8j3g==
X-CSE-MsgGUID: 0VL9iZEcQ2O9tb0BTh6QVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56606519"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56606519"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 17:47:41 -0700
X-CSE-ConnectionGUID: cYrWHxHeSM+BR8e2+rndDQ==
X-CSE-MsgGUID: aqO4TD71SCOIoedLUyJ0/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="187714223"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Aug 2025 17:47:39 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uijMX-0006hk-32;
	Mon, 04 Aug 2025 00:47:37 +0000
Date: Mon, 4 Aug 2025 08:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [leon-rdma:dmabuf-vfio 20/26] drivers/pci/p2pdma.c:378
 pci_p2pdma_add_resource() error: uninitialized symbol 'mem'.
Message-ID: <202508040847.0z9fDkel-lkp@intel.com>
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
TO: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   f4212771ee1cf899f5ac8c9b6acd3bb7f49691fc
commit: 906b14c15e3d67c3aa9031bc3fee805343fb75c6 [20/26] PCI/P2PDMA: Refactor to separate core P2P functionality from memory allocation
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-161-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040847.0z9fDkel-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508040847.0z9fDkel-lkp@intel.com/

smatch warnings:
drivers/pci/p2pdma.c:378 pci_p2pdma_add_resource() error: uninitialized symbol 'mem'.
drivers/pci/p2pdma.c:391 pci_p2pdma_add_resource() error: we previously assumed 'p2pdma' could be null (see line 356)

vim +/mem +378 drivers/pci/p2pdma.c

7e9c7ef83d7852 Logan Gunthorpe   2022-10-21  322  
52916982af48d9 Logan Gunthorpe   2018-10-04  323  /**
52916982af48d9 Logan Gunthorpe   2018-10-04  324   * pci_p2pdma_add_resource - add memory for use as p2p memory
52916982af48d9 Logan Gunthorpe   2018-10-04  325   * @pdev: the device to add the memory to
52916982af48d9 Logan Gunthorpe   2018-10-04  326   * @bar: PCI BAR to add
52916982af48d9 Logan Gunthorpe   2018-10-04  327   * @size: size of the memory to add, may be zero to use the whole BAR
52916982af48d9 Logan Gunthorpe   2018-10-04  328   * @offset: offset into the PCI BAR
52916982af48d9 Logan Gunthorpe   2018-10-04  329   *
52916982af48d9 Logan Gunthorpe   2018-10-04  330   * The memory will be given ZONE_DEVICE struct pages so that it may
52916982af48d9 Logan Gunthorpe   2018-10-04  331   * be used with any DMA request.
52916982af48d9 Logan Gunthorpe   2018-10-04  332   */
52916982af48d9 Logan Gunthorpe   2018-10-04  333  int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
52916982af48d9 Logan Gunthorpe   2018-10-04  334  			    u64 offset)
52916982af48d9 Logan Gunthorpe   2018-10-04  335  {
a6e6fe6549f609 Logan Gunthorpe   2019-08-12  336  	struct pci_p2pdma_pagemap *p2p_pgmap;
906b14c15e3d67 Leon Romanovsky   2025-07-16  337  	struct p2pdma_provider *mem;
52916982af48d9 Logan Gunthorpe   2018-10-04  338  	struct dev_pagemap *pgmap;
ae21f835a5bda0 Eric Dumazet      2021-07-01  339  	struct pci_p2pdma *p2pdma;
52916982af48d9 Logan Gunthorpe   2018-10-04  340  	void *addr;
52916982af48d9 Logan Gunthorpe   2018-10-04  341  	int error;
52916982af48d9 Logan Gunthorpe   2018-10-04  342  
52916982af48d9 Logan Gunthorpe   2018-10-04  343  	if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
52916982af48d9 Logan Gunthorpe   2018-10-04  344  		return -EINVAL;
52916982af48d9 Logan Gunthorpe   2018-10-04  345  
52916982af48d9 Logan Gunthorpe   2018-10-04  346  	if (offset >= pci_resource_len(pdev, bar))
52916982af48d9 Logan Gunthorpe   2018-10-04  347  		return -EINVAL;
52916982af48d9 Logan Gunthorpe   2018-10-04  348  
52916982af48d9 Logan Gunthorpe   2018-10-04  349  	if (!size)
52916982af48d9 Logan Gunthorpe   2018-10-04  350  		size = pci_resource_len(pdev, bar) - offset;
52916982af48d9 Logan Gunthorpe   2018-10-04  351  
52916982af48d9 Logan Gunthorpe   2018-10-04  352  	if (size + offset > pci_resource_len(pdev, bar))
52916982af48d9 Logan Gunthorpe   2018-10-04  353  		return -EINVAL;
52916982af48d9 Logan Gunthorpe   2018-10-04  354  
906b14c15e3d67 Leon Romanovsky   2025-07-16  355  	p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
906b14c15e3d67 Leon Romanovsky   2025-07-16 @356  	if (!p2pdma) {
906b14c15e3d67 Leon Romanovsky   2025-07-16  357  		mem = pci_p2pdma_enable(pdev);
906b14c15e3d67 Leon Romanovsky   2025-07-16  358  		if (IS_ERR(mem))
906b14c15e3d67 Leon Romanovsky   2025-07-16  359  			return PTR_ERR(mem);
906b14c15e3d67 Leon Romanovsky   2025-07-16  360  
906b14c15e3d67 Leon Romanovsky   2025-07-16  361  		error = pci_p2pdma_setup_pool(pdev);
52916982af48d9 Logan Gunthorpe   2018-10-04  362  		if (error)
52916982af48d9 Logan Gunthorpe   2018-10-04  363  			return error;
52916982af48d9 Logan Gunthorpe   2018-10-04  364  	}
52916982af48d9 Logan Gunthorpe   2018-10-04  365  
a6e6fe6549f609 Logan Gunthorpe   2019-08-12  366  	p2p_pgmap = devm_kzalloc(&pdev->dev, sizeof(*p2p_pgmap), GFP_KERNEL);
906b14c15e3d67 Leon Romanovsky   2025-07-16  367  	if (!p2p_pgmap) {
906b14c15e3d67 Leon Romanovsky   2025-07-16  368  		error = -ENOMEM;
906b14c15e3d67 Leon Romanovsky   2025-07-16  369  		goto free_pool;
906b14c15e3d67 Leon Romanovsky   2025-07-16  370  	}
a6e6fe6549f609 Logan Gunthorpe   2019-08-12  371  
a6e6fe6549f609 Logan Gunthorpe   2019-08-12  372  	pgmap = &p2p_pgmap->pgmap;
a4574f63edc6f7 Dan Williams      2020-10-13  373  	pgmap->range.start = pci_resource_start(pdev, bar) + offset;
a4574f63edc6f7 Dan Williams      2020-10-13  374  	pgmap->range.end = pgmap->range.start + size - 1;
b7b3c01b191596 Dan Williams      2020-10-13  375  	pgmap->nr_range = 1;
52916982af48d9 Logan Gunthorpe   2018-10-04  376  	pgmap->type = MEMORY_DEVICE_PCI_P2PDMA;
7e9c7ef83d7852 Logan Gunthorpe   2022-10-21  377  	pgmap->ops = &p2pdma_pgmap_ops;
906b14c15e3d67 Leon Romanovsky   2025-07-16 @378  	p2p_pgmap->mem = mem;
52916982af48d9 Logan Gunthorpe   2018-10-04  379  
52916982af48d9 Logan Gunthorpe   2018-10-04  380  	addr = devm_memremap_pages(&pdev->dev, pgmap);
52916982af48d9 Logan Gunthorpe   2018-10-04  381  	if (IS_ERR(addr)) {
52916982af48d9 Logan Gunthorpe   2018-10-04  382  		error = PTR_ERR(addr);
50f44ee7248ad2 Dan Williams      2019-06-13  383  		goto pgmap_free;
52916982af48d9 Logan Gunthorpe   2018-10-04  384  	}
52916982af48d9 Logan Gunthorpe   2018-10-04  385  
7e9c7ef83d7852 Logan Gunthorpe   2022-10-21  386  	error = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_unmap_mappings,
f3c373972cd38e Leon Romanovsky   2025-07-07  387  					 p2p_pgmap);
7e9c7ef83d7852 Logan Gunthorpe   2022-10-21  388  	if (error)
7e9c7ef83d7852 Logan Gunthorpe   2022-10-21  389  		goto pages_free;
7e9c7ef83d7852 Logan Gunthorpe   2022-10-21  390  
ae21f835a5bda0 Eric Dumazet      2021-07-01 @391  	error = gen_pool_add_owner(p2pdma->pool, (unsigned long)addr,
52916982af48d9 Logan Gunthorpe   2018-10-04  392  			pci_bus_address(pdev, bar) + offset,
a4574f63edc6f7 Dan Williams      2020-10-13  393  			range_len(&pgmap->range), dev_to_node(&pdev->dev),
b80892ca022e9e Christoph Hellwig 2021-10-28  394  			&pgmap->ref);
52916982af48d9 Logan Gunthorpe   2018-10-04  395  	if (error)
e615a191216e3f Dan Williams      2019-06-13  396  		goto pages_free;
52916982af48d9 Logan Gunthorpe   2018-10-04  397  
a4574f63edc6f7 Dan Williams      2020-10-13  398  	pci_info(pdev, "added peer-to-peer DMA memory %#llx-%#llx\n",
a4574f63edc6f7 Dan Williams      2020-10-13  399  		 pgmap->range.start, pgmap->range.end);
52916982af48d9 Logan Gunthorpe   2018-10-04  400  
52916982af48d9 Logan Gunthorpe   2018-10-04  401  	return 0;
52916982af48d9 Logan Gunthorpe   2018-10-04  402  
e615a191216e3f Dan Williams      2019-06-13  403  pages_free:
e615a191216e3f Dan Williams      2019-06-13  404  	devm_memunmap_pages(&pdev->dev, pgmap);
52916982af48d9 Logan Gunthorpe   2018-10-04  405  pgmap_free:
906b14c15e3d67 Leon Romanovsky   2025-07-16  406  	devm_kfree(&pdev->dev, p2p_pgmap);
906b14c15e3d67 Leon Romanovsky   2025-07-16  407  free_pool:
906b14c15e3d67 Leon Romanovsky   2025-07-16  408  	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
906b14c15e3d67 Leon Romanovsky   2025-07-16  409  	gen_pool_destroy(p2pdma->pool);
52916982af48d9 Logan Gunthorpe   2018-10-04  410  	return error;
52916982af48d9 Logan Gunthorpe   2018-10-04  411  }
52916982af48d9 Logan Gunthorpe   2018-10-04  412  EXPORT_SYMBOL_GPL(pci_p2pdma_add_resource);
52916982af48d9 Logan Gunthorpe   2018-10-04  413  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
