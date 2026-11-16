Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792853;
	b=dNcpnyPPvvEW0IwOt4VcIW2TDg9LGSoFxfyh3kGBj1zswR0dYzmQIW+VnlSt6SB0WrYO
	 ycGelNBtoTEScTHH/cHuUS/91A/oJXjedZvfTS5mkUDT955IIhIfWWuw6WFIngTRc0osE
	 a01hkGxzKQIyZ5vJuS2uly4SP0kMBFpGLdDxGVjG/DJJj3kVAf3P1iLaVEkrACuGWP5Ey
	 pIhTsNOquVieNNhKtMNssm+rDIKb8nEqkMkU4Em3spxeMraOFfDm29wFaDAiHHt/Y7eqO
	 lDCyCP4MlT+1L5FvSL7PI2f+7ddR3N6viBMPwhSYgLJKynH1SBHPesV/KhNxn3bkRSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792853;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XH/jXl3bLq1WSI7xRL9AU+LSb012B4vJnBAllhxIcmg=;
	b=yBBPbNQhHMXahG3NGTuyKzpgh8eHyp/5QFbnUbMAJMRaZC5ZIAO5Nuczs+5m7P8LsGLY
	 Ls7qHqyNrpdLoDNuGRfX2tJUfx7XHjTJuIrPNtsD/1ez6Av/1l9gXBxkkYKSZDKn76HVG
	 sIrM7ZQM8Ed792oG7awixsJO54Xfi/PHSBVFlNEyoHBLkbTTQZX/+KsOHYCCUlAT8+G1D
	 Wa3C/vm4QqWG0qLaOoUUGFLgQ/gbghP5VZc6+gDWDDCYb7bah9bMfRuTvYu3v31dfhNQ9
	 3DCndOHPq2Y88hIhWhCj7U1pYDWrXp8liU0juki1MetNHhf/oKETniGak88ree7KqeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mTWBag7f;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F70F606A31C
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 01:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F70F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mTWBag7f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794792853; x=1826328853;
  h=date:from:to:cc:subject:message-id;
  bh=LKsO/NGmUyagzzI+37KNZXSHu5ohdcRqh0opvV45M4U=;
  b=mTWBag7feiHdVJTLajvsJaU16YTENHA9UMTlIAvDFN/9yIR8HuZo9DyV
   a4DVjtdtIVP2GwiCAJAX4XuOMlqfkKwykpgg9Wn0JmyxP76TuhNZKsHOj
   06lYdOrERqHuMd7OEz9mwwgH4O5623Mk9KT8rguvxas6/YrsdA0YmRVf5
   N5QNNKO/g0BM3/lfl6hmkhXEYE5BtV9ZyDwGiZCOhdKM2EObNp+oSMePW
   1fJzgA2r8uSL0ZvOniT3HSlrEt+Ew38muPjL9oJa8RA/0q4Z9RVF3QoH8
   YNYl9hA0uh3H6+/w0hAXkziZZpParCnkZXmuvdctqf73KRoe3sW25xqq+
   w==;
X-CSE-ConnectionGUID: QgtLHLQlQHyQ5ihJXOwx9A==
X-CSE-MsgGUID: 8Uys8hw4TWK8wEUTI7TlIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3416317"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3416317"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 17:34:12 -0800
X-CSE-ConnectionGUID: vYQl92brRQSFVWdZVK97RA==
X-CSE-MsgGUID: HcetnTFjQXaXieCA9aSsSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="11146781"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 15 Nov 2026 17:34:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSlbk-000000017bQ-0VUi;
	Mon, 16 Nov 2026 01:34:08 +0000
Date: Mon, 16 Nov 2026 09:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kvm:kvm-memprot-v4 33/54] include/linux/kvm_host.h:2640:9:
 error: call to '__compiletime_assert_505' declared with 'error' attribute:
 Need native word sized stores/loads for atomicity.
Message-ID: <202611160924.tySCf5ok-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: kvm@vger.kernel.org
CC: Farrah Chen <farrah.chen@intel.com>
TO: Nicolas Saenz Julienne <nsaenz@amazon.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git kvm-memprot-v4
head:   e71c4e83c03926c300f6c43e79b783d47ba8b588
commit: 4764db743fe860556eea711a26ef11c74db647d2 [33/54] KVM: Introduce a generation number for memory attributes
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: i386-buildonly-randconfig-1005-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160924.tySCf5ok-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160924.tySCf5ok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611160924.tySCf5ok-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/../../../virt/kvm/pfncache.c:14:
>> include/linux/kvm_host.h:2640:9: error: call to '__compiletime_assert_505' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
    2640 |         return smp_load_acquire(&kvm->mem_attrs.generation);
         |                ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   arch/x86/include/asm/barrier.h:69:2: note: expanded from macro '__smp_load_acquire'
      69 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:705:2: note: expanded from macro 'compiletime_assert_atomic_type'
     705 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:107:1: note: expanded from here
     107 | __compiletime_assert_505
         | ^
   In file included from arch/x86/kvm/../../../virt/kvm/pfncache.c:14:
