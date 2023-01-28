Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91DA33F7
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jan 2023 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674934791; x=1706470791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oqtycua+6opYrBfXnVm7EV5f4V8+f88JQTrR6YR/9JI=;
  b=QoW7LM+E0jM4eP9lspKbkXM19mpMLPDrhDBrs46bbvGwaTbclK0zn1m0
   rWYxjEJRiYGtkB48wdOjzjQsmpx6mOIkNg9uHGXxzphiKIPUFqUAtCJS0
   WtnYMNaxxzihG1WYldz2CAYJjWBk11tp1cc+iHH69t3N/USdqQEUFcp1S
   4utaLJ8YQ3mROID8h0ZyLmBqeYB5F17hYVsEwF2kut3XGHwwTcp+fmvOc
   IWt43L5Kb/PcVP5G65574OapGPnjG7EkwJB28qI5fwIO0soAbbyjBi0w8
   bBWaX5a81la7QhWa6GDEL+Soys3dVQ83nSzLis6wZ3HPokhFoN/nIVIO/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="413547461"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="413547461"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 11:39:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="992431290"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="992431290"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2023 11:39:49 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLr3E-00012W-2y;
	Sat, 28 Jan 2023 19:39:48 +0000
Date: Sun, 29 Jan 2023 03:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 401/450] fs/userfaultfd.c:1367:2: warning:
 Value stored to 'found' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202301290308.ZN5KqCQ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/userfaultfd.c:1367:2: warning: Value stored to 'found' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   ede43f2956cc25e387a5e225324104f22e715908
