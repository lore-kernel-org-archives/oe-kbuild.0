Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D256929AC
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Jan 2023 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674311258; x=1705847258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YkT2P5tk/i/AdQbnyDMha0uWkqnfuy9Qd18BJto0a5U=;
  b=VXCjINaxVhiahFmo2ZXRcnqr7qXIN9ZThaJSasMM8cxbeg2gmDi+EEAY
   PaUnnRf9xiHlJhfrU0Pna6qezq8N0Pz47X+1vOlQ7JzzjRfyUAqMnX/9g
   uHLY00Fon4ivMX2QAZbPksAoK+BvlLS3yTMWn58wI+7XBht/PdaMEJ8ng
   2pbSWyXEIcFYdSKcmLx5fqLop0VlexXU6K3KF6/ja+u1XPSd/UnWOgYQ1
   jetbuwOnkK0XHYW2qYw/hg3ksVXAe3zCnODfCHG2ySY2nd30P+VPpeRmX
   to6okWKVb3XvbXdfHAi+kyJopxv+FB4dOULrDLizdBRwgGgZ4GPRB4L8W
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="309363213"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="309363213"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 06:27:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="662851481"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="662851481"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jan 2023 06:27:26 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJEq5-0004A4-0P;
	Sat, 21 Jan 2023 14:27:25 +0000
Date: Sat, 21 Jan 2023 22:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:164:2: warning:
 Called function pointer is null (null dereference)
 [clang-analyzer-core.CallAndMessage]
Message-ID: <202301212236.KDtLdi5N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:164:2: warning: Called function pointer is null (null dereference) [clang-analyzer-core.CallAndMessage]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Li Zhengyu <lizhengyu3@huawei.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

