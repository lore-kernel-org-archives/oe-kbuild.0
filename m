Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01DB22D4E9
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jul 2026 05:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783661349; cv=none; b=Q4gXqC6t7L8tGETNi74TEM8L30puVZKEPYED3fTiOqxIoVBqCCOMhORNeeaknzviyVgGdXJTrAsmmgyfNiJrJDRrLQLOjctNqNrKsD3pol/m0V0oUcU1QxGdruDp+G5h4yEGU4G8AKu0QXd7k5DU2nzYF+tMwxi54KrWNWpxpOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783661349; c=relaxed/simple;
	bh=zNYzYvxKsA6bXMPWVCJGVdZz5Lk5S+dGxHs8y/BKjcA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TPU8LB0+tP6JrfrEOmH+ggghF6Vx9kt4XwIFoj8ir5G46K/tdr3hNh4AAvaHSM+3GaQMfxU/dJc+3JhXPbLDEqU01hIHaHjp9sFasbwEmruibUIQPc7y1yqOPwnkUROQ1BQDFOnlOlBI5p6wguVFXtTnApecXRVSTuXsFW49Z58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHxZhUTr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHxZhUTr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783661345; x=1815197345;
  h=date:from:to:cc:subject:message-id;
  bh=zNYzYvxKsA6bXMPWVCJGVdZz5Lk5S+dGxHs8y/BKjcA=;
  b=fHxZhUTrIV3hNb8RT45xGzkSCN7T+R1yWVEEONn0Tec8d1K5e0tKrk2q
   PRBduDQLd058SasRR67MhvPv6xEac53tliuWtpTCplx5me0FMw9GpKfG5
   heBvglRhDruQMVPlUT2j9KsFPc7ahtzEvcVWrLF48wjEeuBCuYDoablGY
   eZ2hcO7izMN0LAxTqPCnzcb7qUvlyXFhDm0urh/xtDWdtG9e/9slEIULt
   IZKuhvCUqpBNBAcrLS8nMoQ+YC1WSoeTfIYh+5uFKTqbS/XHCSOl7yfFK
   Vw4KC/djj32kD+xZAtOBkIJzcOKFKssF/9LA5YdOLjSLUkAYrji1QRFkp
   g==;
X-CSE-ConnectionGUID: yiPv6uhVRG2zhqg3WKDNdQ==
X-CSE-MsgGUID: HfN06CkIToaVbuag02FtmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109902223"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="109902223"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 22:29:04 -0700
X-CSE-ConnectionGUID: rESEVQJhQmO6yAGpZdzDoQ==
X-CSE-MsgGUID: cOhfj8L7RQ6LxDObu60Bvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250371633"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2026 22:29:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi3nH-00000000IX9-3JAd;
	Fri, 10 Jul 2026 05:28:59 +0000
Date: Fri, 10 Jul 2026 13:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [boqun:rust-sync 3/23] include/asm-generic/preempt.h:66:9:
 sparse: sparse: Trying to use reserved word 'return' as identifier
