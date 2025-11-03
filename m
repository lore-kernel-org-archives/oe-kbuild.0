Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C5E26B742
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Nov 2025 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762187785; cv=none; b=aaHjMqkB+UXtn15ktQsr2GVIWAYGqorX/vbpMHHSEipLK9fXKgTB/0y5wta8RW+XR3xpVpfdn3u06hPXW0rY9SuIzIeNifS/PEQ1zvIAQnyfZpKy4yJnGNVuzWMzMMOl0C1PtXOZZtp2TsoebeIe/dQ5YG8NapkP37t5RKGcyVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762187785; c=relaxed/simple;
	bh=Qbrdt14tGCg7xE+KfB04PCtu9tZbNmeBkaBtqYNX+WM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t4UdD++ZmMIJYCAjppGq3+I6BpBWupZfyxXtWujcnKIFImCeqQAg604E1BPhtRMWddP4GgDuna/9YMjs0swGkK3qTtwXeQfx4QaI40eHQgNaUX81Igf3KtIArwNRTdEmh2n+rcPucV65U/Gr+ww56PFnWPgp3DNEepna+tQhDLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJl0EgxJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJl0EgxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762187784; x=1793723784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qbrdt14tGCg7xE+KfB04PCtu9tZbNmeBkaBtqYNX+WM=;
  b=UJl0EgxJHmdMsZnxWXa1g1fYmPT4TzTjKeJOZOPDWJ5q0CI22ubbQ0zq
   HfgtTghZfGOBi7bsknkAANE2SZeGd8DJmo9j9GuRj5SvlR/fCem1/+q7C
   1SF+7n3r53ms6ROEk7k/QMaMDnrehCQAFSXroOjpGHLxC1YAaIBCX2ql4
   g+D3S8brGb41vxiApmJxyXuzqoyD7nNxjsxtQ/G4dIUkcvSRGAEUuLdXu
   7Nx5ZUwZK0fNkhGzAubVvAPlXgTUmDaZAfVj+lDbUHGeCUbeDEwWCqpfK
   AotiGtEFAi/YtbDUwFRyxzNrg05sXodDIYs4X1rlOo+ccfDc71RolYnqJ
   A==;
X-CSE-ConnectionGUID: s2ctkZxARlWuw9jPz1yiCQ==
X-CSE-MsgGUID: WCa2qwE4R5aaJvedRlRaKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63280770"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="63280770"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 08:36:23 -0800
X-CSE-ConnectionGUID: b5vPxmugTGugTegSq4z6AA==
X-CSE-MsgGUID: q+2tZ3o2TqqNcOZDF72X1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="191003872"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Nov 2025 08:36:22 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFxXK-000QLO-0j;
	Mon, 03 Nov 2025 16:36:11 +0000
Date: Tue, 4 Nov 2025 00:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hying-caritas:opt-wp-tlb-r3a 2/2] mm/msync.c:90 __do_sys_msync()
 warn: comparison of a potentially tagged address (__do_sys_msync, -2,
 __UNIQUE_ID_x_922)
Message-ID: <202511040048.PAhZJD7j-lkp@intel.com>
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
TO: Huang Ying <ying.huang@linux.alibaba.com>
CC: Ryan Roberts <ryan.roberts@arm.com>
CC: Barry Song <baohua@kernel.org>

tree:   https://github.com/hying-caritas/linux.git opt-wp-tlb-r3a
head:   27f1c46a5ed57e6407308cd158ef1b091f51a34b
commit: 27f1c46a5ed57e6407308cd158ef1b091f51a34b [2/2] arm64, tlbflush: don't TLBI broadcast if page reused in write fault
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm64-randconfig-r072-20251103 (https://download.01.org/0day-ci/archive/20251104/202511040048.PAhZJD7j-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511040048.PAhZJD7j-lkp@intel.com/

smatch warnings:
mm/msync.c:90 __do_sys_msync() warn: comparison of a potentially tagged address (__do_sys_msync, -2, __UNIQUE_ID_x_922)
mm/msync.c:90 __do_sys_msync() warn: comparison of a potentially tagged address (__do_sys_msync, -2, __UNIQUE_ID_x_922)

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
