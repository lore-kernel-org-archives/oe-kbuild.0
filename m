Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873763A29B
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Feb 2024 15:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708788073; cv=none; b=A7aWRMVSqN7vcXYJoTVxCw7Awvn/iekyC7la/9O2yC/zIPwqxKBqUFRlFdV1C9tZZTUMi0jF/aQAmQpYAoxOF3he/4JqhzqMq0PmlwgC6uYYgXXHRE097culyrzqq5tSdxCIO1lOykavAC7KxgOPoWSPPg84VrlKuueHtocWZwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708788073; c=relaxed/simple;
	bh=ImtlZvz/utrPgAcfDRO1nvblCOdib7BHNmpeBPZJGoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iymEIWM0vO6sRk2PLJabq0zMYeay+9grHLsULbw9jL2k0h+1Xdcn0j4JRfbTMchBpOOu5550QhpEJP07UKww6GhcCgOd4x+0NChvMvqF7z8XmaklB+GpVE5uUoLBXiqHoTjPNUkkb2CkH7HpdVnYQ8G5rUm6arKCvKyLlD/T7uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vf8lZkWX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vf8lZkWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708788070; x=1740324070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ImtlZvz/utrPgAcfDRO1nvblCOdib7BHNmpeBPZJGoY=;
  b=Vf8lZkWXf34vp9v5sqkmtC0ola4UHV7popFxu0Z3X8rN5isgI27ygdVB
   yMGgFG/MeMRvSUYG0SNANpRo0Lp4nisXa8K8hCBAIw57PbYSoTxTH9niZ
   qylM7h8Ysi+oFO1X+Io2SkKK78quZtRjSg0TrLxYlEc7lNDgSPPj/27fL
   T5WLurCWINb1Bc56KaTKP/gQf43mMNOnqLRU/mUTJA1nXM9Sjn3AKw3RT
   hF2AUfMth+2VcCMVbMxehTnwdYrGor7nlx+8RjA08Da6p6fgjHG8FBtL5
   B1YKyjaHUMw1SoskvNCBnYm5HgdX1qAmtjBfyTRasLkgm6U9hpSuBttjh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3635271"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="3635271"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 07:21:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6637989"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Feb 2024 07:21:08 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdtpp-0008dM-1Q;
	Sat, 24 Feb 2024 15:21:05 +0000
Date: Sat, 24 Feb 2024 23:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/6] net: hisilicon: add support for hisi_femac core on
 Hi3798MV200
