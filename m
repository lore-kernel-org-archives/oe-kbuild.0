Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93FC6FCB
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Mar 2023 20:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680121273; x=1711657273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e7L3zH1r+2d5jGIrM4yp8lBk3OrQoFpo5RPHh9cmwHk=;
  b=HWLKXQ2nU6chEJo65Kam4IWxhQm6BkarTQam/J+5heCaI2Bp0Nh3PhY0
   TecIaOd1lOcRcZ6+RM5Kh/2xsT1h7knQ7pe7R61bFq87JZ+73I/5VOBPX
   rjlWLszXnRtjdOARsvZisKwJv8fAin03n8DteT2WyJp1YLKj48u++2lxx
   YWLhp8nUtLYcnctqxTA13QKXyHcNPuvnWciRvBxLhRMX3QRrOh99LiyBK
   WgyIawDONAnJwtI25m7BrlNlIjUJK6CViAtz/AVbeC9ElMqctckDldwW1
   fmADfGiUnuCEMR1XHLP15pzXvh2tdmqdjDp/b6xbg8wt8qE1I88ySQ/Rs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="343438671"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="343438671"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 13:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="677914711"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="677914711"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Mar 2023 13:21:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phcIB-000JvB-22;
	Wed, 29 Mar 2023 20:21:11 +0000
Date: Thu, 30 Mar 2023 04:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ext4: defer updating i_disksize until endio
Message-ID: <202303300422.fjOwmCQv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/ext4/inode.c:3130:2: warning: Value stored to 'end' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230324092907.1341457-1-cccheng@synology.com>
References: <20230324092907.1341457-1-cccheng@synology.com>
TO: "Chung-Chiang Cheng" <cccheng@synology.com>
TO: linux-ext4@vger.kernel.org
TO: tytso@mit.edu
TO: adilger.kernel@dilger.ca
TO: jack@suse.cz
TO: yi.zhang@huawei.com
CC: shepjeng@gmail.com
CC: kernel@cccheng.net
CC: "Chung-Chiang Cheng" <cccheng@synology.com>
CC: Robbie Ko <robbieko@synology.com>

