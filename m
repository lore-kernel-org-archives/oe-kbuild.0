Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689F2E1746
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782126376; cv=none; b=uhQeOzKTwHOzzoX954sJ87AHRPTJSihkLkENgyfrKqg/+IY2IJ5Y0Ko9yGaHOTBcmF6whFialCB/JDgFbQ58PQCeMTLElcX8d7xrW7XzRiOwa3yU/CBlQKZGphn8MyrRGz6e603NrBEiJMXDmGxiFe+jJHKjBGjlUZMYBnExe+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782126376; c=relaxed/simple;
	bh=tgL1i5T2jsBuNIlwz1boeDGDfRPc2BEVLof10sDMTaA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N+a1xDhEj7UFDbJYoOu0anChW6WkMUQR0xj/yJgsSyTVOXT5TRa+QuqLE+kSzLUffGSyycJT/eF7PjLlRnGHYsGrdWNZPgPk6rudqGHjCly132hDpI0FLGSe92EW1+eH9OumTVmzO5hyqEjPrERwP4mK6++bKy9XIhyDi6VCYyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nndTLF3+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nndTLF3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782126374; x=1813662374;
  h=date:from:to:cc:subject:message-id;
  bh=tgL1i5T2jsBuNIlwz1boeDGDfRPc2BEVLof10sDMTaA=;
  b=nndTLF3+sMzY6HyPmEds262VTatxSnziXqwMNxVZp11gawmssg2UKaph
   qwOYVaqCHOyR6twN2YeiEE5J6rlPvyibtCfAgHNfh4/UF1ZAxLExJXMBx
   jUEeBeoGtBJkva7weYrGyfWQnZjEVQuhE5WfrHKK7Jw38M25ksrsvQSZk
   iU1rMC+msZDt4sQkjeCpeSHIBc37/cEXyvrD0Rtk1ohsoGBSKhgnPOcJL
   JGFlFMbrmD45h2h3d3X548ieUs3ku+bn3v62sM7+CaW2QogcDjST3L0Ee
   5LvRMh04b7oGMKtJdJvD3glSzjAWTDNYliHYIU8lqPfcm6j47J8svk1L2
   g==;
X-CSE-ConnectionGUID: Usl8DNttRJeVXdfQ4oavlA==
X-CSE-MsgGUID: +Rb8VasPRoiLtgf+FrqEIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82720979"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="82720979"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 04:05:41 -0700
X-CSE-ConnectionGUID: oNprUdlBQq2MvYuhqufJYQ==
X-CSE-MsgGUID: kf16JbJyRbu5DoWJL4NMGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="287315303"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Jun 2026 04:05:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbcT8-0000000012f-16AI;
	Mon, 22 Jun 2026 11:05:35 +0000
Date: Mon, 22 Jun 2026 19:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/um/kernel/um_arch.c:330 linux_main() warn: impossible
 condition '(task_size > 1024 * (1 << 22)) => (4294955008 > 4294967296)'
