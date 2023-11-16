Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471FB63A6
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 03:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCbyxtoe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700104512; x=1731640512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mxCr3HSceYBQAcaVRDKaNEY1JqX1SUbOAiEqoshpkhQ=;
  b=CCbyxtoel0bYJZCp3eR48cbRrn+KYTIbKXEkBG9M9B75reihLQzl8iRo
   6TH6ihGvRNfH7ZLU2ZDGs2AOFyGw6ETzXKm5WSSt4FN+On6sSGXWeMxtv
   T79i7nH2SE20gnxyEiIBDVifhD0AXQoc9fcUiZ5aXw9r3knv5Xa/m3JA2
   p7eK1JnGPgtxGBMGgRYp0UxlQNh9erpJd8cbyCxWRM1/e/LKwGzlK0v5T
   X0r/5LqTAmvQeDrZR+DxjRKwrQhfAebYugxg3KYzM2Nc9O2JzTpDkv6YL
   fqEn9OkH913LDIK6lmCv86Z6PqtBUzGH6SC5FGwFaJ4OGtN5ZkdfCYTsL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="394921888"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="394921888"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 19:15:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="715068524"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="715068524"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Nov 2023 19:15:08 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3SqP-0001Db-31;
	Thu, 16 Nov 2023 03:15:05 +0000
Date: Thu, 16 Nov 2023 11:14:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/sys_riscv.c:104 hwprobe_arch_id() error:
 uninitialized symbol 'cpu_id'.
Message-ID: <202311161128.AOk2Fuj7-lkp@intel.com>
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
TO: Evan Green <evan@rivosinc.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Heiko Stuebner <heiko.stuebner@vrull.eu>
CC: Paul Walmsley <paul.walmsley@sifive.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: ea3de9ce8aa280c5175c835bd3e94a3a9b814b74 RISC-V: Add a syscall for HW probing
date:   7 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-r071-20231112 (https://download.01.org/0day-ci/archive/20231116/202311161128.AOk2Fuj7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311161128.AOk2Fuj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311161128.AOk2Fuj7-lkp@intel.com/

smatch warnings:
arch/riscv/kernel/sys_riscv.c:104 hwprobe_arch_id() error: uninitialized symbol 'cpu_id'.

vim +/cpu_id +104 arch/riscv/kernel/sys_riscv.c

ea3de9ce8aa280 Evan Green 2023-04-07   75  
ea3de9ce8aa280 Evan Green 2023-04-07   76  /*
ea3de9ce8aa280 Evan Green 2023-04-07   77   * The hwprobe interface, for allowing userspace to probe to see which features
ea3de9ce8aa280 Evan Green 2023-04-07   78   * are supported by the hardware.  See Documentation/riscv/hwprobe.rst for more
ea3de9ce8aa280 Evan Green 2023-04-07   79   * details.
ea3de9ce8aa280 Evan Green 2023-04-07   80   */
ea3de9ce8aa280 Evan Green 2023-04-07   81  static void hwprobe_arch_id(struct riscv_hwprobe *pair,
ea3de9ce8aa280 Evan Green 2023-04-07   82  			    const struct cpumask *cpus)
ea3de9ce8aa280 Evan Green 2023-04-07   83  {
ea3de9ce8aa280 Evan Green 2023-04-07   84  	u64 id = -1ULL;
ea3de9ce8aa280 Evan Green 2023-04-07   85  	bool first = true;
ea3de9ce8aa280 Evan Green 2023-04-07   86  	int cpu;
ea3de9ce8aa280 Evan Green 2023-04-07   87  
ea3de9ce8aa280 Evan Green 2023-04-07   88  	for_each_cpu(cpu, cpus) {
ea3de9ce8aa280 Evan Green 2023-04-07   89  		u64 cpu_id;
ea3de9ce8aa280 Evan Green 2023-04-07   90  
ea3de9ce8aa280 Evan Green 2023-04-07   91  		switch (pair->key) {
ea3de9ce8aa280 Evan Green 2023-04-07   92  		case RISCV_HWPROBE_KEY_MVENDORID:
ea3de9ce8aa280 Evan Green 2023-04-07   93  			cpu_id = riscv_cached_mvendorid(cpu);
ea3de9ce8aa280 Evan Green 2023-04-07   94  			break;
ea3de9ce8aa280 Evan Green 2023-04-07   95  		case RISCV_HWPROBE_KEY_MIMPID:
ea3de9ce8aa280 Evan Green 2023-04-07   96  			cpu_id = riscv_cached_mimpid(cpu);
ea3de9ce8aa280 Evan Green 2023-04-07   97  			break;
ea3de9ce8aa280 Evan Green 2023-04-07   98  		case RISCV_HWPROBE_KEY_MARCHID:
ea3de9ce8aa280 Evan Green 2023-04-07   99  			cpu_id = riscv_cached_marchid(cpu);
ea3de9ce8aa280 Evan Green 2023-04-07  100  			break;
ea3de9ce8aa280 Evan Green 2023-04-07  101  		}
ea3de9ce8aa280 Evan Green 2023-04-07  102  
ea3de9ce8aa280 Evan Green 2023-04-07  103  		if (first)
ea3de9ce8aa280 Evan Green 2023-04-07 @104  			id = cpu_id;
ea3de9ce8aa280 Evan Green 2023-04-07  105  
ea3de9ce8aa280 Evan Green 2023-04-07  106  		/*
ea3de9ce8aa280 Evan Green 2023-04-07  107  		 * If there's a mismatch for the given set, return -1 in the
ea3de9ce8aa280 Evan Green 2023-04-07  108  		 * value.
ea3de9ce8aa280 Evan Green 2023-04-07  109  		 */
ea3de9ce8aa280 Evan Green 2023-04-07  110  		if (id != cpu_id) {
ea3de9ce8aa280 Evan Green 2023-04-07  111  			id = -1ULL;
ea3de9ce8aa280 Evan Green 2023-04-07  112  			break;
ea3de9ce8aa280 Evan Green 2023-04-07  113  		}
ea3de9ce8aa280 Evan Green 2023-04-07  114  	}
ea3de9ce8aa280 Evan Green 2023-04-07  115  
ea3de9ce8aa280 Evan Green 2023-04-07  116  	pair->value = id;
ea3de9ce8aa280 Evan Green 2023-04-07  117  }
ea3de9ce8aa280 Evan Green 2023-04-07  118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
