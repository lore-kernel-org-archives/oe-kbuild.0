Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D81F1756F
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Mar 2024 06:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710310902; cv=none; b=gtjoUztrxUwQP6LpqWUqJ8VSDgUf4wnCmesoeVkFyxBKeT2+NjyzMEKJBQdseOrOZLT9V9oQ59q9UE5HsbwtYaaXIz71ns8CGyxIQ/I2NVf6BpZ2Y42kVrxYN967ILbqP7QnZRGqN2RWItVp9wdS/h4+S5Uu7P8He/zb+vRA4sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710310902; c=relaxed/simple;
	bh=LaPyEj8Z6pJ5uRpDMuliIpjqH/T4hPrx8u8LNjx/mu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dF0QorWlEsuWEDrz3I0QxQ4XOwLeDpwMLbRKkkUNi/jQq+r62LjQOYtUwzHztl6A4xciSQdjr4TOVENVvKY4eDbG3DlXaEtdVhoG+adkw7cWP8/oa27yEuvPlRqyDl+p8q3DGyFA22E8muZho3Kf2bZWaTKsaXkW6xZJ7GYAuhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+NPKu7B; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+NPKu7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710310900; x=1741846900;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LaPyEj8Z6pJ5uRpDMuliIpjqH/T4hPrx8u8LNjx/mu4=;
  b=O+NPKu7B3VC1QOhSQV6pZueV1LpWCIRtlBlA6R8ZlsE+OX94tvuWFR65
   Nd10qH9RkS2jhMIGO+HAc17vjlPaUZtOwKCF4aSteSewfonjoFR4IlLTW
   d8R9hHCv6R646WWMhpJqi1XV4Tjnmh9eP4Ai/WafQGGattIs3zzEpkbHo
   aC8Ate20CoVEALgiBNM/VgyzENgAtoU2qX550Sh6o8jXxLnNpUKpY6m/v
   Qi0LxeyB4gA1AOZvzw6Hu0FO3MQwPi4dp4pOFy2qnucTee7EphV7GwAH8
   gbJ7M3TbS5Ytp4F3L3k6RykgyG1NaR9PgzSwldfLGksSNt9RiF5mda4Bx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4906547"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4906547"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 23:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="12220325"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Mar 2024 23:21:37 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkHza-000C6d-2E;
	Wed, 13 Mar 2024 06:21:34 +0000
Date: Wed, 13 Mar 2024 14:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 2/2] usb: host: xhci-plat: add support for multi
 memory regions
Message-ID: <202403131441.SrhLAZvp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240311094947.3738200-3-howardyen@google.com>
References: <20240311094947.3738200-3-howardyen@google.com>
TO: Howard Yen <howardyen@google.com>
TO: gregkh@linuxfoundation.org
TO: rafael@kernel.org
TO: mathias.nyman@intel.com
TO: hch@lst.de
TO: m.szyprowski@samsung.com
TO: robin.murphy@arm.com
TO: andriy.shevchenko@linux.intel.com
TO: petr.tesarik.ext@huawei.com
TO: broonie@kernel.org
TO: james@equiv.tech
TO: james.clark@arm.com
TO: masahiroy@kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: iommu@lists.linux.dev
CC: Howard Yen <howardyen@google.com>

