Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5823A75A7
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 23:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332711; cv=none; b=Px4iVYXWIyPq6nSOUZlrNsomhbfL6ov01O+tLu1+WC1UXLx25oSi8Rn1CeD5iC6cbabhoZf/pJnjUQAdEabV8ThEWnv75mkXB2G4HAz7hOm/lQKy9LE+iUr0XXMaEKKgNBqgmRJ0gSJZZQNZIPgWLijzFvNPY6P31uTmOSbpU0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332711; c=relaxed/simple;
	bh=AJWpR8+pyZamVlNn7NuiQZX3hPI6Y3Skm8QYA+oxEDQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kl3O1GgfpQ+Ak1UHgfmpYBddAw3wWjr50ux1ul5kcR/qxX/eBPTx1pY+PMaMF4bsCOkRoQT5DL8V1KfVbamNjU07IwitZg2c2U47zSmToJLWXp+a4+nkz822RYEnNPiwiSTiwb5EJGVadeeR0CU04L5enefFYisQupsrmrjy3Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPSbK+BK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPSbK+BK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784332711; x=1815868711;
  h=date:from:to:cc:subject:message-id;
  bh=AJWpR8+pyZamVlNn7NuiQZX3hPI6Y3Skm8QYA+oxEDQ=;
  b=nPSbK+BKHq7u1rz3JvfQd0Gq5LtPP3dqeUcB1xa3AyYpXn+iquYl30dj
   kgpPRoRZxh0+9ScEreRxpvvVhcHWB0bmk0F3kGL7fA/lqJunrapqvz1nN
   X/lr0LVi4ZtCq2MWPf5p1SBA5uq+05cMO6gaMTrjBINCDgnWoGIvCDt0T
   7F3obFXrcJX7gsgP42syLcIMUanrqrhQNS3smxqVuAPocB6BcTh1Nv8oC
   K5+npk9Kx+LLVOf4iNLr8/gy+HTqw9fK70H2LwMG1/jgTcCRCDsADQt2c
   FgYniDxM8gLb7wSwWwR4bkZZPysl9xh1fGieKmpd5aa5J4WySJhRbYxUy
   A==;
X-CSE-ConnectionGUID: d4f91iGmRLOQFzUsJfDm3A==
X-CSE-MsgGUID: KgFyqXcWT0qDyb4hu+jKMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="102430160"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="102430160"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 16:58:30 -0700
X-CSE-ConnectionGUID: MI9S51KRS0m7290409AmnA==
X-CSE-MsgGUID: h8g4Gvs1Q6ibWD1k7BizdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="255141605"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Jul 2026 16:58:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wksRj-00000000TGW-2mSA;
	Fri, 17 Jul 2026 23:58:24 +0000
Date: Sat, 18 Jul 2026 07:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-crc 8/51] fs/iomap/direct-io.c:83
 iomap_dio_submit_bio() warn: bitwise AND condition is false here
Message-ID: <202607180708.CRDdnKsC-lkp@intel.com>
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
head:   ef3d55d014b3a800421b9dae3ac182577bfe2bd7
commit: 10ed5659b441417bfaebb7d80c6cbcb7b9e5d0a3 [8/51] iomap: move T10 PI handling for direct I/O into ->submit_io
:::::: branch date: 8 hours ago
:::::: commit date: 10 hours ago
config: nios2-randconfig-r071-20260718 (https://download.01.org/0day-ci/archive/20260718/202607180708.CRDdnKsC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607180708.CRDdnKsC-lkp@intel.com/

New smatch warnings:
fs/iomap/direct-io.c:83 iomap_dio_submit_bio() warn: bitwise AND condition is false here
fs/xfs/xfs_file.c:729 xfs_dio_zoned_submit_io() warn: bitwise AND condition is false here

Old smatch warnings:
fs/iomap/internal.h:15 iomap_max_bio_size() warn: bitwise AND condition is false here
fs/xfs/xfs_file.c:239 xfs_dio_read_bounce_submit_io() warn: bitwise AND condition is false here

vim +83 fs/iomap/direct-io.c

908c54909ae72d Christoph Hellwig 2022-05-05  62  
a6d3d49587d10d Christoph Hellwig 2021-08-10  63  static void iomap_dio_submit_bio(const struct iomap_iter *iter,
a6d3d49587d10d Christoph Hellwig 2021-08-10  64  		struct iomap_dio *dio, struct bio *bio, loff_t pos)
db074436f42196 Darrick J. Wong   2019-07-15  65  {
daa99c5a3319e3 Jens Axboe        2023-07-20  66  	struct kiocb *iocb = dio->iocb;
daa99c5a3319e3 Jens Axboe        2023-07-20  67  
db074436f42196 Darrick J. Wong   2019-07-15  68  	atomic_inc(&dio->ref);
db074436f42196 Darrick J. Wong   2019-07-15  69  
9650b453a3d4b1 Ming Lei          2022-04-20  70  	/* Sync dio can't be polled reliably */
daa99c5a3319e3 Jens Axboe        2023-07-20  71  	if ((iocb->ki_flags & IOCB_HIPRI) && !is_sync_kiocb(iocb)) {
47f28b493daf90 Christoph Hellwig 2026-05-18  72  		bio->bi_opf |= REQ_POLLED;
daa99c5a3319e3 Jens Axboe        2023-07-20  73  		WRITE_ONCE(iocb->private, bio);
3e08773c3841e9 Christoph Hellwig 2021-10-12  74  	}
db074436f42196 Darrick J. Wong   2019-07-15  75  
034c29fb3e7c11 Christoph Hellwig 2025-02-06  76  	if (dio->dops && dio->dops->submit_io) {
3e08773c3841e9 Christoph Hellwig 2021-10-12  77  		dio->dops->submit_io(iter, bio, pos);
10ed5659b44141 Christoph Hellwig 2026-07-07  78  		return;
10ed5659b44141 Christoph Hellwig 2026-07-07  79  	}
10ed5659b44141 Christoph Hellwig 2026-07-07  80  
034c29fb3e7c11 Christoph Hellwig 2025-02-06  81  	WARN_ON_ONCE(iter->iomap.flags & IOMAP_F_ANON_WRITE);
10ed5659b44141 Christoph Hellwig 2026-07-07  82  
10ed5659b44141 Christoph Hellwig 2026-07-07 @83  	if (iter->iomap.flags & IOMAP_F_INTEGRITY) {
10ed5659b44141 Christoph Hellwig 2026-07-07  84  		if (dio->flags & IOMAP_DIO_WRITE)
10ed5659b44141 Christoph Hellwig 2026-07-07  85  			fs_bio_integrity_generate(bio);
10ed5659b44141 Christoph Hellwig 2026-07-07  86  		else
10ed5659b44141 Christoph Hellwig 2026-07-07  87  			fs_bio_integrity_alloc(bio);
db074436f42196 Darrick J. Wong   2019-07-15  88  	}
10ed5659b44141 Christoph Hellwig 2026-07-07  89  
10ed5659b44141 Christoph Hellwig 2026-07-07  90  	blk_crypto_submit_bio(bio);
034c29fb3e7c11 Christoph Hellwig 2025-02-06  91  }
db074436f42196 Darrick J. Wong   2019-07-15  92  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
