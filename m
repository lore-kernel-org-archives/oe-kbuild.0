Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B6922576E
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Sep 2026 05:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788844319; cv=none; b=HUdAdyofoA2Wv2ctIE3qMMkfOb05EsrVETuxF+8d6zWsQcNmar7Z1TfeBpQOKkXBXBbbrxsFkw2gcnPWW6yJ9PhtBxSt1WO0tU0+jDiWDqpfXSrhQwjHvfoGjf+0PNFiHGFfEGdlI+eCRsS6D+RCujaM7lZCmOi1g9cJalq5iWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788844319; c=relaxed/simple;
	bh=o0yk639j9+ed56suJUXCrUalgPGdUnNErCn6m/Rn51Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WdTtzkr5sK5e+sT3/7p8qIkQwMCv5z6aeIqjGuf6aZ87+Ui+IU7Dhwaw31/KS5LZnaxJYugofeaPZ/qkMNJAAmWvL1BXkcjxeCba7o5ZvVUkeASSSswOcPeaHFgW53WyTodNohuoLylJ/2ZeLXfWnHiCx3cGLhPhlfWjeY9xHoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLuLV5YG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLuLV5YG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788844317; x=1820380317;
  h=date:from:to:cc:subject:message-id;
  bh=o0yk639j9+ed56suJUXCrUalgPGdUnNErCn6m/Rn51Y=;
  b=NLuLV5YGJX/lqvulhUevSAXH9fyIi11RO/JJ+1RIBu9CjWro8UNXqUwx
   fHY0xYCdprotd6xlnSH2CfmWGDCRkR+dVtiuJYBn6y6Hf5xUkxx5DT3sm
   qlaUVCYT9/hfOPY/cOkD0A3SrH04+20xxl43oEkK/hcWMo/u2uJA42kA+
   lIzFphdrr75LjA+ndVC0GQfvKBJWIuLSzgV6d1yXDL5ezDR8OZHI/vK2U
   8TwgzDLvjKF3WQu5KMdXgyjbtK1BWALA4InF41+A/h08OblaZb3rAI4qv
   LKpRhpqmnroO1hvvtizT08IGKLUyzvCF7cBXMUZsDUkzmoPRV5EUh2h2y
   Q==;
X-CSE-ConnectionGUID: KItqyM77Sw+5j2cI7lot5w==
X-CSE-MsgGUID: fIBBDTkSRFCCcjRKePyc2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91745568"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="91745568"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 22:11:56 -0700
X-CSE-ConnectionGUID: BSouRRGDSJqq2GKRfCdqEA==
X-CSE-MsgGUID: TjFngZF5QvejkQbpaf+/zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="269148906"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Sep 2026 22:11:54 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3o7c-000000001h5-2MaF;
	Tue, 08 Sep 2026 05:11:52 +0000
Date: Tue, 08 Sep 2026 13:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/module/main.c:3539:36: error: no member named
 'percpu' in 'struct module'
Message-ID: <202609081340.FoXEyd2C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Hao-Ge/alloc_tag-move-release_module_tags-above-reserve_module_tags/20260907-142410, commit: 2979f3ee71076a2531a838b6f884721b325390ef"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hao Ge <hao.ge@linux.dev>
CC: 0day robot <lkp@intel.com>