commit: a5545fd557c61ffab02714e67af69ef7f3757676 [401/450] userfaultfd: use vma iterator
:::::: branch date: 20 hours ago
:::::: commit date: 5 days ago
config: s390-randconfig-c005-20230123 (https://download.01.org/0day-ci/archive/20230129/202301290308.ZN5KqCQ9-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=a5545fd557c61ffab02714e67af69ef7f3757676
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout a5545fd557c61ffab02714e67af69ef7f3757676
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   fs/userfaultfd.c:240:46: note: Dereference of null pointer
                   msg.arg.pagefault.feat.ptid = task_pid_vnr(current);
                                                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/userfaultfd.c:411:6: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (current->flags & (PF_EXITING|PF_DUMPCORE))
               ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/userfaultfd.c:411:6: note: Dereference of null pointer
           if (current->flags & (PF_EXITING|PF_DUMPCORE))
               ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/userfaultfd.c:589:19: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (WARN_ON_ONCE(current->flags & PF_EXITING))
                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/userfaultfd.c:864:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry_safe(ctx, n, uf, list) {
           ^
   include/linux/list.h:761:2: note: expanded from macro 'list_for_each_entry_safe'
           for (pos = list_first_entry(head, typeof(*pos), member),        \
           ^
   fs/userfaultfd.c:871:3: note: Calling 'userfaultfd_event_wait_completion'
                   userfaultfd_event_wait_completion(ctx->ctx, &ewq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/userfaultfd.c:589:19: note: Dereference of null pointer
           if (WARN_ON_ONCE(current->flags & PF_EXITING))
                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONCE'
           int __ret_warn_on = !!(condition);                      \
                                  ^~~~~~~~~
   fs/userfaultfd.c:1036:26: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/userfaultfd.c:1206:6: note: Assuming the condition is false
           if (!userfaultfd_is_initialized(ctx))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/userfaultfd.c:1206:2: note: Taking false branch
           if (!userfaultfd_is_initialized(ctx))
           ^
   fs/userfaultfd.c:1209:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   fs/userfaultfd.c:1210:7: note: Assuming the condition is false
                   if (count < sizeof(msg))
                       ^~~~~~~~~~~~~~~~~~~
   fs/userfaultfd.c:1210:3: note: Taking false branch
                   if (count < sizeof(msg))
                   ^
   fs/userfaultfd.c:1212:10: note: Calling 'userfaultfd_ctx_read'
                   _ret = userfaultfd_ctx_read(ctx, no_wait, &msg, inode);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/userfaultfd.c:1036:26: note: Dereference of null pointer
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
>> fs/userfaultfd.c:1367:2: warning: Value stored to 'found' is never read [clang-analyzer-deadcode.DeadStores]
           found = false;
           ^       ~~~~~
   fs/userfaultfd.c:1367:2: note: Value stored to 'found' is never read
           found = false;
           ^       ~~~~~
   fs/userfaultfd.c:1574:2: warning: Value stored to 'found' is never read [clang-analyzer-deadcode.DeadStores]
           found = false;
           ^       ~~~~~
   fs/userfaultfd.c:1574:2: note: Value stored to 'found' is never read
           found = false;
           ^       ~~~~~
   fs/userfaultfd.c:2090:10: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           BUG_ON(!current->mm);
                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/userfaultfd.c:2139:1: note: Calling '__do_sys_userfaultfd'
   SYSCALL_DEFINE1(userfaultfd, int, flags)
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
   fs/userfaultfd.c:2141:2: note: Taking false branch
           if (!userfaultfd_syscall_allowed(flags))
           ^
   fs/userfaultfd.c:2144:9: note: Calling 'new_userfaultfd'
           return new_userfaultfd(flags);
                  ^~~~~~~~~~~~~~~~~~~~~~
   fs/userfaultfd.c:2090:10: note: Dereference of null pointer
           BUG_ON(!current->mm);
                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/verity/read_metadata.c:70:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   if (fatal_signal_pending(current))  {
                                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/verity/read_metadata.c:160:6: note: Assuming 'vi' is non-null
           if (!vi)
               ^~~
   fs/verity/read_metadata.c:160:2: note: Taking false branch
           if (!vi)
           ^
   fs/verity/read_metadata.c:167:2: note: Taking false branch
           if (copy_from_user(&arg, uarg, sizeof(arg)))
           ^
   fs/verity/read_metadata.c:170:6: note: Assuming field '__reserved' is 0
           if (arg.__reserved)
               ^~~~~~~~~~~~~~
   fs/verity/read_metadata.c:170:2: note: Taking false branch
           if (arg.__reserved)
           ^
   fs/verity/read_metadata.c:174:6: note: Assuming the condition is false
           if (arg.offset + arg.length < arg.offset)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/read_metadata.c:174:2: note: Taking false branch
           if (arg.offset + arg.length < arg.offset)
           ^
   fs/verity/read_metadata.c:178:11: note: Assuming '__UNIQUE_ID___x305' is >= '__UNIQUE_ID___y306'
           length = min_t(u64, arg.length, INT_MAX);
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

vim +/found +1367 fs/userfaultfd.c

86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1291  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1292  static int userfaultfd_register(struct userfaultfd_ctx *ctx,
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1293  				unsigned long arg)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1294  {
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1295  	struct mm_struct *mm = ctx->mm;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1296  	struct vm_area_struct *vma, *prev, *cur;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1297  	int ret;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1298  	struct uffdio_register uffdio_register;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1299  	struct uffdio_register __user *user_uffdio_register;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1300  	unsigned long vm_flags, new_flags;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1301  	bool found;
ce53e8e6f2cb02 Mike Rapoport       2017-09-06  1302  	bool basic_ioctls;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1303  	unsigned long start, end, vma_end;
a5545fd557c61f Liam R. Howlett     2023-01-20  1304  	struct vma_iterator vmi;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1305  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1306  	user_uffdio_register = (struct uffdio_register __user *) arg;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1307  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1308  	ret = -EFAULT;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1309  	if (copy_from_user(&uffdio_register, user_uffdio_register,
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1310  			   sizeof(uffdio_register)-sizeof(__u64)))
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1311  		goto out;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1312  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1313  	ret = -EINVAL;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1314  	if (!uffdio_register.mode)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1315  		goto out;
7677f7fd8be766 Axel Rasmussen      2021-05-04  1316  	if (uffdio_register.mode & ~UFFD_API_REGISTER_MODES)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1317  		goto out;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1318  	vm_flags = 0;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1319  	if (uffdio_register.mode & UFFDIO_REGISTER_MODE_MISSING)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1320  		vm_flags |= VM_UFFD_MISSING;
00b151f21f390f Peter Xu            2021-06-30  1321  	if (uffdio_register.mode & UFFDIO_REGISTER_MODE_WP) {
00b151f21f390f Peter Xu            2021-06-30  1322  #ifndef CONFIG_HAVE_ARCH_USERFAULTFD_WP
00b151f21f390f Peter Xu            2021-06-30  1323  		goto out;
00b151f21f390f Peter Xu            2021-06-30  1324  #endif
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1325  		vm_flags |= VM_UFFD_WP;
00b151f21f390f Peter Xu            2021-06-30  1326  	}
7677f7fd8be766 Axel Rasmussen      2021-05-04  1327  	if (uffdio_register.mode & UFFDIO_REGISTER_MODE_MINOR) {
7677f7fd8be766 Axel Rasmussen      2021-05-04  1328  #ifndef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
7677f7fd8be766 Axel Rasmussen      2021-05-04  1329  		goto out;
7677f7fd8be766 Axel Rasmussen      2021-05-04  1330  #endif
7677f7fd8be766 Axel Rasmussen      2021-05-04  1331  		vm_flags |= VM_UFFD_MINOR;
7677f7fd8be766 Axel Rasmussen      2021-05-04  1332  	}
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1333  
e71e2ace5721a8 Peter Collingbourne 2021-07-23  1334  	ret = validate_range(mm, uffdio_register.range.start,
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1335  			     uffdio_register.range.len);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1336  	if (ret)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1337  		goto out;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1338  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1339  	start = uffdio_register.range.start;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1340  	end = start + uffdio_register.range.len;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1341  
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1342  	ret = -ENOMEM;
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1343  	if (!mmget_not_zero(mm))
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1344  		goto out;
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1345  
a5545fd557c61f Liam R. Howlett     2023-01-20  1346  	ret = -EINVAL;
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  1347  	mmap_write_lock(mm);
a5545fd557c61f Liam R. Howlett     2023-01-20  1348  	vma_iter_init(&vmi, mm, start);
a5545fd557c61f Liam R. Howlett     2023-01-20  1349  	vma = vma_find(&vmi, end);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1350  	if (!vma)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1351  		goto out_unlock;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1352  
cab350afcbc9c8 Mike Kravetz        2017-02-22  1353  	/*
cab350afcbc9c8 Mike Kravetz        2017-02-22  1354  	 * If the first vma contains huge pages, make sure start address
cab350afcbc9c8 Mike Kravetz        2017-02-22  1355  	 * is aligned to huge page size.
cab350afcbc9c8 Mike Kravetz        2017-02-22  1356  	 */
cab350afcbc9c8 Mike Kravetz        2017-02-22  1357  	if (is_vm_hugetlb_page(vma)) {
cab350afcbc9c8 Mike Kravetz        2017-02-22  1358  		unsigned long vma_hpagesize = vma_kernel_pagesize(vma);
cab350afcbc9c8 Mike Kravetz        2017-02-22  1359  
cab350afcbc9c8 Mike Kravetz        2017-02-22  1360  		if (start & (vma_hpagesize - 1))
cab350afcbc9c8 Mike Kravetz        2017-02-22  1361  			goto out_unlock;
cab350afcbc9c8 Mike Kravetz        2017-02-22  1362  	}
cab350afcbc9c8 Mike Kravetz        2017-02-22  1363  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1364  	/*
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1365  	 * Search for not compatible vmas.
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1366  	 */
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04 @1367  	found = false;
ce53e8e6f2cb02 Mike Rapoport       2017-09-06  1368  	basic_ioctls = false;
a5545fd557c61f Liam R. Howlett     2023-01-20  1369  	cur = vma;
a5545fd557c61f Liam R. Howlett     2023-01-20  1370  	do {
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1371  		cond_resched();
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1372  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1373  		BUG_ON(!!cur->vm_userfaultfd_ctx.ctx ^
7677f7fd8be766 Axel Rasmussen      2021-05-04  1374  		       !!(cur->vm_flags & __VM_UFFD_FLAGS));
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1375  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1376  		/* check not compatible vmas */
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1377  		ret = -EINVAL;
63b2d4174c4ad1 Andrea Arcangeli    2020-04-06  1378  		if (!vma_can_userfault(cur, vm_flags))
cab350afcbc9c8 Mike Kravetz        2017-02-22  1379  			goto out_unlock;
29ec90660d68bb Andrea Arcangeli    2018-11-30  1380  
29ec90660d68bb Andrea Arcangeli    2018-11-30  1381  		/*
29ec90660d68bb Andrea Arcangeli    2018-11-30  1382  		 * UFFDIO_COPY will fill file holes even without
29ec90660d68bb Andrea Arcangeli    2018-11-30  1383  		 * PROT_WRITE. This check enforces that if this is a
29ec90660d68bb Andrea Arcangeli    2018-11-30  1384  		 * MAP_SHARED, the process has write permission to the backing
29ec90660d68bb Andrea Arcangeli    2018-11-30  1385  		 * file. If VM_MAYWRITE is set it also enforces that on a
29ec90660d68bb Andrea Arcangeli    2018-11-30  1386  		 * MAP_SHARED vma: there is no F_WRITE_SEAL and no further
29ec90660d68bb Andrea Arcangeli    2018-11-30  1387  		 * F_WRITE_SEAL can be taken until the vma is destroyed.
29ec90660d68bb Andrea Arcangeli    2018-11-30  1388  		 */
29ec90660d68bb Andrea Arcangeli    2018-11-30  1389  		ret = -EPERM;
29ec90660d68bb Andrea Arcangeli    2018-11-30  1390  		if (unlikely(!(cur->vm_flags & VM_MAYWRITE)))
29ec90660d68bb Andrea Arcangeli    2018-11-30  1391  			goto out_unlock;
29ec90660d68bb Andrea Arcangeli    2018-11-30  1392  
cab350afcbc9c8 Mike Kravetz        2017-02-22  1393  		/*
cab350afcbc9c8 Mike Kravetz        2017-02-22  1394  		 * If this vma contains ending address, and huge pages
cab350afcbc9c8 Mike Kravetz        2017-02-22  1395  		 * check alignment.
cab350afcbc9c8 Mike Kravetz        2017-02-22  1396  		 */
cab350afcbc9c8 Mike Kravetz        2017-02-22  1397  		if (is_vm_hugetlb_page(cur) && end <= cur->vm_end &&
cab350afcbc9c8 Mike Kravetz        2017-02-22  1398  		    end > cur->vm_start) {
cab350afcbc9c8 Mike Kravetz        2017-02-22  1399  			unsigned long vma_hpagesize = vma_kernel_pagesize(cur);
cab350afcbc9c8 Mike Kravetz        2017-02-22  1400  
cab350afcbc9c8 Mike Kravetz        2017-02-22  1401  			ret = -EINVAL;
cab350afcbc9c8 Mike Kravetz        2017-02-22  1402  
cab350afcbc9c8 Mike Kravetz        2017-02-22  1403  			if (end & (vma_hpagesize - 1))
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1404  				goto out_unlock;
cab350afcbc9c8 Mike Kravetz        2017-02-22  1405  		}
63b2d4174c4ad1 Andrea Arcangeli    2020-04-06  1406  		if ((vm_flags & VM_UFFD_WP) && !(cur->vm_flags & VM_MAYWRITE))
63b2d4174c4ad1 Andrea Arcangeli    2020-04-06  1407  			goto out_unlock;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1408  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1409  		/*
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1410  		 * Check that this vma isn't already owned by a
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1411  		 * different userfaultfd. We can't allow more than one
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1412  		 * userfaultfd to own a single vma simultaneously or we
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1413  		 * wouldn't know which one to deliver the userfaults to.
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1414  		 */
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1415  		ret = -EBUSY;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1416  		if (cur->vm_userfaultfd_ctx.ctx &&
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1417  		    cur->vm_userfaultfd_ctx.ctx != ctx)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1418  			goto out_unlock;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1419  
cab350afcbc9c8 Mike Kravetz        2017-02-22  1420  		/*
cab350afcbc9c8 Mike Kravetz        2017-02-22  1421  		 * Note vmas containing huge pages
cab350afcbc9c8 Mike Kravetz        2017-02-22  1422  		 */
ce53e8e6f2cb02 Mike Rapoport       2017-09-06  1423  		if (is_vm_hugetlb_page(cur))
ce53e8e6f2cb02 Mike Rapoport       2017-09-06  1424  			basic_ioctls = true;
cab350afcbc9c8 Mike Kravetz        2017-02-22  1425  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1426  		found = true;
a5545fd557c61f Liam R. Howlett     2023-01-20  1427  	} for_each_vma_range(vmi, cur, end);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1428  	BUG_ON(!found);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1429  
a5545fd557c61f Liam R. Howlett     2023-01-20  1430  	vma_iter_set(&vmi, start);
a5545fd557c61f Liam R. Howlett     2023-01-20  1431  	prev = vma_prev(&vmi);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1432  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1433  	ret = 0;
a5545fd557c61f Liam R. Howlett     2023-01-20  1434  	for_each_vma_range(vmi, vma, end) {
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1435  		cond_resched();
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1436  
63b2d4174c4ad1 Andrea Arcangeli    2020-04-06  1437  		BUG_ON(!vma_can_userfault(vma, vm_flags));
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1438  		BUG_ON(vma->vm_userfaultfd_ctx.ctx &&
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1439  		       vma->vm_userfaultfd_ctx.ctx != ctx);
29ec90660d68bb Andrea Arcangeli    2018-11-30  1440  		WARN_ON(!(vma->vm_flags & VM_MAYWRITE));
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1441  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1442  		/*
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1443  		 * Nothing to do: this vma is already registered into this
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1444  		 * userfaultfd and with the right tracking mode too.
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1445  		 */
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1446  		if (vma->vm_userfaultfd_ctx.ctx == ctx &&
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1447  		    (vma->vm_flags & vm_flags) == vm_flags)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1448  			goto skip;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1449  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1450  		if (vma->vm_start > start)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1451  			start = vma->vm_start;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1452  		vma_end = min(end, vma->vm_end);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1453  
7677f7fd8be766 Axel Rasmussen      2021-05-04  1454  		new_flags = (vma->vm_flags & ~__VM_UFFD_FLAGS) | vm_flags;
a5545fd557c61f Liam R. Howlett     2023-01-20  1455  		prev = vmi_vma_merge(&vmi, mm, prev, start, vma_end, new_flags,
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1456  				 vma->anon_vma, vma->vm_file, vma->vm_pgoff,
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1457  				 vma_policy(vma),
9a10064f5625d5 Colin Cross         2022-01-14  1458  				 ((struct vm_userfaultfd_ctx){ ctx }),
5c26f6ac9416b6 Suren Baghdasaryan  2022-03-04  1459  				 anon_vma_name(vma));
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1460  		if (prev) {
69dbe6daf1041e Liam R. Howlett     2022-09-06  1461  			/* vma_merge() invalidated the mas */
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1462  			vma = prev;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1463  			goto next;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1464  		}
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1465  		if (vma->vm_start < start) {
a5545fd557c61f Liam R. Howlett     2023-01-20  1466  			ret = vmi_split_vma(&vmi, mm, vma, start, 1);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1467  			if (ret)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1468  				break;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1469  		}
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1470  		if (vma->vm_end > end) {
a5545fd557c61f Liam R. Howlett     2023-01-20  1471  			ret = vmi_split_vma(&vmi, mm, vma, end, 0);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1472  			if (ret)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1473  				break;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1474  		}
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1475  	next:
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1476  		/*
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1477  		 * In the vma_merge() successful mprotect-like case 8:
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1478  		 * the next vma was merged into the current one and
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1479  		 * the current one has not been updated yet.
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1480  		 */
51d3d5eb74ff53 David Hildenbrand   2022-12-09  1481  		userfaultfd_set_vm_flags(vma, new_flags);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1482  		vma->vm_userfaultfd_ctx.ctx = ctx;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1483  
6dfeaff93be1a4 Peter Xu            2021-05-04  1484  		if (is_vm_hugetlb_page(vma) && uffd_disable_huge_pmd_share(vma))
6dfeaff93be1a4 Peter Xu            2021-05-04  1485  			hugetlb_unshare_all_pmds(vma);
6dfeaff93be1a4 Peter Xu            2021-05-04  1486  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1487  	skip:
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1488  		prev = vma;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1489  		start = vma->vm_end;
a5545fd557c61f Liam R. Howlett     2023-01-20  1490  	}
a5545fd557c61f Liam R. Howlett     2023-01-20  1491  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1492  out_unlock:
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  1493  	mmap_write_unlock(mm);
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1494  	mmput(mm);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1495  	if (!ret) {
14819305e09fe4 Peter Xu            2020-04-06  1496  		__u64 ioctls_out;
14819305e09fe4 Peter Xu            2020-04-06  1497  
14819305e09fe4 Peter Xu            2020-04-06  1498  		ioctls_out = basic_ioctls ? UFFD_API_RANGE_IOCTLS_BASIC :
14819305e09fe4 Peter Xu            2020-04-06  1499  		    UFFD_API_RANGE_IOCTLS;
14819305e09fe4 Peter Xu            2020-04-06  1500  
14819305e09fe4 Peter Xu            2020-04-06  1501  		/*
14819305e09fe4 Peter Xu            2020-04-06  1502  		 * Declare the WP ioctl only if the WP mode is
14819305e09fe4 Peter Xu            2020-04-06  1503  		 * specified and all checks passed with the range
14819305e09fe4 Peter Xu            2020-04-06  1504  		 */
14819305e09fe4 Peter Xu            2020-04-06  1505  		if (!(uffdio_register.mode & UFFDIO_REGISTER_MODE_WP))
14819305e09fe4 Peter Xu            2020-04-06  1506  			ioctls_out &= ~((__u64)1 << _UFFDIO_WRITEPROTECT);
14819305e09fe4 Peter Xu            2020-04-06  1507  
f619147104c8ea Axel Rasmussen      2021-05-04  1508  		/* CONTINUE ioctl is only supported for MINOR ranges. */
f619147104c8ea Axel Rasmussen      2021-05-04  1509  		if (!(uffdio_register.mode & UFFDIO_REGISTER_MODE_MINOR))
f619147104c8ea Axel Rasmussen      2021-05-04  1510  			ioctls_out &= ~((__u64)1 << _UFFDIO_CONTINUE);
f619147104c8ea Axel Rasmussen      2021-05-04  1511  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1512  		/*
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1513  		 * Now that we scanned all vmas we can already tell
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1514  		 * userland which ioctls methods are guaranteed to
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1515  		 * succeed on this range.
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1516  		 */
14819305e09fe4 Peter Xu            2020-04-06  1517  		if (put_user(ioctls_out, &user_uffdio_register->ioctls))
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1518  			ret = -EFAULT;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1519  	}
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1520  out:
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1521  	return ret;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1522  }
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1523  

:::::: The code at line 1367 was first introduced by commit
:::::: 86039bd3b4e6a1129318cbfed4e0a6e001656635 userfaultfd: add new syscall to provide memory externalization

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
