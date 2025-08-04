Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A20B1C8621
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 06:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754289652; cv=none; b=StBNxXuWs4TNkvFnNVeF5VCPa2g6GbahXcZqe4H8S92/5XS2A7WKeVFPOf3+Eo6nTPcKlQC6b0szxyCvUXm0eSJNpWRgu1rpJ+iq7e99MoX2CYtJimYWancHJ9MxlLnaK0nxuhBbSBaUffB9yJyCBUi5L23pZe2I//ufu7DGT+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754289652; c=relaxed/simple;
	bh=qIjF8Y/vKNhDt471C+73Y93GqZIrTxI++Bu3k353bFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=obgeYeMx2EDgdnyr5BtXysp8ZGDHBL0agZSeFDgRzMkKyPldhR2RqzEKKFaiyJyEMoX1Pmvb7ZMgVoySkqZMdKdnZ8nYNX6i/HL0fB73AerHjLfVVB1YLDnqJGAEg4IQJpcqiZOS+qOihMDHh/zklFj7TeJ3dmd9YgozVoVzmFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ucbMDycE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ucbMDycE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b783ea502eso3034664f8f.1
        for <oe-kbuild@lists.linux.dev>; Sun, 03 Aug 2025 23:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754289648; x=1754894448; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVIbn7ZR65zyRM3GTpKmIoNFhedMLWBK6EPjF4+bxU0=;
        b=ucbMDycE43Zmnx0XOSAnkwxuUbnnI4BVv7jwq27l/HbTuoDpulQx0Yvnt3+izLd43C
         yfJoXCdI/uRIUC50N0tBigFXnESCPdb+5TSOFXOCO3v1ukls/Ih8qzsikti4skEgBYXe
         ooGTE2cC1gA4QkORBVnGLqFANAz+1zsLCwuIOZRpb71o2VNrsOEgFb8L3naqlJC+9lqz
         7qEd8FMOyiyETJraPrtTj032p3KUG/T2Q2NcT4vGWqiKnYW4lMKKjc17eBllDnnEHFHG
         kRvIGBAlT3+F8UX2FXQRF0/XtnFIKa0Ki4OK/iUU9EhqTSTTiufcy0mSjR3zdu4b2hqy
         gIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754289648; x=1754894448;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVIbn7ZR65zyRM3GTpKmIoNFhedMLWBK6EPjF4+bxU0=;
        b=XUZWp9Yevpqh1LVIDTLdwp0jupFJJiYdRHGi/OmiC5Sj3QfNKdCOHI/77mVi+PncaH
         oylu8efR/BX4QeNi9FJ0SB+1w4oV/YqZAgEC83yV37vIxLE2LuTyznsmSimMc9ojUArQ
         HI/0tZt4UyWiI+CaZUQVV8ROrHnmoV8PUKg5Z7OaoGa0T+T3qMB0iB3p9EQlY2YlAJNk
         hG3vTEOXJReoSA/ag20Wj5/tXr3yt2hTEVThJEIYs0LhdqHXKuzsYOXbmXTpHo+d80ys
         lKlFxct6KGu+0d1UYPWTPTe86OXM/Hd+l4R1ayA3v4zXtfXfWCTMPHFJpR6HlIeEH5c2
         TpZw==
X-Gm-Message-State: AOJu0Yye4OXFpCjQfFq4WB2KqgqIGP6a0S98w7guTWaI4ZyW5gzXuEAP
	SqTeic/WiLXMiDKBtv20pPuJrSx/6LBMa4eSaQtRUwpqlG5fyBYKldaapMknAHKPs0CiiHqxNI+
	DATym
X-Gm-Gg: ASbGncuhyOnyD8NSP/e68bNOp9+WbNlMrlxlRsm1T5iOzEpidsFqThI4vqvgYemvgmo
	lbjXZCVF4X9l9C89fypuhVKW3vjq+DAc1sfb/4fK6kfii/x7np2NTyh6hPVHj0N2+tR6dOe6CO7
	04sjA2AbU2v3B3/0ACHij4GkIaqd956q3a1D0UPznjApN5YW15LVejq7m0t/aV6DwXEld7f6eYd
	Il7nzR/iTGrpBK7uYyKpAqYYwXSJw+LL6tOt+3rRQBbh8XGrbjHVk9a0qzViK8qjZiUZLFU5aN7
	uaM2a+MzIUAVGI/qq/k5Gipu/0bVIn2LUEawXlwRtU/IRieLhjFQcUzTxju6t9LrpzapaElTp74
	7TrLN5mBfQypecCeBJ8ISjmB8W40=
X-Google-Smtp-Source: AGHT+IFR9276rf3QTLHYcBr+w9Z7564pM0jyOb4s9WoX2wk+RfaSORpQEylWUO63BmI8eG/H5G7BCA==
X-Received: by 2002:a05:6000:40db:b0:3b6:d0d:79c1 with SMTP id ffacd0b85a97d-3b79d4511a7mr11385075f8f.10.1754289648319;
        Sun, 03 Aug 2025 23:40:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee621adsm157314475e9.30.2025.08.03.23.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 23:40:47 -0700 (PDT)
Date: Mon, 4 Aug 2025 09:40:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Leon Romanovsky <leonro@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 20/26] drivers/pci/p2pdma.c:378
 pci_p2pdma_add_resource() error: uninitialized symbol 'mem'.
Message-ID: <f3fe4ecf-8532-4356-8c01-3166e79d4c21@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   f4212771ee1cf899f5ac8c9b6acd3bb7f49691fc
commit: 906b14c15e3d67c3aa9031bc3fee805343fb75c6 [20/26] PCI/P2PDMA: Refactor to separate core P2P functionality from memory allocation
config: x86_64-randconfig-161-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040847.0z9fDkel-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508040847.0z9fDkel-lkp@intel.com/

smatch warnings:
drivers/pci/p2pdma.c:378 pci_p2pdma_add_resource() error: uninitialized symbol 'mem'.
drivers/pci/p2pdma.c:391 pci_p2pdma_add_resource() error: we previously assumed 'p2pdma' could be null (see line 356)

vim +/mem +378 drivers/pci/p2pdma.c

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
                                                             ^^^^^^
Checked for NULL.

906b14c15e3d67 Leon Romanovsky   2025-07-16  357  		mem = pci_p2pdma_enable(pdev);

mem is uninitialized on else path.

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
                                                                         ^^^
Uninitialized.

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
                                                                                   ^^^^^^^^^^^^
Unchecked dereference.

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
                                                                         ^^^^^^^^^^^^

52916982af48d9 Logan Gunthorpe   2018-10-04  410  	return error;
52916982af48d9 Logan Gunthorpe   2018-10-04  411  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

