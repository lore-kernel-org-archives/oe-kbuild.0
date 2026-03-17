Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6898355F22
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Mar 2026 22:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785274; cv=none; b=JeJ/U4MPCHkKHawI89bqTHSvUbtroIDAVV5umWsUCuGGnP7GP2UIRM7xdS87epY/pRjfSzgFMPL+cWOJIxG3E+o2AOITmA4CzfXFVtl0MBAU4cGpSb+VOg2fz1R224nKMk03+VpqqlFp6eCXakyEPEcRLl39WB8IYNPVb6BHDBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785274; c=relaxed/simple;
	bh=8SQpNMMTNwjnWzro1DQdsUeCZUn2TvSzZS2L9nz08ck=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cj6g0RZdKtgPwlodeXCGlNsJFApYaEzZgLqmubvKwawgP6UtvAjj8R8g+cktrNQRkKSFW26jgtkpDFQ6t856j4URpjRgxybc2IZyIo13XceOEjErRXFH1JiD8bF81Cv2Zw43sakDWWw6AtXJmGqgX4LbU4JE8pepgyTZGHozg0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQqxzIeo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQqxzIeo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773785273; x=1805321273;
  h=date:from:to:cc:subject:message-id;
  bh=8SQpNMMTNwjnWzro1DQdsUeCZUn2TvSzZS2L9nz08ck=;
  b=gQqxzIeocrZdQtn0X9jxKsNbnVKqey/diFajRs7vTs+9GT1agIk2bgVt
   Ynw7IakgvZ3JbbeeJicHZubGD7cJTm9qj0AGDp6ZZk0T9W6g4PdbR7FVw
   AffsVHHzC9GVkEH6HVZV4ZS+aRkX8HUmX2SrtoaA1G9pmHfQbQLXySTOU
   zDKbFmFr7JGEBwgZymWRUWr1gAwCtFcv8Gj4Wc/RYLk4h4x/tMf6Z/Bqm
   rsfRCJpGMfcTlsxBcVRZuP3ZIT2pPdrBJkUn2soNQTCx7Sn3Y2z9BFDZH
   JEp0JVLdMzTOfFpuRj9mjexc2tl/1J7OPet0w1ohmCVTTKH80sbRIaz/F
   g==;
X-CSE-ConnectionGUID: ydHYq5TtTxSbooGLP6nvJg==
X-CSE-MsgGUID: 8kdviUwRRwW12zu/RJEKkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78439820"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="78439820"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:07:51 -0700
X-CSE-ConnectionGUID: E3u7WwfASQCSp5NIWN2SHg==
X-CSE-MsgGUID: MBwJZQvEQ3CmkALc92bZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226552705"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Mar 2026 15:07:49 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2cZl-0000000025f-1yR6;
	Tue, 17 Mar 2026 22:07:45 +0000
Date: Wed, 18 Mar 2026 06:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6377/6828]
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3945
 stmmac_request_irq_multi_msi() warn: 'msi->sfty_ce_irq' from request_irq()
 not released on lines: 3945.
Message-ID: <202603180601.Zk8OGTBr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Florian Bezdeka <florian.bezdeka@siemens.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
commit: dab177cbea3491354cc3c0b268602d8902501233 [6377/6828] net: stmmac: move MSI data out of struct stmmac_priv
:::::: branch date: 5 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-r072-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180601.Zk8OGTBr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603180601.Zk8OGTBr-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3945 stmmac_request_irq_multi_msi() warn: 'msi->sfty_ce_irq' from request_irq() not released on lines: 3945.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3945 stmmac_request_irq_multi_msi() warn: 'msi->sfty_ue_irq' from request_irq() not released on lines: 3945.

Old smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3945 stmmac_request_irq_multi_msi() warn: 'dev->irq' from request_irq() not released on lines: 3945.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3945 stmmac_request_irq_multi_msi() warn: 'priv->sfty_irq' from request_irq() not released on lines: 3945.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3945 stmmac_request_irq_multi_msi() warn: 'priv->wol_irq' from request_irq() not released on lines: 3945.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3998 stmmac_request_irq_single() warn: 'dev->irq' from request_irq() not released on lines: 3998.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3998 stmmac_request_irq_single() warn: 'priv->wol_irq' from request_irq() not released on lines: 3998.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5816 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5825 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5848 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()

vim +3945 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

