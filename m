Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464CF68B68
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpay3VJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701797716; x=1733333716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IVXcuqoZQmnwIB8hNRc+PBh4VW1Yw8Ib4IokqrEnuqM=;
  b=gpay3VJu4BnT6WWemLWc3hyveWJjNXbKqvIcon+ke8XCVoQ8Q2MhoDeo
   p6Pxn02cHafFNvq1Z1wu5IVLjobtORHP9OFIo/MHvFpBnXrYVNwmGy75A
   aw32MfJByuWP4qeGVTAUyHV4xGgOhEb1fMMYZBzHmiA8EdsKISLoN7VxK
   rvb7fvhnCbUUR109jgMweeQ8mc2fkZ9vw+hrmDedi3AXIv9kb9UClw2F5
   4gaVse6xtIkpxWjYvpXbqlNaRdQNBx+8JensRUuWOAxPbjxJ6xPw17S/N
   ooE0b2zdvu7L+G/pNGQpdAs0L485aKZbSxDzO1OmLIvue343rVF8m3kcx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771092"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="771092"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 09:35:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841550411"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="841550411"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 09:35:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAZK5-0009SS-0Z;
	Tue, 05 Dec 2023 17:35:05 +0000
Date: Wed, 6 Dec 2023 01:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/md/md.c:518:2-8: preceding lock on line 516
Message-ID: <202312060145.XTL9Z47Z-lkp@intel.com>
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
TO: Yu Kuai <yukuai3@huawei.com>
CC: Song Liu <song@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 714d20150ed85811193ae07a494d91f9927c590f md: add new helpers to suspend/resume array
date:   8 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-102-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060145.XTL9Z47Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060145.XTL9Z47Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312060145.XTL9Z47Z-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/md/md.c:518:2-8: preceding lock on line 516

vim +518 drivers/md/md.c

409c57f3801701 NeilBrown 2009-03-31  501  
714d20150ed858 Yu Kuai   2023-10-10  502  int __mddev_suspend(struct mddev *mddev, bool interruptible)
714d20150ed858 Yu Kuai   2023-10-10  503  {
714d20150ed858 Yu Kuai   2023-10-10  504  	int err = 0;
714d20150ed858 Yu Kuai   2023-10-10  505  
714d20150ed858 Yu Kuai   2023-10-10  506  	/*
714d20150ed858 Yu Kuai   2023-10-10  507  	 * hold reconfig_mutex to wait for normal io will deadlock, because
714d20150ed858 Yu Kuai   2023-10-10  508  	 * other context can't update super_block, and normal io can rely on
714d20150ed858 Yu Kuai   2023-10-10  509  	 * updating super_block.
714d20150ed858 Yu Kuai   2023-10-10  510  	 */
714d20150ed858 Yu Kuai   2023-10-10  511  	lockdep_assert_not_held(&mddev->reconfig_mutex);
714d20150ed858 Yu Kuai   2023-10-10  512  
714d20150ed858 Yu Kuai   2023-10-10  513  	if (interruptible)
714d20150ed858 Yu Kuai   2023-10-10  514  		err = mutex_lock_interruptible(&mddev->suspend_mutex);
714d20150ed858 Yu Kuai   2023-10-10  515  	else
714d20150ed858 Yu Kuai   2023-10-10 @516  		mutex_lock(&mddev->suspend_mutex);
714d20150ed858 Yu Kuai   2023-10-10  517  	if (err)
714d20150ed858 Yu Kuai   2023-10-10 @518  		return err;
714d20150ed858 Yu Kuai   2023-10-10  519  
714d20150ed858 Yu Kuai   2023-10-10  520  	if (mddev->suspended) {
714d20150ed858 Yu Kuai   2023-10-10  521  		WRITE_ONCE(mddev->suspended, mddev->suspended + 1);
714d20150ed858 Yu Kuai   2023-10-10  522  		mutex_unlock(&mddev->suspend_mutex);
714d20150ed858 Yu Kuai   2023-10-10  523  		return 0;
714d20150ed858 Yu Kuai   2023-10-10  524  	}
714d20150ed858 Yu Kuai   2023-10-10  525  
714d20150ed858 Yu Kuai   2023-10-10  526  	percpu_ref_kill(&mddev->active_io);
714d20150ed858 Yu Kuai   2023-10-10  527  	if (interruptible)
714d20150ed858 Yu Kuai   2023-10-10  528  		err = wait_event_interruptible(mddev->sb_wait,
714d20150ed858 Yu Kuai   2023-10-10  529  				percpu_ref_is_zero(&mddev->active_io));
714d20150ed858 Yu Kuai   2023-10-10  530  	else
714d20150ed858 Yu Kuai   2023-10-10  531  		wait_event(mddev->sb_wait,
714d20150ed858 Yu Kuai   2023-10-10  532  				percpu_ref_is_zero(&mddev->active_io));
714d20150ed858 Yu Kuai   2023-10-10  533  	if (err) {
714d20150ed858 Yu Kuai   2023-10-10  534  		percpu_ref_resurrect(&mddev->active_io);
714d20150ed858 Yu Kuai   2023-10-10  535  		mutex_unlock(&mddev->suspend_mutex);
714d20150ed858 Yu Kuai   2023-10-10  536  		return err;
714d20150ed858 Yu Kuai   2023-10-10  537  	}
714d20150ed858 Yu Kuai   2023-10-10  538  
714d20150ed858 Yu Kuai   2023-10-10  539  	/*
714d20150ed858 Yu Kuai   2023-10-10  540  	 * For raid456, io might be waiting for reshape to make progress,
714d20150ed858 Yu Kuai   2023-10-10  541  	 * allow new reshape to start while waiting for io to be done to
714d20150ed858 Yu Kuai   2023-10-10  542  	 * prevent deadlock.
714d20150ed858 Yu Kuai   2023-10-10  543  	 */
714d20150ed858 Yu Kuai   2023-10-10  544  	WRITE_ONCE(mddev->suspended, mddev->suspended + 1);
714d20150ed858 Yu Kuai   2023-10-10  545  
714d20150ed858 Yu Kuai   2023-10-10  546  	del_timer_sync(&mddev->safemode_timer);
714d20150ed858 Yu Kuai   2023-10-10  547  	/* restrict memory reclaim I/O during raid array is suspend */
714d20150ed858 Yu Kuai   2023-10-10  548  	mddev->noio_flag = memalloc_noio_save();
714d20150ed858 Yu Kuai   2023-10-10  549  
714d20150ed858 Yu Kuai   2023-10-10  550  	mutex_unlock(&mddev->suspend_mutex);
714d20150ed858 Yu Kuai   2023-10-10  551  	return 0;
714d20150ed858 Yu Kuai   2023-10-10  552  }
714d20150ed858 Yu Kuai   2023-10-10  553  EXPORT_SYMBOL_GPL(__mddev_suspend);
714d20150ed858 Yu Kuai   2023-10-10  554  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
