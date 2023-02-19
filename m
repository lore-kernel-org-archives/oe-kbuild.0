Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC3C322E
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 22:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676845551; x=1708381551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r2G497j3/TpmZrm054ViyVHFLxQiz5RqYNqgnhMODcA=;
  b=daQM8O6wv9UPlhOTovbkCHfhx3ViUnHDxBfgKXVaifMZI9g+ytuORXrU
   ZQXfbwFmjv52UlpdeVMd5cj+GCZaNdV1e4dUMhg/tRpFzr1676o05TuOj
   7oXgUc0yN83aIPN/e7/ruey2MtLMfKRimXgfNWRQtWpTFhcqH2yXP4f+Y
   6Ysuw3GNcNY2wuofwYxTlNvPqx03pm40eI/35oC3NrmVtMTMiwxoxrKR7
   YmtBdkewkZxAJbSvD6NqyKLvvfbzvaIzhOX8ewKJH8TWpuPBYsKG3wToL
   27+Fm6bAzK54jA16YkevO9ksDYlHXmK9u193I18+guLLb/57Bo4Tw3TU7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="330002579"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="330002579"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 14:25:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="620953590"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="620953590"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Feb 2023 14:25:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTs7w-000DTk-2g;
	Sun, 19 Feb 2023 22:25:48 +0000
Date: Mon, 20 Feb 2023 06:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:in-memory-btrees 141/182] fs/xfs/scrub/repair.c:1096:3:
 warning: Value stored to 'dirty' is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302200627.5YjZ4RxI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/scrub/repair.c:1096:3: warning: Value stored to 'dirty' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git in-memory-btrees
