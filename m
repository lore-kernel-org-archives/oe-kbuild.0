Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E437B3F2
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 16:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999271; cv=none; b=CYycLxqc3DFa9d2s9CDzGJqHK0bDJ6KEB7oYhRp2CbJa6EhRAJlWsUzd/LDgAph1MhqSS5Qk68k7IuQcZgqINfwaazwCZCXuCS9i8HSESVmSe1y6PNFLJwRZeFM8m5AkFGftK9Ohxj4moNKM1w+P8BbWzEMXZHHoah+gSBHeVg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999271; c=relaxed/simple;
	bh=VUhC/sVTOmOIyCd961i7UtJ68A3ISicVli7U+o61vgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CwfZmenyrkHsk9xngN4mT9zuwJnMAdC1M5Mi6R8jsxeP+t428ZjBmibRAyyvxiA4Nlded9K+AFnENpYy7m7O4e7/Xmf5FUCRW0q05PNXEUJcwnc+/gqYgimXmfAX990heaZjuZ4um8h/BghOGgT+0LTwYgUe9s1EB8+k8JscUS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkaIy8J+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkaIy8J+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777999270; x=1809535270;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VUhC/sVTOmOIyCd961i7UtJ68A3ISicVli7U+o61vgw=;
  b=PkaIy8J+NGxP0dFTRqfcmvHO29wgbozRsxY0WP+iep4jsDucts/8cAdo
   bmpJhWWaMlg51AsT6CGTKO+Sn/rAqEKBQUSmY5gM402MBpvIBDgqd3JQt
   Y0pp3HqvC2JRymu2VTxDAnibQAB/qceXa9uhmgh9IdoDbHfk2Pkw9AzeE
   vZMJMRG87jzdrtEtH2owvqC1TrPWR6dxM4fGJ5knHJ3jJL5gRdlPFEsR+
   pu28Oo7UTipGi924lcdYapAFuWIpsyrnfU3St6ERyMOt0SnqX4k8kgUF6
   JRa4vQi5LJQquwAAMiKlFvDBTNTfTKeQ6cZ4Ou29OklTWZ3Px7Pyrvq1x
   A==;
X-CSE-ConnectionGUID: H+L3XuRLRgehlzt34fMLvQ==
X-CSE-MsgGUID: /zGQiJJzSiWGKkcJZRjERw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104326266"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="104326266"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 09:41:09 -0700
X-CSE-ConnectionGUID: SKC9pt/JTxmgsba3xs8lMQ==
X-CSE-MsgGUID: 6I4WJTUZToCevy3+ZNsk/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="236118978"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 May 2026 09:41:08 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKIpV-000000000IJ-2Upa;
	Tue, 05 May 2026 16:41:05 +0000
Date: Wed, 06 May 2026 00:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/spi/spi-aspeed-smc.c:980:2-7: opportunity for
 str_yes_no(found)
Message-ID: <202605060034.VhknD6nr-lkp@intel.com>
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
TO: "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
commit: 31dcc7e1f8a9377d8fd9f967f84c121c5ba8f89c spi: aspeed: Update clock =
selection strategy
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-r051-20260505 (https://download.01.org/0day-ci/archi=
ve/20260506/202605060034.VhknD6nr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 31dcc7e1f8a9 ("spi: aspeed: Update clock selection strategy")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605060034.VhknD6nr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   drivers/spi/spi-aspeed-smc.c:560:12-43: opportunity for str_read_write(o=
p -> data . dir =3D=3D SPI_MEM_DATA_IN)
>> drivers/spi/spi-aspeed-smc.c:980:2-7: opportunity for str_yes_no(found)
   drivers/spi/spi-aspeed-smc.c:1026:2-7: opportunity for str_yes_no(found)
   drivers/spi/spi-aspeed-smc.c:1066:2-7: opportunity for str_yes_no(found)

vim +980 drivers/spi/spi-aspeed-smc.c

eeaec1ea05c0e0 C=C3=A9dric Le Goater 2022-05-09  952 =20
eeaec1ea05c0e0 C=C3=A9dric Le Goater 2022-05-09  953  #define ASPEED_SPI_HC=
LK_DIV(i) \
eeaec1ea05c0e0 C=C3=A9dric Le Goater 2022-05-09  954  	(aspeed_spi_hclk_div=
s[(i) - 1] << CTRL_FREQ_SEL_SHIFT)
eeaec1ea05c0e0 C=C3=A9dric Le Goater 2022-05-09  955 =20
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  956  /* Transfer maximum clock =
frequency to register setting */
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  957  static u32 aspeed_get_clk_=
div_ast2400(struct aspeed_spi_chip *chip,
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  958  				      u32 max_hz)
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  959  {
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  960  	struct device *dev =3D ch=
ip->aspi->dev;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  961  	u32 hclk_clk =3D chip->as=
pi->clk_freq;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  962  	u32 div_ctl =3D 0;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  963  	u32 i;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  964  	bool found =3D false;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  965 =20
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  966  	/* FMC/SPIR10[11:8] */
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  967  	for (i =3D 1; i <=3D ARRA=
Y_SIZE(aspeed_spi_hclk_divs); i++) {
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  968  		if (hclk_clk / i <=3D ma=
x_hz) {
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  969  			found =3D true;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  970  			break;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  971  		}
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  972  	}
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  973 =20
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  974  	if (found) {
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  975  		div_ctl =3D ASPEED_SPI_H=
CLK_DIV(i);
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  976  		chip->clk_freq =3D hclk_=
clk / i;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  977  	}
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  978 =20
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  979  	dev_dbg(dev, "found: %s, =
hclk: %d, max_clk: %d\n",
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01 @980  		found ? "yes" : "no", hc=
lk_clk, max_hz);
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  981 =20
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  982  	if (found) {
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  983  		dev_dbg(dev, "h_div: 0x%=
08x, speed: %d\n",
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  984  			div_ctl, chip->clk_freq=
);
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  985  	}
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  986 =20
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  987  	return div_ctl;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  988  }
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  989 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
