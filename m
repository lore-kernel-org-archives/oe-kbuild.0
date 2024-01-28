Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D48D51D
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jan 2024 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706430204; cv=none; b=S5h4JAutQYntezcKTggTfWyFqDoQDBFe28RjTE3YGYk2sS/pO8pO56aTgGxExshPYV8CMsFDaKeKOZSnjgnjgjIGHS2Rvd/a7v1gnWswwnn0OzrHl91tA45Pk4yGVNvJwCCRx57g4i4Ej7UwLJQ0i31GKwyRaZIW9o5Gvnlnkws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706430204; c=relaxed/simple;
	bh=4Wc6bCOSXagIpRmTQ2r5RO5oogf01B5k2bQQBbp7SUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dGHVutE2aOJGa7UpPOkeeB3XOiKGB/ttDbWV59T8p/E9n3Au2qkUElFsFDXD4j61Ygl9U3EEErxgwC4axPtmS4LmN4chOeC0cJnquIcZCA2uGrMyWhE+pJweoU0SCDrmvQB3IMcwMO/h8QE2G2ZJ9JMi6zYFL2kuMpo42JJQXTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUcMdbPN; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUcMdbPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706430202; x=1737966202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Wc6bCOSXagIpRmTQ2r5RO5oogf01B5k2bQQBbp7SUQ=;
  b=dUcMdbPNLBxsOnmlf33QBJuPKqninZqKAJ/ftDTFYLir1p86Lo2tf35Y
   yhHLnU89gfQFKPsHB71IZfKtBvEUJ1TAlas6AgwcC0M2JRE3K4LjFZCVG
   oc26IQAwNnuvrMxW7YVW18sxOW/+41YzyfhB7ioGPI6yLOv0aEWTlKOw/
   SUdMcRy6A7wkCOlHaOHUDp6ms4l4/EULG/BbztClKl6tqBwuwDgHoj7nh
   eg44BN4k41Gz+S17EnR24reyu7g52vmlE6R0j5jbZ8qkPWfopVXzVE/Bn
   A1QtY8Wo0Lp/CFjeKsalo+HLa25Iki9sleBQ2KX6WHRMV6cZSInpoTROQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="401618688"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="401618688"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 00:23:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="877782545"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="877782545"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2024 00:23:20 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU0Ri-0003Es-1a;
	Sun, 28 Jan 2024 08:23:18 +0000
Date: Sun, 28 Jan 2024 16:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [davidhildenbrand:fork_rmap_batching_mm_unstable 109/141]
 kernel/crash_core.c:43:11: error: incomplete definition of type 'struct
 kimage'
Message-ID: <202401281623.oPlAZOna-lkp@intel.com>
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

Hi Baoquan,

First bad commit (maybe != root cause):

