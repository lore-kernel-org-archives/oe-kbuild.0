Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DEB3D966
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 03:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720494667; cv=none; b=PypFKWPFBTYb37ZXN+g1XOIvlkyGYd1zfVNIc398Tpp60kOSR6wbP0Fzup7XJFzs4ZOEuRGbR7/6bu82mAebLgcoaCIuYDxPtReFzpIri9PRQ4eccLqGL7+tKdpEXqqf8sINaTBwZcF3arODIPUeWKFTUn8GLEF+ygOnc1RgFFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720494667; c=relaxed/simple;
	bh=l7GFuZmRqFA6uSSQaOi1ikYqkGzjfF2Ybe3qRDzGSXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qhz4+22RGYB7d8PydlAcMSOKIdTi+A/xIcuto9IzhHVPC6LJ45RDJ74VsTDAaX1Qd0POhzOdN+1qW5z8Mz7v4+jsIEo6CCUHWAkDmi+UmEulhpuF3y+BIB5NQm/UBZe5yoIE7dR7U7+eauks+/SfuZitF397mlGlJZLEC/mWtPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAJvwqYN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAJvwqYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720494665; x=1752030665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l7GFuZmRqFA6uSSQaOi1ikYqkGzjfF2Ybe3qRDzGSXM=;
  b=FAJvwqYNhnc3qd9XZNjKP+lO1k5nrvL2+kMePz2FyNXIrdWu82MaboER
   dRB3gV1LgdIjQPgRyMCMJt+M8lrHsodwcao2vv/Js1nqistwgiUZ7VMk8
   C9IdRqF5ZpX+6YS/H6wGlrA9FknUeTHlmw4J2FhWC7/XnnMaqi6pvRTSy
   BDOzuNfBDpXFvwV4B6GKtBUprLgY1Ec5opDCM2YqqzUQ9RJbFywyokZHu
   cDA8xt+36ICqcAUWxSYs5UaY5e3ZSrD0xj2mDJqVWU7qVIjNcHHxf4RUe
   OhTxwV8uQHFraeiTStAGkpdydze4vWYuXfIDN9mArKr8Og1Ylqq7Fqd1i
   Q==;
X-CSE-ConnectionGUID: yP6eIwKgRTuRnG492Tg0JQ==
X-CSE-MsgGUID: zo29+E+STryIIzEYgQvrqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="43146343"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="43146343"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 20:11:05 -0700
X-CSE-ConnectionGUID: 5wuoivQkRNikHxIZnDRrGw==
X-CSE-MsgGUID: WjZU+Q6pQ8OSq4ky4g9eCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="52503155"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Jul 2024 20:11:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR1Fr-000WHe-2y;
	Tue, 09 Jul 2024 03:10:59 +0000
Date: Tue, 9 Jul 2024 11:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [crng-random:master 1/4] mm/mlock.c:488 mlock_fixup() warn: bitwise
 AND condition is false here
Message-ID: <202407091145.c9ZzNDVh-lkp@intel.com>
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
CC: zx2c4@kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git master
head:   3d5dc4882706f0a39be74eac173ef994ce18e1f3
commit: 7b1ed736b8f70a962a7d1f4768a4db385ac3bf35 [1/4] mm: add MAP_DROPPABLE for designating always lazily freeable mappings
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-141-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091145.c9ZzNDVh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407091145.c9ZzNDVh-lkp@intel.com/

smatch warnings:
mm/mlock.c:488 mlock_fixup() warn: bitwise AND condition is false here

vim +488 mm/mlock.c

