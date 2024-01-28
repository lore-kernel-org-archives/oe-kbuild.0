Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6106223773
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jan 2024 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706451213; cv=none; b=BPxtEBPZC9XjEW4z98G4zFMV2RZWe0FlVLV/zIGZWKxi32848Y6yGtYUUyZm/AjY+yuDEa5Z+BIakpyifgsYJxfUUrUCdL1BFeB3fB4KAYeM+I6Opqc1DGTCg5QAhgXWWNvWEH9G0snuKgI4zCUMEGpwJ9QYTNJTEwbGv/a3tQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706451213; c=relaxed/simple;
	bh=NToU8ihXwC9Hhu2d6d1RKFiJicqyQUVCy69m3wZV9xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tK/viaGDW7P2AOIFwJehwdI27sFvIJA9Z/JFEV9bTQA0JqHhuNv5vAb34TR+CLhfOWZkJpzsxgIZvGg0vOhe6uWpKd0QEK5y1sbJTDQJoTRumYOu0t6IRAZc4KbcGU4UclTdyWF9KWU8Vfy9DAU+7Ft8hLHB0rSUU4gSjvSlQgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHJxIrzf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHJxIrzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706451211; x=1737987211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NToU8ihXwC9Hhu2d6d1RKFiJicqyQUVCy69m3wZV9xg=;
  b=kHJxIrzfxndDaWiRs/UrikzLZf0D4um2Pj+MpRaYZ281wV1d3UKgJmvp
   vlVagkuNw51zGSf7n6jhhQD8z9VYfOXBFRhR1bn6mHL5VHpr/PoY50CYm
   sE+cj5nv6Ns3LmTkPJcSCkFX62MEt+YklpzdjMkE1qmBPSvyrCfcjB1YG
   0cPnvZ3T8H4/SL7+Xktxl+JGx55xA54/+5Mg0uhavwDhRmDkm7AU7k38W
   GcYqXMwvU9jbIkEYYGMj/+YSIjZNytGMK7CUWCYPqgxYJpd/2OJvMPlQ/
   7Va7mQR3TbURLCWAUYHE72wSkPZZwSWlVJSOzGxUltupe6NgxCTYsFG8/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="2605359"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2605359"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 06:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="857854988"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="857854988"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jan 2024 06:13:29 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU5uZ-0003SD-04;
	Sun, 28 Jan 2024 14:13:27 +0000
Date: Sun, 28 Jan 2024 22:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/kernel/process.c:96:14: warning: variable 'buf' set but not
 used
Message-ID: <202401282225.6QDkMNhg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a696a29c6905594e4abf78eaafcb62165ac61f1
commit: b1fbfcb4a20949df08dd995927cdc5ad220c128d kbuild: make single target builds even faster
date:   4 years, 2 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 years, 2 months ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240128/202401282225.6QDkMNhg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401282225.6QDkMNhg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401282225.6QDkMNhg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm/kernel/process.c: In function '__show_regs':
>> arch/arm/kernel/process.c:96:14: warning: variable 'buf' set but not used [-Wunused-but-set-variable]
      96 |         char buf[64];
         |              ^~~
--
   arch/arm/kernel/setup.c: In function 'early_print':
   arch/arm/kernel/setup.c:370:9: warning: function 'early_print' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     370 |         vsnprintf(buf, sizeof(buf), str, ap);
         |         ^~~~~~~~~
   In file included from arch/arm/include/asm/efi.h:12,
                    from arch/arm/kernel/setup.c:36:
   arch/arm/include/asm/fixmap.h: At top level:
