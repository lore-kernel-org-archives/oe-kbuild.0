Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E7A215033
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 18:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731005975; cv=none; b=f0ZD4hQZh7fUxEb77NyQJtMvtYC8SLa1zwe2g+tFDtpsjm9i4wzqjcvcPiJz71/myI+uHIMf4FDX5jcoZupJoS6Ys08xBcK0mKuMiN7VPr+B8HrNkb8kdwfcXrOH/HNCHiafbZADu2iQob2yDkIDg0eiwqoe0H9ZJiYAiJoEtFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731005975; c=relaxed/simple;
	bh=CZ2txllCzJb2a5IbK/lzbvJua9THWG6QnXrPNTObcNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DjOB/z9hQkX4MyxB57xp2MpMg1ozYkWZZBlSz3ViC2ZHeHmM0VE8Ly6xynzOMlGsz7RU9//KLnmn6r47A+OVJSQC9RmaO53TQm0dPNA4sEPNu11+g9OMEVa1el0fdT6uYlrYFayiJt40vkBPWe5m+XH1IcC1uCiwa65iBfV+Rqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvqM8sx/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvqM8sx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731005973; x=1762541973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CZ2txllCzJb2a5IbK/lzbvJua9THWG6QnXrPNTObcNI=;
  b=jvqM8sx/ug3piKLOuKMt7tjsf7SAUQ6CziLMXnuFNkUNxigG8sZWh9g4
   Jy/1ipU5S5poKi2jefTQY1yq7H9/TxO3RNIAFURnpDquulatGIO4hmPZq
   l57fj4owY5i9oQfyXOPuxipyIET1XVg6Qitqf009pXDfX1abnYKtLdZKi
   lduseCQ+0KmbmB7ThjDw7AZUAGrf0dy3KErTux2AO2QPp8nrHyIif1Qy8
   Zo3s/JWb+dLBVYqwn8a7vwkOdFv9yr8a5N4dR2oizZFUNeM0wClcrO4Me
   f1C16Xio1VR6LSZZAzT/bKE4fciGKUKhXmslhXlvPSEYsYzXJKu78mseL
   w==;
X-CSE-ConnectionGUID: cMXuY5k4QZG2IuQNoK5rnw==
X-CSE-MsgGUID: mAE8fh9qRXWCKxEWyiGyCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="42270999"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="42270999"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 10:59:31 -0800
X-CSE-ConnectionGUID: RzVziqVZRf6wQYHlN8NODg==
X-CSE-MsgGUID: YuxRnn7IQSa9R/Dwycpw+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="122714729"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Nov 2024 10:59:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t97j4-000qaq-24;
	Thu, 07 Nov 2024 18:59:26 +0000
Date: Fri, 8 Nov 2024 02:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [uml:next 21/66] arch/um/kernel/um_arch.c:336 linux_main() warn:
 impossible condition '(task_size > 1024 * (1 << 22)) => (0-u32max >
 4294967296)'
Message-ID: <202411080205.onX6vwqe-lkp@intel.com>
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
head:   0f659ff362eac69777c4c191b7e5ccb19d76c67d
commit: 830003c73d190259e45d0a99a0e3d14cb73e0af0 [21/66] um: Limit TASK_SIZE to the addressable range
:::::: branch date: 2 hours ago
:::::: commit date: 4 weeks ago
config: um-randconfig-r071-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080205.onX6vwqe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411080205.onX6vwqe-lkp@intel.com/

smatch warnings:
arch/um/kernel/um_arch.c:336 linux_main() warn: impossible condition '(task_size > 1024 * (1 << 22)) => (0-u32max > 4294967296)'

vim +336 arch/um/kernel/um_arch.c

