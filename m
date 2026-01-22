Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E84938BDB1
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 02:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769049100; cv=none; b=t+pXCr0AifrMH6A4BkAjWa66ZpKLsVxNZ3n9L1VzFFl8w6mKBt0twFEDV5A2B9yLb1BW1Vystd0AT0sDsJ0LXESPnKKcoPjomC4WtYw79qK7MoPmtBdAySwC2voWWnaWCl3jnSl9TEPYiEfUhjE0UCmklaRuQ4ze7JtBMgRz3/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769049100; c=relaxed/simple;
	bh=eaelwPoWnjpMYV48ccK5Efi1pzaWu/8XkF6AQRroLuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rL3Kaekwd77p4J9t9u1a3IErfpLJonVPCy3s2PP+iWifIU111Z8+h6m2urvsYUOob5hWbJBBN0xzFtc7sQvN75dyvQFKa0Hff0bc4gJWJ7tUMhieF8ojM5kIYlMjwKQs9MjxZcBGkCPHiQwz/kqbG34weyqzeqkcvqR+BSF/c5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxQc9tl6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxQc9tl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769049099; x=1800585099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eaelwPoWnjpMYV48ccK5Efi1pzaWu/8XkF6AQRroLuE=;
  b=nxQc9tl6sEnKNbKULYITcuDp/uBm1Puk9boy52dNF3shsb78SV99iR2/
   lSfb7TWI/MZc/gdWPSionbZX9lHSniV1mqrPSFmeAXaxNJzELPLfKmTXa
   abmvUMMf6Pe2h1DC1AFP+dzodMZLrRphFodAda91qqS9fAh03iqPEifFp
   sBluPAdZiGKjZya5GCbjOFKL+PV9nOJnzsbu4TzSy6i8SgTkUhC/2t/Sf
   Ngku0a1ucvAwBfJ3VPC0rbSZFxYEshqH0nYeKgPFrLtKpCF3gdM6Qj9WF
   KQQPyewzZJsJyCJJv+CLqD+8KPjWzXBJis0RW3Dm7Zj/eRL99I9c/EI1p
   g==;
X-CSE-ConnectionGUID: 09X+MkVnS5WDQKNGiJrjFQ==
X-CSE-MsgGUID: c1c1r1YbT+OO/OBr2jnuSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69484796"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="69484796"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:31:38 -0800
X-CSE-ConnectionGUID: q4kOLKmVTX+KaI+ZbKOVzw==
X-CSE-MsgGUID: ii8+JLjKQh+KqFNbErTWhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="206516202"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 18:31:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vikTm-00000000SKT-1pQo;
	Thu, 22 Jan 2026 02:31:26 +0000
Date: Thu, 22 Jan 2026 10:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [i915-rt v5 20/21] PREEMPT_RT injection
Message-ID: <202601221005.8Vj6ZL2p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260121135318.651622-21-dev@lankhorst.se>
References: <20260121135318.651622-21-dev@lankhorst.se>
TO: Maarten Lankhorst <dev@lankhorst.se>
TO: intel-gfx@lists.freedesktop.org
TO: intel-xe@lists.freedesktop.org
CC: Maarten Lankhorst <dev@lankhorst.se>

Hi Maarten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20260121]
[cannot apply to drm-i915/for-linux-next-fixes drm-xe/drm-xe-next linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-i915-display-Fix-intel_lpe_audio_irq_handler-for-PREEMPT-RT/20260121-223353
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260121135318.651622-21-dev%40lankhorst.se
patch subject: [i915-rt v5 20/21] PREEMPT_RT injection
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-r133-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221005.8Vj6ZL2p-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221005.8Vj6ZL2p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601221005.8Vj6ZL2p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   kernel/locking/rwsem.c: note: in included file:
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'task_blocks_on_rt_mutex' - unexpected unlock
   kernel/locking/rwsem.c: note: in included file:
   kernel/locking/rtmutex.c:1672:9: sparse: sparse: context imbalance in 'rt_mutex_handle_deadlock' - unexpected unlock
   kernel/locking/rwsem.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, ...):
>> arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow
>> arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow
>> arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow
>> arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow
>> arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow
>> arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow
>> arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
   kernel/locking/spinlock_rt.c: note: in included file (through include/linux/sched/signal.h, kernel/locking/rtmutex.c):
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'task_blocks_on_rt_mutex' - unexpected unlock
   kernel/locking/spinlock_rt.c:62:14: sparse: sparse: context imbalance in 'rt_spin_lock_nested' - wrong count at exit
   kernel/locking/spinlock_rt.c:69:14: sparse: sparse: context imbalance in 'rt_spin_lock_nest_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:113:9: sparse: sparse: context imbalance in 'rt_spin_trylock' - wrong count at exit
   kernel/locking/spinlock_rt.c:130:9: sparse: sparse: context imbalance in 'rt_spin_trylock_bh' - wrong count at exit
   kernel/locking/spinlock_rt.c: note: in included file (through include/linux/atomic.h, include/linux/cpumask.h, include/linux/smp.h, ...):
>> arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow
   kernel/locking/spinlock_rt.c:211:9: sparse: sparse: context imbalance in 'rt_read_trylock' - wrong count at exit
>> arch/riscv/include/asm/atomic.h:74:1: sparse: sparse: constant integer operation overflow
   kernel/locking/spinlock_rt.c:225:9: sparse: sparse: context imbalance in 'rt_write_trylock' - wrong count at exit

vim +74 arch/riscv/include/asm/atomic.h

fab957c11efe2f4 Palmer Dabbelt 2017-07-10  72  
4650d02ad2d9b2c Palmer Dabbelt 2017-11-14  73  ATOMIC_OPS(add, add,  i)
4650d02ad2d9b2c Palmer Dabbelt 2017-11-14 @74  ATOMIC_OPS(sub, add, -i)
4650d02ad2d9b2c Palmer Dabbelt 2017-11-14  75  ATOMIC_OPS(and, and,  i)
4650d02ad2d9b2c Palmer Dabbelt 2017-11-14  76  ATOMIC_OPS( or,  or,  i)
4650d02ad2d9b2c Palmer Dabbelt 2017-11-14  77  ATOMIC_OPS(xor, xor,  i)
fab957c11efe2f4 Palmer Dabbelt 2017-07-10  78  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
