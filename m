Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F4233B970
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 01:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783821098; cv=none; b=WYdfq/jtD4XpZ1+JNzBR2A/riwVxlmS20ltNMmPPIBezCkPb681bgWQUs9ZbuTjisYp7/+qeFf3guc93+ee2lj4Y3bB+JXmi1EkDOfX+WGQrxGHLnDIK56R3KdYcHntrM1YYK3hXz3Acv/3R/31t/XTfhSHRo/kdklxiBp45gB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783821098; c=relaxed/simple;
	bh=JwQ892YWYU081NHR0gGsaG2x3adcPi/h7o9LSs9HQ8Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bcxHPWD2S/5XjUVta+DOc+ng++c5TueeYZwTyyvxDqXcxP32L+DBH9Y4AMCFALb4zaV9e46Ae47BgAmHml9Up8HNaturwXZv0o/4haj/UyVA7vbLew4zvYoD5RNMkaRihdCuGjXB0YtaadWDzV9XOfLziCeIfdsG2ZkIBZTfzSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPHqX7fV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPHqX7fV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783821092; x=1815357092;
  h=date:from:to:cc:subject:message-id;
  bh=JwQ892YWYU081NHR0gGsaG2x3adcPi/h7o9LSs9HQ8Y=;
  b=cPHqX7fVb/H1KL25XeQpDd0XzA3zIO9jJtnQMAcIVHG6JdDQSBvAotSN
   4swpzxERLUu5+4jFdTh1bIgXLNZMPgHFAbAiXGWtNViGBd9vxG+W5UA6Y
   aglhJQlj4WWaWsQHIH5/y8lxgARniVMF3hLamJTFXEnFbqHuzmsKPMfC3
   x8oeNWxETe4sjxkCG+Q3db5Gcwz9mWDejrL/YEFH5+eMOmHF49tAwLtHg
   ZWkItSACciiWI7UChopgBdH6vIPi5m0p2+g+8X5izqvqXxFUC9NLMwFVZ
   awjRxa6mrnqr//NZa7c5hdhr7gQGG2QCw9YNaBETvDEBW80nug7KshKkp
   A==;
X-CSE-ConnectionGUID: zlr5SE5TRq2f5Pm2Twrqqg==
X-CSE-MsgGUID: WCwAi/g/QNal92SB3s7gRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84256710"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84256710"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 18:51:27 -0700
X-CSE-ConnectionGUID: VSR1dYgzQQOn4Bo16/pl5Q==
X-CSE-MsgGUID: w8wgrm6MRe2O5KR2HDiiOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251244442"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jul 2026 18:51:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wijLg-00000000KaK-37h0;
	Sun, 12 Jul 2026 01:51:16 +0000
Date: Sun, 12 Jul 2026 09:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [davidhildenbrand:folded_pgtable 31/33]
 include/asm-generic/pgtable-nop4d.h:38:9: sparse: sparse: Trying to use
 reserved word 'return' as identifier
Message-ID: <202607120931.fZrqSeia-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/asm-generic/pgtable-nop4d.h:38:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "David Hildenbrand (Arm)" <david@kernel.org>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   4f354ce7639e6b4eeff0e1a13758617d3bf34178
commit: 0d6e710021b376c3120373fda3ea5743f376ef09 [31/33] mm/pgtable: optimize pmdp_get() and friends for folded pagetable levels
:::::: branch date: 33 hours ago
:::::: commit date: 35 hours ago
config: powerpc64-randconfig-r131-20260711 (https://download.01.org/0day-ci/archive/20260712/202607120931.fZrqSeia-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120931.fZrqSeia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607120931.fZrqSeia-lkp@intel.com/

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
   arch/powerpc/include/asm/mmu.h:253:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:253:13: sparse: sparse: got 0x00000001UL
   arch/powerpc/include/asm/mmu.h:253:9: sparse: sparse: Trying to use reserved word 'if' as identifier
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
   include/asm-generic/pgtable-nop4d.h:25:20: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/pgtable-nop4d.h:25:20: sparse: sparse: got pgd_leaf
   include/asm-generic/pgtable-nop4d.h:25:65: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:25:65: sparse: sparse: got }
