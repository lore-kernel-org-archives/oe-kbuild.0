Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273EB11193
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Apr 2024 09:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711964878; cv=none; b=E3YF9zlwlUL13IOD9tYadi8EXAmYrTt6LhEa2QOWPLflU2KZpUqRvPUfJihw8DAwW294YjJ09Sd+V4bVU53LlH8jhe6dPJIKTchfoedZZJiEcLfWY8mBB+EkDbJTgO2CitUXIkLYVClI7HcojdZRHBGuW679hy8AP5Ec3E3KWFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711964878; c=relaxed/simple;
	bh=Q5Aq4U7hhZ9/ZqouclKqnNoTqGDn9DRWgHKMh1jvnaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fbDF6csmjfMKCDkTukjxBjYmKjfy3fg18SPKW1i2oYK22D2klux1Vp/epW8VTQlkOv0Zpkq2Xo/l2IFfaQZzq+22OjAVDJGanBmIHH/vK2kxbTD7+GtSG1laSLEQEj4Aub5uvacSNKwVxvRoUBex9cDuQoVBX3oz35ZBt462e08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5Ze0bQJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5Ze0bQJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711964876; x=1743500876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q5Aq4U7hhZ9/ZqouclKqnNoTqGDn9DRWgHKMh1jvnaU=;
  b=E5Ze0bQJF7fjg89alvqKE8/8EZIb3lTS//RjGZttgx5oEbPohT20gAQ5
   /WqRh36ONni+7FqBOLD23zW1WF8TcCKYUiHRZ/CanBEXdvKn6XqRdc3Fq
   J2M/TJau9YJ2MasGvvUpRIOJ7Ym/p9ijLmy8f07F82nzlZROPQRiDxZSC
   sJa1qXwTOA+/al61E6ngw4JEiucwgI+hWMLruPOpHECLZkGCARWz/rUFR
   IQv/6ieQd7vvyMdGNqv82pK5fmlxFHL3t445Zprq8j/ummIWe9vaX60fN
   ROSu6RG717JLZ5XMgVVntta74BMzSZCno2/hpoXiPGRIKDZL5NzutrCHS
   g==;
X-CSE-ConnectionGUID: em6xQSYvQIq0B3ArJJFGjA==
X-CSE-MsgGUID: Y1ZoBvJSScaB73qJWzacwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="6980784"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="6980784"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 02:47:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="17754188"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Apr 2024 02:47:54 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrEGd-0000Dh-3D;
	Mon, 01 Apr 2024 09:47:52 +0000
Date: Mon, 1 Apr 2024 17:47:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 2/2] s390/mm: re-enable the shared zeropage for !PV
 and !skeys KVM guests
Message-ID: <202404011730.2TEIocud-lkp@intel.com>
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
In-Reply-To: <20240321215954.177730-3-david@redhat.com>
References: <20240321215954.177730-3-david@redhat.com>
TO: David Hildenbrand <david@redhat.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvms390/next]
[also build test WARNING on s390/features linus/master v6.9-rc2]
[cannot apply to akpm-mm/mm-everything next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/mm-userfaultfd-don-t-place-zeropages-when-zeropages-are-disallowed/20240322-060251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git next
patch link:    https://lore.kernel.org/r/20240321215954.177730-3-david%40redhat.com
patch subject: [PATCH v1 2/2] s390/mm: re-enable the shared zeropage for !PV and !skeys KVM guests
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: s390-randconfig-r071-20240325 (https://download.01.org/0day-ci/archive/20240401/202404011730.2TEIocud-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404011730.2TEIocud-lkp@intel.com/

smatch warnings:
arch/s390/mm/gmap.c:2656 __s390_unshare_zeropages() error: uninitialized symbol 'rc'.

vim +/rc +2656 arch/s390/mm/gmap.c

9a7a43a7ce9759 David Hildenbrand 2024-03-21  2598  
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2599  /*
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2600   * Unshare all shared zeropages, replacing them by anonymous pages. Note that
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2601   * we cannot simply zap all shared zeropages, because this could later
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2602   * trigger unexpected userfaultfd missing events.
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2603   *
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2604   * This must be called after mm->context.allow_cow_sharing was
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2605   * set to 0, to avoid future mappings of shared zeropages.
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2606   *
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2607   * mm contracts with s390, that even if mm were to remove a page table,
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2608   * and racing with walk_page_range_vma() calling pte_offset_map_lock()
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2609   * would fail, it will never insert a page table containing empty zero
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2610   * pages once mm_forbids_zeropage(mm) i.e.
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2611   * mm->context.allow_cow_sharing is set to 0.
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2612   */
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2613  static int __s390_unshare_zeropages(struct mm_struct *mm)
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2614  {
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2615  	struct vm_area_struct *vma;
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2616  	VMA_ITERATOR(vmi, mm, 0);
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2617  	unsigned long addr;
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2618  	int rc;
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2619  
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2620  	for_each_vma(vmi, vma) {
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2621  		/*
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2622  		 * We could only look at COW mappings, but it's more future
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2623  		 * proof to catch unexpected zeropages in other mappings and
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2624  		 * fail.
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2625  		 */
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2626  		if ((vma->vm_flags & VM_PFNMAP) || is_vm_hugetlb_page(vma))
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2627  			continue;
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2628  		addr = vma->vm_start;
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2629  
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2630  retry:
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2631  		rc = walk_page_range_vma(vma, addr, vma->vm_end,
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2632  					 &find_zeropage_ops, &addr);
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2633  		if (rc <= 0)
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2634  			continue;
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2635  
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2636  		/* addr was updated by find_zeropage_pte_entry() */
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2637  		rc = handle_mm_fault(vma, addr,
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2638  				     FAULT_FLAG_UNSHARE | FAULT_FLAG_REMOTE,
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2639  				     NULL);
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2640  		if (rc & VM_FAULT_OOM)
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2641  			return -ENOMEM;
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2642  		/*
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2643  		 * See break_ksm(): even after handle_mm_fault() returned 0, we
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2644  		 * must start the lookup from the current address, because
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2645  		 * handle_mm_fault() may back out if there's any difficulty.
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2646  		 *
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2647  		 * VM_FAULT_SIGBUS and VM_FAULT_SIGSEGV are unexpected but
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2648  		 * maybe they could trigger in the future on concurrent
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2649  		 * truncation. In that case, the shared zeropage would be gone
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2650  		 * and we can simply retry and make progress.
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2651  		 */
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2652  		cond_resched();
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2653  		goto retry;
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2654  	}
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2655  
9a7a43a7ce9759 David Hildenbrand 2024-03-21 @2656  	return rc;
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2657  }
9a7a43a7ce9759 David Hildenbrand 2024-03-21  2658  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
