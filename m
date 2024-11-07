Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF28D36D
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 03:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730950798; cv=none; b=S/v1dFYIkmNhAnqFAJfJ8xX7Br83IEghFe/G4bbJvoK2UoHdJzSIetobPwhxLF6EgO8IfYRLoV+YegulcJX/BOLHNPKvtD0yoUEE27KihHpnlgVGIXv73W6vFhAdRm/7oOOodX1lNEcd0Xv3YxpnHet3aLLKf3sG5wX9DH4k04s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730950798; c=relaxed/simple;
	bh=+vw6LYd0Ymu/cep0T3pk2wVch7ldX6IzB/ncec5DNfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aiR78o5/IypaAsB5d2HAfEcwLaZfKI/TLq9nYBx+QGGvEu2+RY9lTAePJhlWToMKe9DIVNNUZXJCQSIdjNKIbC4Aqn6oJSO5mHKBW1BgnwaLY9VbhVtUNnHl48WH1wDPz/X48kCaAwCGXBc0zB6+BaDEmgjraBFAo9zWaDAjuts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXMogs1O; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXMogs1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730950796; x=1762486796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vw6LYd0Ymu/cep0T3pk2wVch7ldX6IzB/ncec5DNfI=;
  b=jXMogs1O9we6qQgHAfwD/kA1KoemyDGYhToywyOAN8VIVpoMHl9KFCdz
   P1nKd0hGNl2ume3WGNcrvh/CKXuNviHvxa10yORTlUfGT5wL1omlz/Npn
   H0OG91dtBvhkTdbXYamJ2CWqt4ezFJ6z/s7YI0TNVlf5H8RpicqqCzVwO
   qTfqn5E8tM+1X21WtH2uBxC2r+yiBrn9ufUy8PZUHpqEFaxX9711Q6PM7
   PgF3GpfAKp6G6qPrZV7Y6vACnHV31Vx3/H5YCpEz1ePNIc1pNcpnNx+Kp
   WKUS/LzHBJqhQ3WhOLMdvxStGHd1z/oq5nU/J2mHn6lZx3T/GUxUUDBdk
   Q==;
X-CSE-ConnectionGUID: hnmLJ/HhRMmeyIaTjuft6A==
X-CSE-MsgGUID: T763lAA7S3qh7/reFAT9LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="34698423"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="34698423"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 19:39:55 -0800
X-CSE-ConnectionGUID: BEtk8FjrSD2yQgMqzVKuiw==
X-CSE-MsgGUID: nVw++SjLRHWM83L5deto+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="89687011"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Nov 2024 19:39:54 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8tN9-000pnI-2J;
	Thu, 07 Nov 2024 03:39:51 +0000
Date: Thu, 7 Nov 2024 11:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 2157/16464] block/blk-mq.c:3947
 queue_update_fair_tag_sharing() warn: iterator 'i' not incremented
Message-ID: <202411071146.OoZ83u7x-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Yu Kuai <yukuai3@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8edd62f80cd8e00a4ecb15f57010d8fdbff12e16
commit: 9b569e2bb7d13d4d819b096bc568930d264c2f1d [2157/16464] blk-mq: add apis to disable fair tag sharing
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071146.OoZ83u7x-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411071146.OoZ83u7x-lkp@intel.com/

New smatch warnings:
block/blk-mq.c:3947 queue_update_fair_tag_sharing() warn: iterator 'i' not incremented

Old smatch warnings:
block/blk-mq.c:310 blk_mq_wake_waiters() warn: iterator 'i' not incremented
block/blk-mq.c:1668 blk_mq_timeout_work() warn: iterator 'i' not incremented
block/blk-mq.c:2303 blk_mq_run_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2331 blk_mq_delay_run_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2385 blk_mq_stop_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2403 blk_mq_start_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2423 blk_mq_start_stopped_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:3642 blk_mq_exit_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:3979 queue_set_hctx_shared() warn: iterator 'i' not incremented
block/blk-mq.c:4080 blk_mq_release() warn: iterator 'i' not incremented
block/blk-mq.c:4635 blk_mq_update_nr_requests() warn: iterator 'i' not incremented
block/blk-mq.c:4898 blk_mq_cancel_work_sync() warn: iterator 'i' not incremented

vim +/i +3947 block/blk-mq.c

320ae51feed5c2f Jens Axboe 2013-10-24  3938  
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3939  static void queue_update_fair_tag_sharing(struct request_queue *q)
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3940  {
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3941  	struct blk_mq_hw_ctx *hctx;
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3942  	unsigned long i;
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3943  	bool disabled = q->tag_set->flags & BLK_MQ_F_DISABLE_FAIR_TAG_SHARING;
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3944  
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3945  	lockdep_assert_held(&q->tag_set->tag_list_lock);
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3946  
9b569e2bb7d13d4 Yu Kuai    2024-01-02 @3947  	queue_for_each_hw_ctx(q, hctx, i) {
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3948  		if (disabled)
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3949  			hctx->flags |= BLK_MQ_F_DISABLE_FAIR_TAG_SHARING;
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3950  		else
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3951  			hctx->flags &= ~BLK_MQ_F_DISABLE_FAIR_TAG_SHARING;
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3952  	}
9b569e2bb7d13d4 Yu Kuai    2024-01-02  3953  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
