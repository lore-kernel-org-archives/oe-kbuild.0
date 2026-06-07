Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B696214BF97
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jun 2026 06:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780813041; cv=none; b=sHKwwMEbaqJfoUrERBdCTrLJqpYo1MQ1hMdZEqu+uTtKO4+KQ7huI6rRF+gImhjOjQgyO7b/qMQCItfvogSWNbuL3CwLw9wZfPJH2ebMJ7Cv9GC/VQy47+X4TS8oF53xf1HzaY3akp70ljg6RJ9B4YpNYkITgdvxGiLBBQhqnjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780813041; c=relaxed/simple;
	bh=LgBR4oc27S+QqW91Y5ILxAvT4ANoobNJmpaVxMGUSUs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hMVkLter3eBJbz+c+bqwpnQZFo7O75shUjb6h+RHE8z2lh6+/ZSpbXrABb9qc7SzvHeE1Etlw3WhzQGEGEw0LSZVDZ4LhpQDOTi8hmb/R+fz3514LuP2KZ7jy1ejjSEr0WCL2cHnVQJbikHRTi4ZL5qGB1nR2lOrkJgMQyVYiaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goefrShQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goefrShQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780813037; x=1812349037;
  h=date:from:to:cc:subject:message-id;
  bh=LgBR4oc27S+QqW91Y5ILxAvT4ANoobNJmpaVxMGUSUs=;
  b=goefrShQhfhZo8gxmzJGLFGnsTZ/3Wp6Dv+97Gxqne+gZn3EHu+VoLOx
   6OSsI/37QEg9+TCX8SzJp8SnNEqpd3HjZGvPUAJ/ufCUYXLHuHna2rsHJ
   maOFGZ+nI2bKCj9AqXDmgqL4P/y9nVm4tCmrFJrSrDW4uq+cKXGeKv4q2
   4XX2NHCM2i2Vj5pN8RUdIkn5TeAxejkvly7853H2TG9uWtk3bheODkOTz
   o8i6mDZsNhFpXl8QJ7X5pgZyJPGO3/l3wswJJHmiTEHmc/SizY/dxC2Ke
   r1cJM42JCREZOyGTQbaXqicuaZjlVIeG+KemKoIhl92it8qDDRpDU2GMu
   g==;
X-CSE-ConnectionGUID: IhgV4kR+QQqx+cRfNbfcRQ==
X-CSE-MsgGUID: dxl8dMZzQD+pf5MAFaltOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="81644431"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="81644431"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 23:17:17 -0700
X-CSE-ConnectionGUID: exa6bRZyRZuL4OyNM63lew==
X-CSE-MsgGUID: o/11YCFvRU6PGqg6bD931Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="242761506"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jun 2026 23:17:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wW6or-00000000HfC-1Wsh;
	Sun, 07 Jun 2026 06:17:13 +0000
Date: Sun, 07 Jun 2026 14:16:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11752/11755]
 include/linux/instrumented.h:42:9: sparse: sparse: Trying to use reserved
 word 'typeof' as identifier
