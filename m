Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489C1361
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Feb 2023 01:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676598059; x=1708134059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2d3JsWsL7LcG1Rx8CkSigCvG2FrBb8tYIJk0/40gQzE=;
  b=ExNhSug3qg6YSxIalAP1jrCiCEBblCxlbASJIyjw9XMULF8/PD89mApV
   3qequbBzOBlo18S0ALTZ7+F3fAeo8bo7ItlEu3I0AcVH/IBZRnTZ8/BCa
   sr+YJgQGAttQWG2kzKo37K+pJ/sMenNDG/V95L60bxoRGfVA6pOiQtgWr
   V3oVc2T+We71S+pY/538GaN+d3mG66yb+/3s0vWUZET7N1YCV122gaO5A
   zTKyGIYUNyawpSJ8HgJO+W2DIoh0liDxhQJZ7dkAbhg9ArERrRIPBtS7q
   oJY3eu5OlgEiDdsDhLKcuvguAz+OQ1OyGTmY1fN90Jj5RUIYThHroQHgZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331887800"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="331887800"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 17:40:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="844403479"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="844403479"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Feb 2023 17:40:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSpk6-000B1Z-2v;
	Fri, 17 Feb 2023 01:40:54 +0000
Date: Fri, 17 Feb 2023 09:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:sched/core 27/54] include/linux/thread_info.h:185:28: warning:
 Dereference of null pointer [clang-analyzer-core.NullDereference]
