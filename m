Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346B15672
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jan 2025 22:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737932025; cv=none; b=Gl/zdou2YPPcCX+j6r2h49yB+HYjVETazXW1Bx/jv1fvl5dfIov5ON0/Di/91lZ18FqNgPEYYjFe68MohwVY3wKzicrKsWbvnDqONeeIGsWPQdfVzwQV+CzbVoMiLwV6YCxL5vgi3xUw10DQ7//ruIwtHPbb3ccXUCsVDFdvB70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737932025; c=relaxed/simple;
	bh=THwjIoZWs5ahiMSvZ30FXnjKJDUUiZXMGzV2dhkDrDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pl/7X4KCARnafUvRaFwA0LsqblIr6lqzbc4bC1SXnR8I37c6YqEfv3c9v97CZt6wi6LC/o0TlVKhvMUMxYZ/srxFJaNoDl/AvH3U7jklna67sUvCU8HvTNeg1BZmlxGY5fKy95rQkXCooSmiP3Rl9/VFrkfS1Zw0/jHuu+/6Vh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXVmBAWu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXVmBAWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737932023; x=1769468023;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=THwjIoZWs5ahiMSvZ30FXnjKJDUUiZXMGzV2dhkDrDE=;
  b=DXVmBAWuIw1vwzB/sgAizXg6/C0ai5aVQ9BxFa21DlbFsr300zA0B2Y8
   NBS/VgYO+sJk2hDR6VZ192ojUUv0n5OhV1y9oDxr6PBLGiEp+sizNhZnI
   kg0M0hk7H33V5VEDWm6yG08+P+DICafwC0wlOM6a4mrk9i7w4EY16vHUz
   FlEMEQdXJxDVSV99HowciJr3S37h7WTUmpRMFpgqglSGKMrPXfNx0hPNR
   yDJXfYuxnNmI4b5sP6zKtBEZ0/0H0dQVlPYnUVLtwid8OQmIYJFP4itND
   cJLaAylHOQ4tngRISuAs8lyLx6xqU3mXKAHWddYexMkJoMtkgqZPhxvD0
   g==;
X-CSE-ConnectionGUID: cFIPx/sER0i9zhvf1bwwpw==
X-CSE-MsgGUID: OSEGFAv6RNG2+KkPQV9IOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="55931255"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="55931255"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 14:53:41 -0800
X-CSE-ConnectionGUID: VzrbTiZ5R+qmcKv35/CIZA==
X-CSE-MsgGUID: UqYAq1doSZmtO9fIQd0zXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="108797225"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jan 2025 14:53:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcBVa-000g8h-0C;
	Sun, 26 Jan 2025 22:53:38 +0000
Date: Mon, 27 Jan 2025 06:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-buf-folio 16/21] fs/xfs/xfs_buf.c:347
 xfs_buf_alloc_backing_mem() warn: missing unwind goto?
