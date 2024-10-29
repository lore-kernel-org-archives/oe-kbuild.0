Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807483207
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 20:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730235574; cv=none; b=bxYH7SoCZk2Z0srd27dfniE5zG9SQUrvb4aF6MXAjoRTfRbEoSp+IHaopy5hZva5GkmyeZNNZjK359uSFtKn0qLR6A2gebLt9UOvO9ExKvclCTFmtli1+2AotCJb22oBVQ84cRQ+i/gpfaOQnKpKy+VmsrizIneee9+MyJGdWaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730235574; c=relaxed/simple;
	bh=QudVOhT1fGntZVsTHVruIsuyLDdbln0BZOxSf3p277Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pdrbhFWF9Qh/6Zu0W18rviatMmbW4dAM1S/rw60/1aqvO/PQsLBRw5+UPUYcOiev9SyKV0o/1iYQkbo0Jf+DQxyqUIRSDvuLdFO0QwY0DEH7ReZgSCECkKNkoG2TCrDiYThEbrrdgzcYK8Mc8IUxmcSKvb2HgEAGH121UHiiKwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvDe0/oS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvDe0/oS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730235571; x=1761771571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QudVOhT1fGntZVsTHVruIsuyLDdbln0BZOxSf3p277Y=;
  b=YvDe0/oSTYdiVnILaSNS9wgIdgDKHOmFPMyXFazwCXhvbn9JMwip08Cm
   SPUtaIOcHag9b2zyBFQwFPCSfwodlLrvxdf5VYp4IRHnvFVr4l6pp0TKw
   kx/p3jgB4jFAMTkRWGH8OLSKwbEvK0olKDHZOfDpcUwEVY0H/3kUL4VJa
   WN50+V11f02eYNCU3nldVcF4AIHlLSEoEJP/6l7f8Kk5g26wJAKU0TufI
   qxu/pR4cDaXXprcm5/cB7NokEs8lRfz2a6aaL3ranFd1YYQA+Pn719CHF
   l+qhK3hf2ZJM/hJmA8whj92KvaWSV380yE5FFDVe8zpnthfpOoXjOYG/3
   g==;
X-CSE-ConnectionGUID: Ofd3LMPMSC+KFn+sv0NW/Q==
X-CSE-MsgGUID: TIiCF5WiQsKANOnK0GctKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="41305715"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="41305715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 13:59:31 -0700
X-CSE-ConnectionGUID: GvONRLI8SribIznutdDvgQ==
X-CSE-MsgGUID: SKgIrqOIRySW81RBp/pzDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82510954"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Oct 2024 13:59:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5tJH-000e8s-0l;
	Tue, 29 Oct 2024 20:59:27 +0000
Date: Wed, 30 Oct 2024 04:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: io_uring/register.c:384:1-7: preceding lock on line 330
Message-ID: <202410300437.aar0nh35-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e42b1a9a2557aa94fee47f078633677198386a52
commit: c43203154d8ac579537aa0c7802b77d463b1f53a io_uring/register: move io_uring_register(2) related code to register.c
date:   11 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-r061-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300437.aar0nh35-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410300437.aar0nh35-lkp@intel.com/

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
