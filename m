Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E17126F0A
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 02:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752547018; cv=none; b=r+LlyhN6wk8iLJ7ZlC4LVpSenEUfaPEg5jGGth3vsLJrsF5iaEpAO9GS5mYMw0ZKCaZjYIBv/KxvEb5gDyyC2gk2aWB5iBnYm5VR0cDvbJGXEGySAf2pqGTGSbgy6DkTzkGzTasA4mIR/VXFK++ejh37asrVpXiqe5l7EWbMomw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752547018; c=relaxed/simple;
	bh=pEgowgQxaTiruzSoUn3GBNxik5Lr9JnAUSTtKd8zY4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+F/EBax1ADyDVHdnYWUQzkBfyci/qxu8aVH+oVo4dogEUgisfqlBpeuR1Apk4Qjv27z0wYVArGfdkI9L1n8ENmnxooWuNUbCWKYBGOV2dijiTbKtX1l3gWJE/HpbDh5sBuT8rtgGTUkyLFvKWEJ/fZwqNL8O6q6ITMoOPVAN6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fb94iLB7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fb94iLB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752547017; x=1784083017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pEgowgQxaTiruzSoUn3GBNxik5Lr9JnAUSTtKd8zY4A=;
  b=Fb94iLB7ofGk/zuveKnXPdC00fya0DZHwTuJgF4v/k2OII/2odngqOjU
   wT1SjCFuBs6O0xH+G189ys4LF/Qfwt5zO0SbrHs1bWhxViDTt3oMLBwWE
   Sbtws7PJpzJNPj98djbMAIebhhOrGp4h+i+gLDd/FEJAPs4HsQexG/Y99
   6ImCHysTjU3awS6G93bvO4SHiIazK9ArvYyXHgSLShDWF+21hdliYhQxA
   eDSdp3ydmchWJ5c7z5qYVcCA7t5mL1v2cq8J4LlaCmg2H3Azfajquz5d6
   JbtaHwv6aCVYAOlqDhKgSFmxjyAztaD4H+6vSBPLuAn4wTL+8siP2+7YH
   A==;
X-CSE-ConnectionGUID: Z+SG4tYDSuGGGBe2uk+Z+A==
X-CSE-MsgGUID: tDXG3tVTRIGPvdbzJUwjVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54460765"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="54460765"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 19:36:56 -0700
X-CSE-ConnectionGUID: krabnCXrSRu1ZvesEiMsFg==
X-CSE-MsgGUID: d/JJk8OiRbiT8oFnMqpFFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="162644817"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Jul 2025 19:36:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubVXH-0009Yn-30;
	Tue, 15 Jul 2025 02:36:51 +0000
Date: Tue, 15 Jul 2025 10:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/huge_memory.c:3598 split_huge_pages_pid() error: uninitialized
 symbol 'mapping'.
