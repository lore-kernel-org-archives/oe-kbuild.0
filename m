Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793251552;
	b=YT5R5taO0oyFptnkoPmWYzxJxpZ51re4X4TORJEZ7N7SeSyzE63SQ59Wlx6DU5vVUwd/
	 9UMNW4yCd2sIPjrzBbX+F/qk2FPtbwaSfUH3H874vjeZ8pobLU65rDKYm/vu72wLDUvlP
	 l0Ux3LgmH11ZHMDV/608/Frla7ZtpHg3e3Uf1KQ05Yd2d/hVvftU9xtZqJ1CJSjScLxqa
	 4l4qDE/aAe48+ZLdPVVASOxkIoOWREqB3mxY5uyZZsGK/9rcf+FDk93BGQ6OwPv+PsYDx
	 FR7NRbDlRO3CKnrvDvZhxB5Tqqg8cQ2uNZHJzthoJ/7xJLxFTdCW9Fqx5GElexTYtJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793251552;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5eaoucMY+4jFO2wB6Ob01yq4NGk2iFVJgmyov7HpunE=;
	b=TwfRaOVGkHOMXXQghqP/H2py0EQaNp/ONHPBsDnd93Ib3jWmmVUBY/yXVQLE6Md8mbgU
	 QOSRzz7971xoOIHQdE3zUh3/Awea7MFuCfGU1JprPSIxsIklscLZmTUqC2qrsWZeQi2r3
	 IK+PEHeBydyj/MUyZQlMZJ1Q78C6ydiP7eskgcn4upXTMdq/ozRU2r0wY1JMVZUn0YeqL
	 bn/mccxtZv5h3/cmmXU4xiHhOzgRX7dlT2KKl3Mayf4r5QW2MO24r+bjr5dGTXyDZSH8s
	 ell6tvm+fQFvb4mGkr+MQA8/F03tSbPcicsK2du8ZAqOPCPVvi7/ruyzyk8ligTnQAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PcItMFAh;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588F1606A31F
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Oct 2026 05:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588F1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PcItMFAh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793251552; x=1824787552;
  h=date:from:to:cc:subject:message-id;
  bh=revSgyxOYLHIpcp/V/pZLLojWhpfNlsMzm6DLP7nutg=;
  b=PcItMFAhfuEt8H1ld3oKi3nSRfNPS08VGZEp/6E5hCluNIi9NYUukFIY
   U/iM2FOrT1SrLe4r8dhfjkHwtyiIDJ6taXL7MGh7qnMNaqzyE4NkE5NIj
   r3QaAGcaqDE4kCQLYhJ/fuU2QClghSOkyOWIvkBLUxnvSofrmBcV7xXvj
   N8Cq0eNk5rY5/sWy5j+QBT+0wwBCSnNOJD6jaPu497+mPKBAbiTrqpDu8
   1NX+8YW9D0JIhY/A7hQ8tLdC5qe5u/mOkMVoe9VbsuKum8CkWbLqangvV
   VmbMqpHdEXozz/DlE6GtEq1Cg0IyPn34Ekpf62Tz1QdhB68DO1ZgKnZu0
   Q==;
X-CSE-ConnectionGUID: YqyBDitVTb6C1S/2H8WKTA==
X-CSE-MsgGUID: URQ0avK4RXyIGQT1nrKZMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1869596"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1869596"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 22:24:41 -0700
X-CSE-ConnectionGUID: XEOCnauTTZKj7OTzl2NbLw==
X-CSE-MsgGUID: Q+fD3iRFQeGhoiAlEPI+iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="4916922"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 28 Oct 2026 22:24:38 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMIcs-0000000059C-3bBz;
	Thu, 29 Oct 2026 05:24:34 +0000
Date: Thu, 29 Oct 2026 06:24:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [davidhildenbrand:b4/fixes_core 13/48] mm/huge_memory.c:1506
 do_huge_pmd_device_private() warn: inconsistent returns 'ptl'.
Message-ID: <202610290652.IGpu3Ps1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josef Bacik <josef@toxicpanda.com>
CC: "David Hildenbrand (Arm)" <david@kernel.org>
CC: Zi Yan <ziy@nvidia.com>

