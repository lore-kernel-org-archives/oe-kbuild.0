Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CF47E
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 01:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRqVzNfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700099830; x=1731635830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yWKS2tAp8/MmcJ8eTx8xhyYcIlzdSF7eD/CHjI42iG4=;
  b=cRqVzNfoSf71l3PVEp6lXGEaEVqYG5ynkoy1VOmV+6aiR0rJM8SL3iOD
   G/r/fPH2DhwSwX5VisNuG0mslIQrFxqjwwXCvjmTbCLJakUOkEGL3vnZG
   M4AsRxbXs4dLbDxzEjHIBHBCpi49RcxNZXmypIOsekHuwuwmz9gB4deza
   50ZsHPw1WrH1Uiyqf/gy18BO+Ze6O4px2Ab086tcJ9BrpTybQgnii16mc
   aTr9lwqYvxVfAQwDZxyDZ4XimWTYGcG42Y8iAI1NGUSPengqSKcjFRAKy
   2PVYsODLRzf7Mb+1J5GyUR0QlK3z2qmKIWNSwE5+zII9EPccWSr10/FJk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477212680"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="477212680"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:57:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="6590356"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Nov 2023 17:57:05 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3RbT-00016E-09;
	Thu, 16 Nov 2023 01:56:14 +0000
Date: Thu, 16 Nov 2023 09:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/kernel/cpu/mtrr/mtrr.c:650:33: sparse: sparse:
 self-comparison always evaluates to true
