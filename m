Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEED2942A
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jan 2025 03:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736478711; cv=none; b=d99OJX0NJVInWXK5QyMIK/D0cRWYJwIMnCgCk7yY2v8UhZ8uFzU6LaQTu0RaqwLEK52Cn0UHjKboNSHTZOMVYMnvaEUkc+uI+MLvJQOnUMZFRBD+QYfvnbofTbyA9jYdV6cKINXfpY1l7ws5cryX/AW8NMQBG5OVA/DKujkVq48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736478711; c=relaxed/simple;
	bh=wPeynofXyPo0waSNjjZTVdTZHxNQsOO3HOAw5zEBksk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RwsHJWfXbJ21gvcaP+gvL9bJ953f6IA8ZiKwkRpG6WJL+QTeiAb8Rg6SW7Q1s3wqk4OrowWCw3O/NwkAlSGbzh4rfbE/6PSvNji3TVS0ydexn8LTjV3fBhwTebm/k5TSrzD1vVufPP7xFP9eZmL5e1ImjMAeOLPh/rtw4/yzqmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mD8oaKLi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mD8oaKLi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736478709; x=1768014709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wPeynofXyPo0waSNjjZTVdTZHxNQsOO3HOAw5zEBksk=;
  b=mD8oaKLixDJOg/8Y92i5TeUHw6E3lHZJlZlbX9FXBH+nawD9+wBulRww
   79a28qDjgRu+8V0CjCziWri3Z7rpSNObJGoxQoB464PFPVgLkbT6Pfo2E
   YtEeeigHdpHGOgYyiJ7kLZSED7bRmHZoe3pVzDy2ugyNZ8qITICbrWHp9
   3mYW+1WTcnAzvnApWUGpdoGEzM5lJiXxCzv/izS+pguG+UdxeeJEgWDqn
   9o7NRf4FBqRsAtykD4l9rAuaQkBsl8RAUX33fa19qI2UDAvpiONJVFVUz
   l/7ZjAKBvvmCJt1tNmQD2A8rhxanouy15boppqvdxssByQFGa6m3d4sdq
   A==;
X-CSE-ConnectionGUID: 67qqDZPHRdOCRUxVeYk1Hw==
X-CSE-MsgGUID: x8tPUnADR/y3G3BtYz1lOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48178444"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="48178444"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 19:11:49 -0800
X-CSE-ConnectionGUID: 8MqPdgbWTD2vrZH810S/ww==
X-CSE-MsgGUID: l1SkUZrZSrmmAXlPITpIpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="104154867"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jan 2025 19:11:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW5R3-000IUF-26;
	Fri, 10 Jan 2025 03:11:45 +0000
Date: Fri, 10 Jan 2025 11:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 04/10] mm/huge_memory: add two new (not yet used)
 functions for folio_split()
Message-ID: <202501101040.JDYyKZsN-lkp@intel.com>
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
In-Reply-To: <20250106165513.104899-5-ziy@nvidia.com>
References: <20250106165513.104899-5-ziy@nvidia.com>
TO: Zi Yan <ziy@nvidia.com>
TO: linux-mm@kvack.org
TO: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Ryan Roberts <ryan.roberts@arm.com>
CC: Hugh Dickins <hughd@google.com>
CC: David Hildenbrand <david@redhat.com>
CC: Yang Shi <yang@os.amperecomputing.com>
CC: Miaohe Lin <linmiaohe@huawei.com>
CC: Kefeng Wang <wangkefeng.wang@huawei.com>
CC: Yu Zhao <yuzhao@google.com>
CC: John Hubbard <jhubbard@nvidia.com>
CC: linux-kernel@vger.kernel.org
CC: Zi Yan <ziy@nvidia.com>

