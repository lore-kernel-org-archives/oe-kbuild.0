Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448151E5B64
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765183031; cv=none; b=OAdjZyY1Y8e/WC1Yc4ugWEf8LcA+YT760MBaj0ttkaV7Jg9lUNvuwgnvM8BMlXShAfNrcBCMxyDy38y/K7tXZH2ocq1ZgGODVdNrDOKwadfdgrleiQ/EdkmM0YeDCKJBTqURjMKDjN1irkEV68b5H4w7128vbRtt3nbLUAnJh3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765183031; c=relaxed/simple;
	bh=IfWN0sHvNMEpCIrQ6/rkhHsEGbKTg9vysU81XIgCPzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RPtZ+rhvmg2UmciZ1eNb4Ud/cZG6TJJifuT39UzzBaqTLwNCZKjXUVUnVsrqatnsBityJKI5Lc0MLH9UxY95OSu24mzLC1Wh5y7q91wBZBGIYVJvHkx1P8ptu03QenYqbpjArI8jc/nyEm7hYBrNEOHaXYnOVnTGnTATM+X7PvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PeHF1Op8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PeHF1Op8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765183029; x=1796719029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IfWN0sHvNMEpCIrQ6/rkhHsEGbKTg9vysU81XIgCPzA=;
  b=PeHF1Op8CAdk8ZHFdyX+pSgeQpY1/HdPhJcrx6lD8YFVxFnyzCugHlGK
   I1a8V+0iVIlme52U+d1pnaRxHJYGwW/K1lUihTDRbvbXumu8oNqHoH1Zr
   Ev0Mg1vNOqSGX04OZMDsn6IFqlI7BpzNTZbRe8VUgt0eLEY2GCUU6EttZ
   8Egp6bfMOjPnHN2rKlRQKUGZkJ3k44i8ZW/73VDg+s/SsyYANAtGRjrDO
   RcSoV7b8GZn90mmaWeaRvkD2DvhmacMTDkZGu7xhiMI/weogCBFbqDFdV
   AE6JMy8WSgKxotWM5xm9KTm8OUXySSdbfRxLlsonU8Zcgk5R9UHGI/hEL
   A==;
X-CSE-ConnectionGUID: mTR03wseSa6ij7hqSYhlgw==
X-CSE-MsgGUID: msQwxP0WTweXRaXUZH9wcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66842846"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="66842846"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 00:37:09 -0800
X-CSE-ConnectionGUID: cChpXmdJRXuTNXK4xmYU8Q==
X-CSE-MsgGUID: 9JMCDaM0RVqwkTcBCC4EUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200347182"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Dec 2025 00:37:08 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSWjx-00000000K7Z-1mq6;
	Mon, 08 Dec 2025 08:37:05 +0000
Date: Mon, 8 Dec 2025 16:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 13415/13721] drivers/hv/mshv_regions.c:56:34:
 error: call to '__compiletime_assert_494' declared with 'error' attribute:
 BUILD_BUG failed
Message-ID: <202512081617.RUfqTWIM-lkp@intel.com>
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
TO: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: "Anirudh Rayabharam (Microsoft)" <anirudh@anirudhrb.com>
CC: Nuno Das Neves <nunodasneves@linux.microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82bcd04d124a4d84580ea4a8ba6b120db5f512e7
commit: abceb4297bf88340ce06016895babe292510a262 [13415/13721] mshv: Fix huge page handling in memory region traversal
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-076-20251208 (https://download.01.org/0day-ci/archive/20251208/202512081617.RUfqTWIM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081617.RUfqTWIM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512081617.RUfqTWIM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hv/mshv_regions.c:56:34: error: call to '__compiletime_assert_494' declared with 'error' attribute: BUILD_BUG failed
      56 |         if (page_order && page_order != HPAGE_PMD_ORDER)
         |                                         ^
   include/linux/huge_mm.h:117:26: note: expanded from macro 'HPAGE_PMD_ORDER'
     117 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^
   include/linux/huge_mm.h:113:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
     113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:585:2: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:578:4: note: expanded from macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:51:1: note: expanded from here
      51 | __compiletime_assert_494
         | ^
   1 error generated.


vim +56 drivers/hv/mshv_regions.c

e950c30a1051d2 Stanislav Kinsburskii 2025-12-03  16  
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  17  /**
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  18   * mshv_region_process_chunk - Processes a contiguous chunk of memory pages
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  19   *                             in a region.
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  20   * @region     : Pointer to the memory region structure.
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  21   * @flags      : Flags to pass to the handler.
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  22   * @page_offset: Offset into the region's pages array to start processing.
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  23   * @page_count : Number of pages to process.
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  24   * @handler    : Callback function to handle the chunk.
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  25   *
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  26   * This function scans the region's pages starting from @page_offset,
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  27   * checking for contiguous present pages of the same size (normal or huge).
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  28   * It invokes @handler for the chunk of contiguous pages found. Returns the
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  29   * number of pages handled, or a negative error code if the first page is
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  30   * not present or the handler fails.
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  31   *
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  32   * Note: The @handler callback must be able to handle both normal and huge
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  33   * pages.
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  34   *
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  35   * Return: Number of pages handled, or negative error code.
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  36   */
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  37  static long mshv_region_process_chunk(struct mshv_mem_region *region,
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  38  				      u32 flags,
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  39  				      u64 page_offset, u64 page_count,
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  40  				      int (*handler)(struct mshv_mem_region *region,
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  41  						     u32 flags,
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  42  						     u64 page_offset,
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  43  						     u64 page_count))
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  44  {
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  45  	u64 count, stride;
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  46  	unsigned int page_order;
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  47  	struct page *page;
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  48  	int ret;
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  49  
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  50  	page = region->pages[page_offset];
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  51  	if (!page)
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  52  		return -EINVAL;
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  53  
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  54  	page_order = folio_order(page_folio(page));
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  55  	/* The hypervisor only supports 4K and 2M page sizes */
abceb4297bf883 Stanislav Kinsburskii 2025-12-03 @56  	if (page_order && page_order != HPAGE_PMD_ORDER)
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  57  		return -EINVAL;
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  58  
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  59  	stride = 1 << page_order;
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  60  
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  61  	/* Start at stride since the first page is validated */
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  62  	for (count = stride; count < page_count; count += stride) {
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  63  		page = region->pages[page_offset + count];
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  64  
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  65  		/* Break if current page is not present */
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  66  		if (!page)
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  67  			break;
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  68  
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  69  		/* Break if page size changes */
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  70  		if (page_order != folio_order(page_folio(page)))
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  71  			break;
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  72  	}
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  73  
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  74  	ret = handler(region, flags, page_offset, count);
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  75  	if (ret)
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  76  		return ret;
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  77  
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  78  	return count;
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  79  }
abceb4297bf883 Stanislav Kinsburskii 2025-12-03  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
