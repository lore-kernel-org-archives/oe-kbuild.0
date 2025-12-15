Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA042192E4
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 19:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765825444; cv=none; b=rN1VZitxXfxNCGvU6WAwaIHtKQf+N2EPCgetO9DdHRr6/vzLLwLGHE2mcfIbmKeHh/mAWUqWNLXVteYlSBz6Vo8S66lEz3SjV2wfRtTczMvyI5KCsI+/WwWzxstERC2OAUaxlI9UU+DTzAmDc2rP5SJom1nnc3uzZLuFxugHXkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765825444; c=relaxed/simple;
	bh=lbNnBNVS0B4pm7TyFvJ5rPYpTGSvw9B0btEDUUZcfoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O3yy9ZP01LpakG01SgpSHQujCQDqW5HDEN0E0Nl+WMC6v1wkPEM0t5HIYXXMHS7HiCurT8psqXWBf/nhZ6cqiOPi5DgjA4ZeiPK+8LZqHlp7wom9AnCY/fgTPIeQkd1osRU8EWrz0cQkoKsLG4zSO5g5RxCwVGomlxm/HzIeZLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QuM1m55d; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuM1m55d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765825442; x=1797361442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lbNnBNVS0B4pm7TyFvJ5rPYpTGSvw9B0btEDUUZcfoA=;
  b=QuM1m55dnQUfy8n0FW9SHWuBiW1dsQC/g/a5hGwNE3jlNJeFP5zwUHD8
   nS4cfL6/88MKhP3xeML4PY44YELFF030xj7zTst7vseU04soEcJz341zi
   cKGSaxrYCUU0uznmwX0rUrTfMjqBbNo9rrBgKEYz1FcXD0QiBaKMfFTLT
   Abm1ValembaYs3exGi+d1GMy5/lJHr/Ni/6j63zrdGStGJnP3DtgIn+Hx
   2gFq5EZCR4HFDPbrrXpr+EHbCpsO+bRG2wX4nSciIpidEww3u4CF9Vcno
   IROMkHJMKPdiJtI1L19kgfh8Hc+QbGXfc9Bzbhp0my87ZplOtzPmZc5N/
   Q==;
X-CSE-ConnectionGUID: L0tmiUeST0ibvBDehDYHRQ==
X-CSE-MsgGUID: uYqx16NuRau+fZYA2UFIsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85330376"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="85330376"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 11:04:01 -0800
X-CSE-ConnectionGUID: 62Ad7X+XQUm/1U/ksoneQw==
X-CSE-MsgGUID: oopOycdeT9qcO1wMTPT8CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197552564"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Dec 2025 11:04:00 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVDrR-000000000eF-2OWx;
	Mon, 15 Dec 2025 19:03:57 +0000
Date: Tue, 16 Dec 2025 03:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/phy/microchip_t1.c:1299 lan887x_phy_init() warn:
 'priv->clock' can also be NULL
Message-ID: <202512160211.FZ4wuVcH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Divya Koppera <divya.koppera@microchip.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 8541fc12edcdef36a02885672f22ca8391bd2443 net: phy: microchip_t1: Enable pin out specific to lan887x phy for PEROUT signal
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: sparc-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251216/202512160211.FZ4wuVcH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160211.FZ4wuVcH-lkp@intel.com/

smatch warnings:
drivers/net/phy/microchip_t1.c:1299 lan887x_phy_init() warn: 'priv->clock' can also be NULL

vim +1299 drivers/net/phy/microchip_t1.c