>> include/linux/kvm_host.h:2640:9: error: call to '__compiletime_assert_505' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   arch/x86/include/asm/barrier.h:69:2: note: expanded from macro '__smp_load_acquire'
      69 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:705:2: note: expanded from macro 'compiletime_assert_atomic_type'
     705 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:107:1: note: expanded from here
     107 | __compiletime_assert_505
         | ^
   2 errors generated.
--
   In file included from arch/x86/kvm/x86.c:20:
>> include/linux/kvm_host.h:2640:9: error: call to '__compiletime_assert_505' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
    2640 |         return smp_load_acquire(&kvm->mem_attrs.generation);
         |                ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   arch/x86/include/asm/barrier.h:69:2: note: expanded from macro '__smp_load_acquire'
      69 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:705:2: note: expanded from macro 'compiletime_assert_atomic_type'
     705 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:107:1: note: expanded from here
     107 | __compiletime_assert_505
         | ^
   1 error generated.
--
   In file included from arch/x86/kvm/../../../virt/kvm/kvm_main.c:17:
>> include/linux/kvm_host.h:2640:9: error: call to '__compiletime_assert_505' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
    2640 |         return smp_load_acquire(&kvm->mem_attrs.generation);
         |                ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   arch/x86/include/asm/barrier.h:69:2: note: expanded from macro '__smp_load_acquire'
      69 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:705:2: note: expanded from macro 'compiletime_assert_atomic_type'
     705 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:107:1: note: expanded from here
     107 | __compiletime_assert_505
         | ^
   In file included from arch/x86/kvm/../../../virt/kvm/kvm_main.c:17:
>> include/linux/kvm_host.h:2640:9: error: call to '__compiletime_assert_505' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   arch/x86/include/asm/barrier.h:69:2: note: expanded from macro '__smp_load_acquire'
      69 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:705:2: note: expanded from macro 'compiletime_assert_atomic_type'
     705 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:107:1: note: expanded from here
     107 | __compiletime_assert_505
         | ^
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:2795:2: error: call to '__compiletime_assert_801' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(attrs->attributes) != sizeof(unsigned long)
    2795 |         BUILD_BUG_ON(sizeof(attrs->attributes) != sizeof(unsigned long));
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:167:1: note: expanded from here
     167 | __compiletime_assert_801
         | ^
   3 errors generated.


vim +2640 include/linux/kvm_host.h

4764db743fe860 Nicolas Saenz Julienne 2026-09-18  2628  
4764db743fe860 Nicolas Saenz Julienne 2026-09-18  2629  static inline u64 kvm_mem_attributes_generation(struct kvm *kvm)
4764db743fe860 Nicolas Saenz Julienne 2026-09-18  2630  {
4764db743fe860 Nicolas Saenz Julienne 2026-09-18  2631  	RCU_LOCKDEP_WARN(!lockdep_is_held(&kvm->slots_lock) &&
4764db743fe860 Nicolas Saenz Julienne 2026-09-18  2632  				 !srcu_read_lock_held(&kvm->srcu),
4764db743fe860 Nicolas Saenz Julienne 2026-09-18  2633  			 "Suspicious memory attribute generation usage\n");
4764db743fe860 Nicolas Saenz Julienne 2026-09-18  2634  
4764db743fe860 Nicolas Saenz Julienne 2026-09-18  2635  	/*
4764db743fe860 Nicolas Saenz Julienne 2026-09-18  2636  	 * The acquire pairs with the release in kvm_vm_set_mem_attributes().
4764db743fe860 Nicolas Saenz Julienne 2026-09-18  2637  	 * Memory attributes should only be queried _after_ storing the
4764db743fe860 Nicolas Saenz Julienne 2026-09-18  2638  	 * generation number.
4764db743fe860 Nicolas Saenz Julienne 2026-09-18  2639  	 */
4764db743fe860 Nicolas Saenz Julienne 2026-09-18 @2640  	return smp_load_acquire(&kvm->mem_attrs.generation);
4764db743fe860 Nicolas Saenz Julienne 2026-09-18  2641  }
f1c09df8af4596 Nicolas Saenz Julienne 2026-09-18  2642  #else
f1c09df8af4596 Nicolas Saenz Julienne 2026-09-18  2643  static inline u64 kvm_supported_vm_mem_attributes(struct kvm *kvm)
f1c09df8af4596 Nicolas Saenz Julienne 2026-09-18  2644  {
f1c09df8af4596 Nicolas Saenz Julienne 2026-09-18  2645  	return 0;
f1c09df8af4596 Nicolas Saenz Julienne 2026-09-18  2646  }
4117eb0108b90b Nicolas Saenz Julienne 2026-09-18  2647  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
