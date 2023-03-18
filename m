Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741667C
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 02:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679105371; x=1710641371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IoUgE57SDa8FY/gC0gSQol4Ej6RUt9zCd9tEgThhjSg=;
  b=PCU4blClZZcZ3yX/+ZgBNBAHTqW+Yaj87Bp5HnlZYTcor194mVKwdh9d
   yex7QHLqCe2AN0K4CF53eOPjDmN/Br1bb6iiVWXOUpS8Vl3k2FKTa2c1G
   Ofq11pFdihAMpMM8umx1qtnQEDQX3811BumGVPg65hAESkpM9h7A5RhZP
   FQrYGcKQkHpX4sTeL/9UakGO3h+Pv9SZ1HskWApdY7t5YRhFQO2loArrT
   yElr9E+4Frrz4ULHLeiYVxRRwjUb07YDAEIVMCV8rwe0446Yh8DrDJhd3
   4bU3WlvTz1tFKf/dw4cy1fNtCe0JuIKMIIphS4vdaMkMZXqwxmIgqFGYj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="326761325"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="326761325"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 19:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="769575844"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="769575844"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Mar 2023 19:09:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdM0e-0009jC-0I;
	Sat, 18 Mar 2023 02:09:28 +0000
Date: Sat, 18 Mar 2023 10:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [niks:b4/dma_iommu 5/7] drivers/iommu/dma-iommu.c:191:7: warning:
 Dereference of null pointer [clang-analyzer-core.NullDereference]
