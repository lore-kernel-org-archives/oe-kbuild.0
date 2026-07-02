Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463782853E0
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 10:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988330; cv=none; b=oR8lHsylwJiwA0DorR2Z4Jn6LIqBqwBRXWm9IUnOuy1WkDgHmvCHK+0k1mB403J6s2fOmQVp237xkHSwb5SRhNHUyK/pqYNRxi8PQ1o4LwNO8WEWQPd0tGUySXrSuw1tBYX5+E25AVkxCYWLmqu3Gm2VMK8Tc3Ppb/sxDPY+N8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988330; c=relaxed/simple;
	bh=xjmv6tXQV9dmDTbRjxEsL/38ZbhYJkOArYR5ejfxDzU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KOezPxewZ9S3MxZh0FHKItqtgzjtU3OzI8RBXgsFQT7MBdlVpnb6iZn90uUIv6HVxjH49rWedyT51lQyrWa3OKq9jIyLyygTjcOF3gdXNKqE5rF99SXVrSRtx4AfYZnJ85RUsrac48fi8nGKPxUkr9DwXXzq46CbyC2MWHahjz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avK1vkND; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avK1vkND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782988327; x=1814524327;
  h=date:from:to:cc:subject:message-id;
  bh=xjmv6tXQV9dmDTbRjxEsL/38ZbhYJkOArYR5ejfxDzU=;
  b=avK1vkND1x0RWcrTL1iEaoZGhCTPWoXMVRTwvpf8uuZjT0l2pWunaAb3
   XzDQliHxHxb0FUQTleI1vu73mXtz3UQoBvuI3GYIOI1Q3jbNGZfwABjJQ
   oHufpQiJjqBHijTUthMqq9wXxigloCPlHIfhmcwtmjwAfsn6hv3/41oym
   n/HclL7pi0h17Laxofue/N3KoTgAmoas+M3jMJt6KasudIe6KDZcClFt1
   lSNhY8LL3ItGk8tEjTflbnXx54RpSscSSVHy2orocYqPZvj6NB6XGBYt2
   v327pqMN7hECvfyBFN8+GVa7P1Igo6MwnQfb/xqvK1KqPUuPz/tGD84t7
   w==;
X-CSE-ConnectionGUID: toUPSFt2SpORYkQKdqCGpQ==
X-CSE-MsgGUID: Mby4wFE6T9KAoqQze/llQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="95242824"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="95242824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 03:32:00 -0700
X-CSE-ConnectionGUID: HbTVz9KrRN6ICUVzh2CNoQ==
X-CSE-MsgGUID: WzLbnaT3S0O0omnw3Q3LRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248372979"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2026 03:31:59 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfEhb-00000000Ah9-3TF3;
	Thu, 02 Jul 2026 10:31:41 +0000
Date: Thu, 02 Jul 2026 18:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:pr/187 1/1]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5565:18: sparse: sparse: unsigned
 value that used to be signed checked against zero?
Message-ID: <202607021806.WM0nJiTS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/mediatek/mtk_eth_soc.c:5565:18: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/187
head:   3591b14936035fc6eaa4ffb659d63289367e34d4
commit: 8678640e804a2d9b6bf1ca78825accdcd2a8ebb5 [1/1] net: ethernet: mtk_eth_soc: support ethernet passive mux
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: openrisc-randconfig-r112-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021806.WM0nJiTS-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021806.WM0nJiTS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607021806.WM0nJiTS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1973:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __sum16 [usertype] check @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1973:45: sparse:     expected restricted __sum16 [usertype] check
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1973:45: sparse:     got restricted __be16 [usertype]
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/linux/phy.h, include/linux/of_mdio.h):
   include/linux/skbuff.h:2905:28: sparse: sparse: unsigned value that used to be signed checked against zero?
   include/linux/skbuff.h:2905:28: sparse: signed value source
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5565:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/openrisc/include/uapi/asm/byteorder.h, include/asm-generic/bitops/le.h, ...):
   include/uapi/linux/byteorder/big_endian.h:83:32: sparse: signed value source

vim +5565 drivers/net/ethernet/mediatek/mtk_eth_soc.c

8678640e804a2d9 Bo-Cun Chen 2024-11-28  5550  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5551  static int mtk_add_mux(struct mtk_eth *eth, struct device_node *np)
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5552  {
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5553  	const __be32 *_id = of_get_property(np, "reg", NULL);
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5554  	struct device_node *child;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5555  	struct mtk_mux *mux;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5556  	unsigned int id;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5557  	int err;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5558  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5559  	if (!_id) {
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5560  		dev_err(eth->dev, "missing attach mac id\n");
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5561  		return -EINVAL;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5562  	}
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5563  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5564  	id = be32_to_cpup(_id);
8678640e804a2d9 Bo-Cun Chen 2024-11-28 @5565  	if (id < 0 || id >= MTK_MAX_DEVS) {
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5566  		dev_err(eth->dev, "%d is not a valid attach mac id\n", id);
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5567  		return -EINVAL;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5568  	}
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5569  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5570  	mux = kmalloc(sizeof(struct mtk_mux), GFP_KERNEL);
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5571  	if (unlikely(!mux)) {
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5572  		dev_err(eth->dev, "failed to create mux structure\n");
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5573  		return -ENOMEM;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5574  	}
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5575  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5576  	eth->mux[id] = mux;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5577  	mux->mac = eth->mac[id];
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5578  	mux->channel = 0;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5579  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5580  	mux->mod_def0_gpio = fwnode_gpiod_get_index(of_fwnode_handle(np),
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5581  				"mod-def0", 0, GPIOD_IN |
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5582  				GPIOD_FLAGS_BIT_NONEXCLUSIVE, "?");
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5583  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5584  	if (IS_ERR(mux->mod_def0_gpio)) {
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5585  		dev_err(eth->dev, "failed to requset gpio for mod-def0\n");
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5586  		err = PTR_ERR(mux->mod_def0_gpio);
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5587  		goto err_free_mux;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5588  	}
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5589  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5590  	mux->chan_sel_gpio = fwnode_gpiod_get_index(of_fwnode_handle(np),
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5591  				"chan-sel", 0, GPIOD_OUT_LOW, "?");
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5592  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5593  	if (IS_ERR(mux->chan_sel_gpio)) {
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5594  		dev_err(eth->dev, "failed to requset gpio for chan-sel\n");
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5595  		err = PTR_ERR(mux->chan_sel_gpio);
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5596  		goto err_put_mod_def0;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5597  	}
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5598  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5599  	of_property_read_u32(np, "sfp-present-channel",
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5600  		&mux->sfp_present_channel);
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5601  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5602  	for_each_child_of_node(np, child) {
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5603  		err = mtk_add_mux_channel(mux, child);
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5604  		if (err) {
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5605  			dev_err(eth->dev, "failed to add mtk_mux\n");
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5606  			of_node_put(child);
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5607  			goto err_put_chan_sel;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5608  		}
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5609  	}
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5610  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5611  	INIT_DELAYED_WORK(&mux->poll, mux_poll);
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5612  	mod_delayed_work(system_wq, &mux->poll, msecs_to_jiffies(3000));
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5613  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5614  	return 0;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5615  
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5616  err_put_chan_sel:
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5617  	gpiod_put(mux->chan_sel_gpio);
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5618  err_put_mod_def0:
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5619  	gpiod_put(mux->mod_def0_gpio);
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5620  err_free_mux:
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5621  	kfree(mux);
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5622  	eth->mux[id] = NULL;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5623  	return err;
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5624  }
8678640e804a2d9 Bo-Cun Chen 2024-11-28  5625  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