Hi Zi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.13-rc6 next-20250109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/selftests-mm-use-selftests-framework-to-print-test-result/20250107-005943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250106165513.104899-5-ziy%40nvidia.com
patch subject: [PATCH v4 04/10] mm/huge_memory: add two new (not yet used) functions for folio_split()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-r072-20250109 (https://download.01.org/0day-ci/archive/20250110/202501101040.JDYyKZsN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501101040.JDYyKZsN-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:3686 __split_unmapped_folio() error: we previously assumed 'swap_cache' could be null (see line 3674)
mm/huge_memory.c:3688 __split_unmapped_folio() error: we previously assumed 'mapping' could be null (see line 3589)

vim +/swap_cache +3686 mm/huge_memory.c

a23448e5619ba7 Zi Yan 2025-01-06  3491  
a23448e5619ba7 Zi Yan 2025-01-06  3492  /*
a23448e5619ba7 Zi Yan 2025-01-06  3493   * It splits an unmapped @folio to lower order smaller folios in two ways.
a23448e5619ba7 Zi Yan 2025-01-06  3494   * @folio: the to-be-split folio
a23448e5619ba7 Zi Yan 2025-01-06  3495   * @new_order: the smallest order of the after split folios (since buddy
a23448e5619ba7 Zi Yan 2025-01-06  3496   *             allocator like split generates folios with orders from @folio's
a23448e5619ba7 Zi Yan 2025-01-06  3497   *             order - 1 to new_order).
a23448e5619ba7 Zi Yan 2025-01-06  3498   * @page: in buddy allocator like split, the folio containing @page will be
a23448e5619ba7 Zi Yan 2025-01-06  3499   *        split until its order becomes @new_order.
a23448e5619ba7 Zi Yan 2025-01-06  3500   * @list: the after split folios will be added to @list if it is not NULL,
a23448e5619ba7 Zi Yan 2025-01-06  3501   *        otherwise to LRU lists.
a23448e5619ba7 Zi Yan 2025-01-06  3502   * @end: the end of the file @folio maps to. -1 if @folio is anonymous memory.
a23448e5619ba7 Zi Yan 2025-01-06  3503   * @xas: xa_state pointing to folio->mapping->i_pages and locked by caller
a23448e5619ba7 Zi Yan 2025-01-06  3504   * @mapping: @folio->mapping
a23448e5619ba7 Zi Yan 2025-01-06  3505   * @uniform_split: if the split is uniform or not (buddy allocator like split)
a23448e5619ba7 Zi Yan 2025-01-06  3506   *
a23448e5619ba7 Zi Yan 2025-01-06  3507   *
a23448e5619ba7 Zi Yan 2025-01-06  3508   * 1. uniform split: the given @folio into multiple @new_order small folios,
a23448e5619ba7 Zi Yan 2025-01-06  3509   *    where all small folios have the same order. This is done when
a23448e5619ba7 Zi Yan 2025-01-06  3510   *    uniform_split is true.
a23448e5619ba7 Zi Yan 2025-01-06  3511   * 2. buddy allocator like split: the given @folio is split into half and one
a23448e5619ba7 Zi Yan 2025-01-06  3512   *    of the half (containing the given page) is split into half until the
a23448e5619ba7 Zi Yan 2025-01-06  3513   *    given @page's order becomes @new_order. This is done when uniform_split is
a23448e5619ba7 Zi Yan 2025-01-06  3514   *    false.
a23448e5619ba7 Zi Yan 2025-01-06  3515   *
a23448e5619ba7 Zi Yan 2025-01-06  3516   * The high level flow for these two methods are:
a23448e5619ba7 Zi Yan 2025-01-06  3517   * 1. uniform split: a single __split_folio_to_order() is called to split the
a23448e5619ba7 Zi Yan 2025-01-06  3518   *    @folio into @new_order, then we traverse all the resulting folios one by
a23448e5619ba7 Zi Yan 2025-01-06  3519   *    one in PFN ascending order and perform stats, unfreeze, adding to list,
a23448e5619ba7 Zi Yan 2025-01-06  3520   *    and file mapping index operations.
a23448e5619ba7 Zi Yan 2025-01-06  3521   * 2. buddy allocator like split: in general, folio_order - @new_order calls to
a23448e5619ba7 Zi Yan 2025-01-06  3522   *    __split_folio_to_order() are called in the for loop to split the @folio
a23448e5619ba7 Zi Yan 2025-01-06  3523   *    to one lower order at a time. The resulting small folios are processed
a23448e5619ba7 Zi Yan 2025-01-06  3524   *    like what is done during the traversal in 1, except the one containing
a23448e5619ba7 Zi Yan 2025-01-06  3525   *    @page, which is split in next for loop.
a23448e5619ba7 Zi Yan 2025-01-06  3526   *
a23448e5619ba7 Zi Yan 2025-01-06  3527   * After splitting, the caller's folio reference will be transferred to the
a23448e5619ba7 Zi Yan 2025-01-06  3528   * folio containing @page. The other folios may be freed if they are not mapped.
a23448e5619ba7 Zi Yan 2025-01-06  3529   *
a23448e5619ba7 Zi Yan 2025-01-06  3530   * In terms of locking, after splitting,
a23448e5619ba7 Zi Yan 2025-01-06  3531   * 1. uniform split leaves @page (or the folio contains it) locked;
a23448e5619ba7 Zi Yan 2025-01-06  3532   * 2. buddy allocator like split leaves @folio locked.
a23448e5619ba7 Zi Yan 2025-01-06  3533   *
a23448e5619ba7 Zi Yan 2025-01-06  3534   *
a23448e5619ba7 Zi Yan 2025-01-06  3535   * For !uniform_split, when -ENOMEM is returned, the original folio might be
a23448e5619ba7 Zi Yan 2025-01-06  3536   * split. The caller needs to check the input folio.
a23448e5619ba7 Zi Yan 2025-01-06  3537   */
a23448e5619ba7 Zi Yan 2025-01-06  3538  static int __split_unmapped_folio(struct folio *folio, int new_order,
a23448e5619ba7 Zi Yan 2025-01-06  3539  		struct page *page, struct list_head *list, pgoff_t end,
a23448e5619ba7 Zi Yan 2025-01-06  3540  		struct xa_state *xas, struct address_space *mapping,
a23448e5619ba7 Zi Yan 2025-01-06  3541  		bool uniform_split)
a23448e5619ba7 Zi Yan 2025-01-06  3542  {
a23448e5619ba7 Zi Yan 2025-01-06  3543  	struct lruvec *lruvec;
a23448e5619ba7 Zi Yan 2025-01-06  3544  	struct address_space *swap_cache = NULL;
a23448e5619ba7 Zi Yan 2025-01-06  3545  	struct folio *origin_folio = folio;
a23448e5619ba7 Zi Yan 2025-01-06  3546  	struct folio *next_folio = folio_next(folio);
a23448e5619ba7 Zi Yan 2025-01-06  3547  	struct folio *new_folio;
a23448e5619ba7 Zi Yan 2025-01-06  3548  	struct folio *next;
a23448e5619ba7 Zi Yan 2025-01-06  3549  	int order = folio_order(folio);
a23448e5619ba7 Zi Yan 2025-01-06  3550  	int split_order;
a23448e5619ba7 Zi Yan 2025-01-06  3551  	int start_order = uniform_split ? new_order : order - 1;
a23448e5619ba7 Zi Yan 2025-01-06  3552  	int nr_dropped = 0;
a23448e5619ba7 Zi Yan 2025-01-06  3553  	int ret = 0;
a23448e5619ba7 Zi Yan 2025-01-06  3554  	bool stop_split = false;
a23448e5619ba7 Zi Yan 2025-01-06  3555  
a23448e5619ba7 Zi Yan 2025-01-06  3556  	if (folio_test_anon(folio) && folio_test_swapcache(folio)) {
a23448e5619ba7 Zi Yan 2025-01-06  3557  		/* a swapcache folio can only be uniformly split to order-0 */
a23448e5619ba7 Zi Yan 2025-01-06  3558  		if (!uniform_split || new_order != 0)
a23448e5619ba7 Zi Yan 2025-01-06  3559  			return -EINVAL;
a23448e5619ba7 Zi Yan 2025-01-06  3560  
a23448e5619ba7 Zi Yan 2025-01-06  3561  		swap_cache = swap_address_space(folio->swap);
a23448e5619ba7 Zi Yan 2025-01-06  3562  		xa_lock(&swap_cache->i_pages);
a23448e5619ba7 Zi Yan 2025-01-06  3563  	}
a23448e5619ba7 Zi Yan 2025-01-06  3564  
a23448e5619ba7 Zi Yan 2025-01-06  3565  	if (folio_test_anon(folio))
a23448e5619ba7 Zi Yan 2025-01-06  3566  		mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
a23448e5619ba7 Zi Yan 2025-01-06  3567  
a23448e5619ba7 Zi Yan 2025-01-06  3568  	/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
a23448e5619ba7 Zi Yan 2025-01-06  3569  	lruvec = folio_lruvec_lock(folio);
a23448e5619ba7 Zi Yan 2025-01-06  3570  
a23448e5619ba7 Zi Yan 2025-01-06  3571  	/*
a23448e5619ba7 Zi Yan 2025-01-06  3572  	 * split to new_order one order at a time. For uniform split,
a23448e5619ba7 Zi Yan 2025-01-06  3573  	 * folio is split to new_order directly.
a23448e5619ba7 Zi Yan 2025-01-06  3574  	 */
a23448e5619ba7 Zi Yan 2025-01-06  3575  	for (split_order = start_order;
a23448e5619ba7 Zi Yan 2025-01-06  3576  	     split_order >= new_order && !stop_split;
a23448e5619ba7 Zi Yan 2025-01-06  3577  	     split_order--) {
a23448e5619ba7 Zi Yan 2025-01-06  3578  		int old_order = folio_order(folio);
a23448e5619ba7 Zi Yan 2025-01-06  3579  		struct folio *release;
a23448e5619ba7 Zi Yan 2025-01-06  3580  		struct folio *end_folio = folio_next(folio);
a23448e5619ba7 Zi Yan 2025-01-06  3581  		int status;
a23448e5619ba7 Zi Yan 2025-01-06  3582  
a23448e5619ba7 Zi Yan 2025-01-06  3583  		/* order-1 anonymous folio is not supported */
a23448e5619ba7 Zi Yan 2025-01-06  3584  		if (folio_test_anon(folio) && split_order == 1)
a23448e5619ba7 Zi Yan 2025-01-06  3585  			continue;
a23448e5619ba7 Zi Yan 2025-01-06  3586  		if (uniform_split && split_order != new_order)
a23448e5619ba7 Zi Yan 2025-01-06  3587  			continue;
a23448e5619ba7 Zi Yan 2025-01-06  3588  
a23448e5619ba7 Zi Yan 2025-01-06 @3589  		if (mapping) {
a23448e5619ba7 Zi Yan 2025-01-06  3590  			/*
a23448e5619ba7 Zi Yan 2025-01-06  3591  			 * uniform split has xas_split_alloc() called before
a23448e5619ba7 Zi Yan 2025-01-06  3592  			 * irq is disabled, since xas_nomem() might not be
a23448e5619ba7 Zi Yan 2025-01-06  3593  			 * able to allocate enough memory.
a23448e5619ba7 Zi Yan 2025-01-06  3594  			 */
a23448e5619ba7 Zi Yan 2025-01-06  3595  			if (uniform_split)
a23448e5619ba7 Zi Yan 2025-01-06  3596  				xas_split(xas, folio, old_order);
a23448e5619ba7 Zi Yan 2025-01-06  3597  			else {
a23448e5619ba7 Zi Yan 2025-01-06  3598  				xas_set_order(xas, folio->index, split_order);
a23448e5619ba7 Zi Yan 2025-01-06  3599  				xas_split_alloc(xas, folio, folio_order(folio),
a23448e5619ba7 Zi Yan 2025-01-06  3600  						GFP_NOWAIT);
a23448e5619ba7 Zi Yan 2025-01-06  3601  				if (xas_error(xas)) {
a23448e5619ba7 Zi Yan 2025-01-06  3602  					ret = xas_error(xas);
a23448e5619ba7 Zi Yan 2025-01-06  3603  					stop_split = true;
a23448e5619ba7 Zi Yan 2025-01-06  3604  					goto after_split;
a23448e5619ba7 Zi Yan 2025-01-06  3605  				}
a23448e5619ba7 Zi Yan 2025-01-06  3606  				xas_split(xas, folio, old_order);
a23448e5619ba7 Zi Yan 2025-01-06  3607  			}
a23448e5619ba7 Zi Yan 2025-01-06  3608  		}
a23448e5619ba7 Zi Yan 2025-01-06  3609  
a23448e5619ba7 Zi Yan 2025-01-06  3610  		/* complete memcg works before add pages to LRU */
a23448e5619ba7 Zi Yan 2025-01-06  3611  		split_page_memcg(&folio->page, old_order, split_order);
a23448e5619ba7 Zi Yan 2025-01-06  3612  		split_page_owner(&folio->page, old_order, split_order);
a23448e5619ba7 Zi Yan 2025-01-06  3613  		pgalloc_tag_split(folio, old_order, split_order);
a23448e5619ba7 Zi Yan 2025-01-06  3614  
a23448e5619ba7 Zi Yan 2025-01-06  3615  		status = __split_folio_to_order(folio, split_order);
a23448e5619ba7 Zi Yan 2025-01-06  3616  
a23448e5619ba7 Zi Yan 2025-01-06  3617  		if (status < 0) {
a23448e5619ba7 Zi Yan 2025-01-06  3618  			stop_split = true;
a23448e5619ba7 Zi Yan 2025-01-06  3619  			ret = -EINVAL;
a23448e5619ba7 Zi Yan 2025-01-06  3620  		}
a23448e5619ba7 Zi Yan 2025-01-06  3621  
a23448e5619ba7 Zi Yan 2025-01-06  3622  after_split:
a23448e5619ba7 Zi Yan 2025-01-06  3623  		/*
a23448e5619ba7 Zi Yan 2025-01-06  3624  		 * Iterate through after-split folios and perform related
a23448e5619ba7 Zi Yan 2025-01-06  3625  		 * operations. But in buddy allocator like split, the folio
a23448e5619ba7 Zi Yan 2025-01-06  3626  		 * containing the specified page is skipped until its order
a23448e5619ba7 Zi Yan 2025-01-06  3627  		 * is new_order, since the folio will be worked on in next
a23448e5619ba7 Zi Yan 2025-01-06  3628  		 * iteration.
a23448e5619ba7 Zi Yan 2025-01-06  3629  		 */
a23448e5619ba7 Zi Yan 2025-01-06  3630  		for (release = folio, next = folio_next(folio);
a23448e5619ba7 Zi Yan 2025-01-06  3631  		     release != end_folio;
a23448e5619ba7 Zi Yan 2025-01-06  3632  		     release = next, next = folio_next(next)) {
a23448e5619ba7 Zi Yan 2025-01-06  3633  			/*
a23448e5619ba7 Zi Yan 2025-01-06  3634  			 * for buddy allocator like split, the folio containing
a23448e5619ba7 Zi Yan 2025-01-06  3635  			 * page will be split next and should not be released,
a23448e5619ba7 Zi Yan 2025-01-06  3636  			 * until the folio's order is new_order or stop_split
a23448e5619ba7 Zi Yan 2025-01-06  3637  			 * is set to true by the above xas_split() failure.
a23448e5619ba7 Zi Yan 2025-01-06  3638  			 */
a23448e5619ba7 Zi Yan 2025-01-06  3639  			if (release == page_folio(page)) {
a23448e5619ba7 Zi Yan 2025-01-06  3640  				folio = release;
a23448e5619ba7 Zi Yan 2025-01-06  3641  				if (split_order != new_order && !stop_split)
a23448e5619ba7 Zi Yan 2025-01-06  3642  					continue;
a23448e5619ba7 Zi Yan 2025-01-06  3643  			}
a23448e5619ba7 Zi Yan 2025-01-06  3644  			if (folio_test_anon(release)) {
a23448e5619ba7 Zi Yan 2025-01-06  3645  				mod_mthp_stat(folio_order(release),
a23448e5619ba7 Zi Yan 2025-01-06  3646  						MTHP_STAT_NR_ANON, 1);
a23448e5619ba7 Zi Yan 2025-01-06  3647  			}
a23448e5619ba7 Zi Yan 2025-01-06  3648  
a23448e5619ba7 Zi Yan 2025-01-06  3649  			/*
a23448e5619ba7 Zi Yan 2025-01-06  3650  			 * Unfreeze refcount first. Additional reference from
a23448e5619ba7 Zi Yan 2025-01-06  3651  			 * page cache.
a23448e5619ba7 Zi Yan 2025-01-06  3652  			 */
a23448e5619ba7 Zi Yan 2025-01-06  3653  			folio_ref_unfreeze(release,
a23448e5619ba7 Zi Yan 2025-01-06  3654  				1 + ((!folio_test_anon(origin_folio) ||
a23448e5619ba7 Zi Yan 2025-01-06  3655  				     folio_test_swapcache(origin_folio)) ?
a23448e5619ba7 Zi Yan 2025-01-06  3656  					     folio_nr_pages(release) : 0));
a23448e5619ba7 Zi Yan 2025-01-06  3657  
a23448e5619ba7 Zi Yan 2025-01-06  3658  			if (release != origin_folio)
a23448e5619ba7 Zi Yan 2025-01-06  3659  				lru_add_page_tail(origin_folio, &release->page,
a23448e5619ba7 Zi Yan 2025-01-06  3660  						lruvec, list);
a23448e5619ba7 Zi Yan 2025-01-06  3661  
a23448e5619ba7 Zi Yan 2025-01-06  3662  			/* Some pages can be beyond EOF: drop them from page cache */
a23448e5619ba7 Zi Yan 2025-01-06  3663  			if (release->index >= end) {
a23448e5619ba7 Zi Yan 2025-01-06  3664  				if (shmem_mapping(origin_folio->mapping))
a23448e5619ba7 Zi Yan 2025-01-06  3665  					nr_dropped += folio_nr_pages(release);
a23448e5619ba7 Zi Yan 2025-01-06  3666  				else if (folio_test_clear_dirty(release))
a23448e5619ba7 Zi Yan 2025-01-06  3667  					folio_account_cleaned(release,
a23448e5619ba7 Zi Yan 2025-01-06  3668  						inode_to_wb(origin_folio->mapping->host));
a23448e5619ba7 Zi Yan 2025-01-06  3669  				__filemap_remove_folio(release, NULL);
a23448e5619ba7 Zi Yan 2025-01-06  3670  				folio_put(release);
a23448e5619ba7 Zi Yan 2025-01-06  3671  			} else if (!folio_test_anon(release)) {
a23448e5619ba7 Zi Yan 2025-01-06  3672  				__xa_store(&origin_folio->mapping->i_pages,
a23448e5619ba7 Zi Yan 2025-01-06  3673  						release->index, &release->page, 0);
a23448e5619ba7 Zi Yan 2025-01-06 @3674  			} else if (swap_cache) {
a23448e5619ba7 Zi Yan 2025-01-06  3675  				__xa_store(&swap_cache->i_pages,
a23448e5619ba7 Zi Yan 2025-01-06  3676  						swap_cache_index(release->swap),
a23448e5619ba7 Zi Yan 2025-01-06  3677  						&release->page, 0);
a23448e5619ba7 Zi Yan 2025-01-06  3678  			}
a23448e5619ba7 Zi Yan 2025-01-06  3679  		}
a23448e5619ba7 Zi Yan 2025-01-06  3680  	}
a23448e5619ba7 Zi Yan 2025-01-06  3681  
a23448e5619ba7 Zi Yan 2025-01-06  3682  	unlock_page_lruvec(lruvec);
a23448e5619ba7 Zi Yan 2025-01-06  3683  
a23448e5619ba7 Zi Yan 2025-01-06  3684  	if (folio_test_anon(origin_folio)) {
a23448e5619ba7 Zi Yan 2025-01-06  3685  		if (folio_test_swapcache(origin_folio))
a23448e5619ba7 Zi Yan 2025-01-06 @3686  			xa_unlock(&swap_cache->i_pages);
a23448e5619ba7 Zi Yan 2025-01-06  3687  	} else
a23448e5619ba7 Zi Yan 2025-01-06 @3688  		xa_unlock(&mapping->i_pages);
a23448e5619ba7 Zi Yan 2025-01-06  3689  
a23448e5619ba7 Zi Yan 2025-01-06  3690  	/* Caller disabled irqs, so they are still disabled here */
a23448e5619ba7 Zi Yan 2025-01-06  3691  	local_irq_enable();
a23448e5619ba7 Zi Yan 2025-01-06  3692  
a23448e5619ba7 Zi Yan 2025-01-06  3693  	if (nr_dropped)
a23448e5619ba7 Zi Yan 2025-01-06  3694  		shmem_uncharge(mapping->host, nr_dropped);
a23448e5619ba7 Zi Yan 2025-01-06  3695  
a23448e5619ba7 Zi Yan 2025-01-06  3696  	remap_page(origin_folio, 1 << order,
a23448e5619ba7 Zi Yan 2025-01-06  3697  			folio_test_anon(origin_folio) ?
a23448e5619ba7 Zi Yan 2025-01-06  3698  				RMP_USE_SHARED_ZEROPAGE : 0);
a23448e5619ba7 Zi Yan 2025-01-06  3699  
a23448e5619ba7 Zi Yan 2025-01-06  3700  	/*
a23448e5619ba7 Zi Yan 2025-01-06  3701  	 * At this point, folio should contain the specified page.
a23448e5619ba7 Zi Yan 2025-01-06  3702  	 * For uniform split, it is left for caller to unlock.
a23448e5619ba7 Zi Yan 2025-01-06  3703  	 * For buddy allocator like split, the first after-split folio is left
a23448e5619ba7 Zi Yan 2025-01-06  3704  	 * for caller to unlock.
a23448e5619ba7 Zi Yan 2025-01-06  3705  	 */
a23448e5619ba7 Zi Yan 2025-01-06  3706  	for (new_folio = origin_folio, next = folio_next(origin_folio);
a23448e5619ba7 Zi Yan 2025-01-06  3707  	     new_folio != next_folio;
a23448e5619ba7 Zi Yan 2025-01-06  3708  	     new_folio = next, next = folio_next(next)) {
a23448e5619ba7 Zi Yan 2025-01-06  3709  		if (uniform_split && new_folio == folio)
a23448e5619ba7 Zi Yan 2025-01-06  3710  			continue;
a23448e5619ba7 Zi Yan 2025-01-06  3711  		if (!uniform_split && new_folio == origin_folio)
a23448e5619ba7 Zi Yan 2025-01-06  3712  			continue;
a23448e5619ba7 Zi Yan 2025-01-06  3713  
a23448e5619ba7 Zi Yan 2025-01-06  3714  		folio_unlock(new_folio);
a23448e5619ba7 Zi Yan 2025-01-06  3715  		/*
a23448e5619ba7 Zi Yan 2025-01-06  3716  		 * Subpages may be freed if there wasn't any mapping
a23448e5619ba7 Zi Yan 2025-01-06  3717  		 * like if add_to_swap() is running on a lru page that
a23448e5619ba7 Zi Yan 2025-01-06  3718  		 * had its mapping zapped. And freeing these pages
a23448e5619ba7 Zi Yan 2025-01-06  3719  		 * requires taking the lru_lock so we do the put_page
a23448e5619ba7 Zi Yan 2025-01-06  3720  		 * of the tail pages after the split is complete.
a23448e5619ba7 Zi Yan 2025-01-06  3721  		 */
a23448e5619ba7 Zi Yan 2025-01-06  3722  		free_page_and_swap_cache(&new_folio->page);
a23448e5619ba7 Zi Yan 2025-01-06  3723  	}
a23448e5619ba7 Zi Yan 2025-01-06  3724  	return ret;
a23448e5619ba7 Zi Yan 2025-01-06  3725  }
a23448e5619ba7 Zi Yan 2025-01-06  3726  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
