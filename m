Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BA11E4937
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731957979; cv=none; b=Gh/Ujc4H3jpuQej5GXM0iLmhfzSLi2iKfmKO3N9RlysbDNkJikHxrOXmVhJWfblWlmXTarIhyzTrKqu1wa8g5OzZIPXvwKbitUHjh3QPg1Hy60gMq/BGXcVcTOVofoqbCJBrbY5wVlPT6l9Wm9vemeM7vaVyTAEWXagvMjIFqiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731957979; c=relaxed/simple;
	bh=k4FWmQBBRC2IRT+aWIxvHWm4chRWPPt0dNqncwYcmVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KkFQbNwBXg+r+28j9UiXuAbLmBCZ4QbHpcCATFdFaRD9sB0tE+x+Xq9lBdLoEB3sdl3DMKrCfoxtIQ/+gRzw2fPUO543USfnK5CvC5eIuJCqqWXqrrO8LQQTcvZBliK5TEUe//LaDmsLlI9bcSRv6qFquWxmhJ9NLpQB0sHGQkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YeOoZrFo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YeOoZrFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731957976; x=1763493976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k4FWmQBBRC2IRT+aWIxvHWm4chRWPPt0dNqncwYcmVI=;
  b=YeOoZrFoeUA1nVRHzTHw9Njl9dfUs4TgogV2lItG+3h5+j3b9orwAdOw
   EW6VQkz/Ful+zrJXfXozHjQ3M0oJq38bCFr4hCMtPxgneV9WT9QxQsGxZ
   t2xzMCb0GuSiAJkDC3hD/H/Jks4GTD9sVJ0C5invpcw147YqTJeVDqW1T
   g9TFra4ec9S53xCbtfLiERfsiwF9u57K16QMZBLyb0JBHZ1hafmNmfuo/
   naH08uI+mWlQseU3Mxx6wkf/qOzhW1M2mYRJKjdNBPN5lwVbfCgjClImh
   MZnQoGMWJpvSvbkaDBZkLxg8hygGU9KFe6Qat/m9YIkinUFtZvN4oAQ1j
   g==;
X-CSE-ConnectionGUID: drkKAdqWShCOZ2j1NrU+Sw==
X-CSE-MsgGUID: E6wj2FTqSLCii9k2VU5LrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54431071"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="54431071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 11:26:15 -0800
X-CSE-ConnectionGUID: UPQdNliySayFljcrxrMg+Q==
X-CSE-MsgGUID: MvImTuMITsuKHVTMem8Q5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94362706"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Nov 2024 11:26:16 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD7Nz-0002bp-3B;
	Mon, 18 Nov 2024 19:26:11 +0000
Date: Tue, 19 Nov 2024 03:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:master 9/20] mm/msync.c:90 __do_sys_msync() warn: comparison of
 a potentially tagged address (__do_sys_msync, -2, __UNIQUE_ID_x_604)
Message-ID: <202411190335.GID8hWfa-lkp@intel.com>
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
CC: x86@kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
head:   2aeea258b83dd16312692fc89a0f52e3fdb5f582
commit: 09d057dce716885db361d83875f7a0616cce6708 [9/20] Merge branch into tip/master: 'timers/core'
:::::: branch date: 2 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-r073-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190335.GID8hWfa-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411190335.GID8hWfa-lkp@intel.com/

smatch warnings:
mm/msync.c:90 __do_sys_msync() warn: comparison of a potentially tagged address (__do_sys_msync, -2, __UNIQUE_ID_x_604)
mm/msync.c:90 __do_sys_msync() warn: comparison of a potentially tagged address (__do_sys_msync, -2, __UNIQUE_ID_x_604)

