Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E714BA54
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 18:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679595881; x=1711131881;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VogKzzZgYQOdEzAw+BSbu6pKWYAbh3GYI7+4DDEXTTw=;
  b=Q1GOsEtZuqMm7B+xM0l403Hok+B8cA4Xo/P88CwNM/EIQaUH949Qvjsf
   93RsXXVNfG1bI8At9utLNqDM5w2DwajH0M2zDJJ0TbNvmWCI4jL5wD82e
   IGbezb8ATMUPzw2aDI/HKr2OVb59aVQlg72adatKABM96piaT2KNNMAgp
   ZtvARWOeOzxNsBOFAr3Trj33f3ROsOwAO8UVvVLQS4YJ0oQC9wcRhnfKU
   8J47bgEkabtSVlyV/c0Uai/S6eh7qgwYIC76BS6ffq+ri2JWejf+CxnDo
   Tp7IpMFmU869d0JpIpLOG+SC/2hUlZ7+l2XOKyx2obZ4Lemw+dSt/GiI3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402165264"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="402165264"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 11:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="771575979"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="771575979"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Mar 2023 11:24:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfPc6-000EcG-1D;
	Thu, 23 Mar 2023 18:24:38 +0000
Date: Fri, 24 Mar 2023 02:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5496/6100] mm/mmap.c:962 vma_merge() error:
 uninitialized symbol 'next'.
Message-ID: <202303240246.9rvyIPWZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lorenzo Stoakes <lstoakes@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7c4a254d78f89546d0e74a40617ef24c6151c8d1
commit: e887ecae997ebaaad4d9b93e6a01fd5495ec1bc3 [5496/6100] mm/mmap/vma_merge: set next to NULL if not applicable
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230324/202303240246.9rvyIPWZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303240246.9rvyIPWZ-lkp@intel.com/

smatch warnings:
mm/mmap.c:962 vma_merge() error: uninitialized symbol 'next'.

vim +/next +962 mm/mmap.c

