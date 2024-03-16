Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2B418026
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Mar 2024 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710582840; cv=none; b=o4XZZOXvDkwKtd6PlqR/XEMcs7fgnnqene5WfUzE3gC5mVfQscs9r+bDbyzfHS1clEc07A8jD5XSN8gt01NFDPGsV0RJBHtEnut587SbkQKZTEff1KXknIBsqHlsL1mhI1dwUi5Da4eQj938sJBb4ByaPB/m9gailLBJBGLbZ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710582840; c=relaxed/simple;
	bh=Y3hnNsCxctCjWdzTGkN7ZJslrLAkPlUyPyKcNFuPSZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z42yh3FLmtPxR7PifbZarmzTseNqc86X3cMsOy6wyURc3z6sPxNyenBSluiCT9cNUWeiLDqS+SnLxwehZg5IaPsUKvMF0Iy4qba63Ky0OxguXMNx286ELTNZpdpu0fW9KikvWz/CEuw/LbcdWLMK9T5arSe27rxydXTJsGjQ3Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Po5uFOQB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Po5uFOQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710582838; x=1742118838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3hnNsCxctCjWdzTGkN7ZJslrLAkPlUyPyKcNFuPSZ8=;
  b=Po5uFOQBWUo4Yx+YpaRHk5XIAxUF4fSQD0XQdniVOWefnTKY0zqeDfna
   3G5rGNDB0oQXfiNyzN1v7N0NLxPvKtjvPjCF5Mr6dJdnp37SDjNIkw2Bw
   s6I/0DjjyszUwbfuEUXIsXFuHpBST7WoiObzvs3+GrizytOIyZssGB+lT
   ekVRLbFpq72D0wdNgLeDYV/e1cd9xTlgjWCeMppkQ8U/nqP5ugZWW1Bx3
   WFSze96QArM0fdNHbYJsZoRVZYypkrt8q2uNoa8Aws/HB49ynRC+mmSb8
   be/byLzs9Z3VFTvOwClIJF1YCLlsHAVMdaK8E53Omd4j1PvfWBUIAAT6N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5645264"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5645264"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 02:53:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="12869135"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Mar 2024 02:53:42 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlQjT-000FIL-2t;
	Sat, 16 Mar 2024 09:53:39 +0000
Date: Sat, 16 Mar 2024 17:52:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ti:linux-5.4.y 45/51] drivers/base/regmap/regmap.c:1651
 _regmap_raw_write_impl() error: we previously assumed 'map->bus' could be
 null (see line 1579)
