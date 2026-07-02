Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CBB44D03B
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994612; cv=none; b=tmure+zzRFGiBcHxWMhd62xWl6bI1osmESp/xbwqNVkzx6cLSwpfytKmxuz3c+QL/hRVbcaFjrEuX6kV4lLllQEYBvAbcdkA7wE2uwttIpV6c7Pp7VjS2s5KmtAChxqAFTx29bmHmei1XMTNHA21lrKlLddNuAGPivJsCM+2SBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994612; c=relaxed/simple;
	bh=zhGGaydKbvFmf6zDH0CH0e8kI3EGlq1hAysLqbEMTEI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k4x2vkmBSc1vcegK8FJ5nlolzYW2Pm/WJGBN2FLz/TFv+aqzQmatkeOm7OQi5YizsDGdBLeoskKzowXrLtpN89PApxzsDm8pu+6fr4LO4C0hWG5wcwx3pEkJLUGYd4SHW/36gg8ZVGaY4qRuGCJrxNNNYsKMtXcAVvWT5rHVLGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTWqRIIL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTWqRIIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782994595; x=1814530595;
  h=date:from:to:cc:subject:message-id;
  bh=zhGGaydKbvFmf6zDH0CH0e8kI3EGlq1hAysLqbEMTEI=;
  b=LTWqRIILZK9b18jSkahSI/fPWlgHkO+X4XsvEctquNLJO3cRvZCVI3xz
   rSaKOHqIkbDd71NITMazv9pyphSB91y+0PAXqXNW1/6RA3zpKHVRWWSD+
   VqeIbvNKQf7tusI8HGtgA8qq+afbNnmhWik55/wARcFSCVoFQOp4WaAsy
   C4PMpon3hcMRma22uiOAJtmMGsYRtiEpW1u4sta3g1PIhxzx1EY/Mm+MT
   3LKWwErNi+Bf75xD/jNmvWwaqZ8+nfdDJ1xZhB7WgT62ZwRUtXYSBGhfH
   ufqCXZ+3mmhXfLQ7PZnIJdSIZJT+6gPvTn8g0ucQr05k4S8zPHbgGFlR1
   Q==;
X-CSE-ConnectionGUID: R5bAyj6mTa+5cM6MjIfdiw==
X-CSE-MsgGUID: eQJnGRNmQqm3G4eHy2KygA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83617761"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83617761"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 05:16:34 -0700
X-CSE-ConnectionGUID: HwJsm65pQLadQuu4H0cWfw==
X-CSE-MsgGUID: WowvYIFbQ8+upgQPPZ9W1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251796108"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Jul 2026 05:16:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfGL7-00000000Alb-14pL;
	Thu, 02 Jul 2026 12:16:24 +0000
Date: Thu, 02 Jul 2026 20:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/include/asm/pgtable-be-types.h:90:9: sparse:
 sparse: Trying to use reserved word 'return' as identifier
Message-ID: <202607022003.UHorkyhx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/powerpc/include/asm/pgtable-be-types.h:90:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: 769d603fc44f896e7f61de7f0cdb8b78d46bc8c8 raid6: hide internals
date:   5 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 weeks ago
config: powerpc64-randconfig-r121-20260702 (https://download.01.org/0day-ci/archive/20260702/202607022003.UHorkyhx-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607022003.UHorkyhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 769d603fc44f ("raid6: hide internals")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607022003.UHorkyhx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/sched.h:18:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/sched.h:18:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/sched.h:18:16: sparse: sparse: got __ffs
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'const_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/kstrtox.h:98:49: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:98:49: sparse: sparse: got *
   include/linux/kstrtox.h:110:80: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:110:80: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/log2.h:45:6: sparse: sparse: Expected ; at end of declaration
   include/linux/log2.h:45:6: sparse: sparse: got is_power_of_2
   include/linux/log2.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:48:1: sparse: sparse: got }
   include/linux/log2.h:58:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:58:1: sparse: sparse: got }
   include/linux/log2.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:68:1: sparse: sparse: got }
   include/linux/log2.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:202:1: sparse: sparse: got }
   include/linux/log2.h:230:26: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:230:26: sparse: sparse: got (
   include/linux/log2.h:230:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/log2.h:232:16: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:232:16: sparse: sparse: got (
   include/linux/log2.h:232:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/log2.h:233:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:233:1: sparse: sparse: got }
   include/linux/log2.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:270:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/math.h:111:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/math.h:111:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/minmax.h:276:20: sparse: sparse: Expected ; at end of declaration
   include/linux/minmax.h:276:20: sparse: sparse: got in_range64
   include/linux/minmax.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:279:1: sparse: sparse: got }
   include/linux/minmax.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:284:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/sprintf.h:14:79: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:14:79: sparse: sparse: got args
   include/linux/sprintf.h:16:80: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:16:80: sparse: sparse: got args
   include/linux/sprintf.h:18:78: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:18:78: sparse: sparse: got args
   include/linux/sprintf.h:19:81: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:19:81: sparse: sparse: got args
   include/linux/sprintf.h:25:13: sparse: sparse: Expected ; at end of declaration
   include/linux/sprintf.h:25:13: sparse: sparse: got no_hash_pointers
   include/linux/sprintf.h:26:34: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:26:34: sparse: sparse: got slub_debug
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/trace_printk.h:173:62: sparse: sparse: Expected ) in function declarator
   include/linux/trace_printk.h:173:62: sparse: sparse: got ap
   include/linux/trace_printk.h:176:61: sparse: sparse: Expected ) in function declarator
   include/linux/trace_printk.h:176:61: sparse: sparse: got ap
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/kernel.h:162:13: sparse: sparse: Expected ; at end of declaration
   include/linux/kernel.h:162:13: sparse: sparse: got early_boot_irqs_disabled
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/pgtable-be-types.h:81:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/pgtable-be-types.h:81:20: sparse: sparse: got pte_xchg
>> arch/powerpc/include/asm/pgtable-be-types.h:90:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/pgtable-be-types.h:90:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/pgtable-be-types.h:90:16: sparse: sparse: got pte_raw
   arch/powerpc/include/asm/pgtable-be-types.h:91:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/pgtable-be-types.h:91:1: sparse: sparse: got }
   arch/powerpc/include/asm/pgtable-be-types.h:101:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/pgtable-be-types.h:101:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/pgtable-be-types.h:101:16: sparse: sparse: got pmd_raw
   arch/powerpc/include/asm/pgtable-be-types.h:102:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/pgtable-be-types.h:102:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mmu.h:221:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:221:29: sparse: sparse: got early_mmu_has_feature
