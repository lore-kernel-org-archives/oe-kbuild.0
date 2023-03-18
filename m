Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4048A4D
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 09:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679130161; x=1710666161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ykJMuu52kU8pM/FyOa4vF4OjdyqGBQO4aA3fEaefiPk=;
  b=eshhkVhLCSlpk8DZRChOsv9r8qSaTHloUss1C2G7Cg1xnFtp0EbMIaVL
   8Q9nCE/gQ2pFn69Y18vg+iQWBjSPpl8czR1hUfY8OaFmJIvd5nx0ju+E3
   qaKKkXnn+O/kNJHQTBCcmVoggr1OrkPEXrTBDbuOjngPTowL0eMNmk4y1
   lvlaRwyX7+yOeNvD2Qrg7bezPYbVHRCMs7jBl3nOAZDcnMNqH5QXrgl13
   6lVNZROa2fV3Srg/HTvEaHzrcd9VPDxl8tVmskYMnTUUQ1WRwirAfUvxL
   N766qaBqJpWz5+wm3SBeL713RSVrzrTaTY06y7iirPmVYMIsIA8URIA0y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="366126885"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="366126885"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 02:02:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="744816955"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="744816955"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Mar 2023 02:02:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdSSV-0009xa-1o;
	Sat, 18 Mar 2023 09:02:39 +0000
Date: Sat, 18 Mar 2023 17:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v2 4/4] fpga: add initial KUnit test suites
Message-ID: <202303181604.tXQ4uHom-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/fpga/tests/fake-fpga-region.c:146:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230310170412.708363-5-marpagan@redhat.com>
References: <20230310170412.708363-5-marpagan@redhat.com>
TO: Marco Pagani <marpagan@redhat.com>

