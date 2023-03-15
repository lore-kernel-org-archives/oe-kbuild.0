Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45C96FC3
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 21:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678914970; x=1710450970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jSraPcbM4tIGBqZXjOEo32FH/OuQJc1rGhGcyvFZAmI=;
  b=MBlt+g94+yRHhIscaN7yHCczIP1k4oFZn9yF4vvNCoNp4mGh82lLxn/p
   0j52o3cFeSAtc9+47rHCEO8ZrIwffAp8DCpooiegBZqfJ/+HL0gJSkEoM
   dQE9F6kJ7albqHhuxtObYhnysihcR2vHOqEZiKqrPT+K6astUheuVlEd1
   nyY166/AK39AIPeLq5cWA3zqTEs1k/QWpuNH93Sp9k6FoOOd4HgpoDlEU
   WY9seu++966VkcFTJVY+ftJzC/E+ILgSm3r0agwZv19AhVpLKdrKCDqbb
   W1/bj8OUHdmuQVcGblJ+iY4vvU3JccFNxvuwGG83T4qGtzz3asCNP7Mcm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="424091448"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="424091448"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 14:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="743867530"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="743867530"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Mar 2023 14:16:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcYTf-00082i-2g;
	Wed, 15 Mar 2023 21:16:07 +0000
Date: Thu, 16 Mar 2023 05:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/rtc/rtc-isl12022.c:112:17: warning: Value stored to 'regmap'
 during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303160545.TZ3Tbuah-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/rtc/rtc-isl12022.c:112:17: warning: Value stored to 'regmap' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c1bec9c0b08abeac72ed6214b723adc224013bf