Hi Howard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.8 next-20240312]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Howard-Yen/dma-coherent-add-support-for-multi-coherent-rmems-per-dev/20240311-175308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240311094947.3738200-3-howardyen%40google.com
patch subject: [PATCH v5 2/2] usb: host: xhci-plat: add support for multi memory regions
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-r081-20240311 (https://download.01.org/0day-ci/archive/20240313/202403131441.SrhLAZvp-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403131441.SrhLAZvp-lkp@intel.com/

New smatch warnings:
drivers/usb/host/xhci-plat.c:207 xhci_plat_probe() warn: missing unwind goto?

Old smatch warnings:
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting
drivers/usb/host/xhci-plat.c:525 xhci_plat_resume_common() warn: 'xhci->clk' from clk_prepare_enable() not released on lines: 525.
drivers/usb/host/xhci-plat.c:525 xhci_plat_resume_common() warn: 'xhci->reg_clk' from clk_prepare_enable() not released on lines: 525.

vim +207 drivers/usb/host/xhci-plat.c

4efb2f69411456 Yoshihiro Shimoda         2015-11-24  145  
ec5499d338ece9 Arnd Bergmann             2023-01-31  146  int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const struct xhci_plat_priv *priv_match)
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  147  {
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  148  	const struct hc_driver	*driver;
ec5499d338ece9 Arnd Bergmann             2023-01-31  149  	struct device		*tmpdev;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  150  	struct xhci_hcd		*xhci;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  151  	struct resource         *res;
e0fe986972f5b6 Heiner Kallweit           2022-05-12  152  	struct usb_hcd		*hcd, *usb3_hcd;
fe4daa605d0cae Howard Yen                2024-03-11  153  	int			i, count, ret;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  154  	int			irq;
f768e718911e03 Peter Chen                2020-09-18  155  	struct xhci_plat_priv	*priv = NULL;
16b7e0cccb2430 Johan Hovold              2023-11-03  156  	bool			of_match;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  157  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  158  	if (usb_disabled())
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  159  		return -ENODEV;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  160  
1885d9a33753b7 Andrew Bresticker         2014-10-03  161  	driver = &xhci_plat_hc_driver;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  162  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  163  	irq = platform_get_irq(pdev, 0);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  164  	if (irq < 0)
4b148d5144d64e Thomas Petazzoni          2017-05-17  165  		return irq;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  166  
c6b8e79306f515 Adam Wallis               2017-09-18  167  	if (!sysdev)
c6b8e79306f515 Adam Wallis               2017-09-18  168  		sysdev = &pdev->dev;
4c39d4b949d36f Arnd Bergmann             2017-03-13  169  
4c39d4b949d36f Arnd Bergmann             2017-03-13  170  	ret = dma_set_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
c10cf1189d7659 Xenia Ragiadakou          2013-08-14  171  	if (ret)
c10cf1189d7659 Xenia Ragiadakou          2013-08-14  172  		return ret;
c10cf1189d7659 Xenia Ragiadakou          2013-08-14  173  
b0c69b4bace370 Baolin Wang               2017-04-19  174  	pm_runtime_set_active(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  175  	pm_runtime_enable(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  176  	pm_runtime_get_noresume(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  177  
4c39d4b949d36f Arnd Bergmann             2017-03-13  178  	hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
4c39d4b949d36f Arnd Bergmann             2017-03-13  179  			       dev_name(&pdev->dev), NULL);
b0c69b4bace370 Baolin Wang               2017-04-19  180  	if (!hcd) {
b0c69b4bace370 Baolin Wang               2017-04-19  181  		ret = -ENOMEM;
b0c69b4bace370 Baolin Wang               2017-04-19  182  		goto disable_runtime;
b0c69b4bace370 Baolin Wang               2017-04-19  183  	}
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  184  
fb222273a2159a Dejin Zheng               2020-03-24  185  	hcd->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
fd666348c51f6a Himangi Saraogi           2014-06-20  186  	if (IS_ERR(hcd->regs)) {
fd666348c51f6a Himangi Saraogi           2014-06-20  187  		ret = PTR_ERR(hcd->regs);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  188  		goto put_hcd;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  189  	}
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  190  
e7020f193a3d13 Varka Bhadram             2014-11-04  191  	hcd->rsrc_start = res->start;
e7020f193a3d13 Varka Bhadram             2014-11-04  192  	hcd->rsrc_len = resource_size(res);
e7020f193a3d13 Varka Bhadram             2014-11-04  193  
08048c04cc6f75 Chunfeng Yun              2019-04-17  194  	xhci = hcd_to_xhci(hcd);
08048c04cc6f75 Chunfeng Yun              2019-04-17  195  
4736ebd7fcaff1 Heiner Kallweit           2022-05-12  196  	xhci->allow_single_roothub = 1;
4736ebd7fcaff1 Heiner Kallweit           2022-05-12  197  
fe4daa605d0cae Howard Yen                2024-03-11  198  	count = of_property_count_u32_elems(sysdev->of_node, "memory-region");
fe4daa605d0cae Howard Yen                2024-03-11  199  
fe4daa605d0cae Howard Yen                2024-03-11  200  	for (i = 0; i < count; i++) {
fe4daa605d0cae Howard Yen                2024-03-11  201  		ret = of_reserved_mem_device_init_by_idx(sysdev, sysdev->of_node, i);
fe4daa605d0cae Howard Yen                2024-03-11  202  		if (ret) {
fe4daa605d0cae Howard Yen                2024-03-11  203  			dev_err(sysdev, "Could not get reserved memory\n");
fe4daa605d0cae Howard Yen                2024-03-11  204  			if (i > 0)
fe4daa605d0cae Howard Yen                2024-03-11  205  				of_reserved_mem_device_release(sysdev);
fe4daa605d0cae Howard Yen                2024-03-11  206  
fe4daa605d0cae Howard Yen                2024-03-11 @207  			return ret;
fe4daa605d0cae Howard Yen                2024-03-11  208  		}
fe4daa605d0cae Howard Yen                2024-03-11  209  	}
fe4daa605d0cae Howard Yen                2024-03-11  210  
4718c177405112 Gregory CLEMENT           2014-05-15  211  	/*
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  212  	 * Not all platforms have clks so it is not an error if the
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  213  	 * clock do not exist.
4718c177405112 Gregory CLEMENT           2014-05-15  214  	 */
08048c04cc6f75 Chunfeng Yun              2019-04-17  215  	xhci->reg_clk = devm_clk_get_optional(&pdev->dev, "reg");
08048c04cc6f75 Chunfeng Yun              2019-04-17  216  	if (IS_ERR(xhci->reg_clk)) {
08048c04cc6f75 Chunfeng Yun              2019-04-17  217  		ret = PTR_ERR(xhci->reg_clk);
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  218  		goto put_hcd;
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  219  	}
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  220  
08048c04cc6f75 Chunfeng Yun              2019-04-17  221  	xhci->clk = devm_clk_get_optional(&pdev->dev, NULL);
08048c04cc6f75 Chunfeng Yun              2019-04-17  222  	if (IS_ERR(xhci->clk)) {
08048c04cc6f75 Chunfeng Yun              2019-04-17  223  		ret = PTR_ERR(xhci->clk);
8c6e8b09617915 Biju Das                  2023-01-21  224  		goto put_hcd;
4718c177405112 Gregory CLEMENT           2014-05-15  225  	}
4718c177405112 Gregory CLEMENT           2014-05-15  226  
224eb5311d6a8c Biju Das                  2023-01-21  227  	xhci->reset = devm_reset_control_array_get_optional_shared(&pdev->dev);
224eb5311d6a8c Biju Das                  2023-01-21  228  	if (IS_ERR(xhci->reset)) {
224eb5311d6a8c Biju Das                  2023-01-21  229  		ret = PTR_ERR(xhci->reset);
224eb5311d6a8c Biju Das                  2023-01-21  230  		goto put_hcd;
224eb5311d6a8c Biju Das                  2023-01-21  231  	}
224eb5311d6a8c Biju Das                  2023-01-21  232  
224eb5311d6a8c Biju Das                  2023-01-21  233  	ret = reset_control_deassert(xhci->reset);
8c6e8b09617915 Biju Das                  2023-01-21  234  	if (ret)
8c6e8b09617915 Biju Das                  2023-01-21  235  		goto put_hcd;
8c6e8b09617915 Biju Das                  2023-01-21  236  
224eb5311d6a8c Biju Das                  2023-01-21  237  	ret = clk_prepare_enable(xhci->reg_clk);
224eb5311d6a8c Biju Das                  2023-01-21  238  	if (ret)
224eb5311d6a8c Biju Das                  2023-01-21  239  		goto err_reset;
224eb5311d6a8c Biju Das                  2023-01-21  240  
08048c04cc6f75 Chunfeng Yun              2019-04-17  241  	ret = clk_prepare_enable(xhci->clk);
08048c04cc6f75 Chunfeng Yun              2019-04-17  242  	if (ret)
08048c04cc6f75 Chunfeng Yun              2019-04-17  243  		goto disable_reg_clk;
08048c04cc6f75 Chunfeng Yun              2019-04-17  244  
2847d242a1e48c Geert Uytterhoeven        2017-10-05  245  	if (priv_match) {
f768e718911e03 Peter Chen                2020-09-18  246  		priv = hcd_to_xhci_priv(hcd);
4efb2f69411456 Yoshihiro Shimoda         2015-11-24  247  		/* Just copy data for now */
4efb2f69411456 Yoshihiro Shimoda         2015-11-24  248  		*priv = *priv_match;
4efb2f69411456 Yoshihiro Shimoda         2015-11-24  249  	}
4efb2f69411456 Yoshihiro Shimoda         2015-11-24  250  
4bb4fc0dbfa23a Peter Chen                2020-09-18  251  	device_set_wakeup_capable(&pdev->dev, true);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  252  
9fa733f24bb54d Roger Quadros             2015-05-29  253  	xhci->main_hcd = hcd;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  254  
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  255  	/* imod_interval is the interrupt moderation value in nanoseconds. */
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  256  	xhci->imod_interval = 40000;
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  257  
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  258  	/* Iterate over all parent nodes for finding quirks */
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  259  	for (tmpdev = &pdev->dev; tmpdev; tmpdev = tmpdev->parent) {
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  260  
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  261  		if (device_property_read_bool(tmpdev, "usb2-lpm-disable"))
4750bc78efdb12 Thang Q. Nguyen           2017-10-05  262  			xhci->quirks |= XHCI_HW_LPM_DISABLE;
4750bc78efdb12 Thang Q. Nguyen           2017-10-05  263  
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  264  		if (device_property_read_bool(tmpdev, "usb3-lpm-capable"))
20f6fdd01c2c0d Pratyush Anand            2014-07-04  265  			xhci->quirks |= XHCI_LPM_SUPPORT;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  266  
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  267  		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
21939f003ad093 Felipe Balbi              2017-01-23  268  			xhci->quirks |= XHCI_BROKEN_PORT_PED;
21939f003ad093 Felipe Balbi              2017-01-23  269  
520b391e3e813c Prashanth K               2024-01-16  270  		if (device_property_read_bool(tmpdev, "xhci-sg-trb-cache-size-quirk"))
520b391e3e813c Prashanth K               2024-01-16  271  			xhci->quirks |= XHCI_SG_TRB_CACHE_SIZE_QUIRK;
520b391e3e813c Prashanth K               2024-01-16  272  
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  273  		device_property_read_u32(tmpdev, "imod-interval-ns",
ab725cbec3e83d Adam Wallis               2017-12-08  274  					 &xhci->imod_interval);
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  275  	}
ab725cbec3e83d Adam Wallis               2017-12-08  276  
16b7e0cccb2430 Johan Hovold              2023-11-03  277  	/*
16b7e0cccb2430 Johan Hovold              2023-11-03  278  	 * Drivers such as dwc3 manages PHYs themself (and rely on driver name
16b7e0cccb2430 Johan Hovold              2023-11-03  279  	 * matching for the xhci platform device).
16b7e0cccb2430 Johan Hovold              2023-11-03  280  	 */
16b7e0cccb2430 Johan Hovold              2023-11-03  281  	of_match = of_match_device(pdev->dev.driver->of_match_table, &pdev->dev);
16b7e0cccb2430 Johan Hovold              2023-11-03  282  	if (of_match) {
4c39d4b949d36f Arnd Bergmann             2017-03-13  283  		hcd->usb_phy = devm_usb_get_phy_by_phandle(sysdev, "usb-phy", 0);
7b8ef22ea547b8 Maxime Ripard             2015-03-17  284  		if (IS_ERR(hcd->usb_phy)) {
7b8ef22ea547b8 Maxime Ripard             2015-03-17  285  			ret = PTR_ERR(hcd->usb_phy);
7b8ef22ea547b8 Maxime Ripard             2015-03-17  286  			if (ret == -EPROBE_DEFER)
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  287  				goto disable_clk;
7b8ef22ea547b8 Maxime Ripard             2015-03-17  288  			hcd->usb_phy = NULL;
7b8ef22ea547b8 Maxime Ripard             2015-03-17  289  		} else {
7b8ef22ea547b8 Maxime Ripard             2015-03-17  290  			ret = usb_phy_init(hcd->usb_phy);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  291  			if (ret)
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  292  				goto disable_clk;
7b8ef22ea547b8 Maxime Ripard             2015-03-17  293  		}
16b7e0cccb2430 Johan Hovold              2023-11-03  294  	}
7b8ef22ea547b8 Maxime Ripard             2015-03-17  295  
c94d41e9dd1ba3 Peter Chen                2018-09-20  296  	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  297  
8e10548f7f4814 Pali Rohár                2022-02-03  298  	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
f768e718911e03 Peter Chen                2020-09-18  299  		hcd->skip_phy_initialization = 1;
f768e718911e03 Peter Chen                2020-09-18  300  
bac1ec55143469 Tejas Joglekar            2020-12-08  301  	if (priv && (priv->quirks & XHCI_SG_TRB_CACHE_SIZE_QUIRK))
bac1ec55143469 Tejas Joglekar            2020-12-08  302  		xhci->quirks |= XHCI_SG_TRB_CACHE_SIZE_QUIRK;
bac1ec55143469 Tejas Joglekar            2020-12-08  303  
4ac53087d6d48e Roger Quadros             2015-05-29  304  	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
7b8ef22ea547b8 Maxime Ripard             2015-03-17  305  	if (ret)
7b8ef22ea547b8 Maxime Ripard             2015-03-17  306  		goto disable_usb_phy;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  307  
e0fe986972f5b6 Heiner Kallweit           2022-05-12  308  	if (!xhci_has_one_roothub(xhci)) {
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  309  		xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  310  						    dev_name(&pdev->dev), hcd);
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  311  		if (!xhci->shared_hcd) {
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  312  			ret = -ENOMEM;
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  313  			goto dealloc_usb2_hcd;
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  314  		}
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  315  
16b7e0cccb2430 Johan Hovold              2023-11-03  316  		if (of_match) {
9134c1fd05034d Stanley Chang             2023-04-07  317  			xhci->shared_hcd->usb_phy = devm_usb_get_phy_by_phandle(sysdev,
9134c1fd05034d Stanley Chang             2023-04-07  318  										"usb-phy", 1);
9134c1fd05034d Stanley Chang             2023-04-07  319  			if (IS_ERR(xhci->shared_hcd->usb_phy)) {
9134c1fd05034d Stanley Chang             2023-04-07  320  				xhci->shared_hcd->usb_phy = NULL;
9134c1fd05034d Stanley Chang             2023-04-07  321  			} else {
9134c1fd05034d Stanley Chang             2023-04-07  322  				ret = usb_phy_init(xhci->shared_hcd->usb_phy);
9134c1fd05034d Stanley Chang             2023-04-07  323  				if (ret)
9134c1fd05034d Stanley Chang             2023-04-07  324  					dev_err(sysdev, "%s init usb3phy fail (ret=%d)\n",
9134c1fd05034d Stanley Chang             2023-04-07  325  						__func__, ret);
9134c1fd05034d Stanley Chang             2023-04-07  326  			}
16b7e0cccb2430 Johan Hovold              2023-11-03  327  		}
9134c1fd05034d Stanley Chang             2023-04-07  328  
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  329  		xhci->shared_hcd->tpl_support = hcd->tpl_support;
e0fe986972f5b6 Heiner Kallweit           2022-05-12  330  	}
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  331  
e0fe986972f5b6 Heiner Kallweit           2022-05-12  332  	usb3_hcd = xhci_get_usb3_hcd(xhci);
e0fe986972f5b6 Heiner Kallweit           2022-05-12  333  	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4)
e0fe986972f5b6 Heiner Kallweit           2022-05-12  334  		usb3_hcd->can_do_streams = 1;
5de4e1ea9a731c William wu                2017-01-17  335  
e0fe986972f5b6 Heiner Kallweit           2022-05-12  336  	if (xhci->shared_hcd) {
4ac53087d6d48e Roger Quadros             2015-05-29  337  		ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
4ac53087d6d48e Roger Quadros             2015-05-29  338  		if (ret)
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  339  			goto put_usb3_hcd;
e0fe986972f5b6 Heiner Kallweit           2022-05-12  340  	}
4ac53087d6d48e Roger Quadros             2015-05-29  341  
c70a1529b29cb1 Andrew Bresticker         2017-04-07  342  	device_enable_async_suspend(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  343  	pm_runtime_put_noidle(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  344  
b0c69b4bace370 Baolin Wang               2017-04-19  345  	/*
b0c69b4bace370 Baolin Wang               2017-04-19  346  	 * Prevent runtime pm from being on as default, users should enable
b0c69b4bace370 Baolin Wang               2017-04-19  347  	 * runtime pm using power/control in sysfs.
b0c69b4bace370 Baolin Wang               2017-04-19  348  	 */
b0c69b4bace370 Baolin Wang               2017-04-19  349  	pm_runtime_forbid(&pdev->dev);
c70a1529b29cb1 Andrew Bresticker         2017-04-07  350  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  351  	return 0;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  352  
4ac53087d6d48e Roger Quadros             2015-05-29  353  
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  354  put_usb3_hcd:
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  355  	usb_put_hcd(xhci->shared_hcd);
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  356  
4ac53087d6d48e Roger Quadros             2015-05-29  357  dealloc_usb2_hcd:
4ac53087d6d48e Roger Quadros             2015-05-29  358  	usb_remove_hcd(hcd);
4ac53087d6d48e Roger Quadros             2015-05-29  359  
7b8ef22ea547b8 Maxime Ripard             2015-03-17  360  disable_usb_phy:
7b8ef22ea547b8 Maxime Ripard             2015-03-17  361  	usb_phy_shutdown(hcd->usb_phy);
7b8ef22ea547b8 Maxime Ripard             2015-03-17  362  
4718c177405112 Gregory CLEMENT           2014-05-15  363  disable_clk:
08048c04cc6f75 Chunfeng Yun              2019-04-17  364  	clk_disable_unprepare(xhci->clk);
4718c177405112 Gregory CLEMENT           2014-05-15  365  
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  366  disable_reg_clk:
08048c04cc6f75 Chunfeng Yun              2019-04-17  367  	clk_disable_unprepare(xhci->reg_clk);
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  368  
224eb5311d6a8c Biju Das                  2023-01-21  369  err_reset:
224eb5311d6a8c Biju Das                  2023-01-21  370  	reset_control_assert(xhci->reset);
224eb5311d6a8c Biju Das                  2023-01-21  371  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  372  put_hcd:
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  373  	usb_put_hcd(hcd);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  374  
b0c69b4bace370 Baolin Wang               2017-04-19  375  disable_runtime:
b0c69b4bace370 Baolin Wang               2017-04-19  376  	pm_runtime_put_noidle(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  377  	pm_runtime_disable(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  378  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  379  	return ret;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  380  }
ec5499d338ece9 Arnd Bergmann             2023-01-31  381  EXPORT_SYMBOL_GPL(xhci_plat_probe);
ec5499d338ece9 Arnd Bergmann             2023-01-31  382  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
