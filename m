Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267C53FE1
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 13:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676985794; x=1708521794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uLAZ7fOan+Al0X6mMJP79YY+iXXBmg2LzCpzSBbaa9Y=;
  b=CGPN2918fUEmPaxbqKf9GG5ZHSpWeKYPUfvBbNY+Z6hETsY/uOoJ4wld
   LrE5n2YPMbbm+vzxPxfJgRtu4WKXY61qDciQ6L9zdl+/E+I+kTCtG8JAM
   4bwX0hbAEDzJiOvU7SmT9YK5SahtzhmwsNtBCuLcgBBnkqymUwi13mc3Y
   acr8pE8YG2gzUzNw3JVqrLXWwfwRunKCm3qwadw0/afViDF5vRwJOcheq
   Cu/Wv7L7PPkSCdI0XfSei6VmrXgZd+NBamd6+1yLYzNaSqAHcPH9RXpb7
   y+7kkzYjZUVJPlCWq8B1GXlTPA0ddmypQ/rN/6Rk3Gh/sKGrXvP8OXVHR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="360099358"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="360099358"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 05:23:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="671651513"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="671651513"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Feb 2023 05:23:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUSbu-000Enx-36;
	Tue, 21 Feb 2023 13:23:10 +0000
Date: Tue, 21 Feb 2023 21:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/kmemleak.c:142:8: warning: Excessive padding in 'struct
 kmemleak_object' (20 padding bytes, where 4 is optimal). Optimal fields
 order: pointer, size, excess_ref, area_list, jiffies, object_list,
 gray_list, rcu, rb_node, flags, use_count, min_count, cou...
