Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2FD33DE
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Sep 2023 06:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694845162; x=1726381162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gAifwNZT7xSw96FhvT/Df1rcIluiAWiE5ZOtX4/pQzk=;
  b=ZG2rupoyzmNh4UAdZpsM7ZBodTrJbXGqohfgZHNseKREM2mOz6Mwkp7l
   /Jog1W20JYuxUAb7NTCs63Fd12Tov+nnHYn2h64JYtxsXoOc5id1T22XR
   oZufvvebbkmcCw8qhsvhM40QhINiA2gKEPfNEAN0yvfnaR+wuItKw/HEM
   AozBhErS0KJZMzfBeKFE1HxplUrGQlWQ+BfT5j2AxgI6BbCOuFJdCHACw
   khBB0y4Q4Ql3/hSSnPKHd1F4kDRombQ8pt69PTpqbOWH5Sur+j8iBGuqc
   yaymVbAsRIKVsS84nkRm8uAKd+3zIDNuRUSsXdQP+5DbyZzLE4lyhgZi1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="379303506"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="379303506"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 23:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="748424264"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="748424264"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Sep 2023 23:19:20 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhOeE-0003xM-0V;
	Sat, 16 Sep 2023 06:19:18 +0000
Date: Sat, 16 Sep 2023 14:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/userfaultfd.c:361 mfill_atomic_hugetlb() warn: variable
 dereferenced before check 'dst_vma' (see line 321)
