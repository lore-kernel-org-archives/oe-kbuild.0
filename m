Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA9D143722
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Apr 2024 15:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714491393; cv=none; b=P5WogLueOBXsMWViUOoULp7MIRW6nRRGVbE7OUothQrGgv8KisLlQu9mRdt2fTTS3zTY/hFcXwCXWdheBQ0J88nIJglm4eeKkNLnEtWPNA/fG3iC2d+3fN7+bxDnOXMSFahmuQmoVI/+vPDUPFpsLwn2BGjXkOqpF0wQCeXci4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714491393; c=relaxed/simple;
	bh=1UTp+WZFcvRiomAH/+JlqZ34kaHMd2rcb9YA/xu+pGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ib3eegPpkQD+t1cYeBvVy6mv4kVDGC6IxSmToSGfLE+FwEQMdCJUmmMjNuGJihiil3oHQ6zj2u/v5Kyy+YMLQm/H9NMrC5o8xGoRPqyUT/cHZKP08RR/0ysRnTNsdAakNgVSwEOnYbkJ91zthHuSP2jrldxzNMiJ5h8wjP1JiOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+nZsrVj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+nZsrVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714491392; x=1746027392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1UTp+WZFcvRiomAH/+JlqZ34kaHMd2rcb9YA/xu+pGs=;
  b=D+nZsrVjPmNdofwxTvd0++7844xPwtawi8qDxGEjFkk2FpvbhmQVlvOU
   +yPaf6o6Fi8wL7wDGxUBXF0WS7egQmB+VnO8JfMkQk41InX00BYPKBrTo
   XoznFhoQljPnR55/B9yNFq6qFIhfkhNoR9IxgCWWp8eDnROZWMkKEA2v8
   miHN+UirVItfIJ8Hs0PyN4bSOXtIh7HdystyrEMpuIkukGv+c+4AJ0YtR
   SkMO500GsnBbCP1D1Wkl0oAxDy5zlwT+54UXOi+YFy0+Q1GWBr2hjRhU8
   byoVpnD3B0sdvZ5gu4pI4HKQy8swVeztSuy7YFivtCSG7JvqXgY2JqpMk
   Q==;
X-CSE-ConnectionGUID: o597WDgdSdy1G9VOBSZ8+w==
X-CSE-MsgGUID: n7F74DTNQl2Lf+GrbQSTzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10427091"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="10427091"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 08:36:30 -0700
X-CSE-ConnectionGUID: vy0n2k8XTjiZR9ed4WW7Fg==
X-CSE-MsgGUID: 8HAtnvsoRM656m975Fd6lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="57384801"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Apr 2024 08:36:28 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1pWr-0008Gt-22;
	Tue, 30 Apr 2024 15:36:25 +0000
Date: Tue, 30 Apr 2024 23:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9166/9709] drivers/virt/acrn/mm.c:217
 acrn_vm_ram_map() error: uninitialized symbol 'start_pfn'.
