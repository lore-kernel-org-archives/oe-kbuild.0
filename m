Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800A2630
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 00:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifbfmfHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697589598; x=1729125598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sMPJzwQ0rOQOlhHPRhXtBG89TzMf3qR4pZTZk8td2cQ=;
  b=ifbfmfHIbMuDS0FjwGacRgzVOmk+sOBmpp0dVuXnPdNxU7tw0FJ+kUk4
   BxrSeRqg12XYdCubgW2+QZ2W6GfBPQEqYD5WuCvmXSnebWz/DWe5izTHf
   STI1pyUXS4bNxIBm0SE+HbW+Kwtisa23TA25y85823FuiWQ06pO1CAD5e
   nQPK0HzXHMc/dOq6hP5ZjBkyWlDxy+urTdCfZFTtFhprvytXhLmjtdcVP
   oHObNZojNvvFDekiAdC96cSFbIAMTAvWkQVGyLvXi6bRqe2J8saA9871K
   HVcyD3hD0BBDCMQ2G59MUoAZnrPpSDA3vbh5gI5jg6V4P9VcsA0YjFV6w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="7462848"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="7462848"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 17:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="929957441"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="929957441"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Oct 2023 17:39:54 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsubI-000AHW-1L;
	Wed, 18 Oct 2023 00:39:52 +0000
Date: Wed, 18 Oct 2023 08:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [char-misc:char-misc-testing 21/23] drivers/parport/share.c:486
 parport_register_port() warn: '&tmp->full_list' not removed from list
