Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515475392
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jan 2024 05:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZT28Y38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704431715; x=1735967715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=US+RmDJdLGTRNnLo6rW8YO/mvXxy5oZJYd0Vm5VEN/E=;
  b=PZT28Y38sDa0XdOEx2G6noa2laGtBXy1aY2Hts/nqObEofLKG/m5kY7e
   diasQINlc7DH+RcAHblbYOEGc23iNVY69bBYdjgik3SbEsv6BIoHHb+ZB
   yzf1860wWAY8Ws17NOSJVWjSXnk6Pbt5J48Dd78ZNUA0159vUUStdL5To
   9wHfzWKErX/zfV3Onvfco+qJKGjxp1R5PoO1cYG2nZKcY8q6AdAQC/bm5
   IrFEVNs8VSgKlzmFuCgkxidjbILfci7YKFPmlJmcu8hrcugR1a4C21R2P
   epCJH0TLFoIRnRZynIIbsJe/LCGcqR+Ul2BENt++uDClV9+73ODV+9ZrY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4794255"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="4794255"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 21:15:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756843021"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="756843021"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Jan 2024 21:15:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLcY1-0000oG-2U;
	Fri, 05 Jan 2024 05:15:09 +0000
Date: Fri, 5 Jan 2024 13:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [axboe-block:io_uring-min-wait 8/17] io_uring/register.c:384:1-7:
 preceding lock on line 330
