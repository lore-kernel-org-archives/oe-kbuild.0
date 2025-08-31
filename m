Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0424A1DDC07
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Aug 2025 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756625275; cv=none; b=OCG3EXGh+NDgQ4Nz2PEjLi5D4IP+tThF6vrW1ULH0H/fEEP+MACfhJSdjwgbOzuwFYfsfOZPsHsx1Yxjjbz1OYIOZruSrrwVRBVlimZ+l5PqohsswzjuovqvQ2eTTgDJsUzM18YYYMhEhSTg+X+chC3pKZp2HFgUzHcvf2+sUIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756625275; c=relaxed/simple;
	bh=wKw4bXOmPI3Ps0oTsqJwiOMTFBegJE27iuzkgy2XnxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VNSUi+H67SnBXXuTeBaT/ZDh15CoWj4Z9MrQsYhAGnkp/b7pCVTkQiEwoRWNAzkZ0m5M21SG6qsmk36eJUGbR4vFNaFOpXHYyBhbDQKFkSHXFVwXbORAtVlRozgHAWp4Vddo8ksUkoSKskmjHs/sq+40XgtUiiurnv6MDqUgj4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdpsIK84; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdpsIK84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756625274; x=1788161274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wKw4bXOmPI3Ps0oTsqJwiOMTFBegJE27iuzkgy2XnxQ=;
  b=BdpsIK84izeFz127z1L1qKj7D3Wu8iT1MN141ZJTbYdSzPizSLxv6mjH
   Gl5x4XRYr/AgnSGFFIHPeLS477xEQM41hUj2CqeD5qycZTTx0EzFBVgR6
   cSZvxoLNFWIR2LSapRPueumLUi2cFRfN6YWK0+7x4S15CW+gbyeIs2ov7
   4wPmww6iaY5c/v2jqQhkMe9DFynVMKYRkYQTuiC/W7XboZ9XXZxMm0qtj
   ifVScG+ZfipnbqR3E0X0w38KfgMYdM8Axm+5aJVoBDQprJ49UdaX30jRw
   YEEU6+GjrTxZWSRFiohJ9QylixmeB4d/TC6fxI3MTtpNzEEQZIho72pdU
   A==;
X-CSE-ConnectionGUID: 2GK1srjCQpOKaULIDHYJEw==
X-CSE-MsgGUID: gZlJeCC1QZKVpaES3jLsow==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="57876382"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="57876382"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 00:27:53 -0700
X-CSE-ConnectionGUID: 1H2xDBb3T1mkDAhHoSAXhQ==
X-CSE-MsgGUID: EqKcSRX+R4C8iIbfaEonUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="169965193"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 31 Aug 2025 00:27:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uscTd-000W1r-18;
	Sun, 31 Aug 2025 07:27:49 +0000
Date: Sun, 31 Aug 2025 15:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tglx-devel:rseq/perf 2/47] mm/msync.c:90 __do_sys_msync() warn:
 comparison of a potentially tagged address (__do_sys_msync, -2,
 __UNIQUE_ID_x_704)
Message-ID: <202508311516.0fWQnSpc-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   3aaf1200ebca49bc745506e411f36c54754e1754
commit: e93d7f79fdb1fcd0b6c9ff411bca8347412130bc [2/47] uaccess: Provide common helpers for masked user access
:::::: branch date: 7 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-r073-20250831 (https://download.01.org/0day-ci/archive/20250831/202508311516.0fWQnSpc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508311516.0fWQnSpc-lkp@intel.com/

New smatch warnings:
mm/msync.c:90 __do_sys_msync() warn: comparison of a potentially tagged address (__do_sys_msync, -2, __UNIQUE_ID_x_704)
mm/msync.c:90 __do_sys_msync() warn: comparison of a potentially tagged address (__do_sys_msync, -2, __UNIQUE_ID_x_704)
fs/userfaultfd.c:1515 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, __UNIQUE_ID_x_714)

Old smatch warnings:
fs/userfaultfd.c:1348 userfaultfd_register() warn: comparison of a potentially tagged address (userfaultfd_register, -2, end)
fs/userfaultfd.c:1498 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, start)
fs/userfaultfd.c:1513 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, start)

