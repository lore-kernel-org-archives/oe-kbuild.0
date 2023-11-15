Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5647E381BF
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 21:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpMIhYq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700082320; x=1731618320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uq/76HHjUfpR2kwIsVLsHU7Phg25kpCXtCRsDXvhkuk=;
  b=IpMIhYq18MbVe3d5AOfU0vl86WnyOh9EwRCQoqcXiFEUwwmbMF1gGq7D
   57vTM964tw9Nc4rDIGXIvx3lsF8+Vaw/0EyEUqFUY4br/Oz4LrSmOj5MJ
   wGcTgIyifXqCLxpXmJv/4IJJ2JT1m9sL1Ynh0KqiXzCNsHPD1vgTbIIvr
   MBlYdQmpPV1ZioZF1QdLmCLIgZRqt0CECGAAIoKbemw4vtVdPz51Brfwq
   UcQbT9jK+zCjwjU8eazcyyi3hiXv4QnrYCfddBxhU69yqf7GjQuHoMdRF
   th4KiXlmfxjp7OdsBoUb7ArKu9B4FUWV4qr9jH9UZePHbM2tiISQ/6ju2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4032631"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="4032631"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 13:05:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="888699541"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="888699541"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Nov 2023 13:05:16 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3N4U-0000pE-0o;
	Wed, 15 Nov 2023 21:05:14 +0000
Date: Thu, 16 Nov 2023 05:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/um/include/asm/mmu_context.h:36:29: sparse: sparse:
 self-comparison always evaluates to false
Message-ID: <202311160455.Jj8YJd2o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/um/include/asm/mmu_context.h:36:29: sparse: sparse: self-comparison always evaluates to false"
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
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
config: um-randconfig-r001-20230731 (https://download.01.org/0day-ci/archive/20231116/202311160455.Jj8YJd2o-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160455.Jj8YJd2o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160455.Jj8YJd2o-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/fork.c:1394:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file [noderef] __rcu *__ret @@     got struct file *new_exe_file @@
   kernel/fork.c:1394:24: sparse:     expected struct file [noderef] __rcu *__ret
   kernel/fork.c:1394:24: sparse:     got struct file *new_exe_file
   kernel/fork.c:1394:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] old_exe_file @@     got struct file [noderef] __rcu *[assigned] __ret @@
   kernel/fork.c:1394:22: sparse:     expected struct file *[assigned] old_exe_file
   kernel/fork.c:1394:22: sparse:     got struct file [noderef] __rcu *[assigned] __ret
   kernel/fork.c:1722:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1722:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1722:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1731:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1731:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1731:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1732:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1732:36: sparse:     expected void const *from
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
   kernel/fork.c:2474:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct *task @@
   kernel/fork.c:2474:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2474:32: sparse:     got struct task_struct *task
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
   kernel/fork.c: note: in included file:
>> arch/um/include/asm/mmu_context.h:36:29: sparse: sparse: self-comparison always evaluates to false
   kernel/fork.c:2195:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/uapi/asm-generic/bpf_perf_event.h, arch/um/include/generated/asm/bpf_perf_event.h, include/uapi/linux/bpf_perf_event.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2530:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2531:59: sparse: sparse: dereference of noderef expression

vim +36 arch/um/include/asm/mmu_context.h

^1da177e4c3f41 include/asm-um/mmu_context.h      Linus Torvalds 2005-04-16  27  
^1da177e4c3f41 include/asm-um/mmu_context.h      Linus Torvalds 2005-04-16  28  static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next, 
^1da177e4c3f41 include/asm-um/mmu_context.h      Linus Torvalds 2005-04-16  29  			     struct task_struct *tsk)
^1da177e4c3f41 include/asm-um/mmu_context.h      Linus Torvalds 2005-04-16  30  {
^1da177e4c3f41 include/asm-um/mmu_context.h      Linus Torvalds 2005-04-16  31  	unsigned cpu = smp_processor_id();
^1da177e4c3f41 include/asm-um/mmu_context.h      Linus Torvalds 2005-04-16  32  
^1da177e4c3f41 include/asm-um/mmu_context.h      Linus Torvalds 2005-04-16  33  	if(prev != next){
fa40699b975131 arch/um/include/asm/mmu_context.h Rusty Russell  2009-09-24  34  		cpumask_clear_cpu(cpu, mm_cpumask(prev));
fa40699b975131 arch/um/include/asm/mmu_context.h Rusty Russell  2009-09-24  35  		cpumask_set_cpu(cpu, mm_cpumask(next));
^1da177e4c3f41 include/asm-um/mmu_context.h      Linus Torvalds 2005-04-16 @36  		if(next != &init_mm)
6c738ffa9fea68 include/asm-um/mmu_context.h      Jeff Dike      2007-10-16  37  			__switch_mm(&next->context.id);
^1da177e4c3f41 include/asm-um/mmu_context.h      Linus Torvalds 2005-04-16  38  	}
^1da177e4c3f41 include/asm-um/mmu_context.h      Linus Torvalds 2005-04-16  39  }
^1da177e4c3f41 include/asm-um/mmu_context.h      Linus Torvalds 2005-04-16  40  

:::::: The code at line 36 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
