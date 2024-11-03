Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03DC2FB
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Nov 2024 02:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730601553; cv=none; b=KWHjActIH8a+UuC4hmD7g0hSMk3yeDerBbsB7e9ZFfSxB9Tq/d53eUermWnSTTZbrgYB7QJKx+MtVPKRdYR9V90ZCwzPYW8EV33eNikvUbijPH1jSU3aQCvutKKfDK+NhHWyNQRnf4oqujorDSsfTT0NRrwbMMiUOa338tcgmR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730601553; c=relaxed/simple;
	bh=VF/9SK8HmDPVp5LAF8RIxUB01Ivo3H5/9gHwGD27ysQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uibX2o9p6B9Oh1QR1PFdULkB7Mv4PwnMOjm/iaOpLwyu4mteOSD9k3X3ZoiIDeUrL95V0T9MaSETP8BMuH1a1uX6PWMoy1OxG9E58RpdPkvfQ0NVc3tS2VEVxFS/8L7y3Tc/ulHF5WtgFqpYR2XB3BH2Q/HOAsEl6BIBN6wv4K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A09ns1V/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A09ns1V/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730601550; x=1762137550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VF/9SK8HmDPVp5LAF8RIxUB01Ivo3H5/9gHwGD27ysQ=;
  b=A09ns1V/oZ+aDgg1RnGVSRlTBtSThnqRv20f0eTHQ3urbp0XK5xTx5Zr
   O6joGcWvgZXTxe7X96RoPyd5ZwK4hXB1WX87csTEtFObSuuMdlMA+0mkG
   dR26EWKOxfa4z7LFe6DWXSvAAB1AsjALyU7GpnAtFTuw+LFglAvwnHNKl
   Xi/d86A7sl1pU70COd2s7/C2ICwt+EoNH1IX68JGFAiwTSdAtsXVswfwz
   p8NJF4dDSAiwsBi+HGetxD7i1fnAPNNr5qcE1JrxCEWfp/Uk98/vJ3G7D
   kLGEDEeT/m/W1Mk9bIAhe7qgidESRCKkMWox04BPhKGEyXy4yAFFX3Nmn
   Q==;
X-CSE-ConnectionGUID: bNSZPwExT4Co+dsa0hON8Q==
X-CSE-MsgGUID: lc8kKQzxQNi8YfXmVZCAAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="55723200"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="55723200"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 19:39:09 -0700
X-CSE-ConnectionGUID: nHWrhLnuSviMyHQ5ZVPn2A==
X-CSE-MsgGUID: HjoAWYOCQ6+Ozao8+65/Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="83423188"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Nov 2024 19:39:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7QWA-000jbd-17;
	Sun, 03 Nov 2024 02:39:06 +0000
Date: Sun, 3 Nov 2024 10:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/6] mm/huge_memory: add two new (yet used) functions
 for folio_split()
