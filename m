Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E1EEA6
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Dec 2023 04:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kd6OQ73V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703478846; x=1735014846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xfkJHHWLbbDVEvFaDx9PBHoma7lcpLclNK2iNavf9yY=;
  b=Kd6OQ73V7BhLIrP5f7c0aosqGHDfhlLKshC08QF4uDPRJBSGWsJkh/V4
   /rfAvJ2kufyOTV5qt1Sc85i0iPyTfnp8PkmnI+QUt0/C82OHBBAyja6N7
   OTYWBHp/etyh7C0cjfpcC9xrsv+fBIuEaPu9qIwzWAtCjyh7fWVFTEKpM
   n5Joaxr9J9IoeSKXcpT8fWhIrbkgDtAf7/Pouh7t0jT2NSn7pD4bYGGzw
   bxZy4WbyKMYsW9F+dZ/f0LQf6EKIWUdVrSSQYH5b51r2eDswg5A0YThF/
   7joVGIXhzvNnIgs2kU+McILA3EpW824Uehj2mwaw9Heu0MXyDwNnvqVTd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="375759391"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="375759391"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 20:34:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="811960777"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="811960777"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 24 Dec 2023 20:34:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHcej-000CvN-2B;
	Mon, 25 Dec 2023 04:33:54 +0000
Date: Mon, 25 Dec 2023 12:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-linux-6.1.y-wip 13/22] drivers/net/can/m_can/m_can.c:1890
 m_can_set_wol() warn: add some parenthesis here?
Message-ID: <202312251225.eXXIV6Xy-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
CC: Praneeth Bajjuri <praneeth@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   e5842fb2bdaa92e4c60227a2e4e1137dea043662
commit: a82817238831b72570a3135027ba3bc52becabb7 [13/22] can: m_can: Map WoL to device_set_wakeup_enable
:::::: branch date: 5 days ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-141-20231224 (https://download.01.org/0day-ci/archive/20231225/202312251225.eXXIV6Xy-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312251225.eXXIV6Xy-lkp@intel.com/

New smatch warnings:
drivers/net/can/m_can/m_can.c:1890 m_can_set_wol() warn: add some parenthesis here?

Old smatch warnings:
drivers/net/can/m_can/m_can.c:1865 m_can_open() warn: 'dev->irq' from request_threaded_irq() not released on lines: 1865.
drivers/net/can/m_can/m_can.c:1865 m_can_open() warn: 'dev->irq' from request_irq() not released on lines: 1865.

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
