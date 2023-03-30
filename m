Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC336FCD
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Mar 2023 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680188887; x=1711724887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1VeH0+G25QNux5G7WMIAx+AmrNg+TRQBHCN1pcDFmsU=;
  b=GmA/Y0kffdj9AscLCkJYD44Qo33a+liYL0WyqTVxYMZiAwiGAgq37WI9
   /29IATMa9QtCGNEJvh+JB13hZxhDLUWZUWSnVj4YwNOFp7k1mq5yhqmJV
   +gdkFrlIuX4IfPvJznZAG/Xh4vMzUxB/N9KqmclKu84+M5Bth4YcO+FOc
   mQl3V7sYD+WGhj+Lcc3Pdz6QIEgRTRm5w1ffHPBumQlmr86jun6Ve/RK7
   54Ed+UmiEDuW++sA8USvDiUpvwH35hNlQEa7KiSI7oQ9KLZT9veVKzmD0
   qMk7ROt2kEjb8fNRO4UMBjd4FH/BagM8joZokn1yZXfWlwBo1i+0OXCOe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="343678994"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="343678994"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 08:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678227416"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="678227416"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 08:05:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phtqf-000Kvw-1T;
	Thu, 30 Mar 2023 15:05:57 +0000
Date: Thu, 30 Mar 2023 23:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] usb: gadget: f_fs: show device name in debug message
Message-ID: <202303302209.Tjg9JDQT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/usb/gadget/function/f_fs.c:1412:19: warning: Value stored to 'ffs' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com>
TO: Linyu Yuan <quic_linyyuan@quicinc.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: linux-usb@vger.kernel.org
CC: Linyu Yuan <quic_linyyuan@quicinc.com>