Message-ID: <202403161740.5X9KxDh9-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git linux-5.4.y
head:   84075826304f1a297838de6bcfd9bd84f566026e
commit: b96b017919116c3ce95b5c2a55136ae034c7d37c [45/51] regmap: Add bulk read/write callbacks into regmap_config
:::::: branch date: 15 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20240316 (https://download.01.org/0day-ci/archive/20240316/202403161740.5X9KxDh9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403161740.5X9KxDh9-lkp@intel.com/

New smatch warnings:
drivers/base/regmap/regmap.c:1651 _regmap_raw_write_impl() error: we previously assumed 'map->bus' could be null (see line 1579)

Old smatch warnings:
drivers/base/regmap/regmap.c:1898 _regmap_raw_write() error: uninitialized symbol 'ret'.
drivers/base/regmap/regmap.c:2670 regmap_raw_read() error: uninitialized symbol 'ret'.

vim +1651 drivers/base/regmap/regmap.c

f50e38c9966076 Tony Lindgren       2016-09-15  1485  
7ef2c6b8689a08 Charles Keepax      2018-02-22  1486  static int _regmap_raw_write_impl(struct regmap *map, unsigned int reg,
283a3234550c34 Dmitry Baryshkov    2020-09-17  1487  				  const void *val, size_t val_len, bool noinc)
b83a313bf25201 Mark Brown          2011-05-11  1488  {
98bc7dfd76407e Mark Brown          2012-10-04  1489  	struct regmap_range_node *range;
0d509f2b112b21 Mark Brown          2013-01-27  1490  	unsigned long flags;
0d509f2b112b21 Mark Brown          2013-01-27  1491  	void *work_val = map->work_buf + map->format.reg_bytes +
0d509f2b112b21 Mark Brown          2013-01-27  1492  		map->format.pad_bytes;
b83a313bf25201 Mark Brown          2011-05-11  1493  	void *buf;
b83a313bf25201 Mark Brown          2011-05-11  1494  	int ret = -ENOTSUPP;
b83a313bf25201 Mark Brown          2011-05-11  1495  	size_t len;
73304781274200 Mark Brown          2011-07-24  1496  	int i;
73304781274200 Mark Brown          2011-07-24  1497  
3b9586e82c90d3 Ben Whitten         2020-01-18  1498  	/* Check for unwritable or noinc registers in range
3b9586e82c90d3 Ben Whitten         2020-01-18  1499  	 * before we start
3b9586e82c90d3 Ben Whitten         2020-01-18  1500  	 */
3b9586e82c90d3 Ben Whitten         2020-01-18  1501  	if (!regmap_writeable_noinc(map, reg)) {
3b9586e82c90d3 Ben Whitten         2020-01-18  1502  		for (i = 0; i < val_len / map->format.val_bytes; i++) {
3b9586e82c90d3 Ben Whitten         2020-01-18  1503  			unsigned int element =
3b9586e82c90d3 Ben Whitten         2020-01-18  1504  				reg + regmap_get_offset(map, i);
3b9586e82c90d3 Ben Whitten         2020-01-18  1505  			if (!regmap_writeable(map, element) ||
3b9586e82c90d3 Ben Whitten         2020-01-18  1506  				regmap_writeable_noinc(map, element))
73304781274200 Mark Brown          2011-07-24  1507  				return -EINVAL;
3b9586e82c90d3 Ben Whitten         2020-01-18  1508  		}
3b9586e82c90d3 Ben Whitten         2020-01-18  1509  	}
b83a313bf25201 Mark Brown          2011-05-11  1510  
c9157198417076 Laxman Dewangan     2012-02-10  1511  	if (!map->cache_bypass && map->format.parse_val) {
c4d5179e42b456 Ben Wolsieffer      2023-11-01  1512  		unsigned int ival, offset;
c9157198417076 Laxman Dewangan     2012-02-10  1513  		int val_bytes = map->format.val_bytes;
c4d5179e42b456 Ben Wolsieffer      2023-11-01  1514  
c4d5179e42b456 Ben Wolsieffer      2023-11-01  1515  		/* Cache the last written value for noinc writes */
c4d5179e42b456 Ben Wolsieffer      2023-11-01  1516  		i = noinc ? val_len - val_bytes : 0;
c4d5179e42b456 Ben Wolsieffer      2023-11-01  1517  		for (; i < val_len; i += val_bytes) {
c4d5179e42b456 Ben Wolsieffer      2023-11-01  1518  			ival = map->format.parse_val(val + i);
c4d5179e42b456 Ben Wolsieffer      2023-11-01  1519  			offset = noinc ? 0 : regmap_get_offset(map, i / val_bytes);
c4d5179e42b456 Ben Wolsieffer      2023-11-01  1520  			ret = regcache_write(map, reg + offset, ival);
c9157198417076 Laxman Dewangan     2012-02-10  1521  			if (ret) {
c9157198417076 Laxman Dewangan     2012-02-10  1522  				dev_err(map->dev,
6d04b8ac575c38 Mark Brown          2012-10-26  1523  					"Error in caching of register: %x ret: %d\n",
c4d5179e42b456 Ben Wolsieffer      2023-11-01  1524  					reg + offset, ret);
c9157198417076 Laxman Dewangan     2012-02-10  1525  				return ret;
c9157198417076 Laxman Dewangan     2012-02-10  1526  			}
c9157198417076 Laxman Dewangan     2012-02-10  1527  		}
c9157198417076 Laxman Dewangan     2012-02-10  1528  		if (map->cache_only) {
c9157198417076 Laxman Dewangan     2012-02-10  1529  			map->cache_dirty = true;
c9157198417076 Laxman Dewangan     2012-02-10  1530  			return 0;
c9157198417076 Laxman Dewangan     2012-02-10  1531  		}
c9157198417076 Laxman Dewangan     2012-02-10  1532  	}
c9157198417076 Laxman Dewangan     2012-02-10  1533  
98bc7dfd76407e Mark Brown          2012-10-04  1534  	range = _regmap_range_lookup(map, reg);
98bc7dfd76407e Mark Brown          2012-10-04  1535  	if (range) {
8a2ceac6617a67 Mark Brown          2012-10-04  1536  		int val_num = val_len / map->format.val_bytes;
8a2ceac6617a67 Mark Brown          2012-10-04  1537  		int win_offset = (reg - range->range_min) % range->window_len;
8a2ceac6617a67 Mark Brown          2012-10-04  1538  		int win_residue = range->window_len - win_offset;
8a2ceac6617a67 Mark Brown          2012-10-04  1539  
8a2ceac6617a67 Mark Brown          2012-10-04  1540  		/* If the write goes beyond the end of the window split it */
8a2ceac6617a67 Mark Brown          2012-10-04  1541  		while (val_num > win_residue) {
1a61cfe3445218 Fabio Estevam       2012-10-25  1542  			dev_dbg(map->dev, "Writing window %d/%zu\n",
8a2ceac6617a67 Mark Brown          2012-10-04  1543  				win_residue, val_len / map->format.val_bytes);
7ef2c6b8689a08 Charles Keepax      2018-02-22  1544  			ret = _regmap_raw_write_impl(map, reg, val,
7ef2c6b8689a08 Charles Keepax      2018-02-22  1545  						     win_residue *
283a3234550c34 Dmitry Baryshkov    2020-09-17  1546  						     map->format.val_bytes, noinc);
8a2ceac6617a67 Mark Brown          2012-10-04  1547  			if (ret != 0)
8a2ceac6617a67 Mark Brown          2012-10-04  1548  				return ret;
8a2ceac6617a67 Mark Brown          2012-10-04  1549  
8a2ceac6617a67 Mark Brown          2012-10-04  1550  			reg += win_residue;
8a2ceac6617a67 Mark Brown          2012-10-04  1551  			val_num -= win_residue;
8a2ceac6617a67 Mark Brown          2012-10-04  1552  			val += win_residue * map->format.val_bytes;
8a2ceac6617a67 Mark Brown          2012-10-04  1553  			val_len -= win_residue * map->format.val_bytes;
8a2ceac6617a67 Mark Brown          2012-10-04  1554  
8a2ceac6617a67 Mark Brown          2012-10-04  1555  			win_offset = (reg - range->range_min) %
8a2ceac6617a67 Mark Brown          2012-10-04  1556  				range->window_len;
8a2ceac6617a67 Mark Brown          2012-10-04  1557  			win_residue = range->window_len - win_offset;
8a2ceac6617a67 Mark Brown          2012-10-04  1558  		}
8a2ceac6617a67 Mark Brown          2012-10-04  1559  
283a3234550c34 Dmitry Baryshkov    2020-09-17  1560  		ret = _regmap_select_page(map, &reg, range, noinc ? 1 : val_num);
0ff3e62ff119f2 Mark Brown          2012-10-04  1561  		if (ret != 0)
6863ca6227598d Krystian Garbaciak  2012-06-15  1562  			return ret;
98bc7dfd76407e Mark Brown          2012-10-04  1563  	}
6863ca6227598d Krystian Garbaciak  2012-06-15  1564  
d939fb9a78b474 Marc Reilly         2012-03-16  1565  	map->format.format_reg(map->work_buf, reg, map->reg_shift);
f50e38c9966076 Tony Lindgren       2016-09-15  1566  	regmap_set_work_buf_flag_mask(map, map->format.reg_bytes,
f50e38c9966076 Tony Lindgren       2016-09-15  1567  				      map->write_flag_mask);
6f306441e97f8f Lars-Peter Clausen  2011-09-05  1568  
651e013e3ce6c0 Mark Brown          2013-10-08  1569  	/*
651e013e3ce6c0 Mark Brown          2013-10-08  1570  	 * Essentially all I/O mechanisms will be faster with a single
651e013e3ce6c0 Mark Brown          2013-10-08  1571  	 * buffer to write.  Since register syncs often generate raw
651e013e3ce6c0 Mark Brown          2013-10-08  1572  	 * writes of single registers optimise that case.
651e013e3ce6c0 Mark Brown          2013-10-08  1573  	 */
651e013e3ce6c0 Mark Brown          2013-10-08  1574  	if (val != work_val && val_len == map->format.val_bytes) {
651e013e3ce6c0 Mark Brown          2013-10-08  1575  		memcpy(work_val, val, map->format.val_bytes);
651e013e3ce6c0 Mark Brown          2013-10-08  1576  		val = work_val;
651e013e3ce6c0 Mark Brown          2013-10-08  1577  	}
651e013e3ce6c0 Mark Brown          2013-10-08  1578  
b96b017919116c Marek Vasut         2022-04-30 @1579  	if (map->async && map->bus && map->bus->async_write) {
7e09a979404ed0 Mark Brown          2013-10-07  1580  		struct regmap_async *async;
0d509f2b112b21 Mark Brown          2013-01-27  1581  
c6b570d97c0e77 Philipp Zabel       2015-03-09  1582  		trace_regmap_async_write_start(map, reg, val_len);
fe7d4ccd1d7748 Mark Brown          2013-02-21  1583  
7e09a979404ed0 Mark Brown          2013-10-07  1584  		spin_lock_irqsave(&map->async_lock, flags);
7e09a979404ed0 Mark Brown          2013-10-07  1585  		async = list_first_entry_or_null(&map->async_free,
7e09a979404ed0 Mark Brown          2013-10-07  1586  						 struct regmap_async,
7e09a979404ed0 Mark Brown          2013-10-07  1587  						 list);
7e09a979404ed0 Mark Brown          2013-10-07  1588  		if (async)
7e09a979404ed0 Mark Brown          2013-10-07  1589  			list_del(&async->list);
7e09a979404ed0 Mark Brown          2013-10-07  1590  		spin_unlock_irqrestore(&map->async_lock, flags);
7e09a979404ed0 Mark Brown          2013-10-07  1591  
7e09a979404ed0 Mark Brown          2013-10-07  1592  		if (!async) {
7e09a979404ed0 Mark Brown          2013-10-07  1593  			async = map->bus->async_alloc();
7e09a979404ed0 Mark Brown          2013-10-07  1594  			if (!async)
7e09a979404ed0 Mark Brown          2013-10-07  1595  				return -ENOMEM;
7e09a979404ed0 Mark Brown          2013-10-07  1596  
0d509f2b112b21 Mark Brown          2013-01-27  1597  			async->work_buf = kzalloc(map->format.buf_size,
0d509f2b112b21 Mark Brown          2013-01-27  1598  						  GFP_KERNEL | GFP_DMA);
0d509f2b112b21 Mark Brown          2013-01-27  1599  			if (!async->work_buf) {
0d509f2b112b21 Mark Brown          2013-01-27  1600  				kfree(async);
0d509f2b112b21 Mark Brown          2013-01-27  1601  				return -ENOMEM;
0d509f2b112b21 Mark Brown          2013-01-27  1602  			}
7e09a979404ed0 Mark Brown          2013-10-07  1603  		}
0d509f2b112b21 Mark Brown          2013-01-27  1604  
0d509f2b112b21 Mark Brown          2013-01-27  1605  		async->map = map;
0d509f2b112b21 Mark Brown          2013-01-27  1606  
0d509f2b112b21 Mark Brown          2013-01-27  1607  		/* If the caller supplied the value we can use it safely. */
0d509f2b112b21 Mark Brown          2013-01-27  1608  		memcpy(async->work_buf, map->work_buf, map->format.pad_bytes +
0d509f2b112b21 Mark Brown          2013-01-27  1609  		       map->format.reg_bytes + map->format.val_bytes);
0d509f2b112b21 Mark Brown          2013-01-27  1610  
0d509f2b112b21 Mark Brown          2013-01-27  1611  		spin_lock_irqsave(&map->async_lock, flags);
0d509f2b112b21 Mark Brown          2013-01-27  1612  		list_add_tail(&async->list, &map->async_list);
0d509f2b112b21 Mark Brown          2013-01-27  1613  		spin_unlock_irqrestore(&map->async_lock, flags);
0d509f2b112b21 Mark Brown          2013-01-27  1614  
04c50ccf0dab02 Mark Brown          2013-10-10  1615  		if (val != work_val)
04c50ccf0dab02 Mark Brown          2013-10-10  1616  			ret = map->bus->async_write(map->bus_context,
04c50ccf0dab02 Mark Brown          2013-10-10  1617  						    async->work_buf,
0d509f2b112b21 Mark Brown          2013-01-27  1618  						    map->format.reg_bytes +
0d509f2b112b21 Mark Brown          2013-01-27  1619  						    map->format.pad_bytes,
0d509f2b112b21 Mark Brown          2013-01-27  1620  						    val, val_len, async);
04c50ccf0dab02 Mark Brown          2013-10-10  1621  		else
04c50ccf0dab02 Mark Brown          2013-10-10  1622  			ret = map->bus->async_write(map->bus_context,
04c50ccf0dab02 Mark Brown          2013-10-10  1623  						    async->work_buf,
04c50ccf0dab02 Mark Brown          2013-10-10  1624  						    map->format.reg_bytes +
04c50ccf0dab02 Mark Brown          2013-10-10  1625  						    map->format.pad_bytes +
04c50ccf0dab02 Mark Brown          2013-10-10  1626  						    val_len, NULL, 0, async);
0d509f2b112b21 Mark Brown          2013-01-27  1627  
0d509f2b112b21 Mark Brown          2013-01-27  1628  		if (ret != 0) {
0d509f2b112b21 Mark Brown          2013-01-27  1629  			dev_err(map->dev, "Failed to schedule write: %d\n",
0d509f2b112b21 Mark Brown          2013-01-27  1630  				ret);
0d509f2b112b21 Mark Brown          2013-01-27  1631  
0d509f2b112b21 Mark Brown          2013-01-27  1632  			spin_lock_irqsave(&map->async_lock, flags);
7e09a979404ed0 Mark Brown          2013-10-07  1633  			list_move(&async->list, &map->async_free);
0d509f2b112b21 Mark Brown          2013-01-27  1634  			spin_unlock_irqrestore(&map->async_lock, flags);
0d509f2b112b21 Mark Brown          2013-01-27  1635  		}
f951b6587b94df Mark Brown          2013-03-27  1636  
f951b6587b94df Mark Brown          2013-03-27  1637  		return ret;
0d509f2b112b21 Mark Brown          2013-01-27  1638  	}
0d509f2b112b21 Mark Brown          2013-01-27  1639  
c6b570d97c0e77 Philipp Zabel       2015-03-09  1640  	trace_regmap_hw_write_start(map, reg, val_len / map->format.val_bytes);
fb2736bbaee0e7 Mark Brown          2011-07-24  1641  
2547e201b3693f Mark Brown          2011-07-20  1642  	/* If we're doing a single register write we can probably just
2547e201b3693f Mark Brown          2011-07-20  1643  	 * send the work_buf directly, otherwise try to do a gather
2547e201b3693f Mark Brown          2011-07-20  1644  	 * write.
2547e201b3693f Mark Brown          2011-07-20  1645  	 */
0d509f2b112b21 Mark Brown          2013-01-27  1646  	if (val == work_val)
b96b017919116c Marek Vasut         2022-04-30  1647  		ret = map->write(map->bus_context, map->work_buf,
82159ba8e6ef8c Mark Brown          2012-01-18  1648  				 map->format.reg_bytes +
82159ba8e6ef8c Mark Brown          2012-01-18  1649  				 map->format.pad_bytes +
82159ba8e6ef8c Mark Brown          2012-01-18  1650  				 val_len);
2547e201b3693f Mark Brown          2011-07-20 @1651  	else if (map->bus->gather_write)
0135bbcc7a0cc0 Stephen Warren      2012-04-04  1652  		ret = map->bus->gather_write(map->bus_context, map->work_buf,
82159ba8e6ef8c Mark Brown          2012-01-18  1653  					     map->format.reg_bytes +
82159ba8e6ef8c Mark Brown          2012-01-18  1654  					     map->format.pad_bytes,
b83a313bf25201 Mark Brown          2011-05-11  1655  					     val, val_len);
db057679de3e9e Srinivas Kandagatla 2019-06-12  1656  	else
db057679de3e9e Srinivas Kandagatla 2019-06-12  1657  		ret = -ENOTSUPP;
b83a313bf25201 Mark Brown          2011-05-11  1658  
2547e201b3693f Mark Brown          2011-07-20  1659  	/* If that didn't work fall back on linearising by hand. */
b83a313bf25201 Mark Brown          2011-05-11  1660  	if (ret == -ENOTSUPP) {
82159ba8e6ef8c Mark Brown          2012-01-18  1661  		len = map->format.reg_bytes + map->format.pad_bytes + val_len;
82159ba8e6ef8c Mark Brown          2012-01-18  1662  		buf = kzalloc(len, GFP_KERNEL);
b83a313bf25201 Mark Brown          2011-05-11  1663  		if (!buf)
b83a313bf25201 Mark Brown          2011-05-11  1664  			return -ENOMEM;
b83a313bf25201 Mark Brown          2011-05-11  1665  
b83a313bf25201 Mark Brown          2011-05-11  1666  		memcpy(buf, map->work_buf, map->format.reg_bytes);
82159ba8e6ef8c Mark Brown          2012-01-18  1667  		memcpy(buf + map->format.reg_bytes + map->format.pad_bytes,
82159ba8e6ef8c Mark Brown          2012-01-18  1668  		       val, val_len);
b96b017919116c Marek Vasut         2022-04-30  1669  		ret = map->write(map->bus_context, buf, len);
b83a313bf25201 Mark Brown          2011-05-11  1670  
b83a313bf25201 Mark Brown          2011-05-11  1671  		kfree(buf);
815806e39bf6f7 Elaine Zhang        2016-08-18  1672  	} else if (ret != 0 && !map->cache_bypass && map->format.parse_val) {
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1673  		/* regcache_drop_region() takes lock that we already have,
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1674  		 * thus call map->cache_ops->drop() directly
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1675  		 */
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1676  		if (map->cache_ops && map->cache_ops->drop)
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1677  			map->cache_ops->drop(map, reg, reg + 1);
b83a313bf25201 Mark Brown          2011-05-11  1678  	}
b83a313bf25201 Mark Brown          2011-05-11  1679  
c6b570d97c0e77 Philipp Zabel       2015-03-09  1680  	trace_regmap_hw_write_done(map, reg, val_len / map->format.val_bytes);
fb2736bbaee0e7 Mark Brown          2011-07-24  1681  
b83a313bf25201 Mark Brown          2011-05-11  1682  	return ret;
b83a313bf25201 Mark Brown          2011-05-11  1683  }
b83a313bf25201 Mark Brown          2011-05-11  1684  

:::::: The code at line 1651 was first introduced by commit
:::::: 2547e201b3693f91d643fc0d21ef86171894b59b regmap: Just send the buffer directly for single register writes

:::::: TO: Mark Brown <broonie@opensource.wolfsonmicro.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
