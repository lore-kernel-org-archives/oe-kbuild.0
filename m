Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4478F30C348
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764667777; cv=none; b=XxSnJkQQnVO4YRAVraEK8i5DZXH27cUYycl7Y/4yGlndj6+Db9Tgx4qAxzAZhzwF2GKC6O33SdRnY9OhncQx6zEpJUuD/VqX/JtFW5x//vlfNaODIBNpug/RwTRR43Z3w8EQIVpfj8JU7Ztzn1yGkHu+AxBX+rwGqRdRkvQylMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764667777; c=relaxed/simple;
	bh=0kXc3zPcNLUyVXagAaTyRFoEpQfl+L9XCj0ckvAWVYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bzFM7qz5m6ZlAWFYSaIKCsEAl4isIG8tjwG8db3u9pIlotF4vGIaOUA3vmzPCni/bRNAPDXUo13oEAGSk90ooI1bwGSg/nNO9AHa/dN7d27FnktWNBittrRGmyFs31/Nx5AUhyruKm4cb07zKt29uNPyXT2H6pTkEkRgUtrxHk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goRng06P; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goRng06P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764667776; x=1796203776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0kXc3zPcNLUyVXagAaTyRFoEpQfl+L9XCj0ckvAWVYQ=;
  b=goRng06Pz/PgJUmop/CRVGcZKdRu40iYtn0IkSnE6jDhVUmx0Eq5CgnH
   BWseOjSeoZ46va7Wqmem9r83LrglHiCh+v32i4kE9kDY1tRiwpgvcfD2Z
   eSZN49a1wJjQcXqzKfCWo/JcR0OwL+kOrQy15hVOo/EXUDv/bXgImgFCM
   bRddmHIs+VS8AQvj5cW7ylayUsi83mmwB8hV1/fLrN0eaLZtjOKxpvuQQ
   GZHAsawis9j+IX4eYjNqrH6XpiGnoSpRhbfwezYLu1wT6kBTQ6WbUDH6H
   aeytU8Y9uyHxxY5SjatXSCRB0hw7cy1pvqSKK1GfHzYKNezkqLsF099NN
   Q==;
X-CSE-ConnectionGUID: VdWI7TNjSYKbUjJ2RultPQ==
X-CSE-MsgGUID: uTI7hkioR6+F2KcS05dSZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84022726"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="84022726"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 01:29:35 -0800
X-CSE-ConnectionGUID: vN7UKerCS5iUxEg7xPPYCQ==
X-CSE-MsgGUID: xLw7PK9GSka+jNDHT758/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="194761716"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 02 Dec 2025 01:29:33 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQMhP-000000002qf-2L3L;
	Tue, 02 Dec 2025 09:29:31 +0000
Date: Tue, 2 Dec 2025 10:29:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 36/36]
 include/kvm_util_base.h:655:23: error: use of undeclared identifier
 'VM_MODE_DEFAULT'
Message-ID: <202512021059.pxUKdxNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ab94df653806720116e45346cbfcbf5e63df44
commit: 4d2ee43ac2a906833636db6d456370a567fa409c [36/36] selftests: fix LLVM build for i386 and x86_64
:::::: branch date: 13 hours ago
:::::: commit date: 2 years, 8 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021059.pxUKdxNo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021059.pxUKdxNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021059.pxUKdxNo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/elf.c:8:
   include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/elf.c:13:
   In file included from include/kvm_util.h:10:
>> include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
   lib/elf.c:81:29: warning: format specifies type 'ssize_t' (aka 'int') but the argument has type 'off_t' (aka 'long') [-Wformat]
      81 |                 "  rv: %zi expected: %i", offset_rv, 0);
         |                        ~~~                ^~~~~~~~~
         |                        %li
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   lib/elf.c:170:8: warning: format specifies type 'unsigned long' but the argument has type 'vm_vaddr_t' (aka 'unsigned long long') [-Wformat]
     168 |                         "  seg_vstart: 0x%lx\n"
         |                                          ~~~
         |                                          %llx
     169 |                         "  vaddr: 0x%lx",
     170 |                         n1, seg_vstart, vaddr);
         |                             ^~~~~~~~~~
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   lib/elf.c:170:20: warning: format specifies type 'unsigned long' but the argument has type 'vm_vaddr_t' (aka 'unsigned long long') [-Wformat]
     169 |                         "  vaddr: 0x%lx",
         |                                     ~~~
         |                                     %llx
     170 |                         n1, seg_vstart, vaddr);
         |                                         ^~~~~
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   4 warnings and 3 errors generated.
--
   In file included from lib/guest_modes.c:5:
   In file included from include/guest_modes.h:5:
   In file included from include/kvm_util.h:10:
   In file included from include/kvm_util_base.h:10:
   include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/guest_modes.c:5:
   In file included from include/guest_modes.h:5:
   In file included from include/kvm_util.h:10:
