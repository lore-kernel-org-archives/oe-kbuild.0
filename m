Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B3B20C494
	for <oe-kbuild@lists.linux.dev>; Wed, 14 May 2025 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219153; cv=none; b=bI2yyOGFZfddKocncgWhDxZbRpfrBOfWQsNj+xkm6g6LemI+9kHr9zNvzj3/RLNlor1vBFIpUYG5RZbDKlNx+Okd6Eq320yZO0gjjkJPej3Ubbx6GjutBkG00mntE+6qZepm4KgBEKeOBhY67cvcUpEWs+033Im6cTNnFLO7o+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219153; c=relaxed/simple;
	bh=1ZPXbkgqz+rVaGesu+6/wt6AGEBlXZDILCXtLFzzE2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NwAovjzQL7vE0X6PrV4V5EHx/n2/6JQM2+fKHzw9LuEFdP3AHqN7B5sQHaVI7IlzczeFBE0KI2y25l2PwV8Er6KczTyFqjJLlZ25ozls/XIaTwfPkOTsVmQSChmR34vy4fxiHhi6gAlh2AN4LXTvTmVHeBaVXWTTdR9OrJFCsfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GD46a67n; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GD46a67n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747219152; x=1778755152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZPXbkgqz+rVaGesu+6/wt6AGEBlXZDILCXtLFzzE2E=;
  b=GD46a67nKwRMG16n7yAABDZ9DEsQiQC1+GqXfRBc8S5xMthOitE0TLIj
   bFKfssyn5U+uQWSfM+R3XaggSkDyBo7xgVdopfLlIZtP+WHLF54Wk8udk
   ofXCcNi0mmIrKQdWEfnJVL0LWj1ggTDkZyew4tsflRuBTUVSTLtuoTgvD
   FRvfHs8nMJyVNozcfZ4lweSTXBaTmqdafV47SIwLh6nrVnBl0r4TXonMt
   9qG7s0JGeSzKSzi7kJIVgXnZS7tl3nwGJO5zG/oN1Ic9D5+uNRveI1ZgZ
   khLET9O3X8yJS5iCE8IX6t8RJl2PzsXrrOnc2uAACv89pGE3tNC1j3+QQ
   g==;
X-CSE-ConnectionGUID: T4ikCnLZRgSOdINS5jZY0g==
X-CSE-MsgGUID: 3a7pBW19RhSGAMIyCL2MrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49180086"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49180086"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 03:39:11 -0700
X-CSE-ConnectionGUID: efE+xOC2RwiIpeNqFUEQRA==
X-CSE-MsgGUID: nmeAROIgQCmWMJ/d+WUHQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="142878864"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 May 2025 03:39:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF9Vz-000GzD-2E;
	Wed, 14 May 2025 10:39:07 +0000
Date: Wed, 14 May 2025 18:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-kiwi-6.1 357/357]
 arch/arm64/kvm/pkvm.c:113:1-25: WARNING: Function "for_each_compatible_node"
 should have of_node_put() before return around line 119.
Message-ID: <202505141843.luLt6e12-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   5cfcb5d4d3bafdf995f0a16c52e5150a1bf1bc01
commit: 9d56fc78909afe95f69d5496a74295b8deb8bbe1 [357/357] ANDROID: KVM: arm64: Specify stage-2-protected regions in DT
:::::: branch date: 19 hours ago
:::::: commit date: 2 years, 4 months ago
config: arm64-randconfig-r063-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141843.luLt6e12-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505141843.luLt6e12-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/pkvm.c:113:1-25: WARNING: Function "for_each_compatible_node" should have of_node_put() before return around line 119.
   arch/arm64/kvm/pkvm.c:113:1-25: WARNING: Function "for_each_compatible_node" should have of_node_put() before return around line 123.
   arch/arm64/kvm/pkvm.c:113:1-25: WARNING: Function "for_each_compatible_node" should have of_node_put() before return around line 128.

vim +/for_each_compatible_node +113 arch/arm64/kvm/pkvm.c