Hi Chung-Chiang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v6.3-rc3]
[also build test WARNING on linus/master]
[cannot apply to tytso-ext4/dev next-20230329]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chung-Chiang-Cheng/ext4-defer-updating-i_disksize-until-endio/20230324-173716
patch link:    https://lore.kernel.org/r/20230324092907.1341457-1-cccheng%40synology.com
patch subject: [PATCH] ext4: defer updating i_disksize until endio
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-c006-20230326 (https://download.01.org/0day-ci/archive/20230330/202303300422.fjOwmCQv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/9a02b364d2cffe71a45866edf750b0280c8cb990
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chung-Chiang-Cheng/ext4-defer-updating-i_disksize-until-endio/20230324-173716
        git checkout 9a02b364d2cffe71a45866edf750b0280c8cb990
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303300422.fjOwmCQv-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   include/linux/printk.h:579:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:369:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   fs/ext4/inode.c:1745:2: note: Taking false branch
           ext_debug(inode, "max_blocks %u, logical block %lu\n", map->m_len,
           ^
   fs/ext4/ext4.h:94:2: note: expanded from macro 'ext_debug'
           pr_debug("[%s/%d] EXT4-fs (%s): ino %lu: (%s, %d): %s:" fmt,    \
           ^
   include/linux/printk.h:579:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:247:2: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:222:2: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
           ^
   fs/ext4/inode.c:1745:2: note: Loop condition is false.  Exiting loop
           ext_debug(inode, "max_blocks %u, logical block %lu\n", map->m_len,
           ^
   fs/ext4/ext4.h:94:2: note: expanded from macro 'ext_debug'
           pr_debug("[%s/%d] EXT4-fs (%s): ino %lu: (%s, %d): %s:" fmt,    \
           ^
   include/linux/printk.h:579:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:247:2: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:220:58: note: expanded from macro '__dynamic_func_call_cls'
   #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
                                                            ^
   fs/ext4/inode.c:1749:6: note: Assuming the condition is true
           if (ext4_es_lookup_extent(inode, iblock, NULL, &es)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:1749:2: note: Taking true branch
           if (ext4_es_lookup_extent(inode, iblock, NULL, &es)) {
           ^
   fs/ext4/inode.c:1750:3: note: Taking true branch
                   if (ext4_es_is_hole(&es)) {
                   ^
   fs/ext4/inode.c:1753:4: note: Control jumps to line 1798
                           goto add_delayed;
                           ^
   fs/ext4/inode.c:1798:6: note: 'retval' is equal to 0
           if (retval == 0) {
               ^~~~~~
   fs/ext4/inode.c:1798:2: note: Taking true branch
           if (retval == 0) {
           ^
   fs/ext4/inode.c:1807:7: note: 'ret' is not equal to 0
                   if (ret != 0) {
                       ^~~
   fs/ext4/inode.c:1807:3: note: Taking true branch
                   if (ret != 0) {
                   ^
   fs/ext4/inode.c:1809:4: note: Control jumps to line 1836
                           goto out_unlock;
                           ^
   fs/ext4/inode.c:1838:2: note: Returning without writing to 'map->m_pblk'
           return retval;
           ^
   fs/ext4/inode.c:1870:8: note: Returning from 'ext4_da_map_blocks'
           ret = ext4_da_map_blocks(inode, iblock, &map, bh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:1871:6: note: Assuming 'ret' is > 0
           if (ret <= 0)
               ^~~~~~~~
   fs/ext4/inode.c:1871:2: note: Taking false branch
           if (ret <= 0)
           ^
   fs/ext4/inode.c:1874:2: note: 3rd function call argument is an uninitialized value
           map_bh(bh, inode->i_sb, map.m_pblk);
           ^                       ~~~~~~~~~~
>> fs/ext4/inode.c:3130:2: warning: Value stored to 'end' is never read [clang-analyzer-deadcode.DeadStores]
           end = start + copied - 1;
           ^     ~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:3130:2: note: Value stored to 'end' is never read
           end = start + copied - 1;
           ^     ~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:128:16: warning: Array access (from variable 'addr') results in a null pointer dereference [clang-analyzer-core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   fs/ext4/inode.c:1424:2: note: Taking false branch
           BUG_ON(!ext4_handle_valid(handle));
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   fs/ext4/inode.c:1424:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!ext4_handle_valid(handle));
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   fs/ext4/inode.c:1426:2: note: Taking false branch
           if (ext4_has_inline_data(inode))
           ^
   fs/ext4/inode.c:1429:15: note: Assuming 'copied' is >= 'len'
           if (unlikely(copied < len) && !PageUptodate(page)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ext4/inode.c:1429:29: note: Left side of '&&' is false
           if (unlikely(copied < len) && !PageUptodate(page)) {
                                      ^
   fs/ext4/inode.c:1433:16: note: 'copied' is >= 'len'
                   if (unlikely(copied < len))
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ext4/inode.c:1433:3: note: Taking false branch
                   if (unlikely(copied < len))
                   ^
   fs/ext4/inode.c:1436:47: note: Calling 'PagePrivate'
                   ret = ext4_walk_page_buffers(handle, inode, page_buffers(page),
                                                               ^
   include/linux/buffer_head.h:181:11: note: expanded from macro 'page_buffers'
                   BUG_ON(!PagePrivate(page));                     \
                   ~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/page-flags.h:509:1: note: Left side of '&&' is true
   PAGEFLAG(Private, private, PF_ANY)
   ^
   include/linux/page-flags.h:426:2: note: expanded from macro 'PAGEFLAG'
           TESTPAGEFLAG(uname, lname, policy)                              \
           ^
   include/linux/page-flags.h:381:10: note: expanded from macro 'TESTPAGEFLAG'
   { return test_bit(PG_##lname, &policy(page, 0)->flags); }
            ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   include/linux/page-flags.h:509:1: note: Assuming the condition is false
   PAGEFLAG(Private, private, PF_ANY)
   ^
   include/linux/page-flags.h:426:2: note: expanded from macro 'PAGEFLAG'
           TESTPAGEFLAG(uname, lname, policy)                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:381:10: note: expanded from macro 'TESTPAGEFLAG'
   { return test_bit(PG_##lname, &policy(page, 0)->flags); }
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:50:25: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:509:1: note: Left side of '&&' is false
   PAGEFLAG(Private, private, PF_ANY)
   ^
   include/linux/page-flags.h:426:2: note: expanded from macro 'PAGEFLAG'
           TESTPAGEFLAG(uname, lname, policy)                              \
           ^
   include/linux/page-flags.h:381:10: note: expanded from macro 'TESTPAGEFLAG'
   { return test_bit(PG_##lname, &policy(page, 0)->flags); }
            ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                                                        ^
   include/linux/page-flags.h:509:1: note: Passing null pointer value via 2nd parameter 'addr'
   PAGEFLAG(Private, private, PF_ANY)

vim +/end +3130 fs/ext4/inode.c

64769240bd07f4 Alex Tomas         2008-07-11  3108  
64769240bd07f4 Alex Tomas         2008-07-11  3109  static int ext4_da_write_end(struct file *file,
64769240bd07f4 Alex Tomas         2008-07-11  3110  			     struct address_space *mapping,
64769240bd07f4 Alex Tomas         2008-07-11  3111  			     loff_t pos, unsigned len, unsigned copied,
64769240bd07f4 Alex Tomas         2008-07-11  3112  			     struct page *page, void *fsdata)
64769240bd07f4 Alex Tomas         2008-07-11  3113  {
64769240bd07f4 Alex Tomas         2008-07-11  3114  	struct inode *inode = mapping->host;
632eaeab1feb5d Mingming Cao       2008-07-11  3115  	unsigned long start, end;
79f0be8d2e6ebd Aneesh Kumar K.V   2008-10-08  3116  	int write_mode = (int)(unsigned long)fsdata;
79f0be8d2e6ebd Aneesh Kumar K.V   2008-10-08  3117  
74d553aad7926e Theodore Ts'o      2013-04-03  3118  	if (write_mode == FALL_BACK_TO_NONDELALLOC)
74d553aad7926e Theodore Ts'o      2013-04-03  3119  		return ext4_write_end(file, mapping, pos,
79f0be8d2e6ebd Aneesh Kumar K.V   2008-10-08  3120  				      len, copied, page, fsdata);
632eaeab1feb5d Mingming Cao       2008-07-11  3121  
9bffad1ed2a003 Theodore Ts'o      2009-06-17  3122  	trace_ext4_da_write_end(inode, pos, len, copied);
6984aef59814fb Zhang Yi           2021-07-16  3123  
6984aef59814fb Zhang Yi           2021-07-16  3124  	if (write_mode != CONVERT_INLINE_DATA &&
6984aef59814fb Zhang Yi           2021-07-16  3125  	    ext4_test_inode_state(inode, EXT4_STATE_MAY_INLINE_DATA) &&
6984aef59814fb Zhang Yi           2021-07-16  3126  	    ext4_has_inline_data(inode))
6984aef59814fb Zhang Yi           2021-07-16  3127  		return ext4_write_inline_data_end(inode, pos, len, copied, page);
6984aef59814fb Zhang Yi           2021-07-16  3128  
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  3129  	start = pos & (PAGE_SIZE - 1);
632eaeab1feb5d Mingming Cao       2008-07-11 @3130  	end = start + copied - 1;
64769240bd07f4 Alex Tomas         2008-07-11  3131  
64769240bd07f4 Alex Tomas         2008-07-11  3132  	/*
4df031ff5876d9 Zhang Yi           2021-07-16  3133  	 * Since we are holding inode lock, we are sure i_disksize <=
4df031ff5876d9 Zhang Yi           2021-07-16  3134  	 * i_size. We also know that if i_disksize < i_size, there are
9a02b364d2cffe Chung-Chiang Cheng 2023-03-24  3135  	 * delalloc writes pending in the range upto i_size. There's no
9a02b364d2cffe Chung-Chiang Cheng 2023-03-24  3136  	 * need to touch i_disksize since the endio of writeback will
9a02b364d2cffe Chung-Chiang Cheng 2023-03-24  3137  	 * push i_disksize upto i_size eventually.
4df031ff5876d9 Zhang Yi           2021-07-16  3138  	 *
4df031ff5876d9 Zhang Yi           2021-07-16  3139  	 * Note that we defer inode dirtying to generic_write_end() /
4df031ff5876d9 Zhang Yi           2021-07-16  3140  	 * ext4_da_write_inline_data_end().
64769240bd07f4 Alex Tomas         2008-07-11  3141  	 */
9c3569b50f12e4 Tao Ma             2012-12-10  3142  
cc883236b79297 Zhang Yi           2021-07-16  3143  	return generic_write_end(file, mapping, pos, len, copied, page, fsdata);
64769240bd07f4 Alex Tomas         2008-07-11  3144  }
64769240bd07f4 Alex Tomas         2008-07-11  3145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
