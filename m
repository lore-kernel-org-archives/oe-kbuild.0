Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8574C1E834D
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Apr 2025 02:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745634745; cv=none; b=GGs9ZL/xaa5haXy9Phn0ESd+0rUIG6/bqsfY7fTmfahhJBsdXUeacT8U9ZEECf9Ek0NJANoB8/FKo7LdpGbMUCXfYoqpjUkPA56dZRbe0q4YySTMC9lhTkJUNr15vTwc1K5s5RYWkLRzMEGk7BnMRdfzEMzD2QqcHDPvMuvP5ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745634745; c=relaxed/simple;
	bh=EgFOUzmQoE45YSawxvmrtPvZVmSdt8CWLLoHHVlgBnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lt5VkblYvSDVr3j+CSLxWxQO5nvnRmyoBE5gbGxemvq+Y6uveGKT6NZYohCUD+aNLHJRcM3JHaFFECVrpHgmpJuXhmD9QAige4WmhaB8JH5VDbPa2ZYFYD/sOz+uN0OEB0psDghgidQZ9qi0GGi/ah/Gv+7O1rVAyhg28kusEeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYuAO568; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYuAO568"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745634743; x=1777170743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EgFOUzmQoE45YSawxvmrtPvZVmSdt8CWLLoHHVlgBnU=;
  b=FYuAO568ydlL1AhOm6DG2vBIp9lbupkF0Q0Gy6VdejubRc+M5aTS4tb5
   Bf2sHxV1aSXpLGlDOQN3bJbAq+mMbiFG1RyNes5qE2vMvf8fgVwaobD2f
   FN6II/nP3u26txtvS67i4wNV0BbwKpW7WE8R6O8uQE7GVFnPEknWtpr+0
   mzNds6ekXJmx43ZRmlwQnq40KhrqUUJDjaazh7D/aLllqGea5zK3+TqdH
   G+Nv9v1mLvhkZ7CzsHJYqUH4hHJ5sG7YOfbh8oiyKS0hg/1CxLChWM6n3
   4T1e12IW1qeNovsYMH8CUtxlpGwJnZp73zkN4LHqSBLsU0u6iFYyXATvW
   g==;
X-CSE-ConnectionGUID: lebxUPLlRheZBXw3waNepA==
X-CSE-MsgGUID: P8B9raqVQk6/An8mj1hIOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="57945571"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="57945571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 19:32:22 -0700
X-CSE-ConnectionGUID: LFLKBrDLQMO+Il/xQrtZAA==
X-CSE-MsgGUID: 1W6t9MvIT6S8SoJxi3lWvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="132932226"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Apr 2025 19:32:21 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8VL1-0005f1-0c;
	Sat, 26 Apr 2025 02:32:19 +0000
Date: Sat, 26 Apr 2025 10:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/mm/mem.c:428:2: error: call to
 '__compiletime_assert_508' declared with 'error' attribute: BUILD_BUG_ON
 failed: TASK_SIZE > MODULES_VADDR
Message-ID: <202504261027.aDQM0ra4-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Mike Rapoport (IBM)" <rppt@kernel.org>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 7582b7be16d0ba90e3dbd9575a730cabd9eb852a kprobes: remove dependency on CONFIG_MODULES
date:   12 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 12 months ago
config: powerpc-randconfig-r111-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261027.aDQM0ra4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250426/202504261027.aDQM0ra4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504261027.aDQM0ra4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/mm/mem.c:15:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/powerpc/mm/mem.c:428:2: error: call to '__compiletime_assert_508' declared with 'error' attribute: BUILD_BUG_ON failed: TASK_SIZE > MODULES_VADDR
     428 |         BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:467:2: note: expanded from macro 'compiletime_assert'
     467 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:455:2: note: expanded from macro '_compiletime_assert'
     455 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:448:4: note: expanded from macro '__compiletime_assert'
     448 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:189:1: note: expanded from here
     189 | __compiletime_assert_508
         | ^
   1 warning and 1 error generated.


vim +428 arch/powerpc/mm/mem.c

0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  413) 
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  414) struct execmem_info __init *execmem_arch_setup(void)
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  415) {
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  416) 	pgprot_t kprobes_prot = strict_module_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  417) 	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  418) 	unsigned long fallback_start = 0, fallback_end = 0;
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  419) 	unsigned long start, end;
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  420) 
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  421) 	/*
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  422) 	 * BOOK3S_32 and 8xx define MODULES_VADDR for text allocations and
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  423) 	 * allow allocating data in the entire vmalloc space
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  424) 	 */
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  425) #ifdef MODULES_VADDR
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  426) 	unsigned long limit = (unsigned long)_etext - SZ_32M;
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  427) 
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05 @428) 	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);

:::::: The code at line 428 was first introduced by commit
:::::: 0cc2dc4902f425e346d46deeea2352d9fba75375 arch: make execmem setup available regardless of CONFIG_MODULES

:::::: TO: Mike Rapoport (IBM) <rppt@kernel.org>
:::::: CC: Luis Chamberlain <mcgrof@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
