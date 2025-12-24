Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF451531C1
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 00:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766535740; cv=none; b=tKZMnlSnX3TlQ7NkJMWXGzsy41YFJLd5LXynRkf6Gx8e8vW0dF3ejh4AmkUpkV5PQcBmMnLZSIHjVjJ7bho1yv5mRCH+ed+AeLblztGmXHlzam9TPuiaNfx5bRTFt2VhJgitXM9QHldBHQYYlt2yHEe6NskUChVfdnoC57tXSG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766535740; c=relaxed/simple;
	bh=nKAVlHsmeml+c9njFuY7JN0CjkWKV6z3p50x30n/oFQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KdBapuROlwjNmVQYdGwA/P3s1uLkCZoSsU0JR/kRevPsl+tT3r5ci2qlI7UKHfY/uNMSs5fKNYy72nUDqR0fYo7AjPb/ol4dQEVVrb1tmJ4erR9fXdSfNXbHvRTi0qWrKLMzbZFATKyN6AGbSWnTWcnvqdRtXO3SzCJuiQJJtz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuaVHpOo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuaVHpOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766535738; x=1798071738;
  h=date:from:to:cc:subject:message-id;
  bh=nKAVlHsmeml+c9njFuY7JN0CjkWKV6z3p50x30n/oFQ=;
  b=NuaVHpOo2dwMCGzHs+IjhJcFZAAHO/tScVF2If7oJgW02p+9JL1BN+nC
   PUC5rQ6cyLARhnvttDXoBKOMh4NQ0a+g6UN5XYDS1ryDBauc7WZ3bv4AM
   oByPapZ8xSimSvhXvAM0fqZXm5R2PYt0YuU6X/pxmfjFYidrJO1Me0fEC
   xxa556UPJwI9dqhLJe7+v5LKICeroYxh/F2qluPosxL1MCFsBqSBFNLu6
   zVjWTT6mNObxm2miKHfuE1JGJ4TuIkgBRGXj1n8VLHW+hiR6h4KBTvi4t
   XakSNEfjNag3+3foKUAtvGfRTFmrmSdMXrj/ksaiqCdjyjrrbAf8RG+VC
   A==;
X-CSE-ConnectionGUID: gzt98C9VRMiL8ACX4EqkRQ==
X-CSE-MsgGUID: /ea9BeFbTwiKEP6lfqoBqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79104490"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="79104490"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 16:22:18 -0800
X-CSE-ConnectionGUID: 86QjCUQ3RvCzknMd8O46Mw==
X-CSE-MsgGUID: OLhOrm8KT2iHe+gbmLbjpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="204822809"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Dec 2025 16:22:16 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYCdS-000000002VN-49xv;
	Wed, 24 Dec 2025 00:22:11 +0000
Date: Wed, 24 Dec 2025 08:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v6.19-rc1
 13/13] kernel/fork.c:413:25: sparse: sparse: unsigned value that used to be
 signed checked against zero?
Message-ID: <202512240830.ADNWhYQp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: kernel/fork.c:413:25: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v6.19-rc1
head:   c5dbbed8f81c183bdc77059ec990829129c3ae7a
commit: c5dbbed8f81c183bdc77059ec990829129c3ae7a [13/13] arm64: Support dynamic kernel stacks
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-r121-20251223 (https://download.01.org/0day-ci/archive/20251224/202512240830.ADNWhYQp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240830.ADNWhYQp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512240830.ADNWhYQp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/fork.c:1973:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1973:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1973:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1982:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1982:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1982:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1983:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1983:36: sparse:     expected void const *
   kernel/fork.c:1983:36: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1984:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1984:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1984:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2082:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/fork.c:2082:9: sparse:     expected struct qspinlock *lock
   kernel/fork.c:2082:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/fork.c:2367:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2367:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2367:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2371:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2371:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2371:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2703:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   kernel/fork.c:2703:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2703:32: sparse:     got struct task_struct *
   kernel/fork.c:2712:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2712:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2712:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2761:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2761:54: sparse:     expected struct list_head *head
   kernel/fork.c:2761:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2781:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2781:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2781:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2803:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2803:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2803:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2832:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2832:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2832:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2864:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2864:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2864:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2866:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2866:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2866:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:3305:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:3305:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:3305:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3388:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3388:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3388:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:283:13: sparse: sparse: context imbalance in 'global_dynstack_refill_work' - wrong count at exit
   kernel/fork.c:384:20: sparse: sparse: context imbalance in 'dynamic_stack_get_page' - different lock contexts for basic block
>> kernel/fork.c:413:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   kernel/fork.c:413:21: sparse: signed value source
   kernel/fork.c:431:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   kernel/fork.c:431:21: sparse: signed value source
   kernel/fork.c: note: in included file (through arch/arm64/include/asm/vmalloc.h, include/linux/vmalloc.h):
   arch/arm64/include/asm/pgtable.h:424:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:424:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:424:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:424:16: sparse: sparse: cast from non-scalar
   kernel/fork.c:2221:36: sparse: sparse: context imbalance in 'pidfd_prepare' - different lock contexts for basic block
   kernel/fork.c:2417:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/linux/ftrace.h, include/linux/kprobes.h, include/linux/kgdb.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2759:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2760:59: sparse: sparse: dereference of noderef expression

vim +413 kernel/fork.c

57d775e01f7ef9 Linus Walleij  2025-05-03  407  
73c4a4effb4aea Pasha Tatashin 2024-03-11  408  static int dynamic_stack_refill_pages_cpu(unsigned int cpu)
73c4a4effb4aea Pasha Tatashin 2024-03-11  409  {
73c4a4effb4aea Pasha Tatashin 2024-03-11  410  	struct page **pages = per_cpu_ptr(dynamic_stack_pages, cpu);
73c4a4effb4aea Pasha Tatashin 2024-03-11  411  	int i;
73c4a4effb4aea Pasha Tatashin 2024-03-11  412  
73c4a4effb4aea Pasha Tatashin 2024-03-11 @413  	for (i = 0; i < THREAD_DYNAMIC_PAGES; i++) {
73c4a4effb4aea Pasha Tatashin 2024-03-11  414  		if (pages[i])
73c4a4effb4aea Pasha Tatashin 2024-03-11  415  			break;
73c4a4effb4aea Pasha Tatashin 2024-03-11  416  		pages[i] = alloc_pages(GFP_VMAP_STACK, 0);
73c4a4effb4aea Pasha Tatashin 2024-03-11  417  		if (unlikely(!pages[i])) {
73c4a4effb4aea Pasha Tatashin 2024-03-11  418  			pr_err("failed to allocate dynamic stack page for cpu[%d]\n",
73c4a4effb4aea Pasha Tatashin 2024-03-11  419  			       cpu);
73c4a4effb4aea Pasha Tatashin 2024-03-11  420  		}
73c4a4effb4aea Pasha Tatashin 2024-03-11  421  	}
73c4a4effb4aea Pasha Tatashin 2024-03-11  422  
73c4a4effb4aea Pasha Tatashin 2024-03-11  423  	return 0;
73c4a4effb4aea Pasha Tatashin 2024-03-11  424  }
73c4a4effb4aea Pasha Tatashin 2024-03-11  425  

:::::: The code at line 413 was first introduced by commit
:::::: 73c4a4effb4aea258fa709b0dab6c89140eab307 fork: Dynamic Kernel Stacks

:::::: TO: Pasha Tatashin <pasha.tatashin@soleen.com>
:::::: CC: Linus Walleij <linusw@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
