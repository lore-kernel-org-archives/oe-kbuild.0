Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9172C9D
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 23:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679096185; x=1710632185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tmVipv5ajtE+TXdScJim3oYbOsaAfetKjSl5WT8ToGU=;
  b=bLBr4icwP9EtDEYpFjdZ3gtyLfKJr5YPxant0MpvyizVKLBOc9pk4r9t
   Y3E+StYSb9+khfbNIt+EvPLcbig2FttK2bdUHuziRB+mFC1CZl+gh/FvC
   iRW/8sH40HLE7BYBhprmFYX/XjKjmlsAhUWQWvGRPUxdyf028nM+5kqEV
   mUjs3YeH6eeo73rZBjRaSP/b3NPQO9JgNaQf3nnXkdocIK/pAUsRdnKHz
   7mVYpvuVcw4ZpW2tsI0npTgOLDq/cxgMsPrBi8Aiksn0au4KhR1rU/rOl
   PC1LdmZDk5M1JcA0erihDQJ3Dm8MxE3IEp06vyCuNL79fSscso7sXKC0B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="335879451"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="335879451"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 16:36:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="657732587"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="657732587"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Mar 2023 16:36:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdJcV-0009ek-0w;
	Fri, 17 Mar 2023 23:36:23 +0000
Date: Sat, 18 Mar 2023 07:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/firmware/arm_scmi/driver.c:2508:2: warning: Attempt to free
 released memory [clang-analyzer-unix.Malloc]