>> arch/powerpc/include/asm/mmu.h:226:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/mmu.h:226:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:226:16: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:227:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:227:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/jump_label.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
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
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
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
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mmu.h:238:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:238:29: sparse: sparse: got mmu_has_feature
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: got {
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: got {
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:246:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:246:13: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:246:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: got "Warning! mmu_has_feature() used prior to jump label init!\n"
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:249:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/mmu.h:249:24: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:249:24: sparse: sparse: got early_mmu_has_feature
   arch/powerpc/include/asm/mmu.h:250:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:250:9: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:256:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:256:13: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:256:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got {
   arch/powerpc/include/asm/mmu.h:260:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got (
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got if
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got branch
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:261:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:261:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:268:21: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:268:21: sparse: sparse: got ->
   arch/powerpc/include/asm/mmu.h:269:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:269:9: sparse: sparse: got &
   arch/powerpc/include/asm/mmu.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:270:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:304:67: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:304:67: sparse: sparse: got flush
   arch/powerpc/include/asm/mmu.h:316:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:316:29: sparse: sparse: got radix_enabled
   arch/powerpc/include/asm/mmu.h:319:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:319:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:324:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:324:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:329:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:329:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:334:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:334:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/book3s/64/mmu.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu.h:27:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:35:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:35:13: sparse: sparse: got branch
   include/linux/page_table_check.h:43:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:43:13: sparse: sparse: got branch
   include/linux/page_table_check.h:52:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:52:13: sparse: sparse: got branch
   include/linux/page_table_check.h:61:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:61:13: sparse: sparse: got branch
   include/linux/page_table_check.h:70:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:70:13: sparse: sparse: got branch
   include/linux/page_table_check.h:80:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:80:13: sparse: sparse: got branch
   include/linux/page_table_check.h:89:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:89:13: sparse: sparse: got branch
   include/linux/page_table_check.h:98:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:98:13: sparse: sparse: got branch
   include/linux/page_table_check.h:108:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:108:13: sparse: sparse: got branch
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:268:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:268:20: sparse: sparse: got pmd_leaf
   arch/powerpc/include/asm/book3s/64/pgtable.h:271:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:271:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:277:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:277:1: sparse: sparse: got }
>> arch/powerpc/include/asm/book3s/64/pgtable.h:284:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:285:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:285:17: sparse: sparse: got return
   arch/powerpc/include/asm/book3s/64/pgtable.h:286:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:286:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:293:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:294:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:294:17: sparse: sparse: got return
   arch/powerpc/include/asm/book3s/64/pgtable.h:295:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:295:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/radix.h, arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:10:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:10:29: sparse: sparse: got early_cpu_has_feature
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
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/radix.h:357:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/radix.h:357:6: sparse: sparse: got vmemmap_can_optimize
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: got __ptep_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: got (
>> arch/powerpc/include/asm/book3s/64/pgtable.h:357:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: got &
>> arch/powerpc/include/asm/book3s/64/pgtable.h:360:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:361:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:361:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:394:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:394:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:399:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:399:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:407:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:407:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:415:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:415:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:425:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:425:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:425:16: sparse: sparse: got old_pte
   arch/powerpc/include/asm/book3s/64/pgtable.h:426:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:426:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:443:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:443:24: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:443:24: sparse: sparse: got old_pte
   arch/powerpc/include/asm/book3s/64/pgtable.h:444:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:444:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:446:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:446:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:453:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:453:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:458:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:458:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:463:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:463:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:468:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:468:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:473:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:473:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:480:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:480:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:485:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:485:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:490:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:490:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:498:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:505:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:505:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:518:24: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:518:24: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:518:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:520:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:520:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:531:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:531:20: sparse: sparse: got pte_user
   arch/powerpc/include/asm/book3s/64/pgtable.h:534:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:534:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:546:19: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:546:19: sparse: sparse: got &&
   arch/powerpc/include/asm/book3s/64/pgtable.h:546:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:549:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:549:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:549:16: sparse: sparse: got arch_pte_access_permitted
   arch/powerpc/include/asm/book3s/64/pgtable.h:550:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:550:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:555:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:555:1: sparse: sparse: got }
>> arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:569:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:569:16: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:569:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:570:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:570:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:576:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:576:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:581:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:581:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:586:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:586:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:591:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:591:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:596:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:596:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:604:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:604:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:609:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:609:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:614:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:614:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:619:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:619:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:624:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:624:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:631:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:631:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:674:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:674:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:679:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:679:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:684:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:684:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:690:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:690:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:695:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:695:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:700:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:700:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:712:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:712:13: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:712:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:715:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:715:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:715:16: sparse: sparse: got true
   arch/powerpc/include/asm/book3s/64/pgtable.h:716:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:716:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:729:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:729:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:729:16: sparse: sparse: got hash__ptep_set_access_flags
   arch/powerpc/include/asm/book3s/64/pgtable.h:730:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:730:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:737:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:737:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:737:16: sparse: sparse: got hash__pte_same
   arch/powerpc/include/asm/book3s/64/pgtable.h:738:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:738:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:744:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:744:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:744:16: sparse: sparse: got hash__pte_none
   arch/powerpc/include/asm/book3s/64/pgtable.h:745:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:745:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:758:26: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:758:26: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:758:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:760:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:760:16: sparse: sparse: Expected ; at end of declaration
--
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1263:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1263:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1263:16: sparse: sparse: got pud
   arch/powerpc/include/asm/book3s/64/pgtable.h:1264:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1264:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:1274:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1278:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1278:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1278:16: sparse: sparse: got pmd
   arch/powerpc/include/asm/book3s/64/pgtable.h:1279:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1279:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:1286:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1289:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1289:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1289:16: sparse: sparse: got pud
   arch/powerpc/include/asm/book3s/64/pgtable.h:1290:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1290:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1296:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1296:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1301:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1301:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1308:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1308:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1313:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1313:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:6: sparse: sparse: got pmdp_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:6: sparse: sparse: got pudp_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:1435:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1435:20: sparse: sparse: got arch_needs_pgtable_deposit
   arch/powerpc/include/asm/book3s/64/pgtable.h:1439:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1439:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1439:16: sparse: sparse: got true
   arch/powerpc/include/asm/book3s/64/pgtable.h:1440:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1440:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1452:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1452:20: sparse: sparse: got is_pte_rw_upgrade
   arch/powerpc/include/asm/book3s/64/pgtable.h:1457:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1457:13: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1457:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1460:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1460:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1460:16: sparse: sparse: got false
   arch/powerpc/include/asm/book3s/64/pgtable.h:1461:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1461:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:172:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:172:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:277:51: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:277:51: sparse: sparse: got is_base_size
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:281:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:281:13: sparse: sparse: got !
>> arch/powerpc/include/asm/book3s/64/mmu-hash.h:281:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:287:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:287:13: sparse: sparse: got !
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:287:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:289:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:289:13: sparse: sparse: got !
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:289:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> arch/powerpc/include/asm/book3s/64/mmu-hash.h:291:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:291:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:291:16: sparse: sparse: got 1ul
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:292:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:292:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:297:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:297:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:302:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/kvm_book3s_asm.h:124:14: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/kvm_book3s_asm.h:124:14: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/kvm_book3s_asm.h:124:14: sparse: sparse: got in_use
   arch/powerpc/include/asm/kvm_book3s_asm.h:151:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/kvm_book3s_asm.h:151:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/cpuidle.h:81:14: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/cpuidle.h:81:14: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/cpuidle.h:81:14: sparse: sparse: got valid
   arch/powerpc/include/asm/cpuidle.h:82:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpuidle.h:82:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mce.h:122:33: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/mce.h:122:33: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/mce.h:122:33: sparse: sparse: got sync_error
   arch/powerpc/include/asm/mce.h:187:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mce.h:187:1: sparse: sparse: got }
   arch/powerpc/include/asm/mce.h:203:33: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/mce.h:203:33: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/mce.h:203:33: sparse: sparse: got sync_error
   arch/powerpc/include/asm/mce.h:204:33: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mce.h:204:33: sparse: sparse: got ignore_event
   arch/powerpc/include/asm/mce.h:205:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mce.h:205:1: sparse: sparse: got }
   arch/powerpc/include/asm/mce.h:230:64: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mce.h:230:64: sparse: sparse: got release
   arch/powerpc/include/asm/mce.h:234:49: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mce.h:234:49: sparse: sparse: got user_mode
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: got strict_msr_control
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/math64.h, include/linux/time64.h, include/linux/restart_block.h, include/linux/thread_info.h, ...):
   include/vdso/math64.h:46:14: sparse: sparse: Expected ; at end of statement
   include/vdso/math64.h:46:14: sparse: sparse: got ovf
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/restart_block.h, include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   include/linux/time64.h:52:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:52:20: sparse: sparse: got timespec64_is_epoch
   include/linux/time64.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:55:1: sparse: sparse: got }
   include/linux/time64.h:66:16: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:66:16: sparse: sparse: got ->
   include/linux/time64.h:66:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:68:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:68:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:68:16: sparse: sparse: got lhs
   include/linux/time64.h:69:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:69:1: sparse: sparse: got }
   include/linux/time64.h:97:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:97:20: sparse: sparse: got timespec64_valid
   include/linux/time64.h:103:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:103:13: sparse: sparse: got (
   include/linux/time64.h:103:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:105:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:105:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:105:16: sparse: sparse: got true
   include/linux/time64.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:106:1: sparse: sparse: got }
   include/linux/time64.h:113:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:113:13: sparse: sparse: got (
   include/linux/time64.h:113:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:115:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:115:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:115:16: sparse: sparse: got true
   include/linux/time64.h:116:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:116:1: sparse: sparse: got }
   include/linux/time64.h:123:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:123:13: sparse: sparse: got (
   include/linux/time64.h:123:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:125:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:125:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:125:16: sparse: sparse: got true
   include/linux/time64.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:126:1: sparse: sparse: got }
   include/linux/time64.h:141:15: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:141:15: sparse: sparse: got ->
   include/linux/time64.h:141:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:144:17: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:144:17: sparse: sparse: got (
   include/linux/time64.h:144:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:145:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:145:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: got test_thread_local_flags
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: got ->
   arch/powerpc/include/asm/thread_info.h:174:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: got <=
   arch/powerpc/include/asm/thread_info.h:220:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
>> include/linux/thread_info.h:87:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/thread_info.h:87:9: sparse: sparse: Expected ; at end of declaration
   include/linux/thread_info.h:87:9: sparse: sparse: got {
>> include/linux/thread_info.h:88:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/thread_info.h:88:16: sparse: sparse: Expected ; at end of declaration
   include/linux/thread_info.h:88:16: sparse: sparse: got -
   include/linux/thread_info.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:89:1: sparse: sparse: got }
   include/linux/thread_info.h:105:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:105:1: sparse: sparse: got }
   include/linux/thread_info.h:110:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:110:1: sparse: sparse: got }
   include/linux/thread_info.h:117:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/thread_info.h:118:17: sparse: sparse: Expected ; at end of declaration
   include/linux/thread_info.h:118:17: sparse: sparse: got clear_ti_thread_flag
   include/linux/thread_info.h:119:1: sparse: sparse: Expected ; at the end of type declaration
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
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: got ppc_breakpoint_available
--
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse:    incomplete type *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:112:9: sparse: sparse: undefined identifier 'kasan_check_write'
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:71:9: sparse: sparse: symbol 'instrument_atomic_read_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-atomic.h:71:9: sparse:    int static [signed] [toplevel] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:110:29: sparse: note: previously declared as:
   include/linux/instrumented.h:110:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:85:9: sparse: sparse: symbol 'instrument_atomic_read_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-atomic.h:85:9: sparse:    int static [signed] [toplevel] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:110:29: sparse: note: previously declared as:
   include/linux/instrumented.h:110:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:99:9: sparse: sparse: symbol 'instrument_atomic_read_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-atomic.h:99:9: sparse:    int static [signed] [toplevel] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:110:29: sparse: note: previously declared as:
   include/linux/instrumented.h:110:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_read_write( ... )
   include/linux/instrumented.h:97:9: sparse: sparse: undefined identifier 'kasan_check_write'
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse: sparse: symbol 'instrument_atomic_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse:    int static [signed] [toplevel] instrument_atomic_write( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:95:29: sparse: note: previously declared as:
   include/linux/instrumented.h:95:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_write( ... )
   include/linux/instrumented.h:41:9: sparse: sparse: undefined identifier 'kasan_check_write'
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:42:9: sparse: sparse: symbol 'instrument_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-lock.h:42:9: sparse:    int static [signed] [toplevel] instrument_write( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:39:29: sparse: note: previously declared as:
   include/linux/instrumented.h:39:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_write( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:79:9: sparse: sparse: symbol 'instrument_atomic_write' redeclared with different type (different argument counts):
   include/asm-generic/bitops/instrumented-lock.h:79:9: sparse:    int static [signed] [toplevel] instrument_atomic_write( ... )
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse: note: previously declared as:
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse:    int static [signed] [toplevel] instrument_atomic_write( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/pgtable-be-types.h:88:77: sparse: sparse: undefined identifier 'new'
   arch/powerpc/include/asm/pgtable-be-types.h:88:47: sparse: sparse: cast from unknown type
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse: sparse: symbol 'prev' redeclared with different type (different base types):
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse:    int [addressable] [toplevel] prev
   arch/powerpc/include/asm/pgtable-be-types.h:84:16: sparse: note: previously declared as:
   arch/powerpc/include/asm/pgtable-be-types.h:84:16: sparse:    restricted __be64 [addressable] [toplevel] [usertype] prev
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse: sparse: symbol 'prev' redeclared with different type (different base types):
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse:    restricted __be64 [addressable] [toplevel] [usertype] prev
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse: note: previously declared as:
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse:    int [addressable] [toplevel] prev
   arch/powerpc/include/asm/pgtable-be-types.h:99:77: sparse: sparse: undefined identifier 'new'
   arch/powerpc/include/asm/pgtable-be-types.h:99:47: sparse: sparse: cast from unknown type
   arch/powerpc/include/asm/pgtable-be-types.h:98:9: sparse: sparse: symbol 'prev' redeclared with different type (different base types):
   arch/powerpc/include/asm/pgtable-be-types.h:98:9: sparse:    int [addressable] [toplevel] prev
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse: note: previously declared as:
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse:    restricted __be64 [addressable] [toplevel] [usertype] prev
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   include/linux/jump_label.h:199:24: sparse: note: previously declared as:
   include/linux/jump_label.h:199:24: sparse:    int static inline [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: undefined identifier '_entry'
   arch/powerpc/include/asm/mmu.h:259:28: sparse: sparse: undefined identifier 'feature'
   arch/powerpc/include/asm/mmu.h:267:28: sparse: sparse: undefined identifier 'feature'
   arch/powerpc/include/asm/mmu.h:267:9: sparse: sparse: symbol 'i' has multiple initializers (originally initialized at arch/powerpc/include/asm/mmu.h:259)
   arch/powerpc/include/asm/mmu.h:268:9: sparse: sparse: symbol 'cur_cpu_spec' redeclared with different type (different base types):
   arch/powerpc/include/asm/mmu.h:268:9: sparse:    int [addressable] [toplevel] cur_cpu_spec
   lib/raid/raid6/powerpc/altivec4.c: note: in included file:
   arch/powerpc/include/asm/cputable.h:88:33: sparse: note: previously declared as:
   arch/powerpc/include/asm/cputable.h:88:33: sparse:    struct cpu_spec *extern [addressable] [toplevel] cur_cpu_spec
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/radix.h, arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: undefined identifier '_entry'
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: symbol '_entry_ptr' has multiple initializers (originally initialized at arch/powerpc/include/asm/mmu.h:247)
   arch/powerpc/include/asm/cpu_has_feature.h:44:28: sparse: sparse: undefined identifier 'feature'
   arch/powerpc/include/asm/cpu_has_feature.h:44:9: sparse: sparse: symbol 'i' has multiple initializers (originally initialized at arch/powerpc/include/asm/mmu.h:267)
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/radix.h:357:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/book3s/64/radix.h:357:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:26: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at include/asm-generic/bitops/generic-non-atomic.h:109)
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:9: sparse: sparse: symbol 'old' redeclared with different type (different type sizes):
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:9: sparse:    int [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse:    unsigned long [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'arch_static_branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'arch_static_branch_jump'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier '____wrong_branch_error'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
>> include/linux/page_table_check.h:52:13: sparse: sparse: non-scalar type in conditional:
   include/linux/page_table_check.h:52:13: sparse:    void
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:423:9: sparse: sparse: symbol 'page_table_check_pte_clear' redeclared with different type (incompatible argument 1 (different base types)):
   arch/powerpc/include/asm/book3s/64/pgtable.h:423:9: sparse:    int static [signed] [toplevel] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:49:20: sparse: note: previously declared as:
   include/linux/page_table_check.h:49:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:440:58: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:441:17: sparse: sparse: symbol 'page_table_check_pte_clear' redeclared with different type (incompatible argument 1 (different base types)):
   arch/powerpc/include/asm/book3s/64/pgtable.h:441:17: sparse:    int static [signed] [toplevel] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:49:20: sparse: note: previously declared as:
   include/linux/page_table_check.h:49:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:35: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at arch/powerpc/include/asm/book3s/64/pgtable.h:359)
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:9: sparse: sparse: symbol 'old' redeclared with different type (different type sizes):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:9: sparse:    int [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse:    unsigned long [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:35: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at arch/powerpc/include/asm/book3s/64/pgtable.h:1171)
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:9: sparse: sparse: symbol 'old' redeclared with different type (different type sizes):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:9: sparse:    int [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse:    unsigned long [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:285:15: sparse: sparse: undefined identifier 'l'
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:286:9: sparse: sparse: symbol 'i' has multiple initializers (originally initialized at arch/powerpc/include/asm/cpu_has_feature.h:44)
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mce.h:204:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/mce.h:204:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/thread_info.h:209:9: sparse: sparse: symbol 'frame' redeclared with different type (different base types):
   arch/powerpc/include/asm/thread_info.h:209:9: sparse:    int [addressable] [toplevel] frame
   arch/powerpc/include/asm/thread_info.h:206:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/thread_info.h:206:20: sparse:    void const *[addressable] [toplevel] frame
   arch/powerpc/include/asm/thread_info.h:223:17: sparse: sparse: symbol 'params' has multiple initializers (originally initialized at arch/powerpc/include/asm/thread_info.h:208)
   arch/powerpc/include/asm/thread_info.h:224:17: sparse: sparse: symbol 'frame' has multiple initializers (originally initialized at arch/powerpc/include/asm/thread_info.h:209)
   arch/powerpc/include/asm/thread_info.h:224:17: sparse: sparse: symbol 'frame' redeclared with different type (different base types):
   arch/powerpc/include/asm/thread_info.h:224:17: sparse:    int [addressable] [toplevel] frame
   arch/powerpc/include/asm/thread_info.h:206:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/thread_info.h:206:20: sparse:    void const *[addressable] [toplevel] frame
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:21:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/hw_breakpoint.h:21:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:59:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/hw_breakpoint.h:59:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/debug.h:51:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/debug.h:51:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:468:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/preempt.h:468:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/asm-generic/preempt.h:43:24: sparse: note: previously declared as:
   include/asm-generic/preempt.h:43:24: sparse:    int static inline [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:469:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/preempt.h:469:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/asm-generic/preempt.h:43:24: sparse: note: previously declared as:
   include/asm-generic/preempt.h:43:24: sparse:    int static inline [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2139:32: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2173:40: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2173:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2139)
   include/linux/atomic/atomic-arch-fallback.h:2206:40: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2206:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2173)
   include/linux/atomic/atomic-arch-fallback.h:2236:40: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2236:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2206)
--
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/sched.h:18:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/sched.h:18:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/sched.h:18:16: sparse: sparse: got __ffs
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'const_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/kstrtox.h:98:49: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:98:49: sparse: sparse: got *
   include/linux/kstrtox.h:110:80: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:110:80: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/log2.h:45:6: sparse: sparse: Expected ; at end of declaration
   include/linux/log2.h:45:6: sparse: sparse: got is_power_of_2
   include/linux/log2.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:48:1: sparse: sparse: got }
   include/linux/log2.h:58:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:58:1: sparse: sparse: got }
   include/linux/log2.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:68:1: sparse: sparse: got }
   include/linux/log2.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:202:1: sparse: sparse: got }
   include/linux/log2.h:230:26: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:230:26: sparse: sparse: got (
   include/linux/log2.h:230:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/log2.h:232:16: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:232:16: sparse: sparse: got (
   include/linux/log2.h:232:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/log2.h:233:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:233:1: sparse: sparse: got }
   include/linux/log2.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:270:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/math.h:111:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/math.h:111:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/minmax.h:276:20: sparse: sparse: Expected ; at end of declaration
   include/linux/minmax.h:276:20: sparse: sparse: got in_range64
   include/linux/minmax.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:279:1: sparse: sparse: got }
   include/linux/minmax.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:284:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/sprintf.h:14:79: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:14:79: sparse: sparse: got args
   include/linux/sprintf.h:16:80: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:16:80: sparse: sparse: got args
   include/linux/sprintf.h:18:78: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:18:78: sparse: sparse: got args
   include/linux/sprintf.h:19:81: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:19:81: sparse: sparse: got args
   include/linux/sprintf.h:25:13: sparse: sparse: Expected ; at end of declaration
   include/linux/sprintf.h:25:13: sparse: sparse: got no_hash_pointers
   include/linux/sprintf.h:26:34: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:26:34: sparse: sparse: got slub_debug
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/trace_printk.h:173:62: sparse: sparse: Expected ) in function declarator
   include/linux/trace_printk.h:173:62: sparse: sparse: got ap
   include/linux/trace_printk.h:176:61: sparse: sparse: Expected ) in function declarator
   include/linux/trace_printk.h:176:61: sparse: sparse: got ap
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/kernel.h:162:13: sparse: sparse: Expected ; at end of declaration
   include/linux/kernel.h:162:13: sparse: sparse: got early_boot_irqs_disabled
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/pgtable-be-types.h:81:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/pgtable-be-types.h:81:20: sparse: sparse: got pte_xchg
>> arch/powerpc/include/asm/pgtable-be-types.h:90:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/pgtable-be-types.h:90:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/pgtable-be-types.h:90:16: sparse: sparse: got pte_raw
   arch/powerpc/include/asm/pgtable-be-types.h:91:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/pgtable-be-types.h:91:1: sparse: sparse: got }
   arch/powerpc/include/asm/pgtable-be-types.h:101:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/pgtable-be-types.h:101:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/pgtable-be-types.h:101:16: sparse: sparse: got pmd_raw
   arch/powerpc/include/asm/pgtable-be-types.h:102:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/pgtable-be-types.h:102:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mmu.h:221:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:221:29: sparse: sparse: got early_mmu_has_feature
