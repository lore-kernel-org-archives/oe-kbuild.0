Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6707A6F06B
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756524106; cv=none; b=IgqlZPreovhk018MlUCHHFEHbkTq5z/xpjkh43bNDoOeg0w4LMikeNaZcWjHjUsEWj7xU/ORNMoekRNOb9/fS6hRMyhzLLxV+WdH7AKNLfrTR1mxgmBNNXfM+UU2dLJzQjM7MZBJB8nHCrORCxAJYAu+PTWfY/DPhH+Z82hE2Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756524106; c=relaxed/simple;
	bh=p2XeOXym4xp2uQEu4NePeca1o5u4acBGvogprhvXcsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C86ZYj0iXE0xLtQ6XGZ2qwKpVL3CAPvktRk7hmOlqTkvLs4m54iZ9izT0MuHnfTZXDcwVigqkLH/4Hm/izKzY3oz5eG+XZ7v0Iss7rfbq9K5lIe+puihLHd+gd6eKrsMHMo0z0GQ58i2qycSB9YYxg2kEYai82vCH+DQk2qYLXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9CAGnt5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9CAGnt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756524104; x=1788060104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p2XeOXym4xp2uQEu4NePeca1o5u4acBGvogprhvXcsE=;
  b=N9CAGnt552kjj93jqYt7Afa6mSETqmx9l/DkClRLvSIEcsmbeWecSZRE
   SCDw4AVCCx0QAI7vrgbyxyYk4Q50aylCjjHYT5aGZDV/dPQghhZS8TUsW
   Taho+xKc1CWuLbzGZEQKp7PymIeUL6tSUa2uUdHv1kvpkGCmqgPG7ZSff
   52/3TI0N9rLuTmAR3PYMWWOK0wU7BAbdiyElp0/v/JpY3b3dY8ZYfxJri
   xFNHECqKjx6WddZMADIzp4nLsfeJxKEprCMsy9XMtD2gkPC8hO5jlQbQe
   8O74FG/cNr3S9K4Mh2ndKglmtaOADpSBa0khdVQwKw+YrPBv3Bv9gMNyz
   w==;
X-CSE-ConnectionGUID: GhE+I/DKS1qqBKlLO067Ow==
X-CSE-MsgGUID: ck7fdDwBTHK3Vh6Ey/1uTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81401470"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81401470"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 20:21:44 -0700
X-CSE-ConnectionGUID: /q42PVwNSDqSh0RfHYwofg==
X-CSE-MsgGUID: ab6bSQNYQtOFqRWtOPYWDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170434906"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Aug 2025 20:21:42 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usC96-000V99-18;
	Sat, 30 Aug 2025 03:21:10 +0000
Date: Sat, 30 Aug 2025 11:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [daveh-devel:kpte 2/6] include/asm-generic/pgalloc.h:281
 __pgd_alloc_noprof() error: uninitialized symbol 'ptdesc'.
Message-ID: <202508301127.c2I2lcpb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dave Hansen <dave.hansen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kpte
head:   d5eaa925a3150c716e8ec564c51069fbdd303fbc
commit: ccbd04de39826d130b67374e68599e128b53acab [2/6] mm: Actually mark kernel page table pages
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: hexagon-randconfig-r072-20250829 (https://download.01.org/0day-ci/archive/20250830/202508301127.c2I2lcpb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508301127.c2I2lcpb-lkp@intel.com/

smatch warnings:
include/asm-generic/pgalloc.h:281 __pgd_alloc_noprof() error: uninitialized symbol 'ptdesc'.

vim +/ptdesc +281 include/asm-generic/pgalloc.h

98a7e47faa3ec3 Kevin Brodsky 2025-01-08  273  
a9b3c355c2e638 Kevin Brodsky 2025-01-03  274  static inline pgd_t *__pgd_alloc_noprof(struct mm_struct *mm, unsigned int order)
a9b3c355c2e638 Kevin Brodsky 2025-01-03  275  {
a9b3c355c2e638 Kevin Brodsky 2025-01-03  276  	gfp_t gfp = GFP_PGTABLE_USER;
a9b3c355c2e638 Kevin Brodsky 2025-01-03  277  	struct ptdesc *ptdesc;
a9b3c355c2e638 Kevin Brodsky 2025-01-03  278  
ccbd04de39826d Dave Hansen   2025-08-28  279  	if (mm == &init_mm) {
a9b3c355c2e638 Kevin Brodsky 2025-01-03  280  		gfp = GFP_PGTABLE_KERNEL;
ccbd04de39826d Dave Hansen   2025-08-28 @281  		ptdesc_set_kernel(ptdesc);
ccbd04de39826d Dave Hansen   2025-08-28  282  	}
a9b3c355c2e638 Kevin Brodsky 2025-01-03  283  	gfp &= ~__GFP_HIGHMEM;
a9b3c355c2e638 Kevin Brodsky 2025-01-03  284  
a9b3c355c2e638 Kevin Brodsky 2025-01-03  285  	ptdesc = pagetable_alloc_noprof(gfp, order);
a9b3c355c2e638 Kevin Brodsky 2025-01-03  286  	if (!ptdesc)
a9b3c355c2e638 Kevin Brodsky 2025-01-03  287  		return NULL;
a9b3c355c2e638 Kevin Brodsky 2025-01-03  288  
d95936a2267c11 Kevin Brodsky 2025-01-03  289  	pagetable_pgd_ctor(ptdesc);
a9b3c355c2e638 Kevin Brodsky 2025-01-03  290  	return ptdesc_address(ptdesc);
a9b3c355c2e638 Kevin Brodsky 2025-01-03  291  }
a9b3c355c2e638 Kevin Brodsky 2025-01-03  292  #define __pgd_alloc(...)	alloc_hooks(__pgd_alloc_noprof(__VA_ARGS__))
a9b3c355c2e638 Kevin Brodsky 2025-01-03  293  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
