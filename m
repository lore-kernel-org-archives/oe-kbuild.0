Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF78ED0
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Feb 2024 00:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707611507; cv=none; b=kyaIaookE5XaNsUAxVwYDquCViF8utRjxt0Q8l4RNzsMJLzf4kLy67i3O8UOBOM0nLTE/FO+FXiwjj027HDgWkgjAE172b2MsoB0XrrE9UI7fyYJgEugo4nbsV2o7gtcVDN3RuAZiLQ9jc20Mx24SdRqUdnjQNwdhITKPt3XK5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707611507; c=relaxed/simple;
	bh=YFrrWdCE7cB8ka1gYpMj+E5gqj++Jy5fujclkU/o3aA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QRla/jqnZlk4NdekmwAA77wrrxu/OX/h+/+p6JQZY9vWnxIXfdK7FzPcseJ3Zafur1C8zgoqNDkl945pFblsOSdnS+NyRmO0a0KXk6QUX4aCPBn9oLdbx74xq4mmoV5XJAqNyQLRYC9KyrUE5HAwpiNNIB4pbSM9tloOedw7w2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJRJ+Raz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJRJ+Raz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707611505; x=1739147505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YFrrWdCE7cB8ka1gYpMj+E5gqj++Jy5fujclkU/o3aA=;
  b=LJRJ+RazoFwhxKI83iHKvRbb6/Imirsm4qYhvrlbbOrwytKRTPbvUdfT
   ON8KrYeW/EWkn9PjUEAdvNVtNX9BgUnjKHdSEpla3jbLHEdcnpttZZUkO
   AXfo+eHl1OGijoASdlpoLX5JFeDTBvIDWt3n/lmc0inAvjH5GBa1+K+C4
   7O9cJwRbAbn4AIAXcKhDMyCDTTlVHBEfr0JNig9KR3rmhE36gqnGr7Hpt
   KKx8NR4DZbRY4Bc3SN1WKcP5gmws2Pae82vhOuOYsbpj20khuQSrnULI/
   04KxZuqjWYDq78cH3Uwy3GM3OOL0fVAJe8zvCj6OXWyJfEFt7tlHdUbej
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="1723467"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="1723467"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 16:31:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="6903519"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Feb 2024 16:31:42 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYxkx-0006Co-34;
	Sun, 11 Feb 2024 00:31:39 +0000
Date: Sun, 11 Feb 2024 08:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 2/2] net: phy: air_en8811h: Add the Airoha
 EN8811H PHY driver
