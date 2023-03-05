Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF93517C7
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 05:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677993861; x=1709529861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9MJvaYGmtidLHnIveV6OHMeYVYK/IQYMGJG7n9CopMQ=;
  b=Bh4ZdD1xB3yxtXvLvYzBFacKrF3AKIE/PH2X9ZUdSmiDRcp0zHP2LmeB
   A2rGQAEpaMBp+2Z25RtJuKUMy+DxsZqg9QhhVTteCC8AUFlPSqaxxk/0Z
   PoqGKOYN+M2s0dvcegVFg+WDRc6sUBNmI8xXit+e5ms57rCWkQuI8xQaf
   ObrgVexsOySoHrYqeNtnhtcxqYzf1rQS6ZhYFVvxRgAOkYXrofAo6i1Zn
   ARRBAZze/72SNi2t3CWf8qhPBTY4nPG0WBiJeUkLEjAS2MiyxBvjHESlC
   FDyuIXgdn6n7R2YTIuRQm14ieqcD+xVEfnSPlG6I25Htr4wsRYIjWM0iK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="315745811"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="315745811"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 21:24:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="818948074"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="818948074"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2023 21:24:17 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYgr2-0002Z0-1v;
	Sun, 05 Mar 2023 05:24:16 +0000
Date: Sun, 5 Mar 2023 13:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pinctrl/meson/pinctrl-meson8-pmx.c:60:25: warning: Value
 stored to 'func' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303051303.ZnOVES00-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/pinctrl/meson/pinctrl-meson8-pmx.c:60:25: warning: Value stored to 'func' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Neil Armstrong <narmstrong@baylibre.com>

Hi Andy,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b01fe98d34f3bed944a93bd8119fed80c856fad8
commit: 6671d0bc17866f71b8ca7ea3fb7e6dfc2a8069d2 pinctrl: meson: Enable COMPILE_TEST
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20230302 (https://download.01.org/0day-ci/archive/20230305/202303051303.ZnOVES00-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6671d0bc17866f71b8ca7ea3fb7e6dfc2a8069d2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6671d0bc17866f71b8ca7ea3fb7e6dfc2a8069d2
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303051303.ZnOVES00-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~~
   drivers/i2c/busses/i2c-taos-evm.c:84:4: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(p, "$%02X#%02X", command, data->byte);
                           ^~~~~~~
   drivers/i2c/busses/i2c-taos-evm.c:84:4: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(p, "$%02X#%02X", command, data->byte);
                           ^~~~~~~
   drivers/i2c/busses/i2c-taos-evm.c:86:4: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(p, "$%02X", command);
                           ^~~~~~~
   drivers/i2c/busses/i2c-taos-evm.c:86:4: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(p, "$%02X", command);
                           ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/char/random.c:285:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(base_crng.key, key, sizeof(base_crng.key));
           ^~~~~~
   drivers/char/random.c:285:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(base_crng.key, key, sizeof(base_crng.key));
           ^~~~~~
   drivers/char/random.c:331:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&chacha_state[4], key, CHACHA_KEY_SIZE);
           ^~~~~~
   drivers/char/random.c:331:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&chacha_state[4], key, CHACHA_KEY_SIZE);
           ^~~~~~
   drivers/char/random.c:332:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&chacha_state[12], 0, sizeof(u32) * 4);
           ^~~~~~
   drivers/char/random.c:332:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&chacha_state[12], 0, sizeof(u32) * 4);
           ^~~~~~
   drivers/char/random.c:335:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(key, first_block, CHACHA_KEY_SIZE);
           ^~~~~~
   drivers/char/random.c:335:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(key, first_block, CHACHA_KEY_SIZE);
           ^~~~~~
   drivers/char/random.c:336:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(random_data, first_block + CHACHA_KEY_SIZE, random_data_len);
           ^~~~~~
   drivers/char/random.c:336:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(random_data, first_block + CHACHA_KEY_SIZE, random_data_len);
           ^~~~~~
   drivers/char/random.c:498:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf, tmp, nbytes);
                           ^~~~~~
   drivers/char/random.c:498:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf, tmp, nbytes);
                           ^~~~~~
   drivers/char/random.c:740:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(p, &v, chunk);
                   ^~~~~~
   drivers/char/random.c:740:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(p, &v, chunk);
                   ^~~~~~
   drivers/char/random.c:1324:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pool, fast_pool->pool, sizeof(pool));
           ^~~~~~
   drivers/char/random.c:1324:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(pool, fast_pool->pool, sizeof(pool));
           ^~~~~~
   drivers/char/random.c:1724:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(uuid_string, sizeof(uuid_string), "%pU", uuid);
           ^~~~~~~~
   drivers/char/random.c:1724:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(uuid_string, sizeof(uuid_string), "%pU", uuid);
           ^~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
