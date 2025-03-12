Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B0D22098
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Mar 2025 04:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741754412; cv=none; b=NJfH8L2rorMHJ39fA9PdCgqtQCEukbxagGh6fnBEOh+Wdi5ELaMT2KWu62Qh81WBddEl06MsIGQl9ZXZKpImmK9gYv/7+d2v1QN2bUjnn69ULwd8BHDooUEtWj3LunWEpyM2fWRCL46dm0ojW42rx25c1eYISjymWpm44MTabAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741754412; c=relaxed/simple;
	bh=Yz9iYUcNknpyj82Svr1SoljEA8wig22LOhpS11q/QGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LCb0GTbqbgleO/OiPXs5L7PUWb/pyCINSfzJ1zJ6etKE/rJOhC2lfkh0haXaApTQCkxGqGiIhm+f9oN98uvrby6ly6mTzBYYQxfM6UqzrJVzOvAmv6cGl+mKUOWmLROgUMSGLeIHs1bqFRn5O/lwMs+EpG0fNH5GJ3qcLmMR2ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAKn69Te; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAKn69Te"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741754411; x=1773290411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yz9iYUcNknpyj82Svr1SoljEA8wig22LOhpS11q/QGM=;
  b=oAKn69TerjCCZZiKUL9AEywYgwKE9o76gghyF0qO5ebjYrLjlL6BClZD
   pZbgVtUBLN6+xAHMoNwhpn2HmIaF2ELmnECGLvRb7kOkbYukrLnM4Dxml
   hxybNrgZ2aGqnxC/gSB34TABFg+aaAhLYTfIDOQX7x2bS5LgqXLhYd+s0
   mogsnVfOynCsVaQOLhv//8WtxX16SiGTZwc4qdj5YcUmzxazJpnF3YAvI
   4eNPtHwbmubIxQdtCGx502cKYQrKkYk0kD9TDtCKge4MF0F27zB9bdqb5
   n4n1PIW53Cu56GZZ1qj4MaoVF3OcHhl2t0+jR1ES11HNnfS2WEXYYlKa6
   A==;
X-CSE-ConnectionGUID: p0Xk7UykSAadddihScfOew==
X-CSE-MsgGUID: 1mV4TFHyRPasor+UdpJWPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="68180255"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="68180255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 21:40:10 -0700
X-CSE-ConnectionGUID: 2OhgyMv3RyiaVeFIRhfUtw==
X-CSE-MsgGUID: xpssYNUfSe+O0qQ5ILHZVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="120218509"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 11 Mar 2025 21:40:08 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsDt0-000888-0J;
	Wed, 12 Mar 2025 04:40:06 +0000
Date: Wed, 12 Mar 2025 12:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-desktop 2/2] block/blk.h:384
 bio_may_need_split() error: we previously assumed 'bio->bi_io_vec' could be
 null (see line 380)
Message-ID: <202503121218.nIVFm9BF-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   501e3c4dad2caa7d89416bbca980b0b803316a2e
commit: a5436580a9a3aa688ca53f9b1e13e3eae84410f9 [2/2] ANDROID: block: Add support for filesystem requests and small segments
:::::: branch date: 6 hours ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-141-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121218.nIVFm9BF-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503121218.nIVFm9BF-lkp@intel.com/

New smatch warnings:
block/blk.h:384 bio_may_need_split() error: we previously assumed 'bio->bi_io_vec' could be null (see line 380)
block/blk.h:384 bio_may_need_split() error: we previously assumed 'bio->bi_io_vec' could be null (see line 380)

Old smatch warnings:
block/blk-mq.c:395 blk_mq_wake_waiters() warn: iterator 'i' not incremented
block/blk-mq.c:1746 blk_mq_timeout_work() warn: iterator 'i' not incremented
block/blk-mq.c:2386 blk_mq_run_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2414 blk_mq_delay_run_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2468 blk_mq_stop_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2486 blk_mq_start_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2512 blk_mq_start_stopped_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:3823 blk_mq_add_hw_queues_cpuhp() warn: iterator 'i' not incremented
block/blk-mq.c:3889 blk_mq_exit_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:4207 queue_set_hctx_shared() warn: iterator 'i' not incremented
block/blk-mq.c:4307 blk_mq_release() warn: iterator 'i' not incremented
block/blk-mq.c:4878 blk_mq_update_nr_requests() warn: iterator 'i' not incremented
block/blk-mq.c:5146 blk_mq_cancel_work_sync() warn: iterator 'i' not incremented

