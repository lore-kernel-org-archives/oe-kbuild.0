Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463C934EEE1
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 21:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776117040; cv=none; b=EMk6eg/OU9HgVbx4U+0B3HRFsKsv4NBNTKuHQlFcUyVlDcLREDFeqxFP9SeTljuGyYmyfMGZyF5GQJ9I9QPk4QvQcHof6LRmX7MIoczADE2WL8bB5BgwJDYh7hqnm4A821lJHLJlojwCGStrspSj7u8OAPAxcHfq58ipbS0uaa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776117040; c=relaxed/simple;
	bh=Ay+zqeci9z5ezmWcIjuwl3h2ALvYdb2Q2TJblFCfn4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=coA7es7HHT+7RoIOd8bil9Zc5Ps9ObTgC7fmaVKa0NaFgB+YH179MW0XqjGPPKSwjbDHVeXoS8Thbvuo2fAT5CLfbMpLmUXdwb0EFwqgVCZbIjuVEsGaXRzaUNVe9d6BlYz/udlmH3SjRhUj9Y8Yz3vsuzj0H8x8e2DCov2LYUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llYqTq2s; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llYqTq2s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776117040; x=1807653040;
  h=date:from:to:cc:subject:message-id;
  bh=Ay+zqeci9z5ezmWcIjuwl3h2ALvYdb2Q2TJblFCfn4o=;
  b=llYqTq2sogeGj9CmBw4VVQbC4k1TbYRe7IREDk+5+YfY+LSrrhvyAIdN
   1EYQHqLgYiuMT6GcwOZBbVUYYxHZeL+nRQiH5CD0mPfnWQjBUnjURU8tX
   1T0uNMkQRotP1U1mZX2qC2GEN9GIjVUFWkOvn0tx5foShMlyMuz3ZLgf8
   5lg+KYkVsARzBidSzpGROn9CprYasuDa3Y8H8yl671H/SusfTBdps2kVc
   rIyYG9RQ+jhtmFaMVt9GiFlVJXY+YV7fbcfz584WZiJTA73Zw8iE/sJrd
   p4elS9ZpsoDCJ9ZDQXxetYXRUumtj0CDtEeb4EF6VA6hgvcOINOND62mP
   A==;
X-CSE-ConnectionGUID: 7IMSaIJ1Tl2EONTHrc3jrQ==
X-CSE-MsgGUID: gizQCTVpSfi3IJ8dzXgLeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80653180"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="80653180"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 14:50:39 -0700
X-CSE-ConnectionGUID: 6h32JqIBSLqP6P61bsalJA==
X-CSE-MsgGUID: kACW6WeNRka3DkcUL5+o/g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Apr 2026 14:50:38 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCPAx-000000000tA-1eVU;
	Mon, 13 Apr 2026 21:50:35 +0000
Date: Tue, 14 Apr 2026 05:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/mm/init.c:354:39: sparse: sparse: unsigned value
 that used to be signed checked against zero?
