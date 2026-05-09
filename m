Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ABF3BBA1A
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 22:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778367218; cv=none; b=csbIrpb+hxQhqJgTjQRnAdVlYZFE7Aj0pRYAKbfiDMbcpFEKV3nQ/rTU6ZHBw/CBh+qjUH4bmo7ok/aCkfCZ6AIkzfWRF/L3uhfoWeQ2DxcRMogJTgo63THAlrFBIB4zMnTOGNkRJrJX4FjlJYmRkogZweV3wq0DNKo0uzPRnX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778367218; c=relaxed/simple;
	bh=CENlOElo/8yD9yU/SBM4D/Rp2OabW63gCPVDaaVv2/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JQjbw/Be9IBDbuQeJDmNi/PpPgPUVP0nGX09pR4xyXO2CLJOQDdissCy/xxh4btLI7z+L/nORwzSJMbGUyYo6SwBPjs7Duv4VAE6OERkZZHfAvz7SWZYkqWYR1oWAQuq51Dn2LS2hGEpqmHhM9flzYP70HHow2bTBF8XMy31ojA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmUWpkk3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmUWpkk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778367216; x=1809903216;
  h=date:from:to:cc:subject:message-id;
  bh=CENlOElo/8yD9yU/SBM4D/Rp2OabW63gCPVDaaVv2/Q=;
  b=SmUWpkk3sCeHYgBavlgt2EUAu0bV192j/zuMYISELHNdJvOGN700XPzg
   mCCIEtOeZpVGNoGSQbyuuze0k+ngDzwMPHtfQd5ooMmMqwhlFnvWGntzm
   amiyj8AHPCEwGw5kXY8x/cJnH2gCfv9dlWVh3KGxXnnaE/hRjaLAJtesD
   zQcy8cfvMx0v8u5nhUIZqnlhkolgCqirYUVhcEsFdZ/ez1sZnrR/zHY73
   qK6cZU0tq+T5L7yzm4ohDCNWuSPpRp38xVqK9IbG7qrGpeAB6VYd+4Hrn
   V5YSbCpsYRB/Pcv/Ms2orzOpU4iI95hg+n+UMwl83ADRJEF5UWc7vziEw
   A==;
X-CSE-ConnectionGUID: vblX5B6IRBmnERuB0XyRuw==
X-CSE-MsgGUID: 84+m6BHkSBqOlvpyzpz7CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79246786"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79246786"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 15:53:35 -0700
X-CSE-ConnectionGUID: Rqj0IBf+Qw2Hnako9lDoRg==
X-CSE-MsgGUID: 6VfR74WyTDKhXcsqQRqRMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="234434977"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2026 15:53:34 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLqY7-000000001Uj-2YC4;
	Sat, 09 May 2026 22:53:31 +0000
Date: Sun, 10 May 2026 06:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:7.1-rc 124/162]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5559:18: sparse: sparse: unsigned
 value that used to be signed checked against zero?
Message-ID: <202605100604.Xsfc5vDV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/mediatek/mtk_eth_soc.c:5559:18: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   12aaea139e45ed0d826a63a866c1ce03d352fea6
commit: e8eac97b7338a6135e70129c65c63657d627ef71 [124/162] net: ethernet: mtk_eth_soc: support ethernet passive mux
:::::: branch date: 15 hours ago
:::::: commit date: 8 days ago
config: sparc-randconfig-r123-20260509 (https://download.01.org/0day-ci/archive/20260510/202605100604.Xsfc5vDV-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100604.Xsfc5vDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605100604.Xsfc5vDV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1973:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __sum16 [usertype] check @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1973:45: sparse:     expected restricted __sum16 [usertype] check
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1973:45: sparse:     got restricted __be16 [usertype]
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3211:22: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] ip @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3211:22: sparse:     expected unsigned int [usertype] val
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3211:22: sparse:     got restricted __be32 [usertype] ip
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3317:18: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3317:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ip4dst @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3317:16: sparse:     expected unsigned int [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3317:16: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3322:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got unsigned int [usertype] ip4dst @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3322:38: sparse:     expected restricted __be32
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3322:38: sparse:     got unsigned int [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3343:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ip4dst @@     got restricted __be32 @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3343:16: sparse:     expected unsigned int [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3343:16: sparse:     got restricted __be32
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3366:72: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] ip4dst @@     got restricted __be32 @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3366:72: sparse:     expected unsigned int [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3366:72: sparse:     got restricted __be32
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3384:72: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] ip4dst @@     got restricted __be32 @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3384:72: sparse:     expected unsigned int [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3384:72: sparse:     got restricted __be32
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3408:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4dst @@     got unsigned int [usertype] @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3408:38: sparse:     expected restricted __be32 [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3408:38: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3412:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4src @@     got unsigned int @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3412:38: sparse:     expected restricted __be32 [usertype] ip4src
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3412:38: sparse:     got unsigned int
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3414:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] psrc @@     got int @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3414:36: sparse:     expected restricted __be16 [usertype] psrc
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3414:36: sparse:     got int
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3416:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] pdst @@     got int @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3416:36: sparse:     expected restricted __be16 [usertype] pdst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3416:36: sparse:     got int
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/linux/phy.h, include/linux/of_mdio.h):
   include/linux/skbuff.h:2903:28: sparse: sparse: unsigned value that used to be signed checked against zero?
   include/linux/skbuff.h:2903:28: sparse: signed value source
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5559:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/sparc/include/uapi/asm/byteorder.h, arch/sparc/include/asm/bitops_32.h, ...):
   include/uapi/linux/byteorder/big_endian.h:83:32: sparse: signed value source

