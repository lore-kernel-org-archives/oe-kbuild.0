Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21A48BE9
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 22:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679176916; x=1710712916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x8H6Z4+aHsqqRDjWyvbzYtQs50Y2/s2O3klgmE3wpv8=;
  b=VzCXqGfpZ4fHQKvgMPIqvWiNGfKomWM+5kMMqb0ShO9Zblio+GZuxGFp
   w2IDnnRF4LEOZmjful2+lCeUt4ElDFqJ8RhTewlGG32zcnCF8Z+dJYj7g
   oMO7aqlzBq6HUxWLXVwMiuL1+Sn24C7eiPxHMkMQbRc6Ln0pcpwyUGWHx
   o7Hwps6QVtbhoUzjW5xFrNQvWgo+V5z0yMLVheXl+d0rfBhEYgdEWxnMf
   H7LFl/ZHTXhsczuyTNOWp1ExBA+bHvWYX+0rP270tYBmFAXQZRnN24LBo
   OAx/OoPVPem4tBAqWjtgo7C1PL7YT0TgIneihfmW2eJwkuvmM+DvJQdhf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="340000334"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="340000334"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 15:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="657932428"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="657932428"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Mar 2023 15:01:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdecc-000AHr-19;
	Sat, 18 Mar 2023 22:01:54 +0000
Date: Sun, 19 Mar 2023 06:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/spi/spi-omap-uwire.c:121:3: warning: Value stored to 'val'
 is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303190520.nCFTeIDz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/spi/spi-omap-uwire.c:121:3: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   534293368afa1a953c283310b82e4dc58309d51e
