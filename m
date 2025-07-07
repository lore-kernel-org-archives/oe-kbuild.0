Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E63B279787
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Jul 2025 06:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871197; cv=none; b=PX/pCaIqtqvfRP92a1A3ngCaxOgnWoePiSBAVsx2dNrIUSX5qkZbaF07iMAdKh0gTvKle8WKsK28X9eEVINxwhOf+nMbjRdrY359fSsHddksrA8g2BN9eob2qJ+5px0bW7CPYa24KU1qjuXyb7j80mOPV7Xo7c+4vm8VkEFdV0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871197; c=relaxed/simple;
	bh=uB+AbQ+TeUSaqlZLKhPGmvmQ/2YonjZ3Eq/a7VIDbw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mqNdrJJw8r5XildxGIA1Kp00Ehe91g0+i3vq8c2VjLT9q4WKphFQK/HRIre/0IdOVab/j6FJf6M/HZMwBozSTTq4T2b5q+GovK1SZ4bi1Ci+GahvU0PnmZaYSlsQIFHmRvfi0Wl6tv8DlcuF/GWeSJEtZD/KwNtIENhtncijB1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWREyF7X; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWREyF7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751871195; x=1783407195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uB+AbQ+TeUSaqlZLKhPGmvmQ/2YonjZ3Eq/a7VIDbw4=;
  b=OWREyF7XL1fmP4Fx6RhjczBhPqs0JC1tscGRAgAc+mUviJ2y/N/9DIIw
   CmNAtJxEkZ44zscdcMfcbXC5e+e83VlNGjY/Kqj0fi0kyQQIBjFeqYaL1
   wQ2K7xkHTSGoNnC/dlRg2rFh6ZRGCQncq4H8hJMzM7KJvyTP4XRPAh/Na
   s+QTya7iukcFfQbn1iZanwwAmVSjySTrvq8vksgCLbZKgWeYRQAqJUsAc
   5lnpO5sPEAqSJAkjN+IbM9xm8SYFmU15flSHJbf9UzSBLTwSZtugyM8a/
   7lw24Lytpqcla9aaULU31r0vkMlktHZpadzeJhsmIgoEIDufYq5F21VU3
   w==;
X-CSE-ConnectionGUID: 9MjfJuuyRZ645cgC/wUPLQ==
X-CSE-MsgGUID: PXcuPZlPSlS5g1Er+lAVHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54008129"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="54008129"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 23:53:14 -0700
X-CSE-ConnectionGUID: hJoEVGQtSxOisxhKSPLupw==
X-CSE-MsgGUID: UD4MmdBESZKLxSK8z6hswg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="155234982"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jul 2025 23:53:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYfix-0000CW-21;
	Mon, 07 Jul 2025 06:53:11 +0000
Date: Mon, 7 Jul 2025 14:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [akpm-mm:mm-unstable 77/240] mm/filemap.c:3283:37-43: WARNING:
 Consider using vma_pages helper on vma
