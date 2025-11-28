Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA2654654
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 05:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764308190; cv=none; b=vD5KrUyxFQzen6f7FzowRE97sjoUKIiuoZDOVME+2EBqpLMDvJYYxf4bzW2jmRRv/zT+AUS0RgiNGNU25742ORDoCSYCQB2Zkc0Tex1EVJ9tzQ5niI0wXVJuwwo7BN/medYCblmwZSvP2cK2XrAJUG3p0NzncMylCZi0Z2beHjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764308190; c=relaxed/simple;
	bh=8wiEBHJ4+x7E3lJinDLCE623bdMU6dsmaIPqIuHtVcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YNHvtOfApWh1oZ8jhlPILWVRNLiAGVkZt2zXttkM6e6nLyjEiu34NHBzuqSEcWnaABP2lIcpss/dpE7yj1fSGw1XtCqmk1bTavTA//dSadOlzviakGB/8lul7ZpPiw6JOrabQ5OKspy9X961lYspP/5ecVp4eIFXpKdD+lExljQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LbSG70LS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LbSG70LS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3c965df5so857236f8f.1
        for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 21:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764308187; x=1764912987; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BwgPmPmCAS9dDYWOHGZSPcfUCqw6dFNzwxvE8Ydh1U=;
        b=LbSG70LSNdQrsX6N1GFVvVLo4W84eNLNUoGNo1hZlxKwTDFjKOGXTx5s0AFvlEiI49
         MLwlOSuWo9aj4byhqjstwars+xUD5vBNrYU5y3CHdKeUfB5C920d2yNa442cD0f9jjUb
         LUSGwicXZx+2a6pLNhIz29qTvWXWB5qXvQLwkDqsXHngLEsS/X6vMZ9x5jEYVLaGiJU2
         OTJo7eM9aS6XKO+eiiUn7tESw6DqXN2b6V5ExJZawejryjXZs9GNn3Pk66VkgCv6GAEL
         CTyQXjlwdUfK9bVU9Wpa4bi8ZoXo33UaeZEKsU+oBLb5pebC5qkeXn1i2dndxAiqKNRd
         ZzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764308187; x=1764912987;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BwgPmPmCAS9dDYWOHGZSPcfUCqw6dFNzwxvE8Ydh1U=;
        b=SVM71uePWRY3ZX7aCClr5ur7up0dKnEl70zeJ206rl3y0AQM6SHJIT2GNY000YYPsD
         rq4uGJy8gJH6UO4dIs8p0nxS2XuA1/Vph0+9YNVYxTs+Yj49svMr9W10GEoAxNSnAr34
         XQ5nYkuX2+F+81v3IzAW3qA+wDR+C79y88lxuRFcYgMUyFJ+8TlZVt9h9aSeBQrIVYsq
         tbtqWeE9X+XuF9MaKBL+NUO95D88qh4UyBu9pLphFR1wwj/5tWREjM9ZllYStb49Bfzb
         vx4YeJM2eT3wCOd2+MUV+8Jp95iGTJJ48qSFziVtWYVl+XSQLH3B3CRNQm7rg0OFklFL
         uKLQ==
X-Gm-Message-State: AOJu0YweXQL0TC1GFs1QUFP6d03i6M9D6sU+isgdpZNJfmssk5DJk39t
	DkOHGbfZ4S4IcqkESuU2MxIxRgAbKF5xxPj9XDb46g+gbXNDWdjJBnKa/V5IhgzocJ/gwS/bI4+
	BCtL1
