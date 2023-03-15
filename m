Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81286193
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 23:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678922420; x=1710458420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rx11tTk9tNNUCOkTz/InUzY6Hz27Uz5DNnHyrO2g3jI=;
  b=hxUyP2vhLwchYcFSgT8iyRkLhVqKYN9dLJeR1VaAA87C/2GRmbpdJ4jP
   IW6EUn8bOE8zsxC1KnJAZ7B97AtjZwyGqMtMCVFTkcvrzFlSyzhWRf0hQ
   vwMkRVIcnp7k6Y9QN+BWhVWB0PXVap1KgSx6cku7q/uoljyZu3yM+qg2n
   czjfkAc1IWCDhowszCgmLLSGw3cU81UrGumeDb8f/9cW/t9h6VkPrF/Nm
   /lJUvyGs6LRsQ0IqVJMSR5zwynIkEh/zifwq9le73i+cquX1npebXd/D7
   zF5D0cQLyWG1YThmSeAf5dXWCBbo8tAgMuKG43m8D7UG5bmwwB2l2igrT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="336528992"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="336528992"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="743898920"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="743898920"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Mar 2023 16:20:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcaPj-000879-2w;
	Wed, 15 Mar 2023 23:20:11 +0000
Date: Thu, 16 Mar 2023 07:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2395/3406] crypto/akcipher.c:135:32: warning:
 Value stored to 'istat' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303160738.f9dQdizg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/akcipher.c:135:32: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   225b6b81afe63b3850b7cee0a3590f51144f2a75
commit: 49be9316310d89c790d13979ea727d32e2fd3ec4 [2395/3406] crypto: akcipher - Count error stats differently
:::::: branch date: 21 hours ago
:::::: commit date: 6 days ago
config: arm-randconfig-c002-20230312 (https://download.01.org/0day-ci/archive/20230316/202303160738.f9dQdizg-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=49be9316310d89c790d13979ea727d32e2fd3ec4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 49be9316310d89c790d13979ea727d32e2fd3ec4
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303160738.f9dQdizg-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:364:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   include/linux/list.h:292:9: note: Left side of '||' is false
           return READ_ONCE(head->next) == head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:364:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   include/linux/list.h:292:9: note: Left side of '||' is true
           return READ_ONCE(head->next) == head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:365:28: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                     ^
   include/linux/list.h:292:9: note: Taking false branch
           return READ_ONCE(head->next) == head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:377:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/list.h:292:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(head->next) == head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:369:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   include/linux/list.h:292:9: note: Dereference of null pointer
           return READ_ONCE(head->next) == head;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/gcov/fs.c:532:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(node->name, name);
                   ^~~~~~
   kernel/gcov/fs.c:532:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(node->name, name);
                   ^~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
>> crypto/akcipher.c:135:32: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_akcipher *istat = akcipher_get_stat(alg);
                                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   crypto/akcipher.c:135:32: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_akcipher *istat = akcipher_get_stat(alg);
                                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/clk/tegra/clk-tegra114.c:910:2: warning: Value stored to 'clk' is never read [clang-analyzer-deadcode.DeadStores]
           clk = tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:910:2: note: Value stored to 'clk' is never read
           clk = tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:934:2: warning: Value stored to 'clk' is never read [clang-analyzer-deadcode.DeadStores]
           clk = tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:934:2: note: Value stored to 'clk' is never read
           clk = tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:943:2: warning: Value stored to 'clk' is never read [clang-analyzer-deadcode.DeadStores]
           clk = clk_register_fixed_factor(NULL, "pll_m_ud", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:943:2: note: Value stored to 'clk' is never read
           clk = clk_register_fixed_factor(NULL, "pll_m_ud", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:1049:2: warning: Value stored to 'clk' is never read [clang-analyzer-deadcode.DeadStores]
           clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
           ^
   drivers/clk/tegra/clk-tegra114.c:1049:2: note: Value stored to 'clk' is never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/clk/tegra/clk-tegra124.c:1098:2: warning: Value stored to 'clk' is never read [clang-analyzer-deadcode.DeadStores]
           clk = tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1098:2: note: Value stored to 'clk' is never read
           clk = tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1132:2: warning: Value stored to 'clk' is never read [clang-analyzer-deadcode.DeadStores]
           clk = tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1132:2: note: Value stored to 'clk' is never read
           clk = tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).

vim +/istat +135 crypto/akcipher.c

3c339ab83fc09d Tadeusz Struk      2015-06-16  132  
28a4618ad14cf1 Andrzej Zaborowski 2015-12-05  133  static void akcipher_prepare_alg(struct akcipher_alg *alg)
3c339ab83fc09d Tadeusz Struk      2015-06-16  134  {
49be9316310d89 Herbert Xu         2023-02-16 @135  	struct crypto_istat_akcipher *istat = akcipher_get_stat(alg);
3c339ab83fc09d Tadeusz Struk      2015-06-16  136  	struct crypto_alg *base = &alg->base;
3c339ab83fc09d Tadeusz Struk      2015-06-16  137  
3c339ab83fc09d Tadeusz Struk      2015-06-16  138  	base->cra_type = &crypto_akcipher_type;
3c339ab83fc09d Tadeusz Struk      2015-06-16  139  	base->cra_flags &= ~CRYPTO_ALG_TYPE_MASK;
3c339ab83fc09d Tadeusz Struk      2015-06-16  140  	base->cra_flags |= CRYPTO_ALG_TYPE_AKCIPHER;
49be9316310d89 Herbert Xu         2023-02-16  141  
49be9316310d89 Herbert Xu         2023-02-16  142  	if (IS_ENABLED(CONFIG_CRYPTO_STATS))
49be9316310d89 Herbert Xu         2023-02-16  143  		memset(istat, 0, sizeof(*istat));
28a4618ad14cf1 Andrzej Zaborowski 2015-12-05  144  }
28a4618ad14cf1 Andrzej Zaborowski 2015-12-05  145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
