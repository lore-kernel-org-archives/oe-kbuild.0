Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C1317FD
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0DQf38w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585172; x=1733121172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F1VNaZlpzOD9GG85xzXnLSIIxlnyCyHCAxUnbtOXH1k=;
  b=N0DQf38wBaNIuIjQqjZQl4ynV3iuOhCmaPh81SvFun3vHt9DK9m+lhEy
   7/GySycKC8w3iIWcHJ7AvJh/cz0pTr1pC0I5Dm02qBMxuQUT9o7Fp/JhO
   AhvZCCho6ZlpbI3WowyOC3vk/mjefldJqh+J4r5H/FDr0Kw/Ji2INtBLH
   WgXZOf4aW2YOUsanBe99WJA5BWIVZ4kujANel5x+VRSnPzulhNpRTp5gb
   H+HAGLf20aMvHIE5ovcF+L2pJcpCaEhdD/LPhoAXx4ttG+G/UMd3M9jmM
   ieBBsBc4gj7JXX0RiPdgHAXuFNqimuTmnGZsRXhPI/atxLEpdHL/tTpQe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180405"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180405"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="914081660"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="914081660"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2023 22:32:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006L6-0L;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/asm-generic/qspinlock_types.h:44:3: sparse:    struct
 qspinlock [usertype] arch_spinlock_t
Message-ID: <202312031221.HiQppYrr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/asm-generic/qspinlock_types.h:44:3: sparse:    struct qspinlock [usertype] arch_spinlock_t"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: 2c230431e1e809270178905974f57cf3878939f5 sparc: Fix the generic IO helpers
date:   1 year, 3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 3 months ago
config: sparc64-randconfig-r111-20231130 (https://download.01.org/0day-ci/archive/20231203/202312031221.HiQppYrr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031221.HiQppYrr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312031221.HiQppYrr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/atomic/atomic-instrumented.h:1870:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:1870:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:1870:16: sparse: sparse: got arch_atomic_long_dec_unless_positive
   include/linux/atomic/atomic-instrumented.h:1871:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:1871:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:1877:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:1877:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:1878:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:1878:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:1878:16: sparse: sparse: got arch_atomic_long_dec_if_positive
   include/linux/atomic/atomic-instrumented.h:1879:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:1879:1: sparse: sparse: got }
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/bitops_64.h, arch/sparc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/asm-generic/bitops/lock.h:24:11: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:24:11: sparse: sparse: got +=
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got (
   include/asm-generic/bitops/lock.h:25:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got !
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got }
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ) in nested declarator
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got volatile
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got }
   include/asm-generic/bitops/lock.h:28:71: sparse: sparse: No right hand side of '*'-expression
   include/asm-generic/bitops/lock.h:28:72: sparse: sparse: Expected ) in function call
   include/asm-generic/bitops/lock.h:28:72: sparse: sparse: got p
   include/asm-generic/bitops/lock.h:29:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/lock.h:29:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:29:16: sparse: sparse: got !
   include/asm-generic/bitops/lock.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/lock.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/lock.h:44:47: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/lock.h:44:47: sparse: sparse: got (
   include/asm-generic/bitops/lock.h:45:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/lock.h:45:1: sparse: sparse: got }
   include/asm-generic/bitops/lock.h:63:11: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:63:11: sparse: sparse: got +=
   include/asm-generic/bitops/lock.h:65:13: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:65:13: sparse: sparse: got &=
   include/asm-generic/bitops/lock.h:66:38: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/lock.h:66:38: sparse: sparse: got (
   include/asm-generic/bitops/lock.h:67:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/lock.h:67:1: sparse: sparse: got }
   include/asm-generic/bitops/lock.h:85:11: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:85:11: sparse: sparse: got +=
   include/asm-generic/bitops/lock.h:86:75: sparse: sparse: No right hand side of '*'-expression
   include/asm-generic/bitops/lock.h:86:76: sparse: sparse: Expected ) in function call
   include/asm-generic/bitops/lock.h:86:76: sparse: sparse: got p
   include/asm-generic/bitops/lock.h:87:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/lock.h:87:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:87:16: sparse: sparse: got !
   include/asm-generic/bitops/lock.h:88:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/lock.h:88:1: sparse: sparse: got }
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, arch/sparc/include/asm/bitops.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:58:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: got arch_test_and_set_bit_lock
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:77:38: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:77:38: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:78:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:78:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:78:16: sparse: sparse: got arch_clear_bit_unlock_is_negative_byte
   include/asm-generic/bitops/instrumented-lock.h:79:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:79:1: sparse: sparse: got }
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/bitops_64.h, arch/sparc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/qspinlock.h, arch/sparc/include/asm/spinlock_64.h, arch/sparc/include/asm/spinlock.h, ...):
   include/asm-generic/qspinlock_types.h:44:3: sparse: sparse: symbol 'arch_spinlock_t' redeclared with different type (different base types):
