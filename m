Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8551718D63A
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 20:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729285146; cv=none; b=ktEiMgclmTXS9qVSKHsVHKMErVdlhxfg7VR6A2NcLxGsmwqsKtXE7OnZ7DPgjs3a8XKU0COrSHAQjzv45EvBr0/46QTGu+DszOyA0B0gO1q0rAQSaN030/46UUSOA2SDG3+2cISM9GWWBGDM63kGbCKwJtcZEWdoKEfSDtgYhFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729285146; c=relaxed/simple;
	bh=nMlElz1bd9sZ9U304ijDJs6n1TwpoUH2UvTBtMWQ3Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sIHEKiYlh0hDL9mhU+HXgYjPR2ZpgFha/F29s/b+0pBisz5p7ufNfkCHjMruvOINivdbWIWH3hGINkuh8axcknYzNMZ06kThOkhS1eQHj+jmDFkTL9ZqLyXh9a/rFYJ5ndDkgdFNlR8Xm5yg/LGacVICeR/wsmvU/H3711YFUxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1eKyHLt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1eKyHLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729285143; x=1760821143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nMlElz1bd9sZ9U304ijDJs6n1TwpoUH2UvTBtMWQ3Ic=;
  b=e1eKyHLtD1aMSEqDiYbQrT2tCzrIDgy0j8m4ewOZjqf6ZjsbtBwyb9cb
   bTk1f6cvhyY1Ynn4BBcKn2LbZdZp/6wzV+PR9mvC+fSoAahnGh+RGejFF
   OhNl19Oixj6eRZsTOltVaCzkKJW0u3vTDZ4jY1+wjMCxoVDN37QJ2xJ33
   iLeG8zbpyv0z8B2f2+CBvJSUlmeC+bf+7kXEqy3+mc8EfR1v2Zoo4KiaA
   zfhQ4TMDa/O7QQ/pjPGIqKegcGepePUYyDa5QSmnRYJ/Ld319pRp7784Z
   EODlas3QQgFXOpsGNJFZ1C/3+3pf/wL4/2p5hqgoADrdNlOe0MskQu5rG
   A==;
X-CSE-ConnectionGUID: FY4EojzpQQaPImtMsWRc3w==
X-CSE-MsgGUID: guehzSMLSI2YBpwkoAJl0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="54240671"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="54240671"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 13:59:03 -0700
X-CSE-ConnectionGUID: 7So1sW15QB27nVSLznGvMA==
X-CSE-MsgGUID: BNe5d6nhTeK3KiSiPZeU4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="79309242"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Oct 2024 13:59:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1u3n-000OIn-24;
	Fri, 18 Oct 2024 20:58:59 +0000
Date: Sat, 19 Oct 2024 04:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [uml:next 21/27] arch/um/kernel/um_arch.c:336 linux_main() warn:
 impossible condition '(task_size > 1024 * (1 << 22)) => (0-u32max >
 4294967296)'
