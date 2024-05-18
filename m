Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7F1637
	for <oe-kbuild@lists.linux.dev>; Sat, 18 May 2024 00:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715993081; cv=none; b=jKQ2JoN1B/yH3Z2+5ReIBiiHeoIoAQA9UxM11gItstH/73Sysgby8ghAA+7W9YQ97gAbwPl+gqNPBwI9rB1cse02mn7GmR1VnH95isMvu4j+ew6DYUcVkpmL2eYUx102wW9bsRtmirbG5d3ie4ByrVtoy6gELCsvh/Xn0WwDdgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715993081; c=relaxed/simple;
	bh=s57a2PUPc5R+CjYKW6Doo+xaU8oWqtGjgDpQwi3lHBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G4/0BjRWoRD1UzBfKi7uCprFAEZ4mRIAA3flR2e6sSVdH2eXnteLPaOLPcuNjZ5aXmDsGFWbu5ffzdrpHrnU8kLDZV3cFVIQwcjwmSF5WllsVgyVAN1iKkqsCTpqrc7qf4O23tcJtjhCCSlusH76eo2HeqNOt9w1OvMTqH8tHcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXtN/5Oi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXtN/5Oi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715993079; x=1747529079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s57a2PUPc5R+CjYKW6Doo+xaU8oWqtGjgDpQwi3lHBA=;
  b=eXtN/5Oi7H+C9f4qqysDm7t5ON5vQZyvqJOBc0FdECp5gn4QV/IbZDp7
   VhNp1EYMG3UFD9ssOzU+ZMiR2L0cPwOYcWZALOZtB973peBbtnzT+1VU2
   63wFQ2RzKITA8GyoONV0VDv0/QV22NjQFcfJo4/Xiqzf6/jqlOoSQnVlF
   25chgJBIU0qE64xSZwWrzIYDnOrXeowmq7sMBp1Q8+mi/WqCHuRuqITTK
   ftJ/EfwYNiIIRxHKGDamrwLzgAEPKC5kpwcWBtGK7cWdh6poXI5sDrDFT
   ffp05JBIlXcLGzH9ptc5Gy0Q1moiF5JyXwoNTGULz6MRjWih1qKoT4zzV
   w==;
X-CSE-ConnectionGUID: 7MutmN36R1CdR+v7sXPQIg==
X-CSE-MsgGUID: auvWEDiMQQuam1r6Iya7FQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="15985411"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="15985411"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 17:44:38 -0700
X-CSE-ConnectionGUID: 18At2X2JTLSZnkuryh6C5w==
X-CSE-MsgGUID: cerKnbV0S7adcm67yds2CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="31868873"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 May 2024 17:44:36 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s88B8-0001S0-30;
	Sat, 18 May 2024 00:44:08 +0000
Date: Sat, 18 May 2024 08:43:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [crng-random:vdso-droppable 5/10] mm/memory.c:5606 handle_mm_fault()
 warn: bitwise AND condition is false here
