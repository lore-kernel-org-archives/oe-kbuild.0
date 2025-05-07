Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A2A1DF247
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598029; cv=none; b=I48BK3yiznJglvPmJ0/2fAyTEo18wzR9//oyTfBiWDxatjI7bb9PXZU5lVuOUky5DEpbhob3auuMLBYbPipDSp4oHZS8s6MASHAgmA0kM2+PwEfTRdTwaFJ+rHKqTs0wAOWAeAMwiwFTfWVaCxs7Kf4Uw0cTisByoKpZJEtPw2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598029; c=relaxed/simple;
	bh=ggBZ73ThK9ERX4dWmXF77HDYCGZ1bxSvPxike41m5Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GitDHGQLNcIDsDMW0YLbXE6V+nU7G8pimw9e7RQ6W7qqXpecCgp3SKiJJJvf1uehLFPNw/QirGlONXwCoP58ojwX1lQy7KYi7AGA3sZ7eLk+Y7h5gPWRBsWZ8mNaNP8HH4qA/ZYOWUnFrbLsTHK1vAg7UGPQX8JuwTOAX7oD+3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL6lb/ZZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL6lb/ZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746598028; x=1778134028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ggBZ73ThK9ERX4dWmXF77HDYCGZ1bxSvPxike41m5Ik=;
  b=TL6lb/ZZEPNRzPRkSgT9nZJC3he5o/Hqju95LXCmgsXhZqA9DQRtEgQu
   jxMU9fvjMT5sdXxG6Qt95AL+joImOJ+zwbruLjjRji0IXZR9gQx7M8Mfp
   CwwoPrvnSwkI7CsfWLHlBaK8p1nBLH6wThJvXIw7uXbKIfqdn+4gWBuNd
   /ogOInaA3666kEyLycU9sM7RCCl9iqXgOW9B/2NanQNoAdciYLYmUnICH
   8jnqgkorkikuBfItYFjkWRKf7027XK0rJkLCZZZv90yBR1xlr5u/+LF4w
   FJ7uQjcHyCH3AwdeFxtwtExqb+dl8ftq5m7G27IyCD/X40Q4CtdtcB+gn
   A==;
X-CSE-ConnectionGUID: tSXxn41LQ4+4fac+5Tv8YA==
X-CSE-MsgGUID: zgdYVc5CR7mcopDs5JCwHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48452752"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48452752"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:07:07 -0700
X-CSE-ConnectionGUID: jTPvFo+7TcuTbtGeojj+Dw==
X-CSE-MsgGUID: uKNqunKhRPuscXHpP8ebow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136252156"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 May 2025 23:07:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXvr-00079e-0t;
	Wed, 07 May 2025 06:07:03 +0000
Date: Wed, 7 May 2025 14:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around
 initializer
Message-ID: <202505071309.jMtzwUXF-lkp@intel.com>
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
head:   0d8d44db295ccad20052d6301ef49ff01fb8ae2d
commit: 614d7e99752e02ff6f6d447a83d2929b9649b6cb LoongArch: Add ARCH_HAS_DEBUG_VM_PGTABLE support
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r123-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071309.jMtzwUXF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071309.jMtzwUXF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505071309.jMtzwUXF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around initializer
>> mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around initializer
>> mm/debug_vm_pgtable.c:863:15: sparse: sparse: missing braces around initializer
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
