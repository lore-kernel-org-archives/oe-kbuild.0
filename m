Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E8D2104
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Aug 2023 07:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691481173; x=1723017173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M+TkfQF+1p2jeCCRADfo7FmRfHFNIXzmTL0uxRUJpoo=;
  b=fHcnTyt93H594B+D82gl64h7AM7CsV7kaTq6eAMTgG3Q2SpUw0hXms1q
   CJ5SDsz0TJCClOU6AUZUVNo0DE3eLqwkzE4AP4nFGHof70ZYPHitmfeZh
   wNtbBA4/wxO0xv/UasZWPyb39b9UqUHqMk40zrrZPYoAEN9jOlXpmu5j4
   fIbEVFDPJUWqmS8/QgU4ooP9Kt19EjgNWpJFVNwDS+JxQsb8wqs90kjXF
   ETf+WNFSiVS1x/jhBHY4ZiyMRi39A3VOFUPtOZMF8U3M9IuygtOPfBXct
   DRA9e1aXsHPY036QnuBQMWIy/pIYxEnHWamIRnz18iWJZB+5Avcuaqh3v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350340492"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="350340492"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 00:52:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845362064"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="845362064"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2023 00:52:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTHWM-0005D6-3B;
	Tue, 08 Aug 2023 07:52:50 +0000
Date: Tue, 8 Aug 2023 15:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [asahilinux:bits/170-atcphy 3/4] drivers/phy/apple/atc.c:1589:2-8:
 preceding lock on line 1578
Message-ID: <202308081540.at9YfMlb-lkp@intel.com>
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
head:   7f54207023c688cf98ee1245fc8e845387c53f51
commit: 43a0fefe50ef2c66965279c857544eafe439c687 [3/4] WIP: phy: apple: Add Apple Type-C PHY
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
config: arc-randconfig-r061-20230808 (https://download.01.org/0day-ci/archive/20230808/202308081540.at9YfMlb-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081540.at9YfMlb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308081540.at9YfMlb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/apple/atc.c:1589:2-8: preceding lock on line 1578
   drivers/phy/apple/atc.c:1589:2-8: preceding lock on line 1584

vim +1589 drivers/phy/apple/atc.c

43a0fefe50ef2c Sven Peter 2022-11-30  1566  
43a0fefe50ef2c Sven Peter 2022-11-30  1567  static int atcphy_usb3_power_on(struct phy *phy)
43a0fefe50ef2c Sven Peter 2022-11-30  1568  {
43a0fefe50ef2c Sven Peter 2022-11-30  1569  	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
43a0fefe50ef2c Sven Peter 2022-11-30  1570  	enum atcphy_pipehandler_state state;
43a0fefe50ef2c Sven Peter 2022-11-30  1571  	int ret = 0;
43a0fefe50ef2c Sven Peter 2022-11-30  1572  
43a0fefe50ef2c Sven Peter 2022-11-30  1573  	/*
43a0fefe50ef2c Sven Peter 2022-11-30  1574  	 * Both usb role switch and mux set work will be running concurrently.
43a0fefe50ef2c Sven Peter 2022-11-30  1575  	 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
43a0fefe50ef2c Sven Peter 2022-11-30  1576  	 * trying to switch dwc3 to the correct PHY.
43a0fefe50ef2c Sven Peter 2022-11-30  1577  	 */
43a0fefe50ef2c Sven Peter 2022-11-30 @1578  	mutex_lock(&atcphy->lock);
43a0fefe50ef2c Sven Peter 2022-11-30  1579  	if (atcphy->mode != atcphy->target_mode) {
43a0fefe50ef2c Sven Peter 2022-11-30  1580  		reinit_completion(&atcphy->atcphy_online_event);
43a0fefe50ef2c Sven Peter 2022-11-30  1581  		mutex_unlock(&atcphy->lock);
43a0fefe50ef2c Sven Peter 2022-11-30  1582  		wait_for_completion_timeout(&atcphy->atcphy_online_event,
43a0fefe50ef2c Sven Peter 2022-11-30  1583  					msecs_to_jiffies(1000));
43a0fefe50ef2c Sven Peter 2022-11-30  1584  		mutex_lock(&atcphy->lock);
43a0fefe50ef2c Sven Peter 2022-11-30  1585  	}
43a0fefe50ef2c Sven Peter 2022-11-30  1586  
43a0fefe50ef2c Sven Peter 2022-11-30  1587  	if (atcphy->mode != atcphy->target_mode) {
43a0fefe50ef2c Sven Peter 2022-11-30  1588  		dev_err(atcphy->dev, "ATCPHY did not come up; won't allow dwc3 to come up.\n");
43a0fefe50ef2c Sven Peter 2022-11-30 @1589  		return -EINVAL;
43a0fefe50ef2c Sven Peter 2022-11-30  1590  	}
43a0fefe50ef2c Sven Peter 2022-11-30  1591  
43a0fefe50ef2c Sven Peter 2022-11-30  1592  	atcphy->dwc3_online = true;
43a0fefe50ef2c Sven Peter 2022-11-30  1593  	state = atcphy_modes[atcphy->mode].pipehandler_state;
43a0fefe50ef2c Sven Peter 2022-11-30  1594  	switch (state) {
43a0fefe50ef2c Sven Peter 2022-11-30  1595  	case ATCPHY_PIPEHANDLER_STATE_USB2:
43a0fefe50ef2c Sven Peter 2022-11-30  1596  	case ATCPHY_PIPEHANDLER_STATE_USB3:
43a0fefe50ef2c Sven Peter 2022-11-30  1597  		ret = atcphy_configure_pipehandler(atcphy, state);
43a0fefe50ef2c Sven Peter 2022-11-30  1598  		break;
43a0fefe50ef2c Sven Peter 2022-11-30  1599  
43a0fefe50ef2c Sven Peter 2022-11-30  1600  	case ATCPHY_PIPEHANDLER_STATE_INVALID:
43a0fefe50ef2c Sven Peter 2022-11-30  1601  	default:
43a0fefe50ef2c Sven Peter 2022-11-30  1602  		dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
43a0fefe50ef2c Sven Peter 2022-11-30  1603  			 state);
43a0fefe50ef2c Sven Peter 2022-11-30  1604  		ret = -EINVAL;
43a0fefe50ef2c Sven Peter 2022-11-30  1605  	}
43a0fefe50ef2c Sven Peter 2022-11-30  1606  
43a0fefe50ef2c Sven Peter 2022-11-30  1607  	mutex_unlock(&atcphy->lock);
43a0fefe50ef2c Sven Peter 2022-11-30  1608  
43a0fefe50ef2c Sven Peter 2022-11-30  1609  	return 0;
43a0fefe50ef2c Sven Peter 2022-11-30  1610  }
43a0fefe50ef2c Sven Peter 2022-11-30  1611  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
