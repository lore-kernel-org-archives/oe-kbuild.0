Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA27DD26C
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Sep 2023 15:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695569995; x=1727105995;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GG+IoaP4+Yv82ASPBA58HgL6xWKR3krB6GHEh4kejvs=;
  b=P16wtY19j/WpcxGu2G7dHEtBc9dFwXCqxRH61I3iitTgzjMsEhFN8Jo2
   fk2/In83PZ9BjxdXUnYHNAVvryrJF/VPo874FUXXfUErzFDp+gjb3XoeB
   DEaBsyPKtfiVmeUUYq96pjE+Afof5jTtABDbv4uumRwqE88BxgtlnI+XM
   Z9TvdvX6LIk71ajS7spsvYzSVpIAlcuY4wJck5j5oJkCbgFuyZh7LFRdR
   1w1V7/dPIiFiznj6eXP+xLcZJ7B8fjrJp3iA1zRma3Wb/6eI7JONI83BS
   JO7s6Qh0oUsj+DJEFoVRbfasoeJ3tOihO4PjeKK2jBjXVJnaXwzEIGwQF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="383863149"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="383863149"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 08:39:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="724726446"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="724726446"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Sep 2023 08:39:50 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkRCz-000020-2t;
	Sun, 24 Sep 2023 15:39:46 +0000
Date: Sun, 24 Sep 2023 23:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 898/1370]
 drivers/mtd/spi-nor/core.c:1726 spi_nor_erase() error: uninitialized symbol
 'offset'.
