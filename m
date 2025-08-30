Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E181E5710
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 07:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756540335; cv=none; b=o+YEjvc0omG0a5pL9hn/pBFaFqvfPPxB6ov22MTwOAU/fcSG9phwET8KehP9pBJdLRNWLoo3jVbkVHEKVuvhAAwAUxqV0IM/8WlMXw6eQtHQRBwFc4/kbAeOv141Ll9GwN66x3wV8EsSoLcD10/aNy6nD7Qp3QvAc8pyMffEjqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756540335; c=relaxed/simple;
	bh=yLVPUPhOV4gVjdQDIC/r2Yi5FuE8bnvFGfW1SdfDRIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lPd+xQSyejyErKjnLdiX2Wb2udVAE8T2mFx6hZIl5FzPlpXjT9Wk7mweUJVmluxZumeNlIzVAT9wQmT5oGTSvU3D0gr/N64XnAHPKmu4LQX2E2aGrsms3nQ4LH6V2FNN7RipfoSOG6aCO5SrN46GTVnf9kR4+JTeLCAwvsm5bIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRGTRgiG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRGTRgiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756540332; x=1788076332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yLVPUPhOV4gVjdQDIC/r2Yi5FuE8bnvFGfW1SdfDRIY=;
  b=lRGTRgiGjkDFStvv6uv7Df6dQj0KXfMFJ30MaD67dg3YMKzL8pbsrywu
   LGMxzff84Ev1gUoLyLvuz3TsTIOlm7bdc7cowyxHfVIPqnXlYaRqph00S
   p4T/aKT2yVki0pbnCClwTP5lQp+xqALUV45aDY7cYfD5Pd2S7/fiNQdoc
   uIpJ/ppqgstCv1XF49WMCzDMGC86LIoUin8tHLKauMk10jcf8qx4UnrsF
   8n8/9blEchw9kWZrmoVZpSamuFJQbGynFbn6767e0rD1p/pWNEqvH35Tm
   dc1jqLffBokKn7ovNQNtGXPcaY9Ay31xbmay7tn7hUywdTQO4vnGkFIW5
   g==;
X-CSE-ConnectionGUID: aF1VSF1UQNyKIzDT3NK2oA==
X-CSE-MsgGUID: AF02cGIrSgqKU1Yi/2f4PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69920220"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="69920220"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 00:52:12 -0700
X-CSE-ConnectionGUID: Rs/tev+pSU+UP798eNgRbw==
X-CSE-MsgGUID: 21Rh5wcgQyesidqVtteS0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="194220048"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2025 00:52:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usGNV-000VFP-0q;
	Sat, 30 Aug 2025 07:52:04 +0000
Date: Sat, 30 Aug 2025 15:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [colyli-bcache:for-next 2/8] drivers/md/bcache/writeback.c:528
 read_dirty() error: uninitialized symbol 'w'.
Message-ID: <202508301526.DWO44fy4-lkp@intel.com>
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
TO: Coly Li <colyli@fnnas.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git for-next
head:   64a24f5938c1f3608091098fbf6c24b52dbe2073
commit: 354e8c8d9c033372e5aa7395417ee1ed556605f0 [2/8] bcache: improve writeback throughput when frontend I/O is idle
:::::: branch date: 29 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301526.DWO44fy4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508301526.DWO44fy4-lkp@intel.com/

smatch warnings:
drivers/md/bcache/writeback.c:528 read_dirty() error: uninitialized symbol 'w'.
drivers/md/bcache/writeback.c:528 read_dirty() error: uninitialized symbol 'w'.

vim +/w +528 drivers/md/bcache/writeback.c

