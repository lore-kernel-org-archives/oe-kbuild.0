Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D45E7C
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 00:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690419100; x=1721955100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wJ7PYxq5L7Is/POLLm3toCVuUAHSI8+0Z7EV2LkbrGw=;
  b=e7uyBp+Jim00HyhZMgfxpSkC4l+o49wSsV0bRUnlga/f+ytuwqTZGdbm
   pB4J6h+M07n+79uCeLsosgJUWOpyF204amc21H6EtJcVDbeIrTbHSzRiT
   3B6qk1cf6kvCksaOgbRW1B4tD5iuEqTjY8//QinCotnVFgeE08V2YVNVF
   yclH19+r/AhKvCY7mTMTdCP1HDTGvgd1yY92t2yrq1YLiElOCCT00ivBp
   6uVr8zXhl9S9hy3v1gJfCKDn/W32oelYjqnillBEZUeXRfYiMQBysPiWo
   NkdLlWOHLI1qDy5/BYAKoTaW0RVwoutFGMHgPuWDzkQJj9b37lB4xRQ4T
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="431970389"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="431970389"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 17:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="792104332"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="792104332"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jul 2023 17:51:36 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOpE7-0001Ub-1o;
	Thu, 27 Jul 2023 00:51:35 +0000
Date: Thu, 27 Jul 2023 08:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] USB: Fix race condition during UVC webcam disconnect
Message-ID: <202307270834.rpaexQSs-lkp@intel.com>
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
In-Reply-To: <20230720113142.3070583-1-aman.deep@samsung.com>
References: <20230720113142.3070583-1-aman.deep@samsung.com>
TO: Aman Deep <aman.deep@samsung.com>
TO: gregkh@linuxfoundation.org
TO: stern@rowland.harvard.edu
TO: laurent.pinchart@ideasonboard.com
CC: linux-usb@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Aman Deep <aman.deep@samsung.com>
CC: Anuj Gupta <anuj01.gupta@samsung.com>

