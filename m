Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAE58BE0
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Oct 2024 00:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728003002; cv=none; b=FDr6JRyzqaYkugarRQHcEP9yMIbfAsXfnMath9JZHJQreV2OwDdASnX9zv2dZb/SEM0md3B3kIOwmQPHIoTxpvBI9bkLQ2JIP7MUi19TAFjlLGN58gAXXBSpmG36LEUCEgYSVCHSoAhM32l008hv9JEfROQEiD41cTU/q4qQoaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728003002; c=relaxed/simple;
	bh=OS/g0/hIsN8z4zMLctS1NZiexZvd6cnOgoieNjXMNIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A6H2hL/fHqT7m5JVcBdU4oKKDwwnrmzN5YynmbvesEE8goDrCbxFZVuVsM21uvBNBCH1c2h047EAFn7piO3uHZbe3eFZJkVsL20eTj9f1eYT4R/ioTK71DqIB/32xFPLNpAfwlIMfJuYHHcprpWY4e/DilEirYkEC2QOPj3WaOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwSfVP8U; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwSfVP8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728003000; x=1759539000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OS/g0/hIsN8z4zMLctS1NZiexZvd6cnOgoieNjXMNIE=;
  b=XwSfVP8UdX4CE7si9w83sPYx6TiQ/Ebddl7wYqRkZMKkZFnWBVJKzFjH
   WQhkgCxFhBiadjYCndeSa3gZBqZZOn0kIGG5WBdTprCS2FDHT8xbDj7hE
   J8Tj1jpB3YZMN9+y73KISttMdURZpETqkXJsDPcxI/gWGEYkvDNatjPm7
   hqRp4C9VMqIUoS8SK/tGfobG6vqivkAEcpk38OU2u1R9wnNxT1XAvZusu
   +sO1CgRHeU33ynpnBZb3C87MfE1ExrHzmRq1uKDgbQR94SqPTFyDGgd/Y
   5M50IyK6CG2dA6fEmklnMpmSz2SEfNVbTna3ial9xU4LU3vTz8Y661jn2
   A==;
X-CSE-ConnectionGUID: ZfJrIIMlRYCRr4kkBi3W/g==
X-CSE-MsgGUID: gzm2rmAmTsWnLeSpujJEDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="49753935"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="49753935"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 17:49:59 -0700
X-CSE-ConnectionGUID: w+DBGoPmQsiH7LJg7msHYg==
X-CSE-MsgGUID: G4IyQkghQ0yj1dw2RykAKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="79391178"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Oct 2024 17:49:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swWW3-00014a-0g;
	Fri, 04 Oct 2024 00:49:55 +0000
Date: Fri, 4 Oct 2024 08:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/virt/acrn/mm.c:217 acrn_vm_ram_map() error: uninitialized
 symbol 'start_pfn'.
