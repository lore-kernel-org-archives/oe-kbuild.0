Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D2F7468
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Mar 2023 18:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679942606; x=1711478606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BdEhicpP5Ff0QR27XU8XkJgvPs4tlduvCV+3k8qzZSU=;
  b=IZq98ItCkyCTSQ4ih7Wxa00ICxP6G0s5OolySmGa8lDN4izpU2jArhHT
   4IRTu2YdUc7PRqIlOgy2OC+QlADmNf4s1JKgbzOdnOTjMKsv+3fCHwoCq
   cPxYhrPtFtlVwwZZnvrCKRQ/8a9AHvpi1J039owcU2pcpUjHaMIeRCEZ0
   YzTk78ebi7soCQnR2pSCkfmvVzNJG8Kp2/yHFDlAE4UW+wQJd/cXF3NYv
   gzvIOUoldwNVS5ibHWysojCAThSs1iqGiZeBLedtez6kVxyaTGY3OMej6
   zxWzG3JbnBoUA5SYQ+g2PT3AyL5Ku72QVqowArFS29lk4yyLOBRjV8/rp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="426620320"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="426620320"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 11:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="794464012"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="794464012"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2023 11:43:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgroQ-000Hvf-2C;
	Mon, 27 Mar 2023 18:43:22 +0000
Date: Tue, 28 Mar 2023 02:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] f2fs: Fix system crash due to lack of free space in
 LFS
Message-ID: <202303280203.59iVOMh7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/f2fs/gc.c:1899:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230321001251epcms2p4c1fd48495643dbfca2cf82a433490bb8@epcms2p4>
References: <20230321001251epcms2p4c1fd48495643dbfca2cf82a433490bb8@epcms2p4>
TO: Yonggil Song <yonggil.song@samsung.com>

Hi Yonggil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev linus/master v6.3-rc4 next-20230327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yonggil-Song/f2fs-Fix-system-crash-due-to-lack-of-free-space-in-LFS/20230321-081448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230321001251epcms2p4c1fd48495643dbfca2cf82a433490bb8%40epcms2p4
patch subject: [PATCH v2] f2fs: Fix system crash due to lack of free space in LFS
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20230322 (https://download.01.org/0day-ci/archive/20230328/202303280203.59iVOMh7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/752c99f844e88d3d33df6bdd87768524c8cc3828
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yonggil-Song/f2fs-Fix-system-crash-due-to-lack-of-free-space-in-LFS/20230321-081448
        git checkout 752c99f844e88d3d33df6bdd87768524c8cc3828
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303280203.59iVOMh7-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
            ^~~~
   fs/f2fs/gc.c:729:2: note: '?' condition is false
           if (gc_type != FG_GC)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   fs/f2fs/gc.c:729:2: note: Taking false branch
           if (gc_type != FG_GC)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/f2fs/gc.c:731:7: note: Calling 'f2fs_pin_section'
           if (!f2fs_pin_section(F2FS_I_SB(inode), segno))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   fs/f2fs/gc.c:691:23: note: Assuming the condition is true
           unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
                                ^
   fs/f2fs/segment.h:108:4: note: expanded from macro 'GET_SEC_FROM_SEG'
           (((segno) == -1) ? -1: (segno) / (sbi)->segs_per_sec)
             ^~~~~~~~~~~~~
   fs/f2fs/gc.c:691:23: note: '?' condition is true
           unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
                                ^
   fs/f2fs/segment.h:108:3: note: expanded from macro 'GET_SEC_FROM_SEG'
           (((segno) == -1) ? -1: (segno) / (sbi)->segs_per_sec)
            ^
   fs/f2fs/gc.c:693:6: note: Assuming field 'enable_pin_section' is true
           if (!dirty_i->enable_pin_section)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   fs/f2fs/gc.c:693:2: note: '?' condition is false
           if (!dirty_i->enable_pin_section)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   fs/f2fs/gc.c:693:16: note: Field 'enable_pin_section' is true
           if (!dirty_i->enable_pin_section)
                         ^
   fs/f2fs/gc.c:693:2: note: '?' condition is false
           if (!dirty_i->enable_pin_section)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   fs/f2fs/gc.c:693:2: note: Taking false branch
           if (!dirty_i->enable_pin_section)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/f2fs/gc.c:695:7: note: Calling 'test_and_set_bit'
           if (!test_and_set_bit(secno, dirty_i->pinned_secmap))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   arch/riscv/include/asm/bitops.h:73:9: note: The result of the left shift is undefined because the right operand is negative
           return __test_and_op_bit(or, __NOP, nr, addr);
                  ^
   arch/riscv/include/asm/bitops.h:56:2: note: expanded from macro '__test_and_op_bit'
           __test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/bitops.h:39:11: note: expanded from macro '__test_and_op_bit_ord'
           __mask = BIT_MASK(nr);                                  \
                    ^~~~~~~~~~~~
   include/linux/bits.h:9:30: note: expanded from macro 'BIT_MASK'
   #define BIT_MASK(nr)            (UL(1) << ((nr) % BITS_PER_LONG))
                                          ^  ~~~~~~~~~~~~~~~~~~~~~~
>> fs/f2fs/gc.c:1899:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = get_need_secs(sbi, &need_lower, &need_upper);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/gc.c:1899:2: note: Value stored to 'ret' is never read
           ret = get_need_secs(sbi, &need_lower, &need_upper);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:128:16: warning: Array access (from variable 'addr') results in a null pointer dereference [clang-analyzer-core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   fs/f2fs/gc.c:1437:2: note: '?' condition is false
           if (IS_ERR(page))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   fs/f2fs/gc.c:1437:2: note: '?' condition is false
           if (IS_ERR(page))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   fs/f2fs/gc.c:1437:2: note: Taking false branch
           if (IS_ERR(page))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/f2fs/gc.c:1440:6: note: Assuming the condition is false
           if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   fs/f2fs/gc.c:1440:2: note: '?' condition is false
           if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   fs/f2fs/gc.c:1440:6: note: Assuming the condition is false
           if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   fs/f2fs/gc.c:1440:2: note: '?' condition is false
           if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   fs/f2fs/gc.c:1440:2: note: Taking false branch
           if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/f2fs/gc.c:1446:2: note: '?' condition is false
           if (err)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   fs/f2fs/gc.c:1446:6: note: 'err' is 0
           if (err)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))

