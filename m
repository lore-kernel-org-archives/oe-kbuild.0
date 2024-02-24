Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B72F4317B
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Feb 2024 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708787354; cv=none; b=swKygRf6q1CGxyEoXQ6V+0MVLve0ozQNKx5HiUwO2rJ4HbimuBLJsW89h14vCoOIH2gF+KEln2Xup8du3TTi9Wq3NK9YxyH+dMM5nFz1ibfV1tt1tYFw9po1D7cEPUrvyCcxX9P3mLNBV8NjXbBbZOCTd9AwyAju2mvjUu5ubWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708787354; c=relaxed/simple;
	bh=WoUaii8eOu1sY3+hpbJpRQ0d7QxfFMcyszGgLYaeZqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FWawRFAzoUDf6nR7nl2jHeCcs88XNQozjsvACKgBk4gMG6ePqJtYN5PZeVC4zXKcNPoCnOBRUUjJGBmS3kvzM4izkAdK05LkkgE2NKucjnoRoEg++fT0lc6dkKZx+/K/cw1as+znEqu7MVyv59c00QVl7VIrlOFJZNKSwVFkrLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6gL8237; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6gL8237"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708787351; x=1740323351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WoUaii8eOu1sY3+hpbJpRQ0d7QxfFMcyszGgLYaeZqA=;
  b=b6gL8237HDb1rhMd+8U6R2koRp9erI96C/vCEnlmK/RhlqAi2t7wlUOW
   4HK348kzsivR92rqqLHjgp/WPsH2u+E4cx4MZmyF9YZ5HDm06GdaPnK8l
   FFduf9CFMP8kkdVgXZMmcgKca+S+U4ReSOSVBh5HqyK5hV4FP8EEQgZkk
   tZLLG87VXrZXVHX1tbO3f2ytLJ0dBnMUskqjHv3QatdCGiR/EXkKzRwle
   6fUpbOP4wMgGbDVtgpclDHv5ZZvYLFJsLWq/xooVtQzab9xym/AIfZ0rd
   FMlX9nqo87VvbmNmBOCAIKX/qzO86DQiDG/VTikg1zc7Xj9lq1ZLDo7Qb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3027188"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="3027188"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 07:09:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="10890933"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Feb 2024 07:09:08 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdteD-0008dA-1A;
	Sat, 24 Feb 2024 15:09:05 +0000
Date: Sat, 24 Feb 2024 23:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6161/8260] drivers/md/dm-vdo/memory-alloc.c:232
 vdo_allocate_memory() warn: Please consider using kzalloc instead of kmalloc
