Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1D42EAE6
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLNPtQPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700068199; x=1731604199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9xErIdZzjPB8mkekcHEQhHx8h/GJNJxYDGtoVw3h4eU=;
  b=YLNPtQPbtBDmWK6R4OI/8hTUTakq2V8OpFDFWrXr7kiSevhAxUZiKkKa
   CmBW6uvuaLjz7YXY5nLN895jWb3Pcskfs8gPPB7qg52eRQ5wReFJNJmCM
   ObalwwqsB/aWVQ7o5lT6u3TDwHviCkVpW/TnYG9V8D8BhGTYmxp8vy5HO
   hzZRia1puDQ+hr++S9XENTwtIjg9yrp3RjW6Pj+OalR/67nhE1QtoH4Ud
   GX93Nhq3w/QPstg/V9PP4VTzO5yCLbTkCiw3JtxDUxdb9WdbnZbdomqYC
   WsfdDGWGQwmwQJwrwhG20hIQ/ra+XrU2oKSFxo4t2fOP7m++6jXE9trMT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="371101655"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="371101655"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 09:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="758542195"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="758542195"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Nov 2023 09:09:57 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3JOj-0000do-2V;
	Wed, 15 Nov 2023 17:09:54 +0000
Date: Thu, 16 Nov 2023 01:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/power/suspend.c:33:26: sparse: sparse: cast from
 unknown type
Message-ID: <202311160133.3eVywLsb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/loongarch/power/suspend.c:33:26: sparse: sparse: cast from unknown type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: WANG Xuerui <git@xen0n.name>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 53a4858ccd0d27538f9ab1ac2bead002fca97edc LoongArch: Make the CPUCFG&CSR ops simple aliases of compiler built-ins
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r133-20231107 (https://download.01.org/0day-ci/archive/20231116/202311160133.3eVywLsb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160133.3eVywLsb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160133.3eVywLsb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/power/suspend.c:33:26: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/power/suspend.c:33:26: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:34:27: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/power/suspend.c:34:27: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:35:29: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/power/suspend.c:35:29: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:36:29: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/power/suspend.c:36:29: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:37:27: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/power/suspend.c:37:27: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:38:27: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/power/suspend.c:38:27: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:47:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/power/suspend.c:47:9: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:48:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/power/suspend.c:48:9: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:49:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/power/suspend.c:49:9: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:50:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/power/suspend.c:50:9: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:52:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/power/suspend.c:52:9: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:53:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/power/suspend.c:53:9: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:54:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/power/suspend.c:54:9: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:55:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/power/suspend.c:55:9: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:56:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/power/suspend.c:56:9: sparse: sparse: cast from unknown type
   arch/loongarch/power/suspend.c:57:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/power/suspend.c:57:9: sparse: sparse: cast from unknown type

vim +33 arch/loongarch/power/suspend.c

366bb35a8e4819 Huacai Chen 2022-12-10  29  
366bb35a8e4819 Huacai Chen 2022-12-10  30  static void arch_common_suspend(void)
366bb35a8e4819 Huacai Chen 2022-12-10  31  {
366bb35a8e4819 Huacai Chen 2022-12-10  32  	save_counter();
366bb35a8e4819 Huacai Chen 2022-12-10 @33  	saved_regs.pgd = csr_read64(LOONGARCH_CSR_PGDL);
366bb35a8e4819 Huacai Chen 2022-12-10  34  	saved_regs.kpgd = csr_read64(LOONGARCH_CSR_PGDH);
366bb35a8e4819 Huacai Chen 2022-12-10  35  	saved_regs.pwctl0 = csr_read32(LOONGARCH_CSR_PWCTL0);
366bb35a8e4819 Huacai Chen 2022-12-10  36  	saved_regs.pwctl1 = csr_read32(LOONGARCH_CSR_PWCTL1);
366bb35a8e4819 Huacai Chen 2022-12-10  37  	saved_regs.ecfg = csr_read32(LOONGARCH_CSR_ECFG);
366bb35a8e4819 Huacai Chen 2022-12-10  38  	saved_regs.euen = csr_read32(LOONGARCH_CSR_EUEN);
366bb35a8e4819 Huacai Chen 2022-12-10  39  
366bb35a8e4819 Huacai Chen 2022-12-10  40  	loongarch_suspend_addr = loongson_sysconf.suspend_addr;
366bb35a8e4819 Huacai Chen 2022-12-10  41  }
366bb35a8e4819 Huacai Chen 2022-12-10  42  

:::::: The code at line 33 was first introduced by commit
:::::: 366bb35a8e48198cefcd3484ac6b2374d1347873 LoongArch: Add suspend (ACPI S3) support

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
