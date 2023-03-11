Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6691861
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Mar 2023 09:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678528731; x=1710064731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mgZs/gS6iXKPhSk2rGixhRDwwdQ9z82DGyJQyL4zpik=;
  b=Xmo39l8f5TsdBMoM6384ff/kZm6fduGKwQHLwWtsLPzlY80+tRrfhDGe
   6DvPjOaKlphfnxCEn7dqtQNcYULb0KjeUb4YLvO9ZEKHfjM/7WotOJ9gn
   eRARg6XR7NvnDIEaQU/AMVmc/HftI1nCs+jlmctfhsB/KqMEtbsOO3l1H
   6x7RyCq+sxqVEan5BN06PwJQQQbotkdqPy72ocNlsadF7oQup1rGT4+0D
   o3HGs84E6IpvhwXwB0d9Vf4cyPbiirUoKT5x1z07/5UPJW+TBOOtfJHeJ
   wjM5mD2O9/7uKktBCLPtmaD0otGKbMiRm3+t16m5TOnukWZbzqKn3Gl60
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423158954"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="423158954"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 01:58:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="821378871"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="821378871"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2023 01:58:48 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pavzz-0004VC-1p;
	Sat, 11 Mar 2023 09:58:47 +0000
Date: Sat, 11 Mar 2023 17:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/input/keyboard/cap11xx.c:90:8: warning: Excessive padding in
 'struct cap11xx_hw_model' (6 padding bytes, where 2 is optimal). Optimal
 fields order: num_channels, num_leds, product_id, no_gain, consider
 reordering the fields or adding explicit padd...