X-Gm-Gg: ASbGncvQbThGZPI+dn7P2dbeGasjjzJuYPENDqgRkzN+At444G1MbsfvIds3sblrzEb
	9WBA9q5b/Zs4AxUP/CeHhnNZhgEe0brNXobdsIVfC/AEwr8W5JbCLNhcJ861i/0R8a5wLEGfYiJ
	2Sii86f58urh25v31IpZG/KOD3BSMb2KGj17cP6kedwXs84DFNteB86WXKrlyN1CMVED5rRzUIe
	lJw1L65GISV4xgYiPmVUnp1ByuMiABQDR7xINV6Zw8Z6uJ4NsjkRCEh3dG5vfV9TqTPZ6rak/w8
	E2YlCvtE731gfK3DmgDp5fXP3wOC4ic+kKMJLEHj5aCBtUOFSwt0pSkWHha26swBm74XWdakube
	Z+RE6llwcaqcI/RljuDaMT1BPOkbEbs4znaMhsdSSY7RLaa6K8/4u3GSctebj5lP5MJkGI+DrX0
	X9KgHkKBuJ0eQ/o4MzqNKAUzKFhOE=
X-Google-Smtp-Source: AGHT+IF9jpVKYfnJgUxyB9biyy78MmFLMzsKhgcXrK+i7aGcbHxcOkBKZg0VNhGPcSuEsTZ1PFAJHQ==
X-Received: by 2002:a05:6000:2288:b0:429:66bf:1463 with SMTP id ffacd0b85a97d-42e0f34fb80mr14113962f8f.44.1764308186777;
        Thu, 27 Nov 2025 21:36:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5d618csm7388957f8f.14.2025.11.27.21.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 21:36:26 -0800 (PST)
Date: Fri, 28 Nov 2025 08:36:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yaxing Guo <guoyaxing@bosc.ac.cn>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Message-ID: <20251128053622.2YksKqusTZyko1yItwieR0mi8W_BW4zXIDTg-qgN6Ps@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
head:   cbe1d77ed84ae9ab3355d61aca0c30d561a61d5a
commit: 3397c3cd859a2c51962ad032dcf97961d42f9db2 [57/60] uio: Add SVA support for PCI devices via uio_pci_generic_sva.c
config: x86_64-randconfig-161-20251128 (https://download.01.org/0day-ci/archive/20251128/202511280815.WV9iCJZb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/

smatch warnings:
drivers/uio/uio_pci_generic_sva.c:32 uio_pci_sva_open() error: we previously assumed 'udev' could be null (see line 32)
drivers/uio/uio_pci_generic_sva.c:54 uio_pci_sva_release() error: we previously assumed 'udev' could be null (see line 54)
drivers/uio/uio_pci_generic_sva.c:140 probe() warn: passing devm_ allocated variable to kfree. 'udev'

vim +/udev +32 drivers/uio/uio_pci_generic_sva.c

3397c3cd859a2c Yaxing Guo 2025-09-26   26  static int uio_pci_sva_open(struct uio_info *info, struct inode *inode)
3397c3cd859a2c Yaxing Guo 2025-09-26   27  {
3397c3cd859a2c Yaxing Guo 2025-09-26   28  	struct iommu_sva *handle;
3397c3cd859a2c Yaxing Guo 2025-09-26   29  	struct uio_pci_sva_dev *udev = info->priv;
3397c3cd859a2c Yaxing Guo 2025-09-26   30  	struct iommu_domain *domain;
3397c3cd859a2c Yaxing Guo 2025-09-26   31  
3397c3cd859a2c Yaxing Guo 2025-09-26  @32  	if (!udev && !udev->pdev)

The && should be ||.

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

Same.

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
                                                ^^^^^^^^^^^^^^^^^^^
devm_

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
                                                ^^^^^^^^^^^
Delete this.  It's a double free.

3397c3cd859a2c Yaxing Guo 2025-09-26  141  out_disable:
3397c3cd859a2c Yaxing Guo 2025-09-26  142  	pci_disable_device(pdev);
3397c3cd859a2c Yaxing Guo 2025-09-26  143  
3397c3cd859a2c Yaxing Guo 2025-09-26  144  	return ret;
3397c3cd859a2c Yaxing Guo 2025-09-26  145  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

