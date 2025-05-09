Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909E6264605
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 04:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766157; cv=none; b=kANu4ggSPB27LrSdyUih2WtUAI4oArosqkAR+lQ+0r66iPsB6gwtoWftZGCTM5ftkEa1RM2TbbvmgJeuNlSw4jAbpHC0c31sRPyAotv52gROpPI9n3O9YYxdzeGxXu+YSr0NfLy9yKXkmuol2eFmPMB6L++Ubl/SldHResrWKEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766157; c=relaxed/simple;
	bh=FeeznCKw3v/5LRFK0ghY048neQcNUCin1fyHhYE383s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5O7tRfHKWsKT+qVuWXkbTNrValXJL7k1t5P/zMXMXfp7vgGtfcFFVE72YzS86Ubhf6HnejrGN4JLWDoJWDLICgUo0gM0RZC5oZIltvTiqLOLVy8MNkXBPBzPpCDOHDQuEpICyh3SDdl6tMK0L1MDltyWlhm5EpDUFTTP34HndA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVagedV7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVagedV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746766156; x=1778302156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FeeznCKw3v/5LRFK0ghY048neQcNUCin1fyHhYE383s=;
  b=BVagedV7BIwOy+C3DSqoAglQ55W1MbQuZJt6Sea0LAzrtv/maaTwkiYA
   9gNRI7Bv1/34ptaIKkq1q+53mWvS/0oPjnWRyeqXmU8viP+MAFfj3xuLi
   VPy3Ug2+iS2qbLHfxOt5B3DcYy6xe+fTDGS8nTNvHXozG/d2zQp2/KqWc
   aBv36zMGy+Qdef/PUc2oG5BHLVK4eJf3O2amjks0Rfd0RvSiHg2wETcfV
   xTB1WvdaL/wlDiz4lpnyd2SLJ7zbcDn66vCjvBMDCc6kVjDqHvn4aKo5I
   UZ02p+ln6P/BW2yd+0sbxQZgUE1a2duOC8zJOUw9NaPTaj0i863NeMZLJ
   A==;
X-CSE-ConnectionGUID: sSmRrWZ5SQabgvK551htTw==
X-CSE-MsgGUID: OQrvMHuKRKux0aXOIFVi7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48496272"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48496272"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 21:49:15 -0700
X-CSE-ConnectionGUID: QfK8q1d7Tly1bjfizSV5LA==
X-CSE-MsgGUID: P1+zRsfVT0KpHYxwqeTSkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="140562180"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 May 2025 21:49:13 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDFfb-0000Ti-37;
	Fri, 09 May 2025 04:49:11 +0000
Date: Fri, 9 May 2025 12:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:la57-cpucap 2/6] arch/x86/kvm/reverse_cpuid.h:102:2: error:
 call to '__compiletime_assert_680' declared with 'error' attribute:
 BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
Message-ID: <202505091226.MjZBcX1y-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git la57-cpucap
head:   b69e81879863086ffd10017a2153273363272478
commit: cb90175592e75552aabc4d2fe3f83bc4be63d819 [2/6] x86/cpu: Use a new feature flag for 5 level paging
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250509/202505091226.MjZBcX1y-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091226.MjZBcX1y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505091226.MjZBcX1y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/x86.c:21:
   In file included from arch/x86/kvm/irq.h:19:
   In file included from arch/x86/kvm/lapic.h:9:
   In file included from arch/x86/kvm/hyperv.h:25:
   In file included from arch/x86/kvm/x86.h:11:
   In file included from arch/x86/kvm/cpuid.h:5:
>> arch/x86/kvm/reverse_cpuid.h:102:2: error: call to '__compiletime_assert_680' declared with 'error' attribute: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:11:1: note: expanded from here
      11 | __compiletime_assert_680
         | ^
   In file included from arch/x86/kvm/x86.c:21:
   In file included from arch/x86/kvm/irq.h:19:
   In file included from arch/x86/kvm/lapic.h:9:
   In file included from arch/x86/kvm/hyperv.h:25:
   In file included from arch/x86/kvm/x86.h:11:
   In file included from arch/x86/kvm/cpuid.h:5:
>> arch/x86/kvm/reverse_cpuid.h:102:2: error: call to '__compiletime_assert_680' declared with 'error' attribute: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:11:1: note: expanded from here
      11 | __compiletime_assert_680
         | ^
   In file included from arch/x86/kvm/x86.c:21:
   In file included from arch/x86/kvm/irq.h:19:
   In file included from arch/x86/kvm/lapic.h:9:
   In file included from arch/x86/kvm/hyperv.h:25:
   In file included from arch/x86/kvm/x86.h:11:
   In file included from arch/x86/kvm/cpuid.h:5:
>> arch/x86/kvm/reverse_cpuid.h:102:2: error: call to '__compiletime_assert_680' declared with 'error' attribute: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:11:1: note: expanded from here
      11 | __compiletime_assert_680
         | ^
   In file included from arch/x86/kvm/x86.c:21:
   In file included from arch/x86/kvm/irq.h:19:
   In file included from arch/x86/kvm/lapic.h:9:
   In file included from arch/x86/kvm/hyperv.h:25:
   In file included from arch/x86/kvm/x86.h:11:
   In file included from arch/x86/kvm/cpuid.h:5:
>> arch/x86/kvm/reverse_cpuid.h:102:2: error: call to '__compiletime_assert_680' declared with 'error' attribute: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:11:1: note: expanded from here
      11 | __compiletime_assert_680
         | ^
   4 errors generated.
