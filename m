Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5095E346FA0
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894363; cv=none; b=fAZ+wqBc6rNKign0HvaCUE2++qTUz7PbHmZNUVS4dRlNyqguYvZ+mdu6pXWq+cchkArqmOwzaFmln44a2Ez++ZsFEG/cS+4Ttmdd6o5IYFwRJymQV7u5J4471WFXtG+dO+z9sU0N9OxzBPKzpI2xrBPxUajU1aM+p7SHtwR30xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894363; c=relaxed/simple;
	bh=vKRtSkR4kIc8CYDy0m4SepD5IwvaaDCV9iuyOzCxCm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C4iCSmuUty1+nCICIYeLn58a9nc3QZe4aCRmlPOydXfFzlOs3kvnjTh/uRqm/Y0eAx+YA6DzPFy1H8t/YyiAvvxatR8d3/+b5a1s+1sFnX0ijwwbG7362W9MmX5TEKkxAEdI+Mk4+2tlmeDoMPBAw0e09TmFFQ+aeJ3/kPn0l9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhImIfsh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhImIfsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765894361; x=1797430361;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vKRtSkR4kIc8CYDy0m4SepD5IwvaaDCV9iuyOzCxCm0=;
  b=VhImIfsh2RLm7erM9BGoLjT/6WPi/DVE3ecUU0+XOS/q3u583u6fxp3m
   FnsRdZyksqkm2Mge+7zYrmH3st5lX7/pDJ8W8b6Za5Z9G3B4sgV5y94bA
   wM4RmDRiNc146Iz7YhWGmx0podRzCntA+l7KqvQ6t5M2T+EJeQR9rxX0Z
   EVtnMrOwMe5wjdxO/Fs8TdzlHnTOMcA1Ys79IeKcrkYAD2vtP7r7m0mWr
   LG5SqtV9aINIEZNjC0sjx5eO/GYaub5a+U4cQDyH7iF8cso0nRd8v8ilX
   oGH6epZvxO38/P4juxh0VIak1Y6whmjR0c296p7zj+bXyZwckiDsPXBGH
   w==;
X-CSE-ConnectionGUID: zlitGaUERCeJok2xodNKDA==
X-CSE-MsgGUID: xim5XUm/RmG4uptA9r9AoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71666667"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="71666667"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 06:12:38 -0800
X-CSE-ConnectionGUID: XUAg5Sb5RAC9NfvUfDYFlw==
X-CSE-MsgGUID: A527T3bWSXCQb2ZOmfALIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202213543"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Dec 2025 06:12:38 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVVn0-000000003Ha-3f7H;
	Tue, 16 Dec 2025 14:12:34 +0000
Date: Tue, 16 Dec 2025 22:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format
 string contains non-ascii character '\xe2'
Message-ID: <202512162219.p0QYUCTQ-lkp@intel.com>
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
CC: Jakub Kicinski <kuba@kernel.org>
CC: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
commit: e110bc82589752909e283ba5cbc160e0ab56c085 net: usb: lan78xx: Convert to PHYLINK for improved PHY and MAC management
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: sparc-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251216/202512162219.p0QYUCTQ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512162219.p0QYUCTQ-lkp@intel.com/

New smatch warnings:
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string contains non-ascii character '\xe2'

Old smatch warnings:
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string contains non-ascii character '\x93'
drivers/net/usb/lan78xx.c:2656 lan78xx_get_phy() warn: format string contains non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2656 lan78xx_get_phy() warn: format string contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2656 lan78xx_get_phy() warn: format string contains non-ascii character '\x93'
drivers/net/usb/lan78xx.c:2860 lan78xx_phy_init() error: we previously assumed 'phydev' could be null (see line 2848)
drivers/net/usb/lan78xx.c:2860 lan78xx_phy_init() warn: 'phydev' can also be NULL
drivers/net/usb/lan78xx.c:2862 lan78xx_phy_init() warn: 'phydev' can also be NULL
drivers/net/usb/lan78xx.c:3142 lan78xx_init_ltm() warn: missing unwind goto?

vim +2625 drivers/net/usb/lan78xx.c

e110bc82589752 Oleksij Rempel            2025-06-18  2607  
d39f339d260373 Oleksij Rempel            2025-05-05  2608  /**
e110bc82589752 Oleksij Rempel            2025-06-18  2609   * lan78xx_set_fixed_link() - Set fixed link configuration for LAN7801
d39f339d260373 Oleksij Rempel            2025-05-05  2610   * @dev: LAN78xx device
d39f339d260373 Oleksij Rempel            2025-05-05  2611   *
e110bc82589752 Oleksij Rempel            2025-06-18  2612   * Use fixed link configuration with 1 Gbps full duplex. This is used in special
e110bc82589752 Oleksij Rempel            2025-06-18  2613   * cases like EVB-KSZ9897-1, where LAN7801 acts as a USB-to-Ethernet interface
e110bc82589752 Oleksij Rempel            2025-06-18  2614   * to a switch without a visible PHY.
d39f339d260373 Oleksij Rempel            2025-05-05  2615   *
d39f339d260373 Oleksij Rempel            2025-05-05  2616   * Return: pointer to the registered fixed PHY, or ERR_PTR() on error.
d39f339d260373 Oleksij Rempel            2025-05-05  2617   */
e110bc82589752 Oleksij Rempel            2025-06-18  2618  static int lan78xx_set_fixed_link(struct lan78xx_net *dev)
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2619  {
e110bc82589752 Oleksij Rempel            2025-06-18  2620  	static const struct phylink_link_state state = {
89b36fb5e53244 Raghuram Chary J          2018-04-28  2621  		.speed = SPEED_1000,
89b36fb5e53244 Raghuram Chary J          2018-04-28  2622  		.duplex = DUPLEX_FULL,
89b36fb5e53244 Raghuram Chary J          2018-04-28  2623  	};
d39f339d260373 Oleksij Rempel            2025-05-05  2624  
d39f339d260373 Oleksij Rempel            2025-05-05 @2625  	netdev_info(dev->net,
e110bc82589752 Oleksij Rempel            2025-06-18  2626  		    "No PHY found on LAN7801 – using fixed link instead (e.g. EVB-KSZ9897-1)\n");
d39f339d260373 Oleksij Rempel            2025-05-05  2627  
e110bc82589752 Oleksij Rempel            2025-06-18  2628  	return phylink_set_fixed_link(dev->phylink, &state);
d39f339d260373 Oleksij Rempel            2025-05-05  2629  }
d39f339d260373 Oleksij Rempel            2025-05-05  2630  

:::::: The code at line 2625 was first introduced by commit
:::::: d39f339d2603736ff90b0b32d9aea3b954307fd5 net: usb: lan78xx: refactor PHY init to separate detection and MAC configuration

:::::: TO: Oleksij Rempel <o.rempel@pengutronix.de>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
