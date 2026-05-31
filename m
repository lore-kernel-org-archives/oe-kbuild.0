Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3152123ABB9
	for <oe-kbuild@lists.linux.dev>; Sun, 31 May 2026 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780240182; cv=none; b=BBfI7kt5gGMu/nLJnT2q9LvdTmBWsmA41ufya//OrWafpeH1hHoX4/I8KVfOpKqnIUdP3ZPx497oHY3ZcP4FMvFF4mht9isJMbB/mGXeYzJBou4J+SfnAP73OKH/LAWkbQ2oHEk6Ovd/aQ9C6kFRfKi42JVJVHUbr80Pq4/FtLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780240182; c=relaxed/simple;
	bh=WbX2IbK1qxAsyhUgJBkc4s+PdJU3/rrFM/l47gU/ShY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D2UcMMQhHiFp0ELaaOeRFOX2eXcSWp3aolFQ/jim/1ejLpbxNwOODxTFmRHm+yuArcI+mkv/TxEgIIOWBjVZ00KAiVo2uFRMCU3stLHJCaU6pkB3DzeA4RtMlUAY1bzIHd8kPP72FneXFFJ+V0myVg98lJZhHHTQZ4wa++EwlEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwVnSzuN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwVnSzuN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780240181; x=1811776181;
  h=date:from:to:cc:subject:message-id;
  bh=WbX2IbK1qxAsyhUgJBkc4s+PdJU3/rrFM/l47gU/ShY=;
  b=jwVnSzuNSsCMxSEu8q36WtpqoYAYrNGs9/PGKpQZmLPaLkO0NgFehuGf
   zfhBlXl2nY+UsHhoQAyPDWTUsbf9ovI11ttYdRnEvXkiuuMt/zJm7KMzR
   hSDmNXEMoYo39mN9Pct4uo9K/WxEQfkon6vDInbDK3H+5QYGNIjD1e5fk
   SirLILhNJGF7pTYma8OecYDdCIEKI5reOWxUD3EJj6yCAqqYM3RXRnW3Y
   Qm2o1YObS8xgvZ9wauDV/r8ftYaSmpnju0P6ZTPkrAFQFgVhpz7Qit94V
   s7/j3iTlCxQInGh6aZ7uEFs4MmFu4ZFrChP2gd1z6IPPmuV3mC2a6Zrnh
   A==;
X-CSE-ConnectionGUID: NVXTvFHCThWXS5WUl1Ps5Q==
X-CSE-MsgGUID: C+CaVaaUTY6iBzZJTPguug==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80988131"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="80988131"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 08:09:40 -0700
X-CSE-ConnectionGUID: 62jEXW+sTZuITNwTSa7EsA==
X-CSE-MsgGUID: 6ju6w0k5QHe1aixxcxEvYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="242277316"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 May 2026 08:09:38 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wThnE-000000009Va-2BMj;
	Sun, 31 May 2026 15:09:36 +0000
Date: Sun, 31 May 2026 23:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rppt:uffd/vm-flags 20/20] mm/userfaultfd.c:1360:44: error:
 call to '__compiletime_assert_604' declared with 'error' attribute: BUILD_BUG
 failed
Message-ID: <202605312254.Hq7NDsrh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Mike Rapoport <rppt@kernel.org>
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd/vm-flags
head:   6e5ee99cca356fc64e209b742732ca990b4bc23a
commit: 6e5ee99cca356fc64e209b742732ca990b4bc23a [20/20] userfaultfd: collapse VM_UFFD_{MISSING,WP,MINOR,RWP} into single VM_UFFD
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260531/202605312254.Hq7NDsrh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605312254.Hq7NDsrh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605312254.Hq7NDsrh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/huge_memory.c:2983:35: error: call to '__compiletime_assert_621' declared with 'error' attribute: BUILD_BUG failed
    2983 |                 _dst_pmd = pmd_modify(_dst_pmd, PAGE_NONE);
         |                                                 ^
   include/linux/pgtable.h:2087:22: note: expanded from macro 'PAGE_NONE'
    2087 | #define PAGE_NONE ({ BUILD_BUG(); (pgprot_t){0}; })
         |                      ^
   include/linux/build_bug.h:60:21: note: expanded from macro 'BUILD_BUG'
      60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:680:4: note: expanded from macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:205:1: note: expanded from here
     205 | __compiletime_assert_621
         | ^
   1 error generated.
--
   mm/userfaultfd.c:4807:1: warning: alias and aliasee have different types 'long (int)' and 'long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((int)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long)') [-Wattribute-alias]
    4807 | SYSCALL_DEFINE1(userfaultfd, int, flags)
         | ^
   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFINE1'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DEFINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name))));    \
         |                                ^
   mm/userfaultfd.c:4807:1: note: aliasee is declared here
   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFINE1'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DEFINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
         |                         ^
   <scratch space>:108:1: note: expanded from here
     108 | __se_sys_userfaultfd
         | ^
