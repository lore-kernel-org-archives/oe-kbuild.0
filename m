Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7747A318146
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664083; cv=none; b=DPfaHR15SS6NMMEtcDecZBTVgPOfO8kMO5XgxcqYUpibdfULkYtv8k3S0+3ngaTSzAuSdJuKHV4CZfq4imEjtwa2b8i+INtmCEPnFwpC+pDHhTIBrKav4C4WyeydcFhVu/Q4LQ7lsgFO0UrmHsuGXmb14xvlPE0JQsh+vOkjxos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664083; c=relaxed/simple;
	bh=VkgOg4jJAd5FcK+0zr0Br1+wIOkr5lIwZyhc66CyA8k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nGel4nMc6TlTWtcbOxqtGhYNXYdY9i9w583GNwrSdp6FBIptCkWRCFbXQdUGKn05xUHA3ppCGENMc/jcZ3mDS8bd1JmbQz3dMNo4u1dvkrcjxppVkpwN+MrOAKoveMj3x7//41RkIXSDGwQQaO2OR6rtCetEL+xF+0fnmKahPao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CejkvvqQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CejkvvqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780664082; x=1812200082;
  h=date:from:to:cc:subject:message-id;
  bh=VkgOg4jJAd5FcK+0zr0Br1+wIOkr5lIwZyhc66CyA8k=;
  b=CejkvvqQFDvBWkpNO6Aqtxmq95eHYmnKnDoSn+mCsKkvHdAEujotXL9p
   7dGvfuizWPBFv+YMQDgRbYgVza3JV99XmL0W3+zugoJJEmrrFdNJlh+SP
   EHzdzdoWAm5f/E66yCSSYueKnCpMfwnpl+T/kzUdD7ZdO7WK3JkyvBz0w
   EfrebV/lxvTKFAR2E5e6URR3zqmBoyn6QsPptte5zYyXlgstm+ZzdpmQ0
   Qyq6x4p4GW19qS6XjmubdiIjqP2TA7nrELoBdF+lRcvBHONmsz4HbYLqd
   YP0r6tQcXPb5L8a1rDSTGAnOi963DAhx7RNk8QyVO39/z+ylQIEgE/Y9i
   A==;
X-CSE-ConnectionGUID: qxxCOAlVR7yi3a8AovRQoQ==
X-CSE-MsgGUID: CyTG2Ze0Q3KrtGd219R8lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="99069313"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="99069313"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 05:54:42 -0700
X-CSE-ConnectionGUID: W8RM7xObQXeTWSwatDBhKA==
X-CSE-MsgGUID: ft8IzWm0RT6izDXWeMdpvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="242360912"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 05:54:41 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVU4M-00000000G0A-2GuB;
	Fri, 05 Jun 2026 12:54:38 +0000