vim +384 block/blk.h

83d016ac86428db Bart Van Assche   2018-01-17  349  
3ad5cee5cd000dc Christoph Hellwig 2020-03-24  350  ssize_t part_size_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000dc Christoph Hellwig 2020-03-24  351  		char *buf);
3ad5cee5cd000dc Christoph Hellwig 2020-03-24  352  ssize_t part_stat_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000dc Christoph Hellwig 2020-03-24  353  		char *buf);
3ad5cee5cd000dc Christoph Hellwig 2020-03-24  354  ssize_t part_inflight_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000dc Christoph Hellwig 2020-03-24  355  		char *buf);
3ad5cee5cd000dc Christoph Hellwig 2020-03-24  356  ssize_t part_fail_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000dc Christoph Hellwig 2020-03-24  357  		char *buf);
3ad5cee5cd000dc Christoph Hellwig 2020-03-24  358  ssize_t part_fail_store(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000dc Christoph Hellwig 2020-03-24  359  		const char *buf, size_t count);
581d4e28d9195aa Jens Axboe        2008-09-14  360  ssize_t part_timeout_show(struct device *, struct device_attribute *, char *);
581d4e28d9195aa Jens Axboe        2008-09-14  361  ssize_t part_timeout_store(struct device *, struct device_attribute *,
581d4e28d9195aa Jens Axboe        2008-09-14  362  				const char *, size_t);
581d4e28d9195aa Jens Axboe        2008-09-14  363  
b35243a447b9fe6 Christoph Hellwig 2024-08-26  364  struct bio *bio_split_discard(struct bio *bio, const struct queue_limits *lim,
b35243a447b9fe6 Christoph Hellwig 2024-08-26  365  		unsigned *nsegs);
b35243a447b9fe6 Christoph Hellwig 2024-08-26  366  struct bio *bio_split_write_zeroes(struct bio *bio,
b35243a447b9fe6 Christoph Hellwig 2024-08-26  367  		const struct queue_limits *lim, unsigned *nsegs);
b35243a447b9fe6 Christoph Hellwig 2024-08-26  368  struct bio *bio_split_rw(struct bio *bio, const struct queue_limits *lim,
b35243a447b9fe6 Christoph Hellwig 2024-08-26  369  		unsigned *nr_segs);
1e8a7f6af926e26 Christoph Hellwig 2024-08-26  370  struct bio *bio_split_zone_append(struct bio *bio,
1e8a7f6af926e26 Christoph Hellwig 2024-08-26  371  		const struct queue_limits *lim, unsigned *nr_segs);
b35243a447b9fe6 Christoph Hellwig 2024-08-26  372  
b35243a447b9fe6 Christoph Hellwig 2024-08-26  373  static inline bool bio_may_need_split(struct bio *bio,
aa261f20589d894 Bart Van Assche   2022-10-25  374  		const struct queue_limits *lim)
b35243a447b9fe6 Christoph Hellwig 2024-08-26  375  {
a5436580a9a3aa6 Sandeep Dhavale   2025-01-22  376  	/*
a5436580a9a3aa6 Sandeep Dhavale   2025-01-22  377  	 * Check whether bio splitting should be performed. This check may
a5436580a9a3aa6 Sandeep Dhavale   2025-01-22  378  	 * trigger the bio splitting code even if splitting is not necessary.
a5436580a9a3aa6 Sandeep Dhavale   2025-01-22  379  	 */
a5436580a9a3aa6 Sandeep Dhavale   2025-01-22 @380  	if (blk_queue_sub_page_limits(lim) && bio->bi_io_vec &&
a5436580a9a3aa6 Sandeep Dhavale   2025-01-22  381  	    bio->bi_io_vec->bv_len > lim->max_segment_size)
a5436580a9a3aa6 Sandeep Dhavale   2025-01-22  382  		return true;
b35243a447b9fe6 Christoph Hellwig 2024-08-26  383  	return lim->chunk_sectors || bio->bi_vcnt != 1 ||
b35243a447b9fe6 Christoph Hellwig 2024-08-26 @384  		bio->bi_io_vec->bv_len + bio->bi_io_vec->bv_offset > PAGE_SIZE;
b35243a447b9fe6 Christoph Hellwig 2024-08-26  385  }
b35243a447b9fe6 Christoph Hellwig 2024-08-26  386  

:::::: The code at line 384 was first introduced by commit
:::::: b35243a447b9fe6457fa8e1352152b818436ba5a block: rework bio splitting

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
