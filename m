Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA12568B6E
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 17:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTDczlNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701797719; x=1733333719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dmCjJa2pjLexauFgFrVNCuGzvP8sSeVf+q77GUCR+yo=;
  b=PTDczlNxSxm1JVUXr9A9c/wPVvjTvoa+A1qXHlZvtWoadwndh8de5m5S
   1paJ2f2PVvynoHbnQEX426DVgM1H2cGzgUSFQZN+TUQsbwxiO+r6TIoWz
   q4i2wDZrCB2ARkQ0BftPUPkONdyC5MW64awF4Ew06KIEcyFe0IuWT2V1C
   4nkmI3zbiGEOcPRuNvlyfQBSxHRRqY4JMSu48D34rCa1N1q0aNgCuRzRp
   RUmnvcVawr5K8aPj20F67Vm0H3ll3714HSm7BnYI7/uwCAoqBlh13vXsT
   tuX8o9tykqD20AlHn3zXbZZUPULnv8zmCmcwW+PFfwPupnIWL6aYDYSMl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771095"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="771095"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 09:35:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841550415"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="841550415"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 09:35:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAZK5-0009SU-0e;
	Tue, 05 Dec 2023 17:35:05 +0000
Date: Wed, 6 Dec 2023 01:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] [net/ethernet] arc_emac: Add error handling in
 emac_rockchip_probe
Message-ID: <202312060119.eRpB9j4s-lkp@intel.com>
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
In-Reply-To: <20231130031318.35850-1-liuhaoran14@163.com>
References: <20231130031318.35850-1-liuhaoran14@163.com>
TO: Haoran Liu <liuhaoran14@163.com>
TO: davem@davemloft.net
CC: edumazet@google.com
CC: pabeni@redhat.com
CC: heiko@sntech.de
CC: netdev@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Haoran Liu <liuhaoran14@163.com>

Hi Haoran,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haoran-Liu/arc_emac-Add-error-handling-in-emac_rockchip_probe/20231130-112325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20231130031318.35850-1-liuhaoran14%40163.com
patch subject: [PATCH] [net/ethernet] arc_emac: Add error handling in emac_rockchip_probe
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: csky-randconfig-r071-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060119.eRpB9j4s-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060119.eRpB9j4s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312060119.eRpB9j4s-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/arc/emac_rockchip.c:139 emac_rockchip_probe() warn: missing unwind goto?
drivers/net/ethernet/arc/emac_rockchip.c:249 emac_rockchip_probe() warn: 'ndev' from alloc_etherdev_mqs() not released on lines: 139.

vim +139 drivers/net/ethernet/arc/emac_rockchip.c