Message-ID: <202606221814.b1Gnmwf9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: de203267483de10bdfc3ec74fac246e879361819 um: Use PAGE_ALIGN() for address alignment
date:   8 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 months ago
config: um-randconfig-r072-20260622 (https://download.01.org/0day-ci/archive/20260622/202606221814.b1Gnmwf9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: de203267483d ("um: Use PAGE_ALIGN() for address alignment")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606221814.b1Gnmwf9-lkp@intel.com/

smatch warnings:
arch/um/kernel/um_arch.c:330 linux_main() warn: impossible condition '(task_size > 1024 * (1 << 22)) => (4294955008 > 4294967296)'

vim +330 arch/um/kernel/um_arch.c

68b9883cc16ec2 Benjamin Berg                  2024-09-19  299  
68b9883cc16ec2 Benjamin Berg                  2024-09-19  300  int __init linux_main(int argc, char **argv, char **envp)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  301  {
^1da177e4c3f41 Linus Torvalds                 2005-04-16  302  	unsigned long avail, diff;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  303  	unsigned long virtmem_size, max_physmem;
691ff5914835a6 Tiwei Bie                      2025-10-27  304  	unsigned long host_task_size;
60a2988aea701a Jeff Dike                      2008-05-12  305  	unsigned long stack;
3af9c5bed1b8f2 WANG Cong                      2008-04-28  306  	unsigned int i;
3af9c5bed1b8f2 WANG Cong                      2008-04-28  307  	int add;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  308  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  309  	for (i = 1; i < argc; i++) {
ba180fd437156f Jeff Dike                      2007-10-16  310  		if ((i == 1) && (argv[i][0] == ' '))
ba180fd437156f Jeff Dike                      2007-10-16  311  			continue;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  312  		add = 1;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  313  		uml_checksetup(argv[i], &add);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  314  		if (add)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  315  			add_arg(argv[i]);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  316  	}
^1da177e4c3f41 Linus Torvalds                 2005-04-16  317  	if (have_root == 0)
d7ffac33631b2f Thomas Meyer                   2021-01-05  318  		add_arg(DEFAULT_COMMAND_LINE_ROOT);
d7ffac33631b2f Thomas Meyer                   2021-01-05  319  
d7ffac33631b2f Thomas Meyer                   2021-01-05  320  	if (have_console == 0)
d7ffac33631b2f Thomas Meyer                   2021-01-05  321  		add_arg(DEFAULT_COMMAND_LINE_CONSOLE);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  322  
68b9883cc16ec2 Benjamin Berg                  2024-09-19  323  	host_task_size = get_top_address(envp);
91f0a0c5cc5bc8 Benjamin Berg                  2024-09-19  324  	/* reserve a few pages for the stubs */
e047f9af9d6948 Tiwei Bie                      2025-08-27  325  	stub_start = host_task_size - STUB_SIZE;
6032aca0deb9c1 Johannes Berg                  2023-04-14  326  	host_task_size = stub_start;
bfc58e2b98e997 Johannes Berg                  2021-01-13  327  
830003c73d1902 Benjamin Berg                  2024-09-19  328  	/* Limit TASK_SIZE to what is addressable by the page table */
830003c73d1902 Benjamin Berg                  2024-09-19  329  	task_size = host_task_size;
830003c73d1902 Benjamin Berg                  2024-09-19 @330  	if (task_size > (unsigned long long) PTRS_PER_PGD * PGDIR_SIZE)
830003c73d1902 Benjamin Berg                  2024-09-19  331  		task_size = PTRS_PER_PGD * PGDIR_SIZE;
830003c73d1902 Benjamin Berg                  2024-09-19  332  
536788fe2d28e1 Jeff Dike                      2008-02-08  333  	/*
536788fe2d28e1 Jeff Dike                      2008-02-08  334  	 * TASK_SIZE needs to be PGDIR_SIZE aligned or else exit_mmap craps
536788fe2d28e1 Jeff Dike                      2008-02-08  335  	 * out
536788fe2d28e1 Jeff Dike                      2008-02-08  336  	 */
830003c73d1902 Benjamin Berg                  2024-09-19  337  	task_size = task_size & PGDIR_MASK;
536788fe2d28e1 Jeff Dike                      2008-02-08  338  
ba180fd437156f Jeff Dike                      2007-10-16  339  	/* OS sanity checks that need to happen before the kernel runs */
60d339f6fe0831 Gennady Sharapov               2005-09-03  340  	os_early_checks();
cb66504d65e542 Paolo 'Blaisorblade' Giarrusso 2005-07-27  341  
d8fb32f4790f2a Anton Ivanov                   2021-03-12  342  	get_host_cpu_features(parse_host_cpu_flags, parse_cache_line);
d8fb32f4790f2a Anton Ivanov                   2021-03-12  343  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  344  	brk_start = (unsigned long) sbrk(0);
77bf4400319db9 Jeff Dike                      2007-10-16  345  
ba180fd437156f Jeff Dike                      2007-10-16  346  	/*
ba180fd437156f Jeff Dike                      2007-10-16  347  	 * Increase physical memory size for exec-shield users
ba180fd437156f Jeff Dike                      2007-10-16  348  	 * so they actually get what they asked for. This should
ba180fd437156f Jeff Dike                      2007-10-16  349  	 * add zero for non-exec shield users
ba180fd437156f Jeff Dike                      2007-10-16  350  	 */
^1da177e4c3f41 Linus Torvalds                 2005-04-16  351  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  352  	diff = UML_ROUND_UP(brk_start) - UML_ROUND_UP(&_end);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  353  	if (diff > 1024 * 1024) {
d3878bb8003009 Masami Hiramatsu               2017-05-18  354  		os_info("Adding %ld bytes to physical memory to account for "
^1da177e4c3f41 Linus Torvalds                 2005-04-16  355  			"exec-shield gap\n", diff);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  356  		physmem_size += UML_ROUND_UP(brk_start) - UML_ROUND_UP(&_end);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  357  	}
^1da177e4c3f41 Linus Torvalds                 2005-04-16  358  
05eacfd00ccf23 Nicolas Iooss                  2014-10-12  359  	uml_physmem = (unsigned long) __binary_start & PAGE_MASK;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  360  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  361  	/* Reserve up to 4M after the current brk */
^1da177e4c3f41 Linus Torvalds                 2005-04-16  362  	uml_reserved = ROUND_4M(brk_start) + (1 << 22);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  363  
96b644bdec977b Serge Hallyn                   2006-10-02  364  	setup_machinename(init_utsname()->machine);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  365  
de203267483de1 Tiwei Bie                      2025-10-27  366  	physmem_size = PAGE_ALIGN(physmem_size);
de203267483de1 Tiwei Bie                      2025-10-27  367  	iomem_size = PAGE_ALIGN(iomem_size);
cd05cbed42b731 Tiwei Bie                      2024-09-16  368  
536788fe2d28e1 Jeff Dike                      2008-02-08  369  	max_physmem = TASK_SIZE - uml_physmem - iomem_size - MIN_VMALLOC;
06e0e629595759 Tiwei Bie                      2024-11-28  370  	if (physmem_size > max_physmem) {
06e0e629595759 Tiwei Bie                      2024-11-28  371  		physmem_size = max_physmem;
cd05cbed42b731 Tiwei Bie                      2024-09-16  372  		os_info("Physical memory size shrunk to %llu bytes\n",
cd05cbed42b731 Tiwei Bie                      2024-09-16  373  			physmem_size);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  374  	}
^1da177e4c3f41 Linus Torvalds                 2005-04-16  375  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  376  	high_physmem = uml_physmem + physmem_size;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  377  	end_iomem = high_physmem + iomem_size;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  378  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  379  	start_vm = VMALLOC_START;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  380  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  381  	virtmem_size = physmem_size;
60a2988aea701a Jeff Dike                      2008-05-12  382  	stack = (unsigned long) argv;
60a2988aea701a Jeff Dike                      2008-05-12  383  	stack &= ~(1024 * 1024 - 1);
60a2988aea701a Jeff Dike                      2008-05-12  384  	avail = stack - start_vm;
ba180fd437156f Jeff Dike                      2007-10-16  385  	if (physmem_size > avail)
ba180fd437156f Jeff Dike                      2007-10-16  386  		virtmem_size = avail;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  387  	end_vm = start_vm + virtmem_size;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  388  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  389  	if (virtmem_size < physmem_size)
d3878bb8003009 Masami Hiramatsu               2017-05-18  390  		os_info("Kernel virtual memory size shrunk to %lu bytes\n",
^1da177e4c3f41 Linus Torvalds                 2005-04-16  391  			virtmem_size);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  392  
3f17fed2149192 Benjamin Berg                  2024-10-23  393  	arch_task_struct_size = sizeof(struct task_struct) + host_fp_size;
3f17fed2149192 Benjamin Berg                  2024-10-23  394  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  395  	os_flush_stdout();
^1da177e4c3f41 Linus Torvalds                 2005-04-16  396  
77bf4400319db9 Jeff Dike                      2007-10-16  397  	return start_uml();
^1da177e4c3f41 Linus Torvalds                 2005-04-16  398  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16  399  

:::::: The code at line 330 was first introduced by commit
:::::: 830003c73d190259e45d0a99a0e3d14cb73e0af0 um: Limit TASK_SIZE to the addressable range

:::::: TO: Benjamin Berg <benjamin.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
