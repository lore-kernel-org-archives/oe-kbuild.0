Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA57035CBC5
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Nov 2025 05:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763183425; cv=none; b=unXKTp0ZKfdEfo3Gf64VLJO28UEpvZHOl0C5QvWFKreUgGrDnn+++zzKzWvGLVJ0x0/WIFSFXdWPEWEBuQ484b7rKMauSlqgFn/RyfSZykMwZcC+YK0SYSrokRJ6DbDOEjPMS2nSszrirF1UokUdXSkjf+yw4SFs3FzoyEv8RyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763183425; c=relaxed/simple;
	bh=CrD9oKkrTLUIXspVBAwTGIsGR7NFWNKTWKLVa5lEwJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AlZlbzbm0YVyAP+9KMC0A48SOARpjy978XSXDAsCIKXK/NV82VR77NkEWcNbG2fxz+zZfAXAdip2qC6dN4bqlgSRuiDHugfPIDYRVZR7YD7xtxilM/5soNVhpOipjzJLci+jWNWKmnKwZmWfw0To4qvyNSwsNOoGQbNy9P89oeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mxgd1RoE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mxgd1RoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763183423; x=1794719423;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CrD9oKkrTLUIXspVBAwTGIsGR7NFWNKTWKLVa5lEwJY=;
  b=Mxgd1RoEH784jqH94e1uSDt0tb82GtHxIE7SAs+kYur1Sdhr7nimAw9j
   xs5RvLvCV2vbdDW5KALPBT30iaWsDg0OnxhkvR6g6s+TC1PkHf9RFKArA
   pSAyiZYBjqPs5pypX8NgHtsBloz4pogpqK2TgmNEfqRTLquitq/wHFviF
   fLTtIgIpekE++TNw5dveJejLXPYtyEEftAyKUAS/6/IdPLNe23TfsfHYN
   isDBww2bVhqGToOcmIH0ZNf6UHPcBXfy8OFWIOEO4JJBXdgXlvFy0p6PQ
   xlRkuI8iKMY0NH8fsNvAQ8Wc1RAG6NjM5IbhAJKEBRyNUQ3O9MA9yWROX
   w==;
X-CSE-ConnectionGUID: 08LY/J7jSGG1F7qBE4PI4w==
X-CSE-MsgGUID: wgI5QtSjTWumlxinn9Z3uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65159541"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="65159541"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 21:10:22 -0800
X-CSE-ConnectionGUID: Xmg9t6trQsSUyyE0ctWVYA==
X-CSE-MsgGUID: XqzJtreYQoGGM5ojaORdGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="189778209"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Nov 2025 21:10:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK8YE-0007j5-2B;
	Sat, 15 Nov 2025 05:10:18 +0000
Date: Sat, 15 Nov 2025 13:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
Message-ID: <202511151216.rhK2ItOb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251114012228.2634882-1-balbirs@nvidia.com>
References: <20251114012228.2634882-1-balbirs@nvidia.com>
TO: Balbir Singh <balbirs@nvidia.com>
TO: linux-kernel@vger.kernel.org
TO: linux-mm@kvack.org
TO: dri-devel@lists.freedesktop.org
CC: Balbir Singh <balbirs@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>
CC: Zi Yan <ziy@nvidia.com>
CC: Joshua Hahn <joshua.hahnjy@gmail.com>
CC: Rakie Kim <rakie.kim@sk.com>
CC: Byungchul Park <byungchul@sk.com>
CC: Gregory Price <gourry@gourry.net>
CC: Ying Huang <ying.huang@linux.alibaba.com>
CC: Alistair Popple <apopple@nvidia.com>
CC: Oscar Salvador <osalvador@suse.de>
CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Baolin Wang <baolin.wang@linux.alibaba.com>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: Nico Pache <npache@redhat.com>
CC: Ryan Roberts <ryan.roberts@arm.com>
CC: Dev Jain <dev.jain@arm.com>
CC: Barry Song <baohua@kernel.org>
CC: Lyude Paul <lyude@redhat.com>
CC: Danilo Krummrich <dakr@kernel.org>
CC: David Airlie <airlied@gmail.com>
CC: Simona Vetter <simona@ffwll.ch>
CC: Ralph Campbell <rcampbell@nvidia.com>
CC: "Mika Penttilä" <mpenttil@redhat.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>

