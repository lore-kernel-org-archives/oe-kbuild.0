Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD5F36B076
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 20:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208582; cv=none; b=IY3Iu4ZnTrQwQ+r5v5rUmYUgsYK1RqN00PLNkDBEKyxp1JVJd+Jp8rO+2byQz2rnbqnHqH3vJyd5seUwNE92whfvrAcFZAbgDXf0lF2oVxdp+faIWQ/5ZqvtiQXHvk7K7p6yKf3FdY/us9CNlp5zb6epNwC/Ua124id2HKKtx58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208582; c=relaxed/simple;
	bh=7E327qqiaqRNOBexjq/NiEUiFlwl+g2a+e0T0udUsZU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hNDrlS9NIx4KPYA7Gj4I7VRJ5vKfU2/4RAJxkPncOqu8T5+y9/1sS0Ef89uJMEqnFWFflwsgaRsJnOUqZldBDqK2h0IHmujfu9ZExqfnQEFnPkdyOPOUU93Frm4g5BITPCcKCccpQ91NngZtry15BEXp+XUAVtoZUcxELbVQnyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjxjZDa7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjxjZDa7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781208579; x=1812744579;
  h=date:from:to:cc:subject:message-id;
  bh=7E327qqiaqRNOBexjq/NiEUiFlwl+g2a+e0T0udUsZU=;
  b=IjxjZDa7ZiyQlCkks+N7ISZ0+SQA8Oprvp8zn/YIhrAZmbALnRVtOuiZ
   wu/+kqELK7ZfP74EaZ6d9OjIbiyMuNvY6r5AhQt+3uprFNJkEruinHFc6
   Qqf10bLq9hj7dOPy2PJnDcaVDYge/kY+J/eiMibI5aPtBJbbWdN7pjpj/
   sGcWxlxaBWr5akgMqqlVHWa2GgL8Dz9mApjCokN2hPTcVtlLbkYhOFLNt
   zEyygFPvwBQG6iQ5OI4LE8/k9r+HgUg/EAkfg8DpHHPEzL+T83LHXeR1C
   Kq5q7k6yO2QYtp56tj7sy/mgyrY9AvwYdeUTlqPuclojGTyoxPWdzMO8z
   w==;
X-CSE-ConnectionGUID: soRaeS7sTtiOWhRH7q2FlQ==
X-CSE-MsgGUID: msQIAhyRR4iCYmlsWFLfPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82040439"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82040439"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 13:09:39 -0700
X-CSE-ConnectionGUID: apwwP6gjQtaxajGQF8BVrQ==
X-CSE-MsgGUID: mv3oboTkTPW8ZRa1ItXR6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="276783459"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jun 2026 13:09:38 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXliZ-00000000NoZ-3cXK;
	Thu, 11 Jun 2026 20:09:35 +0000
Date: Fri, 12 Jun 2026 04:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/f2fs/gc.c:1288 ra_data_block() warn: missing error code
 'err'
Message-ID: <202606120424.xoSOsUTC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jianan Huang <huangjianan@xiaomi.com>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Sheng Yong <shengyong1@xiaomi.com>
CC: Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 570e2ccc7cb35fe720106964e65060602d3d2ac4 f2fs: avoid reading already updated pages during GC
date:   3 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260612/202606120424.xoSOsUTC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 570e2ccc7cb3 ("f2fs: avoid reading already updated pages during GC")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606120424.xoSOsUTC-lkp@intel.com/

smatch warnings:
fs/f2fs/gc.c:1288 ra_data_block() warn: missing error code 'err'

vim +/err +1288 fs/f2fs/gc.c

