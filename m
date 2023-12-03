Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D0B8833
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdkvV+0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701614933; x=1733150933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0XqbR8SX9KWylLrhEawarPyaOIBvhRP2Ac8Wnyw+Vvc=;
  b=TdkvV+0qOhNHhqthqZ0rJaG9ZWvqijMWx3kEc71oICnGJ7KjDlnpQmhV
   tRZKg8H5i/uM0rymieJg9AjSJg+KgaoRfK8/qWdvwxMqSj9owwkKM6aEV
   MADUBtwW5hdRcjpdK7W+S3Z+hwzHKj0bwBbWnV2i5W4GoEha7kt2FgImo
   FQY3BbPV7bFe7HqaoNqETExWDNQCj6fzwnKliimbcfzLjjZTv888xBDiC
   BQK4bTYZZdYSBg3R7+d9pNnJzFILriHFiWIkVLGrqFNDWMcT3trcwjdBd
   h0xSCHbsH/TZICXsenx8P7ddcWhe4/ilkKUlJjepfvSNEQ0c5WShjEMKx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="547868"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="547868"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 06:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="746560825"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="746560825"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Dec 2023 06:48:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9nm3-0006lE-3B;
	Sun, 03 Dec 2023 14:48:47 +0000
Date: Sun, 3 Dec 2023 22:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Trying to
 use reserved word 'const' as identifier
Message-ID: <202312032135.uWzrAWzL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Trying to use reserved word 'const' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 3c9184109e78ea2371ca8fa66d7f36986a53af98 asm/rwonce: Remove smp_read_barrier_depends() invocation
date:   3 years, 4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 years, 4 months ago
config: sparc64-randconfig-r112-20231130 (https://download.01.org/0day-ci/archive/20231203/202312032135.uWzrAWzL-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312032135.uWzrAWzL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312032135.uWzrAWzL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/asm-generic/atomic-long.h:812:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:818:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:818:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:824:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:824:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:830:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:830:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:836:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:836:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:842:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:842:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:848:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:848:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:854:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:854:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:860:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:860:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:866:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:866:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:872:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:872:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:878:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:878:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:884:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:884:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:890:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:890:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:896:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:896:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:902:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:902:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:907:16: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic-long.h:907:16: sparse: sparse: got *
   include/asm-generic/atomic-long.h:907:16: sparse: sparse: Trying to use reserved word '__typeof__' as identifier
   include/asm-generic/atomic-long.h:907:16: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:907:16: sparse: sparse: got }
   include/asm-generic/atomic-long.h:908:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:908:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:913:16: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic-long.h:913:16: sparse: sparse: got *
   include/asm-generic/atomic-long.h:913:16: sparse: sparse: Trying to use reserved word '__typeof__' as identifier
   include/asm-generic/atomic-long.h:913:16: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:913:16: sparse: sparse: got }
   include/asm-generic/atomic-long.h:914:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:914:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:919:16: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic-long.h:919:16: sparse: sparse: got *
   include/asm-generic/atomic-long.h:919:16: sparse: sparse: Trying to use reserved word '__typeof__' as identifier
   include/asm-generic/atomic-long.h:919:16: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:919:16: sparse: sparse: got }
   include/asm-generic/atomic-long.h:920:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:920:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:925:16: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic-long.h:925:16: sparse: sparse: got *
   include/asm-generic/atomic-long.h:925:16: sparse: sparse: Trying to use reserved word '__typeof__' as identifier
   include/asm-generic/atomic-long.h:925:16: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:925:16: sparse: sparse: got }
   include/asm-generic/atomic-long.h:926:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:926:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:932:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:932:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:938:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:938:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:944:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:944:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:950:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:950:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:956:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:956:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:962:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:962:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:968:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:968:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:974:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:974:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:980:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:980:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:986:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:986:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:992:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:992:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:998:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:998:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:1004:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:1004:1: sparse: sparse: got }
   include/asm-generic/atomic-long.h:1010:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic-long.h:1010:1: sparse: sparse: got }
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
>> include/asm-generic/bitops/lock.h:25:13: sparse: sparse: Trying to use reserved word 'const' as identifier
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
   include/linux/atomic-fallback.h:2241:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2241:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2241:13: sparse: sparse: undefined identifier 'o'
   include/linux/atomic-fallback.h:2241:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2241:13: sparse: sparse: undefined identifier 'new'
   include/linux/atomic-fallback.h:2241:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2241:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2241:13: sparse: sparse: cast from unknown type
   include/linux/atomic-fallback.h:2254:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2254:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2254:13: sparse: sparse: undefined identifier 'o'
   include/linux/atomic-fallback.h:2254:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2254:13: sparse: sparse: undefined identifier 'new'
   include/linux/atomic-fallback.h:2254:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2254:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2254:13: sparse: sparse: cast from unknown type
   include/linux/atomic-fallback.h:2254:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic-fallback.h:2241)
   include/linux/atomic-fallback.h:2267:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2267:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2267:13: sparse: sparse: undefined identifier 'o'
   include/linux/atomic-fallback.h:2267:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2267:13: sparse: sparse: undefined identifier 'new'
   include/linux/atomic-fallback.h:2267:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2267:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2267:13: sparse: sparse: cast from unknown type
   include/linux/atomic-fallback.h:2267:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic-fallback.h:2254)
   include/linux/atomic-fallback.h:2280:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2280:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2280:13: sparse: sparse: undefined identifier 'o'
   include/linux/atomic-fallback.h:2280:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2280:13: sparse: sparse: undefined identifier 'new'
   include/linux/atomic-fallback.h:2280:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2280:13: sparse: sparse: undefined identifier 'v'
   include/linux/atomic-fallback.h:2280:13: sparse: sparse: cast from unknown type
   include/linux/atomic-fallback.h:2280:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic-fallback.h:2267)
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/include/asm/bitops_64.h, ...):
   include/asm-generic/atomic-long.h:907:16: sparse: sparse: undefined identifier 'v'
   include/asm-generic/atomic-long.h:907:16: sparse: sparse: undefined identifier 'new'
   include/asm-generic/atomic-long.h:913:16: sparse: sparse: undefined identifier 'v'
   include/asm-generic/atomic-long.h:913:16: sparse: sparse: undefined identifier 'new'
   include/asm-generic/atomic-long.h:913:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/asm-generic/atomic-long.h:907)
   include/asm-generic/atomic-long.h:919:16: sparse: sparse: undefined identifier 'v'
   include/asm-generic/atomic-long.h:919:16: sparse: sparse: undefined identifier 'new'
   include/asm-generic/atomic-long.h:919:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/asm-generic/atomic-long.h:913)
   include/asm-generic/atomic-long.h:925:16: sparse: sparse: undefined identifier 'v'
   include/asm-generic/atomic-long.h:925:16: sparse: sparse: undefined identifier 'new'
   include/asm-generic/atomic-long.h:925:16: sparse: sparse: symbol '_n_' has multiple initializers (originally initialized at include/asm-generic/atomic-long.h:919)
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through arch/sparc/include/asm/bitops_64.h, arch/sparc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/asm-generic/bitops/lock.h:22:30: sparse: sparse: undefined identifier 'nr'
   include/asm-generic/bitops/lock.h:28:15: sparse: sparse: undefined identifier 'atomic_long_fetch_or_acquire'
   include/asm-generic/bitops/lock.h:63:15: sparse: sparse: cannot dereference this type
   include/asm-generic/bitops/lock.h:63:15: sparse: sparse: cannot dereference this type
   include/asm-generic/bitops/lock.h:63:15: sparse: sparse: cast from unknown type
   include/asm-generic/bitops/lock.h:63:15: sparse: sparse: cannot dereference this type
   include/asm-generic/bitops/lock.h:63:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at include/asm-generic/bitops/lock.h:28)
   include/asm-generic/bitops/lock.h:82:30: sparse: sparse: undefined identifier 'nr'
   include/asm-generic/bitops/lock.h:82:23: sparse: sparse: symbol 'mask' has multiple initializers (originally initialized at include/asm-generic/bitops/lock.h:22)
   include/asm-generic/bitops/lock.h:85:55: sparse: sparse: undefined identifier 'atomic_long_t'
   include/asm-generic/bitops/lock.h:85:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at include/asm-generic/bitops/lock.h:63)