vim +/ret +1899 fs/f2fs/gc.c

7bc0900347e069 Jaegeuk Kim    2012-11-02  1800  
d147ea4adb969b Jaegeuk Kim    2022-05-06  1801  int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
7bc0900347e069 Jaegeuk Kim    2012-11-02  1802  {
d147ea4adb969b Jaegeuk Kim    2022-05-06  1803  	int gc_type = gc_control->init_gc_type;
d147ea4adb969b Jaegeuk Kim    2022-05-06  1804  	unsigned int segno = gc_control->victim_segno;
c56f16dab0dfc8 Chao Yu        2017-08-11  1805  	int sec_freed = 0, seg_freed = 0, total_freed = 0;
c56f16dab0dfc8 Chao Yu        2017-08-11  1806  	int ret = 0;
d5053a34a9cc79 Jaegeuk Kim    2014-10-30  1807  	struct cp_control cpc;
7dda2af83b2b75 Changman Lee   2014-11-28  1808  	struct gc_inode_list gc_list = {
7dda2af83b2b75 Changman Lee   2014-11-28  1809  		.ilist = LIST_HEAD_INIT(gc_list.ilist),
f6bb2a2c0b81c4 Matthew Wilcox 2018-04-10  1810  		.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
7dda2af83b2b75 Changman Lee   2014-11-28  1811  	};
2ef79ecb5e906d Chao Yu        2018-05-07  1812  	unsigned int skipped_round = 0, round = 0;
752c99f844e88d Yonggil Song   2023-03-21  1813  	unsigned int need_lower = 0, need_upper = 0;
d5053a34a9cc79 Jaegeuk Kim    2014-10-30  1814  
d147ea4adb969b Jaegeuk Kim    2022-05-06  1815  	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
c81d5bae404abc Jaegeuk Kim    2022-05-06  1816  				gc_control->nr_free_secs,
c56f16dab0dfc8 Chao Yu        2017-08-11  1817  				get_pages(sbi, F2FS_DIRTY_NODES),
c56f16dab0dfc8 Chao Yu        2017-08-11  1818  				get_pages(sbi, F2FS_DIRTY_DENTS),
c56f16dab0dfc8 Chao Yu        2017-08-11  1819  				get_pages(sbi, F2FS_DIRTY_IMETA),
c56f16dab0dfc8 Chao Yu        2017-08-11  1820  				free_sections(sbi),
c56f16dab0dfc8 Chao Yu        2017-08-11  1821  				free_segments(sbi),
c56f16dab0dfc8 Chao Yu        2017-08-11  1822  				reserved_segments(sbi),
c56f16dab0dfc8 Chao Yu        2017-08-11  1823  				prefree_segments(sbi));
c56f16dab0dfc8 Chao Yu        2017-08-11  1824  
119ee914453414 Jaegeuk Kim    2015-01-29  1825  	cpc.reason = __get_cp_reason(sbi);
7bc0900347e069 Jaegeuk Kim    2012-11-02  1826  gc_more:
196036c45f8c96 Yonggil Song   2023-02-16  1827  	sbi->skipped_gc_rwsem = 0;
1751e8a6cb935e Linus Torvalds 2017-11-27  1828  	if (unlikely(!(sbi->sb->s_flags & SB_ACTIVE))) {
e5dbd9563e5528 Weichao Guo    2017-05-11  1829  		ret = -EINVAL;
408e9375610cca Jaegeuk Kim    2013-01-03  1830  		goto stop;
e5dbd9563e5528 Weichao Guo    2017-05-11  1831  	}
6d5a1495eebd44 Chao Yu        2015-12-24  1832  	if (unlikely(f2fs_cp_error(sbi))) {
6d5a1495eebd44 Chao Yu        2015-12-24  1833  		ret = -EIO;
203681f65b0705 Jaegeuk Kim    2014-02-05  1834  		goto stop;
6d5a1495eebd44 Chao Yu        2015-12-24  1835  	}
7bc0900347e069 Jaegeuk Kim    2012-11-02  1836  
19f4e688f89a9c Hou Pengyang   2017-02-25  1837  	if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) {
6e17bfbc75a5cb Jaegeuk Kim    2016-01-23  1838  		/*
19f4e688f89a9c Hou Pengyang   2017-02-25  1839  		 * For example, if there are many prefree_segments below given
19f4e688f89a9c Hou Pengyang   2017-02-25  1840  		 * threshold, we can make them free by checkpoint. Then, we
19f4e688f89a9c Hou Pengyang   2017-02-25  1841  		 * secure free segments which doesn't need fggc any more.
6e17bfbc75a5cb Jaegeuk Kim    2016-01-23  1842  		 */
d147ea4adb969b Jaegeuk Kim    2022-05-06  1843  		if (prefree_segments(sbi)) {
4d57b86dd86404 Chao Yu        2018-05-30  1844  			ret = f2fs_write_checkpoint(sbi, &cpc);
2956e450fa0866 Jaegeuk Kim    2016-09-21  1845  			if (ret)
2956e450fa0866 Jaegeuk Kim    2016-09-21  1846  				goto stop;
8fd5a37efa0b03 Jaegeuk Kim    2017-04-07  1847  		}
19f4e688f89a9c Hou Pengyang   2017-02-25  1848  		if (has_not_enough_free_secs(sbi, 0, 0))
19f4e688f89a9c Hou Pengyang   2017-02-25  1849  			gc_type = FG_GC;
fe94793e555f65 Yunlei He      2016-07-22  1850  	}
7bc0900347e069 Jaegeuk Kim    2012-11-02  1851  
19f4e688f89a9c Hou Pengyang   2017-02-25  1852  	/* f2fs_balance_fs doesn't need to do BG_GC in critical path. */
d147ea4adb969b Jaegeuk Kim    2022-05-06  1853  	if (gc_type == BG_GC && gc_control->no_bg_gc) {
c56f16dab0dfc8 Chao Yu        2017-08-11  1854  		ret = -EINVAL;
19f4e688f89a9c Hou Pengyang   2017-02-25  1855  		goto stop;
c56f16dab0dfc8 Chao Yu        2017-08-11  1856  	}
71419129625a50 Chao Yu        2022-05-06  1857  retry:
97767500781fae Qilong Zhang   2020-06-28  1858  	ret = __get_victim(sbi, &segno, gc_type);
71419129625a50 Chao Yu        2022-05-06  1859  	if (ret) {
71419129625a50 Chao Yu        2022-05-06  1860  		/* allow to search victim from sections has pinned data */
71419129625a50 Chao Yu        2022-05-06  1861  		if (ret == -ENODATA && gc_type == FG_GC &&
71419129625a50 Chao Yu        2022-05-06  1862  				f2fs_pinned_section_exists(DIRTY_I(sbi))) {
71419129625a50 Chao Yu        2022-05-06  1863  			f2fs_unpin_all_sections(sbi, false);
71419129625a50 Chao Yu        2022-05-06  1864  			goto retry;
71419129625a50 Chao Yu        2022-05-06  1865  		}
408e9375610cca Jaegeuk Kim    2013-01-03  1866  		goto stop;
71419129625a50 Chao Yu        2022-05-06  1867  	}
7bc0900347e069 Jaegeuk Kim    2012-11-02  1868  
d147ea4adb969b Jaegeuk Kim    2022-05-06  1869  	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
d147ea4adb969b Jaegeuk Kim    2022-05-06  1870  				gc_control->should_migrate_blocks);
c56f16dab0dfc8 Chao Yu        2017-08-11  1871  	total_freed += seg_freed;
437275272f9e63 Jaegeuk Kim    2013-02-04  1872  
d147ea4adb969b Jaegeuk Kim    2022-05-06  1873  	if (seg_freed == f2fs_usable_segs_in_sec(sbi, segno))
d147ea4adb969b Jaegeuk Kim    2022-05-06  1874  		sec_freed++;
2ef79ecb5e906d Chao Yu        2018-05-07  1875  
10d0786b39b3b9 Jia Yang       2021-07-14  1876  	if (gc_type == FG_GC)
5ec4e49f9bd753 Jaegeuk Kim    2013-03-31  1877  		sbi->cur_victim_sec = NULL_SEGNO;
437275272f9e63 Jaegeuk Kim    2013-02-04  1878  
c81d5bae404abc Jaegeuk Kim    2022-05-06  1879  	if (gc_control->init_gc_type == FG_GC ||
c81d5bae404abc Jaegeuk Kim    2022-05-06  1880  	    !has_not_enough_free_secs(sbi,
c81d5bae404abc Jaegeuk Kim    2022-05-06  1881  				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
c81d5bae404abc Jaegeuk Kim    2022-05-06  1882  		if (gc_type == FG_GC && sec_freed < gc_control->nr_free_secs)
c81d5bae404abc Jaegeuk Kim    2022-05-06  1883  			goto go_gc_more;
a9163b947ae8f7 Byungki Lee    2022-04-29  1884  		goto stop;
c81d5bae404abc Jaegeuk Kim    2022-05-06  1885  	}
a9163b947ae8f7 Byungki Lee    2022-04-29  1886  
d147ea4adb969b Jaegeuk Kim    2022-05-06  1887  	/* FG_GC stops GC by skip_count */
d147ea4adb969b Jaegeuk Kim    2022-05-06  1888  	if (gc_type == FG_GC) {
d147ea4adb969b Jaegeuk Kim    2022-05-06  1889  		if (sbi->skipped_gc_rwsem)
d147ea4adb969b Jaegeuk Kim    2022-05-06  1890  			skipped_round++;
d147ea4adb969b Jaegeuk Kim    2022-05-06  1891  		round++;
d147ea4adb969b Jaegeuk Kim    2022-05-06  1892  		if (skipped_round > MAX_SKIP_GC_COUNT &&
d147ea4adb969b Jaegeuk Kim    2022-05-06  1893  				skipped_round * 2 >= round) {
d147ea4adb969b Jaegeuk Kim    2022-05-06  1894  			ret = f2fs_write_checkpoint(sbi, &cpc);
d147ea4adb969b Jaegeuk Kim    2022-05-06  1895  			goto stop;
d147ea4adb969b Jaegeuk Kim    2022-05-06  1896  		}
d147ea4adb969b Jaegeuk Kim    2022-05-06  1897  	}
a9163b947ae8f7 Byungki Lee    2022-04-29  1898  
752c99f844e88d Yonggil Song   2023-03-21 @1899  	ret = get_need_secs(sbi, &need_lower, &need_upper);
752c99f844e88d Yonggil Song   2023-03-21  1900  
752c99f844e88d Yonggil Song   2023-03-21  1901  	/*
752c99f844e88d Yonggil Song   2023-03-21  1902  	 * Write checkpoint to reclaim prefree segments.
752c99f844e88d Yonggil Song   2023-03-21  1903  	 * We need more three extra sections for writer's data/node/dentry.
752c99f844e88d Yonggil Song   2023-03-21  1904  	 */
752c99f844e88d Yonggil Song   2023-03-21  1905  	if (free_sections(sbi) <= need_upper + NR_GC_CHECKPOINT_SECS &&
d147ea4adb969b Jaegeuk Kim    2022-05-06  1906  				prefree_segments(sbi)) {
a9163b947ae8f7 Byungki Lee    2022-04-29  1907  		ret = f2fs_write_checkpoint(sbi, &cpc);
a9163b947ae8f7 Byungki Lee    2022-04-29  1908  		if (ret)
a9163b947ae8f7 Byungki Lee    2022-04-29  1909  			goto stop;
a9163b947ae8f7 Byungki Lee    2022-04-29  1910  	}
c81d5bae404abc Jaegeuk Kim    2022-05-06  1911  go_gc_more:
e066b83c9b40f3 Jaegeuk Kim    2017-04-13  1912  	segno = NULL_SEGNO;
7bc0900347e069 Jaegeuk Kim    2012-11-02  1913  	goto gc_more;
d147ea4adb969b Jaegeuk Kim    2022-05-06  1914  
408e9375610cca Jaegeuk Kim    2013-01-03  1915  stop:
e066b83c9b40f3 Jaegeuk Kim    2017-04-13  1916  	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
d147ea4adb969b Jaegeuk Kim    2022-05-06  1917  	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;
c56f16dab0dfc8 Chao Yu        2017-08-11  1918  
71419129625a50 Chao Yu        2022-05-06  1919  	if (gc_type == FG_GC)
71419129625a50 Chao Yu        2022-05-06  1920  		f2fs_unpin_all_sections(sbi, true);
71419129625a50 Chao Yu        2022-05-06  1921  
c56f16dab0dfc8 Chao Yu        2017-08-11  1922  	trace_f2fs_gc_end(sbi->sb, ret, total_freed, sec_freed,
c56f16dab0dfc8 Chao Yu        2017-08-11  1923  				get_pages(sbi, F2FS_DIRTY_NODES),
c56f16dab0dfc8 Chao Yu        2017-08-11  1924  				get_pages(sbi, F2FS_DIRTY_DENTS),
c56f16dab0dfc8 Chao Yu        2017-08-11  1925  				get_pages(sbi, F2FS_DIRTY_IMETA),
c56f16dab0dfc8 Chao Yu        2017-08-11  1926  				free_sections(sbi),
c56f16dab0dfc8 Chao Yu        2017-08-11  1927  				free_segments(sbi),
c56f16dab0dfc8 Chao Yu        2017-08-11  1928  				reserved_segments(sbi),
c56f16dab0dfc8 Chao Yu        2017-08-11  1929  				prefree_segments(sbi));
c56f16dab0dfc8 Chao Yu        2017-08-11  1930  
e4544b63a7ee49 Tim Murray     2022-01-07  1931  	f2fs_up_write(&sbi->gc_lock);
7bc0900347e069 Jaegeuk Kim    2012-11-02  1932  
7dda2af83b2b75 Changman Lee   2014-11-28  1933  	put_gc_inode(&gc_list);
d530d4d8e237f4 Chao Yu        2015-10-05  1934  
d147ea4adb969b Jaegeuk Kim    2022-05-06  1935  	if (gc_control->err_gc_skipped && !ret)
d530d4d8e237f4 Chao Yu        2015-10-05  1936  		ret = sec_freed ? 0 : -EAGAIN;
437275272f9e63 Jaegeuk Kim    2013-02-04  1937  	return ret;
7bc0900347e069 Jaegeuk Kim    2012-11-02  1938  }
7bc0900347e069 Jaegeuk Kim    2012-11-02  1939  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
