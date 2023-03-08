Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A9A6AA3
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Mar 2023 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678277869; x=1709813869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dgS7o0TAhq9IFnSJSutJftw+F+EsY3/Av39FBWPJeqY=;
  b=MkXwFEqu1LixUDRJUtJkGUhsCx+frIzjq6Iz6LQgU6+KzdQNzr8iK9Ib
   GQW+ulJ04Gn/C/Xa19A+Y/Okyp5MTCKcXKG7ounwH89WaD2u3J0g+rfFx
   a+GlCXyaL+UJFt/YvfCIdHWCAq/+ImMoYlWQp8T0cMW3IAknC/hd0Vstz
   YHyV2SnuFJ93TMVfSR84hs2IBynpE+cHthDdJo/aLv1u9KEtG0CxArL69
   6lXblrMKAgXasaOpUXmofMXxMKzi1vhaPLjZlE0Xre3cLnbGvhf7B+q2m
   Sy5OsJeQThM1FczZYFiq+dib59LQR/tCnVoUMs0ZmZpxlP0kLAPAAaRfO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="333608302"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="333608302"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 04:17:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="765975024"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="765975024"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2023 04:17:45 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZsjo-00027j-1Z;
	Wed, 08 Mar 2023 12:17:44 +0000
Date: Wed, 8 Mar 2023 20:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/i3c/master/i3c-master-cdns.c:1196:23: warning: Division by
 zero [clang-analyzer-core.DivideZero]
