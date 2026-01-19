Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3251991CB
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 00:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768782512; cv=none; b=kVcXZsfv2Jx1BhTpfqFq+UerdoaD0m/rOKv0pvwV6uIZzs6rl3+vJvXhFjMCXh1VhfRaj7CGdoZvQKrMgbUTuVB9jzxnA2um6eDpXMhXOnUi4FNfMXPTnHKngStg2ybLMGs1lQQPc9SW3WhvQ8c2uXZyjvrttdtScq0oQiWW7QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768782512; c=relaxed/simple;
	bh=lN2YBfm31oqV+7r2/a2OteFa4ceMQHmmBZL88TqYYBI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jc+V6Cox3kVfzJRwl60owMW+Or5yIIXqC45frLTFlFrjK8tIJf48to52qxC18ef59LVhOWbDivLSfea02rPvzqCfLJzlIaIGYB+U0w+4SN/SMjCR7pcHeVBmAcHDL2KFWJwxDlWu0wp5G48h4jhmniBfCjA0UBKDylMnZJL3Rmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFdPhys4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFdPhys4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768782510; x=1800318510;
  h=date:from:to:cc:subject:message-id;
  bh=lN2YBfm31oqV+7r2/a2OteFa4ceMQHmmBZL88TqYYBI=;
  b=VFdPhys4Zig2Dyd9cd1VEWcfWMBu3nzmkK2QUcCiQ5g/0dVfZsmh6EMJ
   820g6Du5JAEnVKmBAXo96zAS+MpmotOOj194CpVje4HBjON2cM/tL66Qa
   UxEhv/DBh2Fy4NGvFN/bIjfPcY+KEy3zXOdfdCphvwGAkvW88woGkAkMJ
   ghewbolqi28coFoxhMfa5IuFWYwH7eWTx9Xuw/7CNHUpuuS9kKv46g0P1
   XlbzSCcEGan/bMGc5uuk9LBA1acEujC7mmlqHPu8MSgpqu5Wt0IrVTUDD
   bzYXJyu5AnCZQAR7YCA+CL3+ZilO8S0ygWdxf5rPOq9ZN6ee5lwoGDgaV
   w==;
X-CSE-ConnectionGUID: KbPRlUKXQVOhKlTIBJR/8w==
X-CSE-MsgGUID: qIri++WpRieOFy63ZeYcnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87571848"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="87571848"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 16:28:29 -0800
X-CSE-ConnectionGUID: rok1bfNLSsKvpIaWM51x2A==
X-CSE-MsgGUID: smR8h3AyRCOR/mC6Nf3eYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="237005897"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jan 2026 16:28:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhd86-00000000NJ7-0rM6;
	Mon, 19 Jan 2026 00:28:26 +0000
Date: Mon, 19 Jan 2026 08:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rppt:uffd/refactor/v0.2 1/11] mm/userfaultfd.c:271
 mfill_copy_folio_locked() warn: maybe return -EFAULT instead of the bytes
 remaining?
Message-ID: <202601190828.nHc6Gmw1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Mike Rapoport <rppt@kernel.org>
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd/refactor/v0.2
head:   2db3a86a6de3247449e068d998305d26481c5522
commit: 46089d290ec3dea8bdbe9a706e3a8247f6c40490 [1/11] userfaultfd: introduce mfill_copy_folio_locked() helper
:::::: branch date: 5 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-161-20260119 (https://download.01.org/0day-ci/archive/20260119/202601190828.nHc6Gmw1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601190828.nHc6Gmw1-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:271 mfill_copy_folio_locked() warn: maybe return -EFAULT instead of the bytes remaining?

vim +271 mm/userfaultfd.c

153132571f0204d Axel Rasmussen            2021-06-30  240  
46089d290ec3dea Mike Rapoport (Microsoft  2026-01-08  241) static int mfill_copy_folio_locked(struct folio *folio, unsigned long src_addr)
c1a4de99fada21e Andrea Arcangeli          2015-09-04  242  {
07e6d4095c75bcf ZhangPeng                 2023-04-10  243  	void *kaddr;
c1a4de99fada21e Andrea Arcangeli          2015-09-04  244  	int ret;
c1a4de99fada21e Andrea Arcangeli          2015-09-04  245  
07e6d4095c75bcf ZhangPeng                 2023-04-10  246  	kaddr = kmap_local_folio(folio, 0);
5521de7dddd211e Ira Weiny                 2022-10-23  247  	/*
5521de7dddd211e Ira Weiny                 2022-10-23  248  	 * The read mmap_lock is held here.  Despite the
5521de7dddd211e Ira Weiny                 2022-10-23  249  	 * mmap_lock being read recursive a deadlock is still
5521de7dddd211e Ira Weiny                 2022-10-23  250  	 * possible if a writer has taken a lock.  For example:
5521de7dddd211e Ira Weiny                 2022-10-23  251  	 *
5521de7dddd211e Ira Weiny                 2022-10-23  252  	 * process A thread 1 takes read lock on own mmap_lock
5521de7dddd211e Ira Weiny                 2022-10-23  253  	 * process A thread 2 calls mmap, blocks taking write lock
5521de7dddd211e Ira Weiny                 2022-10-23  254  	 * process B thread 1 takes page fault, read lock on own mmap lock
5521de7dddd211e Ira Weiny                 2022-10-23  255  	 * process B thread 2 calls mmap, blocks taking write lock
5521de7dddd211e Ira Weiny                 2022-10-23  256  	 * process A thread 1 blocks taking read lock on process B
5521de7dddd211e Ira Weiny                 2022-10-23  257  	 * process B thread 1 blocks taking read lock on process A
5521de7dddd211e Ira Weiny                 2022-10-23  258  	 *
5521de7dddd211e Ira Weiny                 2022-10-23  259  	 * Disable page faults to prevent potential deadlock
5521de7dddd211e Ira Weiny                 2022-10-23  260  	 * and retry the copy outside the mmap_lock.
5521de7dddd211e Ira Weiny                 2022-10-23  261  	 */
5521de7dddd211e Ira Weiny                 2022-10-23  262  	pagefault_disable();
07e6d4095c75bcf ZhangPeng                 2023-04-10  263  	ret = copy_from_user(kaddr, (const void __user *) src_addr,
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  264  			     PAGE_SIZE);
5521de7dddd211e Ira Weiny                 2022-10-23  265  	pagefault_enable();
07e6d4095c75bcf ZhangPeng                 2023-04-10  266  	kunmap_local(kaddr);
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  267  
46089d290ec3dea Mike Rapoport (Microsoft  2026-01-08  268) 	if (!ret)
46089d290ec3dea Mike Rapoport (Microsoft  2026-01-08  269) 		flush_dcache_folio(folio);
46089d290ec3dea Mike Rapoport (Microsoft  2026-01-08  270) 
46089d290ec3dea Mike Rapoport (Microsoft  2026-01-08 @271) 	return ret;
46089d290ec3dea Mike Rapoport (Microsoft  2026-01-08  272) }
46089d290ec3dea Mike Rapoport (Microsoft  2026-01-08  273) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
