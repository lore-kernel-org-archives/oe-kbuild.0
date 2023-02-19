Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD02D1367
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676816500; x=1708352500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vam+NvNJl4JXrct+0RbIReg0BRPdjoZORg8EmQvxUo=;
  b=bVJJNDmbmMofrgU7rgPrlm4bKtg7ftiWlbMVghbuDu0ISOByC5PPJyBy
   AHQw9v6LR0n0IUVmf3W6dFAoe/NuKZyN2pmjWP9/4nYnUWr2FWIlGaKuN
   kTYV4dlFELfDFLsx8oyIWYhkAvHTj71GvQ+WR8kl0YTvNVQREOtub4WlM
   KnnX04pN6Dsjpub0TmCCE/O0RFoxflP0xiCPmM7j5BRXzIisSJQR4Iahi
   xeOboMMasSBfrc60WWyBP0bdH4r2ql1vQrXbMZ2DaBZbWtyP8TcEUL7rd
   /ZiHCYoLNPupfM5RAwCi174klJLsQtPecQV2dSuitl/K2CUxPrA/fbZ+Y
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="418475423"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="418475423"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 06:21:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="916603096"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="916603096"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Feb 2023 06:21:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTkZN-000DKr-1o;
	Sun, 19 Feb 2023 14:21:37 +0000
Date: Sun, 19 Feb 2023 22:20:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:in-memory-btrees 129/182]
 fs/xfs/scrub/refcount_repair.c:534:4: warning: Value stored to 'sbno' is
 never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302192238.4gDx5WDp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/scrub/refcount_repair.c:534:4: warning: Value stored to 'sbno' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git in-memory-btrees
