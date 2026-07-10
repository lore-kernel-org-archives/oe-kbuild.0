Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382E23955FF
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jul 2026 21:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783720711; cv=none; b=h1hOZhFy84r56cm45741MngYMG/tOP9fEffwR6rCBnNSXonttQoNO/ZfoNp+4owZQFH+Lq8VKEE4em81QqvYzlv4l1GD1MfCLzqLM/Se2gVcKSYI3IujgzLgqOlvQOUbNympQANb+jep07ims7KjaKlhdtW3okcclDLR0CTKqIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783720711; c=relaxed/simple;
	bh=2yktWbOksI+3Dq4jVy4DSwtIvSV5zyDWAJMTX3D9QH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=J9SfEdg0s2SrtyCXEG2QahiYS/4myG4qdLVLph+UkyhftY24Ca+acthzSEbKpoGahBe/cdAJyv5bSYfWlOOFGvHxRgPUbkAsvnaIoPfY/UXUH4iSzYl+us9/Slhl65FrAl2Mr5TARs++mifVB71OdpVAeGbJiGwj3Pz7yBT4WE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8LKjioH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8LKjioH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783720710; x=1815256710;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2yktWbOksI+3Dq4jVy4DSwtIvSV5zyDWAJMTX3D9QH4=;
  b=d8LKjioHaTLJG3iMbiUGG4I36PyMjqDua/6FKgXxHAKl6YYB4S/PHepL
   aFO1JZ4EzQLTJcThXDE0GZE7cUAwVR17A6k2I5HCMkZ6H+M4Cm7dBkM4u
   402VIfPL4OKV0ObNIlTfTdh/Wg0veTDdJpBmzfGOFfXFUvhzJtr9Pna61
   1oVYCUvZUVpINT1xEo5f8jCLnel6nwv+SV6X88tvmoG8u25r/CaqYVbN6
   +2xfUOGlDVYcn5QeOAZQtFgWfK4HFbeeMksgsJ1yhwRGChCLkd3nykAXg
   PXi0X0tTVOA0Le8GupnlhzaH6rFIOniUu+9uOprhLW2TjOY5fZ/Uq0QrW
   A==;
X-CSE-ConnectionGUID: QBv7QIr2SIyuiHmoR+qMpQ==
X-CSE-MsgGUID: iO2Yia4xQ/6fwcrdh/wteg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83401606"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83401606"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 14:58:30 -0700
X-CSE-ConnectionGUID: bY4sib3/Say+uu1g0f7Mzg==
X-CSE-MsgGUID: rpFrTFPcT2yypFFDGQpojA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253873583"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Jul 2026 14:58:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiJEn-00000000JRd-2F4j;
	Fri, 10 Jul 2026 21:58:25 +0000
Date: Sat, 11 Jul 2026 05:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link()
 warn: format string contains non-ascii character '\x93'
Message-ID: <202607110524.LxUIuFcc-lkp@intel.com>
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
head:   a635d6748234582ea287c5ffeae28b9b23f91c7e
commit: e110bc82589752909e283ba5cbc160e0ab56c085 net: usb: lan78xx: Convert=
 to PHYLINK for improved PHY and MAC management
date:   1 year, 1 month ago
:::::: branch date: 22 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/2026=
0711/202607110524.LxUIuFcc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved =
PHY and MAC management")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607110524.LxUIuFcc-lkp@intel.com/

New smatch warnings:
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string=
 contains non-ascii character '\x93'

Old smatch warnings:
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string=
 contains non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string=
 contains non-ascii character '\x80'
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
