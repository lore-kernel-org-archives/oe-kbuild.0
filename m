Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3521CA9C
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Sep 2024 03:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726801997; cv=none; b=ZhxN8bTPXP3YiCVoX8R7nzSXFX2tpw8Tvd2TnnVI6uIkXIzDPoToY+BsiXZcmWozmAMQb5g6+kqYpz6P2XN1XhaJgkUxIORXmRClFbx5YC1IGZ2lEX9fe2nQAzH/NI5UduYqXlsCc33qe/gqO2CqGgsH+3CFqLswM6IM5l56ylw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726801997; c=relaxed/simple;
	bh=7LQyPlcVFUfZUxS7gufl8LZgQykKSlIr6ALk2PE9zvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KhMTiW7qp77iD6UBfQebtwVp25DhqD2eAfIF6/f3hcACS+8iR/huVlBMmUBi/TWPU9V12HcdzTxNYr7jXImdPUp1iXTeYrn/IzgFeKhV5cu2XzG9gjnTzipucChnGQQZvlbE2Fu3NwKEPLzkUk7or8HnkrKm3qXTNikTSppln58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DO+77zW/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DO+77zW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726801994; x=1758337994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7LQyPlcVFUfZUxS7gufl8LZgQykKSlIr6ALk2PE9zvs=;
  b=DO+77zW/Ioax0SvLoBkJWlIqKgqkK+btwnGDrfJ8W9OxC/ayLBq32NVh
   UzeQgXJCTwEsvA8m91t0rjOwz9Tc/rB+44PBD3DzAuzdRk23cQyDhwKJ4
   P3l+1w5hoRnBQZpjKrThTWJ+HnHXdfRnETdJz7uF91uR/7ZaR48pMj9ox
   VcoZnL1xIVUOpz0I0sZNlr/72XWE84U3uxMOIJ6Yo4wwH/XF8a95kpCTm
   8K8GfoyeyrE/Ccuk/PqefHFiCIfCkVegfCA6/q5537ca5G3Hj7yGlEEgD
   G5h3gycUyd4yhxk4JMdezFpdQgV9FubcpfCi/TroGefPhTY84XgYZgYvb
   Q==;
X-CSE-ConnectionGUID: 52yqDxylSQ65oBfB9TVXsw==
X-CSE-MsgGUID: c40z0R1OSA+wd+EeR1hwHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="37172884"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="37172884"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 20:13:13 -0700
X-CSE-ConnectionGUID: DpnzuiPbSp+AhY1SDp8rJQ==
X-CSE-MsgGUID: q7SPCDQ5SuaUzYH3Ax6zqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="69745307"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2024 20:13:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srU4z-000DuW-2m;
	Fri, 20 Sep 2024 03:13:09 +0000
Date: Fri, 20 Sep 2024 11:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kernel/setup-common.c:1020 setup_arch() warn: argument
 2 to %lx specifier is cast from pointer
Message-ID: <202409201036.zRsBdnhj-lkp@intel.com>
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
head:   2004cef11ea072838f99bd95cefa5c8e45df0847
commit: 5284984a4fbacb0883bfebe905902cdda2891a07 bug: Fix no-return-statement warning with !CONFIG_BUG
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-r071-20240919 (https://download.01.org/0day-ci/archive/20240920/202409201036.zRsBdnhj-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409201036.zRsBdnhj-lkp@intel.com/

New smatch warnings:
arch/powerpc/kernel/setup-common.c:1020 setup_arch() warn: argument 2 to %lx specifier is cast from pointer

Old smatch warnings:
arch/powerpc/include/asm/mmu.h:230 early_mmu_has_feature() warn: bitwise AND condition is false here

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
