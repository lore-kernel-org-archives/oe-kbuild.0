Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D266D7466
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Nov 2023 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LziMvKTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699688312; x=1731224312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ld6GWmm/b+QVmFNyyXBdmOY+aQehrxLWY1MYWUq+n7s=;
  b=LziMvKTcZbesseAa4xvpGCjKt9Ve7hltdVepWw5zHiaNSe8cVrmhLGiw
   wNUx67VgZKY9xOvs9rmf5oX7YiMPVa/ZavuvSgXvjLQIkJDTba3Yqaq4H
   XzuhZP7e984wGHRItMnicMu9NeT6kkym7cUxsUxKsF7kO2tOaEiPxg0QH
   sJeeH0XZqIDGkYK6emw/5tqDvI9TI4yMQmqewt3ZOlNXURX4osd71ZoMx
   ceGaTuBfFPaJYQiZOg9rc50FlWDpfLjhphWs5HoNqFhp7sDbyPn6kywtP
   TX+KL5uyraSDcUoroVpC/b2rYJJYxmHcI5C3f49v/DqlrJB45n6gVBvBQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="454563377"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="454563377"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 23:38:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="740318732"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="740318732"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Nov 2023 23:38:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1iZY-000AIp-22;
	Sat, 11 Nov 2023 07:38:28 +0000
Date: Sat, 11 Nov 2023 15:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/mm/ioremap.c:9:21: sparse:    void [noderef] __iomem
 *extern [addressable] [toplevel] early_ioremap( ... )
Message-ID: <202311111513.5vVouNcb-lkp@intel.com>
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
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: c718a0bad75ccef117000223b00fd6a14f849135 LoongArch: Fix some build warnings with W=1
date:   7 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 weeks ago
config: loongarch-randconfig-r132-20231107 (https://download.01.org/0day-ci/archive/20231111/202311111513.5vVouNcb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311111513.5vVouNcb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311111513.5vVouNcb-lkp@intel.com/

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
