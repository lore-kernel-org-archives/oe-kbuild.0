Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94A03CB2D2
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 05:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118938; cv=none; b=eS1BUULOi72xXph2wzwMllGzJTPSYFhmrzpjj5UcCUcavXkWK0bE9R33+S5KXBrQxWUkjeHbtkAFjogcEs9Qz+OyrTggZdxK0eIh2aF1d/kmYNuljhSuosvnH5MFpElMAZn2YUQLqe0vAZq1+FXTHpiQlZsS9m+dVA7oWUKFMeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118938; c=relaxed/simple;
	bh=oBzIfuTCbGeOSWAwDvP0TAmBBrrrpaJ5Qmnkuo8t+vY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JfGbZCjLXWmGbVyeoJF1+rqYX1K41vcQ56GTyE1PIPnDbSb2YXcFn2VlrmWNyWgbXFq+NaSYlids/Z7Nn2bEAJYlxnECGOBFmvUSe5t2B/3tKZa0bKJlJYt9VSYKlhpuxja8MOguVELpxI4wwyfdlONq4VQfXH6F54EzIeZWiBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=icJ00QK/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="icJ00QK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787118936; x=1818654936;
  h=date:from:to:cc:subject:message-id;
  bh=oBzIfuTCbGeOSWAwDvP0TAmBBrrrpaJ5Qmnkuo8t+vY=;
  b=icJ00QK/+gTlBfSHaZKyz5K+YEhMluQHJqQh408SZ3GlFk6b7uo1ylxt
   aykWdm2B/HXZfeKL+6Hez9ZE7BWIjcZ6fOrtDLJPrn+18Dagv1phBKrRP
   FAQ6r7jO+c98iDZIKZ8YkrvCOXq7ecXfvyEa4QYHkmRrzLbSaaSuE3PuU
   brWjhFg8HAXM88t2mfq9V2I/WZZVKPzz8ECXxgpG+Dhl4vX5YViTu4Ov4
   dRMje7IJmpYUkn5lcnVkE1w9MxdVuDEz6y0sVHQbB0bmRiwZ6lzC/ozgx
   P//60HlAQQ2bAsC4F4qedU8ryz88cQ38D11g4pY6iUCnJ8BNX7ZkSI+4z
   A==;
X-CSE-ConnectionGUID: oconBKdRQh6WgGgMLVBVlA==
X-CSE-MsgGUID: +me0SpG4TDWdDSH94HIJKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98779658"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="98779658"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 22:55:36 -0700
X-CSE-ConnectionGUID: L+bAr8wYTQ2O9Q9GsN50iA==
X-CSE-MsgGUID: NmTJsojaTiCet01w3WbIXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="263708636"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Aug 2026 22:55:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwZGt-00000000ev4-389b;
	Wed, 19 Aug 2026 05:55:31 +0000
Date: Wed, 19 Aug 2026 13:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chao:feature/cache 6/13] fs/f2fs/gc.c:1897
 do_garbage_collect() error: 'sum_entry' dereferencing possible ERR_PTR()
Message-ID: <202608191338.E8L1n0k3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Chao Yu <chao@kernel.org>
TO: Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/cache
head:   cc6a23d8c232f588f3a5415d1b10a19e1e4ce860
commit: 843ddf01eb4efc800bdac9de795bdeb57940a3e0 [6/13] f2fs: cache: use meta cache
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-161-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191338.E8L1n0k3-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608191338.E8L1n0k3-lkp@intel.com/

New smatch warnings:
fs/f2fs/gc.c:1897 do_garbage_collect() error: 'sum_entry' dereferencing possible ERR_PTR()
fs/f2fs/segment.c:4617 write_compacted_summaries() warn: variable dereferenced before check 'entry' (see line 4600)

Old smatch warnings:
fs/f2fs/gc.c:819 f2fs_get_victim() warn: check sign expansion for '-1'
fs/f2fs/gc.c:1298 ra_data_block() warn: missing error code 'err'
fs/f2fs/segment.c:874 __remove_dirty_segment() warn: check sign expansion for '-1'

