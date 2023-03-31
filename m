Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03EA3C0C
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Mar 2023 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680275985; x=1711811985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CpOgHvVIgHrd4v0VJUVM47fdfsLCuy3Tar3Ax8MI8Yw=;
  b=OtqBT0fWPypPT0cc2VM3AUz25gzCc6U2DDPzWedjDTjhaXnyGQ3vDa2v
   EBOGYxSO1yhkA8PVhYEyRNM3CG600QWi+4mi525Nx0xyzqJ7kiNwFVUx0
   JmMy2aThuD4YPHBD6tLG+1J4ULuw60hrGnxxnF/4eBEKu5RdW9Dabso1j
   iaqClhqFrmfS088aCTgnt6rSI50yWAT+sEqH67NDYSRnPp3I7j46SAaej
   S1r+al9LFgQdnsk1yV/IcaHoRPk5Ph6YnyupbtHol1sf3HLXJzVHRFDBq
   KIlpeOktMNFhG+5YBxFmJkr7blVcqYdqAbghmch52aJBCA/6n0ongMa64
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="340201923"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="340201923"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 08:19:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="796160252"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="796160252"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Mar 2023 08:19:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piGXW-000Lu1-3C;
	Fri, 31 Mar 2023 15:19:43 +0000
Date: Fri, 31 Mar 2023 23:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/base/regmap/regmap.c:1966:19: warning: Redundant condition:
 !map->bus. 'map->bus || (!map->bus && map->read)' is equivalent to 'map->bus
 || map->read' [redundantCondition]
Message-ID: <202303312317.wJQHog2d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/base/regmap/regmap.c:1966:19: warning: Redundant condition: !map->bus. 'map->bus || (!map->bus && map->read)' is equivalent to 'map->bus || map->read' [redundantCondition]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marek Vasut <marex@denx.de>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62bad54b26db8bc98e28749cd76b2d890edb4258
commit: d77e745613680c54708470402e2b623dcd769681 regmap: Add bulk read/write callbacks into regmap_config
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d77e745613680c54708470402e2b623dcd769681
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303312317.wJQHog2d-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/base/regmap/regmap.c:1966:19: warning: Redundant condition: !map->bus. 'map->bus || (!map->bus && map->read)' is equivalent to 'map->bus || map->read' [redundantCondition]
    return (map->bus || (!map->bus && map->read)) ? map : map->bus_context;
                     ^
