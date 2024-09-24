Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3962B823C3
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 07:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727161390; cv=none; b=hVHsy3Nusai9xNAw/3uaZ/TmC6zBDivYv+8cup4uTYTYkKjFdKeEcPgtlbzh+n3kwhd9H+9vvwHbcS4qqY8a8w4PY77fVGViKRBRuYLJ0DNoWwC1nUth2zWPaANSgRbnlKRAv7Zhtv8DNmvt0nUETkb9vwE7sM2rYgsO+I9uvvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727161390; c=relaxed/simple;
	bh=CUOaXBwbqGI6ZabwoC9A18K3F/2K0CMyEm+PVRZ2bCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tEkBS57vgaUUX7LF3nt1q5n2ggT8p59mxuSZCVOOYXHpDFhW5PXJvgboLA+05exeJDNQZZUK78G2koHmay26ETNc77PnUBHpzaKaul82nhLiGU3bl5tMtJNC4uxsVfEJvny0pPe/O1CZdzz91Ii5erQi31vSnVFoyYaYLsd2yZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giStg/pT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giStg/pT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727161388; x=1758697388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CUOaXBwbqGI6ZabwoC9A18K3F/2K0CMyEm+PVRZ2bCs=;
  b=giStg/pTeLJlSJifrxDMSOr6mVuHvju4Nso9exU3T9k8cysf+3rifL6g
   6oejnrz/sdjGvBqDkdXDCVz0OczJU8GdJfoQU+wtpWCvuBlEFi6et5cTy
   /gneI99KWD422CezcI4b1csInd18t61FmlqGXtYW1Dj20slYYUqSt9DIP
   av0+2x/ap+tggZaJrjP7xFm3bQuAIz/gTBTvMXVSrxlKEdMbGC6yCeqt9
   DMrlYHDvv2/EXlE3fhNgBp0vp5ZeBD/FOv4IBuTm6ebAWQ1TEfnPhQFBY
   RGEpc4o+HnuYzXBNCEVOgtdZtgeL9ZhlIB2myPG+wkJclnVjyiwuq3N5S
   g==;
X-CSE-ConnectionGUID: hD/yMTWnReqN12tU5nDHTQ==
X-CSE-MsgGUID: URRCaFxhQuaHBDbMBmNxtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37514169"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="37514169"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 00:03:08 -0700
X-CSE-ConnectionGUID: s8xRPMvlRImCDDuXRpK0AA==
X-CSE-MsgGUID: Ohg38xK5ST2QavB+LLMnOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="71325143"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Sep 2024 00:03:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sszZg-000I3Z-0j;
	Tue, 24 Sep 2024 07:03:04 +0000
Date: Tue, 24 Sep 2024 15:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] usb: yurex: make waiting on yurex_write interruptible
Message-ID: <202409241444.MCX2lNxm-lkp@intel.com>
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
In-Reply-To: <20240923141649.148563-1-oneukum@suse.com>
References: <20240923141649.148563-1-oneukum@suse.com>
TO: Oliver Neukum <oneukum@suse.com>
TO: gregkh@linuxfoundation.org
TO: linux-usb@vger.kernel.org
TO: stable@vger.kernel.org
CC: Oliver Neukum <oneukum@suse.com>

