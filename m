Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DBB8C17
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Mar 2023 21:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678742087; x=1710278087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V+Uglvxg5GmRH4Rxs+9GrDHTaoc3U1HbC/8kWa2dymo=;
  b=KWSp+B+f1rVndN0HLam/+MO9AerYxnoplmgRSLjWzDagSIRbE4EwoJPP
   vLz6wfD0UsUOqAqFB2D+9UNzcQRbsdIfjWZP8t3gRWiCX4GEZej67rvxH
   7T5zU6YqQnZYAiimWOuuORM+mDydJ/Wbbhs9FbXv5kWPjRYq11IPEdFJQ
   8tYcYZXK3DQpPV2eg6COHdZBzF9Bmq6UtJwRmMiejSWMu2LoPaveW+7Wu
   hO5aWBiOxk3+Du4cD9137uPPPDzBfMPEQLHomF2OIrxjcw8XIEDWLpcg9
   3t1CLiWNPMqmLPn6xwR8sy2lrDzfvjY56WtfqYt//5ExkQCYblgquX51H
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="335956803"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="335956803"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 14:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="678842727"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="678842727"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Mar 2023 14:14:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbpVE-000686-2O;
	Mon, 13 Mar 2023 21:14:44 +0000
Date: Tue, 14 Mar 2023 05:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pinctrl/stm32/pinctrl-stm32.c:294:24: warning: Value stored
 to 'pctl' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303140517.AzaQI5Vu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pinctrl/stm32/pinctrl-stm32.c:294:24: warning: Value stored to 'pctl' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Fabien Dessenne <fabien.dessenne@foss.st.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc89d7fb499b0162e081f434d45e8d1b47e82ece
