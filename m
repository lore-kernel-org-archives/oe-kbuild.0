Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61A542B72F
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560037; cv=none; b=CJkOD1plpf7GtsnHcFoXRz4O9lt2lc9r7yrhVHBq/MWJRx/WxPy20mQZUBm8WmTjpKyQ7IwUs8jB3kR+h3Ddg4sv5OexdZFaM+94YvPBo8EwTDJr+OXxeBZQP0BCuRTRtRl4cy3Okc+SpUBAcVgNgqeeD7ybcJHJ1CmWwcPr3sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560037; c=relaxed/simple;
	bh=lVEuXUsW+Xr3uGbx82ys0fgCfs5QugbrKBXEfUl70tE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aOZ6dEx0MQP2fuX/JH5gbSPc+FMLfXjaE80691Z3G3iZxzG9cWNTZ0FuBxRP6RF0SrVyWwkmyhUT4I39kKHvp6K/cKOvXJ46b54z4zBcvrdM7qh1tuorzbtWtJI2h+8pfbL0ZBm243AOkk51ur6ZtbwRgqmYwbkzZBu4UiiiMBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRUnx7uI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRUnx7uI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777560035; x=1809096035;
  h=date:from:to:cc:subject:message-id;
  bh=lVEuXUsW+Xr3uGbx82ys0fgCfs5QugbrKBXEfUl70tE=;
  b=fRUnx7uIbPfe9XAJuaO/d9JhPqTtrTH7Uy2Z1b96ekWG9alZYMBnI4L7
   fa6qKg3vNJl1KITzShEwp/U7vr1PoFz7ZZxZgjbqfY2emVTMCY0HuXmk7
   hM3oStu1+2vruXujFmvrYZQlotNUwX/pDdvLHjARY/xM/87dHuUsryiza
   8kgRV/2xdqd14nz2aJsR0xF+OXUzLEyTKH2HroA+n0f9WS44rq6ePOcBy
   3OqYpp7qZOI8zcAC59vo9ONW8enzi5JOMa0Oxt9APlRD212o3ZngECDdM
   7MHbQ4sCHIcIGVf5biXpYpOQjMqq3oTyXlmyvhIPHouuOs1erjM0zZ1+v
   w==;
X-CSE-ConnectionGUID: 7NNGKi2oQl237I0QErEjYw==
X-CSE-MsgGUID: YZwNHd1+SaWBya+8JzYYoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78565785"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78565785"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 07:40:34 -0700
X-CSE-ConnectionGUID: nBStPnW3Rdmmfvhx4FAr9A==
X-CSE-MsgGUID: 71uSQpC2StmR1tyXc8FU2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="239601060"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Apr 2026 07:40:33 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wISZ4-00000000CUA-0ykQ;
	Thu, 30 Apr 2026 14:40:30 +0000
Date: Thu, 30 Apr 2026 22:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: io_uring/register.c:615 io_register_resize_rings() warn:
 potential spectre issue 'n.sq_sqes' [r]
