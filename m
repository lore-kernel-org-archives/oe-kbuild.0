Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57AD37754E
	for <oe-kbuild@lists.linux.dev>; Fri, 22 May 2026 18:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779476134; cv=none; b=JK+LRMveMtGvi0HGZ0n/TbulR8GuOHE9do7U4NOBDTC3OxmsF06ywtUIQtv/SsO2lvLdCjJmMvMoI8JVconQ60fXrpph2D1Lu7kYIwZLNP1sUSUbqvEKq0WYLhIxnt2dW/k0murjz7R3Ce9fcfo4LkSiFx2cbzYlcYeQfTQDU28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779476134; c=relaxed/simple;
	bh=GcJVYTvRsNRSiZXd7UfidkysVzFVO05iM76zJ4JsGTs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P/eJyonv95YusB4wnJPxH8UfRWaqHwxAh27esJOqCmTfpgOvjLCM+6l/EBTqWaoAjIA9rWVEgjb+wejrz3BFzvJcPVn8MZIeYlK4l1dcOpIOO6xwzIhXg5xxTCrwMibHz3UkWVljUeAOu7yxkMbv/ZsnIXYJ58b8J7swJ/WlzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZV8KLD49; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZV8KLD49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779476132; x=1811012132;
  h=date:from:to:cc:subject:message-id;
  bh=GcJVYTvRsNRSiZXd7UfidkysVzFVO05iM76zJ4JsGTs=;
  b=ZV8KLD49KgmrurYhtOLBR6AGSM2+jB+7Ba58D/HFsX/ZwTlViHG6YK6R
   NJ/96HUdSBfXWWJ8MCvxm9iABVYhq30MPb6btsTVChaSIGlRnYr2l8np6
   CGlRQ9BTPabyfGXfNm8NXmS75CUV/hqYDjSRG0bdVuH35aD3nC3r0WXvD
   gGjAYb9HJfZw6cAG3VSl+Ev1QwCo67ktTVxC2Kpbofy75JQNba1ASFB6E
   1l6j0PRu7tuBkmrPL9hgBwDX+453MWTZRlyMtBIpA2QyqBp3KsBU/Rvct
   dk+q7WrRUnh1zvUc6Ib8SpKPl0lYiHOj8uERAgX6ARwAhK1KYVwb2gT0I
   w==;
X-CSE-ConnectionGUID: 0saGbUO/SsKMOeoV4JbMwA==
X-CSE-MsgGUID: 3GXwu9O2S4W2XqYKT/GKBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84294333"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="84294333"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 11:55:32 -0700
X-CSE-ConnectionGUID: bMCQieOTTUq65Ynl8YfoRg==
X-CSE-MsgGUID: Td9YCaDmSCGv05RN7smL1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="241211043"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 May 2026 11:55:30 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQV1r-000000002sv-3CbL;
	Fri, 22 May 2026 18:55:27 +0000
Date: Sat, 23 May 2026 02:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [driver-core:driver-core-testing 12/18]
 drivers/base/core.c:286 fw_devlink_refresh_fwnode() error: we previously
 assumed 'dev' could be null (see line 270)
