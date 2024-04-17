Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603AB4084D
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Apr 2024 04:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713327626; cv=none; b=iBbxdhTrbxM8NyQ7r2mf6Fp8Vv3SqEDUUAjPmN0zjnlAtmWN9w4BRGrijTVuLN4ApRndcBQ7b5NKwBKwWt1NYNEaOKP5P2pJgEikUZlEE4xCZc0OOkG521YnKwvPOZmToiV7KziwKOImHS79b5SdPMQ0NPrg3Jb1i4i0RJ+TcQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713327626; c=relaxed/simple;
	bh=ZK7usxoCYjypDM5xCrOA3WnajKvycKLe19HwvLZejvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BKNviAskIfkhzrBKvBmBrSGhfjrhyrCcEdZLCKfUG/wMC6hxRxe9ZFFwlgmOQjDOlNPCaERgj9dX7bu9p4dqSvsL6Ep5x5qlJVfy6jfXSyGLZXTWM4hTLvV/Xjp2eXFqpT9Qvw2Q55P5/VlfQfPYE9brTresIubziTJC/z6ebvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/QKBkg/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/QKBkg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713327624; x=1744863624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZK7usxoCYjypDM5xCrOA3WnajKvycKLe19HwvLZejvA=;
  b=E/QKBkg/T8ifmIWTHZYeJaoxQfTneL00MjVlJaKRBaWOf4593en8iV62
   6Dy5Wv8k/UBomc/rm5OLghmUB7fRz0+w5xHB5DAlm48g/X50PVKKJLlM8
   6rLbqTkC2oG7DKlwKclU0305JJsj3+qiSJQQ1eLCm8HB1pX30bc/5Am4O
   xdPBJkUCMoVmHhJ40R3p3ugCZI5Ls2sMiCvNotyvMJnqdWyajF2CPTu+n
   D2c5oLNUm5V2EmSPWxT9t0HP+nLM09zpGj6PB1+fwfc7AJ7uHEPhA1QFp
   M3Am0dkSgLBecQIhXzLhIm5xGyE0hoa9XZw+b3UKBY+ddqxSCJKzqXscm
   A==;
X-CSE-ConnectionGUID: qD/Nr072RpecP/v8D0DRlA==
X-CSE-MsgGUID: fZtxzGbFT620eC6ooURm7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8727246"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8727246"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 21:20:23 -0700
X-CSE-ConnectionGUID: 2XLqPTNcTWibi9uBX38p2A==
X-CSE-MsgGUID: eYNA5kXCQkK46uCXV4Kdtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="59912384"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Apr 2024 21:20:22 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwwmS-00067g-0S;
	Wed, 17 Apr 2024 04:20:20 +0000
Date: Wed, 17 Apr 2024 12:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V2 5/8] tools: Delete strstarts() and replace its usage
 with str_has_prefix()
Message-ID: <202404171224.IlskYwJw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240408062230.1949882-6-ChaitanyaS.Prakash@arm.com>
References: <20240408062230.1949882-6-ChaitanyaS.Prakash@arm.com>
TO: Chaitanya S Prakash <ChaitanyaS.Prakash@arm.com>
TO: linux-perf-users@vger.kernel.org
CC: anshuman.khandual@arm.com
CC: james.clark@arm.com
CC: Chaitanya S Prakash <chaitanyas.prakash@arm.com>

Hi Chaitanya,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/perf/core]
[also build test ERROR on perf-tools/perf-tools linus/master v6.9-rc4 next-20240416]
[cannot apply to perf-tools-next/perf-tools-next acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaitanya-S-Prakash/tools-lib-adopt-str_has_suffix-from-bpftool-gen-c/20240408-182552
base:   tip/perf/core
patch link:    https://lore.kernel.org/r/20240408062230.1949882-6-ChaitanyaS.Prakash%40arm.com
patch subject: [PATCH V2 5/8] tools: Delete strstarts() and replace its usage with str_has_prefix()
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171224.IlskYwJw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404171224.IlskYwJw-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: -lLLVMMSP430Disassembler: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMSP430AsmParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMSP430CodeGen: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMSP430Desc: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMSP430Info: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMipsDisassembler: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMipsAsmParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMipsCodeGen: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMipsDesc: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMipsInfo: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMLoongArchDisassembler: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMLoongArchAsmParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMLoongArchCodeGen: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMLoongArchDesc: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMLoongArchInfo: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMLanaiDisassembler: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMLanaiCodeGen: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMLanaiAsmParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMLanaiDesc: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMLanaiInfo: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMHexagonDisassembler: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMHexagonCodeGen: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMHexagonAsmParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMHexagonDesc: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMHexagonInfo: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMBPFDisassembler: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMBPFAsmParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMBPFCodeGen: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMBPFDesc: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMBPFInfo: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAVRDisassembler: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAVRAsmParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAVRCodeGen: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAVRDesc: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAVRInfo: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMARMDisassembler: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMARMAsmParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMARMCodeGen: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMARMDesc: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMARMUtils: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMARMInfo: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAMDGPUTargetMCA: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMCA: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAMDGPUDisassembler: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAMDGPUAsmParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAMDGPUCodeGen: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMPasses: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMIRPrinter: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMCoroutines: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMIRParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMipo: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMInstrumentation: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMVectorize: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMLinker: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMFrontendOpenMP: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAMDGPUDesc: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAMDGPUUtils: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAMDGPUInfo: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAArch64Disassembler: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAArch64AsmParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAArch64CodeGen: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMGlobalISel: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMSelectionDAG: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMCFGuard: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAsmPrinter: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMCodeGen: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMTarget: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMScalarOpts: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMInstCombine: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAggressiveInstCombine: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMObjCARCOpts: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMTransformUtils: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMBitWriter: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAnalysis: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMProfileData: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMSymbolize: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMDebugInfoBTF: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMDebugInfoPDB: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMDebugInfoMSF: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMDebugInfoDWARF: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMObject: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMTextAPI: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMCParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMIRReader: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAsmParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMBitReader: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAArch64Desc: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMCodeGenTypes: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAArch64Utils: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMCore: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMRemarks: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMBitstreamReader: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMAArch64Info: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMCDisassembler: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMMC: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMDebugInfoCodeView: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMBinaryFormat: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMTargetParser: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMSupport: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMDemangle: 'linker' input unused [-Wunused-command-line-argument]
>> ui/browser.c:580:6: error: logical not is only applied to the left hand side of this comparison [-Werror,-Wlogical-not-parentheses]
     580 |         if (!str_has_prefix(var, "colors.") != 0)
         |             ^                               ~~
   ui/browser.c:580:6: note: add parentheses after the '!' to evaluate the comparison first
     580 |         if (!str_has_prefix(var, "colors.") != 0)
         |             ^                                   
         |              (                                  )
   ui/browser.c:580:6: note: add parentheses around left hand side expression to silence this warning
     580 |         if (!str_has_prefix(var, "colors.") != 0)
         |             ^
         |             (                              )
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/ui/browser.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: ui] Error 2
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:706: tools/perf/perf-in.o] Error 2
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
