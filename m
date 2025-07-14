Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C9D6A8D2
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 00:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752452504; cv=none; b=AjxlBFJ1WKsz2qEQk1PZqDYoBxxN6ka8ZQ/TNUzLbk1r6WYCl90mu/kMscRol2quVWNxJIj3kdHgS8vn15T4d0U8IA//K0j1ihx+adJJRIXZIgiADq1Z+ccRCq2n6CCBHMg0WsnbnjOLDzbktkPKb2V6X+jFrIhpQ106fSP36I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752452504; c=relaxed/simple;
	bh=2ck4BiXCJviAftHNTB74uCH1c4L+A1glSfTdCuYlKzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=io72QCjd2XvnaC28xk6JBG77MbMeHC9N77YkwG+dhf/7OcbCPMF2xuOWMGSjNwaGlMFdOJ6lk+yRLHikC++mPX4nulg7tKeQcTXCKOS5TB53hhp053glM4A4TcJKjTmHPzxTddpPYhRY+81r+QcZt6JiWedeBD2Ip1LkeF+g4f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSiUxA8c; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSiUxA8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752452501; x=1783988501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ck4BiXCJviAftHNTB74uCH1c4L+A1glSfTdCuYlKzw=;
  b=FSiUxA8cH5sTuGS5NBVoU9KYadN00K//VmoHzCR0qGyVzywKk9s3wBYw
   bTaKq56u4Jd2bx3jbl72+p3Dxk0V+EeDiMjjLm2OGvV9npGb49Rcg3/xf
   R2csMbwX8zjoGrCyVrcBq/Nstz7DR2V9pmFFWpjbERiPmi06wmPIS/J+r
   wPREZxzfLMU3KnfwWjikqPTmZEbrgcP6Am1cBX6x5ViWaofpB4iX1wOV/
   PewcYLdec7vWE7ux/MBApNs8OGgJ1VKOyWkyNmWrvoN59A7hFYlKWcXzL
   VBHyyYpbCzWxthl9GMLzss/CKLcYQtmk7PUyezveaq7uUDxY4FUiYj73j
   g==;
X-CSE-ConnectionGUID: QILjoOoOTYaE12ONfytIwg==
X-CSE-MsgGUID: 2tZBf8RiTzy3T5Ii4lUi9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58456103"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="58456103"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 17:21:40 -0700
X-CSE-ConnectionGUID: uzVvvZoBS9GTM65YtHg1KQ==
X-CSE-MsgGUID: DaKqe1DuRbiY2eaqzKzXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="156219438"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jul 2025 17:21:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ub6wp-0008NP-2q;
	Mon, 14 Jul 2025 00:21:35 +0000
Date: Mon, 14 Jul 2025 08:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/2] mm/huge_memory: move unrelated code out of
 __split_unmapped_folio()
Message-ID: <202507140837.bxjvd6Gs-lkp@intel.com>
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
In-Reply-To: <20250711182355.3592618-2-ziy@nvidia.com>
References: <20250711182355.3592618-2-ziy@nvidia.com>
TO: Zi Yan <ziy@nvidia.com>

