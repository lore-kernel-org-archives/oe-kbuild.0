Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55F13B8D48
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 23:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997122; cv=none; b=Gt8rMDYLUQaXTHIHNGOT91RQULF1gkAyKZnkIENnd0PnzNXNdf5R0ZdAW11Hqx76e8MZBqHoBsj6Yry4TmvxtGDuDEDi/44I4uG7Bumkmiq35O/+P8eJloq15QXlwMBIfkqh/brEb3eUYg7svFu0bjWKdoPS6uJhRJSz9tCLhro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997122; c=relaxed/simple;
	bh=wP+Lj+QXxA6+d+Omu8fHWw5UmTYUV5KJwmUrKc2nNvQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qFoYh0Ny6jv9zJDTX/X6r7z14IV68/CC6K9rVRXLjcuWyHI0tNJQPAloLyOCLTycI6OLs+DdsvokPH/CiFpnwfi3uSwhXiDSbkb0JyJc7ra7BTgySLSzC2HcwFwL1dwMnD+DOTHLUwvCFRjeEG8ymnyAzSZwsg+hXLM3esdwnSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGV/ugYo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGV/ugYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788997120; x=1820533120;
  h=date:from:to:cc:subject:message-id;
  bh=wP+Lj+QXxA6+d+Omu8fHWw5UmTYUV5KJwmUrKc2nNvQ=;
  b=OGV/ugYosWQ9rqzGMT/oQZgslmwMyEiKOIjIQp2reTO4tBuePnVABazo
   FgdWHHrRmDxl5P9jXrvDO35nh8NfLH2zwTJSXZliQbznRr8aD2yt7ArFM
   fvfd9f078cTRvdC4MnwDiC4Q5h6qZnr3iNqhSmROrqxTo/Iq61strcB7X
   IgM+ERg+yqEx1QVmsmYxyiVegmdwQBtaCeWQdNoenUUOnOjHqw/NCZz2P
   dV2QWdnM6PeC3reHh0OWn9w50F/PZ/MGKDs8ssMAFYy6PUMndtlJSP76j
   0SovzneStmFSzYxg7qjUVyGtLxFEEUpnqJWS+JEPnwdBAUmkrYGaRuTwq
   Q==;
X-CSE-ConnectionGUID: 9W8KqtqtRsemNyfg9XlyOw==
X-CSE-MsgGUID: 0NPwkH7MQluegK5jCUH+sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100795297"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="100795297"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 16:38:40 -0700
X-CSE-ConnectionGUID: UuP/du3+S1mJCpnEBPYDkQ==
X-CSE-MsgGUID: GKDlhC69S6y85/F+X3mPLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="265255340"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2026 16:38:38 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4RsB-0000000014e-3LCA;
	Wed, 09 Sep 2026 23:38:35 +0000
Date: Thu, 10 Sep 2026 07:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:io_uring-thread-handoff.2 11/15]
 io_uring/io_uring.c:2828 __do_sys_io_uring_enter() warn: inconsistent returns
 '&ctx->uring_lock'.
