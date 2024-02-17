Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404391E51E
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Feb 2024 23:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708213089; cv=none; b=HZ7GyKFEWqlh4/oEdAy4TNd7v1kEEFuLoNkJqIVb7NnLEYQoIbR2mMvV0iHNQSO27DLHcQWwZQg3qOxxXh/3jrea63TvBUCEsRpy2lpiXZxoi/fU1F8xows4FaFuHXS6zrTgNdUhp5gaROYly7EBPxS+TKw12DVMMhznFD+VsCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708213089; c=relaxed/simple;
	bh=aDW6S0jFZQKfWgdKYARaeCzcDuTQwhxbZW/Ck/mRSU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jWlzB6f6qBY6nUNHvD/XLCVfBiCE3F7vp058H8NeqhtLcGubhrdI3FdPEqQjNM3FVX1L212NAPvQYjLYfElnLZgEXJGAr9631ZkxhuJ/YG+3uzkIalVa6oiHAE6Bu/hwlA+Z/hQ/GtxGiilVcMIGilxwXdZfE5AeQywd+/iGjtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Toe8wZy7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Toe8wZy7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708213087; x=1739749087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aDW6S0jFZQKfWgdKYARaeCzcDuTQwhxbZW/Ck/mRSU4=;
  b=Toe8wZy7Td+XsXHseJklae91YOXOBHnnLBnPXcbT5Aq6LSseYZ11OwC+
   CVNKPivrcywMYOSDaCYHtFz/qXohqyGrenalIfULkp2Cq5lgAimPyU/3G
   PqsVVeoaJqO0x3WPCZgV4vbFDGvT105HXXLyL76bd3c2+xHcW1PKhONyZ
   XDSGQswqyrZ2JsR8BCmmawOuypAp7CbDAX5jLOupyBA1VMI0IDDa5t8iM
   a4v85hFf4zEe6BUA1Xt4/q0QWTotCT+oQIHLCtvgr0NghqMERK35bMMBu
   +pdhktsVMDh29ByWGcCFJTGc+vYA6go76D9ZTDRI5dzyhe81f8XAasg5D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2184822"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2184822"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 15:38:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="8816379"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 17 Feb 2024 15:38:04 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbUFt-0002as-0L;
	Sat, 17 Feb 2024 23:38:01 +0000
Date: Sun, 18 Feb 2024 07:37:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 net-next 4/5] amd-xgbe: Add XGBE_XPCS_ACCESS_V3
 support to xgbe_pci_probe()
Message-ID: <202402180755.pdt7twL2-lkp@intel.com>
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
In-Reply-To: <20240214154842.3577628-5-Raju.Rangoju@amd.com>
References: <20240214154842.3577628-5-Raju.Rangoju@amd.com>
TO: Raju Rangoju <Raju.Rangoju@amd.com>
TO: netdev@vger.kernel.org
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: Shyam-sundar.S-k@amd.com
CC: Raju Rangoju <Raju.Rangoju@amd.com>

