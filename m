Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC7C48BD2D
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997787; cv=none; b=fB9bNf2OhTqktFG4Oz7G9zThCwuhHXiEJwkZ8LD/XfOvBfPreZ1W031MqGO1ZXatyWHsTv+IQb7z7JMQjtuEKtzcy0Z/NyYvvY+8EkUx9nqEgJhnBOLzCHMzKR/bZreUxZNlALvTLWLh59/vtoUdkyQUN1eDSHwBrQZU3r4Kog4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997787; c=relaxed/simple;
	bh=3H0+g5t32nLdvlanHKqdtxXs/jitv7JM5P+QY6OlGUY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TnSzj/45zkq3mX9wlnxdg2qSkAx4YCDvsaogoq5GUtzAcgH4lAw2emX2xnCCtUCFRn3wPkilS7+KGpH/0fohk/IaeHLRMU3W0i7KpgUAuK2eGnnXjPMO/T93RMZz2Nx/SNJvXz+ICbP3cJepFKNEKpI81ofytgYpYfoeHBvwVWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DANml91O; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DANml91O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777997782; x=1809533782;
  h=date:from:to:cc:subject:message-id;
  bh=3H0+g5t32nLdvlanHKqdtxXs/jitv7JM5P+QY6OlGUY=;
  b=DANml91Oy/+XrfCPGAcJYgi+kuewBnu063tQO9av4sg6j5wXlD/0y0WO
   nrkKJh81HLkeyULn+4jmOfqB0zUZ61ZdndrGjhLVE7mqXb7Fp7R5bYUMh
   lRLlR3BzUjgUBukmf+dt2c2Z8RXllzx5RBjlvMRfErBtRchx4kN8ZYpHr
   hahA/itiB3sX2ldSLs5ZvghRnbGtuNhqqm0djcyEGxSZqoiVemEdoTrUv
   aFEO0VvcFYZLe/IIcFbmz9vXaBfm+O4QxVA1q+Jvz/PlMvXiidyBD1aBx
   8qr5PnmGuvTDP2fRlykiBzf4teWU//9W3gz14XwdpUo4lK/Vs1HrgZ+Ab
   Q==;
X-CSE-ConnectionGUID: yR5wE3nLTQSifCTjCf6z+Q==
X-CSE-MsgGUID: VLGKL4iTT+qdpE+73bwVBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104322506"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="104322506"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 09:16:08 -0700
X-CSE-ConnectionGUID: 41tgFbHZSVyhCPQRPIVoPQ==
X-CSE-MsgGUID: nE5rY8pZQI2hZGGKM2wfVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="236114762"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 May 2026 09:16:08 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKIRI-000000000HR-43Ap;
	Tue, 05 May 2026 16:16:04 +0000
Date: Wed, 06 May 2026 00:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pci/controller/dwc/pci-imx6.c:1322:27: error:
 'struct pci_host_bridge' has no member named 'reset_root_port'
