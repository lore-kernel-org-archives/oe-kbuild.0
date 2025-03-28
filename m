Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B5FDDBC
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Mar 2025 00:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743120612; cv=none; b=cuHJaJARcVV/DZ2BRDRntECR1HUdJkIqmf4Lug9tN4JMhP5LSoAxYbkvb82HIQ8YvQqXQvkTtUp2dA6LZiuX1QhrcFLmNmcwzY0p6/cbUQdAZs08LSYx21meSX3S/QQ69auI8agxfK7/anZW70F4il7XNHK/814GosyVd3Riw/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743120612; c=relaxed/simple;
	bh=+wc18Db8+VHp+vGuxixEitT5y36TAEqlCP+lGku6S1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rzq0qDnAw7ZjeOBDCQBFpAjq/D54FdSxNgHu/54SxANSlw2n0JP6P8xjV+WAFqvqQF8MlGBRAzVJAZqfpEZTzHrCH7xT3f6GH2O4L7HLIOQATFDWVpW+JEX8r1UHe9eedPQRqfFxSHDp2Anh1p3KhfM1keh4+YnVvasGm7ezVmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkPxTwlz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkPxTwlz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743120610; x=1774656610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+wc18Db8+VHp+vGuxixEitT5y36TAEqlCP+lGku6S1E=;
  b=ZkPxTwlz/GQGfnj1s+5HpzhkFmtvOSoY5VNB0A8yFzJ8a0d9qpXts/i6
   3aSfTSb7EhRUqWGjYWFWEaVTN5/NdXR3zN9MZ+gs1V7/irmqZzF6mgRBS
   49yEPaZ50d1mqCfB+Fkg+6oyVaEQzlBv+NnuXeOofWFYfpNOuCy4kRYao
   WuFBlvD9deBDINlj3hMzPSwg5kzayHw8qi26SWKedphGdnKmPWOFSbMlL
   HsPdoXab8KmrMNTl0TDBvKsJmz3Z4KUtTipDt/eLR0gTtongqnkLmKhVY
   PoC3Z28prF2A+kjlxqxj+/Xpb+mHBhlZtdoyjM/iPqugJf+HyKyGRZaZ8
   Q==;
X-CSE-ConnectionGUID: 54ZbWuRQQCmhhx/or+FHaQ==
X-CSE-MsgGUID: rFafqXOZSmyqWtGEfr4aWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66948864"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="66948864"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 17:10:07 -0700
X-CSE-ConnectionGUID: U1QCeWD8SFy6nNXanZO9Fw==
X-CSE-MsgGUID: RXHFPb+4RBSpRJLwnuyEUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="125208494"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 27 Mar 2025 17:10:06 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txxIR-00071O-04;
	Fri, 28 Mar 2025 00:10:03 +0000
Date: Fri, 28 Mar 2025 08:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around
 initializer
Message-ID: <202503280845.peMTtGEF-lkp@intel.com>
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
head:   5c2a430e85994f4873ea5ec42091baa1153bc731
commit: 614d7e99752e02ff6f6d447a83d2929b9649b6cb LoongArch: Add ARCH_HAS_DEBUG_VM_PGTABLE support
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r132-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280845.peMTtGEF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250328/202503280845.peMTtGEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503280845.peMTtGEF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around initializer
>> mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around initializer
>> mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around initializer
   mm/debug_vm_pgtable.c:1374:17: sparse: sparse: context imbalance in 'debug_vm_pgtable' - unexpected unlock

vim +863 mm/debug_vm_pgtable.c

05289402d71736 Anshuman Khandual 2020-08-06  850  
05289402d71736 Anshuman Khandual 2020-08-06  851  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
5f447e8067fd9f Gavin Shan        2021-09-02  852  static void __init pmd_swap_tests(struct pgtable_debug_args *args)
05289402d71736 Anshuman Khandual 2020-08-06  853  {
05289402d71736 Anshuman Khandual 2020-08-06  854  	swp_entry_t swp;
05289402d71736 Anshuman Khandual 2020-08-06  855  	pmd_t pmd;
05289402d71736 Anshuman Khandual 2020-08-06  856  
65ac1a60a57e2c Anshuman Khandual 2021-06-28  857  	if (!has_transparent_hugepage())
65ac1a60a57e2c Anshuman Khandual 2021-06-28  858  		return;
65ac1a60a57e2c Anshuman Khandual 2021-06-28  859  
6315df41afccf1 Anshuman Khandual 2020-08-06  860  	pr_debug("Validating PMD swap\n");
5f447e8067fd9f Gavin Shan        2021-09-02  861  	pmd = pfn_pmd(args->fixed_pmd_pfn, args->page_prot);
05289402d71736 Anshuman Khandual 2020-08-06  862  	swp = __pmd_to_swp_entry(pmd);
05289402d71736 Anshuman Khandual 2020-08-06 @863  	pmd = __swp_entry_to_pmd(swp);
5f447e8067fd9f Gavin Shan        2021-09-02  864  	WARN_ON(args->fixed_pmd_pfn != pmd_pfn(pmd));
05289402d71736 Anshuman Khandual 2020-08-06  865  }
05289402d71736 Anshuman Khandual 2020-08-06  866  #else  /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
5f447e8067fd9f Gavin Shan        2021-09-02  867  static void __init pmd_swap_tests(struct pgtable_debug_args *args) { }
05289402d71736 Anshuman Khandual 2020-08-06  868  #endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
05289402d71736 Anshuman Khandual 2020-08-06  869  

:::::: The code at line 863 was first introduced by commit
:::::: 05289402d71736bd275902372e4b25664aeac6b8 mm/debug_vm_pgtable: add tests validating arch helpers for core MM features

:::::: TO: Anshuman Khandual <anshuman.khandual@arm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
