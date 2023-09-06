Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D696AB1
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Sep 2023 19:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694030226; x=1725566226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F0LmowB+/gCXTS63GbgpB/ztxaJqsiCjS6vroSBz2mg=;
  b=G+9mItuDtZ0HYNy5XzF/P55f94iOhqTybq+1DFBaFb/qYy5SZ0+2Y/nn
   0jSKtZkCE8uy9ktgZsRJN+ZSSf2JhTovvpB4vxqD1RUCCrdsMzHoth3lg
   Lxhf8X8J9XwPVM+4PHQ+R2+Y1IZjzvdGP1A8qHECPhUt64WYYHGhZ2LMQ
   dnsOBwTkhCW+1wWs4349/O3AReUQ4/S4g95VJB1KaPbliWeUebBy5Zog4
   PZYq4K74V5iEu88tgyN/wz3vK9zPfDWQZNg8dLVzrWiO1lUqgovqxeOOe
   x2G1ZhqEhdIoExCV15HxKmyCzjMSs568h2B/HjW0pat9tnWgGpUSQ5d6J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="441153360"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="441153360"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 12:57:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="884868418"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="884868418"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2023 12:56:48 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdye2-0000YB-04;
	Wed, 06 Sep 2023 19:56:58 +0000
Date: Thu, 7 Sep 2023 03:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:279:10: sparse:
 sparse: decimal constant 2200000000 is between LONG_MAX and ULONG_MAX. For
 C99 that means long long, C90 compilers are very likely to produce unsigned
 long (and a warning) here
Message-ID: <202309070306.Vsssfcjq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:279:10: sparse: sparse: decimal constant 2200000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chris Morgan <macromorgan@hotmail.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   744a759492b5c57ff24a6e8aabe47b17ad8ee964
commit: b8ecfbaf2e7268d4f934678d00a3849eda0cf7c9 phy: rockchip: inno-dsidphy: Add support for rk3568
date:   12 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 months ago
config: csky-randconfig-r121-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070306.Vsssfcjq-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230907/202309070306.Vsssfcjq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309070306.Vsssfcjq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:279:10: sparse: sparse: decimal constant 2200000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here
   drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:280:10: sparse: sparse: decimal constant 2400000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here
   drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:281:10: sparse: sparse: decimal constant 2500000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here
   drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c: note: in included file (through arch/csky/include/asm/io.h, include/linux/io.h, include/linux/iopoll.h):
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:379:22: sparse:     got restricted __le32 [usertype]

vim +279 drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c

b8ecfbaf2e7268 Chris Morgan 2022-09-19  260  
b8ecfbaf2e7268 Chris Morgan 2022-09-19  261  static const
b8ecfbaf2e7268 Chris Morgan 2022-09-19  262  struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_2_5ghz[] = {
b8ecfbaf2e7268 Chris Morgan 2022-09-19  263  	{ 110000000, 0x02, 0x7f, 0x16, 0x02, 0x02},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  264  	{ 150000000, 0x02, 0x7f, 0x16, 0x03, 0x02},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  265  	{ 200000000, 0x02, 0x7f, 0x17, 0x04, 0x02},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  266  	{ 250000000, 0x02, 0x7f, 0x17, 0x05, 0x04},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  267  	{ 300000000, 0x02, 0x7f, 0x18, 0x06, 0x04},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  268  	{ 400000000, 0x03, 0x7e, 0x19, 0x07, 0x04},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  269  	{ 500000000, 0x03, 0x7c, 0x1b, 0x07, 0x08},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  270  	{ 600000000, 0x03, 0x70, 0x1d, 0x08, 0x10},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  271  	{ 700000000, 0x05, 0x40, 0x1e, 0x08, 0x30},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  272  	{ 800000000, 0x05, 0x02, 0x1f, 0x09, 0x30},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  273  	{1000000000, 0x05, 0x08, 0x20, 0x09, 0x30},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  274  	{1200000000, 0x06, 0x03, 0x32, 0x14, 0x0f},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  275  	{1400000000, 0x09, 0x03, 0x32, 0x14, 0x0f},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  276  	{1600000000, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  277  	{1800000000, 0x0e, 0x47, 0x7a, 0x0e, 0x0f},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  278  	{2000000000, 0x11, 0x64, 0x7a, 0x0e, 0x0b},
b8ecfbaf2e7268 Chris Morgan 2022-09-19 @279  	{2200000000, 0x13, 0x64, 0x7e, 0x15, 0x0b},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  280  	{2400000000, 0x13, 0x33, 0x7f, 0x15, 0x6a},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  281  	{2500000000, 0x15, 0x54, 0x7f, 0x15, 0x6a},
b8ecfbaf2e7268 Chris Morgan 2022-09-19  282  };
b8ecfbaf2e7268 Chris Morgan 2022-09-19  283  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
