Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F321E0B9C
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Feb 2026 18:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771786797; cv=none; b=stmAe0f99wrCQZpiqUIQUiLrhppVL3prH8ZKnDz8t/z0euRybe/GpAqril5gMOBaQqKlKKFHdWxgjt8gfNSWIcTPHYTN44tGtfAz89+NBBT0mwZtDlkZSTxPxF/8SfmFW4K8bmj7R/owtRlNb2KKVb0ytsBYgDwVSJS6jKFCC2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771786797; c=relaxed/simple;
	bh=Gv5D8pWOEeEpoySNByuHQnZoNq4rGslWSqInWrguqZw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G0TM85oWy1ClzsRulr89Tj+RYD6Vz4T8l4BoofLBrZSeFfFGd4fyIxtUEdv0/5z8DhlQk83u+mmLoiiisa1P7IbvRkELQfh550jlkJEceL4eRpzyQFrD7GARvx6R/XTm6Ve5rDZmmruOAJ691id4dF4DROapWJpxVbz/pRJQyZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBdPjT1m; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBdPjT1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771786795; x=1803322795;
  h=date:from:to:cc:subject:message-id;
  bh=Gv5D8pWOEeEpoySNByuHQnZoNq4rGslWSqInWrguqZw=;
  b=mBdPjT1mbI3cqqZ073z5OIsOXX1DUryUQFBs+OB5qoSkb8LmaGp+WqfA
   iRHNMDLBsDAomiLNyqekAWJpC7SQPir8mDsN1DBkDGanQ+qWbU7IH6GjW
   1c/r45JlHc6EJkyBo6i6Kal4dczSLTbwEnn3WgpW0CbOOH7FZAOCDvJYd
   ygbSdw66a1RV81zbxZCosIO9sPT5dxsuPu1RV8d+YCS449wX62+jPqzau
   +XO2TXETMONqIMZRDbxZ4XOTXHDSoy1n6Jbj/zyQTs1XGI3oziLDFHY8r
   svYj4sAl7ZVzH+wI3ep/l75T+xYekxDe0lbGUKvOgUxg2S7Lcp2OuUHyS
   A==;
X-CSE-ConnectionGUID: k113SoH7Sbi0n8o3/3/BaA==
X-CSE-MsgGUID: oeWlW0lpR6S3BG2Fc9sanQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76624616"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="76624616"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 10:59:54 -0800
X-CSE-ConnectionGUID: 2uSIpudyTSeX5jgyqMj0BA==
X-CSE-MsgGUID: 9D8iWuRGT7W33B/r/Iz01Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="220346512"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Feb 2026 10:59:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuEgI-000000015f4-3QnO;
	Sun, 22 Feb 2026 18:59:50 +0000
Date: Mon, 23 Feb 2026 02:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 1/1] mm/mmap.c:685
 __vma_adjust() error: we previously assumed 'next_next' could be null (see
 line 681)
