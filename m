Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B8EA34
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etOUrbM8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701599957; x=1733135957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2cuBsbpmAg2DSl49RDxAjtSX5BBnuwT7rLPX8kgkPM=;
  b=etOUrbM83w5hPH0l4Xui9rU6f+L7u7pXow2JFVdN4Mc8kvzPauehu18j
   xi0wU0sHcQZ1T09+Qok4O/tBT+5qsZTDkam31HKVkqvnySQ9iiJUbLiSC
   aaO2z8vlGiaQzgUeRkdDc/SfoY/nhvpUpzIAYhTlABpw1fhCXVEhH7+sD
   l1Qluvioe8X8TdBMDPHMTHjnvvuNfw3CtpzqPkx+xVq+oQszgiGpbZltw
   crLr39Kg0dv2rNhdVOS44dNjwe/9gVF0H2+beEajDss6/VPtPuuquJGvi
   oMIHQAjYU1irrmgJr3GcSYYNB+VIwk2bd75OROlDoGhccoXLNiR4mAVWN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="397523601"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="397523601"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 02:39:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="861083823"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="861083823"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Dec 2023 02:39:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9jsX-0006Yc-0Q;
	Sun, 03 Dec 2023 10:39:13 +0000
Date: Sun, 3 Dec 2023 18:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/asm-generic/bitops/lock.h:63:15: sparse: sparse: cast from
 unknown type
Message-ID: <202312031857.agi3d4au-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/asm-generic/bitops/lock.h:63:15: sparse: sparse: cast from unknown type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: a5460b5e5fb82656807840d40d3deaecad094044 READ_ONCE: Simplify implementations of {READ,WRITE}_ONCE()
date:   3 years, 8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 years, 8 months ago
config: sparc64-randconfig-r112-20231130 (https://download.01.org/0day-ci/archive/20231203/202312031857.agi3d4au-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031857.agi3d4au-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312031857.agi3d4au-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/asm-generic/atomic-long.h:997:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:997:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:1003:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:1003:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:1009:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:1009:1: sparse: sparse: got }
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/bitops_64.h, arch/sparc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/asm-generic/bitops/lock.h:24:11: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:24:11: sparse: sparse: got +=
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got (
   include/asm-generic/bitops/lock.h:25:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got {
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/lock.h:25:13: sparse: sparse: got }
   include/asm-generic/bitops/lock.h:28:66: sparse: sparse: No right hand side of '*'-expression
   include/asm-generic/bitops/lock.h:28:67: sparse: sparse: Expected ) in function call
   include/asm-generic/bitops/lock.h:28:67: sparse: sparse: got p
   include/asm-generic/bitops/lock.h:29:9: sparse: sparse: Trying to use reserved word 'return' as identifier
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
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/linux/atomic-fallback.h:2028:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2028:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2028:13: sparse: sparse: undefined identifier 'o'
   include/linux/atomic-fallback.h:2028:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2028:13: sparse: sparse: undefined identifier 'new'
   include/linux/atomic-fallback.h:2028:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2028:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2028:13: sparse: sparse: cast from unknown type
   include/linux/atomic-fallback.h:2041:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2041:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2041:13: sparse: sparse: undefined identifier 'o'
   include/linux/atomic-fallback.h:2041:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2041:13: sparse: sparse: undefined identifier 'new'
   include/linux/atomic-fallback.h:2041:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2041:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2041:13: sparse: sparse: cast from unknown type
   include/linux/atomic-fallback.h:2041:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic-fallback.h:2028)
   include/linux/atomic-fallback.h:2054:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2054:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2054:13: sparse: sparse: undefined identifier 'o'
   include/linux/atomic-fallback.h:2054:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2054:13: sparse: sparse: undefined identifier 'new'
   include/linux/atomic-fallback.h:2054:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2054:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2054:13: sparse: sparse: cast from unknown type
   include/linux/atomic-fallback.h:2054:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic-fallback.h:2041)
   include/linux/atomic-fallback.h:2067:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2067:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2067:13: sparse: sparse: undefined identifier 'o'
   include/linux/atomic-fallback.h:2067:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2067:13: sparse: sparse: undefined identifier 'new'
   include/linux/atomic-fallback.h:2067:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2067:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2067:13: sparse: sparse: cast from unknown type
   include/linux/atomic-fallback.h:2067:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic-fallback.h:2054)
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/asm-generic/atomic-long.h:906:16: sparse: sparse: undefined identifier 'v'
   include/asm-generic/atomic-long.h:906:16: sparse: sparse: undefined identifier 'new'
   include/asm-generic/atomic-long.h:912:16: sparse: sparse: undefined identifier 'v'
   include/asm-generic/atomic-long.h:912:16: sparse: sparse: undefined identifier 'new'
   include/asm-generic/atomic-long.h:912:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/asm-generic/atomic-long.h:906)
   include/asm-generic/atomic-long.h:918:16: sparse: sparse: undefined identifier 'v'
   include/asm-generic/atomic-long.h:918:16: sparse: sparse: undefined identifier 'new'
   include/asm-generic/atomic-long.h:918:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/asm-generic/atomic-long.h:912)
   include/asm-generic/atomic-long.h:924:16: sparse: sparse: undefined identifier 'v'
   include/asm-generic/atomic-long.h:924:16: sparse: sparse: undefined identifier 'new'
   include/asm-generic/atomic-long.h:924:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/asm-generic/atomic-long.h:918)
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/bitops_64.h, arch/sparc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/asm-generic/bitops/lock.h:22:30: sparse: sparse: undefined identifier 'nr'
   include/asm-generic/bitops/lock.h:28:15: sparse: sparse: undefined identifier 'atomic_long_fetch_or_acquire'
   include/asm-generic/bitops/lock.h:63:15: sparse: sparse: cannot dereference this type
   include/asm-generic/bitops/lock.h:63:15: sparse: sparse: cannot dereference this type
>> include/asm-generic/bitops/lock.h:63:15: sparse: sparse: cast from unknown type
   include/asm-generic/bitops/lock.h:63:15: sparse: sparse: cannot dereference this type
   include/asm-generic/bitops/lock.h:63:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at include/asm-generic/bitops/lock.h:28)
   include/asm-generic/bitops/lock.h:82:30: sparse: sparse: undefined identifier 'nr'
   include/asm-generic/bitops/lock.h:82:23: sparse: sparse: symbol 'mask' has multiple initializers (originally initialized at include/asm-generic/bitops/lock.h:22)
   include/asm-generic/bitops/lock.h:85:55: sparse: sparse: undefined identifier 'atomic_long_t'
   include/asm-generic/bitops/lock.h:85:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at include/asm-generic/bitops/lock.h:63)

vim +63 include/asm-generic/bitops/lock.h

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

:::::: The code at line 63 was first introduced by commit
:::::: 84c6591103dbeaf393a092a3fc7b09510825f6b9 locking/atomics, asm-generic/bitops/lock.h: Rewrite using atomic_fetch_*()

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
