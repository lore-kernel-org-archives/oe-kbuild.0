Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5128933C9
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 12:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679054416; x=1710590416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OlcaVljbTknzOMqmMJkDmWOO2q5hbp2xlWHVQaOnb38=;
  b=aLEHOi60h7QFEIBiI/g7iMoLxf1VpXXscpKkSLX+ho12+ziNEYhZBm08
   mx47BllI5K4O5tX+cj8z9uU9dEtpBbxO027QAvgKsQzp658ElIxy7yjho
   rWA2PZwQdw/z+mSELrSTNLj15adjGaea2tbL/6jziJ/8sMl64hZuD32un
   eleYq8O9lg7O+p+jCNdAcFEiGW6KLEn2S0yw+unK3nHqVsFg0xTdzLbzv
   ZVCj/IN8ofH4QyyXU7V5r4RQ9SVhlaj0eE85LUc5eKd4tP1sJYI8ko8er
   hciuxntT8YUcIeigduf/rObjEnWzr3JQmq2oRtBWewp45YKdxetMVwv5Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="403112090"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="403112090"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 05:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823649184"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="823649184"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2023 05:00:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd8kg-0009Kk-0p;
	Fri, 17 Mar 2023 12:00:06 +0000
Date: Fri, 17 Mar 2023 19:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jaegeuk-f2fs:dev-test 8/12] fs/f2fs/segment.c:1425:4: warning:
 Value stored to 'tdc' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303171906.bAA3G215-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/f2fs/segment.c:1425:4: warning: Value stored to 'tdc' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-f2fs-devel@lists.sourceforge.net