head:   65b160b063691d49f132134659b0b200cb138e72
commit: 771fa17dd5fd7d3d125c61232c4390e8f7ac0fb0 [129/182] xfs: repair refcount btrees
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20230212 (https://download.01.org/0day-ci/archive/20230219/202302192238.4gDx5WDp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=771fa17dd5fd7d3d125c61232c4390e8f7ac0fb0
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs in-memory-btrees
        git checkout 771fa17dd5fd7d3d125c61232c4390e8f7ac0fb0
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302192238.4gDx5WDp-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   mm/migrate.c:1996:4: note: Taking false branch
                           if (copy_from_user(chunk_pages, pages,
                           ^
   mm/migrate.c:2001:3: note: Calling 'do_pages_stat_array'
                   do_pages_stat_array(mm, chunk_nr, chunk_pages, chunk_status);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/migrate.c:1924:14: note: 'i' is < 'nr_pages'
           for (i = 0; i < nr_pages; i++) {
                       ^
   mm/migrate.c:1924:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < nr_pages; i++) {
           ^
   mm/migrate.c:1925:3: note: Assigned value is garbage or undefined
                   unsigned long addr = (unsigned long)(*pages);
                   ^                    ~~~~~~~~~~~~~~~~~~~~~~~
   mm/migrate.c:2023:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   mmget(current->mm);
                         ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/migrate.c:2094:1: note: Calling '__do_sys_move_pages'
   SYSCALL_DEFINE6(move_pages, pid_t, pid, unsigned long, nr_pages,
   ^
   include/linux/syscalls.h:222:36: note: expanded from macro 'SYSCALL_DEFINE6'
   #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFINEx'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/syscall_wrapper.h:157:14: note: expanded from macro '__SYSCALL_DEFINEx'
                   long ret = __do_sys##name(SYSCALL_PT_ARGS(x, regs,                      \
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   mm/migrate.c:2099:9: note: Calling 'kernel_move_pages'
           return kernel_move_pages(pid, nr_pages, pages, nodes, status, flags);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/migrate.c:2074:6: note: Assuming the condition is false
           if (flags & ~(MPOL_MF_MOVE|MPOL_MF_MOVE_ALL))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/migrate.c:2074:2: note: Taking false branch
           if (flags & ~(MPOL_MF_MOVE|MPOL_MF_MOVE_ALL))
           ^
   mm/migrate.c:2077:7: note: Assuming the condition is false
           if ((flags & MPOL_MF_MOVE_ALL) && !capable(CAP_SYS_NICE))
                ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/migrate.c:2077:33: note: Left side of '&&' is false
           if ((flags & MPOL_MF_MOVE_ALL) && !capable(CAP_SYS_NICE))
                                          ^
   mm/migrate.c:2080:7: note: Calling 'find_mm_struct'
           mm = find_mm_struct(pid, &task_nodes);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/migrate.c:2022:6: note: Assuming 'pid' is 0
           if (!pid) {
               ^~~~
   mm/migrate.c:2022:2: note: Taking true branch
           if (!pid) {
           ^
   mm/migrate.c:2023:9: note: Dereference of null pointer
                   mmget(current->mm);
                         ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   fs/xfs/scrub/common.h:26:27: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (fatal_signal_pending(current)) {
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/xfs/scrub/refcount_repair.c:193:9: note: Calling 'xrep_refc_stash'
           return xrep_refc_stash(rr, XFS_REFC_DOMAIN_COW, agbno, len, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/refcount_repair.c:172:6: note: Calling 'xchk_should_terminate'
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
>> fs/xfs/scrub/refcount_repair.c:534:4: warning: Value stored to 'sbno' is never read [clang-analyzer-deadcode.DeadStores]
                           sbno = nbno;
                           ^      ~~~~
   fs/xfs/scrub/refcount_repair.c:534:4: note: Value stored to 'sbno' is never read
                           sbno = nbno;
                           ^      ~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   arch/s390/include/asm/spinlock.h:61:52: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKVAL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINLOCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   fs/xfs/scrub/repair.c:715:2: note: Control jumps to 'case -2:'  at line 718
           switch (error) {
           ^
   fs/xfs/scrub/repair.c:719:3: note: Assuming the condition is false
                   xfs_err_ratelimited(sc->mp,
                   ^
   fs/xfs/xfs_message.h:68:2: note: expanded from macro 'xfs_err_ratelimited'
           xfs_printk_ratelimited(xfs_err, dev, fmt, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_message.h:54:6: note: expanded from macro 'xfs_printk_ratelimited'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:45:28: note: expanded from macro '__ratelimit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/repair.c:719:3: note: Taking false branch
                   xfs_err_ratelimited(sc->mp,
                   ^
   fs/xfs/xfs_message.h:68:2: note: expanded from macro 'xfs_err_ratelimited'
           xfs_printk_ratelimited(xfs_err, dev, fmt, ##__VA_ARGS__)
           ^
   fs/xfs/xfs_message.h:54:2: note: expanded from macro 'xfs_printk_ratelimited'
           if (__ratelimit(&_rs))                                          \
           ^
   fs/xfs/scrub/repair.c:719:3: note: Loop condition is false.  Exiting loop
                   xfs_err_ratelimited(sc->mp,
                   ^
   fs/xfs/xfs_message.h:68:2: note: expanded from macro 'xfs_err_ratelimited'
           xfs_printk_ratelimited(xfs_err, dev, fmt, ##__VA_ARGS__)
           ^
   fs/xfs/xfs_message.h:49:55: note: expanded from macro 'xfs_printk_ratelimited'
   #define xfs_printk_ratelimited(func, dev, fmt, ...)                     \
                                                                           ^
   fs/xfs/scrub/repair.c:722:7: note: Assuming the condition is true
                   if (XFS_IS_UQUOTA_ON(sc->mp) && !sc->ip->i_udquot)
                       ^
   fs/xfs/libxfs/xfs_quota_defs.h:63:32: note: expanded from macro 'XFS_IS_UQUOTA_ON'
   #define XFS_IS_UQUOTA_ON(mp)            ((mp)->m_qflags & XFS_UQUOTA_ACCT)
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/repair.c:722:7: note: Left side of '&&' is true
                   if (XFS_IS_UQUOTA_ON(sc->mp) && !sc->ip->i_udquot)
                       ^
   fs/xfs/libxfs/xfs_quota_defs.h:63:31: note: expanded from macro 'XFS_IS_UQUOTA_ON'
   #define XFS_IS_UQUOTA_ON(mp)            ((mp)->m_qflags & XFS_UQUOTA_ACCT)
                                           ^
   fs/xfs/scrub/repair.c:722:35: note: Assuming field 'i_udquot' is null
                   if (XFS_IS_UQUOTA_ON(sc->mp) && !sc->ip->i_udquot)
                                                   ^~~~~~~~~~~~~~~~~
   fs/xfs/scrub/repair.c:722:3: note: Taking true branch
                   if (XFS_IS_UQUOTA_ON(sc->mp) && !sc->ip->i_udquot)
                   ^
   fs/xfs/scrub/repair.c:723:4: note: Calling 'xrep_force_quotacheck'
                           xrep_force_quotacheck(sc, XFS_DQTYPE_USER);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/repair.c:686:6: note: Assuming the condition is false
           if (!(flag & sc->mp->m_qflags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/repair.c:686:2: note: Taking false branch
           if (!(flag & sc->mp->m_qflags))
           ^
   fs/xfs/scrub/repair.c:691:2: note: Calling 'spin_lock'
           spin_lock(&sc->mp->m_sb_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:350:2: note: Calling '__raw_spin_lock'
           raw_spin_lock(&lock->rlock);
           ^
   include/linux/spinlock.h:216:29: note: expanded from macro 'raw_spin_lock'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:47:30: note: expanded from macro '_raw_spin_lock'
   #define _raw_spin_lock(lock) __raw_spin_lock(lock)
                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:133:2: note: Loop condition is false.  Exiting loop
           spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
           ^
   include/linux/lockdep.h:526:35: note: expanded from macro 'spin_acquire'
   #define spin_acquire(l, s, t, i)                lock_acquire_exclusive(l, s, t, NULL, i)
                                                   ^
   include/linux/lockdep.h:522:48: note: expanded from macro 'lock_acquire_exclusive'
   #define lock_acquire_exclusive(l, s, t, n, i)           lock_acquire(l, s, t, 0, 1, n, i)
                                                           ^
   include/linux/lockdep.h:360:44: note: expanded from macro 'lock_acquire'
   # define lock_acquire(l, s, t, r, c, n, i)      do { } while (0)
                                                   ^
   include/linux/spinlock_api_smp.h:134:44: note: Calling 'do_raw_spin_lock'
           LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);

vim +/sbno +534 fs/xfs/scrub/refcount_repair.c

771fa17dd5fd7d Darrick J. Wong 2022-07-14  432  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  433  /* Iterate all the rmap records to generate reference count data. */
771fa17dd5fd7d Darrick J. Wong 2022-07-14  434  STATIC int
771fa17dd5fd7d Darrick J. Wong 2022-07-14  435  xrep_refc_find_refcounts(
771fa17dd5fd7d Darrick J. Wong 2022-07-14  436  	struct xrep_refc	*rr)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  437  {
771fa17dd5fd7d Darrick J. Wong 2022-07-14  438  	struct xrep_refc_rmap	rrm;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  439  	struct xfs_scrub	*sc = rr->sc;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  440  	struct xfarray		*rmap_bag;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  441  	uint64_t		old_stack_sz;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  442  	uint64_t		stack_sz = 0;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  443  	xfs_agblock_t		sbno;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  444  	xfs_agblock_t		cbno;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  445  	xfs_agblock_t		nbno;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  446  	bool			have;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  447  	int			error;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  448  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  449  	xrep_ag_btcur_init(sc, &sc->sa);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  450  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  451  	/*
771fa17dd5fd7d Darrick J. Wong 2022-07-14  452  	 * Set up a sparse array to store all the rmap records that we're
771fa17dd5fd7d Darrick J. Wong 2022-07-14  453  	 * tracking to generate a reference count record.  If this exceeds
771fa17dd5fd7d Darrick J. Wong 2022-07-14  454  	 * MAXREFCOUNT, we clamp rc_refcount.
771fa17dd5fd7d Darrick J. Wong 2022-07-14  455  	 */
771fa17dd5fd7d Darrick J. Wong 2022-07-14  456  	error = xfarray_create(sc->mp, "rmap bag", 0,
771fa17dd5fd7d Darrick J. Wong 2022-07-14  457  			sizeof(struct xrep_refc_rmap), &rmap_bag);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  458  	if (error)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  459  		goto out_cur;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  460  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  461  	/* Start the rmapbt cursor to the left of all records. */
771fa17dd5fd7d Darrick J. Wong 2022-07-14  462  	error = xfs_btree_goto_left_edge(sc->sa.rmap_cur);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  463  	if (error)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  464  		goto out_bag;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  465  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  466  	/* Process reverse mappings into refcount data. */
771fa17dd5fd7d Darrick J. Wong 2022-07-14  467  	while (xfs_btree_has_more_records(sc->sa.rmap_cur)) {
771fa17dd5fd7d Darrick J. Wong 2022-07-14  468  		/* Push all rmaps with pblk == sbno onto the stack */
771fa17dd5fd7d Darrick J. Wong 2022-07-14  469  		error = xrep_refc_walk_rmaps(rr, &rrm, &have);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  470  		if (error)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  471  			goto out_bag;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  472  		if (!have)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  473  			break;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  474  		sbno = cbno = rrm.startblock;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  475  		error = xrep_refc_push_rmaps_at(rr, rmap_bag, sbno,
771fa17dd5fd7d Darrick J. Wong 2022-07-14  476  					&rrm, &have, &stack_sz);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  477  		if (error)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  478  			goto out_bag;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  479  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  480  		/* Set nbno to the bno of the next refcount change */
771fa17dd5fd7d Darrick J. Wong 2022-07-14  481  		error = xrep_refc_next_edge(rmap_bag, &rrm, have, &nbno);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  482  		if (error)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  483  			goto out_bag;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  484  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  485  		ASSERT(nbno > sbno);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  486  		old_stack_sz = stack_sz;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  487  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  488  		/* While stack isn't empty... */
771fa17dd5fd7d Darrick J. Wong 2022-07-14  489  		while (stack_sz) {
771fa17dd5fd7d Darrick J. Wong 2022-07-14  490  			xfarray_idx_t	array_cur = XFARRAY_CURSOR_INIT;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  491  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  492  			/* Pop all rmaps that end at nbno */
771fa17dd5fd7d Darrick J. Wong 2022-07-14  493  			while ((error = xfarray_iter(rmap_bag, &array_cur,
771fa17dd5fd7d Darrick J. Wong 2022-07-14  494  								&rrm)) == 1) {
771fa17dd5fd7d Darrick J. Wong 2022-07-14  495  				if (RRM_NEXT(rrm) != nbno)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  496  					continue;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  497  				error = xfarray_unset(rmap_bag, array_cur - 1);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  498  				if (error)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  499  					goto out_bag;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  500  				stack_sz--;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  501  			}
771fa17dd5fd7d Darrick J. Wong 2022-07-14  502  			if (error)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  503  				goto out_bag;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  504  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  505  			/* Push array items that start at nbno */
771fa17dd5fd7d Darrick J. Wong 2022-07-14  506  			error = xrep_refc_walk_rmaps(rr, &rrm, &have);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  507  			if (error)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  508  				goto out_bag;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  509  			if (have) {
771fa17dd5fd7d Darrick J. Wong 2022-07-14  510  				error = xrep_refc_push_rmaps_at(rr, rmap_bag,
771fa17dd5fd7d Darrick J. Wong 2022-07-14  511  						nbno, &rrm, &have, &stack_sz);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  512  				if (error)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  513  					goto out_bag;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  514  			}
771fa17dd5fd7d Darrick J. Wong 2022-07-14  515  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  516  			/* Emit refcount if necessary */
771fa17dd5fd7d Darrick J. Wong 2022-07-14  517  			ASSERT(nbno > cbno);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  518  			if (stack_sz != old_stack_sz) {
771fa17dd5fd7d Darrick J. Wong 2022-07-14  519  				if (old_stack_sz > 1) {
771fa17dd5fd7d Darrick J. Wong 2022-07-14  520  					error = xrep_refc_stash(rr,
771fa17dd5fd7d Darrick J. Wong 2022-07-14  521  							XFS_REFC_DOMAIN_SHARED,
771fa17dd5fd7d Darrick J. Wong 2022-07-14  522  							cbno, nbno - cbno,
771fa17dd5fd7d Darrick J. Wong 2022-07-14  523  							old_stack_sz);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  524  					if (error)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  525  						goto out_bag;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  526  				}
771fa17dd5fd7d Darrick J. Wong 2022-07-14  527  				cbno = nbno;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  528  			}
771fa17dd5fd7d Darrick J. Wong 2022-07-14  529  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  530  			/* Stack empty, go find the next rmap */
771fa17dd5fd7d Darrick J. Wong 2022-07-14  531  			if (stack_sz == 0)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  532  				break;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  533  			old_stack_sz = stack_sz;
771fa17dd5fd7d Darrick J. Wong 2022-07-14 @534  			sbno = nbno;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  535  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  536  			/* Set nbno to the bno of the next refcount change */
771fa17dd5fd7d Darrick J. Wong 2022-07-14  537  			error = xrep_refc_next_edge(rmap_bag, &rrm, have,
771fa17dd5fd7d Darrick J. Wong 2022-07-14  538  					&nbno);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  539  			if (error)
771fa17dd5fd7d Darrick J. Wong 2022-07-14  540  				goto out_bag;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  541  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  542  			ASSERT(nbno > sbno);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  543  		}
771fa17dd5fd7d Darrick J. Wong 2022-07-14  544  	}
771fa17dd5fd7d Darrick J. Wong 2022-07-14  545  
771fa17dd5fd7d Darrick J. Wong 2022-07-14  546  	ASSERT(stack_sz == 0);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  547  out_bag:
771fa17dd5fd7d Darrick J. Wong 2022-07-14  548  	xfarray_destroy(rmap_bag);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  549  out_cur:
771fa17dd5fd7d Darrick J. Wong 2022-07-14  550  	xchk_ag_btcur_free(&sc->sa);
771fa17dd5fd7d Darrick J. Wong 2022-07-14  551  	return error;
771fa17dd5fd7d Darrick J. Wong 2022-07-14  552  }
771fa17dd5fd7d Darrick J. Wong 2022-07-14  553  #undef RRM_NEXT
771fa17dd5fd7d Darrick J. Wong 2022-07-14  554  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
