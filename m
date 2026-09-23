Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A61639FCBF
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 05:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141020; cv=none; b=ut68VEWI2U0Ie+GZJesxSnWc7aMWT8WKsAnTPR637l5grLhq3uabquc19FiZEJuANySchkBLhQbNUdZOZTPEVMFtplbVVXaO6hN/J/ZojM9uyx3tIAXqTFM0KBypcPAx8VJ9t1EnUChQE1oaw+hQgNPTZ33jppKEmE69O5C6T04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141020; c=relaxed/simple;
	bh=bayjAKfjjJ9QjjxbKQriLOPo1szCgwCTmjCbQgCp0Rg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Grzlx6hagv3GP9oos+b79NN+5HH0RAKNAHbTRh+3Xn+7VWXWwaeMDoncczV2Sg5egm3D4zMrQ5OgEbf+88b1ICiZCrra7k1UnFccMz8XpBZH2ZZMxmjT/BV1MfzgZ73XZcMA5tA6/5ZdcZtjPaSbjcKBsRShnCBkgsHoqtaos5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6lW/WI3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6lW/WI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790141017; x=1821677017;
  h=date:from:to:cc:subject:message-id;
  bh=bayjAKfjjJ9QjjxbKQriLOPo1szCgwCTmjCbQgCp0Rg=;
  b=T6lW/WI3u3ahPGQ3453DXuJpM2yvzw53EfJGSQPaZNQc29jGiwQDR1x1
   1vV7gIINr+c1chADYy+AjRfxG+THU7LdRo+xcarB5wXGHl3zRIJOkeNeI
   O0UdgIxrGPl9XRzp6lbiyugNgGu149ZGtGZ4bO8714WG54HpbtfA07qgq
   0aiF4PMCOKbvgCpVwopMJHWqwYNcJ7cGhTAImRhvdKG+nXsjwGI/9PfQu
   CRHoLr+kskCDSrjRWi19S0hYTsT2kZCN93Iwi0+NyU5kRJhAwyE1fpdC/
   vE8UNqj1nFiaJ3FVu9KT8/AcZrhMjm6WOcpKTGVZI+zofyJaWoRrECJLX
   g==;
X-CSE-ConnectionGUID: ZE99eJ5dQsSm6RaVjs75zQ==
X-CSE-MsgGUID: 97sgbEkXQ5SKUugZAEEu8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89721211"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="89721211"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:23:36 -0700
X-CSE-ConnectionGUID: ywiqv0DSRmGJX2nUg/0LpA==
X-CSE-MsgGUID: hDTLCE+ZT82V0QPd9kL7Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="299693814"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 22 Sep 2026 22:23:35 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9FS5-000000000X7-1lzH;
	Wed, 23 Sep 2026 05:23:29 +0000
Date: Wed, 23 Sep 2026 07:22:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4776/8910]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2974 axienet_probe() warn:
 platform_get_irq() does not return zero
Message-ID: <202609230734.R1jtbjb4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: bui duc phuc <phucduc.bui@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Simon Horman <horms@kernel.org>
CC: Suraj Gupta <suraj.gupta2@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: bb2b71024976a39ed57d66bad8f9ca7e93bc3f33 [4776/8910] net: xilinx: axienet: Fix IRQ error handling
:::::: branch date: 16 hours ago
:::::: commit date: 11 days ago
config: i386-randconfig-2200-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230734.R1jtbjb4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609230734.R1jtbjb4-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2974 axienet_probe() warn: platform_get_irq() does not return zero
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2974 axienet_probe() warn: platform_get_irq() does not return zero

