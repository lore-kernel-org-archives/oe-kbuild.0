Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D33E1509AB
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 00:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765844216; cv=none; b=IUmk8XgtzC2sAhMjC/SnIlz9TLaK62WySDegWzYi72UzAIGxle78OMIuJ0TVzYGYKChSRALvr9Sg97V3M9V+fIjGz7s78Yj3ONcLpWKq3I66HHaZn0gmx5WWiQyFVup0bsnropJsUaJWk85G5S6DYTg1GQzj6bnJJl6CtI/dxjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765844216; c=relaxed/simple;
	bh=J8ljSqgnLGU8pSwTdfZTrktPc393DwSxOudcwIbWtLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BLGWQRJvtRk3O1TfD7klSoQoDNg2F+Y+/r7yqsyXfs/dKRWSlo15qFf1b3ajpQvEdYXiJVSaZRN4mEDWvvLbaZEPkFVcZj7hg0JlrbN29J+54yx/cz7dFSID1Dw4NAoOs5OOeWsm0Nsxz51G+1+THwt1eujDoJagNWTcF1XNEG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqAMmYVT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqAMmYVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765844214; x=1797380214;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=J8ljSqgnLGU8pSwTdfZTrktPc393DwSxOudcwIbWtLQ=;
  b=TqAMmYVTb5AfuBmV7+34LXvOK/I1uxwBUcYQBaaMcWqAJn8i6tC0OS6r
   bpJPi4ayoW//w6u7ggFTpHJtzvKiFwdLEjhhvlVIu6MHE73f2s6KgdwwU
   9hWaLHrsTSp0O4kj6Y50Ncs9vbnrque5tkD0lNBjDH+nHyyDhxhczlPhA
   o2qiWO2zLqbXxA8Gcg8HScx1DmbvO3aw6sgeaGsZ1piI7FDZv5ucqJFrS
   YNrk/nveJd2rLOmeDvP5ljbB2smFVhHsbwnQ4MzdXRq40L4BtUNQgFRIi
   EkuKJp6Xg/PBf7iXm+1KITDoJq2B4mtrhaQCQSn5UilGtZJeNy4L+etEz
   g==;
X-CSE-ConnectionGUID: 3mwyUNzJTd28ByERjvuk1Q==
X-CSE-MsgGUID: txTg5Uv4SQyU9PkBSbBfwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67721237"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67721237"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 16:16:54 -0800
X-CSE-ConnectionGUID: nyXS2nPIQ/SVJEsOwnS1VA==
X-CSE-MsgGUID: gxy4iy5pTzOd1DitpQQz8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197139320"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Dec 2025 16:16:52 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVIkE-000000000xf-02sc;
	Tue, 16 Dec 2025 00:16:50 +0000
Date: Tue, 16 Dec 2025 08:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/panthor/panthor_sched.c:3670
 panthor_fdinfo_gather_group_mem_info() warn: iterator 'i' not incremented
Message-ID: <202512160857.deV0FrrJ-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Adrián Larumbe" <adrian.larumbe@collabora.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Liviu Dudau <liviu.dudau@arm.com>
CC: Mihail Atanassov <mihail.atanassov@arm.com>
CC: Steven Price <steven.price@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 434e5ca5b5d7ea415670d4fcb399d90d355a1e38 drm/panthor: Expose size of driver internal BO's over fdinfo
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: sparc-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251216/202512160857.deV0FrrJ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160857.deV0FrrJ-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/panthor/panthor_sched.c:3670 panthor_fdinfo_gather_group_mem_info() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/gpu/drm/panthor/panthor_sched.c:2881 panthor_fdinfo_gather_group_samples() warn: iterator 'i' not incremented
drivers/gpu/drm/panthor/panthor_sched.c:3643 panthor_group_pool_destroy() warn: iterator 'i' not incremented

vim +/i +3670 drivers/gpu/drm/panthor/panthor_sched.c

de85488138247d Boris Brezillon 2024-02-29  3650  
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3651  /**
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3652   * panthor_fdinfo_gather_group_mem_info() - Retrieve aggregate size of all private kernel BO's
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3653   * belonging to all the groups owned by an open Panthor file
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3654   * @pfile: File.
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3655   * @stats: Memory statistics to be updated.
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3656   *
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3657   */
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3658  void
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3659  panthor_fdinfo_gather_group_mem_info(struct panthor_file *pfile,
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3660  				     struct drm_memory_stats *stats)
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3661  {
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3662  	struct panthor_group_pool *gpool = pfile->groups;
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3663  	struct panthor_group *group;
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3664  	unsigned long i;
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3665  
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3666  	if (IS_ERR_OR_NULL(gpool))
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3667  		return;
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3668  
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3669  	xa_lock(&gpool->xa);
434e5ca5b5d7ea Adrián Larumbe  2025-01-30 @3670  	xa_for_each(&gpool->xa, i, group) {
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3671  		stats->resident += group->fdinfo.kbo_sizes;
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3672  		if (group->csg_id >= 0)
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3673  			stats->active += group->fdinfo.kbo_sizes;
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3674  	}
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3675  	xa_unlock(&gpool->xa);
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3676  }
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  3677  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
