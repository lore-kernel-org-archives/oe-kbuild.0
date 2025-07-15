Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46501367
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 00:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752540167; cv=none; b=V+eWs2/oDZMKoLZikxUpVUEErSEQg+VYzcJz8+23+yshJuDAxQNGhy0p8L8wI7+ASQyoyejrlcyIIwctwCDFJvjk4clUgJPto6upBwLWAPqjKVyUj/eD3AJqIFavo8mXNfTqk5+ybJdvVqJcuy74W5l56Thxwm6dooPgPw0GPf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752540167; c=relaxed/simple;
	bh=F0qGC7ZzR1NnA5Us1L7nNE7WKDYsLpcVWzOrF/SsXvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F4imZwx244i2BlXkrIBydGugi/mY9L6QwEnqOOpj9ACntSXtBOS49uKHFGLf4uVQT7tp3hGkEOBN28lkxNTQrXYDgRmEFrscd4/eC39DA+4gxdAFV54ORnjFjdSw7Em6s+3Dsuour78OPAwvQlJb/DkrBeyf6iUcIDYSE3qLHhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HmhgM7Xq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmhgM7Xq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752540165; x=1784076165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F0qGC7ZzR1NnA5Us1L7nNE7WKDYsLpcVWzOrF/SsXvc=;
  b=HmhgM7Xq8Td8Nkx+12wEPMubz91ZVLdX8sGG+42f2PVhOe2+x8wXlkub
   ee+aVF+2S8Ptzf+RhafmPp+5LtP9N7cLe5tAqmiFdlRoLzr3AasZ+9mks
   LlbZXT05xIFnYrE9ajajiKgq6ABQ5yIXM/OumgUclZR1CHgn679p36LEE
   PwCtts4OsrRwgo8rSsRs4ZQRlyrAcxmB1b+5rv4/u8eNAal6W6NmK6a6M
   /3W8V3SWdQ4YIszcs7luIcYfT+av97NJUZ/UsPTSEp7ssuKlAHw0KABgZ
   maX4T+E1ao21gKMeUfARhFeTiAw8IYn2pHws0RpC3B9pmK6AaGVpUZ3qs
   Q==;
X-CSE-ConnectionGUID: 4VBcuTe6QLO71y7UEbrvwA==
X-CSE-MsgGUID: lcyFpKVbQROudhDzA7mupw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53858577"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="53858577"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 17:42:45 -0700
X-CSE-ConnectionGUID: jg4ocYocRLub/MPeGWX8gg==
X-CSE-MsgGUID: PVBG+14UQ/KyCAJPi7PmEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="156482302"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jul 2025 17:42:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubTkm-0009UJ-2p;
	Tue, 15 Jul 2025 00:42:40 +0000
Date: Tue, 15 Jul 2025 08:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around
 initializer
Message-ID: <202507150824.N85K2QVW-lkp@intel.com>
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
head:   347e9f5043c89695b01e66b3ed111755afcf1911
commit: 614d7e99752e02ff6f6d447a83d2929b9649b6cb LoongArch: Add ARCH_HAS_DEBUG_VM_PGTABLE support
date:   12 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r111-20250715 (https://download.01.org/0day-ci/archive/20250715/202507150824.N85K2QVW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce: (https://download.01.org/0day-ci/archive/20250715/202507150824.N85K2QVW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507150824.N85K2QVW-lkp@intel.com/

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
