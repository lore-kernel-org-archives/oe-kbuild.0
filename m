Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B4A1537AA
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 12:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731240962; cv=none; b=O7bVFZcVX345ghoeuniolQ5J5x+UsjlCM8KwgeSBC4KJxNoSAqW5Jepd+7JSdRe7aGSHnCie1Zp+Wj/svXyOt22k1iwPJLfZNFAtOSKYjnUtChJDqtrnRj0n3A7wmw9LPtWQSYr1W9ZPsWEih9mRN9V9wnDMcDlTwmJgl5IWVJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731240962; c=relaxed/simple;
	bh=lHptApJWaAPXfpGkhhhqlRf8D+ge6ZYFSORGAp0hwj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LyoL8YFFYFGq+yNosAmrrJTy67xN993Ji2jAff2flqyamwM17w0/WP6QdldJm728Z/2Dqingabxci0g0PME9Oh+G53ZleEVlq0Lxsu2T17lxFmInAlZUVqur51kzDQCWijiXte4hfVvJ8VybM2NbdWUANmeRrQhp7fBk84b5hfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCfj5QEg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCfj5QEg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731240961; x=1762776961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lHptApJWaAPXfpGkhhhqlRf8D+ge6ZYFSORGAp0hwj4=;
  b=kCfj5QEgZ592/HD77lyfa8AY/DbjJssNdbQKe414zvhgvz4AcITy5pRo
   IUCTMUeXfj6z/pJ7Bj40UF2s6GO+L03xVA7ZnporgHsQ3n20LEt0P17om
   PtTw/OrRcGBT2zJz0j727QEgdk9Bc8qk7YZ3DF0U7J9YEd1q0hYpLQwta
   /RIJrLnViWfgeeiTVcuFESFuuPIxsV4BY7dLuDI3K1v0nx+NFL7e2IBPt
   /GJm8ElfBfrnKcwO6OLRcj4UeouphtNFZHeWb7LsFoWaP2JJqpZAxWXRI
   4WRVIgRToz6OSUdre7OF2TLefzvW+f0nUy4KEAGoLVlJT5XwfcyDWAtrb
   g==;
X-CSE-ConnectionGUID: oyKdz2lHRiyaOeLdd96dhQ==
X-CSE-MsgGUID: JhSi8myPRhi9ZU1twxYPYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30918916"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30918916"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 04:16:00 -0800
X-CSE-ConnectionGUID: lNnyIY6rTZOs5+cnnt7udQ==
X-CSE-MsgGUID: 8A6rbp6oTZi7pVaMkVXauA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="117347582"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2024 04:15:58 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA6rE-00008D-0W;
	Sun, 10 Nov 2024 12:15:56 +0000
Date: Sun, 10 Nov 2024 20:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/md/md.c:518:2-8: preceding lock on line 516
Message-ID: <202411102048.FTgpPJzN-lkp@intel.com>
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
head:   de2f378f2b771b39594c04695feee86476743a69
commit: 714d20150ed85811193ae07a494d91f9927c590f md: add new helpers to suspend/resume array
date:   1 year, 1 month ago
:::::: branch date: 15 hours ago
:::::: commit date: 1 year, 1 month ago
config: csky-randconfig-r061-20241110 (https://download.01.org/0day-ci/archive/20241110/202411102048.FTgpPJzN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411102048.FTgpPJzN-lkp@intel.com/

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
