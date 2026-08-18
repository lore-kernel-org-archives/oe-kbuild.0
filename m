Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAE62DECA3
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Aug 2026 07:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787037244; cv=none; b=eLs0MliNZqoM3pYLn9y36XsaUmW6fEwRKFA2firOQBT8hre8EV12qru/ecpXRxksc+yyMgO4DAYYCIC8U7M/0Rk735HL0kGORvjaa7Ow2lFhH96OKuL5FiWB3czzLx5V6GUkYfWVQGAq1qb0z+9v6iIe9o0dRW+iPtxL/qhoXYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787037244; c=relaxed/simple;
	bh=H73HMWNUKOtojNY18BO74MRILJxJZg8Fb9jlYOMnRbQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lj6BrCcYrCFB8aSymCsOZ8Je+xsj5WN1mTfXAI/9tAEnXYfmFt/OMsJJdqVY1ry+z7aHh5mvnnKMTPyPQpbks9JHhc8acTCkmnwrJ0v9RlEJfi8mkNCN2BQNRml2c3pQTCRLhyi+qw77lNEw9Qe4T1OtexjJBhsYnMsGvy+XLR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nqv8scn3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nqv8scn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787037239; x=1818573239;
  h=date:from:to:cc:subject:message-id;
  bh=H73HMWNUKOtojNY18BO74MRILJxJZg8Fb9jlYOMnRbQ=;
  b=Nqv8scn3xpCsvkVz1BqpcoTzlDdYFAZQfV4mxRCARq/Dl7axVn8WLnLv
   ol1ExXQiTsSmODhMOQMymy6hts8mUGATZ47ZqQhktohNH49DmCRxnRjiT
   dhbjyqss/+opAQIH39I8ggHIpS/lQiZWnxoRJbkzez0u4JP3JV7heW4LW
   viY0Fjr2lutu9mmzwTwmf92nksqvGyXTePXioi4o2wu9Ih0VSg0TWSLTi
   4T7wBUnlUPVoXWK+qsRNcUz/kb+mZYOApb7VxEPTKiLE1ff6pgfOOcTA1
   a4XFZv0Qql7Ry1HhsGJsu+VYMSooDJL/c0Px+PJHRz1RirASvQC3wN5bS
   w==;
X-CSE-ConnectionGUID: z7nHBFO+S52g+vGPHcWP3g==
X-CSE-MsgGUID: BX+0KTltQkyPIwI3Hll1NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="104903615"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="104903615"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:13:56 -0700
X-CSE-ConnectionGUID: 86WEVp0tRWeZIRXgRjtx4A==
X-CSE-MsgGUID: /Mj7/Q8ERzuQhXZPDdGXQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="265753269"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Aug 2026 00:13:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwE1A-00000000eAw-3aQ7;
	Tue, 18 Aug 2026 07:13:52 +0000
Date: Tue, 18 Aug 2026 15:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:locking/core 25/39] include/asm-generic/preempt.h:66:9:
 sparse: sparse: Trying to use reserved word 'return' as identifier
