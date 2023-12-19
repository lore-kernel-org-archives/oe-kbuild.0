Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2DE7F8
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Dec 2023 00:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JptDxKFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702945901; x=1734481901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KnzD1pKd+tGBH1jmdOcLIrdbHB9Jkdbh1i4EXy2hYOs=;
  b=JptDxKFPs2g0NEg3tC2tAcUruAapFCN2WEIScL9oNTvLYA0LX60S/9N3
   KOvKjj0vnUeQHmgor3s+I9IoRVlMqsgEOK522Tk4fhWLYt4W+drpRpxI9
   Uex8uHe9qF3PuMKakxZdapcYkp0p56Rej1SXOzvBeuoS0mgTFV4rP+Lcd
   rJCb5992jE2Q8fRK5F/6awHanJckENZ+eWgaDvbGAPcfCDZYpJ0WZU56M
   EivsdpWlQ0b9kIAAPzfoOkxpAdeGCV+2KuWDmTHlr/9iVMvQSdKJL8t38
   HpNBNFA/WghZ9nLfQ3ZIniP+pfiuKI8BiIAXI6RtON+s04QYuFXLxWc2K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="395317481"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="395317481"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 16:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="17388981"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 Dec 2023 16:31:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFO1H-0004g9-2a;
	Tue, 19 Dec 2023 00:31:35 +0000
