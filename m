Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10813139D1B
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 05:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746767309; cv=none; b=MOsQeBTqg3xGAWARtzOei4fpyLGn6QgiSNf0r4ota6W1Bk/C/85Tyk5qZ0nCKrXNWP08cP6OXQTsfplAHkfD7OyCowV/oHEGzsIKBvCLTFIv+lzRz2gk5gWklxYurDbI6Da2opH4ThEtM3Y0v0yStfPO4kKbz8r+Wn97FaggtrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746767309; c=relaxed/simple;
	bh=x+bDtZ6Pn6eWQvY9AmuJuyAHGlh3y1Ye7wKTVdXtaZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HXjhWmAUCfYGe1CqsyN9hPkuyBg8/KHuRrvjybbA6ax2Nrhg83CI6H6YXzK5XJb7wJTR/TpNhMAUPj9Ac64BdZhOdAdahV3m509IKkNyrmm2q20WPaYS9xNMwRw5IxqACpascuZk75ZapyYDsmxrCTiLy4tUZ+EPDqA0fEzPeJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmJQtes0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmJQtes0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746767308; x=1778303308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x+bDtZ6Pn6eWQvY9AmuJuyAHGlh3y1Ye7wKTVdXtaZw=;
  b=SmJQtes0VIs1rDw0kpxAPROH6PyKBD/dtfj3LiwSN4IUU8U4LIvXpbb7
   /cI935uDya6HU2jHDAf3G4eYLKcr6wXJUHnpU6R5W8uZfloQSTNy21EQK
   B3NZNT7YQEeWKAe76sTtNMLhOcg894+va6ChgODp34WpxiMbt6UJZ/Kxg
   5AEve4kl9DEKLwCWxVzsxSvoFLw/yoMlXwlzVMe2/qqYag93A3fu32iWs
   fu2qrp9WW9XCfZ8nBQLohd7p5D4fsxolfHlMIJFnuZ8J3hZGKO/ZmuLHa
   59nXV5Kl1qCmBDuIwZSGQWbGvWPE4wXWCoyCLySSSIUVO0VbFmxzrjM0s
   A==;
X-CSE-ConnectionGUID: 4zh7C/KnQ/6IGVkcJA2roQ==
X-CSE-MsgGUID: 1aK0JVxQTGWGoiMH13c9ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48731098"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48731098"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 22:08:27 -0700
X-CSE-ConnectionGUID: SoQ117LuRHuL/Rth8/ES+w==
X-CSE-MsgGUID: 9MbyFLDKT46mTfP3esfqEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136899639"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 May 2025 22:08:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDFyC-000Bg7-0Q;
	Fri, 09 May 2025 05:08:24 +0000
Date: Fri, 9 May 2025 13:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:for-6.16/block 49/106] block/blk-mq-sched.c:444
 blk_mq_sched_reg_debugfs() warn: iterator 'i' not incremented
Message-ID: <202505091356.PvNPIRRx-lkp@intel.com>
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
TO: Ming Lei <ming.lei@redhat.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Yu Kuai <yukuai3@huawei.com>
CC: Nilay Shroff <nilay@linux.ibm.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.16/block
head:   824afb9b04648ea11531fc9047923ec07e7a943d
commit: ed3896acdcf038888a80a02dd264099e35f76b47 [49/106] block: add two helpers for registering/un-registering sched debugfs
:::::: branch date: 14 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20250508 (https://download.01.org/0day-ci/archive/20250509/202505091356.PvNPIRRx-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505091356.PvNPIRRx-lkp@intel.com/

New smatch warnings:
block/blk-mq-sched.c:444 blk_mq_sched_reg_debugfs() warn: iterator 'i' not incremented
block/blk-mq-sched.c:455 blk_mq_sched_unreg_debugfs() warn: iterator 'i' not incremented

Old smatch warnings:
block/blk-mq-sched.c:406 blk_mq_sched_tags_teardown() warn: iterator 'i' not incremented
block/blk-mq-sched.c:494 blk_mq_init_sched() warn: iterator 'i' not incremented
block/blk-mq-sched.c:533 blk_mq_sched_free_rqs() warn: iterator 'i' not incremented
block/blk-mq-sched.c:550 blk_mq_exit_sched() warn: iterator 'i' not incremented

vim +/i +444 block/blk-mq-sched.c

d97e594c51660b John Garry 2021-05-13  436  
ed3896acdcf038 Ming Lei   2025-05-05  437  static void blk_mq_sched_reg_debugfs(struct request_queue *q)
ed3896acdcf038 Ming Lei   2025-05-05  438  {
ed3896acdcf038 Ming Lei   2025-05-05  439  	struct blk_mq_hw_ctx *hctx;
ed3896acdcf038 Ming Lei   2025-05-05  440  	unsigned long i;
ed3896acdcf038 Ming Lei   2025-05-05  441  
ed3896acdcf038 Ming Lei   2025-05-05  442  	mutex_lock(&q->debugfs_mutex);
ed3896acdcf038 Ming Lei   2025-05-05  443  	blk_mq_debugfs_register_sched(q);
ed3896acdcf038 Ming Lei   2025-05-05 @444  	queue_for_each_hw_ctx(q, hctx, i)
ed3896acdcf038 Ming Lei   2025-05-05  445  		blk_mq_debugfs_register_sched_hctx(q, hctx);
ed3896acdcf038 Ming Lei   2025-05-05  446  	mutex_unlock(&q->debugfs_mutex);
ed3896acdcf038 Ming Lei   2025-05-05  447  }
ed3896acdcf038 Ming Lei   2025-05-05  448  
ed3896acdcf038 Ming Lei   2025-05-05  449  static void blk_mq_sched_unreg_debugfs(struct request_queue *q)
ed3896acdcf038 Ming Lei   2025-05-05  450  {
ed3896acdcf038 Ming Lei   2025-05-05  451  	struct blk_mq_hw_ctx *hctx;
ed3896acdcf038 Ming Lei   2025-05-05  452  	unsigned long i;
ed3896acdcf038 Ming Lei   2025-05-05  453  
ed3896acdcf038 Ming Lei   2025-05-05  454  	mutex_lock(&q->debugfs_mutex);
ed3896acdcf038 Ming Lei   2025-05-05 @455  	queue_for_each_hw_ctx(q, hctx, i)
ed3896acdcf038 Ming Lei   2025-05-05  456  		blk_mq_debugfs_unregister_sched_hctx(hctx);
ed3896acdcf038 Ming Lei   2025-05-05  457  	blk_mq_debugfs_unregister_sched(q);
ed3896acdcf038 Ming Lei   2025-05-05  458  	mutex_unlock(&q->debugfs_mutex);
ed3896acdcf038 Ming Lei   2025-05-05  459  }
ed3896acdcf038 Ming Lei   2025-05-05  460  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
