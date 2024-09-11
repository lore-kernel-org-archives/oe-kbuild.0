Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C65115383B
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Sep 2024 11:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726054496; cv=none; b=p9Tv+q/SvHtOu3teFm2Ml+5AZrTv5nu2QeURtmO5UeSJUkPMCblYSIxSeASBppSurgz3qNga83c6zhyeleL8q2zLEmdhqlL1TycK9fKOxyy0wsXODlYKvFSh+X4+pvv5FjNkrubg25Btnl6UehDhoHhdUBcxr/P5wU6XVlKsGKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726054496; c=relaxed/simple;
	bh=ETCUO7Hs4Fc1p08/43UxEECigZtk9fMetj7/mV8YxiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VFWI7dLJQY9wDX9//JA7VsEgNWb/Zz/5jyWwE/w6e1E54++8+UzoTSoPJdVkuSqI6VqS2UCkkLEUWN13Zzp4022u2C3soMYOije4ij+93NlgpCClyJaX/lzwn0ibwieCDF8fmCG/k0ehiMotNeWsL+3Vc1+YYNh5erE6VBl818k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJ/njhyf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJ/njhyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726054495; x=1757590495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ETCUO7Hs4Fc1p08/43UxEECigZtk9fMetj7/mV8YxiQ=;
  b=nJ/njhyfba77J7U0L5aWvvSrmQ4Z7g7RzYELwPfemNKolfLfSe9ha9ML
   MPDvoq3k6+VZBp6QRP8TmIkAlNh/bZJyv1KzetHrKt23e9UOeayaIFz+M
   z/gko2jeUNX79DF4gXAfEuhHJJLle2hdiwyOsJ+lxBjQABf7RpdJrBtpC
   R3CsEoARQZKE5t6JqJ/AO5ZU5gxA7R5cQA5rTPsKaFgdx/ufDcqdFcWqE
   mDfVgDKKZYNus6Q+7K4auWNZbLokC3e5tRog7fcWrqfKygLddP9Gj+LwB
   d5K7xzQ4uwnnYscvYg5JaJLDKcaH6tq6qdd0JVAZa7COzdLFzR1VvdrwF
   w==;
X-CSE-ConnectionGUID: z+Re687vQaCZmpMjRNNnQA==
X-CSE-MsgGUID: T0l5UXNvSUewKNVg1Iu+nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42326108"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="42326108"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 04:34:51 -0700
X-CSE-ConnectionGUID: l/VoEKIES5m/Ja0MZ9q+Hg==
X-CSE-MsgGUID: 9RUJ3FQFTbygNcNQFMrGWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="67355739"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Sep 2024 04:34:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soLcU-0003TE-2D;
	Wed, 11 Sep 2024 11:34:46 +0000
Date: Wed, 11 Sep 2024 19:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cip:linux-5.10.y-cip-rt-rebase 606/1088]
 drivers/usb/host/xhci-plat.c:382 xhci_generic_plat_probe() error: we
 previously assumed 'sysdev' could be null (see line 372)