b291f000393f5a Nicholas Piggin    2008-10-18  467  
b291f000393f5a Nicholas Piggin    2008-10-18  468  /*
b291f000393f5a Nicholas Piggin    2008-10-18  469   * mlock_fixup  - handle mlock[all]/munlock[all] requests.
b291f000393f5a Nicholas Piggin    2008-10-18  470   *
b291f000393f5a Nicholas Piggin    2008-10-18  471   * Filters out "special" vmas -- VM_LOCKED never gets set for these, and
b291f000393f5a Nicholas Piggin    2008-10-18  472   * munlock is a no-op.  However, for some special vmas, we go ahead and
cea10a19b7972a Michel Lespinasse  2013-02-22  473   * populate the ptes.
b291f000393f5a Nicholas Piggin    2008-10-18  474   *
b291f000393f5a Nicholas Piggin    2008-10-18  475   * For vmas that pass the filters, merge/split as appropriate.
b291f000393f5a Nicholas Piggin    2008-10-18  476   */
37598f5a9d8b63 Liam R. Howlett    2023-01-20  477  static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
37598f5a9d8b63 Liam R. Howlett    2023-01-20  478  	       struct vm_area_struct **prev, unsigned long start,
37598f5a9d8b63 Liam R. Howlett    2023-01-20  479  	       unsigned long end, vm_flags_t newflags)
^1da177e4c3f41 Linus Torvalds     2005-04-16  480  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  481  	struct mm_struct *mm = vma->vm_mm;
b291f000393f5a Nicholas Piggin    2008-10-18  482  	int nr_pages;
^1da177e4c3f41 Linus Torvalds     2005-04-16  483  	int ret = 0;
34b6792380ce4f Hugh Dickins       2022-02-14  484  	vm_flags_t oldflags = vma->vm_flags;
^1da177e4c3f41 Linus Torvalds     2005-04-16  485  
34b6792380ce4f Hugh Dickins       2022-02-14  486  	if (newflags == oldflags || (oldflags & VM_SPECIAL) ||
e1fb4a0864958f Dave Jiang         2018-08-17  487  	    is_vm_hugetlb_page(vma) || vma == get_gate_vma(current->mm) ||
7b1ed736b8f70a Jason A. Donenfeld 2022-12-08 @488  	    vma_is_dax(vma) || vma_is_secretmem(vma) || (oldflags & VM_DROPPABLE))
b0f205c2a3082d Eric B Munson      2015-11-05  489  		/* don't set VM_LOCKED or VM_LOCKONFAULT and don't count */
b0f205c2a3082d Eric B Munson      2015-11-05  490  		goto out;
b291f000393f5a Nicholas Piggin    2008-10-18  491  
94d7d923395129 Lorenzo Stoakes    2023-10-11  492  	vma = vma_modify_flags(vmi, *prev, vma, start, end, newflags);
94d7d923395129 Lorenzo Stoakes    2023-10-11  493  	if (IS_ERR(vma)) {
94d7d923395129 Lorenzo Stoakes    2023-10-11  494  		ret = PTR_ERR(vma);
^1da177e4c3f41 Linus Torvalds     2005-04-16  495  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  496  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  497  
b291f000393f5a Nicholas Piggin    2008-10-18  498  	/*
b291f000393f5a Nicholas Piggin    2008-10-18  499  	 * Keep track of amount of locked VM.
b291f000393f5a Nicholas Piggin    2008-10-18  500  	 */
b291f000393f5a Nicholas Piggin    2008-10-18  501  	nr_pages = (end - start) >> PAGE_SHIFT;
34b6792380ce4f Hugh Dickins       2022-02-14  502  	if (!(newflags & VM_LOCKED))
b291f000393f5a Nicholas Piggin    2008-10-18  503  		nr_pages = -nr_pages;
34b6792380ce4f Hugh Dickins       2022-02-14  504  	else if (oldflags & VM_LOCKED)
b155b4fde5bdde Simon Guo          2016-10-07  505  		nr_pages = 0;
b291f000393f5a Nicholas Piggin    2008-10-18  506  	mm->locked_vm += nr_pages;
b291f000393f5a Nicholas Piggin    2008-10-18  507  
^1da177e4c3f41 Linus Torvalds     2005-04-16  508  	/*
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08  509  	 * vm_flags is protected by the mmap_lock held in write mode.
^1da177e4c3f41 Linus Torvalds     2005-04-16  510  	 * It's okay if try_to_unmap_one unmaps a page just after we
fc05f566210fa5 Kirill A. Shutemov 2015-04-14  511  	 * set VM_LOCKED, populate_vma_page_range will bring it back.
^1da177e4c3f41 Linus Torvalds     2005-04-16  512  	 */
34b6792380ce4f Hugh Dickins       2022-02-14  513  	if ((newflags & VM_LOCKED) && (oldflags & VM_LOCKED)) {
34b6792380ce4f Hugh Dickins       2022-02-14  514  		/* No work to do, and mlocking twice would be wrong */
60081bf19b0ec8 Suren Baghdasaryan 2023-08-04  515  		vma_start_write(vma);
1c71222e5f2393 Suren Baghdasaryan 2023-01-26  516  		vm_flags_reset(vma, newflags);
34b6792380ce4f Hugh Dickins       2022-02-14  517  	} else {
34b6792380ce4f Hugh Dickins       2022-02-14  518  		mlock_vma_pages_range(vma, start, end, newflags);
34b6792380ce4f Hugh Dickins       2022-02-14  519  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  520  out:
b291f000393f5a Nicholas Piggin    2008-10-18  521  	*prev = vma;
^1da177e4c3f41 Linus Torvalds     2005-04-16  522  	return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  523  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  524  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
