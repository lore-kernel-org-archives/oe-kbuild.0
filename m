Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11533C02
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678882432; x=1710418432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTFnd2E/Ubhbunc8dLfeHuGePWeUDAsXEOuOcjsBPtA=;
  b=d0sJtdsZfXPGU7gpLCeTuaacYU0BJXQbvi1UX7AJwiDYXDs3aE2rtIap
   jt10k8w1KYS6x9hsBnVJmmEaff3NuSfvgS3DQsFLY8682LdUFiUz4oXKv
   yiZqyJbbA+JA0TVj8G11OVfLZKy0sce2qPL7XouES7H28XHB8Wh2AkOHX
   eqix3MH3Xcp8AupHBRXZQod0ybYIwo4tPllDG+TJFMLWJml/0ap99N2iA
   KQKPUBsTQWizDEoRV0oqdtk4W0EOL89zbcyonypYwdd6aezGfCUMiZQ7Q
   HXjIcJvV1h2IST+59eubp2oY0/gjkYD7pzmDX154qD7G+7XAIIQUljRDH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="340047024"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="340047024"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 05:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="748402866"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="748402866"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Mar 2023 05:13:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcQ0m-0007eb-3C;
	Wed, 15 Mar 2023 12:13:44 +0000
Date: Wed, 15 Mar 2023 20:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/platform/microchip/microchip-isc-base.c:1297:21:
 warning: Value stored to 'isc' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303152050.538jvSbR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/platform/microchip/microchip-isc-base.c:1297:21: warning: Value stored to 'isc' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eugen Hristev <eugen.hristev@microchip.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6015b1aca1a233379625385feb01dd014aca60b5
