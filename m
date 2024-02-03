Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77568DDB0
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Feb 2024 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706985625; cv=none; b=l6AOXa/TI+k8+3R/IYcWTbTUwtXZq7mgPrF7Ay7WbkZtGmE8Crf71H8EKsSYKjC6COQLmgt6fteb5nfjRK69GULBx/0QIW/yWaqlPoUblwaMF66iM3y5zmPsrQPKJCgABvBCaAE5xy+anP04cNDEE4SHyfNXx+6f3q15Zx3z0Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706985625; c=relaxed/simple;
	bh=KJHsMPnW3HuOYIwuBk3HHcf8M5Ci//X1WWPrLy5E3CI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LhVPXi1L4jiNys0tvOHj+Fs6JmYjVbQugs+ww3LroqHgqwdafuAPgUBmSXD2pPW/UPQC2h9S3He87ZfRucxfsf1uvtTbZeHOd9CHsW081H/hWMH6peV5Qx91ggNz/ozRbskv0Ehx4uWBocMF4yCvOpZwfU7QdCuj3s9GlLgHOIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LPTxbEtC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LPTxbEtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706985623; x=1738521623;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KJHsMPnW3HuOYIwuBk3HHcf8M5Ci//X1WWPrLy5E3CI=;
  b=LPTxbEtCMCEIiGB0ur+YaKK4oDjkM2xeewEIItBuWwtsW5Xpw50avoDE
   KOrGwpG85EPGjuivBJOmtmY1/YAv5Cr/Skss0e9ug/rwm3uyYvcBFt93a
   CdQYUnRzle3/jBjQQHn+O+50xpLEozj0XbSLUsXdKWg3u6BSBTWsa/uAL
   /BLogPnmSJ9leJqC//hrPs+Xr0VkiSWZUX3hUq5h+Yf5v78up1LlBz2DK
   D35rCZN0L7HGD6NGNCi15CiqgGAdwGM0sBmyM1ZB6PDI2jYDqpGvUw4by
   GvBTyMIPFJ8yy/OVZFVGCWuwxAXVUNKGS49euBKFYyVtR0Oy/rc2VvEB7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="488181"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="488181"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 10:40:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="932780307"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="932780307"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2024 10:40:20 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWKw6-0005Ti-0K;
	Sat, 03 Feb 2024 18:40:18 +0000
Date: Sun, 4 Feb 2024 02:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tobetter:odroid-6.6.y 21/51] drivers/net/phy/phy_device.c:1836
 phy_detach() error: we previously assumed 'dev' could be null (see line
 1815)
