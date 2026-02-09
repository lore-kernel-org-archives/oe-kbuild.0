Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA4E2D94BB
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 21:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770672722; cv=none; b=Kq9oeR/BmuhLhXdgWBvjVjqD5fhQpzpojOWLZBGRiPHkIpDLlWj/3Jz2fhuykMt78h2rELD434B4jyWc/3LgupnlwUQfYsHv9OLMyPVpsj4eWMLZQGVHusiJpV4d4tyVrq8X9R71gsONOQApNH0LJmbwSxA9glSMj5B6C9wm7m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770672722; c=relaxed/simple;
	bh=v5RY/Rbe4XSrMuLSJSSasK41AC/PtOMi4BftrDbk/gM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tSBGLCzAB8K3Qn7vG4ODSh4fMYWlOJ7IqXj57SWSPAz7nioQws1Fnys9MZ0UJwfo3O7Mwykv7hT5BkFC2izVcP0R4A4Z/5UReabFrK9z6ReNkzNk2hPKz2dt91KQUq6Fdaagvrr8EfOLJ3EsLWYiVG7AXGC4XKzGaLiv1V8CeZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7xETZAV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7xETZAV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770672721; x=1802208721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v5RY/Rbe4XSrMuLSJSSasK41AC/PtOMi4BftrDbk/gM=;
  b=V7xETZAVnj+7TgQ9EH3nj9RPSzDsq+2PpuTVE+1Rfps/y2ozhUaIr9/i
   U0isMK4vtYXf1m6hVcM0CyPg8VgWNOK/8gd6T6xR8Xth/uI3Hn1BPZvvI
   n/Uelun9v0cgsgUjJtCyFtXyrOWtBtPddmD7M5cq8ayTk1vCWe9TZkYkB
   T9auRsjdK7x14mgq237t5FI28QPYiBpjiGentUiir/IBDke0xrZxyNFSJ
   eCNy5xWB8MfflCZIev9/SYQ23BcVkPN9o1HvC5t+oVnXztB+9eRdgvBap
   pUzW/4a+eya8Vb8zGCXjsx6HuszuZlfdEAyM8M7tlD0EqSST+6/E8OzWU
   w==;
X-CSE-ConnectionGUID: gYIUicTPT0yxzdL42193qw==
X-CSE-MsgGUID: km6H0vbjSMSHYpYQ8zM8DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82115835"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="82115835"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 13:32:01 -0800
X-CSE-ConnectionGUID: oD3AFoc9SWyCpYC+A3XMaw==
X-CSE-MsgGUID: ACNZWFweQQOKugBEb+TEuA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Feb 2026 13:31:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpYrN-00000000oLc-1dTm;
	Mon, 09 Feb 2026 21:31:57 +0000
Date: Tue, 10 Feb 2026 05:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] smaps: Report correct page sizes with THP
Message-ID: <202602100541.T3O4ksDH-lkp@intel.com>
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
In-Reply-To: <20260209193223.230797-1-ak@linux.intel.com>
References: <20260209193223.230797-1-ak@linux.intel.com>
TO: Andi Kleen <ak@linux.intel.com>
TO: linux-mm@vger.kernel.org
CC: linux-fsdevel@vger.kernel.org
CC: akpm@linux-foundation.org
CC: Andi Kleen <ak@linux.intel.com>

Hi Andi,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.19 next-20260209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andi-Kleen/smaps-Report-correct-page-sizes-with-THP/20260210-033439
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260209193223.230797-1-ak%40linux.intel.com
patch subject: [PATCH] smaps: Report correct page sizes with THP
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260210/202602100541.T3O4ksDH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100541.T3O4ksDH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602100541.T3O4ksDH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/proc/task_mmu.c:1378:13: error: call to '__compiletime_assert_426' declared with 'error' attribute: BUILD_BUG failed
    1378 |                     ps != HPAGE_PMD_SIZE)
         |                           ^
   include/linux/huge_mm.h:120:34: note: expanded from macro 'HPAGE_PMD_SIZE'
     120 | #define HPAGE_PMD_SIZE  ((1UL) << HPAGE_PMD_SHIFT)
         |                                   ^
   include/linux/huge_mm.h:113:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
     113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:619:2: note: expanded from macro '_compiletime_assert'
     619 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:612:4: note: expanded from macro '__compiletime_assert'
     612 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:129:1: note: expanded from here
     129 | __compiletime_assert_426
         | ^
   fs/proc/task_mmu.c:1372:40: error: call to '__compiletime_assert_425' declared with 'error' attribute: BUILD_BUG failed
    1372 |                 SEQ_PUT_DEC(" kB\nMMUPageSize:    ", HPAGE_PMD_SIZE);
         |                                                      ^
   include/linux/huge_mm.h:120:34: note: expanded from macro 'HPAGE_PMD_SIZE'
     120 | #define HPAGE_PMD_SIZE  ((1UL) << HPAGE_PMD_SHIFT)
         |                                   ^
   include/linux/huge_mm.h:113:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
     113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:619:2: note: expanded from macro '_compiletime_assert'
     619 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:612:4: note: expanded from macro '__compiletime_assert'
     612 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:126:1: note: expanded from here
     126 | __compiletime_assert_425
         | ^
   2 errors generated.


