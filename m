Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A972E55C30
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 18:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iB7xIsDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701369938; x=1732905938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rcmJefrIfSD5stP0ufm22Ktx7L22RMvyr/S3FQkzhPY=;
  b=iB7xIsDlJ2QTJg8ChdvWGLcIthh7KvS3N6cWGSgexmrvvTgdrmko8rbs
   VMZlCHVx3iCW2lFP7HtOzFel6/jF7882HUjLVRpuLw62m9BfO4FGuLnhW
   Vp7m0DAgn7y/6Sr/zqLclinJkhoZLrE3ncO1XjPcGtuRskb16KcHoBOIi
   3ux9lX9ibimt1mnJpWGYbcg0zaQ9Awvc5jFWZ97To5mlh/QK3BbtBQFAI
   KRNvufgSXvyss5U8o9IU0D3c/4vcczZ+p3CsUIHb6l7idgIZ4F9WmvZVu
   GA2nbGTDact9sG0PA1noTME+TSwNfazj/EIbIX79xu3NyS+RDyqbYgfj0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="259413"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="259413"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 10:45:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="10876789"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Nov 2023 10:45:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8m2T-0002Z6-2t;
	Thu, 30 Nov 2023 18:45:29 +0000
Date: Fri, 1 Dec 2023 02:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/atomic/atomic-instrumented.h:37:9: sparse:    int
 static [signed] [toplevel] raw_atomic_set( ... )
