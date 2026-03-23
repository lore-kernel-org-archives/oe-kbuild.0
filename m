Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D14E1A08A3
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 14:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276245; cv=none; b=akpovslqsqzxmfnW5aCXxzT47juQn1WL47kNTIsLelzWHAjSElOd/GjCRb1Tk9JB2QzTu3fJbgC2ByfaK7wOLDlL4u9zhgWW1bT/HrWuhD42QFjg3D0v1ndg8qw8M6x0S4zwm2CK8x9carmfzk9s4Hv7zDJK3nfm/lil/eJE6R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276245; c=relaxed/simple;
	bh=oSEwt7Eg0ts2f0643poCrn4o8GQYQVZNO9DWSr7qvtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RdeC05NYvkkfPYHc/Eolj5EG83N3uJ2vfPRfHBMk3xieOmEZ6z0/6y7hrcUZIsk98gMaTGk3UZmQUOlALmsd3gGenDfsfXou0Q4SKLDHYp5P9+ZIyQ3Crg3AICCVofUT2xQAsdmbKN1yJhEMciiFyEMBVsigfRmCKxu4IV1tqXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kj1GlrD5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kj1GlrD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774276243; x=1805812243;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oSEwt7Eg0ts2f0643poCrn4o8GQYQVZNO9DWSr7qvtY=;
  b=kj1GlrD5o0+YLHmreaAB033ACxHYV0px3bgTerL8IfzorKDIn6dzVWGh
   6GHsfRq6FUpWbvXv0LiX4uMtkxkMNbh2MF9Zz4ZddTbzsmIDzCbqUXaX3
   4jMB1kp7pcQrPIw6OKlhX+x6lfj9JVGDhvr5nzDsN6A04AFUWm5V6+EL9
   JsZtReeNAv0VLqfM5bK7S3hSAzkbqaXOdSa2fVkPvZOxoJqfYgGFJBAmz
   qTh/UCHzsau6pjvhA4lAPUIqTc3MTOIv6eM+ZutXJHsl7fCHTCQvne70e
   t4Cnibp+rWfWgtFnAcAKRNBVOipN+wldOMgns2/aTQACvXWh7BRHbzfOU
   g==;
X-CSE-ConnectionGUID: FD2Ls6nqSKuixw0wzOin0g==
X-CSE-MsgGUID: Asz+0iE5QK6eoh/KOW+rqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="62831841"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="62831841"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 07:30:43 -0700
X-CSE-ConnectionGUID: kLyjPa0tSyK1qtxzsCZVlw==
X-CSE-MsgGUID: taVfhugGTKSoFdVvUnNiaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223230972"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Mar 2026 07:30:42 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4gIh-0000000015X-04pS;
	Mon, 23 Mar 2026 14:30:39 +0000
Date: Mon, 23 Mar 2026 22:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/usb/lan78xx.c:2625 lan78xx_set_fixed_link()
 warn: format string contains non-ascii character '\x93'
Message-ID: <202603232251.qcqvqucH-lkp@intel.com>
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
head:   c369299895a591d96745d6492d4888259b004a9e
commit: e110bc82589752909e283ba5cbc160e0ab56c085 net: usb: lan78xx: Convert=
 to PHYLINK for improved PHY and MAC management
date:   9 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 9 months ago
config: sparc64-randconfig-r071-20260323 (https://download.01.org/0day-ci/a=
rchive/20260323/202603232251.qcqvqucH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603232251.qcqvqucH-lkp@intel.com/

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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
