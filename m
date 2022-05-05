Content-Type: multipart/mixed; boundary="===============4696811980084653707=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-ci:20220430_marex_regmap_add_bulk_read_write_callbacks_into_regmap_config 1/1] drivers/base/regmap/regmap.c:1842 _regmap_raw_write_impl() error: we previously assumed 'map->bus' could be null (see line 1770)
Date: Fri, 06 May 2022 05:06:24 +0800
Message-ID: <202205060518.hir67qzc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4696811980084653707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Marek Vasut <marex@denx.de>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 2022=
0430_marex_regmap_add_bulk_read_write_callbacks_into_regmap_config
head:   d77e745613680c54708470402e2b623dcd769681
commit: d77e745613680c54708470402e2b623dcd769681 [1/1] regmap: Add bulk rea=
d/write callbacks into regmap_config
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: m68k-randconfig-m031-20220505 (https://download.01.org/0day-ci/arch=
ive/20220506/202205060518.hir67qzc-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/base/regmap/regmap.c:1842 _regmap_raw_write_impl() error: we previo=
usly assumed 'map->bus' could be null (see line 1770)

Old smatch warnings:
drivers/base/regmap/regmap.c:2092 _regmap_raw_write() error: uninitialized =
symbol 'ret'.
drivers/base/regmap/regmap.c:2876 regmap_raw_read() error: uninitialized sy=
mbol 'ret'.

vim +1842 drivers/base/regmap/regmap.c

f50e38c9966076 Tony Lindgren       2016-09-15  1676  =

7ef2c6b8689a08 Charles Keepax      2018-02-22  1677  static int _regmap_raw=
_write_impl(struct regmap *map, unsigned int reg,
05669b63170771 Dmitry Baryshkov    2020-09-17  1678  				  const void *val,=
 size_t val_len, bool noinc)
b83a313bf25201 Mark Brown          2011-05-11  1679  {
98bc7dfd76407e Mark Brown          2012-10-04  1680  	struct regmap_range_n=
ode *range;
0d509f2b112b21 Mark Brown          2013-01-27  1681  	unsigned long flags;
0d509f2b112b21 Mark Brown          2013-01-27  1682  	void *work_val =3D ma=
p->work_buf + map->format.reg_bytes +
0d509f2b112b21 Mark Brown          2013-01-27  1683  		map->format.pad_byte=
s;
b83a313bf25201 Mark Brown          2011-05-11  1684  	void *buf;
b83a313bf25201 Mark Brown          2011-05-11  1685  	int ret =3D -ENOTSUPP;
b83a313bf25201 Mark Brown          2011-05-11  1686  	size_t len;
73304781274200 Mark Brown          2011-07-24  1687  	int i;
73304781274200 Mark Brown          2011-07-24  1688  =

2e31aab08bad0d Ben Whitten         2020-01-18  1689  	/* Check for unwritab=
le or noinc registers in range
2e31aab08bad0d Ben Whitten         2020-01-18  1690  	 * before we start
2e31aab08bad0d Ben Whitten         2020-01-18  1691  	 */
2e31aab08bad0d Ben Whitten         2020-01-18  1692  	if (!regmap_writeable=
_noinc(map, reg)) {
2e31aab08bad0d Ben Whitten         2020-01-18  1693  		for (i =3D 0; i < va=
l_len / map->format.val_bytes; i++) {
2e31aab08bad0d Ben Whitten         2020-01-18  1694  			unsigned int elemen=
t =3D
2e31aab08bad0d Ben Whitten         2020-01-18  1695  				reg + regmap_get_o=
ffset(map, i);
2e31aab08bad0d Ben Whitten         2020-01-18  1696  			if (!regmap_writeab=
le(map, element) ||
2e31aab08bad0d Ben Whitten         2020-01-18  1697  				regmap_writeable_n=
oinc(map, element))
73304781274200 Mark Brown          2011-07-24  1698  				return -EINVAL;
2e31aab08bad0d Ben Whitten         2020-01-18  1699  		}
2e31aab08bad0d Ben Whitten         2020-01-18  1700  	}
b83a313bf25201 Mark Brown          2011-05-11  1701  =

c9157198417076 Laxman Dewangan     2012-02-10  1702  	if (!map->cache_bypas=
s && map->format.parse_val) {
c9157198417076 Laxman Dewangan     2012-02-10  1703  		unsigned int ival;
c9157198417076 Laxman Dewangan     2012-02-10  1704  		int val_bytes =3D ma=
p->format.val_bytes;
c9157198417076 Laxman Dewangan     2012-02-10  1705  		for (i =3D 0; i < va=
l_len / val_bytes; i++) {
5a08d15602987b Stephen Warren      2013-03-20  1706  			ival =3D map->forma=
t.parse_val(val + (i * val_bytes));
ca747be22fa57b Xiubo Li            2016-01-04  1707  			ret =3D regcache_wr=
ite(map,
ca747be22fa57b Xiubo Li            2016-01-04  1708  					     reg + regmap=
_get_offset(map, i),
f01ee60fffa4dc Stephen Warren      2012-04-09  1709  					     ival);
c9157198417076 Laxman Dewangan     2012-02-10  1710  			if (ret) {
c9157198417076 Laxman Dewangan     2012-02-10  1711  				dev_err(map->dev,
6d04b8ac575c38 Mark Brown          2012-10-26  1712  					"Error in caching=
 of register: %x ret: %d\n",
1852f5ed358147 Jeongtae Park       2021-07-01  1713  					reg + regmap_get_=
offset(map, i), ret);
c9157198417076 Laxman Dewangan     2012-02-10  1714  				return ret;
c9157198417076 Laxman Dewangan     2012-02-10  1715  			}
c9157198417076 Laxman Dewangan     2012-02-10  1716  		}
c9157198417076 Laxman Dewangan     2012-02-10  1717  		if (map->cache_only)=
 {
c9157198417076 Laxman Dewangan     2012-02-10  1718  			map->cache_dirty =
=3D true;
c9157198417076 Laxman Dewangan     2012-02-10  1719  			return 0;
c9157198417076 Laxman Dewangan     2012-02-10  1720  		}
c9157198417076 Laxman Dewangan     2012-02-10  1721  	}
c9157198417076 Laxman Dewangan     2012-02-10  1722  =

98bc7dfd76407e Mark Brown          2012-10-04  1723  	range =3D _regmap_ran=
ge_lookup(map, reg);
98bc7dfd76407e Mark Brown          2012-10-04  1724  	if (range) {
8a2ceac6617a67 Mark Brown          2012-10-04  1725  		int val_num =3D val_=
len / map->format.val_bytes;
8a2ceac6617a67 Mark Brown          2012-10-04  1726  		int win_offset =3D (=
reg - range->range_min) % range->window_len;
8a2ceac6617a67 Mark Brown          2012-10-04  1727  		int win_residue =3D =
range->window_len - win_offset;
8a2ceac6617a67 Mark Brown          2012-10-04  1728  =

8a2ceac6617a67 Mark Brown          2012-10-04  1729  		/* If the write goes=
 beyond the end of the window split it */
8a2ceac6617a67 Mark Brown          2012-10-04  1730  		while (val_num > win=
_residue) {
1a61cfe3445218 Fabio Estevam       2012-10-25  1731  			dev_dbg(map->dev, "=
Writing window %d/%zu\n",
8a2ceac6617a67 Mark Brown          2012-10-04  1732  				win_residue, val_l=
en / map->format.val_bytes);
7ef2c6b8689a08 Charles Keepax      2018-02-22  1733  			ret =3D _regmap_raw=
_write_impl(map, reg, val,
7ef2c6b8689a08 Charles Keepax      2018-02-22  1734  						     win_residue=
 *
05669b63170771 Dmitry Baryshkov    2020-09-17  1735  						     map->format=
.val_bytes, noinc);
8a2ceac6617a67 Mark Brown          2012-10-04  1736  			if (ret !=3D 0)
8a2ceac6617a67 Mark Brown          2012-10-04  1737  				return ret;
8a2ceac6617a67 Mark Brown          2012-10-04  1738  =

8a2ceac6617a67 Mark Brown          2012-10-04  1739  			reg +=3D win_residu=
e;
8a2ceac6617a67 Mark Brown          2012-10-04  1740  			val_num -=3D win_re=
sidue;
8a2ceac6617a67 Mark Brown          2012-10-04  1741  			val +=3D win_residu=
e * map->format.val_bytes;
8a2ceac6617a67 Mark Brown          2012-10-04  1742  			val_len -=3D win_re=
sidue * map->format.val_bytes;
8a2ceac6617a67 Mark Brown          2012-10-04  1743  =

8a2ceac6617a67 Mark Brown          2012-10-04  1744  			win_offset =3D (reg=
 - range->range_min) %
8a2ceac6617a67 Mark Brown          2012-10-04  1745  				range->window_len;
8a2ceac6617a67 Mark Brown          2012-10-04  1746  			win_residue =3D ran=
ge->window_len - win_offset;
8a2ceac6617a67 Mark Brown          2012-10-04  1747  		}
8a2ceac6617a67 Mark Brown          2012-10-04  1748  =

05669b63170771 Dmitry Baryshkov    2020-09-17  1749  		ret =3D _regmap_sele=
ct_page(map, &reg, range, noinc ? 1 : val_num);
0ff3e62ff119f2 Mark Brown          2012-10-04  1750  		if (ret !=3D 0)
6863ca6227598d Krystian Garbaciak  2012-06-15  1751  			return ret;
98bc7dfd76407e Mark Brown          2012-10-04  1752  	}
6863ca6227598d Krystian Garbaciak  2012-06-15  1753  =

0074f3f2b1e43d Colin Foster        2022-03-13  1754  	reg +=3D map->reg_bas=
e;
86fc59ef818beb Colin Foster        2022-03-13  1755  	reg >>=3D map->format=
.reg_downshift;
d939fb9a78b474 Marc Reilly         2012-03-16  1756  	map->format.format_re=
g(map->work_buf, reg, map->reg_shift);
f50e38c9966076 Tony Lindgren       2016-09-15  1757  	regmap_set_work_buf_f=
lag_mask(map, map->format.reg_bytes,
f50e38c9966076 Tony Lindgren       2016-09-15  1758  				      map->write_f=
lag_mask);
6f306441e97f8f Lars-Peter Clausen  2011-09-05  1759  =

651e013e3ce6c0 Mark Brown          2013-10-08  1760  	/*
651e013e3ce6c0 Mark Brown          2013-10-08  1761  	 * Essentially all I/=
O mechanisms will be faster with a single
651e013e3ce6c0 Mark Brown          2013-10-08  1762  	 * buffer to write.  =
Since register syncs often generate raw
651e013e3ce6c0 Mark Brown          2013-10-08  1763  	 * writes of single r=
egisters optimise that case.
651e013e3ce6c0 Mark Brown          2013-10-08  1764  	 */
651e013e3ce6c0 Mark Brown          2013-10-08  1765  	if (val !=3D work_val=
 && val_len =3D=3D map->format.val_bytes) {
651e013e3ce6c0 Mark Brown          2013-10-08  1766  		memcpy(work_val, val=
, map->format.val_bytes);
651e013e3ce6c0 Mark Brown          2013-10-08  1767  		val =3D work_val;
651e013e3ce6c0 Mark Brown          2013-10-08  1768  	}
651e013e3ce6c0 Mark Brown          2013-10-08  1769  =

d77e745613680c Marek Vasut         2022-04-30 @1770  	if (map->async && map=
->bus && map->bus->async_write) {
7e09a979404ed0 Mark Brown          2013-10-07  1771  		struct regmap_async =
*async;
0d509f2b112b21 Mark Brown          2013-01-27  1772  =

c6b570d97c0e77 Philipp Zabel       2015-03-09  1773  		trace_regmap_async_w=
rite_start(map, reg, val_len);
fe7d4ccd1d7748 Mark Brown          2013-02-21  1774  =

7e09a979404ed0 Mark Brown          2013-10-07  1775  		spin_lock_irqsave(&m=
ap->async_lock, flags);
7e09a979404ed0 Mark Brown          2013-10-07  1776  		async =3D list_first=
_entry_or_null(&map->async_free,
7e09a979404ed0 Mark Brown          2013-10-07  1777  						 struct regmap_a=
sync,
7e09a979404ed0 Mark Brown          2013-10-07  1778  						 list);
7e09a979404ed0 Mark Brown          2013-10-07  1779  		if (async)
7e09a979404ed0 Mark Brown          2013-10-07  1780  			list_del(&async->li=
st);
7e09a979404ed0 Mark Brown          2013-10-07  1781  		spin_unlock_irqresto=
re(&map->async_lock, flags);
7e09a979404ed0 Mark Brown          2013-10-07  1782  =

7e09a979404ed0 Mark Brown          2013-10-07  1783  		if (!async) {
7e09a979404ed0 Mark Brown          2013-10-07  1784  			async =3D map->bus-=
>async_alloc();
7e09a979404ed0 Mark Brown          2013-10-07  1785  			if (!async)
7e09a979404ed0 Mark Brown          2013-10-07  1786  				return -ENOMEM;
7e09a979404ed0 Mark Brown          2013-10-07  1787  =

0d509f2b112b21 Mark Brown          2013-01-27  1788  			async->work_buf =3D=
 kzalloc(map->format.buf_size,
0d509f2b112b21 Mark Brown          2013-01-27  1789  						  GFP_KERNEL | G=
FP_DMA);
0d509f2b112b21 Mark Brown          2013-01-27  1790  			if (!async->work_bu=
f) {
0d509f2b112b21 Mark Brown          2013-01-27  1791  				kfree(async);
0d509f2b112b21 Mark Brown          2013-01-27  1792  				return -ENOMEM;
0d509f2b112b21 Mark Brown          2013-01-27  1793  			}
7e09a979404ed0 Mark Brown          2013-10-07  1794  		}
0d509f2b112b21 Mark Brown          2013-01-27  1795  =

0d509f2b112b21 Mark Brown          2013-01-27  1796  		async->map =3D map;
0d509f2b112b21 Mark Brown          2013-01-27  1797  =

0d509f2b112b21 Mark Brown          2013-01-27  1798  		/* If the caller sup=
plied the value we can use it safely. */
0d509f2b112b21 Mark Brown          2013-01-27  1799  		memcpy(async->work_b=
uf, map->work_buf, map->format.pad_bytes +
0d509f2b112b21 Mark Brown          2013-01-27  1800  		       map->format.r=
eg_bytes + map->format.val_bytes);
0d509f2b112b21 Mark Brown          2013-01-27  1801  =

0d509f2b112b21 Mark Brown          2013-01-27  1802  		spin_lock_irqsave(&m=
ap->async_lock, flags);
0d509f2b112b21 Mark Brown          2013-01-27  1803  		list_add_tail(&async=
->list, &map->async_list);
0d509f2b112b21 Mark Brown          2013-01-27  1804  		spin_unlock_irqresto=
re(&map->async_lock, flags);
0d509f2b112b21 Mark Brown          2013-01-27  1805  =

04c50ccf0dab02 Mark Brown          2013-10-10  1806  		if (val !=3D work_va=
l)
04c50ccf0dab02 Mark Brown          2013-10-10  1807  			ret =3D map->bus->a=
sync_write(map->bus_context,
04c50ccf0dab02 Mark Brown          2013-10-10  1808  						    async->work_=
buf,
0d509f2b112b21 Mark Brown          2013-01-27  1809  						    map->format.=
reg_bytes +
0d509f2b112b21 Mark Brown          2013-01-27  1810  						    map->format.=
pad_bytes,
0d509f2b112b21 Mark Brown          2013-01-27  1811  						    val, val_len=
, async);
04c50ccf0dab02 Mark Brown          2013-10-10  1812  		else
04c50ccf0dab02 Mark Brown          2013-10-10  1813  			ret =3D map->bus->a=
sync_write(map->bus_context,
04c50ccf0dab02 Mark Brown          2013-10-10  1814  						    async->work_=
buf,
04c50ccf0dab02 Mark Brown          2013-10-10  1815  						    map->format.=
reg_bytes +
04c50ccf0dab02 Mark Brown          2013-10-10  1816  						    map->format.=
pad_bytes +
04c50ccf0dab02 Mark Brown          2013-10-10  1817  						    val_len, NUL=
L, 0, async);
0d509f2b112b21 Mark Brown          2013-01-27  1818  =

0d509f2b112b21 Mark Brown          2013-01-27  1819  		if (ret !=3D 0) {
0d509f2b112b21 Mark Brown          2013-01-27  1820  			dev_err(map->dev, "=
Failed to schedule write: %d\n",
0d509f2b112b21 Mark Brown          2013-01-27  1821  				ret);
0d509f2b112b21 Mark Brown          2013-01-27  1822  =

0d509f2b112b21 Mark Brown          2013-01-27  1823  			spin_lock_irqsave(&=
map->async_lock, flags);
7e09a979404ed0 Mark Brown          2013-10-07  1824  			list_move(&async->l=
ist, &map->async_free);
0d509f2b112b21 Mark Brown          2013-01-27  1825  			spin_unlock_irqrest=
ore(&map->async_lock, flags);
0d509f2b112b21 Mark Brown          2013-01-27  1826  		}
f951b6587b94df Mark Brown          2013-03-27  1827  =

f951b6587b94df Mark Brown          2013-03-27  1828  		return ret;
0d509f2b112b21 Mark Brown          2013-01-27  1829  	}
0d509f2b112b21 Mark Brown          2013-01-27  1830  =

c6b570d97c0e77 Philipp Zabel       2015-03-09  1831  	trace_regmap_hw_write=
_start(map, reg, val_len / map->format.val_bytes);
fb2736bbaee0e7 Mark Brown          2011-07-24  1832  =

2547e201b3693f Mark Brown          2011-07-20  1833  	/* If we're doing a s=
ingle register write we can probably just
2547e201b3693f Mark Brown          2011-07-20  1834  	 * send the work_buf =
directly, otherwise try to do a gather
2547e201b3693f Mark Brown          2011-07-20  1835  	 * write.
2547e201b3693f Mark Brown          2011-07-20  1836  	 */
0d509f2b112b21 Mark Brown          2013-01-27  1837  	if (val =3D=3D work_v=
al)
d77e745613680c Marek Vasut         2022-04-30  1838  		ret =3D map->write(m=
ap->bus_context, map->work_buf,
82159ba8e6ef8c Mark Brown          2012-01-18  1839  				 map->format.reg_b=
ytes +
82159ba8e6ef8c Mark Brown          2012-01-18  1840  				 map->format.pad_b=
ytes +
82159ba8e6ef8c Mark Brown          2012-01-18  1841  				 val_len);
2547e201b3693f Mark Brown          2011-07-20 @1842  	else if (map->bus->ga=
ther_write)
0135bbcc7a0cc0 Stephen Warren      2012-04-04  1843  		ret =3D map->bus->ga=
ther_write(map->bus_context, map->work_buf,
82159ba8e6ef8c Mark Brown          2012-01-18  1844  					     map->format.=
reg_bytes +
82159ba8e6ef8c Mark Brown          2012-01-18  1845  					     map->format.=
pad_bytes,
b83a313bf25201 Mark Brown          2011-05-11  1846  					     val, val_len=
);
db057679de3e9e Srinivas Kandagatla 2019-06-12  1847  	else
db057679de3e9e Srinivas Kandagatla 2019-06-12  1848  		ret =3D -ENOTSUPP;
b83a313bf25201 Mark Brown          2011-05-11  1849  =

2547e201b3693f Mark Brown          2011-07-20  1850  	/* If that didn't wor=
k fall back on linearising by hand. */
b83a313bf25201 Mark Brown          2011-05-11  1851  	if (ret =3D=3D -ENOTS=
UPP) {
82159ba8e6ef8c Mark Brown          2012-01-18  1852  		len =3D map->format.=
reg_bytes + map->format.pad_bytes + val_len;
82159ba8e6ef8c Mark Brown          2012-01-18  1853  		buf =3D kzalloc(len,=
 GFP_KERNEL);
b83a313bf25201 Mark Brown          2011-05-11  1854  		if (!buf)
b83a313bf25201 Mark Brown          2011-05-11  1855  			return -ENOMEM;
b83a313bf25201 Mark Brown          2011-05-11  1856  =

b83a313bf25201 Mark Brown          2011-05-11  1857  		memcpy(buf, map->wor=
k_buf, map->format.reg_bytes);
82159ba8e6ef8c Mark Brown          2012-01-18  1858  		memcpy(buf + map->fo=
rmat.reg_bytes + map->format.pad_bytes,
82159ba8e6ef8c Mark Brown          2012-01-18  1859  		       val, val_len);
d77e745613680c Marek Vasut         2022-04-30  1860  		ret =3D map->write(m=
ap->bus_context, buf, len);
b83a313bf25201 Mark Brown          2011-05-11  1861  =

b83a313bf25201 Mark Brown          2011-05-11  1862  		kfree(buf);
815806e39bf6f7 Elaine Zhang        2016-08-18  1863  	} else if (ret !=3D 0=
 && !map->cache_bypass && map->format.parse_val) {
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1864  		/* regcache_drop_reg=
ion() takes lock that we already have,
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1865  		 * thus call map->ca=
che_ops->drop() directly
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1866  		 */
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1867  		if (map->cache_ops &=
& map->cache_ops->drop)
f0aa1ce6259eb6 Nikita Yushchenko   2016-09-22  1868  			map->cache_ops->dro=
p(map, reg, reg + 1);
b83a313bf25201 Mark Brown          2011-05-11  1869  	}
b83a313bf25201 Mark Brown          2011-05-11  1870  =

c6b570d97c0e77 Philipp Zabel       2015-03-09  1871  	trace_regmap_hw_write=
_done(map, reg, val_len / map->format.val_bytes);
fb2736bbaee0e7 Mark Brown          2011-07-24  1872  =

b83a313bf25201 Mark Brown          2011-05-11  1873  	return ret;
b83a313bf25201 Mark Brown          2011-05-11  1874  }
b83a313bf25201 Mark Brown          2011-05-11  1875  =


:::::: The code at line 1842 was first introduced by commit
:::::: 2547e201b3693f91d643fc0d21ef86171894b59b regmap: Just send the buffe=
r directly for single register writes

:::::: TO: Mark Brown <broonie@opensource.wolfsonmicro.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4696811980084653707==--

