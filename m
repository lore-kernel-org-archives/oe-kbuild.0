Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9A846BBD
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jan 2024 20:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpuiaZ1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704746670; x=1736282670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sq2B2Lx0TuTgwqfy9T6OfFHFZje13RFDDm3hzE6jXNY=;
  b=WpuiaZ1YV3wVL4lBBhH2EZECvG4aOk/5PWhYfus7SVMD+nQwHLFJSZcS
   eRpAjhwt5AYJwkM0fvFe4lnqyX3/yLum8NnSib0jBKXK2tGO7W0T04asS
   aRXe+++CZJwX8Y0CmK6ihbCkUZULj1By6oszQHqdIudsN+0RYJRZPctoQ
   afoFZ1E3Vsj16d+ouJnQKXmJ4e3Etdf+a4/HaA0r3E2U/rEWyST4kpetO
   N/+H8LgTz5V4DBCugQT8cUzGHwP4/CPbFqpgZrTUKblLOW5hIamAuN8EO
   bHs4fJu4zyzXgsPg/m/nMfnybOB5UyBiqMRQVZskjnzuH56NDTK+YUatx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11488438"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="11488438"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 12:44:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="23644380"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jan 2024 12:44:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMwTu-00055C-08;
	Mon, 08 Jan 2024 20:44:22 +0000
Date: Tue, 9 Jan 2024 04:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/boot/compressed/pgtable_64.c:145 configure_5level_paging()
 error: __builtin_memcpy() '&trampoline_32bit_src' too small (8 vs 160)
