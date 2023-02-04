Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B241B7F
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Feb 2023 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675502260; x=1707038260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bUMHeRByl9xeNv8NpcQDX8LShgxD421wwUQ5kWf6I+M=;
  b=V7SBGhx96XBQ/LzM/IoLngxCeaGweSk2OTVE1n9feQCsdM1Us7l9yycl
   T3w+9iSn0VyuYPQF76z4vDwmhRWXj3GFBKNrKSHJQUI5kzPZf4pOKvQpj
   itIQrwQY3DHtJMGYxjhsJGA28pUVHLXnhLJptZDCoy369ezwgRzlYxCj8
   UDOaj/kNxxwUwPD4Id8VChOeWMtK5NBkh7SIvU9MfW9wnXwy2MD4ATg/c
   BNuHfYU98TKHu1CYgO91Dqrps05+EGKz1WxCYSyPKwte8yYW5iurgHgbi
   KfpqYlfXnv64SHDi/8ZMNWPme3W0Q8qz25BLLg83t/EMXathGqXY6BhR6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="393525562"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="393525562"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 01:17:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="659363806"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="659363806"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Feb 2023 01:17:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOEfy-0001C0-15;
	Sat, 04 Feb 2023 09:17:38 +0000
Date: Sat, 4 Feb 2023 17:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [niks:dma_iommu_v5 4/7] drivers/iommu/dma-iommu.c:190:7: warning:
 Dereference of null pointer [clang-analyzer-core.NullDereference]
