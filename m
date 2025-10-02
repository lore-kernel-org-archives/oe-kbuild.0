Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2364271469
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Oct 2025 20:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759437772; cv=none; b=M/P8h483m486Gpn8kWVwZlJUDDsGF8Vr0qMagaBfY2HChbNbyUzxsj8JWuMa8YY+YDi3tqG2aDa0DH/2+RudUdlFoAlMyXhWxspCHgFHO3aqOL0+ioEaP9hGR/jVqBnLgALfvV7QMmTHP4E4g6zidad1JAHX9UV19lt/r77apK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759437772; c=relaxed/simple;
	bh=UMZmTTcJAThHtlft7BguhgubybaPumpdPCG0uDULTwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJgU9Wii8oleot4Q8lEtLXisLV4g0IFCR3bkQpHmCVBL5zfI8dLR7Oh1ADJYSqI4cOtB3pyfrLAUZthKAtnUU6Y2b1fDg6ia7N2HcKznaJD0SAG0z0OuqyECYLt9uumoFp1EBBMlqehxZ+EJZqSpYrLuAIwRWVjHRKX6U5Uq59M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAp5hWqT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAp5hWqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759437771; x=1790973771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMZmTTcJAThHtlft7BguhgubybaPumpdPCG0uDULTwg=;
  b=YAp5hWqTZNXcrX1pT839a1/XoNHFoVtS4nNzXv0XCKT3RI4nFR46ZU66
   zkCzF0Mbs8xELBqWIKnLW49BmoyuR0kZgxPXF9LmKl/cb3RttHqylWJqU
   5fk7E3eMD1k9bqJhVUyR5vvcnhtyyszeo/0Gn9q0HBTm0jbSpLqp0TKqx
   vXQLQEMmDvh6uKhNJpmMKoMR3ENIFjUCuolb6ynvj79oyE34RPK0Vcvla
   eIVxt1Q4VRFfU9P6KVJ05ijcT3EZkYB5TiXKfasl/oup3q2w2Tqr4sqCT
   oEJct29XTsA639eCZt7tg4W8ui09sLyiJw2pATCSOVVd0RENlFe2tLiZ2
   g==;
X-CSE-ConnectionGUID: C8Ng6/sXRZC64TY7pwTHYQ==
X-CSE-MsgGUID: JwCNcvJMRTCIEn1LMfMRHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="71976633"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="71976633"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 13:42:51 -0700
X-CSE-ConnectionGUID: WD0r1fpGTka2fkYdibVDaA==
X-CSE-MsgGUID: nDrZ9WtLS56cHHfNOq07zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="209821545"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Oct 2025 13:42:49 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4Q8U-00046v-1z;
	Thu, 02 Oct 2025 20:42:46 +0000
Date: Fri, 3 Oct 2025 04:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rgushchin:thp_readahead.1 1/1] mm/filemap.c:3283
 do_sync_mmap_readahead() warn: assigning (-12) to unsigned variable
 'ra->order'
Message-ID: <202510030404.Hj5O0sf8-lkp@intel.com>
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
TO: Roman Gushchin <roman.gushchin@linux.dev>

