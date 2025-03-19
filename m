Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9EE20C46A
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Mar 2025 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742428636; cv=none; b=FbSPChFEIcrHKkHWaqXc4bxLpMxkxYOHGOloCz3+DJOHXiLKDxBoBFjQ2sE21/Uq34aahrnYAfV5d4DiAKz1xA5Rz/lDY/uRo2zRSvEmXVnRI+47oS5om4DHQhA7C6SK/kMXCbPH7zFonvLMjBwB+Jp85aHTzZu/oQ08pf3pE34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742428636; c=relaxed/simple;
	bh=4kmCfpoqJLqqIrWg1V04CeR3oPNDpAmtEAbeXWbk9wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r6pmqCs26FdNIz1ZGl33gJk/uEfLX/nhJKMy+a2GxvJIAIyOmRkupFfvhsVxZs6D48DGnS7lPsxVWITIAgB9xuqlkgNghaS6Z0wM2Q1Ghaa84tjNZv0sZClR0svwz7EBSjwWyb89+I5IUsCVASw3WofQzaRawYw5wJxa1YJ4f1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lv66SPV6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lv66SPV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742428635; x=1773964635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4kmCfpoqJLqqIrWg1V04CeR3oPNDpAmtEAbeXWbk9wc=;
  b=lv66SPV6xU4DNVb1FUNg2k7dkndVsOOdgWyIb2DZgXa6LADIBFcPZ8Di
   etJuUSIZAYtuxXfJ5lErkOnDWL0XdiCth4sBKZ84zRQN8Nh8TrLM38Kki
   On1H9LZp14uCODNt9qKcbuDiUZru2Cp6t/RUejz6CjkTxWl29MtGpoYPi
   k+rDdgyKB1muhj41W/xAtI4Qm7oa91qrbY13V0fuv8CX7cf5y0YtucAMy
   wFFoUemJwgqmbhMdss2ah8EQJGb1YxmO4QTSUs9K81+byqS0wKV04aHYJ
   37a3zji48ax/HgNe/74Dh7kDLQSdahkNI+vHdrpl/+8oUPeCYuwmz18nj
   g==;
X-CSE-ConnectionGUID: d3fEu6DyR7KuHjquVh3vaQ==
X-CSE-MsgGUID: 8SY0k1UlQMa7jKSEbK0lZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43372564"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="43372564"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 16:57:14 -0700
X-CSE-ConnectionGUID: HJvf3y/YRKakQwalmcVY9A==
X-CSE-MsgGUID: OnUNBjRDQXCqcs15laNvsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="127928293"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 Mar 2025 16:57:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv3Ha-00001n-2V;
	Wed, 19 Mar 2025 23:57:10 +0000
Date: Thu, 20 Mar 2025 07:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11125/12447] vmlinux.o: error: objtool:
 fred_int80_emulation+0x3a: call to ftrace_likely_update() leaves
 .noinstr.text section
