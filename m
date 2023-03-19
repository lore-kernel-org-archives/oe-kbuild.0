Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370A77C
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 02:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679191631; x=1710727631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=immxXNf7kgOhVTeoM9TWBXC6fxgSF1pnrVmCR9QnkYk=;
  b=SDpCNXCkhOJdkzHaGUgSWuVhdwaFAiH27cuWTq4ZK3d5Wxurasv7CEHz
   dw8z6fXOHJ9GPLWOtEFyePqa9S9M8+RMoncgm9+nIi8zVfZlgZfkSMcql
   babGS0tPIBwjJC7StRrRs0pJPE3mna7T35SOWBrSrqsmdrPe+Vaoa89Cz
   mHWRMHJA1yk3a9QnWQ/XoxAIzO+/peXbkIjvX2XFOl9B4SQcuAj/YyRRj
   1jQ7VotRX50iCz9JTC+l6Wk7glSlTxWwl9pLuhw1o5cE+4lSeU7L5+Bz5
   vCvLuBZWDJj0I+wKl9IqKwZpOqPxFeWNjG+eRwiFB/fR/gOwMmMaLZOHf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="424751267"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="424751267"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 19:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="680685639"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="680685639"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Mar 2023 19:06:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdiRl-000AKw-33;
	Sun, 19 Mar 2023 02:06:57 +0000