Hi Aman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.5-rc3 next-20230726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Deep/USB-Fix-race-condition-during-UVC-webcam-disconnect/20230720-202046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230720113142.3070583-1-aman.deep%40samsung.com
patch subject: [PATCH] USB: Fix race condition during UVC webcam disconnect
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: parisc-randconfig-m041-20230726 (https://download.01.org/0day-ci/archive/20230727/202307270834.rpaexQSs-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270834.rpaexQSs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307270834.rpaexQSs-lkp@intel.com/

smatch warnings:
drivers/usb/core/message.c:1668 usb_set_interface() warn: inconsistent returns 'hcd->bandwidth_mutex'.

vim +1668 drivers/usb/core/message.c

^1da177e4c3f41 Linus Torvalds                2005-04-16  1488  
^1da177e4c3f41 Linus Torvalds                2005-04-16  1489  /**
^1da177e4c3f41 Linus Torvalds                2005-04-16  1490   * usb_set_interface - Makes a particular alternate setting be current
^1da177e4c3f41 Linus Torvalds                2005-04-16  1491   * @dev: the device whose interface is being updated
^1da177e4c3f41 Linus Torvalds                2005-04-16  1492   * @interface: the interface being updated
^1da177e4c3f41 Linus Torvalds                2005-04-16  1493   * @alternate: the setting being chosen.
41631d3616c363 Ahmed S. Darwish              2020-10-19  1494   *
41631d3616c363 Ahmed S. Darwish              2020-10-19  1495   * Context: task context, might sleep.
^1da177e4c3f41 Linus Torvalds                2005-04-16  1496   *
^1da177e4c3f41 Linus Torvalds                2005-04-16  1497   * This is used to enable data transfers on interfaces that may not
^1da177e4c3f41 Linus Torvalds                2005-04-16  1498   * be enabled by default.  Not all devices support such configurability.
^1da177e4c3f41 Linus Torvalds                2005-04-16  1499   * Only the driver bound to an interface may change its setting.
^1da177e4c3f41 Linus Torvalds                2005-04-16  1500   *
^1da177e4c3f41 Linus Torvalds                2005-04-16  1501   * Within any given configuration, each interface may have several
^1da177e4c3f41 Linus Torvalds                2005-04-16  1502   * alternative settings.  These are often used to control levels of
^1da177e4c3f41 Linus Torvalds                2005-04-16  1503   * bandwidth consumption.  For example, the default setting for a high
^1da177e4c3f41 Linus Torvalds                2005-04-16  1504   * speed interrupt endpoint may not send more than 64 bytes per microframe,
^1da177e4c3f41 Linus Torvalds                2005-04-16  1505   * while interrupt transfers of up to 3KBytes per microframe are legal.
^1da177e4c3f41 Linus Torvalds                2005-04-16  1506   * Also, isochronous endpoints may never be part of an
^1da177e4c3f41 Linus Torvalds                2005-04-16  1507   * interface's default setting.  To access such bandwidth, alternate
^1da177e4c3f41 Linus Torvalds                2005-04-16  1508   * interface settings must be made current.
^1da177e4c3f41 Linus Torvalds                2005-04-16  1509   *
^1da177e4c3f41 Linus Torvalds                2005-04-16  1510   * Note that in the Linux USB subsystem, bandwidth associated with
^1da177e4c3f41 Linus Torvalds                2005-04-16  1511   * an endpoint in a given alternate setting is not reserved until an URB
^1da177e4c3f41 Linus Torvalds                2005-04-16  1512   * is submitted that needs that bandwidth.  Some other operating systems
^1da177e4c3f41 Linus Torvalds                2005-04-16  1513   * allocate bandwidth early, when a configuration is chosen.
^1da177e4c3f41 Linus Torvalds                2005-04-16  1514   *
f9a5b4f58b280c Mathias Nyman                 2018-09-03  1515   * xHCI reserves bandwidth and configures the alternate setting in
f9a5b4f58b280c Mathias Nyman                 2018-09-03  1516   * usb_hcd_alloc_bandwidth(). If it fails the original interface altsetting
f9a5b4f58b280c Mathias Nyman                 2018-09-03  1517   * may be disabled. Drivers cannot rely on any particular alternate
f9a5b4f58b280c Mathias Nyman                 2018-09-03  1518   * setting being in effect after a failure.
f9a5b4f58b280c Mathias Nyman                 2018-09-03  1519   *
^1da177e4c3f41 Linus Torvalds                2005-04-16  1520   * This call is synchronous, and may not be used in an interrupt context.
^1da177e4c3f41 Linus Torvalds                2005-04-16  1521   * Also, drivers must not change altsettings while urbs are scheduled for
^1da177e4c3f41 Linus Torvalds                2005-04-16  1522   * endpoints in that interface; all such urbs must first be completed
^1da177e4c3f41 Linus Torvalds                2005-04-16  1523   * (perhaps forced by unlinking).
^1da177e4c3f41 Linus Torvalds                2005-04-16  1524   *
626f090c5cbbe5 Yacine Belkadi                2013-08-02  1525   * Return: Zero on success, or else the status code returned by the
^1da177e4c3f41 Linus Torvalds                2005-04-16  1526   * underlying usb_control_msg() call.
^1da177e4c3f41 Linus Torvalds                2005-04-16  1527   */
^1da177e4c3f41 Linus Torvalds                2005-04-16  1528  int usb_set_interface(struct usb_device *dev, int interface, int alternate)
^1da177e4c3f41 Linus Torvalds                2005-04-16  1529  {
^1da177e4c3f41 Linus Torvalds                2005-04-16  1530  	struct usb_interface *iface;
^1da177e4c3f41 Linus Torvalds                2005-04-16  1531  	struct usb_host_interface *alt;
3f0479e00a3fca Sarah Sharp                   2009-12-03  1532  	struct usb_hcd *hcd = bus_to_hcd(dev->bus);
7a7b562d08ad6d Hans de Goede                 2013-11-08  1533  	int i, ret, manual = 0;
3e35bf39e0b909 Greg Kroah-Hartman            2008-01-30  1534  	unsigned int epaddr;
3e35bf39e0b909 Greg Kroah-Hartman            2008-01-30  1535  	unsigned int pipe;
^1da177e4c3f41 Linus Torvalds                2005-04-16  1536  
^1da177e4c3f41 Linus Torvalds                2005-04-16  1537  	if (dev->state == USB_STATE_SUSPENDED)
^1da177e4c3f41 Linus Torvalds                2005-04-16  1538  		return -EHOSTUNREACH;
^1da177e4c3f41 Linus Torvalds                2005-04-16  1539  
^1da177e4c3f41 Linus Torvalds                2005-04-16  1540  	iface = usb_ifnum_to_if(dev, interface);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1541  	if (!iface) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  1542  		dev_dbg(&dev->dev, "selecting invalid interface %d\n",
^1da177e4c3f41 Linus Torvalds                2005-04-16  1543  			interface);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1544  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds                2005-04-16  1545  	}
e534c5b831c8b8 Alan Stern                    2011-07-01  1546  	if (iface->unregistering)
e534c5b831c8b8 Alan Stern                    2011-07-01  1547  		return -ENODEV;
^1da177e4c3f41 Linus Torvalds                2005-04-16  1548  
^1da177e4c3f41 Linus Torvalds                2005-04-16  1549  	alt = usb_altnum_to_altsetting(iface, alternate);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1550  	if (!alt) {
385f690bc058ba Thadeu Lima de Souza Cascardo 2010-01-17  1551  		dev_warn(&dev->dev, "selecting invalid altsetting %d\n",
3b6004f3b5a8b4 Greg Kroah-Hartman            2008-08-14  1552  			 alternate);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1553  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds                2005-04-16  1554  	}
f9a5b4f58b280c Mathias Nyman                 2018-09-03  1555  	/*
f9a5b4f58b280c Mathias Nyman                 2018-09-03  1556  	 * usb3 hosts configure the interface in usb_hcd_alloc_bandwidth,
f9a5b4f58b280c Mathias Nyman                 2018-09-03  1557  	 * including freeing dropped endpoint ring buffers.
f9a5b4f58b280c Mathias Nyman                 2018-09-03  1558  	 * Make sure the interface endpoints are flushed before that
f9a5b4f58b280c Mathias Nyman                 2018-09-03  1559  	 */
f9a5b4f58b280c Mathias Nyman                 2018-09-03  1560  	usb_disable_interface(dev, iface, false);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1561  
3f0479e00a3fca Sarah Sharp                   2009-12-03  1562  	/* Make sure we have enough bandwidth for this alternate interface.
3f0479e00a3fca Sarah Sharp                   2009-12-03  1563  	 * Remove the current alt setting and add the new alt setting.
3f0479e00a3fca Sarah Sharp                   2009-12-03  1564  	 */
d673bfcbfffdeb Sarah Sharp                   2010-10-15  1565  	mutex_lock(hcd->bandwidth_mutex);
8306095fd2c110 Sarah Sharp                   2012-05-02  1566  	/* Disable LPM, and re-enable it once the new alt setting is installed,
8306095fd2c110 Sarah Sharp                   2012-05-02  1567  	 * so that the xHCI driver can recalculate the U1/U2 timeouts.
8306095fd2c110 Sarah Sharp                   2012-05-02  1568  	 */
8306095fd2c110 Sarah Sharp                   2012-05-02  1569  	if (usb_disable_lpm(dev)) {
1ccc417e6c3201 Joe Perches                   2017-12-05  1570  		dev_err(&iface->dev, "%s Failed to disable LPM\n", __func__);
8306095fd2c110 Sarah Sharp                   2012-05-02  1571  		mutex_unlock(hcd->bandwidth_mutex);
8306095fd2c110 Sarah Sharp                   2012-05-02  1572  		return -ENOMEM;
8306095fd2c110 Sarah Sharp                   2012-05-02  1573  	}
7a7b562d08ad6d Hans de Goede                 2013-11-08  1574  	/* Changing alt-setting also frees any allocated streams */
7a7b562d08ad6d Hans de Goede                 2013-11-08  1575  	for (i = 0; i < iface->cur_altsetting->desc.bNumEndpoints; i++)
7a7b562d08ad6d Hans de Goede                 2013-11-08  1576  		iface->cur_altsetting->endpoint[i].streams = 0;
7a7b562d08ad6d Hans de Goede                 2013-11-08  1577  
4682bbb9e2f196 Aman Deep                     2023-07-20  1578  	if (dev->state == USB_STATE_NOTATTACHED)
4682bbb9e2f196 Aman Deep                     2023-07-20  1579  		return -ENODEV;
4682bbb9e2f196 Aman Deep                     2023-07-20  1580  
3f0479e00a3fca Sarah Sharp                   2009-12-03  1581  	ret = usb_hcd_alloc_bandwidth(dev, NULL, iface->cur_altsetting, alt);
4682bbb9e2f196 Aman Deep                     2023-07-20  1582  
3f0479e00a3fca Sarah Sharp                   2009-12-03  1583  	if (ret < 0) {
3f0479e00a3fca Sarah Sharp                   2009-12-03  1584  		dev_info(&dev->dev, "Not enough bandwidth for altsetting %d\n",
3f0479e00a3fca Sarah Sharp                   2009-12-03  1585  				alternate);
8306095fd2c110 Sarah Sharp                   2012-05-02  1586  		usb_enable_lpm(dev);
d673bfcbfffdeb Sarah Sharp                   2010-10-15  1587  		mutex_unlock(hcd->bandwidth_mutex);
3f0479e00a3fca Sarah Sharp                   2009-12-03  1588  		return ret;
3f0479e00a3fca Sarah Sharp                   2009-12-03  1589  	}
3f0479e00a3fca Sarah Sharp                   2009-12-03  1590  
392e1d9817d002 Alan Stern                    2008-03-11  1591  	if (dev->quirks & USB_QUIRK_NO_SET_INTF)
392e1d9817d002 Alan Stern                    2008-03-11  1592  		ret = -EPIPE;
392e1d9817d002 Alan Stern                    2008-03-11  1593  	else
297e84c04d76b9 Greg Kroah-Hartman            2020-09-14  1594  		ret = usb_control_msg_send(dev, 0,
297e84c04d76b9 Greg Kroah-Hartman            2020-09-14  1595  					   USB_REQ_SET_INTERFACE,
297e84c04d76b9 Greg Kroah-Hartman            2020-09-14  1596  					   USB_RECIP_INTERFACE, alternate,
ddd1198e3e0935 Oliver Neukum                 2020-09-23  1597  					   interface, NULL, 0, 5000,
ddd1198e3e0935 Oliver Neukum                 2020-09-23  1598  					   GFP_NOIO);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1599  
^1da177e4c3f41 Linus Torvalds                2005-04-16  1600  	/* 9.4.10 says devices don't need this and are free to STALL the
^1da177e4c3f41 Linus Torvalds                2005-04-16  1601  	 * request if the interface only has one alternate setting.
^1da177e4c3f41 Linus Torvalds                2005-04-16  1602  	 */
^1da177e4c3f41 Linus Torvalds                2005-04-16  1603  	if (ret == -EPIPE && iface->num_altsetting == 1) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  1604  		dev_dbg(&dev->dev,
^1da177e4c3f41 Linus Torvalds                2005-04-16  1605  			"manual set_interface for iface %d, alt %d\n",
^1da177e4c3f41 Linus Torvalds                2005-04-16  1606  			interface, alternate);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1607  		manual = 1;
297e84c04d76b9 Greg Kroah-Hartman            2020-09-14  1608  	} else if (ret) {
3f0479e00a3fca Sarah Sharp                   2009-12-03  1609  		/* Re-instate the old alt setting */
3f0479e00a3fca Sarah Sharp                   2009-12-03  1610  		usb_hcd_alloc_bandwidth(dev, NULL, alt, iface->cur_altsetting);
8306095fd2c110 Sarah Sharp                   2012-05-02  1611  		usb_enable_lpm(dev);
d673bfcbfffdeb Sarah Sharp                   2010-10-15  1612  		mutex_unlock(hcd->bandwidth_mutex);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1613  		return ret;
3f0479e00a3fca Sarah Sharp                   2009-12-03  1614  	}
d673bfcbfffdeb Sarah Sharp                   2010-10-15  1615  	mutex_unlock(hcd->bandwidth_mutex);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1616  
^1da177e4c3f41 Linus Torvalds                2005-04-16  1617  	/* FIXME drivers shouldn't need to replicate/bugfix the logic here
^1da177e4c3f41 Linus Torvalds                2005-04-16  1618  	 * when they implement async or easily-killable versions of this or
^1da177e4c3f41 Linus Torvalds                2005-04-16  1619  	 * other "should-be-internal" functions (like clear_halt).
^1da177e4c3f41 Linus Torvalds                2005-04-16  1620  	 * should hcd+usbcore postprocess control requests?
^1da177e4c3f41 Linus Torvalds                2005-04-16  1621  	 */
^1da177e4c3f41 Linus Torvalds                2005-04-16  1622  
^1da177e4c3f41 Linus Torvalds                2005-04-16  1623  	/* prevent submissions using previous endpoint settings */
3b23dd6f8a718e Alan Stern                    2008-12-05  1624  	if (iface->cur_altsetting != alt) {
3b23dd6f8a718e Alan Stern                    2008-12-05  1625  		remove_intf_ep_devs(iface);
0e6c8e8db508fc Alan Stern                    2005-10-24  1626  		usb_remove_sysfs_intf_files(iface);
3b23dd6f8a718e Alan Stern                    2008-12-05  1627  	}
ddeac4e75f2527 Alan Stern                    2009-01-15  1628  	usb_disable_interface(dev, iface, true);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1629  
^1da177e4c3f41 Linus Torvalds                2005-04-16  1630  	iface->cur_altsetting = alt;
^1da177e4c3f41 Linus Torvalds                2005-04-16  1631  
8306095fd2c110 Sarah Sharp                   2012-05-02  1632  	/* Now that the interface is installed, re-enable LPM. */
8306095fd2c110 Sarah Sharp                   2012-05-02  1633  	usb_unlocked_enable_lpm(dev);
8306095fd2c110 Sarah Sharp                   2012-05-02  1634  
^1da177e4c3f41 Linus Torvalds                2005-04-16  1635  	/* If the interface only has one altsetting and the device didn't
a81e7ecca369af David Brownell                2005-04-18  1636  	 * accept the request, we attempt to carry out the equivalent action
^1da177e4c3f41 Linus Torvalds                2005-04-16  1637  	 * by manually clearing the HALT feature for each endpoint in the
^1da177e4c3f41 Linus Torvalds                2005-04-16  1638  	 * new altsetting.
^1da177e4c3f41 Linus Torvalds                2005-04-16  1639  	 */
^1da177e4c3f41 Linus Torvalds                2005-04-16  1640  	if (manual) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  1641  		for (i = 0; i < alt->desc.bNumEndpoints; i++) {
3e35bf39e0b909 Greg Kroah-Hartman            2008-01-30  1642  			epaddr = alt->endpoint[i].desc.bEndpointAddress;
3e35bf39e0b909 Greg Kroah-Hartman            2008-01-30  1643  			pipe = __create_pipe(dev,
3e35bf39e0b909 Greg Kroah-Hartman            2008-01-30  1644  					USB_ENDPOINT_NUMBER_MASK & epaddr) |
3e35bf39e0b909 Greg Kroah-Hartman            2008-01-30  1645  					(usb_endpoint_out(epaddr) ?
3e35bf39e0b909 Greg Kroah-Hartman            2008-01-30  1646  					USB_DIR_OUT : USB_DIR_IN);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1647  
^1da177e4c3f41 Linus Torvalds                2005-04-16  1648  			usb_clear_halt(dev, pipe);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1649  		}
^1da177e4c3f41 Linus Torvalds                2005-04-16  1650  	}
^1da177e4c3f41 Linus Torvalds                2005-04-16  1651  
^1da177e4c3f41 Linus Torvalds                2005-04-16  1652  	/* 9.1.1.5: reset toggles for all endpoints in the new altsetting
^1da177e4c3f41 Linus Torvalds                2005-04-16  1653  	 *
^1da177e4c3f41 Linus Torvalds                2005-04-16  1654  	 * Note:
^1da177e4c3f41 Linus Torvalds                2005-04-16  1655  	 * Despite EP0 is always present in all interfaces/AS, the list of
^1da177e4c3f41 Linus Torvalds                2005-04-16  1656  	 * endpoints from the descriptor does not contain EP0. Due to its
^1da177e4c3f41 Linus Torvalds                2005-04-16  1657  	 * omnipresence one might expect EP0 being considered "affected" by
^1da177e4c3f41 Linus Torvalds                2005-04-16  1658  	 * any SetInterface request and hence assume toggles need to be reset.
^1da177e4c3f41 Linus Torvalds                2005-04-16  1659  	 * However, EP0 toggles are re-synced for every individual transfer
^1da177e4c3f41 Linus Torvalds                2005-04-16  1660  	 * during the SETUP stage - hence EP0 toggles are "don't care" here.
^1da177e4c3f41 Linus Torvalds                2005-04-16  1661  	 * (Likewise, EP0 never "halts" on well designed devices.)
^1da177e4c3f41 Linus Torvalds                2005-04-16  1662  	 */
2caf7fcdb85320 Alan Stern                    2008-12-31  1663  	usb_enable_interface(dev, iface, true);
3b23dd6f8a718e Alan Stern                    2008-12-05  1664  	if (device_is_registered(&iface->dev)) {
0e6c8e8db508fc Alan Stern                    2005-10-24  1665  		usb_create_sysfs_intf_files(iface);
3b23dd6f8a718e Alan Stern                    2008-12-05  1666  		create_intf_ep_devs(iface);
3b23dd6f8a718e Alan Stern                    2008-12-05  1667  	}
^1da177e4c3f41 Linus Torvalds                2005-04-16 @1668  	return 0;
^1da177e4c3f41 Linus Torvalds                2005-04-16  1669  }
782e70c6fc2290 Greg Kroah-Hartman            2008-01-25  1670  EXPORT_SYMBOL_GPL(usb_set_interface);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1671  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
