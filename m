Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D5336D
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jun 2025 05:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751260872; cv=none; b=DLHP7HOk+0ukblnSg5qBvljLwafsL2fcJTOjhPPfvCT/Rs9jNPvuuhacnUqeW3JvIOudOhy5UMQ0G7bB+LAJRSmOSjtsMz3UCaz7J/T1S8KnroAXoAIJ3N1S+N23DfztLkQLvM7YmLjq5K3lKCe/4JtDZRTRU+5xmeSbqImlXJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751260872; c=relaxed/simple;
	bh=wD0nW4aEaGxhdKsxmRK5rrftuDTlyAkpMCq8QaQzkZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eOrAlFXozfXQVc9BWcbRmPVEk+yb6Et2d6cfR8BOIyr6KsbPmvPLGyKMkyLJtjEHH/pKkHRC89Jsla0rvD3nkhmYLcMc6NCRnMiR3aDyxKr+wYWc5kIDadfL/Gz08osv/ZRLaFaTERJoQIZhJioK6sQFmSit4M4bmwOcFDKBhvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkAd/vLI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkAd/vLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751260870; x=1782796870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wD0nW4aEaGxhdKsxmRK5rrftuDTlyAkpMCq8QaQzkZ8=;
  b=BkAd/vLISSheBouq4ljDylrN9rA8GlI0No8Ndvi3InEqv9tVYBFnzWZL
   X5sJj2No78lu3fnyNqVH1AxSfETICifaeCOf/mzVGWzpUw5fOJWW4ZW2k
   dcguh+kDDVWMEdeMbW0H+ro3o0YxH4DKDnmLm9IWN5DlOkSr01hZxsLxT
   j87qW1l3+2Gb0ddCFBHDkUseaknw96w5OEpeO5k8GHrSA9RlqCF4hFnji
   oo2hU/w/hxZPkircBUt0hciqcEC8pJF+GkeMUP2AYn6CyHDHw1PjAI2dL
   sA8NE8MYiU1GKmzyzHuhWMs2pLePxHUOLIlHhIHdGoYtxY/rLDI1EkjLX
   Q==;
X-CSE-ConnectionGUID: jsbf0aAgRnCigbUNksg8mw==
X-CSE-MsgGUID: 7rTVn2ANTe2g+f2FgrjYFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64827469"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64827469"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 22:21:09 -0700
X-CSE-ConnectionGUID: PWACmpiISHGYzp361PrG6g==
X-CSE-MsgGUID: ISc9+tkLRM62EtmZkLjuDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="177030071"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jun 2025 22:21:08 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW6wz-000YTu-2x;
	Mon, 30 Jun 2025 05:21:05 +0000
Date: Mon, 30 Jun 2025 13:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 09/10] PCI: exynos: Add support for Tesla FSD SoC
Message-ID: <202506301329.VWoiH0yn-lkp@intel.com>
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
In-Reply-To: <20250625165229.3458-10-shradha.t@samsung.com>
References: <20250625165229.3458-10-shradha.t@samsung.com>
TO: Shradha Todi <shradha.t@samsung.com>
TO: linux-pci@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-samsung-soc@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-phy@lists.infradead.org
TO: linux-fsd@tesla.com
CC: manivannan.sadhasivam@linaro.org
CC: lpieralisi@kernel.org
CC: kw@linux.com
CC: robh@kernel.org
CC: bhelgaas@google.com
CC: jingoohan1@gmail.com
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: alim.akhtar@samsung.com
CC: vkoul@kernel.org
CC: kishon@kernel.org
CC: arnd@arndb.de
CC: m.szyprowski@samsung.com
CC: jh80.chung@samsung.com
CC: pankaj.dubey@samsung.com
CC: Shradha Todi <shradha.t@samsung.com>

Hi Shradha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus robh/for-next krzk/for-next linus/master v6.16-rc4 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shradha-Todi/PCI-exynos-Remove-unused-MACROs-in-exynos-PCI-file/20250626-104154
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250625165229.3458-10-shradha.t%40samsung.com
patch subject: [PATCH v2 09/10] PCI: exynos: Add support for Tesla FSD SoC
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: um-randconfig-r071-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301329.VWoiH0yn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506301329.VWoiH0yn-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pci-exynos.c:621 exynos_pcie_probe() error: we previously assumed 'pdata->res_ops' could be null (see line 609)
drivers/pci/controller/dwc/pci-exynos.c:655 exynos_pcie_probe() warn: missing error code 'ret'

vim +621 drivers/pci/controller/dwc/pci-exynos.c

