Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A540823DB
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678866988; x=1710402988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jdx0nngOulYgdsOuqQPqXi815DsdBM2edjeOhbEi9+Y=;
  b=jJDZZe9i9dfMhU3VtBwFr4bezIiG7ZIuBTZ2loB+KHdS4uUSIPwkioW4
   umQcGn0S59YFrWCHZIKeB9FY64b6YXUcxeTx1zjsHUE8Uo99FJc4Z4mVz
   eUsm4Ugmf0bQkO48WmNjgj0No1Phf67DLlA08tDb6NX0+aqyy0F8iHi2k
   e+mHen80In71FIrVFHrOnxZA1rG9XEgG7mlQxoFDMDn7EP+kZQDbjMHyz
   Sx1Gu/t5MVd12Wk1Ntni4m/yANaVQ4BpTq+fn564fuU6kp+daMVQqts4k
   s8MotE/OSeVTMCq6oNf3Hq+JkdyXCmuYm39z/S9D+db5xmJUx8Lbfs6hj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="402511431"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="402511431"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 00:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="629367659"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="629367659"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2023 00:56:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcLzl-0007Wn-1p;
	Wed, 15 Mar 2023 07:56:25 +0000
Date: Wed, 15 Mar 2023 15:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thermal/mediatek/lvts_thermal.c:865:2: warning: Value stored
 to 'value' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303151556.to4zdKQj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/thermal/mediatek/lvts_thermal.c:865:2: warning: Value stored to 'value' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Balsam CHIHI <bchihi@baylibre.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6015b1aca1a233379625385feb01dd014aca60b5