>> arch/powerpc/include/asm/mmu.h:226:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/mmu.h:226:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:226:16: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:227:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:227:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/jump_label.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
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
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
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
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mmu.h:238:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:238:29: sparse: sparse: got mmu_has_feature
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: got {
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: got {
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:246:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:246:13: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:246:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: got "Warning! mmu_has_feature() used prior to jump label init!\n"
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:249:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/mmu.h:249:24: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:249:24: sparse: sparse: got early_mmu_has_feature
   arch/powerpc/include/asm/mmu.h:250:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:250:9: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:256:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:256:13: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:256:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got {
   arch/powerpc/include/asm/mmu.h:260:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got (
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got if
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got branch
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:261:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:261:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:268:21: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:268:21: sparse: sparse: got ->
   arch/powerpc/include/asm/mmu.h:269:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:269:9: sparse: sparse: got &
   arch/powerpc/include/asm/mmu.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:270:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:304:67: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:304:67: sparse: sparse: got flush
   arch/powerpc/include/asm/mmu.h:316:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:316:29: sparse: sparse: got radix_enabled
   arch/powerpc/include/asm/mmu.h:319:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:319:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:324:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:324:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:329:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:329:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:334:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:334:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/book3s/64/mmu.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu.h:27:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:35:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:35:13: sparse: sparse: got branch
   include/linux/page_table_check.h:43:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:43:13: sparse: sparse: got branch
   include/linux/page_table_check.h:52:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:52:13: sparse: sparse: got branch
   include/linux/page_table_check.h:61:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:61:13: sparse: sparse: got branch
   include/linux/page_table_check.h:70:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:70:13: sparse: sparse: got branch
   include/linux/page_table_check.h:80:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:80:13: sparse: sparse: got branch
   include/linux/page_table_check.h:89:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:89:13: sparse: sparse: got branch
   include/linux/page_table_check.h:98:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:98:13: sparse: sparse: got branch
   include/linux/page_table_check.h:108:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:108:13: sparse: sparse: got branch
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:268:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:268:20: sparse: sparse: got pmd_leaf
   arch/powerpc/include/asm/book3s/64/pgtable.h:271:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:271:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:277:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:277:1: sparse: sparse: got }
>> arch/powerpc/include/asm/book3s/64/pgtable.h:284:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:285:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:285:17: sparse: sparse: got return
   arch/powerpc/include/asm/book3s/64/pgtable.h:286:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:286:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:293:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:294:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:294:17: sparse: sparse: got return
   arch/powerpc/include/asm/book3s/64/pgtable.h:295:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:295:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/radix.h, arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:10:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:10:29: sparse: sparse: got early_cpu_has_feature
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
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/radix.h:357:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/radix.h:357:6: sparse: sparse: got vmemmap_can_optimize
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: got __ptep_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: got (
>> arch/powerpc/include/asm/book3s/64/pgtable.h:357:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: got &
>> arch/powerpc/include/asm/book3s/64/pgtable.h:360:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:361:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:361:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:394:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:394:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:399:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:399:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:407:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:407:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:415:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:415:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:425:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:425:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:425:16: sparse: sparse: got old_pte
   arch/powerpc/include/asm/book3s/64/pgtable.h:426:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:426:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:443:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:443:24: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:443:24: sparse: sparse: got old_pte
   arch/powerpc/include/asm/book3s/64/pgtable.h:444:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:444:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:446:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:446:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:453:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:453:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:458:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:458:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:463:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:463:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:468:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:468:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:473:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:473:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:480:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:480:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:485:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:485:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:490:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:490:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:498:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:505:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:505:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:518:24: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:518:24: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:518:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:520:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:520:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:531:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:531:20: sparse: sparse: got pte_user
   arch/powerpc/include/asm/book3s/64/pgtable.h:534:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:534:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:546:19: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:546:19: sparse: sparse: got &&
   arch/powerpc/include/asm/book3s/64/pgtable.h:546:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:549:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:549:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:549:16: sparse: sparse: got arch_pte_access_permitted
   arch/powerpc/include/asm/book3s/64/pgtable.h:550:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:550:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:555:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:555:1: sparse: sparse: got }
>> arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:569:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:569:16: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:569:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:570:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:570:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:576:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:576:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:581:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:581:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:586:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:586:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:591:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:591:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:596:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:596:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:604:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:604:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:609:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:609:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:614:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:614:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:619:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:619:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:624:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:624:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:631:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:631:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:674:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:674:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:679:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:679:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:684:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:684:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:690:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:690:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:695:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:695:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:700:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:700:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:712:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:712:13: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:712:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:715:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:715:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:715:16: sparse: sparse: got true
   arch/powerpc/include/asm/book3s/64/pgtable.h:716:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:716:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:729:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:729:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:729:16: sparse: sparse: got hash__ptep_set_access_flags
   arch/powerpc/include/asm/book3s/64/pgtable.h:730:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:730:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:737:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:737:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:737:16: sparse: sparse: got hash__pte_same
   arch/powerpc/include/asm/book3s/64/pgtable.h:738:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:738:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:744:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:744:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:744:16: sparse: sparse: got hash__pte_none
   arch/powerpc/include/asm/book3s/64/pgtable.h:745:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:745:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:758:26: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:758:26: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:758:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:760:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:760:16: sparse: sparse: Expected ; at end of declaration
--
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1263:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1263:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1263:16: sparse: sparse: got pud
   arch/powerpc/include/asm/book3s/64/pgtable.h:1264:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1264:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:1274:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1278:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1278:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1278:16: sparse: sparse: got pmd
   arch/powerpc/include/asm/book3s/64/pgtable.h:1279:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1279:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:1286:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1289:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1289:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1289:16: sparse: sparse: got pud
   arch/powerpc/include/asm/book3s/64/pgtable.h:1290:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1290:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1296:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1296:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1301:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1301:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1308:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1308:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1313:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1313:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:6: sparse: sparse: got pmdp_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:6: sparse: sparse: got pudp_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:1435:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1435:20: sparse: sparse: got arch_needs_pgtable_deposit
   arch/powerpc/include/asm/book3s/64/pgtable.h:1439:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1439:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1439:16: sparse: sparse: got true
   arch/powerpc/include/asm/book3s/64/pgtable.h:1440:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1440:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1452:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1452:20: sparse: sparse: got is_pte_rw_upgrade
   arch/powerpc/include/asm/book3s/64/pgtable.h:1457:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1457:13: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1457:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1460:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1460:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1460:16: sparse: sparse: got false
   arch/powerpc/include/asm/book3s/64/pgtable.h:1461:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1461:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:172:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:172:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:277:51: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:277:51: sparse: sparse: got is_base_size
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:281:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:281:13: sparse: sparse: got !
>> arch/powerpc/include/asm/book3s/64/mmu-hash.h:281:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:287:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:287:13: sparse: sparse: got !
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:287:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:289:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:289:13: sparse: sparse: got !
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:289:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> arch/powerpc/include/asm/book3s/64/mmu-hash.h:291:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:291:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:291:16: sparse: sparse: got 1ul
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:292:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:292:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:297:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:297:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:302:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/kvm_book3s_asm.h:124:14: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/kvm_book3s_asm.h:124:14: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/kvm_book3s_asm.h:124:14: sparse: sparse: got in_use
   arch/powerpc/include/asm/kvm_book3s_asm.h:151:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/kvm_book3s_asm.h:151:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/cpuidle.h:81:14: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/cpuidle.h:81:14: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/cpuidle.h:81:14: sparse: sparse: got valid
   arch/powerpc/include/asm/cpuidle.h:82:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpuidle.h:82:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mce.h:122:33: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/mce.h:122:33: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/mce.h:122:33: sparse: sparse: got sync_error
   arch/powerpc/include/asm/mce.h:187:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mce.h:187:1: sparse: sparse: got }
   arch/powerpc/include/asm/mce.h:203:33: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/mce.h:203:33: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/mce.h:203:33: sparse: sparse: got sync_error
   arch/powerpc/include/asm/mce.h:204:33: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mce.h:204:33: sparse: sparse: got ignore_event
   arch/powerpc/include/asm/mce.h:205:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mce.h:205:1: sparse: sparse: got }
   arch/powerpc/include/asm/mce.h:230:64: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mce.h:230:64: sparse: sparse: got release
   arch/powerpc/include/asm/mce.h:234:49: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mce.h:234:49: sparse: sparse: got user_mode
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: got strict_msr_control
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/math64.h, include/linux/time64.h, include/linux/restart_block.h, include/linux/thread_info.h, ...):
   include/vdso/math64.h:46:14: sparse: sparse: Expected ; at end of statement
   include/vdso/math64.h:46:14: sparse: sparse: got ovf
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/restart_block.h, include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   include/linux/time64.h:52:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:52:20: sparse: sparse: got timespec64_is_epoch
   include/linux/time64.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:55:1: sparse: sparse: got }
   include/linux/time64.h:66:16: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:66:16: sparse: sparse: got ->
   include/linux/time64.h:66:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:68:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:68:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:68:16: sparse: sparse: got lhs
   include/linux/time64.h:69:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:69:1: sparse: sparse: got }
   include/linux/time64.h:97:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:97:20: sparse: sparse: got timespec64_valid
   include/linux/time64.h:103:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:103:13: sparse: sparse: got (
   include/linux/time64.h:103:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:105:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:105:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:105:16: sparse: sparse: got true
   include/linux/time64.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:106:1: sparse: sparse: got }
   include/linux/time64.h:113:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:113:13: sparse: sparse: got (
   include/linux/time64.h:113:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:115:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:115:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:115:16: sparse: sparse: got true
   include/linux/time64.h:116:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:116:1: sparse: sparse: got }
   include/linux/time64.h:123:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:123:13: sparse: sparse: got (
   include/linux/time64.h:123:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:125:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:125:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:125:16: sparse: sparse: got true
   include/linux/time64.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:126:1: sparse: sparse: got }
   include/linux/time64.h:141:15: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:141:15: sparse: sparse: got ->
   include/linux/time64.h:141:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:144:17: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:144:17: sparse: sparse: got (
   include/linux/time64.h:144:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:145:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:145:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: got test_thread_local_flags
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: got ->
   arch/powerpc/include/asm/thread_info.h:174:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: got <=
   arch/powerpc/include/asm/thread_info.h:220:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
>> include/linux/thread_info.h:87:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/thread_info.h:87:9: sparse: sparse: Expected ; at end of declaration
   include/linux/thread_info.h:87:9: sparse: sparse: got {
>> include/linux/thread_info.h:88:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/thread_info.h:88:16: sparse: sparse: Expected ; at end of declaration
   include/linux/thread_info.h:88:16: sparse: sparse: got -
   include/linux/thread_info.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:89:1: sparse: sparse: got }
   include/linux/thread_info.h:105:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:105:1: sparse: sparse: got }
   include/linux/thread_info.h:110:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:110:1: sparse: sparse: got }
   include/linux/thread_info.h:117:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/thread_info.h:118:17: sparse: sparse: Expected ; at end of declaration
   include/linux/thread_info.h:118:17: sparse: sparse: got clear_ti_thread_flag
   include/linux/thread_info.h:119:1: sparse: sparse: Expected ; at the end of type declaration
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
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: got ppc_breakpoint_available
--
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse:    incomplete type *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:112:9: sparse: sparse: undefined identifier 'kasan_check_write'
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:71:9: sparse: sparse: symbol 'instrument_atomic_read_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-atomic.h:71:9: sparse:    int static [signed] [toplevel] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:110:29: sparse: note: previously declared as:
   include/linux/instrumented.h:110:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:85:9: sparse: sparse: symbol 'instrument_atomic_read_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-atomic.h:85:9: sparse:    int static [signed] [toplevel] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:110:29: sparse: note: previously declared as:
   include/linux/instrumented.h:110:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:99:9: sparse: sparse: symbol 'instrument_atomic_read_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-atomic.h:99:9: sparse:    int static [signed] [toplevel] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:110:29: sparse: note: previously declared as:
   include/linux/instrumented.h:110:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_read_write( ... )
   include/linux/instrumented.h:97:9: sparse: sparse: undefined identifier 'kasan_check_write'
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse: sparse: symbol 'instrument_atomic_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse:    int static [signed] [toplevel] instrument_atomic_write( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:95:29: sparse: note: previously declared as:
   include/linux/instrumented.h:95:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_write( ... )
   include/linux/instrumented.h:41:9: sparse: sparse: undefined identifier 'kasan_check_write'
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:42:9: sparse: sparse: symbol 'instrument_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-lock.h:42:9: sparse:    int static [signed] [toplevel] instrument_write( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:39:29: sparse: note: previously declared as:
   include/linux/instrumented.h:39:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_write( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:79:9: sparse: sparse: symbol 'instrument_atomic_write' redeclared with different type (different argument counts):
   include/asm-generic/bitops/instrumented-lock.h:79:9: sparse:    int static [signed] [toplevel] instrument_atomic_write( ... )
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse: note: previously declared as:
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse:    int static [signed] [toplevel] instrument_atomic_write( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/pgtable-be-types.h:88:77: sparse: sparse: undefined identifier 'new'
   arch/powerpc/include/asm/pgtable-be-types.h:88:47: sparse: sparse: cast from unknown type
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse: sparse: symbol 'prev' redeclared with different type (different base types):
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse:    int [addressable] [toplevel] prev
   arch/powerpc/include/asm/pgtable-be-types.h:84:16: sparse: note: previously declared as:
   arch/powerpc/include/asm/pgtable-be-types.h:84:16: sparse:    restricted __be64 [addressable] [toplevel] [usertype] prev
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse: sparse: symbol 'prev' redeclared with different type (different base types):
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse:    restricted __be64 [addressable] [toplevel] [usertype] prev
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse: note: previously declared as:
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse:    int [addressable] [toplevel] prev
   arch/powerpc/include/asm/pgtable-be-types.h:99:77: sparse: sparse: undefined identifier 'new'
   arch/powerpc/include/asm/pgtable-be-types.h:99:47: sparse: sparse: cast from unknown type
   arch/powerpc/include/asm/pgtable-be-types.h:98:9: sparse: sparse: symbol 'prev' redeclared with different type (different base types):
   arch/powerpc/include/asm/pgtable-be-types.h:98:9: sparse:    int [addressable] [toplevel] prev
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse: note: previously declared as:
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse:    restricted __be64 [addressable] [toplevel] [usertype] prev
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   include/linux/jump_label.h:199:24: sparse: note: previously declared as:
   include/linux/jump_label.h:199:24: sparse:    int static inline [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: undefined identifier '_entry'
   arch/powerpc/include/asm/mmu.h:259:28: sparse: sparse: undefined identifier 'feature'
   arch/powerpc/include/asm/mmu.h:267:28: sparse: sparse: undefined identifier 'feature'
   arch/powerpc/include/asm/mmu.h:267:9: sparse: sparse: symbol 'i' has multiple initializers (originally initialized at arch/powerpc/include/asm/mmu.h:259)
   arch/powerpc/include/asm/mmu.h:268:9: sparse: sparse: symbol 'cur_cpu_spec' redeclared with different type (different base types):
   arch/powerpc/include/asm/mmu.h:268:9: sparse:    int [addressable] [toplevel] cur_cpu_spec
   lib/raid/raid6/powerpc/altivec1.c: note: in included file:
   arch/powerpc/include/asm/cputable.h:88:33: sparse: note: previously declared as:
   arch/powerpc/include/asm/cputable.h:88:33: sparse:    struct cpu_spec *extern [addressable] [toplevel] cur_cpu_spec
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/radix.h, arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: undefined identifier '_entry'
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: symbol '_entry_ptr' has multiple initializers (originally initialized at arch/powerpc/include/asm/mmu.h:247)
   arch/powerpc/include/asm/cpu_has_feature.h:44:28: sparse: sparse: undefined identifier 'feature'
   arch/powerpc/include/asm/cpu_has_feature.h:44:9: sparse: sparse: symbol 'i' has multiple initializers (originally initialized at arch/powerpc/include/asm/mmu.h:267)
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/radix.h:357:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/book3s/64/radix.h:357:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:26: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at include/asm-generic/bitops/generic-non-atomic.h:109)
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:9: sparse: sparse: symbol 'old' redeclared with different type (different type sizes):
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:9: sparse:    int [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse:    unsigned long [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'arch_static_branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'arch_static_branch_jump'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier '____wrong_branch_error'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
>> include/linux/page_table_check.h:52:13: sparse: sparse: non-scalar type in conditional:
   include/linux/page_table_check.h:52:13: sparse:    void
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:423:9: sparse: sparse: symbol 'page_table_check_pte_clear' redeclared with different type (incompatible argument 1 (different base types)):
   arch/powerpc/include/asm/book3s/64/pgtable.h:423:9: sparse:    int static [signed] [toplevel] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:49:20: sparse: note: previously declared as:
   include/linux/page_table_check.h:49:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:440:58: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:441:17: sparse: sparse: symbol 'page_table_check_pte_clear' redeclared with different type (incompatible argument 1 (different base types)):
   arch/powerpc/include/asm/book3s/64/pgtable.h:441:17: sparse:    int static [signed] [toplevel] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:49:20: sparse: note: previously declared as:
   include/linux/page_table_check.h:49:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:35: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at arch/powerpc/include/asm/book3s/64/pgtable.h:359)
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:9: sparse: sparse: symbol 'old' redeclared with different type (different type sizes):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:9: sparse:    int [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse:    unsigned long [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:35: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at arch/powerpc/include/asm/book3s/64/pgtable.h:1171)
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:9: sparse: sparse: symbol 'old' redeclared with different type (different type sizes):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:9: sparse:    int [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse:    unsigned long [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:285:15: sparse: sparse: undefined identifier 'l'
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:286:9: sparse: sparse: symbol 'i' has multiple initializers (originally initialized at arch/powerpc/include/asm/cpu_has_feature.h:44)
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mce.h:204:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/mce.h:204:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/thread_info.h:209:9: sparse: sparse: symbol 'frame' redeclared with different type (different base types):
   arch/powerpc/include/asm/thread_info.h:209:9: sparse:    int [addressable] [toplevel] frame
   arch/powerpc/include/asm/thread_info.h:206:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/thread_info.h:206:20: sparse:    void const *[addressable] [toplevel] frame
   arch/powerpc/include/asm/thread_info.h:223:17: sparse: sparse: symbol 'params' has multiple initializers (originally initialized at arch/powerpc/include/asm/thread_info.h:208)
   arch/powerpc/include/asm/thread_info.h:224:17: sparse: sparse: symbol 'frame' has multiple initializers (originally initialized at arch/powerpc/include/asm/thread_info.h:209)
   arch/powerpc/include/asm/thread_info.h:224:17: sparse: sparse: symbol 'frame' redeclared with different type (different base types):
   arch/powerpc/include/asm/thread_info.h:224:17: sparse:    int [addressable] [toplevel] frame
   arch/powerpc/include/asm/thread_info.h:206:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/thread_info.h:206:20: sparse:    void const *[addressable] [toplevel] frame
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:21:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/hw_breakpoint.h:21:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:59:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/hw_breakpoint.h:59:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/debug.h:51:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/debug.h:51:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:468:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/preempt.h:468:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/asm-generic/preempt.h:43:24: sparse: note: previously declared as:
   include/asm-generic/preempt.h:43:24: sparse:    int static inline [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:469:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/preempt.h:469:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/asm-generic/preempt.h:43:24: sparse: note: previously declared as:
   include/asm-generic/preempt.h:43:24: sparse:    int static inline [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2139:32: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2173:40: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2173:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2139)
   include/linux/atomic/atomic-arch-fallback.h:2206:40: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2206:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2173)
   include/linux/atomic/atomic-arch-fallback.h:2236:40: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2236:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2206)
--
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/sched.h:18:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/sched.h:18:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/sched.h:18:16: sparse: sparse: got __ffs
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'const_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/kstrtox.h:98:49: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:98:49: sparse: sparse: got *
   include/linux/kstrtox.h:110:80: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:110:80: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/log2.h:45:6: sparse: sparse: Expected ; at end of declaration
   include/linux/log2.h:45:6: sparse: sparse: got is_power_of_2
   include/linux/log2.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:48:1: sparse: sparse: got }
   include/linux/log2.h:58:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:58:1: sparse: sparse: got }
   include/linux/log2.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:68:1: sparse: sparse: got }
   include/linux/log2.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:202:1: sparse: sparse: got }
   include/linux/log2.h:230:26: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:230:26: sparse: sparse: got (
   include/linux/log2.h:230:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/log2.h:232:16: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:232:16: sparse: sparse: got (
   include/linux/log2.h:232:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/log2.h:233:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:233:1: sparse: sparse: got }
   include/linux/log2.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:270:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/math.h:111:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/math.h:111:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/minmax.h:276:20: sparse: sparse: Expected ; at end of declaration
   include/linux/minmax.h:276:20: sparse: sparse: got in_range64
   include/linux/minmax.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:279:1: sparse: sparse: got }
   include/linux/minmax.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:284:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/sprintf.h:14:79: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:14:79: sparse: sparse: got args
   include/linux/sprintf.h:16:80: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:16:80: sparse: sparse: got args
   include/linux/sprintf.h:18:78: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:18:78: sparse: sparse: got args
   include/linux/sprintf.h:19:81: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:19:81: sparse: sparse: got args
   include/linux/sprintf.h:25:13: sparse: sparse: Expected ; at end of declaration
   include/linux/sprintf.h:25:13: sparse: sparse: got no_hash_pointers
   include/linux/sprintf.h:26:34: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:26:34: sparse: sparse: got slub_debug
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/trace_printk.h:173:62: sparse: sparse: Expected ) in function declarator
   include/linux/trace_printk.h:173:62: sparse: sparse: got ap
   include/linux/trace_printk.h:176:61: sparse: sparse: Expected ) in function declarator
   include/linux/trace_printk.h:176:61: sparse: sparse: got ap
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/kernel.h:162:13: sparse: sparse: Expected ; at end of declaration
   include/linux/kernel.h:162:13: sparse: sparse: got early_boot_irqs_disabled
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/pgtable-be-types.h:81:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/pgtable-be-types.h:81:20: sparse: sparse: got pte_xchg
>> arch/powerpc/include/asm/pgtable-be-types.h:90:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/pgtable-be-types.h:90:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/pgtable-be-types.h:90:16: sparse: sparse: got pte_raw
   arch/powerpc/include/asm/pgtable-be-types.h:91:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/pgtable-be-types.h:91:1: sparse: sparse: got }
   arch/powerpc/include/asm/pgtable-be-types.h:101:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/pgtable-be-types.h:101:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/pgtable-be-types.h:101:16: sparse: sparse: got pmd_raw
   arch/powerpc/include/asm/pgtable-be-types.h:102:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/pgtable-be-types.h:102:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mmu.h:221:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:221:29: sparse: sparse: got early_mmu_has_feature
