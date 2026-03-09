Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049134502A
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 00:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773016458; cv=none; b=rT3VyhcbR/tjKCDrdcAek3hish7bwzFhlCH2erVI4RVE+m4DUKc5awUChKCEaeaUi2z452GuVOZYbs24UpE2Ojm0lXdiLdIBln7jfGDPuByVyCYPi2CVM3tmB06X5FU33bNEydoHAbrUO7m/Xo4ufme4NlF72u7xbAWCUHLdlcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773016458; c=relaxed/simple;
	bh=N9ny5I1BogcDDN0U2yTWf/uqmrGOkC0TeJGMZg9ACjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uBpE+m/tYGEXPjtcF9CQpPBrmCVG7kJ53yzE2AuqyyXKzrjWYXoFAgH4osEg7578CdaolDcn7NiD96KksBVzJXuGRxBwuoJFYi+m/1xhiWNLx3ik3DnNaVrslVQ7ut6yj/rQfZ3PxFRXvpsY1JN4l9/GFsTQzsc0+iSesqsX3zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mejv06bB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mejv06bB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773016456; x=1804552456;
  h=date:from:to:cc:subject:message-id;
  bh=N9ny5I1BogcDDN0U2yTWf/uqmrGOkC0TeJGMZg9ACjI=;
  b=mejv06bBvHi+Tck8sC4p3m8Ec6J+kuntaotV0kKR80E1zIXNj/GD8d2r
   9dI/J7epETgSQvS8P3VrJJnWP7UWU6by2JSJMTZZKHYzn0hPakYRV78cs
   Szpc78OHPBT2YGt69kgohchpJPiQXZpvXxAQBRjSp8PK0IB+rehnUgr2b
   c1ZrkR17pm+HL7XWRLHR5RTweAXRpMfyOwgibw3AiOytyse3c0Fsaez9v
   4VSzjBTRDpNOr2BpADAoztalMbNEbm5svCUSUASZEs3Qllk2LAIxMPdgQ
   H1oSCaSb1Oq0+XQ+b1CsVWVfIfSy9abhO1M9hc5i3eohCRczekjJW+Xd3
   A==;
X-CSE-ConnectionGUID: NCPSzaTpSN2g9vedNjJ3aA==
X-CSE-MsgGUID: QVB02KBrS1aVh2KBO3TZ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84364822"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84364822"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 17:34:15 -0700
X-CSE-ConnectionGUID: /WwdsgcVQOadnd2YqgaSbA==
X-CSE-MsgGUID: nErK+ns0QLKaGfWiKbozmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="242612929"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2026 17:34:13 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzOZX-000000003Vk-0c2p;
	Mon, 09 Mar 2026 00:34:11 +0000
Date: Mon, 09 Mar 2026 08:34:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/mm/init.c:354:39: sparse: sparse: unsigned value
 that used to be signed checked against zero?
Message-ID: <202603090831.oONzC4PB-lkp@intel.com>
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
head:   fc9f248d8c591454e257edd54ac4085d84f11e6a
commit: ea2bde36a46d5724c1b44d80cc9fafbd73c2ecf9 riscv: Support CONFIG_RELOCATABLE on riscv32
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-r121-20260308 (https://download.01.org/0day-ci/archive/20260309/202603090831.oONzC4PB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090831.oONzC4PB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603090831.oONzC4PB-lkp@intel.com/

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
