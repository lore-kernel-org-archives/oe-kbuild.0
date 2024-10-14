Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9814D1448DF
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Oct 2024 23:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728946937; cv=none; b=ceAikCfeA2NJkyuzGS4JTCSC4a24AL42MRt/NkDZlwmlKjzFJkJI70m5ncyfRq4wguYcgnscwtU75Xv7RafeE8RBgpjfivn1XyiiPD295oRNH7VEwZP7MKeOwhTve5tTUVNCO+m6KZPQznUeWkyqX9OJS+Sh6igY9q621ibpdhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728946937; c=relaxed/simple;
	bh=jQ+IUx0RDdaqW1v66Gv2CryB7WKRivQ0jUoL5p2AgxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cPVWZudQJ5AExwNbpXBR1QZQfZ4/SfkUrBO9umwIq+KXZ9P1Gf+T7zN2M0W/6aOrYmGaxkaqCbF16Xfd948j6S3O5btcJ26ghz7fvYCaPKm5thB7SsgPW2Qde7iEj3yB9WPMxaCCmbw3Gjgt9zkMGGHPFRFu9NWSqLTiNTPIgJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGWnMEEB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGWnMEEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728946935; x=1760482935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jQ+IUx0RDdaqW1v66Gv2CryB7WKRivQ0jUoL5p2AgxU=;
  b=IGWnMEEBKlISLs8weq5j71rmq25fSODkuYHu6M8theN6vGcOjkVVnOXj
   RMoIKy5qctezxkRUPu87Oztr5b1R+RAT4mfhukqTvbEVbZq9piWAd0O/5
   +lZ87NRA7HeHdo1kv9dwlyJWtJnEJUPkn0WgiCEpb7Ls0ea+/6H3GcmBy
   6trv370C3WQ25G2NjyMUvsElcOsZBA200n+NPfkufD4cOxS1L/UjxfTnq
   uVQE77eZyHJQfAh7eebn74X9RatGlsbVz5UuhPGK9Kv28ZsJl9pQIakFo
   t6a4MUWjmip0AqUW5KjZBde3Q3/GxGV533XKR98J/x9p10CHhgxyR8I9v
   g==;
X-CSE-ConnectionGUID: OQonXG30ROalKPoTRZrKgA==
X-CSE-MsgGUID: +h+tbjYJRNu1tjq7tTpJ7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="45826544"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="45826544"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 16:02:13 -0700
X-CSE-ConnectionGUID: MUwGqEvfTi2WJyBQ0nwFDw==
X-CSE-MsgGUID: j/UwzNyTStad6p/hgyyjEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="77886342"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Oct 2024 16:02:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0U4n-000HIB-1p;
	Mon, 14 Oct 2024 23:02:09 +0000
Date: Tue, 15 Oct 2024 07:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cip:linux-5.10.y-cip-rebase 606/1105]
 drivers/usb/host/xhci-plat.c:382 xhci_generic_plat_probe() error: we
 previously assumed 'sysdev' could be null (see line 372)
