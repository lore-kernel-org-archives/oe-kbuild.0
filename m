Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDD359525
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 23:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4xPFYmK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701386529; x=1732922529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tmWl/jFKoASZtnbHM15IzEi4sUPyn73joij4l1svjHY=;
  b=E4xPFYmKLYNvP7XPg+fJxx/VPHxDoHKn4KH0wpOvqx/7xPVlgtnlDqqB
   Woaj03Gs92VCD24zU/wgx3H6qCVWenBKS2b9eEkV0DBH3JoX01yFS4fID
   5tFRCP5tZfz70VyvE3ty5T272dUZ8NPYf9TmHVtwB0ws4WCl+sQj+X2pi
   kVLrKKdNd0sbDLe2FA1K5KG8BNCusDYuranSnjMdlyj53KLP3hMNbQNC4
   +az487NwOvrHyLdXtIXfdI7fmlETg+4E6kCt57pHmryhZIK2qjx/pMqGq
   bT87yAlpgDJ2pk1IWlRSeFP1lHD3QThDHxsTSDwqz9b2byXL8KHUYkGWL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393142545"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="393142545"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 15:22:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="839962973"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="839962973"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Nov 2023 15:22:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8qLr-0002nA-04;
	Thu, 30 Nov 2023 23:21:56 +0000
Date: Fri, 1 Dec 2023 07:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/lib/dump_tlb.c:21:9: sparse: sparse: cast from
 unknown type
Message-ID: <202312010759.Ylo0wgGJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/loongarch/lib/dump_tlb.c:21:9: sparse: sparse: cast from unknown type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: WANG Xuerui <git@xen0n.name>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 53a4858ccd0d27538f9ab1ac2bead002fca97edc LoongArch: Make the CPUCFG&CSR ops simple aliases of compiler built-ins
date:   5 months ago
:::::: branch date: 33 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r034-20230511 (https://download.01.org/0day-ci/archive/20231201/202312010759.Ylo0wgGJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010759.Ylo0wgGJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312010759.Ylo0wgGJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/lib/dump_tlb.c:21:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
>> arch/loongarch/lib/dump_tlb.c:21:9: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:23:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/lib/dump_tlb.c:23:9: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:24:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/lib/dump_tlb.c:24:9: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:25:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/lib/dump_tlb.c:25:9: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:40:21: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/lib/dump_tlb.c:40:21: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:41:19: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/lib/dump_tlb.c:41:19: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:42:18: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/lib/dump_tlb.c:42:18: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:48:28: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/lib/dump_tlb.c:48:28: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:49:28: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/lib/dump_tlb.c:49:28: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:50:28: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/lib/dump_tlb.c:50:28: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:51:25: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/lib/dump_tlb.c:51:25: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:52:24: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/lib/dump_tlb.c:52:24: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:103:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/lib/dump_tlb.c:103:9: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:104:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/lib/dump_tlb.c:104:9: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c:105:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/lib/dump_tlb.c:105:9: sparse: sparse: cast from unknown type
   arch/loongarch/lib/dump_tlb.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1171:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1171:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1166:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
   arch/loongarch/include/asm/loongarch.h:1166:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1171:17: sparse: sparse: cast from unknown type
--
   kernel/fork.c:1476:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] old_exe_file @@     got struct file [noderef] __rcu *[assigned] __res @@
   kernel/fork.c:1476:22: sparse:     expected struct file *[assigned] old_exe_file
   kernel/fork.c:1476:22: sparse:     got struct file [noderef] __rcu *[assigned] __res
   kernel/fork.c:1810:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1810:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1810:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1819:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1819:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1819:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1820:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *__from @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1820:36: sparse:     expected void const *__from
   kernel/fork.c:1820:36: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1821:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1821:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1821:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2323:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2323:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2323:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2327:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2327:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2327:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2363:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/fork.c:2363:9: sparse:     expected void *ptr
   kernel/fork.c:2363:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/fork.c:2363:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/fork.c:2363:9: sparse:     expected void *ptr
   kernel/fork.c:2363:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/fork.c:2363:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/fork.c:2363:9: sparse:     expected void *ptr
   kernel/fork.c:2363:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/fork.c:2363:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/fork.c:2363:9: sparse:     expected void *ptr
   kernel/fork.c:2363:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/fork.c:2363:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/fork.c:2363:9: sparse:     expected void *ptr
   kernel/fork.c:2363:9: sparse:     got int [noderef] __percpu *
   kernel/fork.c:2363:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/fork.c:2363:9: sparse:     expected void *ptr
   kernel/fork.c:2363:9: sparse:     got int [noderef] __percpu *
   kernel/fork.c:2363:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/fork.c:2363:9: sparse:     expected void *ptr
   kernel/fork.c:2363:9: sparse:     got int [noderef] __percpu *
   kernel/fork.c:2363:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/fork.c:2363:9: sparse:     expected void *ptr
   kernel/fork.c:2363:9: sparse:     got int [noderef] __percpu *
   kernel/fork.c:2643:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct *task @@
   kernel/fork.c:2643:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2643:32: sparse:     got struct task_struct *task
   kernel/fork.c:2652:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2652:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2652:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2701:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2701:54: sparse:     expected struct list_head *head
   kernel/fork.c:2701:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2723:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2723:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2723:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2745:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2745:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2745:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2772:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2772:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2772:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2801:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2801:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2801:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2803:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2803:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2803:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:3244:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:3244:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:3244:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3332:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3332:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3332:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c: note: in included file:
   arch/loongarch/include/asm/mmu_context.h:86:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
