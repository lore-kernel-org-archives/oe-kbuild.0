Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A87F2940D
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Apr 2026 19:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196450; cv=none; b=EzsYprVGAuguxYAMvhm+dGAseCu5QF597UeFJQlR0s9EJ2wNgT+QQyvUhHfXA8YUBPPoPJh0aRJz9+SuZYLMTt8DsacyMc4FdPx8k1zdEm5nMU2oNzpmoxDKrgyjgmREi20YYI0tgY4PMR2xY/HVm5X25JvtFBEgZQqsuuKsTaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196450; c=relaxed/simple;
	bh=kCcxfy0IlkZEngZhTofIrCDsQLTHHNglXHkvSpa/omE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YUp9cvXNtObraQgumApcZ+L6xGqh6Wp0VAT+mGnJPh+WDFf8MRHDd1S576ahjgdBV7FGWgVfxSrm3/xwRc3VptnR4gvgs9DMXZ+ZyCf68vf/oRr0RPToz3hr+maP2hn9QDyiRAxgHpTvLdyQ65ericIXFb6qLl5/rW4hFhnnm50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMupZEyb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMupZEyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776196448; x=1807732448;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kCcxfy0IlkZEngZhTofIrCDsQLTHHNglXHkvSpa/omE=;
  b=WMupZEybJ3R2iH3HtSSpFaOsQ7NMVfAiIi7OC7E/bJFtc8dgMn89IkTb
   6SvZnmDSRkXhEhkQQTeasWg8zEDOuRwyzm0ynka6sf6IrsGWvn2uDM5u8
   izkLurBYQBOiIzny5d4CHOGIgRy/v+mLS6018ZnRrkFkFOf1T21aIe4bw
   90E+QB8YHmiDGSxOS+iAI3uGAkRykOp3RpuDq+dv4ridGA9zfOqCHgHSd
   1TNzMQ17HWjxIs26catzUa+GutOqOwcIJnhchZNLxPsk3NK9UB7c5jSsR
   LnRS2Asa6ihnKc6FztqXmdOiFpJIKSN+T+hDD/YO7brIjB1nLhHTkKOiJ
   w==;
X-CSE-ConnectionGUID: dxamSI4IRK2Vz0FK5CY/hA==
X-CSE-MsgGUID: fh39B8ueRVKQvocWFoIXaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77276522"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77276522"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 12:54:07 -0700
X-CSE-ConnectionGUID: xsFHutlXR2iDIAXu/XVo+w==
X-CSE-MsgGUID: CKsU40SIRjSHF7B/Qzw/YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="260617413"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Apr 2026 12:54:06 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCjpj-000000001ob-1tlu;
	Tue, 14 Apr 2026 19:54:03 +0000
Date: Wed, 15 Apr 2026 03:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] mm/migrate_device: fix double unlock and remove dead code
Message-ID: <202604150314.JzBIroDK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260413130927.13263-1-nueralspacetech@gmail.com>
References: <20260413130927.13263-1-nueralspacetech@gmail.com>
TO: Sunny Patel <nueralspacetech@gmail.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Hildenbrand <david@kernel.org>
CC: Zi Yan <ziy@nvidia.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Joshua Hahn <joshua.hahnjy@gmail.com>
CC: Rakie Kim <rakie.kim@sk.com>
CC: Byungchul Park <byungchul@sk.com>
CC: Gregory Price <gourry@gourry.net>
CC: Ying Huang <ying.huang@linux.alibaba.com>
CC: Alistair Popple <apopple@nvidia.com>
CC: linux-kernel@vger.kernel.org
CC: Sunny Patel <nueralspacetech@gmail.com>

