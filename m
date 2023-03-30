Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5561380
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Mar 2023 03:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680146728; x=1711682728;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Eeg5BMQoW4ci19cVSVlpqK0K6YVDNOob38EAcf1dnAw=;
  b=HifHLO+r2efzWrII2X28ttdKU47I8o5A9cWXlJxBoIBy9Iql8xxa4lhn
   zigbG0OMJvpsFJEGk7EGE6MZNkslSXdJBqKS3TBeKKmo4gsmpAM4+ZVKz
   xyM8QBe3sX/I+IwEmdWpAndGxABZ48Tp7WmGC9A0MM6L0j8Kwmgdjt0b4
   Ub+NexHfBAJlRGoW5+2vfyv8Pw2GwpiXB/e/VrpIRNabOLfF9fsGQ3i38
   zxHfvV8jubDwXxJ6K3r3/6dgEXiRn+N3K25o/E47x9joISz7Z94xUPx8U
   XiAFPt+VEzIjqAFzI8gUrtQQMo6Z0iaaXz9IVybyv9iDfeZPcJTxW1y8B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="341076336"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="341076336"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 20:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="795500193"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="795500193"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2023 20:25:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phiuj-000KHc-2r;
	Thu, 30 Mar 2023 03:25:25 +0000
Date: Thu, 30 Mar 2023 11:24:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kdave-btrfs-devel:misc-next 54/97] fs/btrfs/lzo.c:413:3: warning:
 Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303301101.HOBEbSyv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/btrfs/lzo.c:413:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>