Message-ID: <202405180817.5q2jnk35-lkp@intel.com>
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

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git vdso-droppable
head:   a7eca399da39972132d1fb50f4160b86b7498198
commit: b6309ec1cf280cca230a49f06915930114ff3a29 [5/10] mm: add VM_DROPPABLE for designating always lazily freeable mappings
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-141-20240518 (https://download.01.org/0day-ci/archive/20240518/202405180817.5q2jnk35-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405180817.5q2jnk35-lkp@intel.com/

smatch warnings:
mm/memory.c:5606 handle_mm_fault() warn: bitwise AND condition is false here
mm/rmap.c:1414 folio_add_new_anon_rmap() warn: bitwise AND condition is false here
mm/rmap.c:1840 try_to_unmap_one() warn: bitwise AND condition is false here

vim +5606 mm/memory.c

cdc5021cda1941 David Hildenbrand       2022-11-16  5562  
9a95f3cf7b33d6 Paul Cassella           2014-08-06  5563  /*
9a95f3cf7b33d6 Paul Cassella           2014-08-06  5564   * By the time we get here, we already hold the mm semaphore
9a95f3cf7b33d6 Paul Cassella           2014-08-06  5565   *
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  5566   * The mmap_lock may have been released depending on flags and our
9138e47ed42524 Matthew Wilcox (Oracle  2021-03-18  5567)  * return value.  See filemap_fault() and __folio_lock_or_retry().
9a95f3cf7b33d6 Paul Cassella           2014-08-06  5568   */
2b7403035459c7 Souptick Joarder        2018-08-23  5569  vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
bce617edecada0 Peter Xu                2020-08-11  5570  			   unsigned int flags, struct pt_regs *regs)
519e52473ebe9d Johannes Weiner         2013-09-12  5571  {
53156443a30368 Suren Baghdasaryan      2023-04-19  5572  	/* If the fault handler drops the mmap_lock, vma may be freed */
53156443a30368 Suren Baghdasaryan      2023-04-19  5573  	struct mm_struct *mm = vma->vm_mm;
2b7403035459c7 Souptick Joarder        2018-08-23  5574  	vm_fault_t ret;
519e52473ebe9d Johannes Weiner         2013-09-12  5575  
519e52473ebe9d Johannes Weiner         2013-09-12  5576  	__set_current_state(TASK_RUNNING);
519e52473ebe9d Johannes Weiner         2013-09-12  5577  
cdc5021cda1941 David Hildenbrand       2022-11-16  5578  	ret = sanitize_fault_flags(vma, &flags);
cdc5021cda1941 David Hildenbrand       2022-11-16  5579  	if (ret)
53156443a30368 Suren Baghdasaryan      2023-04-19  5580  		goto out;
cdc5021cda1941 David Hildenbrand       2022-11-16  5581  
de0c799bba2610 Laurent Dufour          2017-09-08  5582  	if (!arch_vma_access_permitted(vma, flags & FAULT_FLAG_WRITE,
de0c799bba2610 Laurent Dufour          2017-09-08  5583  					    flags & FAULT_FLAG_INSTRUCTION,
53156443a30368 Suren Baghdasaryan      2023-04-19  5584  					    flags & FAULT_FLAG_REMOTE)) {
53156443a30368 Suren Baghdasaryan      2023-04-19  5585  		ret = VM_FAULT_SIGSEGV;
53156443a30368 Suren Baghdasaryan      2023-04-19  5586  		goto out;
53156443a30368 Suren Baghdasaryan      2023-04-19  5587  	}
de0c799bba2610 Laurent Dufour          2017-09-08  5588  
519e52473ebe9d Johannes Weiner         2013-09-12  5589  	/*
519e52473ebe9d Johannes Weiner         2013-09-12  5590  	 * Enable the memcg OOM handling for faults triggered in user
519e52473ebe9d Johannes Weiner         2013-09-12  5591  	 * space.  Kernel faults are handled more gracefully.
519e52473ebe9d Johannes Weiner         2013-09-12  5592  	 */
519e52473ebe9d Johannes Weiner         2013-09-12  5593  	if (flags & FAULT_FLAG_USER)
29ef680ae7c211 Michal Hocko            2018-08-17  5594  		mem_cgroup_enter_user_fault();
519e52473ebe9d Johannes Weiner         2013-09-12  5595  
ec1c86b25f4bdd Yu Zhao                 2022-09-18  5596  	lru_gen_enter_fault(vma);
ec1c86b25f4bdd Yu Zhao                 2022-09-18  5597  
bae473a423f65e Kirill A. Shutemov      2016-07-26  5598  	if (unlikely(is_vm_hugetlb_page(vma)))
bae473a423f65e Kirill A. Shutemov      2016-07-26  5599  		ret = hugetlb_fault(vma->vm_mm, vma, address, flags);
bae473a423f65e Kirill A. Shutemov      2016-07-26  5600  	else
dcddffd41d3f1d Kirill A. Shutemov      2016-07-26  5601  		ret = __handle_mm_fault(vma, address, flags);
519e52473ebe9d Johannes Weiner         2013-09-12  5602  
ec1c86b25f4bdd Yu Zhao                 2022-09-18  5603  	lru_gen_exit_fault();
ec1c86b25f4bdd Yu Zhao                 2022-09-18  5604  
b6309ec1cf280c Jason A. Donenfeld      2022-12-08  5605  	/* If the mapping is droppable, then errors due to OOM aren't fatal. */
b6309ec1cf280c Jason A. Donenfeld      2022-12-08 @5606  	if ((ret & VM_FAULT_OOM) && (vma->vm_flags & VM_DROPPABLE)) {
b6309ec1cf280c Jason A. Donenfeld      2022-12-08  5607  		ret &= ~VM_FAULT_OOM;
b6309ec1cf280c Jason A. Donenfeld      2022-12-08  5608  		ret |= VM_FAULT_SKIP_INSN;
b6309ec1cf280c Jason A. Donenfeld      2022-12-08  5609  	}
b6309ec1cf280c Jason A. Donenfeld      2022-12-08  5610  
4942642080ea82 Johannes Weiner         2013-10-16  5611  	if (flags & FAULT_FLAG_USER) {
29ef680ae7c211 Michal Hocko            2018-08-17  5612  		mem_cgroup_exit_user_fault();
4942642080ea82 Johannes Weiner         2013-10-16  5613  		/*
4942642080ea82 Johannes Weiner         2013-10-16  5614  		 * The task may have entered a memcg OOM situation but
4942642080ea82 Johannes Weiner         2013-10-16  5615  		 * if the allocation error was handled gracefully (no
4942642080ea82 Johannes Weiner         2013-10-16  5616  		 * VM_FAULT_OOM), there is no need to kill anything.
4942642080ea82 Johannes Weiner         2013-10-16  5617  		 * Just clean up the OOM state peacefully.
4942642080ea82 Johannes Weiner         2013-10-16  5618  		 */
4942642080ea82 Johannes Weiner         2013-10-16  5619  		if (task_in_memcg_oom(current) && !(ret & VM_FAULT_OOM))
4942642080ea82 Johannes Weiner         2013-10-16  5620  			mem_cgroup_oom_synchronize(false);
4942642080ea82 Johannes Weiner         2013-10-16  5621  	}
53156443a30368 Suren Baghdasaryan      2023-04-19  5622  out:
53156443a30368 Suren Baghdasaryan      2023-04-19  5623  	mm_account_fault(mm, regs, address, flags, ret);
bce617edecada0 Peter Xu                2020-08-11  5624  
519e52473ebe9d Johannes Weiner         2013-09-12  5625  	return ret;
519e52473ebe9d Johannes Weiner         2013-09-12  5626  }
e1d6d01ab491be Jesse Barnes            2014-12-12  5627  EXPORT_SYMBOL_GPL(handle_mm_fault);
519e52473ebe9d Johannes Weiner         2013-09-12  5628  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
