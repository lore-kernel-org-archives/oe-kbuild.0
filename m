Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B74195
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Feb 2023 00:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676421448; x=1707957448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qPbj4r3Yg7+nI0EGECRYbyaoA4hvoqyBb/u9DvhBWzg=;
  b=bur5VusyMVQGfoQT4ZVCIoUyBsENv1QLY/Xsytjo95ngb/mYiSVBKPtd
   KFCK9XB26ziSz1anzavJ/Lm7JGkWNLJ3fCss0CH5DKUcLosJeU8EmgQG4
   S5x6Os54Mr7rBu801H7wEfOsAUdoDi9FEor2PFr+wTBMpI0DRaoctkF9o
   ML+iDUr5bzjeixZ+p6P5xXO51yfT6/j1oMG49siLg0q0NVFgGilk38iqN
   uZ2jf+C3Cz7dwcj+okR2dJZe9KPMsh/vLi3N4Axzd58XvNHTuY/3EdMvI
   Yhx627jUimhV9nlwq++1HVTggX5LJ9wMsc2wRlfdcE2CdtpeD5ERig2N+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="417533016"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="417533016"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 16:37:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="671419440"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="671419440"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Feb 2023 16:37:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS5nZ-0008t8-3B;
	Wed, 15 Feb 2023 00:37:25 +0000
Date: Wed, 15 Feb 2023 08:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:xfile-page-caching 62/267] fs/xfs/scrub/common.c:796:6:
 warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Message-ID: <202302150849.siOtz5XD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/scrub/common.c:796:6: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   ef9b9a38850bede83ff742105ecda40506c35320