vim +/const +25 include/asm-generic/bitops/lock.h

84c6591103dbea Will Deacon 2018-06-19   8  
26333576fd0d0b Nick Piggin 2007-10-18   9  /**
26333576fd0d0b Nick Piggin 2007-10-18  10   * test_and_set_bit_lock - Set a bit and return its old value, for lock
26333576fd0d0b Nick Piggin 2007-10-18  11   * @nr: Bit to set
26333576fd0d0b Nick Piggin 2007-10-18  12   * @addr: Address to count from
26333576fd0d0b Nick Piggin 2007-10-18  13   *
61e02392d3c7ec Will Deacon 2018-02-13  14   * This operation is atomic and provides acquire barrier semantics if
61e02392d3c7ec Will Deacon 2018-02-13  15   * the returned value is 0.
26333576fd0d0b Nick Piggin 2007-10-18  16   * It can be used to implement bit locks.
26333576fd0d0b Nick Piggin 2007-10-18  17   */
84c6591103dbea Will Deacon 2018-06-19  18  static inline int test_and_set_bit_lock(unsigned int nr,
84c6591103dbea Will Deacon 2018-06-19  19  					volatile unsigned long *p)
84c6591103dbea Will Deacon 2018-06-19  20  {
84c6591103dbea Will Deacon 2018-06-19  21  	long old;
84c6591103dbea Will Deacon 2018-06-19  22  	unsigned long mask = BIT_MASK(nr);
84c6591103dbea Will Deacon 2018-06-19  23  
84c6591103dbea Will Deacon 2018-06-19  24  	p += BIT_WORD(nr);
84c6591103dbea Will Deacon 2018-06-19 @25  	if (READ_ONCE(*p) & mask)
84c6591103dbea Will Deacon 2018-06-19  26  		return 1;
84c6591103dbea Will Deacon 2018-06-19  27  
84c6591103dbea Will Deacon 2018-06-19  28  	old = atomic_long_fetch_or_acquire(mask, (atomic_long_t *)p);
84c6591103dbea Will Deacon 2018-06-19  29  	return !!(old & mask);
84c6591103dbea Will Deacon 2018-06-19  30  }
84c6591103dbea Will Deacon 2018-06-19  31  

:::::: The code at line 25 was first introduced by commit
:::::: 84c6591103dbeaf393a092a3fc7b09510825f6b9 locking/atomics, asm-generic/bitops/lock.h: Rewrite using atomic_fetch_*()

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
