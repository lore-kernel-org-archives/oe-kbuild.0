Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AF823CD
	for <oe-kbuild@lists.linux.dev>; Sun,  7 May 2023 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683468883; x=1715004883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ql59oOp+9pqTspXwskjgfjd2ehcBNgT4Y1c++hGYUes=;
  b=XtwqS61B5Fvt0BCag0v80TbBXyiddisYK/TzAfQqy278Mqde4BMF3rcy
   TadX9GNB/26UnMWvZewiZBHyrHgWYOFCdWc/bA0RPJabS+04Vg2lCpEum
   zTRVFoW4GWkXz1qXlowuhMEn8OM6OO1SWkrucxGU97D4hIiDt76bWe02b
   0MJYhBervk/ASTisklB2cgDl68P0i+pHCC96FOr236kpW4R/7yy08tCgZ
   lVE93I1cLSwj0XkBQrv0cuHqzRkRiVlQ/5aUNVTPVyUwSZhnl63T2XLWw
   BfXqpxojFG99f3JWrvYSx6ab62K3GDsZ3qJuBrcn3kQzUzauiRx80/Znu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="415041799"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="415041799"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 07:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="822382249"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="822382249"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 May 2023 07:14:34 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvf9l-0000lh-2O;
	Sun, 07 May 2023 14:14:33 +0000
Date: Sun, 7 May 2023 22:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC v2 3/4] mm/ptshare: Create new mm struct for page
 table sharing
Message-ID: <202305072226.KGlQeenj-lkp@intel.com>
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
In-Reply-To: <1fd52581f4e4960a4d07cb9784d56659ec139d3c.1682453344.git.khalid.aziz@oracle.com>
References: <1fd52581f4e4960a4d07cb9784d56659ec139d3c.1682453344.git.khalid.aziz@oracle.com>
TO: Khalid Aziz <khalid.aziz@oracle.com>

Hi Khalid,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on vfs-idmapping/for-next linus/master v6.3 next-20230505]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khalid-Aziz/mm-ptshare-Add-vm-flag-for-shared-PTE/20230427-005143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/1fd52581f4e4960a4d07cb9784d56659ec139d3c.1682453344.git.khalid.aziz%40oracle.com
patch subject: [PATCH RFC v2 3/4] mm/ptshare: Create new mm struct for page table sharing
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230507/202305072226.KGlQeenj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305072226.KGlQeenj-lkp@intel.com/

smatch warnings:
mm/mmap.c:2699 mmap_region() warn: bitwise AND condition is false here

vim +2699 mm/mmap.c

