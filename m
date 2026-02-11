Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65B42EC56D
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 02:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770778753; cv=none; b=kugpW5xULV8vPHKEjG/dDwI9QzOsC8XuDgL6qnedl7BvUgd/TgJN/q08NcjMM3OSjD0T/U2/eCT5D65Mpca/P7gmQwJvzmw9sIVTigET+c5CjhwsGsofCxDCBOLWFIGLSDDHrR4p/clgYbLDY219oSkULwyqUXil4fmyf+VvIsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770778753; c=relaxed/simple;
	bh=xEU7bQW+kl76TCBTmhWmI8we2WznOkE4gfFVMjKLbrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EG29tSERzI/WnEwCKUp3ai6fxD57XnWck87Wcf3mAwF21Y54dJE/JNU8jKUAHyDP4Sk4ThQknHZPlPXLce8xc2pnAICG8/74MgBULU1iuTZP4hCq7aA9MpR9Y+/aXo79Dmm5zOozqbgqBSFdKfEapgjRT1E+3yMqjiuTzFekY6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xc/xHXly; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xc/xHXly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770778752; x=1802314752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xEU7bQW+kl76TCBTmhWmI8we2WznOkE4gfFVMjKLbrA=;
  b=Xc/xHXlyXuGBr95DjHX3DMmgy2ZhABJGd7B9GlKIkMKjHhBI4QFbAgot
   1zlOQWN1WNGhP1zYZFuhNGJ+jaRYezBnXPZIeUMV90VwPxvfLNZfZhMuj
   zTIy+QHl/SbGB9r9FbfZdBJMitg9fpYhMWMU4TrmNk4LvTWIkOXjGuLU3
   jFk7hPUns2R4jhsSQExDFRIraKLsLjlFwEVeDTdOktaWZnAD4R8qviNBu
   k/4Cuigw+KlCBv1enBRCqCljzd7FBNx/RgpHC6lrAPZ+wn8L6Fjbdi5i8
   QMCWfz+uaiNkVTv+IMxkjJLRgL7PBXrjCFxIW6cKn9Qd8Unvh1VIm35rc
   w==;
X-CSE-ConnectionGUID: VhBeV30ET/+2YiFrhFnE6Q==
X-CSE-MsgGUID: f/DeAA3MR+6+VWucNKHUgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71126794"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71126794"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 18:59:11 -0800
X-CSE-ConnectionGUID: AZRgJqyhSiiBPlsA+hWspA==
X-CSE-MsgGUID: FxJ7oW2ORfezeZekgGHk5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="249753394"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Feb 2026 18:59:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq0RX-00000000pcG-2ig2;
	Wed, 11 Feb 2026 02:59:07 +0000
Date: Wed, 11 Feb 2026 10:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] smaps: Report correct page sizes with THP
Message-ID: <202602111045.T7U5qnHV-lkp@intel.com>
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
In-Reply-To: <20260209201731.231667-1-ak@linux.intel.com>
References: <20260209201731.231667-1-ak@linux.intel.com>
TO: Andi Kleen <ak@linux.intel.com>
TO: linux-mm@kvack.org
CC: linux-fsdevel@vger.kernel.org
CC: akpm@linux-foundation.org
CC: willy@infradead.org
CC: Andi Kleen <ak@linux.intel.com>

Hi Andi,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.19 next-20260210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andi-Kleen/smaps-Report-correct-page-sizes-with-THP/20260210-042028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260209201731.231667-1-ak%40linux.intel.com
patch subject: [PATCH] smaps: Report correct page sizes with THP
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-015-20260210 (https://download.01.org/0day-ci/archive/20260211/202602111045.T7U5qnHV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111045.T7U5qnHV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602111045.T7U5qnHV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/proc/task_mmu.c:1372:40: error: call to '__compiletime_assert_1237' declared with 'error' attribute: BUILD_BUG failed
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
   <scratch space>:288:1: note: expanded from here
     288 | __compiletime_assert_1237
         | ^
   fs/proc/task_mmu.c:1378:13: error: call to '__compiletime_assert_1238' declared with 'error' attribute: BUILD_BUG failed
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
   <scratch space>:2:1: note: expanded from here
       2 | __compiletime_assert_1238
         | ^
   2 errors generated.


vim +1372 fs/proc/task_mmu.c

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
f9a5299667dd92 Andi Kleen        2026-02-09  1368  
f9a5299667dd92 Andi Kleen        2026-02-09  1369  	/* Only THP? */
f9a5299667dd92 Andi Kleen        2026-02-09  1370  	if (mss.shmem_thp + mss.file_thp + mss.anonymous_thp == mss.resident &&
f9a5299667dd92 Andi Kleen        2026-02-09  1371  	    mss.resident > 0) {
f9a5299667dd92 Andi Kleen        2026-02-09 @1372  		SEQ_PUT_DEC(" kB\nMMUPageSize:    ", HPAGE_PMD_SIZE);
f9a5299667dd92 Andi Kleen        2026-02-09  1373  	} else {
f9a5299667dd92 Andi Kleen        2026-02-09  1374  		unsigned ps = vma_mmu_pagesize(vma);
f9a5299667dd92 Andi Kleen        2026-02-09  1375  		/* Will need adjustments when more THP page sizes are added. */
f9a5299667dd92 Andi Kleen        2026-02-09  1376  		SEQ_PUT_DEC(" kB\nMMUPageSize:    ", ps);
f9a5299667dd92 Andi Kleen        2026-02-09  1377  		if (mss.shmem_thp + mss.file_thp + mss.anonymous_thp > 0 &&
f9a5299667dd92 Andi Kleen        2026-02-09  1378  		    ps != HPAGE_PMD_SIZE)
f9a5299667dd92 Andi Kleen        2026-02-09  1379  			SEQ_PUT_DEC(" kB\nMMUPageSize2:   ", HPAGE_PMD_SIZE);
f9a5299667dd92 Andi Kleen        2026-02-09  1380  	}
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
