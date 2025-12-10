Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4798C30216D
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 21:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765401960; cv=none; b=CbExtj+JvHT6eGkwL0vgB6pH3CWebnfkiZEXL4W+d3EygnKYbhfC/O6fx3Fd8Rnd9nTuuiDuasofG1jZpbfqVMw626n+jxr4VaSR4QcNoRz26KAW4ipWkmQIBbEUYkOyGdGTNPcjtrZsRPjd+ytJz4jqTAuX+4CAy/s+6FHvGMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765401960; c=relaxed/simple;
	bh=yVvI6yK8cJipvJJPOMnVgGkjKYLTSkE3jlv0OUsZy/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kyE+1/wuFOlVHPfmxLGpp9RLvsPpnUclpMY73NFEEhThMx91EV02oKpwhvfeyQ9v5jVXGrZbJ92IPXFSz5JQbnnp5Nf/e4ZEUzX4zS5yeq1s7Xn/IibobJvhOwQdkl/5akP+b0w8hDdixm+mbtIu+hkUdF21mgnZuVIzQTAjeF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlILDwqi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlILDwqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765401958; x=1796937958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yVvI6yK8cJipvJJPOMnVgGkjKYLTSkE3jlv0OUsZy/g=;
  b=QlILDwqi3Jfc3fil8qK9HJOE1bsxU8DOg1rrGCz8+qRaLzfTdXX/iflh
   tZawlmwlVg5jc+a75aexf+5czK2GiU+RbfnwAh/09YsVbLkLkKy3dpCi+
   Ti3mEgSy7R2izonAMeOnrboAhddJGutBzZqiwSA4Y9QN0UJIJCZOhS+0/
   VpFVbjiDGmjoUW8LTpBJ1JHoJNPISmsSUWYiVlB7pdz2U95N6Apt9Bfcs
   ff7OJZcGNB45wfuuFmc80U0Eo3tCBW8Usz6cPHc8s5NKWeufydIZntUxo
   UH6aUrG5LWSWNHrENGna3JQXhnsRsN8SqsRHGVF3Mas0X5AjvJDZuKpon
   Q==;
X-CSE-ConnectionGUID: LEmlY7O5S2SlByydZ91n4w==
X-CSE-MsgGUID: Rq3moIkgTWGMOwRbd7FDYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84987490"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="84987490"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 13:25:58 -0800
X-CSE-ConnectionGUID: yFGyr2tATmGwk9D0n421Dw==
X-CSE-MsgGUID: QJnZj+krT3GAsigulmPhqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="234039553"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2025 13:25:57 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTRh3-000000003mP-3iUD;
	Wed, 10 Dec 2025 21:25:53 +0000
Date: Thu, 11 Dec 2025 05:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/mpage.c:587 mpage_write_folio() error: uninitialized symbol
 'first_block'.
Message-ID: <202512110512.4bVNJtCX-lkp@intel.com>
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
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0048fbb4011ec55c32d3148b2cda56433f273375
commit: bb01e8cc10f0c5b1151a5f047289fcfa5519e351 fs: use writeback_iter directly in mpage_writepages
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110512.4bVNJtCX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512110512.4bVNJtCX-lkp@intel.com/

New smatch warnings:
fs/mpage.c:587 mpage_write_folio() error: uninitialized symbol 'first_block'.

Old smatch warnings:
fs/mpage.c:282 do_mpage_readpage() error: uninitialized symbol 'first_block'.
fs/mpage.c:291 do_mpage_readpage() error: uninitialized symbol 'first_block'.
fs/mpage.c:595 mpage_write_folio() error: uninitialized symbol 'first_block'.

vim +/first_block +587 fs/mpage.c

