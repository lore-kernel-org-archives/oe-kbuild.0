Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182911FBB
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jul 2024 01:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720919398; cv=none; b=f6mR880Y+tfZeT+L6yXmOHTZBuevDepNj18N7XOX/v4KnLLXNAuW5ZqrL3ZHa8fnY/Hx4SeNrn71KQhO5woxYwWkXmUNazmJTf7/Rf1S1YCm2/yBz9Y+V3pX4SQENx7bv6Xwh0NKpRIHcH5HFn8Uv2FGKkFPpP76P84/oHlNoqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720919398; c=relaxed/simple;
	bh=o4AJT2curgME4Asm4TnrIFHGE+pDTSaAsMsjhyHrz9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E65IUwiQ2IMUbEzgg2UEmIoq/avyEW7hKGzzZxVKzrI2uGUTymI/AuvIaxpDg7I8mvXq8Q6+q/BpdfTPbp0bcmYqzSzM2W/hYA0yR8ZsQcXtBd/06lOKXzRR4o6MirOvnFBAgt/6U1DWkIGeKuDz8mPO+/6MulaYOVH88KSMlCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+9KrFt7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+9KrFt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720919396; x=1752455396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4AJT2curgME4Asm4TnrIFHGE+pDTSaAsMsjhyHrz9o=;
  b=S+9KrFt7cIPMGjpeH9guRBm/h9zYOHrgG9zsVO/5GkOK1v7jaVEXh5Ra
   rgKUlaQVmwJse+Nrj4XI0iylXaWEKCkTgw7G46NCn8rKxKqF65usX9pPo
   OEsP7WQa5BhttJxRXfh3GcjWKaSApGnHfi4ofYR0ziyy4PBeTWMj26sG1
   pABWqkjprHFFA3aZGllQF3EEdcTCnyH+gRQakjiTv6t/I12ZhRUn1I6ND
   nk7o6CVosstKFVIMhe923tdfjroUbcQRdFSGwTrhH/DjSeZZYvgH5aJVB
   FBgZ6yk/RtuWhqT5l0OQ8kxH1jUcuQP6kb3TQ+u20/wGbuO3h7P/7SCip
   g==;
X-CSE-ConnectionGUID: 3PAztuFgQQ6nrioMg9fHjQ==
X-CSE-MsgGUID: Sn7cWiQFT8+3+x6cG8u6gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="43741407"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="43741407"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 18:09:55 -0700
X-CSE-ConnectionGUID: LBRc4s0DSqWFWBgnvN6Nqg==
X-CSE-MsgGUID: gt967I7DQtifSTEZhnNPyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="49367150"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jul 2024 18:09:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSnkN-000cuo-1m;
	Sun, 14 Jul 2024 01:09:51 +0000
Date: Sun, 14 Jul 2024 09:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mark:arm64/suspend/cleanup 7/7]
 arch/arm64/kernel/hibernate.c:478:23: sparse: sparse: not a function
 hibernate_exit