Message-ID: <202605230211.567ddMEp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: devel@driverdev.osuosl.org
TO: Saravana Kannan <saravanak@google.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Herve Codina <herve.codina@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git driver-core-testing
head:   024480bf8d75bd16894c5b0eb6082b6e6dae4970
commit: 81e7c6befa36cecdcbf7244393bd67e8f8c59bf5 [12/18] of: dynamic: Fix overlayed devices not probing because of fw_devlink
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm-randconfig-r071-20260523 (https://download.01.org/0day-ci/archive/20260523/202605230211.567ddMEp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605230211.567ddMEp-lkp@intel.com/

New smatch warnings:
drivers/base/core.c:286 fw_devlink_refresh_fwnode() error: we previously assumed 'dev' could be null (see line 270)

Old smatch warnings:
drivers/base/core.c:2551 device_store_int() warn: impossible condition '(new > ((~0 >> 1))) => (s32min-s32max > s32max)'
drivers/base/core.c:2551 device_store_int() warn: impossible condition '(new < (-((~0 >> 1)) - 1)) => (s32min-s32max < s32min)'
drivers/base/core.c:3297 class_dir_create_and_add() warn: Calling kobject_put|get with state->initialized unset from line: 3286

vim +/dev +286 drivers/base/core.c

81e7c6befa36ce Saravana Kannan 2026-05-11  248  
81e7c6befa36ce Saravana Kannan 2026-05-11  249  /**
81e7c6befa36ce Saravana Kannan 2026-05-11  250   * fw_devlink_refresh_fwnode - Recheck the tree under this firmware node
81e7c6befa36ce Saravana Kannan 2026-05-11  251   * @fwnode: The fwnode under which the fwnode tree has changed
81e7c6befa36ce Saravana Kannan 2026-05-11  252   *
81e7c6befa36ce Saravana Kannan 2026-05-11  253   * This function is mainly meant to adjust the supplier/consumer dependencies
81e7c6befa36ce Saravana Kannan 2026-05-11  254   * after a fwnode tree overlay has occurred.
81e7c6befa36ce Saravana Kannan 2026-05-11  255   */
81e7c6befa36ce Saravana Kannan 2026-05-11  256  void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode)
81e7c6befa36ce Saravana Kannan 2026-05-11  257  {
81e7c6befa36ce Saravana Kannan 2026-05-11  258  	struct device *dev;
81e7c6befa36ce Saravana Kannan 2026-05-11  259  
81e7c6befa36ce Saravana Kannan 2026-05-11  260  	/*
81e7c6befa36ce Saravana Kannan 2026-05-11  261  	 * Find the closest ancestor fwnode that has been converted to a device
81e7c6befa36ce Saravana Kannan 2026-05-11  262  	 * that can bind to a driver (bus device).
81e7c6befa36ce Saravana Kannan 2026-05-11  263  	 */
81e7c6befa36ce Saravana Kannan 2026-05-11  264  	fwnode_handle_get(fwnode);
81e7c6befa36ce Saravana Kannan 2026-05-11  265  	do {
81e7c6befa36ce Saravana Kannan 2026-05-11  266  		if (fwnode_test_flag(fwnode, FWNODE_FLAG_NOT_DEVICE))
81e7c6befa36ce Saravana Kannan 2026-05-11  267  			continue;
81e7c6befa36ce Saravana Kannan 2026-05-11  268  
81e7c6befa36ce Saravana Kannan 2026-05-11  269  		dev = get_dev_from_fwnode(fwnode);
81e7c6befa36ce Saravana Kannan 2026-05-11 @270  		if (!dev)
81e7c6befa36ce Saravana Kannan 2026-05-11  271  			continue;
81e7c6befa36ce Saravana Kannan 2026-05-11  272  
81e7c6befa36ce Saravana Kannan 2026-05-11  273  		if (dev->bus)
81e7c6befa36ce Saravana Kannan 2026-05-11  274  			break;
81e7c6befa36ce Saravana Kannan 2026-05-11  275  
81e7c6befa36ce Saravana Kannan 2026-05-11  276  		put_device(dev);
81e7c6befa36ce Saravana Kannan 2026-05-11  277  	} while ((fwnode = fwnode_get_next_parent(fwnode)));
81e7c6befa36ce Saravana Kannan 2026-05-11  278  
81e7c6befa36ce Saravana Kannan 2026-05-11  279  	/*
81e7c6befa36ce Saravana Kannan 2026-05-11  280  	 * If none of the ancestor fwnodes have (yet) been converted to a device
81e7c6befa36ce Saravana Kannan 2026-05-11  281  	 * that can bind to a driver, there's nothing to fix up.
81e7c6befa36ce Saravana Kannan 2026-05-11  282  	 */
81e7c6befa36ce Saravana Kannan 2026-05-11  283  	if (!fwnode)
81e7c6befa36ce Saravana Kannan 2026-05-11  284  		return;
81e7c6befa36ce Saravana Kannan 2026-05-11  285  
81e7c6befa36ce Saravana Kannan 2026-05-11 @286  	WARN(device_is_bound(dev) && dev->links.status != DL_DEV_DRIVER_BOUND,
81e7c6befa36ce Saravana Kannan 2026-05-11  287  	     "Don't multithread overlaying and probing the same device!\n");
81e7c6befa36ce Saravana Kannan 2026-05-11  288  
81e7c6befa36ce Saravana Kannan 2026-05-11  289  	/*
81e7c6befa36ce Saravana Kannan 2026-05-11  290  	 * If the device has already bound to a driver, then we need to redo
81e7c6befa36ce Saravana Kannan 2026-05-11  291  	 * some of the work that was done after the device was bound to a
81e7c6befa36ce Saravana Kannan 2026-05-11  292  	 * driver. If the device hasn't bound to a driver, running things too
81e7c6befa36ce Saravana Kannan 2026-05-11  293  	 * soon would incorrectly pick up consumers that it shouldn't.
81e7c6befa36ce Saravana Kannan 2026-05-11  294  	 */
81e7c6befa36ce Saravana Kannan 2026-05-11  295  	if (dev->links.status == DL_DEV_DRIVER_BOUND) {
81e7c6befa36ce Saravana Kannan 2026-05-11  296  		fw_devlink_pickup_dangling_consumers(dev);
81e7c6befa36ce Saravana Kannan 2026-05-11  297  		/*
81e7c6befa36ce Saravana Kannan 2026-05-11  298  		 * Some of dangling consumers could have been put previously in
81e7c6befa36ce Saravana Kannan 2026-05-11  299  		 * the deferred probe list due to the unavailability of their
81e7c6befa36ce Saravana Kannan 2026-05-11  300  		 * suppliers. Those consumers have been picked up and some of
81e7c6befa36ce Saravana Kannan 2026-05-11  301  		 * their suppliers links have been updated. Time to re-try their
81e7c6befa36ce Saravana Kannan 2026-05-11  302  		 * probe sequence.
81e7c6befa36ce Saravana Kannan 2026-05-11  303  		 */
81e7c6befa36ce Saravana Kannan 2026-05-11  304  		driver_deferred_probe_trigger();
81e7c6befa36ce Saravana Kannan 2026-05-11  305  	}
81e7c6befa36ce Saravana Kannan 2026-05-11  306  
81e7c6befa36ce Saravana Kannan 2026-05-11  307  	put_device(dev);
81e7c6befa36ce Saravana Kannan 2026-05-11  308  	fwnode_handle_put(fwnode);
81e7c6befa36ce Saravana Kannan 2026-05-11  309  }
81e7c6befa36ce Saravana Kannan 2026-05-11  310  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
