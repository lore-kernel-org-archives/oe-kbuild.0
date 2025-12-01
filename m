Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E201B1E7C23
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 05:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764566419; cv=none; b=o/5/WEfkPJp8ccpTX1wn8wgzCNswxj5UWaJRsQRxQNY8YMhcihuBXOXVOZlVl+Ha66K3QcI/Wa3v+ADkOsHDy8/L/pQfZKmumIjfyRKmIrN71p/gc0axYcmIbdphktJ2fyz1qRh4AsOPJ/igmtXUPsOCjh64RS5+rjbSFEge0uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764566419; c=relaxed/simple;
	bh=9c9I17Ps2nEQA1Gqx8IhWA6lQi4V/HtWfGiozbrta68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BkXaFt0CJ/kTiWW6MLtI6IxKijD30kCnw0zEzMzqHEb+VtqN1wvVtNbbJnbRuqlcWX/SLdRzj5T9PrG+zQywuJKKjQksTXpNigsT47fuE4bx2wGzoYJJM6YnML1tCdafWiXSrGMOKH59RLQypq5lhYC9oQf2Oge8YafBvT96Zvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AO0qZjmc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AO0qZjmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764566417; x=1796102417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9c9I17Ps2nEQA1Gqx8IhWA6lQi4V/HtWfGiozbrta68=;
  b=AO0qZjmc9XiwIfTWqbmw6BVgKC+2bcjyhUr8F8JmyhU8QT/Qjd6DW1zL
   8iIkKh9A8Db/xUW2Z9a/LJcxIiK7Guh1+o4+GvfBrvR/CqJ4EzqNDpi7H
   CEdvF/CP5HxDTmgPX1mWHW1t33zRHM2IzBvIx5Yc14bHxQvVmuZdMza1Q
   i8jtctN4LYdQKz4HlQeH/9RF13wkYboK1G26IEkwXyheKNd/UJxNnU/68
   BZqPVrr6aW0TuM4aLmnfEG3WZCDGhovv9XcWdrLeUZM1B0DCBP8kdBRm7
   6euLXe9CT5tBQg4ixBtWwSvexRJGyDrW9+Ml+EGwnRdBEYmQL4JLcEYvo
   Q==;
X-CSE-ConnectionGUID: Jiv2N1llTXGpRClcz+lsog==
X-CSE-MsgGUID: 0fhNr2+oSHKVWVEH4xf9FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77600691"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="77600691"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 21:20:16 -0800
X-CSE-ConnectionGUID: MUjT4WlGSjOhfhgrg4XIfQ==
X-CSE-MsgGUID: Cr231bmJRLiGNjXomt9zpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="199092185"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Nov 2025 21:20:16 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPwKb-000000008Kz-10y3;
	Mon, 01 Dec 2025 05:20:13 +0000
Date: Mon, 1 Dec 2025 13:19:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sj:damon/next 145/145] mm/memory.c:6213:9: error: implicit
 declaration of function 'damon_report_page_fault'
Message-ID: <202512011308.JsZqQIqQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   3fdd82439d28bd0bc5eeb347a6e96569ae05ec92
commit: 3fdd82439d28bd0bc5eeb347a6e96569ae05ec92 [145/145] mm/memory: move fault reporting into damon
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251201/202512011308.JsZqQIqQ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011308.JsZqQIqQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512011308.JsZqQIqQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'do_damon_page':
>> mm/memory.c:6213:9: error: implicit declaration of function 'damon_report_page_fault' [-Wimplicit-function-declaration]
    6213 |         damon_report_page_fault(vmf, huge_pmd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~


vim +/damon_report_page_fault +6213 mm/memory.c

a00cc7d9dd93d6 Matthew Wilcox 2017-02-24  6184  
c6fab22355afde SeongJae Park  2025-07-27  6185  static vm_fault_t do_damon_page(struct vm_fault *vmf, bool huge_pmd)
c6fab22355afde SeongJae Park  2025-07-27  6186  {
c6fab22355afde SeongJae Park  2025-07-27  6187  	struct vm_area_struct *vma = vmf->vma;
c6fab22355afde SeongJae Park  2025-07-27  6188  	struct folio *folio;
c6fab22355afde SeongJae Park  2025-07-27  6189  	pte_t pte, old_pte;
c6fab22355afde SeongJae Park  2025-07-27  6190  	bool writable = false, ignore_writable = false;
c6fab22355afde SeongJae Park  2025-07-27  6191  	bool pte_write_upgrade = vma_wants_manual_pte_write_upgrade(vma);
c6fab22355afde SeongJae Park  2025-07-27  6192  
c6fab22355afde SeongJae Park  2025-07-27  6193  	spin_lock(vmf->ptl);
c6fab22355afde SeongJae Park  2025-07-27  6194  	old_pte = ptep_get(vmf->pte);
c6fab22355afde SeongJae Park  2025-07-27  6195  	if (unlikely(!pte_same(old_pte, vmf->orig_pte))) {
c6fab22355afde SeongJae Park  2025-07-27  6196  		pte_unmap_unlock(vmf->pte, vmf->ptl);
c6fab22355afde SeongJae Park  2025-07-27  6197  		return 0;
c6fab22355afde SeongJae Park  2025-07-27  6198  	}
c6fab22355afde SeongJae Park  2025-07-27  6199  	pte = pte_modify(old_pte, vma->vm_page_prot);
c6fab22355afde SeongJae Park  2025-07-27  6200  	writable = pte_write(pte);
c6fab22355afde SeongJae Park  2025-07-27  6201  	if (!writable && pte_write_upgrade &&
c6fab22355afde SeongJae Park  2025-07-27  6202  			can_change_pte_writable(vma, vmf->address, pte))
c6fab22355afde SeongJae Park  2025-07-27  6203  		writable = true;
c6fab22355afde SeongJae Park  2025-07-27  6204  	folio = vm_normal_folio(vma, vmf->address, pte);
c6fab22355afde SeongJae Park  2025-07-27  6205  	if (folio && folio_test_large(folio))
c6fab22355afde SeongJae Park  2025-07-27  6206  		numa_rebuild_large_mapping(vmf, vma, folio, pte,
c6fab22355afde SeongJae Park  2025-07-27  6207  				ignore_writable, pte_write_upgrade);
c6fab22355afde SeongJae Park  2025-07-27  6208  	else
c6fab22355afde SeongJae Park  2025-07-27  6209  		numa_rebuild_single_mapping(vmf, vma, vmf->address, vmf->pte,
c6fab22355afde SeongJae Park  2025-07-27  6210  				writable);
c6fab22355afde SeongJae Park  2025-07-27  6211  	pte_unmap_unlock(vmf->pte, vmf->ptl);
c6fab22355afde SeongJae Park  2025-07-27  6212  
3fdd82439d28bd SeongJae Park  2025-11-30 @6213  	damon_report_page_fault(vmf, huge_pmd);
c6fab22355afde SeongJae Park  2025-07-27  6214  	return 0;
c6fab22355afde SeongJae Park  2025-07-27  6215  }
c6fab22355afde SeongJae Park  2025-07-27  6216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
