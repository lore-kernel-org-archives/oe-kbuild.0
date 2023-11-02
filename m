Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97FB1BDE0
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Nov 2023 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMisrT2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698937445; x=1730473445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LMFfrt0Ca6b72njhcQN/KrTbPXf9FFJA5l9Rusay8Ks=;
  b=eMisrT2dxQsMtRUmVzPzunn/OCy0N0LgmzXuiFUX/Bt8LQxq7Upx0XH7
   Ymrh4Umia/LTIMLmallky5S7SFmdEcgMwdSYK0iXVLMpBHKUJlYDZYZqD
   8L1jSJ1zkz36PfgZzSy+JGFBisXfeZqyFaKeRTJZk7ICeURAgtl+GeESL
   VqSS3HOXw7N3fk67eu318ZjkOoXnTU7eqtBO8xQfKNGeXLsIlU5NlDDBF
   08eKfufigmjlDkHcHx11WDzAv1XuwiJoHJQHEuciHbTxE30ytMbSF7jPx
   1VG072ac00ok516MvjDaKouXJodHz6nNm6UoSMpPHZyvVggQ8rgT5BH0N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373770346"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="373770346"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 08:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711170467"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="711170467"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Nov 2023 08:03:46 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyZEW-0001Xn-0v;
	Thu, 02 Nov 2023 15:03:44 +0000
Date: Thu, 2 Nov 2023 23:03:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.10 8048/29087] mm/memory.c:4691
 handle_pte_fault() warn: inconsistent returns 'vmf->ptl'.
