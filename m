Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96362C9D
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679151648; x=1710687648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCZNmbVUBVKGcXQvitiWBsKc5gqcUWC9r366zI6utcs=;
  b=Mz0kSYfo4J+xqkGw/ZsuKPlIHLCUpR8eBXzkTToKtzPh9syfsxFbjtr6
   GHQ7ahH+kWVIuCHkhIxBEUrtKgOQdGVYSwjXeJ+dx8nU7C89hPLlKQgTv
   L4NTo3p38s/2nMhAgkBPGg6yXdZG7JJiE328FLfQQA77lhNVSBQOnsuWt
   gEUZt1JcK1HpsylY28VnoM4qnLoOYK2LFuvGgLA0RDy2D86TJnXBjFvam
   oj4PA2vT2iGP3N9x+ga7Su7AU7thK+owVuW3YNKr2NOO83Sb5z3bkz7pm
   gaRh2AZ13TbT7m9JYOaxAIq4y1mx6ZmplzNNnpcJiEHgDRxoC038TPBYH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="403311753"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="403311753"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 08:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630599350"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="630599350"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Mar 2023 08:00:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdY33-000A7a-2l;
	Sat, 18 Mar 2023 15:00:45 +0000
Date: Sat, 18 Mar 2023 23:00:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [daeinki-drm-exynos:exynos-drm-next 12/16]
 drivers/gpu/drm/bridge/samsung-dsim.c:621:3: warning: Value stored to
 'esc_clk' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303182221.Qm3mIOw5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/bridge/samsung-dsim.c:621:3: warning: Value stored to 'esc_clk' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Jagan Teki <jagan@amarulasolutions.com>
CC: Inki Dae <inki.dae@samsung.com>
CC: Marek Vasut <marex@denx.de>
CC: Marek Szyprowski <m.szyprowski@samsung.com>

