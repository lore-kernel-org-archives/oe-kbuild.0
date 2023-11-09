Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A01C20E6
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Nov 2023 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbHF4Smb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699540722; x=1731076722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nsq0FkQutJ0a56QYETFhVY4/a/CGodcNXEy1avXK4rI=;
  b=LbHF4SmbynUAsIoo34Vr2oF7yg/vRGDZiJSCqvZUZC+8dXDgus3ZCWai
   qPFqQVpu2/4g9hFgqY9Q4PRI6ajvl8yFxq31QjWtIkOvWrDHalepFIasd
   ywbpua3pwQiApKn0rjhymDQqnItLf7lXsCRFGPmK3u5PmlkgGnmkxyBWh
   ZAULz+oYBZs9DwCGyBO4cs8PE3dufYMAp3hd34wM1lYEE3+Crq5hWHIXU
   VVhbr3No3heGmzE3Qu5oLWvqmA+HUm1DouNzqdm5Gb2nSAHAkB4+kdhCT
   yh42wNBLErkGacvO9X+52PfGXa7HKV++xMQK+EoPPjArni1ArUpOeJWHO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="388849002"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="388849002"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 06:38:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="11549146"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Nov 2023 06:38:40 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r16B4-0008nw-1K;
	Thu, 09 Nov 2023 14:38:38 +0000
Date: Thu, 9 Nov 2023 22:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/mm/ioremap.c:9:21: sparse:    void [noderef] __iomem
 *extern [addressable] [toplevel] early_ioremap( ... )
Message-ID: <202311092251.sjJ3oXOT-lkp@intel.com>
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
head:   6bc986ab839c844e78a2333a02e55f02c9e57935
commit: c718a0bad75ccef117000223b00fd6a14f849135 LoongArch: Fix some build warnings with W=1
date:   7 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 weeks ago
config: loongarch-randconfig-r132-20231107 (https://download.01.org/0day-ci/archive/20231109/202311092251.sjJ3oXOT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231109/202311092251.sjJ3oXOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311092251.sjJ3oXOT-lkp@intel.com/

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
