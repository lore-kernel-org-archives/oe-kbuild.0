Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229928F49
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Sep 2023 08:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695283835; x=1726819835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iEoZcSn66OwBxWo/mz3wA2G/7m6krVHj2V4G0uKLJv4=;
  b=ggcvecQmu+hJVrRchPO3/nYbu/7aGM8oTzpMdaOzwGpdX0+2tNZSS5L/
   DhVuxp1JVpMOMshJok0CSUpktw5Hlrk7X40jB3uHtdNGsPRiNWD8EaQzz
   L/O1957RI5Sh4LRNluncBuMGHdHY1c2vu7Bwh0PlBi65QII6etOocHMLS
   X1t/PCC/EE9oz+aJijRLriz/IGjl6yWvlKlwa7ymQk77nQAgOOLV4EVVi
   B/x5FY5FAfplV80jrLgyQd2I+wlt2scNuqSk4XyBhfiERm4vbTDLAAgj9
   Yc+2XIea7k0tLLNSJsoAOFprM4z1pPEthyD6WLfcJ6zZnjhd3IzueIiek
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377747109"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="377747109"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 01:10:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077814836"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077814836"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Sep 2023 01:10:32 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjEla-0009lQ-0F;
	Thu, 21 Sep 2023 08:10:30 +0000
Date: Thu, 21 Sep 2023 16:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 5/20] mm/mmap.c:771 __vma_adjust()
 error: we previously assumed 'insert' could be null (see line 769)
