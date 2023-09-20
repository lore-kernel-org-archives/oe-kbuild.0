Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199BEA49
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Sep 2023 01:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695174930; x=1726710930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TeJfpm3e64y0AMfmY7eA0yzDAbuMgwi6mjA+6mQ7T/M=;
  b=fz4V0C4+F7uoEbg/l9YylnIs95nySVuMI4sDhAQvVxEHP0CynnY1k/LC
   9BcKdrFZ+484vM6lYLwqT7S3X8V0Bn113ER27M9o0Utao3uDqyD3y+6Uz
   DoU6pMnSXuA2ot95uba2MWUnrwm1YptxvdH0UZxXJeHXwe+4wwrNJhW5P
   bUWVJ14qeL+j3ZlJjUEdsMo9EBZE6jV4/lQjHfuv7oYar+i2khEmm1Aod
   3uRDathm04Ml9Ec/+PAiOnqchf2P4Vm2UMwWlJwF2CAWkEi4uRgqlXRNK
   VdFwJlCDVhSEgmENPZDysRXGkxrAOq282tblBWENwGie7kBVApRJrV40P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="360355869"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="360355869"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 18:55:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="836650828"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="836650828"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2023 18:55:27 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qimR3-0008AS-2L;
	Wed, 20 Sep 2023 01:55:25 +0000
Date: Wed, 20 Sep 2023 09:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/csky/kernel/setup.c:133 csky_start() warn: ignoring unreachable
 code.
Message-ID: <202309200915.MJXIucuV-lkp@intel.com>
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
head:   2cf0f715623872823a72e451243bbf555d10d032
commit: 25a6917ca63ad4470bf88535c56f0dec72b570fe init: Mark start_kernel() __noreturn
date:   5 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 5 months ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230920/202309200915.MJXIucuV-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230920/202309200915.MJXIucuV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309200915.MJXIucuV-lkp@intel.com/

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
