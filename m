Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0051EE01A
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jul 2026 04:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785039054; cv=none; b=i4/R3/dgjCD4Fi2S4Q3nedlcRnUyQbquQe8Ny2Ba/K3/FBhPnDXFAfCkQGxLzl9zqWzFr+rmmDa3DPXMzvE5TWrsXNHoSh8yqo4yN4UuQhX1QD54LEui023IRV8abpBWZGdUnYfoRsLQVMYWy2mby+3EZfReJgY3Cb9ls8rHDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785039054; c=relaxed/simple;
	bh=tD7RqfC2FajUxvdQhRSHLPNqrXIir6WaKYNcrTt7qAM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DfQgeUNUW0UejKppmsXvXkfBLAG7Hdgbf4a/Fb8cwayGVOrivdJzfjbTqij5OCh6DYpMyRzy2A2tjHhvNikPkj5jw+1YZ6oE6vfjpH9tHjD6LqKbKjePZRw7sI2Iff3H37AXYBeM2dk3iEZlqOfALWAc+QxKx6wCB2ZYhHOrXS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEp5gK5o; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEp5gK5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785039052; x=1816575052;
  h=date:from:to:cc:subject:message-id;
  bh=tD7RqfC2FajUxvdQhRSHLPNqrXIir6WaKYNcrTt7qAM=;
  b=kEp5gK5oh3mYYTuQ1ZOxF18HrJ0NFXnCszZS9T8hZ+eHJgMKMqC4kaDZ
   9fGGPqvTTEXIRD6AjQHY7r8wBr/FnbhVjWDW8EKwLHAHhZNrDwXwM0yxW
   /dbu0LAOhrwZ5mORjvv+jMmRcd5JywetLetrrU3/LEny8hdC2vucuHjEE
   zrXB33p/d3hQlL1RJl1t8DtrLAAENK3JgCRvrB0IeeRBQWNXhlVp2Jc5W
   ZedHypYIwz4fsqmNcxaLGkCcYBORfeibcwn6zjAYJce/FfkXn/x+xvdzK
   AfsT4/SddWXXvd3a9bHwhWlcY4ysL1imksbwBIjIb7uwUXdu9tGE6C1FO
   Q==;
X-CSE-ConnectionGUID: RQSDIl4pT6CRQJ5X5eU5QA==
X-CSE-MsgGUID: F2n4SmtVQkWCBUhk+R+16A==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="89538279"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="89538279"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 21:10:51 -0700
X-CSE-ConnectionGUID: /wEyXSLbSNChLTxplVhKAQ==
X-CSE-MsgGUID: NJ6OFrfeR1uZIeqmnRvG1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="262855747"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Jul 2026 21:10:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnqCJ-00000000cGt-3TC2;
	Sun, 26 Jul 2026 04:10:45 +0000
Date: Sun, 26 Jul 2026 12:09:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-crc 21/59] fs/xfs/xfs_ioend.c:37
 xfs_dio_bounce_end_io() warn: bitwise AND condition is false here