CC: David Sterba <dsterba@suse.com>
CC: Anand Jain <anand.jain@oracle.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>
CC: Qu Wenruo <wqu@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   42a90a380ff9eeb7d37527901f8725ceb1c5fbf6
commit: 0a793f2ddff44513947dc68779095877b6db2b61 [54/97] btrfs: move zero filling of compressed read bios into common code
:::::: branch date: 10 hours ago
:::::: commit date: 10 days ago
config: riscv-randconfig-c006-20230326 (https://download.01.org/0day-ci/archive/20230330/202303301101.HOBEbSyv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/kdave/btrfs-devel/commit/0a793f2ddff44513947dc68779095877b6db2b61
        git remote add kdave-btrfs-devel https://github.com/kdave/btrfs-devel.git
        git fetch --no-tags kdave-btrfs-devel misc-next
        git checkout 0a793f2ddff44513947dc68779095877b6db2b61
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303301101.HOBEbSyv-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:55:28: note: expanded from macro 'SRCU_SIZING_IS'
   #define SRCU_SIZING_IS(x) ((convert_to_big & ~SRCU_SIZING_CONTEND) == x)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:257:2: note: Taking true branch
           if (READ_ONCE(ssp->srcu_size_state) == SRCU_SIZE_SMALL && SRCU_SIZING_IS_INIT()) {
           ^
   kernel/rcu/srcutree.c:258:8: note: Calling 'init_srcu_struct_nodes'
                   if (!init_srcu_struct_nodes(ssp, GFP_ATOMIC)) {
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:176:14: note: Calling 'kcalloc'
           ssp->node = kcalloc(rcu_num_nodes, sizeof(*ssp->node), gfp_flags);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:667:9: note: Calling 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:632:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:634:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:636:2: note: Returning pointer, which participates in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:667:9: note: Returning from 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:667:2: note: Returning pointer, which participates in a condition later
           return kmalloc_array(n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:176:14: note: Returning from 'kcalloc'
           ssp->node = kcalloc(rcu_num_nodes, sizeof(*ssp->node), gfp_flags);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:177:6: note: Assuming field 'node' is non-null
           if (!ssp->node)
               ^~~~~~~~~~
   kernel/rcu/srcutree.c:177:2: note: Taking false branch
           if (!ssp->node)
           ^
   kernel/rcu/srcutree.c:182:14: note: Assuming 'i' is >= 'rcu_num_lvls'
           for (i = 1; i < rcu_num_lvls; i++)
                       ^~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:182:2: note: Loop condition is false. Execution continues on line 184
           for (i = 1; i < rcu_num_lvls; i++)
           ^
   kernel/rcu/srcutree.c:187:2: note: Assuming the condition is false
           srcu_for_each_node_breadth_first(ssp, snp) {
           ^
   kernel/rcu/rcu.h:346:7: note: expanded from macro 'srcu_for_each_node_breadth_first'
                (rnp) < &(sp)->node[rcu_num_nodes]; (rnp)++)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:187:2: note: Loop condition is false. Execution continues on line 216
           srcu_for_each_node_breadth_first(ssp, snp) {
           ^
   kernel/rcu/rcu.h:345:2: note: expanded from macro 'srcu_for_each_node_breadth_first'
           for ((rnp) = &(sp)->node[0]; \
           ^
   kernel/rcu/srcutree.c:216:2: note: Value assigned to 'level'
           level = rcu_num_lvls - 1;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:217:2: note: Value assigned to 'snp_first'
           snp_first = ssp->level[level];
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:218:2: note: Loop condition is true.  Entering loop body
           for_each_possible_cpu(cpu) {
           ^
   include/linux/cpumask.h:953:36: note: expanded from macro 'for_each_possible_cpu'
   #define for_each_possible_cpu(cpu)      for ((cpu) = 0; (cpu) < 1; (cpu)++)
                                           ^
   kernel/rcu/srcutree.c:219:9: note: Loop condition is false.  Exiting loop
                   sdp = per_cpu_ptr(ssp->sda, cpu);
                         ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PERCPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/rcu/srcutree.c:220:3: note: Value assigned to field 'mynode'
                   sdp->mynode = &snp_first[cpu / levelspread[level]];
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:221:27: note: Assuming 'snp' is equal to NULL
                   for (snp = sdp->mynode; snp != NULL; snp = snp->srcu_parent) {
                                           ^~~~~~~~~~~
   kernel/rcu/srcutree.c:221:27: note: Assuming pointer value is null
                   for (snp = sdp->mynode; snp != NULL; snp = snp->srcu_parent) {
                                           ^~~~~~~~~~~
   kernel/rcu/srcutree.c:221:3: note: Loop condition is false. Execution continues on line 226
                   for (snp = sdp->mynode; snp != NULL; snp = snp->srcu_parent) {
                   ^
   kernel/rcu/srcutree.c:226:30: note: Access to field 'grplo' results in a dereference of a null pointer (loaded from field 'mynode')
                   sdp->grpmask = 1 << (cpu - sdp->mynode->grplo);
                                              ^    ~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
>> fs/btrfs/lzo.c:413:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = 0;
                   ^     ~
   fs/btrfs/lzo.c:413:3: note: Value stored to 'ret' is never read
                   ret = 0;
                   ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/btrfs/zstd.c:444:4: warning: Value stored to 'tot_out' is never read [clang-analyzer-deadcode.DeadStores]
                           tot_out += workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:444:4: note: Value stored to 'tot_out' is never read
                           tot_out += workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:503:4: warning: Value stored to 'tot_out' is never read [clang-analyzer-deadcode.DeadStores]
                           tot_out += workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:503:4: note: Value stored to 'tot_out' is never read
                           tot_out += workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:251:23: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           unsigned long head = READ_ONCE(page->compound_head);
                                ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                           ^
   fs/btrfs/zstd.c:381:2: note: 'in_page' initialized to a null pointer value
           struct page *in_page = NULL;  /* The current page to read */
           ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:398:6: note: Assuming 'stream' is null
           if (!stream) {
               ^~~~~~~
   fs/btrfs/zstd.c:398:2: note: Taking true branch
           if (!stream) {
           ^
   fs/btrfs/zstd.c:399:3: note: Loop condition is false.  Exiting loop
                   pr_warn("BTRFS: zstd_init_cstream failed\n");
                   ^
   include/linux/printk.h:508:2: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
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
   fs/btrfs/zstd.c:401:3: note: Control jumps to line 534
                   goto out;
                   ^
   fs/btrfs/zstd.c:535:6: note: Assuming field 'src' is non-null
           if (workspace->in_buf.src) {
               ^~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:535:2: note: Taking true branch
           if (workspace->in_buf.src) {
           ^
   fs/btrfs/zstd.c:536:3: note: Taking false branch
                   kunmap_local(workspace->in_buf.src);
                   ^
   include/linux/highmem-internal.h:286:2: note: expanded from macro 'kunmap_local'
           BUILD_BUG_ON(__same_type((__addr), struct page *));     \
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
   fs/btrfs/zstd.c:536:3: note: Loop condition is false.  Exiting loop
                   kunmap_local(workspace->in_buf.src);
                   ^
   include/linux/highmem-internal.h:286:2: note: expanded from macro 'kunmap_local'
           BUILD_BUG_ON(__same_type((__addr), struct page *));     \
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

vim +/ret +413 fs/btrfs/lzo.c

a6fa6fae40ec33 Li Zefan              2010-10-25  329  
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  330  int lzo_decompress_bio(struct list_head *ws, struct compressed_bio *cb)
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  331  {
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  332  	struct workspace *workspace = list_entry(ws, struct workspace, list);
80f96b2a77e63b Christoph Hellwig     2023-02-10  333  	const struct btrfs_fs_info *fs_info = cb->bbio.inode->root->fs_info;
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  334  	const u32 sectorsize = fs_info->sectorsize;
ccaa66c8dd277a David Sterba          2021-10-27  335  	char *kaddr;
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  336  	int ret;
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  337  	/* Compressed data length, can be unaligned */
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  338  	u32 len_in;
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  339  	/* Offset inside the compressed data */
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  340  	u32 cur_in = 0;
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  341  	/* Bytes decompressed so far */
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  342  	u32 cur_out = 0;
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  343  
51c0674a56f982 Fabio M. De Francesco 2022-05-31  344  	kaddr = kmap_local_page(cb->compressed_pages[0]);
ccaa66c8dd277a David Sterba          2021-10-27  345  	len_in = read_compress_length(kaddr);
51c0674a56f982 Fabio M. De Francesco 2022-05-31  346  	kunmap_local(kaddr);
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  347  	cur_in += LZO_LEN;
a6fa6fae40ec33 Li Zefan              2010-10-25  348  
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  349  	/*
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  350  	 * LZO header length check
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  351  	 *
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  352  	 * The total length should not exceed the maximum extent length,
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  353  	 * and all sectors should be used.
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  354  	 * If this happens, it means the compressed extent is corrupted.
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  355  	 */
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  356  	if (len_in > min_t(size_t, BTRFS_MAX_COMPRESSED, cb->compressed_len) ||
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  357  	    round_up(len_in, sectorsize) < cb->compressed_len) {
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  358  		btrfs_err(fs_info,
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  359  			"invalid lzo header, lzo len %u compressed len %u",
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  360  			len_in, cb->compressed_len);
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  361  		return -EUCLEAN;
a6fa6fae40ec33 Li Zefan              2010-10-25  362  	}
ca9b688c1c9a21 Li Zefan              2011-02-16  363  
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  364  	/* Go through each lzo segment */
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  365  	while (cur_in < len_in) {
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  366  		struct page *cur_page;
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  367  		/* Length of the compressed segment */
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  368  		u32 seg_len;
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  369  		u32 sector_bytes_left;
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  370  		size_t out_len = lzo1x_worst_compress(sectorsize);
a6fa6fae40ec33 Li Zefan              2010-10-25  371  
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  372  		/*
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  373  		 * We should always have enough space for one segment header
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  374  		 * inside current sector.
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  375  		 */
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  376  		ASSERT(cur_in / sectorsize ==
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  377  		       (cur_in + LZO_LEN - 1) / sectorsize);
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  378  		cur_page = cb->compressed_pages[cur_in / PAGE_SIZE];
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  379  		ASSERT(cur_page);
51c0674a56f982 Fabio M. De Francesco 2022-05-31  380  		kaddr = kmap_local_page(cur_page);
ccaa66c8dd277a David Sterba          2021-10-27  381  		seg_len = read_compress_length(kaddr + offset_in_page(cur_in));
51c0674a56f982 Fabio M. De Francesco 2022-05-31  382  		kunmap_local(kaddr);
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  383  		cur_in += LZO_LEN;
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  384  
dc4a4bdb3f22f9 Dāvis Mosāns          2022-02-02  385  		if (seg_len > WORKSPACE_CBUF_LENGTH) {
741b23a970a79d Dāvis Mosāns          2022-02-02  386  			/*
741b23a970a79d Dāvis Mosāns          2022-02-02  387  			 * seg_len shouldn't be larger than we have allocated
741b23a970a79d Dāvis Mosāns          2022-02-02  388  			 * for workspace->cbuf
741b23a970a79d Dāvis Mosāns          2022-02-02  389  			 */
741b23a970a79d Dāvis Mosāns          2022-02-02  390  			btrfs_err(fs_info, "unexpectedly large lzo segment len %u",
741b23a970a79d Dāvis Mosāns          2022-02-02  391  					seg_len);
0a793f2ddff445 Christoph Hellwig     2023-03-07  392  			return -EIO;
741b23a970a79d Dāvis Mosāns          2022-02-02  393  		}
741b23a970a79d Dāvis Mosāns          2022-02-02  394  
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  395  		/* Copy the compressed segment payload into workspace */
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  396  		copy_compressed_segment(cb, workspace->cbuf, seg_len, &cur_in);
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  397  
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  398  		/* Decompress the data */
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  399  		ret = lzo1x_decompress_safe(workspace->cbuf, seg_len,
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  400  					    workspace->buf, &out_len);
a6fa6fae40ec33 Li Zefan              2010-10-25  401  		if (ret != LZO_E_OK) {
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  402  			btrfs_err(fs_info, "failed to decompress");
0a793f2ddff445 Christoph Hellwig     2023-03-07  403  			return -EIO;
a6fa6fae40ec33 Li Zefan              2010-10-25  404  		}
a6fa6fae40ec33 Li Zefan              2010-10-25  405  
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  406  		/* Copy the data into inode pages */
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  407  		ret = btrfs_decompress_buf2page(workspace->buf, out_len, cb, cur_out);
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  408  		cur_out += out_len;
a6fa6fae40ec33 Li Zefan              2010-10-25  409  
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  410  		/* All data read, exit */
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  411  		if (ret == 0)
0a793f2ddff445 Christoph Hellwig     2023-03-07  412  			return 0;
a6e66e6f8c1b68 Qu Wenruo             2021-07-26 @413  		ret = 0;
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  414  
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  415  		/* Check if the sector has enough space for a segment header */
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  416  		sector_bytes_left = sectorsize - (cur_in % sectorsize);
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  417  		if (sector_bytes_left >= LZO_LEN)
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  418  			continue;
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  419  
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  420  		/* Skip the padding zeros */
a6e66e6f8c1b68 Qu Wenruo             2021-07-26  421  		cur_in += sector_bytes_left;
a6fa6fae40ec33 Li Zefan              2010-10-25  422  	}
0a793f2ddff445 Christoph Hellwig     2023-03-07  423  
0a793f2ddff445 Christoph Hellwig     2023-03-07  424  	return 0;
a6fa6fae40ec33 Li Zefan              2010-10-25  425  }
a6fa6fae40ec33 Li Zefan              2010-10-25  426  

:::::: The code at line 413 was first introduced by commit
:::::: a6e66e6f8c1b685e11b778bef614480a9c1a5278 btrfs: rework lzo_decompress_bio() to make it subpage compatible

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