Date: Tue, 19 Dec 2023 08:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 04/14] fs: Reduce stack usage in do_mpage_readpage
Message-ID: <202312190832.gq9q3uIB-lkp@intel.com>
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
In-Reply-To: <20231215200245.748418-5-willy@infradead.org>
References: <20231215200245.748418-5-willy@infradead.org>
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
[also build test WARNING on akpm-mm/mm-everything axboe-block/for-next tytso-ext4/dev linus/master v6.7-rc6 next-20231218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/fs-Remove-clean_page_buffers/20231216-040850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
patch link:    https://lore.kernel.org/r/20231215200245.748418-5-willy%40infradead.org
patch subject: [PATCH 04/14] fs: Reduce stack usage in do_mpage_readpage
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: m68k-randconfig-r081-20231218 (https://download.01.org/0day-ci/archive/20231219/202312190832.gq9q3uIB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312190832.gq9q3uIB-lkp@intel.com/

New smatch warnings:
fs/mpage.c:292 do_mpage_readpage() error: uninitialized symbol 'first_block'.

Old smatch warnings:
fs/mpage.c:301 do_mpage_readpage() error: uninitialized symbol 'first_block'.
fs/mpage.c:598 __mpage_writepage() error: uninitialized symbol 'first_block'.
fs/mpage.c:606 __mpage_writepage() error: uninitialized symbol 'first_block'.

vim +/first_block +292 fs/mpage.c

357c1206520da7 Jens Axboe              2018-08-17  148  
fa30bd058b746c Badari Pulavarty        2006-03-26  149  /*
fa30bd058b746c Badari Pulavarty        2006-03-26  150   * This is the worker routine which does all the work of mapping the disk
fa30bd058b746c Badari Pulavarty        2006-03-26  151   * blocks and constructs largest possible bios, submits them for IO if the
fa30bd058b746c Badari Pulavarty        2006-03-26  152   * blocks are not contiguous on the disk.
fa30bd058b746c Badari Pulavarty        2006-03-26  153   *
fa30bd058b746c Badari Pulavarty        2006-03-26  154   * We pass a buffer_head back and forth and use its buffer_mapped() flag to
fa30bd058b746c Badari Pulavarty        2006-03-26  155   * represent the validity of its disk mapping and to decide when to do the next
fa30bd058b746c Badari Pulavarty        2006-03-26  156   * get_block() call.
fa30bd058b746c Badari Pulavarty        2006-03-26  157   */
357c1206520da7 Jens Axboe              2018-08-17  158  static struct bio *do_mpage_readpage(struct mpage_readpage_args *args)
^1da177e4c3f41 Linus Torvalds          2005-04-16  159  {
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  160) 	struct folio *folio = args->folio;
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  161) 	struct inode *inode = folio->mapping->host;
^1da177e4c3f41 Linus Torvalds          2005-04-16  162  	const unsigned blkbits = inode->i_blkbits;
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  163  	const unsigned blocks_per_page = PAGE_SIZE >> blkbits;
^1da177e4c3f41 Linus Torvalds          2005-04-16  164  	const unsigned blocksize = 1 << blkbits;
357c1206520da7 Jens Axboe              2018-08-17  165  	struct buffer_head *map_bh = &args->map_bh;
^1da177e4c3f41 Linus Torvalds          2005-04-16  166  	sector_t block_in_file;
^1da177e4c3f41 Linus Torvalds          2005-04-16  167  	sector_t last_block;
fa30bd058b746c Badari Pulavarty        2006-03-26  168  	sector_t last_block_in_file;
a87afca9df4be4 Matthew Wilcox (Oracle  2023-12-15  169) 	sector_t first_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  170  	unsigned page_block;
^1da177e4c3f41 Linus Torvalds          2005-04-16  171  	unsigned first_hole = blocks_per_page;
^1da177e4c3f41 Linus Torvalds          2005-04-16  172  	struct block_device *bdev = NULL;
^1da177e4c3f41 Linus Torvalds          2005-04-16  173  	int length;
^1da177e4c3f41 Linus Torvalds          2005-04-16  174  	int fully_mapped = 1;
f84c94afcf823c Bart Van Assche         2022-07-14  175  	blk_opf_t opf = REQ_OP_READ;
fa30bd058b746c Badari Pulavarty        2006-03-26  176  	unsigned nblocks;
fa30bd058b746c Badari Pulavarty        2006-03-26  177  	unsigned relative_block;
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  178) 	gfp_t gfp = mapping_gfp_constraint(folio->mapping, GFP_KERNEL);
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  179) 
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  180) 	/* MAX_BUF_PER_PAGE, for example */
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  181) 	VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
74c8164e1cdb1e Jens Axboe              2018-08-17  182  
74c8164e1cdb1e Jens Axboe              2018-08-17  183  	if (args->is_readahead) {
f84c94afcf823c Bart Van Assche         2022-07-14  184  		opf |= REQ_RAHEAD;
61285ff72ae59e Christoph Hellwig       2022-03-23  185  		gfp |= __GFP_NORETRY | __GFP_NOWARN;
74c8164e1cdb1e Jens Axboe              2018-08-17  186  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  187  
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  188) 	if (folio_buffers(folio))
^1da177e4c3f41 Linus Torvalds          2005-04-16  189  		goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  190  
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  191) 	block_in_file = (sector_t)folio->index << (PAGE_SHIFT - blkbits);
357c1206520da7 Jens Axboe              2018-08-17  192  	last_block = block_in_file + args->nr_pages * blocks_per_page;
fa30bd058b746c Badari Pulavarty        2006-03-26  193  	last_block_in_file = (i_size_read(inode) + blocksize - 1) >> blkbits;
fa30bd058b746c Badari Pulavarty        2006-03-26  194  	if (last_block > last_block_in_file)
fa30bd058b746c Badari Pulavarty        2006-03-26  195  		last_block = last_block_in_file;
fa30bd058b746c Badari Pulavarty        2006-03-26  196  	page_block = 0;
fa30bd058b746c Badari Pulavarty        2006-03-26  197  
fa30bd058b746c Badari Pulavarty        2006-03-26  198  	/*
fa30bd058b746c Badari Pulavarty        2006-03-26  199  	 * Map blocks using the result from the previous get_blocks call first.
fa30bd058b746c Badari Pulavarty        2006-03-26  200  	 */
fa30bd058b746c Badari Pulavarty        2006-03-26  201  	nblocks = map_bh->b_size >> blkbits;
357c1206520da7 Jens Axboe              2018-08-17  202  	if (buffer_mapped(map_bh) &&
357c1206520da7 Jens Axboe              2018-08-17  203  			block_in_file > args->first_logical_block &&
357c1206520da7 Jens Axboe              2018-08-17  204  			block_in_file < (args->first_logical_block + nblocks)) {
357c1206520da7 Jens Axboe              2018-08-17  205  		unsigned map_offset = block_in_file - args->first_logical_block;
fa30bd058b746c Badari Pulavarty        2006-03-26  206  		unsigned last = nblocks - map_offset;
fa30bd058b746c Badari Pulavarty        2006-03-26  207  
a87afca9df4be4 Matthew Wilcox (Oracle  2023-12-15  208) 		first_block = map_bh->b_blocknr + map_offset;
fa30bd058b746c Badari Pulavarty        2006-03-26  209  		for (relative_block = 0; ; relative_block++) {
fa30bd058b746c Badari Pulavarty        2006-03-26  210  			if (relative_block == last) {
fa30bd058b746c Badari Pulavarty        2006-03-26  211  				clear_buffer_mapped(map_bh);
fa30bd058b746c Badari Pulavarty        2006-03-26  212  				break;
fa30bd058b746c Badari Pulavarty        2006-03-26  213  			}
fa30bd058b746c Badari Pulavarty        2006-03-26  214  			if (page_block == blocks_per_page)
fa30bd058b746c Badari Pulavarty        2006-03-26  215  				break;
fa30bd058b746c Badari Pulavarty        2006-03-26  216  			page_block++;
fa30bd058b746c Badari Pulavarty        2006-03-26  217  			block_in_file++;
fa30bd058b746c Badari Pulavarty        2006-03-26  218  		}
fa30bd058b746c Badari Pulavarty        2006-03-26  219  		bdev = map_bh->b_bdev;
fa30bd058b746c Badari Pulavarty        2006-03-26  220  	}
fa30bd058b746c Badari Pulavarty        2006-03-26  221  
fa30bd058b746c Badari Pulavarty        2006-03-26  222  	/*
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  223) 	 * Then do more get_blocks calls until we are done with this folio.
fa30bd058b746c Badari Pulavarty        2006-03-26  224  	 */
a5fd8390d2b2db Matthew Wilcox (Oracle  2022-12-15  225) 	map_bh->b_folio = folio;
fa30bd058b746c Badari Pulavarty        2006-03-26  226  	while (page_block < blocks_per_page) {
fa30bd058b746c Badari Pulavarty        2006-03-26  227  		map_bh->b_state = 0;
fa30bd058b746c Badari Pulavarty        2006-03-26  228  		map_bh->b_size = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  229  
^1da177e4c3f41 Linus Torvalds          2005-04-16  230  		if (block_in_file < last_block) {
fa30bd058b746c Badari Pulavarty        2006-03-26  231  			map_bh->b_size = (last_block-block_in_file) << blkbits;
357c1206520da7 Jens Axboe              2018-08-17  232  			if (args->get_block(inode, block_in_file, map_bh, 0))
^1da177e4c3f41 Linus Torvalds          2005-04-16  233  				goto confused;
357c1206520da7 Jens Axboe              2018-08-17  234  			args->first_logical_block = block_in_file;
^1da177e4c3f41 Linus Torvalds          2005-04-16  235  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  236  
fa30bd058b746c Badari Pulavarty        2006-03-26  237  		if (!buffer_mapped(map_bh)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  238  			fully_mapped = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  239  			if (first_hole == blocks_per_page)
^1da177e4c3f41 Linus Torvalds          2005-04-16  240  				first_hole = page_block;
fa30bd058b746c Badari Pulavarty        2006-03-26  241  			page_block++;
fa30bd058b746c Badari Pulavarty        2006-03-26  242  			block_in_file++;
^1da177e4c3f41 Linus Torvalds          2005-04-16  243  			continue;
^1da177e4c3f41 Linus Torvalds          2005-04-16  244  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  245  
^1da177e4c3f41 Linus Torvalds          2005-04-16  246  		/* some filesystems will copy data into the page during
^1da177e4c3f41 Linus Torvalds          2005-04-16  247  		 * the get_block call, in which case we don't want to
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  248) 		 * read it again.  map_buffer_to_folio copies the data
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  249) 		 * we just collected from get_block into the folio's buffers
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  250) 		 * so read_folio doesn't have to repeat the get_block call
^1da177e4c3f41 Linus Torvalds          2005-04-16  251  		 */
fa30bd058b746c Badari Pulavarty        2006-03-26  252  		if (buffer_uptodate(map_bh)) {
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  253) 			map_buffer_to_folio(folio, map_bh, page_block);
^1da177e4c3f41 Linus Torvalds          2005-04-16  254  			goto confused;
^1da177e4c3f41 Linus Torvalds          2005-04-16  255  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  256  	
^1da177e4c3f41 Linus Torvalds          2005-04-16  257  		if (first_hole != blocks_per_page)
^1da177e4c3f41 Linus Torvalds          2005-04-16  258  			goto confused;		/* hole -> non-hole */
^1da177e4c3f41 Linus Torvalds          2005-04-16  259  
^1da177e4c3f41 Linus Torvalds          2005-04-16  260  		/* Contiguous blocks? */
a87afca9df4be4 Matthew Wilcox (Oracle  2023-12-15  261) 		if (!page_block)
a87afca9df4be4 Matthew Wilcox (Oracle  2023-12-15  262) 			first_block = map_bh->b_blocknr;
a87afca9df4be4 Matthew Wilcox (Oracle  2023-12-15  263) 		else if (first_block + page_block != map_bh->b_blocknr)
^1da177e4c3f41 Linus Torvalds          2005-04-16  264  			goto confused;
fa30bd058b746c Badari Pulavarty        2006-03-26  265  		nblocks = map_bh->b_size >> blkbits;
fa30bd058b746c Badari Pulavarty        2006-03-26  266  		for (relative_block = 0; ; relative_block++) {
fa30bd058b746c Badari Pulavarty        2006-03-26  267  			if (relative_block == nblocks) {
fa30bd058b746c Badari Pulavarty        2006-03-26  268  				clear_buffer_mapped(map_bh);
fa30bd058b746c Badari Pulavarty        2006-03-26  269  				break;
fa30bd058b746c Badari Pulavarty        2006-03-26  270  			} else if (page_block == blocks_per_page)
fa30bd058b746c Badari Pulavarty        2006-03-26  271  				break;
fa30bd058b746c Badari Pulavarty        2006-03-26  272  			page_block++;
fa30bd058b746c Badari Pulavarty        2006-03-26  273  			block_in_file++;
fa30bd058b746c Badari Pulavarty        2006-03-26  274  		}
fa30bd058b746c Badari Pulavarty        2006-03-26  275  		bdev = map_bh->b_bdev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  276  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  277  
^1da177e4c3f41 Linus Torvalds          2005-04-16  278  	if (first_hole != blocks_per_page) {
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  279) 		folio_zero_segment(folio, first_hole << blkbits, PAGE_SIZE);
^1da177e4c3f41 Linus Torvalds          2005-04-16  280  		if (first_hole == 0) {
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  281) 			folio_mark_uptodate(folio);
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  282) 			folio_unlock(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  283  			goto out;
^1da177e4c3f41 Linus Torvalds          2005-04-16  284  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  285  	} else if (fully_mapped) {
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  286) 		folio_set_mappedtodisk(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  287  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  288  
^1da177e4c3f41 Linus Torvalds          2005-04-16  289  	/*
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  290) 	 * This folio will go to BIO.  Do we need to send this BIO off first?
^1da177e4c3f41 Linus Torvalds          2005-04-16  291  	 */
a87afca9df4be4 Matthew Wilcox (Oracle  2023-12-15 @292) 	if (args->bio && (args->last_block_in_bio != first_block - 1))
f0d6ca46d68670 Pankaj Raghav           2023-04-11  293  		args->bio = mpage_bio_submit_read(args->bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  294  
^1da177e4c3f41 Linus Torvalds          2005-04-16  295  alloc_new:
357c1206520da7 Jens Axboe              2018-08-17  296  	if (args->bio == NULL) {
f84c94afcf823c Bart Van Assche         2022-07-14  297  		args->bio = bio_alloc(bdev, bio_max_segs(args->nr_pages), opf,
07888c665b405b Christoph Hellwig       2022-01-24  298  				      gfp);
357c1206520da7 Jens Axboe              2018-08-17  299  		if (args->bio == NULL)
^1da177e4c3f41 Linus Torvalds          2005-04-16  300  			goto confused;
a87afca9df4be4 Matthew Wilcox (Oracle  2023-12-15  301) 		args->bio->bi_iter.bi_sector = first_block << (blkbits - 9);
^1da177e4c3f41 Linus Torvalds          2005-04-16  302  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  303  
^1da177e4c3f41 Linus Torvalds          2005-04-16  304  	length = first_hole << blkbits;
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  305) 	if (!bio_add_folio(args->bio, folio, length, 0)) {
f0d6ca46d68670 Pankaj Raghav           2023-04-11  306  		args->bio = mpage_bio_submit_read(args->bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  307  		goto alloc_new;
^1da177e4c3f41 Linus Torvalds          2005-04-16  308  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  309  
357c1206520da7 Jens Axboe              2018-08-17  310  	relative_block = block_in_file - args->first_logical_block;
38c8e6180939e5 Miquel van Smoorenburg  2009-01-06  311  	nblocks = map_bh->b_size >> blkbits;
38c8e6180939e5 Miquel van Smoorenburg  2009-01-06  312  	if ((buffer_boundary(map_bh) && relative_block == nblocks) ||
38c8e6180939e5 Miquel van Smoorenburg  2009-01-06  313  	    (first_hole != blocks_per_page))
f0d6ca46d68670 Pankaj Raghav           2023-04-11  314  		args->bio = mpage_bio_submit_read(args->bio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  315  	else
a87afca9df4be4 Matthew Wilcox (Oracle  2023-12-15  316) 		args->last_block_in_bio = first_block + blocks_per_page - 1;
^1da177e4c3f41 Linus Torvalds          2005-04-16  317  out:
357c1206520da7 Jens Axboe              2018-08-17  318  	return args->bio;
^1da177e4c3f41 Linus Torvalds          2005-04-16  319  
^1da177e4c3f41 Linus Torvalds          2005-04-16  320  confused:
357c1206520da7 Jens Axboe              2018-08-17  321  	if (args->bio)
f0d6ca46d68670 Pankaj Raghav           2023-04-11  322  		args->bio = mpage_bio_submit_read(args->bio);
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  323) 	if (!folio_test_uptodate(folio))
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  324) 		block_read_full_folio(folio, args->get_block);
^1da177e4c3f41 Linus Torvalds          2005-04-16  325  	else
211d04445b96db Matthew Wilcox (Oracle  2022-06-10  326) 		folio_unlock(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  327  	goto out;
^1da177e4c3f41 Linus Torvalds          2005-04-16  328  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  329  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
