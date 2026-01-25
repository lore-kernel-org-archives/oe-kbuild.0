Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E34311960
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 05:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769320618; cv=none; b=pAF2H0Qh1/zxWucFylpsCR8g5FOuhNblNQcDhP5q03T5u9iqHrmJOaAk/5UAdSWfMKUCTgcTyFRYse5Q5QB42WGvS4rbq6109bb1V2SS44QE64AZfpXXjQIOyfIjiaz/T9Q7Jz6aA/PF93xykflwRnjiPhmaVXJfLd2MJ63qS24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769320618; c=relaxed/simple;
	bh=Sk67NMHhoPHGhwNcs69gWJ9Z+5zPMSc0tebYX8GKl5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZlhPVpwSTZNNeudNt1liZSML0HaL8HZ/RSUx5u/RBsfRjyNMIFvzCDfz7C+IhFK05vlvJ2Iclp+auQscgUJzq2sHRmnWvlrNOa82A5a7Hv+KrIaBcem5LQWtb21kAqCpslvOkGQN1kcfdF21t67/bWkP/6JlWf/aV5reSTEatI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjaqCh7e; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjaqCh7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769320616; x=1800856616;
  h=date:from:to:cc:subject:message-id;
  bh=Sk67NMHhoPHGhwNcs69gWJ9Z+5zPMSc0tebYX8GKl5M=;
  b=PjaqCh7eBBSLDelMBfCGZ3YAuxfNIHtlhY/Cd3dCRh6u/oRrPNmSD2IC
   PkKToqbgRR3G0z06ij4wL15b21KsBcz48NHluchOYHVBhXSbZ2CIY1Uv3
   KGI0zn0iG5SOlUg/pwopY65z/fEdFkVUugocLSjpmt50MLTAY+KHt2SN3
   /rmd03mSXQy/22YHAJDJ1BSElYGV+6ERGzDswDBw+/CAh+cQXhqkBkVmL
   aYYzqeb7Wl6ooQuoSXxlBqS2zxsZYHvAaPWasARgX6pGwOuO76Rooxnw+
   JDaF3FvkBVc5mb4DCRScUUVdrW3Cc6qzM8M2Ce1mvTEU8V42El7vV8iv8
   A==;
X-CSE-ConnectionGUID: JylBew6UQy2V2EKJPD6r0w==
X-CSE-MsgGUID: vy46Hu3UQZmr2PPSnlZAoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70240946"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70240946"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 21:56:53 -0800
X-CSE-ConnectionGUID: rOogKh0wRfOouNWE9Ndetg==
X-CSE-MsgGUID: 3ngHsd8eTMqQK+GqedHWOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="212243471"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jan 2026 21:56:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjt7B-00000000Vp2-0MUT;
	Sun, 25 Jan 2026 05:56:49 +0000
Date: Sun, 25 Jan 2026 13:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 198/198]
 mm/hugetlb.c:4689 hugetlb_fault() warn: inconsistent returns
 '&mapping->i_mmap_rwsem'.
