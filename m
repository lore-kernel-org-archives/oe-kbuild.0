Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839AB17727
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Jun 2024 01:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719279101; cv=none; b=W6WxPEvH8rhwBJ7p9JbvFLK/ZfC9MV3qW4857lKQVtSdTPqHKz+IeteJobW9u/WEMTOzdcwVUnpDDolWD4Ht8Un1hxT0ihUntAnvv+wHydowKQG8gJuHcU58SuONpLliMM+uV06tAa0YvPCNrr3Sehnaa8ZoDq1D71IdO4pFp4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719279101; c=relaxed/simple;
	bh=eDZMRANV4Gweo9mjFAqwavn3I8swsvQZaTgAi6XcYX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NPl6cay5IbuVh7gmOi6Px7e7xBB6NYd15viMqL+iCREIwepfXhEyAHfXQeCJ/EQvfr3nc4WZ6lxeVR9DoPYUf8zpM8hS06Ku1rhoqzlcTazwXJPWj7nTgHd7YlEUIlXfeX/OCb1Lt7IgdWCa1cwqzlDkWauuiJbXls92qy/1S98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jlv8fJza; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jlv8fJza"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719279100; x=1750815100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eDZMRANV4Gweo9mjFAqwavn3I8swsvQZaTgAi6XcYX8=;
  b=Jlv8fJzafogWKuRVPSEk568UWxrwGhXIlGSOUkAH/ctXPNTy6/eVfSLv
   +86dVGQPSlkQgcQKNsfI2wSF04dICuldZ+hU3ALI8/k80AmWM57jgjhm6
   jmK8l+rDwBxwUVC9cQ76N1dnCKDQ2a9PIIEKr/Eu/0rpvWHVVhXIb2yvO
   cDH2ghpmSkvca0XmC0I2f/aGvBbH6rF0iT67mvimp9BELH9JeaeFyRfPE
   QksYx40wqBps990gokObXlWK/wE/IAfL0U4B2mK6DfbmluggpXW0t9n/Z
   2UKn4X9/jS1DJEDT4igruxwg2EvTYKvvXU+HZL1TRntwzQGjkdsqfqmhz
   w==;
X-CSE-ConnectionGUID: q4QeuO36TTSWNq3kI56Isw==
X-CSE-MsgGUID: ZjaDVkMUQOu4a4yRhwGy0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26864325"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="26864325"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 18:31:40 -0700
X-CSE-ConnectionGUID: WlCs5JVSTBm3qBd4lhLqUQ==
X-CSE-MsgGUID: GDqYBq5eRp6+t9Op2dXC8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="81018997"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Jun 2024 18:31:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLv1z-000DuA-1p;
	Tue, 25 Jun 2024 01:31:35 +0000
Date: Tue, 25 Jun 2024 09:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/kernel/head32.c:152:14: sparse: sparse: invalid access
 below 'boot_params' (-2147483108 4096)
