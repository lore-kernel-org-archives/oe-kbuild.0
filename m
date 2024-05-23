Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E8917F6
	for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 05:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716441060; cv=none; b=sA20syx+O8/dJDuw6AvjL7nxCrRfouG5qgG5NHAVnodphj4ieGBFRBYnZiGuEfF/i4yQLEu3XdfAFLez2ybChGlW0E4HXBgXRZ4ltVwlvQ+m+1kCZbuJ159G+JCp9n+CTikYO6eodYNMoQqDGiBl4zxF2ygmyM04VtEXQh/6/SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716441060; c=relaxed/simple;
	bh=6LGMjuziHdeynZjOuXbEWGyA+syu81jmkw6sYjW6waA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OneFQlJFyppweoIh6JqM6vV7R1mRYS2skL6ON59riflKC+0uXabYSYTeX27oK3vV82c9GlSO4f7+JJ3cO8mPeWiZsjGw0r2vJbNE7zgwoaxO3BKcnY6J6HHfN7tcK0mHAYGSckUcMbi3eJhtWx+K0/aQvyf6Z1nw7OCNEHDnNsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bpwud/Zr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bpwud/Zr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716441058; x=1747977058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6LGMjuziHdeynZjOuXbEWGyA+syu81jmkw6sYjW6waA=;
  b=Bpwud/ZrpmVynaUHPZK8483LPzJMqVatn/804luspSSAawr04VZf+FLr
   qS6jvBrg4HeDITWvJiKCLr9xZk5bn3CIaVaTzwoP0+GXiwC6ZAZ7WgQ/2
   riOMgPXjcEoqawhhYVYEu2mSGh2gn4PlP+u7DHTRDyNASyYDE13udeuQ0
   Io/BKnIhcGGZ6wkK3TyYg2lDbPQwBHxK4pgUCZqmRtzLq359urpn+diG+
   KviUxw2BxeidKiJx/DFe38Yww/jMGf3vYCowYgWTHLIuEPaYcbMiGjUrH
   R+GvG+pJX0PuZIZIpPQNoki5h5+NmNM6PJiSqUrTykOAXEfZpDPbCyJDI
   A==;
X-CSE-ConnectionGUID: fbeXKxSFSyOiT7L967mVHg==
X-CSE-MsgGUID: 9Gn+79U9S7ifihgY4JBgkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="38111186"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="38111186"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 22:10:58 -0700
X-CSE-ConnectionGUID: ZQ/3gdaISTCY/xshaSdgyQ==
X-CSE-MsgGUID: 9BlFug0gQdeo9wgIXP3W5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="64761392"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 May 2024 22:10:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA0j8-0002U9-2H;
	Thu, 23 May 2024 05:10:54 +0000
Date: Thu, 23 May 2024 13:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/3] perf annotate: LLVM-based disassembler
Message-ID: <202405231219.UCBIVGmq-lkp@intel.com>
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
In-Reply-To: <20240520083048.322863-3-sesse@google.com>
References: <20240520083048.322863-3-sesse@google.com>
TO: "Steinar H. Gunderson" <sesse@google.com>
TO: acme@kernel.org
CC: linux-perf-users@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: irogers@google.com
CC: "Steinar H. Gunderson" <sesse@google.com>

Hi Steinar,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on perf-tools/perf-tools linus/master next-20240523]
[cannot apply to tip/perf/core acme/perf/core v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steinar-H-Gunderson/perf-annotate-split-out-read_symbol/20240520-163505
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240520083048.322863-3-sesse%40google.com
patch subject: [PATCH v4 3/3] perf annotate: LLVM-based disassembler
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231219.UCBIVGmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405231219.UCBIVGmq-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   clang: warning: -lLLVMFrontendOffloading: 'linker' input unused [-Wunused-command-line-argument]
   clang: warning: -lLLVMHipStdPar: 'linker' input unused [-Wunused-command-line-argument]
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
>> util/disasm.c:1615:10: fatal error: 'llvm-c/Disassembler.h' file not found
    1615 | #include <llvm-c/Disassembler.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/util/disasm.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:727: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2


vim +1615 tools/perf/util/disasm.c

6d17edc113de1e Namhyung Kim         2024-03-29  1613  
f502eefcc311da Steinar H. Gunderson 2024-05-20  1614  #ifdef HAVE_LLVM_SUPPORT
f502eefcc311da Steinar H. Gunderson 2024-05-20 @1615  #include <llvm-c/Disassembler.h>
f502eefcc311da Steinar H. Gunderson 2024-05-20  1616  #include <llvm-c/Target.h>
f502eefcc311da Steinar H. Gunderson 2024-05-20  1617  #include "util/llvm-c-helpers.h"
f502eefcc311da Steinar H. Gunderson 2024-05-20  1618  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
