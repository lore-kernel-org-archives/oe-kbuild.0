Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDE3EB8
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Feb 2023 06:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676096162; x=1707632162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LWD+oK96IIZkrYqIJg/hQDcrUiyqcdkrNnf6Ag5lqHE=;
  b=OiHemTOZWqrbkknrZDVZhv1FsW7AurMUILHfgjS8vHuppA45JkkKllpy
   5f2dev4UG6wYLWDL2wetM9irHyfdGDGOHAbUu0WuekfRjZgYI8TMvV7E3
   EQZo+wtxAD3QenxQeswDSIKov2kGYPy582lsWR76zYg5GA1hWIaPtNY0L
   Ep+/wo2R8elRI+KpROqvbng36y+a4OmY0czIKoqYR9PvIcURsPvJos9Qf
   8ZQ5Um/8QTREu4VnbQpQN6C7SOFgY8NhjA0zBWQ8GKbxfEqqcKDRRIq6R
   DiIlWRMd5jPkEd8Z3AxnQod7Y8vmuhH1KaoNs4qJeeFyroCOaDZVMg4Xb
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="392991639"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="392991639"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 22:15:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="913764461"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="913764461"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Feb 2023 22:15:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQjAz-0006Hw-2q;
	Sat, 11 Feb 2023 06:15:57 +0000
Date: Sat, 11 Feb 2023 14:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/bcm/clk-raspberrypi.c:76:8: warning: Excessive padding
 in 'struct raspberrypi_clk_variant' (14 padding bytes, where 6 is optimal).
 Optimal fields order: clkdev, min_rate, export, minimize, consider
 reordering the fields or adding explicit padd...
