Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD7F25B086
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jul 2026 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784473374; cv=none; b=S2RuPHUf+ETHg8bHZzw/YK6XCUOyNWE/m/9MBRIYMoNCrg5JnmPfF6IBBtjG9BlIzJnMYMzUJsS3jdNlrzDe6heaOKTEAqSqvX1TQcsau/hNiHcqkAcv3CyreBgpXTwl+h/VLHYeJSYNGccg6Xy1+hNucspMkcCgvw6tMYSB/Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784473374; c=relaxed/simple;
	bh=ql5hc7HH/MNKHDdb1SbaGKljixvbKy490Ip+/Hctafg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OExaBWUl5d3MArBkM6YDVj7jWbDtVpRoN7sYBS21dn9NLo6c/sCLeiqpGRrMXezDVq0oQqYdgeUrd4bnlKOIZK3dqmvmmO0ItVI4kq8hWD41mPrm4OtOv3UaKRw8WYA7LrvlgypE8RGxur0Z6XYeZaqvDg4I9L83yt0WYM/DO0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcZVCkaz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcZVCkaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784473372; x=1816009372;
  h=date:from:to:cc:subject:message-id;
  bh=ql5hc7HH/MNKHDdb1SbaGKljixvbKy490Ip+/Hctafg=;
  b=YcZVCkazPY/+o68ey7qhuuJWmwHuORF1s8sfLxS/HTZgEy4x7itSkteH
   sWLwMy5S4JB+tvTaROPR7b1EVeww7k1ZmKjYuknULLjfWrN4Zrp/ePLnl
   F2ypcOvPnWDdQy8vN8cmz1OffsoyRXRpjYlxXqHRLOJTFNZkWZe7hPFK6
   4uO9ppZVcrW8o0d1GalutTed+niVLn88x3RvhB3HyKOG3cO+w8fMhP2+c
   OvnbOQhkiZAMqsfP9eVxxXqxZ5dHYy/0LZNIquGe9GsvRHizbVqFzQmZc
   8BAJ65IU/XSc3ctYF6c7d5e/D2l0QC1eo4nMHseavrG5MHpEmpz5RAWAb
   A==;
X-CSE-ConnectionGUID: 1PjvDWJqQROoKHuFhix/Zw==
X-CSE-MsgGUID: ia8iBuqcRz2GJLKQbznVPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95722494"
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="95722494"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 08:02:51 -0700
X-CSE-ConnectionGUID: s/jD0YRUTN2rpWKOG3ls+Q==
X-CSE-MsgGUID: 0qZuTKL9TxWVOxtmnvVUIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="287297223"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Jul 2026 08:02:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlT2U-00000000VVv-1SPu;
	Sun, 19 Jul 2026 15:02:46 +0000
Date: Sun, 19 Jul 2026 23:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/ntfs/compress.c:588:1-11: second lock on line 588
Message-ID: <202607192246.hCy6XxKK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>
CC: Christoph Hellwig <hch@lst.de>

