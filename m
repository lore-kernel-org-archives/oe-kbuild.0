Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD6822CBD8
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Dec 2024 17:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714775; cv=none; b=mJJHseMmYazT8wJ2+1lBLzExoME0g+GaJzhKjy9r2jXF2rfj8F+S2IYAor2yJnlxruy/ecjmBtPANywis4cuqbdgcYBb2RsynPrnhI7aKXILZlABOGfo39aU8EltiVQppQFHcMBfSFcJI1xe5Mwer9WjbFNYENAZ1NRNGwRtUrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714775; c=relaxed/simple;
	bh=thaMJOE94nhs6yK5FJy5BjtBfkiVOUNbJR84F1NNV3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QyH/D3BJfxtZNKkh9ZmOHuV9T3h9MT7EeHNPRvLXig3GUiwJglHeNXhaAZG20pmhnzDXoXddfXmC9xkvx6Q5kovnDSyVG17eXTHFA3MBJCk1pcCE2romHiENlyErQsRBgIXzcwr/GSlE6osF1P6k2+aj4AHjyyp6c5QzKD+77AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XC+UatdJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XC+UatdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734714774; x=1766250774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=thaMJOE94nhs6yK5FJy5BjtBfkiVOUNbJR84F1NNV3s=;
  b=XC+UatdJ1/QGsL2SGHAB6dhg6yx2FOlVlTuS46EOcRteKByU9CKz8BVu
   NiGgHdR8ZR2I6Ywn/89ahja5gLOhfYHts4BuLbXEMEZPZC9ISZT3i5yug
   QQcGpxFvAmOXDz7SOpakNyonoxIodewp9yZsPtXNSn9bw8nANWyH3mc+1
   iSLpqGFz0b2+v9e4Au/+00sP9YmNNoXrawwYwzOxSRPue+nN5nfUULXWu
   Xedj3CkAWxJd+sLDeC5osCQWi+V0kbQiQ4hTZd3r4t2QTyzkHOnfJrkqZ
   qUeZ5KdvBGdCG0JxYXYSESfyrQEFtlubH9g6Kj/BJc35oKJdTM69sflvP
   A==;
X-CSE-ConnectionGUID: jBeiP7M7SxeZkwGy4VANrg==
X-CSE-MsgGUID: S8+nd+I2Qj+2xwiM16wVpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39205593"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="39205593"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 09:12:53 -0800
X-CSE-ConnectionGUID: bfqziU6AR3ChotYBARIPsQ==
X-CSE-MsgGUID: QQ65GR+UQc651YVrtgn18g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98340035"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2024 09:12:50 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOgYT-0001Sx-1Q;
	Fri, 20 Dec 2024 17:12:49 +0000
Date: Sat, 21 Dec 2024 01:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/staging/gpib/agilent_82357a/agilent_82357a.c:1381
 agilent_82357a_attach() warn: inconsistent returns 'global
 &agilent_82357a_hotplug_lock'.
Message-ID: <202412210143.WJhYzXfD-lkp@intel.com>
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
TO: Dave Penkler <dpenkler@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
date:   2 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 2 months ago
config: i386-randconfig-141-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210143.WJhYzXfD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412210143.WJhYzXfD-lkp@intel.com/

smatch warnings:
drivers/staging/gpib/agilent_82357a/agilent_82357a.c:1381 agilent_82357a_attach() warn: inconsistent returns 'global &agilent_82357a_hotplug_lock'.

vim +1381 drivers/staging/gpib/agilent_82357a/agilent_82357a.c