Message-ID: <202604140524.UJWCt18n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/riscv/mm/init.c:354:39: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Samuel Holland <samuel.holland@sifive.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f00132132937ca01a99feaf8985109a9087c9ff
commit: ea2bde36a46d5724c1b44d80cc9fafbd73c2ecf9 riscv: Support CONFIG_RELOCATABLE on riscv32
date:   1 year, 1 month ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 1 month ago
config: riscv-randconfig-r113-20260411 (https://download.01.org/0day-ci/archive/20260414/202604140524.UJWCt18n-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140524.UJWCt18n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ea2bde36a46d ("riscv: Support CONFIG_RELOCATABLE on riscv32")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604140524.UJWCt18n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/mm/init.c:354:39: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/riscv/mm/init.c:343:43: sparse: signed value source

vim +354 arch/riscv/mm/init.c

51b766c79a3d74 Samuel Holland 2024-10-26  326  
51b766c79a3d74 Samuel Holland 2024-10-26  327  static void __init relocate_kernel(void)
51b766c79a3d74 Samuel Holland 2024-10-26  328  {
ea2bde36a46d57 Samuel Holland 2024-10-26  329  	Elf_Rela *rela = (Elf_Rela *)&__rela_dyn_start;
51b766c79a3d74 Samuel Holland 2024-10-26  330  	/*
51b766c79a3d74 Samuel Holland 2024-10-26  331  	 * This holds the offset between the linked virtual address and the
51b766c79a3d74 Samuel Holland 2024-10-26  332  	 * relocated virtual address.
51b766c79a3d74 Samuel Holland 2024-10-26  333  	 */
51b766c79a3d74 Samuel Holland 2024-10-26  334  	uintptr_t reloc_offset = kernel_map.virt_addr - KERNEL_LINK_ADDR;
51b766c79a3d74 Samuel Holland 2024-10-26  335  	/*
51b766c79a3d74 Samuel Holland 2024-10-26  336  	 * This holds the offset between kernel linked virtual address and
51b766c79a3d74 Samuel Holland 2024-10-26  337  	 * physical address.
51b766c79a3d74 Samuel Holland 2024-10-26  338  	 */
51b766c79a3d74 Samuel Holland 2024-10-26  339  	uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR - kernel_map.phys_addr;
51b766c79a3d74 Samuel Holland 2024-10-26  340  
ea2bde36a46d57 Samuel Holland 2024-10-26  341  	for ( ; rela < (Elf_Rela *)&__rela_dyn_end; rela++) {
ea2bde36a46d57 Samuel Holland 2024-10-26  342  		Elf_Addr addr = (rela->r_offset - va_kernel_link_pa_offset);
ea2bde36a46d57 Samuel Holland 2024-10-26  343  		Elf_Addr relocated_addr = rela->r_addend;
51b766c79a3d74 Samuel Holland 2024-10-26  344  
51b766c79a3d74 Samuel Holland 2024-10-26  345  		if (rela->r_info != R_RISCV_RELATIVE)
51b766c79a3d74 Samuel Holland 2024-10-26  346  			continue;
51b766c79a3d74 Samuel Holland 2024-10-26  347  
51b766c79a3d74 Samuel Holland 2024-10-26  348  		/*
51b766c79a3d74 Samuel Holland 2024-10-26  349  		 * Make sure to not relocate vdso symbols like rt_sigreturn
51b766c79a3d74 Samuel Holland 2024-10-26  350  		 * which are linked from the address 0 in vmlinux since
51b766c79a3d74 Samuel Holland 2024-10-26  351  		 * vdso symbol addresses are actually used as an offset from
51b766c79a3d74 Samuel Holland 2024-10-26  352  		 * mm->context.vdso in VDSO_OFFSET macro.
51b766c79a3d74 Samuel Holland 2024-10-26  353  		 */
51b766c79a3d74 Samuel Holland 2024-10-26 @354  		if (relocated_addr >= KERNEL_LINK_ADDR)
51b766c79a3d74 Samuel Holland 2024-10-26  355  			relocated_addr += reloc_offset;
51b766c79a3d74 Samuel Holland 2024-10-26  356  
ea2bde36a46d57 Samuel Holland 2024-10-26  357  		*(Elf_Addr *)addr = relocated_addr;
51b766c79a3d74 Samuel Holland 2024-10-26  358  	}
51b766c79a3d74 Samuel Holland 2024-10-26  359  }
51b766c79a3d74 Samuel Holland 2024-10-26  360  #endif /* CONFIG_RELOCATABLE */
51b766c79a3d74 Samuel Holland 2024-10-26  361  

:::::: The code at line 354 was first introduced by commit
:::::: 51b766c79a3d741fb97419c3da1c58fce5e66f0e riscv: Support CONFIG_RELOCATABLE on NOMMU

:::::: TO: Samuel Holland <samuel.holland@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
