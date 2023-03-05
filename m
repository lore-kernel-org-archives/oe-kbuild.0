Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6738A15B4
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 01:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677979753; x=1709515753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kXil7Q0DT9XnwQGsSPtksjlZFh/olwfp98U7LZM6iHI=;
  b=hysBScPvKYiyItGpiMaA04btFuUFnYPSZUCz6kfl6ga/RIsvxH1gSy/W
   XuaawjIh+s9eZoRJhF+liiZimxK5q4MFnTR4xrn/noxM/E2zIkJOye1tm
   RMhsTNH1BEQ7cs0d4Er/FZDnXIGAGecP9mYN+8trWzohlTkTecZwiHezx
   20p2Oy/IWROfW3t3jvkpk1S8ikIPFl0h04IVwIcfz/lcLu9HhSvIdqX3R
   0Q/PK9UK3eaDWBSfS9kixWvfpB2d7/yUhVqJ/TxDmh69l56WUF2xMBgor
   f6BSWl4vFtLy2bKwmzhgon1cza4TfVA5vlMOiX5wiFtaD/mRF9q0xOKSJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="335353336"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="335353336"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 17:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="739913894"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="739913894"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Mar 2023 17:29:11 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYdBW-0002TQ-1b;
	Sun, 05 Mar 2023 01:29:10 +0000
Date: Sun, 5 Mar 2023 09:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/s390/include/asm/abs_lowcore.h:18:8: warning: Dereference of
 null pointer [clang-analyzer-core.NullDereference]
