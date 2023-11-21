Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9F151C39
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKsMrkLc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700583909; x=1732119909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=asxtRRC4r/dd9LYqsxqKa0tqmon5T+bkuolOGIc71tg=;
  b=jKsMrkLcLbCq7JEm3pFd6QVqdip9uH+JQDLlVXwuiWQlMocT59OO1xT/
   O66X7AK9cySzSsNDvE45lprkyBO70kFNAufi/utMHYvvTJIsUnrbfFPGw
   vrFm2CIgqVY8JnGQUuRm0irAXVf/ES3WgAVDf+jGprAJV91RuNuYqXA8y
   7MJUqtQVWUSQhgQFzZATQzPCGZ2d6KqiJeeNoJqKrgZuOAXLNqFIqR9d1
   w4Lz+0FbL2+2ewlVKI7Tn0Ov07lwd4qWaxcGz59gxt1UTHQFZoHxAUR2G
   5b95xfF92NLoLCN3pbo9ooEuN2gpYOTu6ql+BiVA2XE3XdIoz09GE2Gjt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="389023639"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="389023639"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 08:25:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="14951675"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Nov 2023 08:25:07 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5TYf-00081O-1k;
	Tue, 21 Nov 2023 16:25:05 +0000
Date: Wed, 22 Nov 2023 00:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/power/hibernate.c:17:22: sparse: sparse: cast from
 unknown type
Message-ID: <202311220041.CJyaZM2e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/loongarch/power/hibernate.c:17:22: sparse: sparse: cast from unknown type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: WANG Xuerui <git@xen0n.name>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: 53a4858ccd0d27538f9ab1ac2bead002fca97edc LoongArch: Make the CPUCFG&CSR ops simple aliases of compiler built-ins
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r121-20231121 (https://download.01.org/0day-ci/archive/20231122/202311220041.CJyaZM2e-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311220041.CJyaZM2e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311220041.CJyaZM2e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/power/hibernate.c:17:22: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
>> arch/loongarch/power/hibernate.c:17:22: sparse: sparse: cast from unknown type
   arch/loongarch/power/hibernate.c:18:22: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/power/hibernate.c:18:22: sparse: sparse: cast from unknown type
   arch/loongarch/power/hibernate.c:19:22: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/power/hibernate.c:19:22: sparse: sparse: cast from unknown type
   arch/loongarch/power/hibernate.c:20:22: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/power/hibernate.c:20:22: sparse: sparse: cast from unknown type
   arch/loongarch/power/hibernate.c:21:27: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/power/hibernate.c:21:27: sparse: sparse: cast from unknown type
   arch/loongarch/power/hibernate.c:29:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/power/hibernate.c:29:9: sparse: sparse: cast from unknown type
   arch/loongarch/power/hibernate.c:30:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/power/hibernate.c:30:9: sparse: sparse: cast from unknown type
   arch/loongarch/power/hibernate.c:31:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/power/hibernate.c:31:9: sparse: sparse: cast from unknown type
   arch/loongarch/power/hibernate.c:32:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/power/hibernate.c:32:9: sparse: sparse: cast from unknown type
   arch/loongarch/power/hibernate.c:33:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/power/hibernate.c:33:9: sparse: sparse: cast from unknown type

vim +17 arch/loongarch/power/hibernate.c

7db54bfe44a662 Huacai Chen 2022-12-10   7  
7db54bfe44a662 Huacai Chen 2022-12-10   8  static u32 saved_crmd;
7db54bfe44a662 Huacai Chen 2022-12-10   9  static u32 saved_prmd;
7db54bfe44a662 Huacai Chen 2022-12-10  10  static u32 saved_euen;
7db54bfe44a662 Huacai Chen 2022-12-10  11  static u32 saved_ecfg;
7db54bfe44a662 Huacai Chen 2022-12-10  12  static u64 saved_pcpu_base;
7db54bfe44a662 Huacai Chen 2022-12-10 @13  struct pt_regs saved_regs;
7db54bfe44a662 Huacai Chen 2022-12-10  14  
7db54bfe44a662 Huacai Chen 2022-12-10  15  void save_processor_state(void)
7db54bfe44a662 Huacai Chen 2022-12-10  16  {
7db54bfe44a662 Huacai Chen 2022-12-10 @17  	saved_crmd = csr_read32(LOONGARCH_CSR_CRMD);
7db54bfe44a662 Huacai Chen 2022-12-10  18  	saved_prmd = csr_read32(LOONGARCH_CSR_PRMD);
7db54bfe44a662 Huacai Chen 2022-12-10  19  	saved_euen = csr_read32(LOONGARCH_CSR_EUEN);
7db54bfe44a662 Huacai Chen 2022-12-10  20  	saved_ecfg = csr_read32(LOONGARCH_CSR_ECFG);
7db54bfe44a662 Huacai Chen 2022-12-10  21  	saved_pcpu_base = csr_read64(PERCPU_BASE_KS);
7db54bfe44a662 Huacai Chen 2022-12-10  22  
7db54bfe44a662 Huacai Chen 2022-12-10  23  	if (is_fpu_owner())
7db54bfe44a662 Huacai Chen 2022-12-10  24  		save_fp(current);
7db54bfe44a662 Huacai Chen 2022-12-10  25  }
7db54bfe44a662 Huacai Chen 2022-12-10  26  

:::::: The code at line 17 was first introduced by commit
:::::: 7db54bfe44a662c8f2c10277bccfa02c2f4c719c LoongArch: Add hibernation (ACPI S4) support

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