Message-ID: <202409111932.8IfPbgLM-lkp@intel.com>
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
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rt-rebase
head:   a0259975fd96430fc3d3859251a11923a9ccc1d1
commit: e2c2ad91a42ad031d823e03bc4e89478af1ccaad [606/1088] xhci: split out rcar/rz support from xhci-plat.c
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240910 (https://download.01.org/0day-ci/archive/20240911/202409111932.8IfPbgLM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409111932.8IfPbgLM-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci-plat.c:382 xhci_generic_plat_probe() error: we previously assumed 'sysdev' could be null (see line 372)
drivers/usb/host/xhci-plat.c:494 xhci_plat_resume() warn: 'xhci->clk' from clk_prepare_enable() not released on lines: 494.
drivers/usb/host/xhci-plat.c:494 xhci_plat_resume() warn: 'xhci->reg_clk' from clk_prepare_enable() not released on lines: 494.

vim +/sysdev +382 drivers/usb/host/xhci-plat.c

e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  358  
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  359  static int xhci_generic_plat_probe(struct platform_device *pdev)
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  360  {
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  361  	const struct xhci_plat_priv *priv_match;
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  362  	struct device *sysdev;
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  363  	int ret;
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  364  
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  365  	/*
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  366  	 * sysdev must point to a device that is known to the system firmware
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  367  	 * or PCI hardware. We handle these three cases here:
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  368  	 * 1. xhci_plat comes from firmware
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  369  	 * 2. xhci_plat is child of a device from firmware (dwc3-plat)
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  370  	 * 3. xhci_plat is grandchild of a pci device (dwc3-pci)
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  371  	 */
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01 @372  	for (sysdev = &pdev->dev; sysdev; sysdev = sysdev->parent) {
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  373  		if (is_of_node(sysdev->fwnode) ||
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  374  			is_acpi_device_node(sysdev->fwnode))
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  375  			break;
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  376  #ifdef CONFIG_PCI
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  377  		else if (sysdev->bus == &pci_bus_type)
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  378  			break;
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  379  #endif
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  380  	}
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  381  
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01 @382  	if (WARN_ON(!sysdev->dma_mask)) {
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  383  		/* Platform did not initialize dma_mask */
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  384  		ret = dma_coerce_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  385  		if (ret)
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  386  			return ret;
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  387  	}
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  388  
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  389  	if (pdev->dev.of_node)
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  390  		priv_match = of_device_get_match_data(&pdev->dev);
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  391  	else
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  392  		priv_match = dev_get_platdata(&pdev->dev);
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  393  
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  394  	return xhci_plat_probe(pdev, sysdev, priv_match);
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  395  }
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  396  
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  397  int xhci_plat_remove(struct platform_device *dev)
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  398  {
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  399  	struct usb_hcd	*hcd = platform_get_drvdata(dev);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  400  	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
4718c177405112 Gregory CLEMENT           2014-05-15  401  	struct clk *clk = xhci->clk;
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  402  	struct clk *reg_clk = xhci->reg_clk;
f068090426ea8d Mathias Nyman             2018-11-09  403  	struct usb_hcd *shared_hcd = xhci->shared_hcd;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  404  
1449cb2c2253d3 Li Jun                    2020-05-14  405  	pm_runtime_get_sync(&dev->dev);
dcc7620cad5ad1 Guenter Roeck             2017-03-09  406  	xhci->xhc_state |= XHCI_STATE_REMOVING;
dcc7620cad5ad1 Guenter Roeck             2017-03-09  407  
f068090426ea8d Mathias Nyman             2018-11-09  408  	usb_remove_hcd(shared_hcd);
f068090426ea8d Mathias Nyman             2018-11-09  409  	xhci->shared_hcd = NULL;
7b8ef22ea547b8 Maxime Ripard             2015-03-17  410  	usb_phy_shutdown(hcd->usb_phy);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  411  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  412  	usb_remove_hcd(hcd);
f068090426ea8d Mathias Nyman             2018-11-09  413  	usb_put_hcd(shared_hcd);
4ac53087d6d48e Roger Quadros             2015-05-29  414  
4718c177405112 Gregory CLEMENT           2014-05-15  415  	clk_disable_unprepare(clk);
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  416  	clk_disable_unprepare(reg_clk);
712fb696ff4e39 Biju Das                  2023-06-01  417  	reset_control_assert(xhci->reset);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  418  	usb_put_hcd(hcd);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  419  
b0c69b4bace370 Baolin Wang               2017-04-19  420  	pm_runtime_disable(&dev->dev);
1449cb2c2253d3 Li Jun                    2020-05-14  421  	pm_runtime_put_noidle(&dev->dev);
1449cb2c2253d3 Li Jun                    2020-05-14  422  	pm_runtime_set_suspended(&dev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  423  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  424  	return 0;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  425  }
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  426  EXPORT_SYMBOL_GPL(xhci_plat_remove);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  427  
d852ed98f62e0d Arnd Bergmann             2017-04-21  428  static int __maybe_unused xhci_plat_suspend(struct device *dev)
57d04eb131ec9d Vikas Sajjan              2013-02-11  429  {
57d04eb131ec9d Vikas Sajjan              2013-02-11  430  	struct usb_hcd	*hcd = dev_get_drvdata(dev);
57d04eb131ec9d Vikas Sajjan              2013-02-11  431  	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
5e0e54ff892487 Peter Chen                2020-09-18  432  	int ret;
57d04eb131ec9d Vikas Sajjan              2013-02-11  433  
20c51a4c52208f Frank Li                  2022-01-10  434  	if (pm_runtime_suspended(dev))
20c51a4c52208f Frank Li                  2022-01-10  435  		pm_runtime_resume(dev);
20c51a4c52208f Frank Li                  2022-01-10  436  
5e0e54ff892487 Peter Chen                2020-09-18  437  	ret = xhci_priv_suspend_quirk(hcd);
5e0e54ff892487 Peter Chen                2020-09-18  438  	if (ret)
5e0e54ff892487 Peter Chen                2020-09-18  439  		return ret;
a1377e5397ab32 Lu Baolu                  2014-11-18  440  	/*
a1377e5397ab32 Lu Baolu                  2014-11-18  441  	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
9cdda28d3278e4 Peter Chen                2020-09-18  442  	 * to do wakeup during suspend.
a1377e5397ab32 Lu Baolu                  2014-11-18  443  	 */
c13d0d2f5a4806 Justin Chen               2022-08-10  444  	ret = xhci_suspend(xhci, device_may_wakeup(dev));
c13d0d2f5a4806 Justin Chen               2022-08-10  445  	if (ret)
c13d0d2f5a4806 Justin Chen               2022-08-10  446  		return ret;
c13d0d2f5a4806 Justin Chen               2022-08-10  447  
c13d0d2f5a4806 Justin Chen               2022-08-10  448  	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
c13d0d2f5a4806 Justin Chen               2022-08-10  449  		clk_disable_unprepare(xhci->clk);
c13d0d2f5a4806 Justin Chen               2022-08-10  450  		clk_disable_unprepare(xhci->reg_clk);
c13d0d2f5a4806 Justin Chen               2022-08-10  451  	}
c13d0d2f5a4806 Justin Chen               2022-08-10  452  
c13d0d2f5a4806 Justin Chen               2022-08-10  453  	return 0;
57d04eb131ec9d Vikas Sajjan              2013-02-11  454  }
57d04eb131ec9d Vikas Sajjan              2013-02-11  455  
d852ed98f62e0d Arnd Bergmann             2017-04-21  456  static int __maybe_unused xhci_plat_resume(struct device *dev)
57d04eb131ec9d Vikas Sajjan              2013-02-11  457  {
57d04eb131ec9d Vikas Sajjan              2013-02-11  458  	struct usb_hcd	*hcd = dev_get_drvdata(dev);
57d04eb131ec9d Vikas Sajjan              2013-02-11  459  	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
98c0a3ffa30c4b Yoshihiro Shimoda         2017-04-19  460  	int ret;
57d04eb131ec9d Vikas Sajjan              2013-02-11  461  
c13d0d2f5a4806 Justin Chen               2022-08-10  462  	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
188425eb2da2a0 Sergey Shtylyov           2023-10-19  463  		ret = clk_prepare_enable(xhci->clk);
188425eb2da2a0 Sergey Shtylyov           2023-10-19  464  		if (ret)
188425eb2da2a0 Sergey Shtylyov           2023-10-19  465  			return ret;
188425eb2da2a0 Sergey Shtylyov           2023-10-19  466  
188425eb2da2a0 Sergey Shtylyov           2023-10-19  467  		ret = clk_prepare_enable(xhci->reg_clk);
188425eb2da2a0 Sergey Shtylyov           2023-10-19  468  		if (ret) {
188425eb2da2a0 Sergey Shtylyov           2023-10-19  469  			clk_disable_unprepare(xhci->clk);
188425eb2da2a0 Sergey Shtylyov           2023-10-19  470  			return ret;
188425eb2da2a0 Sergey Shtylyov           2023-10-19  471  		}
c13d0d2f5a4806 Justin Chen               2022-08-10  472  	}
c13d0d2f5a4806 Justin Chen               2022-08-10  473  
98c0a3ffa30c4b Yoshihiro Shimoda         2017-04-19  474  	ret = xhci_priv_resume_quirk(hcd);
98c0a3ffa30c4b Yoshihiro Shimoda         2017-04-19  475  	if (ret)
188425eb2da2a0 Sergey Shtylyov           2023-10-19  476  		goto disable_clks;
98c0a3ffa30c4b Yoshihiro Shimoda         2017-04-19  477  
79112cc3c29f4a Qais Yousef               2020-05-18  478  	ret = xhci_resume(xhci, 0);
79112cc3c29f4a Qais Yousef               2020-05-18  479  	if (ret)
188425eb2da2a0 Sergey Shtylyov           2023-10-19  480  		goto disable_clks;
79112cc3c29f4a Qais Yousef               2020-05-18  481  
79112cc3c29f4a Qais Yousef               2020-05-18  482  	pm_runtime_disable(dev);
79112cc3c29f4a Qais Yousef               2020-05-18  483  	pm_runtime_set_active(dev);
79112cc3c29f4a Qais Yousef               2020-05-18  484  	pm_runtime_enable(dev);
79112cc3c29f4a Qais Yousef               2020-05-18  485  
79112cc3c29f4a Qais Yousef               2020-05-18  486  	return 0;
188425eb2da2a0 Sergey Shtylyov           2023-10-19  487  
188425eb2da2a0 Sergey Shtylyov           2023-10-19  488  disable_clks:
188425eb2da2a0 Sergey Shtylyov           2023-10-19  489  	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
188425eb2da2a0 Sergey Shtylyov           2023-10-19  490  		clk_disable_unprepare(xhci->clk);
188425eb2da2a0 Sergey Shtylyov           2023-10-19  491  		clk_disable_unprepare(xhci->reg_clk);
188425eb2da2a0 Sergey Shtylyov           2023-10-19  492  	}
188425eb2da2a0 Sergey Shtylyov           2023-10-19  493  
188425eb2da2a0 Sergey Shtylyov           2023-10-19 @494  	return ret;
57d04eb131ec9d Vikas Sajjan              2013-02-11  495  }
b0c69b4bace370 Baolin Wang               2017-04-19  496  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
