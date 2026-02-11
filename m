Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F96353ED6
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 10:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806908; cv=none; b=jsGF5YARLLrk+9nVtustk9PQyNVvhYwlVK1YyRYx2Kc9r+xm0tgOFL39RQbINRtBMlc5rGK4l0IqKy/ZabV8SxKdNoIJvhCUd/9EqoDDPCvuITX2FwnyNlB+PXaIUZBvlk2v/ZE9v3YEvp96vAFTy03LCV7WA9emreInGPBjoLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806908; c=relaxed/simple;
	bh=U983C4gCLD7jO9iUkmju9PvJgp/7oDRx6dLON0BbaZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tv1Qa1kHeutNrPdsrID2Lw2u/m3EL3esxkxsjE5fmhCAVD38kDqwcJwasXB60euodS8Cj6053Ht9f2P45v+GUUiAJT0Rs8AgujBZdR7gFAUrKvEfbVpYYl26WwivakEy2+HQtQwizevtEpxtvGEN/WRIJF9ulYhFoT6BuHP7GCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZcvFqWJB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZcvFqWJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770806907; x=1802342907;
  h=date:from:to:cc:subject:message-id;
  bh=U983C4gCLD7jO9iUkmju9PvJgp/7oDRx6dLON0BbaZQ=;
  b=ZcvFqWJBZEGb8rryL2VH6gWiXd6//M/HwVNxd2rSYTvdr4nT0Fl7eM+W
   CUIgLzVIV91ertPDLhKmHcbOCD3xSuD+0+VoQuVHuEn47knUj2ay2JCwN
   inzlZioaUiuG83W6WuKkZXOO1hUrHwI2hSlUW3hss+qq9sCqPCjRWMQBp
   0lSdiRXL5i9YOMhzT7BUFSnzMxnFjlkavyKlc6smx19KCNcMjoNigLhWZ
   +JEPQZehxZ9VgarShpHzSJNHpnp/n/zvGgDQXkxB4WY0y8tdp9m5pyAJt
   95YCFaI2Tq0HYxXIKCFQENmnRnTSvKEL+hMibEfRbjVABV83QhxTY7cW+
   w==;
X-CSE-ConnectionGUID: KFeMpAg7ShCqVJiBojBXCg==
X-CSE-MsgGUID: RtvY8ftDTnmHaDyzT8RFQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75799066"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75799066"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 02:48:26 -0800
X-CSE-ConnectionGUID: jLvp2+IQTDKgrrwtd11LQg==
X-CSE-MsgGUID: bJlLbVZGThGb7OF+bZ8L1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="242820599"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Feb 2026 02:48:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq7le-00000000pue-1EA0;
	Wed, 11 Feb 2026 10:48:22 +0000
Date: Wed, 11 Feb 2026 18:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 5/5] block/blk.h:344
 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could
 be null (see line 340)
Message-ID: <202602111857.2fZ5GeZz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   8eed14b3df122c0b89590e49aa75187aac86d3ba
commit: e2bd6241b810c128e5fcc8ed4cd6fa281c0f00b4 [5/5] ANDROID: block: Add support for filesystem requests and small segments
:::::: branch date: 6 hours ago
:::::: commit date: 1 year, 11 months ago
config: i386-randconfig-r071-20260211 (https://download.01.org/0day-ci/archive/20260211/202602111857.2fZ5GeZz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602111857.2fZ5GeZz-lkp@intel.com/

smatch warnings:
block/blk.h:344 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could be null (see line 340)

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
