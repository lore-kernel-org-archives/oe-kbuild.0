Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1811F2FDC30
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 20:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768335645; cv=none; b=HvBNWDmXJ6yAAVCO3quokFK7IB6YPNOSb1B/9Hi76OuYgHkFqgQGOCCP/28mwbr6Fm5Yn7FKht3JTuXYV70HYo9/pRWqMRwAvCsPJNwXofYYAm6i9T7rNsymAQ5KXqtAkf1rtT/v6U4BZ8copI3Jg/asBkiFf+EZ2HyGrNBezwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768335645; c=relaxed/simple;
	bh=U3tEsTZY6UBb72rGwI1ZVcr4dliPgiksIlOloElGUmQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZAToScOf69Q5LZy7KEq5JwWtOAYnx1lwr6Hug2X5UTO+Fj/kO6iVjr/5jCB7wK6+OuniFZvqynqn9vT7VFFMK8A2BcL4UAfx8a2oOIwoEruuxgedSfAlY5kvkyi6/a+j1tUhOddLUtrc74pymdaCvvnuOMbCB+Me2yiN3TvHbXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JyQpHHR9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JyQpHHR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768335644; x=1799871644;
  h=date:from:to:cc:subject:message-id;
  bh=U3tEsTZY6UBb72rGwI1ZVcr4dliPgiksIlOloElGUmQ=;
  b=JyQpHHR9w9lWyiVIc4cc0I8ulircMisk4vmGbAtU3SVSFg8pX2VPTOmI
   YXbqBO1EcCy4US1cgKq4lvAOYW+yT2XAWM94zf2WKwumQM6CmYITuRabk
   Fx3vFmn4LhnsOuTQeXA2O6z6YKDYNRto1xNreGtKo1/H8pv/7mwJi1uvc
   ZkgWv6wyKKQYSzrMOibPgXQNadt3kdq0DiLVK7gg19+AvBxrmylqKfR/K
   +TAh/Mf+8qEKjdHgOyB1ngJN8jgZWxcYtiKLRWtwzjP8ZQ5tRxAF1xo1y
   IMjAxcWIvYjcUwooWd8roWSLEZzfUHVQ1Toslopkbu9ddpXYvsnPfx2UX
   g==;
X-CSE-ConnectionGUID: qvxzpua0S467r2rkiikJZA==
X-CSE-MsgGUID: PY1XfNWdRiOb9isnP2j/cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69791553"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69791553"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:20:44 -0800
X-CSE-ConnectionGUID: VRpupWm0RkaZIbiFOsHlfw==
X-CSE-MsgGUID: Gg1bCWB3QC+aYG6d88rfXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209009651"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Jan 2026 12:20:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfksa-00000000FKk-0lot;
	Tue, 13 Jan 2026 20:20:40 +0000
Date: Wed, 14 Jan 2026 04:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used
 against local symbol; recompile with -fPIC
Message-ID: <202601140453.Jf8Sl7jZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 84ffc79bfbf70c779e60218563f2f3ad45288671 kbuild: Add '-fno-builtin-wcslen'
date:   9 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 9 months ago
config: powerpc-randconfig-r072-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140453.Jf8Sl7jZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140453.Jf8Sl7jZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601140453.Jf8Sl7jZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/head_85xx.o)
   >>> referenced by head_85xx.S:168 (arch/powerpc/kernel/head_85xx.S:168)
   >>>               arch/powerpc/kernel/head_85xx.o:(.head.text+0x30a) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/head_85xx.o)
   >>> referenced by head_85xx.S:169 (arch/powerpc/kernel/head_85xx.S:169)
   >>>               arch/powerpc/kernel/head_85xx.o:(.head.text+0x316) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/head_85xx.o)
   >>> referenced by head_85xx.S:178 (arch/powerpc/kernel/head_85xx.S:178)
   >>>               arch/powerpc/kernel/head_85xx.o:(.head.text+0x382) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/head_85xx.o)
   >>> referenced by head_85xx.S:179 (arch/powerpc/kernel/head_85xx.S:179)
   >>>               arch/powerpc/kernel/head_85xx.o:(.head.text+0x38e) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/head_85xx.o)
   >>> referenced by head_85xx.S:180 (arch/powerpc/kernel/head_85xx.S:180)
   >>>               arch/powerpc/kernel/head_85xx.o:(.head.text+0x39a) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/head_85xx.o)
   >>> referenced by head_85xx.S:181 (arch/powerpc/kernel/head_85xx.S:181)
   >>>               arch/powerpc/kernel/head_85xx.o:(.head.text+0x3a6) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/head_85xx.o)
   >>> referenced by head_85xx.S:182 (arch/powerpc/kernel/head_85xx.S:182)
   >>>               arch/powerpc/kernel/head_85xx.o:(.head.text+0x3b2) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/head_85xx.o)
   >>> referenced by head_85xx.S:183 (arch/powerpc/kernel/head_85xx.S:183)
   >>>               arch/powerpc/kernel/head_85xx.o:(.head.text+0x3be) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/head_85xx.o)
   >>> referenced by head_85xx.S:170 (arch/powerpc/kernel/head_85xx.S:170)
   >>>               arch/powerpc/kernel/head_85xx.o:(.head.text+0x322) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/head_85xx.o)
   >>> referenced by head_85xx.S:171 (arch/powerpc/kernel/head_85xx.S:171)
   >>>               arch/powerpc/kernel/head_85xx.o:(.head.text+0x32e) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/head_85xx.o)
   >>> referenced by head_85xx.S:172 (arch/powerpc/kernel/head_85xx.S:172)
   >>>               arch/powerpc/kernel/head_85xx.o:(.head.text+0x33a) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
