Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5843D1B28C
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 13:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aZeLns4I"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so10151005e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 05:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700488326; x=1701093126; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bULnLIE2eDMfxcHiHhS5j+oGOLRe3aK0Qz+32l5e634=;
        b=aZeLns4IW9bIsw1IafySg3ajM9HyzPiB0hQJ7oDBYrT4t5rMk8MFf0vMzDBewqgfGd
         iVu3ZGHhRA01uCkJtZyt+enysdy5OXkwFdY/TC2lwQpcw3kKasQAXqOA36J/Qwci++rx
         KgiCSHY+F5cxWq07Z/A9waicpeZKCLd5dJotldJh/If7L9ptPYUjaInWwrEQhg13NugW
         1dNSERAX5QwfR9lgJ4b8YHjag4pLomU6jDNNxf/GUi1cgWlRx755oM/pnrdsGzyY85Kt
         zsIQ7Qf1jzx67wBfcUpedq9S6TktYAt3A8eAtjXwjy4Z5Zma+LgkmyeRIj3l/AJsjcqo
         B2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488326; x=1701093126;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bULnLIE2eDMfxcHiHhS5j+oGOLRe3aK0Qz+32l5e634=;
        b=Kv4VY8e/Z0GjCWoFcF1pHPvfzn2jWoY6qH5CiKKCIAGux+tj4A+U5KC0ExSDPYYdTt
         cC4s5CLGPmmPPJ/r1M5Th6Rb3uqmVxnp3EC1WzD5kEL0cFPruoIptc/9Id9SsWhgcJkV
         FqubisL1bx6l1JqvfNYfdQ7I5qpKnSia/h7HpKZzj6x1i7EbmzIZC5H6hIAgPdKUinwU
         Xbvs2xi3XVxHLZ3t+O7v06hZElBt45YzEi3iMtPh+RvmhimPdNfZZk5snXqICyVxb+gH
         kBxnMTCGI1YjYOdCGoSyZrGH8dDdXwgTv1Pa+63LTVyu7rdTAf2G4+qGsIfsBFakgz2c
         8AZQ==
X-Gm-Message-State: AOJu0Yzux7gx04+217Ea6wl9nJx9mA4J1ozTK1EMSXVlGbpV8dSvKdxz
	/fVlemABQYUB0HZDVs6Imd9zgjPGTLMgQtSX/DU=
X-Google-Smtp-Source: AGHT+IH2yEh07EdzWqsuK4qg2AB7rLyys/z0uuKef1YCL8GQoowN9H/h8EVsRIwPFSpLvfK5FE+Cqw==
X-Received: by 2002:a05:6000:18ae:b0:32f:dd2f:9b93 with SMTP id b14-20020a05600018ae00b0032fdd2f9b93mr13482199wri.9.1700488325633;
        Mon, 20 Nov 2023 05:52:05 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m3-20020adffa03000000b00323293bd023sm11295420wrr.6.2023.11.20.05.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:52:05 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Nov 2023 08:52:02 -0500
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 21/62] mm/page-writeback.c:2511
 write_cache_folios() error: uninitialized symbol 'nr'.