Message-ID: <202601251305.7isJke00-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   23658a471d5af4e7b9df0559075c0b57bbf22a67
commit: 45c33966759ea1b4040c08dacda99ef623c0ca29 [198/198] mm: hugetlb: fix UAF in hugetlb_handle_userfault
:::::: branch date: 17 hours ago
:::::: commit date: 3 years, 3 months ago
config: i386-randconfig-141-20260125 (https://download.01.org/0day-ci/archive/20260125/202601251305.7isJke00-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601251305.7isJke00-lkp@intel.com/

smatch warnings:
mm/hugetlb.c:4689 hugetlb_fault() warn: inconsistent returns '&mapping->i_mmap_rwsem'.

vim +4689 mm/hugetlb.c

8382d914ebf720 Davidlohr Bueso    2014-04-03  4533  
2b7403035459c7 Souptick Joarder   2018-08-23  4534  vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
788c7df451467d Hugh Dickins       2009-06-23  4535  			unsigned long address, unsigned int flags)
86e5216f8d8aa2 Adam Litke         2006-01-06  4536  {
8382d914ebf720 Davidlohr Bueso    2014-04-03  4537  	pte_t *ptep, entry;
cb900f41215447 Kirill A. Shutemov 2013-11-14  4538  	spinlock_t *ptl;
2b7403035459c7 Souptick Joarder   2018-08-23  4539  	vm_fault_t ret;
8382d914ebf720 Davidlohr Bueso    2014-04-03  4540  	u32 hash;
8382d914ebf720 Davidlohr Bueso    2014-04-03  4541  	pgoff_t idx;
0fe6e20b9c4c53 Naoya Horiguchi    2010-05-28  4542  	struct page *page = NULL;
57303d80175e10 Andy Whitcroft     2008-08-12  4543  	struct page *pagecache_page = NULL;
a5516438959d90 Andi Kleen         2008-07-23  4544  	struct hstate *h = hstate_vma(vma);
8382d914ebf720 Davidlohr Bueso    2014-04-03  4545  	struct address_space *mapping;
0f792cf949a0be Naoya Horiguchi    2015-02-11  4546  	int need_wait_lock = 0;
285b8dcaacfc36 Huang Ying         2018-06-07  4547  	unsigned long haddr = address & huge_page_mask(h);
86e5216f8d8aa2 Adam Litke         2006-01-06  4548  
285b8dcaacfc36 Huang Ying         2018-06-07  4549  	ptep = huge_pte_offset(mm, haddr, huge_page_size(h));
fd6a03edd271cf Naoya Horiguchi    2010-05-28  4550  	if (ptep) {
c0d0381ade7988 Mike Kravetz       2020-04-01  4551  		/*
c0d0381ade7988 Mike Kravetz       2020-04-01  4552  		 * Since we hold no locks, ptep could be stale.  That is
c0d0381ade7988 Mike Kravetz       2020-04-01  4553  		 * OK as we are only making decisions based on content and
c0d0381ade7988 Mike Kravetz       2020-04-01  4554  		 * not actually modifying content here.
c0d0381ade7988 Mike Kravetz       2020-04-01  4555  		 */
fd6a03edd271cf Naoya Horiguchi    2010-05-28  4556  		entry = huge_ptep_get(ptep);
290408d4a25002 Naoya Horiguchi    2010-09-08  4557  		if (unlikely(is_hugetlb_entry_migration(entry))) {
cb900f41215447 Kirill A. Shutemov 2013-11-14  4558  			migration_entry_wait_huge(vma, mm, ptep);
290408d4a25002 Naoya Horiguchi    2010-09-08  4559  			return 0;
290408d4a25002 Naoya Horiguchi    2010-09-08  4560  		} else if (unlikely(is_hugetlb_entry_hwpoisoned(entry)))
aa50d3a7aa8147 Andi Kleen         2010-10-06  4561  			return VM_FAULT_HWPOISON_LARGE |
972dc4de13f667 Aneesh Kumar K.V   2012-07-31  4562  				VM_FAULT_SET_HINDEX(hstate_index(h));
b43a9990055958 Mike Kravetz       2018-12-28  4563  	}
8382d914ebf720 Davidlohr Bueso    2014-04-03  4564  
c0d0381ade7988 Mike Kravetz       2020-04-01  4565  	/*
c0d0381ade7988 Mike Kravetz       2020-04-01  4566  	 * Acquire i_mmap_rwsem before calling huge_pte_alloc and hold
87bf91d39bb52b Mike Kravetz       2020-04-01  4567  	 * until finished with ptep.  This serves two purposes:
87bf91d39bb52b Mike Kravetz       2020-04-01  4568  	 * 1) It prevents huge_pmd_unshare from being called elsewhere
87bf91d39bb52b Mike Kravetz       2020-04-01  4569  	 *    and making the ptep no longer valid.
87bf91d39bb52b Mike Kravetz       2020-04-01  4570  	 * 2) It synchronizes us with i_size modifications during truncation.
c0d0381ade7988 Mike Kravetz       2020-04-01  4571  	 *
c0d0381ade7988 Mike Kravetz       2020-04-01  4572  	 * ptep could have already be assigned via huge_pte_offset.  That
c0d0381ade7988 Mike Kravetz       2020-04-01  4573  	 * is OK, as huge_pte_alloc will return the same value unless
c0d0381ade7988 Mike Kravetz       2020-04-01  4574  	 * something has changed.
c0d0381ade7988 Mike Kravetz       2020-04-01  4575  	 */
ddeaab32a89f04 Mike Kravetz       2019-01-08  4576  	mapping = vma->vm_file->f_mapping;
c0d0381ade7988 Mike Kravetz       2020-04-01  4577  	i_mmap_lock_read(mapping);
c0d0381ade7988 Mike Kravetz       2020-04-01  4578  	ptep = huge_pte_alloc(mm, haddr, huge_page_size(h));
c0d0381ade7988 Mike Kravetz       2020-04-01  4579  	if (!ptep) {
c0d0381ade7988 Mike Kravetz       2020-04-01  4580  		i_mmap_unlock_read(mapping);
c0d0381ade7988 Mike Kravetz       2020-04-01  4581  		return VM_FAULT_OOM;
c0d0381ade7988 Mike Kravetz       2020-04-01  4582  	}
ddeaab32a89f04 Mike Kravetz       2019-01-08  4583  
3935baa9bcda3c David Gibson       2006-03-22  4584  	/*
3935baa9bcda3c David Gibson       2006-03-22  4585  	 * Serialize hugepage allocation and instantiation, so that we don't
3935baa9bcda3c David Gibson       2006-03-22  4586  	 * get spurious allocation failures if two CPUs race to instantiate
3935baa9bcda3c David Gibson       2006-03-22  4587  	 * the same page in the page cache.
3935baa9bcda3c David Gibson       2006-03-22  4588  	 */
c0d0381ade7988 Mike Kravetz       2020-04-01  4589  	idx = vma_hugecache_offset(h, vma, haddr);
188b04a7d93860 Wei Yang           2019-11-30  4590  	hash = hugetlb_fault_mutex_hash(mapping, idx);
c672c7f29f2fdb Mike Kravetz       2015-09-08  4591  	mutex_lock(&hugetlb_fault_mutex_table[hash]);
8382d914ebf720 Davidlohr Bueso    2014-04-03  4592  
7f2e9525ba55b1 Gerald Schaefer    2008-04-28  4593  	entry = huge_ptep_get(ptep);
45c33966759ea1 Liu Shixin         2022-09-23  4594  	if (huge_pte_none(entry))
45c33966759ea1 Liu Shixin         2022-09-23  4595  		/*
45c33966759ea1 Liu Shixin         2022-09-23  4596  		 * hugetlb_no_page will drop vma lock and hugetlb fault
45c33966759ea1 Liu Shixin         2022-09-23  4597  		 * mutex internally, which make us return immediately.
45c33966759ea1 Liu Shixin         2022-09-23  4598  		 */
45c33966759ea1 Liu Shixin         2022-09-23  4599  		return hugetlb_no_page(mm, vma, mapping, idx, address, ptep, flags);
86e5216f8d8aa2 Adam Litke         2006-01-06  4600  
83c54070ee1a2d Nick Piggin        2007-07-19  4601  	ret = 0;
1e8f889b10d8d2 David Gibson       2006-01-06  4602  
0f792cf949a0be Naoya Horiguchi    2015-02-11  4603  	/*
0f792cf949a0be Naoya Horiguchi    2015-02-11  4604  	 * entry could be a migration/hwpoison entry at this point, so this
0f792cf949a0be Naoya Horiguchi    2015-02-11  4605  	 * check prevents the kernel from going below assuming that we have
7c8de3588972ed Ethon Paul         2020-06-04  4606  	 * an active hugepage in pagecache. This goto expects the 2nd page
7c8de3588972ed Ethon Paul         2020-06-04  4607  	 * fault, and is_hugetlb_entry_(migration|hwpoisoned) check will
7c8de3588972ed Ethon Paul         2020-06-04  4608  	 * properly handle it.
0f792cf949a0be Naoya Horiguchi    2015-02-11  4609  	 */
0f792cf949a0be Naoya Horiguchi    2015-02-11  4610  	if (!pte_present(entry))
0f792cf949a0be Naoya Horiguchi    2015-02-11  4611  		goto out_mutex;
0f792cf949a0be Naoya Horiguchi    2015-02-11  4612  
57303d80175e10 Andy Whitcroft     2008-08-12  4613  	/*
57303d80175e10 Andy Whitcroft     2008-08-12  4614  	 * If we are going to COW the mapping later, we examine the pending
57303d80175e10 Andy Whitcroft     2008-08-12  4615  	 * reservations for this page now. This will ensure that any
57303d80175e10 Andy Whitcroft     2008-08-12  4616  	 * allocations necessary to record that reservation occur outside the
57303d80175e10 Andy Whitcroft     2008-08-12  4617  	 * spinlock. For private mappings, we also lookup the pagecache
57303d80175e10 Andy Whitcroft     2008-08-12  4618  	 * page now as it is used to determine if a reservation has been
57303d80175e10 Andy Whitcroft     2008-08-12  4619  	 * consumed.
57303d80175e10 Andy Whitcroft     2008-08-12  4620  	 */
106c992a5ebef2 Gerald Schaefer    2013-04-29  4621  	if ((flags & FAULT_FLAG_WRITE) && !huge_pte_write(entry)) {
285b8dcaacfc36 Huang Ying         2018-06-07  4622  		if (vma_needs_reservation(h, vma, haddr) < 0) {
2b26736c88db85 Andy Whitcroft     2008-08-12  4623  			ret = VM_FAULT_OOM;
b4d1d99fdd8b98 David Gibson       2008-10-15  4624  			goto out_mutex;
2b26736c88db85 Andy Whitcroft     2008-08-12  4625  		}
5e9113731a3ce6 Mike Kravetz       2015-09-08  4626  		/* Just decrements count, does not deallocate */
285b8dcaacfc36 Huang Ying         2018-06-07  4627  		vma_end_reservation(h, vma, haddr);
57303d80175e10 Andy Whitcroft     2008-08-12  4628  
f83a275dbc5ca1 Mel Gorman         2009-05-28  4629  		if (!(vma->vm_flags & VM_MAYSHARE))
57303d80175e10 Andy Whitcroft     2008-08-12  4630  			pagecache_page = hugetlbfs_pagecache_page(h,
285b8dcaacfc36 Huang Ying         2018-06-07  4631  								vma, haddr);
57303d80175e10 Andy Whitcroft     2008-08-12  4632  	}
57303d80175e10 Andy Whitcroft     2008-08-12  4633  
0f792cf949a0be Naoya Horiguchi    2015-02-11  4634  	ptl = huge_pte_lock(h, mm, ptep);
0f792cf949a0be Naoya Horiguchi    2015-02-11  4635  
0f792cf949a0be Naoya Horiguchi    2015-02-11  4636  	/* Check for a racing update before calling hugetlb_cow */
0f792cf949a0be Naoya Horiguchi    2015-02-11  4637  	if (unlikely(!pte_same(entry, huge_ptep_get(ptep))))
0f792cf949a0be Naoya Horiguchi    2015-02-11  4638  		goto out_ptl;
0f792cf949a0be Naoya Horiguchi    2015-02-11  4639  
56c9cfb13c9b65 Naoya Horiguchi    2010-09-10  4640  	/*
56c9cfb13c9b65 Naoya Horiguchi    2010-09-10  4641  	 * hugetlb_cow() requires page locks of pte_page(entry) and
56c9cfb13c9b65 Naoya Horiguchi    2010-09-10  4642  	 * pagecache_page, so here we need take the former one
56c9cfb13c9b65 Naoya Horiguchi    2010-09-10  4643  	 * when page != pagecache_page or !pagecache_page.
56c9cfb13c9b65 Naoya Horiguchi    2010-09-10  4644  	 */
0fe6e20b9c4c53 Naoya Horiguchi    2010-05-28  4645  	page = pte_page(entry);
56c9cfb13c9b65 Naoya Horiguchi    2010-09-10  4646  	if (page != pagecache_page)
0f792cf949a0be Naoya Horiguchi    2015-02-11  4647  		if (!trylock_page(page)) {
0f792cf949a0be Naoya Horiguchi    2015-02-11  4648  			need_wait_lock = 1;
cb900f41215447 Kirill A. Shutemov 2013-11-14  4649  			goto out_ptl;
0f792cf949a0be Naoya Horiguchi    2015-02-11  4650  		}
b4d1d99fdd8b98 David Gibson       2008-10-15  4651  
0f792cf949a0be Naoya Horiguchi    2015-02-11  4652  	get_page(page);
b4d1d99fdd8b98 David Gibson       2008-10-15  4653  
788c7df451467d Hugh Dickins       2009-06-23  4654  	if (flags & FAULT_FLAG_WRITE) {
106c992a5ebef2 Gerald Schaefer    2013-04-29  4655  		if (!huge_pte_write(entry)) {
974e6d66b6b5c6 Huang Ying         2018-08-17  4656  			ret = hugetlb_cow(mm, vma, address, ptep,
cb900f41215447 Kirill A. Shutemov 2013-11-14  4657  					  pagecache_page, ptl);
0f792cf949a0be Naoya Horiguchi    2015-02-11  4658  			goto out_put_page;
b4d1d99fdd8b98 David Gibson       2008-10-15  4659  		}
106c992a5ebef2 Gerald Schaefer    2013-04-29  4660  		entry = huge_pte_mkdirty(entry);
b4d1d99fdd8b98 David Gibson       2008-10-15  4661  	}
b4d1d99fdd8b98 David Gibson       2008-10-15  4662  	entry = pte_mkyoung(entry);
285b8dcaacfc36 Huang Ying         2018-06-07  4663  	if (huge_ptep_set_access_flags(vma, haddr, ptep, entry,
788c7df451467d Hugh Dickins       2009-06-23  4664  						flags & FAULT_FLAG_WRITE))
285b8dcaacfc36 Huang Ying         2018-06-07  4665  		update_mmu_cache(vma, haddr, ptep);
0f792cf949a0be Naoya Horiguchi    2015-02-11  4666  out_put_page:
0f792cf949a0be Naoya Horiguchi    2015-02-11  4667  	if (page != pagecache_page)
0f792cf949a0be Naoya Horiguchi    2015-02-11  4668  		unlock_page(page);
0f792cf949a0be Naoya Horiguchi    2015-02-11  4669  	put_page(page);
cb900f41215447 Kirill A. Shutemov 2013-11-14  4670  out_ptl:
cb900f41215447 Kirill A. Shutemov 2013-11-14  4671  	spin_unlock(ptl);
57303d80175e10 Andy Whitcroft     2008-08-12  4672  
57303d80175e10 Andy Whitcroft     2008-08-12  4673  	if (pagecache_page) {
57303d80175e10 Andy Whitcroft     2008-08-12  4674  		unlock_page(pagecache_page);
57303d80175e10 Andy Whitcroft     2008-08-12  4675  		put_page(pagecache_page);
57303d80175e10 Andy Whitcroft     2008-08-12  4676  	}
b4d1d99fdd8b98 David Gibson       2008-10-15  4677  out_mutex:
c672c7f29f2fdb Mike Kravetz       2015-09-08  4678  	mutex_unlock(&hugetlb_fault_mutex_table[hash]);
c0d0381ade7988 Mike Kravetz       2020-04-01  4679  	i_mmap_unlock_read(mapping);
0f792cf949a0be Naoya Horiguchi    2015-02-11  4680  	/*
0f792cf949a0be Naoya Horiguchi    2015-02-11  4681  	 * Generally it's safe to hold refcount during waiting page lock. But
0f792cf949a0be Naoya Horiguchi    2015-02-11  4682  	 * here we just wait to defer the next page fault to avoid busy loop and
0f792cf949a0be Naoya Horiguchi    2015-02-11  4683  	 * the page is not used after unlocked before returning from the current
0f792cf949a0be Naoya Horiguchi    2015-02-11  4684  	 * page fault. So we are safe from accessing freed page, even if we wait
0f792cf949a0be Naoya Horiguchi    2015-02-11  4685  	 * here without taking refcount.
0f792cf949a0be Naoya Horiguchi    2015-02-11  4686  	 */
0f792cf949a0be Naoya Horiguchi    2015-02-11  4687  	if (need_wait_lock)
0f792cf949a0be Naoya Horiguchi    2015-02-11  4688  		wait_on_page_locked(page);
1e8f889b10d8d2 David Gibson       2006-01-06 @4689  	return ret;
86e5216f8d8aa2 Adam Litke         2006-01-06  4690  }
86e5216f8d8aa2 Adam Litke         2006-01-06  4691  

:::::: The code at line 4689 was first introduced by commit
:::::: 1e8f889b10d8d2223105719e36ce45688fedbd59 [PATCH] Hugetlb: Copy on Write support

:::::: TO: David Gibson <david@gibson.dropbear.id.au>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
