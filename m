Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FF017988
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNp+LGxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702714367; x=1734250367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TDbYW4zXmURlFYZP1TA1Kz2PN/sqJZyHcqPD34oti0w=;
  b=VNp+LGxz9Su4t+p8KNRADKq3X8mWKrKzOmlYDjKxOmL8zQuSP6TqSuNO
   OeLzXcNwwtB0iC9xY0Gxt2nKv+hqoDyqKI0svzc5lYASaQvMXS9mya+Xl
   A8ZHBZB3vHCEYlkeOLnQQ/5MuRhuRfGMEyn0V/MzXcUx98S0ijKM/qmRD
   2wOzlPKnnqQKIenF3oTHibKMtzwEDrD7jklncQEJNIj75Ka6cJ5CHEnHP
   r81QaqjNHqQ5t29gHaz4pw3HBVpA3Gwv3mfdzrfPuUIHpO6nryB+rBcQj
   +USXutwttf9kfSSbFnQRd43NGZ9OEoshcq9abRu6B4/vudjfHMht0Ys+/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="16922257"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="16922257"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 00:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="809234430"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="809234430"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Dec 2023 00:12:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEPms-0001JI-2d;
	Sat, 16 Dec 2023 08:12:42 +0000
Date: Sat, 16 Dec 2023 16:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-zoned 62/62] fs/xfs/libxfs/xfs_zones.c:89
 xfs_zone_validate_seq() warn: set_bit() takes a bit number
Message-ID: <202312161602.S0bkstgx-lkp@intel.com>
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
config: x86_64-randconfig-161-20231216 (https://download.01.org/0day-ci/archive/20231216/202312161602.S0bkstgx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312161602.S0bkstgx-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_zones.c:89 xfs_zone_validate_seq() warn: set_bit() takes a bit number
fs/xfs/xfs_zone_alloc.c:86 xfs_zone_emptied() warn: set_bit() takes a bit number
fs/xfs/xfs_zone_alloc.c:674 xfs_zone_reset() warn: clear_bit() takes a bit number
fs/xfs/xfs_zone_alloc.c:883 xfs_zone_reclaim() warn: clear_bit() takes a bit number
fs/xfs/xfs_zone_alloc.c:914 xfs_zone_reclaim_pick() warn: test_and_set_bit() takes a bit number
fs/xfs/xfs_zone_alloc.c:920 xfs_zone_reclaim_pick() warn: clear_bit() takes a bit number

vim +89 fs/xfs/libxfs/xfs_zones.c

60b5c8af1e2403 Christoph Hellwig 2023-12-07   81  
60b5c8af1e2403 Christoph Hellwig 2023-12-07   82  static int
60b5c8af1e2403 Christoph Hellwig 2023-12-07   83  xfs_zone_validate_seq(
60b5c8af1e2403 Christoph Hellwig 2023-12-07   84  	struct blk_zone		*zone,
60b5c8af1e2403 Christoph Hellwig 2023-12-07   85  	struct xfs_rtgroup	*rtg)
60b5c8af1e2403 Christoph Hellwig 2023-12-07   86  {
60b5c8af1e2403 Christoph Hellwig 2023-12-07   87  	struct xfs_mount	*mp = rtg->rtg_mount;
60b5c8af1e2403 Christoph Hellwig 2023-12-07   88  
60b5c8af1e2403 Christoph Hellwig 2023-12-07  @89  	set_bit(RTG_F_SEQUENTIAL, &rtg->rtg_flags);
60b5c8af1e2403 Christoph Hellwig 2023-12-07   90  
60b5c8af1e2403 Christoph Hellwig 2023-12-07   91  	switch (zone->cond) {
60b5c8af1e2403 Christoph Hellwig 2023-12-07   92  	case BLK_ZONE_COND_EMPTY:
60b5c8af1e2403 Christoph Hellwig 2023-12-07   93  		return xfs_zone_validate_empty(zone, rtg);
60b5c8af1e2403 Christoph Hellwig 2023-12-07   94  	case BLK_ZONE_COND_IMP_OPEN:
60b5c8af1e2403 Christoph Hellwig 2023-12-07   95  	case BLK_ZONE_COND_EXP_OPEN:
60b5c8af1e2403 Christoph Hellwig 2023-12-07   96  	case BLK_ZONE_COND_CLOSED:
60b5c8af1e2403 Christoph Hellwig 2023-12-07   97  		return xfs_zone_validate_wp(zone, rtg);
60b5c8af1e2403 Christoph Hellwig 2023-12-07   98  	case BLK_ZONE_COND_FULL:
60b5c8af1e2403 Christoph Hellwig 2023-12-07   99  		return xfs_zone_validate_full(zone, rtg);
60b5c8af1e2403 Christoph Hellwig 2023-12-07  100  	case BLK_ZONE_COND_NOT_WP:
60b5c8af1e2403 Christoph Hellwig 2023-12-07  101  	case BLK_ZONE_COND_OFFLINE:
60b5c8af1e2403 Christoph Hellwig 2023-12-07  102  	case BLK_ZONE_COND_READONLY:
60b5c8af1e2403 Christoph Hellwig 2023-12-07  103  		xfs_warn(mp, "zone %d has unsupported zone condition 0x%x.",
60b5c8af1e2403 Christoph Hellwig 2023-12-07  104  			rtg->rtg_rgno, zone->cond);
60b5c8af1e2403 Christoph Hellwig 2023-12-07  105  		return -EIO;
60b5c8af1e2403 Christoph Hellwig 2023-12-07  106  	default:
60b5c8af1e2403 Christoph Hellwig 2023-12-07  107  		xfs_warn(mp, "zone %d has unknown zone condition 0x%x.",
60b5c8af1e2403 Christoph Hellwig 2023-12-07  108  			rtg->rtg_rgno, zone->cond);
60b5c8af1e2403 Christoph Hellwig 2023-12-07  109  		return -EIO;
60b5c8af1e2403 Christoph Hellwig 2023-12-07  110  	}
60b5c8af1e2403 Christoph Hellwig 2023-12-07  111  }
60b5c8af1e2403 Christoph Hellwig 2023-12-07  112  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
