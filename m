Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B83329417
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONDKQxsC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699293190; x=1730829190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L7GkVD7ywFn/grcIiaGXh6iLmht9DVqttbdsilmwha0=;
  b=ONDKQxsCZASAqI8liD3Gg8dIcetEILmwrrbxE071y4zR6cF+z/RwplVX
   59L4F8CjJyA8xPsN9k82DtlupcRC1Gx38Hr74InA5R2xgMhZXk2mhw3oY
   5IV5ZkjdxXmbTYT96FcGFyYCiBgGG6H2bJr6Wp9Fj966dcL258ZeqpG7x
   kdFTeIDu+a83xXZYjiQ7iispzw/wz09UudvfrrIHS9eGznUU5KXCIow5v
   CepsP74fk7V/klcjW8zeopIAbeTx5cULRGbKcyzHwyJ0NJFoaNRrf/6eC
   jhR41SwrQSakJVTnbNRbxKmaD+eBzJmgvPm8NnsNk/YBAyTVc54JtEqqp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="475570765"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="475570765"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 09:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="3530180"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Nov 2023 09:53:07 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r03mb-0006ch-1a;
	Mon, 06 Nov 2023 17:53:05 +0000
Date: Tue, 7 Nov 2023 01:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/fs-io-buffered.c:626 __bch2_writepage() error: we
 previously assumed 'w->io' could be null (see line 620)
Message-ID: <202311070119.VXOwPfZE-lkp@intel.com>
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
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: dbbfca9f41e86903501dded3fd494e1a56f3c310 bcachefs: Split up fs-io.[ch]
date:   2 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231107/202311070119.VXOwPfZE-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311070119.VXOwPfZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311070119.VXOwPfZE-lkp@intel.com/

New smatch warnings:
fs/bcachefs/fs-io-buffered.c:626 __bch2_writepage() error: we previously assumed 'w->io' could be null (see line 620)

Old smatch warnings:
fs/bcachefs/fs-io-buffered.c:727 bch2_write_begin() error: uninitialized symbol 'offset'.

vim +626 fs/bcachefs/fs-io-buffered.c

