Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA1C22AE45
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 17:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757610300; cv=none; b=ekU9hPBVyPwAc3/t6On1Hxv8oa5q6Z3LrlICtFuLzTffDQ5/KC/Tnj0je7qosoZwz/mL9qJCp5m0AWcY6qCrZmfCVScznL4lU1IGf0e9le5i8X485wH1pAbbOQWOrBkuqe5gVr1o1C8fNC2YLyGgcTB0Tijh+d1DKyVpfjeq/Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757610300; c=relaxed/simple;
	bh=1JiCl0oDig38RtC2mYU23w0Oa/W6SLjS5tmHKYw1gLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z4UxVIHLaLI4iHJiBAc6DqjajAIdLqnd/ExdHW0eLydPn0l5lzqjiYXlh/XfyJZ99kRK1EUxHIGHROZ11ziRfzUmRS0bgo0UUei3JEu8T3ifUaoFBYelPo4f2af9iQdRejgLnrkB/CZEe5EQHxqr4P7RFx3FsaNjNWbxKmEi5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLeg8U63; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLeg8U63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757610299; x=1789146299;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1JiCl0oDig38RtC2mYU23w0Oa/W6SLjS5tmHKYw1gLo=;
  b=bLeg8U63ZrBuTF6uRMAEoc0ruYacU4Dgwi4J2wDg301qP44imFgxKCsH
   laoFegq0Z0Oenxpef/w+s3rFRT20BlDLkxT1baVR27o2bgrEGRIbQm6Kh
   4pDLGn12mOVL8kaBvo71TUpRyo57d8gvfKay70JS3GpIncpyk9i7hPKWA
   NK9F2363GbtfBpSKskFEhXSyGa0nJp/tPJZ3gVtnIfNLysk3+ezDmvWy9
   qUuKK4jj9pyfRDbKU1V2i5x2UjERt/yMPFZi7Tl9XBtJ/hL0pAHLG/k/P
   90Osp9VzIctoGD+oXACgi7qI6qc5Z/bkesp6n6WcQHv7ASZtUcHAi9Hqf
   g==;
X-CSE-ConnectionGUID: f9Ld2c22QeuSgn5PeCVKGg==
X-CSE-MsgGUID: UsXQ4rJ3SE2KAGMnDIUEPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59872423"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59872423"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 10:04:59 -0700
X-CSE-ConnectionGUID: Lq//mITfTtG9h7Xbx6vJSQ==
X-CSE-MsgGUID: aIVBi9VzRv6uAPDugNq9KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="210889398"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 11 Sep 2025 10:04:57 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwkiw-0000Vc-0K;
	Thu, 11 Sep 2025 17:04:44 +0000
Date: Fri, 12 Sep 2025 01:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7717/8263] drivers/gpu/drm/xe/xe_bo.c:2225
 xe_bo_create_novm() error: uninitialized symbol 'bo'.
Message-ID: <202509120048.WXKCbnyT-lkp@intel.com>
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
:::::: branch date: 11 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-141-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120048.WXKCbnyT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509120048.WXKCbnyT-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_bo.c:2225 xe_bo_create_novm() error: uninitialized symbol 'bo'.
drivers/gpu/drm/xe/xe_bo.c:2914 xe_gem_create_ioctl() error: uninitialized symbol 'bo'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_bo.c:2919 xe_gem_create_ioctl() error: uninitialized symbol 'bo'.

vim +/bo +2225 drivers/gpu/drm/xe/xe_bo.c

622f709ca6297d8 Pallavi Mishra    2023-08-11  2201  
a2f2453c2c2647f Thomas Hellström  2025-09-08  2202  static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *tile,
a2f2453c2c2647f Thomas Hellström  2025-09-08  2203  				       size_t size, u16 cpu_caching,
a2f2453c2c2647f Thomas Hellström  2025-09-08  2204  				       enum ttm_bo_type type, u32 flags,
a2f2453c2c2647f Thomas Hellström  2025-09-08  2205  				       u64 alignment, bool intr)
622f709ca6297d8 Pallavi Mishra    2023-08-11  2206  {
a2f2453c2c2647f Thomas Hellström  2025-09-08  2207  	struct xe_validation_ctx ctx;
a2f2453c2c2647f Thomas Hellström  2025-09-08  2208  	struct drm_exec exec;
a2f2453c2c2647f Thomas Hellström  2025-09-08  2209  	struct xe_bo *bo;
a2f2453c2c2647f Thomas Hellström  2025-09-08  2210  	int ret = 0;
622f709ca6297d8 Pallavi Mishra    2023-08-11  2211  
a2f2453c2c2647f Thomas Hellström  2025-09-08  2212  	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = intr},
a2f2453c2c2647f Thomas Hellström  2025-09-08  2213  			    ret) {
a2f2453c2c2647f Thomas Hellström  2025-09-08  2214  		bo = __xe_bo_create_locked(xe, tile, NULL, size, 0, ~0ULL,
a2f2453c2c2647f Thomas Hellström  2025-09-08  2215  					   cpu_caching, type, flags, alignment, &exec);
a2f2453c2c2647f Thomas Hellström  2025-09-08  2216  		drm_exec_retry_on_contention(&exec);
a2f2453c2c2647f Thomas Hellström  2025-09-08  2217  		if (IS_ERR(bo)) {
a2f2453c2c2647f Thomas Hellström  2025-09-08  2218  			ret = PTR_ERR(bo);
a2f2453c2c2647f Thomas Hellström  2025-09-08  2219  			xe_validation_retry_on_oom(&ctx, &ret);
a2f2453c2c2647f Thomas Hellström  2025-09-08  2220  		} else {
a2f2453c2c2647f Thomas Hellström  2025-09-08  2221  			xe_bo_unlock(bo);
a2f2453c2c2647f Thomas Hellström  2025-09-08  2222  		}
a2f2453c2c2647f Thomas Hellström  2025-09-08  2223  	}
a2f2453c2c2647f Thomas Hellström  2025-09-08  2224  
a2f2453c2c2647f Thomas Hellström  2025-09-08 @2225  	return ret ? ERR_PTR(ret) : bo;
d8b52a02cb40fe3 Maarten Lankhorst 2023-01-12  2226  }
d8b52a02cb40fe3 Maarten Lankhorst 2023-01-12  2227  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
