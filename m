Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0577D3C1D59
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Oct 2026 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377730; cv=none; b=Bi7Awz3ACvNT8qocEbthEThBbqqE1B4mptIllgC8VXqe5y5lrqETBSG2ZE2tyI972vqoFCw5ppi2xDXlmAl2oNpD/IzoKww5Ptj+DDa7yIFSvlmUkMDJOuqDrpCiujjWfXTAGQHxURpOCBo9i9Qq8aJiziXKgUg24PlILa0IgPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377730; c=relaxed/simple;
	bh=EEOQE6BkhJo4zC8/6aLjfzDu2sEmOptWwpCrtReztTM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nkYbB46qzVlmpk6neiIto9Pwlq8b4gXaNuDfAqbIxDPpmua1TI8WZXQB0/lS+LMPj0BOhOJ1lla3SQhrT6YE+jzrFlhJQUrqzZVKgO8TRmD90d0aOCvyspwzUiZ0EVrSsFcEWBmY367N+f7p8K/0tiYxOZrpJO39QDUvfDVd/fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBrQvBqE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBrQvBqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791377719; x=1822913719;
  h=date:from:to:cc:subject:message-id;
  bh=EEOQE6BkhJo4zC8/6aLjfzDu2sEmOptWwpCrtReztTM=;
  b=XBrQvBqEUi1M/l6PFXD2y+CZkaAu/GkYAvzIXtGSfs6MSUdtboUpFt50
   W8nC6vEG9hl1WnlOzmgkGkavmyPtZ6De9l/aaEwxJEHGxsA/MtO0ZyMJk
   YG5+VC/43ZrEaA1blyJ2dcvDyM8zVL3b4wD7C1VuF1ZPy+xM5ij3uZN2V
   l9cNZXdSpsq3fS90OEJ470eozLFdHNvmwd8lua/HYGO0KdGzqB9iu68fo
   ktfSgWDK8qda0niF63c4UAgQnlAaD5VKxBpk+mYfam3RZcrGyHRZ3DGXC
   6bY85SfYuvgK+gledparD2Y+n+7TT60JfVUPVVDN83SyUZPQzK2SWOxY6
   A==;
X-CSE-ConnectionGUID: xHSgUK8KQZSgOGWrZk6lBA==
X-CSE-MsgGUID: S+UvH+05QOa+aIKvMeNntg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="144214"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="144214"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 05:55:19 -0700
X-CSE-ConnectionGUID: sk4G3uG+SoKrUnzVFlGCZg==
X-CSE-MsgGUID: GarXPJKVTq+PLq15JOq+Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280718243"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 07 Oct 2026 05:55:17 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xERAw-000000003GZ-3HYp;
	Wed, 07 Oct 2026 12:55:14 +0000
Date: Wed, 07 Oct 2026 14:55:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18 15/15]
 io_uring/io_uring.c:2802 io_cqring_wait() warn: inconsistent returns
 'rcu_read'.