>> arch/arm/include/asm/fixmap.h:39:35: warning: '__end_of_fixed_addresses' defined but not used [-Wunused-const-variable=]
      39 | static const enum fixed_addresses __end_of_fixed_addresses =
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/include/asm/page.h:160,
                    from arch/arm/include/asm/thread_info.h:14,
                    from include/linux/thread_info.h:38,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/efi.h:17,
                    from arch/arm/kernel/setup.c:7:
   arch/arm/kernel/setup.c: In function 'request_standard_resources':
   arch/arm/include/asm/memory.h:279:22: warning: array subscript -1 is outside array bounds of 'char[2147483647]' [-Warray-bounds=]
     279 | #define virt_to_phys virt_to_phys
   arch/arm/kernel/setup.c:850:31: note: in expansion of macro 'virt_to_phys'
     850 |         kernel_code.end     = virt_to_phys(__init_begin - 1);
         |                               ^~~~~~~~~~~~
   In file included from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from include/uapi/linux/elfcore.h:8,
                    from include/linux/elfcore.h:10,
                    from include/linux/crash_core.h:6,
                    from include/linux/kexec.h:18,
                    from arch/arm/kernel/setup.c:20:
   include/linux/mm.h:2117:21: note: at offset -1 into object '__init_begin' of size [0, 2147483647]
    2117 |         extern char __init_begin[], __init_end[];
         |                     ^~~~~~~~~~~~
   arch/arm/include/asm/memory.h:279:22: warning: array subscript -1 is outside array bounds of 'char[2147483647]' [-Warray-bounds=]
     279 | #define virt_to_phys virt_to_phys
   arch/arm/kernel/setup.c:852:31: note: in expansion of macro 'virt_to_phys'
     852 |         kernel_data.end     = virt_to_phys(_end - 1);
         |                               ^~~~~~~~~~~~
   In file included from arch/arm/include/asm/sections.h:5,
                    from include/linux/interrupt.h:20,
                    from include/linux/rtc.h:17,
                    from include/linux/efi.h:20:
   include/asm-generic/sections.h:41:13: note: at offset -1 into object '_end' of size [0, 2147483647]
      41 | extern char _end[];
         |             ^~~~
--
   arch/arm/kernel/signal.c: In function 'restore_sigframe':