Message-ID: <202309161458.D0bLAfEK-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Axel Rasmussen <axelrasmussen@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   57d88e8a5974644039fbc47806bac7bb12025636
commit: a734991ccaec1985fff42fb26bb6d789d35defb4 mm: userfaultfd: rename functions for clarity + consistency
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20230915 (https://download.01.org/0day-ci/archive/20230916/202309161458.D0bLAfEK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230916/202309161458.D0bLAfEK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309161458.D0bLAfEK-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:361 mfill_atomic_hugetlb() warn: variable dereferenced before check 'dst_vma' (see line 321)

vim +/dst_vma +361 mm/userfaultfd.c

c1a4de99fada21 Andrea Arcangeli  2015-09-04  307  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  308  #ifdef CONFIG_HUGETLB_PAGE
60d4d2d2b40e44 Mike Kravetz      2017-02-22  309  /*
a734991ccaec19 Axel Rasmussen    2023-03-14  310   * mfill_atomic processing for HUGETLB vmas.  Note that this routine is
c1e8d7c6a7a682 Michel Lespinasse 2020-06-08  311   * called with mmap_lock held, it will release mmap_lock before returning.
60d4d2d2b40e44 Mike Kravetz      2017-02-22  312   */
a734991ccaec19 Axel Rasmussen    2023-03-14  313  static __always_inline ssize_t mfill_atomic_hugetlb(struct mm_struct *dst_mm,
60d4d2d2b40e44 Mike Kravetz      2017-02-22  314  					      struct vm_area_struct *dst_vma,
60d4d2d2b40e44 Mike Kravetz      2017-02-22  315  					      unsigned long dst_start,
60d4d2d2b40e44 Mike Kravetz      2017-02-22  316  					      unsigned long src_start,
60d4d2d2b40e44 Mike Kravetz      2017-02-22  317  					      unsigned long len,
6041c691790342 Peter Xu          2022-05-12  318  					      enum mcopy_atomic_mode mode,
6041c691790342 Peter Xu          2022-05-12  319  					      bool wp_copy)
60d4d2d2b40e44 Mike Kravetz      2017-02-22  320  {
1c9e8def43a345 Mike Kravetz      2017-02-22 @321  	int vm_shared = dst_vma->vm_flags & VM_SHARED;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  322  	ssize_t err;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  323  	pte_t *dst_pte;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  324  	unsigned long src_addr, dst_addr;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  325  	long copied;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  326  	struct page *page;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  327  	unsigned long vma_hpagesize;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  328  	pgoff_t idx;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  329  	u32 hash;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  330  	struct address_space *mapping;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  331  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  332  	/*
60d4d2d2b40e44 Mike Kravetz      2017-02-22  333  	 * There is no default zero huge page for all huge page sizes as
60d4d2d2b40e44 Mike Kravetz      2017-02-22  334  	 * supported by hugetlb.  A PMD_SIZE huge pages may exist as used
60d4d2d2b40e44 Mike Kravetz      2017-02-22  335  	 * by THP.  Since we can not reliably insert a zero page, this
60d4d2d2b40e44 Mike Kravetz      2017-02-22  336  	 * feature is not supported.
60d4d2d2b40e44 Mike Kravetz      2017-02-22  337  	 */
f619147104c8ea Axel Rasmussen    2021-05-04  338  	if (mode == MCOPY_ATOMIC_ZEROPAGE) {
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  339  		mmap_read_unlock(dst_mm);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  340  		return -EINVAL;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  341  	}
60d4d2d2b40e44 Mike Kravetz      2017-02-22  342  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  343  	src_addr = src_start;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  344  	dst_addr = dst_start;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  345  	copied = 0;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  346  	page = NULL;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  347  	vma_hpagesize = vma_kernel_pagesize(dst_vma);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  348  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  349  	/*
60d4d2d2b40e44 Mike Kravetz      2017-02-22  350  	 * Validate alignment based on huge page size
60d4d2d2b40e44 Mike Kravetz      2017-02-22  351  	 */
60d4d2d2b40e44 Mike Kravetz      2017-02-22  352  	err = -EINVAL;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  353  	if (dst_start & (vma_hpagesize - 1) || len & (vma_hpagesize - 1))
60d4d2d2b40e44 Mike Kravetz      2017-02-22  354  		goto out_unlock;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  355  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  356  retry:
60d4d2d2b40e44 Mike Kravetz      2017-02-22  357  	/*
c1e8d7c6a7a682 Michel Lespinasse 2020-06-08  358  	 * On routine entry dst_vma is set.  If we had to drop mmap_lock and
60d4d2d2b40e44 Mike Kravetz      2017-02-22  359  	 * retry, dst_vma will be set to NULL and we must lookup again.
60d4d2d2b40e44 Mike Kravetz      2017-02-22  360  	 */
60d4d2d2b40e44 Mike Kravetz      2017-02-22 @361  	if (!dst_vma) {
27d02568f529e9 Mike Rapoport     2017-02-24  362  		err = -ENOENT;
643aa36eadebdc Wei Yang          2019-11-30  363  		dst_vma = find_dst_vma(dst_mm, dst_start, len);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  364  		if (!dst_vma || !is_vm_hugetlb_page(dst_vma))
60d4d2d2b40e44 Mike Kravetz      2017-02-22  365  			goto out_unlock;
1c9e8def43a345 Mike Kravetz      2017-02-22  366  
27d02568f529e9 Mike Rapoport     2017-02-24  367  		err = -EINVAL;
27d02568f529e9 Mike Rapoport     2017-02-24  368  		if (vma_hpagesize != vma_kernel_pagesize(dst_vma))
27d02568f529e9 Mike Rapoport     2017-02-24  369  			goto out_unlock;
27d02568f529e9 Mike Rapoport     2017-02-24  370  
1c9e8def43a345 Mike Kravetz      2017-02-22  371  		vm_shared = dst_vma->vm_flags & VM_SHARED;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  372  	}
60d4d2d2b40e44 Mike Kravetz      2017-02-22  373  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  374  	/*
1c9e8def43a345 Mike Kravetz      2017-02-22  375  	 * If not shared, ensure the dst_vma has a anon_vma.
60d4d2d2b40e44 Mike Kravetz      2017-02-22  376  	 */
60d4d2d2b40e44 Mike Kravetz      2017-02-22  377  	err = -ENOMEM;
1c9e8def43a345 Mike Kravetz      2017-02-22  378  	if (!vm_shared) {
60d4d2d2b40e44 Mike Kravetz      2017-02-22  379  		if (unlikely(anon_vma_prepare(dst_vma)))
60d4d2d2b40e44 Mike Kravetz      2017-02-22  380  			goto out_unlock;
1c9e8def43a345 Mike Kravetz      2017-02-22  381  	}
60d4d2d2b40e44 Mike Kravetz      2017-02-22  382  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  383  	while (src_addr < src_start + len) {
60d4d2d2b40e44 Mike Kravetz      2017-02-22  384  		BUG_ON(dst_addr >= dst_start + len);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  385  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  386  		/*
40549ba8f8e0ed Mike Kravetz      2022-09-14  387  		 * Serialize via vma_lock and hugetlb_fault_mutex.
40549ba8f8e0ed Mike Kravetz      2022-09-14  388  		 * vma_lock ensures the dst_pte remains valid even
40549ba8f8e0ed Mike Kravetz      2022-09-14  389  		 * in the case of shared pmds.  fault mutex prevents
40549ba8f8e0ed Mike Kravetz      2022-09-14  390  		 * races with other faulting threads.
60d4d2d2b40e44 Mike Kravetz      2017-02-22  391  		 */
c0d0381ade7988 Mike Kravetz      2020-04-01  392  		idx = linear_page_index(dst_vma, dst_addr);
3a47c54f09c4c8 Mike Kravetz      2022-09-14  393  		mapping = dst_vma->vm_file->f_mapping;
188b04a7d93860 Wei Yang          2019-11-30  394  		hash = hugetlb_fault_mutex_hash(mapping, idx);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  395  		mutex_lock(&hugetlb_fault_mutex_table[hash]);
40549ba8f8e0ed Mike Kravetz      2022-09-14  396  		hugetlb_vma_lock_read(dst_vma);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  397  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  398  		err = -ENOMEM;
aec44e0f0213e3 Peter Xu          2021-05-04  399  		dst_pte = huge_pte_alloc(dst_mm, dst_vma, dst_addr, vma_hpagesize);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  400  		if (!dst_pte) {
40549ba8f8e0ed Mike Kravetz      2022-09-14  401  			hugetlb_vma_unlock_read(dst_vma);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  402  			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  403  			goto out_unlock;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  404  		}
60d4d2d2b40e44 Mike Kravetz      2017-02-22  405  
f619147104c8ea Axel Rasmussen    2021-05-04  406  		if (mode != MCOPY_ATOMIC_CONTINUE &&
6041c691790342 Peter Xu          2022-05-12  407  		    !huge_pte_none_mostly(huge_ptep_get(dst_pte))) {
60d4d2d2b40e44 Mike Kravetz      2017-02-22  408  			err = -EEXIST;
40549ba8f8e0ed Mike Kravetz      2022-09-14  409  			hugetlb_vma_unlock_read(dst_vma);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  410  			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  411  			goto out_unlock;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  412  		}
60d4d2d2b40e44 Mike Kravetz      2017-02-22  413  
a734991ccaec19 Axel Rasmussen    2023-03-14  414  		err = hugetlb_mfill_atomic_pte(dst_mm, dst_pte, dst_vma,
6041c691790342 Peter Xu          2022-05-12  415  					       dst_addr, src_addr, mode, &page,
6041c691790342 Peter Xu          2022-05-12  416  					       wp_copy);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  417  
40549ba8f8e0ed Mike Kravetz      2022-09-14  418  		hugetlb_vma_unlock_read(dst_vma);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  419  		mutex_unlock(&hugetlb_fault_mutex_table[hash]);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  420  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  421  		cond_resched();
60d4d2d2b40e44 Mike Kravetz      2017-02-22  422  
9e368259ad9883 Andrea Arcangeli  2018-11-30  423  		if (unlikely(err == -ENOENT)) {
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  424  			mmap_read_unlock(dst_mm);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  425  			BUG_ON(!page);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  426  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  427  			err = copy_huge_page_from_user(page,
60d4d2d2b40e44 Mike Kravetz      2017-02-22  428  						(const void __user *)src_addr,
4fb07ee6510280 Wei Yang          2019-11-30  429  						vma_hpagesize / PAGE_SIZE,
4fb07ee6510280 Wei Yang          2019-11-30  430  						true);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  431  			if (unlikely(err)) {
60d4d2d2b40e44 Mike Kravetz      2017-02-22  432  				err = -EFAULT;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  433  				goto out;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  434  			}
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  435  			mmap_read_lock(dst_mm);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  436  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  437  			dst_vma = NULL;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  438  			goto retry;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  439  		} else
60d4d2d2b40e44 Mike Kravetz      2017-02-22  440  			BUG_ON(page);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  441  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  442  		if (!err) {
60d4d2d2b40e44 Mike Kravetz      2017-02-22  443  			dst_addr += vma_hpagesize;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  444  			src_addr += vma_hpagesize;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  445  			copied += vma_hpagesize;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  446  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  447  			if (fatal_signal_pending(current))
60d4d2d2b40e44 Mike Kravetz      2017-02-22  448  				err = -EINTR;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  449  		}
60d4d2d2b40e44 Mike Kravetz      2017-02-22  450  		if (err)
60d4d2d2b40e44 Mike Kravetz      2017-02-22  451  			break;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  452  	}
60d4d2d2b40e44 Mike Kravetz      2017-02-22  453  
60d4d2d2b40e44 Mike Kravetz      2017-02-22  454  out_unlock:
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  455  	mmap_read_unlock(dst_mm);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  456  out:
8cc5fcbb5be814 Mina Almasry      2021-06-30  457  	if (page)
60d4d2d2b40e44 Mike Kravetz      2017-02-22  458  		put_page(page);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  459  	BUG_ON(copied < 0);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  460  	BUG_ON(err > 0);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  461  	BUG_ON(!copied && !err);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  462  	return copied ? copied : err;
60d4d2d2b40e44 Mike Kravetz      2017-02-22  463  }
60d4d2d2b40e44 Mike Kravetz      2017-02-22  464  #else /* !CONFIG_HUGETLB_PAGE */
60d4d2d2b40e44 Mike Kravetz      2017-02-22  465  /* fail at build time if gcc attempts to use this */
a734991ccaec19 Axel Rasmussen    2023-03-14  466  extern ssize_t mfill_atomic_hugetlb(struct mm_struct *dst_mm,
60d4d2d2b40e44 Mike Kravetz      2017-02-22  467  				      struct vm_area_struct *dst_vma,
60d4d2d2b40e44 Mike Kravetz      2017-02-22  468  				      unsigned long dst_start,
60d4d2d2b40e44 Mike Kravetz      2017-02-22  469  				      unsigned long src_start,
60d4d2d2b40e44 Mike Kravetz      2017-02-22  470  				      unsigned long len,
6041c691790342 Peter Xu          2022-05-12  471  				      enum mcopy_atomic_mode mode,
6041c691790342 Peter Xu          2022-05-12  472  				      bool wp_copy);
60d4d2d2b40e44 Mike Kravetz      2017-02-22  473  #endif /* CONFIG_HUGETLB_PAGE */
60d4d2d2b40e44 Mike Kravetz      2017-02-22  474  

:::::: The code at line 361 was first introduced by commit
:::::: 60d4d2d2b40e44cd36bfb6049e8d9e2055a24f8a userfaultfd: hugetlbfs: add __mcopy_atomic_hugetlb for huge page UFFDIO_COPY

:::::: TO: Mike Kravetz <mike.kravetz@oracle.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
