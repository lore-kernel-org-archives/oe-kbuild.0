Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987128F7
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Mar 2023 19:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677958866; x=1709494866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oG+UyBqL0Q92rSw2ZN+VASFzG/3+rw9XRSR5m6yKbYc=;
  b=oJN85F5jDSgTJBIOxNuRwAwtQvOMKOcextsNaa9+wfA37fLMYZNc8+jm
   VSV/Yz1aeEEnjs6mftpNnJ3xoaF3/YYKznc7BXqptxnkZEPu0mX0P6K3O
   i9sqsC5twy6cxl7gSCFoCfnGrLp4Do/TEu7AQ85zxXOJXAztZx0YsYz7+
   j09cjSRfS0lK3C29EbcK/kEQ/zCnNH18XOHvp1rB3gfRpyzNOQdT1TG07
   1gzCSL7K9vv2cS3nJTOwwlkOYUinz3tCbyvYnyRck9c42WCG/6cN72tZ2
   APYkG7jpXIyh6vVoWOODQgNsIkzIa6+7ol1ne6Y9EusMU2xdNvDuktFcy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="314954484"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="314954484"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 11:41:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="818867394"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="818867394"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2023 11:41:04 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYXke-0002K1-01;
	Sat, 04 Mar 2023 19:41:04 +0000
Date: Sun, 5 Mar 2023 03:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/huge_memory.c:2901:2: warning: Assigned value is garbage or
 undefined [clang-analyzer-core.uninitialized.Assign]
