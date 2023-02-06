Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B449B53A2
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Feb 2023 16:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675699986; x=1707235986;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SYgjDjSWyko3A7HYfKbYPbKQpTA1CIRDZq7/Pf5juHw=;
  b=SfHeXSVQEKVN5wP/blSh75Q2o7+da4Jy7nzYhi+CvzEWJNFcgF86jeKK
   K25IsuE7+Is51oeKGe/lYZh8q9qopYKAr9PVKXxSV9w9T4qsHqYi7cFV0
   FcfbhTRplMUNm7yxZOmNDihV2PW5BUzL0qUaZK4i5jfMCyCwmRy1q3dcW
   aDQgLG1vHacGdhzBJpjTJyTGBqbKq+Ls/4hmZcStcKLreGIXdJ+zXrKSf
   OunE4gxQ8ctitncj1v/9Ek7Dm6S03izOp5hdBTWqvqrSZcqf8XP75gMZx
   MgQ6VxZfgmUT07LzZk99BnZiHUM9OPWHpauKUEcs3gJ+ZBn9ObsBnDdtX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="327877990"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="327877990"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 08:13:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="644085032"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="644085032"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Feb 2023 08:13:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP475-0002eu-2D;
	Mon, 06 Feb 2023 16:13:03 +0000
Date: Tue, 7 Feb 2023 00:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1562:26: warning: Value
 stored to 'npcm' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302070055.IAqIRgde-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1562:26: warning: Value stored to 'npcm' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Jonathan Neuschäfer" <j.neuschaefer@gmx.net>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2d11f342b179f1894a901f143ec7c008caba43e
