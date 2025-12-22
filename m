Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013EA2E2DDD
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408878; cv=none; b=Sj2SD/dfZGdm7sEK+La7WALmzhRRifUaj/tkc7bEMiWxXL0QNkosanD3OzNBar1WhrbtYpjXVW4V4lO9sRQYFtc13kSxSqoqdxw+Wqf8xeBQkCzPjEJCgXjtEMvvCGBI6CX7G1ugwD2jh/H3Pdspn1e5CxAnIEU3VO5kkkySnXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408878; c=relaxed/simple;
	bh=ubXgUJy2NGYxS0brd3fYPnt97rc8FuHuO0FMUAuafn8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tPT075OJ4n/Sg2JjWrsNt2rvFX14LmhkdOnELXycruxBFXCxF8o5Ts2lzhJAdfh2n0reJ6gbw8iVrcuOyx/hzQHTGy37FDE1xgrg735M0IKJOins8vv3iMT82qpAXCy0rVWyjRb35+2pcreCvfxoBvUGm1mRpuwORc3eOpyLGCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j65UQXgv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j65UQXgv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766408877; x=1797944877;
  h=date:from:to:cc:subject:message-id;
  bh=ubXgUJy2NGYxS0brd3fYPnt97rc8FuHuO0FMUAuafn8=;
  b=j65UQXgvQs/3Ljhg/mvH589VROdQI1u95p40JbkOCyD9GadDHIAagPf/
   xhUqqc86epdmYu53hYWAJqGIXFH8Ni4I2kdbM1huUm4p6sklWc1lOALvr
   /d6qNpxlxQLn2JUEpprEbvxXZal/S1ui7GjBZ4Q69lTV1TXgC4o6W0xNH
   8l3ALmIX03m+x6/xzYCX8jd4enwc8uiG+3Yc4dlJi/kV9uj903PhlLJFQ
   5OjnYHxU5VYKa+C8qnVdGmzZds3ZDzNoaLL6Xn0mm9gwjRaRlAXLhBjlz
   rEpja8VdqGQraPiK0qemeXR26SQ9A+ba7qWmKmztKdpVIt1IBofR9/BQe
   w==;
X-CSE-ConnectionGUID: GvY91lIdS3GUXUgYViDTbQ==
X-CSE-MsgGUID: 6f5Ud9bpSNu3UQ/iuMJbCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67254787"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="67254787"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 05:07:56 -0800
X-CSE-ConnectionGUID: Zh5oQuycQrioB4DGtXd/WA==
X-CSE-MsgGUID: QeXkLA0iSWC6EsqSSRjk8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="236943958"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 05:07:55 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXfdg-000000000ba-2iwB;
	Mon, 22 Dec 2025 13:07:52 +0000
Date: Mon, 22 Dec 2025 21:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/mm/init.c:356:39: sparse: sparse: unsigned value
 that used to be signed checked against zero?
Message-ID: <202512222105.q3HFMYS1-lkp@intel.com>
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
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: 51b766c79a3d741fb97419c3da1c58fce5e66f0e riscv: Support CONFIG_RELOCATABLE on NOMMU
date:   9 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 9 months ago
config: riscv-randconfig-r121-20251222 (https://download.01.org/0day-ci/archive/20251222/202512222105.q3HFMYS1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222105.q3HFMYS1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512222105.q3HFMYS1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
