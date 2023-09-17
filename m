Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC682594
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Sep 2023 12:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694952454; x=1726488454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8YCipJkS4Y5Bh/fZnmRcCExKnHJEVgTtRatOLZK3Lrk=;
  b=L/kYqA1EceGH2kRBUF9uqJ2f6nZVVUygX7ZtuPnHke0XhddcPWFvgJST
   1OQYRjAllXARdr+jDcHwnGgBGyLm//fYjOubBs/REYnI6ys1bxuQ+0rl5
   +C7Y2nCve61dyCrGkhNkoDtX94sc41seBNOnNouS6yGZBNRKsbP8BCpIG
   VFE4jn5zcs+NB8C6jiUhtXL1rjR52d6W1KnsbNoGGrVA0AV5uTQ8upk7T
   omppxO9/XNXPmGdX2BVSAT6Lg/3Z9Zojnh03oMj0LaIpHUQCtdxEjPHp8
   uB07D7tUuKlNmnjPLew0zJVY4tfGYSRK7beFQtEq47Dmh3yEjFDuk6Mr6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="369817498"
X-IronPort-AV: E=Sophos;i="6.02,154,1688454000"; 
   d="scan'208";a="369817498"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 05:07:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="919162967"
X-IronPort-AV: E=Sophos;i="6.02,154,1688454000"; 
   d="scan'208";a="919162967"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Sep 2023 05:07:32 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhqYk-0005Bo-0v;
	Sun, 17 Sep 2023 12:07:30 +0000
Date: Sun, 17 Sep 2023 20:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/csky/kernel/setup.c:133 csky_start() warn: ignoring unreachable
 code.
Message-ID: <202309172057.sPSAupeC-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b0d403eabbe135d8dbb40ad5e41018947d336c
commit: 25a6917ca63ad4470bf88535c56f0dec72b570fe init: Mark start_kernel() __noreturn
date:   5 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 months ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230917/202309172057.sPSAupeC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309172057.sPSAupeC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309172057.sPSAupeC-lkp@intel.com/

smatch warnings:
arch/csky/kernel/setup.c:133 csky_start() warn: ignoring unreachable code.

vim +133 arch/csky/kernel/setup.c

0c8a32eed1625a Guo Ren 2020-09-07  115  
205353fa06cc5d Guo Ren 2019-04-12  116  asmlinkage __visible void __init csky_start(unsigned int unused,
205353fa06cc5d Guo Ren 2019-04-12  117  					    void *dtb_start)
9143a9359d0511 Guo Ren 2018-09-05  118  {
9143a9359d0511 Guo Ren 2018-09-05  119  	/* Clean up bss section */
9143a9359d0511 Guo Ren 2018-09-05  120  	memset(__bss_start, 0, __bss_stop - __bss_start);
9143a9359d0511 Guo Ren 2018-09-05  121  
0c8a32eed1625a Guo Ren 2020-09-07  122  	va_pa_offset = read_mmu_msa() & ~(SSEG_SIZE - 1);
f62e31623d718a Guo Ren 2019-04-08  123  
9143a9359d0511 Guo Ren 2018-09-05  124  	pre_trap_init();
9143a9359d0511 Guo Ren 2018-09-05  125  
205353fa06cc5d Guo Ren 2019-04-12  126  	if (dtb_start == NULL)
9143a9359d0511 Guo Ren 2018-09-05  127  		early_init_dt_scan(__dtb_start);
9143a9359d0511 Guo Ren 2018-09-05  128  	else
205353fa06cc5d Guo Ren 2019-04-12  129  		early_init_dt_scan(dtb_start);
9143a9359d0511 Guo Ren 2018-09-05  130  
9143a9359d0511 Guo Ren 2018-09-05  131  	start_kernel();
9143a9359d0511 Guo Ren 2018-09-05  132  
9143a9359d0511 Guo Ren 2018-09-05 @133  	asm volatile("br .\n");

:::::: The code at line 133 was first introduced by commit
:::::: 9143a9359d051142081b26c3726c928f965c5eb7 csky: Kernel booting

:::::: TO: Guo Ren <ren_guo@c-sky.com>
:::::: CC: Guo Ren <ren_guo@c-sky.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
