Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8092521CC79
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Nov 2025 08:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763281715; cv=none; b=r0FvRs0STSQlV3j55PML0SL116mqMeNoXROGkJqEiwfO9V/KnJOH5rl1kBRAqfrFK9yUj2iR9MZGa4UeyzUOdIkG98mwlcmcwyxcFGu5PPjAnuWaRXU1QbVMD9d2p6tuIauYYdvjhrDdqByxV6B8eoXEN11dTde3ASrZYjHsKUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763281715; c=relaxed/simple;
	bh=1ZfY147hr6Uezldo0FwAoeu8MLYTBqdYETaS+rI5Yi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pzXoq3ve54m7Pccx2Xt7sWfo5BV+F+QYeJ6AygRg5z4riWfhM0QVkwmSfsi+hkoAHurRIivMToQNuMZqjTpXjrWTXh7MHos26QZ58b/94OrJKcKonAQU4ctluJwo8Pip69YJkrEnL1JbINVJ6+2xZvn+S8eGwZqnN08yN4MXAVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfQOdxZj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfQOdxZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763281714; x=1794817714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZfY147hr6Uezldo0FwAoeu8MLYTBqdYETaS+rI5Yi8=;
  b=kfQOdxZj7rnOwnq1EyHQ1VrPDf1tASznxyyBW3UJQJJ+M65TKyilTFOE
   2jgaUQCzPNwepz8zNXI+eWqQrwrnk3NPwgVMdaa49rwOfhh82ASCyfhL+
   rSkeD4MauMK6k8bGoJLkc/VyK4bgZg7v1LzYdvsgKcMdkP6pQOCW1N+ah
   SgPDbhyVD9PUr8aa1EqfB5pMDEj8rhtDpJtaLkXnCSox7j/Ia3o172mVQ
   r4G1QiKxe1XzNUmLv1QnYLuW/Cw93RbliruMS4xvnRd/vZpdnPmWLznKb
   jD24ZC5SJdG3MsQ4UhlI6LLXpE9P2YOBem6aR9WHZFK/TCVAYqSYWIEuS
   A==;
X-CSE-ConnectionGUID: H+5a7dUnTnuXpU2+0a+4cw==
X-CSE-MsgGUID: tvHo7FAVQbWQH9Fg8yTC7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65246656"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65246656"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 00:28:33 -0800
X-CSE-ConnectionGUID: m+UANdH0RfyNLP1SMw5rPA==
X-CSE-MsgGUID: g/wfrnqOToSXTxKUlQ1x9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="190961401"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Nov 2025 00:28:27 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKY7U-0008dD-2m;
	Sun, 16 Nov 2025 08:28:24 +0000
Date: Sun, 16 Nov 2025 16:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [iommu:core 14/40] drivers/iommu/generic_pt/fmt/amdv1.h:208:5:
 error: call to '__compiletime_assert_92' declared with 'error' attribute:
 FIELD_PREP: value too large for the field
Message-ID: <202511161648.wljV7BEw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Joerg Roedel <joerg.roedel@amd.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Samiullah Khawaja <skhawaja@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git core
head:   7e06063a43d317c1ca9278b6662555f687f43f03
commit: dcd6a011a8d523a114af2360a8753de5bd60c139 [14/40] iommupt: Add map_pages op
:::::: branch date: 3 days ago
:::::: commit date: 11 days ago
config: x86_64-buildonly-randconfig-005-20251116 (https://download.01.org/0day-ci/archive/20251116/202511161648.wljV7BEw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511161648.wljV7BEw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511161648.wljV7BEw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:15:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
>> drivers/iommu/generic_pt/fmt/amdv1.h:208:5: error: call to '__compiletime_assert_92' declared with 'error' attribute: FIELD_PREP: value too large for the field
     208 |                          FIELD_PREP(AMDV1PT_FMT_OA,
         |                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:585:2: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:578:4: note: expanded from macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:106:1: note: expanded from here
     106 | __compiletime_assert_92
         | ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:15:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
>> drivers/iommu/generic_pt/fmt/amdv1.h:208:5: error: call to '__compiletime_assert_92' declared with 'error' attribute: FIELD_PREP: value too large for the field
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:585:2: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:578:4: note: expanded from macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:106:1: note: expanded from here
     106 | __compiletime_assert_92
         | ^
   2 errors generated.


vim +208 drivers/iommu/generic_pt/fmt/amdv1.h

879ced2bab1ba9 Jason Gunthorpe 2025-11-04  181  
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  182  static inline void
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  183  amdv1pt_install_leaf_entry(struct pt_state *pts, pt_oaddr_t oa,
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  184  			   unsigned int oasz_lg2,
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  185  			   const struct pt_write_attrs *attrs)
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  186  {
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  187  	unsigned int isz_lg2 = pt_table_item_lg2sz(pts);
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  188  	u64 *tablep = pt_cur_table(pts, u64) + pts->index;
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  189  	u64 entry;
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  190  
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  191  	if (!pt_check_install_leaf_args(pts, oa, oasz_lg2))
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  192  		return;
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  193  
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  194  	entry = AMDV1PT_FMT_PR |
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  195  		FIELD_PREP(AMDV1PT_FMT_OA, log2_div(oa, PT_GRANULE_LG2SZ)) |
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  196  		attrs->descriptor_bits;
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  197  
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  198  	if (oasz_lg2 == isz_lg2) {
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  199  		entry |= FIELD_PREP(AMDV1PT_FMT_NEXT_LEVEL,
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  200  				    AMDV1PT_FMT_NL_DEFAULT);
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  201  		WRITE_ONCE(*tablep, entry);
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  202  	} else {
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  203  		unsigned int num_contig_lg2 = oasz_lg2 - isz_lg2;
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  204  		u64 *end = tablep + log2_to_int(num_contig_lg2);
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  205  
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  206  		entry |= FIELD_PREP(AMDV1PT_FMT_NEXT_LEVEL,
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  207  				    AMDV1PT_FMT_NL_SIZE) |
879ced2bab1ba9 Jason Gunthorpe 2025-11-04 @208  			 FIELD_PREP(AMDV1PT_FMT_OA,
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  209  				    oalog2_to_int(oasz_lg2 - PT_GRANULE_LG2SZ -
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  210  						  1) -
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  211  					    1);
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  212  
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  213  		/* See amdv1pt_clear_entries() */
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  214  		if (num_contig_lg2 <= ilog2(32)) {
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  215  			for (; tablep != end; tablep++)
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  216  				WRITE_ONCE(*tablep, entry);
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  217  		} else {
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  218  			memset64(tablep, entry, log2_to_int(num_contig_lg2));
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  219  		}
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  220  	}
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  221  	pts->entry = entry;
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  222  }
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  223  #define pt_install_leaf_entry amdv1pt_install_leaf_entry
879ced2bab1ba9 Jason Gunthorpe 2025-11-04  224  

:::::: The code at line 208 was first introduced by commit
:::::: 879ced2bab1ba95e98fac56c9503791183bc7cbb iommupt: Add the AMD IOMMU v1 page table format

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
