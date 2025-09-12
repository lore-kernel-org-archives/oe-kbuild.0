Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED21E19D8A3
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 04:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757652410; cv=none; b=Gfe97uvUy4zxxOZeuXBGYuCAHtdPqAb6H/2pozSjPkSvoBbZpbmvI8Sessc4lJBiRfr9agRRPK6ZjXi6xxMem7QWprxA9QNQKg8EXUJfiLU3pBxZeoEVghDfl5umRtUXx+OMJCNiQcPBXz4qOt9wP3GQbTJa4tl4oqEQYGVjEtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757652410; c=relaxed/simple;
	bh=51ECTqE1bof9BSt2sVfuzFtLKjqslpMF8hlbX+4Yio8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OzfWraFJjiMBt5iHtuT4f00FoS10xDeXgXQgArIYds6ceqFvMhIIfJY57YEi+OICAuOgkLyfHgJfpTlscDWhOnIebhVUNdPbP8RiQ90R11ouVl05PAl3iGtB0rzjvzAsMRKgmbsI1+ytgwN8L/46WnMpNPF4P5gy3zvBSeg56o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxevXNmI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxevXNmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757652409; x=1789188409;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=51ECTqE1bof9BSt2sVfuzFtLKjqslpMF8hlbX+4Yio8=;
  b=DxevXNmId3ZTiA7Z73GSPjXHZdII/IMyOf7iozucwgXG4JEmg3l2H4l6
   9uWQcaCNsJyYlkA2KrUSYyfvfD+Sm4VFD6miIAPtOkQL2uNqFpg4ki1P9
   8bMSLRVpkMiGzue2eThsgJsibj20OQwnC/MJejn60U6SzJfRyP1H/dNQL
   3kNl7oVGDqRqeCHfJ1+Xdfotim3PGPOAm3oKPdcjbJ0jw5BXsvoJslzFz
   69dDIyD5TjvcUQv2pRT7sXGt5B/DeA6t95DIjKe35Toru8/hTmuCNL8Dn
   hILoHPYQzzPOJw87k9g3lQyx144ErD23Ypb2kp9dNOd3mmYZP/xaNpike
   A==;
X-CSE-ConnectionGUID: 535WGa8nSr+uySNNdAE51Q==
X-CSE-MsgGUID: LMb9/zR1QcKQwK6S33Hf4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="47563870"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="47563870"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 21:46:48 -0700
X-CSE-ConnectionGUID: Vq5PXDUoS4iz0oP3DAUfnw==
X-CSE-MsgGUID: GyotyjYaSIqei/L2Yn1aeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="174306792"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 11 Sep 2025 21:46:47 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwvgL-0000qe-0G;
	Fri, 12 Sep 2025 04:46:45 +0000
Date: Fri, 12 Sep 2025 12:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7717/8263] drivers/gpu/drm/xe/xe_bo.c:2225
 xe_bo_create_novm() error: uninitialized symbol 'bo'.
Message-ID: <202509121203.8GkvC1Gn-lkp@intel.com>
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
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f21d9da46702c4d6951ba60ca8a05f42870fe8f
commit: a2f2453c2c2647f16b86a805e9b45c1fcd9b8fc9 [7717/8263] drm/xe: Convert xe_bo_create_user() for exhaustive eviction
:::::: branch date: 22 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250911 (https://download.01.org/0day-ci/archive/20250912/202509121203.8GkvC1Gn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509121203.8GkvC1Gn-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_bo.c:2225 xe_bo_create_novm() error: uninitialized symbol 'bo'.
drivers/gpu/drm/xe/xe_bo.c:2914 xe_gem_create_ioctl() error: uninitialized symbol 'bo'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_bo.c:2919 xe_gem_create_ioctl() error: uninitialized symbol 'bo'.

vim +/bo +2225 drivers/gpu/drm/xe/xe_bo.c

622f709ca6297d Pallavi Mishra    2023-08-11  2201  
a2f2453c2c2647 Thomas Hellström  2025-09-08  2202  static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *tile,
a2f2453c2c2647 Thomas Hellström  2025-09-08  2203  				       size_t size, u16 cpu_caching,
a2f2453c2c2647 Thomas Hellström  2025-09-08  2204  				       enum ttm_bo_type type, u32 flags,
a2f2453c2c2647 Thomas Hellström  2025-09-08  2205  				       u64 alignment, bool intr)
622f709ca6297d Pallavi Mishra    2023-08-11  2206  {
a2f2453c2c2647 Thomas Hellström  2025-09-08  2207  	struct xe_validation_ctx ctx;
a2f2453c2c2647 Thomas Hellström  2025-09-08  2208  	struct drm_exec exec;
a2f2453c2c2647 Thomas Hellström  2025-09-08  2209  	struct xe_bo *bo;
a2f2453c2c2647 Thomas Hellström  2025-09-08  2210  	int ret = 0;
622f709ca6297d Pallavi Mishra    2023-08-11  2211  
a2f2453c2c2647 Thomas Hellström  2025-09-08  2212  	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = intr},
a2f2453c2c2647 Thomas Hellström  2025-09-08  2213  			    ret) {
a2f2453c2c2647 Thomas Hellström  2025-09-08  2214  		bo = __xe_bo_create_locked(xe, tile, NULL, size, 0, ~0ULL,
a2f2453c2c2647 Thomas Hellström  2025-09-08  2215  					   cpu_caching, type, flags, alignment, &exec);
a2f2453c2c2647 Thomas Hellström  2025-09-08  2216  		drm_exec_retry_on_contention(&exec);
a2f2453c2c2647 Thomas Hellström  2025-09-08  2217  		if (IS_ERR(bo)) {
a2f2453c2c2647 Thomas Hellström  2025-09-08  2218  			ret = PTR_ERR(bo);
a2f2453c2c2647 Thomas Hellström  2025-09-08  2219  			xe_validation_retry_on_oom(&ctx, &ret);
a2f2453c2c2647 Thomas Hellström  2025-09-08  2220  		} else {
a2f2453c2c2647 Thomas Hellström  2025-09-08  2221  			xe_bo_unlock(bo);
a2f2453c2c2647 Thomas Hellström  2025-09-08  2222  		}
a2f2453c2c2647 Thomas Hellström  2025-09-08  2223  	}
a2f2453c2c2647 Thomas Hellström  2025-09-08  2224  
a2f2453c2c2647 Thomas Hellström  2025-09-08 @2225  	return ret ? ERR_PTR(ret) : bo;
d8b52a02cb40fe Maarten Lankhorst 2023-01-12  2226  }
d8b52a02cb40fe Maarten Lankhorst 2023-01-12  2227  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