Message-ID: <1c4f7d84-7158-43ac-aed3-13237c63ad3a@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   6ec42a9924d444c5fa6db0af13383a7009f550b6
commit: 7fe1517b3ffc7ba7c550c79c029c4a6400140f5d [21/62] writeback: optionally submit pending data when blocking in write_cache_pages
config: i386-randconfig-141-20231119 (https://download.01.org/0day-ci/archive/20231119/202311192253.GU1i7dEt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311192253.GU1i7dEt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311192253.GU1i7dEt-lkp@intel.com/

New smatch warnings:
mm/page-writeback.c:2511 write_cache_folios() error: uninitialized symbol 'nr'.

vim +/nr +2511 mm/page-writeback.c

7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2397  int write_cache_folios(struct address_space *mapping,
0ea97180162518 Miklos Szeredi             2007-05-10  2398  		struct writeback_control *wbc, writepage_t writepage,
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2399  		wp_submit_t submit, void *data)
811d736f9e8013 David Howells              2006-08-29  2400  {
811d736f9e8013 David Howells              2006-08-29  2401  	int ret = 0;
811d736f9e8013 David Howells              2006-08-29  2402  	int done = 0;
3fa750dcf29e86 Brian Foster               2018-12-28  2403  	int error;
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2404) 	struct folio_batch fbatch;
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2405) 	int nr_folios;
811d736f9e8013 David Howells              2006-08-29  2406  	pgoff_t index;
811d736f9e8013 David Howells              2006-08-29  2407  	pgoff_t end;		/* Inclusive */
bd19e012f6fd3b Nicholas Piggin            2009-01-06  2408  	pgoff_t done_index;
811d736f9e8013 David Howells              2006-08-29  2409  	int range_whole = 0;
ff9c745b81ff1e Matthew Wilcox             2017-11-22  2410  	xa_mark_t tag;
811d736f9e8013 David Howells              2006-08-29  2411  
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2412) 	folio_batch_init(&fbatch);
811d736f9e8013 David Howells              2006-08-29  2413  	if (wbc->range_cyclic) {
28659cc8cc8766 Chao Yu                    2020-06-01  2414  		index = mapping->writeback_index; /* prev offset */
811d736f9e8013 David Howells              2006-08-29  2415  		end = -1;
811d736f9e8013 David Howells              2006-08-29  2416  	} else {
09cbfeaf1a5a67 Kirill A. Shutemov         2016-04-01  2417  		index = wbc->range_start >> PAGE_SHIFT;
09cbfeaf1a5a67 Kirill A. Shutemov         2016-04-01  2418  		end = wbc->range_end >> PAGE_SHIFT;
811d736f9e8013 David Howells              2006-08-29  2419  		if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX)
811d736f9e8013 David Howells              2006-08-29  2420  			range_whole = 1;
811d736f9e8013 David Howells              2006-08-29  2421  	}
cc7b8f6245f004 Mauricio Faria de Oliveira 2020-04-01  2422  	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages) {
cc7b8f6245f004 Mauricio Faria de Oliveira 2020-04-01  2423  		tag_pages_for_writeback(mapping, index, end);
f446daaea9d4a4 Jan Kara                   2010-08-09  2424  		tag = PAGECACHE_TAG_TOWRITE;
cc7b8f6245f004 Mauricio Faria de Oliveira 2020-04-01  2425  	} else {
f446daaea9d4a4 Jan Kara                   2010-08-09  2426  		tag = PAGECACHE_TAG_DIRTY;
cc7b8f6245f004 Mauricio Faria de Oliveira 2020-04-01  2427  	}
bd19e012f6fd3b Nicholas Piggin            2009-01-06  2428  	done_index = index;
5a3d5c9813db56 Nicholas Piggin            2009-01-06  2429  	while (!done && (index <= end)) {
5a3d5c9813db56 Nicholas Piggin            2009-01-06  2430  		int i;
5a3d5c9813db56 Nicholas Piggin            2009-01-06  2431  
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2432) 		nr_folios = filemap_get_folios_tag(mapping, &index, end,
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2433) 				tag, &fbatch);
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2434) 
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2435) 		if (nr_folios == 0)
5a3d5c9813db56 Nicholas Piggin            2009-01-06  2436  			break;
811d736f9e8013 David Howells              2006-08-29  2437  
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2438) 		for (i = 0; i < nr_folios; i++) {
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2439) 			struct folio *folio = fbatch.folios[i];
8344a3d44be3d1 Matthew Wilcox (Oracle     2023-06-28  2440) 			unsigned long nr;
811d736f9e8013 David Howells              2006-08-29  2441  
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2442) 			done_index = folio->index;
d5482cdf8a0aac Nicholas Piggin            2009-01-06  2443  
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2444  			if (submit) {
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2445  				if (!folio_trylock(folio)) {
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2446  					error = submit(mapping, wbc, data);
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2447  					if (error)
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2448  						goto handle_error;
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2449  					folio_lock(folio);
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2450  				}
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2451  			} else {
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2452) 				folio_lock(folio);
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2453  			}
811d736f9e8013 David Howells              2006-08-29  2454  
5a3d5c9813db56 Nicholas Piggin            2009-01-06  2455  			/*
5a3d5c9813db56 Nicholas Piggin            2009-01-06  2456  			 * Page truncated or invalidated. We can freely skip it
5a3d5c9813db56 Nicholas Piggin            2009-01-06  2457  			 * then, even for data integrity operations: the page
5a3d5c9813db56 Nicholas Piggin            2009-01-06  2458  			 * has disappeared concurrently, so there could be no
f0953a1bbaca71 Ingo Molnar                2021-05-06  2459  			 * real expectation of this data integrity operation
5a3d5c9813db56 Nicholas Piggin            2009-01-06  2460  			 * even if there is now a new, dirty page at the same
5a3d5c9813db56 Nicholas Piggin            2009-01-06  2461  			 * pagecache address.
5a3d5c9813db56 Nicholas Piggin            2009-01-06  2462  			 */
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2463) 			if (unlikely(folio->mapping != mapping)) {
5a3d5c9813db56 Nicholas Piggin            2009-01-06  2464  continue_unlock:
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2465) 				folio_unlock(folio);
811d736f9e8013 David Howells              2006-08-29  2466  				continue;
811d736f9e8013 David Howells              2006-08-29  2467  			}
811d736f9e8013 David Howells              2006-08-29  2468  
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2469) 			if (!folio_test_dirty(folio)) {
515f4a037fb9ab Nicholas Piggin            2009-01-06  2470  				/* someone wrote it for us */
515f4a037fb9ab Nicholas Piggin            2009-01-06  2471  				goto continue_unlock;
515f4a037fb9ab Nicholas Piggin            2009-01-06  2472  			}
515f4a037fb9ab Nicholas Piggin            2009-01-06  2473  
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2474) 			if (folio_test_writeback(folio)) {
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2475  				if (wbc->sync_mode == WB_SYNC_NONE)
515f4a037fb9ab Nicholas Piggin            2009-01-06  2476  					goto continue_unlock;
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2477  				if (submit) {
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2478  					error = submit(mapping, wbc, data);
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2479  					if (error)
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2480  						goto handle_error;

"nr" is uninitialized on this path.

7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2481  				}
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2482  				folio_wait_writeback(folio);
515f4a037fb9ab Nicholas Piggin            2009-01-06  2483  			}
811d736f9e8013 David Howells              2006-08-29  2484  
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2485) 			BUG_ON(folio_test_writeback(folio));
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2486) 			if (!folio_clear_dirty_for_io(folio))
5a3d5c9813db56 Nicholas Piggin            2009-01-06  2487  				goto continue_unlock;
811d736f9e8013 David Howells              2006-08-29  2488  
de1414a654e66b Christoph Hellwig          2015-01-14  2489  			trace_wbc_writepage(wbc, inode_to_bdi(mapping->host));
d585bdbeb79aa1 Matthew Wilcox (Oracle     2023-01-26  2490) 			error = writepage(folio, wbc, data);
8344a3d44be3d1 Matthew Wilcox (Oracle     2023-06-28  2491) 			nr = folio_nr_pages(folio);
3fa750dcf29e86 Brian Foster               2018-12-28  2492  			if (unlikely(error)) {
7fe1517b3ffc7b Christoph Hellwig          2023-10-25  2493  handle_error:
3fa750dcf29e86 Brian Foster               2018-12-28  2494  				/*
3fa750dcf29e86 Brian Foster               2018-12-28  2495  				 * Handle errors according to the type of
3fa750dcf29e86 Brian Foster               2018-12-28  2496  				 * writeback. There's no need to continue for
3fa750dcf29e86 Brian Foster               2018-12-28  2497  				 * background writeback. Just push done_index
3fa750dcf29e86 Brian Foster               2018-12-28  2498  				 * past this page so media errors won't choke
3fa750dcf29e86 Brian Foster               2018-12-28  2499  				 * writeout for the entire file. For integrity
3fa750dcf29e86 Brian Foster               2018-12-28  2500  				 * writeback, we must process the entire dirty
3fa750dcf29e86 Brian Foster               2018-12-28  2501  				 * set regardless of errors because the fs may
3fa750dcf29e86 Brian Foster               2018-12-28  2502  				 * still have state to clear for each page. In
3fa750dcf29e86 Brian Foster               2018-12-28  2503  				 * that case we continue processing and return
3fa750dcf29e86 Brian Foster               2018-12-28  2504  				 * the first error.
3fa750dcf29e86 Brian Foster               2018-12-28  2505  				 */
3fa750dcf29e86 Brian Foster               2018-12-28  2506  				if (error == AOP_WRITEPAGE_ACTIVATE) {
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2507) 					folio_unlock(folio);
3fa750dcf29e86 Brian Foster               2018-12-28  2508  					error = 0;
3fa750dcf29e86 Brian Foster               2018-12-28  2509  				} else if (wbc->sync_mode != WB_SYNC_ALL) {
3fa750dcf29e86 Brian Foster               2018-12-28  2510  					ret = error;
8344a3d44be3d1 Matthew Wilcox (Oracle     2023-06-28 @2511) 					done_index = folio->index + nr;

Potentially uninitialized depending on what submit() returns.

00266770b8b3a6 Nicholas Piggin            2009-01-06  2512  					done = 1;
00266770b8b3a6 Nicholas Piggin            2009-01-06  2513  					break;
e423003028183d Andrew Morton              2007-10-16  2514  				}
3fa750dcf29e86 Brian Foster               2018-12-28  2515  				if (!ret)
3fa750dcf29e86 Brian Foster               2018-12-28  2516  					ret = error;
00266770b8b3a6 Nicholas Piggin            2009-01-06  2517  			}
00266770b8b3a6 Nicholas Piggin            2009-01-06  2518  
dcf6a79dda5cc2 Artem Bityutskiy           2009-02-02  2519  			/*
546a1924224078 Dave Chinner               2010-08-24  2520  			 * We stop writing back only if we are not doing
546a1924224078 Dave Chinner               2010-08-24  2521  			 * integrity sync. In case of integrity sync we have to
546a1924224078 Dave Chinner               2010-08-24  2522  			 * keep going until we have written all the pages
546a1924224078 Dave Chinner               2010-08-24  2523  			 * we tagged for writeback prior to entering this loop.
dcf6a79dda5cc2 Artem Bityutskiy           2009-02-02  2524  			 */
8344a3d44be3d1 Matthew Wilcox (Oracle     2023-06-28  2525) 			wbc->nr_to_write -= nr;
8344a3d44be3d1 Matthew Wilcox (Oracle     2023-06-28  2526) 			if (wbc->nr_to_write <= 0 &&
546a1924224078 Dave Chinner               2010-08-24  2527  			    wbc->sync_mode == WB_SYNC_NONE) {
811d736f9e8013 David Howells              2006-08-29  2528  				done = 1;
82fd1a9a8ced96 Andrew Morton              2009-01-06  2529  				break;
82fd1a9a8ced96 Andrew Morton              2009-01-06  2530  			}
89e1219004b365 Federico Cuello            2009-02-11  2531  		}
0fff435f060c8b Vishal Moola (Oracle       2023-01-04  2532) 		folio_batch_release(&fbatch);
811d736f9e8013 David Howells              2006-08-29  2533  		cond_resched();
811d736f9e8013 David Howells              2006-08-29  2534  	}
64081362e8ff45 Dave Chinner               2018-10-26  2535  
811d736f9e8013 David Howells              2006-08-29  2536  	/*
64081362e8ff45 Dave Chinner               2018-10-26  2537  	 * If we hit the last page and there is more work to be done: wrap
64081362e8ff45 Dave Chinner               2018-10-26  2538  	 * back the index back to the start of the file for the next
64081362e8ff45 Dave Chinner               2018-10-26  2539  	 * time we are called.
811d736f9e8013 David Howells              2006-08-29  2540  	 */
64081362e8ff45 Dave Chinner               2018-10-26  2541  	if (wbc->range_cyclic && !done)
64081362e8ff45 Dave Chinner               2018-10-26  2542  		done_index = 0;
0b5649278e39a0 Dave Chinner               2010-06-09  2543  	if (wbc->range_cyclic || (range_whole && wbc->nr_to_write > 0))
bd19e012f6fd3b Nicholas Piggin            2009-01-06  2544  		mapping->writeback_index = done_index;
06d6cf6959d220 Aneesh Kumar K.V           2008-07-11  2545  
811d736f9e8013 David Howells              2006-08-29  2546  	return ret;
811d736f9e8013 David Howells              2006-08-29  2547  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