Message-ID: <202608181549.R5uJY3vI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/asm-generic/preempt.h:66:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Boqun Feng <boqun@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   ec4fad7c2bdc80c62fa73f799b77ad299f73dcc3
commit: 4ad87eee546ef97e3a5ad80414327f41f48a4e70 [25/39] preempt: Introduce __preempt_count_{sub,add}_return()
:::::: branch date: 8 days ago
:::::: commit date: 9 days ago
config: powerpc64-randconfig-r113-20260817 (https://download.01.org/0day-ci/archive/20260818/202608181549.R5uJY3vI-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181549.R5uJY3vI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608181549.R5uJY3vI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/thread_info.h:119:1: sparse: sparse: got }
   include/linux/thread_info.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:124:1: sparse: sparse: got }
   include/linux/thread_info.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:129:1: sparse: sparse: got }
   include/linux/thread_info.h:134:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:134:1: sparse: sparse: got }
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ) in function declarator
   include/linux/thread_info.h:142:16: sparse: sparse: got !
   include/linux/thread_info.h:142:16: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:142:16: sparse: sparse: got }
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ) in nested declarator
   include/linux/thread_info.h:142:16: sparse: sparse: got volatile
   include/linux/thread_info.h:142:16: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:142:16: sparse: sparse: got }
   include/linux/thread_info.h:143:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:143:1: sparse: sparse: got }
   include/linux/thread_info.h:209:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:209:1: sparse: sparse: got }
   include/linux/thread_info.h:216:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:216:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/ptrace.h:261:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:261:20: sparse: sparse: got trap_is_scv
   arch/powerpc/include/asm/ptrace.h:264:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:264:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:269:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:269:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:274:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:274:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:279:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:284:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:291:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/ptrace.h:292:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:292:17: sparse: sparse: got return
   arch/powerpc/include/asm/ptrace.h:293:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:293:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:300:31: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/ptrace.h:300:31: sparse: sparse: got (
   arch/powerpc/include/asm/ptrace.h:300:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/ptrace.h:302:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/ptrace.h:303:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:303:17: sparse: sparse: got return
   arch/powerpc/include/asm/ptrace.h:304:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:304:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:309:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:309:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:314:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:314:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:319:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:319:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:325:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:325:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:331:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:331:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:373:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:373:20: sparse: sparse: got regs_within_kernel_stack
   arch/powerpc/include/asm/ptrace.h:378:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:378:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:393:14: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:393:14: sparse: sparse: got +=
   arch/powerpc/include/asm/ptrace.h:394:37: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/ptrace.h:394:37: sparse: sparse: got (
   arch/powerpc/include/asm/ptrace.h:394:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/ptrace.h:396:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/ptrace.h:397:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:397:17: sparse: sparse: got return
   arch/powerpc/include/asm/ptrace.h:398:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:398:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:414:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/ptrace.h:414:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:414:16: sparse: sparse: got 0
   arch/powerpc/include/asm/ptrace.h:415:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:415:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:21:25: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:21:25: sparse: sparse: got perf_single_step
   arch/powerpc/include/asm/hw_breakpoint.h:22:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:22:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_breakpoint.h:59:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:59:6: sparse: sparse: got wp_check_constraints
   arch/powerpc/include/asm/hw_breakpoint.h:116:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:116:13: sparse: sparse: got dawr_force_enable
   arch/powerpc/include/asm/hw_breakpoint.h:117:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:117:20: sparse: sparse: got dawr_enabled
   arch/powerpc/include/asm/hw_breakpoint.h:120:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:120:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/asm-generic/preempt.h:43:29: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/preempt.h:43:29: sparse: sparse: got test_preempt_need_resched
   include/asm-generic/preempt.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:46:1: sparse: sparse: got }
   include/asm-generic/preempt.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:55:1: sparse: sparse: got }
   include/asm-generic/preempt.h:60:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:60:1: sparse: sparse: got }
