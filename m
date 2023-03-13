Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810318C17
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Mar 2023 22:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678745149; x=1710281149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rEk2BO0qsUmRohGqexgvu67r6aKRQJNvrMfV3PoN3ME=;
  b=NcKowTiR2F60z4WyUoJNNT1l5ELu79q3YpeZf95+eg5to3DknZsAbKR5
   xSzUqgrcmtka65Fzzs3ORN5Jv77bXUN1xS1ws9PRYhcAJ18SJuQNji7Dv
   krTuFk2gdt5DeZq75ebvp5rm0j7JvblO7G6c2uEYLCNMEQ9uIP6d+tcUO
   sbXb3KOzsoRc1KERxUwfTB3QHbzxgCHUy7FTD/X5Y5Uhwj6sO51RgBBdJ
   1RicMI/RTcB2bsK4lpWXzNjKHI/rACEzGE8bUp+/iCqvGun5CZmkIYK/J
   E9lmD2kcOrHxb+2lE5hl3efQ0qidln7YSmLTa2jAPpd7h8vRuU977CG99
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="325634851"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="325634851"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 15:05:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789080238"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="789080238"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2023 15:05:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbqIc-0006Ai-2d;
	Mon, 13 Mar 2023 22:05:46 +0000
Date: Tue, 14 Mar 2023 06:05:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clocksource/timer-ti-dm.c:135:18: warning: Division by zero
 [clang-analyzer-core.DivideZero]
