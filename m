Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865F1340DB8
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 17:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102972; cv=none; b=AM6xr8OM2zlOn8VsLncDkxzZttFFEPJ9vi0+ljzaIWO5R/E4bBcVIMXqif5lecvNXFiF3fRtAGxrmIsloUWg3CKiufflwhhDZn77QyNHw7ZisolVHAj2FTSowyG9EE4kY9alwpxePDyWKo5pw7M5z9JCjyKfwWeg0JVmLQlh0o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102972; c=relaxed/simple;
	bh=ICR0dQfE+UmcpFVOmxS32LqipA2fHcPBeS6pnThLZVc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LL7ZbQTEsj36P+FP+f8Swq+/Udt8w1cFcUVnCiiKjPHOdz3ra53Z2J/z/3X6DDNegqeKaqrj8T/c6+VMFm/xqknJkj+mG7cL/k6c8zkj2ltmg9/qkN3XqayCEewe2SdbzttTHXVFg+7zDPsrlFH98P3o7DAbCH6L9JInQVjkYpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pm5wpuN0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pm5wpuN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769102959; x=1800638959;
  h=date:from:to:cc:subject:message-id;
  bh=ICR0dQfE+UmcpFVOmxS32LqipA2fHcPBeS6pnThLZVc=;
  b=Pm5wpuN0fDDvLv/AtvRdhOS6HSBO1p4h5E0N2i99yFKg9/3yycIvohc+
   iVbyZpjJcvFNCBrwNqDuS0pjiOMWhmMeXePTHGLjMdWhtKEfHwkqa8o5V
   sRloS4HabR72D9NDg/ms6N+DWgOAMLFEHZZp+IoVWSzNwAlDkzwpBTAzx
   6rKR8iSDJJ2MWFb/0GooNif5ZViRVlxcFOq9vSUR4Y+NM5Gx/flXObTC7
   mL7RCt0F4TOoyukExfvKpM10XB8eYFnOEGyH+IlFpBF083aNHCfxrZgiQ
   l5muZihDjLbcgy9chKHP1l35AR8H1ALwmuwLA0ZMhYnd5Ph9zLXbdxr9r
   Q==;
X-CSE-ConnectionGUID: q4+wycsPQF+0wEEz5XPpmg==
X-CSE-MsgGUID: KjQoisp1RJqOS9V5uFKt/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="80977164"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="80977164"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 09:29:15 -0800
X-CSE-ConnectionGUID: cPy5ri5BQVyBouYRAsTdPg==
X-CSE-MsgGUID: M7b/Q8+dTAWogHBmWgURwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206609381"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Jan 2026 09:29:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viyUZ-00000000T6X-1H0d;
	Thu, 22 Jan 2026 17:29:11 +0000
Date: Fri, 23 Jan 2026 01:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/include/asm/atomic-amo.h:61:1: sparse:
 sparse: constant integer operation overflow
Message-ID: <202601230110.HxVebgVt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/UPDATE-20260122-080713/Maarten-Lankhorst/drm-i915-display-Fix-intel_lpe_audio_irq_handler-for-PREEMPT-RT/20260121-223353, commit: c6f291a565e435e5ef053b9e7536d28677378113"
:::::: Manual check reason: "low confidence static check first_new_problem: arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Maarten Lankhorst <dev@lankhorst.se>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20260122-080713/Maarten-Lankhorst/drm-i915-display-Fix-intel_lpe_audio_irq_handler-for-PREEMPT-RT/20260121-223353
head:   54e8059723c313d39173b4076a2b18840a9cd49c
commit: c6f291a565e435e5ef053b9e7536d28677378113 PREEMPT_RT injection
date:   17 hours ago
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: loongarch-randconfig-r132-20260122 (https://download.01.org/0day-ci/archive/20260123/202601230110.HxVebgVt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230110.HxVebgVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601230110.HxVebgVt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/locking/spinlock_rt.c: note: in included file (through include/linux/sched/signal.h, kernel/locking/rtmutex.c):
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'task_blocks_on_rt_mutex' - unexpected unlock
   kernel/locking/spinlock_rt.c:62:14: sparse: sparse: context imbalance in 'rt_spin_lock_nested' - wrong count at exit
   kernel/locking/spinlock_rt.c:69:14: sparse: sparse: context imbalance in 'rt_spin_lock_nest_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:113:9: sparse: sparse: context imbalance in 'rt_spin_trylock' - wrong count at exit
   kernel/locking/spinlock_rt.c:130:9: sparse: sparse: context imbalance in 'rt_spin_trylock_bh' - wrong count at exit
   kernel/locking/spinlock_rt.c: note: in included file (through arch/loongarch/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow
   kernel/locking/spinlock_rt.c:211:9: sparse: sparse: context imbalance in 'rt_read_trylock' - wrong count at exit
>> arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow
   kernel/locking/spinlock_rt.c:225:9: sparse: sparse: context imbalance in 'rt_write_trylock' - wrong count at exit
--
   kernel/locking/rwsem.c: note: in included file:
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'task_blocks_on_rt_mutex' - unexpected unlock
   kernel/locking/rwsem.c: note: in included file:
   kernel/locking/rtmutex.c:1672:9: sparse: sparse: context imbalance in 'rt_mutex_handle_deadlock' - unexpected unlock
   kernel/locking/rwsem.c: note: in included file (through arch/loongarch/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow
>> arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow
>> arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow
>> arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow
>> arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow
>> arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow
>> arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow

vim +61 arch/loongarch/include/asm/atomic-amo.h

79974cc3ba45f3 Huacai Chen 2025-12-06  52  
79974cc3ba45f3 Huacai Chen 2025-12-06  53  #define ATOMIC_OPS(op, I, asm_op, c_op)					\
79974cc3ba45f3 Huacai Chen 2025-12-06  54  	ATOMIC_OP(op, I, asm_op)					\
79974cc3ba45f3 Huacai Chen 2025-12-06  55  	ATOMIC_OP_RETURN(op, I, asm_op, c_op, _db,         )		\
79974cc3ba45f3 Huacai Chen 2025-12-06  56  	ATOMIC_OP_RETURN(op, I, asm_op, c_op,    , _relaxed)		\
79974cc3ba45f3 Huacai Chen 2025-12-06  57  	ATOMIC_FETCH_OP(op, I, asm_op, _db,         )			\
79974cc3ba45f3 Huacai Chen 2025-12-06  58  	ATOMIC_FETCH_OP(op, I, asm_op,    , _relaxed)
79974cc3ba45f3 Huacai Chen 2025-12-06  59  
79974cc3ba45f3 Huacai Chen 2025-12-06  60  ATOMIC_OPS(add, i, add, +)
79974cc3ba45f3 Huacai Chen 2025-12-06 @61  ATOMIC_OPS(sub, -i, add, +)
79974cc3ba45f3 Huacai Chen 2025-12-06  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