Message-ID: <202303082021.AsKOehGg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/i3c/master/i3c-master-cdns.c:1196:23: warning: Division by zero [clang-analyzer-core.DivideZero]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63355b9884b3d1677de6bd1517cd2b8a9bf53978
commit: 3cd8cc98d63492f6f69edd4486c9bd1fe29f91c3 platform/x86: Drop the PMC_ATOM Kconfig option
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20230308/202303082021.AsKOehGg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3cd8cc98d63492f6f69edd4486c9bd1fe29f91c3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3cd8cc98d63492f6f69edd4486c9bd1fe29f91c3
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303082021.AsKOehGg-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~~~~~~~~~~~
   drivers/net/can/spi/hi311x.c:282:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf + HI3110_FIFO_EXT_DATA_OFF,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/can/spi/hi311x.c:296:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf + HI3110_FIFO_STD_DATA_OFF,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/can/spi/hi311x.c:296:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf + HI3110_FIFO_STD_DATA_OFF,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/can/spi/hi311x.c:310:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, priv->spi_rx_buf + 1, HI3110_RX_BUF_LEN - 1);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/can/spi/hi311x.c:310:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, priv->spi_rx_buf + 1, HI3110_RX_BUF_LEN - 1);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/can/spi/hi311x.c:349:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(frame->data, buf + HI3110_FIFO_WOTIME_DAT_OFF,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/can/spi/hi311x.c:349:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(frame->data, buf + HI3110_FIFO_WOTIME_DAT_OFF,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   76 warnings generated.
   kernel/bpf/arraymap.c:338:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(this_cpu_ptr(array->pptrs[index & array->index_mask]),
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   kernel/bpf/arraymap.c:338:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(this_cpu_ptr(array->pptrs[index & array->index_mask]),
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 75 warnings (75 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/i3c/master/i3c-master-cdns.c:434:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/i3c/master/i3c-master-cdns.c:434:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/i3c/master/i3c-master-cdns.c:447:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/i3c/master/i3c-master-cdns.c:447:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/i3c/master/i3c-master-cdns.c:1052:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0, sizeof(*info));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/i3c/master/i3c-master-cdns.c:1052:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(info, 0, sizeof(*info));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> drivers/i3c/master/i3c-master-cdns.c:1196:23: warning: Division by zero [clang-analyzer-core.DivideZero]
                                       (NSEC_PER_SEC / sysclk_rate));
                                                     ^
   include/linux/math.h:37:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:46: note: expanded from macro '__KERNEL_DIV_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                ^
   drivers/i3c/master/i3c-master-cdns.c:1194:30: note: Calling 'clk_get_rate'
           unsigned long sysclk_rate = clk_get_rate(master->sysclk);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:882:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/i3c/master/i3c-master-cdns.c:1194:30: note: Returning from 'clk_get_rate'
           unsigned long sysclk_rate = clk_get_rate(master->sysclk);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/i3c-master-cdns.c:1194:2: note: 'sysclk_rate' initialized to 0
           unsigned long sysclk_rate = clk_get_rate(master->sysclk);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/i3c-master-cdns.c:1196:23: note: Division by zero
                                       (NSEC_PER_SEC / sysclk_rate));
                                                     ^
   include/linux/math.h:37:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:46: note: expanded from macro '__KERNEL_DIV_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                ^
   drivers/i3c/master/i3c-master-cdns.c:1245:2: warning: Value stored to 'prescl1' is never read [clang-analyzer-deadcode.DeadStores]
           prescl1 = PRESCL_CTRL1_OD_LOW(low);
           ^
   drivers/i3c/master/i3c-master-cdns.c:1245:2: note: Value stored to 'prescl1' is never read
   drivers/i3c/master/i3c-master-cdns.c:1338:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/i3c/master/i3c-master-cdns.c:1338:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   227 warnings generated.
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:778:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(event->mddq_pl, mddq_pl, sizeof(event->mddq_pl));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:778:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(event->mddq_pl, mddq_pl, sizeof(event->mddq_pl));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:811:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(event->mbct_pl, mbct_pl, sizeof(event->mbct_pl));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:811:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(event->mbct_pl, mbct_pl, sizeof(event->mbct_pl));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:998:8: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           err = snprintf(filename, sizeof(filename),
                 ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:998:8: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           err = snprintf(filename, sizeof(filename),
                 ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:1025:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(types_info->data, firmware->data, types_info->data_size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:1025:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(types_info->data, firmware->data, types_info->data_size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 223 warnings (223 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   38 warnings generated.
   fs/filesystems.c:227:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, p->name, len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/filesystems.c:227:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
--
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1571:9: note: Assuming the condition is true
           while (!list_empty(list)) {
                  ^~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1571:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(list)) {
           ^
   net/mptcp/pm_netlink.c:1577:3: note: Calling '__mptcp_pm_release_addr_entry'
                   __mptcp_pm_release_addr_entry(cur);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:877:2: note: Assuming field 'lsk' is null
           if (entry->lsk)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   net/mptcp/pm_netlink.c:877:2: note: '?' condition is false
           if (entry->lsk)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   net/mptcp/pm_netlink.c:877:13: note: Field 'lsk' is null
           if (entry->lsk)
                      ^
   net/mptcp/pm_netlink.c:877:2: note: '?' condition is false
           if (entry->lsk)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   net/mptcp/pm_netlink.c:877:2: note: Taking false branch
           if (entry->lsk)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/mptcp/pm_netlink.c:879:2: note: Argument to kfree() is the address of the local variable 'free_list', which is not memory allocated by malloc()
           kfree(entry);
           ^     ~~~~~
   net/mptcp/pm_netlink.c:1215:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(addr, 0, sizeof(*addr));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1215:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(addr, 0, sizeof(*addr));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1227:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(entry, 0, sizeof(*entry));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1227:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(entry, 0, sizeof(*entry));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 100 warnings (100 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   sound/soc/fsl/fsl_sai.c:1053:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(tmp, "mclk%d", i);
                   ^~~~~~~
   sound/soc/fsl/fsl_sai.c:1053:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(tmp, "mclk%d", i);
                   ^~~~~~~
   sound/soc/fsl/fsl_sai.c:1078:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&sai->cpu_dai_drv, &fsl_sai_dai_template,
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_sai.c:1078:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&sai->cpu_dai_drv, &fsl_sai_dai_template,
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
>> sound/soc/fsl/fsl_ssi.c:744:17: warning: Division by zero [clang-analyzer-core.DivideZero]
                   else if (freq / afreq == 1)
                                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   sound/soc/fsl/fsl_ssi.c:683:17: note: Assuming field 'stream' is not equal to SNDRV_PCM_STREAM_PLAYBACK
           bool tx2, tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_ssi.c:697:2: note: Assuming field 'slots' is 0
           if (ssi->slots)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   sound/soc/fsl/fsl_ssi.c:697:2: note: '?' condition is false
           if (ssi->slots)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   sound/soc/fsl/fsl_ssi.c:697:11: note: Field 'slots' is 0
           if (ssi->slots)
                    ^
   sound/soc/fsl/fsl_ssi.c:697:2: note: '?' condition is false
           if (ssi->slots)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   sound/soc/fsl/fsl_ssi.c:697:2: note: Taking false branch
           if (ssi->slots)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/soc/fsl/fsl_ssi.c:699:2: note: Assuming field 'slot_width' is 0
           if (ssi->slot_width)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   sound/soc/fsl/fsl_ssi.c:699:2: note: '?' condition is false
           if (ssi->slot_width)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   sound/soc/fsl/fsl_ssi.c:699:11: note: Field 'slot_width' is 0
           if (ssi->slot_width)
                    ^
   sound/soc/fsl/fsl_ssi.c:699:2: note: '?' condition is false
           if (ssi->slot_width)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   sound/soc/fsl/fsl_ssi.c:699:2: note: Taking false branch
           if (ssi->slot_width)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/soc/fsl/fsl_ssi.c:703:6: note: Assuming 'channels' is not equal to 2
           if (channels == 2 &&
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   sound/soc/fsl/fsl_ssi.c:703:20: note: Left side of '&&' is false
           if (channels == 2 &&
--
                           ^~~~~~~~~~~~~~~~
   drivers/hid/uhid.c:565:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ev->u.create2.phys, orig.phys, sizeof(orig.phys));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/hid/uhid.c:566:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ev->u.create2.uniq, orig.uniq, sizeof(orig.uniq));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/hid/uhid.c:566:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ev->u.create2.uniq, orig.uniq, sizeof(orig.uniq));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/hid/uhid.c:736:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&uhid->input_buf, 0, sizeof(uhid->input_buf));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/hid/uhid.c:736:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&uhid->input_buf, 0, sizeof(uhid->input_buf));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/media/v4l2-core/v4l2-fwnode.c:548:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(link, 0, sizeof(*link));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:548:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(link, 0, sizeof(*link));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:662:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(connector, 0, sizeof(*connector));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:662:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(connector, 0, sizeof(*connector));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:749:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(props, 0, sizeof(*props));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:749:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(props, 0, sizeof(*props));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   sound/soc/fsl/fsl_spdif.c:813:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&ucontrol->value.iec958.subcode[0],
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:813:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&ucontrol->value.iec958.subcode[0],
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:845:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&ucontrol->value.bytes.data[0],
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:845:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&ucontrol->value.bytes.data[0],
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
>> sound/soc/fsl/fsl_spdif.c:1404:27: warning: Division by zero [clang-analyzer-core.DivideZero]
                           } else if (rate[index] / arate == 1) {
                                                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   sound/soc/fsl/fsl_spdif.c:1373:17: note: 'is_sysclk' is false
           sysclk_dfmin = is_sysclk ? 2 : 1;
                          ^~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:1373:17: note: '?' condition is false
   sound/soc/fsl/fsl_spdif.c:1374:17: note: 'is_sysclk' is false
           sysclk_dfmax = is_sysclk ? 512 : 1;
                          ^~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:1374:17: note: '?' condition is false
   sound/soc/fsl/fsl_spdif.c:1376:2: note: Loop condition is true.  Entering loop body
           for (sysclk_df = sysclk_dfmin; sysclk_df <= sysclk_dfmax; sysclk_df++) {
           ^
   sound/soc/fsl/fsl_spdif.c:1377:3: note: Loop condition is true.  Entering loop body
                   for (txclk_df = 1; txclk_df <= 128; txclk_df++) {
                   ^
   sound/soc/fsl/fsl_spdif.c:1379:4: note: Assuming 'round' is false
                           if (round)
                           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   sound/soc/fsl/fsl_spdif.c:1379:4: note: '?' condition is false
                           if (round)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   sound/soc/fsl/fsl_spdif.c:1379:8: note: 'round' is false
                           if (round)
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   sound/soc/fsl/fsl_spdif.c:1379:4: note: '?' condition is false
                           if (round)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   sound/soc/fsl/fsl_spdif.c:1379:4: note: Taking false branch
                           if (round)
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/soc/fsl/fsl_spdif.c:1385:4: note: The value 0 is assigned to 'arate'
                           arate /= txclk_df * sysclk_df;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:1387:4: note: '?' condition is false
                           if (arate == rate[index]) {
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   sound/soc/fsl/fsl_spdif.c:1387:4: note: Assuming the condition is false
                           if (arate == rate[index]) {
                           ^
   include/linux/compiler.h:56:44: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   sound/soc/fsl/fsl_spdif.c:1387:4: note: '?' condition is false
                           if (arate == rate[index]) {
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^

vim +1196 drivers/i3c/master/i3c-master-cdns.c

603f2bee2c5419 Boris Brezillon 2017-07-19  1191  
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18  1192  static u8 cdns_i3c_master_calculate_thd_delay(struct cdns_i3c_master *master)
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18  1193  {
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18  1194  	unsigned long sysclk_rate = clk_get_rate(master->sysclk);
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18  1195  	u8 thd_delay = DIV_ROUND_UP(master->devdata->thd_delay_ns,
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18 @1196  				    (NSEC_PER_SEC / sysclk_rate));
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18  1197  
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18  1198  	/* Every value greater than 3 is not valid. */
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18  1199  	if (thd_delay > THD_DELAY_MAX)
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18  1200  		thd_delay = THD_DELAY_MAX;
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18  1201  
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18  1202  	/* CTLR_THD_DEL value is encoded. */
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18  1203  	return (THD_DELAY_MAX - thd_delay);
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18  1204  }
dbd6654329fcb0 Przemyslaw Gaj  2019-11-18  1205  

:::::: The code at line 1196 was first introduced by commit
:::::: dbd6654329fcb0f5fc11d07997ddb61683c085f2 i3c: master: cdns: add data hold delay support

:::::: TO: Przemyslaw Gaj <pgaj@cadence.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
