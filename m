Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81855390616
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 06:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784268824; cv=none; b=aHJ5QfMsEN21l1cbrS22s9QRXS5BgkBpX/79B5420DXjZuVXLVcw+d04l+pUWBLNfXPBmAm+HxoEpnlehKoIi7U6mK+Zzw6tRG++Mu4s99alIBb1E1lXyfNn/mRFFWryWwmnebcsIKBsx6WvPhHQwLaxhhItRdzL5Iv6r9xVoS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784268824; c=relaxed/simple;
	bh=uPtl4/Ip5gdUz/k+QkrYxl7U2iBUWboLYSyrh2l+/O4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=URs1q6B+ajGXaDSjRzCCF9lzhjUDVbCAhqZbMv/wnsTmGR0U/B544YwzipIzDb6SAxkCHKk7atLERmbwkCvadaV37OkMijRtkjTnhoCDRfyTPsFTcW7lCLnAyFagOzqJl/yaLtCTIL6Y8ywysIvG8xTW26LOjZ0GDpvti2+PWtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aslylNLE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aslylNLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784268821; x=1815804821;
  h=date:from:to:cc:subject:message-id;
  bh=uPtl4/Ip5gdUz/k+QkrYxl7U2iBUWboLYSyrh2l+/O4=;
  b=aslylNLEc0a8b0d8r5QTUpFiixbnSMBjb+CQv8RyoQSPPi05CjEUVtim
   EeWecK8m/EQzXry1G4xtUWYFRzVIrgAgwxA1AiKCKNxvWJE++GmTT4gVt
   CXTfNaKlYbGl4BTxbXxvBAplKdhVYheuULLh89BjhO9nLyLvGFxDBzHlB
   2HB1kmE6nNSOptOKHqPhDhY46iMJx6tsWcjUaMgdMKzo2NgzP2JC4t0R8
   qRfAjHfTvSiIocOehJPevbwNHMt9zP6kYX1jJslDK/cflt3jiEwW0qnXY
   0/aKD0vw6NEuJkoHnJN3ks1JLR/FKpuxbZAQuyftnjozNwXd99s8M6AU+
   g==;
X-CSE-ConnectionGUID: EFwotg4gTXuWOS9kyIbcwA==
X-CSE-MsgGUID: zExT/ZaKTqmJkhdbaSi8uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96302945"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="96302945"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 23:13:41 -0700
X-CSE-ConnectionGUID: wk40vz80RyGgfHqX/EDjrA==
X-CSE-MsgGUID: zN9qKfXKSXCuj3hO66zJ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="257335995"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Jul 2026 23:13:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkbpI-00000000STq-48VI;
	Fri, 17 Jul 2026 06:13:36 +0000
Date: Fri, 17 Jul 2026 14:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/vmalloc.c:4442:57: error: use of undeclared identifier
 'gfp'
Message-ID: <202607171306.cApYtfvS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/deepakraog/selftests-proc-expand-smaps-field-coverage-and-require-TMPFS/20260715-235653, commit: 9d4dde17d9bbfd6739f223d0dcd79a76b445abcc"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: deepakraog <gaikwad.dcg@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/deepakraog/selftests-proc-expand-smaps-field-coverage-and-require-TMPFS/20260715-235653
head:   d9d0f9a9456e0c39c577578411fdf41e0e54deff
commit: 9d4dde17d9bbfd6739f223d0dcd79a76b445abcc mm: vrealloc: grow vm_area mappings in place
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260717/202607171306.cApYtfvS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171306.cApYtfvS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607171306.cApYtfvS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmalloc.c:4442:57: error: use of undeclared identifier 'gfp'
    4442 |                         pages = kvmalloc_array(extra, sizeof(struct page *), gfp);
         |                                                                              ^~~
>> mm/vmalloc.c:4442:57: error: use of undeclared identifier 'gfp'
    4442 |                         pages = kvmalloc_array(extra, sizeof(struct page *), gfp);
         |                                                                              ^~~