dab177cbea3491 Russell King (Oracle  2026-03-13  3798) 
e9ee910218ffd4 Jakub Kicinski        2024-01-07  3799  static int stmmac_request_irq_multi_msi(struct net_device *dev)
8532f613bc78b6 Ong Boon Leong        2021-03-26  3800  {
8532f613bc78b6 Ong Boon Leong        2021-03-26  3801  	struct stmmac_priv *priv = netdev_priv(dev);
dab177cbea3491 Russell King (Oracle  2026-03-13  3802) 	struct stmmac_msi *msi = priv->msi;
3e6dc7b650250f Wong Vee Khee         2021-06-11  3803  	enum request_irq_err irq_err;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3804  	int irq_idx = 0;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3805  	char *int_name;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3806  	int ret;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3807  	int i;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3808  
8532f613bc78b6 Ong Boon Leong        2021-03-26  3809  	/* For common interrupt */
dab177cbea3491 Russell King (Oracle  2026-03-13  3810) 	int_name = msi->int_name_mac;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3811  	sprintf(int_name, "%s:%s", dev->name, "mac");
8532f613bc78b6 Ong Boon Leong        2021-03-26  3812  	ret = request_irq(dev->irq, stmmac_mac_interrupt,
8532f613bc78b6 Ong Boon Leong        2021-03-26  3813  			  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong        2021-03-26  3814  	if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong        2021-03-26  3815  		netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong        2021-03-26  3816  			   "%s: alloc mac MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong        2021-03-26  3817  			   __func__, dev->irq, ret);
8532f613bc78b6 Ong Boon Leong        2021-03-26  3818  		irq_err = REQ_IRQ_ERR_MAC;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3819  		goto irq_error;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3820  	}
8532f613bc78b6 Ong Boon Leong        2021-03-26  3821  
8532f613bc78b6 Ong Boon Leong        2021-03-26  3822  	/* Request the Wake IRQ in case of another line
8532f613bc78b6 Ong Boon Leong        2021-03-26  3823  	 * is used for WoL
8532f613bc78b6 Ong Boon Leong        2021-03-26  3824  	 */
8532f613bc78b6 Ong Boon Leong        2021-03-26  3825  	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
dab177cbea3491 Russell King (Oracle  2026-03-13  3826) 		int_name = msi->int_name_wol;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3827  		sprintf(int_name, "%s:%s", dev->name, "wol");
8532f613bc78b6 Ong Boon Leong        2021-03-26  3828  		ret = request_irq(priv->wol_irq,
8532f613bc78b6 Ong Boon Leong        2021-03-26  3829  				  stmmac_mac_interrupt,
8532f613bc78b6 Ong Boon Leong        2021-03-26  3830  				  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong        2021-03-26  3831  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong        2021-03-26  3832  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong        2021-03-26  3833  				   "%s: alloc wol MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong        2021-03-26  3834  				   __func__, priv->wol_irq, ret);
8532f613bc78b6 Ong Boon Leong        2021-03-26  3835  			irq_err = REQ_IRQ_ERR_WOL;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3836  			goto irq_error;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3837  		}
8532f613bc78b6 Ong Boon Leong        2021-03-26  3838  	}
8532f613bc78b6 Ong Boon Leong        2021-03-26  3839  
5c2215167d122b Suraj Jaiswal         2024-02-09  3840  	/* Request the common Safety Feature Correctible/Uncorrectible
5c2215167d122b Suraj Jaiswal         2024-02-09  3841  	 * Error line in case of another line is used
5c2215167d122b Suraj Jaiswal         2024-02-09  3842  	 */
5c2215167d122b Suraj Jaiswal         2024-02-09  3843  	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
dab177cbea3491 Russell King (Oracle  2026-03-13  3844) 		int_name = msi->int_name_sfty;
5c2215167d122b Suraj Jaiswal         2024-02-09  3845  		sprintf(int_name, "%s:%s", dev->name, "safety");
5c2215167d122b Suraj Jaiswal         2024-02-09  3846  		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
5c2215167d122b Suraj Jaiswal         2024-02-09  3847  				  0, int_name, dev);
5c2215167d122b Suraj Jaiswal         2024-02-09  3848  		if (unlikely(ret < 0)) {
5c2215167d122b Suraj Jaiswal         2024-02-09  3849  			netdev_err(priv->dev,
5c2215167d122b Suraj Jaiswal         2024-02-09  3850  				   "%s: alloc sfty MSI %d (error: %d)\n",
5c2215167d122b Suraj Jaiswal         2024-02-09  3851  				   __func__, priv->sfty_irq, ret);
5c2215167d122b Suraj Jaiswal         2024-02-09  3852  			irq_err = REQ_IRQ_ERR_SFTY;
5c2215167d122b Suraj Jaiswal         2024-02-09  3853  			goto irq_error;
5c2215167d122b Suraj Jaiswal         2024-02-09  3854  		}
5c2215167d122b Suraj Jaiswal         2024-02-09  3855  	}
5c2215167d122b Suraj Jaiswal         2024-02-09  3856  
8532f613bc78b6 Ong Boon Leong        2021-03-26  3857  	/* Request the Safety Feature Correctible Error line in
8532f613bc78b6 Ong Boon Leong        2021-03-26  3858  	 * case of another line is used
8532f613bc78b6 Ong Boon Leong        2021-03-26  3859  	 */
dab177cbea3491 Russell King (Oracle  2026-03-13  3860) 	if (msi->sfty_ce_irq > 0 && msi->sfty_ce_irq != dev->irq) {
dab177cbea3491 Russell King (Oracle  2026-03-13  3861) 		int_name = msi->int_name_sfty_ce;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3862  		sprintf(int_name, "%s:%s", dev->name, "safety-ce");
dab177cbea3491 Russell King (Oracle  2026-03-13  3863) 		ret = request_irq(msi->sfty_ce_irq,
8532f613bc78b6 Ong Boon Leong        2021-03-26  3864  				  stmmac_safety_interrupt,
8532f613bc78b6 Ong Boon Leong        2021-03-26  3865  				  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong        2021-03-26  3866  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong        2021-03-26  3867  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong        2021-03-26  3868  				   "%s: alloc sfty ce MSI %d (error: %d)\n",
dab177cbea3491 Russell King (Oracle  2026-03-13  3869) 				   __func__, msi->sfty_ce_irq, ret);
8532f613bc78b6 Ong Boon Leong        2021-03-26  3870  			irq_err = REQ_IRQ_ERR_SFTY_CE;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3871  			goto irq_error;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3872  		}
8532f613bc78b6 Ong Boon Leong        2021-03-26  3873  	}
8532f613bc78b6 Ong Boon Leong        2021-03-26  3874  
8532f613bc78b6 Ong Boon Leong        2021-03-26  3875  	/* Request the Safety Feature Uncorrectible Error line in
8532f613bc78b6 Ong Boon Leong        2021-03-26  3876  	 * case of another line is used
8532f613bc78b6 Ong Boon Leong        2021-03-26  3877  	 */
dab177cbea3491 Russell King (Oracle  2026-03-13  3878) 	if (msi->sfty_ue_irq > 0 && msi->sfty_ue_irq != dev->irq) {
dab177cbea3491 Russell King (Oracle  2026-03-13  3879) 		int_name = msi->int_name_sfty_ue;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3880  		sprintf(int_name, "%s:%s", dev->name, "safety-ue");
dab177cbea3491 Russell King (Oracle  2026-03-13  3881) 		ret = request_irq(msi->sfty_ue_irq,
8532f613bc78b6 Ong Boon Leong        2021-03-26  3882  				  stmmac_safety_interrupt,
8532f613bc78b6 Ong Boon Leong        2021-03-26  3883  				  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong        2021-03-26  3884  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong        2021-03-26  3885  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong        2021-03-26  3886  				   "%s: alloc sfty ue MSI %d (error: %d)\n",
dab177cbea3491 Russell King (Oracle  2026-03-13  3887) 				   __func__, msi->sfty_ue_irq, ret);
8532f613bc78b6 Ong Boon Leong        2021-03-26  3888  			irq_err = REQ_IRQ_ERR_SFTY_UE;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3889  			goto irq_error;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3890  		}
8532f613bc78b6 Ong Boon Leong        2021-03-26  3891  	}
8532f613bc78b6 Ong Boon Leong        2021-03-26  3892  
e9ee910218ffd4 Jakub Kicinski        2024-01-07  3893  	/* Request Rx MSI irq */
8532f613bc78b6 Ong Boon Leong        2021-03-26  3894  	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
d68c2e1d19c540 Arnd Bergmann         2021-09-27  3895  		if (i >= MTL_MAX_RX_QUEUES)
3e0d5699a97571 Arnd Bergmann         2021-09-27  3896  			break;
dab177cbea3491 Russell King (Oracle  2026-03-13  3897) 		if (msi->rx_irq[i] == 0)
8532f613bc78b6 Ong Boon Leong        2021-03-26  3898  			continue;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3899  
dab177cbea3491 Russell King (Oracle  2026-03-13  3900) 		int_name = msi->int_name_rx_irq[i];
8532f613bc78b6 Ong Boon Leong        2021-03-26  3901  		sprintf(int_name, "%s:%s-%d", dev->name, "rx", i);
dab177cbea3491 Russell King (Oracle  2026-03-13  3902) 		ret = request_irq(msi->rx_irq[i],
e9ee910218ffd4 Jakub Kicinski        2024-01-07  3903  				  stmmac_msi_intr_rx,
8531c80800c10e Christian Marangi     2022-07-23  3904  				  0, int_name, &priv->dma_conf.rx_queue[i]);
8532f613bc78b6 Ong Boon Leong        2021-03-26  3905  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong        2021-03-26  3906  			netdev_err(priv->dev,
e9ee910218ffd4 Jakub Kicinski        2024-01-07  3907  				   "%s: alloc rx-%d  MSI %d (error: %d)\n",
dab177cbea3491 Russell King (Oracle  2026-03-13  3908) 				   __func__, i, msi->rx_irq[i], ret);
8532f613bc78b6 Ong Boon Leong        2021-03-26  3909  			irq_err = REQ_IRQ_ERR_RX;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3910  			irq_idx = i;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3911  			goto irq_error;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3912  		}
dab177cbea3491 Russell King (Oracle  2026-03-13  3913) 		irq_set_affinity_hint(msi->rx_irq[i],
c60d101a226f18 Qingfang Deng         2025-03-18  3914  				      cpumask_of(i % num_online_cpus()));
8532f613bc78b6 Ong Boon Leong        2021-03-26  3915  	}
8532f613bc78b6 Ong Boon Leong        2021-03-26  3916  
e9ee910218ffd4 Jakub Kicinski        2024-01-07  3917  	/* Request Tx MSI irq */
8532f613bc78b6 Ong Boon Leong        2021-03-26  3918  	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
d68c2e1d19c540 Arnd Bergmann         2021-09-27  3919  		if (i >= MTL_MAX_TX_QUEUES)
3e0d5699a97571 Arnd Bergmann         2021-09-27  3920  			break;
dab177cbea3491 Russell King (Oracle  2026-03-13  3921) 		if (msi->tx_irq[i] == 0)
8532f613bc78b6 Ong Boon Leong        2021-03-26  3922  			continue;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3923  
dab177cbea3491 Russell King (Oracle  2026-03-13  3924) 		int_name = msi->int_name_tx_irq[i];
8532f613bc78b6 Ong Boon Leong        2021-03-26  3925  		sprintf(int_name, "%s:%s-%d", dev->name, "tx", i);
dab177cbea3491 Russell King (Oracle  2026-03-13  3926) 		ret = request_irq(msi->tx_irq[i],
e9ee910218ffd4 Jakub Kicinski        2024-01-07  3927  				  stmmac_msi_intr_tx,
8531c80800c10e Christian Marangi     2022-07-23  3928  				  0, int_name, &priv->dma_conf.tx_queue[i]);
8532f613bc78b6 Ong Boon Leong        2021-03-26  3929  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong        2021-03-26  3930  			netdev_err(priv->dev,
e9ee910218ffd4 Jakub Kicinski        2024-01-07  3931  				   "%s: alloc tx-%d  MSI %d (error: %d)\n",
dab177cbea3491 Russell King (Oracle  2026-03-13  3932) 				   __func__, i, msi->tx_irq[i], ret);
8532f613bc78b6 Ong Boon Leong        2021-03-26  3933  			irq_err = REQ_IRQ_ERR_TX;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3934  			irq_idx = i;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3935  			goto irq_error;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3936  		}
dab177cbea3491 Russell King (Oracle  2026-03-13  3937) 		irq_set_affinity_hint(msi->tx_irq[i],
c60d101a226f18 Qingfang Deng         2025-03-18  3938  				      cpumask_of(i % num_online_cpus()));
8532f613bc78b6 Ong Boon Leong        2021-03-26  3939  	}
8532f613bc78b6 Ong Boon Leong        2021-03-26  3940  
8532f613bc78b6 Ong Boon Leong        2021-03-26  3941  	return 0;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3942  
8532f613bc78b6 Ong Boon Leong        2021-03-26  3943  irq_error:
8532f613bc78b6 Ong Boon Leong        2021-03-26  3944  	stmmac_free_irq(dev, irq_err, irq_idx);
8532f613bc78b6 Ong Boon Leong        2021-03-26 @3945  	return ret;
8532f613bc78b6 Ong Boon Leong        2021-03-26  3946  }
8532f613bc78b6 Ong Boon Leong        2021-03-26  3947  

:::::: The code at line 3945 was first introduced by commit
:::::: 8532f613bc78b6e0e32b486e720848d3f5569287 net: stmmac: introduce MSI Interrupt routines for mac, safety, RX & TX

:::::: TO: Ong Boon Leong <boon.leong.ong@intel.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