--
   In file included from arch/x86/kvm/mmu/mmu.c:19:
   In file included from arch/x86/kvm/irq.h:19:
   In file included from arch/x86/kvm/lapic.h:9:
   In file included from arch/x86/kvm/hyperv.h:25:
   In file included from arch/x86/kvm/x86.h:11:
   In file included from arch/x86/kvm/cpuid.h:5:
>> arch/x86/kvm/reverse_cpuid.h:102:2: error: call to '__compiletime_assert_680' declared with 'error' attribute: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:11:1: note: expanded from here
      11 | __compiletime_assert_680
         | ^
   1 error generated.
--
   In file included from arch/x86/kvm/vmx/vmx.c:55:
   In file included from arch/x86/kvm/vmx/capabilities.h:7:
   In file included from arch/x86/kvm/vmx/../lapic.h:9:
   In file included from arch/x86/kvm/vmx/../hyperv.h:25:
   In file included from arch/x86/kvm/vmx/../x86.h:11:
   In file included from arch/x86/kvm/vmx/../cpuid.h:5:
>> arch/x86/kvm/vmx/../reverse_cpuid.h:102:2: error: call to '__compiletime_assert_714' declared with 'error' attribute: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:10:1: note: expanded from here
      10 | __compiletime_assert_714
         | ^
   In file included from arch/x86/kvm/vmx/vmx.c:55:
   In file included from arch/x86/kvm/vmx/capabilities.h:7:
   In file included from arch/x86/kvm/vmx/../lapic.h:9:
   In file included from arch/x86/kvm/vmx/../hyperv.h:25:
   In file included from arch/x86/kvm/vmx/../x86.h:11:
   In file included from arch/x86/kvm/vmx/../cpuid.h:5:
>> arch/x86/kvm/vmx/../reverse_cpuid.h:102:2: error: call to '__compiletime_assert_714' declared with 'error' attribute: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:10:1: note: expanded from here
      10 | __compiletime_assert_714
         | ^
   2 errors generated.
--
   In file included from mmu/mmu.c:19:
   In file included from arch/x86/kvm/irq.h:19:
   In file included from arch/x86/kvm/lapic.h:9:
   In file included from arch/x86/kvm/hyperv.h:25:
   In file included from arch/x86/kvm/x86.h:11:
   In file included from arch/x86/kvm/cpuid.h:5:
>> arch/x86/kvm/reverse_cpuid.h:102:2: error: call to '__compiletime_assert_680' declared with 'error' attribute: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:33:1: note: expanded from here
      33 | __compiletime_assert_680
         | ^
   1 error generated.


vim +102 arch/x86/kvm/reverse_cpuid.h

013380782d4d67 Ricardo Koller      2021-04-21   86  
013380782d4d67 Ricardo Koller      2021-04-21   87  /*
013380782d4d67 Ricardo Koller      2021-04-21   88   * Reverse CPUID and its derivatives can only be used for hardware-defined
013380782d4d67 Ricardo Koller      2021-04-21   89   * feature words, i.e. words whose bits directly correspond to a CPUID leaf.
013380782d4d67 Ricardo Koller      2021-04-21   90   * Retrieving a feature bit or masking guest CPUID from a Linux-defined word
013380782d4d67 Ricardo Koller      2021-04-21   91   * is nonsensical as the bit number/mask is an arbitrary software-defined value
013380782d4d67 Ricardo Koller      2021-04-21   92   * and can't be used by KVM to query/control guest capabilities.  And obviously
013380782d4d67 Ricardo Koller      2021-04-21   93   * the leaf being queried must have an entry in the lookup table.
013380782d4d67 Ricardo Koller      2021-04-21   94   */
013380782d4d67 Ricardo Koller      2021-04-21   95  static __always_inline void reverse_cpuid_check(unsigned int x86_leaf)
013380782d4d67 Ricardo Koller      2021-04-21   96  {
8cb4a9a82b2162 Sean Christopherson 2024-04-04   97  	BUILD_BUG_ON(NR_CPUID_WORDS != NCAPINTS);
013380782d4d67 Ricardo Koller      2021-04-21   98  	BUILD_BUG_ON(x86_leaf == CPUID_LNX_1);
013380782d4d67 Ricardo Koller      2021-04-21   99  	BUILD_BUG_ON(x86_leaf == CPUID_LNX_2);
013380782d4d67 Ricardo Koller      2021-04-21  100  	BUILD_BUG_ON(x86_leaf == CPUID_LNX_3);
013380782d4d67 Ricardo Koller      2021-04-21  101  	BUILD_BUG_ON(x86_leaf == CPUID_LNX_4);
8cb4a9a82b2162 Sean Christopherson 2024-04-04 @102  	BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
013380782d4d67 Ricardo Koller      2021-04-21  103  	BUILD_BUG_ON(x86_leaf >= ARRAY_SIZE(reverse_cpuid));
013380782d4d67 Ricardo Koller      2021-04-21  104  	BUILD_BUG_ON(reverse_cpuid[x86_leaf].function == 0);
013380782d4d67 Ricardo Koller      2021-04-21  105  }
013380782d4d67 Ricardo Koller      2021-04-21  106  

:::::: The code at line 102 was first introduced by commit
:::::: 8cb4a9a82b21623dbb4b3051dd30d98356cf95bc x86/cpufeatures: Add CPUID_LNX_5 to track recently added Linux-defined word

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
