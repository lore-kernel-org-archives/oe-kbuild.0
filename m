Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7693AAF62
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Sep 2026 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350543; cv=none; b=SGAZrxhalmPbD4BlyNzbEDsNzmBukTWGmMdPXe4KyCoC6T7PMrWXfhzsfen8wXqJrCT42+wR5H5hXpH03Qn9PYBR9tdEULuPi4MTwgTiHNa3dY8/iHAkXrVzeVtEnQYKLsy1tnUeTO/KtM0A2p4R/DsM4M6OvaJ0SEdboaNkoOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350543; c=relaxed/simple;
	bh=pTPZbqOZfMJr02mDN7OrHFMCIM4S1IrWhxaPVX54T5U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hO1Oj6BHfb+rUaFqQM9Ra5tiF4dEMrXK7M5CTEsncYleka1fckGfJvD9TVP5AmNOBQjTfwebWCxh01dhoNEWXXpsW/xwm0j7Z6GixJN1gZUFpAMsduFJAeAiAqU0wyWXURb/WufyaMylivtPn0XkUfTAlTW2FtwvBsQBYXyC6oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccpF8yMO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccpF8yMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788350535; x=1819886535;
  h=date:from:to:cc:subject:message-id;
  bh=pTPZbqOZfMJr02mDN7OrHFMCIM4S1IrWhxaPVX54T5U=;
  b=ccpF8yMOJF9KlAqojqHORZvl9yn4KuTBPyktj3jygjzdUTP+wUTvG164
   TLLka2t7r5tGlFE7sXF0YBbV4Orm7RefWEvuWzt9ErcKEXFD8U8Yu6pZd
   WWYWNFhYidbO+x8JZt+LZq+ZRDNGeO1VO9SpA5yI1F363Q9lKEmbpILc0
   lFGu5dOcOisN91zAW3/RiO7HW29WpGvKYy75fMc0S7GV2JcdJkzXs8Vja
   +Ik3ULZRvVNq6XJBTVlzMK9LLrDtaYvFsbzad8le5SU+wbbgriZQcHuf9
   XRSQV1MS1uLULNchLWr85K0WkVLOK6vt8fB/xL/ly+5UIPV3Wn9Oq6V5q
   g==;
X-CSE-ConnectionGUID: VGO1eaNcSaarfsGwfjj4Ig==
X-CSE-MsgGUID: UK5ikGApQJ26d1usJOSodw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92625816"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="92625816"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:02:11 -0700
X-CSE-ConnectionGUID: lZbcSS45SqWohyWO7xWA2A==
X-CSE-MsgGUID: S0VXkqV6RC6TaveJTASaGg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Sep 2026 05:02:10 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1jfL-000000002cf-3Yj3;
	Wed, 02 Sep 2026 12:02:07 +0000
Date: Wed, 02 Sep 2026 20:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/base/core.c:286 fw_devlink_refresh_fwnode() error:
 we previously assumed 'dev' could be null (see line 270)
Message-ID: <202609021949.DHc12Qt1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Saravana Kannan <saravanak@google.com>
CC: Herve Codina <herve.codina@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89a312991dc6e638a36adc43ccb91dbc25504c04
commit: 81e7c6befa36cecdcbf7244393bd67e8f8c59bf5 of: dynamic: Fix overlayed devices not probing because of fw_devlink
date:   3 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20260902 (https://download.01.org/0day-ci/archive/20260902/202609021949.DHc12Qt1-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 81e7c6befa36 ("of: dynamic: Fix overlayed devices not probing because of fw_devlink")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609021949.DHc12Qt1-lkp@intel.com/

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
