Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685D14A986
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUwgKqjv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702307087; x=1733843087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/SjJSf0J40LtOlGArIXJ6hEAYlS+yf340AGFxsyd2Cc=;
  b=iUwgKqjvuiLl8p1GzSIPQGHw4y0L/lNVoHJ2++A7skEfHoB9nC176i4E
   KBpC6FT8fwStEuLFXTtqj0YjENhinOAhjQKGni0MG4fZa7PmEq61X2hka
   676o/BgVqN+P+DwTKz/hS9WByxG/nQR6+0yrZONWTht6qM/NJv3Mb299N
   KuJzXTaMpuGTN52U/8LV2elG9T2RnqPC8e27AVKxmbJoR14refFj0CDQH
   T2+g3y3XfGbcH8YFOvIgUMBGRLNh3oF1uU1z4QAkgB3thrNXlKNlk0lkk
   WuRvSPuZwiFkEEGB6ZX4kRaxiRb46DM2euwQxbEobZrywO8aSDkRIdmBj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1468678"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1468678"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 07:04:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="776712942"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="776712942"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 11 Dec 2023 07:04:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rChpa-000I8U-13;
	Mon, 11 Dec 2023 15:04:26 +0000
Date: Mon, 11 Dec 2023 23:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202312112243.5guklOnS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only include/linux/compiler_types.h file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: 25fd529c34d063d1bef23742f2e8f8341c639dc3 sparse: group the defines by functionality
date:   3 years, 4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 years, 4 months ago
config: sh-randconfig-r111-20231117 (https://download.01.org/0day-ci/archive/20231211/202312112243.5guklOnS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312112243.5guklOnS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312112243.5guklOnS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/watchdog/shwdt.c: note: in included file:
   arch/sh/include/asm/watchdog.h:145:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:145:16: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:145:16: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:157:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:157:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:157:9: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:135:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:135:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:135:9: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:145:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:145:16: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:145:16: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:157:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:157:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:157:9: sparse:     got unsigned int
   drivers/watchdog/shwdt.c: note: in included file (through arch/sh/include/asm/watchdog.h):
>> arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse:     got unsigned int
   arch/sh/include/cpu-sh2/cpu/watchdog.h:62:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/cpu-sh2/cpu/watchdog.h:62:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/cpu-sh2/cpu/watchdog.h:62:9: sparse:     got unsigned int
   drivers/watchdog/shwdt.c: note: in included file:
   arch/sh/include/asm/watchdog.h:145:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:145:16: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:145:16: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:157:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:157:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:157:9: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:145:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:145:16: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:145:16: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:157:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:157:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:157:9: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:135:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:135:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:135:9: sparse:     got unsigned int

vim +44 arch/sh/include/cpu-sh2/cpu/watchdog.h

^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  33  
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  34  /**
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  35   * 	sh_wdt_read_rstcsr - Read from Reset Control/Status Register
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  36   *
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  37   *	Reads back the RSTCSR value.
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  38   */
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  39  static inline __u8 sh_wdt_read_rstcsr(void)
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  40  {
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  41  	/*
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  42  	 * Same read/write brain-damage as for WTCNT here..
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  43  	 */
9d56dd3b083a3b arch/sh/include/cpu-sh2/cpu/watchdog.h Paul Mundt     2010-01-26 @44  	return __raw_readb(RSTCSR_R);
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  45  }
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  46  

:::::: The code at line 44 was first introduced by commit
:::::: 9d56dd3b083a3bec56e9da35ce07baca81030b03 sh: Mass ctrl_in/outX to __raw_read/writeX conversion.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
