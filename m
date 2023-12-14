Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160885811E
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 15:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKOhcrUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702566157; x=1734102157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qVXW22YLdaRi84ybtzDd2a9hYWMLL/LPPBRjusb1fno=;
  b=LKOhcrUAy2YdvMs79sPbHBsHlbJ5UkcKV+eNOOyGIbqFNaq7Am3RazII
   YsXMMI3gLwSDhMJkGgGKQKTZ+5J/ZLdzXyp8ZYhCP9KPkVjF0VEFRlUqK
   iz1FnF5yEuIy7CtoRQ0IoMBuhZyrrH0AsVeS0NaR4x76h+ykwFh8CTxdr
   m3ec2F0lihavZXcAEmG4ClEHKBcO+g3uon/jud49mtLnh3EFjWcFMef5H
   Roo6/v7Le//jKQkcK9atbu8yQE9dM3NlrcmqUgcxrEyXI0FK2wr5rva+z
   UNijVQYZarYgj1Nwf4j/btDDzZxOipbw3ypL2GOCOoCLF4OQnWlGCvTCg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1965561"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1965561"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:02:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="808610653"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="808610653"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Dec 2023 07:02:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDnEO-000MC6-2E;
	Thu, 14 Dec 2023 15:02:32 +0000
Date: Thu, 14 Dec 2023 23:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/marvell/sky2.c:4298:11-12: WARNING opportunity
 for min()
Message-ID: <202312142203.fdlM62DP-lkp@intel.com>
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
TO: Heiner Kallweit <hkallweit1@gmail.com>
CC: Stephen Hemminger <stephen@networkplumber.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: 92e888bc6f1b84cb4dee23d768777362221be1d4 sky2: use PCI VPD API in eeprom ethtool ops
date:   2 years, 1 month ago
:::::: branch date: 20 hours ago
:::::: commit date: 2 years, 1 month ago
config: x86_64-randconfig-102-20231210 (https://download.01.org/0day-ci/archive/20231214/202312142203.fdlM62DP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312142203.fdlM62DP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312142203.fdlM62DP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/marvell/sky2.c:4298:11-12: WARNING opportunity for min()

vim +4298 drivers/net/ethernet/marvell/sky2.c

f4331a6d24f2e55 drivers/net/sky2.c                  Stephen Hemminger 2007-07-09  4285  
f4331a6d24f2e55 drivers/net/sky2.c                  Stephen Hemminger 2007-07-09  4286  static int sky2_set_eeprom(struct net_device *dev, struct ethtool_eeprom *eeprom,
f4331a6d24f2e55 drivers/net/sky2.c                  Stephen Hemminger 2007-07-09  4287  			   u8 *data)
f4331a6d24f2e55 drivers/net/sky2.c                  Stephen Hemminger 2007-07-09  4288  {
f4331a6d24f2e55 drivers/net/sky2.c                  Stephen Hemminger 2007-07-09  4289  	struct sky2_port *sky2 = netdev_priv(dev);
92e888bc6f1b84c drivers/net/ethernet/marvell/sky2.c Heiner Kallweit   2021-11-18  4290  	int rc;
f4331a6d24f2e55 drivers/net/sky2.c                  Stephen Hemminger 2007-07-09  4291  
f4331a6d24f2e55 drivers/net/sky2.c                  Stephen Hemminger 2007-07-09  4292  	if (eeprom->magic != SKY2_EEPROM_MAGIC)
f4331a6d24f2e55 drivers/net/sky2.c                  Stephen Hemminger 2007-07-09  4293  		return -EINVAL;
f4331a6d24f2e55 drivers/net/sky2.c                  Stephen Hemminger 2007-07-09  4294  
92e888bc6f1b84c drivers/net/ethernet/marvell/sky2.c Heiner Kallweit   2021-11-18  4295  	rc = pci_write_vpd_any(sky2->hw->pdev, eeprom->offset, eeprom->len,
92e888bc6f1b84c drivers/net/ethernet/marvell/sky2.c Heiner Kallweit   2021-11-18  4296  			       data);
f4331a6d24f2e55 drivers/net/sky2.c                  Stephen Hemminger 2007-07-09  4297  
92e888bc6f1b84c drivers/net/ethernet/marvell/sky2.c Heiner Kallweit   2021-11-18 @4298  	return rc < 0 ? rc : 0;
f4331a6d24f2e55 drivers/net/sky2.c                  Stephen Hemminger 2007-07-09  4299  }
f4331a6d24f2e55 drivers/net/sky2.c                  Stephen Hemminger 2007-07-09  4300  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