>> include/asm-generic/pgtable-nop4d.h:38:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/pgtable-nop4d.h:38:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/pgtable-nop4d.h:38:16: sparse: sparse: got dummy
   include/asm-generic/pgtable-nop4d.h:39:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:39:1: sparse: sparse: got }
   include/asm-generic/pgtable-nop4d.h:45:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:45:1: sparse: sparse: got }
   include/asm-generic/pgtable-nop4d.h:51:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:51:1: sparse: sparse: got }
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
   arch/powerpc/include/asm/book3s/64/pgtable.h:284:9: sparse: sparse: Trying to use reserved word 'else' as identifier
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
   arch/powerpc/include/asm/cpu_has_feature.h:38:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:38:13: sparse: sparse: got (
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
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: got __ptep_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: got &
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:9: sparse: sparse: Trying to use reserved word 'return' as identifier
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
   arch/powerpc/include/asm/mmu.h:253:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:253:13: sparse: sparse: got 0x00000001UL
   arch/powerpc/include/asm/mmu.h:253:9: sparse: sparse: Trying to use reserved word 'if' as identifier
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
   include/asm-generic/pgtable-nop4d.h:25:20: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/pgtable-nop4d.h:25:20: sparse: sparse: got pgd_leaf
   include/asm-generic/pgtable-nop4d.h:25:65: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:25:65: sparse: sparse: got }
>> include/asm-generic/pgtable-nop4d.h:38:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/pgtable-nop4d.h:38:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/pgtable-nop4d.h:38:16: sparse: sparse: got dummy
   include/asm-generic/pgtable-nop4d.h:39:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:39:1: sparse: sparse: got }
   include/asm-generic/pgtable-nop4d.h:45:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:45:1: sparse: sparse: got }
   include/asm-generic/pgtable-nop4d.h:51:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:51:1: sparse: sparse: got }
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
   arch/powerpc/include/asm/book3s/64/pgtable.h:284:9: sparse: sparse: Trying to use reserved word 'else' as identifier
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
   arch/powerpc/include/asm/cpu_has_feature.h:38:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:38:13: sparse: sparse: got (
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
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: got __ptep_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: got &
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:9: sparse: sparse: Trying to use reserved word 'return' as identifier
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
   arch/powerpc/include/asm/mmu.h:253:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:253:13: sparse: sparse: got 0x00000001UL
   arch/powerpc/include/asm/mmu.h:253:9: sparse: sparse: Trying to use reserved word 'if' as identifier
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
   include/asm-generic/pgtable-nop4d.h:25:20: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/pgtable-nop4d.h:25:20: sparse: sparse: got pgd_leaf
   include/asm-generic/pgtable-nop4d.h:25:65: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:25:65: sparse: sparse: got }
>> include/asm-generic/pgtable-nop4d.h:38:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/pgtable-nop4d.h:38:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/pgtable-nop4d.h:38:16: sparse: sparse: got dummy
   include/asm-generic/pgtable-nop4d.h:39:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:39:1: sparse: sparse: got }
   include/asm-generic/pgtable-nop4d.h:45:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:45:1: sparse: sparse: got }
   include/asm-generic/pgtable-nop4d.h:51:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:51:1: sparse: sparse: got }
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
   arch/powerpc/include/asm/book3s/64/pgtable.h:284:9: sparse: sparse: Trying to use reserved word 'else' as identifier
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
   arch/powerpc/include/asm/cpu_has_feature.h:38:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:38:13: sparse: sparse: got (
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
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: got __ptep_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: got &
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:9: sparse: sparse: Trying to use reserved word 'return' as identifier
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
   arch/powerpc/include/asm/mmu.h:253:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/mmu.h:253:13: sparse: sparse: got 0x00000001UL
   arch/powerpc/include/asm/mmu.h:253:9: sparse: sparse: Trying to use reserved word 'if' as identifier
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
   include/asm-generic/pgtable-nop4d.h:25:20: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/pgtable-nop4d.h:25:20: sparse: sparse: got pgd_leaf
   include/asm-generic/pgtable-nop4d.h:25:65: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:25:65: sparse: sparse: got }