Message-ID: <202402242354.leEII4M9-lkp@intel.com>
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
In-Reply-To: <20240216-net-v1-1-e0ad972cda99@outlook.com>
References: <20240216-net-v1-1-e0ad972cda99@outlook.com>
TO: Yang Xiwen via B4 Relay <devnull+forbidden405.outlook.com@kernel.org>
TO: Yisen Zhuang <yisen.zhuang@huawei.com>
TO: Salil Mehta <salil.mehta@huawei.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Yang Xiwen <forbidden405@foxmail.com>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Heiner Kallweit <hkallweit1@gmail.com>
TO: Russell King <linux@armlinux.org.uk>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Yang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8d3dea210042f54b952b481838c1e7dfc4ec751d]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Xiwen-via-B4-Relay/net-hisilicon-add-support-for-hisi_femac-core-on-Hi3798MV200/20240216-075015
base:   8d3dea210042f54b952b481838c1e7dfc4ec751d
patch link:    https://lore.kernel.org/r/20240216-net-v1-1-e0ad972cda99%40outlook.com
patch subject: [PATCH 1/6] net: hisilicon: add support for hisi_femac core on Hi3798MV200
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-r081-20240223 (https://download.01.org/0day-ci/archive/20240224/202402242354.leEII4M9-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402242354.leEII4M9-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/hisilicon/hisi_femac.c:931 hisi_femac_drv_probe() error: uninitialized symbol 'ret'.

vim +/ret +931 drivers/net/ethernet/hisilicon/hisi_femac.c

542ae60af24f02 Dongpo Li      2016-07-15  785  
542ae60af24f02 Dongpo Li      2016-07-15  786  static int hisi_femac_drv_probe(struct platform_device *pdev)
542ae60af24f02 Dongpo Li      2016-07-15  787  {
542ae60af24f02 Dongpo Li      2016-07-15  788  	struct device *dev = &pdev->dev;
3c2c758a1607ea Yang Xiwen     2024-02-16  789  	struct device_node *node = dev->of_node, *mdio_np;
542ae60af24f02 Dongpo Li      2016-07-15  790  	struct net_device *ndev;
542ae60af24f02 Dongpo Li      2016-07-15  791  	struct hisi_femac_priv *priv;
542ae60af24f02 Dongpo Li      2016-07-15  792  	struct phy_device *phy;
3c2c758a1607ea Yang Xiwen     2024-02-16  793  	int ret, i;
3c2c758a1607ea Yang Xiwen     2024-02-16  794  	bool mdio_registered = false;
3c2c758a1607ea Yang Xiwen     2024-02-16  795  	static const char * const clk_strs[] = {
3c2c758a1607ea Yang Xiwen     2024-02-16  796  		[CLK_MAC] = "mac",
3c2c758a1607ea Yang Xiwen     2024-02-16  797  		[CLK_BUS] = "bus",
3c2c758a1607ea Yang Xiwen     2024-02-16  798  		[CLK_PHY] = "phy",
3c2c758a1607ea Yang Xiwen     2024-02-16  799  	};
542ae60af24f02 Dongpo Li      2016-07-15  800  
542ae60af24f02 Dongpo Li      2016-07-15  801  	ndev = alloc_etherdev(sizeof(*priv));
542ae60af24f02 Dongpo Li      2016-07-15  802  	if (!ndev)
542ae60af24f02 Dongpo Li      2016-07-15  803  		return -ENOMEM;
542ae60af24f02 Dongpo Li      2016-07-15  804  
542ae60af24f02 Dongpo Li      2016-07-15  805  	platform_set_drvdata(pdev, ndev);
2087d421a5a1af Dongpo Li      2016-12-12  806  	SET_NETDEV_DEV(ndev, &pdev->dev);
542ae60af24f02 Dongpo Li      2016-07-15  807  
542ae60af24f02 Dongpo Li      2016-07-15  808  	priv = netdev_priv(ndev);
542ae60af24f02 Dongpo Li      2016-07-15  809  	priv->dev = dev;
542ae60af24f02 Dongpo Li      2016-07-15  810  	priv->ndev = ndev;
542ae60af24f02 Dongpo Li      2016-07-15  811  
56170ba3bd9098 Jiangfeng Xiao 2019-07-12  812  	priv->port_base = devm_platform_ioremap_resource(pdev, 0);
542ae60af24f02 Dongpo Li      2016-07-15  813  	if (IS_ERR(priv->port_base)) {
542ae60af24f02 Dongpo Li      2016-07-15  814  		ret = PTR_ERR(priv->port_base);
542ae60af24f02 Dongpo Li      2016-07-15  815  		goto out_free_netdev;
542ae60af24f02 Dongpo Li      2016-07-15  816  	}
542ae60af24f02 Dongpo Li      2016-07-15  817  
56170ba3bd9098 Jiangfeng Xiao 2019-07-12  818  	priv->glb_base = devm_platform_ioremap_resource(pdev, 1);
542ae60af24f02 Dongpo Li      2016-07-15  819  	if (IS_ERR(priv->glb_base)) {
542ae60af24f02 Dongpo Li      2016-07-15  820  		ret = PTR_ERR(priv->glb_base);
542ae60af24f02 Dongpo Li      2016-07-15  821  		goto out_free_netdev;
542ae60af24f02 Dongpo Li      2016-07-15  822  	}
542ae60af24f02 Dongpo Li      2016-07-15  823  
3c2c758a1607ea Yang Xiwen     2024-02-16  824  	for (i = 0; i < CLK_NUM; i++) {
3c2c758a1607ea Yang Xiwen     2024-02-16  825  		priv->clks[i] = devm_clk_get_enabled(&pdev->dev, clk_strs[i]);
3c2c758a1607ea Yang Xiwen     2024-02-16  826  		if (IS_ERR(priv->clks[i])) {
3c2c758a1607ea Yang Xiwen     2024-02-16  827  			dev_err(dev, "failed to get enabled clk %s: %ld\n", clk_strs[i],
3c2c758a1607ea Yang Xiwen     2024-02-16  828  				PTR_ERR(priv->clks[i]));
542ae60af24f02 Dongpo Li      2016-07-15  829  			ret = -ENODEV;
542ae60af24f02 Dongpo Li      2016-07-15  830  			goto out_free_netdev;
542ae60af24f02 Dongpo Li      2016-07-15  831  		}
542ae60af24f02 Dongpo Li      2016-07-15  832  	}
542ae60af24f02 Dongpo Li      2016-07-15  833  
542ae60af24f02 Dongpo Li      2016-07-15  834  	priv->mac_rst = devm_reset_control_get(dev, "mac");
542ae60af24f02 Dongpo Li      2016-07-15  835  	if (IS_ERR(priv->mac_rst)) {
542ae60af24f02 Dongpo Li      2016-07-15  836  		ret = PTR_ERR(priv->mac_rst);
3c2c758a1607ea Yang Xiwen     2024-02-16  837  		goto out_free_netdev;
542ae60af24f02 Dongpo Li      2016-07-15  838  	}
542ae60af24f02 Dongpo Li      2016-07-15  839  	hisi_femac_core_reset(priv);
542ae60af24f02 Dongpo Li      2016-07-15  840  
542ae60af24f02 Dongpo Li      2016-07-15  841  	priv->phy_rst = devm_reset_control_get(dev, "phy");
542ae60af24f02 Dongpo Li      2016-07-15  842  	if (IS_ERR(priv->phy_rst)) {
542ae60af24f02 Dongpo Li      2016-07-15  843  		priv->phy_rst = NULL;
542ae60af24f02 Dongpo Li      2016-07-15  844  	} else {
542ae60af24f02 Dongpo Li      2016-07-15  845  		ret = of_property_read_u32_array(node,
542ae60af24f02 Dongpo Li      2016-07-15  846  						 PHY_RESET_DELAYS_PROPERTY,
542ae60af24f02 Dongpo Li      2016-07-15  847  						 priv->phy_reset_delays,
542ae60af24f02 Dongpo Li      2016-07-15  848  						 DELAYS_NUM);
542ae60af24f02 Dongpo Li      2016-07-15  849  		if (ret)
3c2c758a1607ea Yang Xiwen     2024-02-16  850  			goto out_free_netdev;
542ae60af24f02 Dongpo Li      2016-07-15  851  		hisi_femac_phy_reset(priv);
542ae60af24f02 Dongpo Li      2016-07-15  852  	}
542ae60af24f02 Dongpo Li      2016-07-15  853  
3c2c758a1607ea Yang Xiwen     2024-02-16  854  	// Register the optional MDIO bus
3c2c758a1607ea Yang Xiwen     2024-02-16  855  	for_each_available_child_of_node(node, mdio_np) {
3c2c758a1607ea Yang Xiwen     2024-02-16  856  		if (of_node_name_prefix(mdio_np, "mdio")) {
3c2c758a1607ea Yang Xiwen     2024-02-16  857  			priv->mdio_pdev = of_platform_device_create(mdio_np, NULL, dev);
3c2c758a1607ea Yang Xiwen     2024-02-16  858  			of_node_put(mdio_np);
3c2c758a1607ea Yang Xiwen     2024-02-16  859  			if (!priv->mdio_pdev) {
3c2c758a1607ea Yang Xiwen     2024-02-16  860  				dev_err(dev, "failed to register MDIO bus device\n");
3c2c758a1607ea Yang Xiwen     2024-02-16  861  				goto out_free_netdev;
3c2c758a1607ea Yang Xiwen     2024-02-16  862  			}
3c2c758a1607ea Yang Xiwen     2024-02-16  863  			mdio_registered = true;
3c2c758a1607ea Yang Xiwen     2024-02-16  864  			break;
3c2c758a1607ea Yang Xiwen     2024-02-16  865  		}
3c2c758a1607ea Yang Xiwen     2024-02-16  866  	}
3c2c758a1607ea Yang Xiwen     2024-02-16  867  
3c2c758a1607ea Yang Xiwen     2024-02-16  868  	if (!mdio_registered)
3c2c758a1607ea Yang Xiwen     2024-02-16  869  		dev_warn(dev, "MDIO subnode notfound. This is usually a bug.\n");
3c2c758a1607ea Yang Xiwen     2024-02-16  870  
542ae60af24f02 Dongpo Li      2016-07-15  871  	phy = of_phy_get_and_connect(ndev, node, hisi_femac_adjust_link);
542ae60af24f02 Dongpo Li      2016-07-15  872  	if (!phy) {
542ae60af24f02 Dongpo Li      2016-07-15  873  		dev_err(dev, "connect to PHY failed!\n");
542ae60af24f02 Dongpo Li      2016-07-15  874  		ret = -ENODEV;
3c2c758a1607ea Yang Xiwen     2024-02-16  875  		goto out_unregister_mdio_bus;
542ae60af24f02 Dongpo Li      2016-07-15  876  	}
542ae60af24f02 Dongpo Li      2016-07-15  877  
542ae60af24f02 Dongpo Li      2016-07-15  878  	phy_attached_print(phy, "phy_id=0x%.8lx, phy_mode=%s\n",
542ae60af24f02 Dongpo Li      2016-07-15  879  			   (unsigned long)phy->phy_id,
542ae60af24f02 Dongpo Li      2016-07-15  880  			   phy_modes(phy->interface));
542ae60af24f02 Dongpo Li      2016-07-15  881  
9ca01b25dffffe Jakub Kicinski 2021-10-06  882  	ret = of_get_ethdev_address(node, ndev);
83216e3988cd19 Michael Walle  2021-04-12  883  	if (ret) {
542ae60af24f02 Dongpo Li      2016-07-15  884  		eth_hw_addr_random(ndev);
542ae60af24f02 Dongpo Li      2016-07-15  885  		dev_warn(dev, "using random MAC address %pM\n",
542ae60af24f02 Dongpo Li      2016-07-15  886  			 ndev->dev_addr);
542ae60af24f02 Dongpo Li      2016-07-15  887  	}
542ae60af24f02 Dongpo Li      2016-07-15  888  
542ae60af24f02 Dongpo Li      2016-07-15  889  	ndev->watchdog_timeo = 6 * HZ;
542ae60af24f02 Dongpo Li      2016-07-15  890  	ndev->priv_flags |= IFF_UNICAST_FLT;
542ae60af24f02 Dongpo Li      2016-07-15  891  	ndev->netdev_ops = &hisi_femac_netdev_ops;
542ae60af24f02 Dongpo Li      2016-07-15  892  	ndev->ethtool_ops = &hisi_femac_ethtools_ops;
b707b89f7be361 Jakub Kicinski 2022-05-06  893  	netif_napi_add_weight(ndev, &priv->napi, hisi_femac_poll,
b707b89f7be361 Jakub Kicinski 2022-05-06  894  			      FEMAC_POLL_WEIGHT);
542ae60af24f02 Dongpo Li      2016-07-15  895  
542ae60af24f02 Dongpo Li      2016-07-15  896  	hisi_femac_port_init(priv);
542ae60af24f02 Dongpo Li      2016-07-15  897  
542ae60af24f02 Dongpo Li      2016-07-15  898  	ret = hisi_femac_init_tx_and_rx_queues(priv);
542ae60af24f02 Dongpo Li      2016-07-15  899  	if (ret)
542ae60af24f02 Dongpo Li      2016-07-15  900  		goto out_disconnect_phy;
542ae60af24f02 Dongpo Li      2016-07-15  901  
542ae60af24f02 Dongpo Li      2016-07-15  902  	ndev->irq = platform_get_irq(pdev, 0);
ae1d60c41e581b Ruan Jinjie    2023-07-31  903  	if (ndev->irq < 0) {
ae1d60c41e581b Ruan Jinjie    2023-07-31  904  		ret = ndev->irq;
542ae60af24f02 Dongpo Li      2016-07-15  905  		goto out_disconnect_phy;
542ae60af24f02 Dongpo Li      2016-07-15  906  	}
542ae60af24f02 Dongpo Li      2016-07-15  907  
542ae60af24f02 Dongpo Li      2016-07-15  908  	ret = devm_request_irq(dev, ndev->irq, hisi_femac_interrupt,
542ae60af24f02 Dongpo Li      2016-07-15  909  			       IRQF_SHARED, pdev->name, ndev);
542ae60af24f02 Dongpo Li      2016-07-15  910  	if (ret) {
542ae60af24f02 Dongpo Li      2016-07-15  911  		dev_err(dev, "devm_request_irq %d failed!\n", ndev->irq);
542ae60af24f02 Dongpo Li      2016-07-15  912  		goto out_disconnect_phy;
542ae60af24f02 Dongpo Li      2016-07-15  913  	}
542ae60af24f02 Dongpo Li      2016-07-15  914  
542ae60af24f02 Dongpo Li      2016-07-15  915  	ret = register_netdev(ndev);
542ae60af24f02 Dongpo Li      2016-07-15  916  	if (ret) {
542ae60af24f02 Dongpo Li      2016-07-15  917  		dev_err(dev, "register_netdev failed!\n");
542ae60af24f02 Dongpo Li      2016-07-15  918  		goto out_disconnect_phy;
542ae60af24f02 Dongpo Li      2016-07-15  919  	}
542ae60af24f02 Dongpo Li      2016-07-15  920  
542ae60af24f02 Dongpo Li      2016-07-15  921  	return ret;
542ae60af24f02 Dongpo Li      2016-07-15  922  
542ae60af24f02 Dongpo Li      2016-07-15  923  out_disconnect_phy:
542ae60af24f02 Dongpo Li      2016-07-15  924  	netif_napi_del(&priv->napi);
542ae60af24f02 Dongpo Li      2016-07-15  925  	phy_disconnect(phy);
3c2c758a1607ea Yang Xiwen     2024-02-16  926  out_unregister_mdio_bus:
3c2c758a1607ea Yang Xiwen     2024-02-16  927  	platform_device_unregister(priv->mdio_pdev);
542ae60af24f02 Dongpo Li      2016-07-15  928  out_free_netdev:
542ae60af24f02 Dongpo Li      2016-07-15  929  	free_netdev(ndev);
542ae60af24f02 Dongpo Li      2016-07-15  930  
542ae60af24f02 Dongpo Li      2016-07-15 @931  	return ret;
542ae60af24f02 Dongpo Li      2016-07-15  932  }
542ae60af24f02 Dongpo Li      2016-07-15  933  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