Message-ID: <202404302323.12xcQx9f-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d04466706db5e241ee026f17b5f920e50dee26b5
commit: 226ab8becddabe23219e4528e29d8b8429c7755a [9166/9709] drivers/virt/acrn: fix PFNMAP PTE checks in acrn_vm_ram_map()
:::::: branch date: 8 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20240430 (https://download.01.org/0day-ci/archive/20240430/202404302323.12xcQx9f-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404302323.12xcQx9f-lkp@intel.com/

New smatch warnings:
drivers/virt/acrn/mm.c:217 acrn_vm_ram_map() error: uninitialized symbol 'start_pfn'.
drivers/virt/acrn/mm.c:224 acrn_vm_ram_map() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/virt/acrn/mm.c:231 acrn_vm_ram_map() error: uninitialized symbol 'start_pfn'.

vim +/start_pfn +217 drivers/virt/acrn/mm.c

88f537d5e8ddc8 Shuo Liu          2021-02-07  148  
88f537d5e8ddc8 Shuo Liu          2021-02-07  149  /**
88f537d5e8ddc8 Shuo Liu          2021-02-07  150   * acrn_vm_ram_map() - Create a RAM EPT mapping of User VM.
88f537d5e8ddc8 Shuo Liu          2021-02-07  151   * @vm:		The User VM pointer
88f537d5e8ddc8 Shuo Liu          2021-02-07  152   * @memmap:	Info of the EPT mapping
88f537d5e8ddc8 Shuo Liu          2021-02-07  153   *
88f537d5e8ddc8 Shuo Liu          2021-02-07  154   * Return: 0 on success, <0 for error.
88f537d5e8ddc8 Shuo Liu          2021-02-07  155   */
88f537d5e8ddc8 Shuo Liu          2021-02-07  156  int acrn_vm_ram_map(struct acrn_vm *vm, struct acrn_vm_memmap *memmap)
88f537d5e8ddc8 Shuo Liu          2021-02-07  157  {
88f537d5e8ddc8 Shuo Liu          2021-02-07  158  	struct vm_memory_region_batch *regions_info;
226ab8becddabe David Hildenbrand 2024-04-10  159  	int nr_pages, i, order, nr_regions = 0;
88f537d5e8ddc8 Shuo Liu          2021-02-07  160  	struct vm_memory_mapping *region_mapping;
88f537d5e8ddc8 Shuo Liu          2021-02-07  161  	struct vm_memory_region_op *vm_region;
88f537d5e8ddc8 Shuo Liu          2021-02-07  162  	struct page **pages = NULL, *page;
88f537d5e8ddc8 Shuo Liu          2021-02-07  163  	void *remap_vaddr;
88f537d5e8ddc8 Shuo Liu          2021-02-07  164  	int ret, pinned;
88f537d5e8ddc8 Shuo Liu          2021-02-07  165  	u64 user_vm_pa;
8a6e85f75a83d1 Yonghua Huang     2022-02-28  166  	struct vm_area_struct *vma;
88f537d5e8ddc8 Shuo Liu          2021-02-07  167  
88f537d5e8ddc8 Shuo Liu          2021-02-07  168  	if (!vm || !memmap)
88f537d5e8ddc8 Shuo Liu          2021-02-07  169  		return -EINVAL;
88f537d5e8ddc8 Shuo Liu          2021-02-07  170  
226ab8becddabe David Hildenbrand 2024-04-10  171  	/* Get the page number of the map region */
226ab8becddabe David Hildenbrand 2024-04-10  172  	nr_pages = memmap->len >> PAGE_SHIFT;
226ab8becddabe David Hildenbrand 2024-04-10  173  	if (!nr_pages)
226ab8becddabe David Hildenbrand 2024-04-10  174  		return -EINVAL;
226ab8becddabe David Hildenbrand 2024-04-10  175  
8a6e85f75a83d1 Yonghua Huang     2022-02-28  176  	mmap_read_lock(current->mm);
8a6e85f75a83d1 Yonghua Huang     2022-02-28  177  	vma = vma_lookup(current->mm, memmap->vma_base);
8a6e85f75a83d1 Yonghua Huang     2022-02-28  178  	if (vma && ((vma->vm_flags & VM_PFNMAP) != 0)) {
226ab8becddabe David Hildenbrand 2024-04-10  179  		unsigned long start_pfn, cur_pfn;
1b265da7ea1e1a Christoph Hellwig 2024-03-25  180  		spinlock_t *ptl;
226ab8becddabe David Hildenbrand 2024-04-10  181  		bool writable;
1b265da7ea1e1a Christoph Hellwig 2024-03-25  182  		pte_t *ptep;
1b265da7ea1e1a Christoph Hellwig 2024-03-25  183  
8a6e85f75a83d1 Yonghua Huang     2022-02-28  184  		if ((memmap->vma_base + memmap->len) > vma->vm_end) {
8a6e85f75a83d1 Yonghua Huang     2022-02-28  185  			mmap_read_unlock(current->mm);
8a6e85f75a83d1 Yonghua Huang     2022-02-28  186  			return -EINVAL;
8a6e85f75a83d1 Yonghua Huang     2022-02-28  187  		}
8a6e85f75a83d1 Yonghua Huang     2022-02-28  188  
226ab8becddabe David Hildenbrand 2024-04-10  189  		for (i = 0; i < nr_pages; i++) {
226ab8becddabe David Hildenbrand 2024-04-10  190  			ret = follow_pte(vma->vm_mm,
226ab8becddabe David Hildenbrand 2024-04-10  191  					 memmap->vma_base + i * PAGE_SIZE,
226ab8becddabe David Hildenbrand 2024-04-10  192  					 &ptep, &ptl);
226ab8becddabe David Hildenbrand 2024-04-10  193  			if (ret)
226ab8becddabe David Hildenbrand 2024-04-10  194  				break;
226ab8becddabe David Hildenbrand 2024-04-10  195  
226ab8becddabe David Hildenbrand 2024-04-10  196  			cur_pfn = pte_pfn(ptep_get(ptep));
226ab8becddabe David Hildenbrand 2024-04-10  197  			if (i == 0)
226ab8becddabe David Hildenbrand 2024-04-10  198  				start_pfn = cur_pfn;
226ab8becddabe David Hildenbrand 2024-04-10  199  			writable = !!pte_write(ptep_get(ptep));
226ab8becddabe David Hildenbrand 2024-04-10  200  			pte_unmap_unlock(ptep, ptl);
226ab8becddabe David Hildenbrand 2024-04-10  201  
226ab8becddabe David Hildenbrand 2024-04-10  202  			/* Disallow write access if the PTE is not writable. */
226ab8becddabe David Hildenbrand 2024-04-10  203  			if (!writable &&
226ab8becddabe David Hildenbrand 2024-04-10  204  			    (memmap->attr & ACRN_MEM_ACCESS_WRITE)) {
226ab8becddabe David Hildenbrand 2024-04-10  205  				ret = -EFAULT;
226ab8becddabe David Hildenbrand 2024-04-10  206  				break;
226ab8becddabe David Hildenbrand 2024-04-10  207  			}
226ab8becddabe David Hildenbrand 2024-04-10  208  
226ab8becddabe David Hildenbrand 2024-04-10  209  			/* Disallow refcounted pages. */
226ab8becddabe David Hildenbrand 2024-04-10  210  			if (pfn_valid(cur_pfn) &&
226ab8becddabe David Hildenbrand 2024-04-10  211  			    !PageReserved(pfn_to_page(cur_pfn))) {
226ab8becddabe David Hildenbrand 2024-04-10  212  				ret = -EFAULT;
226ab8becddabe David Hildenbrand 2024-04-10  213  				break;
226ab8becddabe David Hildenbrand 2024-04-10  214  			}
226ab8becddabe David Hildenbrand 2024-04-10  215  
226ab8becddabe David Hildenbrand 2024-04-10  216  			/* Disallow non-contiguous ranges. */
226ab8becddabe David Hildenbrand 2024-04-10 @217  			if (cur_pfn != start_pfn + i) {
226ab8becddabe David Hildenbrand 2024-04-10  218  				ret = -EINVAL;
226ab8becddabe David Hildenbrand 2024-04-10  219  				break;
226ab8becddabe David Hildenbrand 2024-04-10  220  			}
226ab8becddabe David Hildenbrand 2024-04-10  221  		}
1b265da7ea1e1a Christoph Hellwig 2024-03-25  222  		mmap_read_unlock(current->mm);
226ab8becddabe David Hildenbrand 2024-04-10  223  
226ab8becddabe David Hildenbrand 2024-04-10 @224  		if (ret) {
8a6e85f75a83d1 Yonghua Huang     2022-02-28  225  			dev_dbg(acrn_dev.this_device,
8a6e85f75a83d1 Yonghua Huang     2022-02-28  226  				"Failed to lookup PFN at VMA:%pK.\n", (void *)memmap->vma_base);
8a6e85f75a83d1 Yonghua Huang     2022-02-28  227  			return ret;
8a6e85f75a83d1 Yonghua Huang     2022-02-28  228  		}
8a6e85f75a83d1 Yonghua Huang     2022-02-28  229  
8a6e85f75a83d1 Yonghua Huang     2022-02-28  230  		return acrn_mm_region_add(vm, memmap->user_vm_pa,
226ab8becddabe David Hildenbrand 2024-04-10  231  			 PFN_PHYS(start_pfn), memmap->len,
8a6e85f75a83d1 Yonghua Huang     2022-02-28  232  			 ACRN_MEM_TYPE_WB, memmap->attr);
8a6e85f75a83d1 Yonghua Huang     2022-02-28  233  	}
8a6e85f75a83d1 Yonghua Huang     2022-02-28  234  	mmap_read_unlock(current->mm);
8a6e85f75a83d1 Yonghua Huang     2022-02-28  235  
746f1b0ac5bf6e Len Baker         2021-10-29  236  	pages = vzalloc(array_size(nr_pages, sizeof(*pages)));
88f537d5e8ddc8 Shuo Liu          2021-02-07  237  	if (!pages)
88f537d5e8ddc8 Shuo Liu          2021-02-07  238  		return -ENOMEM;
88f537d5e8ddc8 Shuo Liu          2021-02-07  239  
88f537d5e8ddc8 Shuo Liu          2021-02-07  240  	/* Lock the pages of user memory map region */
88f537d5e8ddc8 Shuo Liu          2021-02-07  241  	pinned = pin_user_pages_fast(memmap->vma_base,
88f537d5e8ddc8 Shuo Liu          2021-02-07  242  				     nr_pages, FOLL_WRITE | FOLL_LONGTERM,
88f537d5e8ddc8 Shuo Liu          2021-02-07  243  				     pages);
88f537d5e8ddc8 Shuo Liu          2021-02-07  244  	if (pinned < 0) {
88f537d5e8ddc8 Shuo Liu          2021-02-07  245  		ret = pinned;
88f537d5e8ddc8 Shuo Liu          2021-02-07  246  		goto free_pages;
88f537d5e8ddc8 Shuo Liu          2021-02-07  247  	} else if (pinned != nr_pages) {
88f537d5e8ddc8 Shuo Liu          2021-02-07  248  		ret = -EFAULT;
88f537d5e8ddc8 Shuo Liu          2021-02-07  249  		goto put_pages;
88f537d5e8ddc8 Shuo Liu          2021-02-07  250  	}
88f537d5e8ddc8 Shuo Liu          2021-02-07  251  
88f537d5e8ddc8 Shuo Liu          2021-02-07  252  	/* Create a kernel map for the map region */
88f537d5e8ddc8 Shuo Liu          2021-02-07  253  	remap_vaddr = vmap(pages, nr_pages, VM_MAP, PAGE_KERNEL);
88f537d5e8ddc8 Shuo Liu          2021-02-07  254  	if (!remap_vaddr) {
88f537d5e8ddc8 Shuo Liu          2021-02-07  255  		ret = -ENOMEM;
88f537d5e8ddc8 Shuo Liu          2021-02-07  256  		goto put_pages;
88f537d5e8ddc8 Shuo Liu          2021-02-07  257  	}
88f537d5e8ddc8 Shuo Liu          2021-02-07  258  
88f537d5e8ddc8 Shuo Liu          2021-02-07  259  	/* Record Service VM va <-> User VM pa mapping */
88f537d5e8ddc8 Shuo Liu          2021-02-07  260  	mutex_lock(&vm->regions_mapping_lock);
88f537d5e8ddc8 Shuo Liu          2021-02-07  261  	region_mapping = &vm->regions_mapping[vm->regions_mapping_count];
88f537d5e8ddc8 Shuo Liu          2021-02-07  262  	if (vm->regions_mapping_count < ACRN_MEM_MAPPING_MAX) {
88f537d5e8ddc8 Shuo Liu          2021-02-07  263  		region_mapping->pages = pages;
88f537d5e8ddc8 Shuo Liu          2021-02-07  264  		region_mapping->npages = nr_pages;
88f537d5e8ddc8 Shuo Liu          2021-02-07  265  		region_mapping->size = memmap->len;
88f537d5e8ddc8 Shuo Liu          2021-02-07  266  		region_mapping->service_vm_va = remap_vaddr;
88f537d5e8ddc8 Shuo Liu          2021-02-07  267  		region_mapping->user_vm_pa = memmap->user_vm_pa;
88f537d5e8ddc8 Shuo Liu          2021-02-07  268  		vm->regions_mapping_count++;
88f537d5e8ddc8 Shuo Liu          2021-02-07  269  	} else {
88f537d5e8ddc8 Shuo Liu          2021-02-07  270  		dev_warn(acrn_dev.this_device,
88f537d5e8ddc8 Shuo Liu          2021-02-07  271  			"Run out of memory mapping slots!\n");
88f537d5e8ddc8 Shuo Liu          2021-02-07  272  		ret = -ENOMEM;
88f537d5e8ddc8 Shuo Liu          2021-02-07  273  		mutex_unlock(&vm->regions_mapping_lock);
88f537d5e8ddc8 Shuo Liu          2021-02-07  274  		goto unmap_no_count;
88f537d5e8ddc8 Shuo Liu          2021-02-07  275  	}
88f537d5e8ddc8 Shuo Liu          2021-02-07  276  	mutex_unlock(&vm->regions_mapping_lock);
88f537d5e8ddc8 Shuo Liu          2021-02-07  277  
88f537d5e8ddc8 Shuo Liu          2021-02-07  278  	/* Calculate count of vm_memory_region_op */
226ab8becddabe David Hildenbrand 2024-04-10  279  	for (i = 0; i < nr_pages; i += 1 << order) {
88f537d5e8ddc8 Shuo Liu          2021-02-07  280  		page = pages[i];
88f537d5e8ddc8 Shuo Liu          2021-02-07  281  		VM_BUG_ON_PAGE(PageTail(page), page);
88f537d5e8ddc8 Shuo Liu          2021-02-07  282  		order = compound_order(page);
88f537d5e8ddc8 Shuo Liu          2021-02-07  283  		nr_regions++;
88f537d5e8ddc8 Shuo Liu          2021-02-07  284  	}
88f537d5e8ddc8 Shuo Liu          2021-02-07  285  
88f537d5e8ddc8 Shuo Liu          2021-02-07  286  	/* Prepare the vm_memory_region_batch */
746f1b0ac5bf6e Len Baker         2021-10-29  287  	regions_info = kzalloc(struct_size(regions_info, regions_op,
746f1b0ac5bf6e Len Baker         2021-10-29  288  					   nr_regions), GFP_KERNEL);
88f537d5e8ddc8 Shuo Liu          2021-02-07  289  	if (!regions_info) {
88f537d5e8ddc8 Shuo Liu          2021-02-07  290  		ret = -ENOMEM;
88f537d5e8ddc8 Shuo Liu          2021-02-07  291  		goto unmap_kernel_map;
88f537d5e8ddc8 Shuo Liu          2021-02-07  292  	}
51a71ab21f61ce Kees Cook         2023-09-22  293  	regions_info->regions_num = nr_regions;
88f537d5e8ddc8 Shuo Liu          2021-02-07  294  
88f537d5e8ddc8 Shuo Liu          2021-02-07  295  	/* Fill each vm_memory_region_op */
746f1b0ac5bf6e Len Baker         2021-10-29  296  	vm_region = regions_info->regions_op;
88f537d5e8ddc8 Shuo Liu          2021-02-07  297  	regions_info->vmid = vm->vmid;
88f537d5e8ddc8 Shuo Liu          2021-02-07  298  	regions_info->regions_gpa = virt_to_phys(vm_region);
88f537d5e8ddc8 Shuo Liu          2021-02-07  299  	user_vm_pa = memmap->user_vm_pa;
226ab8becddabe David Hildenbrand 2024-04-10  300  	for (i = 0; i < nr_pages; i += 1 << order) {
88f537d5e8ddc8 Shuo Liu          2021-02-07  301  		u32 region_size;
88f537d5e8ddc8 Shuo Liu          2021-02-07  302  
88f537d5e8ddc8 Shuo Liu          2021-02-07  303  		page = pages[i];
88f537d5e8ddc8 Shuo Liu          2021-02-07  304  		VM_BUG_ON_PAGE(PageTail(page), page);
88f537d5e8ddc8 Shuo Liu          2021-02-07  305  		order = compound_order(page);
88f537d5e8ddc8 Shuo Liu          2021-02-07  306  		region_size = PAGE_SIZE << order;
88f537d5e8ddc8 Shuo Liu          2021-02-07  307  		vm_region->type = ACRN_MEM_REGION_ADD;
88f537d5e8ddc8 Shuo Liu          2021-02-07  308  		vm_region->user_vm_pa = user_vm_pa;
88f537d5e8ddc8 Shuo Liu          2021-02-07  309  		vm_region->service_vm_pa = page_to_phys(page);
88f537d5e8ddc8 Shuo Liu          2021-02-07  310  		vm_region->size = region_size;
88f537d5e8ddc8 Shuo Liu          2021-02-07  311  		vm_region->attr = (ACRN_MEM_TYPE_WB & ACRN_MEM_TYPE_MASK) |
88f537d5e8ddc8 Shuo Liu          2021-02-07  312  				  (memmap->attr & ACRN_MEM_ACCESS_RIGHT_MASK);
88f537d5e8ddc8 Shuo Liu          2021-02-07  313  
88f537d5e8ddc8 Shuo Liu          2021-02-07  314  		vm_region++;
88f537d5e8ddc8 Shuo Liu          2021-02-07  315  		user_vm_pa += region_size;
88f537d5e8ddc8 Shuo Liu          2021-02-07  316  	}
88f537d5e8ddc8 Shuo Liu          2021-02-07  317  
88f537d5e8ddc8 Shuo Liu          2021-02-07  318  	/* Inform the ACRN Hypervisor to set up EPT mappings */
88f537d5e8ddc8 Shuo Liu          2021-02-07  319  	ret = hcall_set_memory_regions(virt_to_phys(regions_info));
88f537d5e8ddc8 Shuo Liu          2021-02-07  320  	if (ret < 0) {
88f537d5e8ddc8 Shuo Liu          2021-02-07  321  		dev_dbg(acrn_dev.this_device,
88f537d5e8ddc8 Shuo Liu          2021-02-07  322  			"Failed to set regions, VM[%u]!\n", vm->vmid);
88f537d5e8ddc8 Shuo Liu          2021-02-07  323  		goto unset_region;
88f537d5e8ddc8 Shuo Liu          2021-02-07  324  	}
88f537d5e8ddc8 Shuo Liu          2021-02-07  325  	kfree(regions_info);
88f537d5e8ddc8 Shuo Liu          2021-02-07  326  
88f537d5e8ddc8 Shuo Liu          2021-02-07  327  	dev_dbg(acrn_dev.this_device,
88f537d5e8ddc8 Shuo Liu          2021-02-07  328  		"%s: VM[%u] service-GVA[%pK] user-GPA[%pK] size[0x%llx]\n",
88f537d5e8ddc8 Shuo Liu          2021-02-07  329  		__func__, vm->vmid,
88f537d5e8ddc8 Shuo Liu          2021-02-07  330  		remap_vaddr, (void *)memmap->user_vm_pa, memmap->len);
88f537d5e8ddc8 Shuo Liu          2021-02-07  331  	return ret;
88f537d5e8ddc8 Shuo Liu          2021-02-07  332  
88f537d5e8ddc8 Shuo Liu          2021-02-07  333  unset_region:
88f537d5e8ddc8 Shuo Liu          2021-02-07  334  	kfree(regions_info);
88f537d5e8ddc8 Shuo Liu          2021-02-07  335  unmap_kernel_map:
88f537d5e8ddc8 Shuo Liu          2021-02-07  336  	mutex_lock(&vm->regions_mapping_lock);
88f537d5e8ddc8 Shuo Liu          2021-02-07  337  	vm->regions_mapping_count--;
88f537d5e8ddc8 Shuo Liu          2021-02-07  338  	mutex_unlock(&vm->regions_mapping_lock);
88f537d5e8ddc8 Shuo Liu          2021-02-07  339  unmap_no_count:
88f537d5e8ddc8 Shuo Liu          2021-02-07  340  	vunmap(remap_vaddr);
88f537d5e8ddc8 Shuo Liu          2021-02-07  341  put_pages:
88f537d5e8ddc8 Shuo Liu          2021-02-07  342  	for (i = 0; i < pinned; i++)
88f537d5e8ddc8 Shuo Liu          2021-02-07  343  		unpin_user_page(pages[i]);
88f537d5e8ddc8 Shuo Liu          2021-02-07  344  free_pages:
88f537d5e8ddc8 Shuo Liu          2021-02-07  345  	vfree(pages);
88f537d5e8ddc8 Shuo Liu          2021-02-07  346  	return ret;
88f537d5e8ddc8 Shuo Liu          2021-02-07  347  }
88f537d5e8ddc8 Shuo Liu          2021-02-07  348  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
