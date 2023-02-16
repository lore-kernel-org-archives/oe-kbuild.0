Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D46D31B
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 06:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676527460; x=1708063460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aYNM9o/30VHUgFFSwG8kcpOg94tFSYuz0wE1g/5Fq+s=;
  b=Q40QERMThQajwNbtdkEO76+VPD37/UxnvVo9Ak4pPvfLzJoVFifqaRBo
   Viar3KLyfRnayrppkfpOugRdpR10qgKdtZCxiadGidZbETRwdfRGt/Zm9
   grPgnVTENF/47nqvhVtFpSq/K2k4mnHn80xM20/BMABvoej5R/xs1kgvK
   w7ppVuCENP4VqFMygU36SPt6ReeQA//O6cGEE6hxwJwi6WqUZ4Uibd0e9
   TGB1qrlR6MmYOvT65TzJBlSzfPiOxbTaJUdHoSBz67QqKr7nStkEB+/mR
   z8lfn2CM9mzMreyH3LJBbZZ6vBY3xF2RZBcELvii13dY04Ymlv6VjUccf
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="396274414"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="396274414"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 22:04:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="670012782"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="670012782"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Feb 2023 22:04:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSXNR-000A3l-35;
	Thu, 16 Feb 2023 06:04:17 +0000
Date: Thu, 16 Feb 2023 14:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:in-memory-btrees 111/182] fs/xfs/scrub/xfarray.c:486:27:
 warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Message-ID: <202302161321.73t2aZRO-lkp@intel.com>
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
head:   d2b66bc91f378dde0839bf411f8a9c6f56656acc
commit: cac672955a40d197ef9f302bb7b72e486b859008 [111/182] xfs: enable sorting of xfile-backed arrays
:::::: branch date: 25 hours ago
:::::: commit date: 2 weeks ago
config: s390-randconfig-c005-20230212 (https://download.01.org/0day-ci/archive/20230216/202302161321.73t2aZRO-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/r/202302161321.73t2aZRO-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   arch/s390/kernel/perf_cpum_sf.c:1911:28: note: Dereference of null pointer
           struct cpu_hw_sf *cpuhw = this_cpu_ptr(&cpu_hw_sf);
                                     ^
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
   arch/s390/kernel/perf_cpum_sf.c:1973:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           struct cpu_hw_sf *cpuhw = this_cpu_ptr(&cpu_hw_sf);
                                     ^
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
   arch/s390/kernel/perf_cpum_sf.c:1973:28: note: Loop condition is false.  Exiting loop
           struct cpu_hw_sf *cpuhw = this_cpu_ptr(&cpu_hw_sf);
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
   arch/s390/kernel/perf_cpum_sf.c:1973:28: note: Dereference of null pointer
           struct cpu_hw_sf *cpuhw = this_cpu_ptr(&cpu_hw_sf);
                                     ^
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
   Suppressed 8 warnings (8 in non-user code).
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
   32 warnings generated.
   security/keys/process_keys.c:77:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
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
