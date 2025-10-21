Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBDE2472BC
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761057069; cv=none; b=VPSBKADFZw0iB4lTl6cnJCd0Ek/lmO90QVOWOd9igRjLQjmM/EZZhT/av0H7gAr6rtvCB/uqhctpOpf75XokE9ha8svrfkUZKxShzA0TIeBYAM1jkYiABK9Dt9GYOCA6jkYeB3t/j/B4ISUec4Mz3rcTuVVYcV20Gn36+A2zeTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761057069; c=relaxed/simple;
	bh=QH8LzB4pgFDUvc9/hV88xSz+vKg05eit1d3/9+qVEeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CtOTr2XLBHvK/xjdNYdqpN5Set/5vHv6kPrA4EPkGWgyL16MgTRKTmz5Zj9cpYUWI5mUSG4fb5H3FP3ipZEu9SQCusDI2dUNCeJRDpWK4Wu0t816+k9azORNvfX/XcePojDSZiYyCDh+JUFkpTGakk6Dz7GlAgTdLWjhKncyb1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cK+yxiRc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cK+yxiRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761057068; x=1792593068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QH8LzB4pgFDUvc9/hV88xSz+vKg05eit1d3/9+qVEeg=;
  b=cK+yxiRcEEQBkMsiv4beJulkvd8LVdXojoZ+fP/zrFt7YUxjBRyiGs9N
   WpROy04cSaHRvjFg5Gtdxgbta1kToLwdUKmUs6mxc2Koq3O0mx0GWmCZU
   zoD/sY5a5ldu6hxm4yeE1Izi4fjuszW1oBDu/YhiMZf97Q/PRKh34F1Bk
   Y3qe6+1l1KZfS/f15r6fJRyi6vYOKVsvfFImumrDPXbLgipXhZ4uT4NJJ
   eOjbI1pcgsV22/vK26p7nt/NDvMpCc+byVRqwLMm9Hfj8B3+xmdWtgla0
   mNnLcsY0DJCn2KapsnwLGetpHVBtf1ugZhwmWdRF3FfinXyMjbJ5Ht3D1
   g==;
X-CSE-ConnectionGUID: 4Wqufw11RLefTbYkm2ClDA==
X-CSE-MsgGUID: s/6OPkleSoO9PedZGok+cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80621616"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="80621616"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:31:06 -0700
X-CSE-ConnectionGUID: 1XpNuiMSR8iswC/udY60EA==
X-CSE-MsgGUID: dP8JtDvfS1GEjGqa9h2jJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="214559493"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Oct 2025 07:31:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBDO9-000AuF-2q;
	Tue, 21 Oct 2025 14:31:01 +0000
Date: Tue, 21 Oct 2025 22:30:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/mm/init.c:356:39: sparse: sparse: unsigned value that
 used to be signed checked against zero?
Message-ID: <202510212227.MDyKeD7W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/riscv/mm/init.c:356:39: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Samuel Holland <samuel.holland@sifive.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: 51b766c79a3d741fb97419c3da1c58fce5e66f0e riscv: Support CONFIG_RELOCATABLE on NOMMU
date:   7 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-r111-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212227.MDyKeD7W-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212227.MDyKeD7W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510212227.MDyKeD7W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/mm/init.c:356:39: sparse: sparse: unsigned value that used to be signed checked against zero?
>> arch/riscv/mm/init.c:345:45: sparse: signed value source

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
51b766c79a3d74 Samuel Holland 2024-10-26 @345  		Elf64_Addr relocated_addr = rela->r_addend;
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
