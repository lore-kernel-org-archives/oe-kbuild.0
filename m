Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295391FDA8E
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 23:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749944388; cv=none; b=CKmDdtT9nDN1OFuF1WEy/MYWjjLKiKirHKA1NX7HTGL3LMyp3OFt5swd4oHA/ar8UKIaeTi7xlFRFBXI+xZSVaaEhzz8kyP9OHfR3I1pFbj6Z/badk0yrc4UzN5Yj6biGdaTzbEFczCQv4slEb2u5o+2d9f3wPUci84UuY/uiT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749944388; c=relaxed/simple;
	bh=x8FVgPtKHBDWfiRFwlkRYqKyIZcnAqfRnEqPybXyIV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kz7Yny8kZwAPjPZL8fNKY98hW6HArGSI9gxB5sBmwb1VZU8IKCZ/srPWf4CmcZegr897v4a69+vQ3smGbK3HuP5/XXLyR+dZkdFHg8VY/AZ3L4nMux2HpvzYsEwUVmeJNG/f0s4HuXfKSe1e+oDORnAjKGRNo4+KOPHlL6koQVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOn6Izg+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOn6Izg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749944387; x=1781480387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x8FVgPtKHBDWfiRFwlkRYqKyIZcnAqfRnEqPybXyIV4=;
  b=HOn6Izg+4M3bBJHyaCIEMIXSY1oAu1+ixNypCSwHwKSOSbDHeCI9a2jj
   sQyPpdGBsig/Y462FQRDxQTb44ueSBA6xvTuL0sQHkZXnrL5y1BqzXmsU
   7iqyrn2WVRuZbk0pRZGHyrhJwJeiYlwuSqRd5alxsdTGPt5GekhZONXI8
   BBcjC1TdAFgv4SHEF2q6Ygy3b56drr1IXfDx7fXz1LVWYB8y1+C6fDi3P
   OyHm5CRKz+v0wolNIM2kACScFHmfQ+1kIoITzyal1gc0bcRjbW/K9SgNY
   VIEq7TvHC6ykprmjBWHDbQSUazG31Hlf9YgIqHaFOseMVD/InEB5mOJae
   Q==;
X-CSE-ConnectionGUID: elYqkamGRqS6L1ubuhmq6A==
X-CSE-MsgGUID: 2tJEJ1ylTLyrR778z9lqWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="74658692"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="74658692"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 16:39:47 -0700
X-CSE-ConnectionGUID: 8TLj3ebUSdmjnJiR+4Px7Q==
X-CSE-MsgGUID: gv3Rfih9R2y/QX+dEdeA/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="149017746"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Jun 2025 16:39:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQaTP-000Dwy-0d;
	Sat, 14 Jun 2025 23:39:43 +0000
Date: Sun, 15 Jun 2025 07:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:fuse-iomap-cache 43/45] fs/fuse/file_iomap.c:1997
 fuse_iomap_upsert_validate_dev() error: uninitialized symbol 'map_end'.
Message-ID: <202506150737.o7ZdCn6W-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-cache
head:   62857bad704590b8ed2cc579b4a859b953b93d5f
commit: 7954c15726a337e560ff0506896f2095e111cec9 [43/45] fuse: enable iomap cache management
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-161-20250615 (https://download.01.org/0day-ci/archive/20250615/202506150737.o7ZdCn6W-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506150737.o7ZdCn6W-lkp@intel.com/

smatch warnings:
fs/fuse/file_iomap.c:1997 fuse_iomap_upsert_validate_dev() error: uninitialized symbol 'map_end'.

vim +/map_end +1997 fs/fuse/file_iomap.c

7954c15726a337 Darrick J. Wong 2025-05-30  1978  
7954c15726a337 Darrick J. Wong 2025-05-30  1979  static inline int
7954c15726a337 Darrick J. Wong 2025-05-30  1980  fuse_iomap_upsert_validate_dev(
7954c15726a337 Darrick J. Wong 2025-05-30  1981  	const struct fuse_iomap_dev	*fb,
7954c15726a337 Darrick J. Wong 2025-05-30  1982  	uint16_t			map_type,
7954c15726a337 Darrick J. Wong 2025-05-30  1983  	uint64_t			map_addr,
7954c15726a337 Darrick J. Wong 2025-05-30  1984  	uint64_t			map_length)
7954c15726a337 Darrick J. Wong 2025-05-30  1985  {
7954c15726a337 Darrick J. Wong 2025-05-30  1986  	uint64_t			map_end;
7954c15726a337 Darrick J. Wong 2025-05-30  1987  	sector_t			device_bytes;
7954c15726a337 Darrick J. Wong 2025-05-30  1988  
7954c15726a337 Darrick J. Wong 2025-05-30  1989  	if (!fb)
7954c15726a337 Darrick J. Wong 2025-05-30  1990  		return 0;
7954c15726a337 Darrick J. Wong 2025-05-30  1991  
7954c15726a337 Darrick J. Wong 2025-05-30  1992  	if (map_addr != FUSE_IOMAP_NULL_ADDR &&
7954c15726a337 Darrick J. Wong 2025-05-30  1993  	    BAD_DATA(check_add_overflow(map_addr, map_length, &map_end)))
7954c15726a337 Darrick J. Wong 2025-05-30  1994  		return -EIO;
7954c15726a337 Darrick J. Wong 2025-05-30  1995  
7954c15726a337 Darrick J. Wong 2025-05-30  1996  	device_bytes = bdev_nr_sectors(fb->bdev) << SECTOR_SHIFT;
7954c15726a337 Darrick J. Wong 2025-05-30 @1997  	if (BAD_DATA(map_end > device_bytes))
7954c15726a337 Darrick J. Wong 2025-05-30  1998  		return -EIO;
7954c15726a337 Darrick J. Wong 2025-05-30  1999  
7954c15726a337 Darrick J. Wong 2025-05-30  2000  	return 0;
7954c15726a337 Darrick J. Wong 2025-05-30  2001  }
7954c15726a337 Darrick J. Wong 2025-05-30  2002  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
