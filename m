Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758007E
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jan 2023 01:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674351842; x=1705887842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+r8+lRbkxG1cG4fp8cxbpWcwZkF3Y8YzcIQ6E5SAorc=;
  b=llYlDrk+4D4PNdXLNWSW0A2UPnPPRxGoV53Q9iKp9xa9rqMbMhhdydE6
   j3JUdSYKaM+nyiEcUVK+qM0RjV08+vs/HEzLACkYRodVyN3kI4YD9eJml
   7dF3BFT0R5mA5T/8ldfHculo6zMG5M1TXYkxlfSeUFwPnpRF4Qx0YG+H3
   4/tlgl1sN3i3DXYruppYwx4kckMADjrG+QWWB29ej5P7Yc+BqX7PCkdKr
   NIYnhSaJ2Ks/TuAjRtmTrACcg1m1YfpfMk2pDM59aCxGRUBXSMwPlbcW6
   CtidO0inNcdivOHqxWj5pW/ZK5o41DhFLXL42pT8Tzw8dIQ/dg0PMHIG+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="412088668"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="412088668"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 17:44:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="803492906"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="803492906"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jan 2023 17:43:59 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJPOo-0004eK-1G;
	Sun, 22 Jan 2023 01:43:58 +0000
Date: Sun, 22 Jan 2023 09:43:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/dvb-frontends/rtl2832_sdr.c:174:26: warning: Value
 stored to 'pdev' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202301220940.Z3hNQ5eP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/media/dvb-frontends/rtl2832_sdr.c:174:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Heiko Carstens <hca@linux.ibm.com>

Hi Heiko,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f67144022885344375ad03593e7a290cc614da34
commit: 4c25f0ff6336738fcb03216ae103c3c17908304a s390/entry: workaround llvm's IAS limitations
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: s390-randconfig-c005-20230115 (https://download.01.org/0day-ci/archive/20230122/202301220940.Z3hNQ5eP-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 8d9828ef5aa9688500657d36cd2aefbe12bbd162)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4c25f0ff6336738fcb03216ae103c3c17908304a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4c25f0ff6336738fcb03216ae103c3c17908304a
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/media/dvb-frontends/atbm8830.c:16:2: note: expanded from macro 'dprintk'
           do { \
           ^
   drivers/media/dvb-frontends/atbm8830.c:381:2: note: Calling 'atbm8830_read_reg'
           atbm8830_read_reg(priv, REG_AGC_PWM_VAL + 1, &t);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:65:6: note: Assuming 'ret' is not equal to 1
           if (ret != 1) {
               ^~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:65:2: note: Taking true branch
           if (ret != 1) {
           ^
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Assuming 'debug' is 0
                   dprintk("%s: error reg=0x%04x, ret=%i\n", __func__, reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:17:7: note: expanded from macro 'dprintk'
                   if (debug) \
                       ^~~~~
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Taking false branch
                   dprintk("%s: error reg=0x%04x, ret=%i\n", __func__, reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:17:3: note: expanded from macro 'dprintk'
                   if (debug) \
                   ^
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Loop condition is false.  Exiting loop
                   dprintk("%s: error reg=0x%04x, ret=%i\n", __func__, reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:16:2: note: expanded from macro 'dprintk'
           do { \
           ^
   drivers/media/dvb-frontends/atbm8830.c:67:3: note: Returning without writing to '*p_data'
                   return -EIO;
                   ^
   drivers/media/dvb-frontends/atbm8830.c:381:2: note: Returning from 'atbm8830_read_reg'
           atbm8830_read_reg(priv, REG_AGC_PWM_VAL + 1, &t);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:382:10: note: The left operand of '&' is a garbage value
           pwm = t & 0x03;
                 ~ ^
   drivers/media/dvb-frontends/atbm8830.c:476:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&priv->frontend.ops, &atbm8830_ops,
           ^~~~~~
   drivers/media/dvb-frontends/atbm8830.c:476:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&priv->frontend.ops, &atbm8830_ops,
           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   Suppressed 62 warnings (50 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/media/i2c/msp3400-driver.c:314:26: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name = __WAITQUEUE_INITIALIZER(name, tsk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITIALIZER'
           .private        = tsk,                                                  \
                             ^~~
   drivers/media/i2c/msp3400-driver.c:314:26: note: Dereference of null pointer
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name = __WAITQUEUE_INITIALIZER(name, tsk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITIALIZER'
           .private        = tsk,                                                  \
                             ^~~
   drivers/media/i2c/msp3400-driver.c:570:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prefix, sizeof(prefix), "%s: Audio:    ", sd->name);
           ^~~~~~~~
   drivers/media/i2c/msp3400-driver.c:570:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(prefix, sizeof(prefix), "%s: Audio:    ", sd->name);
           ^~~~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   224 warnings generated.
>> drivers/media/dvb-frontends/rtl2832_sdr.c:174:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:174:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:179:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, src, src_len);
                   ^~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:179:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, src, src_len);
                   ^~~~~~
>> drivers/media/dvb-frontends/rtl2832_sdr.c:196:16: warning: Value stored to 'msecs' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   unsigned int msecs = jiffies_to_msecs(jiffies -
                                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:196:16: note: Value stored to 'msecs' during its initialization is never read
                   unsigned int msecs = jiffies_to_msecs(jiffies -
                                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/dvb-frontends/rtl2832_sdr.c:198:16: warning: Value stored to 'samples' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   unsigned int samples = dev->sample - dev->sample_measured;
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:198:16: note: Value stored to 'samples' during its initialization is never read
                   unsigned int samples = dev->sample - dev->sample_measured;
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:268:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:268:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:304:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:304:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:322:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:322:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:352:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:352:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:371:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:371:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:404:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:404:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:425:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:425:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:441:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:441:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:606:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x112, 0x5a);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:606:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x112, 0x5a);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:607:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x102, 0x40);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:607:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x102, 0x40);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:608:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x103, 0x5a);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:608:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x103, 0x5a);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:609:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x1c7, 0x30);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:609:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x1c7, 0x30);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:610:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x104, 0xd0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:610:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x104, 0xd0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:611:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x105, 0xbe);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:611:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x105, 0xbe);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:612:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x1c8, 0x18);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:612:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x1c8, 0x18);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:613:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x106, 0x35);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:613:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x106, 0x35);
--
               ^~~~~
   drivers/usb/typec/rt1719.c:851:2: note: Taking false branch
           if (!data)
           ^
   drivers/usb/typec/rt1719.c:858:2: note: Taking false branch
           if (IS_ERR(data->regmap)) {
           ^
   drivers/usb/typec/rt1719.c:865:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/usb/typec/rt1719.c:865:2: note: Taking false branch
           if (ret)
           ^
   drivers/usb/typec/rt1719.c:869:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/usb/typec/rt1719.c:869:2: note: Taking false branch
           if (ret)
           ^
   drivers/usb/typec/rt1719.c:873:6: note: Assuming 'fwnode' is non-null
           if (!fwnode)
               ^~~~~~~
   drivers/usb/typec/rt1719.c:873:2: note: Taking false branch
           if (!fwnode)
           ^
   drivers/usb/typec/rt1719.c:877:2: note: Taking false branch
           if (IS_ERR(data->role_sw)) {
           ^
   drivers/usb/typec/rt1719.c:884:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/usb/typec/rt1719.c:884:2: note: Taking false branch
           if (ret) {
           ^
   drivers/usb/typec/rt1719.c:901:2: note: Taking false branch
           if (IS_ERR(data->port)) {
           ^
   drivers/usb/typec/rt1719.c:907:8: note: Calling 'rt1719_init_attach_state'
           ret = rt1719_init_attach_state(data);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/rt1719.c:658:2: note: 'conn_stat' declared without an initial value
           u16 conn_stat;
           ^~~~~~~~~~~~~
   drivers/usb/typec/rt1719.c:666:9: note: Calling 'rt1719_read16'
           ret |= rt1719_read16(data, RT1719_REG_STATS, &conn_stat);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/rt1719.c:132:6: note: Assuming 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/usb/typec/rt1719.c:132:2: note: Taking true branch
           if (ret)
           ^
   drivers/usb/typec/rt1719.c:133:3: note: Returning without writing to '*val'
                   return ret;
                   ^
   drivers/usb/typec/rt1719.c:666:9: note: Returning from 'rt1719_read16'
           ret |= rt1719_read16(data, RT1719_REG_STATS, &conn_stat);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/rt1719.c:668:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/usb/typec/rt1719.c:668:2: note: Taking false branch
           if (ret)
           ^
   drivers/usb/typec/rt1719.c:672:18: note: Assigned value is garbage or undefined
           data->conn_stat = conn_stat;
                           ^ ~~~~~~~~~
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/mfd/stm32-timers.c:88:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&config, 0, sizeof(config));
           ^~~~~~
   drivers/mfd/stm32-timers.c:88:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&config, 0, sizeof(config));
           ^~~~~~
   drivers/mfd/stm32-timers.c:187:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, ARRAY_SIZE(name), "ch%1d", i + 1);
                   ^~~~~~~~
   drivers/mfd/stm32-timers.c:187:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, ARRAY_SIZE(name), "ch%1d", i + 1);
                   ^~~~~~~~
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/mfd/rave-sp.c:420:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(reply->data, &data[2], reply->length);
                           ^~~~~~
   drivers/mfd/rave-sp.c:420:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(reply->data, &data[2], reply->length);
                           ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
>> drivers/spi/spi-intel.c:198:3: warning: Value stored to 'value' is never read [clang-analyzer-deadcode.DeadStores]
                   value = readl(ispi->sregs + SSFSTS_CTL);
                   ^
   drivers/spi/spi-intel.c:198:3: note: Value stored to 'value' is never read