Hi Raju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Raju-Rangoju/amd-xgbe-reorganize-the-code-of-XPCS-access/20240215-000248
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240214154842.3577628-5-Raju.Rangoju%40amd.com
patch subject: [PATCH v5 net-next 4/5] amd-xgbe: Add XGBE_XPCS_ACCESS_V3 support to xgbe_pci_probe()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r071-20240215 (https://download.01.org/0day-ci/archive/20240218/202402180755.pdt7twL2-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402180755.pdt7twL2-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/amd/xgbe/xgbe-pci.c:312 xgbe_pci_probe() error: uninitialized symbol 'reg'.

vim +/reg +312 drivers/net/ethernet/amd/xgbe/xgbe-pci.c

47f164deab22a0 Lendacky, Thomas 2016-11-10  208  
47f164deab22a0 Lendacky, Thomas 2016-11-10  209  static int xgbe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
47f164deab22a0 Lendacky, Thomas 2016-11-10  210  {
47f164deab22a0 Lendacky, Thomas 2016-11-10  211  	void __iomem * const *iomap_table;
eec387ef1b0556 Raju Rangoju     2024-02-14  212  	unsigned int port_addr_size, reg;
eec387ef1b0556 Raju Rangoju     2024-02-14  213  	struct device *dev = &pdev->dev;
eec387ef1b0556 Raju Rangoju     2024-02-14  214  	struct xgbe_prv_data *pdata;
47f164deab22a0 Lendacky, Thomas 2016-11-10  215  	unsigned int ma_lo, ma_hi;
eec387ef1b0556 Raju Rangoju     2024-02-14  216  	struct pci_dev *rdev;
eec387ef1b0556 Raju Rangoju     2024-02-14  217  	int bar_mask, ret;
eec387ef1b0556 Raju Rangoju     2024-02-14  218  	u32 address;
47f164deab22a0 Lendacky, Thomas 2016-11-10  219  
47f164deab22a0 Lendacky, Thomas 2016-11-10  220  	pdata = xgbe_alloc_pdata(dev);
47f164deab22a0 Lendacky, Thomas 2016-11-10  221  	if (IS_ERR(pdata)) {
47f164deab22a0 Lendacky, Thomas 2016-11-10  222  		ret = PTR_ERR(pdata);
47f164deab22a0 Lendacky, Thomas 2016-11-10  223  		goto err_alloc;
47f164deab22a0 Lendacky, Thomas 2016-11-10  224  	}
47f164deab22a0 Lendacky, Thomas 2016-11-10  225  
47f164deab22a0 Lendacky, Thomas 2016-11-10  226  	pdata->pcidev = pdev;
47f164deab22a0 Lendacky, Thomas 2016-11-10  227  	pci_set_drvdata(pdev, pdata);
47f164deab22a0 Lendacky, Thomas 2016-11-10  228  
47f164deab22a0 Lendacky, Thomas 2016-11-10  229  	/* Get the version data */
47f164deab22a0 Lendacky, Thomas 2016-11-10  230  	pdata->vdata = (struct xgbe_version_data *)id->driver_data;
47f164deab22a0 Lendacky, Thomas 2016-11-10  231  
47f164deab22a0 Lendacky, Thomas 2016-11-10  232  	ret = pcim_enable_device(pdev);
47f164deab22a0 Lendacky, Thomas 2016-11-10  233  	if (ret) {
47f164deab22a0 Lendacky, Thomas 2016-11-10  234  		dev_err(dev, "pcim_enable_device failed\n");
47f164deab22a0 Lendacky, Thomas 2016-11-10  235  		goto err_pci_enable;
47f164deab22a0 Lendacky, Thomas 2016-11-10  236  	}
47f164deab22a0 Lendacky, Thomas 2016-11-10  237  
47f164deab22a0 Lendacky, Thomas 2016-11-10  238  	/* Obtain the mmio areas for the device */
47f164deab22a0 Lendacky, Thomas 2016-11-10  239  	bar_mask = pci_select_bars(pdev, IORESOURCE_MEM);
47f164deab22a0 Lendacky, Thomas 2016-11-10  240  	ret = pcim_iomap_regions(pdev, bar_mask, XGBE_DRV_NAME);
47f164deab22a0 Lendacky, Thomas 2016-11-10  241  	if (ret) {
47f164deab22a0 Lendacky, Thomas 2016-11-10  242  		dev_err(dev, "pcim_iomap_regions failed\n");
47f164deab22a0 Lendacky, Thomas 2016-11-10  243  		goto err_pci_enable;
47f164deab22a0 Lendacky, Thomas 2016-11-10  244  	}
47f164deab22a0 Lendacky, Thomas 2016-11-10  245  
47f164deab22a0 Lendacky, Thomas 2016-11-10  246  	iomap_table = pcim_iomap_table(pdev);
47f164deab22a0 Lendacky, Thomas 2016-11-10  247  	if (!iomap_table) {
47f164deab22a0 Lendacky, Thomas 2016-11-10  248  		dev_err(dev, "pcim_iomap_table failed\n");
47f164deab22a0 Lendacky, Thomas 2016-11-10  249  		ret = -ENOMEM;
47f164deab22a0 Lendacky, Thomas 2016-11-10  250  		goto err_pci_enable;
47f164deab22a0 Lendacky, Thomas 2016-11-10  251  	}
47f164deab22a0 Lendacky, Thomas 2016-11-10  252  
47f164deab22a0 Lendacky, Thomas 2016-11-10  253  	pdata->xgmac_regs = iomap_table[XGBE_XGMAC_BAR];
47f164deab22a0 Lendacky, Thomas 2016-11-10  254  	if (!pdata->xgmac_regs) {
47f164deab22a0 Lendacky, Thomas 2016-11-10  255  		dev_err(dev, "xgmac ioremap failed\n");
47f164deab22a0 Lendacky, Thomas 2016-11-10  256  		ret = -ENOMEM;
47f164deab22a0 Lendacky, Thomas 2016-11-10  257  		goto err_pci_enable;
47f164deab22a0 Lendacky, Thomas 2016-11-10  258  	}
47f164deab22a0 Lendacky, Thomas 2016-11-10  259  	pdata->xprop_regs = pdata->xgmac_regs + XGBE_MAC_PROP_OFFSET;
47f164deab22a0 Lendacky, Thomas 2016-11-10  260  	pdata->xi2c_regs = pdata->xgmac_regs + XGBE_I2C_CTRL_OFFSET;
47f164deab22a0 Lendacky, Thomas 2016-11-10  261  	if (netif_msg_probe(pdata)) {
47f164deab22a0 Lendacky, Thomas 2016-11-10  262  		dev_dbg(dev, "xgmac_regs = %p\n", pdata->xgmac_regs);
47f164deab22a0 Lendacky, Thomas 2016-11-10  263  		dev_dbg(dev, "xprop_regs = %p\n", pdata->xprop_regs);
47f164deab22a0 Lendacky, Thomas 2016-11-10  264  		dev_dbg(dev, "xi2c_regs  = %p\n", pdata->xi2c_regs);
47f164deab22a0 Lendacky, Thomas 2016-11-10  265  	}
47f164deab22a0 Lendacky, Thomas 2016-11-10  266  
47f164deab22a0 Lendacky, Thomas 2016-11-10  267  	pdata->xpcs_regs = iomap_table[XGBE_XPCS_BAR];
47f164deab22a0 Lendacky, Thomas 2016-11-10  268  	if (!pdata->xpcs_regs) {
47f164deab22a0 Lendacky, Thomas 2016-11-10  269  		dev_err(dev, "xpcs ioremap failed\n");
47f164deab22a0 Lendacky, Thomas 2016-11-10  270  		ret = -ENOMEM;
47f164deab22a0 Lendacky, Thomas 2016-11-10  271  		goto err_pci_enable;
47f164deab22a0 Lendacky, Thomas 2016-11-10  272  	}
47f164deab22a0 Lendacky, Thomas 2016-11-10  273  	if (netif_msg_probe(pdata))
47f164deab22a0 Lendacky, Thomas 2016-11-10  274  		dev_dbg(dev, "xpcs_regs  = %p\n", pdata->xpcs_regs);
47f164deab22a0 Lendacky, Thomas 2016-11-10  275  
4eccbfc3618692 Lendacky, Thomas 2017-01-20  276  	/* Set the PCS indirect addressing definition registers */
4eccbfc3618692 Lendacky, Thomas 2017-01-20  277  	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
597d9659e35b7d Raju Rangoju     2024-02-14  278  	if (rdev && rdev->vendor == PCI_VENDOR_ID_AMD) {
597d9659e35b7d Raju Rangoju     2024-02-14  279  		switch (rdev->device) {
597d9659e35b7d Raju Rangoju     2024-02-14  280  		case XGBE_RV_PCI_DEVICE_ID:
4eccbfc3618692 Lendacky, Thomas 2017-01-20  281  			pdata->xpcs_window_def_reg = PCS_V2_RV_WINDOW_DEF;
4eccbfc3618692 Lendacky, Thomas 2017-01-20  282  			pdata->xpcs_window_sel_reg = PCS_V2_RV_WINDOW_SELECT;
597d9659e35b7d Raju Rangoju     2024-02-14  283  			break;
597d9659e35b7d Raju Rangoju     2024-02-14  284  		case XGBE_YC_PCI_DEVICE_ID:
dbb6c58b5a61d0 Raju Rangoju     2021-12-20  285  			pdata->xpcs_window_def_reg = PCS_V2_YC_WINDOW_DEF;
dbb6c58b5a61d0 Raju Rangoju     2021-12-20  286  			pdata->xpcs_window_sel_reg = PCS_V2_YC_WINDOW_SELECT;
6f60ecf233f9a8 Raju Rangoju     2021-12-20  287  
6f60ecf233f9a8 Raju Rangoju     2021-12-20  288  			/* Yellow Carp devices do not need cdr workaround */
6f60ecf233f9a8 Raju Rangoju     2021-12-20  289  			pdata->vdata->an_cdr_workaround = 0;
f97fc7ef414603 Raju Rangoju     2022-10-20  290  
f97fc7ef414603 Raju Rangoju     2022-10-20  291  			/* Yellow Carp devices do not need rrc */
f97fc7ef414603 Raju Rangoju     2022-10-20  292  			pdata->vdata->enable_rrc = 0;
597d9659e35b7d Raju Rangoju     2024-02-14  293  			break;
eec387ef1b0556 Raju Rangoju     2024-02-14  294  		case XGBE_RN_PCI_DEVICE_ID:
eec387ef1b0556 Raju Rangoju     2024-02-14  295  			pdata->xpcs_window_def_reg = PCS_V3_RN_WINDOW_DEF;
eec387ef1b0556 Raju Rangoju     2024-02-14  296  			pdata->xpcs_window_sel_reg = PCS_V3_RN_WINDOW_SELECT;
eec387ef1b0556 Raju Rangoju     2024-02-14  297  			break;
597d9659e35b7d Raju Rangoju     2024-02-14  298  		default:
597d9659e35b7d Raju Rangoju     2024-02-14  299  			pdata->xpcs_window_def_reg = PCS_V2_WINDOW_DEF;
597d9659e35b7d Raju Rangoju     2024-02-14  300  			pdata->xpcs_window_sel_reg = PCS_V2_WINDOW_SELECT;
597d9659e35b7d Raju Rangoju     2024-02-14  301  			break;
597d9659e35b7d Raju Rangoju     2024-02-14  302  		}
4eccbfc3618692 Lendacky, Thomas 2017-01-20  303  	} else {
4eccbfc3618692 Lendacky, Thomas 2017-01-20  304  		pdata->xpcs_window_def_reg = PCS_V2_WINDOW_DEF;
4eccbfc3618692 Lendacky, Thomas 2017-01-20  305  		pdata->xpcs_window_sel_reg = PCS_V2_WINDOW_SELECT;
4eccbfc3618692 Lendacky, Thomas 2017-01-20  306  	}
4eccbfc3618692 Lendacky, Thomas 2017-01-20  307  	pci_dev_put(rdev);
4eccbfc3618692 Lendacky, Thomas 2017-01-20  308  
47f164deab22a0 Lendacky, Thomas 2016-11-10  309  	/* Configure the PCS indirect addressing support */
eec387ef1b0556 Raju Rangoju     2024-02-14  310  	if (pdata->vdata->xpcs_access == XGBE_XPCS_ACCESS_V3) {
eec387ef1b0556 Raju Rangoju     2024-02-14  311  		port_addr_size = PCS_RN_PORT_ADDR_SIZE *
eec387ef1b0556 Raju Rangoju     2024-02-14 @312  				 XP_GET_BITS(reg, XP_PROP_0, PORT_ID);
eec387ef1b0556 Raju Rangoju     2024-02-14  313  		pdata->smn_base = PCS_RN_SMN_BASE_ADDR + port_addr_size;
eec387ef1b0556 Raju Rangoju     2024-02-14  314  
eec387ef1b0556 Raju Rangoju     2024-02-14  315  		address = pdata->smn_base + (pdata->xpcs_window_def_reg);
eec387ef1b0556 Raju Rangoju     2024-02-14  316  		reg = XP_IOREAD(pdata, XP_PROP_0);
eec387ef1b0556 Raju Rangoju     2024-02-14  317  		amd_smn_read(0, address, &reg);
eec387ef1b0556 Raju Rangoju     2024-02-14  318  	} else {
4eccbfc3618692 Lendacky, Thomas 2017-01-20  319  		reg = XPCS32_IOREAD(pdata, pdata->xpcs_window_def_reg);
eec387ef1b0556 Raju Rangoju     2024-02-14  320  	}
eec387ef1b0556 Raju Rangoju     2024-02-14  321  
47f164deab22a0 Lendacky, Thomas 2016-11-10  322  	pdata->xpcs_window = XPCS_GET_BITS(reg, PCS_V2_WINDOW_DEF, OFFSET);
47f164deab22a0 Lendacky, Thomas 2016-11-10  323  	pdata->xpcs_window <<= 6;
47f164deab22a0 Lendacky, Thomas 2016-11-10  324  	pdata->xpcs_window_size = XPCS_GET_BITS(reg, PCS_V2_WINDOW_DEF, SIZE);
47f164deab22a0 Lendacky, Thomas 2016-11-10  325  	pdata->xpcs_window_size = 1 << (pdata->xpcs_window_size + 7);
47f164deab22a0 Lendacky, Thomas 2016-11-10  326  	pdata->xpcs_window_mask = pdata->xpcs_window_size - 1;
47f164deab22a0 Lendacky, Thomas 2016-11-10  327  	if (netif_msg_probe(pdata)) {
40452f0ec84a3b Lendacky, Thomas 2017-08-18  328  		dev_dbg(dev, "xpcs window def  = %#010x\n",
40452f0ec84a3b Lendacky, Thomas 2017-08-18  329  			pdata->xpcs_window_def_reg);
40452f0ec84a3b Lendacky, Thomas 2017-08-18  330  		dev_dbg(dev, "xpcs window sel  = %#010x\n",
40452f0ec84a3b Lendacky, Thomas 2017-08-18  331  			pdata->xpcs_window_sel_reg);
47f164deab22a0 Lendacky, Thomas 2016-11-10  332  		dev_dbg(dev, "xpcs window      = %#010x\n",
47f164deab22a0 Lendacky, Thomas 2016-11-10  333  			pdata->xpcs_window);
47f164deab22a0 Lendacky, Thomas 2016-11-10  334  		dev_dbg(dev, "xpcs window size = %#010x\n",
47f164deab22a0 Lendacky, Thomas 2016-11-10  335  			pdata->xpcs_window_size);
47f164deab22a0 Lendacky, Thomas 2016-11-10  336  		dev_dbg(dev, "xpcs window mask = %#010x\n",
47f164deab22a0 Lendacky, Thomas 2016-11-10  337  			pdata->xpcs_window_mask);
47f164deab22a0 Lendacky, Thomas 2016-11-10  338  	}
47f164deab22a0 Lendacky, Thomas 2016-11-10  339  
47f164deab22a0 Lendacky, Thomas 2016-11-10  340  	pci_set_master(pdev);
47f164deab22a0 Lendacky, Thomas 2016-11-10  341  
47f164deab22a0 Lendacky, Thomas 2016-11-10  342  	/* Enable all interrupts in the hardware */
47f164deab22a0 Lendacky, Thomas 2016-11-10  343  	XP_IOWRITE(pdata, XP_INT_EN, 0x1fffff);
47f164deab22a0 Lendacky, Thomas 2016-11-10  344  
47f164deab22a0 Lendacky, Thomas 2016-11-10  345  	/* Retrieve the MAC address */
47f164deab22a0 Lendacky, Thomas 2016-11-10  346  	ma_lo = XP_IOREAD(pdata, XP_MAC_ADDR_LO);
47f164deab22a0 Lendacky, Thomas 2016-11-10  347  	ma_hi = XP_IOREAD(pdata, XP_MAC_ADDR_HI);
47f164deab22a0 Lendacky, Thomas 2016-11-10  348  	pdata->mac_addr[0] = ma_lo & 0xff;
47f164deab22a0 Lendacky, Thomas 2016-11-10  349  	pdata->mac_addr[1] = (ma_lo >> 8) & 0xff;
47f164deab22a0 Lendacky, Thomas 2016-11-10  350  	pdata->mac_addr[2] = (ma_lo >> 16) & 0xff;
47f164deab22a0 Lendacky, Thomas 2016-11-10  351  	pdata->mac_addr[3] = (ma_lo >> 24) & 0xff;
47f164deab22a0 Lendacky, Thomas 2016-11-10  352  	pdata->mac_addr[4] = ma_hi & 0xff;
47f164deab22a0 Lendacky, Thomas 2016-11-10  353  	pdata->mac_addr[5] = (ma_hi >> 8) & 0xff;
47f164deab22a0 Lendacky, Thomas 2016-11-10  354  	if (!XP_GET_BITS(ma_hi, XP_MAC_ADDR_HI, VALID) ||
47f164deab22a0 Lendacky, Thomas 2016-11-10  355  	    !is_valid_ether_addr(pdata->mac_addr)) {
47f164deab22a0 Lendacky, Thomas 2016-11-10  356  		dev_err(dev, "invalid mac address\n");
47f164deab22a0 Lendacky, Thomas 2016-11-10  357  		ret = -EINVAL;
47f164deab22a0 Lendacky, Thomas 2016-11-10  358  		goto err_pci_enable;
47f164deab22a0 Lendacky, Thomas 2016-11-10  359  	}
47f164deab22a0 Lendacky, Thomas 2016-11-10  360  
47f164deab22a0 Lendacky, Thomas 2016-11-10  361  	/* Clock settings */
47f164deab22a0 Lendacky, Thomas 2016-11-10  362  	pdata->sysclk_rate = XGBE_V2_DMA_CLOCK_FREQ;
47f164deab22a0 Lendacky, Thomas 2016-11-10  363  	pdata->ptpclk_rate = XGBE_V2_PTP_CLOCK_FREQ;
47f164deab22a0 Lendacky, Thomas 2016-11-10  364  
47f164deab22a0 Lendacky, Thomas 2016-11-10  365  	/* Set the DMA coherency values */
47f164deab22a0 Lendacky, Thomas 2016-11-10  366  	pdata->coherent = 1;
6f595959c095d8 Lendacky, Thomas 2017-06-28  367  	pdata->arcr = XGBE_DMA_PCI_ARCR;
6f595959c095d8 Lendacky, Thomas 2017-06-28  368  	pdata->awcr = XGBE_DMA_PCI_AWCR;
6f595959c095d8 Lendacky, Thomas 2017-06-28  369  	pdata->awarcr = XGBE_DMA_PCI_AWARCR;
47f164deab22a0 Lendacky, Thomas 2016-11-10  370  
b93c3ab6006b37 Tom Lendacky     2018-05-23  371  	/* Read the port property registers */
b93c3ab6006b37 Tom Lendacky     2018-05-23  372  	pdata->pp0 = XP_IOREAD(pdata, XP_PROP_0);
b93c3ab6006b37 Tom Lendacky     2018-05-23  373  	pdata->pp1 = XP_IOREAD(pdata, XP_PROP_1);
b93c3ab6006b37 Tom Lendacky     2018-05-23  374  	pdata->pp2 = XP_IOREAD(pdata, XP_PROP_2);
b93c3ab6006b37 Tom Lendacky     2018-05-23  375  	pdata->pp3 = XP_IOREAD(pdata, XP_PROP_3);
b93c3ab6006b37 Tom Lendacky     2018-05-23  376  	pdata->pp4 = XP_IOREAD(pdata, XP_PROP_4);
b93c3ab6006b37 Tom Lendacky     2018-05-23  377  	if (netif_msg_probe(pdata)) {
b93c3ab6006b37 Tom Lendacky     2018-05-23  378  		dev_dbg(dev, "port property 0 = %#010x\n", pdata->pp0);
b93c3ab6006b37 Tom Lendacky     2018-05-23  379  		dev_dbg(dev, "port property 1 = %#010x\n", pdata->pp1);
b93c3ab6006b37 Tom Lendacky     2018-05-23  380  		dev_dbg(dev, "port property 2 = %#010x\n", pdata->pp2);
b93c3ab6006b37 Tom Lendacky     2018-05-23  381  		dev_dbg(dev, "port property 3 = %#010x\n", pdata->pp3);
b93c3ab6006b37 Tom Lendacky     2018-05-23  382  		dev_dbg(dev, "port property 4 = %#010x\n", pdata->pp4);
b93c3ab6006b37 Tom Lendacky     2018-05-23  383  	}
b93c3ab6006b37 Tom Lendacky     2018-05-23  384  
47f164deab22a0 Lendacky, Thomas 2016-11-10  385  	/* Set the maximum channels and queues */
b93c3ab6006b37 Tom Lendacky     2018-05-23  386  	pdata->tx_max_channel_count = XP_GET_BITS(pdata->pp1, XP_PROP_1,
b93c3ab6006b37 Tom Lendacky     2018-05-23  387  						  MAX_TX_DMA);
b93c3ab6006b37 Tom Lendacky     2018-05-23  388  	pdata->rx_max_channel_count = XP_GET_BITS(pdata->pp1, XP_PROP_1,
b93c3ab6006b37 Tom Lendacky     2018-05-23  389  						  MAX_RX_DMA);
b93c3ab6006b37 Tom Lendacky     2018-05-23  390  	pdata->tx_max_q_count = XP_GET_BITS(pdata->pp1, XP_PROP_1,
b93c3ab6006b37 Tom Lendacky     2018-05-23  391  					    MAX_TX_QUEUES);
b93c3ab6006b37 Tom Lendacky     2018-05-23  392  	pdata->rx_max_q_count = XP_GET_BITS(pdata->pp1, XP_PROP_1,
b93c3ab6006b37 Tom Lendacky     2018-05-23  393  					    MAX_RX_QUEUES);
47f164deab22a0 Lendacky, Thomas 2016-11-10  394  	if (netif_msg_probe(pdata)) {
47f164deab22a0 Lendacky, Thomas 2016-11-10  395  		dev_dbg(dev, "max tx/rx channel count = %u/%u\n",
47f164deab22a0 Lendacky, Thomas 2016-11-10  396  			pdata->tx_max_channel_count,
6c2799c11e3681 Tom Lendacky     2018-05-23  397  			pdata->rx_max_channel_count);
47f164deab22a0 Lendacky, Thomas 2016-11-10  398  		dev_dbg(dev, "max tx/rx hw queue count = %u/%u\n",
47f164deab22a0 Lendacky, Thomas 2016-11-10  399  			pdata->tx_max_q_count, pdata->rx_max_q_count);
47f164deab22a0 Lendacky, Thomas 2016-11-10  400  	}
47f164deab22a0 Lendacky, Thomas 2016-11-10  401  
47f164deab22a0 Lendacky, Thomas 2016-11-10  402  	/* Set the hardware channel and queue counts */
47f164deab22a0 Lendacky, Thomas 2016-11-10  403  	xgbe_set_counts(pdata);
47f164deab22a0 Lendacky, Thomas 2016-11-10  404  
47f164deab22a0 Lendacky, Thomas 2016-11-10  405  	/* Set the maximum fifo amounts */
b93c3ab6006b37 Tom Lendacky     2018-05-23  406  	pdata->tx_max_fifo_size = XP_GET_BITS(pdata->pp2, XP_PROP_2,
b93c3ab6006b37 Tom Lendacky     2018-05-23  407  					      TX_FIFO_SIZE);
47f164deab22a0 Lendacky, Thomas 2016-11-10  408  	pdata->tx_max_fifo_size *= 16384;
47f164deab22a0 Lendacky, Thomas 2016-11-10  409  	pdata->tx_max_fifo_size = min(pdata->tx_max_fifo_size,
47f164deab22a0 Lendacky, Thomas 2016-11-10  410  				      pdata->vdata->tx_max_fifo_size);
b93c3ab6006b37 Tom Lendacky     2018-05-23  411  	pdata->rx_max_fifo_size = XP_GET_BITS(pdata->pp2, XP_PROP_2,
b93c3ab6006b37 Tom Lendacky     2018-05-23  412  					      RX_FIFO_SIZE);
47f164deab22a0 Lendacky, Thomas 2016-11-10  413  	pdata->rx_max_fifo_size *= 16384;
47f164deab22a0 Lendacky, Thomas 2016-11-10  414  	pdata->rx_max_fifo_size = min(pdata->rx_max_fifo_size,
47f164deab22a0 Lendacky, Thomas 2016-11-10  415  				      pdata->vdata->rx_max_fifo_size);
47f164deab22a0 Lendacky, Thomas 2016-11-10  416  	if (netif_msg_probe(pdata))
47f164deab22a0 Lendacky, Thomas 2016-11-10  417  		dev_dbg(dev, "max tx/rx max fifo size = %u/%u\n",
47f164deab22a0 Lendacky, Thomas 2016-11-10  418  			pdata->tx_max_fifo_size, pdata->rx_max_fifo_size);
47f164deab22a0 Lendacky, Thomas 2016-11-10  419  
47f164deab22a0 Lendacky, Thomas 2016-11-10  420  	/* Configure interrupt support */
47f164deab22a0 Lendacky, Thomas 2016-11-10  421  	ret = xgbe_config_irqs(pdata);
47f164deab22a0 Lendacky, Thomas 2016-11-10  422  	if (ret)
47f164deab22a0 Lendacky, Thomas 2016-11-10  423  		goto err_pci_enable;
47f164deab22a0 Lendacky, Thomas 2016-11-10  424  
47f164deab22a0 Lendacky, Thomas 2016-11-10  425  	/* Configure the netdev resource */
47f164deab22a0 Lendacky, Thomas 2016-11-10  426  	ret = xgbe_config_netdev(pdata);
47f164deab22a0 Lendacky, Thomas 2016-11-10  427  	if (ret)
e75377404726be Tom Lendacky     2017-01-13  428  		goto err_irq_vectors;
47f164deab22a0 Lendacky, Thomas 2016-11-10  429  
47f164deab22a0 Lendacky, Thomas 2016-11-10  430  	netdev_notice(pdata->netdev, "net device enabled\n");
47f164deab22a0 Lendacky, Thomas 2016-11-10  431  
47f164deab22a0 Lendacky, Thomas 2016-11-10  432  	return 0;
47f164deab22a0 Lendacky, Thomas 2016-11-10  433  
e75377404726be Tom Lendacky     2017-01-13  434  err_irq_vectors:
e75377404726be Tom Lendacky     2017-01-13  435  	pci_free_irq_vectors(pdata->pcidev);
e75377404726be Tom Lendacky     2017-01-13  436  
47f164deab22a0 Lendacky, Thomas 2016-11-10  437  err_pci_enable:
47f164deab22a0 Lendacky, Thomas 2016-11-10  438  	xgbe_free_pdata(pdata);
47f164deab22a0 Lendacky, Thomas 2016-11-10  439  
47f164deab22a0 Lendacky, Thomas 2016-11-10  440  err_alloc:
47f164deab22a0 Lendacky, Thomas 2016-11-10  441  	dev_notice(dev, "net device not enabled\n");
47f164deab22a0 Lendacky, Thomas 2016-11-10  442  
47f164deab22a0 Lendacky, Thomas 2016-11-10  443  	return ret;
47f164deab22a0 Lendacky, Thomas 2016-11-10  444  }
47f164deab22a0 Lendacky, Thomas 2016-11-10  445  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
