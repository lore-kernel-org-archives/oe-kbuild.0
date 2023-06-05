Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B56168D3
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jun 2023 11:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685963464; x=1717499464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kuAOUUFHx4VxpXCy/A9G1Tsnxay51BuP7r4yWvPOHYc=;
  b=kSn8BPL9mbZmFkwNHuk4K/FCERnG1F3zohw8XQ40M/BnUoCYcG+oV2EF
   YDZf3Rjz6evQmROtnjRszxro4lIW6DfWFg5byIfItTslL4ko53L0o32nH
   0UWXFWq6fuENybO07aCkd0CCmcv6G9v4smPzdNgEiLCOJCyIxw1exQN0l
   i0/2fM8d5TIIzZrtHgYXbhwFWJ4FLOZ9A/h8zzDfzKskmlfK5qw1+SRS9
   pHQGYg9hWkrwgoCyE21ByGokxjxueM8UBcF9r/UOF4OCiLmK5J3NCqSRp
   ur+0dR8yelZCqtgwg5Y4v7DVcNpiAQM7JR4ayk6+Mj/Dhi1sFyCCJY5Z+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="384643378"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="384643378"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 04:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="708624352"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="708624352"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Jun 2023 04:11:01 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6873-00048Z-0Z;
	Mon, 05 Jun 2023 11:11:01 +0000
Date: Mon, 5 Jun 2023 19:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [asahilinux:bits/170-atcphy 3/4] drivers/phy/apple/atc.c:1589:2-8:
 preceding lock on line 1578
Message-ID: <202306051938.IDGMm36G-lkp@intel.com>
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
head:   e3ed55ca947e67fac029ec3917d1f2ca6371d360
commit: 42ffc8978cdb02ee0131e1315bd7548f92f09690 [3/4] WIP: phy: apple: Add Apple Type-C PHY
:::::: branch date: 6 weeks ago
:::::: commit date: 6 weeks ago
config: parisc-randconfig-c043-20230605 (https://download.01.org/0day-ci/archive/20230605/202306051938.IDGMm36G-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306051938.IDGMm36G-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/apple/atc.c:1589:2-8: preceding lock on line 1578
   drivers/phy/apple/atc.c:1589:2-8: preceding lock on line 1584

vim +1589 drivers/phy/apple/atc.c

42ffc8978cdb02 Sven Peter 2022-11-30  1566  
42ffc8978cdb02 Sven Peter 2022-11-30  1567  static int atcphy_usb3_power_on(struct phy *phy)
42ffc8978cdb02 Sven Peter 2022-11-30  1568  {
42ffc8978cdb02 Sven Peter 2022-11-30  1569  	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
42ffc8978cdb02 Sven Peter 2022-11-30  1570  	enum atcphy_pipehandler_state state;
42ffc8978cdb02 Sven Peter 2022-11-30  1571  	int ret = 0;
42ffc8978cdb02 Sven Peter 2022-11-30  1572  
42ffc8978cdb02 Sven Peter 2022-11-30  1573  	/*
42ffc8978cdb02 Sven Peter 2022-11-30  1574  	 * Both usb role switch and mux set work will be running concurrently.
42ffc8978cdb02 Sven Peter 2022-11-30  1575  	 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
42ffc8978cdb02 Sven Peter 2022-11-30  1576  	 * trying to switch dwc3 to the correct PHY.
42ffc8978cdb02 Sven Peter 2022-11-30  1577  	 */
42ffc8978cdb02 Sven Peter 2022-11-30 @1578  	mutex_lock(&atcphy->lock);
42ffc8978cdb02 Sven Peter 2022-11-30  1579  	if (atcphy->mode != atcphy->target_mode) {
42ffc8978cdb02 Sven Peter 2022-11-30  1580  		reinit_completion(&atcphy->atcphy_online_event);
42ffc8978cdb02 Sven Peter 2022-11-30  1581  		mutex_unlock(&atcphy->lock);
42ffc8978cdb02 Sven Peter 2022-11-30  1582  		wait_for_completion_timeout(&atcphy->atcphy_online_event,
42ffc8978cdb02 Sven Peter 2022-11-30  1583  					msecs_to_jiffies(1000));
42ffc8978cdb02 Sven Peter 2022-11-30  1584  		mutex_lock(&atcphy->lock);
42ffc8978cdb02 Sven Peter 2022-11-30  1585  	}
42ffc8978cdb02 Sven Peter 2022-11-30  1586  
42ffc8978cdb02 Sven Peter 2022-11-30  1587  	if (atcphy->mode != atcphy->target_mode) {
42ffc8978cdb02 Sven Peter 2022-11-30  1588  		dev_err(atcphy->dev, "ATCPHY did not come up; won't allow dwc3 to come up.\n");
42ffc8978cdb02 Sven Peter 2022-11-30 @1589  		return -EINVAL;
42ffc8978cdb02 Sven Peter 2022-11-30  1590  	}
42ffc8978cdb02 Sven Peter 2022-11-30  1591  
42ffc8978cdb02 Sven Peter 2022-11-30  1592  	atcphy->dwc3_online = true;
42ffc8978cdb02 Sven Peter 2022-11-30  1593  	state = atcphy_modes[atcphy->mode].pipehandler_state;
42ffc8978cdb02 Sven Peter 2022-11-30  1594  	switch (state) {
42ffc8978cdb02 Sven Peter 2022-11-30  1595  	case ATCPHY_PIPEHANDLER_STATE_USB2:
42ffc8978cdb02 Sven Peter 2022-11-30  1596  	case ATCPHY_PIPEHANDLER_STATE_USB3:
42ffc8978cdb02 Sven Peter 2022-11-30  1597  		ret = atcphy_configure_pipehandler(atcphy, state);
42ffc8978cdb02 Sven Peter 2022-11-30  1598  		break;
42ffc8978cdb02 Sven Peter 2022-11-30  1599  
42ffc8978cdb02 Sven Peter 2022-11-30  1600  	case ATCPHY_PIPEHANDLER_STATE_INVALID:
42ffc8978cdb02 Sven Peter 2022-11-30  1601  	default:
42ffc8978cdb02 Sven Peter 2022-11-30  1602  		dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
42ffc8978cdb02 Sven Peter 2022-11-30  1603  			 state);
42ffc8978cdb02 Sven Peter 2022-11-30  1604  		ret = -EINVAL;
42ffc8978cdb02 Sven Peter 2022-11-30  1605  	}
42ffc8978cdb02 Sven Peter 2022-11-30  1606  
42ffc8978cdb02 Sven Peter 2022-11-30  1607  	mutex_unlock(&atcphy->lock);
42ffc8978cdb02 Sven Peter 2022-11-30  1608  
42ffc8978cdb02 Sven Peter 2022-11-30  1609  	return 0;
42ffc8978cdb02 Sven Peter 2022-11-30  1610  }
42ffc8978cdb02 Sven Peter 2022-11-30  1611  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
