Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CFD82866
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 00:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765846267; cv=none; b=DYnQLfXpgXS5HDeEGH6HopYLdbbAZ7kQAyy+c9pOyXyI48SXbhd/2zQhS031Kvdn+kNupekEuDQLa4WB/OU85HPMfa4Cn5fq8ruRbuD2FOT6LzQLoCF7bLI6BT2FBGAvZJ+Hkv13RZPYQ7uzb2stPKZ7C7e27guCVk/c8W0C8Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765846267; c=relaxed/simple;
	bh=YrdQwSdgOWNaRC2bOYDOvCJ2mkt6MqfiFBO658H+gCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EPI7ZFRG3LEVVRkIaed2DCJE7vGEVGv8EQPTBYLcklgUiPjieSGmHR7vEtNSvF46p7jATLgv7XlB+cTYVh0Eb25BCpY9koZScIr2yrO6F6Qat7FOtUVWkWi33dHreX1b9IQ/v/WrtvxeakV4G0oC3AMTuLg2q0IPzu3UnKGZ8/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knHJG5xO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knHJG5xO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765846263; x=1797382263;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YrdQwSdgOWNaRC2bOYDOvCJ2mkt6MqfiFBO658H+gCA=;
  b=knHJG5xO+njbtWHAvm9V5BdtAyzGlo+eQf0I0tY1rKv8ZsMg7OxbDSxI
   vBB/17rR9UeMsiRIvMqvwFKJCX7/h1pPe0pcxI6DWZwxOYPJwpIly4tUy
   BWFGKZ0vVOXOQGmykyr5XR5CzVow7Zj9Jy7WmQe6F53g8m32la74oaTST
   9nvaKnziugsb1A3qGmxNaGhDPhSUDqB9BuO5choKd2rInSpExenfHEYs6
   G46Y9UC14OphMGhzf9oGfKW+9U4mSHbGxyulPpoVyQkn3dV/FkNTzIwNA
   XzBIzDldChOARDsgVdRisU4t34f7M8F2Ow1dZwcUMo8PpWkaf7he3BzC5
   g==;
X-CSE-ConnectionGUID: yzymR7x5RDamM3m7oIIo8Q==
X-CSE-MsgGUID: L72DrIM/Qz6QChkXeazvUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67792931"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67792931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 16:51:02 -0800
X-CSE-ConnectionGUID: b4a29czITpGrlhlrFjlCpw==
X-CSE-MsgGUID: eDYD+u+CQbC9tKf7YOtwDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197617360"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Dec 2025 16:51:00 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVJHB-000000000zH-2NkA;
	Tue, 16 Dec 2025 00:50:54 +0000
Date: Tue, 16 Dec 2025 08:50:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string
 contains non-ascii character '\x93'
Message-ID: <202512160807.7eHiIj9U-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Oleksij Rempel <o.rempel@pengutronix.de>
CC: Thangaraj Samynathan <thangaraj.s@microchip.com>

Hi Oleksij,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: d39f339d2603736ff90b0b32d9aea3b954307fd5 net: usb: lan78xx: refactor PHY init to separate detection and MAC configuration
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: sparc-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251216/202512160807.7eHiIj9U-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160807.7eHiIj9U-lkp@intel.com/

New smatch warnings:
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contains non-ascii character '\x93'

Old smatch warnings:
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format string contains non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format string contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format string contains non-ascii character '\x93'
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contains non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:3005 lan78xx_init_ltm() warn: missing unwind goto?

vim +2560 drivers/net/usb/lan78xx.c

