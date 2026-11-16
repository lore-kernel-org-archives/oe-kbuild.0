Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795249;
	b=BFSeTDS8622rrUIKugdeOcWzLsXtuaxYvpFNuGtaJL3Dz1VUOnjkTDb3Dxl8eIACvoa0
	 yM8iYiDmLxHNkUjEX6bdyoOrhBErc71vJLY7VKH6mbeLagmtmbQQCjeXMkr3O/FMGOA7i
	 PpBeX61K7qozIfriRmLXkQlIFob7RFbt2/csTYvaITPE0RkOIEIYxxV3dif8R5bT8janR
	 E69BI6sgL7tpWTVhR8xSVx9s9bdKGKbehl9vZx3AYb8M2JfFIVYRosADMwbzS2auUHiH1
	 6FvILNFOZrWhlwbu6DaUugY/tMgBL3UntVuB2Z5M6kR5zTIuMRhgJcNmUeRg2Y6bQrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795249;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ALa//aWzJRhwoMDEKBFrG+oQ+YaBuHfVk6/64TdqONU=;
	b=Y2QvHA4muvsqSEmuh4+SGnTtuPP7s0rRrfSoPqce5C4DADx+BHE2rzjmgXvDaAQ5XtNe
	 Q0Yc2e6+NS3AOegpXokIox6OlhZHKSw+AuEP4UreCGctniDFNKsCMydVPeVMdBCMlAgI1
	 xOtaA/SyL24htM+iuzYwKDWMoOfTxfdXrcCoNjF336nKNgafmgy3iUW98f3GBG1cT8PWF
	 Eq95I7PYY3x9G0WyC2/m6jyHdycEfjeUm8c34jKJ/LKp8nHmE1ACm1VOrTOSVdZdvQpqa
	 kXDNMxo3eH/s15nzGXt4diFL5jmmycszkfV/HkxMKG+dsSlup2ldALA4laHuESj9pPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EL3c4vwl;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D66606A32A
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 02:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D66606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EL3c4vwl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794795247; x=1826331247;
  h=date:from:to:cc:subject:message-id;
  bh=N32TeiJv8FJ8oIqthOI0z35OU2Znd/6F45bCU5F7K2s=;
  b=EL3c4vwlS58MRa0dFGCr/epuhPYTBqE43EcOs3fjF5wKHcGnEAYffo7+
   tZiKXJjhz8+okbyQGlzjpTPN3jtqXJvpmDdwlfnF4M/LURuJ+dKkACqCA
   R01I6R0YN5anAuF81L18xZc8WP1lhjpF+Der0kfSayGcgrceMKQmZ9Gc3
   sAh2zCf7aAjpv1a4oXVgRbwQiVmj68ksx6Mpc1I3Ku4UV06FV4ic9nyLL
   cNVQYTNiW9gMziH17qX0tSUwy1mH0qI+vQCdXmA9eKaw8kI810c28fsTI
   IQw20bpKbA20Yl38D+ke0UWSPCuXshICeWn3nuLj81TLxEgjroTfU0p9P
   g==;
X-CSE-ConnectionGUID: Jk6trwWYRLai3pzMCrMgwA==
X-CSE-MsgGUID: k/1GDzB9TDGIxpH8rM08gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3626786"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3626786"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 18:14:06 -0800
X-CSE-ConnectionGUID: NDNDJtuOROGaPFyjWSMTDg==
X-CSE-MsgGUID: B26Z+ie9Sraodc1ehZX/9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9265019"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2026 18:14:05 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSmEK-000000002Z5-2Xrl;
	Mon, 16 Nov 2026 02:14:00 +0000
Date: Mon, 16 Nov 2026 03:13:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/jump_label.h:167:9: sparse: sparse: Trying to
 use reserved word 'else' as identifier
