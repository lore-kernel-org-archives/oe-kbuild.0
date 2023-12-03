Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926AD2598
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzRlzLi6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701588776; x=1733124776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pk1hFB8xne+zLt7uEqNfWIolzJqVnlpfndX/JGMGXb8=;
  b=jzRlzLi6rGZxohg66Hxlmd1hwPjPNFRNBl7tYU5Jo/bxXYocY+VzUphC
   dpo0S7hpXkxAPG6LhTABAwMV0roMuQVCy6QQZlJ7bXTS9at6EBu0YR6yQ
   EDZpLVs/+gTm+OLab49kEPnYhyAfF5xKwL2KZRkfLgJ1mCFvQP2O3WeyQ
   S1mvm1dnkxDDL0IAOzLAtpz6vNtRDZTIyi/g+VXqGcPt+PzAfmdsBxUm2
   lUE9BYzSU72oWr6Zq4184aewnTWMhtUM09/JyS/IzddqQwD7gKHs160KK
   0Z4yQ31A61AXi5qKeF0V7SB/AY7zjjgGKP2xDE+sEn3ax8oUhrON9pD47
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="397517632"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="397517632"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 23:32:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="799231497"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="799231497"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 02 Dec 2023 23:32:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9gy8-0006PP-27;
	Sun, 03 Dec 2023 07:32:48 +0000
Date: Sun, 3 Dec 2023 15:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/asm-generic/bitops/lock.h:25:9: sparse: sparse: Trying to
 use reserved word 'if' as identifier