Message-ID: <202402242335.7MGLPuV6-lkp@intel.com>
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
TO: Mike Snitzer <snitzer@kernel.org>

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33e1d31873f87d119e5120b88cd350efa68ef276
commit: 65ddf6fc8d888bfcc1e2d79f6880d2a22b9ca1a8 [6161/8260] dm vdo memory-alloc: change from uds_ to vdo_ namespace
:::::: branch date: 34 hours ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-161-20240224 (https://download.01.org/0day-ci/archive/20240224/202402242335.7MGLPuV6-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402242335.7MGLPuV6-lkp@intel.com/

New smatch warnings:
drivers/md/dm-vdo/memory-alloc.c:232 vdo_allocate_memory() warn: Please consider using kzalloc instead of kmalloc
drivers/md/dm-vdo/memory-alloc.c:307 vdo_allocate_memory_nowait() warn: Please consider using kzalloc instead of kmalloc

Old smatch warnings:
drivers/md/dm-vdo/memory-alloc.c:240 vdo_allocate_memory() warn: Please consider using kzalloc instead of kmalloc

vim +232 drivers/md/dm-vdo/memory-alloc.c

ac2603637b5f9c Matthew Sakai 2023-11-16  187  
ac2603637b5f9c Matthew Sakai 2023-11-16  188  /*
ac2603637b5f9c Matthew Sakai 2023-11-16  189   * Allocate storage based on memory size and alignment, logging an error if the allocation fails.
ac2603637b5f9c Matthew Sakai 2023-11-16  190   * The memory will be zeroed.
ac2603637b5f9c Matthew Sakai 2023-11-16  191   *
ac2603637b5f9c Matthew Sakai 2023-11-16  192   * @size: The size of an object
ac2603637b5f9c Matthew Sakai 2023-11-16  193   * @align: The required alignment
ac2603637b5f9c Matthew Sakai 2023-11-16  194   * @what: What is being allocated (for error logging)
ac2603637b5f9c Matthew Sakai 2023-11-16  195   * @ptr: A pointer to hold the allocated memory
ac2603637b5f9c Matthew Sakai 2023-11-16  196   *
ac2603637b5f9c Matthew Sakai 2023-11-16  197   * Return: UDS_SUCCESS or an error code
ac2603637b5f9c Matthew Sakai 2023-11-16  198   */
65ddf6fc8d888b Mike Snitzer  2024-02-13  199  int vdo_allocate_memory(size_t size, size_t align, const char *what, void *ptr)
ac2603637b5f9c Matthew Sakai 2023-11-16  200  {
ac2603637b5f9c Matthew Sakai 2023-11-16  201  	/*
ac2603637b5f9c Matthew Sakai 2023-11-16  202  	 * The __GFP_RETRY_MAYFAIL flag means the VM implementation will retry memory reclaim
ac2603637b5f9c Matthew Sakai 2023-11-16  203  	 * procedures that have previously failed if there is some indication that progress has
ac2603637b5f9c Matthew Sakai 2023-11-16  204  	 * been made elsewhere. It can wait for other tasks to attempt high level approaches to
ac2603637b5f9c Matthew Sakai 2023-11-16  205  	 * freeing memory such as compaction (which removes fragmentation) and page-out. There is
ac2603637b5f9c Matthew Sakai 2023-11-16  206  	 * still a definite limit to the number of retries, but it is a larger limit than with
ac2603637b5f9c Matthew Sakai 2023-11-16  207  	 * __GFP_NORETRY. Allocations with this flag may fail, but only when there is genuinely
ac2603637b5f9c Matthew Sakai 2023-11-16  208  	 * little unused memory. While these allocations do not directly trigger the OOM killer,
ac2603637b5f9c Matthew Sakai 2023-11-16  209  	 * their failure indicates that the system is likely to need to use the OOM killer soon.
ac2603637b5f9c Matthew Sakai 2023-11-16  210  	 * The caller must handle failure, but can reasonably do so by failing a higher-level
ac2603637b5f9c Matthew Sakai 2023-11-16  211  	 * request, or completing it only in a much less efficient manner.
ac2603637b5f9c Matthew Sakai 2023-11-16  212  	 */
ac2603637b5f9c Matthew Sakai 2023-11-16  213  	const gfp_t gfp_flags = GFP_KERNEL | __GFP_ZERO | __GFP_RETRY_MAYFAIL;
ac2603637b5f9c Matthew Sakai 2023-11-16  214  	unsigned int noio_flags;
ac2603637b5f9c Matthew Sakai 2023-11-16  215  	bool allocations_restricted = !allocations_allowed();
ac2603637b5f9c Matthew Sakai 2023-11-16  216  	unsigned long start_time;
ac2603637b5f9c Matthew Sakai 2023-11-16  217  	void *p = NULL;
ac2603637b5f9c Matthew Sakai 2023-11-16  218  
ac2603637b5f9c Matthew Sakai 2023-11-16  219  	if (ptr == NULL)
ac2603637b5f9c Matthew Sakai 2023-11-16  220  		return UDS_INVALID_ARGUMENT;
ac2603637b5f9c Matthew Sakai 2023-11-16  221  
ac2603637b5f9c Matthew Sakai 2023-11-16  222  	if (size == 0) {
ac2603637b5f9c Matthew Sakai 2023-11-16  223  		*((void **) ptr) = NULL;
ac2603637b5f9c Matthew Sakai 2023-11-16  224  		return UDS_SUCCESS;
ac2603637b5f9c Matthew Sakai 2023-11-16  225  	}
ac2603637b5f9c Matthew Sakai 2023-11-16  226  
ac2603637b5f9c Matthew Sakai 2023-11-16  227  	if (allocations_restricted)
ac2603637b5f9c Matthew Sakai 2023-11-16  228  		noio_flags = memalloc_noio_save();
ac2603637b5f9c Matthew Sakai 2023-11-16  229  
ac2603637b5f9c Matthew Sakai 2023-11-16  230  	start_time = jiffies;
ac2603637b5f9c Matthew Sakai 2023-11-16  231  	if (use_kmalloc(size) && (align < PAGE_SIZE)) {
ac2603637b5f9c Matthew Sakai 2023-11-16 @232  		p = kmalloc(size, gfp_flags | __GFP_NOWARN);
ac2603637b5f9c Matthew Sakai 2023-11-16  233  		if (p == NULL) {
ac2603637b5f9c Matthew Sakai 2023-11-16  234  			/*
ac2603637b5f9c Matthew Sakai 2023-11-16  235  			 * It is possible for kmalloc to fail to allocate memory because there is
ac2603637b5f9c Matthew Sakai 2023-11-16  236  			 * no page available (see VDO-3688). A short sleep may allow the page
ac2603637b5f9c Matthew Sakai 2023-11-16  237  			 * reclaimer to free a page.
ac2603637b5f9c Matthew Sakai 2023-11-16  238  			 */
ac2603637b5f9c Matthew Sakai 2023-11-16  239  			fsleep(1000);
ac2603637b5f9c Matthew Sakai 2023-11-16  240  			p = kmalloc(size, gfp_flags);
ac2603637b5f9c Matthew Sakai 2023-11-16  241  		}
ac2603637b5f9c Matthew Sakai 2023-11-16  242  
ac2603637b5f9c Matthew Sakai 2023-11-16  243  		if (p != NULL)
ac2603637b5f9c Matthew Sakai 2023-11-16  244  			add_kmalloc_block(ksize(p));
ac2603637b5f9c Matthew Sakai 2023-11-16  245  	} else {
ac2603637b5f9c Matthew Sakai 2023-11-16  246  		struct vmalloc_block_info *block;
ac2603637b5f9c Matthew Sakai 2023-11-16  247  
65ddf6fc8d888b Mike Snitzer  2024-02-13  248  		if (vdo_allocate(1, struct vmalloc_block_info, __func__, &block) == UDS_SUCCESS) {
ac2603637b5f9c Matthew Sakai 2023-11-16  249  			/*
ac2603637b5f9c Matthew Sakai 2023-11-16  250  			 * It is possible for __vmalloc to fail to allocate memory because there
ac2603637b5f9c Matthew Sakai 2023-11-16  251  			 * are no pages available (see VDO-3661). A short sleep may allow the page
ac2603637b5f9c Matthew Sakai 2023-11-16  252  			 * reclaimer to free enough pages for a small allocation.
ac2603637b5f9c Matthew Sakai 2023-11-16  253  			 *
ac2603637b5f9c Matthew Sakai 2023-11-16  254  			 * For larger allocations, the page_alloc code is racing against the page
ac2603637b5f9c Matthew Sakai 2023-11-16  255  			 * reclaimer. If the page reclaimer can stay ahead of page_alloc, the
ac2603637b5f9c Matthew Sakai 2023-11-16  256  			 * __vmalloc will succeed. But if page_alloc overtakes the page reclaimer,
ac2603637b5f9c Matthew Sakai 2023-11-16  257  			 * the allocation fails. It is possible that more retries will succeed.
ac2603637b5f9c Matthew Sakai 2023-11-16  258  			 */
ac2603637b5f9c Matthew Sakai 2023-11-16  259  			for (;;) {
ac2603637b5f9c Matthew Sakai 2023-11-16  260  				p = __vmalloc(size, gfp_flags | __GFP_NOWARN);
ac2603637b5f9c Matthew Sakai 2023-11-16  261  				if (p != NULL)
ac2603637b5f9c Matthew Sakai 2023-11-16  262  					break;
ac2603637b5f9c Matthew Sakai 2023-11-16  263  
ac2603637b5f9c Matthew Sakai 2023-11-16  264  				if (jiffies_to_msecs(jiffies - start_time) > 1000) {
ac2603637b5f9c Matthew Sakai 2023-11-16  265  					/* Try one more time, logging a failure for this call. */
ac2603637b5f9c Matthew Sakai 2023-11-16  266  					p = __vmalloc(size, gfp_flags);
ac2603637b5f9c Matthew Sakai 2023-11-16  267  					break;
ac2603637b5f9c Matthew Sakai 2023-11-16  268  				}
ac2603637b5f9c Matthew Sakai 2023-11-16  269  
ac2603637b5f9c Matthew Sakai 2023-11-16  270  				fsleep(1000);
ac2603637b5f9c Matthew Sakai 2023-11-16  271  			}
ac2603637b5f9c Matthew Sakai 2023-11-16  272  
ac2603637b5f9c Matthew Sakai 2023-11-16  273  			if (p == NULL) {
65ddf6fc8d888b Mike Snitzer  2024-02-13  274  				vdo_free(block);
ac2603637b5f9c Matthew Sakai 2023-11-16  275  			} else {
ac2603637b5f9c Matthew Sakai 2023-11-16  276  				block->ptr = p;
ac2603637b5f9c Matthew Sakai 2023-11-16  277  				block->size = PAGE_ALIGN(size);
ac2603637b5f9c Matthew Sakai 2023-11-16  278  				add_vmalloc_block(block);
ac2603637b5f9c Matthew Sakai 2023-11-16  279  			}
ac2603637b5f9c Matthew Sakai 2023-11-16  280  		}
ac2603637b5f9c Matthew Sakai 2023-11-16  281  	}
ac2603637b5f9c Matthew Sakai 2023-11-16  282  
ac2603637b5f9c Matthew Sakai 2023-11-16  283  	if (allocations_restricted)
ac2603637b5f9c Matthew Sakai 2023-11-16  284  		memalloc_noio_restore(noio_flags);
ac2603637b5f9c Matthew Sakai 2023-11-16  285  
ac2603637b5f9c Matthew Sakai 2023-11-16  286  	if (unlikely(p == NULL)) {
ac2603637b5f9c Matthew Sakai 2023-11-16  287  		uds_log_error("Could not allocate %zu bytes for %s in %u msecs",
ac2603637b5f9c Matthew Sakai 2023-11-16  288  			      size, what, jiffies_to_msecs(jiffies - start_time));
ac2603637b5f9c Matthew Sakai 2023-11-16  289  		return -ENOMEM;
ac2603637b5f9c Matthew Sakai 2023-11-16  290  	}
ac2603637b5f9c Matthew Sakai 2023-11-16  291  
ac2603637b5f9c Matthew Sakai 2023-11-16  292  	*((void **) ptr) = p;
ac2603637b5f9c Matthew Sakai 2023-11-16  293  	return UDS_SUCCESS;
ac2603637b5f9c Matthew Sakai 2023-11-16  294  }
ac2603637b5f9c Matthew Sakai 2023-11-16  295  
ac2603637b5f9c Matthew Sakai 2023-11-16  296  /*
ac2603637b5f9c Matthew Sakai 2023-11-16  297   * Allocate storage based on memory size, failing immediately if the required memory is not
ac2603637b5f9c Matthew Sakai 2023-11-16  298   * available. The memory will be zeroed.
ac2603637b5f9c Matthew Sakai 2023-11-16  299   *
ac2603637b5f9c Matthew Sakai 2023-11-16  300   * @size: The size of an object.
ac2603637b5f9c Matthew Sakai 2023-11-16  301   * @what: What is being allocated (for error logging)
ac2603637b5f9c Matthew Sakai 2023-11-16  302   *
ac2603637b5f9c Matthew Sakai 2023-11-16  303   * Return: pointer to the allocated memory, or NULL if the required space is not available.
ac2603637b5f9c Matthew Sakai 2023-11-16  304   */
65ddf6fc8d888b Mike Snitzer  2024-02-13  305  void *vdo_allocate_memory_nowait(size_t size, const char *what __maybe_unused)
ac2603637b5f9c Matthew Sakai 2023-11-16  306  {
ac2603637b5f9c Matthew Sakai 2023-11-16 @307  	void *p = kmalloc(size, GFP_NOWAIT | __GFP_ZERO);
ac2603637b5f9c Matthew Sakai 2023-11-16  308  
ac2603637b5f9c Matthew Sakai 2023-11-16  309  	if (p != NULL)
ac2603637b5f9c Matthew Sakai 2023-11-16  310  		add_kmalloc_block(ksize(p));
ac2603637b5f9c Matthew Sakai 2023-11-16  311  
ac2603637b5f9c Matthew Sakai 2023-11-16  312  	return p;
ac2603637b5f9c Matthew Sakai 2023-11-16  313  }
ac2603637b5f9c Matthew Sakai 2023-11-16  314  

:::::: The code at line 232 was first introduced by commit
:::::: ac2603637b5f9ca6da12fc1cbb0236d6fb956851 dm vdo: add memory allocation utilities

:::::: TO: Matthew Sakai <msakai@redhat.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
