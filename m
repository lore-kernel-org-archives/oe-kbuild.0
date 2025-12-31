Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8F31A9FAA
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 20:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767211339; cv=none; b=aASx7Y3b9n4mtrRL9bmXKU2RECkhC4X2PSqX9OAm/g5DOAqgwTgZkoYyh7VTqgexHBheWDNg4RksCFX1src4uis77uGJHdh6OYTgWH+iIwMASO8o1bva6sPHVnPnnQuc+Skf+321tAzlborEVmzqlrB3yWytoSJEejid+6Weo6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767211339; c=relaxed/simple;
	bh=A4I1KQn9LL76JnkT2To6GZvzSQJI++TkgX0Um74R/Qg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A6SAhPPKozYSucC7Lb2x3TBcmOsdXbIpzbRgCeFmCL5CooMXb9uyeUia7sFoID1CggORR8nziX2TnmKvGN/GTY6wr93tvU+sAQ7QdkXmM1ADpHCqw+iCD3D7NR4lxruA9ta9u4Cro7IJVq+q/nKFhiBCMg9vvrYjd0+3BFRjxnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPiiXSiJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPiiXSiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767211338; x=1798747338;
  h=date:from:to:cc:subject:message-id;
  bh=A4I1KQn9LL76JnkT2To6GZvzSQJI++TkgX0Um74R/Qg=;
  b=lPiiXSiJyaC4yO2EU2MhUzFay4YjS5cMYPfjoo5R7fG3ldi4v3hOPyi+
   u7I/NS37Q1+yK6hKTELjuUctJdBdHTYoekR7p71vWuz2/AlCLGXQ/LZ1w
   AC/d5hnrs0l1KKnhGVqU3oxCLA/fE/a7yEsm2iAqpWl4wPg7fo6QmfWal
   1BnaXRiDv2/dA1aC0fxHX4PMSxWDKXALR0qUtLwKUIoc+1g6CD3IJlHOp
   bKiZnuJvacgEbH9TYNCNElRk5yGVk8BazwjUsslItRY6b+LD5fvHJzdOe
   RBtU7ZAYcrFgSv/k45BKFlZGzUP++xQSUaHOCVokvswa6u6SytgcUdlL+
   Q==;
X-CSE-ConnectionGUID: FgPJyXStSqi5ouEYC+0Udw==
X-CSE-MsgGUID: Iz8taUrJSC+bMx0AR3uGIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="80150832"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="80150832"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 12:02:15 -0800
X-CSE-ConnectionGUID: MGLBtHJ0TKaLOI3ImgZHEA==
X-CSE-MsgGUID: LnJZzZVHR168sRZiqLQGdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="202456889"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Dec 2025 12:02:14 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb2OZ-000000001SC-2ppe;
	Wed, 31 Dec 2025 20:02:11 +0000
Date: Thu, 01 Jan 2026 04:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/vmscan.c:784 __remove_mapping() error: uninitialized
 symbol 'ci'.
