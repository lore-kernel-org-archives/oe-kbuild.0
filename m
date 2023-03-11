Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D660E7B
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Mar 2023 20:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678566663; x=1710102663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+sRJ6RY7x5K2myBoHIlB/jvWMrIPeMc9qokZou4WHMU=;
  b=mMpTmMcqoWc/wuBUIs7X/r1/Viwcsoy+oElcAtdOWAppk8572EteCdU5
   qNnC9Jon0TNGUrJ+9q92imieE2huW4Y2lwtiUzTdXC0U5ZIh1Nci1c+Yg
   Ur5gI6vIZGQMlHEJzFNHQpfSV6a4ANQjcyfGdnVdc8mKTw+tkXAR9WZeE
   7Z90JvWrVskcmlycCIRXaPbBHckjHSvpMX1GDNOdQmgP7IlZiIPYfR5YB
   cQHfO5QObKsaXGChAiCgyeb2k3WR8HehmfGxWeHUtnuJKbhV4XAJ6phcO
   o1R6mfxdi8o93Qt9nVsDKhlFOZELg6pOdLaUv+P+e4Unpf58hzQ6Yx1gH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="320791194"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="320791194"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 12:31:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="788437393"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="788437393"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2023 12:31:01 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb5rp-0004nF-0O;
	Sat, 11 Mar 2023 20:31:01 +0000
Date: Sun, 12 Mar 2023 04:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/soc/imx/imx8m-blk-ctrl.c:37:8: warning: Excessive padding in
 'struct imx8m_blk_ctrl_domain_data' (12 padding bytes, where 4 is optimal).
 Optimal fields order: name, clk_names, path_names, gpc_name, num_clks,
 num_paths, rst_mask, clk_mask, mipi_phy...
