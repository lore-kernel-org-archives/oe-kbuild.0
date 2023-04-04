Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD0528F3
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Apr 2023 17:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680629440; x=1712165440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qZjWydydDpK1JpQisBgGK9E9UHg/fH0FrgiLa9uMbdQ=;
  b=mBmL4ZnvxupZrRLfYVrRx538/BqkjdKimzNffslWpFt0mvYzkSUyYBae
   oyI611EY4a3mW+0VO2YxXWbKg+NagGhH3/GIGB+CBvurAzlK+91/fZK6W
   S3BXr4oDDiY6vbaNDFaSwJGn0lVVuIvC+tHcLRks4vVxvTKz0eVFYS6kS
   wV0TKj6MV2Ez60ooGCAAEf2PrZ24xrm5/iRvH9PBsfRIV2PSf+SMC1XhV
   1v63RevYNfvvIcU1jLaER7qS+qwtxIkQNs+xJdC5pqu8mbo16jTIVz9lK
   oUpqSb/Ev9bB9sv7G6UZK1WIc/W2J7YgCM8c7Fd8YHR+w93/hS3LyaQ5+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="342275133"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="342275133"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 10:30:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="663705150"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="663705150"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Apr 2023 10:30:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjkUP-000Pwo-18;
	Tue, 04 Apr 2023 17:30:37 +0000
Date: Wed, 5 Apr 2023 01:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:164:2: warning:
 Called function pointer is null (null dereference)
 [clang-analyzer-core.CallAndMessage]
