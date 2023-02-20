Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFAD7E9
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Feb 2023 01:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676857975; x=1708393975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E5ILTIeVTCr8J+U4R0V2h9Gk+40CsM8xhPCHSjCxayk=;
  b=hkISR0OOIADOX1vuxqYz6wbEFNIuTb2slj+Gp3XGu2sn4PJDz2NxKLvg
   ZkwAlEFQuEr+C/zbpwGDk9yFnb+IYsbNkF1a35J25IAzwkvKWMYzozhuu
   YFKHAIZR7A0DgdUGT23LJ67mMF4zHiL7qnWyCPFjXgq/FSz9As76u5uYr
   JlHiCP/a82xV9Jy0PGQIQMjl5XnbrZdEzh8YQxgJ654xyx0HpebHTzIss
   BGmGSiCCnQzCIE2KQ5zV9WLnAg88gXlS4MJcyaitN/VdwcoASLcd0dsOB
   S7riA7pHk7SxlU1mQZeHHiwwZlnsVH690stQzNWU6CUFKHSRfQXgFs32n
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="394787724"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="394787724"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 17:52:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="780469852"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="780469852"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2023 17:52:53 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTvMK-000DYH-2x;
	Mon, 20 Feb 2023 01:52:52 +0000
Date: Mon, 20 Feb 2023 09:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:in-memory-btrees 150/182]
 fs/xfs/scrub/quotacheck.c:417:2: warning: Value stored to 'error' is never
 read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302200934.FBSxcIlU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/scrub/quotacheck.c:417:2: warning: Value stored to 'error' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git in-memory-btrees
