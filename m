Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824A6154BEC
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727173816; cv=none; b=JZEklmPPNKUtLs2+m/+pzV58+UdTsJ/uqXU3+meUCxvoA/GynNSYGHJSoPb6DUHmacXIgHYQApZQN5khAaBg5lE6mAv542NkyfMuUpb6Pht2KXSqWNOJV2qtQ6Ui+NqbPaLVTwGYgCZXOw1/RKLaHvxVOpWuaSPIu0rEkr6PEAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727173816; c=relaxed/simple;
	bh=Iu/EOjIOxXWfnQTdfB/5OSHw/b0O+xlldgz5CMmK7HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WtoliIEfiL23oMt1Xe/ze2lfZrdvMhMUyA1JBL5020wyfJht3pnxeQwdjy5c/Y10zf4vLEr24hHdHMKQ9DtrjvDs7a29UxkZzJmThg0rdJvI4C4fFq2KGhE6k+1WOnZpRLSsxnKhDX5Neyj1bZA2YMbGX57KSLqeCglOV8066+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4O/uokL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4O/uokL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727173814; x=1758709814;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Iu/EOjIOxXWfnQTdfB/5OSHw/b0O+xlldgz5CMmK7HQ=;
  b=e4O/uokLiz3Pvw3Q4zS6nOn2lAvM+iXNMOcBXIvoqSk/TIMCjd/O9vrl
   eemkCDmojbJE+F9/7Ft/7o/DHTVH/AthzKpa9q7QK/LsKqnfnjvaSfBg8
   zWvyRAu9ejsFthzAHflNZfCJxrhLSIIcMJkO/Hz0OtaPG0tSrZ3Afiv57
   gALIyrOcxjH1EOIGHzaw7F80Q68hNz7keqScn0cO2lCZs0d8WmauwCcDQ
   oN6s0hKOUhXnqDlu2yp4yng14Nwy5GsmFOMbG2egD8xwFqpHyjHu+6gbA
   SAGhSiFjDmSQhnrQYGtLiHRLCW/cNQvmzTHeVdnVKdMqeZb8+voHs1AD5
   g==;
X-CSE-ConnectionGUID: jX0Q20bXTteTJ8i1KB+eAg==
X-CSE-MsgGUID: SJpneYggRIa+6XACvNXexw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26346647"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="26346647"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 03:30:13 -0700
X-CSE-ConnectionGUID: AejsYOaDS+uodOi93PCf6w==
X-CSE-MsgGUID: O5CMbrklQ9CCTYinR2wvvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="76145490"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Sep 2024 03:30:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st2o5-000IEL-30;
	Tue, 24 Sep 2024 10:30:09 +0000
Date: Tue, 24 Sep 2024 18:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/controller/pcie-brcmstb.c:1681 brcm_pcie_probe() warn:
 'pcie->clk' from clk_prepare_enable() not released on lines: 1674.
