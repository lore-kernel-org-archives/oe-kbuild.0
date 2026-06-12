Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9208A288AD
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 00:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781224027; cv=none; b=hoWX/gqvXxQZY2FHYvUfP5AxwH843zX+oBld0cGq9VslJjM06sa13bgamOtpRB+9YrGIbGKE9HPXdPYIiA5Bjihqo0Wl1MzypEIQmeMLx6xS9IA9fVlb0cxUrXpD5wNMcYfX5e2Qc1rAGZ2zGi9DNTlwJB58Xx4p1P4cwT4wptA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781224027; c=relaxed/simple;
	bh=8U4p4wUVfChyDOnPz5itq1Gre/uis7y8RC+G+XDH/jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=odSVhsrV6h0cSs/ZuqZq3MlBz8dGZKx95DHxivVlhJpbf86hW3yDZl+4k/sbPBU53abxdbE3Rq9uZmbwMUjjIpy5ZGtSX/NdGJ6hTuDE7SwuMNGpdrz2roDaJtLnZj1KGZYmdxZjwvhXUHVCQCinzkvKqUZRgPwoSUXwtHemi6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G05XuHd8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G05XuHd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781224025; x=1812760025;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8U4p4wUVfChyDOnPz5itq1Gre/uis7y8RC+G+XDH/jQ=;
  b=G05XuHd8/xkCqMcIYJLpcW/+Fkwcejzk68xDEA3FhW49D/LtBxPW9WyD
   U8eni7QiLr1J0WFNAqfjYQCeRAq2ZN6l1iFec6HaCWQJ3rT0BEgWqIvd/
   YWZVninb0SZOJtlFNDkbmc4SLWApA3oSFLYz5jIe8k0Yff7LJFkzM5K2R
   2rJ6dV1p07IxI6oeoI4NycwaIwDi9D/W73mCSiIcexfB8KWQg/bQreT4F
   ND498GDe0XbfoHriSw+RQWOV2VrOu5aZYpxruNz/RvLiKRBp7IJneplfr
   AqYAyu+Y5LCPUsZieScvdqnEsGL3C1pbv7r6tJckDBh3e0hZPQgED0OfZ
   g==;
X-CSE-ConnectionGUID: 3L/04r3oRwqf3tk1m/YHYw==
X-CSE-MsgGUID: jY69GK++TfKsk+329Aq82w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82060016"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82060016"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 17:27:05 -0700
X-CSE-ConnectionGUID: PSU2UtaAS+GKqFHQv2e8Cg==
X-CSE-MsgGUID: ycgMAaXWQVuXeQR8IQdJkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="245560989"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jun 2026 17:27:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXpjh-00000000O4k-2ZyW;
	Fri, 12 Jun 2026 00:27:01 +0000
Date: Fri, 12 Jun 2026 08:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link()
 warn: format string contains non-ascii character '\x80'
Message-ID: <202606120842.aVZULu7A-lkp@intel.com>
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
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: e110bc82589752909e283ba5cbc160e0ab56c085 net: usb: lan78xx: Convert=
 to PHYLINK for improved PHY and MAC management
date:   12 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/2026=
0612/202606120842.aVZULu7A-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved =
PHY and MAC management")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606120842.aVZULu7A-lkp@intel.com/

New smatch warnings:
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string=
 contains non-ascii character '\x80'

Old smatch warnings:
drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link() warn: format string=
 contains non-ascii character '\xe2'
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

e110bc825897529 Oleksij Rempel            2025-06-18  2607 =20
d39f339d2603736 Oleksij Rempel            2025-05-05  2608  /**
e110bc825897529 Oleksij Rempel            2025-06-18  2609   * lan78xx_set_=
fixed_link() - Set fixed link configuration for LAN7801
d39f339d2603736 Oleksij Rempel            2025-05-05  2610   * @dev: LAN78x=
x device
d39f339d2603736 Oleksij Rempel            2025-05-05  2611   *
e110bc825897529 Oleksij Rempel            2025-06-18  2612   * Use fixed li=
nk configuration with 1 Gbps full duplex. This is used in special
e110bc825897529 Oleksij Rempel            2025-06-18  2613   * cases like E=
VB-KSZ9897-1, where LAN7801 acts as a USB-to-Ethernet interface
e110bc825897529 Oleksij Rempel            2025-06-18  2614   * to a switch =
without a visible PHY.
d39f339d2603736 Oleksij Rempel            2025-05-05  2615   *
d39f339d2603736 Oleksij Rempel            2025-05-05  2616   * Return: poin=
ter to the registered fixed PHY, or ERR_PTR() on error.
d39f339d2603736 Oleksij Rempel            2025-05-05  2617   */
e110bc825897529 Oleksij Rempel            2025-06-18  2618  static int lan7=
8xx_set_fixed_link(struct lan78xx_net *dev)
55d7de9de6c30ad Woojung.Huh@microchip.com 2015-07-30  2619  {
e110bc825897529 Oleksij Rempel            2025-06-18  2620  	static const s=
truct phylink_link_state state =3D {
89b36fb5e532447 Raghuram Chary J          2018-04-28  2621  		.speed =3D SP=
EED_1000,
89b36fb5e532447 Raghuram Chary J          2018-04-28  2622  		.duplex =3D D=
UPLEX_FULL,
89b36fb5e532447 Raghuram Chary J          2018-04-28  2623  	};
d39f339d2603736 Oleksij Rempel            2025-05-05  2624 =20
d39f339d2603736 Oleksij Rempel            2025-05-05 @2625  	netdev_info(de=
v->net,
e110bc825897529 Oleksij Rempel            2025-06-18  2626  		    "No PHY f=
ound on LAN7801 =E2=80=93 using fixed link instead (e.g. EVB-KSZ9897-1)\n");
d39f339d2603736 Oleksij Rempel            2025-05-05  2627 =20
e110bc825897529 Oleksij Rempel            2025-06-18  2628  	return phylink=
_set_fixed_link(dev->phylink, &state);
d39f339d2603736 Oleksij Rempel            2025-05-05  2629  }
d39f339d2603736 Oleksij Rempel            2025-05-05  2630 =20

:::::: The code at line 2625 was first introduced by commit
:::::: d39f339d2603736ff90b0b32d9aea3b954307fd5 net: usb: lan78xx: refactor=
 PHY init to separate detection and MAC configuration

:::::: TO: Oleksij Rempel <o.rempel@pengutronix.de>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
