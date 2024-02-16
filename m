Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02B81B949
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Feb 2024 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708074871; cv=none; b=hGiMTIVJ0LHwvBTmVDZ5TWsxAParRv3n1FXv2dqXKjoNm5UBh0h9CKAVEC2tx9iQAB2XCs7nVIM7AlkzhJ1ppMH6o0vHjbgRj3wuKsdD0eGUbqhU44UiVcU243CbO/RGrmJUIqouNc8KcG7pgkxkQOZxsc4xBrXZ7MQ0YnzeJzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708074871; c=relaxed/simple;
	bh=U0DhibRjbTfW6rH0QKSxcrPHfENOO/Kxgu42Nn3PK3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=poBjIZTyBtPGQMzT23B03hT8eZ/DZN3jX07r9XHbXCZRYIWP9UoHbiQObqIaIxM9COxS6q7QLhCkTyTlpT/TZKNILxwn/M05ndldoq0f2tgKokwS9ewy2iDnTqH89nRX//M0tPxmc+wHkC1vOJhJzOhWnM+S3CWOIRNaJb3WgI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wya4E+3c; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wya4E+3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708074869; x=1739610869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U0DhibRjbTfW6rH0QKSxcrPHfENOO/Kxgu42Nn3PK3k=;
  b=Wya4E+3cL1eZtTckgNU/gNfKHq/m7yKMYy27vJClFdc8P0dy3IBw1BF4
   3tlt8ZIJkIX1P/XZ7h1ImyVatCIkAhKb+u3QFYaoV43ktqXuxSPFMzIrd
   faU/p/SG7L2/bofEqCnVgY90cCwZvYLPHkBSWlR2EKDtluaJPLEPztSpE
   SEVW8s2llmJmrGy4ZFG2F3BiIMfhD4Xh250xxP5FkRREAj8Eg9iKkaAj/
   0WmlGBDdtrcdhacOMzlv+T4BZRv3et1ldj/sMXW6qFVEKw+6V2vWDlMwP
   iTVrjc2GbwYnrLiEgRyXejKif5O+0uKbvII5UPmUf0AImnz9JzonY5lqj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2069826"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2069826"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 01:14:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="3809753"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Feb 2024 01:14:26 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rauIZ-00018a-1Q;
	Fri, 16 Feb 2024 09:14:23 +0000
