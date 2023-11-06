Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2AF1EB58
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7SFUpbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699280408; x=1730816408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wtGI/SUB8g3azIGOf6LncT0CQofXtdt/YlnztytfnOw=;
  b=n7SFUpbm/MXlFkgPwO/0jKHqAS4EsyOb+Qd/bN3wzBigQEfNru9Zx52D
   ZwQ3QKmPr7Y6ROJJrufeRyxqK1qfmd1FFW7Q9ekEK5HrUUxq1wkQqvw9G
   lA6K2Ek48ooAsCVA1aNBDDam/XiKH35bdbc0U4cXvnZHQa9Z3i1Py8dJI
   EFaF8XRGrL6ookT3d3ysmCB+wHokr8sKnzuSqf1hUQsCp6hEzuQ7mxa0J
   swwrb/ImI7YGULksNtTagQcMYgRWOnGYoJeO5KrWtjHfk0NVJ+kEZyK+u
   3jTiGl3qKWLSHEGV0nm6gZJe9SiHUC+X2VQN3/azuy1g3z7TstwtBtp85
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="388161462"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="388161462"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 06:20:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="3632043"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2023 06:20:06 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r00SR-0006Sy-39;
	Mon, 06 Nov 2023 14:20:03 +0000
Date: Mon, 6 Nov 2023 22:19:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:report-refcounts 440/501]
 fs/xfs/libxfs/xfs_refcount.c:161 xfs_refcount_check_rtgroup_irec() warn:
 impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
Message-ID: <202311062233.gSXGIixy-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git report-refcounts
head:   0a31e564c5c22bd33b46625694f7ccbb694dceb3
commit: 0bcdf19e696ed0ca04748e501795739000b3e227 [440/501] xfs: prepare refcount functions to deal with rtrefcountbt
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20231106 (https://download.01.org/0day-ci/archive/20231106/202311062233.gSXGIixy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311062233.gSXGIixy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311062233.gSXGIixy-lkp@intel.com/

New smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:161 xfs_refcount_check_rtgroup_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:171 xfs_refcount_check_rtgroup_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

Old smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:140 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:150 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

vim +161 fs/xfs/libxfs/xfs_refcount.c

2b30cc0bf0589d Darrick J. Wong 2023-04-11  155  
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  156  static inline xfs_failaddr_t
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  157  xfs_refcount_check_rtgroup_irec(
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  158  	struct xfs_rtgroup		*rtg,
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  159  	const struct xfs_refcount_irec	*irec)
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  160  {
0bcdf19e696ed0 Darrick J. Wong 2023-03-06 @161  	if (irec->rc_blockcount == 0 || irec->rc_blockcount > XFS_REFC_LEN_MAX)
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  162  		return __this_address;
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  163  
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  164  	if (!xfs_refcount_check_domain(irec))
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  165  		return __this_address;
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  166  
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  167  	/* check for valid extent range, including overflow */
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  168  	if (!xfs_verify_rgbext(rtg, irec->rc_startblock, irec->rc_blockcount))
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  169  		return __this_address;
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  170  
0bcdf19e696ed0 Darrick J. Wong 2023-03-06 @171  	if (irec->rc_refcount == 0 || irec->rc_refcount > XFS_REFC_REFCOUNT_MAX)
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  172  		return __this_address;
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  173  
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  174  	return NULL;
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  175  }
0bcdf19e696ed0 Darrick J. Wong 2023-03-06  176  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
