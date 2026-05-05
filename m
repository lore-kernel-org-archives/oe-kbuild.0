Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5484448B374
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004626; cv=none; b=BPfWJrzSoom0g71P0l/XZxNELWCUsIDBjGPf3VWVs8uleyy+1WW4Vftr12fi6aE7gerVx4M1L8/liJoBcdV+RKKmgHI6WSF7NSri2lvXGRpRRvRFgM11nyCmS4M+EaKITI5rr8c/lONXc+MguUhaw/7Gf3ZIo0SHzrVlGV/OIrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004626; c=relaxed/simple;
	bh=xdIqqtYx8lR8MpMZeVQnb4n4ksgObAcMmc05gRHici8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pXPBmoNDC3AKDPnVmjtxKKSiom6biY6xPej/qTOXKyjRfCoUiP/MEJSw33nxD2Hg2HPWEpZkTo2W67BHbdTRAe+gAX3TRMj8FuMZHOC2KQOahhSFddptUuJUSzArnI5GYZ7JQ3nQR0xuQza1FnSy/NKIzX1eSLkFqnTaL6mAvRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mf0OZY7w; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mf0OZY7w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778004623; x=1809540623;
  h=date:from:to:cc:subject:message-id;
  bh=xdIqqtYx8lR8MpMZeVQnb4n4ksgObAcMmc05gRHici8=;
  b=Mf0OZY7wwZA0yZmkJbgFAsIkDeCiuVHYxxZjRuoOjw8nqPjPrBwitYk+
   bmECmVtoAiEDBfFc22SRUWzxHfSJkZ3rF/6ROQB2OSbye89mbJ1OQrW5/
   ti+IRlIVBFDXq199Y6DI76LtMpCRjL2NF/rDx3aNxV84dK932/QdNkWIA
   MMwWK83P35SAgRplmh03K2S3w945hhqUsYlJ3DtFfprZaS06235pLsWdF
   PdHmllyQvrYRJdeNO56zqXKShatoQlG+nZXnIQRfbEiPPeY37V6jBPIH5
   Tuw3sD7/JJmxq+YKFHTXRoa5bzEJxllx9lyMGRsU+s2HUxHTM31Xnz4k2
   Q==;
X-CSE-ConnectionGUID: bk/oPnpnT+Sl8j2qXY+C7A==
X-CSE-MsgGUID: mAjDJmLfQ/KHJ1TaPD2D5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82495624"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="82495624"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 11:10:22 -0700
X-CSE-ConnectionGUID: 7aqev/r5RJm843WF5GclQw==
X-CSE-MsgGUID: pUlvjCe+TI6X2W51mqRzMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="229400555"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 May 2026 11:10:21 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKKDq-000000000Ln-3XeQ;
	Tue, 05 May 2026 18:10:18 +0000
Date: Wed, 06 May 2026 02:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pci/controller/dwc/pci-imx6.c:1322:15: error: no
 member named 'reset_root_port' in 'struct pci_host_bridge'
Message-ID: <202605060234.ujshB9ps-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Richard Zhu <hongxing.zhu@nxp.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Richard-Zhu/dt-bindings-PCI-imx6q-pcie-Add-intr-aer-and-pme-interrupts/20260505-192313
head:   c286a71d965c9278bd3e04472283bbe6f36de9e0
commit: c286a71d965c9278bd3e04472283bbe6f36de9e0 PCI: imx6: Add root port reset to support link recovery
date:   7 hours ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260506/202605060234.ujshB9ps-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060234.ujshB9ps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605060234.ujshB9ps-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pci-imx6.c:1322:15: error: no member named 'reset_root_port' in 'struct pci_host_bridge'
    1322 |                 pp->bridge->reset_root_port = imx_pcie_reset_root_port;
         |                 ~~~~~~~~~~  ^
>> drivers/pci/controller/dwc/pci-imx6.c:1686:4: error: call to undeclared function 'pci_host_handle_link_down'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1686 |                         pci_host_handle_link_down(port);
         |                         ^
   2 errors generated.


vim +1322 drivers/pci/controller/dwc/pci-imx6.c