Hi Hao,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Hao-Ge/alloc_tag-move-release_module_tags-above-reserve_module_tags/20260907-142410
head:   49d142f29125eca7f6f31cefd262b489da60dcb3
commit: 2979f3ee71076a2531a838b6f884721b325390ef module: introduce SH_ENTSIZE_STANDALONE for separately allocated sections
date:   21 hours ago
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-141-20260908 (https://download.01.org/0day-ci/archive/20260908/202609081340.FoXEyd2C-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081340.FoXEyd2C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609081340.FoXEyd2C-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/module/main.c:3539:36: error: no member named 'percpu' in 'struct module'
    3539 |                         (unsigned long)per_cpu_ptr(mod->percpu, get_boot_cpu_id());
         |                                                    ~~~  ^
>> kernel/module/main.c:3539:36: error: no member named 'percpu' in 'struct module'
    3539 |                         (unsigned long)per_cpu_ptr(mod->percpu, get_boot_cpu_id());
         |                                                    ~~~  ^
>> kernel/module/main.c:3539:36: error: no member named 'percpu' in 'struct module'
    3539 |                         (unsigned long)per_cpu_ptr(mod->percpu, get_boot_cpu_id());
         |                                                    ~~~  ^
   3 errors generated.


vim +3539 kernel/module/main.c

85e6f61c134f11 kernel/module/main.c Luis Chamberlain          2023-03-19  3430  
24b9f0d2208145 kernel/module.c      Sergey Shtylyov           2020-11-07  3431  /*
24b9f0d2208145 kernel/module.c      Sergey Shtylyov           2020-11-07  3432   * Allocate and load the module: note that size of section 0 is always
24b9f0d2208145 kernel/module.c      Sergey Shtylyov           2020-11-07  3433   * zero, and we rely on this for optional sections.
24b9f0d2208145 kernel/module.c      Sergey Shtylyov           2020-11-07  3434   */
2f3238aebedb24 kernel/module.c      Rusty Russell             2012-10-22  3435  static int load_module(struct load_info *info, const char __user *uargs,
2f3238aebedb24 kernel/module.c      Rusty Russell             2012-10-22  3436  		       int flags)
d913188c751911 kernel/module.c      Rusty Russell             2010-08-05  3437  {
a3535c7e4f4495 kernel/module.c      Rusty Russell             2013-01-21  3438  	struct module *mod;
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain          2023-03-28  3439  	bool module_allocated = false;
5fdc7db6448a4f kernel/module.c      Jessica Yu                2018-06-22  3440  	long err = 0;
6b722d1ec0384d kernel/module/main.c Petr Pavlu                2026-06-04  3441  	char *args = NULL, *after_dashes;
d913188c751911 kernel/module.c      Rusty Russell             2010-08-05  3442  
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3443  	/*
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3444  	 * Do the signature check (if any) first. All that
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3445  	 * the signature check needs is info->len, it does
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3446  	 * not need any of the section info. That can be
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3447  	 * set up later. This will minimize the chances
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3448  	 * of a corrupt module causing problems before
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3449  	 * we even get to the signature check.
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3450  	 *
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3451  	 * The check will also adjust info->len by stripping
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3452  	 * off the sig length at the end of the module, making
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3453  	 * checks against info->len more correct.
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3454  	 */
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3455  	err = module_sig_check(info, flags);
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3456  	if (err)
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3457  		goto free_copy;
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3458  
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3459  	/*
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3460  	 * Do basic sanity checks against the ELF header and
3d40bb903ed1f6 kernel/module/main.c Luis Chamberlain          2023-03-19  3461  	 * sections. Cache useful sections and set the
3d40bb903ed1f6 kernel/module/main.c Luis Chamberlain          2023-03-19  3462  	 * info->mod to the userspace passed struct module.
ec2a29593c83ed kernel/module.c      Frank van der Linden      2021-01-14  3463  	 */
3d40bb903ed1f6 kernel/module/main.c Luis Chamberlain          2023-03-19  3464  	err = elf_validity_cache_copy(info, flags);
5fdc7db6448a4f kernel/module.c      Jessica Yu                2018-06-22  3465  	if (err)
5fdc7db6448a4f kernel/module.c      Jessica Yu                2018-06-22  3466  		goto free_copy;
5fdc7db6448a4f kernel/module.c      Jessica Yu                2018-06-22  3467  
85e6f61c134f11 kernel/module/main.c Luis Chamberlain          2023-03-19  3468  	err = early_mod_check(info, flags);
d913188c751911 kernel/module.c      Rusty Russell             2010-08-05  3469  	if (err)
34e1169d996ab1 kernel/module.c      Kees Cook                 2012-10-16  3470  		goto free_copy;
d913188c751911 kernel/module.c      Rusty Russell             2010-08-05  3471  
d913188c751911 kernel/module.c      Rusty Russell             2010-08-05  3472  	/* Figure out module layout, and allocate all the memory. */
2f3238aebedb24 kernel/module.c      Rusty Russell             2012-10-22  3473  	mod = layout_and_allocate(info, flags);
65b8a9b4d55253 kernel/module.c      Linus Torvalds            2010-08-05  3474  	if (IS_ERR(mod)) {
65b8a9b4d55253 kernel/module.c      Linus Torvalds            2010-08-05  3475  		err = PTR_ERR(mod);
d913188c751911 kernel/module.c      Rusty Russell             2010-08-05  3476  		goto free_copy;
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3477  	}
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3478  
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain          2023-03-28  3479  	module_allocated = true;
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain          2023-03-28  3480  
ae1ae11fb277f1 kernel/module/main.c Richard Guy Briggs        2025-06-13  3481  	audit_log_kern_module(info->name);
ca86cad7380e37 kernel/module.c      Richard Guy Briggs        2017-02-04  3482  
a3535c7e4f4495 kernel/module.c      Rusty Russell             2013-01-21  3483  	/* Reserve our place in the list. */
a3535c7e4f4495 kernel/module.c      Rusty Russell             2013-01-21  3484  	err = add_unformed_module(mod);
1fb9341ac34825 kernel/module.c      Rusty Russell             2013-01-12  3485  	if (err)
1fb9341ac34825 kernel/module.c      Rusty Russell             2013-01-12  3486  		goto free_module;
1fb9341ac34825 kernel/module.c      Rusty Russell             2013-01-12  3487  
a12b94511cf368 kernel/module/main.c Luis Chamberlain          2023-03-19  3488  	/*
a12b94511cf368 kernel/module/main.c Luis Chamberlain          2023-03-19  3489  	 * We are tainting your kernel if your module gets into
a12b94511cf368 kernel/module/main.c Luis Chamberlain          2023-03-19  3490  	 * the modules linked list somehow.
a12b94511cf368 kernel/module/main.c Luis Chamberlain          2023-03-19  3491  	 */
a12b94511cf368 kernel/module/main.c Luis Chamberlain          2023-03-19  3492  	module_augment_kernel_taints(mod, info);
106a4ee258d148 kernel/module.c      Rusty Russell             2012-09-26  3493  
8d8022e8aba851 kernel/module.c      Rusty Russell             2013-07-03  3494  	/* To avoid stressing percpu allocator, do this once we're unique. */
9eb76d7797b892 kernel/module.c      Rusty Russell             2013-07-03  3495  	err = percpu_modalloc(mod, info);
8d8022e8aba851 kernel/module.c      Rusty Russell             2013-07-03  3496  	if (err)
8d8022e8aba851 kernel/module.c      Rusty Russell             2013-07-03  3497  		goto unlink_mod;
8d8022e8aba851 kernel/module.c      Rusty Russell             2013-07-03  3498  
49668688dd5a5f kernel/module.c      Rusty Russell             2010-08-05  3499  	/* Now module is in final location, initialize linked lists, etc. */
9f85a4bbb1cf56 kernel/module.c      Rusty Russell             2010-08-05  3500  	err = module_unload_init(mod);
9f85a4bbb1cf56 kernel/module.c      Rusty Russell             2010-08-05  3501  	if (err)
1fb9341ac34825 kernel/module.c      Rusty Russell             2013-01-12  3502  		goto unlink_mod;
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3503  
cf2fde7b39e944 kernel/module.c      Rusty Russell             2015-06-26  3504  	init_param_lock(mod);
b51d23e4e9fea6 kernel/module.c      Dan Streetman             2015-06-17  3505  
24b9f0d2208145 kernel/module.c      Sergey Shtylyov           2020-11-07  3506  	/*
24b9f0d2208145 kernel/module.c      Sergey Shtylyov           2020-11-07  3507  	 * Now we've got everything in the final locations, we can
24b9f0d2208145 kernel/module.c      Sergey Shtylyov           2020-11-07  3508  	 * find optional sections.
24b9f0d2208145 kernel/module.c      Sergey Shtylyov           2020-11-07  3509  	 */
eb3057df732c30 kernel/module.c      Frantisek Hrbata          2013-10-14  3510  	err = find_module_sections(mod, info);
eb3057df732c30 kernel/module.c      Frantisek Hrbata          2013-10-14  3511  	if (err)
eb3057df732c30 kernel/module.c      Frantisek Hrbata          2013-10-14  3512  		goto free_unload;
9b37ccfc637be2 kernel/module.c      Pavel Roskin              2008-02-28  3513  
55fcb926b6d8b5 kernel/module/main.c Siddharth Nayyar          2026-03-26  3514  	err = check_export_symbol_sections(mod);
22e268ebecc549 kernel/module.c      Rusty Russell             2010-08-05  3515  	if (err)
22e268ebecc549 kernel/module.c      Rusty Russell             2010-08-05  3516  		goto free_unload;
9841d61d75da5e kernel/module.c      Dave Jones                2006-01-08  3517  
c988d2b2845495 kernel/module.c      Matt Domsch               2005-06-23  3518  	/* Set up MODINFO_ATTR fields */
520b1a147d918e kernel/module/main.c Peter Zijlstra            2025-05-02  3519  	err = setup_modinfo(mod, info);
520b1a147d918e kernel/module/main.c Peter Zijlstra            2025-05-02  3520  	if (err)
520b1a147d918e kernel/module/main.c Peter Zijlstra            2025-05-02  3521  		goto free_modinfo;
c988d2b2845495 kernel/module.c      Matt Domsch               2005-06-23  3522  
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3523  	/* Fix up syms, so that st_value is a pointer to location. */
34e1169d996ab1 kernel/module.c      Kees Cook                 2012-10-16  3524  	err = simplify_symbols(mod, info);
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3525  	if (err < 0)
d913188c751911 kernel/module.c      Rusty Russell             2010-08-05  3526  		goto free_modinfo;
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3527  
34e1169d996ab1 kernel/module.c      Kees Cook                 2012-10-16  3528  	err = apply_relocations(mod, info);
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3529  	if (err < 0)
d913188c751911 kernel/module.c      Rusty Russell             2010-08-05  3530  		goto free_modinfo;
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3531  
34e1169d996ab1 kernel/module.c      Kees Cook                 2012-10-16  3532  	err = post_relocation(mod, info);
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3533  	if (err < 0)
d913188c751911 kernel/module.c      Rusty Russell             2010-08-05  3534  		goto free_modinfo;
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3535  
2979f3ee71076a kernel/module/main.c Hao Ge                    2026-09-07  3536  	/* The percpu ELF section is a template; report the boot CPU instance. */
2979f3ee71076a kernel/module/main.c Hao Ge                    2026-09-07  3537  	if (info->index.pcpu)
2979f3ee71076a kernel/module/main.c Hao Ge                    2026-09-07  3538  		info->sechdrs[info->index.pcpu].sh_addr =
2979f3ee71076a kernel/module/main.c Hao Ge                    2026-09-07 @3539  			(unsigned long)per_cpu_ptr(mod->percpu, get_boot_cpu_id());
2979f3ee71076a kernel/module/main.c Hao Ge                    2026-09-07  3540  
22e268ebecc549 kernel/module.c      Rusty Russell             2010-08-05  3541  	flush_module_icache(mod);
378bac820be6a0 kernel/module.c      Thomas Koeller            2005-09-06  3542  
6526c534b2677c kernel/module.c      Rusty Russell             2010-08-05  3543  	/* Now copy in args */
6b722d1ec0384d kernel/module/main.c Petr Pavlu                2026-06-04  3544  	args = strndup_user(uargs, ~0UL >> 1);
6b722d1ec0384d kernel/module/main.c Petr Pavlu                2026-06-04  3545  	if (IS_ERR(args)) {
6b722d1ec0384d kernel/module/main.c Petr Pavlu                2026-06-04  3546  		err = PTR_ERR(args);
6526c534b2677c kernel/module.c      Rusty Russell             2010-08-05  3547  		goto free_arch_cleanup;
6526c534b2677c kernel/module.c      Rusty Russell             2010-08-05  3548  	}
8d3b33f67fdc0f kernel/module.c      Rusty Russell             2006-03-25  3549  
9294523e376803 kernel/module.c      Stephen Boyd              2021-07-07  3550  	init_build_id(mod, info);
ff49d74ad383f5 kernel/module.c      Yehuda Sadeh              2010-07-03  3551  
a949ae560a511f kernel/module.c      Steven Rostedt (Red Hat   2014-04-24  3552) 	/* Ftrace init must be called in the MODULE_STATE_UNFORMED state */
a949ae560a511f kernel/module.c      Steven Rostedt (Red Hat   2014-04-24  3553) 	ftrace_module_init(mod);
a949ae560a511f kernel/module.c      Steven Rostedt (Red Hat   2014-04-24  3554) 
a3535c7e4f4495 kernel/module.c      Rusty Russell             2013-01-21  3555  	/* Finally it's fully formed, ready to start executing. */
a3535c7e4f4495 kernel/module.c      Rusty Russell             2013-01-21  3556  	err = complete_formation(mod, info);
a3535c7e4f4495 kernel/module.c      Rusty Russell             2013-01-21  3557  	if (err)
1fb9341ac34825 kernel/module.c      Rusty Russell             2013-01-12  3558  		goto ddebug_cleanup;
be593f4ce4eb1b kernel/module.c      Rusty Russell             2010-06-05  3559  
4c973d1620ae08 kernel/module.c      Jessica Yu                2016-03-16  3560  	err = prepare_coming_module(mod);
4c973d1620ae08 kernel/module.c      Jessica Yu                2016-03-16  3561  	if (err)
4c973d1620ae08 kernel/module.c      Jessica Yu                2016-03-16  3562  		goto bug_cleanup;
4c973d1620ae08 kernel/module.c      Jessica Yu                2016-03-16  3563  
ae39e9ed964f8e kernel/module/main.c Saravana Kannan           2022-06-03  3564  	mod->async_probe_requested = async_probe;
ae39e9ed964f8e kernel/module/main.c Saravana Kannan           2022-06-03  3565  
51f3d0f474aaeb kernel/module.c      Rusty Russell             2010-08-05  3566  	/* Module is ready to execute: parsing args may do that. */
6b722d1ec0384d kernel/module/main.c Petr Pavlu                2026-06-04  3567  	after_dashes = parse_args(mod->name, args, mod->kp, mod->num_kp,
4355efbd80482a kernel/module.c      Luis R. Rodriguez         2016-02-03  3568  				  -32768, 32767, mod,
ecc8617053e0a9 kernel/module.c      Luis R. Rodriguez         2015-03-30  3569  				  unknown_module_param_cb);
51e158c12aca3c kernel/module.c      Rusty Russell             2014-04-28  3570  	if (IS_ERR(after_dashes)) {
51e158c12aca3c kernel/module.c      Rusty Russell             2014-04-28  3571  		err = PTR_ERR(after_dashes);
4c973d1620ae08 kernel/module.c      Jessica Yu                2016-03-16  3572  		goto coming_cleanup;
51e158c12aca3c kernel/module.c      Rusty Russell             2014-04-28  3573  	} else if (after_dashes) {
51e158c12aca3c kernel/module.c      Rusty Russell             2014-04-28  3574  		pr_warn("%s: parameters '%s' after `--' ignored\n",
51e158c12aca3c kernel/module.c      Rusty Russell             2014-04-28  3575  		       mod->name, after_dashes);
51e158c12aca3c kernel/module.c      Rusty Russell             2014-04-28  3576  	}
6b722d1ec0384d kernel/module/main.c Petr Pavlu                2026-06-04  3577  	kfree(args);
6b722d1ec0384d kernel/module/main.c Petr Pavlu                2026-06-04  3578  	args = NULL;
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3579  
ca86cad7380e37 kernel/module.c      Richard Guy Briggs        2017-02-04  3580  	/* Link in to sysfs. */
34e1169d996ab1 kernel/module.c      Kees Cook                 2012-10-16  3581  	err = mod_sysfs_setup(mod, info, mod->kp, mod->num_kp);
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3582  	if (err < 0)
4c973d1620ae08 kernel/module.c      Jessica Yu                2016-03-16  3583  		goto coming_cleanup;
80a3d1bb410e00 kernel/module.c      Rusty Russell             2010-06-05  3584  
1ce15ef4f60529 kernel/module.c      Jessica Yu                2016-03-22  3585  	if (is_livepatch_module(mod)) {
1ce15ef4f60529 kernel/module.c      Jessica Yu                2016-03-22  3586  		err = copy_module_elf(mod, info);
1ce15ef4f60529 kernel/module.c      Jessica Yu                2016-03-22  3587  		if (err < 0)
1ce15ef4f60529 kernel/module.c      Jessica Yu                2016-03-22  3588  			goto sysfs_cleanup;
1ce15ef4f60529 kernel/module.c      Jessica Yu                2016-03-22  3589  	}
1ce15ef4f60529 kernel/module.c      Jessica Yu                2016-03-22  3590  
fb05da8ab404b2 kernel/module/main.c Hao Ge                    2026-08-27  3591  	err = codetag_load_module(mod);
fb05da8ab404b2 kernel/module/main.c Hao Ge                    2026-08-27  3592  	if (err)
fb05da8ab404b2 kernel/module/main.c Hao Ge                    2026-08-27  3593  		goto livepatch_cleanup;
044d2aee6c5752 kernel/module/main.c Suren Baghdasaryan        2025-05-21  3594  
48fd11880b5ef0 kernel/module.c      Kevin Cernekee            2012-01-13  3595  	/* Get rid of temporary copy. */
b1ae6dc41eaaa9 kernel/module.c      Dmitry Torokhov           2022-01-05  3596  	free_copy(info, flags);
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3597  
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3598  	/* Done! */
51f3d0f474aaeb kernel/module.c      Rusty Russell             2010-08-05  3599  	trace_module_load(mod);
34e1169d996ab1 kernel/module.c      Kees Cook                 2012-10-16  3600  
34e1169d996ab1 kernel/module.c      Kees Cook                 2012-10-16  3601  	return do_init_module(mod);
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3602  
fb05da8ab404b2 kernel/module/main.c Hao Ge                    2026-08-27  3603   livepatch_cleanup:
fb05da8ab404b2 kernel/module/main.c Hao Ge                    2026-08-27  3604  	if (is_livepatch_module(mod))
fb05da8ab404b2 kernel/module/main.c Hao Ge                    2026-08-27  3605  		free_module_elf(mod);
1ce15ef4f60529 kernel/module.c      Jessica Yu                2016-03-22  3606   sysfs_cleanup:
1ce15ef4f60529 kernel/module.c      Jessica Yu                2016-03-22  3607  	mod_sysfs_teardown(mod);
4c973d1620ae08 kernel/module.c      Jessica Yu                2016-03-16  3608   coming_cleanup:
885a78d4a5b3ad kernel/module.c      Aaron Tomlin              2016-10-20  3609  	mod->state = MODULE_STATE_GOING;
deffe1edba626d kernel/module/main.c Petr Pavlu                2026-03-13  3610  	module_destroy_params(mod->kp, mod->num_kp);
4c973d1620ae08 kernel/module.c      Jessica Yu                2016-03-16  3611  	blocking_notifier_call_chain(&module_notify_list,
4c973d1620ae08 kernel/module.c      Jessica Yu                2016-03-16  3612  				     MODULE_STATE_GOING, mod);
7e545d6eca20ce kernel/module.c      Jessica Yu                2016-03-16  3613  	klp_module_going(mod);
1fb9341ac34825 kernel/module.c      Rusty Russell             2013-01-12  3614   bug_cleanup:
5e8ed280dab9ee kernel/module.c      Miroslav Benes            2020-10-27  3615  	mod->state = MODULE_STATE_GOING;
1fb9341ac34825 kernel/module.c      Rusty Russell             2013-01-12  3616  	/* module_bug_cleanup needs module_mutex protection */
75676500f8298f kernel/module.c      Rusty Russell             2010-06-05  3617  	mutex_lock(&module_mutex);
5336377d622595 kernel/module.c      Linus Torvalds            2010-10-05  3618  	module_bug_cleanup(mod);
ee61abb3223e28 kernel/module.c      Linus Torvalds            2013-01-20  3619  	mutex_unlock(&module_mutex);
ff7e0055bb5ddb kernel/module.c      Andy Lutomirski           2014-08-16  3620  
a3535c7e4f4495 kernel/module.c      Rusty Russell             2013-01-21  3621   ddebug_cleanup:
1323eac7fd6560 kernel/module.c      Namit Gupta               2018-01-08  3622  	ftrace_release_mod(mod);
cb2f55369d3a9e kernel/module.c      Paul E. McKenney          2018-11-06  3623  	synchronize_rcu();
6b722d1ec0384d kernel/module/main.c Petr Pavlu                2026-06-04  3624  	kfree(args);
6526c534b2677c kernel/module.c      Rusty Russell             2010-08-05  3625   free_arch_cleanup:
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3626  	module_arch_cleanup(mod);
d913188c751911 kernel/module.c      Rusty Russell             2010-08-05  3627   free_modinfo:
a263f7763c3640 kernel/module.c      Rusty Russell             2009-09-25  3628  	free_modinfo(mod);
22e268ebecc549 kernel/module.c      Rusty Russell             2010-08-05  3629   free_unload:
^1da177e4c3f41 kernel/module.c      Linus Torvalds            2005-04-16  3630  	module_unload_free(mod);
1fb9341ac34825 kernel/module.c      Rusty Russell             2013-01-12  3631   unlink_mod:
1fb9341ac34825 kernel/module.c      Rusty Russell             2013-01-12  3632  	mutex_lock(&module_mutex);
1fb9341ac34825 kernel/module.c      Rusty Russell             2013-01-12  3633  	/* Unlink carefully: kallsyms could be walking list. */
1fb9341ac34825 kernel/module.c      Rusty Russell             2013-01-12  3634  	list_del_rcu(&mod->list);
758556bdc1c8a8 kernel/module.c      Peter Zijlstra            2015-07-09  3635  	mod_tree_remove(mod);
1fb9341ac34825 kernel/module.c      Rusty Russell             2013-01-12  3636  	wake_up_all(&module_wq);
0be964be0d4508 kernel/module.c      Peter Zijlstra            2015-05-27  3637  	/* Wait for RCU-sched synchronizing before releasing mod->list. */
cb2f55369d3a9e kernel/module.c      Paul E. McKenney          2018-11-06  3638  	synchronize_rcu();
1fb9341ac34825 kernel/module.c      Rusty Russell             2013-01-12  3639  	mutex_unlock(&module_mutex);
d913188c751911 kernel/module.c      Rusty Russell             2010-08-05  3640   free_module:
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain          2023-03-28  3641  	mod_stat_bump_invalid(info, flags);
c287c072332905 kernel/module/main.c Mike Rapoport (Microsoft  2025-01-26  3642) 	module_memory_restore_rox(mod);
34e1169d996ab1 kernel/module.c      Kees Cook                 2012-10-16  3643  	module_deallocate(mod, info);
d913188c751911 kernel/module.c      Rusty Russell             2010-08-05  3644   free_copy:
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain          2023-03-28  3645  	/*
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain          2023-03-28  3646  	 * The info->len is always set. We distinguish between
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain          2023-03-28  3647  	 * failures once the proper module was allocated and
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain          2023-03-28  3648  	 * before that.
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain          2023-03-28  3649  	 */
ae1ae11fb277f1 kernel/module/main.c Richard Guy Briggs        2025-06-13  3650  	if (!module_allocated) {
ae1ae11fb277f1 kernel/module/main.c Richard Guy Briggs        2025-06-13  3651  		audit_log_kern_module(info->name ? info->name : "?");
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain          2023-03-28  3652  		mod_stat_bump_becoming(info, flags);
ae1ae11fb277f1 kernel/module/main.c Richard Guy Briggs        2025-06-13  3653  	}
b1ae6dc41eaaa9 kernel/module.c      Dmitry Torokhov           2022-01-05  3654  	free_copy(info, flags);
34e1169d996ab1 kernel/module.c      Kees Cook                 2012-10-16  3655  	return err;
b99b87f70c7785 kernel/module.c      Peter Oberparleiter       2009-06-17  3656  }
b99b87f70c7785 kernel/module.c      Peter Oberparleiter       2009-06-17  3657  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
