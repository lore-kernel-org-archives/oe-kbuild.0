Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ECD2771B
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Feb 2023 22:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675634678; x=1707170678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b7BhXpRiSHrFSng4vRQePNIIXqaPMnmuptP3FL+zLzI=;
  b=D1QEXgiK4YpDab4ksAwxH5Rb0fUgM1xKYqdF5oQvUDjzLxKLY/A969Du
   EqUinm1CnUTSMp2rmbFp8wri6CS92TECRfhFf4gHnSGEJdjiiYHG71vfC
   QFgaTuqvti6W6x73oz64OBCHfgtQqIIWf/ZoHBaQywwN6xnhJWrLgEUlx
   TOvVAIJmzieDXnW464DdMZ75GpijQeFw6Ah33sclcv+0+Xi3Nigbo6sf0
   L7QbcsY2mfmO59+d0CV+E4DDhMCvKBqbhhFwTF8Zz4xIICc1PNzk32GEA
   9qHCDcjHJE+eY/Y51wi1q7LLMHZ3+YArUW/J3yAs2KLq+WudHcnC2OXli
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="317099537"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="317099537"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 14:04:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="698668401"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="698668401"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2023 14:04:36 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOn7j-0002FG-2f;
	Sun, 05 Feb 2023 22:04:35 +0000
Date: Mon, 6 Feb 2023 06:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/i2c/busses/i2c-qup.c:1807:2: warning: Value stored to
 'hw_ver' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302060613.5bFNldFC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/i2c/busses/i2c-qup.c:1807:2: warning: Value stored to 'hw_ver' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