>> include/asm-generic/qspinlock_types.h:44:3: sparse:    struct qspinlock [usertype] arch_spinlock_t
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/spinlock_types_raw.h, include/linux/ratelimit_types.h, include/linux/printk.h, ...):
   arch/sparc/include/asm/spinlock_types.h:11:3: sparse: note: previously declared as:
>> arch/sparc/include/asm/spinlock_types.h:11:3: sparse:    struct arch_spinlock_t [usertype] arch_spinlock_t
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/qrwlock.h, arch/sparc/include/asm/spinlock_64.h, arch/sparc/include/asm/spinlock.h, ...):
   include/asm-generic/qrwlock_types.h:27:3: sparse: sparse: symbol 'arch_rwlock_t' redeclared with different type (different base types):
>> include/asm-generic/qrwlock_types.h:27:3: sparse:    struct qrwlock [usertype] arch_rwlock_t
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/spinlock_types_raw.h, include/linux/ratelimit_types.h, include/linux/printk.h, ...):
   arch/sparc/include/asm/spinlock_types.h:21:3: sparse: note: previously declared as:
>> arch/sparc/include/asm/spinlock_types.h:21:3: sparse:    struct arch_rwlock_t [usertype] arch_rwlock_t
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2195:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2195:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2195:13: sparse: sparse: undefined identifier 'o'
   include/linux/atomic/atomic-arch-fallback.h:2195:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2195:13: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2195:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2195:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2195:13: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2208:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2208:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2208:13: sparse: sparse: undefined identifier 'o'
   include/linux/atomic/atomic-arch-fallback.h:2208:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2208:13: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2208:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2208:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2208:13: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2208:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2195)
   include/linux/atomic/atomic-arch-fallback.h:2221:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2221:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2221:13: sparse: sparse: undefined identifier 'o'
   include/linux/atomic/atomic-arch-fallback.h:2221:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2221:13: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2221:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2221:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2221:13: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2221:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2208)
   include/linux/atomic/atomic-arch-fallback.h:2234:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2234:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2234:13: sparse: sparse: undefined identifier 'o'
   include/linux/atomic/atomic-arch-fallback.h:2234:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2234:13: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-arch-fallback.h:2234:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2234:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2234:13: sparse: sparse: cast from unknown type
   include/linux/atomic/atomic-arch-fallback.h:2234:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2221)
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-long.h:907:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-long.h:907:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-long.h:913:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-long.h:913:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-long.h:913:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/linux/atomic/atomic-long.h:907)
   include/linux/atomic/atomic-long.h:919:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-long.h:919:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-long.h:919:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/linux/atomic/atomic-long.h:913)
   include/linux/atomic/atomic-long.h:925:16: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-long.h:925:16: sparse: sparse: undefined identifier 'new'
   include/linux/atomic/atomic-long.h:925:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/linux/atomic/atomic-long.h:919)
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:27:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:27:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:42:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:42:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:57:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:57:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:72:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:72:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:87:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:87:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:102:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:102:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:119:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:119:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic/atomic-instrumented.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   include/linux/instrumented.h:136:9: sparse: sparse: symbol 'kcsan_check_access' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/instrumented.h:136:9: sparse:    int static [signed] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/asm-generic/rwonce.h, arch/sparc/include/generated/asm/rwonce.h, include/linux/compiler.h, ...):
   include/linux/kcsan-checks.h:229:20: sparse: note: previously declared as:
   include/linux/kcsan-checks.h:229:20: sparse:    void static inline [gnu_inline] [toplevel] kcsan_check_access( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-instrumented.h:50:9: sparse: sparse: symbol 'arch_atomic_set_release' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/atomic/atomic-instrumented.h:50:9: sparse:    int static [signed] [toplevel] arch_atomic_set_release( ... )
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):

