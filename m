Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F7919E994
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729606967; cv=none; b=oq2KoS2yaTnxlUfzdGrqtDhF1L4rUu0/ZihyqPqzOsBqxnfJhg+tIDojZw9mhrox3e+UZ+pr17i1odhJLHpIEebSIUyzwePBXbImQZ+N0OCfJq+FZsRQDWxkx3I8B9h6+iQhXMbbl0TyObSFfScz1bLC2f4zqgEvCWnZdBTt194=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729606967; c=relaxed/simple;
	bh=sfSMhmYFYbGPE7bVTalM42iq+fUbmneXPe8utQIfwhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bjzjWpJo774oXrYnOHW9Oj/zm4zqPIZXn53DUlCxANuLlGQJ1pAeT7hBGeVGEwS55qVJAAaV8aSPA5O7RNII33JPauX/fxZ2YTg/h97A57JOR9Okedm/FFpLM4BEZ9o1YS1JYz+AK0oT8rPjtYF92h7qyPSNbTUujH0nDgmfLM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHeYFbUV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHeYFbUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729606963; x=1761142963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sfSMhmYFYbGPE7bVTalM42iq+fUbmneXPe8utQIfwhA=;
  b=dHeYFbUVt2mEGWzzgXRLKFuDmCgNqByWXw+2HzpB5JepypR+dTSJdx+I
   EWr9AJCNAHM1ID6JWNwCb68pVnURkM0WMMNOJbl3ltMGC9ClK3rh51YiW
   zNIr7BNj5FuzdSUTBmGslXqhx+ubgOJjmbvC+apcEZQIZR3oxNdDuZF6X
   Fn+6Zr6nzleIhtWCMandfHWyD0XRsifKjwSywSygXPHvgCff63ZqOx8z7
   yFe2Ndvn5qk8Dy4LK8zjM9f6Q6rjvu2StnDIufNrd9CnNVCBjTphNj+nc
   EkFMY0eM5awo0+Z8Zqr5uQlt160N9dHHZ5klBHwkihlq6/Mp1gxixHwIV
   A==;
X-CSE-ConnectionGUID: 4V/plqapQnOwN9joPwfKJw==
X-CSE-MsgGUID: gH3t3z8FSJCKr2PYg3SjCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29303441"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29303441"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 07:22:43 -0700
X-CSE-ConnectionGUID: e5bvpZ0GS9mgLwkeflHbUQ==
X-CSE-MsgGUID: OzLvt+bhS9m3Mw+KZ/meQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79951127"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Oct 2024 07:22:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3FmR-000Tg2-0s;
	Tue, 22 Oct 2024 14:22:39 +0000
Date: Tue, 22 Oct 2024 22:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 4612/30000] fs/ntfs3/attrib.c:1660
 attr_allocate_frame() error: we previously assumed 'attr_b' could be null
 (see line 1573)