180ea823bb45eb drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-03-06  1245  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1246  static int imx_pcie_host_init(struct dw_pcie_rp *pp)
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1247  {
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1248  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
9751f65db025a1 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1249  	struct device *dev = pci->dev;
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1250  	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
9751f65db025a1 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1251  	int ret;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1252  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1253  	if (imx_pcie->vpcie) {
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1254  		ret = regulator_enable(imx_pcie->vpcie);
f0691e326b270d drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1255  		if (ret) {
f0691e326b270d drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1256  			dev_err(dev, "failed to enable vpcie regulator: %d\n",
f0691e326b270d drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1257  				ret);
f0691e326b270d drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1258  			return ret;
f0691e326b270d drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1259  		}
f0691e326b270d drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1260  	}
f0691e326b270d drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1261  
ce4c4301728541 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-01-14  1262  	if (pp->bridge && imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT)) {
ce4c4301728541 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-01-14  1263  		pp->bridge->enable_device = imx_pcie_enable_device;
ce4c4301728541 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-01-14  1264  		pp->bridge->disable_device = imx_pcie_disable_device;
ce4c4301728541 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-01-14  1265  	}
ce4c4301728541 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2025-01-14  1266  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1267  	imx_pcie_assert_core_reset(imx_pcie);
180ea823bb45eb drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-03-06  1268  	imx_pcie_assert_perst(imx_pcie, true);
21ad80b0e0ce5f drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1269  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1270  	if (imx_pcie->drvdata->init_phy)
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1271  		imx_pcie->drvdata->init_phy(imx_pcie);
21ad80b0e0ce5f drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-02-20  1272  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1273  	imx_pcie_configure_type(imx_pcie);
cf236e0c0d59b3 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1274  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1275  	ret = imx_pcie_clk_enable(imx_pcie);
835a345b18b013 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1276  	if (ret) {
835a345b18b013 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1277  		dev_err(dev, "unable to enable pcie clocks: %d\n", ret);
835a345b18b013 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1278  		goto err_reg_disable;
835a345b18b013 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1279  	}
835a345b18b013 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1280  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1281  	if (imx_pcie->phy) {
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1282  		ret = phy_init(imx_pcie->phy);
cf236e0c0d59b3 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1283  		if (ret) {
cf236e0c0d59b3 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1284  			dev_err(dev, "pcie PHY power up failed\n");
835a345b18b013 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1285  			goto err_clk_disable;
cf236e0c0d59b3 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1286  		}
cf236e0c0d59b3 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1287  
de22e20589b79f drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-11-19  1288  		ret = phy_set_mode_ext(imx_pcie->phy, PHY_MODE_PCIE,
de22e20589b79f drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-11-19  1289  				       imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE ?
de22e20589b79f drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-11-19  1290  						PHY_MODE_PCIE_EP : PHY_MODE_PCIE_RC);
8026f2d8e8a95a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1291  		if (ret) {
8026f2d8e8a95a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1292  			dev_err(dev, "unable to set PCIe PHY mode\n");
8026f2d8e8a95a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1293  			goto err_phy_exit;
8026f2d8e8a95a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1294  		}
8026f2d8e8a95a drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1295  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1296  		ret = phy_power_on(imx_pcie->phy);
cf236e0c0d59b3 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1297  		if (ret) {
cf236e0c0d59b3 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1298  			dev_err(dev, "waiting for PHY ready timeout!\n");
5b04d44d5c74e4 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1299  			goto err_phy_exit;
cf236e0c0d59b3 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1300  		}
cf236e0c0d59b3 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1301  	}
ae6b9a65af4801 drivers/pci/controller/dwc/pci-imx6.c Sascha Hauer           2022-11-01  1302  
d31eb217425591 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-07-09  1303  	/* Make sure that PCIe LTSSM is cleared */
d31eb217425591 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-07-09  1304  	imx_pcie_ltssm_disable(dev);
d31eb217425591 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-07-09  1305  
192b8a1bf81c17 drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-03-06  1306  	imx_pcie_deassert_core_reset(imx_pcie);
180ea823bb45eb drivers/pci/controller/dwc/pci-imx6.c Sherry Sun             2026-03-06  1307  	imx_pcie_assert_perst(imx_pcie, false);
ae6b9a65af4801 drivers/pci/controller/dwc/pci-imx6.c Sascha Hauer           2022-11-01  1308  
047e8b6b3bc3e6 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-04-16  1309  	if (imx_pcie->drvdata->wait_pll_lock) {
047e8b6b3bc3e6 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-04-16  1310  		ret = imx_pcie->drvdata->wait_pll_lock(imx_pcie);
047e8b6b3bc3e6 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-04-16  1311  		if (ret < 0)
047e8b6b3bc3e6 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-04-16  1312  			goto err_phy_off;
047e8b6b3bc3e6 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-04-16  1313  	}
047e8b6b3bc3e6 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2025-04-16  1314  
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1315  	imx_setup_phy_mpll(imx_pcie);
4a301766f5263d drivers/pci/dwc/pci-imx6.c            Bjorn Andersson        2017-07-15  1316  
c286a71d965c92 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30  1317  	/*
c286a71d965c92 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30  1318  	 * Callback invoked by PCI core when link down is detected and
c286a71d965c92 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30  1319  	 * recovery is needed.
c286a71d965c92 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30  1320  	 */
c286a71d965c92 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30  1321  	if (pp->bridge)
c286a71d965c92 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30 @1322  		pp->bridge->reset_root_port = imx_pcie_reset_root_port;
c286a71d965c92 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2026-04-30  1323  
4a301766f5263d drivers/pci/dwc/pci-imx6.c            Bjorn Andersson        2017-07-15  1324  	return 0;
f0691e326b270d drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1325  
cf236e0c0d59b3 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1326  err_phy_off:
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1327  	phy_power_off(imx_pcie->phy);
5b04d44d5c74e4 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1328  err_phy_exit:
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1329  	phy_exit(imx_pcie->phy);
835a345b18b013 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1330  err_clk_disable:
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1331  	imx_pcie_clk_disable(imx_pcie);
f0691e326b270d drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1332  err_reg_disable:
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1333  	if (imx_pcie->vpcie)
d657ea28d55037 drivers/pci/controller/dwc/pci-imx6.c Frank Li               2024-07-29  1334  		regulator_disable(imx_pcie->vpcie);
f0691e326b270d drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2022-07-14  1335  	return ret;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1336  }
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1337  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