90768eee4565ad Matthew Wilcox          2014-06-04  447  
bb01e8cc10f0c5 Christoph Hellwig       2025-05-07  448  static int mpage_write_folio(struct writeback_control *wbc, struct folio *folio,
bb01e8cc10f0c5 Christoph Hellwig       2025-05-07  449  		struct mpage_data *mpd)
^1da177e4c3f41 Linus Torvalds          2005-04-16  450  {
0ea97180162518 Miklos Szeredi          2007-05-10  451  	struct bio *bio = mpd->bio;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  452) 	struct address_space *mapping = folio->mapping;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  453) 	struct inode *inode = mapping->host;
^1da177e4c3f41 Linus Torvalds          2005-04-16  454  	const unsigned blkbits = inode->i_blkbits;
8b45a4f4133d30 Luis Chamberlain        2025-02-21  455  	const unsigned blocks_per_folio = folio_size(folio) >> blkbits;
^1da177e4c3f41 Linus Torvalds          2005-04-16  456  	sector_t last_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  457  	sector_t block_in_file;
6ad7c607b125ce Matthew Wilcox (Oracle  2023-12-15  458) 	sector_t first_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  459  	unsigned page_block;
8b45a4f4133d30 Luis Chamberlain        2025-02-21  460  	unsigned first_unmapped = blocks_per_folio;
^1da177e4c3f41 Linus Torvalds          2005-04-16  461  	struct block_device *bdev = NULL;
^1da177e4c3f41 Linus Torvalds          2005-04-16  462  	int boundary = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  463  	sector_t boundary_block = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  464  	struct block_device *boundary_bdev = NULL;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  465) 	size_t length;
^1da177e4c3f41 Linus Torvalds          2005-04-16  466  	struct buffer_head map_bh;
^1da177e4c3f41 Linus Torvalds          2005-04-16  467  	loff_t i_size = i_size_read(inode);
0ea97180162518 Miklos Szeredi          2007-05-10  468  	int ret = 0;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  469) 	struct buffer_head *head = folio_buffers(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  470  
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  471) 	if (head) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  472  		struct buffer_head *bh = head;
^1da177e4c3f41 Linus Torvalds          2005-04-16  473  
^1da177e4c3f41 Linus Torvalds          2005-04-16  474  		/* If they're all mapped and dirty, do it */
^1da177e4c3f41 Linus Torvalds          2005-04-16  475  		page_block = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  476  		do {
^1da177e4c3f41 Linus Torvalds          2005-04-16  477  			BUG_ON(buffer_locked(bh));
^1da177e4c3f41 Linus Torvalds          2005-04-16  478  			if (!buffer_mapped(bh)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  479  				/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  480  				 * unmapped dirty buffers are created by
e621900ad28b74 Matthew Wilcox (Oracle  2022-02-09  481) 				 * block_dirty_folio -> mmapped data
^1da177e4c3f41 Linus Torvalds          2005-04-16  482  				 */
^1da177e4c3f41 Linus Torvalds          2005-04-16  483  				if (buffer_dirty(bh))
^1da177e4c3f41 Linus Torvalds          2005-04-16  484  					goto confused;
8b45a4f4133d30 Luis Chamberlain        2025-02-21  485  				if (first_unmapped == blocks_per_folio)
^1da177e4c3f41 Linus Torvalds          2005-04-16  486  					first_unmapped = page_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  487  				continue;
^1da177e4c3f41 Linus Torvalds          2005-04-16  488  			}
^1da177e4c3f41 Linus Torvalds          2005-04-16  489  
8b45a4f4133d30 Luis Chamberlain        2025-02-21  490  			if (first_unmapped != blocks_per_folio)
^1da177e4c3f41 Linus Torvalds          2005-04-16  491  				goto confused;	/* hole -> non-hole */
^1da177e4c3f41 Linus Torvalds          2005-04-16  492  
^1da177e4c3f41 Linus Torvalds          2005-04-16  493  			if (!buffer_dirty(bh) || !buffer_uptodate(bh))
^1da177e4c3f41 Linus Torvalds          2005-04-16  494  				goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  495  			if (page_block) {
6ad7c607b125ce Matthew Wilcox (Oracle  2023-12-15  496) 				if (bh->b_blocknr != first_block + page_block)
^1da177e4c3f41 Linus Torvalds          2005-04-16  497  					goto confused;
6ad7c607b125ce Matthew Wilcox (Oracle  2023-12-15  498) 			} else {
6ad7c607b125ce Matthew Wilcox (Oracle  2023-12-15  499) 				first_block = bh->b_blocknr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  500  			}
6ad7c607b125ce Matthew Wilcox (Oracle  2023-12-15  501) 			page_block++;
^1da177e4c3f41 Linus Torvalds          2005-04-16  502  			boundary = buffer_boundary(bh);
^1da177e4c3f41 Linus Torvalds          2005-04-16  503  			if (boundary) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  504  				boundary_block = bh->b_blocknr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  505  				boundary_bdev = bh->b_bdev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  506  			}
^1da177e4c3f41 Linus Torvalds          2005-04-16  507  			bdev = bh->b_bdev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  508  		} while ((bh = bh->b_this_page) != head);
^1da177e4c3f41 Linus Torvalds          2005-04-16  509  
^1da177e4c3f41 Linus Torvalds          2005-04-16  510  		if (first_unmapped)
^1da177e4c3f41 Linus Torvalds          2005-04-16  511  			goto page_is_mapped;
^1da177e4c3f41 Linus Torvalds          2005-04-16  512  
^1da177e4c3f41 Linus Torvalds          2005-04-16  513  		/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  514  		 * Page has buffers, but they are all unmapped. The page was
^1da177e4c3f41 Linus Torvalds          2005-04-16  515  		 * created by pagein or read over a hole which was handled by
2c69e2057962b6 Matthew Wilcox (Oracle  2022-04-29  516) 		 * block_read_full_folio().  If this address_space is also
d4388340ae0bc8 Matthew Wilcox (Oracle  2020-06-01  517) 		 * using mpage_readahead then this can rarely happen.
^1da177e4c3f41 Linus Torvalds          2005-04-16  518  		 */
^1da177e4c3f41 Linus Torvalds          2005-04-16  519  		goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  520  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  521  
^1da177e4c3f41 Linus Torvalds          2005-04-16  522  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  523  	 * The page has no buffers: map it to disk
^1da177e4c3f41 Linus Torvalds          2005-04-16  524  	 */
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  525) 	BUG_ON(!folio_test_uptodate(folio));
86c60efd7c0ede Hannes Reinecke         2025-02-21  526  	block_in_file = folio_pos(folio) >> blkbits;
4b89a37d54a0b5 Jan Kara                2023-01-03  527  	/*
4b89a37d54a0b5 Jan Kara                2023-01-03  528  	 * Whole page beyond EOF? Skip allocating blocks to avoid leaking
4b89a37d54a0b5 Jan Kara                2023-01-03  529  	 * space.
4b89a37d54a0b5 Jan Kara                2023-01-03  530  	 */
4b89a37d54a0b5 Jan Kara                2023-01-03  531  	if (block_in_file >= (i_size + (1 << blkbits) - 1) >> blkbits)
4b89a37d54a0b5 Jan Kara                2023-01-03  532  		goto page_is_mapped;
^1da177e4c3f41 Linus Torvalds          2005-04-16  533  	last_block = (i_size - 1) >> blkbits;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  534) 	map_bh.b_folio = folio;
8b45a4f4133d30 Luis Chamberlain        2025-02-21  535  	for (page_block = 0; page_block < blocks_per_folio; ) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  536  
^1da177e4c3f41 Linus Torvalds          2005-04-16  537  		map_bh.b_state = 0;
b0cf2321c65991 Badari Pulavarty        2006-03-26  538  		map_bh.b_size = 1 << blkbits;
0ea97180162518 Miklos Szeredi          2007-05-10  539  		if (mpd->get_block(inode, block_in_file, &map_bh, 1))
^1da177e4c3f41 Linus Torvalds          2005-04-16  540  			goto confused;
7010839ccfd4f8 Jan Kara                2023-01-25  541  		if (!buffer_mapped(&map_bh))
7010839ccfd4f8 Jan Kara                2023-01-25  542  			goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  543  		if (buffer_new(&map_bh))
e64855c6cfaa0a Jan Kara                2016-11-04  544  			clean_bdev_bh_alias(&map_bh);
^1da177e4c3f41 Linus Torvalds          2005-04-16  545  		if (buffer_boundary(&map_bh)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  546  			boundary_block = map_bh.b_blocknr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  547  			boundary_bdev = map_bh.b_bdev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  548  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  549  		if (page_block) {
6ad7c607b125ce Matthew Wilcox (Oracle  2023-12-15  550) 			if (map_bh.b_blocknr != first_block + page_block)
^1da177e4c3f41 Linus Torvalds          2005-04-16  551  				goto confused;
6ad7c607b125ce Matthew Wilcox (Oracle  2023-12-15  552) 		} else {
6ad7c607b125ce Matthew Wilcox (Oracle  2023-12-15  553) 			first_block = map_bh.b_blocknr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  554  		}
6ad7c607b125ce Matthew Wilcox (Oracle  2023-12-15  555) 		page_block++;
^1da177e4c3f41 Linus Torvalds          2005-04-16  556  		boundary = buffer_boundary(&map_bh);
^1da177e4c3f41 Linus Torvalds          2005-04-16  557  		bdev = map_bh.b_bdev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  558  		if (block_in_file == last_block)
^1da177e4c3f41 Linus Torvalds          2005-04-16  559  			break;
^1da177e4c3f41 Linus Torvalds          2005-04-16  560  		block_in_file++;
^1da177e4c3f41 Linus Torvalds          2005-04-16  561  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  562  	BUG_ON(page_block == 0);
^1da177e4c3f41 Linus Torvalds          2005-04-16  563  
^1da177e4c3f41 Linus Torvalds          2005-04-16  564  	first_unmapped = page_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  565  
^1da177e4c3f41 Linus Torvalds          2005-04-16  566  page_is_mapped:
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  567) 	/* Don't bother writing beyond EOF, truncate will discard the folio */
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  568) 	if (folio_pos(folio) >= i_size)
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  569) 		goto confused;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  570) 	length = folio_size(folio);
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  571) 	if (folio_pos(folio) + length > i_size) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  572  		/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  573  		 * The page straddles i_size.  It must be zeroed out on each
2a61aa40163852 Adam Buchbinder         2009-12-11  574  		 * and every writepage invocation because it may be mmapped.
^1da177e4c3f41 Linus Torvalds          2005-04-16  575  		 * "A file is mapped in multiples of the page size.  For a file
^1da177e4c3f41 Linus Torvalds          2005-04-16  576  		 * that is not a multiple of the page size, the remaining memory
^1da177e4c3f41 Linus Torvalds          2005-04-16  577  		 * is zeroed when mapped, and writes to that region are not
^1da177e4c3f41 Linus Torvalds          2005-04-16  578  		 * written out to the file."
^1da177e4c3f41 Linus Torvalds          2005-04-16  579  		 */
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  580) 		length = i_size - folio_pos(folio);
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  581) 		folio_zero_segment(folio, length, folio_size(folio));
^1da177e4c3f41 Linus Torvalds          2005-04-16  582  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  583  
^1da177e4c3f41 Linus Torvalds          2005-04-16  584  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  585  	 * This page will go to BIO.  Do we need to send this BIO off first?
^1da177e4c3f41 Linus Torvalds          2005-04-16  586  	 */
6ad7c607b125ce Matthew Wilcox (Oracle  2023-12-15 @587) 	if (bio && mpd->last_block_in_bio != first_block - 1)
f0d6ca46d68670 Pankaj Raghav           2023-04-11  588  		bio = mpage_bio_submit_write(bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  589  
^1da177e4c3f41 Linus Torvalds          2005-04-16  590  alloc_new:
^1da177e4c3f41 Linus Torvalds          2005-04-16  591  	if (bio == NULL) {
77c436de01c0f2 Christoph Hellwig       2022-02-22  592  		bio = bio_alloc(bdev, BIO_MAX_VECS,
77c436de01c0f2 Christoph Hellwig       2022-02-22  593  				REQ_OP_WRITE | wbc_to_write_flags(wbc),
77c436de01c0f2 Christoph Hellwig       2022-02-22  594  				GFP_NOFS);
6ad7c607b125ce Matthew Wilcox (Oracle  2023-12-15  595) 		bio->bi_iter.bi_sector = first_block << (blkbits - 9);
b16b1deb553adc Tejun Heo               2015-06-02  596  		wbc_init_bio(wbc, bio);
449813515d3e5e Bart Van Assche         2024-02-02  597  		bio->bi_write_hint = inode->i_write_hint;
^1da177e4c3f41 Linus Torvalds          2005-04-16  598  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  599  
^1da177e4c3f41 Linus Torvalds          2005-04-16  600  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  601  	 * Must try to add the page before marking the buffer clean or
^1da177e4c3f41 Linus Torvalds          2005-04-16  602  	 * the confused fail path above (OOM) will be very confused when
^1da177e4c3f41 Linus Torvalds          2005-04-16  603  	 * it finds all bh marked clean (i.e. it will not write anything)
^1da177e4c3f41 Linus Torvalds          2005-04-16  604  	 */
30dac24e14b52e Pankaj Raghav           2024-09-26  605  	wbc_account_cgroup_owner(wbc, folio, folio_size(folio));
^1da177e4c3f41 Linus Torvalds          2005-04-16  606  	length = first_unmapped << blkbits;
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  607) 	if (!bio_add_folio(bio, folio, length, 0)) {
f0d6ca46d68670 Pankaj Raghav           2023-04-11  608  		bio = mpage_bio_submit_write(bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  609  		goto alloc_new;
^1da177e4c3f41 Linus Torvalds          2005-04-16  610  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  611  
e8ff8248d37718 Matthew Wilcox (Oracle  2023-12-15  612) 	clean_buffers(folio, first_unmapped);
^1da177e4c3f41 Linus Torvalds          2005-04-16  613  
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  614) 	BUG_ON(folio_test_writeback(folio));
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  615) 	folio_start_writeback(folio);
9160cffd45ee93 Matthew Wilcox (Oracle  2023-01-26  616) 	folio_unlock(folio);
8b45a4f4133d30 Luis Chamberlain        2025-02-21  617  	if (boundary || (first_unmapped != blocks_per_folio)) {
f0d6ca46d68670 Pankaj Raghav           2023-04-11  618  		bio = mpage_bio_submit_write(bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  619  		if (boundary_block) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  620  			write_boundary_block(boundary_bdev,
^1da177e4c3f41 Linus Torvalds          2005-04-16  621  					boundary_block, 1 << blkbits);
^1da177e4c3f41 Linus Torvalds          2005-04-16  622  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  623  	} else {
8b45a4f4133d30 Luis Chamberlain        2025-02-21  624  		mpd->last_block_in_bio = first_block + blocks_per_folio - 1;
^1da177e4c3f41 Linus Torvalds          2005-04-16  625  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  626  	goto out;
^1da177e4c3f41 Linus Torvalds          2005-04-16  627  
^1da177e4c3f41 Linus Torvalds          2005-04-16  628  confused:
^1da177e4c3f41 Linus Torvalds          2005-04-16  629  	if (bio)
f0d6ca46d68670 Pankaj Raghav           2023-04-11  630  		bio = mpage_bio_submit_write(bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  631  
^1da177e4c3f41 Linus Torvalds          2005-04-16  632  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  633  	 * The caller has a ref on the inode, so *mapping is stable
^1da177e4c3f41 Linus Torvalds          2005-04-16  634  	 */
17bf23a981be9c Matthew Wilcox (Oracle  2023-12-15  635) 	ret = block_write_full_folio(folio, wbc, mpd->get_block);
0ea97180162518 Miklos Szeredi          2007-05-10  636  	mapping_set_error(mapping, ret);
^1da177e4c3f41 Linus Torvalds          2005-04-16  637  out:
0ea97180162518 Miklos Szeredi          2007-05-10  638  	mpd->bio = bio;
0ea97180162518 Miklos Szeredi          2007-05-10  639  	return ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  640  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  641  

:::::: The code at line 587 was first introduced by commit
:::::: 6ad7c607b125ce02bd0870f490d990aee8609070 fs: reduce stack usage in __mpage_writepage

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