Message-ID: <202402040224.6ErXx7IE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   0ea9759612aba09cc99b50301b281417f70e847c
commit: 10a25be4b77c699179ad1d36f7c67491c812c34e [21/51] ODROID-COMMON: phy/realtek: add Wake-on-Lan to Realtek PHY
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240203 (https://download.01.org/0day-ci/archive/20240204/202402040224.6ErXx7IE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402040224.6ErXx7IE-lkp@intel.com/

smatch warnings:
drivers/net/phy/phy_device.c:1836 phy_detach() error: we previously assumed 'dev' could be null (see line 1815)
drivers/net/phy/phy_device.c:1848 phy_detach() warn: variable dereferenced before check 'dev' (see line 1836)

vim +/dev +1836 drivers/net/phy/phy_device.c

6349084746ff4f Michael Walle      2020-05-06  1787  
b3df0da886ffdb Randy Dunlap       2007-03-06  1788  /**
b3df0da886ffdb Randy Dunlap       2007-03-06  1789   * phy_detach - detach a PHY device from its network device
b3df0da886ffdb Randy Dunlap       2007-03-06  1790   * @phydev: target phy_device struct
7322967bc1bd97 Russell King       2015-09-24  1791   *
7322967bc1bd97 Russell King       2015-09-24  1792   * This detaches the phy device from its network device and the phy
7322967bc1bd97 Russell King       2015-09-24  1793   * driver, and drops the reference count taken in phy_attach_direct().
b3df0da886ffdb Randy Dunlap       2007-03-06  1794   */
e13934563db047 Andy Fleming       2005-08-24  1795  void phy_detach(struct phy_device *phydev)
e13934563db047 Andy Fleming       2005-08-24  1796  {
ec988ad78ed6d1 Florian Fainelli   2016-12-06  1797  	struct net_device *dev = phydev->attached_dev;
2db2d9d1ac3722 Ioana Ciornei      2019-05-28  1798  	struct module *ndev_owner = NULL;
3e3aaf64941698 Russell King       2015-09-24  1799  	struct mii_bus *bus;
b3565f278a9bab Ezequiel Garcia    2014-07-23  1800  
bc66fa87d4fda9 Xiaolei Wang       2022-11-30  1801  	if (phydev->devlink)
bc66fa87d4fda9 Xiaolei Wang       2022-11-30  1802  		device_link_del(phydev->devlink);
bc66fa87d4fda9 Xiaolei Wang       2022-11-30  1803  
a3995460491d45 Florian Fainelli   2017-05-27  1804  	if (phydev->sysfs_links) {
2db2d9d1ac3722 Ioana Ciornei      2019-05-28  1805  		if (dev)
5568363f0cb358 Florian Fainelli   2017-05-25  1806  			sysfs_remove_link(&dev->dev.kobj, "phydev");
5568363f0cb358 Florian Fainelli   2017-05-25  1807  		sysfs_remove_link(&phydev->mdio.dev.kobj, "attached_dev");
a3995460491d45 Florian Fainelli   2017-05-27  1808  	}
c920f745f45d46 Ioana Ciornei      2019-05-28  1809  
c920f745f45d46 Ioana Ciornei      2019-05-28  1810  	if (!phydev->attached_dev)
c920f745f45d46 Ioana Ciornei      2019-05-28  1811  		sysfs_remove_file(&phydev->mdio.dev.kobj,
c920f745f45d46 Ioana Ciornei      2019-05-28  1812  				  &dev_attr_phy_standalone.attr);
c920f745f45d46 Ioana Ciornei      2019-05-28  1813  
93f41e67dc8ff0 Heiner Kallweit    2018-09-24  1814  	phy_suspend(phydev);
2db2d9d1ac3722 Ioana Ciornei      2019-05-28 @1815  	if (dev) {
c1f19b51d1d87f Richard Cochran    2010-07-17  1816  		phydev->attached_dev->phydev = NULL;
e13934563db047 Andy Fleming       2005-08-24  1817  		phydev->attached_dev = NULL;
2db2d9d1ac3722 Ioana Ciornei      2019-05-28  1818  	}
9525ae83959b60 Russell King       2017-07-25  1819  	phydev->phylink = NULL;
e13934563db047 Andy Fleming       2005-08-24  1820  
d98ce1f083cca8 Daniel Golle       2023-12-12  1821  	if (!phydev->is_on_sfp_module)
0075bd692dca03 Geert Uytterhoeven 2016-11-28  1822  		phy_led_triggers_unregister(phydev);
0075bd692dca03 Geert Uytterhoeven 2016-11-28  1823  
c2b727df7caa33 Florian Fainelli   2020-09-16  1824  	if (phydev->mdio.dev.driver)
6d9f66ac7fec2a Florian Fainelli   2017-02-08  1825  		module_put(phydev->mdio.dev.driver->owner);
6d9f66ac7fec2a Florian Fainelli   2017-02-08  1826  
e13934563db047 Andy Fleming       2005-08-24  1827  	/* If the device had no specific driver before (i.e. - it
e13934563db047 Andy Fleming       2005-08-24  1828  	 * was using the generic driver), we unbind the device
e13934563db047 Andy Fleming       2005-08-24  1829  	 * from the generic driver so that there's a chance a
2f53e9047e79b6 Sergei Shtylyov    2014-01-05  1830  	 * real driver could be loaded
2f53e9047e79b6 Sergei Shtylyov    2014-01-05  1831  	 */
5db5ea995fc2fa Florian Fainelli   2019-01-15  1832  	if (phy_driver_is_genphy(phydev) ||
5db5ea995fc2fa Florian Fainelli   2019-01-15  1833  	    phy_driver_is_genphy_10g(phydev))
e5a03bfd873c29 Andrew Lunn        2016-01-06  1834  		device_release_driver(&phydev->mdio.dev);
3e3aaf64941698 Russell King       2015-09-24  1835  
10a25be4b77c69 Dongjin Kim        2021-11-17 @1836  	if (!dev->wol_enabled) {
cbda1b16687580 Marek Behún        2022-01-19  1837  		/* Assert the reset signal */
cbda1b16687580 Marek Behún        2022-01-19  1838  		phy_device_reset(phydev, 1);
10a25be4b77c69 Dongjin Kim        2021-11-17  1839  	}
cbda1b16687580 Marek Behún        2022-01-19  1840  
7322967bc1bd97 Russell King       2015-09-24  1841  	/*
7322967bc1bd97 Russell King       2015-09-24  1842  	 * The phydev might go away on the put_device() below, so avoid
7322967bc1bd97 Russell King       2015-09-24  1843  	 * a use-after-free bug by reading the underlying bus first.
7322967bc1bd97 Russell King       2015-09-24  1844  	 */
e5a03bfd873c29 Andrew Lunn        2016-01-06  1845  	bus = phydev->mdio.bus;
3e3aaf64941698 Russell King       2015-09-24  1846  
e5a03bfd873c29 Andrew Lunn        2016-01-06  1847  	put_device(&phydev->mdio.dev);
2db2d9d1ac3722 Ioana Ciornei      2019-05-28 @1848  	if (dev)
2db2d9d1ac3722 Ioana Ciornei      2019-05-28  1849  		ndev_owner = dev->dev.parent->driver->owner;
ec988ad78ed6d1 Florian Fainelli   2016-12-06  1850  	if (ndev_owner != bus->owner)
3e3aaf64941698 Russell King       2015-09-24  1851  		module_put(bus->owner);
e13934563db047 Andy Fleming       2005-08-24  1852  }
e13934563db047 Andy Fleming       2005-08-24  1853  EXPORT_SYMBOL(phy_detach);
e13934563db047 Andy Fleming       2005-08-24  1854  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
