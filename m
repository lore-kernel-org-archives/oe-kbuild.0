Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C69629
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 11:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676807920; x=1708343920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9HgAayMEf0O3U2fp6KZu39WvxH1m12qSFFtDbf4jfxQ=;
  b=Io6MjCHBWlllJdn32ZiCJ5KM3gyXaW33XFIUjKLY/v5FEUpFZiD6P9Ap
   xPrI0hIAp1Z3vDCZJfhZHP0jJVhSX/h6d49BZVaIYB5jwMkGR1qpTnRkf
   WlGVwmrnU/5zOylDVA9VKI7enNgGwUVa3zvXXORAbTKdMMXkmWWhAHxHy
   G7/TWSATeDHosULaTo0qLqJX9vq8pI+4B1yp0qkOkW/OVj3jYtgyA9vFY
   T3Ky47nOkM3KJm6Bdj9wr6PbDktpwU8nObSE3B7yiQqTgThZ2TlmKqOom
   y/kP23/csNrZsV3jI9NmnSZ2sYgH+206vHItgsTFObtLwvl1ry7LaXQtM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="394727034"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="394727034"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 03:58:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="813848573"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="813848573"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2023 03:58:36 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTiKx-000DHe-1y;
	Sun, 19 Feb 2023 11:58:35 +0000
Date: Sun, 19 Feb 2023 19:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9495/13499]
 drivers/power/supply/rt9467-charger.c:379:4: warning: Value stored to
 'value' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302191948.V9lrLeQJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/power/supply/rt9467-charger.c:379:4: warning: Value stored to 'value' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: ChiaEn Wu <chiaen_wu@richtek.com>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: ChiYuan Huang <cy_huang@richtek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c068f40300a0eaa34f7105d137a5560b86951aa9
commit: 6f7f70e3a8dd1fbce95eaea2a8eff70f01363c00 [9495/13499] power: supply: rt9467: Add Richtek RT9467 charger driver
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20230218 (https://download.01.org/0day-ci/archive/20230219/202302191948.V9lrLeQJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6f7f70e3a8dd1fbce95eaea2a8eff70f01363c00
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6f7f70e3a8dd1fbce95eaea2a8eff70f01363c00
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302191948.V9lrLeQJ-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/hwmon/lm75.h:31:29: warning: The result of the left shift is undefined because the left operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return (u16)((ntemp / 500) << 7);
                                      ^
   drivers/hwmon/ad7418.c:166:6: note: Assuming 'ret' is >= 0
           if (ret < 0)
               ^~~~~~~
   drivers/hwmon/ad7418.c:166:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/hwmon/ad7418.c:170:28: note: Calling 'LM75_TEMP_TO_REG'
           data->temp[attr->index] = LM75_TEMP_TO_REG(temp);
                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm75.h:28:14: note: Assuming '__UNIQUE_ID___val252' is < '__UNIQUE_ID___hi254'
           int ntemp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:159:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:146:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:59:3: note: expanded from macro '__careful_clamp'
                   __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:47:3: note: expanded from macro '__clamp_once'
                   __clamp(unique_val, unique_lo, unique_hi); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:41:3: note: expanded from macro '__clamp'
           ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
            ^~~~~~~~~~~~~
   drivers/hwmon/lm75.h:28:14: note: '?' condition is false
           int ntemp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:159:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:146:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ^
   include/linux/minmax.h:59:3: note: expanded from macro '__careful_clamp'
                   __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
                   ^
   include/linux/minmax.h:47:3: note: expanded from macro '__clamp_once'
                   __clamp(unique_val, unique_lo, unique_hi); })
                   ^
   include/linux/minmax.h:41:3: note: expanded from macro '__clamp'
           ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
            ^
   drivers/hwmon/lm75.h:28:14: note: Assuming '__UNIQUE_ID___val252' is <= '__UNIQUE_ID___lo253'
           int ntemp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:159:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:146:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:59:3: note: expanded from macro '__careful_clamp'
                   __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:47:3: note: expanded from macro '__clamp_once'
                   __clamp(unique_val, unique_lo, unique_hi); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:41:27: note: expanded from macro '__clamp'
           ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
                                    ^~~~~~~~~~~~~
   drivers/hwmon/lm75.h:28:14: note: '?' condition is true
           int ntemp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:159:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:146:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ^
   include/linux/minmax.h:59:3: note: expanded from macro '__careful_clamp'
                   __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
                   ^
   include/linux/minmax.h:47:3: note: expanded from macro '__clamp_once'
                   __clamp(unique_val, unique_lo, unique_hi); })
                   ^
   include/linux/minmax.h:41:27: note: expanded from macro '__clamp'
           ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
                                    ^
   drivers/hwmon/lm75.h:30:12: note: 'ntemp' is < 0
           ntemp += (ntemp < 0 ? -250 : 250);
                     ^~~~~
   drivers/hwmon/lm75.h:30:12: note: '?' condition is true
   drivers/hwmon/lm75.h:31:29: note: The result of the left shift is undefined because the left operand is negative
           return (u16)((ntemp / 500) << 7);
                        ~~~~~~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/power/supply/rt9467-charger.c:379:4: warning: Value stored to 'value' is never read [clang-analyzer-deadcode.DeadStores]
                           value = range->max_sel;
                           ^       ~~~~~~~~~~~~~~
   drivers/power/supply/rt9467-charger.c:379:4: note: Value stored to 'value' is never read
                           value = range->max_sel;
                           ^       ~~~~~~~~~~~~~~
>> drivers/power/supply/rt9467-charger.c:589:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = rt9467_set_value_from_ranges(data, F_AICL_VTH,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/rt9467-charger.c:589:2: note: Value stored to 'ret' is never read
           ret = rt9467_set_value_from_ranges(data, F_AICL_VTH,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/input/keyboard/bcm-keypad.c:169:2: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
           val &= ~KPCR_ENABLE;
           ^      ~~~~~~~~~~~~
   drivers/input/keyboard/bcm-keypad.c:169:2: note: Value stored to 'val' is never read
           val &= ~KPCR_ENABLE;
           ^      ~~~~~~~~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (1 in non-user code, 7 with check filters).
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
   2 warnings generated.
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

vim +/value +379 drivers/power/supply/rt9467-charger.c

6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  365  
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  366  static int rt9467_set_value_from_ranges(struct rt9467_chg_data *data,
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  367  					enum rt9467_fields field,
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  368  					enum rt9467_ranges rsel,
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  369  					int value)
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  370  {
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  371  	const struct linear_range *range = rt9467_ranges + rsel;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  372  	unsigned int sel;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  373  	bool found;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  374  	int ret;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  375  
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  376  	if (rsel == RT9467_RANGE_VMIVR) {
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  377  		ret = linear_range_get_selector_high(range, value, &sel, &found);
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  378  		if (ret)
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03 @379  			value = range->max_sel;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  380  	} else {
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  381  		linear_range_get_selector_within(range, value, &sel);
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  382  	}
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  383  
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  384  	return regmap_field_write(data->rm_field[field], sel);
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  385  }
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  386  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
