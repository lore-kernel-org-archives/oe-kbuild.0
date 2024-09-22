Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5682F3D64
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 06:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726987665; cv=none; b=UV2xTi255EImQdOZZzaDzUhcX0KVhuCdSJT1NhRnloeN9QVTBsm7ZmqBarGVszBDWZXiaRK5h5Sgya/ZvGA5agl8/qASNSkFa2ePD1v++t7MisQYLdyh9XfyyDA25aRE5RMGCpY0aUmKtSFnJJ9euL+CMVhgYpuU91Ra6I8yqKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726987665; c=relaxed/simple;
	bh=fs8V4bec8V08pdkQJoSYkE/vym6J7PCTXH/LQqoscFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=td0WgRXNzP2XVScikYJMNqbFDAnGzpsYFMC5vRNb0z1767xwRXPoHf38LO+ZwvG+li0HCdFZUCsrdmUy9xqMhU65CHLdsE3oddp7LRqV89tmr1b74XworG/KD9l9m9xUteEqO6YASey5dRGksmNd7wxsMS/OujTV9CTpfUgG+JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dy4u44gR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dy4u44gR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726987663; x=1758523663;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fs8V4bec8V08pdkQJoSYkE/vym6J7PCTXH/LQqoscFg=;
  b=Dy4u44gRHq5LUncFrBpbvK7Y5gj+xC/6cJa77yWNUGg12kPZl7mICRTq
   NfBgtVGUNkGg2hEVA8BILaxrmUfa6dZWWwta8DSOLGb3p+PknLyjN/NOP
   uGK7syoFSjo+hkIuTZDWrgqzzpOf1+orh/MDdL9cJ5Q+Pv8DlXEtowFS/
   ibZUKHpD4Vds84MgqUXgus2q3gjfZDVi1fiT4zP+fGChfg4+AQ0tNeqqJ
   J9VkQSsM5uFFVDnU4jYvRY2QKvg1eErkMCHE62+mNoVUDlHSvZGIB+2TK
   lKhcPNRXVSW0rzB+gMnUJVrkHBsx6xLdSpK91csqfxqjJMNf80JyMmZdX
   w==;
X-CSE-ConnectionGUID: zBYo+FMtTnOs/IUm9itNqQ==
X-CSE-MsgGUID: 65zd5Y2BToGCfIvQsdGmDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="51368947"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="51368947"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 23:47:43 -0700
X-CSE-ConnectionGUID: 8iVWIH3dSEeRIOrwSRPZZA==
X-CSE-MsgGUID: 6xyW2tkoQPiE/tYuYla9Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="71021812"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Sep 2024 23:47:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssGNf-000G6C-0i;
	Sun, 22 Sep 2024 06:47:39 +0000
Date: Sun, 22 Sep 2024 14:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 160/448] drivers/usb/class/cdc-wdm.c:612
 wdm_read() warn: potential spectre issue 'desc->ubuf' [r]