Message-ID: <202609100721.uX7gYHFt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-thread-handoff.2
head:   360bd4c7bd75c8edf89050b3f5820552176ae462
commit: 4aa11821fdac6420f0c73596c2537e56064d7b2d [11/15] io_uring: enable handing submitter identity to an io-wq worker
:::::: branch date: 9 hours ago
:::::: commit date: 32 hours ago
config: parisc-randconfig-r071-20260910 (https://download.01.org/0day-ci/archive/20260910/202609100721.uX7gYHFt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609100721.uX7gYHFt-lkp@intel.com/

smatch warnings:
io_uring/io_uring.c:2828 __do_sys_io_uring_enter() warn: inconsistent returns '&ctx->uring_lock'.
io_uring/io_uring.c:2828 __do_sys_io_uring_enter() warn: inconsistent returns '&ctx->uring_lock'.

vim +2828 io_uring/io_uring.c

1eff5d7b2f1d289 io_uring/io_uring.c Jens Axboe          2026-08-30  2752  
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2753  SYSCALL_DEFINE6(io_uring_enter, unsigned int, fd, u32, to_submit,
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2754  		u32, min_complete, u32, flags, const void __user *, argp,
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2755  		size_t, argsz)
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2756  {
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2757  	struct io_ring_ctx *ctx;
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2758  	struct file *file;
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2759  	long ret;
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2760  
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2761  	if (unlikely(flags & ~IORING_ENTER_FLAGS))
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2762  		return -EINVAL;
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2763  
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2764  	file = io_uring_ctx_get_file(fd, flags & IORING_ENTER_REGISTERED_RING);
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2765  	if (IS_ERR(file))
c5e9f6a96bf7379 io_uring/io_uring.c Jens Axboe          2026-04-08  2766  		return PTR_ERR(file);
73363c262d6a7d2 io_uring/io_uring.c Jens Axboe          2023-11-28  2767  	ctx = file->private_data;
7e84e1c7566a1df fs/io_uring.c       Stefano Garzarella  2020-08-27  2768  	ret = -EBADFD;
7a8737e1132ff07 io_uring/io_uring.c Caleb Sander Mateos 2026-01-05  2769  	/*
7a8737e1132ff07 io_uring/io_uring.c Caleb Sander Mateos 2026-01-05  2770  	 * Keep IORING_SETUP_R_DISABLED check before submitter_task load
7a8737e1132ff07 io_uring/io_uring.c Caleb Sander Mateos 2026-01-05  2771  	 * in io_uring_add_tctx_node() -> __io_uring_add_tctx_node_from_submit()
7a8737e1132ff07 io_uring/io_uring.c Caleb Sander Mateos 2026-01-05  2772  	 */
7a8737e1132ff07 io_uring/io_uring.c Caleb Sander Mateos 2026-01-05  2773  	if (unlikely(smp_load_acquire(&ctx->flags) & IORING_SETUP_R_DISABLED))
7e84e1c7566a1df fs/io_uring.c       Stefano Garzarella  2020-08-27  2774  		goto out;
7e84e1c7566a1df fs/io_uring.c       Stefano Garzarella  2020-08-27  2775  
033af2b3eb19c5e io_uring/io_uring.c Pavel Begunkov      2026-02-26  2776  	if (io_has_loop_ops(ctx)) {
033af2b3eb19c5e io_uring/io_uring.c Pavel Begunkov      2026-02-26  2777  		ret = io_run_loop(ctx);
033af2b3eb19c5e io_uring/io_uring.c Pavel Begunkov      2026-02-26  2778  		goto out;
033af2b3eb19c5e io_uring/io_uring.c Pavel Begunkov      2026-02-26  2779  	}
033af2b3eb19c5e io_uring/io_uring.c Pavel Begunkov      2026-02-26  2780  
6c271ce2f1d572f fs/io_uring.c       Jens Axboe          2019-01-10  2781  	/*
6c271ce2f1d572f fs/io_uring.c       Jens Axboe          2019-01-10  2782  	 * For SQ polling, the thread will do all submissions and completions.
6c271ce2f1d572f fs/io_uring.c       Jens Axboe          2019-01-10  2783  	 * Just return the requested submit count, and wake the thread if
6c271ce2f1d572f fs/io_uring.c       Jens Axboe          2019-01-10  2784  	 * we were asked to.
6c271ce2f1d572f fs/io_uring.c       Jens Axboe          2019-01-10  2785  	 */
b2a9eadab857309 fs/io_uring.c       Jens Axboe          2019-09-12  2786  	ret = 0;
6c271ce2f1d572f fs/io_uring.c       Jens Axboe          2019-01-10  2787  	if (ctx->flags & IORING_SETUP_SQPOLL) {
21f965221e7c426 fs/io_uring.c       Jens Axboe          2021-08-14  2788  		if (unlikely(ctx->sq_data->thread == NULL)) {
041474885e9707a fs/io_uring.c       Stefan Metzmacher   2021-03-07  2789  			ret = -EOWNERDEAD;
5f3f26f98ae484a fs/io_uring.c       Jens Axboe          2021-02-25  2790  			goto out;
21f965221e7c426 fs/io_uring.c       Jens Axboe          2021-08-14  2791  		}
6c271ce2f1d572f fs/io_uring.c       Jens Axboe          2019-01-10  2792  		if (flags & IORING_ENTER_SQ_WAKEUP)
534ca6d684f1fea fs/io_uring.c       Jens Axboe          2020-09-02  2793  			wake_up(&ctx->sq_data->wait);
88b80534f60f5dd io_uring/io_uring.c Quanfa Fu           2023-01-15  2794  		if (flags & IORING_ENTER_SQ_WAIT)
88b80534f60f5dd io_uring/io_uring.c Quanfa Fu           2023-01-15  2795  			io_sqpoll_wait_sq(ctx);
88b80534f60f5dd io_uring/io_uring.c Quanfa Fu           2023-01-15  2796  
3e813c9026720c1 fs/io_uring.c       Dylan Yudaken       2022-04-21  2797  		ret = to_submit;
b2a9eadab857309 fs/io_uring.c       Jens Axboe          2019-09-12  2798  	} else if (to_submit) {
eef51daa72f745b fs/io_uring.c       Pavel Begunkov      2021-06-14  2799  		ret = io_uring_add_tctx_node(ctx);
0f2122045b94624 fs/io_uring.c       Jens Axboe          2020-09-13  2800  		if (unlikely(ret))
0f2122045b94624 fs/io_uring.c       Jens Axboe          2020-09-13  2801  			goto out;
d487b43cd3276e4 fs/io_uring.c       Pavel Begunkov      2022-03-22  2802  
4aa11821fdac642 io_uring/io_uring.c Jens Axboe          2026-08-30  2803  		io_handoff_enter(file, to_submit, min_complete, flags, argp,
4aa11821fdac642 io_uring/io_uring.c Jens Axboe          2026-08-30  2804  				 argsz);
2b188cc1bb857a9 fs/io_uring.c       Jens Axboe          2019-01-07  2805  		mutex_lock(&ctx->uring_lock);
3e813c9026720c1 fs/io_uring.c       Dylan Yudaken       2022-04-21  2806  		ret = io_submit_sqes(ctx, to_submit);
4aa11821fdac642 io_uring/io_uring.c Jens Axboe          2026-08-30  2807  		/*
4aa11821fdac642 io_uring/io_uring.c Jens Axboe          2026-08-30  2808  		 * A blocked issue handed our identity to a worker which
4aa11821fdac642 io_uring/io_uring.c Jens Axboe          2026-08-30  2809  		 * finishes this syscall; the file ref went with it.
4aa11821fdac642 io_uring/io_uring.c Jens Axboe          2026-08-30  2810  		 */
4aa11821fdac642 io_uring/io_uring.c Jens Axboe          2026-08-30  2811  		if (unlikely(ret == -EIOCBQUEUED))
4aa11821fdac642 io_uring/io_uring.c Jens Axboe          2026-08-30  2812  			return io_uring_handoff_worker();
3e813c9026720c1 fs/io_uring.c       Dylan Yudaken       2022-04-21  2813  		if (ret != to_submit) {
2b188cc1bb857a9 fs/io_uring.c       Jens Axboe          2019-01-07  2814  			mutex_unlock(&ctx->uring_lock);
7c504e65206a437 fs/io_uring.c       Pavel Begunkov      2019-12-18  2815  			goto out;
2b188cc1bb857a9 fs/io_uring.c       Jens Axboe          2019-01-07  2816  		}
1eff5d7b2f1d289 io_uring/io_uring.c Jens Axboe          2026-08-30  2817  		ret = io_uring_enter_finish(ctx, ret, min_complete, flags,
1eff5d7b2f1d289 io_uring/io_uring.c Jens Axboe          2026-08-30  2818  					    argp, argsz);
1eff5d7b2f1d289 io_uring/io_uring.c Jens Axboe          2026-08-30  2819  		goto out;
3e813c9026720c1 fs/io_uring.c       Dylan Yudaken       2022-04-21  2820  	}
c73ebb685fb6dfb fs/io_uring.c       Hao Xu              2020-11-03  2821  
1eff5d7b2f1d289 io_uring/io_uring.c Jens Axboe          2026-08-30  2822  	if (flags & IORING_ENTER_GETEVENTS)
1eff5d7b2f1d289 io_uring/io_uring.c Jens Axboe          2026-08-30  2823  		ret = io_uring_getevents(ctx, ret, min_complete, flags, argp,
1eff5d7b2f1d289 io_uring/io_uring.c Jens Axboe          2026-08-30  2824  					 argsz);
7c504e65206a437 fs/io_uring.c       Pavel Begunkov      2019-12-18  2825  out:
73363c262d6a7d2 io_uring/io_uring.c Jens Axboe          2023-11-28  2826  	if (!(flags & IORING_ENTER_REGISTERED_RING))
73363c262d6a7d2 io_uring/io_uring.c Jens Axboe          2023-11-28  2827  		fput(file);
3e813c9026720c1 fs/io_uring.c       Dylan Yudaken       2022-04-21 @2828  	return ret;
2b188cc1bb857a9 fs/io_uring.c       Jens Axboe          2019-01-07  2829  }
2b188cc1bb857a9 fs/io_uring.c       Jens Axboe          2019-01-07  2830  

:::::: The code at line 2828 was first introduced by commit
:::::: 3e813c9026720c1291ef3c91caa2e26f88e28367 io_uring: rework io_uring_enter to simplify return value

:::::: TO: Dylan Yudaken <dylany@fb.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
