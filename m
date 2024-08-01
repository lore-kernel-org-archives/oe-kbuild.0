Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF5714D6E7
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Aug 2024 23:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722555020; cv=none; b=gs9vEYCplU1XK51MspxaAzN7yRJ0o8w083f1H9Ax25kA5IphWeQYC4VqzDn/Kqh6jRVQW5/s9E7p8AxgAml5hJcZTjIUmo184m3i9oE1vzdmomRaaXwX3eTOXb3OcL7uSjXasm37IMUh2Jsu0dQFfR3BU/tpxRp4hITE5o+S2bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722555020; c=relaxed/simple;
	bh=wQM6NH4frHW72RcoWT2UWPQIFw+4MfEF9NoNMhbsx2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hhl0xlYUVrRA4fO9g3FVAOGBhHBOrFyLc5wZYg4jXXXuUqaAeJ/SCEjLbXvCMRddtwxXQOsaaIaiK88rh9ebecwWto2CPaIxkfZKWLP0EVMpJDE5cDGiZbx9wEZdIVqNNi61jqbIKmsimLjMoLW24ioJyHQkr/WpN0/v+dyQhPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3Oc0+Jp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3Oc0+Jp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722555018; x=1754091018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wQM6NH4frHW72RcoWT2UWPQIFw+4MfEF9NoNMhbsx2w=;
  b=L3Oc0+JpIhKRnr1swWpeC/g2usm8czs0TtSLkD+/v/69kuMjWZU7qVi+
   ccDiYWQVfsV1bSwo2v0N6RQbIcD89fhG9giKF5dYm3JDZSXdfX60I5285
   f7f7oAiFAwf8QoF0u97TFEsCmRKdkNbjNUMSNyMvwRTktGpMxcDS//HYB
   lyqUwdDGTPmSR9fFae+5aMqZAkvtdQa4er3JY+IiJmfRohaSrTu8GVyx+
   debt26WMfj1qMDYNDHLsCyKmEM0BKWd/3EfqiZoUbDTAKNkN6oyZh2rOB
   tnVrFBJBa7otnZqkCnytWNhmMOsTHwessyEyA1v6QGMQ9JtuD1D5rN/a+
   A==;
X-CSE-ConnectionGUID: yW+tldxORKeEMkjeFE92/Q==
X-CSE-MsgGUID: 0iZDNVynSnmZNywqVWWAnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20437473"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="20437473"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 16:29:55 -0700
X-CSE-ConnectionGUID: 2wSE/Q89R/6Ea2DCPypXaQ==
X-CSE-MsgGUID: hPMZEbrgR9elxaNFqiXPQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="60050929"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Aug 2024 16:29:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZfF1-000w8C-1g;
	Thu, 01 Aug 2024 23:29:51 +0000
Date: Fri, 2 Aug 2024 07:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/page_alloc.o: warning: objtool: free_unref_page+0xa0: unreachable
 instruction
Message-ID: <202408020755.36Mt8Xoa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Johannes Weiner <hannes@cmpxchg.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c0ecd6388360d930440cc5554026818895199923
commit: 17edeb5d3f761c20fd28f6002f5a9faa53c0a0d8 mm: page_alloc: remove pcppage migratetype caching
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240802/202408020755.36Mt8Xoa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408020755.36Mt8Xoa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408020755.36Mt8Xoa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/page_alloc.c:19:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:290:34: warning: missing braces around initializer [-Wmissing-braces]
     290 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:556:16: note: in expansion of macro '__swp_entry_to_pmd'
     556 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
   mm/page_alloc.o: warning: objtool: const_folio_flags+0x30: unreachable instruction
   mm/page_alloc.o: warning: objtool: set_page_refcounted+0x34: unreachable instruction
   mm/page_alloc.o: warning: objtool: split_page+0x40: unreachable instruction
   mm/page_alloc.o: warning: objtool: del_page_from_free_list+0x2c: unreachable instruction
   mm/page_alloc.o: warning: objtool: __free_one_page+0x84: unreachable instruction
   mm/page_alloc.o: warning: objtool: __free_pages_ok+0xb0: unreachable instruction
   mm/page_alloc.o: warning: objtool: move_freepages+0xbc: unreachable instruction
   mm/page_alloc.o: warning: objtool: free_pages_prepare+0x8c: unreachable instruction
   mm/page_alloc.o: warning: objtool: __free_pages_core+0xbc: unreachable instruction
   mm/page_alloc.o: warning: objtool: rmqueue+0x410: unreachable instruction
>> mm/page_alloc.o: warning: objtool: free_unref_page+0xa0: unreachable instruction
>> mm/page_alloc.o: warning: objtool: free_unref_folios+0xd8: unreachable instruction
   mm/page_alloc.o: warning: objtool: __folio_alloc_noprof+0x48: unreachable instruction
   mm/page_alloc.o: warning: objtool: free_reserved_area+0xa8: unreachable instruction


objdump-func vmlinux.o free_unref_page:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