head:   65b160b063691d49f132134659b0b200cb138e72
commit: c1bf31a7b629051dde1416f095e9b135b14ca398 [141/182] xfs: repair the inode core and forks of a metadata inode
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20230212 (https://download.01.org/0day-ci/archive/20230220/202302200627.5YjZ4RxI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=c1bf31a7b629051dde1416f095e9b135b14ca398
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs in-memory-btrees
        git checkout c1bf31a7b629051dde1416f095e9b135b14ca398
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302200627.5YjZ4RxI-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                   ^
   fs/xfs/xfs_message.h:68:2: note: expanded from macro 'xfs_err_ratelimited'
           xfs_printk_ratelimited(xfs_err, dev, fmt, ##__VA_ARGS__)
           ^
   fs/xfs/xfs_message.h:49:55: note: expanded from macro 'xfs_printk_ratelimited'
   #define xfs_printk_ratelimited(func, dev, fmt, ...)                     \
                                                                           ^
   fs/xfs/scrub/repair.c:729:7: note: Assuming the condition is true
                   if (XFS_IS_UQUOTA_ON(sc->mp) && !sc->ip->i_udquot)
                       ^
   fs/xfs/libxfs/xfs_quota_defs.h:63:32: note: expanded from macro 'XFS_IS_UQUOTA_ON'
   #define XFS_IS_UQUOTA_ON(mp)            ((mp)->m_qflags & XFS_UQUOTA_ACCT)
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/repair.c:729:7: note: Left side of '&&' is true
                   if (XFS_IS_UQUOTA_ON(sc->mp) && !sc->ip->i_udquot)
                       ^
   fs/xfs/libxfs/xfs_quota_defs.h:63:31: note: expanded from macro 'XFS_IS_UQUOTA_ON'
   #define XFS_IS_UQUOTA_ON(mp)            ((mp)->m_qflags & XFS_UQUOTA_ACCT)
                                           ^
   fs/xfs/scrub/repair.c:729:35: note: Assuming field 'i_udquot' is null
                   if (XFS_IS_UQUOTA_ON(sc->mp) && !sc->ip->i_udquot)
                                                   ^~~~~~~~~~~~~~~~~
   fs/xfs/scrub/repair.c:729:3: note: Taking true branch
                   if (XFS_IS_UQUOTA_ON(sc->mp) && !sc->ip->i_udquot)
                   ^
   fs/xfs/scrub/repair.c:730:4: note: Calling 'xrep_force_quotacheck'
                           xrep_force_quotacheck(sc, XFS_DQTYPE_USER);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/repair.c:690:6: note: Assuming the condition is false
           if (!(flag & sc->mp->m_qflags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/repair.c:690:2: note: Taking false branch
           if (!(flag & sc->mp->m_qflags))
           ^
   fs/xfs/scrub/repair.c:695:2: note: Calling 'spin_lock'
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
   fs/xfs/scrub/common.h:26:27: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (fatal_signal_pending(current)) {
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/xfs/scrub/repair.c:119:6: note: Calling 'xchk_should_terminate'
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
>> fs/xfs/scrub/repair.c:1096:3: warning: Value stored to 'dirty' is never read [clang-analyzer-deadcode.DeadStores]
                   dirty = false;
                   ^       ~~~~~
   fs/xfs/scrub/repair.c:1096:3: note: Value stored to 'dirty' is never read
                   dirty = false;
                   ^       ~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   security/keys/request_key_auth.c:166:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           const struct cred *cred = current_cred();
                                     ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:664:31: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:462:35: note: expanded from macro '__rcu_dereference_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   security/keys/request_key_auth.c:166:28: note: Left side of '&&' is false
           const struct cred *cred = current_cred();
                                     ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:664:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:460:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:409:48: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   security/keys/request_key_auth.c:166:28: note: Loop condition is false.  Exiting loop
           const struct cred *cred = current_cred();
                                     ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:664:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:460:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:409:32: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   security/keys/request_key_auth.c:166:28: note: Dereference of null pointer
           const struct cred *cred = current_cred();
                                     ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:664:31: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:462:35: note: expanded from macro '__rcu_dereference_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   security/keys/request_key_auth.c:252:13: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   .cred                   = current_cred(),
                                             ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:664:31: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:462:35: note: expanded from macro '__rcu_dereference_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   security/keys/request_key_auth.c:252:13: note: Left side of '&&' is false
                   .cred                   = current_cred(),
                                             ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:664:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)

vim +/dirty +1096 fs/xfs/scrub/repair.c

c1bf31a7b62905 Darrick J. Wong 2022-07-14  1051  
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1052  /*
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1053   * Repair the ondisk forks of a metadata inode.  The caller must ensure that
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1054   * sc->ip points to the metadata inode and the ILOCK is held on that inode.
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1055   * The inode must not be joined to the transaction before the call, and will
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1056   * not be afterwards.
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1057   */
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1058  int
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1059  xrep_metadata_inode_forks(
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1060  	struct xfs_scrub	*sc)
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1061  {
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1062  	bool			dirty = false;
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1063  	int			error;
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1064  
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1065  	/* Repair the inode record and the data fork. */
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1066  	error = xrep_metadata_inode_subtype(sc, XFS_SCRUB_TYPE_INODE);
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1067  	if (error)
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1068  		return error;
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1069  
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1070  	error = xrep_metadata_inode_subtype(sc, XFS_SCRUB_TYPE_BMBTD);
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1071  	if (error)
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1072  		return error;
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1073  
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1074  	/* Make sure the attr fork looks ok before we delete it. */
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1075  	error = xrep_metadata_inode_subtype(sc, XFS_SCRUB_TYPE_BMBTA);
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1076  	if (error)
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1077  		return error;
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1078  
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1079  	/* Clear the reflink flag since metadata never shares. */
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1080  	if (xfs_is_reflink_inode(sc->ip)) {
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1081  		dirty = true;
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1082  		xfs_trans_ijoin(sc->tp, sc->ip, 0);
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1083  		error = xfs_reflink_clear_inode_flag(sc->ip, &sc->tp);
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1084  		if (error)
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1085  			return error;
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1086  	}
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1087  
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1088  	/*
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1089  	 * If we modified the inode, roll the transaction but don't rejoin the
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1090  	 * inode to the new transaction because xrep_bmap_data can do that.
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1091  	 */
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1092  	if (dirty) {
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1093  		error = xfs_trans_roll(&sc->tp);
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1094  		if (error)
c1bf31a7b62905 Darrick J. Wong 2022-07-14  1095  			return error;
c1bf31a7b62905 Darrick J. Wong 2022-07-14 @1096  		dirty = false;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
