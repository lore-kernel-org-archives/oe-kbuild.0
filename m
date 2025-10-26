Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9511A0BD0
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 03:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761450011; cv=none; b=cGRH466H4NaHu8FyBot7mrr1o2Z4l2sISVP7Kyeo1BcaUEfR1P/ARBpROev32TzSlVVZeOLc7d+Qhq2k49NnAp4KXqY5h0oEhcyy+IcGVUa93XEdVTa30/Ojh3ffObyKPPd3scIidDnKNs4mgwEvqYTw535zs6HAVa8A/9bOZzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761450011; c=relaxed/simple;
	bh=nxOuq98u/eFl6ANsBg9k2xTDfWUFLp9wIinx3J7dFyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lVH9s5gnlEDwsTJWNNikSeWWDZAwceAjar3Kx8hCpGT5Qa/zP7WollIilVjx2oEsJMFSS9xa7kb5dYqTNtctKc1pdySKGPo9HFwrLtNcsV3xYSokceWmyL3gywq4wURTXERLDWsIb7ENQapssIkzhoUqCmurMjNl3dhDeBJOYPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KF/TTOit; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KF/TTOit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761450009; x=1792986009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nxOuq98u/eFl6ANsBg9k2xTDfWUFLp9wIinx3J7dFyE=;
  b=KF/TTOitdDoZTuMFAhFqovEDqUsF9t6hM8gvgSIyXoYR94jmvJk1idFc
   3lIPYq36psTP3pB9bSb5qaER+tbmBGa+Wh02kJKmx3xc03v7WNnZ86RYI
   FcR8r579fpUqZkbWwDnRizdciFvTcRijA/To2x3jWnl7TGor55aQVLlS1
   LVauQks1NMbzyRpcoTvYOTFWfzVc6gv1mUQNCIwq6QTkKohvm0Hhjm3yT
   7EzY1hdXCp3tFaJJbjMEF7S8C/XJ/5pmr6gLJQRJ4huxrukeyTwM9WMFk
   Ttg+jLPzZpLq+Iy/1O+UUepNcTsDhUDcFeHd20vIfYqWAmCSljsvfk1PT
   g==;
X-CSE-ConnectionGUID: OUUhVc/mTJindae3WZsOug==
X-CSE-MsgGUID: LRnN6ycGSICFkgTocfW/Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63464602"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="63464602"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 20:40:08 -0700
X-CSE-ConnectionGUID: gWNoY4hDTHSAbdIlbiZZaw==
X-CSE-MsgGUID: oZLRC5l1S2WsT23JMFbHfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="184448903"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Oct 2025 20:40:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCrbw-000FrX-2B;
	Sun, 26 Oct 2025 03:40:04 +0000
Date: Sun, 26 Oct 2025 11:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3139/4098]
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c:684 stmmac_mdio_register()
 error: buffer overflow 'new_bus->irq' 32 <= 32
