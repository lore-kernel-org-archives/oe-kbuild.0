Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D5715A864
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Apr 2025 04:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745640393; cv=none; b=KpnUjfJyCRUKLptHR8z8WATeYxLYbrnPztrkN8Af6I5pzuMa99WrXVktErQ9Xev092MrA24/8qnUuHydxQfuvtvK8dJBX50w1ZhdlC7Tk0E1nFJj9AacPh5Z2179uoLz0R5IU2ksJ7yY6Qm0fWR0r2mFGeUaoB+44+9nHk3/PYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745640393; c=relaxed/simple;
	bh=/TLG5pIZySTcgjkMj6f9zerR8WOeJC+Bj8Yag2nWeFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7hxHyuS2SoBh4wNuuAS6LyxK9GMR45xcSra8OF62hrOCvCjcyJQ8aP5AV2rHbAuNf6J3oqDpIgdISaBjPyDv2tD/AEBd+zzuzJgMAYD3HHRUvdxPKQHL/m8hRqgCX8tXpKrZFPXm6Ax/TUjQanSqqpy1GuAvP1eYcam/8Mbp/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jp3xSuYR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jp3xSuYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745640391; x=1777176391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/TLG5pIZySTcgjkMj6f9zerR8WOeJC+Bj8Yag2nWeFs=;
  b=Jp3xSuYRr6cvNKHbxMuLWe+DqI4YsrBxYIJyEX9vpF2jGmpzWVPiEMv/
   pgrgDsydzycEZnddEf2+3O3lnVvDB8Ni4mQCUanUqXqJ3ptIuepPZS7L9
   rZ8YjVDSSvXEhBq06KpYP6yeAYgSSP1CU7kCYR6zOefM0BJVvRynfxxXx
   7Ugt3Ub+d9dOjJRjvIFovO1Cn16GgYbl+g1k4nv3TucCFk6ZL6zn9DPg7
   1kzTSvHXtMXsC0lrCeiAZ52eEIIZkZWIheuPTbxQ9BGsDhypAJw9fW2TR
   nmy1lsJs1GsG6qWUZCjW0DqmxiyN9eYFTOKse3x1lsGvD3OeISQCV6dmP
   g==;
X-CSE-ConnectionGUID: efkS8/5HS56IzvHShgvjxg==
X-CSE-MsgGUID: BqSPN7W4R6uWd1U1xobhDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="64834499"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="64834499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 21:06:30 -0700
X-CSE-ConnectionGUID: mX7tTMnUTcyxlirWIM7Vtw==
X-CSE-MsgGUID: y3Rw/25uRWepNR9mM9Stfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="156289325"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Apr 2025 21:06:29 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Wo6-0005h3-2H;
	Sat, 26 Apr 2025 04:06:26 +0000
Date: Sat, 26 Apr 2025 12:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/mm/book3s32/mmu.c:226:2: error: call to
 '__compiletime_assert_493' declared with 'error' attribute: BUILD_BUG_ON
 failed: ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE
Message-ID: <202504261245.Eci3yiZs-lkp@intel.com>
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
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 2f2b9a3adc66e978a1248ffb38df8477e8e97c57 powerpc/32s: Reduce default size of module/execmem area
date:   8 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 8 months ago
config: powerpc-randconfig-r111-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261245.Eci3yiZs-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250426/202504261245.Eci3yiZs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504261245.Eci3yiZs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/mm/book3s32/mmu.c:21:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/powerpc/mm/book3s32/mmu.c:226:2: error: call to '__compiletime_assert_493' declared with 'error' attribute: BUILD_BUG_ON failed: ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE
     226 |         BUILD_BUG_ON(ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:510:2: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:104:1: note: expanded from here
     104 | __compiletime_assert_493
         | ^
   1 warning and 1 error generated.


vim +226 arch/powerpc/mm/book3s32/mmu.c

c4964331971541 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2020-06-29  195  
78cb0945f71419 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2024-03-16  196  int mmu_mark_initmem_nx(void)
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  197  {
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  198  	int nb = mmu_has_feature(MMU_FTR_USE_HIGH_BATS) ? 8 : 4;
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  199  	int i;
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  200  	unsigned long base = (unsigned long)_stext - PAGE_OFFSET;
37eb7ca91b692e arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2021-11-26  201  	unsigned long top = ALIGN((unsigned long)_etext - PAGE_OFFSET, SZ_128K);
4b19f96a81bcea arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2020-05-19  202  	unsigned long border = (unsigned long)__init_begin - PAGE_OFFSET;
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  203  	unsigned long size;
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  204  
37eb7ca91b692e arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2021-11-26  205  	for (i = 0; i < nb - 1 && base < top;) {
d37823c3528e5e arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2022-01-10  206  		size = bat_block_size(base, top);
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  207  		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  208  		base += size;
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  209  	}
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  210  	if (base < top) {
d37823c3528e5e arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2022-01-10  211  		size = bat_block_size(base, top);
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  212  		if ((top - base) > size) {
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  213  			size <<= 1;
4b19f96a81bcea arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2020-05-19  214  			if (strict_kernel_rwx_enabled() && base + size > border)
4b19f96a81bcea arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2020-05-19  215  				pr_warn("Some RW data is getting mapped X. "
4b19f96a81bcea arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2020-05-19  216  					"Adjust CONFIG_DATA_SHIFT to avoid that.\n");
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  217  		}
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  218  		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  219  		base += size;
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  220  	}
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  221  	for (; i < nb; i++)
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  222  		clearibat(i);
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  223  
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  224  	update_bats();
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  225  
2f2b9a3adc66e9 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2024-08-20 @226  	BUILD_BUG_ON(ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE);
2f2b9a3adc66e9 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2024-08-20  227  
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  228  	for (i = TASK_SIZE >> 28; i < 16; i++) {
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  229  		/* Do not set NX on VM space for modules */
c4964331971541 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2020-06-29  230  		if (is_module_segment(i << 28))
c4964331971541 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2020-06-29  231  			continue;
c4964331971541 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2020-06-29  232  
179ae57dbad1b9 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2021-02-06  233  		mtsr(mfsr(i << 28) | 0x10000000, i << 28);
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  234  	}
78cb0945f71419 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy 2024-03-16  235  	return 0;
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  236  }
63b2bc619565ef arch/powerpc/mm/ppc_mmu_32.c   Christophe Leroy 2019-02-21  237  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