Message-ID: <202311160928.Pyg4eZ5v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/kernel/cpu/mtrr/mtrr.c:650:33: sparse: sparse: self-comparison always evaluates to true"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Juergen Gross <jgross@suse.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 03409069520974361ffb510c725305239b78b39f x86/mtrr: Replace vendor tests in MTRR code
date:   6 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-x001-20230717 (https://download.01.org/0day-ci/archive/20231116/202311160928.Pyg4eZ5v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160928.Pyg4eZ5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160928.Pyg4eZ5v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/mtrr/mtrr.c:650:33: sparse: sparse: self-comparison always evaluates to true

vim +650 arch/x86/kernel/cpu/mtrr/mtrr.c

^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  600  
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  601  /**
f6b980646b93a8 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  602   * mtrr_bp_init - initialize MTRRs on the boot CPU
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  603   *
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  604   * This needs to be called early; before any of the other CPUs are
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  605   * initialized (i.e. before smp_init()).
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  606   */
9ef231a436fddb arch/i386/kernel/cpu/mtrr/main.c Sam Ravnborg           2007-07-21  607  void __init mtrr_bp_init(void)
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  608  {
29055dc7428746 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  609  	bool generic_mtrrs = cpu_feature_enabled(X86_FEATURE_MTRR);
7882b69eb6cdf6 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2022-12-05  610  	const char *why = "(not available)";
03409069520974 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  611  	unsigned long config, dummy;
dbd51be026eaf8 arch/x86/kernel/cpu/mtrr/main.c  Jaswinder Singh Rajput 2009-07-04  612  
d053b481a5f16d arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  613  	phys_hi_rsvd = GENMASK(31, boot_cpu_data.x86_phys_bits - 32);
95ffa2438d0e9c arch/x86/kernel/cpu/mtrr/main.c  Yinghai Lu             2008-04-29  614  
29055dc7428746 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  615  	if (!generic_mtrrs && mtrr_state.enabled) {
29055dc7428746 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  616  		/*
29055dc7428746 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  617  		 * Software overwrite of MTRR state, only for generic case.
29055dc7428746 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  618  		 * Note that X86_FEATURE_MTRR has been reset in this case.
29055dc7428746 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  619  		 */
29055dc7428746 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  620  		init_table();
29055dc7428746 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  621  		pr_info("MTRRs set to read-only\n");
29055dc7428746 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  622  
29055dc7428746 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  623  		return;
29055dc7428746 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  624  	}
29055dc7428746 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  625  
29055dc7428746 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  626  	if (generic_mtrrs) {
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  627  		mtrr_if = &generic_mtrr_ops;
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  628  	} else {
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  629  		switch (boot_cpu_data.x86_vendor) {
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  630  		case X86_VENDOR_AMD:
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  631  			/* Pre-Athlon (K6) AMD CPU MTRRs */
f6b980646b93a8 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  632  			if (cpu_feature_enabled(X86_FEATURE_K6_MTRR))
f8bd9f25c98151 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2022-11-02  633  				mtrr_if = &amd_mtrr_ops;
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  634  			break;
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  635  		case X86_VENDOR_CENTAUR:
f6b980646b93a8 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  636  			if (cpu_feature_enabled(X86_FEATURE_CENTAUR_MCR))
f8bd9f25c98151 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2022-11-02  637  				mtrr_if = &centaur_mtrr_ops;
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  638  			break;
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  639  		case X86_VENDOR_CYRIX:
f6b980646b93a8 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  640  			if (cpu_feature_enabled(X86_FEATURE_CYRIX_ARR))
f8bd9f25c98151 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2022-11-02  641  				mtrr_if = &cyrix_mtrr_ops;
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  642  			break;
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  643  		default:
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  644  			break;
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  645  		}
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  646  	}
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  647  
2c15679e8687d5 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2022-11-02  648  	if (mtrr_enabled()) {
03409069520974 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  649  		/* Get the number of variable MTRR ranges. */
03409069520974 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02 @650  		if (mtrr_if == &generic_mtrr_ops)
03409069520974 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  651  			rdmsr(MSR_MTRRcap, config, dummy);
03409069520974 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  652  		else
03409069520974 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  653  			config = mtrr_if->var_regs;
03409069520974 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  654  		num_var_ranges = config & MTRR_CAP_VCNT;
03409069520974 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  655  
^1da177e4c3f41 arch/i386/kernel/cpu/mtrr/main.c Linus Torvalds         2005-04-16  656  		init_table();
45fa71f19a2d73 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2022-11-02  657  		if (mtrr_if == &generic_mtrr_ops) {
f9626104a5b681 arch/x86/kernel/cpu/mtrr/main.c  Luis R. Rodriguez      2015-05-26  658  			/* BIOS may override */
2c15679e8687d5 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2022-11-02  659  			if (get_mtrr_state()) {
adfe7512e1d0b2 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2022-11-02  660  				memory_caching_control |= CACHE_MTRR;
f6b980646b93a8 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2023-05-02  661  				changed_by_mtrr_cleanup = mtrr_cleanup();
2c15679e8687d5 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2022-11-02  662  			} else {
2c15679e8687d5 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2022-11-02  663  				mtrr_if = NULL;
7882b69eb6cdf6 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2022-12-05  664  				why = "by BIOS";
12031a624af781 arch/x86/kernel/cpu/mtrr/main.c  Yinghai Lu             2008-05-02  665  			}
95ffa2438d0e9c arch/x86/kernel/cpu/mtrr/main.c  Yinghai Lu             2008-04-29  666  		}
3b520b238e018e arch/i386/kernel/cpu/mtrr/main.c Shaohua Li             2005-07-07  667  	}
f9626104a5b681 arch/x86/kernel/cpu/mtrr/main.c  Luis R. Rodriguez      2015-05-26  668  
adfe7512e1d0b2 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2022-11-02  669  	if (!mtrr_enabled())
7882b69eb6cdf6 arch/x86/kernel/cpu/mtrr/mtrr.c  Juergen Gross          2022-12-05  670  		pr_info("MTRRs disabled %s\n", why);
3b520b238e018e arch/i386/kernel/cpu/mtrr/main.c Shaohua Li             2005-07-07  671  }
3b520b238e018e arch/i386/kernel/cpu/mtrr/main.c Shaohua Li             2005-07-07  672  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