Message-ID: <202304050111.xkHc8OBv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:164:2: warning: Called function pointer is null (null dereference) [clang-analyzer-core.CallAndMessage]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stephen Boyd <swboyd@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   148341f0a2f53b5e8808d093333d85170586a15d
commit: c929ac60b3ed34accd25a052a4833e418900f466 drm/msm/dpu: allow just single IRQ callback
date:   11 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20230402 (https://download.01.org/0day-ci/archive/20230405/202304050111.xkHc8OBv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c929ac60b3ed34accd25a052a4833e418900f466
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c929ac60b3ed34accd25a052a4833e418900f466
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304050111.xkHc8OBv-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   35 warnings generated.
   drivers/soc/qcom/cmd-db.c:151:2: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(query, id, sizeof(query));
           ^~~~~~~
   drivers/soc/qcom/cmd-db.c:151:2: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(query, id, sizeof(query));
           ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/soc/qcom/rpmh-rsc.c:942:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(drv_id, ARRAY_SIZE(drv_id), "drv-%d", drv->id);
           ^~~~~~~~
   drivers/soc/qcom/rpmh-rsc.c:942:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(drv_id, ARRAY_SIZE(drv_id), "drv-%d", drv->id);
           ^~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/soc/qcom/rpmh.c:209:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(req->cmd, cmd, n * sizeof(*cmd));
           ^~~~~~
   drivers/soc/qcom/rpmh.c:209:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(req->cmd, cmd, n * sizeof(*cmd));
           ^~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/gpio/gpio-tqmx86.c:318:27: warning: Access to field 'domain' results in a dereference of an undefined pointer value (loaded from variable 'girq') [clang-analyzer-core.NullDereference]
           irq_domain_set_pm_device(girq->domain, dev);
                                    ^~~~
   drivers/gpio/gpio-tqmx86.c:234:2: note: 'girq' declared without an initial value
           struct gpio_irq_chip *girq;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-tqmx86.c:240:6: note: Assuming 'irq' is >= 0
           if (irq < 0 && irq != -ENXIO)
               ^~~~~~~
   drivers/gpio/gpio-tqmx86.c:240:14: note: Left side of '&&' is false
           if (irq < 0 && irq != -ENXIO)
                       ^
   drivers/gpio/gpio-tqmx86.c:244:6: note: Assuming 'res' is non-null
           if (!res) {
               ^~~~
   drivers/gpio/gpio-tqmx86.c:244:2: note: Taking false branch
           if (!res) {
           ^
   drivers/gpio/gpio-tqmx86.c:250:6: note: Assuming 'io_base' is non-null
           if (!io_base)
               ^~~~~~~~
   drivers/gpio/gpio-tqmx86.c:250:2: note: Taking false branch
           if (!io_base)
           ^
   drivers/gpio/gpio-tqmx86.c:254:6: note: Assuming 'gpio' is non-null
           if (!gpio)
               ^~~~~
   drivers/gpio/gpio-tqmx86.c:254:2: note: Taking false branch
           if (!gpio)
           ^
   drivers/gpio/gpio-tqmx86.c:257:2: note: Loop condition is false.  Exiting loop
           raw_spin_lock_init(&gpio->spinlock);
           ^
   include/linux/spinlock.h:111:2: note: expanded from macro 'raw_spin_lock_init'
           do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
           ^
   drivers/gpio/gpio-tqmx86.c:279:6: note: Assuming 'irq' is <= 0
           if (irq > 0) {
               ^~~~~~~
   drivers/gpio/gpio-tqmx86.c:279:2: note: Taking false branch
           if (irq > 0) {
           ^
   drivers/gpio/gpio-tqmx86.c:313:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/gpio/gpio-tqmx86.c:313:2: note: Taking false branch
           if (ret) {
           ^
   drivers/gpio/gpio-tqmx86.c:318:27: note: Access to field 'domain' results in a dereference of an undefined pointer value (loaded from variable 'girq')
           irq_domain_set_pm_device(girq->domain, dev);
                                    ^~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   54 warnings generated.
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   55 warnings generated.
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
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:310:36: note: expanded from macro 'DPU_REG_WRITE'
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
   drivers/gpu/drm/msm/msm_drv.h:509:24: note: expanded from macro 'VERB'
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
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   39 warnings generated.
   kernel/trace/trace_event_perf.c:416:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&raw_data[size - sizeof(u64)], 0, sizeof(u64));
           ^~~~~~
   kernel/trace/trace_event_perf.c:416:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&raw_data[size - sizeof(u64)], 0, sizeof(u64));
           ^~~~~~
   kernel/trace/trace_event_perf.c:467:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&regs, 0, sizeof(regs));
           ^~~~~~
   kernel/trace/trace_event_perf.c:467:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&regs, 0, sizeof(regs));
           ^~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/video/fbdev/metronomefb.c:333:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((u8 *) (par->metromem_cmd->args + i), 0, (32-i)*2);
           ^~~~~~
   drivers/video/fbdev/metronomefb.c:333:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset((u8 *) (par->metromem_cmd->args + i), 0, (32-i)*2);
           ^~~~~~
   drivers/video/fbdev/metronomefb.c:357:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&par->metromem_cmd->args[i], 0,
           ^~~~~~
   drivers/video/fbdev/metronomefb.c:357:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&par->metromem_cmd->args[i], 0,

vim +164 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c

667e9985ee24cae Dmitry Baryshkov  2021-05-16  146  
a73033619ea9040 Dmitry Baryshkov  2021-06-18  147  /**
a73033619ea9040 Dmitry Baryshkov  2021-06-18  148   * dpu_core_irq_callback_handler - dispatch core interrupts
07567d596eb0ad0 Vinod Koul        2022-02-10  149   * @dpu_kms:		Pointer to DPU's KMS structure
a73033619ea9040 Dmitry Baryshkov  2021-06-18  150   * @irq_idx:		interrupt index
a73033619ea9040 Dmitry Baryshkov  2021-06-18  151   */
a73033619ea9040 Dmitry Baryshkov  2021-06-18  152  static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  153  {
a73033619ea9040 Dmitry Baryshkov  2021-06-18  154  	VERB("irq_idx=%d\n", irq_idx);
a73033619ea9040 Dmitry Baryshkov  2021-06-18  155  
c929ac60b3ed34a Dmitry Baryshkov  2022-02-17  156  	if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
a73033619ea9040 Dmitry Baryshkov  2021-06-18  157  		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
a73033619ea9040 Dmitry Baryshkov  2021-06-18  158  
c929ac60b3ed34a Dmitry Baryshkov  2022-02-17  159  	atomic_inc(&dpu_kms->hw_intr->irq_tbl[irq_idx].count);
a73033619ea9040 Dmitry Baryshkov  2021-06-18  160  
a73033619ea9040 Dmitry Baryshkov  2021-06-18  161  	/*
a73033619ea9040 Dmitry Baryshkov  2021-06-18  162  	 * Perform registered function callback
a73033619ea9040 Dmitry Baryshkov  2021-06-18  163  	 */
c929ac60b3ed34a Dmitry Baryshkov  2022-02-17 @164  	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg, irq_idx);
a73033619ea9040 Dmitry Baryshkov  2021-06-18  165  }
a73033619ea9040 Dmitry Baryshkov  2021-06-18  166  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