Message-ID: <202410040808.hXQMwb3H-lkp@intel.com>
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
TO: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c245fe7dde3bf776253550fc914a36293db4ff3
commit: 3d6586008f7b638f91f3332602592caa8b00b559 drivers/virt/acrn: fix PFNMAP PTE checks in acrn_vm_ram_map()
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20241004 (https://download.01.org/0day-ci/archive/20241004/202410040808.hXQMwb3H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410040808.hXQMwb3H-lkp@intel.com/

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
3d6586008f7b63 David Hildenbrand 2024-04-10  159  	int nr_pages, i, order, nr_regions = 0;
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
3d6586008f7b63 David Hildenbrand 2024-04-10  171  	/* Get the page number of the map region */
3d6586008f7b63 David Hildenbrand 2024-04-10  172  	nr_pages = memmap->len >> PAGE_SHIFT;
3d6586008f7b63 David Hildenbrand 2024-04-10  173  	if (!nr_pages)
3d6586008f7b63 David Hildenbrand 2024-04-10  174  		return -EINVAL;
3d6586008f7b63 David Hildenbrand 2024-04-10  175  
8a6e85f75a83d1 Yonghua Huang     2022-02-28  176  	mmap_read_lock(current->mm);
8a6e85f75a83d1 Yonghua Huang     2022-02-28  177  	vma = vma_lookup(current->mm, memmap->vma_base);
8a6e85f75a83d1 Yonghua Huang     2022-02-28  178  	if (vma && ((vma->vm_flags & VM_PFNMAP) != 0)) {
3d6586008f7b63 David Hildenbrand 2024-04-10  179  		unsigned long start_pfn, cur_pfn;
1b265da7ea1e1a Christoph Hellwig 2024-03-25  180  		spinlock_t *ptl;
3d6586008f7b63 David Hildenbrand 2024-04-10  181  		bool writable;
1b265da7ea1e1a Christoph Hellwig 2024-03-25  182  		pte_t *ptep;
1b265da7ea1e1a Christoph Hellwig 2024-03-25  183  
8a6e85f75a83d1 Yonghua Huang     2022-02-28  184  		if ((memmap->vma_base + memmap->len) > vma->vm_end) {
8a6e85f75a83d1 Yonghua Huang     2022-02-28  185  			mmap_read_unlock(current->mm);
8a6e85f75a83d1 Yonghua Huang     2022-02-28  186  			return -EINVAL;
8a6e85f75a83d1 Yonghua Huang     2022-02-28  187  		}
8a6e85f75a83d1 Yonghua Huang     2022-02-28  188  
3d6586008f7b63 David Hildenbrand 2024-04-10  189  		for (i = 0; i < nr_pages; i++) {
3d6586008f7b63 David Hildenbrand 2024-04-10  190  			ret = follow_pte(vma->vm_mm,
3d6586008f7b63 David Hildenbrand 2024-04-10  191  					 memmap->vma_base + i * PAGE_SIZE,
3d6586008f7b63 David Hildenbrand 2024-04-10  192  					 &ptep, &ptl);
3d6586008f7b63 David Hildenbrand 2024-04-10  193  			if (ret)
3d6586008f7b63 David Hildenbrand 2024-04-10  194  				break;
3d6586008f7b63 David Hildenbrand 2024-04-10  195  
3d6586008f7b63 David Hildenbrand 2024-04-10  196  			cur_pfn = pte_pfn(ptep_get(ptep));
3d6586008f7b63 David Hildenbrand 2024-04-10  197  			if (i == 0)
3d6586008f7b63 David Hildenbrand 2024-04-10  198  				start_pfn = cur_pfn;
3d6586008f7b63 David Hildenbrand 2024-04-10  199  			writable = !!pte_write(ptep_get(ptep));
3d6586008f7b63 David Hildenbrand 2024-04-10  200  			pte_unmap_unlock(ptep, ptl);
3d6586008f7b63 David Hildenbrand 2024-04-10  201  
3d6586008f7b63 David Hildenbrand 2024-04-10  202  			/* Disallow write access if the PTE is not writable. */
3d6586008f7b63 David Hildenbrand 2024-04-10  203  			if (!writable &&
3d6586008f7b63 David Hildenbrand 2024-04-10  204  			    (memmap->attr & ACRN_MEM_ACCESS_WRITE)) {
3d6586008f7b63 David Hildenbrand 2024-04-10  205  				ret = -EFAULT;
3d6586008f7b63 David Hildenbrand 2024-04-10  206  				break;
3d6586008f7b63 David Hildenbrand 2024-04-10  207  			}
3d6586008f7b63 David Hildenbrand 2024-04-10  208  
3d6586008f7b63 David Hildenbrand 2024-04-10  209  			/* Disallow refcounted pages. */
3d6586008f7b63 David Hildenbrand 2024-04-10  210  			if (pfn_valid(cur_pfn) &&
3d6586008f7b63 David Hildenbrand 2024-04-10  211  			    !PageReserved(pfn_to_page(cur_pfn))) {
3d6586008f7b63 David Hildenbrand 2024-04-10  212  				ret = -EFAULT;
3d6586008f7b63 David Hildenbrand 2024-04-10  213  				break;
3d6586008f7b63 David Hildenbrand 2024-04-10  214  			}
3d6586008f7b63 David Hildenbrand 2024-04-10  215  
3d6586008f7b63 David Hildenbrand 2024-04-10  216  			/* Disallow non-contiguous ranges. */
3d6586008f7b63 David Hildenbrand 2024-04-10 @217  			if (cur_pfn != start_pfn + i) {
3d6586008f7b63 David Hildenbrand 2024-04-10  218  				ret = -EINVAL;
3d6586008f7b63 David Hildenbrand 2024-04-10  219  				break;
3d6586008f7b63 David Hildenbrand 2024-04-10  220  			}
3d6586008f7b63 David Hildenbrand 2024-04-10  221  		}
1b265da7ea1e1a Christoph Hellwig 2024-03-25  222  		mmap_read_unlock(current->mm);
3d6586008f7b63 David Hildenbrand 2024-04-10  223  
3d6586008f7b63 David Hildenbrand 2024-04-10 @224  		if (ret) {
8a6e85f75a83d1 Yonghua Huang     2022-02-28  225  			dev_dbg(acrn_dev.this_device,
8a6e85f75a83d1 Yonghua Huang     2022-02-28  226  				"Failed to lookup PFN at VMA:%pK.\n", (void *)memmap->vma_base);
8a6e85f75a83d1 Yonghua Huang     2022-02-28  227  			return ret;
8a6e85f75a83d1 Yonghua Huang     2022-02-28  228  		}
8a6e85f75a83d1 Yonghua Huang     2022-02-28  229  
8a6e85f75a83d1 Yonghua Huang     2022-02-28  230  		return acrn_mm_region_add(vm, memmap->user_vm_pa,
3d6586008f7b63 David Hildenbrand 2024-04-10  231  			 PFN_PHYS(start_pfn), memmap->len,
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
3d6586008f7b63 David Hildenbrand 2024-04-10  279  	for (i = 0; i < nr_pages; i += 1 << order) {
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
3d6586008f7b63 David Hildenbrand 2024-04-10  300  	for (i = 0; i < nr_pages; i += 1 << order) {
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
