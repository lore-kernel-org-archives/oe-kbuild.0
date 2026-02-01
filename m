Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79D7319859
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Feb 2026 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769933450; cv=none; b=hF38qzUNSSLCrKrZaItnYTJJPg3ut72fzxFi525j9zsmw/bp6viJXoyHeUZX2akhzIg6ay/WiYsbgp5KDv2Gmr5YMlUpScQ8sMgEhMAjx/pzdkAgwpaxow1dOHNyaArh/ua5YunkE82Tm6YWObVLDctsyGwDDeNVqpEHMw1INU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769933450; c=relaxed/simple;
	bh=DnPd+P9lNvHQA1c76mK+W/ext+vtQnviAgkE/U4/nGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bQ4IE3+O1LAHqAno5+Bh85gD5qlR4+NapJNJcINqNpfRqo4IhfFcqvRp2Knyfh/cspm1WvDSxwyPsOd89HmvQmEiToj3YBn0F8jq4cdRJpK1iOZGSprGIZdfVirRMbIe/hTDDTOS1QiibrshOYrGlY25M8DI6PbKp/BjtuTMhRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kL2J/EQ1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kL2J/EQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769933447; x=1801469447;
  h=date:from:to:cc:subject:message-id;
  bh=DnPd+P9lNvHQA1c76mK+W/ext+vtQnviAgkE/U4/nGw=;
  b=kL2J/EQ15wI/bU8hKKQDO90blP2x2avO0o/xBRQhykWl1HopqO0O4Jnj
   REiV93iAGiPf5pXTYGeQKkjc+3Nsm50BdWszGkD6eTbgJ2N0lLaBqMVT8
   ts7hkRIuMQQTH5V/rg2tlQSqNIDkx3yYI+Yo6iH+ykDQ1XMKhVBnl6Nev
   oCIivY+jMjeA/3H5rsRiOvb79TbNQEIGca2LwHwuAUOxZTiUMES4PFKkb
   U09YWF6nFppA6zvpkskw/nqBaaN1IMfSAQPPTLWHUMxdCQiVP5Zx2zviJ
   17pZDPkTs8GFPs8rjtC7jBqCUp4/qqFBHUhyjylDDadgdqLibPyiMfotv
   w==;
X-CSE-ConnectionGUID: yXs0mxPGRQuUO9CY70uHPQ==
X-CSE-MsgGUID: Zb1ib/CiS9KUnGTFMpty0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71105969"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="71105969"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 00:10:46 -0800
X-CSE-ConnectionGUID: AfXS5v9FSNe/BwUt7qnh1g==
X-CSE-MsgGUID: OsR2qnx4QTmi4G0pPguYOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="209461403"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Feb 2026 00:10:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmSXa-00000000eec-1yH1;
	Sun, 01 Feb 2026 08:10:42 +0000
Date: Sun, 01 Feb 2026 16:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/mm/init.c:356:39: sparse: sparse: unsigned value
 that used to be signed checked against zero?
Message-ID: <202602011613.8JjeZin1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/riscv/mm/init.c:356:39: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Samuel Holland <samuel.holland@sifive.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   162b42445b585cd89f45475848845db353539605
commit: 51b766c79a3d741fb97419c3da1c58fce5e66f0e riscv: Support CONFIG_RELOCATABLE on NOMMU
date:   10 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-r132-20260201 (https://download.01.org/0day-ci/archive/20260201/202602011613.8JjeZin1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602011613.8JjeZin1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602011613.8JjeZin1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/mm/init.c:356:39: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/riscv/mm/init.c:345:45: sparse: signed value source

vim +356 arch/riscv/mm/init.c

51b766c79a3d74 Samuel Holland 2024-10-26  328  
51b766c79a3d74 Samuel Holland 2024-10-26  329  static void __init relocate_kernel(void)
51b766c79a3d74 Samuel Holland 2024-10-26  330  {
51b766c79a3d74 Samuel Holland 2024-10-26  331  	Elf64_Rela *rela = (Elf64_Rela *)&__rela_dyn_start;
51b766c79a3d74 Samuel Holland 2024-10-26  332  	/*
51b766c79a3d74 Samuel Holland 2024-10-26  333  	 * This holds the offset between the linked virtual address and the
51b766c79a3d74 Samuel Holland 2024-10-26  334  	 * relocated virtual address.
51b766c79a3d74 Samuel Holland 2024-10-26  335  	 */
51b766c79a3d74 Samuel Holland 2024-10-26  336  	uintptr_t reloc_offset = kernel_map.virt_addr - KERNEL_LINK_ADDR;
51b766c79a3d74 Samuel Holland 2024-10-26  337  	/*
51b766c79a3d74 Samuel Holland 2024-10-26  338  	 * This holds the offset between kernel linked virtual address and
51b766c79a3d74 Samuel Holland 2024-10-26  339  	 * physical address.
51b766c79a3d74 Samuel Holland 2024-10-26  340  	 */
51b766c79a3d74 Samuel Holland 2024-10-26  341  	uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR - kernel_map.phys_addr;
51b766c79a3d74 Samuel Holland 2024-10-26  342  
51b766c79a3d74 Samuel Holland 2024-10-26  343  	for ( ; rela < (Elf64_Rela *)&__rela_dyn_end; rela++) {
51b766c79a3d74 Samuel Holland 2024-10-26  344  		Elf64_Addr addr = (rela->r_offset - va_kernel_link_pa_offset);
51b766c79a3d74 Samuel Holland 2024-10-26  345  		Elf64_Addr relocated_addr = rela->r_addend;
51b766c79a3d74 Samuel Holland 2024-10-26  346  
51b766c79a3d74 Samuel Holland 2024-10-26  347  		if (rela->r_info != R_RISCV_RELATIVE)
51b766c79a3d74 Samuel Holland 2024-10-26  348  			continue;
51b766c79a3d74 Samuel Holland 2024-10-26  349  
51b766c79a3d74 Samuel Holland 2024-10-26  350  		/*
51b766c79a3d74 Samuel Holland 2024-10-26  351  		 * Make sure to not relocate vdso symbols like rt_sigreturn
51b766c79a3d74 Samuel Holland 2024-10-26  352  		 * which are linked from the address 0 in vmlinux since
51b766c79a3d74 Samuel Holland 2024-10-26  353  		 * vdso symbol addresses are actually used as an offset from
51b766c79a3d74 Samuel Holland 2024-10-26  354  		 * mm->context.vdso in VDSO_OFFSET macro.
51b766c79a3d74 Samuel Holland 2024-10-26  355  		 */
51b766c79a3d74 Samuel Holland 2024-10-26 @356  		if (relocated_addr >= KERNEL_LINK_ADDR)
51b766c79a3d74 Samuel Holland 2024-10-26  357  			relocated_addr += reloc_offset;
51b766c79a3d74 Samuel Holland 2024-10-26  358  
51b766c79a3d74 Samuel Holland 2024-10-26  359  		*(Elf64_Addr *)addr = relocated_addr;
51b766c79a3d74 Samuel Holland 2024-10-26  360  	}
51b766c79a3d74 Samuel Holland 2024-10-26  361  }
51b766c79a3d74 Samuel Holland 2024-10-26  362  #endif /* CONFIG_RELOCATABLE */
51b766c79a3d74 Samuel Holland 2024-10-26  363  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
