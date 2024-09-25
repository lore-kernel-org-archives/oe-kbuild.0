Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E20A13C683
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 01:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727227373; cv=none; b=b1nmYAHIyBevYUsOKDBsghCu0LagqN2U1kVEL22aSacE+/iWydd+ybriLYHdignJ+wJgpsIe5zNxVelN9Vp2WgBbBHRbvoLuCs1/pWtyjDiE4YHWScQe5ag5XXZnMkQ/n5LuckWhV0gxlDmLhe02OxGOft9IAFQWebD0WrQR3uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727227373; c=relaxed/simple;
	bh=c/aWMyM7vo9CeaP5tFrMzMO+SEIFUk/MhZUC5V+8sgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G9M6xFcu4/b+ruWuXosMgytDwHqG285LHxkwhpjBTpHsbJwe3o1VMHS8yc1E1k5R/tuF+nyYssHT8xEijvsGggsSLErv95TZox6yUN+xYuWCWlzYxSpy9crGmntPDtaG/xf5uiLZSRFlFYX5omZYvwJZo5vj3gKHCSxH9GPFpv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SB05l6qU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SB05l6qU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727227371; x=1758763371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/aWMyM7vo9CeaP5tFrMzMO+SEIFUk/MhZUC5V+8sgk=;
  b=SB05l6qU3irZ3m+vZrj+1//dxmEXg/U4tTHEH2dM9aACplWafMSlRHZN
   4jK4C16mXhYJX3bNFom/MVtSCXanmuQqFaorxT4ap13WouU9NqWCh+yYo
   jyDqzXbj9aA/rfA8xtwCPIjqan9vp3MRLxMT5q72SKwQiSuJYtBSG7W+e
   2cQJFvrYxXXI+rYdHwgyzS8/CpQGqcf4PcJ5IUZYyFo+I9jTiIvf/Zs6A
   u8FGJltvbHemtAAS7RyMIYFSfTKMGNphlB1k/7nXdPFPce/kYbEzwmeYh
   PLRT6nqF269Uu1kqODww+kJ/PSEVZqC54EUBr9ZLm0DXnhjR3h5SZr32E
   A==;
X-CSE-ConnectionGUID: m8VL3ecCQAKHKxJ7yjdh0w==
X-CSE-MsgGUID: G89j0T7jS9aO4LJ6o8IMJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26406506"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="26406506"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 18:22:50 -0700
X-CSE-ConnectionGUID: r8p1hxc7TReGqOwqr0PV9w==
X-CSE-MsgGUID: Q65jMPevQImFOUWl933cCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="71899524"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Sep 2024 18:22:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stGjv-000J17-1U;
	Wed, 25 Sep 2024 01:22:47 +0000
Date: Wed, 25 Sep 2024 09:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:djwong-wtf 299/315] fs/xfs/xfs_health.c:168:51-52:
 WARNING this kind of initialization is deprecated
Message-ID: <202409250903.ZSw14h75-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git djwong-wtf
head:   3b01d85f0113ab061770c5061d76aad6dc6f4ab9
commit: d48b7fd522c5737d7125a42abe2ba8689a9f48f5 [299/315] xfs: create hooks for monitoring health updates
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-053-20240925 (https://download.01.org/0day-ci/archive/20240925/202409250903.ZSw14h75-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409250903.ZSw14h75-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_health.c:168:51-52: WARNING this kind of initialization is deprecated
   fs/xfs/xfs_health.c:169:51-52: WARNING this kind of initialization is deprecated
   fs/xfs/xfs_health.c:170:54-55: WARNING this kind of initialization is deprecated
   fs/xfs/xfs_health.c:171:54-55: WARNING this kind of initialization is deprecated

vim +168 fs/xfs/xfs_health.c

d48b7fd522c573 Darrick J. Wong 2024-09-23  157  
d48b7fd522c573 Darrick J. Wong 2024-09-23  158  /* Configure health update hook functions. */
d48b7fd522c573 Darrick J. Wong 2024-09-23  159  void
d48b7fd522c573 Darrick J. Wong 2024-09-23  160  xfs_health_hook_setup(
d48b7fd522c573 Darrick J. Wong 2024-09-23  161  	struct xfs_health_hook	*hook,
d48b7fd522c573 Darrick J. Wong 2024-09-23  162  	notifier_fn_t		mod_fn)
d48b7fd522c573 Darrick J. Wong 2024-09-23  163  {
d48b7fd522c573 Darrick J. Wong 2024-09-23  164  	xfs_hook_setup(&hook->health_hook, mod_fn);
d48b7fd522c573 Darrick J. Wong 2024-09-23  165  }
d48b7fd522c573 Darrick J. Wong 2024-09-23  166  #else
d48b7fd522c573 Darrick J. Wong 2024-09-23  167  # define xfs_health_unmount_hook(...)			((void)0)
d48b7fd522c573 Darrick J. Wong 2024-09-23 @168  # define xfs_fs_health_update_hook(a,b,o,n)		do {o = o;} while(0)
d48b7fd522c573 Darrick J. Wong 2024-09-23  169  # define xfs_rt_health_update_hook(a,b,o,n)		do {o = o;} while(0)
d48b7fd522c573 Darrick J. Wong 2024-09-23  170  # define xfs_group_health_update_hook(a,b,o,n)		do {o = o;} while(0)
d48b7fd522c573 Darrick J. Wong 2024-09-23  171  # define xfs_inode_health_update_hook(a,b,o,n)		do {o = o;} while(0)
d48b7fd522c573 Darrick J. Wong 2024-09-23  172  #endif /* CONFIG_XFS_LIVE_HOOKS */
d48b7fd522c573 Darrick J. Wong 2024-09-23  173  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
