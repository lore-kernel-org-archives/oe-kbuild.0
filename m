Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598AA41220
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 23:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/twgBET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701820565; x=1733356565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/0ddNdyoaZM7ITvb3Ox82RNhizNDlUT0Obzrv7qvung=;
  b=B/twgBETS68Cn4yKF7bsAhF7kwjJlU8EXQE91/J/c8KnjW7guEPlsjks
   8Esm7n4OA922oaBZpBdlMoEyktK/BZVEvPmBefPB4vi54GBi4hKWSyyzp
   qe2d2zFPaiofRQqWH6gcOP1ip3tXToHBr2iG+ncjLlEVWKclfi+DiGnxl
   Rw0oPC+wtVNKRZ1WSXyIphaJCdu6DPe+Dqv8QA6WTlTP5pc8GpN10dGOB
   u1xvVz6tCd4LkZIvB/K7WvwNpTSNOzB+bX8GwiQFS7K8Gfud3wrUh+uRE
   DkKVxr6pux8iQtxoUsdzvAz3nGni6jMi//JVSUDYtZRegF7mwvV4z6UWP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12694077"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="12694077"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 15:56:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018378607"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1018378607"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 15:56:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAfGh-0009t4-1N;
	Tue, 05 Dec 2023 23:55:59 +0000
Date: Wed, 6 Dec 2023 07:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v2 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
Message-ID: <202312060759.z3iob6us-lkp@intel.com>
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
In-Reply-To: <20231130-fencei-v2-1-2cb623ab1b1f@rivosinc.com>
References: <20231130-fencei-v2-1-2cb623ab1b1f@rivosinc.com>
TO: Charlie Jenkins <charlie@rivosinc.com>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Conor Dooley <conor.dooley@microchip.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: Charlie Jenkins <charlie@rivosinc.com>

Hi Charlie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/documentation-Document-PR_RISCV_SET_ICACHE_FLUSH_CTX-prctl/20231201-162316
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20231130-fencei-v2-1-2cb623ab1b1f%40rivosinc.com
patch subject: [PATCH v2 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r051-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060759.z3iob6us-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060759.z3iob6us-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312060759.z3iob6us-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/riscv/mm/context.c:306:36-66: duplicated argument to && or ||

vim +306 arch/riscv/mm/context.c

65d4b9c5301749 Anup Patel      2021-02-03  285  
f6635f873a6055 Gary Guo        2019-03-27  286  /*
f6635f873a6055 Gary Guo        2019-03-27  287   * When necessary, performs a deferred icache flush for the given MM context,
f6635f873a6055 Gary Guo        2019-03-27  288   * on the local CPU.  RISC-V has no direct mechanism for instruction cache
f6635f873a6055 Gary Guo        2019-03-27  289   * shoot downs, so instead we send an IPI that informs the remote harts they
f6635f873a6055 Gary Guo        2019-03-27  290   * need to flush their local instruction caches.  To avoid pathologically slow
f6635f873a6055 Gary Guo        2019-03-27  291   * behavior in a common case (a bunch of single-hart processes on a many-hart
f6635f873a6055 Gary Guo        2019-03-27  292   * machine, ie 'make -j') we avoid the IPIs for harts that are not currently
f6635f873a6055 Gary Guo        2019-03-27  293   * executing a MM context and instead schedule a deferred local instruction
f6635f873a6055 Gary Guo        2019-03-27  294   * cache flush to be performed before execution resumes on each hart.  This
f6635f873a6055 Gary Guo        2019-03-27  295   * actually performs that local instruction cache flush, which implicitly only
f6635f873a6055 Gary Guo        2019-03-27  296   * refers to the current hart.
8237c5243a614d Jisheng Zhang   2021-05-12  297   *
8237c5243a614d Jisheng Zhang   2021-05-12  298   * The "cpu" argument must be the current local CPU number.
f6635f873a6055 Gary Guo        2019-03-27  299   */
16f3844d4987a5 Charlie Jenkins 2023-11-30  300  static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu,
16f3844d4987a5 Charlie Jenkins 2023-11-30  301  					 struct task_struct *task)
f6635f873a6055 Gary Guo        2019-03-27  302  {
f6635f873a6055 Gary Guo        2019-03-27  303  #ifdef CONFIG_SMP
f6635f873a6055 Gary Guo        2019-03-27  304  	cpumask_t *mask = &mm->context.icache_stale_mask;
f6635f873a6055 Gary Guo        2019-03-27  305  
16f3844d4987a5 Charlie Jenkins 2023-11-30 @306  	if (cpumask_test_cpu(cpu, mask) || mm->context.force_icache_flush ||
16f3844d4987a5 Charlie Jenkins 2023-11-30  307  	    mm->context.force_icache_flush) {
f6635f873a6055 Gary Guo        2019-03-27  308  		cpumask_clear_cpu(cpu, mask);
f6635f873a6055 Gary Guo        2019-03-27  309  		/*
f6635f873a6055 Gary Guo        2019-03-27  310  		 * Ensure the remote hart's writes are visible to this hart.
f6635f873a6055 Gary Guo        2019-03-27  311  		 * This pairs with a barrier in flush_icache_mm.
f6635f873a6055 Gary Guo        2019-03-27  312  		 */
f6635f873a6055 Gary Guo        2019-03-27  313  		smp_mb();
f6635f873a6055 Gary Guo        2019-03-27  314  		local_flush_icache_all();
f6635f873a6055 Gary Guo        2019-03-27  315  	}
f6635f873a6055 Gary Guo        2019-03-27  316  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
