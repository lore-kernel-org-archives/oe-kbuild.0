Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A2EEC6
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 06:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679207708; x=1710743708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YaTa087jx3WwdtDoVIwzsS2H7ggH8nSc55cV6tQRtig=;
  b=g70pydyniNhfuRXmbsU2jMtkuPILCo3Evxj4VzB1tQUpeHOx1s+5VfsM
   PTFZ517W4IWicJhvaHqRkuiVkovoyrqEpVcJv+lRQwzc8yos6J5Ia14QD
   XKKvF3n+AJdUWz/3iBU1RXEJh1faPq/QUPTa9kBno9KEyEyy8U80S4T1N
   dt2a5DXXzK4CD8scOMUKnLTS4vr5oOVf5gTA7cxuPNlVGo/t0u4z56/lj
   WLdLWDanN3mm9X0/H6LI1e7nvaZp0Ws2A9Rs3eZS6guAKAJdVHcHkY7xC
   9S5GPc0mzESQ/KcFc9h5m7MnR2cArz+VidtAaR10RIpf26ixt/RALN54B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="318139078"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="318139078"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 23:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="658006263"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="658006263"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Mar 2023 23:35:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdmdC-000AR6-12;
	Sun, 19 Mar 2023 06:35:02 +0000
Date: Sun, 19 Mar 2023 14:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] bcache: set io_disable to true when stop bcache device
Message-ID: <202303191414.V6HlsxDZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/md/bcache/request.c:764:21: warning: Value stored to 'dc' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230308092036.11024-1-mingzhe.zou@easystack.cn>
References: <20230308092036.11024-1-mingzhe.zou@easystack.cn>
TO: mingzhe <mingzhe.zou@easystack.cn>
TO: colyli@suse.de
TO: bcache@lists.ewheeler.net
CC: linux-bcache@vger.kernel.org
CC: zoumingzhe@qq.com

