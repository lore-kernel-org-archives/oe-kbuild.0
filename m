Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE64224D7
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727184263; cv=none; b=Yb73EDUWah9BD/EnxGNPMC4rFaAMikFPKa7aERqInoMrv6wjy2GX2/f0d5+wPHGjp6zmIG4zmuXaIfAPTx5IvusLtIb5YoQcyDOW3Urj1c7nno0JgTuHxthoDr22s4vlDReV4dOJIycP0+l0K7qiW2MRFoZ+ytWsvc3EMawR764=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727184263; c=relaxed/simple;
	bh=KprEsS9M6/wOw9oRy94gewYAzChV3IWgaFsidWK7Olw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l4UtJAj/tS9DVRpEnfI+b1CJFMQ/7N1Yr1K1P9Lxp3UJ368MbmRnKNI+ujkSomrxARB6LfSEq0y6t06YzVH4ARVD6MR1+1eHTqdHQrVbfV6oIFpEfYHGNTYb2Z4IZgcZcKHe8VG/FWjv6qjH76vDSlBWr68Q/kihFw/V8cexzMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQqYeTH6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQqYeTH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727184262; x=1758720262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KprEsS9M6/wOw9oRy94gewYAzChV3IWgaFsidWK7Olw=;
  b=JQqYeTH6J8caaUlx3t3DPaO/rXy2yDdK65sM7du9jn+vTwe7UousUyF4
   heetZI9XKs2QOaLcPXZRUPvCWdux5LdbKFzwEvPCE1Itm5LTFmpbYlvUB
   FdSBPmB5zAoGzjepwE7kd1VR3+bBgMEsFb/YDvQg4KyxVhjRPZ5MRDe1W
   Y+/2r0/6ZKYHIY78YkxDWGd4Dqkse0V1pFi0f9QVyaeBa2xmL5QH+j1xS
   ECnoKdjn59FR9pwW7JtaK4PtMJj/eiw4O7mfjInPb8JP7bxqJWR734Gjq
   naN8nb6Pr2fndXsX8tjIsUiUTOreOfnvpfyOZasynYDjyxOSV+mdNs6cb
   w==;
X-CSE-ConnectionGUID: pdxZv0XtTfOTwmJAqx+BIg==
X-CSE-MsgGUID: sDPdqdIlSj2SphwfOu1ktQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="48705879"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="48705879"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 06:24:21 -0700
X-CSE-ConnectionGUID: NUCkJsR2T0+rEHUxNkfi9w==
X-CSE-MsgGUID: pzaYYYvcSOqq6dAtBCfmHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="71705293"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Sep 2024 06:24:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st5Wa-000IOp-1t;
	Tue, 24 Sep 2024 13:24:16 +0000
Date: Tue, 24 Sep 2024 21:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 171/448] drivers/usb/misc/legousbtower.c:560
 tower_read() warn: potential spectre issue 'dev->read_buffer' [r]
Message-ID: <202409242108.Yq0vOmOP-lkp@intel.com>
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
head:   bbc57cbbbcd4ec22cd7e039257668291d6aba7c5
commit: a2a767eca87909f70d81e2f9a7ec2abf7d2f3d4a [171/448] usb: misc: convert to read/write iterators
:::::: branch date: 9 hours ago
:::::: commit date: 4 days ago
config: s390-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240924/202409242108.Yq0vOmOP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409242108.Yq0vOmOP-lkp@intel.com/

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
