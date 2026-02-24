Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D5C3806A6
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771944423; cv=none; b=u98RXyAV5aUJs29AjQMC3vC6Z3EogVl+jzEvh2q1faGued3TdvRsjTLhUU50F+0U3y+0E9GlyU+RuGiwr6TL+oAVN2ylbJC+y0evqKZh+aU3kIzGHd+sokejW2o+ZOdUucDvnjHguchWrCDywHxVILfWKVPYwk+tNzH7U3zvrWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771944423; c=relaxed/simple;
	bh=Tws9PTyfGQ23Rz8d3Go/AmHqBqDJgD495QorK4ueJtA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qxrkRp4mBc79GIEAm64JrzGQWtAKqi4CxPZ/ryHe7eBQcu7XwgJf2PlUmBkA3AljiSsWlJrSX5MVZvlcBHT3Wou+aWridk5hxrdBd9nPrcFlNPwfAp5UzuI8tshR0J3hn4T3qqltC6r+TXNwA9DEfRzCpQ5I2K/TdfHunVL2Aac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOAelD4U; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOAelD4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771944421; x=1803480421;
  h=date:from:to:cc:subject:message-id;
  bh=Tws9PTyfGQ23Rz8d3Go/AmHqBqDJgD495QorK4ueJtA=;
  b=AOAelD4UHpu9FD7u89eNlaAea7Hxdb4mVeDOjLSYiMS72PC+OSR6ZDJJ
   ByZs8KdFTk4eApgLWDETe3OaCeEIoygGulD7oaNSVbDkZJf3DS1xlTKGP
   JG83arlrHE6WSw9sEo9vHBTaIq8ljfcBIuR3RM5JDgMD3BIWpnOIyi+Mc
   tueaJS+SqCLctNb3xvPTdXKNF3yBUfPHLLEtwviQN4eeB14nm8hJIaHvj
   ZKPLIra/u9bX3qp346IR/U3qZwUhgWi92CUgVMjr1cuQMrYir4/3IJ6G8
   XBIh2iS/Yqx4++a9qxbSMzHZ95xKioeG+xNcAlybnScGfwU7Q19RDHMoY
   A==;
X-CSE-ConnectionGUID: 6KropAb6QkuZZnkgqQclEg==
X-CSE-MsgGUID: M00UuE8UTJG36bf+fq+BMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84321215"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="84321215"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 06:47:00 -0800
X-CSE-ConnectionGUID: i/u/MB1cTQGAfkDaYHRP5Q==
X-CSE-MsgGUID: aiks2ORFTQ241bErfyMtQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="253658259"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Feb 2026 06:47:00 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vutge-00000000241-3UWr;
	Tue, 24 Feb 2026 14:46:56 +0000
Date: Tue, 24 Feb 2026 22:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jaegeuk-f2fs:dev-test 5/5] fs/f2fs/gc.c:1286
 ra_data_block() warn: missing error code 'err'