354e8c8d9c0333 Coly Li             2025-08-28  461  
5e6926daac267d Kent Overstreet     2013-07-24  462  static void read_dirty(struct cached_dev *dc)
cafe563591446c Kent Overstreet     2013-03-23  463  {
6f10f7d1b02b1b Coly Li             2018-08-11  464  	unsigned int delay = 0;
354e8c8d9c0333 Coly Li             2025-08-28  465  	struct keybuf_key *next, *w;
cafe563591446c Kent Overstreet     2013-03-23  466  	struct dirty_io *io;
5e6926daac267d Kent Overstreet     2013-07-24  467  	struct closure cl;
354e8c8d9c0333 Coly Li             2025-08-28  468  	size_t size;
354e8c8d9c0333 Coly Li             2025-08-28  469  	int nk, i;
5e6926daac267d Kent Overstreet     2013-07-24  470  
6e6ccc67b9c7a6 Michael Lyle        2018-01-08  471  	BUG_ON(!llist_empty(&dc->writeback_ordering_wait.list));
5e6926daac267d Kent Overstreet     2013-07-24  472  	closure_init_stack(&cl);
cafe563591446c Kent Overstreet     2013-03-23  473  
cafe563591446c Kent Overstreet     2013-03-23  474  	/*
cafe563591446c Kent Overstreet     2013-03-23  475  	 * XXX: if we error, background writeback just spins. Should use some
cafe563591446c Kent Overstreet     2013-03-23  476  	 * mempools.
cafe563591446c Kent Overstreet     2013-03-23  477  	 */
cafe563591446c Kent Overstreet     2013-03-23  478  
539d39eb270834 Tang Junhui         2018-01-08  479  	next = bch_keybuf_next(&dc->writeback_keys);
5e6926daac267d Kent Overstreet     2013-07-24  480  
771f393e8ffc9b Coly Li             2018-03-18  481  	while (!kthread_should_stop() &&
771f393e8ffc9b Coly Li             2018-03-18  482  	       !test_bit(CACHE_SET_IO_DISABLE, &dc->disk.c->flags) &&
771f393e8ffc9b Coly Li             2018-03-18  483  	       next) {
354e8c8d9c0333 Coly Li             2025-08-28  484  		size_t max_size_in_pass;
354e8c8d9c0333 Coly Li             2025-08-28  485  		int max_writebacks_in_pass;
354e8c8d9c0333 Coly Li             2025-08-28  486  
539d39eb270834 Tang Junhui         2018-01-08  487  		size = 0;
539d39eb270834 Tang Junhui         2018-01-08  488  		nk = 0;
354e8c8d9c0333 Coly Li             2025-08-28  489  		reset_heap(&dc->read_dirty_heap);
539d39eb270834 Tang Junhui         2018-01-08  490  
539d39eb270834 Tang Junhui         2018-01-08  491  		do {
539d39eb270834 Tang Junhui         2018-01-08  492  			BUG_ON(ptr_stale(dc->disk.c, &next->key, 0));
539d39eb270834 Tang Junhui         2018-01-08  493  
354e8c8d9c0333 Coly Li             2025-08-28  494  			if (atomic_read(&dc->disk.c->at_max_writeback_rate)) {
354e8c8d9c0333 Coly Li             2025-08-28  495  				max_writebacks_in_pass = MAX_WRITEBACKS_IN_PASS;
354e8c8d9c0333 Coly Li             2025-08-28  496  				max_size_in_pass = MAX_WRITESIZE_IN_PASS;
354e8c8d9c0333 Coly Li             2025-08-28  497  			} else {
354e8c8d9c0333 Coly Li             2025-08-28  498  				max_writebacks_in_pass = WRITEBACKS_IN_PASS;
354e8c8d9c0333 Coly Li             2025-08-28  499  				max_size_in_pass = WRITESIZE_IN_PASS;
354e8c8d9c0333 Coly Li             2025-08-28  500  			}
354e8c8d9c0333 Coly Li             2025-08-28  501  
539d39eb270834 Tang Junhui         2018-01-08  502  			/*
539d39eb270834 Tang Junhui         2018-01-08  503  			 * Don't combine too many operations, even if they
539d39eb270834 Tang Junhui         2018-01-08  504  			 * are all small.
539d39eb270834 Tang Junhui         2018-01-08  505  			 */
354e8c8d9c0333 Coly Li             2025-08-28  506  			if (nk >= max_writebacks_in_pass)
cafe563591446c Kent Overstreet     2013-03-23  507  				break;
cafe563591446c Kent Overstreet     2013-03-23  508  
539d39eb270834 Tang Junhui         2018-01-08  509  			/*
539d39eb270834 Tang Junhui         2018-01-08  510  			 * If the current operation is very large, don't
539d39eb270834 Tang Junhui         2018-01-08  511  			 * further combine operations.
539d39eb270834 Tang Junhui         2018-01-08  512  			 */
354e8c8d9c0333 Coly Li             2025-08-28  513  			if (size >= max_size_in_pass)
539d39eb270834 Tang Junhui         2018-01-08  514  				break;
cafe563591446c Kent Overstreet     2013-03-23  515  
354e8c8d9c0333 Coly Li             2025-08-28  516  			if (!heap_add(&dc->read_dirty_heap, next,
354e8c8d9c0333 Coly Li             2025-08-28  517  				      keybuf_key_cmp))
539d39eb270834 Tang Junhui         2018-01-08  518  				break;
cafe563591446c Kent Overstreet     2013-03-23  519  
539d39eb270834 Tang Junhui         2018-01-08  520  			size += KEY_SIZE(&next->key);
354e8c8d9c0333 Coly Li             2025-08-28  521  			nk++;
539d39eb270834 Tang Junhui         2018-01-08  522  		} while ((next = bch_keybuf_next(&dc->writeback_keys)));
cafe563591446c Kent Overstreet     2013-03-23  523  
539d39eb270834 Tang Junhui         2018-01-08  524  		/* Now we have gathered a set of 1..5 keys to write back. */
539d39eb270834 Tang Junhui         2018-01-08  525  		for (i = 0; i < nk; i++) {
354e8c8d9c0333 Coly Li             2025-08-28  526  			heap_pop(&dc->read_dirty_heap, w, keybuf_key_cmp);
539d39eb270834 Tang Junhui         2018-01-08  527  
29f1d5caced9c2 Gustavo A. R. Silva 2020-07-25 @528  			io = kzalloc(struct_size(io, bio.bi_inline_vecs,
29f1d5caced9c2 Gustavo A. R. Silva 2020-07-25  529  						DIV_ROUND_UP(KEY_SIZE(&w->key), PAGE_SECTORS)),
cafe563591446c Kent Overstreet     2013-03-23  530  				     GFP_KERNEL);
cafe563591446c Kent Overstreet     2013-03-23  531  			if (!io)
cafe563591446c Kent Overstreet     2013-03-23  532  				goto err;
cafe563591446c Kent Overstreet     2013-03-23  533  
cafe563591446c Kent Overstreet     2013-03-23  534  			w->private	= io;
cafe563591446c Kent Overstreet     2013-03-23  535  			io->dc		= dc;
cafe563591446c Kent Overstreet     2013-03-23  536  
cafe563591446c Kent Overstreet     2013-03-23  537  			dirty_init(w);
c34b7ac6508755 Christoph Hellwig   2022-12-06  538  			io->bio.bi_opf = REQ_OP_READ;
4f024f3797c43c Kent Overstreet     2013-10-11  539  			io->bio.bi_iter.bi_sector = PTR_OFFSET(&w->key, 0);
11e9560e6c005b Christoph Hellwig   2021-04-11  540  			bio_set_dev(&io->bio, dc->disk.c->cache->bdev);
cafe563591446c Kent Overstreet     2013-03-23  541  			io->bio.bi_end_io	= read_dirty_endio;
cafe563591446c Kent Overstreet     2013-03-23  542  
25d8be77e19224 Ming Lei            2017-12-18  543  			if (bch_bio_alloc_pages(&io->bio, GFP_KERNEL))
cafe563591446c Kent Overstreet     2013-03-23  544  				goto err_free;
cafe563591446c Kent Overstreet     2013-03-23  545  
c37511b863f36c Kent Overstreet     2013-04-26  546  			trace_bcache_writeback(&w->key);
cafe563591446c Kent Overstreet     2013-03-23  547  
c2a4f3183a1248 Kent Overstreet     2013-09-23  548  			down(&dc->in_flight);
539d39eb270834 Tang Junhui         2018-01-08  549  
3be11dbab67a3e Coly Li             2018-08-11  550  			/*
3be11dbab67a3e Coly Li             2018-08-11  551  			 * We've acquired a semaphore for the maximum
539d39eb270834 Tang Junhui         2018-01-08  552  			 * simultaneous number of writebacks; from here
539d39eb270834 Tang Junhui         2018-01-08  553  			 * everything happens asynchronously.
539d39eb270834 Tang Junhui         2018-01-08  554  			 */
5e6926daac267d Kent Overstreet     2013-07-24  555  			closure_call(&io->cl, read_dirty_submit, NULL, &cl);
539d39eb270834 Tang Junhui         2018-01-08  556  		}
cafe563591446c Kent Overstreet     2013-03-23  557  
539d39eb270834 Tang Junhui         2018-01-08  558  		delay = writeback_delay(dc, size);
539d39eb270834 Tang Junhui         2018-01-08  559  
771f393e8ffc9b Coly Li             2018-03-18  560  		while (!kthread_should_stop() &&
771f393e8ffc9b Coly Li             2018-03-18  561  		       !test_bit(CACHE_SET_IO_DISABLE, &dc->disk.c->flags) &&
771f393e8ffc9b Coly Li             2018-03-18  562  		       delay) {
539d39eb270834 Tang Junhui         2018-01-08  563  			schedule_timeout_interruptible(delay);
539d39eb270834 Tang Junhui         2018-01-08  564  			delay = writeback_delay(dc, 0);
539d39eb270834 Tang Junhui         2018-01-08  565  		}
cafe563591446c Kent Overstreet     2013-03-23  566  	}
cafe563591446c Kent Overstreet     2013-03-23  567  
cafe563591446c Kent Overstreet     2013-03-23  568  	if (0) {
cafe563591446c Kent Overstreet     2013-03-23  569  err_free:
cafe563591446c Kent Overstreet     2013-03-23  570  		kfree(w->private);
cafe563591446c Kent Overstreet     2013-03-23  571  err:
cafe563591446c Kent Overstreet     2013-03-23  572  		bch_keybuf_del(&dc->writeback_keys, w);
cafe563591446c Kent Overstreet     2013-03-23  573  	}
cafe563591446c Kent Overstreet     2013-03-23  574  
c2a4f3183a1248 Kent Overstreet     2013-09-23  575  	/*
c2a4f3183a1248 Kent Overstreet     2013-09-23  576  	 * Wait for outstanding writeback IOs to finish (and keybuf slots to be
c2a4f3183a1248 Kent Overstreet     2013-09-23  577  	 * freed) before refilling again
c2a4f3183a1248 Kent Overstreet     2013-09-23  578  	 */
5e6926daac267d Kent Overstreet     2013-07-24  579  	closure_sync(&cl);
5e6926daac267d Kent Overstreet     2013-07-24  580  }
5e6926daac267d Kent Overstreet     2013-07-24  581  

:::::: The code at line 528 was first introduced by commit
:::::: 29f1d5caced9c2db96f169422bade787ff45d584 bcache: Use struct_size() in kzalloc()

:::::: TO: Gustavo A. R. Silva <gustavoars@kernel.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
