Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49C73065F
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 23:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5ZtPDNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699398306; x=1730934306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h1np4h8CoUaNBd3/MYD5kbkSXjEcAcAS3CoeuWRCiZE=;
  b=R5ZtPDNv6uA3l2p6ftZyGVgz5qSepiajMKcDk26tDbd7hdzvzuDIomSc
   f5FAoKOY4BBVMo0wqjyjbY6okBg0M8S69Ux+nvBSXCM4KEjLoRgeJ4y2x
   F+iXA9MPX8cf/wTmj/iWaEyBPoS1v2KyWOAQFk3qI26a2TSJrhPH855VN
   7zMblvNhC26GIGZ9iyO+lFnKSQPUkP7s1KXRr1JWCU0py1u7bB5fIP6iN
   EFjYkBzXZOPG8eG0H2q6ZLzARYgxOw1U99CO6vjAXgK4bpJ5Db7Shgxih
   FIlcupJoDEN02V5vk6gN5+f9/6U1hdVjET2tJhy2DYukbgvr/kWMVf0bb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="8294243"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="8294243"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 15:05:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="1094312199"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="1094312199"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Nov 2023 15:05:03 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0V80-0007Sx-28;
	Tue, 07 Nov 2023 23:05:00 +0000
Date: Wed, 8 Nov 2023 07:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/mm/ioremap.c:9:21: sparse:    void [noderef] __iomem
 *extern [addressable] [toplevel] early_ioremap( ... )
Message-ID: <202311080644.krjWCkWA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/loongarch/mm/ioremap.c:9:21: sparse:    void [noderef] __iomem *extern [addressable] [toplevel] early_ioremap( ... )"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bibo Mao <maobibo@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   13d88ac54ddd1011b6e94443958e798aa06eb835
commit: c718a0bad75ccef117000223b00fd6a14f849135 LoongArch: Fix some build warnings with W=1
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
config: loongarch-randconfig-r132-20231107 (https://download.01.org/0day-ci/archive/20231108/202311080644.krjWCkWA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311080644.krjWCkWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311080644.krjWCkWA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/mm/ioremap.c:9:21: sparse: sparse: symbol 'early_ioremap' redeclared with different type (different address spaces):
>> arch/loongarch/mm/ioremap.c:9:21: sparse:    void [noderef] __iomem *extern [addressable] [toplevel] early_ioremap( ... )
   arch/loongarch/mm/ioremap.c: note: in included file:
   include/asm-generic/early_ioremap.h:13:13: sparse: note: previously declared as:
>> include/asm-generic/early_ioremap.h:13:13: sparse:    void *extern [addressable] [toplevel] early_ioremap( ... )
   arch/loongarch/mm/ioremap.c:14:13: sparse: sparse: symbol 'early_iounmap' redeclared with different type (incompatible argument 1 (different address spaces)):
>> arch/loongarch/mm/ioremap.c:14:13: sparse:    void extern [addressable] [toplevel] early_iounmap( ... )
   include/asm-generic/early_ioremap.h:20:13: sparse: note: previously declared as:
>> include/asm-generic/early_ioremap.h:20:13: sparse:    void extern [addressable] [toplevel] early_iounmap( ... )
   arch/loongarch/mm/ioremap.c:21:30: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/loongarch/mm/ioremap.c:21:30: sparse:     expected void *
   arch/loongarch/mm/ioremap.c:21:30: sparse:     got void [noderef] __iomem *
   arch/loongarch/mm/ioremap.c:27:30: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/loongarch/mm/ioremap.c:27:30: sparse:     expected void *
   arch/loongarch/mm/ioremap.c:27:30: sparse:     got void [noderef] __iomem *

vim +9 arch/loongarch/mm/ioremap.c

09cfefb7fa70c3 Huacai Chen 2022-05-31   8  
09cfefb7fa70c3 Huacai Chen 2022-05-31  @9  void __init __iomem *early_ioremap(u64 phys_addr, unsigned long size)
09cfefb7fa70c3 Huacai Chen 2022-05-31  10  {
09cfefb7fa70c3 Huacai Chen 2022-05-31  11  	return ((void __iomem *)TO_CACHE(phys_addr));
09cfefb7fa70c3 Huacai Chen 2022-05-31  12  }
09cfefb7fa70c3 Huacai Chen 2022-05-31  13  
09cfefb7fa70c3 Huacai Chen 2022-05-31 @14  void __init early_iounmap(void __iomem *addr, unsigned long size)
09cfefb7fa70c3 Huacai Chen 2022-05-31  15  {
09cfefb7fa70c3 Huacai Chen 2022-05-31  16  

:::::: The code at line 9 was first introduced by commit
:::::: 09cfefb7fa70c3af011b0db0a513fd80b2f18abc LoongArch: Add memory management

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
