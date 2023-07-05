Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C91E110D
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Jul 2023 07:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688543155; x=1720079155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aDWnjDDjOkCSLr96n+dTKP4CAeQgCFKCzmLfOs7H9KU=;
  b=D3xEHTV4RpOHq57bkfbG19hqyWE9TKnFyxLhtTWS+kXNoammxXhm59yk
   fnF2XwGeVfSM4PGEodA/hXZQ0YHZssoDRO0nXak7bEAq+W/8ijAHjn+YY
   Au0iweDBGTFNOQqDclTqKOUpALkLMwHUIPKomjrZGbFpxIMl+ZIVTmj6I
   dIFDgpUsEXa0kZuSUn9Mhgk1mHiGktTa03/fvO6QAP3vC7L77pqvWWjRK
   Ro/ovhjf4mNh7Zf5ApVfOQX1vPoDO5ai78tG5tCodSxxJKAIgE1EcZhdL
   u3nq3QhVLBN3o5GaHtZ3Mt+0xRmZCDHY1McWedwISMU+yIpimIvWO8tKI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="360751639"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="360751639"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 00:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="754264962"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="754264962"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Jul 2023 00:45:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGxCx-0000U8-1a;
	Wed, 05 Jul 2023 07:45:51 +0000
Date: Wed, 5 Jul 2023 15:44:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/csky/kernel/setup.c:133 csky_start() warn: ignoring unreachable
 code.
Message-ID: <202307051531.e2wyIEed-lkp@intel.com>
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
head:   d528014517f2b0531862c02865b9d4c908019dc4
commit: 25a6917ca63ad4470bf88535c56f0dec72b570fe init: Mark start_kernel() __noreturn
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: csky-randconfig-m041-20230705 (https://download.01.org/0day-ci/archive/20230705/202307051531.e2wyIEed-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307051531.e2wyIEed-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307051531.e2wyIEed-lkp@intel.com/

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
