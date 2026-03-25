Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34575218E91
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 07:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774422484; cv=none; b=ejD/HKvnFoc+DrDs9TWPFcU5bXQuR75QjYl8lpoK6/xbC11vLhnHNxnnAklI5N029mj9svMG7Lr13UsqtHHqpTSnQuEpIbJgiPVfDmeCOkVBhdUc5D8W0iN+ePln4F8HZn5DJyg8pFScEplc9Swqe0d8dHFZOCzSLGz3DwZliKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774422484; c=relaxed/simple;
	bh=iDkEcwTYRZ65F4lcTMgyB+W69tYS7IWR5dQXj+FAu2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DX/qEJC6PsOL5lbxoJdZGQZmeJsklV+KGPs3FGuco0JpByDfu4VElW2qfMgnErMD/yaBUmkk7xuVx/jDbL/L14j0Pw89oGJx84cUkH46r7a9mnNQibWiWkNcsD3votUDi0tvLhZQkYYeYhs1iO1RIiN5tenyPK/+pU5WZWSVRIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYLzLYcx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYLzLYcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774422483; x=1805958483;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iDkEcwTYRZ65F4lcTMgyB+W69tYS7IWR5dQXj+FAu2w=;
  b=YYLzLYcxxRYHnYlbpiWg2gfx66qFYcAHArgSCLc0OVSD4q4vxMCG6OKR
   kYEdiA/XQB2OxwXcnDQu1MALZLjH15KJ2uLzWTm4UiXFiWbPXsEkGXufv
   kIFj+vn6+dZ8c4i8r6NL+liTypJEh3KPow/WnrMdl97h5fAQfroi5qw2e
   9g9TKXPySGukY4MlsTLTOmHSOHy1TN2KwV8mdPZYBQXOCp9koq9v9aivu
   Vr8kEnrOGn/cYaHW2iTFYEAGT6FS3Ozk0DPc8UlK8CS4RTC2KvK1GHYHj
   KGwBi3t8EUwbo086+Ih0Ad2P/O1mOsLtdkv7Pa9Z48Xi+Td0A1oC5RnV5
   A==;
X-CSE-ConnectionGUID: DC4Ekw8rTdKGOE4JcZixKQ==
X-CSE-MsgGUID: ckBbsjioS2+NhIfJUeE9hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86930149"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86930149"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 00:08:03 -0700
X-CSE-ConnectionGUID: dqIY+6xMS7yDSM8mS8g5sQ==
X-CSE-MsgGUID: RuAgUDxaRnSXTXYHJtSzVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229061475"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Mar 2026 00:08:02 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5ILP-000000006O7-0E6q;
	Wed, 25 Mar 2026 07:07:59 +0000
Date: Wed, 25 Mar 2026 15:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn:
 format string contains non-ascii character '\x93'
Message-ID: <202603251530.1jhCKTrH-lkp@intel.com>
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
CC: Thangaraj Samynathan <thangaraj.s@microchip.com>