Message-ID: <202411031007.BB8Mwi65-lkp@intel.com>
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
In-Reply-To: <20241101150357.1752726-2-ziy@nvidia.com>
References: <20241101150357.1752726-2-ziy@nvidia.com>
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
[also build test WARNING on linus/master v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-huge_memory-add-two-new-yet-used-functions-for-folio_split/20241101-230623
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241101150357.1752726-2-ziy%40nvidia.com
patch subject: [PATCH v2 1/6] mm/huge_memory: add two new (yet used) functions for folio_split()
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: x86_64-randconfig-161-20241103 (https://download.01.org/0day-ci/archive/20241103/202411031007.BB8Mwi65-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411031007.BB8Mwi65-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:3671 __folio_split_without_mapping() error: we previously assumed 'swap_cache' could be null (see line 3658)
mm/huge_memory.c:3673 __folio_split_without_mapping() error: we previously assumed 'mapping' could be null (see line 3585)

vim +/swap_cache +3671 mm/huge_memory.c

faebec76111eb2 Zi Yan 2024-11-01  3499  
faebec76111eb2 Zi Yan 2024-11-01  3500  #define for_each_folio_until_end_safe(iter, iter2, start, end)	\
faebec76111eb2 Zi Yan 2024-11-01  3501  	for (iter = start, iter2 = folio_next(start);		\
faebec76111eb2 Zi Yan 2024-11-01  3502  	     iter != end;					\
faebec76111eb2 Zi Yan 2024-11-01  3503  	     iter = iter2, iter2 = folio_next(iter2))
faebec76111eb2 Zi Yan 2024-11-01  3504  
faebec76111eb2 Zi Yan 2024-11-01  3505  /*
faebec76111eb2 Zi Yan 2024-11-01  3506   * It splits a @folio (without mapping) to lower order smaller folios in two
faebec76111eb2 Zi Yan 2024-11-01  3507   * ways.
faebec76111eb2 Zi Yan 2024-11-01  3508   * 1. uniform split: the given @folio into multiple @new_order small folios,
faebec76111eb2 Zi Yan 2024-11-01  3509   *    where all small folios have the same order. This is done when
faebec76111eb2 Zi Yan 2024-11-01  3510   *    uniform_split is true.
faebec76111eb2 Zi Yan 2024-11-01  3511   * 2. buddy allocator like split: the given @folio is split into half and one
faebec76111eb2 Zi Yan 2024-11-01  3512   *    of the half (containing the given page) is split into half until the
faebec76111eb2 Zi Yan 2024-11-01  3513   *    given @page's order becomes @new_order. This is done when uniform_split is
faebec76111eb2 Zi Yan 2024-11-01  3514   *    false.
faebec76111eb2 Zi Yan 2024-11-01  3515   *
faebec76111eb2 Zi Yan 2024-11-01  3516   * The high level flow for these two methods are:
faebec76111eb2 Zi Yan 2024-11-01  3517   * 1. uniform split: a single __split_folio_to_order() is called to split the
faebec76111eb2 Zi Yan 2024-11-01  3518   *    @folio into @new_order, then we traverse all the resulting folios one by
faebec76111eb2 Zi Yan 2024-11-01  3519   *    one in PFN ascending order and perform stats, unfreeze, adding to list,
faebec76111eb2 Zi Yan 2024-11-01  3520   *    and file mapping index operations.
faebec76111eb2 Zi Yan 2024-11-01  3521   * 2. buddy allocator like split: in general, folio_order - @new_order calls to
faebec76111eb2 Zi Yan 2024-11-01  3522   *    __split_folio_to_order() are called in the for loop to split the @folio
faebec76111eb2 Zi Yan 2024-11-01  3523   *    to one lower order at a time. The resulting small folios are processed
faebec76111eb2 Zi Yan 2024-11-01  3524   *    like what is done during the traversal in 1, except the one containing
faebec76111eb2 Zi Yan 2024-11-01  3525   *    @page, which is split in next for loop.
faebec76111eb2 Zi Yan 2024-11-01  3526   *
faebec76111eb2 Zi Yan 2024-11-01  3527   * After splitting, the caller's folio reference will be transferred to the
faebec76111eb2 Zi Yan 2024-11-01  3528   * folio containing @page. The other folios may be freed if they are not mapped.
faebec76111eb2 Zi Yan 2024-11-01  3529   *
faebec76111eb2 Zi Yan 2024-11-01  3530   * In terms of locking, after splitting,
faebec76111eb2 Zi Yan 2024-11-01  3531   * 1. uniform split leaves @page (or the folio contains it) locked;
faebec76111eb2 Zi Yan 2024-11-01  3532   * 2. buddy allocator like split leaves @folio locked.
faebec76111eb2 Zi Yan 2024-11-01  3533   *
faebec76111eb2 Zi Yan 2024-11-01  3534   * If @list is null, tail pages will be added to LRU list, otherwise, to @list.
faebec76111eb2 Zi Yan 2024-11-01  3535   *
faebec76111eb2 Zi Yan 2024-11-01  3536   * For !uniform_split, when -ENOMEM is returned, the original folio might be
faebec76111eb2 Zi Yan 2024-11-01  3537   * split. The caller needs to check the input folio.
faebec76111eb2 Zi Yan 2024-11-01  3538   */
faebec76111eb2 Zi Yan 2024-11-01  3539  static int __folio_split_without_mapping(struct folio *folio, int new_order,
faebec76111eb2 Zi Yan 2024-11-01  3540  		struct page *page, struct list_head *list, pgoff_t end,
faebec76111eb2 Zi Yan 2024-11-01  3541  		struct xa_state *xas, struct address_space *mapping,
faebec76111eb2 Zi Yan 2024-11-01  3542  		bool uniform_split)
faebec76111eb2 Zi Yan 2024-11-01  3543  {
faebec76111eb2 Zi Yan 2024-11-01  3544  	struct lruvec *lruvec;
faebec76111eb2 Zi Yan 2024-11-01  3545  	struct address_space *swap_cache = NULL;
faebec76111eb2 Zi Yan 2024-11-01  3546  	struct folio *origin_folio = folio;
faebec76111eb2 Zi Yan 2024-11-01  3547  	struct folio *next_folio = folio_next(folio);
faebec76111eb2 Zi Yan 2024-11-01  3548  	struct folio *new_folio;
faebec76111eb2 Zi Yan 2024-11-01  3549  	struct folio *next;
faebec76111eb2 Zi Yan 2024-11-01  3550  	int order = folio_order(folio);
faebec76111eb2 Zi Yan 2024-11-01  3551  	int split_order = order - 1;
faebec76111eb2 Zi Yan 2024-11-01  3552  	int nr_dropped = 0;
faebec76111eb2 Zi Yan 2024-11-01  3553  	int ret = 0;
faebec76111eb2 Zi Yan 2024-11-01  3554  
faebec76111eb2 Zi Yan 2024-11-01  3555  	if (folio_test_anon(folio) && folio_test_swapcache(folio)) {
faebec76111eb2 Zi Yan 2024-11-01  3556  		if (!uniform_split)
faebec76111eb2 Zi Yan 2024-11-01  3557  			return -EINVAL;
faebec76111eb2 Zi Yan 2024-11-01  3558  
faebec76111eb2 Zi Yan 2024-11-01  3559  		swap_cache = swap_address_space(folio->swap);
faebec76111eb2 Zi Yan 2024-11-01  3560  		xa_lock(&swap_cache->i_pages);
faebec76111eb2 Zi Yan 2024-11-01  3561  	}
faebec76111eb2 Zi Yan 2024-11-01  3562  
faebec76111eb2 Zi Yan 2024-11-01  3563  	if (folio_test_anon(folio))
faebec76111eb2 Zi Yan 2024-11-01  3564  		mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
faebec76111eb2 Zi Yan 2024-11-01  3565  
faebec76111eb2 Zi Yan 2024-11-01  3566  	/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
faebec76111eb2 Zi Yan 2024-11-01  3567  	lruvec = folio_lruvec_lock(folio);
faebec76111eb2 Zi Yan 2024-11-01  3568  
faebec76111eb2 Zi Yan 2024-11-01  3569  	/*
faebec76111eb2 Zi Yan 2024-11-01  3570  	 * split to new_order one order at a time. For uniform split,
faebec76111eb2 Zi Yan 2024-11-01  3571  	 * intermediate orders are skipped
faebec76111eb2 Zi Yan 2024-11-01  3572  	 */
faebec76111eb2 Zi Yan 2024-11-01  3573  	for (split_order = order - 1; split_order >= new_order; split_order--) {
faebec76111eb2 Zi Yan 2024-11-01  3574  		int old_order = folio_order(folio);
faebec76111eb2 Zi Yan 2024-11-01  3575  		struct folio *release;
faebec76111eb2 Zi Yan 2024-11-01  3576  		struct folio *end_folio = folio_next(folio);
faebec76111eb2 Zi Yan 2024-11-01  3577  		int status;
faebec76111eb2 Zi Yan 2024-11-01  3578  		bool stop_split = false;
faebec76111eb2 Zi Yan 2024-11-01  3579  
faebec76111eb2 Zi Yan 2024-11-01  3580  		if (folio_test_anon(folio) && split_order == 1)
faebec76111eb2 Zi Yan 2024-11-01  3581  			continue;
faebec76111eb2 Zi Yan 2024-11-01  3582  		if (uniform_split && split_order != new_order)
faebec76111eb2 Zi Yan 2024-11-01  3583  			continue;
faebec76111eb2 Zi Yan 2024-11-01  3584  
faebec76111eb2 Zi Yan 2024-11-01 @3585  		if (mapping) {
faebec76111eb2 Zi Yan 2024-11-01  3586  			/*
faebec76111eb2 Zi Yan 2024-11-01  3587  			 * uniform split has xas_split_alloc() called before
faebec76111eb2 Zi Yan 2024-11-01  3588  			 * irq is disabled, since xas_nomem() might not be
faebec76111eb2 Zi Yan 2024-11-01  3589  			 * able to allocate enough memory.
faebec76111eb2 Zi Yan 2024-11-01  3590  			 */
faebec76111eb2 Zi Yan 2024-11-01  3591  			if (uniform_split)
faebec76111eb2 Zi Yan 2024-11-01  3592  				xas_split(xas, folio, old_order);
faebec76111eb2 Zi Yan 2024-11-01  3593  			else {
faebec76111eb2 Zi Yan 2024-11-01  3594  				xas_set_order(xas, folio->index, split_order);
faebec76111eb2 Zi Yan 2024-11-01  3595  				xas_set_err(xas, -ENOMEM);
faebec76111eb2 Zi Yan 2024-11-01  3596  				if (xas_nomem(xas, 0))
faebec76111eb2 Zi Yan 2024-11-01  3597  					xas_split(xas, folio, old_order);
faebec76111eb2 Zi Yan 2024-11-01  3598  				else {
faebec76111eb2 Zi Yan 2024-11-01  3599  					stop_split = true;
faebec76111eb2 Zi Yan 2024-11-01  3600  					ret = -ENOMEM;
faebec76111eb2 Zi Yan 2024-11-01  3601  					goto after_split;
faebec76111eb2 Zi Yan 2024-11-01  3602  				}
faebec76111eb2 Zi Yan 2024-11-01  3603  			}
faebec76111eb2 Zi Yan 2024-11-01  3604  		}
faebec76111eb2 Zi Yan 2024-11-01  3605  
faebec76111eb2 Zi Yan 2024-11-01  3606  		split_page_memcg(&folio->page, old_order, split_order);
faebec76111eb2 Zi Yan 2024-11-01  3607  		split_page_owner(&folio->page, old_order, split_order);
faebec76111eb2 Zi Yan 2024-11-01  3608  		pgalloc_tag_split(folio, old_order, split_order);
faebec76111eb2 Zi Yan 2024-11-01  3609  
faebec76111eb2 Zi Yan 2024-11-01  3610  		status = __split_folio_to_order(folio, split_order);
faebec76111eb2 Zi Yan 2024-11-01  3611  
faebec76111eb2 Zi Yan 2024-11-01  3612  		if (status < 0)
faebec76111eb2 Zi Yan 2024-11-01  3613  			return status;
faebec76111eb2 Zi Yan 2024-11-01  3614  
faebec76111eb2 Zi Yan 2024-11-01  3615  after_split:
faebec76111eb2 Zi Yan 2024-11-01  3616  		/*
faebec76111eb2 Zi Yan 2024-11-01  3617  		 * Iterate through after-split folios and perform related
faebec76111eb2 Zi Yan 2024-11-01  3618  		 * operations. But in buddy allocator like split, the folio
faebec76111eb2 Zi Yan 2024-11-01  3619  		 * containing the specified page is skipped until its order
faebec76111eb2 Zi Yan 2024-11-01  3620  		 * is new_order, since the folio will be worked on in next
faebec76111eb2 Zi Yan 2024-11-01  3621  		 * iteration.
faebec76111eb2 Zi Yan 2024-11-01  3622  		 */
faebec76111eb2 Zi Yan 2024-11-01  3623  		for_each_folio_until_end_safe(release, next, folio, end_folio) {
faebec76111eb2 Zi Yan 2024-11-01  3624  			if (page_in_folio_offset(page, release) >= 0) {
faebec76111eb2 Zi Yan 2024-11-01  3625  				folio = release;
faebec76111eb2 Zi Yan 2024-11-01  3626  				if (split_order != new_order && !stop_split)
faebec76111eb2 Zi Yan 2024-11-01  3627  					continue;
faebec76111eb2 Zi Yan 2024-11-01  3628  			}
faebec76111eb2 Zi Yan 2024-11-01  3629  			if (folio_test_anon(release))
faebec76111eb2 Zi Yan 2024-11-01  3630  				mod_mthp_stat(folio_order(release),
faebec76111eb2 Zi Yan 2024-11-01  3631  						MTHP_STAT_NR_ANON, 1);
faebec76111eb2 Zi Yan 2024-11-01  3632  
faebec76111eb2 Zi Yan 2024-11-01  3633  			/*
faebec76111eb2 Zi Yan 2024-11-01  3634  			 * Unfreeze refcount first. Additional reference from
faebec76111eb2 Zi Yan 2024-11-01  3635  			 * page cache.
faebec76111eb2 Zi Yan 2024-11-01  3636  			 */
faebec76111eb2 Zi Yan 2024-11-01  3637  			folio_ref_unfreeze(release,
faebec76111eb2 Zi Yan 2024-11-01  3638  				1 + ((!folio_test_anon(origin_folio) ||
faebec76111eb2 Zi Yan 2024-11-01  3639  				     folio_test_swapcache(origin_folio)) ?
faebec76111eb2 Zi Yan 2024-11-01  3640  					     folio_nr_pages(release) : 0));
faebec76111eb2 Zi Yan 2024-11-01  3641  
faebec76111eb2 Zi Yan 2024-11-01  3642  			if (release != origin_folio)
faebec76111eb2 Zi Yan 2024-11-01  3643  				lru_add_page_tail(origin_folio, &release->page,
faebec76111eb2 Zi Yan 2024-11-01  3644  						lruvec, list);
faebec76111eb2 Zi Yan 2024-11-01  3645  
faebec76111eb2 Zi Yan 2024-11-01  3646  			/* Some pages can be beyond EOF: drop them from page cache */
faebec76111eb2 Zi Yan 2024-11-01  3647  			if (release->index >= end) {
faebec76111eb2 Zi Yan 2024-11-01  3648  				if (shmem_mapping(origin_folio->mapping))
faebec76111eb2 Zi Yan 2024-11-01  3649  					nr_dropped++;
faebec76111eb2 Zi Yan 2024-11-01  3650  				else if (folio_test_clear_dirty(release))
faebec76111eb2 Zi Yan 2024-11-01  3651  					folio_account_cleaned(release,
faebec76111eb2 Zi Yan 2024-11-01  3652  						inode_to_wb(origin_folio->mapping->host));
faebec76111eb2 Zi Yan 2024-11-01  3653  				__filemap_remove_folio(release, NULL);
faebec76111eb2 Zi Yan 2024-11-01  3654  				folio_put(release);
faebec76111eb2 Zi Yan 2024-11-01  3655  			} else if (!folio_test_anon(release)) {
faebec76111eb2 Zi Yan 2024-11-01  3656  				__xa_store(&origin_folio->mapping->i_pages,
faebec76111eb2 Zi Yan 2024-11-01  3657  						release->index, &release->page, 0);
faebec76111eb2 Zi Yan 2024-11-01 @3658  			} else if (swap_cache) {
faebec76111eb2 Zi Yan 2024-11-01  3659  				__xa_store(&swap_cache->i_pages,
faebec76111eb2 Zi Yan 2024-11-01  3660  						swap_cache_index(release->swap),
faebec76111eb2 Zi Yan 2024-11-01  3661  						&release->page, 0);
faebec76111eb2 Zi Yan 2024-11-01  3662  			}
faebec76111eb2 Zi Yan 2024-11-01  3663  		}
faebec76111eb2 Zi Yan 2024-11-01  3664  		xas_destroy(xas);
faebec76111eb2 Zi Yan 2024-11-01  3665  	}
faebec76111eb2 Zi Yan 2024-11-01  3666  
faebec76111eb2 Zi Yan 2024-11-01  3667  	unlock_page_lruvec(lruvec);
faebec76111eb2 Zi Yan 2024-11-01  3668  
faebec76111eb2 Zi Yan 2024-11-01  3669  	if (folio_test_anon(origin_folio)) {
faebec76111eb2 Zi Yan 2024-11-01  3670  		if (folio_test_swapcache(origin_folio))
faebec76111eb2 Zi Yan 2024-11-01 @3671  			xa_unlock(&swap_cache->i_pages);
faebec76111eb2 Zi Yan 2024-11-01  3672  	} else
faebec76111eb2 Zi Yan 2024-11-01 @3673  		xa_unlock(&mapping->i_pages);
faebec76111eb2 Zi Yan 2024-11-01  3674  
faebec76111eb2 Zi Yan 2024-11-01  3675  	/* Caller disabled irqs, so they are still disabled here */
faebec76111eb2 Zi Yan 2024-11-01  3676  	local_irq_enable();
faebec76111eb2 Zi Yan 2024-11-01  3677  
faebec76111eb2 Zi Yan 2024-11-01  3678  	if (nr_dropped)
faebec76111eb2 Zi Yan 2024-11-01  3679  		shmem_uncharge(mapping->host, nr_dropped);
faebec76111eb2 Zi Yan 2024-11-01  3680  
faebec76111eb2 Zi Yan 2024-11-01  3681  	remap_page(origin_folio, 1 << order,
faebec76111eb2 Zi Yan 2024-11-01  3682  			folio_test_anon(origin_folio) ?
faebec76111eb2 Zi Yan 2024-11-01  3683  				RMP_USE_SHARED_ZEROPAGE : 0);
faebec76111eb2 Zi Yan 2024-11-01  3684  
faebec76111eb2 Zi Yan 2024-11-01  3685  	/*
faebec76111eb2 Zi Yan 2024-11-01  3686  	 * At this point, folio should contain the specified page, so that it
faebec76111eb2 Zi Yan 2024-11-01  3687  	 * will be left to the caller to unlock it.
faebec76111eb2 Zi Yan 2024-11-01  3688  	 */
faebec76111eb2 Zi Yan 2024-11-01  3689  	for_each_folio_until_end_safe(new_folio, next, origin_folio, next_folio) {
faebec76111eb2 Zi Yan 2024-11-01  3690  		if (uniform_split && new_folio == folio)
faebec76111eb2 Zi Yan 2024-11-01  3691  			continue;
faebec76111eb2 Zi Yan 2024-11-01  3692  		if (!uniform_split && new_folio == origin_folio)
faebec76111eb2 Zi Yan 2024-11-01  3693  			continue;
faebec76111eb2 Zi Yan 2024-11-01  3694  
faebec76111eb2 Zi Yan 2024-11-01  3695  		folio_unlock(new_folio);
faebec76111eb2 Zi Yan 2024-11-01  3696  		/*
faebec76111eb2 Zi Yan 2024-11-01  3697  		 * Subpages may be freed if there wasn't any mapping
faebec76111eb2 Zi Yan 2024-11-01  3698  		 * like if add_to_swap() is running on a lru page that
faebec76111eb2 Zi Yan 2024-11-01  3699  		 * had its mapping zapped. And freeing these pages
faebec76111eb2 Zi Yan 2024-11-01  3700  		 * requires taking the lru_lock so we do the put_page
faebec76111eb2 Zi Yan 2024-11-01  3701  		 * of the tail pages after the split is complete.
faebec76111eb2 Zi Yan 2024-11-01  3702  		 */
faebec76111eb2 Zi Yan 2024-11-01  3703  		free_page_and_swap_cache(&new_folio->page);
faebec76111eb2 Zi Yan 2024-11-01  3704  	}
faebec76111eb2 Zi Yan 2024-11-01  3705  	return ret;
faebec76111eb2 Zi Yan 2024-11-01  3706  }
faebec76111eb2 Zi Yan 2024-11-01  3707  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