dbbfca9f41e869 Kent Overstreet 2023-08-03  505  
dbbfca9f41e869 Kent Overstreet 2023-08-03  506  static int __bch2_writepage(struct folio *folio,
dbbfca9f41e869 Kent Overstreet 2023-08-03  507  			    struct writeback_control *wbc,
dbbfca9f41e869 Kent Overstreet 2023-08-03  508  			    void *data)
dbbfca9f41e869 Kent Overstreet 2023-08-03  509  {
dbbfca9f41e869 Kent Overstreet 2023-08-03  510  	struct bch_inode_info *inode = to_bch_ei(folio->mapping->host);
dbbfca9f41e869 Kent Overstreet 2023-08-03  511  	struct bch_fs *c = inode->v.i_sb->s_fs_info;
dbbfca9f41e869 Kent Overstreet 2023-08-03  512  	struct bch_writepage_state *w = data;
dbbfca9f41e869 Kent Overstreet 2023-08-03  513  	struct bch_folio *s;
dbbfca9f41e869 Kent Overstreet 2023-08-03  514  	unsigned i, offset, f_sectors, nr_replicas_this_write = U32_MAX;
dbbfca9f41e869 Kent Overstreet 2023-08-03  515  	loff_t i_size = i_size_read(&inode->v);
dbbfca9f41e869 Kent Overstreet 2023-08-03  516  	int ret;
dbbfca9f41e869 Kent Overstreet 2023-08-03  517  
dbbfca9f41e869 Kent Overstreet 2023-08-03  518  	EBUG_ON(!folio_test_uptodate(folio));
dbbfca9f41e869 Kent Overstreet 2023-08-03  519  
dbbfca9f41e869 Kent Overstreet 2023-08-03  520  	/* Is the folio fully inside i_size? */
dbbfca9f41e869 Kent Overstreet 2023-08-03  521  	if (folio_end_pos(folio) <= i_size)
dbbfca9f41e869 Kent Overstreet 2023-08-03  522  		goto do_io;
dbbfca9f41e869 Kent Overstreet 2023-08-03  523  
dbbfca9f41e869 Kent Overstreet 2023-08-03  524  	/* Is the folio fully outside i_size? (truncate in progress) */
dbbfca9f41e869 Kent Overstreet 2023-08-03  525  	if (folio_pos(folio) >= i_size) {
dbbfca9f41e869 Kent Overstreet 2023-08-03  526  		folio_unlock(folio);
dbbfca9f41e869 Kent Overstreet 2023-08-03  527  		return 0;
dbbfca9f41e869 Kent Overstreet 2023-08-03  528  	}
dbbfca9f41e869 Kent Overstreet 2023-08-03  529  
dbbfca9f41e869 Kent Overstreet 2023-08-03  530  	/*
dbbfca9f41e869 Kent Overstreet 2023-08-03  531  	 * The folio straddles i_size.  It must be zeroed out on each and every
dbbfca9f41e869 Kent Overstreet 2023-08-03  532  	 * writepage invocation because it may be mmapped.  "A file is mapped
dbbfca9f41e869 Kent Overstreet 2023-08-03  533  	 * in multiples of the folio size.  For a file that is not a multiple of
dbbfca9f41e869 Kent Overstreet 2023-08-03  534  	 * the  folio size, the remaining memory is zeroed when mapped, and
dbbfca9f41e869 Kent Overstreet 2023-08-03  535  	 * writes to that region are not written out to the file."
dbbfca9f41e869 Kent Overstreet 2023-08-03  536  	 */
dbbfca9f41e869 Kent Overstreet 2023-08-03  537  	folio_zero_segment(folio,
dbbfca9f41e869 Kent Overstreet 2023-08-03  538  			   i_size - folio_pos(folio),
dbbfca9f41e869 Kent Overstreet 2023-08-03  539  			   folio_size(folio));
dbbfca9f41e869 Kent Overstreet 2023-08-03  540  do_io:
dbbfca9f41e869 Kent Overstreet 2023-08-03  541  	f_sectors = folio_sectors(folio);
dbbfca9f41e869 Kent Overstreet 2023-08-03  542  	s = bch2_folio(folio);
dbbfca9f41e869 Kent Overstreet 2023-08-03  543  
dbbfca9f41e869 Kent Overstreet 2023-08-03  544  	if (f_sectors > w->tmp_sectors) {
dbbfca9f41e869 Kent Overstreet 2023-08-03  545  		kfree(w->tmp);
dbbfca9f41e869 Kent Overstreet 2023-08-03  546  		w->tmp = kcalloc(f_sectors, sizeof(struct bch_folio_sector), __GFP_NOFAIL);
dbbfca9f41e869 Kent Overstreet 2023-08-03  547  		w->tmp_sectors = f_sectors;
dbbfca9f41e869 Kent Overstreet 2023-08-03  548  	}
dbbfca9f41e869 Kent Overstreet 2023-08-03  549  
dbbfca9f41e869 Kent Overstreet 2023-08-03  550  	/*
dbbfca9f41e869 Kent Overstreet 2023-08-03  551  	 * Things get really hairy with errors during writeback:
dbbfca9f41e869 Kent Overstreet 2023-08-03  552  	 */
dbbfca9f41e869 Kent Overstreet 2023-08-03  553  	ret = bch2_get_folio_disk_reservation(c, inode, folio, false);
dbbfca9f41e869 Kent Overstreet 2023-08-03  554  	BUG_ON(ret);
dbbfca9f41e869 Kent Overstreet 2023-08-03  555  
dbbfca9f41e869 Kent Overstreet 2023-08-03  556  	/* Before unlocking the page, get copy of reservations: */
dbbfca9f41e869 Kent Overstreet 2023-08-03  557  	spin_lock(&s->lock);
dbbfca9f41e869 Kent Overstreet 2023-08-03  558  	memcpy(w->tmp, s->s, sizeof(struct bch_folio_sector) * f_sectors);
dbbfca9f41e869 Kent Overstreet 2023-08-03  559  
dbbfca9f41e869 Kent Overstreet 2023-08-03  560  	for (i = 0; i < f_sectors; i++) {
dbbfca9f41e869 Kent Overstreet 2023-08-03  561  		if (s->s[i].state < SECTOR_dirty)
dbbfca9f41e869 Kent Overstreet 2023-08-03  562  			continue;
dbbfca9f41e869 Kent Overstreet 2023-08-03  563  
dbbfca9f41e869 Kent Overstreet 2023-08-03  564  		nr_replicas_this_write =
dbbfca9f41e869 Kent Overstreet 2023-08-03  565  			min_t(unsigned, nr_replicas_this_write,
dbbfca9f41e869 Kent Overstreet 2023-08-03  566  			      s->s[i].nr_replicas +
dbbfca9f41e869 Kent Overstreet 2023-08-03  567  			      s->s[i].replicas_reserved);
dbbfca9f41e869 Kent Overstreet 2023-08-03  568  	}
dbbfca9f41e869 Kent Overstreet 2023-08-03  569  
dbbfca9f41e869 Kent Overstreet 2023-08-03  570  	for (i = 0; i < f_sectors; i++) {
dbbfca9f41e869 Kent Overstreet 2023-08-03  571  		if (s->s[i].state < SECTOR_dirty)
dbbfca9f41e869 Kent Overstreet 2023-08-03  572  			continue;
dbbfca9f41e869 Kent Overstreet 2023-08-03  573  
dbbfca9f41e869 Kent Overstreet 2023-08-03  574  		s->s[i].nr_replicas = w->opts.compression
dbbfca9f41e869 Kent Overstreet 2023-08-03  575  			? 0 : nr_replicas_this_write;
dbbfca9f41e869 Kent Overstreet 2023-08-03  576  
dbbfca9f41e869 Kent Overstreet 2023-08-03  577  		s->s[i].replicas_reserved = 0;
dbbfca9f41e869 Kent Overstreet 2023-08-03  578  		bch2_folio_sector_set(folio, s, i, SECTOR_allocated);
dbbfca9f41e869 Kent Overstreet 2023-08-03  579  	}
dbbfca9f41e869 Kent Overstreet 2023-08-03  580  	spin_unlock(&s->lock);
dbbfca9f41e869 Kent Overstreet 2023-08-03  581  
dbbfca9f41e869 Kent Overstreet 2023-08-03  582  	BUG_ON(atomic_read(&s->write_count));
dbbfca9f41e869 Kent Overstreet 2023-08-03  583  	atomic_set(&s->write_count, 1);
dbbfca9f41e869 Kent Overstreet 2023-08-03  584  
dbbfca9f41e869 Kent Overstreet 2023-08-03  585  	BUG_ON(folio_test_writeback(folio));
dbbfca9f41e869 Kent Overstreet 2023-08-03  586  	folio_start_writeback(folio);
dbbfca9f41e869 Kent Overstreet 2023-08-03  587  
dbbfca9f41e869 Kent Overstreet 2023-08-03  588  	folio_unlock(folio);
dbbfca9f41e869 Kent Overstreet 2023-08-03  589  
dbbfca9f41e869 Kent Overstreet 2023-08-03  590  	offset = 0;
dbbfca9f41e869 Kent Overstreet 2023-08-03  591  	while (1) {
dbbfca9f41e869 Kent Overstreet 2023-08-03  592  		unsigned sectors = 0, dirty_sectors = 0, reserved_sectors = 0;
dbbfca9f41e869 Kent Overstreet 2023-08-03  593  		u64 sector;
dbbfca9f41e869 Kent Overstreet 2023-08-03  594  
dbbfca9f41e869 Kent Overstreet 2023-08-03  595  		while (offset < f_sectors &&
dbbfca9f41e869 Kent Overstreet 2023-08-03  596  		       w->tmp[offset].state < SECTOR_dirty)
dbbfca9f41e869 Kent Overstreet 2023-08-03  597  			offset++;
dbbfca9f41e869 Kent Overstreet 2023-08-03  598  
dbbfca9f41e869 Kent Overstreet 2023-08-03  599  		if (offset == f_sectors)
dbbfca9f41e869 Kent Overstreet 2023-08-03  600  			break;
dbbfca9f41e869 Kent Overstreet 2023-08-03  601  
dbbfca9f41e869 Kent Overstreet 2023-08-03  602  		while (offset + sectors < f_sectors &&
dbbfca9f41e869 Kent Overstreet 2023-08-03  603  		       w->tmp[offset + sectors].state >= SECTOR_dirty) {
dbbfca9f41e869 Kent Overstreet 2023-08-03  604  			reserved_sectors += w->tmp[offset + sectors].replicas_reserved;
dbbfca9f41e869 Kent Overstreet 2023-08-03  605  			dirty_sectors += w->tmp[offset + sectors].state == SECTOR_dirty;
dbbfca9f41e869 Kent Overstreet 2023-08-03  606  			sectors++;
dbbfca9f41e869 Kent Overstreet 2023-08-03  607  		}
dbbfca9f41e869 Kent Overstreet 2023-08-03  608  		BUG_ON(!sectors);
dbbfca9f41e869 Kent Overstreet 2023-08-03  609  
dbbfca9f41e869 Kent Overstreet 2023-08-03  610  		sector = folio_sector(folio) + offset;
dbbfca9f41e869 Kent Overstreet 2023-08-03  611  
dbbfca9f41e869 Kent Overstreet 2023-08-03  612  		if (w->io &&
dbbfca9f41e869 Kent Overstreet 2023-08-03  613  		    (w->io->op.res.nr_replicas != nr_replicas_this_write ||
dbbfca9f41e869 Kent Overstreet 2023-08-03  614  		     bio_full(&w->io->op.wbio.bio, sectors << 9) ||
dbbfca9f41e869 Kent Overstreet 2023-08-03  615  		     w->io->op.wbio.bio.bi_iter.bi_size + (sectors << 9) >=
dbbfca9f41e869 Kent Overstreet 2023-08-03  616  		     (BIO_MAX_VECS * PAGE_SIZE) ||
dbbfca9f41e869 Kent Overstreet 2023-08-03  617  		     bio_end_sector(&w->io->op.wbio.bio) != sector))
dbbfca9f41e869 Kent Overstreet 2023-08-03  618  			bch2_writepage_do_io(w);
dbbfca9f41e869 Kent Overstreet 2023-08-03  619  
dbbfca9f41e869 Kent Overstreet 2023-08-03 @620  		if (!w->io)
dbbfca9f41e869 Kent Overstreet 2023-08-03  621  			bch2_writepage_io_alloc(c, wbc, w, inode, sector,
dbbfca9f41e869 Kent Overstreet 2023-08-03  622  						nr_replicas_this_write);
dbbfca9f41e869 Kent Overstreet 2023-08-03  623  
dbbfca9f41e869 Kent Overstreet 2023-08-03  624  		atomic_inc(&s->write_count);
dbbfca9f41e869 Kent Overstreet 2023-08-03  625  
dbbfca9f41e869 Kent Overstreet 2023-08-03 @626  		BUG_ON(inode != w->io->inode);
dbbfca9f41e869 Kent Overstreet 2023-08-03  627  		BUG_ON(!bio_add_folio(&w->io->op.wbio.bio, folio,
dbbfca9f41e869 Kent Overstreet 2023-08-03  628  				     sectors << 9, offset << 9));
dbbfca9f41e869 Kent Overstreet 2023-08-03  629  
dbbfca9f41e869 Kent Overstreet 2023-08-03  630  		/* Check for writing past i_size: */
dbbfca9f41e869 Kent Overstreet 2023-08-03  631  		WARN_ONCE((bio_end_sector(&w->io->op.wbio.bio) << 9) >
dbbfca9f41e869 Kent Overstreet 2023-08-03  632  			  round_up(i_size, block_bytes(c)) &&
dbbfca9f41e869 Kent Overstreet 2023-08-03  633  			  !test_bit(BCH_FS_EMERGENCY_RO, &c->flags),
dbbfca9f41e869 Kent Overstreet 2023-08-03  634  			  "writing past i_size: %llu > %llu (unrounded %llu)\n",
dbbfca9f41e869 Kent Overstreet 2023-08-03  635  			  bio_end_sector(&w->io->op.wbio.bio) << 9,
dbbfca9f41e869 Kent Overstreet 2023-08-03  636  			  round_up(i_size, block_bytes(c)),
dbbfca9f41e869 Kent Overstreet 2023-08-03  637  			  i_size);
dbbfca9f41e869 Kent Overstreet 2023-08-03  638  
dbbfca9f41e869 Kent Overstreet 2023-08-03  639  		w->io->op.res.sectors += reserved_sectors;
dbbfca9f41e869 Kent Overstreet 2023-08-03  640  		w->io->op.i_sectors_delta -= dirty_sectors;
dbbfca9f41e869 Kent Overstreet 2023-08-03  641  		w->io->op.new_i_size = i_size;
dbbfca9f41e869 Kent Overstreet 2023-08-03  642  
dbbfca9f41e869 Kent Overstreet 2023-08-03  643  		offset += sectors;
dbbfca9f41e869 Kent Overstreet 2023-08-03  644  	}
dbbfca9f41e869 Kent Overstreet 2023-08-03  645  
dbbfca9f41e869 Kent Overstreet 2023-08-03  646  	if (atomic_dec_and_test(&s->write_count))
dbbfca9f41e869 Kent Overstreet 2023-08-03  647  		folio_end_writeback(folio);
dbbfca9f41e869 Kent Overstreet 2023-08-03  648  
dbbfca9f41e869 Kent Overstreet 2023-08-03  649  	return 0;
dbbfca9f41e869 Kent Overstreet 2023-08-03  650  }
dbbfca9f41e869 Kent Overstreet 2023-08-03  651  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
