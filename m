Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E228F84037
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 22:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727130112; cv=none; b=rOL9HHRjV/NnoGBcuSnZ7cmLThlUPPBRyK8O+O78xHvJyyC/YeStqpWqvfsUHw2/lhdRMGuKmMiEDsrbgmJw11WbI3eOUwzNnaNDckMAPxi1L2b1YVUqnm2z/6zxvnHBNlRC9kYxhvjQy5COANbF+wlYKVfzUN07lLAJVsAR2Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727130112; c=relaxed/simple;
	bh=b6zyRkaYp+yQQbMi2Z4uSAAqeME5CBK/oMCLuukwldc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFGYQP3nlOwKhoKkSiqrUNEKMWegayL1NKp68J4IWpJVSaL7MMIxcACyhErKla1macqpKJ0cDsYrk/vW2vORAi7GWygorSA0WNMa0jIarLY2QqN/YaxfWJYlHFP0RaWAZVd2DjolitwjAX4i9L0ZwWMwltjq0Crd6rF5hRSWOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jc5Eauoo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jc5Eauoo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727130110; x=1758666110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b6zyRkaYp+yQQbMi2Z4uSAAqeME5CBK/oMCLuukwldc=;
  b=Jc5EauooCOt7Ulg6jevfDnZG23oF6f9KHcwGPptrqkqNOjrlVIIhiqh+
   k7JEG41R6SiY8nX2G1sqfSQkWUJ2W8AemzkoDYkeTG0qxdchlacP73S6s
   DStObybCKqBz81RhBUiRA9Pj70Y6DBZJi2JRiUb+GH7+fA4rHkoXmZZB/
   QbY1rCqjAhzZOhBeDhDGYLrEkaIP0DNLZQ2Vt07Rn5hbxqV8q2fZScN2b
   JXYvoO1pbEN+Sww3aRxjsDgevISq+7C/FxxpASRO99+awY+w8/ITqExDM
   RVjC8F2ir0TgBvDIJYZ0n3Fe/BiBOephveI81SmSncMGRZ6deU6+FOsEd
   A==;
X-CSE-ConnectionGUID: J/vCWmEIS4a7OLRISejfIQ==
X-CSE-MsgGUID: l09YBEfZSkaL46qH/WCK7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="28993980"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="28993980"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 15:21:46 -0700
X-CSE-ConnectionGUID: VX6UXwbtT5+eZUVfb1SDjA==
X-CSE-MsgGUID: Bsb04LqyQTi8niSer8wq5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="75584191"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2024 15:21:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssrR9-000Hdr-0n;
	Mon, 23 Sep 2024 22:21:43 +0000
Date: Tue, 24 Sep 2024 06:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 171/448] drivers/usb/misc/legousbtower.c:560
 tower_read() warn: potential spectre issue 'dev->read_buffer' [r]
Message-ID: <202409240644.nGXDu1VG-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   7ef9d29ff0268d9fb68e3b1bf7548981d7a61307
commit: a2a767eca87909f70d81e2f9a7ec2abf7d2f3d4a [171/448] usb: misc: convert to read/write iterators
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: s390-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240924/202409240644.nGXDu1VG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409240644.nGXDu1VG-lkp@intel.com/

smatch warnings:
drivers/usb/misc/legousbtower.c:560 tower_read() warn: potential spectre issue 'dev->read_buffer' [r]

