Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B40285072
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 10:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777545020; cv=none; b=KBzVoyN/yy1mq3Tf86sCno51gD8LH2C5cL3l8j5mvZvj/UN3j7ZdIYcEo4aFPk1s/1cPlKgHFFJc9BFHwXZRe4+PTN8Bp0+uEEkBYTPYTpryY6BJL7W9X15P8HDeqh4aUWVY+9BE/0UYfLku4iIWqRfdAFtkjloCE+utlN2PMTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777545020; c=relaxed/simple;
	bh=kO4zfIqsKo5wVcdX2fZ/pcyxIg0VsD2FjA6yNAUj93o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uLY5IkNBODwADNHA7OS2p24S4jMLCpKVrGnwiIlf2+otFXmXxsuX8HSJjWBgPiw003db2bacMscZCuPfwsF+V6edotCKrVW2S9mk9DgegQfuk2Dp2T6FIopfl6oAWo1E4XD/c3kmgm1t+xXFow8HjSew6Maw/icWtIHytjsVqcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fa0yb9uE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fa0yb9uE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777545018; x=1809081018;
  h=date:from:to:cc:subject:message-id;
  bh=kO4zfIqsKo5wVcdX2fZ/pcyxIg0VsD2FjA6yNAUj93o=;
  b=Fa0yb9uE7qnDMTAEtYUpayRtbuFL1HvWFqHZyh4hoH+A+q36fKnyp1OR
   652wGaUUDrg4ksdINpAqb/Scx/JeED/JsnGyS3ezFQQCJPYBTSsOE+DXC
   485lDvbSOXQcWBUDx/XMBSVrG45oUD6UrmaVb+a6+Ja9POdY28VZNjj2U
   j3T8YpdTYKt5hMBOj5dfdZCqCkjWVdE5sYy2z7l5R60e0xFIiYobr5ihT
   WDgoocUbHwPBzy7aYsZy6as2x+ldknFWk6USzxPbkfNpQ2HWhDYfowSoL
   o9sm+YpzjfZXqb4S5J4rUkhlEgNFdsCa2+FRPThQ5odOq1lZyBS0sF61P
   A==;
X-CSE-ConnectionGUID: qeTHUS5ISbGpd5JjvLmAkg==
X-CSE-MsgGUID: 9FS0t9yrQP+T0vgmYV9zJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77655525"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="77655525"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 03:30:17 -0700
X-CSE-ConnectionGUID: kLa36jMVRfG/aenY4lKC6g==
X-CSE-MsgGUID: mqNLS8PmQNSstOaRSxHrpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="236326247"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Apr 2026 03:30:16 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIOer-00000000CI1-1q0M;
	Thu, 30 Apr 2026 10:30:13 +0000
Date: Thu, 30 Apr 2026 18:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/filemap.c:3307 do_sync_mmap_readahead() warn: assigning
 (-12) to unsigned variable 'ra->order'
Message-ID: <202604301835.53ka1vYo-lkp@intel.com>
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
head:   e75a43c7cec459a07d91ed17de4de13ede2b7758
commit: 9f1edf1aedac1b287355f63f768ba4275de72dca mm: readahead: make thp readahead conditional to mmap_miss logic
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-r073-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301835.53ka1vYo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9f1edf1aedac ("mm: readahead: make thp readahead conditional to mmap_miss logic")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604301835.53ka1vYo-lkp@intel.com/

smatch warnings:
mm/filemap.c:3307 do_sync_mmap_readahead() warn: assigning (-12) to unsigned variable 'ra->order'

vim +3307 mm/filemap.c

