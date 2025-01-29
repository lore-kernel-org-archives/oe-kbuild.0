Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77156191489
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jan 2025 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738187759; cv=none; b=H3vIJ/Betl5XyjvKDbR/Ub5V26iOPP7RMUJuVpD4Qqta73bRiVf5kF/4YcUdKa6g5Jc/9Vg3j4UceCfFJQlLzA9WAkNyE2/JGKTPUDHFQg+1YA1qAp7/XVe9VKPnIdxwyQmxuuEoqzXJ28iOY6piX5lAuXnBZ3lwCULgjQHX1Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738187759; c=relaxed/simple;
	bh=0nG6dD+T+9wYxXsEjupdqzAQclHGaSf6V8gL5ZDqQVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ISM0zOMYORKZ311TFxCISdP2L8ZDjYx2I7a6neLuDkBcY3meoPvb2HjC07oDe+U6Bfpa9YF8eGF2rbscfQizJhVlkygATjnQgQ8DB+ijsJaWvSYYcQGSX4euILN2DNJXuTxwOHyyMe5hSKXOFxKBkH98ljtaVQuOlvBqkM06ap4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZ6zDgpC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZ6zDgpC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738187758; x=1769723758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0nG6dD+T+9wYxXsEjupdqzAQclHGaSf6V8gL5ZDqQVE=;
  b=mZ6zDgpCGiVuLUn2rJ8AmcoR+qV6Ddx1/x49qMQ+HMJcF6k99aJtDt3a
   D3eQPhbdFlRcPlo8olStV/rmHJkHog8areG1gxQ+yNITRz51TYAg+l+4s
   RmE7U5VB6fE+lLfEaOKYmgqulErUHRRpF8GgfEMXGgxHrep0jfqFKF/qa
   i1EAKqu2Q02w1IIVeLLjtH4KTK/abgxPXQLXuwrp978F3hrJwt0tBjso7
   Cw7b/CWJwCC5JQbk4XJJcdroAKlk4jn2yMALruy2uW3Ey09Eb/f4uBvIx
   mqRXfjBmeQOwHJt3/RMNfLLsoJgQ6hEfO143/LCEfOhBbfKamBKMNpc1p
   A==;
X-CSE-ConnectionGUID: N9XodqoNT3idWsAX84aKPA==
X-CSE-MsgGUID: JuPwbFVLTc+ITINIpUytNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="61195325"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="61195325"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 13:55:57 -0800
X-CSE-ConnectionGUID: o8hqTl1uSiecJ1KWjZhr+g==
X-CSE-MsgGUID: T86FWZqRQTuM+2IWieSW5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="109738256"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jan 2025 13:55:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdG2L-000jOp-2I;
	Wed, 29 Jan 2025 21:55:53 +0000
Date: Thu, 30 Jan 2025 05:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around
 initializer
Message-ID: <202501300505.xFA6DXlk-lkp@intel.com>
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
head:   ebbb8be421eefbe2d47b99c2e1a6dd840d7930f9
commit: 614d7e99752e02ff6f6d447a83d2929b9649b6cb LoongArch: Add ARCH_HAS_DEBUG_VM_PGTABLE support
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-r132-20250130 (https://download.01.org/0day-ci/archive/20250130/202501300505.xFA6DXlk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250130/202501300505.xFA6DXlk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501300505.xFA6DXlk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around initializer
>> mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around initializer
>> mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around initializer
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/kasan.h, include/linux/slab.h, include/linux/fs.h, include/linux/highmem.h):
   include/linux/pgtable.h:977:34: sparse: sparse: self-comparison always evaluates to true
   include/linux/pgtable.h:1022:34: sparse: sparse: self-comparison always evaluates to true
   include/linux/pgtable.h:1037:34: sparse: sparse: self-comparison always evaluates to true
   include/linux/pgtable.h:1044:34: sparse: sparse: self-comparison always evaluates to true
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/gfp.h):
   include/linux/mmzone.h:2016:40: sparse: sparse: self-comparison always evaluates to false
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