Message-ID: <202401051334.mjj45M1k-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-min-wait
head:   6fa8adcd71b7bd0a5af368a7ca6922307ed4f8ac
commit: c43203154d8ac579537aa0c7802b77d463b1f53a [8/17] io_uring/register: move io_uring_register(2) related code to register.c
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
config: hexagon-randconfig-r052-20231228 (https://download.01.org/0day-ci/archive/20240105/202401051334.mjj45M1k-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401051334.mjj45M1k-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/register.c:384:1-7: preceding lock on line 330

vim +384 io_uring/register.c

c43203154d8ac5 Jens Axboe 2023-12-19  303  
c43203154d8ac5 Jens Axboe 2023-12-19  304  static __cold int io_register_iowq_max_workers(struct io_ring_ctx *ctx,
c43203154d8ac5 Jens Axboe 2023-12-19  305  					       void __user *arg)
c43203154d8ac5 Jens Axboe 2023-12-19  306  	__must_hold(&ctx->uring_lock)
c43203154d8ac5 Jens Axboe 2023-12-19  307  {
c43203154d8ac5 Jens Axboe 2023-12-19  308  	struct io_tctx_node *node;
c43203154d8ac5 Jens Axboe 2023-12-19  309  	struct io_uring_task *tctx = NULL;
c43203154d8ac5 Jens Axboe 2023-12-19  310  	struct io_sq_data *sqd = NULL;
c43203154d8ac5 Jens Axboe 2023-12-19  311  	__u32 new_count[2];
c43203154d8ac5 Jens Axboe 2023-12-19  312  	int i, ret;
c43203154d8ac5 Jens Axboe 2023-12-19  313  
c43203154d8ac5 Jens Axboe 2023-12-19  314  	if (copy_from_user(new_count, arg, sizeof(new_count)))
c43203154d8ac5 Jens Axboe 2023-12-19  315  		return -EFAULT;
c43203154d8ac5 Jens Axboe 2023-12-19  316  	for (i = 0; i < ARRAY_SIZE(new_count); i++)
c43203154d8ac5 Jens Axboe 2023-12-19  317  		if (new_count[i] > INT_MAX)
c43203154d8ac5 Jens Axboe 2023-12-19  318  			return -EINVAL;
c43203154d8ac5 Jens Axboe 2023-12-19  319  
c43203154d8ac5 Jens Axboe 2023-12-19  320  	if (ctx->flags & IORING_SETUP_SQPOLL) {
c43203154d8ac5 Jens Axboe 2023-12-19  321  		sqd = ctx->sq_data;
c43203154d8ac5 Jens Axboe 2023-12-19  322  		if (sqd) {
c43203154d8ac5 Jens Axboe 2023-12-19  323  			/*
c43203154d8ac5 Jens Axboe 2023-12-19  324  			 * Observe the correct sqd->lock -> ctx->uring_lock
c43203154d8ac5 Jens Axboe 2023-12-19  325  			 * ordering. Fine to drop uring_lock here, we hold
c43203154d8ac5 Jens Axboe 2023-12-19  326  			 * a ref to the ctx.
c43203154d8ac5 Jens Axboe 2023-12-19  327  			 */
c43203154d8ac5 Jens Axboe 2023-12-19  328  			refcount_inc(&sqd->refs);
c43203154d8ac5 Jens Axboe 2023-12-19  329  			mutex_unlock(&ctx->uring_lock);
c43203154d8ac5 Jens Axboe 2023-12-19 @330  			mutex_lock(&sqd->lock);
c43203154d8ac5 Jens Axboe 2023-12-19  331  			mutex_lock(&ctx->uring_lock);
c43203154d8ac5 Jens Axboe 2023-12-19  332  			if (sqd->thread)
c43203154d8ac5 Jens Axboe 2023-12-19  333  				tctx = sqd->thread->io_uring;
c43203154d8ac5 Jens Axboe 2023-12-19  334  		}
c43203154d8ac5 Jens Axboe 2023-12-19  335  	} else {
c43203154d8ac5 Jens Axboe 2023-12-19  336  		tctx = current->io_uring;
c43203154d8ac5 Jens Axboe 2023-12-19  337  	}
c43203154d8ac5 Jens Axboe 2023-12-19  338  
c43203154d8ac5 Jens Axboe 2023-12-19  339  	BUILD_BUG_ON(sizeof(new_count) != sizeof(ctx->iowq_limits));
c43203154d8ac5 Jens Axboe 2023-12-19  340  
c43203154d8ac5 Jens Axboe 2023-12-19  341  	for (i = 0; i < ARRAY_SIZE(new_count); i++)
c43203154d8ac5 Jens Axboe 2023-12-19  342  		if (new_count[i])
c43203154d8ac5 Jens Axboe 2023-12-19  343  			ctx->iowq_limits[i] = new_count[i];
c43203154d8ac5 Jens Axboe 2023-12-19  344  	ctx->iowq_limits_set = true;
c43203154d8ac5 Jens Axboe 2023-12-19  345  
c43203154d8ac5 Jens Axboe 2023-12-19  346  	if (tctx && tctx->io_wq) {
c43203154d8ac5 Jens Axboe 2023-12-19  347  		ret = io_wq_max_workers(tctx->io_wq, new_count);
c43203154d8ac5 Jens Axboe 2023-12-19  348  		if (ret)
c43203154d8ac5 Jens Axboe 2023-12-19  349  			goto err;
c43203154d8ac5 Jens Axboe 2023-12-19  350  	} else {
c43203154d8ac5 Jens Axboe 2023-12-19  351  		memset(new_count, 0, sizeof(new_count));
c43203154d8ac5 Jens Axboe 2023-12-19  352  	}
c43203154d8ac5 Jens Axboe 2023-12-19  353  
c43203154d8ac5 Jens Axboe 2023-12-19  354  	if (sqd) {
c43203154d8ac5 Jens Axboe 2023-12-19  355  		mutex_unlock(&sqd->lock);
c43203154d8ac5 Jens Axboe 2023-12-19  356  		io_put_sq_data(sqd);
c43203154d8ac5 Jens Axboe 2023-12-19  357  	}
c43203154d8ac5 Jens Axboe 2023-12-19  358  
c43203154d8ac5 Jens Axboe 2023-12-19  359  	if (copy_to_user(arg, new_count, sizeof(new_count)))
c43203154d8ac5 Jens Axboe 2023-12-19  360  		return -EFAULT;
c43203154d8ac5 Jens Axboe 2023-12-19  361  
c43203154d8ac5 Jens Axboe 2023-12-19  362  	/* that's it for SQPOLL, only the SQPOLL task creates requests */
c43203154d8ac5 Jens Axboe 2023-12-19  363  	if (sqd)
c43203154d8ac5 Jens Axboe 2023-12-19  364  		return 0;
c43203154d8ac5 Jens Axboe 2023-12-19  365  
c43203154d8ac5 Jens Axboe 2023-12-19  366  	/* now propagate the restriction to all registered users */
c43203154d8ac5 Jens Axboe 2023-12-19  367  	list_for_each_entry(node, &ctx->tctx_list, ctx_node) {
c43203154d8ac5 Jens Axboe 2023-12-19  368  		struct io_uring_task *tctx = node->task->io_uring;
c43203154d8ac5 Jens Axboe 2023-12-19  369  
c43203154d8ac5 Jens Axboe 2023-12-19  370  		if (WARN_ON_ONCE(!tctx->io_wq))
c43203154d8ac5 Jens Axboe 2023-12-19  371  			continue;
c43203154d8ac5 Jens Axboe 2023-12-19  372  
c43203154d8ac5 Jens Axboe 2023-12-19  373  		for (i = 0; i < ARRAY_SIZE(new_count); i++)
c43203154d8ac5 Jens Axboe 2023-12-19  374  			new_count[i] = ctx->iowq_limits[i];
c43203154d8ac5 Jens Axboe 2023-12-19  375  		/* ignore errors, it always returns zero anyway */
c43203154d8ac5 Jens Axboe 2023-12-19  376  		(void)io_wq_max_workers(tctx->io_wq, new_count);
c43203154d8ac5 Jens Axboe 2023-12-19  377  	}
c43203154d8ac5 Jens Axboe 2023-12-19  378  	return 0;
c43203154d8ac5 Jens Axboe 2023-12-19  379  err:
c43203154d8ac5 Jens Axboe 2023-12-19  380  	if (sqd) {
c43203154d8ac5 Jens Axboe 2023-12-19  381  		mutex_unlock(&sqd->lock);
c43203154d8ac5 Jens Axboe 2023-12-19  382  		io_put_sq_data(sqd);
c43203154d8ac5 Jens Axboe 2023-12-19  383  	}
c43203154d8ac5 Jens Axboe 2023-12-19 @384  	return ret;
c43203154d8ac5 Jens Axboe 2023-12-19  385  }
c43203154d8ac5 Jens Axboe 2023-12-19  386  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
