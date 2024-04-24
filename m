Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8384A11CA9
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Apr 2024 10:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713955033; cv=none; b=h7MqtsBFikQKebSwciM5TlCFtdiLnj1viSqDBA3qpAYK8xaZp6VIihfLEqK8i9/MwIAtVMBe5O7s3SkNrQ8vB/4dvtfunyA1q8uJ3c02vYdqNP0EPtwCEAdNYbeJrBlVZhH46ZzYF4QgxOvtb7XVKSseK6MZgzKBmGMuX3hxkQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713955033; c=relaxed/simple;
	bh=boa1HT+R2J/UcLrfXLWkAuN1ty5XuptWXBseu3mTB1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O9hs5kFs/ejJ8MULq+1z3fTfk2+Eosvl0AK1GSrKhY8IPSc72czPO7F1/GtGVbgzFg9+qT2FsBdgZmhzK3yS2OUEZFMFSMJ6jKw+94FlnMu/JoUYLhvlZ6wztD771xmZv+7vwRsvl1tCnphtsSY+kiCB48LJafbAsTGMhEx0yvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/9CbdL6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/9CbdL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713955031; x=1745491031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=boa1HT+R2J/UcLrfXLWkAuN1ty5XuptWXBseu3mTB1A=;
  b=e/9CbdL6DDcYP6VrOYmjWK3Re7qKPGlTfgTp6dDyLdc2sjv2So6klBM5
   2ixS4WnurhFTn8mh3yc/9xKTdZWda1YUyhHzp2UDdOWiEfrFoLPXk479U
   mIj7WZcPK28DOSrZOYALzfV4xziIniaMPEB5HA2uI01XGwCwKQJtasDK/
   taHfT7WzZzxnJq7+xrWTtwHRyRFGki1HRUIokEZQ4+dkW2t6V7CDq+Fig
   GxwxChf5M8DHfE1lghspBkINx9bQiAR+YQwPSh70XD/GjF+GRaLIprBNm
   XMXrpknzAJwV3zoJjhkm4HiAjpOvhQM35NAbD44FKBAu8PvRkUU8LvkHH
   Q==;
X-CSE-ConnectionGUID: SaMR4SeKR0KrbCSEJKX7Bw==
X-CSE-MsgGUID: ceT6INjWToKZ58P202MWZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27033692"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="27033692"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 03:37:10 -0700
X-CSE-ConnectionGUID: OfuArKYQQMCvaz0AbONPbA==
X-CSE-MsgGUID: umxc3KxDSbaND4/4F0U9PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="29154271"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Apr 2024 03:37:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzZzu-000188-2V;
	Wed, 24 Apr 2024 10:37:06 +0000
Date: Wed, 24 Apr 2024 18:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/6] perf test pmu: Refactor format test and exposed
 test APIs
Message-ID: <202404241805.0QJXFFCB-lkp@intel.com>
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
In-Reply-To: <20240423031719.1941141-4-irogers@google.com>
References: <20240423031719.1941141-4-irogers@google.com>
TO: Ian Rogers <irogers@google.com>
TO: Kan Liang <kan.liang@linux.intel.com>
TO: Ingo Molnar <mingo@redhat.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
TO: Namhyung Kim <namhyung@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Ian Rogers <irogers@google.com>
TO: Adrian Hunter <adrian.hunter@intel.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Randy Dunlap <rdunlap@infradead.org>
TO: Jing Zhang <renyu.zj@linux.alibaba.com>
TO: James Clark <james.clark@arm.com>
TO: Ravi Bangoria <ravi.bangoria@amd.com>
TO: linux-kernel@vger.kernel.org
TO: linux-perf-users@vger.kernel.org

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v6.9-rc5 next-20240423]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-test-pmu-events-Make-it-clearer-that-pmu-events-tests-json-events/20240423-112057
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240423031719.1941141-4-irogers%40google.com
patch subject: [PATCH v2 3/6] perf test pmu: Refactor format test and exposed test APIs
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241805.0QJXFFCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404241805.0QJXFFCB-lkp@intel.com/

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
>> tests/pmu.c:84:2: error: ignoring return value of function declared with 'warn_unused_result' attribute [-Werror,-Wunused-result]
      84 |         write(file, "9999\n", 5);
         |         ^~~~~ ~~~~~~~~~~~~~~~~~
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/tests/pmu.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: tests] Error 2
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:727: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
