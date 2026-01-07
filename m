Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F154C32ED20
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 17:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767806255; cv=none; b=AGLA7rJX1HG/zVdHMIQlX/HLc95In/n0LDv8Td3ukj1L+ocoqrgp1YJxG8bKXsH8l2coaSCGXjdZGTKKKiaSFm+uZMzZaIL7Hpt3W4xnIiykTojhTsRjEYHk8xiexzEgcezRsH8LAtsLKtVdhl2L2eWP00bpr42owLfN8OgfenM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767806255; c=relaxed/simple;
	bh=uhtINrfIadcAj6+za+0pIVsY+Nl7BnF5SGkZ20dgQMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uX/aocae7z67Pad+hAPrXNU46V+77aoXvZ5YsaiMqMtkxo2/Sx1O3gPzOOdQOCOmu9bWP1oTlHjo0eBTIfpaZlTGYl+w6sy824W4WBAgBeAweADJ0KspHa8fk7L5VtYXzCkBBlRqmENhDhbpv/EqZGdb9WZZdwXg4tSnVKCzAUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRHUq7za; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRHUq7za"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b220ddc189so296847985a.0
        for <oe-kbuild@lists.linux.dev>; Wed, 07 Jan 2026 09:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767806241; x=1768411041; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4AFhOvo+tTNAZd0ZKvjlFF2owld4XZ2T3CHkp0RhC3M=;
        b=WRHUq7zawtji6IlhYRNEO4Lj7E5QQVx6jcxsENRys+dTeXllrM+csmNYKAAJjfhSKi
         lelfLQiR+qahbvAuBr52LV/sfEuRWKdPCvj3tqnN8N0Q3RvdWYkFBvhmEV0TzNTa0os8
         l3T5go4Lu6XdhgHmrQr+aMoNDGSBjm7DnFNGdQyvGKQ6r6Py2c+s7WuXSVvV2P++Kryb
         fcMfGBAZWvl980HyKtitOJxTDpS4ZiY2NAN0KN8CN+KQYHxdVyJlJt3ngV46R5uNWka+
         t5xPzszx6dZXAjtu/5iJEuziKsuoKywVENVgc4KxECzH6qOMlDzclI+p7L3E002r3hQR
         dD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767806241; x=1768411041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AFhOvo+tTNAZd0ZKvjlFF2owld4XZ2T3CHkp0RhC3M=;
        b=jzNXTcCslw0xMHD8o1gexJbBBUNNSKlUjPkkwkHYoisOlmZiPeDzU7a9GmDzyO2Erg
         raqnEu67rODrnBKiAL+EP46SHm7GP+wNvJpt+EG0IbjgRLJOD48qK36oYCtuFHC6KfUp
         yyXWSuvrMwqBtu4llpbqYKy2p1PoofrtOtNKKGF+wxAs3EgdEbwI3nFWtItiq9pLuNRb
         L9Irp+7p12v1zNj44gLAHZvjycq5nkEv/vpaDlfX0PYy/neNl1Cv3OdzgA1PS+WFpO+P
         RSURe12SrCQhjXXuGJPHKLlhbfKAMIsA+IJ4oc+WGxy3A2uUUFXHW2V9sgRql6AF7zqA
         6teg==
X-Gm-Message-State: AOJu0Yxo3QLSjC8YjwGsso4+Pmt1PlZRUWeENTNFh6RRt/x8QZYzFF8M
	KcyIE3Fa+/NSxrjbp52MJRjlMB1wbN7Wm8/UNwL2pUbi4/U3BJglWxpV
X-Gm-Gg: AY/fxX6CykBlXZCzJTrxXQ35+G2sOLJJHdBwip6tlgO6N4F1gqhWt5A69vcQ2SFaUjF
	ZazwaY3l4FF7jhXZpr31VWa7SE6tUPbGlYCErYIV5wgzFH1KREx8zay5g5sNkK0iNR2EiblCoEM
	12hJZYkAs9GUCgHr3ZpK9O+kKpiuFQ/5dlvMQKC7HNHdjzglTYLZ0H0UNUaeA9iBwvzwrtJCx0m
	4ekul9q2/q8E2UBjtU+n4uLGTJ9LtbZjJN3eKSbUs3JnIEG2KW1zdPtzvZ7qzu3hvwBkiGYdyVg
	J/ODXWXEWsngdt9JuoFAsusy4GutDcUpjWacDdt5jn5tUyAnPxEgt7fkWT23dXM8kdtSxzepVBL
	Ej31zmFezPxLBb/yTIkDvUQ+nEGnj7Sw2+L4Aq+aPqhTMbnYTL/xt8O2Thqpg1jVyJiMdDkfxM6
	9IbXMbWDNZBc+BtVyaaezgIQZ6tAT4gnmuW7N8DskR7LymL4E=