Message-ID: <202607101345.zkKCY7UW-lkp@intel.com>
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
TO: Boqun Feng <boqun.feng@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   6a8f9575b4f34ba3b4a4fffd590e149fa4d6798d
commit: 55d2f7f4eb164cba41c17abb802b84aa4a8b519a [3/23] preempt: Introduce __preempt_count_{sub, add}_return()
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: powerpc-randconfig-r121-20260708 (https://download.01.org/0day-ci/archive/20260710/202607101345.zkKCY7UW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607101345.zkKCY7UW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607101345.zkKCY7UW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_branch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
   include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/jump_label.h:168:17: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:168:17: sparse: sparse: got entry
   include/linux/jump_label.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:169:1: sparse: sparse: got }
   include/linux/jump_label.h:178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:178:1: sparse: sparse: got }
   include/linux/jump_label.h:199:29: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:199:29: sparse: sparse: got static_key_false
   include/linux/jump_label.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:202:1: sparse: sparse: got }
   include/linux/jump_label.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:207:1: sparse: sparse: got }
   include/linux/jump_label.h:218:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:218:13: sparse: sparse: got arch_jump_label_transform_queue
   include/linux/jump_label.h:222:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:222:13: sparse: sparse: got static_key_slow_inc
   include/linux/jump_label.h:223:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:223:13: sparse: sparse: got static_key_fast_inc_not_disabled
   include/linux/jump_label.h:225:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:225:13: sparse: sparse: got static_key_slow_inc_cpuslocked
   include/linux/jump_label.h:337:1: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:337:1: sparse: sparse: got class_jump_label_lock_is_conditional
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
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
   arch/powerpc/include/asm/cpu_has_feature.h:38:29: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:38:29: sparse: sparse: got &
   arch/powerpc/include/asm/cpu_has_feature.h:38:9: sparse: sparse: Trying to use reserved word 'if' as identifier
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
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: got ppc_breakpoint_available
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:123:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:123:20: sparse: sparse: got dawr_enabled
   arch/powerpc/include/asm/hw_breakpoint.h:123:55: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:123:55: sparse: sparse: got }
   arch/powerpc/include/asm/hw_breakpoint.h:124:81: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:124:81: sparse: sparse: got }
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
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/irqflags.h, include/linux/irqflags.h, include/asm-generic/cmpxchg-local.h, ...):
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: got arch_irqs_disabled_flags
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:513:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: got msr
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/cmpxchg-local.h, arch/powerpc/include/asm/cmpxchg.h, arch/powerpc/include/asm/atomic.h, ...):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:265:1: sparse: sparse: got class_irq_is_conditional
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
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
--
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_branch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
   include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/jump_label.h:168:17: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:168:17: sparse: sparse: got entry
   include/linux/jump_label.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:169:1: sparse: sparse: got }
   include/linux/jump_label.h:178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:178:1: sparse: sparse: got }
   include/linux/jump_label.h:199:29: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:199:29: sparse: sparse: got static_key_false
   include/linux/jump_label.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:202:1: sparse: sparse: got }
   include/linux/jump_label.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:207:1: sparse: sparse: got }
   include/linux/jump_label.h:218:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:218:13: sparse: sparse: got arch_jump_label_transform_queue
   include/linux/jump_label.h:222:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:222:13: sparse: sparse: got static_key_slow_inc
   include/linux/jump_label.h:223:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:223:13: sparse: sparse: got static_key_fast_inc_not_disabled
   include/linux/jump_label.h:225:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:225:13: sparse: sparse: got static_key_slow_inc_cpuslocked
   include/linux/jump_label.h:337:1: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:337:1: sparse: sparse: got class_jump_label_lock_is_conditional
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
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
   arch/powerpc/include/asm/cpu_has_feature.h:38:29: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:38:29: sparse: sparse: got &
   arch/powerpc/include/asm/cpu_has_feature.h:38:9: sparse: sparse: Trying to use reserved word 'if' as identifier
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
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: got ppc_breakpoint_available
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:123:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:123:20: sparse: sparse: got dawr_enabled
   arch/powerpc/include/asm/hw_breakpoint.h:123:55: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:123:55: sparse: sparse: got }
   arch/powerpc/include/asm/hw_breakpoint.h:124:81: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:124:81: sparse: sparse: got }
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
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/irqflags.h, include/linux/irqflags.h, include/asm-generic/cmpxchg-local.h, ...):
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: got arch_irqs_disabled_flags
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:513:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: got msr
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/cmpxchg-local.h, arch/powerpc/include/asm/cmpxchg.h, arch/powerpc/include/asm/atomic.h, ...):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:265:1: sparse: sparse: got class_irq_is_conditional
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
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
--
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_branch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
   include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/jump_label.h:168:17: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:168:17: sparse: sparse: got entry
   include/linux/jump_label.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:169:1: sparse: sparse: got }
   include/linux/jump_label.h:178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:178:1: sparse: sparse: got }
   include/linux/jump_label.h:199:29: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:199:29: sparse: sparse: got static_key_false
   include/linux/jump_label.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:202:1: sparse: sparse: got }
   include/linux/jump_label.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:207:1: sparse: sparse: got }
   include/linux/jump_label.h:218:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:218:13: sparse: sparse: got arch_jump_label_transform_queue
   include/linux/jump_label.h:222:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:222:13: sparse: sparse: got static_key_slow_inc
   include/linux/jump_label.h:223:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:223:13: sparse: sparse: got static_key_fast_inc_not_disabled
   include/linux/jump_label.h:225:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:225:13: sparse: sparse: got static_key_slow_inc_cpuslocked
   include/linux/jump_label.h:337:1: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:337:1: sparse: sparse: got class_jump_label_lock_is_conditional
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
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
   arch/powerpc/include/asm/cpu_has_feature.h:38:29: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:38:29: sparse: sparse: got &
   arch/powerpc/include/asm/cpu_has_feature.h:38:9: sparse: sparse: Trying to use reserved word 'if' as identifier
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
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: got ppc_breakpoint_available
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:123:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:123:20: sparse: sparse: got dawr_enabled
   arch/powerpc/include/asm/hw_breakpoint.h:123:55: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:123:55: sparse: sparse: got }
   arch/powerpc/include/asm/hw_breakpoint.h:124:81: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:124:81: sparse: sparse: got }
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
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/irqflags.h, include/linux/irqflags.h, include/asm-generic/cmpxchg-local.h, ...):
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: got arch_irqs_disabled_flags
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:513:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: got msr
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/cmpxchg-local.h, arch/powerpc/include/asm/cmpxchg.h, arch/powerpc/include/asm/atomic.h, ...):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:265:1: sparse: sparse: got class_irq_is_conditional
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
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
--
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_branch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
   include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/jump_label.h:168:17: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:168:17: sparse: sparse: got entry
   include/linux/jump_label.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:169:1: sparse: sparse: got }
   include/linux/jump_label.h:178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:178:1: sparse: sparse: got }
   include/linux/jump_label.h:199:29: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:199:29: sparse: sparse: got static_key_false
   include/linux/jump_label.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:202:1: sparse: sparse: got }
   include/linux/jump_label.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:207:1: sparse: sparse: got }
   include/linux/jump_label.h:218:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:218:13: sparse: sparse: got arch_jump_label_transform_queue
   include/linux/jump_label.h:222:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:222:13: sparse: sparse: got static_key_slow_inc
   include/linux/jump_label.h:223:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:223:13: sparse: sparse: got static_key_fast_inc_not_disabled
   include/linux/jump_label.h:225:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:225:13: sparse: sparse: got static_key_slow_inc_cpuslocked
   include/linux/jump_label.h:337:1: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:337:1: sparse: sparse: got class_jump_label_lock_is_conditional
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
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
   arch/powerpc/include/asm/cpu_has_feature.h:38:29: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:38:29: sparse: sparse: got &
   arch/powerpc/include/asm/cpu_has_feature.h:38:9: sparse: sparse: Trying to use reserved word 'if' as identifier
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
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: got ppc_breakpoint_available
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:123:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_breakpoint.h:123:20: sparse: sparse: got dawr_enabled
   arch/powerpc/include/asm/hw_breakpoint.h:123:55: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:123:55: sparse: sparse: got }
   arch/powerpc/include/asm/hw_breakpoint.h:124:81: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_breakpoint.h:124:81: sparse: sparse: got }
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
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/irqflags.h, include/linux/irqflags.h, include/asm-generic/cmpxchg-local.h, ...):
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: got arch_irqs_disabled_flags
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:513:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: got msr
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/cmpxchg-local.h, arch/powerpc/include/asm/cmpxchg.h, arch/powerpc/include/asm/atomic.h, ...):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:265:1: sparse: sparse: got class_irq_is_conditional
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
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
55d2f7f4eb164c Boqun Feng     2026-01-21  62  static __always_inline int __preempt_count_add_return(int val)
55d2f7f4eb164c Boqun Feng     2026-01-21  63  {
55d2f7f4eb164c Boqun Feng     2026-01-21  64  	*preempt_count_ptr() += val;
55d2f7f4eb164c Boqun Feng     2026-01-21  65  
55d2f7f4eb164c Boqun Feng     2026-01-21 @66  	return *preempt_count_ptr();
55d2f7f4eb164c Boqun Feng     2026-01-21  67  }
55d2f7f4eb164c Boqun Feng     2026-01-21  68  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
