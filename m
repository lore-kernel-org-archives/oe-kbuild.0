Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EE8374A0E
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Sep 2026 02:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786568; cv=none; b=P9YNst9eTPETdwfwyLIpWZHopjY2iueFHJw+D3tVa1ho+vaO4OfIZHq+HD3gQALC+Bwmo59rLCFcI0TtaBGR62+iBCd0+0zvnOa6sR2MNoFm2v1eiPuA1K4JqzFq7eR+kFuxw3NsUbPWKIlyRofxbJe5M9VJZkcOFTLAE8yWP4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786568; c=relaxed/simple;
	bh=xvNEBkRESa2myTQQKR1nJ2hW6w1zLP7yLcPgxkL0H5E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cTAAjykaPmSoYQyZCl+58OoIMgtxjEAVVMCXdBv8ErRCchfiM6pBVbmktrGZjXOPJmQLqN5GltVKVuQsTRsrLzSdrgYmI1L0S1uwrPDOqBci+ZWVHGIqBkvyvz5Th+XipIbhO0a9dnr1DDLPsh4bGHkOGIR4hlvOlTgDxSwi5Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqEDKIOh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqEDKIOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789786563; x=1821322563;
  h=date:from:to:cc:subject:message-id;
  bh=xvNEBkRESa2myTQQKR1nJ2hW6w1zLP7yLcPgxkL0H5E=;
  b=FqEDKIOhA2GCZplSrSvJM8blvZDnxr5whuv8j99hLmghA9QaIDhX5y/q
   aMK3mh03HZvIu0zvHVskwwW3e2T24G3OMMwyKHugMyDtgZ5PY126cHNUf
   1KxQBXdjtmk2/s4GVLm6FdasZshQoQNvlawOuFF+pnx0JjDIiJGJ0oXA7
   c3EsgTMX+z2zRBAD9Hkbd+LDtiYllAS7t0HnZC1FvWWX2eeCLfQCZiElq
   WE5vB+K+rXiohwfB3PlkIfS4HVwe+9fG3n9kqRyAl7BhtDEY67HtLYLpJ
   wOeivVSyunbeBNCjIwVgpHFhezbP/ofzMYe3B7BKOz/kbh6y4Jwsk+/9M
   g==;
X-CSE-ConnectionGUID: /afUCRFgT9q2yyg3b3sOYw==
X-CSE-MsgGUID: 8NsUqAXbSNGgpmdtCpD8rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="101674079"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="101674079"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 19:56:02 -0700
X-CSE-ConnectionGUID: ioAWLe2zSTKJf26aK69c5g==
X-CSE-MsgGUID: eqn9TraWQaSudxSAkIE4vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="272005768"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2026 19:56:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7lF7-00000000Abt-49aa;
	Sat, 19 Sep 2026 02:55:57 +0000
Date: Sat, 19 Sep 2026 10:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/asm-generic/preempt.h:66:9: sparse: sparse: Trying
 to use reserved word 'return' as identifier