X-Google-Smtp-Source: AGHT+IGVKeQOFtI+R/PvNdXFJKBiY8CLzdBB4h+kd/yZ6tWSEgRmy7krgmHNmfr+jDFsTMtgGtGmmg==
X-Received: by 2002:a05:6214:5d04:b0:884:6f86:e07d with SMTP id 6a1803df08f44-8908418ef68mr40629136d6.15.1767806240912;
        Wed, 07 Jan 2026 09:17:20 -0800 (PST)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077236f33sm37092706d6.32.2026.01.07.09.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 09:17:19 -0800 (PST)
Date: Thu, 8 Jan 2026 01:17:15 +0800
From: Kairui Song <ryncsn@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>
Subject: Re: mm/vmscan.c:784 __remove_mapping() error: uninitialized symbol
 'ci'.
Message-ID: <aV6UzKs_f_q0IPH7@KASONG-MC4>
References: <202601010353.E7g5cCo8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601010353.E7g5cCo8-lkp@intel.com>

On Thu, Jan 01, 2026 at 04:01:28AM +0800, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Kairui Song <kasong@tencent.com>
> CC: Andrew Morton <akpm@linux-foundation.org>
> CC: Linux Memory Management List <linux-mm@kvack.org>
> CC: Chris Li <chrisl@kernel.org>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c8ebd433459bcbf068682b09544e830acd7ed222
> commit: 8578e0c00dcf0c58fbc32d4904ecaf8e802a6590 mm, swap: use the swap table for the swap cache and switch API
> date:   3 months ago
> :::::: branch date: 18 hours ago
> :::::: commit date: 3 months ago
> config: m68k-randconfig-r073-20251231 (https://download.01.org/0day-ci/archive/20260101/202601010353.E7g5cCo8-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 14.3.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202601010353.E7g5cCo8-lkp@intel.com/
> 
> smatch warnings:
> mm/vmscan.c:784 __remove_mapping() error: uninitialized symbol 'ci'.
> 
> vim +/ci +784 mm/vmscan.c
> 
> ^1da177e4c3f41 Linus Torvalds          2005-04-16  723  
> a649fd9271773d Andrew Morton           2006-10-17  724  /*
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  725)  * Same as remove_mapping, but if the folio is removed from the mapping, it
> e286781d5f2e9c Nicholas Piggin         2008-07-25  726   * gets returned with a refcount of 0.
> a649fd9271773d Andrew Morton           2006-10-17  727   */
> be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  728) static int __remove_mapping(struct address_space *mapping, struct folio *folio,
> b910718a948a91 Johannes Weiner         2019-11-30  729  			    bool reclaimed, struct mem_cgroup *target_memcg)
> 49d2e9cc454436 Christoph Lameter       2006-01-08  730  {
> bd4c82c22c367e Ying Huang              2017-09-06  731  	int refcount;
> aae466b0052e18 Joonsoo Kim             2020-08-11  732  	void *shadow = NULL;
> 8578e0c00dcf0c Kairui Song             2025-09-17  733  	struct swap_cluster_info *ci;
> c4843a7593a9df Greg Thelen             2015-05-22  734  
> be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  735) 	BUG_ON(!folio_test_locked(folio));
> be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  736) 	BUG_ON(mapping != folio_mapping(folio));
> 49d2e9cc454436 Christoph Lameter       2006-01-08  737  
> 8578e0c00dcf0c Kairui Song             2025-09-17  738  	if (folio_test_swapcache(folio)) {
> 8578e0c00dcf0c Kairui Song             2025-09-17  739  		ci = swap_cluster_get_and_lock_irq(folio);
> 8578e0c00dcf0c Kairui Song             2025-09-17  740  	} else {
> 51b8c1fe250d1b Johannes Weiner         2021-11-08  741  		spin_lock(&mapping->host->i_lock);
> 3047250972ff93 Johannes Weiner         2021-09-02  742  		xa_lock_irq(&mapping->i_pages);
> 8578e0c00dcf0c Kairui Song             2025-09-17  743  	}
> 8578e0c00dcf0c Kairui Song             2025-09-17  744  
> 49d2e9cc454436 Christoph Lameter       2006-01-08  745  	/*
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  746) 	 * The non racy check for a busy folio.
> 0fd0e6b05aa096 Nicholas Piggin         2006-09-27  747  	 *
> 0fd0e6b05aa096 Nicholas Piggin         2006-09-27  748  	 * Must be careful with the order of the tests. When someone has
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  749) 	 * a ref to the folio, it may be possible that they dirty it then
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  750) 	 * drop the reference. So if the dirty flag is tested before the
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  751) 	 * refcount here, then the following race may occur:
> 0fd0e6b05aa096 Nicholas Piggin         2006-09-27  752  	 *
> 0fd0e6b05aa096 Nicholas Piggin         2006-09-27  753  	 * get_user_pages(&page);
> 0fd0e6b05aa096 Nicholas Piggin         2006-09-27  754  	 * [user mapping goes away]
> 0fd0e6b05aa096 Nicholas Piggin         2006-09-27  755  	 * write_to(page);
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  756) 	 *				!folio_test_dirty(folio)    [good]
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  757) 	 * folio_set_dirty(folio);
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  758) 	 * folio_put(folio);
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  759) 	 *				!refcount(folio)   [good, discard it]
> 0fd0e6b05aa096 Nicholas Piggin         2006-09-27  760  	 *
> 0fd0e6b05aa096 Nicholas Piggin         2006-09-27  761  	 * [oops, our write_to data is lost]
> 0fd0e6b05aa096 Nicholas Piggin         2006-09-27  762  	 *
> 0fd0e6b05aa096 Nicholas Piggin         2006-09-27  763  	 * Reversing the order of the tests ensures such a situation cannot
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  764) 	 * escape unnoticed. The smp_rmb is needed to ensure the folio->flags
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  765) 	 * load is not satisfied before that of folio->_refcount.
> 0fd0e6b05aa096 Nicholas Piggin         2006-09-27  766  	 *
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  767) 	 * Note that if the dirty flag is always set via folio_mark_dirty,
> b93b016313b3ba Matthew Wilcox          2018-04-10  768  	 * and thus under the i_pages lock, then this ordering is not required.
> 49d2e9cc454436 Christoph Lameter       2006-01-08  769  	 */
> be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  770) 	refcount = 1 + folio_nr_pages(folio);
> be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  771) 	if (!folio_ref_freeze(folio, refcount))
> 49d2e9cc454436 Christoph Lameter       2006-01-08  772  		goto cannot_free;
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  773) 	/* note: atomic_cmpxchg in folio_ref_freeze provides the smp_rmb */
> be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  774) 	if (unlikely(folio_test_dirty(folio))) {
> be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  775) 		folio_ref_unfreeze(folio, refcount);
> 49d2e9cc454436 Christoph Lameter       2006-01-08  776  		goto cannot_free;
> e286781d5f2e9c Nicholas Piggin         2008-07-25  777  	}
> 49d2e9cc454436 Christoph Lameter       2006-01-08  778  
> be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  779) 	if (folio_test_swapcache(folio)) {
> 3d2c9087688777 David Hildenbrand       2023-08-21  780  		swp_entry_t swap = folio->swap;
> ac35a490237446 Yu Zhao                 2022-09-18  781  
> aae466b0052e18 Joonsoo Kim             2020-08-11  782  		if (reclaimed && !mapping_exiting(mapping))
> 8927f6473e56e3 Matthew Wilcox (Oracle  2021-12-23  783) 			shadow = workingset_eviction(folio, target_memcg);
> 8578e0c00dcf0c Kairui Song             2025-09-17 @784  		__swap_cache_del_folio(ci, folio, swap, shadow);

Seems a false positive to me, folio_test_swapcache is true here, and the folio is locked, so it must be true above too where ci is set.

I'll check if some cleanup can be done, maybe silent the bot.

> 89ce924f0bd447 Johannes Weiner         2025-01-24  785  		memcg1_swapout(folio, swap);
> 8578e0c00dcf0c Kairui Song             2025-09-17  786  		swap_cluster_unlock_irq(ci);
> 4081f7446d95a9 Matthew Wilcox (Oracle  2022-09-02  787) 		put_swap_folio(folio, swap);
> e286781d5f2e9c Nicholas Piggin         2008-07-25  788  	} else {
> d2329aa0c78f4a Matthew Wilcox (Oracle  2022-05-01  789) 		void (*free_folio)(struct folio *);
> 6072d13c429373 Linus Torvalds          2010-12-01  790  
> d2329aa0c78f4a Matthew Wilcox (Oracle  2022-05-01  791) 		free_folio = mapping->a_ops->free_folio;
> a528910e12ec7e Johannes Weiner         2014-04-03  792  		/*
> a528910e12ec7e Johannes Weiner         2014-04-03  793  		 * Remember a shadow entry for reclaimed file cache in
> a528910e12ec7e Johannes Weiner         2014-04-03  794  		 * order to detect refaults, thus thrashing, later on.
> a528910e12ec7e Johannes Weiner         2014-04-03  795  		 *
> a528910e12ec7e Johannes Weiner         2014-04-03  796  		 * But don't store shadows in an address space that is
> 238c30468f46b1 dylan-meiners           2020-08-06  797  		 * already exiting.  This is not just an optimization,
> a528910e12ec7e Johannes Weiner         2014-04-03  798  		 * inode reclaim needs to empty out the radix tree or
> a528910e12ec7e Johannes Weiner         2014-04-03  799  		 * the nodes are lost.  Don't plant shadows behind its
> a528910e12ec7e Johannes Weiner         2014-04-03  800  		 * back.
> f9fe48bece3af2 Ross Zwisler            2016-01-22  801  		 *
> f9fe48bece3af2 Ross Zwisler            2016-01-22  802  		 * We also don't store shadows for DAX mappings because the
> 49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  803) 		 * only page cache folios found in these are zero pages
> f9fe48bece3af2 Ross Zwisler            2016-01-22  804  		 * covering holes, and because we don't want to mix DAX
> f9fe48bece3af2 Ross Zwisler            2016-01-22  805  		 * exceptional entries and shadow exceptional entries in the
> b93b016313b3ba Matthew Wilcox          2018-04-10  806  		 * same address_space.
> a528910e12ec7e Johannes Weiner         2014-04-03  807  		 */
> be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  808) 		if (reclaimed && folio_is_file_lru(folio) &&
> f9fe48bece3af2 Ross Zwisler            2016-01-22  809  		    !mapping_exiting(mapping) && !dax_mapping(mapping))
> 8927f6473e56e3 Matthew Wilcox (Oracle  2021-12-23  810) 			shadow = workingset_eviction(folio, target_memcg);
> 8927f6473e56e3 Matthew Wilcox (Oracle  2021-12-23  811) 		__filemap_remove_folio(folio, shadow);
> 3047250972ff93 Johannes Weiner         2021-09-02  812  		xa_unlock_irq(&mapping->i_pages);
> 51b8c1fe250d1b Johannes Weiner         2021-11-08  813  		if (mapping_shrinkable(mapping))
> 51b8c1fe250d1b Johannes Weiner         2021-11-08  814  			inode_add_lru(mapping->host);
> 51b8c1fe250d1b Johannes Weiner         2021-11-08  815  		spin_unlock(&mapping->host->i_lock);
> 6072d13c429373 Linus Torvalds          2010-12-01  816  
> d2329aa0c78f4a Matthew Wilcox (Oracle  2022-05-01  817) 		if (free_folio)
> d2329aa0c78f4a Matthew Wilcox (Oracle  2022-05-01  818) 			free_folio(folio);
> e286781d5f2e9c Nicholas Piggin         2008-07-25  819  	}
> e286781d5f2e9c Nicholas Piggin         2008-07-25  820  
> 49d2e9cc454436 Christoph Lameter       2006-01-08  821  	return 1;
> 49d2e9cc454436 Christoph Lameter       2006-01-08  822  
> 49d2e9cc454436 Christoph Lameter       2006-01-08  823  cannot_free:
> 8578e0c00dcf0c Kairui Song             2025-09-17  824  	if (folio_test_swapcache(folio)) {
> 8578e0c00dcf0c Kairui Song             2025-09-17  825  		swap_cluster_unlock_irq(ci);
> 8578e0c00dcf0c Kairui Song             2025-09-17  826  	} else {
> 3047250972ff93 Johannes Weiner         2021-09-02  827  		xa_unlock_irq(&mapping->i_pages);
> 51b8c1fe250d1b Johannes Weiner         2021-11-08  828  		spin_unlock(&mapping->host->i_lock);
> 8578e0c00dcf0c Kairui Song             2025-09-17  829  	}
> 49d2e9cc454436 Christoph Lameter       2006-01-08  830  	return 0;
> 49d2e9cc454436 Christoph Lameter       2006-01-08  831  }
> 49d2e9cc454436 Christoph Lameter       2006-01-08  832  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