Message-ID: <202310180809.hepZB9k6-lkp@intel.com>
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
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   5ab2ef71d3e0a4b8e5839b1850ccdd236695e2e0
commit: 6c9334e9230e552c795eebd34e6b208c6df693fe [21/23] parport: Use kasprintf() instead of fixed buffer formatting
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: i386-randconfig-141-20231017 (https://download.01.org/0day-ci/archive/20231018/202310180809.hepZB9k6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310180809.hepZB9k6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310180809.hepZB9k6-lkp@intel.com/

New smatch warnings:
drivers/parport/share.c:486 parport_register_port() warn: '&tmp->full_list' not removed from list

Old smatch warnings:
drivers/parport/share.c:826 parport_register_dev_model() warn: possible memory leak of 'par_dev'

vim +486 drivers/parport/share.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  404  
^1da177e4c3f41 Linus Torvalds      2005-04-16  405  /**
^1da177e4c3f41 Linus Torvalds      2005-04-16  406   *	parport_register_port - register a parallel port
^1da177e4c3f41 Linus Torvalds      2005-04-16  407   *	@base: base I/O address
^1da177e4c3f41 Linus Torvalds      2005-04-16  408   *	@irq: IRQ line
^1da177e4c3f41 Linus Torvalds      2005-04-16  409   *	@dma: DMA channel
^1da177e4c3f41 Linus Torvalds      2005-04-16  410   *	@ops: pointer to the port driver's port operations structure
^1da177e4c3f41 Linus Torvalds      2005-04-16  411   *
^1da177e4c3f41 Linus Torvalds      2005-04-16  412   *	When a parallel port (lowlevel) driver finds a port that
^1da177e4c3f41 Linus Torvalds      2005-04-16  413   *	should be made available to parallel port device drivers, it
^1da177e4c3f41 Linus Torvalds      2005-04-16  414   *	should call parport_register_port().  The @base, @irq, and
^1da177e4c3f41 Linus Torvalds      2005-04-16  415   *	@dma parameters are for the convenience of port drivers, and
^1da177e4c3f41 Linus Torvalds      2005-04-16  416   *	for ports where they aren't meaningful needn't be set to
^1da177e4c3f41 Linus Torvalds      2005-04-16  417   *	anything special.  They can be altered afterwards by adjusting
^1da177e4c3f41 Linus Torvalds      2005-04-16  418   *	the relevant members of the parport structure that is returned
^1da177e4c3f41 Linus Torvalds      2005-04-16  419   *	and represents the port.  They should not be tampered with
^1da177e4c3f41 Linus Torvalds      2005-04-16  420   *	after calling parport_announce_port, however.
^1da177e4c3f41 Linus Torvalds      2005-04-16  421   *
^1da177e4c3f41 Linus Torvalds      2005-04-16  422   *	If there are parallel port device drivers in the system that
^1da177e4c3f41 Linus Torvalds      2005-04-16  423   *	have registered themselves using parport_register_driver(),
^1da177e4c3f41 Linus Torvalds      2005-04-16  424   *	they are not told about the port at this time; that is done by
^1da177e4c3f41 Linus Torvalds      2005-04-16  425   *	parport_announce_port().
^1da177e4c3f41 Linus Torvalds      2005-04-16  426   *
^1da177e4c3f41 Linus Torvalds      2005-04-16  427   *	The @ops structure is allocated by the caller, and must not be
^1da177e4c3f41 Linus Torvalds      2005-04-16  428   *	deallocated before calling parport_remove_port().
^1da177e4c3f41 Linus Torvalds      2005-04-16  429   *
^1da177e4c3f41 Linus Torvalds      2005-04-16  430   *	If there is no memory to allocate a new parport structure,
^1da177e4c3f41 Linus Torvalds      2005-04-16  431   *	this function will return %NULL.
^1da177e4c3f41 Linus Torvalds      2005-04-16  432   **/
^1da177e4c3f41 Linus Torvalds      2005-04-16  433  
^1da177e4c3f41 Linus Torvalds      2005-04-16  434  struct parport *parport_register_port(unsigned long base, int irq, int dma,
^1da177e4c3f41 Linus Torvalds      2005-04-16  435  				      struct parport_operations *ops)
^1da177e4c3f41 Linus Torvalds      2005-04-16  436  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  437  	struct list_head *l;
^1da177e4c3f41 Linus Torvalds      2005-04-16  438  	struct parport *tmp;
^1da177e4c3f41 Linus Torvalds      2005-04-16  439  	int num;
^1da177e4c3f41 Linus Torvalds      2005-04-16  440  	int device;
6fa45a22689722 Sudip Mukherjee     2015-05-20  441  	int ret;
^1da177e4c3f41 Linus Torvalds      2005-04-16  442  
c32df4e182e5bf Alexandru Gheorghiu 2013-07-03  443  	tmp = kzalloc(sizeof(struct parport), GFP_KERNEL);
47ec57ec0e5283 Sudip Mukherjee     2015-10-28  444  	if (!tmp)
^1da177e4c3f41 Linus Torvalds      2005-04-16  445  		return NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  446  
^1da177e4c3f41 Linus Torvalds      2005-04-16  447  	/* Init our structure */
^1da177e4c3f41 Linus Torvalds      2005-04-16  448  	tmp->base = base;
^1da177e4c3f41 Linus Torvalds      2005-04-16  449  	tmp->irq = irq;
^1da177e4c3f41 Linus Torvalds      2005-04-16  450  	tmp->dma = dma;
^1da177e4c3f41 Linus Torvalds      2005-04-16  451  	tmp->muxport = tmp->daisy = tmp->muxsel = -1;
^1da177e4c3f41 Linus Torvalds      2005-04-16  452  	tmp->modes = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  453  	INIT_LIST_HEAD(&tmp->list);
^1da177e4c3f41 Linus Torvalds      2005-04-16  454  	tmp->devices = tmp->cad = NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  455  	tmp->flags = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  456  	tmp->ops = ops;
^1da177e4c3f41 Linus Torvalds      2005-04-16  457  	tmp->physport = tmp;
^1da177e4c3f41 Linus Torvalds      2005-04-16  458  	memset(tmp->probe_info, 0, 5 * sizeof(struct parport_device_info));
^1da177e4c3f41 Linus Torvalds      2005-04-16  459  	rwlock_init(&tmp->cad_lock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  460  	spin_lock_init(&tmp->waitlist_lock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  461  	spin_lock_init(&tmp->pardevice_lock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  462  	tmp->ieee1284.mode = IEEE1284_MODE_COMPAT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  463  	tmp->ieee1284.phase = IEEE1284_PH_FWD_IDLE;
a529f1505b6fac Thomas Gleixner     2010-09-07  464  	sema_init(&tmp->ieee1284.irq, 0);
^1da177e4c3f41 Linus Torvalds      2005-04-16  465  	tmp->spintime = parport_default_spintime;
^1da177e4c3f41 Linus Torvalds      2005-04-16  466  	atomic_set(&tmp->ref_count, 1);
^1da177e4c3f41 Linus Torvalds      2005-04-16  467  	INIT_LIST_HEAD(&tmp->full_list);
^1da177e4c3f41 Linus Torvalds      2005-04-16  468  
^1da177e4c3f41 Linus Torvalds      2005-04-16  469  	/* Search for the lowest free parport number. */
^1da177e4c3f41 Linus Torvalds      2005-04-16  470  
^1da177e4c3f41 Linus Torvalds      2005-04-16  471  	spin_lock(&full_list_lock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  472  	for (l = all_ports.next, num = 0; l != &all_ports; l = l->next, num++) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  473  		struct parport *p = list_entry(l, struct parport, full_list);
^1da177e4c3f41 Linus Torvalds      2005-04-16  474  		if (p->number != num)
^1da177e4c3f41 Linus Torvalds      2005-04-16  475  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  476  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  477  	tmp->portnum = tmp->number = num;
^1da177e4c3f41 Linus Torvalds      2005-04-16  478  	list_add_tail(&tmp->full_list, l);
^1da177e4c3f41 Linus Torvalds      2005-04-16  479  	spin_unlock(&full_list_lock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  480  
^1da177e4c3f41 Linus Torvalds      2005-04-16  481  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  482  	 * Now that the portnum is known finish doing the Init.
^1da177e4c3f41 Linus Torvalds      2005-04-16  483  	 */
6c9334e9230e55 Andy Shevchenko     2023-10-16  484  	tmp->name = kasprintf(GFP_KERNEL, "parport%d", tmp->portnum);
6c9334e9230e55 Andy Shevchenko     2023-10-16  485  	if (!tmp->name) {
6c9334e9230e55 Andy Shevchenko     2023-10-16 @486  		kfree(tmp);
6c9334e9230e55 Andy Shevchenko     2023-10-16  487  		return NULL;
6c9334e9230e55 Andy Shevchenko     2023-10-16  488  	}
6c9334e9230e55 Andy Shevchenko     2023-10-16  489  	dev_set_name(&tmp->bus_dev, tmp->name);
6fa45a22689722 Sudip Mukherjee     2015-05-20  490  	tmp->bus_dev.bus = &parport_bus_type;
6fa45a22689722 Sudip Mukherjee     2015-05-20  491  	tmp->bus_dev.release = free_port;
6fa45a22689722 Sudip Mukherjee     2015-05-20  492  	tmp->bus_dev.type = &parport_device_type;
^1da177e4c3f41 Linus Torvalds      2005-04-16  493  
^1da177e4c3f41 Linus Torvalds      2005-04-16  494  	for (device = 0; device < 5; device++)
^1da177e4c3f41 Linus Torvalds      2005-04-16  495  		/* assume the worst */
^1da177e4c3f41 Linus Torvalds      2005-04-16  496  		tmp->probe_info[device].class = PARPORT_CLASS_LEGACY;
^1da177e4c3f41 Linus Torvalds      2005-04-16  497  
^1da177e4c3f41 Linus Torvalds      2005-04-16  498  	tmp->waithead = tmp->waittail = NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  499  
6fa45a22689722 Sudip Mukherjee     2015-05-20  500  	ret = device_register(&tmp->bus_dev);
6fa45a22689722 Sudip Mukherjee     2015-05-20  501  	if (ret) {
6fa45a22689722 Sudip Mukherjee     2015-05-20  502  		put_device(&tmp->bus_dev);
6fa45a22689722 Sudip Mukherjee     2015-05-20  503  		return NULL;
6fa45a22689722 Sudip Mukherjee     2015-05-20  504  	}
6fa45a22689722 Sudip Mukherjee     2015-05-20  505  
^1da177e4c3f41 Linus Torvalds      2005-04-16  506  	return tmp;
^1da177e4c3f41 Linus Torvalds      2005-04-16  507  }
27c6db26555029 Sudip Mukherjee     2015-10-28  508  EXPORT_SYMBOL(parport_register_port);
^1da177e4c3f41 Linus Torvalds      2005-04-16  509  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