Message-ID: <202507151025.7UGHiLJZ-lkp@intel.com>
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
TO: Luis Chamberlain <mcgrof@kernel.org>
CC: Christian Brauner <brauner@kernel.org>
CC: Pankaj Raghav <p.raghav@samsung.com>
CC: Hannes Reinecke <hare@suse.de>
CC: Zi Yan <ziy@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   347e9f5043c89695b01e66b3ed111755afcf1911
commit: e220917fa50774fedb27c075df2261fd664e8ca3 mm: split a folio in minimum folio order chunks
date:   11 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20250715 (https://download.01.org/0day-ci/archive/20250715/202507151025.7UGHiLJZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507151025.7UGHiLJZ-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:3598 split_huge_pages_pid() error: uninitialized symbol 'mapping'.

vim +/mapping +3598 mm/huge_memory.c

fa6c02315f745f Zi Yan                  2021-05-04  3509  
fa6c02315f745f Zi Yan                  2021-05-04  3510  static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
fc4d182316bd53 Zi Yan                  2024-02-26  3511  				unsigned long vaddr_end, unsigned int new_order)
fa6c02315f745f Zi Yan                  2021-05-04  3512  {
fa6c02315f745f Zi Yan                  2021-05-04  3513  	int ret = 0;
fa6c02315f745f Zi Yan                  2021-05-04  3514  	struct task_struct *task;
fa6c02315f745f Zi Yan                  2021-05-04  3515  	struct mm_struct *mm;
fa6c02315f745f Zi Yan                  2021-05-04  3516  	unsigned long total = 0, split = 0;
fa6c02315f745f Zi Yan                  2021-05-04  3517  	unsigned long addr;
fa6c02315f745f Zi Yan                  2021-05-04  3518  
fa6c02315f745f Zi Yan                  2021-05-04  3519  	vaddr_start &= PAGE_MASK;
fa6c02315f745f Zi Yan                  2021-05-04  3520  	vaddr_end &= PAGE_MASK;
fa6c02315f745f Zi Yan                  2021-05-04  3521  
fa6c02315f745f Zi Yan                  2021-05-04  3522  	/* Find the task_struct from pid */
fa6c02315f745f Zi Yan                  2021-05-04  3523  	rcu_read_lock();
fa6c02315f745f Zi Yan                  2021-05-04  3524  	task = find_task_by_vpid(pid);
fa6c02315f745f Zi Yan                  2021-05-04  3525  	if (!task) {
fa6c02315f745f Zi Yan                  2021-05-04  3526  		rcu_read_unlock();
fa6c02315f745f Zi Yan                  2021-05-04  3527  		ret = -ESRCH;
fa6c02315f745f Zi Yan                  2021-05-04  3528  		goto out;
fa6c02315f745f Zi Yan                  2021-05-04  3529  	}
fa6c02315f745f Zi Yan                  2021-05-04  3530  	get_task_struct(task);
fa6c02315f745f Zi Yan                  2021-05-04  3531  	rcu_read_unlock();
fa6c02315f745f Zi Yan                  2021-05-04  3532  
fa6c02315f745f Zi Yan                  2021-05-04  3533  	/* Find the mm_struct */
fa6c02315f745f Zi Yan                  2021-05-04  3534  	mm = get_task_mm(task);
fa6c02315f745f Zi Yan                  2021-05-04  3535  	put_task_struct(task);
fa6c02315f745f Zi Yan                  2021-05-04  3536  
fa6c02315f745f Zi Yan                  2021-05-04  3537  	if (!mm) {
fa6c02315f745f Zi Yan                  2021-05-04  3538  		ret = -EINVAL;
fa6c02315f745f Zi Yan                  2021-05-04  3539  		goto out;
fa6c02315f745f Zi Yan                  2021-05-04  3540  	}
fa6c02315f745f Zi Yan                  2021-05-04  3541  
fa6c02315f745f Zi Yan                  2021-05-04  3542  	pr_debug("Split huge pages in pid: %d, vaddr: [0x%lx - 0x%lx]\n",
fa6c02315f745f Zi Yan                  2021-05-04  3543  		 pid, vaddr_start, vaddr_end);
fa6c02315f745f Zi Yan                  2021-05-04  3544  
fa6c02315f745f Zi Yan                  2021-05-04  3545  	mmap_read_lock(mm);
fa6c02315f745f Zi Yan                  2021-05-04  3546  	/*
fa6c02315f745f Zi Yan                  2021-05-04  3547  	 * always increase addr by PAGE_SIZE, since we could have a PTE page
fa6c02315f745f Zi Yan                  2021-05-04  3548  	 * table filled with PTE-mapped THPs, each of which is distinct.
fa6c02315f745f Zi Yan                  2021-05-04  3549  	 */
fa6c02315f745f Zi Yan                  2021-05-04  3550  	for (addr = vaddr_start; addr < vaddr_end; addr += PAGE_SIZE) {
74ba2b38ba990c Miaohe Lin              2022-07-04  3551  		struct vm_area_struct *vma = vma_lookup(mm, addr);
fa6c02315f745f Zi Yan                  2021-05-04  3552  		struct page *page;
a644b0abbfe1d7 Matthew Wilcox (Oracle  2023-08-16  3553) 		struct folio *folio;
e220917fa50774 Luis Chamberlain        2024-08-22  3554  		struct address_space *mapping;
e220917fa50774 Luis Chamberlain        2024-08-22  3555  		unsigned int target_order = new_order;
fa6c02315f745f Zi Yan                  2021-05-04  3556  
74ba2b38ba990c Miaohe Lin              2022-07-04  3557  		if (!vma)
fa6c02315f745f Zi Yan                  2021-05-04  3558  			break;
fa6c02315f745f Zi Yan                  2021-05-04  3559  
fa6c02315f745f Zi Yan                  2021-05-04  3560  		/* skip special VMA and hugetlb VMA */
fa6c02315f745f Zi Yan                  2021-05-04  3561  		if (vma_not_suitable_for_thp_split(vma)) {
fa6c02315f745f Zi Yan                  2021-05-04  3562  			addr = vma->vm_end;
fa6c02315f745f Zi Yan                  2021-05-04  3563  			continue;
fa6c02315f745f Zi Yan                  2021-05-04  3564  		}
fa6c02315f745f Zi Yan                  2021-05-04  3565  
fa6c02315f745f Zi Yan                  2021-05-04  3566  		/* FOLL_DUMP to ignore special (like zero) pages */
87d2762e22f3ea Miaohe Lin              2022-03-22  3567  		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
fa6c02315f745f Zi Yan                  2021-05-04  3568  
f7091ed64ec831 Haiyue Wang             2022-08-23  3569  		if (IS_ERR_OR_NULL(page))
fa6c02315f745f Zi Yan                  2021-05-04  3570  			continue;
fa6c02315f745f Zi Yan                  2021-05-04  3571  
a644b0abbfe1d7 Matthew Wilcox (Oracle  2023-08-16  3572) 		folio = page_folio(page);
a644b0abbfe1d7 Matthew Wilcox (Oracle  2023-08-16  3573) 		if (!is_transparent_hugepage(folio))
fa6c02315f745f Zi Yan                  2021-05-04  3574  			goto next;
fa6c02315f745f Zi Yan                  2021-05-04  3575  
e220917fa50774 Luis Chamberlain        2024-08-22  3576  		if (!folio_test_anon(folio)) {
e220917fa50774 Luis Chamberlain        2024-08-22  3577  			mapping = folio->mapping;
e220917fa50774 Luis Chamberlain        2024-08-22  3578  			target_order = max(new_order,
e220917fa50774 Luis Chamberlain        2024-08-22  3579  					   mapping_min_folio_order(mapping));
e220917fa50774 Luis Chamberlain        2024-08-22  3580  		}
e220917fa50774 Luis Chamberlain        2024-08-22  3581  
e220917fa50774 Luis Chamberlain        2024-08-22  3582  		if (target_order >= folio_order(folio))
2394aef616cf38 Zi Yan                  2024-03-07  3583  			goto next;
2394aef616cf38 Zi Yan                  2024-03-07  3584  
fa6c02315f745f Zi Yan                  2021-05-04  3585  		total++;
fc4d182316bd53 Zi Yan                  2024-02-26  3586  		/*
fc4d182316bd53 Zi Yan                  2024-02-26  3587  		 * For folios with private, split_huge_page_to_list_to_order()
fc4d182316bd53 Zi Yan                  2024-02-26  3588  		 * will try to drop it before split and then check if the folio
fc4d182316bd53 Zi Yan                  2024-02-26  3589  		 * can be split or not. So skip the check here.
fc4d182316bd53 Zi Yan                  2024-02-26  3590  		 */
fc4d182316bd53 Zi Yan                  2024-02-26  3591  		if (!folio_test_private(folio) &&
fc4d182316bd53 Zi Yan                  2024-02-26  3592  		    !can_split_folio(folio, NULL))
fa6c02315f745f Zi Yan                  2021-05-04  3593  			goto next;
fa6c02315f745f Zi Yan                  2021-05-04  3594  
a644b0abbfe1d7 Matthew Wilcox (Oracle  2023-08-16  3595) 		if (!folio_trylock(folio))
fa6c02315f745f Zi Yan                  2021-05-04  3596  			goto next;
fa6c02315f745f Zi Yan                  2021-05-04  3597  
e220917fa50774 Luis Chamberlain        2024-08-22 @3598  		if (!folio_test_anon(folio) && folio->mapping != mapping)
e220917fa50774 Luis Chamberlain        2024-08-22  3599  			goto unlock;
e220917fa50774 Luis Chamberlain        2024-08-22  3600  
e220917fa50774 Luis Chamberlain        2024-08-22  3601  		if (!split_folio_to_order(folio, target_order))
fa6c02315f745f Zi Yan                  2021-05-04  3602  			split++;
fa6c02315f745f Zi Yan                  2021-05-04  3603  
e220917fa50774 Luis Chamberlain        2024-08-22  3604  unlock:
e220917fa50774 Luis Chamberlain        2024-08-22  3605  
a644b0abbfe1d7 Matthew Wilcox (Oracle  2023-08-16  3606) 		folio_unlock(folio);
fa6c02315f745f Zi Yan                  2021-05-04  3607  next:
a644b0abbfe1d7 Matthew Wilcox (Oracle  2023-08-16  3608) 		folio_put(folio);
fa6c02315f745f Zi Yan                  2021-05-04  3609  		cond_resched();
fa6c02315f745f Zi Yan                  2021-05-04  3610  	}
fa6c02315f745f Zi Yan                  2021-05-04  3611  	mmap_read_unlock(mm);
fa6c02315f745f Zi Yan                  2021-05-04  3612  	mmput(mm);
fa6c02315f745f Zi Yan                  2021-05-04  3613  
fa6c02315f745f Zi Yan                  2021-05-04  3614  	pr_debug("%lu of %lu THP split\n", split, total);
fa6c02315f745f Zi Yan                  2021-05-04  3615  
fa6c02315f745f Zi Yan                  2021-05-04  3616  out:
fa6c02315f745f Zi Yan                  2021-05-04  3617  	return ret;
fa6c02315f745f Zi Yan                  2021-05-04  3618  }
fa6c02315f745f Zi Yan                  2021-05-04  3619  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
