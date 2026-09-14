Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CB83DFC8A
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 14:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397577; cv=none; b=ZErI77UDa2zxnWAEe7+JDL+n+a50V6CWI9IlA1Q6MtOJOCLOaxYmao9buQIP6y1nq7t6LnPqQJkEEpVJ5ENoxxjyDtN4I6c7W9LdrrBwKdp2SZa23nGxFHeqf7tXL4JEkQuRglVLrETZ35y1+ew5nEv/t6Zi6eXax5vIOu9YIR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397577; c=relaxed/simple;
	bh=9prHVGg2+NRq1Cy1RBswnn+mBMpkzZdx4MzHfORa2rE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YXGqBXn2Nj0AFWXetSnMIBV14pwLRsIi4rRHcUVvrDHEHPx2QHt7V10blntDJrGaJ7XT9/WqBfOCB1N7P0S7cVdCBbQRK9C5WA2SP6wHhtwqhkb6Pfc5yN3tABfQgwPcTdzfj13HqCrWsLNVBP8tRvHLIN6LNMVdzG/9shbbzmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOQ3t+qk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOQ3t+qk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789397575; x=1820933575;
  h=date:from:to:cc:subject:message-id;
  bh=9prHVGg2+NRq1Cy1RBswnn+mBMpkzZdx4MzHfORa2rE=;
  b=lOQ3t+qkxClGUhI638Yy32yhCfgNPeTdsTfcppSE5Oq7oQ3g3MO5QVni
   INynJmQgNQhI1/CY3G52EIHC2SE8lfBBe4DAq/1lWrFMzGQ/dbUDOF7dq
   CAKI9eJJ1nXNc/Y4FpN2B9sxhtIKZo/IaHuLKEgnuUK3MpPkuAu3lKX4G
   abbe77yK3CegykU8fvSH302ERjVuo2SvjX6drvFKDa4bfhV1LQzeQiqvA
   aDQLJ2NSVpB/KJbxueH62OZEablY6Hb7NN+WFB6j8MeMcQSgS06mN5qR6
   0SDdsj1OgnxilFdZ5lrLYY2Ga1EKArBLKSzmEm2IkJx4tDCLcpHC7/FIJ
   g==;
X-CSE-ConnectionGUID: oAYrNY3JT9aRrBYOQ1Mp6w==
X-CSE-MsgGUID: aCOT0F9/Reyl7eeKuQW0zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89687281"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89687281"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 07:52:54 -0700
X-CSE-ConnectionGUID: SLfeKjsaQz+MoNL/kyZx2w==
X-CSE-MsgGUID: m/ooTH2ERA6cq1CFwUJKmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273175997"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Sep 2026 07:52:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6839-0000000030d-1KU5;
	Mon, 14 Sep 2026 14:52:51 +0000
Date: Mon, 14 Sep 2026 22:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/mm/fault.c:134:22: error: 'PTVAL_STR_MAX'
 undeclared
Message-ID: <202609142216.ToCDWhpL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Anshuman-Khandual/arm64-mm-Move-__check_safe_pte_update/20260909-093004, commit: adfcfb8f361eadd9da277cd41d20ba0ac620e94d"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Anshuman Khandual <anshuman.khandual@arm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/arm64-mm-Move-__check_safe_pte_update/20260909-093004
head:   adfcfb8f361eadd9da277cd41d20ba0ac620e94d
commit: adfcfb8f361eadd9da277cd41d20ba0ac620e94d arm64/mm: Standardize printing for pgtable entries
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260914/202609142216.ToCDWhpL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609142216.ToCDWhpL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609142216.ToCDWhpL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm64/mm/fault.c: In function 'show_pte':
>> arch/arm64/mm/fault.c:134:22: error: 'PTVAL_STR_MAX' undeclared (first use in this function)
     134 |         char pxd_str[PTVAL_STR_MAX];
         |                      ^~~~~~~~~~~~~
   arch/arm64/mm/fault.c:134:22: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm64/mm/fault.c:164:9: error: implicit declaration of function 'ptval_to_str' [-Wimplicit-function-declaration]
     164 |         ptval_to_str(pxd_str, pgd_val(pgd));
         |         ^~~~~~~~~~~~
