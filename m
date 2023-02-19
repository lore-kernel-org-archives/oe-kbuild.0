Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB58A29
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 09:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676799275; x=1708335275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G5hXjnjid2LW4/tNWh7xnz0CPWVX9z9XRh+gSejDfdQ=;
  b=WE1HoEUHtMl7gXhix6MaH6RoQYOsCY5OaEDoNvD6NyQfsVL2NGVRBEYs
   KBaxlL62p0Fe8CmkgGQrPtButgyw9XJdMyisS5DwX4k2W1Iu5kzxkU9j3
   m0+3P+ULRENqPcycz6xDXZmueXXErSmOEb+9OC1aO+bG8SWU9kf7LK79J
   A+G4FPUsbXJ5vmm9zAZoRGsXWBveQMcWKI/qr9p+rAJH07TlVmIisO2Yb
   uc4LUNqKyYwWql6Ug2TP+jNYzDrcp2kk0aeWUSCfWLlIVMKvoIoO6mhV3
   4nutx864Glxp2xJ00uvLxAfhtVSI703RDHef0o1wFbiNjgC6rVu+jCfI8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="330902640"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="330902640"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 01:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="664327860"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="664327860"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Feb 2023 01:34:32 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTg5Y-000DDw-0E;
	Sun, 19 Feb 2023 09:34:32 +0000
Date: Sun, 19 Feb 2023 17:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:in-memory-btrees 111/182] fs/xfs/scrub/xfarray.c:486:27:
 warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Message-ID: <202302191741.JWnunXam-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/scrub/xfarray.c:486:27: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git in-memory-btrees
