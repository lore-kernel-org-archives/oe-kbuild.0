Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672AA1A590
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 22:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQWMNKBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702247893; x=1733783893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VFOJG3TzusR5xaja/N1rwOIekBdHKw/w1NlkpiQ8YaY=;
  b=CQWMNKBaSBAXRYDLfPY+ggkRlA4nbZs3WUL7JEBJFQ6KW18YSlkpltFL
   QsBKlKRifhns/5sLeGGOL8eldexcABNp7OeYqvJbDoyISIq8UhpHjg+Uu
   MLJHGSt/jbe+mEArtf60UGMQw2BCzWLG092OpxMmhy1T9fId2WFT1DmZv
   1WVBCgQdkGL/ngrsp2Hmc7QbjPk5diK4PVSbkQLl9OxlY2ozmaVmzVLgM
   PGQiKJIEr7aFS/2rDpgJYfyprKOzwnrHTPgO6DNsG5FlhMXNiay1mup3c
   kjBClM3aaXiEshZPI08BaotgkDJFSyG5Gv12ml+DUq+Sv8PpLbe8T9nK2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="374735285"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="374735285"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 14:38:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="890867403"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="890867403"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2023 14:38:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCSR7-000HLF-1W;
	Sun, 10 Dec 2023 22:38:09 +0000
Date: Mon, 11 Dec 2023 06:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/170-atcphy 3/11] drivers/phy/apple/atc.c:1609
 atcphy_usb3_power_on() warn: inconsistent returns '&atcphy->lock'.
Message-ID: <202312110624.SVpwzkJ6-lkp@intel.com>
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
TO: Sven Peter <sven@svenpeter.dev>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   4931e8edc0670b6acf66c1b83702c7521722ff1c
commit: 3b2571b8e8064a73eca2cec23cf86cfe7f7050f5 [3/11] WIP: phy: apple: Add Apple Type-C PHY
:::::: branch date: 3 weeks ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231211/202312110624.SVpwzkJ6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312110624.SVpwzkJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312110624.SVpwzkJ6-lkp@intel.com/

smatch warnings:
drivers/phy/apple/atc.c:1609 atcphy_usb3_power_on() warn: inconsistent returns '&atcphy->lock'.
drivers/phy/apple/atc.c:2156 atcphy_parse_new_tunable() warn: impossible condition '(offset > (~0)) => (0-u32max > u32max)'
drivers/phy/apple/atc.c:2156 atcphy_parse_new_tunable() warn: impossible condition '(mask > (~0)) => (0-u32max > u32max)'
drivers/phy/apple/atc.c:2157 atcphy_parse_new_tunable() warn: impossible condition '(value > (~0)) => (0-u32max > u32max)'

vim +1609 drivers/phy/apple/atc.c

3b2571b8e8064a Sven Peter 2022-11-30  1566  
3b2571b8e8064a Sven Peter 2022-11-30  1567  static int atcphy_usb3_power_on(struct phy *phy)
3b2571b8e8064a Sven Peter 2022-11-30  1568  {
3b2571b8e8064a Sven Peter 2022-11-30  1569  	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
3b2571b8e8064a Sven Peter 2022-11-30  1570  	enum atcphy_pipehandler_state state;
3b2571b8e8064a Sven Peter 2022-11-30  1571  	int ret = 0;
3b2571b8e8064a Sven Peter 2022-11-30  1572  
3b2571b8e8064a Sven Peter 2022-11-30  1573  	/*
3b2571b8e8064a Sven Peter 2022-11-30  1574  	 * Both usb role switch and mux set work will be running concurrently.
3b2571b8e8064a Sven Peter 2022-11-30  1575  	 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
3b2571b8e8064a Sven Peter 2022-11-30  1576  	 * trying to switch dwc3 to the correct PHY.
3b2571b8e8064a Sven Peter 2022-11-30  1577  	 */
3b2571b8e8064a Sven Peter 2022-11-30  1578  	mutex_lock(&atcphy->lock);
3b2571b8e8064a Sven Peter 2022-11-30  1579  	if (atcphy->mode != atcphy->target_mode) {
3b2571b8e8064a Sven Peter 2022-11-30  1580  		reinit_completion(&atcphy->atcphy_online_event);
3b2571b8e8064a Sven Peter 2022-11-30  1581  		mutex_unlock(&atcphy->lock);
3b2571b8e8064a Sven Peter 2022-11-30  1582  		wait_for_completion_timeout(&atcphy->atcphy_online_event,
3b2571b8e8064a Sven Peter 2022-11-30  1583  					msecs_to_jiffies(1000));
3b2571b8e8064a Sven Peter 2022-11-30  1584  		mutex_lock(&atcphy->lock);
3b2571b8e8064a Sven Peter 2022-11-30  1585  	}
3b2571b8e8064a Sven Peter 2022-11-30  1586  
3b2571b8e8064a Sven Peter 2022-11-30  1587  	if (atcphy->mode != atcphy->target_mode) {
3b2571b8e8064a Sven Peter 2022-11-30  1588  		dev_err(atcphy->dev, "ATCPHY did not come up; won't allow dwc3 to come up.\n");
3b2571b8e8064a Sven Peter 2022-11-30  1589  		return -EINVAL;
3b2571b8e8064a Sven Peter 2022-11-30  1590  	}
3b2571b8e8064a Sven Peter 2022-11-30  1591  
3b2571b8e8064a Sven Peter 2022-11-30  1592  	atcphy->dwc3_online = true;
3b2571b8e8064a Sven Peter 2022-11-30  1593  	state = atcphy_modes[atcphy->mode].pipehandler_state;
3b2571b8e8064a Sven Peter 2022-11-30  1594  	switch (state) {
3b2571b8e8064a Sven Peter 2022-11-30  1595  	case ATCPHY_PIPEHANDLER_STATE_USB2:
3b2571b8e8064a Sven Peter 2022-11-30  1596  	case ATCPHY_PIPEHANDLER_STATE_USB3:
3b2571b8e8064a Sven Peter 2022-11-30  1597  		ret = atcphy_configure_pipehandler(atcphy, state);
3b2571b8e8064a Sven Peter 2022-11-30  1598  		break;
3b2571b8e8064a Sven Peter 2022-11-30  1599  
3b2571b8e8064a Sven Peter 2022-11-30  1600  	case ATCPHY_PIPEHANDLER_STATE_INVALID:
3b2571b8e8064a Sven Peter 2022-11-30  1601  	default:
3b2571b8e8064a Sven Peter 2022-11-30  1602  		dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
3b2571b8e8064a Sven Peter 2022-11-30  1603  			 state);
3b2571b8e8064a Sven Peter 2022-11-30  1604  		ret = -EINVAL;
3b2571b8e8064a Sven Peter 2022-11-30  1605  	}
3b2571b8e8064a Sven Peter 2022-11-30  1606  
3b2571b8e8064a Sven Peter 2022-11-30  1607  	mutex_unlock(&atcphy->lock);
3b2571b8e8064a Sven Peter 2022-11-30  1608  
3b2571b8e8064a Sven Peter 2022-11-30 @1609  	return 0;
3b2571b8e8064a Sven Peter 2022-11-30  1610  }
3b2571b8e8064a Sven Peter 2022-11-30  1611  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