Message-ID: <202503200714.mS90jrC1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
commit: 36799069b48198e5ce92d99310060c4aecb4b3e3 [11125/12447] objtool: Add CONFIG_OBJTOOL_WERROR
:::::: branch date: 14 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-005-20250319 (https://download.01.org/0day-ci/archive/20250320/202503200714.mS90jrC1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200714.mS90jrC1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503200714.mS90jrC1-lkp@intel.com/

All errors (new ones prefixed by >>):

   vmlinux.o: error: objtool: do_syscall_64+0x4b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   do_syscall_64+0x25: (alt)
   vmlinux.o: error: objtool:   do_syscall_64+0x367: (branch)
   vmlinux.o: error: objtool:   do_syscall_64+0x1b: (alt)
   vmlinux.o: error: objtool:   do_syscall_64+0x0: <=== (sym)
   vmlinux.o: error: objtool: do_int80_emulation+0x30: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   do_int80_emulation+0x0: <=== (sym)
>> vmlinux.o: error: objtool: fred_int80_emulation+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: error: objtool:   fred_int80_emulation+0x14: (alt)
>> vmlinux.o: error: objtool:   fred_int80_emulation+0x0: <=== (sym)
   vmlinux.o: error: objtool: do_fast_syscall_32+0x5a: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: error: objtool:   do_fast_syscall_32+0x36: (branch)
   vmlinux.o: error: objtool:   do_fast_syscall_32+0x0: <=== (sym)
>> vmlinux.o: error: objtool: fred_hwexc.constprop.0+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: error: objtool:   fred_hwexc.constprop.0+0x0: <=== (sym)
>> vmlinux.o: error: objtool: fred_extint.constprop.0+0x35: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: error: objtool:   fred_extint.constprop.0+0x0: <=== (sym)
>> vmlinux.o: error: objtool: fred_entry_from_user+0xd3: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: error: objtool:   fred_entry_from_user+0x4d: (branch)
   vmlinux.o: error: objtool:   fred_entry_from_user+0x29: (branch)
>> vmlinux.o: error: objtool:   fred_entry_from_user+0x0: <=== (sym)
>> vmlinux.o: error: objtool: fred_entry_from_kernel+0x63: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: error: objtool:   fred_entry_from_kernel+0x25: (branch)
>> vmlinux.o: error: objtool:   fred_entry_from_kernel+0x0: <=== (sym)
   vmlinux.o: error: objtool: __wrgsbase_inactive+0x82: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   __wrgsbase_inactive+0xd: (branch)
   vmlinux.o: error: objtool:   __wrgsbase_inactive+0x0: <=== (sym)
   vmlinux.o: error: objtool: __rdgsbase_inactive+0x81: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   __rdgsbase_inactive+0xd: (branch)
   vmlinux.o: error: objtool:   __rdgsbase_inactive+0x0: <=== (sym)
   vmlinux.o: error: objtool: exc_debug_user+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   exc_debug_user+0x0: <=== (sym)
   vmlinux.o: error: objtool: fixup_bad_iret+0x80: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   fixup_bad_iret+0x0: <=== (sym)
   vmlinux.o: error: objtool: exc_nmi+0x5c: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: error: objtool:   exc_nmi+0x304: (branch)
   vmlinux.o: error: objtool:   exc_nmi+0x24: (branch)
   vmlinux.o: error: objtool:   exc_nmi+0x0: <=== (sym)
>> vmlinux.o: error: objtool: fred_exc_nmi+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: error: objtool:   fred_exc_nmi+0x0: <=== (sym)
   vmlinux.o: error: objtool: poke_int3_handler+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   poke_int3_handler+0x0: <=== (sym)
   vmlinux.o: error: objtool: native_sched_clock+0x71: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: error: objtool:   native_sched_clock+0x4: (alt)
   vmlinux.o: error: objtool:   native_sched_clock+0x0: <=== (sym)
   vmlinux.o: error: objtool: __static_call_update_early+0x27: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   __static_call_update_early+0x0: <=== (sym)
>> vmlinux.o: error: objtool: wait_for_cpus.constprop.0+0x24: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: error: objtool:   wait_for_cpus.constprop.0+0x0: <=== (sym)
   vmlinux.o: error: objtool: pvclock_clocksource_read_nowd+0x7f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   pvclock_clocksource_read_nowd+0x119: (branch)
   vmlinux.o: error: objtool:   pvclock_clocksource_read_nowd+0x150: (branch)
   vmlinux.o: error: objtool:   pvclock_clocksource_read_nowd+0x114: (branch)
   vmlinux.o: error: objtool:   pvclock_clocksource_read_nowd+0x3c: (branch)
   vmlinux.o: error: objtool:   pvclock_clocksource_read_nowd+0x1d: (alt)
   vmlinux.o: error: objtool:   pvclock_clocksource_read_nowd+0x0: <=== (sym)
   vmlinux.o: error: objtool: local_clock_noinstr+0x75: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   local_clock_noinstr+0x133: (branch)
   vmlinux.o: error: objtool:   local_clock_noinstr+0x45: (branch)
   vmlinux.o: error: objtool:   local_clock_noinstr+0x2d: (alt)
   vmlinux.o: error: objtool:   local_clock_noinstr+0xa: (branch)
   vmlinux.o: error: objtool:   local_clock_noinstr+0x0: <=== (sym)
   vmlinux.o: error: objtool: irqentry_nmi_enter+0x4b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   irqentry_nmi_enter+0x0: <=== (sym)
   vmlinux.o: error: objtool: irqentry_nmi_exit+0x69: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   irqentry_nmi_exit+0xd7: (branch)
   vmlinux.o: error: objtool:   irqentry_nmi_exit+0x45: (branch)
   vmlinux.o: error: objtool:   irqentry_nmi_exit+0xc8: (branch)
   vmlinux.o: error: objtool:   irqentry_nmi_exit+0x24: (branch)
   vmlinux.o: error: objtool:   irqentry_nmi_exit+0xa9: (branch)
   vmlinux.o: error: objtool:   irqentry_nmi_exit+0xf: (branch)
   vmlinux.o: error: objtool:   irqentry_nmi_exit+0x0: <=== (sym)
   vmlinux.o: error: objtool: syscall_enter_from_user_mode_prepare+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   syscall_enter_from_user_mode_prepare+0xd: (alt)
   vmlinux.o: error: objtool:   syscall_enter_from_user_mode_prepare+0x0: <=== (sym)
   vmlinux.o: error: objtool: irqentry_enter_from_user_mode+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   irqentry_enter_from_user_mode+0xd: (alt)
   vmlinux.o: error: objtool:   irqentry_enter_from_user_mode+0x0: <=== (sym)
   vmlinux.o: error: objtool: irqentry_exit+0x99: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   irqentry_exit+0x15: (branch)
   vmlinux.o: error: objtool:   irqentry_exit+0x0: <=== (sym)
   vmlinux.o: error: objtool: ct_kernel_exit_state+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   ct_kernel_exit_state+0x68: (branch)
   vmlinux.o: error: objtool:   ct_kernel_exit_state+0x1a: (branch)
   vmlinux.o: error: objtool:   ct_kernel_exit_state+0x0: <=== (sym)
   vmlinux.o: error: objtool: ct_kernel_enter_state+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   ct_kernel_enter_state+0x68: (branch)
   vmlinux.o: error: objtool:   ct_kernel_enter_state+0x1a: (branch)
   vmlinux.o: error: objtool:   ct_kernel_enter_state+0x0: <=== (sym)
   vmlinux.o: error: objtool: context_tracking_recursion_enter+0xa6: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   context_tracking_recursion_enter+0x2e: (branch)
   vmlinux.o: error: objtool:   context_tracking_recursion_enter+0x0: <=== (sym)
   vmlinux.o: error: objtool: ct_kernel_enter.constprop.0+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   ct_kernel_enter.constprop.0+0x1ab: (branch)
   vmlinux.o: error: objtool:   ct_kernel_enter.constprop.0+0x1a: (branch)
   vmlinux.o: error: objtool:   ct_kernel_enter.constprop.0+0x0: <=== (sym)
   vmlinux.o: error: objtool: ct_kernel_exit.constprop.0+0x62: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   ct_kernel_exit.constprop.0+0x204: (branch)
   vmlinux.o: error: objtool:   ct_kernel_exit.constprop.0+0x1e: (branch)
   vmlinux.o: error: objtool:   ct_kernel_exit.constprop.0+0x0: <=== (sym)
   vmlinux.o: error: objtool: ct_idle_enter+0x14: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   ct_idle_enter+0x0: <=== (sym)
   vmlinux.o: error: objtool: __ct_user_enter+0x154: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   __ct_user_enter+0x3a: (branch)
   vmlinux.o: error: objtool:   __ct_user_enter+0x19c: (branch)
   vmlinux.o: error: objtool:   __ct_user_enter+0x24: (branch)
   vmlinux.o: error: objtool:   __ct_user_enter+0x0: <=== (sym)
   vmlinux.o: error: objtool: ct_nmi_enter+0x56: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   ct_nmi_enter+0x1d5: (branch)
   vmlinux.o: error: objtool:   ct_nmi_enter+0x1d: (branch)
   vmlinux.o: error: objtool:   ct_nmi_enter+0x0: <=== (sym)
   vmlinux.o: error: objtool: ct_irq_enter+0x62: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   ct_irq_enter+0xd: (branch)
   vmlinux.o: error: objtool:   ct_irq_enter+0x0: <=== (sym)
   vmlinux.o: error: objtool: ct_irq_exit+0x62: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   ct_irq_exit+0xd: (branch)
   vmlinux.o: error: objtool:   ct_irq_exit+0x0: <=== (sym)
   vmlinux.o: error: objtool: check_preemption_disabled+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   check_preemption_disabled+0x0: <=== (sym)
   vmlinux.o: error: objtool: mwait_idle+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   mwait_idle+0x0: <=== (sym)
   vmlinux.o: error: objtool: acpi_processor_ffh_cstate_enter+0x8e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   acpi_processor_ffh_cstate_enter+0x62: (alt)
   vmlinux.o: error: objtool:   acpi_processor_ffh_cstate_enter+0x55: (alt)
   vmlinux.o: error: objtool:   acpi_processor_ffh_cstate_enter+0x139: (branch)
   vmlinux.o: error: objtool:   acpi_processor_ffh_cstate_enter+0x4b: (branch)
   vmlinux.o: error: objtool:   acpi_processor_ffh_cstate_enter+0x14d: (branch)
   vmlinux.o: error: objtool:   acpi_processor_ffh_cstate_enter+0x39: (branch)
   vmlinux.o: error: objtool:   acpi_processor_ffh_cstate_enter+0x161: (branch)
   vmlinux.o: error: objtool:   acpi_processor_ffh_cstate_enter+0x23: (branch)
   vmlinux.o: error: objtool:   acpi_processor_ffh_cstate_enter+0x0: <=== (sym)
   vmlinux.o: error: objtool: acpi_idle_enter_s2idle+0x91: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   acpi_idle_enter_s2idle+0x4c: (branch)
   vmlinux.o: error: objtool:   acpi_idle_enter_s2idle+0xf0: (branch)
   vmlinux.o: error: objtool:   acpi_idle_enter_s2idle+0x36: (branch)
   vmlinux.o: error: objtool:   acpi_idle_enter_s2idle+0xdc: (branch)
   vmlinux.o: error: objtool:   acpi_idle_enter_s2idle+0x1c: (branch)
   vmlinux.o: error: objtool:   acpi_idle_enter_s2idle+0x0: <=== (sym)
   vmlinux.o: error: objtool: acpi_idle_enter+0x70: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   acpi_idle_enter+0x15a: (branch)
   vmlinux.o: error: objtool:   acpi_idle_enter+0x36: (branch)
   vmlinux.o: error: objtool:   acpi_idle_enter+0x16e: (branch)
   vmlinux.o: error: objtool:   acpi_idle_enter+0x1c: (branch)
   vmlinux.o: error: objtool:   acpi_idle_enter+0x0: <=== (sym)
   vmlinux.o: error: objtool: poll_idle+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   poll_idle+0x0: <=== (sym)
   vmlinux.o: error: objtool: default_enter_idle+0x2c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: error: objtool:   default_enter_idle+0x0: <=== (sym)
   vmlinux.o: error: objtool: 42 warning(s) upgraded to errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
