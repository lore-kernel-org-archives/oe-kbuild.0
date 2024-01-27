Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8853B210E5
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Jan 2024 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706356316; cv=none; b=XgNFBPxUIMm+I3W4vUYc867P+dPzd02kc8zX+hK4JShRohZWgsrPcHW6rieliDbkxAuUHu6tIo7kdxIw4227nkKaE18bz7GWwbMFS+yQy+n9uFD1I/QA2XA1ikLidIw4kExrp/AZu4IqdgkNF0dBuaR2ZEObdI0HBHhXNZVDVbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706356316; c=relaxed/simple;
	bh=jDRCKEEquLUYbz10eVxvkivI2fKzj6FeydXCuKXX2kU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YspvJM14l/aIBV+CTyTUkXliut91u8orDONYeHXBIL+pHnAInaYJQenGCFM05e1r0mLgCKD7ytChxVdBqM+Mbw/GNICrHlgjzGz4iwbenSeg+g3lFhlhGLhIgqw6POItm5XNbk1yJtqGD8rNqWm88Pm3BD9x+wBN+9S4zZ1v8rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkgBiv3S; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkgBiv3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706356314; x=1737892314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jDRCKEEquLUYbz10eVxvkivI2fKzj6FeydXCuKXX2kU=;
  b=fkgBiv3SRwvv7FPGokoRDy0ryPUFNhXB4fPybbG1503XHycZtq57O3TH
   4aglbplH9gVcVQN68Enih5pFQjhGrHpBq/1ciTegruVjDNIvwFZqaRzql
   eEal48kvlh8gRbAyazd7S3cHJeJW/k71F+OBGoABVSYQ570PAMfIOErmr
   ZMvyWBMxjDXkBBF8Gp+kANXvyaVaVC+WMAUWGv9+vG1JKUHLWOLUPqpTD
   rhKQy8hr2/XwQsfyGTfYnM8epfS4N2CFsnOToE+et9b8I9HlPD39qvjWH
   jV0O1Xt7GsEzq19wEK4ZOaY7ncFR/2HeeDcn2jIyjhyCtQiuoDK938TCT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9788313"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9788313"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 03:51:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="21626174"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2024 03:51:49 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rThDx-0002HO-0l;
	Sat, 27 Jan 2024 11:51:49 +0000
Date: Sat, 27 Jan 2024 19:51:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH linux-next v3 08/14] ppc, crash: enforce KEXEC and
 KEXEC_FILE to select CRASH_DUMP
Message-ID: <202401271906.ORpeFe0T-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240124051254.67105-9-bhe@redhat.com>
References: <20240124051254.67105-9-bhe@redhat.com>
TO: Baoquan He <bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240123]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec-split-crashkernel-reservation-code-out-from-crash_core-c/20240124-131952
base:   next-20240123
patch link:    https://lore.kernel.org/r/20240124051254.67105-9-bhe%40redhat.com
patch subject: [PATCH linux-next v3 08/14] ppc, crash: enforce KEXEC and KEXEC_FILE to select CRASH_DUMP
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240127/202401271906.ORpeFe0T-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401271906.ORpeFe0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401271906.ORpeFe0T-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/crash_core.c: In function 'kimage_crash_copy_vmcoreinfo':
>> kernel/crash_core.c:43:18: error: invalid use of undefined type 'struct kimage'
      43 |         if (image->type != KEXEC_TYPE_CRASH)
         |                  ^~
>> kernel/crash_core.c:43:28: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
      43 |         if (image->type != KEXEC_TYPE_CRASH)
         |                            ^~~~~~~~~~~~~~~~
         |                            KEXEC_ON_CRASH
   kernel/crash_core.c:43:28: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/crash_core.c:55:27: error: implicit declaration of function 'kimage_alloc_control_pages' [-Werror=implicit-function-declaration]
      55 |         vmcoreinfo_page = kimage_alloc_control_pages(image, 0);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/crash_core.c:55:25: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      55 |         vmcoreinfo_page = kimage_alloc_control_pages(image, 0);
         |                         ^
   kernel/crash_core.c:66:14: error: invalid use of undefined type 'struct kimage'
      66 |         image->vmcoreinfo_data_copy = safecopy;
         |              ^~
   kernel/crash_core.c: At top level:
>> kernel/crash_core.c:74:5: error: redefinition of 'kexec_should_crash'
      74 | int kexec_should_crash(struct task_struct *p)
         |     ^~~~~~~~~~~~~~~~~~
   In file included from kernel/crash_core.c:12:
   include/linux/kexec.h:474:19: note: previous definition of 'kexec_should_crash' with type 'int(struct task_struct *)'
     474 | static inline int kexec_should_crash(struct task_struct *p) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~
>> kernel/crash_core.c:92:5: error: redefinition of 'kexec_crash_loaded'
      92 | int kexec_crash_loaded(void)
         |     ^~~~~~~~~~~~~~~~~~
   include/linux/kexec.h:475:19: note: previous definition of 'kexec_crash_loaded' with type 'int(void)'
     475 | static inline int kexec_crash_loaded(void) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~
   kernel/crash_core.c: In function 'kexec_crash_loaded':
>> kernel/crash_core.c:94:18: error: 'kexec_crash_image' undeclared (first use in this function); did you mean 'kexec_crash_loaded'?
      94 |         return !!kexec_crash_image;
         |                  ^~~~~~~~~~~~~~~~~
         |                  kexec_crash_loaded
   kernel/crash_core.c: At top level:
>> kernel/crash_core.c:103:16: error: redefinition of '__crash_kexec'
     103 | void __noclone __crash_kexec(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~
   include/linux/kexec.h:472:20: note: previous definition of '__crash_kexec' with type 'void(struct pt_regs *)'
     472 | static inline void __crash_kexec(struct pt_regs *regs) { }
         |                    ^~~~~~~~~~~~~
   kernel/crash_core.c: In function '__crash_kexec':
   kernel/crash_core.c:114:21: error: 'kexec_crash_image' undeclared (first use in this function); did you mean 'kexec_crash_loaded'?
     114 |                 if (kexec_crash_image) {
         |                     ^~~~~~~~~~~~~~~~~
         |                     kexec_crash_loaded
>> kernel/crash_core.c:117:25: error: implicit declaration of function 'crash_setup_regs' [-Werror=implicit-function-declaration]
     117 |                         crash_setup_regs(&fixed_regs, regs);
         |                         ^~~~~~~~~~~~~~~~
>> kernel/crash_core.c:120:25: error: implicit declaration of function 'machine_kexec' [-Werror=implicit-function-declaration]
     120 |                         machine_kexec(kexec_crash_image);
         |                         ^~~~~~~~~~~~~
   kernel/crash_core.c: At top level:
>> kernel/crash_core.c:128:1: warning: ignoring attribute 'noinline' because it conflicts with attribute 'gnu_inline' [-Wattributes]
     128 | {
         | ^
   include/linux/kexec.h:473:20: note: previous declaration here
     473 | static inline void crash_kexec(struct pt_regs *regs) { }
         |                    ^~~~~~~~~~~
>> kernel/crash_core.c:127:18: error: redefinition of 'crash_kexec'
     127 | __bpf_kfunc void crash_kexec(struct pt_regs *regs)
         |                  ^~~~~~~~~~~
   include/linux/kexec.h:473:20: note: previous definition of 'crash_kexec' with type 'void(struct pt_regs *)'
     473 | static inline void crash_kexec(struct pt_regs *regs) { }
         |                    ^~~~~~~~~~~
   kernel/crash_core.c: In function '__crash_shrink_memory':
>> kernel/crash_core.c:356:9: error: implicit declaration of function 'crash_free_reserved_phys_range' [-Werror=implicit-function-declaration]
     356 |         crash_free_reserved_phys_range(ram_res->start, ram_res->end);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/crash_core.c: In function 'crash_shrink_memory':
   kernel/crash_core.c:370:13: error: 'kexec_crash_image' undeclared (first use in this function); did you mean 'kexec_crash_loaded'?
     370 |         if (kexec_crash_image) {
         |             ^~~~~~~~~~~~~~~~~
         |             kexec_crash_loaded
   In file included from include/linux/kernel.h:27,
                    from arch/powerpc/include/asm/page.h:11,
                    from arch/powerpc/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60,
                    from arch/powerpc/include/asm/processor.h:41,
                    from include/linux/sched.h:13,
                    from include/linux/utsname.h:6,
                    from kernel/crash_core.c:9:
>> kernel/crash_core.c:377:38: error: 'KEXEC_CRASH_MEM_ALIGN' undeclared (first use in this function)
     377 |         new_size = roundup(new_size, KEXEC_CRASH_MEM_ALIGN);
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:61:16: note: in definition of macro 'roundup'
      61 |         typeof(y) __y = y;                              \
         |                ^
   kernel/crash_core.c: In function 'crash_save_cpu':
>> kernel/crash_core.c:437:36: error: 'KEXEC_CORE_NOTE_NAME' undeclared (first use in this function); did you mean 'CRASH_CORE_NOTE_NAME'?
     437 |         buf = append_elf_note(buf, KEXEC_CORE_NOTE_NAME, NT_PRSTATUS,
         |                                    ^~~~~~~~~~~~~~~~~~~~
         |                                    CRASH_CORE_NOTE_NAME
   kernel/crash_core.c: In function 'kexec_crash_loaded':
>> kernel/crash_core.c:95:1: warning: control reaches end of non-void function [-Wreturn-type]
      95 | }
         | ^
   cc1: some warnings being treated as errors
--
>> arch/powerpc/kernel/crash_dump.c:101:6: error: redefinition of 'is_kdump_kernel'
     101 | bool is_kdump_kernel(void)
         |      ^~~~~~~~~~~~~~~
   In file included from arch/powerpc/kernel/crash_dump.c:12:
   include/linux/crash_dump.h:64:20: note: previous definition of 'is_kdump_kernel' with type 'bool(void)' {aka '_Bool(void)'}
      64 | static inline bool is_kdump_kernel(void)
         |                    ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRASH_DUMP
   Depends on [n]: ARCH_SUPPORTS_CRASH_DUMP [=y] && KEXEC_CORE [=n]
   Selected by [y]:
   - ARCH_SELECTS_KEXEC [=y]


vim +43 kernel/crash_core.c

636be0013152f6 Baoquan He 2024-01-24   35  
636be0013152f6 Baoquan He 2024-01-24   36  int kimage_crash_copy_vmcoreinfo(struct kimage *image)
636be0013152f6 Baoquan He 2024-01-24   37  {
636be0013152f6 Baoquan He 2024-01-24   38  	struct page *vmcoreinfo_page;
636be0013152f6 Baoquan He 2024-01-24   39  	void *safecopy;
636be0013152f6 Baoquan He 2024-01-24   40  
636be0013152f6 Baoquan He 2024-01-24   41  	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
636be0013152f6 Baoquan He 2024-01-24   42  		return 0;
636be0013152f6 Baoquan He 2024-01-24  @43  	if (image->type != KEXEC_TYPE_CRASH)
636be0013152f6 Baoquan He 2024-01-24   44  		return 0;
636be0013152f6 Baoquan He 2024-01-24   45  
636be0013152f6 Baoquan He 2024-01-24   46  	/*
636be0013152f6 Baoquan He 2024-01-24   47  	 * For kdump, allocate one vmcoreinfo safe copy from the
636be0013152f6 Baoquan He 2024-01-24   48  	 * crash memory. as we have arch_kexec_protect_crashkres()
636be0013152f6 Baoquan He 2024-01-24   49  	 * after kexec syscall, we naturally protect it from write
636be0013152f6 Baoquan He 2024-01-24   50  	 * (even read) access under kernel direct mapping. But on
636be0013152f6 Baoquan He 2024-01-24   51  	 * the other hand, we still need to operate it when crash
636be0013152f6 Baoquan He 2024-01-24   52  	 * happens to generate vmcoreinfo note, hereby we rely on
636be0013152f6 Baoquan He 2024-01-24   53  	 * vmap for this purpose.
636be0013152f6 Baoquan He 2024-01-24   54  	 */
636be0013152f6 Baoquan He 2024-01-24  @55  	vmcoreinfo_page = kimage_alloc_control_pages(image, 0);
636be0013152f6 Baoquan He 2024-01-24   56  	if (!vmcoreinfo_page) {
636be0013152f6 Baoquan He 2024-01-24   57  		pr_warn("Could not allocate vmcoreinfo buffer\n");
636be0013152f6 Baoquan He 2024-01-24   58  		return -ENOMEM;
636be0013152f6 Baoquan He 2024-01-24   59  	}
636be0013152f6 Baoquan He 2024-01-24   60  	safecopy = vmap(&vmcoreinfo_page, 1, VM_MAP, PAGE_KERNEL);
636be0013152f6 Baoquan He 2024-01-24   61  	if (!safecopy) {
636be0013152f6 Baoquan He 2024-01-24   62  		pr_warn("Could not vmap vmcoreinfo buffer\n");
636be0013152f6 Baoquan He 2024-01-24   63  		return -ENOMEM;
636be0013152f6 Baoquan He 2024-01-24   64  	}
636be0013152f6 Baoquan He 2024-01-24   65  
636be0013152f6 Baoquan He 2024-01-24   66  	image->vmcoreinfo_data_copy = safecopy;
636be0013152f6 Baoquan He 2024-01-24   67  	crash_update_vmcoreinfo_safecopy(safecopy);
636be0013152f6 Baoquan He 2024-01-24   68  
636be0013152f6 Baoquan He 2024-01-24   69  	return 0;
636be0013152f6 Baoquan He 2024-01-24   70  }
636be0013152f6 Baoquan He 2024-01-24   71  
636be0013152f6 Baoquan He 2024-01-24   72  
636be0013152f6 Baoquan He 2024-01-24   73  
636be0013152f6 Baoquan He 2024-01-24  @74  int kexec_should_crash(struct task_struct *p)
636be0013152f6 Baoquan He 2024-01-24   75  {
636be0013152f6 Baoquan He 2024-01-24   76  	/*
636be0013152f6 Baoquan He 2024-01-24   77  	 * If crash_kexec_post_notifiers is enabled, don't run
636be0013152f6 Baoquan He 2024-01-24   78  	 * crash_kexec() here yet, which must be run after panic
636be0013152f6 Baoquan He 2024-01-24   79  	 * notifiers in panic().
636be0013152f6 Baoquan He 2024-01-24   80  	 */
636be0013152f6 Baoquan He 2024-01-24   81  	if (crash_kexec_post_notifiers)
636be0013152f6 Baoquan He 2024-01-24   82  		return 0;
636be0013152f6 Baoquan He 2024-01-24   83  	/*
636be0013152f6 Baoquan He 2024-01-24   84  	 * There are 4 panic() calls in make_task_dead() path, each of which
636be0013152f6 Baoquan He 2024-01-24   85  	 * corresponds to each of these 4 conditions.
636be0013152f6 Baoquan He 2024-01-24   86  	 */
636be0013152f6 Baoquan He 2024-01-24   87  	if (in_interrupt() || !p->pid || is_global_init(p) || panic_on_oops)
636be0013152f6 Baoquan He 2024-01-24   88  		return 1;
636be0013152f6 Baoquan He 2024-01-24   89  	return 0;
636be0013152f6 Baoquan He 2024-01-24   90  }
636be0013152f6 Baoquan He 2024-01-24   91  
636be0013152f6 Baoquan He 2024-01-24  @92  int kexec_crash_loaded(void)
636be0013152f6 Baoquan He 2024-01-24   93  {
636be0013152f6 Baoquan He 2024-01-24  @94  	return !!kexec_crash_image;
636be0013152f6 Baoquan He 2024-01-24  @95  }
636be0013152f6 Baoquan He 2024-01-24   96  EXPORT_SYMBOL_GPL(kexec_crash_loaded);
636be0013152f6 Baoquan He 2024-01-24   97  
636be0013152f6 Baoquan He 2024-01-24   98  /*
636be0013152f6 Baoquan He 2024-01-24   99   * No panic_cpu check version of crash_kexec().  This function is called
636be0013152f6 Baoquan He 2024-01-24  100   * only when panic_cpu holds the current CPU number; this is the only CPU
636be0013152f6 Baoquan He 2024-01-24  101   * which processes crash_kexec routines.
636be0013152f6 Baoquan He 2024-01-24  102   */
636be0013152f6 Baoquan He 2024-01-24 @103  void __noclone __crash_kexec(struct pt_regs *regs)
636be0013152f6 Baoquan He 2024-01-24  104  {
636be0013152f6 Baoquan He 2024-01-24  105  	/* Take the kexec_lock here to prevent sys_kexec_load
636be0013152f6 Baoquan He 2024-01-24  106  	 * running on one cpu from replacing the crash kernel
636be0013152f6 Baoquan He 2024-01-24  107  	 * we are using after a panic on a different cpu.
636be0013152f6 Baoquan He 2024-01-24  108  	 *
636be0013152f6 Baoquan He 2024-01-24  109  	 * If the crash kernel was not located in a fixed area
636be0013152f6 Baoquan He 2024-01-24  110  	 * of memory the xchg(&kexec_crash_image) would be
636be0013152f6 Baoquan He 2024-01-24  111  	 * sufficient.  But since I reuse the memory...
636be0013152f6 Baoquan He 2024-01-24  112  	 */
636be0013152f6 Baoquan He 2024-01-24  113  	if (kexec_trylock()) {
636be0013152f6 Baoquan He 2024-01-24  114  		if (kexec_crash_image) {
636be0013152f6 Baoquan He 2024-01-24  115  			struct pt_regs fixed_regs;
636be0013152f6 Baoquan He 2024-01-24  116  
636be0013152f6 Baoquan He 2024-01-24 @117  			crash_setup_regs(&fixed_regs, regs);
636be0013152f6 Baoquan He 2024-01-24  118  			crash_save_vmcoreinfo();
636be0013152f6 Baoquan He 2024-01-24  119  			machine_crash_shutdown(&fixed_regs);
636be0013152f6 Baoquan He 2024-01-24 @120  			machine_kexec(kexec_crash_image);
636be0013152f6 Baoquan He 2024-01-24  121  		}
636be0013152f6 Baoquan He 2024-01-24  122  		kexec_unlock();
636be0013152f6 Baoquan He 2024-01-24  123  	}
636be0013152f6 Baoquan He 2024-01-24  124  }
636be0013152f6 Baoquan He 2024-01-24  125  STACK_FRAME_NON_STANDARD(__crash_kexec);
636be0013152f6 Baoquan He 2024-01-24  126  
636be0013152f6 Baoquan He 2024-01-24 @127  __bpf_kfunc void crash_kexec(struct pt_regs *regs)
636be0013152f6 Baoquan He 2024-01-24 @128  {
636be0013152f6 Baoquan He 2024-01-24  129  	int old_cpu, this_cpu;
636be0013152f6 Baoquan He 2024-01-24  130  
636be0013152f6 Baoquan He 2024-01-24  131  	/*
636be0013152f6 Baoquan He 2024-01-24  132  	 * Only one CPU is allowed to execute the crash_kexec() code as with
636be0013152f6 Baoquan He 2024-01-24  133  	 * panic().  Otherwise parallel calls of panic() and crash_kexec()
636be0013152f6 Baoquan He 2024-01-24  134  	 * may stop each other.  To exclude them, we use panic_cpu here too.
636be0013152f6 Baoquan He 2024-01-24  135  	 */
636be0013152f6 Baoquan He 2024-01-24  136  	old_cpu = PANIC_CPU_INVALID;
636be0013152f6 Baoquan He 2024-01-24  137  	this_cpu = raw_smp_processor_id();
636be0013152f6 Baoquan He 2024-01-24  138  
636be0013152f6 Baoquan He 2024-01-24  139  	if (atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu)) {
636be0013152f6 Baoquan He 2024-01-24  140  		/* This is the 1st CPU which comes here, so go ahead. */
636be0013152f6 Baoquan He 2024-01-24  141  		__crash_kexec(regs);
636be0013152f6 Baoquan He 2024-01-24  142  
636be0013152f6 Baoquan He 2024-01-24  143  		/*
636be0013152f6 Baoquan He 2024-01-24  144  		 * Reset panic_cpu to allow another panic()/crash_kexec()
636be0013152f6 Baoquan He 2024-01-24  145  		 * call.
636be0013152f6 Baoquan He 2024-01-24  146  		 */
636be0013152f6 Baoquan He 2024-01-24  147  		atomic_set(&panic_cpu, PANIC_CPU_INVALID);
636be0013152f6 Baoquan He 2024-01-24  148  	}
636be0013152f6 Baoquan He 2024-01-24  149  }
636be0013152f6 Baoquan He 2024-01-24  150  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
