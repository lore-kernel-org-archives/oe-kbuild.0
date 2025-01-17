Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C761A76B6
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jan 2025 18:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737139285; cv=none; b=dCn1nz6He/72ULBLBFSJyRQtURAV1XLcnopna6D3XUCV2dVCJeVHdq2xu/V/1cBFaMHmxwcPqlomn7to0OclpvHDtW99/1j/XJ8payWI6RfhZ3n5v4tHinYSwiUTY8Newe4zvOKffCbKqiREWAicXGzsBXRUAWOZdVxghI7riEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737139285; c=relaxed/simple;
	bh=R8DEv/eMuDDiBW1cwMXVKoOFU/7n/GAJ9eGpTGgEt64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCLmsJHCa/P98HHBgzf6cH7+WE9nbonCn64qh7TgTe6Idg4kWLHU4fc7/3ZddrPn8KeqR+so/Td7emQurNusPwWbgTjXZu9q94um/OEckzumdKq+x21givs5OUhM6Vrt1MHjfNEj8xvOTsZG09xtTTPL6FgvJm8yUe/qo2T7U90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+D/74M4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+D/74M4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737139283; x=1768675283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R8DEv/eMuDDiBW1cwMXVKoOFU/7n/GAJ9eGpTGgEt64=;
  b=D+D/74M40nhirMNJU3dqZiFZjAcwvI6gnck3rGKU0jevJEq+ki82PlmO
   gMUUsE7ghEwYp/3/nKy3sdVAUqg5jt7StC6RG+SXtdj5lyG/wYoKSBlQG
   KaN12rZ9gVw+mZ4lewKPZN6Vb//gkUi61vk9mXSjKpS9P4QohM/Tr7yEa
   ayQ99+AmXjOzbI8j0d99ReOk+EpDzgezrL6ZmrdGtz5w5e5ekgtX9RBYX
   1Vuyo3VWeRT3U6qmQKQ9ZWh0zNUV28lAkRbKLuRXCjRGKrRXlP8wj7wt5
   /gPvVOLSvIbpCQ57ieXggsofCfm3qytLcNuTlqDYhU1n9gfW8BJ0ZZzDE
   w==;
X-CSE-ConnectionGUID: AaS3q4CMQ6SwNIOMpgSFww==
X-CSE-MsgGUID: dctOMNJJSY+XLOR0nhshNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37274052"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37274052"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 10:41:22 -0800
X-CSE-ConnectionGUID: FBZPtBjdQzy1p92Mq/qAvA==
X-CSE-MsgGUID: 9VXAePx5TpmeEI29dlUi+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="106474687"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2025 10:41:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYrHS-000Ta7-2Y;
	Fri, 17 Jan 2025 18:41:18 +0000
Date: Sat, 18 Jan 2025 02:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: io_uring/register.c:519 io_register_resize_rings() warn: potential
 spectre issue 'n.sq_sqes' [w]
