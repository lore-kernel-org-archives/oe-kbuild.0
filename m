Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01255254855
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 22:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757801874; cv=none; b=NNAW23jiMmosbYh0ebeJECM2zGaht8ESDCQV+WwXNEuN6G/znboJouw5EVpuMb1wmg2QM9bbbjod418A3KcKTGDVhgOr2AWTJlGKp4ASCQ8KB7zjJ8nkdfD5SD83W2m3iQFES/164Oy46QHVXa6HYjzSUcAK0UuIvm/iVhkIIL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757801874; c=relaxed/simple;
	bh=rqWam2YHFiuiTlAcPeMTFtK4JoZqXGYpZ8gbcz7Ajcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HMPszwUZ+4wdw/JkHQGUTOYOH/pZDeHXYn/DXBPZn4uD8v/gYaHLhlWg3mtY6b57klDiuzHwIM3RndeWccK8miIvokATnFfjIdJrlT9wtyZYEtndRWxwxUM6wO3KqeWN0Ld0SOE1VwktcQhw2EH1VpeGYwZFwAj7Vb9/MgJJil0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oK3VFKc/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oK3VFKc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757801873; x=1789337873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rqWam2YHFiuiTlAcPeMTFtK4JoZqXGYpZ8gbcz7Ajcs=;
  b=oK3VFKc/cGy1yno72nfSKANxVw93Iu2QcEKJBHuqOiKDv8GwZRJXeWEw
   CXLTwzSBJ42umAVFxvURKy5+0igaCrVbXhxcN30Pv21tKFye1zE0/Mpcu
   JURym6HJxUJLbqEp/fdiMH7ymMHXMVeCl2aLchxaAnvEwwJiCdIdRpO8J
   +tgkYCH7M3BTMJbdDffknwVD4baeXQKajzVvrHVPkXcf9gHJNhl+w1llB
   npKv71Pn376OzQzE41egAryPBjW7dfvK063VzsPJ+sdbgUv5m2ZoYT9qb
   C71E7J8T21dtGZmnnyD2omtmeRSlsmKkdgqd2AaxwcCZzAFCH4de7keL7
   A==;
X-CSE-ConnectionGUID: ssXQuqoUSUmsfb9ZXW3yOg==
X-CSE-MsgGUID: MytT1poAQlWNsbBLKiM7IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="71208074"
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="71208074"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 15:17:53 -0700
X-CSE-ConnectionGUID: IVYHTQ6AT3O5+2tbIR89cg==
X-CSE-MsgGUID: h0Z6VejKS1qdNPEQt9kFJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="173820776"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 13 Sep 2025 15:17:51 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxYZ2-0001u8-1y;
	Sat, 13 Sep 2025 22:17:48 +0000
Date: Sun, 14 Sep 2025 06:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7605/8263] mm/vmscan.c:784 __remove_mapping()
 error: uninitialized symbol 'ci'.
Message-ID: <202509140627.P9M0sfhq-lkp@intel.com>
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
TO: Kairui Song <kasong@tencent.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Chris Li <chrisl@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
commit: c2079bb89a0c782632a748dec99db66f5226b178 [7605/8263] mm, swap: use the swap table for the swap cache and switch API
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: m68k-randconfig-r072-20250914 (https://download.01.org/0day-ci/archive/20250914/202509140627.P9M0sfhq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509140627.P9M0sfhq-lkp@intel.com/

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
c2079bb89a0c78 Kairui Song             2025-09-06  733  	struct swap_cluster_info *ci;
c4843a7593a9df Greg Thelen             2015-05-22  734  
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  735) 	BUG_ON(!folio_test_locked(folio));
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  736) 	BUG_ON(mapping != folio_mapping(folio));
49d2e9cc454436 Christoph Lameter       2006-01-08  737  
c2079bb89a0c78 Kairui Song             2025-09-06  738  	if (folio_test_swapcache(folio)) {
c2079bb89a0c78 Kairui Song             2025-09-06  739  		ci = swap_cluster_lock_by_folio_irq(folio);
c2079bb89a0c78 Kairui Song             2025-09-06  740  	} else {
51b8c1fe250d1b Johannes Weiner         2021-11-08  741  		spin_lock(&mapping->host->i_lock);
3047250972ff93 Johannes Weiner         2021-09-02  742  		xa_lock_irq(&mapping->i_pages);
c2079bb89a0c78 Kairui Song             2025-09-06  743  	}
c2079bb89a0c78 Kairui Song             2025-09-06  744  
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
c2079bb89a0c78 Kairui Song             2025-09-06 @784  		__swap_cache_del_folio(ci, folio, swap, shadow);
89ce924f0bd447 Johannes Weiner         2025-01-24  785  		memcg1_swapout(folio, swap);
c2079bb89a0c78 Kairui Song             2025-09-06  786  		swap_cluster_unlock_irq(ci);
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
c2079bb89a0c78 Kairui Song             2025-09-06  824  	if (folio_test_swapcache(folio)) {
c2079bb89a0c78 Kairui Song             2025-09-06  825  		swap_cluster_unlock_irq(ci);
c2079bb89a0c78 Kairui Song             2025-09-06  826  	} else {
3047250972ff93 Johannes Weiner         2021-09-02  827  		xa_unlock_irq(&mapping->i_pages);
51b8c1fe250d1b Johannes Weiner         2021-11-08  828  		spin_unlock(&mapping->host->i_lock);
c2079bb89a0c78 Kairui Song             2025-09-06  829  	}
49d2e9cc454436 Christoph Lameter       2006-01-08  830  	return 0;
49d2e9cc454436 Christoph Lameter       2006-01-08  831  }
49d2e9cc454436 Christoph Lameter       2006-01-08  832  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