commit: 3389b09878dddd58ef52bd0bf43cc42ea5a9ea2a pinctrl: stm32: prevent the use of the secure protected pins
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20230308 (https://download.01.org/0day-ci/archive/20230314/202303140517.AzaQI5Vu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3389b09878dddd58ef52bd0bf43cc42ea5a9ea2a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3389b09878dddd58ef52bd0bf43cc42ea5a9ea2a
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303140517.AzaQI5Vu-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/afs/dir_edit.c:185:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(block->meta.alloc_ctrs,
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/afs/dir_edit.c:185:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(block->meta.alloc_ctrs,
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/afs/dir_edit.c:311:2: warning: Value stored to 'nr_blocks' is never read [clang-analyzer-deadcode.DeadStores]
           nr_blocks = 1;
           ^           ~
   fs/afs/dir_edit.c:311:2: note: Value stored to 'nr_blocks' is never read
           nr_blocks = 1;
           ^           ~
   fs/afs/dir_edit.c:324:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(de->u.name, name->name, name->len + 1);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/afs/dir_edit.c:324:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(de->u.name, name->name, name->len + 1);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/afs/dir_edit.c:452:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(de, 0, sizeof(*de) * need_slots);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/afs/dir_edit.c:452:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(de, 0, sizeof(*de) * need_slots);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 75 warnings (75 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   38 warnings generated.
>> drivers/pinctrl/stm32/pinctrl-stm32.c:294:24: warning: Value stored to 'pctl' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
                                 ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:294:24: note: Value stored to 'pctl' during its initialization is never read
           struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
                                 ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1422:21: warning: Passed-by-value struct argument contains uninitialized data (e.g., field: 'id_size') [clang-analyzer-core.CallAndMessage]
                   pctl->irqmux[i] = devm_regmap_field_alloc(dev, rm, mux);
                                     ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1494:6: note: Assuming 'np' is non-null
           if (!np)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1494:2: note: Taking false branch
           if (!np)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1498:6: note: Assuming 'match' is non-null
           if (!match || !match->data)
               ^~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1498:6: note: Left side of '||' is false
   drivers/pinctrl/stm32/pinctrl-stm32.c:1498:16: note: Assuming field 'data' is non-null
           if (!match || !match->data)
                         ^~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1498:2: note: Taking false branch
           if (!match || !match->data)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1501:6: note: Assuming the condition is false
           if (!of_find_property(np, "pins-are-numbered", NULL)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1501:2: note: Taking false branch
           if (!of_find_property(np, "pins-are-numbered", NULL)) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1507:6: note: Assuming 'pctl' is non-null
           if (!pctl)
               ^~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1507:2: note: Taking false branch
           if (!pctl)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1514:2: note: Taking false branch
           if (IS_ERR(pctl->domain))
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1519:6: note: Assuming 'hwlock_id' is < 0
           if (hwlock_id < 0) {
               ^~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1519:2: note: Taking true branch
           if (hwlock_id < 0) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1520:7: note: Assuming the condition is false
                   if (hwlock_id == -EPROBE_DEFER)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1520:3: note: Taking false branch
                   if (hwlock_id == -EPROBE_DEFER)
                   ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1526:2: note: Loop condition is false.  Exiting loop
           spin_lock_init(&pctl->irqmux_lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_init'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1532:2: note: Taking false branch
           if (!of_property_read_u32(np, "st,package", &pctl->pkg))
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1537:6: note: Assuming field 'pins' is non-null
           if (!pctl->pins)
               ^~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1537:2: note: Taking false branch
           if (!pctl->pins)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1541:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1541:2: note: Taking false branch
           if (ret)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1545:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1545:2: note: Taking false branch
           if (ret) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1550:6: note: Assuming field 'domain' is non-null
           if (pctl->domain) {
               ^~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1550:2: note: Taking true branch
           if (pctl->domain) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1551:9: note: Calling 'stm32_pctrl_dt_setup_irq'
                   ret = stm32_pctrl_dt_setup_irq(pdev, pctl);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1397:2: note: Taking false branch
           if (IS_ERR(pctl->regmap))
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1403:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1403:2: note: Taking false branch
           if (ret)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1407:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1407:2: note: Taking false branch

vim +/pctl +294 drivers/pinctrl/stm32/pinctrl-stm32.c

acaa037970f610 Alexandre TORGUE 2017-05-29  288  
3389b09878dddd Fabien Dessenne  2022-05-02  289  static int stm32_gpio_init_valid_mask(struct gpio_chip *chip,
3389b09878dddd Fabien Dessenne  2022-05-02  290  				      unsigned long *valid_mask,
3389b09878dddd Fabien Dessenne  2022-05-02  291  				      unsigned int ngpios)
3389b09878dddd Fabien Dessenne  2022-05-02  292  {
3389b09878dddd Fabien Dessenne  2022-05-02  293  	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
3389b09878dddd Fabien Dessenne  2022-05-02 @294  	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
3389b09878dddd Fabien Dessenne  2022-05-02  295  	unsigned int i;
3389b09878dddd Fabien Dessenne  2022-05-02  296  	u32 sec;
3389b09878dddd Fabien Dessenne  2022-05-02  297  
3389b09878dddd Fabien Dessenne  2022-05-02  298  	/* All gpio are valid per default */
3389b09878dddd Fabien Dessenne  2022-05-02  299  	bitmap_fill(valid_mask, ngpios);
3389b09878dddd Fabien Dessenne  2022-05-02  300  
3389b09878dddd Fabien Dessenne  2022-05-02  301  	if (bank->secure_control) {
3389b09878dddd Fabien Dessenne  2022-05-02  302  		/* Tag secured pins as invalid */
3389b09878dddd Fabien Dessenne  2022-05-02  303  		sec = readl_relaxed(bank->base + STM32_GPIO_SECCFGR);
3389b09878dddd Fabien Dessenne  2022-05-02  304  
3389b09878dddd Fabien Dessenne  2022-05-02  305  		for (i = 0; i < ngpios; i++) {
3389b09878dddd Fabien Dessenne  2022-05-02  306  			if (sec & BIT(i)) {
3389b09878dddd Fabien Dessenne  2022-05-02  307  				clear_bit(i, valid_mask);
3389b09878dddd Fabien Dessenne  2022-05-02  308  				dev_dbg(pctl->dev, "No access to gpio %d - %d\n", bank->bank_nr, i);
3389b09878dddd Fabien Dessenne  2022-05-02  309  			}
3389b09878dddd Fabien Dessenne  2022-05-02  310  		}
3389b09878dddd Fabien Dessenne  2022-05-02  311  	}
3389b09878dddd Fabien Dessenne  2022-05-02  312  
3389b09878dddd Fabien Dessenne  2022-05-02  313  	return 0;
3389b09878dddd Fabien Dessenne  2022-05-02  314  }
3389b09878dddd Fabien Dessenne  2022-05-02  315  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