head:   65b160b063691d49f132134659b0b200cb138e72
commit: cac672955a40d197ef9f302bb7b72e486b859008 [111/182] xfs: enable sorting of xfile-backed arrays
:::::: branch date: 33 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20230212 (https://download.01.org/0day-ci/archive/20230219/202302191741.JWnunXam-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=cac672955a40d197ef9f302bb7b72e486b859008
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs in-memory-btrees
        git checkout cac672955a40d197ef9f302bb7b72e486b859008
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302191741.JWnunXam-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/move_extent.c:276:2: note: Taking false branch
           if (IS_ERR(handle)) {
           ^
   fs/ext4/move_extent.c:288:6: note: Assuming the condition is false
           if ((orig_blk_offset + block_len_in_page - 1) ==
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/move_extent.c:288:2: note: Taking false branch
           if ((orig_blk_offset + block_len_in_page - 1) ==
           ^
   fs/ext4/move_extent.c:306:9: note: Calling 'mext_page_double_lock'
           *err = mext_page_double_lock(orig_inode, donor_inode, orig_page_offset,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/move_extent.c:130:10: note: 'inode1' is non-null
           BUG_ON(!inode1 || !inode2);
                   ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ext4/move_extent.c:130:9: note: Left side of '||' is false
           BUG_ON(!inode1 || !inode2);
                  ^
   fs/ext4/move_extent.c:130:21: note: 'inode2' is non-null
           BUG_ON(!inode1 || !inode2);
                              ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ext4/move_extent.c:130:2: note: Taking false branch
           BUG_ON(!inode1 || !inode2);
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   fs/ext4/move_extent.c:130:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!inode1 || !inode2);
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   fs/ext4/move_extent.c:131:6: note: 'inode1' is >= 'inode2'
           if (inode1 < inode2) {
               ^~~~~~
   fs/ext4/move_extent.c:131:2: note: Taking false branch
           if (inode1 < inode2) {
           ^
   fs/ext4/move_extent.c:135:3: note: Loop condition is false.  Exiting loop
                   swap(index1, index2);
                   ^
   include/linux/minmax.h:167:2: note: expanded from macro 'swap'
           do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
           ^
   fs/ext4/move_extent.c:140:10: note: Calling 'memalloc_nofs_save'
           flags = memalloc_nofs_save();
                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/sched/mm.h:321:23: note: Dereference of null pointer
           unsigned int flags = current->flags & PF_MEMALLOC_NOFS;
                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 11 warnings (11 in non-user code).
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
   fs/xfs/scrub/scrub.c:142:6: note: Calling 'xchk_should_terminate'
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
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
>> fs/xfs/scrub/xfarray.c:486:27: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
               fatal_signal_pending(current)) {
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/xfs/scrub/xfarray.c:812:6: note: Assuming field 'nr' is >= 2
           if (array->nr < 2)
               ^~~~~~~~~~~~~
   fs/xfs/scrub/xfarray.c:812:2: note: Taking false branch
           if (array->nr < 2)
           ^
   fs/xfs/scrub/xfarray.c:814:6: note: Assuming the condition is false
           if (array->nr >= QSORT_MAX_RECS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/xfarray.c:814:2: note: Taking false branch
           if (array->nr >= QSORT_MAX_RECS)
           ^
   fs/xfs/scrub/xfarray.c:818:6: note: 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/scrub/xfarray.c:818:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/scrub/xfarray.c:824:2: note: Loop condition is true.  Entering loop body
           while (si->stack_depth >= 0) {
           ^
   fs/xfs/scrub/xfarray.c:831:7: note: Assuming 'lo' is < 'hi'
                   if (lo >= hi) {
                       ^~~~~~~~
   fs/xfs/scrub/xfarray.c:831:3: note: Taking false branch
                   if (lo >= hi) {
                   ^
   fs/xfs/scrub/xfarray.c:837:3: note: Taking true branch
                   if (xfarray_want_isort(si, lo, hi)) {
                   ^
   fs/xfs/scrub/xfarray.c:838:12: note: Calling 'xfarray_isort'
                           error = xfarray_isort(si, lo, hi);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/xfarray.c:541:6: note: 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/scrub/xfarray.c:541:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/scrub/xfarray.c:543:21: note: Assuming 'run' is <= 'hi'
           for (run = lo + 1; run <= hi; run++) {
                              ^~~~~~~~~
   fs/xfs/scrub/xfarray.c:543:2: note: Loop condition is true.  Entering loop body
           for (run = lo + 1; run <= hi; run++) {
           ^
   fs/xfs/scrub/xfarray.c:546:7: note: 'error' is 0
                   if (error)
                       ^~~~~
   fs/xfs/scrub/xfarray.c:546:3: note: Taking false branch
                   if (error)
                   ^
   fs/xfs/scrub/xfarray.c:548:7: note: Assuming the condition is false
                   if (xfarray_sort_cmp(si, a, b) < 0) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/xfarray.c:548:3: note: Taking false branch
                   if (xfarray_sort_cmp(si, a, b) < 0) {
                   ^
   fs/xfs/scrub/xfarray.c:553:7: note: Calling 'xfarray_sort_terminated'
                   if (xfarray_sort_terminated(si, &error))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/xfarray.c:485:7: note: Assuming the condition is true
           if ((si->flags & XFARRAY_SORT_KILLABLE) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/xfarray.c:485:6: note: Left side of '&&' is true
           if ((si->flags & XFARRAY_SORT_KILLABLE) &&
               ^
   fs/xfs/scrub/xfarray.c:486:27: note: Dereference of null pointer
               fatal_signal_pending(current)) {
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   arch/s390/include/asm/spinlock.h:61:52: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKVAL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINLOCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   kernel/time/clockevents.c:405:2: note: Calling '__raw_spin_lock'
           raw_spin_lock(&clockevents_lock);
           ^
   include/linux/spinlock.h:216:29: note: expanded from macro 'raw_spin_lock'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:47:30: note: expanded from macro '_raw_spin_lock'
   #define _raw_spin_lock(lock) __raw_spin_lock(lock)

vim +486 fs/xfs/scrub/xfarray.c

cac672955a40d1 Darrick J. Wong 2022-07-14  471  
cac672955a40d1 Darrick J. Wong 2022-07-14  472  /* Should this sort be terminated by a fatal signal? */
cac672955a40d1 Darrick J. Wong 2022-07-14  473  static inline bool
cac672955a40d1 Darrick J. Wong 2022-07-14  474  xfarray_sort_terminated(
cac672955a40d1 Darrick J. Wong 2022-07-14  475  	struct xfarray_sortinfo	*si,
cac672955a40d1 Darrick J. Wong 2022-07-14  476  	int			*error)
cac672955a40d1 Darrick J. Wong 2022-07-14  477  {
cac672955a40d1 Darrick J. Wong 2022-07-14  478  	/*
cac672955a40d1 Darrick J. Wong 2022-07-14  479  	 * If preemption is disabled, we need to yield to the scheduler every
cac672955a40d1 Darrick J. Wong 2022-07-14  480  	 * few seconds so that we don't run afoul of the soft lockup watchdog
cac672955a40d1 Darrick J. Wong 2022-07-14  481  	 * or RCU stall detector.
cac672955a40d1 Darrick J. Wong 2022-07-14  482  	 */
cac672955a40d1 Darrick J. Wong 2022-07-14  483  	cond_resched();
cac672955a40d1 Darrick J. Wong 2022-07-14  484  
cac672955a40d1 Darrick J. Wong 2022-07-14  485  	if ((si->flags & XFARRAY_SORT_KILLABLE) &&
cac672955a40d1 Darrick J. Wong 2022-07-14 @486  	    fatal_signal_pending(current)) {
cac672955a40d1 Darrick J. Wong 2022-07-14  487  		if (*error == 0)
cac672955a40d1 Darrick J. Wong 2022-07-14  488  			*error = -EINTR;
cac672955a40d1 Darrick J. Wong 2022-07-14  489  		return true;
cac672955a40d1 Darrick J. Wong 2022-07-14  490  	}
cac672955a40d1 Darrick J. Wong 2022-07-14  491  	return false;
cac672955a40d1 Darrick J. Wong 2022-07-14  492  }
cac672955a40d1 Darrick J. Wong 2022-07-14  493  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
