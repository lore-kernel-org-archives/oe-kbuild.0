Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04FBF9C4
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bg02IvS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701618536; x=1733154536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=56IRrpZYrCxMoQE9SHdkhymOx9dvBq7DHVpuJqEmQu0=;
  b=bg02IvS2OEuuGPdG4pLF0ygpamkSuZQJv1SPupKT7pdS1Ij7+5aIJnM1
   KJgb6R9KBfM0XZTn3VPmv02MW93k2yYZTiHECq8POu1WUbpldq2+HT1Cl
   UrAXN6WBiFZM+9zzLlcus4vjexibSBA+cicRJf7EeXSl5xEQBQGGKRnbd
   Riai/oVNt7XVIamLdSKw13iYfZqA/+UUGQ3j6bwmgyLiRSP/p4E1/4CN3
   ijK9eJ/WEA9Nw0E+5EwI0mVEGUAPZTpdCRX/NzOicZY4P+LwoDWx+RYXy
   hvcYmfh07Dk2fxsmbiNICHmun0KxDrz0zirmyqrCN7EKZZCP/WBGqb/bF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="378683557"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="378683557"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 07:48:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="893737744"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="893737744"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 03 Dec 2023 07:48:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9oi9-0006na-1t;
	Sun, 03 Dec 2023 15:48:49 +0000
Date: Sun, 3 Dec 2023 23:48:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/kernel/kvmclock.c:269 kvmclock_setup_percpu() error:
 testing array offset 'cpu' after use.
Message-ID: <202312032306.PrSrLRqa-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Pavel Tatashin <pasha.tatashin@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 95a3d4454bb1cf5bfd666c27fdd2dc188e17c14d x86/kvmclock: Switch kvmclock data to a PER_CPU variable
date:   5 years ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 years ago
config: x86_64-randconfig-x006-20230817 (https://download.01.org/0day-ci/archive/20231203/202312032306.PrSrLRqa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312032306.PrSrLRqa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312032306.PrSrLRqa-lkp@intel.com/

smatch warnings:
arch/x86/kernel/kvmclock.c:269 kvmclock_setup_percpu() error: testing array offset 'cpu' after use.

vim +/cpu +269 arch/x86/kernel/kvmclock.c

e499a9b6dc488a Thomas Gleixner 2018-07-19  255  
95a3d4454bb1cf Thomas Gleixner 2018-07-19  256  static int kvmclock_setup_percpu(unsigned int cpu)
95a3d4454bb1cf Thomas Gleixner 2018-07-19  257  {
95a3d4454bb1cf Thomas Gleixner 2018-07-19  258  	struct pvclock_vsyscall_time_info *p = per_cpu(hv_clock_per_cpu, cpu);
95a3d4454bb1cf Thomas Gleixner 2018-07-19  259  
95a3d4454bb1cf Thomas Gleixner 2018-07-19  260  	/*
95a3d4454bb1cf Thomas Gleixner 2018-07-19  261  	 * The per cpu area setup replicates CPU0 data to all cpu
95a3d4454bb1cf Thomas Gleixner 2018-07-19  262  	 * pointers. So carefully check. CPU0 has been set up in init
95a3d4454bb1cf Thomas Gleixner 2018-07-19  263  	 * already.
95a3d4454bb1cf Thomas Gleixner 2018-07-19  264  	 */
95a3d4454bb1cf Thomas Gleixner 2018-07-19  265  	if (!cpu || (p && p != per_cpu(hv_clock_per_cpu, 0)))
95a3d4454bb1cf Thomas Gleixner 2018-07-19  266  		return 0;
95a3d4454bb1cf Thomas Gleixner 2018-07-19  267  
95a3d4454bb1cf Thomas Gleixner 2018-07-19  268  	/* Use the static page for the first CPUs, allocate otherwise */
95a3d4454bb1cf Thomas Gleixner 2018-07-19 @269  	if (cpu < HVC_BOOT_ARRAY_SIZE)
95a3d4454bb1cf Thomas Gleixner 2018-07-19  270  		p = &hv_clock_boot[cpu];
95a3d4454bb1cf Thomas Gleixner 2018-07-19  271  	else
95a3d4454bb1cf Thomas Gleixner 2018-07-19  272  		p = kzalloc(sizeof(*p), GFP_KERNEL);
95a3d4454bb1cf Thomas Gleixner 2018-07-19  273  
95a3d4454bb1cf Thomas Gleixner 2018-07-19  274  	per_cpu(hv_clock_per_cpu, cpu) = p;
95a3d4454bb1cf Thomas Gleixner 2018-07-19  275  	return p ? 0 : -ENOMEM;
95a3d4454bb1cf Thomas Gleixner 2018-07-19  276  }
95a3d4454bb1cf Thomas Gleixner 2018-07-19  277  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