head:   65b160b063691d49f132134659b0b200cb138e72
commit: 088c2221d2414018a34cf0d4f1ba50d76ad24b32 [150/182] xfs: implement live quotacheck inode scan
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20230212 (https://download.01.org/0day-ci/archive/20230220/202302200934.FBSxcIlU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=088c2221d2414018a34cf0d4f1ba50d76ad24b32
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs in-memory-btrees
        git checkout 088c2221d2414018a34cf0d4f1ba50d76ad24b32
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302200934.FBSxcIlU-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                            ^
   fs/sysfs/symlink.c:131:2: note: Calling 'spin_lock'
           spin_lock(&sysfs_symlink_target_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
                                                     ^
   include/linux/lockdep.h:481:2: note: expanded from macro 'LOCK_CONTENDED'
           lock(_lock)
           ^~~~~~~~~~~
   include/linux/spinlock.h:186:2: note: Calling 'arch_spin_lock'
           arch_spin_lock(&lock->raw_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/spinlock.h:66:7: note: Calling 'arch_spin_trylock_once'
           if (!arch_spin_trylock_once(lp))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/spinlock.h:61:52: note: Dereference of null pointer
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKVAL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINLOCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
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
   fs/xfs/scrub/quotacheck.c:458:6: note: 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/scrub/quotacheck.c:458:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/scrub/quotacheck.c:462:10: note: Calling 'xqcheck_collect_counts'
           error = xqcheck_collect_counts(xqc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/quotacheck.c:201:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/scrub/quotacheck.c:201:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/scrub/quotacheck.c:204:9: note: Assuming the condition is true
           while ((error = xchk_iscan_iter(sc, &xqc->iscan, &ip)) == 1) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/quotacheck.c:204:2: note: Loop condition is true.  Entering loop body
           while ((error = xchk_iscan_iter(sc, &xqc->iscan, &ip)) == 1) {
           ^
   fs/xfs/scrub/quotacheck.c:207:7: note: 'error' is 0
                   if (error)
                       ^~~~~
   fs/xfs/scrub/quotacheck.c:207:3: note: Taking false branch
                   if (error)
                   ^
   fs/xfs/scrub/quotacheck.c:210:7: note: Calling 'xchk_should_terminate'
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
>> fs/xfs/scrub/quotacheck.c:417:2: warning: Value stored to 'error' is never read [clang-analyzer-deadcode.DeadStores]
           error = -ENOMEM;
           ^       ~~~~~~~
   fs/xfs/scrub/quotacheck.c:417:2: note: Value stored to 'error' is never read
           error = -ENOMEM;
           ^       ~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   arch/s390/include/asm/spinlock.h:61:52: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKVAL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINLOCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   fs/configfs/dir.c:1844:2: note: Calling 'configfs_unregister_group'
           configfs_unregister_group(group);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/configfs/dir.c:1786:2: note: Calling 'spin_lock'
           spin_lock(&configfs_dirent_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
                                                     ^
   include/linux/lockdep.h:481:2: note: expanded from macro 'LOCK_CONTENDED'
           lock(_lock)
           ^~~~~~~~~~~
   include/linux/spinlock.h:186:2: note: Calling 'arch_spin_lock'
           arch_spin_lock(&lock->raw_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/spinlock.h:66:7: note: Calling 'arch_spin_trylock_once'
           if (!arch_spin_trylock_once(lp))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/spinlock.h:61:52: note: Dereference of null pointer
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKVAL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINLOCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   arch/s390/include/asm/spinlock.h:61:52: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKVAL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINLOCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   fs/configfs/symlink.c:228:6: note: Assuming the condition is false
           if (!(sd->s_type & CONFIGFS_ITEM_LINK))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/configfs/symlink.c:228:2: note: Taking false branch
           if (!(sd->s_type & CONFIGFS_ITEM_LINK))
           ^
   fs/configfs/symlink.c:233:16: note: Calling 'configfs_get_config_item'
           parent_item = configfs_get_config_item(dentry->d_parent);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/configfs/configfs_internal.h:125:2: note: Calling 'spin_lock'
           spin_lock(&dentry->d_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
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

vim +/error +417 fs/xfs/scrub/quotacheck.c

088c2221d24140 Darrick J. Wong 2022-07-14  395  
088c2221d24140 Darrick J. Wong 2022-07-14  396  /*
088c2221d24140 Darrick J. Wong 2022-07-14  397   * Scan all inodes in the entire filesystem to generate quota counter data.
088c2221d24140 Darrick J. Wong 2022-07-14  398   * If the scan is successful, the quota data will be left alive for a repair.
088c2221d24140 Darrick J. Wong 2022-07-14  399   * If any error occurs, we'll tear everything down.
088c2221d24140 Darrick J. Wong 2022-07-14  400   */
088c2221d24140 Darrick J. Wong 2022-07-14  401  STATIC int
088c2221d24140 Darrick J. Wong 2022-07-14  402  xqcheck_setup_scan(
088c2221d24140 Darrick J. Wong 2022-07-14  403  	struct xfs_scrub	*sc,
088c2221d24140 Darrick J. Wong 2022-07-14  404  	struct xqcheck		*xqc)
088c2221d24140 Darrick J. Wong 2022-07-14  405  {
088c2221d24140 Darrick J. Wong 2022-07-14  406  	unsigned long long	max_dquots = ((xfs_dqid_t)-1) + 1;
088c2221d24140 Darrick J. Wong 2022-07-14  407  	int			error;
088c2221d24140 Darrick J. Wong 2022-07-14  408  
088c2221d24140 Darrick J. Wong 2022-07-14  409  	ASSERT(xqc->sc == NULL);
088c2221d24140 Darrick J. Wong 2022-07-14  410  	xqc->sc = sc;
088c2221d24140 Darrick J. Wong 2022-07-14  411  
088c2221d24140 Darrick J. Wong 2022-07-14  412  	mutex_init(&xqc->lock);
088c2221d24140 Darrick J. Wong 2022-07-14  413  
088c2221d24140 Darrick J. Wong 2022-07-14  414  	/* Retry iget every tenth of a second for up to 30 seconds. */
088c2221d24140 Darrick J. Wong 2022-07-14  415  	xchk_iscan_start(&xqc->iscan, 30000, 100);
088c2221d24140 Darrick J. Wong 2022-07-14  416  
088c2221d24140 Darrick J. Wong 2022-07-14 @417  	error = -ENOMEM;
088c2221d24140 Darrick J. Wong 2022-07-14  418  	if (xfs_this_quota_on(sc->mp, XFS_DQTYPE_USER)) {
088c2221d24140 Darrick J. Wong 2022-07-14  419  		error = xfarray_create(sc->mp, "user dquots", max_dquots,
088c2221d24140 Darrick J. Wong 2022-07-14  420  				sizeof(struct xqcheck_dquot), &xqc->ucounts);
088c2221d24140 Darrick J. Wong 2022-07-14  421  		if (error)
088c2221d24140 Darrick J. Wong 2022-07-14  422  			goto out_teardown;
088c2221d24140 Darrick J. Wong 2022-07-14  423  	}
088c2221d24140 Darrick J. Wong 2022-07-14  424  
088c2221d24140 Darrick J. Wong 2022-07-14  425  	if (xfs_this_quota_on(sc->mp, XFS_DQTYPE_GROUP)) {
088c2221d24140 Darrick J. Wong 2022-07-14  426  		error = xfarray_create(sc->mp, "group dquots", max_dquots,
088c2221d24140 Darrick J. Wong 2022-07-14  427  				sizeof(struct xqcheck_dquot), &xqc->gcounts);
088c2221d24140 Darrick J. Wong 2022-07-14  428  		if (error)
088c2221d24140 Darrick J. Wong 2022-07-14  429  			goto out_teardown;
088c2221d24140 Darrick J. Wong 2022-07-14  430  	}
088c2221d24140 Darrick J. Wong 2022-07-14  431  
088c2221d24140 Darrick J. Wong 2022-07-14  432  	if (xfs_this_quota_on(sc->mp, XFS_DQTYPE_PROJ)) {
088c2221d24140 Darrick J. Wong 2022-07-14  433  		error = xfarray_create(sc->mp, "project dquots", max_dquots,
088c2221d24140 Darrick J. Wong 2022-07-14  434  				sizeof(struct xqcheck_dquot), &xqc->pcounts);
088c2221d24140 Darrick J. Wong 2022-07-14  435  		if (error)
088c2221d24140 Darrick J. Wong 2022-07-14  436  			goto out_teardown;
088c2221d24140 Darrick J. Wong 2022-07-14  437  	}
088c2221d24140 Darrick J. Wong 2022-07-14  438  
088c2221d24140 Darrick J. Wong 2022-07-14  439  	/* Use deferred cleanup to pass the quota count data to repair. */
088c2221d24140 Darrick J. Wong 2022-07-14  440  	sc->buf_cleanup = xqcheck_teardown_scan;
088c2221d24140 Darrick J. Wong 2022-07-14  441  	return 0;
088c2221d24140 Darrick J. Wong 2022-07-14  442  
088c2221d24140 Darrick J. Wong 2022-07-14  443  out_teardown:
088c2221d24140 Darrick J. Wong 2022-07-14  444  	xqcheck_teardown_scan(xqc);
088c2221d24140 Darrick J. Wong 2022-07-14  445  	return error;
088c2221d24140 Darrick J. Wong 2022-07-14  446  }
088c2221d24140 Darrick J. Wong 2022-07-14  447  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
