Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C933817D9
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jan 2023 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675069678; x=1706605678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+5rCJbhBtcoRModEaYhNdrPf4BTG5cmVhOpr/V0HTtk=;
  b=bgLChd7S7DK8HYRtGZ7cituVCu1OFYALd6o44vMAn5rU9xWGIQ6Y5wW9
   jfMu7lSbRfmiL84muZOV35CGa3xHKbs49ppY0tMlD3WhpXAJLYpR4YWtF
   E+dcN+VAJyGwBdH9iH3e9SsJuFLBTlHG2ewpixCbRb+k3pXeB/ttuKHU+
   /rQqMW6wguPLWpZeqLM+JAq8XeWvyfentyxwAp3ujsM5DZBH+0t+1I/rP
   xTBeF6sbLkAQPIhzUg8TWeJpaBCET1oWx5vJcUPISRQeN9csJbcSDiX19
   29DHlBXBRBCCkyd5Re4TLrrvnPIzLIFRiWuzh31/G8hDgewke1g6yTy5Q
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="392059915"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="392059915"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 01:07:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="732622198"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="732622198"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Jan 2023 01:07:56 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMQ8p-0003WI-2k;
	Mon, 30 Jan 2023 09:07:55 +0000
Date: Mon, 30 Jan 2023 17:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/input/keyboard/tegra-kbc.c:404:3: warning: Value stored to
 'val' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202301301756.18L2vdyM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/input/keyboard/tegra-kbc.c:404:3: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hi Jonathan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d796c50f84ca79f1722bb131799e5a5710c4700