Message-ID: <202302170954.eeCLaau5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   7c4a5b89a0b5a57a64b601775b296abf77a9fe97
commit: e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49 [27/54] cpuidle, sched: Remove instrumentation from TIF_{POLLING_NRFLAG,NEED_RESCHED}
:::::: branch date: 6 days ago
:::::: commit date: 5 weeks ago
config: s390-randconfig-c005-20230210 (https://download.01.org/0day-ci/archive/20230217/202302170954.eeCLaau5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip sched/core
        git checkout e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302170954.eeCLaau5-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/time/itimer.c:306:1: note: Calling '__do_sys_alarm'
   SYSCALL_DEFINE1(alarm, unsigned int, seconds)
   ^
   include/linux/syscalls.h:217:36: note: expanded from macro 'SYSCALL_DEFINE1'
   #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFINEx'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/syscall_wrapper.h:157:14: note: expanded from macro '__SYSCALL_DEFINEx'
                   long ret = __do_sys##name(SYSCALL_PT_ARGS(x, regs,                      \
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   kernel/time/itimer.c:308:9: note: Calling 'alarm_setitimer'
           return alarm_setitimer(seconds);
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/itimer.c:289:2: note: Calling 'do_setitimer'
           do_setitimer(ITIMER_REAL, &it_new, &it_old);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/itimer.c:209:28: note: Dereference of null pointer
           struct task_struct *tsk = current;
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   arch/s390/include/asm/preempt.h:107:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count += val;
                                      ^
   kernel/locking/mutex.c:577:6: note: Assuming 'use_ww_ctx' is true
           if (!use_ww_ctx)
               ^~~~~~~~~~~
   kernel/locking/mutex.c:577:2: note: Taking false branch
           if (!use_ww_ctx)
           ^
   kernel/locking/mutex.c:580:2: note: Loop condition is false.  Exiting loop
           might_sleep();
           ^
   include/linux/kernel.h:185:29: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                               ^
   include/linux/kernel.h:120:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   kernel/locking/mutex.c:580:2: note: Loop condition is false.  Exiting loop
           might_sleep();
           ^
   include/linux/kernel.h:185:24: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                          ^
   kernel/locking/mutex.c:582:2: note: Assuming 'oops_in_progress' is not equal to 0
           MUTEX_WARN_ON(lock->magic != lock);
           ^
   kernel/locking/mutex.c:40:30: note: expanded from macro 'MUTEX_WARN_ON'
   # define MUTEX_WARN_ON(cond) DEBUG_LOCKS_WARN_ON(cond)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debug_locks.h:28:6: note: expanded from macro 'DEBUG_LOCKS_WARN_ON'
           if (!oops_in_progress && unlikely(c)) {                         \
               ^~~~~~~~~~~~~~~~~
   kernel/locking/mutex.c:582:2: note: Left side of '&&' is false
           MUTEX_WARN_ON(lock->magic != lock);
           ^
   kernel/locking/mutex.c:40:30: note: expanded from macro 'MUTEX_WARN_ON'
   # define MUTEX_WARN_ON(cond) DEBUG_LOCKS_WARN_ON(cond)
                                ^
   include/linux/debug_locks.h:28:24: note: expanded from macro 'DEBUG_LOCKS_WARN_ON'
           if (!oops_in_progress && unlikely(c)) {                         \
                                 ^
   kernel/locking/mutex.c:585:6: note: Assuming 'ww_ctx' is null
           if (ww_ctx) {
               ^~~~~~
   kernel/locking/mutex.c:585:2: note: Taking false branch
           if (ww_ctx) {
           ^
   kernel/locking/mutex.c:602:2: note: Calling '__preempt_count_add'
           preempt_disable();
           ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   kernel/locking/mutex.c:444:6: note: Assuming 'waiter' is null
           if (!waiter) {
               ^~~~~~~
   kernel/locking/mutex.c:444:2: note: Taking true branch
           if (!waiter) {
           ^
   kernel/locking/mutex.c:452:7: note: Assuming the condition is true
                   if (!mutex_can_spin_on_owner(lock))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/mutex.c:452:3: note: Taking true branch
                   if (!mutex_can_spin_on_owner(lock))
                   ^
   kernel/locking/mutex.c:453:4: note: Control jumps to line 504
                           goto fail;
                           ^
   kernel/locking/mutex.c:504:6: note: Calling 'need_resched'
           if (need_resched()) {
               ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/mutex.c:105:45: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           unsigned long owner, curr = (unsigned long)current;
                                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/mutex.c:144:10: note: Calling '__mutex_trylock_common'
           return !__mutex_trylock_common(lock, handoff);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/mutex.c:105:45: note: Dereference of null pointer
           unsigned long owner, curr = (unsigned long)current;
                                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/mutex.c:208:39: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           debug_mutex_add_waiter(lock, waiter, current);
                                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/mutex.c:208:39: note: Dereference of null pointer
           debug_mutex_add_waiter(lock, waiter, current);
                                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/mutex.c:222:42: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           debug_mutex_remove_waiter(lock, waiter, current);
                                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/mutex.c:219:6: note: Assuming the condition is false
           if (likely(list_empty(&lock->wait_list)))
               ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
--
   39 warnings generated.
   arch/s390/include/asm/preempt.h:107:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count += val;
                                      ^
   fs/fs-writeback.c:2330:2: note: Calling 'rcu_read_lock'
           rcu_read_lock();
           ^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:762:2: note: Calling '__rcu_read_lock'
           __rcu_read_lock();
           ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:94:2: note: Calling '__preempt_count_add'
           preempt_disable();
           ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
   fs/fs-writeback.c:1466:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           DEFINE_WAIT_BIT(wq, &inode->i_state, __I_SYNC);
           ^
   include/linux/wait_bit.h:42:15: note: expanded from macro 'DEFINE_WAIT_BIT'
                           .private        = current,                              \
                                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/fs-writeback.c:1484:2: note: Calling '__inode_wait_for_writeback'
           __inode_wait_for_writeback(inode);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1466:2: note: Dereference of null pointer
           DEFINE_WAIT_BIT(wq, &inode->i_state, __I_SYNC);
           ^
   include/linux/wait_bit.h:42:15: note: expanded from macro 'DEFINE_WAIT_BIT'
                           .private        = current,                              \
                                             ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/fs-writeback.c:1496:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           DEFINE_WAIT(wait);
           ^
   include/linux/wait.h:1208:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_function)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/wait.h:1203:14: note: expanded from macro 'DEFINE_WAIT_FUNC'
                   .private        = current,                                      \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/fs-writeback.c:1496:2: note: Dereference of null pointer
           DEFINE_WAIT(wait);
           ^
   include/linux/wait.h:1208:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_function)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/wait.h:1203:14: note: expanded from macro 'DEFINE_WAIT_FUNC'
                   .private        = current,                                      \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/fs-writeback.c:2300:17: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           blk_flush_plug(current->plug, true);
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/fs-writeback.c:2300:17: note: Dereference of null pointer
           blk_flush_plug(current->plug, true);
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   fs/fs-writeback.c:2237:13: note: Assuming the condition is false
           if (likely(!current_is_workqueue_rescuer() ||
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/fs-writeback.c:2237:13: note: Left side of '||' is false
           if (likely(!current_is_workqueue_rescuer() ||
                      ^
   fs/fs-writeback.c:2238:7: note: Left side of '&&' is true
                      !test_bit(WB_registered, &wb->state))) {
                       ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   fs/fs-writeback.c:2238:7: note: Left side of '&&' is false
                      !test_bit(WB_registered, &wb->state))) {
                       ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                                                        ^
   fs/fs-writeback.c:2238:6: note: Assuming the condition is false
                      !test_bit(WB_registered, &wb->state))) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/fs-writeback.c:2237:2: note: Taking false branch
           if (likely(!current_is_workqueue_rescuer() ||
           ^
   fs/fs-writeback.c:2255:19: note: Calling 'writeback_inodes_wb'
                   pages_written = writeback_inodes_wb(wb, 1024,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1988:6: note: Assuming the condition is false
           if (list_empty(&wb->b_io))
               ^~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1988:2: note: Taking false branch
           if (list_empty(&wb->b_io))
           ^
   fs/fs-writeback.c:1990:2: note: Calling '__writeback_inodes_wb'
           __writeback_inodes_wb(wb, &work);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1947:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&wb->b_io)) {
           ^
   fs/fs-writeback.c:1951:7: note: Assuming the condition is false
                   if (!trylock_super(sb)) {
                       ^~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1951:3: note: Taking false branch
                   if (!trylock_super(sb)) {
                   ^
   fs/fs-writeback.c:1960:12: note: Calling 'writeback_sb_inodes'
                   wrote += writeback_sb_inodes(sb, wb, work);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1814:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&wb->b_io)) {
           ^
   fs/fs-writeback.c:1819:22: note: 'sb' is equal to field 'i_sb'
                   if (inode->i_sb != sb) {
                                      ^~
   fs/fs-writeback.c:1819:3: note: Taking false branch
                   if (inode->i_sb != sb) {
                   ^
   fs/fs-writeback.c:1844:7: note: Assuming the condition is false
                   if (inode->i_state & (I_NEW | I_FREEING | I_WILL_FREE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1844:3: note: Taking false branch
                   if (inode->i_state & (I_NEW | I_FREEING | I_WILL_FREE)) {
                   ^
   fs/fs-writeback.c:1849:8: note: Assuming the condition is false
                   if ((inode->i_state & I_SYNC) && wbc.sync_mode != WB_SYNC_ALL) {
                        ^~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1849:33: note: Left side of '&&' is false
                   if ((inode->i_state & I_SYNC) && wbc.sync_mode != WB_SYNC_ALL) {
                                                 ^
   fs/fs-writeback.c:1871:3: note: Taking false branch
                   if (inode->i_state & I_SYNC) {
                   ^
   fs/fs-writeback.c:1894:11: note: Assuming 'wrote' is < 0
                   wrote = wrote < 0 ? 0 : wrote;
                           ^~~~~~~~~
   fs/fs-writeback.c:1894:11: note: '?' condition is true
   fs/fs-writeback.c:1897:7: note: Calling 'need_resched'
--
           ^
   kernel/irq/irqdomain.c:789:6: note: Assuming the condition is true
           if (WARN_ON(type & ~IRQ_TYPE_SENSE_MASK))
               ^
   arch/s390/include/asm/bug.h:54:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(x);                      \
                                ^~~~
   kernel/irq/irqdomain.c:789:6: note: Taking false branch
           if (WARN_ON(type & ~IRQ_TYPE_SENSE_MASK))
               ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   kernel/irq/irqdomain.c:789:6: note: Taking false branch
           if (WARN_ON(type & ~IRQ_TYPE_SENSE_MASK))
               ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   kernel/irq/irqdomain.c:789:2: note: Taking false branch
           if (WARN_ON(type & ~IRQ_TYPE_SENSE_MASK))
           ^
   kernel/irq/irqdomain.c:796:9: note: Calling 'irq_find_mapping'
           virq = irq_find_mapping(domain, hwirq);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqdomain.h:427:6: note: Calling '__irq_resolve_mapping'
           if (__irq_resolve_mapping(domain, hwirq, &irq))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/irqdomain.c:903:6: note: 'domain' is not equal to NULL
           if (domain == NULL)
               ^~~~~~
   kernel/irq/irqdomain.c:903:2: note: Taking false branch
           if (domain == NULL)
           ^
   kernel/irq/irqdomain.c:905:6: note: 'domain' is not equal to NULL
           if (domain == NULL)
               ^~~~~~
   kernel/irq/irqdomain.c:905:2: note: Taking false branch
           if (domain == NULL)
           ^
   kernel/irq/irqdomain.c:908:2: note: Taking false branch
           if (irq_domain_is_nomap(domain)) {
           ^
   kernel/irq/irqdomain.c:920:2: note: Calling 'rcu_read_lock'
           rcu_read_lock();
           ^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:762:2: note: Calling '__rcu_read_lock'
           __rcu_read_lock();
           ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:94:2: note: Calling '__preempt_count_add'
           preempt_disable();
           ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
   kernel/irq/irqdomain.c:618:2: warning: Value stored to 'of_node' is never read [clang-analyzer-deadcode.DeadStores]
           of_node = irq_domain_get_of_node(domain);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/irqdomain.c:618:2: note: Value stored to 'of_node' is never read
           of_node = irq_domain_get_of_node(domain);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   arch/s390/include/asm/preempt.h:107:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count += val;
                                      ^
   kernel/locking/rwsem.c:1319:9: note: Calling '__down_write_common'
           return __down_write_common(sem, TASK_KILLABLE);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:1304:16: note: Calling 'rwsem_write_trylock'
           if (unlikely(!rwsem_write_trylock(sem))) {
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/locking/rwsem.c:261:2: note: Calling '__preempt_count_add'
           preempt_disable();
           ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   kernel/locking/rwsem.c:1122:6: note: Calling 'rwsem_can_spin_on_owner'
           if (rwsem_can_spin_on_owner(sem) && rwsem_optimistic_spin(sem)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:715:6: note: Calling 'need_resched'
           if (need_resched()) {
               ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/locking/lock_events.h:40:3: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   raw_cpu_inc(lockevents[event]);
                   ^
   include/linux/percpu-defs.h:433:27: note: expanded from macro 'raw_cpu_inc'
   #define raw_cpu_inc(pcp)                raw_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_add'
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, pcp, val)
                                           ^
   include/linux/percpu-defs.h:380:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   kernel/locking/rwsem.c:698:9: note: Assuming the condition is true
           while (!(count & (RWSEM_LOCK_MASK|RWSEM_FLAG_HANDOFF))) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:698:2: note: Loop condition is true.  Entering loop body
           while (!(count & (RWSEM_LOCK_MASK|RWSEM_FLAG_HANDOFF))) {
           ^
   kernel/locking/rwsem.c:699:3: note: Taking true branch
                   if (atomic_long_try_cmpxchg_acquire(&sem->count, &count,
                   ^
   kernel/locking/rwsem.c:702:4: note: Calling '__lockevent_inc'
                           lockevent_inc(rwsem_opt_lock);
                           ^
   kernel/locking/lock_events.h:43:29: note: expanded from macro 'lockevent_inc'
   #define lockevent_inc(ev)         __lockevent_inc(LOCKEVENT_ ##ev, true)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lock_events.h:39:6: note: 'cond' is true
           if (cond)
               ^~~~
   kernel/locking/lock_events.h:39:2: note: Taking true branch
           if (cond)
           ^
   kernel/locking/lock_events.h:40:3: note: Loop condition is false.  Exiting loop
                   raw_cpu_inc(lockevents[event]);
                   ^
   include/linux/percpu-defs.h:433:27: note: expanded from macro 'raw_cpu_inc'
   #define raw_cpu_inc(pcp)                raw_cpu_add(pcp, 1)
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
   kernel/locking/lock_events.h:40:3: note: Control jumps to 'case 8:'  at line 40
                   raw_cpu_inc(lockevents[event]);
                   ^
   include/linux/percpu-defs.h:433:27: note: expanded from macro 'raw_cpu_inc'
   #define raw_cpu_inc(pcp)                raw_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_add'
--
                     ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/asm-generic/irq_regs.h:21:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return __this_cpu_read(__irq_regs);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
           case 8: pscr_ret__ = stem##8(variable); break;                  \
                                ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   kernel/time/tick-sched.c:1470:25: note: Calling 'get_irq_regs'
           struct pt_regs *regs = get_irq_regs();
                                  ^~~~~~~~~~~~~~
   include/asm-generic/irq_regs.h:21:9: note: Loop condition is false.  Exiting loop
           return __this_cpu_read(__irq_regs);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_size_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/asm-generic/irq_regs.h:21:9: note: Control jumps to 'case 8:'  at line 21
           return __this_cpu_read(__irq_regs);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:320:2: note: expanded from macro '__pcpu_size_call_return'
           switch(sizeof(variable)) {                                      \
           ^
   include/asm-generic/irq_regs.h:21:9: note: Loop condition is false.  Exiting loop
           return __this_cpu_read(__irq_regs);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
           case 8: pscr_ret__ = stem##8(variable); break;                  \
                                ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:67:3: note: expanded from macro 'raw_cpu_generic_read'
           *raw_cpu_ptr(&(pcp));                                           \
            ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/asm-generic/irq_regs.h:21:9: note: Dereference of null pointer
           return __this_cpu_read(__irq_regs);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
           ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
           case 8: pscr_ret__ = stem##8(variable); break;                  \
                                ^~~~~~~~~~~~~~~~~
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
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   kernel/time/tick-sched.c:1051:6: note: Assuming the condition is false
           if (unlikely(!cpu_online(cpu))) {
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/tick-sched.c:1051:2: note: Taking false branch
           if (unlikely(!cpu_online(cpu))) {
           ^
   kernel/time/tick-sched.c:1062:15: note: Assuming field 'nohz_mode' is not equal to NOHZ_MODE_INACTIVE
           if (unlikely(ts->nohz_mode == NOHZ_MODE_INACTIVE))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/time/tick-sched.c:1062:2: note: Taking false branch
           if (unlikely(ts->nohz_mode == NOHZ_MODE_INACTIVE))
           ^
   kernel/time/tick-sched.c:1065:6: note: Calling 'need_resched'
           if (need_resched())
               ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/time/tick-sched.c:176:12: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           int cpu = smp_processor_id();
                     ^
   include/linux/smp.h:264:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_id'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/tick-sched.c:176:12: note: Dereference of null pointer
           int cpu = smp_processor_id();
                     ^
   include/linux/smp.h:264:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_id'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/tick-sched.c:233:20: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   if (is_idle_task(current))
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/time/tick-sched.c:231:6: note: Assuming field 'tick_stopped' is not equal to 0
           if (ts->tick_stopped) {
               ^~~~~~~~~~~~~~~~
   kernel/time/tick-sched.c:231:2: note: Taking true branch
           if (ts->tick_stopped) {
           ^
   kernel/time/tick-sched.c:233:20: note: Dereference of null pointer
                   if (is_idle_task(current))
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/time/tick-sched.c:605:26: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
--
           ^
   include/linux/sched.h:214:3: note: expanded from macro '__set_current_state'
                   WRITE_ONCE(current->__state, (state_value));            \
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:362:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:350:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   kernel/rcu/update.c:413:2: note: Dereference of null pointer
           __set_current_state(TASK_RUNNING);
           ^
   include/linux/sched.h:214:14: note: expanded from macro '__set_current_state'
                   WRITE_ONCE(current->__state, (state_value));            \
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ~~~~~~~~~~~~~^~~~~~~
   include/asm-generic/rwonce.h:55:27: note: expanded from macro '__WRITE_ONCE'
           *(volatile typeof(x) *)&(x) = (val);                            \
                                    ^
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   ipc/ipc_sysctl.c:185:10: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return &current->nsproxy->ipc_ns->ipc_set;
                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   ipc/ipc_sysctl.c:185:10: note: Dereference of null pointer
           return &current->nsproxy->ipc_ns->ipc_set;
                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   ipc/ipc_sysctl.c:190:10: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return &current->nsproxy->ipc_ns->ipc_set == set;
                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   ipc/ipc_sysctl.c:190:10: note: Dereference of null pointer
           return &current->nsproxy->ipc_ns->ipc_set == set;
                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   ipc/ipc_sysctl.c:198:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           struct ipc_namespace *ns = current->nsproxy->ipc_ns;
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   ipc/ipc_sysctl.c:198:29: note: Dereference of null pointer
           struct ipc_namespace *ns = current->nsproxy->ipc_ns;
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   security/keys/gc.c:189:2: note: Taking false branch
           kenter("[%lx,%x]", key_gc_flags, gc_state);
           ^
   security/keys/internal.h:34:2: note: expanded from macro 'kenter'
           no_printk(KERN_DEBUG "==> %s("FMT")\n", __func__, ##__VA_ARGS__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   security/keys/gc.c:192:6: note: Assuming 'limit' is <= 'key_gc_delay'
           if (limit > key_gc_delay)
               ^~~~~~~~~~~~~~~~~~~~
   security/keys/gc.c:192:2: note: Taking false branch
           if (limit > key_gc_delay)
           ^
   security/keys/gc.c:200:6: note: Assuming the condition is false
           if (test_and_clear_bit(KEY_GC_KEY_EXPIRED, &key_gc_flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/gc.c:200:2: note: Taking false branch
           if (test_and_clear_bit(KEY_GC_KEY_EXPIRED, &key_gc_flags))
           ^
   security/keys/gc.c:203:6: note: Assuming the condition is false
           if (test_and_clear_bit(KEY_GC_REAP_KEYTYPE, &key_gc_flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/gc.c:203:2: note: Taking false branch
           if (test_and_clear_bit(KEY_GC_REAP_KEYTYPE, &key_gc_flags))
           ^
   security/keys/gc.c:205:2: note: Taking false branch
           kdebug("new pass %x", gc_state);
           ^
   security/keys/internal.h:38:2: note: expanded from macro 'kdebug'
           no_printk(KERN_DEBUG FMT"\n", ##__VA_ARGS__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   security/keys/gc.c:217:2: note: Loop condition is true.  Entering loop body
           while (cursor) {
           ^
   security/keys/gc.c:221:7: note: Assuming the condition is false
                   if (refcount_read(&key->usage) == 0)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/gc.c:221:3: note: Taking false branch
                   if (refcount_read(&key->usage) == 0)
                   ^
   security/keys/gc.c:224:3: note: Taking false branch
                   if (unlikely(gc_state & KEY_GC_REAPING_DEAD_1)) {
                   ^
   security/keys/gc.c:236:3: note: Taking false branch
                   if (gc_state & KEY_GC_SET_TIMER) {
                   ^
   security/keys/gc.c:244:3: note: Taking false branch
                   if (unlikely(gc_state & KEY_GC_REAPING_DEAD_2))
                   ^
   security/keys/gc.c:248:7: note: Left side of '||' is false
                   if ((gc_state & KEY_GC_REAPING_LINKS) ||
                       ^
   security/keys/gc.c:248:3: note: Taking false branch
                   if ((gc_state & KEY_GC_REAPING_LINKS) ||
                   ^
   security/keys/gc.c:254:3: note: Taking false branch
                   if (unlikely(gc_state & KEY_GC_REAPING_DEAD_3))
                   ^
   security/keys/gc.c:259:7: note: Left side of '||' is false
                   if (spin_is_contended(&key_serial_lock) || need_resched())
                       ^
   security/keys/gc.c:259:46: note: Calling 'need_resched'
                   if (spin_is_contended(&key_serial_lock) || need_resched())
                                                              ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
--
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:380:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/s390/include/asm/percpu.h:32:2: note: expanded from macro 'arch_this_cpu_to_op_simple'
           preempt_disable_notrace();                                      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:256:2: note: expanded from macro 'preempt_disable_notrace'
           __preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:193:31: note: expanded from macro '__preempt_count_inc'
   #define __preempt_count_inc() __preempt_count_add(1)
                                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
   fs/drop_caches.c:71:5: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                   current->comm, task_pid_nr(current),
                                   ^
   include/linux/printk.h:530:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/drop_caches.c:56:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   fs/drop_caches.c:56:2: note: Taking false branch
           if (ret)
           ^
   fs/drop_caches.c:58:6: note: Assuming 'write' is not equal to 0
           if (write) {
               ^~~~~
   fs/drop_caches.c:58:2: note: Taking true branch
           if (write) {
           ^
   fs/drop_caches.c:61:7: note: Assuming the condition is false
                   if (sysctl_drop_caches & 1) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   fs/drop_caches.c:61:3: note: Taking false branch
                   if (sysctl_drop_caches & 1) {
                   ^
   fs/drop_caches.c:65:7: note: Assuming the condition is false
                   if (sysctl_drop_caches & 2) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   fs/drop_caches.c:65:3: note: Taking false branch
                   if (sysctl_drop_caches & 2) {
                   ^
   fs/drop_caches.c:69:8: note: 'stfu' is 0
                   if (!stfu) {
                        ^~~~
   fs/drop_caches.c:69:3: note: Taking true branch
                   if (!stfu) {
                   ^
   fs/drop_caches.c:70:4: note: Loop condition is false.  Exiting loop
                           pr_info("%s (%d): drop_caches: %d\n",
                           ^
   include/linux/printk.h:530:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:403:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   fs/drop_caches.c:71:5: note: Dereference of null pointer
                                   current->comm, task_pid_nr(current),
                                   ^
   include/linux/printk.h:530:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   fs/drop_caches.c:23:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(inode, &sb->s_inodes, i_sb_list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_entry'
           for (pos = list_first_entry(head, typeof(*pos), member);        \
           ^
   fs/drop_caches.c:30:8: note: Assuming the condition is false
                   if ((inode->i_state & (I_FREEING|I_WILL_FREE|I_NEW)) ||
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/drop_caches.c:30:7: note: Left side of '||' is false
                   if ((inode->i_state & (I_FREEING|I_WILL_FREE|I_NEW)) ||
                       ^
   fs/drop_caches.c:31:8: note: Left side of '&&' is true
                       (mapping_empty(inode->i_mapping) && !need_resched())) {
                        ^
   fs/drop_caches.c:31:44: note: Calling 'need_resched'
                       (mapping_empty(inode->i_mapping) && !need_resched())) {
                                                            ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/cramfs/inode.c:273:25: warning: Value stored to 'sbi' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct cramfs_sb_info *sbi = CRAMFS_SB(sb);
                                  ^~~   ~~~~~~~~~~~~~
   fs/cramfs/inode.c:273:25: note: Value stored to 'sbi' during its initialization is never read
           struct cramfs_sb_info *sbi = CRAMFS_SB(sb);
                                  ^~~   ~~~~~~~~~~~~~
   fs/cramfs/inode.c:365:2: warning: Value stored to 'bailout_reason' is never read [clang-analyzer-deadcode.DeadStores]
           bailout_reason = "vma is writable";
           ^                ~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:365:2: note: Value stored to 'bailout_reason' is never read
           bailout_reason = "vma is writable";
           ^                ~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:370:2: warning: Value stored to 'bailout_reason' is never read [clang-analyzer-deadcode.DeadStores]
           bailout_reason = "beyond file limit";
           ^                ~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:370:2: note: Value stored to 'bailout_reason' is never read
           bailout_reason = "beyond file limit";
           ^                ~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:376:2: warning: Value stored to 'bailout_reason' is never read [clang-analyzer-deadcode.DeadStores]
           bailout_reason = "unsuitable block layout";
           ^                ~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:376:2: note: Value stored to 'bailout_reason' is never read
           bailout_reason = "unsuitable block layout";
           ^                ~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:380:2: warning: Value stored to 'bailout_reason' is never read [clang-analyzer-deadcode.DeadStores]
           bailout_reason = "data is not page aligned";
           ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:380:2: note: Value stored to 'bailout_reason' is never read
           bailout_reason = "data is not page aligned";
           ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:391:3: warning: Value stored to 'bailout_reason' is never read [clang-analyzer-deadcode.DeadStores]
                   bailout_reason = "no suitable block remaining";
                   ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cramfs/inode.c:391:3: note: Value stored to 'bailout_reason' is never read
                   bailout_reason = "no suitable block remaining";
                   ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
--
                        ^
   kernel/entry/syscall_user_dispatch.c:36:38: note: Dereference of null pointer
           struct syscall_user_dispatch *sd = &current->syscall_dispatch;
                                               ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/entry/syscall_user_dispatch.c:97:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           current->syscall_dispatch.selector = selector;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/entry/syscall_user_dispatch.c:74:2: note: Control jumps to 'case 1:'  at line 79
           switch (mode) {
           ^
   kernel/entry/syscall_user_dispatch.c:86:7: note: Assuming 'offset' is 0
                   if (offset && offset + len <= offset)
                       ^~~~~~
   kernel/entry/syscall_user_dispatch.c:86:14: note: Left side of '&&' is false
                   if (offset && offset + len <= offset)
                              ^
   kernel/entry/syscall_user_dispatch.c:89:7: note: Assuming 'selector' is null
                   if (selector && !access_ok(selector, sizeof(*selector)))
                       ^~~~~~~~
   kernel/entry/syscall_user_dispatch.c:89:16: note: Left side of '&&' is false
                   if (selector && !access_ok(selector, sizeof(*selector)))
                                ^
   kernel/entry/syscall_user_dispatch.c:92:3: note:  Execution continues on line 97
                   break;
                   ^
   kernel/entry/syscall_user_dispatch.c:97:2: note: Dereference of null pointer
           current->syscall_dispatch.selector = selector;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   24 warnings generated.
   arch/s390/include/asm/preempt.h:107:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count += val;
                                      ^
   block/blk-mq-sched.c:473:2: note: Calling 'percpu_ref_get'
           percpu_ref_get(&q->q_usage_counter);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-refcount.h:222:2: note: Calling 'percpu_ref_get_many'
           percpu_ref_get_many(ref, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-refcount.h:202:2: note: Calling 'rcu_read_lock'
           rcu_read_lock();
           ^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:762:2: note: Calling '__rcu_read_lock'
           __rcu_read_lock();
           ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:94:2: note: Calling '__preempt_count_add'
           preempt_disable();
           ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
   block/blk-mq.h:147:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return __blk_mq_get_ctx(q, raw_smp_processor_id());
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   block/blk-mq-sched.c:354:6: note: Assuming 'e' is null
           if (e && e->type->ops.bio_merge) {
               ^
   block/blk-mq-sched.c:354:8: note: Left side of '&&' is false
           if (e && e->type->ops.bio_merge) {
                 ^
   block/blk-mq-sched.c:359:8: note: Calling 'blk_mq_get_ctx'
           ctx = blk_mq_get_ctx(q);
                 ^~~~~~~~~~~~~~~~~
   block/blk-mq.h:147:29: note: Dereference of null pointer
           return __blk_mq_get_ctx(q, raw_smp_processor_id());
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   block/blk-mq-sched.c:330:15: note: Assuming the condition is false
           if (unlikely(blk_mq_hctx_stopped(hctx) || blk_queue_quiesced(q)))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   block/blk-mq-sched.c:330:15: note: Left side of '||' is false
           if (unlikely(blk_mq_hctx_stopped(hctx) || blk_queue_quiesced(q)))
                        ^
   block/blk-mq-sched.c:330:44: note: Left side of '&&' is true
           if (unlikely(blk_mq_hctx_stopped(hctx) || blk_queue_quiesced(q)))
                                                     ^
   include/linux/blkdev.h:609:31: note: expanded from macro 'blk_queue_quiesced'
   #define blk_queue_quiesced(q)   test_bit(QUEUE_FLAG_QUIESCED, &(q)->queue_flags)
                                   ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   block/blk-mq-sched.c:330:44: note: Assuming the condition is true
           if (unlikely(blk_mq_hctx_stopped(hctx) || blk_queue_quiesced(q)))
                                                     ^
   include/linux/blkdev.h:609:31: note: expanded from macro 'blk_queue_quiesced'
   #define blk_queue_quiesced(q)   test_bit(QUEUE_FLAG_QUIESCED, &(q)->queue_flags)
                                   ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:25: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                  ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   block/blk-mq-sched.c:330:44: note: Left side of '&&' is false
           if (unlikely(blk_mq_hctx_stopped(hctx) || blk_queue_quiesced(q)))
                                                     ^
   include/linux/blkdev.h:609:31: note: expanded from macro 'blk_queue_quiesced'
   #define blk_queue_quiesced(q)   test_bit(QUEUE_FLAG_QUIESCED, &(q)->queue_flags)
                                   ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                                                        ^
   block/blk-mq-sched.c:330:6: note: Assuming the condition is true
           if (unlikely(blk_mq_hctx_stopped(hctx) || blk_queue_quiesced(q)))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   block/blk-mq-sched.c:330:2: note: Taking false branch
           if (unlikely(blk_mq_hctx_stopped(hctx) || blk_queue_quiesced(q)))
           ^
   block/blk-mq-sched.c:339:6: note: Calling '__blk_mq_sched_dispatch_requests'
           if (__blk_mq_sched_dispatch_requests(hctx) == -EAGAIN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq-sched.c:284:2: note: Taking true branch
           if (!list_empty_careful(&hctx->dispatch)) {
           ^
   block/blk-mq-sched.c:286:7: note: Assuming the condition is false
                   if (!list_empty(&hctx->dispatch))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq-sched.c:286:3: note: Taking false branch
                   if (!list_empty(&hctx->dispatch))
                   ^
   block/blk-mq-sched.c:304:2: note: Taking false branch
           if (!list_empty(&rq_list)) {
           ^
   block/blk-mq-sched.c:312:13: note: Assuming 'has_sched' is true
           } else if (has_sched) {
                      ^~~~~~~~~
   block/blk-mq-sched.c:312:9: note: Taking true branch
           } else if (has_sched) {
                  ^
   block/blk-mq-sched.c:313:9: note: Calling 'blk_mq_do_dispatch_sched'
                   ret = blk_mq_do_dispatch_sched(hctx);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq-sched.c:188:7: note: Assuming 'ret' is equal to 1
                   if (ret != 1)
                       ^~~~~~~~
   block/blk-mq-sched.c:188:3: note: Taking false branch
                   if (ret != 1)
                   ^
   block/blk-mq-sched.c:190:7: note: Calling 'need_resched'
                   if (need_resched() || time_is_before_jiffies(end)) {
--
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:329:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   arch/s390/include/asm/preempt.h:84:9: note: Left side of '||' is true
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:330:28: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                     ^
   arch/s390/include/asm/preempt.h:84:9: note: Taking false branch
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:362:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:350:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:342:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   arch/s390/include/asm/preempt.h:84:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:362:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:350:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   arch/s390/include/asm/preempt.h:84:9: note: Dereference of null pointer
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count += val;
                                      ^
   kernel/sched/core.c:563:2: note: Calling '__preempt_count_add'
           preempt_disable();
           ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
   arch/s390/include/asm/preempt.h:112:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count -= val;
                                      ^
   kernel/sched/core.c:6697:2: note: Calling '__preempt_count_sub'
           sched_preempt_enable_no_resched();
           ^
   include/linux/preempt.h:210:2: note: expanded from macro 'sched_preempt_enable_no_resched'
           preempt_count_dec(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:197:29: note: expanded from macro 'preempt_count_dec'
   #define preempt_count_dec() preempt_count_sub(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:189:32: note: expanded from macro 'preempt_count_sub'
   #define preempt_count_sub(val)  __preempt_count_sub(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:112:29: note: Dereference of null pointer
           S390_lowcore.preempt_count -= val;
                                      ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   kernel/sched/core.c:1164:65: note: Loop condition is false.  Exiting loop
           flags = atomic_fetch_andnot(NOHZ_KICK_MASK | NOHZ_NEWILB_KICK, nohz_flags(cpu));
                                                                          ^
   kernel/sched/sched.h:2807:27: note: expanded from macro 'nohz_flags'
   #define nohz_flags(cpu) (&cpu_rq(cpu)->nohz_flags)
                             ^
   kernel/sched/sched.h:1205:24: note: expanded from macro 'cpu_rq'
   #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
                                     ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^
   include/linux/percpu-defs.h:235:2: note: expanded from macro 'per_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/sched/core.c:1165:10: note: Assuming the condition is false
           WARN_ON(!(flags & NOHZ_KICK_MASK));
                   ^
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(x);                      \
                                  ^
   kernel/sched/core.c:1165:2: note: Taking false branch
           WARN_ON(!(flags & NOHZ_KICK_MASK));
           ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   kernel/sched/core.c:1165:2: note: Taking false branch
           WARN_ON(!(flags & NOHZ_KICK_MASK));
           ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   kernel/sched/core.c:1168:10: note: Field 'idle_balance' is 1
           if (rq->idle_balance && !need_resched()) {
                   ^
   kernel/sched/core.c:1168:6: note: Left side of '&&' is true
           if (rq->idle_balance && !need_resched()) {
               ^
   kernel/sched/core.c:1168:27: note: Calling 'need_resched'
           if (rq->idle_balance && !need_resched()) {
                                    ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/trace/events/sched.h:178:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   DEFINE_EVENT(sched_wakeup_template, sched_wakeup,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   kernel/sched/core.c:3893:18: note: Loop condition is false.  Exiting loop
           struct rq *rq = cpu_rq(cpu);
                           ^
   kernel/sched/sched.h:1205:24: note: expanded from macro 'cpu_rq'
   #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
                                     ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^
   include/linux/percpu-defs.h:235:2: note: expanded from macro 'per_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
--
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/clk/imx/clk-pll14xx.c:168:2: warning: Value stored to 'pll_div_ctl1' is never read [clang-analyzer-deadcode.DeadStores]
           pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
           ^
   drivers/clk/imx/clk-pll14xx.c:168:2: note: Value stored to 'pll_div_ctl1' is never read
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   33 warnings generated.
   arch/s390/include/asm/pgtable.h:1278:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (!MACHINE_HAS_NX)
                ^
   arch/s390/include/asm/setup.h:94:26: note: expanded from macro 'MACHINE_HAS_NX'
   #define MACHINE_HAS_NX          (S390_lowcore.machine_flags & MACHINE_FLAG_NX)
                                    ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/memory.c:4285:18: note: Assuming 'addr' is equal to field 'address'
           bool prefault = vmf->address != addr;
                           ^~~~~~~~~~~~~~~~~~~~
   mm/memory.c:4289:10: note: Calling 'mk_pte'
           entry = mk_pte(page, vma->vm_page_prot);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgtable.h:1286:16: note: Calling 'mk_pte_phys'
           pte_t __pte = mk_pte_phys(physpage, pgprot);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgtable.h:1278:7: note: Dereference of null pointer
           if (!MACHINE_HAS_NX)
                ^
   arch/s390/include/asm/setup.h:94:26: note: expanded from macro 'MACHINE_HAS_NX'
   #define MACHINE_HAS_NX          (S390_lowcore.machine_flags & MACHINE_FLAG_NX)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/include/asm/preempt.h:107:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count += val;
                                      ^
   mm/memory.c:5804:14: note: Assuming 'i' is < 'pages_per_huge_page'
           for (i = 0; i < pages_per_huge_page; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:5804:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < pages_per_huge_page; i++) {
           ^
   mm/memory.c:5806:7: note: Assuming 'allow_pagefault' is false
                   if (allow_pagefault)
                       ^~~~~~~~~~~~~~~
   mm/memory.c:5806:3: note: Taking false branch
                   if (allow_pagefault)
                   ^
   mm/memory.c:5809:17: note: Calling 'kmap_atomic'
                           page_kaddr = kmap_atomic(subpage);
                                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/highmem-internal.h:209:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_PREEMPT_RT))
           ^
   include/linux/highmem-internal.h:212:3: note: Calling '__preempt_count_add'
                   preempt_disable();
                   ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   mm/memory.c:1576:10: note: Assuming the condition is false
                   next = p4d_addr_end(addr, end);
                          ^
   include/linux/pgtable.h:837:3: note: expanded from macro 'p4d_addr_end'
           (__boundary - 1 < (end) - 1)? __boundary: (end);                \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:1576:10: note: '?' condition is false
                   next = p4d_addr_end(addr, end);
                          ^
   include/linux/pgtable.h:837:2: note: expanded from macro 'p4d_addr_end'
           (__boundary - 1 < (end) - 1)? __boundary: (end);                \
           ^
   mm/memory.c:1577:3: note: Taking false branch
                   if (p4d_none_or_clear_bad(p4d))
                   ^
   mm/memory.c:1579:10: note: Calling 'zap_pud_range'
                   next = zap_pud_range(tlb, vma, p4d, addr, next, details);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:1547:10: note: Assuming the condition is false
                   next = pud_addr_end(addr, end);
                          ^
   include/linux/pgtable.h:844:3: note: expanded from macro 'pud_addr_end'
           (__boundary - 1 < (end) - 1)? __boundary: (end);                \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:1547:10: note: '?' condition is false
                   next = pud_addr_end(addr, end);
                          ^
   include/linux/pgtable.h:844:2: note: expanded from macro 'pud_addr_end'
           (__boundary - 1 < (end) - 1)? __boundary: (end);                \
           ^
   mm/memory.c:1548:7: note: Left side of '||' is false
                   if (pud_trans_huge(*pud) || pud_devmap(*pud)) {
                       ^
   mm/memory.c:1548:3: note: Taking false branch
                   if (pud_trans_huge(*pud) || pud_devmap(*pud)) {
                   ^
   mm/memory.c:1556:3: note: Taking false branch
                   if (pud_none_or_clear_bad(pud))
                   ^
   mm/memory.c:1558:10: note: Calling 'zap_pmd_range'
                   next = zap_pmd_range(tlb, vma, pud, addr, next, details);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:1501:10: note: Assuming the condition is false
                   next = pmd_addr_end(addr, end);
                          ^
   include/linux/pgtable.h:851:3: note: expanded from macro 'pmd_addr_end'
           (__boundary - 1 < (end) - 1)? __boundary: (end);                \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:1501:10: note: '?' condition is false
                   next = pmd_addr_end(addr, end);
                          ^
   include/linux/pgtable.h:851:2: note: expanded from macro 'pmd_addr_end'
           (__boundary - 1 < (end) - 1)? __boundary: (end);                \
           ^
   mm/memory.c:1502:7: note: Left side of '||' is false
                   if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd)) {
                       ^
   mm/memory.c:1502:28: note: Assuming the condition is false
                   if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd)) {
                                            ^~~~~~~~~~~~~~~~~~~~
   mm/memory.c:1502:7: note: Left side of '||' is false
                   if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd)) {
                       ^
   mm/memory.c:1502:3: note: Taking false branch
                   if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd)) {
                   ^
   mm/memory.c:1508:14: note: Assuming 'details' is null
                   } else if (details && details->single_folio &&
                              ^~~~~~~
   mm/memory.c:1508:22: note: Left side of '&&' is false
                   } else if (details && details->single_folio &&
                                      ^
   mm/memory.c:1527:3: note: Taking false branch
                   if (pmd_none_or_trans_huge_or_clear_bad(pmd))
                   ^
   mm/memory.c:1529:10: note: Calling 'zap_pte_range'
                   next = zap_pte_range(tlb, vma, pmd, addr, next, details);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:1365:2: note: Loop condition is false.  Exiting loop
           arch_enter_lazy_mmu_mode();
           ^
   include/linux/pgtable.h:1047:36: note: expanded from macro 'arch_enter_lazy_mmu_mode'
   #define arch_enter_lazy_mmu_mode()      do {} while (0)
                                           ^
   mm/memory.c:1370:3: note: Taking false branch
                   if (pte_none(ptent))
                   ^
   mm/memory.c:1373:7: note: Calling 'need_resched'
                   if (need_resched())
--
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dcache.c:2846:3: note: Taking false branch
                   if (alias->d_parent != entry->d_parent)
                   ^
   fs/dcache.c:2848:3: note: Taking false branch
                   if (!d_same_name(alias, entry->d_parent, &entry->d_name))
                   ^
   fs/dcache.c:2851:3: note: Taking false branch
                   if (!d_unhashed(alias)) {
                   ^
   fs/dcache.c:2856:4: note: Calling '__d_rehash'
                           __d_rehash(alias);
                           ^~~~~~~~~~~~~~~~~
   fs/dcache.c:2580:2: note: Calling 'hlist_bl_unlock'
           hlist_bl_unlock(b);
           ^~~~~~~~~~~~~~~~~~
   include/linux/list_bl.h:153:2: note: Calling '__bit_spin_unlock'
           __bit_spin_unlock(0, (unsigned long *)b);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bit_spinlock.h:77:10: note: Left side of '&&' is false
           BUG_ON(!test_bit(bitnum, addr));
                   ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:29: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
                                      ^
   include/linux/bit_spinlock.h:77:9: note: Assuming the condition is false
           BUG_ON(!test_bit(bitnum, addr));
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/bit_spinlock.h:77:2: note: Taking false branch
           BUG_ON(!test_bit(bitnum, addr));
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   include/linux/bit_spinlock.h:77:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!test_bit(bitnum, addr));
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   include/linux/bit_spinlock.h:82:2: note: Calling '__preempt_count_sub'
           preempt_enable();
           ^
   include/linux/preempt.h:242:2: note: expanded from macro 'preempt_enable'
           preempt_count_dec(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:197:29: note: expanded from macro 'preempt_count_dec'
   #define preempt_count_dec() preempt_count_sub(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:189:32: note: expanded from macro 'preempt_count_sub'
   #define preempt_count_sub(val)  __preempt_count_sub(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:112:29: note: Dereference of null pointer
           S390_lowcore.preempt_count -= val;
                                      ^
   fs/dcache.c:2620:27: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   DECLARE_WAITQUEUE(wait, current);
                                           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name = __WAITQUEUE_INITIALIZER(name, tsk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITIALIZER'
           .private        = tsk,                                                  \
                             ^~~
   fs/dcache.c:2619:6: note: Assuming the condition is true
           if (d_in_lookup(dentry)) {
               ^~~~~~~~~~~~~~~~~~~
   fs/dcache.c:2619:2: note: Taking true branch
           if (d_in_lookup(dentry)) {
           ^
   fs/dcache.c:2620:27: note: Dereference of null pointer
                   DECLARE_WAITQUEUE(wait, current);
                                           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name = __WAITQUEUE_INITIALIZER(name, tsk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITIALIZER'
           .private        = tsk,                                                  \
                             ^~~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   fs/dcache.c:1558:6: note: Assuming 'dentry' is not equal to field 'start'
           if (data->start == dentry)
               ^~~~~~~~~~~~~~~~~~~~~
   fs/dcache.c:1558:2: note: Taking false branch
           if (data->start == dentry)
           ^
   fs/dcache.c:1561:6: note: Assuming the condition is true
           if (dentry->d_flags & DCACHE_SHRINK_LIST) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dcache.c:1561:2: note: Taking true branch
           if (dentry->d_flags & DCACHE_SHRINK_LIST) {
           ^
   fs/dcache.c:1576:6: note: Assuming the condition is true
           if (!list_empty(&data->dispose))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dcache.c:1576:2: note: Taking true branch
           if (!list_empty(&data->dispose))
           ^
   fs/dcache.c:1577:9: note: Calling 'need_resched'
                   ret = need_resched() ? D_WALK_QUIT : D_WALK_NORETRY;
                         ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/mfd/ti_am335x_tscadc.c:46:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           DEFINE_WAIT(wait);
           ^
   include/linux/wait.h:1208:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_function)
                             ^
   include/linux/wait.h:1203:14: note: expanded from macro 'DEFINE_WAIT_FUNC'
                   .private        = current,                                      \
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/mfd/ti_am335x_tscadc.c:75:2: note: Calling 'am335x_tscadc_need_adc'
           am335x_tscadc_need_adc(tscadc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/ti_am335x_tscadc.c:46:2: note: Dereference of null pointer
           DEFINE_WAIT(wait);
           ^
   include/linux/wait.h:1208:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_function)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/wait.h:1203:14: note: expanded from macro 'DEFINE_WAIT_FUNC'
                   .private        = current,                                      \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/mfd/wm831x-irq.c:520:19: warning: The result of the left shift is undefined due to shifting by '4294967295', which is greater or equal to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           while (ret & 1 << (i - WM831X_IRQ_GPIO_1)) {
--
                        ^
   drivers/tty/n_tty.c:2322:2: note: Dereference of null pointer
           DEFINE_WAIT_FUNC(wait, woken_wake_function);
           ^
   include/linux/wait.h:1203:14: note: expanded from macro 'DEFINE_WAIT_FUNC'
                   .private        = current,                                      \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   67 warnings generated.
   arch/s390/include/asm/preempt.h:107:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count += val;
                                      ^
   kernel/sched/fair.c:11353:2: note: Calling 'rcu_read_lock'
           rcu_read_lock();
           ^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:762:2: note: Calling '__rcu_read_lock'
           __rcu_read_lock();
           ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:94:2: note: Calling '__preempt_count_add'
           preempt_disable();
           ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
   include/linux/math64.h:28:24: warning: Division by zero [clang-analyzer-core.DivideZero]
           *remainder = dividend % divisor;
                                 ^
   kernel/sched/fair.c:12150:2: note: Calling 'attach_task_cfs_rq'
           attach_task_cfs_rq(p);
           ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12137:2: note: Calling 'attach_entity_cfs_rq'
           attach_entity_cfs_rq(se);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12109:30: note: '?' condition is true
           update_load_avg(cfs_rq, se, sched_feat(ATTACH_AGE_LOAD) ? 0 : SKIP_AGE_LOAD);
                                       ^
   kernel/sched/sched.h:2052:23: note: expanded from macro 'sched_feat'
   #define sched_feat(x) !!(sysctl_sched_features & (1UL << __SCHED_FEAT_##x))
                         ^
   kernel/sched/fair.c:12110:2: note: Calling 'attach_entity_load_avg'
           attach_entity_load_avg(cfs_rq, se);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4128:6: note: Assuming the condition is true
           if (se_weight(se) < se->avg.load_sum)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4128:2: note: Taking true branch
           if (se_weight(se) < se->avg.load_sum)
           ^
   kernel/sched/fair.c:4129:48: note: Calling 'se_weight'
                   se->avg.load_sum = div_u64(se->avg.load_sum, se_weight(se));
                                                                ^~~~~~~~~~~~~
   kernel/sched/sched.h:798:9: note: '__w' is 0
           return scale_load_down(se->load.weight);
                  ^
   kernel/sched/sched.h:148:6: note: expanded from macro 'scale_load_down'
           if (__w) \
               ^~~
   kernel/sched/sched.h:798:9: note: Taking false branch
           return scale_load_down(se->load.weight);
                  ^
   kernel/sched/sched.h:148:2: note: expanded from macro 'scale_load_down'
           if (__w) \
           ^
   kernel/sched/sched.h:798:2: note: Returning zero
           return scale_load_down(se->load.weight);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4129:48: note: Returning from 'se_weight'
                   se->avg.load_sum = div_u64(se->avg.load_sum, se_weight(se));
                                                                ^~~~~~~~~~~~~
   kernel/sched/fair.c:4129:48: note: Passing the value 0 via 2nd parameter 'divisor'
                   se->avg.load_sum = div_u64(se->avg.load_sum, se_weight(se));
                                                                ^~~~~~~~~~~~~
   kernel/sched/fair.c:4129:22: note: Calling 'div_u64'
                   se->avg.load_sum = div_u64(se->avg.load_sum, se_weight(se));
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:130:31: note: Passing the value 0 via 2nd parameter 'divisor'
           return div_u64_rem(dividend, divisor, &remainder);
                                        ^~~~~~~
   include/linux/math64.h:130:9: note: Calling 'div_u64_rem'
           return div_u64_rem(dividend, divisor, &remainder);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:28:24: note: Division by zero
           *remainder = dividend % divisor;
                        ~~~~~~~~~^~~~~~~~~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   kernel/sched/fair.c:11577:48: note: Loop condition is false.  Exiting loop
           flags = atomic_fetch_andnot(NOHZ_NEWILB_KICK, nohz_flags(cpu));
                                                         ^
   kernel/sched/sched.h:2807:27: note: expanded from macro 'nohz_flags'
   #define nohz_flags(cpu) (&cpu_rq(cpu)->nohz_flags)
                             ^
   kernel/sched/sched.h:1205:24: note: expanded from macro 'cpu_rq'
   #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
                                     ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^
   include/linux/percpu-defs.h:235:2: note: expanded from macro 'per_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/sched/fair.c:11583:7: note: Assuming the condition is true
           if ((flags == NOHZ_NEWILB_KICK) && !need_resched())
                ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11583:6: note: Left side of '&&' is true
           if ((flags == NOHZ_NEWILB_KICK) && !need_resched())
               ^
   kernel/sched/fair.c:11583:38: note: Calling 'need_resched'
           if ((flags == NOHZ_NEWILB_KICK) && !need_resched())
                                               ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/trace/events/sched.h:520:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   DEFINE_EVENT(sched_stat_runtime, sched_stat_runtime,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   kernel/sched/fair.c:11945:2: note: Loop condition is true.  Entering loop body
           for_each_sched_entity(se) {
           ^
   kernel/sched/fair.c:528:3: note: expanded from macro 'for_each_sched_entity'
                   for (; se; se = NULL)
                   ^
   kernel/sched/fair.c:11947:3: note: Calling 'entity_tick'
                   entity_tick(cfs_rq, se, queued);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5058:2: note: Calling 'update_curr'
           update_curr(cfs_rq);
           ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:903:15: note: Assuming 'curr' is non-null
           if (unlikely(!curr))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/sched/fair.c:903:2: note: Taking false branch
           if (unlikely(!curr))
           ^
   kernel/sched/fair.c:907:15: note: Assuming 'delta_exec' is > 0
           if (unlikely((s64)delta_exec <= 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/sched/fair.c:907:2: note: Taking false branch
           if (unlikely((s64)delta_exec <= 0))
           ^
   kernel/sched/fair.c:912:6: note: Left side of '&&' is false
           if (schedstat_enabled()) {
--
                              VFSUIDT_INIT(current_fsuid()));
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
   include/linux/mnt_idmapping.h:394:20: note: Dereference of null pointer
                              VFSUIDT_INIT(current_fsuid()));
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
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/rcupdate.h:664:31: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
                                        ^
   include/linux/rcupdate.h:462:35: note: expanded from macro '__rcu_dereference_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   include/linux/mnt_idmapping.h:103:50: note: expanded from macro 'VFSUIDT_INIT'
   #define VFSUIDT_INIT(val) (vfsuid_t){ __kuid_val(val) }
                                                    ^~~
   include/linux/swap.h:39:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return current->flags & PF_KSWAPD;
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/inode.c:825:6: note: Assuming the condition is false
           if (!spin_trylock(&inode->i_lock))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:825:2: note: Taking false branch
           if (!spin_trylock(&inode->i_lock))
           ^
   fs/inode.c:834:6: note: Assuming the condition is false
           if (atomic_read(&inode->i_count) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:834:6: note: Left side of '||' is false
   fs/inode.c:835:7: note: Assuming the condition is false
               (inode->i_state & ~I_REFERENCED) ||
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:834:6: note: Left side of '||' is false
           if (atomic_read(&inode->i_count) ||
               ^
   fs/inode.c:834:2: note: Taking false branch
           if (atomic_read(&inode->i_count) ||
           ^
   fs/inode.c:844:6: note: Assuming the condition is false
           if (inode->i_state & I_REFERENCED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:844:2: note: Taking false branch
           if (inode->i_state & I_REFERENCED) {
           ^
   fs/inode.c:855:6: note: Assuming the condition is true
           if (inode_has_buffers(inode) || !mapping_empty(&inode->i_data)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:855:31: note: Left side of '||' is true
           if (inode_has_buffers(inode) || !mapping_empty(&inode->i_data)) {
                                        ^
   fs/inode.c:859:7: note: Assuming the condition is true
                   if (remove_inode_buffers(inode)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:859:3: note: Taking true branch
                   if (remove_inode_buffers(inode)) {
                   ^
   fs/inode.c:862:8: note: Calling 'current_is_kswapd'
                           if (current_is_kswapd())
                               ^~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:39:9: note: Dereference of null pointer
           return current->flags & PF_KSWAPD;
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   fs/inode.c:718:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry_safe(inode, next, &sb->s_inodes, i_sb_list) {
           ^
   include/linux/list.h:761:2: note: expanded from macro 'list_for_each_entry_safe'
           for (pos = list_first_entry(head, typeof(*pos), member),        \
           ^
   fs/inode.c:719:7: note: Assuming the condition is false
                   if (atomic_read(&inode->i_count))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:719:3: note: Taking false branch
                   if (atomic_read(&inode->i_count))
                   ^
   fs/inode.c:723:7: note: Assuming the condition is false
                   if (inode->i_state & (I_NEW | I_FREEING | I_WILL_FREE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:723:3: note: Taking false branch
                   if (inode->i_state & (I_NEW | I_FREEING | I_WILL_FREE)) {
                   ^
   fs/inode.c:738:7: note: Calling 'need_resched'
                   if (need_resched()) {
                       ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/trace/events/writeback.h:831:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   DEFINE_EVENT(writeback_inode_template, writeback_lazytime_iput,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   fs/inode.c:1680:8: note: Calling 'inode_insert5'
           old = inode_insert5(inode, hashval, test, NULL, data);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:1171:15: note: 'old' is non-null
           if (unlikely(old)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/inode.c:1171:2: note: Taking true branch
           if (unlikely(old)) {
           ^
   fs/inode.c:1177:3: note: Taking false branch
                   if (IS_ERR(old))
                   ^
   fs/inode.c:1180:3: note: Taking true branch
                   if (unlikely(inode_unhashed(old))) {
                   ^
   fs/inode.c:1181:4: note: Calling 'iput'
                           iput(old);
                           ^~~~~~~~~
   fs/inode.c:1761:7: note: 'inode' is non-null
           if (!inode)
                ^~~~~
   fs/inode.c:1761:2: note: Taking false branch
           if (!inode)
           ^
   fs/inode.c:1763:2: note: Assuming the condition is true
           BUG_ON(inode->i_state & I_CLEAR);
           ^
   include/asm-generic/bug.h:71:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/inode.c:1763:2: note: Taking false branch
           BUG_ON(inode->i_state & I_CLEAR);
--
   #define __smp_store_mb(var, value)  do { WRITE_ONCE(var, value); __smp_mb(); } while (0)
                                            ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:362:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:350:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   sound/core/timer.c:2179:4: note: Dereference of null pointer
                           set_current_state(TASK_INTERRUPTIBLE);
                           ^
   include/linux/sched.h:220:16: note: expanded from macro 'set_current_state'
                   smp_store_mb(current->__state, (state_value));          \
                   ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/barrier.h:127:53: note: expanded from macro '__smp_store_mb'
   #define __smp_store_mb(var, value)  do { WRITE_ONCE(var, value); __smp_mb(); } while (0)
                                            ~~~~~~~~~~~^~~~~~~~~~~
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ~~~~~~~~~~~~~^~~~~~~
   include/asm-generic/rwonce.h:55:27: note: expanded from macro '__WRITE_ONCE'
           *(volatile typeof(x) *)&(x) = (val);                            \
                                    ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/tty/tty_ioctl.c:513:22: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   if (signal_pending(current))
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/tty/tty_ioctl.c:939:2: note: Control jumps to the 'default' case at line 978
           switch (cmd) {
           ^
   drivers/tty/tty_ioctl.c:980:10: note: Calling 'tty_mode_ioctl'
                   return tty_mode_ioctl(tty, cmd, arg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/tty_ioctl.c:770:6: note: Assuming field 'type' is not equal to TTY_DRIVER_TYPE_PTY
           if (tty->driver->type == TTY_DRIVER_TYPE_PTY &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/tty_ioctl.c:770:47: note: Left side of '&&' is false
           if (tty->driver->type == TTY_DRIVER_TYPE_PTY &&
                                                        ^
   drivers/tty/tty_ioctl.c:776:2: note: Control jumps to 'case 21511:'  at line 830
           switch (cmd) {
           ^
   drivers/tty/tty_ioctl.c:831:10: note: Calling 'set_termios'
                   return set_termios(real_tty, p, TERMIOS_WAIT | TERMIOS_TERMIO);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/tty_ioctl.c:471:6: note: Assuming 'retval' is 0
           if (retval)
               ^~~~~~
   drivers/tty/tty_ioctl.c:471:2: note: Taking false branch
           if (retval)
           ^
   drivers/tty/tty_ioctl.c:478:2: note: Taking true branch
           if (opt & TERMIOS_TERMIO) {
           ^
   drivers/tty/tty_ioctl.c:479:3: note: Taking false branch
                   if (user_termio_to_kernel_termios(&tmp_termios,
                   ^
   drivers/tty/tty_ioctl.c:505:6: note: Assuming 'ld' is equal to NULL
           if (ld != NULL) {
               ^~~~~~~~~~
   drivers/tty/tty_ioctl.c:505:2: note: Taking false branch
           if (ld != NULL) {
           ^
   drivers/tty/tty_ioctl.c:511:2: note: Taking true branch
           if (opt & TERMIOS_WAIT) {
           ^
   drivers/tty/tty_ioctl.c:513:22: note: Dereference of null pointer
                   if (signal_pending(current))
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   drivers/tty/tty_buffer.c:539:2: note: Loop condition is true.  Entering loop body
           while (1) {
           ^
   drivers/tty/tty_buffer.c:545:7: note: Assuming the condition is false
                   if (atomic_read(&buf->priority))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/tty_buffer.c:545:3: note: Taking false branch
                   if (atomic_read(&buf->priority))
                   ^
   drivers/tty/tty_buffer.c:552:10: note: Left side of '||' is false
                   next = smp_load_acquire(&head->next);
                          ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/s390/include/asm/barrier.h:47:21: note: expanded from macro '__smp_load_acquire'
           typeof(*p) ___p1 = READ_ONCE(*p);                               \
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:329:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/tty/tty_buffer.c:552:10: note: Left side of '||' is false
                   next = smp_load_acquire(&head->next);
                          ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/s390/include/asm/barrier.h:47:21: note: expanded from macro '__smp_load_acquire'
           typeof(*p) ___p1 = READ_ONCE(*p);                               \
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:329:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/tty/tty_buffer.c:552:10: note: Left side of '||' is false
                   next = smp_load_acquire(&head->next);
                          ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/s390/include/asm/barrier.h:47:21: note: expanded from macro '__smp_load_acquire'
           typeof(*p) ___p1 = READ_ONCE(*p);                               \
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:329:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/tty/tty_buffer.c:552:10: note: Left side of '||' is true
                   next = smp_load_acquire(&head->next);
                          ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/s390/include/asm/barrier.h:47:21: note: expanded from macro '__smp_load_acquire'
           typeof(*p) ___p1 = READ_ONCE(*p);                               \
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                               ^
   drivers/tty/tty_buffer.c:552:10: note: Taking false branch
                   next = smp_load_acquire(&head->next);
                          ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/s390/include/asm/barrier.h:47:21: note: expanded from macro '__smp_load_acquire'
           typeof(*p) ___p1 = READ_ONCE(*p);                               \
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
--
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   11 warnings generated.
   fs/libfs.c:1258:17: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           inode->i_uid = current_fsuid();
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
   fs/libfs.c:1244:6: note: Assuming 'inode' is non-null
           if (!inode)
               ^~~~~~
   fs/libfs.c:1244:2: note: Taking false branch
           if (!inode)
           ^
   fs/libfs.c:1258:17: note: Left side of '&&' is false
           inode->i_uid = current_fsuid();
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
   fs/libfs.c:1258:17: note: Loop condition is false.  Exiting loop
           inode->i_uid = current_fsuid();
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
   fs/libfs.c:1258:17: note: Dereference of null pointer
           inode->i_uid = current_fsuid();
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
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   fs/libfs.c:197:2: note: Taking false branch
           if (!dir_emit_dots(file, ctx))
           ^
   fs/libfs.c:200:6: note: Assuming field 'pos' is equal to 2
           if (ctx->pos == 2)
               ^~~~~~~~~~~~~
   fs/libfs.c:200:2: note: Taking true branch
           if (ctx->pos == 2)
           ^
   fs/libfs.c:207:17: note: Calling 'scan_positives'
           while ((next = scan_positives(cursor, p, 1, next)) != NULL) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/libfs.c:111:2: note: Loop condition is true.  Entering loop body
           while ((p = p->next) != &dentry->d_subdirs) {
           ^
   fs/libfs.c:114:7: note: Assuming the condition is false
                   if (d->d_flags & DCACHE_DENTRY_CURSOR)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/libfs.c:114:3: note: Taking false branch
                   if (d->d_flags & DCACHE_DENTRY_CURSOR)
                   ^
   fs/libfs.c:116:26: note: Left side of '&&' is false
                   if (simple_positive(d) && !--count) {
                                          ^
   fs/libfs.c:125:7: note: Calling 'need_resched'
                   if (need_resched()) {
                       ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/hfs/super.c:230:15: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           hsb->s_uid = current_uid();
                        ^
   include/linux/cred.h:381:25: note: expanded from macro 'current_uid'
   #define current_uid()           (current_cred_xxx(uid))
                                    ^~~~~~~~~~~~~~~~~~~~~
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
   fs/hfs/super.c:230:15: note: Left side of '&&' is false
           hsb->s_uid = current_uid();
                        ^
   include/linux/cred.h:381:25: note: expanded from macro 'current_uid'
   #define current_uid()           (current_cred_xxx(uid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
--
                          ^
   drivers/char/mem.c:501:22: note: Dereference of null pointer
                   if (signal_pending(current))
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/char/mem.c:531:22: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   if (signal_pending(current))
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/char/mem.c:517:2: note: Loop condition is true.  Entering loop body
           while (count) {
           ^
   drivers/char/mem.c:518:18: note: Assuming '__UNIQUE_ID___x282' is >= '__UNIQUE_ID___y283'
                   size_t chunk = min_t(size_t, count, PAGE_SIZE);
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
   drivers/char/mem.c:518:18: note: '?' condition is false
                   size_t chunk = min_t(size_t, count, PAGE_SIZE);
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
   drivers/char/mem.c:522:7: note: Assuming 'left' is 0
                   if (unlikely(left)) {
                       ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/char/mem.c:522:3: note: Taking false branch
                   if (unlikely(left)) {
                   ^
   drivers/char/mem.c:531:22: note: Dereference of null pointer
                   if (signal_pending(current))
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/char/mem.c:566:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return current->mm->get_unmapped_area(file, addr, len, pgoff, flags);
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/char/mem.c:555:6: note: Assuming the condition is false
           if (flags & MAP_SHARED) {
               ^~~~~~~~~~~~~~~~~~
   drivers/char/mem.c:555:2: note: Taking false branch
           if (flags & MAP_SHARED) {
           ^
   drivers/char/mem.c:566:9: note: Dereference of null pointer
           return current->mm->get_unmapped_area(file, addr, len, pgoff, flags);
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/char/mem.c:700:21: warning: Excessive padding in 'struct memdev' (10 padding bytes, where 2 is optimal). Optimal fields order: name, fops, fmode, mode, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   static const struct memdev {
                ~~~~~~~^~~~~~~~
   drivers/char/mem.c:700:21: note: Excessive padding in 'struct memdev' (10 padding bytes, where 2 is optimal). Optimal fields order: name, fops, fmode, mode, consider reordering the fields or adding explicit padding members
   static const struct memdev {
                ~~~~~~~^~~~~~~~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   drivers/char/mem.c:102:6: note: Calling 'need_resched'
           if (need_resched())
               ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   sound/pci/hda/hda_generic.c:2826:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/hda_generic.c:2826:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/hda_generic.c:2939:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name, text);
           ^~~~~~
   sound/pci/hda/hda_generic.c:2939:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name, text);
           ^~~~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   sound/pci/hda/patch_sigmatel.c:3151:24: warning: Value stored to 'spec' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct sigmatel_spec *spec = codec->spec;
                                 ^~~~   ~~~~~~~~~~~
   sound/pci/hda/patch_sigmatel.c:3151:24: note: Value stored to 'spec' during its initialization is never read
           struct sigmatel_spec *spec = codec->spec;
                                 ^~~~   ~~~~~~~~~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   32 warnings generated.
   fs/gfs2/bmap.c:973:26: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           struct gfs2_trans *tr = current->journal_info;
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/gfs2/bmap.c:973:26: note: Dereference of null pointer
           struct gfs2_trans *tr = current->journal_info;
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/gfs2/bmap.c:1056:8: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   tr = current->journal_info;
                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
--
               ^~~
   sound/pci/ctxfi/ctvmem.c:178:2: note: Taking false branch
           if (!vm)
           ^
   sound/pci/ctxfi/ctvmem.c:181:2: note: Loop condition is false.  Exiting loop
           mutex_init(&vm->lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   sound/pci/ctxfi/ctvmem.c:184:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < CT_PTP_NUM; i++) {
           ^
   sound/pci/ctxfi/ctvmem.c:188:7: note: Assuming 'err' is < 0
                   if (err < 0)
                       ^~~~~~~
   sound/pci/ctxfi/ctvmem.c:188:3: note: Taking true branch
                   if (err < 0)
                   ^
   sound/pci/ctxfi/ctvmem.c:189:4: note:  Execution continues on line 191
                           break;
                           ^
   sound/pci/ctxfi/ctvmem.c:191:6: note: 'err' is < 0
           if (err < 0) {
               ^~~
   sound/pci/ctxfi/ctvmem.c:191:2: note: Taking true branch
           if (err < 0) {
           ^
   sound/pci/ctxfi/ctvmem.c:193:3: note: Calling 'ct_vm_destroy'
                   ct_vm_destroy(vm);
                   ^~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:222:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&vm->used)) {
           ^
   sound/pci/ctxfi/ctvmem.c:226:3: note: Memory is released
                   kfree(entry);
                   ^~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:222:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&vm->used)) {
           ^
   sound/pci/ctxfi/ctvmem.c:224:3: note: Use of memory after it is freed
                   list_del(pos);
                   ^        ~~~
   sound/pci/ctxfi/ctvmem.c:230:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
                   list_del(pos);
                   ^
   sound/pci/ctxfi/ctvmem.c:178:6: note: Assuming 'vm' is non-null
           if (!vm)
               ^~~
   sound/pci/ctxfi/ctvmem.c:178:2: note: Taking false branch
           if (!vm)
           ^
   sound/pci/ctxfi/ctvmem.c:181:2: note: Loop condition is false.  Exiting loop
           mutex_init(&vm->lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   sound/pci/ctxfi/ctvmem.c:184:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < CT_PTP_NUM; i++) {
           ^
   sound/pci/ctxfi/ctvmem.c:188:7: note: Assuming 'err' is < 0
                   if (err < 0)
                       ^~~~~~~
   sound/pci/ctxfi/ctvmem.c:188:3: note: Taking true branch
                   if (err < 0)
                   ^
   sound/pci/ctxfi/ctvmem.c:189:4: note:  Execution continues on line 191
                           break;
                           ^
   sound/pci/ctxfi/ctvmem.c:191:6: note: 'err' is < 0
           if (err < 0) {
               ^~~
   sound/pci/ctxfi/ctvmem.c:191:2: note: Taking true branch
           if (err < 0) {
           ^
   sound/pci/ctxfi/ctvmem.c:193:3: note: Calling 'ct_vm_destroy'
                   ct_vm_destroy(vm);
                   ^~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:222:2: note: Loop condition is false. Execution continues on line 228
           while (!list_empty(&vm->used)) {
           ^
   sound/pci/ctxfi/ctvmem.c:228:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&vm->unused)) {
           ^
   sound/pci/ctxfi/ctvmem.c:232:3: note: Memory is released
                   kfree(entry);
                   ^~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:228:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&vm->unused)) {
           ^
   sound/pci/ctxfi/ctvmem.c:230:3: note: Use of memory after it is freed
                   list_del(pos);
                   ^        ~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   fs/jbd2/checkpoint.c:644:2: note: Loop condition is true.  Entering loop body
           while (1) {
           ^
   fs/jbd2/checkpoint.c:646:7: note: Assuming field 'j_checkpoint_transactions' is non-null
                   if (!journal->j_checkpoint_transactions) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jbd2/checkpoint.c:646:3: note: Taking false branch
                   if (!journal->j_checkpoint_transactions) {
                   ^
   fs/jbd2/checkpoint.c:650:3: note: Calling '__jbd2_journal_clean_checkpoint_list'
                   __jbd2_journal_clean_checkpoint_list(journal, true);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jbd2/checkpoint.c:596:7: note: 'transaction' is non-null
           if (!transaction)
                ^~~~~~~~~~~
   fs/jbd2/checkpoint.c:596:2: note: Taking false branch
           if (!transaction)
           ^
   fs/jbd2/checkpoint.c:611:7: note: Calling 'need_resched'
                   if (need_resched())
                       ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/trace/events/jbd2.h:14:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   TRACE_EVENT(jbd2_checkpoint,
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
   fs/jbd2/checkpoint.c:108:9: note: Assuming the condition is true
           while (jbd2_log_space_left(journal) < nblocks) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jbd2/checkpoint.c:108:2: note: Loop condition is true.  Entering loop body
           while (jbd2_log_space_left(journal) < nblocks) {
           ^
   fs/jbd2/checkpoint.c:124:7: note: Assuming the condition is false
                   if (journal->j_flags & JBD2_ABORT) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jbd2/checkpoint.c:124:3: note: Taking false branch
                   if (journal->j_flags & JBD2_ABORT) {
                   ^
   fs/jbd2/checkpoint.c:130:7: note: 'space_left' is < 'nblocks'
                   if (space_left < nblocks) {
                       ^~~~~~~~~~
   fs/jbd2/checkpoint.c:130:3: note: Taking true branch
                   if (space_left < nblocks) {
                   ^
   fs/jbd2/checkpoint.c:131:16: note: Assuming field 'j_checkpoint_transactions' is not equal to NULL
                           int chkpt = journal->j_checkpoint_transactions != NULL;
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jbd2/checkpoint.c:134:17: note: Field 'j_committing_transaction' is null
                           if (journal->j_committing_transaction)
                                        ^
   fs/jbd2/checkpoint.c:134:4: note: Taking false branch
                           if (journal->j_committing_transaction)
                           ^
   fs/jbd2/checkpoint.c:138:8: note: 'chkpt' is 1
                           if (chkpt) {
                               ^~~~~
   fs/jbd2/checkpoint.c:138:4: note: Taking true branch
                           if (chkpt) {
                           ^
   fs/jbd2/checkpoint.c:139:5: note: Calling 'jbd2_log_do_checkpoint'
                                   jbd2_log_do_checkpoint(journal);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jbd2/checkpoint.c:206:2: note: Taking false branch
           jbd2_debug(1, "Start checkpoint\n");
--
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/reiserfs/inode.c:1930:2: note: Taking false branch
           BUG_ON(!th->t_trans_id);
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   fs/reiserfs/inode.c:1930:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!th->t_trans_id);
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   fs/reiserfs/inode.c:1935:6: note: 'err' is 0
           if (err)
               ^~~
   fs/reiserfs/inode.c:1935:2: note: Taking false branch
           if (err)
           ^
   fs/reiserfs/inode.c:1937:6: note: Assuming field 'i_nlink' is not equal to 0
           if (!dir->i_nlink) {
               ^~~~~~~~~~~~~
   fs/reiserfs/inode.c:1937:2: note: Taking false branch
           if (!dir->i_nlink) {
           ^
   fs/reiserfs/inode.c:1945:6: note: Assuming field 'k_objectid' is not equal to 0
           if (!ih.ih_key.k_objectid) {
               ^~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:1945:2: note: Taking false branch
           if (!ih.ih_key.k_objectid) {
           ^
   fs/reiserfs/inode.c:1950:6: note: Assuming the condition is false
           if (old_format_only(sb))
               ^
   fs/reiserfs/reiserfs.h:728:29: note: expanded from macro 'old_format_only'
   #define old_format_only(s) (REISERFS_SB(s)->s_properties & (1 << REISERFS_3_5))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:1950:2: note: Taking false branch
           if (old_format_only(sb))
           ^
   fs/reiserfs/inode.c:1954:3: note: Calling 'make_le_item_head'
                   make_le_item_head(&ih, NULL, KEY_FORMAT_3_6, SD_OFFSET,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:142:6: note: 'key' is null
           if (key) {
               ^~~
   fs/reiserfs/inode.c:142:2: note: Taking false branch
           if (key) {
           ^
   fs/reiserfs/inode.c:147:2: note: Loop condition is false.  Exiting loop
           put_ih_version(ih, version);
           ^
   fs/reiserfs/reiserfs.h:1403:38: note: expanded from macro 'put_ih_version'
   #define put_ih_version(ih, val)      do { (ih)->ih_version = cpu_to_le16(val); } while (0)
                                        ^
   fs/reiserfs/inode.c:148:2: note: Calling 'set_le_ih_k_offset'
           set_le_ih_k_offset(ih, offset);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:1522:2: note: Calling 'set_le_key_k_offset'
           set_le_key_k_offset(ih_version(ih), &(ih->ih_key), offset);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:1502:6: note: Assuming 'version' is not equal to KEY_FORMAT_3_5
           if (version == KEY_FORMAT_3_5)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:1502:2: note: Taking false branch
           if (version == KEY_FORMAT_3_5)
           ^
   fs/reiserfs/reiserfs.h:1505:3: note: Calling 'set_offset_v2_k_offset'
                   set_offset_v2_k_offset(&key->u.k_offset_v2, offset);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:1280:17: note: The left operand of '&' is a garbage value
           v2->v = (v2->v & cpu_to_le64(15ULL << 60)) | cpu_to_le64(offset);
                    ~~~~~ ^
   fs/reiserfs/reiserfs.h:2897:43: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           struct reiserfs_transaction_handle *th = current->journal_info;
                                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/reiserfs/inode.c:2885:6: note: Calling 'reiserfs_transaction_running'
           if (reiserfs_transaction_running(inode->i_sb))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:2897:43: note: Dereference of null pointer
           struct reiserfs_transaction_handle *th = current->journal_info;
                                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   fs/reiserfs/inode.c:681:12: note: Assuming the condition is true
           version = get_inode_item_key_version(inode);
                     ^
   fs/reiserfs/reiserfs.h:1176:7: note: expanded from macro 'get_inode_item_key_version'
       ((REISERFS_I(inode)->i_flags & i_item_key_version_mask) ? KEY_FORMAT_3_6 : KEY_FORMAT_3_5)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:681:12: note: '?' condition is true
           version = get_inode_item_key_version(inode);
                     ^
   fs/reiserfs/reiserfs.h:1176:6: note: expanded from macro 'get_inode_item_key_version'
       ((REISERFS_I(inode)->i_flags & i_item_key_version_mask) ? KEY_FORMAT_3_6 : KEY_FORMAT_3_5)
        ^
   fs/reiserfs/inode.c:683:2: note: Taking false branch
           if (!file_capable(inode, block)) {
           ^
   fs/reiserfs/inode.c:692:6: note: Assuming the condition is false
           if (!(create & GET_BLOCK_CREATE)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:692:2: note: Taking false branch
           if (!(create & GET_BLOCK_CREATE)) {
           ^
   fs/reiserfs/inode.c:705:7: note: Assuming the condition is true
           if ((create & GET_BLOCK_NO_DANGLE) ||
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:705:37: note: Left side of '||' is true
           if ((create & GET_BLOCK_NO_DANGLE) ||
                                              ^
   fs/reiserfs/inode.c:714:7: note: Assuming the condition is false
           if ((have_large_tails(inode->i_sb)
                ^
   fs/reiserfs/reiserfs.h:724:30: note: expanded from macro 'have_large_tails'
   #define have_large_tails(s) (REISERFS_SB(s)->s_mount_opt & (1 << REISERFS_LARGETAIL))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:715:7: note: Left side of '&&' is false
                && inode->i_size < i_block_size(inode) * 4)
                ^
   fs/reiserfs/inode.c:716:10: note: Assuming the condition is false
               || (have_small_tails(inode->i_sb)
                   ^
   fs/reiserfs/reiserfs.h:725:30: note: expanded from macro 'have_small_tails'
   #define have_small_tails(s) (REISERFS_SB(s)->s_mount_opt & (1 << REISERFS_SMALLTAIL))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:717:3: note: Left side of '&&' is false
                   && inode->i_size < i_block_size(inode)))
                   ^
   fs/reiserfs/inode.c:722:6: note: Assuming the condition is true
           if ((new_offset + inode->i_sb->s_blocksize - 1) > inode->i_size) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:722:2: note: Taking true branch
           if ((new_offset + inode->i_sb->s_blocksize - 1) > inode->i_size) {
           ^
   fs/reiserfs/inode.c:725:7: note: Assuming 'th' is non-null
                   if (!th) {
                       ^~~
   fs/reiserfs/inode.c:725:3: note: Taking false branch
                   if (!th) {
                   ^
   fs/reiserfs/inode.c:734:6: note: Assuming the condition is false
           if (retval == IO_ERROR) {
               ^~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:734:2: note: Taking false branch
           if (retval == IO_ERROR) {
           ^
   fs/reiserfs/inode.c:747:2: note: Taking true branch
           if (allocation_needed
           ^
   fs/reiserfs/inode.c:750:8: note: 'th' is non-null
                   if (!th) {
                        ^~
   fs/reiserfs/inode.c:750:3: note: Taking false branch
                   if (!th) {
                   ^
   fs/reiserfs/inode.c:764:7: note: Assuming the condition is false
                   if (repeat == NO_DISK_SPACE || repeat == QUOTA_EXCEEDED) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:764:7: note: Left side of '||' is false
   fs/reiserfs/inode.c:764:34: note: Assuming the condition is false
                   if (repeat == NO_DISK_SPACE || repeat == QUOTA_EXCEEDED) {
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:764:3: note: Taking false branch
                   if (repeat == NO_DISK_SPACE || repeat == QUOTA_EXCEEDED) {
                   ^
   fs/reiserfs/inode.c:783:7: note: Calling 'reiserfs_cond_resched'
                   if (fs_changed(fs_gen, inode->i_sb)
                       ^
   fs/reiserfs/reiserfs.h:2308:2: note: expanded from macro 'fs_changed'
           reiserfs_cond_resched(s);       \
           ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:844:6: note: Calling 'need_resched'
--
   fs/reiserfs/reiserfs.h:907:51: note: expanded from macro '__RASSERT'
   #define __RASSERT(cond, scond, format, args...)                 \
                                                                   ^
   fs/reiserfs/stree.c:337:16: note: Calling 'get_lkey'
           if (comp_keys(get_lkey(chk_path, sb), key) == 1)
                         ^~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/stree.c:221:9: note: 'path_offset' is >= 2
           RFALSE(path_offset < FIRST_PATH_ELEMENT_OFFSET,
                  ^
   fs/reiserfs/reiserfs.h:918:51: note: expanded from macro 'RFALSE'
   #define RFALSE(cond, format, args...) __RASSERT(!(cond), "!(" #cond ")", format, ##args)
                                                     ^~~~
   fs/reiserfs/reiserfs.h:909:8: note: expanded from macro '__RASSERT'
           if (!(cond))                                                    \
                 ^~~~
   fs/reiserfs/stree.c:221:2: note: Taking false branch
           RFALSE(path_offset < FIRST_PATH_ELEMENT_OFFSET,
           ^
   fs/reiserfs/reiserfs.h:918:39: note: expanded from macro 'RFALSE'
   #define RFALSE(cond, format, args...) __RASSERT(!(cond), "!(" #cond ")", format, ##args)
                                         ^
   fs/reiserfs/reiserfs.h:909:2: note: expanded from macro '__RASSERT'
           if (!(cond))                                                    \
           ^
   fs/reiserfs/stree.c:221:2: note: Loop condition is false.  Exiting loop
           RFALSE(path_offset < FIRST_PATH_ELEMENT_OFFSET,
           ^
   fs/reiserfs/reiserfs.h:918:39: note: expanded from macro 'RFALSE'
   #define RFALSE(cond, format, args...) __RASSERT(!(cond), "!(" #cond ")", format, ##args)
                                         ^
   fs/reiserfs/reiserfs.h:907:51: note: expanded from macro '__RASSERT'
   #define __RASSERT(cond, scond, format, args...)                 \
                                                                   ^
   fs/reiserfs/stree.c:225:9: note: Assuming the condition is true
           while (path_offset-- > FIRST_PATH_ELEMENT_OFFSET) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/stree.c:225:2: note: Loop condition is true.  Entering loop body
           while (path_offset-- > FIRST_PATH_ELEMENT_OFFSET) {
           ^
   fs/reiserfs/stree.c:227:10: note: Assuming the condition is false
                   RFALSE(!buffer_uptodate
                          ^
   fs/reiserfs/reiserfs.h:918:51: note: expanded from macro 'RFALSE'
   #define RFALSE(cond, format, args...) __RASSERT(!(cond), "!(" #cond ")", format, ##args)
                                         ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:909:8: note: expanded from macro '__RASSERT'
           if (!(cond))                                                    \
                 ^~~~
   fs/reiserfs/stree.c:227:3: note: Taking false branch
                   RFALSE(!buffer_uptodate
                   ^
   fs/reiserfs/reiserfs.h:918:39: note: expanded from macro 'RFALSE'
   #define RFALSE(cond, format, args...) __RASSERT(!(cond), "!(" #cond ")", format, ##args)
                                         ^
   fs/reiserfs/reiserfs.h:909:2: note: expanded from macro '__RASSERT'
           if (!(cond))                                                    \
           ^
   fs/reiserfs/stree.c:227:3: note: Loop condition is false.  Exiting loop
                   RFALSE(!buffer_uptodate
                   ^
   fs/reiserfs/reiserfs.h:918:39: note: expanded from macro 'RFALSE'
   #define RFALSE(cond, format, args...) __RASSERT(!(cond), "!(" #cond ")", format, ##args)
                                         ^
   fs/reiserfs/reiserfs.h:907:51: note: expanded from macro '__RASSERT'
   #define __RASSERT(cond, scond, format, args...)                 \
                                                                   ^
   fs/reiserfs/stree.c:233:8: note: Passing null pointer value via 1st parameter 'bh'
                       (parent =
                        ^~~~~~~~
   fs/reiserfs/stree.c:232:8: note: Calling 'B_IS_IN_TREE'
                   if (!B_IS_IN_TREE
                        ^~~~~~~~~~~~
   fs/reiserfs/stree.c:23:9: note: Access to field 'b_data' results in a dereference of a null pointer (loaded from variable 'bh')
           RFALSE(B_LEVEL(bh) > MAX_HEIGHT,
                  ^
   fs/reiserfs/reiserfs.h:1685:35: note: expanded from macro 'B_LEVEL'
   #define B_LEVEL(bh)                     (blkh_level(B_BLK_HEAD(bh)))
                                                       ^          ~~
   fs/reiserfs/reiserfs.h:1682:48: note: expanded from macro 'B_BLK_HEAD'
   #define B_BLK_HEAD(bh)                  ((struct block_head *)((bh)->b_data))
                                                                 ^ ~~
   fs/reiserfs/reiserfs.h:1657:53: note: expanded from macro 'blkh_level'
   #define blkh_level(p_blkh)            (le16_to_cpu((p_blkh)->blk_level))
                                                       ^~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   fs/reiserfs/reiserfs.h:918:51: note: expanded from macro 'RFALSE'
   #define RFALSE(cond, format, args...) __RASSERT(!(cond), "!(" #cond ")", format, ##args)
                                                     ^~~~
   fs/reiserfs/reiserfs.h:909:8: note: expanded from macro '__RASSERT'
           if (!(cond))                                                    \
                 ^~~~
   fs/reiserfs/stree.c:1051:22: warning: Value stored to 'bh' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct buffer_head *bh = PATH_PLAST_BUFFER(path);
                               ^~
   fs/reiserfs/stree.c:1051:22: note: Value stored to 'bh' during its initialization is never read
           struct buffer_head *bh = PATH_PLAST_BUFFER(path);
                               ^~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   fs/reiserfs/stree.c:2100:9: note: Assuming field 't_trans_id' is not equal to 0
           BUG_ON(!th->t_trans_id);
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/reiserfs/stree.c:2100:2: note: Taking false branch
           BUG_ON(!th->t_trans_id);
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   fs/reiserfs/stree.c:2100:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!th->t_trans_id);
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   fs/reiserfs/stree.c:2114:6: note: 'retval' is 0
           if (retval) {
               ^~~~~~
   fs/reiserfs/stree.c:2114:2: note: Taking false branch
           if (retval) {
           ^
   fs/reiserfs/stree.c:2125:6: note: Calling 'reiserfs_cond_resched'
           if (fs_changed(fs_gen, inode->i_sb)) {
               ^
   fs/reiserfs/reiserfs.h:2308:2: note: expanded from macro 'fs_changed'
           reiserfs_cond_resched(s);       \
           ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:844:6: note: Calling 'need_resched'
           if (need_resched()) {
               ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/pci/controller/pcie-altera.c:550:9: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           *value = data;
                  ^
   drivers/pci/controller/pcie-altera.c:717:2: note: Calling 'altera_pcie_retrain'
           altera_pcie_retrain(pcie);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-altera.c:602:6: note: Assuming the condition is false
           if (!pcie->pcie_data->ops->get_link_status(pcie))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-altera.c:602:2: note: Taking false branch
           if (!pcie->pcie_data->ops->get_link_status(pcie))
           ^
   drivers/pci/controller/pcie-altera.c:609:2: note: Calling 'altera_read_cap_word'
           altera_read_cap_word(pcie, pcie->root_bus_nr, RP_DEVFN, PCI_EXP_LNKCAP,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-altera.c:543:2: note: 'data' declared without an initial value
           u32 data;
           ^~~~~~~~
   drivers/pci/controller/pcie-altera.c:546:8: note: Calling '_altera_pcie_cfg_read'
           ret = _altera_pcie_cfg_read(pcie, busno, devfn,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-altera.c:438:6: note: 'busno' is equal to field 'root_bus_nr'
           if (busno == pcie->root_bus_nr && pcie->pcie_data->ops->rp_read_cfg)
               ^~~~~
   drivers/pci/controller/pcie-altera.c:438:6: note: Left side of '&&' is true
   drivers/pci/controller/pcie-altera.c:438:36: note: Assuming field 'rp_read_cfg' is null
           if (busno == pcie->root_bus_nr && pcie->pcie_data->ops->rp_read_cfg)
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-altera.c:438:2: note: Taking false branch
           if (busno == pcie->root_bus_nr && pcie->pcie_data->ops->rp_read_cfg)
           ^
   drivers/pci/controller/pcie-altera.c:442:2: note: Control jumps to 'case 2:'  at line 446
--
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:250:18: note: expanded from macro '__DECLARE_TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITION'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:188:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   fs/gfs2/trace_gfs2.h:401:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   TRACE_EVENT(gfs2_ail_flush,
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
   fs/gfs2/log.c:970:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   fs/gfs2/log.c:971:7: note: Left side of '&&' is true
                   if (time_after(jiffies, start + (HZ * 600))) {
                       ^
   include/linux/jiffies.h:105:3: note: expanded from macro 'time_after'
           (typecheck(unsigned long, a) && \
            ^
   include/linux/typecheck.h:9:27: note: expanded from macro 'typecheck'
   #define typecheck(type,x) \
                             ^
   fs/gfs2/log.c:971:7: note: Left side of '&&' is true
                   if (time_after(jiffies, start + (HZ * 600))) {
                       ^
   include/linux/jiffies.h:105:3: note: expanded from macro 'time_after'
           (typecheck(unsigned long, a) && \
            ^
   include/linux/typecheck.h:9:27: note: expanded from macro 'typecheck'
   #define typecheck(type,x) \
                             ^
   fs/gfs2/log.c:971:7: note: Assuming the condition is false
                   if (time_after(jiffies, start + (HZ * 600))) {
                       ^
   include/linux/jiffies.h:107:4: note: expanded from macro 'time_after'
            ((long)((b) - (a)) < 0))
             ^~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/log.c:971:3: note: Taking false branch
                   if (time_after(jiffies, start + (HZ * 600))) {
                   ^
   fs/gfs2/log.c:977:3: note: Calling 'gfs2_ail1_start'
                   gfs2_ail1_start(sdp);
                   ^~~~~~~~~~~~~~~~~~~~
   fs/gfs2/log.c:245:9: note: Calling 'gfs2_ail1_flush'
           return gfs2_ail1_flush(sdp, &wbc);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/log.c:200:2: note: Calling 'trace_gfs2_ail_flush'
           trace_gfs2_ail_flush(sdp, wbc, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/trace_gfs2.h:401:1: note: Taking true branch
   TRACE_EVENT(gfs2_ail_flush,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:247:3: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   fs/gfs2/trace_gfs2.h:401:1: note: Dereference of null pointer
   TRACE_EVENT(gfs2_ail_flush,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:250:18: note: expanded from macro '__DECLARE_TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITION'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:188:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   fs/gfs2/log.c:103:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry_safe_reverse(bd, s, &tr->tr_ail1_list, bd_ail_st_list) {
           ^
   include/linux/list.h:808:2: note: expanded from macro 'list_for_each_entry_safe_reverse'
           for (pos = list_last_entry(head, typeof(*pos), member),         \
           ^
   fs/gfs2/log.c:106:20: note: Assuming 'tr' is equal to field 'bd_tr'
                   gfs2_assert(sdp, bd->bd_tr == tr);
                                    ^
   fs/gfs2/util.h:32:17: note: expanded from macro 'gfs2_assert'
           if (unlikely(!(assertion))) { \
                          ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/gfs2/log.c:106:3: note: Taking false branch
                   gfs2_assert(sdp, bd->bd_tr == tr);
                   ^
   fs/gfs2/util.h:32:2: note: expanded from macro 'gfs2_assert'
           if (unlikely(!(assertion))) { \
           ^
   fs/gfs2/log.c:106:3: note: Loop condition is false.  Exiting loop
                   gfs2_assert(sdp, bd->bd_tr == tr);
                   ^
   fs/gfs2/util.h:30:37: note: expanded from macro 'gfs2_assert'
   #define gfs2_assert(sdp, assertion) \
                                       ^
   fs/gfs2/log.c:108:7: note: Assuming the condition is false
                   if (!buffer_busy(bh)) {
                       ^~~~~~~~~~~~~~~~
   fs/gfs2/log.c:108:3: note: Taking false branch
                   if (!buffer_busy(bh)) {
                   ^
   fs/gfs2/log.c:120:7: note: Assuming the condition is false
                   if (gfs2_withdrawn(sdp)) {
                       ^~~~~~~~~~~~~~~~~~~
   fs/gfs2/log.c:120:3: note: Taking false branch
                   if (gfs2_withdrawn(sdp)) {
                   ^
   fs/gfs2/log.c:124:7: note: Assuming the condition is false
                   if (!buffer_dirty(bh))
                       ^~~~~~~~~~~~~~~~~
   fs/gfs2/log.c:124:3: note: Taking false branch
                   if (!buffer_dirty(bh))
                   ^
   fs/gfs2/log.c:126:7: note: Assuming 'gl' is not equal to field 'bd_gl'
                   if (gl == bd->bd_gl)
                       ^~~~~~~~~~~~~~~
   fs/gfs2/log.c:126:3: note: Taking false branch
                   if (gl == bd->bd_gl)
                   ^
   fs/gfs2/log.c:131:7: note: Assuming 'mapping' is non-null
                   if (!mapping)
                       ^~~~~~~~
   fs/gfs2/log.c:131:3: note: Taking false branch
                   if (!mapping)
                   ^
   fs/gfs2/log.c:135:7: note: Calling 'need_resched'
                   if (need_resched()) {
                       ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
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
   24 warnings generated.
   drivers/scsi/mpt3sas/mpt3sas_transport.c:461:3: warning: Null pointer passed as 1st argument to string copy function [clang-analyzer-unix.cstring.NullArg]
                   strncpy(edev->vendor_id, manufacture_reply->vendor_id,
                   ^
   drivers/scsi/mpt3sas/mpt3sas_transport.c:696:6: note: Assuming 'hba_port' is non-null
           if (!hba_port) {
               ^~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_transport.c:696:2: note: Taking false branch
           if (!hba_port) {
--
                                                                   ^
   fs/fuse/inode.c:828:2: note: Loop condition is false.  Exiting loop
           init_rwsem(&fc->killsb);
           ^
   include/linux/rwsem.h:106:30: note: expanded from macro 'init_rwsem'
   #define init_rwsem(sem)                                         \
                                                                   ^
   fs/fuse/inode.c:831:2: note: Loop condition is false.  Exiting loop
           init_waitqueue_head(&fc->blocked_waitq);
           ^
   include/linux/wait.h:67:2: note: expanded from macro 'init_waitqueue_head'
           do {                                                                    \
           ^
   fs/fuse/inode.c:846:45: note: Dereference of null pointer
           fc->pid_ns = get_pid_ns(task_active_pid_ns(current));
                                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/comedi/comedi_fops.c:2469:26: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name = __WAITQUEUE_INITIALIZER(name, tsk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITIALIZER'
           .private        = tsk,                                                  \
                             ^~~
   drivers/comedi/comedi_fops.c:2469:26: note: Dereference of null pointer
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name = __WAITQUEUE_INITIALIZER(name, tsk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITIALIZER'
           .private        = tsk,                                                  \
                             ^~~
   drivers/comedi/comedi_fops.c:2605:26: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name = __WAITQUEUE_INITIALIZER(name, tsk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITIALIZER'
           .private        = tsk,                                                  \
                             ^~~
   drivers/comedi/comedi_fops.c:2605:26: note: Dereference of null pointer
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name = __WAITQUEUE_INITIALIZER(name, tsk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITIALIZER'
           .private        = tsk,                                                  \
                             ^~~
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   drivers/comedi/comedi_fops.c:2125:13: note: Left side of '&&' is true
           if (cmd == COMEDI_DEVCONFIG) {
                      ^
   include/uapi/linux/comedi.h:457:26: note: expanded from macro 'COMEDI_DEVCONFIG'
   #define COMEDI_DEVCONFIG _IOW(CIO, 0, struct comedi_devconfig)
                            ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECHECK'
           ((sizeof(t) == sizeof(t[1]) && \
             ^
   drivers/comedi/comedi_fops.c:2125:13: note: '?' condition is true
           if (cmd == COMEDI_DEVCONFIG) {
                      ^
   include/uapi/linux/comedi.h:457:26: note: expanded from macro 'COMEDI_DEVCONFIG'
   #define COMEDI_DEVCONFIG _IOW(CIO, 0, struct comedi_devconfig)
                            ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:3: note: expanded from macro '_IOC_TYPECHECK'
           ((sizeof(t) == sizeof(t[1]) && \
            ^
   drivers/comedi/comedi_fops.c:2125:6: note: Assuming the condition is false
           if (cmd == COMEDI_DEVCONFIG) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/comedi_fops.c:2125:2: note: Taking false branch
           if (cmd == COMEDI_DEVCONFIG) {
           ^
   drivers/comedi/comedi_fops.c:2150:6: note: Assuming field 'attached' is not equal to 0
           if (!dev->attached) {
               ^~~~~~~~~~~~~~
   drivers/comedi/comedi_fops.c:2150:2: note: Taking false branch
           if (!dev->attached) {
           ^
   drivers/comedi/comedi_fops.c:2156:2: note: Control jumps to 'case 2148557835:'  at line 2228
           switch (cmd) {
           ^
   drivers/comedi/comedi_fops.c:2232:3: note: Taking false branch
                   if (copy_from_user(&insnlist, (void __user *)arg,
                   ^
   drivers/comedi/comedi_fops.c:2238:7: note: Assuming 'insns' is non-null
                   if (!insns) {
                       ^~~~~~
   drivers/comedi/comedi_fops.c:2238:3: note: Taking false branch
                   if (!insns) {
                   ^
   drivers/comedi/comedi_fops.c:2242:3: note: Taking false branch
                   if (copy_from_user(insns, insnlist.insns,
                   ^
   drivers/comedi/comedi_fops.c:2248:8: note: Calling 'do_insnlist_ioctl'
                   rc = do_insnlist_ioctl(dev, insns, insnlist.n_insns, file);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/comedi_fops.c:1532:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&dev->mutex);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:313:15: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(x);                      \
                                  ^
   drivers/comedi/comedi_fops.c:1532:2: note: Left side of '&&' is false
           lockdep_assert_held(&dev->mutex);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:27: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/comedi/comedi_fops.c:1532:2: note: Taking false branch
           lockdep_assert_held(&dev->mutex);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   drivers/comedi/comedi_fops.c:1532:2: note: Taking false branch
           lockdep_assert_held(&dev->mutex);
--
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_entry'
           for (pos = list_first_entry(head, typeof(*pos), member);        \
           ^
   drivers/char/hw_random/core.c:324:10: note: Assuming 'new_rng' is not equal to 'current_rng'
           ret = ((new_rng == current_rng) ? 0 : set_current_rng(new_rng));
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:324:9: note: '?' condition is false
           ret = ((new_rng == current_rng) ? 0 : set_current_rng(new_rng));
                  ^
   drivers/char/hw_random/core.c:324:56: note: Passing null pointer value via 1st parameter 'rng'
           ret = ((new_rng == current_rng) ? 0 : set_current_rng(new_rng));
                                                                 ^~~~~~~
   drivers/char/hw_random/core.c:324:40: note: Calling 'set_current_rng'
           ret = ((new_rng == current_rng) ? 0 : set_current_rng(new_rng));
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:92:9: note: Assuming the condition is false
           BUG_ON(!mutex_is_locked(&rng_mutex));
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/char/hw_random/core.c:92:2: note: Taking false branch
           BUG_ON(!mutex_is_locked(&rng_mutex));
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   drivers/char/hw_random/core.c:92:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!mutex_is_locked(&rng_mutex));
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   drivers/char/hw_random/core.c:94:19: note: Passing null pointer value via 1st parameter 'rng'
           err = hwrng_init(rng);
                            ^~~
   drivers/char/hw_random/core.c:94:8: note: Calling 'hwrng_init'
           err = hwrng_init(rng);
                 ^~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:160:6: note: Assuming the condition is true
           if (kref_get_unless_zero(&rng->ref))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:160:2: note: Taking true branch
           if (kref_get_unless_zero(&rng->ref))
           ^
   drivers/char/hw_random/core.c:161:3: note: Control jumps to line 175
                   goto skip_init;
                   ^
   drivers/char/hw_random/core.c:175:28: note: Assuming '__UNIQUE_ID___x253' is >= '__UNIQUE_ID___y254'
           rng->quality = min_t(u16, min_t(u16, default_quality, 1024), rng->quality ?: 1024);
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
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:126:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x = (x);               \
                                         ^
   drivers/char/hw_random/core.c:175:28: note: '?' condition is false
           rng->quality = min_t(u16, min_t(u16, default_quality, 1024), rng->quality ?: 1024);
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
   drivers/char/hw_random/core.c:175:63: note: Access to field 'quality' results in a dereference of a null pointer (loaded from variable 'rng')
           rng->quality = min_t(u16, min_t(u16, default_quality, 1024), rng->quality ?: 1024);
                                                                        ^
   include/linux/minmax.h:126:59: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                                                   ^
   include/linux/minmax.h:38:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:32:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y = (y);               \
                                         ^
>> include/linux/thread_info.h:185:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                (unsigned long *)(&current_thread_info()->flags));
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
   drivers/char/hw_random/core.c:218:2: note: Loop condition is true.  Entering loop body
           while (size) {
           ^
   drivers/char/hw_random/core.c:220:3: note: Taking false branch
                   if (IS_ERR(rng)) {
                   ^
   drivers/char/hw_random/core.c:224:7: note: Assuming 'rng' is non-null
                   if (!rng) {
                       ^~~~
   drivers/char/hw_random/core.c:224:3: note: Taking false branch
                   if (!rng) {
                   ^
   drivers/char/hw_random/core.c:229:7: note: Assuming the condition is false
                   if (mutex_lock_interruptible(&reading_mutex)) {
                       ^
   include/linux/mutex.h:188:40: note: expanded from macro 'mutex_lock_interruptible'
   #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(lock, 0)
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:229:3: note: Taking false branch
                   if (mutex_lock_interruptible(&reading_mutex)) {
                   ^
   drivers/char/hw_random/core.c:233:7: note: Assuming 'data_avail' is 0
                   if (!data_avail) {
                       ^~~~~~~~~~~
   drivers/char/hw_random/core.c:233:3: note: Taking true branch
                   if (!data_avail) {
                   ^
   drivers/char/hw_random/core.c:236:5: note: Assuming the condition is true
                                   !(filp->f_flags & O_NONBLOCK));
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:237:8: note: Assuming 'bytes_read' is >= 0
                           if (bytes_read < 0) {
                               ^~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:237:4: note: Taking false branch
                           if (bytes_read < 0) {
                           ^
   drivers/char/hw_random/core.c:244:7: note: Assuming 'data_avail' is 0
                   if (!data_avail) {
                       ^~~~~~~~~~~
   drivers/char/hw_random/core.c:244:3: note: Taking true branch
                   if (!data_avail) {
                   ^
   drivers/char/hw_random/core.c:245:4: note: Taking false branch
                           if (filp->f_flags & O_NONBLOCK) {
                           ^
   drivers/char/hw_random/core.c:269:7: note: Calling 'need_resched'
                   if (need_resched())
                       ^~~~~~~~~~~~~~
   include/linux/sched.h:2229:18: note: Calling 'tif_need_resched'
           return unlikely(tif_need_resched());
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:185:28: note: Dereference of null pointer
                                (unsigned long *)(&current_thread_info()->flags));
                                                   ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   sound/firewire/dice/dice.c:66:40: warning: The result of the left shift is undefined because the left operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (device->config_rom[3] != ((vendor << 8) | category) ||
                                                 ^
   sound/firewire/dice/dice.c:150:6: note: Assuming field 'driver_data' is 0
           if (!entry->driver_data && entry->vendor_id != OUI_SSL) {
               ^~~~~~~~~~~~~~~~~~~
   sound/firewire/dice/dice.c:150:6: note: Left side of '&&' is true
   sound/firewire/dice/dice.c:150:29: note: Assuming field 'vendor_id' is not equal to OUI_SSL
           if (!entry->driver_data && entry->vendor_id != OUI_SSL) {
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/dice/dice.c:150:2: note: Taking true branch
           if (!entry->driver_data && entry->vendor_id != OUI_SSL) {
           ^
   sound/firewire/dice/dice.c:151:9: note: Calling 'check_dice_category'
                   err = check_dice_category(unit);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/dice/dice.c:37:16: note: 'vendor' initialized to -1
           int key, val, vendor = -1, model = -1;
                         ^~~~~~
   sound/firewire/dice/dice.c:47:2: note: Loop condition is false. Execution continues on line 58

vim +185 include/linux/thread_info.h

e4df1511e1f4bc Peter Zijlstra 2023-01-12  181  
e4df1511e1f4bc Peter Zijlstra 2023-01-12  182  static __always_inline bool tif_need_resched(void)
e4df1511e1f4bc Peter Zijlstra 2023-01-12  183  {
e4df1511e1f4bc Peter Zijlstra 2023-01-12  184  	return arch_test_bit(TIF_NEED_RESCHED,
e4df1511e1f4bc Peter Zijlstra 2023-01-12 @185  			     (unsigned long *)(&current_thread_info()->flags));
e4df1511e1f4bc Peter Zijlstra 2023-01-12  186  }
e4df1511e1f4bc Peter Zijlstra 2023-01-12  187  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
