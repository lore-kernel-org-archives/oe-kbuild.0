Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FA3285406
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 02:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406270; cv=none; b=t3NSdTqiCwU6rS69wJlgPi8lb+npfPW0H60ErIshDqvKuKPldr/OGPPgRRzSiucGSdygts0Lo13dmMlkqzpr3VgW9gVa+jjt8rL9VlZTTiqe5/0/xhzfGoSYwwRRzJrqBaNE8IDlgInz38czbjg4g2gDR5Cq/12q2Kk2WylNwEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406270; c=relaxed/simple;
	bh=/h7ILiNq2oejDVX7zwVUm3pI4SvIIRbpSFIJ4SdocQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mlaT1TbCt7+YNF75HDFmIUdE2EY2yY3apNyBI/CASm91EKMZtvUODQjx37NtOKxf21w10VSSwKiZ3V8SmONT+K+n3l+fgI2fkOJnLUnbK1DSICBDXux/h+tlOseO00qBN6uXfoT45hhv2kLQmfwfkNDKFVkifpWBo6IldTSA50s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+X5aY37; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+X5aY37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774406269; x=1805942269;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/h7ILiNq2oejDVX7zwVUm3pI4SvIIRbpSFIJ4SdocQ8=;
  b=C+X5aY37gbRaZEJQZjQFKY5mqIA3F7+/wrqhLd1uviVR0oYp6efAcQzr
   3gYC4RmLVInFLZoMKSyqZxfsz51d69b8ZDYQv7cOh+ESZE8ubM+ptQP+j
   PAz0kw06NySTiVT/ROGzDLnxZMA6n+PyRmQlNcmnZ2SxwmfH7QEyX8i+z
   CF2gcpmaxWX0PM9OIL7yGx04OHfUDWqat8D3c8dYRi4TAgn/rjW6bRwc5
   /gcDY/NU3FLjyT9IAKmTtCyA9dSp0jym8/ozFdDp1MCT5z/70DeAndQ7W
   y6PmxGFbDAslrCRK5kqd1XnkoGluzwecfhtTvD/dHR4qSOXe4+7blceGB
   g==;
X-CSE-ConnectionGUID: DH1sW3QVQU+qP5jwdcdV0Q==
X-CSE-MsgGUID: aW7XfDV1Qk2tnfcbDsOKag==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93012431"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="93012431"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 19:37:47 -0700
X-CSE-ConnectionGUID: zyeKRAz8TqqImi3pc1dBeQ==
X-CSE-MsgGUID: V3k7A93nR3aSDAk7EEPNYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="223742254"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Mar 2026 19:37:43 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5E7o-000000005nD-0rYy;
	Wed, 25 Mar 2026 02:37:40 +0000
Date: Wed, 25 Mar 2026 10:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn:
 format string contains non-ascii character '\x80'
