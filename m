Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6D9359A91
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639888; cv=none; b=NshCUeHEHnTfdLCV0L3HeY9yKCN0EmfObR6gsogx0U7/OQO489XzkRzmgFLoBRJz+dWPMg+KM4Q4Nbjze99113N4QtP9IvgEXjx0kezP4GPlZdoam4Ak9TRJHwIrxK7S0rw4QQ74oZqw0WToVxLdX+fl4pazAYkFOAaCn/TTNr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639888; c=relaxed/simple;
	bh=oh0jqvbBIHXZhJ3bfjoZn9eZhFkVl4E251Xs9gS+CdE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jsi0xXT6mkIjlwMEJmbnEwQE3Hf9UVD7Qeh7E0ZUlKr4jg2Z1U3lgAN2YEP0YWZz/5daWr32GOu4BDhZBiWAetG2fxByVGIBgez2Tb7uixLkdwvQAU4W8Awl3uKVwsppAhAO50dt9wL8cmEl38WBqf8+yfnPLN+3wBJt24Z6gZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frZPPOxD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frZPPOxD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772639886; x=1804175886;
  h=date:from:to:cc:subject:message-id;
  bh=oh0jqvbBIHXZhJ3bfjoZn9eZhFkVl4E251Xs9gS+CdE=;
  b=frZPPOxDLhla0dS7gxoLGMblByBvUxgDtQEep48A2XLkNRRnnqvqp80x
   H/ndyQXlQ6UAQ4lJG3grojjuICRdrs8mompmeCjdmKlFUtwz8ma/PW9j0
   R0R/rnyFwRFXtUOnuapqYOUyWc/2AQ8B2Fh5WhhK0Vol9rKCUTxr5H3RK
   /NNFV9xnl0/9xCsXFoM1QsAkehOiGN3I4atdYgnL+G1VzX4EsY4In6PZM
   KBporjY7dGW1idrkw7Y6NwLZH9L6M+PLEWTEzdNUHtex2AJi9aJGyBfnP
   xJLzGD/YdESLLt9jE2Ij7BsXE6qwI6j83fBpjU8CaM8CPyNQpdMBzf0w+
   Q==;
X-CSE-ConnectionGUID: A5OMP1LSTjaByVWO/wIcWQ==
X-CSE-MsgGUID: zghviVS3RiaM+MV8YEL4PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85175022"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="85175022"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 07:58:03 -0800
X-CSE-ConnectionGUID: 0qVsXvlFQJCl1Z+xOc4IvQ==
X-CSE-MsgGUID: 3DguzKKwRg+w29TDSv4ELQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217611449"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2026 07:58:01 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxobn-0000000040P-0iJV;
	Wed, 04 Mar 2026 15:57:59 +0000
Date: Wed, 04 Mar 2026 23:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/huge_memory.c:4052 __folio_split() error: we previously
 assumed 'mapping' could be null (see line 4046)