Date: Fri, 05 Jun 2026 20:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: io_uring/loop.c:50:3-9: preceding lock on line 67
Message-ID: <202606052058.KpmWpKnd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pavel Begunkov <asml.silence@gmail.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ddd664bbff63e09e7a7f9acae9c43605d4cf185f
commit: 033af2b3eb19c5ed96825572105bca3611635ada io_uring: introduce callback driven main loop
date:   3 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-r063-20260604 (https://download.01.org/0day-ci/archive/20260605/202606052058.KpmWpKnd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 033af2b3eb19 ("io_uring: introduce callback driven main loop")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606052058.KpmWpKnd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/loop.c:50:3-9: preceding lock on line 67
   io_uring/loop.c:56:3-9: preceding lock on line 67
   io_uring/loop.c:70:3-9: preceding lock on line 67

vim +50 io_uring/loop.c

033af2b3eb19c5 Pavel Begunkov 2026-02-26  41  
033af2b3eb19c5 Pavel Begunkov 2026-02-26  42  static int __io_run_loop(struct io_ring_ctx *ctx)
033af2b3eb19c5 Pavel Begunkov 2026-02-26  43  {
033af2b3eb19c5 Pavel Begunkov 2026-02-26  44  	struct iou_loop_params lp = {};
033af2b3eb19c5 Pavel Begunkov 2026-02-26  45  
033af2b3eb19c5 Pavel Begunkov 2026-02-26  46  	while (true) {
033af2b3eb19c5 Pavel Begunkov 2026-02-26  47  		int nr_wait, step_res;
033af2b3eb19c5 Pavel Begunkov 2026-02-26  48  
033af2b3eb19c5 Pavel Begunkov 2026-02-26  49  		if (unlikely(!ctx->loop_step))
033af2b3eb19c5 Pavel Begunkov 2026-02-26 @50  			return -EFAULT;
033af2b3eb19c5 Pavel Begunkov 2026-02-26  51  
033af2b3eb19c5 Pavel Begunkov 2026-02-26  52  		step_res = ctx->loop_step(ctx, &lp);
033af2b3eb19c5 Pavel Begunkov 2026-02-26  53  		if (step_res == IOU_LOOP_STOP)
033af2b3eb19c5 Pavel Begunkov 2026-02-26  54  			break;
033af2b3eb19c5 Pavel Begunkov 2026-02-26  55  		if (step_res != IOU_LOOP_CONTINUE)
033af2b3eb19c5 Pavel Begunkov 2026-02-26  56  			return -EINVAL;
033af2b3eb19c5 Pavel Begunkov 2026-02-26  57  
033af2b3eb19c5 Pavel Begunkov 2026-02-26  58  		nr_wait = io_loop_nr_cqes(ctx, &lp);
033af2b3eb19c5 Pavel Begunkov 2026-02-26  59  		if (nr_wait > 0)
033af2b3eb19c5 Pavel Begunkov 2026-02-26  60  			io_loop_wait(ctx, &lp, nr_wait);
033af2b3eb19c5 Pavel Begunkov 2026-02-26  61  		else
033af2b3eb19c5 Pavel Begunkov 2026-02-26  62  			nr_wait = 0;
033af2b3eb19c5 Pavel Begunkov 2026-02-26  63  
033af2b3eb19c5 Pavel Begunkov 2026-02-26  64  		if (task_work_pending(current)) {
033af2b3eb19c5 Pavel Begunkov 2026-02-26  65  			mutex_unlock(&ctx->uring_lock);
033af2b3eb19c5 Pavel Begunkov 2026-02-26  66  			io_run_task_work();
033af2b3eb19c5 Pavel Begunkov 2026-02-26 @67  			mutex_lock(&ctx->uring_lock);
033af2b3eb19c5 Pavel Begunkov 2026-02-26  68  		}
033af2b3eb19c5 Pavel Begunkov 2026-02-26  69  		if (unlikely(task_sigpending(current)))
033af2b3eb19c5 Pavel Begunkov 2026-02-26  70  			return -EINTR;
033af2b3eb19c5 Pavel Begunkov 2026-02-26  71  		io_run_local_work_locked(ctx, nr_wait);
033af2b3eb19c5 Pavel Begunkov 2026-02-26  72  
033af2b3eb19c5 Pavel Begunkov 2026-02-26  73  		if (READ_ONCE(ctx->check_cq) & BIT(IO_CHECK_CQ_OVERFLOW_BIT))
033af2b3eb19c5 Pavel Begunkov 2026-02-26  74  			io_cqring_overflow_flush_locked(ctx);
033af2b3eb19c5 Pavel Begunkov 2026-02-26  75  	}
033af2b3eb19c5 Pavel Begunkov 2026-02-26  76  
033af2b3eb19c5 Pavel Begunkov 2026-02-26  77  	return 0;
033af2b3eb19c5 Pavel Begunkov 2026-02-26  78  }
033af2b3eb19c5 Pavel Begunkov 2026-02-26  79  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