Message-ID: <202401090458.cAaFiDIH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0dd3ee31125508cd67f7e7172247f05b7fd1753a
commit: 64ef578b6b6866bec012544416946533444036c8 x86/decompressor: Call trampoline directly from C code
date:   5 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20240106 (https://download.01.org/0day-ci/archive/20240109/202401090458.cAaFiDIH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401090458.cAaFiDIH-lkp@intel.com/

smatch warnings:
arch/x86/boot/compressed/pgtable_64.c:145 configure_5level_paging() error: __builtin_memcpy() '&trampoline_32bit_src' too small (8 vs 160)

vim +145 arch/x86/boot/compressed/pgtable_64.c

1b3a62643660020 Kirill A. Shutemov 2018-08-01  103  
64ef578b6b6866b Ard Biesheuvel     2023-08-07  104  asmlinkage void configure_5level_paging(struct boot_params *bp)
4440977be1347d4 Kirill A. Shutemov 2018-02-09  105  {
64ef578b6b6866b Ard Biesheuvel     2023-08-07  106  	void (*toggle_la57)(void *trampoline, bool enable_5lvl);
64ef578b6b6866b Ard Biesheuvel     2023-08-07  107  	bool l5_required = false;
08529078d8d9adf Kirill A. Shutemov 2017-12-04  108  
372fddf70904174 Kirill A. Shutemov 2018-05-18  109  	/* Initialize boot_params. Required for cmdline_find_option_bool(). */
64ef578b6b6866b Ard Biesheuvel     2023-08-07  110  	boot_params = bp;
372fddf70904174 Kirill A. Shutemov 2018-05-18  111  
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  112  	/*
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  113  	 * Check if LA57 is desired and supported.
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  114  	 *
372fddf70904174 Kirill A. Shutemov 2018-05-18  115  	 * There are several parts to the check:
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  116  	 *   - if the kernel supports 5-level paging: CONFIG_X86_5LEVEL=y
372fddf70904174 Kirill A. Shutemov 2018-05-18  117  	 *   - if user asked to disable 5-level paging: no5lvl in cmdline
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  118  	 *   - if the machine supports 5-level paging:
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  119  	 *     + CPUID leaf 7 is supported
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  120  	 *     + the leaf has the feature bit set
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  121  	 *
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  122  	 * That's substitute for boot_cpu_has() in early boot code.
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  123  	 */
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  124  	if (IS_ENABLED(CONFIG_X86_5LEVEL) &&
372fddf70904174 Kirill A. Shutemov 2018-05-18  125  			!cmdline_find_option_bool("no5lvl") &&
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  126  			native_cpuid_eax(0) >= 7 &&
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  127  			(native_cpuid_ecx(7) & (1 << (X86_FEATURE_LA57 & 31)))) {
64ef578b6b6866b Ard Biesheuvel     2023-08-07  128  		l5_required = true;
00c6b0978ec182f Ard Biesheuvel     2023-08-07  129  
00c6b0978ec182f Ard Biesheuvel     2023-08-07  130  		/* Initialize variables for 5-level paging */
00c6b0978ec182f Ard Biesheuvel     2023-08-07  131  		__pgtable_l5_enabled = 1;
00c6b0978ec182f Ard Biesheuvel     2023-08-07  132  		pgdir_shift = 48;
00c6b0978ec182f Ard Biesheuvel     2023-08-07  133  		ptrs_per_p4d = 512;
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  134  	}
08529078d8d9adf Kirill A. Shutemov 2017-12-04  135  
64ef578b6b6866b Ard Biesheuvel     2023-08-07  136  	trampoline_32bit = (unsigned long *)find_trampoline_placement();
3548e131ec6a822 Kirill A. Shutemov 2018-02-26  137  
fb5268354d20b82 Kirill A. Shutemov 2018-02-26  138  	/* Preserve trampoline memory */
fb5268354d20b82 Kirill A. Shutemov 2018-02-26  139  	memcpy(trampoline_save, trampoline_32bit, TRAMPOLINE_32BIT_SIZE);
fb5268354d20b82 Kirill A. Shutemov 2018-02-26  140  
32fcefa2bfc8961 Kirill A. Shutemov 2018-02-26  141  	/* Clear trampoline memory first */
32fcefa2bfc8961 Kirill A. Shutemov 2018-02-26  142  	memset(trampoline_32bit, 0, TRAMPOLINE_32BIT_SIZE);
32fcefa2bfc8961 Kirill A. Shutemov 2018-02-26  143  
32fcefa2bfc8961 Kirill A. Shutemov 2018-02-26  144  	/* Copy trampoline code in place */
64ef578b6b6866b Ard Biesheuvel     2023-08-07 @145  	toggle_la57 = memcpy(trampoline_32bit +
bd328aa01ff77a4 Ard Biesheuvel     2023-08-07  146  			TRAMPOLINE_32BIT_CODE_OFFSET / sizeof(unsigned long),
32fcefa2bfc8961 Kirill A. Shutemov 2018-02-26  147  			&trampoline_32bit_src, TRAMPOLINE_32BIT_CODE_SIZE);
32fcefa2bfc8961 Kirill A. Shutemov 2018-02-26  148  
bd328aa01ff77a4 Ard Biesheuvel     2023-08-07  149  	/*
bd328aa01ff77a4 Ard Biesheuvel     2023-08-07  150  	 * Avoid the need for a stack in the 32-bit trampoline code, by using
bd328aa01ff77a4 Ard Biesheuvel     2023-08-07  151  	 * LJMP rather than LRET to return back to long mode. LJMP takes an
bd328aa01ff77a4 Ard Biesheuvel     2023-08-07  152  	 * immediate absolute address, which needs to be adjusted based on the
bd328aa01ff77a4 Ard Biesheuvel     2023-08-07  153  	 * placement of the trampoline.
bd328aa01ff77a4 Ard Biesheuvel     2023-08-07  154  	 */
64ef578b6b6866b Ard Biesheuvel     2023-08-07  155  	*(u32 *)((u8 *)toggle_la57 + trampoline_ljmp_imm_offset) +=
64ef578b6b6866b Ard Biesheuvel     2023-08-07  156  						(unsigned long)toggle_la57;
bd328aa01ff77a4 Ard Biesheuvel     2023-08-07  157  
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  158  	/*
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  159  	 * The code below prepares page table in trampoline memory.
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  160  	 *
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  161  	 * The new page table will be used by trampoline code for switching
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  162  	 * from 4- to 5-level paging or vice versa.
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  163  	 *
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  164  	 * If switching is not required, the page table is unused: trampoline
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  165  	 * code wouldn't touch CR3.
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  166  	 */
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  167  
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  168  	/*
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  169  	 * We are not going to use the page table in trampoline memory if we
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  170  	 * are already in the desired paging mode.
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  171  	 */
64ef578b6b6866b Ard Biesheuvel     2023-08-07  172  	if (l5_required == !!(native_read_cr4() & X86_CR4_LA57))
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  173  		goto out;
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  174  
64ef578b6b6866b Ard Biesheuvel     2023-08-07  175  	if (l5_required) {
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  176  		/*
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  177  		 * For 4- to 5-level paging transition, set up current CR3 as
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  178  		 * the first and the only entry in a new top-level page table.
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  179  		 */
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  180  		trampoline_32bit[TRAMPOLINE_32BIT_PGTABLE_OFFSET] = __native_read_cr3() | _PAGE_TABLE_NOENC;
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  181  	} else {
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  182  		unsigned long src;
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  183  
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  184  		/*
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  185  		 * For 5- to 4-level paging transition, copy page table pointed
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  186  		 * by first entry in the current top-level page table as our
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  187  		 * new top-level page table.
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  188  		 *
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  189  		 * We cannot just point to the page table from trampoline as it
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  190  		 * may be above 4G.
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  191  		 */
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  192  		src = *(unsigned long *)__native_read_cr3() & PAGE_MASK;
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  193  		memcpy(trampoline_32bit + TRAMPOLINE_32BIT_PGTABLE_OFFSET / sizeof(unsigned long),
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  194  		       (void *)src, PAGE_SIZE);
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  195  	}
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  196  
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  197  out:
64ef578b6b6866b Ard Biesheuvel     2023-08-07  198  	toggle_la57(trampoline_32bit, l5_required);
08529078d8d9adf Kirill A. Shutemov 2017-12-04  199  }
fb5268354d20b82 Kirill A. Shutemov 2018-02-26  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
