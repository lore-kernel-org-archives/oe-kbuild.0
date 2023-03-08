Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F69E8462
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Mar 2023 17:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678297556; x=1709833556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+rMhFNfsDgsPaBfpuefeARpDstQT+PWnh9w4GmZE9s=;
  b=CpksnwrF/U8azy28PnHoJYR5qyxhmmKmhZkU58ZhXko6Ywm0hNigNmHN
   5iql6zIHnYexs3DofDfp5fa8+6OxenCNL1JWLtjc3QFHZNbvVFt2UWbM5
   Uo69hGVehMRcSFhGxJgK0QjKqiNA/IoLUzdEXlxYiJLGPvPAjblr9IQ/F
   Jacs0CPWnGK2heGs4HXPTosrWnOiH/cmsRJVZPsuMlov9nfKE40kDT8I9
   DXOiUBT4TaM5MEbVS5w+bsgB+it15N3riJuwgBezlm3KfOgbWEOPATP7R
   ejh4REBN6ywJxq8MJKSASjmD1os1fziPJt3gsNlBs47cntS7KiZISuQZr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="398805094"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="398805094"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 09:45:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="707291417"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="707291417"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Mar 2023 09:45:54 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZxrO-0002JV-08;
	Wed, 08 Mar 2023 17:45:54 +0000
Date: Thu, 9 Mar 2023 01:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/soc/imx/imx8m-blk-ctrl.c:37:8: warning: Excessive padding in
 'struct imx8m_blk_ctrl_domain_data' (12 padding bytes, where 4 is optimal).
 Optimal fields order: name, clk_names, path_names, gpc_name, num_clks,
 num_paths, rst_mask, clk_mask, mipi_phy...
