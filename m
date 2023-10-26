Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E535A2EB05
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Oct 2023 16:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvl3joGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698336645; x=1729872645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QwT1u6MNVuCX3VoA9V2MF0fyxxFnDi0OtDzFyzBzHco=;
  b=kvl3joGSFxLZV4EMQvEpgPN+KSz7s2/DT5gneqQtDeaK4pvUKv1l32tB
   PrqmjcWyJgXvAaJcRZZ77vS8tbviZCosqV6bngSGrnBs3NHchTAtJWhNf
   qxu2u0KljgmAoPGHi3ULo5kBS2AVwCCmxOJyti7H9VM1sCMeQWXW6rJBH
   ZNxWbnT6eCIMxwY9hEh1X/VeCaOV3DZLgd6tgGS2djUU/iI4KHHbZSkr2
   kGhX7DCIgtG2SKEF/PNh+dL9eEzfCKJmralnaZR7LzDNAuTrrxe+OEced
   DzbnWBV168C+xEP4QN10Qsv4eM2yor+ODany5II/hm4QuJiRWbQEcxqZZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="9134976"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="9134976"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 09:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="849974098"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="849974098"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Oct 2023 09:09:28 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw2vG-0009vB-2f;
	Thu, 26 Oct 2023 16:09:26 +0000
Date: Fri, 27 Oct 2023 00:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 79/172] fs/xfs/xfs_buf.c:2510
 xfs_buftarg_nr_sectors() warn: bitwise AND condition is false here
Message-ID: <202310262346.K6ZI5YGa-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   b906f6a9d64e5a914bcc5e69a08dd27e99361afd
commit: 1d653b15c5c24f675006eec7c6de006178499674 [79/172] xfs: support in-memory btrees
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20231022 (https://download.01.org/0day-ci/archive/20231026/202310262346.K6ZI5YGa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231026/202310262346.K6ZI5YGa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310262346.K6ZI5YGa-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_buf.c:2510 xfs_buftarg_nr_sectors() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/xfs_buf.c:748 xfs_buf_get_map() error: we previously assumed 'bp' could be null (see line 730)
fs/xfs/xfs_buf.c:1641 _xfs_buf_ioapply() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:2017 xfs_free_buftarg() warn: bitwise AND condition is false here

vim +2510 fs/xfs/xfs_buf.c

1d653b15c5c24f Darrick J. Wong 2023-03-06  2504  
1d653b15c5c24f Darrick J. Wong 2023-03-06  2505  /* Return the number of sectors for a buffer target. */
1d653b15c5c24f Darrick J. Wong 2023-03-06  2506  xfs_daddr_t
1d653b15c5c24f Darrick J. Wong 2023-03-06  2507  xfs_buftarg_nr_sectors(
1d653b15c5c24f Darrick J. Wong 2023-03-06  2508  	struct xfs_buftarg	*btp)
1d653b15c5c24f Darrick J. Wong 2023-03-06  2509  {
1d653b15c5c24f Darrick J. Wong 2023-03-06 @2510  	if (btp->bt_flags & XFS_BUFTARG_XFILE)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