Date: Fri, 16 Feb 2024 17:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 29/35] mm: vmalloc: Enable memory allocation profiling
Message-ID: <202402161725.nlXxu3zP-lkp@intel.com>
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
In-Reply-To: <20240212213922.783301-30-surenb@google.com>
References: <20240212213922.783301-30-surenb@google.com>
TO: Suren Baghdasaryan <surenb@google.com>
TO: akpm@linux-foundation.org
CC: kent.overstreet@linux.dev
CC: mhocko@suse.com
CC: vbabka@suse.cz
CC: hannes@cmpxchg.org
CC: roman.gushchin@linux.dev
CC: mgorman@suse.de
CC: dave@stgolabs.net
CC: willy@infradead.org
CC: liam.howlett@oracle.com
CC: corbet@lwn.net
CC: void@manifault.com
CC: peterz@infradead.org
CC: juri.lelli@redhat.com
CC: catalin.marinas@arm.com
CC: will@kernel.org
CC: arnd@arndb.de
CC: tglx@linutronix.de
CC: mingo@redhat.com
CC: dave.hansen@linux.intel.com
CC: x86@kernel.org
CC: peterx@redhat.com
CC: david@redhat.com
CC: axboe@kernel.dk
CC: mcgrof@kernel.org
CC: masahiroy@kernel.org
CC: nathan@kernel.org
CC: dennis@kernel.org
CC: tj@kernel.org
CC: muchun.song@linux.dev

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on linus/master v6.8-rc4]
[cannot apply to akpm-mm/mm-everything vbabka-slab/for-next next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/lib-string_helpers-Add-flags-param-to-string_get_size/20240213-054335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20240212213922.783301-30-surenb%40google.com
patch subject: [PATCH v3 29/35] mm: vmalloc: Enable memory allocation profiling
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: s390-randconfig-r071-20240213 (https://download.01.org/0day-ci/archive/20240216/202402161725.nlXxu3zP-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project c08b90c50bcac9f3f563c79491c8dbcbe7c3b574)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402161725.nlXxu3zP-lkp@intel.com/

smatch warnings:
mm/vmalloc.c:3334 __vmalloc_node_range_noprof() warn: bitwise AND condition is false here

vim +3334 mm/vmalloc.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  3206  
^1da177e4c3f41 Linus Torvalds          2005-04-16  3207  /**
dec7b284c27a98 Kent Overstreet         2024-02-12  3208   * __vmalloc_node_range_noprof - allocate virtually contiguous memory
^1da177e4c3f41 Linus Torvalds          2005-04-16  3209   * @size:		  allocation size
2dca6999eed58d David Miller            2009-09-21  3210   * @align:		  desired alignment
d0a21265dfb5fa David Rientjes          2011-01-13  3211   * @start:		  vm area range start
d0a21265dfb5fa David Rientjes          2011-01-13  3212   * @end:		  vm area range end
^1da177e4c3f41 Linus Torvalds          2005-04-16  3213   * @gfp_mask:		  flags for the page level allocator
^1da177e4c3f41 Linus Torvalds          2005-04-16  3214   * @prot:		  protection mask for the allocated pages
cb9e3c292d0115 Andrey Ryabinin         2015-02-13  3215   * @vm_flags:		  additional vm area flags (e.g. %VM_NO_GUARD)
00ef2d2f84babb David Rientjes          2013-02-22  3216   * @node:		  node to use for allocation or NUMA_NO_NODE
c85d194bfd2e36 Randy Dunlap            2008-05-01  3217   * @caller:		  caller's return address
^1da177e4c3f41 Linus Torvalds          2005-04-16  3218   *
^1da177e4c3f41 Linus Torvalds          2005-04-16  3219   * Allocate enough pages to cover @size from the page level
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3220   * allocator with @gfp_mask flags. Please note that the full set of gfp
30d3f01191d305 Michal Hocko            2022-01-14  3221   * flags are not supported. GFP_KERNEL, GFP_NOFS and GFP_NOIO are all
30d3f01191d305 Michal Hocko            2022-01-14  3222   * supported.
30d3f01191d305 Michal Hocko            2022-01-14  3223   * Zone modifiers are not supported. From the reclaim modifiers
30d3f01191d305 Michal Hocko            2022-01-14  3224   * __GFP_DIRECT_RECLAIM is required (aka GFP_NOWAIT is not supported)
30d3f01191d305 Michal Hocko            2022-01-14  3225   * and only __GFP_NOFAIL is supported (i.e. __GFP_NORETRY and
30d3f01191d305 Michal Hocko            2022-01-14  3226   * __GFP_RETRY_MAYFAIL are not supported).
30d3f01191d305 Michal Hocko            2022-01-14  3227   *
30d3f01191d305 Michal Hocko            2022-01-14  3228   * __GFP_NOWARN can be used to suppress failures messages.
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3229   *
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3230   * Map them into contiguous kernel virtual space, using a pagetable
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3231   * protection of @prot.
a862f68a8b3600 Mike Rapoport           2019-03-05  3232   *
a862f68a8b3600 Mike Rapoport           2019-03-05  3233   * Return: the address of the area or %NULL on failure
^1da177e4c3f41 Linus Torvalds          2005-04-16  3234   */
dec7b284c27a98 Kent Overstreet         2024-02-12  3235  void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
d0a21265dfb5fa David Rientjes          2011-01-13  3236  			unsigned long start, unsigned long end, gfp_t gfp_mask,
cb9e3c292d0115 Andrey Ryabinin         2015-02-13  3237  			pgprot_t prot, unsigned long vm_flags, int node,
cb9e3c292d0115 Andrey Ryabinin         2015-02-13  3238  			const void *caller)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3239  {
^1da177e4c3f41 Linus Torvalds          2005-04-16  3240  	struct vm_struct *area;
19f1c3acf8f443 Andrey Konovalov        2022-03-24  3241  	void *ret;
f6e39794f4b6da Andrey Konovalov        2022-03-24  3242  	kasan_vmalloc_flags_t kasan_flags = KASAN_VMALLOC_NONE;
89219d37a2377c Catalin Marinas         2009-06-11  3243  	unsigned long real_size = size;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3244  	unsigned long real_align = align;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3245  	unsigned int shift = PAGE_SHIFT;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3246  
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3247  	if (WARN_ON_ONCE(!size))
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3248  		return NULL;
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3249  
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3250  	if ((size >> PAGE_SHIFT) > totalram_pages()) {
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3251  		warn_alloc(gfp_mask, NULL,
f4bdfeaf18a44b Uladzislau Rezki (Sony  2021-06-28  3252) 			"vmalloc error: size %lu, exceeds total pages",
f4bdfeaf18a44b Uladzislau Rezki (Sony  2021-06-28  3253) 			real_size);
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3254  		return NULL;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3255  	}
121e6f3258fe39 Nicholas Piggin         2021-04-29  3256  
559089e0a93d44 Song Liu                2022-04-15  3257  	if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
121e6f3258fe39 Nicholas Piggin         2021-04-29  3258  		unsigned long size_per_node;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3259  
121e6f3258fe39 Nicholas Piggin         2021-04-29  3260  		/*
121e6f3258fe39 Nicholas Piggin         2021-04-29  3261  		 * Try huge pages. Only try for PAGE_KERNEL allocations,
121e6f3258fe39 Nicholas Piggin         2021-04-29  3262  		 * others like modules don't yet expect huge pages in
121e6f3258fe39 Nicholas Piggin         2021-04-29  3263  		 * their allocations due to apply_to_page_range not
121e6f3258fe39 Nicholas Piggin         2021-04-29  3264  		 * supporting them.
121e6f3258fe39 Nicholas Piggin         2021-04-29  3265  		 */
121e6f3258fe39 Nicholas Piggin         2021-04-29  3266  
121e6f3258fe39 Nicholas Piggin         2021-04-29  3267  		size_per_node = size;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3268  		if (node == NUMA_NO_NODE)
121e6f3258fe39 Nicholas Piggin         2021-04-29  3269  			size_per_node /= num_online_nodes();
3382bbee0464bf Christophe Leroy        2021-06-30  3270  		if (arch_vmap_pmd_supported(prot) && size_per_node >= PMD_SIZE)
121e6f3258fe39 Nicholas Piggin         2021-04-29  3271  			shift = PMD_SHIFT;
3382bbee0464bf Christophe Leroy        2021-06-30  3272  		else
3382bbee0464bf Christophe Leroy        2021-06-30  3273  			shift = arch_vmap_pte_supported_shift(size_per_node);
3382bbee0464bf Christophe Leroy        2021-06-30  3274  
121e6f3258fe39 Nicholas Piggin         2021-04-29  3275  		align = max(real_align, 1UL << shift);
121e6f3258fe39 Nicholas Piggin         2021-04-29  3276  		size = ALIGN(real_size, 1UL << shift);
121e6f3258fe39 Nicholas Piggin         2021-04-29  3277  	}
121e6f3258fe39 Nicholas Piggin         2021-04-29  3278  
121e6f3258fe39 Nicholas Piggin         2021-04-29  3279  again:
7ca3027b726be6 Daniel Axtens           2021-06-24  3280  	area = __get_vm_area_node(real_size, align, shift, VM_ALLOC |
7ca3027b726be6 Daniel Axtens           2021-06-24  3281  				  VM_UNINITIALIZED | vm_flags, start, end, node,
7ca3027b726be6 Daniel Axtens           2021-06-24  3282  				  gfp_mask, caller);
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3283  	if (!area) {
9376130c390a76 Michal Hocko            2022-01-14  3284  		bool nofail = gfp_mask & __GFP_NOFAIL;
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3285  		warn_alloc(gfp_mask, NULL,
9376130c390a76 Michal Hocko            2022-01-14  3286  			"vmalloc error: size %lu, vm_struct allocation failed%s",
9376130c390a76 Michal Hocko            2022-01-14  3287  			real_size, (nofail) ? ". Retrying." : "");
9376130c390a76 Michal Hocko            2022-01-14  3288  		if (nofail) {
9376130c390a76 Michal Hocko            2022-01-14  3289  			schedule_timeout_uninterruptible(1);
9376130c390a76 Michal Hocko            2022-01-14  3290  			goto again;
9376130c390a76 Michal Hocko            2022-01-14  3291  		}
de7d2b567d040e Joe Perches             2011-10-31  3292  		goto fail;
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3293  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  3294  
f6e39794f4b6da Andrey Konovalov        2022-03-24  3295  	/*
f6e39794f4b6da Andrey Konovalov        2022-03-24  3296  	 * Prepare arguments for __vmalloc_area_node() and
f6e39794f4b6da Andrey Konovalov        2022-03-24  3297  	 * kasan_unpoison_vmalloc().
f6e39794f4b6da Andrey Konovalov        2022-03-24  3298  	 */
f6e39794f4b6da Andrey Konovalov        2022-03-24  3299  	if (pgprot_val(prot) == pgprot_val(PAGE_KERNEL)) {
f6e39794f4b6da Andrey Konovalov        2022-03-24  3300  		if (kasan_hw_tags_enabled()) {
01d92c7f358ce8 Andrey Konovalov        2022-03-24  3301  			/*
01d92c7f358ce8 Andrey Konovalov        2022-03-24  3302  			 * Modify protection bits to allow tagging.
f6e39794f4b6da Andrey Konovalov        2022-03-24  3303  			 * This must be done before mapping.
01d92c7f358ce8 Andrey Konovalov        2022-03-24  3304  			 */
01d92c7f358ce8 Andrey Konovalov        2022-03-24  3305  			prot = arch_vmap_pgprot_tagged(prot);
01d92c7f358ce8 Andrey Konovalov        2022-03-24  3306  
23689e91fb22c1 Andrey Konovalov        2022-03-24  3307  			/*
f6e39794f4b6da Andrey Konovalov        2022-03-24  3308  			 * Skip page_alloc poisoning and zeroing for physical
f6e39794f4b6da Andrey Konovalov        2022-03-24  3309  			 * pages backing VM_ALLOC mapping. Memory is instead
f6e39794f4b6da Andrey Konovalov        2022-03-24  3310  			 * poisoned and zeroed by kasan_unpoison_vmalloc().
23689e91fb22c1 Andrey Konovalov        2022-03-24  3311  			 */
0a54864f8dfb64 Peter Collingbourne     2023-03-09  3312  			gfp_mask |= __GFP_SKIP_KASAN | __GFP_SKIP_ZERO;
23689e91fb22c1 Andrey Konovalov        2022-03-24  3313  		}
23689e91fb22c1 Andrey Konovalov        2022-03-24  3314  
f6e39794f4b6da Andrey Konovalov        2022-03-24  3315  		/* Take note that the mapping is PAGE_KERNEL. */
f6e39794f4b6da Andrey Konovalov        2022-03-24  3316  		kasan_flags |= KASAN_VMALLOC_PROT_NORMAL;
f6e39794f4b6da Andrey Konovalov        2022-03-24  3317  	}
f6e39794f4b6da Andrey Konovalov        2022-03-24  3318  
01d92c7f358ce8 Andrey Konovalov        2022-03-24  3319  	/* Allocate physical pages and map them into vmalloc space. */
19f1c3acf8f443 Andrey Konovalov        2022-03-24  3320  	ret = __vmalloc_area_node(area, gfp_mask, prot, shift, node);
19f1c3acf8f443 Andrey Konovalov        2022-03-24  3321  	if (!ret)
121e6f3258fe39 Nicholas Piggin         2021-04-29  3322  		goto fail;
89219d37a2377c Catalin Marinas         2009-06-11  3323  
23689e91fb22c1 Andrey Konovalov        2022-03-24  3324  	/*
23689e91fb22c1 Andrey Konovalov        2022-03-24  3325  	 * Mark the pages as accessible, now that they are mapped.
6c2f761dad7851 Andrey Konovalov        2022-06-09  3326  	 * The condition for setting KASAN_VMALLOC_INIT should complement the
6c2f761dad7851 Andrey Konovalov        2022-06-09  3327  	 * one in post_alloc_hook() with regards to the __GFP_SKIP_ZERO check
6c2f761dad7851 Andrey Konovalov        2022-06-09  3328  	 * to make sure that memory is initialized under the same conditions.
f6e39794f4b6da Andrey Konovalov        2022-03-24  3329  	 * Tag-based KASAN modes only assign tags to normal non-executable
f6e39794f4b6da Andrey Konovalov        2022-03-24  3330  	 * allocations, see __kasan_unpoison_vmalloc().
23689e91fb22c1 Andrey Konovalov        2022-03-24  3331  	 */
f6e39794f4b6da Andrey Konovalov        2022-03-24  3332  	kasan_flags |= KASAN_VMALLOC_VM_ALLOC;
6c2f761dad7851 Andrey Konovalov        2022-06-09  3333  	if (!want_init_on_free() && want_init_on_alloc(gfp_mask) &&
6c2f761dad7851 Andrey Konovalov        2022-06-09 @3334  	    (gfp_mask & __GFP_SKIP_ZERO))
23689e91fb22c1 Andrey Konovalov        2022-03-24  3335  		kasan_flags |= KASAN_VMALLOC_INIT;
f6e39794f4b6da Andrey Konovalov        2022-03-24  3336  	/* KASAN_VMALLOC_PROT_NORMAL already set if required. */
23689e91fb22c1 Andrey Konovalov        2022-03-24  3337  	area->addr = kasan_unpoison_vmalloc(area->addr, real_size, kasan_flags);
19f1c3acf8f443 Andrey Konovalov        2022-03-24  3338  
f5252e009d5b87 Mitsuo Hayasaka         2011-10-31  3339  	/*
20fc02b477c526 Zhang Yanfei            2013-07-08  3340  	 * In this function, newly allocated vm_struct has VM_UNINITIALIZED
20fc02b477c526 Zhang Yanfei            2013-07-08  3341  	 * flag. It means that vm_struct is not fully initialized.
4341fa454796b8 Joonsoo Kim             2013-04-29  3342  	 * Now, it is fully initialized, so remove this flag here.
f5252e009d5b87 Mitsuo Hayasaka         2011-10-31  3343  	 */
20fc02b477c526 Zhang Yanfei            2013-07-08  3344  	clear_vm_uninitialized_flag(area);
f5252e009d5b87 Mitsuo Hayasaka         2011-10-31  3345  
7ca3027b726be6 Daniel Axtens           2021-06-24  3346  	size = PAGE_ALIGN(size);
60115fa54ad7b9 Kefeng Wang             2022-01-14  3347  	if (!(vm_flags & VM_DEFER_KMEMLEAK))
94f4a1618b4c2b Catalin Marinas         2017-07-06  3348  		kmemleak_vmalloc(area, size, gfp_mask);
89219d37a2377c Catalin Marinas         2009-06-11  3349  
19f1c3acf8f443 Andrey Konovalov        2022-03-24  3350  	return area->addr;
de7d2b567d040e Joe Perches             2011-10-31  3351  
de7d2b567d040e Joe Perches             2011-10-31  3352  fail:
121e6f3258fe39 Nicholas Piggin         2021-04-29  3353  	if (shift > PAGE_SHIFT) {
121e6f3258fe39 Nicholas Piggin         2021-04-29  3354  		shift = PAGE_SHIFT;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3355  		align = real_align;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3356  		size = real_size;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3357  		goto again;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3358  	}
121e6f3258fe39 Nicholas Piggin         2021-04-29  3359  
de7d2b567d040e Joe Perches             2011-10-31  3360  	return NULL;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3361  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  3362  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