Message-ID: <202303090119.BeEHINds-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/soc/imx/imx8m-blk-ctrl.c:37:8: warning: Excessive padding in 'struct imx8m_blk_ctrl_domain_data' (12 padding bytes, where 4 is optimal). Optimal fields order: name, clk_names, path_names, gpc_name, num_clks, num_paths, rst_mask, clk_mask, mipi_phy_rst_mask, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peng Fan <peng.fan@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63355b9884b3d1677de6bd1517cd2b8a9bf53978
commit: c553ca9245f4ee7db54dc48c5892be787f8458a4 soc: imx: add icc paths for i.MX8MP media blk ctrl
date:   6 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20230305 (https://download.01.org/0day-ci/archive/20230309/202303090119.BeEHINds-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c553ca9245f4ee7db54dc48c5892be787f8458a4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c553ca9245f4ee7db54dc48c5892be787f8458a4
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303090119.BeEHINds-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           return sprintf(buf, "%d\n", dc->card_type);
                  ^~~~~~~
   drivers/tty/nozomi.c:1281:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", dc->open_ttys);
                  ^~~~~~~
   drivers/tty/nozomi.c:1281:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", dc->open_ttys);
                  ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/video/fbdev/sh_mobile_lcdcfb.c:1578:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(info->fix.id, sizeof(info->fix.id),
           ^~~~~~~~
   drivers/video/fbdev/sh_mobile_lcdcfb.c:1578:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(info->fix.id, sizeof(info->fix.id),
           ^~~~~~~~
   drivers/video/fbdev/sh_mobile_lcdcfb.c:1601:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(var, 0, sizeof(*var));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/sh_mobile_lcdcfb.c:1601:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(var, 0, sizeof(*var));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/video/fbdev/riva/fbdev.c:499:4: warning: Value stored to 'tmp' is never read [clang-analyzer-deadcode.DeadStores]
                           tmp = 0;
                           ^     ~
   drivers/video/fbdev/riva/fbdev.c:499:4: note: Value stored to 'tmp' is never read
                           tmp = 0;
                           ^     ~
   drivers/video/fbdev/riva/fbdev.c:706:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&newmode, &reg_template, sizeof(struct riva_regs));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/riva/fbdev.c:706:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&newmode, &reg_template, sizeof(struct riva_regs));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/riva/fbdev.c:1941:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(rivafb_fix.id, "NV%x", (pd->device & 0x0ff0) >> 4);
                   ^~~~~~~
   drivers/video/fbdev/riva/fbdev.c:1941:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(rivafb_fix.id, "NV%x", (pd->device & 0x0ff0) >> 4);
                   ^~~~~~~
   drivers/video/fbdev/riva/fbdev.c:1943:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(rivafb_fix.id, "NV%x", default_par->riva.Architecture);
                   ^~~~~~~
   drivers/video/fbdev/riva/fbdev.c:1943:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(rivafb_fix.id, "NV%x", default_par->riva.Architecture);
                   ^~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
>> drivers/soc/imx/imx8m-blk-ctrl.c:37:8: warning: Excessive padding in 'struct imx8m_blk_ctrl_domain_data' (12 padding bytes, where 4 is optimal). Optimal fields order: name, clk_names, path_names, gpc_name, num_clks, num_paths, rst_mask, clk_mask, mipi_phy_rst_mask, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct imx8m_blk_ctrl_domain_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/imx/imx8m-blk-ctrl.c:37:8: note: Excessive padding in 'struct imx8m_blk_ctrl_domain_data' (12 padding bytes, where 4 is optimal). Optimal fields order: name, clk_names, path_names, gpc_name, num_clks, num_paths, rst_mask, clk_mask, mipi_phy_rst_mask, consider reordering the fields or adding explicit padding members
   struct imx8m_blk_ctrl_domain_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   53 warnings generated.
   fs/char_dev.c:653:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cdev, 0, sizeof *cdev);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/char_dev.c:653:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(cdev, 0, sizeof *cdev);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../display/dc/basics/vector.c:80:4: warning: Call to function 'memmove' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(
                           ^
   include/linux/fortify-string.h:389:27: note: expanded from macro 'memmove'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__underlying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/basics/vector.c:80:4: note: Call to function 'memmove' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memmove_s' in case of C11
                           memmove(
                           ^
   include/linux/fortify-string.h:389:27: note: expanded from macro 'memmove'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__underlying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/basics/vector.c:171:3: warning: Call to function 'memmove' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(
                   ^
   include/linux/fortify-string.h:389:27: note: expanded from macro 'memmove'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__underlying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/basics/vector.c:171:3: note: Call to function 'memmove' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memmove_s' in case of C11
                   memmove(
                   ^
   include/linux/fortify-string.h:389:27: note: expanded from macro 'memmove'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \

vim +37 drivers/soc/imx/imx8m-blk-ctrl.c

2684ac05a8c4d2 Lucas Stach 2021-10-02  36  
2684ac05a8c4d2 Lucas Stach 2021-10-02 @37  struct imx8m_blk_ctrl_domain_data {
2684ac05a8c4d2 Lucas Stach 2021-10-02  38  	const char *name;
2684ac05a8c4d2 Lucas Stach 2021-10-02  39  	const char * const *clk_names;
2684ac05a8c4d2 Lucas Stach 2021-10-02  40  	int num_clks;
c553ca9245f4ee Peng Fan    2022-07-08  41  	const char * const *path_names;
c553ca9245f4ee Peng Fan    2022-07-08  42  	int num_paths;
2684ac05a8c4d2 Lucas Stach 2021-10-02  43  	const char *gpc_name;
2684ac05a8c4d2 Lucas Stach 2021-10-02  44  	u32 rst_mask;
2684ac05a8c4d2 Lucas Stach 2021-10-02  45  	u32 clk_mask;
042b67799e2991 Adam Ford   2021-11-28  46  
042b67799e2991 Adam Ford   2021-11-28  47  	/*
07614fed00e9f4 Paul Elder  2022-04-06  48  	 * i.MX8M Mini, Nano and Plus have a third DISPLAY_BLK_CTRL register
042b67799e2991 Adam Ford   2021-11-28  49  	 * which is used to control the reset for the MIPI Phy.
042b67799e2991 Adam Ford   2021-11-28  50  	 * Since it's only present in certain circumstances,
042b67799e2991 Adam Ford   2021-11-28  51  	 * an if-statement should be used before setting and clearing this
042b67799e2991 Adam Ford   2021-11-28  52  	 * register.
042b67799e2991 Adam Ford   2021-11-28  53  	 */
042b67799e2991 Adam Ford   2021-11-28  54  	u32 mipi_phy_rst_mask;
2684ac05a8c4d2 Lucas Stach 2021-10-02  55  };
2684ac05a8c4d2 Lucas Stach 2021-10-02  56  

:::::: The code at line 37 was first introduced by commit
:::::: 2684ac05a8c4d2d5c49e6c11eb6206b30a284813 soc: imx: add i.MX8M blk-ctrl driver

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
