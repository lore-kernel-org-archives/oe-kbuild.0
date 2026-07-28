Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7502EC0A2
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 15:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252500; cv=none; b=JNKsWojvQLmp63MsPNYO98+n0lBv/IT0Ji32TeZxQyWfro/OY0bbL7yFsWDYF99s2YMg7TTYZyIfff8NTi2eE/eZgZS7xOFGVHfadwHURXVxNrvzAgbbiYRBivZfBdT8fYAOn7sDeYmbdA/JUxMXns/p7I1VfT45vOUuegNU0t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252500; c=relaxed/simple;
	bh=7dauCSpM+fx48heiJ3twEoaf23b64w8zC2wVPnt9NAA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JZRXBmLhiNwgeyy+cx5qoTZMXzsYdzfijZ5dJJ8sl1WDj/rTvpRwpqfMpm0eNl2s/fbixJhdPq9C9jBUUrbSKaxjNVCbE6kEdfZsqYM5rciQC9UQeOXS+gXIfs8IQQB/K0wk/2p90EUn/uC2Mi+iYuya5WVROkytTgyX6wQyqwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UlHz4V/f; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UlHz4V/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785252498; x=1816788498;
  h=date:from:to:cc:subject:message-id;
  bh=7dauCSpM+fx48heiJ3twEoaf23b64w8zC2wVPnt9NAA=;
  b=UlHz4V/f0IX7eVdBON5vmDX/oeX7iJHdFXX8EMHlCuN0sQVVxCTY8GR2
   wJP9IKYaazEkpMZd63rBK8Oe0hwjH8K2PIF4EimCpeqi6WfrakN5QOoVh
   aAinIsyyapxfGaC4Ou+R/f/QdObUBumO3TlmyAs3Hxtro3hCW3viK2kQc
   +WnArWwdK2F4UPyPu7JiSAl1bh9wN9dNNqa7mdo86p8QpFlZJXi1bdsS9
   6KCnlY978yb7QQwcN1G8IUOakuUOmywiBaBDOG90k2aefQG+xFeIrrOIf
   sEzfBUZ4KvP2r0xDFSsOLUYXH6cpFDSWInY3xKbpqQKTYuXOWnSHYukuv
   Q==;
X-CSE-ConnectionGUID: YPtPTkoMRHqd5B/YAoCFLQ==
X-CSE-MsgGUID: HR62af57QpKRMJ5dN2EThQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84820677"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="84820677"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:28:17 -0700
X-CSE-ConnectionGUID: 4w1fdMUNQBGiumgEVAmweQ==
X-CSE-MsgGUID: e5w2iZ/FRdSd/ECaxfo8Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="283076253"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jul 2026 08:28:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wojj3-00000000eTw-2P3E;
	Tue, 28 Jul 2026 15:28:13 +0000
Date: Tue, 28 Jul 2026 23:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/mm/book3s64/hugetlbpage.c:77 __hash_page_huge()
 warn: bitwise AND condition is false here