4c41fe886a56c5b Dave Penkler 2024-09-18  1305  
4c41fe886a56c5b Dave Penkler 2024-09-18  1306  static int agilent_82357a_attach(gpib_board_t *board, const gpib_board_config_t *config)
4c41fe886a56c5b Dave Penkler 2024-09-18  1307  {
4c41fe886a56c5b Dave Penkler 2024-09-18  1308  	int retval;
4c41fe886a56c5b Dave Penkler 2024-09-18  1309  	int i;
4c41fe886a56c5b Dave Penkler 2024-09-18  1310  	unsigned int product_id;
4c41fe886a56c5b Dave Penkler 2024-09-18  1311  	struct agilent_82357a_priv *a_priv;
4c41fe886a56c5b Dave Penkler 2024-09-18  1312  	struct usb_device *usb_dev;
4c41fe886a56c5b Dave Penkler 2024-09-18  1313  
4c41fe886a56c5b Dave Penkler 2024-09-18  1314  	if (mutex_lock_interruptible(&agilent_82357a_hotplug_lock))
4c41fe886a56c5b Dave Penkler 2024-09-18  1315  		return -ERESTARTSYS;
4c41fe886a56c5b Dave Penkler 2024-09-18  1316  
4c41fe886a56c5b Dave Penkler 2024-09-18  1317  	retval = agilent_82357a_allocate_private(board);
4c41fe886a56c5b Dave Penkler 2024-09-18  1318  	if (retval < 0) {
4c41fe886a56c5b Dave Penkler 2024-09-18  1319  		mutex_unlock(&agilent_82357a_hotplug_lock);
4c41fe886a56c5b Dave Penkler 2024-09-18  1320  		return retval;
4c41fe886a56c5b Dave Penkler 2024-09-18  1321  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1322  	a_priv = board->private_data;
4c41fe886a56c5b Dave Penkler 2024-09-18  1323  	for (i = 0; i < MAX_NUM_82357A_INTERFACES; ++i) {
4c41fe886a56c5b Dave Penkler 2024-09-18  1324  		if (agilent_82357a_driver_interfaces[i] &&
4c41fe886a56c5b Dave Penkler 2024-09-18  1325  		    !usb_get_intfdata(agilent_82357a_driver_interfaces[i]) &&
4c41fe886a56c5b Dave Penkler 2024-09-18  1326  		    agilent_82357a_device_match(agilent_82357a_driver_interfaces[i], config)) {
4c41fe886a56c5b Dave Penkler 2024-09-18  1327  			a_priv->bus_interface = agilent_82357a_driver_interfaces[i];
4c41fe886a56c5b Dave Penkler 2024-09-18  1328  			usb_set_intfdata(agilent_82357a_driver_interfaces[i], board);
4c41fe886a56c5b Dave Penkler 2024-09-18  1329  			usb_dev = interface_to_usbdev(a_priv->bus_interface);
4c41fe886a56c5b Dave Penkler 2024-09-18  1330  			dev_info(&usb_dev->dev,
4c41fe886a56c5b Dave Penkler 2024-09-18  1331  				 "bus %d dev num %d attached to gpib minor %d, agilent usb interface %i\n",
4c41fe886a56c5b Dave Penkler 2024-09-18  1332  				 usb_dev->bus->busnum, usb_dev->devnum, board->minor, i);
4c41fe886a56c5b Dave Penkler 2024-09-18  1333  			break;
4c41fe886a56c5b Dave Penkler 2024-09-18  1334  		}
4c41fe886a56c5b Dave Penkler 2024-09-18  1335  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1336  	if (i == MAX_NUM_82357A_INTERFACES) {
4c41fe886a56c5b Dave Penkler 2024-09-18  1337  		mutex_unlock(&agilent_82357a_hotplug_lock);
4c41fe886a56c5b Dave Penkler 2024-09-18  1338  		pr_err("No Agilent 82357 gpib adapters found, have you loaded its firmware?\n");
4c41fe886a56c5b Dave Penkler 2024-09-18  1339  		return -ENODEV;
4c41fe886a56c5b Dave Penkler 2024-09-18  1340  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1341  	product_id = le16_to_cpu(interface_to_usbdev(a_priv->bus_interface)->descriptor.idProduct);
4c41fe886a56c5b Dave Penkler 2024-09-18  1342  	switch (product_id) {
4c41fe886a56c5b Dave Penkler 2024-09-18  1343  	case USB_DEVICE_ID_AGILENT_82357A:
4c41fe886a56c5b Dave Penkler 2024-09-18  1344  		a_priv->bulk_out_endpoint = AGILENT_82357A_BULK_OUT_ENDPOINT;
4c41fe886a56c5b Dave Penkler 2024-09-18  1345  		a_priv->interrupt_in_endpoint = AGILENT_82357A_INTERRUPT_IN_ENDPOINT;
4c41fe886a56c5b Dave Penkler 2024-09-18  1346  		break;
4c41fe886a56c5b Dave Penkler 2024-09-18  1347  	case USB_DEVICE_ID_AGILENT_82357B:
4c41fe886a56c5b Dave Penkler 2024-09-18  1348  		a_priv->bulk_out_endpoint = AGILENT_82357B_BULK_OUT_ENDPOINT;
4c41fe886a56c5b Dave Penkler 2024-09-18  1349  		a_priv->interrupt_in_endpoint = AGILENT_82357B_INTERRUPT_IN_ENDPOINT;
4c41fe886a56c5b Dave Penkler 2024-09-18  1350  		break;
4c41fe886a56c5b Dave Penkler 2024-09-18  1351  	default:
4c41fe886a56c5b Dave Penkler 2024-09-18  1352  		pr_err("bug, unhandled product_id in switch?\n");
4c41fe886a56c5b Dave Penkler 2024-09-18  1353  		return -EIO;
4c41fe886a56c5b Dave Penkler 2024-09-18  1354  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1355  #ifdef RESET_USB_CONFIG
4c41fe886a56c5b Dave Penkler 2024-09-18  1356  	retval = agilent_82357a_reset_usb_configuration(board);
4c41fe886a56c5b Dave Penkler 2024-09-18  1357  	if (retval < 0)	{
4c41fe886a56c5b Dave Penkler 2024-09-18  1358  		mutex_unlock(&agilent_82357a_hotplug_lock);
4c41fe886a56c5b Dave Penkler 2024-09-18  1359  		return retval;
4c41fe886a56c5b Dave Penkler 2024-09-18  1360  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1361  #endif
4c41fe886a56c5b Dave Penkler 2024-09-18  1362  	retval = agilent_82357a_setup_urbs(board);
4c41fe886a56c5b Dave Penkler 2024-09-18  1363  	if (retval < 0)	{
4c41fe886a56c5b Dave Penkler 2024-09-18  1364  		mutex_unlock(&agilent_82357a_hotplug_lock);
4c41fe886a56c5b Dave Penkler 2024-09-18  1365  		return retval;
4c41fe886a56c5b Dave Penkler 2024-09-18  1366  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1367  
4c41fe886a56c5b Dave Penkler 2024-09-18  1368  	timer_setup(&a_priv->bulk_timer, agilent_82357a_timeout_handler, 0);
4c41fe886a56c5b Dave Penkler 2024-09-18  1369  
4c41fe886a56c5b Dave Penkler 2024-09-18  1370  	board->t1_nano_sec = 800;
4c41fe886a56c5b Dave Penkler 2024-09-18  1371  
4c41fe886a56c5b Dave Penkler 2024-09-18  1372  	retval = agilent_82357a_init(board);
4c41fe886a56c5b Dave Penkler 2024-09-18  1373  
4c41fe886a56c5b Dave Penkler 2024-09-18  1374  	if (retval < 0)	{
4c41fe886a56c5b Dave Penkler 2024-09-18  1375  		mutex_unlock(&agilent_82357a_hotplug_lock);
4c41fe886a56c5b Dave Penkler 2024-09-18  1376  		return retval;
4c41fe886a56c5b Dave Penkler 2024-09-18  1377  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1378  
4c41fe886a56c5b Dave Penkler 2024-09-18  1379  	pr_info("%s: attached\n", __func__);
4c41fe886a56c5b Dave Penkler 2024-09-18  1380  	mutex_unlock(&agilent_82357a_hotplug_lock);
4c41fe886a56c5b Dave Penkler 2024-09-18 @1381  	return retval;
4c41fe886a56c5b Dave Penkler 2024-09-18  1382  }
4c41fe886a56c5b Dave Penkler 2024-09-18  1383  

:::::: The code at line 1381 was first introduced by commit
:::::: 4c41fe886a56c5b4ef9695243b0ddb9d7d2c432c staging: gpib: Add Agilent/Keysight 82357x USB GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
