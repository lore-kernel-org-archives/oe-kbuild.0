Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03913AD2
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 08:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hu/1qAey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702715088; x=1734251088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3JSnmcwZwkotPx0OKpeCG5NS+xzqxUR9g0KsRlEX66Q=;
  b=hu/1qAeyzh8nXCCvDjeqhuM4oQgz27N0SvWqIGTBiFxm57cAh72ApUOv
   s+yc1HnaNcr6emfrRF/9HX4pK41Ey2ujr/FX8JD7VDIs2btUGB6rtTm1d
   mFZzEc8pDGHAglDBInACrghuozC030b2vhhQy5UNzIAaXjmNxCxX+GrEW
   EkLbvGs5Zf8hwpqznRVwypsLgMHL408Xtk7PXT22pFBalYdqNgBnjNkdA
   QijvC7s/NTGUfqhlYgKXjc/QmagujWkgkr1TUWkbq70US/HtQw7wIf8Ff
   Y3LPgOVMDX0EEAtM3vszQHYYziswUG0hq/Uk8+2zlL7utKtMNC0L9R329
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2452100"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="2452100"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 00:24:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="1022200039"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="1022200039"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Dec 2023 00:24:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEPyV-0001KM-1M;
	Sat, 16 Dec 2023 08:24:43 +0000
Date: Sat, 16 Dec 2023 16:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [hch-xfs:xfs-zoned 62/62] fs/xfs/xfs_zone_alloc.c:1270:44-47: ERROR:
 invalid reference to the index variable of the iterator on line 1267
Message-ID: <202312161644.7zpSiIDG-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   60b5c8af1e240372d2e077071f06662efdccec3a
commit: 60b5c8af1e240372d2e077071f06662efdccec3a [62/62] xfs: support zoned RT devices
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-103-20231216 (https://download.01.org/0day-ci/archive/20231216/202312161644.7zpSiIDG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312161644.7zpSiIDG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_zone_alloc.c:1270:44-47: ERROR: invalid reference to the index variable of the iterator on line 1267

vim +1270 fs/xfs/xfs_zone_alloc.c

60b5c8af1e2403 Christoph Hellwig 2023-12-07  1239  
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1240  void
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1241  xfs_zoned_show_stats(
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1242  	struct seq_file		*m,
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1243  	struct xfs_mount	*mp)
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1244  {
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1245  	unsigned long		index = 0;
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1246  	unsigned		count = 0;
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1247  	struct xfs_rtgroup	*rtg;
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1248  
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1249  	seq_puts(m, "\n");
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1250  
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1251  	seq_printf(m, "\ttotal free blocks: %lld\n",
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1252  		xfs_estimate_freecounter(mp, FREE_RTEXTENTS));
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1253  	seq_printf(m, "\treserved free blocks: %lld\n",
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1254  			mp->m_resblks[FREE_RTEXTENTS].avail);
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1255  	seq_printf(m, "\treclaimable blocks: %lld\n",
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1256  			 percpu_counter_sum(&mp->m_zone_reclaimable));
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1257  
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1258  	spin_lock(&mp->m_zone_list_lock);
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1259  	seq_puts(m, "\topen zones:\n");
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1260  	list_for_each_entry(rtg, &mp->m_open_zones, rtg_entry)
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1261  		xfs_show_zone(m, rtg);
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1262  	if (mp->m_open_gc_zone) {
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1263  		seq_puts(m, "\topen gc zone:\n");
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1264  		xfs_show_zone(m, mp->m_open_gc_zone);
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1265  	}
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1266  	seq_puts(m, "\tgc zones:\n");
60b5c8af1e2403 Christoph Hellwig 2023-12-07 @1267  	list_for_each_entry(rtg, &mp->m_gc_zones, rtg_entry)
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1268  		xfs_show_zone(m, rtg);
60b5c8af1e2403 Christoph Hellwig 2023-12-07  1269  	seq_puts(m, "\treclaimable zones:\n");
60b5c8af1e2403 Christoph Hellwig 2023-12-07 @1270  	xa_for_each_marked(&mp->m_rtgroups, index, rtg, XFS_RTG_RECLAIMABLE) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