Message-ID: <202303140544.n3OwPcAC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clocksource/timer-ti-dm.c:135:18: warning: Division by zero [clang-analyzer-core.DivideZero]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tony Lindgren <tony@atomide.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc89d7fb499b0162e081f434d45e8d1b47e82ece
commit: 41e79b1d458477212d0a880c87622bcaa69ab3ea clocksource/drivers/timer-ti-dm: Move inline functions to driver for am6
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20230312 (https://download.01.org/0day-ci/archive/20230314/202303140544.n3OwPcAC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41e79b1d458477212d0a880c87622bcaa69ab3ea
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 41e79b1d458477212d0a880c87622bcaa69ab3ea
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303140544.n3OwPcAC-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/wireless/mlme.c:578:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(nreg->match, match_data, match_len);
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
   net/wireless/mlme.c:929:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&rdev->radar_chandef, chandef, sizeof(struct cfg80211_chan_def));
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
   net/wireless/mlme.c:929:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&rdev->radar_chandef, chandef, sizeof(struct cfg80211_chan_def));
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
   net/wireless/mlme.c:957:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&rdev->cac_done_chandef, chandef,
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
   net/wireless/mlme.c:957:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&rdev->cac_done_chandef, chandef,
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
   net/wireless/mlme.c:997:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&rdev->cac_done_chandef, chandef, sizeof(*chandef));
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
   net/wireless/mlme.c:997:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&rdev->cac_done_chandef, chandef, sizeof(*chandef));
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
   Suppressed 77 warnings (77 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
>> drivers/clocksource/timer-ti-dm.c:135:18: warning: Division by zero [clang-analyzer-core.DivideZero]
                   udelay(3500000 / rate + 1);
                                  ^
   drivers/clocksource/timer-ti-dm.c:640:2: note: 'rate' initialized to 0
           unsigned long rate = 0;
           ^~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-ti-dm.c:642:15: note: Assuming 'timer' is non-null
           if (unlikely(!timer))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/clocksource/timer-ti-dm.c:642:2: note: Taking false branch
           if (unlikely(!timer))
           ^
   drivers/clocksource/timer-ti-dm.c:645:6: note: Assuming the condition is false
           if (!(timer->capability & OMAP_TIMER_NEEDS_RESET))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-ti-dm.c:645:2: note: Taking false branch
           if (!(timer->capability & OMAP_TIMER_NEEDS_RESET))
           ^
   drivers/clocksource/timer-ti-dm.c:648:45: note: Passing the value 0 via 3rd parameter 'rate'
           __omap_dm_timer_stop(timer, timer->posted, rate);
                                                      ^~~~
   drivers/clocksource/timer-ti-dm.c:648:2: note: Calling '__omap_dm_timer_stop'
           __omap_dm_timer_stop(timer, timer->posted, rate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-ti-dm.c:125:6: note: Assuming the condition is true
           if (l & OMAP_TIMER_CTRL_ST) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-ti-dm.c:125:2: note: Taking true branch
           if (l & OMAP_TIMER_CTRL_ST) {
           ^
   drivers/clocksource/timer-ti-dm.c:135:18: note: Division by zero
                   udelay(3500000 / rate + 1);
                                  ^
   arch/arm/include/asm/delay.h:83:24: note: expanded from macro 'udelay'
           (__builtin_constant_p(n) ?                                      \
                                 ^
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/clocksource/timer-ti-dm-systimer.c:475:3: warning: Value stored to 'l' is never read [clang-analyzer-deadcode.DeadStores]
                   l = readl_relaxed(ctrl);
                   ^
   drivers/clocksource/timer-ti-dm-systimer.c:475:3: note: Value stored to 'l' is never read
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (57 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/uio/uio_aec.c:50:3: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
                   status = ioread8(dev_info->priv + MAILBOX);
                   ^
   drivers/uio/uio_aec.c:50:3: note: Value stored to 'status' is never read
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/i3c/master/mipi-i3c-hci/cmd_v2.c:293:3: warning: Value stored to 'pid' is never read [clang-analyzer-deadcode.DeadStores]
                   pid = (pid << 32) | device_id[0];
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/mipi-i3c-hci/cmd_v2.c:293:3: note: Value stored to 'pid' is never read
                   pid = (pid << 32) | device_id[0];
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/mipi-i3c-hci/cmd_v2.c:294:3: warning: Value stored to 'bcr' is never read [clang-analyzer-deadcode.DeadStores]
                   bcr = FIELD_GET(W1_MASK(55, 48), device_id[1]);
                   ^
   drivers/i3c/master/mipi-i3c-hci/cmd_v2.c:294:3: note: Value stored to 'bcr' is never read
   drivers/i3c/master/mipi-i3c-hci/cmd_v2.c:295:3: warning: Value stored to 'dcr' is never read [clang-analyzer-deadcode.DeadStores]
                   dcr = FIELD_GET(W1_MASK(63, 56), device_id[1]);
                   ^
   drivers/i3c/master/mipi-i3c-hci/cmd_v2.c:295:3: note: Value stored to 'dcr' is never read
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/usb/serial/usb-serial.c:781:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", port->port_number);
                  ^~~~~~~
   drivers/usb/serial/usb-serial.c:781:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11

vim +135 drivers/clocksource/timer-ti-dm.c

41e79b1d458477 Tony Lindgren 2022-04-08  118  
41e79b1d458477 Tony Lindgren 2022-04-08  119  static inline void __omap_dm_timer_stop(struct omap_dm_timer *timer,
41e79b1d458477 Tony Lindgren 2022-04-08  120  					int posted, unsigned long rate)
41e79b1d458477 Tony Lindgren 2022-04-08  121  {
41e79b1d458477 Tony Lindgren 2022-04-08  122  	u32 l;
41e79b1d458477 Tony Lindgren 2022-04-08  123  
41e79b1d458477 Tony Lindgren 2022-04-08  124  	l = __omap_dm_timer_read(timer, OMAP_TIMER_CTRL_REG, posted);
41e79b1d458477 Tony Lindgren 2022-04-08  125  	if (l & OMAP_TIMER_CTRL_ST) {
41e79b1d458477 Tony Lindgren 2022-04-08  126  		l &= ~0x1;
41e79b1d458477 Tony Lindgren 2022-04-08  127  		__omap_dm_timer_write(timer, OMAP_TIMER_CTRL_REG, l, posted);
41e79b1d458477 Tony Lindgren 2022-04-08  128  #ifdef CONFIG_ARCH_OMAP2PLUS
41e79b1d458477 Tony Lindgren 2022-04-08  129  		/* Readback to make sure write has completed */
41e79b1d458477 Tony Lindgren 2022-04-08  130  		__omap_dm_timer_read(timer, OMAP_TIMER_CTRL_REG, posted);
41e79b1d458477 Tony Lindgren 2022-04-08  131  		/*
41e79b1d458477 Tony Lindgren 2022-04-08  132  		 * Wait for functional clock period x 3.5 to make sure that
41e79b1d458477 Tony Lindgren 2022-04-08  133  		 * timer is stopped
41e79b1d458477 Tony Lindgren 2022-04-08  134  		 */
41e79b1d458477 Tony Lindgren 2022-04-08 @135  		udelay(3500000 / rate + 1);
41e79b1d458477 Tony Lindgren 2022-04-08  136  #endif
41e79b1d458477 Tony Lindgren 2022-04-08  137  	}
41e79b1d458477 Tony Lindgren 2022-04-08  138  
41e79b1d458477 Tony Lindgren 2022-04-08  139  	/* Ack possibly pending interrupt */
41e79b1d458477 Tony Lindgren 2022-04-08  140  	writel_relaxed(OMAP_TIMER_INT_OVERFLOW, timer->irq_stat);
41e79b1d458477 Tony Lindgren 2022-04-08  141  }
41e79b1d458477 Tony Lindgren 2022-04-08  142  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
