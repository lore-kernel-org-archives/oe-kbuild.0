Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2086436495B
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 04:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772859473; cv=none; b=em2jkPaomBFXCaJPaWfK7bw1YTHfUq6pdwBlwbVJDpuKyo5uj/20567xK3912Hb1BIPjXgDQjoxIJrPo3/vfIQ4f3f2aKkPAGAkfnGk/W7UloSx640vdG8ChZ8tQc+5mbBLhvhsMAInI1o2ZNCWGSx9y0GxsmbyDLPObPCKNh5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772859473; c=relaxed/simple;
	bh=WhaBohlrWC/iZahFyutvsNYNHsyKqYbXMk8836JvZms=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kUPNk+f+pGgBbVctJdeZ8BP6sQPQFRjM7TVnWe9D8E+6SSXsnQKTODZzUoMADsbTAA1ZDhBh5fimXr5FZIgsUVzBzz1BmWic97mxRoAvSKGipDNuJaXzoOXCeKY/jqs1DqMKGYjcVaVNLGb/A8UwufL+DSRWJHGrIO6JrUitiaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BHPkHRO2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHPkHRO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772859464; x=1804395464;
  h=date:from:to:cc:subject:message-id;
  bh=WhaBohlrWC/iZahFyutvsNYNHsyKqYbXMk8836JvZms=;
  b=BHPkHRO2nvxWDOq+fLDtfJCqMFzFf2eMkR/Fx4S+DBJVYYkCyQtT2glI
   ZBRwcYhAmwan/s8xZN+DwMSfly2ZdVt2F8K7yrE3vJ8kkz50QUmUF+/9d
   I44Nz//cZa3rH5IA83ze7h6q3/zIdmfT+Mhdeed/NG6UgsGvo/4qXrP8D
   F80F1k56Hk3v9v1peeIY3sRjvwevrcpi9q+YqX9jYZKgTqu5GhZOzyMqP
   gLDj6yOAY63B5jRUjA51L66mT8SXR2WvdY7Iltsn8dZXEOT5W7l1rZtz/
   mIYqVFRSvnPtdx1QLCQqIIzg6dBz9PoV1V0/Pq8Mv7w0XJHsyf3LmIaUP
   w==;
X-CSE-ConnectionGUID: HkLgOihYS5GPeP26S9dVWg==
X-CSE-MsgGUID: hnwm6JakToWDtLZjhsozyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74043811"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="74043811"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 20:57:43 -0800
X-CSE-ConnectionGUID: gCtFwlbvQQWyyLYAUbHAYg==
X-CSE-MsgGUID: 36ab4soqTAGNgWJTvITUlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="216268686"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2026 20:57:42 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyjjP-000000001h3-2Iy4;
	Sat, 07 Mar 2026 04:57:39 +0000
Date: Sat, 07 Mar 2026 12:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 167/471] drivers/usb/misc/yurex.c:458
 yurex_write() warn: potential spectre issue 'buffer' [w]