Message-ID: <202501180205.bHHHz67J-lkp@intel.com>
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
head:   9bffa1ad25b8b3b95d8f463e5c24dabe3c87d54d
commit: 8911798d3e8a9624b1acf2882c7a0183694d714d io_uring/register: use stable SQ/CQ ring data during resize
date:   2 days ago
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250116 (https://download.01.org/0day-ci/archive/20250118/202501180205.bHHHz67J-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501180205.bHHHz67J-lkp@intel.com/

smatch warnings:
io_uring/register.c:519 io_register_resize_rings() warn: potential spectre issue 'n.sq_sqes' [w]
io_uring/register.c:538 io_register_resize_rings() warn: potential spectre issue 'n.rings->cqes' [w]

vim +519 io_uring/register.c

79cfe9e59c2a12 Jens Axboe 2024-10-21  393  
79cfe9e59c2a12 Jens Axboe 2024-10-21  394  #define swap_old(ctx, o, n, field)		\
79cfe9e59c2a12 Jens Axboe 2024-10-21  395  	do {					\
79cfe9e59c2a12 Jens Axboe 2024-10-21  396  		(o).field = (ctx)->field;	\
79cfe9e59c2a12 Jens Axboe 2024-10-21  397  		(ctx)->field = (n).field;	\
79cfe9e59c2a12 Jens Axboe 2024-10-21  398  	} while (0)
79cfe9e59c2a12 Jens Axboe 2024-10-21  399  
79cfe9e59c2a12 Jens Axboe 2024-10-21  400  #define RESIZE_FLAGS	(IORING_SETUP_CQSIZE | IORING_SETUP_CLAMP)
79cfe9e59c2a12 Jens Axboe 2024-10-21  401  #define COPY_FLAGS	(IORING_SETUP_NO_SQARRAY | IORING_SETUP_SQE128 | \
79cfe9e59c2a12 Jens Axboe 2024-10-21  402  			 IORING_SETUP_CQE32 | IORING_SETUP_NO_MMAP)
79cfe9e59c2a12 Jens Axboe 2024-10-21  403  
79cfe9e59c2a12 Jens Axboe 2024-10-21  404  static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user *arg)
79cfe9e59c2a12 Jens Axboe 2024-10-21  405  {
79cfe9e59c2a12 Jens Axboe 2024-10-21  406  	struct io_ring_ctx_rings o = { }, n = { }, *to_free = NULL;
79cfe9e59c2a12 Jens Axboe 2024-10-21  407  	size_t size, sq_array_offset;
79cfe9e59c2a12 Jens Axboe 2024-10-21  408  	struct io_uring_params p;
79cfe9e59c2a12 Jens Axboe 2024-10-21  409  	unsigned i, tail;
79cfe9e59c2a12 Jens Axboe 2024-10-21  410  	void *ptr;
79cfe9e59c2a12 Jens Axboe 2024-10-21  411  	int ret;
79cfe9e59c2a12 Jens Axboe 2024-10-21  412  
79cfe9e59c2a12 Jens Axboe 2024-10-21  413  	/* for single issuer, must be owner resizing */
79cfe9e59c2a12 Jens Axboe 2024-10-21  414  	if (ctx->flags & IORING_SETUP_SINGLE_ISSUER &&
79cfe9e59c2a12 Jens Axboe 2024-10-21  415  	    current != ctx->submitter_task)
79cfe9e59c2a12 Jens Axboe 2024-10-21  416  		return -EEXIST;
c261e4f1dd29fa Jens Axboe 2024-12-19  417  	/* limited to DEFER_TASKRUN for now */
c261e4f1dd29fa Jens Axboe 2024-12-19  418  	if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN))
c261e4f1dd29fa Jens Axboe 2024-12-19  419  		return -EINVAL;
79cfe9e59c2a12 Jens Axboe 2024-10-21  420  	if (copy_from_user(&p, arg, sizeof(p)))
79cfe9e59c2a12 Jens Axboe 2024-10-21  421  		return -EFAULT;
79cfe9e59c2a12 Jens Axboe 2024-10-21  422  	if (p.flags & ~RESIZE_FLAGS)
79cfe9e59c2a12 Jens Axboe 2024-10-21  423  		return -EINVAL;
79cfe9e59c2a12 Jens Axboe 2024-10-21  424  
79cfe9e59c2a12 Jens Axboe 2024-10-21  425  	/* properties that are always inherited */
79cfe9e59c2a12 Jens Axboe 2024-10-21  426  	p.flags |= (ctx->flags & COPY_FLAGS);
79cfe9e59c2a12 Jens Axboe 2024-10-21  427  
79cfe9e59c2a12 Jens Axboe 2024-10-21  428  	ret = io_uring_fill_params(p.sq_entries, &p);
79cfe9e59c2a12 Jens Axboe 2024-10-21  429  	if (unlikely(ret))
79cfe9e59c2a12 Jens Axboe 2024-10-21  430  		return ret;
79cfe9e59c2a12 Jens Axboe 2024-10-21  431  
79cfe9e59c2a12 Jens Axboe 2024-10-21  432  	/* nothing to do, but copy params back */
79cfe9e59c2a12 Jens Axboe 2024-10-21  433  	if (p.sq_entries == ctx->sq_entries && p.cq_entries == ctx->cq_entries) {
79cfe9e59c2a12 Jens Axboe 2024-10-21  434  		if (copy_to_user(arg, &p, sizeof(p)))
79cfe9e59c2a12 Jens Axboe 2024-10-21  435  			return -EFAULT;
79cfe9e59c2a12 Jens Axboe 2024-10-21  436  		return 0;
79cfe9e59c2a12 Jens Axboe 2024-10-21  437  	}
79cfe9e59c2a12 Jens Axboe 2024-10-21  438  
79cfe9e59c2a12 Jens Axboe 2024-10-21  439  	size = rings_size(p.flags, p.sq_entries, p.cq_entries,
79cfe9e59c2a12 Jens Axboe 2024-10-21  440  				&sq_array_offset);
79cfe9e59c2a12 Jens Axboe 2024-10-21  441  	if (size == SIZE_MAX)
79cfe9e59c2a12 Jens Axboe 2024-10-21  442  		return -EOVERFLOW;
79cfe9e59c2a12 Jens Axboe 2024-10-21  443  
79cfe9e59c2a12 Jens Axboe 2024-10-21  444  	if (!(p.flags & IORING_SETUP_NO_MMAP))
79cfe9e59c2a12 Jens Axboe 2024-10-21  445  		n.rings = io_pages_map(&n.ring_pages, &n.n_ring_pages, size);
79cfe9e59c2a12 Jens Axboe 2024-10-21  446  	else
79cfe9e59c2a12 Jens Axboe 2024-10-21  447  		n.rings = __io_uaddr_map(&n.ring_pages, &n.n_ring_pages,
79cfe9e59c2a12 Jens Axboe 2024-10-21  448  						p.cq_off.user_addr, size);
79cfe9e59c2a12 Jens Axboe 2024-10-21  449  	if (IS_ERR(n.rings))
79cfe9e59c2a12 Jens Axboe 2024-10-21  450  		return PTR_ERR(n.rings);
79cfe9e59c2a12 Jens Axboe 2024-10-21  451  
79cfe9e59c2a12 Jens Axboe 2024-10-21  452  	n.rings->sq_ring_mask = p.sq_entries - 1;
79cfe9e59c2a12 Jens Axboe 2024-10-21  453  	n.rings->cq_ring_mask = p.cq_entries - 1;
79cfe9e59c2a12 Jens Axboe 2024-10-21  454  	n.rings->sq_ring_entries = p.sq_entries;
79cfe9e59c2a12 Jens Axboe 2024-10-21  455  	n.rings->cq_ring_entries = p.cq_entries;
79cfe9e59c2a12 Jens Axboe 2024-10-21  456  
79cfe9e59c2a12 Jens Axboe 2024-10-21  457  	if (copy_to_user(arg, &p, sizeof(p))) {
79cfe9e59c2a12 Jens Axboe 2024-10-21  458  		io_register_free_rings(&p, &n);
79cfe9e59c2a12 Jens Axboe 2024-10-21  459  		return -EFAULT;
79cfe9e59c2a12 Jens Axboe 2024-10-21  460  	}
79cfe9e59c2a12 Jens Axboe 2024-10-21  461  
79cfe9e59c2a12 Jens Axboe 2024-10-21  462  	if (p.flags & IORING_SETUP_SQE128)
79cfe9e59c2a12 Jens Axboe 2024-10-21  463  		size = array_size(2 * sizeof(struct io_uring_sqe), p.sq_entries);
79cfe9e59c2a12 Jens Axboe 2024-10-21  464  	else
79cfe9e59c2a12 Jens Axboe 2024-10-21  465  		size = array_size(sizeof(struct io_uring_sqe), p.sq_entries);
79cfe9e59c2a12 Jens Axboe 2024-10-21  466  	if (size == SIZE_MAX) {
79cfe9e59c2a12 Jens Axboe 2024-10-21  467  		io_register_free_rings(&p, &n);
79cfe9e59c2a12 Jens Axboe 2024-10-21  468  		return -EOVERFLOW;
79cfe9e59c2a12 Jens Axboe 2024-10-21  469  	}
79cfe9e59c2a12 Jens Axboe 2024-10-21  470  
79cfe9e59c2a12 Jens Axboe 2024-10-21  471  	if (!(p.flags & IORING_SETUP_NO_MMAP))
79cfe9e59c2a12 Jens Axboe 2024-10-21  472  		ptr = io_pages_map(&n.sqe_pages, &n.n_sqe_pages, size);
79cfe9e59c2a12 Jens Axboe 2024-10-21  473  	else
79cfe9e59c2a12 Jens Axboe 2024-10-21  474  		ptr = __io_uaddr_map(&n.sqe_pages, &n.n_sqe_pages,
79cfe9e59c2a12 Jens Axboe 2024-10-21  475  					p.sq_off.user_addr,
79cfe9e59c2a12 Jens Axboe 2024-10-21  476  					size);
79cfe9e59c2a12 Jens Axboe 2024-10-21  477  	if (IS_ERR(ptr)) {
79cfe9e59c2a12 Jens Axboe 2024-10-21  478  		io_register_free_rings(&p, &n);
79cfe9e59c2a12 Jens Axboe 2024-10-21  479  		return PTR_ERR(ptr);
79cfe9e59c2a12 Jens Axboe 2024-10-21  480  	}
79cfe9e59c2a12 Jens Axboe 2024-10-21  481  
79cfe9e59c2a12 Jens Axboe 2024-10-21  482  	/*
79cfe9e59c2a12 Jens Axboe 2024-10-21  483  	 * If using SQPOLL, park the thread
79cfe9e59c2a12 Jens Axboe 2024-10-21  484  	 */
79cfe9e59c2a12 Jens Axboe 2024-10-21  485  	if (ctx->sq_data) {
79cfe9e59c2a12 Jens Axboe 2024-10-21  486  		mutex_unlock(&ctx->uring_lock);
79cfe9e59c2a12 Jens Axboe 2024-10-21  487  		io_sq_thread_park(ctx->sq_data);
79cfe9e59c2a12 Jens Axboe 2024-10-21  488  		mutex_lock(&ctx->uring_lock);
79cfe9e59c2a12 Jens Axboe 2024-10-21  489  	}
79cfe9e59c2a12 Jens Axboe 2024-10-21  490  
79cfe9e59c2a12 Jens Axboe 2024-10-21  491  	/*
79cfe9e59c2a12 Jens Axboe 2024-10-21  492  	 * We'll do the swap. Grab the ctx->resize_lock, which will exclude
79cfe9e59c2a12 Jens Axboe 2024-10-21  493  	 * any new mmap's on the ring fd. Clear out existing mappings to prevent
79cfe9e59c2a12 Jens Axboe 2024-10-21  494  	 * mmap from seeing them, as we'll unmap them. Any attempt to mmap
79cfe9e59c2a12 Jens Axboe 2024-10-21  495  	 * existing rings beyond this point will fail. Not that it could proceed
79cfe9e59c2a12 Jens Axboe 2024-10-21  496  	 * at this point anyway, as the io_uring mmap side needs go grab the
79cfe9e59c2a12 Jens Axboe 2024-10-21  497  	 * ctx->resize_lock as well. Likewise, hold the completion lock over the
79cfe9e59c2a12 Jens Axboe 2024-10-21  498  	 * duration of the actual swap.
79cfe9e59c2a12 Jens Axboe 2024-10-21  499  	 */
79cfe9e59c2a12 Jens Axboe 2024-10-21  500  	mutex_lock(&ctx->resize_lock);
79cfe9e59c2a12 Jens Axboe 2024-10-21  501  	spin_lock(&ctx->completion_lock);
79cfe9e59c2a12 Jens Axboe 2024-10-21  502  	o.rings = ctx->rings;
79cfe9e59c2a12 Jens Axboe 2024-10-21  503  	ctx->rings = NULL;
79cfe9e59c2a12 Jens Axboe 2024-10-21  504  	o.sq_sqes = ctx->sq_sqes;
79cfe9e59c2a12 Jens Axboe 2024-10-21  505  	ctx->sq_sqes = NULL;
79cfe9e59c2a12 Jens Axboe 2024-10-21  506  
79cfe9e59c2a12 Jens Axboe 2024-10-21  507  	/*
79cfe9e59c2a12 Jens Axboe 2024-10-21  508  	 * Now copy SQ and CQ entries, if any. If either of the destination
79cfe9e59c2a12 Jens Axboe 2024-10-21  509  	 * rings can't hold what is already there, then fail the operation.
79cfe9e59c2a12 Jens Axboe 2024-10-21  510  	 */
79cfe9e59c2a12 Jens Axboe 2024-10-21  511  	n.sq_sqes = ptr;
79cfe9e59c2a12 Jens Axboe 2024-10-21  512  	tail = o.rings->sq.tail;
79cfe9e59c2a12 Jens Axboe 2024-10-21  513  	if (tail - o.rings->sq.head > p.sq_entries)
79cfe9e59c2a12 Jens Axboe 2024-10-21  514  		goto overflow;
79cfe9e59c2a12 Jens Axboe 2024-10-21  515  	for (i = o.rings->sq.head; i < tail; i++) {
79cfe9e59c2a12 Jens Axboe 2024-10-21  516  		unsigned src_head = i & (ctx->sq_entries - 1);
8911798d3e8a96 Jens Axboe 2025-01-15  517  		unsigned dst_head = i & (p.sq_entries - 1);
79cfe9e59c2a12 Jens Axboe 2024-10-21  518  
79cfe9e59c2a12 Jens Axboe 2024-10-21 @519  		n.sq_sqes[dst_head] = o.sq_sqes[src_head];
79cfe9e59c2a12 Jens Axboe 2024-10-21  520  	}
79cfe9e59c2a12 Jens Axboe 2024-10-21  521  	n.rings->sq.head = o.rings->sq.head;
79cfe9e59c2a12 Jens Axboe 2024-10-21  522  	n.rings->sq.tail = o.rings->sq.tail;
79cfe9e59c2a12 Jens Axboe 2024-10-21  523  
79cfe9e59c2a12 Jens Axboe 2024-10-21  524  	tail = o.rings->cq.tail;
79cfe9e59c2a12 Jens Axboe 2024-10-21  525  	if (tail - o.rings->cq.head > p.cq_entries) {
79cfe9e59c2a12 Jens Axboe 2024-10-21  526  overflow:
79cfe9e59c2a12 Jens Axboe 2024-10-21  527  		/* restore old rings, and return -EOVERFLOW via cleanup path */
79cfe9e59c2a12 Jens Axboe 2024-10-21  528  		ctx->rings = o.rings;
79cfe9e59c2a12 Jens Axboe 2024-10-21  529  		ctx->sq_sqes = o.sq_sqes;
79cfe9e59c2a12 Jens Axboe 2024-10-21  530  		to_free = &n;
79cfe9e59c2a12 Jens Axboe 2024-10-21  531  		ret = -EOVERFLOW;
79cfe9e59c2a12 Jens Axboe 2024-10-21  532  		goto out;
79cfe9e59c2a12 Jens Axboe 2024-10-21  533  	}
79cfe9e59c2a12 Jens Axboe 2024-10-21  534  	for (i = o.rings->cq.head; i < tail; i++) {
79cfe9e59c2a12 Jens Axboe 2024-10-21  535  		unsigned src_head = i & (ctx->cq_entries - 1);
8911798d3e8a96 Jens Axboe 2025-01-15  536  		unsigned dst_head = i & (p.cq_entries - 1);
79cfe9e59c2a12 Jens Axboe 2024-10-21  537  
79cfe9e59c2a12 Jens Axboe 2024-10-21 @538  		n.rings->cqes[dst_head] = o.rings->cqes[src_head];
79cfe9e59c2a12 Jens Axboe 2024-10-21  539  	}
79cfe9e59c2a12 Jens Axboe 2024-10-21  540  	n.rings->cq.head = o.rings->cq.head;
79cfe9e59c2a12 Jens Axboe 2024-10-21  541  	n.rings->cq.tail = o.rings->cq.tail;
79cfe9e59c2a12 Jens Axboe 2024-10-21  542  	/* invalidate cached cqe refill */
79cfe9e59c2a12 Jens Axboe 2024-10-21  543  	ctx->cqe_cached = ctx->cqe_sentinel = NULL;
79cfe9e59c2a12 Jens Axboe 2024-10-21  544  
79cfe9e59c2a12 Jens Axboe 2024-10-21  545  	n.rings->sq_dropped = o.rings->sq_dropped;
79cfe9e59c2a12 Jens Axboe 2024-10-21  546  	n.rings->sq_flags = o.rings->sq_flags;
79cfe9e59c2a12 Jens Axboe 2024-10-21  547  	n.rings->cq_flags = o.rings->cq_flags;
79cfe9e59c2a12 Jens Axboe 2024-10-21  548  	n.rings->cq_overflow = o.rings->cq_overflow;
79cfe9e59c2a12 Jens Axboe 2024-10-21  549  
79cfe9e59c2a12 Jens Axboe 2024-10-21  550  	/* all done, store old pointers and assign new ones */
79cfe9e59c2a12 Jens Axboe 2024-10-21  551  	if (!(ctx->flags & IORING_SETUP_NO_SQARRAY))
79cfe9e59c2a12 Jens Axboe 2024-10-21  552  		ctx->sq_array = (u32 *)((char *)n.rings + sq_array_offset);
79cfe9e59c2a12 Jens Axboe 2024-10-21  553  
79cfe9e59c2a12 Jens Axboe 2024-10-21  554  	ctx->sq_entries = p.sq_entries;
79cfe9e59c2a12 Jens Axboe 2024-10-21  555  	ctx->cq_entries = p.cq_entries;
79cfe9e59c2a12 Jens Axboe 2024-10-21  556  
79cfe9e59c2a12 Jens Axboe 2024-10-21  557  	ctx->rings = n.rings;
79cfe9e59c2a12 Jens Axboe 2024-10-21  558  	ctx->sq_sqes = n.sq_sqes;
79cfe9e59c2a12 Jens Axboe 2024-10-21  559  	swap_old(ctx, o, n, n_ring_pages);
79cfe9e59c2a12 Jens Axboe 2024-10-21  560  	swap_old(ctx, o, n, n_sqe_pages);
79cfe9e59c2a12 Jens Axboe 2024-10-21  561  	swap_old(ctx, o, n, ring_pages);
79cfe9e59c2a12 Jens Axboe 2024-10-21  562  	swap_old(ctx, o, n, sqe_pages);
79cfe9e59c2a12 Jens Axboe 2024-10-21  563  	to_free = &o;
79cfe9e59c2a12 Jens Axboe 2024-10-21  564  	ret = 0;
79cfe9e59c2a12 Jens Axboe 2024-10-21  565  out:
79cfe9e59c2a12 Jens Axboe 2024-10-21  566  	spin_unlock(&ctx->completion_lock);
79cfe9e59c2a12 Jens Axboe 2024-10-21  567  	mutex_unlock(&ctx->resize_lock);
79cfe9e59c2a12 Jens Axboe 2024-10-21  568  	io_register_free_rings(&p, to_free);
79cfe9e59c2a12 Jens Axboe 2024-10-21  569  
79cfe9e59c2a12 Jens Axboe 2024-10-21  570  	if (ctx->sq_data)
79cfe9e59c2a12 Jens Axboe 2024-10-21  571  		io_sq_thread_unpark(ctx->sq_data);
79cfe9e59c2a12 Jens Axboe 2024-10-21  572  
79cfe9e59c2a12 Jens Axboe 2024-10-21  573  	return ret;
79cfe9e59c2a12 Jens Axboe 2024-10-21  574  }
79cfe9e59c2a12 Jens Axboe 2024-10-21  575  

:::::: The code at line 519 was first introduced by commit
:::::: 79cfe9e59c2a12c3b3faeeefe38d23f3d8030972 io_uring/register: add IORING_REGISTER_RESIZE_RINGS

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
