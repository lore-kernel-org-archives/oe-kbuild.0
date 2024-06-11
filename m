Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CF0155CAF
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Jun 2024 23:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718149215; cv=none; b=sLw7Pt1/nqPkslrfjk7mD/8bMV5Pi2erd8FHVMOiLvRpW6SuRfq758A9xaWHuJ5ox0WqyNzQr4yuUV+3jZgmVEJ2Wc9YGgEZA4Jn+7l33YycnuqTboNJ4zyDDywqxM3QrCrHzt52sKxhHyCKLGKBgIp7eO/DpYj8kXXZLR4fEwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718149215; c=relaxed/simple;
	bh=0TNII102G8VZ0YZAm0r3Im06cuqH3XLdV87iqzh9184=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kb5hJew7KK8+7daY5cxEJ74qhS8ftQlIGxrx6n2nyRYJAck9+l7Ze8326vhCJ/3dkOGZk5tKlnLTKTLOxMXvCBtcT1W1878zXEEyysDvLaNX/vncKeerwHa7TouA5dgd+y3DYadITub01k8V7jFKWrteHrESSRbN82k98Whbxws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VGdlpVKd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGdlpVKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718149214; x=1749685214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0TNII102G8VZ0YZAm0r3Im06cuqH3XLdV87iqzh9184=;
  b=VGdlpVKdlf0FXCXJFXxBlMGg4XxgTMNqQSuhJyOS5ccjRGvKYxACLavE
   esi5n/j48JxGQAoVLykNJMxcCGSl6nUls2FFV7b5XZjR+VGHtACwclPoQ
   ueGJ9f6LVgi2CwRyLnHdhs0gNYtNyo6rvbuoXqtya7pZo7qYjYk1r9CDp
   sDi0V6IcTV6qkW553wR/O6W8+AAkptQG0c0IAL9sbn1cn+OcmP/E1LROl
   YmNxC7Fp92rNqRMei+QkczvFwwvY+YHTN0DMR6DjaOA9hMiDCjJMjj1Db
   UIsHAcPfCAyrNaeJTmzNfA0jc4yabLKH6GDajnk+ddAVJh1XDpbs9CLBY
   w==;
X-CSE-ConnectionGUID: RBAdpwaJQ5iSqyHfw9+8QQ==
X-CSE-MsgGUID: FOgaucuXRiS8BUHYy47YRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15018253"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="15018253"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 16:40:14 -0700
X-CSE-ConnectionGUID: 1aoD3k7DTC2dy5+n0Fmwbw==
X-CSE-MsgGUID: zRra+iUkRDqMFiGAc4rLMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="39526074"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jun 2024 16:40:12 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHB62-0000zl-0U;
	Tue, 11 Jun 2024 23:40:10 +0000
Date: Wed, 12 Jun 2024 07:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:health-monitoring 297/310]
 fs/xfs/xfs_health.c:199:51-52: WARNING this kind of initialization is
 deprecated
Message-ID: <202406120745.N6dxOjmu-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   074ce47a8bd5ff767d2a86c6669ddba0d3a5526c
commit: 52db6d91325ef5dd9ab52e20c71664b6f1015305 [297/310] xfs: create hooks for monitoring health updates
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-102-20240612 (https://download.01.org/0day-ci/archive/20240612/202406120745.N6dxOjmu-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202406120745.N6dxOjmu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_health.c:199:51-52: WARNING this kind of initialization is deprecated
   fs/xfs/xfs_health.c:200:51-52: WARNING this kind of initialization is deprecated
   fs/xfs/xfs_health.c:201:51-52: WARNING this kind of initialization is deprecated
   fs/xfs/xfs_health.c:202:54-55: WARNING this kind of initialization is deprecated
   fs/xfs/xfs_health.c:203:55-56: WARNING this kind of initialization is deprecated

vim +199 fs/xfs/xfs_health.c

52db6d91325ef5 Darrick J. Wong 2024-05-28  188  
52db6d91325ef5 Darrick J. Wong 2024-05-28  189  /* Configure health update hook functions. */
52db6d91325ef5 Darrick J. Wong 2024-05-28  190  void
52db6d91325ef5 Darrick J. Wong 2024-05-28  191  xfs_health_hook_setup(
52db6d91325ef5 Darrick J. Wong 2024-05-28  192  	struct xfs_health_hook	*hook,
52db6d91325ef5 Darrick J. Wong 2024-05-28  193  	notifier_fn_t		mod_fn)
52db6d91325ef5 Darrick J. Wong 2024-05-28  194  {
52db6d91325ef5 Darrick J. Wong 2024-05-28  195  	xfs_hook_setup(&hook->health_hook, mod_fn);
52db6d91325ef5 Darrick J. Wong 2024-05-28  196  }
52db6d91325ef5 Darrick J. Wong 2024-05-28  197  #else
52db6d91325ef5 Darrick J. Wong 2024-05-28  198  # define xfs_health_unmount_hook(...)			((void)0)
52db6d91325ef5 Darrick J. Wong 2024-05-28 @199  # define xfs_fs_health_update_hook(a,b,o,n)		do {o = o;} while(0)
52db6d91325ef5 Darrick J. Wong 2024-05-28  200  # define xfs_rt_health_update_hook(a,b,o,n)		do {o = o;} while(0)
52db6d91325ef5 Darrick J. Wong 2024-05-28  201  # define xfs_ag_health_update_hook(a,b,o,n)		do {o = o;} while(0)
52db6d91325ef5 Darrick J. Wong 2024-05-28  202  # define xfs_inode_health_update_hook(a,b,o,n)		do {o = o;} while(0)
52db6d91325ef5 Darrick J. Wong 2024-05-28  203  # define xfs_rtgroup_health_update_hook(a,b,o,n)	do {o = o;} while(0)
52db6d91325ef5 Darrick J. Wong 2024-05-28  204  #endif /* CONFIG_XFS_LIVE_HOOKS */
52db6d91325ef5 Darrick J. Wong 2024-05-28  205  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