Message-ID: <202603071234.ArSi0aWR-lkp@intel.com>
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
config: parisc-randconfig-r072-20260307 (https://download.01.org/0day-ci/archive/20260307/202603071234.ArSi0aWR-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603071234.ArSi0aWR-lkp@intel.com/

smatch warnings:
drivers/usb/misc/yurex.c:458 yurex_write() warn: potential spectre issue 'buffer' [w]

vim +/buffer +458 drivers/usb/misc/yurex.c

6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  424  
ab14a2d8805f51e Jens Axboe          2024-04-11  425  static ssize_t yurex_write(struct kiocb *iocb, struct iov_iter *from)
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  426  {
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  427  	struct usb_yurex *dev;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  428  	int i, set = 0, retval = 0;
7e10f14ebface44 Ben Hutchings       2018-08-15  429  	char buffer[16 + 1];
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  430  	char *data = buffer;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  431  	unsigned long long c, c2 = 0;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  432  	signed long timeout = 0;
ab14a2d8805f51e Jens Axboe          2024-04-11  433  	size_t count = iov_iter_count(from);
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  434  	DEFINE_WAIT(wait);
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  435  
7e10f14ebface44 Ben Hutchings       2018-08-15  436  	count = min(sizeof(buffer) - 1, count);
ab14a2d8805f51e Jens Axboe          2024-04-11  437  	dev = iocb->ki_filp->private_data;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  438  
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  439  	/* verify that we actually have some data to write */
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  440  	if (count == 0)
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  441  		goto error;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  442  
e0aa9614ab0fd35 Oliver Neukum       2024-09-24  443  	retval = mutex_lock_interruptible(&dev->io_mutex);
e0aa9614ab0fd35 Oliver Neukum       2024-09-24  444  	if (retval < 0)
e0aa9614ab0fd35 Oliver Neukum       2024-09-24  445  		return -EINTR;
e0aa9614ab0fd35 Oliver Neukum       2024-09-24  446  
aafb00a977cf7d8 Johan Hovold        2019-10-09  447  	if (dev->disconnected) {		/* already disconnected */
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  448  		mutex_unlock(&dev->io_mutex);
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  449  		retval = -ENODEV;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  450  		goto error;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  451  	}
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  452  
ab14a2d8805f51e Jens Axboe          2024-04-11  453  	if (!copy_from_iter_full(buffer, count, from)) {
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  454  		mutex_unlock(&dev->io_mutex);
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  455  		retval = -EFAULT;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  456  		goto error;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  457  	}
7e10f14ebface44 Ben Hutchings       2018-08-15 @458  	buffer[count] = 0;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  459  	memset(dev->cntl_buffer, CMD_PADDING, YUREX_BUF_SIZE);
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  460  
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  461  	switch (buffer[0]) {
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  462  	case CMD_ANIMATE:
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  463  	case CMD_LED:
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  464  		dev->cntl_buffer[0] = buffer[0];
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  465  		dev->cntl_buffer[1] = buffer[1];
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  466  		dev->cntl_buffer[2] = CMD_EOF;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  467  		break;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  468  	case CMD_READ:
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  469  	case CMD_VERSION:
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  470  		dev->cntl_buffer[0] = buffer[0];
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  471  		dev->cntl_buffer[1] = 0x00;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  472  		dev->cntl_buffer[2] = CMD_EOF;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  473  		break;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  474  	case CMD_SET:
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  475  		data++;
0d9b6d49fe39bd3 Gustavo A. R. Silva 2020-07-07  476  		fallthrough;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  477  	case '0' ... '9':
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  478  		set = 1;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  479  		c = c2 = simple_strtoull(data, NULL, 0);
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  480  		dev->cntl_buffer[0] = CMD_SET;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  481  		for (i = 1; i < 6; i++) {
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  482  			dev->cntl_buffer[i] = (c>>32) & 0xff;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  483  			c <<= 8;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  484  		}
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  485  		buffer[6] = CMD_EOF;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  486  		break;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  487  	default:
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  488  		mutex_unlock(&dev->io_mutex);
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  489  		return -EINVAL;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  490  	}
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  491  
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  492  	/* send the data as the control msg */
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  493  	prepare_to_wait(&dev->waitq, &wait, TASK_INTERRUPTIBLE);
aadd6472d904c37 Greg Kroah-Hartman  2012-05-01  494  	dev_dbg(&dev->interface->dev, "%s - submit %c\n", __func__,
aadd6472d904c37 Greg Kroah-Hartman  2012-05-01  495  		dev->cntl_buffer[0]);
f176ede3a3bde5b Alan Stern          2020-08-10  496  	retval = usb_submit_urb(dev->cntl_urb, GFP_ATOMIC);
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  497  	if (retval >= 0)
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  498  		timeout = schedule_timeout(YUREX_WRITE_TIMEOUT);
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  499  	finish_wait(&dev->waitq, &wait);
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  500  
372c93131998c06 Johan Hovold        2020-12-14  501  	/* make sure URB is idle after timeout or (spurious) CMD_ACK */
372c93131998c06 Johan Hovold        2020-12-14  502  	usb_kill_urb(dev->cntl_urb);
372c93131998c06 Johan Hovold        2020-12-14  503  
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  504  	mutex_unlock(&dev->io_mutex);
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  505  
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  506  	if (retval < 0) {
45714104b9e85ff Greg Kroah-Hartman  2012-04-20  507  		dev_err(&dev->interface->dev,
45714104b9e85ff Greg Kroah-Hartman  2012-04-20  508  			"%s - failed to send bulk msg, error %d\n",
45714104b9e85ff Greg Kroah-Hartman  2012-04-20  509  			__func__, retval);
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  510  		goto error;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  511  	}
93907620b308609 Oliver Neukum       2024-09-12  512  	if (set && timeout) {
93907620b308609 Oliver Neukum       2024-09-12  513  		spin_lock_irq(&dev->lock);
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  514  		dev->bbu = c2;
93907620b308609 Oliver Neukum       2024-09-12  515  		spin_unlock_irq(&dev->lock);
93907620b308609 Oliver Neukum       2024-09-12  516  	}
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  517  	return timeout ? count : -EIO;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  518  
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  519  error:
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  520  	return retval;
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  521  }
6bc235a2e24a5ef Tomoki Sekiyama     2010-09-29  522  

:::::: The code at line 458 was first introduced by commit
:::::: 7e10f14ebface44a48275c8d6dc1caae3668d5a9 USB: yurex: Fix buffer over-read in yurex_write()

:::::: TO: Ben Hutchings <ben.hutchings@codethink.co.uk>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
