Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85C5188A18
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Sep 2024 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725378439; cv=none; b=jUhOtHpXxkuE38CvQ1/ZGeKhC7d8t+3KfFk1KEV27aeqNZf8XNvastrfOPMnoh9xzHANwPA5BKonq8BCX7Tgf2CKHxfUbt1CBiXg1iGStVWwP/dOKFFtGDhl6Qhoe/EZDA/oTjlMqr2IH8uOdncU1ayBgq8lGtowLd5G6Ah/Lwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725378439; c=relaxed/simple;
	bh=XxdVX5g/B3OsF9RLLtGppVqqijYUuEhqF+OVcGHJnAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVS8+Auylko8DFxg/eOharsogyNv/HWznUjpG6k6tmyXDkAiU5XUHUrtz+Y7OFTcDY1aPaz5UkZAvIKj7TuZi8NWnfnJJQ60SOjU0yAvnejznlNQHpqjOMKecBnXtcr6YyyiUgepIxsYAZxcXndAID+PFZyZ2c7sFW/+dZjYQqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0IyIKUx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0IyIKUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725378436; x=1756914436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XxdVX5g/B3OsF9RLLtGppVqqijYUuEhqF+OVcGHJnAQ=;
  b=n0IyIKUxlMlJuXoHfYKvL29khwH1L++aDuZX+uzy3t46eCw2pREUZb2o
   0g+nMaWfim41N1C7LSEhmK1+2QbJ1ABE90itlzaIvcTzbxQweHldZiwg+
   MvZht9tmBVmI244/2hM2MOR+lphgHsaDkGILo8q6AXknMqw97NFhsxZWZ
   ouGvfCwE2YA73yRY3YF3IiGcRLtcZkL7xLDrCrWOq7EbVUHmC4VmQi4+2
   fQ2Zvo5TaqevgLVElCQqmtA6HjYPIGIjUxXKy3F5Mb8a5TYNDKHCwkhqa
   srWDpDZsL0NMFfLIjEn2IjTxrQreaSy0lhOujaAjfpA91+tRFPe3bUTWw
   Q==;
X-CSE-ConnectionGUID: fKeXgEQaQ+mTSC/JBPHS5Q==
X-CSE-MsgGUID: mEkd0/1sSGaMJK7kr98zEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23502752"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23502752"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:47:15 -0700
X-CSE-ConnectionGUID: eEGva/BwRHOZHLvnSfVP1w==
X-CSE-MsgGUID: JJJIkQxVTQKZ/7bCe2kJdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65174675"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2024 08:47:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slVkO-0006r0-1O;
	Tue, 03 Sep 2024 15:47:12 +0000
Date: Tue, 3 Sep 2024 23:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around
 initializer
Message-ID: <202409032306.nvKodH2Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>

Hi Huacai,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67784a74e258a467225f0e68335df77acd67b7ab
commit: 614d7e99752e02ff6f6d447a83d2929b9649b6cb LoongArch: Add ARCH_HAS_DEBUG_VM_PGTABLE support
date:   6 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: loongarch-randconfig-r133-20240903 (https://download.01.org/0day-ci/archive/20240903/202409032306.nvKodH2Q-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240903/202409032306.nvKodH2Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409032306.nvKodH2Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around initializer
>> mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around initializer
>> mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around initializer
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   mm/debug_vm_pgtable.c: note: in included file (through include/asm-generic/io.h, arch/loongarch/include/asm/io.h, arch/loongarch/include/asm/kasan.h, ...):
   include/linux/pgtable.h:977:34: sparse: sparse: self-comparison always evaluates to true
   include/linux/pgtable.h:1022:34: sparse: sparse: self-comparison always evaluates to true
   include/linux/pgtable.h:1037:34: sparse: sparse: self-comparison always evaluates to true
   include/linux/pgtable.h:1044:34: sparse: sparse: self-comparison always evaluates to true
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/gfp.h):
   include/linux/mmzone.h:2016:40: sparse: sparse: self-comparison always evaluates to false
   mm/debug_vm_pgtable.c:1374:17: sparse: sparse: context imbalance in 'debug_vm_pgtable' - unexpected unlock

vim +863 mm/debug_vm_pgtable.c

05289402d71736b Anshuman Khandual 2020-08-06  850  
05289402d71736b Anshuman Khandual 2020-08-06  851  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
5f447e8067fd9f4 Gavin Shan        2021-09-02  852  static void __init pmd_swap_tests(struct pgtable_debug_args *args)
05289402d71736b Anshuman Khandual 2020-08-06  853  {
05289402d71736b Anshuman Khandual 2020-08-06  854  	swp_entry_t swp;
05289402d71736b Anshuman Khandual 2020-08-06  855  	pmd_t pmd;
05289402d71736b Anshuman Khandual 2020-08-06  856  
65ac1a60a57e2c5 Anshuman Khandual 2021-06-28  857  	if (!has_transparent_hugepage())
65ac1a60a57e2c5 Anshuman Khandual 2021-06-28  858  		return;
65ac1a60a57e2c5 Anshuman Khandual 2021-06-28  859  
6315df41afccf12 Anshuman Khandual 2020-08-06  860  	pr_debug("Validating PMD swap\n");
5f447e8067fd9f4 Gavin Shan        2021-09-02  861  	pmd = pfn_pmd(args->fixed_pmd_pfn, args->page_prot);
05289402d71736b Anshuman Khandual 2020-08-06  862  	swp = __pmd_to_swp_entry(pmd);
05289402d71736b Anshuman Khandual 2020-08-06 @863  	pmd = __swp_entry_to_pmd(swp);
5f447e8067fd9f4 Gavin Shan        2021-09-02  864  	WARN_ON(args->fixed_pmd_pfn != pmd_pfn(pmd));
05289402d71736b Anshuman Khandual 2020-08-06  865  }
05289402d71736b Anshuman Khandual 2020-08-06  866  #else  /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
5f447e8067fd9f4 Gavin Shan        2021-09-02  867  static void __init pmd_swap_tests(struct pgtable_debug_args *args) { }
05289402d71736b Anshuman Khandual 2020-08-06  868  #endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
05289402d71736b Anshuman Khandual 2020-08-06  869  

:::::: The code at line 863 was first introduced by commit
:::::: 05289402d71736bd275902372e4b25664aeac6b8 mm/debug_vm_pgtable: add tests validating arch helpers for core MM features

:::::: TO: Anshuman Khandual <anshuman.khandual@arm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
