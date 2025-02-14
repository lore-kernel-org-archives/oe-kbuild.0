Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CC8263C9D
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739534411; cv=none; b=c9vYJtOhz4hZJzQnsgZl5kt3d13YeYWV02c7loFIAYUkAQg8PG6syg+GzfdI88ElONbRgwsvjU7nRSU0IWwnabXoI6zXMfcN7WFc8t+vP8Ctmhtq//f0ubDdy8ahOvDp470Gn/JL5X3q6dzu/1IuTYzkNASHijEivriUiuzWQFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739534411; c=relaxed/simple;
	bh=TkYWDnvfff6cQ5MWmy5UvLee0KFawbVk7LfQB9/jU24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KFNcKaklcD8EjRJekuDuyFlJc4HzOgYk3fQvjObwxUU4iPo3sR7/UZS0YCij8lkIQN4k8wKpMuKKulncp2JswcIlJ7HrhKau/yKtvKWCXD4y5JfxuAtjmnYBSOrs7MtfeZKcYs+4SQg5N0qOEOhUFWMurj0Ur9wN7xE2ZHTAGqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjVE3dOs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjVE3dOs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739534409; x=1771070409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TkYWDnvfff6cQ5MWmy5UvLee0KFawbVk7LfQB9/jU24=;
  b=VjVE3dOsj4PKDlEwksvLwvPU5qAl9qfkApkbUG+JGsBjihhYmTTQoyRm
   ttjaAa9fVhc12n4mIsfFie+Dh1LIit8U4vx22qlJzqzOwZQAYzHUcZhPq
   8wQE5sr+55Y5fPRiAFq1gA57IfID/RdXtRgLXxQSznEGVlcIwUfgr5GqA
   igrs+qoxS7n/Vcm1lZCbRkOULCv+7lHSVkRQtlA0awReTYipfdVJmVXFv
   zjJPX+dnyHeSECHBp/XZte2ORydXaXnStKyVhpC/ed7Sb4ShF4w26x0U9
   7Kf+67dofZSf5Noa/xq2Rb3eGZYEMDwn6gH9Yy6GCiPne+Y5iCkJpD/He
   w==;
X-CSE-ConnectionGUID: ssKBRy6RRCWIFMvb/baaqQ==
X-CSE-MsgGUID: UfQXZhUlRUeAQvJdvB4RyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50493965"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="50493965"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 04:00:08 -0800
X-CSE-ConnectionGUID: x7S2/86QQsynFX5hnZV+ag==
X-CSE-MsgGUID: mlBLzxOvRL2H4LPjLX0wrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="118373790"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Feb 2025 04:00:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiuMW-0019Vb-2E;
	Fri, 14 Feb 2025 12:00:04 +0000
Date: Fri, 14 Feb 2025 19:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rcu:srcu.2025.02.04a 12/19] mm/msync.c:90 __do_sys_msync() warn:
 comparison of a potentially tagged address (__do_sys_msync, -2,
 __UNIQUE_ID_x_663)
Message-ID: <202502141906.jAZQbTVd-lkp@intel.com>
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
TO: "Paul E. McKenney" <paulmck@kernel.org>
CC: Boqun Feng <boqun.feng@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git srcu.2025.02.04a
head:   3f3deb5de0d5b93457c54a784f55fa82c0e17148
commit: 660b0e66d9927f84f59027602de07bb07754b8f7 [12/19] srcu: Add SRCU-fast readers
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-r073-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141906.jAZQbTVd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502141906.jAZQbTVd-lkp@intel.com/

smatch warnings:
mm/msync.c:90 __do_sys_msync() warn: comparison of a potentially tagged address (__do_sys_msync, -2, __UNIQUE_ID_x_663)
mm/msync.c:90 __do_sys_msync() warn: comparison of a potentially tagged address (__do_sys_msync, -2, __UNIQUE_ID_x_663)

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