commit: f5f633b18234cecb0e6ee6e5fbb358807dda15c3 thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20230312 (https://download.01.org/0day-ci/archive/20230315/202303151556.to4zdKQj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f5f633b18234cecb0e6ee6e5fbb358807dda15c3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f5f633b18234cecb0e6ee6e5fbb358807dda15c3
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303151556.to4zdKQj-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1624:3: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(aInfo, ", SoftConn");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1624:3: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
                   strcat(aInfo, ", SoftConn");
                   ^~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/power/supply/bq25980_charger.c:820:27: warning: The right operand of '!=' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return (old_state.dischg != new_state->dischg ||
                                    ^
   drivers/power/supply/bq25980_charger.c:837:8: note: Calling 'bq25980_get_state'
           ret = bq25980_get_state(bq, &state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq25980_charger.c:571:6: note: Assuming 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/power/supply/bq25980_charger.c:571:2: note: Taking true branch
           if (ret)
           ^
   drivers/power/supply/bq25980_charger.c:572:3: note: Returning without writing to 'state->dischg'
                   return ret;
                   ^
   drivers/power/supply/bq25980_charger.c:837:8: note: Returning from 'bq25980_get_state'
           ret = bq25980_get_state(bq, &state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq25980_charger.c:838:6: note: Assuming 'ret' is >= 0
           if (ret < 0)
               ^~~~~~~
   drivers/power/supply/bq25980_charger.c:838:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/power/supply/bq25980_charger.c:841:7: note: Calling 'bq25980_state_changed'
           if (!bq25980_state_changed(bq, &state))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq25980_charger.c:820:27: note: The right operand of '!=' is a garbage value
           return (old_state.dischg != new_state->dischg ||
                                    ^  ~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/power/supply/bq256xx_charger.c:1521:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = regmap_update_bits(bq->regmap, BQ256XX_CHARGER_CONTROL_1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq256xx_charger.c:1521:2: note: Value stored to 'ret' is never read
           ret = regmap_update_bits(bq->regmap, BQ256XX_CHARGER_CONTROL_1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/thermal/tegra/soctherm.c:2210:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = soctherm_interrupts_init(pdev, tegra);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/tegra/soctherm.c:2210:2: note: Value stored to 'err' is never read
           err = soctherm_interrupts_init(pdev, tegra);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/thermal/mediatek/lvts_thermal.c:865:2: warning: Value stored to 'value' is never read [clang-analyzer-deadcode.DeadStores]
           value = 0x300;
           ^       ~~~~~
   drivers/thermal/mediatek/lvts_thermal.c:865:2: note: Value stored to 'value' is never read
           value = 0x300;
           ^       ~~~~~
   drivers/thermal/mediatek/lvts_thermal.c:866:2: warning: Value stored to 'value' is never read [clang-analyzer-deadcode.DeadStores]
           value = LVTS_CALSCALE_CONF;
           ^
   drivers/thermal/mediatek/lvts_thermal.c:866:2: note: Value stored to 'value' is never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/usb/serial/usb-serial.c:1525:2: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
           rc = driver_attach(&udriver->drvwrap.driver);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/usb-serial.c:1525:2: note: Value stored to 'rc' is never read
           rc = driver_attach(&udriver->drvwrap.driver);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   arch/arm/include/asm/bitops.h:56:5: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p &= ~mask;
              ^
   drivers/vhost/vhost.c:1768:6: note: Assuming the condition is true
           if (ioctl == VHOST_SET_OWNER) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.c:1768:2: note: Taking true branch
           if (ioctl == VHOST_SET_OWNER) {
           ^
   drivers/vhost/vhost.c:1769:7: note: Calling 'vhost_dev_set_owner'
                   r = vhost_dev_set_owner(d);
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.c:581:6: note: Assuming the condition is false
           if (vhost_dev_has_owner(dev)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.c:581:2: note: Taking false branch
           if (vhost_dev_has_owner(dev)) {
           ^
   drivers/vhost/vhost.c:589:11: note: Field 'use_worker' is true
           if (dev->use_worker) {
                    ^
   drivers/vhost/vhost.c:589:2: note: Taking true branch
           if (dev->use_worker) {
           ^
   drivers/vhost/vhost.c:592:3: note: Taking false branch
                   if (IS_ERR(worker)) {
                   ^
   drivers/vhost/vhost.c:600:9: note: Calling 'vhost_attach_cgroups'
                   err = vhost_attach_cgroups(dev);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.c:531:2: note: Calling 'vhost_work_init'
           vhost_work_init(&attach.work, vhost_attach_cgroups_work);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.c:183:2: note: '?' condition is true
           clear_bit(VHOST_WORK_QUEUED, &work->flags);
           ^
   arch/arm/include/asm/bitops.h:192:27: note: expanded from macro 'clear_bit'
   #define clear_bit(nr,p)                 ATOMIC_BITOP(clear_bit,nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:183:3: note: expanded from macro 'ATOMIC_BITOP'

vim +/value +865 drivers/thermal/mediatek/lvts_thermal.c

f5f633b18234ce Balsam CHIHI 2023-02-09  844  
f5f633b18234ce Balsam CHIHI 2023-02-09  845  static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl *lvts_ctrl)
f5f633b18234ce Balsam CHIHI 2023-02-09  846  {
f5f633b18234ce Balsam CHIHI 2023-02-09  847  	u32 value;
f5f633b18234ce Balsam CHIHI 2023-02-09  848  
f5f633b18234ce Balsam CHIHI 2023-02-09  849  	/*
f5f633b18234ce Balsam CHIHI 2023-02-09  850  	 * LVTS_TSSEL : Sensing point index numbering
f5f633b18234ce Balsam CHIHI 2023-02-09  851  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  852  	 * Bits:
f5f633b18234ce Balsam CHIHI 2023-02-09  853  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  854  	 * 31-24: ADC Sense 3
f5f633b18234ce Balsam CHIHI 2023-02-09  855  	 * 23-16: ADC Sense 2
f5f633b18234ce Balsam CHIHI 2023-02-09  856  	 * 15-8	: ADC Sense 1
f5f633b18234ce Balsam CHIHI 2023-02-09  857  	 * 7-0	: ADC Sense 0
f5f633b18234ce Balsam CHIHI 2023-02-09  858  	 */
f5f633b18234ce Balsam CHIHI 2023-02-09  859  	value = LVTS_TSSEL_CONF;
f5f633b18234ce Balsam CHIHI 2023-02-09  860  	writel(value, LVTS_TSSEL(lvts_ctrl->base));
f5f633b18234ce Balsam CHIHI 2023-02-09  861  
f5f633b18234ce Balsam CHIHI 2023-02-09  862  	/*
f5f633b18234ce Balsam CHIHI 2023-02-09  863  	 * LVTS_CALSCALE : ADC voltage round
f5f633b18234ce Balsam CHIHI 2023-02-09  864  	 */
f5f633b18234ce Balsam CHIHI 2023-02-09 @865  	value = 0x300;
f5f633b18234ce Balsam CHIHI 2023-02-09  866  	value = LVTS_CALSCALE_CONF;
f5f633b18234ce Balsam CHIHI 2023-02-09  867  
f5f633b18234ce Balsam CHIHI 2023-02-09  868  	/*
f5f633b18234ce Balsam CHIHI 2023-02-09  869  	 * LVTS_MSRCTL0 : Sensor filtering strategy
f5f633b18234ce Balsam CHIHI 2023-02-09  870  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  871  	 * Filters:
f5f633b18234ce Balsam CHIHI 2023-02-09  872  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  873  	 * 000 : One sample
f5f633b18234ce Balsam CHIHI 2023-02-09  874  	 * 001 : Avg 2 samples
f5f633b18234ce Balsam CHIHI 2023-02-09  875  	 * 010 : 4 samples, drop min and max, avg 2 samples
f5f633b18234ce Balsam CHIHI 2023-02-09  876  	 * 011 : 6 samples, drop min and max, avg 4 samples
f5f633b18234ce Balsam CHIHI 2023-02-09  877  	 * 100 : 10 samples, drop min and max, avg 8 samples
f5f633b18234ce Balsam CHIHI 2023-02-09  878  	 * 101 : 18 samples, drop min and max, avg 16 samples
f5f633b18234ce Balsam CHIHI 2023-02-09  879  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  880  	 * Bits:
f5f633b18234ce Balsam CHIHI 2023-02-09  881  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  882  	 * 0-2  : Sensor0 filter
f5f633b18234ce Balsam CHIHI 2023-02-09  883  	 * 3-5  : Sensor1 filter
f5f633b18234ce Balsam CHIHI 2023-02-09  884  	 * 6-8  : Sensor2 filter
f5f633b18234ce Balsam CHIHI 2023-02-09  885  	 * 9-11 : Sensor3 filter
f5f633b18234ce Balsam CHIHI 2023-02-09  886  	 */
f5f633b18234ce Balsam CHIHI 2023-02-09  887  	value = LVTS_HW_FILTER << 9 |  LVTS_HW_FILTER << 6 |
f5f633b18234ce Balsam CHIHI 2023-02-09  888  			LVTS_HW_FILTER << 3 | LVTS_HW_FILTER;
f5f633b18234ce Balsam CHIHI 2023-02-09  889  	writel(value, LVTS_MSRCTL0(lvts_ctrl->base));
f5f633b18234ce Balsam CHIHI 2023-02-09  890  
f5f633b18234ce Balsam CHIHI 2023-02-09  891  	/*
f5f633b18234ce Balsam CHIHI 2023-02-09  892  	 * LVTS_MSRCTL1 : Measurement control
f5f633b18234ce Balsam CHIHI 2023-02-09  893  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  894  	 * Bits:
f5f633b18234ce Balsam CHIHI 2023-02-09  895  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  896  	 * 9: Ignore MSRCTL0 config and do immediate measurement on sensor3
f5f633b18234ce Balsam CHIHI 2023-02-09  897  	 * 6: Ignore MSRCTL0 config and do immediate measurement on sensor2
f5f633b18234ce Balsam CHIHI 2023-02-09  898  	 * 5: Ignore MSRCTL0 config and do immediate measurement on sensor1
f5f633b18234ce Balsam CHIHI 2023-02-09  899  	 * 4: Ignore MSRCTL0 config and do immediate measurement on sensor0
f5f633b18234ce Balsam CHIHI 2023-02-09  900  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  901  	 * That configuration will ignore the filtering and the delays
f5f633b18234ce Balsam CHIHI 2023-02-09  902  	 * introduced below in MONCTL1 and MONCTL2
f5f633b18234ce Balsam CHIHI 2023-02-09  903  	 */
f5f633b18234ce Balsam CHIHI 2023-02-09  904  	if (lvts_ctrl->mode == LVTS_MSR_IMMEDIATE_MODE) {
f5f633b18234ce Balsam CHIHI 2023-02-09  905  		value = BIT(9) | BIT(6) | BIT(5) | BIT(4);
f5f633b18234ce Balsam CHIHI 2023-02-09  906  		writel(value, LVTS_MSRCTL1(lvts_ctrl->base));
f5f633b18234ce Balsam CHIHI 2023-02-09  907  	}
f5f633b18234ce Balsam CHIHI 2023-02-09  908  
f5f633b18234ce Balsam CHIHI 2023-02-09  909  	/*
f5f633b18234ce Balsam CHIHI 2023-02-09  910  	 * LVTS_MONCTL1 : Period unit and group interval configuration
f5f633b18234ce Balsam CHIHI 2023-02-09  911  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  912  	 * The clock source of LVTS thermal controller is 26MHz.
f5f633b18234ce Balsam CHIHI 2023-02-09  913  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  914  	 * The period unit is a time base for all the interval delays
f5f633b18234ce Balsam CHIHI 2023-02-09  915  	 * specified in the registers. By default we use 12. The time
f5f633b18234ce Balsam CHIHI 2023-02-09  916  	 * conversion is done by multiplying by 256 and 1/26.10^6
f5f633b18234ce Balsam CHIHI 2023-02-09  917  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  918  	 * An interval delay multiplied by the period unit gives the
f5f633b18234ce Balsam CHIHI 2023-02-09  919  	 * duration in seconds.
f5f633b18234ce Balsam CHIHI 2023-02-09  920  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  921  	 * - Filter interval delay is a delay between two samples of
f5f633b18234ce Balsam CHIHI 2023-02-09  922  	 * the same sensor.
f5f633b18234ce Balsam CHIHI 2023-02-09  923  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  924  	 * - Sensor interval delay is a delay between two samples of
f5f633b18234ce Balsam CHIHI 2023-02-09  925  	 * different sensors.
f5f633b18234ce Balsam CHIHI 2023-02-09  926  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  927  	 * - Group interval delay is a delay between different rounds.
f5f633b18234ce Balsam CHIHI 2023-02-09  928  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  929  	 * For example:
f5f633b18234ce Balsam CHIHI 2023-02-09  930  	 *     If Period unit = C, filter delay = 1, sensor delay = 2, group delay = 1,
f5f633b18234ce Balsam CHIHI 2023-02-09  931  	 *     and two sensors, TS1 and TS2, are in a LVTS thermal controller
f5f633b18234ce Balsam CHIHI 2023-02-09  932  	 *     and then
f5f633b18234ce Balsam CHIHI 2023-02-09  933  	 *     Period unit time = C * 1/26M * 256 = 12 * 38.46ns * 256 = 118.149us
f5f633b18234ce Balsam CHIHI 2023-02-09  934  	 *     Filter interval delay = 1 * Period unit = 118.149us
f5f633b18234ce Balsam CHIHI 2023-02-09  935  	 *     Sensor interval delay = 2 * Period unit = 236.298us
f5f633b18234ce Balsam CHIHI 2023-02-09  936  	 *     Group interval delay = 1 * Period unit = 118.149us
f5f633b18234ce Balsam CHIHI 2023-02-09  937  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  938  	 *     TS1    TS1 ... TS1    TS2    TS2 ... TS2    TS1...
f5f633b18234ce Balsam CHIHI 2023-02-09  939  	 *        <--> Filter interval delay
f5f633b18234ce Balsam CHIHI 2023-02-09  940  	 *                       <--> Sensor interval delay
f5f633b18234ce Balsam CHIHI 2023-02-09  941  	 *                                             <--> Group interval delay
f5f633b18234ce Balsam CHIHI 2023-02-09  942  	 * Bits:
f5f633b18234ce Balsam CHIHI 2023-02-09  943  	 *      29 - 20 : Group interval
f5f633b18234ce Balsam CHIHI 2023-02-09  944  	 *      16 - 13 : Send a single interrupt when crossing the hot threshold (1)
f5f633b18234ce Balsam CHIHI 2023-02-09  945  	 *                or an interrupt everytime the hot threshold is crossed (0)
f5f633b18234ce Balsam CHIHI 2023-02-09  946  	 *       9 - 0  : Period unit
f5f633b18234ce Balsam CHIHI 2023-02-09  947  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  948  	 */
f5f633b18234ce Balsam CHIHI 2023-02-09  949  	value = LVTS_GROUP_INTERVAL << 20 | LVTS_PERIOD_UNIT;
f5f633b18234ce Balsam CHIHI 2023-02-09  950  	writel(value, LVTS_MONCTL1(lvts_ctrl->base));
f5f633b18234ce Balsam CHIHI 2023-02-09  951  
f5f633b18234ce Balsam CHIHI 2023-02-09  952  	/*
f5f633b18234ce Balsam CHIHI 2023-02-09  953  	 * LVTS_MONCTL2 : Filtering and sensor interval
f5f633b18234ce Balsam CHIHI 2023-02-09  954  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  955  	 * Bits:
f5f633b18234ce Balsam CHIHI 2023-02-09  956  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  957  	 *      25-16 : Interval unit in PERIOD_UNIT between sample on
f5f633b18234ce Balsam CHIHI 2023-02-09  958  	 *              the same sensor, filter interval
f5f633b18234ce Balsam CHIHI 2023-02-09  959  	 *       9-0  : Interval unit in PERIOD_UNIT between each sensor
f5f633b18234ce Balsam CHIHI 2023-02-09  960  	 *
f5f633b18234ce Balsam CHIHI 2023-02-09  961  	 */
f5f633b18234ce Balsam CHIHI 2023-02-09  962  	value = LVTS_FILTER_INTERVAL << 16 | LVTS_SENSOR_INTERVAL;
f5f633b18234ce Balsam CHIHI 2023-02-09  963  	writel(value, LVTS_MONCTL2(lvts_ctrl->base));
f5f633b18234ce Balsam CHIHI 2023-02-09  964  
f5f633b18234ce Balsam CHIHI 2023-02-09  965  	return lvts_irq_init(lvts_ctrl);
f5f633b18234ce Balsam CHIHI 2023-02-09  966  }
f5f633b18234ce Balsam CHIHI 2023-02-09  967  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