>> include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
>> lib/guest_modes.c:17:20: error: use of undeclared identifier 'VM_MODE_DEFAULT'
      17 |         guest_mode_append(VM_MODE_DEFAULT, true, true);
         |                           ^
   1 warning and 4 errors generated.
--
   In file included from lib/kvm_util.c:9:
   include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/kvm_util.c:10:
   In file included from include/kvm_util.h:10:
>> include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
   In file included from lib/kvm_util.c:11:
   include/x86_64/processor.h:15:10: fatal error: 'asm/msr-index.h' file not found
      15 | #include <asm/msr-index.h>
         |          ^~~~~~~~~~~~~~~~~
   1 warning and 4 errors generated.
--
   In file included from lib/x86_64/ucall.c:7:
   In file included from include/kvm_util.h:10:
   In file included from include/kvm_util_base.h:10:
   include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/x86_64/ucall.c:7:
   In file included from include/kvm_util.h:10:
>> include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
   1 warning and 3 errors generated.
--
>> lib/x86_64/vmx.c:8:10: fatal error: 'asm/msr-index.h' file not found
       8 | #include <asm/msr-index.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.
--
>> lib/x86_64/handlers.S:2:7: error: register %r15 is only available in 64-bit mode
    push %r15
         ^~~~
>> lib/x86_64/handlers.S:3:7: error: register %r14 is only available in 64-bit mode
    push %r14
         ^~~~
>> lib/x86_64/handlers.S:4:7: error: register %r13 is only available in 64-bit mode
    push %r13
         ^~~~
>> lib/x86_64/handlers.S:5:7: error: register %r12 is only available in 64-bit mode
    push %r12
         ^~~~
>> lib/x86_64/handlers.S:6:7: error: register %r11 is only available in 64-bit mode
    push %r11
         ^~~~
>> lib/x86_64/handlers.S:7:7: error: register %r10 is only available in 64-bit mode
    push %r10
         ^~~~
>> lib/x86_64/handlers.S:8:7: error: register %r9 is only available in 64-bit mode
    push %r9
         ^~~
>> lib/x86_64/handlers.S:9:7: error: register %r8 is only available in 64-bit mode
    push %r8
         ^~~
>> lib/x86_64/handlers.S:11:7: error: register %rdi is only available in 64-bit mode
    push %rdi
         ^~~~
>> lib/x86_64/handlers.S:12:7: error: register %rsi is only available in 64-bit mode
    push %rsi
         ^~~~
>> lib/x86_64/handlers.S:13:7: error: register %rbp is only available in 64-bit mode
    push %rbp
         ^~~~
>> lib/x86_64/handlers.S:14:7: error: register %rbx is only available in 64-bit mode
    push %rbx
         ^~~~
>> lib/x86_64/handlers.S:15:7: error: register %rdx is only available in 64-bit mode
    push %rdx
         ^~~~
>> lib/x86_64/handlers.S:16:7: error: register %rcx is only available in 64-bit mode
    push %rcx
         ^~~~
>> lib/x86_64/handlers.S:17:7: error: register %rax is only available in 64-bit mode
    push %rax
         ^~~~
>> lib/x86_64/handlers.S:18:6: error: register %rsp is only available in 64-bit mode
    mov %rsp, %rdi
        ^~~~
   lib/x86_64/handlers.S:22:6: error: register %rax is only available in 64-bit mode
    pop %rax
        ^~~~
   lib/x86_64/handlers.S:23:6: error: register %rcx is only available in 64-bit mode
    pop %rcx
        ^~~~
   lib/x86_64/handlers.S:24:6: error: register %rdx is only available in 64-bit mode
    pop %rdx
        ^~~~
   lib/x86_64/handlers.S:25:6: error: register %rbx is only available in 64-bit mode
    pop %rbx
        ^~~~
   lib/x86_64/handlers.S:26:6: error: register %rbp is only available in 64-bit mode
    pop %rbp
        ^~~~
   lib/x86_64/handlers.S:27:6: error: register %rsi is only available in 64-bit mode
    pop %rsi
        ^~~~
   lib/x86_64/handlers.S:28:6: error: register %rdi is only available in 64-bit mode
    pop %rdi
        ^~~~
   lib/x86_64/handlers.S:29:6: error: register %r8 is only available in 64-bit mode
    pop %r8
        ^~~
   lib/x86_64/handlers.S:30:6: error: register %r9 is only available in 64-bit mode
    pop %r9
        ^~~
   lib/x86_64/handlers.S:31:6: error: register %r10 is only available in 64-bit mode
    pop %r10
        ^~~~
   lib/x86_64/handlers.S:32:6: error: register %r11 is only available in 64-bit mode
    pop %r11
        ^~~~
   lib/x86_64/handlers.S:33:6: error: register %r12 is only available in 64-bit mode
    pop %r12
        ^~~~
   lib/x86_64/handlers.S:34:6: error: register %r13 is only available in 64-bit mode
    pop %r13
        ^~~~
   lib/x86_64/handlers.S:35:6: error: register %r14 is only available in 64-bit mode
    pop %r14
        ^~~~
   lib/x86_64/handlers.S:36:6: error: register %r15 is only available in 64-bit mode
    pop %r15
        ^~~~
   lib/x86_64/handlers.S:39:11: error: register %rsp is only available in 64-bit mode
    add $16, %rsp
             ^~~~
