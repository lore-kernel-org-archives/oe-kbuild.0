Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC912210F3
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 11:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZjAq7SO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701429147; x=1732965147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z7ZGrXg3nnwbAFtm0L0Pxj8+9QmqDxsaVCAXsNRh938=;
  b=dZjAq7SOE7uZYLu34VqKjVCec/abC49vp3EmQZwODn/aNQv/Y2dtU3Cu
   oOQa9QBGiNY8CPL5ka3253hnWpf6oHAzdvT7dXYii3BC9eRy5PtvOvF8y
   QRv3Jz59gCcxnW2CM6iPhIq/53VnHnkaXgAGCTiX2yllo1g6lGaxBxkHz
   GQim4jmAyrFmgpbDGCaROkSz1gRdRvxkfJerIiT09Fls4fQ7hx358yJhx
   /1J9EB9n/sGi0CwegiS9UcXq6NZOhVi2bCf9ap3ybDo7PrlA3f3HJgTz4
   bypipT1ZIJT7DeO1D7PUAWo3kzkCiVCD+rbEnyZtTKdFH0hn4unlaTY5F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="485416"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="485416"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 03:12:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="943057781"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943057781"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 03:12:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r91RV-0003Ye-1J;
	Fri, 01 Dec 2023 11:12:21 +0000
Date: Fri, 1 Dec 2023 19:12:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/include/asm/lbt.h:24:17: sparse: sparse: cast from
 unknown type
Message-ID: <202312011939.MukEV0xT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/loongarch/include/asm/lbt.h:24:17: sparse: sparse: cast from unknown type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qi Hu <huqi@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: bd3c5798484aa9a08302a844d7a75a2ee3b53d05 LoongArch: Add Loongson Binary Translation (LBT) extension support
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r034-20230511 (https://download.01.org/0day-ci/archive/20231201/202312011939.MukEV0xT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312011939.MukEV0xT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312011939.MukEV0xT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/kernel/traps.c:441:6: sparse: sparse: symbol 'force_fcsr_sig' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:536:25: sparse: sparse: symbol 'do_ale' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:597:25: sparse: sparse: symbol 'do_bce' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:773:30: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/kernel/traps.c:773:30: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:783:25: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/kernel/traps.c:783:25: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:784:25: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/kernel/traps.c:784:25: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:800:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/kernel/traps.c:800:33: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:927:25: sparse: sparse: symbol 'do_lsx' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:949:25: sparse: sparse: symbol 'do_lasx' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:984:25: sparse: sparse: symbol 'do_lbt' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:1038:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/kernel/traps.c:1038:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:1039:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kernel/traps.c:1039:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:1043:25: sparse: sparse: symbol 'handle_loongarch_irq' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:1096:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/traps.c:1096:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:1097:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/traps.c:1097:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:1098:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/traps.c:1098:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, ...):
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:25: sparse: sparse: undefined identifier '__builtin_loongarch_cpucfg'
   ../lib/gcc/loongarch64-linux/12.3.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1122:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1122:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1122:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1122:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1242:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1242:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1242:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1242:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1242:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1242:1: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c: note: in included file:
   arch/loongarch/include/asm/fpu.h:63:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:63:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1242:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1242:1: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c: note: in included file:
   arch/loongarch/include/asm/fpu.h:63:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:72:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:72:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1242:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1242:1: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c: note: in included file:
   arch/loongarch/include/asm/fpu.h:63:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:72:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:81:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:81:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:72:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:81:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:81:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c: note: in included file:
   arch/loongarch/include/asm/lbt.h:24:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
>> arch/loongarch/include/asm/lbt.h:24:17: sparse: sparse: cast from unknown type
>> arch/loongarch/include/asm/lbt.h:24:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1122:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/traps.c:432:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
   arch/loongarch/kernel/traps.c:432:9: sparse: sparse: cast from unknown type

vim +24 arch/loongarch/include/asm/lbt.h

bd3c5798484aa9 Qi Hu 2023-09-06  18  
bd3c5798484aa9 Qi Hu 2023-09-06  19  static inline int is_lbt_enabled(void)
bd3c5798484aa9 Qi Hu 2023-09-06  20  {
bd3c5798484aa9 Qi Hu 2023-09-06  21  	if (!cpu_has_lbt)
bd3c5798484aa9 Qi Hu 2023-09-06  22  		return 0;
bd3c5798484aa9 Qi Hu 2023-09-06  23  
bd3c5798484aa9 Qi Hu 2023-09-06 @24  	return (csr_read32(LOONGARCH_CSR_EUEN) & CSR_EUEN_LBTEN) ?
bd3c5798484aa9 Qi Hu 2023-09-06  25  		1 : 0;
bd3c5798484aa9 Qi Hu 2023-09-06  26  }
bd3c5798484aa9 Qi Hu 2023-09-06  27  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
