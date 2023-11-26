Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58864437
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Nov 2023 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8UqJ402"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701004964; x=1732540964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sWTjXwJCWCjVJRuI9R/2/ersQjE2fOTMQcFrMYQF2uA=;
  b=T8UqJ402MY+4tVOUKsDevU58Sv7EjHmZ3DwBFY9kPrT1o+tK0Azm2OEf
   pkh4GwahUafeOcRTcN7bAaRBm+5HQ3IXgLnhmshkIUfadhteydpdZ1kHQ
   c/mLtlX8SMWDGGgAXE3RsTfrdNQWZfOJEmBxMTsKcLtlBtFUU9q8efg/c
   Ko6q+U3hsLKnuHKBzignW9aZHwzGzpHeUUypTnhx572SKamnINyA3fAfB
   ZMq3sOdIlv+Ol9G4spvyRn71a4gSB6SoKk3566ZJQjMLOQwFfpWE5YcEn
   IT7Y1czFK2baXuZORDrQYax2/zs9nh6oSpVhb3SK1T1sA6UYbJPN8z4fn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="14127633"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="14127633"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 05:22:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="1099520026"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="1099520026"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Nov 2023 05:22:41 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7F5q-0005Bq-3C;
	Sun, 26 Nov 2023 13:22:38 +0000
Date: Sun, 26 Nov 2023 21:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-linux-6.1.y-wip 13/22] drivers/net/can/m_can/m_can.c:1890:60:
 sparse: sparse: dubious: !x & y
Message-ID: <202311262053.57NKWxyU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/can/m_can/m_can.c:1890:60: sparse: sparse: dubious: !x & y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: vigneshr@ti.com
CC: nm@ti.com
CC: Praneeth Bajjuri <praneeth@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   07cbd0efc06ffff69b2b0c3d7d607b35829340c3
commit: a82817238831b72570a3135027ba3bc52becabb7 [13/22] can: m_can: Map WoL to device_set_wakeup_enable
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: mips-randconfig-r121-20231126 (https://download.01.org/0day-ci/archive/20231126/202311262053.57NKWxyU-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311262053.57NKWxyU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311262053.57NKWxyU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/can/m_can/m_can.c:1890:60: sparse: sparse: dubious: !x & y
   drivers/net/can/m_can/m_can.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false

vim +1890 drivers/net/can/m_can/m_can.c

a82817238831b7 Markus Schneider-Pargmann 2023-11-16  1882  
a82817238831b7 Markus Schneider-Pargmann 2023-11-16  1883  static int m_can_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
a82817238831b7 Markus Schneider-Pargmann 2023-11-16  1884  {
a82817238831b7 Markus Schneider-Pargmann 2023-11-16  1885  	struct m_can_classdev *cdev = netdev_priv(dev);
a82817238831b7 Markus Schneider-Pargmann 2023-11-16  1886  
a82817238831b7 Markus Schneider-Pargmann 2023-11-16  1887  	if ((wol->wolopts & WAKE_PHY) != wol->wolopts)
a82817238831b7 Markus Schneider-Pargmann 2023-11-16  1888  		return -EINVAL;
a82817238831b7 Markus Schneider-Pargmann 2023-11-16  1889  
a82817238831b7 Markus Schneider-Pargmann 2023-11-16 @1890  	device_set_wakeup_enable(cdev->dev, !!wol->wolopts & WAKE_PHY);
a82817238831b7 Markus Schneider-Pargmann 2023-11-16  1891  
a82817238831b7 Markus Schneider-Pargmann 2023-11-16  1892  	return 0;
a82817238831b7 Markus Schneider-Pargmann 2023-11-16  1893  }
a82817238831b7 Markus Schneider-Pargmann 2023-11-16  1894  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