Message-ID: <202410222227.KBnc3TTD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   31421c83a2aaf8ecc1d8f377ea9e7e7a37cdb2bf
commit: c213d417e466b7a7d9e02939bb67fcf5d82a3f2f [4612/30000] fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile
:::::: branch date: 3 hours ago
:::::: commit date: 2 years, 9 months ago
config: x86_64-randconfig-161-20241012 (https://download.01.org/0day-ci/archive/20241022/202410222227.KBnc3TTD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410222227.KBnc3TTD-lkp@intel.com/

New smatch warnings:
fs/ntfs3/attrib.c:1660 attr_allocate_frame() error: we previously assumed 'attr_b' could be null (see line 1573)
fs/ntfs3/fslog.c:2197 last_log_lsn() warn: possible memory leak of 'page_bufs'

Old smatch warnings:
fs/ntfs3/fslog.c:2409 find_log_rec() error: we previously assumed 'rh' could be null (see line 2396)
fs/ntfs3/fslog.c:2535 find_client_next_lsn() warn: address of NULL pointer 'hdr'
fs/ntfs3/fslog.c:625 enum_rstbl() error: we previously assumed 't' could be null (see line 614)
fs/ntfs3/fslog.c:3146 do_action() warn: variable dereferenced before check 'mi' (see line 3107)
fs/ntfs3/fslog.c:4540 log_replay() warn: Function too hairy.  No more merges.

vim +/attr_b +1660 fs/ntfs3/attrib.c

6a00145b61696d Konstantin Komarov 2022-01-28  1443  
6a00145b61696d Konstantin Komarov 2022-01-28  1444  /*
a68089bd730ee3 Kari Argillander   2022-01-28  1445   * attr_allocate_frame - Allocate/free clusters for @frame.
6a00145b61696d Konstantin Komarov 2022-01-28  1446   *
a68089bd730ee3 Kari Argillander   2022-01-28  1447   * Assumed: down_write(&ni->file.run_lock);
6a00145b61696d Konstantin Komarov 2022-01-28  1448   */
6a00145b61696d Konstantin Komarov 2022-01-28  1449  int attr_allocate_frame(struct ntfs_inode *ni, CLST frame, size_t compr_size,
6a00145b61696d Konstantin Komarov 2022-01-28  1450  			u64 new_valid)
6a00145b61696d Konstantin Komarov 2022-01-28  1451  {
6a00145b61696d Konstantin Komarov 2022-01-28  1452  	int err = 0;
6a00145b61696d Konstantin Komarov 2022-01-28  1453  	struct runs_tree *run = &ni->file.run;
6a00145b61696d Konstantin Komarov 2022-01-28  1454  	struct ntfs_sb_info *sbi = ni->mi.sbi;
6a00145b61696d Konstantin Komarov 2022-01-28  1455  	struct ATTRIB *attr = NULL, *attr_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1456  	struct ATTR_LIST_ENTRY *le, *le_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1457  	struct mft_inode *mi, *mi_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1458  	CLST svcn, evcn1, next_svcn, lcn, len;
6a00145b61696d Konstantin Komarov 2022-01-28  1459  	CLST vcn, end, clst_data;
6a00145b61696d Konstantin Komarov 2022-01-28  1460  	u64 total_size, valid_size, data_size;
6a00145b61696d Konstantin Komarov 2022-01-28  1461  
6a00145b61696d Konstantin Komarov 2022-01-28  1462  	le_b = NULL;
6a00145b61696d Konstantin Komarov 2022-01-28  1463  	attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL, 0, NULL, &mi_b);
6a00145b61696d Konstantin Komarov 2022-01-28  1464  	if (!attr_b)
6a00145b61696d Konstantin Komarov 2022-01-28  1465  		return -ENOENT;
6a00145b61696d Konstantin Komarov 2022-01-28  1466  
6a00145b61696d Konstantin Komarov 2022-01-28  1467  	if (!is_attr_ext(attr_b))
6a00145b61696d Konstantin Komarov 2022-01-28  1468  		return -EINVAL;
6a00145b61696d Konstantin Komarov 2022-01-28  1469  
6a00145b61696d Konstantin Komarov 2022-01-28  1470  	vcn = frame << NTFS_LZNT_CUNIT;
6a00145b61696d Konstantin Komarov 2022-01-28  1471  	total_size = le64_to_cpu(attr_b->nres.total_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1472  
6a00145b61696d Konstantin Komarov 2022-01-28  1473  	svcn = le64_to_cpu(attr_b->nres.svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1474  	evcn1 = le64_to_cpu(attr_b->nres.evcn) + 1;
6a00145b61696d Konstantin Komarov 2022-01-28  1475  	data_size = le64_to_cpu(attr_b->nres.data_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1476  
6a00145b61696d Konstantin Komarov 2022-01-28  1477  	if (svcn <= vcn && vcn < evcn1) {
6a00145b61696d Konstantin Komarov 2022-01-28  1478  		attr = attr_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1479  		le = le_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1480  		mi = mi_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1481  	} else if (!le_b) {
6a00145b61696d Konstantin Komarov 2022-01-28  1482  		err = -EINVAL;
6a00145b61696d Konstantin Komarov 2022-01-28  1483  		goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1484  	} else {
6a00145b61696d Konstantin Komarov 2022-01-28  1485  		le = le_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1486  		attr = ni_find_attr(ni, attr_b, &le, ATTR_DATA, NULL, 0, &vcn,
6a00145b61696d Konstantin Komarov 2022-01-28  1487  				    &mi);
6a00145b61696d Konstantin Komarov 2022-01-28  1488  		if (!attr) {
6a00145b61696d Konstantin Komarov 2022-01-28  1489  			err = -EINVAL;
6a00145b61696d Konstantin Komarov 2022-01-28  1490  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1491  		}
6a00145b61696d Konstantin Komarov 2022-01-28  1492  		svcn = le64_to_cpu(attr->nres.svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1493  		evcn1 = le64_to_cpu(attr->nres.evcn) + 1;
6a00145b61696d Konstantin Komarov 2022-01-28  1494  	}
6a00145b61696d Konstantin Komarov 2022-01-28  1495  
6a00145b61696d Konstantin Komarov 2022-01-28  1496  	err = attr_load_runs(attr, ni, run, NULL);
6a00145b61696d Konstantin Komarov 2022-01-28  1497  	if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1498  		goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1499  
6a00145b61696d Konstantin Komarov 2022-01-28  1500  	err = attr_is_frame_compressed(ni, attr_b, frame, &clst_data);
6a00145b61696d Konstantin Komarov 2022-01-28  1501  	if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1502  		goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1503  
6a00145b61696d Konstantin Komarov 2022-01-28  1504  	total_size -= (u64)clst_data << sbi->cluster_bits;
6a00145b61696d Konstantin Komarov 2022-01-28  1505  
6a00145b61696d Konstantin Komarov 2022-01-28  1506  	len = bytes_to_cluster(sbi, compr_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1507  
6a00145b61696d Konstantin Komarov 2022-01-28  1508  	if (len == clst_data)
6a00145b61696d Konstantin Komarov 2022-01-28  1509  		goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1510  
6a00145b61696d Konstantin Komarov 2022-01-28  1511  	if (len < clst_data) {
6a00145b61696d Konstantin Komarov 2022-01-28  1512  		err = run_deallocate_ex(sbi, run, vcn + len, clst_data - len,
6a00145b61696d Konstantin Komarov 2022-01-28  1513  					NULL, true);
6a00145b61696d Konstantin Komarov 2022-01-28  1514  		if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1515  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1516  
6a00145b61696d Konstantin Komarov 2022-01-28  1517  		if (!run_add_entry(run, vcn + len, SPARSE_LCN, clst_data - len,
6a00145b61696d Konstantin Komarov 2022-01-28  1518  				   false)) {
6a00145b61696d Konstantin Komarov 2022-01-28  1519  			err = -ENOMEM;
6a00145b61696d Konstantin Komarov 2022-01-28  1520  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1521  		}
6a00145b61696d Konstantin Komarov 2022-01-28  1522  		end = vcn + clst_data;
a68089bd730ee3 Kari Argillander   2022-01-28  1523  		/* Run contains updated range [vcn + len : end). */
6a00145b61696d Konstantin Komarov 2022-01-28  1524  	} else {
6a00145b61696d Konstantin Komarov 2022-01-28  1525  		CLST alen, hint = 0;
a68089bd730ee3 Kari Argillander   2022-01-28  1526  		/* Get the last LCN to allocate from. */
6a00145b61696d Konstantin Komarov 2022-01-28  1527  		if (vcn + clst_data &&
6a00145b61696d Konstantin Komarov 2022-01-28  1528  		    !run_lookup_entry(run, vcn + clst_data - 1, &hint, NULL,
6a00145b61696d Konstantin Komarov 2022-01-28  1529  				      NULL)) {
6a00145b61696d Konstantin Komarov 2022-01-28  1530  			hint = -1;
6a00145b61696d Konstantin Komarov 2022-01-28  1531  		}
6a00145b61696d Konstantin Komarov 2022-01-28  1532  
6a00145b61696d Konstantin Komarov 2022-01-28  1533  		err = attr_allocate_clusters(sbi, run, vcn + clst_data,
6a00145b61696d Konstantin Komarov 2022-01-28  1534  					     hint + 1, len - clst_data, NULL, 0,
6a00145b61696d Konstantin Komarov 2022-01-28  1535  					     &alen, 0, &lcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1536  		if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1537  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1538  
6a00145b61696d Konstantin Komarov 2022-01-28  1539  		end = vcn + len;
a68089bd730ee3 Kari Argillander   2022-01-28  1540  		/* Run contains updated range [vcn + clst_data : end). */
6a00145b61696d Konstantin Komarov 2022-01-28  1541  	}
6a00145b61696d Konstantin Komarov 2022-01-28  1542  
6a00145b61696d Konstantin Komarov 2022-01-28  1543  	total_size += (u64)len << sbi->cluster_bits;
6a00145b61696d Konstantin Komarov 2022-01-28  1544  
6a00145b61696d Konstantin Komarov 2022-01-28  1545  repack:
6a00145b61696d Konstantin Komarov 2022-01-28  1546  	err = mi_pack_runs(mi, attr, run, max(end, evcn1) - svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1547  	if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1548  		goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1549  
6a00145b61696d Konstantin Komarov 2022-01-28  1550  	attr_b->nres.total_size = cpu_to_le64(total_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1551  	inode_set_bytes(&ni->vfs_inode, total_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1552  
6a00145b61696d Konstantin Komarov 2022-01-28  1553  	mi_b->dirty = true;
6a00145b61696d Konstantin Komarov 2022-01-28  1554  	mark_inode_dirty(&ni->vfs_inode);
6a00145b61696d Konstantin Komarov 2022-01-28  1555  
a68089bd730ee3 Kari Argillander   2022-01-28  1556  	/* Stored [vcn : next_svcn) from [vcn : end). */
6a00145b61696d Konstantin Komarov 2022-01-28  1557  	next_svcn = le64_to_cpu(attr->nres.evcn) + 1;
6a00145b61696d Konstantin Komarov 2022-01-28  1558  
6a00145b61696d Konstantin Komarov 2022-01-28  1559  	if (end <= evcn1) {
6a00145b61696d Konstantin Komarov 2022-01-28  1560  		if (next_svcn == evcn1) {
a68089bd730ee3 Kari Argillander   2022-01-28  1561  			/* Normal way. Update attribute and exit. */
6a00145b61696d Konstantin Komarov 2022-01-28  1562  			goto ok;
6a00145b61696d Konstantin Komarov 2022-01-28  1563  		}
a68089bd730ee3 Kari Argillander   2022-01-28  1564  		/* Add new segment [next_svcn : evcn1 - next_svcn). */
6a00145b61696d Konstantin Komarov 2022-01-28  1565  		if (!ni->attr_list.size) {
6a00145b61696d Konstantin Komarov 2022-01-28  1566  			err = ni_create_attr_list(ni);
6a00145b61696d Konstantin Komarov 2022-01-28  1567  			if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1568  				goto out;
a68089bd730ee3 Kari Argillander   2022-01-28  1569  			/* Layout of records is changed. */
6a00145b61696d Konstantin Komarov 2022-01-28  1570  			le_b = NULL;
6a00145b61696d Konstantin Komarov 2022-01-28  1571  			attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL,
6a00145b61696d Konstantin Komarov 2022-01-28  1572  					      0, NULL, &mi_b);
6a00145b61696d Konstantin Komarov 2022-01-28 @1573  			if (!attr_b) {
6a00145b61696d Konstantin Komarov 2022-01-28  1574  				err = -ENOENT;
6a00145b61696d Konstantin Komarov 2022-01-28  1575  				goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1576  			}
6a00145b61696d Konstantin Komarov 2022-01-28  1577  
6a00145b61696d Konstantin Komarov 2022-01-28  1578  			attr = attr_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1579  			le = le_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1580  			mi = mi_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1581  			goto repack;
6a00145b61696d Konstantin Komarov 2022-01-28  1582  		}
6a00145b61696d Konstantin Komarov 2022-01-28  1583  	}
6a00145b61696d Konstantin Komarov 2022-01-28  1584  
6a00145b61696d Konstantin Komarov 2022-01-28  1585  	svcn = evcn1;
6a00145b61696d Konstantin Komarov 2022-01-28  1586  
a68089bd730ee3 Kari Argillander   2022-01-28  1587  	/* Estimate next attribute. */
6a00145b61696d Konstantin Komarov 2022-01-28  1588  	attr = ni_find_attr(ni, attr, &le, ATTR_DATA, NULL, 0, &svcn, &mi);
6a00145b61696d Konstantin Komarov 2022-01-28  1589  
6a00145b61696d Konstantin Komarov 2022-01-28  1590  	if (attr) {
6a00145b61696d Konstantin Komarov 2022-01-28  1591  		CLST alloc = bytes_to_cluster(
6a00145b61696d Konstantin Komarov 2022-01-28  1592  			sbi, le64_to_cpu(attr_b->nres.alloc_size));
6a00145b61696d Konstantin Komarov 2022-01-28  1593  		CLST evcn = le64_to_cpu(attr->nres.evcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1594  
6a00145b61696d Konstantin Komarov 2022-01-28  1595  		if (end < next_svcn)
6a00145b61696d Konstantin Komarov 2022-01-28  1596  			end = next_svcn;
6a00145b61696d Konstantin Komarov 2022-01-28  1597  		while (end > evcn) {
a68089bd730ee3 Kari Argillander   2022-01-28  1598  			/* Remove segment [svcn : evcn). */
cde96c417f3996 Konstantin Komarov 2022-01-28  1599  			mi_remove_attr(NULL, mi, attr);
6a00145b61696d Konstantin Komarov 2022-01-28  1600  
6a00145b61696d Konstantin Komarov 2022-01-28  1601  			if (!al_remove_le(ni, le)) {
6a00145b61696d Konstantin Komarov 2022-01-28  1602  				err = -EINVAL;
6a00145b61696d Konstantin Komarov 2022-01-28  1603  				goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1604  			}
6a00145b61696d Konstantin Komarov 2022-01-28  1605  
6a00145b61696d Konstantin Komarov 2022-01-28  1606  			if (evcn + 1 >= alloc) {
a68089bd730ee3 Kari Argillander   2022-01-28  1607  				/* Last attribute segment. */
6a00145b61696d Konstantin Komarov 2022-01-28  1608  				evcn1 = evcn + 1;
6a00145b61696d Konstantin Komarov 2022-01-28  1609  				goto ins_ext;
6a00145b61696d Konstantin Komarov 2022-01-28  1610  			}
6a00145b61696d Konstantin Komarov 2022-01-28  1611  
6a00145b61696d Konstantin Komarov 2022-01-28  1612  			if (ni_load_mi(ni, le, &mi)) {
6a00145b61696d Konstantin Komarov 2022-01-28  1613  				attr = NULL;
6a00145b61696d Konstantin Komarov 2022-01-28  1614  				goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1615  			}
6a00145b61696d Konstantin Komarov 2022-01-28  1616  
6a00145b61696d Konstantin Komarov 2022-01-28  1617  			attr = mi_find_attr(mi, NULL, ATTR_DATA, NULL, 0,
6a00145b61696d Konstantin Komarov 2022-01-28  1618  					    &le->id);
6a00145b61696d Konstantin Komarov 2022-01-28  1619  			if (!attr) {
6a00145b61696d Konstantin Komarov 2022-01-28  1620  				err = -EINVAL;
6a00145b61696d Konstantin Komarov 2022-01-28  1621  				goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1622  			}
6a00145b61696d Konstantin Komarov 2022-01-28  1623  			svcn = le64_to_cpu(attr->nres.svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1624  			evcn = le64_to_cpu(attr->nres.evcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1625  		}
6a00145b61696d Konstantin Komarov 2022-01-28  1626  
6a00145b61696d Konstantin Komarov 2022-01-28  1627  		if (end < svcn)
6a00145b61696d Konstantin Komarov 2022-01-28  1628  			end = svcn;
6a00145b61696d Konstantin Komarov 2022-01-28  1629  
6a00145b61696d Konstantin Komarov 2022-01-28  1630  		err = attr_load_runs(attr, ni, run, &end);
6a00145b61696d Konstantin Komarov 2022-01-28  1631  		if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1632  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1633  
6a00145b61696d Konstantin Komarov 2022-01-28  1634  		evcn1 = evcn + 1;
6a00145b61696d Konstantin Komarov 2022-01-28  1635  		attr->nres.svcn = cpu_to_le64(next_svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1636  		err = mi_pack_runs(mi, attr, run, evcn1 - next_svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1637  		if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1638  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1639  
6a00145b61696d Konstantin Komarov 2022-01-28  1640  		le->vcn = cpu_to_le64(next_svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1641  		ni->attr_list.dirty = true;
6a00145b61696d Konstantin Komarov 2022-01-28  1642  		mi->dirty = true;
6a00145b61696d Konstantin Komarov 2022-01-28  1643  
6a00145b61696d Konstantin Komarov 2022-01-28  1644  		next_svcn = le64_to_cpu(attr->nres.evcn) + 1;
6a00145b61696d Konstantin Komarov 2022-01-28  1645  	}
6a00145b61696d Konstantin Komarov 2022-01-28  1646  ins_ext:
6a00145b61696d Konstantin Komarov 2022-01-28  1647  	if (evcn1 > next_svcn) {
6a00145b61696d Konstantin Komarov 2022-01-28  1648  		err = ni_insert_nonresident(ni, ATTR_DATA, NULL, 0, run,
6a00145b61696d Konstantin Komarov 2022-01-28  1649  					    next_svcn, evcn1 - next_svcn,
6a00145b61696d Konstantin Komarov 2022-01-28  1650  					    attr_b->flags, &attr, &mi);
6a00145b61696d Konstantin Komarov 2022-01-28  1651  		if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1652  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1653  	}
6a00145b61696d Konstantin Komarov 2022-01-28  1654  ok:
6a00145b61696d Konstantin Komarov 2022-01-28  1655  	run_truncate_around(run, vcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1656  out:
6a00145b61696d Konstantin Komarov 2022-01-28  1657  	if (new_valid > data_size)
6a00145b61696d Konstantin Komarov 2022-01-28  1658  		new_valid = data_size;
6a00145b61696d Konstantin Komarov 2022-01-28  1659  
6a00145b61696d Konstantin Komarov 2022-01-28 @1660  	valid_size = le64_to_cpu(attr_b->nres.valid_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1661  	if (new_valid != valid_size) {
6a00145b61696d Konstantin Komarov 2022-01-28  1662  		attr_b->nres.valid_size = cpu_to_le64(valid_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1663  		mi_b->dirty = true;
6a00145b61696d Konstantin Komarov 2022-01-28  1664  	}
6a00145b61696d Konstantin Komarov 2022-01-28  1665  
6a00145b61696d Konstantin Komarov 2022-01-28  1666  	return err;
6a00145b61696d Konstantin Komarov 2022-01-28  1667  }
6a00145b61696d Konstantin Komarov 2022-01-28  1668  

:::::: The code at line 1660 was first introduced by commit
:::::: 6a00145b61696d455360ecca33ad9eaae08be33f fs/ntfs3: Add attrib operations

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