>> drivers/spi/spi-intel.c:219:3: warning: Value stored to 'limit' is never read [clang-analyzer-deadcode.DeadStores]
                   limit = (value & PR_LIMIT_MASK) >> PR_LIMIT_SHIFT;
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-intel.c:219:3: note: Value stored to 'limit' is never read
                   limit = (value & PR_LIMIT_MASK) >> PR_LIMIT_SHIFT;
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-intel.c:220:3: warning: Value stored to 'base' is never read [clang-analyzer-deadcode.DeadStores]
                   base = value & PR_BASE_MASK;
                   ^      ~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-intel.c:220:3: note: Value stored to 'base' is never read
                   base = value & PR_BASE_MASK;
                   ^      ~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-intel.c:1144:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(part, 0, sizeof(*part));
           ^~~~~~
   drivers/spi/spi-intel.c:1144:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(part, 0, sizeof(*part));
           ^~~~~~
   drivers/spi/spi-intel.c:1197:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&chip, 0, sizeof(chip));
           ^~~~~~
   drivers/spi/spi-intel.c:1197:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&chip, 0, sizeof(chip));
           ^~~~~~
   drivers/spi/spi-intel.c:1198:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(chip.modalias, 8, "spi-nor");
           ^~~~~~~~
   drivers/spi/spi-intel.c:1198:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(chip.modalias, 8, "spi-nor");
           ^~~~~~~~
   Suppressed 55 warnings (42 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/usb/gadget/udc/net2272.c:865:5: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
                                   status = net2272_read_fifo(ep, req);
                                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/net2272.c:865:5: note: Value stored to 'status' is never read
                                   status = net2272_read_fifo(ep, req);
                                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/net2272.c:891:6: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
                                           status = 0;
                                           ^        ~
   drivers/usb/gadget/udc/net2272.c:891:6: note: Value stored to 'status' is never read
                                           status = 0;
                                           ^        ~
   drivers/usb/gadget/udc/net2272.c:1553:8: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   if ((req->req.length % ep->ep.maxpacket != 0) ||
                        ^
   drivers/usb/gadget/udc/net2272.c:1723:6: note: Assuming the condition is true
           if (unlikely(stat & (1 << SETUP_PACKET_INTERRUPT))) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/usb/gadget/udc/net2272.c:1723:2: note: Taking false branch
           if (unlikely(stat & (1 << SETUP_PACKET_INTERRUPT))) {
           ^
   drivers/usb/gadget/udc/net2272.c:1940:13: note: Assuming the condition is true
           } else if (stat & (1 << DMA_DONE_INTERRUPT)) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/net2272.c:1940:9: note: Taking true branch
           } else if (stat & (1 << DMA_DONE_INTERRUPT)) {
                  ^
   drivers/usb/gadget/udc/net2272.c:1944:10: note: Assuming the condition is false
                   num = (net2272_read(dev, DMAREQ) & (1 << DMA_ENDPOINT_SELECT))
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/net2272.c:1944:9: note: '?' condition is false
                   num = (net2272_read(dev, DMAREQ) & (1 << DMA_ENDPOINT_SELECT))
                         ^
   drivers/usb/gadget/udc/net2272.c:1948:3: note: Calling 'net2272_handle_dma'
                   net2272_handle_dma(ep);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/net2272.c:1525:6: note: Assuming the condition is false
           if (!list_empty(&ep->queue))
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/net2272.c:1525:2: note: Taking false branch
           if (!list_empty(&ep->queue))
           ^
   drivers/usb/gadget/udc/net2272.c:1529:3: note: Null pointer value stored to 'req'
                   req = NULL;
                   ^~~~~~~~~~
   drivers/usb/gadget/udc/net2272.c:1531:2: note: Loop condition is false.  Exiting loop
           dev_vdbg(ep->dev->dev, "handle_dma %s req %p\n", ep->ep.name, req);
           ^
   include/linux/dev_printk.h:257:18: note: expanded from macro 'dev_vdbg'
   #define dev_vdbg        dev_dbg
                           ^
   include/linux/dev_printk.h:158:2: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:128:3: note: expanded from macro 'dev_printk'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_subsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/usb/gadget/udc/net2272.c:1548:5: note: Calling 'net2272_ep_read'
                   | net2272_ep_read(ep, EP_IRQENB));
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/net2272.h:537:6: note: Assuming field 'pagesel' is equal to field 'num'
           if (dev->pagesel != ep->num) {
--
                               ^   ~~~~~~~~~~~~~~~~
   drivers/dma/k3dma.c:660:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&c->slave_config, cfg, sizeof(*cfg));
           ^~~~~~
   drivers/dma/k3dma.c:660:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&c->slave_config, cfg, sizeof(*cfg));
           ^~~~~~
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (38 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/media/i2c/mt9m032.c:497:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(fi, 0, sizeof(*fi));
           ^~~~~~
   drivers/media/i2c/mt9m032.c:497:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(fi, 0, sizeof(*fi));
           ^~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/media/i2c/mt9m111.c:630:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client = v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/mt9m111.c:630:21: note: Value stored to 'client' during its initialization is never read
           struct i2c_client *client = v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/media/i2c/cx25840/cx25840-firmware.c:131:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer + 2, ptr, len);
                   ^~~~~~
   drivers/media/i2c/cx25840/cx25840-firmware.c:131:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer + 2, ptr, len);
                   ^~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/media/i2c/cx25840/cx25840-vbi.c:86:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(svbi->service_lines, 0, sizeof(svbi->service_lines));
           ^~~~~~
   drivers/media/i2c/cx25840/cx25840-vbi.c:86:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(svbi->service_lines, 0, sizeof(svbi->service_lines));
           ^~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   67 warnings generated.
   drivers/media/platform/renesas/vsp1/vsp1_histo.c:437:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
           ^~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_histo.c:437:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
           ^~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_histo.c:467:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(meta, 0, sizeof(*meta));
           ^~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_histo.c:467:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(meta, 0, sizeof(*meta));
           ^~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_histo.c:557:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(histo->video.name, sizeof(histo->video.name),
           ^~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_histo.c:557:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(histo->video.name, sizeof(histo->video.name),
           ^~~~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/media/platform/renesas/vsp1/vsp1_uif.c:261:2: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(name, "uif.%u", index + 4);
           ^~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_uif.c:261:2: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(name, "uif.%u", index + 4);
           ^~~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   71 warnings generated.
   drivers/media/platform/renesas/rcar_drif.c:289:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&dma_cfg, 0, sizeof(dma_cfg));
                   ^~~~~~
   drivers/media/platform/renesas/rcar_drif.c:289:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&dma_cfg, 0, sizeof(dma_cfg));
                   ^~~~~~
   drivers/media/platform/renesas/rcar_drif.c:584:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(vb2_plane_vaddr(&fbuf->vb.vb2_buf, 0) +
                   ^~~~~~
   drivers/media/platform/renesas/rcar_drif.c:584:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(vb2_plane_vaddr(&fbuf->vb.vb2_buf, 0) +
                   ^~~~~~
>> drivers/media/platform/renesas/rcar_drif.c:585:31: warning: Access to field 'addr' results in a dereference of an undefined pointer value [clang-analyzer-core.NullDereference]
                          i * sdr->hwbuf_size, buf[i]->addr, sdr->hwbuf_size);
                                               ^~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:535:6: note: Assuming the condition is false
           if (!vb2_is_streaming(&sdr->vb_queue)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:535:2: note: Taking false branch
           if (!vb2_is_streaming(&sdr->vb_queue)) {
           ^
   drivers/media/platform/renesas/rcar_drif.c:543:6: note: Assuming field 'num_cur_ch' is not equal to RCAR_DRIF_MAX_CHANNEL
           if (sdr->num_cur_ch == RCAR_DRIF_MAX_CHANNEL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:543:2: note: Taking false branch
           if (sdr->num_cur_ch == RCAR_DRIF_MAX_CHANNEL) {
           ^
   drivers/media/platform/renesas/rcar_drif.c:565:7: note: Assuming the condition is false
                   if (buf[0]->status & RCAR_DRIF_BUF_OVERFLOW) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:565:3: note: Taking false branch
                   if (buf[0]->status & RCAR_DRIF_BUF_OVERFLOW) {
                   ^
   drivers/media/platform/renesas/rcar_drif.c:576:2: note: Taking false branch
           rdrif_dbg(sdr, "ch%u: prod %u\n", ch->num, produced);
           ^
   drivers/media/platform/renesas/rcar_drif.c:139:2: note: expanded from macro 'rdrif_dbg'
           dev_dbg(sdr->v4l2_dev.dev, fmt, ## arg)
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/platform/renesas/rcar_drif.c:579:9: note: Calling 'rcar_drif_get_fbuf'
           fbuf = rcar_drif_get_fbuf(sdr);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:465:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&sdr->queued_bufs_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   drivers/media/platform/renesas/rcar_drif.c:465:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&sdr->queued_bufs_lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_irqsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/media/platform/renesas/rcar_drif.c:466:9: note: Left side of '||' is false
           fbuf = list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry_or_null'
           struct list_head *pos__ = READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/media/platform/renesas/rcar_drif.c:466:9: note: Left side of '||' is false
           fbuf = list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry_or_null'
           struct list_head *pos__ = READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/media/platform/renesas/rcar_drif.c:466:9: note: Left side of '||' is false
           fbuf = list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry_or_null'
           struct list_head *pos__ = READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/media/platform/renesas/rcar_drif.c:466:9: note: Left side of '||' is true
           fbuf = list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry_or_null'
           struct list_head *pos__ = READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
--
   47 warnings generated.
   drivers/power/supply/bq27xxx_battery_i2c.c:124:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buf[1], data, len);
           ^~~~~~
   drivers/power/supply/bq27xxx_battery_i2c.c:124:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&buf[1], data, len);
           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/power/supply/max1721x_battery.c:259:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(str, 13, "%04X%04X%04X", val[0], val[1], val[2]);
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:259:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(str, 13, "%04X%04X%04X", val[0], val[1], val[2]);
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:341:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(info->name, sizeof(info->name),
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:341:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(info->name, sizeof(info->name),
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:387:3: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(info->ManufacturerName, DEF_MFG_NAME,
                   ^~~~~~~
   drivers/power/supply/max1721x_battery.c:387:3: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
                   strncpy(info->ManufacturerName, DEF_MFG_NAME,
                   ^~~~~~~
   drivers/power/supply/max1721x_battery.c:406:4: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           strncpy(info->DeviceName, DEF_DEV_NAME_MAX17211,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:406:4: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
                           strncpy(info->DeviceName, DEF_DEV_NAME_MAX17211,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:410:4: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           strncpy(info->DeviceName, DEF_DEV_NAME_MAX17215,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:410:4: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
                           strncpy(info->DeviceName, DEF_DEV_NAME_MAX17215,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:414:4: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           strncpy(info->DeviceName, DEF_DEV_NAME_UNKNOWN,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:414:4: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
                           strncpy(info->DeviceName, DEF_DEV_NAME_UNKNOWN,
                           ^~~~~~~
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/dma/sf-pdma/sf-pdma.c:59:6: warning: Access to field 'desc' results in a dereference of a null pointer (loaded from variable 'chan') [clang-analyzer-core.NullDereference]
           if (chan->desc && !chan->desc->in_use) {
               ^
   drivers/dma/sf-pdma/sf-pdma.c:95:2: note: 'chan' initialized here
           struct sf_pdma_chan *chan = to_sf_pdma_chan(dchan);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:99:6: note: Assuming 'chan' is null
           if (chan && (!len || !dest || !src)) {
               ^~~~
   drivers/dma/sf-pdma/sf-pdma.c:99:11: note: Left side of '&&' is false
           if (chan && (!len || !dest || !src)) {
                    ^
   drivers/dma/sf-pdma/sf-pdma.c:105:28: note: Passing null pointer value via 1st parameter 'chan'
           desc = sf_pdma_alloc_desc(chan);
                                     ^~~~
   drivers/dma/sf-pdma/sf-pdma.c:105:9: note: Calling 'sf_pdma_alloc_desc'
           desc = sf_pdma_alloc_desc(chan);
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:57:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&chan->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   drivers/dma/sf-pdma/sf-pdma.c:57:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&chan->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_irqsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/dma/sf-pdma/sf-pdma.c:59:6: note: Access to field 'desc' results in a dereference of a null pointer (loaded from variable 'chan')
           if (chan->desc && !chan->desc->in_use) {
               ^~~~
   drivers/dma/sf-pdma/sf-pdma.c:126:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&chan->cfg, cfg, sizeof(*cfg));
           ^~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:126:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&chan->cfg, cfg, sizeof(*cfg));
           ^~~~~~
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   67 warnings generated.
>> drivers/media/platform/rockchip/rga/rga.c:73:33: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
                                                 ^~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:61:9: note: Calling 'rga_read'
           intr = rga_read(rga, RGA_INT) & 0xf;
                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.h:102:2: note: Returning without writing to 'rga->curr'
           return readl(rga->regs + reg);
           ^
   drivers/media/platform/rockchip/rga/rga.c:61:9: note: Returning from 'rga_read'
           intr = rga_read(rga, RGA_INT) & 0xf;
                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:63:2: note: Calling 'rga_mod'
           rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.h:107:13: note: Calling 'rga_read'
           u32 temp = rga_read(rga, reg) & ~(mask);
                      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.h:102:2: note: Returning without writing to 'rga->curr'
           return readl(rga->regs + reg);
           ^
   drivers/media/platform/rockchip/rga/rga.h:107:13: note: Returning from 'rga_read'
           u32 temp = rga_read(rga, reg) & ~(mask);
                      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.h:110:2: note: Calling 'rga_write'
           rga_write(rga, reg, temp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.h:98:1: note: Returning without writing to 'rga->curr'
   };
   ^
   drivers/media/platform/rockchip/rga/rga.h:110:2: note: Returning from 'rga_write'
           rga_write(rga, reg, temp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.h:111:1: note: Returning without writing to 'rga->curr'
   };
   ^
   drivers/media/platform/rockchip/rga/rga.c:63:2: note: Returning from 'rga_mod'
           rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:65:6: note: Assuming the condition is true
           if (intr & 0x04) {
               ^~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:65:2: note: Taking true branch
           if (intr & 0x04) {
           ^
   drivers/media/platform/rockchip/rga/rga.c:67:3: note: 'ctx' initialized here
                   struct rga_ctx *ctx = rga->curr;
                   ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:69:11: note: Assuming 'ctx' is null
                   WARN_ON(!ctx);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:73:33: note: Dereference of null pointer
                   src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
                                                 ^~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:79:17: warning: Access to field 'timecode' results in a dereference of a null pointer (loaded from variable 'dst') [clang-analyzer-core.NullDereference]
                   dst->timecode = src->timecode;
                   ~~~           ^
   drivers/media/platform/rockchip/rga/rga.c:65:6: note: Assuming the condition is true
           if (intr & 0x04) {
               ^~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:65:2: note: Taking true branch
           if (intr & 0x04) {
           ^
   drivers/media/platform/rockchip/rga/rga.c:69:11: note: Assuming 'ctx' is non-null
                   WARN_ON(!ctx);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:74:3: note: Value assigned to 'dst'
                   dst = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:76:11: note: Assuming 'src' is non-null
                   WARN_ON(!src);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:77:11: note: Assuming 'dst' is null
                   WARN_ON(!dst);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:79:17: note: Access to field 'timecode' results in a dereference of a null pointer (loaded from variable 'dst')
                   dst->timecode = src->timecode;
                   ~~~           ^
   drivers/media/platform/rockchip/rga/rga.c:79:19: warning: Access to field 'timecode' results in a dereference of a null pointer (loaded from variable 'src') [clang-analyzer-core.NullDereference]
                   dst->timecode = src->timecode;
                                   ^~~
   drivers/media/platform/rockchip/rga/rga.c:65:6: note: Assuming the condition is true
           if (intr & 0x04) {
               ^~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:65:2: note: Taking true branch
           if (intr & 0x04) {
           ^
   drivers/media/platform/rockchip/rga/rga.c:69:11: note: Assuming 'ctx' is non-null
                   WARN_ON(!ctx);
--
                   ^~~~~~
   drivers/media/dvb-core/dvb_demux.c:571:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(demux->tsbuf, q, 188);
                           ^~~~~~
   drivers/media/dvb-core/dvb_demux.c:571:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(demux->tsbuf, q, 188);
                           ^~~~~~
   drivers/media/dvb-core/dvb_demux.c:581:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(demux->tsbuf, &buf[p], i);
                   ^~~~~~
   drivers/media/dvb-core/dvb_demux.c:581:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(demux->tsbuf, &buf[p], i);
                   ^~~~~~
   drivers/media/dvb-core/dvb_demux.c:1158:21: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (signal_pending(current))
                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/media/dvb-core/dvb_demux.c:1144:7: note: Assuming field 'frontend' is non-null
           if ((!demux->frontend) || (demux->frontend->source != DMX_MEMORY_FE))
                ^~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_demux.c:1144:6: note: Left side of '||' is false
           if ((!demux->frontend) || (demux->frontend->source != DMX_MEMORY_FE))
               ^
   drivers/media/dvb-core/dvb_demux.c:1144:29: note: Assuming field 'source' is equal to DMX_MEMORY_FE
           if ((!demux->frontend) || (demux->frontend->source != DMX_MEMORY_FE))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_demux.c:1144:2: note: Taking false branch
           if ((!demux->frontend) || (demux->frontend->source != DMX_MEMORY_FE))
           ^
   drivers/media/dvb-core/dvb_demux.c:1148:2: note: Taking false branch
           if (IS_ERR(p))
           ^
   drivers/media/dvb-core/dvb_demux.c:1150:6: note: Assuming the condition is false
           if (mutex_lock_interruptible(&dvbdemux->mutex)) {
               ^
   include/linux/mutex.h:188:40: note: expanded from macro 'mutex_lock_interruptible'
   #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(lock, 0)
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_demux.c:1150:2: note: Taking false branch
           if (mutex_lock_interruptible(&dvbdemux->mutex)) {
           ^
   drivers/media/dvb-core/dvb_demux.c:1158:21: note: Dereference of null pointer
           if (signal_pending(current))
                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/media/dvb-core/dvb_demux.c:1230:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pids, dvbdemux->pids, 5 * sizeof(u16));
           ^~~~~~
   drivers/media/dvb-core/dvb_demux.c:1230:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(pids, dvbdemux->pids, 5 * sizeof(u16));
           ^~~~~~
   Suppressed 37 warnings (36 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/media/platform/st/sti/bdisp/bdisp-debug.c:644:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dirname, sizeof(dirname), "%s%d", BDISP_NAME, bdisp->id);
           ^~~~~~~~
   drivers/media/platform/st/sti/bdisp/bdisp-debug.c:644:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dirname, sizeof(dirname), "%s%d", BDISP_NAME, bdisp->id);
           ^~~~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   66 warnings generated.
   Suppressed 66 warnings (54 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   64 warnings generated.
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   64 warnings generated.
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   69 warnings generated.
   drivers/media/platform/nvidia/tegra-vde/h264.c:309:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(vde->iram + 128, 0, macroblocks_nb / 2);
           ^~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:309:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(vde->iram + 128, 0, macroblocks_nb / 2);
           ^~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:872:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(h264, 0, sizeof(*h264));
           ^~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:872:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(h264, 0, sizeof(*h264));
           ^~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:873:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(vde->frames, 0, sizeof(vde->frames));
           ^~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:873:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(vde->frames, 0, sizeof(vde->frames));
           ^~~~~~
>> drivers/media/platform/nvidia/tegra-vde/trace.h:61:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   TRACE_EVENT(vde_ref_l0,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:931:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:931:2: note: Taking false branch
           if (err)
           ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:934:8: note: Calling 'tegra_vde_decode_begin'
           err = tegra_vde_decode_begin(vde, &h264, vde->frames,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:548:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:548:2: note: Taking false branch
           if (err)
           ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:552:6: note: 'err' is >= 0
           if (err < 0)
               ^~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:552:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:560:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:560:2: note: Taking false branch
           if (err) {
           ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:567:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:567:2: note: Taking false branch
           if (err) {
           ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:573:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:573:2: note: Taking false branch
           if (err) {
           ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:581:8: note: Calling 'tegra_vde_setup_hw_context'
           err = tegra_vde_setup_hw_context(vde, ctx, dpb_frames,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:314:2: note: Calling 'tegra_vde_setup_iram_tables'
           tegra_vde_setup_iram_tables(vde, dpb_frames,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:211:2: note: Calling 'trace_vde_ref_l0'
           trace_vde_ref_l0(dpb_frames[0].frame_num);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nvidia/tegra-vde/trace.h:61:1: note: Assuming the condition is true
   TRACE_EVENT(vde_ref_l0,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:247:7: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nvidia/tegra-vde/trace.h:61:1: note: Taking true branch
   TRACE_EVENT(vde_ref_l0,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:247:3: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   drivers/media/platform/nvidia/tegra-vde/trace.h:61:1: note: Dereference of null pointer
   TRACE_EVENT(vde_ref_l0,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:250:18: note: expanded from macro '__DECLARE_TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITION'
   #define TP_CONDITION(args...)   args
--
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:933:6: note: Left side of '||' is false
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:933:18: note: Assuming 'dst_buf' is non-null
           if (!src_buf || !dst_buf) {
                           ^~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:933:2: note: Taking false branch
           if (!src_buf || !dst_buf) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:939:7: note: 'q_data_cap' is non-null
           if (!q_data_cap)
                ^~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:939:2: note: Taking false branch
           if (!q_data_cap)
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:942:7: note: 'q_data_out' is non-null
           if (!q_data_out)
                ^~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:942:2: note: Taking false branch
           if (!q_data_out)
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:950:6: note: Assuming field 'colplanes' is equal to field 'num_planes'
           if (q_data_cap->fmt->colplanes != dst_buf->vb2_buf.num_planes) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:950:2: note: Taking false branch
           if (q_data_cap->fmt->colplanes != dst_buf->vb2_buf.num_planes) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:956:6: note: Assuming field 'jpeg_parse_error' is false
           if (jpeg_src_buf->jpeg_parse_error) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:956:2: note: Taking false branch
           if (jpeg_src_buf->jpeg_parse_error) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:971:11: note: Field 'slot' is < MXC_MAX_SLOTS
           if (ctx->slot >= MXC_MAX_SLOTS) {
                    ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:971:2: note: Taking false branch
           if (ctx->slot >= MXC_MAX_SLOTS) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:975:2: note: Taking false branch
           if (!mxc_jpeg_alloc_slot_data(jpeg, ctx->slot)) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:983:6: note: Assuming field 'mode' is equal to MXC_JPEG_ENCODE
           if (jpeg->mode == MXC_JPEG_ENCODE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:983:2: note: Taking true branch
           if (jpeg->mode == MXC_JPEG_ENCODE) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:984:3: note: Taking false branch
                   dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:986:3: note: Calling 'mxc_jpeg_config_enc_desc'
                   mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:901:12: note: Calling 'mxc_jpeg_fourcc_to_imgfmt'
           img_fmt = mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:402:2: note: Control jumps to the 'default' case at line 415
           switch (fourcc) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:416:3: note: Returning the value -1
                   return MXC_JPEG_INVALID;
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:901:12: note: Returning from 'mxc_jpeg_fourcc_to_imgfmt'
           img_fmt = mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:901:2: note: The value -1 is assigned to 'img_fmt'
           img_fmt = mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:902:6: note: 'img_fmt' is equal to MXC_JPEG_INVALID
           if (img_fmt == MXC_JPEG_INVALID)
               ^~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:902:2: note: Taking true branch
           if (img_fmt == MXC_JPEG_INVALID)
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:903:3: note: Loop condition is false.  Exiting loop
                   dev_err(jpeg->dev, "No valid image format detected\n");
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_subsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:905:5: note: The result of the left shift is undefined because the left operand is negative
                            STM_CTRL_IMAGE_FORMAT(img_fmt);
                            ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h:84:52: note: expanded from macro 'STM_CTRL_IMAGE_FORMAT'
   #define STM_CTRL_IMAGE_FORMAT(img_fmt)          ((img_fmt) << 3)
                                                    ~~~~~~~~~ ^
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1019:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1019:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1046:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1046:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1231:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (!q->sizeimage[0])
                       ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1823:8: note: Calling 'mxc_jpeg_try_fmt_vid_out'
           ret = mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1720:16: note: Assuming field 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type = (jpeg->mode == MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1720:15: note: '?' condition is false
           int q_type = (jpeg->mode == MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Assuming field 'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TYPE_IS_MULTIPLANAR'
           ((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Left side of '||' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TYPE_IS_MULTIPLANAR'
           ((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Assuming field 'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TYPE_IS_MULTIPLANAR'
            || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:2: note: Taking false branch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:7: note: 'fmt' is non-null
           if (!fmt || fmt->flags != q_type) {
                ^~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:6: note: Left side of '||' is false
           if (!fmt || fmt->flags != q_type) {
               ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:14: note: Assuming 'q_type' is equal to field 'flags'
           if (!fmt || fmt->flags != q_type) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:2: note: Taking false branch
           if (!fmt || fmt->flags != q_type) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1739:9: note: Calling 'mxc_jpeg_try_fmt'
           return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1615:11: note: Assuming field 'width' is >= MXC_JPEG_MAX_WIDTH
           u32 w = (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1615:10: note: '?' condition is false
           u32 w = (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1617:11: note: Assuming field 'height' is >= MXC_JPEG_MAX_HEIGHT
           u32 h = (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1617:10: note: '?' condition is false
           u32 h = (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:14: note: Assuming 'i' is >= field 'num_planes'
           for (i = 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:2: note: Loop condition is false. Execution continues on line 1655
           for (i = 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1655:2: note: Calling 'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:6: note: Assuming the condition is true
           if (q->fmt->fourcc == V4L2_PIX_FMT_JPEG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:2: note: Taking true branch
           if (q->fmt->fourcc == V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1655:2: note: Returning from 'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1656:2: note: Calling 'mxc_jpeg_sizeimage'
           mxc_jpeg_sizeimage(&tmp_q);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1229:2: note: Taking true branch
           if (q->fmt->fourcc == V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1231:7: note: Branch condition evaluates to a garbage value
                   if (!q->sizeimage[0])
                       ^~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1261:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&header, 0, sizeof(header));
--
           ^
   drivers/misc/habanalabs/common/memory.c:2543:17: note: Dereference of null pointer
           userptr->pid = current->pid;
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 82 warnings (70 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/i2c/busses/i2c-tiny-usb.c:188:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, dmadata, len);
           ^~~~~~
   drivers/i2c/busses/i2c-tiny-usb.c:188:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, dmadata, len);
           ^~~~~~
   drivers/i2c/busses/i2c-tiny-usb.c:251:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dev->adapter.name, sizeof(dev->adapter.name),
           ^~~~~~~~
   drivers/i2c/busses/i2c-tiny-usb.c:251:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dev->adapter.name, sizeof(dev->adapter.name),
           ^~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   68 warnings generated.
   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1141:3: warning: Value stored to 'length' is never read [clang-analyzer-deadcode.DeadStores]
                   length = 0;
                   ^        ~
   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1141:3: note: Value stored to 'length' is never read
                   length = 0;
                   ^        ~
   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1260:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
           ^~~~~~~~
   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1260:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
           ^~~~~~~~
   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:2922:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(jpeg->vfd_encoder->name, sizeof(jpeg->vfd_encoder->name),
           ^~~~~~~~
   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:2922:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(jpeg->vfd_encoder->name, sizeof(jpeg->vfd_encoder->name),
           ^~~~~~~~
   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:2952:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(jpeg->vfd_decoder->name, sizeof(jpeg->vfd_decoder->name),
           ^~~~~~~~
   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:2952:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(jpeg->vfd_decoder->name, sizeof(jpeg->vfd_decoder->name),
           ^~~~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/media/dvb-core/dvb_ringbuffer.c:166:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, rbuf->data+rbuf->pread, split);
                   ^~~~~~
   drivers/media/dvb-core/dvb_ringbuffer.c:166:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, rbuf->data+rbuf->pread, split);
                   ^~~~~~
   drivers/media/dvb-core/dvb_ringbuffer.c:175:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, rbuf->data+rbuf->pread, todo);
           ^~~~~~
   drivers/media/dvb-core/dvb_ringbuffer.c:175:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, rbuf->data+rbuf->pread, todo);
           ^~~~~~
   drivers/media/dvb-core/dvb_ringbuffer.c:190:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(rbuf->data+rbuf->pwrite, buf, split);
                   ^~~~~~
   drivers/media/dvb-core/dvb_ringbuffer.c:190:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(rbuf->data+rbuf->pwrite, buf, split);
                   ^~~~~~
   drivers/media/dvb-core/dvb_ringbuffer.c:200:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rbuf->data+rbuf->pwrite, buf, todo);
           ^~~~~~
   drivers/media/dvb-core/dvb_ringbuffer.c:200:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(rbuf->data+rbuf->pwrite, buf, todo);
           ^~~~~~
   drivers/media/dvb-core/dvb_ringbuffer.c:296:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, rbuf->data+idx, split);
                   ^~~~~~
   drivers/media/dvb-core/dvb_ringbuffer.c:296:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, rbuf->data+idx, split);
                   ^~~~~~
   drivers/media/dvb-core/dvb_ringbuffer.c:301:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, rbuf->data+idx, todo);
           ^~~~~~
   drivers/media/dvb-core/dvb_ringbuffer.c:301:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, rbuf->data+idx, todo);
           ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   66 warnings generated.
>> drivers/staging/media/imx/imx-media-dev-common.c:27:24: warning: Value stored to 'imxmd' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct imx_media_dev *imxmd = notifier2dev(notifier);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-dev-common.c:27:24: note: Value stored to 'imxmd' during its initialization is never read
           struct imx_media_dev *imxmd = notifier2dev(notifier);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-dev-common.c:370:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(imxmd->md.bus_info, sizeof(imxmd->md.bus_info),
           ^~~~~~~~
   drivers/staging/media/imx/imx-media-dev-common.c:370:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(imxmd->md.bus_info, sizeof(imxmd->md.bus_info),
           ^~~~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   64 warnings generated.
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   70 warnings generated.
   drivers/staging/media/imx/imx-media-utils.c:440:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&format, 0, sizeof(format));
                   ^~~~~~
   drivers/staging/media/imx/imx-media-utils.c:440:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&format, 0, sizeof(format));
                   ^~~~~~
   drivers/staging/media/imx/imx-media-utils.c:609:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(sd_name, sz, "ipu%d_csi%d", ipu_id + 1, id);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:609:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(sd_name, sz, "ipu%d_csi%d", ipu_id + 1, id);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:612:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(sd_name, sz, "ipu%d_vdic", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:612:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(sd_name, sz, "ipu%d_vdic", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:615:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(sd_name, sz, "ipu%d_ic_prp", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:615:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(sd_name, sz, "ipu%d_ic_prp", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:618:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(sd_name, sz, "ipu%d_ic_prpenc", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:618:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(sd_name, sz, "ipu%d_ic_prpenc", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:621:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(sd_name, sz, "ipu%d_ic_prpvf", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:621:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(sd_name, sz, "ipu%d_ic_prpvf", ipu_id + 1);
                   ^~~~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   73 warnings generated.
   Suppressed 73 warnings (61 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   70 warnings generated.
   drivers/usb/musb/musb_gadget.c:36:25: warning: Value stored to 'dma' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct dma_controller *dma = musb->dma_controller;
                                  ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:36:25: note: Value stored to 'dma' during its initialization is never read
           struct dma_controller *dma = musb->dma_controller;
                                  ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:86:18: warning: Value stored to 'musb_ep' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb_ep *musb_ep = request->ep;
                           ^~~~~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:86:18: note: Value stored to 'musb_ep' during its initialization is never read
           struct musb_ep *musb_ep = request->ep;
                           ^~~~~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:160:16: warning: Value stored to 'musb' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb             *musb = ep->musb;
                                    ^~~~   ~~~~~~~~
   drivers/usb/musb/musb_gadget.c:160:16: note: Value stored to 'musb' during its initialization is never read
           struct musb             *musb = ep->musb;
                                    ^~~~   ~~~~~~~~
   drivers/usb/musb/musb_gadget.c:162:16: warning: Value stored to 'epio' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           void __iomem *epio = ep->musb->endpoints[ep->current_epnum].regs;
                         ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:162:16: note: Value stored to 'epio' during its initialization is never read
           void __iomem *epio = ep->musb->endpoints[ep->current_epnum].regs;
                         ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:593:4: warning: Value stored to 'use_mode_1' is never read [clang-analyzer-deadcode.DeadStores]
                           use_mode_1 = 1;
                           ^            ~
   drivers/usb/musb/musb_gadget.c:593:4: note: Value stored to 'use_mode_1' is never read
                           use_mode_1 = 1;
                           ^            ~
   drivers/usb/musb/musb_gadget.c:595:4: warning: Value stored to 'use_mode_1' is never read [clang-analyzer-deadcode.DeadStores]
                           use_mode_1 = 0;
                           ^            ~
   drivers/usb/musb/musb_gadget.c:595:4: note: Value stored to 'use_mode_1' is never read
                           use_mode_1 = 0;
                           ^            ~
   drivers/usb/musb/musb_gadget.c:1696:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ep, 0, sizeof *ep);
--
           if (pxp_v4l2_pix_fmt_is_yuv(ctx->q_data[V4L2_M2M_SRC].fmt->fourcc) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-pxp.c:316:6: note: Left side of '&&' is true
   drivers/media/platform/nxp/imx-pxp.c:317:6: note: Assuming the condition is true
               !pxp_v4l2_pix_fmt_is_yuv(ctx->q_data[V4L2_M2M_DST].fmt->fourcc)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-pxp.c:316:2: note: Taking true branch
           if (pxp_v4l2_pix_fmt_is_yuv(ctx->q_data[V4L2_M2M_SRC].fmt->fourcc) &&
           ^
   drivers/media/platform/nxp/imx-pxp.c:336:4: note: The result of the left shift is undefined because the left operand is negative
                           BF_PXP_CSC1_COEF0_UV_OFFSET(-128) |
                           ^
   drivers/media/platform/nxp/imx-pxp.h:598:8: note: expanded from macro 'BF_PXP_CSC1_COEF0_UV_OFFSET'
           (((v) << 9) & BM_PXP_CSC1_COEF0_UV_OFFSET)
             ~~~ ^
   drivers/media/platform/nxp/imx-pxp.c:1037:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cap->bus_info, sizeof(cap->bus_info),
           ^~~~~~~~
   drivers/media/platform/nxp/imx-pxp.c:1037:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cap->bus_info, sizeof(cap->bus_info),
           ^~~~~~~~
   drivers/media/platform/nxp/imx-pxp.c:1721:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(vfd->name, sizeof(vfd->name), "%s", pxp_videodev.name);
           ^~~~~~~~
   drivers/media/platform/nxp/imx-pxp.c:1721:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(vfd->name, sizeof(vfd->name), "%s", pxp_videodev.name);
           ^~~~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/i2c/busses/i2c-i801.c:1560:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(tco_res, 0, sizeof(tco_res));
           ^~~~~~
   drivers/i2c/busses/i2c-i801.c:1560:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(tco_res, 0, sizeof(tco_res));
           ^~~~~~
   drivers/i2c/busses/i2c-i801.c:1770:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(priv->adapter.name, sizeof(priv->adapter.name),
           ^~~~~~~~
   drivers/i2c/busses/i2c-i801.c:1770:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(priv->adapter.name, sizeof(priv->adapter.name),
           ^~~~~~~~
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/i2c/busses/i2c-sis630.c:366:3: warning: Value stored to 'size' is never read [clang-analyzer-deadcode.DeadStores]
                   size = SIS630_BLOCK_DATA;
                   ^
   drivers/i2c/busses/i2c-sis630.c:366:3: note: Value stored to 'size' is never read
   drivers/i2c/busses/i2c-sis630.c:522:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(sis630_adapter.name, sizeof(sis630_adapter.name),
           ^~~~~~~~
   drivers/i2c/busses/i2c-sis630.c:522:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(sis630_adapter.name, sizeof(sis630_adapter.name),
           ^~~~~~~~
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/usb/serial/option.c:2258:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &port->dev;
                          ^~~   ~~~~~~~~~~
   drivers/usb/serial/option.c:2258:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &port->dev;
                          ^~~   ~~~~~~~~~~
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/usb/serial/safe_serial.c:242:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buf + count, '0', pkt_len - count - trailer_len);
                   ^~~~~~
   drivers/usb/serial/safe_serial.c:242:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(buf + count, '0', pkt_len - count - trailer_len);
                   ^~~~~~
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/usb/serial/sierra.c:468:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer, buf, writesize);
           ^~~~~~
   drivers/usb/serial/sierra.c:468:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buffer, buf, writesize);
           ^~~~~~
>> drivers/usb/serial/sierra.c:531:2: warning: Value stored to 'endpoint' is never read [clang-analyzer-deadcode.DeadStores]
           endpoint = usb_pipeendpoint(urb->pipe);
           ^
   drivers/usb/serial/sierra.c:531:2: note: Value stored to 'endpoint' is never read
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   67 warnings generated.
   drivers/staging/media/rkvdec/rkvdec.c:175:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(f, 0, sizeof(*f));
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec.c:175:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(f, 0, sizeof(*f));
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec.c:240:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
           ^~~~~~~~
   drivers/staging/media/rkvdec/rkvdec.c:240:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
           ^~~~~~~~
   drivers/staging/media/rkvdec/rkvdec.c:673:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(run, 0, sizeof(*run));
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec.c:673:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(run, 0, sizeof(*run));
           ^~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   69 warnings generated.
   drivers/staging/media/rkvdec/rkvdec-h264.c:656:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hw_ps, 0, sizeof(*hw_ps));
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:656:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(hw_ps, 0, sizeof(*hw_ps));
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:742:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hw_rps, 0, sizeof(priv_tbl->rps));
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:742:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(hw_rps, 0, sizeof(priv_tbl->rps));
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:807:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tbl->scaling_list.scaling_list_4x4,
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:807:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(tbl->scaling_list.scaling_list_4x4,
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:811:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tbl->scaling_list.scaling_list_8x8,
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:811:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(tbl->scaling_list.scaling_list_8x8,
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:1044:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(priv_tbl->cabac_table, rkvdec_h264_cabac_table,
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:1044:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(priv_tbl->cabac_table, rkvdec_h264_cabac_table,
           ^~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   72 warnings generated.
   drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:326:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst_matrix->scaling_list_4x4, src_matrix->scaling_list_4x4,
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:326:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dst_matrix->scaling_list_4x4, src_matrix->scaling_list_4x4,
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:329:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst_matrix->scaling_list_8x8, src_matrix->scaling_list_8x8,
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:329:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dst_matrix->scaling_list_8x8, src_matrix->scaling_list_8x8,
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:447:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ref_list[num_valid], 0x20, 32 - num_valid);
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:447:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&ref_list[num_valid], 0x20, 32 - num_valid);
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:485:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:485:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:632:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:632:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:722:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(inst->vpu.vsi, &inst->vsi_ctx, sizeof(inst->vsi_ctx));
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:722:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(inst->vpu.vsi, &inst->vsi_ctx, sizeof(inst->vsi_ctx));
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:735:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
--
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/media/i2c/lm3560.c:123:3: warning: Value stored to 'rval' is never read [clang-analyzer-deadcode.DeadStores]
                   rval = lm3560_enable_ctrl(flash, led_no, true);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/lm3560.c:123:3: note: Value stored to 'rval' is never read
                   rval = lm3560_enable_ctrl(flash, led_no, true);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/lm3560.c:146:3: warning: Value stored to 'rval' is never read [clang-analyzer-deadcode.DeadStores]
                   rval = lm3560_enable_ctrl(flash, led_no, true);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/lm3560.c:146:3: note: Value stored to 'rval' is never read
                   rval = lm3560_enable_ctrl(flash, led_no, true);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/spi/spi-sh-hspi.c:100:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = hspi->dev;
                          ^~~   ~~~~~~~~~
   drivers/spi/spi-sh-hspi.c:100:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = hspi->dev;
                          ^~~   ~~~~~~~~~
   drivers/spi/spi-sh-hspi.c:108:2: warning: Value stored to 'best_rate' is never read [clang-analyzer-deadcode.DeadStores]
           best_rate = 0;
           ^           ~
   drivers/spi/spi-sh-hspi.c:108:2: note: Value stored to 'best_rate' is never read
           best_rate = 0;
           ^           ~
   drivers/spi/spi-sh-hspi.c:127:4: warning: Value stored to 'best_rate' is never read [clang-analyzer-deadcode.DeadStores]
                           best_rate = rate;
                           ^           ~~~~
   drivers/spi/spi-sh-hspi.c:127:4: note: Value stored to 'best_rate' is never read
                           best_rate = rate;
                           ^           ~~~~
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/spi/spi-sh-msiof.c:904:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, src, words * 4);
           ^~~~~~
   drivers/spi/spi-sh-msiof.c:904:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dst, src, words * 4);
           ^~~~~~
   drivers/spi/spi-sh-msiof.c:1147:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cfg, 0, sizeof(cfg));
           ^~~~~~
   drivers/spi/spi-sh-msiof.c:1147:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&cfg, 0, sizeof(cfg));
           ^~~~~~
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   68 warnings generated.
   drivers/usb/core/message.c:286:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(driver_data, data, size);
                   ^~~~~~
   drivers/usb/core/message.c:286:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(driver_data, data, size);
                   ^~~~~~
   drivers/usb/core/message.c:789:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, size);   /* Make sure we parse really received data */
           ^~~~~~
   drivers/usb/core/message.c:789:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0, size);   /* Make sure we parse really received data */
           ^~~~~~
   drivers/usb/core/message.c:1034:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(smallbuf, buf, len);
                           ^~~~~~
   drivers/usb/core/message.c:1034:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(smallbuf, buf, len);
                           ^~~~~~
   drivers/usb/core/message.c:1073:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&dev->descriptor, desc, size);
                   ^~~~~~
   drivers/usb/core/message.c:1073:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&dev->descriptor, desc, size);
                   ^~~~~~
   drivers/usb/core/message.c:1709:2: warning: Value stored to 'retval' is never read [clang-analyzer-deadcode.DeadStores]
           retval = 0;
           ^        ~
   drivers/usb/core/message.c:1709:2: note: Value stored to 'retval' is never read
           retval = 0;
           ^        ~
   drivers/usb/core/message.c:2301:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hdr, 0x00, sizeof(struct usb_cdc_parsed_header));
           ^~~~~~
   drivers/usb/core/message.c:2301:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(hdr, 0x00, sizeof(struct usb_cdc_parsed_header));
           ^~~~~~
   Suppressed 62 warnings (50 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   65 warnings generated.
>> drivers/media/platform/st/stm32/dma2d/dma2d.c:531:33: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
                                                 ^~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/dma2d/dma2d.c:521:2: note: 'ctx' initialized here
           struct dma2d_ctx *ctx = dev->curr;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/dma2d/dma2d.c:526:6: note: Assuming the condition is true
           if (s & ISR_TCIF || s == 0) {
               ^~~~~~~~~~~~
   drivers/media/platform/st/stm32/dma2d/dma2d.c:526:19: note: Left side of '||' is true
           if (s & ISR_TCIF || s == 0) {
                            ^
   drivers/media/platform/st/stm32/dma2d/dma2d.c:529:11: note: Assuming 'ctx' is null
                   WARN_ON(!ctx);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/media/platform/st/stm32/dma2d/dma2d.c:531:33: note: Dereference of null pointer
                   src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
                                                 ^~~~~~~~~~~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/usb/musb/musb_debugfs.c:171:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   drivers/usb/musb/musb_debugfs.c:171:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   drivers/usb/musb/musb_debugfs.c:271:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   drivers/usb/musb/musb_debugfs.c:271:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/usb/chipidea/core.c:956:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%s\n", ci_role(ci)->name);
                          ^~~~~~~
   drivers/usb/chipidea/core.c:956:10: note: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%s\n", ci_role(ci)->name);
                          ^~~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/virtio/virtio_pci_common.c:141:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
           ^~~~~~~~
   drivers/virtio/virtio_pci_common.c:141:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
           ^~~~~~~~
   drivers/virtio/virtio_pci_common.c:160:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
                   ^~~~~~~~
   drivers/virtio/virtio_pci_common.c:160:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
                   ^~~~~~~~
   drivers/virtio/virtio_pci_common.c:335:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(vp_dev->msix_names[msix_vec],
                   ^~~~~~~~
   drivers/virtio/virtio_pci_common.c:335:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(vp_dev->msix_names[msix_vec],
                   ^~~~~~~~
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   66 warnings generated.
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c:291:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
           ^~~~~~~~
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c:291:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
           ^~~~~~~~
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c:1163:4: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&cfg, 0, sizeof(struct v4l2_ctrl_config));
--
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/memory/emif.c:1033:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(temp, pd, sizeof(*pd));
           ^~~~~~
   drivers/memory/emif.c:1033:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(temp, pd, sizeof(*pd));
           ^~~~~~
   drivers/memory/emif.c:1035:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dev_info, pd->device_info, sizeof(*dev_info));
           ^~~~~~
   drivers/memory/emif.c:1035:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dev_info, pd->device_info, sizeof(*dev_info));
           ^~~~~~
   drivers/memory/emif.c:1069:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(temp, cust_cfgs, sizeof(*cust_cfgs));
                           ^~~~~~
   drivers/memory/emif.c:1069:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(temp, cust_cfgs, sizeof(*cust_cfgs));
                           ^~~~~~
   drivers/memory/emif.c:1084:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(temp, pd->timings, size);
                           ^~~~~~
   drivers/memory/emif.c:1084:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(temp, pd->timings, size);
                           ^~~~~~
   drivers/memory/emif.c:1098:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(temp, pd->min_tck, sizeof(*pd->min_tck));
                           ^~~~~~
   drivers/memory/emif.c:1098:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(temp, pd->min_tck, sizeof(*pd->min_tck));
                           ^~~~~~
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/tty/moxa.c:618:5: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&tmp, 0, sizeof(tmp));
                                   ^~~~~~
   drivers/tty/moxa.c:618:5: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                                   memset(&tmp, 0, sizeof(tmp));
                                   ^~~~~~
   drivers/tty/moxa.c:648:5: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&tmp, 0, sizeof(tmp));
                                   ^~~~~~
   drivers/tty/moxa.c:648:5: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                                   memset(&tmp, 0, sizeof(tmp));
                                   ^~~~~~
   drivers/tty/moxa.c:1055:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(rsn, "bad magic: %.8x", le32_to_cpu(hdr->magic));
                   ^~~~~~~
   drivers/tty/moxa.c:1055:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(rsn, "bad magic: %.8x", le32_to_cpu(hdr->magic));
                   ^~~~~~~
   drivers/tty/moxa.c:1059:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(rsn, "not for linux, type is %u", hdr->type);
                   ^~~~~~~
   drivers/tty/moxa.c:1059:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(rsn, "not for linux, type is %u", hdr->type);
                   ^~~~~~~
   drivers/tty/moxa.c:1063:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(rsn, "not for this card, model is %u", hdr->model);
                   ^~~~~~~
   drivers/tty/moxa.c:1063:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(rsn, "not for this card, model is %u", hdr->model);
                   ^~~~~~~
   drivers/tty/moxa.c:1076:4: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(rsn, "too few entries in fw file");
                           ^~~~~~~
   drivers/tty/moxa.c:1076:4: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(rsn, "too few entries in fw file");
                           ^~~~~~~
   drivers/tty/moxa.c:1083:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(rsn, "bad length: %u (should be %u)", (u32)fw->size,
                   ^~~~~~~
   drivers/tty/moxa.c:1083:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(rsn, "bad length: %u (should be %u)", (u32)fw->size,
                   ^~~~~~~
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/thermal/rcar_thermal.c:375:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = rcar_priv_to_dev(priv);
                          ^~~
   drivers/thermal/rcar_thermal.c:375:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = rcar_priv_to_dev(priv);
                          ^~~
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
>> drivers/watchdog/pcwd_usb.c:170:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &usb_pcwd->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_usb.c:170:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &usb_pcwd->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_usb.c:694:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(fw_ver_str, "%u.%02u", fw_rev_major, fw_rev_minor);
                   ^~~~~~~
   drivers/watchdog/pcwd_usb.c:694:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(fw_ver_str, "%u.%02u", fw_rev_major, fw_rev_minor);
                   ^~~~~~~
   drivers/watchdog/pcwd_usb.c:696:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(fw_ver_str, "<card no answer>");
                   ^~~~~~~
   drivers/watchdog/pcwd_usb.c:696:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(fw_ver_str, "<card no answer>");
                   ^~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/hwmon/lm63.c:336:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm63.c:336:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm63.c:376:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", pwm);
                  ^~~~~~~
   drivers/hwmon/lm63.c:376:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", pwm);
                  ^~~~~~~
   drivers/hwmon/lm63.c:412:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->config_fan & 0x20 ? 1 : 2);
                  ^~~~~~~
   drivers/hwmon/lm63.c:412:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->config_fan & 0x20 ? 1 : 2);
                  ^~~~~~~
   drivers/hwmon/lm63.c:462:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP8_FROM_REG(data->temp8[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm63.c:462:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP8_FROM_REG(data->temp8[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm63.c:471:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp8_from_reg(data, attr->index)
                  ^~~~~~~
   drivers/hwmon/lm63.c:471:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp8_from_reg(data, attr->index)
                  ^~~~~~~
   drivers/hwmon/lm63.c:481:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", lut_temp_from_reg(data, attr->index)
                  ^~~~~~~
   drivers/hwmon/lm63.c:481:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", lut_temp_from_reg(data, attr->index)
                  ^~~~~~~
   drivers/hwmon/lm63.c:547:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp + data->temp2_offset);
                  ^~~~~~~
   drivers/hwmon/lm63.c:547:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp + data->temp2_offset);
                  ^~~~~~~
   drivers/hwmon/lm63.c:595:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp8_from_reg(data, 2)
                  ^~~~~~~
   drivers/hwmon/lm63.c:595:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp8_from_reg(data, 2)
                  ^~~~~~~
   drivers/hwmon/lm63.c:606:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", lut_temp_from_reg(data, attr->index)
                  ^~~~~~~
   drivers/hwmon/lm63.c:606:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", lut_temp_from_reg(data, attr->index)
                  ^~~~~~~
   drivers/hwmon/lm63.c:666:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->update_interval);
                  ^~~~~~~
   drivers/hwmon/lm63.c:666:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->update_interval);
                  ^~~~~~~
   drivers/hwmon/lm63.c:693:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, data->trutherm ? "1\n" : "2\n");
                  ^~~~~~~
   drivers/hwmon/lm63.c:693:9: note: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, data->trutherm ? "1\n" : "2\n");
                  ^~~~~~~
   drivers/hwmon/lm63.c:727:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/lm63.c:727:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/lm63.c:737:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/lm63.c:737:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
--
           ^~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/media/platform/renesas/vsp1/vsp1_dl.c:572:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dl->header, 0, sizeof(*dl->header));
           ^~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_dl.c:572:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(dl->header, 0, sizeof(*dl->header));
           ^~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:85:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&format, 0, sizeof(format));
           ^~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:85:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&format, 0, sizeof(format));
           ^~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:132:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&format, 0, sizeof(format));
           ^~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:132:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&format, 0, sizeof(format));
           ^~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:150:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&sel, 0, sizeof(sel));
           ^~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:150:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&sel, 0, sizeof(sel));
           ^~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:338:15: warning: Access to field 'source_pad' results in a dereference of a null pointer (loaded from variable 'brx') [clang-analyzer-core.NullDereference]
           format.pad = brx->source_pad;
                        ^~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:244:6: note: Assuming field 'num_inputs' is <= 2
           if (pipe->num_inputs > 2)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:244:2: note: Taking false branch
           if (pipe->num_inputs > 2)
           ^
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:246:11: note: Assuming field 'brx' is null
           else if (pipe->brx && !drm_pipe->force_brx_release)
                    ^~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:246:21: note: Left side of '&&' is false
           else if (pipe->brx && !drm_pipe->force_brx_release)
                              ^
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:248:11: note: Assuming the condition is false
           else if (vsp1_feature(vsp1, VSP1_HAS_BRU) && !vsp1->bru->entity.pipe)
                    ^
   drivers/media/platform/renesas/vsp1/vsp1.h:72:32: note: expanded from macro 'vsp1_feature'
   #define vsp1_feature(vsp1, f) ((vsp1)->info->features & (f))
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:248:44: note: Left side of '&&' is false
           else if (vsp1_feature(vsp1, VSP1_HAS_BRU) && !vsp1->bru->entity.pipe)
                                                     ^
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:251:3: note: Value assigned to 'brx'
                   brx = &vsp1->brs->entity;
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:254:6: note: Assuming 'brx' is equal to field 'brx'
           if (brx != pipe->brx) {
               ^~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:254:2: note: Taking false branch
           if (brx != pipe->brx) {
           ^
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:338:15: note: Access to field 'source_pad' results in a dereference of a null pointer (loaded from variable 'brx')
           format.pad = brx->source_pad;
                        ^~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/spi/spi-stm32.c:1068:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dma_conf, 0, sizeof(struct dma_slave_config));
           ^~~~~~
   drivers/spi/spi-stm32.c:1068:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(dma_conf, 0, sizeof(struct dma_slave_config));
           ^~~~~~
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/spi/spi-tegra210-quad.c:1396:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = tegra_qspi_start_dma_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1396:3: note: Value stored to 'err' is never read
                   err = tegra_qspi_start_dma_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1398:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = tegra_qspi_start_cpu_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1398:3: note: Value stored to 'err' is never read
                   err = tegra_qspi_start_cpu_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   58 warnings generated.
>> drivers/spi/spi-topcliff-pch.c:161:8: warning: Excessive padding in 'struct pch_spi_data' (34 padding bytes, where 2 is optimal). Optimal fields order: io_remap_addr, io_base_addr, master, pkt_tx_buff, pkt_rx_buff, current_chip, current_msg, cur_trans, board_dat, plat_dev, queue, lock, work, wait, dma, bpw_len, tx_index, rx_index, ch, use_dma, save_total_len, transfer_complete, bcurrent_msg_processing, status, transfer_active, n_curnt_chip, irq_reg_sts, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct pch_spi_data {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:161:8: note: Excessive padding in 'struct pch_spi_data' (34 padding bytes, where 2 is optimal). Optimal fields order: io_remap_addr, io_base_addr, master, pkt_tx_buff, pkt_rx_buff, current_chip, current_msg, cur_trans, board_dat, plat_dev, queue, lock, work, wait, dma, bpw_len, tx_index, rx_index, ch, use_dma, save_total_len, transfer_complete, bcurrent_msg_processing, status, transfer_active, n_curnt_chip, irq_reg_sts, consider reordering the fields or adding explicit padding members
   struct pch_spi_data {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:609:26: warning: Array access (via field 'pkt_tx_buff') results in a null pointer dereference [clang-analyzer-core.NullDereference]
                                   data->pkt_tx_buff[j] = *tx_buf++;
                                                        ^
   drivers/spi/spi-topcliff-pch.c:1139:2: note: Taking false branch
           dev_dbg(&data->master->dev, "%s data initialized\n", __func__);
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/spi/spi-topcliff-pch.c:1143:6: note: Assuming field 'suspend_sts' is 0
           if (data->board_dat->suspend_sts || (data->status == STATUS_EXITING)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1143:6: note: Left side of '||' is false
   drivers/spi/spi-topcliff-pch.c:1143:39: note: Assuming field 'status' is not equal to STATUS_EXITING
           if (data->board_dat->suspend_sts || (data->status == STATUS_EXITING)) {
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1143:2: note: Taking false branch
           if (data->board_dat->suspend_sts || (data->status == STATUS_EXITING)) {
           ^
   drivers/spi/spi-topcliff-pch.c:1164:2: note: Taking false branch
           dev_dbg(&data->master->dev,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/spi/spi-topcliff-pch.c:1175:2: note: Calling 'pch_spi_select_chip'
           pch_spi_select_chip(data, data->current_msg->spi);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:530:6: note: Assuming field 'current_chip' is equal to NULL
           if (data->current_chip != NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:530:2: note: Taking false branch
           if (data->current_chip != NULL) {
           ^
   drivers/spi/spi-topcliff-pch.c:541:2: note: Taking false branch
           dev_dbg(&pspi->dev, "%s :Invoking pch_spi_setup_transfer\n", __func__);
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/spi/spi-topcliff-pch.c:543:1: note: Returning without writing to 'data->pkt_rx_buff', which participates in a condition later
   }
   ^
   drivers/spi/spi-topcliff-pch.c:543:1: note: Returning without writing to 'data->pkt_tx_buff'
   drivers/spi/spi-topcliff-pch.c:1175:2: note: Returning from 'pch_spi_select_chip'
           pch_spi_select_chip(data, data->current_msg->spi);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1179:6: note: Assuming field 'use_dma' is 0
           if (data->use_dma)
               ^~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1179:2: note: Taking false branch
           if (data->use_dma)
           ^
   drivers/spi/spi-topcliff-pch.c:1189:7: note: Assuming field 'cur_trans' is not equal to NULL
                   if (data->cur_trans == NULL) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1189:3: note: Taking false branch
                   if (data->cur_trans == NULL) {
                   ^
   drivers/spi/spi-topcliff-pch.c:1200:4: note: Taking false branch
                           dev_dbg(&data->master->dev,
                           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/spi/spi-topcliff-pch.c:1206:7: note: Assuming field 'len' is not equal to 0
                   if (!data->cur_trans->len)
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1206:3: note: Taking false branch
                   if (!data->cur_trans->len)
                   ^
   drivers/spi/spi-topcliff-pch.c:1210:7: note: Assuming field 'use_dma' is 0
                   if (data->use_dma) {
                       ^~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1210:3: note: Taking false branch
                   if (data->use_dma) {
                   ^
   drivers/spi/spi-topcliff-pch.c:1230:4: note: Calling 'pch_spi_set_tx'
                           pch_spi_set_tx(data, &bpw);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:555:6: note: Assuming field 'speed_hz' is 0
           if (data->cur_trans->speed_hz) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:555:2: note: Taking false branch
           if (data->cur_trans->speed_hz) {
           ^
   drivers/spi/spi-topcliff-pch.c:561:6: note: Assuming field 'bits_per_word' is 0
           if (data->cur_trans->bits_per_word &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:561:37: note: Left side of '&&' is false
           if (data->cur_trans->bits_per_word &&
                                              ^
   drivers/spi/spi-topcliff-pch.c:581:22: note: Calling 'kzalloc'
           data->pkt_tx_buff = kzalloc(size, GFP_KERNEL);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~
--
                  ^~~~~~~
   drivers/hwmon/lm77.c:137:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp[attr->index]);
                  ^~~~~~~
   drivers/hwmon/lm77.c:151:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp);
                  ^~~~~~~
   drivers/hwmon/lm77.c:151:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp);
                  ^~~~~~~
   drivers/hwmon/lm77.c:208:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/lm77.c:208:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/hwmon/lm78.c:147:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:147:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:155:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in_min[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:155:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in_min[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:163:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in_max[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:163:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in_max[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:233:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp));
                  ^~~~~~~
   drivers/hwmon/lm78.c:233:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp));
                  ^~~~~~~
   drivers/hwmon/lm78.c:240:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_over));
                  ^~~~~~~
   drivers/hwmon/lm78.c:240:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_over));
                  ^~~~~~~
   drivers/hwmon/lm78.c:266:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_hyst));
                  ^~~~~~~
   drivers/hwmon/lm78.c:266:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_hyst));
                  ^~~~~~~
   drivers/hwmon/lm78.c:299:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
                  ^~~~~~~
   drivers/hwmon/lm78.c:299:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
                  ^~~~~~~
   drivers/hwmon/lm78.c:309:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[nr],
                  ^~~~~~~
   drivers/hwmon/lm78.c:309:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[nr],
                  ^~~~~~~
   drivers/hwmon/lm78.c:338:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:338:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:423:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, 82));
                  ^~~~~~~
   drivers/hwmon/lm78.c:423:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, 82));
                  ^~~~~~~
   drivers/hwmon/lm78.c:432:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/lm78.c:432:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/lm78.c:441:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> nr) & 1);
                  ^~~~~~~
   drivers/hwmon/lm78.c:441:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> nr) & 1);
                  ^~~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   132 warnings generated.
   drivers/usb/host/xhci-mtk-sch.c:83:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, DBG_BUF_EN, "%s ep%d%s %s, mpkt:%d, interval:%d/%d%s",
           ^~~~~~~~
   drivers/usb/host/xhci-mtk-sch.c:83:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(buf, DBG_BUF_EN, "%s ep%d%s %s, mpkt:%d, interval:%d/%d%s",
           ^~~~~~~~
>> drivers/usb/host/xhci-mtk-sch.c:729:19: warning: Value stored to 'xhci' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xhci_hcd *xhci = hcd_to_xhci(hcd);
                            ^~~~   ~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mtk-sch.c:729:19: note: Value stored to 'xhci' during its initialization is never read
           struct xhci_hcd *xhci = hcd_to_xhci(hcd);
                            ^~~~   ~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mtk-sch.c:791:19: warning: Value stored to 'xhci' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xhci_hcd *xhci = hcd_to_xhci(hcd);
                            ^~~~   ~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mtk-sch.c:791:19: note: Value stored to 'xhci' during its initialization is never read
           struct xhci_hcd *xhci = hcd_to_xhci(hcd);
                            ^~~~   ~~~~~~~~~~~~~~~~
   Suppressed 129 warnings (117 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (39 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/hwmon/adt7475.c:338:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n",
                          ^~~~~~~
   drivers/hwmon/adt7475.c:338:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n",
                          ^~~~~~~
   drivers/hwmon/adt7475.c:342:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n",
                          ^~~~~~~
   drivers/hwmon/adt7475.c:342:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n",
                          ^~~~~~~
   drivers/hwmon/adt7475.c:440:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", out);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:440:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", out);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:566:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", ad7475_st_map[val & 0x7]);
                          ^~~~~~~
   drivers/hwmon/adt7475.c:566:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", ad7475_st_map[val & 0x7]);
                          ^~~~~~~
   drivers/hwmon/adt7475.c:568:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adt7475.c:568:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adt7475.c:647:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", val + autorange_table[out]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:647:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", val + autorange_table[out]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:708:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", out);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:708:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", out);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:743:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->pwm[sattr->nr][sattr->index]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:743:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->pwm[sattr->nr][sattr->index]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:755:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->pwmchan[sattr->index]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:755:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->pwmchan[sattr->index]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:767:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->pwmctl[sattr->index]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:767:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->pwmctl[sattr->index]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:828:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(data->enh_acoustics[0] & mask));
                  ^~~~~~~
   drivers/hwmon/adt7475.c:828:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(data->enh_acoustics[0] & mask));
                  ^~~~~~~
   drivers/hwmon/adt7475.c:980:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", pwmfreq_table[idx]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:980:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", pwmfreq_table[idx]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:1021:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(data->config4 & CONFIG4_MAXDUTY));
                  ^~~~~~~
   drivers/hwmon/adt7475.c:1021:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(data->config4 & CONFIG4_MAXDUTY));
                  ^~~~~~~
   drivers/hwmon/adt7475.c:1053:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (int)data->vrm);
--
   drivers/usb/gadget/udc/net2272.c:2635:3: warning: Value stored to 'irqflags' is never read [clang-analyzer-deadcode.DeadStores]
                   irqflags |= IRQF_TRIGGER_LOW;
                   ^
   drivers/usb/gadget/udc/net2272.c:2635:3: note: Value stored to 'irqflags' is never read
   Suppressed 53 warnings (40 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/mfd/stm32-timers.c:88:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&config, 0, sizeof(config));
           ^~~~~~
   drivers/mfd/stm32-timers.c:88:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&config, 0, sizeof(config));
           ^~~~~~
   drivers/mfd/stm32-timers.c:187:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, ARRAY_SIZE(name), "ch%1d", i + 1);
                   ^~~~~~~~
   drivers/mfd/stm32-timers.c:187:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, ARRAY_SIZE(name), "ch%1d", i + 1);
                   ^~~~~~~~
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/mfd/rave-sp.c:420:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(reply->data, &data[2], reply->length);
                           ^~~~~~
   drivers/mfd/rave-sp.c:420:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(reply->data, &data[2], reply->length);
                           ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/video/fbdev/mb862xx/mb862xx-i2c.c:106:24: warning: Value stored to 'par' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mb862xxfb_par *par = adap->algo_data;
                                 ^~~   ~~~~~~~~~~~~~~~
   drivers/video/fbdev/mb862xx/mb862xx-i2c.c:106:24: note: Value stored to 'par' during its initialization is never read
           struct mb862xxfb_par *par = adap->algo_data;
                                 ^~~   ~~~~~~~~~~~~~~~
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/video/fbdev/sm712fb.c:996:4: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                           val |= chan_to_field(blue, &sfb->fb->var.blue);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sm712fb.c:996:4: note: Value stored to 'val' is never read
                           val |= chan_to_field(blue, &sfb->fb->var.blue);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sm712fb.c:1515:2: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(smtcfb_fix.id, "sm%Xfb", ent->device);
           ^~~~~~~
   drivers/video/fbdev/sm712fb.c:1515:2: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(smtcfb_fix.id, "sm%Xfb", ent->device);
           ^~~~~~~
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/media/i2c/cx25840/cx25840-firmware.c:131:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer + 2, ptr, len);
                   ^~~~~~
   drivers/media/i2c/cx25840/cx25840-firmware.c:131:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer + 2, ptr, len);
                   ^~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/media/i2c/cx25840/cx25840-vbi.c:86:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(svbi->service_lines, 0, sizeof(svbi->service_lines));
           ^~~~~~
   drivers/media/i2c/cx25840/cx25840-vbi.c:86:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(svbi->service_lines, 0, sizeof(svbi->service_lines));
           ^~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   224 warnings generated.
>> drivers/media/dvb-frontends/rtl2832_sdr.c:174:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:174:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:179:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, src, src_len);
                   ^~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:179:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, src, src_len);
                   ^~~~~~
>> drivers/media/dvb-frontends/rtl2832_sdr.c:196:16: warning: Value stored to 'msecs' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   unsigned int msecs = jiffies_to_msecs(jiffies -
                                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:196:16: note: Value stored to 'msecs' during its initialization is never read
                   unsigned int msecs = jiffies_to_msecs(jiffies -
                                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/dvb-frontends/rtl2832_sdr.c:198:16: warning: Value stored to 'samples' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   unsigned int samples = dev->sample - dev->sample_measured;
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:198:16: note: Value stored to 'samples' during its initialization is never read
                   unsigned int samples = dev->sample - dev->sample_measured;
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:268:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:268:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:304:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:304:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:322:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:322:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:352:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:352:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:371:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:371:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:404:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:404:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:425:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:425:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:441:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:441:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:606:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x112, 0x5a);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:606:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x112, 0x5a);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:607:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x102, 0x40);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:607:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x102, 0x40);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:608:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x103, 0x5a);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:608:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x103, 0x5a);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:609:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x1c7, 0x30);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:609:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x1c7, 0x30);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:610:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x104, 0xd0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:610:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x104, 0xd0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:611:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x105, 0xbe);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:611:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x105, 0xbe);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:612:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x1c8, 0x18);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:612:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x1c8, 0x18);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:613:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_write(dev->regmap, 0x106, 0x35);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832_sdr.c:613:3: note: Value stored to 'ret' is never read
                   ret = regmap_write(dev->regmap, 0x106, 0x35);
--
                                                                   ^
   drivers/usb/host/xhci-ring.c:417:6: note: Assuming 'ret' is not equal to 0
           if (!ret) {
               ^~~~
   drivers/usb/host/xhci-ring.c:417:2: note: Taking false branch
           if (!ret) {
           ^
   drivers/usb/host/xhci-ring.c:421:3: note: Calling 'xhci_handle_stopped_cmd_ring'
                   xhci_handle_stopped_cmd_ring(xhci, xhci_next_queued_cmd(xhci));
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:337:2: note: Loop condition is false. Execution continues on line 355
           list_for_each_entry(i_cmd, &xhci->cmd_list, cmd_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_entry'
           for (pos = list_first_entry(head, typeof(*pos), member);        \
           ^
   drivers/usb/host/xhci-ring.c:358:7: note: Assuming field 'dequeue' is not equal to field 'enqueue'
           if ((xhci->cmd_ring->dequeue != xhci->cmd_ring->enqueue) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:358:6: note: Left side of '&&' is true
           if ((xhci->cmd_ring->dequeue != xhci->cmd_ring->enqueue) &&
               ^
   drivers/usb/host/xhci-ring.c:359:6: note: Assuming the condition is true
               !(xhci->xhc_state & XHCI_STATE_DYING)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:358:2: note: Taking true branch
           if ((xhci->cmd_ring->dequeue != xhci->cmd_ring->enqueue) &&
           ^
   drivers/usb/host/xhci-ring.c:362:3: note: Calling 'xhci_ring_cmd_db'
                   xhci_ring_cmd_db(xhci);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:303:6: note: Assuming the condition is false
           if (!(xhci->cmd_ring_state & CMD_RING_STATE_RUNNING))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:303:2: note: Taking false branch
           if (!(xhci->cmd_ring_state & CMD_RING_STATE_RUNNING))
           ^
   drivers/usb/host/xhci-ring.c:306:2: note: Taking false branch
           xhci_dbg(xhci, "// Ding dong!\n");
           ^
   drivers/usb/host/xhci.h:1970:2: note: expanded from macro 'xhci_dbg'
           dev_dbg(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/usb/host/xhci-ring.c:308:2: note: Calling 'trace_xhci_ring_host_doorbell'
           trace_xhci_ring_host_doorbell(0, DB_VALUE_HOST);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-trace.h:577:1: note: Assuming the condition is true
   DEFINE_EVENT(xhci_log_doorbell, xhci_ring_host_doorbell,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:247:7: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-trace.h:577:1: note: Taking true branch
   DEFINE_EVENT(xhci_log_doorbell, xhci_ring_host_doorbell,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:247:3: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   drivers/usb/host/xhci-trace.h:577:1: note: Dereference of null pointer
   DEFINE_EVENT(xhci_log_doorbell, xhci_ring_host_doorbell,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:250:18: note: expanded from macro '__DECLARE_TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITION'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:188:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   Suppressed 119 warnings (107 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
>> drivers/spi/spi-intel.c:198:3: warning: Value stored to 'value' is never read [clang-analyzer-deadcode.DeadStores]
                   value = readl(ispi->sregs + SSFSTS_CTL);
                   ^
   drivers/spi/spi-intel.c:198:3: note: Value stored to 'value' is never read
>> drivers/spi/spi-intel.c:219:3: warning: Value stored to 'limit' is never read [clang-analyzer-deadcode.DeadStores]
                   limit = (value & PR_LIMIT_MASK) >> PR_LIMIT_SHIFT;
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-intel.c:219:3: note: Value stored to 'limit' is never read
                   limit = (value & PR_LIMIT_MASK) >> PR_LIMIT_SHIFT;
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-intel.c:220:3: warning: Value stored to 'base' is never read [clang-analyzer-deadcode.DeadStores]
                   base = value & PR_BASE_MASK;
                   ^      ~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-intel.c:220:3: note: Value stored to 'base' is never read
                   base = value & PR_BASE_MASK;
                   ^      ~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-intel.c:1144:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(part, 0, sizeof(*part));
           ^~~~~~
   drivers/spi/spi-intel.c:1144:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(part, 0, sizeof(*part));
           ^~~~~~
   drivers/spi/spi-intel.c:1197:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&chip, 0, sizeof(chip));
           ^~~~~~
   drivers/spi/spi-intel.c:1197:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&chip, 0, sizeof(chip));
           ^~~~~~
   drivers/spi/spi-intel.c:1198:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(chip.modalias, 8, "spi-nor");
           ^~~~~~~~
   drivers/spi/spi-intel.c:1198:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(chip.modalias, 8, "spi-nor");
           ^~~~~~~~
   Suppressed 55 warnings (42 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/misc/cardreader/rtsx_usb.c:113:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ucr->cmd_buf + SEQ_WRITE_DATA_OFFSET, data, len);
           ^~~~~~
   drivers/misc/cardreader/rtsx_usb.c:113:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ucr->cmd_buf + SEQ_WRITE_DATA_OFFSET, data, len);
           ^~~~~~
   drivers/misc/cardreader/rtsx_usb.c:505:10: warning: The left operand of '&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (val & cd_mask[card])
               ~~~ ^
   drivers/misc/cardreader/rtsx_usb.c:491:2: note: 'val' declared without an initial value
           u16 val;
           ^~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:497:8: note: Calling 'rtsx_usb_get_card_status'
           ret = rtsx_usb_get_card_status(ucr, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:291:7: note: 'status' is non-null
           if (!status)
                ^~~~~~
   drivers/misc/cardreader/rtsx_usb.c:291:2: note: Taking false branch
           if (!status)
           ^
   drivers/misc/cardreader/rtsx_usb.c:294:6: note: Assuming 'polling_pipe' is not equal to 0
           if (polling_pipe == 0) {
               ^~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:294:2: note: Taking false branch
           if (polling_pipe == 0) {
           ^
   drivers/misc/cardreader/rtsx_usb.c:308:9: note: Calling 'rtsx_usb_get_status_with_bulk'
                   ret = rtsx_usb_get_status_with_bulk(ucr, status);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:273:6: note: 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/misc/cardreader/rtsx_usb.c:273:2: note: Taking true branch
           if (ret)
           ^
   drivers/misc/cardreader/rtsx_usb.c:274:3: note: Returning without writing to '*status'
                   return ret;
                   ^
   drivers/misc/cardreader/rtsx_usb.c:308:9: note: Returning from 'rtsx_usb_get_status_with_bulk'
                   ret = rtsx_usb_get_status_with_bulk(ucr, status);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:312:6: note: Assuming 'ret' is >= 0
           if (ret < 0)
               ^~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:312:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/misc/cardreader/rtsx_usb.c:315:2: note: Returning without writing to '*'
           return 0;
           ^
   drivers/misc/cardreader/rtsx_usb.c:315:2: note: Returning zero, which participates in a condition later
           return 0;
           ^~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:497:8: note: Returning from 'rtsx_usb_get_card_status'
           ret = rtsx_usb_get_card_status(ucr, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:502:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/misc/cardreader/rtsx_usb.c:502:2: note: Taking false branch
           if (ret)
           ^
   drivers/misc/cardreader/rtsx_usb.c:505:10: note: The left operand of '&' is a garbage value
           if (val & cd_mask[card])
               ~~~ ^
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/usb/serial/ftdi_sio.c:1236:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &port->dev;
                          ^~~   ~~~~~~~~~~
   drivers/usb/serial/ftdi_sio.c:1236:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &port->dev;
--
           ^                 ~~~
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/media/dvb-frontends/dib9000.c:242:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(state->msg, 0, 2 * sizeof(struct i2c_msg));
           ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:242:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(state->msg, 0, 2 * sizeof(struct i2c_msg));
           ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:330:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&state->msg[0], 0, sizeof(struct i2c_msg));
           ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:330:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&state->msg[0], 0, sizeof(struct i2c_msg));
           ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:347:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&state->i2c_write_buffer[2], buf, l);
                   ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:347:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&state->i2c_write_buffer[2], buf, l);
                   ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:741:5: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(msg, block + 1, (*size) * 2);
                                   ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:741:5: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(msg, block + 1, (*size) * 2);
                                   ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:1988:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->channel_status, channel_status, sizeof(struct dvb_frontend_parametersContext));
           ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:1988:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->channel_status, channel_status, sizeof(struct dvb_frontend_parametersContext));
           ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:2034:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&state->fe[index_frontend]->dtv_property_cache, &fe->dtv_property_cache, sizeof(struct dtv_frontend_properties));
                   ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:2034:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&state->fe[index_frontend]->dtv_property_cache, &fe->dtv_property_cache, sizeof(struct dtv_frontend_properties));
                   ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:2486:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&st->chip.d9.cfg, cfg, sizeof(struct dib9000_config));
           ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:2486:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&st->chip.d9.cfg, cfg, sizeof(struct dib9000_config));
           ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:2507:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&st->fe[0]->ops, &dib9000_ops, sizeof(struct dvb_frontend_ops));
           ^~~~~~
   drivers/media/dvb-frontends/dib9000.c:2507:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&st->fe[0]->ops, &dib9000_ops, sizeof(struct dvb_frontend_ops));
           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   67 warnings generated.
   drivers/media/platform/renesas/vsp1/vsp1_histo.c:437:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
           ^~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_histo.c:437:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
           ^~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_histo.c:467:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(meta, 0, sizeof(*meta));
           ^~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_histo.c:467:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(meta, 0, sizeof(*meta));
           ^~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_histo.c:557:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(histo->video.name, sizeof(histo->video.name),
           ^~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_histo.c:557:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(histo->video.name, sizeof(histo->video.name),
           ^~~~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/media/platform/renesas/vsp1/vsp1_uif.c:261:2: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(name, "uif.%u", index + 4);
           ^~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_uif.c:261:2: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(name, "uif.%u", index + 4);
           ^~~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   71 warnings generated.
   drivers/media/platform/renesas/rcar_drif.c:289:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&dma_cfg, 0, sizeof(dma_cfg));
                   ^~~~~~
   drivers/media/platform/renesas/rcar_drif.c:289:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&dma_cfg, 0, sizeof(dma_cfg));
                   ^~~~~~
   drivers/media/platform/renesas/rcar_drif.c:584:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(vb2_plane_vaddr(&fbuf->vb.vb2_buf, 0) +
                   ^~~~~~
   drivers/media/platform/renesas/rcar_drif.c:584:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(vb2_plane_vaddr(&fbuf->vb.vb2_buf, 0) +
                   ^~~~~~
>> drivers/media/platform/renesas/rcar_drif.c:585:31: warning: Access to field 'addr' results in a dereference of an undefined pointer value [clang-analyzer-core.NullDereference]
                          i * sdr->hwbuf_size, buf[i]->addr, sdr->hwbuf_size);
                                               ^~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:535:6: note: Assuming the condition is false
           if (!vb2_is_streaming(&sdr->vb_queue)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:535:2: note: Taking false branch
           if (!vb2_is_streaming(&sdr->vb_queue)) {
           ^
   drivers/media/platform/renesas/rcar_drif.c:543:6: note: Assuming field 'num_cur_ch' is not equal to RCAR_DRIF_MAX_CHANNEL
           if (sdr->num_cur_ch == RCAR_DRIF_MAX_CHANNEL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:543:2: note: Taking false branch
           if (sdr->num_cur_ch == RCAR_DRIF_MAX_CHANNEL) {
           ^
   drivers/media/platform/renesas/rcar_drif.c:565:7: note: Assuming the condition is false
                   if (buf[0]->status & RCAR_DRIF_BUF_OVERFLOW) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:565:3: note: Taking false branch
                   if (buf[0]->status & RCAR_DRIF_BUF_OVERFLOW) {
                   ^
   drivers/media/platform/renesas/rcar_drif.c:576:2: note: Taking false branch
           rdrif_dbg(sdr, "ch%u: prod %u\n", ch->num, produced);
           ^
   drivers/media/platform/renesas/rcar_drif.c:139:2: note: expanded from macro 'rdrif_dbg'
           dev_dbg(sdr->v4l2_dev.dev, fmt, ## arg)
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/platform/renesas/rcar_drif.c:579:9: note: Calling 'rcar_drif_get_fbuf'
           fbuf = rcar_drif_get_fbuf(sdr);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:465:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&sdr->queued_bufs_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   drivers/media/platform/renesas/rcar_drif.c:465:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&sdr->queued_bufs_lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_irqsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/media/platform/renesas/rcar_drif.c:466:9: note: Left side of '||' is false
           fbuf = list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry_or_null'
           struct list_head *pos__ = READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/media/platform/renesas/rcar_drif.c:466:9: note: Left side of '||' is false
           fbuf = list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry_or_null'
           struct list_head *pos__ = READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/media/platform/renesas/rcar_drif.c:466:9: note: Left side of '||' is false
           fbuf = list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry_or_null'
           struct list_head *pos__ = READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   drivers/media/platform/renesas/rcar_drif.c:466:9: note: Left side of '||' is true
           fbuf = list_first_entry_or_null(&sdr->queued_bufs, struct
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry_or_null'
           struct list_head *pos__ = READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
--
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
   drivers/dma-buf/st-dma-fence.c:49:32: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           struct wait_cb cb = { .task = current };
                                         ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/dma-buf/st-dma-fence.c:48:20: note: Assuming 'intr' is false
           const int state = intr ? TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE;
                             ^~~~
   drivers/dma-buf/st-dma-fence.c:48:20: note: '?' condition is false
   drivers/dma-buf/st-dma-fence.c:49:32: note: Dereference of null pointer
           struct wait_cb cb = { .task = current };
                                         ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/power/supply/max1721x_battery.c:259:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(str, 13, "%04X%04X%04X", val[0], val[1], val[2]);
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:259:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(str, 13, "%04X%04X%04X", val[0], val[1], val[2]);
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:341:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(info->name, sizeof(info->name),
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:341:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(info->name, sizeof(info->name),
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:387:3: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(info->ManufacturerName, DEF_MFG_NAME,
                   ^~~~~~~
   drivers/power/supply/max1721x_battery.c:387:3: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
                   strncpy(info->ManufacturerName, DEF_MFG_NAME,
                   ^~~~~~~
   drivers/power/supply/max1721x_battery.c:406:4: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           strncpy(info->DeviceName, DEF_DEV_NAME_MAX17211,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:406:4: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
                           strncpy(info->DeviceName, DEF_DEV_NAME_MAX17211,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:410:4: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           strncpy(info->DeviceName, DEF_DEV_NAME_MAX17215,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:410:4: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
                           strncpy(info->DeviceName, DEF_DEV_NAME_MAX17215,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:414:4: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           strncpy(info->DeviceName, DEF_DEV_NAME_UNKNOWN,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:414:4: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
                           strncpy(info->DeviceName, DEF_DEV_NAME_UNKNOWN,
                           ^~~~~~~
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   66 warnings generated.
   Suppressed 66 warnings (54 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   64 warnings generated.
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   64 warnings generated.
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   69 warnings generated.
   drivers/media/platform/nvidia/tegra-vde/h264.c:309:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(vde->iram + 128, 0, macroblocks_nb / 2);
           ^~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:309:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(vde->iram + 128, 0, macroblocks_nb / 2);
           ^~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:872:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(h264, 0, sizeof(*h264));
           ^~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:872:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(h264, 0, sizeof(*h264));
           ^~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:873:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(vde->frames, 0, sizeof(vde->frames));
           ^~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:873:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(vde->frames, 0, sizeof(vde->frames));
           ^~~~~~
>> drivers/media/platform/nvidia/tegra-vde/trace.h:61:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   TRACE_EVENT(vde_ref_l0,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:931:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:931:2: note: Taking false branch
           if (err)
           ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:934:8: note: Calling 'tegra_vde_decode_begin'
           err = tegra_vde_decode_begin(vde, &h264, vde->frames,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:548:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:548:2: note: Taking false branch
           if (err)
           ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:552:6: note: 'err' is >= 0
           if (err < 0)
               ^~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:552:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:560:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:560:2: note: Taking false branch
           if (err) {
           ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:567:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:567:2: note: Taking false branch
           if (err) {
           ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:573:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:573:2: note: Taking false branch
           if (err) {
           ^
   drivers/media/platform/nvidia/tegra-vde/h264.c:581:8: note: Calling 'tegra_vde_setup_hw_context'
           err = tegra_vde_setup_hw_context(vde, ctx, dpb_frames,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:314:2: note: Calling 'tegra_vde_setup_iram_tables'
           tegra_vde_setup_iram_tables(vde, dpb_frames,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nvidia/tegra-vde/h264.c:211:2: note: Calling 'trace_vde_ref_l0'
           trace_vde_ref_l0(dpb_frames[0].frame_num);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nvidia/tegra-vde/trace.h:61:1: note: Assuming the condition is true
   TRACE_EVENT(vde_ref_l0,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:247:7: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nvidia/tegra-vde/trace.h:61:1: note: Taking true branch
   TRACE_EVENT(vde_ref_l0,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:247:3: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   drivers/media/platform/nvidia/tegra-vde/trace.h:61:1: note: Dereference of null pointer
   TRACE_EVENT(vde_ref_l0,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:250:18: note: expanded from macro '__DECLARE_TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITION'
   #define TP_CONDITION(args...)   args
--
           status = mos7840_get_uart_reg(port, LINE_CONTROL_REGISTER, &Data);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:639:2: note: Value stored to 'status' is never read
           status = mos7840_get_uart_reg(port, LINE_CONTROL_REGISTER, &Data);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:642:2: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status = mos7840_set_uart_reg(port, LINE_CONTROL_REGISTER, Data);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:642:2: note: Value stored to 'status' is never read
           status = mos7840_set_uart_reg(port, LINE_CONTROL_REGISTER, Data);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:647:2: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status = mos7840_get_reg_sync(port, mos7840_port->SpRegOffset, &Data);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:647:2: note: Value stored to 'status' is never read
           status = mos7840_get_reg_sync(port, mos7840_port->SpRegOffset, &Data);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:650:2: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status = mos7840_set_reg_sync(port, mos7840_port->SpRegOffset, Data);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:650:2: note: Value stored to 'status' is never read
           status = mos7840_set_reg_sync(port, mos7840_port->SpRegOffset, Data);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:653:2: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status = mos7840_set_reg_sync(port, mos7840_port->SpRegOffset, Data);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:653:2: note: Value stored to 'status' is never read
           status = mos7840_set_reg_sync(port, mos7840_port->SpRegOffset, Data);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:656:2: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status = mos7840_set_uart_reg(port, INTERRUPT_ENABLE_REGISTER, Data);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:656:2: note: Value stored to 'status' is never read
           status = mos7840_set_uart_reg(port, INTERRUPT_ENABLE_REGISTER, Data);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:660:2: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status = mos7840_get_reg_sync(port, mos7840_port->ControlRegOffset,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:660:2: note: Value stored to 'status' is never read
           status = mos7840_get_reg_sync(port, mos7840_port->ControlRegOffset,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:663:2: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status = mos7840_set_reg_sync(port, mos7840_port->ControlRegOffset,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:663:2: note: Value stored to 'status' is never read
           status = mos7840_set_reg_sync(port, mos7840_port->ControlRegOffset,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:668:2: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status = mos7840_get_reg_sync(port, mos7840_port->ControlRegOffset,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:668:2: note: Value stored to 'status' is never read
           status = mos7840_get_reg_sync(port, mos7840_port->ControlRegOffset,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:671:2: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status = mos7840_set_reg_sync(port, mos7840_port->ControlRegOffset,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:671:2: note: Value stored to 'status' is never read
           status = mos7840_set_reg_sync(port, mos7840_port->ControlRegOffset,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:886:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(urb->transfer_buffer, current_position, transfer_size);
           ^~~~~~
   drivers/usb/serial/mos7840.c:886:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(urb->transfer_buffer, current_position, transfer_size);
           ^~~~~~
   drivers/usb/serial/mos7840.c:1140:3: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
                   status = mos7840_calc_baud_rate_divisor(port, baudRate, &divisor,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:1140:3: note: Value stored to 'status' is never read
                   status = mos7840_calc_baud_rate_divisor(port, baudRate, &divisor,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:1202:2: warning: Value stored to 'lData' is never read [clang-analyzer-deadcode.DeadStores]
           lData = LCR_BITS_8;
           ^
   drivers/usb/serial/mos7840.c:1202:2: note: Value stored to 'lData' is never read
   drivers/usb/serial/mos7840.c:1203:2: warning: Value stored to 'lStop' is never read [clang-analyzer-deadcode.DeadStores]
           lStop = LCR_STOP_1;
           ^
   drivers/usb/serial/mos7840.c:1203:2: note: Value stored to 'lStop' is never read
   drivers/usb/serial/mos7840.c:1306:2: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status = mos7840_send_cmd_write_baud_rate(mos7840_port, baud);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:1306:2: note: Value stored to 'status' is never read
           status = mos7840_send_cmd_write_baud_rate(mos7840_port, baud);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:1387:26: warning: Value stored to 'port' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct usb_serial_port *port = tty->driver_data;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:1387:26: note: Value stored to 'port' during its initialization is never read
           struct usb_serial_port *port = tty->driver_data;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:1516:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &serial->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:1516:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &serial->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   67 warnings generated.
>> drivers/media/platform/rockchip/rga/rga.c:73:33: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
                                                 ^~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:61:9: note: Calling 'rga_read'
           intr = rga_read(rga, RGA_INT) & 0xf;
                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.h:102:2: note: Returning without writing to 'rga->curr'
           return readl(rga->regs + reg);
           ^
   drivers/media/platform/rockchip/rga/rga.c:61:9: note: Returning from 'rga_read'
           intr = rga_read(rga, RGA_INT) & 0xf;
                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:63:2: note: Calling 'rga_mod'
           rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.h:107:13: note: Calling 'rga_read'
           u32 temp = rga_read(rga, reg) & ~(mask);
                      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.h:102:2: note: Returning without writing to 'rga->curr'
           return readl(rga->regs + reg);
           ^
   drivers/media/platform/rockchip/rga/rga.h:107:13: note: Returning from 'rga_read'
           u32 temp = rga_read(rga, reg) & ~(mask);
                      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.h:110:2: note: Calling 'rga_write'
           rga_write(rga, reg, temp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.h:98:1: note: Returning without writing to 'rga->curr'
   };
   ^
   drivers/media/platform/rockchip/rga/rga.h:110:2: note: Returning from 'rga_write'
           rga_write(rga, reg, temp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.h:111:1: note: Returning without writing to 'rga->curr'
   };
   ^
   drivers/media/platform/rockchip/rga/rga.c:63:2: note: Returning from 'rga_mod'
           rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:65:6: note: Assuming the condition is true
           if (intr & 0x04) {
               ^~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:65:2: note: Taking true branch
           if (intr & 0x04) {
           ^
   drivers/media/platform/rockchip/rga/rga.c:67:3: note: 'ctx' initialized here
                   struct rga_ctx *ctx = rga->curr;
                   ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:69:11: note: Assuming 'ctx' is null
                   WARN_ON(!ctx);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:73:33: note: Dereference of null pointer
                   src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
                                                 ^~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:79:17: warning: Access to field 'timecode' results in a dereference of a null pointer (loaded from variable 'dst') [clang-analyzer-core.NullDereference]
                   dst->timecode = src->timecode;
                   ~~~           ^
   drivers/media/platform/rockchip/rga/rga.c:65:6: note: Assuming the condition is true
           if (intr & 0x04) {
               ^~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:65:2: note: Taking true branch
           if (intr & 0x04) {
           ^
   drivers/media/platform/rockchip/rga/rga.c:69:11: note: Assuming 'ctx' is non-null
                   WARN_ON(!ctx);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:74:3: note: Value assigned to 'dst'
                   dst = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:76:11: note: Assuming 'src' is non-null
                   WARN_ON(!src);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:77:11: note: Assuming 'dst' is null
                   WARN_ON(!dst);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:79:17: note: Access to field 'timecode' results in a dereference of a null pointer (loaded from variable 'dst')
                   dst->timecode = src->timecode;
                   ~~~           ^
   drivers/media/platform/rockchip/rga/rga.c:79:19: warning: Access to field 'timecode' results in a dereference of a null pointer (loaded from variable 'src') [clang-analyzer-core.NullDereference]
                   dst->timecode = src->timecode;
                                   ^~~
   drivers/media/platform/rockchip/rga/rga.c:65:6: note: Assuming the condition is true
           if (intr & 0x04) {
               ^~~~~~~~~~~
   drivers/media/platform/rockchip/rga/rga.c:65:2: note: Taking true branch
           if (intr & 0x04) {
           ^
   drivers/media/platform/rockchip/rga/rga.c:69:11: note: Assuming 'ctx' is non-null
                   WARN_ON(!ctx);
--
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:933:6: note: Left side of '||' is false
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:933:18: note: Assuming 'dst_buf' is non-null
           if (!src_buf || !dst_buf) {
                           ^~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:933:2: note: Taking false branch
           if (!src_buf || !dst_buf) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:939:7: note: 'q_data_cap' is non-null
           if (!q_data_cap)
                ^~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:939:2: note: Taking false branch
           if (!q_data_cap)
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:942:7: note: 'q_data_out' is non-null
           if (!q_data_out)
                ^~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:942:2: note: Taking false branch
           if (!q_data_out)
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:950:6: note: Assuming field 'colplanes' is equal to field 'num_planes'
           if (q_data_cap->fmt->colplanes != dst_buf->vb2_buf.num_planes) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:950:2: note: Taking false branch
           if (q_data_cap->fmt->colplanes != dst_buf->vb2_buf.num_planes) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:956:6: note: Assuming field 'jpeg_parse_error' is false
           if (jpeg_src_buf->jpeg_parse_error) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:956:2: note: Taking false branch
           if (jpeg_src_buf->jpeg_parse_error) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:971:11: note: Field 'slot' is < MXC_MAX_SLOTS
           if (ctx->slot >= MXC_MAX_SLOTS) {
                    ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:971:2: note: Taking false branch
           if (ctx->slot >= MXC_MAX_SLOTS) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:975:2: note: Taking false branch
           if (!mxc_jpeg_alloc_slot_data(jpeg, ctx->slot)) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:983:6: note: Assuming field 'mode' is equal to MXC_JPEG_ENCODE
           if (jpeg->mode == MXC_JPEG_ENCODE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:983:2: note: Taking true branch
           if (jpeg->mode == MXC_JPEG_ENCODE) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:984:3: note: Taking false branch
                   dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:986:3: note: Calling 'mxc_jpeg_config_enc_desc'
                   mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:901:12: note: Calling 'mxc_jpeg_fourcc_to_imgfmt'
           img_fmt = mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:402:2: note: Control jumps to the 'default' case at line 415
           switch (fourcc) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:416:3: note: Returning the value -1
                   return MXC_JPEG_INVALID;
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:901:12: note: Returning from 'mxc_jpeg_fourcc_to_imgfmt'
           img_fmt = mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:901:2: note: The value -1 is assigned to 'img_fmt'
           img_fmt = mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:902:6: note: 'img_fmt' is equal to MXC_JPEG_INVALID
           if (img_fmt == MXC_JPEG_INVALID)
               ^~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:902:2: note: Taking true branch
           if (img_fmt == MXC_JPEG_INVALID)
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:903:3: note: Loop condition is false.  Exiting loop
                   dev_err(jpeg->dev, "No valid image format detected\n");
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_subsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:905:5: note: The result of the left shift is undefined because the left operand is negative
                            STM_CTRL_IMAGE_FORMAT(img_fmt);
                            ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h:84:52: note: expanded from macro 'STM_CTRL_IMAGE_FORMAT'
   #define STM_CTRL_IMAGE_FORMAT(img_fmt)          ((img_fmt) << 3)
                                                    ~~~~~~~~~ ^
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1019:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1019:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1046:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1046:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1231:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (!q->sizeimage[0])
                       ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1823:8: note: Calling 'mxc_jpeg_try_fmt_vid_out'
           ret = mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1720:16: note: Assuming field 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type = (jpeg->mode == MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1720:15: note: '?' condition is false
           int q_type = (jpeg->mode == MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Assuming field 'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TYPE_IS_MULTIPLANAR'
           ((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Left side of '||' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TYPE_IS_MULTIPLANAR'
           ((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Assuming field 'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TYPE_IS_MULTIPLANAR'
            || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:2: note: Taking false branch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:7: note: 'fmt' is non-null
           if (!fmt || fmt->flags != q_type) {
                ^~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:6: note: Left side of '||' is false
           if (!fmt || fmt->flags != q_type) {
               ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:14: note: Assuming 'q_type' is equal to field 'flags'
           if (!fmt || fmt->flags != q_type) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:2: note: Taking false branch
           if (!fmt || fmt->flags != q_type) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1739:9: note: Calling 'mxc_jpeg_try_fmt'
           return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1615:11: note: Assuming field 'width' is >= MXC_JPEG_MAX_WIDTH
           u32 w = (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1615:10: note: '?' condition is false
           u32 w = (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1617:11: note: Assuming field 'height' is >= MXC_JPEG_MAX_HEIGHT
           u32 h = (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1617:10: note: '?' condition is false
           u32 h = (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:14: note: Assuming 'i' is >= field 'num_planes'
           for (i = 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:2: note: Loop condition is false. Execution continues on line 1655
           for (i = 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1655:2: note: Calling 'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:6: note: Assuming the condition is true
           if (q->fmt->fourcc == V4L2_PIX_FMT_JPEG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:2: note: Taking true branch
           if (q->fmt->fourcc == V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1655:2: note: Returning from 'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1656:2: note: Calling 'mxc_jpeg_sizeimage'
           mxc_jpeg_sizeimage(&tmp_q);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1229:2: note: Taking true branch
           if (q->fmt->fourcc == V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1231:7: note: Branch condition evaluates to a garbage value
                   if (!q->sizeimage[0])
                       ^~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1261:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&header, 0, sizeof(header));
--
                   ^~~~~~
   drivers/virtio/virtio_pci_modern.c:129:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&l, buf + sizeof l, sizeof l);
                   ^~~~~~
   drivers/virtio/virtio_pci_modern.c:129:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&l, buf + sizeof l, sizeof l);
                   ^~~~~~
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/staging/iio/meter/ade7854.c:38:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/staging/iio/meter/ade7854.c:38:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/staging/iio/meter/ade7854.c:55:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/staging/iio/meter/ade7854.c:55:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/staging/iio/meter/ade7854.c:72:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/staging/iio/meter/ade7854.c:72:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/staging/iio/meter/ade7854.c:89:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/staging/iio/meter/ade7854.c:89:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   73 warnings generated.
   Suppressed 73 warnings (61 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   70 warnings generated.
   drivers/usb/musb/musb_gadget.c:36:25: warning: Value stored to 'dma' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct dma_controller *dma = musb->dma_controller;
                                  ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:36:25: note: Value stored to 'dma' during its initialization is never read
           struct dma_controller *dma = musb->dma_controller;
                                  ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:86:18: warning: Value stored to 'musb_ep' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb_ep *musb_ep = request->ep;
                           ^~~~~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:86:18: note: Value stored to 'musb_ep' during its initialization is never read
           struct musb_ep *musb_ep = request->ep;
                           ^~~~~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:160:16: warning: Value stored to 'musb' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb             *musb = ep->musb;
                                    ^~~~   ~~~~~~~~
   drivers/usb/musb/musb_gadget.c:160:16: note: Value stored to 'musb' during its initialization is never read
           struct musb             *musb = ep->musb;
                                    ^~~~   ~~~~~~~~
   drivers/usb/musb/musb_gadget.c:162:16: warning: Value stored to 'epio' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           void __iomem *epio = ep->musb->endpoints[ep->current_epnum].regs;
                         ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:162:16: note: Value stored to 'epio' during its initialization is never read
           void __iomem *epio = ep->musb->endpoints[ep->current_epnum].regs;
                         ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:593:4: warning: Value stored to 'use_mode_1' is never read [clang-analyzer-deadcode.DeadStores]
                           use_mode_1 = 1;
                           ^            ~
   drivers/usb/musb/musb_gadget.c:593:4: note: Value stored to 'use_mode_1' is never read
                           use_mode_1 = 1;
                           ^            ~
   drivers/usb/musb/musb_gadget.c:595:4: warning: Value stored to 'use_mode_1' is never read [clang-analyzer-deadcode.DeadStores]
                           use_mode_1 = 0;
                           ^            ~
   drivers/usb/musb/musb_gadget.c:595:4: note: Value stored to 'use_mode_1' is never read
                           use_mode_1 = 0;
                           ^            ~
   drivers/usb/musb/musb_gadget.c:1696:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ep, 0, sizeof *ep);
           ^~~~~~
   drivers/usb/musb/musb_gadget.c:1696:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(ep, 0, sizeof *ep);
           ^~~~~~
   drivers/usb/musb/musb_gadget.c:1705:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(ep->name, "ep%d%s", epnum,
           ^~~~~~~
   drivers/usb/musb/musb_gadget.c:1705:2: note: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(ep->name, "ep%d%s", epnum,
           ^~~~~~~
   Suppressed 62 warnings (49 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   66 warnings generated.
>> drivers/staging/media/imx/imx-media-dev-common.c:27:24: warning: Value stored to 'imxmd' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct imx_media_dev *imxmd = notifier2dev(notifier);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-dev-common.c:27:24: note: Value stored to 'imxmd' during its initialization is never read
           struct imx_media_dev *imxmd = notifier2dev(notifier);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-dev-common.c:370:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(imxmd->md.bus_info, sizeof(imxmd->md.bus_info),
           ^~~~~~~~
   drivers/staging/media/imx/imx-media-dev-common.c:370:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(imxmd->md.bus_info, sizeof(imxmd->md.bus_info),
           ^~~~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   64 warnings generated.
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   70 warnings generated.
   drivers/staging/media/imx/imx-media-utils.c:440:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&format, 0, sizeof(format));
                   ^~~~~~
   drivers/staging/media/imx/imx-media-utils.c:440:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&format, 0, sizeof(format));
                   ^~~~~~
   drivers/staging/media/imx/imx-media-utils.c:609:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(sd_name, sz, "ipu%d_csi%d", ipu_id + 1, id);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:609:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(sd_name, sz, "ipu%d_csi%d", ipu_id + 1, id);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:612:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(sd_name, sz, "ipu%d_vdic", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:612:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(sd_name, sz, "ipu%d_vdic", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:615:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(sd_name, sz, "ipu%d_ic_prp", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:615:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(sd_name, sz, "ipu%d_ic_prp", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:618:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(sd_name, sz, "ipu%d_ic_prpenc", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:618:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(sd_name, sz, "ipu%d_ic_prpenc", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:621:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(sd_name, sz, "ipu%d_ic_prpvf", ipu_id + 1);
                   ^~~~~~~~
   drivers/staging/media/imx/imx-media-utils.c:621:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(sd_name, sz, "ipu%d_ic_prpvf", ipu_id + 1);
                   ^~~~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/usb/serial/option.c:2258:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &port->dev;
                          ^~~   ~~~~~~~~~~
   drivers/usb/serial/option.c:2258:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &port->dev;
                          ^~~   ~~~~~~~~~~
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/usb/serial/safe_serial.c:242:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buf + count, '0', pkt_len - count - trailer_len);
                   ^~~~~~
   drivers/usb/serial/safe_serial.c:242:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(buf + count, '0', pkt_len - count - trailer_len);
                   ^~~~~~
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/usb/serial/sierra.c:468:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer, buf, writesize);
           ^~~~~~
   drivers/usb/serial/sierra.c:468:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buffer, buf, writesize);
           ^~~~~~
>> drivers/usb/serial/sierra.c:531:2: warning: Value stored to 'endpoint' is never read [clang-analyzer-deadcode.DeadStores]
           endpoint = usb_pipeendpoint(urb->pipe);
           ^
   drivers/usb/serial/sierra.c:531:2: note: Value stored to 'endpoint' is never read
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/i2c/busses/i2c-diolan-u2c.c:467:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dev->adapter.name, sizeof(dev->adapter.name),
           ^~~~~~~~
   drivers/i2c/busses/i2c-diolan-u2c.c:467:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dev->adapter.name, sizeof(dev->adapter.name),
           ^~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/i2c/busses/i2c-dln2.c:91:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tx->buf, data, data_len);
           ^~~~~~
   drivers/i2c/busses/i2c-dln2.c:91:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(tx->buf, data, data_len);
           ^~~~~~
   drivers/i2c/busses/i2c-dln2.c:135:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, rx->buf, data_len);
           ^~~~~~
   drivers/i2c/busses/i2c-dln2.c:135:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, rx->buf, data_len);
           ^~~~~~
   drivers/i2c/busses/i2c-dln2.c:214:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dln2->adapter.name, sizeof(dln2->adapter.name), "%s-%s-%d",
           ^~~~~~~~
   drivers/i2c/busses/i2c-dln2.c:214:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dln2->adapter.name, sizeof(dln2->adapter.name), "%s-%s-%d",
           ^~~~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   Suppressed 62 warnings (50 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/media/dvb-frontends/si21xx.c:238:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(msg.buf + 1, data, len);
           ^~~~~~
   drivers/media/dvb-frontends/si21xx.c:238:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(msg.buf + 1, data, len);
           ^~~~~~
   drivers/media/dvb-frontends/si21xx.c:931:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &si21xx_ops,
           ^~~~~~
   drivers/media/dvb-frontends/si21xx.c:931:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &si21xx_ops,
           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/media/dvb-frontends/sp887x.c:178:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&buf[2], mem + i, c);
                   ^~~~~~
   drivers/media/dvb-frontends/sp887x.c:178:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&buf[2], mem + i, c);
                   ^~~~~~
   drivers/media/dvb-frontends/sp887x.c:456:39: warning: The result of the left shift is undefined because the left operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
                  (sp887x_readreg(state, 0xc07) << 6);
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/media/dvb-frontends/sp887x.c:456:10: note: Calling 'sp887x_readreg'
                  (sp887x_readreg(state, 0xc07) << 6);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/sp887x.c:84:6: note: Assuming the condition is true
           if ((ret = i2c_transfer(state->i2c, msg, 2)) != 2) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/sp887x.c:84:2: note: Taking true branch
           if ((ret = i2c_transfer(state->i2c, msg, 2)) != 2) {
           ^
   drivers/media/dvb-frontends/sp887x.c:85:3: note: Loop condition is false.  Exiting loop
                   printk("%s: readreg error (ret == %i)\n", __func__, ret);
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/media/dvb-frontends/sp887x.c:86:3: note: Returning the value -1
--
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/emxx_udc/emxx_udc.c:2757:3: note: Value stored to 'data' is never read
                   data = _nbu2ss_readl(&preg->EP_REGS[ep->epnum - 1].EP_LEN_DCNT)
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/emxx_udc/emxx_udc.c:2783:11: warning: Access to field 'dev' results in a dereference of a null pointer (loaded from field 'udc') [clang-analyzer-core.NullDereference]
                   dev_err(ep->udc->dev, "%s, bad udc\n", __func__);
                           ^
   include/linux/dev_printk.h:144:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   drivers/staging/emxx_udc/emxx_udc.c:2774:6: note: Assuming '_ep' is non-null
           if (!_ep) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2774:2: note: Taking false branch
           if (!_ep) {
           ^
   drivers/staging/emxx_udc/emxx_udc.c:2782:6: note: Assuming 'udc' is null
           if (!udc) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2782:2: note: Taking true branch
           if (!udc) {
           ^
   drivers/staging/emxx_udc/emxx_udc.c:2783:3: note: Loop condition is false.  Exiting loop
                   dev_err(ep->udc->dev, "%s, bad udc\n", __func__);
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_subsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/staging/emxx_udc/emxx_udc.c:2783:11: note: Access to field 'dev' results in a dereference of a null pointer (loaded from field 'udc')
                   dev_err(ep->udc->dev, "%s, bad udc\n", __func__);
                           ^
   include/linux/dev_printk.h:144:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   drivers/staging/emxx_udc/emxx_udc.c:3080:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(udc, 0, sizeof(struct nbu2ss_udc));
           ^~~~~~
   drivers/staging/emxx_udc/emxx_udc.c:3080:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(udc, 0, sizeof(struct nbu2ss_udc));
           ^~~~~~
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/media/platform/rockchip/rga/rga-hw.c:382:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
           ^~~~~~
   drivers/media/platform/rockchip/rga/rga-hw.c:382:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
           ^~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   64 warnings generated.
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   64 warnings generated.
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/media/v4l2-core/v4l2-fwnode.c:544:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(link, 0, sizeof(*link));
           ^~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:544:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(link, 0, sizeof(*link));
           ^~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:658:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(connector, 0, sizeof(*connector));
           ^~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:658:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(connector, 0, sizeof(*connector));
           ^~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:745:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(props, 0, sizeof(*props));
           ^~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:745:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(props, 0, sizeof(*props));
           ^~~~~~
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   65 warnings generated.
>> drivers/media/platform/st/stm32/dma2d/dma2d.c:531:33: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
                                                 ^~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/dma2d/dma2d.c:521:2: note: 'ctx' initialized here
           struct dma2d_ctx *ctx = dev->curr;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/dma2d/dma2d.c:526:6: note: Assuming the condition is true
           if (s & ISR_TCIF || s == 0) {
               ^~~~~~~~~~~~
   drivers/media/platform/st/stm32/dma2d/dma2d.c:526:19: note: Left side of '||' is true
           if (s & ISR_TCIF || s == 0) {
                            ^
   drivers/media/platform/st/stm32/dma2d/dma2d.c:529:11: note: Assuming 'ctx' is null
                   WARN_ON(!ctx);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/media/platform/st/stm32/dma2d/dma2d.c:531:33: note: Dereference of null pointer
                   src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
                                                 ^~~~~~~~~~~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/i2c/busses/i2c-viperboard.c:204:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(msg->buf + start, rmsg, len1);
                   ^~~~~~
   drivers/i2c/busses/i2c-viperboard.c:204:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(msg->buf + start, rmsg, len1);
                   ^~~~~~
   drivers/i2c/busses/i2c-viperboard.c:212:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(msg->buf + start + 512, rmsg, len2);
                           ^~~~~~
   drivers/i2c/busses/i2c-viperboard.c:212:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(msg->buf + start + 512, rmsg, len2);
                           ^~~~~~
   drivers/i2c/busses/i2c-viperboard.c:252:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(wmsg->data, msg->buf + start,
                   ^~~~~~
   drivers/i2c/busses/i2c-viperboard.c:252:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(wmsg->data, msg->buf + start,
                   ^~~~~~
   drivers/i2c/busses/i2c-viperboard.c:313:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = vprbrd_i2c_write(vb, pmsg);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-viperboard.c:313:4: note: Value stored to 'ret' is never read
                           ret = vprbrd_i2c_write(vb, pmsg);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-viperboard.c:377:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(vb_i2c->i2c.name, sizeof(vb_i2c->i2c.name),
           ^~~~~~~~
   drivers/i2c/busses/i2c-viperboard.c:377:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(vb_i2c->i2c.name, sizeof(vb_i2c->i2c.name),
           ^~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/virtio/virtio_pci_common.c:141:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
           ^~~~~~~~
   drivers/virtio/virtio_pci_common.c:141:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
           ^~~~~~~~
   drivers/virtio/virtio_pci_common.c:160:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
                   ^~~~~~~~
   drivers/virtio/virtio_pci_common.c:160:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
                   ^~~~~~~~
   drivers/virtio/virtio_pci_common.c:335:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(vp_dev->msix_names[msix_vec],
                   ^~~~~~~~
   drivers/virtio/virtio_pci_common.c:335:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(vp_dev->msix_names[msix_vec],
                   ^~~~~~~~
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   68 warnings generated.
   drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:339:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
           ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:339:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
--
           ^~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:1072:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pkt, 0, sizeof(pkt));
           ^~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:1072:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&pkt, 0, sizeof(pkt));
           ^~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:1349:2: warning: Value stored to 'cpu_boot_dev_sts1' is never read [clang-analyzer-deadcode.DeadStores]
           cpu_boot_dev_sts1 = prop->fw_preboot_cpu_boot_dev_sts1;
           ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:1349:2: note: Value stored to 'cpu_boot_dev_sts1' is never read
           cpu_boot_dev_sts1 = prop->fw_preboot_cpu_boot_dev_sts1;
           ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:1624:2: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
           rc = hl_fw_dynamic_send_clear_cmd(hdev, fw_loader);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:1624:2: note: Value stored to 'rc' is never read
           rc = hl_fw_dynamic_send_clear_cmd(hdev, fw_loader);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:2292:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:2292:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:2740:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pkt, 0, sizeof(pkt));
           ^~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:2740:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&pkt, 0, sizeof(pkt));
           ^~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:2771:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pkt, 0, sizeof(pkt));
           ^~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:2771:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&pkt, 0, sizeof(pkt));
           ^~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:2790:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pkt, 0, sizeof(pkt));
           ^~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:2790:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&pkt, 0, sizeof(pkt));
           ^~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:2813:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pkt, 0, sizeof(pkt));
           ^~~~~~
   drivers/misc/habanalabs/common/firmware_if.c:2813:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&pkt, 0, sizeof(pkt));
           ^~~~~~
   Suppressed 80 warnings (68 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/leds/leds-lp3952.c:104:2: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(dest, str, LP3952_LABEL_MAX_LEN);
           ^~~~~~~
   drivers/leds/leds-lp3952.c:104:2: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(dest, str, LP3952_LABEL_MAX_LEN);
           ^~~~~~~
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   132 warnings generated.
   drivers/usb/host/xhci-mtk-sch.c:83:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, DBG_BUF_EN, "%s ep%d%s %s, mpkt:%d, interval:%d/%d%s",
           ^~~~~~~~
   drivers/usb/host/xhci-mtk-sch.c:83:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(buf, DBG_BUF_EN, "%s ep%d%s %s, mpkt:%d, interval:%d/%d%s",
           ^~~~~~~~
>> drivers/usb/host/xhci-mtk-sch.c:729:19: warning: Value stored to 'xhci' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xhci_hcd *xhci = hcd_to_xhci(hcd);
                            ^~~~   ~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mtk-sch.c:729:19: note: Value stored to 'xhci' during its initialization is never read
           struct xhci_hcd *xhci = hcd_to_xhci(hcd);
                            ^~~~   ~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mtk-sch.c:791:19: warning: Value stored to 'xhci' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xhci_hcd *xhci = hcd_to_xhci(hcd);
                            ^~~~   ~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mtk-sch.c:791:19: note: Value stored to 'xhci' during its initialization is never read
           struct xhci_hcd *xhci = hcd_to_xhci(hcd);
                            ^~~~   ~~~~~~~~~~~~~~~~
   Suppressed 129 warnings (117 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (39 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   69 warnings generated.
   drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c:198:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(inst->work_bufs[i].va, tmp_va, wb[i].size);
                           ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c:198:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(inst->work_bufs[i].va, tmp_va, wb[i].size);
                           ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c:284:2: warning: Call to function 'memmove' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(bs_buf->va + bs_hdr_len + ac_tag_size,
           ^~~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c:284:2: note: Call to function 'memmove' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memmove_s' in case of C11
           memmove(bs_buf->va + bs_hdr_len + ac_tag_size,
           ^~~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c:286:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(bs_buf->va + ac_tag_size,
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c:286:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(bs_buf->va + ac_tag_size,
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c:289:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(bs_buf->va, ac_tag, ac_tag_size);
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c:289:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(bs_buf->va, ac_tag, ac_tag_size);
           ^~~~~~
   Suppressed 65 warnings (53 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   70 warnings generated.
   drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c:301:5: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(inst->work_bufs[i].va, tmp_va,
                                   ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c:301:5: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(inst->work_bufs[i].va, tmp_va,
                                   ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c:429:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(bs_buf->va + bs_size_sps, inst->pps_buf.va, bs_size_pps);
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c:429:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(bs_buf->va + bs_size_sps, inst->pps_buf.va, bs_size_pps);
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c:462:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(bs_buf->va,
                   ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c:462:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(bs_buf->va,
                   ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c:495:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(p, h264_filler_marker, ARRAY_SIZE(h264_filler_marker));
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c:495:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(p, h264_filler_marker, ARRAY_SIZE(h264_filler_marker));
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c:498:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(p, 0xff, size);
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c:498:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(p, 0xff, size);
           ^~~~~~
   Suppressed 65 warnings (53 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/iio/adc/ti-ads131e08.c:90:8: warning: Excessive padding in 'struct ads131e08_state' (285 padding bytes, where 29 is optimal). Optimal fields order: tx_buf, rx_buf, info, spi, trig, adc_clk, vref_reg, channel_config, tmp_buf, completion, data_rate, vref_mv, sdecode_delay_us, reset_delay_us, readback_len, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct ads131e08_state {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads131e08.c:90:8: note: Excessive padding in 'struct ads131e08_state' (285 padding bytes, where 29 is optimal). Optimal fields order: tx_buf, rx_buf, info, spi, trig, adc_clk, vref_reg, channel_config, tmp_buf, completion, data_rate, vref_mv, sdecode_delay_us, reset_delay_us, readback_len, consider reordering the fields or adding explicit padding members
   struct ads131e08_state {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads131e08.c:657:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dest + tweek_offset, src, num_bytes);
                   ^~~~~~
   drivers/iio/adc/ti-ads131e08.c:657:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dest + tweek_offset, src, num_bytes);
                   ^~~~~~
   Suppressed 62 warnings (50 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   66 warnings generated.
   drivers/staging/media/hantro/hantro_v4l2.c:108:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform: %s",
           ^~~~~~~~
   drivers/staging/media/hantro/hantro_v4l2.c:108:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform: %s",
--
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c:1286:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(q_data, 0, sizeof(struct mtk_q_data));
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c:1319:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(q_data, 0, sizeof(struct mtk_q_data));
           ^~~~~~
   drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c:1319:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(q_data, 0, sizeof(struct mtk_q_data));
           ^~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   66 warnings generated.
   drivers/media/cec/core/cec-api.c:156:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&log_addrs, &adap->log_addrs, sizeof(log_addrs));
           ^~~~~~
   drivers/media/cec/core/cec-api.c:156:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&log_addrs, &adap->log_addrs, sizeof(log_addrs));
           ^~~~~~
   drivers/media/cec/core/cec-api.c:158:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(log_addrs.log_addr, CEC_LOG_ADDR_INVALID,
                   ^~~~~~
   drivers/media/cec/core/cec-api.c:158:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(log_addrs.log_addr, CEC_LOG_ADDR_INVALID,
                   ^~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/media/cec/core/cec-api.c:645:6: note: Assuming 'fh' is equal to field 'cec_initiator'
           if (adap->cec_initiator == fh)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:645:2: note: Taking true branch
           if (adap->cec_initiator == fh)
           ^
   drivers/media/cec/core/cec-api.c:647:6: note: Assuming 'fh' is equal to field 'cec_follower'
           if (adap->cec_follower == fh) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:647:2: note: Taking true branch
           if (adap->cec_follower == fh) {
           ^
   drivers/media/cec/core/cec-api.c:651:6: note: Assuming the condition is false
           if (fh->mode_follower == CEC_MODE_FOLLOWER)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:651:2: note: Taking false branch
           if (fh->mode_follower == CEC_MODE_FOLLOWER)
           ^
   drivers/media/cec/core/cec-api.c:653:6: note: Assuming the condition is true
           if (fh->mode_follower == CEC_MODE_MONITOR_PIN)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:653:2: note: Taking true branch
           if (fh->mode_follower == CEC_MODE_MONITOR_PIN)
           ^
   drivers/media/cec/core/cec-api.c:655:2: note: Taking false branch
           if (fh->mode_follower == CEC_MODE_MONITOR_ALL)
           ^
   drivers/media/cec/core/cec-api.c:664:6: note: Assuming the condition is false
           if (cec_is_registered(adap) && list_empty(&devnode->fhs) &&
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:664:30: note: Left side of '&&' is false
           if (cec_is_registered(adap) && list_empty(&devnode->fhs) &&
                                       ^
   drivers/media/cec/core/cec-api.c:672:2: note: Loop condition is false. Execution continues on line 680
           while (!list_empty(&fh->xfer_list)) {
           ^
   drivers/media/cec/core/cec-api.c:681:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&fh->msgs)) {
           ^
   drivers/media/cec/core/cec-api.c:686:3: note: Memory is released
                   kfree(entry);
                   ^~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:681:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&fh->msgs)) {
           ^
   drivers/media/cec/core/cec-api.c:685:3: note: Calling 'list_del'
                   list_del(&entry->list);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 63 warnings (51 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/thermal/rcar_thermal.c:375:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = rcar_priv_to_dev(priv);
                          ^~~
   drivers/thermal/rcar_thermal.c:375:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = rcar_priv_to_dev(priv);
                          ^~~
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
>> drivers/watchdog/pcwd_usb.c:170:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &usb_pcwd->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_usb.c:170:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &usb_pcwd->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_usb.c:694:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(fw_ver_str, "%u.%02u", fw_rev_major, fw_rev_minor);
                   ^~~~~~~
   drivers/watchdog/pcwd_usb.c:694:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(fw_ver_str, "%u.%02u", fw_rev_major, fw_rev_minor);
                   ^~~~~~~
   drivers/watchdog/pcwd_usb.c:696:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(fw_ver_str, "<card no answer>");
                   ^~~~~~~
   drivers/watchdog/pcwd_usb.c:696:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(fw_ver_str, "<card no answer>");
                   ^~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (38 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/media/dvb-frontends/dib3000mb.c:755:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->config,config,sizeof(struct dib3000_config));
           ^~~~~~
   drivers/media/dvb-frontends/dib3000mb.c:755:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->config,config,sizeof(struct dib3000_config));
           ^~~~~~
   drivers/media/dvb-frontends/dib3000mb.c:765:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &dib3000mb_ops, sizeof(struct dvb_frontend_ops));
           ^~~~~~
   drivers/media/dvb-frontends/dib3000mb.c:765:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &dib3000mb_ops, sizeof(struct dvb_frontend_ops));
           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/media/dvb-frontends/dib3000mc.c:923:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&st->demod.ops, &dib3000mc_ops, sizeof(struct dvb_frontend_ops));
           ^~~~~~
   drivers/media/dvb-frontends/dib3000mc.c:923:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&st->demod.ops, &dib3000mc_ops, sizeof(struct dvb_frontend_ops));
           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/media/dvb-frontends/dibx000_common.c:34:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mst->msg, 0, sizeof(struct i2c_msg));
           ^~~~~~
   drivers/media/dvb-frontends/dibx000_common.c:34:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(mst->msg, 0, sizeof(struct i2c_msg));
           ^~~~~~
   drivers/media/dvb-frontends/dibx000_common.c:58:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mst->msg, 0, 2 * sizeof(struct i2c_msg));
           ^~~~~~
   drivers/media/dvb-frontends/dibx000_common.c:58:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(mst->msg, 0, 2 * sizeof(struct i2c_msg));
           ^~~~~~
   drivers/media/dvb-frontends/dibx000_common.c:304:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mst->msg, 0, sizeof(struct i2c_msg) * (2 + num));
           ^~~~~~
   drivers/media/dvb-frontends/dibx000_common.c:304:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(mst->msg, 0, sizeof(struct i2c_msg) * (2 + num));
           ^~~~~~
   drivers/media/dvb-frontends/dibx000_common.c:312:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&mst->msg[1], msg, sizeof(struct i2c_msg) * num);
           ^~~~~~
   drivers/media/dvb-frontends/dibx000_common.c:312:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&mst->msg[1], msg, sizeof(struct i2c_msg) * num);
           ^~~~~~
   drivers/media/dvb-frontends/dibx000_common.c:350:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mst->msg, 0, sizeof(struct i2c_msg) * (2 + num));
           ^~~~~~
   drivers/media/dvb-frontends/dibx000_common.c:350:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(mst->msg, 0, sizeof(struct i2c_msg) * (2 + num));
           ^~~~~~
   drivers/media/dvb-frontends/dibx000_common.c:358:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&mst->msg[1], msg, sizeof(struct i2c_msg) * num);
           ^~~~~~
   drivers/media/dvb-frontends/dibx000_common.c:358:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&mst->msg[1], msg, sizeof(struct i2c_msg) * num);
           ^~~~~~
   drivers/media/dvb-frontends/dibx000_common.c:447:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mst->msg, 0, sizeof(struct i2c_msg));
           ^~~~~~
   drivers/media/dvb-frontends/dibx000_common.c:447:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(mst->msg, 0, sizeof(struct i2c_msg));
           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
--
           ^~~~~~
   Suppressed 49 warnings (37 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/iio/accel/adxl372.c:606:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(axis_sample, 0, 3 * sizeof(__be16));
           ^~~~~~
   drivers/iio/accel/adxl372.c:606:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(axis_sample, 0, 3 * sizeof(__be16));
           ^~~~~~
   drivers/iio/accel/adxl372.c:614:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sample, axis_sample, 3 * sizeof(__be16));
           ^~~~~~
   drivers/iio/accel/adxl372.c:614:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(sample, axis_sample, 3 * sizeof(__be16));
           ^~~~~~
   drivers/iio/accel/adxl372.c:988:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", st->fifo_mode);
                  ^~~~~~~
   drivers/iio/accel/adxl372.c:988:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", st->fifo_mode);
                  ^~~~~~~
   drivers/iio/accel/adxl372.c:998:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", st->watermark);
                  ^~~~~~~
   drivers/iio/accel/adxl372.c:998:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", st->watermark);
                  ^~~~~~~
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/staging/greybus/arche-apb-ctrl.c:302:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "off%s\n",
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:302:10: note: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "off%s\n",
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:305:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "active\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:305:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "active\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:307:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "standby\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:307:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "standby\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:309:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "fw_flashing\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:309:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "fw_flashing\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:311:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "unknown state\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:311:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "unknown state\n");
                          ^~~~~~~
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/spi/spi-stm32.c:1068:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dma_conf, 0, sizeof(struct dma_slave_config));
           ^~~~~~
   drivers/spi/spi-stm32.c:1068:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(dma_conf, 0, sizeof(struct dma_slave_config));
           ^~~~~~
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/spi/spi-tegra210-quad.c:1396:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = tegra_qspi_start_dma_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1396:3: note: Value stored to 'err' is never read
                   err = tegra_qspi_start_dma_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1398:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = tegra_qspi_start_cpu_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1398:3: note: Value stored to 'err' is never read
                   err = tegra_qspi_start_cpu_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (39 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   58 warnings generated.
>> drivers/spi/spi-topcliff-pch.c:161:8: warning: Excessive padding in 'struct pch_spi_data' (34 padding bytes, where 2 is optimal). Optimal fields order: io_remap_addr, io_base_addr, master, pkt_tx_buff, pkt_rx_buff, current_chip, current_msg, cur_trans, board_dat, plat_dev, queue, lock, work, wait, dma, bpw_len, tx_index, rx_index, ch, use_dma, save_total_len, transfer_complete, bcurrent_msg_processing, status, transfer_active, n_curnt_chip, irq_reg_sts, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct pch_spi_data {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:161:8: note: Excessive padding in 'struct pch_spi_data' (34 padding bytes, where 2 is optimal). Optimal fields order: io_remap_addr, io_base_addr, master, pkt_tx_buff, pkt_rx_buff, current_chip, current_msg, cur_trans, board_dat, plat_dev, queue, lock, work, wait, dma, bpw_len, tx_index, rx_index, ch, use_dma, save_total_len, transfer_complete, bcurrent_msg_processing, status, transfer_active, n_curnt_chip, irq_reg_sts, consider reordering the fields or adding explicit padding members
   struct pch_spi_data {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:609:26: warning: Array access (via field 'pkt_tx_buff') results in a null pointer dereference [clang-analyzer-core.NullDereference]
                                   data->pkt_tx_buff[j] = *tx_buf++;
                                                        ^
   drivers/spi/spi-topcliff-pch.c:1139:2: note: Taking false branch
           dev_dbg(&data->master->dev, "%s data initialized\n", __func__);
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/spi/spi-topcliff-pch.c:1143:6: note: Assuming field 'suspend_sts' is 0
           if (data->board_dat->suspend_sts || (data->status == STATUS_EXITING)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1143:6: note: Left side of '||' is false
   drivers/spi/spi-topcliff-pch.c:1143:39: note: Assuming field 'status' is not equal to STATUS_EXITING
           if (data->board_dat->suspend_sts || (data->status == STATUS_EXITING)) {
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1143:2: note: Taking false branch
           if (data->board_dat->suspend_sts || (data->status == STATUS_EXITING)) {
           ^
   drivers/spi/spi-topcliff-pch.c:1164:2: note: Taking false branch
           dev_dbg(&data->master->dev,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/spi/spi-topcliff-pch.c:1175:2: note: Calling 'pch_spi_select_chip'
           pch_spi_select_chip(data, data->current_msg->spi);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:530:6: note: Assuming field 'current_chip' is equal to NULL
           if (data->current_chip != NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:530:2: note: Taking false branch
           if (data->current_chip != NULL) {
           ^
   drivers/spi/spi-topcliff-pch.c:541:2: note: Taking false branch
           dev_dbg(&pspi->dev, "%s :Invoking pch_spi_setup_transfer\n", __func__);
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/spi/spi-topcliff-pch.c:543:1: note: Returning without writing to 'data->pkt_rx_buff', which participates in a condition later
   }
   ^
   drivers/spi/spi-topcliff-pch.c:543:1: note: Returning without writing to 'data->pkt_tx_buff'
   drivers/spi/spi-topcliff-pch.c:1175:2: note: Returning from 'pch_spi_select_chip'
           pch_spi_select_chip(data, data->current_msg->spi);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1179:6: note: Assuming field 'use_dma' is 0
           if (data->use_dma)
               ^~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1179:2: note: Taking false branch
           if (data->use_dma)
           ^
   drivers/spi/spi-topcliff-pch.c:1189:7: note: Assuming field 'cur_trans' is not equal to NULL
                   if (data->cur_trans == NULL) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1189:3: note: Taking false branch
                   if (data->cur_trans == NULL) {
                   ^
   drivers/spi/spi-topcliff-pch.c:1200:4: note: Taking false branch
                           dev_dbg(&data->master->dev,
                           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/spi/spi-topcliff-pch.c:1206:7: note: Assuming field 'len' is not equal to 0
                   if (!data->cur_trans->len)
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1206:3: note: Taking false branch
                   if (!data->cur_trans->len)
                   ^
   drivers/spi/spi-topcliff-pch.c:1210:7: note: Assuming field 'use_dma' is 0
                   if (data->use_dma) {
                       ^~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:1210:3: note: Taking false branch
                   if (data->use_dma) {
                   ^
   drivers/spi/spi-topcliff-pch.c:1230:4: note: Calling 'pch_spi_set_tx'
                           pch_spi_set_tx(data, &bpw);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:555:6: note: Assuming field 'speed_hz' is 0
           if (data->cur_trans->speed_hz) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:555:2: note: Taking false branch
           if (data->cur_trans->speed_hz) {
           ^
   drivers/spi/spi-topcliff-pch.c:561:6: note: Assuming field 'bits_per_word' is 0
           if (data->cur_trans->bits_per_word &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-topcliff-pch.c:561:37: note: Left side of '&&' is false
           if (data->cur_trans->bits_per_word &&
                                              ^
   drivers/spi/spi-topcliff-pch.c:581:22: note: Calling 'kzalloc'
           data->pkt_tx_buff = kzalloc(size, GFP_KERNEL);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~

vim +/pdev +174 drivers/media/dvb-frontends/rtl2832_sdr.c

771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  170  
725b7f30463ab5 drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-12-15  171  static unsigned int rtl2832_sdr_convert_stream(struct rtl2832_sdr_dev *dev,
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  172  		void *dst, const u8 *src, unsigned int src_len)
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  173  {
e4e78693a18aa6 drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-12-16 @174  	struct platform_device *pdev = dev->pdev;
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  175  	unsigned int dst_len;
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  176  
725b7f30463ab5 drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-12-15  177  	if (dev->pixelformat ==  V4L2_SDR_FMT_CU8) {
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  178  		/* native stream, no need to convert */
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10 @179  		memcpy(dst, src, src_len);
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  180  		dst_len = src_len;
725b7f30463ab5 drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-12-15  181  	} else if (dev->pixelformat == V4L2_SDR_FMT_CU16LE) {
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  182  		/* convert u8 to u16 */
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  183  		unsigned int i;
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  184  		u16 *u16dst = dst;
941a8204d0bb92 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Ovidiu Toader   2014-06-02  185  
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  186  		for (i = 0; i < src_len; i++)
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  187  			*u16dst++ = (src[i] << 8) | (src[i] >> 0);
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  188  		dst_len = 2 * src_len;
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  189  	} else {
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  190  		dst_len = 0;
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  191  	}
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  192  
b538a8e85b2b2f drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-08-24  193  	/* calculate sample rate and output it in 10 seconds intervals */
725b7f30463ab5 drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-12-15  194  	if (unlikely(time_is_before_jiffies(dev->jiffies_next))) {
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  195  		#define MSECS 10000UL
b538a8e85b2b2f drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-08-24 @196  		unsigned int msecs = jiffies_to_msecs(jiffies -
725b7f30463ab5 drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-12-15  197  				dev->jiffies_next + msecs_to_jiffies(MSECS));
725b7f30463ab5 drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-12-15 @198  		unsigned int samples = dev->sample - dev->sample_measured;
941a8204d0bb92 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Ovidiu Toader   2014-06-02  199  
725b7f30463ab5 drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-12-15  200  		dev->jiffies_next = jiffies + msecs_to_jiffies(MSECS);
725b7f30463ab5 drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-12-15  201  		dev->sample_measured = dev->sample;
e4e78693a18aa6 drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-12-16  202  		dev_dbg(&pdev->dev,
b538a8e85b2b2f drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-08-24  203  			"slen=%u samples=%u msecs=%u sample rate=%lu\n",
e4e78693a18aa6 drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-12-16  204  			src_len, samples, msecs, samples * 1000UL / msecs);
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  205  	}
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  206  
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  207  	/* total number of I+Q pairs */
725b7f30463ab5 drivers/media/dvb-frontends/rtl2832_sdr.c        Antti Palosaari 2014-12-15  208  	dev->sample += src_len / 2;
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  209  
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  210  	return dst_len;
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  211  }
771138920eafa3 drivers/staging/media/rtl2832u_sdr/rtl2832_sdr.c Antti Palosaari 2013-09-10  212  

:::::: The code at line 174 was first introduced by commit
:::::: e4e78693a18aa6dfc1388def09d5c73006d7c742 [media] rtl2832_sdr: fix logging

:::::: TO: Antti Palosaari <crope@iki.fi>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