6eacf31139bf96 Romain Perier      2014-09-08   92  
6eacf31139bf96 Romain Perier      2014-09-08   93  static int emac_rockchip_probe(struct platform_device *pdev)
6eacf31139bf96 Romain Perier      2014-09-08   94  {
6eacf31139bf96 Romain Perier      2014-09-08   95  	struct device *dev = &pdev->dev;
6eacf31139bf96 Romain Perier      2014-09-08   96  	struct net_device *ndev;
6eacf31139bf96 Romain Perier      2014-09-08   97  	struct rockchip_priv_data *priv;
6eacf31139bf96 Romain Perier      2014-09-08   98  	const struct of_device_id *match;
0c65b2b90d13c1 Andrew Lunn        2019-11-04   99  	phy_interface_t interface;
6eacf31139bf96 Romain Perier      2014-09-08  100  	u32 data;
0c65b2b90d13c1 Andrew Lunn        2019-11-04  101  	int err;
6eacf31139bf96 Romain Perier      2014-09-08  102  
6eacf31139bf96 Romain Perier      2014-09-08  103  	if (!pdev->dev.of_node)
6eacf31139bf96 Romain Perier      2014-09-08  104  		return -ENODEV;
6eacf31139bf96 Romain Perier      2014-09-08  105  
6eacf31139bf96 Romain Perier      2014-09-08  106  	ndev = alloc_etherdev(sizeof(struct rockchip_priv_data));
6eacf31139bf96 Romain Perier      2014-09-08  107  	if (!ndev)
6eacf31139bf96 Romain Perier      2014-09-08  108  		return -ENOMEM;
6eacf31139bf96 Romain Perier      2014-09-08  109  	platform_set_drvdata(pdev, ndev);
6eacf31139bf96 Romain Perier      2014-09-08  110  	SET_NETDEV_DEV(ndev, dev);
6eacf31139bf96 Romain Perier      2014-09-08  111  
6eacf31139bf96 Romain Perier      2014-09-08  112  	priv = netdev_priv(ndev);
6eacf31139bf96 Romain Perier      2014-09-08  113  	priv->emac.drv_name = DRV_NAME;
6eacf31139bf96 Romain Perier      2014-09-08  114  	priv->emac.set_mac_speed = emac_rockchip_set_mac_speed;
6eacf31139bf96 Romain Perier      2014-09-08  115  
0c65b2b90d13c1 Andrew Lunn        2019-11-04  116  	err = of_get_phy_mode(dev->of_node, &interface);
0c65b2b90d13c1 Andrew Lunn        2019-11-04  117  	if (err)
0c65b2b90d13c1 Andrew Lunn        2019-11-04  118  		goto out_netdev;
6eacf31139bf96 Romain Perier      2014-09-08  119  
af72261f33ee49 Xing Zheng         2016-01-08  120  	/* RK3036/RK3066/RK3188 SoCs only support RMII */
6eacf31139bf96 Romain Perier      2014-09-08  121  	if (interface != PHY_INTERFACE_MODE_RMII) {
6eacf31139bf96 Romain Perier      2014-09-08  122  		dev_err(dev, "unsupported phy interface mode %d\n", interface);
6eacf31139bf96 Romain Perier      2014-09-08  123  		err = -ENOTSUPP;
6eacf31139bf96 Romain Perier      2014-09-08  124  		goto out_netdev;
6eacf31139bf96 Romain Perier      2014-09-08  125  	}
6eacf31139bf96 Romain Perier      2014-09-08  126  
663713eb477b9b Caesar Wang        2016-03-14  127  	priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
663713eb477b9b Caesar Wang        2016-03-14  128  						    "rockchip,grf");
6eacf31139bf96 Romain Perier      2014-09-08  129  	if (IS_ERR(priv->grf)) {
663713eb477b9b Caesar Wang        2016-03-14  130  		dev_err(dev, "failed to retrieve global register file (%ld)\n",
663713eb477b9b Caesar Wang        2016-03-14  131  			PTR_ERR(priv->grf));
6eacf31139bf96 Romain Perier      2014-09-08  132  		err = PTR_ERR(priv->grf);
6eacf31139bf96 Romain Perier      2014-09-08  133  		goto out_netdev;
6eacf31139bf96 Romain Perier      2014-09-08  134  	}
6eacf31139bf96 Romain Perier      2014-09-08  135  
6eacf31139bf96 Romain Perier      2014-09-08  136  	match = of_match_node(emac_rockchip_dt_ids, dev->of_node);
8cb4cdab4b4030 Haoran Liu         2023-11-29  137  	if (!match) {
8cb4cdab4b4030 Haoran Liu         2023-11-29  138  		dev_err(dev, "No matching device found\n");
8cb4cdab4b4030 Haoran Liu         2023-11-29 @139  		return -ENODEV;
8cb4cdab4b4030 Haoran Liu         2023-11-29  140  	}
8cb4cdab4b4030 Haoran Liu         2023-11-29  141  
6eacf31139bf96 Romain Perier      2014-09-08  142  	priv->soc_data = match->data;
6eacf31139bf96 Romain Perier      2014-09-08  143  
6eacf31139bf96 Romain Perier      2014-09-08  144  	priv->emac.clk = devm_clk_get(dev, "hclk");
6eacf31139bf96 Romain Perier      2014-09-08  145  	if (IS_ERR(priv->emac.clk)) {
663713eb477b9b Caesar Wang        2016-03-14  146  		dev_err(dev, "failed to retrieve host clock (%ld)\n",
663713eb477b9b Caesar Wang        2016-03-14  147  			PTR_ERR(priv->emac.clk));
6eacf31139bf96 Romain Perier      2014-09-08  148  		err = PTR_ERR(priv->emac.clk);
6eacf31139bf96 Romain Perier      2014-09-08  149  		goto out_netdev;
6eacf31139bf96 Romain Perier      2014-09-08  150  	}
6eacf31139bf96 Romain Perier      2014-09-08  151  
6eacf31139bf96 Romain Perier      2014-09-08  152  	priv->refclk = devm_clk_get(dev, "macref");
6eacf31139bf96 Romain Perier      2014-09-08  153  	if (IS_ERR(priv->refclk)) {
663713eb477b9b Caesar Wang        2016-03-14  154  		dev_err(dev, "failed to retrieve reference clock (%ld)\n",
663713eb477b9b Caesar Wang        2016-03-14  155  			PTR_ERR(priv->refclk));
6eacf31139bf96 Romain Perier      2014-09-08  156  		err = PTR_ERR(priv->refclk);
6eacf31139bf96 Romain Perier      2014-09-08  157  		goto out_netdev;
6eacf31139bf96 Romain Perier      2014-09-08  158  	}
6eacf31139bf96 Romain Perier      2014-09-08  159  
6eacf31139bf96 Romain Perier      2014-09-08  160  	err = clk_prepare_enable(priv->refclk);
6eacf31139bf96 Romain Perier      2014-09-08  161  	if (err) {
6eacf31139bf96 Romain Perier      2014-09-08  162  		dev_err(dev, "failed to enable reference clock (%d)\n", err);
6eacf31139bf96 Romain Perier      2014-09-08  163  		goto out_netdev;
6eacf31139bf96 Romain Perier      2014-09-08  164  	}
6eacf31139bf96 Romain Perier      2014-09-08  165  
6eacf31139bf96 Romain Perier      2014-09-08  166  	/* Optional regulator for PHY */
6eacf31139bf96 Romain Perier      2014-09-08  167  	priv->regulator = devm_regulator_get_optional(dev, "phy");
6eacf31139bf96 Romain Perier      2014-09-08  168  	if (IS_ERR(priv->regulator)) {
00777fac28ba3e Christophe JAILLET 2018-03-18  169  		if (PTR_ERR(priv->regulator) == -EPROBE_DEFER) {
00777fac28ba3e Christophe JAILLET 2018-03-18  170  			err = -EPROBE_DEFER;
00777fac28ba3e Christophe JAILLET 2018-03-18  171  			goto out_clk_disable;
00777fac28ba3e Christophe JAILLET 2018-03-18  172  		}
6eacf31139bf96 Romain Perier      2014-09-08  173  		dev_err(dev, "no regulator found\n");
6eacf31139bf96 Romain Perier      2014-09-08  174  		priv->regulator = NULL;
6eacf31139bf96 Romain Perier      2014-09-08  175  	}
6eacf31139bf96 Romain Perier      2014-09-08  176  
6eacf31139bf96 Romain Perier      2014-09-08  177  	if (priv->regulator) {
6eacf31139bf96 Romain Perier      2014-09-08  178  		err = regulator_enable(priv->regulator);
6eacf31139bf96 Romain Perier      2014-09-08  179  		if (err) {
6eacf31139bf96 Romain Perier      2014-09-08  180  			dev_err(dev, "failed to enable phy-supply (%d)\n", err);
6eacf31139bf96 Romain Perier      2014-09-08  181  			goto out_clk_disable;
6eacf31139bf96 Romain Perier      2014-09-08  182  		}
6eacf31139bf96 Romain Perier      2014-09-08  183  	}
6eacf31139bf96 Romain Perier      2014-09-08  184  
f4c9d3ee0334fd Xing Zheng         2016-01-08  185  	/* Set speed 100M */
f4c9d3ee0334fd Xing Zheng         2016-01-08  186  	data = (1 << (priv->soc_data->grf_speed_offset + 16)) |
f4c9d3ee0334fd Xing Zheng         2016-01-08  187  	       (1 << priv->soc_data->grf_speed_offset);
f4c9d3ee0334fd Xing Zheng         2016-01-08  188  	/* Set RMII mode */
f4c9d3ee0334fd Xing Zheng         2016-01-08  189  	data |= (1 << (priv->soc_data->grf_mode_offset + 16)) |
f4c9d3ee0334fd Xing Zheng         2016-01-08  190  		(0 << priv->soc_data->grf_mode_offset);
6eacf31139bf96 Romain Perier      2014-09-08  191  
6eacf31139bf96 Romain Perier      2014-09-08  192  	err = regmap_write(priv->grf, priv->soc_data->grf_offset, data);
6eacf31139bf96 Romain Perier      2014-09-08  193  	if (err) {
663713eb477b9b Caesar Wang        2016-03-14  194  		dev_err(dev, "unable to apply initial settings to grf (%d)\n",
663713eb477b9b Caesar Wang        2016-03-14  195  			err);
6eacf31139bf96 Romain Perier      2014-09-08  196  		goto out_regulator_disable;
6eacf31139bf96 Romain Perier      2014-09-08  197  	}
6eacf31139bf96 Romain Perier      2014-09-08  198  
6eacf31139bf96 Romain Perier      2014-09-08  199  	/* RMII interface needs always a rate of 50MHz */
6eacf31139bf96 Romain Perier      2014-09-08  200  	err = clk_set_rate(priv->refclk, 50000000);
2a9ee696c72a24 Branislav Radocaj  2017-12-12  201  	if (err) {
663713eb477b9b Caesar Wang        2016-03-14  202  		dev_err(dev,
663713eb477b9b Caesar Wang        2016-03-14  203  			"failed to change reference clock rate (%d)\n", err);
2a9ee696c72a24 Branislav Radocaj  2017-12-12  204  		goto out_regulator_disable;
2a9ee696c72a24 Branislav Radocaj  2017-12-12  205  	}
c9bca2fe3ca6d6 Xing Zheng         2016-01-08  206  
f4c9d3ee0334fd Xing Zheng         2016-01-08  207  	if (priv->soc_data->need_div_macclk) {
f4c9d3ee0334fd Xing Zheng         2016-01-08  208  		priv->macclk = devm_clk_get(dev, "macclk");
f4c9d3ee0334fd Xing Zheng         2016-01-08  209  		if (IS_ERR(priv->macclk)) {
663713eb477b9b Caesar Wang        2016-03-14  210  			dev_err(dev, "failed to retrieve mac clock (%ld)\n",
663713eb477b9b Caesar Wang        2016-03-14  211  				PTR_ERR(priv->macclk));
f4c9d3ee0334fd Xing Zheng         2016-01-08  212  			err = PTR_ERR(priv->macclk);
f4c9d3ee0334fd Xing Zheng         2016-01-08  213  			goto out_regulator_disable;
f4c9d3ee0334fd Xing Zheng         2016-01-08  214  		}
f4c9d3ee0334fd Xing Zheng         2016-01-08  215  
f4c9d3ee0334fd Xing Zheng         2016-01-08  216  		err = clk_prepare_enable(priv->macclk);
f4c9d3ee0334fd Xing Zheng         2016-01-08  217  		if (err) {
f4c9d3ee0334fd Xing Zheng         2016-01-08  218  			dev_err(dev, "failed to enable mac clock (%d)\n", err);
f4c9d3ee0334fd Xing Zheng         2016-01-08  219  			goto out_regulator_disable;
f4c9d3ee0334fd Xing Zheng         2016-01-08  220  		}
f4c9d3ee0334fd Xing Zheng         2016-01-08  221  
f4c9d3ee0334fd Xing Zheng         2016-01-08  222  		/* RMII TX/RX needs always a rate of 25MHz */
f4c9d3ee0334fd Xing Zheng         2016-01-08  223  		err = clk_set_rate(priv->macclk, 25000000);
e46772a6946a7d Branislav Radocaj  2017-12-07  224  		if (err) {
663713eb477b9b Caesar Wang        2016-03-14  225  			dev_err(dev,
663713eb477b9b Caesar Wang        2016-03-14  226  				"failed to change mac clock rate (%d)\n", err);
e46772a6946a7d Branislav Radocaj  2017-12-07  227  			goto out_clk_disable_macclk;
e46772a6946a7d Branislav Radocaj  2017-12-07  228  		}
f4c9d3ee0334fd Xing Zheng         2016-01-08  229  	}
f4c9d3ee0334fd Xing Zheng         2016-01-08  230  
c9bca2fe3ca6d6 Xing Zheng         2016-01-08  231  	err = arc_emac_probe(ndev, interface);
c9bca2fe3ca6d6 Xing Zheng         2016-01-08  232  	if (err) {
c9bca2fe3ca6d6 Xing Zheng         2016-01-08  233  		dev_err(dev, "failed to probe arc emac (%d)\n", err);
2a9ee696c72a24 Branislav Radocaj  2017-12-12  234  		goto out_clk_disable_macclk;
c9bca2fe3ca6d6 Xing Zheng         2016-01-08  235  	}
c9bca2fe3ca6d6 Xing Zheng         2016-01-08  236  
6eacf31139bf96 Romain Perier      2014-09-08  237  	return 0;
2a9ee696c72a24 Branislav Radocaj  2017-12-12  238  
e46772a6946a7d Branislav Radocaj  2017-12-07  239  out_clk_disable_macclk:
2a9ee696c72a24 Branislav Radocaj  2017-12-12  240  	if (priv->soc_data->need_div_macclk)
e46772a6946a7d Branislav Radocaj  2017-12-07  241  		clk_disable_unprepare(priv->macclk);
6eacf31139bf96 Romain Perier      2014-09-08  242  out_regulator_disable:
6eacf31139bf96 Romain Perier      2014-09-08  243  	if (priv->regulator)
6eacf31139bf96 Romain Perier      2014-09-08  244  		regulator_disable(priv->regulator);
6eacf31139bf96 Romain Perier      2014-09-08  245  out_clk_disable:
6eacf31139bf96 Romain Perier      2014-09-08  246  	clk_disable_unprepare(priv->refclk);
6eacf31139bf96 Romain Perier      2014-09-08  247  out_netdev:
6eacf31139bf96 Romain Perier      2014-09-08  248  	free_netdev(ndev);
6eacf31139bf96 Romain Perier      2014-09-08 @249  	return err;
6eacf31139bf96 Romain Perier      2014-09-08  250  }
6eacf31139bf96 Romain Perier      2014-09-08  251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