>> mm/vmalloc.c:4442:57: error: use of undeclared identifier 'gfp'
    4442 |                         pages = kvmalloc_array(extra, sizeof(struct page *), gfp);
         |                                                                              ^~~
   mm/vmalloc.c:4446:47: error: use of undeclared identifier 'gfp'
    4446 |                         if (vm_area_alloc_pages(vmalloc_gfp_adjust(gfp, 0), nid,
         |                                                                    ^~~
   4 errors generated.


vim +/gfp +4442 mm/vmalloc.c

e1ca7788dec677 Dave Young       2010-10-26  4281  
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4282  /**
eb3f781ab73e7e Bagas Sanjaya    2025-12-19  4283   * vrealloc_node_align - reallocate virtually contiguous memory; contents
4c5d3365882dbb Vitaly Wool      2025-08-06  4284   * remain unchanged
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4285   * @p: object to reallocate memory for
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4286   * @size: the size to reallocate
4c5d3365882dbb Vitaly Wool      2025-08-06  4287   * @align: requested alignment
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4288   * @flags: the flags for the page level allocator
4c5d3365882dbb Vitaly Wool      2025-08-06  4289   * @nid: node number of the target node
4c5d3365882dbb Vitaly Wool      2025-08-06  4290   *
4c5d3365882dbb Vitaly Wool      2025-08-06  4291   * If @p is %NULL, vrealloc_XXX() behaves exactly like vmalloc_XXX(). If @size
4c5d3365882dbb Vitaly Wool      2025-08-06  4292   * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4293   *
4c5d3365882dbb Vitaly Wool      2025-08-06  4294   * If the caller wants the new memory to be on specific node *only*,
4c5d3365882dbb Vitaly Wool      2025-08-06  4295   * __GFP_THISNODE flag should be set, otherwise the function will try to avoid
4c5d3365882dbb Vitaly Wool      2025-08-06  4296   * reallocation and possibly disregard the specified @nid.
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4297   *
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4298   * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4299   * initial memory allocation, every subsequent call to this API for the same
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4300   * memory allocation is flagged with __GFP_ZERO. Otherwise, it is possible that
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4301   * __GFP_ZERO is not fully honored by this API.
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4302   *
4c5d3365882dbb Vitaly Wool      2025-08-06  4303   * Requesting an alignment that is bigger than the alignment of the existing
4c5d3365882dbb Vitaly Wool      2025-08-06  4304   * allocation will fail.
4c5d3365882dbb Vitaly Wool      2025-08-06  4305   *
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4306   * In any case, the contents of the object pointed to are preserved up to the
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4307   * lesser of the new and old sizes.
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4308   *
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4309   * This function must not be called concurrently with itself or vfree() for the
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4310   * same memory allocation.
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4311   *
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4312   * Return: pointer to the allocated memory; %NULL if @size is zero or in case of
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4313   *         failure
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4314   */
4c5d3365882dbb Vitaly Wool      2025-08-06  4315  void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align,
4c5d3365882dbb Vitaly Wool      2025-08-06  4316  				 gfp_t flags, int nid)
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4317  {
a0309faf1cb062 Kees Cook        2025-04-25  4318  	struct vm_struct *vm = NULL;
a0309faf1cb062 Kees Cook        2025-04-25  4319  	size_t alloced_size = 0;
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4320  	size_t old_size = 0;
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4321  	void *n;
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4322  
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4323  	if (!size) {
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4324  		vfree(p);
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4325  		return NULL;
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4326  	}
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4327  
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4328  	if (p) {
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4329  		vm = find_vm_area(p);
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4330  		if (unlikely(!vm)) {
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4331  			WARN(1, "Trying to vrealloc() nonexistent vm area (%p)\n", p);
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4332  			return NULL;
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4333  		}
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4334  
a0309faf1cb062 Kees Cook        2025-04-25  4335  		alloced_size = get_vm_area_size(vm);
a0309faf1cb062 Kees Cook        2025-04-25  4336  		old_size = vm->requested_size;
a0309faf1cb062 Kees Cook        2025-04-25  4337  		if (WARN(alloced_size < old_size,
a0309faf1cb062 Kees Cook        2025-04-25  4338  			 "vrealloc() has mismatched area vs requested sizes (%p)\n", p))
a0309faf1cb062 Kees Cook        2025-04-25  4339  			return NULL;
4c5d3365882dbb Vitaly Wool      2025-08-06  4340  		if (WARN(!IS_ALIGNED((unsigned long)p, align),
4c5d3365882dbb Vitaly Wool      2025-08-06  4341  			 "will not reallocate with a bigger alignment (0x%lx)\n", align))
4c5d3365882dbb Vitaly Wool      2025-08-06  4342  			return NULL;
4c5d3365882dbb Vitaly Wool      2025-08-06  4343  		if (unlikely(flags & __GFP_THISNODE) && nid != NUMA_NO_NODE &&
4c5d3365882dbb Vitaly Wool      2025-08-06  4344  			     nid != page_to_nid(vmalloc_to_page(p)))
4c5d3365882dbb Vitaly Wool      2025-08-06  4345  			goto need_realloc;
d57ac904ffdce6 Shivam Kalra     2026-05-19  4346  	} else {
d57ac904ffdce6 Shivam Kalra     2026-05-19  4347  		/*
d57ac904ffdce6 Shivam Kalra     2026-05-19  4348  		 * If p is NULL, vrealloc behaves exactly like vmalloc.
d57ac904ffdce6 Shivam Kalra     2026-05-19  4349  		 * Skip the shrink and in-place grow paths.
d57ac904ffdce6 Shivam Kalra     2026-05-19  4350  		 */
d57ac904ffdce6 Shivam Kalra     2026-05-19  4351  		goto need_realloc;
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4352  	}
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4353  
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4354  	if (size <= old_size) {
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4355  		unsigned int new_nr_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4356  
70d1eb031a68cb Kees Cook        2025-05-15  4357  		/* Zero out "freed" memory, potentially for future realloc. */
70d1eb031a68cb Kees Cook        2025-05-15  4358  		if (want_init_on_free() || want_init_on_alloc(flags))
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4359  			memset((void *)p + size, 0, old_size - size);
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4360  
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4361  		/*
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4362  		 * Free tail pages when shrink crosses a page boundary.
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4363  		 *
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4364  		 * Skip huge page allocations (page_order > 0) as partial
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4365  		 * freeing would require splitting.
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4366  		 *
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4367  		 * Skip VM_FLUSH_RESET_PERMS, as direct-map permissions must
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4368  		 * be reset before pages are returned to the allocator.
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4369  		 *
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4370  		 * Skip VM_USERMAP, as remap_vmalloc_range_partial() validates
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4371  		 * mapping requests against the unchanged vm->size; freeing
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4372  		 * tail pages would cause vmalloc_to_page() to return NULL for
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4373  		 * the unmapped range.
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4374  		 *
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4375  		 * Skip if either GFP_NOFS or GFP_NOIO are used.
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4376  		 * kmemleak_free_part() internally allocates with
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4377  		 * GFP_KERNEL, which could trigger a recursive deadlock
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4378  		 * if we are under filesystem or I/O reclaim.
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4379  		 */
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4380  		if (new_nr_pages < vm->nr_pages && !vm_area_page_order(vm) &&
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4381  		    !(vm->flags & (VM_FLUSH_RESET_PERMS | VM_USERMAP)) &&
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4382  		    gfp_has_io_fs(flags)) {
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4383  			unsigned long addr = (unsigned long)kasan_reset_tag(p);
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4384  			unsigned int old_nr_pages = vm->nr_pages;
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4385  
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4386  			/*
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4387  			 * Use the node lock to synchronize with concurrent
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4388  			 * readers (vmalloc_info_show).
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4389  			 */
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4390  			struct vmap_node *vn = addr_to_node(addr);
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4391  
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4392  			spin_lock(&vn->busy.lock);
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4393  			vm->nr_pages = new_nr_pages;
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4394  			spin_unlock(&vn->busy.lock);
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4395  
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4396  			/* Notify kmemleak of the reduced allocation size before unmapping. */
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4397  			kmemleak_free_part(
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4398  				(void *)addr + ((unsigned long)new_nr_pages
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4399  						<< PAGE_SHIFT),
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4400  				(unsigned long)(old_nr_pages - new_nr_pages)
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4401  					<< PAGE_SHIFT);
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4402  
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4403  			vunmap_range(addr + ((unsigned long)new_nr_pages
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4404  					     << PAGE_SHIFT),
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4405  				     addr + ((unsigned long)old_nr_pages
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4406  					     << PAGE_SHIFT));
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4407  
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4408  			vm_area_free_pages(vm, new_nr_pages, old_nr_pages);
5ea8ec74c57c0c Shivam Kalra     2026-05-19  4409  		}
a0309faf1cb062 Kees Cook        2025-04-25  4410  		vm->requested_size = size;
9b47d4eea3f7c1 Andrey Ryabinin  2026-01-13  4411  		kasan_vrealloc(p, old_size, size);
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4412  		return (void *)p;
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4413  	}
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4414  
a0309faf1cb062 Kees Cook        2025-04-25  4415  	/*
a0309faf1cb062 Kees Cook        2025-04-25  4416  	 * We already have the bytes available in the allocation; use them.
a0309faf1cb062 Kees Cook        2025-04-25  4417  	 */
d57ac904ffdce6 Shivam Kalra     2026-05-19  4418  	if (size <= vm->nr_pages << PAGE_SHIFT) {
70d1eb031a68cb Kees Cook        2025-05-15  4419  		/*
70d1eb031a68cb Kees Cook        2025-05-15  4420  		 * No need to zero memory here, as unused memory will have
70d1eb031a68cb Kees Cook        2025-05-15  4421  		 * already been zeroed at initial allocation time or during
70d1eb031a68cb Kees Cook        2025-05-15  4422  		 * realloc shrink time.
70d1eb031a68cb Kees Cook        2025-05-15  4423  		 */
a0309faf1cb062 Kees Cook        2025-04-25  4424  		vm->requested_size = size;
9b47d4eea3f7c1 Andrey Ryabinin  2026-01-13  4425  		kasan_vrealloc(p, old_size, size);
f7a35a3c36d1e3 Kees Cook        2025-05-15  4426  		return (void *)p;
a0309faf1cb062 Kees Cook        2025-04-25  4427  	}
a0309faf1cb062 Kees Cook        2025-04-25  4428  
9d4dde17d9bbfd deepakraog       2026-07-15  4429  	{
9d4dde17d9bbfd deepakraog       2026-07-15  4430  		unsigned int new_nr_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
9d4dde17d9bbfd deepakraog       2026-07-15  4431  		unsigned int old_nr_pages = vm->nr_pages;
9d4dde17d9bbfd deepakraog       2026-07-15  4432  
9d4dde17d9bbfd deepakraog       2026-07-15  4433  		if (new_nr_pages > old_nr_pages && !vm_area_page_order(vm) &&
9d4dde17d9bbfd deepakraog       2026-07-15  4434  		    !(vm->flags & (VM_FLUSH_RESET_PERMS | VM_USERMAP)) &&
9d4dde17d9bbfd deepakraog       2026-07-15  4435  		    gfp_has_io_fs(flags)) {
9d4dde17d9bbfd deepakraog       2026-07-15  4436  			unsigned int extra = new_nr_pages - old_nr_pages;
9d4dde17d9bbfd deepakraog       2026-07-15  4437  			unsigned long addr = (unsigned long)kasan_reset_tag(p);
9d4dde17d9bbfd deepakraog       2026-07-15  4438  			struct vmap_node *vn = addr_to_node(addr);
9d4dde17d9bbfd deepakraog       2026-07-15  4439  			struct page **pages;
9d4dde17d9bbfd deepakraog       2026-07-15  4440  			int ret;
9d4dde17d9bbfd deepakraog       2026-07-15  4441  
9d4dde17d9bbfd deepakraog       2026-07-15 @4442  			pages = kvmalloc_array(extra, sizeof(struct page *), gfp);
9d4dde17d9bbfd deepakraog       2026-07-15  4443  			if (!pages)
9d4dde17d9bbfd deepakraog       2026-07-15  4444  				goto need_realloc;
9d4dde17d9bbfd deepakraog       2026-07-15  4445  
9d4dde17d9bbfd deepakraog       2026-07-15  4446  			if (vm_area_alloc_pages(vmalloc_gfp_adjust(gfp, 0), nid,
9d4dde17d9bbfd deepakraog       2026-07-15  4447  						0, extra, pages) != extra) {
9d4dde17d9bbfd deepakraog       2026-07-15  4448  				kvfree(pages);
9d4dde17d9bbfd deepakraog       2026-07-15  4449  				goto need_realloc;
9d4dde17d9bbfd deepakraog       2026-07-15  4450  			}
9d4dde17d9bbfd deepakraog       2026-07-15  4451  
9d4dde17d9bbfd deepakraog       2026-07-15  4452  			spin_lock(&vn->busy.lock);
9d4dde17d9bbfd deepakraog       2026-07-15  4453  			ret = vmap_pages_range(addr + ((unsigned long)old_nr_pages
9d4dde17d9bbfd deepakraog       2026-07-15  4454  						       << PAGE_SHIFT),
9d4dde17d9bbfd deepakraog       2026-07-15  4455  					       addr + ((unsigned long)new_nr_pages
9d4dde17d9bbfd deepakraog       2026-07-15  4456  						       << PAGE_SHIFT),
9d4dde17d9bbfd deepakraog       2026-07-15  4457  					       PAGE_KERNEL, pages, PAGE_SHIFT);
9d4dde17d9bbfd deepakraog       2026-07-15  4458  			spin_unlock(&vn->busy.lock);
9d4dde17d9bbfd deepakraog       2026-07-15  4459  			if (ret < 0) {
9d4dde17d9bbfd deepakraog       2026-07-15  4460  				free_pages_bulk(pages, extra);
9d4dde17d9bbfd deepakraog       2026-07-15  4461  				kvfree(pages);
9d4dde17d9bbfd deepakraog       2026-07-15  4462  				goto need_realloc;
9d4dde17d9bbfd deepakraog       2026-07-15  4463  			}
9d4dde17d9bbfd deepakraog       2026-07-15  4464  
9d4dde17d9bbfd deepakraog       2026-07-15  4465  			memcpy(&vm->pages[old_nr_pages], pages,
9d4dde17d9bbfd deepakraog       2026-07-15  4466  			       extra * sizeof(struct page *));
9d4dde17d9bbfd deepakraog       2026-07-15  4467  			kvfree(pages);
9d4dde17d9bbfd deepakraog       2026-07-15  4468  			vm->nr_pages = new_nr_pages;
9d4dde17d9bbfd deepakraog       2026-07-15  4469  			vm->requested_size = size;
9d4dde17d9bbfd deepakraog       2026-07-15  4470  			kasan_vrealloc(p, old_size, size);
9d4dde17d9bbfd deepakraog       2026-07-15  4471  			if (want_init_on_alloc(flags))
9d4dde17d9bbfd deepakraog       2026-07-15  4472  				memset((void *)p + old_size, 0, size - old_size);
9d4dde17d9bbfd deepakraog       2026-07-15  4473  			return (void *)p;
9d4dde17d9bbfd deepakraog       2026-07-15  4474  		}
9d4dde17d9bbfd deepakraog       2026-07-15  4475  	}
9d4dde17d9bbfd deepakraog       2026-07-15  4476  
4c5d3365882dbb Vitaly Wool      2025-08-06  4477  need_realloc:
9d4dde17d9bbfd deepakraog       2026-07-15  4478  	/* Fall back to a fresh vm_area when in-place grow is not possible. */
4c5d3365882dbb Vitaly Wool      2025-08-06  4479  	n = __vmalloc_node_noprof(size, align, flags, nid, __builtin_return_address(0));
4c5d3365882dbb Vitaly Wool      2025-08-06  4480  
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4481  	if (!n)
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4482  		return NULL;
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4483  
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4484  	if (p) {
82d1f01292d3f0 Marco Elver      2026-04-20  4485  		memcpy(n, p, min(size, old_size));
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4486  		vfree(p);
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4487  	}
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4488  
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4489  	return n;
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4490  }
d60769075013ec Alice Ryhl       2026-01-07  4491  EXPORT_SYMBOL(vrealloc_node_align_noprof);
3ddc2fefe6f34e Danilo Krummrich 2024-07-22  4492  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