tree:   https://github.com/rgushchin/linux.git thp_readahead.1
head:   f57269c964149835ab26763774a470bb4e52c850
commit: f57269c964149835ab26763774a470bb4e52c850 [1/1] mm: readahead: make thp readahead conditional to mmap_miss logic
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251003 (https://download.01.org/0day-ci/archive/20251003/202510030404.Hj5O0sf8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510030404.Hj5O0sf8-lkp@intel.com/

smatch warnings:
mm/filemap.c:3283 do_sync_mmap_readahead() warn: assigning (-12) to unsigned variable 'ra->order'

vim +3283 mm/filemap.c

6b4c9f4469819a Josef Bacik             2019-03-13  3222  
ef00e08e26dd5d Linus Torvalds          2009-06-16  3223  /*
6b4c9f4469819a Josef Bacik             2019-03-13  3224   * Synchronous readahead happens when we don't even find a page in the page
6b4c9f4469819a Josef Bacik             2019-03-13  3225   * cache at all.  We don't want to perform IO under the mmap sem, so if we have
6b4c9f4469819a Josef Bacik             2019-03-13  3226   * to drop the mmap sem we return the file that was pinned in order for us to do
6b4c9f4469819a Josef Bacik             2019-03-13  3227   * that.  If we didn't pin a file then we return NULL.  The file that is
6b4c9f4469819a Josef Bacik             2019-03-13  3228   * returned needs to be fput()'ed when we're done with it.
ef00e08e26dd5d Linus Torvalds          2009-06-16  3229   */
6b4c9f4469819a Josef Bacik             2019-03-13  3230  static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
ef00e08e26dd5d Linus Torvalds          2009-06-16  3231  {
2a1180f1bd389e Josef Bacik             2019-03-13  3232  	struct file *file = vmf->vma->vm_file;
2a1180f1bd389e Josef Bacik             2019-03-13  3233  	struct file_ra_state *ra = &file->f_ra;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3234  	struct address_space *mapping = file->f_mapping;
fcd9ae4f7f3b5f Matthew Wilcox (Oracle  2021-04-07  3235) 	DEFINE_READAHEAD(ractl, file, ra, mapping, vmf->pgoff);
6b4c9f4469819a Josef Bacik             2019-03-13  3236  	struct file *fpin = NULL;
bfbe71109fa40e Lorenzo Stoakes         2025-06-18  3237  	vm_flags_t vm_flags = vmf->vma->vm_flags;
f57269c9641498 Roman Gushchin          2025-09-29  3238  	bool force_thp_readahead = false;
f5e8b140cd1324 Ryan Roberts            2025-06-09  3239  	unsigned short mmap_miss;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3240  
4687fdbb805a92 Matthew Wilcox (Oracle  2021-07-24  3241) 	/* Use the readahead code, even if readahead is disabled */
f57269c9641498 Roman Gushchin          2025-09-29  3242  	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
f57269c9641498 Roman Gushchin          2025-09-29  3243  	    (vm_flags & VM_HUGEPAGE) && HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER)
f57269c9641498 Roman Gushchin          2025-09-29  3244  		force_thp_readahead = true;
38b0ece6d76374 Ryan Roberts            2025-06-09  3245  	/*
38b0ece6d76374 Ryan Roberts            2025-06-09  3246  	 * If we don't want any read-ahead, don't bother. VM_EXEC case below is
38b0ece6d76374 Ryan Roberts            2025-06-09  3247  	 * already intended for random access.
38b0ece6d76374 Ryan Roberts            2025-06-09  3248  	 */
38b0ece6d76374 Ryan Roberts            2025-06-09  3249  	if ((vm_flags & (VM_RAND_READ | VM_EXEC)) == VM_RAND_READ)
6b4c9f4469819a Josef Bacik             2019-03-13  3250  		return fpin;
f57269c9641498 Roman Gushchin          2025-09-29  3251  	if (!ra->ra_pages && !force_thp_readahead)
6b4c9f4469819a Josef Bacik             2019-03-13  3252  		return fpin;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3253  
dcfa24ba68991a Matthew Wilcox (Oracle  2022-05-25  3254) 	if (vm_flags & VM_SEQ_READ) {
6b4c9f4469819a Josef Bacik             2019-03-13  3255  		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
fcd9ae4f7f3b5f Matthew Wilcox (Oracle  2021-04-07  3256) 		page_cache_sync_ra(&ractl, ra->ra_pages);
6b4c9f4469819a Josef Bacik             2019-03-13  3257  		return fpin;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3258  	}
ef00e08e26dd5d Linus Torvalds          2009-06-16  3259  
207d04baa3591a Andi Kleen              2011-05-24  3260  	/* Avoid banging the cache line if not needed */
e630bfac79456d Kirill A. Shutemov      2020-08-14  3261  	mmap_miss = READ_ONCE(ra->mmap_miss);
e630bfac79456d Kirill A. Shutemov      2020-08-14  3262  	if (mmap_miss < MMAP_LOTSAMISS * 10)
e630bfac79456d Kirill A. Shutemov      2020-08-14  3263  		WRITE_ONCE(ra->mmap_miss, ++mmap_miss);
ef00e08e26dd5d Linus Torvalds          2009-06-16  3264  
ef00e08e26dd5d Linus Torvalds          2009-06-16  3265  	/*
ef00e08e26dd5d Linus Torvalds          2009-06-16  3266  	 * Do we miss much more than hit in this file? If so,
ef00e08e26dd5d Linus Torvalds          2009-06-16  3267  	 * stop bothering with read-ahead. It will only hurt.
ef00e08e26dd5d Linus Torvalds          2009-06-16  3268  	 */
e630bfac79456d Kirill A. Shutemov      2020-08-14  3269  	if (mmap_miss > MMAP_LOTSAMISS)
6b4c9f4469819a Josef Bacik             2019-03-13  3270  		return fpin;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3271  
f57269c9641498 Roman Gushchin          2025-09-29  3272  	if (force_thp_readahead) {
f57269c9641498 Roman Gushchin          2025-09-29  3273  		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
f57269c9641498 Roman Gushchin          2025-09-29  3274  		ractl._index &= ~((unsigned long)HPAGE_PMD_NR - 1);
f57269c9641498 Roman Gushchin          2025-09-29  3275  		ra->size = HPAGE_PMD_NR;
f57269c9641498 Roman Gushchin          2025-09-29  3276  		/*
f57269c9641498 Roman Gushchin          2025-09-29  3277  		 * Fetch two PMD folios, so we get the chance to actually
f57269c9641498 Roman Gushchin          2025-09-29  3278  		 * readahead, unless we've been told not to.
f57269c9641498 Roman Gushchin          2025-09-29  3279  		 */
f57269c9641498 Roman Gushchin          2025-09-29  3280  		if (!(vm_flags & VM_RAND_READ))
f57269c9641498 Roman Gushchin          2025-09-29  3281  			ra->size *= 2;
f57269c9641498 Roman Gushchin          2025-09-29  3282  		ra->async_size = HPAGE_PMD_NR;
f57269c9641498 Roman Gushchin          2025-09-29 @3283  		ra->order = HPAGE_PMD_ORDER;
f57269c9641498 Roman Gushchin          2025-09-29  3284  		page_cache_ra_order(&ractl, ra);
f57269c9641498 Roman Gushchin          2025-09-29  3285  		return fpin;
f57269c9641498 Roman Gushchin          2025-09-29  3286  	}
f57269c9641498 Roman Gushchin          2025-09-29  3287  
38b0ece6d76374 Ryan Roberts            2025-06-09  3288  	if (vm_flags & VM_EXEC) {
38b0ece6d76374 Ryan Roberts            2025-06-09  3289  		/*
38b0ece6d76374 Ryan Roberts            2025-06-09  3290  		 * Allow arch to request a preferred minimum folio order for
38b0ece6d76374 Ryan Roberts            2025-06-09  3291  		 * executable memory. This can often be beneficial to
38b0ece6d76374 Ryan Roberts            2025-06-09  3292  		 * performance if (e.g.) arm64 can contpte-map the folio.
38b0ece6d76374 Ryan Roberts            2025-06-09  3293  		 * Executable memory rarely benefits from readahead, due to its
38b0ece6d76374 Ryan Roberts            2025-06-09  3294  		 * random access nature, so set async_size to 0.
38b0ece6d76374 Ryan Roberts            2025-06-09  3295  		 *
38b0ece6d76374 Ryan Roberts            2025-06-09  3296  		 * Limit to the boundaries of the VMA to avoid reading in any
38b0ece6d76374 Ryan Roberts            2025-06-09  3297  		 * pad that might exist between sections, which would be a waste
38b0ece6d76374 Ryan Roberts            2025-06-09  3298  		 * of memory.
38b0ece6d76374 Ryan Roberts            2025-06-09  3299  		 */
38b0ece6d76374 Ryan Roberts            2025-06-09  3300  		struct vm_area_struct *vma = vmf->vma;
38b0ece6d76374 Ryan Roberts            2025-06-09  3301  		unsigned long start = vma->vm_pgoff;
38b0ece6d76374 Ryan Roberts            2025-06-09  3302  		unsigned long end = start + vma_pages(vma);
38b0ece6d76374 Ryan Roberts            2025-06-09  3303  		unsigned long ra_end;
38b0ece6d76374 Ryan Roberts            2025-06-09  3304  
38b0ece6d76374 Ryan Roberts            2025-06-09  3305  		ra->order = exec_folio_order();
38b0ece6d76374 Ryan Roberts            2025-06-09  3306  		ra->start = round_down(vmf->pgoff, 1UL << ra->order);
38b0ece6d76374 Ryan Roberts            2025-06-09  3307  		ra->start = max(ra->start, start);
38b0ece6d76374 Ryan Roberts            2025-06-09  3308  		ra_end = round_up(ra->start + ra->ra_pages, 1UL << ra->order);
38b0ece6d76374 Ryan Roberts            2025-06-09  3309  		ra_end = min(ra_end, end);
38b0ece6d76374 Ryan Roberts            2025-06-09  3310  		ra->size = ra_end - ra->start;
38b0ece6d76374 Ryan Roberts            2025-06-09  3311  		ra->async_size = 0;
38b0ece6d76374 Ryan Roberts            2025-06-09  3312  	} else {
d30a11004e3411 Wu Fengguang            2009-06-16  3313  		/*
d30a11004e3411 Wu Fengguang            2009-06-16  3314  		 * mmap read-around
d30a11004e3411 Wu Fengguang            2009-06-16  3315  		 */
db660d462525c4 David Howells           2020-10-15  3316  		ra->start = max_t(long, 0, vmf->pgoff - ra->ra_pages / 2);
600e19afc5f8a6 Roman Gushchin          2015-11-05  3317  		ra->size = ra->ra_pages;
600e19afc5f8a6 Roman Gushchin          2015-11-05  3318  		ra->async_size = ra->ra_pages / 4;
c4602f9fa77fc6 Ryan Roberts            2025-06-09  3319  		ra->order = 0;
38b0ece6d76374 Ryan Roberts            2025-06-09  3320  	}
38b0ece6d76374 Ryan Roberts            2025-06-09  3321  
38b0ece6d76374 Ryan Roberts            2025-06-09  3322  	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
db660d462525c4 David Howells           2020-10-15  3323  	ractl._index = ra->start;
c4602f9fa77fc6 Ryan Roberts            2025-06-09  3324  	page_cache_ra_order(&ractl, ra);
6b4c9f4469819a Josef Bacik             2019-03-13  3325  	return fpin;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3326  }
ef00e08e26dd5d Linus Torvalds          2009-06-16  3327  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