Message-ID: <202402110805.r1KRiKtL-lkp@intel.com>
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
In-Reply-To: <20240206194751.1901802-3-ericwouds@gmail.com>
References: <20240206194751.1901802-3-ericwouds@gmail.com>
TO: Eric Woudstra <ericwouds@gmail.com>

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Woudstra/dt-bindings-net-airoha-en8811h-Add-en8811h-serdes-polarity/20240207-035021
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240206194751.1901802-3-ericwouds%40gmail.com
patch subject: [PATCH net-next 2/2] net: phy: air_en8811h: Add the Airoha EN8811H PHY driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: sh-randconfig-r081-20240211 (https://download.01.org/0day-ci/archive/20240211/202402110805.r1KRiKtL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402110805.r1KRiKtL-lkp@intel.com/

smatch warnings:
drivers/net/phy/air_en8811h.c:560 air_led_hw_control_set() error: testing array offset 'index' after use.

vim +/index +560 drivers/net/phy/air_en8811h.c

3fe47bc0b949e7 Eric Woudstra 2024-02-06  550  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  551  static int air_led_hw_control_set(struct phy_device *phydev, u8 index,
3fe47bc0b949e7 Eric Woudstra 2024-02-06  552  				  unsigned long rules)
3fe47bc0b949e7 Eric Woudstra 2024-02-06  553  {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  554  	struct en8811h_priv *priv = phydev->priv;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  555  	u16 on = 0, blink = 0;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  556  	int ret;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  557  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  558  	priv->led[index].rules = rules;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  559  
3fe47bc0b949e7 Eric Woudstra 2024-02-06 @560  	if (index >= EN8811H_LED_COUNT)
3fe47bc0b949e7 Eric Woudstra 2024-02-06  561  		return -EINVAL;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  562  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  563  	if (rules & (BIT(TRIGGER_NETDEV_LINK_10)   | BIT(TRIGGER_NETDEV_LINK))) {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  564  		on |= AIR_PHY_LED_ON_LINK10;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  565  		if (rules & BIT(TRIGGER_NETDEV_RX))
3fe47bc0b949e7 Eric Woudstra 2024-02-06  566  			blink |= AIR_PHY_LED_BLINK_10RX;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  567  		if (rules & BIT(TRIGGER_NETDEV_TX))
3fe47bc0b949e7 Eric Woudstra 2024-02-06  568  			blink |= AIR_PHY_LED_BLINK_10TX;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  569  	}
3fe47bc0b949e7 Eric Woudstra 2024-02-06  570  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  571  	if (rules & (BIT(TRIGGER_NETDEV_LINK_100)  | BIT(TRIGGER_NETDEV_LINK))) {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  572  		on |= AIR_PHY_LED_ON_LINK100;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  573  		if (rules & BIT(TRIGGER_NETDEV_RX))
3fe47bc0b949e7 Eric Woudstra 2024-02-06  574  			blink |= AIR_PHY_LED_BLINK_100RX;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  575  		if (rules & BIT(TRIGGER_NETDEV_TX))
3fe47bc0b949e7 Eric Woudstra 2024-02-06  576  			blink |= AIR_PHY_LED_BLINK_100TX;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  577  	}
3fe47bc0b949e7 Eric Woudstra 2024-02-06  578  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  579  	if (rules & (BIT(TRIGGER_NETDEV_LINK_1000) | BIT(TRIGGER_NETDEV_LINK))) {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  580  		on |= AIR_PHY_LED_ON_LINK1000;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  581  		if (rules & BIT(TRIGGER_NETDEV_RX))
3fe47bc0b949e7 Eric Woudstra 2024-02-06  582  			blink |= AIR_PHY_LED_BLINK_1000RX;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  583  		if (rules & BIT(TRIGGER_NETDEV_TX))
3fe47bc0b949e7 Eric Woudstra 2024-02-06  584  			blink |= AIR_PHY_LED_BLINK_1000TX;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  585  	}
3fe47bc0b949e7 Eric Woudstra 2024-02-06  586  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  587  	if (rules & (BIT(TRIGGER_NETDEV_LINK_2500) | BIT(TRIGGER_NETDEV_LINK))) {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  588  		on |= AIR_PHY_LED_ON_LINK2500;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  589  		if (rules & BIT(TRIGGER_NETDEV_RX))
3fe47bc0b949e7 Eric Woudstra 2024-02-06  590  			blink |= AIR_PHY_LED_BLINK_2500RX;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  591  		if (rules & BIT(TRIGGER_NETDEV_TX))
3fe47bc0b949e7 Eric Woudstra 2024-02-06  592  			blink |= AIR_PHY_LED_BLINK_2500TX;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  593  	}
3fe47bc0b949e7 Eric Woudstra 2024-02-06  594  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  595  	if (on == 0) {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  596  		if (rules & BIT(TRIGGER_NETDEV_RX)) {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  597  			blink |= AIR_PHY_LED_BLINK_10RX   |
3fe47bc0b949e7 Eric Woudstra 2024-02-06  598  				 AIR_PHY_LED_BLINK_100RX  |
3fe47bc0b949e7 Eric Woudstra 2024-02-06  599  				 AIR_PHY_LED_BLINK_1000RX |
3fe47bc0b949e7 Eric Woudstra 2024-02-06  600  				 AIR_PHY_LED_BLINK_2500RX;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  601  		}
3fe47bc0b949e7 Eric Woudstra 2024-02-06  602  		if (rules & BIT(TRIGGER_NETDEV_TX)) {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  603  			blink |= AIR_PHY_LED_BLINK_10TX   |
3fe47bc0b949e7 Eric Woudstra 2024-02-06  604  				 AIR_PHY_LED_BLINK_100TX  |
3fe47bc0b949e7 Eric Woudstra 2024-02-06  605  				 AIR_PHY_LED_BLINK_1000TX |
3fe47bc0b949e7 Eric Woudstra 2024-02-06  606  				 AIR_PHY_LED_BLINK_2500TX;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  607  		}
3fe47bc0b949e7 Eric Woudstra 2024-02-06  608  	}
3fe47bc0b949e7 Eric Woudstra 2024-02-06  609  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  610  	if (rules & BIT(TRIGGER_NETDEV_FULL_DUPLEX))
3fe47bc0b949e7 Eric Woudstra 2024-02-06  611  		on |= AIR_PHY_LED_ON_FDX;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  612  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  613  	if (rules & BIT(TRIGGER_NETDEV_HALF_DUPLEX))
3fe47bc0b949e7 Eric Woudstra 2024-02-06  614  		on |= AIR_PHY_LED_ON_HDX;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  615  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  616  	if (blink || on) {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  617  		/* switch hw-control on, so led-on and led-blink are off */
3fe47bc0b949e7 Eric Woudstra 2024-02-06  618  		clear_bit(AIR_PHY_LED_STATE_FORCE_ON, &priv->led[index].state);
3fe47bc0b949e7 Eric Woudstra 2024-02-06  619  		clear_bit(AIR_PHY_LED_STATE_FORCE_BLINK, &priv->led[index].state);
3fe47bc0b949e7 Eric Woudstra 2024-02-06  620  	} else {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  621  		priv->led[index].rules = 0;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  622  	}
3fe47bc0b949e7 Eric Woudstra 2024-02-06  623  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  624  	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND2, AIR_PHY_LED_ON(index),
3fe47bc0b949e7 Eric Woudstra 2024-02-06  625  			     AIR_PHY_LED_ON_MASK, on);
3fe47bc0b949e7 Eric Woudstra 2024-02-06  626  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  627  	if (ret < 0)
3fe47bc0b949e7 Eric Woudstra 2024-02-06  628  		return ret;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  629  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  630  	return phy_write_mmd(phydev, MDIO_MMD_VEND2, AIR_PHY_LED_BLINK(index),
3fe47bc0b949e7 Eric Woudstra 2024-02-06  631  			     blink);
3fe47bc0b949e7 Eric Woudstra 2024-02-06  632  };
3fe47bc0b949e7 Eric Woudstra 2024-02-06  633  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
