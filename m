Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4BA3101A0
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 06:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772607146; cv=none; b=ISLZalvbMop2kS/0g7iCpyfy4aYE8DSrvtIyZeCwil06jI0skqwxsckBdqcQ3ztnzbhkUaQN+Ina1AXmgaC/qL4FSxswxaWI5jSWc9WbFzYNzeX+y/0CIilhOYLZzOFsXC3ALH+4Sk0kTCbQBNxurW4mK9LCdnyOIcBkYZMzcFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772607146; c=relaxed/simple;
	bh=gx+JUaZXKkQBCEtPc8D38gsLBTb+F0SNauQ5xuKCAag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3W+zHwJSkIbRnPBqsBoRFrLeMcD6LoACfER77EaqLq9ViMJChIDdKXkt7brOF8B6h+FdNkegtfws1aBew6gOpaKxCrU2YZnn174KlpDtjSU1YXr6hYPBczaXi0++h2uRMhrx89ApuinaEArBrJZILD5ewmse8uesBTrrgO39IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sdt0jkuJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sdt0jkuJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772607144; x=1804143144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gx+JUaZXKkQBCEtPc8D38gsLBTb+F0SNauQ5xuKCAag=;
  b=Sdt0jkuJ8Ru99wC6FrIiJIrMpOFmnrHXCbeWasTyhV4d3uE8U01EpggT
   S2AXxUFHN/LpgLSlKq6kqKFBYrGFSrV+7VHlLTb790iHvsaV+V7hxVJMd
   6DBtFeDxWrWkwVRPMmBNWlg5vCWCLpFePv0twgvmA6+Yfdj9sso8xK4+S
   CSFpA35A01EmJNtwEyHlKfEBKTsscIuL9pPyPbtC1Tq2IRQosOBdQnPiX
   sMsP2eiogrvmtUljNRRqd+vy/Fkpbekg4KSNQLt0zOWKW7BC+vbohTBXO
   lld8I+ZBhdADdiex7jKbtyBpK0dnd7r8uRmtjqlRxkYNKqMw69x9lLvmy
   Q==;
X-CSE-ConnectionGUID: 9JaaFCxXQN61xzO/Jc0HgA==
X-CSE-MsgGUID: fydfQ4jSQvekJeyqOWfmVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="76260730"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="76260730"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 22:52:23 -0800
X-CSE-ConnectionGUID: KNPfKGaHRnWMqZ85orMeqA==
X-CSE-MsgGUID: Ioqb9QVXRUu5MA0mk4mabA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="216566616"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Mar 2026 22:52:21 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxg5j-000000003MP-3Dxe;
	Wed, 04 Mar 2026 06:52:19 +0000
Date: Wed, 4 Mar 2026 14:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] smaps: Report PMD page size for pure PMD mappings
Message-ID: <202603041448.j9gaSbUi-lkp@intel.com>
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
In-Reply-To: <20260303201556.107960-1-ak@linux.intel.com>
References: <20260303201556.107960-1-ak@linux.intel.com>
TO: Andi Kleen <ak@linux.intel.com>
TO: linux-mm@kvack.org
CC: akpm@linux-foundation.org
CC: Andi Kleen <ak@linux.intel.com>

Hi Andi,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on akpm-mm/mm-everything linus/master v7.0-rc2 next-20260303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andi-Kleen/smaps-Report-PMD-page-size-for-pure-PMD-mappings/20260304-041922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260303201556.107960-1-ak%40linux.intel.com
patch subject: [PATCH v3] smaps: Report PMD page size for pure PMD mappings
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260304/202603041448.j9gaSbUi-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041448.j9gaSbUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603041448.j9gaSbUi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/proc/task_mmu.c:1390:8: error: call to '__compiletime_assert_405' declared with 'error' attribute: BUILD_BUG failed
    1390 |                 ps = HPAGE_PMD_SIZE;
         |                      ^
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
   include/linux/compiler_types.h:694:2: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:687:4: note: expanded from macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:79:1: note: expanded from here
      79 | __compiletime_assert_405
         | ^
   1 error generated.


vim +1390 fs/proc/task_mmu.c

