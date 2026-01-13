Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EA735C188
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768282710; cv=none; b=ubJFiA5Jmo3YVyO2CqIYaj+yIfij6m7UbhHFuScMPtt4+BJXev+R9NMo1ir9+ViXZ6ZGWRwKI1ERDyrfRcyqA1Ck2OqjVWBZKa7HefPOMrjozqiiAbgHCISehJcMTzkpt/rLfVJG4FtWsJ2til1rdnvm7U/HU8NWyhDJFMsUU9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768282710; c=relaxed/simple;
	bh=SWTcLsmLIxsRLSsGfnEChuO0Yanv/b2gOxxU2LrddKE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ed7RvtkjgdiSeqBp40MwqR9bBFuXzbTafzyE1iny1c84mYydcLZAld0+aInOoJxHR32dPc4QpEwHn1/ISp5p4lI1O2fbHbDYFY/Jv5TsLT72on131rw7mTYtZVettl0pF/EkaOshZ5l4gHf2CkO2kZfs4RXGHeMH6EwHbqPjwyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgjXAZuG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgjXAZuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768282708; x=1799818708;
  h=date:from:to:cc:subject:message-id;
  bh=SWTcLsmLIxsRLSsGfnEChuO0Yanv/b2gOxxU2LrddKE=;
  b=LgjXAZuGWnnSK5OILT7VO9rPN6QGU56r3FULdZLxzFXYhN18WCnBua0B
   C+efNhBDumKwxZskNA3UxVLS0Bwwsrg3yZH1r03GcPXMjSLvNG4aJ5FFg
   vSHytwghOIGbQqJLEk2RlHmqVc+c192dOqS9dRvd9A995Ux/3kG9P/XiD
   iAEhi2d2p2fAb1VAqVz44whT0POJyx07Rc48Vo9Mio2opjYZk/D+OKwok
   15ZIBy0YvenOJ+pJGyDFAKnTG+tAZDehigs0sG3Z1e1PMAh4XuAoy+sQu
   4ZeNHPuC2S/PQCqqSZlEcJrbBpwQ5rjzApza3XUY1oK8UogUx+rpVEsoF
   g==;
X-CSE-ConnectionGUID: zee3BhNVTQKMFPEdsOiTTQ==
X-CSE-MsgGUID: DvJjt+7LQQWYgnCz+C/l8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80282048"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80282048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 21:38:27 -0800
X-CSE-ConnectionGUID: O+Sbc7kqQKiLMAHS0R0MZA==
X-CSE-MsgGUID: qpJMCn1ESQCG3icVfiHgEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203504842"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jan 2026 21:38:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfX6l-00000000EHZ-3qmj;
	Tue, 13 Jan 2026 05:38:23 +0000
Date: Tue, 13 Jan 2026 13:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/filemap.c:3307 do_sync_mmap_readahead() warn: assigning
 (-12) to unsigned variable 'ra->order'
Message-ID: <202601131311.g3lyUAks-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Roman Gushchin <roman.gushchin@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Dev Jain <dev.jain@arm.com>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 9f1edf1aedac1b287355f63f768ba4275de72dca mm: readahead: make thp readahead conditional to mmap_miss logic
date:   8 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-161-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131311.g3lyUAks-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601131311.g3lyUAks-lkp@intel.com/

smatch warnings:
mm/filemap.c:3307 do_sync_mmap_readahead() warn: assigning (-12) to unsigned variable 'ra->order'

vim +3307 mm/filemap.c

