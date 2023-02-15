Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D765E7B
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Feb 2023 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676479435; x=1708015435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cb1V5B9yRuocm1CGp9BBItwFOmr1o68hLZgrC7k5Z1M=;
  b=hP1DlBd/B6l4/G7Cg/27nnJ21Zqxq2HzATK1w7YL60/3G2bvwrJLqHCx
   1JzUsFFjMo7yRmT3oyCXb4L47mBnG14suglKjEP5N0VfVrTMKRoYa5qC9
   Ue01WKSG5eRltyCbPy5mSPR1js22aFBC47y/OfbQ/oxQ3l63LUqGS6mi0
   m4ldRTkpDs4pOQPmVJJcEMMbCBBS6ipGBh0XyxWsTdCx5gP3i91F7s/Gh
   kbEWkjuFDiC/+/752J5u/MLyoEcHEmkS4ShnJcpWL0PTnSFeDZUwE9c9D
   fBU2Xwz+brHOFON0XAHwD+sr9QCWzUwHOzJhYOgkLxn5umGAut2yt0L7V
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="330107618"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="330107618"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 08:43:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="669690245"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="669690245"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Feb 2023 08:43:53 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSKsr-0009Yr-0L;
	Wed, 15 Feb 2023 16:43:53 +0000
Date: Thu, 16 Feb 2023 00:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:in-memory-btrees 105/182] fs/xfs/scrub/newbt.c:320:2:
 warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Message-ID: <202302160051.Rfm4smVA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/scrub/newbt.c:320:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git in-memory-btrees
