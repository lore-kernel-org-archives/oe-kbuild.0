Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AB61DF963
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 07:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765437291; cv=none; b=k1jJNQ6wxtDAuwRd6HwP2a/u10wpZeaUyBja0sFi2CVjBi8j6yWq7ekq2FH/NAA15WdTLOUAw7OLpt9fPdoYsnO9ATW2MwDej3/LsRz1ss+MENgCvvf4J4gJg7CDB4VwcqWb9EK3TSfKndsBJ8Kt6raTitYTnu3e+Jzy46isabo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765437291; c=relaxed/simple;
	bh=kLbL2NAuKrloPXhih6933ovn2Np9QOz2FYkrfUAW4Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GnC13u8vqAluxa+hoOhDYPyhbBa32OJY7vUrMdKdMKTSPVBibEb3CmLT+Xw7Mm9iCHeBRRO7VbH5VYXvUuV2zl2jIrY8IXIvxVrCCVf+Wi44d/QHtBIBg2eO2IkgfMoBiRxcJoS0TqxWwAUUM81CEp5dVtZHm93SHz8iwFjwmqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILfb6S5z; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILfb6S5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765437289; x=1796973289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLbL2NAuKrloPXhih6933ovn2Np9QOz2FYkrfUAW4Bw=;
  b=ILfb6S5zrIZk5l4meLEM98TZ8VgB4aNl0EMJ0YN8fFzmi9j4KL6iWgI2
   63xEMeP90FzUmCsDiwXhw0sA5ZnuoKpgvrpfXiSpYWfyK+/VhUeev4Qs0
   TJfqVZNeRK6h29RgJaK9LLb70ceZH0gGzRL2mnqRg3azSDYPLa2oazj3w
   EAXw46EpC+NONQtr2BoP91TY5I+gFEmqXg8X2OLALVy1QJsBhMsOoxkbL
   DBhGvB6AdD8OyE2W2loRCgwoRBgwdrQ5cDWQJhxS4sszOOUD5QmIk4D/N
   +YUuZCwi6ESqh6xapxAYKvS+pXUIgziPDM6JRnKvn+meWYQyLL6TmDnML
   Q==;
X-CSE-ConnectionGUID: JNJ28VLVS8OAp0mQh52wfQ==
X-CSE-MsgGUID: 3SXRy3MnRaGRT78YBdeBtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78118416"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78118416"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 23:14:48 -0800
X-CSE-ConnectionGUID: 8ml2p1QwRvKZXpmBn0Iy+Q==
X-CSE-MsgGUID: 1jBCdrJHTPqOcb+iKLvWxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="227377110"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Dec 2025 23:14:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTast-000000004M1-1KSz;
	Thu, 11 Dec 2025 07:14:43 +0000
Date: Thu, 11 Dec 2025 15:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/xfs/xfs_buf.c:352 xfs_buf_alloc_backing_mem() warn: missing
 unwind goto?
