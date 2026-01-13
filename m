Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094E521B91D
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 01:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768266468; cv=none; b=sU0PwIx9HLvyAgCZVj17dfuUgW+EH3sf9iY2RGGNCCw1yuWTBBlX3loVoinkFcvhyHGC6MNUlVmK+Bi3Ngu4la+f9Vd9l7aWVnQI+YKmKqJIjmQQoT827O8G9yyofBYXiWe4StTWOePAiXnTBmzQxlbeEys6WXzRBCflhkHrfWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768266468; c=relaxed/simple;
	bh=UuTdPj+cGGXXfVTHfyhst/KpIaOxZ15pY6WK8ScHbtw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BZfLe4ktCFdl9Uut7xVgz6XNAchVeBlGqvjBk5ICFr56zzVnm1zECXAKe7/ouAxmtirMMJ5U++Sm1UY7faxKRIdTgN5+dAWVgc2Fod2N0q2h2jocaUJY2U/7+HIYB4WVkNQySmEgexFPILgHULoIn7wpZ5PCZXWd6rEo6IcZopk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsvdiikZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsvdiikZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768266467; x=1799802467;
  h=date:from:to:cc:subject:message-id;
  bh=UuTdPj+cGGXXfVTHfyhst/KpIaOxZ15pY6WK8ScHbtw=;
  b=KsvdiikZhvm6lkiT7pgiz/bBCNXVnU5ri2+rK52qWIJFyeOJddSsUH4b
   GPPPZd2VlAQ/nKTf2dd0H5P5wpiygAsm4hFhLcfPOconF92ueSB2OsDPT
   mrLib0KjZrSAk46eVHm3IezCtUs3xbhlM7TffJCAohHGIU3Q8ALeo+QKZ
   diHpqgwSHm58N3OTKrGBvTw6NtU5cI/bkfk8vQYsD7W7c0FiQT+NPUo0a
   avObSrVEpCL7CHSQNB4QufqzQBd0owlC3jdni4kIrcDBRIfKudw9RQ2Wb
   vcAAd+up88kxQuq0ExeIBpkM8/VmUlbhhugptvCbtnPkIGuIZ91uCHdHw
   w==;
X-CSE-ConnectionGUID: 3BWkYCE+QwyrCyecl1yeJQ==
X-CSE-MsgGUID: SkVFSbfoSda5hH2xlPZ6Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80999317"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80999317"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 17:07:47 -0800
X-CSE-ConnectionGUID: LW8XXOUeTKu+TBoOGxGcFA==
X-CSE-MsgGUID: 2CnPQ6OeQcm1gDKOlEsZdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203448145"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jan 2026 17:07:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfSsp-00000000E3G-0Y9l;
	Tue, 13 Jan 2026 01:07:43 +0000
Date: Tue, 13 Jan 2026 09:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/freescale/ucc_geth.c:1608
 ugeth_mac_config() error: we previously assumed 'tbiphy' could be null (see
 line 1605)
Message-ID: <202601130843.rFGNXA5a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Maxime Chevallier <maxime.chevallier@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 53036aa8d03178a8d056a24a52a301ad290877d4 net: freescale: ucc_geth: phylink conversion
date:   1 year, 1 month ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 1 month ago
config: powerpc-randconfig-r072-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130843.rFGNXA5a-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601130843.rFGNXA5a-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/freescale/ucc_geth.c:1608 ugeth_mac_config() error: we previously assumed 'tbiphy' could be null (see line 1605)

vim +/tbiphy +1608 drivers/net/ethernet/freescale/ucc_geth.c

ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1588  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1589  static void ugeth_mac_config(struct phylink_config *config, unsigned int mode,
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1590  			     const struct phylink_link_state *state)
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1591  {
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1592  	struct net_device *ndev = to_net_dev(config->dev);
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1593  	struct ucc_geth_private *ugeth = netdev_priv(ndev);
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1594  	struct ucc_geth_info *ug_info = ugeth->ug_info;
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1595  	u16 value;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1596  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1597  	if (state->interface == PHY_INTERFACE_MODE_TBI ||
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1598  	    state->interface == PHY_INTERFACE_MODE_RTBI) {
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1599  		struct phy_device *tbiphy;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1600  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1601  		if (!ug_info->tbi_node)
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1602  			pr_warn("TBI mode requires that the device tree specify a tbi-handle\n");
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1603  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1604  		tbiphy = of_phy_find_device(ug_info->tbi_node);
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03 @1605  		if (!tbiphy)
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1606  			pr_warn("Could not get TBI device\n");
047584ce941080 drivers/net/ucc_geth.c                    Haiying Wang      2009-06-02  1607  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03 @1608  		value = phy_read(tbiphy, ENET_TBI_MII_CR);
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1609  		value &= ~0x1000;	/* Turn off autonegotiation */
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1610  		phy_write(tbiphy, ENET_TBI_MII_CR, value);
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1611  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1612  		put_device(&tbiphy->mdio.dev);
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1613  	}
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1614  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1615  	if (phylink_autoneg_inband(mode)) {
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1616  		ug_info->aufc = 1;
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1617  
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1618  		init_flow_control_params(ug_info->aufc, 1, 1,
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1619  					 ug_info->pausePeriod,
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1620  					 ug_info->extensionField,
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1621  					 &ugeth->uccf->uf_regs->upsmr,
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1622  					 &ugeth->ug_regs->uempr,
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1623  					 &ugeth->ug_regs->maccfg1);
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1624  	}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1625  }
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1626  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