>> include/asm-generic/preempt.h:66:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/preempt.h:66:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/preempt.h:66:16: sparse: sparse: got *
   include/asm-generic/preempt.h:67:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:67:1: sparse: sparse: got }
   include/asm-generic/preempt.h:73:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/preempt.h:73:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/preempt.h:73:16: sparse: sparse: got *
   include/asm-generic/preempt.h:74:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:74:1: sparse: sparse: got }
   include/asm-generic/preempt.h:84:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:84:1: sparse: sparse: got }
   include/asm-generic/preempt.h:93:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:93:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:479:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:479:1: sparse: sparse: got class_preempt_is_conditional
   include/linux/preempt.h:480:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:480:1: sparse: sparse: got class_preempt_notrace_is_conditional
   include/linux/preempt.h:484:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:484:13: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:485:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:485:13: sparse: sparse: got preempt_model_voluntary
   include/linux/preempt.h:486:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:486:13: sparse: sparse: got preempt_model_full
   include/linux/preempt.h:487:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:487:13: sparse: sparse: got preempt_model_lazy
   include/linux/preempt.h:511:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:511:20: sparse: sparse: got preempt_model_rt
   include/linux/preempt.h:514:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:514:1: sparse: sparse: got }
   include/linux/preempt.h:526:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:526:20: sparse: sparse: got preempt_model_preemptible
   include/linux/preempt.h:529:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:529:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/cpumask_types.h:9:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask_types.h:9:57: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/atomic.h, include/linux/mutex_types.h, include/linux/futex_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: got raw_atomic_try_cmpxchg
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2140:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2142:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2174:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2207:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2237:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2500:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2505:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: got true
--
   include/linux/thread_info.h:119:1: sparse: sparse: got }
   include/linux/thread_info.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:124:1: sparse: sparse: got }
   include/linux/thread_info.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:129:1: sparse: sparse: got }
   include/linux/thread_info.h:134:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:134:1: sparse: sparse: got }
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ) in function declarator
   include/linux/thread_info.h:142:16: sparse: sparse: got !
   include/linux/thread_info.h:142:16: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:142:16: sparse: sparse: got }
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ) in nested declarator
   include/linux/thread_info.h:142:16: sparse: sparse: got volatile
   include/linux/thread_info.h:142:16: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:142:16: sparse: sparse: got }
   include/linux/thread_info.h:143:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:143:1: sparse: sparse: got }
   include/linux/thread_info.h:209:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:209:1: sparse: sparse: got }
   include/linux/thread_info.h:216:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:216:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/ptrace.h:261:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:261:20: sparse: sparse: got trap_is_scv
   arch/powerpc/include/asm/ptrace.h:264:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:264:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:269:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:269:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:274:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:274:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:279:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:284:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:291:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/ptrace.h:292:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:292:17: sparse: sparse: got return
   arch/powerpc/include/asm/ptrace.h:293:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:293:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:300:31: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/ptrace.h:300:31: sparse: sparse: got (
   arch/powerpc/include/asm/ptrace.h:300:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/ptrace.h:302:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/ptrace.h:303:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:303:17: sparse: sparse: got return
   arch/powerpc/include/asm/ptrace.h:304:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:304:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:309:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:309:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:314:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:314:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:319:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:319:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:325:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:325:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:331:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:331:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:373:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:373:20: sparse: sparse: got regs_within_kernel_stack
   arch/powerpc/include/asm/ptrace.h:378:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:378:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:393:14: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:393:14: sparse: sparse: got +=
   arch/powerpc/include/asm/ptrace.h:394:37: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/ptrace.h:394:37: sparse: sparse: got (
   arch/powerpc/include/asm/ptrace.h:394:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/ptrace.h:396:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/ptrace.h:397:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:397:17: sparse: sparse: got return
   arch/powerpc/include/asm/ptrace.h:398:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:398:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:414:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/ptrace.h:414:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:414:16: sparse: sparse: got 0
   arch/powerpc/include/asm/ptrace.h:415:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:415:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:21:25: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:21:25: sparse: sparse: got perf_single_step
   arch/powerpc/include/asm/hw_breakpoint.h:22:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:22:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_breakpoint.h:59:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:59:6: sparse: sparse: got wp_check_constraints
   arch/powerpc/include/asm/hw_breakpoint.h:116:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:116:13: sparse: sparse: got dawr_force_enable
   arch/powerpc/include/asm/hw_breakpoint.h:117:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:117:20: sparse: sparse: got dawr_enabled
   arch/powerpc/include/asm/hw_breakpoint.h:120:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:120:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/asm-generic/preempt.h:43:29: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/preempt.h:43:29: sparse: sparse: got test_preempt_need_resched
   include/asm-generic/preempt.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:46:1: sparse: sparse: got }
   include/asm-generic/preempt.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:55:1: sparse: sparse: got }
   include/asm-generic/preempt.h:60:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:60:1: sparse: sparse: got }
