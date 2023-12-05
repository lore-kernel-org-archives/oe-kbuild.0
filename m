Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4283E473
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 09:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8ynU2d5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701768334; x=1733304334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=64+sSKuvgswdYKIloBTE8/h/rhRN3YJt5l8T1ZigmXA=;
  b=E8ynU2d5SPoqh2yK2/27wZzDKrDNnG09JxMhfq/r7QJNvb4VXEY/HBDm
   eG4YW2do0/osIuS8gRrJNCZ/LB2EzDzJOSDrhW/16urjiS/a2hJLJgAs6
   X6p3rHrGR5Ru21QEC6+AMHg9vcc6jOK4oWhz2wH+4u0uBcMTDeKYDI4MZ
   r+x2hZ+hNWYp5rV5dOfhJjHV2jX8oUqExYwmMHWMwhlmOs9rFvM9hetrF
   +fCYl5nUw18xy5Yk5J+nNZeLX3cK4VlYvJCN2D6XJL1HTuHkzWPkFtfmd
   0ON1N+PCj6tQdXfbv73yMTtncQWnroaHj158Tj479psaJGyPq+uPRigCm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="460356510"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="460356510"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 01:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="894304932"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="894304932"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Dec 2023 01:25:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rARgG-0008f7-2q;
	Tue, 05 Dec 2023 09:25:28 +0000
