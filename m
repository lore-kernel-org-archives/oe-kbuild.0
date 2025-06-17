Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C352D9EFD
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jun 2025 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750157725; cv=none; b=I1F+L2qsHsg8ChxaJZnURWHjhCx/vUxVWukIRrVnqznn7OLdT6kG5yvcxNiVkq4gd3NIwcflgeRDptVQOGwFYt+vOEajQ+zefg+I4qZqxXwoES8AJ2TIpPdWouw/54cw+LfOCuzBwtXT9qBy3LQAYlQ3YrjQcSIyxmmGQOwIEi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750157725; c=relaxed/simple;
	bh=EoRpgNxmuCdXZg6Pp6sYBA8CPmOc3XKqiUxHSjALv3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJ+zDYOPn5znenJqy9CrnQgSX03bTt7X5e5P6ix4WOZpl/9KjLlmrp8G4rj5HK9aATQqlt14/nM8mB6e3Zq2/+FsgyoPTHXHSs+5j591HQThjoO5H6xltpJkG2ZrDh9rDf0EjqT319maP40fSPogg5OzKtCQ/x5miUv1CZy+za4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROQvn7md; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROQvn7md"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750157723; x=1781693723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EoRpgNxmuCdXZg6Pp6sYBA8CPmOc3XKqiUxHSjALv3A=;
  b=ROQvn7mdv6gnTlHD4CtswP1gtUQ18ubsEV22xb0JLQrKV5YlWWvvg0if
   ljtFjcVL4AVH94qdHQWei580Gurf3XdihUBhHdCARFOon7LkUNMZRsb+z
   pM9tiJZW59ovTn6lqWXyre02MeLHg1q/FcWqTSZv5BH14cN8DoshbJncG
   1hqt3Yy6Ro4QRoWPG76D/jGX1UjQmbuz/NlUGAx5Tnk5gnu9+tFYtxrMd
   Xnq4qjWbe+x5X7XiEgStFMh3+TaEOHskMWlqsvgWbg7121GZd+MFrxIrX
   0z1sOWzDgDw1ExM/annqFm+UyzS2E/kA4oQaaXCVAlldVbTj/agBszf7z
   g==;
X-CSE-ConnectionGUID: NWwl79xgQzmpwKCGpQa3Iw==
X-CSE-MsgGUID: ziH92G3BTDqn6y7iPGnPEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54943293"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="54943293"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 03:55:21 -0700
X-CSE-ConnectionGUID: lwZcx7+2RAyI97a1OmzEBA==
X-CSE-MsgGUID: ENQkfsBFQa6wdAX3/dm5QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="149109955"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jun 2025 03:55:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRTyG-000Fu6-2k;
	Tue, 17 Jun 2025 10:55:16 +0000
Date: Tue, 17 Jun 2025 18:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:io_uring-defer-tw.3 2/6] io_uring/io_uring.c:1319
 __io_run_local_work() error: uninitialized symbol 'limit'.
Message-ID: <202506171800.DmS6A5Kk-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-defer-tw.3
head:   72dca7c06951833c040a26f09385b0d936e29bcc
commit: 6b0b61ad1d57fb323c15925dcdbbc80d0b820b97 [2/6] io_uring: replace defer task_work llist with io_wq_work_list
:::::: branch date: 11 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-141-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171800.DmS6A5Kk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506171800.DmS6A5Kk-lkp@intel.com/

New smatch warnings:
io_uring/io_uring.c:1319 __io_run_local_work() error: uninitialized symbol 'limit'.

Old smatch warnings:
io_uring/io_uring.c:1937 io_file_get_normal() warn: fd re-used after fget(): 'fd'

vim +/limit +1319 io_uring/io_uring.c

