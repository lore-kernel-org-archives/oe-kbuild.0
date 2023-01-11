Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E4AB446
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Jan 2023 03:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673406702; x=1704942702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8yJNhp7kSzZCkMoX8lCICHDH9QqiGQERlh/i1T8tNY=;
  b=JCp5z+Yq43nxDNrGWKtGI6exLtTU45tpGVUgf4Icdy3n0veYjW8Yv7wd
   bGPRiuDzQAnv8rUWo5iYsqwqyXjRckZTHX/0oP+CwQEN1YeF602uXuEN1
   lHx/n9+QsuaNRcaFHL0FblrPvZKo4sgZ6YKOXSs5V6M3TvHpciL6OfSyw
   Gdhl+HdPSun6CG+vgtfw5FX2DxSm+kZjMyEWOJcJibJhjnHDkvXHa7SLM
   R+iq6uGjASBzB/9RR/k2ivtHmXphTjFGDFH8mV6Dpxt2TKD/l6Xwze7uI
   Dq+x+yRcWsW0qPu72AjmrzcgcA6tTWlLziaIuN9O9kFWcPvqXF+Wv6pbn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311128539"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="311128539"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 19:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="985991792"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="985991792"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jan 2023 19:11:40 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFRWd-0008fs-2w;
	Wed, 11 Jan 2023 03:11:39 +0000
Date: Wed, 11 Jan 2023 11:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:341:13: warning:
 Variable 'func_nums' is not assigned a value. [unassignedVariable]
Message-ID: <202301111128.T7hDgdwc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:341:13: warning: Variable 'func_nums' is not assigned a value. [unassignedVariable]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mengyuan Lou <mengyuanlou@net-swift.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7dd4b804e08041ff56c88bdd8da742d14b17ed25
commit: 02338c484ab6250b81f0266ffb40d53c3efe0f47 net: ngbe: Initialize sw info and register netdev
date:   2 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 months ago
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 02338c484ab6250b81f0266ffb40d53c3efe0f47
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:341:13: warning: Variable 'func_nums' is not assigned a value. [unassignedVariable]
    static int func_nums;
               ^

vim +/func_nums +341 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c