Message-ID: <202302212106.Xmbw9XiI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/kmemleak.c:142:8: warning: Excessive padding in 'struct kmemleak_object' (20 padding bytes, where 4 is optimal). Optimal fields order: pointer, size, excess_ref, area_list, jiffies, object_list, gray_list, rcu, rb_node, flags, use_count, min_count, count, checksum, trace_handle, pid, lock, comm, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89f5349e0673322857bd432fa23113af56673739
commit: 56a61617dd2276cbc56a6c868599716386d70041 mm: use stack_depot for recording kmemleak's backtrace
date:   10 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 weeks ago
config: riscv-randconfig-c006-20230219 (https://download.01.org/0day-ci/archive/20230221/202302212106.Xmbw9XiI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=56a61617dd2276cbc56a6c868599716386d70041
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 56a61617dd2276cbc56a6c868599716386d70041
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302212106.Xmbw9XiI-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   include/asm-generic/bitops/__ffs.h:23:2: note: Taking true branch
           if ((word & 0xffff) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:27:2: note: Taking true branch
           if ((word & 0xff) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:31:2: note: Taking true branch
           if ((word & 0xf) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:35:2: note: Taking true branch
           if ((word & 0x3) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:39:2: note: Taking true branch
           if ((word & 0x1) == 0)
           ^
   include/asm-generic/bitops/__ffs.h:40:3: note: The value 63 is assigned to 'num'
                   num += 1;
                   ^~~~~~~~
   include/asm-generic/bitops/__ffs.h:41:2: note: Returning the value 63 (loaded from 'num')
           return num;
           ^~~~~~~~~~
   drivers/clk/sprd/pll.c:136:17: note: Returning from '__ffs'
                                            ((mask >> __ffs(mask)) + 1)) *
                                                      ^
   include/linux/math.h:103:24: note: expanded from macro 'DIV_ROUND_CLOSEST_ULL'
           typeof(divisor) __d = divisor;                  \
                                 ^~~~~~~
   drivers/clk/sprd/pll.c:136:14: note: The result of the right shift is undefined due to shifting by '63', which is greater or equal to the width of type 'u32'
                                            ((mask >> __ffs(mask)) + 1)) *
                                                   ^
   include/linux/math.h:103:24: note: expanded from macro 'DIV_ROUND_CLOSEST_ULL'
           typeof(divisor) __d = divisor;                  \
                                 ^~~~~~~
   drivers/clk/sprd/pll.c:200:2: warning: Value stored to 'width' is never read [clang-analyzer-deadcode.DeadStores]
           width = pwidth(pll, PLL_KINT);
           ^
   drivers/clk/sprd/pll.c:200:2: note: Value stored to 'width' is never read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/pci/endpoint/pci-epc-mem.c:29:7: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           size >>= page_shift;
                ^
   drivers/pci/endpoint/pci-epc-mem.c:179:14: note: Assuming 'i' is < field 'num_windows'
           for (i = 0; i < epc->num_windows; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epc-mem.c:179:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < epc->num_windows; i++) {
           ^
   drivers/pci/endpoint/pci-epc-mem.c:183:11: note: Calling 'pci_epc_mem_get_order'
                   order = pci_epc_mem_get_order(mem, align_size);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epc-mem.c:26:28: note: '?' condition is false
           unsigned int page_shift = ilog2(mem->window.page_size);
                                     ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/pci/endpoint/pci-epc-mem.c:26:28: note: '?' condition is false
           unsigned int page_shift = ilog2(mem->window.page_size);
                                     ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <= 4) ?              \
           ^
   drivers/pci/endpoint/pci-epc-mem.c:26:28: note: Calling '__ilog2_u64'
           unsigned int page_shift = ilog2(mem->window.page_size);
                                     ^
   include/linux/log2.h:163:2: note: expanded from macro 'ilog2'
           __ilog2_u64(n)                  \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:32:2: note: Returning the value -1
           return fls64(n) - 1;
           ^~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epc-mem.c:26:28: note: Returning from '__ilog2_u64'
           unsigned int page_shift = ilog2(mem->window.page_size);
                                     ^
   include/linux/log2.h:163:2: note: expanded from macro 'ilog2'
           __ilog2_u64(n)                  \
           ^~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epc-mem.c:26:2: note: 'page_shift' initialized to 4294967295
           unsigned int page_shift = ilog2(mem->window.page_size);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epc-mem.c:29:7: note: Assigned value is garbage or undefined
           size >>= page_shift;
                ^   ~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   mm/migrate.c:1558:5: warning: Value stored to 'nr_large_failed' is never read [clang-analyzer-deadcode.DeadStores]
                                   nr_large_failed += large_retry;
                                   ^                  ~~~~~~~~~~~
   mm/migrate.c:1558:5: note: Value stored to 'nr_large_failed' is never read
                                   nr_large_failed += large_retry;
                                   ^                  ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
>> mm/kmemleak.c:142:8: warning: Excessive padding in 'struct kmemleak_object' (20 padding bytes, where 4 is optimal). Optimal fields order: pointer, size, excess_ref, area_list, jiffies, object_list, gray_list, rcu, rb_node, flags, use_count, min_count, count, checksum, trace_handle, pid, lock, comm, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct kmemleak_object {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   mm/kmemleak.c:142:8: note: Excessive padding in 'struct kmemleak_object' (20 padding bytes, where 4 is optimal). Optimal fields order: pointer, size, excess_ref, area_list, jiffies, object_list, gray_list, rcu, rb_node, flags, use_count, min_count, count, checksum, trace_handle, pid, lock, comm, consider reordering the fields or adding explicit padding members
   struct kmemleak_object {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   mm/debug_vm_pgtable.c:668:8: warning: Value stored to 'pte' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot_none);
                 ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/debug_vm_pgtable.c:668:8: note: Value stored to 'pte' during its initialization is never read
           pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot_none);
                 ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/debug_vm_pgtable.c:747:8: warning: Value stored to 'pte' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
                 ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/debug_vm_pgtable.c:747:8: note: Value stored to 'pte' during its initialization is never read
           pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
                 ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/debug_vm_pgtable.c:759:8: warning: Value stored to 'pte' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
                 ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/debug_vm_pgtable.c:759:8: note: Value stored to 'pte' during its initialization is never read
           pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
                 ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   include/linux/list.h:854:10: warning: Access to field 'pprev' results in a dereference of a null pointer (loaded from variable 'h') [clang-analyzer-core.NullDereference]
           return !h->pprev;
                   ^
   kernel/ucount.c:255:23: note: Assuming pointer value is null
           for (iter = ucounts; iter; iter = iter->ns->ucounts) {
                                ^~~~
   kernel/ucount.c:255:2: note: Loop condition is false. Execution continues on line 259
           for (iter = ucounts; iter; iter = iter->ns->ucounts) {
           ^
   kernel/ucount.c:259:14: note: Passing null pointer value via 1st parameter 'ucounts'
           put_ucounts(ucounts);
                       ^~~~~~~
   kernel/ucount.c:259:2: note: Calling 'put_ucounts'
           put_ucounts(ucounts);
           ^~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:207:6: note: Assuming the condition is true
           if (atomic_dec_and_lock_irqsave(&ucounts->count, &ucounts_lock, flags)) {
               ^
   include/linux/spinlock.h:477:21: note: expanded from macro 'atomic_dec_and_lock_irqsave'
                   __cond_lock(lock, _atomic_dec_and_lock_irqsave(atomic, lock, &(flags)))
                   ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:63:28: note: expanded from macro '__cond_lock'
   # define __cond_lock(x,c) (c)
                              ^
   kernel/ucount.c:207:2: note: Taking true branch
           if (atomic_dec_and_lock_irqsave(&ucounts->count, &ucounts_lock, flags)) {
           ^
   kernel/ucount.c:208:18: note: Passing null pointer value via 1st parameter 'n'
                   hlist_del_init(&ucounts->node);
                                  ^~~~~~~~~~~~~~
   kernel/ucount.c:208:3: note: Calling 'hlist_del_init'
                   hlist_del_init(&ucounts->node);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:911:22: note: Passing null pointer value via 1st parameter 'h'
           if (!hlist_unhashed(n)) {
                               ^
   include/linux/list.h:911:7: note: Calling 'hlist_unhashed'
           if (!hlist_unhashed(n)) {
                ^~~~~~~~~~~~~~~~~
   include/linux/list.h:854:10: note: Access to field 'pprev' results in a dereference of a null pointer (loaded from variable 'h')
           return !h->pprev;
                   ^
   kernel/ucount.c:338:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           do_dec_rlimit_put_ucounts(ucounts, iter, type);
           ^                         ~~~~~~~
   kernel/ucount.c:317:2: note: Loop condition is true.  Entering loop body
           for (iter = ucounts; iter; iter = iter->ns->ucounts) {

vim +142 mm/kmemleak.c

a1084c8779f5ef Luis R. Rodriguez 2009-09-04  133  
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  134  /*
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  135   * Structure holding the metadata for each allocated memory block.
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  136   * Modifications to such objects should be made while holding the
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  137   * object->lock. Insertions or deletions from object_list, gray_list or
85d3a316c71419 Michel Lespinasse 2012-10-08  138   * rb_node are already protected by the corresponding locks or mutex (see
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  139   * the notes on locking above). These objects are reference-counted
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  140   * (use_count) and freed using the RCU mechanism.
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  141   */
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11 @142  struct kmemleak_object {
8c96f1bc6fc49c He Zhe            2020-01-30  143  	raw_spinlock_t lock;
f66abf09e092fd Catalin Marinas   2017-07-06  144  	unsigned int flags;		/* object status flags */
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  145  	struct list_head object_list;
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  146  	struct list_head gray_list;
85d3a316c71419 Michel Lespinasse 2012-10-08  147  	struct rb_node rb_node;
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  148  	struct rcu_head rcu;		/* object_list lockless traversal */
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  149  	/* object usage count; object freed when use_count == 0 */
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  150  	atomic_t use_count;
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  151  	unsigned long pointer;
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  152  	size_t size;
94f4a1618b4c2b Catalin Marinas   2017-07-06  153  	/* pass surplus references to this pointer */
94f4a1618b4c2b Catalin Marinas   2017-07-06  154  	unsigned long excess_ref;
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  155  	/* minimum number of a pointers found before it is considered leak */
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  156  	int min_count;
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  157  	/* the total number of pointers found pointing to this object */
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  158  	int count;
04609ccc40c4e8 Catalin Marinas   2009-10-28  159  	/* checksum for detecting modified objects */
04609ccc40c4e8 Catalin Marinas   2009-10-28  160  	u32 checksum;
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  161  	/* memory ranges to be scanned inside an object (empty for all) */
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  162  	struct hlist_head area_list;
56a61617dd2276 Zhaoyang Huang    2022-10-27  163  	depot_stack_handle_t trace_handle;
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  164  	unsigned long jiffies;		/* creation timestamp */
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  165  	pid_t pid;			/* pid of the current task */
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  166  	char comm[TASK_COMM_LEN];	/* executable name */
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  167  };
3c7b4e6b8be4c1 Catalin Marinas   2009-06-11  168  

:::::: The code at line 142 was first introduced by commit
:::::: 3c7b4e6b8be4c16f1e6e5c558e33b7ff0db2dfaf kmemleak: Add the base support

:::::: TO: Catalin Marinas <catalin.marinas@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
