Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BAC15B14F
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jun 2024 23:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718840644; cv=none; b=eCmqY8znkQfRVTvJ5d0kwxF2vMspJ+IDbF8nWN6JDhEl1XEoTqvp8PnoLRmC1tO8ltP14a0ese0JJjZod498nB1uSwdsrQLsxXjQS0mz2Cqz+Npig6D+NRAiL5WgPsFJJxBAF0/VRa7st0LflKZJ7yP7goTrtmtoZAlGCUHvdAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718840644; c=relaxed/simple;
	bh=B1q9TW2Lg96H9hXo/3v9C5mC/7Mgg4DEp3xM/ZVLwDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dOyhdB7MxSYREjNLm4r6IqG+z3jwh0PORktVVPHfRnYzgFJ3KuoB4//uWH8MzUvg5z8ihXWFz/XFAZly9v+5D9Z4kTuNNHNvePAbVJTtyyn3apGAFs4oONTjgaPZxbRcoGYEVVaOy+NIwqO/ghBYz5GQbDZoLtty7gJH9XLuzYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Slsddutb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Slsddutb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718840642; x=1750376642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B1q9TW2Lg96H9hXo/3v9C5mC/7Mgg4DEp3xM/ZVLwDA=;
  b=SlsddutbVL9yZ37OyON5Qt8W60ilqpV8bFAbBQdY6S7TfuJL0h+TRq1+
   i0jb1iq7dAQ0zdEYD47Ag6N8cG1UBWeBOWqt1PHhRAl6HD1NlGNOixrG4
   hGTU8oewrxioi2cz8KLg6RSpe3cak5rgFQ6jXHMbc/qNACnVeg62EfO5q
   XvWAMDofWoPlJjOsSvcb62opwpBfviqJ5y5601pC8Wo1i8ljUU8y29k3c
   J+YYBgyrtqRz148ZPMztwqAfNA96fP7b/n4toRqTaIZJV4wneHggIuNna
   DZpBuCzDmkXVVLIV59OspUbSKOIBY8c6Juxil7RS13K6C6iLElTtZvo28
   w==;
X-CSE-ConnectionGUID: yeaLohclS3+Eulqit7/VqA==
X-CSE-MsgGUID: myNTtvdwQvCWYp1wzADnyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="38310023"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="38310023"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 16:44:01 -0700
X-CSE-ConnectionGUID: GlGyDUXvRxeZVRSplJkcvQ==
X-CSE-MsgGUID: 1ttjOzcQQfu2iGqPm8N6ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="46428534"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jun 2024 16:43:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK4y5-00076U-0y;
	Wed, 19 Jun 2024 23:43:57 +0000
Date: Thu, 20 Jun 2024 07:43:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6397/7105] drivers/gpu/drm/xe/xe_oa.c:293
 xe_oa_add_config_ioctl() error: we previously assumed 'oa->xe' could be null
 (see line 292)
Message-ID: <202406200703.72WIWhEJ-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2102cb0d050d34d50b9642a3a50861787527e922
commit: cdf02fe1a94a768cbcd20f5c4e1a1d805f4a06c0 [6397/7105] drm/xe/oa/uapi: Add/remove OA config perf ops
:::::: branch date: 8 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-161-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200703.72WIWhEJ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406200703.72WIWhEJ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_oa.c:293 xe_oa_add_config_ioctl() error: we previously assumed 'oa->xe' could be null (see line 292)
drivers/gpu/drm/xe/xe_oa.c:392 xe_oa_remove_config_ioctl() error: we previously assumed 'oa->xe' could be null (see line 391)

vim +293 drivers/gpu/drm/xe/xe_oa.c

cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  272  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  273  /**
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  274   * xe_oa_add_config_ioctl - Adds one OA config
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  275   * @dev: @drm_device
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  276   * @data: pointer to struct @drm_xe_oa_config
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  277   * @file: @drm_file
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  278   *
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  279   * The functions adds an OA config to the set of OA configs maintained in
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  280   * the kernel. The config determines which OA metrics are collected for an
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  281   * OA stream.
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  282   */
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  283  int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  284  {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  285  	struct xe_oa *oa = &to_xe_device(dev)->oa;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  286  	struct drm_xe_oa_config param;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  287  	struct drm_xe_oa_config *arg = &param;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  288  	struct xe_oa_config *oa_config, *tmp;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  289  	struct xe_oa_reg *regs;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  290  	int err, id;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  291  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @292  	if (!oa->xe) {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @293  		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  294  		return -ENODEV;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  295  	}
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  296  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  297  	if (xe_perf_stream_paranoid && !perfmon_capable()) {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  298  		drm_dbg(&oa->xe->drm, "Insufficient privileges to add xe OA config\n");
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  299  		return -EACCES;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  300  	}
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  301  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  302  	err = __copy_from_user(&param, u64_to_user_ptr(data), sizeof(param));
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  303  	if (XE_IOCTL_DBG(oa->xe, err))
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  304  		return -EFAULT;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  305  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  306  	if (XE_IOCTL_DBG(oa->xe, arg->extensions) ||
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  307  	    XE_IOCTL_DBG(oa->xe, !arg->regs_ptr) ||
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  308  	    XE_IOCTL_DBG(oa->xe, !arg->n_regs))
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  309  		return -EINVAL;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  310  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  311  	oa_config = kzalloc(sizeof(*oa_config), GFP_KERNEL);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  312  	if (!oa_config)
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  313  		return -ENOMEM;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  314  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  315  	oa_config->oa = oa;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  316  	kref_init(&oa_config->ref);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  317  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  318  	if (!uuid_is_valid(arg->uuid)) {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  319  		drm_dbg(&oa->xe->drm, "Invalid uuid format for OA config\n");
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  320  		err = -EINVAL;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  321  		goto reg_err;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  322  	}
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  323  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  324  	/* Last character in oa_config->uuid will be 0 because oa_config is kzalloc */
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  325  	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  326  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  327  	oa_config->regs_len = arg->n_regs;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  328  	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg_addr,
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  329  				u64_to_user_ptr(arg->regs_ptr),
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  330  				arg->n_regs);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  331  	if (IS_ERR(regs)) {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  332  		drm_dbg(&oa->xe->drm, "Failed to create OA config for mux_regs\n");
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  333  		err = PTR_ERR(regs);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  334  		goto reg_err;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  335  	}
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  336  	oa_config->regs = regs;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  337  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  338  	err = mutex_lock_interruptible(&oa->metrics_lock);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  339  	if (err)
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  340  		goto reg_err;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  341  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  342  	/* We shouldn't have too many configs, so this iteration shouldn't be too costly */
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  343  	idr_for_each_entry(&oa->metrics_idr, tmp, id) {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  344  		if (!strcmp(tmp->uuid, oa_config->uuid)) {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  345  			drm_dbg(&oa->xe->drm, "OA config already exists with this uuid\n");
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  346  			err = -EADDRINUSE;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  347  			goto sysfs_err;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  348  		}
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  349  	}
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  350  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  351  	err = create_dynamic_oa_sysfs_entry(oa, oa_config);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  352  	if (err) {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  353  		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  354  		goto sysfs_err;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  355  	}
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  356  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  357  	oa_config->id = idr_alloc(&oa->metrics_idr, oa_config, 1, 0, GFP_KERNEL);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  358  	if (oa_config->id < 0) {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  359  		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  360  		err = oa_config->id;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  361  		goto sysfs_err;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  362  	}
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  363  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  364  	mutex_unlock(&oa->metrics_lock);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  365  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  366  	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->uuid, oa_config->id);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  367  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  368  	return oa_config->id;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  369  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  370  sysfs_err:
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  371  	mutex_unlock(&oa->metrics_lock);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  372  reg_err:
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  373  	xe_oa_config_put(oa_config);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  374  	drm_dbg(&oa->xe->drm, "Failed to add new OA config\n");
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  375  	return err;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  376  }
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  377  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  378  /**
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  379   * xe_oa_remove_config_ioctl - Removes one OA config
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  380   * @dev: @drm_device
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  381   * @data: pointer to struct @drm_xe_perf_param
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  382   * @file: @drm_file
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  383   */
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  384  int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  385  {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  386  	struct xe_oa *oa = &to_xe_device(dev)->oa;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  387  	struct xe_oa_config *oa_config;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  388  	u64 arg, *ptr = u64_to_user_ptr(data);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  389  	int ret;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  390  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @391  	if (!oa->xe) {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @392  		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  393  		return -ENODEV;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  394  	}
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  395  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  396  	if (xe_perf_stream_paranoid && !perfmon_capable()) {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  397  		drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  398  		return -EACCES;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  399  	}
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  400  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  401  	ret = get_user(arg, ptr);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  402  	if (XE_IOCTL_DBG(oa->xe, ret))
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  403  		return ret;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  404  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  405  	ret = mutex_lock_interruptible(&oa->metrics_lock);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  406  	if (ret)
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  407  		return ret;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  408  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  409  	oa_config = idr_find(&oa->metrics_idr, arg);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  410  	if (!oa_config) {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  411  		drm_dbg(&oa->xe->drm, "Failed to remove unknown OA config\n");
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  412  		ret = -ENOENT;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  413  		goto err_unlock;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  414  	}
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  415  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  416  	WARN_ON(arg != oa_config->id);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  417  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  418  	sysfs_remove_group(oa->metrics_kobj, &oa_config->sysfs_metric);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  419  	idr_remove(&oa->metrics_idr, arg);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  420  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  421  	mutex_unlock(&oa->metrics_lock);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  422  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  423  	drm_dbg(&oa->xe->drm, "Removed config %s id=%i\n", oa_config->uuid, oa_config->id);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  424  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  425  	xe_oa_config_put(oa_config);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  426  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  427  	return 0;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  428  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  429  err_unlock:
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  430  	mutex_unlock(&oa->metrics_lock);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  431  	return ret;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  432  }
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  433  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