Hi Zi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-huge_memory-move-unrelated-code-out-of-__split_unmapped_folio/20250712-022638
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250711182355.3592618-2-ziy%40nvidia.com
patch subject: [PATCH v2 1/2] mm/huge_memory: move unrelated code out of __split_unmapped_folio()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250713 (https://download.01.org/0day-ci/archive/20250714/202507140837.bxjvd6Gs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507140837.bxjvd6Gs-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:3827 __folio_split() error: we previously assumed 'mapping' could be null (see line 3814)

vim +/mapping +3827 mm/huge_memory.c

58729c04cf1092b Zi Yan                  2025-03-07  3578  
58729c04cf1092b Zi Yan                  2025-03-07  3579  /*
58729c04cf1092b Zi Yan                  2025-03-07  3580   * __folio_split: split a folio at @split_at to a @new_order folio
58729c04cf1092b Zi Yan                  2025-03-07  3581   * @folio: folio to split
58729c04cf1092b Zi Yan                  2025-03-07  3582   * @new_order: the order of the new folio
58729c04cf1092b Zi Yan                  2025-03-07  3583   * @split_at: a page within the new folio
58729c04cf1092b Zi Yan                  2025-03-07  3584   * @lock_at: a page within @folio to be left locked to caller
58729c04cf1092b Zi Yan                  2025-03-07  3585   * @list: after-split folios will be put on it if non NULL
58729c04cf1092b Zi Yan                  2025-03-07  3586   * @uniform_split: perform uniform split or not (non-uniform split)
58729c04cf1092b Zi Yan                  2025-03-07  3587   *
58729c04cf1092b Zi Yan                  2025-03-07  3588   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
58729c04cf1092b Zi Yan                  2025-03-07  3589   * It is in charge of checking whether the split is supported or not and
58729c04cf1092b Zi Yan                  2025-03-07  3590   * preparing @folio for __split_unmapped_folio().
58729c04cf1092b Zi Yan                  2025-03-07  3591   *
58729c04cf1092b Zi Yan                  2025-03-07  3592   * return: 0: successful, <0 failed (if -ENOMEM is returned, @folio might be
58729c04cf1092b Zi Yan                  2025-03-07  3593   * split but not to @new_order, the caller needs to check)
58729c04cf1092b Zi Yan                  2025-03-07  3594   */
6384dd1d18de7b8 Zi Yan                  2025-03-07  3595  static int __folio_split(struct folio *folio, unsigned int new_order,
58729c04cf1092b Zi Yan                  2025-03-07  3596  		struct page *split_at, struct page *lock_at,
58729c04cf1092b Zi Yan                  2025-03-07  3597  		struct list_head *list, bool uniform_split)
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3598  {
f8baa6be0368b5d Matthew Wilcox (Oracle  2023-01-11  3599) 	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
58729c04cf1092b Zi Yan                  2025-03-07  3600  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3601  	struct folio *next_folio = folio_next(folio);
5d65c8d758f2596 Barry Song              2024-08-24  3602  	bool is_anon = folio_test_anon(folio);
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3603  	struct address_space *mapping = NULL;
5d65c8d758f2596 Barry Song              2024-08-24  3604  	struct anon_vma *anon_vma = NULL;
f216c845f3c772e Lance Yang              2024-06-28  3605  	int order = folio_order(folio);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3606  	struct folio *new_folio, *next;
4d32dd3cb41df4d Zi Yan                  2025-07-11  3607  	int nr_shmem_dropped = 0;
504e070dc08f757 Yang Shi                2021-06-15  3608  	int extra_pins, ret;
006d3ff27e884f8 Hugh Dickins            2018-11-30  3609  	pgoff_t end;
478d134e9506c7e Xu Yu                   2022-04-28  3610  	bool is_hzp;
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3611  
3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3612) 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3613) 	VM_BUG_ON_FOLIO(!folio_test_large(folio), folio);
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3614  
58729c04cf1092b Zi Yan                  2025-03-07  3615  	if (folio != page_folio(split_at) || folio != page_folio(lock_at))
1412ecb3d256e5d Zi Yan                  2024-03-07  3616  		return -EINVAL;
1412ecb3d256e5d Zi Yan                  2024-03-07  3617  
58729c04cf1092b Zi Yan                  2025-03-07  3618  	if (new_order >= folio_order(folio))
c010d47f107f609 Zi Yan                  2024-02-26  3619  		return -EINVAL;
58729c04cf1092b Zi Yan                  2025-03-07  3620  
58729c04cf1092b Zi Yan                  2025-03-07  3621  	if (uniform_split && !uniform_split_supported(folio, new_order, true))
c010d47f107f609 Zi Yan                  2024-02-26  3622  		return -EINVAL;
c010d47f107f609 Zi Yan                  2024-02-26  3623  
58729c04cf1092b Zi Yan                  2025-03-07  3624  	if (!uniform_split &&
58729c04cf1092b Zi Yan                  2025-03-07  3625  	    !non_uniform_split_supported(folio, new_order, true))
6a50c9b512f7734 Ran Xiaokai             2024-06-07  3626  		return -EINVAL;
c010d47f107f609 Zi Yan                  2024-02-26  3627  
5beaee54a324ba1 Matthew Wilcox (Oracle  2024-03-26  3628) 	is_hzp = is_huge_zero_folio(folio);
4737edbbdd4958a Naoya Horiguchi         2023-04-06  3629  	if (is_hzp) {
4737edbbdd4958a Naoya Horiguchi         2023-04-06  3630  		pr_warn_ratelimited("Called split_huge_page for huge zero page\n");
478d134e9506c7e Xu Yu                   2022-04-28  3631  		return -EBUSY;
4737edbbdd4958a Naoya Horiguchi         2023-04-06  3632  	}
478d134e9506c7e Xu Yu                   2022-04-28  3633  
3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3634) 	if (folio_test_writeback(folio))
59807685a7e77e8 Ying Huang              2017-09-06  3635  		return -EBUSY;
59807685a7e77e8 Ying Huang              2017-09-06  3636  
5d65c8d758f2596 Barry Song              2024-08-24  3637  	if (is_anon) {
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3638  		/*
c1e8d7c6a7a682e Michel Lespinasse       2020-06-08  3639  		 * The caller does not necessarily hold an mmap_lock that would
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3640  		 * prevent the anon_vma disappearing so we first we take a
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3641  		 * reference to it and then lock the anon_vma for write. This
2f031c6f042cb8a Matthew Wilcox (Oracle  2022-01-29  3642) 		 * is similar to folio_lock_anon_vma_read except the write lock
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3643  		 * is taken to serialise against parallel split or collapse
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3644  		 * operations.
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3645  		 */
29eea9b5a9c9ecf Matthew Wilcox (Oracle  2022-09-02  3646) 		anon_vma = folio_get_anon_vma(folio);
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3647  		if (!anon_vma) {
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3648  			ret = -EBUSY;
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3649  			goto out;
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3650  		}
006d3ff27e884f8 Hugh Dickins            2018-11-30  3651  		end = -1;
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3652  		mapping = NULL;
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3653  		anon_vma_lock_write(anon_vma);
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3654  	} else {
e220917fa50774f Luis Chamberlain        2024-08-22  3655  		unsigned int min_order;
6a3edd29395631a Yin Fengwei             2022-08-10  3656  		gfp_t gfp;
6a3edd29395631a Yin Fengwei             2022-08-10  3657  
3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3658) 		mapping = folio->mapping;
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3659  
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3660  		/* Truncated ? */
6384dd1d18de7b8 Zi Yan                  2025-03-07  3661  		/*
6384dd1d18de7b8 Zi Yan                  2025-03-07  3662  		 * TODO: add support for large shmem folio in swap cache.
6384dd1d18de7b8 Zi Yan                  2025-03-07  3663  		 * When shmem is in swap cache, mapping is NULL and
6384dd1d18de7b8 Zi Yan                  2025-03-07  3664  		 * folio_test_swapcache() is true.
6384dd1d18de7b8 Zi Yan                  2025-03-07  3665  		 */
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3666  		if (!mapping) {
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3667  			ret = -EBUSY;
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3668  			goto out;
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3669  		}
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3670  
e220917fa50774f Luis Chamberlain        2024-08-22  3671  		min_order = mapping_min_folio_order(folio->mapping);
e220917fa50774f Luis Chamberlain        2024-08-22  3672  		if (new_order < min_order) {
e220917fa50774f Luis Chamberlain        2024-08-22  3673  			VM_WARN_ONCE(1, "Cannot split mapped folio below min-order: %u",
e220917fa50774f Luis Chamberlain        2024-08-22  3674  				     min_order);
e220917fa50774f Luis Chamberlain        2024-08-22  3675  			ret = -EINVAL;
e220917fa50774f Luis Chamberlain        2024-08-22  3676  			goto out;
e220917fa50774f Luis Chamberlain        2024-08-22  3677  		}
e220917fa50774f Luis Chamberlain        2024-08-22  3678  
6a3edd29395631a Yin Fengwei             2022-08-10  3679  		gfp = current_gfp_context(mapping_gfp_mask(mapping) &
6a3edd29395631a Yin Fengwei             2022-08-10  3680  							GFP_RECLAIM_MASK);
6a3edd29395631a Yin Fengwei             2022-08-10  3681  
0201ebf274a306a David Howells           2023-06-28  3682  		if (!filemap_release_folio(folio, gfp)) {
6a3edd29395631a Yin Fengwei             2022-08-10  3683  			ret = -EBUSY;
6a3edd29395631a Yin Fengwei             2022-08-10  3684  			goto out;
6a3edd29395631a Yin Fengwei             2022-08-10  3685  		}
6a3edd29395631a Yin Fengwei             2022-08-10  3686  
58729c04cf1092b Zi Yan                  2025-03-07  3687  		if (uniform_split) {
58729c04cf1092b Zi Yan                  2025-03-07  3688  			xas_set_order(&xas, folio->index, new_order);
3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3689) 			xas_split_alloc(&xas, folio, folio_order(folio), gfp);
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3690) 			if (xas_error(&xas)) {
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3691) 				ret = xas_error(&xas);
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3692) 				goto out;
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3693) 			}
58729c04cf1092b Zi Yan                  2025-03-07  3694  		}
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3695) 
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3696  		anon_vma = NULL;
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3697  		i_mmap_lock_read(mapping);
006d3ff27e884f8 Hugh Dickins            2018-11-30  3698  
006d3ff27e884f8 Hugh Dickins            2018-11-30  3699  		/*
58729c04cf1092b Zi Yan                  2025-03-07  3700  		 *__split_unmapped_folio() may need to trim off pages beyond
58729c04cf1092b Zi Yan                  2025-03-07  3701  		 * EOF: but on 32-bit, i_size_read() takes an irq-unsafe
58729c04cf1092b Zi Yan                  2025-03-07  3702  		 * seqlock, which cannot be nested inside the page tree lock.
58729c04cf1092b Zi Yan                  2025-03-07  3703  		 * So note end now: i_size itself may be changed at any moment,
58729c04cf1092b Zi Yan                  2025-03-07  3704  		 * but folio lock is good enough to serialize the trimming.
006d3ff27e884f8 Hugh Dickins            2018-11-30  3705  		 */
006d3ff27e884f8 Hugh Dickins            2018-11-30  3706  		end = DIV_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE);
d144bf6205342a4 Hugh Dickins            2021-09-02  3707  		if (shmem_mapping(mapping))
d144bf6205342a4 Hugh Dickins            2021-09-02  3708  			end = shmem_fallocend(mapping->host, end);
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3709  	}
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3710  
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3711  	/*
684555aacc90d70 Matthew Wilcox (Oracle  2022-09-02  3712) 	 * Racy check if we can split the page, before unmap_folio() will
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3713  	 * split PMDs
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3714  	 */
8710f6ed34e7bcf David Hildenbrand       2024-08-02  3715  	if (!can_split_folio(folio, 1, &extra_pins)) {
fd4a7ac32918d3d Baolin Wang             2022-10-24  3716  		ret = -EAGAIN;
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3717  		goto out_unlock;
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3718  	}
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3719  
684555aacc90d70 Matthew Wilcox (Oracle  2022-09-02  3720) 	unmap_folio(folio);
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3721  
b6769834aac1d46 Alex Shi                2020-12-15  3722  	/* block interrupt reentry in xa_lock and spinlock */
b6769834aac1d46 Alex Shi                2020-12-15  3723  	local_irq_disable();
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3724  	if (mapping) {
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3725  		/*
3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3726) 		 * Check if the folio is present in page cache.
3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3727) 		 * We assume all tail are present too, if folio is there.
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3728  		 */
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3729) 		xas_lock(&xas);
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3730) 		xas_reset(&xas);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3731  		if (xas_load(&xas) != folio) {
4d32dd3cb41df4d Zi Yan                  2025-07-11  3732  			ret = -EAGAIN;
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3733  			goto fail;
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3734  		}
4d32dd3cb41df4d Zi Yan                  2025-07-11  3735  	}
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3736  
0139aa7b7fa12ce Joonsoo Kim             2016-05-19  3737  	/* Prevent deferred_split_scan() touching ->_refcount */
364c1eebe453f06 Yang Shi                2019-09-23  3738  	spin_lock(&ds_queue->split_queue_lock);
3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3739) 	if (folio_ref_freeze(folio, 1 + extra_pins)) {
4d32dd3cb41df4d Zi Yan                  2025-07-11  3740  		struct address_space *swap_cache = NULL;
4d32dd3cb41df4d Zi Yan                  2025-07-11  3741  		struct lruvec *lruvec;
4d32dd3cb41df4d Zi Yan                  2025-07-11  3742  
8897277acfef7f7 Matthew Wilcox (Oracle  2024-02-26  3743) 		if (folio_order(folio) > 1 &&
8897277acfef7f7 Matthew Wilcox (Oracle  2024-02-26  3744) 		    !list_empty(&folio->_deferred_list)) {
364c1eebe453f06 Yang Shi                2019-09-23  3745  			ds_queue->split_queue_len--;
8422acdc97ed583 Usama Arif              2024-08-30  3746  			if (folio_test_partially_mapped(folio)) {
42b2eb69835b0fd Usama Arif              2024-12-12  3747  				folio_clear_partially_mapped(folio);
8422acdc97ed583 Usama Arif              2024-08-30  3748  				mod_mthp_stat(folio_order(folio),
8422acdc97ed583 Usama Arif              2024-08-30  3749  					      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
8422acdc97ed583 Usama Arif              2024-08-30  3750  			}
c010d47f107f609 Zi Yan                  2024-02-26  3751  			/*
c010d47f107f609 Zi Yan                  2024-02-26  3752  			 * Reinitialize page_deferred_list after removing the
c010d47f107f609 Zi Yan                  2024-02-26  3753  			 * page from the split_queue, otherwise a subsequent
c010d47f107f609 Zi Yan                  2024-02-26  3754  			 * split will see list corruption when checking the
c010d47f107f609 Zi Yan                  2024-02-26  3755  			 * page_deferred_list.
c010d47f107f609 Zi Yan                  2024-02-26  3756  			 */
c010d47f107f609 Zi Yan                  2024-02-26  3757  			list_del_init(&folio->_deferred_list);
9a982250f773cc8 Kirill A. Shutemov      2016-01-15  3758  		}
afb971729a0bca7 Wei Yang                2020-01-30  3759  		spin_unlock(&ds_queue->split_queue_lock);
06d3eff62d9dc6f Kirill A. Shutemov      2019-10-18  3760  		if (mapping) {
3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3761) 			int nr = folio_nr_pages(folio);
bf9ecead53c89d3 Muchun Song             2021-02-24  3762  
c010d47f107f609 Zi Yan                  2024-02-26  3763  			if (folio_test_pmd_mappable(folio) &&
c010d47f107f609 Zi Yan                  2024-02-26  3764  			    new_order < HPAGE_PMD_ORDER) {
3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3765) 				if (folio_test_swapbacked(folio)) {
a48d5bdc877b852 Stefan Roesch           2023-11-06  3766  					__lruvec_stat_mod_folio(folio,
a48d5bdc877b852 Stefan Roesch           2023-11-06  3767  							NR_SHMEM_THPS, -nr);
1ca7554d05ac038 Marek Szyprowski        2021-10-18  3768  				} else {
a48d5bdc877b852 Stefan Roesch           2023-11-06  3769  					__lruvec_stat_mod_folio(folio,
a48d5bdc877b852 Stefan Roesch           2023-11-06  3770  							NR_FILE_THPS, -nr);
1ca7554d05ac038 Marek Szyprowski        2021-10-18  3771  					filemap_nr_thps_dec(mapping);
1ca7554d05ac038 Marek Szyprowski        2021-10-18  3772  				}
06d3eff62d9dc6f Kirill A. Shutemov      2019-10-18  3773  			}
a48d5bdc877b852 Stefan Roesch           2023-11-06  3774  		}
06d3eff62d9dc6f Kirill A. Shutemov      2019-10-18  3775  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3776  		if (folio_test_swapcache(folio)) {
4d32dd3cb41df4d Zi Yan                  2025-07-11  3777  			if (mapping) {
4d32dd3cb41df4d Zi Yan                  2025-07-11  3778  				VM_WARN_ON_ONCE_FOLIO(mapping, folio);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3779  				ret = -EINVAL;
4d32dd3cb41df4d Zi Yan                  2025-07-11  3780  				goto fail;
4d32dd3cb41df4d Zi Yan                  2025-07-11  3781  			}
4d32dd3cb41df4d Zi Yan                  2025-07-11  3782  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3783  			/*
4d32dd3cb41df4d Zi Yan                  2025-07-11  3784  			 * a swapcache folio can only be uniformly split to
4d32dd3cb41df4d Zi Yan                  2025-07-11  3785  			 * order-0
4d32dd3cb41df4d Zi Yan                  2025-07-11  3786  			 */
4d32dd3cb41df4d Zi Yan                  2025-07-11  3787  			if (!uniform_split || new_order != 0) {
4d32dd3cb41df4d Zi Yan                  2025-07-11  3788  				ret = -EINVAL;
4d32dd3cb41df4d Zi Yan                  2025-07-11  3789  				goto fail;
4d32dd3cb41df4d Zi Yan                  2025-07-11  3790  			}
4d32dd3cb41df4d Zi Yan                  2025-07-11  3791  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3792  			swap_cache = swap_address_space(folio->swap);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3793  			xa_lock(&swap_cache->i_pages);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3794  		}
4d32dd3cb41df4d Zi Yan                  2025-07-11  3795  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3796  		/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
4d32dd3cb41df4d Zi Yan                  2025-07-11  3797  		lruvec = folio_lruvec_lock(folio);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3798  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3799  		ret = __split_unmapped_folio(folio, new_order, split_at, &xas,
4d32dd3cb41df4d Zi Yan                  2025-07-11  3800  					     mapping, uniform_split);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3801  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3802  		/*
4d32dd3cb41df4d Zi Yan                  2025-07-11  3803  		 * Unfreeze after-split folios and put them back to the right
4d32dd3cb41df4d Zi Yan                  2025-07-11  3804  		 * list. @folio should be kept frozon until page cache entries
4d32dd3cb41df4d Zi Yan                  2025-07-11  3805  		 * are updated with all the other after-split folios to prevent
4d32dd3cb41df4d Zi Yan                  2025-07-11  3806  		 * others seeing stale page cache entries.
4d32dd3cb41df4d Zi Yan                  2025-07-11  3807  		 */
4d32dd3cb41df4d Zi Yan                  2025-07-11  3808  		for (new_folio = folio_next(folio); new_folio != next_folio;
4d32dd3cb41df4d Zi Yan                  2025-07-11  3809  		     new_folio = next) {
4d32dd3cb41df4d Zi Yan                  2025-07-11  3810  			next = folio_next(new_folio);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3811  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3812  			folio_ref_unfreeze(
4d32dd3cb41df4d Zi Yan                  2025-07-11  3813  				new_folio,
4d32dd3cb41df4d Zi Yan                  2025-07-11 @3814  				1 + ((mapping || swap_cache) ?
4d32dd3cb41df4d Zi Yan                  2025-07-11  3815  					     folio_nr_pages(new_folio) :
4d32dd3cb41df4d Zi Yan                  2025-07-11  3816  					     0));
4d32dd3cb41df4d Zi Yan                  2025-07-11  3817  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3818  			lru_add_split_folio(folio, new_folio, lruvec, list);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3819  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3820  			/* Some pages can be beyond EOF: drop them from cache */
4d32dd3cb41df4d Zi Yan                  2025-07-11  3821  			if (new_folio->index >= end) {
4d32dd3cb41df4d Zi Yan                  2025-07-11  3822  				if (shmem_mapping(mapping))
4d32dd3cb41df4d Zi Yan                  2025-07-11  3823  					nr_shmem_dropped += folio_nr_pages(new_folio);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3824  				else if (folio_test_clear_dirty(new_folio))
4d32dd3cb41df4d Zi Yan                  2025-07-11  3825  					folio_account_cleaned(
4d32dd3cb41df4d Zi Yan                  2025-07-11  3826  						new_folio,
4d32dd3cb41df4d Zi Yan                  2025-07-11 @3827  						inode_to_wb(mapping->host));
4d32dd3cb41df4d Zi Yan                  2025-07-11  3828  				__filemap_remove_folio(new_folio, NULL);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3829  				folio_put_refs(new_folio,
4d32dd3cb41df4d Zi Yan                  2025-07-11  3830  					       folio_nr_pages(new_folio));
4d32dd3cb41df4d Zi Yan                  2025-07-11  3831  			} else if (mapping) {
4d32dd3cb41df4d Zi Yan                  2025-07-11  3832  				__xa_store(&mapping->i_pages, new_folio->index,
4d32dd3cb41df4d Zi Yan                  2025-07-11  3833  					   new_folio, 0);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3834  			} else if (swap_cache) {
4d32dd3cb41df4d Zi Yan                  2025-07-11  3835  				__xa_store(&swap_cache->i_pages,
4d32dd3cb41df4d Zi Yan                  2025-07-11  3836  					   swap_cache_index(new_folio->swap),
4d32dd3cb41df4d Zi Yan                  2025-07-11  3837  					   new_folio, 0);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3838  			}
4d32dd3cb41df4d Zi Yan                  2025-07-11  3839  		}
4d32dd3cb41df4d Zi Yan                  2025-07-11  3840  		/*
4d32dd3cb41df4d Zi Yan                  2025-07-11  3841  		 * Unfreeze @folio only after all page cache entries, which
4d32dd3cb41df4d Zi Yan                  2025-07-11  3842  		 * used to point to it, have been updated with new folios.
4d32dd3cb41df4d Zi Yan                  2025-07-11  3843  		 * Otherwise, a parallel folio_try_get() can grab origin_folio
4d32dd3cb41df4d Zi Yan                  2025-07-11  3844  		 * and its caller can see stale page cache entries.
4d32dd3cb41df4d Zi Yan                  2025-07-11  3845  		 */
4d32dd3cb41df4d Zi Yan                  2025-07-11  3846  		folio_ref_unfreeze(folio, 1 +
4d32dd3cb41df4d Zi Yan                  2025-07-11  3847  			((mapping || swap_cache) ? folio_nr_pages(folio) : 0));
4d32dd3cb41df4d Zi Yan                  2025-07-11  3848  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3849  		unlock_page_lruvec(lruvec);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3850  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3851  		if (swap_cache)
4d32dd3cb41df4d Zi Yan                  2025-07-11  3852  			xa_unlock(&swap_cache->i_pages);
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3853  	} else {
364c1eebe453f06 Yang Shi                2019-09-23  3854  		spin_unlock(&ds_queue->split_queue_lock);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3855  		ret = -EAGAIN;
4d32dd3cb41df4d Zi Yan                  2025-07-11  3856  	}
504e070dc08f757 Yang Shi                2021-06-15  3857  fail:
504e070dc08f757 Yang Shi                2021-06-15  3858  	if (mapping)
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3859) 		xas_unlock(&xas);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3860  
b6769834aac1d46 Alex Shi                2020-12-15  3861  	local_irq_enable();
4d32dd3cb41df4d Zi Yan                  2025-07-11  3862  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3863  	if (nr_shmem_dropped)
4d32dd3cb41df4d Zi Yan                  2025-07-11  3864  		shmem_uncharge(mapping->host, nr_shmem_dropped);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3865  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3866  	remap_page(folio, 1 << order,
4d32dd3cb41df4d Zi Yan                  2025-07-11  3867  		   !ret && folio_test_anon(folio) ? RMP_USE_SHARED_ZEROPAGE :
4d32dd3cb41df4d Zi Yan                  2025-07-11  3868  						    0);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3869  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3870  	/*
4d32dd3cb41df4d Zi Yan                  2025-07-11  3871  	 * Unlock all after-split folios except the one containing @lock_at
4d32dd3cb41df4d Zi Yan                  2025-07-11  3872  	 * page. If @folio is not split, it will be kept locked.
4d32dd3cb41df4d Zi Yan                  2025-07-11  3873  	 */
4d32dd3cb41df4d Zi Yan                  2025-07-11  3874  	for (new_folio = folio; new_folio != next_folio; new_folio = next) {
4d32dd3cb41df4d Zi Yan                  2025-07-11  3875  		next = folio_next(new_folio);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3876  		if (new_folio == page_folio(lock_at))
4d32dd3cb41df4d Zi Yan                  2025-07-11  3877  			continue;
4d32dd3cb41df4d Zi Yan                  2025-07-11  3878  
4d32dd3cb41df4d Zi Yan                  2025-07-11  3879  		folio_unlock(new_folio);
4d32dd3cb41df4d Zi Yan                  2025-07-11  3880  		/*
4d32dd3cb41df4d Zi Yan                  2025-07-11  3881  		 * Subpages may be freed if there wasn't any mapping
4d32dd3cb41df4d Zi Yan                  2025-07-11  3882  		 * like if add_to_swap() is running on a lru page that
4d32dd3cb41df4d Zi Yan                  2025-07-11  3883  		 * had its mapping zapped. And freeing these pages
4d32dd3cb41df4d Zi Yan                  2025-07-11  3884  		 * requires taking the lru_lock so we do the put_page
4d32dd3cb41df4d Zi Yan                  2025-07-11  3885  		 * of the tail pages after the split is complete.
4d32dd3cb41df4d Zi Yan                  2025-07-11  3886  		 */
4d32dd3cb41df4d Zi Yan                  2025-07-11  3887  		free_folio_and_swap_cache(new_folio);
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3888  	}
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3889  
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3890  out_unlock:
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3891  	if (anon_vma) {
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3892  		anon_vma_unlock_write(anon_vma);
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3893  		put_anon_vma(anon_vma);
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3894  	}
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3895  	if (mapping)
baa355fd3314245 Kirill A. Shutemov      2016-07-26  3896  		i_mmap_unlock_read(mapping);
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3897  out:
69a37a8ba1b408a Matthew Wilcox (Oracle  2022-06-08  3898) 	xas_destroy(&xas);
f216c845f3c772e Lance Yang              2024-06-28  3899  	if (order == HPAGE_PMD_ORDER)
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3900  		count_vm_event(!ret ? THP_SPLIT_PAGE : THP_SPLIT_PAGE_FAILED);
f216c845f3c772e Lance Yang              2024-06-28  3901  	count_mthp_stat(order, !ret ? MTHP_STAT_SPLIT : MTHP_STAT_SPLIT_FAILED);
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3902  	return ret;
e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3903  }
9a982250f773cc8 Kirill A. Shutemov      2016-01-15  3904  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