>> arch/powerpc/include/asm/mmu.h:226:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/mmu.h:226:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:226:16: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:227:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:227:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/jump_label.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
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
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
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
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mmu.h:238:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:238:29: sparse: sparse: got mmu_has_feature
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: got {
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: got {
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:246:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:246:13: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:246:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: got "Warning! mmu_has_feature() used prior to jump label init!\n"
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:249:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/mmu.h:249:24: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:249:24: sparse: sparse: got early_mmu_has_feature
   arch/powerpc/include/asm/mmu.h:250:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:250:9: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:256:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:256:13: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:256:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got {
   arch/powerpc/include/asm/mmu.h:260:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got (
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got if
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got branch
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:261:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:261:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:268:21: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:268:21: sparse: sparse: got ->
   arch/powerpc/include/asm/mmu.h:269:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:269:9: sparse: sparse: got &
   arch/powerpc/include/asm/mmu.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:270:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:304:67: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:304:67: sparse: sparse: got flush
   arch/powerpc/include/asm/mmu.h:316:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:316:29: sparse: sparse: got radix_enabled
   arch/powerpc/include/asm/mmu.h:319:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:319:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:324:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:324:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:329:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:329:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:334:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:334:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/book3s/64/mmu.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu.h:27:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:35:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:35:13: sparse: sparse: got branch
   include/linux/page_table_check.h:43:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:43:13: sparse: sparse: got branch
   include/linux/page_table_check.h:52:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:52:13: sparse: sparse: got branch
   include/linux/page_table_check.h:61:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:61:13: sparse: sparse: got branch
   include/linux/page_table_check.h:70:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:70:13: sparse: sparse: got branch
   include/linux/page_table_check.h:80:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:80:13: sparse: sparse: got branch
   include/linux/page_table_check.h:89:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:89:13: sparse: sparse: got branch
   include/linux/page_table_check.h:98:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:98:13: sparse: sparse: got branch
   include/linux/page_table_check.h:108:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:108:13: sparse: sparse: got branch
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:268:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:268:20: sparse: sparse: got pmd_leaf
   arch/powerpc/include/asm/book3s/64/pgtable.h:271:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:271:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:277:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:277:1: sparse: sparse: got }
>> arch/powerpc/include/asm/book3s/64/pgtable.h:284:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:285:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:285:17: sparse: sparse: got return
   arch/powerpc/include/asm/book3s/64/pgtable.h:286:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:286:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:293:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:294:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:294:17: sparse: sparse: got return
   arch/powerpc/include/asm/book3s/64/pgtable.h:295:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:295:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/radix.h, arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:10:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:10:29: sparse: sparse: got early_cpu_has_feature
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
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/radix.h:357:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/radix.h:357:6: sparse: sparse: got vmemmap_can_optimize
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: got __ptep_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: got (
>> arch/powerpc/include/asm/book3s/64/pgtable.h:357:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: got &
>> arch/powerpc/include/asm/book3s/64/pgtable.h:360:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:361:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:361:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:394:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:394:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:399:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:399:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:407:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:407:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:415:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:415:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:425:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:425:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:425:16: sparse: sparse: got old_pte
   arch/powerpc/include/asm/book3s/64/pgtable.h:426:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:426:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:443:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:443:24: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:443:24: sparse: sparse: got old_pte
   arch/powerpc/include/asm/book3s/64/pgtable.h:444:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:444:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:446:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:446:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:453:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:453:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:458:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:458:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:463:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:463:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:468:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:468:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:473:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:473:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:480:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:480:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:485:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:485:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:490:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:490:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:498:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:505:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:505:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:518:24: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:518:24: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:518:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:520:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:520:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:531:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:531:20: sparse: sparse: got pte_user
   arch/powerpc/include/asm/book3s/64/pgtable.h:534:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:534:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:546:19: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:546:19: sparse: sparse: got &&
   arch/powerpc/include/asm/book3s/64/pgtable.h:546:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:549:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:549:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:549:16: sparse: sparse: got arch_pte_access_permitted
   arch/powerpc/include/asm/book3s/64/pgtable.h:550:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:550:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:555:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:555:1: sparse: sparse: got }
>> arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:569:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:569:16: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:569:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:570:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:570:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:576:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:576:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:581:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:581:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:586:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:586:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:591:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:591:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:596:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:596:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:604:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:604:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:609:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:609:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:614:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:614:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:619:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:619:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:624:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:624:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:631:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:631:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:674:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:674:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:679:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:679:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:684:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:684:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:690:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:690:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:695:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:695:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:700:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:700:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:712:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:712:13: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:712:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:715:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:715:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:715:16: sparse: sparse: got true
   arch/powerpc/include/asm/book3s/64/pgtable.h:716:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:716:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:729:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:729:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:729:16: sparse: sparse: got hash__ptep_set_access_flags
   arch/powerpc/include/asm/book3s/64/pgtable.h:730:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:730:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:737:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:737:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:737:16: sparse: sparse: got hash__pte_same
   arch/powerpc/include/asm/book3s/64/pgtable.h:738:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:738:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:744:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:744:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:744:16: sparse: sparse: got hash__pte_none
   arch/powerpc/include/asm/book3s/64/pgtable.h:745:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:745:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:758:26: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:758:26: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:758:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:760:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:760:16: sparse: sparse: Expected ; at end of declaration
--
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1263:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1263:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1263:16: sparse: sparse: got pud
   arch/powerpc/include/asm/book3s/64/pgtable.h:1264:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1264:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:1274:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1278:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1278:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1278:16: sparse: sparse: got pmd
   arch/powerpc/include/asm/book3s/64/pgtable.h:1279:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1279:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:1286:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1289:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1289:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1289:16: sparse: sparse: got pud
   arch/powerpc/include/asm/book3s/64/pgtable.h:1290:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1290:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1296:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1296:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1301:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1301:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1308:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1308:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1313:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1313:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:6: sparse: sparse: got pmdp_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:6: sparse: sparse: got pudp_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:1435:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1435:20: sparse: sparse: got arch_needs_pgtable_deposit
   arch/powerpc/include/asm/book3s/64/pgtable.h:1439:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1439:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1439:16: sparse: sparse: got true
   arch/powerpc/include/asm/book3s/64/pgtable.h:1440:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1440:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1452:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1452:20: sparse: sparse: got is_pte_rw_upgrade
   arch/powerpc/include/asm/book3s/64/pgtable.h:1457:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1457:13: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1457:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1460:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1460:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1460:16: sparse: sparse: got false
   arch/powerpc/include/asm/book3s/64/pgtable.h:1461:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1461:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:172:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:172:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:277:51: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:277:51: sparse: sparse: got is_base_size
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:281:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:281:13: sparse: sparse: got !
>> arch/powerpc/include/asm/book3s/64/mmu-hash.h:281:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:287:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:287:13: sparse: sparse: got !
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:287:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:289:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:289:13: sparse: sparse: got !
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:289:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> arch/powerpc/include/asm/book3s/64/mmu-hash.h:291:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:291:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:291:16: sparse: sparse: got 1ul
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:292:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:292:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:297:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:297:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:302:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/kvm_book3s_asm.h:124:14: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/kvm_book3s_asm.h:124:14: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/kvm_book3s_asm.h:124:14: sparse: sparse: got in_use
   arch/powerpc/include/asm/kvm_book3s_asm.h:151:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/kvm_book3s_asm.h:151:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/cpuidle.h:81:14: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/cpuidle.h:81:14: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/cpuidle.h:81:14: sparse: sparse: got valid
   arch/powerpc/include/asm/cpuidle.h:82:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpuidle.h:82:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mce.h:122:33: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/mce.h:122:33: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/mce.h:122:33: sparse: sparse: got sync_error
   arch/powerpc/include/asm/mce.h:187:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mce.h:187:1: sparse: sparse: got }
   arch/powerpc/include/asm/mce.h:203:33: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/mce.h:203:33: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/mce.h:203:33: sparse: sparse: got sync_error
   arch/powerpc/include/asm/mce.h:204:33: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mce.h:204:33: sparse: sparse: got ignore_event
   arch/powerpc/include/asm/mce.h:205:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mce.h:205:1: sparse: sparse: got }
   arch/powerpc/include/asm/mce.h:230:64: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mce.h:230:64: sparse: sparse: got release
   arch/powerpc/include/asm/mce.h:234:49: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mce.h:234:49: sparse: sparse: got user_mode
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: got strict_msr_control
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/math64.h, include/linux/time64.h, include/linux/restart_block.h, include/linux/thread_info.h, ...):
   include/vdso/math64.h:46:14: sparse: sparse: Expected ; at end of statement
   include/vdso/math64.h:46:14: sparse: sparse: got ovf
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/restart_block.h, include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   include/linux/time64.h:52:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:52:20: sparse: sparse: got timespec64_is_epoch
   include/linux/time64.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:55:1: sparse: sparse: got }
   include/linux/time64.h:66:16: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:66:16: sparse: sparse: got ->
   include/linux/time64.h:66:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:68:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:68:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:68:16: sparse: sparse: got lhs
   include/linux/time64.h:69:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:69:1: sparse: sparse: got }
   include/linux/time64.h:97:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:97:20: sparse: sparse: got timespec64_valid
   include/linux/time64.h:103:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:103:13: sparse: sparse: got (
   include/linux/time64.h:103:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:105:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:105:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:105:16: sparse: sparse: got true
   include/linux/time64.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:106:1: sparse: sparse: got }
   include/linux/time64.h:113:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:113:13: sparse: sparse: got (
   include/linux/time64.h:113:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:115:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:115:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:115:16: sparse: sparse: got true
   include/linux/time64.h:116:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:116:1: sparse: sparse: got }
   include/linux/time64.h:123:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:123:13: sparse: sparse: got (
   include/linux/time64.h:123:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:125:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:125:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:125:16: sparse: sparse: got true
   include/linux/time64.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:126:1: sparse: sparse: got }
   include/linux/time64.h:141:15: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:141:15: sparse: sparse: got ->
   include/linux/time64.h:141:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:144:17: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:144:17: sparse: sparse: got (
   include/linux/time64.h:144:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:145:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:145:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: got test_thread_local_flags
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: got ->
   arch/powerpc/include/asm/thread_info.h:174:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: got <=
   arch/powerpc/include/asm/thread_info.h:220:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
>> include/linux/thread_info.h:87:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/thread_info.h:87:9: sparse: sparse: Expected ; at end of declaration
   include/linux/thread_info.h:87:9: sparse: sparse: got {
>> include/linux/thread_info.h:88:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/thread_info.h:88:16: sparse: sparse: Expected ; at end of declaration
   include/linux/thread_info.h:88:16: sparse: sparse: got -
   include/linux/thread_info.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:89:1: sparse: sparse: got }
   include/linux/thread_info.h:105:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:105:1: sparse: sparse: got }
   include/linux/thread_info.h:110:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:110:1: sparse: sparse: got }
   include/linux/thread_info.h:117:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/thread_info.h:118:17: sparse: sparse: Expected ; at end of declaration
   include/linux/thread_info.h:118:17: sparse: sparse: got clear_ti_thread_flag
   include/linux/thread_info.h:119:1: sparse: sparse: Expected ; at the end of type declaration
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
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: got ppc_breakpoint_available
--
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse:    incomplete type *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:112:9: sparse: sparse: undefined identifier 'kasan_check_write'
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:71:9: sparse: sparse: symbol 'instrument_atomic_read_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-atomic.h:71:9: sparse:    int static [signed] [toplevel] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:110:29: sparse: note: previously declared as:
   include/linux/instrumented.h:110:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:85:9: sparse: sparse: symbol 'instrument_atomic_read_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-atomic.h:85:9: sparse:    int static [signed] [toplevel] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:110:29: sparse: note: previously declared as:
   include/linux/instrumented.h:110:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:99:9: sparse: sparse: symbol 'instrument_atomic_read_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-atomic.h:99:9: sparse:    int static [signed] [toplevel] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:110:29: sparse: note: previously declared as:
   include/linux/instrumented.h:110:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_read_write( ... )
   include/linux/instrumented.h:97:9: sparse: sparse: undefined identifier 'kasan_check_write'
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse: sparse: symbol 'instrument_atomic_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse:    int static [signed] [toplevel] instrument_atomic_write( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:95:29: sparse: note: previously declared as:
   include/linux/instrumented.h:95:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_write( ... )
   include/linux/instrumented.h:41:9: sparse: sparse: undefined identifier 'kasan_check_write'
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:42:9: sparse: sparse: symbol 'instrument_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-lock.h:42:9: sparse:    int static [signed] [toplevel] instrument_write( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:39:29: sparse: note: previously declared as:
   include/linux/instrumented.h:39:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_write( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:79:9: sparse: sparse: symbol 'instrument_atomic_write' redeclared with different type (different argument counts):
   include/asm-generic/bitops/instrumented-lock.h:79:9: sparse:    int static [signed] [toplevel] instrument_atomic_write( ... )
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse: note: previously declared as:
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse:    int static [signed] [toplevel] instrument_atomic_write( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/pgtable-be-types.h:88:77: sparse: sparse: undefined identifier 'new'
   arch/powerpc/include/asm/pgtable-be-types.h:88:47: sparse: sparse: cast from unknown type
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse: sparse: symbol 'prev' redeclared with different type (different base types):
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse:    int [addressable] [toplevel] prev
   arch/powerpc/include/asm/pgtable-be-types.h:84:16: sparse: note: previously declared as:
   arch/powerpc/include/asm/pgtable-be-types.h:84:16: sparse:    restricted __be64 [addressable] [toplevel] [usertype] prev
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse: sparse: symbol 'prev' redeclared with different type (different base types):
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse:    restricted __be64 [addressable] [toplevel] [usertype] prev
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse: note: previously declared as:
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse:    int [addressable] [toplevel] prev
   arch/powerpc/include/asm/pgtable-be-types.h:99:77: sparse: sparse: undefined identifier 'new'
   arch/powerpc/include/asm/pgtable-be-types.h:99:47: sparse: sparse: cast from unknown type
   arch/powerpc/include/asm/pgtable-be-types.h:98:9: sparse: sparse: symbol 'prev' redeclared with different type (different base types):
   arch/powerpc/include/asm/pgtable-be-types.h:98:9: sparse:    int [addressable] [toplevel] prev
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse: note: previously declared as:
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse:    restricted __be64 [addressable] [toplevel] [usertype] prev
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   include/linux/jump_label.h:199:24: sparse: note: previously declared as:
   include/linux/jump_label.h:199:24: sparse:    int static inline [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: undefined identifier '_entry'
   arch/powerpc/include/asm/mmu.h:259:28: sparse: sparse: undefined identifier 'feature'
   arch/powerpc/include/asm/mmu.h:267:28: sparse: sparse: undefined identifier 'feature'
   arch/powerpc/include/asm/mmu.h:267:9: sparse: sparse: symbol 'i' has multiple initializers (originally initialized at arch/powerpc/include/asm/mmu.h:259)
   arch/powerpc/include/asm/mmu.h:268:9: sparse: sparse: symbol 'cur_cpu_spec' redeclared with different type (different base types):
   arch/powerpc/include/asm/mmu.h:268:9: sparse:    int [addressable] [toplevel] cur_cpu_spec
   lib/raid/raid6/powerpc/altivec2.c: note: in included file:
   arch/powerpc/include/asm/cputable.h:88:33: sparse: note: previously declared as:
   arch/powerpc/include/asm/cputable.h:88:33: sparse:    struct cpu_spec *extern [addressable] [toplevel] cur_cpu_spec
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/radix.h, arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: undefined identifier '_entry'
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: symbol '_entry_ptr' has multiple initializers (originally initialized at arch/powerpc/include/asm/mmu.h:247)
   arch/powerpc/include/asm/cpu_has_feature.h:44:28: sparse: sparse: undefined identifier 'feature'
   arch/powerpc/include/asm/cpu_has_feature.h:44:9: sparse: sparse: symbol 'i' has multiple initializers (originally initialized at arch/powerpc/include/asm/mmu.h:267)
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/radix.h:357:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/book3s/64/radix.h:357:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:26: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at include/asm-generic/bitops/generic-non-atomic.h:109)
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:9: sparse: sparse: symbol 'old' redeclared with different type (different type sizes):
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:9: sparse:    int [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse:    unsigned long [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'arch_static_branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'arch_static_branch_jump'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier '____wrong_branch_error'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
>> include/linux/page_table_check.h:52:13: sparse: sparse: non-scalar type in conditional:
   include/linux/page_table_check.h:52:13: sparse:    void
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:423:9: sparse: sparse: symbol 'page_table_check_pte_clear' redeclared with different type (incompatible argument 1 (different base types)):
   arch/powerpc/include/asm/book3s/64/pgtable.h:423:9: sparse:    int static [signed] [toplevel] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:49:20: sparse: note: previously declared as:
   include/linux/page_table_check.h:49:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:440:58: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:441:17: sparse: sparse: symbol 'page_table_check_pte_clear' redeclared with different type (incompatible argument 1 (different base types)):
   arch/powerpc/include/asm/book3s/64/pgtable.h:441:17: sparse:    int static [signed] [toplevel] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:49:20: sparse: note: previously declared as:
   include/linux/page_table_check.h:49:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:35: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at arch/powerpc/include/asm/book3s/64/pgtable.h:359)
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:9: sparse: sparse: symbol 'old' redeclared with different type (different type sizes):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:9: sparse:    int [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse:    unsigned long [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:35: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at arch/powerpc/include/asm/book3s/64/pgtable.h:1171)
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:9: sparse: sparse: symbol 'old' redeclared with different type (different type sizes):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:9: sparse:    int [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse:    unsigned long [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:285:15: sparse: sparse: undefined identifier 'l'
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:286:9: sparse: sparse: symbol 'i' has multiple initializers (originally initialized at arch/powerpc/include/asm/cpu_has_feature.h:44)
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mce.h:204:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/mce.h:204:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/thread_info.h:209:9: sparse: sparse: symbol 'frame' redeclared with different type (different base types):
   arch/powerpc/include/asm/thread_info.h:209:9: sparse:    int [addressable] [toplevel] frame
   arch/powerpc/include/asm/thread_info.h:206:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/thread_info.h:206:20: sparse:    void const *[addressable] [toplevel] frame
   arch/powerpc/include/asm/thread_info.h:223:17: sparse: sparse: symbol 'params' has multiple initializers (originally initialized at arch/powerpc/include/asm/thread_info.h:208)
   arch/powerpc/include/asm/thread_info.h:224:17: sparse: sparse: symbol 'frame' has multiple initializers (originally initialized at arch/powerpc/include/asm/thread_info.h:209)
   arch/powerpc/include/asm/thread_info.h:224:17: sparse: sparse: symbol 'frame' redeclared with different type (different base types):
   arch/powerpc/include/asm/thread_info.h:224:17: sparse:    int [addressable] [toplevel] frame
   arch/powerpc/include/asm/thread_info.h:206:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/thread_info.h:206:20: sparse:    void const *[addressable] [toplevel] frame
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:21:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/hw_breakpoint.h:21:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:59:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/hw_breakpoint.h:59:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/debug.h:51:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/debug.h:51:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:468:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/preempt.h:468:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/asm-generic/preempt.h:43:24: sparse: note: previously declared as:
   include/asm-generic/preempt.h:43:24: sparse:    int static inline [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:469:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/preempt.h:469:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/asm-generic/preempt.h:43:24: sparse: note: previously declared as:
   include/asm-generic/preempt.h:43:24: sparse:    int static inline [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2139:32: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2173:40: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2173:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2139)
   include/linux/atomic/atomic-arch-fallback.h:2206:40: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2206:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2173)
   include/linux/atomic/atomic-arch-fallback.h:2236:40: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2236:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2206)
--
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/sched.h:18:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/sched.h:18:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/sched.h:18:16: sparse: sparse: got __ffs
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'const_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/kstrtox.h:98:49: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:98:49: sparse: sparse: got *
   include/linux/kstrtox.h:110:80: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:110:80: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/log2.h:45:6: sparse: sparse: Expected ; at end of declaration
   include/linux/log2.h:45:6: sparse: sparse: got is_power_of_2
   include/linux/log2.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:48:1: sparse: sparse: got }
   include/linux/log2.h:58:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:58:1: sparse: sparse: got }
   include/linux/log2.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:68:1: sparse: sparse: got }
   include/linux/log2.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:202:1: sparse: sparse: got }
   include/linux/log2.h:230:26: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:230:26: sparse: sparse: got (
   include/linux/log2.h:230:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/log2.h:232:16: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:232:16: sparse: sparse: got (
   include/linux/log2.h:232:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/log2.h:233:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:233:1: sparse: sparse: got }
   include/linux/log2.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:270:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/math.h:111:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/math.h:111:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/minmax.h:276:20: sparse: sparse: Expected ; at end of declaration
   include/linux/minmax.h:276:20: sparse: sparse: got in_range64
   include/linux/minmax.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:279:1: sparse: sparse: got }
   include/linux/minmax.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:284:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/sprintf.h:14:79: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:14:79: sparse: sparse: got args
   include/linux/sprintf.h:16:80: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:16:80: sparse: sparse: got args
   include/linux/sprintf.h:18:78: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:18:78: sparse: sparse: got args
   include/linux/sprintf.h:19:81: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:19:81: sparse: sparse: got args
   include/linux/sprintf.h:25:13: sparse: sparse: Expected ; at end of declaration
   include/linux/sprintf.h:25:13: sparse: sparse: got no_hash_pointers
   include/linux/sprintf.h:26:34: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:26:34: sparse: sparse: got slub_debug
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/trace_printk.h:173:62: sparse: sparse: Expected ) in function declarator
   include/linux/trace_printk.h:173:62: sparse: sparse: got ap
   include/linux/trace_printk.h:176:61: sparse: sparse: Expected ) in function declarator
   include/linux/trace_printk.h:176:61: sparse: sparse: got ap
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   include/linux/kernel.h:162:13: sparse: sparse: Expected ; at end of declaration
   include/linux/kernel.h:162:13: sparse: sparse: got early_boot_irqs_disabled
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/pgtable-be-types.h:81:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/pgtable-be-types.h:81:20: sparse: sparse: got pte_xchg
>> arch/powerpc/include/asm/pgtable-be-types.h:90:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/pgtable-be-types.h:90:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/pgtable-be-types.h:90:16: sparse: sparse: got pte_raw
   arch/powerpc/include/asm/pgtable-be-types.h:91:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/pgtable-be-types.h:91:1: sparse: sparse: got }
   arch/powerpc/include/asm/pgtable-be-types.h:101:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/pgtable-be-types.h:101:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/pgtable-be-types.h:101:16: sparse: sparse: got pmd_raw
   arch/powerpc/include/asm/pgtable-be-types.h:102:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/pgtable-be-types.h:102:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mmu.h:221:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:221:29: sparse: sparse: got early_mmu_has_feature
