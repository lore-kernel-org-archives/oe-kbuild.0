Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE704134B2
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 19:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aipo7ycP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702234865; x=1733770865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vvVLzBD/2amChUXI6EyY/XKcw+XieQ2/ZF4Mwj/1CNQ=;
  b=Aipo7ycPIA+t7hp1Kle4wrqCBPbOAl4EDTy5EwItHOddl1mD1tuwGLW2
   ZL5+aWwmSvWN/IGSuaA5w/VjOF2AR4w9RuJMmo+vsvHdcpYmEuINyFWz5
   cJttDtWdlKXaYcrLLA72d60ClAv2yPXYUlLduWpmMumvloYjWT0zzJxgu
   2GAUO2XdIw52cPue9fiXU9sDa9+qHOxZcnlNbE1z+aDbf4VOulyXdCK7T
   S3rheSoW6//I93qYZUyMz+p56fZ4cpyrlLCJqSh9pQgwGtVkBLmd3IjEx
   Ig3opWRrULTl7PyDhSACW3+8Fcdw4OnIOPvGlysyxtVY3ZnNbVTbpcBDe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="391737887"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="391737887"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 11:01:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="946039480"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="946039480"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 10 Dec 2023 11:01:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCP2y-000HBy-1Z;
	Sun, 10 Dec 2023 19:01:00 +0000
Date: Mon, 11 Dec 2023 03:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3205
 stmmac_request_irq_multi_msi() warn: 'dev->irq' from request_irq() not
 released on lines: 3205.
