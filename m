Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEE517E
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jun 2025 00:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751155947; cv=none; b=Z63sVgT8UvtY4H+7dpR1jwMzVKA08FJKksYM9U65IsLci5frPfLrd5lxr9qQRpNR4oXfVDTLoKXuckWl203kJw1IPg7Zzvim0tD+7GvLNeYJOXTAgeKZdnMoLDXHJPTB8Vxtxy7HucjP/ohARdQZ+XEcuUvdfVQDbOkkJ4UZKgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751155947; c=relaxed/simple;
	bh=YKjJHNIthG+OdxvhVj2Gc8xXtTErxjV0KJg/NbDy3mE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qKsjZUrTfFuJA2ql9Pu0uPkW0RbswiOEUZEo/siXTCsSEb3vsesNERpPXCP9F7LROW7XDRfagT7Gt9eM+H91MMDrfCWOS+twmJ3icS8okZjM+58Vb3pBO294C/GdqGlyMnD/HacyvFBgA62uyu1sqW2On+fLYSEYZV3mrI6pu4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWbExI95; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWbExI95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751155946; x=1782691946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YKjJHNIthG+OdxvhVj2Gc8xXtTErxjV0KJg/NbDy3mE=;
  b=mWbExI95t+rJHoKLJ9IKBFQ7QwGH07psxiALWOTfFrdrvaio5wJMjIN0
   3s/NdG4AxLDfMR6JRTzcSlA4dKEIO82UfbvLDaH8ovZ2Eo1R3JtM8QSnj
   5p5c0R1SPdhLO0cERpBGe3JQzsOaJ/Er/n5DZ9OHqSChX55s46bf+BUsK
   N733d3zWpHrrOjq5mB+QDtMWGRxodoDe8NZTPX0C0+BqoJcjhqYTh//bo
   oY1PepaAUlcg24JpBXJVAJYxsdinpeEKoVbP5pMMBKNhNd+kxLBdQzs9O
   vzt9HZpVZVYIjKveu6lSQXHJdl925V1qFTvuoWRyI7kioRBZ2o2+GxJQG
   Q==;
X-CSE-ConnectionGUID: okG5vJM8Tqyp1TymBWS2Xg==
X-CSE-MsgGUID: vcL4sMHYSkGxJSuiMNVs0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53575567"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="53575567"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 17:12:25 -0700
X-CSE-ConnectionGUID: +Ea+6Mb8R3uSXPKd76U4gg==
X-CSE-MsgGUID: v45rx0SuTgClmpnmtXsOGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="158834957"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Jun 2025 17:12:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVfee-000XVq-2h;
	Sun, 29 Jun 2025 00:12:20 +0000
Date: Sun, 29 Jun 2025 08:11:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <202506290711.T0HOr5wS-lkp@intel.com>
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
In-Reply-To: <20250623153931.158765-4-benjamin.gaignard@collabora.com>
References: <20250623153931.158765-4-benjamin.gaignard@collabora.com>
TO: Benjamin Gaignard <benjamin.gaignard@collabora.com>
TO: joro@8bytes.org
TO: will@kernel.org
TO: robin.murphy@arm.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: heiko@sntech.de
TO: nicolas.dufresne@collabora.com
TO: jgg@ziepe.ca
CC: iommu@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: kernel@collabora.com
CC: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rockchip/for-next arm64/for-next/core linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-vendor-prefixes-Add-Verisilicon/20250623-234734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250623153931.158765-4-benjamin.gaignard%40collabora.com
patch subject: [PATCH v4 3/5] iommu: Add verisilicon IOMMU driver
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: alpha-randconfig-r073-20250627 (https://download.01.org/0day-ci/archive/20250629/202506290711.T0HOr5wS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506290711.T0HOr5wS-lkp@intel.com/

smatch warnings:
drivers/iommu/vsi-iommu.c:657 vsi_iommu_probe() error: uninitialized symbol 'err'.

vim +/err +657 drivers/iommu/vsi-iommu.c

15ea72d5401fb7 Benjamin Gaignard 2025-06-23  638  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  639  static int vsi_iommu_probe(struct platform_device *pdev)
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  640  {
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  641  	struct device *dev = &pdev->dev;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  642  	struct vsi_iommu *iommu;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  643  	int err;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  644  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  645  	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  646  	if (!iommu)
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  647  		return -ENOMEM;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  648  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  649  	iommu->dev = dev;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  650  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  651  	iommu->regs = devm_platform_ioremap_resource(pdev, 0);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  652  	if (IS_ERR(iommu->regs))
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  653  		return -ENOMEM;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  654  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  655  	iommu->num_clocks = devm_clk_bulk_get_all(dev, &iommu->clocks);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  656  	if  (iommu->num_clocks < 0)
15ea72d5401fb7 Benjamin Gaignard 2025-06-23 @657  		return err;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  658  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  659  	err = clk_bulk_prepare(iommu->num_clocks, iommu->clocks);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  660  	if (err)
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  661  		return err;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  662  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  663  	iommu->irq = platform_get_irq(pdev, 0);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  664  	if (iommu->irq < 0)
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  665  		return iommu->irq;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  666  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  667  	err = devm_request_irq(iommu->dev, iommu->irq, vsi_iommu_irq,
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  668  			       IRQF_SHARED, dev_name(dev), iommu);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  669  	if (err)
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  670  		goto err_unprepare_clocks;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  671  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  672  	spin_lock_init(&iommu->lock);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  673  	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  674  	platform_set_drvdata(pdev, iommu);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  675  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  676  	pm_runtime_set_autosuspend_delay(dev, 100);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  677  	pm_runtime_use_autosuspend(dev);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  678  	pm_runtime_enable(dev);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  679  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  680  	err = iommu_device_sysfs_add(&iommu->iommu, dev, NULL, dev_name(dev));
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  681  	if (err)
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  682  		goto err_runtime_disable;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  683  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  684  	err = iommu_device_register(&iommu->iommu, &vsi_iommu_ops, dev);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  685  	if (err)
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  686  		goto err_remove_sysfs;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  687  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  688  	return 0;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  689  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  690  err_remove_sysfs:
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  691  	iommu_device_sysfs_remove(&iommu->iommu);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  692  err_runtime_disable:
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  693  	pm_runtime_disable(dev);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  694  err_unprepare_clocks:
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  695  	clk_bulk_unprepare(iommu->num_clocks, iommu->clocks);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  696  	return err;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  697  }
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  698  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
