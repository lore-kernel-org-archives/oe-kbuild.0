Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D05171D2
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Sep 2023 23:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695425777; x=1726961777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z0HhaprXXbTu7O4vVNvExAmtoDsZJZ7pXDvL3h/eakE=;
  b=itIVRFqbt62/rU4qXCwYuCkzQgCUhEihqg5K3x5KgcENR2B4zIj1zpBa
   iwktFid5q5ygvtvlsCEhfdBn8SuA3uW2CQkKZ3lya5enZJ3NGFNxlDsma
   333gTIUUv224mJFm0YjIAmxVTYU9gAC/DjvVurA04UKe3DJ+oDiOv98Aw
   Y7T/3fHRcbl2GtkRO/dcoMoQq1LKmDetNZQKSrI6dhWdXUqFX/nFs1cLX
   QLfFFfWSCa++O6qMJ5h+nQlKZ2iKPXbYL4sPFnawL61GNJNPiDhTU+ZRR
   kJ+ex3JEqwMQt/NtrfarsE0XxGMsK3HPlQfkRm8bamZyPS7hiNfiFdAea
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="411898078"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="411898078"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 16:36:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="817977303"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="817977303"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2023 16:36:13 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjpgx-0001Sy-2Z;
	Fri, 22 Sep 2023 23:36:11 +0000
Date: Sat, 23 Sep 2023 07:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/csky/kernel/setup.c:133 csky_start() warn: ignoring unreachable
 code.
Message-ID: <202309230748.FWJXbNrK-lkp@intel.com>
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
head:   8018e02a87031a5e8afcbd9d35133edd520076bb
commit: 25a6917ca63ad4470bf88535c56f0dec72b570fe init: Mark start_kernel() __noreturn
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230923/202309230748.FWJXbNrK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309230748.FWJXbNrK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309230748.FWJXbNrK-lkp@intel.com/

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