commit: f525b210e9d4dcefb88594d50e426068e62840f4 rtc: isl12022: Get rid of unneeded private struct isl12022
date:   3 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20230312 (https://download.01.org/0day-ci/archive/20230316/202303160545.TZ3Tbuah-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f525b210e9d4dcefb88594d50e426068e62840f4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f525b210e9d4dcefb88594d50e426068e62840f4
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303160545.TZ3Tbuah-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   drivers/media/tuners/max2165.c:330:6: note: Assuming field 'i2c_gate_ctrl' is null
           if (fe->ops.i2c_gate_ctrl)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/max2165.c:330:2: note: Taking false branch
           if (fe->ops.i2c_gate_ctrl)
           ^
   drivers/media/tuners/max2165.c:349:2: note: Calling 'max2165_read_rom_table'
           max2165_read_rom_table(priv);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/max2165.c:99:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < 3; i++) {
           ^
   drivers/media/tuners/max2165.c:101:3: note: Calling 'max2165_read_reg'
                   max2165_read_reg(priv, REG_ROM_TABLE_DATA, &dat[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/max2165.c:65:6: note: Assuming 'ret' is equal to 2
           if (ret != 2) {
               ^~~~~~~~
   drivers/media/tuners/max2165.c:65:2: note: Taking false branch
           if (ret != 2) {
           ^
   drivers/media/tuners/max2165.c:71:6: note: Assuming 'debug' is < 2
           if (debug >= 2)
               ^~~~~~~~~~
   drivers/media/tuners/max2165.c:71:2: note: Taking false branch
           if (debug >= 2)
           ^
   drivers/media/tuners/max2165.c:101:3: note: Returning from 'max2165_read_reg'
                   max2165_read_reg(priv, REG_ROM_TABLE_DATA, &dat[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/max2165.c:99:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < 3; i++) {
           ^
   drivers/media/tuners/max2165.c:99:2: note: Loop condition is true.  Entering loop body
   drivers/media/tuners/max2165.c:101:3: note: Calling 'max2165_read_reg'
                   max2165_read_reg(priv, REG_ROM_TABLE_DATA, &dat[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/max2165.c:65:6: note: Assuming 'ret' is not equal to 2
           if (ret != 2) {
               ^~~~~~~~
   drivers/media/tuners/max2165.c:65:2: note: Taking true branch
           if (ret != 2) {
           ^
   drivers/media/tuners/max2165.c:66:3: note: Assuming 'debug' is 0
                   dprintk("%s: error reg=0x%x, ret=%i\n", __func__, reg, ret);
                   ^
   drivers/media/tuners/max2165.c:24:7: note: expanded from macro 'dprintk'
                   if (debug) \
                       ^~~~~
   drivers/media/tuners/max2165.c:66:3: note: Taking false branch
                   dprintk("%s: error reg=0x%x, ret=%i\n", __func__, reg, ret);
                   ^
   drivers/media/tuners/max2165.c:24:3: note: expanded from macro 'dprintk'
                   if (debug) \
                   ^
   drivers/media/tuners/max2165.c:66:3: note: Loop condition is false.  Exiting loop
                   dprintk("%s: error reg=0x%x, ret=%i\n", __func__, reg, ret);
                   ^
   drivers/media/tuners/max2165.c:23:2: note: expanded from macro 'dprintk'
           do { \
           ^
   drivers/media/tuners/max2165.c:67:3: note: Returning without writing to '*p_data'
                   return -EIO;
                   ^
   drivers/media/tuners/max2165.c:101:3: note: Returning from 'max2165_read_reg'
                   max2165_read_reg(priv, REG_ROM_TABLE_DATA, &dat[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/max2165.c:99:2: note: Loop condition is false. Execution continues on line 104
           for (i = 0; i < 3; i++) {
           ^
   drivers/media/tuners/max2165.c:108:36: note: The left operand of '&' is a garbage value
           priv->bb_filter_7mhz_cfg = dat[2] & 0x0F;
                                      ~~~~~~ ^
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/rtc/rtc-ds3232.c:380:17: warning: Value stored to 'ds3232' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ds3232 *ds3232 = dev_get_drvdata(dev);
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-ds3232.c:380:17: note: Value stored to 'ds3232' during its initialization is never read
           struct ds3232 *ds3232 = dev_get_drvdata(dev);
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
>> drivers/rtc/rtc-isl12022.c:112:17: warning: Value stored to 'regmap' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct regmap *regmap = dev_get_drvdata(dev);
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-isl12022.c:112:17: note: Value stored to 'regmap' during its initialization is never read
           struct regmap *regmap = dev_get_drvdata(dev);
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/power/supply/twl4030_charger.c:364:2: warning: Value stored to 'cur_reg' is never read [clang-analyzer-deadcode.DeadStores]
           cur_reg |= oldreg << 8;
           ^          ~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:364:2: note: Value stored to 'cur_reg' is never read
           cur_reg |= oldreg << 8;
           ^          ~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:383:3: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
                   status = twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:383:3: note: Value stored to 'status' is never read
                   status = twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:412:2: warning: Value stored to 'curr' is never read [clang-analyzer-deadcode.DeadStores]
           curr = twl4030_charger_get_current();
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:412:2: note: Value stored to 'curr' is never read
           curr = twl4030_charger_get_current();
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:467:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = twl4030_clear_set_boot_bci(0, TWL4030_BCIAUTOUSB);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:467:4: note: Value stored to 'ret' is never read
                           ret = twl4030_clear_set_boot_bci(0, TWL4030_BCIAUTOUSB);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:487:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE, 0x33,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:487:4: note: Value stored to 'ret' is never read
                           ret = twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE, 0x33,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:490:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE, 0x2a,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:490:4: note: Value stored to 'ret' is never read
                           ret = twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE, 0x2a,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:493:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE, 0x26,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:493:4: note: Value stored to 'ret' is never read
                           ret = twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE, 0x26,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:496:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE, 0xf3,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:496:4: note: Value stored to 'ret' is never read
                           ret = twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE, 0xf3,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:499:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE, 0x9c,

vim +/regmap +112 drivers/rtc/rtc-isl12022.c

8d816c1eaa7525 Rasmus Villemoes 2022-11-04  109  
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  110  static void isl12022_hwmon_register(struct device *dev)
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  111  {
f525b210e9d4dc Andy Shevchenko  2023-01-10 @112  	struct regmap *regmap = dev_get_drvdata(dev);
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  113  	struct device *hwmon;
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  114  	int ret;
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  115  
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  116  	if (!IS_REACHABLE(CONFIG_HWMON))
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  117  		return;
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  118  
f525b210e9d4dc Andy Shevchenko  2023-01-10  119  	ret = regmap_update_bits(regmap, ISL12022_REG_BETA,
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  120  				 ISL12022_BETA_TSE, ISL12022_BETA_TSE);
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  121  	if (ret) {
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  122  		dev_warn(dev, "unable to enable temperature sensor\n");
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  123  		return;
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  124  	}
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  125  
f525b210e9d4dc Andy Shevchenko  2023-01-10  126  	hwmon = devm_hwmon_device_register_with_info(dev, "isl12022", regmap,
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  127  						     &isl12022_hwmon_chip_info,
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  128  						     NULL);
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  129  	if (IS_ERR(hwmon))
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  130  		dev_warn(dev, "unable to register hwmon device: %pe\n", hwmon);
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  131  }
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