Message-ID: <202309242358.7U44dvEw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 5fee19c6329ff527e553bfb9b158869c482b1c27 [898/1370] mtd: spi-nor: Add EAR support
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: i386-randconfig-141-20230924 (https://download.01.org/0day-ci/archive/20230924/202309242358.7U44dvEw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230924/202309242358.7U44dvEw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309242358.7U44dvEw-lkp@intel.com/

New smatch warnings:
drivers/mtd/spi-nor/core.c:1726 spi_nor_erase() error: uninitialized symbol 'offset'.

Old smatch warnings:
drivers/mtd/spi-nor/core.c:2016 spi_nor_read() warn: possible memory leak of 'readbuf'
drivers/mtd/spi-nor/core.c:3362 spi_nor_quad_enable() error: uninitialized symbol 'err'.

vim +/offset +1726 drivers/mtd/spi-nor/core.c

5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2018-09-11  1556  
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1557  /*
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1558   * Erase an address range on the nor chip.  The address range may extend
c69942bda5152d drivers/mtd/spi-nor/core.c    Jonathan Neuschäfer    2020-11-30  1559   * one or more erase sectors. Return an error if there is a problem erasing.
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1560   */
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1561  static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1562  {
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1563  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1564  	struct spi_nor_flash_parameter *params;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1565  	u32 addr, len, offset, cur_cs_num = 0;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1566  	uint32_t rem;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1567  	int ret;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1568  	u64 sz;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1569  
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1570  	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1571  			(long long)instr->len);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1572  
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1573  	params = spi_nor_get_params(nor, 0);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1574  	sz = params->size;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1575  
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2018-09-11  1576  	if (spi_nor_has_uniform_erase(nor)) {
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1577  		div_u64_rem(instr->len, mtd->erasesize, &rem);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1578  		if (rem)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1579  			return -EINVAL;
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2018-09-11  1580  	}
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1581  
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1582  	addr = instr->addr;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1583  	len = instr->len;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1584  
52bbd2dcb42c21 drivers/mtd/spi-nor/spi-nor.c Michael Walle          2020-01-13  1585  	ret = spi_nor_lock_and_prep(nor);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1586  	if (ret)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1587  		return ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1588  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1589  	if (!(nor->flags & SNOR_F_HAS_PARALLEL)) {
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1590  		/* whole-chip erase? */
e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda        2016-12-02  1591  		if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
09b6a377687b88 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh         2015-09-18  1592  			unsigned long timeout;
09b6a377687b88 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh         2015-09-18  1593  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1594  			while ((cur_cs_num < SNOR_FLASH_CNT_MAX) && params) {
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1595  				nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
bce679e5ae3a38 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2019-11-02  1596  				ret = spi_nor_write_enable(nor);
bce679e5ae3a38 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2019-11-02  1597  				if (ret)
bce679e5ae3a38 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2019-11-02  1598  					goto erase_err;
05241aead9b98c drivers/mtd/spi-nor/spi-nor.c Brian Norris           2014-11-05  1599  
7380f79c111cf9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2019-10-29  1600  				ret = spi_nor_erase_chip(nor);
7380f79c111cf9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2019-10-29  1601  				if (ret)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1602  					goto erase_err;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1603  
09b6a377687b88 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh         2015-09-18  1604  				/*
09b6a377687b88 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh         2015-09-18  1605  				 * Scale the timeout linearly with the size of the flash, with
09b6a377687b88 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh         2015-09-18  1606  				 * a minimum calibrated to an old 2MB flash. We could try to
09b6a377687b88 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh         2015-09-18  1607  				 * pull these from CFI/SFDP, but these values should be good
09b6a377687b88 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh         2015-09-18  1608  				 * enough for now.
09b6a377687b88 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh         2015-09-18  1609  				 */
09b6a377687b88 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh         2015-09-18  1610  				timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
09b6a377687b88 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh         2015-09-18  1611  					      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1612  					      (unsigned long)(params->size /
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1613  							      SZ_2M));
09b6a377687b88 drivers/mtd/spi-nor/spi-nor.c Furquan Shaikh         2015-09-18  1614  				ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
dfa9c0cba4ea20 drivers/mtd/spi-nor/spi-nor.c Brian Norris           2014-08-06  1615  				if (ret)
dfa9c0cba4ea20 drivers/mtd/spi-nor/spi-nor.c Brian Norris           2014-08-06  1616  					goto erase_err;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1617  
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1618  				cur_cs_num++;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1619  				params = spi_nor_get_params(nor, cur_cs_num);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1620  			}
dfa9c0cba4ea20 drivers/mtd/spi-nor/spi-nor.c Brian Norris           2014-08-06  1621  
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1622  		/* REVISIT in some cases we could speed up erasing large regions
b02e7f3ef0beb7 drivers/mtd/spi-nor/spi-nor.c Brian Norris           2014-04-08  1623  		 * by using SPINOR_OP_SE instead of SPINOR_OP_BE_4K.  We may have set up
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1624  		 * to use "small sector erase", but that's not always optimal.
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1625  		 */
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1626  
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1627  		/* "sector"-at-a-time erase */
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2018-09-11  1628  		} else if (spi_nor_has_uniform_erase(nor)) {
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1629  			/* Determine the flash from which the operation need to start */
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1630  			while ((cur_cs_num < SNOR_FLASH_CNT_MAX) &&
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1631  			       (addr > sz - 1) && params) {
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1632  				cur_cs_num++;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1633  				params = spi_nor_get_params(nor, cur_cs_num);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1634  				sz += params->size;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1635  			}
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1636  			while (len) {
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1637  				nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
bce679e5ae3a38 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2019-11-02  1638  				ret = spi_nor_write_enable(nor);
34cd366fe2e783 drivers/mtd/spi-nor/core.c    Naga Sureshkumar Relli 2022-11-15  1639  				if (ret)
34cd366fe2e783 drivers/mtd/spi-nor/core.c    Naga Sureshkumar Relli 2022-11-15  1640  					goto erase_err;
34cd366fe2e783 drivers/mtd/spi-nor/core.c    Naga Sureshkumar Relli 2022-11-15  1641  
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1642  				offset = addr;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1643  				if (nor->flags & SNOR_F_HAS_STACKED) {
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1644  					params = spi_nor_get_params(nor, cur_cs_num);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1645  					offset -= (sz - params->size);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1646  				}
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1647  
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1648  				if (nor->addr_nbytes == 3) {
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1649  					/* Update Extended Address Register */
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1650  					ret = spi_nor_write_ear(nor, offset);
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1651  					if (ret)
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1652  						goto erase_err;
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1653  				}
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1654  				ret = spi_nor_wait_till_ready(nor);
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1655  				if (ret)
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1656  					goto erase_err;
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1657  
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1658  				ret = spi_nor_write_enable(nor);
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1659  				if (ret)
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1660  					goto erase_err;
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1661  
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1662  				ret = spi_nor_erase_sector(nor, offset);
c67cbb839da9cc drivers/mtd/spi-nor/spi-nor.c Brian Norris           2015-11-10  1663  				if (ret)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1664  					goto erase_err;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1665  
dfa9c0cba4ea20 drivers/mtd/spi-nor/spi-nor.c Brian Norris           2014-08-06  1666  				ret = spi_nor_wait_till_ready(nor);
dfa9c0cba4ea20 drivers/mtd/spi-nor/spi-nor.c Brian Norris           2014-08-06  1667  				if (ret)
dfa9c0cba4ea20 drivers/mtd/spi-nor/spi-nor.c Brian Norris           2014-08-06  1668  					goto erase_err;
786a0a75d0f34a drivers/mtd/spi-nor/core.c    Tudor Ambarus          2021-03-06  1669  
786a0a75d0f34a drivers/mtd/spi-nor/core.c    Tudor Ambarus          2021-03-06  1670  				addr += mtd->erasesize;
786a0a75d0f34a drivers/mtd/spi-nor/core.c    Tudor Ambarus          2021-03-06  1671  				len -= mtd->erasesize;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1672  
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1673  				/*
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1674  				 * Flash cross over condition in stacked mode.
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1675  				 */
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1676  				if ((nor->flags & SNOR_F_HAS_STACKED) && (addr > sz - 1)) {
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1677  					cur_cs_num++;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1678  					params = spi_nor_get_params(nor, cur_cs_num);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1679  					sz += params->size;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1680  				}
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1681  			}
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2018-09-11  1682  
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2018-09-11  1683  		/* erase multiple sectors */
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2018-09-11  1684  		} else {
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1685  			u64 erase_len = 0;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1686  
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1687  			/* Determine the flash from which the operation need to start */
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1688  			while ((cur_cs_num < SNOR_FLASH_CNT_MAX) &&
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1689  			       (addr > sz - 1) && params) {
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1690  				cur_cs_num++;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1691  				params = spi_nor_get_params(nor, cur_cs_num);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1692  				sz += params->size;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1693  			}
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1694  			/* perform multi sector erase onec per Flash*/
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1695  			while (len) {
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1696  				erase_len = (len > (sz - addr)) ? (sz - addr) : len;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1697  				offset = addr;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1698  				nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1699  				if (nor->flags & SNOR_F_HAS_STACKED) {
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1700  					params = spi_nor_get_params(nor, cur_cs_num);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1701  					offset -= (sz - params->size);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1702  				}
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1703  				ret = spi_nor_erase_multi_sectors(nor, offset, erase_len);
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2018-09-11  1704  				if (ret)
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2018-09-11  1705  					goto erase_err;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1706  				len -= erase_len;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1707  				addr += erase_len;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1708  				params = spi_nor_get_params(nor, cur_cs_num);
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1709  				sz += params->size;
e500b96b4c8a5c drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1710  			}
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1711  		}
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1712  	} else {
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1713  		nor->spimem->spi->cs_index_mask = SPI_NOR_ENABLE_MULTI_CS;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1714  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1715  		/* whole-chip erase? */
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1716  		if (len == mtd->size && !(nor->flags &
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1717  					  SNOR_F_NO_OP_CHIP_ERASE)) {
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1718  			unsigned long timeout;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1719  
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1720  			ret = spi_nor_write_enable(nor);
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1721  			if (ret)
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1722  				goto erase_err;
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1723  
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1724  			if (nor->addr_nbytes == 3) {
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1725  				/* Update Extended Address Register */
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18 @1726  				ret = spi_nor_write_ear(nor, offset);
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1727  				if (ret)
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1728  					goto erase_err;
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1729  			}
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1730  			ret = spi_nor_wait_till_ready(nor);
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1731  			if (ret)
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1732  				goto erase_err;
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1733  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1734  			ret = spi_nor_write_enable(nor);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1735  			if (ret)
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1736  				goto erase_err;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1737  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1738  			ret = spi_nor_erase_chip(nor);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1739  			if (ret)
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1740  				goto erase_err;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1741  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1742  			/*
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1743  			 * Scale the timeout linearly with the size of the flash, with
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1744  			 * a minimum calibrated to an old 2MB flash. We could try to
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1745  			 * pull these from CFI/SFDP, but these values should be good
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1746  			 * enough for now.
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1747  			 */
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1748  			timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1749  				      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1750  				      (unsigned long)(mtd->size / SZ_2M));
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1751  			ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1752  			if (ret)
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1753  				goto erase_err;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1754  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1755  		/* REVISIT in some cases we could speed up erasing large regions
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1756  		 * by using SPINOR_OP_SE instead of SPINOR_OP_BE_4K.  We may have set up
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1757  		 * to use "small sector erase", but that's not always optimal.
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1758  		 */
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1759  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1760  		/* "sector"-at-a-time erase */
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1761  		} else if (spi_nor_has_uniform_erase(nor)) {
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1762  			while (len) {
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1763  				ret = spi_nor_write_enable(nor);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1764  				if (ret)
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1765  					goto erase_err;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1766  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1767  				offset = addr / 2;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1768  
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1769  				if (nor->addr_nbytes == 3) {
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1770  					/* Update Extended Address Register */
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1771  					ret = spi_nor_write_ear(nor, offset);
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1772  					if (ret)
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1773  						goto erase_err;
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1774  				}
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1775  				ret = spi_nor_wait_till_ready(nor);
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1776  				if (ret)
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1777  					goto erase_err;
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1778  
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1779  				ret = spi_nor_write_enable(nor);
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1780  				if (ret)
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1781  					goto erase_err;
5fee19c6329ff5 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1782  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1783  				ret = spi_nor_erase_sector(nor, offset);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1784  				if (ret)
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1785  					goto erase_err;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1786  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1787  				ret = spi_nor_wait_till_ready(nor);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1788  				if (ret)
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1789  					goto erase_err;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1790  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1791  				addr += mtd->erasesize;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1792  				len -= mtd->erasesize;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1793  			}
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1794  
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1795  		/* erase multiple sectors */
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1796  		} else {
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1797  			offset = addr / 2;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1798  			ret = spi_nor_erase_multi_sectors(nor, offset, len);
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1799  			if (ret)
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1800  				goto erase_err;
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1801  		}
8a6272094c8dab drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra   2023-01-18  1802  	}
bce679e5ae3a38 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus          2019-11-02  1803  	ret = spi_nor_write_disable(nor);
05241aead9b98c drivers/mtd/spi-nor/spi-nor.c Brian Norris           2014-11-05  1804  
d6af26944a02e6 drivers/mtd/spi-nor/spi-nor.c Heiner Kallweit        2015-11-17  1805  erase_err:
52bbd2dcb42c21 drivers/mtd/spi-nor/spi-nor.c Michael Walle          2020-01-13  1806  	spi_nor_unlock_and_unprep(nor);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1807  
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1808  	return ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1809  }
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie           2014-02-24  1810  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
