Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8743A2D595D
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Feb 2026 23:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769990357; cv=none; b=hVs0/IxYKRdC6Qavkd3jrMJrCT+wsJwXhAi7tjYjuXKcnC4rgIr327v7FITl8rDPgTCkFGzgaW3+fx06mIePDWDfGtWbmOItQuHZdmF+wzRf0qXvPZozQ5/HTYMF+KNqSPtRZi2iDYL0Ja0YGpZZZS1xJZl6JBK1ISV7zCZ3DfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769990357; c=relaxed/simple;
	bh=CyW2Aq4aF1jKl3A8kip+s6VnqBd2OKQl3ZX8Qu/hS+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nYImHBFIPOOniCa1352N5oX1sadlWJ7SCRuSNDOTgMx1tSt67/8gTL6ysLIX2pf8oAANkCEWxRyM4ngCke2U0za6dGMfThgMQainYL8oZgr0DiLKGARpNnTpYvAvvCry/wSLF5fEce61uaOeKcOntu1SOyDWjm5NPLBiSh4Cz00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+OhsgHH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+OhsgHH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769990356; x=1801526356;
  h=date:from:to:cc:subject:message-id;
  bh=CyW2Aq4aF1jKl3A8kip+s6VnqBd2OKQl3ZX8Qu/hS+I=;
  b=a+OhsgHHi1VJjEuxwF7aql+AF5Do6d5NXdtOmIOi4MiyMqC693dlyOs+
   q0X5CDaE2QFnssrBmTh9/MY/DFFfcSm1iMxyi/rIpZEcpvJe7SQf4CANu
   ML0cF8m2WFtLeqgdUNebVHyVVmDXo4i+v5VI80rnOrDdNsiJ0S3zqylO8
   jFd2ZMA17lSVvESYdqoe8biAZHe18dv0xZVBpH6ebPO6f2oQ3mryh/HpI
   4doU0+AHI3SB7bX/c/35QyRJHHaLfyYGD0N/Zuj9W1+pdMFe78LI9Gl3K
   LHX5EE4ZiKinzrxh+fJWAa3bW1XpbQS3LARr2eHXmLLYy5NHpLjtIH1+G
   w==;
X-CSE-ConnectionGUID: eI6zNYmfSS2srvzP0tHOkA==
X-CSE-MsgGUID: y3VUmSDVSrWIi8BI6QA68g==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71063057"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="71063057"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 15:59:15 -0800
X-CSE-ConnectionGUID: CUnr+FqySNa1Yrq+RtHp+Q==
X-CSE-MsgGUID: 1J+qgZXDSBW9GtRnmql14A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="208904977"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Feb 2026 15:59:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmhLT-00000000f75-2XhM;
	Sun, 01 Feb 2026 23:59:11 +0000
Date: Mon, 02 Feb 2026 07:58:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/blktrace.c:664 blk_trace_setup() error:
 strcpy() 'buts2.name' too large for 'buts.name' (64 vs 32)
Message-ID: <202602020718.GUEIRyG9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>
CC: Damien Le Moal <dlemoal@kernel.org>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18f7fcd5e69a04df57b563360b88be72471d6b62
commit: 113cbd62824afdf62d2f3f092809cf37cc7f1dd8 blktrace: pass blk_user_trace2 to setup functions
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: s390-randconfig-r073-20260202 (https://download.01.org/0day-ci/archive/20260202/202602020718.GUEIRyG9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602020718.GUEIRyG9-lkp@intel.com/

smatch warnings:
kernel/trace/blktrace.c:664 blk_trace_setup() error: strcpy() 'buts2.name' too large for 'buts.name' (64 vs 32)

vim +664 kernel/trace/blktrace.c

171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  630  
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  631  int blk_trace_setup(struct request_queue *q, char *name, dev_t dev,
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  632  		    struct block_device *bdev,
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  633  		    char __user *arg)
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  634  {
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  635  	struct blk_user_trace_setup2 buts2;
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  636  	struct blk_user_trace_setup buts;
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  637  	struct blk_trace *bt;
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  638  	int ret;
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  639  
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  640  	ret = copy_from_user(&buts, arg, sizeof(buts));
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  641  	if (ret)
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  642  		return -EFAULT;
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  643  
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  644  	if (!buts.buf_size || !buts.buf_nr)
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  645  		return -EINVAL;
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  646  
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  647  	buts2 = (struct blk_user_trace_setup2) {
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  648  		.act_mask = buts.act_mask,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  649  		.buf_size = buts.buf_size,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  650  		.buf_nr = buts.buf_nr,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  651  		.start_lba = buts.start_lba,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  652  		.end_lba = buts.end_lba,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  653  		.pid = buts.pid,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  654  	};
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  655  
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  656  	mutex_lock(&q->debugfs_mutex);
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  657  	bt = blk_trace_setup_prepare(q, name, dev, buts.buf_size, buts.buf_nr,
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  658  				     bdev);
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  659  	if (IS_ERR(bt)) {
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  660  		mutex_unlock(&q->debugfs_mutex);
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  661  		return PTR_ERR(bt);
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  662  	}
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  663  	blk_trace_setup_finalize(q, name, 1, bt, &buts2);
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22 @664  	strcpy(buts.name, buts2.name);
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  665  	mutex_unlock(&q->debugfs_mutex);
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  666  
9a8c28c8311e30 kernel/trace/blktrace.c Dmitry Monakhov    2010-02-27  667  	if (copy_to_user(arg, &buts, sizeof(buts))) {
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  668  		blk_trace_remove(q);
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  669  		return -EFAULT;
9a8c28c8311e30 kernel/trace/blktrace.c Dmitry Monakhov    2010-02-27  670  	}
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  671  	return 0;
1f2cac107c591c kernel/trace/blktrace.c Jens Axboe         2017-11-05  672  }
6da127ad0918f9 block/blktrace.c        Christof Schmitt   2008-01-11  673  EXPORT_SYMBOL_GPL(blk_trace_setup);
2056a782f8e7e6 block/blktrace.c        Jens Axboe         2006-03-23  674  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