>> lib/x86_64/handlers.S:40:2: error: instruction requires: 64-bit mode
    iretq
    ^
>> <instantiation>:10:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:24:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:26:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:38:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:40:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:52:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:54:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:66:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:68:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:80:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:82:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:94:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:96:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:108:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:110:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 8 - 8 + 1
    ^
   lib/x86_64/handlers.S:74:2: note: while in macro instantiation
    HANDLERS has_error=1 from=8 to=8
    ^
>> <instantiation>:10:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 9 - 9 + 1
    ^
   lib/x86_64/handlers.S:75:2: note: while in macro instantiation
    HANDLERS has_error=0 from=9 to=9
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 9 - 9 + 1
    ^
   lib/x86_64/handlers.S:75:2: note: while in macro instantiation
    HANDLERS has_error=0 from=9 to=9
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 14 - 10 + 1
    ^
   lib/x86_64/handlers.S:76:2: note: while in macro instantiation
    HANDLERS has_error=1 from=10 to=14
    ^
   <instantiation>:26:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 14 - 10 + 1
    ^
   lib/x86_64/handlers.S:76:2: note: while in macro instantiation
    HANDLERS has_error=1 from=10 to=14
    ^
   <instantiation>:40:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 14 - 10 + 1
    ^
   lib/x86_64/handlers.S:76:2: note: while in macro instantiation
    HANDLERS has_error=1 from=10 to=14
    ^
   <instantiation>:54:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 14 - 10 + 1
    ^
   lib/x86_64/handlers.S:76:2: note: while in macro instantiation
    HANDLERS has_error=1 from=10 to=14
    ^
   <instantiation>:68:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 14 - 10 + 1
    ^
   lib/x86_64/handlers.S:76:2: note: while in macro instantiation
    HANDLERS has_error=1 from=10 to=14
    ^
>> <instantiation>:10:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 16 - 15 + 1
    ^
   lib/x86_64/handlers.S:77:2: note: while in macro instantiation
    HANDLERS has_error=0 from=15 to=16
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 16 - 15 + 1
    ^
   lib/x86_64/handlers.S:77:2: note: while in macro instantiation
    HANDLERS has_error=0 from=15 to=16
    ^
   <instantiation>:24:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 16 - 15 + 1
    ^
   lib/x86_64/handlers.S:77:2: note: while in macro instantiation
    HANDLERS has_error=0 from=15 to=16
    ^
   <instantiation>:26:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 16 - 15 + 1
    ^
   lib/x86_64/handlers.S:77:2: note: while in macro instantiation
    HANDLERS has_error=0 from=15 to=16
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 17 - 17 + 1
    ^
   lib/x86_64/handlers.S:78:2: note: while in macro instantiation
    HANDLERS has_error=1 from=17 to=17
    ^
   <instantiation>:10:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 255 - 18 + 1
    ^
   lib/x86_64/handlers.S:79:2: note: while in macro instantiation
    HANDLERS has_error=0 from=18 to=255
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 255 - 18 + 1
    ^
   lib/x86_64/handlers.S:79:2: note: while in macro instantiation
    HANDLERS has_error=0 from=18 to=255
    ^
   <instantiation>:24:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 255 - 18 + 1
    ^
   lib/x86_64/handlers.S:79:2: note: while in macro instantiation
    HANDLERS has_error=0 from=18 to=255
    ^
   <instantiation>:26:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 255 - 18 + 1
    ^
   lib/x86_64/handlers.S:79:2: note: while in macro instantiation
    HANDLERS has_error=0 from=18 to=255
    ^
   <instantiation>:38:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 255 - 18 + 1
    ^
   lib/x86_64/handlers.S:79:2: note: while in macro instantiation
    HANDLERS has_error=0 from=18 to=255
    ^
   <instantiation>:40:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 255 - 18 + 1
    ^
   lib/x86_64/handlers.S:79:2: note: while in macro instantiation
    HANDLERS has_error=0 from=18 to=255
    ^
   <instantiation>:52:2: error: instruction requires: 64-bit mode
    pushq $0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