commit: a1d1e0e3d80a870cc37a6c064994b89e963d2b58 pinctrl: nuvoton: Add driver for WPCM450
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20230202 (https://download.01.org/0day-ci/archive/20230207/202302070055.IAqIRgde-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a1d1e0e3d80a870cc37a6c064994b89e963d2b58
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a1d1e0e3d80a870cc37a6c064994b89e963d2b58
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
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
   include/linux/fsnotify_backend.h:279:18: warning: Access to field 'dentry' results in a dereference of a null pointer (loaded from variable 'data') [clang-analyzer-core.NullDereference]
                   return d_inode(((const struct path *)data)->dentry);
                                  ^
   fs/notify/fsnotify.c:184:22: note: Assuming 'path' is null
           struct mount *mnt = path ? real_mount(path->mnt) : NULL;
                               ^~~~
   fs/notify/fsnotify.c:184:22: note: '?' condition is false
   fs/notify/fsnotify.c:199:6: note: Assuming field 'i_fsnotify_marks' is non-null
           if (!inode->i_fsnotify_marks && !inode->i_sb->s_fsnotify_marks &&
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:199:31: note: Left side of '&&' is false
           if (!inode->i_fsnotify_marks && !inode->i_sb->s_fsnotify_marks &&
                                        ^
   fs/notify/fsnotify.c:204:18: note: Calling 'fsnotify_event_needs_parent'
           parent_needed = fsnotify_event_needs_parent(inode, mnt, mask);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:152:6: note: Assuming the condition is true
           if (mask & FS_ISDIR)
               ^~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:152:2: note: Taking true branch
           if (mask & FS_ISDIR)
           ^
   fs/notify/fsnotify.c:153:3: note: Returning zero, which participates in a condition later
                   return false;
                   ^~~~~~~~~~~~
   fs/notify/fsnotify.c:204:18: note: Returning from 'fsnotify_event_needs_parent'
           parent_needed = fsnotify_event_needs_parent(inode, mnt, mask);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:205:6: note: Assuming 'parent_watched' is true
           if (!parent_watched && !parent_needed)
               ^~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:205:22: note: Left side of '&&' is false
           if (!parent_watched && !parent_needed)
                               ^
   fs/notify/fsnotify.c:212:15: note: 'parent_watched' is true
           if (unlikely(parent_watched && !p_mask))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/notify/fsnotify.c:212:15: note: Left side of '&&' is true
           if (unlikely(parent_watched && !p_mask))
                        ^
   fs/notify/fsnotify.c:212:33: note: Assuming 'p_mask' is not equal to 0
           if (unlikely(parent_watched && !p_mask))
                                          ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/notify/fsnotify.c:212:2: note: Taking false branch
           if (unlikely(parent_watched && !p_mask))
           ^
   fs/notify/fsnotify.c:220:6: note: 'parent_needed' is false
           if (parent_needed || parent_interested) {
               ^~~~~~~~~~~~~
   fs/notify/fsnotify.c:220:6: note: Left side of '||' is false
   fs/notify/fsnotify.c:220:23: note: Assuming 'parent_interested' is true
           if (parent_needed || parent_interested) {
                                ^~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:220:2: note: Taking true branch
           if (parent_needed || parent_interested) {
           ^
   fs/notify/fsnotify.c:222:45: note: Passing null pointer value via 1st parameter 'data'
                   WARN_ON_ONCE(inode != fsnotify_data_inode(data, data_type));
                                                             ^
   include/asm-generic/bug.h:146:18: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE_IF'
                   bool __ret_do_once = !!(condition);                     \
                                           ^~~~~~~~~
   fs/notify/fsnotify.c:222:25: note: Calling 'fsnotify_data_inode'
                   WARN_ON_ONCE(inode != fsnotify_data_inode(data, data_type));
                                         ^
   include/asm-generic/bug.h:146:18: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE_IF'
                   bool __ret_do_once = !!(condition);                     \
                                           ^~~~~~~~~
   include/linux/fsnotify_backend.h:273:2: note: Control jumps to 'case FSNOTIFY_EVENT_PATH:'  at line 278
           switch (data_type) {
           ^
   include/linux/fsnotify_backend.h:279:18: note: Access to field 'dentry' results in a dereference of a null pointer (loaded from variable 'data')
                   return d_inode(((const struct path *)data)->dentry);
                                  ^                     ~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1562:26: warning: Value stored to 'npcm' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct npcm7xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);
                                   ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1562:26: note: Value stored to 'npcm' during its initialization is never read
           struct npcm7xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);
                                   ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1590:26: warning: Value stored to 'npcm' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct npcm7xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);
                                   ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1590:26: note: Value stored to 'npcm' during its initialization is never read
           struct npcm7xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);
                                   ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/pinctrl/samsung/pinctrl-samsung.c:1118:19: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   bank->eint_base = virt_base[0];
                                   ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1144:6: note: Assuming 'drvdata' is non-null
           if (!drvdata)
               ^~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1144:2: note: Taking false branch
           if (!drvdata)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1147:9: note: Calling 'samsung_pinctrl_get_soc_data'
           ctrl = samsung_pinctrl_get_soc_data(drvdata, pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1072:9: note: Calling 'samsung_pinctrl_get_soc_data_for_of_alias'
           ctrl = samsung_pinctrl_get_soc_data_for_of_alias(pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:991:6: note: Assuming 'id' is >= 0
           if (id < 0) {
               ^~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:991:2: note: Taking false branch
           if (id < 0) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:997:6: note: Assuming 'id' is < field 'num_ctrl'
           if (id >= of_data->num_ctrl) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:997:2: note: Taking false branch
           if (id >= of_data->num_ctrl) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1002:2: note: Returning pointer, which participates in a condition later
           return &(of_data->ctrl[id]);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1072:9: note: Returning from 'samsung_pinctrl_get_soc_data_for_of_alias'
           ctrl = samsung_pinctrl_get_soc_data_for_of_alias(pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1073:6: note: Assuming 'ctrl' is non-null
           if (!ctrl)
               ^~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1073:2: note: Taking false branch
           if (!ctrl)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1079:17: note: Calling 'devm_kcalloc'
           d->pin_banks = devm_kcalloc(&pdev->dev, d->nr_banks,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:9: note: Calling 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:216:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/device.h:219:2: note: Returning pointer, which participates in a condition later
           return devm_kmalloc(dev, bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:9: note: Returning from 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:2: note: Returning pointer, which participates in a condition later
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1079:17: note: Returning from 'devm_kcalloc'
           d->pin_banks = devm_kcalloc(&pdev->dev, d->nr_banks,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1081:6: note: Assuming field 'pin_banks' is non-null
           if (!d->pin_banks)
               ^~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1081:2: note: Taking false branch
           if (!d->pin_banks)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1084:6: note: Assuming the condition is false
           if (ctrl->nr_ext_resources + 1 > SAMSUNG_PINCTRL_NUM_RESOURCES)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1084:2: note: Taking false branch
           if (ctrl->nr_ext_resources + 1 > SAMSUNG_PINCTRL_NUM_RESOURCES)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1087:14: note: Assuming the condition is false
           for (i = 0; i < ctrl->nr_ext_resources + 1; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1087:2: note: Loop condition is false. Execution continues on line 1101
           for (i = 0; i < ctrl->nr_ext_resources + 1; i++) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1103:14: note: Assuming 'i' is < field 'nr_banks'
           for (i = 0; i < ctrl->nr_banks; ++i, ++bdata, ++bank) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1103:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < ctrl->nr_banks; ++i, ++bdata, ++bank) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1113:3: note: Loop condition is false.  Exiting loop
                   raw_spin_lock_init(&bank->slock);
                   ^
   include/linux/spinlock.h:102:39: note: expanded from macro 'raw_spin_lock_init'

vim +/npcm +1562 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

3b588e43ee5c7a Tomer Maimon        2018-08-08  1559  
3b588e43ee5c7a Tomer Maimon        2018-08-08  1560  static int npcm7xx_get_groups_count(struct pinctrl_dev *pctldev)
3b588e43ee5c7a Tomer Maimon        2018-08-08  1561  {
3b588e43ee5c7a Tomer Maimon        2018-08-08 @1562  	struct npcm7xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);
3b588e43ee5c7a Tomer Maimon        2018-08-08  1563  
9d0f18bca3b557 Jonathan Neuschäfer 2022-02-05  1564  	dev_dbg(npcm->dev, "group size: %zu\n", ARRAY_SIZE(npcm7xx_groups));
3b588e43ee5c7a Tomer Maimon        2018-08-08  1565  	return ARRAY_SIZE(npcm7xx_groups);
3b588e43ee5c7a Tomer Maimon        2018-08-08  1566  }
3b588e43ee5c7a Tomer Maimon        2018-08-08  1567  

:::::: The code at line 1562 was first introduced by commit
:::::: 3b588e43ee5c7ad8ccccfbfc6fc379b816c178f0 pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver

:::::: TO: Tomer Maimon <tmaimon77@gmail.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