Message-ID: <202602242237.boCX8y4A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-f2fs-devel@lists.sourceforge.net
TO: Jianan Huang <huangjianan@xiaomi.com>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Sheng Yong <shengyong1@xiaomi.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   0c3712423755e851debb4021af26802b75d1cb9d
commit: 0c3712423755e851debb4021af26802b75d1cb9d [5/5] f2fs: avoid reading already updated pages during GC
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: csky-randconfig-r071-20260224 (https://download.01.org/0day-ci/archive/20260224/202602242237.boCX8y4A-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602242237.boCX8y4A-lkp@intel.com/

smatch warnings:
fs/f2fs/gc.c:1286 ra_data_block() warn: missing error code 'err'

vim +/err +1286 fs/f2fs/gc.c

7bc0900347e069a Jaegeuk Kim             2012-11-02  1216  
6aa58d8ad20a332 Chao Yu                 2018-08-14  1217  static int ra_data_block(struct inode *inode, pgoff_t index)
6aa58d8ad20a332 Chao Yu                 2018-08-14  1218  {
6aa58d8ad20a332 Chao Yu                 2018-08-14  1219  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
f18d00769336897 Sunmin Jeong            2024-07-10  1220  	struct address_space *mapping = f2fs_is_cow_file(inode) ?
f18d00769336897 Sunmin Jeong            2024-07-10  1221  				F2FS_I(inode)->atomic_inode->i_mapping : inode->i_mapping;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1222  	struct dnode_of_data dn;
e0b89d00ea9f846 Chao Yu                 2025-10-14  1223  	struct folio *folio, *efolio;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1224  	struct f2fs_io_info fio = {
6aa58d8ad20a332 Chao Yu                 2018-08-14  1225  		.sbi = sbi,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1226  		.ino = inode->i_ino,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1227  		.type = DATA,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1228  		.temp = COLD,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1229  		.op = REQ_OP_READ,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1230  		.op_flags = 0,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1231  		.encrypted_page = NULL,
2eae077e6e46f90 Chao Yu                 2023-02-02  1232  		.in_list = 0,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1233  	};
0c3712423755e85 Jianan Huang            2026-02-09  1234  	int err = 0;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1235  
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1236) 	folio = f2fs_grab_cache_folio(mapping, index, true);
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1237) 	if (IS_ERR(folio))
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1238) 		return PTR_ERR(folio);
6aa58d8ad20a332 Chao Yu                 2018-08-14  1239  
04a91ab01684744 Christoph Hellwig       2022-11-28  1240  	if (f2fs_lookup_read_extent_cache_block(inode, index,
04a91ab01684744 Christoph Hellwig       2022-11-28  1241  						&dn.data_blkaddr)) {
93770ab7a6e9631 Chao Yu                 2019-04-15  1242  		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
93770ab7a6e9631 Chao Yu                 2019-04-15  1243  						DATA_GENERIC_ENHANCE_READ))) {
10f966bbf521bb9 Chao Yu                 2019-06-20  1244  			err = -EFSCORRUPTED;
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1245) 			goto put_folio;
93770ab7a6e9631 Chao Yu                 2019-04-15  1246  		}
6aa58d8ad20a332 Chao Yu                 2018-08-14  1247  		goto got_it;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1248  	}
6aa58d8ad20a332 Chao Yu                 2018-08-14  1249  
6aa58d8ad20a332 Chao Yu                 2018-08-14  1250  	set_new_dnode(&dn, inode, NULL, NULL, 0);
6aa58d8ad20a332 Chao Yu                 2018-08-14  1251  	err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
6aa58d8ad20a332 Chao Yu                 2018-08-14  1252  	if (err)
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1253) 		goto put_folio;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1254  	f2fs_put_dnode(&dn);
6aa58d8ad20a332 Chao Yu                 2018-08-14  1255  
93770ab7a6e9631 Chao Yu                 2019-04-15  1256  	if (!__is_valid_data_blkaddr(dn.data_blkaddr)) {
93770ab7a6e9631 Chao Yu                 2019-04-15  1257  		err = -ENOENT;
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1258) 		goto put_folio;
93770ab7a6e9631 Chao Yu                 2019-04-15  1259  	}
6aa58d8ad20a332 Chao Yu                 2018-08-14  1260  	if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
93770ab7a6e9631 Chao Yu                 2019-04-15  1261  						DATA_GENERIC_ENHANCE))) {
10f966bbf521bb9 Chao Yu                 2019-06-20  1262  		err = -EFSCORRUPTED;
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1263) 		goto put_folio;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1264  	}
6aa58d8ad20a332 Chao Yu                 2018-08-14  1265  got_it:
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1266) 	/* read folio */
d342b7adad71e5a Matthew Wilcox (Oracle  2025-07-08  1267) 	fio.folio = folio;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1268  	fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1269  
9bf1a3f73927492 Yunlong Song            2018-09-18  1270  	/*
9bf1a3f73927492 Yunlong Song            2018-09-18  1271  	 * don't cache encrypted data into meta inode until previous dirty
9bf1a3f73927492 Yunlong Song            2018-09-18  1272  	 * data were writebacked to avoid racing between GC and flush.
9bf1a3f73927492 Yunlong Song            2018-09-18  1273  	 */
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1274) 	f2fs_folio_wait_writeback(folio, DATA, true, true);
9bf1a3f73927492 Yunlong Song            2018-09-18  1275  
9bf1a3f73927492 Yunlong Song            2018-09-18  1276  	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
9bf1a3f73927492 Yunlong Song            2018-09-18  1277  
e0b89d00ea9f846 Chao Yu                 2025-10-14  1278  	efolio = f2fs_filemap_get_folio(META_MAPPING(sbi), dn.data_blkaddr,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1279  					FGP_LOCK | FGP_CREAT, GFP_NOFS);
e0b89d00ea9f846 Chao Yu                 2025-10-14  1280  	if (IS_ERR(efolio)) {
e0b89d00ea9f846 Chao Yu                 2025-10-14  1281  		err = PTR_ERR(efolio);
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1282) 		goto put_folio;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1283  	}
6aa58d8ad20a332 Chao Yu                 2018-08-14  1284  
0c3712423755e85 Jianan Huang            2026-02-09  1285  	if (folio_test_uptodate(efolio))
0c3712423755e85 Jianan Huang            2026-02-09 @1286  		goto put_encrypted_page;
0c3712423755e85 Jianan Huang            2026-02-09  1287  
e0b89d00ea9f846 Chao Yu                 2025-10-14  1288  	fio.encrypted_page = &efolio->page;
e0b89d00ea9f846 Chao Yu                 2025-10-14  1289  
6aa58d8ad20a332 Chao Yu                 2018-08-14  1290  	err = f2fs_submit_page_bio(&fio);
6aa58d8ad20a332 Chao Yu                 2018-08-14  1291  	if (err)
6aa58d8ad20a332 Chao Yu                 2018-08-14  1292  		goto put_encrypted_page;
89c16629e3136f0 Yongpeng Yang           2025-10-27  1293  	f2fs_put_page(fio.encrypted_page, false);
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1294) 	f2fs_folio_put(folio, true);
8b83ac81f4283ae Chao Yu                 2020-04-16  1295  
34a23525601a16f Chao Yu                 2022-08-20  1296  	f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
34a23525601a16f Chao Yu                 2022-08-20  1297  	f2fs_update_iostat(sbi, NULL, FS_GDATA_READ_IO, F2FS_BLKSIZE);
8b83ac81f4283ae Chao Yu                 2020-04-16  1298  
6aa58d8ad20a332 Chao Yu                 2018-08-14  1299  	return 0;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1300  put_encrypted_page:
89c16629e3136f0 Yongpeng Yang           2025-10-27  1301  	f2fs_put_page(fio.encrypted_page, true);
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1302) put_folio:
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1303) 	f2fs_folio_put(folio, true);
6aa58d8ad20a332 Chao Yu                 2018-08-14  1304  	return err;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1305  }
6aa58d8ad20a332 Chao Yu                 2018-08-14  1306  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
