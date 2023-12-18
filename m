Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F462571
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Dec 2023 03:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDo5/6hz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702869025; x=1734405025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TQI73996xDUzVLT6TU8EHVZWaNTTP6WIsQXZcNfCIjQ=;
  b=EDo5/6hzWUhL8s+ZxmhtdPainRTYItSfEqvtlyhF71DnFq46FKUHpslu
   lTtWKWJDDBYVKPk8fH7TofPQ+MLvIyAGZmL8eVQRS6mKh6y34+YJ3VxSn
   aNfqodySHpQhkUb6Z5TWie6rRDx4twWcOrKgAIetlDUiNxApTIeOjgsqu
   fd6fPzWgHvWJrWXZVXbg1Yc5HDJhBz1y+Tj5wQMTvoq17KERGNnrEdLI3
   uPhqbvTqbc4zcUfDvonwziIud3KL7REjoNALUrUiMO/ADbMg+8c8T7zEG
   +hj9E9xnOCeZVpX7hJINAywmKrZqRrL97lHdWmg9QMGLDbUJnGJ16seWf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2657854"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="2657854"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 19:10:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="809661762"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="809661762"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Dec 2023 19:10:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF41H-0003hZ-1V;
	Mon, 18 Dec 2023 03:10:15 +0000
Date: Mon, 18 Dec 2023 11:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 03/14] fs: Reduce stack usage in __mpage_writepage
Message-ID: <202312181026.dVPXFhPM-lkp@intel.com>
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
In-Reply-To: <20231215200245.748418-4-willy@infradead.org>
References: <20231215200245.748418-4-willy@infradead.org>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Christoph Hellwig <hch@lst.de>
CC: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-block@vger.kernel.org

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on gfs2/for-next]
[also build test WARNING on akpm-mm/mm-everything axboe-block/for-next tytso-ext4/dev linus/master v6.7-rc5 next-20231215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/fs-Remove-clean_page_buffers/20231216-040850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
patch link:    https://lore.kernel.org/r/20231215200245.748418-4-willy%40infradead.org
patch subject: [PATCH 03/14] fs: Reduce stack usage in __mpage_writepage
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r081-20231218 (https://download.01.org/0day-ci/archive/20231218/202312181026.dVPXFhPM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312181026.dVPXFhPM-lkp@intel.com/

New smatch warnings:
fs/mpage.c:598 __mpage_writepage() error: uninitialized symbol 'first_block'.

Old smatch warnings:
fs/mpage.c:606 __mpage_writepage() error: uninitialized symbol 'first_block'.

vim +/first_block +598 fs/mpage.c

90768eee4565ad Matthew Wilcox          2014-06-04  457  
d585bdbeb79aa1 Matthew Wilcox (Oracle  2023-01-26  458) static int __mpage_writepage(struct folio *folio, struct writeback_control *wbc,
0ea97180162518 Miklos Szeredi          2007-05-10  459  		      void *data)
^1da177e4c3f41 Linus Torvalds          2005-04-16  460  {
0ea97180162518 Miklos Szeredi          2007-05-10  461  	struct mpage_data *mpd = data;
0ea97180162518 Miklos Szeredi          2007-05-10  462  	struct bio *bio = mpd->bio;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  463) 	struct address_space *mapping = folio->mapping;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  464) 	struct inode *inode = mapping->host;
^1da177e4c3f41 Linus Torvalds          2005-04-16  465  	const unsigned blkbits = inode->i_blkbits;
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  466  	const unsigned blocks_per_page = PAGE_SIZE >> blkbits;
^1da177e4c3f41 Linus Torvalds          2005-04-16  467  	sector_t last_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  468  	sector_t block_in_file;
2d1feeb50a4a22 Matthew Wilcox (Oracle  2023-12-15  469) 	sector_t first_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  470  	unsigned page_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  471  	unsigned first_unmapped = blocks_per_page;
^1da177e4c3f41 Linus Torvalds          2005-04-16  472  	struct block_device *bdev = NULL;
^1da177e4c3f41 Linus Torvalds          2005-04-16  473  	int boundary = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  474  	sector_t boundary_block = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  475  	struct block_device *boundary_bdev = NULL;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  476) 	size_t length;
^1da177e4c3f41 Linus Torvalds          2005-04-16  477  	struct buffer_head map_bh;
^1da177e4c3f41 Linus Torvalds          2005-04-16  478  	loff_t i_size = i_size_read(inode);
0ea97180162518 Miklos Szeredi          2007-05-10  479  	int ret = 0;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  480) 	struct buffer_head *head = folio_buffers(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  481  
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  482) 	if (head) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  483  		struct buffer_head *bh = head;
^1da177e4c3f41 Linus Torvalds          2005-04-16  484  
^1da177e4c3f41 Linus Torvalds          2005-04-16  485  		/* If they're all mapped and dirty, do it */
^1da177e4c3f41 Linus Torvalds          2005-04-16  486  		page_block = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  487  		do {
^1da177e4c3f41 Linus Torvalds          2005-04-16  488  			BUG_ON(buffer_locked(bh));
^1da177e4c3f41 Linus Torvalds          2005-04-16  489  			if (!buffer_mapped(bh)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  490  				/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  491  				 * unmapped dirty buffers are created by
e621900ad28b74 Matthew Wilcox (Oracle  2022-02-09  492) 				 * block_dirty_folio -> mmapped data
^1da177e4c3f41 Linus Torvalds          2005-04-16  493  				 */
^1da177e4c3f41 Linus Torvalds          2005-04-16  494  				if (buffer_dirty(bh))
^1da177e4c3f41 Linus Torvalds          2005-04-16  495  					goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  496  				if (first_unmapped == blocks_per_page)
^1da177e4c3f41 Linus Torvalds          2005-04-16  497  					first_unmapped = page_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  498  				continue;
^1da177e4c3f41 Linus Torvalds          2005-04-16  499  			}
^1da177e4c3f41 Linus Torvalds          2005-04-16  500  
^1da177e4c3f41 Linus Torvalds          2005-04-16  501  			if (first_unmapped != blocks_per_page)
^1da177e4c3f41 Linus Torvalds          2005-04-16  502  				goto confused;	/* hole -> non-hole */
^1da177e4c3f41 Linus Torvalds          2005-04-16  503  
^1da177e4c3f41 Linus Torvalds          2005-04-16  504  			if (!buffer_dirty(bh) || !buffer_uptodate(bh))
^1da177e4c3f41 Linus Torvalds          2005-04-16  505  				goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  506  			if (page_block) {
2d1feeb50a4a22 Matthew Wilcox (Oracle  2023-12-15  507) 				if (bh->b_blocknr != first_block + page_block)
^1da177e4c3f41 Linus Torvalds          2005-04-16  508  					goto confused;
2d1feeb50a4a22 Matthew Wilcox (Oracle  2023-12-15  509) 			} else {
2d1feeb50a4a22 Matthew Wilcox (Oracle  2023-12-15  510) 				first_block = bh->b_blocknr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  511  			}
2d1feeb50a4a22 Matthew Wilcox (Oracle  2023-12-15  512) 			page_block++;
^1da177e4c3f41 Linus Torvalds          2005-04-16  513  			boundary = buffer_boundary(bh);
^1da177e4c3f41 Linus Torvalds          2005-04-16  514  			if (boundary) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  515  				boundary_block = bh->b_blocknr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  516  				boundary_bdev = bh->b_bdev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  517  			}
^1da177e4c3f41 Linus Torvalds          2005-04-16  518  			bdev = bh->b_bdev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  519  		} while ((bh = bh->b_this_page) != head);
^1da177e4c3f41 Linus Torvalds          2005-04-16  520  
^1da177e4c3f41 Linus Torvalds          2005-04-16  521  		if (first_unmapped)
^1da177e4c3f41 Linus Torvalds          2005-04-16  522  			goto page_is_mapped;
^1da177e4c3f41 Linus Torvalds          2005-04-16  523  
^1da177e4c3f41 Linus Torvalds          2005-04-16  524  		/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  525  		 * Page has buffers, but they are all unmapped. The page was
^1da177e4c3f41 Linus Torvalds          2005-04-16  526  		 * created by pagein or read over a hole which was handled by
2c69e2057962b6 Matthew Wilcox (Oracle  2022-04-29  527) 		 * block_read_full_folio().  If this address_space is also
d4388340ae0bc8 Matthew Wilcox (Oracle  2020-06-01  528) 		 * using mpage_readahead then this can rarely happen.
^1da177e4c3f41 Linus Torvalds          2005-04-16  529  		 */
^1da177e4c3f41 Linus Torvalds          2005-04-16  530  		goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  531  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  532  
^1da177e4c3f41 Linus Torvalds          2005-04-16  533  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  534  	 * The page has no buffers: map it to disk
^1da177e4c3f41 Linus Torvalds          2005-04-16  535  	 */
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  536) 	BUG_ON(!folio_test_uptodate(folio));
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  537) 	block_in_file = (sector_t)folio->index << (PAGE_SHIFT - blkbits);
4b89a37d54a0b5 Jan Kara                2023-01-03  538  	/*
4b89a37d54a0b5 Jan Kara                2023-01-03  539  	 * Whole page beyond EOF? Skip allocating blocks to avoid leaking
4b89a37d54a0b5 Jan Kara                2023-01-03  540  	 * space.
4b89a37d54a0b5 Jan Kara                2023-01-03  541  	 */
4b89a37d54a0b5 Jan Kara                2023-01-03  542  	if (block_in_file >= (i_size + (1 << blkbits) - 1) >> blkbits)
4b89a37d54a0b5 Jan Kara                2023-01-03  543  		goto page_is_mapped;
^1da177e4c3f41 Linus Torvalds          2005-04-16  544  	last_block = (i_size - 1) >> blkbits;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  545) 	map_bh.b_folio = folio;
^1da177e4c3f41 Linus Torvalds          2005-04-16  546  	for (page_block = 0; page_block < blocks_per_page; ) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  547  
^1da177e4c3f41 Linus Torvalds          2005-04-16  548  		map_bh.b_state = 0;
b0cf2321c65991 Badari Pulavarty        2006-03-26  549  		map_bh.b_size = 1 << blkbits;
0ea97180162518 Miklos Szeredi          2007-05-10  550  		if (mpd->get_block(inode, block_in_file, &map_bh, 1))
^1da177e4c3f41 Linus Torvalds          2005-04-16  551  			goto confused;
7010839ccfd4f8 Jan Kara                2023-01-25  552  		if (!buffer_mapped(&map_bh))
7010839ccfd4f8 Jan Kara                2023-01-25  553  			goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  554  		if (buffer_new(&map_bh))
e64855c6cfaa0a Jan Kara                2016-11-04  555  			clean_bdev_bh_alias(&map_bh);
^1da177e4c3f41 Linus Torvalds          2005-04-16  556  		if (buffer_boundary(&map_bh)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  557  			boundary_block = map_bh.b_blocknr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  558  			boundary_bdev = map_bh.b_bdev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  559  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  560  		if (page_block) {
2d1feeb50a4a22 Matthew Wilcox (Oracle  2023-12-15  561) 			if (map_bh.b_blocknr != first_block + page_block)
^1da177e4c3f41 Linus Torvalds          2005-04-16  562  				goto confused;
2d1feeb50a4a22 Matthew Wilcox (Oracle  2023-12-15  563) 		} else {
2d1feeb50a4a22 Matthew Wilcox (Oracle  2023-12-15  564) 			first_block = map_bh.b_blocknr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  565  		}
2d1feeb50a4a22 Matthew Wilcox (Oracle  2023-12-15  566) 		page_block++;
^1da177e4c3f41 Linus Torvalds          2005-04-16  567  		boundary = buffer_boundary(&map_bh);
^1da177e4c3f41 Linus Torvalds          2005-04-16  568  		bdev = map_bh.b_bdev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  569  		if (block_in_file == last_block)
^1da177e4c3f41 Linus Torvalds          2005-04-16  570  			break;
^1da177e4c3f41 Linus Torvalds          2005-04-16  571  		block_in_file++;
^1da177e4c3f41 Linus Torvalds          2005-04-16  572  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  573  	BUG_ON(page_block == 0);
^1da177e4c3f41 Linus Torvalds          2005-04-16  574  
^1da177e4c3f41 Linus Torvalds          2005-04-16  575  	first_unmapped = page_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  576  
^1da177e4c3f41 Linus Torvalds          2005-04-16  577  page_is_mapped:
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  578) 	/* Don't bother writing beyond EOF, truncate will discard the folio */
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  579) 	if (folio_pos(folio) >= i_size)
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  580) 		goto confused;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  581) 	length = folio_size(folio);
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  582) 	if (folio_pos(folio) + length > i_size) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  583  		/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  584  		 * The page straddles i_size.  It must be zeroed out on each
2a61aa40163852 Adam Buchbinder         2009-12-11  585  		 * and every writepage invocation because it may be mmapped.
^1da177e4c3f41 Linus Torvalds          2005-04-16  586  		 * "A file is mapped in multiples of the page size.  For a file
^1da177e4c3f41 Linus Torvalds          2005-04-16  587  		 * that is not a multiple of the page size, the remaining memory
^1da177e4c3f41 Linus Torvalds          2005-04-16  588  		 * is zeroed when mapped, and writes to that region are not
^1da177e4c3f41 Linus Torvalds          2005-04-16  589  		 * written out to the file."
^1da177e4c3f41 Linus Torvalds          2005-04-16  590  		 */
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  591) 		length = i_size - folio_pos(folio);
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  592) 		folio_zero_segment(folio, length, folio_size(folio));
^1da177e4c3f41 Linus Torvalds          2005-04-16  593  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  594  
^1da177e4c3f41 Linus Torvalds          2005-04-16  595  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  596  	 * This page will go to BIO.  Do we need to send this BIO off first?
^1da177e4c3f41 Linus Torvalds          2005-04-16  597  	 */
2d1feeb50a4a22 Matthew Wilcox (Oracle  2023-12-15 @598) 	if (bio && mpd->last_block_in_bio != first_block - 1)
f0d6ca46d68670 Pankaj Raghav           2023-04-11  599  		bio = mpage_bio_submit_write(bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  600  
^1da177e4c3f41 Linus Torvalds          2005-04-16  601  alloc_new:
^1da177e4c3f41 Linus Torvalds          2005-04-16  602  	if (bio == NULL) {
77c436de01c0f2 Christoph Hellwig       2022-02-22  603  		bio = bio_alloc(bdev, BIO_MAX_VECS,
77c436de01c0f2 Christoph Hellwig       2022-02-22  604  				REQ_OP_WRITE | wbc_to_write_flags(wbc),
77c436de01c0f2 Christoph Hellwig       2022-02-22  605  				GFP_NOFS);
2d1feeb50a4a22 Matthew Wilcox (Oracle  2023-12-15  606) 		bio->bi_iter.bi_sector = first_block << (blkbits - 9);
b16b1deb553adc Tejun Heo               2015-06-02  607  		wbc_init_bio(wbc, bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  608  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  609  
^1da177e4c3f41 Linus Torvalds          2005-04-16  610  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  611  	 * Must try to add the page before marking the buffer clean or
^1da177e4c3f41 Linus Torvalds          2005-04-16  612  	 * the confused fail path above (OOM) will be very confused when
^1da177e4c3f41 Linus Torvalds          2005-04-16  613  	 * it finds all bh marked clean (i.e. it will not write anything)
^1da177e4c3f41 Linus Torvalds          2005-04-16  614  	 */
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  615) 	wbc_account_cgroup_owner(wbc, &folio->page, folio_size(folio));
^1da177e4c3f41 Linus Torvalds          2005-04-16  616  	length = first_unmapped << blkbits;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  617) 	if (!bio_add_folio(bio, folio, length, 0)) {
f0d6ca46d68670 Pankaj Raghav           2023-04-11  618  		bio = mpage_bio_submit_write(bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  619  		goto alloc_new;
^1da177e4c3f41 Linus Torvalds          2005-04-16  620  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  621  
5707a2a9ae367f Matthew Wilcox (Oracle  2023-12-15  622) 	clean_buffers(folio, first_unmapped);
^1da177e4c3f41 Linus Torvalds          2005-04-16  623  
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  624) 	BUG_ON(folio_test_writeback(folio));
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  625) 	folio_start_writeback(folio);
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  626) 	folio_unlock(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  627  	if (boundary || (first_unmapped != blocks_per_page)) {
f0d6ca46d68670 Pankaj Raghav           2023-04-11  628  		bio = mpage_bio_submit_write(bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  629  		if (boundary_block) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  630  			write_boundary_block(boundary_bdev,
^1da177e4c3f41 Linus Torvalds          2005-04-16  631  					boundary_block, 1 << blkbits);
^1da177e4c3f41 Linus Torvalds          2005-04-16  632  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  633  	} else {
2d1feeb50a4a22 Matthew Wilcox (Oracle  2023-12-15  634) 		mpd->last_block_in_bio = first_block + blocks_per_page - 1;
^1da177e4c3f41 Linus Torvalds          2005-04-16  635  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  636  	goto out;
^1da177e4c3f41 Linus Torvalds          2005-04-16  637  
^1da177e4c3f41 Linus Torvalds          2005-04-16  638  confused:
^1da177e4c3f41 Linus Torvalds          2005-04-16  639  	if (bio)
f0d6ca46d68670 Pankaj Raghav           2023-04-11  640  		bio = mpage_bio_submit_write(bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  641  
^1da177e4c3f41 Linus Torvalds          2005-04-16  642  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  643  	 * The caller has a ref on the inode, so *mapping is stable
^1da177e4c3f41 Linus Torvalds          2005-04-16  644  	 */
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  645) 	ret = block_write_full_page(&folio->page, mpd->get_block, wbc);
0ea97180162518 Miklos Szeredi          2007-05-10  646  	mapping_set_error(mapping, ret);
^1da177e4c3f41 Linus Torvalds          2005-04-16  647  out:
0ea97180162518 Miklos Szeredi          2007-05-10  648  	mpd->bio = bio;
0ea97180162518 Miklos Szeredi          2007-05-10  649  	return ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  650  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  651  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