tree:   https://github.com/davidhildenbrand/linux fork_rmap_batching_mm_unstable
head:   b652ec55c236cca5d0247cf66864971cc2ffea2d
commit: 1f4f7b3da75ca3b8c66b574f7341cae841e2fcd2 [109/141] ppc, crash: enforce KEXEC and KEXEC_FILE to select CRASH_DUMP
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-katmai_defconfig (https://download.01.org/0day-ci/archive/20240128/202401281623.oPlAZOna-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project a31a60074717fc40887cfe132b77eec93bedd307)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281623.oPlAZOna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401281623.oPlAZOna-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/crash_core.c:43:11: error: incomplete definition of type 'struct kimage'
      43 |         if (image->type != KEXEC_TYPE_CRASH)
         |             ~~~~~^
   include/linux/crash_core.h:9:8: note: forward declaration of 'struct kimage'
       9 | struct kimage;
         |        ^
>> kernel/crash_core.c:43:21: error: use of undeclared identifier 'KEXEC_TYPE_CRASH'
      43 |         if (image->type != KEXEC_TYPE_CRASH)
         |                            ^
>> kernel/crash_core.c:55:20: error: call to undeclared function 'kimage_alloc_control_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      55 |         vmcoreinfo_page = kimage_alloc_control_pages(image, 0);
         |                           ^
>> kernel/crash_core.c:55:18: error: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
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
>> kernel/crash_core.c:94:11: error: use of undeclared identifier 'kexec_crash_image'
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
>> kernel/crash_core.c:117:4: error: call to undeclared function 'crash_setup_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     117 |                         crash_setup_regs(&fixed_regs, regs);
         |                         ^
>> kernel/crash_core.c:120:4: error: call to undeclared function 'machine_kexec'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     120 |                         machine_kexec(kexec_crash_image);
         |                         ^
   kernel/crash_core.c:120:18: error: use of undeclared identifier 'kexec_crash_image'
     120 |                         machine_kexec(kexec_crash_image);
         |                                       ^
   kernel/crash_core.c:127:1: warning: attribute declaration must precede definition [-Wignored-attributes]
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
   kernel/crash_core.c:127:1: warning: attribute declaration must precede definition [-Wignored-attributes]
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
>> kernel/crash_core.c:356:2: error: call to undeclared function 'crash_free_reserved_phys_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     356 |         crash_free_reserved_phys_range(ram_res->start, ram_res->end);
         |         ^
   kernel/crash_core.c:370:6: error: use of undeclared identifier 'kexec_crash_image'
     370 |         if (kexec_crash_image) {
         |             ^
>> kernel/crash_core.c:377:31: error: use of undeclared identifier 'KEXEC_CRASH_MEM_ALIGN'
     377 |         new_size = roundup(new_size, KEXEC_CRASH_MEM_ALIGN);
         |                                      ^
>> kernel/crash_core.c:377:31: error: use of undeclared identifier 'KEXEC_CRASH_MEM_ALIGN'
>> kernel/crash_core.c:437:29: error: use of undeclared identifier 'KEXEC_CORE_NOTE_NAME'
     437 |         buf = append_elf_note(buf, KEXEC_CORE_NOTE_NAME, NT_PRSTATUS,
         |                                    ^
   2 warnings and 19 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRASH_DUMP
   Depends on [n]: ARCH_SUPPORTS_CRASH_DUMP [=y] && KEXEC_CORE [=n]
   Selected by [y]:
   - ARCH_SELECTS_KEXEC [=y]


vim +43 kernel/crash_core.c

87d0e103c842b4 Baoquan He 2024-01-24   35  
87d0e103c842b4 Baoquan He 2024-01-24   36  int kimage_crash_copy_vmcoreinfo(struct kimage *image)
87d0e103c842b4 Baoquan He 2024-01-24   37  {
87d0e103c842b4 Baoquan He 2024-01-24   38  	struct page *vmcoreinfo_page;
87d0e103c842b4 Baoquan He 2024-01-24   39  	void *safecopy;
87d0e103c842b4 Baoquan He 2024-01-24   40  
87d0e103c842b4 Baoquan He 2024-01-24   41  	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
87d0e103c842b4 Baoquan He 2024-01-24   42  		return 0;
87d0e103c842b4 Baoquan He 2024-01-24  @43  	if (image->type != KEXEC_TYPE_CRASH)
87d0e103c842b4 Baoquan He 2024-01-24   44  		return 0;
87d0e103c842b4 Baoquan He 2024-01-24   45  
87d0e103c842b4 Baoquan He 2024-01-24   46  	/*
87d0e103c842b4 Baoquan He 2024-01-24   47  	 * For kdump, allocate one vmcoreinfo safe copy from the
87d0e103c842b4 Baoquan He 2024-01-24   48  	 * crash memory. as we have arch_kexec_protect_crashkres()
87d0e103c842b4 Baoquan He 2024-01-24   49  	 * after kexec syscall, we naturally protect it from write
87d0e103c842b4 Baoquan He 2024-01-24   50  	 * (even read) access under kernel direct mapping. But on
87d0e103c842b4 Baoquan He 2024-01-24   51  	 * the other hand, we still need to operate it when crash
87d0e103c842b4 Baoquan He 2024-01-24   52  	 * happens to generate vmcoreinfo note, hereby we rely on
87d0e103c842b4 Baoquan He 2024-01-24   53  	 * vmap for this purpose.
87d0e103c842b4 Baoquan He 2024-01-24   54  	 */
87d0e103c842b4 Baoquan He 2024-01-24  @55  	vmcoreinfo_page = kimage_alloc_control_pages(image, 0);
87d0e103c842b4 Baoquan He 2024-01-24   56  	if (!vmcoreinfo_page) {
87d0e103c842b4 Baoquan He 2024-01-24   57  		pr_warn("Could not allocate vmcoreinfo buffer\n");
87d0e103c842b4 Baoquan He 2024-01-24   58  		return -ENOMEM;
87d0e103c842b4 Baoquan He 2024-01-24   59  	}
87d0e103c842b4 Baoquan He 2024-01-24   60  	safecopy = vmap(&vmcoreinfo_page, 1, VM_MAP, PAGE_KERNEL);
87d0e103c842b4 Baoquan He 2024-01-24   61  	if (!safecopy) {
87d0e103c842b4 Baoquan He 2024-01-24   62  		pr_warn("Could not vmap vmcoreinfo buffer\n");
87d0e103c842b4 Baoquan He 2024-01-24   63  		return -ENOMEM;
87d0e103c842b4 Baoquan He 2024-01-24   64  	}
87d0e103c842b4 Baoquan He 2024-01-24   65  
87d0e103c842b4 Baoquan He 2024-01-24   66  	image->vmcoreinfo_data_copy = safecopy;
87d0e103c842b4 Baoquan He 2024-01-24   67  	crash_update_vmcoreinfo_safecopy(safecopy);
87d0e103c842b4 Baoquan He 2024-01-24   68  
87d0e103c842b4 Baoquan He 2024-01-24   69  	return 0;
87d0e103c842b4 Baoquan He 2024-01-24   70  }
87d0e103c842b4 Baoquan He 2024-01-24   71  
87d0e103c842b4 Baoquan He 2024-01-24   72  
87d0e103c842b4 Baoquan He 2024-01-24   73  
87d0e103c842b4 Baoquan He 2024-01-24   74  int kexec_should_crash(struct task_struct *p)
87d0e103c842b4 Baoquan He 2024-01-24   75  {
87d0e103c842b4 Baoquan He 2024-01-24   76  	/*
87d0e103c842b4 Baoquan He 2024-01-24   77  	 * If crash_kexec_post_notifiers is enabled, don't run
87d0e103c842b4 Baoquan He 2024-01-24   78  	 * crash_kexec() here yet, which must be run after panic
87d0e103c842b4 Baoquan He 2024-01-24   79  	 * notifiers in panic().
87d0e103c842b4 Baoquan He 2024-01-24   80  	 */
87d0e103c842b4 Baoquan He 2024-01-24   81  	if (crash_kexec_post_notifiers)
87d0e103c842b4 Baoquan He 2024-01-24   82  		return 0;
87d0e103c842b4 Baoquan He 2024-01-24   83  	/*
87d0e103c842b4 Baoquan He 2024-01-24   84  	 * There are 4 panic() calls in make_task_dead() path, each of which
87d0e103c842b4 Baoquan He 2024-01-24   85  	 * corresponds to each of these 4 conditions.
87d0e103c842b4 Baoquan He 2024-01-24   86  	 */
87d0e103c842b4 Baoquan He 2024-01-24   87  	if (in_interrupt() || !p->pid || is_global_init(p) || panic_on_oops)
87d0e103c842b4 Baoquan He 2024-01-24   88  		return 1;
87d0e103c842b4 Baoquan He 2024-01-24   89  	return 0;
87d0e103c842b4 Baoquan He 2024-01-24   90  }
87d0e103c842b4 Baoquan He 2024-01-24   91  
87d0e103c842b4 Baoquan He 2024-01-24  @92  int kexec_crash_loaded(void)
87d0e103c842b4 Baoquan He 2024-01-24   93  {
87d0e103c842b4 Baoquan He 2024-01-24  @94  	return !!kexec_crash_image;
87d0e103c842b4 Baoquan He 2024-01-24   95  }
87d0e103c842b4 Baoquan He 2024-01-24   96  EXPORT_SYMBOL_GPL(kexec_crash_loaded);
87d0e103c842b4 Baoquan He 2024-01-24   97  
87d0e103c842b4 Baoquan He 2024-01-24   98  /*
87d0e103c842b4 Baoquan He 2024-01-24   99   * No panic_cpu check version of crash_kexec().  This function is called
87d0e103c842b4 Baoquan He 2024-01-24  100   * only when panic_cpu holds the current CPU number; this is the only CPU
87d0e103c842b4 Baoquan He 2024-01-24  101   * which processes crash_kexec routines.
87d0e103c842b4 Baoquan He 2024-01-24  102   */
87d0e103c842b4 Baoquan He 2024-01-24 @103  void __noclone __crash_kexec(struct pt_regs *regs)
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
87d0e103c842b4 Baoquan He 2024-01-24 @114  		if (kexec_crash_image) {
87d0e103c842b4 Baoquan He 2024-01-24  115  			struct pt_regs fixed_regs;
87d0e103c842b4 Baoquan He 2024-01-24  116  
87d0e103c842b4 Baoquan He 2024-01-24 @117  			crash_setup_regs(&fixed_regs, regs);
87d0e103c842b4 Baoquan He 2024-01-24  118  			crash_save_vmcoreinfo();
87d0e103c842b4 Baoquan He 2024-01-24  119  			machine_crash_shutdown(&fixed_regs);
87d0e103c842b4 Baoquan He 2024-01-24 @120  			machine_kexec(kexec_crash_image);
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

:::::: The code at line 43 was first introduced by commit
:::::: 87d0e103c842b43a67f7a2b67757f2936ed39221 crash: split crash dumping code out from kexec_core.c

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: David Hildenbrand <david@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
