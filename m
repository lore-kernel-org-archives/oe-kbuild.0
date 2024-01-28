Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644691391
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jan 2024 01:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706406676; cv=none; b=ZcsmCVI51eau/b8jJuIvgw8SJJtECuuCVIyr6HePiYClejUnx3P8FBUVydt8Og/ipPoHnys7OGv+qOpsryG2Er1HNbv+hvIKEL7ho3trlEaPseqaI3MDclcCOamxBbrw0kM0q/VBKWr5RfnWYQA7AlId4CglqhyjqSnRk0SdbjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706406676; c=relaxed/simple;
	bh=SexHL3BrYHynkJAzubgHwOnTnikm8zQpN1lJh1dDsNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vBfzURg9dcgUox6wxL89x/yz0LBlrRQ1bJzTk5idWwH8oWj8JXSnezyzUTJN0CAVKh2UYL9mrEDo+/K3g3Sc78DzUY1Zej0gCAFTqutr0H/2ENR/xQeiprC7qLMoiNhfkdEI2Mhkf0nUzxPQR6XvLBxSNWXZddYnnUKBn0qKhnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjd/WPfo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjd/WPfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706406674; x=1737942674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SexHL3BrYHynkJAzubgHwOnTnikm8zQpN1lJh1dDsNU=;
  b=jjd/WPfoZgHipS+b3EuuKiSzr1K4NwRT9Tfa0jqlWSMTBUYS1zZ1y+AC
   vgKybezvH1a7z1vLjrj8pj0xCqZngi47/ZJhq2lDRjew5IakG/uKeyILx
   +KrXG50NZ3iokxK4ulI7AddjRMvKqv9skJD5v2BP9rH34kTcMBpdQokaD
   orMUgpeF7X8qdp2nJHqTpPX1P2FCUGuFt6PEQX2icddryExAqWHlCPIlS
   yI9pcYu5w8o6PT4Lgq5y7AU3EJVWiPwcM18m+zpTFQii3PTYKzz8ArkQf
   FcIIXs3aPttS0QUMC9/NONF/rGrDuqdIvZYs/Y6R5EZfhbe889JF/8nZS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="2596799"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2596799"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 17:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="29172632"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jan 2024 17:51:11 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTuKB-0002y6-2u;
	Sun, 28 Jan 2024 01:51:07 +0000
Date: Sun, 28 Jan 2024 09:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [davidhildenbrand:fork_rmap_batching_mm_unstable 109/141]
 kernel/crash_core.c:127:1: warning: attribute declaration must precede
 definition
