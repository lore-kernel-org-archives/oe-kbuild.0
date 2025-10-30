Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E769F2DEA8E
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761824958; cv=none; b=WIweR57NNTx6ON63IHJDa4cmJD8p2poFzL/oQQ9yaUlR5Ys4trfujpPqhczPwc7gsmTw4/63qQOSH81DAJDdmJRrmyrfTy8WeCT531Gd71LaPFrsEYjSTK0gCrsjMJhhuXL6Ko7vMmwEu9cmqnwyt4gMnHd03x6rqAxWkM6kHuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761824958; c=relaxed/simple;
	bh=QBtZYZtFQj6lrHCGynreUtM4u4+oMbQTAWbYfnzMb8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dYjHtrLtkvhUkRSKB5EA/hC8GMIvoGmN1uxL9SiYBzII07jw5IqaCeb5/RWWMS1uXtoqyDixeFW9fOdSqOcLAaNhXbcnVJP53MM4jTVsREndsbj8VFXHV0uD4hU8572yz82VSOkcQOjErET1z5QAvFY4itFXhA7em07bH98oEj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlTRviKO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlTRviKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761824956; x=1793360956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QBtZYZtFQj6lrHCGynreUtM4u4+oMbQTAWbYfnzMb8g=;
  b=VlTRviKOn6GqkQs0fquBjO0h1aaJ/2sWiEuqchzr+N6Bkmso4at4LOLQ
   KO3C18Q7TvndwbNmFbSG7RfvshL+lfxnzGmHUa4xeC8okD54oaMS7/HDl
   GgXy76T6Gbh/b5tjcizMTNrJRj4V+Er3rptUc5zaTBwt84BcWPzDK+YME
   UPX2iOpv0VaCcAeB8qGW3ldqZFs4m1fJyge85iOtSkCbBd22X9Sg3Qmd3
   GX+fTM7rsgVNGKf6ft/nLViQxx5X9ruCuSOxLMUkp209nOAi7ruXu6ClD
   vOwSYDKfeC6zOcJ31gZlRIHL8JiS4kCvlPFvhXrxewj5XSqa1/2F6j99J
   w==;
X-CSE-ConnectionGUID: ZYs0KAY7Tru7HI1F0bXpWg==
X-CSE-MsgGUID: nIoLUK0UTbyKTm2sdOjUpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63892505"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63892505"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 04:49:15 -0700
X-CSE-ConnectionGUID: i8S2I6Q0Ri6rHWxKeh1nKA==
X-CSE-MsgGUID: 3fmk+EUGRo2GYajVz0G4KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="185816307"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 Oct 2025 04:49:13 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vER97-000Lw8-0R;
	Thu, 30 Oct 2025 11:49:09 +0000
Date: Thu, 30 Oct 2025 19:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 3064/3064] mm/msync.c:90 __do_sys_msync() warn:
 comparison of a potentially tagged address (__do_sys_msync, -2,
 __UNIQUE_ID___x436)
Message-ID: <202510301957.txP3x13d-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Chen Ridong <chenridong@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f38ece6b510adaa28c8e625ff574fe6357a3960
commit: 6abcadeace05fe71bd35fe1e104bce91633632d5 [3064/3064] ucount: use RCU for ucounts lookups
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251030/202510301957.txP3x13d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510301957.txP3x13d-lkp@intel.com/

New smatch warnings:
mm/msync.c:90 __do_sys_msync() warn: comparison of a potentially tagged address (__do_sys_msync, -2, __UNIQUE_ID___x436)
mm/msync.c:90 __do_sys_msync() warn: comparison of a potentially tagged address (__do_sys_msync, -2, __UNIQUE_ID___x436)
fs/userfaultfd.c:1542 userfaultfd_register() warn: comparison of a potentially tagged address (userfaultfd_register, -2, __UNIQUE_ID___x513)
fs/userfaultfd.c:1711 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, __UNIQUE_ID___x516)

Old smatch warnings:
fs/userfaultfd.c:1485 userfaultfd_register() warn: comparison of a potentially tagged address (userfaultfd_register, -2, end)
fs/userfaultfd.c:1520 userfaultfd_register() warn: comparison of a potentially tagged address (userfaultfd_register, -2, start)
fs/userfaultfd.c:1540 userfaultfd_register() warn: comparison of a potentially tagged address (userfaultfd_register, -2, start)
fs/userfaultfd.c:1556 userfaultfd_register() warn: comparison of a potentially tagged address (userfaultfd_register, -2, start)
fs/userfaultfd.c:1561 userfaultfd_register() warn: comparison of a potentially tagged address (userfaultfd_register, -2, end)
fs/userfaultfd.c:1691 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, start)
fs/userfaultfd.c:1709 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, start)
fs/userfaultfd.c:1740 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, start)
fs/userfaultfd.c:1745 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, end)

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