>> include/asm-generic/preempt.h:66:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/preempt.h:66:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/preempt.h:66:16: sparse: sparse: got *
   include/asm-generic/preempt.h:67:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:67:1: sparse: sparse: got }
   include/asm-generic/preempt.h:73:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/preempt.h:73:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/preempt.h:73:16: sparse: sparse: got *
   include/asm-generic/preempt.h:74:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:74:1: sparse: sparse: got }
   include/asm-generic/preempt.h:84:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:84:1: sparse: sparse: got }
   include/asm-generic/preempt.h:93:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:93:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:479:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:479:1: sparse: sparse: got class_preempt_is_conditional
   include/linux/preempt.h:480:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:480:1: sparse: sparse: got class_preempt_notrace_is_conditional
   include/linux/preempt.h:484:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:484:13: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:485:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:485:13: sparse: sparse: got preempt_model_voluntary
   include/linux/preempt.h:486:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:486:13: sparse: sparse: got preempt_model_full
   include/linux/preempt.h:487:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:487:13: sparse: sparse: got preempt_model_lazy
   include/linux/preempt.h:511:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:511:20: sparse: sparse: got preempt_model_rt
   include/linux/preempt.h:514:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:514:1: sparse: sparse: got }
   include/linux/preempt.h:526:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:526:20: sparse: sparse: got preempt_model_preemptible
   include/linux/preempt.h:529:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:529:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/cpumask_types.h:9:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask_types.h:9:57: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/atomic.h, include/linux/mutex_types.h, include/linux/futex_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: got raw_atomic_try_cmpxchg
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2140:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2142:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2174:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2207:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2237:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2500:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2505:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: got true
--
   include/linux/thread_info.h:119:1: sparse: sparse: got }
   include/linux/thread_info.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:124:1: sparse: sparse: got }
   include/linux/thread_info.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:129:1: sparse: sparse: got }
   include/linux/thread_info.h:134:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:134:1: sparse: sparse: got }
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ) in function declarator
   include/linux/thread_info.h:142:16: sparse: sparse: got !
   include/linux/thread_info.h:142:16: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:142:16: sparse: sparse: got }
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ) in nested declarator
   include/linux/thread_info.h:142:16: sparse: sparse: got volatile
   include/linux/thread_info.h:142:16: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:142:16: sparse: sparse: got }
   include/linux/thread_info.h:143:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:143:1: sparse: sparse: got }
   include/linux/thread_info.h:209:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:209:1: sparse: sparse: got }
   include/linux/thread_info.h:216:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:216:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/ptrace.h:261:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:261:20: sparse: sparse: got trap_is_scv
   arch/powerpc/include/asm/ptrace.h:264:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:264:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:269:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:269:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:274:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:274:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:279:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:284:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:291:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/ptrace.h:292:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:292:17: sparse: sparse: got return
   arch/powerpc/include/asm/ptrace.h:293:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:293:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:300:31: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/ptrace.h:300:31: sparse: sparse: got (
   arch/powerpc/include/asm/ptrace.h:300:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/ptrace.h:302:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/ptrace.h:303:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:303:17: sparse: sparse: got return
   arch/powerpc/include/asm/ptrace.h:304:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:304:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:309:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:309:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:314:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:314:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:319:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:319:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:325:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:325:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:331:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:331:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:373:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:373:20: sparse: sparse: got regs_within_kernel_stack
   arch/powerpc/include/asm/ptrace.h:378:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:378:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:393:14: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:393:14: sparse: sparse: got +=
   arch/powerpc/include/asm/ptrace.h:394:37: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/ptrace.h:394:37: sparse: sparse: got (
   arch/powerpc/include/asm/ptrace.h:394:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/ptrace.h:396:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/ptrace.h:397:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:397:17: sparse: sparse: got return
   arch/powerpc/include/asm/ptrace.h:398:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:398:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:414:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/ptrace.h:414:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:414:16: sparse: sparse: got 0
   arch/powerpc/include/asm/ptrace.h:415:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:415:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:21:25: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:21:25: sparse: sparse: got perf_single_step
   arch/powerpc/include/asm/hw_breakpoint.h:22:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:22:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_breakpoint.h:59:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:59:6: sparse: sparse: got wp_check_constraints
   arch/powerpc/include/asm/hw_breakpoint.h:116:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:116:13: sparse: sparse: got dawr_force_enable
   arch/powerpc/include/asm/hw_breakpoint.h:117:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:117:20: sparse: sparse: got dawr_enabled
   arch/powerpc/include/asm/hw_breakpoint.h:120:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:120:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/asm-generic/preempt.h:43:29: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/preempt.h:43:29: sparse: sparse: got test_preempt_need_resched
   include/asm-generic/preempt.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:46:1: sparse: sparse: got }
   include/asm-generic/preempt.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:55:1: sparse: sparse: got }
   include/asm-generic/preempt.h:60:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:60:1: sparse: sparse: got }