Message-ID: <202401280922.Ogz0wmUl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Baoquan He <bhe@redhat.com>
CC: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/davidhildenbrand/linux fork_rmap_batching_mm_unstable
head:   b652ec55c236cca5d0247cf66864971cc2ffea2d
commit: 1f4f7b3da75ca3b8c66b574f7341cae841e2fcd2 [109/141] ppc, crash: enforce KEXEC and KEXEC_FILE to select CRASH_DUMP
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-katmai_defconfig (https://download.01.org/0day-ci/archive/20240128/202401280922.Ogz0wmUl-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project a31a60074717fc40887cfe132b77eec93bedd307)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280922.Ogz0wmUl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401280922.Ogz0wmUl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/crash_core.c:43:11: error: incomplete definition of type 'struct kimage'
      43 |         if (image->type != KEXEC_TYPE_CRASH)
         |             ~~~~~^
   include/linux/crash_core.h:9:8: note: forward declaration of 'struct kimage'
       9 | struct kimage;
         |        ^
   kernel/crash_core.c:43:21: error: use of undeclared identifier 'KEXEC_TYPE_CRASH'
      43 |         if (image->type != KEXEC_TYPE_CRASH)
         |                            ^
   kernel/crash_core.c:55:20: error: call to undeclared function 'kimage_alloc_control_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      55 |         vmcoreinfo_page = kimage_alloc_control_pages(image, 0);
         |                           ^
   kernel/crash_core.c:55:18: error: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
      55 |         vmcoreinfo_page = kimage_alloc_control_pages(image, 0);
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/crash_core.c:66:7: error: incomplete definition of type 'struct kimage'
      66 |         image->vmcoreinfo_data_copy = safecopy;
         |         ~~~~~^
   include/linux/crash_core.h:9:8: note: forward declaration of 'struct kimage'
       9 | struct kimage;
         |        ^
   kernel/crash_core.c:74:5: error: redefinition of 'kexec_should_crash'
      74 | int kexec_should_crash(struct task_struct *p)
         |     ^
   include/linux/kexec.h:474:19: note: previous definition is here
     474 | static inline int kexec_should_crash(struct task_struct *p) { return 0; }
         |                   ^
   kernel/crash_core.c:92:5: error: redefinition of 'kexec_crash_loaded'
      92 | int kexec_crash_loaded(void)
         |     ^
   include/linux/kexec.h:475:19: note: previous definition is here
     475 | static inline int kexec_crash_loaded(void) { return 0; }
         |                   ^
   kernel/crash_core.c:94:11: error: use of undeclared identifier 'kexec_crash_image'
      94 |         return !!kexec_crash_image;
         |                  ^
   kernel/crash_core.c:103:16: error: redefinition of '__crash_kexec'
     103 | void __noclone __crash_kexec(struct pt_regs *regs)
         |                ^
   include/linux/kexec.h:472:20: note: previous definition is here
     472 | static inline void __crash_kexec(struct pt_regs *regs) { }
         |                    ^
   kernel/crash_core.c:114:7: error: use of undeclared identifier 'kexec_crash_image'
     114 |                 if (kexec_crash_image) {
         |                     ^
   kernel/crash_core.c:117:4: error: call to undeclared function 'crash_setup_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     117 |                         crash_setup_regs(&fixed_regs, regs);
         |                         ^
   kernel/crash_core.c:120:4: error: call to undeclared function 'machine_kexec'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     120 |                         machine_kexec(kexec_crash_image);
         |                         ^
   kernel/crash_core.c:120:18: error: use of undeclared identifier 'kexec_crash_image'
     120 |                         machine_kexec(kexec_crash_image);
         |                                       ^
>> kernel/crash_core.c:127:1: warning: attribute declaration must precede definition [-Wignored-attributes]
     127 | __bpf_kfunc void crash_kexec(struct pt_regs *regs)
         | ^
   include/linux/btf.h:85:21: note: expanded from macro '__bpf_kfunc'
      85 | #define __bpf_kfunc __used noinline
         |                     ^
   include/linux/compiler_attributes.h:350:56: note: expanded from macro '__used'
     350 | #define __used                          __attribute__((__used__))
         |                                                        ^
   include/linux/kexec.h:473:20: note: previous definition is here
     473 | static inline void crash_kexec(struct pt_regs *regs) { }
         |                    ^
>> kernel/crash_core.c:127:1: warning: attribute declaration must precede definition [-Wignored-attributes]
     127 | __bpf_kfunc void crash_kexec(struct pt_regs *regs)
         | ^
   include/linux/btf.h:85:28: note: expanded from macro '__bpf_kfunc'
      85 | #define __bpf_kfunc __used noinline
         |                            ^
   include/linux/compiler_attributes.h:244:56: note: expanded from macro 'noinline'
     244 | #define   noinline                      __attribute__((__noinline__))
         |                                                        ^
   include/linux/kexec.h:473:20: note: previous definition is here
     473 | static inline void crash_kexec(struct pt_regs *regs) { }
         |                    ^
   kernel/crash_core.c:127:18: error: redefinition of 'crash_kexec'
     127 | __bpf_kfunc void crash_kexec(struct pt_regs *regs)
         |                  ^
   include/linux/kexec.h:473:20: note: previous definition is here
     473 | static inline void crash_kexec(struct pt_regs *regs) { }
         |                    ^
   kernel/crash_core.c:356:2: error: call to undeclared function 'crash_free_reserved_phys_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     356 |         crash_free_reserved_phys_range(ram_res->start, ram_res->end);
         |         ^
   kernel/crash_core.c:370:6: error: use of undeclared identifier 'kexec_crash_image'
     370 |         if (kexec_crash_image) {
         |             ^
   kernel/crash_core.c:377:31: error: use of undeclared identifier 'KEXEC_CRASH_MEM_ALIGN'
     377 |         new_size = roundup(new_size, KEXEC_CRASH_MEM_ALIGN);
         |                                      ^
   kernel/crash_core.c:377:31: error: use of undeclared identifier 'KEXEC_CRASH_MEM_ALIGN'
   kernel/crash_core.c:437:29: error: use of undeclared identifier 'KEXEC_CORE_NOTE_NAME'
     437 |         buf = append_elf_note(buf, KEXEC_CORE_NOTE_NAME, NT_PRSTATUS,
         |                                    ^
   2 warnings and 19 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRASH_DUMP
   Depends on [n]: ARCH_SUPPORTS_CRASH_DUMP [=y] && KEXEC_CORE [=n]
   Selected by [y]:
   - ARCH_SELECTS_KEXEC [=y]


vim +127 kernel/crash_core.c

87d0e103c842b4 Baoquan He 2024-01-24   97  
87d0e103c842b4 Baoquan He 2024-01-24   98  /*
87d0e103c842b4 Baoquan He 2024-01-24   99   * No panic_cpu check version of crash_kexec().  This function is called
87d0e103c842b4 Baoquan He 2024-01-24  100   * only when panic_cpu holds the current CPU number; this is the only CPU
87d0e103c842b4 Baoquan He 2024-01-24  101   * which processes crash_kexec routines.
87d0e103c842b4 Baoquan He 2024-01-24  102   */
87d0e103c842b4 Baoquan He 2024-01-24  103  void __noclone __crash_kexec(struct pt_regs *regs)
87d0e103c842b4 Baoquan He 2024-01-24  104  {
87d0e103c842b4 Baoquan He 2024-01-24  105  	/* Take the kexec_lock here to prevent sys_kexec_load
87d0e103c842b4 Baoquan He 2024-01-24  106  	 * running on one cpu from replacing the crash kernel
87d0e103c842b4 Baoquan He 2024-01-24  107  	 * we are using after a panic on a different cpu.
87d0e103c842b4 Baoquan He 2024-01-24  108  	 *
87d0e103c842b4 Baoquan He 2024-01-24  109  	 * If the crash kernel was not located in a fixed area
87d0e103c842b4 Baoquan He 2024-01-24  110  	 * of memory the xchg(&kexec_crash_image) would be
87d0e103c842b4 Baoquan He 2024-01-24  111  	 * sufficient.  But since I reuse the memory...
87d0e103c842b4 Baoquan He 2024-01-24  112  	 */
87d0e103c842b4 Baoquan He 2024-01-24  113  	if (kexec_trylock()) {
87d0e103c842b4 Baoquan He 2024-01-24  114  		if (kexec_crash_image) {
87d0e103c842b4 Baoquan He 2024-01-24  115  			struct pt_regs fixed_regs;
87d0e103c842b4 Baoquan He 2024-01-24  116  
87d0e103c842b4 Baoquan He 2024-01-24 @117  			crash_setup_regs(&fixed_regs, regs);
87d0e103c842b4 Baoquan He 2024-01-24  118  			crash_save_vmcoreinfo();
87d0e103c842b4 Baoquan He 2024-01-24  119  			machine_crash_shutdown(&fixed_regs);
87d0e103c842b4 Baoquan He 2024-01-24  120  			machine_kexec(kexec_crash_image);
87d0e103c842b4 Baoquan He 2024-01-24  121  		}
87d0e103c842b4 Baoquan He 2024-01-24  122  		kexec_unlock();
87d0e103c842b4 Baoquan He 2024-01-24  123  	}
87d0e103c842b4 Baoquan He 2024-01-24  124  }
87d0e103c842b4 Baoquan He 2024-01-24  125  STACK_FRAME_NON_STANDARD(__crash_kexec);
87d0e103c842b4 Baoquan He 2024-01-24  126  
87d0e103c842b4 Baoquan He 2024-01-24 @127  __bpf_kfunc void crash_kexec(struct pt_regs *regs)
87d0e103c842b4 Baoquan He 2024-01-24  128  {
87d0e103c842b4 Baoquan He 2024-01-24  129  	int old_cpu, this_cpu;
87d0e103c842b4 Baoquan He 2024-01-24  130  
87d0e103c842b4 Baoquan He 2024-01-24  131  	/*
87d0e103c842b4 Baoquan He 2024-01-24  132  	 * Only one CPU is allowed to execute the crash_kexec() code as with
87d0e103c842b4 Baoquan He 2024-01-24  133  	 * panic().  Otherwise parallel calls of panic() and crash_kexec()
87d0e103c842b4 Baoquan He 2024-01-24  134  	 * may stop each other.  To exclude them, we use panic_cpu here too.
87d0e103c842b4 Baoquan He 2024-01-24  135  	 */
87d0e103c842b4 Baoquan He 2024-01-24  136  	old_cpu = PANIC_CPU_INVALID;
87d0e103c842b4 Baoquan He 2024-01-24  137  	this_cpu = raw_smp_processor_id();
87d0e103c842b4 Baoquan He 2024-01-24  138  
87d0e103c842b4 Baoquan He 2024-01-24  139  	if (atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu)) {
87d0e103c842b4 Baoquan He 2024-01-24  140  		/* This is the 1st CPU which comes here, so go ahead. */
87d0e103c842b4 Baoquan He 2024-01-24  141  		__crash_kexec(regs);
87d0e103c842b4 Baoquan He 2024-01-24  142  
87d0e103c842b4 Baoquan He 2024-01-24  143  		/*
87d0e103c842b4 Baoquan He 2024-01-24  144  		 * Reset panic_cpu to allow another panic()/crash_kexec()
87d0e103c842b4 Baoquan He 2024-01-24  145  		 * call.
87d0e103c842b4 Baoquan He 2024-01-24  146  		 */
87d0e103c842b4 Baoquan He 2024-01-24  147  		atomic_set(&panic_cpu, PANIC_CPU_INVALID);
87d0e103c842b4 Baoquan He 2024-01-24  148  	}
87d0e103c842b4 Baoquan He 2024-01-24  149  }
87d0e103c842b4 Baoquan He 2024-01-24  150  

:::::: The code at line 127 was first introduced by commit
:::::: 87d0e103c842b43a67f7a2b67757f2936ed39221 crash: split crash dumping code out from kexec_core.c

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: David Hildenbrand <david@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