Message-ID: <202312010201.IXHJLOqV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/atomic/atomic-instrumented.h:37:9: sparse:    int static [signed] [toplevel] raw_atomic_set( ... )"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Kees Cook <keescook@chromium.org>

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 1d78814d41701c216e28fcf2656526146dec4a1a locking/atomic: scripts: simplify raw_atomic*() definitions
date:   6 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 6 months ago
config: sparc64-randconfig-r112-20231130 (https://download.01.org/0day-ci/archive/20231201/202312010201.IXHJLOqV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010201.IXHJLOqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312010201.IXHJLOqV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2454:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2454:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2454:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2454:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2454:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2470:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2470:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2470:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2470:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2470:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2470:16: sparse: sparse: symbol '__ret' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2454)
   include/linux/atomic/atomic-arch-fallback.h:2485:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2485:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2485:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2485:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2485:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2485:16: sparse: sparse: symbol '__ret' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2470)
   include/linux/atomic/atomic-arch-fallback.h:2497:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2497:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2497:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2497:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2497:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2497:16: sparse: sparse: symbol '__ret' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2485)
   include/linux/atomic/atomic-arch-fallback.h:2513:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2513:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2529:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2529:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2529:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2513)
   include/linux/atomic/atomic-arch-fallback.h:2544:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2544:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2544:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2529)
   include/linux/atomic/atomic-arch-fallback.h:2556:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2556:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2556:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2544)
   include/linux/atomic/atomic-arch-fallback.h:2573:13: sparse: sparse: undefined identifier 'raw_atomic64_cmpxchg'
   include/linux/atomic/atomic-arch-fallback.h:2593:13: sparse: sparse: undefined identifier 'raw_atomic64_cmpxchg_acquire'
   include/linux/atomic/atomic-arch-fallback.h:2593:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2573)
   include/linux/atomic/atomic-arch-fallback.h:2612:13: sparse: sparse: undefined identifier 'raw_atomic64_cmpxchg_release'
   include/linux/atomic/atomic-arch-fallback.h:2612:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2593)
   include/linux/atomic/atomic-arch-fallback.h:2628:13: sparse: sparse: undefined identifier 'raw_atomic64_cmpxchg_relaxed'
   include/linux/atomic/atomic-arch-fallback.h:2628:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2612)
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:27:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:27:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:41:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:41:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:55:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:55:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:69:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:69:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:83:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:83:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:97:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:97:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:113:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:113:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:130:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:130:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:37:9: sparse: sparse: symbol 'raw_atomic_set' redeclared with different type (incompatible argument 1 (different base types)):
>> include/linux/atomic/atomic-instrumented.h:37:9: sparse:    int static [signed] [toplevel] raw_atomic_set( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:459:1: sparse: note: previously declared as:
>> include/linux/atomic/atomic-arch-fallback.h:459:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_set( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:45:9: sparse: sparse: symbol 'raw_atomic_set_release' redeclared with different type (incompatible argument 1 (different base types)):
>> include/linux/atomic/atomic-instrumented.h:45:9: sparse:    int static [signed] [toplevel] raw_atomic_set_release( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:465:1: sparse: note: previously declared as:
>> include/linux/atomic/atomic-arch-fallback.h:465:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_set_release( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:52:9: sparse: sparse: symbol 'raw_atomic_add' redeclared with different type (incompatible argument 1 (different base types)):
>> include/linux/atomic/atomic-instrumented.h:52:9: sparse:    int static [signed] [toplevel] raw_atomic_add( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:482:1: sparse: note: previously declared as:
>> include/linux/atomic/atomic-arch-fallback.h:482:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_add( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:119:9: sparse: sparse: symbol 'raw_atomic_sub' redeclared with different type (incompatible argument 1 (different base types)):
>> include/linux/atomic/atomic-instrumented.h:119:9: sparse:    int static [signed] [toplevel] raw_atomic_sub( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:606:1: sparse: note: previously declared as:
>> include/linux/atomic/atomic-arch-fallback.h:606:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_sub( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:186:9: sparse: sparse: symbol 'raw_atomic_inc' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/atomic/atomic-instrumented.h:186:9: sparse:    int static [signed] [toplevel] raw_atomic_inc( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:730:1: sparse: note: previously declared as:
   include/linux/atomic/atomic-arch-fallback.h:730:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_inc( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:253:9: sparse: sparse: symbol 'raw_atomic_dec' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/atomic/atomic-instrumented.h:253:9: sparse:    int static [signed] [toplevel] raw_atomic_dec( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:858:1: sparse: note: previously declared as:
   include/linux/atomic/atomic-arch-fallback.h:858:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_dec( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:320:9: sparse: sparse: symbol 'raw_atomic_and' redeclared with different type (incompatible argument 1 (different base types)):
>> include/linux/atomic/atomic-instrumented.h:320:9: sparse:    int static [signed] [toplevel] raw_atomic_and( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:986:1: sparse: note: previously declared as:
>> include/linux/atomic/atomic-arch-fallback.h:986:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_and( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:357:9: sparse: sparse: symbol 'raw_atomic_andnot' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/atomic/atomic-instrumented.h:357:9: sparse:    int static [signed] [toplevel] raw_atomic_andnot( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:1051:1: sparse: note: previously declared as:
   include/linux/atomic/atomic-arch-fallback.h:1051:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_andnot( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:394:9: sparse: sparse: symbol 'raw_atomic_or' redeclared with different type (incompatible argument 1 (different base types)):
>> include/linux/atomic/atomic-instrumented.h:394:9: sparse:    int static [signed] [toplevel] raw_atomic_or( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:1120:1: sparse: note: previously declared as:
>> include/linux/atomic/atomic-arch-fallback.h:1120:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_or( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:431:9: sparse: sparse: symbol 'raw_atomic_xor' redeclared with different type (incompatible argument 1 (different base types)):
>> include/linux/atomic/atomic-instrumented.h:431:9: sparse:    int static [signed] [toplevel] raw_atomic_xor( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:1185:1: sparse: note: previously declared as:
>> include/linux/atomic/atomic-arch-fallback.h:1185:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_xor( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/bitops_64.h, arch/sparc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/asm-generic/bitops/lock.h:22:30: sparse: sparse: undefined identifier 'nr'
   include/asm-generic/bitops/lock.h:28:15: sparse: sparse: undefined identifier 'raw_atomic_long_fetch_or_acquire'
   include/asm-generic/bitops/lock.h:64:15: sparse: sparse: cannot dereference this type
   include/asm-generic/bitops/lock.h:64:15: sparse: sparse: cannot dereference this type
   include/asm-generic/bitops/lock.h:64:15: sparse: sparse: cast from unknown type
   include/asm-generic/bitops/lock.h:64:15: sparse: sparse: cannot dereference this type
   include/asm-generic/bitops/lock.h:64:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at include/asm-generic/bitops/lock.h:28)
   include/asm-generic/bitops/lock.h:83:30: sparse: sparse: undefined identifier 'nr'
   include/asm-generic/bitops/lock.h:83:23: sparse: sparse: symbol 'mask' has multiple initializers (originally initialized at include/asm-generic/bitops/lock.h:22)
   include/asm-generic/bitops/lock.h:86:59: sparse: sparse: undefined identifier 'atomic_long_t'
   include/asm-generic/bitops/lock.h:86:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at include/asm-generic/bitops/lock.h:64)

vim +37 include/linux/atomic/atomic-instrumented.h

aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   32  
c020395b6634b7 include/asm-generic/atomic-instrumented.h  Marco Elver  2019-11-26   33  static __always_inline void
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   34  atomic_set(atomic_t *v, int i)
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   35  {
ed8af2e4d2a71b include/asm-generic/atomic-instrumented.h  Marco Elver  2020-01-21   36  	instrument_atomic_write(v, sizeof(*v));
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-06-05  @37  	raw_atomic_set(v, i);
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   38  }
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   39  
c020395b6634b7 include/asm-generic/atomic-instrumented.h  Marco Elver  2019-11-26   40  static __always_inline void
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   41  atomic_set_release(atomic_t *v, int i)
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   42  {
e87c4f6642f496 include/linux/atomic/atomic-instrumented.h Marco Elver  2021-11-30   43  	kcsan_release();
ed8af2e4d2a71b include/asm-generic/atomic-instrumented.h  Marco Elver  2020-01-21   44  	instrument_atomic_write(v, sizeof(*v));
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-06-05  @45  	raw_atomic_set_release(v, i);
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   46  }
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   47  
c020395b6634b7 include/asm-generic/atomic-instrumented.h  Marco Elver  2019-11-26   48  static __always_inline void
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   49  atomic_add(int i, atomic_t *v)
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   50  {
3570a1bcf45e9a include/asm-generic/atomic-instrumented.h  Marco Elver  2020-07-24   51  	instrument_atomic_read_write(v, sizeof(*v));
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-06-05  @52  	raw_atomic_add(i, v);
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   53  }
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   54  
c020395b6634b7 include/asm-generic/atomic-instrumented.h  Marco Elver  2019-11-26   55  static __always_inline int
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   56  atomic_add_return(int i, atomic_t *v)
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   57  {
e87c4f6642f496 include/linux/atomic/atomic-instrumented.h Marco Elver  2021-11-30   58  	kcsan_mb();
3570a1bcf45e9a include/asm-generic/atomic-instrumented.h  Marco Elver  2020-07-24   59  	instrument_atomic_read_write(v, sizeof(*v));
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-06-05   60  	return raw_atomic_add_return(i, v);
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   61  }
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   62  
c020395b6634b7 include/asm-generic/atomic-instrumented.h  Marco Elver  2019-11-26   63  static __always_inline int
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   64  atomic_add_return_acquire(int i, atomic_t *v)
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   65  {
3570a1bcf45e9a include/asm-generic/atomic-instrumented.h  Marco Elver  2020-07-24   66  	instrument_atomic_read_write(v, sizeof(*v));
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-06-05   67  	return raw_atomic_add_return_acquire(i, v);
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   68  }
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   69  
c020395b6634b7 include/asm-generic/atomic-instrumented.h  Marco Elver  2019-11-26   70  static __always_inline int
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   71  atomic_add_return_release(int i, atomic_t *v)
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   72  {
e87c4f6642f496 include/linux/atomic/atomic-instrumented.h Marco Elver  2021-11-30   73  	kcsan_release();
3570a1bcf45e9a include/asm-generic/atomic-instrumented.h  Marco Elver  2020-07-24   74  	instrument_atomic_read_write(v, sizeof(*v));
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-06-05   75  	return raw_atomic_add_return_release(i, v);
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   76  }
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   77  
c020395b6634b7 include/asm-generic/atomic-instrumented.h  Marco Elver  2019-11-26   78  static __always_inline int
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   79  atomic_add_return_relaxed(int i, atomic_t *v)
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   80  {
3570a1bcf45e9a include/asm-generic/atomic-instrumented.h  Marco Elver  2020-07-24   81  	instrument_atomic_read_write(v, sizeof(*v));
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-06-05   82  	return raw_atomic_add_return_relaxed(i, v);
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   83  }
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   84  
c020395b6634b7 include/asm-generic/atomic-instrumented.h  Marco Elver  2019-11-26   85  static __always_inline int
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   86  atomic_fetch_add(int i, atomic_t *v)
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   87  {
e87c4f6642f496 include/linux/atomic/atomic-instrumented.h Marco Elver  2021-11-30   88  	kcsan_mb();
3570a1bcf45e9a include/asm-generic/atomic-instrumented.h  Marco Elver  2020-07-24   89  	instrument_atomic_read_write(v, sizeof(*v));
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-06-05   90  	return raw_atomic_fetch_add(i, v);
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   91  }
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   92  
c020395b6634b7 include/asm-generic/atomic-instrumented.h  Marco Elver  2019-11-26   93  static __always_inline int
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   94  atomic_fetch_add_acquire(int i, atomic_t *v)
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   95  {
3570a1bcf45e9a include/asm-generic/atomic-instrumented.h  Marco Elver  2020-07-24   96  	instrument_atomic_read_write(v, sizeof(*v));
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-06-05   97  	return raw_atomic_fetch_add_acquire(i, v);
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   98  }
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04   99  
c020395b6634b7 include/asm-generic/atomic-instrumented.h  Marco Elver  2019-11-26  100  static __always_inline int
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  101  atomic_fetch_add_release(int i, atomic_t *v)
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  102  {
e87c4f6642f496 include/linux/atomic/atomic-instrumented.h Marco Elver  2021-11-30  103  	kcsan_release();
3570a1bcf45e9a include/asm-generic/atomic-instrumented.h  Marco Elver  2020-07-24  104  	instrument_atomic_read_write(v, sizeof(*v));
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-06-05  105  	return raw_atomic_fetch_add_release(i, v);
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  106  }
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  107  
c020395b6634b7 include/asm-generic/atomic-instrumented.h  Marco Elver  2019-11-26  108  static __always_inline int
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  109  atomic_fetch_add_relaxed(int i, atomic_t *v)
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  110  {
3570a1bcf45e9a include/asm-generic/atomic-instrumented.h  Marco Elver  2020-07-24  111  	instrument_atomic_read_write(v, sizeof(*v));
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-06-05  112  	return raw_atomic_fetch_add_relaxed(i, v);
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  113  }
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  114  
c020395b6634b7 include/asm-generic/atomic-instrumented.h  Marco Elver  2019-11-26  115  static __always_inline void
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  116  atomic_sub(int i, atomic_t *v)
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  117  {
3570a1bcf45e9a include/asm-generic/atomic-instrumented.h  Marco Elver  2020-07-24  118  	instrument_atomic_read_write(v, sizeof(*v));
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-06-05 @119  	raw_atomic_sub(i, v);
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  120  }
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  121  

:::::: The code at line 37 was first introduced by commit
:::::: c9268ac615f9f6dded7801df5993374598934377 locking/atomic: scripts: add trivial raw_atomic*_<op>()

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