vim +90 mm/msync.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  17  
^1da177e4c3f415 Linus Torvalds     2005-04-16  18  /*
^1da177e4c3f415 Linus Torvalds     2005-04-16  19   * MS_SYNC syncs the entire file - including mappings.
^1da177e4c3f415 Linus Torvalds     2005-04-16  20   *
204ec841fbea3e5 Peter Zijlstra     2006-09-25  21   * MS_ASYNC does not start I/O (it used to, up to 2.5.67).
204ec841fbea3e5 Peter Zijlstra     2006-09-25  22   * Nor does it marks the relevant pages dirty (it used to up to 2.6.17).
204ec841fbea3e5 Peter Zijlstra     2006-09-25  23   * Now it doesn't do anything, since dirty pages are properly tracked.
204ec841fbea3e5 Peter Zijlstra     2006-09-25  24   *
204ec841fbea3e5 Peter Zijlstra     2006-09-25  25   * The application may now run fsync() to
^1da177e4c3f415 Linus Torvalds     2005-04-16  26   * write out the dirty pages and wait on the writeout and check the result.
^1da177e4c3f415 Linus Torvalds     2005-04-16  27   * Or the application may run fadvise(FADV_DONTNEED) against the fd to start
^1da177e4c3f415 Linus Torvalds     2005-04-16  28   * async writeout immediately.
16538c40776b8be Amos Waterland     2006-03-24  29   * So by _not_ starting I/O in MS_ASYNC we provide complete flexibility to
^1da177e4c3f415 Linus Torvalds     2005-04-16  30   * applications.
^1da177e4c3f415 Linus Torvalds     2005-04-16  31   */
6a6160a7b5c27b3 Heiko Carstens     2009-01-14  32  SYSCALL_DEFINE3(msync, unsigned long, start, size_t, len, int, flags)
^1da177e4c3f415 Linus Torvalds     2005-04-16  33  {
^1da177e4c3f415 Linus Torvalds     2005-04-16  34  	unsigned long end;
204ec841fbea3e5 Peter Zijlstra     2006-09-25  35  	struct mm_struct *mm = current->mm;
^1da177e4c3f415 Linus Torvalds     2005-04-16  36  	struct vm_area_struct *vma;
676758bdb7bfca8 Andrew Morton      2006-03-24  37  	int unmapped_error = 0;
676758bdb7bfca8 Andrew Morton      2006-03-24  38  	int error = -EINVAL;
^1da177e4c3f415 Linus Torvalds     2005-04-16  39  
057d3389108eda8 Andrey Konovalov   2019-09-25  40  	start = untagged_addr(start);
057d3389108eda8 Andrey Konovalov   2019-09-25  41  
^1da177e4c3f415 Linus Torvalds     2005-04-16  42  	if (flags & ~(MS_ASYNC | MS_INVALIDATE | MS_SYNC))
^1da177e4c3f415 Linus Torvalds     2005-04-16  43  		goto out;
b0d61c7e56815b0 Alexander Kuleshov 2015-11-05  44  	if (offset_in_page(start))
^1da177e4c3f415 Linus Torvalds     2005-04-16  45  		goto out;
^1da177e4c3f415 Linus Torvalds     2005-04-16  46  	if ((flags & MS_ASYNC) && (flags & MS_SYNC))
^1da177e4c3f415 Linus Torvalds     2005-04-16  47  		goto out;
^1da177e4c3f415 Linus Torvalds     2005-04-16  48  	error = -ENOMEM;
^1da177e4c3f415 Linus Torvalds     2005-04-16  49  	len = (len + ~PAGE_MASK) & PAGE_MASK;
^1da177e4c3f415 Linus Torvalds     2005-04-16  50  	end = start + len;
^1da177e4c3f415 Linus Torvalds     2005-04-16  51  	if (end < start)
^1da177e4c3f415 Linus Torvalds     2005-04-16  52  		goto out;
^1da177e4c3f415 Linus Torvalds     2005-04-16  53  	error = 0;
^1da177e4c3f415 Linus Torvalds     2005-04-16  54  	if (end == start)
^1da177e4c3f415 Linus Torvalds     2005-04-16  55  		goto out;
^1da177e4c3f415 Linus Torvalds     2005-04-16  56  	/*
^1da177e4c3f415 Linus Torvalds     2005-04-16  57  	 * If the interval [start,end) covers some unmapped address ranges,
f6899bc03cbadc6 Nikita Ermakov     2021-04-29  58  	 * just ignore them, but return -ENOMEM at the end. Besides, if the
f6899bc03cbadc6 Nikita Ermakov     2021-04-29  59  	 * flag is MS_ASYNC (w/o MS_INVALIDATE) the result would be -ENOMEM
f6899bc03cbadc6 Nikita Ermakov     2021-04-29  60  	 * anyway and there is nothing left to do, so return immediately.
^1da177e4c3f415 Linus Torvalds     2005-04-16  61  	 */
d8ed45c5dcd455f Michel Lespinasse  2020-06-08  62  	mmap_read_lock(mm);
204ec841fbea3e5 Peter Zijlstra     2006-09-25  63  	vma = find_vma(mm, start);
204ec841fbea3e5 Peter Zijlstra     2006-09-25  64  	for (;;) {
9c50823eebf7c25 Andrew Morton      2006-03-24  65  		struct file *file;
7fc34a62ca4434a Matthew Wilcox     2014-06-04  66  		loff_t fstart, fend;
9c50823eebf7c25 Andrew Morton      2006-03-24  67  
204ec841fbea3e5 Peter Zijlstra     2006-09-25  68  		/* Still start < end. */
204ec841fbea3e5 Peter Zijlstra     2006-09-25  69  		error = -ENOMEM;
204ec841fbea3e5 Peter Zijlstra     2006-09-25  70  		if (!vma)
204ec841fbea3e5 Peter Zijlstra     2006-09-25  71  			goto out_unlock;
^1da177e4c3f415 Linus Torvalds     2005-04-16  72  		/* Here start < vma->vm_end. */
^1da177e4c3f415 Linus Torvalds     2005-04-16  73  		if (start < vma->vm_start) {
f6899bc03cbadc6 Nikita Ermakov     2021-04-29  74  			if (flags == MS_ASYNC)
f6899bc03cbadc6 Nikita Ermakov     2021-04-29  75  				goto out_unlock;
^1da177e4c3f415 Linus Torvalds     2005-04-16  76  			start = vma->vm_start;
204ec841fbea3e5 Peter Zijlstra     2006-09-25  77  			if (start >= end)
9c50823eebf7c25 Andrew Morton      2006-03-24  78  				goto out_unlock;
204ec841fbea3e5 Peter Zijlstra     2006-09-25  79  			unmapped_error = -ENOMEM;
^1da177e4c3f415 Linus Torvalds     2005-04-16  80  		}
204ec841fbea3e5 Peter Zijlstra     2006-09-25  81  		/* Here vma->vm_start <= start < vma->vm_end. */
204ec841fbea3e5 Peter Zijlstra     2006-09-25  82  		if ((flags & MS_INVALIDATE) &&
204ec841fbea3e5 Peter Zijlstra     2006-09-25  83  				(vma->vm_flags & VM_LOCKED)) {
204ec841fbea3e5 Peter Zijlstra     2006-09-25  84  			error = -EBUSY;
9c50823eebf7c25 Andrew Morton      2006-03-24  85  			goto out_unlock;
9c50823eebf7c25 Andrew Morton      2006-03-24  86  		}
9c50823eebf7c25 Andrew Morton      2006-03-24  87  		file = vma->vm_file;
496a8e68654a5f4 Namjae Jeon        2014-07-02  88  		fstart = (start - vma->vm_start) +
496a8e68654a5f4 Namjae Jeon        2014-07-02  89  			 ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
7fc34a62ca4434a Matthew Wilcox     2014-06-04 @90  		fend = fstart + (min(end, vma->vm_end) - start) - 1;

:::::: The code at line 90 was first introduced by commit
:::::: 7fc34a62ca4434a79c68e23e70ed26111b7a4cf8 mm/msync.c: sync only the requested range in msync()

:::::: TO: Matthew Wilcox <matthew.r.wilcox@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