commit: 58d37dc1dfd8900892d73da1f26ac1cefca52e6e ARM: omap1: move perseus spi pinconf to board file
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20230318 (https://download.01.org/0day-ci/archive/20230319/202303190520.nCFTeIDz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=58d37dc1dfd8900892d73da1f26ac1cefca52e6e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 58d37dc1dfd8900892d73da1f26ac1cefca52e6e
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303190520.nCFTeIDz-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/scsi/libsas/sas_expander.c:1781:22: note: The left operand of '!=' is a garbage value
           if (rg_resp->result != SMP_RESP_FUNC_ACC) {
               ~~~~~~~~~~~~~~~ ^
   drivers/scsi/libsas/sas_expander.c:1883:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(phy->attached_sas_addr, 0, SAS_ADDR_SIZE);
           ^~~~~~
   drivers/scsi/libsas/sas_expander.c:1883:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(phy->attached_sas_addr, 0, SAS_ADDR_SIZE);
           ^~~~~~
   drivers/scsi/libsas/sas_expander.c:1989:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(msg, ", part of a wide port with phy%02d", sibling);
                   ^~~~~~~
   drivers/scsi/libsas/sas_expander.c:1989:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(msg, ", part of a wide port with phy%02d", sibling);
                   ^~~~~~~
   drivers/scsi/libsas/sas_expander.c:1994:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sas_addr, 0, SAS_ADDR_SIZE);
           ^~~~~~
   drivers/scsi/libsas/sas_expander.c:1994:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(sas_addr, 0, SAS_ADDR_SIZE);
           ^~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/iio/adc/ti-ads7950.c:444:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = ((st->single_rx >> 12) & BIT(offset)) ? 1 : 0;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads7950.c:444:2: note: Value stored to 'ret' is never read
           ret = ((st->single_rx >> 12) & BIT(offset)) ? 1 : 0;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/iio/adc/ti-ads8688.c:64:8: warning: Excessive padding in 'struct ads8688_state' (48 padding bytes, where 16 is optimal). Optimal fields order: data, chip_info, spi, reg, vref_mv, range, lock, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct ads8688_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads8688.c:64:8: note: Excessive padding in 'struct ads8688_state' (48 padding bytes, where 16 is optimal). Optimal fields order: data, chip_info, spi, reg, vref_mv, range, lock, consider reordering the fields or adding explicit padding members
   struct ads8688_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads8688.c:123:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0.%09u 0.%09u 0.%09u\n",
                  ^~~~~~~
   drivers/iio/adc/ti-ads8688.c:123:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0.%09u 0.%09u 0.%09u\n",
                  ^~~~~~~
   drivers/iio/adc/ti-ads8688.c:132:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d %d\n", ads8688_range_def[0].offset,
                  ^~~~~~~
   drivers/iio/adc/ti-ads8688.c:132:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d %d\n", ads8688_range_def[0].offset,
                  ^~~~~~~
   Suppressed 52 warnings (51 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/iio/adc/hx711.c:365:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hx711_data->buffer, 0, sizeof(hx711_data->buffer));
           ^~~~~~
   drivers/iio/adc/hx711.c:365:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(hx711_data->buffer, 0, sizeof(hx711_data->buffer));
           ^~~~~~
   drivers/iio/adc/hx711.c:396:11: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           len += sprintf(buf + len, "0.%09d ",
                                  ^~~~~~~
   drivers/iio/adc/hx711.c:396:11: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                           len += sprintf(buf + len, "0.%09d ",
                                  ^~~~~~~
   drivers/iio/adc/hx711.c:399:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len += sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/iio/adc/hx711.c:399:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           len += sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/iio/adc/hx711.c:536:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = of_property_read_u32(np, "clock-frequency",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/hx711.c:536:2: note: Value stored to 'ret' is never read
           ret = of_property_read_u32(np, "clock-frequency",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   46 warnings generated.
>> drivers/spi/spi-omap-uwire.c:121:3: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val ^= 0x03;
                   ^      ~~~~
   drivers/spi/spi-omap-uwire.c:121:3: note: Value stored to 'val' is never read
                   val ^= 0x03;
                   ^      ~~~~
>> drivers/spi/spi-omap-uwire.c:396:3: warning: Value stored to 'rate' is never read [clang-analyzer-deadcode.DeadStores]
                   rate /= 2;
                   ^       ~
   drivers/spi/spi-omap-uwire.c:396:3: note: Value stored to 'rate' is never read
                   rate /= 2;
                   ^       ~
   drivers/spi/spi-omap-uwire.c:401:3: warning: Value stored to 'rate' is never read [clang-analyzer-deadcode.DeadStores]
                   rate /= 4;
                   ^       ~
   drivers/spi/spi-omap-uwire.c:401:3: note: Value stored to 'rate' is never read
                   rate /= 4;
                   ^       ~
   drivers/spi/spi-omap-uwire.c:408:3: warning: Value stored to 'rate' is never read [clang-analyzer-deadcode.DeadStores]
                   rate /= 8;
                   ^       ~
   drivers/spi/spi-omap-uwire.c:408:3: note: Value stored to 'rate' is never read
                   rate /= 8;
                   ^       ~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/spi/spi-pl022.c:1912:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&clk_freq, &chip_info->clk_freq, sizeof(clk_freq));
                   ^~~~~~
   drivers/spi/spi-pl022.c:1912:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&clk_freq, &chip_info->clk_freq, sizeof(clk_freq));
                   ^~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/spi/spi-pxa2xx.c:1480:17: warning: Value stored to 'parent' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *parent = pdev->dev.parent;
                          ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/spi/spi-pxa2xx.c:1480:17: note: Value stored to 'parent' during its initialization is never read
           struct device *parent = pdev->dev.parent;
                          ^~~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/bcma/main.c:36:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%03X\n", core->id.manuf);
                  ^~~~~~~
   drivers/bcma/main.c:36:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%03X\n", core->id.manuf);
                  ^~~~~~~
   drivers/bcma/main.c:43:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%03X\n", core->id.id);
                  ^~~~~~~
   drivers/bcma/main.c:43:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%03X\n", core->id.id);
                  ^~~~~~~
   drivers/bcma/main.c:50:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%02X\n", core->id.rev);
                  ^~~~~~~
   drivers/bcma/main.c:50:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%02X\n", core->id.rev);
                  ^~~~~~~
   drivers/bcma/main.c:57:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%X\n", core->id.class);
                  ^~~~~~~
   drivers/bcma/main.c:57:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%X\n", core->id.class);
                  ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/firmware/qcom_scm.c:441:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mdata_buf, metadata, size);
           ^~~~~~
   drivers/firmware/qcom_scm.c:441:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(mdata_buf, metadata, size);
           ^~~~~~
   drivers/firmware/qcom_scm.c:1060:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(keybuf, key, key_size);
           ^~~~~~
   drivers/firmware/qcom_scm.c:1060:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(keybuf, key, key_size);
           ^~~~~~
   drivers/firmware/qcom_scm.c:1133:8: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           *resp = res.result[0];
                 ^ ~~~~~~~~~~~~~
   drivers/firmware/qcom_scm.c:1125:6: note: Assuming 'req_cnt' is <= QCOM_SCM_HDCP_MAX_REQ_CNT
           if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/qcom_scm.c:1125:2: note: Taking false branch
           if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
           ^
   drivers/firmware/qcom_scm.c:1128:8: note: Calling 'qcom_scm_clk_enable'
           ret = qcom_scm_clk_enable();
                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/qcom_scm.c:73:8: note: Calling 'clk_prepare_enable'
           ret = clk_prepare_enable(__scm->core_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:951:6: note: Assuming 'ret' is 0
           if (ret)

vim +/val +121 drivers/spi/spi-omap-uwire.c

fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  114  
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  115  static inline void omap_uwire_configure_mode(u8 cs, unsigned long flags)
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  116  {
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  117  	u16	w, val = 0;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  118  	int	shift, reg;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  119  
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  120  	if (flags & UWIRE_CLK_INVERTED)
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12 @121  		val ^= 0x03;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  122  	val = flags & 0x3f;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  123  	if (cs & 1)
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  124  		shift = 6;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  125  	else
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  126  		shift = 0;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  127  	if (cs <= 1)
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  128  		reg = UWIRE_SR1;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  129  	else
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  130  		reg = UWIRE_SR2;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  131  
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  132  	w = uwire_read_reg(reg);
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  133  	w &= ~(0x3f << shift);
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  134  	w |= val << shift;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  135  	uwire_write_reg(reg, w);
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  136  }
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  137  

:::::: The code at line 121 was first introduced by commit
:::::: fdb3c18d639311287dc4675abe743847a1aa62a8 [PATCH] SPI controller driver for OMAP Microwire

:::::: TO: David Brownell <david-b@pacbell.net>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
