Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732C68BE0
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Apr 2023 15:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680796079; x=1712332079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d0JbZmHuRQDpDW+O4Ca2ZjA2T337Oh0nh2FwYlirl2I=;
  b=EluGpxX1udqkQy/gmNBLbE2SMPvqS5opxROk9nprTXOwxxibVXuSwUYQ
   ZovA8CAvxqTFniqwXgCY23xgm97V2BlrTyOhaHiCR9NwjDait9J9pV/Nr
   ZWv2cG2WDg/ZNTD+WGQ2NOSxZepyvaDF6mrd9yxWKj59ESDZJot6d0bPH
   igKzgKnBiFKKgdPanhV26eo5gBftfS4hiG6pyLh5hYkQ/CYAKb3M30c9u
   p/XVI/LvhCnAy77de4+LWS9qnfLhxLfFj+J+uwCT5MMNZ2ogJsvXKvhLB
   4MnJjzBzeUze4fSZWIWI3qA78KSZeQc/F2kIMjAEhLHprubLC3tfeqzyJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="331406183"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="331406183"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 08:47:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="933245842"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="933245842"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Apr 2023 08:47:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkRq9-000RTq-04;
	Thu, 06 Apr 2023 15:47:57 +0000
Date: Thu, 6 Apr 2023 23:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iommu/exynos-iommu.c:194:8: warning: Excessive padding in
 'struct sysmmu_v1_fault_info' (10 padding bytes, where 2 is optimal).
 Optimal fields order: name, type, addr_reg, consider reordering the fields
 or adding explicit padding members [clang-an...
Message-ID: <202304062339.I7qWfhpj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iommu/exynos-iommu.c:194:8: warning: Excessive padding in 'struct sysmmu_v1_fault_info' (10 padding bytes, where 2 is optimal). Optimal fields order: name, type, addr_reg, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sam Protsenko <semen.protsenko@linaro.org>
CC: Joerg Roedel <jroedel@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   99ddf2254febae9eab7fb0bcc02c5322243f5c49
commit: c64074bfe2abbe18a57eb19c95f686298e8692b5 iommu/exynos: Abstract getting the fault info
date:   2 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 2 months ago
config: riscv-randconfig-c006-20230402 (https://download.01.org/0day-ci/archive/20230406/202304062339.I7qWfhpj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c64074bfe2abbe18a57eb19c95f686298e8692b5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c64074bfe2abbe18a57eb19c95f686298e8692b5
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304062339.I7qWfhpj-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   include/linux/spinlock.h:241:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:656:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&ctx->reg_slock, flags);
           ^
   include/linux/spinlock.h:378:43: note: expanded from macro 'spin_lock_irqsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/gpu/drm/exynos/exynos_mixer.c:660:32: note: The result of the left shift is undefined because the left operand is negative
                   MXR_GRP_CFG_FORMAT_VAL(fmt), MXR_GRP_CFG_FORMAT_MASK);
                                                ^
   drivers/gpu/drm/exynos/regs-mixer.h:120:34: note: expanded from macro 'MXR_GRP_CFG_FORMAT_MASK'
   #define MXR_GRP_CFG_FORMAT_MASK         MXR_GRP_CFG_FORMAT_VAL(~0)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/regs-mixer.h:119:35: note: expanded from macro 'MXR_GRP_CFG_FORMAT_VAL'
   #define MXR_GRP_CFG_FORMAT_VAL(x)       MXR_MASK_VAL(x, 11, 8)
                                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/regs-mixer.h:70:10: note: expanded from macro 'MXR_MASK_VAL'
           (((val) << (low_bit)) & MXR_MASK(high_bit, low_bit))
             ~~~~~ ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/clk/bcm/clk-iproc-pll.c:172:3: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val = readl(base + offset);
                   ^
   drivers/clk/bcm/clk-iproc-pll.c:172:3: note: Value stored to 'val' is never read
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/clk/bcm/clk-raspberrypi.c:59:8: warning: Excessive padding in 'struct raspberrypi_clk_variant' (14 padding bytes, where 6 is optimal). Optimal fields order: clkdev, min_rate, export, minimize, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct raspberrypi_clk_variant {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/bcm/clk-raspberrypi.c:59:8: note: Excessive padding in 'struct raspberrypi_clk_variant' (14 padding bytes, where 6 is optimal). Optimal fields order: clkdev, min_rate, export, minimize, consider reordering the fields or adding explicit padding members
   struct raspberrypi_clk_variant {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   39 warnings generated.
>> drivers/iommu/exynos-iommu.c:194:8: warning: Excessive padding in 'struct sysmmu_v1_fault_info' (10 padding bytes, where 2 is optimal). Optimal fields order: name, type, addr_reg, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct sysmmu_v1_fault_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/exynos-iommu.c:194:8: note: Excessive padding in 'struct sysmmu_v1_fault_info' (10 padding bytes, where 2 is optimal). Optimal fields order: name, type, addr_reg, consider reordering the fields or adding explicit padding members
   struct sysmmu_v1_fault_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/exynos-iommu.c:551:11: warning: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           writel(1 << itype, SYSMMU_REG(data, int_clear));
                    ^
   arch/riscv/include/asm/mmio.h:144:48: note: expanded from macro 'writel'
   #define writel(v, c)    ({ __io_bw(); writel_cpu((v), (c)); __io_aw(); })
                                                     ^
   arch/riscv/include/asm/mmio.h:93:71: note: expanded from macro 'writel_cpu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_le32(v), (c)))
                                                                                ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   drivers/iommu/exynos-iommu.c:530:10: note: Assuming field 'active' is false
           WARN_ON(!data->active);
                   ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/iommu/exynos-iommu.c:530:2: note: Taking true branch
           WARN_ON(!data->active);
           ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/iommu/exynos-iommu.c:530:2: note: Loop condition is false.  Exiting loop
           WARN_ON(!data->active);
           ^
   include/asm-generic/bug.h:124:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:102:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/riscv/include/asm/bug.h:79:29: note: expanded from macro '__WARN_FLAGS'
   #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
                               ^
   arch/riscv/include/asm/bug.h:53:32: note: expanded from macro '__BUG_FLAGS'
   #define __BUG_FLAGS(flags)                                      \
                                                                   ^
   drivers/iommu/exynos-iommu.c:535:16: note: Loop condition is false.  Exiting loop
           itype = __ffs(readl(SYSMMU_REG(data, int_status)));
                         ^
   arch/riscv/include/asm/mmio.h:140:30: note: expanded from macro 'readl'
   #define readl(c)        ({ u32 __v; __io_br(); __v = readl_cpu(c); __io_ar(__v); __v; })
                                       ^
   arch/riscv/include/asm/mmio.h:133:19: note: expanded from macro '__io_br'
   #define __io_br()       do {} while (0)
                           ^
   drivers/iommu/exynos-iommu.c:535:10: note: Calling '__ffs'
           itype = __ffs(readl(SYSMMU_REG(data, int_status)));
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:6: note: Assuming the condition is true
           if ((word & 0xffffffff) == 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:2: note: Taking true branch
           if ((word & 0xffffffff) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:19:3: note: The value 32 is assigned to 'num'
                   num += 32;
                   ^~~~~~~~~
   include/asm-generic/bitops/__ffs.h:23:6: note: Assuming the condition is false
           if ((word & 0xffff) == 0) {
               ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:23:2: note: Taking false branch
           if ((word & 0xffff) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:27:6: note: Assuming the condition is false
           if ((word & 0xff) == 0) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:27:2: note: Taking false branch
           if ((word & 0xff) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:31:6: note: Assuming the condition is false
           if ((word & 0xf) == 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:31:2: note: Taking false branch
           if ((word & 0xf) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:35:6: note: Assuming the condition is false
           if ((word & 0x3) == 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:35:2: note: Taking false branch
           if ((word & 0x3) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:39:6: note: Assuming the condition is false
           if ((word & 0x1) == 0)
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:39:2: note: Taking false branch
           if ((word & 0x1) == 0)
           ^
   include/asm-generic/bitops/__ffs.h:41:2: note: Returning the value 32 (loaded from 'num')
           return num;
           ^~~~~~~~~~
   drivers/iommu/exynos-iommu.c:535:10: note: Returning from '__ffs'
           itype = __ffs(readl(SYSMMU_REG(data, int_status)));

vim +194 drivers/iommu/exynos-iommu.c

c64074bfe2abbe1 Sam Protsenko    2022-07-26  193  
c64074bfe2abbe1 Sam Protsenko    2022-07-26 @194  struct sysmmu_v1_fault_info {
c64074bfe2abbe1 Sam Protsenko    2022-07-26  195  	unsigned short addr_reg; /* register to read IOVA fault address */
d093fc7e8390c3e Marek Szyprowski 2016-02-18  196  	const char *name;	/* human readable fault name */
d093fc7e8390c3e Marek Szyprowski 2016-02-18  197  	unsigned int type;	/* fault type for report_iommu_fault */
2a96536e77b43cf KyongHo Cho      2012-05-12  198  };
2a96536e77b43cf KyongHo Cho      2012-05-12  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
