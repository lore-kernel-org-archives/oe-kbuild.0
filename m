Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415A321E3C1
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Oct 2024 05:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729142763; cv=none; b=Z82iPqSWeKg6p8IsviQ+TUc6DaIEHFRpaGb4ZA+lyKIvx/sp1kF+K7ySQsjjiIPhlnSBVhAABcGb+UeoPxyETCzYqlWSpMhj9Zj7G/npLUWFBM87Dbrxc8r0dVfU9og0epe0CXyQVV50KNH5gVfRwGAupPntqZ+JFTaSWCTTHy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729142763; c=relaxed/simple;
	bh=fWDSxEN7l2j03E0fZrvY3H0jKYoqEVj7uBL4+z8LzQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CqHRfUXButP4rvg6KPT+Bw2yUXE85lgrTF2WBFwmS7BbgfFOgIZdarK7LSO39eHWWbwjdakzLs/3I4uElZ/k+MRediY3FO1+jwmWzyPpM4tBNYjMN670JlyPgcKMRK/sernSt/cNYjSbbpwBVEyT32aAe3h6xC9/bvjSbaE4PRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/yJRO2k; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/yJRO2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729142760; x=1760678760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fWDSxEN7l2j03E0fZrvY3H0jKYoqEVj7uBL4+z8LzQ8=;
  b=V/yJRO2kQMEgiJ2H582Hc2orQ3TYXDnICELZTrbFPQLVt7oXRj44bs6w
   IVg6k75Z01vnM0aVPtYmVkUkiYjZMJhIv/L+OcrAV+18vOmj8vfHsVbH3
   ECOyLo88mxzhUzG6rE+tcoCT4k4lacdCHHijXwseGWDX5wc8zQcwqMCDs
   XNLyzi3HBs9v76p50Y4seOvWzRgMnav87seL2OB+tZ5LGfkJOR/JiwSrf
   G3HKZSXashZ0v18iDtcUN/Orm0UZgsOkl56QPeKE6/1a1K8Fo5Uc6dP8r
   IchjIWegikAJMz3LRQijsaCeKT4qjV+2sDBvKO1hnjOWe/FItc6xOGLai
   A==;
X-CSE-ConnectionGUID: wH4krC0QRkSt6NMn1MVOtA==
X-CSE-MsgGUID: KYwBphnnSaSywQLGDBUH1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28084378"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="28084378"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 22:26:00 -0700
X-CSE-ConnectionGUID: B5qzETbJRGeWaN7mnegUoQ==
X-CSE-MsgGUID: KKHetvFhQKyMtopPLzAY0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78051149"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Oct 2024 22:25:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1J1H-000LlX-2K;
	Thu, 17 Oct 2024 05:25:55 +0000
Date: Thu, 17 Oct 2024 13:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/realtek/r8169_main.c:5382:7-23: opportunity for
 str_enabled_disabled(tp -> dash_enabled)