Message-ID: <202410150653.RDBoPiA3-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rebase
head:   3cdd0cc9c0e53917e2c4e56b1e7256ae8923845e
commit: 7ce55f4ea24048dd70fb4aa8f522c94d5f767f08 [606/1105] xhci: split out rcar/rz support from xhci-plat.c
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20241014 (https://download.01.org/0day-ci/archive/20241015/202410150653.RDBoPiA3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410150653.RDBoPiA3-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci-plat.c:382 xhci_generic_plat_probe() error: we previously assumed 'sysdev' could be null (see line 372)
drivers/usb/host/xhci-plat.c:494 xhci_plat_resume() warn: 'xhci->clk' from clk_prepare_enable() not released on lines: 494.
drivers/usb/host/xhci-plat.c:494 xhci_plat_resume() warn: 'xhci->reg_clk' from clk_prepare_enable() not released on lines: 494.

vim +/sysdev +382 drivers/usb/host/xhci-plat.c

7ce55f4ea24048 Arnd Bergmann             2023-06-01  358  
7ce55f4ea24048 Arnd Bergmann             2023-06-01  359  static int xhci_generic_plat_probe(struct platform_device *pdev)
7ce55f4ea24048 Arnd Bergmann             2023-06-01  360  {
7ce55f4ea24048 Arnd Bergmann             2023-06-01  361  	const struct xhci_plat_priv *priv_match;
7ce55f4ea24048 Arnd Bergmann             2023-06-01  362  	struct device *sysdev;
7ce55f4ea24048 Arnd Bergmann             2023-06-01  363  	int ret;
7ce55f4ea24048 Arnd Bergmann             2023-06-01  364  
7ce55f4ea24048 Arnd Bergmann             2023-06-01  365  	/*
7ce55f4ea24048 Arnd Bergmann             2023-06-01  366  	 * sysdev must point to a device that is known to the system firmware
7ce55f4ea24048 Arnd Bergmann             2023-06-01  367  	 * or PCI hardware. We handle these three cases here:
7ce55f4ea24048 Arnd Bergmann             2023-06-01  368  	 * 1. xhci_plat comes from firmware
7ce55f4ea24048 Arnd Bergmann             2023-06-01  369  	 * 2. xhci_plat is child of a device from firmware (dwc3-plat)
7ce55f4ea24048 Arnd Bergmann             2023-06-01  370  	 * 3. xhci_plat is grandchild of a pci device (dwc3-pci)
7ce55f4ea24048 Arnd Bergmann             2023-06-01  371  	 */
7ce55f4ea24048 Arnd Bergmann             2023-06-01 @372  	for (sysdev = &pdev->dev; sysdev; sysdev = sysdev->parent) {
7ce55f4ea24048 Arnd Bergmann             2023-06-01  373  		if (is_of_node(sysdev->fwnode) ||
7ce55f4ea24048 Arnd Bergmann             2023-06-01  374  			is_acpi_device_node(sysdev->fwnode))
7ce55f4ea24048 Arnd Bergmann             2023-06-01  375  			break;
7ce55f4ea24048 Arnd Bergmann             2023-06-01  376  #ifdef CONFIG_PCI
7ce55f4ea24048 Arnd Bergmann             2023-06-01  377  		else if (sysdev->bus == &pci_bus_type)
7ce55f4ea24048 Arnd Bergmann             2023-06-01  378  			break;
7ce55f4ea24048 Arnd Bergmann             2023-06-01  379  #endif
7ce55f4ea24048 Arnd Bergmann             2023-06-01  380  	}
7ce55f4ea24048 Arnd Bergmann             2023-06-01  381  
7ce55f4ea24048 Arnd Bergmann             2023-06-01 @382  	if (WARN_ON(!sysdev->dma_mask)) {
7ce55f4ea24048 Arnd Bergmann             2023-06-01  383  		/* Platform did not initialize dma_mask */
7ce55f4ea24048 Arnd Bergmann             2023-06-01  384  		ret = dma_coerce_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
7ce55f4ea24048 Arnd Bergmann             2023-06-01  385  		if (ret)
7ce55f4ea24048 Arnd Bergmann             2023-06-01  386  			return ret;
7ce55f4ea24048 Arnd Bergmann             2023-06-01  387  	}
7ce55f4ea24048 Arnd Bergmann             2023-06-01  388  
7ce55f4ea24048 Arnd Bergmann             2023-06-01  389  	if (pdev->dev.of_node)
7ce55f4ea24048 Arnd Bergmann             2023-06-01  390  		priv_match = of_device_get_match_data(&pdev->dev);
7ce55f4ea24048 Arnd Bergmann             2023-06-01  391  	else
7ce55f4ea24048 Arnd Bergmann             2023-06-01  392  		priv_match = dev_get_platdata(&pdev->dev);
7ce55f4ea24048 Arnd Bergmann             2023-06-01  393  
7ce55f4ea24048 Arnd Bergmann             2023-06-01  394  	return xhci_plat_probe(pdev, sysdev, priv_match);
7ce55f4ea24048 Arnd Bergmann             2023-06-01  395  }
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  396  
7ce55f4ea24048 Arnd Bergmann             2023-06-01  397  int xhci_plat_remove(struct platform_device *dev)
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
8b67c4750f869a Biju Das                  2023-06-01  417  	reset_control_assert(xhci->reset);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  418  	usb_put_hcd(hcd);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  419  
b0c69b4bace370 Baolin Wang               2017-04-19  420  	pm_runtime_disable(&dev->dev);
1449cb2c2253d3 Li Jun                    2020-05-14  421  	pm_runtime_put_noidle(&dev->dev);
1449cb2c2253d3 Li Jun                    2020-05-14  422  	pm_runtime_set_suspended(&dev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  423  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  424  	return 0;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  425  }
7ce55f4ea24048 Arnd Bergmann             2023-06-01  426  EXPORT_SYMBOL_GPL(xhci_plat_remove);
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
