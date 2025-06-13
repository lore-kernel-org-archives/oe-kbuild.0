Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6EA2E0B65
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749817536; cv=none; b=JFkMKbB1Y5F3ueB2HTIDPQan7i0SNkry1hZ2ebTRdPCyu6+sg/43I3lpFcvArDpF/U5QSRq3iCcoWzE9sNlF7nIglLQptZFWxNWoIK9UcD3zFhGbCxzKH7eFQ/r10qPDqBlDYZmLW+bmHovmocV+ZL9Y/qudc2Rjnq+Iuj4BxpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749817536; c=relaxed/simple;
	bh=m0bozW0J3rsG5CFp4zB3+mkSW8XUEXxolNy1Pyd69E4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dzc/8aPzpb48FFaBQ04jTm6ZliCh7pZFMmPxxT0HSQtZozLk0z4eeJIgTSh0l4bIeem+KjTZ6CisP5Bd8rC7Nu1jfUkB09K/2ekftCAU1YFy3q428ApK0AMtreaevrUAWSff/Jdcbn+7thZPOq9nXoeOMQ+ZjAO8SBskZB+eqzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnpQB6eT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnpQB6eT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749817534; x=1781353534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m0bozW0J3rsG5CFp4zB3+mkSW8XUEXxolNy1Pyd69E4=;
  b=hnpQB6eT7dBFCDcUjLpjguWjzTl24C/PLVe2q4H/YX5QH8pQu9S2nDak
   2o/wdDNAHg0OperjQAw08yjRYs7y+TYdb9AuAHK339a262cIiPkyGSrZF
   EqH66Ac/DnsEdyD23ElbnHWgC11t2RQ300rltGJY8aJe+C/JJRxb3fy2n
   ed0ysElrWZQWU+xUJEhplQszvnL8Z6zLlSoiVBwEFJmllZjvpm8IOcAp4
   X9dpmQdKJg2AtFoPgHfPSi1ttwGfiO2gzHrH9Us+PU8zjs6FB7FNX+YSy
   IjFyxEVGWyj/I4w8CWvUeW6nO0cfsdxBPUl4sP76FSLAgxx9hnl1zRxtk
   Q==;
X-CSE-ConnectionGUID: xyzm4pawR72ice7ZREnMxA==
X-CSE-MsgGUID: G9KT8qmDQOW9/vJg3uwYYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="62682619"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="62682619"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:25:34 -0700
X-CSE-ConnectionGUID: ipeaEhvbTxCOeUoJOkLkTg==
X-CSE-MsgGUID: 6Kywh/fyQ2Se0paTCtXGQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="152705863"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jun 2025 05:25:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ3TO-000Caw-2T;
	Fri, 13 Jun 2025 12:25:30 +0000
Date: Fri, 13 Jun 2025 20:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU
 mode
Message-ID: <202506132017.T1l1l6ME-lkp@intel.com>
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
In-Reply-To: <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>
References: <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>
TO: Alexander Gordeev <agordeev@linux.ibm.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: linux-kernel@vger.kernel.org
CC: sparclinux@vger.kernel.org
CC: xen-devel@lists.xenproject.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-s390@vger.kernel.org
CC: Hugh Dickins <hughd@google.com>
CC: Nicholas Piggin <npiggin@gmail.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Juergen Gross <jgross@suse.com>
CC: Jeremy Fitzhardinge <jeremy@goop.org>
CC: Ryan Roberts <ryan.roberts@arm.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Gordeev/mm-Cleanup-apply_to_pte_range-routine/20250613-013835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev%40linux.ibm.com
patch subject: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU mode
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-161-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132017.T1l1l6ME-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506132017.T1l1l6ME-lkp@intel.com/

smatch warnings:
mm/vmalloc.c:552 vmap_pages_pte_range() warn: inconsistent returns 'global &init_mm.page_table_lock'.

vim +552 mm/vmalloc.c

4ad0ae8c64ac8f8 Nicholas Piggin   2021-04-29  516  
0a264884046f1ab Nicholas Piggin   2021-04-29  517  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
2ba3e6947aed9bb Joerg Roedel      2020-06-01  518  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
2ba3e6947aed9bb Joerg Roedel      2020-06-01  519  		pgtbl_mod_mask *mask)
^1da177e4c3f415 Linus Torvalds    2005-04-16  520  {
^1da177e4c3f415 Linus Torvalds    2005-04-16  521  	pte_t *pte;
^1da177e4c3f415 Linus Torvalds    2005-04-16  522  
db64fe02258f150 Nicholas Piggin   2008-10-18  523  	/*
db64fe02258f150 Nicholas Piggin   2008-10-18  524  	 * nr is a running index into the array which helps higher level
db64fe02258f150 Nicholas Piggin   2008-10-18  525  	 * callers keep track of where we're up to.
db64fe02258f150 Nicholas Piggin   2008-10-18  526  	 */
db64fe02258f150 Nicholas Piggin   2008-10-18  527  
2ba3e6947aed9bb Joerg Roedel      2020-06-01  528  	pte = pte_alloc_kernel_track(pmd, addr, mask);
^1da177e4c3f415 Linus Torvalds    2005-04-16  529  	if (!pte)
^1da177e4c3f415 Linus Torvalds    2005-04-16  530  		return -ENOMEM;
44562c71e2cfc9e Ryan Roberts      2025-04-22  531  
dac0cc793368851 Alexander Gordeev 2025-06-12  532  	spin_lock(&init_mm.page_table_lock);
44562c71e2cfc9e Ryan Roberts      2025-04-22  533  	arch_enter_lazy_mmu_mode();
44562c71e2cfc9e Ryan Roberts      2025-04-22  534  
^1da177e4c3f415 Linus Torvalds    2005-04-16  535  	do {
db64fe02258f150 Nicholas Piggin   2008-10-18  536  		struct page *page = pages[*nr];
db64fe02258f150 Nicholas Piggin   2008-10-18  537  
c33c794828f2121 Ryan Roberts      2023-06-12  538  		if (WARN_ON(!pte_none(ptep_get(pte))))
db64fe02258f150 Nicholas Piggin   2008-10-18  539  			return -EBUSY;
db64fe02258f150 Nicholas Piggin   2008-10-18  540  		if (WARN_ON(!page))
^1da177e4c3f415 Linus Torvalds    2005-04-16  541  			return -ENOMEM;
4fcdcc12915c707 Yury Norov        2022-04-28  542  		if (WARN_ON(!pfn_valid(page_to_pfn(page))))
4fcdcc12915c707 Yury Norov        2022-04-28  543  			return -EINVAL;
4fcdcc12915c707 Yury Norov        2022-04-28  544  
^1da177e4c3f415 Linus Torvalds    2005-04-16  545  		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
db64fe02258f150 Nicholas Piggin   2008-10-18  546  		(*nr)++;
^1da177e4c3f415 Linus Torvalds    2005-04-16  547  	} while (pte++, addr += PAGE_SIZE, addr != end);
44562c71e2cfc9e Ryan Roberts      2025-04-22  548  
44562c71e2cfc9e Ryan Roberts      2025-04-22  549  	arch_leave_lazy_mmu_mode();
dac0cc793368851 Alexander Gordeev 2025-06-12  550  	spin_unlock(&init_mm.page_table_lock);
2ba3e6947aed9bb Joerg Roedel      2020-06-01  551  	*mask |= PGTBL_PTE_MODIFIED;
^1da177e4c3f415 Linus Torvalds    2005-04-16 @552  	return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  553  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  554  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