Message-ID: <202303181042.E0Zs0P0S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/iommu/dma-iommu.c:191:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Niklas Schnelle <schnelle@linux.ibm.com>
CC: Matthew Rosato <mjrosato@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git b4/dma_iommu
head:   2efe9b096f1db7ee0d26bf1a1532492172ae7a00
commit: 294eba44b4f4fe0542fbd28e37950c431960f850 [5/7] s390/pci: Use dma-iommu layer
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: s390-randconfig-c005-20230312 (https://download.01.org/0day-ci/archive/20230318/202303181042.E0Zs0P0S-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=294eba44b4f4fe0542fbd28e37950c431960f850
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks b4/dma_iommu
        git checkout 294eba44b4f4fe0542fbd28e37950c431960f850
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303181042.E0Zs0P0S-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-fence-array.c:162:25: note: Assuming 'fences' is null
           WARN_ON(!num_fences || !fences);
                                  ^
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(x);                      \
                                  ^
   drivers/dma-buf/dma-fence-array.c:162:2: note: Taking false branch
           WARN_ON(!num_fences || !fences);
           ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   drivers/dma-buf/dma-fence-array.c:162:2: note: Taking true branch
           WARN_ON(!num_fences || !fences);
           ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   drivers/dma-buf/dma-fence-array.c:162:2: note: Loop condition is false.  Exiting loop
           WARN_ON(!num_fences || !fences);
           ^
   arch/s390/include/asm/bug.h:60:4: note: expanded from macro 'WARN_ON'
                           __WARN();                       \
                           ^
   include/asm-generic/bug.h:102:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/s390/include/asm/bug.h:50:2: note: expanded from macro '__WARN_FLAGS'
           __EMIT_BUG(BUGFLAG_WARNING|(flags));            \
           ^
   arch/s390/include/asm/bug.h:11:23: note: expanded from macro '__EMIT_BUG'
   #define __EMIT_BUG(x) do {                                      \
                         ^
   drivers/dma-buf/dma-fence-array.c:162:2: note: Loop condition is false.  Exiting loop
           WARN_ON(!num_fences || !fences);
           ^
   arch/s390/include/asm/bug.h:60:4: note: expanded from macro 'WARN_ON'
                           __WARN();                       \
                           ^
   include/asm-generic/bug.h:102:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/s390/include/asm/bug.h:49:29: note: expanded from macro '__WARN_FLAGS'
   #define __WARN_FLAGS(flags) do {                        \
                               ^
   drivers/dma-buf/dma-fence-array.c:166:10: note: Calling 'kzalloc'
           array = kzalloc(size, GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:573:33: note: Left side of '&&' is false
           if (__builtin_constant_p(size) && size) {
                                          ^
   include/linux/slab.h:584:2: note: Returning pointer, which participates in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:2: note: Returning pointer, which participates in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-fence-array.c:166:10: note: Returning from 'kzalloc'
           array = kzalloc(size, GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-fence-array.c:167:6: note: Assuming 'array' is non-null
           if (!array)
               ^~~~~~
   drivers/dma-buf/dma-fence-array.c:167:2: note: Taking false branch
           if (!array)
           ^
   drivers/dma-buf/dma-fence-array.c:170:2: note: Loop condition is false.  Exiting loop
           spin_lock_init(&array->lock);
           ^
   include/linux/spinlock.h:330:35: note: expanded from macro 'spin_lock_init'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/dma-buf/dma-fence-array.c:176:34: note: Assuming 'signal_on_any' is true
           atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
                                           ^~~~~~~~~~~~~
   drivers/dma-buf/dma-fence-array.c:176:34: note: '?' condition is true
   drivers/dma-buf/dma-fence-array.c:192:2: note: Loop condition is true.  Entering loop body
           while (num_fences--)
           ^
   drivers/dma-buf/dma-fence-array.c:193:34: note: Array access (from variable 'fences') results in a null pointer dereference
                   WARN_ON(dma_fence_is_container(fences[num_fences]));
                                                  ^
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(x);                      \
                                  ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
>> drivers/iommu/dma-iommu.c:191:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
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
   drivers/iommu/dma-iommu.c:1460:6: note: Left side of '&&' is true
           if (gfpflags_allow_blocking(gfp) &&
               ^
   drivers/iommu/dma-iommu.c:1461:6: note: Assuming the condition is true
               !(attrs & DMA_ATTR_FORCE_CONTIGUOUS)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c:1460:2: note: Taking true branch
           if (gfpflags_allow_blocking(gfp) &&
           ^
   drivers/iommu/dma-iommu.c:1462:10: note: Calling 'iommu_dma_alloc_remap'
                   return iommu_dma_alloc_remap(dev, size, handle, gfp,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c:874:7: note: 'pages' is non-null
           if (!pages)
                ^~~~~
   drivers/iommu/dma-iommu.c:874:2: note: Taking false branch
           if (!pages)
           ^
   drivers/iommu/dma-iommu.c:880:6: note: Assuming 'vaddr' is null
           if (!vaddr)
               ^~~~~~
   drivers/iommu/dma-iommu.c:880:2: note: Taking true branch
           if (!vaddr)
           ^
   drivers/iommu/dma-iommu.c:881:3: note: Control jumps to line 885
                   goto out_unmap;
                   ^
   drivers/iommu/dma-iommu.c:885:2: note: Calling '__iommu_dma_unmap'
           __iommu_dma_unmap(dev, *dma_handle, size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c:690:24: note: Left side of '||' is false
           iotlb_gather.queued = READ_ONCE(cookie->fq_domain);
                                 ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:364:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/iommu/dma-iommu.c:690:24: note: Left side of '||' is false
           iotlb_gather.queued = READ_ONCE(cookie->fq_domain);
                                 ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:364:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/iommu/dma-iommu.c:690:24: note: Left side of '||' is false
           iotlb_gather.queued = READ_ONCE(cookie->fq_domain);
                                 ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:364:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/iommu/dma-iommu.c:690:24: note: Left side of '||' is true
           iotlb_gather.queued = READ_ONCE(cookie->fq_domain);
                                 ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                               ^
   drivers/iommu/dma-iommu.c:690:24: note: Taking false branch
           iotlb_gather.queued = READ_ONCE(cookie->fq_domain);
                                 ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)

vim +191 drivers/iommu/dma-iommu.c

f7f07484542fae Robin Murphy 2021-12-17  173  
a17e3026bc4da9 Robin Murphy 2021-12-17  174  static void queue_iova(struct iommu_dma_cookie *cookie,
f7f07484542fae Robin Murphy 2021-12-17  175  		unsigned long pfn, unsigned long pages,
f7f07484542fae Robin Murphy 2021-12-17  176  		struct list_head *freelist)
f7f07484542fae Robin Murphy 2021-12-17  177  {
f7f07484542fae Robin Murphy 2021-12-17  178  	struct iova_fq *fq;
f7f07484542fae Robin Murphy 2021-12-17  179  	unsigned long flags;
a17e3026bc4da9 Robin Murphy 2021-12-17  180  	unsigned int idx;
f7f07484542fae Robin Murphy 2021-12-17  181  
f7f07484542fae Robin Murphy 2021-12-17  182  	/*
f7f07484542fae Robin Murphy 2021-12-17  183  	 * Order against the IOMMU driver's pagetable update from unmapping
a17e3026bc4da9 Robin Murphy 2021-12-17  184  	 * @pte, to guarantee that fq_flush_iotlb() observes that if called
f7f07484542fae Robin Murphy 2021-12-17  185  	 * from a different CPU before we release the lock below. Full barrier
f7f07484542fae Robin Murphy 2021-12-17  186  	 * so it also pairs with iommu_dma_init_fq() to avoid seeing partially
f7f07484542fae Robin Murphy 2021-12-17  187  	 * written fq state here.
f7f07484542fae Robin Murphy 2021-12-17  188  	 */
f7f07484542fae Robin Murphy 2021-12-17  189  	smp_mb();
f7f07484542fae Robin Murphy 2021-12-17  190  
a17e3026bc4da9 Robin Murphy 2021-12-17 @191  	fq = raw_cpu_ptr(cookie->fq);
f7f07484542fae Robin Murphy 2021-12-17  192  	spin_lock_irqsave(&fq->lock, flags);
f7f07484542fae Robin Murphy 2021-12-17  193  
f7f07484542fae Robin Murphy 2021-12-17  194  	/*
f7f07484542fae Robin Murphy 2021-12-17  195  	 * First remove all entries from the flush queue that have already been
f7f07484542fae Robin Murphy 2021-12-17  196  	 * flushed out on another CPU. This makes the fq_full() check below less
f7f07484542fae Robin Murphy 2021-12-17  197  	 * likely to be true.
f7f07484542fae Robin Murphy 2021-12-17  198  	 */
a17e3026bc4da9 Robin Murphy 2021-12-17  199  	fq_ring_free(cookie, fq);
f7f07484542fae Robin Murphy 2021-12-17  200  
f7f07484542fae Robin Murphy 2021-12-17  201  	if (fq_full(fq)) {
a17e3026bc4da9 Robin Murphy 2021-12-17  202  		fq_flush_iotlb(cookie);
a17e3026bc4da9 Robin Murphy 2021-12-17  203  		fq_ring_free(cookie, fq);
f7f07484542fae Robin Murphy 2021-12-17  204  	}
f7f07484542fae Robin Murphy 2021-12-17  205  
f7f07484542fae Robin Murphy 2021-12-17  206  	idx = fq_ring_add(fq);
f7f07484542fae Robin Murphy 2021-12-17  207  
f7f07484542fae Robin Murphy 2021-12-17  208  	fq->entries[idx].iova_pfn = pfn;
f7f07484542fae Robin Murphy 2021-12-17  209  	fq->entries[idx].pages    = pages;
a17e3026bc4da9 Robin Murphy 2021-12-17  210  	fq->entries[idx].counter  = atomic64_read(&cookie->fq_flush_start_cnt);
f7f07484542fae Robin Murphy 2021-12-17  211  	list_splice(freelist, &fq->entries[idx].freelist);
f7f07484542fae Robin Murphy 2021-12-17  212  
f7f07484542fae Robin Murphy 2021-12-17  213  	spin_unlock_irqrestore(&fq->lock, flags);
f7f07484542fae Robin Murphy 2021-12-17  214  
f7f07484542fae Robin Murphy 2021-12-17  215  	/* Avoid false sharing as much as possible. */
a17e3026bc4da9 Robin Murphy 2021-12-17  216  	if (!atomic_read(&cookie->fq_timer_on) &&
a17e3026bc4da9 Robin Murphy 2021-12-17  217  	    !atomic_xchg(&cookie->fq_timer_on, 1))
a17e3026bc4da9 Robin Murphy 2021-12-17  218  		mod_timer(&cookie->fq_timer,
f7f07484542fae Robin Murphy 2021-12-17  219  			  jiffies + msecs_to_jiffies(IOVA_FQ_TIMEOUT));
f7f07484542fae Robin Murphy 2021-12-17  220  }
f7f07484542fae Robin Murphy 2021-12-17  221  

:::::: The code at line 191 was first introduced by commit
:::::: a17e3026bc4da9135ca9a42ec0b1fa67f95172e3 iommu: Move flush queue data into iommu_dma_cookie

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