Message-ID: <202605060059.EPF1gapd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Richard-Zhu/dt-bindings-PCI-imx6q-pcie-Add-intr-aer-and-pme-interrupts/20260505-192313, commit: c286a71d965c9278bd3e04472283bbe6f36de9e0"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Richard Zhu <hongxing.zhu@nxp.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Richard-Zhu/dt-bindings-PCI-imx6q-pcie-Add-intr-aer-and-pme-interrupts/20260505-192313
head:   c286a71d965c9278bd3e04472283bbe6f36de9e0
commit: c286a71d965c9278bd3e04472283bbe6f36de9e0 PCI: imx6: Add root port reset to support link recovery
date:   5 hours ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: csky-randconfig-001-20260505 (https://download.01.org/0day-ci/archive/20260506/202605060059.EPF1gapd-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060059.EPF1gapd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605060059.EPF1gapd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/dwc/pci-imx6.c: In function 'imx_pcie_host_init':
>> drivers/pci/controller/dwc/pci-imx6.c:1322:27: error: 'struct pci_host_bridge' has no member named 'reset_root_port'
    1322 |                 pp->bridge->reset_root_port = imx_pcie_reset_root_port;
         |                           ^~
   drivers/pci/controller/dwc/pci-imx6.c: In function 'imx_pcie_lnk_irq_thread':
>> drivers/pci/controller/dwc/pci-imx6.c:1686:25: error: implicit declaration of function 'pci_host_handle_link_down' [-Wimplicit-function-declaration]
    1686 |                         pci_host_handle_link_down(port);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +1322 drivers/pci/controller/dwc/pci-imx6.c

180ea823bb45eb7 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-03-06  1245  
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1246  static int imx_pcie_host_init(struct dw_pcie_rp *pp)
fa33a6d87eac1ab drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1247  {
442ec4c04d1235f drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1248  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
9751f65db025a19 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1249  	struct device *dev = pci->dev;
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1250  	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
9751f65db025a19 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1251  	int ret;
bb38919ec56e075 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1252  
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1253  	if (imx_pcie->vpcie) {
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1254  		ret = regulator_enable(imx_pcie->vpcie);
f0691e326b270d8 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1255  		if (ret) {
f0691e326b270d8 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1256  			dev_err(dev, "failed to enable vpcie regulator: %d\n",
f0691e326b270d8 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1257  				ret);
f0691e326b270d8 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1258  			return ret;
f0691e326b270d8 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1259  		}
f0691e326b270d8 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1260  	}
f0691e326b270d8 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1261  
ce4c4301728541d drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-01-14  1262  	if (pp->bridge && imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT)) {
ce4c4301728541d drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-01-14  1263  		pp->bridge->enable_device = imx_pcie_enable_device;
ce4c4301728541d drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-01-14  1264  		pp->bridge->disable_device = imx_pcie_disable_device;
ce4c4301728541d drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-01-14  1265  	}
ce4c4301728541d drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-01-14  1266  
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1267  	imx_pcie_assert_core_reset(imx_pcie);
180ea823bb45eb7 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-03-06  1268  	imx_pcie_assert_perst(imx_pcie, true);
21ad80b0e0ce5f2 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1269  
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1270  	if (imx_pcie->drvdata->init_phy)
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1271  		imx_pcie->drvdata->init_phy(imx_pcie);
21ad80b0e0ce5f2 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1272  
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1273  	imx_pcie_configure_type(imx_pcie);
cf236e0c0d59b36 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1274  
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1275  	ret = imx_pcie_clk_enable(imx_pcie);
835a345b18b013c drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1276  	if (ret) {
835a345b18b013c drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1277  		dev_err(dev, "unable to enable pcie clocks: %d\n", ret);
835a345b18b013c drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1278  		goto err_reg_disable;
835a345b18b013c drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1279  	}
835a345b18b013c drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1280  
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1281  	if (imx_pcie->phy) {
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1282  		ret = phy_init(imx_pcie->phy);
cf236e0c0d59b36 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1283  		if (ret) {
cf236e0c0d59b36 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1284  			dev_err(dev, "pcie PHY power up failed\n");
835a345b18b013c drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1285  			goto err_clk_disable;
cf236e0c0d59b36 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1286  		}
cf236e0c0d59b36 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1287  
de22e20589b79f3 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-11-19  1288  		ret = phy_set_mode_ext(imx_pcie->phy, PHY_MODE_PCIE,
de22e20589b79f3 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-11-19  1289  				       imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE ?
de22e20589b79f3 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-11-19  1290  						PHY_MODE_PCIE_EP : PHY_MODE_PCIE_RC);
8026f2d8e8a95a6 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1291  		if (ret) {
8026f2d8e8a95a6 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1292  			dev_err(dev, "unable to set PCIe PHY mode\n");
8026f2d8e8a95a6 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1293  			goto err_phy_exit;
8026f2d8e8a95a6 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1294  		}
8026f2d8e8a95a6 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1295  
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1296  		ret = phy_power_on(imx_pcie->phy);
cf236e0c0d59b36 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1297  		if (ret) {
cf236e0c0d59b36 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1298  			dev_err(dev, "waiting for PHY ready timeout!\n");
5b04d44d5c74e4d drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1299  			goto err_phy_exit;
cf236e0c0d59b36 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1300  		}
cf236e0c0d59b36 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1301  	}
ae6b9a65af48014 drivers/pci/controller/dwc/pci-imx6.c Sascha Hauer           2022-11-01  1302  
d31eb217425591e drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-07-09  1303  	/* Make sure that PCIe LTSSM is cleared */
d31eb217425591e drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-07-09  1304  	imx_pcie_ltssm_disable(dev);
d31eb217425591e drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-07-09  1305  
192b8a1bf81c178 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-03-06  1306  	imx_pcie_deassert_core_reset(imx_pcie);
180ea823bb45eb7 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-03-06  1307  	imx_pcie_assert_perst(imx_pcie, false);
ae6b9a65af48014 drivers/pci/controller/dwc/pci-imx6.c Sascha Hauer           2022-11-01  1308  
047e8b6b3bc3e6b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-04-16  1309  	if (imx_pcie->drvdata->wait_pll_lock) {
047e8b6b3bc3e6b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-04-16  1310  		ret = imx_pcie->drvdata->wait_pll_lock(imx_pcie);
047e8b6b3bc3e6b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-04-16  1311  		if (ret < 0)
047e8b6b3bc3e6b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-04-16  1312  			goto err_phy_off;
047e8b6b3bc3e6b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-04-16  1313  	}
047e8b6b3bc3e6b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-04-16  1314  
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1315  	imx_setup_phy_mpll(imx_pcie);
4a301766f5263dd drivers/pci/dwc/pci-imx6.c            Bjorn Andersson        2017-07-15  1316  
c286a71d965c927 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30  1317  	/*
c286a71d965c927 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30  1318  	 * Callback invoked by PCI core when link down is detected and
c286a71d965c927 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30  1319  	 * recovery is needed.
c286a71d965c927 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30  1320  	 */
c286a71d965c927 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30  1321  	if (pp->bridge)
c286a71d965c927 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30 @1322  		pp->bridge->reset_root_port = imx_pcie_reset_root_port;
c286a71d965c927 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30  1323  
4a301766f5263dd drivers/pci/dwc/pci-imx6.c            Bjorn Andersson        2017-07-15  1324  	return 0;
f0691e326b270d8 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1325  
cf236e0c0d59b36 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1326  err_phy_off:
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1327  	phy_power_off(imx_pcie->phy);
5b04d44d5c74e4d drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1328  err_phy_exit:
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1329  	phy_exit(imx_pcie->phy);
835a345b18b013c drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1330  err_clk_disable:
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1331  	imx_pcie_clk_disable(imx_pcie);
f0691e326b270d8 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1332  err_reg_disable:
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1333  	if (imx_pcie->vpcie)
d657ea28d55037e drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1334  		regulator_disable(imx_pcie->vpcie);
f0691e326b270d8 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1335  	return ret;
bb38919ec56e075 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1336  }
bb38919ec56e075 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1337  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