Message-ID: <202602230245.UHMuZacF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   34c1a8e172009d17c9531c569a4c72ef86a06d86
commit: 57b3f8a5ab282f7d9fe6564a310e02675faeba89 [1/1] FROMLIST: mm/mmap: write-lock VMAs in vma_adjust
:::::: branch date: 7 hours ago
:::::: commit date: 2 years, 9 months ago
config: i386-randconfig-141-20260222 (https://download.01.org/0day-ci/archive/20260223/202602230245.UHMuZacF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602230245.UHMuZacF-lkp@intel.com/

smatch warnings:
mm/mmap.c:685 __vma_adjust() error: we previously assumed 'next_next' could be null (see line 681)

vim +/next_next +685 mm/mmap.c

4dd1b84140c1b8 Liam R. Howlett       2022-09-06  614  
^1da177e4c3f41 Linus Torvalds        2005-04-16  615  /*
^1da177e4c3f41 Linus Torvalds        2005-04-16  616   * We cannot adjust vm_start, vm_end, vm_pgoff fields of a vma that
^1da177e4c3f41 Linus Torvalds        2005-04-16  617   * is already present in an i_mmap tree without adjusting the tree.
^1da177e4c3f41 Linus Torvalds        2005-04-16  618   * The following helper function should be used when such adjustments
^1da177e4c3f41 Linus Torvalds        2005-04-16  619   * are necessary.  The "insert" vma (if any) is to be inserted
^1da177e4c3f41 Linus Torvalds        2005-04-16  620   * before we drop the necessary locks.
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09  621   * 'expand' vma is always locked before it's passed to __vma_adjust()
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09  622   * from vma_merge() because vma should not change from the moment
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09  623   * can_vma_merge_{before|after} decision is made.
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09  624   * 'insert' vma is used only by __split_vma() and it's always a brand
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09  625   * new vma which is not yet added into mm's vma tree, therefore no need
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09  626   * to lock it.
^1da177e4c3f41 Linus Torvalds        2005-04-16  627   */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  628  int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  629  	unsigned long end, pgoff_t pgoff, struct vm_area_struct *insert,
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  630  	struct vm_area_struct *expand)
^1da177e4c3f41 Linus Torvalds        2005-04-16  631  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  632  	struct mm_struct *mm = vma->vm_mm;
1cd916d0340d0f Andrew Morton         2022-10-18  633  	struct vm_area_struct *next_next = NULL;	/* uninit var warning */
1cd916d0340d0f Andrew Morton         2022-10-18  634  	struct vm_area_struct *next = find_vma(mm, vma->vm_end);
524e00b36e8c54 Liam R. Howlett       2022-09-06  635  	struct vm_area_struct *orig_vma = vma;
^1da177e4c3f41 Linus Torvalds        2005-04-16  636  	struct address_space *mapping = NULL;
f808c13fd37389 Davidlohr Bueso       2017-09-08  637  	struct rb_root_cached *root = NULL;
012f18004da33b Rik van Riel          2010-08-09  638  	struct anon_vma *anon_vma = NULL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  639  	struct file *file = vma->vm_file;
524e00b36e8c54 Liam R. Howlett       2022-09-06  640  	bool vma_changed = false;
^1da177e4c3f41 Linus Torvalds        2005-04-16  641  	long adjust_next = 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  642  	int remove_next = 0;
b802573f44901b Liam R. Howlett       2023-05-01  643  	MA_STATE(mas, &mm->mm_mt, start, end - 1);
734537c9cb725f Kirill A. Shutemov    2016-07-28  644  	struct vm_area_struct *exporter = NULL, *importer = NULL;
287d97ac032136 Linus Torvalds        2010-04-10  645  
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09  646  	vma_start_write(vma);
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09  647  	if (next)
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09  648  		vma_start_write(next);
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09  649  
d4af56c5c7c678 Liam R. Howlett       2022-09-06  650  	if (next && !insert) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  651  		if (end >= next->vm_end) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  652  			/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  653  			 * vma expands, overlapping all the next, and
^1da177e4c3f41 Linus Torvalds        2005-04-16  654  			 * perhaps the one after too (mprotect case 6).
86d12e471d9f15 Andrea Arcangeli      2016-10-07  655  			 * The only other cases that gets here are
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  656  			 * case 1, case 7 and case 8.
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  657  			 */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  658  			if (next == expand) {
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  659  				/*
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  660  				 * The only case where we don't expand "vma"
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  661  				 * and we expand "next" instead is case 8.
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  662  				 */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  663  				VM_WARN_ON(end != next->vm_end);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  664  				/*
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  665  				 * remove_next == 3 means we're
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  666  				 * removing "vma" and that to do so we
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  667  				 * swapped "vma" and "next".
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  668  				 */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  669  				remove_next = 3;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  670  				VM_WARN_ON(file != next->vm_file);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  671  				swap(vma, next);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  672  			} else {
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  673  				VM_WARN_ON(expand != vma);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  674  				/*
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  675  				 * case 1, 6, 7, remove_next == 2 is case 6,
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  676  				 * remove_next == 1 is case 1 or 7.
^1da177e4c3f41 Linus Torvalds        2005-04-16  677  				 */
734537c9cb725f Kirill A. Shutemov    2016-07-28  678  				remove_next = 1 + (end > next->vm_end);
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09  679  				if (remove_next == 2) {
d4af56c5c7c678 Liam R. Howlett       2022-09-06  680  					next_next = find_vma(mm, next->vm_end);
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09 @681  					if (next_next)
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09  682  						vma_start_write(next_next);
57b3f8a5ab282f Suren Baghdasaryan    2023-01-09  683  				}
d4af56c5c7c678 Liam R. Howlett       2022-09-06  684  
e86f15ee64d8ee Andrea Arcangeli      2016-10-07 @685  				VM_WARN_ON(remove_next == 2 &&
763ecb035029f5 Liam R. Howlett       2022-09-06  686  					   end != next_next->vm_end);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  687  			}
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  688  
287d97ac032136 Linus Torvalds        2010-04-10  689  			exporter = next;
^1da177e4c3f41 Linus Torvalds        2005-04-16  690  			importer = vma;
734537c9cb725f Kirill A. Shutemov    2016-07-28  691  
734537c9cb725f Kirill A. Shutemov    2016-07-28  692  			/*
734537c9cb725f Kirill A. Shutemov    2016-07-28  693  			 * If next doesn't have anon_vma, import from vma after
734537c9cb725f Kirill A. Shutemov    2016-07-28  694  			 * next, if the vma overlaps with it.
734537c9cb725f Kirill A. Shutemov    2016-07-28  695  			 */
97a42cd4398162 Andrea Arcangeli      2016-10-07  696  			if (remove_next == 2 && !next->anon_vma)
763ecb035029f5 Liam R. Howlett       2022-09-06  697  				exporter = next_next;
734537c9cb725f Kirill A. Shutemov    2016-07-28  698  
^1da177e4c3f41 Linus Torvalds        2005-04-16  699  		} else if (end > next->vm_start) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  700  			/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  701  			 * vma expands, overlapping part of the next:
^1da177e4c3f41 Linus Torvalds        2005-04-16  702  			 * mprotect case 5 shifting the boundary up.
^1da177e4c3f41 Linus Torvalds        2005-04-16  703  			 */
f9d86a60572295 Wei Yang              2020-10-13  704  			adjust_next = (end - next->vm_start);
287d97ac032136 Linus Torvalds        2010-04-10  705  			exporter = next;
^1da177e4c3f41 Linus Torvalds        2005-04-16  706  			importer = vma;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  707  			VM_WARN_ON(expand != importer);
^1da177e4c3f41 Linus Torvalds        2005-04-16  708  		} else if (end < vma->vm_end) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  709  			/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  710  			 * vma shrinks, and !insert tells it's not
^1da177e4c3f41 Linus Torvalds        2005-04-16  711  			 * split_vma inserting another: so it must be
^1da177e4c3f41 Linus Torvalds        2005-04-16  712  			 * mprotect case 4 shifting the boundary down.
^1da177e4c3f41 Linus Torvalds        2005-04-16  713  			 */
f9d86a60572295 Wei Yang              2020-10-13  714  			adjust_next = -(vma->vm_end - end);
287d97ac032136 Linus Torvalds        2010-04-10  715  			exporter = vma;
^1da177e4c3f41 Linus Torvalds        2005-04-16  716  			importer = next;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  717  			VM_WARN_ON(expand != importer);
^1da177e4c3f41 Linus Torvalds        2005-04-16  718  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  719  
5beb49305251e5 Rik van Riel          2010-03-05  720  		/*
5beb49305251e5 Rik van Riel          2010-03-05  721  		 * Easily overlooked: when mprotect shifts the boundary,
5beb49305251e5 Rik van Riel          2010-03-05  722  		 * make sure the expanding vma has anon_vma set if the
5beb49305251e5 Rik van Riel          2010-03-05  723  		 * shrinking vma had, to cover any anon pages imported.
5beb49305251e5 Rik van Riel          2010-03-05  724  		 */
287d97ac032136 Linus Torvalds        2010-04-10  725  		if (exporter && exporter->anon_vma && !importer->anon_vma) {
c4ea95d7cd08d9 Daniel Forrest        2014-12-02  726  			int error;
c4ea95d7cd08d9 Daniel Forrest        2014-12-02  727  
b800c91a051707 Konstantin Khlebnikov 2015-01-11  728  			importer->anon_vma = exporter->anon_vma;
c4ea95d7cd08d9 Daniel Forrest        2014-12-02  729  			error = anon_vma_clone(importer, exporter);
3fe89b3e2a7bbf Leon Yu               2015-03-25  730  			if (error)
c4ea95d7cd08d9 Daniel Forrest        2014-12-02  731  				return error;
b800c91a051707 Konstantin Khlebnikov 2015-01-11  732  		}
5beb49305251e5 Rik van Riel          2010-03-05  733  	}
37f9f5595c26d3 Kirill A. Shutemov    2016-07-26  734  
aede79b81ecd09 Liam R. Howlett       2023-05-01  735  	if (adjust_next < 0)
aede79b81ecd09 Liam R. Howlett       2023-05-01  736  		mas_set_range(&mas, next->vm_start + adjust_next,
aede79b81ecd09 Liam R. Howlett       2023-05-01  737  			      next->vm_end - 1);
aede79b81ecd09 Liam R. Howlett       2023-05-01  738  	else if (insert)
aede79b81ecd09 Liam R. Howlett       2023-05-01  739  		mas_set_range(&mas, insert->vm_start, insert->vm_end - 1);
aede79b81ecd09 Liam R. Howlett       2023-05-01  740  
aede79b81ecd09 Liam R. Howlett       2023-05-01  741  
d4af56c5c7c678 Liam R. Howlett       2022-09-06  742  	if (mas_preallocate(&mas, vma, GFP_KERNEL))
d4af56c5c7c678 Liam R. Howlett       2022-09-06  743  		return -ENOMEM;
d4af56c5c7c678 Liam R. Howlett       2022-09-06  744  
d4af56c5c7c678 Liam R. Howlett       2022-09-06  745  	vma_adjust_trans_huge(orig_vma, start, end, adjust_next);
^1da177e4c3f41 Linus Torvalds        2005-04-16  746  	if (file) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  747  		mapping = file->f_mapping;
^1da177e4c3f41 Linus Torvalds        2005-04-16  748  		root = &mapping->i_mmap;
cbc91f71b51b83 Srikar Dronamraju     2012-04-11  749  		uprobe_munmap(vma, vma->vm_start, vma->vm_end);
682968e0c425c6 Srikar Dronamraju     2012-03-30  750  
682968e0c425c6 Srikar Dronamraju     2012-03-30  751  		if (adjust_next)
27ba0644ea9dfe Kirill A. Shutemov    2015-02-10  752  			uprobe_munmap(next, next->vm_start, next->vm_end);
682968e0c425c6 Srikar Dronamraju     2012-03-30  753  
83cde9e8ba95d1 Davidlohr Bueso       2014-12-12  754  		i_mmap_lock_write(mapping);
c154124fe925a4 Liam R. Howlett       2022-09-06  755  		if (insert && insert->vm_file) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  756  			/*
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  757  			 * Put into interval tree now, so instantiated pages
^1da177e4c3f41 Linus Torvalds        2005-04-16  758  			 * are visible to arm/parisc __flush_dcache_page
^1da177e4c3f41 Linus Torvalds        2005-04-16  759  			 * throughout; but we cannot insert into address
^1da177e4c3f41 Linus Torvalds        2005-04-16  760  			 * space until vma start or end is updated.
^1da177e4c3f41 Linus Torvalds        2005-04-16  761  			 */
c154124fe925a4 Liam R. Howlett       2022-09-06  762  			__vma_link_file(insert, insert->vm_file->f_mapping);
^1da177e4c3f41 Linus Torvalds        2005-04-16  763  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  764  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  765  
012f18004da33b Rik van Riel          2010-08-09  766  	anon_vma = vma->anon_vma;
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  767  	if (!anon_vma && adjust_next)
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  768  		anon_vma = next->anon_vma;
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  769  	if (anon_vma) {
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  770  		VM_WARN_ON(adjust_next && next->anon_vma &&
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  771  			   anon_vma != next->anon_vma);
4fc3f1d66b1ef0 Ingo Molnar           2012-12-02  772  		anon_vma_lock_write(anon_vma);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  773  		anon_vma_interval_tree_pre_update_vma(vma);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  774  		if (adjust_next)
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  775  			anon_vma_interval_tree_pre_update_vma(next);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  776  	}
012f18004da33b Rik van Riel          2010-08-09  777  
0fc48a6e213ab8 Wei Yang              2020-10-13  778  	if (file) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  779  		flush_dcache_mmap_lock(mapping);
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  780  		vma_interval_tree_remove(vma, root);
^1da177e4c3f41 Linus Torvalds        2005-04-16  781  		if (adjust_next)
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  782  			vma_interval_tree_remove(next, root);
^1da177e4c3f41 Linus Torvalds        2005-04-16  783  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  784  
d37371870ceb1d Michel Lespinasse     2012-12-11  785  	if (start != vma->vm_start) {
aede79b81ecd09 Liam R. Howlett       2023-05-01  786  		if ((vma->vm_start < start) && !insert) {
524e00b36e8c54 Liam R. Howlett       2022-09-06  787  			vma_mas_szero(&mas, vma->vm_start, start);
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  788  			VM_WARN_ON(insert && insert->vm_start > vma->vm_start);
aede79b81ecd09 Liam R. Howlett       2023-05-01  789  		} else if (!insert) {
524e00b36e8c54 Liam R. Howlett       2022-09-06  790  			vma_changed = true;
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  791  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  792  		vma->vm_start = start;
d37371870ceb1d Michel Lespinasse     2012-12-11  793  	}
d37371870ceb1d Michel Lespinasse     2012-12-11  794  	if (end != vma->vm_end) {
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  795  		if (vma->vm_end > end) {
aede79b81ecd09 Liam R. Howlett       2023-05-01  796  			if (adjust_next >= 0 && !insert) {
524e00b36e8c54 Liam R. Howlett       2022-09-06  797  				vma_mas_szero(&mas, end, vma->vm_end);
763ecb035029f5 Liam R. Howlett       2022-09-06  798  				mas_reset(&mas);
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  799  				VM_WARN_ON(insert &&
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  800  					   insert->vm_end < vma->vm_end);
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  801  			}
aede79b81ecd09 Liam R. Howlett       2023-05-01  802  		} else if (!insert) {
524e00b36e8c54 Liam R. Howlett       2022-09-06  803  			vma_changed = true;
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  804  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  805  		vma->vm_end = end;
d37371870ceb1d Michel Lespinasse     2012-12-11  806  	}
d4af56c5c7c678 Liam R. Howlett       2022-09-06  807  
524e00b36e8c54 Liam R. Howlett       2022-09-06  808  	if (vma_changed)
d4af56c5c7c678 Liam R. Howlett       2022-09-06  809  		vma_mas_store(vma, &mas);
d4af56c5c7c678 Liam R. Howlett       2022-09-06  810  
^1da177e4c3f41 Linus Torvalds        2005-04-16  811  	vma->vm_pgoff = pgoff;
^1da177e4c3f41 Linus Torvalds        2005-04-16  812  	if (adjust_next) {
f9d86a60572295 Wei Yang              2020-10-13  813  		next->vm_start += adjust_next;
f9d86a60572295 Wei Yang              2020-10-13  814  		next->vm_pgoff += adjust_next >> PAGE_SHIFT;
d4af56c5c7c678 Liam R. Howlett       2022-09-06  815  		vma_mas_store(next, &mas);
^1da177e4c3f41 Linus Torvalds        2005-04-16  816  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  817  
0fc48a6e213ab8 Wei Yang              2020-10-13  818  	if (file) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  819  		if (adjust_next)
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  820  			vma_interval_tree_insert(next, root);
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  821  		vma_interval_tree_insert(vma, root);
^1da177e4c3f41 Linus Torvalds        2005-04-16  822  		flush_dcache_mmap_unlock(mapping);
^1da177e4c3f41 Linus Torvalds        2005-04-16  823  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  824  
763ecb035029f5 Liam R. Howlett       2022-09-06  825  	if (remove_next && file) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  826  		__remove_shared_vm_struct(next, file, mapping);
d4af56c5c7c678 Liam R. Howlett       2022-09-06  827  		if (remove_next == 2)
d4af56c5c7c678 Liam R. Howlett       2022-09-06  828  			__remove_shared_vm_struct(next_next, file, mapping);
^1da177e4c3f41 Linus Torvalds        2005-04-16  829  	} else if (insert) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  830  		/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  831  		 * split_vma has split insert from vma, and needs
^1da177e4c3f41 Linus Torvalds        2005-04-16  832  		 * us to insert it before dropping the locks
^1da177e4c3f41 Linus Torvalds        2005-04-16  833  		 * (it may either follow vma or precede it).
^1da177e4c3f41 Linus Torvalds        2005-04-16  834  		 */
763ecb035029f5 Liam R. Howlett       2022-09-06  835  		mas_reset(&mas);
763ecb035029f5 Liam R. Howlett       2022-09-06  836  		vma_mas_store(insert, &mas);
763ecb035029f5 Liam R. Howlett       2022-09-06  837  		mm->map_count++;
^1da177e4c3f41 Linus Torvalds        2005-04-16  838  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  839  
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  840  	if (anon_vma) {
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  841  		anon_vma_interval_tree_post_update_vma(vma);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  842  		if (adjust_next)
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  843  			anon_vma_interval_tree_post_update_vma(next);
08b52706d50565 Konstantin Khlebnikov 2013-02-22  844  		anon_vma_unlock_write(anon_vma);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  845  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  846  
0fc48a6e213ab8 Wei Yang              2020-10-13  847  	if (file) {
808fbdbea05f1e Wei Yang              2020-10-13  848  		i_mmap_unlock_write(mapping);
7b2d81d48a2d8e Ingo Molnar           2012-02-17  849  		uprobe_mmap(vma);
2b144498350860 Srikar Dronamraju     2012-02-09  850  
2b144498350860 Srikar Dronamraju     2012-02-09  851  		if (adjust_next)
7b2d81d48a2d8e Ingo Molnar           2012-02-17  852  			uprobe_mmap(next);
2b144498350860 Srikar Dronamraju     2012-02-09  853  	}
2b144498350860 Srikar Dronamraju     2012-02-09  854  
^1da177e4c3f41 Linus Torvalds        2005-04-16  855  	if (remove_next) {
d4af56c5c7c678 Liam R. Howlett       2022-09-06  856  again:
925d1c401fa6cf Matt Helsley          2008-04-29  857  		if (file) {
cbc91f71b51b83 Srikar Dronamraju     2012-04-11  858  			uprobe_munmap(next, next->vm_start, next->vm_end);
^1da177e4c3f41 Linus Torvalds        2005-04-16  859  			fput(file);
925d1c401fa6cf Matt Helsley          2008-04-29  860  		}
5beb49305251e5 Rik van Riel          2010-03-05  861  		if (next->anon_vma)
5beb49305251e5 Rik van Riel          2010-03-05  862  			anon_vma_merge(vma, next);
^1da177e4c3f41 Linus Torvalds        2005-04-16  863  		mm->map_count--;
3964acd0dbec12 Oleg Nesterov         2013-07-31  864  		mpol_put(vma_policy(next));
524e00b36e8c54 Liam R. Howlett       2022-09-06  865  		if (remove_next != 2)
524e00b36e8c54 Liam R. Howlett       2022-09-06  866  			BUG_ON(vma->vm_end < next->vm_end);
3928d4f5ee37cd Linus Torvalds        2018-07-21  867  		vm_area_free(next);
524e00b36e8c54 Liam R. Howlett       2022-09-06  868  
^1da177e4c3f41 Linus Torvalds        2005-04-16  869  		/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  870  		 * In mprotect's case 6 (see comments on vma_merge),
763ecb035029f5 Liam R. Howlett       2022-09-06  871  		 * we must remove next_next too.
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  872  		 */
734537c9cb725f Kirill A. Shutemov    2016-07-28  873  		if (remove_next == 2) {
734537c9cb725f Kirill A. Shutemov    2016-07-28  874  			remove_next = 1;
763ecb035029f5 Liam R. Howlett       2022-09-06  875  			next = next_next;
^1da177e4c3f41 Linus Torvalds        2005-04-16  876  			goto again;
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  877  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  878  	}
2b144498350860 Srikar Dronamraju     2012-02-09  879  	if (insert && file)
7b2d81d48a2d8e Ingo Molnar           2012-02-17  880  		uprobe_mmap(insert);
^1da177e4c3f41 Linus Torvalds        2005-04-16  881  
3b0e81a1cdc9af Liam R. Howlett       2022-09-06  882  	mas_destroy(&mas);
^1da177e4c3f41 Linus Torvalds        2005-04-16  883  	validate_mm(mm);
763ecb035029f5 Liam R. Howlett       2022-09-06  884  
5beb49305251e5 Rik van Riel          2010-03-05  885  	return 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  886  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  887  

:::::: The code at line 685 was first introduced by commit
:::::: e86f15ee64d8ee46255d964d55f74f5ba9af8c36 mm: vma_merge: fix vm_page_prot SMP race condition against rmap_walk

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