vim +90 mm/msync.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  17  
^1da177e4c3f41 Linus Torvalds     2005-04-16  18  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  19   * MS_SYNC syncs the entire file - including mappings.
^1da177e4c3f41 Linus Torvalds     2005-04-16  20   *
204ec841fbea3e Peter Zijlstra     2006-09-25  21   * MS_ASYNC does not start I/O (it used to, up to 2.5.67).
204ec841fbea3e Peter Zijlstra     2006-09-25  22   * Nor does it marks the relevant pages dirty (it used to up to 2.6.17).
204ec841fbea3e Peter Zijlstra     2006-09-25  23   * Now it doesn't do anything, since dirty pages are properly tracked.
204ec841fbea3e Peter Zijlstra     2006-09-25  24   *
204ec841fbea3e Peter Zijlstra     2006-09-25  25   * The application may now run fsync() to
^1da177e4c3f41 Linus Torvalds     2005-04-16  26   * write out the dirty pages and wait on the writeout and check the result.
^1da177e4c3f41 Linus Torvalds     2005-04-16  27   * Or the application may run fadvise(FADV_DONTNEED) against the fd to start
^1da177e4c3f41 Linus Torvalds     2005-04-16  28   * async writeout immediately.
16538c40776b8b Amos Waterland     2006-03-24  29   * So by _not_ starting I/O in MS_ASYNC we provide complete flexibility to
^1da177e4c3f41 Linus Torvalds     2005-04-16  30   * applications.
^1da177e4c3f41 Linus Torvalds     2005-04-16  31   */
6a6160a7b5c27b Heiko Carstens     2009-01-14  32  SYSCALL_DEFINE3(msync, unsigned long, start, size_t, len, int, flags)
^1da177e4c3f41 Linus Torvalds     2005-04-16  33  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  34  	unsigned long end;
204ec841fbea3e Peter Zijlstra     2006-09-25  35  	struct mm_struct *mm = current->mm;
^1da177e4c3f41 Linus Torvalds     2005-04-16  36  	struct vm_area_struct *vma;
676758bdb7bfca Andrew Morton      2006-03-24  37  	int unmapped_error = 0;
676758bdb7bfca Andrew Morton      2006-03-24  38  	int error = -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  39  
057d3389108eda Andrey Konovalov   2019-09-25  40  	start = untagged_addr(start);
057d3389108eda Andrey Konovalov   2019-09-25  41  
^1da177e4c3f41 Linus Torvalds     2005-04-16  42  	if (flags & ~(MS_ASYNC | MS_INVALIDATE | MS_SYNC))
^1da177e4c3f41 Linus Torvalds     2005-04-16  43  		goto out;
b0d61c7e56815b Alexander Kuleshov 2015-11-05  44  	if (offset_in_page(start))
^1da177e4c3f41 Linus Torvalds     2005-04-16  45  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  46  	if ((flags & MS_ASYNC) && (flags & MS_SYNC))
^1da177e4c3f41 Linus Torvalds     2005-04-16  47  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  48  	error = -ENOMEM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  49  	len = (len + ~PAGE_MASK) & PAGE_MASK;
^1da177e4c3f41 Linus Torvalds     2005-04-16  50  	end = start + len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  51  	if (end < start)
^1da177e4c3f41 Linus Torvalds     2005-04-16  52  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  53  	error = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  54  	if (end == start)
^1da177e4c3f41 Linus Torvalds     2005-04-16  55  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  56  	/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  57  	 * If the interval [start,end) covers some unmapped address ranges,
f6899bc03cbadc Nikita Ermakov     2021-04-29  58  	 * just ignore them, but return -ENOMEM at the end. Besides, if the
f6899bc03cbadc Nikita Ermakov     2021-04-29  59  	 * flag is MS_ASYNC (w/o MS_INVALIDATE) the result would be -ENOMEM
f6899bc03cbadc Nikita Ermakov     2021-04-29  60  	 * anyway and there is nothing left to do, so return immediately.
^1da177e4c3f41 Linus Torvalds     2005-04-16  61  	 */
d8ed45c5dcd455 Michel Lespinasse  2020-06-08  62  	mmap_read_lock(mm);
204ec841fbea3e Peter Zijlstra     2006-09-25  63  	vma = find_vma(mm, start);
204ec841fbea3e Peter Zijlstra     2006-09-25  64  	for (;;) {
9c50823eebf7c2 Andrew Morton      2006-03-24  65  		struct file *file;
7fc34a62ca4434 Matthew Wilcox     2014-06-04  66  		loff_t fstart, fend;
9c50823eebf7c2 Andrew Morton      2006-03-24  67  
204ec841fbea3e Peter Zijlstra     2006-09-25  68  		/* Still start < end. */
204ec841fbea3e Peter Zijlstra     2006-09-25  69  		error = -ENOMEM;
204ec841fbea3e Peter Zijlstra     2006-09-25  70  		if (!vma)
204ec841fbea3e Peter Zijlstra     2006-09-25  71  			goto out_unlock;
^1da177e4c3f41 Linus Torvalds     2005-04-16  72  		/* Here start < vma->vm_end. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  73  		if (start < vma->vm_start) {
f6899bc03cbadc Nikita Ermakov     2021-04-29  74  			if (flags == MS_ASYNC)
f6899bc03cbadc Nikita Ermakov     2021-04-29  75  				goto out_unlock;
^1da177e4c3f41 Linus Torvalds     2005-04-16  76  			start = vma->vm_start;
204ec841fbea3e Peter Zijlstra     2006-09-25  77  			if (start >= end)
9c50823eebf7c2 Andrew Morton      2006-03-24  78  				goto out_unlock;
204ec841fbea3e Peter Zijlstra     2006-09-25  79  			unmapped_error = -ENOMEM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  80  		}
204ec841fbea3e Peter Zijlstra     2006-09-25  81  		/* Here vma->vm_start <= start < vma->vm_end. */
204ec841fbea3e Peter Zijlstra     2006-09-25  82  		if ((flags & MS_INVALIDATE) &&
204ec841fbea3e Peter Zijlstra     2006-09-25  83  				(vma->vm_flags & VM_LOCKED)) {
204ec841fbea3e Peter Zijlstra     2006-09-25  84  			error = -EBUSY;
9c50823eebf7c2 Andrew Morton      2006-03-24  85  			goto out_unlock;
9c50823eebf7c2 Andrew Morton      2006-03-24  86  		}
9c50823eebf7c2 Andrew Morton      2006-03-24  87  		file = vma->vm_file;
496a8e68654a5f Namjae Jeon        2014-07-02  88  		fstart = (start - vma->vm_start) +
496a8e68654a5f Namjae Jeon        2014-07-02  89  			 ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
7fc34a62ca4434 Matthew Wilcox     2014-06-04 @90  		fend = fstart + (min(end, vma->vm_end) - start) - 1;

:::::: The code at line 90 was first introduced by commit
:::::: 7fc34a62ca4434a79c68e23e70ed26111b7a4cf8 mm/msync.c: sync only the requested range in msync()

:::::: TO: Matthew Wilcox <matthew.r.wilcox@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
