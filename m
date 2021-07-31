Content-Type: multipart/mixed; boundary="===============0080982790506430172=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/block/null_blk/main.c:1885:2: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Sat, 31 Jul 2021 13:40:12 +0800
Message-ID: <202107311353.6SsFDzKs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0080982790506430172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Damien Le Moal <damien.lemoal@wdc.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c7d102232649226a69dddd58a4942cf13cff4f7c
commit: eebf34a85c8c724676eba502d15202854f199b05 null_blk: Move driver into=
 its own directory
date:   8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 months ago
compiler: powerpc-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/block/null_blk/main.c:1885:2: warning: %d in format string (no. =
1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfAr=
gType_sint]
    sprintf(nullb->disk_name, "nullb%d", nullb->index);
    ^

vim +1885 drivers/block/null_blk/main.c

93b570464cce007 drivers/block/null_blk.c      Jens Axboe        2018-01-10 =
 1794  =

2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1795  static int null_add_dev(struct nullb_device *dev)
9ae2d0aa5046c67 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2016-0=
9-16  1796  {
9ae2d0aa5046c67 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2016-0=
9-16  1797  	struct nullb *nullb;
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02 =
 1798  	int rv;
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1799  =

5c4bd1f40c23d08 drivers/block/null_blk_main.c Damien Le Moal    2019-12-03 =
 1800  	rv =3D null_validate_conf(dev);
5c4bd1f40c23d08 drivers/block/null_blk_main.c Damien Le Moal    2019-12-03 =
 1801  	if (rv)
5c4bd1f40c23d08 drivers/block/null_blk_main.c Damien Le Moal    2019-12-03 =
 1802  		return rv;
cedcafad8277b3a drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1803  =

2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1804  	nullb =3D kzalloc_node(sizeof(*nullb), GFP_KERNEL, dev->home_node);
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02 =
 1805  	if (!nullb) {
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02 =
 1806  		rv =3D -ENOMEM;
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1807  		goto out;
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02 =
 1808  	}
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1809  	nullb->dev =3D dev;
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1810  	dev->nullb =3D nullb;
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1811  =

f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1812  	spin_lock_init(&nullb->lock);
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1813  =

dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02 =
 1814  	rv =3D setup_queues(nullb);
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02 =
 1815  	if (rv)
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1816  		goto out_free_nullb;
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1817  =

2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1818  	if (dev->queue_mode =3D=3D NULL_Q_MQ) {
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20 =
 1819  		if (shared_tags) {
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20 =
 1820  			nullb->tag_set =3D &tag_set;
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20 =
 1821  			rv =3D 0;
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20 =
 1822  		} else {
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20 =
 1823  			nullb->tag_set =3D &nullb->__tag_set;
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1824  			rv =3D null_init_tag_set(nullb, nullb->tag_set);
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20 =
 1825  		}
db5bcf87bb9e856 drivers/block/null_blk.c      Jens Axboe        2017-03-30 =
 1826  =

dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02 =
 1827  		if (rv)
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1828  			goto out_cleanup_queues;
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1829  =

93b570464cce007 drivers/block/null_blk.c      Jens Axboe        2018-01-10 =
 1830  		if (!null_setup_fault())
93b570464cce007 drivers/block/null_blk.c      Jens Axboe        2018-01-10 =
 1831  			goto out_cleanup_queues;
93b570464cce007 drivers/block/null_blk.c      Jens Axboe        2018-01-10 =
 1832  =

5448aca41cd58e1 drivers/block/null_blk.c      Jens Axboe        2018-01-09 =
 1833  		nullb->tag_set->timeout =3D 5 * HZ;
8d96a1117c21faa drivers/block/null_blk_main.c Christoph Hellwig 2020-03-27 =
 1834  		nullb->q =3D blk_mq_init_queue_data(nullb->tag_set, nullb);
35b489d32fcc37e drivers/block/null_blk.c      Ming Lei          2015-01-02 =
 1835  		if (IS_ERR(nullb->q)) {
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02 =
 1836  			rv =3D -ENOMEM;
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1837  			goto out_cleanup_tags;
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02 =
 1838  		}
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1839  	} else if (dev->queue_mode =3D=3D NULL_Q_BIO) {
c62b37d96b6eb3e drivers/block/null_blk_main.c Christoph Hellwig 2020-07-01 =
 1840  		nullb->q =3D blk_alloc_queue(dev->home_node);
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02 =
 1841  		if (!nullb->q) {
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02 =
 1842  			rv =3D -ENOMEM;
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1843  			goto out_cleanup_queues;
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02 =
 1844  		}
31f9690e6eaf549 drivers/block/null_blk.c      Jan Kara          2014-10-22 =
 1845  		rv =3D init_driver_queues(nullb);
31f9690e6eaf549 drivers/block/null_blk.c      Jan Kara          2014-10-22 =
 1846  		if (rv)
31f9690e6eaf549 drivers/block/null_blk.c      Jan Kara          2014-10-22 =
 1847  			goto out_cleanup_blk_queue;
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1848  	}
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1849  =

eff2c4f108735dd drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1850  	if (dev->mbps) {
eff2c4f108735dd drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1851  		set_bit(NULLB_DEV_FL_THROTTLED, &dev->flags);
eff2c4f108735dd drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1852  		nullb_setup_bwtimer(nullb);
eff2c4f108735dd drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1853  	}
eff2c4f108735dd drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1854  =

deb78b419dfda33 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1855  	if (dev->cache_size > 0) {
deb78b419dfda33 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1856  		set_bit(NULLB_DEV_FL_CACHE, &nullb->dev->flags);
deb78b419dfda33 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1857  		blk_queue_write_cache(nullb->q, true, true);
deb78b419dfda33 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1858  	}
deb78b419dfda33 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1859  =

ca4b2a011948fae drivers/block/null_blk.c      Matias Bj=C3=B8rling   2018-0=
7-06  1860  	if (dev->zoned) {
d205bde78fa53e1 drivers/block/null_blk_main.c Damien Le Moal    2020-04-23 =
 1861  		rv =3D null_init_zoned_dev(dev, nullb->q);
ca4b2a011948fae drivers/block/null_blk.c      Matias Bj=C3=B8rling   2018-0=
7-06  1862  		if (rv)
ca4b2a011948fae drivers/block/null_blk.c      Matias Bj=C3=B8rling   2018-0=
7-06  1863  			goto out_cleanup_blk_queue;
ca4b2a011948fae drivers/block/null_blk.c      Matias Bj=C3=B8rling   2018-0=
7-06  1864  	}
ca4b2a011948fae drivers/block/null_blk.c      Matias Bj=C3=B8rling   2018-0=
7-06  1865  =

f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1866  	nullb->q->queuedata =3D nullb;
8b904b5b6b58b9a drivers/block/null_blk.c      Bart Van Assche   2018-03-07 =
 1867  	blk_queue_flag_set(QUEUE_FLAG_NONROT, nullb->q);
8b904b5b6b58b9a drivers/block/null_blk.c      Bart Van Assche   2018-03-07 =
 1868  	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, nullb->q);
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1869  =