^1da177e4c3f41 Linus Torvalds     2005-04-16   851  
^1da177e4c3f41 Linus Torvalds     2005-04-16   852  /*
9a10064f5625d5 Colin Cross        2022-01-14   853   * Given a mapping request (addr,end,vm_flags,file,pgoff,anon_name),
9a10064f5625d5 Colin Cross        2022-01-14   854   * figure out whether that can be merged with its predecessor or its
9a10064f5625d5 Colin Cross        2022-01-14   855   * successor.  Or both (it neatly fills a hole).
^1da177e4c3f41 Linus Torvalds     2005-04-16   856   *
^1da177e4c3f41 Linus Torvalds     2005-04-16   857   * In most cases - when called for mmap, brk or mremap - [addr,end) is
^1da177e4c3f41 Linus Torvalds     2005-04-16   858   * certain not to be mapped by the time vma_merge is called; but when
^1da177e4c3f41 Linus Torvalds     2005-04-16   859   * called for mprotect, it is certain to be already mapped (either at
^1da177e4c3f41 Linus Torvalds     2005-04-16   860   * an offset within prev, or at the start of next), and the flags of
^1da177e4c3f41 Linus Torvalds     2005-04-16   861   * this area are about to be changed to vm_flags - and the no-change
^1da177e4c3f41 Linus Torvalds     2005-04-16   862   * case has already been eliminated.
^1da177e4c3f41 Linus Torvalds     2005-04-16   863   *
721076b86904d4 Lorenzo Stoakes    2023-03-21   864   * The following mprotect cases have to be considered, where **** is
^1da177e4c3f41 Linus Torvalds     2005-04-16   865   * the area passed down from mprotect_fixup, never extending beyond one
721076b86904d4 Lorenzo Stoakes    2023-03-21   866   * vma, PPPP is the previous vma, CCCC is a concurrent vma that starts
721076b86904d4 Lorenzo Stoakes    2023-03-21   867   * at the same address as **** and is of the same or larger span, and
721076b86904d4 Lorenzo Stoakes    2023-03-21   868   * NNNN the next vma after ****:
^1da177e4c3f41 Linus Torvalds     2005-04-16   869   *
721076b86904d4 Lorenzo Stoakes    2023-03-21   870   *     ****             ****                   ****
721076b86904d4 Lorenzo Stoakes    2023-03-21   871   *    PPPPPPNNNNNN    PPPPPPNNNNNN       PPPPPPCCCCCC
5d42ab293f5181 Wei Yang           2019-11-30   872   *    cannot merge    might become       might become
721076b86904d4 Lorenzo Stoakes    2023-03-21   873   *                    PPNNNNNNNNNN       PPPPPPPPPPCC
5d42ab293f5181 Wei Yang           2019-11-30   874   *    mmap, brk or    case 4 below       case 5 below
5d42ab293f5181 Wei Yang           2019-11-30   875   *    mremap move:
721076b86904d4 Lorenzo Stoakes    2023-03-21   876   *                        ****               ****
721076b86904d4 Lorenzo Stoakes    2023-03-21   877   *                    PPPP    NNNN       PPPPCCCCNNNN
5d42ab293f5181 Wei Yang           2019-11-30   878   *                    might become       might become
5d42ab293f5181 Wei Yang           2019-11-30   879   *                    PPPPPPPPPPPP 1 or  PPPPPPPPPPPP 6 or
721076b86904d4 Lorenzo Stoakes    2023-03-21   880   *                    PPPPPPPPNNNN 2 or  PPPPPPPPNNNN 7 or
721076b86904d4 Lorenzo Stoakes    2023-03-21   881   *                    PPPPNNNNNNNN 3     PPPPNNNNNNNN 8
^1da177e4c3f41 Linus Torvalds     2005-04-16   882   *
721076b86904d4 Lorenzo Stoakes    2023-03-21   883   * It is important for case 8 that the vma CCCC overlapping the
721076b86904d4 Lorenzo Stoakes    2023-03-21   884   * region **** is never going to extended over NNNN. Instead NNNN must
721076b86904d4 Lorenzo Stoakes    2023-03-21   885   * be extended in region **** and CCCC must be removed. This way in
0503ea8f5ba73e Liam R. Howlett    2023-01-20   886   * all cases where vma_merge succeeds, the moment vma_merge drops the
e86f15ee64d8ee Andrea Arcangeli   2016-10-07   887   * rmap_locks, the properties of the merged vma will be already
e86f15ee64d8ee Andrea Arcangeli   2016-10-07   888   * correct for the whole merged range. Some of those properties like
e86f15ee64d8ee Andrea Arcangeli   2016-10-07   889   * vm_page_prot/vm_flags may be accessed by rmap_walks and they must
e86f15ee64d8ee Andrea Arcangeli   2016-10-07   890   * be correct for the whole merged range immediately after the
721076b86904d4 Lorenzo Stoakes    2023-03-21   891   * rmap_locks are released. Otherwise if NNNN would be removed and
721076b86904d4 Lorenzo Stoakes    2023-03-21   892   * CCCC would be extended over the NNNN range, remove_migration_ptes
e86f15ee64d8ee Andrea Arcangeli   2016-10-07   893   * or other rmap walkers (if working on addresses beyond the "end"
721076b86904d4 Lorenzo Stoakes    2023-03-21   894   * parameter) may establish ptes with the wrong permissions of CCCC
721076b86904d4 Lorenzo Stoakes    2023-03-21   895   * instead of the right permissions of NNNN.
0503ea8f5ba73e Liam R. Howlett    2023-01-20   896   *
0503ea8f5ba73e Liam R. Howlett    2023-01-20   897   * In the code below:
0503ea8f5ba73e Liam R. Howlett    2023-01-20   898   * PPPP is represented by *prev
721076b86904d4 Lorenzo Stoakes    2023-03-21   899   * CCCC is represented by *curr or not represented at all (NULL)
721076b86904d4 Lorenzo Stoakes    2023-03-21   900   * NNNN is represented by *next or not represented at all (NULL)
721076b86904d4 Lorenzo Stoakes    2023-03-21   901   * **** is not represented - it will be merged and the vma containing the
759224a5ffcfa1 Vlastimil Babka    2023-03-09   902   *      area is returned, or the function will return NULL
^1da177e4c3f41 Linus Torvalds     2005-04-16   903   */
9760ebffbf5507 Liam R. Howlett    2023-01-20   904  struct vm_area_struct *vma_merge(struct vma_iterator *vmi, struct mm_struct *mm,
^1da177e4c3f41 Linus Torvalds     2005-04-16   905  			struct vm_area_struct *prev, unsigned long addr,
^1da177e4c3f41 Linus Torvalds     2005-04-16   906  			unsigned long end, unsigned long vm_flags,
^1da177e4c3f41 Linus Torvalds     2005-04-16   907  			struct anon_vma *anon_vma, struct file *file,
19a809afe2fe08 Andrea Arcangeli   2015-09-04   908  			pgoff_t pgoff, struct mempolicy *policy,
9a10064f5625d5 Colin Cross        2022-01-14   909  			struct vm_userfaultfd_ctx vm_userfaultfd_ctx,
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04   910  			struct anon_vma_name *anon_name)
^1da177e4c3f41 Linus Torvalds     2005-04-16   911  {
^1da177e4c3f41 Linus Torvalds     2005-04-16   912  	pgoff_t pglen = (end - addr) >> PAGE_SHIFT;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   913  	pgoff_t vma_pgoff;
721076b86904d4 Lorenzo Stoakes    2023-03-21   914  	struct vm_area_struct *curr, *next, *res = NULL;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   915  	struct vm_area_struct *vma, *adjust, *remove, *remove2;
eef199440df950 Jakub Matěna       2022-06-03   916  	int err = -1;
eef199440df950 Jakub Matěna       2022-06-03   917  	bool merge_prev = false;
eef199440df950 Jakub Matěna       2022-06-03   918  	bool merge_next = false;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   919  	bool vma_expanded = false;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   920  	struct vma_prepare vp;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   921  	unsigned long vma_end = end;
27d6788ee67b59 Vlastimil Babka    2023-03-09   922  	long adj_start = 0;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   923  	unsigned long vma_start = addr;
^1da177e4c3f41 Linus Torvalds     2005-04-16   924  
0503ea8f5ba73e Liam R. Howlett    2023-01-20   925  	validate_mm(mm);
^1da177e4c3f41 Linus Torvalds     2005-04-16   926  	/*
^1da177e4c3f41 Linus Torvalds     2005-04-16   927  	 * We later require that vma->vm_flags == vm_flags,
^1da177e4c3f41 Linus Torvalds     2005-04-16   928  	 * so this tests vma->vm_flags & VM_SPECIAL, too.
^1da177e4c3f41 Linus Torvalds     2005-04-16   929  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16   930  	if (vm_flags & VM_SPECIAL)
^1da177e4c3f41 Linus Torvalds     2005-04-16   931  		return NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16   932  
e887ecae997eba Lorenzo Stoakes    2023-03-21   933  	/* Does the input range span an existing VMA? (cases 5 - 8) */
e887ecae997eba Lorenzo Stoakes    2023-03-21   934  	curr = find_vma_intersection(mm, prev ? prev->vm_end : 0, end);
^1da177e4c3f41 Linus Torvalds     2005-04-16   935  
e887ecae997eba Lorenzo Stoakes    2023-03-21   936  	if (curr && end == curr->vm_end)
e887ecae997eba Lorenzo Stoakes    2023-03-21   937  		/* Is there is a VMA immediately adjacent (cases 6 - 8)? */
e887ecae997eba Lorenzo Stoakes    2023-03-21   938  		next = vma_lookup(mm, curr->vm_end);
e887ecae997eba Lorenzo Stoakes    2023-03-21   939  	else if (!curr)
e887ecae997eba Lorenzo Stoakes    2023-03-21   940  		/* Is there a VMA next to a hole (case 1 - 3) or prev (4)? */
e887ecae997eba Lorenzo Stoakes    2023-03-21   941  		next = vma_lookup(mm, end);
759224a5ffcfa1 Vlastimil Babka    2023-03-09   942  
e86f15ee64d8ee Andrea Arcangeli   2016-10-07   943  	/* verify some invariant that must be enforced by the caller */
e86f15ee64d8ee Andrea Arcangeli   2016-10-07   944  	VM_WARN_ON(prev && addr <= prev->vm_start);
721076b86904d4 Lorenzo Stoakes    2023-03-21   945  	VM_WARN_ON(curr && end > curr->vm_end);
e86f15ee64d8ee Andrea Arcangeli   2016-10-07   946  	VM_WARN_ON(addr >= end);
e86f15ee64d8ee Andrea Arcangeli   2016-10-07   947  
0503ea8f5ba73e Liam R. Howlett    2023-01-20   948  	if (prev) {
0503ea8f5ba73e Liam R. Howlett    2023-01-20   949  		res = prev;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   950  		vma = prev;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   951  		vma_start = prev->vm_start;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   952  		vma_pgoff = prev->vm_pgoff;
eef199440df950 Jakub Matěna       2022-06-03   953  		/* Can we merge the predecessor? */
0503ea8f5ba73e Liam R. Howlett    2023-01-20   954  		if (prev->vm_end == addr && mpol_equal(vma_policy(prev), policy)
0503ea8f5ba73e Liam R. Howlett    2023-01-20   955  		    && can_vma_merge_after(prev, vm_flags, anon_vma, file,
0503ea8f5ba73e Liam R. Howlett    2023-01-20   956  				   pgoff, vm_userfaultfd_ctx, anon_name)) {
eef199440df950 Jakub Matěna       2022-06-03   957  			merge_prev = true;
18b098af2890cd Liam R. Howlett    2023-01-20   958  			vma_prev(vmi);
eef199440df950 Jakub Matěna       2022-06-03   959  		}
0503ea8f5ba73e Liam R. Howlett    2023-01-20   960  	}
eef199440df950 Jakub Matěna       2022-06-03   961  	/* Can we merge the successor? */
e887ecae997eba Lorenzo Stoakes    2023-03-21  @962  	if (next && mpol_equal(policy, vma_policy(next)) &&
^1da177e4c3f41 Linus Torvalds     2005-04-16   963  	    can_vma_merge_before(next, vm_flags,
eef199440df950 Jakub Matěna       2022-06-03   964  				 anon_vma, file, pgoff+pglen,
eef199440df950 Jakub Matěna       2022-06-03   965  				 vm_userfaultfd_ctx, anon_name)) {
eef199440df950 Jakub Matěna       2022-06-03   966  		merge_next = true;
eef199440df950 Jakub Matěna       2022-06-03   967  	}
0503ea8f5ba73e Liam R. Howlett    2023-01-20   968  
0503ea8f5ba73e Liam R. Howlett    2023-01-20   969  	remove = remove2 = adjust = NULL;
eef199440df950 Jakub Matěna       2022-06-03   970  	/* Can we merge both the predecessor and the successor? */
eef199440df950 Jakub Matěna       2022-06-03   971  	if (merge_prev && merge_next &&
0503ea8f5ba73e Liam R. Howlett    2023-01-20   972  	    is_mergeable_anon_vma(prev->anon_vma, next->anon_vma, NULL)) {
f7eb6b694b6911 Vlastimil Babka    2023-03-09   973  		remove = next;				/* case 1 */
0503ea8f5ba73e Liam R. Howlett    2023-01-20   974  		vma_end = next->vm_end;
f7eb6b694b6911 Vlastimil Babka    2023-03-09   975  		err = dup_anon_vma(prev, next);
721076b86904d4 Lorenzo Stoakes    2023-03-21   976  		if (curr) {				/* case 6 */
721076b86904d4 Lorenzo Stoakes    2023-03-21   977  			remove = curr;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   978  			remove2 = next;
f7eb6b694b6911 Vlastimil Babka    2023-03-09   979  			if (!next->anon_vma)
721076b86904d4 Lorenzo Stoakes    2023-03-21   980  				err = dup_anon_vma(prev, curr);
0503ea8f5ba73e Liam R. Howlett    2023-01-20   981  		}
0503ea8f5ba73e Liam R. Howlett    2023-01-20   982  	} else if (merge_prev) {
0503ea8f5ba73e Liam R. Howlett    2023-01-20   983  		err = 0;				/* case 2 */
721076b86904d4 Lorenzo Stoakes    2023-03-21   984  		if (curr) {
721076b86904d4 Lorenzo Stoakes    2023-03-21   985  			err = dup_anon_vma(prev, curr);
721076b86904d4 Lorenzo Stoakes    2023-03-21   986  			if (end == curr->vm_end) {	/* case 7 */
721076b86904d4 Lorenzo Stoakes    2023-03-21   987  				remove = curr;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   988  			} else {			/* case 5 */
721076b86904d4 Lorenzo Stoakes    2023-03-21   989  				adjust = curr;
721076b86904d4 Lorenzo Stoakes    2023-03-21   990  				adj_start = (end - curr->vm_start);
0503ea8f5ba73e Liam R. Howlett    2023-01-20   991  			}
0503ea8f5ba73e Liam R. Howlett    2023-01-20   992  		}
eef199440df950 Jakub Matěna       2022-06-03   993  	} else if (merge_next) {
eef199440df950 Jakub Matěna       2022-06-03   994  		res = next;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   995  		if (prev && addr < prev->vm_end) {	/* case 4 */
0503ea8f5ba73e Liam R. Howlett    2023-01-20   996  			vma_end = addr;
7a3365eed80a54 Vlastimil Babka    2023-03-09   997  			adjust = next;
27d6788ee67b59 Vlastimil Babka    2023-03-09   998  			adj_start = -(prev->vm_end - addr);
7a3365eed80a54 Vlastimil Babka    2023-03-09   999  			err = dup_anon_vma(next, prev);
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1000  		} else {
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1001  			vma = next;			/* case 3 */
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1002  			vma_start = addr;
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1003  			vma_end = next->vm_end;
b59e0cacd460ee Vlastimil Babka    2023-03-09  1004  			vma_pgoff = next->vm_pgoff;
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1005  			err = 0;
721076b86904d4 Lorenzo Stoakes    2023-03-21  1006  			if (curr) {			/* case 8 */
721076b86904d4 Lorenzo Stoakes    2023-03-21  1007  				vma_pgoff = curr->vm_pgoff;
721076b86904d4 Lorenzo Stoakes    2023-03-21  1008  				remove = curr;
721076b86904d4 Lorenzo Stoakes    2023-03-21  1009  				err = dup_anon_vma(next, curr);
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1010  			}
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1011  		}
eef199440df950 Jakub Matěna       2022-06-03  1012  	}
eef199440df950 Jakub Matěna       2022-06-03  1013  
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1014  	/* Cannot merge or error in anon_vma clone */
5beb49305251e5 Rik van Riel       2010-03-05  1015  	if (err)
5beb49305251e5 Rik van Riel       2010-03-05  1016  		return NULL;
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1017  
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1018  	if (vma_iter_prealloc(vmi))
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1019  		return NULL;
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1020  
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1021  	init_multi_vma_prep(&vp, vma, adjust, remove, remove2);
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1022  	VM_WARN_ON(vp.anon_vma && adjust && adjust->anon_vma &&
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1023  		   vp.anon_vma != adjust->anon_vma);
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1024  
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1025  	vma_prepare(&vp);
27d6788ee67b59 Vlastimil Babka    2023-03-09  1026  	vma_adjust_trans_huge(vma, vma_start, vma_end, adj_start);
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1027  	if (vma_start < vma->vm_start || vma_end > vma->vm_end)
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1028  		vma_expanded = true;
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1029  
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1030  	vma->vm_start = vma_start;
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1031  	vma->vm_end = vma_end;
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1032  	vma->vm_pgoff = vma_pgoff;
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1033  
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1034  	if (vma_expanded)
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1035  		vma_iter_store(vmi, vma);
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1036  
27d6788ee67b59 Vlastimil Babka    2023-03-09  1037  	if (adj_start) {
27d6788ee67b59 Vlastimil Babka    2023-03-09  1038  		adjust->vm_start += adj_start;
27d6788ee67b59 Vlastimil Babka    2023-03-09  1039  		adjust->vm_pgoff += adj_start >> PAGE_SHIFT;
27d6788ee67b59 Vlastimil Babka    2023-03-09  1040  		if (adj_start < 0) {
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1041  			WARN_ON(vma_expanded);
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1042  			vma_iter_store(vmi, next);
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1043  		}
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1044  	}
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1045  
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1046  	vma_complete(&vp, vmi, mm);
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1047  	vma_iter_free(vmi);
0503ea8f5ba73e Liam R. Howlett    2023-01-20  1048  	validate_mm(mm);
eef199440df950 Jakub Matěna       2022-06-03  1049  	khugepaged_enter_vma(res, vm_flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1050  
9760ebffbf5507 Liam R. Howlett    2023-01-20  1051  	return res;
f2ebfe43ba6c84 Liam R. Howlett    2023-01-20  1052  }
f2ebfe43ba6c84 Liam R. Howlett    2023-01-20  1053  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
