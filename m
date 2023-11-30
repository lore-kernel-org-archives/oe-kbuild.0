Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCBF524BB
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 15:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMTeSbEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701358350; x=1732894350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nq9dXwVVLSid0LyzmvU24sqP2xemchuweL08SMreuQM=;
  b=eMTeSbECdCShU5xaqFEFcOfJzbQjX1b+UshjTMZYN1W2iEHMmgIuyXQN
   jTqYYJQ5hbMljcrNEhgWpSseGE2sV1p+K1ZgHU2aYbj5wUGQsVl6oHOZz
   iPOHxspyrh9+Wm1c0+HzEi5G592LyvQeimTeFGE5lOyf3XW7VMXPY5NAo
   0KcoyfTfq05L6TXoMjQC8pLUxRF55gDq3TZ+XNzLJjsFPNOGOWbKmIQvn
   /m0o48YHaMr/SnNhBz+vT3DBuh8fSXjwnApR0Qe7F8k2Na1AXxRXf9pvC
   mfU7JPLhmQyrwMiSwTIwWwQC+YOcrcOKbJ7nDyQpilmBuld0KXrsq8EuQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="383736044"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="383736044"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 07:32:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="17439502"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Nov 2023 07:32:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8j1d-0002Dh-0u;
	Thu, 30 Nov 2023 15:32:25 +0000
Date: Thu, 30 Nov 2023 23:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/atomic/atomic-arch-fallback.h:701:1: sparse:    void
 static inline [gnu_inline] [toplevel] raw_atomic_inc( ... )
Message-ID: <202311302317.lDhxAZj0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/atomic/atomic-arch-fallback.h:701:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_inc( ... )"
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
commit: 9257959a6e5b4fca6fc8e985790bff62c2046f20 locking/atomic: scripts: restructure fallback ifdeffery
date:   6 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 6 months ago
config: sparc64-randconfig-r112-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302317.lDhxAZj0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311302317.lDhxAZj0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311302317.lDhxAZj0-lkp@intel.com/

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
   include/linux/atomic/atomic-arch-fallback.h:2514:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2514:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2514:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2514:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2514:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2534:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2534:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2534:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2534:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2534:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2534:16: sparse: sparse: symbol '__ret' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2514)
   include/linux/atomic/atomic-arch-fallback.h:2553:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2553:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2553:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2553:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2553:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2553:16: sparse: sparse: symbol '__ret' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2534)
   include/linux/atomic/atomic-arch-fallback.h:2565:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2565:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2565:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2565:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2565:16: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2565:16: sparse: sparse: symbol '__ret' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2553)
   include/linux/atomic/atomic-arch-fallback.h:2585:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2585:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2605:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2605:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2605:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2585)
   include/linux/atomic/atomic-arch-fallback.h:2624:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2624:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2624:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2605)
   include/linux/atomic/atomic-arch-fallback.h:2636:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2636:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2636:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2624)
   include/linux/atomic/atomic-arch-fallback.h:2657:13: sparse: sparse: undefined identifier 'raw_atomic64_cmpxchg'
   include/linux/atomic/atomic-arch-fallback.h:2681:13: sparse: sparse: undefined identifier 'raw_atomic64_cmpxchg_acquire'
   include/linux/atomic/atomic-arch-fallback.h:2681:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2657)
   include/linux/atomic/atomic-arch-fallback.h:2704:13: sparse: sparse: undefined identifier 'raw_atomic64_cmpxchg_release'
   include/linux/atomic/atomic-arch-fallback.h:2704:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2681)
   include/linux/atomic/atomic-arch-fallback.h:2720:13: sparse: sparse: undefined identifier 'raw_atomic64_cmpxchg_relaxed'
   include/linux/atomic/atomic-arch-fallback.h:2720:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2704)
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
   include/linux/atomic/atomic-instrumented.h:186:9: sparse: sparse: symbol 'raw_atomic_inc' redeclared with different type (incompatible argument 1 (different base types)):