Date: Sun, 19 Mar 2023 10:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/fpga/microchip-spi.c:42:8: warning: Excessive padding in
 'struct mpf_priv' (57 padding bytes, where 25 is optimal). Optimal fields
 order: tx, program_mode, rx, spi, consider reordering the fields or adding
 explicit padding members [clang-analyzer-...
Message-ID: <202303190944.qo5qqa6q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/fpga/microchip-spi.c:42:8: warning: Excessive padding in 'struct mpf_priv' (57 padding bytes, where 25 is optimal). Optimal fields order: tx, program_mode, rx, spi, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ivan Bornyakov <i.bornyakov@metrotek.ru>
CC: Xu Yilun <yilun.xu@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a3671bd86a9770e34969522d29bb30a1b66fd88a
commit: 1da53d23a41c5f77963984d8da5623ed56918ada fpga: microchip-spi: move SPI I/O buffers out of stack
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-c002-20230318 (https://download.01.org/0day-ci/archive/20230319/202303190944.qo5qqa6q-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1da53d23a41c5f77963984d8da5623ed56918ada
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1da53d23a41c5f77963984d8da5623ed56918ada
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303190944.qo5qqa6q-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/nvme/target/zns.c:493:6: note: Assuming field 'select_all' is not equal to 0
           if (req->cmd->zms.select_all) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/zns.c:493:2: note: Taking true branch
           if (req->cmd->zms.select_all) {
           ^
   drivers/nvme/target/zns.c:494:12: note: Calling 'nvmet_bdev_execute_zmgmt_send_all'
                   status = nvmet_bdev_execute_zmgmt_send_all(req);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/zns.c:455:2: note: Control jumps to 'case REQ_OP_ZONE_FINISH:'  at line 465
           switch (zsa_req_op(req->cmd->zms.zsa)) {
           ^
   drivers/nvme/target/zns.c:466:10: note: Calling 'nvmet_bdev_zone_mgmt_emulate_all'
                   return nvmet_bdev_zone_mgmt_emulate_all(req);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/zns.c:412:6: note: Assuming field 'zbitmap' is non-null
           if (!d.zbitmap) {
               ^~~~~~~~~~
   drivers/nvme/target/zns.c:412:2: note: Taking false branch
           if (!d.zbitmap) {
           ^
   drivers/nvme/target/zns.c:419:6: note: Assuming 'ret' is equal to 'nr_zones'
           if (ret != nr_zones) {
               ^~~~~~~~~~~~~~~
   drivers/nvme/target/zns.c:419:2: note: Taking false branch
           if (ret != nr_zones) {
           ^
   drivers/nvme/target/zns.c:428:9: note: Assuming the condition is true
           while (sector < bdev_nr_sectors(bdev)) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/zns.c:428:2: note: Loop condition is true.  Entering loop body
           while (sector < bdev_nr_sectors(bdev)) {
           ^
   drivers/nvme/target/zns.c:429:16: note: Calling 'disk_zone_no'
                   if (test_bit(disk_zone_no(bdev->bd_disk, sector), d.zbitmap)) {
                                ^
   include/linux/bitops.h:61:46: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                                            ^~
   include/linux/bitops.h:49:25: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
                                  ^~
   include/linux/blkdev.h:669:2: note: Taking false branch
           if (!blk_queue_is_zoned(disk->queue))
           ^
   include/linux/blkdev.h:671:19: note: '?' condition is false
           return sector >> ilog2(disk->queue->limits.chunk_sectors);
                            ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   include/linux/blkdev.h:671:19: note: '?' condition is true
           return sector >> ilog2(disk->queue->limits.chunk_sectors);
                            ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <= 4) ?              \
           ^
   include/linux/blkdev.h:671:19: note: Calling '__ilog2_u32'
           return sector >> ilog2(disk->queue->limits.chunk_sectors);
                            ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:24:2: note: Returning the value -1
           return fls(n) - 1;
           ^~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:671:19: note: Returning from '__ilog2_u32'
           return sector >> ilog2(disk->queue->limits.chunk_sectors);
                            ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   include/linux/blkdev.h:671:16: note: The result of the right shift is undefined because the right operand is negative
           return sector >> ilog2(disk->queue->limits.chunk_sectors);
                         ^
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
>> drivers/fpga/microchip-spi.c:42:8: warning: Excessive padding in 'struct mpf_priv' (57 padding bytes, where 25 is optimal). Optimal fields order: tx, program_mode, rx, spi, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct mpf_priv {
   ~~~~~~~^~~~~~~~~~
   drivers/fpga/microchip-spi.c:42:8: note: Excessive padding in 'struct mpf_priv' (57 padding bytes, where 25 is optimal). Optimal fields order: tx, program_mode, rx, spi, consider reordering the fields or adding explicit padding members
   struct mpf_priv {
   ~~~~~~~^~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/fpga/altera-freeze-bridge.c:69:4: warning: Value stored to 'ctrl' is never read [clang-analyzer-deadcode.DeadStores]
                           ctrl = readl(priv->base_addr + FREEZE_CSR_CTRL_OFFSET);
                           ^
   drivers/fpga/altera-freeze-bridge.c:69:4: note: Value stored to 'ctrl' is never read
   drivers/fpga/altera-freeze-bridge.c:150:2: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status = readl(priv->base_addr + FREEZE_CSR_STATUS_OFFSET);
           ^
   drivers/fpga/altera-freeze-bridge.c:150:2: note: Value stored to 'status' is never read
   2 warnings generated.
   drivers/tee/tee_core.c:444:11: warning: Access to field 'attr' results in a dereference of a null pointer (loaded from variable 'p') [clang-analyzer-core.NullDereference]
                   switch (p->attr) {
                           ^
   drivers/tee/tee_core.c:823:2: note: Control jumps to 'case 2148574211:'  at line 832
           switch (cmd) {
           ^
   drivers/tee/tee_core.c:833:10: note: Calling 'tee_ioctl_invoke'
                   return tee_ioctl_invoke(ctx, uarg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:552:2: note: 'params' initialized to a null pointer value
           struct tee_param *params = NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:554:6: note: Assuming field 'invoke_func' is non-null
           if (!ctx->teedev->desc->ops->invoke_func)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:554:2: note: Taking false branch
           if (!ctx->teedev->desc->ops->invoke_func)
           ^
   drivers/tee/tee_core.c:557:2: note: Taking false branch
           if (copy_from_user(&buf, ubuf, sizeof(buf)))
           ^
   drivers/tee/tee_core.c:560:6: note: Assuming field 'buf_len' is <= TEE_MAX_ARG_SIZE
           if (buf.buf_len > TEE_MAX_ARG_SIZE ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:560:6: note: Left side of '||' is false
   drivers/tee/tee_core.c:561:6: note: Assuming the condition is false
               buf.buf_len < sizeof(struct tee_ioctl_invoke_arg))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:560:2: note: Taking false branch
           if (buf.buf_len > TEE_MAX_ARG_SIZE ||
           ^
   drivers/tee/tee_core.c:565:6: note: Calling 'copy_from_user'
           if (copy_from_user(&arg, uarg, sizeof(arg)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:160:2: note: Taking true branch
           if (check_copy_size(to, n, false))
           ^
   include/linux/uaccess.h:161:7: note: Calling '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:125:6: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:125:6: note: Left side of '&&' is true
   include/linux/uaccess.h:125:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:127:9: note: Calling 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:518:6: note: Value assigned to 'arg.num_params', which participates in a condition later
           n = arm_copy_from_user(to, from, n);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:127:9: note: Returning from 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:130:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:130:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:161:7: note: Returning from '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:565:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&arg, uarg, sizeof(arg)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:565:2: note: Taking false branch
           if (copy_from_user(&arg, uarg, sizeof(arg)))
           ^
   drivers/tee/tee_core.c:568:6: note: Assuming the condition is false
           if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:568:2: note: Taking false branch
           if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
           ^
   drivers/tee/tee_core.c:571:6: note: Assuming field 'num_params' is 0
           if (arg.num_params) {
               ^~~~~~~~~~~~~~

vim +42 drivers/fpga/microchip-spi.c

5f8d4a9008307e Ivan Bornyakov 2022-06-23  41  
5f8d4a9008307e Ivan Bornyakov 2022-06-23 @42  struct mpf_priv {
5f8d4a9008307e Ivan Bornyakov 2022-06-23  43  	struct spi_device *spi;
5f8d4a9008307e Ivan Bornyakov 2022-06-23  44  	bool program_mode;
1da53d23a41c5f Ivan Bornyakov 2022-12-30  45  	u8 tx __aligned(ARCH_KMALLOC_MINALIGN);
1da53d23a41c5f Ivan Bornyakov 2022-12-30  46  	u8 rx;
5f8d4a9008307e Ivan Bornyakov 2022-06-23  47  };
5f8d4a9008307e Ivan Bornyakov 2022-06-23  48  

:::::: The code at line 42 was first introduced by commit
:::::: 5f8d4a9008307e0bf210906948953386935d361c fpga: microchip-spi: add Microchip MPF FPGA manager

:::::: TO: Ivan Bornyakov <i.bornyakov@metrotek.ru>
:::::: CC: Xu Yilun <yilun.xu@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