>> include/asm-generic/pgtable-nop4d.h:38:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/pgtable-nop4d.h:38:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/pgtable-nop4d.h:38:16: sparse: sparse: got dummy
   include/asm-generic/pgtable-nop4d.h:39:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:39:1: sparse: sparse: got }
   include/asm-generic/pgtable-nop4d.h:45:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:45:1: sparse: sparse: got }
   include/asm-generic/pgtable-nop4d.h:51:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/pgtable-nop4d.h:51:1: sparse: sparse: got }
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
   arch/powerpc/include/asm/book3s/64/pgtable.h:284:9: sparse: sparse: Trying to use reserved word 'else' as identifier
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
   arch/powerpc/include/asm/cpu_has_feature.h:38:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/cpu_has_feature.h:38:13: sparse: sparse: got (
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
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/book3s/64/pgtable.h:352:20: sparse: sparse: got __ptep_test_and_clear_young
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:13: sparse: sparse: got (
   arch/powerpc/include/asm/book3s/64/pgtable.h:357:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:21: sparse: sparse: got &
   arch/powerpc/include/asm/book3s/64/pgtable.h:360:9: sparse: sparse: Trying to use reserved word 'return' as identifier

vim +/return +38 include/asm-generic/pgtable-nop4d.h

048456dcf2c56ad Kiryl Shutsemau         2017-03-09  15  
048456dcf2c56ad Kiryl Shutsemau         2017-03-09  16  /*
048456dcf2c56ad Kiryl Shutsemau         2017-03-09  17   * The "pgd_xxx()" functions here are trivial for a folded two-level
048456dcf2c56ad Kiryl Shutsemau         2017-03-09  18   * setup: the p4d is never bad, and a p4d always exists (as it's folded
048456dcf2c56ad Kiryl Shutsemau         2017-03-09  19   * into the pgd entry)
048456dcf2c56ad Kiryl Shutsemau         2017-03-09  20   */
048456dcf2c56ad Kiryl Shutsemau         2017-03-09  21  static inline int pgd_none(pgd_t pgd)		{ return 0; }
048456dcf2c56ad Kiryl Shutsemau         2017-03-09  22  static inline int pgd_bad(pgd_t pgd)		{ return 0; }
048456dcf2c56ad Kiryl Shutsemau         2017-03-09  23  static inline int pgd_present(pgd_t pgd)	{ return 1; }
048456dcf2c56ad Kiryl Shutsemau         2017-03-09  24  static inline void pgd_clear(pgd_t *pgd)	{ }
88792a6a7880ca6 David Hildenbrand (Arm  2026-07-02 @25) static inline bool pgd_leaf(pgd_t pgd)		{ return false; }
88792a6a7880ca6 David Hildenbrand (Arm  2026-07-02  26) #define pgd_leaf pgd_leaf
048456dcf2c56ad Kiryl Shutsemau         2017-03-09  27  #define p4d_ERROR(p4d)				(pgd_ERROR((p4d).pgd))
048456dcf2c56ad Kiryl Shutsemau         2017-03-09  28  
048456dcf2c56ad Kiryl Shutsemau         2017-03-09  29  #define pgd_populate(mm, pgd, p4d)		do { } while (0)
0a9fe8ca844d43f Dan Williams            2018-12-04  30  #define pgd_populate_safe(mm, pgd, p4d)		do { } while (0)
d9d8335837a2e1e David Hildenbrand (Arm  2026-07-03  31) 
d9d8335837a2e1e David Hildenbrand (Arm  2026-07-03  32) #define set_pgd(pgdptr, pgdval)			BUILD_BUG()
048456dcf2c56ad Kiryl Shutsemau         2017-03-09  33  
0d6e710021b376c David Hildenbrand (Arm  2026-07-02  34) static inline pgd_t pgdp_get(pgd_t *p4dp)
0d6e710021b376c David Hildenbrand (Arm  2026-07-02  35) {
0d6e710021b376c David Hildenbrand (Arm  2026-07-02  36) 	pgd_t dummy = { 0 };
0d6e710021b376c David Hildenbrand (Arm  2026-07-02  37) 
0d6e710021b376c David Hildenbrand (Arm  2026-07-02 @38) 	return dummy;
0d6e710021b376c David Hildenbrand (Arm  2026-07-02  39) }
0d6e710021b376c David Hildenbrand (Arm  2026-07-02  40) #define pgdp_get pgdp_get
0d6e710021b376c David Hildenbrand (Arm  2026-07-02  41) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