Hi mingzhe,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc2 next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mingzhe/bcache-set-io_disable-to-true-when-stop-bcache-device/20230308-172245
patch link:    https://lore.kernel.org/r/20230308092036.11024-1-mingzhe.zou%40easystack.cn
patch subject: [PATCH] bcache: set io_disable to true when stop bcache device
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm-randconfig-c002-20230318 (https://download.01.org/0day-ci/archive/20230319/202303191414.V6HlsxDZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/6a59a84151f42d58e6010f18c92b98cbaf58bdc1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review mingzhe/bcache-set-io_disable-to-true-when-stop-bcache-device/20230308-172245
        git checkout 6a59a84151f42d58e6010f18c92b98cbaf58bdc1
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303191414.V6HlsxDZ-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           if (mas_is_none(mas) || mas_is_ptr(mas)) {
               ^
   lib/maple_tree.c:4384:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_ptr(mas)) {
           ^
   lib/maple_tree.c:4389:2: note: Taking true branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4390:3: note: Calling 'mas_wr_spanning_store'
                   mas_wr_spanning_store(wr_mas);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3989:21: note: Field 'index' is 0
           if (unlikely(!mas->index && mas->last == ULONG_MAX))
                              ^
   lib/maple_tree.c:3989:15: note: Left side of '&&' is true
           if (unlikely(!mas->index && mas->last == ULONG_MAX))
                        ^
   lib/maple_tree.c:3989:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last == ULONG_MAX))
           ^
   lib/maple_tree.c:3997:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:4007:2: note: Taking true branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:4018:15: note: Field 'entry' is null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:4018:2: note: Taking true branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:4026:6: note: Assuming field 'index' is not equal to 0
           if (!l_mas.index && r_mas.last == ULONG_MAX) {
               ^~~~~~~~~~~~
   lib/maple_tree.c:4026:19: note: Left side of '&&' is false
           if (!l_mas.index && r_mas.last == ULONG_MAX) {
                            ^
   lib/maple_tree.c:4035:6: note: Assuming field 'offset' is > field 'node_end'
           if (r_mas.offset <= r_wr_mas.node_end)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4035:2: note: Taking false branch
           if (r_mas.offset <= r_wr_mas.node_end)
           ^
   lib/maple_tree.c:4048:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3001:22: note: Field 'min' is not equal to 0
           if (((mast->orig_l->min != 0) || (mast->orig_r->max != ULONG_MAX)) &&
                               ^
   lib/maple_tree.c:3001:32: note: Left side of '||' is true
           if (((mast->orig_l->min != 0) || (mast->orig_r->max != ULONG_MAX)) &&
                                         ^
   lib/maple_tree.c:3002:6: note: Assuming the condition is false
               unlikely(mast->bn->b_end <= mt_min_slots[mast->bn->type]))
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3001:2: note: Taking false branch
           if (((mast->orig_l->min != 0) || (mast->orig_r->max != ULONG_MAX)) &&
           ^
   lib/maple_tree.c:3018:2: note: Loop condition is true.  Entering loop body
           while (count--) {
           ^
   lib/maple_tree.c:3036:3: note: Taking false branch
                   if (mas_is_root_limits(mast->l))
                   ^
   lib/maple_tree.c:3051:3: note: Taking false branch
                   if (mast_sufficient(mast))
                   ^
   lib/maple_tree.c:3054:3: note: Taking false branch
                   if (mast_overflow(mast))
                   ^
   lib/maple_tree.c:3058:3: note: Taking false branch
                   if (mas_is_root_limits(mast->orig_l))
                   ^
   lib/maple_tree.c:3064:7: note: Assuming 'count' is not equal to 0
                   if (!count)
                       ^~~~~~
   lib/maple_tree.c:3064:3: note: Taking false branch
                   if (!count)
                   ^
   lib/maple_tree.c:3018:2: note: Loop condition is true.  Entering loop body
           while (count--) {
           ^
   lib/maple_tree.c:3036:3: note: Taking true branch
                   if (mas_is_root_limits(mast->l))
                   ^
   lib/maple_tree.c:3037:4: note: Control jumps to line 3081
                           goto new_root;
                           ^
   lib/maple_tree.c:3086:2: note: Taking true branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:3099:2: note: Address of stack memory associated with local variable 'r_mas' is still referred to by the stack variable 'mast' upon returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
   Suppressed 3 warnings (3 with check filters).
   17 warnings generated.
>> drivers/md/bcache/request.c:764:21: warning: Value stored to 'dc' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct cached_dev *dc = container_of(s->d, struct cached_dev, disk);
                              ^~
   drivers/md/bcache/request.c:764:21: note: Value stored to 'dc' during its initialization is never read
           struct cached_dev *dc = container_of(s->d, struct cached_dev, disk);
                              ^~
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/md/bcache/stats.c:67:2: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           sysfs_hprint(bypassed,  var(sectors_bypassed) << 9);
           ^
   drivers/md/bcache/sysfs.h:81:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/stats.c:67:2: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
           sysfs_hprint(bypassed,  var(sectors_bypassed) << 9);
           ^
   drivers/md/bcache/sysfs.h:81:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/md/bcache/super.c:1981:14: warning: Value stored to 'err' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const char *err = "cannot allocate memory";
                       ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/super.c:1981:14: note: Value stored to 'err' during its initialization is never read
           const char *err = "cannot allocate memory";
                       ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/super.c:2104:33: warning: The result of the left shift is undefined because the left operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   bkey_copy_key(&c->root->key, &MAX_KEY);
                                                 ^
   drivers/md/bcache/bcache_ondisk.h:81:24: note: expanded from macro 'MAX_KEY'
   #define MAX_KEY                         KEY(MAX_KEY_INODE, MAX_KEY_OFFSET, 0)
                                               ^
   drivers/md/bcache/bcache_ondisk.h:79:31: note: expanded from macro 'MAX_KEY_INODE'
   #define MAX_KEY_INODE                   (~(~0 << 20))
                                                 ^
   drivers/md/bcache/super.c:2501:6: note: Assuming 'ca' is non-null
           if (!ca) {
               ^~~
   drivers/md/bcache/super.c:2501:2: note: Taking false branch
           if (!ca) {
           ^
   drivers/md/bcache/super.c:2509:6: note: Calling 'register_cache'
           if (register_cache(args->sb, args->sb_disk, args->bdev, ca) != 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/super.c:2361:6: note: Assuming the condition is true
           if (bdev_max_discard_sectors((bdev)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/super.c:2361:2: note: Taking true branch
           if (bdev_max_discard_sectors((bdev)))
           ^
   drivers/md/bcache/super.c:2365:6: note: Assuming 'ret' is equal to 0
           if (ret != 0) {
               ^~~~~~~~
   drivers/md/bcache/super.c:2365:2: note: Taking false branch
           if (ret != 0) {
           ^
   drivers/md/bcache/super.c:2382:6: note: Assuming the condition is false
           if (kobject_add(&ca->kobj, bdev_kobj(bdev), "bcache")) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/super.c:2382:2: note: Taking false branch
           if (kobject_add(&ca->kobj, bdev_kobj(bdev), "bcache")) {
           ^
   drivers/md/bcache/super.c:2389:8: note: Calling 'register_cache_set'
           err = register_cache_set(ca);
                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/super.c:2161:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(c, &bch_cache_sets, list)
           ^
   include/linux/list.h:689:2: note: expanded from macro 'list_for_each_entry'
           for (pos = list_first_entry(head, typeof(*pos), member);        \
           ^
   drivers/md/bcache/super.c:2162:7: note: Assuming the condition is false
                   if (!memcmp(c->set_uuid, ca->sb.set_uuid, 16)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/super.c:2162:3: note: Taking false branch
                   if (!memcmp(c->set_uuid, ca->sb.set_uuid, 16)) {
                   ^
   drivers/md/bcache/super.c:2161:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(c, &bch_cache_sets, list)
           ^
   include/linux/list.h:689:2: note: expanded from macro 'list_for_each_entry'
           for (pos = list_first_entry(head, typeof(*pos), member);        \
           ^
   drivers/md/bcache/super.c:2162:7: note: Assuming the condition is true
                   if (!memcmp(c->set_uuid, ca->sb.set_uuid, 16)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/super.c:2162:3: note: Taking true branch
                   if (!memcmp(c->set_uuid, ca->sb.set_uuid, 16)) {
                   ^
   drivers/md/bcache/super.c:2163:8: note: Assuming field 'cache' is null
                           if (c->cache)
                               ^~~~~~~~
   drivers/md/bcache/super.c:2163:4: note: Taking false branch
                           if (c->cache)
                           ^
   drivers/md/bcache/super.c:2166:4: note: Control jumps to line 2185
                           goto found;

vim +/dc +764 drivers/md/bcache/request.c

cafe563591446c Kent Overstreet 2013-03-23  760  
6a59a84151f42d mingzhe         2023-03-08  761  static void cached_dev_bio_fail(struct closure *cl)
6a59a84151f42d mingzhe         2023-03-08  762  {
6a59a84151f42d mingzhe         2023-03-08  763  	struct search *s = container_of(cl, struct search, cl);
6a59a84151f42d mingzhe         2023-03-08 @764  	struct cached_dev *dc = container_of(s->d, struct cached_dev, disk);
6a59a84151f42d mingzhe         2023-03-08  765  
6a59a84151f42d mingzhe         2023-03-08  766  	s->iop.status = BLK_STS_IOERR;
6a59a84151f42d mingzhe         2023-03-08  767  	cached_dev_bio_complete(cl);
6a59a84151f42d mingzhe         2023-03-08  768  }
6a59a84151f42d mingzhe         2023-03-08  769  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
