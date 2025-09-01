Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F8A217F55
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Sep 2025 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724598; cv=none; b=ri+PctBVGXdp/qQ/0QIZ8b7TRacNjdRdSf4lQCK7iTmNQTjHrqDKnavl06PQYIyDsZNE91Y2KO97xaYAQWdF9RGBL7HdnnJJSZx419hHIdCd53q1LkzQJPEyj/PdKzaY/KKK0Aqy9mb4Z2C2zn7obqJrCEQpFJuSm2u66UKz9rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724598; c=relaxed/simple;
	bh=ptGJCdbRm+L7I8B9lPfGk2/T+BCPlsgI+n/6cIFtGsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m7xRviYBiYhBoBX6kw3lzR+kgvXsIX9GTa0hNxFo6IzOCDn5AyoOr4boasvAI8bjHQJL7l701PVOnO5Ly3UM9EnCLpQnt2C9na7n+OjPg2fhuDpgeFElM6Pax4BQ5YeiuTzzk53yJ4WyC1KLC9MkiNTRE23RxI5abs4mEMuX8h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cDIyrX7Q; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cDIyrX7Q"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b83ae1734so14628265e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Sep 2025 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756724595; x=1757329395; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0lrijmnSkItkFmsHISp2ytuEc4cny30bE8H1X92+55Y=;
        b=cDIyrX7Q7hf4bPeTE74eo1HmTrcyHWdhLOkxf3Oc0WoIxG2hHGHiMcF5UNGaogzn/O
         K77gyf44CzwJ5U9FeCGjvuwHxyL2CEvKgsKAiVbSEWdEDUtyjDzgXpqB5rrupqhXvTun
         u+ZRwrsL047ccA4pVeFFHtn/vnQ6J13jkIisXntAGgypmTsORmSzXOltX5PN6IKyAKcw
         oz7nsDc51DxKgFt1AZv06gi/oxiZwNmfUkgivC7UN2crHccAKbR9fTjytWIFjhwLEbkJ
         vAsHY3A9mhac0pkTeEoe9o1eyID5AagzpHOE5zjhP0L+kH6XFM19291YRrZQTUBXIchU
         z9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724595; x=1757329395;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0lrijmnSkItkFmsHISp2ytuEc4cny30bE8H1X92+55Y=;
        b=sx2RiwRO/kE8o37q/TAwbkSPcitc2qSyIQXRFq9b0Kk5Sik7gBsOK+pcjJAFtXAimH
         Rb6o9DivRFd/7EQVGoh3HJw3JNi7256K6SB5zSpk9HT4tLf6mNCpFdjsqgUEjygylQZw
         gRw6PR2YRr6iCRuPAyZSxCWH1O69aCm1+aqPAI6DR0bxrMQ0HzrIqjjTE0PdWAk+/2Mw
         CgwjW6xFh0fI8kTbPVMdFUHgEWbw6CNkwtRgMcrmFXaI1+aunyvc4MnIFB3ifbMb1YaX
         VFtSUewmMLrSpVcEzpvEmK7pNApkpNiayo7/xmBu+Zh1dTQ0H8Z5sz70ix3rpJq/Fv46
         Vu2A==
X-Gm-Message-State: AOJu0YzajWbEZMlvhH+RYQPX1+ofSH7FwnmXLumu2N5DiojJQjfRGum5
	K0icIR2Ra8fZT+DSx/FJxuO061KX9pRGG1naJytSZqkDiNJQmdLEF5ocLnOExYf5/zafaQfygtK
	Bea5M
X-Gm-Gg: ASbGncsM2hFXV5sYJ8XMc9YthvX3i1RnzsWqvq99vlexE8jvFWB+07m/y9NAByZeMLo
	xVvnxCxi6s1sgvGwxjmpU4ahwvwRwpTtjOyKTn+1Lrh5y7xqGiq5tVb+qJcVdWGpuOnpueQBNoU
	f69hiIFf5h7TG24OfsbEgLDjT6K2/+GoI7Nj4KputvElDthbzqHAoKxRyx3ZLh2W0/rexSpz9eC
	KiPpuNe+tUnZKrpRuI2fHp6ABHRGvF+NFd19Oiv8JE7ZcEbA4PFKr8LcYaELsbPkQeoLznZaF4T
	amZkTBiTu35r8RtWLiRdapNVCCj9pI2rGaROFZHuVNZWChEbxPiMtaACvtG65wnaDAr0zv0LMBj
	HA/JSLdikxnJ+q7lWJbSskKSmAtI=
X-Google-Smtp-Source: AGHT+IGeZQla2uiihmhyZKOqzDM/uEAxqHznjRkio83cU9U9Gu89cdX8OEsHVjN+B1MolgD4xJ6Dgw==
X-Received: by 2002:a05:600c:1914:b0:45b:8a6f:c6de with SMTP id 5b1f17b1804b1-45b8a6fc825mr37685545e9.29.1756724594520;
        Mon, 01 Sep 2025 04:03:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf33adf170sm15738737f8f.33.2025.09.01.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 04:03:13 -0700 (PDT)
Date: Mon, 1 Sep 2025 14:03:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Coly Li <colyli@fnnas.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
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
Message-ID: <20250901110310.XjkVBUhKeQ_GxyaAZ90II3b3oSFpdEyoDv0wkv_K9Tw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git for-next
head:   64a24f5938c1f3608091098fbf6c24b52dbe2073
commit: 354e8c8d9c033372e5aa7395417ee1ed556605f0 [2/8] bcache: improve writeback throughput when frontend I/O is idle
config: x86_64-randconfig-161-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301526.DWO44fy4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508301526.DWO44fy4-lkp@intel.com/

smatch warnings:
drivers/md/bcache/writeback.c:528 read_dirty() error: uninitialized symbol 'w'.

vim +/w +528 drivers/md/bcache/writeback.c

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

Smatch wants error checking on heap_pop() but probably it's not
required?

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