Message-ID: <202604302233.EYzmnaKW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>
CC: Gabriel Krisman Bertazi <krisman@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e75a43c7cec459a07d91ed17de4de13ede2b7758
commit: 45cd95763e198d74d369ede43aef0b1955b8dea4 io_uring/register: fix ring resizing with mixed/large SQEs/CQEs
date:   9 days ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-r071-20260430 (https://download.01.org/0day-ci/archive/20260430/202604302233.EYzmnaKW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 45cd95763e19 ("io_uring/register: fix ring resizing with mixed/large SQEs/CQEs")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604302233.EYzmnaKW-lkp@intel.com/

smatch warnings:
io_uring/register.c:615 io_register_resize_rings() warn: potential spectre issue 'n.sq_sqes' [r]
io_uring/register.c:645 io_register_resize_rings() warn: potential spectre issue 'n.rings->cqes' [r]

vim +615 io_uring/register.c

79cfe9e59c2a12 Jens Axboe     2024-10-21  486  
79cfe9e59c2a12 Jens Axboe     2024-10-21  487  #define swap_old(ctx, o, n, field)		\
79cfe9e59c2a12 Jens Axboe     2024-10-21  488  	do {					\
79cfe9e59c2a12 Jens Axboe     2024-10-21  489  		(o).field = (ctx)->field;	\
79cfe9e59c2a12 Jens Axboe     2024-10-21  490  		(ctx)->field = (n).field;	\
79cfe9e59c2a12 Jens Axboe     2024-10-21  491  	} while (0)
79cfe9e59c2a12 Jens Axboe     2024-10-21  492  
79cfe9e59c2a12 Jens Axboe     2024-10-21  493  #define RESIZE_FLAGS	(IORING_SETUP_CQSIZE | IORING_SETUP_CLAMP)
79cfe9e59c2a12 Jens Axboe     2024-10-21  494  #define COPY_FLAGS	(IORING_SETUP_NO_SQARRAY | IORING_SETUP_SQE128 | \
e26dca67fde194 Jens Axboe     2025-08-07  495  			 IORING_SETUP_CQE32 | IORING_SETUP_NO_MMAP | \
1cba30bf9fdd6c Keith Busch    2025-10-16  496  			 IORING_SETUP_CQE_MIXED | IORING_SETUP_SQE_MIXED)
79cfe9e59c2a12 Jens Axboe     2024-10-21  497  
79cfe9e59c2a12 Jens Axboe     2024-10-21  498  static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user *arg)
79cfe9e59c2a12 Jens Axboe     2024-10-21  499  {
0f4b537363cb66 Pavel Begunkov 2025-11-12  500  	struct io_ctx_config config;
8078486e1d5359 Pavel Begunkov 2024-11-29  501  	struct io_uring_region_desc rd;
79cfe9e59c2a12 Jens Axboe     2024-10-21  502  	struct io_ring_ctx_rings o = { }, n = { }, *to_free = NULL;
6f7a644eb7db10 Jens Axboe     2025-01-15  503  	unsigned i, tail, old_head;
0f4b537363cb66 Pavel Begunkov 2025-11-12  504  	struct io_uring_params *p = &config.p;
f779ac0b878485 Jens Axboe     2025-11-18  505  	struct io_rings_layout *rl = &config.layout;
79cfe9e59c2a12 Jens Axboe     2024-10-21  506  	int ret;
79cfe9e59c2a12 Jens Axboe     2024-10-21  507  
0f4b537363cb66 Pavel Begunkov 2025-11-12  508  	memset(&config, 0, sizeof(config));
0f4b537363cb66 Pavel Begunkov 2025-11-12  509  
c261e4f1dd29fa Jens Axboe     2024-12-19  510  	/* limited to DEFER_TASKRUN for now */
c261e4f1dd29fa Jens Axboe     2024-12-19  511  	if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN))
c261e4f1dd29fa Jens Axboe     2024-12-19  512  		return -EINVAL;
929dbbb699110c Pavel Begunkov 2025-11-12  513  	if (copy_from_user(p, arg, sizeof(*p)))
79cfe9e59c2a12 Jens Axboe     2024-10-21  514  		return -EFAULT;
929dbbb699110c Pavel Begunkov 2025-11-12  515  	if (p->flags & ~RESIZE_FLAGS)
79cfe9e59c2a12 Jens Axboe     2024-10-21  516  		return -EINVAL;
79cfe9e59c2a12 Jens Axboe     2024-10-21  517  
79cfe9e59c2a12 Jens Axboe     2024-10-21  518  	/* properties that are always inherited */
929dbbb699110c Pavel Begunkov 2025-11-12  519  	p->flags |= (ctx->flags & COPY_FLAGS);
79cfe9e59c2a12 Jens Axboe     2024-10-21  520  
0f4b537363cb66 Pavel Begunkov 2025-11-12  521  	ret = io_prepare_config(&config);
79cfe9e59c2a12 Jens Axboe     2024-10-21  522  	if (unlikely(ret))
79cfe9e59c2a12 Jens Axboe     2024-10-21  523  		return ret;
79cfe9e59c2a12 Jens Axboe     2024-10-21  524  
81a4058e0cd0f0 Pavel Begunkov 2024-11-29  525  	memset(&rd, 0, sizeof(rd));
001b76b7e75576 Pavel Begunkov 2025-11-12  526  	rd.size = PAGE_ALIGN(rl->rings_size);
929dbbb699110c Pavel Begunkov 2025-11-12  527  	if (p->flags & IORING_SETUP_NO_MMAP) {
929dbbb699110c Pavel Begunkov 2025-11-12  528  		rd.user_addr = p->cq_off.user_addr;
81a4058e0cd0f0 Pavel Begunkov 2024-11-29  529  		rd.flags |= IORING_MEM_REGION_TYPE_USER;
81a4058e0cd0f0 Pavel Begunkov 2024-11-29  530  	}
4c53e392a194f2 Pavel Begunkov 2025-10-16  531  	ret = io_create_region(ctx, &n.ring_region, &rd, IORING_OFF_CQ_RING);
6e9752977caa47 Pavel Begunkov 2025-10-16  532  	if (ret)
81a4058e0cd0f0 Pavel Begunkov 2024-11-29  533  		return ret;
6e9752977caa47 Pavel Begunkov 2025-10-16  534  
81a4058e0cd0f0 Pavel Begunkov 2024-11-29  535  	n.rings = io_region_get_ptr(&n.ring_region);
79cfe9e59c2a12 Jens Axboe     2024-10-21  536  
2c5aae129f427f Jens Axboe     2025-01-15  537  	/*
2c5aae129f427f Jens Axboe     2025-01-15  538  	 * At this point n.rings is shared with userspace, just like o.rings
2c5aae129f427f Jens Axboe     2025-01-15  539  	 * is as well. While we don't expect userspace to modify it while
2c5aae129f427f Jens Axboe     2025-01-15  540  	 * a resize is in progress, and it's most likely that userspace will
2c5aae129f427f Jens Axboe     2025-01-15  541  	 * shoot itself in the foot if it does, we can't always assume good
2c5aae129f427f Jens Axboe     2025-01-15  542  	 * intent... Use read/write once helpers from here on to indicate the
2c5aae129f427f Jens Axboe     2025-01-15  543  	 * shared nature of it.
2c5aae129f427f Jens Axboe     2025-01-15  544  	 */
929dbbb699110c Pavel Begunkov 2025-11-12  545  	WRITE_ONCE(n.rings->sq_ring_mask, p->sq_entries - 1);
929dbbb699110c Pavel Begunkov 2025-11-12  546  	WRITE_ONCE(n.rings->cq_ring_mask, p->cq_entries - 1);
929dbbb699110c Pavel Begunkov 2025-11-12  547  	WRITE_ONCE(n.rings->sq_ring_entries, p->sq_entries);
929dbbb699110c Pavel Begunkov 2025-11-12  548  	WRITE_ONCE(n.rings->cq_ring_entries, p->cq_entries);
79cfe9e59c2a12 Jens Axboe     2024-10-21  549  
929dbbb699110c Pavel Begunkov 2025-11-12  550  	if (copy_to_user(arg, p, sizeof(*p))) {
0c89dbbcadf126 Pavel Begunkov 2025-10-16  551  		io_register_free_rings(ctx, &n);
79cfe9e59c2a12 Jens Axboe     2024-10-21  552  		return -EFAULT;
79cfe9e59c2a12 Jens Axboe     2024-10-21  553  	}
79cfe9e59c2a12 Jens Axboe     2024-10-21  554  
8078486e1d5359 Pavel Begunkov 2024-11-29  555  	memset(&rd, 0, sizeof(rd));
001b76b7e75576 Pavel Begunkov 2025-11-12  556  	rd.size = PAGE_ALIGN(rl->sq_size);
929dbbb699110c Pavel Begunkov 2025-11-12  557  	if (p->flags & IORING_SETUP_NO_MMAP) {
929dbbb699110c Pavel Begunkov 2025-11-12  558  		rd.user_addr = p->sq_off.user_addr;
8078486e1d5359 Pavel Begunkov 2024-11-29  559  		rd.flags |= IORING_MEM_REGION_TYPE_USER;
79cfe9e59c2a12 Jens Axboe     2024-10-21  560  	}
4c53e392a194f2 Pavel Begunkov 2025-10-16  561  	ret = io_create_region(ctx, &n.sq_region, &rd, IORING_OFF_SQES);
8078486e1d5359 Pavel Begunkov 2024-11-29  562  	if (ret) {
0c89dbbcadf126 Pavel Begunkov 2025-10-16  563  		io_register_free_rings(ctx, &n);
8078486e1d5359 Pavel Begunkov 2024-11-29  564  		return ret;
79cfe9e59c2a12 Jens Axboe     2024-10-21  565  	}
8078486e1d5359 Pavel Begunkov 2024-11-29  566  	n.sq_sqes = io_region_get_ptr(&n.sq_region);
79cfe9e59c2a12 Jens Axboe     2024-10-21  567  
79cfe9e59c2a12 Jens Axboe     2024-10-21  568  	/*
79cfe9e59c2a12 Jens Axboe     2024-10-21  569  	 * If using SQPOLL, park the thread
79cfe9e59c2a12 Jens Axboe     2024-10-21  570  	 */
79cfe9e59c2a12 Jens Axboe     2024-10-21  571  	if (ctx->sq_data) {
79cfe9e59c2a12 Jens Axboe     2024-10-21  572  		mutex_unlock(&ctx->uring_lock);
79cfe9e59c2a12 Jens Axboe     2024-10-21  573  		io_sq_thread_park(ctx->sq_data);
79cfe9e59c2a12 Jens Axboe     2024-10-21  574  		mutex_lock(&ctx->uring_lock);
79cfe9e59c2a12 Jens Axboe     2024-10-21  575  	}
79cfe9e59c2a12 Jens Axboe     2024-10-21  576  
79cfe9e59c2a12 Jens Axboe     2024-10-21  577  	/*
943d0609d0571a Pavel Begunkov 2024-11-29  578  	 * We'll do the swap. Grab the ctx->mmap_lock, which will exclude
79cfe9e59c2a12 Jens Axboe     2024-10-21  579  	 * any new mmap's on the ring fd. Clear out existing mappings to prevent
79cfe9e59c2a12 Jens Axboe     2024-10-21  580  	 * mmap from seeing them, as we'll unmap them. Any attempt to mmap
79cfe9e59c2a12 Jens Axboe     2024-10-21  581  	 * existing rings beyond this point will fail. Not that it could proceed
79cfe9e59c2a12 Jens Axboe     2024-10-21  582  	 * at this point anyway, as the io_uring mmap side needs go grab the
943d0609d0571a Pavel Begunkov 2024-11-29  583  	 * ctx->mmap_lock as well. Likewise, hold the completion lock over the
79cfe9e59c2a12 Jens Axboe     2024-10-21  584  	 * duration of the actual swap.
79cfe9e59c2a12 Jens Axboe     2024-10-21  585  	 */
943d0609d0571a Pavel Begunkov 2024-11-29  586  	mutex_lock(&ctx->mmap_lock);
79cfe9e59c2a12 Jens Axboe     2024-10-21  587  	spin_lock(&ctx->completion_lock);
79cfe9e59c2a12 Jens Axboe     2024-10-21  588  	o.rings = ctx->rings;
79cfe9e59c2a12 Jens Axboe     2024-10-21  589  	ctx->rings = NULL;
79cfe9e59c2a12 Jens Axboe     2024-10-21  590  	o.sq_sqes = ctx->sq_sqes;
79cfe9e59c2a12 Jens Axboe     2024-10-21  591  	ctx->sq_sqes = NULL;
79cfe9e59c2a12 Jens Axboe     2024-10-21  592  
79cfe9e59c2a12 Jens Axboe     2024-10-21  593  	/*
79cfe9e59c2a12 Jens Axboe     2024-10-21  594  	 * Now copy SQ and CQ entries, if any. If either of the destination
79cfe9e59c2a12 Jens Axboe     2024-10-21  595  	 * rings can't hold what is already there, then fail the operation.
79cfe9e59c2a12 Jens Axboe     2024-10-21  596  	 */
2c5aae129f427f Jens Axboe     2025-01-15  597  	tail = READ_ONCE(o.rings->sq.tail);
6f7a644eb7db10 Jens Axboe     2025-01-15  598  	old_head = READ_ONCE(o.rings->sq.head);
929dbbb699110c Pavel Begunkov 2025-11-12  599  	if (tail - old_head > p->sq_entries)
79cfe9e59c2a12 Jens Axboe     2024-10-21  600  		goto overflow;
6f7a644eb7db10 Jens Axboe     2025-01-15  601  	for (i = old_head; i < tail; i++) {
45cd95763e198d Jens Axboe     2026-04-20  602  		unsigned index, dst_mask, src_mask;
45cd95763e198d Jens Axboe     2026-04-20  603  		size_t sq_size;
79cfe9e59c2a12 Jens Axboe     2024-10-21  604  
45cd95763e198d Jens Axboe     2026-04-20  605  		index = i;
45cd95763e198d Jens Axboe     2026-04-20  606  		sq_size = sizeof(struct io_uring_sqe);
45cd95763e198d Jens Axboe     2026-04-20  607  		src_mask = ctx->sq_entries - 1;
45cd95763e198d Jens Axboe     2026-04-20  608  		dst_mask = p->sq_entries - 1;
45cd95763e198d Jens Axboe     2026-04-20  609  		if (ctx->flags & IORING_SETUP_SQE128) {
45cd95763e198d Jens Axboe     2026-04-20  610  			index <<= 1;
45cd95763e198d Jens Axboe     2026-04-20  611  			sq_size <<= 1;
45cd95763e198d Jens Axboe     2026-04-20  612  			src_mask = (ctx->sq_entries << 1) - 1;
45cd95763e198d Jens Axboe     2026-04-20  613  			dst_mask = (p->sq_entries << 1) - 1;
45cd95763e198d Jens Axboe     2026-04-20  614  		}
45cd95763e198d Jens Axboe     2026-04-20 @615  		memcpy(&n.sq_sqes[index & dst_mask], &o.sq_sqes[index & src_mask], sq_size);
79cfe9e59c2a12 Jens Axboe     2024-10-21  616  	}
a312e1706ce6c1 Linus Torvalds 2025-01-20  617  	WRITE_ONCE(n.rings->sq.head, old_head);
a312e1706ce6c1 Linus Torvalds 2025-01-20  618  	WRITE_ONCE(n.rings->sq.tail, tail);
79cfe9e59c2a12 Jens Axboe     2024-10-21  619  
2c5aae129f427f Jens Axboe     2025-01-15  620  	tail = READ_ONCE(o.rings->cq.tail);
6f7a644eb7db10 Jens Axboe     2025-01-15  621  	old_head = READ_ONCE(o.rings->cq.head);
929dbbb699110c Pavel Begunkov 2025-11-12  622  	if (tail - old_head > p->cq_entries) {
79cfe9e59c2a12 Jens Axboe     2024-10-21  623  overflow:
79cfe9e59c2a12 Jens Axboe     2024-10-21  624  		/* restore old rings, and return -EOVERFLOW via cleanup path */
79cfe9e59c2a12 Jens Axboe     2024-10-21  625  		ctx->rings = o.rings;
79cfe9e59c2a12 Jens Axboe     2024-10-21  626  		ctx->sq_sqes = o.sq_sqes;
79cfe9e59c2a12 Jens Axboe     2024-10-21  627  		to_free = &n;
79cfe9e59c2a12 Jens Axboe     2024-10-21  628  		ret = -EOVERFLOW;
79cfe9e59c2a12 Jens Axboe     2024-10-21  629  		goto out;
79cfe9e59c2a12 Jens Axboe     2024-10-21  630  	}
6f7a644eb7db10 Jens Axboe     2025-01-15  631  	for (i = old_head; i < tail; i++) {
45cd95763e198d Jens Axboe     2026-04-20  632  		unsigned index, dst_mask, src_mask;
45cd95763e198d Jens Axboe     2026-04-20  633  		size_t cq_size;
45cd95763e198d Jens Axboe     2026-04-20  634  
45cd95763e198d Jens Axboe     2026-04-20  635  		index = i;
45cd95763e198d Jens Axboe     2026-04-20  636  		cq_size = sizeof(struct io_uring_cqe);
45cd95763e198d Jens Axboe     2026-04-20  637  		src_mask = ctx->cq_entries - 1;
45cd95763e198d Jens Axboe     2026-04-20  638  		dst_mask = p->cq_entries - 1;
45cd95763e198d Jens Axboe     2026-04-20  639  		if (ctx->flags & IORING_SETUP_CQE32) {
45cd95763e198d Jens Axboe     2026-04-20  640  			index <<= 1;
45cd95763e198d Jens Axboe     2026-04-20  641  			cq_size <<= 1;
45cd95763e198d Jens Axboe     2026-04-20  642  			src_mask = (ctx->cq_entries << 1) - 1;
45cd95763e198d Jens Axboe     2026-04-20  643  			dst_mask = (p->cq_entries << 1) - 1;
45cd95763e198d Jens Axboe     2026-04-20  644  		}
45cd95763e198d Jens Axboe     2026-04-20 @645  		memcpy(&n.rings->cqes[index & dst_mask], &o.rings->cqes[index & src_mask], cq_size);
79cfe9e59c2a12 Jens Axboe     2024-10-21  646  	}
a312e1706ce6c1 Linus Torvalds 2025-01-20  647  	WRITE_ONCE(n.rings->cq.head, old_head);
a312e1706ce6c1 Linus Torvalds 2025-01-20  648  	WRITE_ONCE(n.rings->cq.tail, tail);
79cfe9e59c2a12 Jens Axboe     2024-10-21  649  	/* invalidate cached cqe refill */
79cfe9e59c2a12 Jens Axboe     2024-10-21  650  	ctx->cqe_cached = ctx->cqe_sentinel = NULL;
79cfe9e59c2a12 Jens Axboe     2024-10-21  651  
2c5aae129f427f Jens Axboe     2025-01-15  652  	WRITE_ONCE(n.rings->sq_dropped, READ_ONCE(o.rings->sq_dropped));
a23ad06bfee5e5 Jens Axboe     2025-01-24  653  	atomic_set(&n.rings->sq_flags, atomic_read(&o.rings->sq_flags));
2c5aae129f427f Jens Axboe     2025-01-15  654  	WRITE_ONCE(n.rings->cq_flags, READ_ONCE(o.rings->cq_flags));
2c5aae129f427f Jens Axboe     2025-01-15  655  	WRITE_ONCE(n.rings->cq_overflow, READ_ONCE(o.rings->cq_overflow));
79cfe9e59c2a12 Jens Axboe     2024-10-21  656  
79cfe9e59c2a12 Jens Axboe     2024-10-21  657  	/* all done, store old pointers and assign new ones */
79cfe9e59c2a12 Jens Axboe     2024-10-21  658  	if (!(ctx->flags & IORING_SETUP_NO_SQARRAY))
001b76b7e75576 Pavel Begunkov 2025-11-12  659  		ctx->sq_array = (u32 *)((char *)n.rings + rl->sq_array_offset);
79cfe9e59c2a12 Jens Axboe     2024-10-21  660  
929dbbb699110c Pavel Begunkov 2025-11-12  661  	ctx->sq_entries = p->sq_entries;
929dbbb699110c Pavel Begunkov 2025-11-12  662  	ctx->cq_entries = p->cq_entries;
79cfe9e59c2a12 Jens Axboe     2024-10-21  663  
96189080265e6b Jens Axboe     2026-03-09  664  	/*
96189080265e6b Jens Axboe     2026-03-09  665  	 * Just mark any flag we may have missed and that the application
96189080265e6b Jens Axboe     2026-03-09  666  	 * should act on unconditionally. Worst case it'll be an extra
96189080265e6b Jens Axboe     2026-03-09  667  	 * syscall.
96189080265e6b Jens Axboe     2026-03-09  668  	 */
96189080265e6b Jens Axboe     2026-03-09  669  	atomic_or(IORING_SQ_TASKRUN | IORING_SQ_NEED_WAKEUP, &n.rings->sq_flags);
79cfe9e59c2a12 Jens Axboe     2024-10-21  670  	ctx->rings = n.rings;
96189080265e6b Jens Axboe     2026-03-09  671  	rcu_assign_pointer(ctx->rings_rcu, n.rings);
96189080265e6b Jens Axboe     2026-03-09  672  
79cfe9e59c2a12 Jens Axboe     2024-10-21  673  	ctx->sq_sqes = n.sq_sqes;
81a4058e0cd0f0 Pavel Begunkov 2024-11-29  674  	swap_old(ctx, o, n, ring_region);
8078486e1d5359 Pavel Begunkov 2024-11-29  675  	swap_old(ctx, o, n, sq_region);
79cfe9e59c2a12 Jens Axboe     2024-10-21  676  	to_free = &o;
79cfe9e59c2a12 Jens Axboe     2024-10-21  677  	ret = 0;
79cfe9e59c2a12 Jens Axboe     2024-10-21  678  out:
79cfe9e59c2a12 Jens Axboe     2024-10-21  679  	spin_unlock(&ctx->completion_lock);
943d0609d0571a Pavel Begunkov 2024-11-29  680  	mutex_unlock(&ctx->mmap_lock);
96189080265e6b Jens Axboe     2026-03-09  681  	/* Wait for concurrent io_ctx_mark_taskrun() */
96189080265e6b Jens Axboe     2026-03-09  682  	if (to_free == &o)
96189080265e6b Jens Axboe     2026-03-09  683  		synchronize_rcu_expedited();
0c89dbbcadf126 Pavel Begunkov 2025-10-16  684  	io_register_free_rings(ctx, to_free);
79cfe9e59c2a12 Jens Axboe     2024-10-21  685  
79cfe9e59c2a12 Jens Axboe     2024-10-21  686  	if (ctx->sq_data)
79cfe9e59c2a12 Jens Axboe     2024-10-21  687  		io_sq_thread_unpark(ctx->sq_data);
79cfe9e59c2a12 Jens Axboe     2024-10-21  688  
79cfe9e59c2a12 Jens Axboe     2024-10-21  689  	return ret;
79cfe9e59c2a12 Jens Axboe     2024-10-21  690  }
79cfe9e59c2a12 Jens Axboe     2024-10-21  691  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
