Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C07C29A2
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 04:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765600261; cv=none; b=vFqXf+9xwO2C7Rny5tIU2Ad4Yg6l3c++hnu7ud1e25GincZWZJ+bJHw+zmVqpRtQ2xgovQeTx+2pvg3xLub0ZpRsmWtzR+iNGA6ycbYw0heDK/JmWagHOzt5dQk+ZG2H0YilknTlHuPIExb2+V/HWfH/eeaHB3IIRRClIyUzfK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765600261; c=relaxed/simple;
	bh=CnKI5/69UhEoib0RTIMjxJgGeMuSsSohH1d/pQFXOBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N7zze3Uk51dEC3n87iKgx8Md1txJ5RwYlnqKAQqQh3XSz7tawOdzTGGafq09RyNPkSnNswTyZGTrhPmUsjLeV0Ifp5/sjKnwfjAXG0CzUhVhtpN4sqi1UVCEp7KeKR3Mtmlu35+Clqqx3St7jS5Lj4F/I7pLsfWABTGmlSkgSnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWA6f/0M; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWA6f/0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765600260; x=1797136260;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CnKI5/69UhEoib0RTIMjxJgGeMuSsSohH1d/pQFXOBA=;
  b=iWA6f/0McpmlQ8znx7VGqncvtYOHtbbX0mm5iTITcGQD/BII3ishNFIu
   5MbkRZtBEmNlm8Tdmq8UqOjMG8A0Gx90s4QMSz9fPIDBQtIxIaegSJAdf
   fjyhUG/NhXDDJ1D4J8LCIqgQ5M9gpE9cqO+/W9Ol7lqutvKaSDxW4TWSV
   4e0qZReByBWvQZNZnoM5AQDRvMEVvHFcPaZJU0QuU5CGATuHTTZvN+YPm
   oH8QDu2BSlk/r6Fmz864mSpCu7Wsx2U932Mja78+lWz8dE8U+sGQd0/hr
   kiMy2niIESVajFhz/rMAmi+LIHOM3prrxR8MO1ZwUUVjDYgiFeyWZLFQF
   w==;
X-CSE-ConnectionGUID: 4p3jG0EHRQWK+/8FtCLblQ==
X-CSE-MsgGUID: RLvVncqXRKiada1pMMBD7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67638579"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67638579"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 20:31:00 -0800
X-CSE-ConnectionGUID: +VI1cGXnQ2e+U7Hlq44n/g==
X-CSE-MsgGUID: xQH2/bSNRPyuIyCWdJv+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197149554"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2025 20:30:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUHHU-00000000734-37wJ;
	Sat, 13 Dec 2025 04:30:56 +0000
Date: Sat, 13 Dec 2025 12:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string
 contains non-ascii character '\xe2'
Message-ID: <202512131217.A5BOFfmy-lkp@intel.com>
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
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: d39f339d2603736ff90b0b32d9aea3b954307fd5 net: usb: lan78xx: refactor PHY init to separate detection and MAC configuration
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131217.A5BOFfmy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131217.A5BOFfmy-lkp@intel.com/

New smatch warnings:
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contains non-ascii character '\xe2'

Old smatch warnings:
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format string contains non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format string contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format string contains non-ascii character '\x93'
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contains non-ascii character '\x93'
drivers/net/usb/lan78xx.c:3005 lan78xx_init_ltm() warn: missing unwind goto?

vim +2560 drivers/net/usb/lan78xx.c

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