Hi Linyu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on next-20230330]
[cannot apply to usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v6.3-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Linyu-Yuan/usb-gadget-f_fs-show-device-name-in-debug-message/20230322-183806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/1679481369-30094-1-git-send-email-quic_linyyuan%40quicinc.com
patch subject: [PATCH] usb: gadget: f_fs: show device name in debug message
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: riscv-randconfig-c006-20230326 (https://download.01.org/0day-ci/archive/20230330/202303302209.Tjg9JDQT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/930fd85f08c8ea356961f750367a08d40235b599
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linyu-Yuan/usb-gadget-f_fs-show-device-name-in-debug-message/20230322-183806
        git checkout 930fd85f08c8ea356961f750367a08d40235b599
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303302209.Tjg9JDQT-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1325:9: note: Taking false branch
                   ret = wait_event_interruptible(
                         ^
   include/linux/wait.h:501:11: note: expanded from macro 'wait_event_interruptible'
                   __ret = __wait_event_interruptible(wq_head, condition);         \
                           ^
   include/linux/wait.h:478:2: note: expanded from macro '__wait_event_interruptible'
           ___wait_event(wq_head, condition, TASK_INTERRUPTIBLE, 0, 0,             \
           ^
   include/linux/wait.h:310:3: note: expanded from macro '___wait_event'
                   if (condition)                                                  \
                   ^
   drivers/usb/gadget/function/f_fs.c:1325:9: note: Left side of '||' is false
                   ret = wait_event_interruptible(
                         ^
   include/linux/wait.h:501:11: note: expanded from macro 'wait_event_interruptible'
                   __ret = __wait_event_interruptible(wq_head, condition);         \
                           ^
   include/linux/wait.h:478:2: note: expanded from macro '__wait_event_interruptible'
           ___wait_event(wq_head, condition, TASK_INTERRUPTIBLE, 0, 0,             \
           ^
   include/linux/wait.h:313:7: note: expanded from macro '___wait_event'
                   if (___wait_is_interruptible(state) && __int) {                 \
                       ^
   include/linux/wait.h:283:3: note: expanded from macro '___wait_is_interruptible'
           (!__builtin_constant_p(state) ||                                        \
            ^
   drivers/usb/gadget/function/f_fs.c:1325:9: note: Left side of '&&' is true
                   ret = wait_event_interruptible(
                         ^
   include/linux/wait.h:501:11: note: expanded from macro 'wait_event_interruptible'
                   __ret = __wait_event_interruptible(wq_head, condition);         \
                           ^
   include/linux/wait.h:478:2: note: expanded from macro '__wait_event_interruptible'
           ___wait_event(wq_head, condition, TASK_INTERRUPTIBLE, 0, 0,             \
           ^
   include/linux/wait.h:313:7: note: expanded from macro '___wait_event'
                   if (___wait_is_interruptible(state) && __int) {                 \
                       ^
   include/linux/wait.h:283:2: note: expanded from macro '___wait_is_interruptible'
           (!__builtin_constant_p(state) ||                                        \
           ^
   drivers/usb/gadget/function/f_fs.c:1325:9: note: Assuming '__int' is not equal to 0
                   ret = wait_event_interruptible(
                         ^
   include/linux/wait.h:501:11: note: expanded from macro 'wait_event_interruptible'
                   __ret = __wait_event_interruptible(wq_head, condition);         \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/wait.h:478:2: note: expanded from macro '__wait_event_interruptible'
           ___wait_event(wq_head, condition, TASK_INTERRUPTIBLE, 0, 0,             \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/wait.h:313:42: note: expanded from macro '___wait_event'
                   if (___wait_is_interruptible(state) && __int) {                 \
                                                          ^~~~~
   drivers/usb/gadget/function/f_fs.c:1325:9: note: Taking true branch
                   ret = wait_event_interruptible(
                         ^
   include/linux/wait.h:501:11: note: expanded from macro 'wait_event_interruptible'
                   __ret = __wait_event_interruptible(wq_head, condition);         \
                           ^
   include/linux/wait.h:478:2: note: expanded from macro '__wait_event_interruptible'
           ___wait_event(wq_head, condition, TASK_INTERRUPTIBLE, 0, 0,             \
           ^
   include/linux/wait.h:313:3: note: expanded from macro '___wait_event'
                   if (___wait_is_interruptible(state) && __int) {                 \
                   ^
   drivers/usb/gadget/function/f_fs.c:1325:9: note: Control jumps to line 1325
                   ret = wait_event_interruptible(
                         ^
   include/linux/wait.h:501:11: note: expanded from macro 'wait_event_interruptible'
                   __ret = __wait_event_interruptible(wq_head, condition);         \
                           ^
   include/linux/wait.h:478:2: note: expanded from macro '__wait_event_interruptible'
           ___wait_event(wq_head, condition, TASK_INTERRUPTIBLE, 0, 0,             \
           ^
   include/linux/wait.h:315:4: note: expanded from macro '___wait_event'
                           goto __out;                                             \
                           ^
   drivers/usb/gadget/function/f_fs.c:1327:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   drivers/usb/gadget/function/f_fs.c:1327:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/usb/gadget/function/f_fs.c:1334:20: note: 'ep' is equal to field 'ep'
           if (epfile->ep != ep) {
                             ^~
   drivers/usb/gadget/function/f_fs.c:1334:2: note: Taking false branch
           if (epfile->ep != ep) {
           ^
   drivers/usb/gadget/function/f_fs.c:1339:2: note: Control jumps to 'case 2148099970:'  at line 1353
           switch (code) {
           ^
   drivers/usb/gadget/function/f_fs.c:1358:3: note: Control jumps to the 'default' case at line 1366
                   switch (ffs->gadget->speed) {
                   ^
   drivers/usb/gadget/function/f_fs.c:1370:10: note: Array access (via field 'descs') results in a null pointer dereference
                   desc = epfile->ep->descs[desc_idx];
                          ^           ~~~~~
>> drivers/usb/gadget/function/f_fs.c:1412:19: warning: Value stored to 'ffs' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ffs_data *ffs = sb->s_fs_info;
                            ^~~   ~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1412:19: note: Value stored to 'ffs' during its initialization is never read
           struct ffs_data *ffs = sb->s_fs_info;
                            ^~~   ~~~~~~~~~~~~~
   include/linux/spinlock.h:325:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           return &lock->rlock;
           ^
   drivers/usb/gadget/function/f_fs.c:3635:2: note: Loop condition is false.  Exiting loop
           ENTER_FFS();
           ^
   drivers/usb/gadget/function/u_fs.h:36:24: note: expanded from macro 'ENTER_FFS'
   #define ENTER_FFS()    pr_vdebug("%s: %s()\n", ffs->dev_name, __func__)
                          ^
   drivers/usb/gadget/function/u_fs.h:30:42: note: expanded from macro 'pr_vdebug'
   #  define pr_vdebug(...)                 do { } while (0)
                                            ^
   drivers/usb/gadget/function/f_fs.c:3636:6: note: Assuming 'func' is not equal to field 'func'
           if (ffs->func == func) {
               ^~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:3636:2: note: Taking false branch
           if (ffs->func == func) {
           ^
   drivers/usb/gadget/function/f_fs.c:3644:6: note: Assuming the condition is true
           if (!--opts->refcnt)
               ^~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:3644:2: note: Taking true branch
           if (!--opts->refcnt)
           ^
   drivers/usb/gadget/function/f_fs.c:3645:3: note: Calling 'functionfs_unbind'
                   functionfs_unbind(ffs);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1910:2: note: Loop condition is false.  Exiting loop
           ENTER_FFS();
           ^
   drivers/usb/gadget/function/u_fs.h:36:24: note: expanded from macro 'ENTER_FFS'
   #define ENTER_FFS()    pr_vdebug("%s: %s()\n", ffs->dev_name, __func__)
                          ^
   drivers/usb/gadget/function/u_fs.h:30:42: note: expanded from macro 'pr_vdebug'
   #  define pr_vdebug(...)                 do { } while (0)
                                            ^
   drivers/usb/gadget/function/f_fs.c:1912:15: note: Assuming field 'gadget' is non-null
           if (!WARN_ON(!ffs->gadget)) {
                        ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1912:7: note: Taking false branch
           if (!WARN_ON(!ffs->gadget)) {
                ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/usb/gadget/function/f_fs.c:1912:2: note: Taking true branch
           if (!WARN_ON(!ffs->gadget)) {
           ^
   drivers/usb/gadget/function/f_fs.c:1921:3: note: Calling 'ffs_data_put'
                   ffs_data_put(ffs);
                   ^~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1725:2: note: Loop condition is false.  Exiting loop
           ENTER_FFS();
           ^
   drivers/usb/gadget/function/u_fs.h:36:24: note: expanded from macro 'ENTER_FFS'
   #define ENTER_FFS()    pr_vdebug("%s: %s()\n", ffs->dev_name, __func__)
                          ^
   drivers/usb/gadget/function/u_fs.h:30:42: note: expanded from macro 'pr_vdebug'
   #  define pr_vdebug(...)                 do { } while (0)
                                            ^
   drivers/usb/gadget/function/f_fs.c:1727:2: note: Taking true branch
           if (refcount_dec_and_test(&ffs->ref)) {
           ^
   drivers/usb/gadget/function/f_fs.c:1728:3: note: Loop condition is false.  Exiting loop
                   pr_info("%s(): %s: freeing\n", __func__, ffs->dev_name);
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:455:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:426:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:401:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/usb/gadget/function/f_fs.c:1731:10: note: Assuming the condition is true
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
                          ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/usb/gadget/function/f_fs.c:1731:43: note: Left side of '||' is true
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
                                                           ^
   drivers/usb/gadget/function/f_fs.c:1731:3: note: Assuming the condition is false
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||

vim +/ffs +1412 drivers/usb/gadget/function/f_fs.c

ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1400  
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1401  /*
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1402   * Mounting the file system creates a controller file, used first for
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1403   * function configuration then later for event monitoring.
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1404   */
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1405  
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1406  static struct inode *__must_check
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1407  ffs_sb_make_inode(struct super_block *sb, void *data,
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1408  		  const struct file_operations *fops,
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1409  		  const struct inode_operations *iops,
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1410  		  struct ffs_file_perms *perms)
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1411  {
930fd85f08c8ea3 drivers/usb/gadget/function/f_fs.c Linyu Yuan         2023-03-22 @1412  	struct ffs_data	*ffs = sb->s_fs_info;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1413  	struct inode *inode;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1414  
930fd85f08c8ea3 drivers/usb/gadget/function/f_fs.c Linyu Yuan         2023-03-22  1415  	ENTER_FFS();
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1416  
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1417  	inode = new_inode(sb);
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1418  
8704fd73bf5658b drivers/usb/gadget/function/f_fs.c Greg Kroah-Hartman 2020-11-27  1419  	if (inode) {
95582b00838837f drivers/usb/gadget/function/f_fs.c Deepa Dinamani     2018-05-08  1420  		struct timespec64 ts = current_time(inode);
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1421  
12ba8d1e9262ce8 drivers/usb/gadget/f_fs.c          Al Viro            2010-10-27  1422  		inode->i_ino	 = get_next_ino();
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1423  		inode->i_mode    = perms->mode;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1424  		inode->i_uid     = perms->uid;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1425  		inode->i_gid     = perms->gid;
078cd8279e65998 drivers/usb/gadget/function/f_fs.c Deepa Dinamani     2016-09-14  1426  		inode->i_atime   = ts;
078cd8279e65998 drivers/usb/gadget/function/f_fs.c Deepa Dinamani     2016-09-14  1427  		inode->i_mtime   = ts;
078cd8279e65998 drivers/usb/gadget/function/f_fs.c Deepa Dinamani     2016-09-14  1428  		inode->i_ctime   = ts;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1429  		inode->i_private = data;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1430  		if (fops)
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1431  			inode->i_fop = fops;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1432  		if (iops)
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1433  			inode->i_op  = iops;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1434  	}
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1435  
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1436  	return inode;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1437  }
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1438  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