vim +44 include/asm-generic/qspinlock_types.h

a33fda35e3a765 Waiman Long 2015-04-24  13  
a33fda35e3a765 Waiman Long 2015-04-24  14  typedef struct qspinlock {
625e88be1f41b5 Will Deacon 2018-04-26  15  	union {
a33fda35e3a765 Waiman Long 2015-04-24  16  		atomic_t val;
625e88be1f41b5 Will Deacon 2018-04-26  17  
625e88be1f41b5 Will Deacon 2018-04-26  18  		/*
625e88be1f41b5 Will Deacon 2018-04-26  19  		 * By using the whole 2nd least significant byte for the
625e88be1f41b5 Will Deacon 2018-04-26  20  		 * pending bit, we can allow better optimization of the lock
625e88be1f41b5 Will Deacon 2018-04-26  21  		 * acquisition for the pending bit holder.
625e88be1f41b5 Will Deacon 2018-04-26  22  		 */
625e88be1f41b5 Will Deacon 2018-04-26  23  #ifdef __LITTLE_ENDIAN
625e88be1f41b5 Will Deacon 2018-04-26  24  		struct {
625e88be1f41b5 Will Deacon 2018-04-26  25  			u8	locked;
625e88be1f41b5 Will Deacon 2018-04-26  26  			u8	pending;
625e88be1f41b5 Will Deacon 2018-04-26  27  		};
625e88be1f41b5 Will Deacon 2018-04-26  28  		struct {
625e88be1f41b5 Will Deacon 2018-04-26  29  			u16	locked_pending;
625e88be1f41b5 Will Deacon 2018-04-26  30  			u16	tail;
625e88be1f41b5 Will Deacon 2018-04-26  31  		};
625e88be1f41b5 Will Deacon 2018-04-26  32  #else
625e88be1f41b5 Will Deacon 2018-04-26  33  		struct {
625e88be1f41b5 Will Deacon 2018-04-26  34  			u16	tail;
625e88be1f41b5 Will Deacon 2018-04-26  35  			u16	locked_pending;
625e88be1f41b5 Will Deacon 2018-04-26  36  		};
625e88be1f41b5 Will Deacon 2018-04-26  37  		struct {
625e88be1f41b5 Will Deacon 2018-04-26  38  			u8	reserved[2];
625e88be1f41b5 Will Deacon 2018-04-26  39  			u8	pending;
625e88be1f41b5 Will Deacon 2018-04-26  40  			u8	locked;
625e88be1f41b5 Will Deacon 2018-04-26  41  		};
625e88be1f41b5 Will Deacon 2018-04-26  42  #endif
625e88be1f41b5 Will Deacon 2018-04-26  43  	};
a33fda35e3a765 Waiman Long 2015-04-24 @44  } arch_spinlock_t;
a33fda35e3a765 Waiman Long 2015-04-24  45  

:::::: The code at line 44 was first introduced by commit
:::::: a33fda35e3a7655fb7df756ed67822afb5ed5e8d locking/qspinlock: Introduce a simple generic 4-byte queued spinlock

:::::: TO: Waiman Long <Waiman.Long@hp.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
