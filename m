Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4D31CF80
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Oct 2023 17:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEZ4a863"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698082387; x=1729618387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s8ZBTvS6Z9vZu+9ALbRAIxKNGMaoi4yCnsj6SqjiMtw=;
  b=QEZ4a863OPxlVLOQuzzUpC6r/lMJZMVB3s68KXZM/ZHOSdfv6KU//A6w
   oqgYB1Qx/1UibkRi5j1CeFtVSgL/4mTMUrt7wgqoa8AGf487mdjML5/+1
   Ei1FhxGLZJ49DBj6hA9pezuTcrwWMZygT3lMWASgjtBqHkRwTBpBZXqnX
   rQGfm/BrKDflaxtON0xuo7DSsX+kbxVYu08D/7I0ihoy38atuH7YFyOiI
   wS8IYcV1Jm+C8yicPu9LydcmDNKVvSmqhah5JsI0NoSwSpUEHSZx7Ib08
   iByGQNtldRErAFCP07IbNOyMtOepIWefQ7fnkDFfL8FbR1M4lZ7LveKMQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="453357169"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="453357169"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="901874936"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="901874936"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2023 10:30:46 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quynV-00077B-30;
	Mon, 23 Oct 2023 17:33:01 +0000
Date: Tue, 24 Oct 2023 01:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 79/172] fs/xfs/xfs_buf.c:2510
 xfs_buftarg_nr_sectors() warn: bitwise AND condition is false here
Message-ID: <202310240135.X5AcqWdg-lkp@intel.com>
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
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: i386-randconfig-141-20231022 (https://download.01.org/0day-ci/archive/20231024/202310240135.X5AcqWdg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240135.X5AcqWdg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310240135.X5AcqWdg-lkp@intel.com/

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
