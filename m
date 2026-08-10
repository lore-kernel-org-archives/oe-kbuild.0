Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F22D738A
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Aug 2026 01:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786326593; cv=none; b=G/0nU6AF88TWvM7L4GQ6KU+HbitLBVyFOVRTFSZM3R0KR2lSImtcYa3urXQsei4Aoem9NmTKmK47RAXJ2sqT83nXT/u3QXiY7YSsCjPfhj0Zx+LAJnYhbSFMm/ksstmnG3SWRo+RC6A3ITMncvM/vRJPbjuXGCg6gYRoZjOfrjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786326593; c=relaxed/simple;
	bh=ZaB4H7/MeAVYKBiSfqZTDZ3P8EaEz5ZRh3ytpfysg4g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vEQDmY46eQpmKTnf/2ew1kOD5VMhPvKL0Y/mXZCc7OTsldVJCpfGc0X/RWKswS5njOlJM1tXa4FXAAmYJeOgJIaFV4HAWFCVHlt7J5zmsGYsm1iWEXlSn5hBGI3qwsA061AxR6xAdk/pHuhbWfDmzPWPYBYWd7c224Ro0gE+QGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8QhClqU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8QhClqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786326590; x=1817862590;
  h=date:from:to:cc:subject:message-id;
  bh=ZaB4H7/MeAVYKBiSfqZTDZ3P8EaEz5ZRh3ytpfysg4g=;
  b=Z8QhClqUcgB05ym5V1iHEmGAppMaJHIlhbX6P3tM1+qj+RGZcU/pr2Ek
   ff4sKaH46VZzoEpmxFYFODDTnflbqFONWx7DhV7BicdKPfN6k6QZJVJ5+
   v7RK4TdXZkdDATADDaTRYgMbfaibniwKkDemG89Rr0RmKn8FylV2mGUPU
   dUZHultB1FMr3Njfe6cmxwd1GKB6rYE/G4Gd2BLxvORxKsYqJ5rx8tjFV
   Kl+b+G/KbT1Rfsd0JRaxu7KEuWW/cDHBCCmQ22pASstD8qqTvULTi4WWP
   OFNKI2mwYOfBrCEZr7u54puX0QvZgTQ/5VSWxy9aKWRz/YXKKod9tb6am
   Q==;
X-CSE-ConnectionGUID: 0rdEZjjeQcuUK+/uxqWikg==
X-CSE-MsgGUID: TyTerMIjRV25eo3MWoACXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97433027"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="97433027"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 18:49:47 -0700
X-CSE-ConnectionGUID: 31nWy1g7Q8OODS3pbTyOBQ==
X-CSE-MsgGUID: eD5QFX83SmyUU2mDsoaNng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="261159215"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Aug 2026 18:49:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtF95-00000000MX7-14x6;
	Mon, 10 Aug 2026 01:49:43 +0000
Date: Mon, 10 Aug 2026 09:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6248/13846]
 drivers/pci/controller/dwc/pci-imx6.c:1973 imx_pcie_probe() warn: missing
 unwind goto?
