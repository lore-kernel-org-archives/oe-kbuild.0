Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C17136E48E
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 05:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772860256; cv=none; b=JzvfYq/R0THXUmczQ0M49IcC2wKkxcoUGk8Q/cARSyeTzPgpdHbRMnLs+9MomvPgcSFaGdo5INY4MwuYyq/omvrKVUYqPtoiqKBL3Xm0xCbH9leens9cnrNrUGKji0w1PgVuBaGoDEdOpBdNRnhQspA+ZMwqeugR7M75T0hRpfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772860256; c=relaxed/simple;
	bh=EiGEBiGsB7UY62J5d0lXSdlhQtXCW6nHydVDqy6ztu0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ftot/kDUif+gSShBFHOFWLB70EA2AnFX5f5/tjb9dorLv7z6IJiBT1PbRzFAtb1Orq/Qs9v3hw8Q78Y9pPPrBkoOXRNDRWw1zIrOpFG1nBZGYrhmzZIY4CMjXojT5/PM1uAaTs5RipxdjRUYy3lli0H0TRR4Ai4DQrBQFnbv80M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCBoX4eE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCBoX4eE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772860250; x=1804396250;
  h=date:from:to:cc:subject:message-id;
  bh=EiGEBiGsB7UY62J5d0lXSdlhQtXCW6nHydVDqy6ztu0=;
  b=cCBoX4eEIVgiMDHr7Y8xU0RThhcm/ofNCKyQ6XCYSnFRI118qGOJPwfO
   AeNONNjT3eipliGsiz/1Vkl3uQuQqAxXezWk9m57oEfGFp8BNIOACceYT
   ApaQv2nio2Kg5ESmZuE+ZVAKu+ZrWkRDry/uHwwbNKY0fZMvcPj7VSTZF
   09tj2BhQvyR6HzP8H/SjyUK1lnhvKhc4R+GJBJd9F5xAJ6ShLr3TkwQ2X
   G/dOnXJ1HcIJqlESTQHZXyLMWzp1MpvoXtMq7nrDCI3yBzhzXuRXl/ZyM
   LwZ0b0KgASfh9JlNPCWcoj44K+xt8pm17v+ppzjihs5On1gtKDoQwfRGi
   A==;
X-CSE-ConnectionGUID: g8DeNjKkQqSKofouAFybow==
X-CSE-MsgGUID: 6bfq262mRfuGsggTJjZInA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84603013"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="84603013"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 21:10:43 -0800
X-CSE-ConnectionGUID: vHCfjmAJR5ytsukyCzMosw==
X-CSE-MsgGUID: N13nGZk6TTutMo6+x4RQTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="224160641"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2026 21:10:43 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyjvz-000000001hZ-3d8q;
	Sat, 07 Mar 2026 05:10:39 +0000
Date: Sat, 07 Mar 2026 13:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 167/471] drivers/usb/misc/legousbtower.c:560
 tower_read() warn: potential spectre issue 'dev->read_buffer' [r]
Message-ID: <202603071341.ETiVsPCD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: ab14a2d8805f51e6237da6110c3351e3ebf43a96 [167/471] usb: misc: convert to read/write iterators
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: m68k-randconfig-r073-20260307 (https://download.01.org/0day-ci/archive/20260307/202603071341.ETiVsPCD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603071341.ETiVsPCD-lkp@intel.com/

smatch warnings:
drivers/usb/misc/legousbtower.c:560 tower_read() warn: potential spectre issue 'dev->read_buffer' [r]

vim +560 drivers/usb/misc/legousbtower.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  487  
^1da177e4c3f41 Linus Torvalds     2005-04-16  488  
464b7d0e538ef2 Lee Jones          2020-07-06  489  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  490   *	tower_read
^1da177e4c3f41 Linus Torvalds     2005-04-16  491   */
ab14a2d8805f51 Jens Axboe         2024-04-11  492  static ssize_t tower_read(struct kiocb *iocb, struct iov_iter *to)
^1da177e4c3f41 Linus Torvalds     2005-04-16  493  {
ab14a2d8805f51 Jens Axboe         2024-04-11  494  	size_t count = iov_iter_count(to);
^1da177e4c3f41 Linus Torvalds     2005-04-16  495  	struct lego_usb_tower *dev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  496  	size_t bytes_to_read;
^1da177e4c3f41 Linus Torvalds     2005-04-16  497  	int i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  498  	int retval = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  499  	unsigned long timeout = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  500  
ab14a2d8805f51 Jens Axboe         2024-04-11  501  	dev = iocb->ki_filp->private_data;
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
ab14a2d8805f51 Jens Axboe         2024-04-11  527  		if (iocb->ki_filp->f_flags & O_NONBLOCK) {
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
ab14a2d8805f51 Jens Axboe         2024-04-11  551  	if (!copy_to_iter_full(dev->read_buffer, bytes_to_read, to)) {
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