Message-ID: <202303120414.Bu8Dfmt5-lkp@intel.com>
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
head:   ef5f68cc1f829b492b19cd4df5af4454aa816b93
commit: c553ca9245f4ee7db54dc48c5892be787f8458a4 soc: imx: add icc paths for i.MX8MP media blk ctrl
date:   6 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20230305 (https://download.01.org/0day-ci/archive/20230312/202303120414.Bu8Dfmt5-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/r/202303120414.Bu8Dfmt5-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
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
   kernel/printk/printk_ringbuffer.c:1740:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&buf[0], data, data_size); /* LMM(copy_data:A) */
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
   kernel/printk/printk_ringbuffer.c:1822:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(r->info, info, sizeof(*(r->info)));
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
   kernel/printk/printk_ringbuffer.c:1822:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(r->info, info, sizeof(*(r->info)));
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
   kernel/printk/printk_ringbuffer.c:2080:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(descs, 0, _DESCS_COUNT(descbits) * sizeof(descs[0]));
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
   kernel/printk/printk_ringbuffer.c:2080:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(descs, 0, _DESCS_COUNT(descbits) * sizeof(descs[0]));
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
   kernel/printk/printk_ringbuffer.c:2081:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(infos, 0, _DESCS_COUNT(descbits) * sizeof(infos[0]));
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
   kernel/printk/printk_ringbuffer.c:2081:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(infos, 0, _DESCS_COUNT(descbits) * sizeof(infos[0]));
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
   Suppressed 18 warnings (18 in non-user code).
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
   57 warnings generated.
   Suppressed 57 warnings (57 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   67 warnings generated.
   drivers/gpu/drm/radeon/r600.c:1593:35: warning: The right operand of '+' is a garbage value due to array index out of bounds [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (RREG32(AVIVO_D1CRTC_CONTROL + crtc_offsets[i]) & AVIVO_CRTC_EN) {
                                                   ^
   drivers/gpu/drm/radeon/r600.c:1923:19: note: Calling 'r600_gpu_check_soft_reset'
           u32 reset_mask = r600_gpu_check_soft_reset(rdev);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/r600.c:1622:6: note: Assuming field 'family' is < CHIP_RV770
           if (rdev->family >= CHIP_RV770) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/r600.c:1622:2: note: Taking false branch
           if (rdev->family >= CHIP_RV770) {
           ^
   drivers/gpu/drm/radeon/r600.c:1630:7: note: Assuming the condition is false
                   if (G_008010_PA_BUSY(tmp) | G_008010_SC_BUSY(tmp) |
                       ^
   drivers/gpu/drm/radeon/r600d.h:1780:32: note: expanded from macro 'G_008010_PA_BUSY'
   #define         G_008010_PA_BUSY(x)                     (((x) >> 25) & 1)
                                                           ^
   drivers/gpu/drm/radeon/r600.c:1630:3: note: Taking false branch
                   if (G_008010_PA_BUSY(tmp) | G_008010_SC_BUSY(tmp) |
                   ^
   drivers/gpu/drm/radeon/r600.c:1638:6: note: Assuming the condition is false
           if (G_008010_CF_RQ_PENDING(tmp) | G_008010_PF_RQ_PENDING(tmp) |
               ^
   drivers/gpu/drm/radeon/r600d.h:1764:37: note: expanded from macro 'G_008010_CF_RQ_PENDING'
   #define         G_008010_CF_RQ_PENDING(x)               (((x) >> 7) & 1)
                                                           ^
   drivers/gpu/drm/radeon/r600.c:1638:2: note: Taking false branch
           if (G_008010_CF_RQ_PENDING(tmp) | G_008010_PF_RQ_PENDING(tmp) |
           ^
   drivers/gpu/drm/radeon/r600.c:1642:6: note: Assuming the condition is false
           if (G_008010_GRBM_EE_BUSY(tmp))
               ^
   drivers/gpu/drm/radeon/r600d.h:1766:37: note: expanded from macro 'G_008010_GRBM_EE_BUSY'
   #define         G_008010_GRBM_EE_BUSY(x)                (((x) >> 10) & 1)
                                                            ^~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/r600.c:1642:2: note: Taking false branch
           if (G_008010_GRBM_EE_BUSY(tmp))
           ^
   drivers/gpu/drm/radeon/r600.c:1647:6: note: Assuming the condition is false
           if (!(tmp & DMA_IDLE))
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/r600.c:1647:2: note: Taking false branch
           if (!(tmp & DMA_IDLE))
           ^
   drivers/gpu/drm/radeon/r600.c:1652:6: note: Assuming the condition is false
           if (G_000E50_RLC_RQ_PENDING(tmp) | G_000E50_RLC_BUSY(tmp))
               ^
   drivers/gpu/drm/radeon/r600d.h:1825:38: note: expanded from macro 'G_000E50_RLC_RQ_PENDING'
   #define         G_000E50_RLC_RQ_PENDING(x)              (((x) >> 3) & 1)
                                                           ^
   drivers/gpu/drm/radeon/r600.c:1652:2: note: Taking false branch
           if (G_000E50_RLC_RQ_PENDING(tmp) | G_000E50_RLC_BUSY(tmp))
           ^
   drivers/gpu/drm/radeon/r600.c:1655:6: note: Assuming the condition is false
           if (G_000E50_IH_BUSY(tmp))
               ^
   drivers/gpu/drm/radeon/r600d.h:1838:33: note: expanded from macro 'G_000E50_IH_BUSY'
   #define         G_000E50_IH_BUSY(x)                     (((x) >> 17) & 1)
                                                            ^~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/r600.c:1655:2: note: Taking false branch
           if (G_000E50_IH_BUSY(tmp))
           ^
   drivers/gpu/drm/radeon/r600.c:1658:6: note: Assuming the condition is false
           if (G_000E50_SEM_BUSY(tmp))
               ^
   drivers/gpu/drm/radeon/r600d.h:1836:34: note: expanded from macro 'G_000E50_SEM_BUSY'
   #define         G_000E50_SEM_BUSY(x)                    (((x) >> 14) & 1)
                                                            ^~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/r600.c:1658:2: note: Taking false branch
           if (G_000E50_SEM_BUSY(tmp))

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
