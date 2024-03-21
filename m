Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17422DF84
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Mar 2024 20:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711054444; cv=none; b=nBZ3yc5fRb0kuZPTgQRqK5kHOPXlbZPV7Ulsg0+sa0I7FaJorkZhd1ifI5YPFJibSo2tmZPVrE+J0aYMknpuOIqM2TpsfDyhAROg1ZbfO+gQZyujIzVCvVbcC+oKzt3vCKjRKrWtjkKkcaP/jMxB5PfSUWURbxuT+xKowQozsAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711054444; c=relaxed/simple;
	bh=KOY+8LL7qZhGuAgOsJXacIXOa9qi6N0hEUCqT/Gjlv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pWWnK79/FXUJAirD98W7qZVi/Hw+TgljHKoceXRo7gfW60r4HKlgxxO7lAdI70YoFJcoX6DucbudvgZ/MpQOAUL6kWim/eEODqlZ8ol058k+9FvtMT/xPfY4CR5qVYhBqRxUJu6XZmEWVqU+yj7BYvSVEhv5rwnpS7kWxW8sdOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3vLd+Sn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3vLd+Sn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711054442; x=1742590442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KOY+8LL7qZhGuAgOsJXacIXOa9qi6N0hEUCqT/Gjlv0=;
  b=R3vLd+SnheyecZguGrvPnznpg1koYSf4hZUNHA7CGDwY79t0DQgSbgqt
   Zuup4D8lcMkHaq93B5WvtrKcc0dN3Pqc//WDO9xLLfRjmDGqGN61WIhST
   uzBQD5arSKcrnStsQh9xHaQ7n89cpRc8DsvsU/maKxWH4fxtb3lclYch1
   ea7eBcbzWu8yxp4fufYb1heW+eIlv6gM737b5g9Y8TFW8lNcRiJv+IB53
   ik3S6pUuGLWiC65td17QKt03eD5JUFejouA8jKUaic+/yA/OFgGQYvFWr
   k32jqkoEfjsgfvZafkhDUmHTyjs2b6e5pfQEa1PHmQXGzIcZIZm5kCxHt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6019421"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="6019421"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 13:54:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="14557880"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Mar 2024 13:54:01 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnPQE-000Jlr-1a;
	Thu, 21 Mar 2024 20:53:58 +0000
Date: Fri, 22 Mar 2024 04:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 6/8] block/blk.h:347
 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could
 be null (see line 343)
Message-ID: <202403220441.8DiNyGzH-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   24850809220d9e09bb48c47d83b971a3d247e467
commit: 8a2f432fcb4a6c2deed12afa3d2b76fcb6dc8ada [6/8] ANDROID: block: Add support for filesystem requests and small segments
:::::: branch date: 4 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-161-20240321 (https://download.01.org/0day-ci/archive/20240322/202403220441.8DiNyGzH-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403220441.8DiNyGzH-lkp@intel.com/

New smatch warnings:
block/blk.h:347 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could be null (see line 343)
block/blk.h:347 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could be null (see line 343)

Old smatch warnings:
block/blk-mq.c:3144 blk_rq_prep_clone() error: uninitialized symbol 'bio'.

vim +347 block/blk.h

83d016ac86428d Bart Van Assche   2018-01-17  312  
3ad5cee5cd000d Christoph Hellwig 2020-03-24  313  ssize_t part_size_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  314  		char *buf);
3ad5cee5cd000d Christoph Hellwig 2020-03-24  315  ssize_t part_stat_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  316  		char *buf);
3ad5cee5cd000d Christoph Hellwig 2020-03-24  317  ssize_t part_inflight_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  318  		char *buf);
3ad5cee5cd000d Christoph Hellwig 2020-03-24  319  ssize_t part_fail_show(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  320  		char *buf);
3ad5cee5cd000d Christoph Hellwig 2020-03-24  321  ssize_t part_fail_store(struct device *dev, struct device_attribute *attr,
3ad5cee5cd000d Christoph Hellwig 2020-03-24  322  		const char *buf, size_t count);
581d4e28d9195a Jens Axboe        2008-09-14  323  ssize_t part_timeout_show(struct device *, struct device_attribute *, char *);
581d4e28d9195a Jens Axboe        2008-09-14  324  ssize_t part_timeout_store(struct device *, struct device_attribute *,
581d4e28d9195a Jens Axboe        2008-09-14  325  				const char *, size_t);
581d4e28d9195a Jens Axboe        2008-09-14  326  
c55ddd9082f757 Christoph Hellwig 2022-07-27  327  static inline bool bio_may_exceed_limits(struct bio *bio,
c55ddd9082f757 Christoph Hellwig 2022-07-27  328  		struct queue_limits *lim)
abd45c159df5fc Jens Axboe        2021-10-13  329  {
abd45c159df5fc Jens Axboe        2021-10-13  330  	switch (bio_op(bio)) {
abd45c159df5fc Jens Axboe        2021-10-13  331  	case REQ_OP_DISCARD:
abd45c159df5fc Jens Axboe        2021-10-13  332  	case REQ_OP_SECURE_ERASE:
abd45c159df5fc Jens Axboe        2021-10-13  333  	case REQ_OP_WRITE_ZEROES:
abd45c159df5fc Jens Axboe        2021-10-13  334  		return true; /* non-trivial splitting decisions */
abd45c159df5fc Jens Axboe        2021-10-13  335  	default:
abd45c159df5fc Jens Axboe        2021-10-13  336  		break;
abd45c159df5fc Jens Axboe        2021-10-13  337  	}
abd45c159df5fc Jens Axboe        2021-10-13  338  
abd45c159df5fc Jens Axboe        2021-10-13  339  	/*
8a2f432fcb4a6c Bart Van Assche   2023-06-12  340  	 * Check whether bio splitting should be performed. This check may
8a2f432fcb4a6c Bart Van Assche   2023-06-12  341  	 * trigger the bio splitting code even if splitting is not necessary.
abd45c159df5fc Jens Axboe        2021-10-13  342  	 */
8a2f432fcb4a6c Bart Van Assche   2023-06-12 @343  	if (blk_queue_sub_page_limits(lim) && bio->bi_io_vec &&
8a2f432fcb4a6c Bart Van Assche   2023-06-12  344  	    bio->bi_io_vec->bv_len > lim->max_segment_size)
8a2f432fcb4a6c Bart Van Assche   2023-06-12  345  		return true;
c55ddd9082f757 Christoph Hellwig 2022-07-27  346  	return lim->chunk_sectors || bio->bi_vcnt != 1 ||
abd45c159df5fc Jens Axboe        2021-10-13 @347  		bio->bi_io_vec->bv_len + bio->bi_io_vec->bv_offset > PAGE_SIZE;
abd45c159df5fc Jens Axboe        2021-10-13  348  }
abd45c159df5fc Jens Axboe        2021-10-13  349  

:::::: The code at line 347 was first introduced by commit
:::::: abd45c159df5fcb7ac820e2825dac85de7c01c21 block: handle fast path of bio splitting inline

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