Message-ID: <202312110242.soCEjWTs-lkp@intel.com>
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
TO: Ong Boon Leong <boon.leong.ong@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: 5fabb01207a2d3439a6abe1d08640de9c942945f net: stmmac: Add initial XDP support
date:   2 years, 8 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 2 years, 8 months ago
config: i386-randconfig-141-20230929 (https://download.01.org/0day-ci/archive/20231211/202312110242.soCEjWTs-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312110242.soCEjWTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312110242.soCEjWTs-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3205 stmmac_request_irq_multi_msi() warn: 'dev->irq' from request_irq() not released on lines: 3205.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3205 stmmac_request_irq_multi_msi() warn: 'priv->lpi_irq' from request_irq() not released on lines: 3205.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3205 stmmac_request_irq_multi_msi() warn: 'priv->sfty_ce_irq' from request_irq() not released on lines: 3205.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3205 stmmac_request_irq_multi_msi() warn: 'priv->sfty_ue_irq' from request_irq() not released on lines: 3205.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3205 stmmac_request_irq_multi_msi() warn: 'priv->wol_irq' from request_irq() not released on lines: 3205.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3256 stmmac_request_irq_single() warn: 'dev->irq' from request_irq() not released on lines: 3235,3256.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3256 stmmac_request_irq_single() warn: 'priv->wol_irq' from request_irq() not released on lines: 3256.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4416 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4217 stmmac_xdp_run_prog() warn: passing zero to 'ERR_PTR'
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4428 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4446 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:6202 stmmac_resume() warn: 'priv->plat->clk_ptp_ref' from clk_prepare_enable() not released on lines: 6168.

vim +3205 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

8532f613bc78b6 Ong Boon Leong 2021-03-26  3059  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3060  static int stmmac_request_irq_multi_msi(struct net_device *dev)
8532f613bc78b6 Ong Boon Leong 2021-03-26  3061  {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3062  	enum request_irq_err irq_err = REQ_IRQ_ERR_NO;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3063  	struct stmmac_priv *priv = netdev_priv(dev);
8deec94c6040bb Ong Boon Leong 2021-04-01  3064  	cpumask_t cpu_mask;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3065  	int irq_idx = 0;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3066  	char *int_name;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3067  	int ret;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3068  	int i;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3069  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3070  	/* For common interrupt */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3071  	int_name = priv->int_name_mac;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3072  	sprintf(int_name, "%s:%s", dev->name, "mac");
8532f613bc78b6 Ong Boon Leong 2021-03-26  3073  	ret = request_irq(dev->irq, stmmac_mac_interrupt,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3074  			  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3075  	if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3076  		netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3077  			   "%s: alloc mac MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3078  			   __func__, dev->irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3079  		irq_err = REQ_IRQ_ERR_MAC;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3080  		goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3081  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3082  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3083  	/* Request the Wake IRQ in case of another line
8532f613bc78b6 Ong Boon Leong 2021-03-26  3084  	 * is used for WoL
8532f613bc78b6 Ong Boon Leong 2021-03-26  3085  	 */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3086  	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3087  		int_name = priv->int_name_wol;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3088  		sprintf(int_name, "%s:%s", dev->name, "wol");
8532f613bc78b6 Ong Boon Leong 2021-03-26  3089  		ret = request_irq(priv->wol_irq,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3090  				  stmmac_mac_interrupt,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3091  				  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3092  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3093  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3094  				   "%s: alloc wol MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3095  				   __func__, priv->wol_irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3096  			irq_err = REQ_IRQ_ERR_WOL;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3097  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3098  		}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3099  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3100  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3101  	/* Request the LPI IRQ in case of another line
8532f613bc78b6 Ong Boon Leong 2021-03-26  3102  	 * is used for LPI
8532f613bc78b6 Ong Boon Leong 2021-03-26  3103  	 */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3104  	if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3105  		int_name = priv->int_name_lpi;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3106  		sprintf(int_name, "%s:%s", dev->name, "lpi");
8532f613bc78b6 Ong Boon Leong 2021-03-26  3107  		ret = request_irq(priv->lpi_irq,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3108  				  stmmac_mac_interrupt,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3109  				  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3110  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3111  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3112  				   "%s: alloc lpi MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3113  				   __func__, priv->lpi_irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3114  			irq_err = REQ_IRQ_ERR_LPI;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3115  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3116  		}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3117  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3118  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3119  	/* Request the Safety Feature Correctible Error line in
8532f613bc78b6 Ong Boon Leong 2021-03-26  3120  	 * case of another line is used
8532f613bc78b6 Ong Boon Leong 2021-03-26  3121  	 */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3122  	if (priv->sfty_ce_irq > 0 && priv->sfty_ce_irq != dev->irq) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3123  		int_name = priv->int_name_sfty_ce;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3124  		sprintf(int_name, "%s:%s", dev->name, "safety-ce");
8532f613bc78b6 Ong Boon Leong 2021-03-26  3125  		ret = request_irq(priv->sfty_ce_irq,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3126  				  stmmac_safety_interrupt,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3127  				  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3128  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3129  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3130  				   "%s: alloc sfty ce MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3131  				   __func__, priv->sfty_ce_irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3132  			irq_err = REQ_IRQ_ERR_SFTY_CE;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3133  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3134  		}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3135  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3136  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3137  	/* Request the Safety Feature Uncorrectible Error line in
8532f613bc78b6 Ong Boon Leong 2021-03-26  3138  	 * case of another line is used
8532f613bc78b6 Ong Boon Leong 2021-03-26  3139  	 */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3140  	if (priv->sfty_ue_irq > 0 && priv->sfty_ue_irq != dev->irq) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3141  		int_name = priv->int_name_sfty_ue;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3142  		sprintf(int_name, "%s:%s", dev->name, "safety-ue");
8532f613bc78b6 Ong Boon Leong 2021-03-26  3143  		ret = request_irq(priv->sfty_ue_irq,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3144  				  stmmac_safety_interrupt,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3145  				  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3146  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3147  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3148  				   "%s: alloc sfty ue MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3149  				   __func__, priv->sfty_ue_irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3150  			irq_err = REQ_IRQ_ERR_SFTY_UE;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3151  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3152  		}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3153  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3154  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3155  	/* Request Rx MSI irq */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3156  	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3157  		if (priv->rx_irq[i] == 0)
8532f613bc78b6 Ong Boon Leong 2021-03-26  3158  			continue;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3159  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3160  		int_name = priv->int_name_rx_irq[i];
8532f613bc78b6 Ong Boon Leong 2021-03-26  3161  		sprintf(int_name, "%s:%s-%d", dev->name, "rx", i);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3162  		ret = request_irq(priv->rx_irq[i],
8532f613bc78b6 Ong Boon Leong 2021-03-26  3163  				  stmmac_msi_intr_rx,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3164  				  0, int_name, &priv->rx_queue[i]);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3165  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3166  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3167  				   "%s: alloc rx-%d  MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3168  				   __func__, i, priv->rx_irq[i], ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3169  			irq_err = REQ_IRQ_ERR_RX;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3170  			irq_idx = i;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3171  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3172  		}
8deec94c6040bb Ong Boon Leong 2021-04-01  3173  		cpumask_clear(&cpu_mask);
8deec94c6040bb Ong Boon Leong 2021-04-01  3174  		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
8deec94c6040bb Ong Boon Leong 2021-04-01  3175  		irq_set_affinity_hint(priv->rx_irq[i], &cpu_mask);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3176  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3177  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3178  	/* Request Tx MSI irq */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3179  	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3180  		if (priv->tx_irq[i] == 0)
8532f613bc78b6 Ong Boon Leong 2021-03-26  3181  			continue;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3182  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3183  		int_name = priv->int_name_tx_irq[i];
8532f613bc78b6 Ong Boon Leong 2021-03-26  3184  		sprintf(int_name, "%s:%s-%d", dev->name, "tx", i);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3185  		ret = request_irq(priv->tx_irq[i],
8532f613bc78b6 Ong Boon Leong 2021-03-26  3186  				  stmmac_msi_intr_tx,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3187  				  0, int_name, &priv->tx_queue[i]);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3188  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3189  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3190  				   "%s: alloc tx-%d  MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3191  				   __func__, i, priv->tx_irq[i], ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3192  			irq_err = REQ_IRQ_ERR_TX;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3193  			irq_idx = i;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3194  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3195  		}
8deec94c6040bb Ong Boon Leong 2021-04-01  3196  		cpumask_clear(&cpu_mask);
8deec94c6040bb Ong Boon Leong 2021-04-01  3197  		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
8deec94c6040bb Ong Boon Leong 2021-04-01  3198  		irq_set_affinity_hint(priv->tx_irq[i], &cpu_mask);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3199  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3200  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3201  	return 0;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3202  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3203  irq_error:
8532f613bc78b6 Ong Boon Leong 2021-03-26  3204  	stmmac_free_irq(dev, irq_err, irq_idx);
8532f613bc78b6 Ong Boon Leong 2021-03-26 @3205  	return ret;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3206  }
8532f613bc78b6 Ong Boon Leong 2021-03-26  3207  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3208  static int stmmac_request_irq_single(struct net_device *dev)
8532f613bc78b6 Ong Boon Leong 2021-03-26  3209  {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3210  	enum request_irq_err irq_err = REQ_IRQ_ERR_NO;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3211  	struct stmmac_priv *priv = netdev_priv(dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3212  	int ret;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3213  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3214  	ret = request_irq(dev->irq, stmmac_interrupt,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3215  			  IRQF_SHARED, dev->name, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3216  	if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3217  		netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3218  			   "%s: ERROR: allocating the IRQ %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3219  			   __func__, dev->irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3220  		irq_err = REQ_IRQ_ERR_MAC;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3221  		return ret;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3222  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3223  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3224  	/* Request the Wake IRQ in case of another line
8532f613bc78b6 Ong Boon Leong 2021-03-26  3225  	 * is used for WoL
8532f613bc78b6 Ong Boon Leong 2021-03-26  3226  	 */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3227  	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3228  		ret = request_irq(priv->wol_irq, stmmac_interrupt,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3229  				  IRQF_SHARED, dev->name, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3230  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3231  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3232  				   "%s: ERROR: allocating the WoL IRQ %d (%d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3233  				   __func__, priv->wol_irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3234  			irq_err = REQ_IRQ_ERR_WOL;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3235  			return ret;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3236  		}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3237  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3238  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3239  	/* Request the IRQ lines */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3240  	if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3241  		ret = request_irq(priv->lpi_irq, stmmac_interrupt,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3242  				  IRQF_SHARED, dev->name, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3243  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3244  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3245  				   "%s: ERROR: allocating the LPI IRQ %d (%d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3246  				   __func__, priv->lpi_irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3247  			irq_err = REQ_IRQ_ERR_LPI;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3248  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3249  		}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3250  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3251  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3252  	return 0;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3253  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3254  irq_error:
8532f613bc78b6 Ong Boon Leong 2021-03-26  3255  	stmmac_free_irq(dev, irq_err, 0);
8532f613bc78b6 Ong Boon Leong 2021-03-26 @3256  	return ret;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3257  }
8532f613bc78b6 Ong Boon Leong 2021-03-26  3258  

:::::: The code at line 3205 was first introduced by commit
:::::: 8532f613bc78b6e0e32b486e720848d3f5569287 net: stmmac: introduce MSI Interrupt routines for mac, safety, RX & TX

:::::: TO: Ong Boon Leong <boon.leong.ong@intel.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