vim +5559 drivers/net/ethernet/mediatek/mtk_eth_soc.c

e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5544  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5545  static int mtk_add_mux(struct mtk_eth *eth, struct device_node *np)
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5546  {
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5547  	const __be32 *_id = of_get_property(np, "reg", NULL);
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5548  	struct device_node *child;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5549  	struct mtk_mux *mux;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5550  	unsigned int id;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5551  	int err;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5552  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5553  	if (!_id) {
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5554  		dev_err(eth->dev, "missing attach mac id\n");
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5555  		return -EINVAL;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5556  	}
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5557  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5558  	id = be32_to_cpup(_id);
e8eac97b7338a6 Bo-Cun Chen 2024-11-28 @5559  	if (id < 0 || id >= MTK_MAX_DEVS) {
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5560  		dev_err(eth->dev, "%d is not a valid attach mac id\n", id);
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5561  		return -EINVAL;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5562  	}
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5563  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5564  	mux = kmalloc(sizeof(struct mtk_mux), GFP_KERNEL);
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5565  	if (unlikely(!mux)) {
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5566  		dev_err(eth->dev, "failed to create mux structure\n");
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5567  		return -ENOMEM;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5568  	}
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5569  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5570  	eth->mux[id] = mux;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5571  	mux->mac = eth->mac[id];
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5572  	mux->channel = 0;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5573  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5574  	mux->mod_def0_gpio = fwnode_gpiod_get_index(of_fwnode_handle(np),
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5575  				"mod-def0", 0, GPIOD_IN |
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5576  				GPIOD_FLAGS_BIT_NONEXCLUSIVE, "?");
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5577  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5578  	if (IS_ERR(mux->mod_def0_gpio)) {
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5579  		dev_err(eth->dev, "failed to requset gpio for mod-def0\n");
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5580  		err = PTR_ERR(mux->mod_def0_gpio);
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5581  		goto err_free_mux;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5582  	}
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5583  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5584  	mux->chan_sel_gpio = fwnode_gpiod_get_index(of_fwnode_handle(np),
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5585  				"chan-sel", 0, GPIOD_OUT_LOW, "?");
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5586  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5587  	if (IS_ERR(mux->chan_sel_gpio)) {
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5588  		dev_err(eth->dev, "failed to requset gpio for chan-sel\n");
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5589  		err = PTR_ERR(mux->chan_sel_gpio);
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5590  		goto err_put_mod_def0;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5591  	}
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5592  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5593  	of_property_read_u32(np, "sfp-present-channel",
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5594  		&mux->sfp_present_channel);
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5595  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5596  	for_each_child_of_node(np, child) {
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5597  		err = mtk_add_mux_channel(mux, child);
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5598  		if (err) {
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5599  			dev_err(eth->dev, "failed to add mtk_mux\n");
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5600  			of_node_put(child);
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5601  			goto err_put_chan_sel;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5602  		}
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5603  	}
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5604  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5605  	INIT_DELAYED_WORK(&mux->poll, mux_poll);
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5606  	mod_delayed_work(system_wq, &mux->poll, msecs_to_jiffies(3000));
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5607  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5608  	return 0;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5609  
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5610  err_put_chan_sel:
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5611  	gpiod_put(mux->chan_sel_gpio);
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5612  err_put_mod_def0:
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5613  	gpiod_put(mux->mod_def0_gpio);
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5614  err_free_mux:
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5615  	kfree(mux);
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5616  	eth->mux[id] = NULL;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5617  	return err;
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5618  }
e8eac97b7338a6 Bo-Cun Chen 2024-11-28  5619  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