Message-ID: <202512111558.3r30rOdC-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>
CC: Carlos Maiolino <cem@kernel.org>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 94c78cfa3bd1858eec3c462aedeb7f297d38d768 xfs: convert buffer cache to use high order folios
date:   9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-r072-20251210 (https://download.01.org/0day-ci/archive/20251211/202512111558.3r30rOdC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512111558.3r30rOdC-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_buf.c:352 xfs_buf_alloc_backing_mem() warn: missing unwind goto?
fs/xfs/xfs_buf.c:352 xfs_buf_alloc_backing_mem() warn: missing unwind goto?

Old smatch warnings:
fs/xfs/xfs_buf.c:756 xfs_buf_get_map() error: we previously assumed 'bp' could be null (see line 738)

vim +352 fs/xfs/xfs_buf.c

0e6e847ffe3743 fs/xfs/linux-2.6/xfs_buf.c Dave Chinner      2011-03-26  273  
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  274  /*
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  275   * Allocate backing memory for a buffer.
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  276   *
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  277   * For tmpfs-backed buffers used by in-memory btrees this directly maps the
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  278   * tmpfs page cache folios.
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  279   *
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  280   * For real file system buffers there are three different kinds backing memory:
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  281   *
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  282   * The first type backs the buffer by a kmalloc allocation.  This is done for
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  283   * less than PAGE_SIZE allocations to avoid wasting memory.
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  284   *
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  285   * The second type is a single folio buffer - this may be a high order folio or
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  286   * just a single page sized folio, but either way they get treated the same way
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  287   * by the rest of the code - the buffer memory spans a single contiguous memory
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  288   * region that we don't have to map and unmap to access the data directly.
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  289   *
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  290   * The third type of buffer is the multi-page buffer. These are always made
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  291   * up of single pages so that they can be fed to vmap_ram() to return a
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  292   * contiguous memory region we can access the data through, or mark it as
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  293   * XBF_UNMAPPED and access the data directly through individual page_address()
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  294   * calls.
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  295   */
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  296  static int
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  297  xfs_buf_alloc_backing_mem(
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  298  	struct xfs_buf	*bp,
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  299  	xfs_buf_flags_t	flags)
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  300  {
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  301  	size_t		size = BBTOB(bp->b_length);
0b3a76e955ebe3 fs/xfs/xfs_buf.c           Dave Chinner      2024-01-16  302  	gfp_t		gfp_mask = GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_NOWARN;
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  303  	struct folio	*folio;
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  304  	long		filled = 0;
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  305  
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  306  	if (xfs_buftarg_is_mem(bp->b_target))
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  307  		return xmbuf_map_page(bp);
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  308  
4ef39828318220 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  309  	/* Assure zeroed buffer for non-read cases. */
4ef39828318220 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  310  	if (!(flags & XBF_READ))
4ef39828318220 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  311  		gfp_mask |= __GFP_ZERO;
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  312  
289ae7b48c2c4d fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  313  	if (flags & XBF_READ_AHEAD)
289ae7b48c2c4d fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  314  		gfp_mask |= __GFP_NORETRY;
289ae7b48c2c4d fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  315  
4ef39828318220 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  316  	/*
4ef39828318220 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  317  	 * For buffers smaller than PAGE_SIZE use a kmalloc allocation if that
4ef39828318220 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  318  	 * is properly aligned.  The slab allocator now guarantees an aligned
4ef39828318220 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  319  	 * allocation for all power of two sizes, which matches most of the
4ef39828318220 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  320  	 * smaller than PAGE_SIZE buffers used by XFS.
4ef39828318220 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  321  	 */
4ef39828318220 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  322  	if (size < PAGE_SIZE && is_power_of_2(size))
4ef39828318220 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  323  		return xfs_buf_alloc_kmem(bp, size, gfp_mask);
4ef39828318220 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  324  
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  325  	/*
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  326  	 * Don't bother with the retry loop for single PAGE allocations: vmalloc
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  327  	 * won't do any better.
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  328  	 */
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  329  	if (size <= PAGE_SIZE)
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  330  		gfp_mask |= __GFP_NOFAIL;
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  331  
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  332  	/*
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  333  	 * Optimistically attempt a single high order folio allocation for
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  334  	 * larger than PAGE_SIZE buffers.
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  335  	 *
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  336  	 * Allocating a high order folio makes the assumption that buffers are a
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  337  	 * power-of-2 size, matching the power-of-2 folios sizes available.
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  338  	 *
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  339  	 * The exception here are user xattr data buffers, which can be arbitrarily
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  340  	 * sized up to 64kB plus structure metadata, skip straight to the vmalloc
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  341  	 * path for them instead of wasting memory here.
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  342  	 */
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  343  	if (size > PAGE_SIZE) {
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  344  		if (!is_power_of_2(size))
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  345  			goto fallback;
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  346  		gfp_mask &= ~__GFP_DIRECT_RECLAIM;
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  347  		gfp_mask |= __GFP_NORETRY;
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  348  	}
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  349  	folio = folio_alloc(gfp_mask, get_order(size));
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  350  	if (!folio) {
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  351  		if (size <= PAGE_SIZE)
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10 @352  			return -ENOMEM;
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  353  		goto fallback;
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  354  	}
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  355  	bp->b_addr = folio_address(folio);
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  356  	bp->b_page_array[0] = &folio->page;
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  357  	bp->b_pages = bp->b_page_array;
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  358  	bp->b_page_count = 1;
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  359  	bp->b_flags |= _XBF_PAGES;
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  360  	return 0;
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  361  
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  362  fallback:
94c78cfa3bd185 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  363  	/* Fall back to allocating an array of single page folios. */
50a524e0ef9be0 fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-10  364  	bp->b_page_count = DIV_ROUND_UP(size, PAGE_SIZE);
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  365  	if (bp->b_page_count <= XB_PAGES) {
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  366  		bp->b_pages = bp->b_page_array;
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  367  	} else {
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  368  		bp->b_pages = kzalloc(sizeof(struct page *) * bp->b_page_count,
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  369  					gfp_mask);
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  370  		if (!bp->b_pages)
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  371  			return -ENOMEM;
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  372  	}
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  373  	bp->b_flags |= _XBF_PAGES;
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  374  
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  375  	/*
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  376  	 * Bulk filling of pages can take multiple calls. Not filling the entire
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  377  	 * array is not an allocation failure, so don't back off if we get at
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  378  	 * least one extra page.
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  379  	 */
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  380  	for (;;) {
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  381  		long	last = filled;
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  382  
6bf9b5b40af373 fs/xfs/xfs_buf.c           Luiz Capitulino   2024-12-23  383  		filled = alloc_pages_bulk(gfp_mask, bp->b_page_count,
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  384  					  bp->b_pages);
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  385  		if (filled == bp->b_page_count) {
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  386  			XFS_STATS_INC(bp->b_mount, xb_page_found);
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  387  			break;
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  388  		}
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  389  
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  390  		if (filled != last)
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  391  			continue;
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  392  
ce8e922c0e79c8 fs/xfs/linux-2.6/xfs_buf.c Nathan Scott      2006-01-11  393  		if (flags & XBF_READ_AHEAD) {
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  394  			xfs_buf_free_pages(bp);
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  395  			return -ENOMEM;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  396  		}
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  397  
dbd329f1e44ed4 fs/xfs/xfs_buf.c           Christoph Hellwig 2019-06-28  398  		XFS_STATS_INC(bp->b_mount, xb_page_retries);
4034247a0d6ab2 fs/xfs/xfs_buf.c           NeilBrown         2022-01-14  399  		memalloc_retry_wait(gfp_mask);
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  400  	}
0e6e847ffe3743 fs/xfs/linux-2.6/xfs_buf.c Dave Chinner      2011-03-26  401  	return 0;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  402  }
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  403  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
