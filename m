Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114BC2749C1
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Dec 2025 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767105006; cv=none; b=snOc501kU7LQkk/TyTD2qVnVdAtc5ni3/9TAX36AGOZycRs5tRsyn3UrYzbcBjcmvJibEabc6nrYSmLoEZCNP/9dlKbBm158P57BtdjXsA9sjjNOquexalR4r6vbyjA9gCsMiU/qFZXvplyy6hwg3K6W15HNDwmrNvbErGcDqKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767105006; c=relaxed/simple;
	bh=0GfSD2LRAJ0wb4TF3HV5KnZF0a/PugppAB2FXSC4a2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UKplxKIPFS23zV9t4VLIbCNdAzBefPc0MerssSMlYqXzB97nXnIYy2E3W6KwhyFBE89xQwvJFR3zfyZ2dzxBR9RW2oahekv7eKIEy/ikMqieEObiwOtT8pHouV6Gqiyxr95afuTQMesyZb+4/26Ja9DhL2tP5CH0jLkh1PcGroo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jg10Pu/K; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jg10Pu/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767105004; x=1798641004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0GfSD2LRAJ0wb4TF3HV5KnZF0a/PugppAB2FXSC4a2M=;
  b=Jg10Pu/KXDgk/ibMkBP4Qu4/dl3kFBoAbnnI9YQNvlWkLEG4tdCufRZn
   o1zhVSoI8ETQL47BQwQMuE8Xf1TpCIkbTYgJjYZl8OPWoN6yKVAEICHBZ
   H54neBKAcWX7jNu1bOn5si3DowCw3HrzH/Ld/ip8YjxxsnQs/SKX1dbOp
   /6WKn87sHdbAihnLb2WHswuGOpss3vxLop45bB9LnfTJTukNnhFqU6G5J
   QgfbCrFMq3/GTxTkjdUn9CyAt7qaqftRhRC70iMYRG6bOzdkghe9RdN5s
   a8r5P25hVULYMbYQafzzkXLpPbbYT0f44D9iwQFTYuMKJ478JEYUUgrWf
   A==;
X-CSE-ConnectionGUID: o4kpcl2KT8WVmPZh3FFSZQ==
X-CSE-MsgGUID: pAzvL1SFQEebsnNnM5dt4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="67697367"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="67697367"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 06:30:03 -0800
X-CSE-ConnectionGUID: /5I8Qh+gQS+Ti51QzZQ6Xg==
X-CSE-MsgGUID: 4G57d8m6S6CSOjL9pkUULA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="206278811"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Dec 2025 06:30:02 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaajX-000000000SL-26GJ;
	Tue, 30 Dec 2025 14:29:59 +0000
Date: Tue, 30 Dec 2025 22:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] mm/memcg: scale memory.high penalty based on refault
 recency
Message-ID: <202512302204.0Hly34Fm-lkp@intel.com>
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
In-Reply-To: <20251229033957.296257-1-jiayuan.chen@linux.dev>
References: <20251229033957.296257-1-jiayuan.chen@linux.dev>
TO: Jiayuan Chen <jiayuan.chen@linux.dev>
TO: linux-mm@kvack.org
CC: Jiayuan Chen <jiayuan.chen@shopee.com>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: Michal Hocko <mhocko@kernel.org>
CC: Roman Gushchin <roman.gushchin@linux.dev>
CC: Shakeel Butt <shakeel.butt@linux.dev>
CC: Muchun Song <muchun.song@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@kernel.org>
CC: Qi Zheng <zhengqi.arch@bytedance.com>
CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Axel Rasmussen <axelrasmussen@google.com>
CC: Yuanchu Xie <yuanchu@google.com>
CC: Wei Xu <weixugc@google.com>
CC: cgroups@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Jiayuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiayuan-Chen/mm-memcg-scale-memory-high-penalty-based-on-refault-recency/20251229-115015
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251229033957.296257-1-jiayuan.chen%40linux.dev
patch subject: [PATCH v2] mm/memcg: scale memory.high penalty based on refault recency
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-r072-20251230 (https://download.01.org/0day-ci/archive/20251230/202512302204.0Hly34Fm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512302204.0Hly34Fm-lkp@intel.com/

smatch warnings:
mm/msync.c:90 __do_sys_msync() warn: comparison of a potentially tagged address (__do_sys_msync, -2, __UNIQUE_ID_x__781)
mm/msync.c:90 __do_sys_msync() warn: comparison of a potentially tagged address (__do_sys_msync, -2, __UNIQUE_ID_x__781)

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
