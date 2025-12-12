Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7C9252292
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765547341; cv=none; b=gaPvuihP8fTRxorc47MPu8MVt9UH1nZO7yMj0um0VLpbh/QTp8bdJNgNyOKIpe28gGL9k3nh/02QrTmeytyXck/lxRvEROuICwqsQLzAH4YCYQr0kUTt5hls1J2ZPSkUWQ2awozJZrBkdiFSsTEeYZ4Jj9RRHGN9n92MANm/M1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765547341; c=relaxed/simple;
	bh=2ij+wpGsp4r6o2VgYdjL77V9hq0EWYdtsaxnIxS9IHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RkpSnhzY5/yOsOBhqM5/crHwa07P8O/mGv2cToCzjpqi8VlOP11+wvFAJ/LzE8tfL5wmHSYiOK9QuizlqaQcpP2bhXoBEdr8G6sZpXcPPsXJQBfdry42VCzfh+72Z1e8PmiKY0/7edEAoDa5uM+ktFLkwmc86LEdLAN1mJY+bg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFjxGa2b; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFjxGa2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765547340; x=1797083340;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2ij+wpGsp4r6o2VgYdjL77V9hq0EWYdtsaxnIxS9IHY=;
  b=aFjxGa2bbCWBZqeXhfYa2BCI3NGd2jSRkK4G1RgVJPdr8WC5fiOG6Kkj
   9/RGKJFfhiuvZYt/mMVBFWIKR2LtMMJxZt9teXzpLOKAWK42zJvAE6PI4
   +4YVRbGRnRrRrIqrZJcOqvStyYAeAN14MlGHLR/SNzrV92YmzvsU/B9h9
   /5BQxashr0cTzLiCIAdUhFaXMSkDoiTeLLHJ4kV7fwyX2vcArq0UdYD2k
   1PBd5b79AQQH/JyYA3NdC/cduwJ8asRGSpyv2DBSfoEveArAGZsbDfCVI
   qn9bpPZQ+Q09LgrTNagxG5Y8QJrMnNhyfKFPoUfQJTHBrU9L455MQwFZD
   Q==;
X-CSE-ConnectionGUID: r6V7QSgrQXaAJu3L90vIEg==
X-CSE-MsgGUID: q7epU9k9S8qwn6VS8IrG4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78664205"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78664205"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 05:48:59 -0800
X-CSE-ConnectionGUID: iVpqG9mjQE2WAo1K465LSQ==
X-CSE-MsgGUID: 2YGMzK5JQdeZTIkh8KHInA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197159204"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 05:48:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU3Vw-0000000067z-19Cu;
	Fri, 12 Dec 2025 13:48:56 +0000
Date: Fri, 12 Dec 2025 21:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format
 string contains non-ascii character '\x93'
Message-ID: <202512122152.dX19tAJ7-lkp@intel.com>
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
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: e110bc82589752909e283ba5cbc160e0ab56c085 net: usb: lan78xx: Convert to PHYLINK for improved PHY and MAC management
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122152.dX19tAJ7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512122152.dX19tAJ7-lkp@intel.com/

New smatch warnings:
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string contains non-ascii character '\x93'

Old smatch warnings:
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string contains non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string contains non-ascii character '\x80'
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