>> arch/powerpc/include/asm/mmu.h:226:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/mmu.h:226:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:226:16: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:227:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:227:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/jump_label.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
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
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
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
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mmu.h:238:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:238:29: sparse: sparse: got mmu_has_feature
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: got {
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:242:9: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: got {
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:243:9: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:246:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:246:13: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:246:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: got "Warning! mmu_has_feature() used prior to jump label init!\n"
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:249:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/mmu.h:249:24: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:249:24: sparse: sparse: got early_mmu_has_feature
   arch/powerpc/include/asm/mmu.h:250:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:250:9: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:256:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:256:13: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:256:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got {
   arch/powerpc/include/asm/mmu.h:260:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got (
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got if
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got branch
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got !
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:260:16: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:261:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:261:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:268:21: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:268:21: sparse: sparse: got ->
   arch/powerpc/include/asm/mmu.h:269:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:269:9: sparse: sparse: got &
   arch/powerpc/include/asm/mmu.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:270:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:304:67: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:304:67: sparse: sparse: got flush
   arch/powerpc/include/asm/mmu.h:316:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mmu.h:316:29: sparse: sparse: got radix_enabled
   arch/powerpc/include/asm/mmu.h:319:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:319:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:324:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:324:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:329:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:329:1: sparse: sparse: got }
   arch/powerpc/include/asm/mmu.h:334:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mmu.h:334:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/book3s/64/mmu.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu.h:27:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:35:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:35:13: sparse: sparse: got branch
   include/linux/page_table_check.h:43:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:43:13: sparse: sparse: got branch
   include/linux/page_table_check.h:52:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:52:13: sparse: sparse: got branch
   include/linux/page_table_check.h:61:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:61:13: sparse: sparse: got branch
   include/linux/page_table_check.h:70:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:70:13: sparse: sparse: got branch
   include/linux/page_table_check.h:80:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:80:13: sparse: sparse: got branch
   include/linux/page_table_check.h:89:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:89:13: sparse: sparse: got branch
   include/linux/page_table_check.h:98:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:98:13: sparse: sparse: got branch
   include/linux/page_table_check.h:108:13: sparse: sparse: Expected ; at end of statement
   include/linux/page_table_check.h:108:13: sparse: sparse: got branch
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:268:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:268:20: sparse: sparse: got pmd_leaf
   arch/powerpc/include/asm/book3s/64/pgtable.h:271:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:271:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:277:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:277:1: sparse: sparse: got }
>> arch/powerpc/include/asm/book3s/64/pgtable.h:284:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:285:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:285:17: sparse: sparse: got return
   arch/powerpc/include/asm/book3s/64/pgtable.h:286:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:286:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:293:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:294:17: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:294:17: sparse: sparse: got return
   arch/powerpc/include/asm/book3s/64/pgtable.h:295:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:295:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/radix.h, arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:10:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/cpu_has_feature.h:10:29: sparse: sparse: got early_cpu_has_feature
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
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/radix.h:357:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/radix.h:357:6: sparse: sparse: got vmemmap_can_optimize
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: got __ptep_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: got (
>> arch/powerpc/include/asm/book3s/64/pgtable.h:357:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: got &
>> arch/powerpc/include/asm/book3s/64/pgtable.h:360:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:361:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:361:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:394:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:394:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:399:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:399:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:407:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:407:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:415:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:415:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:425:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:425:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:425:16: sparse: sparse: got old_pte
   arch/powerpc/include/asm/book3s/64/pgtable.h:426:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:426:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:443:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:443:24: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:443:24: sparse: sparse: got old_pte
   arch/powerpc/include/asm/book3s/64/pgtable.h:444:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:444:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:446:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:446:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:453:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:453:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:458:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:458:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:463:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:463:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:468:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:468:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:473:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:473:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:480:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:480:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:485:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:485:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:490:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:490:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:498:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:505:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:505:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:518:24: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:518:24: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:518:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:520:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:520:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:531:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:531:20: sparse: sparse: got pte_user
   arch/powerpc/include/asm/book3s/64/pgtable.h:534:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:534:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:546:19: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:546:19: sparse: sparse: got &&
   arch/powerpc/include/asm/book3s/64/pgtable.h:546:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:549:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:549:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:549:16: sparse: sparse: got arch_pte_access_permitted
   arch/powerpc/include/asm/book3s/64/pgtable.h:550:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:550:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:555:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:555:1: sparse: sparse: got }
>> arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:566:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:567:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:569:16: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:569:16: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:569:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:570:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:570:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:576:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:576:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:581:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:581:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:586:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:586:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:591:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:591:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:596:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:596:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:604:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:604:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:609:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:609:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:614:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:614:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:619:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:619:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:624:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:624:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:631:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:631:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:674:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:674:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:679:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:679:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:684:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:684:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:690:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:690:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:695:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:695:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:700:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:700:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:712:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:712:13: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:712:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:715:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:715:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:715:16: sparse: sparse: got true
   arch/powerpc/include/asm/book3s/64/pgtable.h:716:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:716:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:729:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:729:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:729:16: sparse: sparse: got hash__ptep_set_access_flags
   arch/powerpc/include/asm/book3s/64/pgtable.h:730:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:730:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:737:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:737:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:737:16: sparse: sparse: got hash__pte_same
   arch/powerpc/include/asm/book3s/64/pgtable.h:738:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:738:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:744:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:744:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:744:16: sparse: sparse: got hash__pte_none
   arch/powerpc/include/asm/book3s/64/pgtable.h:745:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:745:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:751:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:758:26: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:758:26: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:758:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:760:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:760:16: sparse: sparse: Expected ; at end of declaration
--
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1262:9: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1263:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1263:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1263:16: sparse: sparse: got pud
   arch/powerpc/include/asm/book3s/64/pgtable.h:1264:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1264:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1273:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:1274:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1275:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1278:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1278:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1278:16: sparse: sparse: got pmd
   arch/powerpc/include/asm/book3s/64/pgtable.h:1279:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1279:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1285:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got {
   arch/powerpc/include/asm/book3s/64/pgtable.h:1286:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1287:17: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1289:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1289:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1289:16: sparse: sparse: got pud
   arch/powerpc/include/asm/book3s/64/pgtable.h:1290:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1290:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1296:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1296:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1301:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1301:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1308:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1308:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1313:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1313:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:6: sparse: sparse: got pmdp_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:6: sparse: sparse: got pudp_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:1435:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1435:20: sparse: sparse: got arch_needs_pgtable_deposit
   arch/powerpc/include/asm/book3s/64/pgtable.h:1439:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1439:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1439:16: sparse: sparse: got true
   arch/powerpc/include/asm/book3s/64/pgtable.h:1440:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1440:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/pgtable.h:1452:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1452:20: sparse: sparse: got is_pte_rw_upgrade
   arch/powerpc/include/asm/book3s/64/pgtable.h:1457:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:1457:13: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:1457:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1460:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:1460:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1460:16: sparse: sparse: got false
   arch/powerpc/include/asm/book3s/64/pgtable.h:1461:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:1461:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:172:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:172:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:277:51: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:277:51: sparse: sparse: got is_base_size
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:281:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:281:13: sparse: sparse: got !
>> arch/powerpc/include/asm/book3s/64/mmu-hash.h:281:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:287:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:287:13: sparse: sparse: got !
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:287:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:289:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:289:13: sparse: sparse: got !
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:289:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> arch/powerpc/include/asm/book3s/64/mmu-hash.h:291:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:291:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:291:16: sparse: sparse: got 1ul
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:292:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:292:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:297:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:297:1: sparse: sparse: got }
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:302:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/kvm_book3s_asm.h:124:14: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/kvm_book3s_asm.h:124:14: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/kvm_book3s_asm.h:124:14: sparse: sparse: got in_use
   arch/powerpc/include/asm/kvm_book3s_asm.h:151:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/kvm_book3s_asm.h:151:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/cpuidle.h:81:14: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/cpuidle.h:81:14: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/cpuidle.h:81:14: sparse: sparse: got valid
   arch/powerpc/include/asm/cpuidle.h:82:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/cpuidle.h:82:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mce.h:122:33: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/mce.h:122:33: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/mce.h:122:33: sparse: sparse: got sync_error
   arch/powerpc/include/asm/mce.h:187:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mce.h:187:1: sparse: sparse: got }
   arch/powerpc/include/asm/mce.h:203:33: sparse: sparse: expected ; at end of declaration
   arch/powerpc/include/asm/mce.h:203:33: sparse: sparse: Expected } at end of specifier
   arch/powerpc/include/asm/mce.h:203:33: sparse: sparse: got sync_error
   arch/powerpc/include/asm/mce.h:204:33: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/mce.h:204:33: sparse: sparse: got ignore_event
   arch/powerpc/include/asm/mce.h:205:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/mce.h:205:1: sparse: sparse: got }
   arch/powerpc/include/asm/mce.h:230:64: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mce.h:230:64: sparse: sparse: got release
   arch/powerpc/include/asm/mce.h:234:49: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mce.h:234:49: sparse: sparse: got user_mode
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: got strict_msr_control
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/math64.h, include/linux/time64.h, include/linux/restart_block.h, include/linux/thread_info.h, ...):
   include/vdso/math64.h:46:14: sparse: sparse: Expected ; at end of statement
   include/vdso/math64.h:46:14: sparse: sparse: got ovf
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/restart_block.h, include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   include/linux/time64.h:52:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:52:20: sparse: sparse: got timespec64_is_epoch
   include/linux/time64.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:55:1: sparse: sparse: got }
   include/linux/time64.h:66:16: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:66:16: sparse: sparse: got ->
   include/linux/time64.h:66:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:68:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:68:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:68:16: sparse: sparse: got lhs
   include/linux/time64.h:69:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:69:1: sparse: sparse: got }
   include/linux/time64.h:97:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:97:20: sparse: sparse: got timespec64_valid
   include/linux/time64.h:103:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:103:13: sparse: sparse: got (
   include/linux/time64.h:103:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:105:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:105:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:105:16: sparse: sparse: got true
   include/linux/time64.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:106:1: sparse: sparse: got }
   include/linux/time64.h:113:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:113:13: sparse: sparse: got (
   include/linux/time64.h:113:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:115:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:115:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:115:16: sparse: sparse: got true
   include/linux/time64.h:116:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:116:1: sparse: sparse: got }
   include/linux/time64.h:123:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:123:13: sparse: sparse: got (
   include/linux/time64.h:123:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:125:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:125:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:125:16: sparse: sparse: got true
   include/linux/time64.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:126:1: sparse: sparse: got }
   include/linux/time64.h:141:15: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:141:15: sparse: sparse: got ->
   include/linux/time64.h:141:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:144:17: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:144:17: sparse: sparse: got (
   include/linux/time64.h:144:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:145:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:145:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: got test_thread_local_flags
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: got ->
   arch/powerpc/include/asm/thread_info.h:174:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: got <=
   arch/powerpc/include/asm/thread_info.h:220:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
>> include/linux/thread_info.h:87:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/thread_info.h:87:9: sparse: sparse: Expected ; at end of declaration
   include/linux/thread_info.h:87:9: sparse: sparse: got {
>> include/linux/thread_info.h:88:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/thread_info.h:88:16: sparse: sparse: Expected ; at end of declaration
   include/linux/thread_info.h:88:16: sparse: sparse: got -
   include/linux/thread_info.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:89:1: sparse: sparse: got }
   include/linux/thread_info.h:105:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:105:1: sparse: sparse: got }
   include/linux/thread_info.h:110:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/thread_info.h:110:1: sparse: sparse: got }
   include/linux/thread_info.h:117:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/thread_info.h:118:17: sparse: sparse: Expected ; at end of declaration
   include/linux/thread_info.h:118:17: sparse: sparse: got clear_ti_thread_flag
   include/linux/thread_info.h:119:1: sparse: sparse: Expected ; at the end of type declaration
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
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/debug.h:51:6: sparse: sparse: got ppc_breakpoint_available
--
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse:    incomplete type *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:112:9: sparse: sparse: undefined identifier 'kasan_check_write'
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:71:9: sparse: sparse: symbol 'instrument_atomic_read_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-atomic.h:71:9: sparse:    int static [signed] [toplevel] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:110:29: sparse: note: previously declared as:
   include/linux/instrumented.h:110:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:85:9: sparse: sparse: symbol 'instrument_atomic_read_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-atomic.h:85:9: sparse:    int static [signed] [toplevel] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:110:29: sparse: note: previously declared as:
   include/linux/instrumented.h:110:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:99:9: sparse: sparse: symbol 'instrument_atomic_read_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-atomic.h:99:9: sparse:    int static [signed] [toplevel] instrument_atomic_read_write( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:110:29: sparse: note: previously declared as:
   include/linux/instrumented.h:110:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_read_write( ... )
   include/linux/instrumented.h:97:9: sparse: sparse: undefined identifier 'kasan_check_write'
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse: sparse: symbol 'instrument_atomic_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse:    int static [signed] [toplevel] instrument_atomic_write( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:95:29: sparse: note: previously declared as:
   include/linux/instrumented.h:95:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_atomic_write( ... )
   include/linux/instrumented.h:41:9: sparse: sparse: undefined identifier 'kasan_check_write'
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:42:9: sparse: sparse: symbol 'instrument_write' redeclared with different type (incompatible argument 1 (different base types)):
   include/asm-generic/bitops/instrumented-lock.h:42:9: sparse:    int static [signed] [toplevel] instrument_write( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:39:29: sparse: note: previously declared as:
   include/linux/instrumented.h:39:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] instrument_write( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:79:9: sparse: sparse: symbol 'instrument_atomic_write' redeclared with different type (different argument counts):
   include/asm-generic/bitops/instrumented-lock.h:79:9: sparse:    int static [signed] [toplevel] instrument_atomic_write( ... )
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse: note: previously declared as:
   include/asm-generic/bitops/instrumented-lock.h:26:9: sparse:    int static [signed] [toplevel] instrument_atomic_write( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/pgtable-be-types.h:88:77: sparse: sparse: undefined identifier 'new'
   arch/powerpc/include/asm/pgtable-be-types.h:88:47: sparse: sparse: cast from unknown type
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse: sparse: symbol 'prev' redeclared with different type (different base types):
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse:    int [addressable] [toplevel] prev
   arch/powerpc/include/asm/pgtable-be-types.h:84:16: sparse: note: previously declared as:
   arch/powerpc/include/asm/pgtable-be-types.h:84:16: sparse:    restricted __be64 [addressable] [toplevel] [usertype] prev
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse: sparse: symbol 'prev' redeclared with different type (different base types):
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse:    restricted __be64 [addressable] [toplevel] [usertype] prev
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse: note: previously declared as:
   arch/powerpc/include/asm/pgtable-be-types.h:87:9: sparse:    int [addressable] [toplevel] prev
   arch/powerpc/include/asm/pgtable-be-types.h:99:77: sparse: sparse: undefined identifier 'new'
   arch/powerpc/include/asm/pgtable-be-types.h:99:47: sparse: sparse: cast from unknown type
   arch/powerpc/include/asm/pgtable-be-types.h:98:9: sparse: sparse: symbol 'prev' redeclared with different type (different base types):
   arch/powerpc/include/asm/pgtable-be-types.h:98:9: sparse:    int [addressable] [toplevel] prev
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse: note: previously declared as:
   arch/powerpc/include/asm/pgtable-be-types.h:96:16: sparse:    restricted __be64 [addressable] [toplevel] [usertype] prev
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   include/linux/jump_label.h:199:24: sparse: note: previously declared as:
   include/linux/jump_label.h:199:24: sparse:    int static inline [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mmu.h:247:17: sparse: sparse: undefined identifier '_entry'
   arch/powerpc/include/asm/mmu.h:259:28: sparse: sparse: undefined identifier 'feature'
   arch/powerpc/include/asm/mmu.h:267:28: sparse: sparse: undefined identifier 'feature'
   arch/powerpc/include/asm/mmu.h:267:9: sparse: sparse: symbol 'i' has multiple initializers (originally initialized at arch/powerpc/include/asm/mmu.h:259)
   arch/powerpc/include/asm/mmu.h:268:9: sparse: sparse: symbol 'cur_cpu_spec' redeclared with different type (different base types):
   arch/powerpc/include/asm/mmu.h:268:9: sparse:    int [addressable] [toplevel] cur_cpu_spec
   lib/raid/raid6/powerpc/altivec8.c: note: in included file:
   arch/powerpc/include/asm/cputable.h:88:33: sparse: note: previously declared as:
   arch/powerpc/include/asm/cputable.h:88:33: sparse:    struct cpu_spec *extern [addressable] [toplevel] cur_cpu_spec
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/radix.h, arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, ...):
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: undefined identifier '_entry'
   arch/powerpc/include/asm/cpu_has_feature.h:32:17: sparse: sparse: symbol '_entry_ptr' has multiple initializers (originally initialized at arch/powerpc/include/asm/mmu.h:247)
   arch/powerpc/include/asm/cpu_has_feature.h:44:28: sparse: sparse: undefined identifier 'feature'
   arch/powerpc/include/asm/cpu_has_feature.h:44:9: sparse: sparse: symbol 'i' has multiple initializers (originally initialized at arch/powerpc/include/asm/mmu.h:267)
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/radix.h:357:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/book3s/64/radix.h:357:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:26: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at include/asm-generic/bitops/generic-non-atomic.h:109)
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:9: sparse: sparse: symbol 'old' redeclared with different type (different type sizes):
   arch/powerpc/include/asm/book3s/64/pgtable.h:359:9: sparse:    int [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse:    unsigned long [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'arch_static_branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'arch_static_branch_jump'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier '____wrong_branch_error'
   include/linux/page_table_check.h:52:13: sparse: sparse: undefined identifier 'branch'
>> include/linux/page_table_check.h:52:13: sparse: sparse: non-scalar type in conditional:
   include/linux/page_table_check.h:52:13: sparse:    void
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:423:9: sparse: sparse: symbol 'page_table_check_pte_clear' redeclared with different type (incompatible argument 1 (different base types)):
   arch/powerpc/include/asm/book3s/64/pgtable.h:423:9: sparse:    int static [signed] [toplevel] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:49:20: sparse: note: previously declared as:
   include/linux/page_table_check.h:49:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:440:58: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:441:17: sparse: sparse: symbol 'page_table_check_pte_clear' redeclared with different type (incompatible argument 1 (different base types)):
   arch/powerpc/include/asm/book3s/64/pgtable.h:441:17: sparse:    int static [signed] [toplevel] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, ...):
   include/linux/page_table_check.h:49:20: sparse: note: previously declared as:
   include/linux/page_table_check.h:49:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] page_table_check_pte_clear( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:35: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at arch/powerpc/include/asm/book3s/64/pgtable.h:359)
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:9: sparse: sparse: symbol 'old' redeclared with different type (different type sizes):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1171:9: sparse:    int [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse:    unsigned long [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:35: sparse: sparse: undefined identifier 'mm'
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:9: sparse: sparse: symbol 'old' has multiple initializers (originally initialized at arch/powerpc/include/asm/book3s/64/pgtable.h:1171)
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:9: sparse: sparse: symbol 'old' redeclared with different type (different type sizes):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1182:9: sparse:    int [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse: note: previously declared as:
   include/asm-generic/bitops/generic-non-atomic.h:109:23: sparse:    unsigned long [addressable] [toplevel] old
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1326:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/book3s/64/pgtable.h:1329:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:285:15: sparse: sparse: undefined identifier 'l'
   arch/powerpc/include/asm/book3s/64/mmu-hash.h:286:9: sparse: sparse: symbol 'i' has multiple initializers (originally initialized at arch/powerpc/include/asm/cpu_has_feature.h:44)
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/mce.h:204:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/mce.h:204:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/thread_info.h:209:9: sparse: sparse: symbol 'frame' redeclared with different type (different base types):
   arch/powerpc/include/asm/thread_info.h:209:9: sparse:    int [addressable] [toplevel] frame
   arch/powerpc/include/asm/thread_info.h:206:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/thread_info.h:206:20: sparse:    void const *[addressable] [toplevel] frame
   arch/powerpc/include/asm/thread_info.h:223:17: sparse: sparse: symbol 'params' has multiple initializers (originally initialized at arch/powerpc/include/asm/thread_info.h:208)
   arch/powerpc/include/asm/thread_info.h:224:17: sparse: sparse: symbol 'frame' has multiple initializers (originally initialized at arch/powerpc/include/asm/thread_info.h:209)
   arch/powerpc/include/asm/thread_info.h:224:17: sparse: sparse: symbol 'frame' redeclared with different type (different base types):
   arch/powerpc/include/asm/thread_info.h:224:17: sparse:    int [addressable] [toplevel] frame
   arch/powerpc/include/asm/thread_info.h:206:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/thread_info.h:206:20: sparse:    void const *[addressable] [toplevel] frame
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:21:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/hw_breakpoint.h:21:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/hw_breakpoint.h:59:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/hw_breakpoint.h:59:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/hw_breakpoint.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/debug.h:51:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   arch/powerpc/include/asm/debug.h:51:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/mmu.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:337:1: sparse: note: previously declared as:
   include/linux/jump_label.h:337:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:468:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/preempt.h:468:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/asm-generic/preempt.h:43:24: sparse: note: previously declared as:
   include/asm-generic/preempt.h:43:24: sparse:    int static inline [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:469:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/preempt.h:469:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/asm-generic/preempt.h:43:24: sparse: note: previously declared as:
   include/asm-generic/preempt.h:43:24: sparse:    int static inline [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2139:32: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2173:40: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2173:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2139)
   include/linux/atomic/atomic-arch-fallback.h:2206:40: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2206:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2173)
   include/linux/atomic/atomic-arch-fallback.h:2236:40: sparse: sparse: undefined identifier 'v'
   include/linux/atomic/atomic-arch-fallback.h:2236:9: sparse: sparse: symbol 'r' has multiple initializers (originally initialized at include/linux/atomic/atomic-arch-fallback.h:2206)

vim +/return +90 arch/powerpc/include/asm/pgtable-be-types.h

5dc1ef858c12f8 Aneesh Kumar K.V       2016-04-29  80  
5dc1ef858c12f8 Aneesh Kumar K.V       2016-04-29 @81  static inline bool pte_xchg(pte_t *ptep, pte_t old, pte_t new)
5dc1ef858c12f8 Aneesh Kumar K.V       2016-04-29  82  {
5dc1ef858c12f8 Aneesh Kumar K.V       2016-04-29  83  	unsigned long *p = (unsigned long *)ptep;
5dc1ef858c12f8 Aneesh Kumar K.V       2016-04-29  84  	__be64 prev;
5dc1ef858c12f8 Aneesh Kumar K.V       2016-04-29  85  
1a92a80ad386a1 Benjamin Herrenschmidt 2017-07-24  86  	/* See comment in switch_mm_irqs_off() */
5dc1ef858c12f8 Aneesh Kumar K.V       2016-04-29  87  	prev = (__force __be64)__cmpxchg_u64(p, (__force unsigned long)pte_raw(old),
5dc1ef858c12f8 Aneesh Kumar K.V       2016-04-29  88  					     (__force unsigned long)pte_raw(new));
5dc1ef858c12f8 Aneesh Kumar K.V       2016-04-29  89  
5dc1ef858c12f8 Aneesh Kumar K.V       2016-04-29 @90  	return pte_raw(old) == prev;
5dc1ef858c12f8 Aneesh Kumar K.V       2016-04-29  91  }
5dc1ef858c12f8 Aneesh Kumar K.V       2016-04-29  92  

:::::: The code at line 90 was first introduced by commit
:::::: 5dc1ef858c12f865e3676727e03519bece4ce6c1 powerpc/mm: Use big endian Linux page tables for book3s 64

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
