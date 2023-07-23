Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96B87E4
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Jul 2023 01:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690077339; x=1721613339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xXS+nZjHnzVn7TbNaJKFQZmig3zX/DeC5HGIszvXGLs=;
  b=Frzu1VTlRepiw36gwZTn5m4uFtiNzzqfYnQHm2Z7GAQt3ThZtsSsbKvb
   5gqkN7xdoeoX00BUl2fx6A3e+rA+d0DgvD8dnBlcfEy9amIqaGJGW/MRM
   Kek+RdJ/JS1AAvbhChlTrqUedGUnW2z9gnRR/RxSOp83sIYD2lCtVYMqa
   AiMewMCFFzbEUlXGDJHCa28sH+T8nb7SDrz8G85gz3Cth8CDF1sl6CAr2
   VHJ8pBX64WIkLzpOy0yc1wulNNqD3DId/w+Qm4dnN/RFiJ8Kd+BuZxFfv
   thxgAk8lAQprx6OG6dcPAW8PFI4oMtWmeh2J7q7v0RUBRJ2kCWL+pgPOZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="453616976"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="453616976"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 18:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="971853955"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="971853955"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jul 2023 18:55:25 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNOJd-0008jp-2u;
	Sun, 23 Jul 2023 01:55:21 +0000
Date: Sun, 23 Jul 2023 09:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:279:10: sparse:
 sparse: decimal constant 2200000000 is between LONG_MAX and ULONG_MAX. For
 C99 that means long long, C90 compilers are very likely to produce unsigned
 long (and a warning) here
Message-ID: <202307230934.TopzWTfS-lkp@intel.com>
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
head:   295e1388de2d5c0c354adbd65d0319c5d636c222
commit: b8ecfbaf2e7268d4f934678d00a3849eda0cf7c9 phy: rockchip: inno-dsidphy: Add support for rk3568
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-r081-20230723 (https://download.01.org/0day-ci/archive/20230723/202307230934.TopzWTfS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230934.TopzWTfS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307230934.TopzWTfS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:279:10: sparse: sparse: decimal constant 2200000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here
   drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:280:10: sparse: sparse: decimal constant 2400000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here
   drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:281:10: sparse: sparse: decimal constant 2500000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

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