Message-ID: <202302111413.9Pz6V14q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/bcm/clk-raspberrypi.c:76:8: warning: Excessive padding in 'struct raspberrypi_clk_variant' (14 padding bytes, where 6 is optimal). Optimal fields order: clkdev, min_rate, export, minimize, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Maxime Ripard <maxime@cerno.tech>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   420b2d431d18a2572c8e86579e78105cb5ed45b0
commit: e9d6cea2af1cf8d84287ff2287b6cd776f7475d2 clk: bcm: rpi: Run some clocks at the minimum rate allowed
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20230210 (https://download.01.org/0day-ci/archive/20230211/202302111413.9Pz6V14q-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e9d6cea2af1cf8d84287ff2287b6cd776f7475d2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e9d6cea2af1cf8d84287ff2287b6cd776f7475d2
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302111413.9Pz6V14q-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/vhost/vhost.c:2260:2: note: Taking false branch
           if (unlikely(log))
           ^
   drivers/vhost/vhost.c:2266:16: note: 'i' is < field 'num'
                   if (unlikely(i >= vq->num)) {
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/vhost/vhost.c:2266:3: note: Taking false branch
                   if (unlikely(i >= vq->num)) {
                   ^
   drivers/vhost/vhost.c:2271:16: note: Assuming the condition is false
                   if (unlikely(++found > vq->num)) {
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/vhost/vhost.c:2271:3: note: Taking false branch
                   if (unlikely(++found > vq->num)) {
                   ^
   drivers/vhost/vhost.c:2277:9: note: Calling 'vhost_get_desc'
                   ret = vhost_get_desc(vq, &desc, i);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.c:1052:9: note: Calling 'vhost_copy_from_user'
           return vhost_copy_from_user(vq, desc, vq->desc + idx, sizeof(*desc));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.c:857:6: note: Assuming field 'iotlb' is non-null
           if (!vq->iotlb)
               ^~~~~~~~~~
   drivers/vhost/vhost.c:857:2: note: Taking false branch
           if (!vq->iotlb)
           ^
   drivers/vhost/vhost.c:870:7: note: 'uaddr' is null
                   if (uaddr)
                       ^~~~~
   drivers/vhost/vhost.c:870:3: note: Taking false branch
                   if (uaddr)
                   ^
   drivers/vhost/vhost.c:876:7: note: Assuming 'ret' is >= 0
                   if (ret < 0) {
                       ^~~~~~~
   drivers/vhost/vhost.c:876:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   drivers/vhost/vhost.c:883:9: note: Calling 'copy_from_iter'
                   ret = copy_from_iter(to, size, &f);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uio.h:168:15: note: Assuming the condition is true
           if (unlikely(!check_copy_size(addr, bytes, false)))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/uio.h:168:2: note: Taking true branch
           if (unlikely(!check_copy_size(addr, bytes, false)))
           ^
   include/linux/uio.h:169:3: note: Returning without writing to 'addr->flags'
                   return 0;
                   ^
   drivers/vhost/vhost.c:883:9: note: Returning from 'copy_from_iter'
                   ret = copy_from_iter(to, size, &f);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.c:884:7: note: 'ret' is not equal to 'size'
                   if (ret == size)
                       ^~~
   drivers/vhost/vhost.c:884:3: note: Taking false branch
                   if (ret == size)
                   ^
   drivers/vhost/vhost.c:889:2: note: Returning without writing to 'to->flags'
           return ret;
           ^
   drivers/vhost/vhost.c:1052:9: note: Returning from 'vhost_copy_from_user'
           return vhost_copy_from_user(vq, desc, vq->desc + idx, sizeof(*desc));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.c:1052:2: note: Returning without writing to 'desc->flags'
           return vhost_copy_from_user(vq, desc, vq->desc + idx, sizeof(*desc));
           ^
   drivers/vhost/vhost.c:2277:9: note: Returning from 'vhost_get_desc'
                   ret = vhost_get_desc(vq, &desc, i);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.c:2278:3: note: Taking false branch
                   if (unlikely(ret)) {
                   ^
   drivers/vhost/vhost.c:2283:18: note: The left operand of '&' is a garbage value
                   if (desc.flags & cpu_to_vhost16(vq, VRING_DESC_F_INDIRECT)) {
                       ~~~~~~~~~~ ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/clk/bcm/clk-raspberrypi.c:76:8: warning: Excessive padding in 'struct raspberrypi_clk_variant' (14 padding bytes, where 6 is optimal). Optimal fields order: clkdev, min_rate, export, minimize, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct raspberrypi_clk_variant {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/bcm/clk-raspberrypi.c:76:8: note: Excessive padding in 'struct raspberrypi_clk_variant' (14 padding bytes, where 6 is optimal). Optimal fields order: clkdev, min_rate, export, minimize, consider reordering the fields or adding explicit padding members
   struct raspberrypi_clk_variant {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/mtd/nand/raw/meson_nand.c:285:8: warning: The result of the left shift is undefined due to shifting '524288' by '19', which is unrepresentable in the unsigned version of the return type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           cmd = CMDRWGEN(DMA_DIR(dir), scrambler, bch,
                 ^
   drivers/mtd/nand/raw/meson_nand.c:62:10: note: expanded from macro 'CMDRWGEN'
                   ((ran) << 19)                   |                       \
                          ^
   drivers/mtd/nand/raw/meson_nand.c:830:9: note: Calling 'meson_nfc_read_page_hwecc'
           return meson_nfc_read_page_hwecc(nand, NULL, 1, page);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/meson_nand.c:780:8: note: Calling 'meson_nfc_read_page_sub'
           ret = meson_nfc_read_page_sub(nand, page, 0);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/meson_nand.c:728:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/raw/meson_nand.c:728:2: note: Taking false branch
           if (ret)
           ^
   drivers/mtd/nand/raw/meson_nand.c:731:8: note: Calling 'meson_nfc_dma_buffer_setup'
           ret = meson_nfc_dma_buffer_setup(nand, meson_chip->data_buf,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/meson_nand.c:482:8: note: Calling 'dma_mapping_error'
           ret = dma_mapping_error(nfc->dev, nfc->daddr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:98:15: note: Assuming the condition is false
           if (unlikely(dma_addr == DMA_MAPPING_ERROR))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/dma-mapping.h:98:2: note: Taking false branch
           if (unlikely(dma_addr == DMA_MAPPING_ERROR))
           ^
   include/linux/dma-mapping.h:100:2: note: Returning zero, which participates in a condition later
           return 0;
           ^~~~~~~~
   drivers/mtd/nand/raw/meson_nand.c:482:8: note: Returning from 'dma_mapping_error'
           ret = dma_mapping_error(nfc->dev, nfc->daddr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/meson_nand.c:483:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/mtd/nand/raw/meson_nand.c:483:2: note: Taking false branch
           if (ret) {
           ^
   drivers/mtd/nand/raw/meson_nand.c:493:6: note: Assuming 'infobuf' is null
           if (infobuf) {
               ^~~~~~~
   drivers/mtd/nand/raw/meson_nand.c:493:2: note: Taking false branch
           if (infobuf) {
           ^
   drivers/mtd/nand/raw/meson_nand.c:509:2: note: Returning zero (loaded from 'ret'), which participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/mtd/nand/raw/meson_nand.c:731:8: note: Returning from 'meson_nfc_dma_buffer_setup'
           ret = meson_nfc_dma_buffer_setup(nand, meson_chip->data_buf,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/meson_nand.c:734:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/raw/meson_nand.c:734:2: note: Taking false branch
           if (ret)
           ^
   drivers/mtd/nand/raw/meson_nand.c:737:6: note: Assuming the condition is true
           if (nand->options & NAND_NEED_SCRAMBLING) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/meson_nand.c:737:2: note: Taking true branch
           if (nand->options & NAND_NEED_SCRAMBLING) {
           ^
   drivers/mtd/nand/raw/meson_nand.c:740:10: note: Passing the value 524288 via 4th parameter 'scrambler'
                                        NFC_CMD_SCRAMBLER_ENABLE);
                                        ^
   drivers/mtd/nand/raw/meson_nand.c:36:34: note: expanded from macro 'NFC_CMD_SCRAMBLER_ENABLE'
   #define NFC_CMD_SCRAMBLER_ENABLE        BIT(19)
                                           ^~~~~~~
   include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                   ^~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/meson_nand.c:739:3: note: Calling 'meson_nfc_cmd_access'
                   meson_nfc_cmd_access(nand, raw, DIRREAD,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/meson_nand.c:276:6: note: 'raw' is 0
           if (raw) {
               ^~~
   drivers/mtd/nand/raw/meson_nand.c:276:2: note: Taking false branch
           if (raw) {

vim +76 drivers/clk/bcm/clk-raspberrypi.c

4e85e535e6cc6e Nicolas Saenz Julienne 2019-06-12  75  
12c90f3f27bb3a Maxime Ripard          2022-02-25 @76  struct raspberrypi_clk_variant {
12c90f3f27bb3a Maxime Ripard          2022-02-25  77  	bool		export;
12c90f3f27bb3a Maxime Ripard          2022-02-25  78  	char		*clkdev;
542acfec4e313c Maxime Ripard          2022-02-25  79  	unsigned long	min_rate;
e9d6cea2af1cf8 Maxime Ripard          2022-02-25  80  	bool		minimize;
12c90f3f27bb3a Maxime Ripard          2022-02-25  81  };
12c90f3f27bb3a Maxime Ripard          2022-02-25  82  

:::::: The code at line 76 was first introduced by commit
:::::: 12c90f3f27bb3ad0dd3fad1550fec87091aa3329 clk: bcm: rpi: Add variant structure

:::::: TO: Maxime Ripard <maxime@cerno.tech>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