tree:   https://git.kernel.org:/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
head:   4a1f2c1262372aea58438a18fe456125b0b47537
commit: 15717e725a0c35ce4e80122161c332267f1559a6 [12/16] drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-c006-20230312 (https://download.01.org/0day-ci/archive/20230318/202303182221.Qm3mIOw5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add daeinki-drm-exynos https://git.kernel.org:/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
        git fetch --no-tags daeinki-drm-exynos exynos-drm-next
        git checkout 15717e725a0c35ce4e80122161c332267f1559a6
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303182221.Qm3mIOw5-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   kernel/torture.c:351:6: note: Assuming 'onoff_holdoff' is <= 0
           if (onoff_holdoff > 0) {
               ^~~~~~~~~~~~~~~~~
   kernel/torture.c:351:2: note: Taking false branch
           if (onoff_holdoff > 0) {
           ^
   kernel/torture.c:356:10: note: Calling 'torture_must_stop'
           while (!torture_must_stop()) {
                   ^~~~~~~~~~~~~~~~~~~
   kernel/torture.c:889:9: note: Left side of '||' is false
           return torture_must_stop_irq() || kthread_should_stop();
                  ^
   kernel/torture.c:889:36: note: Value assigned to 'disable_onoff_at_boot', which participates in a condition later
           return torture_must_stop_irq() || kthread_should_stop();
                                             ^~~~~~~~~~~~~~~~~~~~~
   kernel/torture.c:356:10: note: Returning from 'torture_must_stop'
           while (!torture_must_stop()) {
                   ^~~~~~~~~~~~~~~~~~~
   kernel/torture.c:356:9: note: Assuming the condition is true
           while (!torture_must_stop()) {
                  ^~~~~~~~~~~~~~~~~~~~
   kernel/torture.c:356:2: note: Loop condition is true.  Entering loop body
           while (!torture_must_stop()) {
           ^
   kernel/torture.c:357:7: note: Assuming 'disable_onoff_at_boot' is false
                   if (disable_onoff_at_boot && !rcu_inkernel_boot_has_ended()) {
                       ^~~~~~~~~~~~~~~~~~~~~
   kernel/torture.c:357:29: note: Left side of '&&' is false
                   if (disable_onoff_at_boot && !rcu_inkernel_boot_has_ended()) {
                                             ^
   kernel/torture.c:361:38: note: Division by zero
                   cpu = (torture_random(&rand) >> 4) % (maxcpu + 1);
                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/media/radio/si4713/si4713.c:1196:5: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret = 0;
                                   ^     ~
   drivers/media/radio/si4713/si4713.c:1196:5: note: Value stored to 'ret' is never read
                                   ret = 0;
                                   ^     ~
   drivers/media/radio/si4713/si4713.c:1362:19: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   sdev->frequency = freq;
                                   ^ ~~~~
   drivers/media/radio/si4713/si4713.c:1351:6: note: Assuming field 'tuner' is 0
           if (f->tuner)
               ^~~~~~~~
   drivers/media/radio/si4713/si4713.c:1351:2: note: Taking false branch
           if (f->tuner)
           ^
   drivers/media/radio/si4713/si4713.c:1354:6: note: Assuming field 'power_state' is not equal to 0
           if (sdev->power_state) {
               ^~~~~~~~~~~~~~~~~
   drivers/media/radio/si4713/si4713.c:1354:2: note: Taking true branch
           if (sdev->power_state) {
           ^
   drivers/media/radio/si4713/si4713.c:1355:3: note: 'freq' declared without an initial value
                   u16 freq;
                   ^~~~~~~~
   drivers/media/radio/si4713/si4713.c:1358:10: note: Calling 'si4713_tx_tune_status'
                   rval = si4713_tx_tune_status(sdev, 0x00, &freq, &p, &a, &n);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/radio/si4713/si4713.c:698:6: note: Assuming 'err' is not equal to 0
           if (!err) {
               ^~~~
   drivers/media/radio/si4713/si4713.c:698:2: note: Taking false branch
           if (!err) {
           ^
   drivers/media/radio/si4713/si4713.c:711:2: note: Returning without writing to '*frequency'
           return err;
           ^
   drivers/media/radio/si4713/si4713.c:1358:10: note: Returning from 'si4713_tx_tune_status'
                   rval = si4713_tx_tune_status(sdev, 0x00, &freq, &p, &a, &n);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/radio/si4713/si4713.c:1359:7: note: Assuming 'rval' is >= 0
                   if (rval < 0)
                       ^~~~~~~~
   drivers/media/radio/si4713/si4713.c:1359:3: note: Taking false branch
                   if (rval < 0)
                   ^
   drivers/media/radio/si4713/si4713.c:1362:19: note: Assigned value is garbage or undefined
                   sdev->frequency = freq;
                                   ^ ~~~~
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
   24 warnings generated.
   Suppressed 24 warnings (11 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
>> drivers/gpu/drm/bridge/samsung-dsim.c:621:3: warning: Value stored to 'esc_clk' is never read [clang-analyzer-deadcode.DeadStores]
                   esc_clk = byte_clk / esc_div;
                   ^         ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/samsung-dsim.c:621:3: note: Value stored to 'esc_clk' is never read
                   esc_clk = byte_clk / esc_div;
                   ^         ~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/samsung-dsim.c:1011:4: warning: Value stored to 'length' is never read [clang-analyzer-deadcode.DeadStores]
                           length = xfer->rx_len;
                           ^        ~~~~~~~~~~~~
   drivers/gpu/drm/bridge/samsung-dsim.c:1011:4: note: Value stored to 'length' is never read
                           length = xfer->rx_len;
                           ^        ~~~~~~~~~~~~
   Suppressed 24 warnings (10 in non-user code, 14 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
   drivers/gpu/drm/bridge/sil-sii8620.c:304:6: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           if (msg->send)
               ^~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:282:6: note: Assuming field 'error' is 0
           if (ctx->error)
               ^~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:282:2: note: Taking false branch
           if (ctx->error)
           ^
   drivers/gpu/drm/bridge/sil-sii8620.c:284:6: note: Assuming field 'mt_state' is not equal to MT_STATE_BUSY
           if (ctx->mt_state == MT_STATE_BUSY || list_empty(&ctx->mt_queue))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:284:6: note: Left side of '||' is false
   drivers/gpu/drm/bridge/sil-sii8620.c:284:40: note: Assuming the condition is false
           if (ctx->mt_state == MT_STATE_BUSY || list_empty(&ctx->mt_queue))
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:284:2: note: Taking false branch
           if (ctx->mt_state == MT_STATE_BUSY || list_empty(&ctx->mt_queue))
           ^
   drivers/gpu/drm/bridge/sil-sii8620.c:287:6: note: Assuming field 'mt_state' is equal to MT_STATE_DONE
           if (ctx->mt_state == MT_STATE_DONE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:287:2: note: Taking true branch
           if (ctx->mt_state == MT_STATE_DONE) {
           ^
   drivers/gpu/drm/bridge/sil-sii8620.c:292:7: note: Assuming field 'recv' is null
                   if (msg->recv)
                       ^~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:292:3: note: Taking false branch
                   if (msg->recv)
                   ^
   drivers/gpu/drm/bridge/sil-sii8620.c:294:7: note: Assuming field 'continuation' is null
                   if (msg->continuation)
                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:294:3: note: Taking false branch
                   if (msg->continuation)
                   ^
   drivers/gpu/drm/bridge/sil-sii8620.c:296:3: note: Memory is released
                   kfree(msg);
                   ^~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:299:11: note: Field 'mt_state' is equal to MT_STATE_READY
           if (ctx->mt_state != MT_STATE_READY || list_empty(&ctx->mt_queue))
                    ^
   drivers/gpu/drm/bridge/sil-sii8620.c:299:6: note: Left side of '||' is false
           if (ctx->mt_state != MT_STATE_READY || list_empty(&ctx->mt_queue))
               ^
   drivers/gpu/drm/bridge/sil-sii8620.c:299:41: note: Assuming the condition is false
           if (ctx->mt_state != MT_STATE_READY || list_empty(&ctx->mt_queue))
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:299:2: note: Taking false branch
           if (ctx->mt_state != MT_STATE_READY || list_empty(&ctx->mt_queue))
           ^
   drivers/gpu/drm/bridge/sil-sii8620.c:304:6: note: Use of memory after it is freed
           if (msg->send)
               ^~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:1759:7: warning: Value stored to 'pressed' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           bool pressed = !(scancode & MHL_RCP_KEY_RELEASED_MASK);
                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:1759:7: note: Value stored to 'pressed' during its initialization is never read
           bool pressed = !(scancode & MHL_RCP_KEY_RELEASED_MASK);
                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:1761:2: warning: Value stored to 'scancode' is never read [clang-analyzer-deadcode.DeadStores]
           scancode &= MHL_RCP_KEY_ID_MASK;
           ^
   drivers/gpu/drm/bridge/sil-sii8620.c:1761:2: note: Value stored to 'scancode' is never read
   drivers/gpu/drm/bridge/sil-sii8620.c:2007:39: warning: The left operand of '>>' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1 & (addr[nr / BITS_PER_BYTE] >> (nr % BITS_PER_BYTE));
                                                ^
   drivers/gpu/drm/bridge/sil-sii8620.c:2033:2: note: Calling 'sii8620_read_buf'
           sii8620_read_buf(ctx, REG_FAST_INTR_STAT, stats, ARRAY_SIZE(stats));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:166:6: note: Assuming field 'error' is not equal to 0
           if (ctx->error)
               ^~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:166:2: note: Taking true branch
           if (ctx->error)
           ^
   drivers/gpu/drm/bridge/sil-sii8620.c:2033:2: note: Returning from 'sii8620_read_buf'
           sii8620_read_buf(ctx, REG_FAST_INTR_STAT, stats, ARRAY_SIZE(stats));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:2034:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < ARRAY_SIZE(irq_vec); ++i)
           ^
   drivers/gpu/drm/bridge/sil-sii8620.c:2035:7: note: Calling 'sii8620_test_bit'
                   if (sii8620_test_bit(irq_vec[i].bit, stats))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:2007:39: note: The left operand of '>>' is a garbage value
           return 1 & (addr[nr / BITS_PER_BYTE] >> (nr % BITS_PER_BYTE));
                       ~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/bridge/sil-sii8620.c:2217:18: warning: Value stored to 'ctx' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct sii8620 *ctx = bridge_to_sii8620(bridge);
                           ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/esc_clk +621 drivers/gpu/drm/bridge/samsung-dsim.c

15717e725a0c35 Jagan Teki 2023-03-08  602  
15717e725a0c35 Jagan Teki 2023-03-08  603  static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
15717e725a0c35 Jagan Teki 2023-03-08  604  {
15717e725a0c35 Jagan Teki 2023-03-08  605  	unsigned long hs_clk, byte_clk, esc_clk;
15717e725a0c35 Jagan Teki 2023-03-08  606  	unsigned long esc_div;
15717e725a0c35 Jagan Teki 2023-03-08  607  	u32 reg;
15717e725a0c35 Jagan Teki 2023-03-08  608  
15717e725a0c35 Jagan Teki 2023-03-08  609  	hs_clk = samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
15717e725a0c35 Jagan Teki 2023-03-08  610  	if (!hs_clk) {
15717e725a0c35 Jagan Teki 2023-03-08  611  		dev_err(dsi->dev, "failed to configure DSI PLL\n");
15717e725a0c35 Jagan Teki 2023-03-08  612  		return -EFAULT;
15717e725a0c35 Jagan Teki 2023-03-08  613  	}
15717e725a0c35 Jagan Teki 2023-03-08  614  
15717e725a0c35 Jagan Teki 2023-03-08  615  	byte_clk = hs_clk / 8;
15717e725a0c35 Jagan Teki 2023-03-08  616  	esc_div = DIV_ROUND_UP(byte_clk, dsi->esc_clk_rate);
15717e725a0c35 Jagan Teki 2023-03-08  617  	esc_clk = byte_clk / esc_div;
15717e725a0c35 Jagan Teki 2023-03-08  618  
15717e725a0c35 Jagan Teki 2023-03-08  619  	if (esc_clk > 20 * MHZ) {
15717e725a0c35 Jagan Teki 2023-03-08  620  		++esc_div;
15717e725a0c35 Jagan Teki 2023-03-08 @621  		esc_clk = byte_clk / esc_div;
15717e725a0c35 Jagan Teki 2023-03-08  622  	}
15717e725a0c35 Jagan Teki 2023-03-08  623  
15717e725a0c35 Jagan Teki 2023-03-08  624  	dev_dbg(dsi->dev, "hs_clk = %lu, byte_clk = %lu, esc_clk = %lu\n",
15717e725a0c35 Jagan Teki 2023-03-08  625  		hs_clk, byte_clk, esc_clk);
15717e725a0c35 Jagan Teki 2023-03-08  626  
15717e725a0c35 Jagan Teki 2023-03-08  627  	reg = samsung_dsim_read(dsi, DSIM_CLKCTRL_REG);
15717e725a0c35 Jagan Teki 2023-03-08  628  	reg &= ~(DSIM_ESC_PRESCALER_MASK | DSIM_LANE_ESC_CLK_EN_CLK
15717e725a0c35 Jagan Teki 2023-03-08  629  			| DSIM_LANE_ESC_CLK_EN_DATA_MASK | DSIM_PLL_BYPASS
15717e725a0c35 Jagan Teki 2023-03-08  630  			| DSIM_BYTE_CLK_SRC_MASK);
15717e725a0c35 Jagan Teki 2023-03-08  631  	reg |= DSIM_ESC_CLKEN | DSIM_BYTE_CLKEN
15717e725a0c35 Jagan Teki 2023-03-08  632  			| DSIM_ESC_PRESCALER(esc_div)
15717e725a0c35 Jagan Teki 2023-03-08  633  			| DSIM_LANE_ESC_CLK_EN_CLK
15717e725a0c35 Jagan Teki 2023-03-08  634  			| DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1)
15717e725a0c35 Jagan Teki 2023-03-08  635  			| DSIM_BYTE_CLK_SRC(0)
15717e725a0c35 Jagan Teki 2023-03-08  636  			| DSIM_TX_REQUEST_HSCLK;
15717e725a0c35 Jagan Teki 2023-03-08  637  	samsung_dsim_write(dsi, DSIM_CLKCTRL_REG, reg);
15717e725a0c35 Jagan Teki 2023-03-08  638  
15717e725a0c35 Jagan Teki 2023-03-08  639  	return 0;
15717e725a0c35 Jagan Teki 2023-03-08  640  }
15717e725a0c35 Jagan Teki 2023-03-08  641  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
