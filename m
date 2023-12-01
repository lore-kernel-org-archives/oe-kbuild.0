Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF0717CF
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 03:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXi+K7o8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701401381; x=1732937381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gxLe3XEx+qGPI7qmuTfL6sUwtV4zi9fLsx5B5UoylHA=;
  b=MXi+K7o8yhH4SxFvb/E25egkHcLD6XpR0Z+AmerJhBMqNECv1oSzlncu
   IjrZWdQ11CIXjjBhQ204iFBD1+JBrfWeN/iId3D5psdyY4dI8Zhuvi74x
   IERBs/6ENwZAXnLNfgjlbAcgoJbsoWgaagE7HIWpSwRf3ybVDlWqehWik
   OCOE5/mZutysTmL3d77bkyBN2NNZ562S13muZI2VMoNWTvFAYf1IvhcbG
   iyre0OHo6mlXeZyt6+cTM+19Lf3pyewUqbXcdnY0exwpWvSlelGScy7l/
   J1CHF1oUbh1ngFV0yApCbBu/gUCBoVY6sYZnn9/7rgjrjZ0VLhhbYRSrW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393168818"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="393168818"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 19:29:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1016878904"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="1016878904"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2023 19:29:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8uDg-00033g-35;
	Fri, 01 Dec 2023 03:29:36 +0000
Date: Fri, 1 Dec 2023 11:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/include/asm/lbt.h:24:17: sparse: sparse: cast from
 unknown type
Message-ID: <202312011125.Sn6GvO5i-lkp@intel.com>
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
head:   2594faafeee2f4406ff82790604e4e3f55037d60
commit: bd3c5798484aa9a08302a844d7a75a2ee3b53d05 LoongArch: Add Loongson Binary Translation (LBT) extension support
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r025-20230627 (https://download.01.org/0day-ci/archive/20231201/202312011125.Sn6GvO5i-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312011125.Sn6GvO5i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312011125.Sn6GvO5i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/kernel/traps.c:441:6: sparse: sparse: symbol 'force_fcsr_sig' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:536:25: sparse: sparse: symbol 'do_ale' was not declared. Should it be static?
   arch/loongarch/kernel/traps.c:597:25: sparse: sparse: symbol 'do_bce' was not declared. Should it be static?
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
   arch/loongarch/kernel/traps.c: note: in included file (through include/linux/mmzone.h, arch/loongarch/include/asm/pgtable.h, arch/loongarch/include/asm/uaccess.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
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
