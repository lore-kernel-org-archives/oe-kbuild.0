Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315291A2632
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Mar 2025 16:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743005723; cv=none; b=Ph/HdwWTNssNmG5tVNGPfwliKkCLuc1efwRwYGJjWyDfAtv1sYjQS2gSwTkL+2j63x4iRXtpufKLj4yqt3351iZrTYAvIeJGmXs8sUkSKd/8Dkpso07ZTsEvfDZMVqfpJ0737eB+sZ0BMXWRXXexKpAcE8tAJ637u5Ehg4enpcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743005723; c=relaxed/simple;
	bh=pYN5y1Ons0FIAhNeqIyFANJVw6u6DSWYmeSAwmarhRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9FK1WbNkO5eJGOwu2/vHyoN+1Y9Pst1SwuT97/6H7L4szqtVYbpIOXzuNZ6uPjFGvpmmRLvs8o+FQzL/j73vVfWTBjKUxGelGWBbUXcs6PlSVbAZUwoNj+X949ZtYocKDEAKj5cSWTKKrC+LOHKuhC7LMvhU8Bagu0MW8XcrTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMUJxUh8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMUJxUh8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743005721; x=1774541721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pYN5y1Ons0FIAhNeqIyFANJVw6u6DSWYmeSAwmarhRs=;
  b=aMUJxUh8ykRO3q39i4IBM0CXbtDkTMV25hAdaCIs2dkf12SZ55A0TkQ9
   pQI+5SGgA8BZPaaadyEpoFybedtIthDcKJQ0bJ/u4CBHW2ZWCRg5ETUAM
   qbP+JBPDJTcU95nqswZyTySs3e+cNXNhqo1SmbR2L5xO1/iJ9jez4desF
   J5NRuUSP49xsE4uxn/Dyp3S7YLUNifFgjXx6OkG6t44i9zpim3NbQvY7x
   wUesTNnv0UsBBs9mCdrfpF9L7MJ9zbbiVV/CZ5zE0XddYsQnYNdZz3kVN
   lbWumZBX5pZNkW3ZlhyfDeXFOaRZLzfYJXmJt+d4vth1k9+PSpOv3H1Vx
   w==;
X-CSE-ConnectionGUID: FtofhUC/TdGJ5LFZgREdKw==
X-CSE-MsgGUID: eFGVGvpjTa6Ic+rosqYrKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44488135"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="44488135"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 09:15:20 -0700
X-CSE-ConnectionGUID: 7UI46RjCSTKgXO9HGw4lMg==
X-CSE-MsgGUID: OydvtFWpT1+RwvJYzSFlfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="125283802"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Mar 2025 09:15:19 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txTPR-0005tH-0Z;
	Wed, 26 Mar 2025 16:15:17 +0000
Date: Thu, 27 Mar 2025 00:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6-2024-08 1/1] block/blk.h:344
 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could
 be null (see line 340)
