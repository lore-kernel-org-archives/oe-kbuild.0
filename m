Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B30D216605
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 14:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746801928; cv=none; b=tlXNPdB/tQY4jHkIXJ3u99vZ6VKpRy/57QJBxuo5xqvAmGrknpcpZBBHpS7jXRCwSjdhoTZnrGXZ99JgM3NBfkBC+bLgSA5KmyjMQTR4jhbww5CbtXSMDckehDgvHKpEJ/h0khSm/EHiG1WKzvKXfI1noGb0MLUh9v/vXPbJHck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746801928; c=relaxed/simple;
	bh=+yccwmrT+f3l7Cznh77BRCKQMXA0+3a4cmafm8si0hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cprk5anHFoZ/7Hcz+48e5NANE7Y6SZYYAWm1adrmbKqLHw0QY0WDo4IdH8rQDwmLRuimY/0lnk0op925C2Aqls+eSKji0/dxWGr7nrOCxcjZpFYTe3nz5XuLJ+oAX361abYQYwhHCoU66d0ZG5tKp70VbqpmBoYsNXk8LX2BzJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKqo/Js/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKqo/Js/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746801926; x=1778337926;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+yccwmrT+f3l7Cznh77BRCKQMXA0+3a4cmafm8si0hw=;
  b=HKqo/Js/LWc1tlGx8Bk8dAuBvy1TUgAc3nJ/yUvjudqHv3CYCqhZfC5t
   qqphCpTzEzfLNoR21ofC81+sozeyjHqBoIUivRSekuy8vVMteEmo4DVG8
   CtjugvAj5rA7/9uEfP8r5oJlOL4MBZjZTqkTOmK/JfgUcRngXqgwtjuQ0
   KxQWoVXAwSUrthsQPskGTc45ZalD/uAnx7E0T/Xnx9AWat/SCaTrQTZwV
   WIhgqUY+VS7ut7GECiNdVjZ7TmrKmKn37JGX/pz/PJ2TG+16ZcwnITvOv
   /ajrKzWEVJ7Q+TTiusSfuLY53+kX4B0aSvRPLPywhaaO0bUtqkv3M5LiS
   g==;
X-CSE-ConnectionGUID: 9mR0PoLiTt6aoa6xESM0uw==
X-CSE-MsgGUID: +r1p8m1sTk+LORg0KWHhaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48792311"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="48792311"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 07:45:25 -0700
X-CSE-ConnectionGUID: XTCCNoNJQiCMQD1DK1Rxcw==
X-CSE-MsgGUID: +Uwshe8PT42R50KQGjb6Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="137147707"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 May 2025 07:45:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDOyX-000CAj-1P;
	Fri, 09 May 2025 14:45:21 +0000
Date: Fri, 9 May 2025 22:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8727/10031] drivers/net/usb/lan78xx.c:2529
 lan78xx_register_fixed_phy() warn: format string contains non-ascii
 character '\xe2'
Message-ID: <202505092209.9c7vGmH0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Oleksij Rempel <o.rempel@pengutronix.de>
CC: Thangaraj Samynathan <thangaraj.s@microchip.com>