Message-ID: <202606071453.Kuo62rqC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/instrumented.h:42:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Marco Elver <elver@google.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6e845bcb78c95af935094040bd4edc3c2b6dd784
commit: 6d070b50b3b67cc72cabdc916f9858db1dbb2cd6 [11752/11755] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-r131-20260606 (https://download.01.org/0day-ci/archive/20260607/202606071453.Kuo62rqC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606071453.Kuo62rqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606071453.Kuo62rqC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:183:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:251:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: got &&
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, ...):
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: got (
   arch/powerpc/include/asm/bitops.h:283:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: got 32
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/fls64.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: got return
   include/asm-generic/bitops/fls64.h:24:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: got fls
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bitops/hweight.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:28:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:28:9: sparse: sparse: got ,
   include/linux/instrumented.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:29:1: sparse: sparse: got }
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got (
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got (
>> include/linux/instrumented.h:42:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:42:9: sparse: sparse: got }
   include/linux/instrumented.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:43:1: sparse: sparse: got }
   include/linux/instrumented.h:56:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:56:9: sparse: sparse: got ,
   include/linux/instrumented.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:57:1: sparse: sparse: got }
   include/linux/instrumented.h:65:21: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:65:21: sparse: sparse: got 0
   include/linux/instrumented.h:65:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:66:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:66:57: sparse: sparse: got }
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in nested declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got {
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got (
   include/linux/instrumented.h:67:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got !
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:67:17: sparse: sparse: got }
   include/linux/instrumented.h:68:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:68:9: sparse: sparse: got }
   include/linux/instrumented.h:83:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:83:9: sparse: sparse: got ,
   include/linux/instrumented.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:85:1: sparse: sparse: got }
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got (
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got (
   include/linux/instrumented.h:98:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:98:9: sparse: sparse: got }
   include/linux/instrumented.h:100:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:100:1: sparse: sparse: got }
   include/linux/instrumented.h:113:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:113:9: sparse: sparse: got ,
   include/linux/instrumented.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:115:1: sparse: sparse: got }
   include/linux/instrumented.h:130:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:130:9: sparse: sparse: got ,
   include/linux/instrumented.h:131:39: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:131:39: sparse: sparse: got ,
   include/linux/instrumented.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:132:1: sparse: sparse: got }
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got (
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got (
   include/linux/instrumented.h:147:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:147:9: sparse: sparse: got }
   include/linux/instrumented.h:148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:148:1: sparse: sparse: got }
   include/linux/instrumented.h:165:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:165:1: sparse: sparse: got }
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got (
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got (
   include/linux/instrumented.h:181:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:181:9: sparse: sparse: got }
   include/linux/instrumented.h:182:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:182:9: sparse: sparse: got ,
   include/linux/instrumented.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:183:1: sparse: sparse: got }
   include/linux/instrumented.h:200:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:200:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:72:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: got arch_test_and_set_bit
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:86:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: got arch_test_and_clear_bit
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: got arch_test_and_change_bit
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
--
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:183:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:251:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: got &&
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, ...):
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: got (
   arch/powerpc/include/asm/bitops.h:283:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: got 32
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/fls64.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: got return
   include/asm-generic/bitops/fls64.h:24:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: got fls
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bitops/hweight.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:28:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:28:9: sparse: sparse: got ,
   include/linux/instrumented.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:29:1: sparse: sparse: got }
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got (
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got (
>> include/linux/instrumented.h:42:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:42:9: sparse: sparse: got }
   include/linux/instrumented.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:43:1: sparse: sparse: got }
   include/linux/instrumented.h:56:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:56:9: sparse: sparse: got ,
   include/linux/instrumented.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:57:1: sparse: sparse: got }
   include/linux/instrumented.h:65:21: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:65:21: sparse: sparse: got 0
   include/linux/instrumented.h:65:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:66:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:66:57: sparse: sparse: got }
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in nested declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got {
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got (
   include/linux/instrumented.h:67:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got !
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:67:17: sparse: sparse: got }
   include/linux/instrumented.h:68:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:68:9: sparse: sparse: got }
   include/linux/instrumented.h:83:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:83:9: sparse: sparse: got ,
   include/linux/instrumented.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:85:1: sparse: sparse: got }
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got (
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got (
   include/linux/instrumented.h:98:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:98:9: sparse: sparse: got }
   include/linux/instrumented.h:100:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:100:1: sparse: sparse: got }
   include/linux/instrumented.h:113:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:113:9: sparse: sparse: got ,
   include/linux/instrumented.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:115:1: sparse: sparse: got }
   include/linux/instrumented.h:130:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:130:9: sparse: sparse: got ,
   include/linux/instrumented.h:131:39: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:131:39: sparse: sparse: got ,
   include/linux/instrumented.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:132:1: sparse: sparse: got }
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got (
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got (
   include/linux/instrumented.h:147:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:147:9: sparse: sparse: got }
   include/linux/instrumented.h:148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:148:1: sparse: sparse: got }
   include/linux/instrumented.h:165:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:165:1: sparse: sparse: got }
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got (
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got (
   include/linux/instrumented.h:181:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:181:9: sparse: sparse: got }
   include/linux/instrumented.h:182:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:182:9: sparse: sparse: got ,
   include/linux/instrumented.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:183:1: sparse: sparse: got }
   include/linux/instrumented.h:200:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:200:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:72:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: got arch_test_and_set_bit
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:86:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: got arch_test_and_clear_bit
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: got arch_test_and_change_bit
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
--
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:183:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:251:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: got &&
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, ...):
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: got (
   arch/powerpc/include/asm/bitops.h:283:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: got 32
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/fls64.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: got return
   include/asm-generic/bitops/fls64.h:24:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: got fls
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bitops/hweight.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:28:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:28:9: sparse: sparse: got ,
   include/linux/instrumented.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:29:1: sparse: sparse: got }
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got (
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got (
>> include/linux/instrumented.h:42:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:42:9: sparse: sparse: got }
   include/linux/instrumented.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:43:1: sparse: sparse: got }
   include/linux/instrumented.h:56:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:56:9: sparse: sparse: got ,
   include/linux/instrumented.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:57:1: sparse: sparse: got }
   include/linux/instrumented.h:65:21: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:65:21: sparse: sparse: got 0
   include/linux/instrumented.h:65:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:66:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:66:57: sparse: sparse: got }
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in nested declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got {
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got (
   include/linux/instrumented.h:67:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got !
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:67:17: sparse: sparse: got }
   include/linux/instrumented.h:68:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:68:9: sparse: sparse: got }
   include/linux/instrumented.h:83:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:83:9: sparse: sparse: got ,
   include/linux/instrumented.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:85:1: sparse: sparse: got }
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got (
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got (
   include/linux/instrumented.h:98:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:98:9: sparse: sparse: got }
   include/linux/instrumented.h:100:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:100:1: sparse: sparse: got }
   include/linux/instrumented.h:113:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:113:9: sparse: sparse: got ,
   include/linux/instrumented.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:115:1: sparse: sparse: got }
   include/linux/instrumented.h:130:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:130:9: sparse: sparse: got ,
   include/linux/instrumented.h:131:39: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:131:39: sparse: sparse: got ,
   include/linux/instrumented.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:132:1: sparse: sparse: got }
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got (
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got (
   include/linux/instrumented.h:147:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:147:9: sparse: sparse: got }
   include/linux/instrumented.h:148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:148:1: sparse: sparse: got }
   include/linux/instrumented.h:165:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:165:1: sparse: sparse: got }
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got (
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got (
   include/linux/instrumented.h:181:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:181:9: sparse: sparse: got }
   include/linux/instrumented.h:182:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:182:9: sparse: sparse: got ,
   include/linux/instrumented.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:183:1: sparse: sparse: got }
   include/linux/instrumented.h:200:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:200:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:72:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: got arch_test_and_set_bit
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:86:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: got arch_test_and_clear_bit
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: got arch_test_and_change_bit
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
--
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:183:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:251:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: got &&
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, ...):
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: got (
   arch/powerpc/include/asm/bitops.h:283:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: got 32
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/fls64.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: got return
   include/asm-generic/bitops/fls64.h:24:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: got fls
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bitops/hweight.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:28:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:28:9: sparse: sparse: got ,
   include/linux/instrumented.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:29:1: sparse: sparse: got }
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got (
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got (
>> include/linux/instrumented.h:42:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:42:9: sparse: sparse: got }
   include/linux/instrumented.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:43:1: sparse: sparse: got }
   include/linux/instrumented.h:56:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:56:9: sparse: sparse: got ,
   include/linux/instrumented.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:57:1: sparse: sparse: got }
   include/linux/instrumented.h:65:21: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:65:21: sparse: sparse: got 0
   include/linux/instrumented.h:65:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:66:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:66:57: sparse: sparse: got }
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in nested declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got {
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got (
   include/linux/instrumented.h:67:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got !
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:67:17: sparse: sparse: got }
   include/linux/instrumented.h:68:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:68:9: sparse: sparse: got }
   include/linux/instrumented.h:83:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:83:9: sparse: sparse: got ,
   include/linux/instrumented.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:85:1: sparse: sparse: got }
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got (
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got (
   include/linux/instrumented.h:98:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:98:9: sparse: sparse: got }
   include/linux/instrumented.h:100:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:100:1: sparse: sparse: got }
   include/linux/instrumented.h:113:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:113:9: sparse: sparse: got ,
   include/linux/instrumented.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:115:1: sparse: sparse: got }
   include/linux/instrumented.h:130:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:130:9: sparse: sparse: got ,
   include/linux/instrumented.h:131:39: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:131:39: sparse: sparse: got ,
   include/linux/instrumented.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:132:1: sparse: sparse: got }
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got (
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got (
   include/linux/instrumented.h:147:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:147:9: sparse: sparse: got }
   include/linux/instrumented.h:148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:148:1: sparse: sparse: got }
   include/linux/instrumented.h:165:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:165:1: sparse: sparse: got }
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got (
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got (
   include/linux/instrumented.h:181:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:181:9: sparse: sparse: got }
   include/linux/instrumented.h:182:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:182:9: sparse: sparse: got ,
   include/linux/instrumented.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:183:1: sparse: sparse: got }
   include/linux/instrumented.h:200:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:200:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:72:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: got arch_test_and_set_bit
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:86:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: got arch_test_and_clear_bit
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: got arch_test_and_change_bit
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):