6b4c9f4469819a0 Josef Bacik             2019-03-13  3240  
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3241  /*
6b4c9f4469819a0 Josef Bacik             2019-03-13  3242   * Synchronous readahead happens when we don't even find a page in the page
6b4c9f4469819a0 Josef Bacik             2019-03-13  3243   * cache at all.  We don't want to perform IO under the mmap sem, so if we have
6b4c9f4469819a0 Josef Bacik             2019-03-13  3244   * to drop the mmap sem we return the file that was pinned in order for us to do
6b4c9f4469819a0 Josef Bacik             2019-03-13  3245   * that.  If we didn't pin a file then we return NULL.  The file that is
6b4c9f4469819a0 Josef Bacik             2019-03-13  3246   * returned needs to be fput()'ed when we're done with it.
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3247   */
6b4c9f4469819a0 Josef Bacik             2019-03-13  3248  static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3249  {
2a1180f1bd389e9 Josef Bacik             2019-03-13  3250  	struct file *file = vmf->vma->vm_file;
2a1180f1bd389e9 Josef Bacik             2019-03-13  3251  	struct file_ra_state *ra = &file->f_ra;
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3252  	struct address_space *mapping = file->f_mapping;
fcd9ae4f7f3b5fb Matthew Wilcox (Oracle  2021-04-07  3253) 	DEFINE_READAHEAD(ractl, file, ra, mapping, vmf->pgoff);
6b4c9f4469819a0 Josef Bacik             2019-03-13  3254  	struct file *fpin = NULL;
bfbe71109fa40e8 Lorenzo Stoakes         2025-06-18  3255  	vm_flags_t vm_flags = vmf->vma->vm_flags;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3256  	bool force_thp_readahead = false;
f5e8b140cd1324c Ryan Roberts            2025-06-09  3257  	unsigned short mmap_miss;
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3258  
4687fdbb805a92c Matthew Wilcox (Oracle  2021-07-24  3259) 	/* Use the readahead code, even if readahead is disabled */
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3260  	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3261  	    (vm_flags & VM_HUGEPAGE) && HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER)
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3262  		force_thp_readahead = true;
4687fdbb805a92c Matthew Wilcox (Oracle  2021-07-24  3263) 
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3264  	if (!force_thp_readahead) {
38b0ece6d76374b Ryan Roberts            2025-06-09  3265  		/*
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3266  		 * If we don't want any read-ahead, don't bother.
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3267  		 * VM_EXEC case below is already intended for random access.
38b0ece6d76374b Ryan Roberts            2025-06-09  3268  		 */
38b0ece6d76374b Ryan Roberts            2025-06-09  3269  		if ((vm_flags & (VM_RAND_READ | VM_EXEC)) == VM_RAND_READ)
6b4c9f4469819a0 Josef Bacik             2019-03-13  3270  			return fpin;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3271  
275b12bf5486f6f Wu Fengguang            2011-05-24  3272  		if (!ra->ra_pages)
6b4c9f4469819a0 Josef Bacik             2019-03-13  3273  			return fpin;
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3274  
dcfa24ba68991ab Matthew Wilcox (Oracle  2022-05-25  3275) 		if (vm_flags & VM_SEQ_READ) {
6b4c9f4469819a0 Josef Bacik             2019-03-13  3276  			fpin = maybe_unlock_mmap_for_io(vmf, fpin);
fcd9ae4f7f3b5fb Matthew Wilcox (Oracle  2021-04-07  3277) 			page_cache_sync_ra(&ractl, ra->ra_pages);
6b4c9f4469819a0 Josef Bacik             2019-03-13  3278  			return fpin;
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3279  		}
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3280  	}
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3281  
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3282  	if (!(vm_flags & VM_SEQ_READ)) {
207d04baa3591a3 Andi Kleen              2011-05-24  3283  		/* Avoid banging the cache line if not needed */
e630bfac79456d3 Kirill A. Shutemov      2020-08-14  3284  		mmap_miss = READ_ONCE(ra->mmap_miss);
e630bfac79456d3 Kirill A. Shutemov      2020-08-14  3285  		if (mmap_miss < MMAP_LOTSAMISS * 10)
e630bfac79456d3 Kirill A. Shutemov      2020-08-14  3286  			WRITE_ONCE(ra->mmap_miss, ++mmap_miss);
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3287  
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3288  		/*
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3289  		 * Do we miss much more than hit in this file? If so,
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3290  		 * stop bothering with read-ahead. It will only hurt.
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3291  		 */
e630bfac79456d3 Kirill A. Shutemov      2020-08-14  3292  		if (mmap_miss > MMAP_LOTSAMISS)
6b4c9f4469819a0 Josef Bacik             2019-03-13  3293  			return fpin;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3294  	}
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3295  
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3296  	if (force_thp_readahead) {
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3297  		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3298  		ractl._index &= ~((unsigned long)HPAGE_PMD_NR - 1);
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3299  		ra->size = HPAGE_PMD_NR;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3300  		/*
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3301  		 * Fetch two PMD folios, so we get the chance to actually
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3302  		 * readahead, unless we've been told not to.
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3303  		 */
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3304  		if (!(vm_flags & VM_RAND_READ))
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3305  			ra->size *= 2;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3306  		ra->async_size = HPAGE_PMD_NR;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06 @3307  		ra->order = HPAGE_PMD_ORDER;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3308  		page_cache_ra_order(&ractl, ra);
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3309  		return fpin;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3310  	}
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3311  
38b0ece6d76374b Ryan Roberts            2025-06-09  3312  	if (vm_flags & VM_EXEC) {
38b0ece6d76374b Ryan Roberts            2025-06-09  3313  		/*
38b0ece6d76374b Ryan Roberts            2025-06-09  3314  		 * Allow arch to request a preferred minimum folio order for
38b0ece6d76374b Ryan Roberts            2025-06-09  3315  		 * executable memory. This can often be beneficial to
38b0ece6d76374b Ryan Roberts            2025-06-09  3316  		 * performance if (e.g.) arm64 can contpte-map the folio.
38b0ece6d76374b Ryan Roberts            2025-06-09  3317  		 * Executable memory rarely benefits from readahead, due to its
38b0ece6d76374b Ryan Roberts            2025-06-09  3318  		 * random access nature, so set async_size to 0.
38b0ece6d76374b Ryan Roberts            2025-06-09  3319  		 *
38b0ece6d76374b Ryan Roberts            2025-06-09  3320  		 * Limit to the boundaries of the VMA to avoid reading in any
38b0ece6d76374b Ryan Roberts            2025-06-09  3321  		 * pad that might exist between sections, which would be a waste
38b0ece6d76374b Ryan Roberts            2025-06-09  3322  		 * of memory.
38b0ece6d76374b Ryan Roberts            2025-06-09  3323  		 */
38b0ece6d76374b Ryan Roberts            2025-06-09  3324  		struct vm_area_struct *vma = vmf->vma;
38b0ece6d76374b Ryan Roberts            2025-06-09  3325  		unsigned long start = vma->vm_pgoff;
38b0ece6d76374b Ryan Roberts            2025-06-09  3326  		unsigned long end = start + vma_pages(vma);
38b0ece6d76374b Ryan Roberts            2025-06-09  3327  		unsigned long ra_end;
38b0ece6d76374b Ryan Roberts            2025-06-09  3328  
38b0ece6d76374b Ryan Roberts            2025-06-09  3329  		ra->order = exec_folio_order();
38b0ece6d76374b Ryan Roberts            2025-06-09  3330  		ra->start = round_down(vmf->pgoff, 1UL << ra->order);
38b0ece6d76374b Ryan Roberts            2025-06-09  3331  		ra->start = max(ra->start, start);
38b0ece6d76374b Ryan Roberts            2025-06-09  3332  		ra_end = round_up(ra->start + ra->ra_pages, 1UL << ra->order);
38b0ece6d76374b Ryan Roberts            2025-06-09  3333  		ra_end = min(ra_end, end);
38b0ece6d76374b Ryan Roberts            2025-06-09  3334  		ra->size = ra_end - ra->start;
38b0ece6d76374b Ryan Roberts            2025-06-09  3335  		ra->async_size = 0;
38b0ece6d76374b Ryan Roberts            2025-06-09  3336  	} else {
d30a11004e34119 Wu Fengguang            2009-06-16  3337  		/*
d30a11004e34119 Wu Fengguang            2009-06-16  3338  		 * mmap read-around
d30a11004e34119 Wu Fengguang            2009-06-16  3339  		 */
db660d462525c4a David Howells           2020-10-15  3340  		ra->start = max_t(long, 0, vmf->pgoff - ra->ra_pages / 2);
600e19afc5f8a6c Roman Gushchin          2015-11-05  3341  		ra->size = ra->ra_pages;
600e19afc5f8a6c Roman Gushchin          2015-11-05  3342  		ra->async_size = ra->ra_pages / 4;
c4602f9fa77fc6b Ryan Roberts            2025-06-09  3343  		ra->order = 0;
38b0ece6d76374b Ryan Roberts            2025-06-09  3344  	}
38b0ece6d76374b Ryan Roberts            2025-06-09  3345  
38b0ece6d76374b Ryan Roberts            2025-06-09  3346  	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
db660d462525c4a David Howells           2020-10-15  3347  	ractl._index = ra->start;
c4602f9fa77fc6b Ryan Roberts            2025-06-09  3348  	page_cache_ra_order(&ractl, ra);
6b4c9f4469819a0 Josef Bacik             2019-03-13  3349  	return fpin;
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3350  }
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3351  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
