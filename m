Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E3A3B2FD8
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071140; cv=none; b=rJzhqC5e4PX0wLOTa9DDDM7cIhygttPgtZ1Pe5U9tki2HH6kN61RnNar/oa7w3DQjBib8bOHTRb05iKXWk09cKqUfsMGm+dIEIZnbaUFA60jQtu7Ycr6SUuYWE6q+6D2HFyVR/DKVD946Zu7uCYubEc+VO7JMbW3Ac76l3uiqAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071140; c=relaxed/simple;
	bh=Wdr4H/YcPvwslE1qCSFj84KWtKZym+ek2+X0kTSZlRo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VDsm8v6zioyr7+vr1x9VsMMwC0KXfEy0+x4Oa/+Fjyl0JmTUQz5sAqKVDvfUHJR7WfpvNsM6Aqfg5FRH+l4F/g72ljVL6RQWj/UTou83HDrYVBCSnl/2dEO91/qo6K7rHcwvbv4kylHs/jmdJUFqmcyFBlf4l+QUT8FJtDKIXyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9YmRbFt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9YmRbFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783071139; x=1814607139;
  h=date:from:to:cc:subject:message-id;
  bh=Wdr4H/YcPvwslE1qCSFj84KWtKZym+ek2+X0kTSZlRo=;
  b=A9YmRbFtfyKxwGDIqrGta0XbLUUVN6ijyaVUIvT0yhZcE1YifzWM2W3b
   0vR2wK2C8phI9cxo+IfdMc3ZVbjsr2RpEqQZGBGA9sC9EQwDseg9rlzwo
   HMDIkNqHC5aIBYJJIFTRtxsbZJ5zYbgACh5k8JdexnsLAthTIGc2u9jjB
   eoYcdIM0hvLvIjkLeJ9zACYyTqOhvr+Ovia9XDnhd/+GB+Ig8tSLfF/my
   4RDCcUL7kq438pddFE9SWj/trcI/l+mOZ/nZZ776AButPtHaF0pmZh7zZ
   LntVRpy7gJguaUYy2sr5g+oql1cOhia8Cbzw3JlneH7WpbtOw5slmiZm2
   A==;
X-CSE-ConnectionGUID: OELBYh1dSIGg/AMwP+buyQ==
X-CSE-MsgGUID: Tu3hNpVbSmS1rPpilHmwwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95330020"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95330020"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 02:32:13 -0700
X-CSE-ConnectionGUID: b/Sa6sxKRayVdOC/LEoUQg==
X-CSE-MsgGUID: U8BVhDSYT+KBdchq1jEr7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="257960543"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jul 2026 02:32:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfaFl-00000000BvT-0XDc;
	Fri, 03 Jul 2026 09:32:09 +0000
Date: Fri, 03 Jul 2026 17:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3945
 stmmac_request_irq_multi_msi() warn: 'msi->sfty_ce_irq' from request_irq()
 not released on lines: 3945.
Message-ID: <202607031720.dbSTTpYt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Florian Bezdeka <florian.bezdeka@siemens.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2c9a99135da931377240942d44f3dea104cedb8
commit: dab177cbea3491354cc3c0b268602d8902501233 net: stmmac: move MSI data out of struct stmmac_priv
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: m68k-randconfig-r072-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031720.dbSTTpYt-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dab177cbea34 ("net: stmmac: move MSI data out of struct stmmac_priv")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031720.dbSTTpYt-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3945 stmmac_request_irq_multi_msi() warn: 'msi->sfty_ce_irq' from request_irq() not released on lines: 3945.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3945 stmmac_request_irq_multi_msi() warn: 'msi->sfty_ue_irq' from request_irq() not released on lines: 3945.

Old smatch warnings:
arch/m68k/include/asm/io_no.h:50 __cf_internalio() warn: always true condition '(addr <= 3758096384 + 536870912 - 1) => (0-u32max <= u32max)'
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