vim +/typeof +42 include/linux/instrumented.h

36e4d4dd4fc4f1d Marco Elver  2020-01-21  16  
36e4d4dd4fc4f1d Marco Elver  2020-01-21  17  /**
36e4d4dd4fc4f1d Marco Elver  2020-01-21  18   * instrument_read - instrument regular read access
d70e2ecbc726a0e Randy Dunlap 2023-02-26  19   * @v: address of access
d70e2ecbc726a0e Randy Dunlap 2023-02-26  20   * @size: size of access
36e4d4dd4fc4f1d Marco Elver  2020-01-21  21   *
36e4d4dd4fc4f1d Marco Elver  2020-01-21  22   * Instrument a regular read access. The instrumentation should be inserted
36e4d4dd4fc4f1d Marco Elver  2020-01-21  23   * before the actual read happens.
36e4d4dd4fc4f1d Marco Elver  2020-01-21  24   */
36e4d4dd4fc4f1d Marco Elver  2020-01-21  25  static __always_inline void instrument_read(const volatile void *v, size_t size)
36e4d4dd4fc4f1d Marco Elver  2020-01-21  26  {
36e4d4dd4fc4f1d Marco Elver  2020-01-21  27  	kasan_check_read(v, size);
36e4d4dd4fc4f1d Marco Elver  2020-01-21 @28  	kcsan_check_read(v, size);
36e4d4dd4fc4f1d Marco Elver  2020-01-21  29  }
36e4d4dd4fc4f1d Marco Elver  2020-01-21  30  
36e4d4dd4fc4f1d Marco Elver  2020-01-21  31  /**
36e4d4dd4fc4f1d Marco Elver  2020-01-21  32   * instrument_write - instrument regular write access
d70e2ecbc726a0e Randy Dunlap 2023-02-26  33   * @v: address of access
d70e2ecbc726a0e Randy Dunlap 2023-02-26  34   * @size: size of access
36e4d4dd4fc4f1d Marco Elver  2020-01-21  35   *
36e4d4dd4fc4f1d Marco Elver  2020-01-21  36   * Instrument a regular write access. The instrumentation should be inserted
36e4d4dd4fc4f1d Marco Elver  2020-01-21  37   * before the actual write happens.
36e4d4dd4fc4f1d Marco Elver  2020-01-21  38   */
36e4d4dd4fc4f1d Marco Elver  2020-01-21  39  static __always_inline void instrument_write(const volatile void *v, size_t size)
36e4d4dd4fc4f1d Marco Elver  2020-01-21  40  {
36e4d4dd4fc4f1d Marco Elver  2020-01-21  41  	kasan_check_write(v, size);
36e4d4dd4fc4f1d Marco Elver  2020-01-21 @42  	kcsan_check_write(v, size);
36e4d4dd4fc4f1d Marco Elver  2020-01-21  43  }
36e4d4dd4fc4f1d Marco Elver  2020-01-21  44  

:::::: The code at line 42 was first introduced by commit
:::::: 36e4d4dd4fc4f1d99e7966a460a2b12ce438abc2 include/linux: Add instrumented.h infrastructure

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
