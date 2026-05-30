Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1710C3AC0FC
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 18:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780164325; cv=none; b=Wbce+52vzIpAvZ0nqhsZf3yOVV68QIkZ1cZa8uzsv56c56vkd99p7Wn2b2zMSzTy/9opl10ikBuJtFE1DnYtTqhti/B366W4Z97/VM9mOnvRbknZrF6xyAMZqO/czNfrnTrlNiDqhIB9HjVx7vHNZPCor5HDSpBtN5s6CwH7ds8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780164325; c=relaxed/simple;
	bh=uxI48uOHXfMOJNH719G0kbPq6nLSFIFGJJu7Vpw2btU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WHzzeLkKTfQB1sYTZ2fHCDQbFl6xuIyPb625HUAES+h9POCrnIk94HfxMAUYtFjNeXSo/dHmK/sNN6T1xf8fCKZfhfT5J81HmThPH+ySmK5wTvkNR6Lha2hnsVJok2BxrVl1YZHKx0aLzZgpOMCm7rX/rNOcqazuJcuaIBnItYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQ3SLwRh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQ3SLwRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780164318; x=1811700318;
  h=date:from:to:cc:subject:message-id;
  bh=uxI48uOHXfMOJNH719G0kbPq6nLSFIFGJJu7Vpw2btU=;
  b=lQ3SLwRhMOV4nkIYq0vn7KGi0eCplt8v2GgNEBrhvss++/ZggKYNkGPC
   Lsks7OtxSl8hMkIEABy9aBn5btxPV/VIHkYF9bPlMFVkdWrwBd2nZk2OO
   KE0yoEYIwXOOt03Q6HLbQWmtiztO47WLLIk9yZUD+ahDTgznFYA5GYRXA
   1NOgfJtu6zP7sGzcirXHXgIicq9F5tYdPXoOLB/VcLh6w7Mz0MXYxHXV3
   F4WxyYiS5ynXnMtwS0MqAwKechd8/m0S9NbFc7NTgLhGzTWNNAfzs40N8
   j0W2/ZMYxPCR+0WkEngkwoVD0nBGnmszgpuqakHsSLXhPYqyvAYU7Id5P
   A==;
X-CSE-ConnectionGUID: 9J6C24C3Rw+InJDq4ZX9sw==
X-CSE-MsgGUID: zjhOkyifQjaxdWcb9OWI9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="81095344"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="81095344"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 11:05:15 -0700
X-CSE-ConnectionGUID: koQ+cn02T6+Qe5zE7yml1A==
X-CSE-MsgGUID: TUfTBEr9TnSUM+bia6WtFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="266779664"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2026 11:05:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTO3b-000000008m8-1vB9;
	Sat, 30 May 2026 18:05:11 +0000
Date: Sun, 31 May 2026 02:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7950/8275]
 arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to
 use reserved word 'do' as identifier
Message-ID: <202605310233.XK03qvai-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'do' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 2107f2f26fc5932a2e31ac36980febb17f38377d [7950/8275] raid6: hide internals
:::::: branch date: 18 hours ago
:::::: commit date: 5 days ago
config: powerpc-randconfig-r132-20260530 (https://download.01.org/0day-ci/archive/20260531/202605310233.XK03qvai-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605310233.XK03qvai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605310233.XK03qvai-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/jump_label.h, arch/powerpc/include/asm/cpu_has_feature.h, arch/powerpc/include/asm/hw_breakpoint.h, ...):
   include/linux/cleanup.h:225:15: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cleanup.h:225:15: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/jump_label.h, arch/powerpc/include/asm/cpu_has_feature.h, arch/powerpc/include/asm/hw_breakpoint.h, ...):
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: got arch_static_branch
   arch/powerpc/include/asm/jump_label.h:28:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: got }
   arch/powerpc/include/asm/jump_label.h:43:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/cpu_has_feature.h, arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
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
>> arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got !
>> arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'if' as identifier
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
>> arch/powerpc/include/asm/cpu_has_feature.h:34:17: sparse: sparse: Trying to use reserved word 'return' as identifier
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
>> arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got if
>> arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
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
   include/asm-generic/preempt.h:70:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:70:1: sparse: sparse: got }
   include/asm-generic/preempt.h:79:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:79:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:468:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:468:1: sparse: sparse: got class_preempt_is_conditional
   include/linux/preempt.h:469:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:469:1: sparse: sparse: got class_preempt_notrace_is_conditional
   include/linux/preempt.h:473:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:473:13: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:474:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:474:13: sparse: sparse: got preempt_model_voluntary
   include/linux/preempt.h:475:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:475:13: sparse: sparse: got preempt_model_full
   include/linux/preempt.h:476:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:476:13: sparse: sparse: got preempt_model_lazy
   include/linux/preempt.h:500:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:500:20: sparse: sparse: got preempt_model_rt
   include/linux/preempt.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:503:1: sparse: sparse: got }
   include/linux/preempt.h:515:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:515:20: sparse: sparse: got preempt_model_preemptible
   include/linux/preempt.h:518:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:518:1: sparse: sparse: got }
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
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of statement
   include/linux/irqflags.h:265:1: sparse: sparse: got was_disabled
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: got raw_atomic_try_cmpxchg
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2140:9: sparse: sparse: Trying to use reserved word 'if' as identifier
--
   include/linux/cpumask.h:871:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:871:1: sparse: sparse: got }
   include/linux/cpumask.h:884:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:884:1: sparse: sparse: got }
   include/linux/cpumask.h:898:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:898:1: sparse: sparse: got }
   include/linux/cpumask.h:911:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:911:1: sparse: sparse: got }
   include/linux/cpumask.h:924:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:924:1: sparse: sparse: got }
   include/linux/cpumask.h:935:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:935:1: sparse: sparse: got }
   include/linux/cpumask.h:972:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:972:1: sparse: sparse: got }
   include/linux/cpumask.h:987:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:987:1: sparse: sparse: got }
   include/linux/cpumask.h:999:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:999:1: sparse: sparse: got }
   include/linux/cpumask.h:1011:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1011:1: sparse: sparse: got }
   include/linux/cpumask.h:1021:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1021:1: sparse: sparse: got }
   include/linux/cpumask.h:1079:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1079:1: sparse: sparse: got }
   include/linux/cpumask.h:1085:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1085:1: sparse: sparse: got }
   include/linux/cpumask.h:1090:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/cpumask.h:1090:16: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1090:16: sparse: sparse: got true
   include/linux/cpumask.h:1091:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1091:1: sparse: sparse: got }
   include/linux/cpumask.h:1097:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/cpumask.h:1097:16: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1097:16: sparse: sparse: got true
   include/linux/cpumask.h:1098:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1098:1: sparse: sparse: got }
   include/linux/cpumask.h:1115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1115:1: sparse: sparse: got }
   include/linux/cpumask.h:1118:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/cpumask.h:1118:1: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1118:1: sparse: sparse: got free_cpumask_var
   include/linux/cpumask.h:1118:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1118:1: sparse: sparse: got }
   include/linux/cpumask.h:1165:44: sparse: sparse: Expected ) in function declarator
   include/linux/cpumask.h:1165:44: sparse: sparse: got online
   include/linux/cpumask.h:1166:46: sparse: sparse: Expected ) in function declarator
   include/linux/cpumask.h:1166:46: sparse: sparse: got possible
   include/linux/cpumask.h:1229:29: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1229:29: sparse: sparse: got cpu_online
   include/linux/cpumask.h:1232:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1232:1: sparse: sparse: got }
   include/linux/cpumask.h:1237:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1237:1: sparse: sparse: got }
   include/linux/cpumask.h:1242:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1242:1: sparse: sparse: got }
   include/linux/cpumask.h:1247:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1247:1: sparse: sparse: got }
   include/linux/cpumask.h:1252:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1252:1: sparse: sparse: got }
   include/linux/cpumask.h:1257:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1257:1: sparse: sparse: got }
   include/linux/cpumask.h:1331:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1331:1: sparse: sparse: got }
   include/linux/cpumask.h:1355:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1355:1: sparse: sparse: got }
   include/linux/cpumask.h:1377:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1377:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/lockdep.h, include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/smp.h:18:15: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:18:15: sparse: sparse: got *
   include/linux/smp.h:25:25: sparse: sparse: expected ; at end of declaration
   include/linux/smp.h:25:25: sparse: sparse: Expected } at end of specifier
   include/linux/smp.h:25:25: sparse: sparse: got func
   include/linux/smp.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:27:1: sparse: sparse: got }
   include/linux/smp.h:50:57: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:50:57: sparse: sparse: got func
   include/linux/smp.h:53:44: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:53:44: sparse: sparse: got cond_func
   include/linux/smp.h:70:48: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:70:48: sparse: sparse: got func
   include/linux/smp.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:73:1: sparse: sparse: got }
   include/linux/smp.h:95:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:95:1: sparse: sparse: got }
   include/linux/smp.h:107:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:107:1: sparse: sparse: got }
   include/linux/smp.h:163:40: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:163:40: sparse: sparse: got func
   include/linux/smp.h:165:45: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:165:45: sparse: sparse: got func
   include/linux/smp.h:168:43: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:168:43: sparse: sparse: got func
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/spinlock.h, include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/simple_spinlock.h:35:69: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:35:69: sparse: sparse: got lock
   arch/powerpc/include/asm/simple_spinlock.h:38:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:38:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got !
>> arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got volatile
>> arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Trying to use reserved word 'const' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:43:1: sparse: sparse: got }
>> arch/powerpc/include/asm/simple_spinlock.h:67:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:67:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:67:16: sparse: sparse: got tmp
   arch/powerpc/include/asm/simple_spinlock.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:68:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:73:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:103:17: sparse: sparse: Expected ( after asm
   arch/powerpc/include/asm/simple_spinlock.h:103:17: sparse: sparse: got __volatile__
>> arch/powerpc/include/asm/simple_spinlock.h:102:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:104:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:104:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:111:17: sparse: sparse: Expected ( after asm
   arch/powerpc/include/asm/simple_spinlock.h:111:17: sparse: sparse: got __volatile__
   arch/powerpc/include/asm/simple_spinlock.h:110:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:112:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:112:1: sparse: sparse: got }
>> arch/powerpc/include/asm/simple_spinlock.h:119:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:119:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:119:20: sparse: sparse: got {
   arch/powerpc/include/asm/simple_spinlock.h:121:48: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:121:48: sparse: sparse: got (
   arch/powerpc/include/asm/simple_spinlock.h:121:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:123:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:123:17: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:125:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:125:9: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:133:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:133:13: sparse: sparse: got ->
   arch/powerpc/include/asm/simple_spinlock.h:134:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:134:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:176:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:176:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:176:16: sparse: sparse: got tmp
   arch/powerpc/include/asm/simple_spinlock.h:177:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:177:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:200:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:200:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:200:16: sparse: sparse: got tmp
   arch/powerpc/include/asm/simple_spinlock.h:201:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:201:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:208:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:208:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:208:20: sparse: sparse: got {
   arch/powerpc/include/asm/simple_spinlock.h:210:48: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:210:48: sparse: sparse: got (
   arch/powerpc/include/asm/simple_spinlock.h:210:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:212:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:212:17: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:214:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:214:9: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:222:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:222:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:222:20: sparse: sparse: got {
   arch/powerpc/include/asm/simple_spinlock.h:224:48: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:224:48: sparse: sparse: got (
   arch/powerpc/include/asm/simple_spinlock.h:224:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:228:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:228:9: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:234:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:239:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:239:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:255:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:255:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:261:11: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:261:11: sparse: sparse: got ->
   arch/powerpc/include/asm/simple_spinlock.h:262:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:262:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/rseq_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/workqueue_types.h:17:23: sparse: sparse: expected ; at end of declaration
   include/linux/workqueue_types.h:17:23: sparse: sparse: Expected } at end of specifier
   include/linux/workqueue_types.h:17:23: sparse: sparse: got data
   include/linux/workqueue_types.h:23:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/workqueue_types.h:23:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/unwind_deferred_types.h:36:33: sparse: sparse: expected ; at end of declaration
   include/linux/unwind_deferred_types.h:36:33: sparse: sparse: Expected } at end of specifier
   include/linux/unwind_deferred_types.h:36:33: sparse: sparse: got unwind_mask
   include/linux/unwind_deferred_types.h:40:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/unwind_deferred_types.h:40:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/switch_to.h):
   include/linux/sched.h:923:41: sparse: sparse: expected ; at end of declaration
   include/linux/sched.h:923:41: sparse: sparse: Expected } at end of specifier
   include/linux/sched.h:923:41: sparse: sparse: got *
   include/linux/sched.h:924:41: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:924:41: sparse: sparse: got *
   include/linux/sched.h:925:41: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:925:41: sparse: sparse: got cpus_mask
   include/linux/sched.h:977:60: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:977:60: sparse: sparse: got :
   include/linux/sched.h:978:66: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:978:66: sparse: sparse: got :
   include/linux/sched.h:979:55: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:979:55: sparse: sparse: got :
   include/linux/sched.h:980:55: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:980:55: sparse: sparse: got :
   include/linux/sched.h:983:41: sparse: sparse: Expected ; at the end of type declaration
   include/linux/sched.h:983:41: sparse: sparse: got :
   include/linux/sched.h:1000:60: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1000:60: sparse: sparse: got :
   include/linux/sched.h:1002:55: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1002:55: sparse: sparse: got :
   include/linux/sched.h:1006:54: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1006:54: sparse: sparse: got :
   include/linux/sched.h:1009:50: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1009:50: sparse: sparse: got :
   include/linux/sched.h:1010:50: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1010:50: sparse: sparse: got :
   include/linux/sched.h:1012:56: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1012:56: sparse: sparse: got :
   include/linux/sched.h:1019:53: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1019:53: sparse: sparse: got :
   include/linux/sched.h:1039:54: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1039:54: sparse: sparse: got :
   include/linux/sched.h:1043:51: sparse: sparse: Expected ; at end of declaration
--
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
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/jump_label.h, arch/powerpc/include/asm/cpu_has_feature.h, arch/powerpc/include/asm/hw_breakpoint.h, ...):
   include/linux/cleanup.h:225:15: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cleanup.h:225:15: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/jump_label.h, arch/powerpc/include/asm/cpu_has_feature.h, arch/powerpc/include/asm/hw_breakpoint.h, ...):
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: got arch_static_branch
   arch/powerpc/include/asm/jump_label.h:28:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: got }
   arch/powerpc/include/asm/jump_label.h:43:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/cpu_has_feature.h, arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
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
>> arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got !
>> arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'if' as identifier
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
>> arch/powerpc/include/asm/cpu_has_feature.h:34:17: sparse: sparse: Trying to use reserved word 'return' as identifier
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
>> arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got if
>> arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
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
   include/asm-generic/preempt.h:70:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:70:1: sparse: sparse: got }
   include/asm-generic/preempt.h:79:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:79:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:468:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:468:1: sparse: sparse: got class_preempt_is_conditional
   include/linux/preempt.h:469:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:469:1: sparse: sparse: got class_preempt_notrace_is_conditional
   include/linux/preempt.h:473:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:473:13: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:474:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:474:13: sparse: sparse: got preempt_model_voluntary
   include/linux/preempt.h:475:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:475:13: sparse: sparse: got preempt_model_full
   include/linux/preempt.h:476:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:476:13: sparse: sparse: got preempt_model_lazy
   include/linux/preempt.h:500:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:500:20: sparse: sparse: got preempt_model_rt
   include/linux/preempt.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:503:1: sparse: sparse: got }
   include/linux/preempt.h:515:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:515:20: sparse: sparse: got preempt_model_preemptible
   include/linux/preempt.h:518:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:518:1: sparse: sparse: got }
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
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of statement
   include/linux/irqflags.h:265:1: sparse: sparse: got was_disabled
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: got raw_atomic_try_cmpxchg
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2140:9: sparse: sparse: Trying to use reserved word 'if' as identifier
--
   include/linux/cpumask.h:871:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:871:1: sparse: sparse: got }
   include/linux/cpumask.h:884:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:884:1: sparse: sparse: got }
   include/linux/cpumask.h:898:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:898:1: sparse: sparse: got }
   include/linux/cpumask.h:911:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:911:1: sparse: sparse: got }
   include/linux/cpumask.h:924:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:924:1: sparse: sparse: got }
   include/linux/cpumask.h:935:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:935:1: sparse: sparse: got }
   include/linux/cpumask.h:972:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:972:1: sparse: sparse: got }
   include/linux/cpumask.h:987:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:987:1: sparse: sparse: got }
   include/linux/cpumask.h:999:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:999:1: sparse: sparse: got }
   include/linux/cpumask.h:1011:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1011:1: sparse: sparse: got }
   include/linux/cpumask.h:1021:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1021:1: sparse: sparse: got }
   include/linux/cpumask.h:1079:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1079:1: sparse: sparse: got }
   include/linux/cpumask.h:1085:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1085:1: sparse: sparse: got }
   include/linux/cpumask.h:1090:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/cpumask.h:1090:16: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1090:16: sparse: sparse: got true
   include/linux/cpumask.h:1091:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1091:1: sparse: sparse: got }
   include/linux/cpumask.h:1097:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/cpumask.h:1097:16: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1097:16: sparse: sparse: got true
   include/linux/cpumask.h:1098:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1098:1: sparse: sparse: got }
   include/linux/cpumask.h:1115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1115:1: sparse: sparse: got }
   include/linux/cpumask.h:1118:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/cpumask.h:1118:1: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1118:1: sparse: sparse: got free_cpumask_var
   include/linux/cpumask.h:1118:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1118:1: sparse: sparse: got }
   include/linux/cpumask.h:1165:44: sparse: sparse: Expected ) in function declarator
   include/linux/cpumask.h:1165:44: sparse: sparse: got online
   include/linux/cpumask.h:1166:46: sparse: sparse: Expected ) in function declarator
   include/linux/cpumask.h:1166:46: sparse: sparse: got possible
   include/linux/cpumask.h:1229:29: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1229:29: sparse: sparse: got cpu_online
   include/linux/cpumask.h:1232:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1232:1: sparse: sparse: got }
   include/linux/cpumask.h:1237:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1237:1: sparse: sparse: got }
   include/linux/cpumask.h:1242:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1242:1: sparse: sparse: got }
   include/linux/cpumask.h:1247:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1247:1: sparse: sparse: got }
   include/linux/cpumask.h:1252:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1252:1: sparse: sparse: got }
   include/linux/cpumask.h:1257:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1257:1: sparse: sparse: got }
   include/linux/cpumask.h:1331:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1331:1: sparse: sparse: got }
   include/linux/cpumask.h:1355:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1355:1: sparse: sparse: got }
   include/linux/cpumask.h:1377:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1377:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/lockdep.h, include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/smp.h:18:15: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:18:15: sparse: sparse: got *
   include/linux/smp.h:25:25: sparse: sparse: expected ; at end of declaration
   include/linux/smp.h:25:25: sparse: sparse: Expected } at end of specifier
   include/linux/smp.h:25:25: sparse: sparse: got func
   include/linux/smp.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:27:1: sparse: sparse: got }
   include/linux/smp.h:50:57: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:50:57: sparse: sparse: got func
   include/linux/smp.h:53:44: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:53:44: sparse: sparse: got cond_func
   include/linux/smp.h:70:48: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:70:48: sparse: sparse: got func
   include/linux/smp.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:73:1: sparse: sparse: got }
   include/linux/smp.h:95:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:95:1: sparse: sparse: got }
   include/linux/smp.h:107:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:107:1: sparse: sparse: got }
   include/linux/smp.h:163:40: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:163:40: sparse: sparse: got func
   include/linux/smp.h:165:45: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:165:45: sparse: sparse: got func
   include/linux/smp.h:168:43: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:168:43: sparse: sparse: got func
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/spinlock.h, include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/simple_spinlock.h:35:69: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:35:69: sparse: sparse: got lock
   arch/powerpc/include/asm/simple_spinlock.h:38:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:38:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got !
>> arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got volatile
>> arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Trying to use reserved word 'const' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:43:1: sparse: sparse: got }
>> arch/powerpc/include/asm/simple_spinlock.h:67:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:67:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:67:16: sparse: sparse: got tmp
   arch/powerpc/include/asm/simple_spinlock.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:68:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:73:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:103:17: sparse: sparse: Expected ( after asm
   arch/powerpc/include/asm/simple_spinlock.h:103:17: sparse: sparse: got __volatile__
>> arch/powerpc/include/asm/simple_spinlock.h:102:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:104:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:104:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:111:17: sparse: sparse: Expected ( after asm
   arch/powerpc/include/asm/simple_spinlock.h:111:17: sparse: sparse: got __volatile__
   arch/powerpc/include/asm/simple_spinlock.h:110:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:112:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:112:1: sparse: sparse: got }
>> arch/powerpc/include/asm/simple_spinlock.h:119:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:119:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:119:20: sparse: sparse: got {
   arch/powerpc/include/asm/simple_spinlock.h:121:48: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:121:48: sparse: sparse: got (
   arch/powerpc/include/asm/simple_spinlock.h:121:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:123:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:123:17: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:125:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:125:9: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:133:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:133:13: sparse: sparse: got ->
   arch/powerpc/include/asm/simple_spinlock.h:134:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:134:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:176:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:176:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:176:16: sparse: sparse: got tmp
   arch/powerpc/include/asm/simple_spinlock.h:177:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:177:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:200:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:200:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:200:16: sparse: sparse: got tmp
   arch/powerpc/include/asm/simple_spinlock.h:201:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:201:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:208:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:208:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:208:20: sparse: sparse: got {
   arch/powerpc/include/asm/simple_spinlock.h:210:48: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:210:48: sparse: sparse: got (
   arch/powerpc/include/asm/simple_spinlock.h:210:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:212:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:212:17: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:214:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:214:9: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:222:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:222:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:222:20: sparse: sparse: got {
   arch/powerpc/include/asm/simple_spinlock.h:224:48: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:224:48: sparse: sparse: got (
   arch/powerpc/include/asm/simple_spinlock.h:224:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:228:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:228:9: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:234:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:239:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:239:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:255:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:255:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:261:11: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:261:11: sparse: sparse: got ->
   arch/powerpc/include/asm/simple_spinlock.h:262:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:262:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/rseq_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/workqueue_types.h:17:23: sparse: sparse: expected ; at end of declaration
   include/linux/workqueue_types.h:17:23: sparse: sparse: Expected } at end of specifier
   include/linux/workqueue_types.h:17:23: sparse: sparse: got data
   include/linux/workqueue_types.h:23:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/workqueue_types.h:23:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/unwind_deferred_types.h:36:33: sparse: sparse: expected ; at end of declaration
   include/linux/unwind_deferred_types.h:36:33: sparse: sparse: Expected } at end of specifier
   include/linux/unwind_deferred_types.h:36:33: sparse: sparse: got unwind_mask
   include/linux/unwind_deferred_types.h:40:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/unwind_deferred_types.h:40:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/switch_to.h):
   include/linux/sched.h:923:41: sparse: sparse: expected ; at end of declaration
   include/linux/sched.h:923:41: sparse: sparse: Expected } at end of specifier
   include/linux/sched.h:923:41: sparse: sparse: got *
   include/linux/sched.h:924:41: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:924:41: sparse: sparse: got *
   include/linux/sched.h:925:41: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:925:41: sparse: sparse: got cpus_mask
   include/linux/sched.h:977:60: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:977:60: sparse: sparse: got :
   include/linux/sched.h:978:66: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:978:66: sparse: sparse: got :
   include/linux/sched.h:979:55: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:979:55: sparse: sparse: got :
   include/linux/sched.h:980:55: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:980:55: sparse: sparse: got :
   include/linux/sched.h:983:41: sparse: sparse: Expected ; at the end of type declaration
   include/linux/sched.h:983:41: sparse: sparse: got :
   include/linux/sched.h:1000:60: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1000:60: sparse: sparse: got :
   include/linux/sched.h:1002:55: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1002:55: sparse: sparse: got :
   include/linux/sched.h:1006:54: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1006:54: sparse: sparse: got :
   include/linux/sched.h:1009:50: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1009:50: sparse: sparse: got :
   include/linux/sched.h:1010:50: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1010:50: sparse: sparse: got :
   include/linux/sched.h:1012:56: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1012:56: sparse: sparse: got :
   include/linux/sched.h:1019:53: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1019:53: sparse: sparse: got :
   include/linux/sched.h:1039:54: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1039:54: sparse: sparse: got :
   include/linux/sched.h:1043:51: sparse: sparse: Expected ; at end of declaration
--
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
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/jump_label.h, arch/powerpc/include/asm/cpu_has_feature.h, arch/powerpc/include/asm/hw_breakpoint.h, ...):
   include/linux/cleanup.h:225:15: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cleanup.h:225:15: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/jump_label.h, arch/powerpc/include/asm/cpu_has_feature.h, arch/powerpc/include/asm/hw_breakpoint.h, ...):
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: got arch_static_branch
   arch/powerpc/include/asm/jump_label.h:28:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: got }
   arch/powerpc/include/asm/jump_label.h:43:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/cpu_has_feature.h, arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
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
>> arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got !
>> arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'if' as identifier
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
>> arch/powerpc/include/asm/cpu_has_feature.h:34:17: sparse: sparse: Trying to use reserved word 'return' as identifier
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
>> arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got if
>> arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
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
   include/asm-generic/preempt.h:70:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:70:1: sparse: sparse: got }
   include/asm-generic/preempt.h:79:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:79:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:468:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:468:1: sparse: sparse: got class_preempt_is_conditional
   include/linux/preempt.h:469:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:469:1: sparse: sparse: got class_preempt_notrace_is_conditional
   include/linux/preempt.h:473:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:473:13: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:474:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:474:13: sparse: sparse: got preempt_model_voluntary
   include/linux/preempt.h:475:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:475:13: sparse: sparse: got preempt_model_full
   include/linux/preempt.h:476:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:476:13: sparse: sparse: got preempt_model_lazy
   include/linux/preempt.h:500:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:500:20: sparse: sparse: got preempt_model_rt
   include/linux/preempt.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:503:1: sparse: sparse: got }
   include/linux/preempt.h:515:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:515:20: sparse: sparse: got preempt_model_preemptible
   include/linux/preempt.h:518:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:518:1: sparse: sparse: got }
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
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of statement
   include/linux/irqflags.h:265:1: sparse: sparse: got was_disabled
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: got raw_atomic_try_cmpxchg
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2140:9: sparse: sparse: Trying to use reserved word 'if' as identifier
--
   include/linux/cpumask.h:871:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:871:1: sparse: sparse: got }
   include/linux/cpumask.h:884:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:884:1: sparse: sparse: got }
   include/linux/cpumask.h:898:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:898:1: sparse: sparse: got }
   include/linux/cpumask.h:911:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:911:1: sparse: sparse: got }
   include/linux/cpumask.h:924:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:924:1: sparse: sparse: got }
   include/linux/cpumask.h:935:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:935:1: sparse: sparse: got }
   include/linux/cpumask.h:972:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:972:1: sparse: sparse: got }
   include/linux/cpumask.h:987:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:987:1: sparse: sparse: got }
   include/linux/cpumask.h:999:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:999:1: sparse: sparse: got }
   include/linux/cpumask.h:1011:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1011:1: sparse: sparse: got }
   include/linux/cpumask.h:1021:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1021:1: sparse: sparse: got }
   include/linux/cpumask.h:1079:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1079:1: sparse: sparse: got }
   include/linux/cpumask.h:1085:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1085:1: sparse: sparse: got }
   include/linux/cpumask.h:1090:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/cpumask.h:1090:16: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1090:16: sparse: sparse: got true
   include/linux/cpumask.h:1091:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1091:1: sparse: sparse: got }
   include/linux/cpumask.h:1097:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/cpumask.h:1097:16: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1097:16: sparse: sparse: got true
   include/linux/cpumask.h:1098:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1098:1: sparse: sparse: got }
   include/linux/cpumask.h:1115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1115:1: sparse: sparse: got }
   include/linux/cpumask.h:1118:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/cpumask.h:1118:1: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1118:1: sparse: sparse: got free_cpumask_var
   include/linux/cpumask.h:1118:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1118:1: sparse: sparse: got }
   include/linux/cpumask.h:1165:44: sparse: sparse: Expected ) in function declarator
   include/linux/cpumask.h:1165:44: sparse: sparse: got online
   include/linux/cpumask.h:1166:46: sparse: sparse: Expected ) in function declarator
   include/linux/cpumask.h:1166:46: sparse: sparse: got possible
   include/linux/cpumask.h:1229:29: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1229:29: sparse: sparse: got cpu_online
   include/linux/cpumask.h:1232:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1232:1: sparse: sparse: got }
   include/linux/cpumask.h:1237:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1237:1: sparse: sparse: got }
   include/linux/cpumask.h:1242:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1242:1: sparse: sparse: got }
   include/linux/cpumask.h:1247:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1247:1: sparse: sparse: got }
   include/linux/cpumask.h:1252:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1252:1: sparse: sparse: got }
   include/linux/cpumask.h:1257:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1257:1: sparse: sparse: got }
   include/linux/cpumask.h:1331:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1331:1: sparse: sparse: got }
   include/linux/cpumask.h:1355:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1355:1: sparse: sparse: got }
   include/linux/cpumask.h:1377:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1377:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/lockdep.h, include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/smp.h:18:15: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:18:15: sparse: sparse: got *
   include/linux/smp.h:25:25: sparse: sparse: expected ; at end of declaration
   include/linux/smp.h:25:25: sparse: sparse: Expected } at end of specifier
   include/linux/smp.h:25:25: sparse: sparse: got func
   include/linux/smp.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:27:1: sparse: sparse: got }
   include/linux/smp.h:50:57: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:50:57: sparse: sparse: got func
   include/linux/smp.h:53:44: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:53:44: sparse: sparse: got cond_func
   include/linux/smp.h:70:48: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:70:48: sparse: sparse: got func
   include/linux/smp.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:73:1: sparse: sparse: got }
   include/linux/smp.h:95:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:95:1: sparse: sparse: got }
   include/linux/smp.h:107:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:107:1: sparse: sparse: got }
   include/linux/smp.h:163:40: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:163:40: sparse: sparse: got func
   include/linux/smp.h:165:45: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:165:45: sparse: sparse: got func
   include/linux/smp.h:168:43: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:168:43: sparse: sparse: got func
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/spinlock.h, include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/simple_spinlock.h:35:69: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:35:69: sparse: sparse: got lock
   arch/powerpc/include/asm/simple_spinlock.h:38:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:38:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got !
>> arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got volatile
>> arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Trying to use reserved word 'const' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:43:1: sparse: sparse: got }
>> arch/powerpc/include/asm/simple_spinlock.h:67:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:67:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:67:16: sparse: sparse: got tmp
   arch/powerpc/include/asm/simple_spinlock.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:68:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:73:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:103:17: sparse: sparse: Expected ( after asm
   arch/powerpc/include/asm/simple_spinlock.h:103:17: sparse: sparse: got __volatile__
>> arch/powerpc/include/asm/simple_spinlock.h:102:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:104:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:104:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:111:17: sparse: sparse: Expected ( after asm
   arch/powerpc/include/asm/simple_spinlock.h:111:17: sparse: sparse: got __volatile__
   arch/powerpc/include/asm/simple_spinlock.h:110:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:112:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:112:1: sparse: sparse: got }
>> arch/powerpc/include/asm/simple_spinlock.h:119:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:119:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:119:20: sparse: sparse: got {
   arch/powerpc/include/asm/simple_spinlock.h:121:48: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:121:48: sparse: sparse: got (
   arch/powerpc/include/asm/simple_spinlock.h:121:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:123:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:123:17: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:125:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:125:9: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:133:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:133:13: sparse: sparse: got ->
   arch/powerpc/include/asm/simple_spinlock.h:134:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:134:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:176:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:176:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:176:16: sparse: sparse: got tmp
   arch/powerpc/include/asm/simple_spinlock.h:177:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:177:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:200:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:200:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:200:16: sparse: sparse: got tmp
   arch/powerpc/include/asm/simple_spinlock.h:201:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:201:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:208:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:208:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:208:20: sparse: sparse: got {
   arch/powerpc/include/asm/simple_spinlock.h:210:48: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:210:48: sparse: sparse: got (
   arch/powerpc/include/asm/simple_spinlock.h:210:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:212:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:212:17: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:214:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:214:9: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:222:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:222:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:222:20: sparse: sparse: got {
   arch/powerpc/include/asm/simple_spinlock.h:224:48: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:224:48: sparse: sparse: got (
   arch/powerpc/include/asm/simple_spinlock.h:224:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:228:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:228:9: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:234:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:239:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:239:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:255:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:255:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:261:11: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:261:11: sparse: sparse: got ->
   arch/powerpc/include/asm/simple_spinlock.h:262:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:262:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/rseq_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/workqueue_types.h:17:23: sparse: sparse: expected ; at end of declaration
   include/linux/workqueue_types.h:17:23: sparse: sparse: Expected } at end of specifier
   include/linux/workqueue_types.h:17:23: sparse: sparse: got data
   include/linux/workqueue_types.h:23:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/workqueue_types.h:23:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/unwind_deferred_types.h:36:33: sparse: sparse: expected ; at end of declaration
   include/linux/unwind_deferred_types.h:36:33: sparse: sparse: Expected } at end of specifier
   include/linux/unwind_deferred_types.h:36:33: sparse: sparse: got unwind_mask
   include/linux/unwind_deferred_types.h:40:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/unwind_deferred_types.h:40:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/switch_to.h):
   include/linux/sched.h:923:41: sparse: sparse: expected ; at end of declaration
   include/linux/sched.h:923:41: sparse: sparse: Expected } at end of specifier
   include/linux/sched.h:923:41: sparse: sparse: got *
   include/linux/sched.h:924:41: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:924:41: sparse: sparse: got *
   include/linux/sched.h:925:41: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:925:41: sparse: sparse: got cpus_mask
   include/linux/sched.h:977:60: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:977:60: sparse: sparse: got :
   include/linux/sched.h:978:66: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:978:66: sparse: sparse: got :
   include/linux/sched.h:979:55: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:979:55: sparse: sparse: got :
   include/linux/sched.h:980:55: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:980:55: sparse: sparse: got :
   include/linux/sched.h:983:41: sparse: sparse: Expected ; at the end of type declaration
   include/linux/sched.h:983:41: sparse: sparse: got :
   include/linux/sched.h:1000:60: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1000:60: sparse: sparse: got :
   include/linux/sched.h:1002:55: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1002:55: sparse: sparse: got :
   include/linux/sched.h:1006:54: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1006:54: sparse: sparse: got :
   include/linux/sched.h:1009:50: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1009:50: sparse: sparse: got :
   include/linux/sched.h:1010:50: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1010:50: sparse: sparse: got :
   include/linux/sched.h:1012:56: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1012:56: sparse: sparse: got :
   include/linux/sched.h:1019:53: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1019:53: sparse: sparse: got :
   include/linux/sched.h:1039:54: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1039:54: sparse: sparse: got :
   include/linux/sched.h:1043:51: sparse: sparse: Expected ; at end of declaration
--
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
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpu_has_feature.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/jump_label.h, arch/powerpc/include/asm/cpu_has_feature.h, arch/powerpc/include/asm/hw_breakpoint.h, ...):
   include/linux/cleanup.h:225:15: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cleanup.h:225:15: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/jump_label.h, arch/powerpc/include/asm/cpu_has_feature.h, arch/powerpc/include/asm/hw_breakpoint.h, ...):
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: got arch_static_branch
   arch/powerpc/include/asm/jump_label.h:28:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: got }
   arch/powerpc/include/asm/jump_label.h:43:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/cpu_has_feature.h, arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
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
>> arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got {
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: got !
>> arch/powerpc/include/asm/cpu_has_feature.h:27:9: sparse: sparse: Trying to use reserved word 'if' as identifier
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
>> arch/powerpc/include/asm/cpu_has_feature.h:34:17: sparse: sparse: Trying to use reserved word 'return' as identifier
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
>> arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: got if
>> arch/powerpc/include/asm/cpu_has_feature.h:45:16: sparse: sparse: Trying to use reserved word 'else' as identifier
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
   include/asm-generic/preempt.h:70:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:70:1: sparse: sparse: got }
   include/asm-generic/preempt.h:79:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/preempt.h:79:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:468:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:468:1: sparse: sparse: got class_preempt_is_conditional
   include/linux/preempt.h:469:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:469:1: sparse: sparse: got class_preempt_notrace_is_conditional
   include/linux/preempt.h:473:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:473:13: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:474:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:474:13: sparse: sparse: got preempt_model_voluntary
   include/linux/preempt.h:475:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:475:13: sparse: sparse: got preempt_model_full
   include/linux/preempt.h:476:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:476:13: sparse: sparse: got preempt_model_lazy
   include/linux/preempt.h:500:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:500:20: sparse: sparse: got preempt_model_rt
   include/linux/preempt.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:503:1: sparse: sparse: got }
   include/linux/preempt.h:515:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:515:20: sparse: sparse: got preempt_model_preemptible
   include/linux/preempt.h:518:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:518:1: sparse: sparse: got }
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
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of statement
   include/linux/irqflags.h:265:1: sparse: sparse: got was_disabled
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: got raw_atomic_try_cmpxchg
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2140:9: sparse: sparse: Trying to use reserved word 'if' as identifier
--
   include/linux/cpumask.h:871:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:871:1: sparse: sparse: got }
   include/linux/cpumask.h:884:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:884:1: sparse: sparse: got }
   include/linux/cpumask.h:898:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:898:1: sparse: sparse: got }
   include/linux/cpumask.h:911:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:911:1: sparse: sparse: got }
   include/linux/cpumask.h:924:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:924:1: sparse: sparse: got }
   include/linux/cpumask.h:935:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:935:1: sparse: sparse: got }
   include/linux/cpumask.h:972:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:972:1: sparse: sparse: got }
   include/linux/cpumask.h:987:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:987:1: sparse: sparse: got }
   include/linux/cpumask.h:999:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:999:1: sparse: sparse: got }
   include/linux/cpumask.h:1011:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1011:1: sparse: sparse: got }
   include/linux/cpumask.h:1021:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1021:1: sparse: sparse: got }
   include/linux/cpumask.h:1079:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1079:1: sparse: sparse: got }
   include/linux/cpumask.h:1085:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1085:1: sparse: sparse: got }
   include/linux/cpumask.h:1090:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/cpumask.h:1090:16: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1090:16: sparse: sparse: got true
   include/linux/cpumask.h:1091:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1091:1: sparse: sparse: got }
   include/linux/cpumask.h:1097:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/cpumask.h:1097:16: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1097:16: sparse: sparse: got true
   include/linux/cpumask.h:1098:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1098:1: sparse: sparse: got }
   include/linux/cpumask.h:1115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1115:1: sparse: sparse: got }
   include/linux/cpumask.h:1118:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/cpumask.h:1118:1: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1118:1: sparse: sparse: got free_cpumask_var
   include/linux/cpumask.h:1118:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1118:1: sparse: sparse: got }
   include/linux/cpumask.h:1165:44: sparse: sparse: Expected ) in function declarator
   include/linux/cpumask.h:1165:44: sparse: sparse: got online
   include/linux/cpumask.h:1166:46: sparse: sparse: Expected ) in function declarator
   include/linux/cpumask.h:1166:46: sparse: sparse: got possible
   include/linux/cpumask.h:1229:29: sparse: sparse: Expected ; at end of declaration
   include/linux/cpumask.h:1229:29: sparse: sparse: got cpu_online
   include/linux/cpumask.h:1232:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1232:1: sparse: sparse: got }
   include/linux/cpumask.h:1237:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1237:1: sparse: sparse: got }
   include/linux/cpumask.h:1242:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1242:1: sparse: sparse: got }
   include/linux/cpumask.h:1247:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1247:1: sparse: sparse: got }
   include/linux/cpumask.h:1252:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1252:1: sparse: sparse: got }
   include/linux/cpumask.h:1257:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1257:1: sparse: sparse: got }
   include/linux/cpumask.h:1331:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1331:1: sparse: sparse: got }
   include/linux/cpumask.h:1355:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1355:1: sparse: sparse: got }
   include/linux/cpumask.h:1377:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask.h:1377:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/lockdep.h, include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/smp.h:18:15: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:18:15: sparse: sparse: got *
   include/linux/smp.h:25:25: sparse: sparse: expected ; at end of declaration
   include/linux/smp.h:25:25: sparse: sparse: Expected } at end of specifier
   include/linux/smp.h:25:25: sparse: sparse: got func
   include/linux/smp.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:27:1: sparse: sparse: got }
   include/linux/smp.h:50:57: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:50:57: sparse: sparse: got func
   include/linux/smp.h:53:44: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:53:44: sparse: sparse: got cond_func
   include/linux/smp.h:70:48: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:70:48: sparse: sparse: got func
   include/linux/smp.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:73:1: sparse: sparse: got }
   include/linux/smp.h:95:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:95:1: sparse: sparse: got }
   include/linux/smp.h:107:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/smp.h:107:1: sparse: sparse: got }
   include/linux/smp.h:163:40: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:163:40: sparse: sparse: got func
   include/linux/smp.h:165:45: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:165:45: sparse: sparse: got func
   include/linux/smp.h:168:43: sparse: sparse: Expected ) in function declarator
   include/linux/smp.h:168:43: sparse: sparse: got func
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/spinlock.h, include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/simple_spinlock.h:35:69: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:35:69: sparse: sparse: got lock
   arch/powerpc/include/asm/simple_spinlock.h:38:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:38:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got !
>> arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got volatile
>> arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Trying to use reserved word 'const' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:42:42: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:43:1: sparse: sparse: got }
>> arch/powerpc/include/asm/simple_spinlock.h:67:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:67:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:67:16: sparse: sparse: got tmp
   arch/powerpc/include/asm/simple_spinlock.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:68:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:73:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:103:17: sparse: sparse: Expected ( after asm
   arch/powerpc/include/asm/simple_spinlock.h:103:17: sparse: sparse: got __volatile__
>> arch/powerpc/include/asm/simple_spinlock.h:102:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:104:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:104:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:111:17: sparse: sparse: Expected ( after asm
   arch/powerpc/include/asm/simple_spinlock.h:111:17: sparse: sparse: got __volatile__
   arch/powerpc/include/asm/simple_spinlock.h:110:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:112:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:112:1: sparse: sparse: got }
>> arch/powerpc/include/asm/simple_spinlock.h:119:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:119:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:119:20: sparse: sparse: got {
   arch/powerpc/include/asm/simple_spinlock.h:121:48: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:121:48: sparse: sparse: got (
   arch/powerpc/include/asm/simple_spinlock.h:121:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:123:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:123:17: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:125:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:125:9: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:133:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:133:13: sparse: sparse: got ->
   arch/powerpc/include/asm/simple_spinlock.h:134:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:134:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:176:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:176:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:176:16: sparse: sparse: got tmp
   arch/powerpc/include/asm/simple_spinlock.h:177:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:177:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:200:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:200:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:200:16: sparse: sparse: got tmp
   arch/powerpc/include/asm/simple_spinlock.h:201:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:201:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:208:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:208:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:208:20: sparse: sparse: got {
   arch/powerpc/include/asm/simple_spinlock.h:210:48: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:210:48: sparse: sparse: got (
   arch/powerpc/include/asm/simple_spinlock.h:210:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:212:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:212:17: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:214:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:214:9: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:222:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:222:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:222:20: sparse: sparse: got {
   arch/powerpc/include/asm/simple_spinlock.h:224:48: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/simple_spinlock.h:224:48: sparse: sparse: got (
   arch/powerpc/include/asm/simple_spinlock.h:224:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/simple_spinlock.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:228:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:228:9: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:234:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:239:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:239:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:255:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:255:1: sparse: sparse: got }
   arch/powerpc/include/asm/simple_spinlock.h:261:11: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/simple_spinlock.h:261:11: sparse: sparse: got ->
   arch/powerpc/include/asm/simple_spinlock.h:262:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/simple_spinlock.h:262:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/rseq_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/workqueue_types.h:17:23: sparse: sparse: expected ; at end of declaration
   include/linux/workqueue_types.h:17:23: sparse: sparse: Expected } at end of specifier
   include/linux/workqueue_types.h:17:23: sparse: sparse: got data
   include/linux/workqueue_types.h:23:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/workqueue_types.h:23:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/unwind_deferred_types.h:36:33: sparse: sparse: expected ; at end of declaration
   include/linux/unwind_deferred_types.h:36:33: sparse: sparse: Expected } at end of specifier
   include/linux/unwind_deferred_types.h:36:33: sparse: sparse: got unwind_mask
   include/linux/unwind_deferred_types.h:40:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/unwind_deferred_types.h:40:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/switch_to.h):
   include/linux/sched.h:923:41: sparse: sparse: expected ; at end of declaration
   include/linux/sched.h:923:41: sparse: sparse: Expected } at end of specifier
   include/linux/sched.h:923:41: sparse: sparse: got *
   include/linux/sched.h:924:41: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:924:41: sparse: sparse: got *
   include/linux/sched.h:925:41: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:925:41: sparse: sparse: got cpus_mask
   include/linux/sched.h:977:60: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:977:60: sparse: sparse: got :
   include/linux/sched.h:978:66: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:978:66: sparse: sparse: got :
   include/linux/sched.h:979:55: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:979:55: sparse: sparse: got :
   include/linux/sched.h:980:55: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:980:55: sparse: sparse: got :
   include/linux/sched.h:983:41: sparse: sparse: Expected ; at the end of type declaration
   include/linux/sched.h:983:41: sparse: sparse: got :
   include/linux/sched.h:1000:60: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1000:60: sparse: sparse: got :
   include/linux/sched.h:1002:55: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1002:55: sparse: sparse: got :
   include/linux/sched.h:1006:54: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1006:54: sparse: sparse: got :
   include/linux/sched.h:1009:50: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1009:50: sparse: sparse: got :
   include/linux/sched.h:1010:50: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1010:50: sparse: sparse: got :
   include/linux/sched.h:1012:56: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1012:56: sparse: sparse: got :
   include/linux/sched.h:1019:53: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1019:53: sparse: sparse: got :
   include/linux/sched.h:1039:54: sparse: sparse: Expected ; at end of declaration
   include/linux/sched.h:1039:54: sparse: sparse: got :
   include/linux/sched.h:1043:51: sparse: sparse: Expected ; at end of declaration

vim +/do +27 arch/powerpc/include/asm/cpu_has_feature.h

4db7327194dba0c Kevin Hao           2016-07-23  22  
4db7327194dba0c Kevin Hao           2016-07-23 @23  static __always_inline bool cpu_has_feature(unsigned long feature)
4db7327194dba0c Kevin Hao           2016-07-23  24  {
4db7327194dba0c Kevin Hao           2016-07-23  25  	int i;
4db7327194dba0c Kevin Hao           2016-07-23  26  
4db7327194dba0c Kevin Hao           2016-07-23 @27  	BUILD_BUG_ON(!__builtin_constant_p(feature));
db25a9625dbc3aa Michael Ellerman    2024-05-09  28  	BUILD_BUG_ON(__builtin_popcountl(feature) > 1);
4db7327194dba0c Kevin Hao           2016-07-23  29  
c812c7d8f1470ac Aneesh Kumar K.V    2016-07-23  30  #ifdef CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG
676b2f99b0f6cd1 Nicholas Miehlbradt 2024-04-08 @31  	if (!static_key_feature_checks_initialized) {
c812c7d8f1470ac Aneesh Kumar K.V    2016-07-23  32  		printk("Warning! cpu_has_feature() used prior to jump label init!\n");
c812c7d8f1470ac Aneesh Kumar K.V    2016-07-23  33  		dump_stack();
c812c7d8f1470ac Aneesh Kumar K.V    2016-07-23 @34  		return early_cpu_has_feature(feature);
c812c7d8f1470ac Aneesh Kumar K.V    2016-07-23  35  	}
c812c7d8f1470ac Aneesh Kumar K.V    2016-07-23  36  #endif
c812c7d8f1470ac Aneesh Kumar K.V    2016-07-23  37  
4db7327194dba0c Kevin Hao           2016-07-23  38  	if (CPU_FTRS_ALWAYS & feature)
4db7327194dba0c Kevin Hao           2016-07-23  39  		return true;
4db7327194dba0c Kevin Hao           2016-07-23  40  
4db7327194dba0c Kevin Hao           2016-07-23 @41  	if (!(CPU_FTRS_POSSIBLE & feature))
4db7327194dba0c Kevin Hao           2016-07-23  42  		return false;
4db7327194dba0c Kevin Hao           2016-07-23  43  
4db7327194dba0c Kevin Hao           2016-07-23  44  	i = __builtin_ctzl(feature);
4db7327194dba0c Kevin Hao           2016-07-23 @45  	return static_branch_likely(&cpu_feature_keys[i]);
4db7327194dba0c Kevin Hao           2016-07-23  46  }
4db7327194dba0c Kevin Hao           2016-07-23  47  #else
eed5fae00593ab9 Christophe Leroy    2021-03-10  48  static __always_inline bool cpu_has_feature(unsigned long feature)
b92a226e528423b Kevin Hao           2016-07-23  49  {
b92a226e528423b Kevin Hao           2016-07-23  50  	return early_cpu_has_feature(feature);
b92a226e528423b Kevin Hao           2016-07-23  51  }
4db7327194dba0c Kevin Hao           2016-07-23  52  #endif
b92a226e528423b Kevin Hao           2016-07-23  53  

:::::: The code at line 27 was first introduced by commit
:::::: 4db7327194dba0cb91f274b0f606785a9ee5108d powerpc: Add option to use jump label for cpu_has_feature()

:::::: TO: Kevin Hao <haokexin@gmail.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