Message-ID: <202507071459.lLPSj5Bd-lkp@intel.com>
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
TO: Ryan Roberts <ryan.roberts@arm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   5aa46327724d1abe18a36e9dec4f26dba8989710
commit: b58187b2ba0af49c48448c3fe1b400cf8fa14232 [77/240] mm/filemap: allow arch to request folio size for exec memory
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: i386-randconfig-052-20250707 (https://download.01.org/0day-ci/archive/20250707/202507071459.lLPSj5Bd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202507071459.lLPSj5Bd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/filemap.c:3283:37-43: WARNING: Consider using vma_pages helper on vma

vim +3283 mm/filemap.c

4687fdbb805a92 Matthew Wilcox (Oracle  2021-07-24  3240) 
b58187b2ba0af4 Ryan Roberts            2025-06-09  3241  	/*
b58187b2ba0af4 Ryan Roberts            2025-06-09  3242  	 * If we don't want any read-ahead, don't bother. VM_EXEC case below is
b58187b2ba0af4 Ryan Roberts            2025-06-09  3243  	 * already intended for random access.
b58187b2ba0af4 Ryan Roberts            2025-06-09  3244  	 */
b58187b2ba0af4 Ryan Roberts            2025-06-09  3245  	if ((vm_flags & (VM_RAND_READ | VM_EXEC)) == VM_RAND_READ)
6b4c9f4469819a Josef Bacik             2019-03-13  3246  		return fpin;
275b12bf5486f6 Wu Fengguang            2011-05-24  3247  	if (!ra->ra_pages)
6b4c9f4469819a Josef Bacik             2019-03-13  3248  		return fpin;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3249  
dcfa24ba68991a Matthew Wilcox (Oracle  2022-05-25  3250) 	if (vm_flags & VM_SEQ_READ) {
6b4c9f4469819a Josef Bacik             2019-03-13  3251  		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
fcd9ae4f7f3b5f Matthew Wilcox (Oracle  2021-04-07  3252) 		page_cache_sync_ra(&ractl, ra->ra_pages);
6b4c9f4469819a Josef Bacik             2019-03-13  3253  		return fpin;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3254  	}
ef00e08e26dd5d Linus Torvalds          2009-06-16  3255  
207d04baa3591a Andi Kleen              2011-05-24  3256  	/* Avoid banging the cache line if not needed */
e630bfac79456d Kirill A. Shutemov      2020-08-14  3257  	mmap_miss = READ_ONCE(ra->mmap_miss);
e630bfac79456d Kirill A. Shutemov      2020-08-14  3258  	if (mmap_miss < MMAP_LOTSAMISS * 10)
e630bfac79456d Kirill A. Shutemov      2020-08-14  3259  		WRITE_ONCE(ra->mmap_miss, ++mmap_miss);
ef00e08e26dd5d Linus Torvalds          2009-06-16  3260  
ef00e08e26dd5d Linus Torvalds          2009-06-16  3261  	/*
ef00e08e26dd5d Linus Torvalds          2009-06-16  3262  	 * Do we miss much more than hit in this file? If so,
ef00e08e26dd5d Linus Torvalds          2009-06-16  3263  	 * stop bothering with read-ahead. It will only hurt.
ef00e08e26dd5d Linus Torvalds          2009-06-16  3264  	 */
e630bfac79456d Kirill A. Shutemov      2020-08-14  3265  	if (mmap_miss > MMAP_LOTSAMISS)
6b4c9f4469819a Josef Bacik             2019-03-13  3266  		return fpin;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3267  
b58187b2ba0af4 Ryan Roberts            2025-06-09  3268  	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
b58187b2ba0af4 Ryan Roberts            2025-06-09  3269  	if (vm_flags & VM_EXEC) {
b58187b2ba0af4 Ryan Roberts            2025-06-09  3270  		/*
b58187b2ba0af4 Ryan Roberts            2025-06-09  3271  		 * Allow arch to request a preferred minimum folio order for
b58187b2ba0af4 Ryan Roberts            2025-06-09  3272  		 * executable memory. This can often be beneficial to
b58187b2ba0af4 Ryan Roberts            2025-06-09  3273  		 * performance if (e.g.) arm64 can contpte-map the folio.
b58187b2ba0af4 Ryan Roberts            2025-06-09  3274  		 * Executable memory rarely benefits from readahead, due to its
b58187b2ba0af4 Ryan Roberts            2025-06-09  3275  		 * random access nature, so set async_size to 0.
b58187b2ba0af4 Ryan Roberts            2025-06-09  3276  		 *
b58187b2ba0af4 Ryan Roberts            2025-06-09  3277  		 * Limit to the boundaries of the VMA to avoid reading in any
b58187b2ba0af4 Ryan Roberts            2025-06-09  3278  		 * pad that might exist between sections, which would be a waste
b58187b2ba0af4 Ryan Roberts            2025-06-09  3279  		 * of memory.
b58187b2ba0af4 Ryan Roberts            2025-06-09  3280  		 */
b58187b2ba0af4 Ryan Roberts            2025-06-09  3281  		struct vm_area_struct *vma = vmf->vma;
b58187b2ba0af4 Ryan Roberts            2025-06-09  3282  		unsigned long start = vma->vm_pgoff;
b58187b2ba0af4 Ryan Roberts            2025-06-09 @3283  		unsigned long end = start + ((vma->vm_end - vma->vm_start) >> PAGE_SHIFT);
b58187b2ba0af4 Ryan Roberts            2025-06-09  3284  		unsigned long ra_end;
b58187b2ba0af4 Ryan Roberts            2025-06-09  3285  
b58187b2ba0af4 Ryan Roberts            2025-06-09  3286  		ra->order = exec_folio_order();
b58187b2ba0af4 Ryan Roberts            2025-06-09  3287  		ra->start = round_down(vmf->pgoff, 1UL << ra->order);
b58187b2ba0af4 Ryan Roberts            2025-06-09  3288  		ra->start = max(ra->start, start);
b58187b2ba0af4 Ryan Roberts            2025-06-09  3289  		ra_end = round_up(ra->start + ra->ra_pages, 1UL << ra->order);
b58187b2ba0af4 Ryan Roberts            2025-06-09  3290  		ra_end = min(ra_end, end);
b58187b2ba0af4 Ryan Roberts            2025-06-09  3291  		ra->size = ra_end - ra->start;
b58187b2ba0af4 Ryan Roberts            2025-06-09  3292  		ra->async_size = 0;
b58187b2ba0af4 Ryan Roberts            2025-06-09  3293  	} else {
d30a11004e3411 Wu Fengguang            2009-06-16  3294  		/*
d30a11004e3411 Wu Fengguang            2009-06-16  3295  		 * mmap read-around
d30a11004e3411 Wu Fengguang            2009-06-16  3296  		 */
db660d462525c4 David Howells           2020-10-15  3297  		ra->start = max_t(long, 0, vmf->pgoff - ra->ra_pages / 2);
600e19afc5f8a6 Roman Gushchin          2015-11-05  3298  		ra->size = ra->ra_pages;
600e19afc5f8a6 Roman Gushchin          2015-11-05  3299  		ra->async_size = ra->ra_pages / 4;
28b31a2b2dbfc0 Ryan Roberts            2025-06-09  3300  		ra->order = 0;
b58187b2ba0af4 Ryan Roberts            2025-06-09  3301  	}
db660d462525c4 David Howells           2020-10-15  3302  	ractl._index = ra->start;
28b31a2b2dbfc0 Ryan Roberts            2025-06-09  3303  	page_cache_ra_order(&ractl, ra);
6b4c9f4469819a Josef Bacik             2019-03-13  3304  	return fpin;
ef00e08e26dd5d Linus Torvalds          2009-06-16  3305  }
ef00e08e26dd5d Linus Torvalds          2009-06-16  3306  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