Message-ID: <202611160349.9dzNzQTR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/static-indicators/76/769d603fc44f896e7f61de7f0cdb8b78d46bc8c8-reported_build_error_fbc-sparse"
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved word 'else' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aebb7274476403040d582c61478df8f4a7bf9cd3
commit: 769d603fc44f896e7f61de7f0cdb8b78d46bc8c8 raid6: hide internals
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: powerpc64-randconfig-r2302-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160349.9dzNzQTR-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160349.9dzNzQTR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 769d603fc44f ("raid6: hide internals")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611160349.9dzNzQTR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/overflow.h:378:16: sparse: sparse: got bytes
   include/linux/overflow.h:379:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:379:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/string.h:294:20: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:294:20: sparse: sparse: got mem_is_zero
   include/linux/string.h:297:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/string.h:297:1: sparse: sparse: got }
   include/linux/string.h:322:13: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:322:13: sparse: sparse: got parse_option_str
   include/linux/string.h:325:13: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:325:13: sparse: sparse: got sysfs_streq
   include/linux/string.h:339:69: sparse: sparse: Expected ) in function declarator
   include/linux/string.h:339:69: sparse: sparse: got args
   include/linux/string.h:567:20: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:567:20: sparse: sparse: got strstarts
   include/linux/string.h:570:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/string.h:570:1: sparse: sparse: got }
   include/linux/string.h:585:21: sparse: sparse: Expected ) in function declarator
   include/linux/string.h:585:21: sparse: sparse: got <
   include/linux/string.h:585:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/string.h:588:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/string.h:588:16: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:588:16: sparse: sparse: got !
   include/linux/string.h:589:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/string.h:589:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, arch/powerpc/include/asm/mmu.h, ...):
   include/linux/panic.h:15:38: sparse: sparse: Expected ) in function declarator
   include/linux/panic.h:15:38: sparse: sparse: got args
   include/linux/panic.h:20:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:20:13: sparse: sparse: got oops_may_print
   include/linux/panic.h:22:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:22:13: sparse: sparse: got panic_triggering_all_cpu_backtrace
   include/linux/panic.h:29:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:29:13: sparse: sparse: got panic_on_taint_nousertaint
   include/linux/panic.h:33:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:33:13: sparse: sparse: got crash_kexec_post_notifiers
   include/linux/panic.h:54:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:54:6: sparse: sparse: got panic_try_start
   include/linux/panic.h:56:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:56:6: sparse: sparse: got panic_in_progress
   include/linux/panic.h:57:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:57:6: sparse: sparse: got panic_on_this_cpu
   include/linux/panic.h:58:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:58:6: sparse: sparse: got panic_on_other_cpu
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, ...):
   include/linux/init.h:165:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:165:13: sparse: sparse: got rodata_enabled
   include/linux/init.h:170:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:170:13: sparse: sparse: got initcall_debug
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, arch/powerpc/include/asm/mmu.h, ...):
   include/linux/printk.h:86:17: sparse: sparse: expected ; at end of declaration
   include/linux/printk.h:86:17: sparse: sparse: Expected } at end of specifier
   include/linux/printk.h:86:17: sparse: sparse: got *
   include/linux/printk.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/printk.h:87:1: sparse: sparse: got }
   include/linux/printk.h:152:43: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:152:43: sparse: sparse: got args
   include/linux/printk.h:155:38: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:155:38: sparse: sparse: got args
   include/linux/printk.h:157:47: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:157:47: sparse: sparse: got args
   include/linux/printk.h:188:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:188:13: sparse: sparse: got printk_timed_ratelimit
   include/linux/printk.h:208:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:208:13: sparse: sparse: got nbcon_device_try_acquire
   include/linux/printk.h:211:6: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:211:6: sparse: sparse: got pr_flush
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:80:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:80:13: sparse: sparse: got static_key_initialized
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/jump_label.h, include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, ...):
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: got static_key_feature_checks_initialized
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
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
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_branch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
>> include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved word 'else' as identifier
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
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, arch/powerpc/include/asm/mmu.h, ...):
   include/linux/printk.h:767:36: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:767:36: sparse: sparse: got ascii
   include/linux/printk.h:771:62: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:771:62: sparse: sparse: got ascii
   include/linux/printk.h:812:75: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:812:75: sparse: sparse: got ascii
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/bug.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, ...):
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: got die_will_crash
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/bug.h:94:33: sparse: sparse: Expected ; at end of declaration
   include/linux/bug.h:94:33: sparse: sparse: got check_data_corruption
   include/linux/bug.h:94:75: sparse: sparse: Expected ; at the end of type declaration
   include/linux/bug.h:94:75: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: got generic___test_and_set_bit
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: got &
   include/asm-generic/bitops/generic-non-atomic.h:80:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: got &
   include/asm-generic/bitops/generic-non-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: got &
   include/asm-generic/bitops/generic-non-atomic.h:112:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:113:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:113:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:129:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:140:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:16: sparse: sparse: got 1UL
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got !
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ) in nested declarator
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got volatile
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got *
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:172:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: got !
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: got is_rlwinm_mask_valid
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:89:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: got +=
   arch/powerpc/include/asm/bitops.h:93:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: got !
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got 0
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Trying to use reserved word 'if' as identifier
--
   include/linux/overflow.h:378:16: sparse: sparse: got bytes
   include/linux/overflow.h:379:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:379:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/string.h:294:20: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:294:20: sparse: sparse: got mem_is_zero
   include/linux/string.h:297:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/string.h:297:1: sparse: sparse: got }
   include/linux/string.h:322:13: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:322:13: sparse: sparse: got parse_option_str
   include/linux/string.h:325:13: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:325:13: sparse: sparse: got sysfs_streq
   include/linux/string.h:339:69: sparse: sparse: Expected ) in function declarator
   include/linux/string.h:339:69: sparse: sparse: got args
   include/linux/string.h:567:20: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:567:20: sparse: sparse: got strstarts
   include/linux/string.h:570:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/string.h:570:1: sparse: sparse: got }
   include/linux/string.h:585:21: sparse: sparse: Expected ) in function declarator
   include/linux/string.h:585:21: sparse: sparse: got <
   include/linux/string.h:585:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/string.h:588:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/string.h:588:16: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:588:16: sparse: sparse: got !
   include/linux/string.h:589:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/string.h:589:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, arch/powerpc/include/asm/mmu.h, ...):
   include/linux/panic.h:15:38: sparse: sparse: Expected ) in function declarator
   include/linux/panic.h:15:38: sparse: sparse: got args
   include/linux/panic.h:20:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:20:13: sparse: sparse: got oops_may_print
   include/linux/panic.h:22:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:22:13: sparse: sparse: got panic_triggering_all_cpu_backtrace
   include/linux/panic.h:29:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:29:13: sparse: sparse: got panic_on_taint_nousertaint
   include/linux/panic.h:33:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:33:13: sparse: sparse: got crash_kexec_post_notifiers
   include/linux/panic.h:54:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:54:6: sparse: sparse: got panic_try_start
   include/linux/panic.h:56:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:56:6: sparse: sparse: got panic_in_progress
   include/linux/panic.h:57:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:57:6: sparse: sparse: got panic_on_this_cpu
   include/linux/panic.h:58:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:58:6: sparse: sparse: got panic_on_other_cpu
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, ...):
   include/linux/init.h:165:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:165:13: sparse: sparse: got rodata_enabled
   include/linux/init.h:170:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:170:13: sparse: sparse: got initcall_debug
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, arch/powerpc/include/asm/mmu.h, ...):
   include/linux/printk.h:86:17: sparse: sparse: expected ; at end of declaration
   include/linux/printk.h:86:17: sparse: sparse: Expected } at end of specifier
   include/linux/printk.h:86:17: sparse: sparse: got *
   include/linux/printk.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/printk.h:87:1: sparse: sparse: got }
   include/linux/printk.h:152:43: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:152:43: sparse: sparse: got args
   include/linux/printk.h:155:38: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:155:38: sparse: sparse: got args
   include/linux/printk.h:157:47: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:157:47: sparse: sparse: got args
   include/linux/printk.h:188:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:188:13: sparse: sparse: got printk_timed_ratelimit
   include/linux/printk.h:208:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:208:13: sparse: sparse: got nbcon_device_try_acquire
   include/linux/printk.h:211:6: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:211:6: sparse: sparse: got pr_flush
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:80:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:80:13: sparse: sparse: got static_key_initialized
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/jump_label.h, include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, ...):
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: got static_key_feature_checks_initialized
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
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
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_branch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
>> include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved word 'else' as identifier
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
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, arch/powerpc/include/asm/mmu.h, ...):
   include/linux/printk.h:767:36: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:767:36: sparse: sparse: got ascii
   include/linux/printk.h:771:62: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:771:62: sparse: sparse: got ascii
   include/linux/printk.h:812:75: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:812:75: sparse: sparse: got ascii
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/bug.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, ...):
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: got die_will_crash
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/bug.h:94:33: sparse: sparse: Expected ; at end of declaration
   include/linux/bug.h:94:33: sparse: sparse: got check_data_corruption
   include/linux/bug.h:94:75: sparse: sparse: Expected ; at the end of type declaration
   include/linux/bug.h:94:75: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: got generic___test_and_set_bit
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: got &
   include/asm-generic/bitops/generic-non-atomic.h:80:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: got &
   include/asm-generic/bitops/generic-non-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: got &
   include/asm-generic/bitops/generic-non-atomic.h:112:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:113:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:113:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:129:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:140:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:16: sparse: sparse: got 1UL
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got !
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ) in nested declarator
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got volatile
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got *
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:172:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: got !
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: got is_rlwinm_mask_valid
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:89:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: got +=
   arch/powerpc/include/asm/bitops.h:93:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: got !
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got 0
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Trying to use reserved word 'if' as identifier
--
   include/linux/overflow.h:378:16: sparse: sparse: got bytes
   include/linux/overflow.h:379:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:379:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/string.h:294:20: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:294:20: sparse: sparse: got mem_is_zero
   include/linux/string.h:297:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/string.h:297:1: sparse: sparse: got }
   include/linux/string.h:322:13: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:322:13: sparse: sparse: got parse_option_str
   include/linux/string.h:325:13: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:325:13: sparse: sparse: got sysfs_streq
   include/linux/string.h:339:69: sparse: sparse: Expected ) in function declarator
   include/linux/string.h:339:69: sparse: sparse: got args
   include/linux/string.h:567:20: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:567:20: sparse: sparse: got strstarts
   include/linux/string.h:570:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/string.h:570:1: sparse: sparse: got }
   include/linux/string.h:585:21: sparse: sparse: Expected ) in function declarator
   include/linux/string.h:585:21: sparse: sparse: got <
   include/linux/string.h:585:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/string.h:588:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/string.h:588:16: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:588:16: sparse: sparse: got !
   include/linux/string.h:589:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/string.h:589:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, arch/powerpc/include/asm/mmu.h, ...):
   include/linux/panic.h:15:38: sparse: sparse: Expected ) in function declarator
   include/linux/panic.h:15:38: sparse: sparse: got args
   include/linux/panic.h:20:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:20:13: sparse: sparse: got oops_may_print
   include/linux/panic.h:22:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:22:13: sparse: sparse: got panic_triggering_all_cpu_backtrace
   include/linux/panic.h:29:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:29:13: sparse: sparse: got panic_on_taint_nousertaint
   include/linux/panic.h:33:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:33:13: sparse: sparse: got crash_kexec_post_notifiers
   include/linux/panic.h:54:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:54:6: sparse: sparse: got panic_try_start
   include/linux/panic.h:56:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:56:6: sparse: sparse: got panic_in_progress
   include/linux/panic.h:57:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:57:6: sparse: sparse: got panic_on_this_cpu
   include/linux/panic.h:58:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:58:6: sparse: sparse: got panic_on_other_cpu
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, ...):
   include/linux/init.h:165:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:165:13: sparse: sparse: got rodata_enabled
   include/linux/init.h:170:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:170:13: sparse: sparse: got initcall_debug
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, arch/powerpc/include/asm/mmu.h, ...):
   include/linux/printk.h:86:17: sparse: sparse: expected ; at end of declaration
   include/linux/printk.h:86:17: sparse: sparse: Expected } at end of specifier
   include/linux/printk.h:86:17: sparse: sparse: got *
   include/linux/printk.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/printk.h:87:1: sparse: sparse: got }
   include/linux/printk.h:152:43: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:152:43: sparse: sparse: got args
   include/linux/printk.h:155:38: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:155:38: sparse: sparse: got args
   include/linux/printk.h:157:47: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:157:47: sparse: sparse: got args
   include/linux/printk.h:188:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:188:13: sparse: sparse: got printk_timed_ratelimit
   include/linux/printk.h:208:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:208:13: sparse: sparse: got nbcon_device_try_acquire
   include/linux/printk.h:211:6: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:211:6: sparse: sparse: got pr_flush
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:80:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:80:13: sparse: sparse: got static_key_initialized
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/jump_label.h, include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, ...):
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: got static_key_feature_checks_initialized
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
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
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_branch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
>> include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved word 'else' as identifier
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
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, arch/powerpc/include/asm/mmu.h, ...):
   include/linux/printk.h:767:36: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:767:36: sparse: sparse: got ascii
   include/linux/printk.h:771:62: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:771:62: sparse: sparse: got ascii
   include/linux/printk.h:812:75: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:812:75: sparse: sparse: got ascii
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/bug.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, ...):
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: got die_will_crash
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/bug.h:94:33: sparse: sparse: Expected ; at end of declaration
   include/linux/bug.h:94:33: sparse: sparse: got check_data_corruption
   include/linux/bug.h:94:75: sparse: sparse: Expected ; at the end of type declaration
   include/linux/bug.h:94:75: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: got generic___test_and_set_bit
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: got &
   include/asm-generic/bitops/generic-non-atomic.h:80:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: got &
   include/asm-generic/bitops/generic-non-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: got &
   include/asm-generic/bitops/generic-non-atomic.h:112:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:113:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:113:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:129:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:140:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:16: sparse: sparse: got 1UL
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got !
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ) in nested declarator
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got volatile
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got *
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:172:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: got !
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: got is_rlwinm_mask_valid
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:89:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: got +=
   arch/powerpc/include/asm/bitops.h:93:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: got !
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got 0
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Trying to use reserved word 'if' as identifier
--
   include/linux/overflow.h:378:16: sparse: sparse: got bytes
   include/linux/overflow.h:379:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:379:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/string.h:294:20: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:294:20: sparse: sparse: got mem_is_zero
   include/linux/string.h:297:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/string.h:297:1: sparse: sparse: got }
   include/linux/string.h:322:13: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:322:13: sparse: sparse: got parse_option_str
   include/linux/string.h:325:13: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:325:13: sparse: sparse: got sysfs_streq
   include/linux/string.h:339:69: sparse: sparse: Expected ) in function declarator
   include/linux/string.h:339:69: sparse: sparse: got args
   include/linux/string.h:567:20: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:567:20: sparse: sparse: got strstarts
   include/linux/string.h:570:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/string.h:570:1: sparse: sparse: got }
   include/linux/string.h:585:21: sparse: sparse: Expected ) in function declarator
   include/linux/string.h:585:21: sparse: sparse: got <
   include/linux/string.h:585:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/string.h:588:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/string.h:588:16: sparse: sparse: Expected ; at end of declaration
   include/linux/string.h:588:16: sparse: sparse: got !
   include/linux/string.h:589:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/string.h:589:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, arch/powerpc/include/asm/mmu.h, ...):
   include/linux/panic.h:15:38: sparse: sparse: Expected ) in function declarator
   include/linux/panic.h:15:38: sparse: sparse: got args
   include/linux/panic.h:20:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:20:13: sparse: sparse: got oops_may_print
   include/linux/panic.h:22:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:22:13: sparse: sparse: got panic_triggering_all_cpu_backtrace
   include/linux/panic.h:29:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:29:13: sparse: sparse: got panic_on_taint_nousertaint
   include/linux/panic.h:33:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:33:13: sparse: sparse: got crash_kexec_post_notifiers
   include/linux/panic.h:54:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:54:6: sparse: sparse: got panic_try_start
   include/linux/panic.h:56:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:56:6: sparse: sparse: got panic_in_progress
   include/linux/panic.h:57:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:57:6: sparse: sparse: got panic_on_this_cpu
   include/linux/panic.h:58:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:58:6: sparse: sparse: got panic_on_other_cpu
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, ...):
   include/linux/init.h:165:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:165:13: sparse: sparse: got rodata_enabled
   include/linux/init.h:170:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:170:13: sparse: sparse: got initcall_debug
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, arch/powerpc/include/asm/mmu.h, ...):
   include/linux/printk.h:86:17: sparse: sparse: expected ; at end of declaration
   include/linux/printk.h:86:17: sparse: sparse: Expected } at end of specifier
   include/linux/printk.h:86:17: sparse: sparse: got *
   include/linux/printk.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/printk.h:87:1: sparse: sparse: got }
   include/linux/printk.h:152:43: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:152:43: sparse: sparse: got args
   include/linux/printk.h:155:38: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:155:38: sparse: sparse: got args
   include/linux/printk.h:157:47: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:157:47: sparse: sparse: got args
   include/linux/printk.h:188:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:188:13: sparse: sparse: got printk_timed_ratelimit
   include/linux/printk.h:208:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:208:13: sparse: sparse: got nbcon_device_try_acquire
   include/linux/printk.h:211:6: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:211:6: sparse: sparse: got pr_flush
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:80:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:80:13: sparse: sparse: got static_key_initialized
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/jump_label.h, include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, ...):
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: got static_key_feature_checks_initialized
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
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
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_branch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
>> include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved word 'else' as identifier
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
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, arch/powerpc/include/asm/mmu.h, ...):
   include/linux/printk.h:767:36: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:767:36: sparse: sparse: got ascii
   include/linux/printk.h:771:62: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:771:62: sparse: sparse: got ascii
   include/linux/printk.h:812:75: sparse: sparse: Expected ) in function declarator
   include/linux/printk.h:812:75: sparse: sparse: got ascii
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/bug.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, ...):
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: got die_will_crash
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/bug.h:94:33: sparse: sparse: Expected ; at end of declaration
   include/linux/bug.h:94:33: sparse: sparse: got check_data_corruption
   include/linux/bug.h:94:75: sparse: sparse: Expected ; at the end of type declaration
   include/linux/bug.h:94:75: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: got generic___test_and_set_bit
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: got &
   include/asm-generic/bitops/generic-non-atomic.h:80:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: got &
   include/asm-generic/bitops/generic-non-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: got &
   include/asm-generic/bitops/generic-non-atomic.h:112:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:113:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:113:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:129:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:140:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:16: sparse: sparse: got 1UL
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got !
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ) in nested declarator
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got volatile
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got *
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:172:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: got !
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: got is_rlwinm_mask_valid
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:89:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: got +=
   arch/powerpc/include/asm/bitops.h:93:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: got !
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got 0
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Trying to use reserved word 'if' as identifier

vim +/else +167 include/linux/jump_label.h

9ae033aca8d600 Ard Biesheuvel 2018-09-18  162  
5af0ea293d78c8 Peter Zijlstra 2021-05-06  163  static inline void jump_entry_set_init(struct jump_entry *entry, bool set)
9ae033aca8d600 Ard Biesheuvel 2018-09-18  164  {
5af0ea293d78c8 Peter Zijlstra 2021-05-06  165  	if (set)
19483677684b6c Ard Biesheuvel 2018-09-18  166  		entry->key |= 2;
5af0ea293d78c8 Peter Zijlstra 2021-05-06 @167  	else
5af0ea293d78c8 Peter Zijlstra 2021-05-06  168  		entry->key &= ~2;
9ae033aca8d600 Ard Biesheuvel 2018-09-18  169  }
9ae033aca8d600 Ard Biesheuvel 2018-09-18  170  

:::::: The code at line 167 was first introduced by commit
:::::: 5af0ea293d78c8b8f0b87ae2b13f7ac584057bc3 jump_label: Free jump_entry::key bit1 for build use

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