9fe3eaea4a3530 Jens Axboe          2024-01-31  1289  
bcf8a0293a019b Caleb Sander Mateos 2025-02-16  1290  static int __io_run_local_work(struct io_ring_ctx *ctx, io_tw_token_t tw,
49c5c63d48eb5b Jens Axboe          2024-11-26  1291  			       int min_events, int max_events)
c0e0d6ba25f180 Dylan Yudaken       2022-08-30  1292  {
6b0b61ad1d57fb Jens Axboe          2024-11-21  1293  	struct io_wq_work_node *node, *tail;
6b0b61ad1d57fb Jens Axboe          2024-11-21  1294  	int ret = 0, limit, nitems;
c3f4d39ee4bc06 Pavel Begunkov      2023-01-09  1295  	unsigned int loops = 0;
c0e0d6ba25f180 Dylan Yudaken       2022-08-30  1296  
140102ae9a9f2f Pavel Begunkov      2023-01-05  1297  	if (WARN_ON_ONCE(ctx->submitter_task != current))
c0e0d6ba25f180 Dylan Yudaken       2022-08-30  1298  		return -EEXIST;
c3f4d39ee4bc06 Pavel Begunkov      2023-01-09  1299  	if (ctx->flags & IORING_SETUP_TASKRUN_FLAG)
c3f4d39ee4bc06 Pavel Begunkov      2023-01-09  1300  		atomic_andnot(IORING_SQ_TASKRUN, &ctx->rings->sq_flags);
c0e0d6ba25f180 Dylan Yudaken       2022-08-30  1301  again:
49c5c63d48eb5b Jens Axboe          2024-11-26  1302  	min_events -= ret;
6b0b61ad1d57fb Jens Axboe          2024-11-21  1303  	spin_lock_irq(&ctx->work_lock);
6b0b61ad1d57fb Jens Axboe          2024-11-21  1304  	node = ctx->work_list.first;
6b0b61ad1d57fb Jens Axboe          2024-11-21  1305  	tail = ctx->work_list.last;
6b0b61ad1d57fb Jens Axboe          2024-11-21  1306  	nitems = ctx->work_items;
6b0b61ad1d57fb Jens Axboe          2024-11-21  1307  	INIT_WQ_LIST(&ctx->work_list);
6b0b61ad1d57fb Jens Axboe          2024-11-21  1308  	ctx->work_items = 0;
6b0b61ad1d57fb Jens Axboe          2024-11-21  1309  	spin_unlock_irq(&ctx->work_lock);
6b0b61ad1d57fb Jens Axboe          2024-11-21  1310  
6b0b61ad1d57fb Jens Axboe          2024-11-21  1311  	while (node) {
6b0b61ad1d57fb Jens Axboe          2024-11-21  1312  		struct io_kiocb *req = container_of(node, struct io_kiocb,
6b0b61ad1d57fb Jens Axboe          2024-11-21  1313  						    io_task_work.work_node);
6b0b61ad1d57fb Jens Axboe          2024-11-21  1314  		node = node->next;
6b0b61ad1d57fb Jens Axboe          2024-11-21  1315  		INDIRECT_CALL_2(req->io_task_work.func,
6b0b61ad1d57fb Jens Axboe          2024-11-21  1316  				io_poll_task_func, io_req_rw_complete,
6b0b61ad1d57fb Jens Axboe          2024-11-21  1317  				req, tw);
6b0b61ad1d57fb Jens Axboe          2024-11-21  1318  		nitems--;
6b0b61ad1d57fb Jens Axboe          2024-11-21 @1319  		if (++ret >= limit)
6b0b61ad1d57fb Jens Axboe          2024-11-21  1320  			break;
6b0b61ad1d57fb Jens Axboe          2024-11-21  1321  	}
6b0b61ad1d57fb Jens Axboe          2024-11-21  1322  
6b0b61ad1d57fb Jens Axboe          2024-11-21  1323  	if (unlikely(node)) {
6b0b61ad1d57fb Jens Axboe          2024-11-21  1324  		spin_lock_irq(&ctx->work_lock);
6b0b61ad1d57fb Jens Axboe          2024-11-21  1325  		tail->next = ctx->work_list.first;
6b0b61ad1d57fb Jens Axboe          2024-11-21  1326  		ctx->work_list.first = node;
6b0b61ad1d57fb Jens Axboe          2024-11-21  1327  		if (!ctx->work_list.last)
6b0b61ad1d57fb Jens Axboe          2024-11-21  1328  			ctx->work_list.last = tail;
6b0b61ad1d57fb Jens Axboe          2024-11-21  1329  		ctx->work_items += nitems;
6b0b61ad1d57fb Jens Axboe          2024-11-21  1330  		spin_unlock_irq(&ctx->work_lock);
f46b9cdb22f7a1 David Wei           2024-11-20  1331  		goto retry_done;
6b0b61ad1d57fb Jens Axboe          2024-11-21  1332  	}
f46b9cdb22f7a1 David Wei           2024-11-20  1333  
f75d5036d04cd5 Dylan Yudaken       2022-08-30  1334  	loops++;
c0e0d6ba25f180 Dylan Yudaken       2022-08-30  1335  
9fe3eaea4a3530 Jens Axboe          2024-01-31  1336  	if (io_run_local_work_continue(ctx, ret, min_events))
c3f4d39ee4bc06 Pavel Begunkov      2023-01-09  1337  		goto again;
f46b9cdb22f7a1 David Wei           2024-11-20  1338  retry_done:
c0e0d6ba25f180 Dylan Yudaken       2022-08-30  1339  	io_submit_flush_completions(ctx);
9fe3eaea4a3530 Jens Axboe          2024-01-31  1340  	if (io_run_local_work_continue(ctx, ret, min_events))
b0b7a7d24b6610 Pavel Begunkov      2023-01-16  1341  		goto again;
9fe3eaea4a3530 Jens Axboe          2024-01-31  1342  
f75d5036d04cd5 Dylan Yudaken       2022-08-30  1343  	trace_io_uring_local_work_run(ctx, ret, loops);
c0e0d6ba25f180 Dylan Yudaken       2022-08-30  1344  	return ret;
8ac5d85a89b482 Jens Axboe          2022-09-03  1345  }
8ac5d85a89b482 Jens Axboe          2022-09-03  1346  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
