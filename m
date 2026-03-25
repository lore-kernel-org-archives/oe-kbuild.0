Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791C4332919
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 09:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431076; cv=none; b=re9Y28thwfmXkm9dVu2lr15NlmCHsraSggEUQ+/7NSvlIvqsih4xtD0airyGGEtm9jUIeWdRcjr/Vfa96rUxOte1x405YVOeg+tWG03ys2z/qKGZO75kEuFrBYbV1FepR1nq062CC03DVcgSpN6YfL8NIEqspQLcMt12HEDr3hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431076; c=relaxed/simple;
	bh=/Ct2ww2jnPNV5AMCkUuC2XPWS4Uc4y6uAUt2AFW4q60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hDFG5r5RWR9yt9ObNoQ4W9yTRk6u9ni1X/oShz3JlIsrrcOzwRU5JS47N1tG3iNsMHcwQIT5IVQhxsdCoVVB58LTyLsZMMZPt1g1PTQTb/wbIgzf2uz3W7FQQDGnNouWJJNE/8xwbl/oRfZsDxHc8RQ8yxN40dmYHZa93qpFT7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvZ660RY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvZ660RY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774431074; x=1805967074;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/Ct2ww2jnPNV5AMCkUuC2XPWS4Uc4y6uAUt2AFW4q60=;
  b=bvZ660RYHNfT91yrZt1A7mMJ13wIXfFe8WdFCCyomAmJJHHi0Jj5jghF
   LtcG6t492QAwjMP52nw8CLaJmtDWqde3ueCBGzd1n3PimuTOi6h71Ayxn
   A3IRh00hpWfHbJOIDK8AETPGDZoF6W62SX+KQrhmOJDIs7SGUUimLYG3U
   yalqmPBoWiCNAZRRzGWjAOq+E7SX9tT1tb1wiIttSBjmKGXWvHlrJvW6K
   CUD47vguS7Mr4e0fWK+pg/A8lB6zZ5RjuPN2xon+9raIbrnUSL/fOBa5L
   gOr5DFhv4scuA+vCWN5ggfDP3f4sCioozhLXrsGZ5dmIT8Rus7zp3xtAH
   g==;
X-CSE-ConnectionGUID: WhpoDj3ORqSqoEFnVbrc6g==
X-CSE-MsgGUID: XiPa4k0OQeWgOqHyg9JpGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75431062"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75431062"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 02:31:14 -0700
X-CSE-ConnectionGUID: 8KFTzLKwTd6PhN46jni7lQ==
X-CSE-MsgGUID: 5y/K5HQAQ9qt4pO+5SNT7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="255128405"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Mar 2026 02:31:13 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5KZy-000000006Zf-1vFy;
	Wed, 25 Mar 2026 09:31:10 +0000
Date: Wed, 25 Mar 2026 17:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link()
 warn: format string contains non-ascii character '\xe2'
Message-ID: <202603251721.bSW13w4a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Oleksij Rempel <o.rempel@pengutronix.de>
CC: Jakub Kicinski <kuba@kernel.org>
CC: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: e110bc82589752909e283ba5cbc160e0ab56c085 net: usb: lan78xx: Convert=
 to PHYLINK for improved PHY and MAC management
date:   9 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-141-20260325 (https://download.01.org/0day-ci/archi=
ve/20260325/202603251721.bSW13w4a-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603251721.bSW13w4a-lkp@intel.com/

New smatch warnings:
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string=
 contains non-ascii character '\xe2'

Old smatch warnings:
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string=
 contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string=
 contains non-ascii character '\x93'
drivers/net/usb/lan78xx.c:2656 lan78xx_get_phy() warn: format string contai=
ns non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2656 lan78xx_get_phy() warn: format string contai=
ns non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2656 lan78xx_get_phy() warn: format string contai=
ns non-ascii character '\x93'
drivers/net/usb/lan78xx.c:2860 lan78xx_phy_init() error: we previously assu=
med 'phydev' could be null (see line 2848)
drivers/net/usb/lan78xx.c:2860 lan78xx_phy_init() warn: 'phydev' can also b=
e NULL
drivers/net/usb/lan78xx.c:2862 lan78xx_phy_init() warn: 'phydev' can also b=
e NULL
drivers/net/usb/lan78xx.c:3142 lan78xx_init_ltm() warn: missing unwind goto?

vim +2625 drivers/net/usb/lan78xx.c

e110bc82589752 Oleksij Rempel            2025-06-18  2607 =20
d39f339d260373 Oleksij Rempel            2025-05-05  2608  /**
e110bc82589752 Oleksij Rempel            2025-06-18  2609   * lan78xx_set_f=
ixed_link() - Set fixed link configuration for LAN7801
d39f339d260373 Oleksij Rempel            2025-05-05  2610   * @dev: LAN78xx=
 device
d39f339d260373 Oleksij Rempel            2025-05-05  2611   *
e110bc82589752 Oleksij Rempel            2025-06-18  2612   * Use fixed lin=
k configuration with 1 Gbps full duplex. This is used in special
e110bc82589752 Oleksij Rempel            2025-06-18  2613   * cases like EV=
B-KSZ9897-1, where LAN7801 acts as a USB-to-Ethernet interface
e110bc82589752 Oleksij Rempel            2025-06-18  2614   * to a switch w=
ithout a visible PHY.
d39f339d260373 Oleksij Rempel            2025-05-05  2615   *
d39f339d260373 Oleksij Rempel            2025-05-05  2616   * Return: point=
er to the registered fixed PHY, or ERR_PTR() on error.
d39f339d260373 Oleksij Rempel            2025-05-05  2617   */
e110bc82589752 Oleksij Rempel            2025-06-18  2618  static int lan78=
xx_set_fixed_link(struct lan78xx_net *dev)
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2619  {
e110bc82589752 Oleksij Rempel            2025-06-18  2620  	static const st=
ruct phylink_link_state state =3D {
89b36fb5e53244 Raghuram Chary J          2018-04-28  2621  		.speed =3D SPE=
ED_1000,
89b36fb5e53244 Raghuram Chary J          2018-04-28  2622  		.duplex =3D DU=
PLEX_FULL,
89b36fb5e53244 Raghuram Chary J          2018-04-28  2623  	};
d39f339d260373 Oleksij Rempel            2025-05-05  2624 =20
d39f339d260373 Oleksij Rempel            2025-05-05 @2625  	netdev_info(dev=
->net,
e110bc82589752 Oleksij Rempel            2025-06-18  2626  		    "No PHY fo=
und on LAN7801 =E2=80=93 using fixed link instead (e.g. EVB-KSZ9897-1)\n");
d39f339d260373 Oleksij Rempel            2025-05-05  2627 =20
e110bc82589752 Oleksij Rempel            2025-06-18  2628  	return phylink_=
set_fixed_link(dev->phylink, &state);
d39f339d260373 Oleksij Rempel            2025-05-05  2629  }
d39f339d260373 Oleksij Rempel            2025-05-05  2630 =20

:::::: The code at line 2625 was first introduced by commit
:::::: d39f339d2603736ff90b0b32d9aea3b954307fd5 net: usb: lan78xx: refactor=
 PHY init to separate detection and MAC configuration

:::::: TO: Oleksij Rempel <o.rempel@pengutronix.de>
:::::: CC: David S. Miller <davem@davemloft.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