Message-ID: <202406250927.m1ZXud60-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/kernel/head32.c:152:14: sparse: sparse: invalid access below 'boot_params' (-2147483108 4096)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   55027e689933ba2e64f3d245fb1ff185b3e7fc81
commit: 4c585af7180c147062c636a927a2fc2b6a7072f5 x86/boot/32: Temporarily map initrd for microcode loading
date:   8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-r131-20240624 (https://download.01.org/0day-ci/archive/20240625/202406250927.m1ZXud60-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406250927.m1ZXud60-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406250927.m1ZXud60-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/head32.c:33:26: sparse: sparse: symbol 'initrd_start_early' was not declared. Should it be static?
>> arch/x86/kernel/head32.c:152:14: sparse: sparse: invalid access below 'boot_params' (-2147483108 4096)
   arch/x86/kernel/head32.c:152:43: sparse: sparse: invalid access below 'boot_params' (-2147483112 4096)

vim +/boot_params +152 arch/x86/kernel/head32.c

a4c81cf6843507 Yinghai Lu                 2008-05-18   31  
4c585af7180c14 Thomas Gleixner            2023-10-17   32  #ifdef CONFIG_MICROCODE_INITRD32
4c585af7180c14 Thomas Gleixner            2023-10-17  @33  unsigned long __initdata initrd_start_early;
4c585af7180c14 Thomas Gleixner            2023-10-17   34  static pte_t __initdata *initrd_pl2p_start, *initrd_pl2p_end;
4c585af7180c14 Thomas Gleixner            2023-10-17   35  
4c585af7180c14 Thomas Gleixner            2023-10-17   36  static void zap_early_initrd_mapping(void)
4c585af7180c14 Thomas Gleixner            2023-10-17   37  {
4c585af7180c14 Thomas Gleixner            2023-10-17   38  	pte_t *pl2p = initrd_pl2p_start;
4c585af7180c14 Thomas Gleixner            2023-10-17   39  
4c585af7180c14 Thomas Gleixner            2023-10-17   40  	for (; pl2p < initrd_pl2p_end; pl2p++) {
4c585af7180c14 Thomas Gleixner            2023-10-17   41  		*pl2p = (pte_t){ .pte = 0 };
4c585af7180c14 Thomas Gleixner            2023-10-17   42  
4c585af7180c14 Thomas Gleixner            2023-10-17   43  		if (!IS_ENABLED(CONFIG_X86_PAE))
4c585af7180c14 Thomas Gleixner            2023-10-17   44  			*(pl2p + ((PAGE_OFFSET >> PGDIR_SHIFT))) = (pte_t) {.pte = 0};
4c585af7180c14 Thomas Gleixner            2023-10-17   45  	}
4c585af7180c14 Thomas Gleixner            2023-10-17   46  }
4c585af7180c14 Thomas Gleixner            2023-10-17   47  #else
4c585af7180c14 Thomas Gleixner            2023-10-17   48  static inline void zap_early_initrd_mapping(void) { }
4c585af7180c14 Thomas Gleixner            2023-10-17   49  #endif
4c585af7180c14 Thomas Gleixner            2023-10-17   50  
4208d2d79837ef Josh Poimboeuf             2023-04-12   51  asmlinkage __visible void __init __noreturn i386_start_kernel(void)
700efc1b9f6afe Eric W. Biederman          2008-02-23   52  {
9c48c0965b97e1 Thomas Gleixner            2017-10-16   53  	/* Make sure IDT is set up before any exception happens */
87e81786b13b26 Thomas Gleixner            2017-08-28   54  	idt_setup_early_handler();
87e81786b13b26 Thomas Gleixner            2017-08-28   55  
4c585af7180c14 Thomas Gleixner            2023-10-17   56  	/* load_ucode_bsp() */
4c585af7180c14 Thomas Gleixner            2023-10-17   57  	zap_early_initrd_mapping();
4c585af7180c14 Thomas Gleixner            2023-10-17   58  
9c48c0965b97e1 Thomas Gleixner            2017-10-16   59  	cr4_init_shadow();
9c48c0965b97e1 Thomas Gleixner            2017-10-16   60  
5dcd14ecd41ea2 H. Peter Anvin             2013-01-29   61  	sanitize_boot_params(&boot_params);
5dcd14ecd41ea2 H. Peter Anvin             2013-01-29   62  
8d152e7a5c7537 Luis R. Rodriguez          2016-04-13   63  	x86_early_init_platform_quirks();
8d152e7a5c7537 Luis R. Rodriguez          2016-04-13   64  
47a3d5da70f411 Thomas Gleixner            2009-08-29   65  	/* Call the subarch specific early setup function */
47a3d5da70f411 Thomas Gleixner            2009-08-29   66  	switch (boot_params.hdr.hardware_subarch) {
712b6aa8731a7e Kuppuswamy Sathyanarayanan 2013-10-17   67  	case X86_SUBARCH_INTEL_MID:
712b6aa8731a7e Kuppuswamy Sathyanarayanan 2013-10-17   68  		x86_intel_mid_early_setup();
3f4110a48a749a Thomas Gleixner            2009-08-29   69  		break;
c751e17b5371ad Thomas Gleixner            2010-11-09   70  	case X86_SUBARCH_CE4100:
c751e17b5371ad Thomas Gleixner            2010-11-09   71  		x86_ce4100_early_setup();
c751e17b5371ad Thomas Gleixner            2010-11-09   72  		break;
47a3d5da70f411 Thomas Gleixner            2009-08-29   73  	default:
47a3d5da70f411 Thomas Gleixner            2009-08-29   74  		i386_default_early_setup();
47a3d5da70f411 Thomas Gleixner            2009-08-29   75  		break;
47a3d5da70f411 Thomas Gleixner            2009-08-29   76  	}
a4c81cf6843507 Yinghai Lu                 2008-05-18   77  
700efc1b9f6afe Eric W. Biederman          2008-02-23   78  	start_kernel();
700efc1b9f6afe Eric W. Biederman          2008-02-23   79  }
1e620f9b23e598 Boris Ostrovsky            2016-12-08   80  
1e620f9b23e598 Boris Ostrovsky            2016-12-08   81  /*
1e620f9b23e598 Boris Ostrovsky            2016-12-08   82   * Initialize page tables.  This creates a PDE and a set of page
1e620f9b23e598 Boris Ostrovsky            2016-12-08   83   * tables, which are located immediately beyond __brk_base.  The variable
1e620f9b23e598 Boris Ostrovsky            2016-12-08   84   * _brk_end is set up to point to the first "safe" location.
1e620f9b23e598 Boris Ostrovsky            2016-12-08   85   * Mappings are created both at virtual address 0 (identity mapping)
1e620f9b23e598 Boris Ostrovsky            2016-12-08   86   * and PAGE_OFFSET for up to _end.
1e620f9b23e598 Boris Ostrovsky            2016-12-08   87   *
1e620f9b23e598 Boris Ostrovsky            2016-12-08   88   * In PAE mode initial_page_table is statically defined to contain
1e620f9b23e598 Boris Ostrovsky            2016-12-08   89   * enough entries to cover the VMSPLIT option (that is the top 1, 2 or 3
1e620f9b23e598 Boris Ostrovsky            2016-12-08   90   * entries). The identity mapping is handled by pointing two PGD entries
1e620f9b23e598 Boris Ostrovsky            2016-12-08   91   * to the first kernel PMD. Note the upper half of each PMD or PTE are
1e620f9b23e598 Boris Ostrovsky            2016-12-08   92   * always zero at this stage.
1e620f9b23e598 Boris Ostrovsky            2016-12-08   93   */
a62f4ca106fd25 Thomas Gleixner            2023-10-17   94  #ifdef CONFIG_X86_PAE
a62f4ca106fd25 Thomas Gleixner            2023-10-17   95  typedef pmd_t			pl2_t;
a62f4ca106fd25 Thomas Gleixner            2023-10-17   96  #define pl2_base		initial_pg_pmd
a62f4ca106fd25 Thomas Gleixner            2023-10-17   97  #define SET_PL2(val)		{ .pmd = (val), }
a62f4ca106fd25 Thomas Gleixner            2023-10-17   98  #else
a62f4ca106fd25 Thomas Gleixner            2023-10-17   99  typedef pgd_t			pl2_t;
a62f4ca106fd25 Thomas Gleixner            2023-10-17  100  #define pl2_base		initial_page_table
a62f4ca106fd25 Thomas Gleixner            2023-10-17  101  #define SET_PL2(val)		{ .pgd = (val), }
a62f4ca106fd25 Thomas Gleixner            2023-10-17  102  #endif
242db7589460ca Thomas Gleixner            2023-10-02  103  
69ba866db281c7 Thomas Gleixner            2023-10-17  104  static __init __no_stack_protector pte_t init_map(pte_t pte, pte_t **ptep, pl2_t **pl2p,
69ba866db281c7 Thomas Gleixner            2023-10-17  105  						  const unsigned long limit)
1e620f9b23e598 Boris Ostrovsky            2016-12-08  106  {
1e620f9b23e598 Boris Ostrovsky            2016-12-08  107  	while ((pte.pte & PTE_PFN_MASK) < limit) {
69ba866db281c7 Thomas Gleixner            2023-10-17  108  		pl2_t pl2 = SET_PL2((unsigned long)*ptep | PDE_IDENT_ATTR);
69ba866db281c7 Thomas Gleixner            2023-10-17  109  		int i;
a62f4ca106fd25 Thomas Gleixner            2023-10-17  110  
69ba866db281c7 Thomas Gleixner            2023-10-17  111  		**pl2p = pl2;
a62f4ca106fd25 Thomas Gleixner            2023-10-17  112  		if (!IS_ENABLED(CONFIG_X86_PAE)) {
1e620f9b23e598 Boris Ostrovsky            2016-12-08  113  			/* Kernel PDE entry */
69ba866db281c7 Thomas Gleixner            2023-10-17  114  			*(*pl2p + ((PAGE_OFFSET >> PGDIR_SHIFT))) = pl2;
a62f4ca106fd25 Thomas Gleixner            2023-10-17  115  		}
a62f4ca106fd25 Thomas Gleixner            2023-10-17  116  
1e620f9b23e598 Boris Ostrovsky            2016-12-08  117  		for (i = 0; i < PTRS_PER_PTE; i++) {
69ba866db281c7 Thomas Gleixner            2023-10-17  118  			**ptep = pte;
1e620f9b23e598 Boris Ostrovsky            2016-12-08  119  			pte.pte += PAGE_SIZE;
69ba866db281c7 Thomas Gleixner            2023-10-17  120  			(*ptep)++;
1e620f9b23e598 Boris Ostrovsky            2016-12-08  121  		}
69ba866db281c7 Thomas Gleixner            2023-10-17  122  		(*pl2p)++;
69ba866db281c7 Thomas Gleixner            2023-10-17  123  	}
69ba866db281c7 Thomas Gleixner            2023-10-17  124  	return pte;
1e620f9b23e598 Boris Ostrovsky            2016-12-08  125  }
1e620f9b23e598 Boris Ostrovsky            2016-12-08  126  
69ba866db281c7 Thomas Gleixner            2023-10-17  127  void __init __no_stack_protector mk_early_pgtbl_32(void)
69ba866db281c7 Thomas Gleixner            2023-10-17  128  {
69ba866db281c7 Thomas Gleixner            2023-10-17  129  	/* Enough space to fit pagetables for the low memory linear map */
4c585af7180c14 Thomas Gleixner            2023-10-17  130  	unsigned long limit = __pa_nodebug(_end) + (PAGE_TABLE_SIZE(LOWMEM_PAGES) << PAGE_SHIFT);
69ba866db281c7 Thomas Gleixner            2023-10-17  131  	pte_t pte, *ptep = (pte_t *)__pa_nodebug(__brk_base);
4c585af7180c14 Thomas Gleixner            2023-10-17  132  	struct boot_params __maybe_unused *params;
69ba866db281c7 Thomas Gleixner            2023-10-17  133  	pl2_t *pl2p = (pl2_t *)__pa_nodebug(pl2_base);
69ba866db281c7 Thomas Gleixner            2023-10-17  134  	unsigned long *ptr;
69ba866db281c7 Thomas Gleixner            2023-10-17  135  
69ba866db281c7 Thomas Gleixner            2023-10-17  136  	pte.pte = PTE_IDENT_ATTR;
69ba866db281c7 Thomas Gleixner            2023-10-17  137  	pte = init_map(pte, &ptep, &pl2p, limit);
69ba866db281c7 Thomas Gleixner            2023-10-17  138  
1e2dd572d2b773 Thomas Gleixner            2023-10-17  139  	ptr = (unsigned long *)__pa_nodebug(&max_pfn_mapped);
1e620f9b23e598 Boris Ostrovsky            2016-12-08  140  	/* Can't use pte_pfn() since it's a call with CONFIG_PARAVIRT */
1e620f9b23e598 Boris Ostrovsky            2016-12-08  141  	*ptr = (pte.pte & PTE_PFN_MASK) >> PAGE_SHIFT;
1e620f9b23e598 Boris Ostrovsky            2016-12-08  142  
1e2dd572d2b773 Thomas Gleixner            2023-10-17  143  	ptr = (unsigned long *)__pa_nodebug(&_brk_end);
1e620f9b23e598 Boris Ostrovsky            2016-12-08  144  	*ptr = (unsigned long)ptep + PAGE_OFFSET;
4c585af7180c14 Thomas Gleixner            2023-10-17  145  
4c585af7180c14 Thomas Gleixner            2023-10-17  146  #ifdef CONFIG_MICROCODE_INITRD32
4c585af7180c14 Thomas Gleixner            2023-10-17  147  	/* Running on a hypervisor? */
4c585af7180c14 Thomas Gleixner            2023-10-17  148  	if (native_cpuid_ecx(1) & BIT(31))
4c585af7180c14 Thomas Gleixner            2023-10-17  149  		return;
4c585af7180c14 Thomas Gleixner            2023-10-17  150  
4c585af7180c14 Thomas Gleixner            2023-10-17  151  	params = (struct boot_params *)__pa_nodebug(&boot_params);
4c585af7180c14 Thomas Gleixner            2023-10-17 @152  	if (!params->hdr.ramdisk_size || !params->hdr.ramdisk_image)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
