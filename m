Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB0B3E44E2
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783611294; cv=none; b=ESI1rBMj9MBzfW98qgoCT4HhwDBAKPTobPES1S54a1/iM/qnmNJIXObKNT71dUOEYLqVHMx1gyYiJiFMvnUZYRoNW2jjTAn7pbbsXhydzq+WvhZIm2bu6tLeXeQumRgJVzmxP2TP4Fn0/O67MWaSKCCRUQFRI1EBK3jHD47ddC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783611294; c=relaxed/simple;
	bh=G6TikiIQpUHL8JhcV1O+ipxfjVzHLc5NN328srfpL4Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l0DLqoYGKOkc8HvXgfU6UL09Ah0pvgcZY09FtjvonSaOXOOJLL9/gyz1EnHZrVyao3qT2qDxUM9ofxJaffyPI+d31LKOcYiF1Gb2BnxioCotm+U6xhQc6mT4XZlZePR56zw67t4fgkILhj/xPZHMff9uGEZO1QCWEHAqbHdtw1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bg5RC59R; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bg5RC59R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783611293; x=1815147293;
  h=date:from:to:cc:subject:message-id;
  bh=G6TikiIQpUHL8JhcV1O+ipxfjVzHLc5NN328srfpL4Q=;
  b=bg5RC59R1L6YJ1q+JRonAUusl5iVHWNWBaWacAhwVHlfhrclXuYytd5q
   PCo/pDXxEDkI8+f4/PUZN66ntXtTBkkpfb25mAcr/glUxiwoHwuINWG+z
   KqRPv5D/h56Z2mBe0LeQfAgIceujkSUUh091qjDwnXi+6yqACvHuf8HyZ
   PeFH3TfSImuRlvTsXQ9/VRfBE2P7PiZdrBwywD/DaTg6leVcmEeXEPV0r
   ytn+8mfFM+C+ap3EP0TuVaWhlDCJbZKIqz6Vzf1ljB+KfxWlzd5xnEU/m
   YJeu/hKhmntOCc6e7ecKHEo76Kf7e/0iXwPDyBopsWDuMCOIaqqvr0stU
   w==;
X-CSE-ConnectionGUID: Cvqb2sjcRMWcOCwIM6KqZw==
X-CSE-MsgGUID: /TyFkSgdSMmM4bFdloflLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94647717"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94647717"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 08:34:52 -0700
X-CSE-ConnectionGUID: kajowVC5Rd60kUnx7hjTAw==
X-CSE-MsgGUID: 417Qrp08Q1+Mn+wfuMSaXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250627798"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2026 08:34:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whqm0-00000000Hoh-3Voj;
	Thu, 09 Jul 2026 15:34:48 +0000
Date: Thu, 09 Jul 2026 23:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [davidhildenbrand:folded_pgtable 28/32]
 arch/x86/mm/pgtable.c:434:3: error: call to '__compiletime_assert_476'
 declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202607092357.lOkBrapn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "David Hildenbrand (Arm)" <david@kernel.org>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   0551ca68b7552b7d71f1d2882635809a573d6c79
commit: 4d449742015c33fd18a4aebf1ee795675c2b532f [28/32] mm/pgtable: disallow calling folded set_pgd/set_p4d/set_pud
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-003-20260709 (https://download.01.org/0day-ci/archive/20260709/202607092357.lOkBrapn-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092357.lOkBrapn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607092357.lOkBrapn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/pgtable.c:434:3: error: call to '__compiletime_assert_476' declared with 'error' attribute: BUILD_BUG failed
     434 |                 set_pud(pudp, entry);
         |                 ^
   include/asm-generic/pgtable-nopmd.h:41:35: note: expanded from macro 'set_pud'
      41 | #define set_pud(pudptr, pudval)                 BUILD_BUG()
         |                                                 ^
   include/linux/build_bug.h:60:21: note: expanded from macro 'BUILD_BUG'
      60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:231:1: note: expanded from here
     231 | __compiletime_assert_476
         | ^
   1 error generated.
--
   arch/x86/platform/olpc/olpc_ofw.c:26:16: warning: variable 'ofw_pde' set but not used [-Wunused-but-set-variable]
      26 |         pgd_t *base, *ofw_pde;
         |                       ^
>> arch/x86/platform/olpc/olpc_ofw.c:41:2: error: call to '__compiletime_assert_133' declared with 'error' attribute: BUILD_BUG failed
      41 |         set_pgd(&swapper_pg_dir[OLPC_OFW_PDE_NR], *ofw_pde);
         |         ^
   include/asm-generic/pgtable-nop4d.h:32:35: note: expanded from macro 'set_pgd'
      32 | #define set_pgd(pgdptr, pgdval)                 BUILD_BUG()
         |                                                 ^
   include/linux/build_bug.h:60:21: note: expanded from macro 'BUILD_BUG'
      60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:194:1: note: expanded from here
     194 | __compiletime_assert_133
         | ^
   1 warning and 1 error generated.


vim +434 arch/x86/mm/pgtable.c

a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  425  
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  426  int pudp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  427  			  pud_t *pudp, pud_t entry, int dirty)
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  428  {
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  429  	int changed = !pud_same(*pudp, entry);
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  430  
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  431  	VM_BUG_ON(address & ~HPAGE_PUD_MASK);
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  432  
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  433  	if (changed && dirty) {
9bc4f28af75a91a Nadav Amit       2018-09-02 @434  		set_pud(pudp, entry);
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  435  		/*
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  436  		 * We had a write-protection fault here and changed the pud
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  437  		 * to to more permissive. No need to flush the TLB for that,
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  438  		 * #PF is architecturally guaranteed to do that and in the
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  439  		 * worst-case we'll generate a spurious fault.
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  440  		 */
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  441  	}
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  442  
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  443  	return changed;
a00cc7d9dd93d66 Matthew Wilcox   2017-02-24  444  }
db3eb96f4e6281b Andrea Arcangeli 2011-01-13  445  #endif
db3eb96f4e6281b Andrea Arcangeli 2011-01-13  446  

:::::: The code at line 434 was first introduced by commit
:::::: 9bc4f28af75a91aea0ae383f50b0a430c4509303 x86/mm: Use WRITE_ONCE() when setting PTEs

:::::: TO: Nadav Amit <namit@vmware.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
