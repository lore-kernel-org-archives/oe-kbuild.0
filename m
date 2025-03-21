Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D6521D3D4
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Mar 2025 23:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742599240; cv=none; b=hf1vtEcZblx1ZEO9Jpc5x8+dOL5vkniBsh31m2c7TbwWzNrGfrazgnBQAxcuY9e58j71w26YCJX/cv7laYfzeNDaoW3dQbc0N4fH3llVKFqjWQlRJsA/LSKtfMgmJIgVJAfczI3nI2aIxKxk1HKAYEM6j850xzsBew2v5qbkPHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742599240; c=relaxed/simple;
	bh=e5UuCa7rQhF+DT1tsdXgJUxSKEZOPMTvImbIrCHFEag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTCLHsSPJTLagfcqEOv6AOaENwT7KY5HctS+0GlrvU/4oepH03qfJ8DcSHHIRv1negivLXlzK5odYZtxJrSDFhnuLpFbZ1i3gOmV6ubDGYQ2c1smRTJTFCqoE4QU1J5kQQZhowcjhgMddZCeA+iiEFT/QH7tA59QzBARsfqind8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nj7H/Spw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nj7H/Spw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742599236; x=1774135236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e5UuCa7rQhF+DT1tsdXgJUxSKEZOPMTvImbIrCHFEag=;
  b=Nj7H/SpwIqRiPJoGLj/6Efpf/UQDPJMD23a86Z4mEZsm41tzpwrXS1RA
   K7UCi8ZaUmURJmiJycqKjc7I5byM0MhQCmIyGT9DNnGrzwSnSdnAmo0Eo
   tMi/xgSmf0sYN3P7Ux34Sk7/zkFtnzFupXpgNhXUOo7wTHc4m6K0vGYvz
   vb8IVk7rq4o98DSaQl+TZyA732vyE5rUjRGjKZLD7sycGaHArr5dG+lDt
   eyZEKW8DTMjWLDaCT+GkBb4Yrap3SlsLUPQefzTHgmL+V/4vABxrD53j8
   1xgKOzrFTMN4I6APZzsrQMfUZoZe6rCX8EH0WmzJ9vw71KQl70f8mTBNL
   w==;
X-CSE-ConnectionGUID: vbhlDO2iTHmREiLx4MomZQ==
X-CSE-MsgGUID: gCk/tVFjQDm1ze3j5+o3QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="55263668"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="55263668"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 16:20:36 -0700
X-CSE-ConnectionGUID: qhifborqTX2T1RlXvCJSLw==
X-CSE-MsgGUID: liTsqmeVSQGuiPNE5BG9Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="123544392"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Mar 2025 16:20:34 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvlfD-0001lX-0b;
	Fri, 21 Mar 2025 23:20:31 +0000
Date: Sat, 22 Mar 2025 07:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1-2024-12 4/4] mm/mmap.c:763
 __vma_adjust() error: we previously assumed 'next' could be null (see line
 754)
Message-ID: <202503220747.MffKa969-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-12
head:   32fd20834ef388eff2e1aa32e74077e16792ada5
commit: 3b0e81a1cdc9afbddb0543d08e38edb4e33c4baf [4/4] mmap: change zeroing of maple tree in __vma_adjust()
:::::: branch date: 18 hours ago
:::::: commit date: 2 years, 6 months ago
config: x86_64-randconfig-161-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220747.MffKa969-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503220747.MffKa969-lkp@intel.com/

smatch warnings:
mm/mmap.c:763 __vma_adjust() error: we previously assumed 'next' could be null (see line 754)

vim +/next +763 mm/mmap.c

