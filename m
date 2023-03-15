Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFB133D5
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 10:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678877448; x=1710413448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jTR6by5dVHF2P8N3q0Kp0jGu8hsgmGjrhrt0crzQIXg=;
  b=H+IhzrVbpKWeLofEhNp8sr220kzK7Yizb/y7m+C3p5zMJHGmqlEG05r/
   PPPo3wwwr9gQAHQ+kJ2EJJ59Zn11cRYDJoCcDyB57rCAvyd6X4prjAK2+
   ijo598j91u2lAESAV97nCHq1ler4A3PdtAzC4FFL5N1N9K+OGDkWsHaHQ
   UKfcVyf7yhn9cZeYLHmrPe6nKQzIyqO76hvjppxppEcJJdrkok9rb6MAc
   X+Fs0yjTe/+VPocJkL0fLVm64c+W5UsiQPKlJWg0DfZ5nRASy1GJFa38D
   XwSg1rexOeuI1pSAGxi3W6sXSvIvSlFBYjVm2XurKqotKgu5x3NdizpnL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="340034096"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="340034096"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 03:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="711884232"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="711884232"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Mar 2023 03:50:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcOiR-0007cX-0u;
	Wed, 15 Mar 2023 10:50:43 +0000
Date: Wed, 15 Mar 2023 18:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/3] userfaultfd: convert __mcopy_atomic() to use a
 folio
Message-ID: <202303151800.E99FNcRY-lkp@intel.com>
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
In-Reply-To: <20230314131350.924377-4-zhangpeng362@huawei.com>
References: <20230314131350.924377-4-zhangpeng362@huawei.com>
TO: Peng Zhang <zhangpeng362@huawei.com>
TO: linux-mm@kvack.org
TO: linux-kernel@vger.kernel.org
TO: willy@infradead.org
CC: akpm@linux-foundation.org
CC: mike.kravetz@oracle.com
CC: vishal.moola@gmail.com
CC: sidhartha.kumar@oracle.com
CC: wangkefeng.wang@huawei.com
CC: sunnanyong@huawei.com
CC: ZhangPeng <zhangpeng362@huawei.com>