vim +2974 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2782  
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2783  /**
2be586205ca2b81 Srikanth Thokala         2015-05-05  2784   * axienet_probe - Axi Ethernet probe function.
95219aa538e11d5 Srikanth Thokala         2015-05-05  2785   * @pdev:	Pointer to platform device structure.
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2786   *
b0d081c524b46c2 Michal Simek             2015-05-05  2787   * Return: 0, on success
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2788   *	    Non-zero error value on failure.
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2789   *
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2790   * This is the probe routine for Axi Ethernet driver. This is called before
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2791   * any other driver routines are invoked. It allocates and sets up the Ethernet
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2792   * device. Parses through device tree and populates fields of
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2793   * axienet_local. It registers the Ethernet device.
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2794   */
2be586205ca2b81 Srikanth Thokala         2015-05-05  2795  static int axienet_probe(struct platform_device *pdev)
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2796  {
8495659bf93c8e2 Srikanth Thokala         2015-05-05  2797  	int ret;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2798  	struct device_node *np;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2799  	struct axienet_local *lp;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2800  	struct net_device *ndev;
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2801  	struct resource *ethres;
83216e3988cd196 Michael Walle            2021-04-12  2802  	u8 mac_addr[ETH_ALEN];
5fff0151b3244dc Andre Przywara           2020-03-24  2803  	int addr_width = 32;
8495659bf93c8e2 Srikanth Thokala         2015-05-05  2804  	u32 value;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2805  
808d077f5b53806 Sean Anderson            2026-01-17  2806  	ndev = devm_alloc_etherdev(&pdev->dev, sizeof(*lp));
41de8d4cff21a2e Joe Perches              2012-01-29  2807  	if (!ndev)
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2808  		return -ENOMEM;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2809  
95219aa538e11d5 Srikanth Thokala         2015-05-05  2810  	platform_set_drvdata(pdev, ndev);
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2811  
95219aa538e11d5 Srikanth Thokala         2015-05-05  2812  	SET_NETDEV_DEV(ndev, &pdev->dev);
28e24c62ab3062e Eric Dumazet             2013-12-02  2813  	ndev->features = NETIF_F_SG;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2814  
d894be57ca92c8a Jarod Wilson             2016-10-20  2815  	/* MTU range: 64 - 9000 */
d894be57ca92c8a Jarod Wilson             2016-10-20  2816  	ndev->min_mtu = 64;
d894be57ca92c8a Jarod Wilson             2016-10-20  2817  	ndev->max_mtu = XAE_JUMBO_MTU;
d894be57ca92c8a Jarod Wilson             2016-10-20  2818  
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2819  	lp = netdev_priv(ndev);
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2820  	lp->ndev = ndev;
95219aa538e11d5 Srikanth Thokala         2015-05-05  2821  	lp->dev = &pdev->dev;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2822  	lp->options = XAE_OPTION_DEFAULTS;
8b09ca823ffb4ee Robert Hancock           2019-06-06  2823  	lp->rx_bd_num = RX_BD_NUM_DEFAULT;
8b09ca823ffb4ee Robert Hancock           2019-06-06  2824  	lp->tx_bd_num = TX_BD_NUM_DEFAULT;
57baf8cc70ea4cf Robert Hancock           2021-02-12  2825  
cb45a8bf4693965 Robert Hancock           2022-08-29  2826  	u64_stats_init(&lp->rx_stat_sync);
cb45a8bf4693965 Robert Hancock           2022-08-29  2827  	u64_stats_init(&lp->tx_stat_sync);
cb45a8bf4693965 Robert Hancock           2022-08-29  2828  
76abb5d675c49ba Sean Anderson            2024-08-20  2829  	mutex_init(&lp->stats_lock);
76abb5d675c49ba Sean Anderson            2024-08-20  2830  	seqcount_mutex_init(&lp->hw_stats_seqcount, &lp->stats_lock);
76abb5d675c49ba Sean Anderson            2024-08-20  2831  	INIT_DEFERRABLE_WORK(&lp->stats_work, axienet_refresh_stats);
76abb5d675c49ba Sean Anderson            2024-08-20  2832  
808d077f5b53806 Sean Anderson            2026-01-17  2833  	lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev,
808d077f5b53806 Sean Anderson            2026-01-17  2834  						    "s_axi_lite_clk");
b11bfb9a19f9d79 Robert Hancock           2021-03-25  2835  	if (!lp->axi_clk) {
b11bfb9a19f9d79 Robert Hancock           2021-03-25  2836  		/* For backward compatibility, if named AXI clock is not present,
b11bfb9a19f9d79 Robert Hancock           2021-03-25  2837  		 * treat the first clock specified as the AXI clock.
b11bfb9a19f9d79 Robert Hancock           2021-03-25  2838  		 */
808d077f5b53806 Sean Anderson            2026-01-17  2839  		lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
57baf8cc70ea4cf Robert Hancock           2021-02-12  2840  	}
808d077f5b53806 Sean Anderson            2026-01-17  2841  	if (IS_ERR(lp->axi_clk))
808d077f5b53806 Sean Anderson            2026-01-17  2842  		return dev_err_probe(&pdev->dev, PTR_ERR(lp->axi_clk),
808d077f5b53806 Sean Anderson            2026-01-17  2843  				     "could not get AXI clock\n");
57baf8cc70ea4cf Robert Hancock           2021-02-12  2844  
b11bfb9a19f9d79 Robert Hancock           2021-03-25  2845  	lp->misc_clks[0].id = "axis_clk";
b11bfb9a19f9d79 Robert Hancock           2021-03-25  2846  	lp->misc_clks[1].id = "ref_clk";
b11bfb9a19f9d79 Robert Hancock           2021-03-25  2847  	lp->misc_clks[2].id = "mgt_clk";
b11bfb9a19f9d79 Robert Hancock           2021-03-25  2848  
808d077f5b53806 Sean Anderson            2026-01-17  2849  	ret = devm_clk_bulk_get_optional_enable(&pdev->dev, XAE_NUM_MISC_CLOCKS,
808d077f5b53806 Sean Anderson            2026-01-17  2850  						lp->misc_clks);
b11bfb9a19f9d79 Robert Hancock           2021-03-25  2851  	if (ret)
808d077f5b53806 Sean Anderson            2026-01-17  2852  		return dev_err_probe(&pdev->dev, ret,
808d077f5b53806 Sean Anderson            2026-01-17  2853  				     "could not get/enable misc. clocks\n");
b11bfb9a19f9d79 Robert Hancock           2021-03-25  2854  
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2855  	/* Map device registers */
47651c51c02fc49 Yang Yingliang           2021-06-10  2856  	lp->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &ethres);
808d077f5b53806 Sean Anderson            2026-01-17  2857  	if (IS_ERR(lp->regs))
808d077f5b53806 Sean Anderson            2026-01-17  2858  		return PTR_ERR(lp->regs);
7fa0043d5c74c6e Robert Hancock           2019-06-11  2859  	lp->regs_start = ethres->start;
46aa27df8853214 Srikanth Thokala         2015-05-05  2860  
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2861  	/* Setup checksum offload, but default to off if not specified */
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2862  	lp->features = 0;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2863  
76abb5d675c49ba Sean Anderson            2024-08-20  2864  	if (axienet_ior(lp, XAE_ABILITY_OFFSET) & XAE_ABILITY_STATS)
76abb5d675c49ba Sean Anderson            2024-08-20  2865  		lp->features |= XAE_FEATURE_STATS;
76abb5d675c49ba Sean Anderson            2024-08-20  2866  
8495659bf93c8e2 Srikanth Thokala         2015-05-05  2867  	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,txcsum", &value);
8495659bf93c8e2 Srikanth Thokala         2015-05-05  2868  	if (!ret) {
8495659bf93c8e2 Srikanth Thokala         2015-05-05  2869  		switch (value) {
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2870  		case 1:
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2871  			lp->features |= XAE_FEATURE_PARTIAL_TX_CSUM;
dd28f4c0e81f42b Sean Anderson            2024-09-09  2872  			/* Can checksum any contiguous range */
dd28f4c0e81f42b Sean Anderson            2024-09-09  2873  			ndev->features |= NETIF_F_HW_CSUM;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2874  			break;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2875  		case 2:
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2876  			lp->features |= XAE_FEATURE_FULL_TX_CSUM;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2877  			/* Can checksum TCP/UDP over IPv4. */
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2878  			ndev->features |= NETIF_F_IP_CSUM;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2879  			break;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2880  		}
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2881  	}
8495659bf93c8e2 Srikanth Thokala         2015-05-05  2882  	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,rxcsum", &value);
8495659bf93c8e2 Srikanth Thokala         2015-05-05  2883  	if (!ret) {
8495659bf93c8e2 Srikanth Thokala         2015-05-05  2884  		switch (value) {
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2885  		case 1:
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2886  			lp->features |= XAE_FEATURE_PARTIAL_RX_CSUM;
06c069ff2f7013f Sean Anderson            2024-09-09  2887  			ndev->features |= NETIF_F_RXCSUM;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2888  			break;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2889  		case 2:
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2890  			lp->features |= XAE_FEATURE_FULL_RX_CSUM;
06c069ff2f7013f Sean Anderson            2024-09-09  2891  			ndev->features |= NETIF_F_RXCSUM;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2892  			break;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2893  		}
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2894  	}
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2895  	/* For supporting jumbo frames, the Axi Ethernet hardware must have
f080a8c35d8932d Srikanth Thokala         2015-05-05  2896  	 * a larger Rx/Tx Memory. Typically, the size must be large so that
f080a8c35d8932d Srikanth Thokala         2015-05-05  2897  	 * we can enable jumbo option and start supporting jumbo frames.
f080a8c35d8932d Srikanth Thokala         2015-05-05  2898  	 * Here we check for memory allocated for Rx/Tx in the hardware from
f080a8c35d8932d Srikanth Thokala         2015-05-05  2899  	 * the device-tree and accordingly set flags.
f080a8c35d8932d Srikanth Thokala         2015-05-05  2900  	 */
34b270e7893f4a1 Suraj Gupta              2026-08-06  2901  	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
34b270e7893f4a1 Suraj Gupta              2026-08-06  2902  	if (ret)
34b270e7893f4a1 Suraj Gupta              2026-08-06  2903  		return dev_err_probe(&pdev->dev, ret,
34b270e7893f4a1 Suraj Gupta              2026-08-06  2904  				     "failed to read xlnx,rxmem property\n");
ee06b1728b95643 Alvaro G. M              2017-07-17  2905  
6c8f06bb2e5147b Robert Hancock           2021-02-12  2906  	lp->switch_x_sgmii = of_property_read_bool(pdev->dev.of_node,
6c8f06bb2e5147b Robert Hancock           2021-02-12  2907  						   "xlnx,switch-x-sgmii");
6c8f06bb2e5147b Robert Hancock           2021-02-12  2908  
ee06b1728b95643 Alvaro G. M              2017-07-17  2909  	/* Start with the proprietary, and broken phy_type */
ee06b1728b95643 Alvaro G. M              2017-07-17  2910  	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,phy-type", &value);
ee06b1728b95643 Alvaro G. M              2017-07-17  2911  	if (!ret) {
ee06b1728b95643 Alvaro G. M              2017-07-17  2912  		netdev_warn(ndev, "Please upgrade your device tree binary blob to use phy-mode");
ee06b1728b95643 Alvaro G. M              2017-07-17  2913  		switch (value) {
ee06b1728b95643 Alvaro G. M              2017-07-17  2914  		case XAE_PHY_TYPE_MII:
ee06b1728b95643 Alvaro G. M              2017-07-17  2915  			lp->phy_mode = PHY_INTERFACE_MODE_MII;
ee06b1728b95643 Alvaro G. M              2017-07-17  2916  			break;
ee06b1728b95643 Alvaro G. M              2017-07-17  2917  		case XAE_PHY_TYPE_GMII:
ee06b1728b95643 Alvaro G. M              2017-07-17  2918  			lp->phy_mode = PHY_INTERFACE_MODE_GMII;
ee06b1728b95643 Alvaro G. M              2017-07-17  2919  			break;
ee06b1728b95643 Alvaro G. M              2017-07-17  2920  		case XAE_PHY_TYPE_RGMII_2_0:
ee06b1728b95643 Alvaro G. M              2017-07-17  2921  			lp->phy_mode = PHY_INTERFACE_MODE_RGMII_ID;
ee06b1728b95643 Alvaro G. M              2017-07-17  2922  			break;
ee06b1728b95643 Alvaro G. M              2017-07-17  2923  		case XAE_PHY_TYPE_SGMII:
ee06b1728b95643 Alvaro G. M              2017-07-17  2924  			lp->phy_mode = PHY_INTERFACE_MODE_SGMII;
ee06b1728b95643 Alvaro G. M              2017-07-17  2925  			break;
ee06b1728b95643 Alvaro G. M              2017-07-17  2926  		case XAE_PHY_TYPE_1000BASE_X:
ee06b1728b95643 Alvaro G. M              2017-07-17  2927  			lp->phy_mode = PHY_INTERFACE_MODE_1000BASEX;
ee06b1728b95643 Alvaro G. M              2017-07-17  2928  			break;
ee06b1728b95643 Alvaro G. M              2017-07-17  2929  		default:
808d077f5b53806 Sean Anderson            2026-01-17  2930  			return -EINVAL;
ee06b1728b95643 Alvaro G. M              2017-07-17  2931  		}
ee06b1728b95643 Alvaro G. M              2017-07-17  2932  	} else {
0c65b2b90d13c1d Andrew Lunn              2019-11-04  2933  		ret = of_get_phy_mode(pdev->dev.of_node, &lp->phy_mode);
0c65b2b90d13c1d Andrew Lunn              2019-11-04  2934  		if (ret)
808d077f5b53806 Sean Anderson            2026-01-17  2935  			return ret;
ee06b1728b95643 Alvaro G. M              2017-07-17  2936  	}
6c8f06bb2e5147b Robert Hancock           2021-02-12  2937  	if (lp->switch_x_sgmii && lp->phy_mode != PHY_INTERFACE_MODE_SGMII &&
6c8f06bb2e5147b Robert Hancock           2021-02-12  2938  	    lp->phy_mode != PHY_INTERFACE_MODE_1000BASEX) {
6c8f06bb2e5147b Robert Hancock           2021-02-12  2939  		dev_err(&pdev->dev, "xlnx,switch-x-sgmii only supported with SGMII or 1000BaseX\n");
808d077f5b53806 Sean Anderson            2026-01-17  2940  		return -EINVAL;
6c8f06bb2e5147b Robert Hancock           2021-02-12  2941  	}
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2942  
5fe164fb0e6e31d Rob Herring (Arm         2024-07-31  2943) 	if (!of_property_present(pdev->dev.of_node, "dmas")) {
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2944  		/* Find the DMA node, map the DMA registers, and decode the DMA IRQs */
95219aa538e11d5 Srikanth Thokala         2015-05-05  2945  		np = of_parse_phandle(pdev->dev.of_node, "axistream-connected", 0);
6b1b40f704fc39d Sarath Babu Naidu Gaddam 2023-11-16  2946  
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2947  		if (np) {
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2948  			struct resource dmares;
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2949  
46aa27df8853214 Srikanth Thokala         2015-05-05  2950  			ret = of_address_to_resource(np, 0, &dmares);
46aa27df8853214 Srikanth Thokala         2015-05-05  2951  			if (ret) {
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2952  				dev_err(&pdev->dev,
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2953  					"unable to get DMA resource\n");
fa3a419d2f674b4 Wen Yang                 2019-03-22  2954  				of_node_put(np);
808d077f5b53806 Sean Anderson            2026-01-17  2955  				return ret;
46aa27df8853214 Srikanth Thokala         2015-05-05  2956  			}
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2957  			lp->dma_regs = devm_ioremap_resource(&pdev->dev,
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2958  							     &dmares);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2959  			lp->rx_irq = irq_of_parse_and_map(np, 1);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2960  			lp->tx_irq = irq_of_parse_and_map(np, 0);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2961  			of_node_put(np);
d6349e3e14c7f7b Andre Przywara           2020-03-24  2962  			lp->eth_irq = platform_get_irq_optional(pdev, 0);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2963  		} else {
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2964  			/* Check for these resources directly on the Ethernet node. */
47651c51c02fc49 Yang Yingliang           2021-06-10  2965  			lp->dma_regs = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2966  			lp->rx_irq = platform_get_irq(pdev, 1);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2967  			lp->tx_irq = platform_get_irq(pdev, 0);
d6349e3e14c7f7b Andre Przywara           2020-03-24  2968  			lp->eth_irq = platform_get_irq_optional(pdev, 2);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2969  		}
fcc028c106e5750 Krzysztof Kozlowski      2015-07-09  2970  		if (IS_ERR(lp->dma_regs)) {
46aa27df8853214 Srikanth Thokala         2015-05-05  2971  			dev_err(&pdev->dev, "could not map DMA regs\n");
808d077f5b53806 Sean Anderson            2026-01-17  2972  			return PTR_ERR(lp->dma_regs);
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2973  		}
bb2b71024976a39 bui duc phuc             2026-09-09 @2974  		if (!lp->rx_irq || !lp->tx_irq) {
95219aa538e11d5 Srikanth Thokala         2015-05-05  2975  			dev_err(&pdev->dev, "could not determine irqs\n");
bb2b71024976a39 bui duc phuc             2026-09-09  2976  			return -EINVAL;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2977  		}
bb2b71024976a39 bui duc phuc             2026-09-09  2978  		if (lp->rx_irq < 0)
bb2b71024976a39 bui duc phuc             2026-09-09  2979  			return lp->rx_irq;
bb2b71024976a39 bui duc phuc             2026-09-09  2980  		if (lp->tx_irq < 0)
bb2b71024976a39 bui duc phuc             2026-09-09  2981  			return lp->tx_irq;
90ab44517ee1f9e bui duc phuc             2026-09-09  2982  		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
90ab44517ee1f9e bui duc phuc             2026-09-09  2983  			return lp->eth_irq;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2984  
f1bc9fc4a06de01 Maxim Kochetkov          2023-06-22  2985  		/* Reset core now that clocks are enabled, prior to accessing MDIO */
f1bc9fc4a06de01 Maxim Kochetkov          2023-06-22  2986  		ret = __axienet_device_reset(lp);
f1bc9fc4a06de01 Maxim Kochetkov          2023-06-22  2987  		if (ret)
808d077f5b53806 Sean Anderson            2026-01-17  2988  			return ret;
f1bc9fc4a06de01 Maxim Kochetkov          2023-06-22  2989  
f735c40ed93ccae Andre Przywara           2020-03-24  2990  		/* Autodetect the need for 64-bit DMA pointers.
f735c40ed93ccae Andre Przywara           2020-03-24  2991  		 * When the IP is configured for a bus width bigger than 32 bits,
f735c40ed93ccae Andre Przywara           2020-03-24  2992  		 * writing the MSB registers is mandatory, even if they are all 0.
f735c40ed93ccae Andre Przywara           2020-03-24  2993  		 * We can detect this case by writing all 1's to one such register
f735c40ed93ccae Andre Przywara           2020-03-24  2994  		 * and see if that sticks: when the IP is configured for 32 bits
f735c40ed93ccae Andre Przywara           2020-03-24  2995  		 * only, those registers are RES0.
f735c40ed93ccae Andre Przywara           2020-03-24  2996  		 * Those MSB registers were introduced in IP v7.1, which we check first.
f735c40ed93ccae Andre Przywara           2020-03-24  2997  		 */
f735c40ed93ccae Andre Przywara           2020-03-24  2998  		if ((axienet_ior(lp, XAE_ID_OFFSET) >> 24) >= 0x9) {
f735c40ed93ccae Andre Przywara           2020-03-24  2999  			void __iomem *desc = lp->dma_regs + XAXIDMA_TX_CDESC_OFFSET + 4;
f735c40ed93ccae Andre Przywara           2020-03-24  3000  
f735c40ed93ccae Andre Przywara           2020-03-24  3001  			iowrite32(0x0, desc);
f735c40ed93ccae Andre Przywara           2020-03-24  3002  			if (ioread32(desc) == 0) {	/* sanity check */
f735c40ed93ccae Andre Przywara           2020-03-24  3003  				iowrite32(0xffffffff, desc);
f735c40ed93ccae Andre Przywara           2020-03-24  3004  				if (ioread32(desc) > 0) {
f735c40ed93ccae Andre Przywara           2020-03-24  3005  					lp->features |= XAE_FEATURE_DMA_64BIT;
5fff0151b3244dc Andre Przywara           2020-03-24  3006  					addr_width = 64;
f735c40ed93ccae Andre Przywara           2020-03-24  3007  					dev_info(&pdev->dev,
f735c40ed93ccae Andre Przywara           2020-03-24  3008  						 "autodetected 64-bit DMA range\n");
f735c40ed93ccae Andre Przywara           2020-03-24  3009  				}
f735c40ed93ccae Andre Przywara           2020-03-24  3010  				iowrite32(0x0, desc);
f735c40ed93ccae Andre Przywara           2020-03-24  3011  			}
f735c40ed93ccae Andre Przywara           2020-03-24  3012  		}
00be43a74ca2622 Andy Chiu                2022-06-13  3013  		if (!IS_ENABLED(CONFIG_64BIT) && lp->features & XAE_FEATURE_DMA_64BIT) {
61fde5110ee9f1f Colin Ian King           2025-04-18  3014  			dev_err(&pdev->dev, "64-bit addressable DMA is not compatible with 32-bit architecture\n");
808d077f5b53806 Sean Anderson            2026-01-17  3015  			return -EINVAL;
00be43a74ca2622 Andy Chiu                2022-06-13  3016  		}
f735c40ed93ccae Andre Przywara           2020-03-24  3017  
5fff0151b3244dc Andre Przywara           2020-03-24  3018  		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(addr_width));
5fff0151b3244dc Andre Przywara           2020-03-24  3019  		if (ret) {
5fff0151b3244dc Andre Przywara           2020-03-24  3020  			dev_err(&pdev->dev, "No suitable DMA available\n");
808d077f5b53806 Sean Anderson            2026-01-17  3021  			return ret;
5fff0151b3244dc Andre Przywara           2020-03-24  3022  		}
6b1b40f704fc39d Sarath Babu Naidu Gaddam 2023-11-16  3023  		netif_napi_add(ndev, &lp->napi_rx, axienet_rx_poll);
6b1b40f704fc39d Sarath Babu Naidu Gaddam 2023-11-16  3024  		netif_napi_add(ndev, &lp->napi_tx, axienet_tx_poll);
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3025  	} else {
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3026  		struct xilinx_vdma_config cfg;
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3027  		struct dma_chan *tx_chan;
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3028  
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3029  		lp->eth_irq = platform_get_irq_optional(pdev, 0);
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3030  		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO) {
808d077f5b53806 Sean Anderson            2026-01-17  3031  			return lp->eth_irq;
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3032  		}
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3033  		tx_chan = dma_request_chan(lp->dev, "tx_chan0");
808d077f5b53806 Sean Anderson            2026-01-17  3034  		if (IS_ERR(tx_chan))
808d077f5b53806 Sean Anderson            2026-01-17  3035  			return dev_err_probe(lp->dev, PTR_ERR(tx_chan),
808d077f5b53806 Sean Anderson            2026-01-17  3036  					     "No Ethernet DMA (TX) channel found\n");
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3037  
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3038  		cfg.reset = 1;
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3039  		/* As name says VDMA but it has support for DMA channel reset */
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3040  		ret = xilinx_vdma_channel_set_config(tx_chan, &cfg);
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3041  		if (ret < 0) {
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3042  			dev_err(&pdev->dev, "Reset channel failed\n");
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3043  			dma_release_channel(tx_chan);
808d077f5b53806 Sean Anderson            2026-01-17  3044  			return ret;
6b1b40f704fc39d Sarath Babu Naidu Gaddam 2023-11-16  3045  		}
5fff0151b3244dc Andre Przywara           2020-03-24  3046  
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3047  		dma_release_channel(tx_chan);
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3048  		lp->use_dmaengine = 1;
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3049  	}
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3050  
c1c3d01e3a9038d Suraj Gupta              2026-06-01  3051  	if (lp->use_dmaengine) {
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3052  		ndev->netdev_ops = &axienet_netdev_dmaengine_ops;
c1c3d01e3a9038d Suraj Gupta              2026-06-01  3053  		ndev->ethtool_ops = &axienet_ethtool_dmaengine_ops;
c1c3d01e3a9038d Suraj Gupta              2026-06-01  3054  	} else {
6a91b846af85a24 Radhey Shyam Pandey      2023-11-16  3055  		ndev->netdev_ops = &axienet_netdev_ops;
c1c3d01e3a9038d Suraj Gupta              2026-06-01  3056  		ndev->ethtool_ops = &axienet_ethtool_ops;
c1c3d01e3a9038d Suraj Gupta              2026-06-01  3057  	}
522856cefaf09d1 Robert Hancock           2019-06-06  3058  	/* Check for Ethernet core IRQ (optional) */
2d2f18d49221846 bui duc phuc             2026-09-09  3059  	if (lp->eth_irq < 0)
522856cefaf09d1 Robert Hancock           2019-06-06  3060  		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
522856cefaf09d1 Robert Hancock           2019-06-06  3061  
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3062  	/* Retrieve the MAC address */
83216e3988cd196 Michael Walle            2021-04-12  3063  	ret = of_get_mac_address(pdev->dev.of_node, mac_addr);
83216e3988cd196 Michael Walle            2021-04-12  3064  	if (!ret) {
da90e38003e2f05 Tobias Klauser           2016-12-07  3065  		axienet_set_mac_address(ndev, mac_addr);
83216e3988cd196 Michael Walle            2021-04-12  3066  	} else {
83216e3988cd196 Michael Walle            2021-04-12  3067  		dev_warn(&pdev->dev, "could not find MAC address property: %d\n",
83216e3988cd196 Michael Walle            2021-04-12  3068  			 ret);
83216e3988cd196 Michael Walle            2021-04-12  3069  		axienet_set_mac_address(ndev, NULL);
83216e3988cd196 Michael Walle            2021-04-12  3070  	}
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3071  
d048c717df33baf Sean Anderson            2025-02-06  3072  	spin_lock_init(&lp->rx_cr_lock);
d048c717df33baf Sean Anderson            2025-02-06  3073  	spin_lock_init(&lp->tx_cr_lock);
e1d27d29dbe5139 Sean Anderson            2025-02-06  3074  	INIT_WORK(&lp->rx_dim.work, axienet_rx_dim_work);
e1d27d29dbe5139 Sean Anderson            2025-02-06  3075  	lp->rx_dim_enabled = true;
e1d27d29dbe5139 Sean Anderson            2025-02-06  3076  	lp->rx_dim.profile_ix = 1;
e1d27d29dbe5139 Sean Anderson            2025-02-06  3077  	lp->rx_dma_cr = axienet_calc_cr(lp, axienet_dim_coalesce_count_rx(lp),
eb80520e8a5be67 Sean Anderson            2025-02-06  3078  					XAXIDMA_DFT_RX_USEC);
eb80520e8a5be67 Sean Anderson            2025-02-06  3079  	lp->tx_dma_cr = axienet_calc_cr(lp, XAXIDMA_DFT_TX_THRESHOLD,
eb80520e8a5be67 Sean Anderson            2025-02-06  3080  					XAXIDMA_DFT_TX_USEC);
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3081  
09a0354cadec267 Robert Hancock           2019-06-06  3082  	ret = axienet_mdio_setup(lp);
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3083  	if (ret)
09a0354cadec267 Robert Hancock           2019-06-06  3084  		dev_warn(&pdev->dev,
09a0354cadec267 Robert Hancock           2019-06-06  3085  			 "error registering MDIO bus: %d\n", ret);
d1c4f93e3f0a023 Andy Chiu                2022-04-05  3086  
1a02556086fc0eb Robert Hancock           2020-10-28  3087  	if (lp->phy_mode == PHY_INTERFACE_MODE_SGMII ||
1a02556086fc0eb Robert Hancock           2020-10-28  3088  	    lp->phy_mode == PHY_INTERFACE_MODE_1000BASEX) {
19c7a43912c61a3 Andy Chiu                2022-04-05  3089  		np = of_parse_phandle(pdev->dev.of_node, "pcs-handle", 0);
19c7a43912c61a3 Andy Chiu                2022-04-05  3090  		if (!np) {
19c7a43912c61a3 Andy Chiu                2022-04-05  3091  			/* Deprecated: Always use "pcs-handle" for pcs_phy.
19c7a43912c61a3 Andy Chiu                2022-04-05  3092  			 * Falling back to "phy-handle" here is only for
19c7a43912c61a3 Andy Chiu                2022-04-05  3093  			 * backward compatibility with old device trees.
19c7a43912c61a3 Andy Chiu                2022-04-05  3094  			 */
ab3a5d4c6081dbc Andy Chiu                2022-04-05  3095  			np = of_parse_phandle(pdev->dev.of_node, "phy-handle", 0);
19c7a43912c61a3 Andy Chiu                2022-04-05  3096  		}
ab3a5d4c6081dbc Andy Chiu                2022-04-05  3097  		if (!np) {
19c7a43912c61a3 Andy Chiu                2022-04-05  3098  			dev_err(&pdev->dev, "pcs-handle (preferred) or phy-handle required for 1000BaseX/SGMII\n");
1a02556086fc0eb Robert Hancock           2020-10-28  3099  			ret = -EINVAL;
59cd4f19267a0aa Robert Hancock           2021-03-11  3100  			goto cleanup_mdio;
1a02556086fc0eb Robert Hancock           2020-10-28  3101  		}
ab3a5d4c6081dbc Andy Chiu                2022-04-05  3102  		lp->pcs_phy = of_mdio_find_device(np);
1a02556086fc0eb Robert Hancock           2020-10-28  3103  		if (!lp->pcs_phy) {
1a02556086fc0eb Robert Hancock           2020-10-28  3104  			ret = -EPROBE_DEFER;
ab3a5d4c6081dbc Andy Chiu                2022-04-05  3105  			of_node_put(np);
59cd4f19267a0aa Robert Hancock           2021-03-11  3106  			goto cleanup_mdio;
1a02556086fc0eb Robert Hancock           2020-10-28  3107  		}
ab3a5d4c6081dbc Andy Chiu                2022-04-05  3108  		of_node_put(np);
7a86be6a5135eaa Russell King (Oracle     2022-01-25  3109) 		lp->pcs.ops = &axienet_pcs_ops;
7a86be6a5135eaa Russell King (Oracle     2022-01-25  3110) 		lp->pcs.poll = true;
1a02556086fc0eb Robert Hancock           2020-10-28  3111  	}
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3112  
f5203a3d9b25fa2 Robert Hancock           2019-06-06  3113  	lp->phylink_config.dev = &ndev->dev;
f5203a3d9b25fa2 Robert Hancock           2019-06-06  3114  	lp->phylink_config.type = PHYLINK_NETDEV;
a370295367b5566 Nick Hu                  2025-02-17  3115  	lp->phylink_config.mac_managed_pm = true;
72a47e1aaf2e05e Russell King (Oracle     2021-11-16  3116) 	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
72a47e1aaf2e05e Russell King (Oracle     2021-11-16  3117) 		MAC_10FD | MAC_100FD | MAC_1000FD;
f5203a3d9b25fa2 Robert Hancock           2019-06-06  3118  
136a3fa28a9f562 Russell King (Oracle     2021-11-16  3119) 	__set_bit(lp->phy_mode, lp->phylink_config.supported_interfaces);
136a3fa28a9f562 Russell King (Oracle     2021-11-16  3120) 	if (lp->switch_x_sgmii) {
136a3fa28a9f562 Russell King (Oracle     2021-11-16  3121) 		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
136a3fa28a9f562 Russell King (Oracle     2021-11-16  3122) 			  lp->phylink_config.supported_interfaces);
136a3fa28a9f562 Russell King (Oracle     2021-11-16  3123) 		__set_bit(PHY_INTERFACE_MODE_SGMII,
136a3fa28a9f562 Russell King (Oracle     2021-11-16  3124) 			  lp->phylink_config.supported_interfaces);
136a3fa28a9f562 Russell King (Oracle     2021-11-16  3125) 	}
136a3fa28a9f562 Russell King (Oracle     2021-11-16  3126) 
f5203a3d9b25fa2 Robert Hancock           2019-06-06  3127  	lp->phylink = phylink_create(&lp->phylink_config, pdev->dev.fwnode,
f5203a3d9b25fa2 Robert Hancock           2019-06-06  3128  				     lp->phy_mode,
f5203a3d9b25fa2 Robert Hancock           2019-06-06  3129  				     &axienet_phylink_ops);
f5203a3d9b25fa2 Robert Hancock           2019-06-06  3130  	if (IS_ERR(lp->phylink)) {
f5203a3d9b25fa2 Robert Hancock           2019-06-06  3131  		ret = PTR_ERR(lp->phylink);
f5203a3d9b25fa2 Robert Hancock           2019-06-06  3132  		dev_err(&pdev->dev, "phylink_create error (%i)\n", ret);
59cd4f19267a0aa Robert Hancock           2021-03-11  3133  		goto cleanup_mdio;
f5203a3d9b25fa2 Robert Hancock           2019-06-06  3134  	}
f5203a3d9b25fa2 Robert Hancock           2019-06-06  3135  
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3136  	ret = register_netdev(lp->ndev);
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3137  	if (ret) {
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3138  		dev_err(lp->dev, "register_netdev() error (%i)\n", ret);
59cd4f19267a0aa Robert Hancock           2021-03-11  3139  		goto cleanup_phylink;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3140  	}
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3141  
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3142  	return 0;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3143  
59cd4f19267a0aa Robert Hancock           2021-03-11  3144  cleanup_phylink:
59cd4f19267a0aa Robert Hancock           2021-03-11  3145  	phylink_destroy(lp->phylink);
59cd4f19267a0aa Robert Hancock           2021-03-11  3146  
59cd4f19267a0aa Robert Hancock           2021-03-11  3147  cleanup_mdio:
59cd4f19267a0aa Robert Hancock           2021-03-11  3148  	if (lp->pcs_phy)
59cd4f19267a0aa Robert Hancock           2021-03-11  3149  		put_device(&lp->pcs_phy->dev);
59cd4f19267a0aa Robert Hancock           2021-03-11  3150  	if (lp->mii_bus)
59cd4f19267a0aa Robert Hancock           2021-03-11  3151  		axienet_mdio_teardown(lp);
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3152  	return ret;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3153  }
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  3154  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