Date: Tue, 5 Dec 2023 17:25:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: io_uring/cancel.c:303:2-12: second lock on line 307
Message-ID: <202312051726.cxBNsoJv-lkp@intel.com>
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
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 23fffb2f09ce1145cbd751801d45ba74acaa6542 io_uring/cancel: re-grab ctx mutex after finishing wait
date:   12 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-103-20231204 (https://download.01.org/0day-ci/archive/20231205/202312051726.cxBNsoJv-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312051726.cxBNsoJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312051726.cxBNsoJv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/cancel.c:303:2-12: second lock on line 307

vim +303 io_uring/cancel.c

78a861b9495920 Jens Axboe    2022-06-18  232  
78a861b9495920 Jens Axboe    2022-06-18  233  int io_sync_cancel(struct io_ring_ctx *ctx, void __user *arg)
78a861b9495920 Jens Axboe    2022-06-18  234  	__must_hold(&ctx->uring_lock)
78a861b9495920 Jens Axboe    2022-06-18  235  {
78a861b9495920 Jens Axboe    2022-06-18  236  	struct io_cancel_data cd = {
78a861b9495920 Jens Axboe    2022-06-18  237  		.ctx	= ctx,
78a861b9495920 Jens Axboe    2022-06-18  238  		.seq	= atomic_inc_return(&ctx->cancel_seq),
78a861b9495920 Jens Axboe    2022-06-18  239  	};
78a861b9495920 Jens Axboe    2022-06-18  240  	ktime_t timeout = KTIME_MAX;
78a861b9495920 Jens Axboe    2022-06-18  241  	struct io_uring_sync_cancel_reg sc;
78a861b9495920 Jens Axboe    2022-06-18  242  	struct fd f = { };
78a861b9495920 Jens Axboe    2022-06-18  243  	DEFINE_WAIT(wait);
78a861b9495920 Jens Axboe    2022-06-18  244  	int ret;
78a861b9495920 Jens Axboe    2022-06-18  245  
78a861b9495920 Jens Axboe    2022-06-18  246  	if (copy_from_user(&sc, arg, sizeof(sc)))
78a861b9495920 Jens Axboe    2022-06-18  247  		return -EFAULT;
78a861b9495920 Jens Axboe    2022-06-18  248  	if (sc.flags & ~CANCEL_FLAGS)
78a861b9495920 Jens Axboe    2022-06-18  249  		return -EINVAL;
78a861b9495920 Jens Axboe    2022-06-18  250  	if (sc.pad[0] || sc.pad[1] || sc.pad[2] || sc.pad[3])
78a861b9495920 Jens Axboe    2022-06-18  251  		return -EINVAL;
78a861b9495920 Jens Axboe    2022-06-18  252  
78a861b9495920 Jens Axboe    2022-06-18  253  	cd.data = sc.addr;
78a861b9495920 Jens Axboe    2022-06-18  254  	cd.flags = sc.flags;
78a861b9495920 Jens Axboe    2022-06-18  255  
78a861b9495920 Jens Axboe    2022-06-18  256  	/* we can grab a normal file descriptor upfront */
78a861b9495920 Jens Axboe    2022-06-18  257  	if ((cd.flags & IORING_ASYNC_CANCEL_FD) &&
78a861b9495920 Jens Axboe    2022-06-18  258  	   !(cd.flags & IORING_ASYNC_CANCEL_FD_FIXED)) {
78a861b9495920 Jens Axboe    2022-06-18  259  		f = fdget(sc.fd);
78a861b9495920 Jens Axboe    2022-06-18  260  		if (!f.file)
78a861b9495920 Jens Axboe    2022-06-18  261  			return -EBADF;
78a861b9495920 Jens Axboe    2022-06-18  262  		cd.file = f.file;
78a861b9495920 Jens Axboe    2022-06-18  263  	}
78a861b9495920 Jens Axboe    2022-06-18  264  
78a861b9495920 Jens Axboe    2022-06-18  265  	ret = __io_sync_cancel(current->io_uring, &cd, sc.fd);
78a861b9495920 Jens Axboe    2022-06-18  266  
78a861b9495920 Jens Axboe    2022-06-18  267  	/* found something, done! */
78a861b9495920 Jens Axboe    2022-06-18  268  	if (ret != -EALREADY)
78a861b9495920 Jens Axboe    2022-06-18  269  		goto out;
78a861b9495920 Jens Axboe    2022-06-18  270  
78a861b9495920 Jens Axboe    2022-06-18  271  	if (sc.timeout.tv_sec != -1UL || sc.timeout.tv_nsec != -1UL) {
78a861b9495920 Jens Axboe    2022-06-18  272  		struct timespec64 ts = {
78a861b9495920 Jens Axboe    2022-06-18  273  			.tv_sec		= sc.timeout.tv_sec,
78a861b9495920 Jens Axboe    2022-06-18  274  			.tv_nsec	= sc.timeout.tv_nsec
78a861b9495920 Jens Axboe    2022-06-18  275  		};
78a861b9495920 Jens Axboe    2022-06-18  276  
78a861b9495920 Jens Axboe    2022-06-18  277  		timeout = ktime_add_ns(timespec64_to_ktime(ts), ktime_get_ns());
78a861b9495920 Jens Axboe    2022-06-18  278  	}
78a861b9495920 Jens Axboe    2022-06-18  279  
78a861b9495920 Jens Axboe    2022-06-18  280  	/*
78a861b9495920 Jens Axboe    2022-06-18  281  	 * Keep looking until we get -ENOENT. we'll get woken everytime
78a861b9495920 Jens Axboe    2022-06-18  282  	 * every time a request completes and will retry the cancelation.
78a861b9495920 Jens Axboe    2022-06-18  283  	 */
78a861b9495920 Jens Axboe    2022-06-18  284  	do {
78a861b9495920 Jens Axboe    2022-06-18  285  		cd.seq = atomic_inc_return(&ctx->cancel_seq);
78a861b9495920 Jens Axboe    2022-06-18  286  
78a861b9495920 Jens Axboe    2022-06-18  287  		prepare_to_wait(&ctx->cq_wait, &wait, TASK_INTERRUPTIBLE);
78a861b9495920 Jens Axboe    2022-06-18  288  
78a861b9495920 Jens Axboe    2022-06-18  289  		ret = __io_sync_cancel(current->io_uring, &cd, sc.fd);
78a861b9495920 Jens Axboe    2022-06-18  290  
23fffb2f09ce11 Jens Axboe    2022-12-21  291  		mutex_unlock(&ctx->uring_lock);
78a861b9495920 Jens Axboe    2022-06-18  292  		if (ret != -EALREADY)
78a861b9495920 Jens Axboe    2022-06-18  293  			break;
78a861b9495920 Jens Axboe    2022-06-18  294  
c0e0d6ba25f180 Dylan Yudaken 2022-08-30  295  		ret = io_run_task_work_sig(ctx);
23fffb2f09ce11 Jens Axboe    2022-12-21  296  		if (ret < 0)
78a861b9495920 Jens Axboe    2022-06-18  297  			break;
78a861b9495920 Jens Axboe    2022-06-18  298  		ret = schedule_hrtimeout(&timeout, HRTIMER_MODE_ABS);
78a861b9495920 Jens Axboe    2022-06-18  299  		if (!ret) {
78a861b9495920 Jens Axboe    2022-06-18  300  			ret = -ETIME;
78a861b9495920 Jens Axboe    2022-06-18  301  			break;
78a861b9495920 Jens Axboe    2022-06-18  302  		}
23fffb2f09ce11 Jens Axboe    2022-12-21 @303  		mutex_lock(&ctx->uring_lock);
78a861b9495920 Jens Axboe    2022-06-18  304  	} while (1);
78a861b9495920 Jens Axboe    2022-06-18  305  
78a861b9495920 Jens Axboe    2022-06-18  306  	finish_wait(&ctx->cq_wait, &wait);
23fffb2f09ce11 Jens Axboe    2022-12-21 @307  	mutex_lock(&ctx->uring_lock);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