Hi Oliver,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v6.11 next-20240923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/usb-yurex-make-waiting-on-yurex_write-interruptible/20240923-221833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240923141649.148563-1-oneukum%40suse.com
patch subject: [PATCH] usb: yurex: make waiting on yurex_write interruptible
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: nios2-randconfig-r073-20240924 (https://download.01.org/0day-ci/archive/20240924/202409241444.MCX2lNxm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409241444.MCX2lNxm-lkp@intel.com/

New smatch warnings:
drivers/usb/misc/yurex.c:524 yurex_write() error: uninitialized symbol 'retval'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/retval +524 drivers/usb/misc/yurex.c

6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  428  
1cc373c654acde Sudip Mukherjee     2014-10-10  429  static ssize_t yurex_write(struct file *file, const char __user *user_buffer,
1cc373c654acde Sudip Mukherjee     2014-10-10  430  			   size_t count, loff_t *ppos)
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  431  {
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  432  	struct usb_yurex *dev;
e9cac1c1ecfe84 Oliver Neukum       2024-09-23  433  	int i, set = 0, retval;
7e10f14ebface4 Ben Hutchings       2018-08-15  434  	char buffer[16 + 1];
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  435  	char *data = buffer;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  436  	unsigned long long c, c2 = 0;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  437  	signed long timeout = 0;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  438  	DEFINE_WAIT(wait);
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  439  
7e10f14ebface4 Ben Hutchings       2018-08-15  440  	count = min(sizeof(buffer) - 1, count);
113ad911ad4a1c Arjun Sreedharan    2014-08-19  441  	dev = file->private_data;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  442  
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  443  	/* verify that we actually have some data to write */
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  444  	if (count == 0)
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  445  		goto error;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  446  
e9cac1c1ecfe84 Oliver Neukum       2024-09-23  447  	retval = mutex_lock_interruptible(&dev->io_mutex);
e9cac1c1ecfe84 Oliver Neukum       2024-09-23  448  	if (retval < 0)
e9cac1c1ecfe84 Oliver Neukum       2024-09-23  449  		return -EINTR;
e9cac1c1ecfe84 Oliver Neukum       2024-09-23  450  
aafb00a977cf7d Johan Hovold        2019-10-09  451  	if (dev->disconnected) {		/* already disconnected */
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  452  		mutex_unlock(&dev->io_mutex);
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  453  		retval = -ENODEV;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  454  		goto error;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  455  	}
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  456  
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  457  	if (copy_from_user(buffer, user_buffer, count)) {
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  458  		mutex_unlock(&dev->io_mutex);
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  459  		retval = -EFAULT;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  460  		goto error;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  461  	}
7e10f14ebface4 Ben Hutchings       2018-08-15  462  	buffer[count] = 0;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  463  	memset(dev->cntl_buffer, CMD_PADDING, YUREX_BUF_SIZE);
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  464  
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  465  	switch (buffer[0]) {
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  466  	case CMD_ANIMATE:
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  467  	case CMD_LED:
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  468  		dev->cntl_buffer[0] = buffer[0];
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  469  		dev->cntl_buffer[1] = buffer[1];
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  470  		dev->cntl_buffer[2] = CMD_EOF;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  471  		break;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  472  	case CMD_READ:
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  473  	case CMD_VERSION:
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  474  		dev->cntl_buffer[0] = buffer[0];
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  475  		dev->cntl_buffer[1] = 0x00;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  476  		dev->cntl_buffer[2] = CMD_EOF;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  477  		break;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  478  	case CMD_SET:
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  479  		data++;
0d9b6d49fe39bd Gustavo A. R. Silva 2020-07-07  480  		fallthrough;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  481  	case '0' ... '9':
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  482  		set = 1;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  483  		c = c2 = simple_strtoull(data, NULL, 0);
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  484  		dev->cntl_buffer[0] = CMD_SET;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  485  		for (i = 1; i < 6; i++) {
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  486  			dev->cntl_buffer[i] = (c>>32) & 0xff;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  487  			c <<= 8;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  488  		}
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  489  		buffer[6] = CMD_EOF;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  490  		break;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  491  	default:
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  492  		mutex_unlock(&dev->io_mutex);
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  493  		return -EINVAL;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  494  	}
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  495  
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  496  	/* send the data as the control msg */
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  497  	prepare_to_wait(&dev->waitq, &wait, TASK_INTERRUPTIBLE);
aadd6472d904c3 Greg Kroah-Hartman  2012-05-01  498  	dev_dbg(&dev->interface->dev, "%s - submit %c\n", __func__,
aadd6472d904c3 Greg Kroah-Hartman  2012-05-01  499  		dev->cntl_buffer[0]);
f176ede3a3bde5 Alan Stern          2020-08-10  500  	retval = usb_submit_urb(dev->cntl_urb, GFP_ATOMIC);
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  501  	if (retval >= 0)
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  502  		timeout = schedule_timeout(YUREX_WRITE_TIMEOUT);
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  503  	finish_wait(&dev->waitq, &wait);
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  504  
372c93131998c0 Johan Hovold        2020-12-14  505  	/* make sure URB is idle after timeout or (spurious) CMD_ACK */
372c93131998c0 Johan Hovold        2020-12-14  506  	usb_kill_urb(dev->cntl_urb);
372c93131998c0 Johan Hovold        2020-12-14  507  
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  508  	mutex_unlock(&dev->io_mutex);
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  509  
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  510  	if (retval < 0) {
45714104b9e85f Greg Kroah-Hartman  2012-04-20  511  		dev_err(&dev->interface->dev,
45714104b9e85f Greg Kroah-Hartman  2012-04-20  512  			"%s - failed to send bulk msg, error %d\n",
45714104b9e85f Greg Kroah-Hartman  2012-04-20  513  			__func__, retval);
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  514  		goto error;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  515  	}
93907620b30860 Oliver Neukum       2024-09-12  516  	if (set && timeout) {
93907620b30860 Oliver Neukum       2024-09-12  517  		spin_lock_irq(&dev->lock);
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  518  		dev->bbu = c2;
93907620b30860 Oliver Neukum       2024-09-12  519  		spin_unlock_irq(&dev->lock);
93907620b30860 Oliver Neukum       2024-09-12  520  	}
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  521  	return timeout ? count : -EIO;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  522  
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  523  error:
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29 @524  	return retval;
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  525  }
6bc235a2e24a5e Tomoki Sekiyama     2010-09-29  526  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
