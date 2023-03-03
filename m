Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8341F8F42
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Mar 2023 18:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677869725; x=1709405725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WRPAVea4b7WpHukNXr1DJykDYmMlj8Gt0eRh+om2h8M=;
  b=DbelyrW0N6+D9U4Burt/QdOViLMtlbRENrh2/v6k+N+eNTMg4W4l7YBK
   +FdjbDxwPmoOTcc17PeWUMEIaD5yV/muPEkNaW4uGWoFj8AyiQgxkPIHi
   dY95HlsjvCci8aVCi1hmOcsq2pPo1THO6QrXZHARFkeXJEtct/o9/Ndvk
   e0nCLZ8I4b0UZPSw8BiRgcOYrNJDquN6IWvcf90YT7G8pvVbIzGXh4UsT
   gipCViTW7Rk9MyfJn2UZi4iYL2bpCX/BIK7sZ6j3mcSQpbzra/HgLaFCZ
   LMIO1LaYX/8NXrYj1A8MmaJFmdsEW474xn6O0QP2F7kQGM86dl2vsWU//
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="332609439"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="332609439"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 10:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="705734948"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="705734948"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Mar 2023 10:55:23 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYAYs-0001cI-1p;
	Fri, 03 Mar 2023 18:55:22 +0000
Date: Sat, 4 Mar 2023 02:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RESEND v2] pstore/blk: Export a method to implemente
 panic_write()
