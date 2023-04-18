Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F22123A7
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Apr 2023 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681842664; x=1713378664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wlApgj8fs3wGnFc00U1AZTGnXTLpq1L6U5HnfLoUxA=;
  b=K6bwZCFB8wMqAxMP0zFWJxpqBWBLAaVRKgOMcceh2jd1xOs0mTPnPirX
   5+WxQGtNgHibAcohCyNkCfyDTO7eYD93o5MtgKiafszphddYFWLVdeNkn
   ZcfXT0E29Zei7ROqH5oUzMgyCowvCCUKWWfqSjotGQUToSK3qPREQx8ge
   y9Ggg3X6C3ahKQ5h1DyzHvL4j8SvbZCifkF6aZGz6PZgk/eFK27S0RDYR
   /RH8Rb5ATehPInLBskIFePQ4Zum0+DvW+Nh5/KGJ35PivtDRqLQQF6aCd
   oGL3Y0YhktNi8eZbs/CVI+97OoBu3KHxf4CO+KI1HCsfhd+0Pwqk++RDz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="342740732"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="342740732"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 11:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="802628446"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="802628446"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Apr 2023 11:31:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poq6X-000dsx-1h;
	Tue, 18 Apr 2023 18:31:01 +0000
Date: Wed, 19 Apr 2023 02:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jpoimboe:objtool-noinstr 2/15] arch/csky/kernel/setup.c:133
 csky_start() warn: ignoring unreachable code.
Message-ID: <202304190206.5xvTiU3O-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-noinstr
head:   07834a9b80d0646ce181d3173f0315bea7f4d09a
commit: cb5dab6038dfe5156f5d68424cf372f7eed1b934 [2/15] init: Mark start_kernel() __noreturn
:::::: branch date: 7 days ago
:::::: commit date: 11 days ago
config: csky-randconfig-m041-20230418 (https://download.01.org/0day-ci/archive/20230419/202304190206.5xvTiU3O-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304190206.5xvTiU3O-lkp@intel.com/

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
https://github.com/intel/lkp-tests