>> arch/arm/kernel/signal.c:176:22: warning: variable 'aux' set but not used [-Wunused-but-set-variable]
     176 |         char __user *aux;
         |                      ^~~
   arch/arm/kernel/signal.c: At top level:
   arch/arm/kernel/signal.c:224:16: warning: no previous prototype for 'sys_sigreturn' [-Wmissing-prototypes]
     224 | asmlinkage int sys_sigreturn(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~
   arch/arm/kernel/signal.c:254:16: warning: no previous prototype for 'sys_rt_sigreturn' [-Wmissing-prototypes]
     254 | asmlinkage int sys_rt_sigreturn(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~~~~
   arch/arm/kernel/signal.c:643:1: warning: no previous prototype for 'do_work_pending' [-Wmissing-prototypes]
     643 | do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
         | ^~~~~~~~~~~~~~~
   arch/arm/kernel/signal.c:683:14: warning: no previous prototype for 'get_signal_page' [-Wmissing-prototypes]
     683 | struct page *get_signal_page(void)
         |              ^~~~~~~~~~~~~~~
   arch/arm/kernel/signal.c:714:17: warning: no previous prototype for 'addr_limit_check_failed' [-Wmissing-prototypes]
     714 | asmlinkage void addr_limit_check_failed(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
--
>> arch/arm/kernel/time.c:101:13: warning: no previous prototype for 'time_init' [-Wmissing-prototypes]
     101 | void __init time_init(void)
         |             ^~~~~~~~~
--
>> arch/arm/kernel/traps.c:77:6: warning: no previous prototype for 'dump_backtrace_stm' [-Wmissing-prototypes]
      77 | void dump_backtrace_stm(u32 *stack, u32 instruction)
         |      ^~~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:436:17: warning: no previous prototype for 'do_undefinstr' [-Wmissing-prototypes]
     436 | asmlinkage void do_undefinstr(struct pt_regs *regs)
         |                 ^~~~~~~~~~~~~
   arch/arm/kernel/traps.c:501:39: warning: no previous prototype for 'handle_fiq_as_nmi' [-Wmissing-prototypes]
     501 | asmlinkage void __exception_irq_entry handle_fiq_as_nmi(struct pt_regs *regs)
         |                                       ^~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:520:17: warning: no previous prototype for 'bad_mode' [-Wmissing-prototypes]
     520 | asmlinkage void bad_mode(struct pt_regs *regs, int reason)
         |                 ^~~~~~~~
   arch/arm/kernel/traps.c:593:16: warning: no previous prototype for 'arm_syscall' [-Wmissing-prototypes]
     593 | asmlinkage int arm_syscall(int no, struct pt_regs *regs)
         |                ^~~~~~~~~~~
   arch/arm/kernel/traps.c:719:1: warning: no previous prototype for 'baddataabort' [-Wmissing-prototypes]
     719 | baddataabort(int code, unsigned long instr, struct pt_regs *regs)
         | ^~~~~~~~~~~~
>> arch/arm/kernel/traps.c:744:6: warning: no previous prototype for '__pte_error' [-Wmissing-prototypes]
     744 | void __pte_error(const char *file, int line, pte_t pte)
         |      ^~~~~~~~~~~
>> arch/arm/kernel/traps.c:749:6: warning: no previous prototype for '__pmd_error' [-Wmissing-prototypes]
     749 | void __pmd_error(const char *file, int line, pmd_t pmd)
         |      ^~~~~~~~~~~
>> arch/arm/kernel/traps.c:754:6: warning: no previous prototype for '__pgd_error' [-Wmissing-prototypes]
     754 | void __pgd_error(const char *file, int line, pgd_t pgd)
         |      ^~~~~~~~~~~
   arch/arm/kernel/traps.c:759:17: warning: no previous prototype for '__div0' [-Wmissing-prototypes]
     759 | asmlinkage void __div0(void)
         |                 ^~~~~~
>> arch/arm/kernel/traps.c:766:6: warning: no previous prototype for 'abort' [-Wmissing-prototypes]
     766 | void abort(void)
         |      ^~~~~
   arch/arm/kernel/traps.c:774:13: warning: no previous prototype for 'trap_init' [-Wmissing-prototypes]
     774 | void __init trap_init(void)
         |             ^~~~~~~~~
--
>> arch/arm/kernel/unwind.c:40:6: warning: no previous prototype for '__aeabi_unwind_cpp_pr0' [-Wmissing-prototypes]
      40 | void __aeabi_unwind_cpp_pr0(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/kernel/unwind.c:45:6: warning: no previous prototype for '__aeabi_unwind_cpp_pr1' [-Wmissing-prototypes]
      45 | void __aeabi_unwind_cpp_pr1(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/kernel/unwind.c:50:6: warning: no previous prototype for '__aeabi_unwind_cpp_pr2' [-Wmissing-prototypes]
      50 | void __aeabi_unwind_cpp_pr2(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
>> arch/arm/mm/init.c:108:13: warning: no previous prototype for 'setup_dma_zone' [-Wmissing-prototypes]
     108 | void __init setup_dma_zone(const struct machine_desc *mdesc)
         |             ^~~~~~~~~~~~~~
   In file included from arch/arm/mm/init.c:35:
>> arch/arm/include/asm/fixmap.h:39:35: warning: '__end_of_fixed_addresses' defined but not used [-Wunused-const-variable=]
      39 | static const enum fixed_addresses __end_of_fixed_addresses =
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> arch/arm/mm/nommu.c:136:13: warning: no previous prototype for 'adjust_lowmem_bounds' [-Wmissing-prototypes]
     136 | void __init adjust_lowmem_bounds(void)
         |             ^~~~~~~~~~~~~~~~~~~~
>> arch/arm/mm/nommu.c:149:13: warning: no previous prototype for 'paging_init' [-Wmissing-prototypes]
     149 | void __init paging_init(const struct machine_desc *mdesc)
         |             ^~~~~~~~~~~
>> arch/arm/mm/nommu.c:159:6: warning: no previous prototype for 'setup_mm_for_reboot' [-Wmissing-prototypes]
     159 | void setup_mm_for_reboot(void)
         |      ^~~~~~~~~~~~~~~~~~~
--
>> arch/arm/mm/init.c:624: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * update_sections_early intended to be called only through stop_machine
--
   In file included from mm/early_ioremap.c:18:
>> arch/arm/include/asm/fixmap.h:39:35: warning: '__end_of_fixed_addresses' defined but not used [-Wunused-const-variable=]
      39 | static const enum fixed_addresses __end_of_fixed_addresses =
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> arch/arm/lib/delay.c:96:15: warning: no previous prototype for 'calibrate_delay_is_known' [-Wmissing-prototypes]
      96 | unsigned long calibrate_delay_is_known(void)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/buf +96 arch/arm/kernel/process.c

f7b861b7a6d9d1 Thomas Gleixner    2013-03-21   92  
652a12ef98d16c Russell King       2005-04-17   93  void __show_regs(struct pt_regs *regs)
^1da177e4c3f41 Linus Torvalds     2005-04-16   94  {
154c772ebfb12e Russell King       2007-06-18   95  	unsigned long flags;
154c772ebfb12e Russell King       2007-06-18  @96  	char buf[64];
77f1b959b0b6db Russell King       2015-12-03   97  #ifndef CONFIG_CPU_V7M
e6978e4bf181fb Russell King       2016-05-13   98  	unsigned int domain, fs;
77f1b959b0b6db Russell King       2015-12-03   99  #ifdef CONFIG_CPU_SW_DOMAIN_PAN
77f1b959b0b6db Russell King       2015-12-03  100  	/*
77f1b959b0b6db Russell King       2015-12-03  101  	 * Get the domain register for the parent context. In user
77f1b959b0b6db Russell King       2015-12-03  102  	 * mode, we don't save the DACR, so lets use what it should
77f1b959b0b6db Russell King       2015-12-03  103  	 * be. For other modes, we place it after the pt_regs struct.
77f1b959b0b6db Russell King       2015-12-03  104  	 */
e6978e4bf181fb Russell King       2016-05-13  105  	if (user_mode(regs)) {
77f1b959b0b6db Russell King       2015-12-03  106  		domain = DACR_UACCESS_ENABLE;
e6978e4bf181fb Russell King       2016-05-13  107  		fs = get_fs();
e6978e4bf181fb Russell King       2016-05-13  108  	} else {
5fa9da5043a81b Russell King       2016-05-13  109  		domain = to_svc_pt_regs(regs)->dacr;
e6978e4bf181fb Russell King       2016-05-13  110  		fs = to_svc_pt_regs(regs)->addr_limit;
e6978e4bf181fb Russell King       2016-05-13  111  	}
77f1b959b0b6db Russell King       2015-12-03  112  #else
77f1b959b0b6db Russell King       2015-12-03  113  	domain = get_domain();
e6978e4bf181fb Russell King       2016-05-13  114  	fs = get_fs();
77f1b959b0b6db Russell King       2015-12-03  115  #endif
77f1b959b0b6db Russell King       2015-12-03  116  #endif
^1da177e4c3f41 Linus Torvalds     2005-04-16  117  
a43cb95d547a06 Tejun Heo          2013-04-30  118  	show_regs_print_info(KERN_DEFAULT);
a43cb95d547a06 Tejun Heo          2013-04-30  119  
3ea70d7ddbddef Sergey Senozhatsky 2017-12-11  120  	printk("PC is at %pS\n", (void *)instruction_pointer(regs));
3ea70d7ddbddef Sergey Senozhatsky 2017-12-11  121  	printk("LR is at %pS\n", (void *)regs->ARM_lr);
801f19b9515fb6 Joe Perches        2017-05-04  122  	printk("pc : [<%08lx>]    lr : [<%08lx>]    psr: %08lx\n",
801f19b9515fb6 Joe Perches        2017-05-04  123  	       regs->ARM_pc, regs->ARM_lr, regs->ARM_cpsr);
801f19b9515fb6 Joe Perches        2017-05-04  124  	printk("sp : %08lx  ip : %08lx  fp : %08lx\n",
154c772ebfb12e Russell King       2007-06-18  125  	       regs->ARM_sp, regs->ARM_ip, regs->ARM_fp);
^1da177e4c3f41 Linus Torvalds     2005-04-16  126  	printk("r10: %08lx  r9 : %08lx  r8 : %08lx\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  127  		regs->ARM_r10, regs->ARM_r9,
^1da177e4c3f41 Linus Torvalds     2005-04-16  128  		regs->ARM_r8);
^1da177e4c3f41 Linus Torvalds     2005-04-16  129  	printk("r7 : %08lx  r6 : %08lx  r5 : %08lx  r4 : %08lx\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  130  		regs->ARM_r7, regs->ARM_r6,
^1da177e4c3f41 Linus Torvalds     2005-04-16  131  		regs->ARM_r5, regs->ARM_r4);
^1da177e4c3f41 Linus Torvalds     2005-04-16  132  	printk("r3 : %08lx  r2 : %08lx  r1 : %08lx  r0 : %08lx\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  133  		regs->ARM_r3, regs->ARM_r2,
^1da177e4c3f41 Linus Torvalds     2005-04-16  134  		regs->ARM_r1, regs->ARM_r0);
154c772ebfb12e Russell King       2007-06-18  135  
154c772ebfb12e Russell King       2007-06-18  136  	flags = regs->ARM_cpsr;
154c772ebfb12e Russell King       2007-06-18  137  	buf[0] = flags & PSR_N_BIT ? 'N' : 'n';
154c772ebfb12e Russell King       2007-06-18  138  	buf[1] = flags & PSR_Z_BIT ? 'Z' : 'z';
154c772ebfb12e Russell King       2007-06-18  139  	buf[2] = flags & PSR_C_BIT ? 'C' : 'c';
154c772ebfb12e Russell King       2007-06-18  140  	buf[3] = flags & PSR_V_BIT ? 'V' : 'v';
154c772ebfb12e Russell King       2007-06-18  141  	buf[4] = '\0';
154c772ebfb12e Russell King       2007-06-18  142  

:::::: The code at line 96 was first introduced by commit
:::::: 154c772ebfb12ef66855510e6be2b12c85110b0c [ARM] Update show_regs/oops register format

:::::: TO: Russell King <rmk@dyn-67.arm.linux.org.uk>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