Hi Marco,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc2 next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Pagani/fpga-add-fake-FPGA-manager/20230311-010757
patch link:    https://lore.kernel.org/r/20230310170412.708363-5-marpagan%40redhat.com
patch subject: [RFC PATCH v2 4/4] fpga: add initial KUnit test suites
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: s390-randconfig-c005-20230312 (https://download.01.org/0day-ci/archive/20230318/202303181604.tXQ4uHom-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6af16afaf84ee6f061e6953eebca1a786c5be576
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marco-Pagani/fpga-add-fake-FPGA-manager/20230311-010757
        git checkout 6af16afaf84ee6f061e6953eebca1a786c5be576
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303181604.tXQ4uHom-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/stm/core.c:633:2: note: Taking true branch
           if (!stmf->output.nr_chans) {
           ^
   drivers/hwtracing/stm/core.c:637:3: note: Taking false branch
                   get_task_comm(comm, current);
                   ^
   include/linux/sched.h:1989:2: note: expanded from macro 'get_task_comm'
           BUILD_BUG_ON(sizeof(buf) != TASK_COMM_LEN);     \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:377:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwtracing/stm/core.c:637:3: note: Loop condition is false.  Exiting loop
                   get_task_comm(comm, current);
                   ^
   include/linux/sched.h:1989:2: note: expanded from macro 'get_task_comm'
           BUILD_BUG_ON(sizeof(buf) != TASK_COMM_LEN);     \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:369:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   drivers/hwtracing/stm/core.c:637:23: note: Dereference of null pointer
                   get_task_comm(comm, current);
                                       ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/sched.h:1990:36: note: expanded from macro 'get_task_comm'
           __get_task_comm(buf, sizeof(buf), tsk);         \
                                             ^~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/fpga/altera-pr-ip-core.c:188:2: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
           val = readl(priv->reg_base + ALT_PR_CSR_OFST);
           ^
   drivers/fpga/altera-pr-ip-core.c:188:2: note: Value stored to 'val' is never read
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/fpga/altera-freeze-bridge.c:69:4: warning: Value stored to 'ctrl' is never read [clang-analyzer-deadcode.DeadStores]
                           ctrl = readl(priv->base_addr + FREEZE_CSR_CTRL_OFFSET);
                           ^
   drivers/fpga/altera-freeze-bridge.c:69:4: note: Value stored to 'ctrl' is never read
   drivers/fpga/altera-freeze-bridge.c:150:2: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status = readl(priv->base_addr + FREEZE_CSR_STATUS_OFFSET);
           ^
   drivers/fpga/altera-freeze-bridge.c:150:2: note: Value stored to 'status' is never read
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/fpga/tests/fake-fpga-region.c:146:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/fpga/tests/fake-fpga-region.c:133:2: note: 'ret' declared without an initial value
           int ret;
           ^~~~~~~
   drivers/fpga/tests/fake-fpga-region.c:137:2: note: Loop condition is false. Execution continues on line 146
           list_for_each_entry_safe(bridge, tmp, &priv->bridge_list, node) {
           ^
   include/linux/list.h:776:2: note: expanded from macro 'list_for_each_entry_safe'
           for (pos = list_first_entry(head, typeof(*pos), member),        \
           ^
   drivers/fpga/tests/fake-fpga-region.c:146:2: note: Undefined or garbage value returned to caller
           return ret;
           ^      ~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (11 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (11 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/iio/light/ltr501.c:139:8: warning: Excessive padding in 'struct ltr501_chip_info' (16 padding bytes, where 0 is optimal). Optimal fields order: als_gain, ps_gain, channels, info, info_no_irq, als_gain_tbl_size, ps_gain_tbl_size, no_channels, partid, als_mode_active, als_gain_mask, als_gain_shift, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct ltr501_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/iio/light/ltr501.c:139:8: note: Excessive padding in 'struct ltr501_chip_info' (16 padding bytes, where 0 is optimal). Optimal fields order: als_gain, ps_gain, channels, info, info_no_irq, als_gain_tbl_size, ps_gain_tbl_size, no_channels, partid, als_mode_active, als_gain_mask, als_gain_shift, consider reordering the fields or adding explicit padding members
   struct ltr501_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/parport/share.c:1124:23: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                           if (signal_pending(current))
                                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/parport/share.c:1103:6: note: Assuming the condition is true
           if (r == -EAGAIN) {
               ^~~~~~~~~~~~
   drivers/parport/share.c:1103:2: note: Taking true branch
           if (r == -EAGAIN) {
           ^
   drivers/parport/share.c:1121:7: note: Assuming field 'waiting' is not equal to 0
                   if (dev->waiting) {
                       ^~~~~~~~~~~~
   drivers/parport/share.c:1121:3: note: Taking true branch
                   if (dev->waiting) {
                   ^
   drivers/parport/share.c:1122:4: note: Loop condition is false.  Exiting loop
                           wait_event_interruptible(dev->wait_q,
                           ^
   include/linux/wait.h:499:2: note: expanded from macro 'wait_event_interruptible'
           might_sleep();                                                          \
           ^
   include/linux/kernel.h:143:42: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while (0)
                                                   ^
   include/linux/kernel.h:120:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   drivers/parport/share.c:1122:4: note: Loop condition is false.  Exiting loop
                           wait_event_interruptible(dev->wait_q,

vim +146 drivers/fpga/tests/fake-fpga-region.c

318b50638db45d Marco Pagani 2023-03-10  128  
318b50638db45d Marco Pagani 2023-03-10  129  static int fake_region_get_bridges(struct fpga_region *region)
318b50638db45d Marco Pagani 2023-03-10  130  {
318b50638db45d Marco Pagani 2023-03-10  131  	struct fake_region_priv *priv;
318b50638db45d Marco Pagani 2023-03-10  132  	struct fpga_bridge *bridge, *tmp;
318b50638db45d Marco Pagani 2023-03-10  133  	int ret;
318b50638db45d Marco Pagani 2023-03-10  134  
318b50638db45d Marco Pagani 2023-03-10  135  	priv = region->priv;
318b50638db45d Marco Pagani 2023-03-10  136  
318b50638db45d Marco Pagani 2023-03-10  137  	list_for_each_entry_safe(bridge, tmp, &priv->bridge_list, node) {
318b50638db45d Marco Pagani 2023-03-10  138  		list_del(&bridge->node);
318b50638db45d Marco Pagani 2023-03-10  139  		ret = fpga_bridge_get_to_list(bridge->dev.parent,
318b50638db45d Marco Pagani 2023-03-10  140  					      region->info,
318b50638db45d Marco Pagani 2023-03-10  141  					      &region->bridge_list);
318b50638db45d Marco Pagani 2023-03-10  142  		if (ret)
318b50638db45d Marco Pagani 2023-03-10  143  			break;
318b50638db45d Marco Pagani 2023-03-10  144  	}
318b50638db45d Marco Pagani 2023-03-10  145  
318b50638db45d Marco Pagani 2023-03-10 @146  	return ret;
318b50638db45d Marco Pagani 2023-03-10  147  }
318b50638db45d Marco Pagani 2023-03-10  148  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