commit: 8d46c5cdadeb64206d2dd7d00f00dd26020ceb3c media: microchip: microchip-isc: replace v4l2_{dbg|info|err} with dev-*
date:   5 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20230312 (https://download.01.org/0day-ci/archive/20230315/202303152050.538jvSbR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8d46c5cdadeb64206d2dd7d00f00dd26020ceb3c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8d46c5cdadeb64206d2dd7d00f00dd26020ceb3c
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303152050.538jvSbR-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                           ~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                         ^~~~
   include/linux/page-flags.h:509:1: note: Calling 'generic_test_bit'
   PAGEFLAG(Private, private, PF_ANY)
   ^
   include/linux/page-flags.h:426:2: note: expanded from macro 'PAGEFLAG'
           TESTPAGEFLAG(uname, lname, policy)                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:381:10: note: expanded from macro 'TESTPAGEFLAG'
   { return test_bit(PG_##lname, &policy(page, 0)->flags); }
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:35: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ~~~~~~^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:14:20: note: expanded from macro '_test_bit'
   #define _test_bit               arch_test_bit
                                   ^
   include/asm-generic/bitops/non-atomic.h:15:23: note: expanded from macro 'arch_test_bit'
   #define arch_test_bit generic_test_bit
                         ^
   include/linux/bitops.h:53:25: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                  ^~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:128:16: note: Array access (from variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 24 warnings (11 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/of/overlay.c:255:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(new_prop->value, target_path);
           ^~~~~~
   drivers/of/overlay.c:255:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(new_prop->value, target_path);
           ^~~~~~
   drivers/of/overlay.c:256:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(new_prop->value + target_path_len, path_tail);
           ^~~~~~
   drivers/of/overlay.c:256:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(new_prop->value + target_path_len, path_tail);
           ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c:414:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &ctx->mdp_dev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c:414:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &ctx->mdp_dev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c:631:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &mdp->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c:631:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &mdp->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   24 warnings generated.
>> drivers/media/platform/microchip/microchip-isc-base.c:1297:21: warning: Value stored to 'isc' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct isc_device *isc = container_of(ctrls, struct isc_device, ctrls);
                              ^~~
   drivers/media/platform/microchip/microchip-isc-base.c:1297:21: note: Value stored to 'isc' during its initialization is never read
           struct isc_device *isc = container_of(ctrls, struct isc_device, ctrls);
                              ^~~
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/media/platform/microchip/microchip-isc-clk.c:125:18: warning: Value stored to 'isc_clk' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct isc_clk *isc_clk = to_isc_clk(hw);
                           ^~~~~~~
   drivers/media/platform/microchip/microchip-isc-clk.c:125:18: note: Value stored to 'isc_clk' during its initialization is never read
           struct isc_clk *isc_clk = to_isc_clk(hw);
                           ^~~~~~~
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/gpu/ipu-v3/ipu-cpmem.c:891:31: warning: Value stored to 'p' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ipu_ch_param __iomem *p = ipu_get_cpmem(ch);
                                        ^   ~~~~~~~~~~~~~~~~~
   drivers/gpu/ipu-v3/ipu-cpmem.c:891:31: note: Value stored to 'p' during its initialization is never read
           struct ipu_ch_param __iomem *p = ipu_get_cpmem(ch);
                                        ^   ~~~~~~~~~~~~~~~~~
   drivers/gpu/ipu-v3/ipu-cpmem.c:892:18: warning: Value stored to 'ipu' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ipu_soc *ipu = ch->ipu;
                           ^~~   ~~~~~~~
   drivers/gpu/ipu-v3/ipu-cpmem.c:892:18: note: Value stored to 'ipu' during its initialization is never read
           struct ipu_soc *ipu = ch->ipu;
                           ^~~   ~~~~~~~
   drivers/gpu/ipu-v3/ipu-cpmem.c:893:6: warning: Value stored to 'chno' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int chno = ch->num;
               ^~~~   ~~~~~~~
   drivers/gpu/ipu-v3/ipu-cpmem.c:893:6: note: Value stored to 'chno' during its initialization is never read
           int chno = ch->num;
               ^~~~   ~~~~~~~
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/iio/accel/bma400_core.c:478:31: warning: The result of the right shift is undefined because the right operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
           *val = BMA400_ACC_ODR_MAX_HZ >> (BMA400_ACC_ODR_MAX_RAW - raw);
                                        ^
   drivers/iio/accel/bma400_core.c:1074:2: note: Control jumps to 'case IIO_CHAN_INFO_SAMP_FREQ:'  at line 1075
           switch (mask) {
           ^
   drivers/iio/accel/bma400_core.c:1080:7: note: Assuming field 'type' is equal to IIO_ACCEL
                   if (chan->type != IIO_ACCEL)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:1080:3: note: Taking false branch
                   if (chan->type != IIO_ACCEL)
                   ^
   drivers/iio/accel/bma400_core.c:1084:9: note: Calling 'bma400_set_accel_output_data_rate'
                   ret = bma400_set_accel_output_data_rate(data, val, val2);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:542:6: note: Assuming 'hz' is >= BMA400_ACC_ODR_MIN_WHOLE_HZ
           if (hz >= BMA400_ACC_ODR_MIN_WHOLE_HZ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:542:2: note: Taking true branch
           if (hz >= BMA400_ACC_ODR_MIN_WHOLE_HZ) {
           ^
   drivers/iio/accel/bma400_core.c:543:7: note: Assuming 'uhz' is 0
                   if (uhz || hz > BMA400_ACC_ODR_MAX_HZ)
                       ^~~
   drivers/iio/accel/bma400_core.c:543:7: note: Left side of '||' is false
   drivers/iio/accel/bma400_core.c:543:14: note: Assuming 'hz' is <= BMA400_ACC_ODR_MAX_HZ
                   if (uhz || hz > BMA400_ACC_ODR_MAX_HZ)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:543:3: note: Taking false branch
                   if (uhz || hz > BMA400_ACC_ODR_MAX_HZ)
                   ^
   drivers/iio/accel/bma400_core.c:549:7: note: Assuming the condition is false

vim +/isc +1297 drivers/media/platform/microchip/microchip-isc-base.c

91b4e487b0c6b8 Eugen Hristev 2022-11-07  1294  
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1295  static void isc_wb_update(struct isc_ctrls *ctrls)
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1296  {
91b4e487b0c6b8 Eugen Hristev 2022-11-07 @1297  	struct isc_device *isc = container_of(ctrls, struct isc_device, ctrls);
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1298  	u32 *hist_count = &ctrls->hist_count[0];
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1299  	u32 c, offset[4];
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1300  	u64 avg = 0;
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1301  	/* We compute two gains, stretch gain and grey world gain */
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1302  	u32 s_gain[4], gw_gain[4];
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1303  
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1304  	/*
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1305  	 * According to Grey World, we need to set gains for R/B to normalize
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1306  	 * them towards the green channel.
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1307  	 * Thus we want to keep Green as fixed and adjust only Red/Blue
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1308  	 * Compute the average of the both green channels first
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1309  	 */
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1310  	avg = (u64)hist_count[ISC_HIS_CFG_MODE_GR] +
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1311  		(u64)hist_count[ISC_HIS_CFG_MODE_GB];
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1312  	avg >>= 1;
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1313  
8d46c5cdadeb64 Eugen Hristev 2022-11-28  1314  	dev_dbg(isc->dev, "isc wb: green components average %llu\n", avg);
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1315  
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1316  	/* Green histogram is null, nothing to do */
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1317  	if (!avg)
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1318  		return;
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1319  
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1320  	for (c = ISC_HIS_CFG_MODE_GR; c <= ISC_HIS_CFG_MODE_B; c++) {
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1321  		/*
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1322  		 * the color offset is the minimum value of the histogram.
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1323  		 * we stretch this color to the full range by substracting
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1324  		 * this value from the color component.
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1325  		 */
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1326  		offset[c] = ctrls->hist_minmax[c][HIST_MIN_INDEX];
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1327  		/*
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1328  		 * The offset is always at least 1. If the offset is 1, we do
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1329  		 * not need to adjust it, so our result must be zero.
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1330  		 * the offset is computed in a histogram on 9 bits (0..512)
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1331  		 * but the offset in register is based on
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1332  		 * 12 bits pipeline (0..4096).
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1333  		 * we need to shift with the 3 bits that the histogram is
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1334  		 * ignoring
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1335  		 */
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1336  		ctrls->offset[c] = (offset[c] - 1) << 3;
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1337  
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1338  		/*
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1339  		 * the offset is then taken and converted to 2's complements,
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1340  		 * and must be negative, as we subtract this value from the
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1341  		 * color components
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1342  		 */
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1343  		ctrls->offset[c] = -ctrls->offset[c];
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1344  
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1345  		/*
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1346  		 * the stretch gain is the total number of histogram bins
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1347  		 * divided by the actual range of color component (Max - Min)
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1348  		 * If we compute gain like this, the actual color component
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1349  		 * will be stretched to the full histogram.
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1350  		 * We need to shift 9 bits for precision, we have 9 bits for
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1351  		 * decimals
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1352  		 */
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1353  		s_gain[c] = (HIST_ENTRIES << 9) /
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1354  			(ctrls->hist_minmax[c][HIST_MAX_INDEX] -
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1355  			ctrls->hist_minmax[c][HIST_MIN_INDEX] + 1);
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1356  
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1357  		/*
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1358  		 * Now we have to compute the gain w.r.t. the average.
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1359  		 * Add/lose gain to the component towards the average.
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1360  		 * If it happens that the component is zero, use the
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1361  		 * fixed point value : 1.0 gain.
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1362  		 */
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1363  		if (hist_count[c])
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1364  			gw_gain[c] = div_u64(avg << 9, hist_count[c]);
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1365  		else
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1366  			gw_gain[c] = 1 << 9;
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1367  
8d46c5cdadeb64 Eugen Hristev 2022-11-28  1368  		dev_dbg(isc->dev,
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1369  			"isc wb: component %d, s_gain %u, gw_gain %u\n",
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1370  			c, s_gain[c], gw_gain[c]);
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1371  		/* multiply both gains and adjust for decimals */
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1372  		ctrls->gain[c] = s_gain[c] * gw_gain[c];
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1373  		ctrls->gain[c] >>= 9;
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1374  
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1375  		/* make sure we are not out of range */
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1376  		ctrls->gain[c] = clamp_val(ctrls->gain[c], 0, GENMASK(12, 0));
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1377  
8d46c5cdadeb64 Eugen Hristev 2022-11-28  1378  		dev_dbg(isc->dev, "isc wb: component %d, final gain %u\n",
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1379  			c, ctrls->gain[c]);
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1380  	}
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1381  }
91b4e487b0c6b8 Eugen Hristev 2022-11-07  1382  

:::::: The code at line 1297 was first introduced by commit
:::::: 91b4e487b0c6b83064ad57b7a3a8d38c3245f020 media: microchip: add ISC driver as Microchip ISC

:::::: TO: Eugen Hristev <eugen.hristev@microchip.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
