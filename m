Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EA4306B2D
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Oct 2025 12:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912347; cv=none; b=ZmvESl3FqmO3ZG+dc2eX2R1pUHNB2Y/+axO//+iNGbY4HGkWwweNw6e5XwyoI75puP0GefyhLYBlYXsca86VqyQ8fz07HEqQrMBNLAlC4YAm+gyNjxqzG36CHKO3KVcJD5/Hhy69bTzAilSnp5Mp5/uz1/oupN5647OBlZJWbJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912347; c=relaxed/simple;
	bh=/2wZe8BT3U26XmUThaotwZyTruJSMUMJt5COUevcub4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FCeA5zguqmFta5xvx1m7CbaFYkMJRiVLqyx8WJ3s5QUupobQ3A+M1H8MqHmqc+fWYJjL9c4w6jV6596qUcblP8C1nYseDDMY/dlr//oyIx1lfUzLKoiKkwZ7HJg6fbdEWlpLw6UvwabdP7me6nkMAu0S93cJaS1CXQTQUMWcyCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0NqUdUk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0NqUdUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761912346; x=1793448346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/2wZe8BT3U26XmUThaotwZyTruJSMUMJt5COUevcub4=;
  b=d0NqUdUkRaS720ES2ZlYyIFTX/14hoSJPso77GuOV6xzg2wQoxWT2NHl
   f8XQb2l4DeSaHl50XxnVoOfguY1BfB9GCGt3OvCf2H59YCoJwYvv733lY
   58avaQgKOTVwJ/cp3odpoSh+y84BcQRxv0bD2R72oQHwFi9huh1PrlNuW
   N4AuwJYpk5n8U+e3sdDenuSj+foje2lUt7Nb4lKsYDEjRICSNgc++OidP
   Eh5l+lxSKksh7oSwtWaTpuT/E2ouEcqIS/XJhHGYgLClE9E8/ygYGFIUf
   EhbTF21rAX4tLWkZe9+oSssSvu2Ifpmvcyqxfzj91x6nePqD0mVy5+p5f
   w==;
X-CSE-ConnectionGUID: D6OTVqquQ1SWfzMmfg8bHw==
X-CSE-MsgGUID: kx92FilNQgyTengLxYqGxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74363782"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="74363782"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 05:05:45 -0700
X-CSE-ConnectionGUID: kfpffgLzR3GqpHy+f8lGDQ==
X-CSE-MsgGUID: FoOyXF+TRzqGT6gUraLK7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186677018"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 31 Oct 2025 05:05:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEnt0-000N4v-06;
	Fri, 31 Oct 2025 12:05:42 +0000
Date: Fri, 31 Oct 2025 20:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 2/2] block/blk.h:347
 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could
 be null (see line 343)
Message-ID: <202510311917.TDY9r0nH-lkp@intel.com>
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
head:   3e2aa22eb7df590670c63f75b44f1cd3894c1de1
commit: 24edb63b854ab73fa1bf86b4dde98cdb648cba35 [2/2] Reapply "ANDROID: block: Add support for filesystem requests and small segments"
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 6 months ago
config: x86_64-randconfig-r071-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311917.TDY9r0nH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510311917.TDY9r0nH-lkp@intel.com/

New smatch warnings:
block/blk.h:347 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could be null (see line 343)
block/blk.h:347 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could be null (see line 343)

Old smatch warnings:
block/blk-mq.c:319 blk_mq_wake_waiters() warn: iterator 'i' not incremented
block/blk-mq.c:1670 blk_mq_timeout_work() warn: iterator 'i' not incremented
block/blk-mq.c:2332 blk_mq_run_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2360 blk_mq_delay_run_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2414 blk_mq_stop_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2432 blk_mq_start_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2452 blk_mq_start_stopped_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:3633 blk_mq_exit_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:3938 queue_set_hctx_shared() warn: iterator 'i' not incremented
block/blk-mq.c:4038 blk_mq_release() warn: iterator 'i' not incremented
block/blk-mq.c:4582 blk_mq_update_nr_requests() warn: iterator 'i' not incremented
block/blk-mq.c:4959 blk_mq_cancel_work_sync() warn: iterator 'i' not incremented

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
24edb63b854ab7 Bart Van Assche   2023-06-12  340  	 * Check whether bio splitting should be performed. This check may
24edb63b854ab7 Bart Van Assche   2023-06-12  341  	 * trigger the bio splitting code even if splitting is not necessary.
abd45c159df5fc Jens Axboe        2021-10-13  342  	 */
24edb63b854ab7 Bart Van Assche   2023-06-12 @343  	if (blk_queue_sub_page_limits(lim) && bio->bi_io_vec &&
24edb63b854ab7 Bart Van Assche   2023-06-12  344  	    bio->bi_io_vec->bv_len > lim->max_segment_size)
24edb63b854ab7 Bart Van Assche   2023-06-12  345  		return true;
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