>> arch/loongarch/include/asm/mmu_context.h:86:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/mmu_context.h:89:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/include/asm/mmu_context.h:89:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/mmu_context.h:91:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/include/asm/mmu_context.h:91:17: sparse: sparse: cast from unknown type
--
   kernel/kthread.c: note: in included file (through include/linux/mmu_context.h):
   arch/loongarch/include/asm/mmu_context.h:86:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
>> arch/loongarch/include/asm/mmu_context.h:86:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/mmu_context.h:89:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/include/asm/mmu_context.h:89:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/mmu_context.h:91:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/include/asm/mmu_context.h:91:17: sparse: sparse: cast from unknown type
--
   arch/loongarch/kernel/perf_event.c:167:23: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/perf_event.c:167:23: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:170:23: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/perf_event.c:170:23: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:173:23: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/perf_event.c:173:23: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:176:23: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/perf_event.c:176:23: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:190:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/perf_event.c:190:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:193:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/perf_event.c:193:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:196:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/perf_event.c:196:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:199:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/perf_event.c:199:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:213:23: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/perf_event.c:213:23: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:216:23: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/perf_event.c:216:23: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:219:23: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/perf_event.c:219:23: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:222:23: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/perf_event.c:222:23: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:236:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/perf_event.c:236:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:239:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/perf_event.c:239:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:242:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/perf_event.c:242:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:245:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/perf_event.c:245:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/perf_event.c:650:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     expected void *ptr
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kernel/perf_event.c:650:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     expected void *ptr
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kernel/perf_event.c:650:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     expected void *ptr
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kernel/perf_event.c:650:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     expected void *ptr
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kernel/perf_event.c:650:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     expected void *ptr
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kernel/perf_event.c:650:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     expected void *ptr
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kernel/perf_event.c:650:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     expected void *ptr
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kernel/perf_event.c:650:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     expected void *ptr
   arch/loongarch/kernel/perf_event.c:650:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kernel/perf_event.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, ...):
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:25: sparse: sparse: undefined identifier '__builtin_loongarch_cpucfg'
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
--
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kernel/hw_breakpoint.c:71:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:72:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:73:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/hw_breakpoint.c:74:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:86:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:86:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/hw_breakpoint.c:86:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/hw_breakpoint.c:86:9: sparse: sparse: cast from unknown type
--
   arch/loongarch/kernel/cpu-probe.c:150:18: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
