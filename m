Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F264C3C489
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 22:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRpuudgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700087308; x=1731623308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FpxEjtmGPK6CI3vz7/Xm7OJhYiji8oDHoq5qy4AEb1c=;
  b=DRpuudgdx5/uqZ/RbLbZWs7+0t0U+4XjWzaBIxeI72WtlTy7G/+nM9hL
   N5r+296zksFb25cs/d0ecBf5wzXXecaZUt0hlEj0QzmK0X0Icx4tfJLk7
   412Amsbtit4NQiQaTxzXto5++Ri1irrciWJ8OeRX3anXp0nylUf68kdEu
   DGwoIBDtz6xt43cZIR6op3qn747zC7cqGrzt0uVqq5rjVKSUzjXQg6COY
   0JZ5mmi1iAeMvIfrrqzMFqNd5tkjeUtKhR/XqrepUC5lhpcuXrM0mmSgP
   IE8MemWibrIavZ75pN8L+zqA74LtL/exWHNchBvENyKR+DG0CHcpk0zaJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="388131830"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="388131830"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 14:28:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="794294488"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="794294488"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Nov 2023 14:28:26 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3OMx-0000uO-1z;
	Wed, 15 Nov 2023 22:28:23 +0000
Date: Thu, 16 Nov 2023 06:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kernel/perf_cpum_cf.c:306 cpum_cf_alloc() error:
 uninitialized symbol 'rc'.
Message-ID: <202311160623.scINlaXh-lkp@intel.com>
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
TO: Thomas Richter <tmricht@linux.ibm.com>
CC: Alexander Gordeev <agordeev@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 9b9cf3c77e7e090b30657b3d2c288deb58dfb4f2 s390/cpum_cf: rework PER_CPU_DEFINE of struct cpu_cf_events
date:   5 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
config: s390-randconfig-r071-20231115 (https://download.01.org/0day-ci/archive/20231116/202311160623.scINlaXh-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160623.scINlaXh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311160623.scINlaXh-lkp@intel.com/

New smatch warnings:
arch/s390/kernel/perf_cpum_cf.c:306 cpum_cf_alloc() error: uninitialized symbol 'rc'.

Old smatch warnings:
arch/s390/kernel/perf_cpum_cf.c:1505 cfset_all_copy() warn: ignoring unreachable code.

vim +/rc +306 arch/s390/kernel/perf_cpum_cf.c

9b9cf3c77e7e090 Thomas Richter 2023-06-15  275  
9b9cf3c77e7e090 Thomas Richter 2023-06-15  276  /*
9b9cf3c77e7e090 Thomas Richter 2023-06-15  277   * Create/delete per CPU data structures for /dev/hwctr interface and events
9b9cf3c77e7e090 Thomas Richter 2023-06-15  278   * created by perf_event_open().
9b9cf3c77e7e090 Thomas Richter 2023-06-15  279   * If cpu is -1, track task on all available CPUs. This requires
9b9cf3c77e7e090 Thomas Richter 2023-06-15  280   * allocation of hardware data structures for all CPUs. This setup handles
9b9cf3c77e7e090 Thomas Richter 2023-06-15  281   * perf_event_open() with task context and /dev/hwctr interface.
9b9cf3c77e7e090 Thomas Richter 2023-06-15  282   * If cpu is non-zero install event on this CPU only. This setup handles
9b9cf3c77e7e090 Thomas Richter 2023-06-15  283   * perf_event_open() with CPU context.
9b9cf3c77e7e090 Thomas Richter 2023-06-15  284   */
9b9cf3c77e7e090 Thomas Richter 2023-06-15  285  static int cpum_cf_alloc(int cpu)
9b9cf3c77e7e090 Thomas Richter 2023-06-15  286  {
9b9cf3c77e7e090 Thomas Richter 2023-06-15  287  	cpumask_var_t mask;
9b9cf3c77e7e090 Thomas Richter 2023-06-15  288  	int rc;
9b9cf3c77e7e090 Thomas Richter 2023-06-15  289  
9b9cf3c77e7e090 Thomas Richter 2023-06-15  290  	if (cpu == -1) {
9b9cf3c77e7e090 Thomas Richter 2023-06-15  291  		if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
9b9cf3c77e7e090 Thomas Richter 2023-06-15  292  			return -ENOMEM;
9b9cf3c77e7e090 Thomas Richter 2023-06-15  293  		for_each_online_cpu(cpu) {
9b9cf3c77e7e090 Thomas Richter 2023-06-15  294  			rc = cpum_cf_alloc_cpu(cpu);
9b9cf3c77e7e090 Thomas Richter 2023-06-15  295  			if (rc) {
9b9cf3c77e7e090 Thomas Richter 2023-06-15  296  				for_each_cpu(cpu, mask)
9b9cf3c77e7e090 Thomas Richter 2023-06-15  297  					cpum_cf_free_cpu(cpu);
9b9cf3c77e7e090 Thomas Richter 2023-06-15  298  				break;
9b9cf3c77e7e090 Thomas Richter 2023-06-15  299  			}
9b9cf3c77e7e090 Thomas Richter 2023-06-15  300  			cpumask_set_cpu(cpu, mask);
9b9cf3c77e7e090 Thomas Richter 2023-06-15  301  		}
9b9cf3c77e7e090 Thomas Richter 2023-06-15  302  		free_cpumask_var(mask);
9b9cf3c77e7e090 Thomas Richter 2023-06-15  303  	} else {
9b9cf3c77e7e090 Thomas Richter 2023-06-15  304  		rc = cpum_cf_alloc_cpu(cpu);
9b9cf3c77e7e090 Thomas Richter 2023-06-15  305  	}
9b9cf3c77e7e090 Thomas Richter 2023-06-15 @306  	return rc;
9b9cf3c77e7e090 Thomas Richter 2023-06-15  307  }
9b9cf3c77e7e090 Thomas Richter 2023-06-15  308  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
