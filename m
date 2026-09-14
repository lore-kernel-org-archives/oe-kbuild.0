Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1C13603C0
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789414910; cv=none; b=Bkmsp2Wz6upLbqrLhBWJBGYQUUwreTXF2shSqiqp2ifjuh2LuaxHTN/6fnibLxUiRvzSYrsOqgYz5tgQsPdz5oPpfJLlm2T4O1cNjJqYyc1/g3hzsxAg+IEjphUpeQqrNYJ/ug9W/IpcJJ3s23cDVJ9o8wy33kkyFuWx/mdrlZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789414910; c=relaxed/simple;
	bh=AKWhQz/L/64h0fuVLc9KDWV3XKD5aVZ04yRjYBLgf2w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W49xEEvP0AfMR5OJMysDWL9X3A1o6+Y+t7kbHgjGwUXMpoxFdFRisLt69WZlDxehcUfZajEPhHdfWPhC3pJFHDXEBnxkJrxgh2DOdoIn+hFZrOuhKthxoMiG8/MVGfLSndpcy+HaqjMy14PfAv6qn6btCfBvsliCLmbyjw5kDvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cP7UuCAm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cP7UuCAm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789414908; x=1820950908;
  h=date:from:to:cc:subject:message-id;
  bh=AKWhQz/L/64h0fuVLc9KDWV3XKD5aVZ04yRjYBLgf2w=;
  b=cP7UuCAmh5oHV44yfCtsxHJCfDDOCb/HBZAiOHOGN9UZK1LFLUhBWJeH
   ceUbQOGIPa7OW1sRPMAjCEiDAUAsn+JAG721QFABjHO7gA4+gfs4FrrkU
   7SDYzYT1TxwqAbShthiAxF0+gV82qv/NdEgnqqqU147CIXqKZ8Vgi2+BN
   tJC996Z0OFZwjz2lqX17GbuVC+8lKgBAYtYUKSRXsgAUpUbNUA5uJewUt
   jezu/E6k0hJUca156ZphIC6LUmCDHKgwjLlOTrU0yo1TEa9OpZ7KM28dg
   pq6RxDgUtixwi9LmC65etbaNHYTPhNAu72g7W2G2jhCd1xJF9+rS8THaH
   Q==;
X-CSE-ConnectionGUID: y0W7w6g7RHmeIVkWWLFJoQ==
X-CSE-MsgGUID: aQBXqwW0Q9a6lv2GW5JW8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100437129"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100437129"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 12:41:46 -0700
X-CSE-ConnectionGUID: tNXQbZ5lQMi3xg1KYbBs8A==
X-CSE-MsgGUID: +gNcRK5QRnShQMvfYx70+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311004359"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 14 Sep 2026 12:41:45 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6CYg-000000000H5-1yoG;
	Mon, 14 Sep 2026 19:41:42 +0000
Date: Mon, 14 Sep 2026 21:40:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: io_uring/loop.c:50:3-9: preceding lock on line 67
Message-ID: <202609142107.e7PRqgG5-lkp@intel.com>
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
head:   587858367581b9c55c3690f4e63382ad622719d4
commit: 033af2b3eb19c5ed96825572105bca3611635ada io_uring: introduce callback driven main loop
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-104-20260913 (https://download.01.org/0day-ci/archive/20260914/202609142107.e7PRqgG5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 033af2b3eb19 ("io_uring: introduce callback driven main loop")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609142107.e7PRqgG5-lkp@intel.com/

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
