Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13761E766B
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Oct 2024 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727867298; cv=none; b=omdes6JwLbKE+mxTqjdCA7D8/5O7MZyS50iWvxl6HAmtqRg1Xs8BkAS0GybfF7FlgKtnfESWwCcSoHqXzG/AceF/ovT8mBb+/WxmWy61JH+WOljzVHdojmdsM/GEQI7MmrPGSUjz1UFD01l7fOBlpUOvAd7ASZeex3Pn9eHa7VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727867298; c=relaxed/simple;
	bh=4CMWcw5dpoVoXD17B3GYF7e0v0Uwgy/oTGwH+CsEt8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XW5XuOVvO8Q0VCCCi1pNkjTayp/PrOJjNmWprh1W+jC0TOhVUzNnHqgiYpcbK8f68TqlHoRJnPxa54u91vrsg5l0Uk5HfDtlTLaLb0aak1t3gPF+KOWIwjrZ5+y8Ts3GHc0+JSWRC7Z3EPcCtR8AevZ+2DlYfRIFwNeLKph4lSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dq7TZyMM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dq7TZyMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727867296; x=1759403296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4CMWcw5dpoVoXD17B3GYF7e0v0Uwgy/oTGwH+CsEt8E=;
  b=dq7TZyMMvGG7FqhAJXeuq51Ll4tuE1KE7m6U0yKlbR8AlKKmHDTcBOTq
   h6KL9FsM0PP/z89c1bwMHJRUUJtNd6X1Mf7udAax8iXiEy5JYia6w7sd5
   daAVmfJZnwNDiUirP4nrOpdvndyZzFGQoIxnXYvOCgzSxRsO7sSLYVs3l
   YI6QQGQaKoEMJMYIB+EFUjZydEVsdoa9sivSGNUiDQ7OJIvNQXmSQObKk
   j5NWRwSAcqH4AnEVqSXrdg3KzOUfQFZ2W3U9oiT9DzG3CzOclBNiO8brT
   SjgxZ43SX1fRmLF/HiUN3ECk1EzgNgeOkq5K+gxHFa3nlrDP4mu/O2i4N
   w==;
X-CSE-ConnectionGUID: FJzX31e8SqStvdFUZ0SB+w==
X-CSE-MsgGUID: r+Dyglq2QQC+zmrx6vaqng==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26823836"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="26823836"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 04:08:15 -0700
X-CSE-ConnectionGUID: 3kvD1bHsSeeI45/t93a4nA==
X-CSE-MsgGUID: +7quWlIeQXGizbNtJ310lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="97319927"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Oct 2024 04:08:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svxDG-000RxT-38;
	Wed, 02 Oct 2024 11:08:10 +0000
Date: Wed, 2 Oct 2024 19:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [asahilinux:bits/170-atcphy 4/16] drivers/phy/apple/atc.c:1589:2-8:
 preceding lock on line 1578
Message-ID: <202410021851.sGmBSrDd-lkp@intel.com>
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
TO: Sven Peter <sven@svenpeter.dev>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   819ac8ed6c5777d4b18f0c88fc4a5e55a9ab9fdd
commit: 4f5b8aa35e68a33a1d20b6ce62014794768af7ad [4/16] WIP: phy: apple: Add Apple Type-C PHY
:::::: branch date: 8 days ago
:::::: commit date: 2 weeks ago
config: arc-randconfig-r052-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021851.sGmBSrDd-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410021851.sGmBSrDd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/apple/atc.c:1589:2-8: preceding lock on line 1578
   drivers/phy/apple/atc.c:1589:2-8: preceding lock on line 1584

vim +1589 drivers/phy/apple/atc.c

4f5b8aa35e68a3 Sven Peter 2022-11-30  1566  
4f5b8aa35e68a3 Sven Peter 2022-11-30  1567  static int atcphy_usb3_power_on(struct phy *phy)
4f5b8aa35e68a3 Sven Peter 2022-11-30  1568  {
4f5b8aa35e68a3 Sven Peter 2022-11-30  1569  	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1570  	enum atcphy_pipehandler_state state;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1571  	int ret = 0;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1572  
4f5b8aa35e68a3 Sven Peter 2022-11-30  1573  	/*
4f5b8aa35e68a3 Sven Peter 2022-11-30  1574  	 * Both usb role switch and mux set work will be running concurrently.
4f5b8aa35e68a3 Sven Peter 2022-11-30  1575  	 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
4f5b8aa35e68a3 Sven Peter 2022-11-30  1576  	 * trying to switch dwc3 to the correct PHY.
4f5b8aa35e68a3 Sven Peter 2022-11-30  1577  	 */
4f5b8aa35e68a3 Sven Peter 2022-11-30 @1578  	mutex_lock(&atcphy->lock);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1579  	if (atcphy->mode != atcphy->target_mode) {
4f5b8aa35e68a3 Sven Peter 2022-11-30  1580  		reinit_completion(&atcphy->atcphy_online_event);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1581  		mutex_unlock(&atcphy->lock);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1582  		wait_for_completion_timeout(&atcphy->atcphy_online_event,
4f5b8aa35e68a3 Sven Peter 2022-11-30  1583  					msecs_to_jiffies(1000));
4f5b8aa35e68a3 Sven Peter 2022-11-30  1584  		mutex_lock(&atcphy->lock);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1585  	}
4f5b8aa35e68a3 Sven Peter 2022-11-30  1586  
4f5b8aa35e68a3 Sven Peter 2022-11-30  1587  	if (atcphy->mode != atcphy->target_mode) {
4f5b8aa35e68a3 Sven Peter 2022-11-30  1588  		dev_err(atcphy->dev, "ATCPHY did not come up; won't allow dwc3 to come up.\n");
4f5b8aa35e68a3 Sven Peter 2022-11-30 @1589  		return -EINVAL;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1590  	}
4f5b8aa35e68a3 Sven Peter 2022-11-30  1591  
4f5b8aa35e68a3 Sven Peter 2022-11-30  1592  	atcphy->dwc3_online = true;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1593  	state = atcphy_modes[atcphy->mode].pipehandler_state;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1594  	switch (state) {
4f5b8aa35e68a3 Sven Peter 2022-11-30  1595  	case ATCPHY_PIPEHANDLER_STATE_USB2:
4f5b8aa35e68a3 Sven Peter 2022-11-30  1596  	case ATCPHY_PIPEHANDLER_STATE_USB3:
4f5b8aa35e68a3 Sven Peter 2022-11-30  1597  		ret = atcphy_configure_pipehandler(atcphy, state);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1598  		break;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1599  
4f5b8aa35e68a3 Sven Peter 2022-11-30  1600  	case ATCPHY_PIPEHANDLER_STATE_INVALID:
4f5b8aa35e68a3 Sven Peter 2022-11-30  1601  	default:
4f5b8aa35e68a3 Sven Peter 2022-11-30  1602  		dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
4f5b8aa35e68a3 Sven Peter 2022-11-30  1603  			 state);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1604  		ret = -EINVAL;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1605  	}
4f5b8aa35e68a3 Sven Peter 2022-11-30  1606  
4f5b8aa35e68a3 Sven Peter 2022-11-30  1607  	mutex_unlock(&atcphy->lock);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1608  
4f5b8aa35e68a3 Sven Peter 2022-11-30  1609  	return 0;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1610  }
4f5b8aa35e68a3 Sven Peter 2022-11-30  1611  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
