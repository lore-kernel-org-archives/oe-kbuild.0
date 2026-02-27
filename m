Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7552944DB70;
	Fri, 27 Feb 2026 20:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772224140; cv=none; b=qGmP8CZ5AIPWfWMEdrFdDmrmR7yjfeJzbt1pXymT3Lhvk6yrNSbA/9JuJSNVyjCEvqlak11rEJrHBL8uaczZcm0LvYq9vSpVWRVl9GMUqp8/mpNU3ztExWyE3YluBcLmURfNOKQqr7Qk2sIDBYfr1ZZYUlFDh48zDEd+IiNakzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772224140; c=relaxed/simple;
	bh=alCtN+yAPb0hO332yCZoBLY/vHWdR4J5FN+tx5wQcXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nN/hTG0GgCxA+VSV6A/uxJ2c/1Gr+YnJuVCQn/XBqR1vpRhpGifMWM0gRvH/bkISa3PBwKM9Ar7KmkeHhqR4bO9JcYgK5GdkwKpRbm1m2agFpV9d75CutbjwIP5CSedgXI8V4eruJUlz44/CTkDtr8ZeePbB5H560KqeXAHXjvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TizHpxsV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TizHpxsV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CBAC116C6;
	Fri, 27 Feb 2026 20:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772224140;
	bh=alCtN+yAPb0hO332yCZoBLY/vHWdR4J5FN+tx5wQcXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TizHpxsVDuLcmJKI8RtN3qoqg87tdMymADKj4245m40099oNeZPrzVUWTglJH54D5
	 LlPfic6BKiP7ZCAwvX+qXSqSsWbZZ+IQ34xU8slYRhLlEILBmpNgYhaU2C7EimAY3h
	 SNJcYSdEQ1KDJbQ4QDCYsjIIOKJrk+aA96XE3qXbLnMVTOt5FeUnYZQY0hnby+bwp2
	 FKYwN4LgVUkKiv+h0l5OLkuiMl9Fu5dlK0/ii9lwvfB2XxufgNdgsZ20ZS66yx2WYI
	 WeJYgqZnj2e5nhBD85pDRX+i8xmhNzHeoCtgHFhNbdz9fjqztU9trIa/FFUfyydYwp
	 B97DqLcLtHtDw==
Date: Fri, 27 Feb 2026 20:28:58 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Jianan Huang <huangjianan@xiaomi.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net,
	Sheng Yong <shengyong1@xiaomi.com>
Subject: Re: [jaegeuk-f2fs:dev-test 5/5] fs/f2fs/gc.c:1286 ra_data_block()
 warn: missing error code 'err'
Message-ID: <aaH-iiLeA7R6DOJe@google.com>
References: <202602242237.boCX8y4A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602242237.boCX8y4A-lkp@intel.com>