commit: 43f67a85ff3be26799fbb8e378ca95d4d25fdf94 [62/267] xfs: manage inode DONTCACHE status at irele time
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: s390-randconfig-c005-20230212 (https://download.01.org/0day-ci/archive/20230215/202302150849.siOtz5XD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=43f67a85ff3be26799fbb8e378ca95d4d25fdf94
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs xfile-page-caching
        git checkout 43f67a85ff3be26799fbb8e378ca95d4d25fdf94
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302150849.siOtz5XD-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONCE'
           int __ret_warn_on = !!(condition);                      \
                                  ^~~~~~~~~
   fs/exec.c:2079:25: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           struct mm_struct *mm = current->mm;
                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/exec.c:2079:25: note: Dereference of null pointer
           struct mm_struct *mm = current->mm;
                                  ^
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
   fs/xfs/scrub/btree.c:710:6: note: Assuming the condition is false
           if (cur_sz > PAGE_SIZE) {
               ^~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/btree.c:710:2: note: Taking false branch
           if (cur_sz > PAGE_SIZE) {
           ^
   fs/xfs/scrub/btree.c:715:6: note: Assuming 'bs' is non-null
           if (!bs)
               ^~~
   fs/xfs/scrub/btree.c:715:2: note: Taking false branch
           if (!bs)
           ^
   fs/xfs/scrub/btree.c:732:2: note: Taking false branch
           if (!xchk_btree_ptr_ok(bs, cur->bc_nlevels, &ptr))
           ^
   fs/xfs/scrub/btree.c:735:6: note: 'error' is 0
           if (error || !block)
               ^~~~~
   fs/xfs/scrub/btree.c:735:6: note: Left side of '||' is false
   fs/xfs/scrub/btree.c:735:16: note: 'block' is non-null
           if (error || !block)
                         ^~~~~
   fs/xfs/scrub/btree.c:735:2: note: Taking false branch
           if (error || !block)
           ^
   fs/xfs/scrub/btree.c:740:9: note: Assuming 'level' is < field 'bc_nlevels'
           while (level < cur->bc_nlevels) {
                  ^~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/btree.c:740:2: note: Loop condition is true.  Entering loop body
           while (level < cur->bc_nlevels) {
           ^
   fs/xfs/scrub/btree.c:743:7: note: Assuming 'level' is equal to 0
                   if (level == 0) {
                       ^~~~~~~~~~
   fs/xfs/scrub/btree.c:743:3: note: Taking true branch
                   if (level == 0) {
                   ^
   fs/xfs/scrub/btree.c:745:8: note: Assuming field 'ptr' is <= field 'bb_numrecs'
                           if (cur->bc_levels[level].ptr >
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/btree.c:745:4: note: Taking false branch
                           if (cur->bc_levels[level].ptr >
                           ^
   fs/xfs/scrub/btree.c:761:8: note: Assuming 'error' is 0
                           if (error)
                               ^~~~~
   fs/xfs/scrub/btree.c:761:4: note: Taking false branch
                           if (error)
                           ^
   fs/xfs/scrub/btree.c:763:8: note: Calling 'xchk_should_terminate'
                           if (xchk_should_terminate(sc, &error) ||
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
   14 warnings generated.
>> fs/xfs/scrub/common.c:796:6: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (current->journal_info != NULL) {
               ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/xfs/scrub/common.c:833:10: note: Calling 'xchk_get_inode'
           error = xchk_get_inode(sc);
                   ^~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/common.c:739:6: note: Assuming field 'sm_ino' is not equal to 0
           if (sc->sm->sm_ino == 0 || sc->sm->sm_ino == ip_in->i_ino) {
               ^~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/common.c:739:6: note: Left side of '||' is false
   fs/xfs/scrub/common.c:739:29: note: Assuming field 'sm_ino' is not equal to field 'i_ino'
           if (sc->sm->sm_ino == 0 || sc->sm->sm_ino == ip_in->i_ino) {
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/common.c:739:2: note: Taking false branch
           if (sc->sm->sm_ino == 0 || sc->sm->sm_ino == ip_in->i_ino) {
           ^
   fs/xfs/scrub/common.c:745:6: note: Assuming the condition is false
           if (xfs_internal_inum(mp, sc->sm->sm_ino))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/common.c:745:2: note: Taking false branch
           if (xfs_internal_inum(mp, sc->sm->sm_ino))
           ^
   fs/xfs/scrub/common.c:748:2: note: Control jumps to 'case 0:'  at line 752
           switch (error) {
           ^
   fs/xfs/scrub/common.c:754:3: note:  Execution continues on line 781
                   break;
                   ^
   fs/xfs/scrub/common.c:781:6: note: Assuming field 'i_generation' is not equal to field 'sm_gen'
           if (VFS_I(ip)->i_generation != sc->sm->sm_gen) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/common.c:781:2: note: Taking true branch
           if (VFS_I(ip)->i_generation != sc->sm->sm_gen) {
           ^
   fs/xfs/scrub/common.c:782:3: note: Calling 'xchk_irele'
                   xchk_irele(sc, ip);
                   ^~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/common.c:796:6: note: Dereference of null pointer
           if (current->journal_info != NULL) {
               ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
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
   fs/xfs/scrub/common.c:686:6: note: Assuming 'force_log' is false
           if (force_log) {
               ^~~~~~~~~
   fs/xfs/scrub/common.c:686:2: note: Taking false branch
           if (force_log) {
           ^
   fs/xfs/scrub/common.c:693:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/scrub/common.c:693:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/scrub/common.c:696:9: note: Calling 'xchk_ag_init'
           return xchk_ag_init(sc, sc->sm->sm_agno, &sc->sa);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/common.c:628:10: note: Calling 'xchk_ag_read_headers'
           error = xchk_ag_read_headers(sc, agno, sa);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/common.c:509:6: note: Assuming field 'pag' is non-null
           if (!sa->pag)
               ^~~~~~~~
   fs/xfs/scrub/common.c:509:2: note: Taking false branch
           if (!sa->pag)
           ^
   fs/xfs/scrub/common.c:512:9: note: Calling 'xchk_perag_lock'
           return xchk_perag_lock(sc);
                  ^~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/common.c:441:7: note: Calling 'xchk_should_terminate'
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

vim +796 fs/xfs/scrub/common.c

a5c46e5e8912d2 Darrick J. Wong 2017-10-17  789  
43f67a85ff3be2 Darrick J. Wong 2022-07-14  790  /* Release an inode, possibly dropping it in the process. */
43f67a85ff3be2 Darrick J. Wong 2022-07-14  791  void
43f67a85ff3be2 Darrick J. Wong 2022-07-14  792  xchk_irele(
43f67a85ff3be2 Darrick J. Wong 2022-07-14  793  	struct xfs_scrub	*sc,
43f67a85ff3be2 Darrick J. Wong 2022-07-14  794  	struct xfs_inode	*ip)
43f67a85ff3be2 Darrick J. Wong 2022-07-14  795  {
43f67a85ff3be2 Darrick J. Wong 2022-07-14 @796  	if (current->journal_info != NULL) {
43f67a85ff3be2 Darrick J. Wong 2022-07-14  797  		ASSERT(current->journal_info == sc->tp);
43f67a85ff3be2 Darrick J. Wong 2022-07-14  798  
43f67a85ff3be2 Darrick J. Wong 2022-07-14  799  		/*
43f67a85ff3be2 Darrick J. Wong 2022-07-14  800  		 * If we are in a transaction, we /cannot/ drop the inode
43f67a85ff3be2 Darrick J. Wong 2022-07-14  801  		 * ourselves, because the VFS will trigger writeback, which
43f67a85ff3be2 Darrick J. Wong 2022-07-14  802  		 * can require a transaction.  Clear DONTCACHE to force the
43f67a85ff3be2 Darrick J. Wong 2022-07-14  803  		 * inode to the LRU, where someone else can take care of
43f67a85ff3be2 Darrick J. Wong 2022-07-14  804  		 * dropping it.
43f67a85ff3be2 Darrick J. Wong 2022-07-14  805  		 *
43f67a85ff3be2 Darrick J. Wong 2022-07-14  806  		 * Note that when we grabbed our reference to the inode, it
43f67a85ff3be2 Darrick J. Wong 2022-07-14  807  		 * could have had an active ref and DONTCACHE set if a sysadmin
43f67a85ff3be2 Darrick J. Wong 2022-07-14  808  		 * is trying to coerce a change in file access mode.  icache
43f67a85ff3be2 Darrick J. Wong 2022-07-14  809  		 * hits do not clear DONTCACHE, so we must do it here.
43f67a85ff3be2 Darrick J. Wong 2022-07-14  810  		 */
43f67a85ff3be2 Darrick J. Wong 2022-07-14  811  		spin_lock(&VFS_I(ip)->i_lock);
43f67a85ff3be2 Darrick J. Wong 2022-07-14  812  		VFS_I(ip)->i_state &= ~I_DONTCACHE;
43f67a85ff3be2 Darrick J. Wong 2022-07-14  813  		spin_unlock(&VFS_I(ip)->i_lock);
43f67a85ff3be2 Darrick J. Wong 2022-07-14  814  	} else if (atomic_read(&VFS_I(ip)->i_count) == 1) {
43f67a85ff3be2 Darrick J. Wong 2022-07-14  815  		/*
43f67a85ff3be2 Darrick J. Wong 2022-07-14  816  		 * If this is the last reference to the inode and the caller
43f67a85ff3be2 Darrick J. Wong 2022-07-14  817  		 * permits it, set DONTCACHE to avoid thrashing.
43f67a85ff3be2 Darrick J. Wong 2022-07-14  818  		 */
43f67a85ff3be2 Darrick J. Wong 2022-07-14  819  		d_mark_dontcache(VFS_I(ip));
43f67a85ff3be2 Darrick J. Wong 2022-07-14  820  	}
43f67a85ff3be2 Darrick J. Wong 2022-07-14  821  
43f67a85ff3be2 Darrick J. Wong 2022-07-14  822  	xfs_irele(ip);
43f67a85ff3be2 Darrick J. Wong 2022-07-14  823  }
43f67a85ff3be2 Darrick J. Wong 2022-07-14  824  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