Hi Sunny,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunny-Patel/mm-migrate_device-fix-double-unlock-and-remove-dead-code/20260414-011221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260413130927.13263-1-nueralspacetech%40gmail.com
patch subject: [PATCH] mm/migrate_device: fix double unlock and remove dead code
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-161-20260414 (https://download.01.org/0day-ci/archive/20260415/202604150314.JzBIroDK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604150314.JzBIroDK-lkp@intel.com/

smatch warnings:
mm/migrate_device.c:243 migrate_vma_collect_huge_pmd() warn: inconsistent returns 'ptl'.

vim +/ptl +243 mm/migrate_device.c

022a12deda53c98 Balbir Singh            2025-10-01  123  
a30b48bf1b244f1 Balbir Singh            2025-10-01  124  /** migrate_vma_collect_huge_pmd - collect THP pages without splitting the
a30b48bf1b244f1 Balbir Singh            2025-10-01  125   * folio for device private pages.
a30b48bf1b244f1 Balbir Singh            2025-10-01  126   * @pmdp: pointer to pmd entry
a30b48bf1b244f1 Balbir Singh            2025-10-01  127   * @start: start address of the range for migration
a30b48bf1b244f1 Balbir Singh            2025-10-01  128   * @end: end address of the range for migration
a30b48bf1b244f1 Balbir Singh            2025-10-01  129   * @walk: mm_walk callback structure
a30b48bf1b244f1 Balbir Singh            2025-10-01  130   * @fault_folio: folio associated with the fault if any
a30b48bf1b244f1 Balbir Singh            2025-10-01  131   *
a30b48bf1b244f1 Balbir Singh            2025-10-01  132   * Collect the huge pmd entry at @pmdp for migration and set the
a30b48bf1b244f1 Balbir Singh            2025-10-01  133   * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
a30b48bf1b244f1 Balbir Singh            2025-10-01  134   * migration will occur at HPAGE_PMD granularity
a30b48bf1b244f1 Balbir Singh            2025-10-01  135   */
a30b48bf1b244f1 Balbir Singh            2025-10-01  136  static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
a30b48bf1b244f1 Balbir Singh            2025-10-01  137  					unsigned long end, struct mm_walk *walk,
a30b48bf1b244f1 Balbir Singh            2025-10-01  138  					struct folio *fault_folio)
76cbbead253ddca Christoph Hellwig       2022-02-16  139  {
a30b48bf1b244f1 Balbir Singh            2025-10-01  140  	struct mm_struct *mm = walk->mm;
a30b48bf1b244f1 Balbir Singh            2025-10-01  141  	struct folio *folio;
76cbbead253ddca Christoph Hellwig       2022-02-16  142  	struct migrate_vma *migrate = walk->private;
76cbbead253ddca Christoph Hellwig       2022-02-16  143  	spinlock_t *ptl;
a30b48bf1b244f1 Balbir Singh            2025-10-01  144  	int ret;
a30b48bf1b244f1 Balbir Singh            2025-10-01  145  	unsigned long write = 0;
76cbbead253ddca Christoph Hellwig       2022-02-16  146  
a30b48bf1b244f1 Balbir Singh            2025-10-01  147  	ptl = pmd_lock(mm, pmdp);
a30b48bf1b244f1 Balbir Singh            2025-10-01  148  	if (pmd_none(*pmdp)) {
a30b48bf1b244f1 Balbir Singh            2025-10-01  149  		spin_unlock(ptl);
76cbbead253ddca Christoph Hellwig       2022-02-16  150  		return migrate_vma_collect_hole(start, end, -1, walk);
a30b48bf1b244f1 Balbir Singh            2025-10-01  151  	}
76cbbead253ddca Christoph Hellwig       2022-02-16  152  
76cbbead253ddca Christoph Hellwig       2022-02-16  153  	if (pmd_trans_huge(*pmdp)) {
a30b48bf1b244f1 Balbir Singh            2025-10-01  154  		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
76cbbead253ddca Christoph Hellwig       2022-02-16  155  			spin_unlock(ptl);
a30b48bf1b244f1 Balbir Singh            2025-10-01  156  			return migrate_vma_collect_skip(start, end, walk);
76cbbead253ddca Christoph Hellwig       2022-02-16  157  		}
76cbbead253ddca Christoph Hellwig       2022-02-16  158  
b002a7b0a58acea Matthew Wilcox (Oracle  2024-03-26  159) 		folio = pmd_folio(*pmdp);
b002a7b0a58acea Matthew Wilcox (Oracle  2024-03-26  160) 		if (is_huge_zero_folio(folio)) {
76cbbead253ddca Christoph Hellwig       2022-02-16  161  			spin_unlock(ptl);
a30b48bf1b244f1 Balbir Singh            2025-10-01  162  			return migrate_vma_collect_hole(start, end, -1, walk);
a30b48bf1b244f1 Balbir Singh            2025-10-01  163  		}
a30b48bf1b244f1 Balbir Singh            2025-10-01  164  		if (pmd_write(*pmdp))
a30b48bf1b244f1 Balbir Singh            2025-10-01  165  			write = MIGRATE_PFN_WRITE;
a30b48bf1b244f1 Balbir Singh            2025-10-01  166  	} else if (!pmd_present(*pmdp)) {
0ac881efe164685 Lorenzo Stoakes         2025-11-10  167  		const softleaf_t entry = softleaf_from_pmd(*pmdp);
a30b48bf1b244f1 Balbir Singh            2025-10-01  168  
0ac881efe164685 Lorenzo Stoakes         2025-11-10  169  		folio = softleaf_to_folio(entry);
0ac881efe164685 Lorenzo Stoakes         2025-11-10  170  
0ac881efe164685 Lorenzo Stoakes         2025-11-10  171  		if (!softleaf_is_device_private(entry) ||
a30b48bf1b244f1 Balbir Singh            2025-10-01  172  			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
a30b48bf1b244f1 Balbir Singh            2025-10-01  173  			(folio->pgmap->owner != migrate->pgmap_owner)) {
a30b48bf1b244f1 Balbir Singh            2025-10-01  174  			spin_unlock(ptl);
a30b48bf1b244f1 Balbir Singh            2025-10-01  175  			return migrate_vma_collect_skip(start, end, walk);
a30b48bf1b244f1 Balbir Singh            2025-10-01  176  		}
a30b48bf1b244f1 Balbir Singh            2025-10-01  177  
0ac881efe164685 Lorenzo Stoakes         2025-11-10  178  		if (softleaf_is_migration(entry)) {
b570f37a2ce480b Thomas Hellström        2026-02-10  179  			softleaf_entry_wait_on_locked(entry, ptl);
a30b48bf1b244f1 Balbir Singh            2025-10-01  180  			return -EAGAIN;
a30b48bf1b244f1 Balbir Singh            2025-10-01  181  		}
a30b48bf1b244f1 Balbir Singh            2025-10-01  182  
0ac881efe164685 Lorenzo Stoakes         2025-11-10  183  		if (softleaf_is_device_private_write(entry))
a30b48bf1b244f1 Balbir Singh            2025-10-01  184  			write = MIGRATE_PFN_WRITE;
76cbbead253ddca Christoph Hellwig       2022-02-16  185  	} else {
a30b48bf1b244f1 Balbir Singh            2025-10-01  186  		spin_unlock(ptl);
a30b48bf1b244f1 Balbir Singh            2025-10-01  187  		return -EAGAIN;
a30b48bf1b244f1 Balbir Singh            2025-10-01  188  	}
76cbbead253ddca Christoph Hellwig       2022-02-16  189  
b002a7b0a58acea Matthew Wilcox (Oracle  2024-03-26  190) 	folio_get(folio);
a30b48bf1b244f1 Balbir Singh            2025-10-01  191  	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
a30b48bf1b244f1 Balbir Singh            2025-10-01  192  		spin_unlock(ptl);
a30b48bf1b244f1 Balbir Singh            2025-10-01  193  		folio_put(folio);
a30b48bf1b244f1 Balbir Singh            2025-10-01  194  		return migrate_vma_collect_skip(start, end, walk);
a30b48bf1b244f1 Balbir Singh            2025-10-01  195  	}
a30b48bf1b244f1 Balbir Singh            2025-10-01  196  
a30b48bf1b244f1 Balbir Singh            2025-10-01  197  	if (thp_migration_supported() &&
a30b48bf1b244f1 Balbir Singh            2025-10-01  198  		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
a30b48bf1b244f1 Balbir Singh            2025-10-01  199  		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
a30b48bf1b244f1 Balbir Singh            2025-10-01  200  		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
a30b48bf1b244f1 Balbir Singh            2025-10-01  201  
a30b48bf1b244f1 Balbir Singh            2025-10-01  202  		struct page_vma_mapped_walk pvmw = {
a30b48bf1b244f1 Balbir Singh            2025-10-01  203  			.ptl = ptl,
a30b48bf1b244f1 Balbir Singh            2025-10-01  204  			.address = start,
a30b48bf1b244f1 Balbir Singh            2025-10-01  205  			.pmd = pmdp,
a30b48bf1b244f1 Balbir Singh            2025-10-01  206  			.vma = walk->vma,
a30b48bf1b244f1 Balbir Singh            2025-10-01  207  		};
a30b48bf1b244f1 Balbir Singh            2025-10-01  208  
a30b48bf1b244f1 Balbir Singh            2025-10-01  209  		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
a30b48bf1b244f1 Balbir Singh            2025-10-01  210  
a30b48bf1b244f1 Balbir Singh            2025-10-01  211  		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
a30b48bf1b244f1 Balbir Singh            2025-10-01  212  						| MIGRATE_PFN_MIGRATE
a30b48bf1b244f1 Balbir Singh            2025-10-01  213  						| MIGRATE_PFN_COMPOUND;
a30b48bf1b244f1 Balbir Singh            2025-10-01  214  		migrate->dst[migrate->npages++] = 0;
a30b48bf1b244f1 Balbir Singh            2025-10-01  215  		migrate->cpages++;
a30b48bf1b244f1 Balbir Singh            2025-10-01  216  		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
a30b48bf1b244f1 Balbir Singh            2025-10-01  217  		if (ret) {
a30b48bf1b244f1 Balbir Singh            2025-10-01  218  			migrate->npages--;
a30b48bf1b244f1 Balbir Singh            2025-10-01  219  			migrate->cpages--;
a30b48bf1b244f1 Balbir Singh            2025-10-01  220  			migrate->src[migrate->npages] = 0;
a30b48bf1b244f1 Balbir Singh            2025-10-01  221  			migrate->dst[migrate->npages] = 0;
a30b48bf1b244f1 Balbir Singh            2025-10-01  222  			goto fallback;
a30b48bf1b244f1 Balbir Singh            2025-10-01  223  		}
a30b48bf1b244f1 Balbir Singh            2025-10-01  224  		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
a30b48bf1b244f1 Balbir Singh            2025-10-01  225  		spin_unlock(ptl);
a30b48bf1b244f1 Balbir Singh            2025-10-01  226  		return 0;
a30b48bf1b244f1 Balbir Singh            2025-10-01  227  	}
a30b48bf1b244f1 Balbir Singh            2025-10-01  228  
a30b48bf1b244f1 Balbir Singh            2025-10-01  229  fallback:
76cbbead253ddca Christoph Hellwig       2022-02-16  230  	spin_unlock(ptl);
a30b48bf1b244f1 Balbir Singh            2025-10-01  231  	if (!folio_test_large(folio))
a30b48bf1b244f1 Balbir Singh            2025-10-01  232  		goto done;
b002a7b0a58acea Matthew Wilcox (Oracle  2024-03-26  233) 	ret = split_folio(folio);
1afaeb8293c9add Matthew Brost           2025-03-05  234  	if (fault_folio != folio)
b002a7b0a58acea Matthew Wilcox (Oracle  2024-03-26  235) 		folio_unlock(folio);
b002a7b0a58acea Matthew Wilcox (Oracle  2024-03-26  236) 	folio_put(folio);
76cbbead253ddca Christoph Hellwig       2022-02-16  237  	if (ret)
a30b48bf1b244f1 Balbir Singh            2025-10-01  238  		return migrate_vma_collect_skip(start, end, walk);
a30b48bf1b244f1 Balbir Singh            2025-10-01  239  	if (pmd_none(pmdp_get_lockless(pmdp)))
a30b48bf1b244f1 Balbir Singh            2025-10-01  240  		return migrate_vma_collect_hole(start, end, -1, walk);
a30b48bf1b244f1 Balbir Singh            2025-10-01  241  
a30b48bf1b244f1 Balbir Singh            2025-10-01  242  done:
a30b48bf1b244f1 Balbir Singh            2025-10-01 @243  	return -ENOENT;
76cbbead253ddca Christoph Hellwig       2022-02-16  244  }
a30b48bf1b244f1 Balbir Singh            2025-10-01  245  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
