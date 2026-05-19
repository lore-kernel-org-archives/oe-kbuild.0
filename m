Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283E64DC540
	for <oe-kbuild@lists.linux.dev>; Tue, 19 May 2026 12:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779194721; cv=none; b=BI/Vz1D2PD6rNjgDl5P+WU3XOs6rxjpMxlHwRaG5Hzm8Mrwf4CoTGMtvV0lP7Xxzo1oSf7rMtYyUeSmt0tQxYiNLSn6ErxW6+Saz/4uMagFYu8XevwAy6tttYJOCJpnFMG/ZiCxR5iqOwraYGVCgxITUPsXHwCxB+RNQB+UyFsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779194721; c=relaxed/simple;
	bh=+M7/wBjeRcK1rrzG5TgFJ/EBpW6cY0y1phHOgLnc/78=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sOG6qaascKwklbIyjdLd1rfFhf4DBjUa60flDYZeNlgRp7M/vOK5lUB1hYCMNDARKKgR3gO5kc4El/U/xHuUZqWNCGT58sBOAo7veyj1mCUh8X6SVRHxriODtyM53H0PgBaV3IVmg+3NywJhlD2aLoFtWO74fGsizDZyaazsheU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxdVX5Fj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxdVX5Fj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779194718; x=1810730718;
  h=date:from:to:cc:subject:message-id;
  bh=+M7/wBjeRcK1rrzG5TgFJ/EBpW6cY0y1phHOgLnc/78=;
  b=WxdVX5FjMnZVCq8t3GVq5raPhXFNBU8x28QGsy6cWJ2LulymGHU2MGMQ
   hQEHnvoC5C4mM4IFNtvMtsN4IueMz4msWNnsVE5/7ShMarKm4z6dTiTJh
   HJNpytUuy7gzae+ByO6z+URoazeWNi37QAaacQ/PGOFymQbTgKAhLpjav
   zi95wUHElEQrfx7U+lwnORDG4V7pxtoTPvgMsMxJ4mdB+/azRqQzHiqJU
   6RveEbLMG2/zkQholbpSIVU++N5Hpt2smaAhf6UGTUYXSaUSXIv6bOGRC
   zr0txYb90JoAOWJyKToiBfCz/b+/I8G3a6aeUEDbYk0zCcCqQAmyycDAZ
   w==;
X-CSE-ConnectionGUID: kaKlIDOvQGGsBK+HItehoA==
X-CSE-MsgGUID: FMVa9iQOTgOZ8gpG9E+Mvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91464959"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91464959"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:45:18 -0700
X-CSE-ConnectionGUID: DzXfBQw4TpuiTN1XLmWfgg==
X-CSE-MsgGUID: +R4LMaaWSQiAnnOceyng4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235321797"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 19 May 2026 05:45:17 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPJow-00000000ACb-1tqa;
	Tue, 19 May 2026 12:45:14 +0000
Date: Tue, 19 May 2026 14:45:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/x86/processor.h:403:44: error: expected ')' before
 ':' token
Message-ID: <202605191406.4p8wpUwC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yosry Ahmed <yosryahmed@google.com>
CC: 0day robot <lkp@intel.com>

Hi Yosry,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/KVM-selftests-Fix-offsets-in-GPR-switching-for-nSVM/20260519-043429
head:   43584f6a088769edb3f26958a4a4edf0f31addad
commit: 345479cf6d802be542072394909a372d4a8f75a2 KVM: selftests: Move GPR load/save definitions outside of nSVM code
date:   16 hours ago
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260519/202605191406.4p8wpUwC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191406.4p8wpUwC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605191406.4p8wpUwC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/kvm_util.c:10:
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:405:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     405 | DEFINE_ASM_GPR64_OFFSET(rbx);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:406:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     406 | DEFINE_ASM_GPR64_OFFSET(rcx);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:407:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     407 | DEFINE_ASM_GPR64_OFFSET(rdx);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:408:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     408 | DEFINE_ASM_GPR64_OFFSET(rbp);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:409:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     409 | DEFINE_ASM_GPR64_OFFSET(rsi);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:410:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     410 | DEFINE_ASM_GPR64_OFFSET(rdi);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:411:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     411 | DEFINE_ASM_GPR64_OFFSET(r8);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:412:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     412 | DEFINE_ASM_GPR64_OFFSET(r9);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:413:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     413 | DEFINE_ASM_GPR64_OFFSET(r10);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:414:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     414 | DEFINE_ASM_GPR64_OFFSET(r11);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:415:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     415 | DEFINE_ASM_GPR64_OFFSET(r12);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:416:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     416 | DEFINE_ASM_GPR64_OFFSET(r13);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:417:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     417 | DEFINE_ASM_GPR64_OFFSET(r14);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/x86/processor.h:403:44: error: expected ')' before ':' token
     403 |         asm(".equ GPR64_OFF_" #reg ", %c0" : : "i"(offsetof(struct gpr64_regs, reg)))
         |            ~                               ^
   include/x86/processor.h:418:1: note: in expansion of macro 'DEFINE_ASM_GPR64_OFFSET'
     418 | DEFINE_ASM_GPR64_OFFSET(r15);
         | ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
