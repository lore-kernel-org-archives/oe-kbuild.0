Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D903C461
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 22:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaW47nGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700088073; x=1731624073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1HRtbJwXlClOVP8lpyEE7vZUnyUA55AAyFWzzvLqDLQ=;
  b=AaW47nGxS8FtPHu2+T/Jgp3En9qX/UzrBgzOw7AFFpLct4PQWoc2kI4Q
   2HMlKX7jtID6dEqnhFTIozF68ph0Sp4ypyJm0rzFZm51LYkffBI66RJY6
   wtPsQZl39yCcDCphQXtKvwgrPK//SoWg0HDD+vJdp1rhrjMzClqWIlSKG
   V8HYZc4p4ibN9nJrUUEkIjX35W4mT1t7LdrbkqwJzWEoU9iAzWlMyE9pK
   nhgZnIlqv0k+Y9F3H2lj6UVvhy4LB9RcdGWmdPkhSHYt6MeW0i6CGaUli
   o5BW0p9hPaWFF5tGPijRgpyuX0sT1k+XcOFogdX7ESUwxbE47itTXls+3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="394888038"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="394888038"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 14:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1096584480"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="1096584480"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2023 14:41:10 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3OZI-0000vK-2r;
	Wed, 15 Nov 2023 22:41:08 +0000
Date: Thu, 16 Nov 2023 06:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/s390/include/asm/mmu_context.h:78:22: sparse: sparse:
 self-comparison always evaluates to true
Message-ID: <202311160644.2NRzH8MU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/s390/include/asm/mmu_context.h:78:22: sparse: sparse: self-comparison always evaluates to true"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nicholas Piggin <npiggin@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 2655421ae69fa479df1575cb2630af9131d28939 lazy tlb: shoot lazies, non-refcounting lazy tlb mm reference handling scheme
date:   8 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 months ago
config: s390-randconfig-r111-20231115 (https://download.01.org/0day-ci/archive/20231116/202311160644.2NRzH8MU-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160644.2NRzH8MU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160644.2NRzH8MU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/fork.c:1394:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] old_exe_file @@     got struct file [noderef] __rcu *[assigned] __ret @@
   kernel/fork.c:1394:22: sparse:     expected struct file *[assigned] old_exe_file
   kernel/fork.c:1394:22: sparse:     got struct file [noderef] __rcu *[assigned] __ret
   kernel/fork.c:1722:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1722:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1722:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1731:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1731:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1731:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1732:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *src @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1732:36: sparse:     expected void const *src
   kernel/fork.c:1732:36: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1733:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1733:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1733:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2150:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2150:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2150:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2154:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2154:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2154:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2474:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   kernel/fork.c:2474:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2474:32: sparse:     got struct task_struct *
   kernel/fork.c:2483:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2483:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2483:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2532:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2532:54: sparse:     expected struct list_head *head
   kernel/fork.c:2532:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2554:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2554:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2554:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2575:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2575:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2575:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2602:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2602:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2602:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2631:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2631:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2631:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2633:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2633:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2633:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:3071:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:3071:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:3071:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3156:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3156:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3156:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c: note: in included file (through arch/s390/include/asm/elf.h, include/linux/elf.h, include/linux/module.h):
>> arch/s390/include/asm/mmu_context.h:78:22: sparse: sparse: self-comparison always evaluates to true
   kernel/fork.c:2195:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/linux/ftrace.h, include/linux/perf_event.h, include/linux/trace_events.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2530:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2531:59: sparse: sparse: dereference of noderef expression

vim +78 arch/s390/include/asm/mmu_context.h

^1da177e4c3f41 include/asm-s390/mmu_context.h      Linus Torvalds     2005-04-16  72  
bdb8c9353ead1a arch/s390/include/asm/mmu_context.h Alexander Gordeev  2021-05-06  73  static inline void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
3610cce87af069 include/asm-s390/mmu_context.h      Martin Schwidefsky 2007-10-22  74  				      struct task_struct *tsk)
3610cce87af069 include/asm-s390/mmu_context.h      Martin Schwidefsky 2007-10-22  75  {
53e857f3086791 arch/s390/include/asm/mmu_context.h Martin Schwidefsky 2012-09-10  76  	int cpu = smp_processor_id();
53e857f3086791 arch/s390/include/asm/mmu_context.h Martin Schwidefsky 2012-09-10  77  
b4d70a6134d215 arch/s390/include/asm/mmu_context.h Heiko Carstens     2020-12-07 @78  	if (next == &init_mm)
b4d70a6134d215 arch/s390/include/asm/mmu_context.h Heiko Carstens     2020-12-07  79  		S390_lowcore.user_asce = s390_invalid_asce;
b4d70a6134d215 arch/s390/include/asm/mmu_context.h Heiko Carstens     2020-12-07  80  	else
0aaba41b58bc5f arch/s390/include/asm/mmu_context.h Martin Schwidefsky 2017-08-22  81  		S390_lowcore.user_asce = next->context.asce;
1b948d6caec4f2 arch/s390/include/asm/mmu_context.h Martin Schwidefsky 2014-04-03  82  	cpumask_set_cpu(cpu, &next->context.cpu_attach_mask);
87d5986345219a arch/s390/include/asm/mmu_context.h Heiko Carstens     2020-11-16  83  	/* Clear previous user-ASCE from CR7 */
0290c9e328e040 arch/s390/include/asm/mmu_context.h Heiko Carstens     2020-11-16  84  	__ctl_load(s390_invalid_asce, 7, 7);
a38662084c8bdb arch/s390/include/asm/mmu_context.h Martin Schwidefsky 2019-01-08  85  	if (prev != next)
1b948d6caec4f2 arch/s390/include/asm/mmu_context.h Martin Schwidefsky 2014-04-03  86  		cpumask_clear_cpu(cpu, &prev->context.cpu_attach_mask);
53e857f3086791 arch/s390/include/asm/mmu_context.h Martin Schwidefsky 2012-09-10  87  }
bdb8c9353ead1a arch/s390/include/asm/mmu_context.h Alexander Gordeev  2021-05-06  88  #define switch_mm_irqs_off switch_mm_irqs_off
bdb8c9353ead1a arch/s390/include/asm/mmu_context.h Alexander Gordeev  2021-05-06  89  

:::::: The code at line 78 was first introduced by commit
:::::: b4d70a6134d2152d692ccc873ff6fa3351631927 s390/mm: use invalid asce for user space when switching to init_mm

:::::: TO: Heiko Carstens <hca@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