Message-ID: <202302041755.BRcqwbhw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/iommu/dma-iommu.c:190:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Niklas Schnelle <schnelle@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git dma_iommu_v5
head:   1130d11df3ad4a18aada280e80da35911239b4ad
commit: 4dd8a9e92a898af65c84631f354f51a8b9f9ff09 [4/7] s390/pci: Use dma-iommu layer
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: s390-randconfig-c005-20230123 (https://download.01.org/0day-ci/archive/20230204/202302041755.BRcqwbhw-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=4dd8a9e92a898af65c84631f354f51a8b9f9ff09
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks dma_iommu_v5
        git checkout 4dd8a9e92a898af65c84631f354f51a8b9f9ff09
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/orangefs/orangefs-mod.c:224:10: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                        current->comm);
                                        ^
   fs/orangefs/protocol.h:359:28: note: expanded from macro 'gossip_debug'
                   printk(KERN_DEBUG fmt, ##__VA_ARGS__);                  \
                                            ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/orangefs/orangefs-mod.c:209:14: note: Assuming 'i' is < 'hash_table_size'
           for (i = 0; i < hash_table_size; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   fs/orangefs/orangefs-mod.c:209:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < hash_table_size; i++) {
           ^
   fs/orangefs/orangefs-mod.c:214:3: note: Loop condition is true.  Entering loop body
                   list_for_each_entry_safe(op,
                   ^
   include/linux/list.h:761:2: note: expanded from macro 'list_for_each_entry_safe'
           for (pos = list_first_entry(head, typeof(*pos), member),        \
           ^
   fs/orangefs/orangefs-mod.c:219:4: note: Assuming the condition is true
                           gossip_debug(GOSSIP_DEV_DEBUG,
                           ^
   fs/orangefs/protocol.h:358:6: note: expanded from macro 'gossip_debug'
           if (orangefs_gossip_debug_mask & (mask))                        \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/orangefs/orangefs-mod.c:219:4: note: Taking true branch
                           gossip_debug(GOSSIP_DEV_DEBUG,
                           ^
   fs/orangefs/protocol.h:358:2: note: expanded from macro 'gossip_debug'
           if (orangefs_gossip_debug_mask & (mask))                        \
           ^
   fs/orangefs/orangefs-mod.c:219:4: note: Loop condition is false.  Exiting loop
                           gossip_debug(GOSSIP_DEV_DEBUG,
                           ^
   fs/orangefs/protocol.h:359:3: note: expanded from macro 'gossip_debug'
                   printk(KERN_DEBUG fmt, ##__VA_ARGS__);                  \
                   ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:403:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   fs/orangefs/orangefs-mod.c:224:10: note: Dereference of null pointer
                                        current->comm);
                                        ^
   fs/orangefs/protocol.h:359:28: note: expanded from macro 'gossip_debug'
                   printk(KERN_DEBUG fmt, ##__VA_ARGS__);                  \
                                            ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   31 warnings generated.
   kernel/kallsyms.c:533:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(buffer, name);
                   ^~~~~~
   kernel/kallsyms.c:533:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(buffer, name);
                   ^~~~~~
   Suppressed 30 warnings (17 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
>> drivers/iommu/dma-iommu.c:190:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           fq = raw_cpu_ptr(cookie->fq);
                ^
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_ptr'
           arch_raw_cpu_ptr(ptr);                                          \
           ^
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   drivers/iommu/dma-iommu.c:1398:2: note: Calling '__iommu_dma_unmap'
           __iommu_dma_unmap(dev, handle, size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c:687:24: note: Left side of '||' is false
           iotlb_gather.queued = READ_ONCE(cookie->fq_domain);
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
   drivers/iommu/dma-iommu.c:687:24: note: Left side of '||' is false
           iotlb_gather.queued = READ_ONCE(cookie->fq_domain);
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
   drivers/iommu/dma-iommu.c:687:24: note: Left side of '||' is false
           iotlb_gather.queued = READ_ONCE(cookie->fq_domain);
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
   drivers/iommu/dma-iommu.c:687:24: note: Left side of '||' is true
           iotlb_gather.queued = READ_ONCE(cookie->fq_domain);
                                 ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                               ^
   drivers/iommu/dma-iommu.c:687:24: note: Taking false branch
           iotlb_gather.queued = READ_ONCE(cookie->fq_domain);
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
   drivers/iommu/dma-iommu.c:687:24: note: Loop condition is false.  Exiting loop
           iotlb_gather.queued = READ_ONCE(cookie->fq_domain);
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
   drivers/iommu/dma-iommu.c:690:10: note: Assuming 'unmapped' is equal to 'size'
           WARN_ON(unmapped != size);

vim +190 drivers/iommu/dma-iommu.c

f7f07484542fae Robin Murphy 2021-12-17  172  
a17e3026bc4da9 Robin Murphy 2021-12-17  173  static void queue_iova(struct iommu_dma_cookie *cookie,
f7f07484542fae Robin Murphy 2021-12-17  174  		unsigned long pfn, unsigned long pages,
f7f07484542fae Robin Murphy 2021-12-17  175  		struct list_head *freelist)
f7f07484542fae Robin Murphy 2021-12-17  176  {
f7f07484542fae Robin Murphy 2021-12-17  177  	struct iova_fq *fq;
f7f07484542fae Robin Murphy 2021-12-17  178  	unsigned long flags;
a17e3026bc4da9 Robin Murphy 2021-12-17  179  	unsigned int idx;
f7f07484542fae Robin Murphy 2021-12-17  180  
f7f07484542fae Robin Murphy 2021-12-17  181  	/*
f7f07484542fae Robin Murphy 2021-12-17  182  	 * Order against the IOMMU driver's pagetable update from unmapping
a17e3026bc4da9 Robin Murphy 2021-12-17  183  	 * @pte, to guarantee that fq_flush_iotlb() observes that if called
f7f07484542fae Robin Murphy 2021-12-17  184  	 * from a different CPU before we release the lock below. Full barrier
f7f07484542fae Robin Murphy 2021-12-17  185  	 * so it also pairs with iommu_dma_init_fq() to avoid seeing partially
f7f07484542fae Robin Murphy 2021-12-17  186  	 * written fq state here.
f7f07484542fae Robin Murphy 2021-12-17  187  	 */
f7f07484542fae Robin Murphy 2021-12-17  188  	smp_mb();
f7f07484542fae Robin Murphy 2021-12-17  189  
a17e3026bc4da9 Robin Murphy 2021-12-17 @190  	fq = raw_cpu_ptr(cookie->fq);
f7f07484542fae Robin Murphy 2021-12-17  191  	spin_lock_irqsave(&fq->lock, flags);
f7f07484542fae Robin Murphy 2021-12-17  192  
f7f07484542fae Robin Murphy 2021-12-17  193  	/*
f7f07484542fae Robin Murphy 2021-12-17  194  	 * First remove all entries from the flush queue that have already been
f7f07484542fae Robin Murphy 2021-12-17  195  	 * flushed out on another CPU. This makes the fq_full() check below less
f7f07484542fae Robin Murphy 2021-12-17  196  	 * likely to be true.
f7f07484542fae Robin Murphy 2021-12-17  197  	 */
a17e3026bc4da9 Robin Murphy 2021-12-17  198  	fq_ring_free(cookie, fq);
f7f07484542fae Robin Murphy 2021-12-17  199  
f7f07484542fae Robin Murphy 2021-12-17  200  	if (fq_full(fq)) {
a17e3026bc4da9 Robin Murphy 2021-12-17  201  		fq_flush_iotlb(cookie);
a17e3026bc4da9 Robin Murphy 2021-12-17  202  		fq_ring_free(cookie, fq);
f7f07484542fae Robin Murphy 2021-12-17  203  	}
f7f07484542fae Robin Murphy 2021-12-17  204  
f7f07484542fae Robin Murphy 2021-12-17  205  	idx = fq_ring_add(fq);
f7f07484542fae Robin Murphy 2021-12-17  206  
f7f07484542fae Robin Murphy 2021-12-17  207  	fq->entries[idx].iova_pfn = pfn;
f7f07484542fae Robin Murphy 2021-12-17  208  	fq->entries[idx].pages    = pages;
a17e3026bc4da9 Robin Murphy 2021-12-17  209  	fq->entries[idx].counter  = atomic64_read(&cookie->fq_flush_start_cnt);
f7f07484542fae Robin Murphy 2021-12-17  210  	list_splice(freelist, &fq->entries[idx].freelist);
f7f07484542fae Robin Murphy 2021-12-17  211  
f7f07484542fae Robin Murphy 2021-12-17  212  	spin_unlock_irqrestore(&fq->lock, flags);
f7f07484542fae Robin Murphy 2021-12-17  213  
f7f07484542fae Robin Murphy 2021-12-17  214  	/* Avoid false sharing as much as possible. */
a17e3026bc4da9 Robin Murphy 2021-12-17  215  	if (!atomic_read(&cookie->fq_timer_on) &&
a17e3026bc4da9 Robin Murphy 2021-12-17  216  	    !atomic_xchg(&cookie->fq_timer_on, 1))
a17e3026bc4da9 Robin Murphy 2021-12-17  217  		mod_timer(&cookie->fq_timer,
f7f07484542fae Robin Murphy 2021-12-17  218  			  jiffies + msecs_to_jiffies(IOVA_FQ_TIMEOUT));
f7f07484542fae Robin Murphy 2021-12-17  219  }
f7f07484542fae Robin Murphy 2021-12-17  220  

:::::: The code at line 190 was first introduced by commit
:::::: a17e3026bc4da9135ca9a42ec0b1fa67f95172e3 iommu: Move flush queue data into iommu_dma_cookie

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