Hi Namjae,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 47503f989736d6c4c9f8bfca1c28d267473ccd4b ntfs: add Kconfig and Makefile
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: alpha-randconfig-r062-20260719 (https://download.01.org/0day-ci/archive/20260719/202607192246.hCy6XxKK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 47503f989736 ("ntfs: add Kconfig and Makefile")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607192246.hCy6XxKK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ntfs/compress.c:588:1-11: second lock on line 588
--
>> fs/ntfs/ea.c:348:17-18: WARNING kmalloc is used to allocate this memory at line 218
   fs/ntfs/ea.c:347:14-15: WARNING kmalloc is used to allocate this memory at line 289
--
>> fs/ntfs/iomap.c:481:14-15: WARNING kmalloc is used to allocate this memory at line 460
--
>> fs/ntfs/compress.c:843:2-8: preceding lock on line 588
   fs/ntfs/compress.c:847:1-7: preceding lock on line 588

vim +588 fs/ntfs/compress.c

1e9ea7e04472d4 Namjae Jeon 2025-12-30  444  
495e90fa334828 Namjae Jeon 2026-02-13  445  /*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  446   * ntfs_read_compressed_block - read a compressed block into the page cache
495e90fa334828 Namjae Jeon 2026-02-13  447   * @folio:	locked folio in the compression block(s) we need to read
1e9ea7e04472d4 Namjae Jeon 2025-12-30  448   *
1e9ea7e04472d4 Namjae Jeon 2025-12-30  449   * When we are called the page has already been verified to be locked and the
1e9ea7e04472d4 Namjae Jeon 2025-12-30  450   * attribute is known to be non-resident, not encrypted, but compressed.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  451   *
1e9ea7e04472d4 Namjae Jeon 2025-12-30  452   * 1. Determine which compression block(s) @page is in.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  453   * 2. Get hold of all pages corresponding to this/these compression block(s).
1e9ea7e04472d4 Namjae Jeon 2025-12-30  454   * 3. Read the (first) compression block.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  455   * 4. Decompress it into the corresponding pages.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  456   * 5. Throw the compressed data away and proceed to 3. for the next compression
1e9ea7e04472d4 Namjae Jeon 2025-12-30  457   *    block or return success if no more compression blocks left.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  458   *
1e9ea7e04472d4 Namjae Jeon 2025-12-30  459   * Warning: We have to be careful what we do about existing pages. They might
1e9ea7e04472d4 Namjae Jeon 2025-12-30  460   * have been written to so that we would lose data if we were to just overwrite
1e9ea7e04472d4 Namjae Jeon 2025-12-30  461   * them with the out-of-date uncompressed data.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  462   */
495e90fa334828 Namjae Jeon 2026-02-13  463  int ntfs_read_compressed_block(struct folio *folio)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  464  {
495e90fa334828 Namjae Jeon 2026-02-13  465  	struct page *page = &folio->page;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  466  	loff_t i_size;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  467  	s64 initialized_size;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  468  	struct address_space *mapping = page->mapping;
495e90fa334828 Namjae Jeon 2026-02-13  469  	struct ntfs_inode *ni = NTFS_I(mapping->host);
495e90fa334828 Namjae Jeon 2026-02-13  470  	struct ntfs_volume *vol = ni->vol;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  471  	struct super_block *sb = vol->sb;
495e90fa334828 Namjae Jeon 2026-02-13  472  	struct runlist_element *rl;
495e90fa334828 Namjae Jeon 2026-02-13  473  	unsigned long flags;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  474  	u8 *cb, *cb_pos, *cb_end;
495e90fa334828 Namjae Jeon 2026-02-13  475  	unsigned long offset, index = page->__folio_index;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  476  	u32 cb_size = ni->itype.compressed.block_size;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  477  	u64 cb_size_mask = cb_size - 1UL;
495e90fa334828 Namjae Jeon 2026-02-13  478  	s64 vcn;
495e90fa334828 Namjae Jeon 2026-02-13  479  	s64 lcn;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  480  	/* The first wanted vcn (minimum alignment is PAGE_SIZE). */
495e90fa334828 Namjae Jeon 2026-02-13  481  	s64 start_vcn = (((s64)index << PAGE_SHIFT) & ~cb_size_mask) >>
1e9ea7e04472d4 Namjae Jeon 2025-12-30  482  			vol->cluster_size_bits;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  483  	/*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  484  	 * The first vcn after the last wanted vcn (minimum alignment is again
1e9ea7e04472d4 Namjae Jeon 2025-12-30  485  	 * PAGE_SIZE.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  486  	 */
495e90fa334828 Namjae Jeon 2026-02-13  487  	s64 end_vcn = ((((s64)(index + 1UL) << PAGE_SHIFT) + cb_size - 1)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  488  			& ~cb_size_mask) >> vol->cluster_size_bits;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  489  	/* Number of compression blocks (cbs) in the wanted vcn range. */
495e90fa334828 Namjae Jeon 2026-02-13  490  	unsigned int nr_cbs = ntfs_cluster_to_bytes(vol, end_vcn - start_vcn) >>
495e90fa334828 Namjae Jeon 2026-02-13  491  			ni->itype.compressed.block_size_bits;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  492  	/*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  493  	 * Number of pages required to store the uncompressed data from all
1e9ea7e04472d4 Namjae Jeon 2025-12-30  494  	 * compression blocks (cbs) overlapping @page. Due to alignment
1e9ea7e04472d4 Namjae Jeon 2025-12-30  495  	 * guarantees of start_vcn and end_vcn, no need to round up here.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  496  	 */
495e90fa334828 Namjae Jeon 2026-02-13  497  	unsigned int nr_pages = ntfs_cluster_to_pidx(vol, end_vcn - start_vcn);
495e90fa334828 Namjae Jeon 2026-02-13  498  	unsigned int xpage, max_page, cur_page, cur_ofs, i, page_ofs, page_index;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  499  	unsigned int cb_clusters, cb_max_ofs;
495e90fa334828 Namjae Jeon 2026-02-13  500  	int cb_max_page, err = 0;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  501  	struct page **pages;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  502  	int *completed_pages;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  503  	unsigned char xpage_done = 0;
495e90fa334828 Namjae Jeon 2026-02-13  504  	struct page *lpage;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  505  
495e90fa334828 Namjae Jeon 2026-02-13  506  	ntfs_debug("Entering, page->index = 0x%lx, cb_size = 0x%x, nr_pages = %i.",
495e90fa334828 Namjae Jeon 2026-02-13  507  			index, cb_size, nr_pages);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  508  	/*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  509  	 * Bad things happen if we get here for anything that is not an
1e9ea7e04472d4 Namjae Jeon 2025-12-30  510  	 * unnamed $DATA attribute.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  511  	 */
495e90fa334828 Namjae Jeon 2026-02-13  512  	if (ni->type != AT_DATA || ni->name_len) {
495e90fa334828 Namjae Jeon 2026-02-13  513  		unlock_page(page);
495e90fa334828 Namjae Jeon 2026-02-13  514  		return -EIO;
495e90fa334828 Namjae Jeon 2026-02-13  515  	}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  516  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  517  	pages = kmalloc_array(nr_pages, sizeof(struct page *), GFP_NOFS);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  518  	completed_pages = kmalloc_array(nr_pages + 1, sizeof(int), GFP_NOFS);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  519  
495e90fa334828 Namjae Jeon 2026-02-13  520  	if (unlikely(!pages || !completed_pages)) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  521  		kfree(pages);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  522  		kfree(completed_pages);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  523  		unlock_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  524  		ntfs_error(vol->sb, "Failed to allocate internal buffers.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  525  		return -ENOMEM;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  526  	}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  527  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  528  	/*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  529  	 * We have already been given one page, this is the one we must do.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  530  	 * Once again, the alignment guarantees keep it simple.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  531  	 */
495e90fa334828 Namjae Jeon 2026-02-13  532  	offset = ntfs_cluster_to_pidx(vol, start_vcn);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  533  	xpage = index - offset;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  534  	pages[xpage] = page;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  535  	/*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  536  	 * The remaining pages need to be allocated and inserted into the page
1e9ea7e04472d4 Namjae Jeon 2025-12-30  537  	 * cache, alignment guarantees keep all the below much simpler. (-8
1e9ea7e04472d4 Namjae Jeon 2025-12-30  538  	 */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  539  	read_lock_irqsave(&ni->size_lock, flags);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  540  	i_size = i_size_read(VFS_I(ni));
1e9ea7e04472d4 Namjae Jeon 2025-12-30  541  	initialized_size = ni->initialized_size;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  542  	read_unlock_irqrestore(&ni->size_lock, flags);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  543  	max_page = ((i_size + PAGE_SIZE - 1) >> PAGE_SHIFT) -
1e9ea7e04472d4 Namjae Jeon 2025-12-30  544  			offset;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  545  	/* Is the page fully outside i_size? (truncate in progress) */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  546  	if (xpage >= max_page) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  547  		kfree(pages);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  548  		kfree(completed_pages);
495e90fa334828 Namjae Jeon 2026-02-13  549  		zero_user_segments(page, 0, PAGE_SIZE, 0, 0);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  550  		ntfs_debug("Compressed read outside i_size - truncated?");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  551  		SetPageUptodate(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  552  		unlock_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  553  		return 0;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  554  	}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  555  	if (nr_pages < max_page)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  556  		max_page = nr_pages;
495e90fa334828 Namjae Jeon 2026-02-13  557  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  558  	for (i = 0; i < max_page; i++, offset++) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  559  		if (i != xpage)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  560  			pages[i] = grab_cache_page_nowait(mapping, offset);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  561  		page = pages[i];
1e9ea7e04472d4 Namjae Jeon 2025-12-30  562  		if (page) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  563  			/*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  564  			 * We only (re)read the page if it isn't already read
1e9ea7e04472d4 Namjae Jeon 2025-12-30  565  			 * in and/or dirty or we would be losing data or at
1e9ea7e04472d4 Namjae Jeon 2025-12-30  566  			 * least wasting our time.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  567  			 */
495e90fa334828 Namjae Jeon 2026-02-13  568  			if (!PageDirty(page) && (!PageUptodate(page))) {
495e90fa334828 Namjae Jeon 2026-02-13  569  				kmap_local_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  570  				continue;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  571  			}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  572  			unlock_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  573  			put_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  574  			pages[i] = NULL;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  575  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  576  	}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  577  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  578  	/*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  579  	 * We have the runlist, and all the destination pages we need to fill.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  580  	 * Now read the first compression block.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  581  	 */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  582  	cur_page = 0;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  583  	cur_ofs = 0;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  584  	cb_clusters = ni->itype.compressed.block_clusters;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  585  do_next_cb:
1e9ea7e04472d4 Namjae Jeon 2025-12-30  586  	nr_cbs--;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  587  
495e90fa334828 Namjae Jeon 2026-02-13 @588  	mutex_lock(&ntfs_cb_lock);
495e90fa334828 Namjae Jeon 2026-02-13  589  	if (!ntfs_compression_buffer)
495e90fa334828 Namjae Jeon 2026-02-13  590  		if (allocate_compression_buffers()) {
495e90fa334828 Namjae Jeon 2026-02-13  591  			mutex_unlock(&ntfs_cb_lock);
495e90fa334828 Namjae Jeon 2026-02-13  592  			goto err_out;
495e90fa334828 Namjae Jeon 2026-02-13  593  		}
495e90fa334828 Namjae Jeon 2026-02-13  594  
495e90fa334828 Namjae Jeon 2026-02-13  595  
495e90fa334828 Namjae Jeon 2026-02-13  596  	cb = ntfs_compression_buffer;
495e90fa334828 Namjae Jeon 2026-02-13  597  	cb_pos = cb;
495e90fa334828 Namjae Jeon 2026-02-13  598  	cb_end = cb + cb_size;
495e90fa334828 Namjae Jeon 2026-02-13  599  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  600  	rl = NULL;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  601  	for (vcn = start_vcn, start_vcn += cb_clusters; vcn < start_vcn;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  602  			vcn++) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  603  		bool is_retry = false;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  604  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  605  		if (!rl) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  606  lock_retry_remap:
1e9ea7e04472d4 Namjae Jeon 2025-12-30  607  			down_read(&ni->runlist.lock);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  608  			rl = ni->runlist.rl;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  609  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  610  		if (likely(rl != NULL)) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  611  			/* Seek to element containing target vcn. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  612  			while (rl->length && rl[1].vcn <= vcn)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  613  				rl++;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  614  			lcn = ntfs_rl_vcn_to_lcn(rl, vcn);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  615  		} else
1e9ea7e04472d4 Namjae Jeon 2025-12-30  616  			lcn = LCN_RL_NOT_MAPPED;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  617  		ntfs_debug("Reading vcn = 0x%llx, lcn = 0x%llx.",
1e9ea7e04472d4 Namjae Jeon 2025-12-30  618  				(unsigned long long)vcn,
1e9ea7e04472d4 Namjae Jeon 2025-12-30  619  				(unsigned long long)lcn);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  620  		if (lcn < 0) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  621  			/*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  622  			 * When we reach the first sparse cluster we have
1e9ea7e04472d4 Namjae Jeon 2025-12-30  623  			 * finished with the cb.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  624  			 */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  625  			if (lcn == LCN_HOLE)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  626  				break;
495e90fa334828 Namjae Jeon 2026-02-13  627  			if (is_retry || lcn != LCN_RL_NOT_MAPPED) {
495e90fa334828 Namjae Jeon 2026-02-13  628  				mutex_unlock(&ntfs_cb_lock);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  629  				goto rl_err;
495e90fa334828 Namjae Jeon 2026-02-13  630  			}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  631  			is_retry = true;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  632  			/*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  633  			 * Attempt to map runlist, dropping lock for the
1e9ea7e04472d4 Namjae Jeon 2025-12-30  634  			 * duration.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  635  			 */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  636  			up_read(&ni->runlist.lock);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  637  			if (!ntfs_map_runlist(ni, vcn))
1e9ea7e04472d4 Namjae Jeon 2025-12-30  638  				goto lock_retry_remap;
495e90fa334828 Namjae Jeon 2026-02-13  639  			mutex_unlock(&ntfs_cb_lock);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  640  			goto map_rl_err;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  641  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  642  
495e90fa334828 Namjae Jeon 2026-02-13  643  		page_ofs = ntfs_cluster_to_poff(vol, lcn);
495e90fa334828 Namjae Jeon 2026-02-13  644  		page_index = ntfs_cluster_to_pidx(vol, lcn);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  645  
495e90fa334828 Namjae Jeon 2026-02-13  646  		lpage = read_mapping_page(sb->s_bdev->bd_mapping,
495e90fa334828 Namjae Jeon 2026-02-13  647  					  page_index, NULL);
495e90fa334828 Namjae Jeon 2026-02-13  648  		if (IS_ERR(lpage)) {
495e90fa334828 Namjae Jeon 2026-02-13  649  			err = PTR_ERR(lpage);
495e90fa334828 Namjae Jeon 2026-02-13  650  			mutex_unlock(&ntfs_cb_lock);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  651  			goto read_err;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  652  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  653  
495e90fa334828 Namjae Jeon 2026-02-13  654  		lock_page(lpage);
495e90fa334828 Namjae Jeon 2026-02-13  655  		memcpy(cb_pos, page_address(lpage) + page_ofs,
495e90fa334828 Namjae Jeon 2026-02-13  656  		       vol->cluster_size);
495e90fa334828 Namjae Jeon 2026-02-13  657  		unlock_page(lpage);
495e90fa334828 Namjae Jeon 2026-02-13  658  		put_page(lpage);
495e90fa334828 Namjae Jeon 2026-02-13  659  		cb_pos += vol->cluster_size;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  660  	}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  661  
495e90fa334828 Namjae Jeon 2026-02-13  662  	/* Release the lock if we took it. */
495e90fa334828 Namjae Jeon 2026-02-13  663  	if (rl)
495e90fa334828 Namjae Jeon 2026-02-13  664  		up_read(&ni->runlist.lock);
495e90fa334828 Namjae Jeon 2026-02-13  665  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  666  	/* Just a precaution. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  667  	if (cb_pos + 2 <= cb + cb_size)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  668  		*(u16 *)cb_pos = 0;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  669  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  670  	/* Reset cb_pos back to the beginning. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  671  	cb_pos = cb;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  672  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  673  	/* We now have both source (if present) and destination. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  674  	ntfs_debug("Successfully read the compression block.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  675  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  676  	/* The last page and maximum offset within it for the current cb. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  677  	cb_max_page = (cur_page << PAGE_SHIFT) + cur_ofs + cb_size;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  678  	cb_max_ofs = cb_max_page & ~PAGE_MASK;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  679  	cb_max_page >>= PAGE_SHIFT;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  680  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  681  	/* Catch end of file inside a compression block. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  682  	if (cb_max_page > max_page)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  683  		cb_max_page = max_page;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  684  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  685  	if (vcn == start_vcn - cb_clusters) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  686  		/* Sparse cb, zero out page range overlapping the cb. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  687  		ntfs_debug("Found sparse compression block.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  688  		/* We can sleep from now on, so we drop lock. */
495e90fa334828 Namjae Jeon 2026-02-13  689  		mutex_unlock(&ntfs_cb_lock);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  690  		if (cb_max_ofs)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  691  			cb_max_page--;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  692  		for (; cur_page < cb_max_page; cur_page++) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  693  			page = pages[cur_page];
1e9ea7e04472d4 Namjae Jeon 2025-12-30  694  			if (page) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  695  				if (likely(!cur_ofs))
1e9ea7e04472d4 Namjae Jeon 2025-12-30  696  					clear_page(page_address(page));
1e9ea7e04472d4 Namjae Jeon 2025-12-30  697  				else
1e9ea7e04472d4 Namjae Jeon 2025-12-30  698  					memset(page_address(page) + cur_ofs, 0,
1e9ea7e04472d4 Namjae Jeon 2025-12-30  699  							PAGE_SIZE -
1e9ea7e04472d4 Namjae Jeon 2025-12-30  700  							cur_ofs);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  701  				flush_dcache_page(page);
495e90fa334828 Namjae Jeon 2026-02-13  702  				kunmap_local(page_address(page));
1e9ea7e04472d4 Namjae Jeon 2025-12-30  703  				SetPageUptodate(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  704  				unlock_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  705  				if (cur_page == xpage)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  706  					xpage_done = 1;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  707  				else
1e9ea7e04472d4 Namjae Jeon 2025-12-30  708  					put_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  709  				pages[cur_page] = NULL;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  710  			}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  711  			cb_pos += PAGE_SIZE - cur_ofs;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  712  			cur_ofs = 0;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  713  			if (cb_pos >= cb_end)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  714  				break;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  715  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  716  		/* If we have a partial final page, deal with it now. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  717  		if (cb_max_ofs && cb_pos < cb_end) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  718  			page = pages[cur_page];
1e9ea7e04472d4 Namjae Jeon 2025-12-30  719  			if (page)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  720  				memset(page_address(page) + cur_ofs, 0,
1e9ea7e04472d4 Namjae Jeon 2025-12-30  721  						cb_max_ofs - cur_ofs);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  722  			/*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  723  			 * No need to update cb_pos at this stage:
1e9ea7e04472d4 Namjae Jeon 2025-12-30  724  			 *	cb_pos += cb_max_ofs - cur_ofs;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  725  			 */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  726  			cur_ofs = cb_max_ofs;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  727  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  728  	} else if (vcn == start_vcn) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  729  		/* We can't sleep so we need two stages. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  730  		unsigned int cur2_page = cur_page;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  731  		unsigned int cur_ofs2 = cur_ofs;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  732  		u8 *cb_pos2 = cb_pos;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  733  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  734  		ntfs_debug("Found uncompressed compression block.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  735  		/* Uncompressed cb, copy it to the destination pages. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  736  		if (cb_max_ofs)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  737  			cb_max_page--;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  738  		/* First stage: copy data into destination pages. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  739  		for (; cur_page < cb_max_page; cur_page++) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  740  			page = pages[cur_page];
1e9ea7e04472d4 Namjae Jeon 2025-12-30  741  			if (page)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  742  				memcpy(page_address(page) + cur_ofs, cb_pos,
1e9ea7e04472d4 Namjae Jeon 2025-12-30  743  						PAGE_SIZE - cur_ofs);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  744  			cb_pos += PAGE_SIZE - cur_ofs;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  745  			cur_ofs = 0;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  746  			if (cb_pos >= cb_end)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  747  				break;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  748  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  749  		/* If we have a partial final page, deal with it now. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  750  		if (cb_max_ofs && cb_pos < cb_end) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  751  			page = pages[cur_page];
1e9ea7e04472d4 Namjae Jeon 2025-12-30  752  			if (page)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  753  				memcpy(page_address(page) + cur_ofs, cb_pos,
1e9ea7e04472d4 Namjae Jeon 2025-12-30  754  						cb_max_ofs - cur_ofs);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  755  			cb_pos += cb_max_ofs - cur_ofs;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  756  			cur_ofs = cb_max_ofs;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  757  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  758  		/* We can sleep from now on, so drop lock. */
495e90fa334828 Namjae Jeon 2026-02-13  759  		mutex_unlock(&ntfs_cb_lock);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  760  		/* Second stage: finalize pages. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  761  		for (; cur2_page < cb_max_page; cur2_page++) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  762  			page = pages[cur2_page];
1e9ea7e04472d4 Namjae Jeon 2025-12-30  763  			if (page) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  764  				/*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  765  				 * If we are outside the initialized size, zero
1e9ea7e04472d4 Namjae Jeon 2025-12-30  766  				 * the out of bounds page range.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  767  				 */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  768  				handle_bounds_compressed_page(page, i_size,
1e9ea7e04472d4 Namjae Jeon 2025-12-30  769  						initialized_size);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  770  				flush_dcache_page(page);
495e90fa334828 Namjae Jeon 2026-02-13  771  				kunmap_local(page_address(page));
1e9ea7e04472d4 Namjae Jeon 2025-12-30  772  				SetPageUptodate(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  773  				unlock_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  774  				if (cur2_page == xpage)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  775  					xpage_done = 1;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  776  				else
1e9ea7e04472d4 Namjae Jeon 2025-12-30  777  					put_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  778  				pages[cur2_page] = NULL;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  779  			}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  780  			cb_pos2 += PAGE_SIZE - cur_ofs2;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  781  			cur_ofs2 = 0;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  782  			if (cb_pos2 >= cb_end)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  783  				break;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  784  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  785  	} else {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  786  		/* Compressed cb, decompress it into the destination page(s). */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  787  		unsigned int prev_cur_page = cur_page;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  788  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  789  		ntfs_debug("Found compressed compression block.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  790  		err = ntfs_decompress(pages, completed_pages, &cur_page,
1e9ea7e04472d4 Namjae Jeon 2025-12-30  791  				&cur_ofs, cb_max_page, cb_max_ofs, xpage,
1e9ea7e04472d4 Namjae Jeon 2025-12-30  792  				&xpage_done, cb_pos, cb_size - (cb_pos - cb),
1e9ea7e04472d4 Namjae Jeon 2025-12-30  793  				i_size, initialized_size);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  794  		/*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  795  		 * We can sleep from now on, lock already dropped by
1e9ea7e04472d4 Namjae Jeon 2025-12-30  796  		 * ntfs_decompress().
1e9ea7e04472d4 Namjae Jeon 2025-12-30  797  		 */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  798  		if (err) {
495e90fa334828 Namjae Jeon 2026-02-13  799  			ntfs_error(vol->sb,
495e90fa334828 Namjae Jeon 2026-02-13  800  				"ntfs_decompress() failed in inode 0x%lx with error code %i. Skipping this compression block.",
1e9ea7e04472d4 Namjae Jeon 2025-12-30  801  				ni->mft_no, -err);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  802  			/* Release the unfinished pages. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  803  			for (; prev_cur_page < cur_page; prev_cur_page++) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  804  				page = pages[prev_cur_page];
1e9ea7e04472d4 Namjae Jeon 2025-12-30  805  				if (page) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  806  					flush_dcache_page(page);
495e90fa334828 Namjae Jeon 2026-02-13  807  					kunmap_local(page_address(page));
1e9ea7e04472d4 Namjae Jeon 2025-12-30  808  					unlock_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  809  					if (prev_cur_page != xpage)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  810  						put_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  811  					pages[prev_cur_page] = NULL;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  812  				}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  813  			}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  814  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  815  	}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  816  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  817  	/* Do we have more work to do? */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  818  	if (nr_cbs)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  819  		goto do_next_cb;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  820  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  821  	/* Clean up if we have any pages left. Should never happen. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  822  	for (cur_page = 0; cur_page < max_page; cur_page++) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  823  		page = pages[cur_page];
1e9ea7e04472d4 Namjae Jeon 2025-12-30  824  		if (page) {
495e90fa334828 Namjae Jeon 2026-02-13  825  			ntfs_error(vol->sb,
495e90fa334828 Namjae Jeon 2026-02-13  826  				"Still have pages left! Terminating them with extreme prejudice.  Inode 0x%lx, page index 0x%lx.",
495e90fa334828 Namjae Jeon 2026-02-13  827  				ni->mft_no, page->__folio_index);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  828  			flush_dcache_page(page);
495e90fa334828 Namjae Jeon 2026-02-13  829  			kunmap_local(page_address(page));
1e9ea7e04472d4 Namjae Jeon 2025-12-30  830  			unlock_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  831  			if (cur_page != xpage)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  832  				put_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  833  			pages[cur_page] = NULL;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  834  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  835  	}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  836  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  837  	/* We no longer need the list of pages. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  838  	kfree(pages);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  839  	kfree(completed_pages);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  840  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  841  	/* If we have completed the requested page, we return success. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  842  	if (likely(xpage_done))
1e9ea7e04472d4 Namjae Jeon 2025-12-30  843  		return 0;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  844  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  845  	ntfs_debug("Failed. Returning error code %s.", err == -EOVERFLOW ?
1e9ea7e04472d4 Namjae Jeon 2025-12-30  846  			"EOVERFLOW" : (!err ? "EIO" : "unknown error"));
1e9ea7e04472d4 Namjae Jeon 2025-12-30  847  	return err < 0 ? err : -EIO;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  848  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  849  map_rl_err:
495e90fa334828 Namjae Jeon 2026-02-13  850  	ntfs_error(vol->sb, "ntfs_map_runlist() failed. Cannot read compression block.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  851  	goto err_out;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  852  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  853  rl_err:
1e9ea7e04472d4 Namjae Jeon 2025-12-30  854  	up_read(&ni->runlist.lock);
495e90fa334828 Namjae Jeon 2026-02-13  855  	ntfs_error(vol->sb, "ntfs_rl_vcn_to_lcn() failed. Cannot read compression block.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  856  	goto err_out;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  857  
495e90fa334828 Namjae Jeon 2026-02-13  858  read_err:
1e9ea7e04472d4 Namjae Jeon 2025-12-30  859  	up_read(&ni->runlist.lock);
495e90fa334828 Namjae Jeon 2026-02-13  860  	ntfs_error(vol->sb, "IO error while reading compressed data.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  861  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  862  err_out:
1e9ea7e04472d4 Namjae Jeon 2025-12-30  863  	for (i = cur_page; i < max_page; i++) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  864  		page = pages[i];
1e9ea7e04472d4 Namjae Jeon 2025-12-30  865  		if (page) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  866  			flush_dcache_page(page);
495e90fa334828 Namjae Jeon 2026-02-13  867  			kunmap_local(page_address(page));
1e9ea7e04472d4 Namjae Jeon 2025-12-30  868  			unlock_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  869  			if (i != xpage)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  870  				put_page(page);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  871  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  872  	}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  873  	kfree(pages);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  874  	kfree(completed_pages);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  875  	return -EIO;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  876  }
495e90fa334828 Namjae Jeon 2026-02-13  877  

:::::: The code at line 588 was first introduced by commit
:::::: 495e90fa334828d4119061e2726af51d0a0fb4ed ntfs: update attrib operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
