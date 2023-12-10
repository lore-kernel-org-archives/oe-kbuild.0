Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5960C8494
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 16:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3LBA2eG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702224460; x=1733760460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EOw5OqWxQ81JxH2ZM2a2+1YAdIJHnr2uyyyxYVp4Xck=;
  b=k3LBA2eGjUhnKcXU5CWawzUCr0diINgqSEs9nrrWnBB8tmcRizHJ0ena
   gzIdncJF/AR9oeV2ov6s3fsLXJrydudtj/1j3fRf3rPVZGERbiM8BpAAJ
   A+ScbJK3GVZ1P20KAOJnHM//twd+zi8NEGl9gBxMBE4k2zRXzHnQa+FF9
   OLr1qnUJ8/CAQEqxn4DXV98RQiHaZ0LmRmxJAr2c+Ur056Q9bUjEhkIC/
   8bGyp/7oAYFHUPJ4XVmgpP80HZ8nVguVQc7VC5FeFl+xnSvvMqHzynV7+
   I5J6qZ0BoreHe1jUtIgfM45LdBu3jIJXIqx6AKW7MnkZp8I+HIol5NzJJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="397353368"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="397353368"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 08:07:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="843209428"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="843209428"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Dec 2023 08:07:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCML7-000H0W-1H;
	Sun, 10 Dec 2023 16:07:33 +0000
Date: Mon, 11 Dec 2023 00:06:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/pgtable.h:257:16: sparse: sparse: cast to non-scalar
Message-ID: <202312102353.hCqM6KBN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/pgtable.h:257:16: sparse: sparse: cast to non-scalar"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huang Ying <ying.huang@intel.com>
CC: Mel Gorman <mgorman@suse.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: b99a342d4f11a5455d999b12f5fee42ab6acaf8c NUMA balancing: reduce TLB flush via delaying mapping on hint page fault
date:   2 years, 7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 2 years, 7 months ago
config: alpha-randconfig-r131-20231116 (https://download.01.org/0day-ci/archive/20231210/202312102353.hCqM6KBN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312102353.hCqM6KBN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312102353.hCqM6KBN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/memory.c:285:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:319:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:949:17: sparse: sparse: context imbalance in 'copy_pte_range' - different lock contexts for basic block
   mm/memory.c:1104:61: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:1128:61: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:1629:16: sparse: sparse: context imbalance in '__get_locked_pte' - different lock contexts for basic block
   mm/memory.c:1678:9: sparse: sparse: context imbalance in 'insert_page' - different lock contexts for basic block
   mm/memory.c:2180:17: sparse: sparse: context imbalance in 'remap_pte_range' - different lock contexts for basic block
   mm/memory.c:2237:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:2259:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:2436:17: sparse: sparse: context imbalance in 'apply_to_pte_range' - unexpected unlock
   mm/memory.c:2494:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:2522:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:2692:17: sparse: sparse: context imbalance in 'wp_page_copy' - unexpected unlock
   mm/memory.c:3038:17: sparse: sparse: context imbalance in 'wp_pfn_shared' - unexpected unlock
   mm/memory.c:3101:19: sparse: sparse: context imbalance in 'do_wp_page' - different lock contexts for basic block
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
>> include/linux/pgtable.h:257:16: sparse: sparse: cast to non-scalar
>> include/linux/pgtable.h:257:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4660:5: sparse: sparse: context imbalance in 'follow_invalidate_pte' - different lock contexts for basic block
   mm/memory.c:4781:9: sparse: sparse: context imbalance in 'follow_pfn' - unexpected unlock

vim +257 include/linux/pgtable.h

e2cda322648122d include/asm-generic/pgtable.h Andrea Arcangeli 2011-01-13  253  
481e980a7c199c5 include/linux/pgtable.h       Christophe Leroy 2020-06-15  254  #ifndef __HAVE_ARCH_PTEP_GET
481e980a7c199c5 include/linux/pgtable.h       Christophe Leroy 2020-06-15  255  static inline pte_t ptep_get(pte_t *ptep)
481e980a7c199c5 include/linux/pgtable.h       Christophe Leroy 2020-06-15  256  {
481e980a7c199c5 include/linux/pgtable.h       Christophe Leroy 2020-06-15 @257  	return READ_ONCE(*ptep);
481e980a7c199c5 include/linux/pgtable.h       Christophe Leroy 2020-06-15  258  }
481e980a7c199c5 include/linux/pgtable.h       Christophe Leroy 2020-06-15  259  #endif
481e980a7c199c5 include/linux/pgtable.h       Christophe Leroy 2020-06-15  260  

:::::: The code at line 257 was first introduced by commit
:::::: 481e980a7c199c5a4634fd7ea308067dd4ba75fa mm: Allow arches to provide ptep_get()

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