>> include/asm-generic/preempt.h:66:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/preempt.h:66:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/preempt.h:66:16: sparse: sparse: got *
   include/asm-generic/preempt.h:67:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:67:1: sparse: sparse: got }
   include/asm-generic/preempt.h:73:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/preempt.h:73:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/preempt.h:73:16: sparse: sparse: got *
   include/asm-generic/preempt.h:74:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:74:1: sparse: sparse: got }
   include/asm-generic/preempt.h:84:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:84:1: sparse: sparse: got }
   include/asm-generic/preempt.h:93:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:93:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:479:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:479:1: sparse: sparse: got class_preempt_is_conditional
   include/linux/preempt.h:480:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:480:1: sparse: sparse: got class_preempt_notrace_is_conditional
   include/linux/preempt.h:484:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:484:13: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:485:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:485:13: sparse: sparse: got preempt_model_voluntary
   include/linux/preempt.h:486:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:486:13: sparse: sparse: got preempt_model_full
   include/linux/preempt.h:487:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:487:13: sparse: sparse: got preempt_model_lazy
   include/linux/preempt.h:511:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:511:20: sparse: sparse: got preempt_model_rt
   include/linux/preempt.h:514:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:514:1: sparse: sparse: got }
   include/linux/preempt.h:526:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:526:20: sparse: sparse: got preempt_model_preemptible
   include/linux/preempt.h:529:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:529:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/cpumask_types.h:9:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask_types.h:9:57: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/atomic.h, include/linux/mutex_types.h, include/linux/futex_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: got raw_atomic_try_cmpxchg
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2140:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2142:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2174:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2207:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2237:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2500:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2505:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: got true
--
   include/linux/thread_info.h:119:1: sparse: sparse: got }
   include/linux/thread_info.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:124:1: sparse: sparse: got }
   include/linux/thread_info.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:129:1: sparse: sparse: got }
   include/linux/thread_info.h:134:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:134:1: sparse: sparse: got }
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ) in function declarator
   include/linux/thread_info.h:142:16: sparse: sparse: got !
   include/linux/thread_info.h:142:16: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:142:16: sparse: sparse: got }
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ) in nested declarator
   include/linux/thread_info.h:142:16: sparse: sparse: got volatile
   include/linux/thread_info.h:142:16: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/linux/thread_info.h:142:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:142:16: sparse: sparse: got }
   include/linux/thread_info.h:143:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:143:1: sparse: sparse: got }
   include/linux/thread_info.h:209:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:209:1: sparse: sparse: got }
   include/linux/thread_info.h:216:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:216:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/ptrace.h:261:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:261:20: sparse: sparse: got trap_is_scv
   arch/powerpc/include/asm/ptrace.h:264:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:264:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:269:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:269:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:274:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:274:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:279:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:284:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:291:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/ptrace.h:292:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:292:17: sparse: sparse: got return
   arch/powerpc/include/asm/ptrace.h:293:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:293:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:300:31: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/ptrace.h:300:31: sparse: sparse: got (
   arch/powerpc/include/asm/ptrace.h:300:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/ptrace.h:302:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/ptrace.h:303:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:303:17: sparse: sparse: got return
   arch/powerpc/include/asm/ptrace.h:304:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:304:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:309:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:309:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:314:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:314:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:319:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:319:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:325:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:325:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:331:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:331:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:373:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:373:20: sparse: sparse: got regs_within_kernel_stack
   arch/powerpc/include/asm/ptrace.h:378:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:378:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:393:14: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:393:14: sparse: sparse: got +=
   arch/powerpc/include/asm/ptrace.h:394:37: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/ptrace.h:394:37: sparse: sparse: got (
   arch/powerpc/include/asm/ptrace.h:394:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/ptrace.h:396:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/ptrace.h:397:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:397:17: sparse: sparse: got return
   arch/powerpc/include/asm/ptrace.h:398:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:398:1: sparse: sparse: got }
   arch/powerpc/include/asm/ptrace.h:414:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/ptrace.h:414:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/ptrace.h:414:16: sparse: sparse: got 0
   arch/powerpc/include/asm/ptrace.h:415:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/ptrace.h:415:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:21:25: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:21:25: sparse: sparse: got perf_single_step
   arch/powerpc/include/asm/hw_breakpoint.h:22:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:22:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_breakpoint.h:59:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:59:6: sparse: sparse: got wp_check_constraints
   arch/powerpc/include/asm/hw_breakpoint.h:116:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:116:13: sparse: sparse: got dawr_force_enable
   arch/powerpc/include/asm/hw_breakpoint.h:117:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:117:20: sparse: sparse: got dawr_enabled
   arch/powerpc/include/asm/hw_breakpoint.h:120:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:120:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/asm-generic/preempt.h:43:29: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/preempt.h:43:29: sparse: sparse: got test_preempt_need_resched
   include/asm-generic/preempt.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:46:1: sparse: sparse: got }
   include/asm-generic/preempt.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:55:1: sparse: sparse: got }
   include/asm-generic/preempt.h:60:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:60:1: sparse: sparse: got }