Message-ID: <202608100834.l0HO9Onh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Richard Zhu <hongxing.zhu@nxp.com>
CC: Manivannan Sadhasivam <mani@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: c2b9620359b759d2c73be47689b3a344cb4e091b [6248/13846] PCI: imx6: Add runtime PM support for i.MX95
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: sparc-randconfig-r072-20260809 (https://download.01.org/0day-ci/archive/20260810/202608100834.l0HO9Onh-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608100834.l0HO9Onh-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pci-imx6.c:1973 imx_pcie_probe() warn: missing unwind goto?

vim +1973 drivers/pci/controller/dwc/pci-imx6.c

0ee2c1f2429f74 drivers/pci/controller/dwc/pci-imx6.c Leonard Crestez        2018-08-27  1781  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1782  static int imx_pcie_probe(struct platform_device *pdev)
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1783  {
13957652f7242a drivers/pci/host/pci-imx6.c           Bjorn Helgaas          2016-10-06  1784  	struct device *dev = &pdev->dev;
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1785  	struct dw_pcie *pci;
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1786  	struct imx_pcie *imx_pcie;
13957652f7242a drivers/pci/host/pci-imx6.c           Bjorn Helgaas          2016-10-06  1787  	struct device_node *node = dev->of_node;
d8574ce57d760a drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-12-11  1788  	int i, ret, domain;
75cb8d20c112ab drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2018-12-21  1789  	u16 val;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1790  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1791  	imx_pcie = devm_kzalloc(dev, sizeof(*imx_pcie), GFP_KERNEL);
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1792  	if (!imx_pcie)
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1793  		return -ENOMEM;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1794  
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1795  	pci = devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1796  	if (!pci)
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1797  		return -ENOMEM;
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1798  
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1799  	pci->dev = dev;
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1800  	pci->ops = &dw_pcie_ops;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1801  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1802  	imx_pcie->pci = pci;
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1803  	imx_pcie->drvdata = of_device_get_match_data(dev);
e3c06cd063d69d drivers/pci/host/pci-imx6.c           Christoph Fritz        2016-04-05  1804  
ce4c4301728541 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-01-14  1805  	mutex_init(&imx_pcie->lock);
ce4c4301728541 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-01-14  1806  
a528d1a725974d drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-11-26  1807  	if (imx_pcie->drvdata->ops)
a528d1a725974d drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-11-26  1808  		pci->pp.ops = imx_pcie->drvdata->ops;
a528d1a725974d drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-11-26  1809  	else
a528d1a725974d drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-11-26  1810  		pci->pp.ops = &imx_pcie_host_dw_pme_ops;
a528d1a725974d drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-11-26  1811  
1df82ec4660099 drivers/pci/controller/dwc/pci-imx6.c Trent Piepho           2019-02-05  1812  	/* Find the PHY if one is defined, only imx7d uses it */
3b55079d638780 drivers/pci/controller/dwc/pci-imx6.c Felix Gu               2026-01-24  1813  	struct device_node *np __free(device_node) =
3b55079d638780 drivers/pci/controller/dwc/pci-imx6.c Felix Gu               2026-01-24  1814  		of_parse_phandle(node, "fsl,imx7d-pcie-phy", 0);
1df82ec4660099 drivers/pci/controller/dwc/pci-imx6.c Trent Piepho           2019-02-05  1815  	if (np) {
1df82ec4660099 drivers/pci/controller/dwc/pci-imx6.c Trent Piepho           2019-02-05  1816  		struct resource res;
1df82ec4660099 drivers/pci/controller/dwc/pci-imx6.c Trent Piepho           2019-02-05  1817  
1df82ec4660099 drivers/pci/controller/dwc/pci-imx6.c Trent Piepho           2019-02-05  1818  		ret = of_address_to_resource(np, 0, &res);
1df82ec4660099 drivers/pci/controller/dwc/pci-imx6.c Trent Piepho           2019-02-05  1819  		if (ret) {
1df82ec4660099 drivers/pci/controller/dwc/pci-imx6.c Trent Piepho           2019-02-05  1820  			dev_err(dev, "Unable to map PCIe PHY\n");
1df82ec4660099 drivers/pci/controller/dwc/pci-imx6.c Trent Piepho           2019-02-05  1821  			return ret;
1df82ec4660099 drivers/pci/controller/dwc/pci-imx6.c Trent Piepho           2019-02-05  1822  		}
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1823  		imx_pcie->phy_base = devm_ioremap_resource(dev, &res);
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1824  		if (IS_ERR(imx_pcie->phy_base))
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1825  			return PTR_ERR(imx_pcie->phy_base);
1df82ec4660099 drivers/pci/controller/dwc/pci-imx6.c Trent Piepho           2019-02-05  1826  	}
e3c06cd063d69d drivers/pci/host/pci-imx6.c           Christoph Fritz        2016-04-05  1827  
6a40185838759c drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1828  	/* Fetch clocks */
f6a1fdfc78e203 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-02-26  1829  	imx_pcie->num_clks = devm_clk_bulk_get_all(dev, &imx_pcie->clks);
f6a1fdfc78e203 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-02-26  1830  	if (imx_pcie->num_clks < 0)
f6a1fdfc78e203 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-02-26  1831  		return dev_err_probe(dev, imx_pcie->num_clks,
f6a1fdfc78e203 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-02-26  1832  				     "failed to get clocks\n");
d8574ce57d760a drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-12-11  1833  	for (i = 0; i < imx_pcie->num_clks; i++)
d8574ce57d760a drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-12-11  1834  		if (strncmp(imx_pcie->clks[i].id, "extref", 6) == 0)
d8574ce57d760a drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-12-11  1835  			imx_pcie->enable_ext_refclk = true;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1836  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1837  	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_PHYDRV)) {
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1838  		imx_pcie->phy = devm_phy_get(dev, "pcie-phy");
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1839  		if (IS_ERR(imx_pcie->phy))
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1840  			return dev_err_probe(dev, PTR_ERR(imx_pcie->phy),
4e37c2f48712d5 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1841  					     "failed to get pcie phy\n");
4e37c2f48712d5 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1842  	}
4e37c2f48712d5 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1843  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1844  	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_APP_RESET)) {
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1845  		imx_pcie->apps_reset = devm_reset_control_get_exclusive(dev, "apps");
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1846  		if (IS_ERR(imx_pcie->apps_reset))
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1847  			return dev_err_probe(dev, PTR_ERR(imx_pcie->apps_reset),
0c9651c21f2a09 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1848  					     "failed to get pcie apps reset control\n");
0c9651c21f2a09 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1849  	}
0c9651c21f2a09 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1850  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1851  	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_PHY_RESET)) {
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1852  		imx_pcie->pciephy_reset = devm_reset_control_get_exclusive(dev, "pciephy");
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1853  		if (IS_ERR(imx_pcie->pciephy_reset))
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1854  			return dev_err_probe(dev, PTR_ERR(imx_pcie->pciephy_reset),
0c9651c21f2a09 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1855  					     "Failed to get PCIEPHY reset control\n");
0c9651c21f2a09 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1856  	}
0c9651c21f2a09 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1857  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1858  	switch (imx_pcie->drvdata->variant) {
2d8ed461dbc9bc drivers/pci/controller/dwc/pci-imx6.c Andrey Smirnov         2019-02-01  1859  	case IMX8MQ:
530ba41250b69d drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2023-01-16  1860  	case IMX8MQ_EP:
81d1d214e171c9 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-02-26  1861  		domain = of_get_pci_domain_nr(node);
81d1d214e171c9 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-02-26  1862  		if (domain < 0 || domain > 1)
81d1d214e171c9 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-02-26  1863  			return dev_err_probe(dev, -ENODEV, "no \"linux,pci-domain\" property in devicetree\n");
81d1d214e171c9 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-02-26  1864  
81d1d214e171c9 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-02-26  1865  		imx_pcie->controller_id = domain;
9b3fe6796d7c0e drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1866  		break;
9b3fe6796d7c0e drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1867  	default:
9b3fe6796d7c0e drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1868  		break;
e3c06cd063d69d drivers/pci/host/pci-imx6.c           Christoph Fritz        2016-04-05  1869  	}
e3c06cd063d69d drivers/pci/host/pci-imx6.c           Christoph Fritz        2016-04-05  1870  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1871  	if (imx_pcie->drvdata->gpr) {
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1872  	/* Grab GPR config register range */
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1873  		imx_pcie->iomuxc_gpr =
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1874  			 syscon_regmap_lookup_by_compatible(imx_pcie->drvdata->gpr);
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1875  		if (IS_ERR(imx_pcie->iomuxc_gpr))
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1876  			return dev_err_probe(dev, PTR_ERR(imx_pcie->iomuxc_gpr),
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1877  					     "unable to find iomuxc registers\n");
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1878  	}
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1879  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1880  	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_SERDES)) {
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1881  		void __iomem *off = devm_platform_ioremap_resource_byname(pdev, "app");
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1882  
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1883  		if (IS_ERR(off))
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1884  			return dev_err_probe(dev, PTR_ERR(off),
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1885  					     "unable to find serdes registers\n");
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1886  
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1887  		static const struct regmap_config regmap_config = {
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1888  			.reg_bits = 32,
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1889  			.val_bits = 32,
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1890  			.reg_stride = 4,
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1891  		};
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1892  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1893  		imx_pcie->iomuxc_gpr = devm_regmap_init_mmio(dev, off, &regmap_config);
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1894  		if (IS_ERR(imx_pcie->iomuxc_gpr))
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1895  			return dev_err_probe(dev, PTR_ERR(imx_pcie->iomuxc_gpr),
f5c04da3a12b0a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1896  					     "unable to find iomuxc registers\n");
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1897  	}
28e3abe591e227 drivers/pci/host/pci-imx6.c           Justin Waters          2016-01-15  1898  
28e3abe591e227 drivers/pci/host/pci-imx6.c           Justin Waters          2016-01-15  1899  	/* Grab PCIe PHY Tx Settings */
28e3abe591e227 drivers/pci/host/pci-imx6.c           Justin Waters          2016-01-15  1900  	if (of_property_read_u32(node, "fsl,tx-deemph-gen1",
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1901  				 &imx_pcie->tx_deemph_gen1))
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1902  		imx_pcie->tx_deemph_gen1 = 0;
28e3abe591e227 drivers/pci/host/pci-imx6.c           Justin Waters          2016-01-15  1903  
28e3abe591e227 drivers/pci/host/pci-imx6.c           Justin Waters          2016-01-15  1904  	if (of_property_read_u32(node, "fsl,tx-deemph-gen2-3p5db",
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1905  				 &imx_pcie->tx_deemph_gen2_3p5db))
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1906  		imx_pcie->tx_deemph_gen2_3p5db = 0;
28e3abe591e227 drivers/pci/host/pci-imx6.c           Justin Waters          2016-01-15  1907  
28e3abe591e227 drivers/pci/host/pci-imx6.c           Justin Waters          2016-01-15  1908  	if (of_property_read_u32(node, "fsl,tx-deemph-gen2-6db",
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1909  				 &imx_pcie->tx_deemph_gen2_6db))
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1910  		imx_pcie->tx_deemph_gen2_6db = 20;
28e3abe591e227 drivers/pci/host/pci-imx6.c           Justin Waters          2016-01-15  1911  
28e3abe591e227 drivers/pci/host/pci-imx6.c           Justin Waters          2016-01-15  1912  	if (of_property_read_u32(node, "fsl,tx-swing-full",
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1913  				 &imx_pcie->tx_swing_full))
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1914  		imx_pcie->tx_swing_full = 127;
28e3abe591e227 drivers/pci/host/pci-imx6.c           Justin Waters          2016-01-15  1915  
28e3abe591e227 drivers/pci/host/pci-imx6.c           Justin Waters          2016-01-15  1916  	if (of_property_read_u32(node, "fsl,tx-swing-low",
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1917  				 &imx_pcie->tx_swing_low))
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1918  		imx_pcie->tx_swing_low = 127;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1919  
a5fcec480f25eb drivers/pci/host/pci-imx6.c           Tim Harvey             2016-04-19  1920  	/* Limit link speed */
2cebf68a24abb0 drivers/pci/controller/dwc/pci-imx6.c Manivannan Sadhasivam  2024-09-11  1921  	pci->max_link_speed = 1;
2cebf68a24abb0 drivers/pci/controller/dwc/pci-imx6.c Manivannan Sadhasivam  2024-09-11  1922  	of_property_read_u32(node, "fsl,max-link-speed", &pci->max_link_speed);
a152a90f539095 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-01-06  1923  	imx_pcie->supports_clkreq = of_property_read_bool(node, "supports-clkreq");
a5fcec480f25eb drivers/pci/host/pci-imx6.c           Tim Harvey             2016-04-19  1924  
610fa91d9863d9 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-04-22  1925  	imx_pcie->vpcie_aux = devm_regulator_get_optional(&pdev->dev,
610fa91d9863d9 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-04-22  1926  							  "vpcie3v3aux");
610fa91d9863d9 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-04-22  1927  	if (IS_ERR(imx_pcie->vpcie_aux)) {
610fa91d9863d9 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-04-22  1928  		if (PTR_ERR(imx_pcie->vpcie_aux) != -ENODEV)
610fa91d9863d9 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-04-22  1929  			return PTR_ERR(imx_pcie->vpcie_aux);
610fa91d9863d9 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-04-22  1930  		imx_pcie->vpcie_aux = NULL;
610fa91d9863d9 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-04-22  1931  	}
c221cbf8dc547e drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-08-20  1932  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1933  	imx_pcie->vpcie = devm_regulator_get_optional(&pdev->dev, "vpcie");
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1934  	if (IS_ERR(imx_pcie->vpcie)) {
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1935  		if (PTR_ERR(imx_pcie->vpcie) != -ENODEV)
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1936  			return PTR_ERR(imx_pcie->vpcie);
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1937  		imx_pcie->vpcie = NULL;
c26ebe98a10347 drivers/pci/dwc/pci-imx6.c            Quentin Schulz         2017-06-08  1938  	}
c26ebe98a10347 drivers/pci/dwc/pci-imx6.c            Quentin Schulz         2017-06-08  1939  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1940  	imx_pcie->vph = devm_regulator_get_optional(&pdev->dev, "vph");
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1941  	if (IS_ERR(imx_pcie->vph)) {
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1942  		if (PTR_ERR(imx_pcie->vph) != -ENODEV)
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1943  			return PTR_ERR(imx_pcie->vph);
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1944  		imx_pcie->vph = NULL;
d2ce69ca251690 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2021-06-04  1945  	}
d2ce69ca251690 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2021-06-04  1946  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1947  	platform_set_drvdata(pdev, imx_pcie);
9bcf0a6fdc5062 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1948  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1949  	ret = imx_pcie_attach_pd(dev);
3f7cceeab895fc drivers/pci/controller/dwc/pci-imx6.c Leonard Crestez        2018-10-08  1950  	if (ret)
3f7cceeab895fc drivers/pci/controller/dwc/pci-imx6.c Leonard Crestez        2018-10-08  1951  		return ret;
3f7cceeab895fc drivers/pci/controller/dwc/pci-imx6.c Leonard Crestez        2018-10-08  1952  
2c5768344f88b8 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-07-13  1953  	ret = pci_pwrctrl_create_devices(dev);
2c5768344f88b8 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-07-13  1954  	if (ret)
2c5768344f88b8 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-07-13  1955  		return dev_err_probe(dev, ret, "failed to create pwrctrl devices\n");
2c5768344f88b8 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-07-13  1956  
b9812179f60159 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-03-15  1957  	pci->use_parent_dt_ranges = true;
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1958  	if (imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE) {
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1959  		ret = imx_add_pcie_ep(imx_pcie, pdev);
75c2f26da03f93 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2023-01-16  1960  		if (ret < 0)
2c5768344f88b8 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-07-13  1961  			goto err_pwrctrl_destroy;
234b9258c6907c drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-07-10  1962  
234b9258c6907c drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-07-10  1963  		/*
234b9258c6907c drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-07-10  1964  		 * FIXME: Only single Device (EPF) is supported due to the
234b9258c6907c drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-07-10  1965  		 * Endpoint framework limitation.
234b9258c6907c drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-07-10  1966  		 */
234b9258c6907c drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-07-10  1967  		imx_pcie_add_lut_by_rid(imx_pcie, 0);
75c2f26da03f93 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2023-01-16  1968  	} else {
c2b9620359b759 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-07-15  1969  		if (imx_pcie->drvdata->flags & IMX_PCIE_FLAG_PM_RUNTIME) {
c2b9620359b759 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-07-15  1970  			pm_runtime_no_callbacks(dev);
c2b9620359b759 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-07-15  1971  			ret = devm_pm_runtime_set_active_enabled(dev);
c2b9620359b759 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-07-15  1972  			if (ret < 0)
c2b9620359b759 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-07-15 @1973  				return ret;
c2b9620359b759 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-07-15  1974  		}
c2b9620359b759 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-07-15  1975  
58a17b2647ba5a drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-01-14  1976  		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
58a17b2647ba5a drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-01-14  1977  			pci->pp.skip_l23_ready = true;
3a4e8302e72f83 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-03-31  1978  		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_KEEP_MSI_CAP))
3a4e8302e72f83 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-03-31  1979  			pci->pp.keep_rp_msi_en = true;
a528d1a725974d drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-11-26  1980  		pci->pp.use_atu_msg = true;
60f5b73fa0f298 drivers/pci/controller/dwc/pci-imx6.c Rob Herring            2020-11-05  1981  		ret = dw_pcie_host_init(&pci->pp);
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1982  		if (ret < 0)
2c5768344f88b8 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-07-13  1983  			goto err_pwrctrl_destroy;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1984  
75cb8d20c112ab drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2018-12-21  1985  		if (pci_msi_enabled()) {
201a8df899525b drivers/pci/controller/dwc/pci-imx6.c Rob Herring            2020-08-20  1986  			u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_MSI);
75c2f26da03f93 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2023-01-16  1987  
201a8df899525b drivers/pci/controller/dwc/pci-imx6.c Rob Herring            2020-08-20  1988  			val = dw_pcie_readw_dbi(pci, offset + PCI_MSI_FLAGS);
75cb8d20c112ab drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2018-12-21  1989  			val |= PCI_MSI_FLAGS_ENABLE;
201a8df899525b drivers/pci/controller/dwc/pci-imx6.c Rob Herring            2020-08-20  1990  			dw_pcie_writew_dbi(pci, offset + PCI_MSI_FLAGS, val);
75cb8d20c112ab drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2018-12-21  1991  		}
75c2f26da03f93 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2023-01-16  1992  	}
75cb8d20c112ab drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2018-12-21  1993  
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1994  	return 0;
2c5768344f88b8 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-07-13  1995  
2c5768344f88b8 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-07-13  1996  err_pwrctrl_destroy:
2c5768344f88b8 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-07-13  1997  	if (ret != -EPROBE_DEFER)
2c5768344f88b8 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-07-13  1998  		pci_pwrctrl_destroy_devices(dev);
2c5768344f88b8 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-07-13  1999  	return ret;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  2000  }
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  2001  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