b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  557  
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  558  static int exynos_pcie_probe(struct platform_device *pdev)
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  559  {
fae68d690df573 drivers/pci/host/pci-exynos.c           Bjorn Helgaas      2016-10-06  560  	struct device *dev = &pdev->dev;
4e0a90b381bd8b drivers/pci/host/pci-exynos.c           Jaehoon Chung      2017-01-16  561  	struct exynos_pcie *ep;
17b11323a8be40 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  562  	const struct samsung_pcie_pdata *pdata;
fae68d690df573 drivers/pci/host/pci-exynos.c           Bjorn Helgaas      2016-10-06  563  	struct device_node *np = dev->of_node;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  564  	int ret;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  565  
4e0a90b381bd8b drivers/pci/host/pci-exynos.c           Jaehoon Chung      2017-01-16  566  	ep = devm_kzalloc(dev, sizeof(*ep), GFP_KERNEL);
4e0a90b381bd8b drivers/pci/host/pci-exynos.c           Jaehoon Chung      2017-01-16  567  	if (!ep)
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  568  		return -ENOMEM;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  569  
17b11323a8be40 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  570  	pdata = of_device_get_match_data(dev);
17b11323a8be40 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  571  
17b11323a8be40 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  572  	ep->pdata = pdata;
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  573  	ep->pci.dev = dev;
17b11323a8be40 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  574  	ep->pci.ops = pdata->dwc_ops;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  575  
e7cd7ef58e1fed drivers/pci/host/pci-exynos.c           Jaehoon Chung      2017-02-13  576  	ep->phy = devm_of_phy_get(dev, np, NULL);
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  577  	if (IS_ERR(ep->phy))
e7cd7ef58e1fed drivers/pci/host/pci-exynos.c           Jaehoon Chung      2017-02-13  578  		return PTR_ERR(ep->phy);
83f4f3f63be2b2 drivers/pci/dwc/pci-exynos.c            Jaehoon Chung      2017-12-27  579  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  580  	if (ep->pdata->soc_variant == FSD) {
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  581  		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  582  		if (ret)
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  583  			return ret;
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  584  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  585  		ep->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  586  				"samsung,syscon-pcie");
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  587  		if (IS_ERR(ep->sysreg)) {
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  588  			dev_err(dev, "sysreg regmap lookup failed.\n");
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  589  			return PTR_ERR(ep->sysreg);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  590  		}
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  591  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  592  		ret = of_property_read_u32_index(dev->of_node, "samsung,syscon-pcie", 1,
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  593  						 &ep->sysreg_offset);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  594  		if (ret) {
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  595  			dev_err(dev, "couldn't get the register offset for syscon!\n");
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  596  			return ret;
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  597  		}
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  598  	}
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  599  
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  600  	/* External Local Bus interface (ELBI) registers */
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  601  	ep->elbi_base = devm_platform_ioremap_resource_byname(pdev, "elbi");
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  602  	if (IS_ERR(ep->elbi_base))
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  603  		return PTR_ERR(ep->elbi_base);
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  604  
10106d5c1f9cee drivers/pci/controller/dwc/pci-exynos.c Cristian Ciocaltea 2024-12-17  605  	ret = devm_clk_bulk_get_all_enabled(dev, &ep->clks);
6b11143f9344dd drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2024-02-20  606  	if (ret < 0)
6b11143f9344dd drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2024-02-20  607  		return ret;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  608  
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25 @609  	if (pdata->res_ops && pdata->res_ops->init_regulator) {
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  610  		ret = ep->pdata->res_ops->init_regulator(ep);
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  611  		if (ret)
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  612  			return ret;
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  613  	}
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  614  
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  615  	ret = samsung_regulator_enable(ep);
3278478084747c drivers/pci/host/pci-exynos.c           Niyas Ahmed S T    2017-02-01  616  	if (ret)
3278478084747c drivers/pci/host/pci-exynos.c           Niyas Ahmed S T    2017-02-01  617  		return ret;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  618  
b2e6d3055d5545 drivers/pci/dwc/pci-exynos.c            Bjorn Helgaas      2017-02-21  619  	platform_set_drvdata(pdev, ep);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  620  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25 @621  	if (pdata->res_ops->set_device_mode)
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  622  		pdata->res_ops->set_device_mode(ep);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  623  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  624  	switch (ep->pdata->device_mode) {
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  625  	case DW_PCIE_RC_TYPE:
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  626  		ret = samsung_irq_init(ep, pdev);
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  627  		if (ret)
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  628  			goto fail_regulator;
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  629  
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  630  		ep->pci.pp.ops = pdata->host_ops;
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  631  
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  632  		ret = dw_pcie_host_init(&ep->pci.pp);
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  633  		if (ret < 0)
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  634  			goto fail_phy_init;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  635  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  636  		break;
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  637  	case DW_PCIE_EP_TYPE:
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  638  		phy_init(ep->phy);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  639  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  640  		ep->pci.ep.ops = pdata->ep_ops;
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  641  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  642  		ret = dw_pcie_ep_init(&ep->pci.ep);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  643  		if (ret < 0)
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  644  			goto fail_phy_init;
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  645  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  646  		ret = dw_pcie_ep_init_registers(&ep->pci.ep);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  647  		if (ret)
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  648  			goto fail_phy_init;
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  649  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  650  		pci_epc_init_notify(ep->pci.ep.epc);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  651  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  652  		break;
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  653  	default:
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  654  		dev_err(dev, "invalid device type\n");
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25 @655  		goto fail_phy_init;
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  656  	}
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  657  
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  658  	return 0;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  659  
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  660  fail_phy_init:
e7cd7ef58e1fed drivers/pci/host/pci-exynos.c           Jaehoon Chung      2017-02-13  661  	phy_exit(ep->phy);
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  662  fail_regulator:
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  663  	samsung_regulator_disable(ep);
e7cd7ef58e1fed drivers/pci/host/pci-exynos.c           Jaehoon Chung      2017-02-13  664  
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  665  	return ret;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  666  }
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  667  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