Message-ID: <202607282345.BXPzdfQV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alistair Popple <apopple@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62cc90241548d5570ee68e01aaba6506964e9811
commit: bea0cc7cf4a51e8d3a0042212df3b83b49df58a7 powerpc: remove checks for devmap pages and PMDs/PUDs
date:   1 year, 1 month ago
:::::: branch date: 18 hours ago
:::::: commit date: 1 year, 1 month ago
config: powerpc64-randconfig-r071-20260728 (https://download.01.org/0day-ci/archive/20260728/202607282345.BXPzdfQV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bea0cc7cf4a5 ("powerpc: remove checks for devmap pages and PMDs/PUDs")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607282345.BXPzdfQV-lkp@intel.com/

New smatch warnings:
arch/powerpc/mm/book3s64/hugetlbpage.c:77 __hash_page_huge() warn: bitwise AND condition is false here

Old smatch warnings:
arch/powerpc/include/asm/mmu.h:253 mmu_has_feature() warn: bitwise AND condition is false here

vim +77 arch/powerpc/mm/book3s64/hugetlbpage.c

c5710cd2073503 arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-04-26   18  
387e220a2e5e63 arch/powerpc/mm/book3s64/hugetlbpage.c      Nicholas Piggin        2021-12-02   19  #ifdef CONFIG_PPC_64S_HASH_MMU
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   20  int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
aefa5688c07072 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2014-12-04   21  		     pte_t *ptep, unsigned long trap, unsigned long flags,
aefa5688c07072 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2014-12-04   22  		     int ssize, unsigned int shift, unsigned int mmu_psize)
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   23  {
bf9a95f9a6481b arch/powerpc/mm/hugetlbpage-hash64.c        Ram Pai                2017-11-06   24  	real_pte_t rpte;
5524a27d39b687 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2012-09-10   25  	unsigned long vpn;
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   26  	unsigned long old_pte, new_pte;
8132cf115efc3b arch/powerpc/mm/hugetlbpage-hash64.c        Qian Cai               2019-02-27   27  	unsigned long rflags, pa;
ff31e105464d8c arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11   28  	long slot, offset;
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   29  
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   30  	BUG_ON(shift != mmu_psize_defs[mmu_psize].shift);
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   31  
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   32  	/* Search the Linux page table for a match with va */
5524a27d39b687 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2012-09-10   33  	vpn = hpt_vpn(ea, vsid, ssize);
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   34  
47d99948eee48a arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   35  	/*
47d99948eee48a arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   36  	 * At this point, we have a pte (old_pte) which can be used to build
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   37  	 * or update an HPTE. There are 2 cases:
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   38  	 *
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   39  	 * 1. There is a valid (present) pte with no associated HPTE (this is
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   40  	 *	the most common case)
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   41  	 * 2. There is a valid (present) pte with an associated HPTE. The
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   42  	 *	current values of the pp bits in the HPTE prevent access
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   43  	 *	because we are doing software DIRTY bit management and the
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   44  	 *	page is currently not DIRTY.
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   45  	 */
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   46  
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   47  
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   48  	do {
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   49  		old_pte = pte_val(*ptep);
171aa2caaad16e arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23   50  		/* If PTE busy, retry the access */
945537df7a107e arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29   51  		if (unlikely(old_pte & H_PAGE_BUSY))
171aa2caaad16e arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23   52  			return 0;
171aa2caaad16e arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23   53  		/* If PTE permissions don't match, take page fault */
ac29c64089b74d arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29   54  		if (unlikely(!check_pte_access(access, old_pte)))
171aa2caaad16e arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23   55  			return 1;
57fb15c32f4f6a arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   56  		/*
57fb15c32f4f6a arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   57  		 * If hash-4k, hugepages use seeral contiguous PxD entries
57fb15c32f4f6a arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   58  		 * so bail out and let mm make the page young or dirty
57fb15c32f4f6a arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   59  		 */
57fb15c32f4f6a arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   60  		if (IS_ENABLED(CONFIG_PPC_4K_PAGES)) {
57fb15c32f4f6a arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   61  			if (!(old_pte & _PAGE_ACCESSED))
57fb15c32f4f6a arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   62  				return 1;
57fb15c32f4f6a arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   63  			if ((access & _PAGE_WRITE) && !(old_pte & _PAGE_DIRTY))
57fb15c32f4f6a arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   64  				return 1;
57fb15c32f4f6a arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   65  		}
ac29c64089b74d arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29   66  
47d99948eee48a arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   67  		/*
47d99948eee48a arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   68  		 * Try to lock the PTE, add ACCESSED and DIRTY if it was
47d99948eee48a arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   69  		 * a write access
47d99948eee48a arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   70  		 */
945537df7a107e arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29   71  		new_pte = old_pte | H_PAGE_BUSY | _PAGE_ACCESSED;
c7d54842deb1fa arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29   72  		if (access & _PAGE_WRITE)
171aa2caaad16e arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23   73  			new_pte |= _PAGE_DIRTY;
3910a7f485e122 arch/powerpc/mm/hugetlbpage-hash64.c        Michael Ellerman       2016-04-29   74  	} while(!pte_xchg(ptep, __pte(old_pte), __pte(new_pte)));
3910a7f485e122 arch/powerpc/mm/hugetlbpage-hash64.c        Michael Ellerman       2016-04-29   75  
75646c480fdeff arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-09-20   76  	/* Make sure this is a hugetlb entry */
bea0cc7cf4a51e arch/powerpc/mm/book3s64/hugetlbpage.c      Alistair Popple        2025-06-19  @77  	if (old_pte & H_PAGE_THP_HUGE)
75646c480fdeff arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-09-20   78  		return 0;
75646c480fdeff arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-09-20   79  
d94b827e89dc3f arch/powerpc/mm/book3s64/hash_hugetlbpage.c Aneesh Kumar K.V       2020-11-27   80  	rflags = htab_convert_pte_flags(new_pte, flags);
ff31e105464d8c arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11   81  	if (unlikely(mmu_psize == MMU_PAGE_16G))
ff31e105464d8c arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11   82  		offset = PTRS_PER_PUD;
ff31e105464d8c arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11   83  	else
ff31e105464d8c arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11   84  		offset = PTRS_PER_PMD;
ff31e105464d8c arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11   85  	rpte = __real_pte(__pte(old_pte), ptep, offset);
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   86  
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   87  	if (!cpu_has_feature(CPU_FTR_COHERENT_ICACHE))
47d99948eee48a arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   88  		/*
47d99948eee48a arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   89  		 * No CPU has hugepages but lacks no execute, so we
47d99948eee48a arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   90  		 * don't need to worry about that case
47d99948eee48a arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   91  		 */
0895ecda79428d arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   92  		rflags = hash_page_do_lazy_icache(rflags, __pte(old_pte), trap);
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   93  
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   94  	/* Check if pte already has an hpte (case 2) */
945537df7a107e arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29   95  	if (unlikely(old_pte & H_PAGE_HASHPTE)) {
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   96  		/* There MIGHT be an HPTE for this pte */
bf9a95f9a6481b arch/powerpc/mm/hugetlbpage-hash64.c        Ram Pai                2017-11-06   97  		unsigned long gslot;
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   98  
bf9a95f9a6481b arch/powerpc/mm/hugetlbpage-hash64.c        Ram Pai                2017-11-06   99  		gslot = pte_get_hash_gslot(vpn, shift, ssize, rpte, 0);
bf9a95f9a6481b arch/powerpc/mm/hugetlbpage-hash64.c        Ram Pai                2017-11-06  100  		if (mmu_hash_ops.hpte_updatepp(gslot, rflags, vpn, mmu_psize,
aefa5688c07072 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2014-12-04  101  					       mmu_psize, ssize, flags) == -1)
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  102  			old_pte &= ~_PAGE_HPTEFLAGS;
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  103  	}
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  104  
945537df7a107e arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29  105  	if (likely(!(old_pte & H_PAGE_HASHPTE))) {
5524a27d39b687 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2012-09-10  106  		unsigned long hash = hpt_hash(vpn, shift, ssize);
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  107  
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  108  		pa = pte_pfn(__pte(old_pte)) << PAGE_SHIFT;
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  109  
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  110  		/* clear HPTE slot informations in new PTE */
945537df7a107e arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29  111  		new_pte = (new_pte & ~_PAGE_HPTEFLAGS) | H_PAGE_HASHPTE;
bf680d51605662 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2015-12-01  112  
b170bd3de6a7f6 arch/powerpc/mm/hugetlbpage-hash64.c        Li Zhong               2013-04-15  113  		slot = hpte_insert_repeating(hash, vpn, pa, rflags, 0,
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  114  					     mmu_psize, ssize);
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  115  
b1623e7eb280f8 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  116  		/*
b1623e7eb280f8 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  117  		 * Hypervisor failure. Restore old pte and return -1
b1623e7eb280f8 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  118  		 * similar to __hash_page_*
b1623e7eb280f8 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  119  		 */
b1623e7eb280f8 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  120  		if (unlikely(slot == -2)) {
b1623e7eb280f8 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  121  			*ptep = __pte(old_pte);
4b8692c022a4b1 arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23  122  			hash_failure_debug(ea, access, vsid, trap, ssize,
d8139ebf8596a1 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2013-04-28  123  					   mmu_psize, mmu_psize, old_pte);
171aa2caaad16e arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23  124  			return -1;
b1623e7eb280f8 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  125  		}
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  126  
ff31e105464d8c arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11  127  		new_pte |= pte_set_hidx(ptep, rpte, 0, slot, offset);
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  128  	}
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  129  
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  130  	/*
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  131  	 * No need to use ldarx/stdcx here
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  132  	 */
945537df7a107e arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29  133  	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
171aa2caaad16e arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23  134  	return 0;
883a3e523672eb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  135  }
387e220a2e5e63 arch/powerpc/mm/book3s64/hugetlbpage.c      Nicholas Piggin        2021-12-02  136  #endif
8ef5cbde6dafce arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2019-03-05  137  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