Message-ID: <202303050332.HsgQhpUO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/huge_memory.c:2901:2: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0988a0ea791999ebbf95693f2676381825b05033
commit: 4375a553f46c6cb66d1711d8f514dfdf34ce74b0 mm: move page->deferred_list to folio->_deferred_list
date:   4 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 weeks ago
config: s390-randconfig-c005-20230302 (https://download.01.org/0day-ci/archive/20230305/202303050332.HsgQhpUO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4375a553f46c6cb66d1711d8f514dfdf34ce74b0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4375a553f46c6cb66d1711d8f514dfdf34ce74b0
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303050332.HsgQhpUO-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:380:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   mm/huge_memory.c:619:8: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           ret = current->mm->get_unmapped_area(filp, addr, len_pad,
                 ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/huge_memory.c:646:8: note: Calling '__thp_get_unmapped_area'
           ret = __thp_get_unmapped_area(filp, addr, len, off, flags, PMD_SIZE);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:612:6: note: Assuming 'off_end' is > 'off_align'
           if (off_end <= off_align || (off_end - off_align) < size)
               ^~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:612:6: note: Left side of '||' is false
   mm/huge_memory.c:612:30: note: Assuming the condition is false
           if (off_end <= off_align || (off_end - off_align) < size)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:612:2: note: Taking false branch
           if (off_end <= off_align || (off_end - off_align) < size)
           ^
   mm/huge_memory.c:616:6: note: Assuming 'len_pad' is >= 'len'
           if (len_pad < len || (off + len_pad) < off)
               ^~~~~~~~~~~~~
   mm/huge_memory.c:616:6: note: Left side of '||' is false
   mm/huge_memory.c:616:23: note: Assuming the condition is false
           if (len_pad < len || (off + len_pad) < off)
                                ^~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:616:2: note: Taking false branch
           if (len_pad < len || (off + len_pad) < off)
           ^
   mm/huge_memory.c:619:8: note: Dereference of null pointer
           ret = current->mm->get_unmapped_area(filp, addr, len_pad,
                 ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/huge_memory.c:650:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return current->mm->get_unmapped_area(filp, addr, len, pgoff, flags);
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/huge_memory.c:646:8: note: Calling '__thp_get_unmapped_area'
           ret = __thp_get_unmapped_area(filp, addr, len, off, flags, PMD_SIZE);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:612:6: note: Assuming 'off_end' is <= 'off_align'
           if (off_end <= off_align || (off_end - off_align) < size)
               ^~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:612:27: note: Left side of '||' is true
           if (off_end <= off_align || (off_end - off_align) < size)
                                    ^
   mm/huge_memory.c:613:3: note: Returning zero, which participates in a condition later
                   return 0;
                   ^~~~~~~~
   mm/huge_memory.c:646:8: note: Returning from '__thp_get_unmapped_area'
           ret = __thp_get_unmapped_area(filp, addr, len, off, flags, PMD_SIZE);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:647:6: note: 'ret' is 0
           if (ret)
               ^~~
   mm/huge_memory.c:647:2: note: Taking false branch
           if (ret)
           ^
   mm/huge_memory.c:650:9: note: Dereference of null pointer
           return current->mm->get_unmapped_area(filp, addr, len, pgoff, flags);
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> mm/huge_memory.c:2901:2: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           list_for_each_entry_safe(folio, next, &list, _deferred_list) {
           ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_entry_safe'
                   n = list_next_entry(pos, member);                       \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:19:2: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
           ^              ~~~~~~~~~~~~~
   mm/huge_memory.c:2881:6: note: Assuming field 'memcg' is null
           if (sc->memcg)
               ^~~~~~~~~
   mm/huge_memory.c:2881:2: note: Taking false branch
           if (sc->memcg)
           ^
   mm/huge_memory.c:2885:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
           ^
   include/linux/spinlock.h:380:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:241:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   mm/huge_memory.c:2885:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
           ^
   include/linux/spinlock.h:378:43: note: expanded from macro 'spin_lock_irqsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   mm/huge_memory.c:2887:2: note: Loop condition is false. Execution continues on line 2899
           list_for_each_entry_safe(folio, next, &ds_queue->split_queue,
           ^
   include/linux/list.h:761:2: note: expanded from macro 'list_for_each_entry_safe'
           for (pos = list_first_entry(head, typeof(*pos), member),        \
           ^
   mm/huge_memory.c:2901:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(folio, next, &list, _deferred_list) {
           ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_entry_safe'
                   n = list_next_entry(pos, member);                       \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:19:2: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
           ^              ~~~~~~~~~~~~~
   mm/huge_memory.c:3168:4: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(file_path, tok);
                           ^~~~~~
   mm/huge_memory.c:3168:4: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                           strcpy(file_path, tok);
                           ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   include/linux/list.h:450:13: warning: Access to field 'next' results in a dereference of a null pointer (loaded from variable 'prev') [clang-analyzer-core.NullDereference]
           prev->next = first;
                      ^
   mm/compaction.c:1681:6: note: Assuming the condition is true
           if (list_empty(&cc->freepages)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:1681:2: note: Taking true branch
           if (list_empty(&cc->freepages)) {
           ^
   mm/compaction.c:1682:3: note: Calling 'isolate_freepages'
                   isolate_freepages(cc);
                   ^~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:1570:2: note: Calling 'fast_isolate_freepages'
           fast_isolate_freepages(cc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:1397:23: note: Assuming '__UNIQUE_ID___x462' is <= '__UNIQUE_ID___y463'
           unsigned int limit = max(1U, freelist_scan_limit(cc) >> 1);
                                ^
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   mm/compaction.c:1397:23: note: '?' condition is false
           unsigned int limit = max(1U, freelist_scan_limit(cc) >> 1);
                                ^
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)

vim +2901 mm/huge_memory.c

87eaceb3faa59b Yang Shi                2019-09-23  2884  
364c1eebe453f0 Yang Shi                2019-09-23  2885  	spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
9a982250f773cc Kirill A. Shutemov      2016-01-15  2886  	/* Take pin on all head pages to avoid freeing them under us */
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  2887) 	list_for_each_entry_safe(folio, next, &ds_queue->split_queue,
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  2888) 							_deferred_list) {
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  2889) 		if (folio_try_get(folio)) {
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  2890) 			list_move(&folio->_deferred_list, &list);
e3ae19535c6657 Kirill A. Shutemov      2016-02-02  2891  		} else {
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  2892) 			/* We lost race with folio_put() */
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  2893) 			list_del_init(&folio->_deferred_list);
364c1eebe453f0 Yang Shi                2019-09-23  2894  			ds_queue->split_queue_len--;
9a982250f773cc Kirill A. Shutemov      2016-01-15  2895  		}
e3ae19535c6657 Kirill A. Shutemov      2016-02-02  2896  		if (!--sc->nr_to_scan)
e3ae19535c6657 Kirill A. Shutemov      2016-02-02  2897  			break;
9a982250f773cc Kirill A. Shutemov      2016-01-15  2898  	}
364c1eebe453f0 Yang Shi                2019-09-23  2899  	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
9a982250f773cc Kirill A. Shutemov      2016-01-15  2900  
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11 @2901) 	list_for_each_entry_safe(folio, next, &list, _deferred_list) {
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  2902) 		if (!folio_trylock(folio))
fa41b900c30b45 Kirill A. Shutemov      2018-03-22  2903  			goto next;
9a982250f773cc Kirill A. Shutemov      2016-01-15  2904  		/* split_huge_page() removes page from list on success */
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  2905) 		if (!split_folio(folio))
9a982250f773cc Kirill A. Shutemov      2016-01-15  2906  			split++;
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  2907) 		folio_unlock(folio);
fa41b900c30b45 Kirill A. Shutemov      2018-03-22  2908  next:
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  2909) 		folio_put(folio);
9a982250f773cc Kirill A. Shutemov      2016-01-15  2910  	}
9a982250f773cc Kirill A. Shutemov      2016-01-15  2911  
364c1eebe453f0 Yang Shi                2019-09-23  2912  	spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
364c1eebe453f0 Yang Shi                2019-09-23  2913  	list_splice_tail(&list, &ds_queue->split_queue);
364c1eebe453f0 Yang Shi                2019-09-23  2914  	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
9a982250f773cc Kirill A. Shutemov      2016-01-15  2915  
cb8d68ec16a511 Kirill A. Shutemov      2016-02-02  2916  	/*
cb8d68ec16a511 Kirill A. Shutemov      2016-02-02  2917  	 * Stop shrinker if we didn't split any page, but the queue is empty.
cb8d68ec16a511 Kirill A. Shutemov      2016-02-02  2918  	 * This can happen if pages were freed under us.
cb8d68ec16a511 Kirill A. Shutemov      2016-02-02  2919  	 */
364c1eebe453f0 Yang Shi                2019-09-23  2920  	if (!split && list_empty(&ds_queue->split_queue))
cb8d68ec16a511 Kirill A. Shutemov      2016-02-02  2921  		return SHRINK_STOP;
cb8d68ec16a511 Kirill A. Shutemov      2016-02-02  2922  	return split;
9a982250f773cc Kirill A. Shutemov      2016-01-15  2923  }
9a982250f773cc Kirill A. Shutemov      2016-01-15  2924  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