tree:   https://github.com/davidhildenbrand/linux b4/fixes_core
head:   5a5358c39c5c72f054c891685f8479c06c5f42d0
commit: f3f48b7b516dd004913e7f6870651f4cb0bfeff8 [13/48] mm/huge_memory: fix livelock on device private folio
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: powerpc64-randconfig-r2201-20261029 (https://download.01.org/0day-ci/archive/20261029/202610290652.IGpu3Ps1-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610290652.IGpu3Ps1-lkp@intel.com/

New smatch warnings:
mm/huge_memory.c:1506 do_huge_pmd_device_private() warn: inconsistent returns 'ptl'.

Old smatch warnings:
arch/powerpc/include/asm/book3s/64/pgtable.h:678 pte_swp_soft_dirty() warn: bitwise AND condition is false here

vim +/ptl +1506 mm/huge_memory.c

71e3aac0724ffe Andrea Arcangeli 2011-01-13  1470  
4964099163d052 Balbir Singh     2025-10-01  1471  vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
4964099163d052 Balbir Singh     2025-10-01  1472  {
4964099163d052 Balbir Singh     2025-10-01  1473  	struct vm_area_struct *vma = vmf->vma;
4964099163d052 Balbir Singh     2025-10-01  1474  	vm_fault_t ret = 0;
4964099163d052 Balbir Singh     2025-10-01  1475  	spinlock_t *ptl;
0ac881efe16468 Lorenzo Stoakes  2025-11-10  1476  	softleaf_t entry;
4964099163d052 Balbir Singh     2025-10-01  1477  	struct page *page;
4964099163d052 Balbir Singh     2025-10-01  1478  	struct folio *folio;
4964099163d052 Balbir Singh     2025-10-01  1479  
4964099163d052 Balbir Singh     2025-10-01  1480  	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
4964099163d052 Balbir Singh     2025-10-01  1481  		vma_end_read(vma);
4964099163d052 Balbir Singh     2025-10-01  1482  		return VM_FAULT_RETRY;
4964099163d052 Balbir Singh     2025-10-01  1483  	}
4964099163d052 Balbir Singh     2025-10-01  1484  
4964099163d052 Balbir Singh     2025-10-01  1485  	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
4964099163d052 Balbir Singh     2025-10-01  1486  	if (unlikely(!pmd_same(*vmf->pmd, vmf->orig_pmd))) {
4964099163d052 Balbir Singh     2025-10-01  1487  		spin_unlock(ptl);
4964099163d052 Balbir Singh     2025-10-01  1488  		return 0;
4964099163d052 Balbir Singh     2025-10-01  1489  	}
4964099163d052 Balbir Singh     2025-10-01  1490  
0ac881efe16468 Lorenzo Stoakes  2025-11-10  1491  	entry = softleaf_from_pmd(vmf->orig_pmd);
0ac881efe16468 Lorenzo Stoakes  2025-11-10  1492  	page = softleaf_to_page(entry);
4964099163d052 Balbir Singh     2025-10-01  1493  	folio = page_folio(page);
4964099163d052 Balbir Singh     2025-10-01  1494  	vmf->page = page;
4964099163d052 Balbir Singh     2025-10-01  1495  	vmf->pte = NULL;
4964099163d052 Balbir Singh     2025-10-01  1496  	if (folio_trylock(folio)) {
4964099163d052 Balbir Singh     2025-10-01  1497  		folio_get(folio);
4964099163d052 Balbir Singh     2025-10-01  1498  		spin_unlock(ptl);
4964099163d052 Balbir Singh     2025-10-01  1499  		ret = page_pgmap(page)->ops->migrate_to_ram(vmf);
4964099163d052 Balbir Singh     2025-10-01  1500  		folio_unlock(folio);
4964099163d052 Balbir Singh     2025-10-01  1501  		folio_put(folio);
4964099163d052 Balbir Singh     2025-10-01  1502  	} else {
f3f48b7b516dd0 Josef Bacik      2026-10-13  1503  		softleaf_entry_wait_on_locked(entry, ptl);
4964099163d052 Balbir Singh     2025-10-01  1504  	}
4964099163d052 Balbir Singh     2025-10-01  1505  
4964099163d052 Balbir Singh     2025-10-01 @1506  	return ret;
4964099163d052 Balbir Singh     2025-10-01  1507  }
4964099163d052 Balbir Singh     2025-10-01  1508  

:::::: The code at line 1506 was first introduced by commit
:::::: 4964099163d0524a769d039ffa886bb4515136d0 mm/memory/fault: add THP fault handling for zone device private pages

:::::: TO: Balbir Singh <balbirs@nvidia.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
