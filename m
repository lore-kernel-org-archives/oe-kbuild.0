Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C1364059
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jul 2026 17:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530931; cv=none; b=UKvKkP9lI2oAfL88uMbnKThSN2Ms2kjsvhwjVioQ59hukWt+8sL4c+ltHWn9RDYT+htYwmwuvolMCQlWIQjCLd8UBe8Pf5GBAK+wbhya0FR5rlX6c0Cyyj6HmungbcCqblcfd4kqWSOaknDlof3cJ075LXDNzhYsM3nx9L5Mkjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530931; c=relaxed/simple;
	bh=cjpJPNsJfd4Ldwne1dIBrZ6SLRd34sTBKs41mFWdQKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hBeA3zc4eihzT5N5bb1jKwt36dZYUi4vZb/b5EJsuV12d9EBRV+XRrVAcrSaKrUNsb6SyACqdAW5pNzUWsBq5fL51tag+r3sP3E03dWQd9qqPf0m1anyqYv7DQDBdiZogSP1hJrWXrIVGTdQ6bvSCrhEteumIXOVi1HlF345O/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eA36g0wi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eA36g0wi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783530930; x=1815066930;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cjpJPNsJfd4Ldwne1dIBrZ6SLRd34sTBKs41mFWdQKY=;
  b=eA36g0wiwcsynnN74+QOiBet3CB3/8pT0V4QyNYeNQSNB4MyJyiVYetc
   lU185gsv1rFUiGJnUOv9xwgNympkjAHdTfN9C42hSqORgUubdxEo+g37Q
   panGgy5NGmJ9klF+T+0fmEE0nmwfKhTzduVqJQrPl+/ErViWPNKUXVk49
   VTVhjYHVIf41X6GfygEYtjQGBtMoJiWWOJ3NFOduEHKzMCHIQqvFfJ1ST
   UCZV5LHzyAqJ6oRs6XMfAuCBro28mFBJBiY58TOuVZ1aD06h8GhRPmIcy
   GC65xKYseq92EV/b8327y95YXIVeIOKfGAG6PfUsDlwHTLU+wXumyyy4+
   g==;
X-CSE-ConnectionGUID: 2M8LHLJSQHiQtXrRKfXfqw==
X-CSE-MsgGUID: f/oBGfkSS1ypm7rxx/+FBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84222189"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84222189"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 10:15:29 -0700
X-CSE-ConnectionGUID: Xz9005apTjqkgT4yQtOu2A==
X-CSE-MsgGUID: 4bFD6mG+RCmJvE63b2rIVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="257941195"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 08 Jul 2026 10:15:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whVrp-00000000GfH-21x0;
	Wed, 08 Jul 2026 17:15:25 +0000
Date: Thu, 09 Jul 2026 01:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link()
 warn: format string contains non-ascii character '\xe2'
Message-ID: <202607090105.f68Om5DL-lkp@intel.com>
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
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: e110bc82589752909e283ba5cbc160e0ab56c085 net: usb: lan78xx: Convert=
 to PHYLINK for improved PHY and MAC management
date:   1 year, 1 month ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/2026=
0709/202607090105.f68Om5DL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved =
PHY and MAC management")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607090105.f68Om5DL-lkp@intel.com/

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
