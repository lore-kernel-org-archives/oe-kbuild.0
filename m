Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402597C
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Apr 2023 01:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680398993; x=1711934993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+g8msl6Oznma0BZ/m5Hqpp+uNfIutgc3Ul1Renvqamg=;
  b=IoR1nORpxjlBk5yb7FS3Arkog7Y8dkLUqq229udyuJnFVaq59JDulyd2
   sUQg4Fbsqeyia6UXzSCmMIrWNc8hUud1YGdLVc9dV1pt5sVcmz+AySkVi
   +9e+drAtVP39C6QKJN/ZvH0JpDj1v55fN0HAPgaoKR4r5jZifybsjJEmA
   NYgwEo/1Z1EZ7y7tk4qd8beJRb/j6k7A2qYqPNNOqp07WoBmT1h46iTeR
   aVwvayjYbYfOwDNnSuGhViUSA1LTHHrzdt2OCGYlQmChbRXaUcBJ0bs40
   BvvtLZfOXtE35oANZnTwNVO6D9ZWI1HrQC2BKp32hKlZwQNGimVnZ13IH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="340420643"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="340420643"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 18:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="635696708"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="635696708"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Apr 2023 18:29:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pimXR-000N9p-0H;
	Sun, 02 Apr 2023 01:29:45 +0000
Date: Sun, 2 Apr 2023 09:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/ufs/host/ufs-qcom.c:1008:3: warning: Value stored to 'err'
 is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202304020904.4pPionkY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/ufs/host/ufs-qcom.c:1008:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Bean Huo <beanhuo@micron.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   00c7b5f4ddc5b346df62b757ec73f9357bb452af