head:   d2b66bc91f378dde0839bf411f8a9c6f56656acc
commit: d53b22d77a9007fbf9c29abba8496e46bda2e7e1 [105/182] xfs: implement block reservation accounting for btrees we're staging
:::::: branch date: 12 hours ago
:::::: commit date: 2 weeks ago
config: s390-randconfig-c005-20230212 (https://download.01.org/0day-ci/archive/20230216/202302160051.Rfm4smVA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=d53b22d77a9007fbf9c29abba8496e46bda2e7e1
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs in-memory-btrees
        git checkout d53b22d77a9007fbf9c29abba8496e46bda2e7e1
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302160051.Rfm4smVA-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                    ^
   include/linux/thread_info.h:141:22: note: expanded from macro 'test_thread_flag'
           test_ti_thread_flag(current_thread_info(), flag)
                               ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/mmu_gather.c:337:2: note: Calling '__tlb_gather_mmu'
           __tlb_gather_mmu(tlb, mm, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mmu_gather.c:318:2: note: Calling 'tlb_table_init'
           tlb_table_init(tlb);
           ^~~~~~~~~~~~~~~~~~~
   mm/mmu_gather.c:318:2: note: Returning from 'tlb_table_init'
           tlb_table_init(tlb);
           ^~~~~~~~~~~~~~~~~~~
   mm/mmu_gather.c:323:2: note: Calling '__tlb_reset_range'
           __tlb_reset_range(tlb);
           ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/tlb.h:365:11: note: Field 'fullmm' is 0
           if (tlb->fullmm) {
                    ^
   include/asm-generic/tlb.h:365:2: note: Taking false branch
           if (tlb->fullmm) {
           ^
   include/asm-generic/tlb.h:368:16: note: Dereference of null pointer
                   tlb->start = TASK_SIZE;
                                ^
   arch/s390/include/asm/processor.h:92:21: note: expanded from macro 'TASK_SIZE'
   #define TASK_SIZE               (test_thread_flag(TIF_31BIT) ? \
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h:141:22: note: expanded from macro 'test_thread_flag'
           test_ti_thread_flag(current_thread_info(), flag)
                               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   fs/xfs/scrub/common.h:26:27: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (fatal_signal_pending(current)) {
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/xfs/scrub/quota.c:90:6: note: Calling 'xchk_should_terminate'
           if (xchk_should_terminate(sc, &error))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/common.h:26:27: note: Dereference of null pointer
           if (fatal_signal_pending(current)) {
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   fs/xfs/scrub/common.h:26:27: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (fatal_signal_pending(current)) {
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/xfs/scrub/agheader_repair.c:472:6: note: Calling 'xchk_should_terminate'
           if (xchk_should_terminate(ra->sc, &error))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/common.h:26:27: note: Dereference of null pointer
           if (fatal_signal_pending(current)) {
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
>> fs/xfs/scrub/newbt.c:320:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(resv, n, &xnr->resv_list, list) {
           ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_entry_safe'
                   n = list_next_entry(pos, member);                       \
                       ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:19:25: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
                                  ^
   fs/xfs/scrub/newbt.c:354:2: note: Calling 'xrep_newbt_free'
           xrep_newbt_free(xnr, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/newbt.c:287:6: note: Assuming the condition is false
           if (xfs_is_shutdown(sc->mp))
               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/newbt.c:287:2: note: Taking false branch
           if (xfs_is_shutdown(sc->mp))
           ^
   fs/xfs/scrub/newbt.c:290:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry_safe(resv, n, &xnr->resv_list, list) {
           ^
   include/linux/list.h:761:2: note: expanded from macro 'list_for_each_entry_safe'
           for (pos = list_first_entry(head, typeof(*pos), member),        \
           ^
   fs/xfs/scrub/newbt.c:296:3: note: Memory is released
                   kfree(resv);
                   ^~~~~~~~~~~
   fs/xfs/scrub/newbt.c:297:7: note: 'ret' is >= 0
                   if (ret < 0) {
                       ^~~
   fs/xfs/scrub/newbt.c:297:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   fs/xfs/scrub/newbt.c:303:7: note: 'freed' is < XREP_REAP_MAX_NEWBT_EFIS
                   if (freed >= XREP_REAP_MAX_NEWBT_EFIS) {
                       ^~~~~
   fs/xfs/scrub/newbt.c:303:3: note: Taking false branch
                   if (freed >= XREP_REAP_MAX_NEWBT_EFIS) {
                   ^
   fs/xfs/scrub/newbt.c:290:2: note: Loop condition is false. Execution continues on line 311
           list_for_each_entry_safe(resv, n, &xnr->resv_list, list) {
           ^
   include/linux/list.h:761:2: note: expanded from macro 'list_for_each_entry_safe'
           for (pos = list_first_entry(head, typeof(*pos), member),        \
           ^
   fs/xfs/scrub/newbt.c:311:6: note: 'freed' is 0
           if (freed)
               ^~~~~
   fs/xfs/scrub/newbt.c:311:2: note: Taking false branch
           if (freed)
           ^
   fs/xfs/scrub/newbt.c:320:2: note: Use of memory after it is freed
           list_for_each_entry_safe(resv, n, &xnr->resv_list, list) {
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
   include/linux/container_of.h:19:25: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
                                  ^~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   32 warnings generated.
   arch/s390/kernel/ptrace.c:54:6: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (MACHINE_HAS_TE) {
               ^
   arch/s390/include/asm/setup.h:90:26: note: expanded from macro 'MACHINE_HAS_TE'
   #define MACHINE_HAS_TE          (S390_lowcore.machine_flags & MACHINE_FLAG_TE)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/ptrace.c:49:2: note: Taking false branch
           __ctl_store(cr0_old.val, 0, 0);
           ^
   arch/s390/include/asm/ctl_reg.h:52:2: note: expanded from macro '__ctl_store'
           BUILD_BUG_ON(sizeof(addrtype) != (high - low + 1) * sizeof(long));\
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)

vim +320 fs/xfs/scrub/newbt.c

d53b22d77a9007 Darrick J. Wong 2022-07-14  271  
d53b22d77a9007 Darrick J. Wong 2022-07-14  272  /* Free all the accounting info and disk space we reserved for a new btree. */
d53b22d77a9007 Darrick J. Wong 2022-07-14  273  STATIC int
d53b22d77a9007 Darrick J. Wong 2022-07-14  274  xrep_newbt_free(
d53b22d77a9007 Darrick J. Wong 2022-07-14  275  	struct xrep_newbt	*xnr,
d53b22d77a9007 Darrick J. Wong 2022-07-14  276  	bool			btree_committed)
d53b22d77a9007 Darrick J. Wong 2022-07-14  277  {
d53b22d77a9007 Darrick J. Wong 2022-07-14  278  	struct xfs_scrub	*sc = xnr->sc;
d53b22d77a9007 Darrick J. Wong 2022-07-14  279  	struct xrep_newbt_resv	*resv, *n;
d53b22d77a9007 Darrick J. Wong 2022-07-14  280  	unsigned int		freed = 0;
d53b22d77a9007 Darrick J. Wong 2022-07-14  281  	int			error = 0;
d53b22d77a9007 Darrick J. Wong 2022-07-14  282  
d53b22d77a9007 Darrick J. Wong 2022-07-14  283  	/*
d53b22d77a9007 Darrick J. Wong 2022-07-14  284  	 * If the filesystem already went down, we can't free the blocks.  Skip
d53b22d77a9007 Darrick J. Wong 2022-07-14  285  	 * ahead to freeing the incore metadata because we can't fix anything.
d53b22d77a9007 Darrick J. Wong 2022-07-14  286  	 */
d53b22d77a9007 Darrick J. Wong 2022-07-14  287  	if (xfs_is_shutdown(sc->mp))
d53b22d77a9007 Darrick J. Wong 2022-07-14  288  		goto junkit;
d53b22d77a9007 Darrick J. Wong 2022-07-14  289  
d53b22d77a9007 Darrick J. Wong 2022-07-14  290  	list_for_each_entry_safe(resv, n, &xnr->resv_list, list) {
d53b22d77a9007 Darrick J. Wong 2022-07-14  291  		int		ret;
d53b22d77a9007 Darrick J. Wong 2022-07-14  292  
d53b22d77a9007 Darrick J. Wong 2022-07-14  293  		ret = xrep_newbt_free_extent(xnr, resv, btree_committed);
d53b22d77a9007 Darrick J. Wong 2022-07-14  294  		list_del(&resv->list);
d53b22d77a9007 Darrick J. Wong 2022-07-14  295  		xfs_perag_put(resv->pag);
d53b22d77a9007 Darrick J. Wong 2022-07-14  296  		kfree(resv);
d53b22d77a9007 Darrick J. Wong 2022-07-14  297  		if (ret < 0) {
d53b22d77a9007 Darrick J. Wong 2022-07-14  298  			error = ret;
d53b22d77a9007 Darrick J. Wong 2022-07-14  299  			goto junkit;
d53b22d77a9007 Darrick J. Wong 2022-07-14  300  		}
d53b22d77a9007 Darrick J. Wong 2022-07-14  301  
d53b22d77a9007 Darrick J. Wong 2022-07-14  302  		freed += ret;
d53b22d77a9007 Darrick J. Wong 2022-07-14  303  		if (freed >= XREP_REAP_MAX_NEWBT_EFIS) {
d53b22d77a9007 Darrick J. Wong 2022-07-14  304  			error = xrep_defer_finish(sc);
d53b22d77a9007 Darrick J. Wong 2022-07-14  305  			if (error)
d53b22d77a9007 Darrick J. Wong 2022-07-14  306  				goto junkit;
d53b22d77a9007 Darrick J. Wong 2022-07-14  307  			freed = 0;
d53b22d77a9007 Darrick J. Wong 2022-07-14  308  		}
d53b22d77a9007 Darrick J. Wong 2022-07-14  309  	}
d53b22d77a9007 Darrick J. Wong 2022-07-14  310  
d53b22d77a9007 Darrick J. Wong 2022-07-14  311  	if (freed)
d53b22d77a9007 Darrick J. Wong 2022-07-14  312  		error = xrep_defer_finish(sc);
d53b22d77a9007 Darrick J. Wong 2022-07-14  313  
d53b22d77a9007 Darrick J. Wong 2022-07-14  314  junkit:
d53b22d77a9007 Darrick J. Wong 2022-07-14  315  	/*
d53b22d77a9007 Darrick J. Wong 2022-07-14  316  	 * If we still have reservations attached to @newbt, cleanup must have
d53b22d77a9007 Darrick J. Wong 2022-07-14  317  	 * failed and the filesystem is about to go down.  Clean up the incore
d53b22d77a9007 Darrick J. Wong 2022-07-14  318  	 * reservations.
d53b22d77a9007 Darrick J. Wong 2022-07-14  319  	 */
d53b22d77a9007 Darrick J. Wong 2022-07-14 @320  	list_for_each_entry_safe(resv, n, &xnr->resv_list, list) {
d53b22d77a9007 Darrick J. Wong 2022-07-14  321  		list_del(&resv->list);
d53b22d77a9007 Darrick J. Wong 2022-07-14  322  		xfs_perag_put(resv->pag);
d53b22d77a9007 Darrick J. Wong 2022-07-14  323  		kfree(resv);
d53b22d77a9007 Darrick J. Wong 2022-07-14  324  	}
d53b22d77a9007 Darrick J. Wong 2022-07-14  325  
d53b22d77a9007 Darrick J. Wong 2022-07-14  326  	if (sc->ip) {
d53b22d77a9007 Darrick J. Wong 2022-07-14  327  		kmem_cache_free(xfs_ifork_cache, xnr->ifake.if_fork);
d53b22d77a9007 Darrick J. Wong 2022-07-14  328  		xnr->ifake.if_fork = NULL;
d53b22d77a9007 Darrick J. Wong 2022-07-14  329  	}
d53b22d77a9007 Darrick J. Wong 2022-07-14  330  
d53b22d77a9007 Darrick J. Wong 2022-07-14  331  	return error;
d53b22d77a9007 Darrick J. Wong 2022-07-14  332  }
d53b22d77a9007 Darrick J. Wong 2022-07-14  333  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
