Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F8186354
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 17:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736186118; cv=none; b=NPTPEm3avDpb5ut69uzYNiCfDLvaQ59jTkjVuPT2th+E4Erm4doyqi38Fm6kjeFlO1wbc4trZ2Qq0ST9BqASmvo8hVoMfnxpeyehuxh8NiDC+kFYW6j72hAb4Z26/RG5Jl5Yj4cLJQYkJQHjehdTUQVAfMWBt/rvK3/dxErg5Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736186118; c=relaxed/simple;
	bh=oJsI7WOnEDSUwHOoQBi0hZ5NvSL5OBTm6mtEofD3qs0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YQGXjXq8A+f9AdCm6I4u7FL4aaZsgkcOML51ymUe865U4ZcI4YXIxKnYW6BH7jbnxf4ziYytWlmES4VOlZEQXZT2yri51Ngt/HF9NuqfMyiZdB6IYb1DYiVduSfmmeMpTasuh9I2tcRLbPkgSdeEDK4UDTO3DUMdyoPH86GLmn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azYXj8W7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azYXj8W7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736186117; x=1767722117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oJsI7WOnEDSUwHOoQBi0hZ5NvSL5OBTm6mtEofD3qs0=;
  b=azYXj8W7eJNwOWUvO0kwVK+w2Ix1jFw3oqwgSrjI5blC8cRHjn7o8YSE
   9KIutA4djE1rvGy7VANzET2kD1I6aKH+AY+ntvqjyiVmHe5wsvU4Z68JL
   vCJVXAXFdBvkrKeO0njEK6YtCAI2GDOQ0AlS1e7S0zKYD3wURU9+qscJI
   UB9CAy9ZQm8Xft7z5w3rOJKnn0Wu3hf/TKowmtW3ynufyEhYmT3vXT7Vr
   dlttntWrBqU6NMkpP2jawbqJcuM3aCylLCgz/Dm7VHbCOxiXp0RuGQ8Lh
   KqtBBWs4XA4nwP6Nsqo+j43eAYGCvm1JYvWv6L5lc5NBkwMexJkZk1f2s
   A==;
X-CSE-ConnectionGUID: fVaYVlcWQamk8e4gQuCTcQ==
X-CSE-MsgGUID: bHcVLRq9T+60iUH4inNhjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="47758123"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="47758123"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 09:55:16 -0800
X-CSE-ConnectionGUID: ufrIyRsoS8SPnikshFQzJA==
X-CSE-MsgGUID: zl7f7BMIQ36Rq5002kMLgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102365120"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jan 2025 09:55:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUrJo-000Dmg-2K;
	Mon, 06 Jan 2025 17:55:12 +0000
Date: Tue, 7 Jan 2025 01:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kernel/setup-common.c:1020 setup_arch() warn: argument
 2 to %lx specifier is cast from pointer
Message-ID: <202501070132.giG6r1Dp-lkp@intel.com>
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
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   13563da6ffcf49b8b45772e40b35f96926a7ee1e
commit: 5284984a4fbacb0883bfebe905902cdda2891a07 bug: Fix no-return-statement warning with !CONFIG_BUG
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: powerpc64-randconfig-r072-20250106 (https://download.01.org/0day-ci/archive/20250107/202501070132.giG6r1Dp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501070132.giG6r1Dp-lkp@intel.com/

smatch warnings:
arch/powerpc/kernel/setup-common.c:1020 setup_arch() warn: argument 2 to %lx specifier is cast from pointer

vim +1020 arch/powerpc/kernel/setup-common.c

b1923caa6e641f Benjamin Herrenschmidt 2016-07-05   976  
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05   977  	/* Print various info about the machine that has been gathered so far. */
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05   978  	print_system_info();
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05   979  
ed1cd6deb013a1 Christophe Leroy       2019-01-31   980  	klp_init_thread_info(&init_task);
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05   981  
6cd7547b360f1a Kefeng Wang            2021-07-07   982  	setup_initial_init_mm(_stext, _etext, _edata, _end);
c3c2e93753484b Nicholas Piggin        2023-05-24   983  	/* sched_init() does the mmgrab(&init_mm) for the primary CPU */
c3c2e93753484b Nicholas Piggin        2023-05-24   984  	VM_WARN_ON(cpumask_test_cpu(smp_processor_id(), mm_cpumask(&init_mm)));
c3c2e93753484b Nicholas Piggin        2023-05-24   985  	cpumask_set_cpu(smp_processor_id(), mm_cpumask(&init_mm));
c3c2e93753484b Nicholas Piggin        2023-05-24   986  	inc_mm_active_cpus(&init_mm);
88f54a3581eb9d Alexey Kardashevskiy   2016-11-30   987  	mm_iommu_init(&init_mm);
c3c2e93753484b Nicholas Piggin        2023-05-24   988  
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05   989  	irqstack_early_init();
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05   990  	exc_lvl_early_init();
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05   991  	emergency_stack_init();
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05   992  
923b3cf00b3ffc Ganesh Goudar          2021-01-28   993  	mce_init();
3c0b976bf20d23 Jordan Niethe          2020-10-14   994  	smp_release_cpus();
3c0b976bf20d23 Jordan Niethe          2020-10-14   995  
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05   996  	initmem_init();
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05   997  
6cf06c17e94f26 Michael Ellerman       2022-06-16   998  	/*
6cf06c17e94f26 Michael Ellerman       2022-06-16   999  	 * Reserve large chunks of memory for use by CMA for KVM and hugetlb. These must
6cf06c17e94f26 Michael Ellerman       2022-06-16  1000  	 * be called after initmem_init(), so that pageblock_order is initialised.
6cf06c17e94f26 Michael Ellerman       2022-06-16  1001  	 */
6cf06c17e94f26 Michael Ellerman       2022-06-16  1002  	kvm_cma_reserve();
6cf06c17e94f26 Michael Ellerman       2022-06-16  1003  	gigantic_hugetlb_cma_reserve();
6cf06c17e94f26 Michael Ellerman       2022-06-16  1004  
d90fe2acd9b290 Christophe Leroy       2018-09-28  1005  	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
d90fe2acd9b290 Christophe Leroy       2018-09-28  1006  
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05  1007  	if (ppc_md.setup_arch)
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05  1008  		ppc_md.setup_arch();
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05  1009  
af375eefbfb27c Michael Ellerman       2018-07-28  1010  	setup_barrier_nospec();
3bc8ea8603ae4c Diana Craciun          2018-12-12  1011  	setup_spectre_v2();
af375eefbfb27c Michael Ellerman       2018-07-28  1012  
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05  1013  	paging_init();
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05  1014  
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05  1015  	/* Initialize the MMU context management stuff. */
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05  1016  	mmu_context_init();
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05  1017  
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05  1018  	/* Interrupt code needs to be 64K-aligned. */
65184f2f045abc Christophe Leroy       2019-03-22  1019  	if (IS_ENABLED(CONFIG_PPC64) && (unsigned long)_stext & 0xffff)
b1923caa6e641f Benjamin Herrenschmidt 2016-07-05 @1020  		panic("Kernelbase not 64K-aligned (0x%lx)!\n",

:::::: The code at line 1020 was first introduced by commit
:::::: b1923caa6e641f3d0a93b5d045aef67ded5aef67 powerpc: Merge 32-bit and 64-bit setup_arch()

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