vim +/sum_entry +1897 fs/f2fs/gc.c

7bc0900347e069 Jaegeuk Kim    2012-11-02  1772  
718e53fa633f84 Chao Yu        2016-01-23  1773  static int do_garbage_collect(struct f2fs_sb_info *sbi,
718e53fa633f84 Chao Yu        2016-01-23  1774  				unsigned int start_segno,
7dede88659df38 Chao Yu        2021-02-20  1775  				struct gc_inode_list *gc_list, int gc_type,
9748c2ddea4a3f Daeho Jeong    2024-09-09  1776  				bool force_migrate, bool one_time)
7bc0900347e069 Jaegeuk Kim    2012-11-02  1777  {
c718379b6b0954 Jaegeuk Kim    2013-04-24  1778  	struct blk_plug plug;
718e53fa633f84 Chao Yu        2016-01-23  1779  	unsigned int segno = start_segno;
a60108f7dfb586 Jaegeuk Kim    2024-02-06  1780  	unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
8c890c4c603427 Daeho Jeong    2024-09-09  1781  	unsigned int sec_end_segno;
e3080b0120a15e Chao Yu        2018-10-24  1782  	int seg_freed = 0, migrated = 0;
5dfb768326b95c Daeho Jeong    2026-05-14  1783  	unsigned char type;
5dfb768326b95c Daeho Jeong    2026-05-14  1784  	unsigned char data_type;
7ee8bc3942f209 Daeho Jeong    2025-11-11  1785  	int submitted = 0, sum_blk_cnt;
7bc0900347e069 Jaegeuk Kim    2012-11-02  1786  
8c890c4c603427 Daeho Jeong    2024-09-09  1787  	if (__is_large_section(sbi)) {
8c890c4c603427 Daeho Jeong    2024-09-09  1788  		sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
e3080b0120a15e Chao Yu        2018-10-24  1789  
de881df97768d0 Aravind Ramesh 2020-07-16  1790  		/*
de881df97768d0 Aravind Ramesh 2020-07-16  1791  		 * zone-capacity can be less than zone-size in zoned devices,
de881df97768d0 Aravind Ramesh 2020-07-16  1792  		 * resulting in less than expected usable segments in the zone,
8c890c4c603427 Daeho Jeong    2024-09-09  1793  		 * calculate the end segno in the zone which can be garbage
8c890c4c603427 Daeho Jeong    2024-09-09  1794  		 * collected
de881df97768d0 Aravind Ramesh 2020-07-16  1795  		 */
de881df97768d0 Aravind Ramesh 2020-07-16  1796  		if (f2fs_sb_has_blkzoned(sbi))
8c890c4c603427 Daeho Jeong    2024-09-09  1797  			sec_end_segno -= SEGS_PER_SEC(sbi) -
2af583afcf9d54 liuderong      2024-09-11  1798  					f2fs_usable_segs_in_sec(sbi);
de881df97768d0 Aravind Ramesh 2020-07-16  1799  
9748c2ddea4a3f Daeho Jeong    2024-09-09  1800  		if (gc_type == BG_GC || one_time) {
2223fe652f7596 Daeho Jeong    2024-09-09  1801  			unsigned int window_granularity =
8c890c4c603427 Daeho Jeong    2024-09-09  1802  				sbi->migration_window_granularity;
8c890c4c603427 Daeho Jeong    2024-09-09  1803  
2223fe652f7596 Daeho Jeong    2024-09-09  1804  			if (f2fs_sb_has_blkzoned(sbi) &&
2223fe652f7596 Daeho Jeong    2024-09-09  1805  					!has_enough_free_blocks(sbi,
3d7bca9d583793 Chao Yu        2026-07-06  1806  					sbi->gc_thread.boost_zoned_gc_percent))
9a481a1c16f465 Daeho Jeong    2024-09-09  1807  				window_granularity *=
3d7bca9d583793 Chao Yu        2026-07-06  1808  					sbi->gc_thread.boost_gc_multiple;
2223fe652f7596 Daeho Jeong    2024-09-09  1809  
2223fe652f7596 Daeho Jeong    2024-09-09  1810  			end_segno = start_segno + window_granularity;
2223fe652f7596 Daeho Jeong    2024-09-09  1811  		}
2223fe652f7596 Daeho Jeong    2024-09-09  1812  
8c890c4c603427 Daeho Jeong    2024-09-09  1813  		if (end_segno > sec_end_segno)
8c890c4c603427 Daeho Jeong    2024-09-09  1814  			end_segno = sec_end_segno;
8c890c4c603427 Daeho Jeong    2024-09-09  1815  	}
8c890c4c603427 Daeho Jeong    2024-09-09  1816  
093749e296e29a Chao Yu        2020-08-04  1817  	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
093749e296e29a Chao Yu        2020-08-04  1818  
e48e16f3e37fac Daeho Jeong    2026-01-10  1819  	segno = rounddown(segno, sbi->sums_per_block);
e48e16f3e37fac Daeho Jeong    2026-01-10  1820  	sum_blk_cnt = DIV_ROUND_UP(end_segno - segno, sbi->sums_per_block);
718e53fa633f84 Chao Yu        2016-01-23  1821  	/* readahead multi ssa blocks those have contiguous address */
2c70c5e3874e8c Chao Yu        2018-10-24  1822  	if (__is_large_section(sbi))
843ddf01eb4efc Chao Yu        2026-08-18  1823  		f2fs_ra_meta_caches(sbi, GET_SUM_BLOCK(sbi, segno),
7ee8bc3942f209 Daeho Jeong    2025-11-11  1824  					sum_blk_cnt, META_SSA, true);
718e53fa633f84 Chao Yu        2016-01-23  1825  
718e53fa633f84 Chao Yu        2016-01-23  1826  	/* reference all summary page */
718e53fa633f84 Chao Yu        2016-01-23  1827  	while (segno < end_segno) {
843ddf01eb4efc Chao Yu        2026-08-18  1828  		struct f2fs_cached_block *sum_entry =
843ddf01eb4efc Chao Yu        2026-08-18  1829  				f2fs_get_sum_cache(sbi, segno);
7ee8bc3942f209 Daeho Jeong    2025-11-11  1830  
e48e16f3e37fac Daeho Jeong    2026-01-10  1831  		segno += sbi->sums_per_block;
843ddf01eb4efc Chao Yu        2026-08-18  1832  		if (IS_ERR(sum_entry)) {
843ddf01eb4efc Chao Yu        2026-08-18  1833  			int err = PTR_ERR(sum_entry);
edc55aaf0d1712 Jaegeuk Kim    2018-09-17  1834  
e48e16f3e37fac Daeho Jeong    2026-01-10  1835  			end_segno = segno - sbi->sums_per_block;
e48e16f3e37fac Daeho Jeong    2026-01-10  1836  			segno = rounddown(start_segno, sbi->sums_per_block);
7ee8bc3942f209 Daeho Jeong    2025-11-11  1837  			while (segno < end_segno) {
843ddf01eb4efc Chao Yu        2026-08-18  1838  				sum_entry = f2fs_find_meta_cache(sbi,
edc55aaf0d1712 Jaegeuk Kim    2018-09-17  1839  						GET_SUM_BLOCK(sbi, segno));
843ddf01eb4efc Chao Yu        2026-08-18  1840  				f2fs_put_cache(sum_entry, false);
843ddf01eb4efc Chao Yu        2026-08-18  1841  				f2fs_put_cache(sum_entry, false);
e48e16f3e37fac Daeho Jeong    2026-01-10  1842  				segno += sbi->sums_per_block;
edc55aaf0d1712 Jaegeuk Kim    2018-09-17  1843  			}
edc55aaf0d1712 Jaegeuk Kim    2018-09-17  1844  			return err;
edc55aaf0d1712 Jaegeuk Kim    2018-09-17  1845  		}
843ddf01eb4efc Chao Yu        2026-08-18  1846  		f2fs_unlock_cache(sum_entry);
843ddf01eb4efc Chao Yu        2026-08-18  1847  
718e53fa633f84 Chao Yu        2016-01-23  1848  	}
7bc0900347e069 Jaegeuk Kim    2012-11-02  1849  
c718379b6b0954 Jaegeuk Kim    2013-04-24  1850  	blk_start_plug(&plug);
c718379b6b0954 Jaegeuk Kim    2013-04-24  1851  
7ee8bc3942f209 Daeho Jeong    2025-11-11  1852  	segno = start_segno;
7ee8bc3942f209 Daeho Jeong    2025-11-11  1853  	while (segno < end_segno) {
7ee8bc3942f209 Daeho Jeong    2025-11-11  1854  		unsigned int cur_segno;
843ddf01eb4efc Chao Yu        2026-08-18  1855  		unsigned int block_end_segno;
aa987273290d20 Jaegeuk Kim    2016-06-06  1856  
718e53fa633f84 Chao Yu        2016-01-23  1857  		/* find segment summary of victim */
843ddf01eb4efc Chao Yu        2026-08-18  1858  		struct f2fs_cached_block *sum_entry =
843ddf01eb4efc Chao Yu        2026-08-18  1859  				f2fs_find_meta_cache(sbi,
718e53fa633f84 Chao Yu        2016-01-23  1860  					GET_SUM_BLOCK(sbi, segno));
843ddf01eb4efc Chao Yu        2026-08-18  1861  
843ddf01eb4efc Chao Yu        2026-08-18  1862  		f2fs_bug_on(sbi, IS_ERR(sum_entry));
843ddf01eb4efc Chao Yu        2026-08-18  1863  
843ddf01eb4efc Chao Yu        2026-08-18  1864  		block_end_segno = rounddown(segno, sbi->sums_per_block)
e48e16f3e37fac Daeho Jeong    2026-01-10  1865  					+ sbi->sums_per_block;
7ee8bc3942f209 Daeho Jeong    2025-11-11  1866  
7ee8bc3942f209 Daeho Jeong    2025-11-11  1867  		if (block_end_segno > end_segno)
7ee8bc3942f209 Daeho Jeong    2025-11-11  1868  			block_end_segno = end_segno;
718e53fa633f84 Chao Yu        2016-01-23  1869  
d625a2b08c0893 Chao Yu        2025-09-01  1870  		if (is_cursec(sbi, GET_SEC_FROM_SEG(sbi, segno))) {
d625a2b08c0893 Chao Yu        2025-09-01  1871  			f2fs_err(sbi, "%s: segment %u is used by log",
d625a2b08c0893 Chao Yu        2025-09-01  1872  							__func__, segno);
d625a2b08c0893 Chao Yu        2025-09-01  1873  			f2fs_bug_on(sbi, 1);
7ee8bc3942f209 Daeho Jeong    2025-11-11  1874  			goto next_block;
d625a2b08c0893 Chao Yu        2025-09-01  1875  		}
d625a2b08c0893 Chao Yu        2025-09-01  1876  
843ddf01eb4efc Chao Yu        2026-08-18  1877  		if (!f2fs_cache_test_uptodate(sum_entry) ||
7ee8bc3942f209 Daeho Jeong    2025-11-11  1878  			unlikely(f2fs_cp_error(sbi)))
7ee8bc3942f209 Daeho Jeong    2025-11-11  1879  			goto next_block;
7ee8bc3942f209 Daeho Jeong    2025-11-11  1880  
7ee8bc3942f209 Daeho Jeong    2025-11-11  1881  		for (cur_segno = segno; cur_segno < block_end_segno;
7ee8bc3942f209 Daeho Jeong    2025-11-11  1882  				cur_segno++) {
7ee8bc3942f209 Daeho Jeong    2025-11-11  1883  			struct f2fs_summary_block *sum;
7ee8bc3942f209 Daeho Jeong    2025-11-11  1884  
7ee8bc3942f209 Daeho Jeong    2025-11-11  1885  			if (get_valid_blocks(sbi, cur_segno, false) == 0)
d6c66cd19ef322 Yunlong Song   2018-10-24  1886  				goto freed;
dabfbbc8f91450 Jaegeuk Kim    2020-02-09  1887  			if (gc_type == BG_GC && __is_large_section(sbi) &&
e3080b0120a15e Chao Yu        2018-10-24  1888  					migrated >= sbi->migration_granularity)
7ee8bc3942f209 Daeho Jeong    2025-11-11  1889  				continue;
de0dcc40f6e24d Jaegeuk Kim    2016-10-12  1890  
5dfb768326b95c Daeho Jeong    2026-05-14  1891  			if (migrated == 0) {
5dfb768326b95c Daeho Jeong    2026-05-14  1892  				type = IS_DATASEG(get_seg_entry(sbi, cur_segno)->type) ?
5dfb768326b95c Daeho Jeong    2026-05-14  1893  							SUM_TYPE_DATA : SUM_TYPE_NODE;
5dfb768326b95c Daeho Jeong    2026-05-14  1894  				data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
5dfb768326b95c Daeho Jeong    2026-05-14  1895  			}
5dfb768326b95c Daeho Jeong    2026-05-14  1896  
843ddf01eb4efc Chao Yu        2026-08-18 @1897  			sum = SUM_BLK_ENTRY_ADDR(sbi, sum_entry, cur_segno);
e48e16f3e37fac Daeho Jeong    2026-01-10  1898  			if (type != GET_SUM_TYPE(sum_footer(sbi, sum))) {
7ee8bc3942f209 Daeho Jeong    2025-11-11  1899  				f2fs_err(sbi, "Inconsistent segment (%u) type "
98fd20b9cf472d Chao Yu        2026-06-15  1900  						"[%d, %d] in SIT and SSA",
7ee8bc3942f209 Daeho Jeong    2025-11-11  1901  						cur_segno, type,
e48e16f3e37fac Daeho Jeong    2026-01-10  1902  						GET_SUM_TYPE(
e48e16f3e37fac Daeho Jeong    2026-01-10  1903  						sum_footer(sbi, sum)));
a9cfee0ef98e99 Chao Yu        2022-09-28  1904  				f2fs_stop_checkpoint(sbi, false,
a9cfee0ef98e99 Chao Yu        2022-09-28  1905  						STOP_CP_REASON_CORRUPTED_SUMMARY);
7ee8bc3942f209 Daeho Jeong    2025-11-11  1906  				continue;
10d255c3540239 Chao Yu        2018-07-04  1907  			}
7bc0900347e069 Jaegeuk Kim    2012-11-02  1908  
9236cac5666ea8 Jaegeuk Kim    2015-05-28  1909  			/*
9236cac5666ea8 Jaegeuk Kim    2015-05-28  1910  			 * this is to avoid deadlock:
9236cac5666ea8 Jaegeuk Kim    2015-05-28  1911  			 *  - lock_page(sum_page)     - f2fs_replace_block
3d26fa6be3c487 Chao Yu        2017-10-30  1912  			 *   - check_valid_map()        - down_write(sentry_lock)
3d26fa6be3c487 Chao Yu        2017-10-30  1913  			 *    - down_read(sentry_lock) - change_curseg()
9236cac5666ea8 Jaegeuk Kim    2015-05-28  1914  			 *                               - lock_page(sum_page)
9236cac5666ea8 Jaegeuk Kim    2015-05-28  1915  			 */
718e53fa633f84 Chao Yu        2016-01-23  1916  			if (type == SUM_TYPE_NODE)
7ee8bc3942f209 Daeho Jeong    2025-11-11  1917  				submitted += gc_node_segment(sbi, sum->entries,
7ec199117c3254 Daeho Jeong    2025-12-30  1918  						cur_segno, gc_type, &plug);
48018b4cfd07dd Chao Yu        2018-09-13  1919  			else
7ee8bc3942f209 Daeho Jeong    2025-11-11  1920  				submitted += gc_data_segment(sbi, sum->entries,
7ee8bc3942f209 Daeho Jeong    2025-11-11  1921  						gc_list, cur_segno,
7ec199117c3254 Daeho Jeong    2025-12-30  1922  						gc_type, force_migrate, &plug);
c718379b6b0954 Jaegeuk Kim    2013-04-24  1923  
9bf1dcbdfdc889 Chao Yu        2023-08-08  1924  			stat_inc_gc_seg_count(sbi, data_type, gc_type);
07c6b5933ebf58 Daeho Jeong    2021-07-09  1925  			sbi->gc_reclaimed_segs[sbi->gc_mode]++;
8c7b9ac129d096 Jaegeuk Kim    2020-02-09  1926  			migrated++;
c56f16dab0dfc8 Chao Yu        2017-08-11  1927  
d6c66cd19ef322 Yunlong Song   2018-10-24  1928  freed:
c56f16dab0dfc8 Chao Yu        2017-08-11  1929  			if (gc_type == FG_GC &&
7ee8bc3942f209 Daeho Jeong    2025-11-11  1930  					get_valid_blocks(sbi, cur_segno, false) == 0)
c56f16dab0dfc8 Chao Yu        2017-08-11  1931  				seg_freed++;
e3080b0120a15e Chao Yu        2018-10-24  1932  
e219aecfd4b766 Yonggil Song   2022-11-22  1933  			if (__is_large_section(sbi))
e219aecfd4b766 Yonggil Song   2022-11-22  1934  				sbi->next_victim_seg[gc_type] =
7ee8bc3942f209 Daeho Jeong    2025-11-11  1935  					(cur_segno + 1 < sec_end_segno) ?
7ee8bc3942f209 Daeho Jeong    2025-11-11  1936  					cur_segno + 1 : NULL_SEGNO;
02d91398a602c3 Daeho Jeong    2026-03-16  1937  
02d91398a602c3 Daeho Jeong    2026-03-16  1938  			if (unlikely(freezing(current))) {
843ddf01eb4efc Chao Yu        2026-08-18  1939  				f2fs_put_cache(sum_entry, false);
843ddf01eb4efc Chao Yu        2026-08-18  1940  				f2fs_put_cache(sum_entry, false);
02d91398a602c3 Daeho Jeong    2026-03-16  1941  				goto stop;
02d91398a602c3 Daeho Jeong    2026-03-16  1942  			}
7ee8bc3942f209 Daeho Jeong    2025-11-11  1943  		}
7ee8bc3942f209 Daeho Jeong    2025-11-11  1944  next_block:
843ddf01eb4efc Chao Yu        2026-08-18  1945  		f2fs_put_cache(sum_entry, false);
843ddf01eb4efc Chao Yu        2026-08-18  1946  		f2fs_put_cache(sum_entry, false);
7ee8bc3942f209 Daeho Jeong    2025-11-11  1947  		segno = block_end_segno;
718e53fa633f84 Chao Yu        2016-01-23  1948  	}
718e53fa633f84 Chao Yu        2016-01-23  1949  
02d91398a602c3 Daeho Jeong    2026-03-16  1950  stop:
48018b4cfd07dd Chao Yu        2018-09-13  1951  	if (submitted)
9bf1dcbdfdc889 Chao Yu        2023-08-08  1952  		f2fs_submit_merged_write(sbi, data_type);
718e53fa633f84 Chao Yu        2016-01-23  1953  
718e53fa633f84 Chao Yu        2016-01-23  1954  	blk_finish_plug(&plug);
718e53fa633f84 Chao Yu        2016-01-23  1955  
9bf1dcbdfdc889 Chao Yu        2023-08-08  1956  	if (migrated)
9bf1dcbdfdc889 Chao Yu        2023-08-08  1957  		stat_inc_gc_sec_count(sbi, data_type, gc_type);
17d899df4678a1 Chao Yu        2016-02-22  1958  
c56f16dab0dfc8 Chao Yu        2017-08-11  1959  	return seg_freed;
7bc0900347e069 Jaegeuk Kim    2012-11-02  1960  }
7bc0900347e069 Jaegeuk Kim    2012-11-02  1961  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
