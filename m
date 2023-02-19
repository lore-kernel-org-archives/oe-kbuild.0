Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5EA2F4B
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 18:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676832525; x=1708368525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K/j5oQepU38FXWsP2EOJmxs7M9VuUaPSkST7SavtsDg=;
  b=QHz5voIjVlf08H68HR6scPGXEPl7BTHOeXtGkU4QNKqN3zKkswxPahWy
   iPvpkNIAvG+qvFRtzhHM6eueUJwH+6BG7fI63ung37sPdTsRcPdjXThyk
   vG9xOm4JYAZZ5LYcl9wGeUEhApsNOpayBrMnzKu/VQqh1IkETk/yhSaZj
   Csl4D17wCKkoo+/SkGEF09TVBxntsCWYSsGrw4p5PoEe+oLGinEKEmnaO
   9ox9SAKsG82grTA0Blz+AuDYIl7roiGDsfnniEPHSo12JT+bKyCTscwgS
   W/P9MY79gngk+wwe7O5PEn/zGMpU8/dvU1Ook+/poCvmc8EbnQQXoss8L
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="396958809"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="396958809"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 10:48:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="701464450"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="701464450"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Feb 2023 10:48:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTojp-000DPq-1i;
	Sun, 19 Feb 2023 18:48:41 +0000
Date: Mon, 20 Feb 2023 02:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:in-memory-btrees 133/182]
 fs/xfs/scrub/inode_repair.c:910:4: warning: Value stored to 'afork_min' is
 never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302200204.rApkDm1y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/scrub/inode_repair.c:910:4: warning: Value stored to 'afork_min' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git in-memory-btrees