f1547959d9efd0 Vlastimil Babka   2018-08-21  1369  
8e68d689afe328 Vlastimil Babka   2018-08-21  1370  static int show_smap(struct seq_file *m, void *v)
8e68d689afe328 Vlastimil Babka   2018-08-21  1371  {
8e68d689afe328 Vlastimil Babka   2018-08-21  1372  	struct vm_area_struct *vma = v;
860a2e7fa4a186 Alexey Dobriyan   2023-09-29  1373  	struct mem_size_stats mss = {};
9378536cc887d4 Andi Kleen        2026-03-03  1374  	unsigned ps;
8e68d689afe328 Vlastimil Babka   2018-08-21  1375  
03b4b1149308b0 Chinwen Chang     2020-10-13  1376  	smap_gather_stats(vma, &mss, 0);
4752c369789250 Matt Mackall      2008-02-04  1377  
871305bb202808 Vlastimil Babka   2018-08-21  1378  	show_map_vma(m, vma);
4752c369789250 Matt Mackall      2008-02-04  1379  
d1be35cb6f9697 Andrei Vagin      2018-04-10  1380  	SEQ_PUT_DEC("Size:           ", vma->vm_end - vma->vm_start);
d1be35cb6f9697 Andrei Vagin      2018-04-10  1381  	SEQ_PUT_DEC(" kB\nKernelPageSize: ", vma_kernel_pagesize(vma));
9378536cc887d4 Andi Kleen        2026-03-03  1382  	ps = vma_mmu_pagesize(vma);
9378536cc887d4 Andi Kleen        2026-03-03  1383  	/*
9378536cc887d4 Andi Kleen        2026-03-03  1384  	 * When the mapping is only PMD THP report the correct page size.
9378536cc887d4 Andi Kleen        2026-03-03  1385  	 * When multiple pages are there the user has to figure it out
9378536cc887d4 Andi Kleen        2026-03-03  1386  	 * from other fields.
9378536cc887d4 Andi Kleen        2026-03-03  1387  	 */
9378536cc887d4 Andi Kleen        2026-03-03  1388  	if (mss.shmem_thp + mss.file_thp + mss.anonymous_thp == mss.resident &&
9378536cc887d4 Andi Kleen        2026-03-03  1389  	    mss.resident)
9378536cc887d4 Andi Kleen        2026-03-03 @1390  		ps = HPAGE_PMD_SIZE;
9378536cc887d4 Andi Kleen        2026-03-03  1391  	SEQ_PUT_DEC(" kB\nMMUPageSize:    ", ps);
d1be35cb6f9697 Andrei Vagin      2018-04-10  1392  	seq_puts(m, " kB\n");
d1be35cb6f9697 Andrei Vagin      2018-04-10  1393  
ee2ad71b0756e9 Luigi Semenzato   2019-07-11  1394  	__show_smap(m, &mss, false);
f1547959d9efd0 Vlastimil Babka   2018-08-21  1395  
daa60ae64c6587 Hugh Dickins      2023-08-14  1396  	seq_printf(m, "THPeligible:    %8u\n",
1f1c061089dcd2 David Hildenbrand 2025-08-15  1397  		   !!thp_vma_allowable_orders(vma, vma->vm_flags, TVA_SMAPS,
1f1c061089dcd2 David Hildenbrand 2025-08-15  1398  					      THP_ORDERS_ALL));
7635d9cbe8327e Michal Hocko      2018-12-28  1399  
27cca866e3fce0 Ram Pai           2018-04-13  1400  	if (arch_pkeys_enabled())
27cca866e3fce0 Ram Pai           2018-04-13  1401  		seq_printf(m, "ProtectionKey:  %8u\n", vma_pkey(vma));
834f82e2aa9a8e Cyrill Gorcunov   2012-12-17  1402  	show_smap_vma_flags(m, vma);
258f669e7e88c1 Vlastimil Babka   2018-08-21  1403  
258f669e7e88c1 Vlastimil Babka   2018-08-21  1404  	return 0;
258f669e7e88c1 Vlastimil Babka   2018-08-21  1405  }
258f669e7e88c1 Vlastimil Babka   2018-08-21  1406  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