Hi Wolfram,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c608f6b58f306ce0e4f459af69a196f5ed6ccf45
commit: 5de717974005fcad2502281e9f82e139ca91f4bb i2c: qup: allow COMPILE_TEST
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20230202 (https://download.01.org/0day-ci/archive/20230206/202302060613.5bFNldFC-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5de717974005fcad2502281e9f82e139ca91f4bb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5de717974005fcad2502281e9f82e139ca91f4bb
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/etnaviv/etnaviv_gem.c:60:21: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct drm_device *dev = etnaviv_obj->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.c:60:21: note: Value stored to 'dev' during its initialization is never read
           struct drm_device *dev = etnaviv_obj->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/thermal/tegra/soctherm.c:2248:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = soctherm_interrupts_init(pdev, tegra);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/tegra/soctherm.c:2248:2: note: Value stored to 'err' is never read
           err = soctherm_interrupts_init(pdev, tegra);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/base/regmap/regmap-mmio.c:52:3: warning: Value stored to 'min_stride' is never read [clang-analyzer-deadcode.DeadStores]
                   min_stride = 0;
                   ^            ~
   drivers/base/regmap/regmap-mmio.c:52:3: note: Value stored to 'min_stride' is never read
                   min_stride = 0;
                   ^            ~
   17 warnings generated.
   drivers/i2c/busses/i2c-rk3x.c:897:2: warning: Value stored to 't_low_ns' is never read [clang-analyzer-deadcode.DeadStores]
           t_low_ns = div_u64(((u64)calc.div_low + 1) * 8 * 1000000000, clk_rate);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:897:2: note: Value stored to 't_low_ns' is never read
           t_low_ns = div_u64(((u64)calc.div_low + 1) * 8 * 1000000000, clk_rate);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:898:2: warning: Value stored to 't_high_ns' is never read [clang-analyzer-deadcode.DeadStores]
           t_high_ns = div_u64(((u64)calc.div_high + 1) * 8 * 1000000000,
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:898:2: note: Value stored to 't_high_ns' is never read
           t_high_ns = div_u64(((u64)calc.div_high + 1) * 8 * 1000000000,
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/gpu/drm/radeon/ni.c:780:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = -EINVAL;
                   ^     ~~~~~~~
   drivers/gpu/drm/radeon/ni.c:780:3: note: Value stored to 'err' is never read
                   err = -EINVAL;
                   ^     ~~~~~~~
   drivers/gpu/drm/radeon/ni.c:1917:3: warning: Value stored to 'tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp = RREG32(GRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/radeon/ni.c:1917:3: note: Value stored to 'tmp' is never read
   drivers/gpu/drm/radeon/ni.c:1931:3: warning: Value stored to 'tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp = RREG32(SRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/radeon/ni.c:1931:3: note: Value stored to 'tmp' is never read
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
>> drivers/i2c/busses/i2c-qup.c:1807:2: warning: Value stored to 'hw_ver' is never read [clang-analyzer-deadcode.DeadStores]
           hw_ver = readl(qup->base + QUP_HW_VERSION);
           ^
   drivers/i2c/busses/i2c-qup.c:1807:2: note: Value stored to 'hw_ver' is never read
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/clocksource/timer-fttmr010.c:99:8: warning: Excessive padding in 'struct fttmr010' (103 padding bytes, where 39 is optimal). Optimal fields order: clkevt, base, tick_rate, t1_enable_val, timer_shutdown, delay_timer, is_aspeed, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct fttmr010 {
   ~~~~~~~^~~~~~~~~~
   drivers/clocksource/timer-fttmr010.c:99:8: note: Excessive padding in 'struct fttmr010' (103 padding bytes, where 39 is optimal). Optimal fields order: clkevt, base, tick_rate, t1_enable_val, timer_shutdown, delay_timer, is_aspeed, consider reordering the fields or adding explicit padding members
   struct fttmr010 {
   ~~~~~~~^~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/clocksource/timer-ixp4xx.c:48:8: warning: Excessive padding in 'struct ixp4xx_timer' (112 padding bytes, where 48 is optimal). Optimal fields order: clkevt, base, latch, delay_timer, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct ixp4xx_timer {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/clocksource/timer-ixp4xx.c:48:8: note: Excessive padding in 'struct ixp4xx_timer' (112 padding bytes, where 48 is optimal). Optimal fields order: clkevt, base, latch, delay_timer, consider reordering the fields or adding explicit padding members
   struct ixp4xx_timer {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +/hw_ver +1807 drivers/i2c/busses/i2c-qup.c

902a91a02bdf02 Austin Christ   2018-05-10  1656  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1657  static int qup_i2c_probe(struct platform_device *pdev)
10c5a8425968f8 Bjorn Andersson 2014-03-13  1658  {
10c5a8425968f8 Bjorn Andersson 2014-03-13  1659  	static const int blk_sizes[] = {4, 16, 32};
10c5a8425968f8 Bjorn Andersson 2014-03-13  1660  	struct qup_i2c_dev *qup;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1661  	unsigned long one_bit_t;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1662  	u32 io_mode, hw_ver, size;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1663  	int ret, fs_div, hs_div;
515da746983bc6 Naveen Kaje     2016-10-11  1664  	u32 src_clk_freq = DEFAULT_SRC_CLK;
515da746983bc6 Naveen Kaje     2016-10-11  1665  	u32 clk_freq = DEFAULT_CLK_FREQ;
9cedf3b2f09946 Sricharan R     2016-02-22  1666  	int blocks;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1667  	bool is_qup_v1;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1668  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1669  	qup = devm_kzalloc(&pdev->dev, sizeof(*qup), GFP_KERNEL);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1670  	if (!qup)
10c5a8425968f8 Bjorn Andersson 2014-03-13  1671  		return -ENOMEM;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1672  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1673  	qup->dev = &pdev->dev;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1674  	init_completion(&qup->xfer);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1675  	platform_set_drvdata(pdev, qup);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1676  
d9f52281bc09bd Austin Christ   2018-05-10  1677  	if (scl_freq) {
d9f52281bc09bd Austin Christ   2018-05-10  1678  		dev_notice(qup->dev, "Using override frequency of %u\n", scl_freq);
d9f52281bc09bd Austin Christ   2018-05-10  1679  		clk_freq = scl_freq;
d9f52281bc09bd Austin Christ   2018-05-10  1680  	} else {
515da746983bc6 Naveen Kaje     2016-10-11  1681  		ret = device_property_read_u32(qup->dev, "clock-frequency", &clk_freq);
515da746983bc6 Naveen Kaje     2016-10-11  1682  		if (ret) {
515da746983bc6 Naveen Kaje     2016-10-11  1683  			dev_notice(qup->dev, "using default clock-frequency %d",
515da746983bc6 Naveen Kaje     2016-10-11  1684  				DEFAULT_CLK_FREQ);
515da746983bc6 Naveen Kaje     2016-10-11  1685  		}
d9f52281bc09bd Austin Christ   2018-05-10  1686  	}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1687  
191424bb6166f6 Sricharan R     2016-01-19  1688  	if (of_device_is_compatible(pdev->dev.of_node, "qcom,i2c-qup-v1.1.1")) {
191424bb6166f6 Sricharan R     2016-01-19  1689  		qup->adap.algo = &qup_i2c_algo;
191424bb6166f6 Sricharan R     2016-01-19  1690  		qup->adap.quirks = &qup_i2c_quirks;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1691  		is_qup_v1 = true;
191424bb6166f6 Sricharan R     2016-01-19  1692  	} else {
191424bb6166f6 Sricharan R     2016-01-19  1693  		qup->adap.algo = &qup_i2c_algo_v2;
de82bb43185558 Wolfram Sang    2018-07-23  1694  		qup->adap.quirks = &qup_i2c_quirks_v2;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1695  		is_qup_v1 = false;
902a91a02bdf02 Austin Christ   2018-05-10  1696  		if (acpi_match_device(qup_i2c_acpi_match, qup->dev))
902a91a02bdf02 Austin Christ   2018-05-10  1697  			goto nodma;
902a91a02bdf02 Austin Christ   2018-05-10  1698  		else
9cedf3b2f09946 Sricharan R     2016-02-22  1699  			ret = qup_i2c_req_dma(qup);
9cedf3b2f09946 Sricharan R     2016-02-22  1700  
9cedf3b2f09946 Sricharan R     2016-02-22  1701  		if (ret == -EPROBE_DEFER)
9cedf3b2f09946 Sricharan R     2016-02-22  1702  			goto fail_dma;
9cedf3b2f09946 Sricharan R     2016-02-22  1703  		else if (ret != 0)
9cedf3b2f09946 Sricharan R     2016-02-22  1704  			goto nodma;
9cedf3b2f09946 Sricharan R     2016-02-22  1705  
6f2f0f6465acbd Abhishek Sahu   2018-03-12  1706  		qup->max_xfer_sg_len = (MX_BLOCKS << 1);
6f2f0f6465acbd Abhishek Sahu   2018-03-12  1707  		blocks = (MX_DMA_BLOCKS << 1) + 1;
a86854d0c599b3 Kees Cook       2018-06-12  1708  		qup->btx.sg = devm_kcalloc(&pdev->dev,
a86854d0c599b3 Kees Cook       2018-06-12  1709  					   blocks, sizeof(*qup->btx.sg),
9cedf3b2f09946 Sricharan R     2016-02-22  1710  					   GFP_KERNEL);
9cedf3b2f09946 Sricharan R     2016-02-22  1711  		if (!qup->btx.sg) {
9cedf3b2f09946 Sricharan R     2016-02-22  1712  			ret = -ENOMEM;
9cedf3b2f09946 Sricharan R     2016-02-22  1713  			goto fail_dma;
9cedf3b2f09946 Sricharan R     2016-02-22  1714  		}
9cedf3b2f09946 Sricharan R     2016-02-22  1715  		sg_init_table(qup->btx.sg, blocks);
9cedf3b2f09946 Sricharan R     2016-02-22  1716  
a86854d0c599b3 Kees Cook       2018-06-12  1717  		qup->brx.sg = devm_kcalloc(&pdev->dev,
a86854d0c599b3 Kees Cook       2018-06-12  1718  					   blocks, sizeof(*qup->brx.sg),
9cedf3b2f09946 Sricharan R     2016-02-22  1719  					   GFP_KERNEL);
9cedf3b2f09946 Sricharan R     2016-02-22  1720  		if (!qup->brx.sg) {
9cedf3b2f09946 Sricharan R     2016-02-22  1721  			ret = -ENOMEM;
9cedf3b2f09946 Sricharan R     2016-02-22  1722  			goto fail_dma;
9cedf3b2f09946 Sricharan R     2016-02-22  1723  		}
9cedf3b2f09946 Sricharan R     2016-02-22  1724  		sg_init_table(qup->brx.sg, blocks);
9cedf3b2f09946 Sricharan R     2016-02-22  1725  
9cedf3b2f09946 Sricharan R     2016-02-22  1726  		/* 2 tag bytes for each block + 5 for start, stop tags */
9cedf3b2f09946 Sricharan R     2016-02-22  1727  		size = blocks * 2 + 5;
9cedf3b2f09946 Sricharan R     2016-02-22  1728  
685983f4decc5f Sricharan R     2016-06-10  1729  		qup->start_tag.start = devm_kzalloc(&pdev->dev,
685983f4decc5f Sricharan R     2016-06-10  1730  						    size, GFP_KERNEL);
9cedf3b2f09946 Sricharan R     2016-02-22  1731  		if (!qup->start_tag.start) {
9cedf3b2f09946 Sricharan R     2016-02-22  1732  			ret = -ENOMEM;
9cedf3b2f09946 Sricharan R     2016-02-22  1733  			goto fail_dma;
9cedf3b2f09946 Sricharan R     2016-02-22  1734  		}
9cedf3b2f09946 Sricharan R     2016-02-22  1735  
685983f4decc5f Sricharan R     2016-06-10  1736  		qup->brx.tag.start = devm_kzalloc(&pdev->dev, 2, GFP_KERNEL);
9cedf3b2f09946 Sricharan R     2016-02-22  1737  		if (!qup->brx.tag.start) {
9cedf3b2f09946 Sricharan R     2016-02-22  1738  			ret = -ENOMEM;
9cedf3b2f09946 Sricharan R     2016-02-22  1739  			goto fail_dma;
191424bb6166f6 Sricharan R     2016-01-19  1740  		}
191424bb6166f6 Sricharan R     2016-01-19  1741  
685983f4decc5f Sricharan R     2016-06-10  1742  		qup->btx.tag.start = devm_kzalloc(&pdev->dev, 2, GFP_KERNEL);
9cedf3b2f09946 Sricharan R     2016-02-22  1743  		if (!qup->btx.tag.start) {
9cedf3b2f09946 Sricharan R     2016-02-22  1744  			ret = -ENOMEM;
9cedf3b2f09946 Sricharan R     2016-02-22  1745  			goto fail_dma;
9cedf3b2f09946 Sricharan R     2016-02-22  1746  		}
9cedf3b2f09946 Sricharan R     2016-02-22  1747  		qup->is_dma = true;
9cedf3b2f09946 Sricharan R     2016-02-22  1748  	}
9cedf3b2f09946 Sricharan R     2016-02-22  1749  
9cedf3b2f09946 Sricharan R     2016-02-22  1750  nodma:
109b8c42b7e28d Austin Christ   2018-05-10  1751  	/* We support frequencies up to FAST Mode Plus (1MHz) */
90224e6468e15d Andy Shevchenko 2020-03-24  1752  	if (!clk_freq || clk_freq > I2C_MAX_FAST_MODE_PLUS_FREQ) {
10c5a8425968f8 Bjorn Andersson 2014-03-13  1753  		dev_err(qup->dev, "clock frequency not supported %d\n",
10c5a8425968f8 Bjorn Andersson 2014-03-13  1754  			clk_freq);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1755  		return -EINVAL;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1756  	}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1757  
e0442d76213981 Dejin Zheng     2020-04-09  1758  	qup->base = devm_platform_ioremap_resource(pdev, 0);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1759  	if (IS_ERR(qup->base))
10c5a8425968f8 Bjorn Andersson 2014-03-13  1760  		return PTR_ERR(qup->base);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1761  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1762  	qup->irq = platform_get_irq(pdev, 0);
e42688ed5cf593 Dejin Zheng     2020-04-16  1763  	if (qup->irq < 0)
10c5a8425968f8 Bjorn Andersson 2014-03-13  1764  		return qup->irq;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1765  
515da746983bc6 Naveen Kaje     2016-10-11  1766  	if (has_acpi_companion(qup->dev)) {
515da746983bc6 Naveen Kaje     2016-10-11  1767  		ret = device_property_read_u32(qup->dev,
515da746983bc6 Naveen Kaje     2016-10-11  1768  				"src-clock-hz", &src_clk_freq);
515da746983bc6 Naveen Kaje     2016-10-11  1769  		if (ret) {
515da746983bc6 Naveen Kaje     2016-10-11  1770  			dev_notice(qup->dev, "using default src-clock-hz %d",
515da746983bc6 Naveen Kaje     2016-10-11  1771  				DEFAULT_SRC_CLK);
515da746983bc6 Naveen Kaje     2016-10-11  1772  		}
515da746983bc6 Naveen Kaje     2016-10-11  1773  		ACPI_COMPANION_SET(&qup->adap.dev, ACPI_COMPANION(qup->dev));
515da746983bc6 Naveen Kaje     2016-10-11  1774  	} else {
10c5a8425968f8 Bjorn Andersson 2014-03-13  1775  		qup->clk = devm_clk_get(qup->dev, "core");
10c5a8425968f8 Bjorn Andersson 2014-03-13  1776  		if (IS_ERR(qup->clk)) {
10c5a8425968f8 Bjorn Andersson 2014-03-13  1777  			dev_err(qup->dev, "Could not get core clock\n");
10c5a8425968f8 Bjorn Andersson 2014-03-13  1778  			return PTR_ERR(qup->clk);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1779  		}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1780  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1781  		qup->pclk = devm_clk_get(qup->dev, "iface");
10c5a8425968f8 Bjorn Andersson 2014-03-13  1782  		if (IS_ERR(qup->pclk)) {
10c5a8425968f8 Bjorn Andersson 2014-03-13  1783  			dev_err(qup->dev, "Could not get iface clock\n");
10c5a8425968f8 Bjorn Andersson 2014-03-13  1784  			return PTR_ERR(qup->pclk);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1785  		}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1786  		qup_i2c_enable_clocks(qup);
515da746983bc6 Naveen Kaje     2016-10-11  1787  		src_clk_freq = clk_get_rate(qup->clk);
515da746983bc6 Naveen Kaje     2016-10-11  1788  	}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1789  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1790  	/*
10c5a8425968f8 Bjorn Andersson 2014-03-13  1791  	 * Bootloaders might leave a pending interrupt on certain QUP's,
10c5a8425968f8 Bjorn Andersson 2014-03-13  1792  	 * so we reset the core before registering for interrupts.
10c5a8425968f8 Bjorn Andersson 2014-03-13  1793  	 */
10c5a8425968f8 Bjorn Andersson 2014-03-13  1794  	writel(1, qup->base + QUP_SW_RESET);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1795  	ret = qup_i2c_poll_state_valid(qup);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1796  	if (ret)
10c5a8425968f8 Bjorn Andersson 2014-03-13  1797  		goto fail;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1798  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1799  	ret = devm_request_irq(qup->dev, qup->irq, qup_i2c_interrupt,
5fe058b04d017a Tian Tao        2021-03-19  1800  			       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
5fe058b04d017a Tian Tao        2021-03-19  1801  			       "i2c_qup", qup);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1802  	if (ret) {
10c5a8425968f8 Bjorn Andersson 2014-03-13  1803  		dev_err(qup->dev, "Request %d IRQ failed\n", qup->irq);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1804  		goto fail;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1805  	}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1806  
10c5a8425968f8 Bjorn Andersson 2014-03-13 @1807  	hw_ver = readl(qup->base + QUP_HW_VERSION);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1808  	dev_dbg(qup->dev, "Revision %x\n", hw_ver);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1809  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1810  	io_mode = readl(qup->base + QUP_IO_MODE);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1811  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1812  	/*
10c5a8425968f8 Bjorn Andersson 2014-03-13  1813  	 * The block/fifo size w.r.t. 'actual data' is 1/2 due to 'tag'
10c5a8425968f8 Bjorn Andersson 2014-03-13  1814  	 * associated with each byte written/received
10c5a8425968f8 Bjorn Andersson 2014-03-13  1815  	 */
10c5a8425968f8 Bjorn Andersson 2014-03-13  1816  	size = QUP_OUTPUT_BLOCK_SIZE(io_mode);
3cf357dfb40b4a Pramod Gurav    2014-08-06  1817  	if (size >= ARRAY_SIZE(blk_sizes)) {
3cf357dfb40b4a Pramod Gurav    2014-08-06  1818  		ret = -EIO;
3cf357dfb40b4a Pramod Gurav    2014-08-06  1819  		goto fail;
3cf357dfb40b4a Pramod Gurav    2014-08-06  1820  	}
7545c7dba169c4 Abhishek Sahu   2018-03-12  1821  	qup->out_blk_sz = blk_sizes[size];
10c5a8425968f8 Bjorn Andersson 2014-03-13  1822  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1823  	size = QUP_INPUT_BLOCK_SIZE(io_mode);
3cf357dfb40b4a Pramod Gurav    2014-08-06  1824  	if (size >= ARRAY_SIZE(blk_sizes)) {
3cf357dfb40b4a Pramod Gurav    2014-08-06  1825  		ret = -EIO;
3cf357dfb40b4a Pramod Gurav    2014-08-06  1826  		goto fail;
3cf357dfb40b4a Pramod Gurav    2014-08-06  1827  	}
7545c7dba169c4 Abhishek Sahu   2018-03-12  1828  	qup->in_blk_sz = blk_sizes[size];
7545c7dba169c4 Abhishek Sahu   2018-03-12  1829  
7545c7dba169c4 Abhishek Sahu   2018-03-12  1830  	if (is_qup_v1) {
7545c7dba169c4 Abhishek Sahu   2018-03-12  1831  		/*
7545c7dba169c4 Abhishek Sahu   2018-03-12  1832  		 * in QUP v1, QUP_CONFIG uses N as 15 i.e 16 bits constitutes a
7545c7dba169c4 Abhishek Sahu   2018-03-12  1833  		 * single transfer but the block size is in bytes so divide the
7545c7dba169c4 Abhishek Sahu   2018-03-12  1834  		 * in_blk_sz and out_blk_sz by 2
7545c7dba169c4 Abhishek Sahu   2018-03-12  1835  		 */
7545c7dba169c4 Abhishek Sahu   2018-03-12  1836  		qup->in_blk_sz /= 2;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1837  		qup->out_blk_sz /= 2;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1838  		qup->write_tx_fifo = qup_i2c_write_tx_fifo_v1;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1839  		qup->read_rx_fifo = qup_i2c_read_rx_fifo_v1;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1840  		qup->write_rx_tags = qup_i2c_write_rx_tags_v1;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1841  	} else {
7545c7dba169c4 Abhishek Sahu   2018-03-12  1842  		qup->write_tx_fifo = qup_i2c_write_tx_fifo_v2;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1843  		qup->read_rx_fifo = qup_i2c_read_rx_fifo_v2;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1844  		qup->write_rx_tags = qup_i2c_write_rx_tags_v2;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1845  	}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1846  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1847  	size = QUP_OUTPUT_FIFO_SIZE(io_mode);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1848  	qup->out_fifo_sz = qup->out_blk_sz * (2 << size);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1849  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1850  	size = QUP_INPUT_FIFO_SIZE(io_mode);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1851  	qup->in_fifo_sz = qup->in_blk_sz * (2 << size);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1852  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1853  	hs_div = 3;
90224e6468e15d Andy Shevchenko 2020-03-24  1854  	if (clk_freq <= I2C_MAX_STANDARD_MODE_FREQ) {
71fbafcc45fed7 Austin Christ   2018-05-10  1855  		fs_div = ((src_clk_freq / clk_freq) / 2) - 3;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1856  		qup->clk_ctl = (hs_div << 8) | (fs_div & 0xff);
71fbafcc45fed7 Austin Christ   2018-05-10  1857  	} else {
71fbafcc45fed7 Austin Christ   2018-05-10  1858  		/* 33%/66% duty cycle */
71fbafcc45fed7 Austin Christ   2018-05-10  1859  		fs_div = ((src_clk_freq / clk_freq) - 6) * 2 / 3;
71fbafcc45fed7 Austin Christ   2018-05-10  1860  		qup->clk_ctl = ((fs_div / 2) << 16) | (hs_div << 8) | (fs_div & 0xff);
71fbafcc45fed7 Austin Christ   2018-05-10  1861  	}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1862  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1863  	/*
10c5a8425968f8 Bjorn Andersson 2014-03-13  1864  	 * Time it takes for a byte to be clocked out on the bus.
10c5a8425968f8 Bjorn Andersson 2014-03-13  1865  	 * Each byte takes 9 clock cycles (8 bits + 1 ack).
10c5a8425968f8 Bjorn Andersson 2014-03-13  1866  	 */
10c5a8425968f8 Bjorn Andersson 2014-03-13  1867  	one_bit_t = (USEC_PER_SEC / clk_freq) + 1;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1868  	qup->one_byte_t = one_bit_t * 9;
ecb6e1e5f43520 Abhishek Sahu   2018-03-12  1869  	qup->xfer_timeout = TOUT_MIN * HZ +
6f2f0f6465acbd Abhishek Sahu   2018-03-12  1870  		usecs_to_jiffies(MX_DMA_TX_RX_LEN * qup->one_byte_t);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1871  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1872  	dev_dbg(qup->dev, "IN:block:%d, fifo:%d, OUT:block:%d, fifo:%d\n",
10c5a8425968f8 Bjorn Andersson 2014-03-13  1873  		qup->in_blk_sz, qup->in_fifo_sz,
10c5a8425968f8 Bjorn Andersson 2014-03-13  1874  		qup->out_blk_sz, qup->out_fifo_sz);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1875  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1876  	i2c_set_adapdata(&qup->adap, qup);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1877  	qup->adap.dev.parent = qup->dev;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1878  	qup->adap.dev.of_node = pdev->dev.of_node;
9cedf3b2f09946 Sricharan R     2016-02-22  1879  	qup->is_last = true;
f74187932d30e4 Sricharan R     2016-01-19  1880  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1881  	strlcpy(qup->adap.name, "QUP I2C adapter", sizeof(qup->adap.name));
10c5a8425968f8 Bjorn Andersson 2014-03-13  1882  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1883  	pm_runtime_set_autosuspend_delay(qup->dev, MSEC_PER_SEC);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1884  	pm_runtime_use_autosuspend(qup->dev);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1885  	pm_runtime_set_active(qup->dev);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1886  	pm_runtime_enable(qup->dev);
86b59bbfae2a89 Andy Gross      2014-09-29  1887  
86b59bbfae2a89 Andy Gross      2014-09-29  1888  	ret = i2c_add_adapter(&qup->adap);
86b59bbfae2a89 Andy Gross      2014-09-29  1889  	if (ret)
86b59bbfae2a89 Andy Gross      2014-09-29  1890  		goto fail_runtime;
86b59bbfae2a89 Andy Gross      2014-09-29  1891  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1892  	return 0;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1893  
86b59bbfae2a89 Andy Gross      2014-09-29  1894  fail_runtime:
86b59bbfae2a89 Andy Gross      2014-09-29  1895  	pm_runtime_disable(qup->dev);
86b59bbfae2a89 Andy Gross      2014-09-29  1896  	pm_runtime_set_suspended(qup->dev);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1897  fail:
10c5a8425968f8 Bjorn Andersson 2014-03-13  1898  	qup_i2c_disable_clocks(qup);
9cedf3b2f09946 Sricharan R     2016-02-22  1899  fail_dma:
9cedf3b2f09946 Sricharan R     2016-02-22  1900  	if (qup->btx.dma)
9cedf3b2f09946 Sricharan R     2016-02-22  1901  		dma_release_channel(qup->btx.dma);
9cedf3b2f09946 Sricharan R     2016-02-22  1902  	if (qup->brx.dma)
9cedf3b2f09946 Sricharan R     2016-02-22  1903  		dma_release_channel(qup->brx.dma);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1904  	return ret;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1905  }
10c5a8425968f8 Bjorn Andersson 2014-03-13  1906  

:::::: The code at line 1807 was first introduced by commit
:::::: 10c5a8425968f8a43b7039ce6261367fc992289f i2c: qup: New bus driver for the Qualcomm QUP I2C controller

:::::: TO: Bjorn Andersson <bjorn.andersson@sonymobile.com>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