>> drivers/base/regmap/regmap.c:1838:7: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
     ret = map->write(map->bus_context, map->work_buf,
         ^
   drivers/base/regmap/regmap.c:1685:10: note: ret is initialized
    int ret = -ENOTSUPP;
            ^
   drivers/base/regmap/regmap.c:1838:7: note: ret is overwritten
     ret = map->write(map->bus_context, map->work_buf,
         ^

vim +1966 drivers/base/regmap/regmap.c

f50e38c9966076 Tony Lindgren       2016-09-15  1676  
7ef2c6b8689a08 Charles Keepax      2018-02-22  1677  static int _regmap_raw_write_impl(struct regmap *map, unsigned int reg,
05669b63170771 Dmitry Baryshkov    2020-09-17  1678  				  const void *val, size_t val_len, bool noinc)
b83a313bf25201 Mark Brown          2011-05-11  1679  {
98bc7dfd76407e Mark Brown          2012-10-04  1680  	struct regmap_range_node *range;
0d509f2b112b21 Mark Brown          2013-01-27  1681  	unsigned long flags;
0d509f2b112b21 Mark Brown          2013-01-27  1682  	void *work_val = map->work_buf + map->format.reg_bytes +
0d509f2b112b21 Mark Brown          2013-01-27  1683  		map->format.pad_bytes;
b83a313bf25201 Mark Brown          2011-05-11  1684  	void *buf;
b83a313bf25201 Mark Brown          2011-05-11  1685  	int ret = -ENOTSUPP;
b83a313bf25201 Mark Brown          2011-05-11  1686  	size_t len;
73304781274200 Mark Brown          2011-07-24  1687  	int i;
73304781274200 Mark Brown          2011-07-24  1688  
2e31aab08bad0d Ben Whitten         2020-01-18  1689  	/* Check for unwritable or noinc registers in range
2e31aab08bad0d Ben Whitten         2020-01-18  1690  	 * before we start
2e31aab08bad0d Ben Whitten         2020-01-18  1691  	 */
2e31aab08bad0d Ben Whitten         2020-01-18  1692  	if (!regmap_writeable_noinc(map, reg)) {
2e31aab08bad0d Ben Whitten         2020-01-18  1693  		for (i = 0; i < val_len / map->format.val_bytes; i++) {
2e31aab08bad0d Ben Whitten         2020-01-18  1694  			unsigned int element =
2e31aab08bad0d Ben Whitten         2020-01-18  1695  				reg + regmap_get_offset(map, i);
2e31aab08bad0d Ben Whitten         2020-01-18  1696  			if (!regmap_writeable(map, element) ||
2e31aab08bad0d Ben Whitten         2020-01-18  1697  				regmap_writeable_noinc(map, element))
73304781274200 Mark Brown          2011-07-24  1698  				return -EINVAL;
2e31aab08bad0d Ben Whitten         2020-01-18  1699  		}
2e31aab08bad0d Ben Whitten         2020-01-18  1700  	}
b83a313bf25201 Mark Brown          2011-05-11  1701  
c9157198417076 Laxman Dewangan     2012-02-10  1702  	if (!map->cache_bypass && map->format.parse_val) {
c9157198417076 Laxman Dewangan     2012-02-10  1703  		unsigned int ival;
c9157198417076 Laxman Dewangan     2012-02-10  1704  		int val_bytes = map->format.val_bytes;
c9157198417076 Laxman Dewangan     2012-02-10  1705  		for (i = 0; i < val_len / val_bytes; i++) {
5a08d15602987b Stephen Warren      2013-03-20  1706  			ival = map->format.parse_val(val + (i * val_bytes));
ca747be22fa57b Xiubo Li            2016-01-04  1707  			ret = regcache_write(map,
ca747be22fa57b Xiubo Li            2016-01-04  1708  					     reg + regmap_get_offset(map, i),
f01ee60fffa4dc Stephen Warren      2012-04-09  1709  					     ival);
c9157198417076 Laxman Dewangan     2012-02-10  1710  			if (ret) {
c9157198417076 Laxman Dewangan     2012-02-10  1711  				dev_err(map->dev,
6d04b8ac575c38 Mark Brown          2012-10-26  1712  					"Error in caching of register: %x ret: %d\n",
1852f5ed358147 Jeongtae Park       2021-07-01  1713  					reg + regmap_get_offset(map, i), ret);
c9157198417076 Laxman Dewangan     2012-02-10  1714  				return ret;
c9157198417076 Laxman Dewangan     2012-02-10  1715  			}
c9157198417076 Laxman Dewangan     2012-02-10  1716  		}
c9157198417076 Laxman Dewangan     2012-02-10  1717  		if (map->cache_only) {
c9157198417076 Laxman Dewangan     2012-02-10  1718  			map->cache_dirty = true;
c9157198417076 Laxman Dewangan     2012-02-10  1719  			return 0;
c9157198417076 Laxman Dewangan     2012-02-10  1720  		}
c9157198417076 Laxman Dewangan     2012-02-10  1721  	}
c9157198417076 Laxman Dewangan     2012-02-10  1722  
98bc7dfd76407e Mark Brown          2012-10-04  1723  	range = _regmap_range_lookup(map, reg);
98bc7dfd76407e Mark Brown          2012-10-04  1724  	if (range) {
8a2ceac6617a67 Mark Brown          2012-10-04  1725  		int val_num = val_len / map->format.val_bytes;
8a2ceac6617a67 Mark Brown          2012-10-04  1726  		int win_offset = (reg - range->range_min) % range->window_len;
8a2ceac6617a67 Mark Brown          2012-10-04  1727  		int win_residue = range->window_len - win_offset;
8a2ceac6617a67 Mark Brown          2012-10-04  1728  
8a2ceac6617a67 Mark Brown          2012-10-04  1729  		/* If the write goes beyond the end of the window split it */
8a2ceac6617a67 Mark Brown          2012-10-04  1730  		while (val_num > win_residue) {
1a61cfe3445218 Fabio Estevam       2012-10-25  1731  			dev_dbg(map->dev, "Writing window %d/%zu\n",
8a2ceac6617a67 Mark Brown          2012-10-04  1732  				win_residue, val_len / map->format.val_bytes);
7ef2c6b8689a08 Charles Keepax      2018-02-22  1733  			ret = _regmap_raw_write_impl(map, reg, val,
7ef2c6b8689a08 Charles Keepax      2018-02-22  1734  						     win_residue *
05669b63170771 Dmitry Baryshkov    2020-09-17  1735  						     map->format.val_bytes, noinc);
8a2ceac6617a67 Mark Brown          2012-10-04  1736  			if (ret != 0)
8a2ceac6617a67 Mark Brown          2012-10-04  1737  				return ret;
8a2ceac6617a67 Mark Brown          2012-10-04  1738  
8a2ceac6617a67 Mark Brown          2012-10-04  1739  			reg += win_residue;
8a2ceac6617a67 Mark Brown          2012-10-04  1740  			val_num -= win_residue;
8a2ceac6617a67 Mark Brown          2012-10-04  1741  			val += win_residue * map->format.val_bytes;
8a2ceac6617a67 Mark Brown          2012-10-04  1742  			val_len -= win_residue * map->format.val_bytes;
8a2ceac6617a67 Mark Brown          2012-10-04  1743  
8a2ceac6617a67 Mark Brown          2012-10-04  1744  			win_offset = (reg - range->range_min) %
8a2ceac6617a67 Mark Brown          2012-10-04  1745  				range->window_len;
8a2ceac6617a67 Mark Brown          2012-10-04  1746  			win_residue = range->window_len - win_offset;
8a2ceac6617a67 Mark Brown          2012-10-04  1747  		}
8a2ceac6617a67 Mark Brown          2012-10-04  1748  
05669b63170771 Dmitry Baryshkov    2020-09-17  1749  		ret = _regmap_select_page(map, &reg, range, noinc ? 1 : val_num);
0ff3e62ff119f2 Mark Brown          2012-10-04  1750  		if (ret != 0)
6863ca6227598d Krystian Garbaciak  2012-06-15  1751  			return ret;
98bc7dfd76407e Mark Brown          2012-10-04  1752  	}
6863ca6227598d Krystian Garbaciak  2012-06-15  1753  
0074f3f2b1e43d Colin Foster        2022-03-13  1754  	reg += map->reg_base;
86fc59ef818beb Colin Foster        2022-03-13  1755  	reg >>= map->format.reg_downshift;
d939fb9a78b474 Marc Reilly         2012-03-16  1756  	map->format.format_reg(map->work_buf, reg, map->reg_shift);
f50e38c9966076 Tony Lindgren       2016-09-15  1757  	regmap_set_work_buf_flag_mask(map, map->format.reg_bytes,
f50e38c9966076 Tony Lindgren       2016-09-15  1758  				      map->write_flag_mask);
6f306441e97f8f Lars-Peter Clausen  2011-09-05  1759  
651e013e3ce6c0 Mark Brown          2013-10-08  1760  	/*
651e013e3ce6c0 Mark Brown          2013-10-08  1761  	 * Essentially all I/O mechanisms will be faster with a single
651e013e3ce6c0 Mark Brown          2013-10-08  1762  	 * buffer to write.  Since register syncs often generate raw
651e013e3ce6c0 Mark Brown          2013-10-08  1763  	 * writes of single registers optimise that case.
651e013e3ce6c0 Mark Brown          2013-10-08  1764  	 */
651e013e3ce6c0 Mark Brown          2013-10-08  1765  	if (val != work_val && val_len == map->format.val_bytes) {
651e013e3ce6c0 Mark Brown          2013-10-08  1766  		memcpy(work_val, val, map->format.val_bytes);
651e013e3ce6c0 Mark Brown          2013-10-08  1767  		val = work_val;
651e013e3ce6c0 Mark Brown          2013-10-08  1768  	}
651e013e3ce6c0 Mark Brown          2013-10-08  1769  
d77e745613680c Marek Vasut         2022-04-30  1770  	if (map->async && map->bus && map->bus->async_write) {
7e09a979404ed0 Mark Brown          2013-10-07  1771  		struct regmap_async *async;
0d509f2b112b21 Mark Brown          2013-01-27  1772  
c6b570d97c0e77 Philipp Zabel       2015-03-09  1773  		trace_regmap_async_write_start(map, reg, val_len);
fe7d4ccd1d7748 Mark Brown          2013-02-21  1774  
7e09a979404ed0 Mark Brown          2013-10-07  1775  		spin_lock_irqsave(&map->async_lock, flags);
7e09a979404ed0 Mark Brown          2013-10-07  1776  		async = list_first_entry_or_null(&map->async_free,
7e09a979404ed0 Mark Brown          2013-10-07  1777  						 struct regmap_async,
7e09a979404ed0 Mark Brown          2013-10-07  1778  						 list);
7e09a979404ed0 Mark Brown          2013-10-07  1779  		if (async)
7e09a979404ed0 Mark Brown          2013-10-07  1780  			list_del(&async->list);
7e09a979404ed0 Mark Brown          2013-10-07  1781  		spin_unlock_irqrestore(&map->async_lock, flags);
7e09a979404ed0 Mark Brown          2013-10-07  1782  
7e09a979404ed0 Mark Brown          2013-10-07  1783  		if (!async) {
7e09a979404ed0 Mark Brown          2013-10-07  1784  			async = map->bus->async_alloc();
7e09a979404ed0 Mark Brown          2013-10-07  1785  			if (!async)
7e09a979404ed0 Mark Brown          2013-10-07  1786  				return -ENOMEM;
7e09a979404ed0 Mark Brown          2013-10-07  1787  
0d509f2b112b21 Mark Brown          2013-01-27  1788  			async->work_buf = kzalloc(map->format.buf_size,
0d509f2b112b21 Mark Brown          2013-01-27  1789  						  GFP_KERNEL | GFP_DMA);
0d509f2b112b21 Mark Brown          2013-01-27  1790  			if (!async->work_buf) {
0d509f2b112b21 Mark Brown          2013-01-27  1791  				kfree(async);
0d509f2b112b21 Mark Brown          2013-01-27  1792  				return -ENOMEM;
0d509f2b112b21 Mark Brown          2013-01-27  1793  			}
7e09a979404ed0 Mark Brown          2013-10-07  1794  		}
0d509f2b112b21 Mark Brown          2013-01-27  1795  
0d509f2b112b21 Mark Brown          2013-01-27  1796  		async->map = map;
0d509f2b112b21 Mark Brown          2013-01-27  1797  
0d509f2b112b21 Mark Brown          2013-01-27  1798  		/* If the caller supplied the value we can use it safely. */
0d509f2b112b21 Mark Brown          2013-01-27  1799  		memcpy(async->work_buf, map->work_buf, map->format.pad_bytes +
0d509f2b112b21 Mark Brown          2013-01-27  1800  		       map->format.reg_bytes + map->format.val_bytes);
0d509f2b112b21 Mark Brown          2013-01-27  1801  
0d509f2b112b21 Mark Brown          2013-01-27  1802  		spin_lock_irqsave(&map->async_lock, flags);
0d509f2b112b21 Mark Brown          2013-01-27  1803  		list_add_tail(&async->list, &map->async_list);
0d509f2b112b21 Mark Brown          2013-01-27  1804  		spin_unlock_irqrestore(&map->async_lock, flags);
0d509f2b112b21 Mark Brown          2013-01-27  1805  
04c50ccf0dab02 Mark Brown          2013-10-10  1806  		if (val != work_val)
04c50ccf0dab02 Mark Brown          2013-10-10  1807  			ret = map->bus->async_write(map->bus_context,
04c50ccf0dab02 Mark Brown          2013-10-10  1808  						    async->work_buf,
0d509f2b112b21 Mark Brown          2013-01-27  1809  						    map->format.reg_bytes +
0d509f2b112b21 Mark Brown          2013-01-27  1810  						    map->format.pad_bytes,
0d509f2b112b21 Mark Brown          2013-01-27  1811  						    val, val_len, async);
04c50ccf0dab02 Mark Brown          2013-10-10  1812  		else
04c50ccf0dab02 Mark Brown          2013-10-10  1813  			ret = map->bus->async_write(map->bus_context,
04c50ccf0dab02 Mark Brown          2013-10-10  1814  						    async->work_buf,
04c50ccf0dab02 Mark Brown          2013-10-10  1815  						    map->format.reg_bytes +
04c50ccf0dab02 Mark Brown          2013-10-10  1816  						    map->format.pad_bytes +
04c50ccf0dab02 Mark Brown          2013-10-10  1817  						    val_len, NULL, 0, async);
0d509f2b112b21 Mark Brown          2013-01-27  1818  
0d509f2b112b21 Mark Brown          2013-01-27  1819  		if (ret != 0) {
0d509f2b112b21 Mark Brown          2013-01-27  1820  			dev_err(map->dev, "Failed to schedule write: %d\n",
0d509f2b112b21 Mark Brown          2013-01-27  1821  				ret);
0d509f2b112b21 Mark Brown          2013-01-27  1822  
0d509f2b112b21 Mark Brown          2013-01-27  1823  			spin_lock_irqsave(&map->async_lock, flags);
7e09a979404ed0 Mark Brown          2013-10-07  1824  			list_move(&async->list, &map->async_free);
0d509f2b112b21 Mark Brown          2013-01-27  1825  			spin_unlock_irqrestore(&map->async_lock, flags);
0d509f2b112b21 Mark Brown          2013-01-27  1826  		}
f951b6587b94df Mark Brown          2013-03-27  1827  
f951b6587b94df Mark Brown          2013-03-27  1828  		return ret;
0d509f2b112b21 Mark Brown          2013-01-27  1829  	}
0d509f2b112b21 Mark Brown          2013-01-27  1830  
c6b570d97c0e77 Philipp Zabel       2015-03-09  1831  	trace_regmap_hw_write_start(map, reg, val_len / map->format.val_bytes);
fb2736bbaee0e7 Mark Brown          2011-07-24  1832  
2547e201b3693f Mark Brown          2011-07-20  1833  	/* If we're doing a single register write we can probably just
2547e201b3693f Mark Brown          2011-07-20  1834  	 * send the work_buf directly, otherwise try to do a gather
2547e201b3693f Mark Brown          2011-07-20  1835  	 * write.
2547e201b3693f Mark Brown          2011-07-20  1836  	 */
0d509f2b112b21 Mark Brown          2013-01-27  1837  	if (val == work_val)
d77e745613680c Marek Vasut         2022-04-30 @1838  		ret = map->write(map->bus_context, map->work_buf,
82159ba8e6ef8c Mark Brown          2012-01-18  1839  				 map->format.reg_bytes +
82159ba8e6ef8c Mark Brown          2012-01-18  1840  				 map->format.pad_bytes +
82159ba8e6ef8c Mark Brown          2012-01-18  1841  				 val_len);
2547e201b3693f Mark Brown          2011-07-20  1842  	else if (map->bus->gather_write)
0135bbcc7a0cc0 Stephen Warren      2012-04-04  1843  		ret = map->bus->gather_write(map->bus_context, map->work_buf,
82159ba8e6ef8c Mark Brown          2012-01-18  1844  					     map->format.reg_bytes +
82159ba8e6ef8c Mark Brown          2012-01-18  1845  					     map->format.pad_bytes,
b83a313bf25201 Mark Brown          2011-05-11  1846  					     val, val_len);
db057679de3e9e Srinivas Kandagatla 2019-06-12  1847  	else
db057679de3e9e Srinivas Kandagatla 2019-06-12  1848  		ret = -ENOTSUPP;
b83a313bf25201 Mark Brown          2011-05-11  1849  
2547e201b3693f Mark Brown          2011-07-20  1850  	/* If that didn't work fall back on linearising by hand. */
b83a313bf25201 Mark Brown          2011-05-11  1851  	if (ret == -ENOTSUPP) {
82159ba8e6ef8c Mark Brown          2012-01-18  1852  		len = map->format.reg_bytes + map->format.pad_bytes + val_len;
82159ba8e6ef8c Mark Brown          2012-01-18  1853  		buf = kzalloc(len, GFP_KERNEL);
b83a313bf25201 Mark Brown          2011-05-11  1854  		if (!buf)
b83a313bf25201 Mark Brown          2011-05-11  1855  			return -ENOMEM;
b83a313bf25201 Mark Brown          2011-05-11  1856  
b83a313bf25201 Mark Brown          2011-05-11  1857  		memcpy(buf, map->work_buf, map->format.reg_bytes);
82159ba8e6ef8c Mark Brown          2012-01-18  1858  		memcpy(buf + map->format.reg_bytes + map->format.pad_bytes,
82159ba8e6ef8c Mark Brown          2012-01-18  1859  		       val, val_len);
d77e745613680c Marek Vasut         2022-04-30  1860  		ret = map->write(map->bus_context, buf, len);
b83a313bf25201 Mark Brown          2011-05-11  1861  
b83a313bf25201 Mark Brown          2011-05-11  1862  		kfree(buf);
815806e39bf6f7 Elaine Zhang        2016-08-18  1863  	} else if (ret != 0 && !map->cache_bypass && map->format.parse_val) {
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1864  		/* regcache_drop_region() takes lock that we already have,
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1865  		 * thus call map->cache_ops->drop() directly
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1866  		 */
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1867  		if (map->cache_ops && map->cache_ops->drop)
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1868  			map->cache_ops->drop(map, reg, reg + 1);
b83a313bf25201 Mark Brown          2011-05-11  1869  	}
b83a313bf25201 Mark Brown          2011-05-11  1870  
c6b570d97c0e77 Philipp Zabel       2015-03-09  1871  	trace_regmap_hw_write_done(map, reg, val_len / map->format.val_bytes);
fb2736bbaee0e7 Mark Brown          2011-07-24  1872  
b83a313bf25201 Mark Brown          2011-05-11  1873  	return ret;
b83a313bf25201 Mark Brown          2011-05-11  1874  }
b83a313bf25201 Mark Brown          2011-05-11  1875  
221ad7f2df7c54 Mark Brown          2013-03-26  1876  /**
221ad7f2df7c54 Mark Brown          2013-03-26  1877   * regmap_can_raw_write - Test if regmap_raw_write() is supported
221ad7f2df7c54 Mark Brown          2013-03-26  1878   *
221ad7f2df7c54 Mark Brown          2013-03-26  1879   * @map: Map to check.
221ad7f2df7c54 Mark Brown          2013-03-26  1880   */
221ad7f2df7c54 Mark Brown          2013-03-26  1881  bool regmap_can_raw_write(struct regmap *map)
221ad7f2df7c54 Mark Brown          2013-03-26  1882  {
07ea400e1b2672 Markus Pargmann     2015-08-12  1883  	return map->bus && map->bus->write && map->format.format_val &&
07ea400e1b2672 Markus Pargmann     2015-08-12  1884  		map->format.format_reg;
221ad7f2df7c54 Mark Brown          2013-03-26  1885  }
221ad7f2df7c54 Mark Brown          2013-03-26  1886  EXPORT_SYMBOL_GPL(regmap_can_raw_write);
221ad7f2df7c54 Mark Brown          2013-03-26  1887  
f50c9eb4e9304c Markus Pargmann     2015-08-30  1888  /**
f50c9eb4e9304c Markus Pargmann     2015-08-30  1889   * regmap_get_raw_read_max - Get the maximum size we can read
f50c9eb4e9304c Markus Pargmann     2015-08-30  1890   *
f50c9eb4e9304c Markus Pargmann     2015-08-30  1891   * @map: Map to check.
f50c9eb4e9304c Markus Pargmann     2015-08-30  1892   */
f50c9eb4e9304c Markus Pargmann     2015-08-30  1893  size_t regmap_get_raw_read_max(struct regmap *map)
f50c9eb4e9304c Markus Pargmann     2015-08-30  1894  {
f50c9eb4e9304c Markus Pargmann     2015-08-30  1895  	return map->max_raw_read;
f50c9eb4e9304c Markus Pargmann     2015-08-30  1896  }
f50c9eb4e9304c Markus Pargmann     2015-08-30  1897  EXPORT_SYMBOL_GPL(regmap_get_raw_read_max);
f50c9eb4e9304c Markus Pargmann     2015-08-30  1898  
f50c9eb4e9304c Markus Pargmann     2015-08-30  1899  /**
f50c9eb4e9304c Markus Pargmann     2015-08-30  1900   * regmap_get_raw_write_max - Get the maximum size we can read
f50c9eb4e9304c Markus Pargmann     2015-08-30  1901   *
f50c9eb4e9304c Markus Pargmann     2015-08-30  1902   * @map: Map to check.
f50c9eb4e9304c Markus Pargmann     2015-08-30  1903   */
f50c9eb4e9304c Markus Pargmann     2015-08-30  1904  size_t regmap_get_raw_write_max(struct regmap *map)
f50c9eb4e9304c Markus Pargmann     2015-08-30  1905  {
f50c9eb4e9304c Markus Pargmann     2015-08-30  1906  	return map->max_raw_write;
f50c9eb4e9304c Markus Pargmann     2015-08-30  1907  }
f50c9eb4e9304c Markus Pargmann     2015-08-30  1908  EXPORT_SYMBOL_GPL(regmap_get_raw_write_max);
f50c9eb4e9304c Markus Pargmann     2015-08-30  1909  
07c320dc31d757 Andrey Smirnov      2013-01-12  1910  static int _regmap_bus_formatted_write(void *context, unsigned int reg,
b83a313bf25201 Mark Brown          2011-05-11  1911  				       unsigned int val)
b83a313bf25201 Mark Brown          2011-05-11  1912  {
fb2736bbaee0e7 Mark Brown          2011-07-24  1913  	int ret;
07c320dc31d757 Andrey Smirnov      2013-01-12  1914  	struct regmap_range_node *range;
07c320dc31d757 Andrey Smirnov      2013-01-12  1915  	struct regmap *map = context;
1044c180de4ba4 Mark Brown          2012-07-06  1916  
d77e745613680c Marek Vasut         2022-04-30  1917  	WARN_ON(!map->format.format_write);
fb2736bbaee0e7 Mark Brown          2011-07-24  1918  
98bc7dfd76407e Mark Brown          2012-10-04  1919  	range = _regmap_range_lookup(map, reg);
98bc7dfd76407e Mark Brown          2012-10-04  1920  	if (range) {
98bc7dfd76407e Mark Brown          2012-10-04  1921  		ret = _regmap_select_page(map, &reg, range, 1);
0ff3e62ff119f2 Mark Brown          2012-10-04  1922  		if (ret != 0)
6863ca6227598d Krystian Garbaciak  2012-06-15  1923  			return ret;
98bc7dfd76407e Mark Brown          2012-10-04  1924  	}
6863ca6227598d Krystian Garbaciak  2012-06-15  1925  
0074f3f2b1e43d Colin Foster        2022-03-13  1926  	reg += map->reg_base;
86fc59ef818beb Colin Foster        2022-03-13  1927  	reg >>= map->format.reg_downshift;
b83a313bf25201 Mark Brown          2011-05-11  1928  	map->format.format_write(map, reg, val);
b83a313bf25201 Mark Brown          2011-05-11  1929  
c6b570d97c0e77 Philipp Zabel       2015-03-09  1930  	trace_regmap_hw_write_start(map, reg, 1);
fb2736bbaee0e7 Mark Brown          2011-07-24  1931  
d77e745613680c Marek Vasut         2022-04-30  1932  	ret = map->write(map->bus_context, map->work_buf, map->format.buf_size);
fb2736bbaee0e7 Mark Brown          2011-07-24  1933  
c6b570d97c0e77 Philipp Zabel       2015-03-09  1934  	trace_regmap_hw_write_done(map, reg, 1);
fb2736bbaee0e7 Mark Brown          2011-07-24  1935  
fb2736bbaee0e7 Mark Brown          2011-07-24  1936  	return ret;
07c320dc31d757 Andrey Smirnov      2013-01-12  1937  }
07c320dc31d757 Andrey Smirnov      2013-01-12  1938  
3ac170376f2c51 Boris Brezillon     2014-04-17  1939  static int _regmap_bus_reg_write(void *context, unsigned int reg,
3ac170376f2c51 Boris Brezillon     2014-04-17  1940  				 unsigned int val)
3ac170376f2c51 Boris Brezillon     2014-04-17  1941  {
3ac170376f2c51 Boris Brezillon     2014-04-17  1942  	struct regmap *map = context;
3ac170376f2c51 Boris Brezillon     2014-04-17  1943  
3ac170376f2c51 Boris Brezillon     2014-04-17  1944  	return map->bus->reg_write(map->bus_context, reg, val);
3ac170376f2c51 Boris Brezillon     2014-04-17  1945  }
3ac170376f2c51 Boris Brezillon     2014-04-17  1946  
07c320dc31d757 Andrey Smirnov      2013-01-12  1947  static int _regmap_bus_raw_write(void *context, unsigned int reg,
07c320dc31d757 Andrey Smirnov      2013-01-12  1948  				 unsigned int val)
07c320dc31d757 Andrey Smirnov      2013-01-12  1949  {
07c320dc31d757 Andrey Smirnov      2013-01-12  1950  	struct regmap *map = context;
07c320dc31d757 Andrey Smirnov      2013-01-12  1951  
d77e745613680c Marek Vasut         2022-04-30  1952  	WARN_ON(!map->format.format_val);
07c320dc31d757 Andrey Smirnov      2013-01-12  1953  
82159ba8e6ef8c Mark Brown          2012-01-18  1954  	map->format.format_val(map->work_buf + map->format.reg_bytes
d939fb9a78b474 Marc Reilly         2012-03-16  1955  			       + map->format.pad_bytes, val, 0);
7ef2c6b8689a08 Charles Keepax      2018-02-22  1956  	return _regmap_raw_write_impl(map, reg,
82159ba8e6ef8c Mark Brown          2012-01-18  1957  				      map->work_buf +
82159ba8e6ef8c Mark Brown          2012-01-18  1958  				      map->format.reg_bytes +
82159ba8e6ef8c Mark Brown          2012-01-18  1959  				      map->format.pad_bytes,
05669b63170771 Dmitry Baryshkov    2020-09-17  1960  				      map->format.val_bytes,
05669b63170771 Dmitry Baryshkov    2020-09-17  1961  				      false);
b83a313bf25201 Mark Brown          2011-05-11  1962  }
07c320dc31d757 Andrey Smirnov      2013-01-12  1963  
d2a5884a64161b Andrey Smirnov      2013-01-27  1964  static inline void *_regmap_map_get_context(struct regmap *map)
d2a5884a64161b Andrey Smirnov      2013-01-27  1965  {
d77e745613680c Marek Vasut         2022-04-30 @1966  	return (map->bus || (!map->bus && map->read)) ? map : map->bus_context;
d2a5884a64161b Andrey Smirnov      2013-01-27  1967  }
d2a5884a64161b Andrey Smirnov      2013-01-27  1968  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