Message-ID: <202510261112.6j13MJfI-lkp@intel.com>
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
TO: Heiner Kallweit <hkallweit1@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   72fb0170ef1f45addf726319c52a0562b6913707
commit: 4a107a0e836177359b861e9849a2a24ad35e9919 [3139/4098] net: stmmac: mdio: use phy_find_first to simplify stmmac_mdio_register
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: um-randconfig-r073-20251025 (https://download.01.org/0day-ci/archive/20251026/202510261112.6j13MJfI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510261112.6j13MJfI-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c:684 stmmac_mdio_register() error: buffer overflow 'new_bus->irq' 32 <= 32

vim +684 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c

6717746f33abcd drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Russell King (Oracle  2025-09-04  571) 
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  572  /**
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  573   * stmmac_mdio_register
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  574   * @ndev: net device structure
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  575   * Description: it registers the MII bus
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  576   */
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  577  int stmmac_mdio_register(struct net_device *ndev)
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  578  {
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  579  	int err = 0;
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  580  	struct mii_bus *new_bus;
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  581  	struct stmmac_priv *priv = netdev_priv(ndev);
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  582  	struct stmmac_mdio_bus_data *mdio_bus_data = priv->plat->mdio_bus_data;
a7657f128c279a drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Giuseppe CAVALLARO    2016-04-01  583  	struct device_node *mdio_node = priv->plat->mdio_node;
fbca164776e438 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Romain Perier         2017-08-10  584  	struct device *dev = ndev->dev.parent;
ab21cf920928a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Ong Boon Leong        2022-06-15  585  	struct fwnode_handle *fixed_node;
e80af2acdef73d drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Russell King (Oracle  2023-08-24  586) 	struct fwnode_handle *fwnode;
4a107a0e836177 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Heiner Kallweit       2025-10-18  587  	struct phy_device *phydev;
4a107a0e836177 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Heiner Kallweit       2025-10-18  588  	int max_addr;
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  589  
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  590  	if (!mdio_bus_data)
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  591  		return 0;
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  592  
661a868937a1cf drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Russell King (Oracle  2025-09-04  593) 	stmmac_mdio_bus_config(priv);
6717746f33abcd drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Russell King (Oracle  2025-09-04  594) 
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  595  	new_bus = mdiobus_alloc();
efd89b60a35d6a drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c LABBE Corentin        2017-02-08  596  	if (!new_bus)
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  597  		return -ENOMEM;
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  598  
e7f4dc3536a400 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Lunn           2016-01-06  599  	if (mdio_bus_data->irqs)
643d60bf575daa drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Marek Vasut           2016-05-26  600  		memcpy(new_bus->irq, mdio_bus_data->irqs, sizeof(new_bus->irq));
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  601  
90b9a5454fd2e6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Alessandro Rubini     2012-01-23  602  	new_bus->name = "stmmac";
6fc21117b791b6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2018-08-08  603  
6fc21117b791b6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2018-08-08  604  	if (priv->plat->has_xgmac) {
5b0a447efff5a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Lunn           2023-01-12  605  		new_bus->read = &stmmac_xgmac2_mdio_read_c22;
5b0a447efff5a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Lunn           2023-01-12  606  		new_bus->write = &stmmac_xgmac2_mdio_write_c22;
5b0a447efff5a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Lunn           2023-01-12  607  		new_bus->read_c45 = &stmmac_xgmac2_mdio_read_c45;
5b0a447efff5a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Lunn           2023-01-12  608  		new_bus->write_c45 = &stmmac_xgmac2_mdio_write_c45;
6fc21117b791b6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2018-08-08  609  
10857e6779054f drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Rohan G Thomas        2023-07-31  610  		if (priv->synopsys_id < DWXGMAC_CORE_2_20) {
6fc21117b791b6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2018-08-08  611  			/* Right now only C22 phys are supported */
6fc21117b791b6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2018-08-08  612  			max_addr = MII_XGMAC_MAX_C22ADDR + 1;
6fc21117b791b6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2018-08-08  613  
6fc21117b791b6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2018-08-08  614  			/* Check if DT specified an unsupported phy addr */
6fc21117b791b6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2018-08-08  615  			if (priv->plat->phy_addr > MII_XGMAC_MAX_C22ADDR)
6fc21117b791b6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2018-08-08  616  				dev_err(dev, "Unsupported phy_addr (max=%d)\n",
6fc21117b791b6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2018-08-08  617  					MII_XGMAC_MAX_C22ADDR);
10857e6779054f drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Rohan G Thomas        2023-07-31  618  		} else {
10857e6779054f drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Rohan G Thomas        2023-07-31  619  			/* XGMAC version 2.20 onwards support 32 phy addr */
10857e6779054f drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Rohan G Thomas        2023-07-31  620  			max_addr = PHY_MAX_ADDR;
10857e6779054f drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Rohan G Thomas        2023-07-31  621  		}
6fc21117b791b6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2018-08-08  622  	} else {
3c7826d0b1066b drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Lunn           2023-01-12  623  		new_bus->read = &stmmac_mdio_read_c22;
3c7826d0b1066b drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Lunn           2023-01-12  624  		new_bus->write = &stmmac_mdio_write_c22;
3c7826d0b1066b drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Lunn           2023-01-12  625  		if (priv->plat->has_gmac4) {
3c7826d0b1066b drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Lunn           2023-01-12  626  			new_bus->read_c45 = &stmmac_mdio_read_c45;
3c7826d0b1066b drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Lunn           2023-01-12  627  			new_bus->write_c45 = &stmmac_mdio_write_c45;
3c7826d0b1066b drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Lunn           2023-01-12  628  		}
3c7826d0b1066b drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Lunn           2023-01-12  629  
6fc21117b791b6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2018-08-08  630  		max_addr = PHY_MAX_ADDR;
6fc21117b791b6 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2018-08-08  631  	}
ac1f74a7fc1976 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Alexandre TORGUE      2016-04-28  632  
1a981c0586c038 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Thierry Reding        2019-07-26  633  	if (mdio_bus_data->needs_reset)
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  634  		new_bus->reset = &stmmac_mdio_reset;
1a981c0586c038 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Thierry Reding        2019-07-26  635  
db8857bf5bd888 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Florian Fainelli      2012-01-09  636  	snprintf(new_bus->id, MII_BUS_ID_SIZE, "%s-%x",
d56631a66c0d0c drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Srinivas Kandagatla   2012-08-30  637  		 new_bus->name, priv->plat->bus_id);
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  638  	new_bus->priv = ndev;
351066bad6ade5 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Serge Semin           2024-07-01  639  	new_bus->phy_mask = mdio_bus_data->phy_mask | mdio_bus_data->pcs_mask;
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  640  	new_bus->parent = priv->device;
e34d65696d2ef1 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Phil Reid             2015-12-14  641  
e34d65696d2ef1 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Phil Reid             2015-12-14  642  	err = of_mdiobus_register(new_bus, mdio_node);
e23c0d21ce9234 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Halaney        2023-12-12  643  	if (err == -ENODEV) {
e23c0d21ce9234 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Halaney        2023-12-12  644  		err = 0;
e23c0d21ce9234 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Halaney        2023-12-12  645  		dev_info(dev, "MDIO bus is disabled\n");
e23c0d21ce9234 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Halaney        2023-12-12  646  		goto bus_register_fail;
e23c0d21ce9234 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Halaney        2023-12-12  647  	} else if (err) {
839612d23ffd93 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Rasmus Villemoes      2022-06-02  648  		dev_err_probe(dev, err, "Cannot register the MDIO bus\n");
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  649  		goto bus_register_fail;
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  650  	}
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  651  
04d1190aca7747 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2019-11-11  652  	/* Looks like we need a dummy read for XGMAC only and C45 PHYs */
04d1190aca7747 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2019-11-11  653  	if (priv->plat->has_xgmac)
5b0a447efff5a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Andrew Lunn           2023-01-12  654  		stmmac_xgmac2_mdio_read_c45(new_bus, 0, 0, 0);
04d1190aca7747 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Jose Abreu            2019-11-11  655  
ab21cf920928a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Ong Boon Leong        2022-06-15  656  	/* If fixed-link is set, skip PHY scanning */
e80af2acdef73d drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Russell King (Oracle  2023-08-24  657) 	fwnode = priv->plat->port_node;
ab21cf920928a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Ong Boon Leong        2022-06-15  658  	if (!fwnode)
ab21cf920928a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Ong Boon Leong        2022-06-15  659  		fwnode = dev_fwnode(priv->device);
ab21cf920928a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Ong Boon Leong        2022-06-15  660  
ab21cf920928a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Ong Boon Leong        2022-06-15  661  	if (fwnode) {
ab21cf920928a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Ong Boon Leong        2022-06-15  662  		fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
ab21cf920928a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Ong Boon Leong        2022-06-15  663  		if (fixed_node) {
ab21cf920928a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Ong Boon Leong        2022-06-15  664  			fwnode_handle_put(fixed_node);
ab21cf920928a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Ong Boon Leong        2022-06-15  665  			goto bus_register_done;
ab21cf920928a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Ong Boon Leong        2022-06-15  666  		}
ab21cf920928a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Ong Boon Leong        2022-06-15  667  	}
ab21cf920928a7 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Ong Boon Leong        2022-06-15  668  
cc2fa619a738a0 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Phil Reid             2016-03-15  669  	if (priv->plat->phy_node || mdio_node)
cc2fa619a738a0 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Phil Reid             2016-03-15  670  		goto bus_register_done;
cc2fa619a738a0 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Phil Reid             2016-03-15  671  
4a107a0e836177 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Heiner Kallweit       2025-10-18  672  	phydev = phy_find_first(new_bus);
4a107a0e836177 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Heiner Kallweit       2025-10-18  673  	if (!phydev || phydev->mdio.addr > max_addr) {
4a107a0e836177 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Heiner Kallweit       2025-10-18  674  		dev_warn(dev, "No PHY found\n");
4a107a0e836177 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Heiner Kallweit       2025-10-18  675  		err = -ENODEV;
4a107a0e836177 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Heiner Kallweit       2025-10-18  676  		goto no_phy_found;
4a107a0e836177 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Heiner Kallweit       2025-10-18  677  	}
cc26dc67b69a73 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c LABBE Corentin        2017-02-15  678  
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  679  	/*
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  680  	 * If an IRQ was provided to be assigned after
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  681  	 * the bus probe, do it here.
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  682  	 */
4a107a0e836177 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Heiner Kallweit       2025-10-18  683  	if (!mdio_bus_data->irqs && mdio_bus_data->probed_phy_irq > 0) {
4a107a0e836177 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Heiner Kallweit       2025-10-18 @684  		new_bus->irq[phydev->mdio.addr] = mdio_bus_data->probed_phy_irq;
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  685  		phydev->irq = mdio_bus_data->probed_phy_irq;
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  686  	}
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  687  
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  688  	/*
4a107a0e836177 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Heiner Kallweit       2025-10-18  689  	 * If we're going to bind the MAC to this PHY bus, and no PHY number
4a107a0e836177 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Heiner Kallweit       2025-10-18  690  	 * was provided to the MAC, use the one probed here.
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  691  	 */
d56631a66c0d0c drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Srinivas Kandagatla   2012-08-30  692  	if (priv->plat->phy_addr == -1)
4a107a0e836177 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Heiner Kallweit       2025-10-18  693  		priv->plat->phy_addr = phydev->mdio.addr;
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  694  
fbca164776e438 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Romain Perier         2017-08-10  695  	phy_attached_info(phydev);
4751d2aa321f28 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Vladimir Oltean       2021-05-27  696  
cc2fa619a738a0 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Phil Reid             2016-03-15  697  bus_register_done:
3955b22b9798ae drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Giuseppe CAVALLARO    2013-02-06  698  	priv->mii = new_bus;
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  699  
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  700  	return 0;
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  701  
4751d2aa321f28 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Vladimir Oltean       2021-05-27  702  no_phy_found:
4751d2aa321f28 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c Vladimir Oltean       2021-05-27  703  	mdiobus_unregister(new_bus);
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  704  bus_register_fail:
36bcfe7d74782c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe CAVALLARO    2011-07-20  705  	mdiobus_free(new_bus);
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  706  	return err;
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  707  }
47dd7a540b8a0c drivers/net/stmmac/stmmac_mdio.c                  Giuseppe Cavallaro    2009-10-14  708  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
