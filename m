Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E026917B418
	for <oe-kbuild@lists.linux.dev>; Sat, 17 May 2025 19:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747509073; cv=none; b=Pvkn1h/DcDVSm0bd37+CpeyHSgXRXtOmmfVZA55uVUl7q1tVECOfbFNPue1LyhMOrftx+SwGPsKbRAKsWbYpKtB0QNWZym6MDawjT6tFaoMaXInm4hOCpOKUo8VBEz7hw3mZ51QQ+Dxxhfj8TznWjEYF1Lat0k2vZVjAKBDA1mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747509073; c=relaxed/simple;
	bh=6f7PusvmD/lGbrQdj1AGyP7XZ+Kmgb/3iXL12V5QiwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k600ZcP8DaUybWPn8DdtJ97wxANcdjCMC1T7G7pm4SAA1yVt4/rVfpHkhxgS/2KxRokEm2fb3h2DPr0TYu4iyJFjWN19REm5LFrLHYo5sA9HKKFfTLLhpFiehVz1tCcbGC6k0Qe9cLWoowvYzW+/IIgqbP3YEygUxwSaYglXzko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ki3mzXNG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ki3mzXNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747509072; x=1779045072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6f7PusvmD/lGbrQdj1AGyP7XZ+Kmgb/3iXL12V5QiwI=;
  b=ki3mzXNGKrJeWhvNx/zEGg/6LE6keUAqDeVXkqxiuXbOC5/o+YQNhkAC
   ikS3TDBufU/sEywYQvGGQfwNQ9Vdq7EUBT6r6RGuStiE36Y4sswBSWvr7
   OQoztxhhYX4EFYuowl8G6ScHCQihNJTKcG+y/6hKIwoX1mDh9QNiF7bF4
   PgcYe31dM5wdhUHXqQTBgRdAdddYzKxnCIpS/wb5K/e7ScNISqgmEoBYr
   qTKpvYzLtcuVbM/OB3bc9PF3Ff8ZGeeTbCsLcUezYMeDgqdOXIa+grCnU
   CSS58CffFc/JWxQX0O3bdlI4wxqZ+5JniVpWIc/KbqLvpfEILE0pC4OtA
   g==;
X-CSE-ConnectionGUID: Q7TEIw/fSYywFNkRC2BxIw==
X-CSE-MsgGUID: 7kXuk5MmTiGZP5IEvxXlOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="59686281"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="59686281"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 12:11:10 -0700
X-CSE-ConnectionGUID: LqZkbWgKQFq3AbbT3/UBDw==
X-CSE-MsgGUID: Mz6S7kS5S/KQ8yC6eWTDng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="169925269"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 May 2025 12:11:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGMw7-000KN6-0M;
	Sat, 17 May 2025 19:11:07 +0000
Date: Sun, 18 May 2025 03:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/swapfile.o: warning: objtool: __do_sys_swapoff+0x324: unreachable
 instruction
Message-ID: <202505180352.gKhKrRHJ-lkp@intel.com>
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
TO: Kairui Song <kasong@tencent.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   172a9d94339cea832d89630b89d314e41d622bd8
commit: 9a0ddeb7988095a5c21994c37005a45b240039ef mm, swap: hold a reference during scan and cleanup flag usage
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250518/202505180352.gKhKrRHJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180352.gKhKrRHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505180352.gKhKrRHJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/loongarch/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from mm/swapfile.c:9:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:303:34: warning: missing braces around initializer [-Wmissing-braces]
     303 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:578:16: note: in expansion of macro '__swp_entry_to_pmd'
     578 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
   mm/swapfile.o: warning: objtool: swap_count_continued+0x18c: unreachable instruction
>> mm/swapfile.o: warning: objtool: __do_sys_swapoff+0x324: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
