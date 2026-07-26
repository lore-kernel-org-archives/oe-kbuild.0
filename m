Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11902D322E
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jul 2026 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785078781; cv=none; b=dHJzvb9UmzpPZlvKFnIVJVFxIDQMbsy+OswE9WR1iDxriYLhg04QnDVBSi0kTey1ojk3uF1R0sSPDY6ihlRHbIb5Xwey0JfsCjy1diUxDP+76J2OFs459c2WCp/1/RKNmDnqrVy5xBbKSlM3HKqeHHoh/FpP0DZMmFlnQm7JYXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785078781; c=relaxed/simple;
	bh=9hYUN0R6KdvPF8lKDIVaXDxSuL3Vb1QE1Chx6AcQLsg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O1ACtc3iHMMCcF+amvyUJaK0TVhbSTNVpNM+wanzqFZz7U1K30+dUomIIuWjEmPzm7RDF2C6k1neHRrOfcSTmHJKLJXYJxQKytU+eljxvXBlWca1QD1H/eHPQwxOklm9xe6cK4VEcuNLhBxS6299w+ZoBEyScZKywxFSBe1PVZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPaJ9VFV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPaJ9VFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785078779; x=1816614779;
  h=date:from:to:cc:subject:message-id;
  bh=9hYUN0R6KdvPF8lKDIVaXDxSuL3Vb1QE1Chx6AcQLsg=;
  b=CPaJ9VFV6kWYWqtseSWKWPKz1MViVr1UJPXPk1b0XGdQKp4eYKpZb77f
   2RPcXhOc1NXpUzQ5uyGBqQcj9sPttUC1C3+OPxizoyDqUxXeXvtNwywXq
   XRkvzVVmtK+8R1BOriIKM2jxwQqeIjYJNBvQKw2nWigwfWWs6C1uWynGp
   BldhEcfxhUa1GvDb//wLb6Tmx8YdxJTs7iK6EKoM+OSDqkO5Xr+eGE8Fg
   +0Lz1RDjJS8Cp7cIDvwNB+TJkgkCM9t0ZKJJ1dV49s7F4g3qb7Y0lRum3
   GooLyTGa27aWyL3eeIGbSqRBpzk7wf0YSqagBt6G6DFAwkoSs+sJtTv6i
   A==;
X-CSE-ConnectionGUID: wqeqKnZYTgaLKeFd/udPoA==
X-CSE-MsgGUID: EBismgkiTYaxdCmw37kJ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="97178786"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="97178786"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 08:12:58 -0700
X-CSE-ConnectionGUID: wh3dhrV4Tj+yw5Ui0yzYkQ==
X-CSE-MsgGUID: bNJGyNukTtCAIvVLugECpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="262959245"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Jul 2026 08:12:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wo0X8-00000000cZi-3fvs;
	Sun, 26 Jul 2026 15:12:54 +0000
Date: Sun, 26 Jul 2026 23:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-crc 53/59] fs/xfs/xfs_ioend.c:251
 xfs_ioend_submit_read_sync() warn: bitwise AND condition is false here
Message-ID: <202607262359.FSzERVHp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   10c7aa6f2c85085eec34737be592d6ae69583782
commit: dc5c730a1638c980c34768ffb41f195071d7e662 [53/59] xfs: add support for writing with data checksums
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-r073-20260726 (https://download.01.org/0day-ci/archive/20260726/202607262359.FSzERVHp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607262359.FSzERVHp-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_ioend.c:251 xfs_ioend_submit_read_sync() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/xfs_ioend.c:99 xfs_dio_bounce_end_io() warn: bitwise AND condition is false here
fs/xfs/xfs_ioend.c:111 xfs_bounce_submit_ioend() warn: bitwise AND condition is false here
fs/xfs/xfs_ioend.c:144 xfs_read_bounce_and_resubmit() warn: bitwise AND condition is false here
fs/xfs/xfs_ioend.c:175 xfs_end_io_read() warn: bitwise AND condition is false here
fs/xfs/xfs_ioend.c:227 xfs_ioend_submit_read() warn: bitwise AND condition is false here

vim +251 fs/xfs/xfs_ioend.c

d27e81cfb6f345 Christoph Hellwig 2026-07-17  233  
dc5c730a1638c9 Christoph Hellwig 2026-07-19  234  int
dc5c730a1638c9 Christoph Hellwig 2026-07-19  235  xfs_ioend_submit_read_sync(
dc5c730a1638c9 Christoph Hellwig 2026-07-19  236  	struct bio		*bio,
dc5c730a1638c9 Christoph Hellwig 2026-07-19  237  	struct inode		*inode,
dc5c730a1638c9 Christoph Hellwig 2026-07-19  238  	loff_t			file_offset,
dc5c730a1638c9 Christoph Hellwig 2026-07-19  239  	u16			ioend_flags)
dc5c730a1638c9 Christoph Hellwig 2026-07-19  240  {
dc5c730a1638c9 Christoph Hellwig 2026-07-19  241  	struct xfs_inode	*ip = XFS_I(inode);
dc5c730a1638c9 Christoph Hellwig 2026-07-19  242  	struct iomap_ioend	*ioend;
dc5c730a1638c9 Christoph Hellwig 2026-07-19  243  	struct bvec_iter	saved_iter;
dc5c730a1638c9 Christoph Hellwig 2026-07-19  244  	int			error;
dc5c730a1638c9 Christoph Hellwig 2026-07-19  245  
dc5c730a1638c9 Christoph Hellwig 2026-07-19  246  	ASSERT(!(ioend_flags & IOMAP_IOEND_DIRECT));
dc5c730a1638c9 Christoph Hellwig 2026-07-19  247  
dc5c730a1638c9 Christoph Hellwig 2026-07-19  248  	ioend = iomap_init_ioend(inode, bio, file_offset, ioend_flags);
dc5c730a1638c9 Christoph Hellwig 2026-07-19  249  	if (xfs_is_rtcsum_inode(ip) && !xfs_rtcsum_prepare_read(ioend))
dc5c730a1638c9 Christoph Hellwig 2026-07-19  250  		return blk_status_to_errno(bio->bi_status);
dc5c730a1638c9 Christoph Hellwig 2026-07-19 @251  	if (ioend_flags & IOMAP_IOEND_INTEGRITY)
dc5c730a1638c9 Christoph Hellwig 2026-07-19  252  		fs_bio_integrity_alloc(bio);
dc5c730a1638c9 Christoph Hellwig 2026-07-19  253  	error = submit_bio_wait(bio);
dc5c730a1638c9 Christoph Hellwig 2026-07-19  254  	if (bio_integrity(bio)) {
dc5c730a1638c9 Christoph Hellwig 2026-07-19  255  		if (!error)
dc5c730a1638c9 Christoph Hellwig 2026-07-19  256  			error = fs_bio_integrity_verify(bio, &saved_iter);
dc5c730a1638c9 Christoph Hellwig 2026-07-19  257  		fs_bio_integrity_free(bio);
dc5c730a1638c9 Christoph Hellwig 2026-07-19  258  	}
dc5c730a1638c9 Christoph Hellwig 2026-07-19  259  	if (xfs_is_rtcsum_inode(ip))
dc5c730a1638c9 Christoph Hellwig 2026-07-19  260  		error = xfs_rtcsum_verify_ioend(ioend, error);
dc5c730a1638c9 Christoph Hellwig 2026-07-19  261  	return error;
dc5c730a1638c9 Christoph Hellwig 2026-07-19  262  }
dc5c730a1638c9 Christoph Hellwig 2026-07-19  263  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