TO: Jaegeuk Kim <jaegeuk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   d15180a8d1d72c7bddcb700d2c9ffdab7d2b9481
commit: 7e9775a516ff6c1e73ee2b42ec563cafee38f42f [8/12] f2fs: factor out discard_cmd usage from general rb_tree use
:::::: branch date: 18 hours ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c006-20230312 (https://download.01.org/0day-ci/archive/20230317/202303171906.bAA3G215-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?id=7e9775a516ff6c1e73ee2b42ec563cafee38f42f
        git remote add jaegeuk-f2fs https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
        git fetch --no-tags jaegeuk-f2fs dev-test
        git checkout 7e9775a516ff6c1e73ee2b42ec563cafee38f42f
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303171906.bAA3G215-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   fs/f2fs/segment.c:323:4: note: Taking false branch
                           if (!__is_valid_data_blkaddr(blkaddr)) {
                           ^
   fs/f2fs/segment.c:325:15: note: Assuming the condition is false
                           } else if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:325:11: note: Taking false branch
                           } else if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
                                  ^
   fs/f2fs/segment.c:337:10: note: Calling '__replace_atomic_write_block'
                           ret = __replace_atomic_write_block(inode, index, blkaddr,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:221:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   fs/f2fs/segment.c:221:2: note: Taking false branch
           if (err) {
           ^
   fs/f2fs/segment.c:230:6: note: Assuming 'err' is not equal to 0
           if (err) {
               ^~~
   fs/f2fs/segment.c:230:2: note: Taking true branch
           if (err) {
           ^
   fs/f2fs/segment.c:337:10: note: Returning from '__replace_atomic_write_block'
                           ret = __replace_atomic_write_block(inode, index, blkaddr,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:339:8: note: 'ret' is not equal to 0
                           if (ret) {
                               ^~~
   fs/f2fs/segment.c:339:4: note: Taking true branch
                           if (ret) {
                           ^
   fs/f2fs/segment.c:342:5: note: Control jumps to line 356
                                   goto out;
                                   ^
   fs/f2fs/segment.c:356:6: note: 'ret' is not equal to 0
           if (ret) {
               ^~~
   fs/f2fs/segment.c:356:2: note: Taking true branch
           if (ret) {
           ^
   fs/f2fs/segment.c:363:46: note: 'ret' is not equal to 0
           __complete_revoke_list(inode, &revoke_list, ret ? true : false);
                                                       ^~~
   fs/f2fs/segment.c:363:46: note: '?' condition is true
   fs/f2fs/segment.c:363:2: note: Calling '__complete_revoke_list'
           __complete_revoke_list(inode, &revoke_list, ret ? true : false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:271:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry_safe(cur, tmp, head, list) {
           ^
   include/linux/list.h:776:2: note: expanded from macro 'list_for_each_entry_safe'
           for (pos = list_first_entry(head, typeof(*pos), member),        \
           ^
   fs/f2fs/segment.c:272:7: note: 'revoke' is true
                   if (revoke) {
                       ^~~~~~
   fs/f2fs/segment.c:272:3: note: Taking true branch
                   if (revoke) {
                   ^
   fs/f2fs/segment.c:274:22: note: Passing null pointer value via 4th parameter 'old_addr'
                                                   cur->old_addr, NULL, true);
                                                                  ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   fs/f2fs/segment.c:273:4: note: Calling '__replace_atomic_write_block'
                           __replace_atomic_write_block(inode, cur->index,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:221:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   fs/f2fs/segment.c:221:2: note: Taking false branch
           if (err) {
           ^
   fs/f2fs/segment.c:230:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   fs/f2fs/segment.c:230:2: note: Taking false branch
           if (err) {
           ^
   fs/f2fs/segment.c:235:6: note: 'recover' is true
           if (recover) {
               ^~~~~~~
   fs/f2fs/segment.c:235:2: note: Taking true branch
           if (recover) {
           ^
   fs/f2fs/segment.c:237:3: note: Taking true branch
                   if (!__is_valid_data_blkaddr(new_addr)) {
                   ^
   fs/f2fs/segment.c:238:8: note: 'new_addr' is not equal to NULL_ADDR
                           if (new_addr == NULL_ADDR)
                               ^~~~~~~~
   fs/f2fs/segment.c:238:4: note: Taking false branch
                           if (new_addr == NULL_ADDR)
                           ^
   fs/f2fs/segment.c:260:13: note: Dereference of null pointer (loaded from variable 'old_addr')
                                           index, *old_addr, new_addr, recover);
                                                  ^~~~~~~~~
>> fs/f2fs/segment.c:1425:4: warning: Value stored to 'tdc' is never read [clang-analyzer-deadcode.DeadStores]
                           tdc = prev_dc;
                           ^     ~~~~~~~
   fs/f2fs/segment.c:1425:4: note: Value stored to 'tdc' is never read
                           tdc = prev_dc;
                           ^     ~~~~~~~
   include/linux/math64.h:28:24: warning: Division by zero [clang-analyzer-core.DivideZero]
           *remainder = dividend % divisor;
                                 ^
   fs/f2fs/segment.c:5166:6: note: Assuming 'sm_info' is non-null
           if (!sm_info)
               ^~~~~~~~
   fs/f2fs/segment.c:5166:2: note: Taking false branch
           if (!sm_info)
           ^
   fs/f2fs/segment.c:5180:6: note: Assuming field 'rec_prefree_segments' is <= DEF_MAX_RECLAIM_PREFREE_SEGMENTS
           if (sm_info->rec_prefree_segments > DEF_MAX_RECLAIM_PREFREE_SEGMENTS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:5180:2: note: Taking false branch
           if (sm_info->rec_prefree_segments > DEF_MAX_RECLAIM_PREFREE_SEGMENTS)
           ^
   fs/f2fs/segment.c:5183:2: note: Taking true branch
           if (!f2fs_lfs_mode(sbi))
           ^
   fs/f2fs/segment.c:5193:2: note: Loop condition is false.  Exiting loop
           init_f2fs_rwsem(&sm_info->curseg_lock);
           ^
   fs/f2fs/f2fs.h:2138:34: note: expanded from macro 'init_f2fs_rwsem'
   #define init_f2fs_rwsem(sem)                                    \
                                                                   ^
   fs/f2fs/segment.c:5196:6: note: 'err' is 0
           if (err)
               ^~~
   fs/f2fs/segment.c:5196:2: note: Taking false branch
           if (err)
           ^
   fs/f2fs/segment.c:5200:6: note: 'err' is 0
           if (err)
               ^~~
   fs/f2fs/segment.c:5200:2: note: Taking false branch
           if (err)
           ^
   fs/f2fs/segment.c:5204:6: note: 'err' is 0
           if (err)
               ^~~
   fs/f2fs/segment.c:5204:2: note: Taking false branch
           if (err)
           ^
   fs/f2fs/segment.c:5207:6: note: 'err' is 0
           if (err)
               ^~~
   fs/f2fs/segment.c:5207:2: note: Taking false branch
           if (err)
           ^
   fs/f2fs/segment.c:5210:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/f2fs/segment.c:5210:2: note: Taking false branch
           if (err)
           ^
   fs/f2fs/segment.c:5215:6: note: 'err' is 0
           if (err)
               ^~~
   fs/f2fs/segment.c:5215:2: note: Taking false branch
           if (err)
           ^
   fs/f2fs/segment.c:5220:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/f2fs/segment.c:5220:2: note: Taking false branch
           if (err)
           ^
   fs/f2fs/segment.c:5223:8: note: Value assigned to field 'segs_per_sec'
           err = sanity_check_curseg(sbi);
                 ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:5224:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/f2fs/segment.c:5224:2: note: Taking false branch
           if (err)
           ^
   fs/f2fs/segment.c:5227:2: note: Calling 'init_min_max_mtime'
           init_min_max_mtime(sbi);
           ^~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:5141:18: note: Assuming 'segno' is < field 'main_segments'
           for (segno = 0; segno < MAIN_SEGS(sbi); segno += sbi->segs_per_sec) {
                           ^~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:5141:2: note: Loop condition is true.  Entering loop body
           for (segno = 0; segno < MAIN_SEGS(sbi); segno += sbi->segs_per_sec) {
           ^
   fs/f2fs/segment.c:5145:15: note: Assuming 'i' is >= field 'segs_per_sec'
                   for (i = 0; i < sbi->segs_per_sec; i++)
                               ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:5145:3: note: Loop condition is false. Execution continues on line 5148
                   for (i = 0; i < sbi->segs_per_sec; i++)
                   ^
   fs/f2fs/segment.c:5148:26: note: Passing the value 0 via 2nd parameter 'divisor'
                   mtime = div_u64(mtime, sbi->segs_per_sec);
                                          ^~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:5148:11: note: Calling 'div_u64'
                   mtime = div_u64(mtime, sbi->segs_per_sec);

vim +/tdc +1425 fs/f2fs/segment.c

3d6a650febdd76 Yunlei He         2017-03-02  1370  
004b68621897f0 Chao Yu           2017-04-14  1371  static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
004b68621897f0 Chao Yu           2017-04-14  1372  				struct block_device *bdev, block_t lstart,
004b68621897f0 Chao Yu           2017-04-14  1373  				block_t start, block_t len)
275b66b09e85cf Chao Yu           2016-08-29  1374  {
0b54fb8458199d Jaegeuk Kim       2017-01-11  1375  	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
004b68621897f0 Chao Yu           2017-04-14  1376  	struct discard_cmd *prev_dc = NULL, *next_dc = NULL;
004b68621897f0 Chao Yu           2017-04-14  1377  	struct discard_cmd *dc;
004b68621897f0 Chao Yu           2017-04-14  1378  	struct discard_info di = {0};
004b68621897f0 Chao Yu           2017-04-14  1379  	struct rb_node **insert_p = NULL, *insert_parent = NULL;
35ec7d57488497 Chao Yu           2018-08-06  1380  	unsigned int max_discard_blocks =
cf0fbf894bb543 Christoph Hellwig 2022-04-15  1381  			SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
004b68621897f0 Chao Yu           2017-04-14  1382  	block_t end = lstart + len;
275b66b09e85cf Chao Yu           2016-08-29  1383  
7e9775a516ff6c Jaegeuk Kim       2023-03-10  1384  	dc = __lookup_discard_cmd_ret(&dcc->root, lstart,
7e9775a516ff6c Jaegeuk Kim       2023-03-10  1385  				&prev_dc, &next_dc, &insert_p, &insert_parent);
004b68621897f0 Chao Yu           2017-04-14  1386  	if (dc)
004b68621897f0 Chao Yu           2017-04-14  1387  		prev_dc = dc;
004b68621897f0 Chao Yu           2017-04-14  1388  
004b68621897f0 Chao Yu           2017-04-14  1389  	if (!prev_dc) {
004b68621897f0 Chao Yu           2017-04-14  1390  		di.lstart = lstart;
7e9775a516ff6c Jaegeuk Kim       2023-03-10  1391  		di.len = next_dc ? next_dc->di.lstart - lstart : len;
004b68621897f0 Chao Yu           2017-04-14  1392  		di.len = min(di.len, len);
004b68621897f0 Chao Yu           2017-04-14  1393  		di.start = start;
4e6a8d9b224f88 Jaegeuk Kim       2016-12-29  1394  	}
4e6a8d9b224f88 Jaegeuk Kim       2016-12-29  1395  
004b68621897f0 Chao Yu           2017-04-14  1396  	while (1) {
004b68621897f0 Chao Yu           2017-04-14  1397  		struct rb_node *node;
004b68621897f0 Chao Yu           2017-04-14  1398  		struct discard_cmd *tdc = NULL;
004b68621897f0 Chao Yu           2017-04-14  1399  
004b68621897f0 Chao Yu           2017-04-14  1400  		if (prev_dc) {
7e9775a516ff6c Jaegeuk Kim       2023-03-10  1401  			di.lstart = prev_dc->di.lstart + prev_dc->di.len;
004b68621897f0 Chao Yu           2017-04-14  1402  			if (di.lstart < lstart)
004b68621897f0 Chao Yu           2017-04-14  1403  				di.lstart = lstart;
004b68621897f0 Chao Yu           2017-04-14  1404  			if (di.lstart >= end)
004b68621897f0 Chao Yu           2017-04-14  1405  				break;
004b68621897f0 Chao Yu           2017-04-14  1406  
7e9775a516ff6c Jaegeuk Kim       2023-03-10  1407  			if (!next_dc || next_dc->di.lstart > end)
004b68621897f0 Chao Yu           2017-04-14  1408  				di.len = end - di.lstart;
004b68621897f0 Chao Yu           2017-04-14  1409  			else
7e9775a516ff6c Jaegeuk Kim       2023-03-10  1410  				di.len = next_dc->di.lstart - di.lstart;
004b68621897f0 Chao Yu           2017-04-14  1411  			di.start = start + di.lstart - lstart;
004b68621897f0 Chao Yu           2017-04-14  1412  		}
004b68621897f0 Chao Yu           2017-04-14  1413  
004b68621897f0 Chao Yu           2017-04-14  1414  		if (!di.len)
004b68621897f0 Chao Yu           2017-04-14  1415  			goto next;
004b68621897f0 Chao Yu           2017-04-14  1416  
004b68621897f0 Chao Yu           2017-04-14  1417  		if (prev_dc && prev_dc->state == D_PREP &&
004b68621897f0 Chao Yu           2017-04-14  1418  			prev_dc->bdev == bdev &&
35ec7d57488497 Chao Yu           2018-08-06  1419  			__is_discard_back_mergeable(&di, &prev_dc->di,
35ec7d57488497 Chao Yu           2018-08-06  1420  							max_discard_blocks)) {
004b68621897f0 Chao Yu           2017-04-14  1421  			prev_dc->di.len += di.len;
d84d1cbdec6b5d Chao Yu           2017-04-18  1422  			dcc->undiscard_blks += di.len;
ba48a33ef6faa5 Chao Yu           2017-04-15  1423  			__relocate_discard_cmd(dcc, prev_dc);
004b68621897f0 Chao Yu           2017-04-14  1424  			di = prev_dc->di;
004b68621897f0 Chao Yu           2017-04-14 @1425  			tdc = prev_dc;
7e9775a516ff6c Jaegeuk Kim       2023-03-10  1426  			goto next;
004b68621897f0 Chao Yu           2017-04-14  1427  		}
004b68621897f0 Chao Yu           2017-04-14  1428  
004b68621897f0 Chao Yu           2017-04-14  1429  		if (next_dc && next_dc->state == D_PREP &&
004b68621897f0 Chao Yu           2017-04-14  1430  			next_dc->bdev == bdev &&
35ec7d57488497 Chao Yu           2018-08-06  1431  			__is_discard_front_mergeable(&di, &next_dc->di,
35ec7d57488497 Chao Yu           2018-08-06  1432  							max_discard_blocks)) {
004b68621897f0 Chao Yu           2017-04-14  1433  			next_dc->di.lstart = di.lstart;
004b68621897f0 Chao Yu           2017-04-14  1434  			next_dc->di.len += di.len;
004b68621897f0 Chao Yu           2017-04-14  1435  			next_dc->di.start = di.start;
d84d1cbdec6b5d Chao Yu           2017-04-18  1436  			dcc->undiscard_blks += di.len;
ba48a33ef6faa5 Chao Yu           2017-04-15  1437  			__relocate_discard_cmd(dcc, next_dc);
004b68621897f0 Chao Yu           2017-04-14  1438  			if (tdc)
004b68621897f0 Chao Yu           2017-04-14  1439  				__remove_discard_cmd(sbi, tdc);
7e9775a516ff6c Jaegeuk Kim       2023-03-10  1440  			goto next;
004b68621897f0 Chao Yu           2017-04-14  1441  		}
004b68621897f0 Chao Yu           2017-04-14  1442  
7e9775a516ff6c Jaegeuk Kim       2023-03-10  1443  		__insert_discard_cmd(sbi, bdev, di.lstart, di.start, di.len);
004b68621897f0 Chao Yu           2017-04-14  1444   next:
004b68621897f0 Chao Yu           2017-04-14  1445  		prev_dc = next_dc;
004b68621897f0 Chao Yu           2017-04-14  1446  		if (!prev_dc)
004b68621897f0 Chao Yu           2017-04-14  1447  			break;
004b68621897f0 Chao Yu           2017-04-14  1448  
004b68621897f0 Chao Yu           2017-04-14  1449  		node = rb_next(&prev_dc->rb_node);
004b68621897f0 Chao Yu           2017-04-14  1450  		next_dc = rb_entry_safe(node, struct discard_cmd, rb_node);
004b68621897f0 Chao Yu           2017-04-14  1451  	}
004b68621897f0 Chao Yu           2017-04-14  1452  }
004b68621897f0 Chao Yu           2017-04-14  1453  

:::::: The code at line 1425 was first introduced by commit
:::::: 004b68621897f06aa2817e7438469d23f4a3a284 f2fs: use rb-tree to track pending discard commands

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