>> arch/arm64/mm/fault.c:134:14: warning: unused variable 'pxd_str' [-Wunused-variable]
     134 |         char pxd_str[PTVAL_STR_MAX];
         |              ^~~~~~~


vim +/PTVAL_STR_MAX +134 arch/arm64/mm/fault.c

e4365f968fcd5ef Mark Rutland       2019-10-03  128  
1d18c47c735e8ad Catalin Marinas    2012-03-05  129  /*
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  130   * Dump out the page tables associated with 'addr' in the currently active mm.
1d18c47c735e8ad Catalin Marinas    2012-03-05  131   */
7048a5973eb1d6a Will Deacon        2019-04-03  132  static void show_pte(unsigned long addr)
1d18c47c735e8ad Catalin Marinas    2012-03-05  133  {
adfcfb8f361eadd Anshuman Khandual  2026-09-09 @134  	char pxd_str[PTVAL_STR_MAX];
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  135  	struct mm_struct *mm;
20a004e7b017cce Will Deacon        2018-02-15  136  	pgd_t *pgdp;
20a004e7b017cce Will Deacon        2018-02-15  137  	pgd_t pgd;
1d18c47c735e8ad Catalin Marinas    2012-03-05  138  
356607f21e60352 Andrey Konovalov   2018-12-28  139  	if (is_ttbr0_addr(addr)) {
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  140  		/* TTBR0 */
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  141  		mm = current->active_mm;
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  142  		if (mm == &init_mm) {
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  143  			pr_alert("[%016lx] user address but active_mm is swapper\n",
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  144  				 addr);
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  145  			return;
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  146  		}
356607f21e60352 Andrey Konovalov   2018-12-28  147  	} else if (is_ttbr1_addr(addr)) {
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  148  		/* TTBR1 */
1d18c47c735e8ad Catalin Marinas    2012-03-05  149  		mm = &init_mm;
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  150  	} else {
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  151  		pr_alert("[%016lx] address between user and kernel address ranges\n",
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  152  			 addr);
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  153  		return;
67ce16ec15ce9d9 Kristina Martsenko 2017-06-09  154  	}
1d18c47c735e8ad Catalin Marinas    2012-03-05  155  
5383cc6efed1378 Steve Capper       2019-08-07  156  	pr_alert("%s pgtable: %luk pages, %llu-bit VAs, pgdp=%016lx\n",
1eb34b6e5160f20 Will Deacon        2017-05-15  157  		 mm == &init_mm ? "swapper" : "user", PAGE_SIZE / SZ_1K,
e4365f968fcd5ef Mark Rutland       2019-10-03  158  		 vabits_actual, mm_to_pgd_phys(mm));
a77644d009dece1 Karl Mehltretter   2026-08-28  159  
a77644d009dece1 Karl Mehltretter   2026-08-28  160  	guard(irqsave)();
a77644d009dece1 Karl Mehltretter   2026-08-28  161  
20a004e7b017cce Will Deacon        2018-02-15  162  	pgdp = pgd_offset(mm, addr);
20a004e7b017cce Will Deacon        2018-02-15  163  	pgd = READ_ONCE(*pgdp);
adfcfb8f361eadd Anshuman Khandual  2026-09-09 @164  	ptval_to_str(pxd_str, pgd_val(pgd));
adfcfb8f361eadd Anshuman Khandual  2026-09-09  165  	pr_alert("[%016lx] pgd=%s", addr, pxd_str);
1d18c47c735e8ad Catalin Marinas    2012-03-05  166  
1d18c47c735e8ad Catalin Marinas    2012-03-05  167  	do {
e9f6376858b9799 Mike Rapoport      2020-06-04  168  		p4d_t *p4dp, p4d;
20a004e7b017cce Will Deacon        2018-02-15  169  		pud_t *pudp, pud;
20a004e7b017cce Will Deacon        2018-02-15  170  		pmd_t *pmdp, pmd;
20a004e7b017cce Will Deacon        2018-02-15  171  		pte_t *ptep, pte;
1d18c47c735e8ad Catalin Marinas    2012-03-05  172  
20a004e7b017cce Will Deacon        2018-02-15  173  		if (pgd_none(pgd) || pgd_bad(pgd))
1d18c47c735e8ad Catalin Marinas    2012-03-05  174  			break;
1d18c47c735e8ad Catalin Marinas    2012-03-05  175  
a77644d009dece1 Karl Mehltretter   2026-08-28  176  		p4dp = p4d_offset_lockless(pgdp, pgd, addr);
e9f6376858b9799 Mike Rapoport      2020-06-04  177  		p4d = READ_ONCE(*p4dp);
adfcfb8f361eadd Anshuman Khandual  2026-09-09  178  		ptval_to_str(pxd_str, p4d_val(p4d));
adfcfb8f361eadd Anshuman Khandual  2026-09-09  179  		pr_cont(", p4d=%s", pxd_str);
e9f6376858b9799 Mike Rapoport      2020-06-04  180  		if (p4d_none(p4d) || p4d_bad(p4d))
e9f6376858b9799 Mike Rapoport      2020-06-04  181  			break;
e9f6376858b9799 Mike Rapoport      2020-06-04  182  
a77644d009dece1 Karl Mehltretter   2026-08-28  183  		pudp = pud_offset_lockless(p4dp, p4d, addr);
20a004e7b017cce Will Deacon        2018-02-15  184  		pud = READ_ONCE(*pudp);
adfcfb8f361eadd Anshuman Khandual  2026-09-09  185  		ptval_to_str(pxd_str, pud_val(pud));
adfcfb8f361eadd Anshuman Khandual  2026-09-09  186  		pr_cont(", pud=%s", pxd_str);
20a004e7b017cce Will Deacon        2018-02-15  187  		if (pud_none(pud) || pud_bad(pud))
1d18c47c735e8ad Catalin Marinas    2012-03-05  188  			break;
1d18c47c735e8ad Catalin Marinas    2012-03-05  189  
a77644d009dece1 Karl Mehltretter   2026-08-28  190  		pmdp = pmd_offset_lockless(pudp, pud, addr);
20a004e7b017cce Will Deacon        2018-02-15  191  		pmd = READ_ONCE(*pmdp);
adfcfb8f361eadd Anshuman Khandual  2026-09-09  192  		ptval_to_str(pxd_str, pmd_val(pmd));
adfcfb8f361eadd Anshuman Khandual  2026-09-09  193  		pr_cont(", pmd=%s", pxd_str);
20a004e7b017cce Will Deacon        2018-02-15  194  		if (pmd_none(pmd) || pmd_bad(pmd))
1d18c47c735e8ad Catalin Marinas    2012-03-05  195  			break;
1d18c47c735e8ad Catalin Marinas    2012-03-05  196  
a77644d009dece1 Karl Mehltretter   2026-08-28  197  		ptep = pte_offset_map(&pmd, addr);
52924726f4c06b3 Hugh Dickins       2023-06-08  198  		if (!ptep)
52924726f4c06b3 Hugh Dickins       2023-06-08  199  			break;
52924726f4c06b3 Hugh Dickins       2023-06-08  200  
5a00bfd6a52cf31 Ryan Roberts       2024-02-15  201  		pte = __ptep_get(ptep);
adfcfb8f361eadd Anshuman Khandual  2026-09-09  202  		ptval_to_str(pxd_str, pte_val(pte));
adfcfb8f361eadd Anshuman Khandual  2026-09-09  203  		pr_cont(", pte=%s", pxd_str);
20a004e7b017cce Will Deacon        2018-02-15  204  		pte_unmap(ptep);
1d18c47c735e8ad Catalin Marinas    2012-03-05  205  	} while(0);
1d18c47c735e8ad Catalin Marinas    2012-03-05  206  
6ef4fb387d50fa8 Mark Rutland       2017-01-03  207  	pr_cont("\n");
1d18c47c735e8ad Catalin Marinas    2012-03-05  208  }
1d18c47c735e8ad Catalin Marinas    2012-03-05  209  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
