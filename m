Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4C113D612
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Aug 2024 22:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723327211; cv=none; b=Rf1/kPQWr2jOV3m1t9qA1+v256isVJm7gp76PXPNout07abRPGvoai9TW1oCPbZ1VI7O3wSTZO0hQDZqxqfJP5+2rPNu0kiVY4bnHRWWsCJ/bRBQDsDMgpX4coPIexTgtPcKNf7GrE144d8jFeHg/91OglQQvWclJ4B3dlr6kUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723327211; c=relaxed/simple;
	bh=DzU5RriRGFMsMclNIJMYD1p/XMQ1jr7wmk9k+pqKqZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pvMhxSlRAtdi5tJSf9PNVZ5f7ALNm8lHvtCVeBa++ewCDCmVDOG05MyvGmhz3t/de6NAnJCGFKN4AC4BEX6apc83SRgyCgsfozxxs5qSGAoMU3Bz0OX00qxNZyBGHLJGy1P624zd3ZUx8v/a4e0G7Z5uwQ6a6Og2Lz9wiVIj2cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7T8Bf0s; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7T8Bf0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723327209; x=1754863209;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DzU5RriRGFMsMclNIJMYD1p/XMQ1jr7wmk9k+pqKqZg=;
  b=g7T8Bf0s3GfY7BYc69BPIYwnVHnZgZjxn2GXc+eDcx18ha/3r7SLG2Gu
   v2ZUTreWgORpq8/Qup66c9Q99zdkPkEhY4iqEBZmkoEOWKsdADT6hZw+/
   Xhspj+zi3ZmpIAMM3G+SqygepuxatLTZJritGgOFJvwwccvKWAy1v521e
   Ju+iyPkKvmVcRy4GKEH5l4nJsISyOik9z77/8XiFuThup/JIHexc7stQe
   2BRTiklYiAj4Wqz7eDVBFmS6orWqROx4jkePAtuLdEa99TORa9rpbjfOz
   ce/t5slL3OWLa55ZDcCAu1HbOXBhROPPN+zgeBiMiuDKv/xs19NAKzSvb
   g==;
X-CSE-ConnectionGUID: JmgvSrydQS6pRX6R529maw==
X-CSE-MsgGUID: X7iliyYFTUqdBqy+vS/hNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="43991234"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="43991234"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 15:00:08 -0700
X-CSE-ConnectionGUID: s/OUfbwJTwWHu7S0P0Ac1g==
X-CSE-MsgGUID: YV210YIrQlev93ZUI+8a+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="62728889"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 10 Aug 2024 15:00:06 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scu7Z-000AKf-0c;
	Sat, 10 Aug 2024 21:59:37 +0000
Date: Sun, 11 Aug 2024 05:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/controller/dwc/pci-keystone.c:580 ks_pcie_quirk() error:
 we previously assumed 'bridge_dev' could be null (see line 580)