Hi Balbir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/mm-huge_memory-c-introduce-folio_split_unmapped/20251114-093541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251114012228.2634882-1-balbirs%40nvidia.com
patch subject: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-141-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151216.rhK2ItOb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511151216.rhK2ItOb-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:4044 __folio_split() error: uninitialized symbol 'end'.
mm/huge_memory.c:4052 __folio_split() error: we previously assumed 'mapping' could be null (see line 4046)

vim +/end +4044 mm/huge_memory.c

f6b1f167ffe29f Balbir Singh            2025-11-14  3886  
aeb1f4fbd83085 Zi Yan                  2025-10-31  3887  /**
aeb1f4fbd83085 Zi Yan                  2025-10-31  3888   * __folio_split() - split a folio at @split_at to a @new_order folio
58729c04cf1092 Zi Yan                  2025-03-07  3889   * @folio: folio to split
58729c04cf1092 Zi Yan                  2025-03-07  3890   * @new_order: the order of the new folio
58729c04cf1092 Zi Yan                  2025-03-07  3891   * @split_at: a page within the new folio
58729c04cf1092 Zi Yan                  2025-03-07  3892   * @lock_at: a page within @folio to be left locked to caller
58729c04cf1092 Zi Yan                  2025-03-07  3893   * @list: after-split folios will be put on it if non NULL
3c844d850e4486 Wei Yang                2025-11-06  3894   * @split_type: perform uniform split or not (non-uniform split)
58729c04cf1092 Zi Yan                  2025-03-07  3895   *
58729c04cf1092 Zi Yan                  2025-03-07  3896   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
58729c04cf1092 Zi Yan                  2025-03-07  3897   * It is in charge of checking whether the split is supported or not and
58729c04cf1092 Zi Yan                  2025-03-07  3898   * preparing @folio for __split_unmapped_folio().
58729c04cf1092 Zi Yan                  2025-03-07  3899   *
6c7de9c83be68b Zi Yan                  2025-07-18  3900   * After splitting, the after-split folio containing @lock_at remains locked
6c7de9c83be68b Zi Yan                  2025-07-18  3901   * and others are unlocked:
6c7de9c83be68b Zi Yan                  2025-07-18  3902   * 1. for uniform split, @lock_at points to one of @folio's subpages;
6c7de9c83be68b Zi Yan                  2025-07-18  3903   * 2. for buddy allocator like (non-uniform) split, @lock_at points to @folio.
6c7de9c83be68b Zi Yan                  2025-07-18  3904   *
aeb1f4fbd83085 Zi Yan                  2025-10-31  3905   * Return: 0 - successful, <0 - failed (if -ENOMEM is returned, @folio might be
58729c04cf1092 Zi Yan                  2025-03-07  3906   * split but not to @new_order, the caller needs to check)
58729c04cf1092 Zi Yan                  2025-03-07  3907   */
6384dd1d18de7b Zi Yan                  2025-03-07  3908  static int __folio_split(struct folio *folio, unsigned int new_order,
58729c04cf1092 Zi Yan                  2025-03-07  3909  		struct page *split_at, struct page *lock_at,
f6b1f167ffe29f Balbir Singh            2025-11-14  3910  		struct list_head *list, enum split_type split_type)
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3911  {
58729c04cf1092 Zi Yan                  2025-03-07  3912  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
6c7de9c83be68b Zi Yan                  2025-07-18  3913  	struct folio *end_folio = folio_next(folio);
5d65c8d758f259 Barry Song              2024-08-24  3914  	bool is_anon = folio_test_anon(folio);
baa355fd331424 Kirill A. Shutemov      2016-07-26  3915  	struct address_space *mapping = NULL;
5d65c8d758f259 Barry Song              2024-08-24  3916  	struct anon_vma *anon_vma = NULL;
8ec26327c18e1d Wei Yang                2025-10-10  3917  	int old_order = folio_order(folio);
6c7de9c83be68b Zi Yan                  2025-07-18  3918  	struct folio *new_folio, *next;
391dc7f40590d7 Zi Yan                  2025-07-18  3919  	int nr_shmem_dropped = 0;
391dc7f40590d7 Zi Yan                  2025-07-18  3920  	int remap_flags = 0;
504e070dc08f75 Yang Shi                2021-06-15  3921  	int extra_pins, ret;
006d3ff27e884f Hugh Dickins            2018-11-30  3922  	pgoff_t end;
478d134e9506c7 Xu Yu                   2022-04-28  3923  	bool is_hzp;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3924  
714b056c832106 Zi Yan                  2025-07-17  3925  	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
714b056c832106 Zi Yan                  2025-07-17  3926  	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3927  
58729c04cf1092 Zi Yan                  2025-03-07  3928  	if (folio != page_folio(split_at) || folio != page_folio(lock_at))
1412ecb3d256e5 Zi Yan                  2024-03-07  3929  		return -EINVAL;
1412ecb3d256e5 Zi Yan                  2024-03-07  3930  
8ec26327c18e1d Wei Yang                2025-10-10  3931  	if (new_order >= old_order)
c010d47f107f60 Zi Yan                  2024-02-26  3932  		return -EINVAL;
58729c04cf1092 Zi Yan                  2025-03-07  3933  
aa27253af32c74 Wei Yang                2025-11-06  3934  	if (!folio_split_supported(folio, new_order, split_type, /* warn = */ true))
6a50c9b512f773 Ran Xiaokai             2024-06-07  3935  		return -EINVAL;
c010d47f107f60 Zi Yan                  2024-02-26  3936  
5beaee54a324ba Matthew Wilcox (Oracle  2024-03-26  3937) 	is_hzp = is_huge_zero_folio(folio);
4737edbbdd4958 Naoya Horiguchi         2023-04-06  3938  	if (is_hzp) {
4737edbbdd4958 Naoya Horiguchi         2023-04-06  3939  		pr_warn_ratelimited("Called split_huge_page for huge zero page\n");
478d134e9506c7 Xu Yu                   2022-04-28  3940  		return -EBUSY;
4737edbbdd4958 Naoya Horiguchi         2023-04-06  3941  	}
478d134e9506c7 Xu Yu                   2022-04-28  3942  
3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  3943) 	if (folio_test_writeback(folio))
59807685a7e77e Ying Huang              2017-09-06  3944  		return -EBUSY;
59807685a7e77e Ying Huang              2017-09-06  3945  
5d65c8d758f259 Barry Song              2024-08-24  3946  	if (is_anon) {
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3947  		/*
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  3948  		 * The caller does not necessarily hold an mmap_lock that would
baa355fd331424 Kirill A. Shutemov      2016-07-26  3949  		 * prevent the anon_vma disappearing so we first we take a
baa355fd331424 Kirill A. Shutemov      2016-07-26  3950  		 * reference to it and then lock the anon_vma for write. This
2f031c6f042cb8 Matthew Wilcox (Oracle  2022-01-29  3951) 		 * is similar to folio_lock_anon_vma_read except the write lock
baa355fd331424 Kirill A. Shutemov      2016-07-26  3952  		 * is taken to serialise against parallel split or collapse
baa355fd331424 Kirill A. Shutemov      2016-07-26  3953  		 * operations.
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3954  		 */
29eea9b5a9c9ec Matthew Wilcox (Oracle  2022-09-02  3955) 		anon_vma = folio_get_anon_vma(folio);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3956  		if (!anon_vma) {
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3957  			ret = -EBUSY;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3958  			goto out;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3959  		}
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3960  		anon_vma_lock_write(anon_vma);
3d4c0d98eb8572 Balbir Singh            2025-10-01  3961  		mapping = NULL;
baa355fd331424 Kirill A. Shutemov      2016-07-26  3962  	} else {
e220917fa50774 Luis Chamberlain        2024-08-22  3963  		unsigned int min_order;
6a3edd29395631 Yin Fengwei             2022-08-10  3964  		gfp_t gfp;
6a3edd29395631 Yin Fengwei             2022-08-10  3965  
3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  3966) 		mapping = folio->mapping;
baa355fd331424 Kirill A. Shutemov      2016-07-26  3967  
baa355fd331424 Kirill A. Shutemov      2016-07-26  3968  		/* Truncated ? */
6384dd1d18de7b Zi Yan                  2025-03-07  3969  		/*
6384dd1d18de7b Zi Yan                  2025-03-07  3970  		 * TODO: add support for large shmem folio in swap cache.
6384dd1d18de7b Zi Yan                  2025-03-07  3971  		 * When shmem is in swap cache, mapping is NULL and
6384dd1d18de7b Zi Yan                  2025-03-07  3972  		 * folio_test_swapcache() is true.
6384dd1d18de7b Zi Yan                  2025-03-07  3973  		 */
baa355fd331424 Kirill A. Shutemov      2016-07-26  3974  		if (!mapping) {
baa355fd331424 Kirill A. Shutemov      2016-07-26  3975  			ret = -EBUSY;
baa355fd331424 Kirill A. Shutemov      2016-07-26  3976  			goto out;
baa355fd331424 Kirill A. Shutemov      2016-07-26  3977  		}
baa355fd331424 Kirill A. Shutemov      2016-07-26  3978  
e220917fa50774 Luis Chamberlain        2024-08-22  3979  		min_order = mapping_min_folio_order(folio->mapping);
e220917fa50774 Luis Chamberlain        2024-08-22  3980  		if (new_order < min_order) {
e220917fa50774 Luis Chamberlain        2024-08-22  3981  			ret = -EINVAL;
e220917fa50774 Luis Chamberlain        2024-08-22  3982  			goto out;
e220917fa50774 Luis Chamberlain        2024-08-22  3983  		}
e220917fa50774 Luis Chamberlain        2024-08-22  3984  
6a3edd29395631 Yin Fengwei             2022-08-10  3985  		gfp = current_gfp_context(mapping_gfp_mask(mapping) &
6a3edd29395631 Yin Fengwei             2022-08-10  3986  							GFP_RECLAIM_MASK);
6a3edd29395631 Yin Fengwei             2022-08-10  3987  
0201ebf274a306 David Howells           2023-06-28  3988  		if (!filemap_release_folio(folio, gfp)) {
6a3edd29395631 Yin Fengwei             2022-08-10  3989  			ret = -EBUSY;
6a3edd29395631 Yin Fengwei             2022-08-10  3990  			goto out;
6a3edd29395631 Yin Fengwei             2022-08-10  3991  		}
6a3edd29395631 Yin Fengwei             2022-08-10  3992  
3c844d850e4486 Wei Yang                2025-11-06  3993  		if (split_type == SPLIT_TYPE_UNIFORM) {
58729c04cf1092 Zi Yan                  2025-03-07  3994  			xas_set_order(&xas, folio->index, new_order);
8ec26327c18e1d Wei Yang                2025-10-10  3995  			xas_split_alloc(&xas, folio, old_order, gfp);
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3996) 			if (xas_error(&xas)) {
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3997) 				ret = xas_error(&xas);
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3998) 				goto out;
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3999) 			}
58729c04cf1092 Zi Yan                  2025-03-07  4000  		}
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4001) 
baa355fd331424 Kirill A. Shutemov      2016-07-26  4002  		anon_vma = NULL;
baa355fd331424 Kirill A. Shutemov      2016-07-26  4003  		i_mmap_lock_read(mapping);
006d3ff27e884f Hugh Dickins            2018-11-30  4004  
006d3ff27e884f Hugh Dickins            2018-11-30  4005  		/*
58729c04cf1092 Zi Yan                  2025-03-07  4006  		 *__split_unmapped_folio() may need to trim off pages beyond
58729c04cf1092 Zi Yan                  2025-03-07  4007  		 * EOF: but on 32-bit, i_size_read() takes an irq-unsafe
58729c04cf1092 Zi Yan                  2025-03-07  4008  		 * seqlock, which cannot be nested inside the page tree lock.
58729c04cf1092 Zi Yan                  2025-03-07  4009  		 * So note end now: i_size itself may be changed at any moment,
58729c04cf1092 Zi Yan                  2025-03-07  4010  		 * but folio lock is good enough to serialize the trimming.
006d3ff27e884f Hugh Dickins            2018-11-30  4011  		 */
006d3ff27e884f Hugh Dickins            2018-11-30  4012  		end = DIV_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE);
d144bf6205342a Hugh Dickins            2021-09-02  4013  		if (shmem_mapping(mapping))
d144bf6205342a Hugh Dickins            2021-09-02  4014  			end = shmem_fallocend(mapping->host, end);
baa355fd331424 Kirill A. Shutemov      2016-07-26  4015  	}
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4016  
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4017  	/*
684555aacc90d7 Matthew Wilcox (Oracle  2022-09-02  4018) 	 * Racy check if we can split the page, before unmap_folio() will
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4019  	 * split PMDs
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4020  	 */
8710f6ed34e7bc David Hildenbrand       2024-08-02  4021  	if (!can_split_folio(folio, 1, &extra_pins)) {
fd4a7ac32918d3 Baolin Wang             2022-10-24  4022  		ret = -EAGAIN;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4023  		goto out_unlock;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4024  	}
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4025  
684555aacc90d7 Matthew Wilcox (Oracle  2022-09-02  4026) 	unmap_folio(folio);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4027  
b6769834aac1d4 Alex Shi                2020-12-15  4028  	/* block interrupt reentry in xa_lock and spinlock */
b6769834aac1d4 Alex Shi                2020-12-15  4029  	local_irq_disable();
baa355fd331424 Kirill A. Shutemov      2016-07-26  4030  	if (mapping) {
baa355fd331424 Kirill A. Shutemov      2016-07-26  4031  		/*
3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  4032) 		 * Check if the folio is present in page cache.
3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  4033) 		 * We assume all tail are present too, if folio is there.
baa355fd331424 Kirill A. Shutemov      2016-07-26  4034  		 */
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4035) 		xas_lock(&xas);
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4036) 		xas_reset(&xas);
391dc7f40590d7 Zi Yan                  2025-07-18  4037  		if (xas_load(&xas) != folio) {
391dc7f40590d7 Zi Yan                  2025-07-18  4038  			ret = -EAGAIN;
baa355fd331424 Kirill A. Shutemov      2016-07-26  4039  			goto fail;
baa355fd331424 Kirill A. Shutemov      2016-07-26  4040  		}
391dc7f40590d7 Zi Yan                  2025-07-18  4041  	}
baa355fd331424 Kirill A. Shutemov      2016-07-26  4042  
f6b1f167ffe29f Balbir Singh            2025-11-14  4043  	ret = __folio_freeze_and_split_unmapped(folio, new_order, split_at, &xas, mapping,
f6b1f167ffe29f Balbir Singh            2025-11-14 @4044  						true, list, split_type, end, extra_pins);
391dc7f40590d7 Zi Yan                  2025-07-18  4045  fail:
6c7de9c83be68b Zi Yan                  2025-07-18 @4046  	if (mapping)
6c7de9c83be68b Zi Yan                  2025-07-18  4047  		xas_unlock(&xas);
6c7de9c83be68b Zi Yan                  2025-07-18  4048  
6c7de9c83be68b Zi Yan                  2025-07-18  4049  	local_irq_enable();
6c7de9c83be68b Zi Yan                  2025-07-18  4050  
391dc7f40590d7 Zi Yan                  2025-07-18  4051  	if (nr_shmem_dropped)
391dc7f40590d7 Zi Yan                  2025-07-18 @4052  		shmem_uncharge(mapping->host, nr_shmem_dropped);
6c7de9c83be68b Zi Yan                  2025-07-18  4053  
958fea4c1e2eb6 Balbir Singh            2025-10-01  4054  	if (!ret && is_anon && !folio_is_device_private(folio))
391dc7f40590d7 Zi Yan                  2025-07-18  4055  		remap_flags = RMP_USE_SHARED_ZEROPAGE;
958fea4c1e2eb6 Balbir Singh            2025-10-01  4056  
8ec26327c18e1d Wei Yang                2025-10-10  4057  	remap_page(folio, 1 << old_order, remap_flags);
6c7de9c83be68b Zi Yan                  2025-07-18  4058  
6c7de9c83be68b Zi Yan                  2025-07-18  4059  	/*
6c7de9c83be68b Zi Yan                  2025-07-18  4060  	 * Unlock all after-split folios except the one containing
6c7de9c83be68b Zi Yan                  2025-07-18  4061  	 * @lock_at page. If @folio is not split, it will be kept locked.
6c7de9c83be68b Zi Yan                  2025-07-18  4062  	 */
391dc7f40590d7 Zi Yan                  2025-07-18  4063  	for (new_folio = folio; new_folio != end_folio; new_folio = next) {
6c7de9c83be68b Zi Yan                  2025-07-18  4064  		next = folio_next(new_folio);
6c7de9c83be68b Zi Yan                  2025-07-18  4065  		if (new_folio == page_folio(lock_at))
6c7de9c83be68b Zi Yan                  2025-07-18  4066  			continue;
6c7de9c83be68b Zi Yan                  2025-07-18  4067  
6c7de9c83be68b Zi Yan                  2025-07-18  4068  		folio_unlock(new_folio);
6c7de9c83be68b Zi Yan                  2025-07-18  4069  		/*
6c7de9c83be68b Zi Yan                  2025-07-18  4070  		 * Subpages may be freed if there wasn't any mapping
6c7de9c83be68b Zi Yan                  2025-07-18  4071  		 * like if add_to_swap() is running on a lru page that
6c7de9c83be68b Zi Yan                  2025-07-18  4072  		 * had its mapping zapped. And freeing these pages
6c7de9c83be68b Zi Yan                  2025-07-18  4073  		 * requires taking the lru_lock so we do the put_page
6c7de9c83be68b Zi Yan                  2025-07-18  4074  		 * of the tail pages after the split is complete.
6c7de9c83be68b Zi Yan                  2025-07-18  4075  		 */
6c7de9c83be68b Zi Yan                  2025-07-18  4076  		free_folio_and_swap_cache(new_folio);
6c7de9c83be68b Zi Yan                  2025-07-18  4077  	}
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4078  
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4079  out_unlock:
baa355fd331424 Kirill A. Shutemov      2016-07-26  4080  	if (anon_vma) {
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4081  		anon_vma_unlock_write(anon_vma);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4082  		put_anon_vma(anon_vma);
baa355fd331424 Kirill A. Shutemov      2016-07-26  4083  	}
baa355fd331424 Kirill A. Shutemov      2016-07-26  4084  	if (mapping)
baa355fd331424 Kirill A. Shutemov      2016-07-26  4085  		i_mmap_unlock_read(mapping);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4086  out:
69a37a8ba1b408 Matthew Wilcox (Oracle  2022-06-08  4087) 	xas_destroy(&xas);
8ec26327c18e1d Wei Yang                2025-10-10  4088  	if (old_order == HPAGE_PMD_ORDER)
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4089  		count_vm_event(!ret ? THP_SPLIT_PAGE : THP_SPLIT_PAGE_FAILED);
8ec26327c18e1d Wei Yang                2025-10-10  4090  	count_mthp_stat(old_order, !ret ? MTHP_STAT_SPLIT : MTHP_STAT_SPLIT_FAILED);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4091  	return ret;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4092  }
9a982250f773cc Kirill A. Shutemov      2016-01-15  4093  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