>> mm/userfaultfd.c:1360:44: error: call to '__compiletime_assert_604' declared with 'error' attribute: BUILD_BUG failed
    1360 |                         orig_dst_pte = pte_modify(orig_dst_pte, PAGE_NONE);
         |                                                                 ^
   include/linux/pgtable.h:2087:22: note: expanded from macro 'PAGE_NONE'
    2087 | #define PAGE_NONE ({ BUILD_BUG(); (pgprot_t){0}; })
         |                      ^
   include/linux/build_bug.h:60:21: note: expanded from macro 'BUILD_BUG'
      60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:680:4: note: expanded from macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:99:1: note: expanded from here
      99 | __compiletime_assert_604
         | ^
   mm/userfaultfd.c:1360:44: note: called by function 'move_present_ptes'
   include/linux/pgtable.h:2087:22: note: expanded from macro 'PAGE_NONE'
    2087 | #define PAGE_NONE ({ BUILD_BUG(); (pgprot_t){0}; })
         |                      ^
   include/linux/build_bug.h:60:21: note: expanded from macro 'BUILD_BUG'
      60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:680:4: note: expanded from macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:99:1: note: expanded from here
      99 | __compiletime_assert_604
         | ^
   mm/userfaultfd.c:1665:9: note: inlined by function 'move_pages_ptes'
    1665 |                 ret = move_present_ptes(mm, dst_vma, src_vma,
         |                       ^
   mm/userfaultfd.c:1360:44: note: use '-gline-directives-only' (implied by '-g1') or higher for more accurate inlining chain locations
    1360 |                         orig_dst_pte = pte_modify(orig_dst_pte, PAGE_NONE);
         |                                                                 ^
   include/linux/pgtable.h:2087:22: note: expanded from macro 'PAGE_NONE'
    2087 | #define PAGE_NONE ({ BUILD_BUG(); (pgprot_t){0}; })
         |                      ^
   include/linux/build_bug.h:60:21: note: expanded from macro 'BUILD_BUG'
      60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:680:4: note: expanded from macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:99:1: note: expanded from here
      99 | __compiletime_assert_604
         | ^
   mm/userfaultfd.c:1474:35: error: call to '__compiletime_assert_605' declared with 'error' attribute: BUILD_BUG failed
    1474 |                 zero_pte = pte_modify(zero_pte, PAGE_NONE);
         |                                                 ^
   include/linux/pgtable.h:2087:22: note: expanded from macro 'PAGE_NONE'
    2087 | #define PAGE_NONE ({ BUILD_BUG(); (pgprot_t){0}; })
         |                      ^
   include/linux/build_bug.h:60:21: note: expanded from macro 'BUILD_BUG'
      60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:680:4: note: expanded from macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:109:1: note: expanded from here
     109 | __compiletime_assert_605
         | ^
   mm/userfaultfd.c:1474:35: note: called by function 'move_zeropage_pte'
   include/linux/pgtable.h:2087:22: note: expanded from macro 'PAGE_NONE'
    2087 | #define PAGE_NONE ({ BUILD_BUG(); (pgprot_t){0}; })
         |                      ^
   include/linux/build_bug.h:60:21: note: expanded from macro 'BUILD_BUG'
      60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'


vim +1360 mm/userfaultfd.c

50944692052b1e Lokesh Gidra            2025-08-13  1297  
50944692052b1e Lokesh Gidra            2025-08-13  1298  /*
cc22b9978509ec Lokesh Gidra            2025-09-23  1299   * Moves src folios to dst in a batch as long as they are not large, and can
cc22b9978509ec Lokesh Gidra            2025-09-23  1300   * successfully take the lock via folio_trylock().
50944692052b1e Lokesh Gidra            2025-08-13  1301   */
50944692052b1e Lokesh Gidra            2025-08-13  1302  static long move_present_ptes(struct mm_struct *mm,
adef440691bab8 Andrea Arcangeli        2023-12-06  1303  			      struct vm_area_struct *dst_vma,
adef440691bab8 Andrea Arcangeli        2023-12-06  1304  			      struct vm_area_struct *src_vma,
adef440691bab8 Andrea Arcangeli        2023-12-06  1305  			      unsigned long dst_addr, unsigned long src_addr,
adef440691bab8 Andrea Arcangeli        2023-12-06  1306  			      pte_t *dst_pte, pte_t *src_pte,
adef440691bab8 Andrea Arcangeli        2023-12-06  1307  			      pte_t orig_dst_pte, pte_t orig_src_pte,
dd95d2782a2516 Qi Zheng                2024-12-04  1308  			      pmd_t *dst_pmd, pmd_t dst_pmdval,
adef440691bab8 Andrea Arcangeli        2023-12-06  1309  			      spinlock_t *dst_ptl, spinlock_t *src_ptl,
cc22b9978509ec Lokesh Gidra            2025-09-23  1310  			      struct folio **first_src_folio, unsigned long len)
adef440691bab8 Andrea Arcangeli        2023-12-06  1311  {
adef440691bab8 Andrea Arcangeli        2023-12-06  1312  	int err = 0;
50944692052b1e Lokesh Gidra            2025-08-13  1313  	struct folio *src_folio = *first_src_folio;
50944692052b1e Lokesh Gidra            2025-08-13  1314  	unsigned long src_start = src_addr;
50944692052b1e Lokesh Gidra            2025-08-13  1315  	unsigned long src_end;
adef440691bab8 Andrea Arcangeli        2023-12-06  1316  
50944692052b1e Lokesh Gidra            2025-08-13  1317  	len = pmd_addr_end(dst_addr, dst_addr + len) - dst_addr;
50944692052b1e Lokesh Gidra            2025-08-13  1318  	src_end = pmd_addr_end(src_addr, src_addr + len);
50944692052b1e Lokesh Gidra            2025-08-13  1319  	flush_cache_range(src_vma, src_addr, src_end);
adef440691bab8 Andrea Arcangeli        2023-12-06  1320  	double_pt_lock(dst_ptl, src_ptl);
adef440691bab8 Andrea Arcangeli        2023-12-06  1321  
dd95d2782a2516 Qi Zheng                2024-12-04  1322  	if (!is_pte_pages_stable(dst_pte, src_pte, orig_dst_pte, orig_src_pte,
dd95d2782a2516 Qi Zheng                2024-12-04  1323  				 dst_pmd, dst_pmdval)) {
adef440691bab8 Andrea Arcangeli        2023-12-06  1324  		err = -EAGAIN;
adef440691bab8 Andrea Arcangeli        2023-12-06  1325  		goto out;
adef440691bab8 Andrea Arcangeli        2023-12-06  1326  	}
adef440691bab8 Andrea Arcangeli        2023-12-06  1327  	if (folio_test_large(src_folio) ||
adef440691bab8 Andrea Arcangeli        2023-12-06  1328  	    folio_maybe_dma_pinned(src_folio) ||
adef440691bab8 Andrea Arcangeli        2023-12-06  1329  	    !PageAnonExclusive(&src_folio->page)) {
adef440691bab8 Andrea Arcangeli        2023-12-06  1330  		err = -EBUSY;
adef440691bab8 Andrea Arcangeli        2023-12-06  1331  		goto out;
adef440691bab8 Andrea Arcangeli        2023-12-06  1332  	}
50944692052b1e Lokesh Gidra            2025-08-13  1333  	/* It's safe to drop the reference now as the page-table is holding one. */
50944692052b1e Lokesh Gidra            2025-08-13  1334  	folio_put(*first_src_folio);
50944692052b1e Lokesh Gidra            2025-08-13  1335  	*first_src_folio = NULL;
0a096ab7a3a6e2 Kevin Brodsky           2025-12-15  1336  	lazy_mmu_mode_enable();
adef440691bab8 Andrea Arcangeli        2023-12-06  1337  
50944692052b1e Lokesh Gidra            2025-08-13  1338  	while (true) {
50944692052b1e Lokesh Gidra            2025-08-13  1339  		orig_src_pte = ptep_get_and_clear(mm, src_addr, src_pte);
adef440691bab8 Andrea Arcangeli        2023-12-06  1340  		/* Folio got pinned from under us. Put it back and fail the move. */
adef440691bab8 Andrea Arcangeli        2023-12-06  1341  		if (folio_maybe_dma_pinned(src_folio)) {
adef440691bab8 Andrea Arcangeli        2023-12-06  1342  			set_pte_at(mm, src_addr, src_pte, orig_src_pte);
adef440691bab8 Andrea Arcangeli        2023-12-06  1343  			err = -EBUSY;
50944692052b1e Lokesh Gidra            2025-08-13  1344  			break;
adef440691bab8 Andrea Arcangeli        2023-12-06  1345  		}
adef440691bab8 Andrea Arcangeli        2023-12-06  1346  
d7a08838ab7465 Qi Zheng                2024-02-22  1347  		folio_move_anon_rmap(src_folio, dst_vma);
b5ba3a64279355 Suren Baghdasaryan      2024-04-14  1348  		src_folio->index = linear_page_index(dst_vma, dst_addr);
d7a08838ab7465 Qi Zheng                2024-02-22  1349  
deb8d4d28e4d05 Matthew Wilcox (Oracle  2025-04-02  1350) 		orig_dst_pte = folio_mk_pte(src_folio, dst_vma->vm_page_prot);
75cb1cca2c8801 Barry Song              2025-05-09  1351  		/* Set soft dirty bit so userspace can notice the pte was moved */
277a1ae3879a82 Chunyan Zhang           2025-11-13  1352  		if (pgtable_supports_soft_dirty())
75cb1cca2c8801 Barry Song              2025-05-09  1353  			orig_dst_pte = pte_mksoft_dirty(orig_dst_pte);
75cb1cca2c8801 Barry Song              2025-05-09  1354  		if (pte_dirty(orig_src_pte))
75cb1cca2c8801 Barry Song              2025-05-09  1355  			orig_dst_pte = pte_mkdirty(orig_dst_pte);
75cb1cca2c8801 Barry Song              2025-05-09  1356  		orig_dst_pte = pte_mkwrite(orig_dst_pte, dst_vma);
45bc0a3ae599d5 Kiryl Shutsemau (Meta   2026-05-22  1357) 
45bc0a3ae599d5 Kiryl Shutsemau (Meta   2026-05-22  1358) 		/* Re-arm RWP on the moved PTE if dst_vma is RWP-registered. */
45bc0a3ae599d5 Kiryl Shutsemau (Meta   2026-05-22  1359) 		if (userfaultfd_rwp(dst_vma)) {
45bc0a3ae599d5 Kiryl Shutsemau (Meta   2026-05-22 @1360) 			orig_dst_pte = pte_modify(orig_dst_pte, PAGE_NONE);
45bc0a3ae599d5 Kiryl Shutsemau (Meta   2026-05-22  1361) 			orig_dst_pte = pte_mkuffd(orig_dst_pte);
45bc0a3ae599d5 Kiryl Shutsemau (Meta   2026-05-22  1362) 		}
45bc0a3ae599d5 Kiryl Shutsemau (Meta   2026-05-22  1363) 
adef440691bab8 Andrea Arcangeli        2023-12-06  1364  		set_pte_at(mm, dst_addr, dst_pte, orig_dst_pte);
50944692052b1e Lokesh Gidra            2025-08-13  1365  
50944692052b1e Lokesh Gidra            2025-08-13  1366  		src_addr += PAGE_SIZE;
50944692052b1e Lokesh Gidra            2025-08-13  1367  		if (src_addr == src_end)
50944692052b1e Lokesh Gidra            2025-08-13  1368  			break;
50944692052b1e Lokesh Gidra            2025-08-13  1369  		dst_addr += PAGE_SIZE;
50944692052b1e Lokesh Gidra            2025-08-13  1370  		dst_pte++;
50944692052b1e Lokesh Gidra            2025-08-13  1371  		src_pte++;
50944692052b1e Lokesh Gidra            2025-08-13  1372  
50944692052b1e Lokesh Gidra            2025-08-13  1373  		folio_unlock(src_folio);
cc22b9978509ec Lokesh Gidra            2025-09-23  1374  		src_folio = check_ptes_for_batched_move(src_vma, src_addr,
cc22b9978509ec Lokesh Gidra            2025-09-23  1375  							src_pte, dst_pte);
50944692052b1e Lokesh Gidra            2025-08-13  1376  		if (!src_folio)
50944692052b1e Lokesh Gidra            2025-08-13  1377  			break;
50944692052b1e Lokesh Gidra            2025-08-13  1378  	}
50944692052b1e Lokesh Gidra            2025-08-13  1379  
0a096ab7a3a6e2 Kevin Brodsky           2025-12-15  1380  	lazy_mmu_mode_disable();
50944692052b1e Lokesh Gidra            2025-08-13  1381  	if (src_addr > src_start)
50944692052b1e Lokesh Gidra            2025-08-13  1382  		flush_tlb_range(src_vma, src_start, src_addr);
50944692052b1e Lokesh Gidra            2025-08-13  1383  
50944692052b1e Lokesh Gidra            2025-08-13  1384  	if (src_folio)
50944692052b1e Lokesh Gidra            2025-08-13  1385  		folio_unlock(src_folio);
adef440691bab8 Andrea Arcangeli        2023-12-06  1386  out:
adef440691bab8 Andrea Arcangeli        2023-12-06  1387  	double_pt_unlock(dst_ptl, src_ptl);
50944692052b1e Lokesh Gidra            2025-08-13  1388  	return src_addr > src_start ? src_addr - src_start : err;
adef440691bab8 Andrea Arcangeli        2023-12-06  1389  }
adef440691bab8 Andrea Arcangeli        2023-12-06  1390  

:::::: The code at line 1360 was first introduced by commit
:::::: 45bc0a3ae599d5726e7474d23a6c7d76e1458ed2 mm: preserve RWP marker across PTE rewrites

:::::: TO: Kiryl Shutsemau (Meta) <kas@kernel.org>
:::::: CC: Mike Rapoport (Microsoft) <rppt@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