Message-ID: <202309211637.9fKADoOg-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   ac9005946aec30cb976c451c227899560b02cc37
commit: aede79b81ecd09d5f505f4b440b787c07f600a22 [5/20] ANDROID: mm: Fix __vma_adjust() writes for the maple tree
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20230917 (https://download.01.org/0day-ci/archive/20230921/202309211637.9fKADoOg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230921/202309211637.9fKADoOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309211637.9fKADoOg-lkp@intel.com/

smatch warnings:
mm/mmap.c:771 __vma_adjust() error: we previously assumed 'insert' could be null (see line 769)

vim +/insert +771 mm/mmap.c

4dd1b84140c1b87 Liam R. Howlett       2022-09-06  610  
^1da177e4c3f415 Linus Torvalds        2005-04-16  611  /*
^1da177e4c3f415 Linus Torvalds        2005-04-16  612   * We cannot adjust vm_start, vm_end, vm_pgoff fields of a vma that
^1da177e4c3f415 Linus Torvalds        2005-04-16  613   * is already present in an i_mmap tree without adjusting the tree.
^1da177e4c3f415 Linus Torvalds        2005-04-16  614   * The following helper function should be used when such adjustments
^1da177e4c3f415 Linus Torvalds        2005-04-16  615   * are necessary.  The "insert" vma (if any) is to be inserted
^1da177e4c3f415 Linus Torvalds        2005-04-16  616   * before we drop the necessary locks.
^1da177e4c3f415 Linus Torvalds        2005-04-16  617   */
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  618  int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  619  	unsigned long end, pgoff_t pgoff, struct vm_area_struct *insert,
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  620  	struct vm_area_struct *expand)
^1da177e4c3f415 Linus Torvalds        2005-04-16  621  {
^1da177e4c3f415 Linus Torvalds        2005-04-16  622  	struct mm_struct *mm = vma->vm_mm;
1cd916d0340d0f4 Andrew Morton         2022-10-18  623  	struct vm_area_struct *next_next = NULL;	/* uninit var warning */
1cd916d0340d0f4 Andrew Morton         2022-10-18  624  	struct vm_area_struct *next = find_vma(mm, vma->vm_end);
524e00b36e8c547 Liam R. Howlett       2022-09-06  625  	struct vm_area_struct *orig_vma = vma;
^1da177e4c3f415 Linus Torvalds        2005-04-16  626  	struct address_space *mapping = NULL;
f808c13fd373894 Davidlohr Bueso       2017-09-08  627  	struct rb_root_cached *root = NULL;
012f18004da33ba Rik van Riel          2010-08-09  628  	struct anon_vma *anon_vma = NULL;
^1da177e4c3f415 Linus Torvalds        2005-04-16  629  	struct file *file = vma->vm_file;
524e00b36e8c547 Liam R. Howlett       2022-09-06  630  	bool vma_changed = false;
^1da177e4c3f415 Linus Torvalds        2005-04-16  631  	long adjust_next = 0;
^1da177e4c3f415 Linus Torvalds        2005-04-16  632  	int remove_next = 0;
b802573f44901bf Liam R. Howlett       2023-05-01  633  	MA_STATE(mas, &mm->mm_mt, start, end - 1);
734537c9cb725fc Kirill A. Shutemov    2016-07-28  634  	struct vm_area_struct *exporter = NULL, *importer = NULL;
287d97ac0321367 Linus Torvalds        2010-04-10  635  
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  636  	if (next && !insert) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  637  		if (end >= next->vm_end) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  638  			/*
^1da177e4c3f415 Linus Torvalds        2005-04-16  639  			 * vma expands, overlapping all the next, and
^1da177e4c3f415 Linus Torvalds        2005-04-16  640  			 * perhaps the one after too (mprotect case 6).
86d12e471d9f152 Andrea Arcangeli      2016-10-07  641  			 * The only other cases that gets here are
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  642  			 * case 1, case 7 and case 8.
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  643  			 */
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  644  			if (next == expand) {
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  645  				/*
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  646  				 * The only case where we don't expand "vma"
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  647  				 * and we expand "next" instead is case 8.
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  648  				 */
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  649  				VM_WARN_ON(end != next->vm_end);
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  650  				/*
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  651  				 * remove_next == 3 means we're
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  652  				 * removing "vma" and that to do so we
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  653  				 * swapped "vma" and "next".
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  654  				 */
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  655  				remove_next = 3;
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  656  				VM_WARN_ON(file != next->vm_file);
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  657  				swap(vma, next);
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  658  			} else {
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  659  				VM_WARN_ON(expand != vma);
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  660  				/*
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  661  				 * case 1, 6, 7, remove_next == 2 is case 6,
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  662  				 * remove_next == 1 is case 1 or 7.
^1da177e4c3f415 Linus Torvalds        2005-04-16  663  				 */
734537c9cb725fc Kirill A. Shutemov    2016-07-28  664  				remove_next = 1 + (end > next->vm_end);
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  665  				if (remove_next == 2)
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  666  					next_next = find_vma(mm, next->vm_end);
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  667  
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  668  				VM_WARN_ON(remove_next == 2 &&
763ecb035029f50 Liam R. Howlett       2022-09-06  669  					   end != next_next->vm_end);
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  670  			}
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  671  
287d97ac0321367 Linus Torvalds        2010-04-10  672  			exporter = next;
^1da177e4c3f415 Linus Torvalds        2005-04-16  673  			importer = vma;
734537c9cb725fc Kirill A. Shutemov    2016-07-28  674  
734537c9cb725fc Kirill A. Shutemov    2016-07-28  675  			/*
734537c9cb725fc Kirill A. Shutemov    2016-07-28  676  			 * If next doesn't have anon_vma, import from vma after
734537c9cb725fc Kirill A. Shutemov    2016-07-28  677  			 * next, if the vma overlaps with it.
734537c9cb725fc Kirill A. Shutemov    2016-07-28  678  			 */
97a42cd4398162a Andrea Arcangeli      2016-10-07  679  			if (remove_next == 2 && !next->anon_vma)
763ecb035029f50 Liam R. Howlett       2022-09-06  680  				exporter = next_next;
734537c9cb725fc Kirill A. Shutemov    2016-07-28  681  
^1da177e4c3f415 Linus Torvalds        2005-04-16  682  		} else if (end > next->vm_start) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  683  			/*
^1da177e4c3f415 Linus Torvalds        2005-04-16  684  			 * vma expands, overlapping part of the next:
^1da177e4c3f415 Linus Torvalds        2005-04-16  685  			 * mprotect case 5 shifting the boundary up.
^1da177e4c3f415 Linus Torvalds        2005-04-16  686  			 */
f9d86a60572295e Wei Yang              2020-10-13  687  			adjust_next = (end - next->vm_start);
287d97ac0321367 Linus Torvalds        2010-04-10  688  			exporter = next;
^1da177e4c3f415 Linus Torvalds        2005-04-16  689  			importer = vma;
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  690  			VM_WARN_ON(expand != importer);
^1da177e4c3f415 Linus Torvalds        2005-04-16  691  		} else if (end < vma->vm_end) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  692  			/*
^1da177e4c3f415 Linus Torvalds        2005-04-16  693  			 * vma shrinks, and !insert tells it's not
^1da177e4c3f415 Linus Torvalds        2005-04-16  694  			 * split_vma inserting another: so it must be
^1da177e4c3f415 Linus Torvalds        2005-04-16  695  			 * mprotect case 4 shifting the boundary down.
^1da177e4c3f415 Linus Torvalds        2005-04-16  696  			 */
f9d86a60572295e Wei Yang              2020-10-13  697  			adjust_next = -(vma->vm_end - end);
287d97ac0321367 Linus Torvalds        2010-04-10  698  			exporter = vma;
^1da177e4c3f415 Linus Torvalds        2005-04-16  699  			importer = next;
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  700  			VM_WARN_ON(expand != importer);
^1da177e4c3f415 Linus Torvalds        2005-04-16  701  		}
^1da177e4c3f415 Linus Torvalds        2005-04-16  702  
5beb49305251e56 Rik van Riel          2010-03-05  703  		/*
5beb49305251e56 Rik van Riel          2010-03-05  704  		 * Easily overlooked: when mprotect shifts the boundary,
5beb49305251e56 Rik van Riel          2010-03-05  705  		 * make sure the expanding vma has anon_vma set if the
5beb49305251e56 Rik van Riel          2010-03-05  706  		 * shrinking vma had, to cover any anon pages imported.
5beb49305251e56 Rik van Riel          2010-03-05  707  		 */
287d97ac0321367 Linus Torvalds        2010-04-10  708  		if (exporter && exporter->anon_vma && !importer->anon_vma) {
c4ea95d7cd08d9f Daniel Forrest        2014-12-02  709  			int error;
c4ea95d7cd08d9f Daniel Forrest        2014-12-02  710  
b800c91a0517071 Konstantin Khlebnikov 2015-01-11  711  			importer->anon_vma = exporter->anon_vma;
c4ea95d7cd08d9f Daniel Forrest        2014-12-02  712  			error = anon_vma_clone(importer, exporter);
3fe89b3e2a7bbf3 Leon Yu               2015-03-25  713  			if (error)
c4ea95d7cd08d9f Daniel Forrest        2014-12-02  714  				return error;
b800c91a0517071 Konstantin Khlebnikov 2015-01-11  715  		}
5beb49305251e56 Rik van Riel          2010-03-05  716  	}
37f9f5595c26d3c Kirill A. Shutemov    2016-07-26  717  
aede79b81ecd09d Liam R. Howlett       2023-05-01  718  	if (adjust_next < 0)
aede79b81ecd09d Liam R. Howlett       2023-05-01  719  		mas_set_range(&mas, next->vm_start + adjust_next,
aede79b81ecd09d Liam R. Howlett       2023-05-01  720  			      next->vm_end - 1);
aede79b81ecd09d Liam R. Howlett       2023-05-01  721  	else if (insert)
aede79b81ecd09d Liam R. Howlett       2023-05-01  722  		mas_set_range(&mas, insert->vm_start, insert->vm_end - 1);
aede79b81ecd09d Liam R. Howlett       2023-05-01  723  
aede79b81ecd09d Liam R. Howlett       2023-05-01  724  
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  725  	if (mas_preallocate(&mas, vma, GFP_KERNEL))
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  726  		return -ENOMEM;
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  727  
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  728  	vma_adjust_trans_huge(orig_vma, start, end, adjust_next);
^1da177e4c3f415 Linus Torvalds        2005-04-16  729  	if (file) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  730  		mapping = file->f_mapping;
^1da177e4c3f415 Linus Torvalds        2005-04-16  731  		root = &mapping->i_mmap;
cbc91f71b51b833 Srikar Dronamraju     2012-04-11  732  		uprobe_munmap(vma, vma->vm_start, vma->vm_end);
682968e0c425c60 Srikar Dronamraju     2012-03-30  733  
682968e0c425c60 Srikar Dronamraju     2012-03-30  734  		if (adjust_next)
27ba0644ea9dfe6 Kirill A. Shutemov    2015-02-10  735  			uprobe_munmap(next, next->vm_start, next->vm_end);
682968e0c425c60 Srikar Dronamraju     2012-03-30  736  
83cde9e8ba95d18 Davidlohr Bueso       2014-12-12  737  		i_mmap_lock_write(mapping);
c154124fe925a45 Liam R. Howlett       2022-09-06  738  		if (insert && insert->vm_file) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  739  			/*
6b2dbba8b6ac4df Michel Lespinasse     2012-10-08  740  			 * Put into interval tree now, so instantiated pages
^1da177e4c3f415 Linus Torvalds        2005-04-16  741  			 * are visible to arm/parisc __flush_dcache_page
^1da177e4c3f415 Linus Torvalds        2005-04-16  742  			 * throughout; but we cannot insert into address
^1da177e4c3f415 Linus Torvalds        2005-04-16  743  			 * space until vma start or end is updated.
^1da177e4c3f415 Linus Torvalds        2005-04-16  744  			 */
c154124fe925a45 Liam R. Howlett       2022-09-06  745  			__vma_link_file(insert, insert->vm_file->f_mapping);
^1da177e4c3f415 Linus Torvalds        2005-04-16  746  		}
^1da177e4c3f415 Linus Torvalds        2005-04-16  747  	}
^1da177e4c3f415 Linus Torvalds        2005-04-16  748  
012f18004da33ba Rik van Riel          2010-08-09  749  	anon_vma = vma->anon_vma;
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  750  	if (!anon_vma && adjust_next)
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  751  		anon_vma = next->anon_vma;
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  752  	if (anon_vma) {
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  753  		VM_WARN_ON(adjust_next && next->anon_vma &&
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  754  			   anon_vma != next->anon_vma);
4fc3f1d66b1ef0d Ingo Molnar           2012-12-02  755  		anon_vma_lock_write(anon_vma);
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  756  		anon_vma_interval_tree_pre_update_vma(vma);
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  757  		if (adjust_next)
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  758  			anon_vma_interval_tree_pre_update_vma(next);
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  759  	}
012f18004da33ba Rik van Riel          2010-08-09  760  
0fc48a6e213ab8e Wei Yang              2020-10-13  761  	if (file) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  762  		flush_dcache_mmap_lock(mapping);
6b2dbba8b6ac4df Michel Lespinasse     2012-10-08  763  		vma_interval_tree_remove(vma, root);
^1da177e4c3f415 Linus Torvalds        2005-04-16  764  		if (adjust_next)
6b2dbba8b6ac4df Michel Lespinasse     2012-10-08  765  			vma_interval_tree_remove(next, root);
^1da177e4c3f415 Linus Torvalds        2005-04-16  766  	}
^1da177e4c3f415 Linus Torvalds        2005-04-16  767  
d37371870ceb1d2 Michel Lespinasse     2012-12-11  768  	if (start != vma->vm_start) {
aede79b81ecd09d Liam R. Howlett       2023-05-01 @769  		if ((vma->vm_start < start) && !insert) {
524e00b36e8c547 Liam R. Howlett       2022-09-06  770  			vma_mas_szero(&mas, vma->vm_start, start);
3b0e81a1cdc9afb Liam R. Howlett       2022-09-06 @771  			VM_WARN_ON(insert && insert->vm_start > vma->vm_start);
aede79b81ecd09d Liam R. Howlett       2023-05-01  772  		} else if (!insert) {
524e00b36e8c547 Liam R. Howlett       2022-09-06  773  			vma_changed = true;
3b0e81a1cdc9afb Liam R. Howlett       2022-09-06  774  		}
^1da177e4c3f415 Linus Torvalds        2005-04-16  775  		vma->vm_start = start;
d37371870ceb1d2 Michel Lespinasse     2012-12-11  776  	}
d37371870ceb1d2 Michel Lespinasse     2012-12-11  777  	if (end != vma->vm_end) {
3b0e81a1cdc9afb Liam R. Howlett       2022-09-06  778  		if (vma->vm_end > end) {
aede79b81ecd09d Liam R. Howlett       2023-05-01  779  			if (adjust_next >= 0 && !insert) {
524e00b36e8c547 Liam R. Howlett       2022-09-06  780  				vma_mas_szero(&mas, end, vma->vm_end);
763ecb035029f50 Liam R. Howlett       2022-09-06  781  				mas_reset(&mas);
3b0e81a1cdc9afb Liam R. Howlett       2022-09-06  782  				VM_WARN_ON(insert &&
3b0e81a1cdc9afb Liam R. Howlett       2022-09-06  783  					   insert->vm_end < vma->vm_end);
3b0e81a1cdc9afb Liam R. Howlett       2022-09-06  784  			}
aede79b81ecd09d Liam R. Howlett       2023-05-01  785  		} else if (!insert) {
524e00b36e8c547 Liam R. Howlett       2022-09-06  786  			vma_changed = true;
3b0e81a1cdc9afb Liam R. Howlett       2022-09-06  787  		}
^1da177e4c3f415 Linus Torvalds        2005-04-16  788  		vma->vm_end = end;
d37371870ceb1d2 Michel Lespinasse     2012-12-11  789  	}
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  790  
524e00b36e8c547 Liam R. Howlett       2022-09-06  791  	if (vma_changed)
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  792  		vma_mas_store(vma, &mas);
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  793  
^1da177e4c3f415 Linus Torvalds        2005-04-16  794  	vma->vm_pgoff = pgoff;
^1da177e4c3f415 Linus Torvalds        2005-04-16  795  	if (adjust_next) {
f9d86a60572295e Wei Yang              2020-10-13  796  		next->vm_start += adjust_next;
f9d86a60572295e Wei Yang              2020-10-13  797  		next->vm_pgoff += adjust_next >> PAGE_SHIFT;
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  798  		vma_mas_store(next, &mas);
^1da177e4c3f415 Linus Torvalds        2005-04-16  799  	}
^1da177e4c3f415 Linus Torvalds        2005-04-16  800  
0fc48a6e213ab8e Wei Yang              2020-10-13  801  	if (file) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  802  		if (adjust_next)
6b2dbba8b6ac4df Michel Lespinasse     2012-10-08  803  			vma_interval_tree_insert(next, root);
6b2dbba8b6ac4df Michel Lespinasse     2012-10-08  804  		vma_interval_tree_insert(vma, root);
^1da177e4c3f415 Linus Torvalds        2005-04-16  805  		flush_dcache_mmap_unlock(mapping);
^1da177e4c3f415 Linus Torvalds        2005-04-16  806  	}
^1da177e4c3f415 Linus Torvalds        2005-04-16  807  
763ecb035029f50 Liam R. Howlett       2022-09-06  808  	if (remove_next && file) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  809  		__remove_shared_vm_struct(next, file, mapping);
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  810  		if (remove_next == 2)
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  811  			__remove_shared_vm_struct(next_next, file, mapping);
^1da177e4c3f415 Linus Torvalds        2005-04-16  812  	} else if (insert) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  813  		/*
^1da177e4c3f415 Linus Torvalds        2005-04-16  814  		 * split_vma has split insert from vma, and needs
^1da177e4c3f415 Linus Torvalds        2005-04-16  815  		 * us to insert it before dropping the locks
^1da177e4c3f415 Linus Torvalds        2005-04-16  816  		 * (it may either follow vma or precede it).
^1da177e4c3f415 Linus Torvalds        2005-04-16  817  		 */
763ecb035029f50 Liam R. Howlett       2022-09-06  818  		mas_reset(&mas);
763ecb035029f50 Liam R. Howlett       2022-09-06  819  		vma_mas_store(insert, &mas);
763ecb035029f50 Liam R. Howlett       2022-09-06  820  		mm->map_count++;
^1da177e4c3f415 Linus Torvalds        2005-04-16  821  	}
^1da177e4c3f415 Linus Torvalds        2005-04-16  822  
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  823  	if (anon_vma) {
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  824  		anon_vma_interval_tree_post_update_vma(vma);
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  825  		if (adjust_next)
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  826  			anon_vma_interval_tree_post_update_vma(next);
08b52706d505658 Konstantin Khlebnikov 2013-02-22  827  		anon_vma_unlock_write(anon_vma);
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  828  	}
^1da177e4c3f415 Linus Torvalds        2005-04-16  829  
0fc48a6e213ab8e Wei Yang              2020-10-13  830  	if (file) {
808fbdbea05f1e9 Wei Yang              2020-10-13  831  		i_mmap_unlock_write(mapping);
7b2d81d48a2d8e3 Ingo Molnar           2012-02-17  832  		uprobe_mmap(vma);
2b144498350860b Srikar Dronamraju     2012-02-09  833  
2b144498350860b Srikar Dronamraju     2012-02-09  834  		if (adjust_next)
7b2d81d48a2d8e3 Ingo Molnar           2012-02-17  835  			uprobe_mmap(next);
2b144498350860b Srikar Dronamraju     2012-02-09  836  	}
2b144498350860b Srikar Dronamraju     2012-02-09  837  
^1da177e4c3f415 Linus Torvalds        2005-04-16  838  	if (remove_next) {
d4af56c5c7c6781 Liam R. Howlett       2022-09-06  839  again:
925d1c401fa6cfd Matt Helsley          2008-04-29  840  		if (file) {
cbc91f71b51b833 Srikar Dronamraju     2012-04-11  841  			uprobe_munmap(next, next->vm_start, next->vm_end);
^1da177e4c3f415 Linus Torvalds        2005-04-16  842  			fput(file);
925d1c401fa6cfd Matt Helsley          2008-04-29  843  		}
5beb49305251e56 Rik van Riel          2010-03-05  844  		if (next->anon_vma)
5beb49305251e56 Rik van Riel          2010-03-05  845  			anon_vma_merge(vma, next);
^1da177e4c3f415 Linus Torvalds        2005-04-16  846  		mm->map_count--;
3964acd0dbec123 Oleg Nesterov         2013-07-31  847  		mpol_put(vma_policy(next));
524e00b36e8c547 Liam R. Howlett       2022-09-06  848  		if (remove_next != 2)
524e00b36e8c547 Liam R. Howlett       2022-09-06  849  			BUG_ON(vma->vm_end < next->vm_end);
3928d4f5ee37cdc Linus Torvalds        2018-07-21  850  		vm_area_free(next);
524e00b36e8c547 Liam R. Howlett       2022-09-06  851  
^1da177e4c3f415 Linus Torvalds        2005-04-16  852  		/*
^1da177e4c3f415 Linus Torvalds        2005-04-16  853  		 * In mprotect's case 6 (see comments on vma_merge),
763ecb035029f50 Liam R. Howlett       2022-09-06  854  		 * we must remove next_next too.
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  855  		 */
734537c9cb725fc Kirill A. Shutemov    2016-07-28  856  		if (remove_next == 2) {
734537c9cb725fc Kirill A. Shutemov    2016-07-28  857  			remove_next = 1;
763ecb035029f50 Liam R. Howlett       2022-09-06  858  			next = next_next;
^1da177e4c3f415 Linus Torvalds        2005-04-16  859  			goto again;
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  860  		}
^1da177e4c3f415 Linus Torvalds        2005-04-16  861  	}
2b144498350860b Srikar Dronamraju     2012-02-09  862  	if (insert && file)
7b2d81d48a2d8e3 Ingo Molnar           2012-02-17  863  		uprobe_mmap(insert);
^1da177e4c3f415 Linus Torvalds        2005-04-16  864  
3b0e81a1cdc9afb Liam R. Howlett       2022-09-06  865  	mas_destroy(&mas);
^1da177e4c3f415 Linus Torvalds        2005-04-16  866  	validate_mm(mm);
763ecb035029f50 Liam R. Howlett       2022-09-06  867  
5beb49305251e56 Rik van Riel          2010-03-05  868  	return 0;
^1da177e4c3f415 Linus Torvalds        2005-04-16  869  }
^1da177e4c3f415 Linus Torvalds        2005-04-16  870  

:::::: The code at line 771 was first introduced by commit
:::::: 3b0e81a1cdc9afbddb0543d08e38edb4e33c4baf mmap: change zeroing of maple tree in __vma_adjust()

:::::: TO: Liam R. Howlett <Liam.Howlett@Oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
