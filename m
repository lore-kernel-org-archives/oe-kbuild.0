Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771C9A3B
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Mar 2023 04:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677646388; x=1709182388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YpcHp/JWbb516cFFiEBT7GmuUIIYSUfSe8pNTMmGbbU=;
  b=NHT6KOrPgqkulecYSPZ8hRbjhPeHeFG50m1kruGFvwQYk/zTEBXrL1oT
   ACawk32+vYHXnJxLZPaHjsPCmybeb+TGIiFpkDKp2TqM2JvfOB8NFoU7U
   iuz8N6j8EpBAXEPxVGeppv/rB0mtiNBKXbUbh51NrAC/p5NvPrSWvZY/t
   yilLbVym62zWCAzJrJ0He/qqDEhdi94hVl8AYXBog4t6Zk29ArYDNLYgn
   erkZ1kSFOhc3eLPmHgtFmu7VvCf6pIcDCdz/DHEK1o5XD8tWgVo7XRkmC
   w99n44HxBkd9P5Sw0A9xTTuxy0GfdbXnUSzdVYpbewkagXgyeiwmXnKqG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="334357324"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="334357324"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 20:53:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="624342201"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="624342201"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Feb 2023 20:53:05 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXESe-0005t9-2C;
	Wed, 01 Mar 2023 04:53:04 +0000
Date: Wed, 1 Mar 2023 12:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/memfd.c:321:16: warning: Dereference of null pointer
 [clang-analyzer-core.NullDereference]