d39f339d2603736 Oleksij Rempel            2025-05-05  2534  
d39f339d2603736 Oleksij Rempel            2025-05-05  2535  /**
d39f339d2603736 Oleksij Rempel            2025-05-05  2536   * lan78xx_get_phy() - Probe or register PHY device and set interface mode
d39f339d2603736 Oleksij Rempel            2025-05-05  2537   * @dev: LAN78xx device structure
d39f339d2603736 Oleksij Rempel            2025-05-05  2538   *
d39f339d2603736 Oleksij Rempel            2025-05-05  2539   * This function attempts to find a PHY on the MDIO bus. If no PHY is found
d39f339d2603736 Oleksij Rempel            2025-05-05  2540   * and the chip is LAN7801, it registers a fixed PHY as fallback. It also
d39f339d2603736 Oleksij Rempel            2025-05-05  2541   * sets dev->interface based on chip ID and detected PHY type.
d39f339d2603736 Oleksij Rempel            2025-05-05  2542   *
d39f339d2603736 Oleksij Rempel            2025-05-05  2543   * Return: a valid PHY device pointer, or ERR_PTR() on failure.
d39f339d2603736 Oleksij Rempel            2025-05-05  2544   */
d39f339d2603736 Oleksij Rempel            2025-05-05  2545  static struct phy_device *lan78xx_get_phy(struct lan78xx_net *dev)
d39f339d2603736 Oleksij Rempel            2025-05-05  2546  {
3b51cc75eba28a7 Colin Ian King            2018-02-01  2547  	struct phy_device *phydev;
55d7de9de6c30ad Woojung.Huh@microchip.com 2015-07-30  2548  
d39f339d2603736 Oleksij Rempel            2025-05-05  2549  	/* Attempt to locate a PHY on the MDIO bus */
ce85e13ad6ef47d Woojung.Huh@microchip.com 2015-09-16  2550  	phydev = phy_find_first(dev->mdiobus);
d39f339d2603736 Oleksij Rempel            2025-05-05  2551  
d39f339d2603736 Oleksij Rempel            2025-05-05  2552  	switch (dev->chipid) {
d39f339d2603736 Oleksij Rempel            2025-05-05  2553  	case ID_REV_CHIP_ID_7801_:
d39f339d2603736 Oleksij Rempel            2025-05-05  2554  		if (phydev) {
d39f339d2603736 Oleksij Rempel            2025-05-05  2555  			/* External RGMII PHY detected */
d39f339d2603736 Oleksij Rempel            2025-05-05  2556  			dev->interface = PHY_INTERFACE_MODE_RGMII_ID;
d39f339d2603736 Oleksij Rempel            2025-05-05  2557  			phydev->is_internal = false;
d39f339d2603736 Oleksij Rempel            2025-05-05  2558  
d39f339d2603736 Oleksij Rempel            2025-05-05  2559  			if (!phydev->drv)
d39f339d2603736 Oleksij Rempel            2025-05-05 @2560  				netdev_warn(dev->net,
d39f339d2603736 Oleksij Rempel            2025-05-05  2561  					    "PHY driver not found – assuming RGMII delays are on PCB or strapped for the PHY\n");
d39f339d2603736 Oleksij Rempel            2025-05-05  2562  
d39f339d2603736 Oleksij Rempel            2025-05-05  2563  			return phydev;
ce85e13ad6ef47d Woojung.Huh@microchip.com 2015-09-16  2564  		}
d39f339d2603736 Oleksij Rempel            2025-05-05  2565  
89b36fb5e532447 Raghuram Chary J          2018-04-28  2566  		dev->interface = PHY_INTERFACE_MODE_RGMII;
d39f339d2603736 Oleksij Rempel            2025-05-05  2567  		/* No PHY found – fallback to fixed PHY (e.g. KSZ switch board) */
d39f339d2603736 Oleksij Rempel            2025-05-05  2568  		return lan78xx_register_fixed_phy(dev);
d39f339d2603736 Oleksij Rempel            2025-05-05  2569  
d39f339d2603736 Oleksij Rempel            2025-05-05  2570  	case ID_REV_CHIP_ID_7800_:
d39f339d2603736 Oleksij Rempel            2025-05-05  2571  	case ID_REV_CHIP_ID_7850_:
d39f339d2603736 Oleksij Rempel            2025-05-05  2572  		if (!phydev)
d39f339d2603736 Oleksij Rempel            2025-05-05  2573  			return ERR_PTR(-ENODEV);
d39f339d2603736 Oleksij Rempel            2025-05-05  2574  
d39f339d2603736 Oleksij Rempel            2025-05-05  2575  		/* These use internal GMII-connected PHY */
d39f339d2603736 Oleksij Rempel            2025-05-05  2576  		dev->interface = PHY_INTERFACE_MODE_GMII;
d39f339d2603736 Oleksij Rempel            2025-05-05  2577  		phydev->is_internal = true;
d39f339d2603736 Oleksij Rempel            2025-05-05  2578  		return phydev;
d39f339d2603736 Oleksij Rempel            2025-05-05  2579  
d39f339d2603736 Oleksij Rempel            2025-05-05  2580  	default:
d39f339d2603736 Oleksij Rempel            2025-05-05  2581  		netdev_err(dev->net, "Unknown CHIP ID: 0x%08x\n", dev->chipid);
d39f339d2603736 Oleksij Rempel            2025-05-05  2582  		return ERR_PTR(-ENODEV);
d39f339d2603736 Oleksij Rempel            2025-05-05  2583  	}
d39f339d2603736 Oleksij Rempel            2025-05-05  2584  }
d39f339d2603736 Oleksij Rempel            2025-05-05  2585  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