51a84221b10840 Quentin Perret 2022-12-12   97  
51a84221b10840 Quentin Perret 2022-12-12   98  static int __init register_moveable_regions(void)
51a84221b10840 Quentin Perret 2022-12-12   99  {
51a84221b10840 Quentin Perret 2022-12-12  100  	struct memblock_region *reg;
9d56fc78909afe Quentin Perret 2022-12-12  101  	struct device_node *np;
51a84221b10840 Quentin Perret 2022-12-12  102  	int i = 0;
51a84221b10840 Quentin Perret 2022-12-12  103  
51a84221b10840 Quentin Perret 2022-12-12  104  	for_each_mem_region(reg) {
51a84221b10840 Quentin Perret 2022-12-12  105  		if (i >= PKVM_NR_MOVEABLE_REGS)
51a84221b10840 Quentin Perret 2022-12-12  106  			return -ENOMEM;
51a84221b10840 Quentin Perret 2022-12-12  107  		moveable_regs[i].start = reg->base;
51a84221b10840 Quentin Perret 2022-12-12  108  		moveable_regs[i].size = reg->size;
51a84221b10840 Quentin Perret 2022-12-12  109  		moveable_regs[i].type = PKVM_MREG_MEMORY;
51a84221b10840 Quentin Perret 2022-12-12  110  		i++;
51a84221b10840 Quentin Perret 2022-12-12  111  	}
9d56fc78909afe Quentin Perret 2022-12-12  112  
9d56fc78909afe Quentin Perret 2022-12-12 @113  	for_each_compatible_node(np, NULL, "pkvm,protected-region") {
9d56fc78909afe Quentin Perret 2022-12-12  114  		struct resource res;
9d56fc78909afe Quentin Perret 2022-12-12  115  		u64 start, size;
9d56fc78909afe Quentin Perret 2022-12-12  116  		int ret;
9d56fc78909afe Quentin Perret 2022-12-12  117  
9d56fc78909afe Quentin Perret 2022-12-12  118  		if (i >= PKVM_NR_MOVEABLE_REGS)
9d56fc78909afe Quentin Perret 2022-12-12 @119  			return -ENOMEM;
9d56fc78909afe Quentin Perret 2022-12-12  120  
9d56fc78909afe Quentin Perret 2022-12-12  121  		ret = of_address_to_resource(np, 0, &res);
9d56fc78909afe Quentin Perret 2022-12-12  122  		if (ret)
9d56fc78909afe Quentin Perret 2022-12-12  123  			return ret;
9d56fc78909afe Quentin Perret 2022-12-12  124  
9d56fc78909afe Quentin Perret 2022-12-12  125  		start = res.start;
9d56fc78909afe Quentin Perret 2022-12-12  126  		size = resource_size(&res);
9d56fc78909afe Quentin Perret 2022-12-12  127  		if (!PAGE_ALIGNED(start) || !PAGE_ALIGNED(size))
9d56fc78909afe Quentin Perret 2022-12-12  128  			return -EINVAL;
9d56fc78909afe Quentin Perret 2022-12-12  129  
9d56fc78909afe Quentin Perret 2022-12-12  130  		moveable_regs[i].start = start;
9d56fc78909afe Quentin Perret 2022-12-12  131  		moveable_regs[i].size = size;
9d56fc78909afe Quentin Perret 2022-12-12  132  		moveable_regs[i].type = PKVM_MREG_PROTECTED_RANGE;
9d56fc78909afe Quentin Perret 2022-12-12  133  		i++;
9d56fc78909afe Quentin Perret 2022-12-12  134  	}
9d56fc78909afe Quentin Perret 2022-12-12  135  
51a84221b10840 Quentin Perret 2022-12-12  136  	kvm_nvhe_sym(pkvm_moveable_regs_nr) = i;
51a84221b10840 Quentin Perret 2022-12-12  137  	sort_moveable_regs();
51a84221b10840 Quentin Perret 2022-12-12  138  
51a84221b10840 Quentin Perret 2022-12-12  139  	return 0;
51a84221b10840 Quentin Perret 2022-12-12  140  }
51a84221b10840 Quentin Perret 2022-12-12  141  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