Message-ID: <202303180736.06LdKRke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/firmware/arm_scmi/driver.c:2508:2: warning: Attempt to free released memory [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d3c682a5e3d9dfc2448ecbb22f4cd48359b9e21
commit: c3d4aed763ce4a39f8ed36c7b7cd9a6a35971329 firmware: arm_scmi: Populate a common SCMI debugfs root
date:   8 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20230310 (https://download.01.org/0day-ci/archive/20230318/202303180736.06LdKRke-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c3d4aed763ce4a39f8ed36c7b7cd9a6a35971329
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c3d4aed763ce4a39f8ed36c7b7cd9a6a35971329
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303180736.06LdKRke-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:179:6: note: 'dvfs_pt1' is true
           if (dvfs_pt1 || periodic_training_update) {
               ^~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:179:15: note: Left side of '||' is true
           if (dvfs_pt1 || periodic_training_update) {
                        ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:185:6: note: 'dvfs_pt1' is true
           if (dvfs_pt1)
               ^~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:185:2: note: Taking true branch
           if (dvfs_pt1)
           ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:192:6: note: 'dvfs_update' is false
           if (dvfs_update || periodic_training_update) {
               ^~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:192:6: note: Left side of '||' is false
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:192:21: note: 'periodic_training_update' is false
           if (dvfs_update || periodic_training_update) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:192:2: note: Taking false branch
           if (dvfs_update || periodic_training_update) {
           ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:206:11: note: Field 'num_channels' is <= 1
           if (emc->num_channels > 1) {
                    ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:206:2: note: Taking false branch
           if (emc->num_channels > 1) {
           ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:262:6: note: Assuming field 'num_devices' is >= 2
           if (emc->num_devices < 2)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:262:2: note: Taking false branch
           if (emc->num_devices < 2)
           ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:268:6: note: 'dvfs_pt1' is true
           if (dvfs_pt1 || periodic_training_update) {
               ^~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:268:15: note: Left side of '||' is true
           if (dvfs_pt1 || periodic_training_update) {
                        ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:271:15: note: Assuming 'i' is >= field 'num_channels'
                   for (i = 0; i < emc->num_channels; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:271:3: note: Loop condition is false. Execution continues on line 280
                   for (i = 0; i < emc->num_channels; i++) {
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:282:15: note: Assuming 'i' is < field 'num_channels'
                   for (i = 0; i < emc->num_channels; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:282:3: note: Loop condition is true.  Entering loop body
                   for (i = 0; i < emc->num_channels; i++) {
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:282:15: note: Assuming 'i' is < field 'num_channels'
                   for (i = 0; i < emc->num_channels; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:282:3: note: Loop condition is true.  Entering loop body
                   for (i = 0; i < emc->num_channels; i++) {
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:283:15: note: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage
                           temp[i][0] |= (value & 0x00ff) >> 0;
                           ~~~~~~~~~~ ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:456:5: warning: Value stored to 'adel' is never read [clang-analyzer-deadcode.DeadStores]
                                   adel = update_clock_tree_delay(emc, DVFS_PT1);
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:456:5: note: Value stored to 'adel' is never read
                                   adel = update_clock_tree_delay(emc, DVFS_PT1);
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:500:3: warning: Value stored to 'value' is never read [clang-analyzer-deadcode.DeadStores]
                   value = emc_readl(emc, EMC_DBG);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:500:3: note: Value stored to 'value' is never read
                   value = emc_readl(emc, EMC_DBG);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:875:3: warning: Value stored to 'zq_wait_long' is never read [clang-analyzer-deadcode.DeadStores]
                   zq_wait_long = max((u32)1, div_o3(1000000, dst_clk_period));
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:875:3: note: Value stored to 'zq_wait_long' is never read
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:877:3: warning: Value stored to 'zq_wait_long' is never read [clang-analyzer-deadcode.DeadStores]
                   zq_wait_long = max(next->min_mrs_wait,
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:877:3: note: Value stored to 'zq_wait_long' is never read
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:880:3: warning: Value stored to 'zq_wait_long' is never read [clang-analyzer-deadcode.DeadStores]
                   zq_wait_long = max((u32)256,
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:880:3: note: Value stored to 'zq_wait_long' is never read
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:883:3: warning: Value stored to 'zq_wait_long' is never read [clang-analyzer-deadcode.DeadStores]
                   zq_wait_long = 0;
                   ^              ~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:883:3: note: Value stored to 'zq_wait_long' is never read
                   zq_wait_long = 0;
                   ^              ~
   1 warning generated.
   drivers/input/misc/atmel_captouch.c:68:8: warning: Excessive padding in 'struct atmel_captouch_device' (43 padding bytes, where 11 is optimal). Optimal fields order: xfer_buf, client, input, num_btn, keycodes, prev_btn, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct atmel_captouch_device {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/atmel_captouch.c:68:8: note: Excessive padding in 'struct atmel_captouch_device' (43 padding bytes, where 11 is optimal). Optimal fields order: xfer_buf, client, input, num_btn, keycodes, prev_btn, consider reordering the fields or adding explicit padding members
   struct atmel_captouch_device {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> drivers/firmware/arm_scmi/driver.c:2508:2: warning: Attempt to free released memory [clang-analyzer-unix.Malloc]
           kfree(dbg->name);
           ^
   drivers/firmware/arm_scmi/driver.c:2587:6: note: Assuming 'desc' is non-null
           if (!desc)
               ^~~~~
   drivers/firmware/arm_scmi/driver.c:2587:2: note: Taking false branch
           if (!desc)
           ^
   drivers/firmware/arm_scmi/driver.c:2591:6: note: Assuming 'info' is non-null
           if (!info)
               ^~~~~
   drivers/firmware/arm_scmi/driver.c:2591:2: note: Taking false branch
           if (!info)
           ^
   drivers/firmware/arm_scmi/driver.c:2595:6: note: Assuming field 'id' is >= 0
           if (info->id < 0)
               ^~~~~~~~~~~~
   drivers/firmware/arm_scmi/driver.c:2595:2: note: Taking false branch
           if (info->id < 0)
           ^
   drivers/firmware/arm_scmi/driver.c:2604:2: note: Loop condition is false.  Exiting loop
           mutex_init(&info->protocols_mtx);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/firmware/arm_scmi/driver.c:2606:2: note: Loop condition is false.  Exiting loop
           mutex_init(&info->devreq_mtx);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/firmware/arm_scmi/driver.c:2620:2: note: Taking false branch
           if (!of_property_read_u32(np, "atomic-threshold-us",
           ^
   drivers/firmware/arm_scmi/driver.c:2627:6: note: Assuming field 'link_supplier' is null
           if (desc->ops->link_supplier) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/driver.c:2627:2: note: Taking false branch
           if (desc->ops->link_supplier) {
           ^
   drivers/firmware/arm_scmi/driver.c:2635:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/firmware/arm_scmi/driver.c:2635:2: note: Taking false branch
           if (ret)
           ^
   drivers/firmware/arm_scmi/driver.c:2639:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/firmware/arm_scmi/driver.c:2639:2: note: Taking false branch
           if (ret)
           ^
   drivers/firmware/arm_scmi/driver.c:2644:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/firmware/arm_scmi/driver.c:2644:2: note: Taking false branch
           if (ret)
           ^
   drivers/firmware/arm_scmi/driver.c:2648:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/firmware/arm_scmi/driver.c:2648:2: note: Taking false branch
           if (ret)
           ^
   drivers/firmware/arm_scmi/driver.c:2651:6: note: Assuming 'scmi_top_dentry' is non-null
           if (scmi_top_dentry) {
               ^~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/driver.c:2651:2: note: Taking true branch
           if (scmi_top_dentry) {
           ^
   drivers/firmware/arm_scmi/driver.c:2652:15: note: Calling 'scmi_debugfs_common_setup'
                   info->dbg = scmi_debugfs_common_setup(info);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/driver.c:2520:6: note: Assuming 'dbg' is non-null
           if (!dbg)
               ^~~~
   drivers/firmware/arm_scmi/driver.c:2520:2: note: Taking false branch
           if (!dbg)
           ^
   drivers/firmware/arm_scmi/driver.c:2524:6: note: Assuming field 'name' is non-null
           if (!dbg->name) {
               ^~~~~~~~~~
   drivers/firmware/arm_scmi/driver.c:2524:2: note: Taking false branch
           if (!dbg->name) {
           ^
   drivers/firmware/arm_scmi/driver.c:2531:6: note: Assuming field 'type' is non-null
           if (!dbg->type) {
               ^~~~~~~~~~
   drivers/firmware/arm_scmi/driver.c:2531:2: note: Taking false branch
           if (!dbg->type) {
           ^
   drivers/firmware/arm_scmi/driver.c:2541:19: note: Assuming field 'atomic_enabled' is false
           dbg->is_atomic = info->desc->atomic_enabled &&
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/driver.c:2541:46: note: Left side of '&&' is false
           dbg->is_atomic = info->desc->atomic_enabled &&
                                                       ^
   drivers/firmware/arm_scmi/driver.c:2568:6: note: Calling 'devm_add_action_or_reset'
           if (devm_add_action_or_reset(info->dev,

vim +2508 drivers/firmware/arm_scmi/driver.c

53b8c25df7082e Cristian Marussi 2022-12-22  2499  
c3d4aed763ce4a Cristian Marussi 2023-01-18  2500  static void scmi_debugfs_common_cleanup(void *d)
c3d4aed763ce4a Cristian Marussi 2023-01-18  2501  {
c3d4aed763ce4a Cristian Marussi 2023-01-18  2502  	struct scmi_debug_info *dbg = d;
c3d4aed763ce4a Cristian Marussi 2023-01-18  2503  
c3d4aed763ce4a Cristian Marussi 2023-01-18  2504  	if (!dbg)
c3d4aed763ce4a Cristian Marussi 2023-01-18  2505  		return;
c3d4aed763ce4a Cristian Marussi 2023-01-18  2506  
c3d4aed763ce4a Cristian Marussi 2023-01-18  2507  	debugfs_remove_recursive(dbg->top_dentry);
c3d4aed763ce4a Cristian Marussi 2023-01-18 @2508  	kfree(dbg->name);
c3d4aed763ce4a Cristian Marussi 2023-01-18  2509  	kfree(dbg->type);
c3d4aed763ce4a Cristian Marussi 2023-01-18  2510  }
c3d4aed763ce4a Cristian Marussi 2023-01-18  2511  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