Message-ID: <202303111739.BESBkvRm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/input/keyboard/cap11xx.c:90:8: warning: Excessive padding in 'struct cap11xx_hw_model' (6 padding bytes, where 2 is optimal). Optimal fields order: num_channels, num_leds, product_id, no_gain, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Jiri Valek - 2N" <jiriv@axis.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Mattijs Korpershoek <mkorpershoek@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef5f68cc1f829b492b19cd4df5af4454aa816b93
commit: b4bb3310727e978fddcc444355a545966a9d10ea Input: cap11xx - add support for cap1203, cap1293 and cap1298
date:   5 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20230310 (https://download.01.org/0day-ci/archive/20230311/202303111739.BESBkvRm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b4bb3310727e978fddcc444355a545966a9d10ea
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b4bb3310727e978fddcc444355a545966a9d10ea
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303111739.BESBkvRm-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   include/linux/rcupdate.h:409:48: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   security/keys/process_keys.c:626:13: note: Loop condition is false.  Exiting loop
           ctx.cred = get_current_cred();
                      ^
   include/linux/cred.h:331:12: note: expanded from macro 'get_current_cred'
           (get_cred(current_cred()))
                     ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:664:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:460:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:409:32: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   security/keys/process_keys.c:629:2: note: Control jumps to 'case -5:'  at line 703
           switch (id) {
           ^
   security/keys/process_keys.c:704:9: note: Calling 'look_up_user_keyrings'
                   ret = look_up_user_keyrings(NULL, &key);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/process_keys.c:77:28: note: Left side of '&&' is false
           const struct cred *cred = current_cred();
                                     ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:664:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:460:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:409:48: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   security/keys/process_keys.c:77:28: note: Loop condition is false.  Exiting loop
           const struct cred *cred = current_cred();
                                     ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:664:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:460:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:409:32: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   security/keys/process_keys.c:88:2: note: Taking false branch
           kenter("%u", uid);
           ^
   security/keys/internal.h:34:2: note: expanded from macro 'kenter'
           no_printk(KERN_DEBUG "==> %s("FMT")\n", __func__, ##__VA_ARGS__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   security/keys/process_keys.c:91:2: note: Taking true branch
           if (IS_ERR(reg_keyring))
           ^
   security/keys/process_keys.c:92:3: note: Returning without writing to '*_user_session_keyring'
                   return PTR_ERR(reg_keyring);
                   ^
   security/keys/process_keys.c:704:9: note: Returning from 'look_up_user_keyrings'
                   ret = look_up_user_keyrings(NULL, &key);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/process_keys.c:705:7: note: 'ret' is >= 0
                   if (ret < 0)
                       ^~~
   security/keys/process_keys.c:705:3: note: Taking false branch
                   if (ret < 0)
                   ^
   security/keys/process_keys.c:707:13: note: 1st function call argument is an uninitialized value
                   key_ref = make_key_ref(key, 1);
                             ^            ~~~
   2 warnings generated.
   security/keys/request_key.c:119:21: warning: Value stored to 'cred' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct cred *cred = current_cred();
                              ^~~~
   security/keys/request_key.c:119:21: note: Value stored to 'cred' during its initialization is never read
           const struct cred *cred = current_cred();
                              ^~~~
   security/keys/request_key.c:510:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = 0;
                   ^     ~
   security/keys/request_key.c:510:3: note: Value stored to 'ret' is never read
                   ret = 0;
                   ^     ~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
>> drivers/input/keyboard/cap11xx.c:90:8: warning: Excessive padding in 'struct cap11xx_hw_model' (6 padding bytes, where 2 is optimal). Optimal fields order: num_channels, num_leds, product_id, no_gain, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct cap11xx_hw_model {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/cap11xx.c:90:8: note: Excessive padding in 'struct cap11xx_hw_model' (6 padding bytes, where 2 is optimal). Optimal fields order: num_channels, num_leds, product_id, no_gain, consider reordering the fields or adding explicit padding members
   struct cap11xx_hw_model {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/input/keyboard/tca8418_keypad.c:241:15: warning: The result of the left shift is undefined because the left operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
           reg += (~(~0 << cols)) << 8;
                        ^
   drivers/input/keyboard/tca8418_keypad.c:272:2: note: Taking false branch
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE)) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:279:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:279:2: note: Taking false branch
           if (error)
           ^
   drivers/input/keyboard/tca8418_keypad.c:282:6: note: Assuming 'rows' is not equal to 0
           if (!rows || rows > TCA8418_MAX_ROWS) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:282:6: note: Left side of '||' is false
   drivers/input/keyboard/tca8418_keypad.c:282:15: note: Assuming 'rows' is <= TCA8418_MAX_ROWS
           if (!rows || rows > TCA8418_MAX_ROWS) {
                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:282:2: note: Taking false branch
           if (!rows || rows > TCA8418_MAX_ROWS) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:287:6: note: Assuming 'cols' is not equal to 0
           if (!cols || cols > TCA8418_MAX_COLS) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:287:6: note: Left side of '||' is false
   drivers/input/keyboard/tca8418_keypad.c:287:15: note: Assuming 'cols' is <= TCA8418_MAX_COLS
           if (!cols || cols > TCA8418_MAX_COLS) {
                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:287:2: note: Taking false branch
           if (!cols || cols > TCA8418_MAX_COLS) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:296:6: note: Assuming 'keypad_data' is non-null
           if (!keypad_data)
               ^~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:296:2: note: Taking false branch
           if (!keypad_data)
           ^
   drivers/input/keyboard/tca8418_keypad.c:304:6: note: 'error' is 0
           if (error)
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:304:2: note: Taking false branch
           if (error)
           ^
   drivers/input/keyboard/tca8418_keypad.c:309:6: note: Assuming 'input' is non-null
           if (!input)
               ^~~~~~
   drivers/input/keyboard/tca8418_keypad.c:309:2: note: Taking false branch
           if (!input)
           ^
   drivers/input/keyboard/tca8418_keypad.c:321:6: note: Assuming 'error' is 0
           if (error) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:321:2: note: Taking false branch
           if (error) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:326:6: note: Assuming the condition is false
           if (device_property_read_bool(dev, "keypad,autorepeat"))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:326:2: note: Taking false branch
           if (device_property_read_bool(dev, "keypad,autorepeat"))
           ^
   drivers/input/keyboard/tca8418_keypad.c:335:6: note: Assuming 'error' is 0
           if (error) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:335:2: note: Taking false branch
           if (error) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:342:10: note: Calling 'tca8418_configure'
           error = tca8418_configure(keypad_data, rows, cols);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:241:15: note: The result of the left shift is undefined because the left operand is negative
           reg += (~(~0 << cols)) << 8;
                     ~~ ^
   1 warning generated.
   drivers/pinctrl/stm32/pinctrl-stm32.c:1427:21: warning: Passed-by-value struct argument contains uninitialized data (e.g., field: 'id_size') [clang-analyzer-core.CallAndMessage]
                   pctl->irqmux[i] = devm_regmap_field_alloc(dev, rm, mux);
                                     ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1499:6: note: Assuming 'match_data' is non-null
           if (!match_data)
               ^~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1499:2: note: Taking false branch
           if (!match_data)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1503:6: note: Assuming 'pctl' is non-null
           if (!pctl)
               ^~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1503:2: note: Taking false branch
           if (!pctl)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1510:2: note: Taking false branch
           if (IS_ERR(pctl->domain))
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1512:13: note: Field 'domain' is null

vim +90 drivers/input/keyboard/cap11xx.c

7609a5e973c43a Matt Ranostay 2014-10-31  89  
7609a5e973c43a Matt Ranostay 2014-10-31 @90  struct cap11xx_hw_model {
7609a5e973c43a Matt Ranostay 2014-10-31  91  	u8 product_id;
7609a5e973c43a Matt Ranostay 2014-10-31  92  	unsigned int num_channels;
efe3b616f88caa Matt Ranostay 2015-08-16  93  	unsigned int num_leds;
322a552e195508 Jesse Taube   2021-11-02  94  	bool no_gain;
7609a5e973c43a Matt Ranostay 2014-10-31  95  };
7609a5e973c43a Matt Ranostay 2014-10-31  96  

:::::: The code at line 90 was first introduced by commit
:::::: 7609a5e973c43a647c4e40184fc8404311fdb97c Input: cap11xx - add support for various cap11xx devices

:::::: TO: Matt Ranostay <mranostay@gmail.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