6b4c9f4469819a Josef Bacik             2019-03-13  3240  
ef00e08e26dd5d Linus Torvalds          2009-06-16  3241  /*
6b4c9f4469819a Josef Bacik             2019-03-13  3242   * Synchronous readahead happens when we don't even find a page in the page
6b4c9f4469819a Josef Bacik             2019-03-13  3243   * cache at all.  We don't want to perform IO under the mmap sem, so if we have
6b4c9f4469819a Josef Bacik             2019-03-13  3244   * to drop the mmap sem we return the file that was pinned in order for us to do
6b4c9f4469819a Josef Bacik             2019-03-13  3245   * that.  If we didn't pin a file then we return NULL.  The file that is
6b4c9f4469819a Josef Bacik             2019-03-13  3246   * returned needs to be fput()'ed when we're done with it.
ef00e08e26dd5d Linus Torvalds          2009-06-16  3247   */
6b4c9f4469819a Josef Bacik             2019-03-13  3248  static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
ef00e08e26dd5d Linus Torvalds          2009-06-16  3249  {
2a1180f1bd389e Josef Bacik             2019-03-13  3250  	struct file *file = vmf->vma->vm_file;
2a1180f1bd389e Josef Bacik             2019-03-13  3251  	struct file_ra_state *ra = &file->f_ra;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3252  	struct address_space *mapping = file->f_mapping;
fcd9ae4f7f3b5f Matthew Wilcox (Oracle  2021-04-07  3253) 	DEFINE_READAHEAD(ractl, file, ra, mapping, vmf->pgoff);
6b4c9f4469819a Josef Bacik             2019-03-13  3254  	struct file *fpin = NULL;
bfbe71109fa40e Lorenzo Stoakes         2025-06-18  3255  	vm_flags_t vm_flags = vmf->vma->vm_flags;
9f1edf1aedac1b Roman Gushchin          2025-10-06  3256  	bool force_thp_readahead = false;
f5e8b140cd1324 Ryan Roberts            2025-06-09  3257  	unsigned short mmap_miss;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3258  
4687fdbb805a92 Matthew Wilcox (Oracle  2021-07-24  3259) 	/* Use the readahead code, even if readahead is disabled */
9f1edf1aedac1b Roman Gushchin          2025-10-06  3260  	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
9f1edf1aedac1b Roman Gushchin          2025-10-06  3261  	    (vm_flags & VM_HUGEPAGE) && HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER)
9f1edf1aedac1b Roman Gushchin          2025-10-06  3262  		force_thp_readahead = true;
4687fdbb805a92 Matthew Wilcox (Oracle  2021-07-24  3263) 
9f1edf1aedac1b Roman Gushchin          2025-10-06  3264  	if (!force_thp_readahead) {
38b0ece6d76374 Ryan Roberts            2025-06-09  3265  		/*
9f1edf1aedac1b Roman Gushchin          2025-10-06  3266  		 * If we don't want any read-ahead, don't bother.
9f1edf1aedac1b Roman Gushchin          2025-10-06  3267  		 * VM_EXEC case below is already intended for random access.
38b0ece6d76374 Ryan Roberts            2025-06-09  3268  		 */
38b0ece6d76374 Ryan Roberts            2025-06-09  3269  		if ((vm_flags & (VM_RAND_READ | VM_EXEC)) == VM_RAND_READ)
6b4c9f4469819a Josef Bacik             2019-03-13  3270  			return fpin;
9f1edf1aedac1b Roman Gushchin          2025-10-06  3271  
275b12bf5486f6 Wu Fengguang            2011-05-24  3272  		if (!ra->ra_pages)
6b4c9f4469819a Josef Bacik             2019-03-13  3273  			return fpin;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3274  
dcfa24ba68991a Matthew Wilcox (Oracle  2022-05-25  3275) 		if (vm_flags & VM_SEQ_READ) {
6b4c9f4469819a Josef Bacik             2019-03-13  3276  			fpin = maybe_unlock_mmap_for_io(vmf, fpin);
fcd9ae4f7f3b5f Matthew Wilcox (Oracle  2021-04-07  3277) 			page_cache_sync_ra(&ractl, ra->ra_pages);
6b4c9f4469819a Josef Bacik             2019-03-13  3278  			return fpin;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3279  		}
9f1edf1aedac1b Roman Gushchin          2025-10-06  3280  	}
ef00e08e26dd5d Linus Torvalds          2009-06-16  3281  
9f1edf1aedac1b Roman Gushchin          2025-10-06  3282  	if (!(vm_flags & VM_SEQ_READ)) {
207d04baa3591a Andi Kleen              2011-05-24  3283  		/* Avoid banging the cache line if not needed */
e630bfac79456d Kirill A. Shutemov      2020-08-14  3284  		mmap_miss = READ_ONCE(ra->mmap_miss);
e630bfac79456d Kirill A. Shutemov      2020-08-14  3285  		if (mmap_miss < MMAP_LOTSAMISS * 10)
e630bfac79456d Kirill A. Shutemov      2020-08-14  3286  			WRITE_ONCE(ra->mmap_miss, ++mmap_miss);
ef00e08e26dd5d Linus Torvalds          2009-06-16  3287  
ef00e08e26dd5d Linus Torvalds          2009-06-16  3288  		/*
ef00e08e26dd5d Linus Torvalds          2009-06-16  3289  		 * Do we miss much more than hit in this file? If so,
ef00e08e26dd5d Linus Torvalds          2009-06-16  3290  		 * stop bothering with read-ahead. It will only hurt.
ef00e08e26dd5d Linus Torvalds          2009-06-16  3291  		 */
e630bfac79456d Kirill A. Shutemov      2020-08-14  3292  		if (mmap_miss > MMAP_LOTSAMISS)
6b4c9f4469819a Josef Bacik             2019-03-13  3293  			return fpin;
9f1edf1aedac1b Roman Gushchin          2025-10-06  3294  	}
9f1edf1aedac1b Roman Gushchin          2025-10-06  3295  
9f1edf1aedac1b Roman Gushchin          2025-10-06  3296  	if (force_thp_readahead) {
9f1edf1aedac1b Roman Gushchin          2025-10-06  3297  		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
9f1edf1aedac1b Roman Gushchin          2025-10-06  3298  		ractl._index &= ~((unsigned long)HPAGE_PMD_NR - 1);
9f1edf1aedac1b Roman Gushchin          2025-10-06  3299  		ra->size = HPAGE_PMD_NR;
9f1edf1aedac1b Roman Gushchin          2025-10-06  3300  		/*
9f1edf1aedac1b Roman Gushchin          2025-10-06  3301  		 * Fetch two PMD folios, so we get the chance to actually
9f1edf1aedac1b Roman Gushchin          2025-10-06  3302  		 * readahead, unless we've been told not to.
9f1edf1aedac1b Roman Gushchin          2025-10-06  3303  		 */
9f1edf1aedac1b Roman Gushchin          2025-10-06  3304  		if (!(vm_flags & VM_RAND_READ))
9f1edf1aedac1b Roman Gushchin          2025-10-06  3305  			ra->size *= 2;
9f1edf1aedac1b Roman Gushchin          2025-10-06  3306  		ra->async_size = HPAGE_PMD_NR;
9f1edf1aedac1b Roman Gushchin          2025-10-06 @3307  		ra->order = HPAGE_PMD_ORDER;
9f1edf1aedac1b Roman Gushchin          2025-10-06  3308  		page_cache_ra_order(&ractl, ra);
9f1edf1aedac1b Roman Gushchin          2025-10-06  3309  		return fpin;
9f1edf1aedac1b Roman Gushchin          2025-10-06  3310  	}
ef00e08e26dd5d Linus Torvalds          2009-06-16  3311  
38b0ece6d76374 Ryan Roberts            2025-06-09  3312  	if (vm_flags & VM_EXEC) {
38b0ece6d76374 Ryan Roberts            2025-06-09  3313  		/*
38b0ece6d76374 Ryan Roberts            2025-06-09  3314  		 * Allow arch to request a preferred minimum folio order for
38b0ece6d76374 Ryan Roberts            2025-06-09  3315  		 * executable memory. This can often be beneficial to
38b0ece6d76374 Ryan Roberts            2025-06-09  3316  		 * performance if (e.g.) arm64 can contpte-map the folio.
38b0ece6d76374 Ryan Roberts            2025-06-09  3317  		 * Executable memory rarely benefits from readahead, due to its
38b0ece6d76374 Ryan Roberts            2025-06-09  3318  		 * random access nature, so set async_size to 0.
38b0ece6d76374 Ryan Roberts            2025-06-09  3319  		 *
38b0ece6d76374 Ryan Roberts            2025-06-09  3320  		 * Limit to the boundaries of the VMA to avoid reading in any
38b0ece6d76374 Ryan Roberts            2025-06-09  3321  		 * pad that might exist between sections, which would be a waste
38b0ece6d76374 Ryan Roberts            2025-06-09  3322  		 * of memory.
38b0ece6d76374 Ryan Roberts            2025-06-09  3323  		 */
38b0ece6d76374 Ryan Roberts            2025-06-09  3324  		struct vm_area_struct *vma = vmf->vma;
38b0ece6d76374 Ryan Roberts            2025-06-09  3325  		unsigned long start = vma->vm_pgoff;
38b0ece6d76374 Ryan Roberts            2025-06-09  3326  		unsigned long end = start + vma_pages(vma);
38b0ece6d76374 Ryan Roberts            2025-06-09  3327  		unsigned long ra_end;
38b0ece6d76374 Ryan Roberts            2025-06-09  3328  
38b0ece6d76374 Ryan Roberts            2025-06-09  3329  		ra->order = exec_folio_order();
38b0ece6d76374 Ryan Roberts            2025-06-09  3330  		ra->start = round_down(vmf->pgoff, 1UL << ra->order);
38b0ece6d76374 Ryan Roberts            2025-06-09  3331  		ra->start = max(ra->start, start);
38b0ece6d76374 Ryan Roberts            2025-06-09  3332  		ra_end = round_up(ra->start + ra->ra_pages, 1UL << ra->order);
38b0ece6d76374 Ryan Roberts            2025-06-09  3333  		ra_end = min(ra_end, end);
38b0ece6d76374 Ryan Roberts            2025-06-09  3334  		ra->size = ra_end - ra->start;
38b0ece6d76374 Ryan Roberts            2025-06-09  3335  		ra->async_size = 0;
38b0ece6d76374 Ryan Roberts            2025-06-09  3336  	} else {
d30a11004e3411 Wu Fengguang            2009-06-16  3337  		/*
d30a11004e3411 Wu Fengguang            2009-06-16  3338  		 * mmap read-around
d30a11004e3411 Wu Fengguang            2009-06-16  3339  		 */
db660d462525c4 David Howells           2020-10-15  3340  		ra->start = max_t(long, 0, vmf->pgoff - ra->ra_pages / 2);
600e19afc5f8a6 Roman Gushchin          2015-11-05  3341  		ra->size = ra->ra_pages;
600e19afc5f8a6 Roman Gushchin          2015-11-05  3342  		ra->async_size = ra->ra_pages / 4;
c4602f9fa77fc6 Ryan Roberts            2025-06-09  3343  		ra->order = 0;
38b0ece6d76374 Ryan Roberts            2025-06-09  3344  	}
38b0ece6d76374 Ryan Roberts            2025-06-09  3345  
38b0ece6d76374 Ryan Roberts            2025-06-09  3346  	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
db660d462525c4 David Howells           2020-10-15  3347  	ractl._index = ra->start;
c4602f9fa77fc6 Ryan Roberts            2025-06-09  3348  	page_cache_ra_order(&ractl, ra);
6b4c9f4469819a Josef Bacik             2019-03-13  3349  	return fpin;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3350  }
ef00e08e26dd5d Linus Torvalds          2009-06-16  3351  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