Message-ID: <202410190418.IMUXJ2W7-lkp@intel.com>
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
TO: Benjamin Berg <benjamin.berg@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
head:   8508a5e0e9db3932ca43651f86ba1042a1e9f4ca
commit: 830003c73d190259e45d0a99a0e3d14cb73e0af0 [21/27] um: Limit TASK_SIZE to the addressable range
:::::: branch date: 12 hours ago
:::::: commit date: 8 days ago
config: um-randconfig-r073-20241019 (https://download.01.org/0day-ci/archive/20241019/202410190418.IMUXJ2W7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410190418.IMUXJ2W7-lkp@intel.com/

smatch warnings:
arch/um/kernel/um_arch.c:336 linux_main() warn: impossible condition '(task_size > 1024 * (1 << 22)) => (0-u32max > 4294967296)'

vim +336 arch/um/kernel/um_arch.c

d8fb32f4790f2a Anton Ivanov                   2021-03-12  304  
7a3a06d0e158fc Alon Bar-Lev                   2007-02-12  305  int __init linux_main(int argc, char **argv)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  306  {
^1da177e4c3f41 Linus Torvalds                 2005-04-16  307  	unsigned long avail, diff;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  308  	unsigned long virtmem_size, max_physmem;
60a2988aea701a Jeff Dike                      2008-05-12  309  	unsigned long stack;
3af9c5bed1b8f2 WANG Cong                      2008-04-28  310  	unsigned int i;
3af9c5bed1b8f2 WANG Cong                      2008-04-28  311  	int add;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  312  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  313  	for (i = 1; i < argc; i++) {
ba180fd437156f Jeff Dike                      2007-10-16  314  		if ((i == 1) && (argv[i][0] == ' '))
ba180fd437156f Jeff Dike                      2007-10-16  315  			continue;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  316  		add = 1;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  317  		uml_checksetup(argv[i], &add);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  318  		if (add)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  319  			add_arg(argv[i]);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  320  	}
^1da177e4c3f41 Linus Torvalds                 2005-04-16  321  	if (have_root == 0)
d7ffac33631b2f Thomas Meyer                   2021-01-05  322  		add_arg(DEFAULT_COMMAND_LINE_ROOT);
d7ffac33631b2f Thomas Meyer                   2021-01-05  323  
d7ffac33631b2f Thomas Meyer                   2021-01-05  324  	if (have_console == 0)
d7ffac33631b2f Thomas Meyer                   2021-01-05  325  		add_arg(DEFAULT_COMMAND_LINE_CONSOLE);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  326  
40fb16a360d9c6 Tom Spink                      2008-06-05  327  	host_task_size = os_get_top_address();
91f0a0c5cc5bc8 Benjamin Berg                  2024-09-19  328  	/* reserve a few pages for the stubs */
91f0a0c5cc5bc8 Benjamin Berg                  2024-09-19  329  	stub_start = host_task_size - STUB_DATA_PAGES * PAGE_SIZE;
6032aca0deb9c1 Johannes Berg                  2023-04-14  330  	/* another page for the code portion */
6032aca0deb9c1 Johannes Berg                  2023-04-14  331  	stub_start -= PAGE_SIZE;
6032aca0deb9c1 Johannes Berg                  2023-04-14  332  	host_task_size = stub_start;
bfc58e2b98e997 Johannes Berg                  2021-01-13  333  
830003c73d1902 Benjamin Berg                  2024-09-19  334  	/* Limit TASK_SIZE to what is addressable by the page table */
830003c73d1902 Benjamin Berg                  2024-09-19  335  	task_size = host_task_size;
830003c73d1902 Benjamin Berg                  2024-09-19 @336  	if (task_size > (unsigned long long) PTRS_PER_PGD * PGDIR_SIZE)
830003c73d1902 Benjamin Berg                  2024-09-19  337  		task_size = PTRS_PER_PGD * PGDIR_SIZE;
830003c73d1902 Benjamin Berg                  2024-09-19  338  
536788fe2d28e1 Jeff Dike                      2008-02-08  339  	/*
536788fe2d28e1 Jeff Dike                      2008-02-08  340  	 * TASK_SIZE needs to be PGDIR_SIZE aligned or else exit_mmap craps
536788fe2d28e1 Jeff Dike                      2008-02-08  341  	 * out
536788fe2d28e1 Jeff Dike                      2008-02-08  342  	 */
830003c73d1902 Benjamin Berg                  2024-09-19  343  	task_size = task_size & PGDIR_MASK;
536788fe2d28e1 Jeff Dike                      2008-02-08  344  
ba180fd437156f Jeff Dike                      2007-10-16  345  	/* OS sanity checks that need to happen before the kernel runs */
60d339f6fe0831 Gennady Sharapov               2005-09-03  346  	os_early_checks();
cb66504d65e542 Paolo 'Blaisorblade' Giarrusso 2005-07-27  347  
d8fb32f4790f2a Anton Ivanov                   2021-03-12  348  	get_host_cpu_features(parse_host_cpu_flags, parse_cache_line);
d8fb32f4790f2a Anton Ivanov                   2021-03-12  349  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  350  	brk_start = (unsigned long) sbrk(0);
77bf4400319db9 Jeff Dike                      2007-10-16  351  
ba180fd437156f Jeff Dike                      2007-10-16  352  	/*
ba180fd437156f Jeff Dike                      2007-10-16  353  	 * Increase physical memory size for exec-shield users
ba180fd437156f Jeff Dike                      2007-10-16  354  	 * so they actually get what they asked for. This should
ba180fd437156f Jeff Dike                      2007-10-16  355  	 * add zero for non-exec shield users
ba180fd437156f Jeff Dike                      2007-10-16  356  	 */
^1da177e4c3f41 Linus Torvalds                 2005-04-16  357  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  358  	diff = UML_ROUND_UP(brk_start) - UML_ROUND_UP(&_end);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  359  	if (diff > 1024 * 1024) {
d3878bb8003009 Masami Hiramatsu               2017-05-18  360  		os_info("Adding %ld bytes to physical memory to account for "
^1da177e4c3f41 Linus Torvalds                 2005-04-16  361  			"exec-shield gap\n", diff);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  362  		physmem_size += UML_ROUND_UP(brk_start) - UML_ROUND_UP(&_end);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  363  	}
^1da177e4c3f41 Linus Torvalds                 2005-04-16  364  
05eacfd00ccf23 Nicolas Iooss                  2014-10-12  365  	uml_physmem = (unsigned long) __binary_start & PAGE_MASK;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  366  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  367  	/* Reserve up to 4M after the current brk */
^1da177e4c3f41 Linus Torvalds                 2005-04-16  368  	uml_reserved = ROUND_4M(brk_start) + (1 << 22);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  369  
96b644bdec977b Serge Hallyn                   2006-10-02  370  	setup_machinename(init_utsname()->machine);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  371  
cd05cbed42b731 Tiwei Bie                      2024-09-16  372  	physmem_size = (physmem_size + PAGE_SIZE - 1) & PAGE_MASK;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  373  	iomem_size = (iomem_size + PAGE_SIZE - 1) & PAGE_MASK;
cd05cbed42b731 Tiwei Bie                      2024-09-16  374  
536788fe2d28e1 Jeff Dike                      2008-02-08  375  	max_physmem = TASK_SIZE - uml_physmem - iomem_size - MIN_VMALLOC;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  376  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  377  	if (physmem_size + iomem_size > max_physmem) {
cd05cbed42b731 Tiwei Bie                      2024-09-16  378  		physmem_size = max_physmem - iomem_size;
cd05cbed42b731 Tiwei Bie                      2024-09-16  379  		os_info("Physical memory size shrunk to %llu bytes\n",
cd05cbed42b731 Tiwei Bie                      2024-09-16  380  			physmem_size);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  381  	}
^1da177e4c3f41 Linus Torvalds                 2005-04-16  382  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  383  	high_physmem = uml_physmem + physmem_size;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  384  	end_iomem = high_physmem + iomem_size;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  385  	high_memory = (void *) end_iomem;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  386  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  387  	start_vm = VMALLOC_START;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  388  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  389  	virtmem_size = physmem_size;
60a2988aea701a Jeff Dike                      2008-05-12  390  	stack = (unsigned long) argv;
60a2988aea701a Jeff Dike                      2008-05-12  391  	stack &= ~(1024 * 1024 - 1);
60a2988aea701a Jeff Dike                      2008-05-12  392  	avail = stack - start_vm;
ba180fd437156f Jeff Dike                      2007-10-16  393  	if (physmem_size > avail)
ba180fd437156f Jeff Dike                      2007-10-16  394  		virtmem_size = avail;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  395  	end_vm = start_vm + virtmem_size;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  396  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  397  	if (virtmem_size < physmem_size)
d3878bb8003009 Masami Hiramatsu               2017-05-18  398  		os_info("Kernel virtual memory size shrunk to %lu bytes\n",
^1da177e4c3f41 Linus Torvalds                 2005-04-16  399  			virtmem_size);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  400  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  401  	os_flush_stdout();
^1da177e4c3f41 Linus Torvalds                 2005-04-16  402  
77bf4400319db9 Jeff Dike                      2007-10-16  403  	return start_uml();
^1da177e4c3f41 Linus Torvalds                 2005-04-16  404  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16  405  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