head:   65b160b063691d49f132134659b0b200cb138e72
commit: daa466d4abed0c2f32bd41e353f32bed6811798b [133/182] xfs: zap broken inode forks
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20230212 (https://download.01.org/0day-ci/archive/20230220/202302200204.rApkDm1y-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=daa466d4abed0c2f32bd41e353f32bed6811798b
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs in-memory-btrees
        git checkout daa466d4abed0c2f32bd41e353f32bed6811798b
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302200204.rApkDm1y-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   arch/s390/kernel/time.c:612:6: note: Left side of '||' is false
   arch/s390/kernel/time.c:612:23: note: Calling 'check_sync_clock'
           if (!stp_info.lu || !check_sync_clock()) {
                                ^~~~~~~~~~~~~~~~~~
   arch/s390/kernel/time.c:357:12: note: Loop condition is false.  Exiting loop
           sw_ptr = &get_cpu_var(clock_sync_word);
                     ^
   include/linux/percpu-defs.h:278:2: note: expanded from macro 'get_cpu_var'
           this_cpu_ptr(&var);                                             \
           ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   arch/s390/kernel/time.c:357:12: note: Dereference of null pointer
           sw_ptr = &get_cpu_var(clock_sync_word);
                     ^
   include/linux/percpu-defs.h:278:2: note: expanded from macro 'get_cpu_var'
           this_cpu_ptr(&var);                                             \
           ^~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_ptr'
           arch_raw_cpu_ptr(ptr);                                          \
           ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   arch/s390/kernel/time.c:406:6: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (S390_lowcore.clock_comparator != clock_comparator_max) {
               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/time.c:406:6: note: Dereference of null pointer
           if (S390_lowcore.clock_comparator != clock_comparator_max) {
               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
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
   fs/xfs/scrub/ialloc_repair.c:420:6: note: Calling 'xchk_should_terminate'
           if (xchk_should_terminate(ri->sc, &error))
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
   16 warnings generated.
   fs/xfs/scrub/common.h:26:27: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (fatal_signal_pending(current)) {
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/xfs/scrub/inode_repair.c:399:6: note: Calling 'xchk_should_terminate'
           if (xchk_should_terminate(ri->sc, &error))
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
>> fs/xfs/scrub/inode_repair.c:910:4: warning: Value stored to 'afork_min' is never read [clang-analyzer-deadcode.DeadStores]
                           afork_min = bmdr_minsz;
                           ^           ~~~~~~~~~~
   fs/xfs/scrub/inode_repair.c:910:4: note: Value stored to 'afork_min' is never read
                           afork_min = bmdr_minsz;
                           ^           ~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   fs/xfs/scrub/newbt.c:487:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
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
   fs/xfs/scrub/newbt.c:522:2: note: Calling 'xrep_newbt_free'
           xrep_newbt_free(xnr, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/newbt.c:454:6: note: Assuming the condition is false
           if (xfs_is_shutdown(sc->mp))
               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/newbt.c:454:2: note: Taking false branch
           if (xfs_is_shutdown(sc->mp))
           ^
   fs/xfs/scrub/newbt.c:457:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry_safe(resv, n, &xnr->resv_list, list) {
           ^
   include/linux/list.h:761:2: note: expanded from macro 'list_for_each_entry_safe'
           for (pos = list_first_entry(head, typeof(*pos), member),        \
           ^
   fs/xfs/scrub/newbt.c:463:3: note: Memory is released
                   kfree(resv);
                   ^~~~~~~~~~~
   fs/xfs/scrub/newbt.c:464:7: note: 'ret' is >= 0
                   if (ret < 0) {
                       ^~~
   fs/xfs/scrub/newbt.c:464:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   fs/xfs/scrub/newbt.c:470:7: note: 'freed' is < XREP_REAP_MAX_NEWBT_EFIS
                   if (freed >= XREP_REAP_MAX_NEWBT_EFIS) {
                       ^~~~~
   fs/xfs/scrub/newbt.c:470:3: note: Taking false branch
                   if (freed >= XREP_REAP_MAX_NEWBT_EFIS) {
                   ^
   fs/xfs/scrub/newbt.c:457:2: note: Loop condition is false. Execution continues on line 478
           list_for_each_entry_safe(resv, n, &xnr->resv_list, list) {
           ^
   include/linux/list.h:761:2: note: expanded from macro 'list_for_each_entry_safe'
           for (pos = list_first_entry(head, typeof(*pos), member),        \
           ^
   fs/xfs/scrub/newbt.c:478:6: note: 'freed' is 0
           if (freed)
               ^~~~~
   fs/xfs/scrub/newbt.c:478:2: note: Taking false branch
           if (freed)
           ^
   fs/xfs/scrub/newbt.c:487:2: note: Use of memory after it is freed
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
   16 warnings generated.
   fs/binfmt_elf.c:127:27: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           current->mm->start_brk = current->mm->brk = end;
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/binfmt_elf.c:116:6: note: Assuming 'end' is <= 'start'
           if (end > start) {
               ^~~~~~~~~~~
   fs/binfmt_elf.c:116:2: note: Taking false branch
           if (end > start) {
           ^
   fs/binfmt_elf.c:127:27: note: Dereference of null pointer
           current->mm->start_brk = current->mm->brk = end;

vim +/afork_min +910 fs/xfs/scrub/inode_repair.c

daa466d4abed0c Darrick J. Wong 2022-07-14  765  
daa466d4abed0c Darrick J. Wong 2022-07-14  766  /* Make sure the fork offset is a sensible value. */
daa466d4abed0c Darrick J. Wong 2022-07-14  767  STATIC void
daa466d4abed0c Darrick J. Wong 2022-07-14  768  xrep_dinode_ensure_forkoff(
daa466d4abed0c Darrick J. Wong 2022-07-14  769  	struct xrep_inode	*ri,
daa466d4abed0c Darrick J. Wong 2022-07-14  770  	struct xfs_dinode	*dip,
daa466d4abed0c Darrick J. Wong 2022-07-14  771  	uint16_t		mode)
daa466d4abed0c Darrick J. Wong 2022-07-14  772  {
daa466d4abed0c Darrick J. Wong 2022-07-14  773  	struct xfs_bmdr_block	*bmdr;
daa466d4abed0c Darrick J. Wong 2022-07-14  774  	struct xfs_scrub	*sc = ri->sc;
daa466d4abed0c Darrick J. Wong 2022-07-14  775  	xfs_extnum_t		attr_extents, data_extents;
daa466d4abed0c Darrick J. Wong 2022-07-14  776  	size_t			bmdr_minsz = XFS_BMDR_SPACE_CALC(1);
daa466d4abed0c Darrick J. Wong 2022-07-14  777  	unsigned int		lit_sz = XFS_LITINO(sc->mp);
daa466d4abed0c Darrick J. Wong 2022-07-14  778  	unsigned int		afork_min, dfork_min;
daa466d4abed0c Darrick J. Wong 2022-07-14  779  
daa466d4abed0c Darrick J. Wong 2022-07-14  780  	trace_xrep_dinode_ensure_forkoff(sc, dip);
daa466d4abed0c Darrick J. Wong 2022-07-14  781  
daa466d4abed0c Darrick J. Wong 2022-07-14  782  	/*
daa466d4abed0c Darrick J. Wong 2022-07-14  783  	 * Before calling this function, xrep_dinode_core ensured that both
daa466d4abed0c Darrick J. Wong 2022-07-14  784  	 * forks actually fit inside their respective literal areas.  If this
daa466d4abed0c Darrick J. Wong 2022-07-14  785  	 * was not the case, the fork was reset to FMT_EXTENTS with zero
daa466d4abed0c Darrick J. Wong 2022-07-14  786  	 * records.  If the rmapbt scan found attr or data fork blocks, this
daa466d4abed0c Darrick J. Wong 2022-07-14  787  	 * will be noted in the dinode_stats, and we must leave enough room
daa466d4abed0c Darrick J. Wong 2022-07-14  788  	 * for the bmap repair code to reconstruct the mapping structure.
daa466d4abed0c Darrick J. Wong 2022-07-14  789  	 *
daa466d4abed0c Darrick J. Wong 2022-07-14  790  	 * First, compute the minimum space required for the attr fork.
daa466d4abed0c Darrick J. Wong 2022-07-14  791  	 */
daa466d4abed0c Darrick J. Wong 2022-07-14  792  	switch (dip->di_aformat) {
daa466d4abed0c Darrick J. Wong 2022-07-14  793  	case XFS_DINODE_FMT_LOCAL:
daa466d4abed0c Darrick J. Wong 2022-07-14  794  		/*
daa466d4abed0c Darrick J. Wong 2022-07-14  795  		 * If we still have a shortform xattr structure at all, that
daa466d4abed0c Darrick J. Wong 2022-07-14  796  		 * means the attr fork area was exactly large enough to fit
daa466d4abed0c Darrick J. Wong 2022-07-14  797  		 * the sf structure.
daa466d4abed0c Darrick J. Wong 2022-07-14  798  		 */
daa466d4abed0c Darrick J. Wong 2022-07-14  799  		afork_min = XFS_DFORK_SIZE(dip, sc->mp, XFS_ATTR_FORK);
daa466d4abed0c Darrick J. Wong 2022-07-14  800  		break;
daa466d4abed0c Darrick J. Wong 2022-07-14  801  	case XFS_DINODE_FMT_EXTENTS:
daa466d4abed0c Darrick J. Wong 2022-07-14  802  		attr_extents = xfs_dfork_attr_extents(dip);
daa466d4abed0c Darrick J. Wong 2022-07-14  803  		if (attr_extents) {
daa466d4abed0c Darrick J. Wong 2022-07-14  804  			/*
daa466d4abed0c Darrick J. Wong 2022-07-14  805  			 * We must maintain sufficient space to hold the entire
daa466d4abed0c Darrick J. Wong 2022-07-14  806  			 * extent map array in the data fork.  Note that we
daa466d4abed0c Darrick J. Wong 2022-07-14  807  			 * previously zapped the fork if it had no chance of
daa466d4abed0c Darrick J. Wong 2022-07-14  808  			 * fitting in the inode.
daa466d4abed0c Darrick J. Wong 2022-07-14  809  			 */
daa466d4abed0c Darrick J. Wong 2022-07-14  810  			afork_min = sizeof(struct xfs_bmbt_rec) * attr_extents;
daa466d4abed0c Darrick J. Wong 2022-07-14  811  		} else if (ri->attr_extents > 0) {
daa466d4abed0c Darrick J. Wong 2022-07-14  812  			/*
daa466d4abed0c Darrick J. Wong 2022-07-14  813  			 * The attr fork thinks it has zero extents, but we
daa466d4abed0c Darrick J. Wong 2022-07-14  814  			 * found some xattr extents.  We need to leave enough
daa466d4abed0c Darrick J. Wong 2022-07-14  815  			 * empty space here so that the incore attr fork will
daa466d4abed0c Darrick J. Wong 2022-07-14  816  			 * get created (and hence trigger the attr fork bmap
daa466d4abed0c Darrick J. Wong 2022-07-14  817  			 * repairer).
daa466d4abed0c Darrick J. Wong 2022-07-14  818  			 */
daa466d4abed0c Darrick J. Wong 2022-07-14  819  			afork_min = bmdr_minsz;
daa466d4abed0c Darrick J. Wong 2022-07-14  820  		} else {
daa466d4abed0c Darrick J. Wong 2022-07-14  821  			/* No extents on disk or found in rmapbt. */
daa466d4abed0c Darrick J. Wong 2022-07-14  822  			afork_min = 0;
daa466d4abed0c Darrick J. Wong 2022-07-14  823  		}
daa466d4abed0c Darrick J. Wong 2022-07-14  824  		break;
daa466d4abed0c Darrick J. Wong 2022-07-14  825  	case XFS_DINODE_FMT_BTREE:
daa466d4abed0c Darrick J. Wong 2022-07-14  826  		/* Must have space for btree header and key/pointers. */
daa466d4abed0c Darrick J. Wong 2022-07-14  827  		bmdr = XFS_DFORK_PTR(dip, XFS_ATTR_FORK);
daa466d4abed0c Darrick J. Wong 2022-07-14  828  		afork_min = XFS_BMAP_BROOT_SPACE(sc->mp, bmdr);
daa466d4abed0c Darrick J. Wong 2022-07-14  829  		break;
daa466d4abed0c Darrick J. Wong 2022-07-14  830  	default:
daa466d4abed0c Darrick J. Wong 2022-07-14  831  		/* We should never see any other formats. */
daa466d4abed0c Darrick J. Wong 2022-07-14  832  		afork_min = 0;
daa466d4abed0c Darrick J. Wong 2022-07-14  833  		break;
daa466d4abed0c Darrick J. Wong 2022-07-14  834  	}
daa466d4abed0c Darrick J. Wong 2022-07-14  835  
daa466d4abed0c Darrick J. Wong 2022-07-14  836  	/* Compute the minimum space required for the data fork. */
daa466d4abed0c Darrick J. Wong 2022-07-14  837  	switch (dip->di_format) {
daa466d4abed0c Darrick J. Wong 2022-07-14  838  	case XFS_DINODE_FMT_DEV:
daa466d4abed0c Darrick J. Wong 2022-07-14  839  		dfork_min = sizeof(__be32);
daa466d4abed0c Darrick J. Wong 2022-07-14  840  		break;
daa466d4abed0c Darrick J. Wong 2022-07-14  841  	case XFS_DINODE_FMT_UUID:
daa466d4abed0c Darrick J. Wong 2022-07-14  842  		dfork_min = sizeof(uuid_t);
daa466d4abed0c Darrick J. Wong 2022-07-14  843  		break;
daa466d4abed0c Darrick J. Wong 2022-07-14  844  	case XFS_DINODE_FMT_LOCAL:
daa466d4abed0c Darrick J. Wong 2022-07-14  845  		/*
daa466d4abed0c Darrick J. Wong 2022-07-14  846  		 * If we still have a shortform data fork at all, that means
daa466d4abed0c Darrick J. Wong 2022-07-14  847  		 * the data fork area was large enough to fit whatever was in
daa466d4abed0c Darrick J. Wong 2022-07-14  848  		 * there.
daa466d4abed0c Darrick J. Wong 2022-07-14  849  		 */
daa466d4abed0c Darrick J. Wong 2022-07-14  850  		dfork_min = be64_to_cpu(dip->di_size);
daa466d4abed0c Darrick J. Wong 2022-07-14  851  		break;
daa466d4abed0c Darrick J. Wong 2022-07-14  852  	case XFS_DINODE_FMT_EXTENTS:
daa466d4abed0c Darrick J. Wong 2022-07-14  853  		data_extents = xfs_dfork_data_extents(dip);
daa466d4abed0c Darrick J. Wong 2022-07-14  854  		if (data_extents) {
daa466d4abed0c Darrick J. Wong 2022-07-14  855  			/*
daa466d4abed0c Darrick J. Wong 2022-07-14  856  			 * We must maintain sufficient space to hold the entire
daa466d4abed0c Darrick J. Wong 2022-07-14  857  			 * extent map array in the data fork.  Note that we
daa466d4abed0c Darrick J. Wong 2022-07-14  858  			 * previously zapped the fork if it had no chance of
daa466d4abed0c Darrick J. Wong 2022-07-14  859  			 * fitting in the inode.
daa466d4abed0c Darrick J. Wong 2022-07-14  860  			 */
daa466d4abed0c Darrick J. Wong 2022-07-14  861  			dfork_min = sizeof(struct xfs_bmbt_rec) * data_extents;
daa466d4abed0c Darrick J. Wong 2022-07-14  862  		} else if (ri->data_extents > 0 || ri->rt_extents > 0) {
daa466d4abed0c Darrick J. Wong 2022-07-14  863  			/*
daa466d4abed0c Darrick J. Wong 2022-07-14  864  			 * The data fork thinks it has zero extents, but we
daa466d4abed0c Darrick J. Wong 2022-07-14  865  			 * found some data extents.  We need to leave enough
daa466d4abed0c Darrick J. Wong 2022-07-14  866  			 * empty space here so that the the data fork bmap
daa466d4abed0c Darrick J. Wong 2022-07-14  867  			 * repair will recover the mappings.
daa466d4abed0c Darrick J. Wong 2022-07-14  868  			 */
daa466d4abed0c Darrick J. Wong 2022-07-14  869  			dfork_min = bmdr_minsz;
daa466d4abed0c Darrick J. Wong 2022-07-14  870  		} else {
daa466d4abed0c Darrick J. Wong 2022-07-14  871  			/* No extents on disk or found in rmapbt. */
daa466d4abed0c Darrick J. Wong 2022-07-14  872  			dfork_min = 0;
daa466d4abed0c Darrick J. Wong 2022-07-14  873  		}
daa466d4abed0c Darrick J. Wong 2022-07-14  874  		break;
daa466d4abed0c Darrick J. Wong 2022-07-14  875  	case XFS_DINODE_FMT_BTREE:
daa466d4abed0c Darrick J. Wong 2022-07-14  876  		/* Must have space for btree header and key/pointers. */
daa466d4abed0c Darrick J. Wong 2022-07-14  877  		bmdr = XFS_DFORK_PTR(dip, XFS_DATA_FORK);
daa466d4abed0c Darrick J. Wong 2022-07-14  878  		dfork_min = XFS_BMAP_BROOT_SPACE(sc->mp, bmdr);
daa466d4abed0c Darrick J. Wong 2022-07-14  879  		break;
daa466d4abed0c Darrick J. Wong 2022-07-14  880  	default:
daa466d4abed0c Darrick J. Wong 2022-07-14  881  		dfork_min = 0;
daa466d4abed0c Darrick J. Wong 2022-07-14  882  		break;
daa466d4abed0c Darrick J. Wong 2022-07-14  883  	}
daa466d4abed0c Darrick J. Wong 2022-07-14  884  
daa466d4abed0c Darrick J. Wong 2022-07-14  885  	/*
daa466d4abed0c Darrick J. Wong 2022-07-14  886  	 * Round all values up to the nearest 8 bytes, because that is the
daa466d4abed0c Darrick J. Wong 2022-07-14  887  	 * precision of di_forkoff.
daa466d4abed0c Darrick J. Wong 2022-07-14  888  	 */
daa466d4abed0c Darrick J. Wong 2022-07-14  889  	afork_min = roundup(afork_min, 8);
daa466d4abed0c Darrick J. Wong 2022-07-14  890  	dfork_min = roundup(dfork_min, 8);
daa466d4abed0c Darrick J. Wong 2022-07-14  891  	bmdr_minsz = roundup(bmdr_minsz, 8);
daa466d4abed0c Darrick J. Wong 2022-07-14  892  
daa466d4abed0c Darrick J. Wong 2022-07-14  893  	ASSERT(dfork_min <= lit_sz);
daa466d4abed0c Darrick J. Wong 2022-07-14  894  	ASSERT(afork_min <= lit_sz);
daa466d4abed0c Darrick J. Wong 2022-07-14  895  
daa466d4abed0c Darrick J. Wong 2022-07-14  896  	/*
daa466d4abed0c Darrick J. Wong 2022-07-14  897  	 * If the data fork was zapped and we don't have enough space for the
daa466d4abed0c Darrick J. Wong 2022-07-14  898  	 * recovery fork, move the attr fork up.
daa466d4abed0c Darrick J. Wong 2022-07-14  899  	 */
daa466d4abed0c Darrick J. Wong 2022-07-14  900  	if (dip->di_format == XFS_DINODE_FMT_EXTENTS &&
daa466d4abed0c Darrick J. Wong 2022-07-14  901  	    xfs_dfork_data_extents(dip) == 0 &&
daa466d4abed0c Darrick J. Wong 2022-07-14  902  	    (ri->data_extents > 0 || ri->rt_extents > 0) &&
daa466d4abed0c Darrick J. Wong 2022-07-14  903  	    bmdr_minsz > XFS_DFORK_DSIZE(dip, sc->mp)) {
daa466d4abed0c Darrick J. Wong 2022-07-14  904  		if (bmdr_minsz + afork_min > lit_sz) {
daa466d4abed0c Darrick J. Wong 2022-07-14  905  			/*
daa466d4abed0c Darrick J. Wong 2022-07-14  906  			 * The attr for and the stub fork we need to recover
daa466d4abed0c Darrick J. Wong 2022-07-14  907  			 * the data fork won't both fit.  Zap the attr fork.
daa466d4abed0c Darrick J. Wong 2022-07-14  908  			 */
daa466d4abed0c Darrick J. Wong 2022-07-14  909  			xrep_dinode_zap_afork(ri, dip, mode);
daa466d4abed0c Darrick J. Wong 2022-07-14 @910  			afork_min = bmdr_minsz;
daa466d4abed0c Darrick J. Wong 2022-07-14  911  		} else {
daa466d4abed0c Darrick J. Wong 2022-07-14  912  			void	*before, *after;
daa466d4abed0c Darrick J. Wong 2022-07-14  913  
daa466d4abed0c Darrick J. Wong 2022-07-14  914  			/* Otherwise, just slide the attr fork up. */
daa466d4abed0c Darrick J. Wong 2022-07-14  915  			before = XFS_DFORK_APTR(dip);
daa466d4abed0c Darrick J. Wong 2022-07-14  916  			dip->di_forkoff = bmdr_minsz >> 3;
daa466d4abed0c Darrick J. Wong 2022-07-14  917  			after = XFS_DFORK_APTR(dip);
daa466d4abed0c Darrick J. Wong 2022-07-14  918  			memmove(after, before, XFS_DFORK_ASIZE(dip, sc->mp));
daa466d4abed0c Darrick J. Wong 2022-07-14  919  		}
daa466d4abed0c Darrick J. Wong 2022-07-14  920  	}
daa466d4abed0c Darrick J. Wong 2022-07-14  921  
daa466d4abed0c Darrick J. Wong 2022-07-14  922  	/*
daa466d4abed0c Darrick J. Wong 2022-07-14  923  	 * If the attr fork was zapped and we don't have enough space for the
daa466d4abed0c Darrick J. Wong 2022-07-14  924  	 * recovery fork, move the attr fork down.
daa466d4abed0c Darrick J. Wong 2022-07-14  925  	 */
daa466d4abed0c Darrick J. Wong 2022-07-14  926  	if (dip->di_aformat == XFS_DINODE_FMT_EXTENTS &&
daa466d4abed0c Darrick J. Wong 2022-07-14  927  	    xfs_dfork_attr_extents(dip) == 0 &&
daa466d4abed0c Darrick J. Wong 2022-07-14  928  	    ri->attr_extents > 0 &&
daa466d4abed0c Darrick J. Wong 2022-07-14  929  	    bmdr_minsz > XFS_DFORK_ASIZE(dip, sc->mp)) {
daa466d4abed0c Darrick J. Wong 2022-07-14  930  		if (dip->di_format == XFS_DINODE_FMT_BTREE) {
daa466d4abed0c Darrick J. Wong 2022-07-14  931  			/*
daa466d4abed0c Darrick J. Wong 2022-07-14  932  			 * If the data fork is in btree format then we can't
daa466d4abed0c Darrick J. Wong 2022-07-14  933  			 * adjust forkoff because that runs the risk of
daa466d4abed0c Darrick J. Wong 2022-07-14  934  			 * violating the extents/btree format transition rules.
daa466d4abed0c Darrick J. Wong 2022-07-14  935  			 */
daa466d4abed0c Darrick J. Wong 2022-07-14  936  		} else if (bmdr_minsz + dfork_min > lit_sz) {
daa466d4abed0c Darrick J. Wong 2022-07-14  937  			/*
daa466d4abed0c Darrick J. Wong 2022-07-14  938  			 * If we can't move the attr fork, too bad, we lose the
daa466d4abed0c Darrick J. Wong 2022-07-14  939  			 * attr fork and leak its blocks.
daa466d4abed0c Darrick J. Wong 2022-07-14  940  			 */
daa466d4abed0c Darrick J. Wong 2022-07-14  941  			xrep_dinode_zap_afork(ri, dip, mode);
daa466d4abed0c Darrick J. Wong 2022-07-14  942  		} else {
daa466d4abed0c Darrick J. Wong 2022-07-14  943  			/*
daa466d4abed0c Darrick J. Wong 2022-07-14  944  			 * Otherwise, just slide the attr fork down.  The attr
daa466d4abed0c Darrick J. Wong 2022-07-14  945  			 * fork is empty, so we don't have any old contents to
daa466d4abed0c Darrick J. Wong 2022-07-14  946  			 * move here.
daa466d4abed0c Darrick J. Wong 2022-07-14  947  			 */
daa466d4abed0c Darrick J. Wong 2022-07-14  948  			dip->di_forkoff = (lit_sz - bmdr_minsz) >> 3;
daa466d4abed0c Darrick J. Wong 2022-07-14  949  		}
daa466d4abed0c Darrick J. Wong 2022-07-14  950  	}
daa466d4abed0c Darrick J. Wong 2022-07-14  951  }
daa466d4abed0c Darrick J. Wong 2022-07-14  952  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
