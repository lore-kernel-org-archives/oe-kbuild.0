Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4063DEAC5
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Apr 2026 23:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776210682; cv=none; b=V4FFtM0nlUKVGaJ1K/U10sn+evXysv7vAc+x5eQabfo91zXF1ZpVl/5zxDbOnaOb/u9vv3MW6tMENd9Buvcq1lET1BEMmUpKx/GaJ2G2X37b/XeVXKFyhOmXDFHW9U7mDq82ffgGBHuPONI8dE/tEOUw1xq8p/K2FRqdTsQCbMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776210682; c=relaxed/simple;
	bh=9QArE1RNc+KtrspkNXNplDBInrQqWpxf6P9m7YVizhQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bitU4qVKPeMPwGA20wmdgaiPcBfpSuGgRbnloa1pqyoyhtePzNTWxcHT4eCEINfVXiLHbE9zE1sE1xZsx8iiCAQu2eUtzHdGr7Sc8Vgto8x6Ttm5kY8ElB6lPhoubhuIrB4KYaqTiRLlcD1Cd3Ejvqbx28SyC0gDMR4suS6p3kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YT76h0Im; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YT76h0Im"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776210680; x=1807746680;
  h=date:from:to:cc:subject:message-id;
  bh=9QArE1RNc+KtrspkNXNplDBInrQqWpxf6P9m7YVizhQ=;
  b=YT76h0ImPp0TtJHERAQHRR2EendJJZtIF0TgHgHyaI0ERdZPXzBGJxn5
   w8+UgS/FjaW95GzqXpyZI4gSXrB5Dv6jPtGxe3pnFeb/TWG9Kvq+4oXFG
   eZD5BBRY9YZCf8f6Ve15GldamAEFVoz++IB5YGaOpzVJ925AGjcno9LBj
   MdXWZiKZ8Z+/+1v/jGt4DbkPIxqrXi9wlM3VzAUZ92qdXX1IZI9SZklod
   G0dgnoAZKkdXBR7hOMHwk/Z+7bveROtlrnpGr487btI2abhxiU66M/9DV
   r43oxJ2Up3zybpBaZjpaBlebWjkMJkS/8cLVcbNGG1WRd2Ofz6sHFQlpv
   w==;
X-CSE-ConnectionGUID: l6aC4kJ9QP2bKHlfqXKBBQ==
X-CSE-MsgGUID: Qyb0ul6DRde7idEXfZEzcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88561817"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88561817"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 16:51:18 -0700
X-CSE-ConnectionGUID: UknfidE2S62K8+QC3hnVUw==
X-CSE-MsgGUID: 0N/2WQtWSUatoXlaOS4OhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227593912"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Apr 2026 16:51:16 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCnXG-000000001xh-2Du3;
	Tue, 14 Apr 2026 23:51:14 +0000
Date: Wed, 15 Apr 2026 07:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ceph/addr.c:1489 ceph_submit_write() error: 'req'
 dereferencing possible ERR_PTR()