Message-ID: <202610071443.fPSmPC1O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   4a1ebb4dbbcfe1be0fcf08551de20bba67db04fd
commit: f43f77499ec8de0af0b54d812c5d37f0120aeec1 [15/15] io_uring: protect remaining lockless ctx->rings accesses with RCU
:::::: branch date: 10 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-2200-20261006 (https://download.01.org/0day-ci/archive/20261007/202610071443.fPSmPC1O-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610071443.fPSmPC1O-lkp@intel.com/

New smatch warnings:
io_uring/io_uring.c:2802 io_cqring_wait() warn: inconsistent returns 'rcu_read'.

Old smatch warnings:
io_uring/io_uring.c:2042 io_file_get_normal() warn: fd re-used after fget(): 'fd'

vim +/rcu_read +2802 io_uring/io_uring.c

45a41e74b8f472 io_uring/io_uring.c Jens Axboe      2024-01-04  2666  
2b188cc1bb857a fs/io_uring.c       Jens Axboe      2019-01-07  2667  /*
2b188cc1bb857a fs/io_uring.c       Jens Axboe      2019-01-07  2668   * Wait until events become available, if we don't already have some. The
2b188cc1bb857a fs/io_uring.c       Jens Axboe      2019-01-07  2669   * application must reap them itself, as they reside on the shared cq ring.
2b188cc1bb857a fs/io_uring.c       Jens Axboe      2019-01-07  2670   */
d29cb3726f03cd io_uring/io_uring.c Pavel Begunkov  2024-08-07  2671  static int io_cqring_wait(struct io_ring_ctx *ctx, int min_events, u32 flags,
f42b58e44802b0 io_uring/io_uring.c Jens Axboe      2024-08-15  2672  			  struct ext_arg *ext_arg)
2b188cc1bb857a fs/io_uring.c       Jens Axboe      2019-01-07  2673  {
90291099f24a82 fs/io_uring.c       Pavel Begunkov  2021-08-09  2674  	struct io_wait_queue iowq;
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2675  	struct io_rings *rings;
1100c4a2656d44 io_uring/io_uring.c Jens Axboe      2024-01-04  2676  	ktime_t start_time;
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2677  	int ret, nr_wait;
2b188cc1bb857a fs/io_uring.c       Jens Axboe      2019-01-07  2678  
816619782bdc70 io_uring/io_uring.c Pavel Begunkov  2025-03-24  2679  	min_events = min_t(int, min_events, ctx->cq_entries);
816619782bdc70 io_uring/io_uring.c Pavel Begunkov  2025-03-24  2680  
76de6749d1bc18 io_uring/io_uring.c Pavel Begunkov  2022-09-08  2681  	if (!io_allowed_run_tw(ctx))
76de6749d1bc18 io_uring/io_uring.c Pavel Begunkov  2022-09-08  2682  		return -EEXIST;
40cfe553240b32 io_uring/io_uring.c David Wei       2024-11-20  2683  	if (io_local_work_pending(ctx))
49c5c63d48eb5b io_uring/io_uring.c Jens Axboe      2024-11-26  2684  		io_run_local_work(ctx, min_events,
49c5c63d48eb5b io_uring/io_uring.c Jens Axboe      2024-11-26  2685  				  max(IO_LOCAL_TW_DEFAULT_MAX, min_events));
f36ba6cf1ab6b0 io_uring/io_uring.c Pavel Begunkov  2023-01-05  2686  	io_run_task_work();
408024b959275b io_uring/io_uring.c Pavel Begunkov  2024-04-10  2687  
408024b959275b io_uring/io_uring.c Pavel Begunkov  2024-04-10  2688  	if (unlikely(test_bit(IO_CHECK_CQ_OVERFLOW_BIT, &ctx->check_cq)))
408024b959275b io_uring/io_uring.c Pavel Begunkov  2024-04-10  2689  		io_cqring_do_overflow_flush(ctx);
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2690  
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2691  	rcu_read_lock();
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2692  	rings = io_get_rings(ctx);
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2693  	if (__io_cqring_events_user(ctx) >= min_events) {
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2694  		rcu_read_unlock();
2b188cc1bb857a fs/io_uring.c       Jens Axboe      2019-01-07  2695  		return 0;
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2696  	}
2b188cc1bb857a fs/io_uring.c       Jens Axboe      2019-01-07  2697  
90291099f24a82 fs/io_uring.c       Pavel Begunkov  2021-08-09  2698  	init_waitqueue_func_entry(&iowq.wq, io_wake_function);
90291099f24a82 fs/io_uring.c       Pavel Begunkov  2021-08-09  2699  	iowq.wq.private = current;
90291099f24a82 fs/io_uring.c       Pavel Begunkov  2021-08-09  2700  	INIT_LIST_HEAD(&iowq.wq.entry);
90291099f24a82 fs/io_uring.c       Pavel Begunkov  2021-08-09  2701  	iowq.ctx = ctx;
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2702  	iowq.cq_tail = READ_ONCE(rings->cq.head) + min_events;
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2703  	iowq.cq_min_tail = READ_ONCE(rings->cq.tail);
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2704  	nr_wait = (int) iowq.cq_tail - READ_ONCE(rings->cq.tail);
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2705  	rcu_read_unlock();
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2706  	rings = NULL;
1100c4a2656d44 io_uring/io_uring.c Jens Axboe      2024-01-04  2707  	iowq.nr_timeouts = atomic_read(&ctx->cq_timeouts);
1100c4a2656d44 io_uring/io_uring.c Jens Axboe      2024-01-04  2708  	iowq.hit_timeout = 0;
7ed9e09e2d13d5 io_uring/io_uring.c Jens Axboe      2024-01-04  2709  	iowq.min_timeout = ext_arg->min_time;
d33a39e577687e io_uring/io_uring.c Pavel Begunkov  2023-01-05  2710  	iowq.timeout = KTIME_MAX;
1100c4a2656d44 io_uring/io_uring.c Jens Axboe      2024-01-04  2711  	start_time = io_get_time(ctx);
d33a39e577687e io_uring/io_uring.c Pavel Begunkov  2023-01-05  2712  
0a54a7dd0a12b7 io_uring/io_uring.c Jens Axboe      2024-10-22  2713  	if (ext_arg->ts_set) {
0a54a7dd0a12b7 io_uring/io_uring.c Jens Axboe      2024-10-22  2714  		iowq.timeout = timespec64_to_ktime(ext_arg->ts);
d29cb3726f03cd io_uring/io_uring.c Pavel Begunkov  2024-08-07  2715  		if (!(flags & IORING_ENTER_ABS_TIMER))
1100c4a2656d44 io_uring/io_uring.c Jens Axboe      2024-01-04  2716  			iowq.timeout = ktime_add(iowq.timeout, start_time);
d33a39e577687e io_uring/io_uring.c Pavel Begunkov  2023-01-05  2717  	}
90291099f24a82 fs/io_uring.c       Pavel Begunkov  2021-08-09  2718  
f42b58e44802b0 io_uring/io_uring.c Jens Axboe      2024-08-15  2719  	if (ext_arg->sig) {
978e5c19dfefc2 io_uring/io_uring.c Alexey Izbyshev 2024-04-05  2720  #ifdef CONFIG_COMPAT
978e5c19dfefc2 io_uring/io_uring.c Alexey Izbyshev 2024-04-05  2721  		if (in_compat_syscall())
f42b58e44802b0 io_uring/io_uring.c Jens Axboe      2024-08-15  2722  			ret = set_compat_user_sigmask((const compat_sigset_t __user *)ext_arg->sig,
f42b58e44802b0 io_uring/io_uring.c Jens Axboe      2024-08-15  2723  						      ext_arg->argsz);
978e5c19dfefc2 io_uring/io_uring.c Alexey Izbyshev 2024-04-05  2724  		else
978e5c19dfefc2 io_uring/io_uring.c Alexey Izbyshev 2024-04-05  2725  #endif
f42b58e44802b0 io_uring/io_uring.c Jens Axboe      2024-08-15  2726  			ret = set_user_sigmask(ext_arg->sig, ext_arg->argsz);
978e5c19dfefc2 io_uring/io_uring.c Alexey Izbyshev 2024-04-05  2727  
978e5c19dfefc2 io_uring/io_uring.c Alexey Izbyshev 2024-04-05  2728  		if (ret)
978e5c19dfefc2 io_uring/io_uring.c Alexey Izbyshev 2024-04-05  2729  			return ret;
978e5c19dfefc2 io_uring/io_uring.c Alexey Izbyshev 2024-04-05  2730  	}
978e5c19dfefc2 io_uring/io_uring.c Alexey Izbyshev 2024-04-05  2731  
8d0c12a80cdeb8 io_uring/io_uring.c Stefan Roesch   2023-06-08  2732  	io_napi_busy_loop(ctx, &iowq);
8d0c12a80cdeb8 io_uring/io_uring.c Stefan Roesch   2023-06-08  2733  
c826bd7a743f27 fs/io_uring.c       Dmitrii Dolgov  2019-10-15  2734  	trace_io_uring_cqring_wait(ctx, min_events);
bda521624e75c6 fs/io_uring.c       Jens Axboe      2019-09-24  2735  	do {
3fcf19d592d5cb io_uring/io_uring.c Pavel Begunkov  2023-01-05  2736  		unsigned long check_cq;
3fcf19d592d5cb io_uring/io_uring.c Pavel Begunkov  2023-01-05  2737  
130bd686d9be91 io_uring/io_uring.c Pavel Begunkov  2023-01-09  2738  		if (ctx->flags & IORING_SETUP_DEFER_TASKRUN) {
8751d15426a31b io_uring/io_uring.c Pavel Begunkov  2023-04-06  2739  			atomic_set(&ctx->cq_wait_nr, nr_wait);
130bd686d9be91 io_uring/io_uring.c Pavel Begunkov  2023-01-09  2740  			set_current_state(TASK_INTERRUPTIBLE);
130bd686d9be91 io_uring/io_uring.c Pavel Begunkov  2023-01-09  2741  		} else {
311997b3fcddc2 fs/io_uring.c       Pavel Begunkov  2021-06-14  2742  			prepare_to_wait_exclusive(&ctx->cq_wait, &iowq.wq,
bda521624e75c6 fs/io_uring.c       Jens Axboe      2019-09-24  2743  							TASK_INTERRUPTIBLE);
130bd686d9be91 io_uring/io_uring.c Pavel Begunkov  2023-01-09  2744  		}
130bd686d9be91 io_uring/io_uring.c Pavel Begunkov  2023-01-09  2745  
07754bfd9aee59 io_uring/io_uring.c Jens Axboe      2025-03-14  2746  		ret = io_cqring_wait_schedule(ctx, &iowq, ext_arg, start_time);
130bd686d9be91 io_uring/io_uring.c Pavel Begunkov  2023-01-09  2747  		__set_current_state(TASK_RUNNING);
b4bc35cf8704db io_uring/io_uring.c Pavel Begunkov  2024-01-17  2748  		atomic_set(&ctx->cq_wait_nr, IO_CQ_WAKE_INIT);
d80c0f00d04766 io_uring/io_uring.c Pavel Begunkov  2023-01-09  2749  
846072f16eed3b io_uring/io_uring.c Pavel Begunkov  2023-01-05  2750  		/*
846072f16eed3b io_uring/io_uring.c Pavel Begunkov  2023-01-05  2751  		 * Run task_work after scheduling and before io_should_wake().
846072f16eed3b io_uring/io_uring.c Pavel Begunkov  2023-01-05  2752  		 * If we got woken because of task_work being processed, run it
846072f16eed3b io_uring/io_uring.c Pavel Begunkov  2023-01-05  2753  		 * now rather than let the caller do another wait loop.
846072f16eed3b io_uring/io_uring.c Pavel Begunkov  2023-01-05  2754  		 */
40cfe553240b32 io_uring/io_uring.c David Wei       2024-11-20  2755  		if (io_local_work_pending(ctx))
49c5c63d48eb5b io_uring/io_uring.c Jens Axboe      2024-11-26  2756  			io_run_local_work(ctx, nr_wait, nr_wait);
04beb6e0e08c30 io_uring/io_uring.c Jens Axboe      2024-09-18  2757  		io_run_task_work();
3fcf19d592d5cb io_uring/io_uring.c Pavel Begunkov  2023-01-05  2758  
6ff1407e24e6fd io_uring/io_uring.c Jens Axboe      2024-01-04  2759  		/*
6ff1407e24e6fd io_uring/io_uring.c Jens Axboe      2024-01-04  2760  		 * Non-local task_work will be run on exit to userspace, but
6ff1407e24e6fd io_uring/io_uring.c Jens Axboe      2024-01-04  2761  		 * if we're using DEFER_TASKRUN, then we could have waited
6ff1407e24e6fd io_uring/io_uring.c Jens Axboe      2024-01-04  2762  		 * with a timeout for a number of requests. If the timeout
6ff1407e24e6fd io_uring/io_uring.c Jens Axboe      2024-01-04  2763  		 * hits, we could have some requests ready to process. Ensure
6ff1407e24e6fd io_uring/io_uring.c Jens Axboe      2024-01-04  2764  		 * this break is _after_ we have run task_work, to avoid
6ff1407e24e6fd io_uring/io_uring.c Jens Axboe      2024-01-04  2765  		 * deferring running potentially pending requests until the
6ff1407e24e6fd io_uring/io_uring.c Jens Axboe      2024-01-04  2766  		 * next time we wait for events.
6ff1407e24e6fd io_uring/io_uring.c Jens Axboe      2024-01-04  2767  		 */
6ff1407e24e6fd io_uring/io_uring.c Jens Axboe      2024-01-04  2768  		if (ret < 0)
6ff1407e24e6fd io_uring/io_uring.c Jens Axboe      2024-01-04  2769  			break;
6ff1407e24e6fd io_uring/io_uring.c Jens Axboe      2024-01-04  2770  
3fcf19d592d5cb io_uring/io_uring.c Pavel Begunkov  2023-01-05  2771  		check_cq = READ_ONCE(ctx->check_cq);
3fcf19d592d5cb io_uring/io_uring.c Pavel Begunkov  2023-01-05  2772  		if (unlikely(check_cq)) {
3fcf19d592d5cb io_uring/io_uring.c Pavel Begunkov  2023-01-05  2773  			/* let the caller flush overflows, retry */
326a9e482e2134 io_uring/io_uring.c Pavel Begunkov  2023-01-05  2774  			if (check_cq & BIT(IO_CHECK_CQ_OVERFLOW_BIT))
3fcf19d592d5cb io_uring/io_uring.c Pavel Begunkov  2023-01-05  2775  				io_cqring_do_overflow_flush(ctx);
3fcf19d592d5cb io_uring/io_uring.c Pavel Begunkov  2023-01-05  2776  			if (check_cq & BIT(IO_CHECK_CQ_DROPPED_BIT)) {
3fcf19d592d5cb io_uring/io_uring.c Pavel Begunkov  2023-01-05  2777  				ret = -EBADR;
3fcf19d592d5cb io_uring/io_uring.c Pavel Begunkov  2023-01-05  2778  				break;
3fcf19d592d5cb io_uring/io_uring.c Pavel Begunkov  2023-01-05  2779  			}
3fcf19d592d5cb io_uring/io_uring.c Pavel Begunkov  2023-01-05  2780  		}
3fcf19d592d5cb io_uring/io_uring.c Pavel Begunkov  2023-01-05  2781  
846072f16eed3b io_uring/io_uring.c Pavel Begunkov  2023-01-05  2782  		if (io_should_wake(&iowq)) {
846072f16eed3b io_uring/io_uring.c Pavel Begunkov  2023-01-05  2783  			ret = 0;
35d90f95cfa773 io_uring/io_uring.c Jens Axboe      2022-12-17  2784  			break;
846072f16eed3b io_uring/io_uring.c Pavel Begunkov  2023-01-05  2785  		}
ca0a26511c679a fs/io_uring.c       Jens Axboe      2021-03-04  2786  		cond_resched();
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2787  
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2788  		/* if min timeout has been hit, don't reset wait count */
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2789  		if (!iowq.hit_timeout)
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2790  			scoped_guard(rcu)
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2791  				nr_wait = (int) iowq.cq_tail -
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2792  						READ_ONCE(io_get_rings(ctx)->cq.tail);
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2793  		else
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2794  			nr_wait = 1;
846072f16eed3b io_uring/io_uring.c Pavel Begunkov  2023-01-05  2795  	} while (1);
bda521624e75c6 fs/io_uring.c       Jens Axboe      2019-09-24  2796  
130bd686d9be91 io_uring/io_uring.c Pavel Begunkov  2023-01-09  2797  	if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN))
b4f20bb4e6d55a fs/io_uring.c       Jens Axboe      2022-03-25  2798  		finish_wait(&ctx->cq_wait, &iowq.wq);
b7db41c9e03b51 fs/io_uring.c       Jens Axboe      2020-07-04  2799  	restore_saved_sigmask_unless(ret == -EINTR);
2b188cc1bb857a fs/io_uring.c       Jens Axboe      2019-01-07  2800  
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31  2801  	guard(rcu)();
f43f77499ec8de io_uring/io_uring.c Jens Axboe      2026-03-31 @2802  	return READ_ONCE(io_get_rings(ctx)->cq.head) == READ_ONCE(io_get_rings(ctx)->cq.tail) ? ret : 0;
2b188cc1bb857a fs/io_uring.c       Jens Axboe      2019-01-07  2803  }
2b188cc1bb857a fs/io_uring.c       Jens Axboe      2019-01-07  2804  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