>> drivers/pinctrl/meson/pinctrl-meson8-pmx.c:60:25: warning: Value stored to 'func' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct meson_pmx_func *func = &pc->data->funcs[func_num];
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/meson/pinctrl-meson8-pmx.c:60:25: note: Value stored to 'func' during its initialization is never read
           struct meson_pmx_func *func = &pc->data->funcs[func_num];
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (59 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   79 warnings generated.
   drivers/net/ethernet/cortina/gemini.c:1883:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(addr, 0, sizeof(addr));
           ^~~~~~
   drivers/net/ethernet/cortina/gemini.c:1883:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(addr, 0, sizeof(addr));
           ^~~~~~
   drivers/net/ethernet/cortina/gemini.c:1884:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, netdev->dev_addr, ETH_ALEN);
           ^~~~~~
   drivers/net/ethernet/cortina/gemini.c:1884:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(addr, netdev->dev_addr, ETH_ALEN);
           ^~~~~~
   drivers/net/ethernet/cortina/gemini.c:2019:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, gmac_stats_strings, sizeof(gmac_stats_strings));
           ^~~~~~
   drivers/net/ethernet/cortina/gemini.c:2019:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, gmac_stats_strings, sizeof(gmac_stats_strings));
           ^~~~~~
   drivers/net/ethernet/cortina/gemini.c:2059:3: warning: Value stored to 'p' is never read [clang-analyzer-deadcode.DeadStores]
                   p = values;
                   ^   ~~~~~~
   drivers/net/ethernet/cortina/gemini.c:2059:3: note: Value stored to 'p' is never read
                   p = values;
                   ^   ~~~~~~
   drivers/net/ethernet/cortina/gemini.c:2147:34: warning: The result of the left shift is undefined due to shifting by '4294967294', which is greater or equal to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   port->irq_every_tx_packets = 1 << (port->txq_order - 2);
                                                  ^  ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/cortina/gemini.c:2138:6: note: Assuming the condition is false
           if (netif_running(netdev))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/cortina/gemini.c:2138:2: note: Taking false branch
           if (netif_running(netdev))
           ^
   drivers/net/ethernet/cortina/gemini.c:2141:6: note: Assuming field 'rx_pending' is 0
           if (rp->rx_pending) {
               ^~~~~~~~~~~~~~
   drivers/net/ethernet/cortina/gemini.c:2141:2: note: Taking false branch
           if (rp->rx_pending) {
           ^
   drivers/net/ethernet/cortina/gemini.c:2145:6: note: Assuming field 'tx_pending' is not equal to 0
           if (rp->tx_pending) {
               ^~~~~~~~~~~~~~
   drivers/net/ethernet/cortina/gemini.c:2145:2: note: Taking true branch
           if (rp->tx_pending) {
           ^
   drivers/net/ethernet/cortina/gemini.c:2146:29: note: '?' condition is false
                   port->txq_order = min(15, ilog2(rp->tx_pending - 1) + 1);
                                             ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/net/ethernet/cortina/gemini.c:2146:29: note: '?' condition is true
                   port->txq_order = min(15, ilog2(rp->tx_pending - 1) + 1);
                                             ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <= 4) ?              \
           ^
   drivers/net/ethernet/cortina/gemini.c:2146:21: note: '__UNIQUE_ID___x432' is >= '__UNIQUE_ID___y433'
                   port->txq_order = min(15, ilog2(rp->tx_pending - 1) + 1);
                                     ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/net/ethernet/cortina/gemini.c:2146:21: note: '?' condition is false
                   port->txq_order = min(15, ilog2(rp->tx_pending - 1) + 1);
                                     ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)

vim +/func +60 drivers/pinctrl/meson/pinctrl-meson8-pmx.c

ce385aa24a0dcc Jerome Brunet 2017-10-12  55  
ce385aa24a0dcc Jerome Brunet 2017-10-12  56  static int meson8_pmx_set_mux(struct pinctrl_dev *pcdev, unsigned func_num,
ce385aa24a0dcc Jerome Brunet 2017-10-12  57  			      unsigned group_num)
ce385aa24a0dcc Jerome Brunet 2017-10-12  58  {
ce385aa24a0dcc Jerome Brunet 2017-10-12  59  	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
ce385aa24a0dcc Jerome Brunet 2017-10-12 @60  	struct meson_pmx_func *func = &pc->data->funcs[func_num];
ce385aa24a0dcc Jerome Brunet 2017-10-12  61  	struct meson_pmx_group *group = &pc->data->groups[group_num];
ce385aa24a0dcc Jerome Brunet 2017-10-12  62  	struct meson8_pmx_data *pmx_data =
ce385aa24a0dcc Jerome Brunet 2017-10-12  63  		(struct meson8_pmx_data *)group->data;
ce385aa24a0dcc Jerome Brunet 2017-10-12  64  	int i, ret = 0;
ce385aa24a0dcc Jerome Brunet 2017-10-12  65  
ce385aa24a0dcc Jerome Brunet 2017-10-12  66  	dev_dbg(pc->dev, "enable function %s, group %s\n", func->name,
ce385aa24a0dcc Jerome Brunet 2017-10-12  67  		group->name);
ce385aa24a0dcc Jerome Brunet 2017-10-12  68  
ce385aa24a0dcc Jerome Brunet 2017-10-12  69  	/*
ce385aa24a0dcc Jerome Brunet 2017-10-12  70  	 * Disable groups using the same pin.
ce385aa24a0dcc Jerome Brunet 2017-10-12  71  	 * The selected group is not disabled to avoid glitches.
ce385aa24a0dcc Jerome Brunet 2017-10-12  72  	 */
ce385aa24a0dcc Jerome Brunet 2017-10-12  73  	for (i = 0; i < group->num_pins; i++)
ce385aa24a0dcc Jerome Brunet 2017-10-12  74  		meson8_pmx_disable_other_groups(pc, group->pins[i], group_num);
ce385aa24a0dcc Jerome Brunet 2017-10-12  75  
ce385aa24a0dcc Jerome Brunet 2017-10-12  76  	/* Function 0 (GPIO) doesn't need any additional setting */
ce385aa24a0dcc Jerome Brunet 2017-10-12  77  	if (func_num)
ce385aa24a0dcc Jerome Brunet 2017-10-12  78  		ret = regmap_update_bits(pc->reg_mux, pmx_data->reg * 4,
ce385aa24a0dcc Jerome Brunet 2017-10-12  79  					 BIT(pmx_data->bit),
ce385aa24a0dcc Jerome Brunet 2017-10-12  80  					 BIT(pmx_data->bit));
ce385aa24a0dcc Jerome Brunet 2017-10-12  81  
ce385aa24a0dcc Jerome Brunet 2017-10-12  82  	return ret;
ce385aa24a0dcc Jerome Brunet 2017-10-12  83  }
ce385aa24a0dcc Jerome Brunet 2017-10-12  84  

:::::: The code at line 60 was first introduced by commit
:::::: ce385aa24a0dcccdc81dfcbc90cf7aa290d8b758 pinctrl: meson: rework pinmux ops

:::::: TO: Jerome Brunet <jbrunet@baylibre.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