Hi Peng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc2 next-20230315]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Zhang/userfaultfd-convert-mcopy_atomic_pte-to-use-a-folio/20230314-211824
patch link:    https://lore.kernel.org/r/20230314131350.924377-4-zhangpeng362%40huawei.com
patch subject: [PATCH v2 3/3] userfaultfd: convert __mcopy_atomic() to use a folio
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: microblaze-randconfig-m041-20230312 (https://download.01.org/0day-ci/archive/20230315/202303151800.E99FNcRY-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303151800.E99FNcRY-lkp@intel.com/

New smatch warnings:
mm/shmem.c:2492 shmem_mfill_atomic_pte() error: uninitialized symbol 'folio'.
mm/userfaultfd.c:181 mcopy_atomic_pte() error: uninitialized symbol 'folio'.

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.
include/linux/userfaultfd_k.h:149 vma_can_userfault() warn: bitwise AND condition is false here

vim +/folio +2492 mm/shmem.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  2416  
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2417  #ifdef CONFIG_USERFAULTFD
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2418  int shmem_mfill_atomic_pte(struct mm_struct *dst_mm,
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2419  			   pmd_t *dst_pmd,
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2420  			   struct vm_area_struct *dst_vma,
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2421  			   unsigned long dst_addr,
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2422  			   unsigned long src_addr,
8ee79edff6d3b4 Peter Xu                2022-05-12  2423  			   bool zeropage, bool wp_copy,
732542eb883709 ZhangPeng               2023-03-14  2424  			   struct folio **foliop)
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2425  {
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2426  	struct inode *inode = file_inode(dst_vma->vm_file);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2427  	struct shmem_inode_info *info = SHMEM_I(inode);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2428  	struct address_space *mapping = inode->i_mapping;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2429  	gfp_t gfp = mapping_gfp_mask(mapping);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2430  	pgoff_t pgoff = linear_page_index(dst_vma, dst_addr);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2431  	void *page_kaddr;
b7dd44a12cf266 Matthew Wilcox (Oracle  2022-05-12  2432) 	struct folio *folio;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2433  	int ret;
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2434  	pgoff_t max_off;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2435  
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2436  	if (!shmem_inode_acct_block(inode, 1)) {
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2437  		/*
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2438  		 * We may have got a page, returned -ENOENT triggering a retry,
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2439  		 * and now we find ourselves with -ENOMEM. Release the page, to
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2440  		 * avoid a BUG_ON in our caller.
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2441  		 */
732542eb883709 ZhangPeng               2023-03-14  2442  		if (unlikely(*foliop)) {
732542eb883709 ZhangPeng               2023-03-14  2443  			folio_put(*foliop);
732542eb883709 ZhangPeng               2023-03-14  2444  			*foliop = NULL;
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2445  		}
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2446  		return -ENOMEM;
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2447  	}
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2448  
732542eb883709 ZhangPeng               2023-03-14  2449  	if (!*foliop) {
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2450  		ret = -ENOMEM;
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2451) 		folio = shmem_alloc_folio(gfp, info, pgoff);
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2452) 		if (!folio)
0f0796945614b7 Mike Rapoport           2017-09-06  2453  			goto out_unacct_blocks;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2454  
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2455  		if (!zeropage) {	/* COPY */
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2456) 			page_kaddr = kmap_local_folio(folio, 0);
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2457  			/*
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2458  			 * The read mmap_lock is held here.  Despite the
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2459  			 * mmap_lock being read recursive a deadlock is still
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2460  			 * possible if a writer has taken a lock.  For example:
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2461  			 *
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2462  			 * process A thread 1 takes read lock on own mmap_lock
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2463  			 * process A thread 2 calls mmap, blocks taking write lock
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2464  			 * process B thread 1 takes page fault, read lock on own mmap lock
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2465  			 * process B thread 2 calls mmap, blocks taking write lock
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2466  			 * process A thread 1 blocks taking read lock on process B
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2467  			 * process B thread 1 blocks taking read lock on process A
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2468  			 *
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2469  			 * Disable page faults to prevent potential deadlock
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2470  			 * and retry the copy outside the mmap_lock.
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2471  			 */
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2472  			pagefault_disable();
8d10396342063c Mike Rapoport           2017-09-06  2473  			ret = copy_from_user(page_kaddr,
8d10396342063c Mike Rapoport           2017-09-06  2474  					     (const void __user *)src_addr,
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2475  					     PAGE_SIZE);
5dc21f0c0b1c02 Ira Weiny               2022-10-25  2476  			pagefault_enable();
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2477) 			kunmap_local(page_kaddr);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2478  
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  2479  			/* fallback to copy_from_user outside mmap_lock */
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2480  			if (unlikely(ret)) {
732542eb883709 ZhangPeng               2023-03-14  2481  				*foliop = folio;
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2482  				ret = -ENOENT;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2483  				/* don't free the page */
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2484  				goto out_unacct_blocks;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2485  			}
19b482c29b6f38 Muchun Song             2022-03-22  2486  
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2487) 			flush_dcache_folio(folio);
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2488  		} else {		/* ZEROPAGE */
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2489) 			clear_user_highpage(&folio->page, dst_addr);
8d10396342063c Mike Rapoport           2017-09-06  2490  		}
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2491  	} else {
732542eb883709 ZhangPeng               2023-03-14 @2492  		VM_BUG_ON_FOLIO(folio_test_large(*foliop), folio);
732542eb883709 ZhangPeng               2023-03-14  2493  		*foliop = NULL;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2494  	}
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2495  
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2496) 	VM_BUG_ON(folio_test_locked(folio));
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2497) 	VM_BUG_ON(folio_test_swapbacked(folio));
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2498) 	__folio_set_locked(folio);
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2499) 	__folio_set_swapbacked(folio);
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2500) 	__folio_mark_uptodate(folio);
9cc90c664a65f9 Andrea Arcangeli        2017-02-22  2501  
e2a50c1f64145a Andrea Arcangeli        2018-11-30  2502  	ret = -EFAULT;
e2a50c1f64145a Andrea Arcangeli        2018-11-30  2503  	max_off = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2504  	if (unlikely(pgoff >= max_off))
e2a50c1f64145a Andrea Arcangeli        2018-11-30  2505  		goto out_release;
e2a50c1f64145a Andrea Arcangeli        2018-11-30  2506  
b7dd44a12cf266 Matthew Wilcox (Oracle  2022-05-12  2507) 	ret = shmem_add_to_page_cache(folio, mapping, pgoff, NULL,
3fea5a499d57de Johannes Weiner         2020-06-03  2508  				      gfp & GFP_RECLAIM_MASK, dst_mm);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2509  	if (ret)
3fea5a499d57de Johannes Weiner         2020-06-03  2510  		goto out_release;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2511  
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2512  	ret = mfill_atomic_install_pte(dst_mm, dst_pmd, dst_vma, dst_addr,
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2513) 				       &folio->page, true, wp_copy);
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2514  	if (ret)
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2515  		goto out_delete_from_cache;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2516  
94b7cc01da5a3c Yang Shi                2020-04-20  2517  	spin_lock_irq(&info->lock);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2518  	info->alloced++;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2519  	inode->i_blocks += BLOCKS_PER_PAGE;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2520  	shmem_recalc_inode(inode);
94b7cc01da5a3c Yang Shi                2020-04-20  2521  	spin_unlock_irq(&info->lock);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2522  
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2523) 	folio_unlock(folio);
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2524  	return 0;
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2525  out_delete_from_cache:
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2526) 	filemap_remove_folio(folio);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2527  out_release:
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2528) 	folio_unlock(folio);
7a7256d5f512b6 Matthew Wilcox (Oracle  2022-09-02  2529) 	folio_put(folio);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2530  out_unacct_blocks:
0f0796945614b7 Mike Rapoport           2017-09-06  2531  	shmem_inode_unacct_blocks(inode, 1);
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2532  	return ret;
8d10396342063c Mike Rapoport           2017-09-06  2533  }
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2534  #endif /* CONFIG_USERFAULTFD */
8d10396342063c Mike Rapoport           2017-09-06  2535  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