Hi Oleksij,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: d39f339d2603736ff90b0b32d9aea3b954307fd5 [8727/10031] net: usb: lan78xx: refactor PHY init to separate detection and MAC configuration
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250508 (https://download.01.org/0day-ci/archive/20250509/202505092209.9c7vGmH0-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505092209.9c7vGmH0-lkp@intel.com/

New smatch warnings:
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format string contains non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format string contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format string contains non-ascii character '\x93'
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contains non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contains non-ascii character '\x93'

Old smatch warnings:
drivers/net/usb/lan78xx.c:3005 lan78xx_init_ltm() warn: missing unwind goto?

vim +2529 drivers/net/usb/lan78xx.c

cc89c323a30e73 Woojung Huh               2016-11-01  2510  
d39f339d260373 Oleksij Rempel            2025-05-05  2511  /**
d39f339d260373 Oleksij Rempel            2025-05-05  2512   * lan78xx_register_fixed_phy() - Register a fallback fixed PHY
d39f339d260373 Oleksij Rempel            2025-05-05  2513   * @dev: LAN78xx device
d39f339d260373 Oleksij Rempel            2025-05-05  2514   *
d39f339d260373 Oleksij Rempel            2025-05-05  2515   * Registers a fixed PHY with 1 Gbps full duplex. This is used in special cases
d39f339d260373 Oleksij Rempel            2025-05-05  2516   * like EVB-KSZ9897-1, where LAN7801 acts as a USB-to-Ethernet interface to a
d39f339d260373 Oleksij Rempel            2025-05-05  2517   * switch without a visible PHY.
d39f339d260373 Oleksij Rempel            2025-05-05  2518   *
d39f339d260373 Oleksij Rempel            2025-05-05  2519   * Return: pointer to the registered fixed PHY, or ERR_PTR() on error.
d39f339d260373 Oleksij Rempel            2025-05-05  2520   */
d39f339d260373 Oleksij Rempel            2025-05-05  2521  static struct phy_device *lan78xx_register_fixed_phy(struct lan78xx_net *dev)
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2522  {
89b36fb5e53244 Raghuram Chary J          2018-04-28  2523  	struct fixed_phy_status fphy_status = {
89b36fb5e53244 Raghuram Chary J          2018-04-28  2524  		.link = 1,
89b36fb5e53244 Raghuram Chary J          2018-04-28  2525  		.speed = SPEED_1000,
89b36fb5e53244 Raghuram Chary J          2018-04-28  2526  		.duplex = DUPLEX_FULL,
89b36fb5e53244 Raghuram Chary J          2018-04-28  2527  	};
d39f339d260373 Oleksij Rempel            2025-05-05  2528  
d39f339d260373 Oleksij Rempel            2025-05-05 @2529  	netdev_info(dev->net,
d39f339d260373 Oleksij Rempel            2025-05-05  2530  		    "No PHY found on LAN7801 – registering fixed PHY (e.g. EVB-KSZ9897-1)\n");
d39f339d260373 Oleksij Rempel            2025-05-05  2531  
d39f339d260373 Oleksij Rempel            2025-05-05  2532  	return fixed_phy_register(PHY_POLL, &fphy_status, NULL);
d39f339d260373 Oleksij Rempel            2025-05-05  2533  }
d39f339d260373 Oleksij Rempel            2025-05-05  2534  
d39f339d260373 Oleksij Rempel            2025-05-05  2535  /**
d39f339d260373 Oleksij Rempel            2025-05-05  2536   * lan78xx_get_phy() - Probe or register PHY device and set interface mode
d39f339d260373 Oleksij Rempel            2025-05-05  2537   * @dev: LAN78xx device structure
d39f339d260373 Oleksij Rempel            2025-05-05  2538   *
d39f339d260373 Oleksij Rempel            2025-05-05  2539   * This function attempts to find a PHY on the MDIO bus. If no PHY is found
d39f339d260373 Oleksij Rempel            2025-05-05  2540   * and the chip is LAN7801, it registers a fixed PHY as fallback. It also
d39f339d260373 Oleksij Rempel            2025-05-05  2541   * sets dev->interface based on chip ID and detected PHY type.
d39f339d260373 Oleksij Rempel            2025-05-05  2542   *
d39f339d260373 Oleksij Rempel            2025-05-05  2543   * Return: a valid PHY device pointer, or ERR_PTR() on failure.
d39f339d260373 Oleksij Rempel            2025-05-05  2544   */
d39f339d260373 Oleksij Rempel            2025-05-05  2545  static struct phy_device *lan78xx_get_phy(struct lan78xx_net *dev)
d39f339d260373 Oleksij Rempel            2025-05-05  2546  {
3b51cc75eba28a Colin Ian King            2018-02-01  2547  	struct phy_device *phydev;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2548  
d39f339d260373 Oleksij Rempel            2025-05-05  2549  	/* Attempt to locate a PHY on the MDIO bus */
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2550  	phydev = phy_find_first(dev->mdiobus);
d39f339d260373 Oleksij Rempel            2025-05-05  2551  
d39f339d260373 Oleksij Rempel            2025-05-05  2552  	switch (dev->chipid) {
d39f339d260373 Oleksij Rempel            2025-05-05  2553  	case ID_REV_CHIP_ID_7801_:
d39f339d260373 Oleksij Rempel            2025-05-05  2554  		if (phydev) {
d39f339d260373 Oleksij Rempel            2025-05-05  2555  			/* External RGMII PHY detected */
d39f339d260373 Oleksij Rempel            2025-05-05  2556  			dev->interface = PHY_INTERFACE_MODE_RGMII_ID;
d39f339d260373 Oleksij Rempel            2025-05-05  2557  			phydev->is_internal = false;
d39f339d260373 Oleksij Rempel            2025-05-05  2558  
d39f339d260373 Oleksij Rempel            2025-05-05  2559  			if (!phydev->drv)
d39f339d260373 Oleksij Rempel            2025-05-05 @2560  				netdev_warn(dev->net,
d39f339d260373 Oleksij Rempel            2025-05-05  2561  					    "PHY driver not found – assuming RGMII delays are on PCB or strapped for the PHY\n");
d39f339d260373 Oleksij Rempel            2025-05-05  2562  
d39f339d260373 Oleksij Rempel            2025-05-05  2563  			return phydev;
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2564  		}
d39f339d260373 Oleksij Rempel            2025-05-05  2565  
89b36fb5e53244 Raghuram Chary J          2018-04-28  2566  		dev->interface = PHY_INTERFACE_MODE_RGMII;
d39f339d260373 Oleksij Rempel            2025-05-05  2567  		/* No PHY found – fallback to fixed PHY (e.g. KSZ switch board) */
d39f339d260373 Oleksij Rempel            2025-05-05  2568  		return lan78xx_register_fixed_phy(dev);
d39f339d260373 Oleksij Rempel            2025-05-05  2569  
d39f339d260373 Oleksij Rempel            2025-05-05  2570  	case ID_REV_CHIP_ID_7800_:
d39f339d260373 Oleksij Rempel            2025-05-05  2571  	case ID_REV_CHIP_ID_7850_:
d39f339d260373 Oleksij Rempel            2025-05-05  2572  		if (!phydev)
d39f339d260373 Oleksij Rempel            2025-05-05  2573  			return ERR_PTR(-ENODEV);
d39f339d260373 Oleksij Rempel            2025-05-05  2574  
d39f339d260373 Oleksij Rempel            2025-05-05  2575  		/* These use internal GMII-connected PHY */
d39f339d260373 Oleksij Rempel            2025-05-05  2576  		dev->interface = PHY_INTERFACE_MODE_GMII;
d39f339d260373 Oleksij Rempel            2025-05-05  2577  		phydev->is_internal = true;
d39f339d260373 Oleksij Rempel            2025-05-05  2578  		return phydev;
d39f339d260373 Oleksij Rempel            2025-05-05  2579  
d39f339d260373 Oleksij Rempel            2025-05-05  2580  	default:
d39f339d260373 Oleksij Rempel            2025-05-05  2581  		netdev_err(dev->net, "Unknown CHIP ID: 0x%08x\n", dev->chipid);
d39f339d260373 Oleksij Rempel            2025-05-05  2582  		return ERR_PTR(-ENODEV);
d39f339d260373 Oleksij Rempel            2025-05-05  2583  	}
d39f339d260373 Oleksij Rempel            2025-05-05  2584  }
d39f339d260373 Oleksij Rempel            2025-05-05  2585  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