>> include/asm-generic/preempt.h:66:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/preempt.h:66:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/preempt.h:66:16: sparse: sparse: got *
   include/asm-generic/preempt.h:67:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:67:1: sparse: sparse: got }
   include/asm-generic/preempt.h:73:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/preempt.h:73:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/preempt.h:73:16: sparse: sparse: got *
   include/asm-generic/preempt.h:74:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:74:1: sparse: sparse: got }
   include/asm-generic/preempt.h:84:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:84:1: sparse: sparse: got }
   include/asm-generic/preempt.h:93:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:93:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:479:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:479:1: sparse: sparse: got class_preempt_is_conditional
   include/linux/preempt.h:480:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:480:1: sparse: sparse: got class_preempt_notrace_is_conditional
   include/linux/preempt.h:484:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:484:13: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:485:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:485:13: sparse: sparse: got preempt_model_voluntary
   include/linux/preempt.h:486:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:486:13: sparse: sparse: got preempt_model_full
   include/linux/preempt.h:487:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:487:13: sparse: sparse: got preempt_model_lazy
   include/linux/preempt.h:511:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:511:20: sparse: sparse: got preempt_model_rt
   include/linux/preempt.h:514:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:514:1: sparse: sparse: got }
   include/linux/preempt.h:526:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:526:20: sparse: sparse: got preempt_model_preemptible
   include/linux/preempt.h:529:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:529:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/cpumask_types.h:9:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask_types.h:9:57: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/atomic.h, include/linux/mutex_types.h, include/linux/futex_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: got raw_atomic_try_cmpxchg
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2140:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2142:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2174:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2207:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2237:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2500:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2505:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: got true

vim +/return +66 include/asm-generic/preempt.h

a787870924dbd6 Peter Zijlstra 2013-08-14  42  
a787870924dbd6 Peter Zijlstra 2013-08-14 @43  static __always_inline bool test_preempt_need_resched(void)
a787870924dbd6 Peter Zijlstra 2013-08-14  44  {
ba1f14fbe70965 Peter Zijlstra 2013-11-28  45  	return false;
a787870924dbd6 Peter Zijlstra 2013-08-14  46  }
a787870924dbd6 Peter Zijlstra 2013-08-14  47  
bdb43806589096 Peter Zijlstra 2013-09-10  48  /*
bdb43806589096 Peter Zijlstra 2013-09-10  49   * The various preempt_count add/sub methods
bdb43806589096 Peter Zijlstra 2013-09-10  50   */
bdb43806589096 Peter Zijlstra 2013-09-10  51  
bdb43806589096 Peter Zijlstra 2013-09-10  52  static __always_inline void __preempt_count_add(int val)
bdb43806589096 Peter Zijlstra 2013-09-10  53  {
bdb43806589096 Peter Zijlstra 2013-09-10  54  	*preempt_count_ptr() += val;
bdb43806589096 Peter Zijlstra 2013-09-10  55  }
bdb43806589096 Peter Zijlstra 2013-09-10  56  
bdb43806589096 Peter Zijlstra 2013-09-10  57  static __always_inline void __preempt_count_sub(int val)
bdb43806589096 Peter Zijlstra 2013-09-10  58  {
bdb43806589096 Peter Zijlstra 2013-09-10  59  	*preempt_count_ptr() -= val;
bdb43806589096 Peter Zijlstra 2013-09-10  60  }
bdb43806589096 Peter Zijlstra 2013-09-10  61  
4ad87eee546ef9 Boqun Feng     2026-08-04  62  static __always_inline int __preempt_count_add_return(int val)
4ad87eee546ef9 Boqun Feng     2026-08-04  63  {
4ad87eee546ef9 Boqun Feng     2026-08-04  64  	*preempt_count_ptr() += val;
4ad87eee546ef9 Boqun Feng     2026-08-04  65  
4ad87eee546ef9 Boqun Feng     2026-08-04 @66  	return *preempt_count_ptr();
4ad87eee546ef9 Boqun Feng     2026-08-04  67  }
4ad87eee546ef9 Boqun Feng     2026-08-04  68  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