Hi Oleksij,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: d39f339d2603736ff90b0b32d9aea3b954307fd5 net: usb: lan78xx: refacto=
r PHY init to separate detection and MAC configuration
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20260325 (https://download.01.org/0day-ci/archi=
ve/20260325/202603251530.1jhCKTrH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603251530.1jhCKTrH-lkp@intel.com/

New smatch warnings:
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contai=
ns non-ascii character '\x93'

Old smatch warnings:
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format st=
ring contains non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format st=
ring contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format st=
ring contains non-ascii character '\x93'
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contai=
ns non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contai=
ns non-ascii character '\x80'
drivers/net/usb/lan78xx.c:3005 lan78xx_init_ltm() warn: missing unwind goto?

vim +2560 drivers/net/usb/lan78xx.c

d39f339d2603736 Oleksij Rempel            2025-05-05  2534 =20
d39f339d2603736 Oleksij Rempel            2025-05-05  2535  /**
d39f339d2603736 Oleksij Rempel            2025-05-05  2536   * lan78xx_get_=
phy() - Probe or register PHY device and set interface mode
d39f339d2603736 Oleksij Rempel            2025-05-05  2537   * @dev: LAN78x=
x device structure
d39f339d2603736 Oleksij Rempel            2025-05-05  2538   *
d39f339d2603736 Oleksij Rempel            2025-05-05  2539   * This functio=
n attempts to find a PHY on the MDIO bus. If no PHY is found
d39f339d2603736 Oleksij Rempel            2025-05-05  2540   * and the chip=
 is LAN7801, it registers a fixed PHY as fallback. It also
d39f339d2603736 Oleksij Rempel            2025-05-05  2541   * sets dev->in=
terface based on chip ID and detected PHY type.
d39f339d2603736 Oleksij Rempel            2025-05-05  2542   *
d39f339d2603736 Oleksij Rempel            2025-05-05  2543   * Return: a va=
lid PHY device pointer, or ERR_PTR() on failure.
d39f339d2603736 Oleksij Rempel            2025-05-05  2544   */
d39f339d2603736 Oleksij Rempel            2025-05-05  2545  static struct p=
hy_device *lan78xx_get_phy(struct lan78xx_net *dev)
d39f339d2603736 Oleksij Rempel            2025-05-05  2546  {
3b51cc75eba28a7 Colin Ian King            2018-02-01  2547  	struct phy_dev=
ice *phydev;
55d7de9de6c30ad Woojung.Huh@microchip.com 2015-07-30  2548 =20
d39f339d2603736 Oleksij Rempel            2025-05-05  2549  	/* Attempt to =
locate a PHY on the MDIO bus */
ce85e13ad6ef47d Woojung.Huh@microchip.com 2015-09-16  2550  	phydev =3D phy=
_find_first(dev->mdiobus);
d39f339d2603736 Oleksij Rempel            2025-05-05  2551 =20
d39f339d2603736 Oleksij Rempel            2025-05-05  2552  	switch (dev->c=
hipid) {
d39f339d2603736 Oleksij Rempel            2025-05-05  2553  	case ID_REV_CH=
IP_ID_7801_:
d39f339d2603736 Oleksij Rempel            2025-05-05  2554  		if (phydev) {
d39f339d2603736 Oleksij Rempel            2025-05-05  2555  			/* External =
RGMII PHY detected */
d39f339d2603736 Oleksij Rempel            2025-05-05  2556  			dev->interfa=
ce =3D PHY_INTERFACE_MODE_RGMII_ID;
d39f339d2603736 Oleksij Rempel            2025-05-05  2557  			phydev->is_i=
nternal =3D false;
d39f339d2603736 Oleksij Rempel            2025-05-05  2558 =20
d39f339d2603736 Oleksij Rempel            2025-05-05  2559  			if (!phydev-=
>drv)
d39f339d2603736 Oleksij Rempel            2025-05-05 @2560  				netdev_warn=
(dev->net,
d39f339d2603736 Oleksij Rempel            2025-05-05  2561  					    "PHY d=
river not found =E2=80=93 assuming RGMII delays are on PCB or strapped for =
the PHY\n");
d39f339d2603736 Oleksij Rempel            2025-05-05  2562 =20
d39f339d2603736 Oleksij Rempel            2025-05-05  2563  			return phyde=
v;
ce85e13ad6ef47d Woojung.Huh@microchip.com 2015-09-16  2564  		}
d39f339d2603736 Oleksij Rempel            2025-05-05  2565 =20
89b36fb5e532447 Raghuram Chary J          2018-04-28  2566  		dev->interfac=
e =3D PHY_INTERFACE_MODE_RGMII;
d39f339d2603736 Oleksij Rempel            2025-05-05  2567  		/* No PHY fou=
nd =E2=80=93 fallback to fixed PHY (e.g. KSZ switch board) */
d39f339d2603736 Oleksij Rempel            2025-05-05  2568  		return lan78x=
x_register_fixed_phy(dev);
d39f339d2603736 Oleksij Rempel            2025-05-05  2569 =20
d39f339d2603736 Oleksij Rempel            2025-05-05  2570  	case ID_REV_CH=
IP_ID_7800_:
d39f339d2603736 Oleksij Rempel            2025-05-05  2571  	case ID_REV_CH=
IP_ID_7850_:
d39f339d2603736 Oleksij Rempel            2025-05-05  2572  		if (!phydev)
d39f339d2603736 Oleksij Rempel            2025-05-05  2573  			return ERR_P=
TR(-ENODEV);
d39f339d2603736 Oleksij Rempel            2025-05-05  2574 =20
d39f339d2603736 Oleksij Rempel            2025-05-05  2575  		/* These use =
internal GMII-connected PHY */
d39f339d2603736 Oleksij Rempel            2025-05-05  2576  		dev->interfac=
e =3D PHY_INTERFACE_MODE_GMII;
d39f339d2603736 Oleksij Rempel            2025-05-05  2577  		phydev->is_in=
ternal =3D true;
d39f339d2603736 Oleksij Rempel            2025-05-05  2578  		return phydev;
d39f339d2603736 Oleksij Rempel            2025-05-05  2579 =20
d39f339d2603736 Oleksij Rempel            2025-05-05  2580  	default:
d39f339d2603736 Oleksij Rempel            2025-05-05  2581  		netdev_err(de=
v->net, "Unknown CHIP ID: 0x%08x\n", dev->chipid);
d39f339d2603736 Oleksij Rempel            2025-05-05  2582  		return ERR_PT=
R(-ENODEV);
d39f339d2603736 Oleksij Rempel            2025-05-05  2583  	}
d39f339d2603736 Oleksij Rempel            2025-05-05  2584  }
d39f339d2603736 Oleksij Rempel            2025-05-05  2585 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