>> arch/loongarch/kernel/cpu-probe.c:150:18: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/cpu-probe.c:155:18: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/cpu-probe.c:155:18: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/cpu-probe.c:159:18: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/cpu-probe.c:159:18: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/cpu-probe.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, ...):
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:25: sparse: sparse: undefined identifier '__builtin_loongarch_cpucfg'
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:284:25: sparse: sparse: undefined identifier '__builtin_loongarch_iocsrrd_w'
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:284:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:294:30: sparse: sparse: undefined identifier '__builtin_loongarch_iocsrrd_d'
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:294:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:294:11: sparse: sparse: cast from unknown type
--
   arch/loongarch/kernel/irq.c:111:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
>> arch/loongarch/kernel/irq.c:111:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/irq.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
--
   arch/loongarch/kernel/traps.c:437:6: sparse: sparse: symbol 'force_fcsr_sig' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:532:25: sparse: sparse: symbol 'do_ale' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:593:25: sparse: sparse: symbol 'do_bce' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:771:30: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
>> arch/loongarch/kernel/traps.c:771:30: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:781:25: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/kernel/traps.c:781:25: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:782:25: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/kernel/traps.c:782:25: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:798:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/kernel/traps.c:798:33: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:870:25: sparse: sparse: symbol 'do_lsx' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:881:25: sparse: sparse: symbol 'do_lasx' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:892:25: sparse: sparse: symbol 'do_lbt' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:926:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/kernel/traps.c:926:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:927:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/traps.c:927:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:931:25: sparse: sparse: symbol 'handle_loongarch_irq' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:984:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/traps.c:984:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:985:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/traps.c:985:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:986:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/traps.c:986:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, ...):
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:25: sparse: sparse: undefined identifier '__builtin_loongarch_cpucfg'
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1161:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1161:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1161:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1161:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c: note: in included file:
   arch/loongarch/include/asm/fpu.h:43:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
>> arch/loongarch/include/asm/fpu.h:43:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1161:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:428:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
   arch/loongarch/kernel/traps.c:428:9: sparse: sparse: cast from unknown type
--
   arch/loongarch/kernel/process.c:152:30: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
>> arch/loongarch/kernel/process.c:152:30: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/process.c:153:30: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/kernel/process.c:153:30: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/process.c:154:30: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/kernel/process.c:154:30: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/process.c:225:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long [noderef] __percpu * @@
   arch/loongarch/kernel/process.c:225:46: sparse:     expected void *ptr
   arch/loongarch/kernel/process.c:225:46: sparse:     got unsigned long [noderef] __percpu *
   arch/loongarch/kernel/process.c:225:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long [noderef] __percpu * @@
   arch/loongarch/kernel/process.c:225:46: sparse:     expected void *ptr
   arch/loongarch/kernel/process.c:225:46: sparse:     got unsigned long [noderef] __percpu *
   arch/loongarch/kernel/process.c:225:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long [noderef] __percpu * @@
   arch/loongarch/kernel/process.c:225:46: sparse:     expected void *ptr
   arch/loongarch/kernel/process.c:225:46: sparse:     got unsigned long [noderef] __percpu *
   arch/loongarch/kernel/process.c:225:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long [noderef] __percpu * @@
   arch/loongarch/kernel/process.c:225:46: sparse:     expected void *ptr
   arch/loongarch/kernel/process.c:225:46: sparse:     got unsigned long [noderef] __percpu *
   arch/loongarch/kernel/process.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: cast from unknown type
--
   arch/loongarch/kernel/time.c:38:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