7bc0900347e069 Jaegeuk Kim             2012-11-02  1216  
6aa58d8ad20a33 Chao Yu                 2018-08-14  1217  static int ra_data_block(struct inode *inode, pgoff_t index)
6aa58d8ad20a33 Chao Yu                 2018-08-14  1218  {
6aa58d8ad20a33 Chao Yu                 2018-08-14  1219  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
f18d0076933689 Sunmin Jeong            2024-07-10  1220  	struct address_space *mapping = f2fs_is_cow_file(inode) ?
f18d0076933689 Sunmin Jeong            2024-07-10  1221  				F2FS_I(inode)->atomic_inode->i_mapping : inode->i_mapping;
6aa58d8ad20a33 Chao Yu                 2018-08-14  1222  	struct dnode_of_data dn;
e0b89d00ea9f84 Chao Yu                 2025-10-14  1223  	struct folio *folio, *efolio;
6aa58d8ad20a33 Chao Yu                 2018-08-14  1224  	struct f2fs_io_info fio = {
6aa58d8ad20a33 Chao Yu                 2018-08-14  1225  		.sbi = sbi,
6aa58d8ad20a33 Chao Yu                 2018-08-14  1226  		.ino = inode->i_ino,
6aa58d8ad20a33 Chao Yu                 2018-08-14  1227  		.type = DATA,
6aa58d8ad20a33 Chao Yu                 2018-08-14  1228  		.temp = COLD,
6aa58d8ad20a33 Chao Yu                 2018-08-14  1229  		.op = REQ_OP_READ,
6aa58d8ad20a33 Chao Yu                 2018-08-14  1230  		.op_flags = 0,
6aa58d8ad20a33 Chao Yu                 2018-08-14  1231  		.encrypted_page = NULL,
2eae077e6e46f9 Chao Yu                 2023-02-02  1232  		.in_list = 0,
6aa58d8ad20a33 Chao Yu                 2018-08-14  1233  	};
570e2ccc7cb35f Jianan Huang            2026-03-05  1234  	int err = 0;
6aa58d8ad20a33 Chao Yu                 2018-08-14  1235  
0d53be232343c1 Matthew Wilcox (Oracle  2025-03-31  1236) 	folio = f2fs_grab_cache_folio(mapping, index, true);
0d53be232343c1 Matthew Wilcox (Oracle  2025-03-31  1237) 	if (IS_ERR(folio))
0d53be232343c1 Matthew Wilcox (Oracle  2025-03-31  1238) 		return PTR_ERR(folio);
6aa58d8ad20a33 Chao Yu                 2018-08-14  1239  
04a91ab0168474 Christoph Hellwig       2022-11-28  1240  	if (f2fs_lookup_read_extent_cache_block(inode, index,
04a91ab0168474 Christoph Hellwig       2022-11-28  1241  						&dn.data_blkaddr)) {
93770ab7a6e963 Chao Yu                 2019-04-15  1242  		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
93770ab7a6e963 Chao Yu                 2019-04-15  1243  						DATA_GENERIC_ENHANCE_READ))) {
10f966bbf521bb Chao Yu                 2019-06-20  1244  			err = -EFSCORRUPTED;
0d53be232343c1 Matthew Wilcox (Oracle  2025-03-31  1245) 			goto put_folio;
93770ab7a6e963 Chao Yu                 2019-04-15  1246  		}
6aa58d8ad20a33 Chao Yu                 2018-08-14  1247  		goto got_it;
6aa58d8ad20a33 Chao Yu                 2018-08-14  1248  	}
6aa58d8ad20a33 Chao Yu                 2018-08-14  1249  
6aa58d8ad20a33 Chao Yu                 2018-08-14  1250  	set_new_dnode(&dn, inode, NULL, NULL, 0);
6aa58d8ad20a33 Chao Yu                 2018-08-14  1251  	err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
6aa58d8ad20a33 Chao Yu                 2018-08-14  1252  	if (err)
0d53be232343c1 Matthew Wilcox (Oracle  2025-03-31  1253) 		goto put_folio;
6aa58d8ad20a33 Chao Yu                 2018-08-14  1254  	f2fs_put_dnode(&dn);
6aa58d8ad20a33 Chao Yu                 2018-08-14  1255  
93770ab7a6e963 Chao Yu                 2019-04-15  1256  	if (!__is_valid_data_blkaddr(dn.data_blkaddr)) {
93770ab7a6e963 Chao Yu                 2019-04-15  1257  		err = -ENOENT;
0d53be232343c1 Matthew Wilcox (Oracle  2025-03-31  1258) 		goto put_folio;
93770ab7a6e963 Chao Yu                 2019-04-15  1259  	}
6aa58d8ad20a33 Chao Yu                 2018-08-14  1260  	if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
93770ab7a6e963 Chao Yu                 2019-04-15  1261  						DATA_GENERIC_ENHANCE))) {
10f966bbf521bb Chao Yu                 2019-06-20  1262  		err = -EFSCORRUPTED;
0d53be232343c1 Matthew Wilcox (Oracle  2025-03-31  1263) 		goto put_folio;
6aa58d8ad20a33 Chao Yu                 2018-08-14  1264  	}
6aa58d8ad20a33 Chao Yu                 2018-08-14  1265  got_it:
0d53be232343c1 Matthew Wilcox (Oracle  2025-03-31  1266) 	/* read folio */
d342b7adad71e5 Matthew Wilcox (Oracle  2025-07-08  1267) 	fio.folio = folio;
6aa58d8ad20a33 Chao Yu                 2018-08-14  1268  	fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
6aa58d8ad20a33 Chao Yu                 2018-08-14  1269  
9bf1a3f7392749 Yunlong Song            2018-09-18  1270  	/*
9bf1a3f7392749 Yunlong Song            2018-09-18  1271  	 * don't cache encrypted data into meta inode until previous dirty
9bf1a3f7392749 Yunlong Song            2018-09-18  1272  	 * data were writebacked to avoid racing between GC and flush.
9bf1a3f7392749 Yunlong Song            2018-09-18  1273  	 */
0d53be232343c1 Matthew Wilcox (Oracle  2025-03-31  1274) 	f2fs_folio_wait_writeback(folio, DATA, true, true);
9bf1a3f7392749 Yunlong Song            2018-09-18  1275  
9bf1a3f7392749 Yunlong Song            2018-09-18  1276  	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
9bf1a3f7392749 Yunlong Song            2018-09-18  1277  
e0b89d00ea9f84 Chao Yu                 2025-10-14  1278  	efolio = f2fs_filemap_get_folio(META_MAPPING(sbi), dn.data_blkaddr,
6aa58d8ad20a33 Chao Yu                 2018-08-14  1279  					FGP_LOCK | FGP_CREAT, GFP_NOFS);
e0b89d00ea9f84 Chao Yu                 2025-10-14  1280  	if (IS_ERR(efolio)) {
e0b89d00ea9f84 Chao Yu                 2025-10-14  1281  		err = PTR_ERR(efolio);
0d53be232343c1 Matthew Wilcox (Oracle  2025-03-31  1282) 		goto put_folio;
6aa58d8ad20a33 Chao Yu                 2018-08-14  1283  	}
6aa58d8ad20a33 Chao Yu                 2018-08-14  1284  
e0b89d00ea9f84 Chao Yu                 2025-10-14  1285  	fio.encrypted_page = &efolio->page;
e0b89d00ea9f84 Chao Yu                 2025-10-14  1286  
570e2ccc7cb35f Jianan Huang            2026-03-05  1287  	if (folio_test_uptodate(efolio))
570e2ccc7cb35f Jianan Huang            2026-03-05 @1288  		goto put_encrypted_page;
570e2ccc7cb35f Jianan Huang            2026-03-05  1289  
6aa58d8ad20a33 Chao Yu                 2018-08-14  1290  	err = f2fs_submit_page_bio(&fio);
6aa58d8ad20a33 Chao Yu                 2018-08-14  1291  	if (err)
6aa58d8ad20a33 Chao Yu                 2018-08-14  1292  		goto put_encrypted_page;
89c16629e3136f Yongpeng Yang           2025-10-27  1293  	f2fs_put_page(fio.encrypted_page, false);
0d53be232343c1 Matthew Wilcox (Oracle  2025-03-31  1294) 	f2fs_folio_put(folio, true);
8b83ac81f4283a Chao Yu                 2020-04-16  1295  
34a23525601a16 Chao Yu                 2022-08-20  1296  	f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
34a23525601a16 Chao Yu                 2022-08-20  1297  	f2fs_update_iostat(sbi, NULL, FS_GDATA_READ_IO, F2FS_BLKSIZE);
8b83ac81f4283a Chao Yu                 2020-04-16  1298  
6aa58d8ad20a33 Chao Yu                 2018-08-14  1299  	return 0;
6aa58d8ad20a33 Chao Yu                 2018-08-14  1300  put_encrypted_page:
89c16629e3136f Yongpeng Yang           2025-10-27  1301  	f2fs_put_page(fio.encrypted_page, true);
0d53be232343c1 Matthew Wilcox (Oracle  2025-03-31  1302) put_folio:
0d53be232343c1 Matthew Wilcox (Oracle  2025-03-31  1303) 	f2fs_folio_put(folio, true);
6aa58d8ad20a33 Chao Yu                 2018-08-14  1304  	return err;
6aa58d8ad20a33 Chao Yu                 2018-08-14  1305  }
6aa58d8ad20a33 Chao Yu                 2018-08-14  1306  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