Message-ID: <202607261202.R7ZsIBaJ-lkp@intel.com>
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
commit: 763c79ce5f43500edfe848e62f5cfffc4329e5b9 [21/59] xfs: add support for lazy direct read bounce buffering
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20260725 (https://download.01.org/0day-ci/archive/20260726/202607261202.R7ZsIBaJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607261202.R7ZsIBaJ-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_ioend.c:37 xfs_dio_bounce_end_io() warn: bitwise AND condition is false here
fs/xfs/xfs_ioend.c:46 xfs_bounce_submit_ioend() warn: bitwise AND condition is false here
fs/xfs/xfs_ioend.c:67 xfs_read_bounce_and_resubmit() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/xfs_ioend.c:97 xfs_end_io_read() warn: bitwise AND condition is false here
fs/xfs/xfs_ioend.c:135 xfs_ioend_submit_read() warn: bitwise AND condition is false here

vim +37 fs/xfs/xfs_ioend.c

763c79ce5f4350 Christoph Hellwig 2026-07-22  28  
763c79ce5f4350 Christoph Hellwig 2026-07-22  29  static void
763c79ce5f4350 Christoph Hellwig 2026-07-22  30  xfs_dio_bounce_end_io(
763c79ce5f4350 Christoph Hellwig 2026-07-22  31  	struct bio		*bio)
763c79ce5f4350 Christoph Hellwig 2026-07-22  32  {
763c79ce5f4350 Christoph Hellwig 2026-07-22  33  	struct iomap_ioend	*ioend = iomap_ioend_from_bio(bio);
763c79ce5f4350 Christoph Hellwig 2026-07-22  34  	int			error = blk_status_to_errno(bio->bi_status);
763c79ce5f4350 Christoph Hellwig 2026-07-22  35  	struct bio		*orig_bio = bio->bi_private;
763c79ce5f4350 Christoph Hellwig 2026-07-22  36  
763c79ce5f4350 Christoph Hellwig 2026-07-22 @37  	if ((ioend->io_flags & IOMAP_IOEND_INTEGRITY) && !bio->bi_status)
763c79ce5f4350 Christoph Hellwig 2026-07-22  38  		error = iomap_ioend_integrity_verify(ioend);
763c79ce5f4350 Christoph Hellwig 2026-07-22  39  	iomap_bounce_read_end_io(ioend, orig_bio, error);
763c79ce5f4350 Christoph Hellwig 2026-07-22  40  }
763c79ce5f4350 Christoph Hellwig 2026-07-22  41  
763c79ce5f4350 Christoph Hellwig 2026-07-22  42  static void
763c79ce5f4350 Christoph Hellwig 2026-07-22  43  xfs_bounce_submit_ioend(
763c79ce5f4350 Christoph Hellwig 2026-07-22  44  	struct iomap_ioend	*ioend)
763c79ce5f4350 Christoph Hellwig 2026-07-22  45  {
763c79ce5f4350 Christoph Hellwig 2026-07-22 @46  	if (ioend->io_flags & IOMAP_IOEND_INTEGRITY)
763c79ce5f4350 Christoph Hellwig 2026-07-22  47  		fs_bio_integrity_alloc(&ioend->io_bio);
763c79ce5f4350 Christoph Hellwig 2026-07-22  48  	ioend->io_bio.bi_end_io = xfs_dio_bounce_end_io;
763c79ce5f4350 Christoph Hellwig 2026-07-22  49  	bio_set_flag(&ioend->io_bio, BIO_COMPLETE_IN_TASK);
763c79ce5f4350 Christoph Hellwig 2026-07-22  50  	submit_bio(&ioend->io_bio);
763c79ce5f4350 Christoph Hellwig 2026-07-22  51  }
763c79ce5f4350 Christoph Hellwig 2026-07-22  52  
763c79ce5f4350 Christoph Hellwig 2026-07-22  53  static void
763c79ce5f4350 Christoph Hellwig 2026-07-22  54  xfs_read_bounce_and_resubmit(
763c79ce5f4350 Christoph Hellwig 2026-07-22  55  	struct iomap_ioend	*ioend)
763c79ce5f4350 Christoph Hellwig 2026-07-22  56  {
763c79ce5f4350 Christoph Hellwig 2026-07-22  57  	struct bio		*bio = &ioend->io_bio;
763c79ce5f4350 Christoph Hellwig 2026-07-22  58  
763c79ce5f4350 Christoph Hellwig 2026-07-22  59  	trace_xfs_bounce_reread(XFS_I(ioend->io_inode), ioend->io_offset,
763c79ce5f4350 Christoph Hellwig 2026-07-22  60  			ioend->io_size);
763c79ce5f4350 Christoph Hellwig 2026-07-22  61  
763c79ce5f4350 Christoph Hellwig 2026-07-22  62  	/*
763c79ce5f4350 Christoph Hellwig 2026-07-22  63  	 * Free the bio integrity data for the original bio, as we'll allocate
763c79ce5f4350 Christoph Hellwig 2026-07-22  64  	 * ons for each sub-I/O, which could deadlock if we keep the original
763c79ce5f4350 Christoph Hellwig 2026-07-22  65  	 * one around.
763c79ce5f4350 Christoph Hellwig 2026-07-22  66  	 */
763c79ce5f4350 Christoph Hellwig 2026-07-22 @67  	if (ioend->io_flags & IOMAP_IOEND_INTEGRITY)
763c79ce5f4350 Christoph Hellwig 2026-07-22  68  		fs_bio_integrity_free(bio);
763c79ce5f4350 Christoph Hellwig 2026-07-22  69  
763c79ce5f4350 Christoph Hellwig 2026-07-22  70  	/*
763c79ce5f4350 Christoph Hellwig 2026-07-22  71  	 * Reset the remaining count, iter and bdev as we submit the bio to the
763c79ce5f4350 Christoph Hellwig 2026-07-22  72  	 * block layer again and we need a clean slate.  Switch to and end_io
763c79ce5f4350 Christoph Hellwig 2026-07-22  73  	 * handler that simply complets the ioend, as all the verification is
763c79ce5f4350 Christoph Hellwig 2026-07-22  74  	 * done by the end_I/O handlers for the clone bio(s).
763c79ce5f4350 Christoph Hellwig 2026-07-22  75  	 */
763c79ce5f4350 Christoph Hellwig 2026-07-22  76  	atomic_set(&bio->__bi_remaining, 1);
763c79ce5f4350 Christoph Hellwig 2026-07-22  77  	bio->bi_iter = (struct bvec_iter) {
763c79ce5f4350 Christoph Hellwig 2026-07-22  78  		.bi_sector	= ioend->io_sector,
763c79ce5f4350 Christoph Hellwig 2026-07-22  79  		.bi_size	= ioend->io_size,
763c79ce5f4350 Christoph Hellwig 2026-07-22  80  		.bi_bvec_done	= ioend->io_bvec_offset,
763c79ce5f4350 Christoph Hellwig 2026-07-22  81  	};
763c79ce5f4350 Christoph Hellwig 2026-07-22  82  	bio->bi_bdev = xfs_inode_buftarg(XFS_I(ioend->io_inode))->bt_bdev;
763c79ce5f4350 Christoph Hellwig 2026-07-22  83  	bio->bi_end_io = xfs_end_bio_bounced;
763c79ce5f4350 Christoph Hellwig 2026-07-22  84  	iomap_bounce_read(ioend, bdev_logical_block_size(bio->bi_bdev),
763c79ce5f4350 Christoph Hellwig 2026-07-22  85  			xfs_bounce_submit_ioend);
763c79ce5f4350 Christoph Hellwig 2026-07-22  86  }
763c79ce5f4350 Christoph Hellwig 2026-07-22  87  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