Message-ID: <202503270042.R3T4gfcV-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-08
head:   6cac4b51c05c3b8cdcdb4e528275353a0a99fce1
commit: e2bd6241b810c128e5fcc8ed4cd6fa281c0f00b4 [1/1] ANDROID: block: Add support for filesystem requests and small segments
:::::: branch date: 30 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20250326 (https://download.01.org/0day-ci/archive/20250327/202503270042.R3T4gfcV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503270042.R3T4gfcV-lkp@intel.com/

New smatch warnings:
block/blk.h:344 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could be null (see line 340)
block/blk.h:344 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could be null (see line 340)

Old smatch warnings:
block/blk-mq.c:309 blk_mq_wake_waiters() warn: iterator 'i' not incremented
block/blk-mq.c:1684 blk_mq_timeout_work() warn: iterator 'i' not incremented
block/blk-mq.c:2332 blk_mq_run_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2360 blk_mq_delay_run_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2414 blk_mq_stop_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2432 blk_mq_start_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2452 blk_mq_start_stopped_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:3670 blk_mq_exit_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:3975 queue_set_hctx_shared() warn: iterator 'i' not incremented
block/blk-mq.c:4075 blk_mq_release() warn: iterator 'i' not incremented
block/blk-mq.c:4630 blk_mq_update_nr_requests() warn: iterator 'i' not incremented
block/blk-mq.c:4890 blk_mq_cancel_work_sync() warn: iterator 'i' not incremented

vim +344 block/blk.h

83d016ac86428d Bart Van Assche   2018-01-17  309  
3ad5cee5cd000d Christoph Hellwig 2020-03-24  310  ssize_t part_size_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  311  		char *buf);
3ad5cee5cd000d Christoph Hellwig 2020-03-24  312  ssize_t part_stat_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  313  		char *buf);
3ad5cee5cd000d Christoph Hellwig 2020-03-24  314  ssize_t part_inflight_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  315  		char *buf);
3ad5cee5cd000d Christoph Hellwig 2020-03-24  316  ssize_t part_fail_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  317  		char *buf);
3ad5cee5cd000d Christoph Hellwig 2020-03-24  318  ssize_t part_fail_store(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  319  		const char *buf, size_t count);
581d4e28d9195a Jens Axboe        2008-09-14  320  ssize_t part_timeout_show(struct device *, struct device_attribute *, char *);
581d4e28d9195a Jens Axboe        2008-09-14  321  ssize_t part_timeout_store(struct device *, struct device_attribute *,
581d4e28d9195a Jens Axboe        2008-09-14  322  				const char *, size_t);
581d4e28d9195a Jens Axboe        2008-09-14  323  
c55ddd9082f757 Christoph Hellwig 2022-07-27  324  static inline bool bio_may_exceed_limits(struct bio *bio,
aa261f20589d89 Bart Van Assche   2022-10-25  325  					 const struct queue_limits *lim)
abd45c159df5fc Jens Axboe        2021-10-13  326  {
abd45c159df5fc Jens Axboe        2021-10-13  327  	switch (bio_op(bio)) {
abd45c159df5fc Jens Axboe        2021-10-13  328  	case REQ_OP_DISCARD:
abd45c159df5fc Jens Axboe        2021-10-13  329  	case REQ_OP_SECURE_ERASE:
abd45c159df5fc Jens Axboe        2021-10-13  330  	case REQ_OP_WRITE_ZEROES:
abd45c159df5fc Jens Axboe        2021-10-13  331  		return true; /* non-trivial splitting decisions */
abd45c159df5fc Jens Axboe        2021-10-13  332  	default:
abd45c159df5fc Jens Axboe        2021-10-13  333  		break;
abd45c159df5fc Jens Axboe        2021-10-13  334  	}
abd45c159df5fc Jens Axboe        2021-10-13  335  
abd45c159df5fc Jens Axboe        2021-10-13  336  	/*
e2bd6241b810c1 Bart Van Assche   2023-06-12  337  	 * Check whether bio splitting should be performed. This check may
e2bd6241b810c1 Bart Van Assche   2023-06-12  338  	 * trigger the bio splitting code even if splitting is not necessary.
abd45c159df5fc Jens Axboe        2021-10-13  339  	 */
e2bd6241b810c1 Bart Van Assche   2023-06-12 @340  	if (blk_queue_sub_page_limits(lim) && bio->bi_io_vec &&
e2bd6241b810c1 Bart Van Assche   2023-06-12  341  	    bio->bi_io_vec->bv_len > lim->max_segment_size)
e2bd6241b810c1 Bart Van Assche   2023-06-12  342  		return true;
c55ddd9082f757 Christoph Hellwig 2022-07-27  343  	return lim->chunk_sectors || bio->bi_vcnt != 1 ||
abd45c159df5fc Jens Axboe        2021-10-13 @344  		bio->bi_io_vec->bv_len + bio->bi_io_vec->bv_offset > PAGE_SIZE;
abd45c159df5fc Jens Axboe        2021-10-13  345  }
abd45c159df5fc Jens Axboe        2021-10-13  346  

:::::: The code at line 344 was first introduced by commit
:::::: abd45c159df5fcb7ac820e2825dac85de7c01c21 block: handle fast path of bio splitting inline

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