Message-ID: <202407140942.zQtwFWf2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/kernel/hibernate.c:478:23: sparse: sparse: not a function hibernate_exit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Rutland <mark.rutland@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/suspend/cleanup
head:   2521cb89860979de289e16be577e743e626bbb56
commit: 2521cb89860979de289e16be577e743e626bbb56 [7/7] arm64: hibernate: use regular cpu_resume() logic
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-r111-20240714 (https://download.01.org/0day-ci/archive/20240714/202407140942.zQtwFWf2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240714/202407140942.zQtwFWf2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407140942.zQtwFWf2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kernel/hibernate.c:426:44: sparse: sparse: cast from restricted gfp_t
>> arch/arm64/kernel/hibernate.c:478:23: sparse: sparse: not a function hibernate_exit

vim +478 arch/arm64/kernel/hibernate.c

82869ac57b5d3b James Morse    2016-04-27  399  
2521cb89860979 Mark Rutland   2023-10-09  400  void __noreturn swsusp_arch_suspend_exit(phys_addr_t zero_page,
2521cb89860979 Mark Rutland   2023-10-09  401  					 phys_addr_t temp_pgd,
2521cb89860979 Mark Rutland   2023-10-09  402  					 void *pblist,
2521cb89860979 Mark Rutland   2023-10-09  403  					 void *kstart,
2521cb89860979 Mark Rutland   2023-10-09  404  					 void *kend,
2521cb89860979 Mark Rutland   2023-10-09  405  					 phys_addr_t cpu_resume,
2521cb89860979 Mark Rutland   2023-10-09  406  					 unsigned long el2);
2521cb89860979 Mark Rutland   2023-10-09  407  
82869ac57b5d3b James Morse    2016-04-27  408  /*
82869ac57b5d3b James Morse    2016-04-27  409   * Setup then Resume from the hibernate image using swsusp_arch_suspend_exit().
82869ac57b5d3b James Morse    2016-04-27  410   *
82869ac57b5d3b James Morse    2016-04-27  411   * Memory allocated by get_safe_page() will be dealt with by the hibernate code,
82869ac57b5d3b James Morse    2016-04-27  412   * we don't need to free it here.
82869ac57b5d3b James Morse    2016-04-27  413   */
82869ac57b5d3b James Morse    2016-04-27  414  int swsusp_arch_resume(void)
82869ac57b5d3b James Morse    2016-04-27  415  {
a89d7ff933b015 Pavel Tatashin 2019-12-04  416  	int rc;
82869ac57b5d3b James Morse    2016-04-27  417  	void *zero_page;
82869ac57b5d3b James Morse    2016-04-27  418  	size_t exit_size;
82869ac57b5d3b James Morse    2016-04-27  419  	pgd_t *tmp_pg_dir;
788bfdd9743498 Pasha Tatashin 2021-09-30  420  	phys_addr_t el2_vectors;
2521cb89860979 Mark Rutland   2023-10-09  421  
2521cb89860979 Mark Rutland   2023-10-09  422  	typeof(swsusp_arch_suspend_exit) *hibernate_exit;
2521cb89860979 Mark Rutland   2023-10-09  423  
89d1410f4af55c Pavel Tatashin 2021-01-25  424  	struct trans_pgd_info trans_info = {
89d1410f4af55c Pavel Tatashin 2021-01-25  425  		.trans_alloc_page	= hibernate_page_alloc,
89d1410f4af55c Pavel Tatashin 2021-01-25 @426  		.trans_alloc_arg	= (void *)GFP_ATOMIC,
89d1410f4af55c Pavel Tatashin 2021-01-25  427  	};
82869ac57b5d3b James Morse    2016-04-27  428  
dfbca61af0b654 Mark Rutland   2016-08-11  429  	/*
dfbca61af0b654 Mark Rutland   2016-08-11  430  	 * Restoring the memory image will overwrite the ttbr1 page tables.
dfbca61af0b654 Mark Rutland   2016-08-11  431  	 * Create a second copy of just the linear map, and use this when
dfbca61af0b654 Mark Rutland   2016-08-11  432  	 * restoring.
dfbca61af0b654 Mark Rutland   2016-08-11  433  	 */
89d1410f4af55c Pavel Tatashin 2021-01-25  434  	rc = trans_pgd_create_copy(&trans_info, &tmp_pg_dir, PAGE_OFFSET,
89d1410f4af55c Pavel Tatashin 2021-01-25  435  				   PAGE_END);
dfbca61af0b654 Mark Rutland   2016-08-11  436  	if (rc)
a89d7ff933b015 Pavel Tatashin 2019-12-04  437  		return rc;
dfbca61af0b654 Mark Rutland   2016-08-11  438  
dfbca61af0b654 Mark Rutland   2016-08-11  439  	/*
189129aecb5302 Xiang wangx    2022-06-03  440  	 * We need a zero page that is zero before & after resume in order
dfbca61af0b654 Mark Rutland   2016-08-11  441  	 * to break before make on the ttbr1 page tables.
dfbca61af0b654 Mark Rutland   2016-08-11  442  	 */
dfbca61af0b654 Mark Rutland   2016-08-11  443  	zero_page = (void *)get_safe_page(GFP_ATOMIC);
dfbca61af0b654 Mark Rutland   2016-08-11  444  	if (!zero_page) {
117f5727ae058d Mark Rutland   2017-01-09  445  		pr_err("Failed to allocate zero page.\n");
a89d7ff933b015 Pavel Tatashin 2019-12-04  446  		return -ENOMEM;
dfbca61af0b654 Mark Rutland   2016-08-11  447  	}
dfbca61af0b654 Mark Rutland   2016-08-11  448  
788bfdd9743498 Pasha Tatashin 2021-09-30  449  	if (el2_reset_needed()) {
788bfdd9743498 Pasha Tatashin 2021-09-30  450  		rc = trans_pgd_copy_el2_vectors(&trans_info, &el2_vectors);
788bfdd9743498 Pasha Tatashin 2021-09-30  451  		if (rc) {
788bfdd9743498 Pasha Tatashin 2021-09-30  452  			pr_err("Failed to setup el2 vectors\n");
788bfdd9743498 Pasha Tatashin 2021-09-30  453  			return rc;
788bfdd9743498 Pasha Tatashin 2021-09-30  454  		}
788bfdd9743498 Pasha Tatashin 2021-09-30  455  	}
788bfdd9743498 Pasha Tatashin 2021-09-30  456  
82869ac57b5d3b James Morse    2016-04-27  457  	exit_size = __hibernate_exit_text_end - __hibernate_exit_text_start;
82869ac57b5d3b James Morse    2016-04-27  458  	/*
82869ac57b5d3b James Morse    2016-04-27  459  	 * Copy swsusp_arch_suspend_exit() to a safe page. This will generate
82869ac57b5d3b James Morse    2016-04-27  460  	 * a new set of ttbr0 page tables and load them.
82869ac57b5d3b James Morse    2016-04-27  461  	 */
82869ac57b5d3b James Morse    2016-04-27  462  	rc = create_safe_exec_page(__hibernate_exit_text_start, exit_size,
7018d467ff2d6a James Morse    2021-01-25  463  				   (phys_addr_t *)&hibernate_exit);
82869ac57b5d3b James Morse    2016-04-27  464  	if (rc) {
117f5727ae058d Mark Rutland   2017-01-09  465  		pr_err("Failed to create safe executable page for hibernate_exit code.\n");
a89d7ff933b015 Pavel Tatashin 2019-12-04  466  		return rc;
82869ac57b5d3b James Morse    2016-04-27  467  	}
82869ac57b5d3b James Morse    2016-04-27  468  
82869ac57b5d3b James Morse    2016-04-27  469  	/*
82869ac57b5d3b James Morse    2016-04-27  470  	 * KASLR will cause the el2 vectors to be in a different location in
82869ac57b5d3b James Morse    2016-04-27  471  	 * the resumed kernel. Load hibernate's temporary copy into el2.
82869ac57b5d3b James Morse    2016-04-27  472  	 *
82869ac57b5d3b James Morse    2016-04-27  473  	 * We can skip this step if we booted at EL1, or are running with VHE.
82869ac57b5d3b James Morse    2016-04-27  474  	 */
788bfdd9743498 Pasha Tatashin 2021-09-30  475  	if (el2_reset_needed())
82869ac57b5d3b James Morse    2016-04-27  476  		__hyp_set_vectors(el2_vectors);
82869ac57b5d3b James Morse    2016-04-27  477  
2521cb89860979 Mark Rutland   2023-10-09 @478  	hibernate_exit(virt_to_phys(zero_page),
2521cb89860979 Mark Rutland   2023-10-09  479  		       virt_to_phys(tmp_pg_dir),
2521cb89860979 Mark Rutland   2023-10-09  480  		       restore_pblist,
2521cb89860979 Mark Rutland   2023-10-09  481  		       phys_to_virt(resume_hdr.kernel_start),
2521cb89860979 Mark Rutland   2023-10-09  482  		       phys_to_virt(resume_hdr.kernel_end),
2521cb89860979 Mark Rutland   2023-10-09  483  		       resume_hdr.reenter_kernel,
2521cb89860979 Mark Rutland   2023-10-09  484  		       el2_reset_needed());
82869ac57b5d3b James Morse    2016-04-27  485  
a89d7ff933b015 Pavel Tatashin 2019-12-04  486  	return 0;
82869ac57b5d3b James Morse    2016-04-27  487  }
1fe492ce6482b7 James Morse    2016-04-27  488  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
