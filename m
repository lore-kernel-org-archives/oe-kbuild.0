Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2691339847
	for <oe-kbuild@lists.linux.dev>; Wed, 15 May 2024 04:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715746285; cv=none; b=r9QJyMqsK5DetVa2LKZOO6HMazwXLz5tegCPctvVesjIgtPA1evsGDnEMVKqRB+Bnudi/uBlndrWlY4t5DMg+XwEQHOKQW5iEw7YMPwa5la9qNSshtXwP0KCCSDxoGinbIiMkUEvE5CC6LH5vTBj2dQUd0pRZhIHrVknkO2tdbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715746285; c=relaxed/simple;
	bh=qlxXh/wkqFBckJuocqAPql1AUHaXd4rhKMFK0740sfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qcR9TK/Ma0rhN0zA7jzkGnpibj4tkTn1k5SPIJZk4fRv5Rtcx/c8Bt63ll420NQepMjth6dCUvLy25JAf+dz4WlI69adlmQjNBQPzI1WjQryM48uLIPT4iI6A9QboidFcpH5eE1JfsG43fQbF6bRoFDnMMx1ofBdUtgvssncaUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/CIgxVK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/CIgxVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715746283; x=1747282283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qlxXh/wkqFBckJuocqAPql1AUHaXd4rhKMFK0740sfw=;
  b=E/CIgxVKUva4Lh1YXlI03ZlaDMl4Mgitn96h9ytFimrKEDdXOSZezggg
   5An5x8QdeuDjj+YaZ7q8xtXRHlq8bKdqFBPGR9gYhRESBpdueZYusbjr9
   4SXICnsZmum8l8B+PQIg5SjD/A9HIz2sp2e1Hnfj8Tamc48bwJDdEs3A6
   hLXAy9B2aG1AmAK5qiIevhpD4Jq4/vPc0lpDu89NtJJun02jx7EN3xYto
   mAmc31Cin95ptek0Ao14J6/5KO6JFd5eC+4bGgDQNQ0dAQ1etIAitDgd6
   zMiI/WPY65g5gr1z2sUF23n1Ci3WAs1dO8PoEe5lMNS+0/YoARpJVJd/D
   w==;
X-CSE-ConnectionGUID: foWQmfztTW2NPF6th0cjyA==
X-CSE-MsgGUID: OqsBC1UiR3eMsGXpl9e5FA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="29291840"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="29291840"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 21:11:23 -0700
X-CSE-ConnectionGUID: 3QGTCGT2SsCcBniUUKoQaw==
X-CSE-MsgGUID: OvSIVVC4TGyuRba19kW8Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="31026184"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 May 2024 21:11:21 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s75z4-000CP5-28;
	Wed, 15 May 2024 04:11:18 +0000
Date: Wed, 15 May 2024 12:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ti:ti-linux-6.1.y-wip 2/5]
 drivers/phy/cadence/phy-cadence-torrent.c:2534
 cdns_torrent_phy_configure_multilink() error: uninitialized symbol 'phy_t1'.