vim +560 drivers/usb/misc/legousbtower.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  487  
^1da177e4c3f41 Linus Torvalds     2005-04-16  488  
464b7d0e538ef2 Lee Jones          2020-07-06  489  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  490   *	tower_read
^1da177e4c3f41 Linus Torvalds     2005-04-16  491   */
a2a767eca87909 Jens Axboe         2024-04-11  492  static ssize_t tower_read(struct kiocb *iocb, struct iov_iter *to)
^1da177e4c3f41 Linus Torvalds     2005-04-16  493  {
a2a767eca87909 Jens Axboe         2024-04-11  494  	size_t count = iov_iter_count(to);
^1da177e4c3f41 Linus Torvalds     2005-04-16  495  	struct lego_usb_tower *dev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  496  	size_t bytes_to_read;
^1da177e4c3f41 Linus Torvalds     2005-04-16  497  	int i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  498  	int retval = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  499  	unsigned long timeout = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  500  
a2a767eca87909 Jens Axboe         2024-04-11  501  	dev = iocb->ki_filp->private_data;
^1da177e4c3f41 Linus Torvalds     2005-04-16  502  
^1da177e4c3f41 Linus Torvalds     2005-04-16  503  	/* lock this object */
18bcbcfe9ca230 Daniel Walker      2008-01-11  504  	if (mutex_lock_interruptible(&dev->lock)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  505  		retval = -ERESTARTSYS;
^1da177e4c3f41 Linus Torvalds     2005-04-16  506  		goto exit;
^1da177e4c3f41 Linus Torvalds     2005-04-16  507  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  508  
^1da177e4c3f41 Linus Torvalds     2005-04-16  509  	/* verify that the device wasn't unplugged */
cd81e6fa8e033e Johan Hovold       2019-09-19  510  	if (dev->disconnected) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  511  		retval = -ENODEV;
^1da177e4c3f41 Linus Torvalds     2005-04-16  512  		goto unlock_exit;
^1da177e4c3f41 Linus Torvalds     2005-04-16  513  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  514  
^1da177e4c3f41 Linus Torvalds     2005-04-16  515  	/* verify that we actually have some data to read */
^1da177e4c3f41 Linus Torvalds     2005-04-16  516  	if (count == 0) {
fef526cae70047 Greg Kroah-Hartman 2013-06-26  517  		dev_dbg(&dev->udev->dev, "read request of 0 bytes\n");
^1da177e4c3f41 Linus Torvalds     2005-04-16  518  		goto unlock_exit;
^1da177e4c3f41 Linus Torvalds     2005-04-16  519  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  520  
3c84f4bbe33f1f Johan Hovold       2019-11-05  521  	if (read_timeout)
8f7e9473ab6213 Nicholas Mc Guire  2015-02-06  522  		timeout = jiffies + msecs_to_jiffies(read_timeout);
^1da177e4c3f41 Linus Torvalds     2005-04-16  523  
^1da177e4c3f41 Linus Torvalds     2005-04-16  524  	/* wait for data */
^1da177e4c3f41 Linus Torvalds     2005-04-16  525  	tower_check_for_read_packet(dev);
^1da177e4c3f41 Linus Torvalds     2005-04-16  526  	while (dev->read_packet_length == 0) {
a2a767eca87909 Jens Axboe         2024-04-11  527  		if (iocb->ki_filp->f_flags & O_NONBLOCK) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  528  			retval = -EAGAIN;
^1da177e4c3f41 Linus Torvalds     2005-04-16  529  			goto unlock_exit;
^1da177e4c3f41 Linus Torvalds     2005-04-16  530  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  531  		retval = wait_event_interruptible_timeout(dev->read_wait, dev->interrupt_in_done, dev->packet_timeout_jiffies);
3c84f4bbe33f1f Johan Hovold       2019-11-05  532  		if (retval < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  533  			goto unlock_exit;
^1da177e4c3f41 Linus Torvalds     2005-04-16  534  
^1da177e4c3f41 Linus Torvalds     2005-04-16  535  		/* reset read timeout during read or write activity */
^1da177e4c3f41 Linus Torvalds     2005-04-16  536  		if (read_timeout
^1da177e4c3f41 Linus Torvalds     2005-04-16  537  		    && (dev->read_buffer_length || dev->interrupt_out_busy)) {
8f7e9473ab6213 Nicholas Mc Guire  2015-02-06  538  			timeout = jiffies + msecs_to_jiffies(read_timeout);
^1da177e4c3f41 Linus Torvalds     2005-04-16  539  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  540  		/* check for read timeout */
^1da177e4c3f41 Linus Torvalds     2005-04-16  541  		if (read_timeout && time_after(jiffies, timeout)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  542  			retval = -ETIMEDOUT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  543  			goto unlock_exit;
^1da177e4c3f41 Linus Torvalds     2005-04-16  544  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  545  		tower_check_for_read_packet(dev);
^1da177e4c3f41 Linus Torvalds     2005-04-16  546  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  547  
^1da177e4c3f41 Linus Torvalds     2005-04-16  548  	/* copy the data from read_buffer into userspace */
^1da177e4c3f41 Linus Torvalds     2005-04-16  549  	bytes_to_read = min(count, dev->read_packet_length);
^1da177e4c3f41 Linus Torvalds     2005-04-16  550  
a2a767eca87909 Jens Axboe         2024-04-11  551  	if (!copy_to_iter_full(dev->read_buffer, bytes_to_read, to)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  552  		retval = -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  553  		goto unlock_exit;
^1da177e4c3f41 Linus Torvalds     2005-04-16  554  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  555  
^1da177e4c3f41 Linus Torvalds     2005-04-16  556  	spin_lock_irq(&dev->read_buffer_lock);
^1da177e4c3f41 Linus Torvalds     2005-04-16  557  	dev->read_buffer_length -= bytes_to_read;
^1da177e4c3f41 Linus Torvalds     2005-04-16  558  	dev->read_packet_length -= bytes_to_read;
3c84f4bbe33f1f Johan Hovold       2019-11-05  559  	for (i = 0; i < dev->read_buffer_length; i++)
^1da177e4c3f41 Linus Torvalds     2005-04-16 @560  		dev->read_buffer[i] = dev->read_buffer[i+bytes_to_read];
^1da177e4c3f41 Linus Torvalds     2005-04-16  561  	spin_unlock_irq(&dev->read_buffer_lock);
^1da177e4c3f41 Linus Torvalds     2005-04-16  562  
^1da177e4c3f41 Linus Torvalds     2005-04-16  563  	retval = bytes_to_read;
^1da177e4c3f41 Linus Torvalds     2005-04-16  564  
^1da177e4c3f41 Linus Torvalds     2005-04-16  565  unlock_exit:
^1da177e4c3f41 Linus Torvalds     2005-04-16  566  	/* unlock the device */
18bcbcfe9ca230 Daniel Walker      2008-01-11  567  	mutex_unlock(&dev->lock);
^1da177e4c3f41 Linus Torvalds     2005-04-16  568  
^1da177e4c3f41 Linus Torvalds     2005-04-16  569  exit:
^1da177e4c3f41 Linus Torvalds     2005-04-16  570  	return retval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  571  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  572  

:::::: The code at line 560 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