>> arch/loongarch/kernel/time.c:38:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/time.c:51:24: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/time.c:51:24: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/time.c:54:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/time.c:54:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/time.c:67:24: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/time.c:67:24: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/time.c:69:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/time.c:69:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/time.c:86:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/time.c:86:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/time.c:104:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/time.c:104:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/time.c:128:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/time.c:128:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/time.c:228:37: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/time.c:228:37: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/time.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, ...):
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:25: sparse: sparse: undefined identifier '__builtin_loongarch_cpucfg'
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
--
   arch/loongarch/kernel/ptrace.c:890:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
>> arch/loongarch/kernel/ptrace.c:890:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/ptrace.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, ...):
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:25: sparse: sparse: undefined identifier '__builtin_loongarch_cpucfg'
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
--
   arch/loongarch/kernel/acpi.c:165:40: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
>> arch/loongarch/kernel/acpi.c:165:40: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/acpi.c:252:13: sparse: sparse: symbol 'acpi_numa_arch_fixup' was not declared. Should it be static?
--
   arch/loongarch/kernel/smp.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, ...):
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:332:3: sparse: sparse: undefined identifier '__builtin_loongarch_iocsrwr_d'
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:284:25: sparse: sparse: undefined identifier '__builtin_loongarch_iocsrrd_w'
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:284:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:322:3: sparse: sparse: undefined identifier '__builtin_loongarch_iocsrwr_w'
   arch/loongarch/kernel/smp.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/smp.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, ...):
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:294:30: sparse: sparse: undefined identifier '__builtin_loongarch_iocsrrd_d'
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:294:11: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/smp.c: note: in included file (through include/linux/irqflags.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   arch/loongarch/include/asm/percpu.h:26:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
>> arch/loongarch/include/asm/percpu.h:26:9: sparse: sparse: cast from unknown type
>> arch/loongarch/include/asm/percpu.h:26:9: sparse: sparse: cast from unknown type
--
   arch/loongarch/mm/tlb.c:147:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
>> arch/loongarch/mm/tlb.c:147:9: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:149:15: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/mm/tlb.c:149:15: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:152:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/tlb.c:152:9: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:153:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/tlb.c:153:9: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:187:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/tlb.c:187:9: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:189:15: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/mm/tlb.c:189:15: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:191:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/tlb.c:191:9: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:192:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/tlb.c:192:9: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:225:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/tlb.c:225:9: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:226:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/tlb.c:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:227:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/tlb.c:227:9: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:228:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/tlb.c:228:9: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:229:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/tlb.c:229:9: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:292:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/tlb.c:292:17: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:293:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/tlb.c:293:17: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:294:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/tlb.c:294:17: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c:302:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/mm/tlb.c:302:9: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c: note: in included file:
   arch/loongarch/include/asm/mmu_context.h:135:16: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/mmu_context.h:135:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/mmu_context.h:140:25: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/mmu_context.h:140:25: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/mmu_context.h:135:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/mmu_context.h:140:25: sparse: sparse: cast from unknown type
   arch/loongarch/mm/tlb.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1176:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
   arch/loongarch/include/asm/loongarch.h:1176:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1176:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1176:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1176:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1186:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_d'
   arch/loongarch/include/asm/loongarch.h:1186:9: sparse: sparse: cast from unknown type
--
   drivers/irqchip/irq-loongarch-cpu.c:73:30: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
>> drivers/irqchip/irq-loongarch-cpu.c:73:30: sparse: sparse: cast from unknown type
   drivers/irqchip/irq-loongarch-cpu.c:154:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
   drivers/irqchip/irq-loongarch-cpu.c:154:9: sparse: sparse: cast from unknown type
   drivers/irqchip/irq-loongarch-cpu.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1282:1: sparse: sparse: cast from unknown type
--
   kernel/sched/core.c:611:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/core.c:611:9: sparse:     expected void *ptr
   kernel/sched/core.c:611:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/sched/core.c:611:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/core.c:611:9: sparse:     expected void *ptr
   kernel/sched/core.c:611:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/sched/core.c:611:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/core.c:611:9: sparse:     expected void *ptr
   kernel/sched/core.c:611:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/sched/core.c:611:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/core.c:611:9: sparse:     expected void *ptr
   kernel/sched/core.c:611:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/sched/core.c:611:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/core.c:611:9: sparse:     expected void *ptr
   kernel/sched/core.c:611:9: sparse:     got int [noderef] __percpu *
   kernel/sched/core.c:611:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/core.c:611:9: sparse:     expected void *ptr
   kernel/sched/core.c:611:9: sparse:     got int [noderef] __percpu *
   kernel/sched/core.c:611:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/core.c:611:9: sparse:     expected void *ptr
   kernel/sched/core.c:611:9: sparse:     got int [noderef] __percpu *
   kernel/sched/core.c:611:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/core.c:611:9: sparse:     expected void *ptr
   kernel/sched/core.c:611:9: sparse:     got int [noderef] __percpu *
   kernel/sched/core.c:1043:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1043:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1043:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1101:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1101:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1101:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2212:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2212:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2212:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2212:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2212:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2212:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3685:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3685:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3685:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3898:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3898:28: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3898:28: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:9426:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:9426:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:9426:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5606:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5606:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5606:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6561:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6561:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6561:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7087:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7087:17: sparse:    struct task_struct *
   kernel/sched/core.c:7087:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7303:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7303:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7303:22: sparse:    struct task_struct *
   kernel/sched/core.c:11444:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11444:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11444:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1334:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:551:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/sched.h:1334:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:584:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:600:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:638:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:679:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:97:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:97:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:97:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2203:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2204:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2205:18: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2235:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct *
   kernel/sched/core.c:2178:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2178:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2178:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2235:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2235:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file (through include/linux/mmu_context.h, include/linux/cpuset.h):
   arch/loongarch/include/asm/mmu_context.h:86:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
>> arch/loongarch/include/asm/mmu_context.h:86:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/mmu_context.h:89:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/include/asm/mmu_context.h:89:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/mmu_context.h:91:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/include/asm/mmu_context.h:91:17: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2235:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2235:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2235:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file (through include/linux/mmu_context.h, include/linux/cpuset.h):
>> arch/loongarch/include/asm/mmu_context.h:86:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/mmu_context.h:89:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/mmu_context.h:91:17: sparse: sparse: cast from unknown type

vim +21 arch/loongarch/lib/dump_tlb.c

559671e04a33b1 Huacai Chen 2022-05-31  16  
559671e04a33b1 Huacai Chen 2022-05-31  17  void dump_tlb_regs(void)
559671e04a33b1 Huacai Chen 2022-05-31  18  {
559671e04a33b1 Huacai Chen 2022-05-31  19  	const int field = 2 * sizeof(unsigned long);
559671e04a33b1 Huacai Chen 2022-05-31  20  
ad6846196ab622 Huacai Chen 2022-08-31 @21  	pr_info("Index    : 0x%0x\n", read_csr_tlbidx());
ad6846196ab622 Huacai Chen 2022-08-31  22  	pr_info("PageSize : 0x%0x\n", read_csr_pagesize());
53a4858ccd0d27 WANG Xuerui 2023-06-29  23  	pr_info("EntryHi  : 0x%0*lx\n", field, read_csr_entryhi());
53a4858ccd0d27 WANG Xuerui 2023-06-29  24  	pr_info("EntryLo0 : 0x%0*lx\n", field, read_csr_entrylo0());
53a4858ccd0d27 WANG Xuerui 2023-06-29  25  	pr_info("EntryLo1 : 0x%0*lx\n", field, read_csr_entrylo1());
559671e04a33b1 Huacai Chen 2022-05-31  26  }
559671e04a33b1 Huacai Chen 2022-05-31  27  

:::::: The code at line 21 was first introduced by commit
:::::: ad6846196ab62287e3ba094bb52647132f1998cd LoongArch: Improve dump_tlb() output messages

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