Message-ID: <202603251008.krRpN4vm-lkp@intel.com>
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
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20260325 (https://download.01.org/0day-ci/archi=
ve/20260325/202603251008.krRpN4vm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603251008.krRpN4vm-lkp@intel.com/

New smatch warnings:
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contai=
ns non-ascii character '\x80'

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
ns non-ascii character '\x93'
drivers/net/usb/lan78xx.c:3005 lan78xx_init_ltm() warn: missing unwind goto?

vim +2560 drivers/net/usb/lan78xx.c

d39f339d260373 Oleksij Rempel            2025-05-05  2534 =20
d39f339d260373 Oleksij Rempel            2025-05-05  2535  /**
d39f339d260373 Oleksij Rempel            2025-05-05  2536   * lan78xx_get_p=
hy() - Probe or register PHY device and set interface mode
d39f339d260373 Oleksij Rempel            2025-05-05  2537   * @dev: LAN78xx=
 device structure
d39f339d260373 Oleksij Rempel            2025-05-05  2538   *
d39f339d260373 Oleksij Rempel            2025-05-05  2539   * This function=
 attempts to find a PHY on the MDIO bus. If no PHY is found
d39f339d260373 Oleksij Rempel            2025-05-05  2540   * and the chip =
is LAN7801, it registers a fixed PHY as fallback. It also
d39f339d260373 Oleksij Rempel            2025-05-05  2541   * sets dev->int=
erface based on chip ID and detected PHY type.
d39f339d260373 Oleksij Rempel            2025-05-05  2542   *
d39f339d260373 Oleksij Rempel            2025-05-05  2543   * Return: a val=
id PHY device pointer, or ERR_PTR() on failure.
d39f339d260373 Oleksij Rempel            2025-05-05  2544   */
d39f339d260373 Oleksij Rempel            2025-05-05  2545  static struct ph=
y_device *lan78xx_get_phy(struct lan78xx_net *dev)
d39f339d260373 Oleksij Rempel            2025-05-05  2546  {
3b51cc75eba28a Colin Ian King            2018-02-01  2547  	struct phy_devi=
ce *phydev;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2548 =20
d39f339d260373 Oleksij Rempel            2025-05-05  2549  	/* Attempt to l=
ocate a PHY on the MDIO bus */
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2550  	phydev =3D phy_=
find_first(dev->mdiobus);
d39f339d260373 Oleksij Rempel            2025-05-05  2551 =20
d39f339d260373 Oleksij Rempel            2025-05-05  2552  	switch (dev->ch=
ipid) {
d39f339d260373 Oleksij Rempel            2025-05-05  2553  	case ID_REV_CHI=
P_ID_7801_:
d39f339d260373 Oleksij Rempel            2025-05-05  2554  		if (phydev) {
d39f339d260373 Oleksij Rempel            2025-05-05  2555  			/* External R=
GMII PHY detected */
d39f339d260373 Oleksij Rempel            2025-05-05  2556  			dev->interfac=
e =3D PHY_INTERFACE_MODE_RGMII_ID;
d39f339d260373 Oleksij Rempel            2025-05-05  2557  			phydev->is_in=
ternal =3D false;
d39f339d260373 Oleksij Rempel            2025-05-05  2558 =20
d39f339d260373 Oleksij Rempel            2025-05-05  2559  			if (!phydev->=
drv)
d39f339d260373 Oleksij Rempel            2025-05-05 @2560  				netdev_warn(=
dev->net,
d39f339d260373 Oleksij Rempel            2025-05-05  2561  					    "PHY dr=
iver not found =E2=80=93 assuming RGMII delays are on PCB or strapped for t=
he PHY\n");
d39f339d260373 Oleksij Rempel            2025-05-05  2562 =20
d39f339d260373 Oleksij Rempel            2025-05-05  2563  			return phydev;
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2564  		}
d39f339d260373 Oleksij Rempel            2025-05-05  2565 =20
89b36fb5e53244 Raghuram Chary J          2018-04-28  2566  		dev->interface=
 =3D PHY_INTERFACE_MODE_RGMII;
d39f339d260373 Oleksij Rempel            2025-05-05  2567  		/* No PHY foun=
d =E2=80=93 fallback to fixed PHY (e.g. KSZ switch board) */
d39f339d260373 Oleksij Rempel            2025-05-05  2568  		return lan78xx=
_register_fixed_phy(dev);
d39f339d260373 Oleksij Rempel            2025-05-05  2569 =20
d39f339d260373 Oleksij Rempel            2025-05-05  2570  	case ID_REV_CHI=
P_ID_7800_:
d39f339d260373 Oleksij Rempel            2025-05-05  2571  	case ID_REV_CHI=
P_ID_7850_:
d39f339d260373 Oleksij Rempel            2025-05-05  2572  		if (!phydev)
d39f339d260373 Oleksij Rempel            2025-05-05  2573  			return ERR_PT=
R(-ENODEV);
d39f339d260373 Oleksij Rempel            2025-05-05  2574 =20
d39f339d260373 Oleksij Rempel            2025-05-05  2575  		/* These use i=
nternal GMII-connected PHY */
d39f339d260373 Oleksij Rempel            2025-05-05  2576  		dev->interface=
 =3D PHY_INTERFACE_MODE_GMII;
d39f339d260373 Oleksij Rempel            2025-05-05  2577  		phydev->is_int=
ernal =3D true;
d39f339d260373 Oleksij Rempel            2025-05-05  2578  		return phydev;
d39f339d260373 Oleksij Rempel            2025-05-05  2579 =20
d39f339d260373 Oleksij Rempel            2025-05-05  2580  	default:
d39f339d260373 Oleksij Rempel            2025-05-05  2581  		netdev_err(dev=
->net, "Unknown CHIP ID: 0x%08x\n", dev->chipid);
d39f339d260373 Oleksij Rempel            2025-05-05  2582  		return ERR_PTR=
(-ENODEV);
d39f339d260373 Oleksij Rempel            2025-05-05  2583  	}
d39f339d260373 Oleksij Rempel            2025-05-05  2584  }
d39f339d260373 Oleksij Rempel            2025-05-05  2585 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