Hi Li,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f883675bf6522b52cd75dc3de791680375961769
commit: a927444aa953f757eaea5bb3615916fba6db58bf RISCV: kexec: Fix build error without CONFIG_MODULES
date:   6 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20230118 (https://download.01.org/0day-ci/archive/20230121/202301212236.KDtLdi5N-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a927444aa953f757eaea5bb3615916fba6db58bf
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a927444aa953f757eaea5bb3615916fba6db58bf
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                                            ^
   include/linux/math.h:37:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:40: note: expanded from macro '__KERNEL_DIV_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                          ^
   drivers/mtd/nand/ecc-sw-bch.c:222:6: note: Assuming field 'strength' is 0
           if (!conf->strength)
               ^~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-sw-bch.c:222:2: note: Taking true branch
           if (!conf->strength)
           ^
   drivers/mtd/nand/ecc-sw-bch.c:223:38: note: Calling 'fls'
                   conf->strength = (code_size * 8) / fls(8 * conf->step_size);
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:17:7: note: 'x' is 0
           if (!x)
                ^
   include/asm-generic/bitops/fls.h:17:2: note: Taking true branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:18:3: note: Returning zero
                   return 0;
                   ^~~~~~~~
   drivers/mtd/nand/ecc-sw-bch.c:223:38: note: Returning from 'fls'
                   conf->strength = (code_size * 8) / fls(8 * conf->step_size);
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-sw-bch.c:223:36: note: Division by zero
                   conf->strength = (code_size * 8) / fls(8 * conf->step_size);
                                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/spi/spi-intel.c:1247:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(chip.modalias, 8, "spi-nor");
           ^~~~~~~~
   drivers/spi/spi-intel.c:1247:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(chip.modalias, 8, "spi-nor");
           ^~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/spi/spi-meson-spicc.c:545:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "%s#pow2_fixed_div", dev_name(dev));
           ^~~~~~~~
   drivers/spi/spi-meson-spicc.c:545:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "%s#pow2_fixed_div", dev_name(dev));
           ^~~~~~~~
   drivers/spi/spi-meson-spicc.c:567:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "%s#pow2_div", dev_name(dev));
           ^~~~~~~~
   drivers/spi/spi-meson-spicc.c:567:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "%s#pow2_div", dev_name(dev));
           ^~~~~~~~
   drivers/spi/spi-meson-spicc.c:595:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "%s#enh_fixed_div", dev_name(dev));
           ^~~~~~~~
   drivers/spi/spi-meson-spicc.c:595:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "%s#enh_fixed_div", dev_name(dev));
           ^~~~~~~~
   drivers/spi/spi-meson-spicc.c:617:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "%s#enh_div", dev_name(dev));
           ^~~~~~~~
   drivers/spi/spi-meson-spicc.c:617:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "%s#enh_div", dev_name(dev));
           ^~~~~~~~
   drivers/spi/spi-meson-spicc.c:637:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "%s#sel", dev_name(dev));
           ^~~~~~~~
   drivers/spi/spi-meson-spicc.c:637:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "%s#sel", dev_name(dev));
           ^~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:164:2: warning: Called function pointer is null (null dereference) [clang-analyzer-core.CallAndMessage]
           dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg, irq_idx);
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:178:6: note: Assuming 'intr' is non-null
           if (!intr)
               ^~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:178:2: note: Taking false branch
           if (!intr)
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:181:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&intr->irq_lock, irq_flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:181:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&intr->irq_lock, irq_flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_irqsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:182:2: note: Loop condition is true.  Entering loop body
           for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:183:7: note: Assuming the condition is false
                   if (!test_bit(reg_idx, &intr->irq_mask))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:183:3: note: Taking false branch
                   if (!test_bit(reg_idx, &intr->irq_mask))
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:193:7: note: Assuming 'irq_status' is not equal to 0
                   if (irq_status)
                       ^~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:193:3: note: Taking true branch
                   if (irq_status)
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:194:4: note: Value assigned to field 'cb'
                           DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
                           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:326:36: note: expanded from macro 'DPU_REG_WRITE'
   #define DPU_REG_WRITE(c, off, val) dpu_reg_write(c, off, val, #off)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:200:7: note: Assuming 'irq_status' is not equal to 0
                   if (!irq_status)
                       ^~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:200:3: note: Taking false branch
                   if (!irq_status)
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:206:3: note: Loop condition is true.  Entering loop body
                   while ((bit = ffs(irq_status)) != 0) {
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:209:4: note: Calling 'dpu_core_irq_callback_handler'
                           dpu_core_irq_callback_handler(dpu_kms, irq_idx);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:154:2: note: Taking false branch
           VERB("irq_idx=%d\n", irq_idx);
           ^
   drivers/gpu/drm/msm/msm_drv.h:478:24: note: expanded from macro 'VERB'
   #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
                          ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:156:6: note: Assuming field 'cb' is null
           if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:156:2: note: Taking true branch
           if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:164:2: note: Called function pointer is null (null dereference)
           dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg, irq_idx);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/tty/serial/lpc32xx_hs.c:237:3: warning: Value stored to 'hsu_rate' is never read [clang-analyzer-deadcode.DeadStores]
                   hsu_rate = 0xFF;
                   ^          ~~~~
   drivers/tty/serial/lpc32xx_hs.c:237:3: note: Value stored to 'hsu_rate' is never read
                   hsu_rate = 0xFF;
                   ^          ~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/tty/serial/sh-sci.c:1100:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", sci->rx_trigger);
                  ^~~~~~~
   drivers/tty/serial/sh-sci.c:1100:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", sci->rx_trigger);
                  ^~~~~~~
   drivers/tty/serial/sh-sci.c:1138:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", v);
                  ^~~~~~~
   drivers/tty/serial/sh-sci.c:1138:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", v);
                  ^~~~~~~
   drivers/tty/serial/sh-sci.c:2218:2: warning: The result of the left shift is undefined due to shifting by '4294967295', which is greater or equal to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           for_each_sr(sr, s) {
--
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/iio/adc/ingenic-adc.c:658:3: warning: 3rd function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   ingenic_adc_set_config(adc, JZ_ADC_REG_CFG_AUX_MD, cmd);
                   ^
   drivers/iio/adc/ingenic-adc.c:692:2: note: Control jumps to 'case IIO_CHAN_INFO_RAW:'  at line 693
           switch (m) {
           ^
   drivers/iio/adc/ingenic-adc.c:694:10: note: Calling 'ingenic_adc_read_chan_info_raw'
                   return ingenic_adc_read_chan_info_raw(iio_dev, chan, val);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ingenic-adc.c:633:6: note: 'cmd' declared without an initial value
           int cmd, ret, engine = (chan->channel == INGENIC_ADC_BATTERY);
               ^~~
   drivers/iio/adc/ingenic-adc.c:633:26: note: Assuming field 'channel' is not equal to INGENIC_ADC_BATTERY
           int cmd, ret, engine = (chan->channel == INGENIC_ADC_BATTERY);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ingenic-adc.c:637:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/iio/adc/ingenic-adc.c:637:2: note: Taking false branch
           if (ret) {
           ^
   drivers/iio/adc/ingenic-adc.c:645:6: note: Assuming field 'has_aux_md' is not equal to 0
           if (adc->soc_data->has_aux_md && engine == 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ingenic-adc.c:645:6: note: Left side of '&&' is true
   drivers/iio/adc/ingenic-adc.c:645:35: note: 'engine' is equal to 0
           if (adc->soc_data->has_aux_md && engine == 0) {
                                            ^~~~~~
   drivers/iio/adc/ingenic-adc.c:645:2: note: Taking true branch
           if (adc->soc_data->has_aux_md && engine == 0) {
           ^
   drivers/iio/adc/ingenic-adc.c:646:3: note: 'Default' branch taken. Execution continues on line 658
                   switch (chan->channel) {
                   ^
   drivers/iio/adc/ingenic-adc.c:658:3: note: 3rd function call argument is an uninitialized value
                   ingenic_adc_set_config(adc, JZ_ADC_REG_CFG_AUX_MD, cmd);
                   ^                                                  ~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/devfreq/devfreq-event.c:447:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", edev->desc->name);
                  ^~~~~~~
   drivers/devfreq/devfreq-event.c:447:9: note: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%s\n", edev->desc->name);
                  ^~~~~~~
   drivers/devfreq/devfreq-event.c:459:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", edev->enable_count);
                  ^~~~~~~
   drivers/devfreq/devfreq-event.c:459:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", edev->enable_count);
                  ^~~~~~~
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/clocksource/ingenic-sysost.c:340:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(ost->name, sizeof(ost->name), "OST percpu timer");
           ^~~~~~~~
   drivers/clocksource/ingenic-sysost.c:340:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(ost->name, sizeof(ost->name), "OST percpu timer");
           ^~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/clocksource/timer-goldfish.c:12:8: warning: Excessive padding in 'struct goldfish_timer' (96 padding bytes, where 32 is optimal). Optimal fields order: ced, base, res, cs, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct goldfish_timer {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/clocksource/timer-goldfish.c:12:8: note: Excessive padding in 'struct goldfish_timer' (96 padding bytes, where 32 is optimal). Optimal fields order: ced, base, res, cs, consider reordering the fields or adding explicit padding members
   struct goldfish_timer {
   ~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/of/base.c:1886:2: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(ap->stem, stem, stem_len);
           ^~~~~~~
   drivers/of/base.c:1886:2: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(ap->stem, stem, stem_len);
           ^~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/spi/spi-dw-mmio.c:165:14: warning: Value stored to 'syscon_name' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const char *syscon_name = "microchip,sparx5-cpu-syscon";
                       ^~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-dw-mmio.c:165:14: note: Value stored to 'syscon_name' during its initialization is never read
           const char *syscon_name = "microchip,sparx5-cpu-syscon";
                       ^~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/spi/spi-hisi-kunpeng.c:170:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, 32, "hisi_spi%d", master->bus_num);
           ^~~~~~~~
   drivers/spi/spi-hisi-kunpeng.c:170:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, 32, "hisi_spi%d", master->bus_num);
           ^~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/spi/spi-img-spfi.c:451:23: warning: The result of the left shift is undefined because the right operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
           div = clamp(512 / (1 << get_count_order(div)), 1, 128);
                                ^
   drivers/spi/spi-img-spfi.c:486:6: note: Assuming field 'len' is <= SPFI_TRANSACTION_TSIZE_MASK
           if (xfer->len > SPFI_TRANSACTION_TSIZE_MASK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-img-spfi.c:486:2: note: Taking false branch
           if (xfer->len > SPFI_TRANSACTION_TSIZE_MASK) {
           ^
   drivers/spi/spi-img-spfi.c:493:2: note: Calling 'img_spfi_config'
           img_spfi_config(master, spi, xfer);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-img-spfi.c:451:26: note: Calling 'get_count_order'
           div = clamp(512 / (1 << get_count_order(div)), 1, 128);
                                   ^
   include/linux/minmax.h:89:49: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                                                   ^~~
   include/linux/minmax.h:52:33: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                                         ^
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                              ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:45:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                         ^
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                              ^
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x = (x);               \
                                         ^
   include/linux/bitops.h:161:6: note: Assuming 'count' is equal to 0
           if (count == 0)
               ^~~~~~~~~~
   include/linux/bitops.h:161:2: note: Taking true branch
           if (count == 0)
           ^
   include/linux/bitops.h:162:3: note: Returning the value -1
                   return -1;
                   ^~~~~~~~~
   drivers/spi/spi-img-spfi.c:451:26: note: Returning from 'get_count_order'
--
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:399:3: note: expanded from macro '__printk_index_emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
                   ^
   mm/page_alloc.c:8970:2: note: '?' condition is true
           pr_info("%s hash table entries: %ld (order: %d, %lu bytes, %s)\n",
           ^
   include/linux/printk.h:548:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:475:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:408:12: note: expanded from macro '__printk_index_emit'
                                   .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
                                          ^
   mm/page_alloc.c:8970:2: note: '?' condition is true
           pr_info("%s hash table entries: %ld (order: %d, %lu bytes, %s)\n",
           ^
   include/linux/printk.h:548:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:475:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:412:14: note: expanded from macro '__printk_index_emit'
                                   .level = __builtin_constant_p(_level) ? (_level) : NULL, \
                                            ^
   mm/page_alloc.c:8970:2: note: Loop condition is false.  Exiting loop
           pr_info("%s hash table entries: %ld (order: %d, %lu bytes, %s)\n",
           ^
   include/linux/printk.h:548:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:475:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:398:2: note: expanded from macro '__printk_index_emit'
           do {                                                            \
           ^
   mm/page_alloc.c:8971:30: note: '?' condition is false
                   tablename, 1UL << log2qty, ilog2(size) - PAGE_SHIFT, size,
                                              ^
   mm/page_alloc.c:8971:30: note: '?' condition is false
   mm/page_alloc.c:8972:3: note: 'virt' is false
                   virt ? (huge ? "vmalloc hugepage" : "vmalloc") : "linear");
                   ^
   include/linux/printk.h:548:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:475:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:447:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   mm/page_alloc.c:8972:3: note: '?' condition is false
                   virt ? (huge ? "vmalloc hugepage" : "vmalloc") : "linear");
                   ^
   mm/page_alloc.c:8974:6: note: Assuming '_hash_shift' is null
           if (_hash_shift)
               ^~~~~~~~~~~
   mm/page_alloc.c:8974:2: note: Taking false branch
           if (_hash_shift)
           ^
   mm/page_alloc.c:8976:6: note: Assuming '_hash_mask' is non-null
           if (_hash_mask)
               ^~~~~~~~~~
   mm/page_alloc.c:8976:2: note: Taking true branch
           if (_hash_mask)
           ^
   mm/page_alloc.c:8977:20: note: The result of the left shift is undefined due to shifting by '63', which is greater or equal to the width of type 'int'
                   *_hash_mask = (1 << log2qty) - 1;
                                    ^  ~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:164:2: warning: Called function pointer is null (null dereference) [clang-analyzer-core.CallAndMessage]
           dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg, irq_idx);
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:178:6: note: Assuming 'intr' is non-null
           if (!intr)
               ^~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:178:2: note: Taking false branch
           if (!intr)
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:181:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&intr->irq_lock, irq_flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:181:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&intr->irq_lock, irq_flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_irqsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:182:2: note: Loop condition is true.  Entering loop body
           for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:183:7: note: Assuming the condition is false
                   if (!test_bit(reg_idx, &intr->irq_mask))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:183:3: note: Taking false branch
                   if (!test_bit(reg_idx, &intr->irq_mask))
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:193:7: note: Assuming 'irq_status' is not equal to 0
                   if (irq_status)
                       ^~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:193:3: note: Taking true branch
                   if (irq_status)
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:194:4: note: Value assigned to field 'cb'
                           DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
                           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:326:36: note: expanded from macro 'DPU_REG_WRITE'
   #define DPU_REG_WRITE(c, off, val) dpu_reg_write(c, off, val, #off)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:200:7: note: Assuming 'irq_status' is not equal to 0
                   if (!irq_status)
                       ^~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:200:3: note: Taking false branch
                   if (!irq_status)
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:206:3: note: Loop condition is true.  Entering loop body
                   while ((bit = ffs(irq_status)) != 0) {
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:209:4: note: Calling 'dpu_core_irq_callback_handler'
                           dpu_core_irq_callback_handler(dpu_kms, irq_idx);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:154:2: note: Taking false branch
           VERB("irq_idx=%d\n", irq_idx);
           ^
   drivers/gpu/drm/msm/msm_drv.h:478:24: note: expanded from macro 'VERB'
   #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
                          ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:156:6: note: Assuming field 'cb' is null
           if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:156:2: note: Taking true branch
           if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:164:2: note: Called function pointer is null (null dereference)
           dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg, irq_idx);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/gpu/drm/etnaviv/etnaviv_perfmon.c:514:2: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(domain->name, dom->name, sizeof(domain->name));
           ^~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_perfmon.c:514:2: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(domain->name, dom->name, sizeof(domain->name));
           ^~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_perfmon.c:543:2: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(signal->name, sig->name, sizeof(signal->name));
           ^~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_perfmon.c:543:2: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(signal->name, sig->name, sizeof(signal->name));
           ^~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
--
                  ^                 ~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:745:8: note: Calling 'generic_show'
           ret = generic_show(DPFE_CMD_GET_REFRESH, response, priv, buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:702:6: note: Assuming 'priv' is null, which participates in a condition later
           if (!priv)
               ^~~~~
   drivers/memory/brcmstb_dpfe.c:702:2: note: Taking true branch
           if (!priv)
           ^
   drivers/memory/brcmstb_dpfe.c:703:3: note: Returning value, which participates in a condition later
                   return sprintf(buf, "ERROR: driver private data not set\n");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:745:8: note: Returning from 'generic_show'
           ret = generic_show(DPFE_CMD_GET_REFRESH, response, priv, buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:746:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/memory/brcmstb_dpfe.c:746:2: note: Taking false branch
           if (ret)
           ^
   drivers/memory/brcmstb_dpfe.c:749:9: note: 2nd function call argument is an uninitialized value
           info = get_msg_ptr(priv, response[MSG_ARG0], buf, &ret);
                  ^                 ~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:762:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%#x %#x %#x %#x %#x %#x %#x\n",
                  ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:762:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%#x %#x %#x %#x %#x %#x %#x\n",
                  ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:808:9: warning: 2nd function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           info = get_msg_ptr(priv, response[MSG_ARG0], buf, &ret);
                  ^                 ~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:804:8: note: Calling 'generic_show'
           ret = generic_show(DPFE_CMD_GET_VENDOR, response, priv, buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:702:6: note: Assuming 'priv' is null, which participates in a condition later
           if (!priv)
               ^~~~~
   drivers/memory/brcmstb_dpfe.c:702:2: note: Taking true branch
           if (!priv)
           ^
   drivers/memory/brcmstb_dpfe.c:703:3: note: Returning value, which participates in a condition later
                   return sprintf(buf, "ERROR: driver private data not set\n");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:804:8: note: Returning from 'generic_show'
           ret = generic_show(DPFE_CMD_GET_VENDOR, response, priv, buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:805:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/memory/brcmstb_dpfe.c:805:2: note: Taking false branch
           if (ret)
           ^
   drivers/memory/brcmstb_dpfe.c:808:9: note: 2nd function call argument is an uninitialized value
           info = get_msg_ptr(priv, response[MSG_ARG0], buf, &ret);
                  ^                 ~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:822:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%#x %#x %#x %#x %#x\n", mr5, mr6, mr7, mr8, err);
                  ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:822:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%#x %#x %#x %#x %#x\n", mr5, mr6, mr7, mr8, err);
                  ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:838:31: warning: The left operand of '&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           mr4 = response[MSG_ARG0 + 0] & DRAM_INFO_MR4_MASK;
                 ~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/memory/brcmstb_dpfe.c:834:8: note: Calling 'generic_show'
           ret = generic_show(DPFE_CMD_GET_REFRESH, response, priv, buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:702:6: note: Assuming 'priv' is null, which participates in a condition later
           if (!priv)
               ^~~~~
   drivers/memory/brcmstb_dpfe.c:702:2: note: Taking true branch
           if (!priv)
           ^
   drivers/memory/brcmstb_dpfe.c:703:3: note: Returning value, which participates in a condition later
                   return sprintf(buf, "ERROR: driver private data not set\n");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:834:8: note: Returning from 'generic_show'
           ret = generic_show(DPFE_CMD_GET_REFRESH, response, priv, buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:835:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/memory/brcmstb_dpfe.c:835:2: note: Taking false branch
           if (ret)
           ^
   drivers/memory/brcmstb_dpfe.c:838:31: note: The left operand of '&' is a garbage value
           mr4 = response[MSG_ARG0 + 0] & DRAM_INFO_MR4_MASK;
                 ~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/memory/brcmstb_dpfe.c:845:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%#x %#x %#x %#x %#x %#x\n", mr4, mr5, mr6, mr7,
                  ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:845:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%#x %#x %#x %#x %#x %#x\n", mr4, mr5, mr6, mr7,
                  ^~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/clocksource/timer-goldfish.c:12:8: warning: Excessive padding in 'struct goldfish_timer' (96 padding bytes, where 32 is optimal). Optimal fields order: ced, base, res, cs, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct goldfish_timer {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/clocksource/timer-goldfish.c:12:8: note: Excessive padding in 'struct goldfish_timer' (96 padding bytes, where 32 is optimal). Optimal fields order: ced, base, res, cs, consider reordering the fields or adding explicit padding members
   struct goldfish_timer {
   ~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/of/base.c:1886:2: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(ap->stem, stem, stem_len);
           ^~~~~~~
   drivers/of/base.c:1886:2: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(ap->stem, stem, stem_len);
           ^~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is undefined due to shifting by '64', which is greater or equal to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/iio/buffer/kfifo_buf.c:48:6: note: Assuming field 'update_needed' is not equal to 0
           if (buf->update_needed) {
               ^~~~~~~~~~~~~~~~~~
   drivers/iio/buffer/kfifo_buf.c:48:2: note: Taking true branch
           if (buf->update_needed) {
           ^
   drivers/iio/buffer/kfifo_buf.c:49:3: note: Taking true branch
                   kfifo_free(&buf->kf);
                   ^
   include/linux/kfifo.h:369:2: note: expanded from macro 'kfifo_free'
           if (__is_kfifo_ptr(__tmp)) \
           ^
   drivers/iio/buffer/kfifo_buf.c:50:9: note: Calling '__iio_allocate_kfifo'
                   ret = __iio_allocate_kfifo(buf, buf->buffer.bytes_per_datum,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/buffer/kfifo_buf.c:28:7: note: Assuming 'length' is not equal to 0
           if ((length == 0) || (bytes_per_datum == 0))
                ^~~~~~~~~~~
   drivers/iio/buffer/kfifo_buf.c:28:6: note: Left side of '||' is false
           if ((length == 0) || (bytes_per_datum == 0))
               ^
   drivers/iio/buffer/kfifo_buf.c:28:24: note: Assuming 'bytes_per_datum' is not equal to 0
           if ((length == 0) || (bytes_per_datum == 0))
                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/iio/buffer/kfifo_buf.c:28:2: note: Taking false branch
           if ((length == 0) || (bytes_per_datum == 0))
           ^
   drivers/iio/buffer/kfifo_buf.c:35:6: note: '?' condition is false
           if (roundup_pow_of_two(length) > UINT_MAX / bytes_per_datum)
               ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_two'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/iio/buffer/kfifo_buf.c:35:6: note: Calling '__roundup_pow_of_two'
           if (roundup_pow_of_two(length) > UINT_MAX / bytes_per_datum)
               ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_two'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:154:2: note: Taking false branch
           if (sizeof(l) == 4)
           ^
   include/linux/bitops.h:156:9: note: Calling 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/asm-generic/bitops/fls64.h:29:6: note: Assuming 'x' is not equal to 0
           if (x == 0)
               ^~~~~~
   include/asm-generic/bitops/fls64.h:29:2: note: Taking false branch
           if (x == 0)
           ^
   include/asm-generic/bitops/fls64.h:31:2: note: Returning the value 64
           return __fls(x) + 1;
           ^~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:156:9: note: Returning from 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/linux/bitops.h:156:2: note: Returning the value 64
           return fls64(l);
           ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefined due to shifting by '64', which is greater or equal to the width of type 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +164 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c

667e9985ee24ca Dmitry Baryshkov  2021-05-16  146  
a73033619ea904 Dmitry Baryshkov  2021-06-18  147  /**
a73033619ea904 Dmitry Baryshkov  2021-06-18  148   * dpu_core_irq_callback_handler - dispatch core interrupts
07567d596eb0ad Vinod Koul        2022-02-10  149   * @dpu_kms:		Pointer to DPU's KMS structure
a73033619ea904 Dmitry Baryshkov  2021-06-18  150   * @irq_idx:		interrupt index
a73033619ea904 Dmitry Baryshkov  2021-06-18  151   */
a73033619ea904 Dmitry Baryshkov  2021-06-18  152  static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  153  {
a73033619ea904 Dmitry Baryshkov  2021-06-18  154  	VERB("irq_idx=%d\n", irq_idx);
a73033619ea904 Dmitry Baryshkov  2021-06-18  155  
c929ac60b3ed34 Dmitry Baryshkov  2022-02-17  156  	if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
a73033619ea904 Dmitry Baryshkov  2021-06-18  157  		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
a73033619ea904 Dmitry Baryshkov  2021-06-18  158  
c929ac60b3ed34 Dmitry Baryshkov  2022-02-17  159  	atomic_inc(&dpu_kms->hw_intr->irq_tbl[irq_idx].count);
a73033619ea904 Dmitry Baryshkov  2021-06-18  160  
a73033619ea904 Dmitry Baryshkov  2021-06-18  161  	/*
a73033619ea904 Dmitry Baryshkov  2021-06-18  162  	 * Perform registered function callback
a73033619ea904 Dmitry Baryshkov  2021-06-18  163  	 */
c929ac60b3ed34 Dmitry Baryshkov  2022-02-17 @164  	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg, irq_idx);
a73033619ea904 Dmitry Baryshkov  2021-06-18  165  }
a73033619ea904 Dmitry Baryshkov  2021-06-18  166  

:::::: The code at line 164 was first introduced by commit
:::::: c929ac60b3ed34accd25a052a4833e418900f466 drm/msm/dpu: allow just single IRQ callback

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