>> include/linux/atomic/atomic-instrumented.h:186:9: sparse:    int static [signed] [toplevel] raw_atomic_inc( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:701:1: sparse: note: previously declared as:
>> include/linux/atomic/atomic-arch-fallback.h:701:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_inc( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:253:9: sparse: sparse: symbol 'raw_atomic_dec' redeclared with different type (incompatible argument 1 (different base types)):
>> include/linux/atomic/atomic-instrumented.h:253:9: sparse:    int static [signed] [toplevel] raw_atomic_dec( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:853:1: sparse: note: previously declared as:
>> include/linux/atomic/atomic-arch-fallback.h:853:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_dec( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:357:9: sparse: sparse: symbol 'raw_atomic_andnot' redeclared with different type (incompatible argument 1 (different base types)):
>> include/linux/atomic/atomic-instrumented.h:357:9: sparse:    int static [signed] [toplevel] raw_atomic_andnot( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:1062:1: sparse: note: previously declared as:
>> include/linux/atomic/atomic-arch-fallback.h:1062:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic_andnot( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:827:9: sparse: sparse: symbol 'raw_atomic64_inc' redeclared with different type (different base types):
   include/linux/atomic/atomic-instrumented.h:827:9: sparse:    int static [signed] [toplevel] raw_atomic64_inc( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:1946:1: sparse: note: previously declared as:
   include/linux/atomic/atomic-arch-fallback.h:1946:1: sparse:    void static inline [gnu_inline] [toplevel] raw_atomic64_inc( ... )
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

vim +701 include/linux/atomic/atomic-arch-fallback.h

37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  696  
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  697  #if defined(arch_atomic_inc)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  698  #define raw_atomic_inc arch_atomic_inc
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  699  #else
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  700  static __always_inline void
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05 @701  raw_atomic_inc(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  702  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  703  	raw_atomic_add(1, v);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  704  }
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  705  #endif
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  706  
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  707  #if defined(arch_atomic_inc_return)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  708  #define raw_atomic_inc_return arch_atomic_inc_return
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  709  #elif defined(arch_atomic_inc_return_relaxed)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  710  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  711  raw_atomic_inc_return(atomic_t *v)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  712  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  713  	int ret;
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  714  	__atomic_pre_full_fence();
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  715  	ret = arch_atomic_inc_return_relaxed(v);
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  716  	__atomic_post_full_fence();
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  717  	return ret;
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  718  }
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  719  #else
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  720  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  721  raw_atomic_inc_return(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  722  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  723  	return raw_atomic_add_return(1, v);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  724  }
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  725  #endif
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  726  
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  727  #if defined(arch_atomic_inc_return_acquire)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  728  #define raw_atomic_inc_return_acquire arch_atomic_inc_return_acquire
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  729  #elif defined(arch_atomic_inc_return_relaxed)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  730  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  731  raw_atomic_inc_return_acquire(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  732  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  733  	int ret = arch_atomic_inc_return_relaxed(v);
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  734  	__atomic_acquire_fence();
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  735  	return ret;
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  736  }
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  737  #elif defined(arch_atomic_inc_return)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  738  #define raw_atomic_inc_return_acquire arch_atomic_inc_return
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  739  #else
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  740  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  741  raw_atomic_inc_return_acquire(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  742  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  743  	return raw_atomic_add_return_acquire(1, v);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  744  }
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  745  #endif
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  746  
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  747  #if defined(arch_atomic_inc_return_release)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  748  #define raw_atomic_inc_return_release arch_atomic_inc_return_release
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  749  #elif defined(arch_atomic_inc_return_relaxed)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  750  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  751  raw_atomic_inc_return_release(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  752  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  753  	__atomic_release_fence();
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  754  	return arch_atomic_inc_return_relaxed(v);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  755  }
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  756  #elif defined(arch_atomic_inc_return)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  757  #define raw_atomic_inc_return_release arch_atomic_inc_return
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  758  #else
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  759  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  760  raw_atomic_inc_return_release(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  761  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  762  	return raw_atomic_add_return_release(1, v);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  763  }
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  764  #endif
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  765  
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  766  #if defined(arch_atomic_inc_return_relaxed)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  767  #define raw_atomic_inc_return_relaxed arch_atomic_inc_return_relaxed
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  768  #elif defined(arch_atomic_inc_return)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  769  #define raw_atomic_inc_return_relaxed arch_atomic_inc_return
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  770  #else
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  771  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  772  raw_atomic_inc_return_relaxed(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  773  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  774  	return raw_atomic_add_return_relaxed(1, v);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  775  }
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  776  #endif
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  777  
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  778  #if defined(arch_atomic_fetch_inc)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  779  #define raw_atomic_fetch_inc arch_atomic_fetch_inc
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  780  #elif defined(arch_atomic_fetch_inc_relaxed)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  781  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  782  raw_atomic_fetch_inc(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  783  {
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  784  	int ret;
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  785  	__atomic_pre_full_fence();
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  786  	ret = arch_atomic_fetch_inc_relaxed(v);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  787  	__atomic_post_full_fence();
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  788  	return ret;
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  789  }
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  790  #else
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  791  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  792  raw_atomic_fetch_inc(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  793  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  794  	return raw_atomic_fetch_add(1, v);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  795  }
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  796  #endif
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  797  
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  798  #if defined(arch_atomic_fetch_inc_acquire)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  799  #define raw_atomic_fetch_inc_acquire arch_atomic_fetch_inc_acquire
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  800  #elif defined(arch_atomic_fetch_inc_relaxed)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  801  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  802  raw_atomic_fetch_inc_acquire(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  803  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  804  	int ret = arch_atomic_fetch_inc_relaxed(v);
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  805  	__atomic_acquire_fence();
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  806  	return ret;
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  807  }
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  808  #elif defined(arch_atomic_fetch_inc)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  809  #define raw_atomic_fetch_inc_acquire arch_atomic_fetch_inc
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  810  #else
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  811  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  812  raw_atomic_fetch_inc_acquire(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  813  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  814  	return raw_atomic_fetch_add_acquire(1, v);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  815  }
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  816  #endif
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  817  
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  818  #if defined(arch_atomic_fetch_inc_release)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  819  #define raw_atomic_fetch_inc_release arch_atomic_fetch_inc_release
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  820  #elif defined(arch_atomic_fetch_inc_relaxed)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  821  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  822  raw_atomic_fetch_inc_release(atomic_t *v)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  823  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  824  	__atomic_release_fence();
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  825  	return arch_atomic_fetch_inc_relaxed(v);
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  826  }
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  827  #elif defined(arch_atomic_fetch_inc)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  828  #define raw_atomic_fetch_inc_release arch_atomic_fetch_inc
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  829  #else
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  830  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  831  raw_atomic_fetch_inc_release(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  832  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  833  	return raw_atomic_fetch_add_release(1, v);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  834  }
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  835  #endif
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  836  
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  837  #if defined(arch_atomic_fetch_inc_relaxed)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  838  #define raw_atomic_fetch_inc_relaxed arch_atomic_fetch_inc_relaxed
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  839  #elif defined(arch_atomic_fetch_inc)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  840  #define raw_atomic_fetch_inc_relaxed arch_atomic_fetch_inc
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  841  #else
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  842  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  843  raw_atomic_fetch_inc_relaxed(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  844  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  845  	return raw_atomic_fetch_add_relaxed(1, v);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  846  }
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  847  #endif
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  848  
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  849  #if defined(arch_atomic_dec)
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  850  #define raw_atomic_dec arch_atomic_dec
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  851  #else
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  852  static __always_inline void
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05 @853  raw_atomic_dec(atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  854  {
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  855  	raw_atomic_sub(1, v);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  856  }
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  857  #endif
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  858  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