Message-ID: <202311022258.IwMXuzXy-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   422887ef073ab9748ddbdf4ffe3009e040f93c4c
commit: 35eacb5c87b9b5e9683e25a24282cde1a2d4a1d5 [8048/29087] ANDROID: mm: allow vmas with vm_ops to be speculatively handled
:::::: branch date: 20 hours ago
:::::: commit date: 2 years, 6 months ago
config: i386-randconfig-141-20231102 (https://download.01.org/0day-ci/archive/20231102/202311022258.IwMXuzXy-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231102/202311022258.IwMXuzXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311022258.IwMXuzXy-lkp@intel.com/

smatch warnings:
mm/memory.c:4691 handle_pte_fault() warn: inconsistent returns 'vmf->ptl'.

vim +4691 mm/memory.c

a00cc7d9dd93d6 Matthew Wilcox        2017-02-24  4562  
^1da177e4c3f41 Linus Torvalds        2005-04-16  4563  /*
^1da177e4c3f41 Linus Torvalds        2005-04-16  4564   * These routines also need to handle stuff like marking pages dirty
^1da177e4c3f41 Linus Torvalds        2005-04-16  4565   * and/or accessed for architectures that don't do it in hardware (most
^1da177e4c3f41 Linus Torvalds        2005-04-16  4566   * RISC architectures).  The early dirtying is also good on the i386.
^1da177e4c3f41 Linus Torvalds        2005-04-16  4567   *
^1da177e4c3f41 Linus Torvalds        2005-04-16  4568   * There is also a hook called "update_mmu_cache()" that architectures
^1da177e4c3f41 Linus Torvalds        2005-04-16  4569   * with external mmu caches can use to update those (ie the Sparc or
^1da177e4c3f41 Linus Torvalds        2005-04-16  4570   * PowerPC hashed page tables that act as extended TLBs).
^1da177e4c3f41 Linus Torvalds        2005-04-16  4571   *
c1e8d7c6a7a682 Michel Lespinasse     2020-06-08  4572   * We enter with non-exclusive mmap_lock (to exclude vma changes, but allow
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4573   * concurrent faults).
9a95f3cf7b33d6 Paul Cassella         2014-08-06  4574   *
c1e8d7c6a7a682 Michel Lespinasse     2020-06-08  4575   * The mmap_lock may have been released depending on flags and our return value.
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4576   * See filemap_fault() and __lock_page_or_retry().
^1da177e4c3f41 Linus Torvalds        2005-04-16  4577   */
2b7403035459c7 Souptick Joarder      2018-08-23  4578  static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
^1da177e4c3f41 Linus Torvalds        2005-04-16  4579  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  4580  	pte_t entry;
35eacb5c87b9b5 Vinayak Menon         2021-03-18  4581  	vm_fault_t ret = 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  4582  
82b0f8c39a3869 Jan Kara              2016-12-14  4583  	if (unlikely(pmd_none(*vmf->pmd))) {
1c5371744061fc Peter Zijlstra        2018-04-17  4584  		/*
1c5371744061fc Peter Zijlstra        2018-04-17  4585  		 * In the case of the speculative page fault handler we abort
1c5371744061fc Peter Zijlstra        2018-04-17  4586  		 * the speculative path immediately as the pmd is probably
1c5371744061fc Peter Zijlstra        2018-04-17  4587  		 * in the way to be converted in a huge one. We will try
1c5371744061fc Peter Zijlstra        2018-04-17  4588  		 * again holding the mmap_sem (which implies that the collapse
1c5371744061fc Peter Zijlstra        2018-04-17  4589  		 * operation is done).
1c5371744061fc Peter Zijlstra        2018-04-17  4590  		 */
1c5371744061fc Peter Zijlstra        2018-04-17  4591  		if (vmf->flags & FAULT_FLAG_SPECULATIVE)
1c5371744061fc Peter Zijlstra        2018-04-17  4592  			return VM_FAULT_RETRY;
e37c6982706333 Christian Borntraeger 2014-12-07  4593  		/*
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4594  		 * Leave __pte_alloc() until later: because vm_ops->fault may
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4595  		 * want to allocate huge page, and if we expose page table
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4596  		 * for an instant, it will be difficult to retract from
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4597  		 * concurrent faults and from rmap lookups.
e37c6982706333 Christian Borntraeger 2014-12-07  4598  		 */
82b0f8c39a3869 Jan Kara              2016-12-14  4599  		vmf->pte = NULL;
1c5371744061fc Peter Zijlstra        2018-04-17  4600  	} else if (!(vmf->flags & FAULT_FLAG_SPECULATIVE)) {
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4601  		/*
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4602  		 * If a huge pmd materialized under us just retry later.  Use
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4603  		 * pmd_trans_unstable() via pmd_devmap_trans_unstable() instead
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4604  		 * of pmd_trans_huge() to ensure the pmd didn't become
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4605  		 * pmd_trans_huge under us and then back to pmd_none, as a
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4606  		 * result of MADV_DONTNEED running immediately after a huge pmd
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4607  		 * fault in a different thread of this mm, in turn leading to a
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4608  		 * misleading pmd_trans_huge() retval. All we have to ensure is
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4609  		 * that it is a regular pmd that we can walk with
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4610  		 * pte_offset_map() and we can do that through an atomic read
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4611  		 * in C, which is what pmd_trans_unstable() provides.
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4612  		 */
d0f0931de936a0 Ross Zwisler          2017-06-02  4613  		if (pmd_devmap_trans_unstable(vmf->pmd))
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4614  			return 0;
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4615  		/*
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4616  		 * A regular pmd is established and it can't morph into a huge
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4617  		 * pmd from under us anymore at this point because we hold the
c1e8d7c6a7a682 Michel Lespinasse     2020-06-08  4618  		 * mmap_lock read mode and khugepaged takes it in write mode.
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4619  		 * So now it's safe to run pte_offset_map().
1c5371744061fc Peter Zijlstra        2018-04-17  4620  		 * This is not applicable to the speculative page fault handler
1c5371744061fc Peter Zijlstra        2018-04-17  4621  		 * but in that case, the pte is fetched earlier in
1c5371744061fc Peter Zijlstra        2018-04-17  4622  		 * handle_speculative_fault().
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4623  		 */
82b0f8c39a3869 Jan Kara              2016-12-14  4624  		vmf->pte = pte_offset_map(vmf->pmd, vmf->address);
2994302bc8a171 Jan Kara              2016-12-14  4625  		vmf->orig_pte = *vmf->pte;
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4626  
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4627  		/*
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4628  		 * some architectures can have larger ptes than wordsize,
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4629  		 * e.g.ppc44x-defconfig has CONFIG_PTE_64BIT=y and
b03a0fe0c5e4b4 Paul E. McKenney      2017-10-23  4630  		 * CONFIG_32BIT=y, so READ_ONCE cannot guarantee atomic
b03a0fe0c5e4b4 Paul E. McKenney      2017-10-23  4631  		 * accesses.  The code below just needs a consistent view
b03a0fe0c5e4b4 Paul E. McKenney      2017-10-23  4632  		 * for the ifs and we later double check anyway with the
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4633  		 * ptl lock held. So here a barrier will do.
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4634  		 */
e37c6982706333 Christian Borntraeger 2014-12-07  4635  		barrier();
2994302bc8a171 Jan Kara              2016-12-14  4636  		if (pte_none(vmf->orig_pte)) {
82b0f8c39a3869 Jan Kara              2016-12-14  4637  			pte_unmap(vmf->pte);
82b0f8c39a3869 Jan Kara              2016-12-14  4638  			vmf->pte = NULL;
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4639  		}
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4640  	}
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4641  
82b0f8c39a3869 Jan Kara              2016-12-14  4642  	if (!vmf->pte) {
82b0f8c39a3869 Jan Kara              2016-12-14  4643  		if (vma_is_anonymous(vmf->vma))
82b0f8c39a3869 Jan Kara              2016-12-14  4644  			return do_anonymous_page(vmf);
35eacb5c87b9b5 Vinayak Menon         2021-03-18  4645  		else if ((vmf->flags & FAULT_FLAG_SPECULATIVE) &&
35eacb5c87b9b5 Vinayak Menon         2021-03-18  4646  				!vmf_allows_speculation(vmf))
1c5371744061fc Peter Zijlstra        2018-04-17  4647  			return VM_FAULT_RETRY;
b5330628546616 Oleg Nesterov         2015-09-08  4648  		else
82b0f8c39a3869 Jan Kara              2016-12-14  4649  			return do_fault(vmf);
65500d234e74fc Hugh Dickins          2005-10-29  4650  	}
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4651  
2994302bc8a171 Jan Kara              2016-12-14  4652  	if (!pte_present(vmf->orig_pte))
2994302bc8a171 Jan Kara              2016-12-14  4653  		return do_swap_page(vmf);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4654  
2994302bc8a171 Jan Kara              2016-12-14  4655  	if (pte_protnone(vmf->orig_pte) && vma_is_accessible(vmf->vma))
2994302bc8a171 Jan Kara              2016-12-14  4656  		return do_numa_page(vmf);
d10e63f29488b0 Mel Gorman            2012-10-25  4657  
b23ffc113b308e Laurent Dufour        2018-04-17  4658  	if (!pte_spinlock(vmf))
b23ffc113b308e Laurent Dufour        2018-04-17  4659  		return VM_FAULT_RETRY;
2994302bc8a171 Jan Kara              2016-12-14  4660  	entry = vmf->orig_pte;
7df676974359f9 Bibo Mao              2020-05-27  4661  	if (unlikely(!pte_same(*vmf->pte, entry))) {
7df676974359f9 Bibo Mao              2020-05-27  4662  		update_mmu_tlb(vmf->vma, vmf->address, vmf->pte);
8f4e2101fd7df9 Hugh Dickins          2005-10-29  4663  		goto unlock;
7df676974359f9 Bibo Mao              2020-05-27  4664  	}
82b0f8c39a3869 Jan Kara              2016-12-14  4665  	if (vmf->flags & FAULT_FLAG_WRITE) {
f6f3732162b5ae Linus Torvalds        2017-12-15  4666  		if (!pte_write(entry))
2994302bc8a171 Jan Kara              2016-12-14  4667  			return do_wp_page(vmf);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4668  		entry = pte_mkdirty(entry);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4669  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  4670  	entry = pte_mkyoung(entry);
82b0f8c39a3869 Jan Kara              2016-12-14  4671  	if (ptep_set_access_flags(vmf->vma, vmf->address, vmf->pte, entry,
82b0f8c39a3869 Jan Kara              2016-12-14  4672  				vmf->flags & FAULT_FLAG_WRITE)) {
82b0f8c39a3869 Jan Kara              2016-12-14  4673  		update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
1a44e149084d77 Andrea Arcangeli      2005-10-29  4674  	} else {
b7333b58f358f3 Yang Shi              2020-08-14  4675  		/* Skip spurious TLB flush for retried page fault */
b7333b58f358f3 Yang Shi              2020-08-14  4676  		if (vmf->flags & FAULT_FLAG_TRIED)
b7333b58f358f3 Yang Shi              2020-08-14  4677  			goto unlock;
35eacb5c87b9b5 Vinayak Menon         2021-03-18  4678  		if (vmf->flags & FAULT_FLAG_SPECULATIVE)
35eacb5c87b9b5 Vinayak Menon         2021-03-18  4679  			ret = VM_FAULT_RETRY;
1a44e149084d77 Andrea Arcangeli      2005-10-29  4680  		/*
1a44e149084d77 Andrea Arcangeli      2005-10-29  4681  		 * This is needed only for protection faults but the arch code
1a44e149084d77 Andrea Arcangeli      2005-10-29  4682  		 * is not yet telling us if this is a protection fault or not.
1a44e149084d77 Andrea Arcangeli      2005-10-29  4683  		 * This still avoids useless tlb flushes for .text page faults
1a44e149084d77 Andrea Arcangeli      2005-10-29  4684  		 * with threads.
1a44e149084d77 Andrea Arcangeli      2005-10-29  4685  		 */
82b0f8c39a3869 Jan Kara              2016-12-14  4686  		if (vmf->flags & FAULT_FLAG_WRITE)
82b0f8c39a3869 Jan Kara              2016-12-14  4687  			flush_tlb_fix_spurious_fault(vmf->vma, vmf->address);
1a44e149084d77 Andrea Arcangeli      2005-10-29  4688  	}
8f4e2101fd7df9 Hugh Dickins          2005-10-29  4689  unlock:
82b0f8c39a3869 Jan Kara              2016-12-14  4690  	pte_unmap_unlock(vmf->pte, vmf->ptl);
35eacb5c87b9b5 Vinayak Menon         2021-03-18 @4691  	return ret;
^1da177e4c3f41 Linus Torvalds        2005-04-16  4692  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  4693  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