vim +1378 fs/proc/task_mmu.c

f1547959d9efd0 Vlastimil Babka   2018-08-21  1356  
8e68d689afe328 Vlastimil Babka   2018-08-21  1357  static int show_smap(struct seq_file *m, void *v)
8e68d689afe328 Vlastimil Babka   2018-08-21  1358  {
8e68d689afe328 Vlastimil Babka   2018-08-21  1359  	struct vm_area_struct *vma = v;
860a2e7fa4a186 Alexey Dobriyan   2023-09-29  1360  	struct mem_size_stats mss = {};
8e68d689afe328 Vlastimil Babka   2018-08-21  1361  
03b4b1149308b0 Chinwen Chang     2020-10-13  1362  	smap_gather_stats(vma, &mss, 0);
4752c369789250 Matt Mackall      2008-02-04  1363  
871305bb202808 Vlastimil Babka   2018-08-21  1364  	show_map_vma(m, vma);
4752c369789250 Matt Mackall      2008-02-04  1365  
d1be35cb6f9697 Andrei Vagin      2018-04-10  1366  	SEQ_PUT_DEC("Size:           ", vma->vm_end - vma->vm_start);
d1be35cb6f9697 Andrei Vagin      2018-04-10  1367  	SEQ_PUT_DEC(" kB\nKernelPageSize: ", vma_kernel_pagesize(vma));
37b1c872e41df4 Andi Kleen        2026-02-09  1368  
37b1c872e41df4 Andi Kleen        2026-02-09  1369  	/* Only THP? */
37b1c872e41df4 Andi Kleen        2026-02-09  1370  	if (mss.shmem_thp + mss.file_thp + mss.anonymous_thp == mss.resident &&
37b1c872e41df4 Andi Kleen        2026-02-09  1371  	    mss.resident > 0) {
37b1c872e41df4 Andi Kleen        2026-02-09  1372  		SEQ_PUT_DEC(" kB\nMMUPageSize:    ", HPAGE_PMD_SIZE);
37b1c872e41df4 Andi Kleen        2026-02-09  1373  	} else {
37b1c872e41df4 Andi Kleen        2026-02-09  1374  		unsigned ps = vma_mmu_pagesize(vma);
37b1c872e41df4 Andi Kleen        2026-02-09  1375  		/* Will need adjustments when more THP page sizes are added. */
37b1c872e41df4 Andi Kleen        2026-02-09  1376  		SEQ_PUT_DEC(" kB\nMMUPageSize:    ", ps);
37b1c872e41df4 Andi Kleen        2026-02-09  1377  		if (mss.shmem_thp + mss.file_thp + mss.anonymous_thp > 0 &&
37b1c872e41df4 Andi Kleen        2026-02-09 @1378  		    ps != HPAGE_PMD_SIZE)
37b1c872e41df4 Andi Kleen        2026-02-09  1379  			SEQ_PUT_DEC(" kB\nMMUPageSize2:   ", HPAGE_PMD_SIZE);
37b1c872e41df4 Andi Kleen        2026-02-09  1380  	}
d1be35cb6f9697 Andrei Vagin      2018-04-10  1381  	seq_puts(m, " kB\n");
d1be35cb6f9697 Andrei Vagin      2018-04-10  1382  
ee2ad71b0756e9 Luigi Semenzato   2019-07-11  1383  	__show_smap(m, &mss, false);
f1547959d9efd0 Vlastimil Babka   2018-08-21  1384  
daa60ae64c6587 Hugh Dickins      2023-08-14  1385  	seq_printf(m, "THPeligible:    %8u\n",
1f1c061089dcd2 David Hildenbrand 2025-08-15  1386  		   !!thp_vma_allowable_orders(vma, vma->vm_flags, TVA_SMAPS,
1f1c061089dcd2 David Hildenbrand 2025-08-15  1387  					      THP_ORDERS_ALL));
7635d9cbe8327e Michal Hocko      2018-12-28  1388  
27cca866e3fce0 Ram Pai           2018-04-13  1389  	if (arch_pkeys_enabled())
27cca866e3fce0 Ram Pai           2018-04-13  1390  		seq_printf(m, "ProtectionKey:  %8u\n", vma_pkey(vma));
834f82e2aa9a8e Cyrill Gorcunov   2012-12-17  1391  	show_smap_vma_flags(m, vma);
258f669e7e88c1 Vlastimil Babka   2018-08-21  1392  
258f669e7e88c1 Vlastimil Babka   2018-08-21  1393  	return 0;
258f669e7e88c1 Vlastimil Babka   2018-08-21  1394  }
258f669e7e88c1 Vlastimil Babka   2018-08-21  1395  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