Message-ID: <202603042348.HpOrFpFN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Balbir Singh <balbirs@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0031c06807cfa8aa51a759ff8aa09e1aa48149af
commit: cab812d9c9642ec11b8961b7ea994f4bd0826159 mm/huge_memory.c: introduce folio_split_unmapped
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: sparc64-randconfig-r073-20260304 (https://download.01.org/0day-ci/archive/20260304/202603042348.HpOrFpFN-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603042348.HpOrFpFN-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:4052 __folio_split() error: we previously assumed 'mapping' could be null (see line 4046)

vim +/mapping +4052 mm/huge_memory.c

cab812d9c9642e Balbir Singh            2025-11-14  3887  
50d0598cf2c9d3 Zi Yan                  2025-10-31  3888  /**
50d0598cf2c9d3 Zi Yan                  2025-10-31  3889   * __folio_split() - split a folio at @split_at to a @new_order folio
58729c04cf1092 Zi Yan                  2025-03-07  3890   * @folio: folio to split
58729c04cf1092 Zi Yan                  2025-03-07  3891   * @new_order: the order of the new folio
58729c04cf1092 Zi Yan                  2025-03-07  3892   * @split_at: a page within the new folio
58729c04cf1092 Zi Yan                  2025-03-07  3893   * @lock_at: a page within @folio to be left locked to caller
58729c04cf1092 Zi Yan                  2025-03-07  3894   * @list: after-split folios will be put on it if non NULL
c467061fbb6eb4 Wei Yang                2025-11-06  3895   * @split_type: perform uniform split or not (non-uniform split)
58729c04cf1092 Zi Yan                  2025-03-07  3896   *
58729c04cf1092 Zi Yan                  2025-03-07  3897   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
58729c04cf1092 Zi Yan                  2025-03-07  3898   * It is in charge of checking whether the split is supported or not and
58729c04cf1092 Zi Yan                  2025-03-07  3899   * preparing @folio for __split_unmapped_folio().
58729c04cf1092 Zi Yan                  2025-03-07  3900   *
6c7de9c83be68b Zi Yan                  2025-07-18  3901   * After splitting, the after-split folio containing @lock_at remains locked
6c7de9c83be68b Zi Yan                  2025-07-18  3902   * and others are unlocked:
6c7de9c83be68b Zi Yan                  2025-07-18  3903   * 1. for uniform split, @lock_at points to one of @folio's subpages;
6c7de9c83be68b Zi Yan                  2025-07-18  3904   * 2. for buddy allocator like (non-uniform) split, @lock_at points to @folio.
6c7de9c83be68b Zi Yan                  2025-07-18  3905   *
50d0598cf2c9d3 Zi Yan                  2025-10-31  3906   * Return: 0 - successful, <0 - failed (if -ENOMEM is returned, @folio might be
58729c04cf1092 Zi Yan                  2025-03-07  3907   * split but not to @new_order, the caller needs to check)
58729c04cf1092 Zi Yan                  2025-03-07  3908   */
6384dd1d18de7b Zi Yan                  2025-03-07  3909  static int __folio_split(struct folio *folio, unsigned int new_order,
58729c04cf1092 Zi Yan                  2025-03-07  3910  		struct page *split_at, struct page *lock_at,
cab812d9c9642e Balbir Singh            2025-11-14  3911  		struct list_head *list, enum split_type split_type)
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3912  {
58729c04cf1092 Zi Yan                  2025-03-07  3913  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
6c7de9c83be68b Zi Yan                  2025-07-18  3914  	struct folio *end_folio = folio_next(folio);
5d65c8d758f259 Barry Song              2024-08-24  3915  	bool is_anon = folio_test_anon(folio);
baa355fd331424 Kirill A. Shutemov      2016-07-26  3916  	struct address_space *mapping = NULL;
5d65c8d758f259 Barry Song              2024-08-24  3917  	struct anon_vma *anon_vma = NULL;
d87f4a8f19668c Wei Yang                2025-10-10  3918  	int old_order = folio_order(folio);
6c7de9c83be68b Zi Yan                  2025-07-18  3919  	struct folio *new_folio, *next;
391dc7f40590d7 Zi Yan                  2025-07-18  3920  	int nr_shmem_dropped = 0;
391dc7f40590d7 Zi Yan                  2025-07-18  3921  	int remap_flags = 0;
504e070dc08f75 Yang Shi                2021-06-15  3922  	int extra_pins, ret;
cab812d9c9642e Balbir Singh            2025-11-14  3923  	pgoff_t end = 0;
478d134e9506c7 Xu Yu                   2022-04-28  3924  	bool is_hzp;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3925  
714b056c832106 Zi Yan                  2025-07-17  3926  	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
714b056c832106 Zi Yan                  2025-07-17  3927  	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3928  
58729c04cf1092 Zi Yan                  2025-03-07  3929  	if (folio != page_folio(split_at) || folio != page_folio(lock_at))
1412ecb3d256e5 Zi Yan                  2024-03-07  3930  		return -EINVAL;
1412ecb3d256e5 Zi Yan                  2024-03-07  3931  
cff47b9e39a6ab Wei Yang                2025-11-19  3932  	/*
cff47b9e39a6ab Wei Yang                2025-11-19  3933  	 * Folios that just got truncated cannot get split. Signal to the
cff47b9e39a6ab Wei Yang                2025-11-19  3934  	 * caller that there was a race.
cff47b9e39a6ab Wei Yang                2025-11-19  3935  	 *
cff47b9e39a6ab Wei Yang                2025-11-19  3936  	 * TODO: this will also currently refuse shmem folios that are in the
cff47b9e39a6ab Wei Yang                2025-11-19  3937  	 * swapcache.
cff47b9e39a6ab Wei Yang                2025-11-19  3938  	 */
cff47b9e39a6ab Wei Yang                2025-11-19  3939  	if (!is_anon && !folio->mapping)
cff47b9e39a6ab Wei Yang                2025-11-19  3940  		return -EBUSY;
cff47b9e39a6ab Wei Yang                2025-11-19  3941  
d87f4a8f19668c Wei Yang                2025-10-10  3942  	if (new_order >= old_order)
c010d47f107f60 Zi Yan                  2024-02-26  3943  		return -EINVAL;
58729c04cf1092 Zi Yan                  2025-03-07  3944  
8a0e4bdddd1c99 Wei Yang                2025-11-06  3945  	if (!folio_split_supported(folio, new_order, split_type, /* warn = */ true))
6a50c9b512f773 Ran Xiaokai             2024-06-07  3946  		return -EINVAL;
c010d47f107f60 Zi Yan                  2024-02-26  3947  
5beaee54a324ba Matthew Wilcox (Oracle  2024-03-26  3948) 	is_hzp = is_huge_zero_folio(folio);
4737edbbdd4958 Naoya Horiguchi         2023-04-06  3949  	if (is_hzp) {
4737edbbdd4958 Naoya Horiguchi         2023-04-06  3950  		pr_warn_ratelimited("Called split_huge_page for huge zero page\n");
478d134e9506c7 Xu Yu                   2022-04-28  3951  		return -EBUSY;
4737edbbdd4958 Naoya Horiguchi         2023-04-06  3952  	}
478d134e9506c7 Xu Yu                   2022-04-28  3953  
3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  3954) 	if (folio_test_writeback(folio))
59807685a7e77e Ying Huang              2017-09-06  3955  		return -EBUSY;
59807685a7e77e Ying Huang              2017-09-06  3956  
5d65c8d758f259 Barry Song              2024-08-24  3957  	if (is_anon) {
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3958  		/*
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  3959  		 * The caller does not necessarily hold an mmap_lock that would
baa355fd331424 Kirill A. Shutemov      2016-07-26  3960  		 * prevent the anon_vma disappearing so we first we take a
baa355fd331424 Kirill A. Shutemov      2016-07-26  3961  		 * reference to it and then lock the anon_vma for write. This
2f031c6f042cb8 Matthew Wilcox (Oracle  2022-01-29  3962) 		 * is similar to folio_lock_anon_vma_read except the write lock
baa355fd331424 Kirill A. Shutemov      2016-07-26  3963  		 * is taken to serialise against parallel split or collapse
baa355fd331424 Kirill A. Shutemov      2016-07-26  3964  		 * operations.
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3965  		 */
29eea9b5a9c9ec Matthew Wilcox (Oracle  2022-09-02  3966) 		anon_vma = folio_get_anon_vma(folio);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3967  		if (!anon_vma) {
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3968  			ret = -EBUSY;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3969  			goto out;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3970  		}
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3971  		anon_vma_lock_write(anon_vma);
4265d67e405a41 Balbir Singh            2025-10-01  3972  		mapping = NULL;
baa355fd331424 Kirill A. Shutemov      2016-07-26  3973  	} else {
e220917fa50774 Luis Chamberlain        2024-08-22  3974  		unsigned int min_order;
6a3edd29395631 Yin Fengwei             2022-08-10  3975  		gfp_t gfp;
6a3edd29395631 Yin Fengwei             2022-08-10  3976  
3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  3977) 		mapping = folio->mapping;
e220917fa50774 Luis Chamberlain        2024-08-22  3978  		min_order = mapping_min_folio_order(folio->mapping);
e220917fa50774 Luis Chamberlain        2024-08-22  3979  		if (new_order < min_order) {
e220917fa50774 Luis Chamberlain        2024-08-22  3980  			ret = -EINVAL;
e220917fa50774 Luis Chamberlain        2024-08-22  3981  			goto out;
e220917fa50774 Luis Chamberlain        2024-08-22  3982  		}
e220917fa50774 Luis Chamberlain        2024-08-22  3983  
6a3edd29395631 Yin Fengwei             2022-08-10  3984  		gfp = current_gfp_context(mapping_gfp_mask(mapping) &
6a3edd29395631 Yin Fengwei             2022-08-10  3985  							GFP_RECLAIM_MASK);
6a3edd29395631 Yin Fengwei             2022-08-10  3986  
0201ebf274a306 David Howells           2023-06-28  3987  		if (!filemap_release_folio(folio, gfp)) {
6a3edd29395631 Yin Fengwei             2022-08-10  3988  			ret = -EBUSY;
6a3edd29395631 Yin Fengwei             2022-08-10  3989  			goto out;
6a3edd29395631 Yin Fengwei             2022-08-10  3990  		}
6a3edd29395631 Yin Fengwei             2022-08-10  3991  
c467061fbb6eb4 Wei Yang                2025-11-06  3992  		if (split_type == SPLIT_TYPE_UNIFORM) {
58729c04cf1092 Zi Yan                  2025-03-07  3993  			xas_set_order(&xas, folio->index, new_order);
d87f4a8f19668c Wei Yang                2025-10-10  3994  			xas_split_alloc(&xas, folio, old_order, gfp);
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3995) 			if (xas_error(&xas)) {
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3996) 				ret = xas_error(&xas);
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3997) 				goto out;
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3998) 			}
58729c04cf1092 Zi Yan                  2025-03-07  3999  		}
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4000) 
baa355fd331424 Kirill A. Shutemov      2016-07-26  4001  		anon_vma = NULL;
baa355fd331424 Kirill A. Shutemov      2016-07-26  4002  		i_mmap_lock_read(mapping);
006d3ff27e884f Hugh Dickins            2018-11-30  4003  
006d3ff27e884f Hugh Dickins            2018-11-30  4004  		/*
58729c04cf1092 Zi Yan                  2025-03-07  4005  		 *__split_unmapped_folio() may need to trim off pages beyond
58729c04cf1092 Zi Yan                  2025-03-07  4006  		 * EOF: but on 32-bit, i_size_read() takes an irq-unsafe
58729c04cf1092 Zi Yan                  2025-03-07  4007  		 * seqlock, which cannot be nested inside the page tree lock.
58729c04cf1092 Zi Yan                  2025-03-07  4008  		 * So note end now: i_size itself may be changed at any moment,
58729c04cf1092 Zi Yan                  2025-03-07  4009  		 * but folio lock is good enough to serialize the trimming.
006d3ff27e884f Hugh Dickins            2018-11-30  4010  		 */
006d3ff27e884f Hugh Dickins            2018-11-30  4011  		end = DIV_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE);
d144bf6205342a Hugh Dickins            2021-09-02  4012  		if (shmem_mapping(mapping))
d144bf6205342a Hugh Dickins            2021-09-02  4013  			end = shmem_fallocend(mapping->host, end);
baa355fd331424 Kirill A. Shutemov      2016-07-26  4014  	}
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4015  
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4016  	/*
684555aacc90d7 Matthew Wilcox (Oracle  2022-09-02  4017) 	 * Racy check if we can split the page, before unmap_folio() will
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4018  	 * split PMDs
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4019  	 */
8710f6ed34e7bc David Hildenbrand       2024-08-02  4020  	if (!can_split_folio(folio, 1, &extra_pins)) {
fd4a7ac32918d3 Baolin Wang             2022-10-24  4021  		ret = -EAGAIN;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4022  		goto out_unlock;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4023  	}
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4024  
684555aacc90d7 Matthew Wilcox (Oracle  2022-09-02  4025) 	unmap_folio(folio);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4026  
b6769834aac1d4 Alex Shi                2020-12-15  4027  	/* block interrupt reentry in xa_lock and spinlock */
b6769834aac1d4 Alex Shi                2020-12-15  4028  	local_irq_disable();
baa355fd331424 Kirill A. Shutemov      2016-07-26  4029  	if (mapping) {
baa355fd331424 Kirill A. Shutemov      2016-07-26  4030  		/*
3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  4031) 		 * Check if the folio is present in page cache.
3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  4032) 		 * We assume all tail are present too, if folio is there.
baa355fd331424 Kirill A. Shutemov      2016-07-26  4033  		 */
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4034) 		xas_lock(&xas);
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4035) 		xas_reset(&xas);
391dc7f40590d7 Zi Yan                  2025-07-18  4036  		if (xas_load(&xas) != folio) {
391dc7f40590d7 Zi Yan                  2025-07-18  4037  			ret = -EAGAIN;
baa355fd331424 Kirill A. Shutemov      2016-07-26  4038  			goto fail;
baa355fd331424 Kirill A. Shutemov      2016-07-26  4039  		}
391dc7f40590d7 Zi Yan                  2025-07-18  4040  	}
baa355fd331424 Kirill A. Shutemov      2016-07-26  4041  
cab812d9c9642e Balbir Singh            2025-11-14  4042  	ret = __folio_freeze_and_split_unmapped(folio, new_order, split_at, &xas, mapping,
cab812d9c9642e Balbir Singh            2025-11-14  4043  						true, list, split_type, end, &nr_shmem_dropped,
cab812d9c9642e Balbir Singh            2025-11-14  4044  						extra_pins);
391dc7f40590d7 Zi Yan                  2025-07-18  4045  fail:
6c7de9c83be68b Zi Yan                  2025-07-18 @4046  	if (mapping)
6c7de9c83be68b Zi Yan                  2025-07-18  4047  		xas_unlock(&xas);
6c7de9c83be68b Zi Yan                  2025-07-18  4048  
6c7de9c83be68b Zi Yan                  2025-07-18  4049  	local_irq_enable();
6c7de9c83be68b Zi Yan                  2025-07-18  4050  
391dc7f40590d7 Zi Yan                  2025-07-18  4051  	if (nr_shmem_dropped)
391dc7f40590d7 Zi Yan                  2025-07-18 @4052  		shmem_uncharge(mapping->host, nr_shmem_dropped);
6c7de9c83be68b Zi Yan                  2025-07-18  4053  
1462872900233e Balbir Singh            2025-10-01  4054  	if (!ret && is_anon && !folio_is_device_private(folio))
391dc7f40590d7 Zi Yan                  2025-07-18  4055  		remap_flags = RMP_USE_SHARED_ZEROPAGE;
1462872900233e Balbir Singh            2025-10-01  4056  
d87f4a8f19668c Wei Yang                2025-10-10  4057  	remap_page(folio, 1 << old_order, remap_flags);
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
d87f4a8f19668c Wei Yang                2025-10-10  4088  	if (old_order == HPAGE_PMD_ORDER)
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4089  		count_vm_event(!ret ? THP_SPLIT_PAGE : THP_SPLIT_PAGE_FAILED);
d87f4a8f19668c Wei Yang                2025-10-10  4090  	count_mthp_stat(old_order, !ret ? MTHP_STAT_SPLIT : MTHP_STAT_SPLIT_FAILED);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4091  	return ret;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4092  }
9a982250f773cc Kirill A. Shutemov      2016-01-15  4093  

:::::: The code at line 4052 was first introduced by commit
:::::: 391dc7f40590d793f0e5214b6e9324b1af8fa40d mm/huge_memory: deduplicate code in __folio_split()

:::::: TO: Zi Yan <ziy@nvidia.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
