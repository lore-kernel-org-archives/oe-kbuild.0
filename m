Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EC48F44
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 02:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707101353; cv=none; b=c45y9bCH8NW1W52bRvqtJ1BxQOHB+I/jIYZV7t1JPAren5c/E/8qMz4F5siXXFZFHoH5clsqJ0uiZq+mSc1n7/Zr8aPGGh3AB2OfuJJAm2Cz/p+XlxNRI0I4/HryiLJ5XGKnQhUPsIa18tIdE6HSMT1XIBoZOm6Q7LAFPj+qb7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707101353; c=relaxed/simple;
	bh=3GP4mU5Mww16oyu13ROuo/F2320/WRgg0IiuKcaMBBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cn+mqrvTrN1ujXFdMzse/GiYYwz+dAcQp+ene1XNaAuo5GQTLRjdCMCE6kiyjngemLqpn2kO06yI0JP/Z9/WHgYTGfk8M8nGFQG4WWEAniHFNKssa2UT5E22HWCQie9mfgtFR2fgLVgWEtPPfSBFr/TOQdGgJTsGQJ2KXwEP70k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=co5mIvaH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="co5mIvaH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707101352; x=1738637352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3GP4mU5Mww16oyu13ROuo/F2320/WRgg0IiuKcaMBBk=;
  b=co5mIvaHsXDf/v9l5giilcBISFt1cRRxy4Hn/H3bCMMjc/P7HFMvL66+
   i+MYceAkBRaY7KWhvfnwebauPYRiwYF3og0ZUKcymiZVqBfHbZUCUOz6m
   ab1vMGkAoZt2Rt4iXbAV7tG1kJTDV56TE8JeKuTWD5zQt5U6paqFdT8Z3
   2BVWNTw+qUpUkn6UvlaIkyPD23kKZArV092tEF0G9eqhCuky1+3DHVR4W
   +OMu1q5dh1N3xyVfVfULvzXi2V0p4XzPkKEiMVLpU6ieuWxzCtC/PSwYB
   F4kBfYnj4Nyvi/fWpdqTBy1wYBvTq/uQ786hD0EzCundSx7iNbDz4C07s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="689848"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="689848"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 18:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5221201"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Feb 2024 18:49:10 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWp2h-00005W-1G;
	Mon, 05 Feb 2024 02:49:07 +0000
Date: Mon, 5 Feb 2024 10:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cip:linux-6.1.y-cip-rt-rebase 30/208]
 drivers/usb/host/xhci-plat.c:378 xhci_generic_plat_probe() error: we
 previously assumed 'sysdev' could be null (see line 368)
Message-ID: <202402051022.79SV50bg-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>
CC: Pavel Machek <pavel@ucw.cz>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rt-rebase
head:   c3f80d7eeb70a51f6e05a5ca8424af3780072f29
commit: e60d31e628503adf7418431d64d198d700748550 [30/208] xhci: split out rcar/rz support from xhci-plat.c
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20240205 (https://download.01.org/0day-ci/archive/20240205/202402051022.79SV50bg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402051022.79SV50bg-lkp@intel.com/

New smatch warnings:
drivers/usb/host/xhci-plat.c:378 xhci_generic_plat_probe() error: we previously assumed 'sysdev' could be null (see line 368)

Old smatch warnings:
drivers/usb/host/xhci-plat.c:495 xhci_plat_resume() warn: 'xhci->clk' from clk_prepare_enable() not released on lines: 495.
drivers/usb/host/xhci-plat.c:495 xhci_plat_resume() warn: 'xhci->reg_clk' from clk_prepare_enable() not released on lines: 495.

vim +/sysdev +378 drivers/usb/host/xhci-plat.c

e60d31e628503a Arnd Bergmann             2023-01-31  354  
e60d31e628503a Arnd Bergmann             2023-01-31  355  static int xhci_generic_plat_probe(struct platform_device *pdev)
e60d31e628503a Arnd Bergmann             2023-01-31  356  {
e60d31e628503a Arnd Bergmann             2023-01-31  357  	const struct xhci_plat_priv *priv_match;
e60d31e628503a Arnd Bergmann             2023-01-31  358  	struct device *sysdev;
e60d31e628503a Arnd Bergmann             2023-01-31  359  	int ret;
e60d31e628503a Arnd Bergmann             2023-01-31  360  
e60d31e628503a Arnd Bergmann             2023-01-31  361  	/*
e60d31e628503a Arnd Bergmann             2023-01-31  362  	 * sysdev must point to a device that is known to the system firmware
e60d31e628503a Arnd Bergmann             2023-01-31  363  	 * or PCI hardware. We handle these three cases here:
e60d31e628503a Arnd Bergmann             2023-01-31  364  	 * 1. xhci_plat comes from firmware
e60d31e628503a Arnd Bergmann             2023-01-31  365  	 * 2. xhci_plat is child of a device from firmware (dwc3-plat)
e60d31e628503a Arnd Bergmann             2023-01-31  366  	 * 3. xhci_plat is grandchild of a pci device (dwc3-pci)
e60d31e628503a Arnd Bergmann             2023-01-31  367  	 */
e60d31e628503a Arnd Bergmann             2023-01-31 @368  	for (sysdev = &pdev->dev; sysdev; sysdev = sysdev->parent) {
e60d31e628503a Arnd Bergmann             2023-01-31  369  		if (is_of_node(sysdev->fwnode) ||
e60d31e628503a Arnd Bergmann             2023-01-31  370  			is_acpi_device_node(sysdev->fwnode))
e60d31e628503a Arnd Bergmann             2023-01-31  371  			break;
e60d31e628503a Arnd Bergmann             2023-01-31  372  #ifdef CONFIG_PCI
e60d31e628503a Arnd Bergmann             2023-01-31  373  		else if (sysdev->bus == &pci_bus_type)
e60d31e628503a Arnd Bergmann             2023-01-31  374  			break;
e60d31e628503a Arnd Bergmann             2023-01-31  375  #endif
e60d31e628503a Arnd Bergmann             2023-01-31  376  	}
e60d31e628503a Arnd Bergmann             2023-01-31  377  
e60d31e628503a Arnd Bergmann             2023-01-31 @378  	if (WARN_ON(!sysdev->dma_mask)) {
e60d31e628503a Arnd Bergmann             2023-01-31  379  		/* Platform did not initialize dma_mask */
e60d31e628503a Arnd Bergmann             2023-01-31  380  		ret = dma_coerce_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
e60d31e628503a Arnd Bergmann             2023-01-31  381  		if (ret)
e60d31e628503a Arnd Bergmann             2023-01-31  382  			return ret;
e60d31e628503a Arnd Bergmann             2023-01-31  383  	}
e60d31e628503a Arnd Bergmann             2023-01-31  384  
e60d31e628503a Arnd Bergmann             2023-01-31  385  	if (pdev->dev.of_node)
e60d31e628503a Arnd Bergmann             2023-01-31  386  		priv_match = of_device_get_match_data(&pdev->dev);
e60d31e628503a Arnd Bergmann             2023-01-31  387  	else
e60d31e628503a Arnd Bergmann             2023-01-31  388  		priv_match = dev_get_platdata(&pdev->dev);
e60d31e628503a Arnd Bergmann             2023-01-31  389  
e60d31e628503a Arnd Bergmann             2023-01-31  390  	return xhci_plat_probe(pdev, sysdev, priv_match);
e60d31e628503a Arnd Bergmann             2023-01-31  391  }
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  392  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
