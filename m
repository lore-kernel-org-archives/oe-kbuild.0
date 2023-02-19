Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AB27FA
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 05:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676783128; x=1708319128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UmKQk+seHeY0sp1M20Dew7Wb9tDAtsswz4SJl8Ebzp4=;
  b=kEsQO/amhbvUwSOytaxmzlf1YYwuPXrZxSRQQunwwlfaNOfqH25NeIwU
   1ZfxB+jaOrFRXzMReEzXZZsMN5tjLwiGEHk7SmjDbjtS3opDqvzFmShIL
   AaUrwFdZmw/DTor+PvQJ0jMl5Oywi3uJioaec0GYj0chzuz4FVT7rqFZP
   li0gF//82AjXiX51RSdTG5x30BvZ92TvqRPF7rRvF7SgNv+jaStTaqlrH
   xh2BcVqAyqx4ERt12F+axkAXutrXcYiKrz4xgRXjqXPXl+WosazkqD7mN
   bSsDfFJtEPdfF+nJA/PBSHGaItrbGu+vXJIlmcHNzEyrArCXWAZOhBf2+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="332229949"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="332229949"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 21:05:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="999920661"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="999920661"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Feb 2023 21:05:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTbt7-000D3J-2Y;
	Sun, 19 Feb 2023 05:05:25 +0000
Date: Sun, 19 Feb 2023 13:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:in-memory-btrees 105/182] fs/xfs/scrub/newbt.c:320:2:
 warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Message-ID: <202302191241.rVIQMM2p-lkp@intel.com>
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
head:   65b160b063691d49f132134659b0b200cb138e72
commit: d53b22d77a9007fbf9c29abba8496e46bda2e7e1 [105/182] xfs: implement block reservation accounting for btrees we're staging
:::::: branch date: 28 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20230212 (https://download.01.org/0day-ci/archive/20230219/202302191241.rVIQMM2p-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/r/202302191241.rVIQMM2p-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                               ^~~
   fs/xfs/xfs_log.c:3402:2: note: Loop condition is false.  Exiting loop
           XFS_STATS_INC(mp, xs_log_force);
           ^
   fs/xfs/xfs_stats.h:165:2: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(xfsstats.xs_stats, current_cpu())->s.v++;   \
           ^
   include/linux/percpu-defs.h:235:2: note: expanded from macro 'per_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   fs/xfs/xfs_log.c:3402:2: note: Dereference of null pointer
           XFS_STATS_INC(mp, xs_log_force);
           ^
   fs/xfs/xfs_stats.h:165:2: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(xfsstats.xs_stats, current_cpu())->s.v++;   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:236:41: note: expanded from macro 'per_cpu_ptr'
           SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/asm-generic/percpu.h:21:45: note: expanded from macro 'per_cpu_offset'
   #define per_cpu_offset(x) (__per_cpu_offset[x])
                                               ^
   include/linux/percpu-defs.h:231:56: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:170:29: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                               ^~~
   fs/xfs/xfs_log.c:3557:17: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           tic->t_task             = current;
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/xfs/xfs_log.c:3557:17: note: Dereference of null pointer
           tic->t_task             = current;
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 14 warnings (14 in non-user code).
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
   13 warnings generated.
   arch/s390/include/asm/pgtable.h:1646:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (!MACHINE_HAS_NX)
                ^
   arch/s390/include/asm/setup.h:94:26: note: expanded from macro 'MACHINE_HAS_NX'
   #define MACHINE_HAS_NX          (S390_lowcore.machine_flags & MACHINE_FLAG_NX)
                                    ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/rmap.c:1079:2: note: Taking false branch
           if (invalid_mkclean_vma(vma, NULL))
           ^
   mm/rmap.c:1085:9: note: Calling 'page_vma_mkclean_one'
           return page_vma_mkclean_one(&pvmw);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/rmap.c:958:2: note: Loop condition is true.  Entering loop body
           while (page_vma_mapped_walk(pvmw)) {
           ^
   mm/rmap.c:962:7: note: Assuming field 'pte' is null
                   if (pvmw->pte) {
                       ^~~~~~~~~
   mm/rmap.c:962:3: note: Taking false branch
                   if (pvmw->pte) {
                   ^
   mm/rmap.c:980:25: note: Left side of '&&' is false
                           if (!pmd_dirty(*pmd) && !pmd_write(*pmd))

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