Message-ID: <202409221412.CFK2H4ul-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   4eb81ae46886ce90863b6f10c4fe8cd45c6719cf
commit: 9adf5beea4e2254f8e8c4c2fce5e40c0011aebe1 [160/448] usb: class: convert to read/write iterators
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240922 (https://download.01.org/0day-ci/archive/20240922/202409221412.CFK2H4ul-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409221412.CFK2H4ul-lkp@intel.com/

smatch warnings:
drivers/usb/class/cdc-wdm.c:612 wdm_read() warn: potential spectre issue 'desc->ubuf' [r]

vim +612 drivers/usb/class/cdc-wdm.c

8dd5cd5395b900 Bjørn Mork          2013-12-20  519  
9adf5beea4e225 Jens Axboe          2024-04-11  520  static ssize_t wdm_read(struct kiocb *iocb, struct iov_iter *to)
afba937e540c90 Oliver Neukum       2008-05-13  521  {
711c68b3c0f7a9 Ben Hutchings       2012-02-12  522  	int rv, cntr;
afba937e540c90 Oliver Neukum       2008-05-13  523  	int i = 0;
9adf5beea4e225 Jens Axboe          2024-04-11  524  	struct wdm_device *desc = iocb->ki_filp->private_data;
9adf5beea4e225 Jens Axboe          2024-04-11  525  	size_t count = iov_iter_count(to);
afba937e540c90 Oliver Neukum       2008-05-13  526  
e8537bd2c4f325 Bjørn Mork          2012-01-16  527  	rv = mutex_lock_interruptible(&desc->rlock); /*concurrent reads */
afba937e540c90 Oliver Neukum       2008-05-13  528  	if (rv < 0)
afba937e540c90 Oliver Neukum       2008-05-13  529  		return -ERESTARTSYS;
afba937e540c90 Oliver Neukum       2008-05-13  530  
6aa7de059173a9 Mark Rutland        2017-10-23  531  	cntr = READ_ONCE(desc->length);
711c68b3c0f7a9 Ben Hutchings       2012-02-12  532  	if (cntr == 0) {
afba937e540c90 Oliver Neukum       2008-05-13  533  		desc->read = 0;
afba937e540c90 Oliver Neukum       2008-05-13  534  retry:
7f1dc313d01f5f Oliver Neukum       2009-09-09  535  		if (test_bit(WDM_DISCONNECTING, &desc->flags)) {
7f1dc313d01f5f Oliver Neukum       2009-09-09  536  			rv = -ENODEV;
7f1dc313d01f5f Oliver Neukum       2009-09-09  537  			goto err;
7f1dc313d01f5f Oliver Neukum       2009-09-09  538  		}
c0f5ecee4e7416 Oliver Neukum       2013-03-12  539  		if (test_bit(WDM_OVERFLOW, &desc->flags)) {
c0f5ecee4e7416 Oliver Neukum       2013-03-12  540  			clear_bit(WDM_OVERFLOW, &desc->flags);
c0f5ecee4e7416 Oliver Neukum       2013-03-12  541  			rv = -ENOBUFS;
c0f5ecee4e7416 Oliver Neukum       2013-03-12  542  			goto err;
c0f5ecee4e7416 Oliver Neukum       2013-03-12  543  		}
afba937e540c90 Oliver Neukum       2008-05-13  544  		i++;
9adf5beea4e225 Jens Axboe          2024-04-11  545  		if (iocb->ki_filp->f_flags & O_NONBLOCK) {
7f1dc313d01f5f Oliver Neukum       2009-09-09  546  			if (!test_bit(WDM_READ, &desc->flags)) {
53b7f7b53d8372 Gustavo A. R. Silva 2017-02-14  547  				rv = -EAGAIN;
7f1dc313d01f5f Oliver Neukum       2009-09-09  548  				goto err;
7f1dc313d01f5f Oliver Neukum       2009-09-09  549  			}
7f1dc313d01f5f Oliver Neukum       2009-09-09  550  			rv = 0;
7f1dc313d01f5f Oliver Neukum       2009-09-09  551  		} else {
afba937e540c90 Oliver Neukum       2008-05-13  552  			rv = wait_event_interruptible(desc->wait,
afba937e540c90 Oliver Neukum       2008-05-13  553  				test_bit(WDM_READ, &desc->flags));
7f1dc313d01f5f Oliver Neukum       2009-09-09  554  		}
afba937e540c90 Oliver Neukum       2008-05-13  555  
7f1dc313d01f5f Oliver Neukum       2009-09-09  556  		/* may have happened while we slept */
17d80d562fd78a Oliver Neukum       2008-06-24  557  		if (test_bit(WDM_DISCONNECTING, &desc->flags)) {
17d80d562fd78a Oliver Neukum       2008-06-24  558  			rv = -ENODEV;
17d80d562fd78a Oliver Neukum       2008-06-24  559  			goto err;
17d80d562fd78a Oliver Neukum       2008-06-24  560  		}
88044202756925 Bjørn Mork          2012-02-10  561  		if (test_bit(WDM_RESETTING, &desc->flags)) {
88044202756925 Bjørn Mork          2012-02-10  562  			rv = -EIO;
88044202756925 Bjørn Mork          2012-02-10  563  			goto err;
88044202756925 Bjørn Mork          2012-02-10  564  		}
17d80d562fd78a Oliver Neukum       2008-06-24  565  		usb_mark_last_busy(interface_to_usbdev(desc->intf));
afba937e540c90 Oliver Neukum       2008-05-13  566  		if (rv < 0) {
afba937e540c90 Oliver Neukum       2008-05-13  567  			rv = -ERESTARTSYS;
afba937e540c90 Oliver Neukum       2008-05-13  568  			goto err;
afba937e540c90 Oliver Neukum       2008-05-13  569  		}
afba937e540c90 Oliver Neukum       2008-05-13  570  
afba937e540c90 Oliver Neukum       2008-05-13  571  		spin_lock_irq(&desc->iuspin);
afba937e540c90 Oliver Neukum       2008-05-13  572  
afba937e540c90 Oliver Neukum       2008-05-13  573  		if (desc->rerr) { /* read completed, error happened */
85e8a0b9a3565c Oliver Neukum       2015-03-23  574  			rv = usb_translate_errors(desc->rerr);
afba937e540c90 Oliver Neukum       2008-05-13  575  			desc->rerr = 0;
afba937e540c90 Oliver Neukum       2008-05-13  576  			spin_unlock_irq(&desc->iuspin);
afba937e540c90 Oliver Neukum       2008-05-13  577  			goto err;
afba937e540c90 Oliver Neukum       2008-05-13  578  		}
afba937e540c90 Oliver Neukum       2008-05-13  579  		/*
afba937e540c90 Oliver Neukum       2008-05-13  580  		 * recheck whether we've lost the race
afba937e540c90 Oliver Neukum       2008-05-13  581  		 * against the completion handler
afba937e540c90 Oliver Neukum       2008-05-13  582  		 */
afba937e540c90 Oliver Neukum       2008-05-13  583  		if (!test_bit(WDM_READ, &desc->flags)) { /* lost race */
afba937e540c90 Oliver Neukum       2008-05-13  584  			spin_unlock_irq(&desc->iuspin);
afba937e540c90 Oliver Neukum       2008-05-13  585  			goto retry;
afba937e540c90 Oliver Neukum       2008-05-13  586  		}
c0f5ecee4e7416 Oliver Neukum       2013-03-12  587  
afba937e540c90 Oliver Neukum       2008-05-13  588  		if (!desc->reslength) { /* zero length read */
ce8bb344dffb49 Oliver Neukum       2016-08-16  589  			dev_dbg(&desc->intf->dev, "zero length - clearing WDM_READ\n");
c1da59dad0ebd3 Robert Foss         2016-08-09  590  			clear_bit(WDM_READ, &desc->flags);
c1da59dad0ebd3 Robert Foss         2016-08-09  591  			rv = service_outstanding_interrupt(desc);
afba937e540c90 Oliver Neukum       2008-05-13  592  			spin_unlock_irq(&desc->iuspin);
8dd5cd5395b900 Bjørn Mork          2013-12-20  593  			if (rv < 0)
8dd5cd5395b900 Bjørn Mork          2013-12-20  594  				goto err;
afba937e540c90 Oliver Neukum       2008-05-13  595  			goto retry;
afba937e540c90 Oliver Neukum       2008-05-13  596  		}
711c68b3c0f7a9 Ben Hutchings       2012-02-12  597  		cntr = desc->length;
afba937e540c90 Oliver Neukum       2008-05-13  598  		spin_unlock_irq(&desc->iuspin);
afba937e540c90 Oliver Neukum       2008-05-13  599  	}
afba937e540c90 Oliver Neukum       2008-05-13  600  
711c68b3c0f7a9 Ben Hutchings       2012-02-12  601  	if (cntr > count)
711c68b3c0f7a9 Ben Hutchings       2012-02-12  602  		cntr = count;
9adf5beea4e225 Jens Axboe          2024-04-11  603  	rv = !copy_to_iter_full(desc->ubuf, cntr, to);
9adf5beea4e225 Jens Axboe          2024-04-11  604  	if (rv) {
afba937e540c90 Oliver Neukum       2008-05-13  605  		rv = -EFAULT;
afba937e540c90 Oliver Neukum       2008-05-13  606  		goto err;
afba937e540c90 Oliver Neukum       2008-05-13  607  	}
afba937e540c90 Oliver Neukum       2008-05-13  608  
711c68b3c0f7a9 Ben Hutchings       2012-02-12  609  	spin_lock_irq(&desc->iuspin);
711c68b3c0f7a9 Ben Hutchings       2012-02-12  610  
afba937e540c90 Oliver Neukum       2008-05-13  611  	for (i = 0; i < desc->length - cntr; i++)
afba937e540c90 Oliver Neukum       2008-05-13 @612  		desc->ubuf[i] = desc->ubuf[i + cntr];
afba937e540c90 Oliver Neukum       2008-05-13  613  
afba937e540c90 Oliver Neukum       2008-05-13  614  	desc->length -= cntr;
87d65e54b6d5ff Oliver Neukum       2008-06-19  615  	/* in case we had outstanding data */
c1da59dad0ebd3 Robert Foss         2016-08-09  616  	if (!desc->length) {
c1da59dad0ebd3 Robert Foss         2016-08-09  617  		clear_bit(WDM_READ, &desc->flags);
c1da59dad0ebd3 Robert Foss         2016-08-09  618  		service_outstanding_interrupt(desc);
c1da59dad0ebd3 Robert Foss         2016-08-09  619  	}
73e06865ead1be Greg Suarez         2013-10-29  620  	spin_unlock_irq(&desc->iuspin);
afba937e540c90 Oliver Neukum       2008-05-13  621  	rv = cntr;
afba937e540c90 Oliver Neukum       2008-05-13  622  
afba937e540c90 Oliver Neukum       2008-05-13  623  err:
e8537bd2c4f325 Bjørn Mork          2012-01-16  624  	mutex_unlock(&desc->rlock);
afba937e540c90 Oliver Neukum       2008-05-13  625  	return rv;
afba937e540c90 Oliver Neukum       2008-05-13  626  }
afba937e540c90 Oliver Neukum       2008-05-13  627  

:::::: The code at line 612 was first introduced by commit
:::::: afba937e540c902c989cd516fd97ea0c8499bb27 USB: CDC WDM driver

:::::: TO: Oliver Neukum <oliver@neukum.org>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