Message-ID: <202601010353.E7g5cCo8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kairui Song <kasong@tencent.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Chris Li <chrisl@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c8ebd433459bcbf068682b09544e830acd7ed222
commit: 8578e0c00dcf0c58fbc32d4904ecaf8e802a6590 mm, swap: use the swap table for the swap cache and switch API
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: m68k-randconfig-r073-20251231 (https://download.01.org/0day-ci/archive/20260101/202601010353.E7g5cCo8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601010353.E7g5cCo8-lkp@intel.com/

smatch warnings:
mm/vmscan.c:784 __remove_mapping() error: uninitialized symbol 'ci'.

vim +/ci +784 mm/vmscan.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  723  
a649fd9271773d Andrew Morton           2006-10-17  724  /*
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  725)  * Same as remove_mapping, but if the folio is removed from the mapping, it
e286781d5f2e9c Nicholas Piggin         2008-07-25  726   * gets returned with a refcount of 0.
a649fd9271773d Andrew Morton           2006-10-17  727   */
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  728) static int __remove_mapping(struct address_space *mapping, struct folio *folio,
b910718a948a91 Johannes Weiner         2019-11-30  729  			    bool reclaimed, struct mem_cgroup *target_memcg)
49d2e9cc454436 Christoph Lameter       2006-01-08  730  {
bd4c82c22c367e Ying Huang              2017-09-06  731  	int refcount;
aae466b0052e18 Joonsoo Kim             2020-08-11  732  	void *shadow = NULL;
8578e0c00dcf0c Kairui Song             2025-09-17  733  	struct swap_cluster_info *ci;
c4843a7593a9df Greg Thelen             2015-05-22  734  
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  735) 	BUG_ON(!folio_test_locked(folio));
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  736) 	BUG_ON(mapping != folio_mapping(folio));
49d2e9cc454436 Christoph Lameter       2006-01-08  737  
8578e0c00dcf0c Kairui Song             2025-09-17  738  	if (folio_test_swapcache(folio)) {
8578e0c00dcf0c Kairui Song             2025-09-17  739  		ci = swap_cluster_get_and_lock_irq(folio);
8578e0c00dcf0c Kairui Song             2025-09-17  740  	} else {
51b8c1fe250d1b Johannes Weiner         2021-11-08  741  		spin_lock(&mapping->host->i_lock);
3047250972ff93 Johannes Weiner         2021-09-02  742  		xa_lock_irq(&mapping->i_pages);
8578e0c00dcf0c Kairui Song             2025-09-17  743  	}
8578e0c00dcf0c Kairui Song             2025-09-17  744  
49d2e9cc454436 Christoph Lameter       2006-01-08  745  	/*
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  746) 	 * The non racy check for a busy folio.
0fd0e6b05aa096 Nicholas Piggin         2006-09-27  747  	 *
0fd0e6b05aa096 Nicholas Piggin         2006-09-27  748  	 * Must be careful with the order of the tests. When someone has
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  749) 	 * a ref to the folio, it may be possible that they dirty it then
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  750) 	 * drop the reference. So if the dirty flag is tested before the
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  751) 	 * refcount here, then the following race may occur:
0fd0e6b05aa096 Nicholas Piggin         2006-09-27  752  	 *
0fd0e6b05aa096 Nicholas Piggin         2006-09-27  753  	 * get_user_pages(&page);
0fd0e6b05aa096 Nicholas Piggin         2006-09-27  754  	 * [user mapping goes away]
0fd0e6b05aa096 Nicholas Piggin         2006-09-27  755  	 * write_to(page);
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  756) 	 *				!folio_test_dirty(folio)    [good]
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  757) 	 * folio_set_dirty(folio);
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  758) 	 * folio_put(folio);
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  759) 	 *				!refcount(folio)   [good, discard it]
0fd0e6b05aa096 Nicholas Piggin         2006-09-27  760  	 *
0fd0e6b05aa096 Nicholas Piggin         2006-09-27  761  	 * [oops, our write_to data is lost]
0fd0e6b05aa096 Nicholas Piggin         2006-09-27  762  	 *
0fd0e6b05aa096 Nicholas Piggin         2006-09-27  763  	 * Reversing the order of the tests ensures such a situation cannot
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  764) 	 * escape unnoticed. The smp_rmb is needed to ensure the folio->flags
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  765) 	 * load is not satisfied before that of folio->_refcount.
0fd0e6b05aa096 Nicholas Piggin         2006-09-27  766  	 *
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  767) 	 * Note that if the dirty flag is always set via folio_mark_dirty,
b93b016313b3ba Matthew Wilcox          2018-04-10  768  	 * and thus under the i_pages lock, then this ordering is not required.
49d2e9cc454436 Christoph Lameter       2006-01-08  769  	 */
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  770) 	refcount = 1 + folio_nr_pages(folio);
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  771) 	if (!folio_ref_freeze(folio, refcount))
49d2e9cc454436 Christoph Lameter       2006-01-08  772  		goto cannot_free;
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  773) 	/* note: atomic_cmpxchg in folio_ref_freeze provides the smp_rmb */
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  774) 	if (unlikely(folio_test_dirty(folio))) {
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  775) 		folio_ref_unfreeze(folio, refcount);
49d2e9cc454436 Christoph Lameter       2006-01-08  776  		goto cannot_free;
e286781d5f2e9c Nicholas Piggin         2008-07-25  777  	}
49d2e9cc454436 Christoph Lameter       2006-01-08  778  
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  779) 	if (folio_test_swapcache(folio)) {
3d2c9087688777 David Hildenbrand       2023-08-21  780  		swp_entry_t swap = folio->swap;
ac35a490237446 Yu Zhao                 2022-09-18  781  
aae466b0052e18 Joonsoo Kim             2020-08-11  782  		if (reclaimed && !mapping_exiting(mapping))
8927f6473e56e3 Matthew Wilcox (Oracle  2021-12-23  783) 			shadow = workingset_eviction(folio, target_memcg);
8578e0c00dcf0c Kairui Song             2025-09-17 @784  		__swap_cache_del_folio(ci, folio, swap, shadow);
89ce924f0bd447 Johannes Weiner         2025-01-24  785  		memcg1_swapout(folio, swap);
8578e0c00dcf0c Kairui Song             2025-09-17  786  		swap_cluster_unlock_irq(ci);
4081f7446d95a9 Matthew Wilcox (Oracle  2022-09-02  787) 		put_swap_folio(folio, swap);
e286781d5f2e9c Nicholas Piggin         2008-07-25  788  	} else {
d2329aa0c78f4a Matthew Wilcox (Oracle  2022-05-01  789) 		void (*free_folio)(struct folio *);
6072d13c429373 Linus Torvalds          2010-12-01  790  
d2329aa0c78f4a Matthew Wilcox (Oracle  2022-05-01  791) 		free_folio = mapping->a_ops->free_folio;
a528910e12ec7e Johannes Weiner         2014-04-03  792  		/*
a528910e12ec7e Johannes Weiner         2014-04-03  793  		 * Remember a shadow entry for reclaimed file cache in
a528910e12ec7e Johannes Weiner         2014-04-03  794  		 * order to detect refaults, thus thrashing, later on.
a528910e12ec7e Johannes Weiner         2014-04-03  795  		 *
a528910e12ec7e Johannes Weiner         2014-04-03  796  		 * But don't store shadows in an address space that is
238c30468f46b1 dylan-meiners           2020-08-06  797  		 * already exiting.  This is not just an optimization,
a528910e12ec7e Johannes Weiner         2014-04-03  798  		 * inode reclaim needs to empty out the radix tree or
a528910e12ec7e Johannes Weiner         2014-04-03  799  		 * the nodes are lost.  Don't plant shadows behind its
a528910e12ec7e Johannes Weiner         2014-04-03  800  		 * back.
f9fe48bece3af2 Ross Zwisler            2016-01-22  801  		 *
f9fe48bece3af2 Ross Zwisler            2016-01-22  802  		 * We also don't store shadows for DAX mappings because the
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  803) 		 * only page cache folios found in these are zero pages
f9fe48bece3af2 Ross Zwisler            2016-01-22  804  		 * covering holes, and because we don't want to mix DAX
f9fe48bece3af2 Ross Zwisler            2016-01-22  805  		 * exceptional entries and shadow exceptional entries in the
b93b016313b3ba Matthew Wilcox          2018-04-10  806  		 * same address_space.
a528910e12ec7e Johannes Weiner         2014-04-03  807  		 */
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  808) 		if (reclaimed && folio_is_file_lru(folio) &&
f9fe48bece3af2 Ross Zwisler            2016-01-22  809  		    !mapping_exiting(mapping) && !dax_mapping(mapping))
8927f6473e56e3 Matthew Wilcox (Oracle  2021-12-23  810) 			shadow = workingset_eviction(folio, target_memcg);
8927f6473e56e3 Matthew Wilcox (Oracle  2021-12-23  811) 		__filemap_remove_folio(folio, shadow);
3047250972ff93 Johannes Weiner         2021-09-02  812  		xa_unlock_irq(&mapping->i_pages);
51b8c1fe250d1b Johannes Weiner         2021-11-08  813  		if (mapping_shrinkable(mapping))
51b8c1fe250d1b Johannes Weiner         2021-11-08  814  			inode_add_lru(mapping->host);
51b8c1fe250d1b Johannes Weiner         2021-11-08  815  		spin_unlock(&mapping->host->i_lock);
6072d13c429373 Linus Torvalds          2010-12-01  816  
d2329aa0c78f4a Matthew Wilcox (Oracle  2022-05-01  817) 		if (free_folio)
d2329aa0c78f4a Matthew Wilcox (Oracle  2022-05-01  818) 			free_folio(folio);
e286781d5f2e9c Nicholas Piggin         2008-07-25  819  	}
e286781d5f2e9c Nicholas Piggin         2008-07-25  820  
49d2e9cc454436 Christoph Lameter       2006-01-08  821  	return 1;
49d2e9cc454436 Christoph Lameter       2006-01-08  822  
49d2e9cc454436 Christoph Lameter       2006-01-08  823  cannot_free:
8578e0c00dcf0c Kairui Song             2025-09-17  824  	if (folio_test_swapcache(folio)) {
8578e0c00dcf0c Kairui Song             2025-09-17  825  		swap_cluster_unlock_irq(ci);
8578e0c00dcf0c Kairui Song             2025-09-17  826  	} else {
3047250972ff93 Johannes Weiner         2021-09-02  827  		xa_unlock_irq(&mapping->i_pages);
51b8c1fe250d1b Johannes Weiner         2021-11-08  828  		spin_unlock(&mapping->host->i_lock);
8578e0c00dcf0c Kairui Song             2025-09-17  829  	}
49d2e9cc454436 Christoph Lameter       2006-01-08  830  	return 0;
49d2e9cc454436 Christoph Lameter       2006-01-08  831  }
49d2e9cc454436 Christoph Lameter       2006-01-08  832  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