Message-ID: <202501270649.qXmdmqxx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-buf-folio
head:   46940047ed8c113db44bac4bd14976308a337268
commit: 1ec45bc280959f7f9883d733f3e6c7a25b081b94 [16/21] xfs: convert buffer cache to use high order folios
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-161-20250127 (https://download.01.org/0day-ci/archive/20250127/202501270649.qXmdmqxx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501270649.qXmdmqxx-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_buf.c:347 xfs_buf_alloc_backing_mem() warn: missing unwind goto?
fs/xfs/xfs_buf.c:347 xfs_buf_alloc_backing_mem() warn: missing unwind goto?

Old smatch warnings:
fs/xfs/xfs_buf.c:710 xfs_buf_get_map() error: we previously assumed 'bp' could be null (see line 692)

vim +347 fs/xfs/xfs_buf.c

0e6e847ffe37436 fs/xfs/linux-2.6/xfs_buf.c Dave Chinner      2011-03-26  267  
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  268  /*
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  269   * Allocate backing memory for a buffer.
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  270   *
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  271   * For tmpfs-backed buffers used by in-memory btrees this directly maps the
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  272   * tmpfs page cache folios.
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  273   *
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  274   * For real file system buffers there are three different kinds backing memory:
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  275   *
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  276   * The first type backs the buffer by a kmalloc allocation.  This is done for
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  277   * less than PAGE_SIZE allocations to avoid wasting memory.
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  278   *
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  279   * The second type is a single folio buffer - this may be a high order folio or
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  280   * just a single page sized folio, but either way they get treated the same way
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  281   * by the rest of the code - the buffer memory spans a single contiguous memory
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  282   * region that we don't have to map and unmap to access the data directly.
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  283   *
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  284   * The third type of buffer is the multi-page buffer. These are always made
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  285   * up of single pages so that they can be fed to vmap_ram() to return a
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  286   * contiguous memory region we can access the data through, or mark it as
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  287   * XBF_UNMAPPED and access the data directly through individual page_address()
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  288   * calls.
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  289   */
0a683794ace2839 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  290  static int
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  291  xfs_buf_alloc_backing_mem(
0a683794ace2839 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  292  	struct xfs_buf	*bp,
0a683794ace2839 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  293  	xfs_buf_flags_t	flags)
0a683794ace2839 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  294  {
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  295  	size_t		size = BBTOB(bp->b_length);
0b3a76e955ebe3d fs/xfs/xfs_buf.c           Dave Chinner      2024-01-16  296  	gfp_t		gfp_mask = GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_NOWARN;
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  297  	struct folio	*folio;
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  298  	long		filled = 0;
0a683794ace2839 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  299  
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  300  	if (xfs_buftarg_is_mem(bp->b_target))
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  301  		return xmbuf_map_page(bp);
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  302  
fa70bc55a3153f9 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-16  303  	/* Assure zeroed buffer for non-read cases. */
fa70bc55a3153f9 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-16  304  	if (!(flags & XBF_READ))
fa70bc55a3153f9 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-16  305  		gfp_mask |= __GFP_ZERO;
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  306  
289ae7b48c2c4d9 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  307  	if (flags & XBF_READ_AHEAD)
289ae7b48c2c4d9 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  308  		gfp_mask |= __GFP_NORETRY;
289ae7b48c2c4d9 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  309  
fa70bc55a3153f9 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-16  310  	/*
fa70bc55a3153f9 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-16  311  	 * For buffers smaller than PAGE_SІZE use a kmalloc allocation if that
fa70bc55a3153f9 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-16  312  	 * is properly aligned.  The slab allocator now guarantees an aligned
fa70bc55a3153f9 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-16  313  	 * allocation for all power of two sizes, we matches must of the smaller
fa70bc55a3153f9 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-16  314  	 * than PAGE_SIZE buffers used by XFS.
fa70bc55a3153f9 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-16  315  	 */
fa70bc55a3153f9 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-16  316  	if (size < PAGE_SIZE && is_power_of_2(size))
fa70bc55a3153f9 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-16  317  		return xfs_buf_alloc_kmem(bp, size, gfp_mask);
fa70bc55a3153f9 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-16  318  
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  319  	/* Assure zeroed buffer for non-read cases. */
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  320  	if (!(flags & XBF_READ))
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  321  		gfp_mask |= __GFP_ZERO;
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  322  
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  323  	/*
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  324  	 * Don't bother with the retry loop for single PAGE allocations, there
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  325  	 * is litte changes this can be better than the VM version.
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  326  	 */
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  327  	if (size <= PAGE_SIZE)
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  328  		gfp_mask |= __GFP_NOFAIL;
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  329  
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  330  	/*
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  331  	 * Optimistically attempt a single high order folio allocation for
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  332  	 * larger than PAGE_SIZE buffers.
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  333  	 *
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  334  	 * Allocating a high order folio makes the assumption that buffers are a
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  335  	 * power-of-2 size, matching the power-of-2 folios sizes available.
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  336  	 *
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  337  	 * The exception here are user xattr data buffers, which can be arbitrarily
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  338  	 * sized up to 64kB plus structure metadata, skip straight to the vmalloc
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  339  	 * path for them instead of wasting memory.
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  340  	 * here.
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  341  	 */
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  342  	if (size > PAGE_SIZE && !is_power_of_2(size))
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  343  		goto fallback;
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  344  	folio = folio_alloc(gfp_mask, get_order(size));
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  345  	if (!folio) {
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  346  		if (size <= PAGE_SIZE)
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24 @347  			return -ENOMEM;
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  348  		goto fallback;
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  349  	}
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  350  	bp->b_addr = folio_address(folio);
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  351  	bp->b_page_array[0] = &folio->page;
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  352  	bp->b_pages = bp->b_page_array;
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  353  	bp->b_page_count = 1;
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  354  	bp->b_flags |= _XBF_PAGES;
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  355  	return 0;
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  356  
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  357  fallback:
1ec45bc280959f7 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-24  358  	/* Fall back to allocating an array of single page folios. */
1e75281e0ccfbc4 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-15  359  	bp->b_page_count = DIV_ROUND_UP(size, PAGE_SIZE);
02c5117386884e0 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  360  	if (bp->b_page_count <= XB_PAGES) {
02c5117386884e0 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  361  		bp->b_pages = bp->b_page_array;
02c5117386884e0 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  362  	} else {
02c5117386884e0 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  363  		bp->b_pages = kzalloc(sizeof(struct page *) * bp->b_page_count,
02c5117386884e0 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  364  					gfp_mask);
02c5117386884e0 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  365  		if (!bp->b_pages)
02c5117386884e0 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  366  			return -ENOMEM;
02c5117386884e0 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  367  	}
02c5117386884e0 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  368  	bp->b_flags |= _XBF_PAGES;
02c5117386884e0 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  369  
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  370  	/*
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  371  	 * Bulk filling of pages can take multiple calls. Not filling the entire
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  372  	 * array is not an allocation failure, so don't back off if we get at
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  373  	 * least one extra page.
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  374  	 */
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  375  	for (;;) {
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  376  		long	last = filled;
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  377  
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  378  		filled = alloc_pages_bulk_array(gfp_mask, bp->b_page_count,
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  379  						bp->b_pages);
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  380  		if (filled == bp->b_page_count) {
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  381  			XFS_STATS_INC(bp->b_mount, xb_page_found);
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  382  			break;
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  383  		}
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  384  
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  385  		if (filled != last)
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  386  			continue;
c9fa563072e1333 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  387  
ce8e922c0e79c80 fs/xfs/linux-2.6/xfs_buf.c Nathan Scott      2006-01-11  388  		if (flags & XBF_READ_AHEAD) {
e7d236a6fe51020 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  389  			xfs_buf_free_pages(bp);
e7d236a6fe51020 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  390  			return -ENOMEM;
^1da177e4c3f415 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  391  		}
^1da177e4c3f415 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  392  
dbd329f1e44ed48 fs/xfs/xfs_buf.c           Christoph Hellwig 2019-06-28  393  		XFS_STATS_INC(bp->b_mount, xb_page_retries);
4034247a0d6ab28 fs/xfs/xfs_buf.c           NeilBrown         2022-01-14  394  		memalloc_retry_wait(gfp_mask);
^1da177e4c3f415 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  395  	}
0e6e847ffe37436 fs/xfs/linux-2.6/xfs_buf.c Dave Chinner      2011-03-26  396  	return 0;
^1da177e4c3f415 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  397  }
^1da177e4c3f415 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  398  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
