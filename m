Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173DFF507
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Nov 2025 04:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762662760; cv=none; b=oaNawcIufmGar96e/ltD8V3d0xV/UebZ2fFzAEjbxPE4HJELOZrZwtjclZFqSlYiQ4FZdSNGOzqjtde8tV4jAI3glGaphGbm8Ko1EAJBGgvITczjzHPV0dYrosyDPGBhYwXIPD86OMJTCTWdSFCRMDGweXXYCZCo7oWuJ++bvcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762662760; c=relaxed/simple;
	bh=4zS7aTz4BrYBRmaNEktLS6Az12ZpcEIUuhfjx/pS89A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZF5a4lJEim7MHQ9wGKU71tkKqqDnVYS0iSZyULHaZ/DLPeyvl25EVVx5GdZ4geeuuO8HnW9rgGxznyip/3VQjjGtEMo2PCICawasoFAv7SaZ90bWKT1ztrAcqe+d1CA7YVUaRaYZEahhUMrWmuWyl3GuRLeacHyb2bySXFrszsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcwMC/d4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcwMC/d4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762662758; x=1794198758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4zS7aTz4BrYBRmaNEktLS6Az12ZpcEIUuhfjx/pS89A=;
  b=dcwMC/d4w0BrBcWY8rlDEBN5xC69cGVsvXwFn+jCoiaUezbu5fBsmMm5
   Hr6b8YbbnaYRX9DCFwueBIVB3O1nAuCYINI9ZvKxzM+Ggik+YQZwlX4aK
   jUvHUWKFH/zNFyVsbelLvO7pIdBx90ZxUdYDqDTsFU+ZrQ76l3+ph+Am+
   /Up8LIcowVpOoYusk5xns/BNOmD5aXhmerkyzkYZH6Mh+QorhIdbLJNPg
   GBBt2JM/eEKHO1S/r6t/c6RQEgChC/9KHucPvFEV2Y2ZdSEgkNwsXlmAA
   coLYMDgx9W/O7AP6HPegc6u9Xh7LF//vwMzfSw1LgeA35JOlytONOf2GF
   Q==;
X-CSE-ConnectionGUID: l5Jf2EWfSTuJ3gyouIk4EA==
X-CSE-MsgGUID: +8qyrELOSa+VWnpUjNSVGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="76205300"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="76205300"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 20:32:37 -0800
X-CSE-ConnectionGUID: 95zRpEX9SeeROViOvqWQ+w==
X-CSE-MsgGUID: yyCvNyfsTE6lkmhZByBcFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="188821262"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Nov 2025 20:32:36 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHx6Q-0001lb-16;
	Sun, 09 Nov 2025 04:32:34 +0000
Date: Sun, 9 Nov 2025 12:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/6] PCI/IDE: Add Address Association Register setup for
 downstream MMIO
Message-ID: <202511091250.b0V030mI-lkp@intel.com>
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
In-Reply-To: <20251105040055.2832866-3-dan.j.williams@intel.com>
References: <20251105040055.2832866-3-dan.j.williams@intel.com>
TO: Dan Williams <dan.j.williams@intel.com>

Hi Dan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0fe2f67a913cedca2be48c5b7b0412cbbaf29108]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/resource-Introduce-resource_assigned-for-discerning-active-resources/20251105-120359
base:   0fe2f67a913cedca2be48c5b7b0412cbbaf29108
patch link:    https://lore.kernel.org/r/20251105040055.2832866-3-dan.j.williams%40intel.com
patch subject: [PATCH 2/6] PCI/IDE: Add Address Association Register setup for downstream MMIO
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-002-20251109 (https://download.01.org/0day-ci/archive/20251109/202511091250.b0V030mI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b9ea93cd5c37fb6d606502fd01208dd48330549d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511091250.b0V030mI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511091250.b0V030mI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/ide.c:425:27: error: call to '__compiletime_assert_562' declared with 'error' attribute: FIELD_GET: type of reg too small for mask
     425 |         regs->addr[idx].assoc2 = FIELD_GET(SEL_ADDR_UPPER, region->end);
         |                                  ^
   include/linux/bitfield.h:155:3: note: expanded from macro 'FIELD_GET'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^
   include/linux/bitfield.h:72:3: note: expanded from macro '__BF_FIELD_CHECK'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
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
   <scratch space>:18:1: note: expanded from here
      18 | __compiletime_assert_562
         | ^
>> drivers/pci/ide.c:425:27: error: call to '__compiletime_assert_562' declared with 'error' attribute: FIELD_GET: type of reg too small for mask
   include/linux/bitfield.h:155:3: note: expanded from macro 'FIELD_GET'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^
   include/linux/bitfield.h:72:3: note: expanded from macro '__BF_FIELD_CHECK'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
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
   <scratch space>:18:1: note: expanded from here
      18 | __compiletime_assert_562
         | ^
   2 errors generated.


vim +425 drivers/pci/ide.c

1e4d2ff3ae450da Dan Williams 2025-10-31  410  
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  411  #define SEL_ADDR1_LOWER GENMASK(31, 20)
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  412  #define SEL_ADDR_UPPER GENMASK_ULL(63, 32)
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  413  #define PREP_PCI_IDE_SEL_ADDR1(base, limit)			\
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  414  	(FIELD_PREP(PCI_IDE_SEL_ADDR_1_VALID, 1) |		\
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  415  	 FIELD_PREP(PCI_IDE_SEL_ADDR_1_BASE_LOW,		\
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  416  		    FIELD_GET(SEL_ADDR1_LOWER, (base))) |	\
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  417  	 FIELD_PREP(PCI_IDE_SEL_ADDR_1_LIMIT_LOW,		\
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  418  		    FIELD_GET(SEL_ADDR1_LOWER, (limit))))
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  419  
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  420  static void mem_assoc_to_regs(struct pci_bus_region *region,
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  421  			      struct pci_ide_regs *regs, int idx)
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  422  {
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  423  	regs->addr[idx].assoc1 =
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  424  		PREP_PCI_IDE_SEL_ADDR1(region->start, region->end);
b0b9ae4c34a3b02 Xu Yilun     2025-11-04 @425  	regs->addr[idx].assoc2 = FIELD_GET(SEL_ADDR_UPPER, region->end);
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  426  	regs->addr[idx].assoc3 = FIELD_GET(SEL_ADDR_UPPER, region->start);
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  427  }
b0b9ae4c34a3b02 Xu Yilun     2025-11-04  428  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