Message-ID: <202410171335.FFcAGzRD-lkp@intel.com>
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
TO: ChunHao Lin <hau@realtek.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Heiner Kallweit <hkallweit1@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c964ced7726294d40913f2127c3f185a92cb4a41
commit: 0ab0c45d8aaea5192328bfa6989673aceafc767c r8169: add handling DASH when DASH is disabled
date:   11 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 11 months ago
config: sparc-randconfig-r062-20241017 (https://download.01.org/0day-ci/archive/20241017/202410171335.FFcAGzRD-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410171335.FFcAGzRD-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/realtek/r8169_main.c:5382:7-23: opportunity for str_enabled_disabled(tp -> dash_enabled)

vim +5382 drivers/net/ethernet/realtek/r8169_main.c

cf2ffdea083939 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-07-18  5190  
929a031dfd62aa drivers/net/ethernet/realtek/r8169.c      hayeswang                 2014-09-16  5191  static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5192  {
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5193  	struct rtl8169_private *tp;
f1f9ca2875692e drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-02-15  5194  	int jumbo_max, region, rc;
f1f9ca2875692e drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-02-15  5195  	enum mac_version chipset;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5196  	struct net_device *dev;
bc590b47549225 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-28  5197  	u32 txconfig;
f1f9ca2875692e drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-02-15  5198  	u16 xid;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5199  
4c45d24a759d8e drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2017-12-12  5200  	dev = devm_alloc_etherdev(&pdev->dev, sizeof (*tp));
4c45d24a759d8e drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2017-12-12  5201  	if (!dev)
4c45d24a759d8e drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2017-12-12  5202  		return -ENOMEM;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5203  
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5204  	SET_NETDEV_DEV(dev, &pdev->dev);
fa9c385ef57c1a drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5205  	dev->netdev_ops = &rtl_netdev_ops;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5206  	tp = netdev_priv(dev);
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5207  	tp->dev = dev;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5208  	tp->pci_dev = pdev;
145a40e87e0bca drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2019-06-10  5209  	tp->supports_gmii = ent->driver_data == RTL_CFG_NO_GBIT ? 0 : 1;
7ec3f872bc85ad drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2019-11-10  5210  	tp->eee_adv = -1;
0360c046ca186b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-18  5211  	tp->ocp_base = OCP_STD_PHY_BASE;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5212  
d6c36cbc5e533f drivers/net/ethernet/realtek/r8169_main.c Sebastian Andrzej Siewior 2023-05-22  5213  	raw_spin_lock_init(&tp->cfg9346_usage_lock);
d6c36cbc5e533f drivers/net/ethernet/realtek/r8169_main.c Sebastian Andrzej Siewior 2023-05-22  5214  	raw_spin_lock_init(&tp->config25_lock);
d6c36cbc5e533f drivers/net/ethernet/realtek/r8169_main.c Sebastian Andrzej Siewior 2023-05-22  5215  	raw_spin_lock_init(&tp->mac_ocp_lock);
91c8643578a21e drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-03-06  5216  
5e4cb480016867 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-10-29  5217  	dev->tstats = devm_netdev_alloc_pcpu_stats(&pdev->dev,
5e4cb480016867 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-10-29  5218  						   struct pcpu_sw_netstats);
5e4cb480016867 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-10-29  5219  	if (!dev->tstats)
5e4cb480016867 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-10-29  5220  		return -ENOMEM;
5e4cb480016867 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-10-29  5221  
c2f6f3ee7f2252 drivers/net/ethernet/realtek/r8169.c      Hans de Goede             2018-09-12  5222  	/* Get the *optional* external "ether_clk" used on some boards */
599566c1c36920 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2022-09-02  5223  	tp->clk = devm_clk_get_optional_enabled(&pdev->dev, "ether_clk");
599566c1c36920 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2022-09-02  5224  	if (IS_ERR(tp->clk))
599566c1c36920 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2022-09-02  5225  		return dev_err_probe(&pdev->dev, PTR_ERR(tp->clk), "failed to get ether_clk\n");
c2f6f3ee7f2252 drivers/net/ethernet/realtek/r8169.c      Hans de Goede             2018-09-12  5226  
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5227  	/* enable device (incl. PCI PM wakeup and hotplug setup) */
4c45d24a759d8e drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2017-12-12  5228  	rc = pcim_enable_device(pdev);
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5229  	if (rc < 0)
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5230  		return dev_err_probe(&pdev->dev, rc, "enable failure\n");
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5231  
4c45d24a759d8e drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2017-12-12  5232  	if (pcim_set_mwi(pdev) < 0)
22148df0d0bdbd drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-04-22  5233  		dev_info(&pdev->dev, "Mem-Wr-Inval unavailable\n");
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5234  
c8d48d9c5bf7a0 drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-04-17  5235  	/* use first MMIO region */
c8d48d9c5bf7a0 drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-04-17  5236  	region = ffs(pci_select_bars(pdev, IORESOURCE_MEM)) - 1;
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5237  	if (region < 0)
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5238  		return dev_err_probe(&pdev->dev, -ENODEV, "no MMIO resource found\n");
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5239  
7cb7541a8cc070 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2021-05-15  5240  	rc = pcim_iomap_regions(pdev, BIT(region), KBUILD_MODNAME);
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5241  	if (rc < 0)
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5242  		return dev_err_probe(&pdev->dev, rc, "cannot remap MMIO, aborting\n");
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5243  
93a00d4d613fb6 drivers/net/ethernet/realtek/r8169.c      Andy Shevchenko           2018-03-01  5244  	tp->mmio_addr = pcim_iomap_table(pdev)[region];
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5245  
bc590b47549225 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-28  5246  	txconfig = RTL_R32(tp, TxConfig);
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5247  	if (txconfig == ~0U)
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5248  		return dev_err_probe(&pdev->dev, -EIO, "PCI read failed\n");
bc590b47549225 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-28  5249  
bc590b47549225 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-28  5250  	xid = (txconfig >> 20) & 0xfcf;
f1f9ca2875692e drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-02-15  5251  
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5252  	/* Identify chip attached to board */
f1f9ca2875692e drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-02-15  5253  	chipset = rtl8169_get_mac_version(xid, tp->supports_gmii);
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5254  	if (chipset == RTL_GIGA_MAC_NONE)
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5255  		return dev_err_probe(&pdev->dev, -ENODEV,
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5256  				     "unknown chip XID %03x, contact r8169 maintainers (see MAINTAINERS file)\n",
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5257  				     xid);
f1f9ca2875692e drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-02-15  5258  	tp->mac_version = chipset;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5259  
cf2ffdea083939 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-07-18  5260  	/* Disable ASPM L1 as that cause random device stop working
cf2ffdea083939 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-07-18  5261  	 * problems as well as full system hangs for some PCIe devices users.
cf2ffdea083939 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-07-18  5262  	 */
cf2ffdea083939 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-07-18  5263  	if (rtl_aspm_is_safe(tp))
cf2ffdea083939 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-07-18  5264  		rc = 0;
cf2ffdea083939 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-07-18  5265  	else
cf2ffdea083939 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-07-18  5266  		rc = pci_disable_link_state(pdev, PCIE_LINK_STATE_L1);
cf2ffdea083939 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-07-18  5267  	tp->aspm_manageable = !rc;
cf2ffdea083939 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-07-18  5268  
0ab0c45d8aaea5 drivers/net/ethernet/realtek/r8169_main.c ChunHao Lin               2023-11-10  5269  	tp->dash_type = rtl_get_dash_type(tp);
0ab0c45d8aaea5 drivers/net/ethernet/realtek/r8169_main.c ChunHao Lin               2023-11-10  5270  	tp->dash_enabled = rtl_dash_is_enabled(tp);
e0d38b58807584 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2021-01-12  5271  
975e8505e6701c drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-26  5272  	tp->cp_cmd = RTL_R16(tp, CPlusCmd) & CPCMD_MASK;
27896c83fe94e2 drivers/net/ethernet/realtek/r8169.c      Ard Biesheuvel            2016-05-14  5273  
10b63e8543145d drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2019-01-20  5274  	if (sizeof(dma_addr_t) > 4 && tp->mac_version >= RTL_GIGA_MAC_VER_18 &&
3c18cbe33711d7 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2019-06-27  5275  	    !dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64)))
27896c83fe94e2 drivers/net/ethernet/realtek/r8169.c      Ard Biesheuvel            2016-05-14  5276  		dev->features |= NETIF_F_HIGHDMA;
27896c83fe94e2 drivers/net/ethernet/realtek/r8169.c      Ard Biesheuvel            2016-05-14  5277  
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5278  	rtl_init_rxcfg(tp);
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5279  
de20e12f3faf86 drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-09-25  5280  	rtl8169_irq_mask_and_ack(tp);
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5281  
c558386b836ee9 drivers/net/ethernet/realtek/r8169.c      Hayes Wang                2012-07-02  5282  	rtl_hw_initialize(tp);
c558386b836ee9 drivers/net/ethernet/realtek/r8169.c      Hayes Wang                2012-07-02  5283  
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5284  	rtl_hw_reset(tp);
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5285  
6c6aa15fdea52a drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-02-24  5286  	rc = rtl_alloc_irq(tp);
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5287  	if (rc < 0)
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5288  		return dev_err_probe(&pdev->dev, rc, "Can't allocate interrupt\n");
733b3e27650b1b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2023-05-31  5289  
1bd32771884187 drivers/net/ethernet/realtek/r8169_main.c Thomas Gleixner           2021-12-28  5290  	tp->irq = pci_irq_vector(pdev, 0);
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5291  
5c41e78fe2a57e drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2019-01-19  5292  	INIT_WORK(&tp->wk.work, rtl_task);
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5293  
c782e204f7343b drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2019-07-02  5294  	rtl_init_mac_address(tp);
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5295  
7ad24ea4bf620a drivers/net/ethernet/realtek/r8169.c      Wilfried Klaebe           2014-05-11  5296  	dev->ethtool_ops = &rtl8169_ethtool_ops;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5297  
b48b89f9c189d2 drivers/net/ethernet/realtek/r8169_main.c Jakub Kicinski            2022-09-27  5298  	netif_napi_add(dev, &tp->napi, rtl8169_poll);
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5299  
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5300  	dev->hw_features = NETIF_F_IP_CSUM | NETIF_F_RXCSUM |
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5301  			   NETIF_F_HW_VLAN_CTAG_TX | NETIF_F_HW_VLAN_CTAG_RX;
a9b3d56830a3d6 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-18  5302  	dev->vlan_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_TSO;
2d0ec5440bef4a drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-07-02  5303  	dev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5304  
929a031dfd62aa drivers/net/ethernet/realtek/r8169.c      hayeswang                 2014-09-16  5305  	/*
929a031dfd62aa drivers/net/ethernet/realtek/r8169.c      hayeswang                 2014-09-16  5306  	 * Pretend we are using VLANs; This bypasses a nasty bug where
929a031dfd62aa drivers/net/ethernet/realtek/r8169.c      hayeswang                 2014-09-16  5307  	 * Interrupts stop flowing on high load on 8110SCd controllers.
929a031dfd62aa drivers/net/ethernet/realtek/r8169.c      hayeswang                 2014-09-16  5308  	 */
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5309  	if (tp->mac_version == RTL_GIGA_MAC_VER_05)
929a031dfd62aa drivers/net/ethernet/realtek/r8169.c      hayeswang                 2014-09-16  5310  		/* Disallow toggling */
f646968f8f7c62 drivers/net/ethernet/realtek/r8169.c      Patrick McHardy           2013-04-19  5311  		dev->hw_features &= ~NETIF_F_HW_VLAN_CTAG_RX;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5312  
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5313  	if (rtl_chip_supports_csum_v2(tp))
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5314  		dev->hw_features |= NETIF_F_IPV6_CSUM;
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5315  
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5316  	dev->features |= dev->hw_features;
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5317  
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5318  	/* There has been a number of reports that using SG/TSO results in
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5319  	 * tx timeouts. However for a lot of people SG/TSO works fine.
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5320  	 * Therefore disable both features by default, but allow users to
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5321  	 * enable them. Use at own risk!
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5322  	 */
0170d594ded829 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2019-07-26  5323  	if (rtl_chip_supports_csum_v2(tp)) {
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5324  		dev->hw_features |= NETIF_F_SG | NETIF_F_TSO | NETIF_F_TSO6;
ee8b7a1156f357 drivers/net/ethernet/realtek/r8169_main.c Jakub Kicinski            2022-05-05  5325  		netif_set_tso_max_size(dev, RTL_GSO_MAX_SIZE_V2);
ee8b7a1156f357 drivers/net/ethernet/realtek/r8169_main.c Jakub Kicinski            2022-05-05  5326  		netif_set_tso_max_segs(dev, RTL_GSO_MAX_SEGS_V2);
0170d594ded829 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2019-07-26  5327  	} else {
95099c569a9fdb drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-04  5328  		dev->hw_features |= NETIF_F_SG | NETIF_F_TSO;
ee8b7a1156f357 drivers/net/ethernet/realtek/r8169_main.c Jakub Kicinski            2022-05-05  5329  		netif_set_tso_max_size(dev, RTL_GSO_MAX_SIZE_V1);
ee8b7a1156f357 drivers/net/ethernet/realtek/r8169_main.c Jakub Kicinski            2022-05-05  5330  		netif_set_tso_max_segs(dev, RTL_GSO_MAX_SEGS_V1);
0170d594ded829 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2019-07-26  5331  	}
5888d3fc45facf drivers/net/ethernet/realtek/r8169.c      hayeswang                 2014-07-11  5332  
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5333  	dev->hw_features |= NETIF_F_RXALL;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5334  	dev->hw_features |= NETIF_F_RXFCS;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5335  
42f66a44d83715 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2022-11-30  5336  	netdev_sw_irq_coalesce_default_on(dev);
42f66a44d83715 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2022-11-30  5337  
145192f83a1184 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-18  5338  	/* configure chip for default features */
145192f83a1184 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-18  5339  	rtl8169_set_features(dev, dev->features);
145192f83a1184 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-18  5340  
0ab0c45d8aaea5 drivers/net/ethernet/realtek/r8169_main.c ChunHao Lin               2023-11-10  5341  	if (!tp->dash_enabled) {
128735a1530ec9 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2021-01-10  5342  		rtl_set_d3_pll_down(tp, true);
54744510fa9c05 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2022-03-16  5343  	} else {
54744510fa9c05 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2022-03-16  5344  		rtl_set_d3_pll_down(tp, false);
54744510fa9c05 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2022-03-16  5345  		dev->wol_enabled = 1;
54744510fa9c05 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2022-03-16  5346  	}
128735a1530ec9 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2021-01-10  5347  
abe8b2f71e28f0 drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-08-10  5348  	jumbo_max = rtl_jumbo_max(tp);
a8ec173a3f29fd drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-01-26  5349  	if (jumbo_max)
abe8b2f71e28f0 drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-08-10  5350  		dev->max_mtu = jumbo_max;
c7315a95c2a3c8 drivers/net/ethernet/realtek/r8169.c      Jarod Wilson              2016-10-17  5351  
ec9a40881732c8 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2019-06-10  5352  	rtl_set_irq_mask(tp);
9fa0a8e1e15aa2 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2019-06-10  5353  
254764e55652d4 drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2019-01-22  5354  	tp->fw_name = rtl_chip_infos[chipset].fw_name;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5355  
4c45d24a759d8e drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2017-12-12  5356  	tp->counters = dmam_alloc_coherent (&pdev->dev, sizeof(*tp->counters),
4c45d24a759d8e drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2017-12-12  5357  					    &tp->counters_phys_addr,
4c45d24a759d8e drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2017-12-12  5358  					    GFP_KERNEL);
4cf964af0a7238 drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2017-12-12  5359  	if (!tp->counters)
4cf964af0a7238 drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2017-12-12  5360  		return -ENOMEM;
420203204eada3 drivers/net/ethernet/realtek/r8169.c      Corinna Vinschen          2015-09-10  5361  
27dc36aefc73ce drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-05-30  5362  	pci_set_drvdata(pdev, tp);
19c9ea363a244f drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-03-26  5363  
f1e911d5d0dfde drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-07-17  5364  	rc = r8169_mdio_register(tp);
f1e911d5d0dfde drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-07-17  5365  	if (rc)
4cf964af0a7238 drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2017-12-12  5366  		return rc;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5367  
f1e911d5d0dfde drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-07-17  5368  	rc = register_netdev(dev);
f1e911d5d0dfde drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-07-17  5369  	if (rc)
0785dad4800340 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-04-20  5370  		return rc;
f1e911d5d0dfde drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-07-17  5371  
93882c6f210af5 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-05-01  5372  	netdev_info(dev, "%s, %pM, XID %03x, IRQ %d\n",
1bd32771884187 drivers/net/ethernet/realtek/r8169_main.c Thomas Gleixner           2021-12-28  5373  		    rtl_chip_infos[chipset].name, dev->dev_addr, xid, tp->irq);
abe8b2f71e28f0 drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-08-10  5374  
a8ec173a3f29fd drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-01-26  5375  	if (jumbo_max)
93882c6f210af5 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-05-01  5376  		netdev_info(dev, "jumbo features [frames: %d bytes, tx checksumming: %s]\n",
abe8b2f71e28f0 drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-08-10  5377  			    jumbo_max, tp->mac_version <= RTL_GIGA_MAC_VER_06 ?
abe8b2f71e28f0 drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-08-10  5378  			    "ok" : "ko");
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5379  
e0d38b58807584 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2021-01-12  5380  	if (tp->dash_type != RTL_DASH_NONE) {
0ab0c45d8aaea5 drivers/net/ethernet/realtek/r8169_main.c ChunHao Lin               2023-11-10  5381  		netdev_info(dev, "DASH %s\n",
0ab0c45d8aaea5 drivers/net/ethernet/realtek/r8169_main.c ChunHao Lin               2023-11-10 @5382  			    tp->dash_enabled ? "enabled" : "disabled");
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5383  		rtl8168_driver_start(tp);
a38b7fbfeaebe9 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit           2020-06-17  5384  	}
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5385  
a92a08499b1f9d drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-01-08  5386  	if (pci_dev_run_wake(pdev))
a92a08499b1f9d drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-01-08  5387  		pm_runtime_put_sync(&pdev->dev);
a92a08499b1f9d drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2018-01-08  5388  
4c45d24a759d8e drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit           2017-12-12  5389  	return 0;
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5390  }
3b6cf25de260d5 drivers/net/ethernet/realtek/r8169.c      Francois Romieu           2012-03-08  5391  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