On 02/24, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
> head:   0c3712423755e851debb4021af26802b75d1cb9d
> commit: 0c3712423755e851debb4021af26802b75d1cb9d [5/5] f2fs: avoid reading already updated pages during GC
> config: csky-randconfig-r071-20260224 (https://download.01.org/0day-ci/archive/20260224/202602242237.boCX8y4A-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 15.2.0
> smatch version: v0.5.0-8994-gd50c5a4c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202602242237.boCX8y4A-lkp@intel.com/
> 
> smatch warnings:
> fs/f2fs/gc.c:1286 ra_data_block() warn: missing error code 'err'
> 
> vim +/err +1286 fs/f2fs/gc.c
> 
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1217  static int ra_data_block(struct inode *inode, pgoff_t index)
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1218  {
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1219  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> f18d00769336897 Sunmin Jeong            2024-07-10  1220  	struct address_space *mapping = f2fs_is_cow_file(inode) ?
> f18d00769336897 Sunmin Jeong            2024-07-10  1221  				F2FS_I(inode)->atomic_inode->i_mapping : inode->i_mapping;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1222  	struct dnode_of_data dn;
> e0b89d00ea9f846 Chao Yu                 2025-10-14  1223  	struct folio *folio, *efolio;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1224  	struct f2fs_io_info fio = {
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1225  		.sbi = sbi,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1226  		.ino = inode->i_ino,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1227  		.type = DATA,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1228  		.temp = COLD,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1229  		.op = REQ_OP_READ,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1230  		.op_flags = 0,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1231  		.encrypted_page = NULL,
> 2eae077e6e46f90 Chao Yu                 2023-02-02  1232  		.in_list = 0,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1233  	};
> 0c3712423755e85 Jianan Huang            2026-02-09  1234  	int err = 0;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1235  
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1236) 	folio = f2fs_grab_cache_folio(mapping, index, true);
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1237) 	if (IS_ERR(folio))
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1238) 		return PTR_ERR(folio);
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1239  
> 04a91ab01684744 Christoph Hellwig       2022-11-28  1240  	if (f2fs_lookup_read_extent_cache_block(inode, index,
> 04a91ab01684744 Christoph Hellwig       2022-11-28  1241  						&dn.data_blkaddr)) {
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1242  		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1243  						DATA_GENERIC_ENHANCE_READ))) {
> 10f966bbf521bb9 Chao Yu                 2019-06-20  1244  			err = -EFSCORRUPTED;
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1245) 			goto put_folio;
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1246  		}
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1247  		goto got_it;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1248  	}
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1249  
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1250  	set_new_dnode(&dn, inode, NULL, NULL, 0);
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1251  	err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1252  	if (err)
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1253) 		goto put_folio;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1254  	f2fs_put_dnode(&dn);
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1255  
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1256  	if (!__is_valid_data_blkaddr(dn.data_blkaddr)) {
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1257  		err = -ENOENT;
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1258) 		goto put_folio;
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1259  	}
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1260  	if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1261  						DATA_GENERIC_ENHANCE))) {
> 10f966bbf521bb9 Chao Yu                 2019-06-20  1262  		err = -EFSCORRUPTED;
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1263) 		goto put_folio;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1264  	}
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1265  got_it:
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1266) 	/* read folio */
> d342b7adad71e5a Matthew Wilcox (Oracle  2025-07-08  1267) 	fio.folio = folio;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1268  	fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1269  
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1270  	/*
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1271  	 * don't cache encrypted data into meta inode until previous dirty
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1272  	 * data were writebacked to avoid racing between GC and flush.
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1273  	 */
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1274) 	f2fs_folio_wait_writeback(folio, DATA, true, true);
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1275  
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1276  	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1277  
> e0b89d00ea9f846 Chao Yu                 2025-10-14  1278  	efolio = f2fs_filemap_get_folio(META_MAPPING(sbi), dn.data_blkaddr,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1279  					FGP_LOCK | FGP_CREAT, GFP_NOFS);
> e0b89d00ea9f846 Chao Yu                 2025-10-14  1280  	if (IS_ERR(efolio)) {
> e0b89d00ea9f846 Chao Yu                 2025-10-14  1281  		err = PTR_ERR(efolio);
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1282) 		goto put_folio;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1283  	}
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1284  
> 0c3712423755e85 Jianan Huang            2026-02-09  1285  	if (folio_test_uptodate(efolio))
> 0c3712423755e85 Jianan Huang            2026-02-09 @1286  		goto put_encrypted_page;
> 
> Is this an error path?  It looks like it is...

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test

It's not an error case, but skips to submit bio.

> 
> 0c3712423755e85 Jianan Huang            2026-02-09  1287  
> e0b89d00ea9f846 Chao Yu                 2025-10-14  1288  	fio.encrypted_page = &efolio->page;
> e0b89d00ea9f846 Chao Yu                 2025-10-14  1289  
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1290  	err = f2fs_submit_page_bio(&fio);
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1291  	if (err)
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1292  		goto put_encrypted_page;
> 89c16629e3136f0 Yongpeng Yang           2025-10-27  1293  	f2fs_put_page(fio.encrypted_page, false);
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1294) 	f2fs_folio_put(folio, true);
> 8b83ac81f4283ae Chao Yu                 2020-04-16  1295  
> 34a23525601a16f Chao Yu                 2022-08-20  1296  	f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
> 34a23525601a16f Chao Yu                 2022-08-20  1297  	f2fs_update_iostat(sbi, NULL, FS_GDATA_READ_IO, F2FS_BLKSIZE);
> 8b83ac81f4283ae Chao Yu                 2020-04-16  1298  
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1299  	return 0;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1300  put_encrypted_page:
> 89c16629e3136f0 Yongpeng Yang           2025-10-27  1301  	f2fs_put_page(fio.encrypted_page, true);
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1302) put_folio:
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1303) 	f2fs_folio_put(folio, true);
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1304  	return err;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1305  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