Message-ID: <202405151257.1S5SpjHI-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Dasnavis Sabiya <sabiya.d@ti.com>
CC: Udit Kumar <u-kumar1@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   c1c2f1971fbf6ddad93a8c94314fe8221e7aa6be
commit: d0d3c1e91c7affc0a4c30793a93ba920076130ec [2/5] phy: cadence-torrent: Add PCIe multilink + USB with same SSC register config for 100MHz refclk
:::::: branch date: 32 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-141-20240515 (https://download.01.org/0day-ci/archive/20240515/202405151257.1S5SpjHI-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405151257.1S5SpjHI-lkp@intel.com/

New smatch warnings:
drivers/phy/cadence/phy-cadence-torrent.c:2534 cdns_torrent_phy_configure_multilink() error: uninitialized symbol 'phy_t1'.
drivers/phy/cadence/phy-cadence-torrent.c:2534 cdns_torrent_phy_configure_multilink() error: uninitialized symbol 'phy_t2'.
drivers/phy/cadence/phy-cadence-torrent.c:2814 cdns_torrent_clk() warn: 'cdns_phy->clk' from clk_prepare_enable() not released on lines: 2771.

Old smatch warnings:
drivers/phy/cadence/phy-cadence-torrent.c:2493 cdns_torrent_phy_configure_multilink() error: uninitialized symbol 'pcie_links'.
drivers/phy/cadence/phy-cadence-torrent.c:2498 cdns_torrent_phy_configure_multilink() error: uninitialized symbol 'pcie_links'.

vim +/phy_t1 +2534 drivers/phy/cadence/phy-cadence-torrent.c

5b16a790f18d23 Swapnil Jakhade 2021-07-28  2466  
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2467  static
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2468  int cdns_torrent_phy_configure_multilink(struct cdns_torrent_phy *cdns_phy)
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2469  {
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2470  	const struct cdns_torrent_data *init_data = cdns_phy->init_data;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2471  	struct cdns_torrent_vals *cmn_vals, *tx_ln_vals, *rx_ln_vals;
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2472  	enum cdns_torrent_ref_clk ref_clk1 = cdns_phy->ref_clk1_rate;
6a2338a5bf7f9b Swapnil Jakhade 2021-07-28  2473  	enum cdns_torrent_ref_clk ref_clk = cdns_phy->ref_clk_rate;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2474  	struct cdns_torrent_vals *link_cmn_vals, *xcvr_diag_vals;
a463462998777a Yang Guang      2021-11-04  2475  	enum cdns_torrent_phy_type phy_t1, phy_t2;
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2476  	struct cdns_torrent_vals *phy_pma_cmn_vals;
4acea473f38865 Swapnil Jakhade 2020-09-17  2477  	struct cdns_torrent_vals *pcs_cmn_vals;
f0f1fa04581f06 Swapnil Jakhade 2020-09-17  2478  	int i, j, node, mlane, num_lanes, ret;
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2479  	u32 num_links = cdns_phy->nsubnodes;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2480  	struct cdns_reg_pairs *reg_pairs;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2481  	enum cdns_torrent_ssc_mode ssc;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2482  	struct regmap *regmap;
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2483  	u32 num_regs, pcie_links;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2484  
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2485  	if (num_links == 2) {
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2486  		phy_t1 = cdns_phy->phys[0].phy_type;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2487  		phy_t2 = cdns_phy->phys[1].phy_type;
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2488  	} else if (num_links > 2) {
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2489  		phy_t1 = TYPE_PCIE_ML;
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2490  		phy_t2 = TYPE_NONE;
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2491  		for (node = 0; node < num_links; node++) {
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2492  			if (cdns_phy->phys[node].phy_type == TYPE_PCIE) {
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2493  				pcie_links++;
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2494  				continue;
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2495  			}
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2496  			phy_t2 = cdns_phy->phys[node].phy_type;
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2497  		}
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2498  		if (pcie_links <= 1 || phy_t2 != TYPE_USB)
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2499  			return -EINVAL;
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2500  	}
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2501  
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2502  	/**
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2503  	 * First configure the PHY for first link with phy_t1. Get the array
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2504  	 * values as [phy_t1][phy_t2][ssc].
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2505  	 */
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2506  	for (node = 0; node < num_links; node++) {
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2507  		if ((num_links == 2 && node == 1) ||
d0d3c1e91c7aff Dasnavis Sabiya 2024-03-15  2508  		    (num_links > 2 && node == pcie_links)) {
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2509  			/**
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2510  			 * If first link with phy_t1 is configured, then
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2511  			 * configure the PHY for second link with phy_t2.
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2512  			 * Get the array values as [phy_t2][phy_t1][ssc].
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2513  			 */
a463462998777a Yang Guang      2021-11-04  2514  			swap(phy_t1, phy_t2);
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2515  			swap(ref_clk, ref_clk1);
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2516  		}
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2517  
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2518  		mlane = cdns_phy->phys[node].mlane;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2519  		ssc = cdns_phy->phys[node].ssc_mode;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2520  		num_lanes = cdns_phy->phys[node].num_lanes;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2521  
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2522  		/**
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2523  		 * PHY configuration specific registers:
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2524  		 * link_cmn_vals depend on combination of PHY types being
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2525  		 * configured and are common for both PHY types, so array
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2526  		 * values should be same for [phy_t1][phy_t2][ssc] and
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2527  		 * [phy_t2][phy_t1][ssc].
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2528  		 * xcvr_diag_vals also depend on combination of PHY types
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2529  		 * being configured, but these can be different for particular
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2530  		 * PHY type and are per lane.
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2531  		 */
03f791bfc0b5a6 Roger Quadros   2023-05-23  2532  		link_cmn_vals = cdns_torrent_get_tbl_vals(&init_data->link_cmn_vals_tbl,
03f791bfc0b5a6 Roger Quadros   2023-05-23  2533  							  CLK_ANY, CLK_ANY,
03f791bfc0b5a6 Roger Quadros   2023-05-23 @2534  							  phy_t1, phy_t2, ANY_SSC);
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2535  		if (link_cmn_vals) {
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2536  			reg_pairs = link_cmn_vals->reg_pairs;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2537  			num_regs = link_cmn_vals->num_regs;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2538  			regmap = cdns_phy->regmap_common_cdb;
d66a63666919e9 Swapnil Jakhade 2020-09-17  2539  
d66a63666919e9 Swapnil Jakhade 2020-09-17  2540  			/**
d66a63666919e9 Swapnil Jakhade 2020-09-17  2541  			 * First array value in link_cmn_vals must be of
d66a63666919e9 Swapnil Jakhade 2020-09-17  2542  			 * PHY_PLL_CFG register
d66a63666919e9 Swapnil Jakhade 2020-09-17  2543  			 */
d66a63666919e9 Swapnil Jakhade 2020-09-17  2544  			regmap_field_write(cdns_phy->phy_pll_cfg,
d66a63666919e9 Swapnil Jakhade 2020-09-17  2545  					   reg_pairs[0].val);
d66a63666919e9 Swapnil Jakhade 2020-09-17  2546  
d66a63666919e9 Swapnil Jakhade 2020-09-17  2547  			for (i = 1; i < num_regs; i++)
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2548  				regmap_write(regmap, reg_pairs[i].off,
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2549  					     reg_pairs[i].val);
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2550  		}
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2551  
03f791bfc0b5a6 Roger Quadros   2023-05-23  2552  		xcvr_diag_vals = cdns_torrent_get_tbl_vals(&init_data->xcvr_diag_vals_tbl,
03f791bfc0b5a6 Roger Quadros   2023-05-23  2553  							   CLK_ANY, CLK_ANY,
03f791bfc0b5a6 Roger Quadros   2023-05-23  2554  							   phy_t1, phy_t2, ANY_SSC);
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2555  		if (xcvr_diag_vals) {
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2556  			reg_pairs = xcvr_diag_vals->reg_pairs;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2557  			num_regs = xcvr_diag_vals->num_regs;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2558  			for (i = 0; i < num_lanes; i++) {
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2559  				regmap = cdns_phy->regmap_tx_lane_cdb[i + mlane];
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2560  				for (j = 0; j < num_regs; j++)
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2561  					regmap_write(regmap, reg_pairs[j].off,
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2562  						     reg_pairs[j].val);
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2563  			}
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2564  		}
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2565  
4acea473f38865 Swapnil Jakhade 2020-09-17  2566  		/* PHY PCS common registers configurations */
03f791bfc0b5a6 Roger Quadros   2023-05-23  2567  		pcs_cmn_vals = cdns_torrent_get_tbl_vals(&init_data->pcs_cmn_vals_tbl,
03f791bfc0b5a6 Roger Quadros   2023-05-23  2568  							 CLK_ANY, CLK_ANY,
03f791bfc0b5a6 Roger Quadros   2023-05-23  2569  							 phy_t1, phy_t2, ANY_SSC);
4acea473f38865 Swapnil Jakhade 2020-09-17  2570  		if (pcs_cmn_vals) {
4acea473f38865 Swapnil Jakhade 2020-09-17  2571  			reg_pairs = pcs_cmn_vals->reg_pairs;
4acea473f38865 Swapnil Jakhade 2020-09-17  2572  			num_regs = pcs_cmn_vals->num_regs;
4acea473f38865 Swapnil Jakhade 2020-09-17  2573  			regmap = cdns_phy->regmap_phy_pcs_common_cdb;
4acea473f38865 Swapnil Jakhade 2020-09-17  2574  			for (i = 0; i < num_regs; i++)
4acea473f38865 Swapnil Jakhade 2020-09-17  2575  				regmap_write(regmap, reg_pairs[i].off,
4acea473f38865 Swapnil Jakhade 2020-09-17  2576  					     reg_pairs[i].val);
4acea473f38865 Swapnil Jakhade 2020-09-17  2577  		}
4acea473f38865 Swapnil Jakhade 2020-09-17  2578  
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2579  		/* PHY PMA common registers configurations */
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2580  		phy_pma_cmn_vals = cdns_torrent_get_tbl_vals(&init_data->phy_pma_cmn_vals_tbl,
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2581  							     CLK_ANY, CLK_ANY,
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2582  							     phy_t1, phy_t2, ANY_SSC);
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2583  		if (phy_pma_cmn_vals) {
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2584  			reg_pairs = phy_pma_cmn_vals->reg_pairs;
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2585  			num_regs = phy_pma_cmn_vals->num_regs;
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2586  			regmap = cdns_phy->regmap_phy_pma_common_cdb;
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2587  			for (i = 0; i < num_regs; i++)
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2588  				regmap_write(regmap, reg_pairs[i].off,
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2589  					     reg_pairs[i].val);
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2590  		}
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2591  
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2592  		/* PMA common registers configurations */
03f791bfc0b5a6 Roger Quadros   2023-05-23  2593  		cmn_vals = cdns_torrent_get_tbl_vals(&init_data->cmn_vals_tbl,
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2594  						     ref_clk, ref_clk1,
03f791bfc0b5a6 Roger Quadros   2023-05-23  2595  						     phy_t1, phy_t2, ssc);
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2596  		if (cmn_vals) {
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2597  			reg_pairs = cmn_vals->reg_pairs;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2598  			num_regs = cmn_vals->num_regs;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2599  			regmap = cdns_phy->regmap_common_cdb;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2600  			for (i = 0; i < num_regs; i++)
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2601  				regmap_write(regmap, reg_pairs[i].off,
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2602  					     reg_pairs[i].val);
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2603  		}
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2604  
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2605  		/* PMA TX lane registers configurations */
03f791bfc0b5a6 Roger Quadros   2023-05-23  2606  		tx_ln_vals = cdns_torrent_get_tbl_vals(&init_data->tx_ln_vals_tbl,
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2607  						       ref_clk, ref_clk1,
03f791bfc0b5a6 Roger Quadros   2023-05-23  2608  						       phy_t1, phy_t2, ssc);
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2609  		if (tx_ln_vals) {
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2610  			reg_pairs = tx_ln_vals->reg_pairs;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2611  			num_regs = tx_ln_vals->num_regs;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2612  			for (i = 0; i < num_lanes; i++) {
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2613  				regmap = cdns_phy->regmap_tx_lane_cdb[i + mlane];
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2614  				for (j = 0; j < num_regs; j++)
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2615  					regmap_write(regmap, reg_pairs[j].off,
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2616  						     reg_pairs[j].val);
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2617  			}
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2618  		}
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2619  
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2620  		/* PMA RX lane registers configurations */
03f791bfc0b5a6 Roger Quadros   2023-05-23  2621  		rx_ln_vals = cdns_torrent_get_tbl_vals(&init_data->rx_ln_vals_tbl,
712c0eff8e30a1 Swapnil Jakhade 2023-05-23  2622  						       ref_clk, ref_clk1,
03f791bfc0b5a6 Roger Quadros   2023-05-23  2623  						       phy_t1, phy_t2, ssc);
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2624  		if (rx_ln_vals) {
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2625  			reg_pairs = rx_ln_vals->reg_pairs;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2626  			num_regs = rx_ln_vals->num_regs;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2627  			for (i = 0; i < num_lanes; i++) {
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2628  				regmap = cdns_phy->regmap_rx_lane_cdb[i + mlane];
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2629  				for (j = 0; j < num_regs; j++)
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2630  					regmap_write(regmap, reg_pairs[j].off,
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2631  						     reg_pairs[j].val);
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2632  			}
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2633  		}
f0f1fa04581f06 Swapnil Jakhade 2020-09-17  2634  
d33d6718be3480 Swapnil Jakhade 2023-04-23  2635  		if (phy_t1 == TYPE_DP) {
d33d6718be3480 Swapnil Jakhade 2023-04-23  2636  			ret = cdns_torrent_dp_get_pll(cdns_phy, phy_t2);
d33d6718be3480 Swapnil Jakhade 2023-04-23  2637  			if (ret)
d33d6718be3480 Swapnil Jakhade 2023-04-23  2638  				return ret;
d33d6718be3480 Swapnil Jakhade 2023-04-23  2639  		}
d33d6718be3480 Swapnil Jakhade 2023-04-23  2640  
f0f1fa04581f06 Swapnil Jakhade 2020-09-17  2641  		reset_control_deassert(cdns_phy->phys[node].lnk_rst);
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2642  	}
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2643  
f0f1fa04581f06 Swapnil Jakhade 2020-09-17  2644  	/* Take the PHY out of reset */
f0f1fa04581f06 Swapnil Jakhade 2020-09-17  2645  	ret = reset_control_deassert(cdns_phy->phy_rst);
f0f1fa04581f06 Swapnil Jakhade 2020-09-17  2646  	if (ret)
f0f1fa04581f06 Swapnil Jakhade 2020-09-17  2647  		return ret;
f0f1fa04581f06 Swapnil Jakhade 2020-09-17  2648  
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2649  	return 0;
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2650  }
6bcf3cb300376b Swapnil Jakhade 2020-09-17  2651  

:::::: The code at line 2534 was first introduced by commit
:::::: 03f791bfc0b5a6723298637a4b5d67bb9f6bab86 phy: cadence-torrent: Use key:value pair table for all settings

:::::: TO: Roger Quadros <rogerq@kernel.org>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