Message-ID: <202303011209.NzYt6MdP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/memfd.c:321:16: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jeff Xu <jeffxu@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Daniel Verkamp <dverkamp@chromium.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c0927a7a5391f7d8e593e5e50ead7505a23cadf9
commit: 105ff5339f498af74e60d7662c8f1c4d21f1342d mm/memfd: add MFD_NOEXEC_SEAL and MFD_EXEC
date:   6 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: s390-randconfig-c005-20230226 (https://download.01.org/0day-ci/archive/20230301/202303011209.NzYt6MdP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=105ff5339f498af74e60d7662c8f1c4d21f1342d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 105ff5339f498af74e60d7662c8f1c4d21f1342d
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303011209.NzYt6MdP-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/signal.c:458:21: note: Calling 'sigmask_to_save'
           sigset_t *oldset = sigmask_to_save();
                              ^~~~~~~~~~~~~~~~~
   include/linux/sched/signal.h:565:19: note: Dereference of null pointer
           sigset_t *res = &current->blocked;
                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/sched/signal.h:605:6: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (current->sas_ss_flags & SS_AUTODISARM)
               ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/signal.c:276:6: note: Calling 'on_sig_stack'
           if (on_sig_stack(sp) && !on_sig_stack((sp - frame_size) & -8UL))
               ^~~~~~~~~~~~~~~~
   include/linux/sched/signal.h:605:6: note: Dereference of null pointer
           if (current->sas_ss_flags & SS_AUTODISARM)
               ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   mm/usercopy.c:39:45: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           const void * const stack = task_stack_page(current);
                                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/usercopy.c:215:6: note: Left side of '&&' is false
           if (static_branch_unlikely(&bypass_usercopy_checks))
               ^
   include/linux/jump_label.h:509:52: note: expanded from macro 'static_branch_unlikely'
   #define static_branch_unlikely(x)       unlikely_notrace(static_key_enabled(&(x)->key))
                                                            ^
   include/linux/jump_label.h:417:67: note: expanded from macro 'static_key_enabled'
           if (!__builtin_types_compatible_p(typeof(*x), struct static_key) &&     \
                                                                            ^
   mm/usercopy.c:215:6: note: Assuming the condition is false
           if (static_branch_unlikely(&bypass_usercopy_checks))
               ^
   include/linux/jump_label.h:509:35: note: expanded from macro 'static_branch_unlikely'
   #define static_branch_unlikely(x)       unlikely_notrace(static_key_enabled(&(x)->key))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:80:30: note: expanded from macro 'unlikely_notrace'
   # define unlikely_notrace(x)    unlikely(x)
                                   ^~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/usercopy.c:215:2: note: Taking false branch
           if (static_branch_unlikely(&bypass_usercopy_checks))
           ^
   mm/usercopy.c:219:6: note: Assuming 'n' is not equal to 0
           if (!n)
               ^~
   mm/usercopy.c:219:2: note: Taking false branch
           if (!n)
           ^
   mm/usercopy.c:226:10: note: Calling 'check_stack_object'
           switch (check_stack_object(ptr, n)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/usercopy.c:39:45: note: Dereference of null pointer
           const void * const stack = task_stack_page(current);
                                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
>> mm/memfd.c:321:16: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                           task_pid_nr(current), get_task_comm(comm, current));
                                       ^
   mm/memfd.c:269:1: note: Calling '__do_sys_memfd_create'
   SYSCALL_DEFINE2(memfd_create,
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
   mm/memfd.c:280:6: note: Assuming the condition is false
           if (!(flags & MFD_HUGETLB)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   mm/memfd.c:280:2: note: Taking false branch
           if (!(flags & MFD_HUGETLB)) {
           ^
   mm/memfd.c:285:7: note: Assuming the condition is false
                   if (flags & ~(unsigned int)(MFD_ALL_FLAGS |
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memfd.c:285:3: note: Taking false branch
                   if (flags & ~(unsigned int)(MFD_ALL_FLAGS |
                   ^
   mm/memfd.c:291:7: note: Assuming the condition is false
           if ((flags & MFD_EXEC) && (flags & MFD_NOEXEC_SEAL))
                ^~~~~~~~~~~~~~~~
   mm/memfd.c:291:25: note: Left side of '&&' is false
           if ((flags & MFD_EXEC) && (flags & MFD_NOEXEC_SEAL))
                                  ^
   mm/memfd.c:294:6: note: Assuming the condition is true
           if (!(flags & (MFD_EXEC | MFD_NOEXEC_SEAL))) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memfd.c:294:2: note: Taking true branch
           if (!(flags & (MFD_EXEC | MFD_NOEXEC_SEAL))) {
           ^
   mm/memfd.c:319:3: note: '__ret_cond' is true
                   pr_warn_once(
                   ^
   include/linux/printk.h:615:2: note: expanded from macro 'pr_warn_once'
           printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:596:2: note: expanded from macro 'printk_once'
           DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:11:2: note: expanded from macro 'DO_ONCE_LITE'
           DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:19:16: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                                ^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/memfd.c:319:3: note: Left side of '&&' is true
                   pr_warn_once(
                   ^
   include/linux/printk.h:615:2: note: expanded from macro 'pr_warn_once'
           printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:596:2: note: expanded from macro 'printk_once'
           DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
           ^
   include/linux/once_lite.h:11:2: note: expanded from macro 'DO_ONCE_LITE'
           DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
           ^
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^
   include/linux/once_lite.h:19:16: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                                ^
   mm/memfd.c:319:3: note: Taking true branch
                   pr_warn_once(
                   ^
   include/linux/printk.h:615:2: note: expanded from macro 'pr_warn_once'
           printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:596:2: note: expanded from macro 'printk_once'
           DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
           ^
   include/linux/once_lite.h:11:2: note: expanded from macro 'DO_ONCE_LITE'
           DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
           ^
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^
   include/linux/once_lite.h:19:3: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                   ^
   mm/memfd.c:319:3: note: Taking true branch
                   pr_warn_once(
                   ^
   include/linux/printk.h:615:2: note: expanded from macro 'pr_warn_once'

vim +321 mm/memfd.c

5d752600a8c373 Mike Kravetz 2018-06-07  268  
5d752600a8c373 Mike Kravetz 2018-06-07  269  SYSCALL_DEFINE2(memfd_create,
5d752600a8c373 Mike Kravetz 2018-06-07  270  		const char __user *, uname,
5d752600a8c373 Mike Kravetz 2018-06-07  271  		unsigned int, flags)
5d752600a8c373 Mike Kravetz 2018-06-07  272  {
105ff5339f498a Jeff Xu      2022-12-15  273  	char comm[TASK_COMM_LEN];
5d752600a8c373 Mike Kravetz 2018-06-07  274  	unsigned int *file_seals;
5d752600a8c373 Mike Kravetz 2018-06-07  275  	struct file *file;
5d752600a8c373 Mike Kravetz 2018-06-07  276  	int fd, error;
5d752600a8c373 Mike Kravetz 2018-06-07  277  	char *name;
5d752600a8c373 Mike Kravetz 2018-06-07  278  	long len;
5d752600a8c373 Mike Kravetz 2018-06-07  279  
5d752600a8c373 Mike Kravetz 2018-06-07  280  	if (!(flags & MFD_HUGETLB)) {
5d752600a8c373 Mike Kravetz 2018-06-07  281  		if (flags & ~(unsigned int)MFD_ALL_FLAGS)
5d752600a8c373 Mike Kravetz 2018-06-07  282  			return -EINVAL;
5d752600a8c373 Mike Kravetz 2018-06-07  283  	} else {
5d752600a8c373 Mike Kravetz 2018-06-07  284  		/* Allow huge page size encoding in flags. */
5d752600a8c373 Mike Kravetz 2018-06-07  285  		if (flags & ~(unsigned int)(MFD_ALL_FLAGS |
5d752600a8c373 Mike Kravetz 2018-06-07  286  				(MFD_HUGE_MASK << MFD_HUGE_SHIFT)))
5d752600a8c373 Mike Kravetz 2018-06-07  287  			return -EINVAL;
5d752600a8c373 Mike Kravetz 2018-06-07  288  	}
5d752600a8c373 Mike Kravetz 2018-06-07  289  
105ff5339f498a Jeff Xu      2022-12-15  290  	/* Invalid if both EXEC and NOEXEC_SEAL are set.*/
105ff5339f498a Jeff Xu      2022-12-15  291  	if ((flags & MFD_EXEC) && (flags & MFD_NOEXEC_SEAL))
105ff5339f498a Jeff Xu      2022-12-15  292  		return -EINVAL;
105ff5339f498a Jeff Xu      2022-12-15  293  
105ff5339f498a Jeff Xu      2022-12-15  294  	if (!(flags & (MFD_EXEC | MFD_NOEXEC_SEAL))) {
105ff5339f498a Jeff Xu      2022-12-15  295  #ifdef CONFIG_SYSCTL
105ff5339f498a Jeff Xu      2022-12-15  296  		int sysctl = MEMFD_NOEXEC_SCOPE_EXEC;
105ff5339f498a Jeff Xu      2022-12-15  297  		struct pid_namespace *ns;
105ff5339f498a Jeff Xu      2022-12-15  298  
105ff5339f498a Jeff Xu      2022-12-15  299  		ns = task_active_pid_ns(current);
105ff5339f498a Jeff Xu      2022-12-15  300  		if (ns)
105ff5339f498a Jeff Xu      2022-12-15  301  			sysctl = ns->memfd_noexec_scope;
105ff5339f498a Jeff Xu      2022-12-15  302  
105ff5339f498a Jeff Xu      2022-12-15  303  		switch (sysctl) {
105ff5339f498a Jeff Xu      2022-12-15  304  		case MEMFD_NOEXEC_SCOPE_EXEC:
105ff5339f498a Jeff Xu      2022-12-15  305  			flags |= MFD_EXEC;
105ff5339f498a Jeff Xu      2022-12-15  306  			break;
105ff5339f498a Jeff Xu      2022-12-15  307  		case MEMFD_NOEXEC_SCOPE_NOEXEC_SEAL:
105ff5339f498a Jeff Xu      2022-12-15  308  			flags |= MFD_NOEXEC_SEAL;
105ff5339f498a Jeff Xu      2022-12-15  309  			break;
105ff5339f498a Jeff Xu      2022-12-15  310  		default:
105ff5339f498a Jeff Xu      2022-12-15  311  			pr_warn_once(
105ff5339f498a Jeff Xu      2022-12-15  312  				"memfd_create(): MFD_NOEXEC_SEAL is enforced, pid=%d '%s'\n",
105ff5339f498a Jeff Xu      2022-12-15  313  				task_pid_nr(current), get_task_comm(comm, current));
105ff5339f498a Jeff Xu      2022-12-15  314  			return -EINVAL;
105ff5339f498a Jeff Xu      2022-12-15  315  		}
105ff5339f498a Jeff Xu      2022-12-15  316  #else
105ff5339f498a Jeff Xu      2022-12-15  317  		flags |= MFD_EXEC;
105ff5339f498a Jeff Xu      2022-12-15  318  #endif
105ff5339f498a Jeff Xu      2022-12-15  319  		pr_warn_once(
105ff5339f498a Jeff Xu      2022-12-15  320  			"memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=%d '%s'\n",
105ff5339f498a Jeff Xu      2022-12-15 @321  			task_pid_nr(current), get_task_comm(comm, current));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