Message-ID: <202408110518.S7DLGd3L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kishon Vijay Abraham I <kishon@ti.com>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
CC: Achal Verma <a-verma1@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5189dafa4cf950e675f02ee04b577dfbbad0d9b1
commit: 86f271f22bbb6391410a07e08d6ca3757fda01fa PCI: keystone: Add workaround for Errata #i2037 (AM65x SR 1.0)
date:   6 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
config: microblaze-randconfig-r072-20240810 (https://download.01.org/0day-ci/archive/20240811/202408110518.S7DLGd3L-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408110518.S7DLGd3L-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pci-keystone.c:580 ks_pcie_quirk() error: we previously assumed 'bridge_dev' could be null (see line 580)
drivers/pci/controller/dwc/pci-keystone.c:1354 ks_pcie_probe() warn: 'irq' from request_irq() not released on lines: 1214,1218,1354.

vim +/bridge_dev +580 drivers/pci/controller/dwc/pci-keystone.c

b492aca35c9820 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2018-10-17  522  
a1cabd2b42fd77 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2018-10-17  523  static void ks_pcie_quirk(struct pci_dev *dev)
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  524  {
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  525  	struct pci_bus *bus = dev->bus;
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  526  	struct keystone_pcie *ks_pcie;
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  527  	struct device *bridge_dev;
00a2c4094f8edb drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2018-10-17  528  	struct pci_dev *bridge;
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  529  	u32 val;
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  530  
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  531  	static const struct pci_device_id rc_pci_devids[] = {
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  532  		{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCIE_RC_K2HK),
904b10fb189cc1 drivers/pci/controller/dwc/pci-keystone.c Pali Rohár             2022-02-14  533  		 .class = PCI_CLASS_BRIDGE_PCI_NORMAL, .class_mask = ~0, },
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  534  		{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCIE_RC_K2E),
904b10fb189cc1 drivers/pci/controller/dwc/pci-keystone.c Pali Rohár             2022-02-14  535  		 .class = PCI_CLASS_BRIDGE_PCI_NORMAL, .class_mask = ~0, },
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  536  		{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCIE_RC_K2L),
904b10fb189cc1 drivers/pci/controller/dwc/pci-keystone.c Pali Rohár             2022-02-14  537  		 .class = PCI_CLASS_BRIDGE_PCI_NORMAL, .class_mask = ~0, },
148e340c069636 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2018-10-17  538  		{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCIE_RC_K2G),
904b10fb189cc1 drivers/pci/controller/dwc/pci-keystone.c Pali Rohár             2022-02-14  539  		 .class = PCI_CLASS_BRIDGE_PCI_NORMAL, .class_mask = ~0, },
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  540  		{ 0, },
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  541  	};
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  542  	static const struct pci_device_id am6_pci_devids[] = {
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  543  		{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_AM654X),
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  544  		 .class = PCI_CLASS_BRIDGE_PCI << 8, .class_mask = ~0, },
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  545  		{ 0, },
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  546  	};
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  547  
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  548  	if (pci_is_root_bus(bus))
00a2c4094f8edb drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2018-10-17  549  		bridge = dev;
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  550  
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  551  	/* look for the host bridge */
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  552  	while (!pci_is_root_bus(bus)) {
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  553  		bridge = bus->self;
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  554  		bus = bus->parent;
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  555  	}
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  556  
00a2c4094f8edb drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2018-10-17  557  	if (!bridge)
00a2c4094f8edb drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2018-10-17  558  		return;
00a2c4094f8edb drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2018-10-17  559  
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  560  	/*
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  561  	 * Keystone PCI controller has a h/w limitation of
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  562  	 * 256 bytes maximum read request size.  It can't handle
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  563  	 * anything higher than this.  So force this limit on
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  564  	 * all downstream devices.
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  565  	 */
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  566  	if (pci_match_id(rc_pci_devids, bridge)) {
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  567  		if (pcie_get_readrq(dev) > 256) {
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  568  			dev_info(&dev->dev, "limiting MRRS to 256 bytes\n");
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  569  			pcie_set_readrq(dev, 256);
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  570  		}
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  571  	}
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  572  
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  573  	/*
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  574  	 * Memory transactions fail with PCI controller in AM654 PG1.0
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  575  	 * when MRRS is set to more than 128 bytes. Force the MRRS to
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  576  	 * 128 bytes in all downstream devices.
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  577  	 */
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  578  	if (pci_match_id(am6_pci_devids, bridge)) {
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  579  		bridge_dev = pci_get_host_bridge_device(dev);
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28 @580  		if (!bridge_dev && !bridge_dev->parent)
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  581  			return;
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  582  
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  583  		ks_pcie = dev_get_drvdata(bridge_dev->parent);
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  584  		if (!ks_pcie)
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  585  			return;
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  586  
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  587  		val = ks_pcie_app_readl(ks_pcie, PID);
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  588  		val &= RTL;
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  589  		val >>= RTL_SHIFT;
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  590  		if (val != AM6_PCI_PG1_RTL_VER)
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  591  			return;
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  592  
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  593  		if (pcie_get_readrq(dev) > 128) {
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  594  			dev_info(&dev->dev, "limiting MRRS to 128 bytes\n");
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  595  			pcie_set_readrq(dev, 128);
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  596  		}
86f271f22bbb63 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2024-06-28  597  	}
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  598  }
a1cabd2b42fd77 drivers/pci/controller/dwc/pci-keystone.c Kishon Vijay Abraham I 2018-10-17  599  DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, ks_pcie_quirk);
c15982dfa8227f drivers/pci/host/pci-keystone.c           Murali Karicheri       2014-09-08  600  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
