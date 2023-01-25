Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4F81399
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Jan 2023 00:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674605009; x=1706141009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E6j6niAOMdnAqe4LdG3iPaq8+yovcui7ErLm7aala+c=;
  b=AG46RWgCGmRWZytGV4lYRytbMx9kADP3+kVRoi2avScRKQMD91ZLM8Qc
   I47d9+Kde5HAPkLxIRzEGP2BsvTojSGVt0Oh2EEyVxdA9DvKQLTFzMSxb
   vVqdjSgxdapROJIaedTCLSYEDHZFwmf4WbbIgCXRsMCHOUCyEaGVBx7PK
   Ui0D8MdQm4Q77eWWhTmgyfz8MokavaBzknewmSV/DewAbx56BrKKUHsBM
   fYXJDPP69VOt5dQNVSoUNUikz8QfYJGP8eBVr4LiI5i9dsH/ChnoiO/mk
   olmIIXdQXWNYUJqN2vUrRdytKbZ4Kg5gBwWAxa3T2K+T93lFFKeYOk0mZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="327699900"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="327699900"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 16:03:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="655614697"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="655614697"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Jan 2023 16:03:27 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKTGA-0006t5-1w;
	Wed, 25 Jan 2023 00:03:26 +0000
Date: Wed, 25 Jan 2023 08:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clocksource/timer-goldfish.c:12:8: warning: Excessive
 padding in 'struct goldfish_timer' (96 padding bytes, where 32 is optimal).
 Optimal fields order: ced, base, res, cs, consider reordering the fields or
 adding explicit padding members [clang-an...
Message-ID: <202301250740.FHUsJmnq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clocksource/timer-goldfish.c:12:8: warning: Excessive padding in 'struct goldfish_timer' (96 padding bytes, where 32 is optimal). Optimal fields order: ced, base, res, cs, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Laurent Vivier <laurent@vivier.eu>
CC: Geert Uytterhoeven <geert@linux-m68k.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7bf70dbb18820b37406fdfa2aaf14c2f5c71a11a
commit: c92e7ef16400bf035e8b49c7dd091bfce4f99773 clocksource/drivers: Add a goldfish-timer clocksource
date:   10 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-c006-20230118 (https://download.01.org/0day-ci/archive/20230125/202301250740.FHUsJmnq-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c92e7ef16400bf035e8b49c7dd091bfce4f99773
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c92e7ef16400bf035e8b49c7dd091bfce4f99773
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                                 ^
   drivers/iio/adc/at91-sama5d2_adc.c:1343:6: note: Assuming the condition is false
           if (iio_trigger_validate_own_device(indio_dev->trig, indio_dev))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1343:2: note: Taking false branch
           if (iio_trigger_validate_own_device(indio_dev->trig, indio_dev))
           ^
   drivers/iio/adc/at91-sama5d2_adc.c:1346:6: note: Assuming field 'dma_chan' is non-null
           if (st->dma_st.dma_chan)
               ^~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1346:2: note: Taking true branch
           if (st->dma_st.dma_chan)
           ^
   drivers/iio/adc/at91-sama5d2_adc.c:1347:3: note: Calling 'at91_adc_trigger_handler_dma'
                   at91_adc_trigger_handler_dma(indio_dev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1292:15: note: Loop condition is false.  Exiting loop
           u32 status = at91_adc_readl(st, ISR);
                        ^
   drivers/iio/adc/at91-sama5d2_adc.c:387:2: note: expanded from macro 'at91_adc_readl'
           readl_relaxed((st)->base + (st)->soc_info.platform->layout->reg)
           ^
   arch/riscv/include/asm/mmio.h:116:38: note: expanded from macro 'readl_relaxed'
   #define readl_relaxed(c)        ({ u32 __v; __io_rbr(); __v = readl_cpu(c); __io_rar(); __v; })
                                               ^
   arch/riscv/include/asm/mmio.h:109:21: note: expanded from macro '__io_rbr'
   #define __io_rbr()              do {} while (0)
                                   ^
   drivers/iio/adc/at91-sama5d2_adc.c:1292:15: note: Loop condition is false.  Exiting loop
           u32 status = at91_adc_readl(st, ISR);
                        ^
   drivers/iio/adc/at91-sama5d2_adc.c:387:2: note: expanded from macro 'at91_adc_readl'
           readl_relaxed((st)->base + (st)->soc_info.platform->layout->reg)
           ^
   arch/riscv/include/asm/mmio.h:116:70: note: expanded from macro 'readl_relaxed'
   #define readl_relaxed(c)        ({ u32 __v; __io_rbr(); __v = readl_cpu(c); __io_rar(); __v; })
                                                                               ^
   arch/riscv/include/asm/mmio.h:110:21: note: expanded from macro '__io_rar'
   #define __io_rar()              do {} while (0)
                                   ^
   drivers/iio/adc/at91-sama5d2_adc.c:1294:6: note: Assuming the condition is false
           if (status & AT91_SAMA5D2_IER_GOVRE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1294:2: note: Taking false branch
           if (status & AT91_SAMA5D2_IER_GOVRE)
           ^
   drivers/iio/adc/at91-sama5d2_adc.c:1300:17: note: Calling 'div_s64'
           sample_count = div_s64(transferred_len, sample_size);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:141:9: note: Calling 'div_s64_rem'
           return div_s64_rem(dividend, divisor, &remainder);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:43:2: note: Returning zero
           return dividend / divisor;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:141:9: note: Returning from 'div_s64_rem'
           return div_s64_rem(dividend, divisor, &remainder);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:141:2: note: Returning zero
           return div_s64_rem(dividend, divisor, &remainder);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1300:17: note: Returning from 'div_s64'
           sample_count = div_s64(transferred_len, sample_size);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1300:2: note: The value 0 is assigned to 'sample_count'
           sample_count = div_s64(transferred_len, sample_size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1306:47: note: Passing the value 0 via 2nd parameter 'divisor'
           interval = div_s64((ns - st->dma_st.dma_ts), sample_count);
                                                        ^~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1306:13: note: Calling 'div_s64'
           interval = div_s64((ns - st->dma_st.dma_ts), sample_count);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:141:31: note: Passing the value 0 via 2nd parameter 'divisor'
           return div_s64_rem(dividend, divisor, &remainder);
                                        ^~~~~~~
   include/linux/math64.h:141:9: note: Calling 'div_s64_rem'
           return div_s64_rem(dividend, divisor, &remainder);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:42:24: note: Division by zero
           *remainder = dividend % divisor;
                        ~~~~~~~~~^~~~~~~~~
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
   drivers/of/base.c:1886:2: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(ap->stem, stem, stem_len);
           ^~~~~~~
   drivers/of/base.c:1886:2: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(ap->stem, stem, stem_len);
           ^~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   11 warnings generated.
   sound/firewire/digi00x/digi00x.c:34:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(dg00x->card->shortname, model);
           ^~~~~~
   sound/firewire/digi00x/digi00x.c:34:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(dg00x->card->shortname, model);
           ^~~~~~
   sound/firewire/digi00x/digi00x.c:35:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(dg00x->card->mixername, model);
           ^~~~~~
   sound/firewire/digi00x/digi00x.c:35:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(dg00x->card->mixername, model);
           ^~~~~~
   sound/firewire/digi00x/digi00x.c:36:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dg00x->card->longname, sizeof(dg00x->card->longname),
           ^~~~~~~~
   sound/firewire/digi00x/digi00x.c:36:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dg00x->card->longname, sizeof(dg00x->card->longname),
           ^~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/usb/chipidea/otg_fsm.c:42:2: warning: Value stored to 'next' is never read [clang-analyzer-deadcode.DeadStores]
           next += t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:42:2: note: Value stored to 'next' is never read
           next += t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:91:2: warning: Value stored to 'next' is never read [clang-analyzer-deadcode.DeadStores]
           next += t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:91:2: note: Value stored to 'next' is never read
           next += t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:131:2: warning: Value stored to 'next' is never read [clang-analyzer-deadcode.DeadStores]
           next += t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:131:2: note: Value stored to 'next' is never read
           next += t;
           ^       ~
   Suppressed 9 warnings (9 in non-user code).
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   include/linux/list.h:137:13: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/firmware/cirrus/cs_dsp.c:2338:2: note: Loop condition is false. Execution continues on line 2341
           list_for_each_entry(ctl, &dsp->ctl_list, list)
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_entry'
           for (pos = list_first_entry(head, typeof(*pos), member);        \
           ^
   drivers/firmware/cirrus/cs_dsp.c:2341:2: note: Calling 'cs_dsp_free_alg_regions'
           cs_dsp_free_alg_regions(dsp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/cirrus/cs_dsp.c:1616:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&dsp->alg_regions)) {
           ^
   drivers/firmware/cirrus/cs_dsp.c:1621:3: note: Memory is released
                   kfree(alg_region);

vim +12 drivers/clocksource/timer-goldfish.c

c92e7ef16400bf Laurent Vivier 2022-04-06  11  
c92e7ef16400bf Laurent Vivier 2022-04-06 @12  struct goldfish_timer {
c92e7ef16400bf Laurent Vivier 2022-04-06  13  	struct clocksource cs;
c92e7ef16400bf Laurent Vivier 2022-04-06  14  	struct clock_event_device ced;
c92e7ef16400bf Laurent Vivier 2022-04-06  15  	struct resource res;
c92e7ef16400bf Laurent Vivier 2022-04-06  16  	void __iomem *base;
c92e7ef16400bf Laurent Vivier 2022-04-06  17  };
c92e7ef16400bf Laurent Vivier 2022-04-06  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
