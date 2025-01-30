Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C6417F4F6
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jan 2025 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738223335; cv=none; b=PR+PT+MLQmWRSogaVedo3P54IYK02BRz9fVD5CGNUFkKpiB8JYTTt9YYSiCxUKqjyFJX+l38DdjAlOaCiTJDXJWMbruN0w+6bY+LzRpG87cjPgm9GXCkONsGh6WdU0ABGat3IlMSCxHnqts7ONzAhDtqF/uaV00EyRrfErFVq+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738223335; c=relaxed/simple;
	bh=KlXwT6emhdOr4WWUkZG4yQOrOBscYL75h3rgdJ2LhLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tTXsjUxw28dzZquTjR0hVAcyzmdNhRYJExx387n9T2p+ZUwsAPVGw978m3SGpQ7d/tMwl0cTjsocRh6DTJxtbxEcYuEAinXnHr+FmkGsjEYGbD9JcN2hjdDetr2O7/nup+2DWONuH6mO8fIIpq5uasBO37j4GvbDbqD+/rKk9Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inUWYADT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inUWYADT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738223333; x=1769759333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KlXwT6emhdOr4WWUkZG4yQOrOBscYL75h3rgdJ2LhLw=;
  b=inUWYADTb515YdWTjxW+aOKsQ+Qstws4C49rvLHZgA8fGs1G30h0xAGw
   Dip8QjpdBb1pkgIPwQFNp8n3+t0Ufo6jGiCvlhHKQmnkTW4dI9SFHy3Eh
   5Ez9hbbZSPfTqAJzrpkjqu22EXfcKjMSljnBfRVr9erAa6+jrzDDSGz0b
   8E53T3UtmyaXtpU7Fj00ZCczfRAV33B322M2HNqoSixcIVqFpkQyfFZNV
   +O9osXsYgL73U9evSsRPqUs9qSCdikNdp4oz+Ft+gSqA/rKQTEjF9R+2F
   2icM0zOfiPGRpMJg8SGVcGQLZaPdT4jN2pNaJgssJNH3vMY8aUswifb0n
   g==;
X-CSE-ConnectionGUID: W/9FQrXlS6iEEJzUbaHlqA==
X-CSE-MsgGUID: bAgEmLiUQICSsLXz93qvyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="49413009"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="49413009"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 23:48:52 -0800
X-CSE-ConnectionGUID: VW13vVZLQE2+ix5CRpIYKA==
X-CSE-MsgGUID: aIg+FK4sTAep/L8taAHSsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="109163120"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jan 2025 23:48:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdPI8-000jpV-0B;
	Thu, 30 Jan 2025 07:48:48 +0000
Date: Thu, 30 Jan 2025 15:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/intel/e1000e/netdev.c:7731 e1000_probe() warn:
 'adapter->hw.flash_address' from ioremap() not released on lines: 7731.