^1da177e4c3f41 Linus Torvalds        2005-04-16  580  
^1da177e4c3f41 Linus Torvalds        2005-04-16  581  /*
^1da177e4c3f41 Linus Torvalds        2005-04-16  582   * We cannot adjust vm_start, vm_end, vm_pgoff fields of a vma that
^1da177e4c3f41 Linus Torvalds        2005-04-16  583   * is already present in an i_mmap tree without adjusting the tree.
^1da177e4c3f41 Linus Torvalds        2005-04-16  584   * The following helper function should be used when such adjustments
^1da177e4c3f41 Linus Torvalds        2005-04-16  585   * are necessary.  The "insert" vma (if any) is to be inserted
^1da177e4c3f41 Linus Torvalds        2005-04-16  586   * before we drop the necessary locks.
^1da177e4c3f41 Linus Torvalds        2005-04-16  587   */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  588  int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  589  	unsigned long end, pgoff_t pgoff, struct vm_area_struct *insert,
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  590  	struct vm_area_struct *expand)
^1da177e4c3f41 Linus Torvalds        2005-04-16  591  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  592  	struct mm_struct *mm = vma->vm_mm;
524e00b36e8c54 Liam R. Howlett       2022-09-06  593  	struct vm_area_struct *next_next, *next = find_vma(mm, vma->vm_end);
524e00b36e8c54 Liam R. Howlett       2022-09-06  594  	struct vm_area_struct *orig_vma = vma;
^1da177e4c3f41 Linus Torvalds        2005-04-16  595  	struct address_space *mapping = NULL;
f808c13fd37389 Davidlohr Bueso       2017-09-08  596  	struct rb_root_cached *root = NULL;
012f18004da33b Rik van Riel          2010-08-09  597  	struct anon_vma *anon_vma = NULL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  598  	struct file *file = vma->vm_file;
524e00b36e8c54 Liam R. Howlett       2022-09-06  599  	bool vma_changed = false;
^1da177e4c3f41 Linus Torvalds        2005-04-16  600  	long adjust_next = 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  601  	int remove_next = 0;
d4af56c5c7c678 Liam R. Howlett       2022-09-06  602  	MA_STATE(mas, &mm->mm_mt, 0, 0);
734537c9cb725f Kirill A. Shutemov    2016-07-28  603  	struct vm_area_struct *exporter = NULL, *importer = NULL;
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  604  	unsigned long ll_prev = vma->vm_start; /* linked list prev. */
287d97ac032136 Linus Torvalds        2010-04-10  605  
d4af56c5c7c678 Liam R. Howlett       2022-09-06  606  	if (next && !insert) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  607  		if (end >= next->vm_end) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  608  			/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  609  			 * vma expands, overlapping all the next, and
^1da177e4c3f41 Linus Torvalds        2005-04-16  610  			 * perhaps the one after too (mprotect case 6).
86d12e471d9f15 Andrea Arcangeli      2016-10-07  611  			 * The only other cases that gets here are
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  612  			 * case 1, case 7 and case 8.
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  613  			 */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  614  			if (next == expand) {
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  615  				/*
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  616  				 * The only case where we don't expand "vma"
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  617  				 * and we expand "next" instead is case 8.
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  618  				 */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  619  				VM_WARN_ON(end != next->vm_end);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  620  				/*
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  621  				 * remove_next == 3 means we're
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  622  				 * removing "vma" and that to do so we
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  623  				 * swapped "vma" and "next".
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  624  				 */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  625  				remove_next = 3;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  626  				VM_WARN_ON(file != next->vm_file);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  627  				swap(vma, next);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  628  			} else {
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  629  				VM_WARN_ON(expand != vma);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  630  				/*
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  631  				 * case 1, 6, 7, remove_next == 2 is case 6,
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  632  				 * remove_next == 1 is case 1 or 7.
^1da177e4c3f41 Linus Torvalds        2005-04-16  633  				 */
734537c9cb725f Kirill A. Shutemov    2016-07-28  634  				remove_next = 1 + (end > next->vm_end);
d4af56c5c7c678 Liam R. Howlett       2022-09-06  635  				if (remove_next == 2)
d4af56c5c7c678 Liam R. Howlett       2022-09-06  636  					next_next = find_vma(mm, next->vm_end);
d4af56c5c7c678 Liam R. Howlett       2022-09-06  637  
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  638  				VM_WARN_ON(remove_next == 2 &&
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  639  					   end != next->vm_next->vm_end);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  640  			}
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  641  
287d97ac032136 Linus Torvalds        2010-04-10  642  			exporter = next;
^1da177e4c3f41 Linus Torvalds        2005-04-16  643  			importer = vma;
734537c9cb725f Kirill A. Shutemov    2016-07-28  644  
734537c9cb725f Kirill A. Shutemov    2016-07-28  645  			/*
734537c9cb725f Kirill A. Shutemov    2016-07-28  646  			 * If next doesn't have anon_vma, import from vma after
734537c9cb725f Kirill A. Shutemov    2016-07-28  647  			 * next, if the vma overlaps with it.
734537c9cb725f Kirill A. Shutemov    2016-07-28  648  			 */
97a42cd4398162 Andrea Arcangeli      2016-10-07  649  			if (remove_next == 2 && !next->anon_vma)
734537c9cb725f Kirill A. Shutemov    2016-07-28  650  				exporter = next->vm_next;
734537c9cb725f Kirill A. Shutemov    2016-07-28  651  
^1da177e4c3f41 Linus Torvalds        2005-04-16  652  		} else if (end > next->vm_start) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  653  			/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  654  			 * vma expands, overlapping part of the next:
^1da177e4c3f41 Linus Torvalds        2005-04-16  655  			 * mprotect case 5 shifting the boundary up.
^1da177e4c3f41 Linus Torvalds        2005-04-16  656  			 */
f9d86a60572295 Wei Yang              2020-10-13  657  			adjust_next = (end - next->vm_start);
287d97ac032136 Linus Torvalds        2010-04-10  658  			exporter = next;
^1da177e4c3f41 Linus Torvalds        2005-04-16  659  			importer = vma;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  660  			VM_WARN_ON(expand != importer);
^1da177e4c3f41 Linus Torvalds        2005-04-16  661  		} else if (end < vma->vm_end) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  662  			/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  663  			 * vma shrinks, and !insert tells it's not
^1da177e4c3f41 Linus Torvalds        2005-04-16  664  			 * split_vma inserting another: so it must be
^1da177e4c3f41 Linus Torvalds        2005-04-16  665  			 * mprotect case 4 shifting the boundary down.
^1da177e4c3f41 Linus Torvalds        2005-04-16  666  			 */
f9d86a60572295 Wei Yang              2020-10-13  667  			adjust_next = -(vma->vm_end - end);
287d97ac032136 Linus Torvalds        2010-04-10  668  			exporter = vma;
^1da177e4c3f41 Linus Torvalds        2005-04-16  669  			importer = next;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  670  			VM_WARN_ON(expand != importer);
^1da177e4c3f41 Linus Torvalds        2005-04-16  671  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  672  
5beb49305251e5 Rik van Riel          2010-03-05  673  		/*
5beb49305251e5 Rik van Riel          2010-03-05  674  		 * Easily overlooked: when mprotect shifts the boundary,
5beb49305251e5 Rik van Riel          2010-03-05  675  		 * make sure the expanding vma has anon_vma set if the
5beb49305251e5 Rik van Riel          2010-03-05  676  		 * shrinking vma had, to cover any anon pages imported.
5beb49305251e5 Rik van Riel          2010-03-05  677  		 */
287d97ac032136 Linus Torvalds        2010-04-10  678  		if (exporter && exporter->anon_vma && !importer->anon_vma) {
c4ea95d7cd08d9 Daniel Forrest        2014-12-02  679  			int error;
c4ea95d7cd08d9 Daniel Forrest        2014-12-02  680  
b800c91a051707 Konstantin Khlebnikov 2015-01-11  681  			importer->anon_vma = exporter->anon_vma;
c4ea95d7cd08d9 Daniel Forrest        2014-12-02  682  			error = anon_vma_clone(importer, exporter);
3fe89b3e2a7bbf Leon Yu               2015-03-25  683  			if (error)
c4ea95d7cd08d9 Daniel Forrest        2014-12-02  684  				return error;
b800c91a051707 Konstantin Khlebnikov 2015-01-11  685  		}
5beb49305251e5 Rik van Riel          2010-03-05  686  	}
37f9f5595c26d3 Kirill A. Shutemov    2016-07-26  687  
d4af56c5c7c678 Liam R. Howlett       2022-09-06  688  	if (mas_preallocate(&mas, vma, GFP_KERNEL))
d4af56c5c7c678 Liam R. Howlett       2022-09-06  689  		return -ENOMEM;
d4af56c5c7c678 Liam R. Howlett       2022-09-06  690  
d4af56c5c7c678 Liam R. Howlett       2022-09-06  691  	vma_adjust_trans_huge(orig_vma, start, end, adjust_next);
^1da177e4c3f41 Linus Torvalds        2005-04-16  692  	if (file) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  693  		mapping = file->f_mapping;
^1da177e4c3f41 Linus Torvalds        2005-04-16  694  		root = &mapping->i_mmap;
cbc91f71b51b83 Srikar Dronamraju     2012-04-11  695  		uprobe_munmap(vma, vma->vm_start, vma->vm_end);
682968e0c425c6 Srikar Dronamraju     2012-03-30  696  
682968e0c425c6 Srikar Dronamraju     2012-03-30  697  		if (adjust_next)
27ba0644ea9dfe Kirill A. Shutemov    2015-02-10  698  			uprobe_munmap(next, next->vm_start, next->vm_end);
682968e0c425c6 Srikar Dronamraju     2012-03-30  699  
83cde9e8ba95d1 Davidlohr Bueso       2014-12-12  700  		i_mmap_lock_write(mapping);
^1da177e4c3f41 Linus Torvalds        2005-04-16  701  		if (insert) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  702  			/*
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  703  			 * Put into interval tree now, so instantiated pages
^1da177e4c3f41 Linus Torvalds        2005-04-16  704  			 * are visible to arm/parisc __flush_dcache_page
^1da177e4c3f41 Linus Torvalds        2005-04-16  705  			 * throughout; but we cannot insert into address
^1da177e4c3f41 Linus Torvalds        2005-04-16  706  			 * space until vma start or end is updated.
^1da177e4c3f41 Linus Torvalds        2005-04-16  707  			 */
^1da177e4c3f41 Linus Torvalds        2005-04-16  708  			__vma_link_file(insert);
^1da177e4c3f41 Linus Torvalds        2005-04-16  709  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  710  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  711  
012f18004da33b Rik van Riel          2010-08-09  712  	anon_vma = vma->anon_vma;
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  713  	if (!anon_vma && adjust_next)
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  714  		anon_vma = next->anon_vma;
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  715  	if (anon_vma) {
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  716  		VM_WARN_ON(adjust_next && next->anon_vma &&
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  717  			   anon_vma != next->anon_vma);
4fc3f1d66b1ef0 Ingo Molnar           2012-12-02  718  		anon_vma_lock_write(anon_vma);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  719  		anon_vma_interval_tree_pre_update_vma(vma);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  720  		if (adjust_next)
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  721  			anon_vma_interval_tree_pre_update_vma(next);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  722  	}
012f18004da33b Rik van Riel          2010-08-09  723  
0fc48a6e213ab8 Wei Yang              2020-10-13  724  	if (file) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  725  		flush_dcache_mmap_lock(mapping);
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  726  		vma_interval_tree_remove(vma, root);
^1da177e4c3f41 Linus Torvalds        2005-04-16  727  		if (adjust_next)
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  728  			vma_interval_tree_remove(next, root);
^1da177e4c3f41 Linus Torvalds        2005-04-16  729  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  730  
d37371870ceb1d Michel Lespinasse     2012-12-11  731  	if (start != vma->vm_start) {
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  732  		if ((vma->vm_start < start) &&
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  733  		    (!insert || (insert->vm_end != start))) {
524e00b36e8c54 Liam R. Howlett       2022-09-06  734  			vma_mas_szero(&mas, vma->vm_start, start);
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  735  			VM_WARN_ON(insert && insert->vm_start > vma->vm_start);
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  736  		} else {
524e00b36e8c54 Liam R. Howlett       2022-09-06  737  			vma_changed = true;
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  738  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  739  		vma->vm_start = start;
d37371870ceb1d Michel Lespinasse     2012-12-11  740  	}
d37371870ceb1d Michel Lespinasse     2012-12-11  741  	if (end != vma->vm_end) {
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  742  		if (vma->vm_end > end) {
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  743  			if (!insert || (insert->vm_start != end)) {
524e00b36e8c54 Liam R. Howlett       2022-09-06  744  				vma_mas_szero(&mas, end, vma->vm_end);
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  745  				VM_WARN_ON(insert &&
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  746  					   insert->vm_end < vma->vm_end);
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  747  			} else if (insert->vm_start == end) {
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  748  				ll_prev = vma->vm_end;
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  749  			}
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  750  		} else {
524e00b36e8c54 Liam R. Howlett       2022-09-06  751  			vma_changed = true;
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  752  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  753  		vma->vm_end = end;
524e00b36e8c54 Liam R. Howlett       2022-09-06 @754  		if (!next)
524e00b36e8c54 Liam R. Howlett       2022-09-06  755  			mm->highest_vm_end = vm_end_gap(vma);
d37371870ceb1d Michel Lespinasse     2012-12-11  756  	}
d4af56c5c7c678 Liam R. Howlett       2022-09-06  757  
524e00b36e8c54 Liam R. Howlett       2022-09-06  758  	if (vma_changed)
d4af56c5c7c678 Liam R. Howlett       2022-09-06  759  		vma_mas_store(vma, &mas);
d4af56c5c7c678 Liam R. Howlett       2022-09-06  760  
^1da177e4c3f41 Linus Torvalds        2005-04-16  761  	vma->vm_pgoff = pgoff;
^1da177e4c3f41 Linus Torvalds        2005-04-16  762  	if (adjust_next) {
f9d86a60572295 Wei Yang              2020-10-13 @763  		next->vm_start += adjust_next;
f9d86a60572295 Wei Yang              2020-10-13  764  		next->vm_pgoff += adjust_next >> PAGE_SHIFT;
d4af56c5c7c678 Liam R. Howlett       2022-09-06  765  		vma_mas_store(next, &mas);
^1da177e4c3f41 Linus Torvalds        2005-04-16  766  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  767  
0fc48a6e213ab8 Wei Yang              2020-10-13  768  	if (file) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  769  		if (adjust_next)
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  770  			vma_interval_tree_insert(next, root);
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  771  		vma_interval_tree_insert(vma, root);
^1da177e4c3f41 Linus Torvalds        2005-04-16  772  		flush_dcache_mmap_unlock(mapping);
^1da177e4c3f41 Linus Torvalds        2005-04-16  773  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  774  
^1da177e4c3f41 Linus Torvalds        2005-04-16  775  	if (remove_next) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  776  		/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  777  		 * vma_merge has merged next into vma, and needs
^1da177e4c3f41 Linus Torvalds        2005-04-16  778  		 * us to remove next before dropping the locks.
d4af56c5c7c678 Liam R. Howlett       2022-09-06  779  		 * Since we have expanded over this vma, the maple tree will
d4af56c5c7c678 Liam R. Howlett       2022-09-06  780  		 * have overwritten by storing the value
^1da177e4c3f41 Linus Torvalds        2005-04-16  781  		 */
524e00b36e8c54 Liam R. Howlett       2022-09-06  782  		__vma_unlink_list(mm, next);
d4af56c5c7c678 Liam R. Howlett       2022-09-06  783  		if (remove_next == 2)
524e00b36e8c54 Liam R. Howlett       2022-09-06  784  			__vma_unlink_list(mm, next_next);
524e00b36e8c54 Liam R. Howlett       2022-09-06  785  		/* Kill the cache */
524e00b36e8c54 Liam R. Howlett       2022-09-06  786  		vmacache_invalidate(mm);
524e00b36e8c54 Liam R. Howlett       2022-09-06  787  
d4af56c5c7c678 Liam R. Howlett       2022-09-06  788  		if (file) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  789  			__remove_shared_vm_struct(next, file, mapping);
d4af56c5c7c678 Liam R. Howlett       2022-09-06  790  			if (remove_next == 2)
d4af56c5c7c678 Liam R. Howlett       2022-09-06  791  				__remove_shared_vm_struct(next_next, file, mapping);
d4af56c5c7c678 Liam R. Howlett       2022-09-06  792  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  793  	} else if (insert) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  794  		/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  795  		 * split_vma has split insert from vma, and needs
^1da177e4c3f41 Linus Torvalds        2005-04-16  796  		 * us to insert it before dropping the locks
^1da177e4c3f41 Linus Torvalds        2005-04-16  797  		 * (it may either follow vma or precede it).
^1da177e4c3f41 Linus Torvalds        2005-04-16  798  		 */
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  799  		__insert_vm_struct(mm, &mas, insert, ll_prev);
^1da177e4c3f41 Linus Torvalds        2005-04-16  800  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  801  
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  802  	if (anon_vma) {
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  803  		anon_vma_interval_tree_post_update_vma(vma);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  804  		if (adjust_next)
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  805  			anon_vma_interval_tree_post_update_vma(next);
08b52706d50565 Konstantin Khlebnikov 2013-02-22  806  		anon_vma_unlock_write(anon_vma);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  807  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  808  
0fc48a6e213ab8 Wei Yang              2020-10-13  809  	if (file) {
808fbdbea05f1e Wei Yang              2020-10-13  810  		i_mmap_unlock_write(mapping);
7b2d81d48a2d8e Ingo Molnar           2012-02-17  811  		uprobe_mmap(vma);
2b144498350860 Srikar Dronamraju     2012-02-09  812  
2b144498350860 Srikar Dronamraju     2012-02-09  813  		if (adjust_next)
7b2d81d48a2d8e Ingo Molnar           2012-02-17  814  			uprobe_mmap(next);
2b144498350860 Srikar Dronamraju     2012-02-09  815  	}
2b144498350860 Srikar Dronamraju     2012-02-09  816  
^1da177e4c3f41 Linus Torvalds        2005-04-16  817  	if (remove_next) {
d4af56c5c7c678 Liam R. Howlett       2022-09-06  818  again:
925d1c401fa6cf Matt Helsley          2008-04-29  819  		if (file) {
cbc91f71b51b83 Srikar Dronamraju     2012-04-11  820  			uprobe_munmap(next, next->vm_start, next->vm_end);
^1da177e4c3f41 Linus Torvalds        2005-04-16  821  			fput(file);
925d1c401fa6cf Matt Helsley          2008-04-29  822  		}
5beb49305251e5 Rik van Riel          2010-03-05  823  		if (next->anon_vma)
5beb49305251e5 Rik van Riel          2010-03-05  824  			anon_vma_merge(vma, next);
^1da177e4c3f41 Linus Torvalds        2005-04-16  825  		mm->map_count--;
3964acd0dbec12 Oleg Nesterov         2013-07-31  826  		mpol_put(vma_policy(next));
524e00b36e8c54 Liam R. Howlett       2022-09-06  827  		if (remove_next != 2)
524e00b36e8c54 Liam R. Howlett       2022-09-06  828  			BUG_ON(vma->vm_end < next->vm_end);
3928d4f5ee37cd Linus Torvalds        2018-07-21  829  		vm_area_free(next);
524e00b36e8c54 Liam R. Howlett       2022-09-06  830  
^1da177e4c3f41 Linus Torvalds        2005-04-16  831  		/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  832  		 * In mprotect's case 6 (see comments on vma_merge),
^1da177e4c3f41 Linus Torvalds        2005-04-16  833  		 * we must remove another next too. It would clutter
^1da177e4c3f41 Linus Torvalds        2005-04-16  834  		 * up the code too much to do both in one go.
^1da177e4c3f41 Linus Torvalds        2005-04-16  835  		 */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  836  		if (remove_next != 3) {
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  837  			/*
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  838  			 * If "next" was removed and vma->vm_end was
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  839  			 * expanded (up) over it, in turn
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  840  			 * "next->vm_prev->vm_end" changed and the
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  841  			 * "vma->vm_next" gap must be updated.
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  842  			 */
d4af56c5c7c678 Liam R. Howlett       2022-09-06  843  			next = next_next;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  844  		} else {
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  845  			/*
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  846  			 * For the scope of the comment "next" and
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  847  			 * "vma" considered pre-swap(): if "vma" was
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  848  			 * removed, next->vm_start was expanded (down)
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  849  			 * over it and the "next" gap must be updated.
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  850  			 * Because of the swap() the post-swap() "vma"
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  851  			 * actually points to pre-swap() "next"
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  852  			 * (post-swap() "next" as opposed is now a
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  853  			 * dangling pointer).
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  854  			 */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  855  			next = vma;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  856  		}
734537c9cb725f Kirill A. Shutemov    2016-07-28  857  		if (remove_next == 2) {
734537c9cb725f Kirill A. Shutemov    2016-07-28  858  			remove_next = 1;
^1da177e4c3f41 Linus Torvalds        2005-04-16  859  			goto again;
524e00b36e8c54 Liam R. Howlett       2022-09-06  860  		} else if (!next) {
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  861  			/*
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  862  			 * If remove_next == 2 we obviously can't
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  863  			 * reach this path.
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  864  			 *
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  865  			 * If remove_next == 3 we can't reach this
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  866  			 * path because pre-swap() next is always not
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  867  			 * NULL. pre-swap() "next" is not being
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  868  			 * removed and its next->vm_end is not altered
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  869  			 * (and furthermore "end" already matches
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  870  			 * next->vm_end in remove_next == 3).
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  871  			 *
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  872  			 * We reach this only in the remove_next == 1
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  873  			 * case if the "next" vma that was removed was
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  874  			 * the highest vma of the mm. However in such
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  875  			 * case next->vm_end == "end" and the extended
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  876  			 * "vma" has vma->vm_end == next->vm_end so
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  877  			 * mm->highest_vm_end doesn't need any update
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  878  			 * in remove_next == 1 case.
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  879  			 */
1be7107fbe18ee Hugh Dickins          2017-06-19  880  			VM_WARN_ON(mm->highest_vm_end != vm_end_gap(vma));
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  881  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  882  	}
2b144498350860 Srikar Dronamraju     2012-02-09  883  	if (insert && file)
7b2d81d48a2d8e Ingo Molnar           2012-02-17  884  		uprobe_mmap(insert);
^1da177e4c3f41 Linus Torvalds        2005-04-16  885  
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  886  	mas_destroy(&mas);
^1da177e4c3f41 Linus Torvalds        2005-04-16  887  	validate_mm(mm);
5beb49305251e5 Rik van Riel          2010-03-05  888  	return 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  889  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  890  

:::::: The code at line 763 was first introduced by commit
:::::: f9d86a60572295ebb53c87a4305dc89b487711bd mm/mmap: leave adjust_next as virtual address instead of page frame number

:::::: TO: Wei Yang <richard.weiyang@linux.alibaba.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