dd2283f2605e3b Yang Shi           2018-10-26  2554  
e99668a56430a2 Liam R. Howlett    2022-09-06  2555  unsigned long mmap_region(struct file *file, unsigned long addr,
e99668a56430a2 Liam R. Howlett    2022-09-06  2556  		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
e99668a56430a2 Liam R. Howlett    2022-09-06  2557  		struct list_head *uf)
e99668a56430a2 Liam R. Howlett    2022-09-06  2558  {
e99668a56430a2 Liam R. Howlett    2022-09-06  2559  	struct mm_struct *mm = current->mm;
e99668a56430a2 Liam R. Howlett    2022-09-06  2560  	struct vm_area_struct *vma = NULL;
e99668a56430a2 Liam R. Howlett    2022-09-06  2561  	struct vm_area_struct *next, *prev, *merge;
e99668a56430a2 Liam R. Howlett    2022-09-06  2562  	pgoff_t pglen = len >> PAGE_SHIFT;
e99668a56430a2 Liam R. Howlett    2022-09-06  2563  	unsigned long charged = 0;
e99668a56430a2 Liam R. Howlett    2022-09-06  2564  	unsigned long end = addr + len;
e99668a56430a2 Liam R. Howlett    2022-09-06  2565  	unsigned long merge_start = addr, merge_end = end;
e99668a56430a2 Liam R. Howlett    2022-09-06  2566  	pgoff_t vm_pgoff;
e99668a56430a2 Liam R. Howlett    2022-09-06  2567  	int error;
183654ce26a5d5 Liam R. Howlett    2023-01-20  2568  	VMA_ITERATOR(vmi, mm, addr);
e99668a56430a2 Liam R. Howlett    2022-09-06  2569  
e99668a56430a2 Liam R. Howlett    2022-09-06  2570  	/* Check against address space limit. */
e99668a56430a2 Liam R. Howlett    2022-09-06  2571  	if (!may_expand_vm(mm, vm_flags, len >> PAGE_SHIFT)) {
e99668a56430a2 Liam R. Howlett    2022-09-06  2572  		unsigned long nr_pages;
e99668a56430a2 Liam R. Howlett    2022-09-06  2573  
e99668a56430a2 Liam R. Howlett    2022-09-06  2574  		/*
e99668a56430a2 Liam R. Howlett    2022-09-06  2575  		 * MAP_FIXED may remove pages of mappings that intersects with
e99668a56430a2 Liam R. Howlett    2022-09-06  2576  		 * requested mapping. Account for the pages it would unmap.
e99668a56430a2 Liam R. Howlett    2022-09-06  2577  		 */
e99668a56430a2 Liam R. Howlett    2022-09-06  2578  		nr_pages = count_vma_pages_range(mm, addr, end);
e99668a56430a2 Liam R. Howlett    2022-09-06  2579  
e99668a56430a2 Liam R. Howlett    2022-09-06  2580  		if (!may_expand_vm(mm, vm_flags,
e99668a56430a2 Liam R. Howlett    2022-09-06  2581  					(len >> PAGE_SHIFT) - nr_pages))
e99668a56430a2 Liam R. Howlett    2022-09-06  2582  			return -ENOMEM;
e99668a56430a2 Liam R. Howlett    2022-09-06  2583  	}
e99668a56430a2 Liam R. Howlett    2022-09-06  2584  
e99668a56430a2 Liam R. Howlett    2022-09-06  2585  	/* Unmap any existing mapping in the area */
183654ce26a5d5 Liam R. Howlett    2023-01-20  2586  	if (do_vmi_munmap(&vmi, mm, addr, len, uf, false))
e99668a56430a2 Liam R. Howlett    2022-09-06  2587  		return -ENOMEM;
e99668a56430a2 Liam R. Howlett    2022-09-06  2588  
e99668a56430a2 Liam R. Howlett    2022-09-06  2589  	/*
e99668a56430a2 Liam R. Howlett    2022-09-06  2590  	 * Private writable mapping: check memory availability
e99668a56430a2 Liam R. Howlett    2022-09-06  2591  	 */
e99668a56430a2 Liam R. Howlett    2022-09-06  2592  	if (accountable_mapping(file, vm_flags)) {
e99668a56430a2 Liam R. Howlett    2022-09-06  2593  		charged = len >> PAGE_SHIFT;
e99668a56430a2 Liam R. Howlett    2022-09-06  2594  		if (security_vm_enough_memory_mm(mm, charged))
e99668a56430a2 Liam R. Howlett    2022-09-06  2595  			return -ENOMEM;
e99668a56430a2 Liam R. Howlett    2022-09-06  2596  		vm_flags |= VM_ACCOUNT;
e99668a56430a2 Liam R. Howlett    2022-09-06  2597  	}
e99668a56430a2 Liam R. Howlett    2022-09-06  2598  
183654ce26a5d5 Liam R. Howlett    2023-01-20  2599  	next = vma_next(&vmi);
183654ce26a5d5 Liam R. Howlett    2023-01-20  2600  	prev = vma_prev(&vmi);
e99668a56430a2 Liam R. Howlett    2022-09-06  2601  	if (vm_flags & VM_SPECIAL)
e99668a56430a2 Liam R. Howlett    2022-09-06  2602  		goto cannot_expand;
e99668a56430a2 Liam R. Howlett    2022-09-06  2603  
e99668a56430a2 Liam R. Howlett    2022-09-06  2604  	/* Attempt to expand an old mapping */
e99668a56430a2 Liam R. Howlett    2022-09-06  2605  	/* Check next */
e99668a56430a2 Liam R. Howlett    2022-09-06  2606  	if (next && next->vm_start == end && !vma_policy(next) &&
e99668a56430a2 Liam R. Howlett    2022-09-06  2607  	    can_vma_merge_before(next, vm_flags, NULL, file, pgoff+pglen,
e99668a56430a2 Liam R. Howlett    2022-09-06  2608  				 NULL_VM_UFFD_CTX, NULL)) {
e99668a56430a2 Liam R. Howlett    2022-09-06  2609  		merge_end = next->vm_end;
e99668a56430a2 Liam R. Howlett    2022-09-06  2610  		vma = next;
e99668a56430a2 Liam R. Howlett    2022-09-06  2611  		vm_pgoff = next->vm_pgoff - pglen;
e99668a56430a2 Liam R. Howlett    2022-09-06  2612  	}
e99668a56430a2 Liam R. Howlett    2022-09-06  2613  
e99668a56430a2 Liam R. Howlett    2022-09-06  2614  	/* Check prev */
e99668a56430a2 Liam R. Howlett    2022-09-06  2615  	if (prev && prev->vm_end == addr && !vma_policy(prev) &&
e99668a56430a2 Liam R. Howlett    2022-09-06  2616  	    (vma ? can_vma_merge_after(prev, vm_flags, vma->anon_vma, file,
e99668a56430a2 Liam R. Howlett    2022-09-06  2617  				       pgoff, vma->vm_userfaultfd_ctx, NULL) :
e99668a56430a2 Liam R. Howlett    2022-09-06  2618  		   can_vma_merge_after(prev, vm_flags, NULL, file, pgoff,
e99668a56430a2 Liam R. Howlett    2022-09-06  2619  				       NULL_VM_UFFD_CTX, NULL))) {
e99668a56430a2 Liam R. Howlett    2022-09-06  2620  		merge_start = prev->vm_start;
e99668a56430a2 Liam R. Howlett    2022-09-06  2621  		vma = prev;
e99668a56430a2 Liam R. Howlett    2022-09-06  2622  		vm_pgoff = prev->vm_pgoff;
e99668a56430a2 Liam R. Howlett    2022-09-06  2623  	}
e99668a56430a2 Liam R. Howlett    2022-09-06  2624  
e99668a56430a2 Liam R. Howlett    2022-09-06  2625  
e99668a56430a2 Liam R. Howlett    2022-09-06  2626  	/* Actually expand, if possible */
e99668a56430a2 Liam R. Howlett    2022-09-06  2627  	if (vma &&
3c441ab7d059eb Liam R. Howlett    2023-01-20  2628  	    !vma_expand(&vmi, vma, merge_start, merge_end, vm_pgoff, next)) {
e99668a56430a2 Liam R. Howlett    2022-09-06  2629  		khugepaged_enter_vma(vma, vm_flags);
e99668a56430a2 Liam R. Howlett    2022-09-06  2630  		goto expanded;
e99668a56430a2 Liam R. Howlett    2022-09-06  2631  	}
e99668a56430a2 Liam R. Howlett    2022-09-06  2632  
e99668a56430a2 Liam R. Howlett    2022-09-06  2633  cannot_expand:
e99668a56430a2 Liam R. Howlett    2022-09-06  2634  	/*
e99668a56430a2 Liam R. Howlett    2022-09-06  2635  	 * Determine the object being mapped and call the appropriate
e99668a56430a2 Liam R. Howlett    2022-09-06  2636  	 * specific mapper. the address has already been validated, but
e99668a56430a2 Liam R. Howlett    2022-09-06  2637  	 * not unmapped, but the maps are removed from the list.
e99668a56430a2 Liam R. Howlett    2022-09-06  2638  	 */
e99668a56430a2 Liam R. Howlett    2022-09-06  2639  	vma = vm_area_alloc(mm);
e99668a56430a2 Liam R. Howlett    2022-09-06  2640  	if (!vma) {
e99668a56430a2 Liam R. Howlett    2022-09-06  2641  		error = -ENOMEM;
e99668a56430a2 Liam R. Howlett    2022-09-06  2642  		goto unacct_error;
e99668a56430a2 Liam R. Howlett    2022-09-06  2643  	}
e99668a56430a2 Liam R. Howlett    2022-09-06  2644  
0fd5a9e2b09ff5 Liam R. Howlett    2023-01-20  2645  	vma_iter_set(&vmi, addr);
e99668a56430a2 Liam R. Howlett    2022-09-06  2646  	vma->vm_start = addr;
e99668a56430a2 Liam R. Howlett    2022-09-06  2647  	vma->vm_end = end;
1c71222e5f2393 Suren Baghdasaryan 2023-01-26  2648  	vm_flags_init(vma, vm_flags);
e99668a56430a2 Liam R. Howlett    2022-09-06  2649  	vma->vm_page_prot = vm_get_page_prot(vm_flags);
e99668a56430a2 Liam R. Howlett    2022-09-06  2650  	vma->vm_pgoff = pgoff;
e99668a56430a2 Liam R. Howlett    2022-09-06  2651  
e99668a56430a2 Liam R. Howlett    2022-09-06  2652  	if (file) {
e99668a56430a2 Liam R. Howlett    2022-09-06  2653  		if (vm_flags & VM_SHARED) {
e99668a56430a2 Liam R. Howlett    2022-09-06  2654  			error = mapping_map_writable(file->f_mapping);
e99668a56430a2 Liam R. Howlett    2022-09-06  2655  			if (error)
e99668a56430a2 Liam R. Howlett    2022-09-06  2656  				goto free_vma;
e99668a56430a2 Liam R. Howlett    2022-09-06  2657  		}
e99668a56430a2 Liam R. Howlett    2022-09-06  2658  
e99668a56430a2 Liam R. Howlett    2022-09-06  2659  		vma->vm_file = get_file(file);
e99668a56430a2 Liam R. Howlett    2022-09-06  2660  		error = call_mmap(file, vma);
e99668a56430a2 Liam R. Howlett    2022-09-06  2661  		if (error)
e99668a56430a2 Liam R. Howlett    2022-09-06  2662  			goto unmap_and_free_vma;
e99668a56430a2 Liam R. Howlett    2022-09-06  2663  
a57b70519d1f7c Liam Howlett       2022-10-18  2664  		/*
a57b70519d1f7c Liam Howlett       2022-10-18  2665  		 * Expansion is handled above, merging is handled below.
a57b70519d1f7c Liam Howlett       2022-10-18  2666  		 * Drivers should not alter the address of the VMA.
e99668a56430a2 Liam R. Howlett    2022-09-06  2667  		 */
a57b70519d1f7c Liam Howlett       2022-10-18  2668  		error = -EINVAL;
cc8d1b097de78b Liam R. Howlett    2023-01-20  2669  		if (WARN_ON((addr != vma->vm_start)))
a57b70519d1f7c Liam Howlett       2022-10-18  2670  			goto close_and_free_vma;
e99668a56430a2 Liam R. Howlett    2022-09-06  2671  
cc8d1b097de78b Liam R. Howlett    2023-01-20  2672  		vma_iter_set(&vmi, addr);
e99668a56430a2 Liam R. Howlett    2022-09-06  2673  		/*
e99668a56430a2 Liam R. Howlett    2022-09-06  2674  		 * If vm_flags changed after call_mmap(), we should try merge
e99668a56430a2 Liam R. Howlett    2022-09-06  2675  		 * vma again as we may succeed this time.
e99668a56430a2 Liam R. Howlett    2022-09-06  2676  		 */
e99668a56430a2 Liam R. Howlett    2022-09-06  2677  		if (unlikely(vm_flags != vma->vm_flags && prev)) {
9760ebffbf5507 Liam R. Howlett    2023-01-20  2678  			merge = vma_merge(&vmi, mm, prev, vma->vm_start,
9760ebffbf5507 Liam R. Howlett    2023-01-20  2679  				    vma->vm_end, vma->vm_flags, NULL,
9760ebffbf5507 Liam R. Howlett    2023-01-20  2680  				    vma->vm_file, vma->vm_pgoff, NULL,
9760ebffbf5507 Liam R. Howlett    2023-01-20  2681  				    NULL_VM_UFFD_CTX, NULL);
e99668a56430a2 Liam R. Howlett    2022-09-06  2682  			if (merge) {
e99668a56430a2 Liam R. Howlett    2022-09-06  2683  				/*
e99668a56430a2 Liam R. Howlett    2022-09-06  2684  				 * ->mmap() can change vma->vm_file and fput
e99668a56430a2 Liam R. Howlett    2022-09-06  2685  				 * the original file. So fput the vma->vm_file
e99668a56430a2 Liam R. Howlett    2022-09-06  2686  				 * here or we would add an extra fput for file
e99668a56430a2 Liam R. Howlett    2022-09-06  2687  				 * and cause general protection fault
e99668a56430a2 Liam R. Howlett    2022-09-06  2688  				 * ultimately.
e99668a56430a2 Liam R. Howlett    2022-09-06  2689  				 */
e99668a56430a2 Liam R. Howlett    2022-09-06  2690  				fput(vma->vm_file);
e99668a56430a2 Liam R. Howlett    2022-09-06  2691  				vm_area_free(vma);
e99668a56430a2 Liam R. Howlett    2022-09-06  2692  				vma = merge;
e99668a56430a2 Liam R. Howlett    2022-09-06  2693  				/* Update vm_flags to pick up the change. */
e99668a56430a2 Liam R. Howlett    2022-09-06  2694  				vm_flags = vma->vm_flags;
e99668a56430a2 Liam R. Howlett    2022-09-06  2695  				goto unmap_writable;
e99668a56430a2 Liam R. Howlett    2022-09-06  2696  			}
e99668a56430a2 Liam R. Howlett    2022-09-06  2697  		}
e99668a56430a2 Liam R. Howlett    2022-09-06  2698  
263f767f45a14d Khalid Aziz        2023-04-26 @2699  		if (vm_flags & VM_SHARED_PT)
263f767f45a14d Khalid Aziz        2023-04-26  2700  			vm_flags_set(vma, VM_SHARED_PT);
e99668a56430a2 Liam R. Howlett    2022-09-06  2701  		vm_flags = vma->vm_flags;
e99668a56430a2 Liam R. Howlett    2022-09-06  2702  	} else if (vm_flags & VM_SHARED) {
e99668a56430a2 Liam R. Howlett    2022-09-06  2703  		error = shmem_zero_setup(vma);
e99668a56430a2 Liam R. Howlett    2022-09-06  2704  		if (error)
e99668a56430a2 Liam R. Howlett    2022-09-06  2705  			goto free_vma;
e99668a56430a2 Liam R. Howlett    2022-09-06  2706  	} else {
e99668a56430a2 Liam R. Howlett    2022-09-06  2707  		vma_set_anonymous(vma);
e99668a56430a2 Liam R. Howlett    2022-09-06  2708  	}
e99668a56430a2 Liam R. Howlett    2022-09-06  2709  
b507808ebce235 Joey Gouly         2023-01-19  2710  	if (map_deny_write_exec(vma, vma->vm_flags)) {
b507808ebce235 Joey Gouly         2023-01-19  2711  		error = -EACCES;
b507808ebce235 Joey Gouly         2023-01-19  2712  		if (file)
b507808ebce235 Joey Gouly         2023-01-19  2713  			goto close_and_free_vma;
b507808ebce235 Joey Gouly         2023-01-19  2714  		else if (vma->vm_file)
b507808ebce235 Joey Gouly         2023-01-19  2715  			goto unmap_and_free_vma;
b507808ebce235 Joey Gouly         2023-01-19  2716  		else
b507808ebce235 Joey Gouly         2023-01-19  2717  			goto free_vma;
b507808ebce235 Joey Gouly         2023-01-19  2718  	}
b507808ebce235 Joey Gouly         2023-01-19  2719  
e99668a56430a2 Liam R. Howlett    2022-09-06  2720  	/* Allow architectures to sanity-check the vm_flags */
e99668a56430a2 Liam R. Howlett    2022-09-06  2721  	error = -EINVAL;
cc8d1b097de78b Liam R. Howlett    2023-01-20  2722  	if (!arch_validate_flags(vma->vm_flags))
deb0f6562884b5 Carlos Llamas      2022-09-30  2723  		goto close_and_free_vma;
e99668a56430a2 Liam R. Howlett    2022-09-06  2724  
e99668a56430a2 Liam R. Howlett    2022-09-06  2725  	error = -ENOMEM;
cc8d1b097de78b Liam R. Howlett    2023-01-20  2726  	if (vma_iter_prealloc(&vmi))
5789151e48acc3 Mike Kravetz       2022-10-17  2727  		goto close_and_free_vma;
e99668a56430a2 Liam R. Howlett    2022-09-06  2728  
e99668a56430a2 Liam R. Howlett    2022-09-06  2729  	if (vma->vm_file)
e99668a56430a2 Liam R. Howlett    2022-09-06  2730  		i_mmap_lock_write(vma->vm_file->f_mapping);
e99668a56430a2 Liam R. Howlett    2022-09-06  2731  
183654ce26a5d5 Liam R. Howlett    2023-01-20  2732  	vma_iter_store(&vmi, vma);
e99668a56430a2 Liam R. Howlett    2022-09-06  2733  	mm->map_count++;
e99668a56430a2 Liam R. Howlett    2022-09-06  2734  	if (vma->vm_file) {
e99668a56430a2 Liam R. Howlett    2022-09-06  2735  		if (vma->vm_flags & VM_SHARED)
e99668a56430a2 Liam R. Howlett    2022-09-06  2736  			mapping_allow_writable(vma->vm_file->f_mapping);
e99668a56430a2 Liam R. Howlett    2022-09-06  2737  
e99668a56430a2 Liam R. Howlett    2022-09-06  2738  		flush_dcache_mmap_lock(vma->vm_file->f_mapping);
e99668a56430a2 Liam R. Howlett    2022-09-06  2739  		vma_interval_tree_insert(vma, &vma->vm_file->f_mapping->i_mmap);
e99668a56430a2 Liam R. Howlett    2022-09-06  2740  		flush_dcache_mmap_unlock(vma->vm_file->f_mapping);
e99668a56430a2 Liam R. Howlett    2022-09-06  2741  		i_mmap_unlock_write(vma->vm_file->f_mapping);
e99668a56430a2 Liam R. Howlett    2022-09-06  2742  	}
e99668a56430a2 Liam R. Howlett    2022-09-06  2743  
e99668a56430a2 Liam R. Howlett    2022-09-06  2744  	/*
e99668a56430a2 Liam R. Howlett    2022-09-06  2745  	 * vma_merge() calls khugepaged_enter_vma() either, the below
e99668a56430a2 Liam R. Howlett    2022-09-06  2746  	 * call covers the non-merge case.
e99668a56430a2 Liam R. Howlett    2022-09-06  2747  	 */
e99668a56430a2 Liam R. Howlett    2022-09-06  2748  	khugepaged_enter_vma(vma, vma->vm_flags);
e99668a56430a2 Liam R. Howlett    2022-09-06  2749  
e99668a56430a2 Liam R. Howlett    2022-09-06  2750  	/* Once vma denies write, undo our temporary denial count */
e99668a56430a2 Liam R. Howlett    2022-09-06  2751  unmap_writable:
e99668a56430a2 Liam R. Howlett    2022-09-06  2752  	if (file && vm_flags & VM_SHARED)
e99668a56430a2 Liam R. Howlett    2022-09-06  2753  		mapping_unmap_writable(file->f_mapping);
e99668a56430a2 Liam R. Howlett    2022-09-06  2754  	file = vma->vm_file;
e99668a56430a2 Liam R. Howlett    2022-09-06  2755  expanded:
e99668a56430a2 Liam R. Howlett    2022-09-06  2756  	perf_event_mmap(vma);
e99668a56430a2 Liam R. Howlett    2022-09-06  2757  
e99668a56430a2 Liam R. Howlett    2022-09-06  2758  	vm_stat_account(mm, vm_flags, len >> PAGE_SHIFT);
e99668a56430a2 Liam R. Howlett    2022-09-06  2759  	if (vm_flags & VM_LOCKED) {
e99668a56430a2 Liam R. Howlett    2022-09-06  2760  		if ((vm_flags & VM_SPECIAL) || vma_is_dax(vma) ||
e99668a56430a2 Liam R. Howlett    2022-09-06  2761  					is_vm_hugetlb_page(vma) ||
e99668a56430a2 Liam R. Howlett    2022-09-06  2762  					vma == get_gate_vma(current->mm))
e430a95a04efc5 Suren Baghdasaryan 2023-01-26  2763  			vm_flags_clear(vma, VM_LOCKED_MASK);
e99668a56430a2 Liam R. Howlett    2022-09-06  2764  		else
e99668a56430a2 Liam R. Howlett    2022-09-06  2765  			mm->locked_vm += (len >> PAGE_SHIFT);
e99668a56430a2 Liam R. Howlett    2022-09-06  2766  	}
e99668a56430a2 Liam R. Howlett    2022-09-06  2767  
e99668a56430a2 Liam R. Howlett    2022-09-06  2768  	if (file)
e99668a56430a2 Liam R. Howlett    2022-09-06  2769  		uprobe_mmap(vma);
e99668a56430a2 Liam R. Howlett    2022-09-06  2770  
e99668a56430a2 Liam R. Howlett    2022-09-06  2771  	/*
e99668a56430a2 Liam R. Howlett    2022-09-06  2772  	 * New (or expanded) vma always get soft dirty status.
e99668a56430a2 Liam R. Howlett    2022-09-06  2773  	 * Otherwise user-space soft-dirty page tracker won't
e99668a56430a2 Liam R. Howlett    2022-09-06  2774  	 * be able to distinguish situation when vma area unmapped,
e99668a56430a2 Liam R. Howlett    2022-09-06  2775  	 * then new mapped in-place (which must be aimed as
e99668a56430a2 Liam R. Howlett    2022-09-06  2776  	 * a completely new data area).
e99668a56430a2 Liam R. Howlett    2022-09-06  2777  	 */
1c71222e5f2393 Suren Baghdasaryan 2023-01-26  2778  	vm_flags_set(vma, VM_SOFTDIRTY);
e99668a56430a2 Liam R. Howlett    2022-09-06  2779  
e99668a56430a2 Liam R. Howlett    2022-09-06  2780  	vma_set_page_prot(vma);
e99668a56430a2 Liam R. Howlett    2022-09-06  2781  
e99668a56430a2 Liam R. Howlett    2022-09-06  2782  	validate_mm(mm);
e99668a56430a2 Liam R. Howlett    2022-09-06  2783  	return addr;
e99668a56430a2 Liam R. Howlett    2022-09-06  2784  
deb0f6562884b5 Carlos Llamas      2022-09-30  2785  close_and_free_vma:
cc8d1b097de78b Liam R. Howlett    2023-01-20  2786  	if (file && vma->vm_ops && vma->vm_ops->close)
deb0f6562884b5 Carlos Llamas      2022-09-30  2787  		vma->vm_ops->close(vma);
cc8d1b097de78b Liam R. Howlett    2023-01-20  2788  
cc8d1b097de78b Liam R. Howlett    2023-01-20  2789  	if (file || vma->vm_file) {
e99668a56430a2 Liam R. Howlett    2022-09-06  2790  unmap_and_free_vma:
e99668a56430a2 Liam R. Howlett    2022-09-06  2791  		fput(vma->vm_file);
e99668a56430a2 Liam R. Howlett    2022-09-06  2792  		vma->vm_file = NULL;
e99668a56430a2 Liam R. Howlett    2022-09-06  2793  
e99668a56430a2 Liam R. Howlett    2022-09-06  2794  		/* Undo any partial mapping done by a device driver. */
cc8d1b097de78b Liam R. Howlett    2023-01-20  2795  		unmap_region(mm, &mm->mm_mt, vma, prev, next, vma->vm_start,
68f48381d7fdd1 Suren Baghdasaryan 2023-01-26  2796  			     vma->vm_end, true);
cc8d1b097de78b Liam R. Howlett    2023-01-20  2797  	}
cc674ab3c01880 Li Zetao           2022-10-28  2798  	if (file && (vm_flags & VM_SHARED))
e99668a56430a2 Liam R. Howlett    2022-09-06  2799  		mapping_unmap_writable(file->f_mapping);
e99668a56430a2 Liam R. Howlett    2022-09-06  2800  free_vma:
e99668a56430a2 Liam R. Howlett    2022-09-06  2801  	vm_area_free(vma);
e99668a56430a2 Liam R. Howlett    2022-09-06  2802  unacct_error:
e99668a56430a2 Liam R. Howlett    2022-09-06  2803  	if (charged)
e99668a56430a2 Liam R. Howlett    2022-09-06  2804  		vm_unacct_memory(charged);
e99668a56430a2 Liam R. Howlett    2022-09-06  2805  	validate_mm(mm);
e99668a56430a2 Liam R. Howlett    2022-09-06  2806  	return error;
e99668a56430a2 Liam R. Howlett    2022-09-06  2807  }
e99668a56430a2 Liam R. Howlett    2022-09-06  2808  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