d8fb32f4790f2a2 Anton Ivanov                   2021-03-12  304  
7a3a06d0e158fc8 Alon Bar-Lev                   2007-02-12  305  int __init linux_main(int argc, char **argv)
^1da177e4c3f415 Linus Torvalds                 2005-04-16  306  {
^1da177e4c3f415 Linus Torvalds                 2005-04-16  307  	unsigned long avail, diff;
^1da177e4c3f415 Linus Torvalds                 2005-04-16  308  	unsigned long virtmem_size, max_physmem;
60a2988aea701a6 Jeff Dike                      2008-05-12  309  	unsigned long stack;
3af9c5bed1b8f28 WANG Cong                      2008-04-28  310  	unsigned int i;
3af9c5bed1b8f28 WANG Cong                      2008-04-28  311  	int add;
^1da177e4c3f415 Linus Torvalds                 2005-04-16  312  
^1da177e4c3f415 Linus Torvalds                 2005-04-16  313  	for (i = 1; i < argc; i++) {
ba180fd437156f7 Jeff Dike                      2007-10-16  314  		if ((i == 1) && (argv[i][0] == ' '))
ba180fd437156f7 Jeff Dike                      2007-10-16  315  			continue;
^1da177e4c3f415 Linus Torvalds                 2005-04-16  316  		add = 1;
^1da177e4c3f415 Linus Torvalds                 2005-04-16  317  		uml_checksetup(argv[i], &add);
^1da177e4c3f415 Linus Torvalds                 2005-04-16  318  		if (add)
^1da177e4c3f415 Linus Torvalds                 2005-04-16  319  			add_arg(argv[i]);
^1da177e4c3f415 Linus Torvalds                 2005-04-16  320  	}
^1da177e4c3f415 Linus Torvalds                 2005-04-16  321  	if (have_root == 0)
d7ffac33631b2f7 Thomas Meyer                   2021-01-05  322  		add_arg(DEFAULT_COMMAND_LINE_ROOT);
d7ffac33631b2f7 Thomas Meyer                   2021-01-05  323  
d7ffac33631b2f7 Thomas Meyer                   2021-01-05  324  	if (have_console == 0)
d7ffac33631b2f7 Thomas Meyer                   2021-01-05  325  		add_arg(DEFAULT_COMMAND_LINE_CONSOLE);
^1da177e4c3f415 Linus Torvalds                 2005-04-16  326  
40fb16a360d9c64 Tom Spink                      2008-06-05  327  	host_task_size = os_get_top_address();
91f0a0c5cc5bc86 Benjamin Berg                  2024-09-19  328  	/* reserve a few pages for the stubs */
91f0a0c5cc5bc86 Benjamin Berg                  2024-09-19  329  	stub_start = host_task_size - STUB_DATA_PAGES * PAGE_SIZE;
6032aca0deb9c13 Johannes Berg                  2023-04-14  330  	/* another page for the code portion */
6032aca0deb9c13 Johannes Berg                  2023-04-14  331  	stub_start -= PAGE_SIZE;
6032aca0deb9c13 Johannes Berg                  2023-04-14  332  	host_task_size = stub_start;
bfc58e2b98e9973 Johannes Berg                  2021-01-13  333  
830003c73d19025 Benjamin Berg                  2024-09-19  334  	/* Limit TASK_SIZE to what is addressable by the page table */
830003c73d19025 Benjamin Berg                  2024-09-19  335  	task_size = host_task_size;
830003c73d19025 Benjamin Berg                  2024-09-19 @336  	if (task_size > (unsigned long long) PTRS_PER_PGD * PGDIR_SIZE)
830003c73d19025 Benjamin Berg                  2024-09-19  337  		task_size = PTRS_PER_PGD * PGDIR_SIZE;
830003c73d19025 Benjamin Berg                  2024-09-19  338  
536788fe2d28e11 Jeff Dike                      2008-02-08  339  	/*
536788fe2d28e11 Jeff Dike                      2008-02-08  340  	 * TASK_SIZE needs to be PGDIR_SIZE aligned or else exit_mmap craps
536788fe2d28e11 Jeff Dike                      2008-02-08  341  	 * out
536788fe2d28e11 Jeff Dike                      2008-02-08  342  	 */
830003c73d19025 Benjamin Berg                  2024-09-19  343  	task_size = task_size & PGDIR_MASK;
536788fe2d28e11 Jeff Dike                      2008-02-08  344  
ba180fd437156f7 Jeff Dike                      2007-10-16  345  	/* OS sanity checks that need to happen before the kernel runs */
60d339f6fe08310 Gennady Sharapov               2005-09-03  346  	os_early_checks();
cb66504d65e5421 Paolo 'Blaisorblade' Giarrusso 2005-07-27  347  
d8fb32f4790f2a2 Anton Ivanov                   2021-03-12  348  	get_host_cpu_features(parse_host_cpu_flags, parse_cache_line);
d8fb32f4790f2a2 Anton Ivanov                   2021-03-12  349  
^1da177e4c3f415 Linus Torvalds                 2005-04-16  350  	brk_start = (unsigned long) sbrk(0);
77bf4400319db9d Jeff Dike                      2007-10-16  351  
ba180fd437156f7 Jeff Dike                      2007-10-16  352  	/*
ba180fd437156f7 Jeff Dike                      2007-10-16  353  	 * Increase physical memory size for exec-shield users
ba180fd437156f7 Jeff Dike                      2007-10-16  354  	 * so they actually get what they asked for. This should
ba180fd437156f7 Jeff Dike                      2007-10-16  355  	 * add zero for non-exec shield users
ba180fd437156f7 Jeff Dike                      2007-10-16  356  	 */
^1da177e4c3f415 Linus Torvalds                 2005-04-16  357  
^1da177e4c3f415 Linus Torvalds                 2005-04-16  358  	diff = UML_ROUND_UP(brk_start) - UML_ROUND_UP(&_end);
^1da177e4c3f415 Linus Torvalds                 2005-04-16  359  	if (diff > 1024 * 1024) {
d3878bb8003009d Masami Hiramatsu               2017-05-18  360  		os_info("Adding %ld bytes to physical memory to account for "
^1da177e4c3f415 Linus Torvalds                 2005-04-16  361  			"exec-shield gap\n", diff);
^1da177e4c3f415 Linus Torvalds                 2005-04-16  362  		physmem_size += UML_ROUND_UP(brk_start) - UML_ROUND_UP(&_end);
^1da177e4c3f415 Linus Torvalds                 2005-04-16  363  	}
^1da177e4c3f415 Linus Torvalds                 2005-04-16  364  
05eacfd00ccf239 Nicolas Iooss                  2014-10-12  365  	uml_physmem = (unsigned long) __binary_start & PAGE_MASK;
^1da177e4c3f415 Linus Torvalds                 2005-04-16  366  
^1da177e4c3f415 Linus Torvalds                 2005-04-16  367  	/* Reserve up to 4M after the current brk */
^1da177e4c3f415 Linus Torvalds                 2005-04-16  368  	uml_reserved = ROUND_4M(brk_start) + (1 << 22);
^1da177e4c3f415 Linus Torvalds                 2005-04-16  369  
96b644bdec977b9 Serge Hallyn                   2006-10-02  370  	setup_machinename(init_utsname()->machine);
^1da177e4c3f415 Linus Torvalds                 2005-04-16  371  
cd05cbed42b7316 Tiwei Bie                      2024-09-16  372  	physmem_size = (physmem_size + PAGE_SIZE - 1) & PAGE_MASK;
^1da177e4c3f415 Linus Torvalds                 2005-04-16  373  	iomem_size = (iomem_size + PAGE_SIZE - 1) & PAGE_MASK;
cd05cbed42b7316 Tiwei Bie                      2024-09-16  374  
536788fe2d28e11 Jeff Dike                      2008-02-08  375  	max_physmem = TASK_SIZE - uml_physmem - iomem_size - MIN_VMALLOC;
^1da177e4c3f415 Linus Torvalds                 2005-04-16  376  
^1da177e4c3f415 Linus Torvalds                 2005-04-16  377  	if (physmem_size + iomem_size > max_physmem) {
cd05cbed42b7316 Tiwei Bie                      2024-09-16  378  		physmem_size = max_physmem - iomem_size;
cd05cbed42b7316 Tiwei Bie                      2024-09-16  379  		os_info("Physical memory size shrunk to %llu bytes\n",
cd05cbed42b7316 Tiwei Bie                      2024-09-16  380  			physmem_size);
^1da177e4c3f415 Linus Torvalds                 2005-04-16  381  	}
^1da177e4c3f415 Linus Torvalds                 2005-04-16  382  
^1da177e4c3f415 Linus Torvalds                 2005-04-16  383  	high_physmem = uml_physmem + physmem_size;
^1da177e4c3f415 Linus Torvalds                 2005-04-16  384  	end_iomem = high_physmem + iomem_size;
^1da177e4c3f415 Linus Torvalds                 2005-04-16  385  	high_memory = (void *) end_iomem;
^1da177e4c3f415 Linus Torvalds                 2005-04-16  386  
^1da177e4c3f415 Linus Torvalds                 2005-04-16  387  	start_vm = VMALLOC_START;
^1da177e4c3f415 Linus Torvalds                 2005-04-16  388  
^1da177e4c3f415 Linus Torvalds                 2005-04-16  389  	virtmem_size = physmem_size;
60a2988aea701a6 Jeff Dike                      2008-05-12  390  	stack = (unsigned long) argv;
60a2988aea701a6 Jeff Dike                      2008-05-12  391  	stack &= ~(1024 * 1024 - 1);
60a2988aea701a6 Jeff Dike                      2008-05-12  392  	avail = stack - start_vm;
ba180fd437156f7 Jeff Dike                      2007-10-16  393  	if (physmem_size > avail)
ba180fd437156f7 Jeff Dike                      2007-10-16  394  		virtmem_size = avail;
^1da177e4c3f415 Linus Torvalds                 2005-04-16  395  	end_vm = start_vm + virtmem_size;
^1da177e4c3f415 Linus Torvalds                 2005-04-16  396  
^1da177e4c3f415 Linus Torvalds                 2005-04-16  397  	if (virtmem_size < physmem_size)
d3878bb8003009d Masami Hiramatsu               2017-05-18  398  		os_info("Kernel virtual memory size shrunk to %lu bytes\n",
^1da177e4c3f415 Linus Torvalds                 2005-04-16  399  			virtmem_size);
^1da177e4c3f415 Linus Torvalds                 2005-04-16  400  
^1da177e4c3f415 Linus Torvalds                 2005-04-16  401  	os_flush_stdout();
^1da177e4c3f415 Linus Torvalds                 2005-04-16  402  
77bf4400319db9d Jeff Dike                      2007-10-16  403  	return start_uml();
^1da177e4c3f415 Linus Torvalds                 2005-04-16  404  }
^1da177e4c3f415 Linus Torvalds                 2005-04-16  405  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