Message-ID: <202303050931.1hcKI9Wu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/s390/include/asm/abs_lowcore.h:18:8: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e77d587a2c04e82c6a0dffa4a32c874a4029385d
commit: 2154e0b3282d0029ea7790a8414d61d5dc7d72ff s390/mm: allocate Absolute Lowcore Area in decompressor
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
config: s390-randconfig-c005-20230302 (https://download.01.org/0day-ci/archive/20230305/202303050931.1hcKI9Wu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2154e0b3282d0029ea7790a8414d61d5dc7d72ff
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2154e0b3282d0029ea7790a8414d61d5dc7d72ff
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303050931.1hcKI9Wu-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           BUG_ON(*pos < start_pos);
           ^
   include/asm-generic/bug.h:162:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   include/linux/regset.h:260:2: note: Loop condition is false.  Exiting loop
           BUG_ON(*pos < start_pos);
           ^
   include/asm-generic/bug.h:162:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   include/linux/regset.h:261:6: note: 'end_pos' is >= 0
           if (end_pos < 0 || *pos < end_pos) {
               ^~~~~~~
   include/linux/regset.h:261:6: note: Left side of '||' is false
   include/linux/regset.h:261:21: note: Assuming the condition is true
           if (end_pos < 0 || *pos < end_pos) {
                              ^~~~~~~~~~~~~~
   include/linux/regset.h:261:2: note: Taking true branch
           if (end_pos < 0 || *pos < end_pos) {
           ^
   include/linux/regset.h:262:24: note: 'end_pos' is >= 0
                   unsigned int copy = (end_pos < 0 ? *count
                                        ^~~~~~~
   include/linux/regset.h:262:24: note: '?' condition is false
   include/linux/regset.h:263:12: note: Assuming '__UNIQUE_ID___x258' is >= '__UNIQUE_ID___y259'
                                        : min(*count, end_pos - *pos));
                                          ^
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
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
   include/linux/regset.h:263:12: note: '?' condition is false
                                        : min(*count, end_pos - *pos));
                                          ^
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   include/linux/regset.h:265:7: note: Assuming the condition is true
                   if (*kbuf) {
                       ^~~~~
   include/linux/regset.h:265:3: note: Taking true branch
                   if (*kbuf) {
                   ^
   include/linux/regset.h:275:2: note: Returning zero, which participates in a condition later
           return 0;
           ^~~~~~~~
   arch/s390/kernel/ptrace.c:1217:7: note: Returning from 'user_regset_copyin'
           rc = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/ptrace.c:1219:6: note: 'rc' is 0
           if (rc) {
               ^~
   arch/s390/kernel/ptrace.c:1219:2: note: Taking false branch
           if (rc) {
           ^
   arch/s390/kernel/ptrace.c:1224:2: note: Taking false branch
           if (!is_ri_cb_valid(&ri_cb)) {
           ^
   arch/s390/kernel/ptrace.c:1233:2: note: Loop condition is false.  Exiting loop
           preempt_disable();
           ^
   include/linux/preempt.h:201:27: note: expanded from macro 'preempt_disable'
   #define preempt_disable() \
                             ^
   arch/s390/kernel/ptrace.c:1234:22: note: Field 'ri_cb' is null
           if (!target->thread.ri_cb)
                               ^
   arch/s390/kernel/ptrace.c:1234:2: note: Taking true branch
           if (!target->thread.ri_cb)
           ^
   arch/s390/kernel/ptrace.c:1237:16: note: Dereference of null pointer
           if (target == current)
                         ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
>> arch/s390/include/asm/abs_lowcore.h:18:8: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           cpu = get_cpu();
                 ^
   include/linux/smp.h:267:42: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id(); })
                                                         ^
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_id'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   arch/s390/kernel/ipl.c:1993:11: note: Calling 'get_abs_lowcore'
           abs_lc = get_abs_lowcore();
                    ^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/abs_lowcore.h:18:8: note: Loop condition is false.  Exiting loop
           cpu = get_cpu();
                 ^
   include/linux/smp.h:267:23: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id(); })
                                      ^
   include/linux/preempt.h:201:27: note: expanded from macro 'preempt_disable'
   #define preempt_disable() \
                             ^
   arch/s390/include/asm/abs_lowcore.h:18:8: note: Dereference of null pointer
           cpu = get_cpu();
                 ^
   include/linux/smp.h:267:42: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id(); })
                                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_id'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/ipl.c:671:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   if (MACHINE_IS_VM)
                       ^
   arch/s390/include/asm/setup.h:83:25: note: expanded from macro 'MACHINE_IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FLAG_VM)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/ipl.c:665:6: note: Assuming 'ipl_kset' is non-null
           if (!ipl_kset) {
               ^~~~~~~~~
   arch/s390/kernel/ipl.c:665:2: note: Taking false branch
           if (!ipl_kset) {
           ^
   arch/s390/kernel/ipl.c:669:2: note: Control jumps to 'case IPL_TYPE_CCW:'  at line 670
           switch (ipl_info.type) {
           ^
   arch/s390/kernel/ipl.c:671:7: note: Dereference of null pointer
                   if (MACHINE_IS_VM)
                       ^
   arch/s390/include/asm/setup.h:83:25: note: expanded from macro 'MACHINE_IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FLAG_VM)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/ipl.c:1410:6: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (MACHINE_IS_VM && ipl_block_valid &&
               ^
   arch/s390/include/asm/setup.h:83:25: note: expanded from macro 'MACHINE_IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FLAG_VM)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/ipl.c:1402:6: note: Assuming field 'is_valid' is 0
           if (sclp_ipl_info.is_valid)
               ^~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/ipl.c:1402:2: note: Taking false branch
           if (sclp_ipl_info.is_valid)
           ^
   arch/s390/kernel/ipl.c:1410:6: note: Dereference of null pointer
           if (MACHINE_IS_VM && ipl_block_valid &&
               ^
   arch/s390/include/asm/setup.h:83:25: note: expanded from macro 'MACHINE_IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FLAG_VM)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/ipl.c:1424:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (!MACHINE_IS_VM)
                ^
   arch/s390/include/asm/setup.h:83:25: note: expanded from macro 'MACHINE_IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FLAG_VM)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/ipl.c:1424:7: note: Dereference of null pointer
           if (!MACHINE_IS_VM)
                ^
   arch/s390/include/asm/setup.h:83:25: note: expanded from macro 'MACHINE_IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FLAG_VM)
--
   fs/exfat/file.c:48:14: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (!uid_eq(current_fsuid(), inode->i_uid)) {
                       ^
   include/linux/cred.h:387:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/exfat/file.c:253:7: note: Assuming the condition is false
           if ((attr->ia_valid & ATTR_SIZE) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/exfat/file.c:253:35: note: Left side of '&&' is false
           if ((attr->ia_valid & ATTR_SIZE) &&
                                            ^
   fs/exfat/file.c:263:7: note: Assuming the condition is true
           if ((ia_valid & (ATTR_MTIME_SET | ATTR_ATIME_SET | ATTR_TIMES_SET)) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/exfat/file.c:263:6: note: Left side of '&&' is true
           if ((ia_valid & (ATTR_MTIME_SET | ATTR_ATIME_SET | ATTR_TIMES_SET)) &&
               ^
   fs/exfat/file.c:264:6: note: Calling 'exfat_allow_set_time'
               exfat_allow_set_time(sbi, inode)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/exfat/file.c:48:14: note: Left side of '&&' is false
           if (!uid_eq(current_fsuid(), inode->i_uid)) {
                       ^
   include/linux/cred.h:387:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
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
   include/linux/rcupdate.h:381:11: note: expanded from macro 'RCU_LOCKDEP_WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   fs/exfat/file.c:48:14: note: Loop condition is false.  Exiting loop
           if (!uid_eq(current_fsuid(), inode->i_uid)) {
                       ^
   include/linux/cred.h:387:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
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
   include/linux/rcupdate.h:379:2: note: expanded from macro 'RCU_LOCKDEP_WARN'
           do {                                                            \
           ^
   fs/exfat/file.c:48:14: note: Dereference of null pointer
           if (!uid_eq(current_fsuid(), inode->i_uid)) {
                       ^
   include/linux/cred.h:387:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^~~~~~~~~~~~~~
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:664:31: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:462:35: note: expanded from macro '__rcu_dereference_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
>> arch/s390/include/asm/abs_lowcore.h:18:8: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           cpu = get_cpu();
                 ^
   include/linux/smp.h:267:42: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id(); })
                                                         ^
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_id'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   arch/s390/kernel/os_info.c:67:11: note: Calling 'get_abs_lowcore'
           abs_lc = get_abs_lowcore();
                    ^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/abs_lowcore.h:18:8: note: Loop condition is false.  Exiting loop
           cpu = get_cpu();
                 ^
   include/linux/smp.h:267:23: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id(); })
                                      ^
   include/linux/preempt.h:201:27: note: expanded from macro 'preempt_disable'
   #define preempt_disable() \
                             ^
   arch/s390/include/asm/abs_lowcore.h:18:8: note: Dereference of null pointer
           cpu = get_cpu();
                 ^
   include/linux/smp.h:267:42: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id(); })
                                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_id'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   include/trace/events/lock.h:95:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   TRACE_EVENT(contention_begin,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   kernel/locking/semaphore.c:164:2: note: Loop condition is false.  Exiting loop
           might_sleep();
           ^
   include/linux/kernel.h:143:42: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while (0)
                                                   ^
   include/linux/kernel.h:120:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   kernel/locking/semaphore.c:164:2: note: Loop condition is false.  Exiting loop
           might_sleep();
           ^
   include/linux/kernel.h:143:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while (0)
           ^
   kernel/locking/semaphore.c:165:2: note: Loop condition is false.  Exiting loop
           raw_spin_lock_irqsave(&sem->lock, flags);
           ^
   include/linux/spinlock.h:241:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   kernel/locking/semaphore.c:166:13: note: Assuming field 'count' is <= 0
           if (likely(sem->count > 0))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   kernel/locking/semaphore.c:166:2: note: Taking false branch
           if (likely(sem->count > 0))
           ^
   kernel/locking/semaphore.c:169:12: note: Calling '__down_timeout'
                   result = __down_timeout(sem, timeout);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/semaphore.c:269:9: note: Calling '__down_common'
           return __down_common(sem, TASK_UNINTERRUPTIBLE, timeout);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/semaphore.c:245:2: note: Calling 'trace_contention_begin'
           trace_contention_begin(sem, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/lock.h:95:1: note: Taking true branch
   TRACE_EVENT(contention_begin,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:247:3: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
--
                             ^
   include/linux/percpu-rwsem.h:81:2: note: Taking true branch
           if (likely(rcu_sync_is_idle(&sem->rss)))
           ^
   include/linux/percpu-rwsem.h:82:3: note: Loop condition is false.  Exiting loop
                   this_cpu_inc(*sem->read_count);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^
   include/linux/percpu-defs.h:375:2: note: expanded from macro '__pcpu_size_call'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/percpu-rwsem.h:82:3: note: Control jumps to 'case 4:'  at line 82
                   this_cpu_inc(*sem->read_count);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^
   include/linux/percpu-defs.h:376:2: note: expanded from macro '__pcpu_size_call'
           switch(sizeof(variable)) {                                      \
           ^
   include/linux/percpu-rwsem.h:82:3: note: Loop condition is false.  Exiting loop
                   this_cpu_inc(*sem->read_count);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_size_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/s390/include/asm/percpu.h:90:34: note: expanded from macro 'this_cpu_add_4'
   #define this_cpu_add_4(pcp, val) arch_this_cpu_add(pcp, val, "laa", "asi", int)
                                    ^
   arch/s390/include/asm/percpu.h:71:2: note: expanded from macro 'arch_this_cpu_add'
           preempt_disable_notrace();                                      \
           ^
   include/linux/preempt.h:254:35: note: expanded from macro 'preempt_disable_notrace'
   #define preempt_disable_notrace() \
                                     ^
   include/linux/percpu-rwsem.h:82:3: note: Loop condition is false.  Exiting loop
                   this_cpu_inc(*sem->read_count);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_size_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/s390/include/asm/percpu.h:72:10: note: expanded from macro 'arch_this_cpu_add'
           ptr__ = raw_cpu_ptr(&(pcp));                            \
                   ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/percpu-rwsem.h:82:3: note: Dereference of null pointer
                   this_cpu_inc(*sem->read_count);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_size_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
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
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
>> arch/s390/include/asm/abs_lowcore.h:18:8: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           cpu = get_cpu();
                 ^
   include/linux/smp.h:267:42: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id(); })
                                                         ^
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_id'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   arch/s390/kernel/machine_kexec.c:234:11: note: Calling 'get_abs_lowcore'
           abs_lc = get_abs_lowcore();
                    ^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/abs_lowcore.h:18:8: note: Loop condition is false.  Exiting loop
           cpu = get_cpu();
                 ^
   include/linux/smp.h:267:23: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id(); })
                                      ^
   include/linux/preempt.h:201:27: note: expanded from macro 'preempt_disable'
   #define preempt_disable() \
                             ^
   arch/s390/include/asm/abs_lowcore.h:18:8: note: Dereference of null pointer
           cpu = get_cpu();
                 ^
   include/linux/smp.h:267:42: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id(); })
                                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_id'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   arch/s390/kernel/runtime_instr.c:33:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           struct task_struct *task = current;
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/runtime_instr.c:70:1: note: Calling '__do_sys_s390_runtime_instr'
   SYSCALL_DEFINE2(s390_runtime_instr, int, command, int, signum)
   ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFINE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFINEx'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/syscall_wrapper.h:157:14: note: expanded from macro '__SYSCALL_DEFINEx'
                   long ret = __do_sys##name(SYSCALL_PT_ARGS(x, regs,                      \
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   arch/s390/kernel/runtime_instr.c:74:2: note: Taking false branch
           if (!test_facility(64))
           ^
   arch/s390/kernel/runtime_instr.c:77:6: note: Assuming 'command' is equal to S390_RUNTIME_INSTR_STOP
           if (command == S390_RUNTIME_INSTR_STOP) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/runtime_instr.c:77:2: note: Taking true branch
           if (command == S390_RUNTIME_INSTR_STOP) {
           ^
   arch/s390/kernel/runtime_instr.c:78:3: note: Calling 'disable_runtime_instr'
                   disable_runtime_instr();
                   ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/runtime_instr.c:33:29: note: Dereference of null pointer
           struct task_struct *task = current;
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/runtime_instr.c:85:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (!current->thread.ri_cb) {
                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/runtime_instr.c:70:1: note: Calling '__do_sys_s390_runtime_instr'
   SYSCALL_DEFINE2(s390_runtime_instr, int, command, int, signum)
   ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFINE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFINEx'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/syscall_wrapper.h:157:14: note: expanded from macro '__SYSCALL_DEFINEx'
--
                            ^
   fs/verity/read_metadata.c:42:32: note: Assuming '__UNIQUE_ID___x304' is >= '__UNIQUE_ID___y305'
                   unsigned int bytes_to_copy = min_t(u64, end_offset - offset,
                                                ^
   include/linux/minmax.h:126:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   fs/verity/read_metadata.c:42:32: note: '?' condition is false
                   unsigned int bytes_to_copy = min_t(u64, end_offset - offset,
                                                ^
   include/linux/minmax.h:126:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/verity/read_metadata.c:48:3: note: Taking false branch
                   if (IS_ERR(page)) {
                   ^
   fs/verity/read_metadata.c:57:7: note: Assuming the condition is false
                   if (copy_to_user(buf, virt + offs_in_page, bytes_to_copy)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/read_metadata.c:57:3: note: Taking false branch
                   if (copy_to_user(buf, virt + offs_in_page, bytes_to_copy)) {
                   ^
   fs/verity/read_metadata.c:63:3: note: Taking false branch
                   kunmap_local(virt);
                   ^
   include/linux/highmem-internal.h:283:2: note: expanded from macro 'kunmap_local'
           BUILD_BUG_ON(__same_type((__addr), struct page *));     \
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
           ^
   include/linux/compiler_types.h:338:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   fs/verity/read_metadata.c:63:3: note: Loop condition is false.  Exiting loop
                   kunmap_local(virt);
                   ^
   include/linux/highmem-internal.h:283:2: note: expanded from macro 'kunmap_local'
           BUILD_BUG_ON(__same_type((__addr), struct page *));     \
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
           ^
   include/linux/compiler_types.h:330:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   fs/verity/read_metadata.c:63:3: note: Loop condition is false.  Exiting loop
                   kunmap_local(virt);
                   ^
   include/linux/highmem-internal.h:281:34: note: expanded from macro 'kunmap_local'
   #define kunmap_local(__addr)                                    \
                                                                   ^
   fs/verity/read_metadata.c:70:28: note: Dereference of null pointer
                   if (fatal_signal_pending(current))  {
                                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   34 warnings generated.
>> arch/s390/include/asm/abs_lowcore.h:18:8: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           cpu = get_cpu();
                 ^
   include/linux/smp.h:267:42: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id(); })
                                                         ^
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_id'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   arch/s390/kernel/smp.c:597:6: note: Assuming 'set' is true
           if (set) {
               ^~~
   arch/s390/kernel/smp.c:597:2: note: Taking true branch
           if (set) {
           ^
   arch/s390/kernel/smp.c:605:11: note: Calling 'get_abs_lowcore'
           abs_lc = get_abs_lowcore();
                    ^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/abs_lowcore.h:18:8: note: Loop condition is false.  Exiting loop
           cpu = get_cpu();
                 ^
   include/linux/smp.h:267:23: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id(); })
                                      ^
   include/linux/preempt.h:201:27: note: expanded from macro 'preempt_disable'
   #define preempt_disable() \
                             ^
   arch/s390/include/asm/abs_lowcore.h:18:8: note: Dereference of null pointer
           cpu = get_cpu();
                 ^
   include/linux/smp.h:267:42: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id(); })
                                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_id'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/irq.h:80:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           __this_cpu_inc(irq_stat.irqs[irq]);
           ^
   include/linux/percpu-defs.h:497:30: note: expanded from macro '__this_cpu_inc'
   #define __this_cpu_inc(pcp)             __this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:458:2: note: expanded from macro '__this_cpu_add'
           raw_cpu_add(pcp, val);                                          \
           ^
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_add'
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, pcp, val)
                                           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   arch/s390/kernel/smp.c:533:15: note: Assuming field 'code' is not equal to 4610
           inc_irq_stat(ext_code.code == 0x1202 ? IRQEXT_EXC : IRQEXT_EMS);
                        ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/smp.c:533:15: note: '?' condition is false
   arch/s390/kernel/smp.c:533:2: note: Calling 'inc_irq_stat'
           inc_irq_stat(ext_code.code == 0x1202 ? IRQEXT_EXC : IRQEXT_EMS);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/irq.h:80:2: note: Loop condition is false.  Exiting loop
           __this_cpu_inc(irq_stat.irqs[irq]);
           ^
   include/linux/percpu-defs.h:497:30: note: expanded from macro '__this_cpu_inc'
   #define __this_cpu_inc(pcp)             __this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:458:2: note: expanded from macro '__this_cpu_add'
           raw_cpu_add(pcp, val);                                          \
           ^
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_add'
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, pcp, val)
                                           ^
   include/linux/percpu-defs.h:375:2: note: expanded from macro '__pcpu_size_call'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   arch/s390/include/asm/irq.h:80:2: note: Control jumps to 'case 4:'  at line 80
           __this_cpu_inc(irq_stat.irqs[irq]);
           ^
   include/linux/percpu-defs.h:497:30: note: expanded from macro '__this_cpu_inc'
   #define __this_cpu_inc(pcp)             __this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:458:2: note: expanded from macro '__this_cpu_add'
           raw_cpu_add(pcp, val);                                          \
           ^
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_add'
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, pcp, val)
                                           ^

vim +18 arch/s390/include/asm/abs_lowcore.h

4df29d2b9024d6 Alexander Gordeev 2022-07-20  13  
2154e0b3282d00 Alexander Gordeev 2022-12-19  14  static inline struct lowcore *get_abs_lowcore(void)
2154e0b3282d00 Alexander Gordeev 2022-12-19  15  {
2154e0b3282d00 Alexander Gordeev 2022-12-19  16  	int cpu;
2154e0b3282d00 Alexander Gordeev 2022-12-19  17  
2154e0b3282d00 Alexander Gordeev 2022-12-19 @18  	cpu = get_cpu();
2154e0b3282d00 Alexander Gordeev 2022-12-19  19  	return ((struct lowcore *)__abs_lowcore) + cpu;
2154e0b3282d00 Alexander Gordeev 2022-12-19  20  }
2154e0b3282d00 Alexander Gordeev 2022-12-19  21  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