02338c484ab625 Mengyuan Lou 2022-10-31  321  
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  322  /**
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  323   * ngbe_probe - Device Initialization Routine
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  324   * @pdev: PCI device information struct
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  325   * @ent: entry in ngbe_pci_tbl
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  326   *
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  327   * Returns 0 on success, negative on failure
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  328   *
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  329   * ngbe_probe initializes an adapter identified by a pci_dev structure.
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  330   * The OS initialization, configuring of the adapter private structure,
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  331   * and a hardware reset occur.
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  332   **/
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  333  static int ngbe_probe(struct pci_dev *pdev,
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  334  		      const struct pci_device_id __always_unused *ent)
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  335  {
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  336  	struct ngbe_adapter *adapter = NULL;
02338c484ab625 Mengyuan Lou 2022-10-31  337  	struct ngbe_hw *hw = NULL;
02338c484ab625 Mengyuan Lou 2022-10-31  338  	struct wx_hw *wxhw = NULL;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  339  	struct net_device *netdev;
02338c484ab625 Mengyuan Lou 2022-10-31  340  	u32 e2rom_cksum_cap = 0;
02338c484ab625 Mengyuan Lou 2022-10-31 @341  	static int func_nums;
02338c484ab625 Mengyuan Lou 2022-10-31  342  	u16 e2rom_ver = 0;
02338c484ab625 Mengyuan Lou 2022-10-31  343  	u32 etrack_id = 0;
02338c484ab625 Mengyuan Lou 2022-10-31  344  	u32 saved_ver = 0;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  345  	int err;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  346  
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  347  	err = pci_enable_device_mem(pdev);
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  348  	if (err)
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  349  		return err;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  350  
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  351  	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  352  	if (err) {
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  353  		dev_err(&pdev->dev,
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  354  			"No usable DMA configuration, aborting\n");
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  355  		goto err_pci_disable_dev;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  356  	}
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  357  
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  358  	err = pci_request_selected_regions(pdev,
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  359  					   pci_select_bars(pdev, IORESOURCE_MEM),
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  360  					   ngbe_driver_name);
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  361  	if (err) {
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  362  		dev_err(&pdev->dev,
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  363  			"pci_request_selected_regions failed %d\n", err);
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  364  		goto err_pci_disable_dev;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  365  	}
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  366  
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  367  	pci_enable_pcie_error_reporting(pdev);
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  368  	pci_set_master(pdev);
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  369  
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  370  	netdev = devm_alloc_etherdev_mqs(&pdev->dev,
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  371  					 sizeof(struct ngbe_adapter),
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  372  					 NGBE_MAX_TX_QUEUES,
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  373  					 NGBE_MAX_RX_QUEUES);
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  374  	if (!netdev) {
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  375  		err = -ENOMEM;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  376  		goto err_pci_release_regions;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  377  	}
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  378  
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  379  	SET_NETDEV_DEV(netdev, &pdev->dev);
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  380  
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  381  	adapter = netdev_priv(netdev);
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  382  	adapter->netdev = netdev;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  383  	adapter->pdev = pdev;
02338c484ab625 Mengyuan Lou 2022-10-31  384  	hw = &adapter->hw;
02338c484ab625 Mengyuan Lou 2022-10-31  385  	wxhw = &hw->wxhw;
02338c484ab625 Mengyuan Lou 2022-10-31  386  	adapter->msg_enable = BIT(3) - 1;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  387  
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  388  	adapter->io_addr = devm_ioremap(&pdev->dev,
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  389  					pci_resource_start(pdev, 0),
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  390  					pci_resource_len(pdev, 0));
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  391  	if (!adapter->io_addr) {
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  392  		err = -EIO;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  393  		goto err_pci_release_regions;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  394  	}
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  395  
02338c484ab625 Mengyuan Lou 2022-10-31  396  	netdev->netdev_ops = &ngbe_netdev_ops;
02338c484ab625 Mengyuan Lou 2022-10-31  397  
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  398  	netdev->features |= NETIF_F_HIGHDMA;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  399  
02338c484ab625 Mengyuan Lou 2022-10-31  400  	adapter->bd_number = func_nums;
02338c484ab625 Mengyuan Lou 2022-10-31  401  	/* setup the private structure */
02338c484ab625 Mengyuan Lou 2022-10-31  402  	err = ngbe_sw_init(adapter);
02338c484ab625 Mengyuan Lou 2022-10-31  403  	if (err)
02338c484ab625 Mengyuan Lou 2022-10-31  404  		goto err_free_mac_table;
02338c484ab625 Mengyuan Lou 2022-10-31  405  
02338c484ab625 Mengyuan Lou 2022-10-31  406  	/* check if flash load is done after hw power up */
02338c484ab625 Mengyuan Lou 2022-10-31  407  	err = wx_check_flash_load(wxhw, NGBE_SPI_ILDR_STATUS_PERST);
02338c484ab625 Mengyuan Lou 2022-10-31  408  	if (err)
02338c484ab625 Mengyuan Lou 2022-10-31  409  		goto err_free_mac_table;
02338c484ab625 Mengyuan Lou 2022-10-31  410  	err = wx_check_flash_load(wxhw, NGBE_SPI_ILDR_STATUS_PWRRST);
02338c484ab625 Mengyuan Lou 2022-10-31  411  	if (err)
02338c484ab625 Mengyuan Lou 2022-10-31  412  		goto err_free_mac_table;
02338c484ab625 Mengyuan Lou 2022-10-31  413  
02338c484ab625 Mengyuan Lou 2022-10-31  414  	err = wx_mng_present(wxhw);
02338c484ab625 Mengyuan Lou 2022-10-31  415  	if (err) {
02338c484ab625 Mengyuan Lou 2022-10-31  416  		dev_err(&pdev->dev, "Management capability is not present\n");
02338c484ab625 Mengyuan Lou 2022-10-31  417  		goto err_free_mac_table;
02338c484ab625 Mengyuan Lou 2022-10-31  418  	}
02338c484ab625 Mengyuan Lou 2022-10-31  419  
02338c484ab625 Mengyuan Lou 2022-10-31  420  	err = ngbe_reset_hw(hw);
02338c484ab625 Mengyuan Lou 2022-10-31  421  	if (err) {
02338c484ab625 Mengyuan Lou 2022-10-31  422  		dev_err(&pdev->dev, "HW Init failed: %d\n", err);
02338c484ab625 Mengyuan Lou 2022-10-31  423  		goto err_free_mac_table;
02338c484ab625 Mengyuan Lou 2022-10-31  424  	}
02338c484ab625 Mengyuan Lou 2022-10-31  425  
02338c484ab625 Mengyuan Lou 2022-10-31  426  	if (wxhw->bus.func == 0) {
02338c484ab625 Mengyuan Lou 2022-10-31  427  		wr32(wxhw, NGBE_CALSUM_CAP_STATUS, 0x0);
02338c484ab625 Mengyuan Lou 2022-10-31  428  		wr32(wxhw, NGBE_EEPROM_VERSION_STORE_REG, 0x0);
02338c484ab625 Mengyuan Lou 2022-10-31  429  	} else {
02338c484ab625 Mengyuan Lou 2022-10-31  430  		e2rom_cksum_cap = rd32(wxhw, NGBE_CALSUM_CAP_STATUS);
02338c484ab625 Mengyuan Lou 2022-10-31  431  		saved_ver = rd32(wxhw, NGBE_EEPROM_VERSION_STORE_REG);
02338c484ab625 Mengyuan Lou 2022-10-31  432  	}
02338c484ab625 Mengyuan Lou 2022-10-31  433  
02338c484ab625 Mengyuan Lou 2022-10-31  434  	wx_init_eeprom_params(wxhw);
02338c484ab625 Mengyuan Lou 2022-10-31  435  	if (wxhw->bus.func == 0 || e2rom_cksum_cap == 0) {
02338c484ab625 Mengyuan Lou 2022-10-31  436  		/* make sure the EEPROM is ready */
02338c484ab625 Mengyuan Lou 2022-10-31  437  		err = ngbe_eeprom_chksum_hostif(hw);
02338c484ab625 Mengyuan Lou 2022-10-31  438  		if (err) {
02338c484ab625 Mengyuan Lou 2022-10-31  439  			dev_err(&pdev->dev, "The EEPROM Checksum Is Not Valid\n");
02338c484ab625 Mengyuan Lou 2022-10-31  440  			err = -EIO;
02338c484ab625 Mengyuan Lou 2022-10-31  441  			goto err_free_mac_table;
02338c484ab625 Mengyuan Lou 2022-10-31  442  		}
02338c484ab625 Mengyuan Lou 2022-10-31  443  	}
02338c484ab625 Mengyuan Lou 2022-10-31  444  
02338c484ab625 Mengyuan Lou 2022-10-31  445  	adapter->wol = 0;
02338c484ab625 Mengyuan Lou 2022-10-31  446  	if (hw->wol_enabled)
02338c484ab625 Mengyuan Lou 2022-10-31  447  		adapter->wol = NGBE_PSR_WKUP_CTL_MAG;
02338c484ab625 Mengyuan Lou 2022-10-31  448  
02338c484ab625 Mengyuan Lou 2022-10-31  449  	hw->wol_enabled = !!(adapter->wol);
02338c484ab625 Mengyuan Lou 2022-10-31  450  	wr32(wxhw, NGBE_PSR_WKUP_CTL, adapter->wol);
02338c484ab625 Mengyuan Lou 2022-10-31  451  
02338c484ab625 Mengyuan Lou 2022-10-31  452  	device_set_wakeup_enable(&pdev->dev, adapter->wol);
02338c484ab625 Mengyuan Lou 2022-10-31  453  
02338c484ab625 Mengyuan Lou 2022-10-31  454  	/* Save off EEPROM version number and Option Rom version which
02338c484ab625 Mengyuan Lou 2022-10-31  455  	 * together make a unique identify for the eeprom
02338c484ab625 Mengyuan Lou 2022-10-31  456  	 */
02338c484ab625 Mengyuan Lou 2022-10-31  457  	if (saved_ver) {
02338c484ab625 Mengyuan Lou 2022-10-31  458  		etrack_id = saved_ver;
02338c484ab625 Mengyuan Lou 2022-10-31  459  	} else {
02338c484ab625 Mengyuan Lou 2022-10-31  460  		wx_read_ee_hostif(wxhw,
02338c484ab625 Mengyuan Lou 2022-10-31  461  				  wxhw->eeprom.sw_region_offset + NGBE_EEPROM_VERSION_H,
02338c484ab625 Mengyuan Lou 2022-10-31  462  				  &e2rom_ver);
02338c484ab625 Mengyuan Lou 2022-10-31  463  		etrack_id = e2rom_ver << 16;
02338c484ab625 Mengyuan Lou 2022-10-31  464  		wx_read_ee_hostif(wxhw,
02338c484ab625 Mengyuan Lou 2022-10-31  465  				  wxhw->eeprom.sw_region_offset + NGBE_EEPROM_VERSION_L,
02338c484ab625 Mengyuan Lou 2022-10-31  466  				  &e2rom_ver);
02338c484ab625 Mengyuan Lou 2022-10-31  467  		etrack_id |= e2rom_ver;
02338c484ab625 Mengyuan Lou 2022-10-31  468  		wr32(wxhw, NGBE_EEPROM_VERSION_STORE_REG, etrack_id);
02338c484ab625 Mengyuan Lou 2022-10-31  469  	}
02338c484ab625 Mengyuan Lou 2022-10-31  470  
02338c484ab625 Mengyuan Lou 2022-10-31  471  	eth_hw_addr_set(netdev, wxhw->mac.perm_addr);
02338c484ab625 Mengyuan Lou 2022-10-31  472  	ngbe_mac_set_default_filter(adapter, wxhw->mac.perm_addr);
02338c484ab625 Mengyuan Lou 2022-10-31  473  
02338c484ab625 Mengyuan Lou 2022-10-31  474  	err = register_netdev(netdev);
02338c484ab625 Mengyuan Lou 2022-10-31  475  	if (err)
02338c484ab625 Mengyuan Lou 2022-10-31  476  		goto err_register;
02338c484ab625 Mengyuan Lou 2022-10-31  477  
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  478  	pci_set_drvdata(pdev, adapter);
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  479  
02338c484ab625 Mengyuan Lou 2022-10-31  480  	netif_info(adapter, probe, netdev,
02338c484ab625 Mengyuan Lou 2022-10-31  481  		   "PHY: %s, PBA No: Wang Xun GbE Family Controller\n",
02338c484ab625 Mengyuan Lou 2022-10-31  482  		   hw->phy.type == ngbe_phy_internal ? "Internal" : "External");
02338c484ab625 Mengyuan Lou 2022-10-31  483  	netif_info(adapter, probe, netdev, "%pM\n", netdev->dev_addr);
02338c484ab625 Mengyuan Lou 2022-10-31  484  
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  485  	return 0;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  486  
02338c484ab625 Mengyuan Lou 2022-10-31  487  err_register:
02338c484ab625 Mengyuan Lou 2022-10-31  488  	wx_control_hw(wxhw, false);
02338c484ab625 Mengyuan Lou 2022-10-31  489  err_free_mac_table:
02338c484ab625 Mengyuan Lou 2022-10-31  490  	kfree(adapter->mac_table);
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  491  err_pci_release_regions:
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  492  	pci_disable_pcie_error_reporting(pdev);
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  493  	pci_release_selected_regions(pdev,
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  494  				     pci_select_bars(pdev, IORESOURCE_MEM));
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  495  err_pci_disable_dev:
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  496  	pci_disable_device(pdev);
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  497  	return err;
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  498  }
e79e40c83b9fd4 Mengyuan Lou 2022-08-26  499  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
