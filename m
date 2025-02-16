Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F772366
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Feb 2025 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739695004; cv=none; b=lbvnfJGswLw74T3a48w6pzKLo7lPDPnxBj/0WQzc7aucuP5whmM2wL1VSWN8OId671N9sqouTsi99+HC6GGin401HdbMZgeek0hqeO0dnOBJA5lPdA62PuE9cnV6mIivnQAbpv1TpXlf4r43OfPJ2P6HUmJHj/LN9weXldZ95xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739695004; c=relaxed/simple;
	bh=UwoPpcrhyZSpMK3vBb58Lm3WyKpayHpw+zKr3So1frQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BVEiCh+k4q85i5pfRkEKfWF6K06c38uKvIQq5EfkavUGAMPTf3K+V4gn4waLpv4at21xp1MP3kcaLoQitoSlrrkrUS0n9cyqdLYlm0qwBSU81SQLO7t5X9WanwJzHOX0BaIIhV/7ZHvdWwH6P5HIBmKLVBdMS+tuHQnZcVMZCmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JweuByMy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JweuByMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739695003; x=1771231003;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UwoPpcrhyZSpMK3vBb58Lm3WyKpayHpw+zKr3So1frQ=;
  b=JweuByMyLueGYy1YR70D4Qz9sB16+uhYkUe9wvwNfGZaAdoYybQ1rE5A
   gRmKMx+qCJxBl2DUdJkzDD8mOszLQM2At+xOTm1ZDW6F4aeRG1v1jukDJ
   fyK8fwspKSe5XHbvF3RP2No+rw3hZmfN87ijtf5XN1kuVOT+8Q2SspnsD
   OTsxLQDQ+eJrJMH/KZJxEp1bSv/bl0qieQ8j9u8Wr1jv34NASNrPiRSEh
   xY3t/Z6hZecmODw6t8y2VZkzPzS6K+EgHJnoUBs+yjGRBS+ecS4eWATtn
   2HaC54CpuHrj7n8Nm47m4a0KIpohWF7KPhKQ7OIncRglgTRTGINo0SuM4
   g==;
X-CSE-ConnectionGUID: oO9slg86QG+CYhCazfpyqQ==
X-CSE-MsgGUID: Dk+fY9fGRC+K1qxlt24GyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="39580415"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="39580415"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 00:36:42 -0800
X-CSE-ConnectionGUID: HdV9+TVlTjKU3tcXsM6h/Q==
X-CSE-MsgGUID: ZP+cxjsqRBuDwhJOBDwElQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="144699899"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Feb 2025 00:36:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tja8k-001BiV-2e;
	Sun, 16 Feb 2025 08:36:38 +0000
Date: Sun, 16 Feb 2025 16:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1860/4011]
 drivers/gpu/drm/panthor/panthor_sched.c:3670
 panthor_fdinfo_gather_group_mem_info() warn: iterator 'i' not incremented
Message-ID: <202502161656.tCD7Bzmd-lkp@intel.com>
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
TO: "Adrián Larumbe" <adrian.larumbe@collabora.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Liviu Dudau <liviu.dudau@arm.com>
CC: Mihail Atanassov <mihail.atanassov@arm.com>
CC: Steven Price <steven.price@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ae0fa3bf0b44c8611d114a9f69985bf451010c3
commit: 434e5ca5b5d7ea415670d4fcb399d90d355a1e38 [1860/4011] drm/panthor: Expose size of driver internal BO's over fdinfo
:::::: branch date: 2 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-r073-20250214 (https://download.01.org/0day-ci/archive/20250216/202502161656.tCD7Bzmd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502161656.tCD7Bzmd-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/panthor/panthor_sched.c:3670 panthor_fdinfo_gather_group_mem_info() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/gpu/drm/panthor/panthor_sched.c:2881 panthor_fdinfo_gather_group_samples() warn: iterator 'i' not incremented
drivers/gpu/drm/panthor/panthor_sched.c:3643 panthor_group_pool_destroy() warn: iterator 'i' not incremented

vim +/i +3670 drivers/gpu/drm/panthor/panthor_sched.c

de85488138247d0 Boris Brezillon 2024-02-29  3650  
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3651  /**
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3652   * panthor_fdinfo_gather_group_mem_info() - Retrieve aggregate size of all private kernel BO's
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3653   * belonging to all the groups owned by an open Panthor file
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3654   * @pfile: File.
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3655   * @stats: Memory statistics to be updated.
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3656   *
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3657   */
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3658  void
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3659  panthor_fdinfo_gather_group_mem_info(struct panthor_file *pfile,
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3660  				     struct drm_memory_stats *stats)
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3661  {
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3662  	struct panthor_group_pool *gpool = pfile->groups;
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3663  	struct panthor_group *group;
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3664  	unsigned long i;
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3665  
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3666  	if (IS_ERR_OR_NULL(gpool))
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3667  		return;
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3668  
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3669  	xa_lock(&gpool->xa);
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30 @3670  	xa_for_each(&gpool->xa, i, group) {
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3671  		stats->resident += group->fdinfo.kbo_sizes;
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3672  		if (group->csg_id >= 0)
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3673  			stats->active += group->fdinfo.kbo_sizes;
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3674  	}
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3675  	xa_unlock(&gpool->xa);
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3676  }
434e5ca5b5d7ea4 Adrián Larumbe  2025-01-30  3677  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