Message-ID: <202609191038.V4Yt6u0Q-lkp@intel.com>
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
TO: Boqun Feng <boqun@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: 4ad87eee546ef97e3a5ad80414327f41f48a4e70 preempt: Introduce __preempt_count_{sub,add}_return()
date:   6 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 weeks ago
config: powerpc64-randconfig-r1302-20260918 (https://download.01.org/0day-ci/archive/20260919/202609191038.V4Yt6u0Q-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191038.V4Yt6u0Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4ad87eee546e ("preempt: Introduce __preempt_count_{sub,add}_return()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609191038.V4Yt6u0Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:23:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:23:29: sparse: sparse: got cpu_has_feature
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:31:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:31:13: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:31:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: got "Warning! cpu_has_feature() used prior to jump label init!\n"
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:34:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:34:24: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:34:24: sparse: sparse: got early_cpu_has_feature
   arch/powerpc/include/asm/cpu_has_feature.h:35:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:35:9: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:41:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:41:13: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:41:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:45:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got (
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got if
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got branch
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:46:1: sparse: sparse: got }
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
   include/linux/preempt.h:491:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:491:20: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:494:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:494:1: sparse: sparse: got }
   include/linux/preempt.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:498:1: sparse: sparse: got }
   include/linux/preempt.h:502:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:502:1: sparse: sparse: got }
   include/linux/preempt.h:507:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:507:1: sparse: sparse: got }
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
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:23:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:23:29: sparse: sparse: got cpu_has_feature
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:31:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:31:13: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:31:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: got "Warning! cpu_has_feature() used prior to jump label init!\n"
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:34:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:34:24: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:34:24: sparse: sparse: got early_cpu_has_feature
   arch/powerpc/include/asm/cpu_has_feature.h:35:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:35:9: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:41:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:41:13: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:41:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:45:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got (
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got if
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got branch
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:46:1: sparse: sparse: got }
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
   include/linux/preempt.h:491:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:491:20: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:494:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:494:1: sparse: sparse: got }
   include/linux/preempt.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:498:1: sparse: sparse: got }
   include/linux/preempt.h:502:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:502:1: sparse: sparse: got }
   include/linux/preempt.h:507:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:507:1: sparse: sparse: got }
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
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:23:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:23:29: sparse: sparse: got cpu_has_feature
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:31:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:31:13: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:31:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: got "Warning! cpu_has_feature() used prior to jump label init!\n"
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:34:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:34:24: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:34:24: sparse: sparse: got early_cpu_has_feature
   arch/powerpc/include/asm/cpu_has_feature.h:35:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:35:9: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:41:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:41:13: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:41:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:45:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got (
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got if
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got branch
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:46:1: sparse: sparse: got }
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
   include/linux/preempt.h:491:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:491:20: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:494:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:494:1: sparse: sparse: got }
   include/linux/preempt.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:498:1: sparse: sparse: got }
   include/linux/preempt.h:502:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:502:1: sparse: sparse: got }
   include/linux/preempt.h:507:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:507:1: sparse: sparse: got }
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
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:23:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:23:29: sparse: sparse: got cpu_has_feature
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:28:9: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:31:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:31:13: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:31:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: got "Warning! cpu_has_feature() used prior to jump label init!\n"
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:34:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:34:24: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:34:24: sparse: sparse: got early_cpu_has_feature
   arch/powerpc/include/asm/cpu_has_feature.h:35:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:35:9: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:41:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:41:13: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:41:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:45:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got (
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got if
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got branch
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got !
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got }
   arch/powerpc/include/asm/cpu_has_feature.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:46:1: sparse: sparse: got }
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
   include/linux/preempt.h:491:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:491:20: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:494:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:494:1: sparse: sparse: got }
   include/linux/preempt.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:498:1: sparse: sparse: got }
   include/linux/preempt.h:502:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:502:1: sparse: sparse: got }
   include/linux/preempt.h:507:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:507:1: sparse: sparse: got }
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

a787870924dbd6f Peter Zijlstra 2013-08-14  42  
a787870924dbd6f Peter Zijlstra 2013-08-14 @43  static __always_inline bool test_preempt_need_resched(void)
a787870924dbd6f Peter Zijlstra 2013-08-14  44  {
ba1f14fbe70965a Peter Zijlstra 2013-11-28  45  	return false;
a787870924dbd6f Peter Zijlstra 2013-08-14  46  }
a787870924dbd6f Peter Zijlstra 2013-08-14  47  
bdb43806589096a Peter Zijlstra 2013-09-10  48  /*
bdb43806589096a Peter Zijlstra 2013-09-10  49   * The various preempt_count add/sub methods
bdb43806589096a Peter Zijlstra 2013-09-10  50   */
bdb43806589096a Peter Zijlstra 2013-09-10  51  
bdb43806589096a Peter Zijlstra 2013-09-10  52  static __always_inline void __preempt_count_add(int val)
bdb43806589096a Peter Zijlstra 2013-09-10  53  {
bdb43806589096a Peter Zijlstra 2013-09-10  54  	*preempt_count_ptr() += val;
bdb43806589096a Peter Zijlstra 2013-09-10  55  }
bdb43806589096a Peter Zijlstra 2013-09-10  56  
bdb43806589096a Peter Zijlstra 2013-09-10  57  static __always_inline void __preempt_count_sub(int val)
bdb43806589096a Peter Zijlstra 2013-09-10  58  {
bdb43806589096a Peter Zijlstra 2013-09-10  59  	*preempt_count_ptr() -= val;
bdb43806589096a Peter Zijlstra 2013-09-10  60  }
bdb43806589096a Peter Zijlstra 2013-09-10  61  
4ad87eee546ef97 Boqun Feng     2026-08-04  62  static __always_inline int __preempt_count_add_return(int val)
4ad87eee546ef97 Boqun Feng     2026-08-04  63  {
4ad87eee546ef97 Boqun Feng     2026-08-04  64  	*preempt_count_ptr() += val;
4ad87eee546ef97 Boqun Feng     2026-08-04  65  
4ad87eee546ef97 Boqun Feng     2026-08-04 @66  	return *preempt_count_ptr();
4ad87eee546ef97 Boqun Feng     2026-08-04  67  }
4ad87eee546ef97 Boqun Feng     2026-08-04  68  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