0941c832823498 Divya Koppera 2024-08-21  1279  
0941c832823498 Divya Koppera 2024-08-21  1280  static int lan887x_phy_init(struct phy_device *phydev)
0941c832823498 Divya Koppera 2024-08-21  1281  {
9fc3d6fe802923 Divya Koppera 2024-12-19  1282  	struct lan887x_priv *priv = phydev->priv;
0941c832823498 Divya Koppera 2024-08-21  1283  	int ret;
0941c832823498 Divya Koppera 2024-08-21  1284  
9fc3d6fe802923 Divya Koppera 2024-12-19  1285  	if (!priv->init_done && phy_interrupt_is_valid(phydev)) {
9fc3d6fe802923 Divya Koppera 2024-12-19  1286  		priv->clock = mchp_rds_ptp_probe(phydev, MDIO_MMD_VEND1,
9fc3d6fe802923 Divya Koppera 2024-12-19  1287  						 MCHP_RDS_PTP_LTC_BASE_ADDR,
9fc3d6fe802923 Divya Koppera 2024-12-19  1288  						 MCHP_RDS_PTP_PORT_BASE_ADDR);
9fc3d6fe802923 Divya Koppera 2024-12-19  1289  		if (IS_ERR(priv->clock))
9fc3d6fe802923 Divya Koppera 2024-12-19  1290  			return PTR_ERR(priv->clock);
9fc3d6fe802923 Divya Koppera 2024-12-19  1291  
8541fc12edcdef Divya Koppera 2025-01-15  1292  		/* Enable pin mux for EVT */
8541fc12edcdef Divya Koppera 2025-01-15  1293  		phy_modify_mmd(phydev, MDIO_MMD_VEND1,
8541fc12edcdef Divya Koppera 2025-01-15  1294  			       LAN887X_MX_CHIP_TOP_REG_CONTROL1,
8541fc12edcdef Divya Koppera 2025-01-15  1295  			       LAN887X_MX_CHIP_TOP_REG_CONTROL1_EVT_EN,
8541fc12edcdef Divya Koppera 2025-01-15  1296  			       LAN887X_MX_CHIP_TOP_REG_CONTROL1_EVT_EN);
8541fc12edcdef Divya Koppera 2025-01-15  1297  
8541fc12edcdef Divya Koppera 2025-01-15  1298  		/* Initialize pin numbers specific to PEROUT */
8541fc12edcdef Divya Koppera 2025-01-15 @1299  		priv->clock->event_pin = 3;
8541fc12edcdef Divya Koppera 2025-01-15  1300  
9fc3d6fe802923 Divya Koppera 2024-12-19  1301  		priv->init_done = true;
9fc3d6fe802923 Divya Koppera 2024-12-19  1302  	}
9fc3d6fe802923 Divya Koppera 2024-12-19  1303  
0941c832823498 Divya Koppera 2024-08-21  1304  	/* Clear loopback */
0941c832823498 Divya Koppera 2024-08-21  1305  	ret = phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1,
0941c832823498 Divya Koppera 2024-08-21  1306  				 LAN887X_MIS_CFG_REG2,
0941c832823498 Divya Koppera 2024-08-21  1307  				 LAN887X_MIS_CFG_REG2_FE_LPBK_EN);
0941c832823498 Divya Koppera 2024-08-21  1308  	if (ret < 0)
0941c832823498 Divya Koppera 2024-08-21  1309  		return ret;
0941c832823498 Divya Koppera 2024-08-21  1310  
0941c832823498 Divya Koppera 2024-08-21  1311  	/* Configure default behavior of led to link and activity for any
0941c832823498 Divya Koppera 2024-08-21  1312  	 * speed
0941c832823498 Divya Koppera 2024-08-21  1313  	 */
0941c832823498 Divya Koppera 2024-08-21  1314  	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1,
0941c832823498 Divya Koppera 2024-08-21  1315  			     LAN887X_COMMON_LED3_LED2,
0941c832823498 Divya Koppera 2024-08-21  1316  			     LAN887X_COMMON_LED2_MODE_SEL_MASK,
0941c832823498 Divya Koppera 2024-08-21  1317  			     LAN887X_LED_LINK_ACT_ANY_SPEED);
0941c832823498 Divya Koppera 2024-08-21  1318  	if (ret < 0)
0941c832823498 Divya Koppera 2024-08-21  1319  		return ret;
0941c832823498 Divya Koppera 2024-08-21  1320  
0941c832823498 Divya Koppera 2024-08-21  1321  	/* PHY interface setup */
0941c832823498 Divya Koppera 2024-08-21  1322  	return lan887x_config_phy_interface(phydev);
0941c832823498 Divya Koppera 2024-08-21  1323  }
0941c832823498 Divya Koppera 2024-08-21  1324  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