Message-ID: <202501301521.DEYIZBfB-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72deda0abee6e705ae71a93f69f55e33be5bca5c
commit: 5284984a4fbacb0883bfebe905902cdda2891a07 bug: Fix no-return-statement warning with !CONFIG_BUG
date:   10 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 months ago
config: alpha-randconfig-r072-20250130 (https://download.01.org/0day-ci/archive/20250130/202501301521.DEYIZBfB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501301521.DEYIZBfB-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/e1000e/netdev.c:7731 e1000_probe() warn: 'adapter->hw.flash_address' from ioremap() not released on lines: 7731.

vim +7731 drivers/net/ethernet/intel/e1000e/netdev.c

651c24669316b9 drivers/net/e1000e/netdev.c                Stephen Hemminger     2008-11-19  7363  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7364  /**
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7365   * e1000_probe - Device Initialization Routine
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7366   * @pdev: PCI device information struct
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7367   * @ent: entry in e1000_pci_tbl
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7368   *
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7369   * Returns 0 on success, negative on failure
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7370   *
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7371   * e1000_probe initializes an adapter identified by a pci_dev structure.
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7372   * The OS initialization, configuring of the adapter private structure,
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7373   * and a hardware reset occur.
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7374   **/
1dd06ae8db716e drivers/net/ethernet/intel/e1000e/netdev.c Greg Kroah-Hartman    2012-12-06  7375  static int e1000_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7376  {
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7377  	struct net_device *netdev;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7378  	struct e1000_adapter *adapter;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7379  	struct e1000_hw *hw;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7380  	const struct e1000_info *ei = e1000_info_tbl[ent->driver_data];
f47e81fc36371a drivers/net/e1000e/netdev.c                Becky Bruce           2008-05-01  7381  	resource_size_t mmio_start, mmio_len;
f47e81fc36371a drivers/net/e1000e/netdev.c                Becky Bruce           2008-05-01  7382  	resource_size_t flash_start, flash_len;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7383  	static int cards_found;
78cd29d5a92ae5 drivers/net/e1000e/netdev.c                Bruce Allan           2011-03-24  7384  	u16 aspm_disable_flag = 0;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7385  	u16 eeprom_data = 0;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7386  	u16 eeprom_apme_mask = E1000_EEPROM_APME;
a34a42d87a0805 drivers/net/ethernet/intel/e1000e/netdev.c Christophe JAILLET    2022-01-09  7387  	int bars, i, err;
847042a6a51e6d drivers/net/ethernet/intel/e1000e/netdev.c Brian Walsh           2016-04-12  7388  	s32 ret_val = 0;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7389  
78cd29d5a92ae5 drivers/net/e1000e/netdev.c                Bruce Allan           2011-03-24  7390  	if (ei->flags2 & FLAG2_DISABLE_ASPM_L0S)
78cd29d5a92ae5 drivers/net/e1000e/netdev.c                Bruce Allan           2011-03-24  7391  		aspm_disable_flag = PCIE_LINK_STATE_L0S;
6f461f6c7c961f drivers/net/e1000e/netdev.c                Bruce Allan           2010-04-27  7392  	if (ei->flags2 & FLAG2_DISABLE_ASPM_L1)
78cd29d5a92ae5 drivers/net/e1000e/netdev.c                Bruce Allan           2011-03-24  7393  		aspm_disable_flag |= PCIE_LINK_STATE_L1;
78cd29d5a92ae5 drivers/net/e1000e/netdev.c                Bruce Allan           2011-03-24  7394  	if (aspm_disable_flag)
78cd29d5a92ae5 drivers/net/e1000e/netdev.c                Bruce Allan           2011-03-24  7395  		e1000e_disable_aspm(pdev, aspm_disable_flag);
6e4f6f6b408cf3 drivers/net/e1000e/netdev.c                Taku Izumi            2008-06-20  7396  
6e4f6f6b408cf3 drivers/net/e1000e/netdev.c                Taku Izumi            2008-06-20  7397  	err = pci_enable_device_mem(pdev);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7398  	if (err)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7399  		return err;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7400  
718a39eb587e03 drivers/net/ethernet/intel/e1000e/netdev.c Russell King          2013-06-10  7401  	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7402  	if (err) {
f0ff439872e1ea drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2013-02-20  7403  		dev_err(&pdev->dev,
f0ff439872e1ea drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2013-02-20  7404  			"No usable DMA configuration, aborting\n");
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7405  		goto err_dma;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7406  	}
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7407  
17e813ec8c8cd0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2013-02-20  7408  	bars = pci_select_bars(pdev, IORESOURCE_MEM);
17e813ec8c8cd0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2013-02-20  7409  	err = pci_request_selected_regions_exclusive(pdev, bars,
f0f422e5735ba9 drivers/net/e1000e/netdev.c                Bruce Allan           2008-08-04  7410  						     e1000e_driver_name);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7411  	if (err)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7412  		goto err_pci_reg;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7413  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7414  	pci_set_master(pdev);
438b365a2758c0 drivers/net/e1000e/netdev.c                Bruce Allan           2008-11-21  7415  	/* PCI config space info */
438b365a2758c0 drivers/net/e1000e/netdev.c                Bruce Allan           2008-11-21  7416  	err = pci_save_state(pdev);
438b365a2758c0 drivers/net/e1000e/netdev.c                Bruce Allan           2008-11-21  7417  	if (err)
438b365a2758c0 drivers/net/e1000e/netdev.c                Bruce Allan           2008-11-21  7418  		goto err_alloc_etherdev;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7419  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7420  	err = -ENOMEM;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7421  	netdev = alloc_etherdev(sizeof(struct e1000_adapter));
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7422  	if (!netdev)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7423  		goto err_alloc_etherdev;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7424  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7425  	SET_NETDEV_DEV(netdev, &pdev->dev);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7426  
f85e4dfac666e4 drivers/net/e1000e/netdev.c                Tom Herbert           2010-05-05  7427  	netdev->irq = pdev->irq;
f85e4dfac666e4 drivers/net/e1000e/netdev.c                Tom Herbert           2010-05-05  7428  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7429  	pci_set_drvdata(pdev, netdev);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7430  	adapter = netdev_priv(netdev);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7431  	hw = &adapter->hw;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7432  	adapter->netdev = netdev;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7433  	adapter->pdev = pdev;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7434  	adapter->ei = ei;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7435  	adapter->pba = ei->pba;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7436  	adapter->flags = ei->flags;
eb7c3adb1ca924 drivers/net/e1000e/netdev.c                Jeff Kirsher          2008-11-14  7437  	adapter->flags2 = ei->flags2;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7438  	adapter->hw.adapter = adapter;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7439  	adapter->hw.mac.type = ei->mac;
2adc55c959940f drivers/net/e1000e/netdev.c                Bruce Allan           2009-06-02  7440  	adapter->max_hw_frame_size = ei->max_hw_frame_size;
b3f4d5990bfc8b drivers/net/ethernet/intel/e1000e/netdev.c stephen hemminger     2012-03-13  7441  	adapter->msg_enable = netif_msg_init(debug, DEFAULT_MSG_ENABLE);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7442  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7443  	mmio_start = pci_resource_start(pdev, 0);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7444  	mmio_len = pci_resource_len(pdev, 0);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7445  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7446  	err = -EIO;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7447  	adapter->hw.hw_addr = ioremap(mmio_start, mmio_len);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7448  	if (!adapter->hw.hw_addr)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7449  		goto err_ioremap;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7450  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7451  	if ((adapter->flags & FLAG_HAS_FLASH) &&
1103a631a83408 drivers/net/ethernet/intel/e1000e/netdev.c Yanir Lubetkin        2015-02-28  7452  	    (pci_resource_flags(pdev, 1) & IORESOURCE_MEM) &&
1103a631a83408 drivers/net/ethernet/intel/e1000e/netdev.c Yanir Lubetkin        2015-02-28  7453  	    (hw->mac.type < e1000_pch_spt)) {
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7454  		flash_start = pci_resource_start(pdev, 1);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7455  		flash_len = pci_resource_len(pdev, 1);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7456  		adapter->hw.flash_address = ioremap(flash_start, flash_len);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7457  		if (!adapter->hw.flash_address)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7458  			goto err_flashmap;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7459  	}
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7460  
d495bcb84d2c3a drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2013-03-20  7461  	/* Set default EEE advertisement */
d495bcb84d2c3a drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2013-03-20  7462  	if (adapter->flags2 & FLAG2_HAS_EEE)
d495bcb84d2c3a drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2013-03-20  7463  		adapter->eee_advert = MDIO_EEE_100TX | MDIO_EEE_1000T;
d495bcb84d2c3a drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2013-03-20  7464  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7465  	/* construct the net_device struct */
651c24669316b9 drivers/net/e1000e/netdev.c                Stephen Hemminger     2008-11-19  7466  	netdev->netdev_ops = &e1000e_netdev_ops;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7467  	e1000e_set_ethtool_ops(netdev);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7468  	netdev->watchdog_timeo = 5 * HZ;
b48b89f9c189d2 drivers/net/ethernet/intel/e1000e/netdev.c Jakub Kicinski        2022-09-27  7469  	netif_napi_add(netdev, &adapter->napi, e1000e_poll);
f029c781dd6d8e drivers/net/ethernet/intel/e1000e/netdev.c Wolfram Sang          2022-08-30  7470  	strscpy(netdev->name, pci_name(pdev), sizeof(netdev->name));
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7471  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7472  	netdev->mem_start = mmio_start;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7473  	netdev->mem_end = mmio_start + mmio_len;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7474  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7475  	adapter->bd_number = cards_found++;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7476  
4662e82b2cb41c drivers/net/e1000e/netdev.c                Bruce Allan           2008-08-26  7477  	e1000e_check_options(adapter);
4662e82b2cb41c drivers/net/e1000e/netdev.c                Bruce Allan           2008-08-26  7478  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7479  	/* setup adapter struct */
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7480  	err = e1000_sw_init(adapter);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7481  	if (err)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7482  		goto err_sw_init;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7483  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7484  	memcpy(&hw->mac.ops, ei->mac_ops, sizeof(hw->mac.ops));
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7485  	memcpy(&hw->nvm.ops, ei->nvm_ops, sizeof(hw->nvm.ops));
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7486  	memcpy(&hw->phy.ops, ei->phy_ops, sizeof(hw->phy.ops));
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7487  
69e3fd8ccc3d38 drivers/net/e1000e/netdev.c                Jeff Kirsher          2008-04-02  7488  	err = ei->get_variants(adapter);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7489  	if (err)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7490  		goto err_hw_init;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7491  
4a7703582836f5 drivers/net/e1000e/netdev.c                Bruce Allan           2008-10-01  7492  	if ((adapter->flags & FLAG_IS_ICH) &&
152c0a976c7138 drivers/net/ethernet/intel/e1000e/netdev.c Yanir Lubetkin        2015-03-20  7493  	    (adapter->flags & FLAG_READ_ONLY_NVM) &&
152c0a976c7138 drivers/net/ethernet/intel/e1000e/netdev.c Yanir Lubetkin        2015-03-20  7494  	    (hw->mac.type < e1000_pch_spt))
4a7703582836f5 drivers/net/e1000e/netdev.c                Bruce Allan           2008-10-01  7495  		e1000e_write_protect_nvm_ich8lan(&adapter->hw);
4a7703582836f5 drivers/net/e1000e/netdev.c                Bruce Allan           2008-10-01  7496  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7497  	hw->mac.ops.get_bus_info(&adapter->hw);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7498  
318a94d68979cb drivers/net/e1000e/netdev.c                Jeff Kirsher          2008-03-28  7499  	adapter->hw.phy.autoneg_wait_to_complete = 0;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7500  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7501  	/* Copper options */
318a94d68979cb drivers/net/e1000e/netdev.c                Jeff Kirsher          2008-03-28  7502  	if (adapter->hw.phy.media_type == e1000_media_type_copper) {
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7503  		adapter->hw.phy.mdix = AUTO_ALL_MODES;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7504  		adapter->hw.phy.disable_polarity_correction = 0;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7505  		adapter->hw.phy.ms_type = e1000_ms_hw_default;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7506  	}
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7507  
470a54207ccf70 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-05-26  7508  	if (hw->phy.ops.check_reset_block && hw->phy.ops.check_reset_block(hw))
185095fb80ce57 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-06-07  7509  		dev_info(&pdev->dev,
185095fb80ce57 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-06-07  7510  			 "PHY reset is blocked due to SOL/IDER session.\n");
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7511  
dc221294719ae0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2011-08-19  7512  	/* Set initial default active device features */
dc221294719ae0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2011-08-19  7513  	netdev->features = (NETIF_F_SG |
f646968f8f7c62 drivers/net/ethernet/intel/e1000e/netdev.c Patrick McHardy       2013-04-19  7514  			    NETIF_F_HW_VLAN_CTAG_RX |
f646968f8f7c62 drivers/net/ethernet/intel/e1000e/netdev.c Patrick McHardy       2013-04-19  7515  			    NETIF_F_HW_VLAN_CTAG_TX |
dc221294719ae0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2011-08-19  7516  			    NETIF_F_TSO |
dc221294719ae0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2011-08-19  7517  			    NETIF_F_TSO6 |
70495a500d787c drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-01-11  7518  			    NETIF_F_RXHASH |
dc221294719ae0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2011-08-19  7519  			    NETIF_F_RXCSUM |
dc221294719ae0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2011-08-19  7520  			    NETIF_F_HW_CSUM);
dc221294719ae0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2011-08-19  7521  
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7522  	/* disable TSO for pcie and 10/100 speeds to avoid
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7523  	 * some hardware issues and for i219 to fix transfer
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7524  	 * speed being capped at 60%
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7525  	 */
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7526  	if (!(adapter->flags & FLAG_TSO_FORCE)) {
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7527  		switch (adapter->link_speed) {
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7528  		case SPEED_10:
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7529  		case SPEED_100:
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7530  			e_info("10/100 speed: disabling TSO\n");
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7531  			netdev->features &= ~NETIF_F_TSO;
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7532  			netdev->features &= ~NETIF_F_TSO6;
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7533  			break;
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7534  		case SPEED_1000:
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7535  			netdev->features |= NETIF_F_TSO;
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7536  			netdev->features |= NETIF_F_TSO6;
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7537  			break;
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7538  		default:
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7539  			/* oops */
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7540  			break;
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7541  		}
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7542  		if (hw->mac.type == e1000_pch_spt) {
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7543  			netdev->features &= ~NETIF_F_TSO;
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7544  			netdev->features &= ~NETIF_F_TSO6;
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7545  		}
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7546  	}
67d47b95119ad5 drivers/net/ethernet/intel/e1000e/netdev.c Sebastian Basierski   2023-04-17  7547  
dc221294719ae0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2011-08-19  7548  	/* Set user-changeable features (subset of all device features) */
dc221294719ae0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2011-08-19  7549  	netdev->hw_features = netdev->features;
0184039a4b6727 drivers/net/ethernet/intel/e1000e/netdev.c Ben Greear            2012-02-11  7550  	netdev->hw_features |= NETIF_F_RXFCS;
943146de22d365 drivers/net/ethernet/intel/e1000e/netdev.c Ben Greear            2012-02-11  7551  	netdev->priv_flags |= IFF_SUPP_NOFCS;
cf955e6c96cb9a drivers/net/ethernet/intel/e1000e/netdev.c Ben Greear            2012-02-11  7552  	netdev->hw_features |= NETIF_F_RXALL;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7553  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7554  	if (adapter->flags & FLAG_HAS_HW_VLAN_FILTER)
f646968f8f7c62 drivers/net/ethernet/intel/e1000e/netdev.c Patrick McHardy       2013-04-19  7555  		netdev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7556  
dc221294719ae0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2011-08-19  7557  	netdev->vlan_features |= (NETIF_F_SG |
dc221294719ae0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2011-08-19  7558  				  NETIF_F_TSO |
dc221294719ae0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2011-08-19  7559  				  NETIF_F_TSO6 |
dc221294719ae0 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2011-08-19  7560  				  NETIF_F_HW_CSUM);
a5136e23b54250 drivers/net/e1000e/netdev.c                Jeff Kirsher          2008-06-05  7561  
ef9b965a1c4ebd drivers/net/ethernet/intel/e1000e/netdev.c Jesse Brandeburg      2011-11-04  7562  	netdev->priv_flags |= IFF_UNICAST_FLT;
ef9b965a1c4ebd drivers/net/ethernet/intel/e1000e/netdev.c Jesse Brandeburg      2011-11-04  7563  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7564  	netdev->features |= NETIF_F_HIGHDMA;
7b872a55c40b7e drivers/net/e1000e/netdev.c                Yi Zou                2010-09-22  7565  	netdev->vlan_features |= NETIF_F_HIGHDMA;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7566  
91c527a55664dd drivers/net/ethernet/intel/e1000e/netdev.c Jarod Wilson          2016-10-17  7567  	/* MTU range: 68 - max_hw_frame_size */
91c527a55664dd drivers/net/ethernet/intel/e1000e/netdev.c Jarod Wilson          2016-10-17  7568  	netdev->min_mtu = ETH_MIN_MTU;
91c527a55664dd drivers/net/ethernet/intel/e1000e/netdev.c Jarod Wilson          2016-10-17  7569  	netdev->max_mtu = adapter->max_hw_frame_size -
91c527a55664dd drivers/net/ethernet/intel/e1000e/netdev.c Jarod Wilson          2016-10-17  7570  			  (VLAN_ETH_HLEN + ETH_FCS_LEN);
91c527a55664dd drivers/net/ethernet/intel/e1000e/netdev.c Jarod Wilson          2016-10-17  7571  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7572  	if (e1000e_enable_mng_pass_thru(&adapter->hw))
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7573  		adapter->flags |= FLAG_MNG_PT_ENABLED;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7574  
e921eb1ac411a3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-11-28  7575  	/* before reading the NVM, reset the controller to
ad68076e07fa01 drivers/net/e1000e/netdev.c                Bruce Allan           2008-03-28  7576  	 * put the device in a known good starting state
ad68076e07fa01 drivers/net/e1000e/netdev.c                Bruce Allan           2008-03-28  7577  	 */
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7578  	adapter->hw.mac.ops.reset_hw(&adapter->hw);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7579  
e921eb1ac411a3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-11-28  7580  	/* systems with ASPM and others may see the checksum fail on the first
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7581  	 * attempt. Let's give it a few tries
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7582  	 */
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7583  	for (i = 0;; i++) {
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7584  		if (e1000_validate_nvm_checksum(&adapter->hw) >= 0)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7585  			break;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7586  		if (i == 2) {
185095fb80ce57 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-06-07  7587  			dev_err(&pdev->dev, "The NVM Checksum Is Not Valid\n");
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7588  			err = -EIO;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7589  			goto err_eeprom;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7590  		}
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7591  	}
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7592  
10aa4c0447c308 drivers/net/e1000e/netdev.c                Auke Kok              2008-08-04  7593  	e1000_eeprom_checks(adapter);
10aa4c0447c308 drivers/net/e1000e/netdev.c                Auke Kok              2008-08-04  7594  
608f8a0d014db6 drivers/net/e1000e/netdev.c                Bruce Allan           2010-01-13  7595  	/* copy the MAC address */
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7596  	if (e1000e_read_mac_addr(&adapter->hw))
185095fb80ce57 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-06-07  7597  		dev_err(&pdev->dev,
185095fb80ce57 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-06-07  7598  			"NVM Read Error while reading MAC address\n");
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7599  
a05e4c0af490ca drivers/net/ethernet/intel/e1000e/netdev.c Jakub Kicinski        2021-10-04  7600  	eth_hw_addr_set(netdev, adapter->hw.mac.addr);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7601  
aaeb6cdfa5c075 drivers/net/ethernet/intel/e1000e/netdev.c Jiri Pirko            2013-01-08  7602  	if (!is_valid_ether_addr(netdev->dev_addr)) {
185095fb80ce57 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-06-07  7603  		dev_err(&pdev->dev, "Invalid MAC Address: %pM\n",
aaeb6cdfa5c075 drivers/net/ethernet/intel/e1000e/netdev.c Jiri Pirko            2013-01-08  7604  			netdev->dev_addr);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7605  		err = -EIO;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7606  		goto err_eeprom;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7607  	}
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7608  
d5ad7a6a7f3c87 drivers/net/ethernet/intel/e1000e/netdev.c Jeff Kirsher          2020-01-04  7609  	timer_setup(&adapter->watchdog_timer, e1000_watchdog, 0);
26566eae80512d drivers/net/ethernet/intel/e1000e/netdev.c Kees Cook             2017-10-16  7610  	timer_setup(&adapter->phy_info_timer, e1000_update_phy_info, 0);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7611  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7612  	INIT_WORK(&adapter->reset_task, e1000_reset_task);
d5ad7a6a7f3c87 drivers/net/ethernet/intel/e1000e/netdev.c Jeff Kirsher          2020-01-04  7613  	INIT_WORK(&adapter->watchdog_task, e1000_watchdog_task);
a8f88ff5a5abc2 drivers/net/e1000e/netdev.c                Jesse Brandeburg      2008-10-02  7614  	INIT_WORK(&adapter->downshift_task, e1000e_downshift_workaround);
a8f88ff5a5abc2 drivers/net/e1000e/netdev.c                Jesse Brandeburg      2008-10-02  7615  	INIT_WORK(&adapter->update_phy_task, e1000e_update_phy_task);
41cec6f1160c11 drivers/net/e1000e/netdev.c                Bruce Allan           2009-11-20  7616  	INIT_WORK(&adapter->print_hang_task, e1000_print_hw_hang);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7617  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7618  	/* Initialize link parameters. User can change them with ethtool */
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7619  	adapter->hw.mac.autoneg = 1;
3db1cd5c05f35f drivers/net/ethernet/intel/e1000e/netdev.c Rusty Russell         2011-12-19  7620  	adapter->fc_autoneg = true;
5c48ef3e202867 drivers/net/e1000e/netdev.c                Bruce Allan           2008-11-21  7621  	adapter->hw.fc.requested_mode = e1000_fc_default;
5c48ef3e202867 drivers/net/e1000e/netdev.c                Bruce Allan           2008-11-21  7622  	adapter->hw.fc.current_mode = e1000_fc_default;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7623  	adapter->hw.phy.autoneg_advertised = 0x2f;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7624  
e921eb1ac411a3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-11-28  7625  	/* Initial Wake on LAN setting - If APM wake is enabled in
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7626  	 * the EEPROM, enable the ACPI Magic Packet filter
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7627  	 */
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7628  	if (adapter->flags & FLAG_APME_IN_WUC) {
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7629  		/* APME bit in EEPROM is mapped to WUC.APME */
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7630  		eeprom_data = er32(WUC);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7631  		eeprom_apme_mask = E1000_WUC_APME;
4def99bbfd46e0 drivers/net/e1000e/netdev.c                Bruce Allan           2011-02-02  7632  		if ((hw->mac.type > e1000_ich10lan) &&
4def99bbfd46e0 drivers/net/e1000e/netdev.c                Bruce Allan           2011-02-02  7633  		    (eeprom_data & E1000_WUC_PHY_WAKE))
a4f58f5455ba0e drivers/net/e1000e/netdev.c                Bruce Allan           2009-06-02  7634  			adapter->flags2 |= FLAG2_HAS_PHY_WAKEUP;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7635  	} else if (adapter->flags & FLAG_APME_IN_CTRL3) {
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7636  		if (adapter->flags & FLAG_APME_CHECK_PORT_B &&
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7637  		    (adapter->hw.bus.func == 1))
847042a6a51e6d drivers/net/ethernet/intel/e1000e/netdev.c Brian Walsh           2016-04-12  7638  			ret_val = e1000_read_nvm(&adapter->hw,
491a04d2812b0a drivers/net/ethernet/intel/e1000e/netdev.c David Ertman          2014-07-09  7639  					      NVM_INIT_CONTROL3_PORT_B,
3d3a1676561cfb drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-02-23  7640  					      1, &eeprom_data);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7641  		else
847042a6a51e6d drivers/net/ethernet/intel/e1000e/netdev.c Brian Walsh           2016-04-12  7642  			ret_val = e1000_read_nvm(&adapter->hw,
491a04d2812b0a drivers/net/ethernet/intel/e1000e/netdev.c David Ertman          2014-07-09  7643  					      NVM_INIT_CONTROL3_PORT_A,
3d3a1676561cfb drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-02-23  7644  					      1, &eeprom_data);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7645  	}
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7646  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7647  	/* fetch WoL from EEPROM */
847042a6a51e6d drivers/net/ethernet/intel/e1000e/netdev.c Brian Walsh           2016-04-12  7648  	if (ret_val)
847042a6a51e6d drivers/net/ethernet/intel/e1000e/netdev.c Brian Walsh           2016-04-12  7649  		e_dbg("NVM read error getting WoL initial values: %d\n", ret_val);
491a04d2812b0a drivers/net/ethernet/intel/e1000e/netdev.c David Ertman          2014-07-09  7650  	else if (eeprom_data & eeprom_apme_mask)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7651  		adapter->eeprom_wol |= E1000_WUFC_MAG;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7652  
e921eb1ac411a3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-11-28  7653  	/* now that we have the eeprom settings, apply the special cases
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7654  	 * where the eeprom may be wrong or the board simply won't support
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7655  	 * wake on lan on a particular port
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7656  	 */
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7657  	if (!(adapter->flags & FLAG_HAS_WOL))
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7658  		adapter->eeprom_wol = 0;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7659  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7660  	/* initialize the wol settings based on the eeprom settings */
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7661  	adapter->wol = adapter->eeprom_wol;
66148babe728f3 drivers/net/ethernet/intel/e1000e/netdev.c Konstantin Khlebnikov 2013-03-05  7662  
66148babe728f3 drivers/net/ethernet/intel/e1000e/netdev.c Konstantin Khlebnikov 2013-03-05  7663  	/* make sure adapter isn't asleep if manageability is enabled */
66148babe728f3 drivers/net/ethernet/intel/e1000e/netdev.c Konstantin Khlebnikov 2013-03-05  7664  	if (adapter->wol || (adapter->flags & FLAG_MNG_PT_ENABLED) ||
66148babe728f3 drivers/net/ethernet/intel/e1000e/netdev.c Konstantin Khlebnikov 2013-03-05  7665  	    (hw->mac.ops.check_mng_mode(hw)))
66148babe728f3 drivers/net/ethernet/intel/e1000e/netdev.c Konstantin Khlebnikov 2013-03-05  7666  		device_wakeup_enable(&pdev->dev);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7667  
8452759060ad46 drivers/net/e1000e/netdev.c                Bruce Allan           2008-11-21  7668  	/* save off EEPROM version number */
847042a6a51e6d drivers/net/ethernet/intel/e1000e/netdev.c Brian Walsh           2016-04-12  7669  	ret_val = e1000_read_nvm(&adapter->hw, 5, 1, &adapter->eeprom_vers);
491a04d2812b0a drivers/net/ethernet/intel/e1000e/netdev.c David Ertman          2014-07-09  7670  
847042a6a51e6d drivers/net/ethernet/intel/e1000e/netdev.c Brian Walsh           2016-04-12  7671  	if (ret_val) {
847042a6a51e6d drivers/net/ethernet/intel/e1000e/netdev.c Brian Walsh           2016-04-12  7672  		e_dbg("NVM read error getting EEPROM version: %d\n", ret_val);
491a04d2812b0a drivers/net/ethernet/intel/e1000e/netdev.c David Ertman          2014-07-09  7673  		adapter->eeprom_vers = 0;
491a04d2812b0a drivers/net/ethernet/intel/e1000e/netdev.c David Ertman          2014-07-09  7674  	}
8452759060ad46 drivers/net/e1000e/netdev.c                Bruce Allan           2008-11-21  7675  
aa524b66c5efd1 drivers/net/ethernet/intel/e1000e/netdev.c Jacob Keller          2016-04-20  7676  	/* init PTP hardware clock */
aa524b66c5efd1 drivers/net/ethernet/intel/e1000e/netdev.c Jacob Keller          2016-04-20  7677  	e1000e_ptp_init(adapter);
aa524b66c5efd1 drivers/net/ethernet/intel/e1000e/netdev.c Jacob Keller          2016-04-20  7678  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7679  	/* reset the hardware with the new settings */
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7680  	e1000e_reset(adapter);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7681  
e921eb1ac411a3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-11-28  7682  	/* If the controller has AMT, do not set DRV_LOAD until the interface
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7683  	 * is up.  For all other cases, let the f/w know that the h/w is now
ad68076e07fa01 drivers/net/e1000e/netdev.c                Bruce Allan           2008-03-28  7684  	 * under the control of the driver.
ad68076e07fa01 drivers/net/e1000e/netdev.c                Bruce Allan           2008-03-28  7685  	 */
c43bc57e5d7293 drivers/net/e1000e/netdev.c                Jesse Brandeburg      2008-08-04  7686  	if (!(adapter->flags & FLAG_HAS_AMT))
31dbe5b4ac6fca drivers/net/e1000e/netdev.c                Bruce Allan           2011-01-06  7687  		e1000e_get_hw_control(adapter);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7688  
3c98cbf22a96c1 drivers/net/ethernet/intel/e1000e/netdev.c Mario Limonciello     2020-12-14  7689  	if (hw->mac.type >= e1000_pch_cnp)
3c98cbf22a96c1 drivers/net/ethernet/intel/e1000e/netdev.c Mario Limonciello     2020-12-14  7690  		adapter->flags2 |= FLAG2_ENABLE_S0IX_FLOWS;
3c98cbf22a96c1 drivers/net/ethernet/intel/e1000e/netdev.c Mario Limonciello     2020-12-14  7691  
f029c781dd6d8e drivers/net/ethernet/intel/e1000e/netdev.c Wolfram Sang          2022-08-30  7692  	strscpy(netdev->name, "eth%d", sizeof(netdev->name));
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7693  	err = register_netdev(netdev);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7694  	if (err)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7695  		goto err_register;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7696  
9c563d20671e5f drivers/net/e1000e/netdev.c                Jesse Brandeburg      2009-04-17  7697  	/* carrier off reporting is important to ethtool even BEFORE open */
9c563d20671e5f drivers/net/e1000e/netdev.c                Jesse Brandeburg      2009-04-17  7698  	netif_carrier_off(netdev);
9c563d20671e5f drivers/net/e1000e/netdev.c                Jesse Brandeburg      2009-04-17  7699  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7700  	e1000_print_device_info(adapter);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7701  
ccf8b940e5fdd3 drivers/net/ethernet/intel/e1000e/netdev.c Chen Yu               2020-12-01  7702  	dev_pm_set_driver_flags(&pdev->dev, DPM_FLAG_SMART_PREPARE);
59f58708c50472 drivers/net/ethernet/intel/e1000e/netdev.c Kai-Heng Feng         2018-12-11  7703  
d147085183ea1b drivers/net/ethernet/intel/e1000e/netdev.c Kai-Heng Feng         2023-08-15  7704  	if (pci_dev_run_wake(pdev))
f3ec4f87d607f4 drivers/net/e1000e/netdev.c                Alan Stern            2010-06-08  7705  		pm_runtime_put_noidle(&pdev->dev);
23606cf5d1192c drivers/net/e1000e/netdev.c                Rafael J. Wysocki     2010-03-14  7706  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7707  	return 0;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7708  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7709  err_register:
c43bc57e5d7293 drivers/net/e1000e/netdev.c                Jesse Brandeburg      2008-08-04  7710  	if (!(adapter->flags & FLAG_HAS_AMT))
31dbe5b4ac6fca drivers/net/e1000e/netdev.c                Bruce Allan           2011-01-06  7711  		e1000e_release_hw_control(adapter);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7712  err_eeprom:
470a54207ccf70 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan           2012-05-26  7713  	if (hw->phy.ops.check_reset_block && !hw->phy.ops.check_reset_block(hw))
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7714  		e1000_phy_hw_reset(&adapter->hw);
c43bc57e5d7293 drivers/net/e1000e/netdev.c                Jesse Brandeburg      2008-08-04  7715  err_hw_init:
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7716  	kfree(adapter->tx_ring);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7717  	kfree(adapter->rx_ring);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7718  err_sw_init:
1103a631a83408 drivers/net/ethernet/intel/e1000e/netdev.c Yanir Lubetkin        2015-02-28  7719  	if ((adapter->hw.flash_address) && (hw->mac.type < e1000_pch_spt))
c43bc57e5d7293 drivers/net/e1000e/netdev.c                Jesse Brandeburg      2008-08-04  7720  		iounmap(adapter->hw.flash_address);
e82f54ba030b42 drivers/net/e1000e/netdev.c                Jeff Kirsher          2008-11-14  7721  	e1000e_reset_interrupt_capability(adapter);
c43bc57e5d7293 drivers/net/e1000e/netdev.c                Jesse Brandeburg      2008-08-04  7722  err_flashmap:
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7723  	iounmap(adapter->hw.hw_addr);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7724  err_ioremap:
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7725  	free_netdev(netdev);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7726  err_alloc_etherdev:
56d766d64ca5c9 drivers/net/ethernet/intel/e1000e/netdev.c Johannes Thumshirn    2016-06-07  7727  	pci_release_mem_regions(pdev);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7728  err_pci_reg:
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7729  err_dma:
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7730  	pci_disable_device(pdev);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17 @7731  	return err;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7732  }
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok              2007-09-17  7733  

:::::: The code at line 7731 was first introduced by commit
:::::: bc7f75fa97884d41efbfde1397b621fefb2550b4 [E1000E]: New pci-express e1000 driver (currently for ICH9 devices only)

:::::: TO: Auke Kok <auke-jan.h.kok@intel.com>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