commit: d65adc2b16f89e244b746eb149af17f93b75bbdc Input: tegra-kbc - allow build with COMPILE_TEST
date:   8 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20230128 (https://download.01.org/0day-ci/archive/20230130/202301301756.18L2vdyM-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d65adc2b16f89e244b746eb149af17f93b75bbdc
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d65adc2b16f89e244b746eb149af17f93b75bbdc
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
   drivers/char/ipmi/ipmi_si_intf.c:1836:6: note: Assuming field 'thread' is equal to NULL
           if (smi_info->thread != NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:1836:2: note: Taking false branch
           if (smi_info->thread != NULL) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:1842:2: note: Value assigned to field 'curr_msg'
           del_timer_sync(&smi_info->si_timer);
           ^
   include/linux/timer.h:190:29: note: expanded from macro 'del_timer_sync'
   # define del_timer_sync(t)              del_timer(t)
                                           ^~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2176:2: note: Returning from 'stop_timer_and_thread'
           stop_timer_and_thread(smi_info);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2190:9: note: Assuming field 'curr_msg' is null
           while (smi_info->curr_msg || (smi_info->si_state != SI_NORMAL)) {
                  ^~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2190:9: note: Left side of '||' is false
   drivers/char/ipmi/ipmi_si_intf.c:2190:32: note: Assuming field 'si_state' is not equal to SI_NORMAL
           while (smi_info->curr_msg || (smi_info->si_state != SI_NORMAL)) {
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2190:2: note: Loop condition is true.  Entering loop body
           while (smi_info->curr_msg || (smi_info->si_state != SI_NORMAL)) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:2191:3: note: Calling 'poll'
                   poll(smi_info);
                   ^~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:1041:2: note: '?' condition is true
           udelay(10);
           ^
   arch/arm/include/asm/delay.h:83:3: note: expanded from macro 'udelay'
           (__builtin_constant_p(n) ?                                      \
            ^
   drivers/char/ipmi/ipmi_si_intf.c:1041:2: note: '?' condition is false
           udelay(10);
           ^
   arch/arm/include/asm/delay.h:84:5: note: expanded from macro 'udelay'
             ((n) > (MAX_UDELAY_MS * 1000) ? __bad_udelay() :              \
              ^
   drivers/char/ipmi/ipmi_si_intf.c:1042:6: note: Assuming 'run_to_completion' is true
           if (!run_to_completion)
               ^~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:1042:2: note: Taking false branch
           if (!run_to_completion)
           ^
   drivers/char/ipmi/ipmi_si_intf.c:1044:2: note: Calling 'smi_event_handler'
           smi_event_handler(smi_info, 10);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:765:9: note: Assuming 'si_sm_result' is not equal to SI_SM_CALL_WITHOUT_DELAY
           while (si_sm_result == SI_SM_CALL_WITHOUT_DELAY)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:765:2: note: Loop condition is false. Execution continues on line 768
           while (si_sm_result == SI_SM_CALL_WITHOUT_DELAY)
           ^
   drivers/char/ipmi/ipmi_si_intf.c:768:6: note: Assuming 'si_sm_result' is equal to SI_SM_TRANSACTION_COMPLETE
           if (si_sm_result == SI_SM_TRANSACTION_COMPLETE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:768:2: note: Taking true branch
           if (si_sm_result == SI_SM_TRANSACTION_COMPLETE) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:771:3: note: Calling 'handle_transaction_done'
                   handle_transaction_done(smi_info);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:543:2: note: Control jumps to 'case SI_GETTING_MESSAGES:'  at line 640
           switch (smi_info->si_state) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:643:4: note: Access to field 'rsp_size' results in a dereference of a null pointer (loaded from field 'curr_msg')
                           = smi_info->handlers->get_result(
                           ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/input/keyboard/samsung-keypad.c:88:23: warning: The result of the left shift is undefined because the left operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           val &= ~(1 << col) << 8;
                                              ^
   drivers/input/keyboard/samsung-keypad.c:158:3: note: Calling 'samsung_keypad_scan'
                   samsung_keypad_scan(keypad, row_state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/samsung-keypad.c:85:16: note: Assuming 'col' is < field 'cols'
           for (col = 0; col < keypad->cols; col++) {
                         ^~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/samsung-keypad.c:85:2: note: Loop condition is true.  Entering loop body
           for (col = 0; col < keypad->cols; col++) {
           ^
   drivers/input/keyboard/samsung-keypad.c:86:7: note: Assuming field 'type' is equal to KEYPAD_TYPE_S5PV210
                   if (keypad->type == KEYPAD_TYPE_S5PV210) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/samsung-keypad.c:86:3: note: Taking true branch
                   if (keypad->type == KEYPAD_TYPE_S5PV210) {
                   ^
   drivers/input/keyboard/samsung-keypad.c:88:23: note: The result of the left shift is undefined because the left operand is negative
                           val &= ~(1 << col) << 8;
                                  ~~~~~~~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/input/keyboard/tegra-kbc.c:404:3: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val = readl(kbc->mmio + KBC_KP_ENT0_0);
                   ^
   drivers/input/keyboard/tegra-kbc.c:404:3: note: Value stored to 'val' is never read
   drivers/input/keyboard/tegra-kbc.c:405:3: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val = readl(kbc->mmio + KBC_KP_ENT1_0);
                   ^
   drivers/input/keyboard/tegra-kbc.c:405:3: note: Value stored to 'val' is never read
   include/asm-generic/bitops/generic-non-atomic.h:33:6: warning: Dereference of null pointer (loaded from variable 'p') [clang-analyzer-core.NullDereference]
           *p  |= mask;
               ^
   drivers/input/keyboard/tegra-kbc.c:612:6: note: Assuming 'kbc' is non-null
           if (!kbc) {
               ^~~~
   drivers/input/keyboard/tegra-kbc.c:612:2: note: Taking false branch
           if (!kbc) {
           ^
   drivers/input/keyboard/tegra-kbc.c:624:2: note: Loop condition is false.  Exiting loop
           spin_lock_init(&kbc->lock);
           ^
   include/linux/spinlock.h:330:35: note: expanded from macro 'spin_lock_init'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/input/keyboard/tegra-kbc.c:627:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/input/keyboard/tegra-kbc.c:627:2: note: Taking false branch
           if (err)
           ^
   drivers/input/keyboard/tegra-kbc.c:630:6: note: Assuming the condition is false
           if (!tegra_kbc_check_pin_cfg(kbc, &num_rows))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tegra-kbc.c:630:2: note: Taking false branch
           if (!tegra_kbc_check_pin_cfg(kbc, &num_rows))
           ^
   drivers/input/keyboard/tegra-kbc.c:634:6: note: Assuming field 'irq' is >= 0
           if (kbc->irq < 0)
               ^~~~~~~~~~~~
   drivers/input/keyboard/tegra-kbc.c:634:2: note: Taking false branch
           if (kbc->irq < 0)
           ^
   drivers/input/keyboard/tegra-kbc.c:638:6: note: Assuming field 'idev' is non-null
           if (!kbc->idev) {
               ^~~~~~~~~~
   drivers/input/keyboard/tegra-kbc.c:638:2: note: Taking false branch
           if (!kbc->idev) {
           ^
   drivers/input/keyboard/tegra-kbc.c:647:2: note: Taking false branch
           if (IS_ERR(kbc->mmio))
           ^
   drivers/input/keyboard/tegra-kbc.c:651:2: note: Taking false branch
           if (IS_ERR(kbc->clk)) {
           ^
   drivers/input/keyboard/tegra-kbc.c:657:2: note: Taking false branch
           if (IS_ERR(kbc->rst)) {
           ^
   drivers/input/keyboard/tegra-kbc.c:668:17: note: Assuming '__UNIQUE_ID___x221' is >= '__UNIQUE_ID___y222'
           debounce_cnt = min(kbc->debounce_cnt, KBC_MAX_DEBOUNCE_CNT);
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
                            ^~~~~~~~~~
   drivers/input/keyboard/tegra-kbc.c:668:17: note: '?' condition is false
           debounce_cnt = min(kbc->debounce_cnt, KBC_MAX_DEBOUNCE_CNT);
                          ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/input/keyboard/tegra-kbc.c:679:6: note: Assuming field 'keymap_data' is null
           if (kbc->keymap_data && kbc->use_fn_map)
               ^~~~~~~~~~~~~~~~
   drivers/input/keyboard/tegra-kbc.c:679:23: note: Left side of '&&' is false
           if (kbc->keymap_data && kbc->use_fn_map)
                                ^
   drivers/input/keyboard/tegra-kbc.c:686:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/input/keyboard/tegra-kbc.c:686:2: note: Taking false branch
           if (err) {
           ^
   drivers/input/keyboard/tegra-kbc.c:691:2: note: Left side of '&&' is true
           __set_bit(EV_REP, kbc->idev->evbit);
           ^

vim +/val +404 drivers/input/keyboard/tegra-kbc.c

11f5b30dacdd77 Rakesh Iyer     2011-01-19  355  
11f5b30dacdd77 Rakesh Iyer     2011-01-19  356  static int tegra_kbc_start(struct tegra_kbc *kbc)
11f5b30dacdd77 Rakesh Iyer     2011-01-19  357  {
11f5b30dacdd77 Rakesh Iyer     2011-01-19  358  	unsigned int debounce_cnt;
11f5b30dacdd77 Rakesh Iyer     2011-01-19  359  	u32 val = 0;
8a7f102c4b1594 Arvind Yadav    2017-08-31  360  	int ret;
11f5b30dacdd77 Rakesh Iyer     2011-01-19  361  
8a7f102c4b1594 Arvind Yadav    2017-08-31  362  	ret = clk_prepare_enable(kbc->clk);
8a7f102c4b1594 Arvind Yadav    2017-08-31  363  	if (ret)
8a7f102c4b1594 Arvind Yadav    2017-08-31  364  		return ret;
11f5b30dacdd77 Rakesh Iyer     2011-01-19  365  
11f5b30dacdd77 Rakesh Iyer     2011-01-19  366  	/* Reset the KBC controller to clear all previous status.*/
fe6b0dfaba689a Stephen Warren  2013-11-06  367  	reset_control_assert(kbc->rst);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  368  	udelay(100);
fae16989be77b0 Masahiro Yamada 2016-08-22  369  	reset_control_deassert(kbc->rst);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  370  	udelay(100);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  371  
11f5b30dacdd77 Rakesh Iyer     2011-01-19  372  	tegra_kbc_config_pins(kbc);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  373  	tegra_kbc_setup_wakekeys(kbc, false);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  374  
9eee07d39fa606 Stephen Warren  2013-02-15  375  	writel(kbc->repeat_cnt, kbc->mmio + KBC_RPT_DLY_0);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  376  
11f5b30dacdd77 Rakesh Iyer     2011-01-19  377  	/* Keyboard debounce count is maximum of 12 bits. */
9eee07d39fa606 Stephen Warren  2013-02-15  378  	debounce_cnt = min(kbc->debounce_cnt, KBC_MAX_DEBOUNCE_CNT);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  379  	val = KBC_DEBOUNCE_CNT_SHIFT(debounce_cnt);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  380  	val |= KBC_FIFO_TH_CNT_SHIFT(1); /* set fifo interrupt threshold to 1 */
11f5b30dacdd77 Rakesh Iyer     2011-01-19  381  	val |= KBC_CONTROL_FIFO_CNT_INT_EN;  /* interrupt on FIFO threshold */
11f5b30dacdd77 Rakesh Iyer     2011-01-19  382  	val |= KBC_CONTROL_KBC_EN;     /* enable */
11f5b30dacdd77 Rakesh Iyer     2011-01-19  383  	writel(val, kbc->mmio + KBC_CONTROL_0);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  384  
11f5b30dacdd77 Rakesh Iyer     2011-01-19  385  	/*
11f5b30dacdd77 Rakesh Iyer     2011-01-19  386  	 * Compute the delay(ns) from interrupt mode to continuous polling
11f5b30dacdd77 Rakesh Iyer     2011-01-19  387  	 * mode so the timer routine is scheduled appropriately.
11f5b30dacdd77 Rakesh Iyer     2011-01-19  388  	 */
11f5b30dacdd77 Rakesh Iyer     2011-01-19  389  	val = readl(kbc->mmio + KBC_INIT_DLY_0);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  390  	kbc->cp_dly_jiffies = usecs_to_jiffies((val & 0xfffff) * 32);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  391  
11f5b30dacdd77 Rakesh Iyer     2011-01-19  392  	kbc->num_pressed_keys = 0;
11f5b30dacdd77 Rakesh Iyer     2011-01-19  393  
11f5b30dacdd77 Rakesh Iyer     2011-01-19  394  	/*
11f5b30dacdd77 Rakesh Iyer     2011-01-19  395  	 * Atomically clear out any remaining entries in the key FIFO
11f5b30dacdd77 Rakesh Iyer     2011-01-19  396  	 * and enable keyboard interrupts.
11f5b30dacdd77 Rakesh Iyer     2011-01-19  397  	 */
11f5b30dacdd77 Rakesh Iyer     2011-01-19  398  	while (1) {
11f5b30dacdd77 Rakesh Iyer     2011-01-19  399  		val = readl(kbc->mmio + KBC_INT_0);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  400  		val >>= 4;
11f5b30dacdd77 Rakesh Iyer     2011-01-19  401  		if (!val)
11f5b30dacdd77 Rakesh Iyer     2011-01-19  402  			break;
11f5b30dacdd77 Rakesh Iyer     2011-01-19  403  
11f5b30dacdd77 Rakesh Iyer     2011-01-19 @404  		val = readl(kbc->mmio + KBC_KP_ENT0_0);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  405  		val = readl(kbc->mmio + KBC_KP_ENT1_0);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  406  	}
11f5b30dacdd77 Rakesh Iyer     2011-01-19  407  	writel(0x7, kbc->mmio + KBC_INT_0);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  408  
11f5b30dacdd77 Rakesh Iyer     2011-01-19  409  	enable_irq(kbc->irq);
11f5b30dacdd77 Rakesh Iyer     2011-01-19  410  
11f5b30dacdd77 Rakesh Iyer     2011-01-19  411  	return 0;
11f5b30dacdd77 Rakesh Iyer     2011-01-19  412  }
11f5b30dacdd77 Rakesh Iyer     2011-01-19  413  

:::::: The code at line 404 was first introduced by commit
:::::: 11f5b30dacdd77bee1028764d91ad58b6c73d50c Input: tegra-kbc - add tegra keyboard driver

:::::: TO: Rakesh Iyer <riyer@nvidia.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
