Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590291EEE6
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jul 2026 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783792252; cv=none; b=eK9bV8tFld1rlUd0C6jyMhg7EgGtN60bt7G+uFDD8vbSFZ5vtIxZzka8bEw3nDYqd74+Ni0oQKSs+57BW3jZg9JbCcS2G/zvXbtGCge9AlPYk5eafoPlmMwzOFYwNFebslB9jfIaIRQhUF+ihpWMzLw5wXVw6MnZKTr7FlOUQXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783792252; c=relaxed/simple;
	bh=Rf206Epte87bwI1nfmW2U0v3LHQDvR1fR0WeRN/Z47Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=je78yL10HqAcqn3bbTm2KsonKKNfo0Y3/f4J4P0cbt61tXkl2XDgsMxIsqZ0NZaHEHo3a+FUNNP8Cqhjk4hcW8tqL3cpTw81P6vE1OuyiUE1Bb6YkJEbl7mwURgrB3XVcjbHkx78EJ9UXc61DulmbciD/GfAfTdcHffDT1h8tvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgDIlrGn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgDIlrGn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783792251; x=1815328251;
  h=date:from:to:cc:subject:message-id;
  bh=Rf206Epte87bwI1nfmW2U0v3LHQDvR1fR0WeRN/Z47Q=;
  b=CgDIlrGnd03SZjZiUntWkpTagherehlW50m4QxuVkn5V9JClGctLGNGI
   c6rG0slnZ2fjLxpJQzNDmWOxAVYHx1TXfrbxPQ9pJyxmflinFZDfbQHUB
   ajdww+wXSNEs8Ozg9TCD66nf+zz9nzY9P+K36lzgozP5z5/v413WQ91As
   l5gOPtmFwOacvYpT9QqTKrOliHByz5pSjdX5zYHLDy+mRAjgMRlYyQmPG
   0TQD44MXbKmMZlGFfSRJjHFe6dgQ+xZmLQ+H8pUXaUeLhlqhngh93r/s6
   IdKQuAfo0BQ3TXBn0nLDn8Tz3CUBddeviI4YGp9FqvAayK/WGk/Rs0JQ3
   A==;
X-CSE-ConnectionGUID: 0pMUPqphSIagHfZSoI4JCQ==
X-CSE-MsgGUID: 9yGtbJ5LSEaldC/HyQU8Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84435528"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84435528"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 10:50:50 -0700
X-CSE-ConnectionGUID: H0tEoPP4TWWBZuIurxeKZw==
X-CSE-MsgGUID: ZBYJKK1+QLGMY40oImWNqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258741969"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 11 Jul 2026 10:50:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wibqK-00000000KFp-27ii;
	Sat, 11 Jul 2026 17:50:31 +0000
Date: Sun, 12 Jul 2026 01:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [alexshi:pr/17 1/2] arch/x86/kernel/ptrace.c:245:2: error:
 call to '__compiletime_assert_297' declared with 'error' attribute:
 BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
Message-ID: <202607120138.7bYs1bCO-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: alexs@kernel.org

Hi Alex,

FYI, the error/warning still remains.

tree:   https://github.com/alexshi/linux.git pr/17
head:   521ce3b68fcc0aae09370fcfe3aad3c45a6e9d0d
commit: 80997c8b66fd8d73a96cd681a473bacaf75b7d98 [1/2] x86/ptrace: move down unused registers
:::::: branch date: 18 hours ago
:::::: commit date: 2 years, 6 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260712/202607120138.7bYs1bCO-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120138.7bYs1bCO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607120138.7bYs1bCO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/ptrace.c:11:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/kernel/ptrace.c:245:2: error: call to '__compiletime_assert_297' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
     245 |         BUILD_BUG_ON(offsetof(struct pt_regs, r15) != 0);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:5:1: note: expanded from here
       5 | __compiletime_assert_297
         | ^
>> arch/x86/kernel/ptrace.c:245:2: error: call to '__compiletime_assert_297' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:5:1: note: expanded from here
       5 | __compiletime_assert_297
         | ^
>> arch/x86/kernel/ptrace.c:245:2: error: call to '__compiletime_assert_297' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:5:1: note: expanded from here
       5 | __compiletime_assert_297
         | ^
   1 warning and 3 errors generated.


vim +245 arch/x86/kernel/ptrace.c

2047b08be67b70 Roland McGrath 2008-01-30  242  
2047b08be67b70 Roland McGrath 2008-01-30  243  static unsigned long *pt_regs_access(struct pt_regs *regs, unsigned long offset)
2047b08be67b70 Roland McGrath 2008-01-30  244  {
2047b08be67b70 Roland McGrath 2008-01-30 @245  	BUILD_BUG_ON(offsetof(struct pt_regs, r15) != 0);
2047b08be67b70 Roland McGrath 2008-01-30  246  	return &regs->r15 + (offset / sizeof(regs->r15));
2047b08be67b70 Roland McGrath 2008-01-30  247  }
2047b08be67b70 Roland McGrath 2008-01-30  248  

:::::: The code at line 245 was first introduced by commit
:::::: 2047b08be67b70875d8765fc81d34ce28041bec3 x86: x86 ptrace getreg/putreg merge

:::::: TO: Roland McGrath <roland@redhat.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