commit: dd11376b9f1b73aca3f8c6eb541486bbb6996f05 scsi: ufs: Split the drivers/scsi/ufs directory
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20230329 (https://download.01.org/0day-ci/archive/20230402/202304020904.4pPionkY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dd11376b9f1b73aca3f8c6eb541486bbb6996f05
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dd11376b9f1b73aca3f8c6eb541486bbb6996f05
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304020904.4pPionkY-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   drivers/iio/dac/ltc2688.c:253:11: note: Assuming the condition is false
                   *code = FIELD_GET(LTC2688_DITHER_RAW_MASK, *code);
                           ^
   include/linux/bitfield.h:128:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: expanded from macro '__BF_FIELD_CHECK'
                   __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:15: note: expanded from macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
           BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/iio/dac/ltc2688.c:253:11: note: Taking false branch
                   *code = FIELD_GET(LTC2688_DITHER_RAW_MASK, *code);
                           ^
   include/linux/bitfield.h:128:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:74:3: note: expanded from macro '__BF_FIELD_CHECK'
                   __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
                   ^
   include/linux/build_bug.h:21:2: note: expanded from macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
           BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:332:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/iio/dac/ltc2688.c:253:11: note: Loop condition is false.  Exiting loop
                   *code = FIELD_GET(LTC2688_DITHER_RAW_MASK, *code);
                           ^
   include/linux/bitfield.h:128:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:74:3: note: expanded from macro '__BF_FIELD_CHECK'
                   __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
                   ^
   include/linux/build_bug.h:21:2: note: expanded from macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
           BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   drivers/iio/dac/ltc2688.c:253:11: note: The left operand of '&' is a garbage value
                   *code = FIELD_GET(LTC2688_DITHER_RAW_MASK, *code);
                           ^
   include/linux/bitfield.h:129:27: note: expanded from macro 'FIELD_GET'
                   (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
                                     ~~~~  ^
   Suppressed 6 warnings (6 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/ufs/host/ufs-qcom.c:1008:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = 0;
                   ^     ~
   drivers/ufs/host/ufs-qcom.c:1008:3: note: Value stored to 'err' is never read
                   err = 0;
                   ^     ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/ufs/host/ufs-exynos.c:843:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(pwr_str, PWR_MODE_STR_LEN, "%s series_%s G_%d L_%d",
                   ^~~~~~~~
   drivers/ufs/host/ufs-exynos.c:843:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(pwr_str, PWR_MODE_STR_LEN, "%s series_%s G_%d L_%d",
                   ^~~~~~~~
   drivers/ufs/host/ufs-exynos.c:847:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(pwr_str, PWR_MODE_STR_LEN, "%s G_%d L_%d",
                   ^~~~~~~~
   drivers/ufs/host/ufs-exynos.c:847:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(pwr_str, PWR_MODE_STR_LEN, "%s G_%d L_%d",
                   ^~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/hid/hid-sony.c:710:9: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%i\n", sc->ds4_bt_poll_interval);
                  ^~~~~~~~
   drivers/hid/hid-sony.c:710:9: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%i\n", sc->ds4_bt_poll_interval);
                  ^~~~~~~~
   drivers/hid/hid-sony.c:747:9: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "0x%04x\n", sc->fw_version);
                  ^~~~~~~~
   drivers/hid/hid-sony.c:747:9: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "0x%04x\n", sc->fw_version);
                  ^~~~~~~~
   drivers/hid/hid-sony.c:759:9: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "0x%04x\n", sc->hw_version);
                  ^~~~~~~~
   drivers/hid/hid-sony.c:759:9: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "0x%04x\n", sc->hw_version);
                  ^~~~~~~~
   drivers/hid/hid-sony.c:1518:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, name_sz, "%s" DS4_TOUCHPAD_SUFFIX, sc->hdev->name);
           ^~~~~~~~
   drivers/hid/hid-sony.c:1518:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, name_sz, "%s" DS4_TOUCHPAD_SUFFIX, sc->hdev->name);
           ^~~~~~~~
   drivers/hid/hid-sony.c:1582:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, name_sz, "%s" SENSOR_SUFFIX, sc->hdev->name);
           ^~~~~~~~
   drivers/hid/hid-sony.c:1582:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, name_sz, "%s" SENSOR_SUFFIX, sc->hdev->name);
           ^~~~~~~~
   drivers/hid/hid-sony.c:2189:4: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(name, name_sz, name_fmt, dev_name(&hdev->dev),
                           ^~~~~~~~
   drivers/hid/hid-sony.c:2189:4: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(name, name_sz, name_fmt, dev_name(&hdev->dev),
                           ^~~~~~~~
   drivers/hid/hid-sony.c:2192:4: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(name, name_sz, name_fmt, dev_name(&hdev->dev), n + 1);
                           ^~~~~~~~
   drivers/hid/hid-sony.c:2192:4: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(name, name_sz, name_fmt, dev_name(&hdev->dev), n + 1);
                           ^~~~~~~~
   drivers/hid/hid-sony.c:2585:8: warning: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret = sscanf(sc->hdev->uniq,
                 ^~~~~~
   drivers/hid/hid-sony.c:2585:8: note: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11
           ret = sscanf(sc->hdev->uniq,
                 ^~~~~~
   drivers/hid/hid-sony.c:2637:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(sc->hdev->uniq, sizeof(sc->hdev->uniq),
                   ^~~~~~~~
   drivers/hid/hid-sony.c:2637:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(sc->hdev->uniq, sizeof(sc->hdev->uniq),
                   ^~~~~~~~
   drivers/hid/hid-sony.c:2667:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(sc->hdev->uniq, sizeof(sc->hdev->uniq),
                   ^~~~~~~~
   drivers/hid/hid-sony.c:2667:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(sc->hdev->uniq, sizeof(sc->hdev->uniq),
                   ^~~~~~~~
   drivers/hid/hid-sony.c:2929:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = 0;
                   ^     ~
   drivers/hid/hid-sony.c:2929:3: note: Value stored to 'ret' is never read
                   ret = 0;
                   ^     ~
   include/linux/hid.h:1056:9: warning: Access to field 'name' results in a dereference of a null pointer (loaded from variable 'input') [clang-analyzer-core.NullDereference]
                                       input->name, c, type);

vim +/err +1008 drivers/ufs/host/ufs-qcom.c

12fd5f250db2ad drivers/scsi/ufs/ufs-qcom.c Evan Green            2019-03-21   961  
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   962  /**
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   963   * ufs_qcom_init - bind phy with controller
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   964   * @hba: host controller instance
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   965   *
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   966   * Binds PHY with controller and powers up PHY enabling clocks
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   967   * and regulators.
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   968   *
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   969   * Returns -EPROBE_DEFER if binding fails, returns negative error
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   970   * on phy power up failure and returns zero on success.
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   971   */
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   972  static int ufs_qcom_init(struct ufs_hba *hba)
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   973  {
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   974  	int err;
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   975  	struct device *dev = hba->dev;
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28   976  	struct platform_device *pdev = to_platform_device(dev);
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   977  	struct ufs_qcom_host *host;
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28   978  	struct resource *res;
96f08cc5943c0f drivers/scsi/ufs/ufs-qcom.c Can Guo               2020-11-25   979  	struct ufs_clk_info *clki;
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   980  
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   981  	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   982  	if (!host) {
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   983  		err = -ENOMEM;
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   984  		dev_err(dev, "%s: no memory for qcom ufs host\n", __func__);
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   985  		goto out;
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   986  	}
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   987  
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28   988  	/* Make a two way bind between the qcom host and the hba */
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   989  	host->hba = hba;
1ce5898af55e23 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28   990  	ufshcd_set_variant(hba, host);
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15   991  
223b17ed76ebec drivers/scsi/ufs/ufs-qcom.c Manivannan Sadhasivam 2022-05-04   992  	/* Setup the optional reset control of HCI */
223b17ed76ebec drivers/scsi/ufs/ufs-qcom.c Manivannan Sadhasivam 2022-05-04   993  	host->core_reset = devm_reset_control_get_optional(hba->dev, "rst");
870b1279c7a034 drivers/scsi/ufs/ufs-qcom.c Can Guo               2019-11-14   994  	if (IS_ERR(host->core_reset)) {
223b17ed76ebec drivers/scsi/ufs/ufs-qcom.c Manivannan Sadhasivam 2022-05-04   995  		err = dev_err_probe(dev, PTR_ERR(host->core_reset),
223b17ed76ebec drivers/scsi/ufs/ufs-qcom.c Manivannan Sadhasivam 2022-05-04   996  				    "Failed to get reset control\n");
223b17ed76ebec drivers/scsi/ufs/ufs-qcom.c Manivannan Sadhasivam 2022-05-04   997  		goto out_variant_clear;
870b1279c7a034 drivers/scsi/ufs/ufs-qcom.c Can Guo               2019-11-14   998  	}
870b1279c7a034 drivers/scsi/ufs/ufs-qcom.c Can Guo               2019-11-14   999  
12fd5f250db2ad drivers/scsi/ufs/ufs-qcom.c Evan Green            2019-03-21  1000  	/* Fire up the reset controller. Failure here is non-fatal. */
12fd5f250db2ad drivers/scsi/ufs/ufs-qcom.c Evan Green            2019-03-21  1001  	host->rcdev.of_node = dev->of_node;
12fd5f250db2ad drivers/scsi/ufs/ufs-qcom.c Evan Green            2019-03-21  1002  	host->rcdev.ops = &ufs_qcom_reset_ops;
12fd5f250db2ad drivers/scsi/ufs/ufs-qcom.c Evan Green            2019-03-21  1003  	host->rcdev.owner = dev->driver->owner;
12fd5f250db2ad drivers/scsi/ufs/ufs-qcom.c Evan Green            2019-03-21  1004  	host->rcdev.nr_resets = 1;
12fd5f250db2ad drivers/scsi/ufs/ufs-qcom.c Evan Green            2019-03-21  1005  	err = devm_reset_controller_register(dev, &host->rcdev);
12fd5f250db2ad drivers/scsi/ufs/ufs-qcom.c Evan Green            2019-03-21  1006  	if (err) {
12fd5f250db2ad drivers/scsi/ufs/ufs-qcom.c Evan Green            2019-03-21  1007  		dev_warn(dev, "Failed to register reset controller\n");
12fd5f250db2ad drivers/scsi/ufs/ufs-qcom.c Evan Green            2019-03-21 @1008  		err = 0;
12fd5f250db2ad drivers/scsi/ufs/ufs-qcom.c Evan Green            2019-03-21  1009  	}
12fd5f250db2ad drivers/scsi/ufs/ufs-qcom.c Evan Green            2019-03-21  1010  
c9ed9a6c56af41 drivers/scsi/ufs/ufs-qcom.c Manivannan Sadhasivam 2022-05-04  1011  	if (!has_acpi_companion(dev)) {
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1012  		host->generic_phy = devm_phy_get(dev, "ufsphy");
c9ed9a6c56af41 drivers/scsi/ufs/ufs-qcom.c Manivannan Sadhasivam 2022-05-04  1013  		if (IS_ERR(host->generic_phy)) {
c9ed9a6c56af41 drivers/scsi/ufs/ufs-qcom.c Manivannan Sadhasivam 2022-05-04  1014  			err = dev_err_probe(dev, PTR_ERR(host->generic_phy), "Failed to get PHY\n");
a6854dff635ddd drivers/scsi/ufs/ufs-qcom.c Bjorn Andersson       2016-11-19  1015  			goto out_variant_clear;
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1016  		}
e1a7752ca7b150 drivers/scsi/ufs/ufs-qcom.c Lee Jones             2019-06-17  1017  	}
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1018  
b8416b2fedbf1c drivers/scsi/ufs/ufs-qcom.c Bjorn Andersson       2019-08-28  1019  	host->device_reset = devm_gpiod_get_optional(dev, "reset",
b8416b2fedbf1c drivers/scsi/ufs/ufs-qcom.c Bjorn Andersson       2019-08-28  1020  						     GPIOD_OUT_HIGH);
b8416b2fedbf1c drivers/scsi/ufs/ufs-qcom.c Bjorn Andersson       2019-08-28  1021  	if (IS_ERR(host->device_reset)) {
b8416b2fedbf1c drivers/scsi/ufs/ufs-qcom.c Bjorn Andersson       2019-08-28  1022  		err = PTR_ERR(host->device_reset);
b8416b2fedbf1c drivers/scsi/ufs/ufs-qcom.c Bjorn Andersson       2019-08-28  1023  		if (err != -EPROBE_DEFER)
b8416b2fedbf1c drivers/scsi/ufs/ufs-qcom.c Bjorn Andersson       2019-08-28  1024  			dev_err(dev, "failed to acquire reset gpio: %d\n", err);
b8416b2fedbf1c drivers/scsi/ufs/ufs-qcom.c Bjorn Andersson       2019-08-28  1025  		goto out_variant_clear;
b8416b2fedbf1c drivers/scsi/ufs/ufs-qcom.c Bjorn Andersson       2019-08-28  1026  	}
b8416b2fedbf1c drivers/scsi/ufs/ufs-qcom.c Bjorn Andersson       2019-08-28  1027  
bfdbe8ba21291c drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-03-31  1028  	ufs_qcom_get_controller_revision(hba, &host->hw_ver.major,
bfdbe8ba21291c drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-03-31  1029  		&host->hw_ver.minor, &host->hw_ver.step);
bfdbe8ba21291c drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-03-31  1030  
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1031  	/*
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1032  	 * for newer controllers, device reference clock control bit has
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1033  	 * moved inside UFS controller register address space itself.
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1034  	 */
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1035  	if (host->hw_ver.major >= 0x02) {
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1036  		host->dev_ref_clk_ctrl_mmio = hba->mmio_base + REG_UFS_CFG1;
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1037  		host->dev_ref_clk_en_mask = BIT(26);
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1038  	} else {
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1039  		/* "dev_ref_clk_ctrl_mem" is optional resource */
083dd788e4c12a drivers/scsi/ufs/ufs-qcom.c Eric Biggers          2020-07-10  1040  		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
083dd788e4c12a drivers/scsi/ufs/ufs-qcom.c Eric Biggers          2020-07-10  1041  						   "dev_ref_clk_ctrl_mem");
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1042  		if (res) {
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1043  			host->dev_ref_clk_ctrl_mmio =
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1044  					devm_ioremap_resource(dev, res);
790f9a48abd0e4 drivers/scsi/ufs/ufs-qcom.c Ye Bin                2021-04-09  1045  			if (IS_ERR(host->dev_ref_clk_ctrl_mmio))
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1046  				host->dev_ref_clk_ctrl_mmio = NULL;
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1047  			host->dev_ref_clk_en_mask = BIT(5);
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1048  		}
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1049  	}
f06fcc7155dcbc drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1050  
96f08cc5943c0f drivers/scsi/ufs/ufs-qcom.c Can Guo               2020-11-25  1051  	list_for_each_entry(clki, &hba->clk_list_head, list) {
96f08cc5943c0f drivers/scsi/ufs/ufs-qcom.c Can Guo               2020-11-25  1052  		if (!strcmp(clki->name, "core_clk_unipro"))
96f08cc5943c0f drivers/scsi/ufs/ufs-qcom.c Can Guo               2020-11-25  1053  			clki->keep_link_active = true;
96f08cc5943c0f drivers/scsi/ufs/ufs-qcom.c Can Guo               2020-11-25  1054  	}
96f08cc5943c0f drivers/scsi/ufs/ufs-qcom.c Can Guo               2020-11-25  1055  
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1056  	err = ufs_qcom_init_lane_clks(host);
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1057  	if (err)
052553af6a31b4 drivers/scsi/ufs/ufs-qcom.c Vivek Gautam          2017-10-12  1058  		goto out_variant_clear;
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1059  
cad2e03d860779 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-03-31  1060  	ufs_qcom_set_caps(hba);
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1061  	ufs_qcom_advertise_quirks(hba);
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1062  
df4ec2fa7a4dc2 drivers/scsi/ufs/ufs-qcom.c Eric Biggers          2020-07-10  1063  	err = ufs_qcom_ice_init(host);
df4ec2fa7a4dc2 drivers/scsi/ufs/ufs-qcom.c Eric Biggers          2020-07-10  1064  	if (err)
df4ec2fa7a4dc2 drivers/scsi/ufs/ufs-qcom.c Eric Biggers          2020-07-10  1065  		goto out_variant_clear;
df4ec2fa7a4dc2 drivers/scsi/ufs/ufs-qcom.c Eric Biggers          2020-07-10  1066  
1e879e8fa9f62e drivers/scsi/ufs/ufs-qcom.c Subhash Jadavani      2016-10-06  1067  	ufs_qcom_setup_clocks(hba, true, POST_CHANGE);
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1068  
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1069  	if (hba->dev->id < MAX_UFS_QCOM_HOSTS)
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1070  		ufs_qcom_hosts[hba->dev->id] = host;
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1071  
6e3fd44d7b7638 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1072  	host->dbg_print_en |= UFS_QCOM_DEFAULT_DBG_PRINT_EN;
6e3fd44d7b7638 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1073  	ufs_qcom_get_default_testbus_cfg(host);
6e3fd44d7b7638 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1074  	err = ufs_qcom_testbus_config(host);
6e3fd44d7b7638 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1075  	if (err) {
6e3fd44d7b7638 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1076  		dev_warn(dev, "%s: failed to configure the testbus %d\n",
6e3fd44d7b7638 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1077  				__func__, err);
6e3fd44d7b7638 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1078  		err = 0;
6e3fd44d7b7638 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1079  	}
6e3fd44d7b7638 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1080  
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1081  	goto out;
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1082  
a6854dff635ddd drivers/scsi/ufs/ufs-qcom.c Bjorn Andersson       2016-11-19  1083  out_variant_clear:
1ce5898af55e23 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-10-28  1084  	ufshcd_set_variant(hba, NULL);
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1085  out:
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1086  	return err;
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1087  }
81c0fc51b7a790 drivers/scsi/ufs/ufs-qcom.c Yaniv Gardi           2015-01-15  1088  

:::::: The code at line 1008 was first introduced by commit
:::::: 12fd5f250db2ad6b292d3a28bc3c0011fe30511f scsi: ufs: qcom: Expose the reset controller for PHY

:::::: TO: Evan Green <evgreen@chromium.org>
:::::: CC: Kishon Vijay Abraham I <kishon@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