Message-ID: <202303040245.GzQDLqLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/pstore/blk.c:389:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230301095108.10670-1-victor@allwinnertech.com>
References: <20230301095108.10670-1-victor@allwinnertech.com>
TO: Victor Hassan <victor@allwinnertech.com>
TO: keescook@chromium.org
CC: tony.luck@intel.com
CC: gpiccoli@igalia.com
CC: linux-hardening@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Victor,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kees/for-next/pstore]
[also build test WARNING on kees/for-next/kspp linus/master v6.2 next-20230303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Victor-Hassan/pstore-blk-Export-a-method-to-implemente-panic_write/20230301-175117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
patch link:    https://lore.kernel.org/r/20230301095108.10670-1-victor%40allwinnertech.com
patch subject: [RESEND v2] pstore/blk: Export a method to implemente panic_write()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-c005-20230302 (https://download.01.org/0day-ci/archive/20230304/202303040245.GzQDLqLv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7181629a1cdc83fedc5954addc00d682d5636534
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Victor-Hassan/pstore-blk-Export-a-method-to-implemente-panic_write/20230301-175117
        git checkout 7181629a1cdc83fedc5954addc00d682d5636534
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303040245.GzQDLqLv-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                           ^
   fs/pstore/blk.c:282:6: note: Calling 'preempt_count'
           if (in_interrupt() || irqs_disabled())
               ^
   include/linux/preempt.h:131:26: note: expanded from macro 'in_interrupt'
   #define in_interrupt()          (irq_count())
                                    ^~~~~~~~~~~
   include/linux/preempt.h:108:22: note: expanded from macro 'irq_count'
   #define irq_count()     (nmi_count() | hardirq_count() | softirq_count())
                            ^~~~~~~~~~~
   include/linux/preempt.h:101:22: note: expanded from macro 'nmi_count'
   #define nmi_count()     (preempt_count() & NMI_MASK)
                            ^~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is true
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:326:28: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                     ^
   arch/s390/include/asm/preempt.h:17:9: note: Taking false branch
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:338:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   arch/s390/include/asm/preempt.h:17:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:330:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   arch/s390/include/asm/preempt.h:17:9: note: Dereference of null pointer
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/pstore/blk.c:389:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(best_effort_dev->path, blkdev);
           ^~~~~~
   fs/pstore/blk.c:389:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(best_effort_dev->path, blkdev);
           ^~~~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/dma/dmaengine.c:546:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return this_cpu_read(channel_table[tx_type]->chan);
                  ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
           case 8: pscr_ret__ = stem##8(variable); break;                  \
                                ^~~~~~~~~~~~~~~~~
   note: expanded from here
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ~~~~~~~~~~~~^~
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   drivers/dma/dmaengine.c:546:9: note: Loop condition is false.  Exiting loop
           return this_cpu_read(channel_table[tx_type]->chan);
                  ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_size_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   drivers/dma/dmaengine.c:546:9: note: Control jumps to 'case 8:'  at line 546
           return this_cpu_read(channel_table[tx_type]->chan);
                  ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:320:2: note: expanded from macro '__pcpu_size_call_return'
           switch(sizeof(variable)) {                                      \
           ^
   drivers/dma/dmaengine.c:546:9: note: Left side of '||' is false
           return this_cpu_read(channel_table[tx_type]->chan);
                  ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
           case 8: pscr_ret__ = stem##8(variable); break;                  \
                                ^
   note: expanded from here
   include/asm-generic/percpu.h:329:31: note: expanded from macro 'this_cpu_read_8'
   #define this_cpu_read_8(pcp)            this_cpu_generic_read(pcp)
                                           ^
   include/asm-generic/percpu.h:137:6: note: expanded from macro 'this_cpu_generic_read'
           if (__native_word(pcp))                                         \
               ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/dma/dmaengine.c:546:9: note: Left side of '||' is false
           return this_cpu_read(channel_table[tx_type]->chan);
                  ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
           case 8: pscr_ret__ = stem##8(variable); break;                  \
                                ^
   note: expanded from here
   include/asm-generic/percpu.h:329:31: note: expanded from macro 'this_cpu_read_8'
   #define this_cpu_read_8(pcp)            this_cpu_generic_read(pcp)
                                           ^
   include/asm-generic/percpu.h:137:6: note: expanded from macro 'this_cpu_generic_read'
           if (__native_word(pcp))                                         \
               ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/dma/dmaengine.c:546:9: note: Left side of '||' is false
           return this_cpu_read(channel_table[tx_type]->chan);
                  ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_read'

vim +389 fs/pstore/blk.c

7bb9557b48fcab Kees Cook          2021-06-14  369  
1d1f6cc5818c75 Kees Cook          2021-06-15  370  static int __init __best_effort_init(void)
1d1f6cc5818c75 Kees Cook          2021-06-15  371  {
1d1f6cc5818c75 Kees Cook          2021-06-15  372  	struct pstore_device_info *best_effort_dev;
1d1f6cc5818c75 Kees Cook          2021-06-15  373  	int ret;
1d1f6cc5818c75 Kees Cook          2021-06-15  374  
1d1f6cc5818c75 Kees Cook          2021-06-15  375  	/* No best-effort mode requested. */
1d1f6cc5818c75 Kees Cook          2021-06-15  376  	if (!best_effort)
1d1f6cc5818c75 Kees Cook          2021-06-15  377  		return 0;
1d1f6cc5818c75 Kees Cook          2021-06-15  378  
1d1f6cc5818c75 Kees Cook          2021-06-15  379  	/* Reject an empty blkdev. */
1d1f6cc5818c75 Kees Cook          2021-06-15  380  	if (!blkdev[0]) {
1d1f6cc5818c75 Kees Cook          2021-06-15  381  		pr_err("blkdev empty with best_effort=Y\n");
1d1f6cc5818c75 Kees Cook          2021-06-15  382  		return -EINVAL;
1d1f6cc5818c75 Kees Cook          2021-06-15  383  	}
1d1f6cc5818c75 Kees Cook          2021-06-15  384  
1d1f6cc5818c75 Kees Cook          2021-06-15  385  	best_effort_dev = kzalloc(sizeof(*best_effort_dev), GFP_KERNEL);
1d1f6cc5818c75 Kees Cook          2021-06-15  386  	if (!best_effort_dev)
1d1f6cc5818c75 Kees Cook          2021-06-15  387  		return -ENOMEM;
1d1f6cc5818c75 Kees Cook          2021-06-15  388  
7181629a1cdc83 Victor Hassan      2023-03-01 @389  	strcpy(best_effort_dev->path, blkdev);
1d1f6cc5818c75 Kees Cook          2021-06-15  390  	best_effort_dev->zone.read = psblk_generic_blk_read;
1d1f6cc5818c75 Kees Cook          2021-06-15  391  	best_effort_dev->zone.write = psblk_generic_blk_write;
1d1f6cc5818c75 Kees Cook          2021-06-15  392  
1d1f6cc5818c75 Kees Cook          2021-06-15  393  	ret = __register_pstore_blk(best_effort_dev,
1d1f6cc5818c75 Kees Cook          2021-06-15  394  				    early_boot_devpath(blkdev));
7181629a1cdc83 Victor Hassan      2023-03-01  395  	if (ret) {
1d1f6cc5818c75 Kees Cook          2021-06-15  396  		kfree(best_effort_dev);
7181629a1cdc83 Victor Hassan      2023-03-01  397  	} else {
7181629a1cdc83 Victor Hassan      2023-03-01  398  		if (pstore_blk_panic_notifier_init_call(best_effort_dev) == NOTIFY_OK)
7181629a1cdc83 Victor Hassan      2023-03-01  399  			pr_info("attached %s (%lu) (dedicated panic_write!)\n",
7181629a1cdc83 Victor Hassan      2023-03-01  400  				    blkdev, best_effort_dev->zone.total_size);
1d1f6cc5818c75 Kees Cook          2021-06-15  401  		else
61eb495c83bf6e Geert Uytterhoeven 2021-11-18  402  			pr_info("attached %s (%lu) (no dedicated panic_write!)\n",
1d1f6cc5818c75 Kees Cook          2021-06-15  403  				    blkdev, best_effort_dev->zone.total_size);
7181629a1cdc83 Victor Hassan      2023-03-01  404  	}
1d1f6cc5818c75 Kees Cook          2021-06-15  405  
1d1f6cc5818c75 Kees Cook          2021-06-15  406  	return ret;
1d1f6cc5818c75 Kees Cook          2021-06-15  407  }
1d1f6cc5818c75 Kees Cook          2021-06-15  408  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