Message-ID: <202409241846.pOJEmIhQ-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   abf2050f51fdca0fd146388f83cddd95a57a008d
commit: a4184174be36369c3af8d937e165f28a43ef1e02 alpha: drop pre-EV56 support
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: alpha-randconfig-r072-20240924 (https://download.01.org/0day-ci/archive/20240924/202409241846.pOJEmIhQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409241846.pOJEmIhQ-lkp@intel.com/

New smatch warnings:
drivers/pci/controller/pcie-brcmstb.c:1681 brcm_pcie_probe() warn: 'pcie->clk' from clk_prepare_enable() not released on lines: 1674.

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

vim +1681 drivers/pci/controller/pcie-brcmstb.c

0ac2ff426e3d48e Jim Quinlan   2022-07-25  1576  
c0452137034bda8 Jim Quinlan   2019-12-16  1577  static int brcm_pcie_probe(struct platform_device *pdev)
c0452137034bda8 Jim Quinlan   2019-12-16  1578  {
40ca1bf580ef24d Jim Quinlan   2019-12-16  1579  	struct device_node *np = pdev->dev.of_node, *msi_np;
c0452137034bda8 Jim Quinlan   2019-12-16  1580  	struct pci_host_bridge *bridge;
1cf1b0a6dd95250 Jim Quinlan   2020-09-11  1581  	const struct pcie_cfg_data *data;
c0452137034bda8 Jim Quinlan   2019-12-16  1582  	struct brcm_pcie *pcie;
c0452137034bda8 Jim Quinlan   2019-12-16  1583  	int ret;
c0452137034bda8 Jim Quinlan   2019-12-16  1584  
c0452137034bda8 Jim Quinlan   2019-12-16  1585  	bridge = devm_pci_alloc_host_bridge(&pdev->dev, sizeof(*pcie));
c0452137034bda8 Jim Quinlan   2019-12-16  1586  	if (!bridge)
c0452137034bda8 Jim Quinlan   2019-12-16  1587  		return -ENOMEM;
c0452137034bda8 Jim Quinlan   2019-12-16  1588  
1cf1b0a6dd95250 Jim Quinlan   2020-09-11  1589  	data = of_device_get_match_data(&pdev->dev);
1cf1b0a6dd95250 Jim Quinlan   2020-09-11  1590  	if (!data) {
1cf1b0a6dd95250 Jim Quinlan   2020-09-11  1591  		pr_err("failed to look up compatible string\n");
1cf1b0a6dd95250 Jim Quinlan   2020-09-11  1592  		return -EINVAL;
1cf1b0a6dd95250 Jim Quinlan   2020-09-11  1593  	}
1cf1b0a6dd95250 Jim Quinlan   2020-09-11  1594  
c0452137034bda8 Jim Quinlan   2019-12-16  1595  	pcie = pci_host_bridge_priv(bridge);
c0452137034bda8 Jim Quinlan   2019-12-16  1596  	pcie->dev = &pdev->dev;
c0452137034bda8 Jim Quinlan   2019-12-16  1597  	pcie->np = np;
1cf1b0a6dd95250 Jim Quinlan   2020-09-11  1598  	pcie->reg_offsets = data->offsets;
1cf1b0a6dd95250 Jim Quinlan   2020-09-11  1599  	pcie->type = data->type;
04356ac30771091 Jim Quinlan   2020-09-11  1600  	pcie->perst_set = data->perst_set;
04356ac30771091 Jim Quinlan   2020-09-11  1601  	pcie->bridge_sw_init_set = data->bridge_sw_init_set;
c0452137034bda8 Jim Quinlan   2019-12-16  1602  
3cf0eead9fb895d Dejin Zheng   2020-07-08  1603  	pcie->base = devm_platform_ioremap_resource(pdev, 0);
c0452137034bda8 Jim Quinlan   2019-12-16  1604  	if (IS_ERR(pcie->base))
c0452137034bda8 Jim Quinlan   2019-12-16  1605  		return PTR_ERR(pcie->base);
c0452137034bda8 Jim Quinlan   2019-12-16  1606  
c0452137034bda8 Jim Quinlan   2019-12-16  1607  	pcie->clk = devm_clk_get_optional(&pdev->dev, "sw_pcie");
c0452137034bda8 Jim Quinlan   2019-12-16  1608  	if (IS_ERR(pcie->clk))
c0452137034bda8 Jim Quinlan   2019-12-16  1609  		return PTR_ERR(pcie->clk);
c0452137034bda8 Jim Quinlan   2019-12-16  1610  
c0452137034bda8 Jim Quinlan   2019-12-16  1611  	ret = of_pci_get_max_link_speed(np);
c0452137034bda8 Jim Quinlan   2019-12-16  1612  	pcie->gen = (ret < 0) ? 0 : ret;
c0452137034bda8 Jim Quinlan   2019-12-16  1613  
c0452137034bda8 Jim Quinlan   2019-12-16  1614  	pcie->ssc = of_property_read_bool(np, "brcm,enable-ssc");
c0452137034bda8 Jim Quinlan   2019-12-16  1615  
c0452137034bda8 Jim Quinlan   2019-12-16  1616  	ret = clk_prepare_enable(pcie->clk);
c0452137034bda8 Jim Quinlan   2019-12-16  1617  	if (ret) {
c0452137034bda8 Jim Quinlan   2019-12-16  1618  		dev_err(&pdev->dev, "could not enable clock\n");
c0452137034bda8 Jim Quinlan   2019-12-16  1619  		return ret;
c0452137034bda8 Jim Quinlan   2019-12-16  1620  	}
740d6c3708a9325 Jim Quinlan   2020-09-11  1621  	pcie->rescal = devm_reset_control_get_optional_shared(&pdev->dev, "rescal");
740d6c3708a9325 Jim Quinlan   2020-09-11  1622  	if (IS_ERR(pcie->rescal)) {
740d6c3708a9325 Jim Quinlan   2020-09-11  1623  		clk_disable_unprepare(pcie->clk);
740d6c3708a9325 Jim Quinlan   2020-09-11  1624  		return PTR_ERR(pcie->rescal);
740d6c3708a9325 Jim Quinlan   2020-09-11  1625  	}
0cdfaceb9889b69 Rafał Miłecki 2020-12-10  1626  	pcie->perst_reset = devm_reset_control_get_optional_exclusive(&pdev->dev, "perst");
0cdfaceb9889b69 Rafał Miłecki 2020-12-10  1627  	if (IS_ERR(pcie->perst_reset)) {
0cdfaceb9889b69 Rafał Miłecki 2020-12-10  1628  		clk_disable_unprepare(pcie->clk);
0cdfaceb9889b69 Rafał Miłecki 2020-12-10  1629  		return PTR_ERR(pcie->perst_reset);
0cdfaceb9889b69 Rafał Miłecki 2020-12-10  1630  	}
740d6c3708a9325 Jim Quinlan   2020-09-11  1631  
bb610757fcd7455 Jim Quinlan   2021-04-30  1632  	ret = reset_control_reset(pcie->rescal);
740d6c3708a9325 Jim Quinlan   2020-09-11  1633  	if (ret)
740d6c3708a9325 Jim Quinlan   2020-09-11  1634  		dev_err(&pdev->dev, "failed to deassert 'rescal'\n");
740d6c3708a9325 Jim Quinlan   2020-09-11  1635  
740d6c3708a9325 Jim Quinlan   2020-09-11  1636  	ret = brcm_phy_start(pcie);
740d6c3708a9325 Jim Quinlan   2020-09-11  1637  	if (ret) {
bb610757fcd7455 Jim Quinlan   2021-04-30  1638  		reset_control_rearm(pcie->rescal);
740d6c3708a9325 Jim Quinlan   2020-09-11  1639  		clk_disable_unprepare(pcie->clk);
740d6c3708a9325 Jim Quinlan   2020-09-11  1640  		return ret;
740d6c3708a9325 Jim Quinlan   2020-09-11  1641  	}
c0452137034bda8 Jim Quinlan   2019-12-16  1642  
c0452137034bda8 Jim Quinlan   2019-12-16  1643  	ret = brcm_pcie_setup(pcie);
c0452137034bda8 Jim Quinlan   2019-12-16  1644  	if (ret)
c0452137034bda8 Jim Quinlan   2019-12-16  1645  		goto fail;
c0452137034bda8 Jim Quinlan   2019-12-16  1646  
3baec684a531866 Jim Quinlan   2020-09-11  1647  	pcie->hw_rev = readl(pcie->base + PCIE_MISC_REVISION);
0cdfaceb9889b69 Rafał Miłecki 2020-12-10  1648  	if (pcie->type == BCM4908 && pcie->hw_rev >= BRCM_PCIE_HW_REV_3_20) {
0cdfaceb9889b69 Rafał Miłecki 2020-12-10  1649  		dev_err(pcie->dev, "hardware revision with unsupported PERST# setup\n");
b5d9209d5083847 Wei Yongjun   2021-03-08  1650  		ret = -ENODEV;
0cdfaceb9889b69 Rafał Miłecki 2020-12-10  1651  		goto fail;
0cdfaceb9889b69 Rafał Miłecki 2020-12-10  1652  	}
3baec684a531866 Jim Quinlan   2020-09-11  1653  
40ca1bf580ef24d Jim Quinlan   2019-12-16  1654  	msi_np = of_parse_phandle(pcie->np, "msi-parent", 0);
40ca1bf580ef24d Jim Quinlan   2019-12-16  1655  	if (pci_msi_enabled() && msi_np == pcie->np) {
40ca1bf580ef24d Jim Quinlan   2019-12-16  1656  		ret = brcm_pcie_enable_msi(pcie);
40ca1bf580ef24d Jim Quinlan   2019-12-16  1657  		if (ret) {
40ca1bf580ef24d Jim Quinlan   2019-12-16  1658  			dev_err(pcie->dev, "probe of internal MSI failed");
40ca1bf580ef24d Jim Quinlan   2019-12-16  1659  			goto fail;
40ca1bf580ef24d Jim Quinlan   2019-12-16  1660  		}
40ca1bf580ef24d Jim Quinlan   2019-12-16  1661  	}
40ca1bf580ef24d Jim Quinlan   2019-12-16  1662  
94c651163630288 Jim Quinlan   2022-07-26  1663  	bridge->ops = pcie->type == BCM7425 ? &brcm7425_pcie_ops : &brcm_pcie_ops;
c0452137034bda8 Jim Quinlan   2019-12-16  1664  	bridge->sysdata = pcie;
c0452137034bda8 Jim Quinlan   2019-12-16  1665  
c0452137034bda8 Jim Quinlan   2019-12-16  1666  	platform_set_drvdata(pdev, pcie);
c0452137034bda8 Jim Quinlan   2019-12-16  1667  
9e6be018b26347c Jim Quinlan   2022-07-25  1668  	ret = pci_host_probe(bridge);
9e6be018b26347c Jim Quinlan   2022-07-25  1669  	if (!ret && !brcm_pcie_link_up(pcie))
9e6be018b26347c Jim Quinlan   2022-07-25  1670  		ret = -ENODEV;
9e6be018b26347c Jim Quinlan   2022-07-25  1671  
9e6be018b26347c Jim Quinlan   2022-07-25  1672  	if (ret) {
9e6be018b26347c Jim Quinlan   2022-07-25  1673  		brcm_pcie_remove(pdev);
9e6be018b26347c Jim Quinlan   2022-07-25  1674  		return ret;
9e6be018b26347c Jim Quinlan   2022-07-25  1675  	}
9e6be018b26347c Jim Quinlan   2022-07-25  1676  
9e6be018b26347c Jim Quinlan   2022-07-25  1677  	return 0;
9e6be018b26347c Jim Quinlan   2022-07-25  1678  
c0452137034bda8 Jim Quinlan   2019-12-16  1679  fail:
c0452137034bda8 Jim Quinlan   2019-12-16  1680  	__brcm_pcie_remove(pcie);
c0452137034bda8 Jim Quinlan   2019-12-16 @1681  	return ret;
c0452137034bda8 Jim Quinlan   2019-12-16  1682  }
c0452137034bda8 Jim Quinlan   2019-12-16  1683  

:::::: The code at line 1681 was first introduced by commit
:::::: c0452137034bda8f686dd9a2e167949bfffd6776 PCI: brcmstb: Add Broadcom STB PCIe host controller driver

:::::: TO: Jim Quinlan <james.quinlan@broadcom.com>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