Message-ID: <202312031554.W22QJie6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/asm-generic/bitops/lock.h:25:9: sparse: sparse: Trying to use reserved word 'if' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Will Deacon <will.deacon@arm.com>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: 84c6591103dbeaf393a092a3fc7b09510825f6b9 locking/atomics, asm-generic/bitops/lock.h: Rewrite using atomic_fetch_*()
date:   5 years ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 years ago
config: sparc64-randconfig-r112-20231130 (https://download.01.org/0day-ci/archive/20231203/202312031554.W22QJie6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031554.W22QJie6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312031554.W22QJie6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/asm-generic/atomic-long.h:182:1: sparse: sparse: got atomic_fetch_sub
   include/asm-generic/atomic-long.h:182:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:182:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:183:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:183:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/atomic-long.h:183:1: sparse: sparse: got atomic_fetch_sub
   include/asm-generic/atomic-long.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:183:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:184:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:184:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/atomic-long.h:184:1: sparse: sparse: got atomic_fetch_sub
   include/asm-generic/atomic-long.h:184:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:184:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:185:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:185:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/atomic-long.h:185:1: sparse: sparse: got atomic_fetch_sub
   include/asm-generic/atomic-long.h:185:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:185:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:198:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:198:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:199:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:199:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:200:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:200:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:201:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:201:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:202:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:203:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:203:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:211:16: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic-long.h:211:16: sparse: sparse: got (
   include/asm-generic/atomic-long.h:211:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:212:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:212:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:218:16: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic-long.h:218:16: sparse: sparse: got (
   include/asm-generic/atomic-long.h:218:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:219:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:219:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:225:16: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic-long.h:225:16: sparse: sparse: got (
   include/asm-generic/atomic-long.h:225:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:226:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:226:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:232:16: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic-long.h:232:16: sparse: sparse: got (
   include/asm-generic/atomic-long.h:232:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:233:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:233:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:243:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:243:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/atomic-long.h:243:1: sparse: sparse: got atomic_add_return
   include/asm-generic/atomic-long.h:243:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:243:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:244:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:244:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/atomic-long.h:244:1: sparse: sparse: got atomic_add_return
   include/asm-generic/atomic-long.h:244:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:244:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:245:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:245:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/atomic-long.h:245:1: sparse: sparse: got atomic_add_return
   include/asm-generic/atomic-long.h:245:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:245:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:246:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:246:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/atomic-long.h:246:1: sparse: sparse: got atomic_add_return
   include/asm-generic/atomic-long.h:246:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:246:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:247:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:247:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/atomic-long.h:247:1: sparse: sparse: got atomic_sub_return
   include/asm-generic/atomic-long.h:247:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:247:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:248:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:248:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/atomic-long.h:248:1: sparse: sparse: got atomic_sub_return
   include/asm-generic/atomic-long.h:248:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:248:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:249:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:249:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/atomic-long.h:249:1: sparse: sparse: got atomic_sub_return
   include/asm-generic/atomic-long.h:249:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:249:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:250:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:250:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/atomic-long.h:250:1: sparse: sparse: got atomic_sub_return
   include/asm-generic/atomic-long.h:250:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:250:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:258:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/atomic-long.h:258:22: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/atomic-long.h:258:22: sparse: sparse: got atomic_add_unless
   include/asm-generic/atomic-long.h:259:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:259:1: sparse: sparse: got }
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/bitops_64.h, arch/sparc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/asm-generic/bitops/lock.h:24:11: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:24:11: sparse: sparse: got +=
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got (
>> include/asm-generic/bitops/lock.h:25:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got }
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got 1
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got __read_once_size_nocheck
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got {
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got .
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got }
>> include/asm-generic/bitops/lock.h:28:66: sparse: sparse: No right hand side of '*'-expression
   include/asm-generic/bitops/lock.h:28:67: sparse: sparse: Expected ) in function call
   include/asm-generic/bitops/lock.h:28:67: sparse: sparse: got p
>> include/asm-generic/bitops/lock.h:29:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/lock.h:29:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:29:16: sparse: sparse: got !
   include/asm-generic/bitops/lock.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/lock.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/lock.h:43:42: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/lock.h:43:42: sparse: sparse: got (
   include/asm-generic/bitops/lock.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/lock.h:44:1: sparse: sparse: got }
   include/asm-generic/bitops/lock.h:62:11: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:62:11: sparse: sparse: got +=
   include/asm-generic/bitops/lock.h:64:13: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:64:13: sparse: sparse: got &=
   include/asm-generic/bitops/lock.h:65:33: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/lock.h:65:33: sparse: sparse: got (
   include/asm-generic/bitops/lock.h:66:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/lock.h:66:1: sparse: sparse: got }
   include/asm-generic/bitops/lock.h:84:11: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:84:11: sparse: sparse: got +=
   include/asm-generic/bitops/lock.h:85:70: sparse: sparse: No right hand side of '*'-expression
   include/asm-generic/bitops/lock.h:85:71: sparse: sparse: Expected ) in function call
   include/asm-generic/bitops/lock.h:85:71: sparse: sparse: got p
   include/asm-generic/bitops/lock.h:86:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/lock.h:86:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:86:16: sparse: sparse: got !
   include/asm-generic/bitops/lock.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/lock.h:87:1: sparse: sparse: got }
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   arch/sparc/include/asm/atomic_64.h:114:13: sparse: sparse: undefined identifier 'v'
   arch/sparc/include/asm/atomic_64.h:114:13: sparse: sparse: undefined identifier 'v'
   arch/sparc/include/asm/atomic_64.h:114:13: sparse: sparse: undefined identifier 'v'
   arch/sparc/include/asm/atomic_64.h:118:23: sparse: sparse: undefined identifier 'v'
   arch/sparc/include/asm/atomic_64.h:118:23: sparse: sparse: undefined identifier 'v'
   arch/sparc/include/asm/atomic_64.h:118:23: sparse: sparse: undefined identifier 'v'
   arch/sparc/include/asm/atomic_64.h:118:23: sparse: sparse: undefined identifier 'a'
   arch/sparc/include/asm/atomic_64.h:118:23: sparse: sparse: undefined identifier 'v'
   arch/sparc/include/asm/atomic_64.h:118:23: sparse: sparse: undefined identifier 'v'
   arch/sparc/include/asm/atomic_64.h:118:23: sparse: sparse: cast from unknown type
   arch/sparc/include/asm/atomic_64.h:121:17: sparse: sparse: symbol 'c' has multiple initializers (originally initialized at arch/sparc/include/asm/atomic_64.h:114)
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/asm-generic/atomic-long.h:59:1: sparse: sparse: symbol '__write_once_size' redeclared with different type (different argument counts):
   include/asm-generic/atomic-long.h:59:1: sparse:    int static [signed] [toplevel] __write_once_size( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/kernel.h, arch/sparc/vdso/vdso32/../vclock_gettime.c):
   include/linux/compiler.h:209:29: sparse: note: previously declared as:
   include/linux/compiler.h:209:29: sparse:    void static inline [toplevel] [unused] __write_once_size( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/asm-generic/atomic-long.h:60:1: sparse: sparse: symbol '__write_once_size' redeclared with different type (different argument counts):
   include/asm-generic/atomic-long.h:60:1: sparse:    int static [signed] [toplevel] __write_once_size( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/kernel.h, arch/sparc/vdso/vdso32/../vclock_gettime.c):
   include/linux/compiler.h:209:29: sparse: note: previously declared as:
   include/linux/compiler.h:209:29: sparse:    void static inline [toplevel] [unused] __write_once_size( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/asm-generic/atomic-long.h:201:1: sparse: sparse: symbol 'atomic_andnot' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/atomic-long.h:201:1: sparse:    int static [signed] [toplevel] atomic_andnot( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, arch/sparc/include/asm/bitops.h, ...):
   include/linux/atomic.h:548:20: sparse: note: previously declared as:
   include/linux/atomic.h:548:20: sparse:    void static inline [toplevel] [unused] atomic_andnot( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/bitops_64.h, arch/sparc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/asm-generic/bitops/lock.h:22:30: sparse: sparse: undefined identifier 'nr'
   include/asm-generic/bitops/lock.h:28:15: sparse: sparse: undefined identifier 'atomic_long_fetch_or_acquire'
   include/asm-generic/bitops/lock.h:28:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at arch/sparc/include/asm/atomic_64.h:118)
>> include/asm-generic/bitops/lock.h:63:15: sparse: sparse: cannot dereference this type
>> include/asm-generic/bitops/lock.h:63:15: sparse: sparse: cannot dereference this type
>> include/asm-generic/bitops/lock.h:63:15: sparse: sparse: cannot dereference this type
   include/asm-generic/bitops/lock.h:63:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at include/asm-generic/bitops/lock.h:28)
   include/asm-generic/bitops/lock.h:82:30: sparse: sparse: undefined identifier 'nr'
   include/asm-generic/bitops/lock.h:82:23: sparse: sparse: symbol 'mask' has multiple initializers (originally initialized at include/asm-generic/bitops/lock.h:22)
   include/asm-generic/bitops/lock.h:85:55: sparse: sparse: undefined identifier 'atomic_long_t'
   include/asm-generic/bitops/lock.h:85:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at include/asm-generic/bitops/lock.h:63)
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:26:
   arch/sparc/vdso/vdso32/../vclock_gettime.c:203:1: warning: no previous prototype for '__vdso_clock_gettime' [-Wmissing-prototypes]
     203 | __vdso_clock_gettime(clockid_t clock, struct timespec *ts)
         | ^~~~~~~~~~~~~~~~~~~~
   arch/sparc/vdso/vdso32/../vclock_gettime.c:231:1: warning: no previous prototype for '__vdso_gettimeofday' [-Wmissing-prototypes]
     231 | __vdso_gettimeofday(struct timeval *tv, struct timezone *tz)
         | ^~~~~~~~~~~~~~~~~~~

vim +/if +25 include/asm-generic/bitops/lock.h

84c6591103dbea Will Deacon    2018-06-19   8  
26333576fd0d0b Nick Piggin    2007-10-18   9  /**
26333576fd0d0b Nick Piggin    2007-10-18  10   * test_and_set_bit_lock - Set a bit and return its old value, for lock
26333576fd0d0b Nick Piggin    2007-10-18  11   * @nr: Bit to set
26333576fd0d0b Nick Piggin    2007-10-18  12   * @addr: Address to count from
26333576fd0d0b Nick Piggin    2007-10-18  13   *
61e02392d3c7ec Will Deacon    2018-02-13  14   * This operation is atomic and provides acquire barrier semantics if
61e02392d3c7ec Will Deacon    2018-02-13  15   * the returned value is 0.
26333576fd0d0b Nick Piggin    2007-10-18  16   * It can be used to implement bit locks.
26333576fd0d0b Nick Piggin    2007-10-18  17   */
84c6591103dbea Will Deacon    2018-06-19  18  static inline int test_and_set_bit_lock(unsigned int nr,
84c6591103dbea Will Deacon    2018-06-19  19  					volatile unsigned long *p)
84c6591103dbea Will Deacon    2018-06-19  20  {
84c6591103dbea Will Deacon    2018-06-19  21  	long old;
84c6591103dbea Will Deacon    2018-06-19 @22  	unsigned long mask = BIT_MASK(nr);
84c6591103dbea Will Deacon    2018-06-19  23  
84c6591103dbea Will Deacon    2018-06-19 @24  	p += BIT_WORD(nr);
84c6591103dbea Will Deacon    2018-06-19 @25  	if (READ_ONCE(*p) & mask)
84c6591103dbea Will Deacon    2018-06-19  26  		return 1;
84c6591103dbea Will Deacon    2018-06-19  27  
84c6591103dbea Will Deacon    2018-06-19 @28  	old = atomic_long_fetch_or_acquire(mask, (atomic_long_t *)p);
84c6591103dbea Will Deacon    2018-06-19 @29  	return !!(old & mask);
84c6591103dbea Will Deacon    2018-06-19  30  }
84c6591103dbea Will Deacon    2018-06-19  31  
26333576fd0d0b Nick Piggin    2007-10-18  32  
26333576fd0d0b Nick Piggin    2007-10-18  33  /**
26333576fd0d0b Nick Piggin    2007-10-18  34   * clear_bit_unlock - Clear a bit in memory, for unlock
26333576fd0d0b Nick Piggin    2007-10-18  35   * @nr: the bit to set
26333576fd0d0b Nick Piggin    2007-10-18  36   * @addr: the address to start counting from
26333576fd0d0b Nick Piggin    2007-10-18  37   *
26333576fd0d0b Nick Piggin    2007-10-18  38   * This operation is atomic and provides release barrier semantics.
26333576fd0d0b Nick Piggin    2007-10-18  39   */
84c6591103dbea Will Deacon    2018-06-19  40  static inline void clear_bit_unlock(unsigned int nr, volatile unsigned long *p)
84c6591103dbea Will Deacon    2018-06-19  41  {
84c6591103dbea Will Deacon    2018-06-19  42  	p += BIT_WORD(nr);
84c6591103dbea Will Deacon    2018-06-19  43  	atomic_long_fetch_andnot_release(BIT_MASK(nr), (atomic_long_t *)p);
84c6591103dbea Will Deacon    2018-06-19  44  }
26333576fd0d0b Nick Piggin    2007-10-18  45  
26333576fd0d0b Nick Piggin    2007-10-18  46  /**
26333576fd0d0b Nick Piggin    2007-10-18  47   * __clear_bit_unlock - Clear a bit in memory, for unlock
26333576fd0d0b Nick Piggin    2007-10-18  48   * @nr: the bit to set
26333576fd0d0b Nick Piggin    2007-10-18  49   * @addr: the address to start counting from
26333576fd0d0b Nick Piggin    2007-10-18  50   *
f75d48644c56a3 Peter Zijlstra 2016-03-09  51   * A weaker form of clear_bit_unlock() as used by __bit_lock_unlock(). If all
f75d48644c56a3 Peter Zijlstra 2016-03-09  52   * the bits in the word are protected by this lock some archs can use weaker
f75d48644c56a3 Peter Zijlstra 2016-03-09  53   * ops to safely unlock.
f75d48644c56a3 Peter Zijlstra 2016-03-09  54   *
f75d48644c56a3 Peter Zijlstra 2016-03-09  55   * See for example x86's implementation.
26333576fd0d0b Nick Piggin    2007-10-18  56   */
84c6591103dbea Will Deacon    2018-06-19  57  static inline void __clear_bit_unlock(unsigned int nr,
84c6591103dbea Will Deacon    2018-06-19  58  				      volatile unsigned long *p)
84c6591103dbea Will Deacon    2018-06-19  59  {
84c6591103dbea Will Deacon    2018-06-19  60  	unsigned long old;
26333576fd0d0b Nick Piggin    2007-10-18  61  
84c6591103dbea Will Deacon    2018-06-19  62  	p += BIT_WORD(nr);
84c6591103dbea Will Deacon    2018-06-19 @63  	old = READ_ONCE(*p);
84c6591103dbea Will Deacon    2018-06-19  64  	old &= ~BIT_MASK(nr);
84c6591103dbea Will Deacon    2018-06-19  65  	atomic_long_set_release((atomic_long_t *)p, old);
84c6591103dbea Will Deacon    2018-06-19  66  }
84c6591103dbea Will Deacon    2018-06-19  67  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