f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1870  	mutex_lock(&lock);
94bc02e30fb8d04 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1871  	nullb->index =3D ida_simple_get(&nullb_indexes, 0, 0, GFP_KERNEL);
cedcafad8277b3a drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1872  	dev->index =3D nullb->index;
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1873  	mutex_unlock(&lock);
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1874  =

2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1875  	blk_queue_logical_block_size(nullb->q, dev->blocksize);
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1876  	blk_queue_physical_block_size(nullb->q, dev->blocksize);
ea17fd354ca8afd drivers/block/null_blk_main.c Damien Le Moal    2020-11-20 =
 1877  	if (!dev->max_sectors)
ea17fd354ca8afd drivers/block/null_blk_main.c Damien Le Moal    2020-11-20 =
 1878  		dev->max_sectors =3D queue_max_hw_sectors(nullb->q);
ea17fd354ca8afd drivers/block/null_blk_main.c Damien Le Moal    2020-11-20 =
 1879  	dev->max_sectors =3D min_t(unsigned int, dev->max_sectors,
ea17fd354ca8afd drivers/block/null_blk_main.c Damien Le Moal    2020-11-20 =
 1880  				 BLK_DEF_MAX_SECTORS);
ea17fd354ca8afd drivers/block/null_blk_main.c Damien Le Moal    2020-11-20 =
 1881  	blk_queue_max_hw_sectors(nullb->q, dev->max_sectors);
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1882  =

306eb6b4ad4f2d5 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1883  	null_config_discard(nullb);
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1884  =

b2b7e00148a203e drivers/block/null_blk.c      Matias Bj=C3=B8rling   2015-1=
1-12 @1885  	sprintf(nullb->disk_name, "nullb%d", nullb->index);
b2b7e00148a203e drivers/block/null_blk.c      Matias Bj=C3=B8rling   2015-1=
1-12  1886  =

9ae2d0aa5046c67 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2016-0=
9-16  1887  	rv =3D null_gendisk_register(nullb);
b2b7e00148a203e drivers/block/null_blk.c      Matias Bj=C3=B8rling   2015-1=
1-12  1888  	if (rv)
ca4b2a011948fae drivers/block/null_blk.c      Matias Bj=C3=B8rling   2018-0=
7-06  1889  		goto out_cleanup_zone;
b2b7e00148a203e drivers/block/null_blk.c      Matias Bj=C3=B8rling   2015-1=
1-12  1890  =

a514379b0c77085 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2016-0=
2-11  1891  	mutex_lock(&lock);
a514379b0c77085 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2016-0=
2-11  1892  	list_add_tail(&nullb->list, &nullb_list);
a514379b0c77085 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2016-0=
2-11  1893  	mutex_unlock(&lock);
3681c85dffda70e drivers/block/null_blk.c      Wenwei Tao        2016-03-05 =
 1894  =

f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1895  	return 0;
ca4b2a011948fae drivers/block/null_blk.c      Matias Bj=C3=B8rling   2018-0=
7-06  1896  out_cleanup_zone:
d205bde78fa53e1 drivers/block/null_blk_main.c Damien Le Moal    2020-04-23 =
 1897  	null_free_zoned_dev(dev);
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1898  out_cleanup_blk_queue:
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1899  	blk_cleanup_queue(nullb->q);
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1900  out_cleanup_tags:
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14 =
 1901  	if (dev->queue_mode =3D=3D NULL_Q_MQ && nullb->tag_set =3D=3D &null=
b->__tag_set)
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20 =
 1902  		blk_mq_free_tag_set(nullb->tag_set);
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1903  out_cleanup_queues:
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1904  	cleanup_queues(nullb);
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1905  out_free_nullb:
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1906  	kfree(nullb);
2004bfdef945fe5 drivers/block/null_blk_main.c Bart Van Assche   2020-03-09 =
 1907  	dev->nullb =3D NULL;
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15 =
 1908  out:
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02 =
 1909  	return rv;
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1910  }
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25 =
 1911  =


:::::: The code at line 1885 was first introduced by commit
:::::: b2b7e00148a203e9934bbd17aebffae3f447ade7 null_blk: register as a Lig=
htNVM device

:::::: TO: Matias Bj=C3=B8rling <m@bjorling.me>
:::::: CC: Jens Axboe <axboe@fb.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0080982790506430172==--