Message-ID: <202604150703.7Xdq4XpE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   508fed6795411f5ab277fd1edc0d7adca4946f23
commit: 1551ec61dc551dab1bb40c516a5a096607aff774 ceph: introduce ceph_submit_write() method
date:   1 year, 2 months ago
:::::: branch date: 72 minutes ago
:::::: commit date: 1 year, 2 months ago
config: powerpc64-randconfig-r073-20260415 (https://download.01.org/0day-ci/archive/20260415/202604150703.7Xdq4XpE-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1551ec61dc55 ("ceph: introduce ceph_submit_write() method")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604150703.7Xdq4XpE-lkp@intel.com/

smatch warnings:
fs/ceph/addr.c:1489 ceph_submit_write() error: 'req' dereferencing possible ERR_PTR()

vim +/req +1489 fs/ceph/addr.c

1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1417  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1418  static
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1419  int ceph_submit_write(struct address_space *mapping,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1420  			struct writeback_control *wbc,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1421  			struct ceph_writeback_ctl *ceph_wbc)
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1422  {
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1423  	struct inode *inode = mapping->host;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1424  	struct ceph_inode_info *ci = ceph_inode(inode);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1425  	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1426  	struct ceph_client *cl = fsc->client;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1427  	struct ceph_vino vino = ceph_vino(inode);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1428  	struct ceph_osd_request *req = NULL;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1429  	struct page *page = NULL;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1430  	bool caching = ceph_is_cache_enabled(inode);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1431  	u64 offset;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1432  	u64 len;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1433  	unsigned i;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1434  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1435  new_request:
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1436  	offset = ceph_fscrypt_page_offset(ceph_wbc->pages[0]);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1437  	len = ceph_wbc->wsize;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1438  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1439  	req = ceph_osdc_new_request(&fsc->client->osdc,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1440  				    &ci->i_layout, vino,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1441  				    offset, &len, 0, ceph_wbc->num_ops,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1442  				    CEPH_OSD_OP_WRITE, CEPH_OSD_FLAG_WRITE,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1443  				    ceph_wbc->snapc, ceph_wbc->truncate_seq,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1444  				    ceph_wbc->truncate_size, false);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1445  	if (IS_ERR(req)) {
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1446  		req = ceph_osdc_new_request(&fsc->client->osdc,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1447  					    &ci->i_layout, vino,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1448  					    offset, &len, 0,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1449  					    min(ceph_wbc->num_ops,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1450  						CEPH_OSD_SLAB_OPS),
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1451  					    CEPH_OSD_OP_WRITE,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1452  					    CEPH_OSD_FLAG_WRITE,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1453  					    ceph_wbc->snapc,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1454  					    ceph_wbc->truncate_seq,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1455  					    ceph_wbc->truncate_size,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1456  					    true);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1457  		BUG_ON(IS_ERR(req));
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1458  	}
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1459  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1460  	page = ceph_wbc->pages[ceph_wbc->locked_pages - 1];
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1461  	BUG_ON(len < ceph_fscrypt_page_offset(page) + thp_size(page) - offset);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1462  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1463  	if (!ceph_inc_osd_stopping_blocker(fsc->mdsc)) {
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1464  		for (i = 0; i < folio_batch_count(&ceph_wbc->fbatch); i++) {
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1465  			struct folio *folio = ceph_wbc->fbatch.folios[i];
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1466  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1467  			if (!folio)
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1468  				continue;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1469  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1470  			page = &folio->page;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1471  			redirty_page_for_writepage(wbc, page);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1472  			unlock_page(page);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1473  		}
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1474  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1475  		for (i = 0; i < ceph_wbc->locked_pages; i++) {
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1476  			page = ceph_fscrypt_pagecache_page(ceph_wbc->pages[i]);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1477  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1478  			if (!page)
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1479  				continue;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1480  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1481  			redirty_page_for_writepage(wbc, page);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1482  			unlock_page(page);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1483  		}
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1484  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1485  		ceph_osdc_put_request(req);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1486  		return -EIO;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1487  	}
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1488  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04 @1489  	req->r_callback = writepages_finish;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1490  	req->r_inode = inode;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1491  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1492  	/* Format the osd request message and submit the write */
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1493  	len = 0;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1494  	ceph_wbc->data_pages = ceph_wbc->pages;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1495  	ceph_wbc->op_idx = 0;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1496  	for (i = 0; i < ceph_wbc->locked_pages; i++) {
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1497  		u64 cur_offset;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1498  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1499  		page = ceph_fscrypt_pagecache_page(ceph_wbc->pages[i]);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1500  		cur_offset = page_offset(page);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1501  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1502  		/*
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1503  		 * Discontinuity in page range? Ceph can handle that by just passing
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1504  		 * multiple extents in the write op.
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1505  		 */
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1506  		if (offset + len != cur_offset) {
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1507  			/* If it's full, stop here */
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1508  			if (ceph_wbc->op_idx + 1 == req->r_num_ops)
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1509  				break;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1510  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1511  			/* Kick off an fscache write with what we have so far. */
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1512  			ceph_fscache_write_to_cache(inode, offset, len, caching);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1513  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1514  			/* Start a new extent */
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1515  			osd_req_op_extent_dup_last(req, ceph_wbc->op_idx,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1516  						   cur_offset - offset);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1517  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1518  			doutc(cl, "got pages at %llu~%llu\n", offset, len);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1519  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1520  			osd_req_op_extent_osd_data_pages(req, ceph_wbc->op_idx,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1521  							 ceph_wbc->data_pages,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1522  							 len, 0,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1523  							 ceph_wbc->from_pool,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1524  							 false);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1525  			osd_req_op_extent_update(req, ceph_wbc->op_idx, len);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1526  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1527  			len = 0;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1528  			offset = cur_offset;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1529  			ceph_wbc->data_pages = ceph_wbc->pages + i;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1530  			ceph_wbc->op_idx++;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1531  		}
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1532  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1533  		set_page_writeback(page);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1534  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1535  		if (caching)
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1536  			ceph_set_page_fscache(page);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1537  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1538  		len += thp_size(page);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1539  	}
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1540  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1541  	ceph_fscache_write_to_cache(inode, offset, len, caching);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1542  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1543  	if (ceph_wbc->size_stable) {
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1544  		len = min(len, ceph_wbc->i_size - offset);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1545  	} else if (i == ceph_wbc->locked_pages) {
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1546  		/* writepages_finish() clears writeback pages
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1547  		 * according to the data length, so make sure
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1548  		 * data length covers all locked pages */
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1549  		u64 min_len = len + 1 - thp_size(page);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1550  		len = get_writepages_data_length(inode,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1551  						 ceph_wbc->pages[i - 1],
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1552  						 offset);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1553  		len = max(len, min_len);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1554  	}
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1555  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1556  	if (IS_ENCRYPTED(inode))
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1557  		len = round_up(len, CEPH_FSCRYPT_BLOCK_SIZE);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1558  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1559  	doutc(cl, "got pages at %llu~%llu\n", offset, len);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1560  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1561  	if (IS_ENCRYPTED(inode) &&
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1562  	    ((offset | len) & ~CEPH_FSCRYPT_BLOCK_MASK)) {
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1563  		pr_warn_client(cl,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1564  			"bad encrypted write offset=%lld len=%llu\n",
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1565  			offset, len);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1566  	}
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1567  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1568  	osd_req_op_extent_osd_data_pages(req, ceph_wbc->op_idx,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1569  					 ceph_wbc->data_pages, len,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1570  					 0, ceph_wbc->from_pool, false);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1571  	osd_req_op_extent_update(req, ceph_wbc->op_idx, len);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1572  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1573  	BUG_ON(ceph_wbc->op_idx + 1 != req->r_num_ops);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1574  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1575  	ceph_wbc->from_pool = false;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1576  	if (i < ceph_wbc->locked_pages) {
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1577  		BUG_ON(ceph_wbc->num_ops <= req->r_num_ops);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1578  		ceph_wbc->num_ops -= req->r_num_ops;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1579  		ceph_wbc->locked_pages -= i;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1580  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1581  		/* allocate new pages array for next request */
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1582  		ceph_wbc->data_pages = ceph_wbc->pages;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1583  		__ceph_allocate_page_array(ceph_wbc, ceph_wbc->locked_pages);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1584  		memcpy(ceph_wbc->pages, ceph_wbc->data_pages + i,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1585  			ceph_wbc->locked_pages * sizeof(*ceph_wbc->pages));
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1586  		memset(ceph_wbc->data_pages + i, 0,
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1587  			ceph_wbc->locked_pages * sizeof(*ceph_wbc->pages));
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1588  	} else {
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1589  		BUG_ON(ceph_wbc->num_ops != req->r_num_ops);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1590  		/* request message now owns the pages array */
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1591  		ceph_wbc->pages = NULL;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1592  	}
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1593  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1594  	req->r_mtime = inode_get_mtime(inode);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1595  	ceph_osdc_start_request(&fsc->client->osdc, req);
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1596  	req = NULL;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1597  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1598  	wbc->nr_to_write -= i;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1599  	if (ceph_wbc->pages)
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1600  		goto new_request;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1601  
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1602  	return 0;
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1603  }
1551ec61dc551da Viacheslav Dubeyko 2025-02-04  1604  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
