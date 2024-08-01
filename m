Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BECF131BDD
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Aug 2024 02:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722480280; cv=none; b=Ctj/c9wEM1PeIvwq5WUAvn63p6TiaB94+UmXvWkVnZTya45REs2c2/4kAUtQ1eUlzFfrKnzUm5Ir5B7CC/ycmw0cp7iytCuiUmjF3cLGUXIKiQ2HSzXMTSoAABVntvBCOOQg2/EKIPRXT/k1qzLxcMikCjg4Oy1sUpy8b4OO0U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722480280; c=relaxed/simple;
	bh=oRS6cwzq1jL0/n/iSUVyuAkAzA2HmU0zpw/NSzbhHGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WN+uCYoPMwQlN699Zs4A0NN1vXKe4REmATe+BEADjs7jaVf4WL+0hroSp0L7i5zk4uJAVB+n0sOT7kj7tGxB5AD6DFXskUcznzyh046AfENVE7aLRMOo77o5PJjK+jOmWnmH5oGpdIrMHaalR93sdaano7JQPu8uZ1Obr172DxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kuir8zrP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kuir8zrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722480278; x=1754016278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oRS6cwzq1jL0/n/iSUVyuAkAzA2HmU0zpw/NSzbhHGQ=;
  b=Kuir8zrPalsYsuvCUK9LB8m5k7naOozZkJFpDKeny6sPK95MjbeH5kfh
   Cnqa1KGtvkFAj5N8TLOFVBZBaoUYYYGJUt0HPy2mCCu+DkJVfDdKDCsA3
   Q4mKV4QJ72DT1sXZiRbq9J5Yg407ykTMKLtlY/6zcOasCJ/c69sovYDjo
   zphyTDEvjiqFSX4/L5UUXV837awLW2KGbiLjsOgDzuuQUH1s8qjrZP5UK
   h/s6J1wOc/Lft6+WlJ6+WDE85B4ghg171v4p4qbcUjhgjcq9Bg1qtTqIw
   +/QeOBGpRVe5kexVUnE5lB9mvFLOzxVWRavp31RjcDQ2SoUEkvBp5kBjc
   w==;
X-CSE-ConnectionGUID: upGXzNBJSS2SS29S4aOrUg==
X-CSE-MsgGUID: 17e/fCbBQEyc0yk+961zeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20585106"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="20585106"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 19:44:14 -0700
X-CSE-ConnectionGUID: SkeR26/1T0qTlf0PL8q6/A==
X-CSE-MsgGUID: b6AyGeJLTjacM338qZ9hSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="59527016"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jul 2024 19:44:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZLnW-000v8C-2e;
	Thu, 01 Aug 2024 02:44:10 +0000
Date: Thu, 1 Aug 2024 10:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around
 initializer
Message-ID: <202408011051.so4BHeXa-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21b136cc63d2a9ddd60d4699552b69c214b32964
commit: 614d7e99752e02ff6f6d447a83d2929b9649b6cb LoongArch: Add ARCH_HAS_DEBUG_VM_PGTABLE support
date:   12 days ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 days ago
config: loongarch-randconfig-r121-20240801 (https://download.01.org/0day-ci/archive/20240801/202408011051.so4BHeXa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240801/202408011051.so4BHeXa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408011051.so4BHeXa-lkp@intel.com/

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
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h):
   include/linux/spinlock.h:391:9: sparse: sparse: context imbalance in 'debug_vm_pgtable' - unexpected unlock

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
