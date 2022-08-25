Content-Type: multipart/mixed; boundary="===============9033355063467395638=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/block/null_blk/main.c:2074:3: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Thu, 25 Aug 2022 15:43:50 +0800
Message-ID: <202208251538.v7DVW8bg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9033355063467395638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/b=
lock/null_blk/main.c:2074:3: warning: %d in format string (no. 1) requires =
'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c40e8341e3b3bb27e3a65b06b5b454626234c4f0
commit: 49c3b9266a718dbd73c42e004288b4bb2ea0ac0b block: null_blk: Improve d=
evice creation with configfs
date:   4 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 4 months ago
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 49c3b9266a718dbd73c42e004288b4bb2ea0ac0b
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/block/null_blk/main.c:1911:26: warning: The statement 'if (dev->=
submit_queues!=3Dnr_online_nodes) dev->submit_queues=3Dnr_online_nodes' is =
logically equivalent to 'dev->submit_queues=3Dnr_online_nodes'. [duplicateC=
onditionalAssign]
     if (dev->submit_queues !=3D nr_online_nodes)
                            ^
   drivers/block/null_blk/main.c:1912:23: note: Assignment 'dev->submit_que=
ues=3Dnr_online_nodes'
      dev->submit_queues =3D nr_online_nodes;
                         ^
   drivers/block/null_blk/main.c:1911:26: note: Condition 'dev->submit_queu=
es!=3Dnr_online_nodes' is redundant
     if (dev->submit_queues !=3D nr_online_nodes)
                            ^
>> drivers/block/null_blk/main.c:2074:3: warning: %d in format string (no. =
1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfAr=
gType_sint]
     sprintf(nullb->disk_name, "nullb%d", nullb->index);
     ^
>> drivers/block/null_blk/main.c:2111:12: warning: Uninitialized variables:=
 nb.dev, nb.list, nb.index, nb.q, nb.disk, nb.tag_set, nb.__tag_set, nb.que=
ue_depth, nb.cur_bytes, nb.bw_timer, nb.cache_flush_pos, nb.lock, nb.queues=
, nb.nr_queues [uninitvar]
      nullb =3D nb;
              ^

vim +2074 drivers/block/null_blk/main.c

93b570464cce00 drivers/block/null_blk.c      Jens Axboe        2018-01-10  =
1973  =

2984c8684f962c drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
1974  static int null_add_dev(struct nullb_device *dev)
9ae2d0aa5046c6 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2016-09=
-16  1975  {
9ae2d0aa5046c6 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2016-09=
-16  1976  	struct nullb *nullb;
dc501dc0d9dc9c drivers/block/null_blk.c      Robert Elliott    2014-09-02  =
1977  	int rv;
f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
1978  =

5c4bd1f40c23d0 drivers/block/null_blk_main.c Damien Le Moal    2019-12-03  =
1979  	rv =3D null_validate_conf(dev);
5c4bd1f40c23d0 drivers/block/null_blk_main.c Damien Le Moal    2019-12-03  =
1980  	if (rv)
5c4bd1f40c23d0 drivers/block/null_blk_main.c Damien Le Moal    2019-12-03  =
1981  		return rv;
cedcafad8277b3 drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
1982  =

2984c8684f962c drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
1983  	nullb =3D kzalloc_node(sizeof(*nullb), GFP_KERNEL, dev->home_node);
dc501dc0d9dc9c drivers/block/null_blk.c      Robert Elliott    2014-09-02  =
1984  	if (!nullb) {
dc501dc0d9dc9c drivers/block/null_blk.c      Robert Elliott    2014-09-02  =
1985  		rv =3D -ENOMEM;
24d2f90309b23f drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  =
1986  		goto out;
dc501dc0d9dc9c drivers/block/null_blk.c      Robert Elliott    2014-09-02  =
1987  	}
2984c8684f962c drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
1988  	nullb->dev =3D dev;
2984c8684f962c drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
1989  	dev->nullb =3D nullb;
f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
1990  =

f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
1991  	spin_lock_init(&nullb->lock);
f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
1992  =

dc501dc0d9dc9c drivers/block/null_blk.c      Robert Elliott    2014-09-02  =
1993  	rv =3D setup_queues(nullb);
dc501dc0d9dc9c drivers/block/null_blk.c      Robert Elliott    2014-09-02  =
1994  	if (rv)
24d2f90309b23f drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  =
1995  		goto out_free_nullb;
f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
1996  =

2984c8684f962c drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
1997  	if (dev->queue_mode =3D=3D NULL_Q_MQ) {
82f402fefa50f1 drivers/block/null_blk.c      Jens Axboe        2017-06-20  =
1998  		if (shared_tags) {
82f402fefa50f1 drivers/block/null_blk.c      Jens Axboe        2017-06-20  =
1999  			nullb->tag_set =3D &tag_set;
82f402fefa50f1 drivers/block/null_blk.c      Jens Axboe        2017-06-20  =
2000  			rv =3D 0;
82f402fefa50f1 drivers/block/null_blk.c      Jens Axboe        2017-06-20  =
2001  		} else {
82f402fefa50f1 drivers/block/null_blk.c      Jens Axboe        2017-06-20  =
2002  			nullb->tag_set =3D &nullb->__tag_set;
2984c8684f962c drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2003  			rv =3D null_init_tag_set(nullb, nullb->tag_set);
82f402fefa50f1 drivers/block/null_blk.c      Jens Axboe        2017-06-20  =
2004  		}
db5bcf87bb9e85 drivers/block/null_blk.c      Jens Axboe        2017-03-30  =
2005  =

dc501dc0d9dc9c drivers/block/null_blk.c      Robert Elliott    2014-09-02  =
2006  		if (rv)
24d2f90309b23f drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  =
2007  			goto out_cleanup_queues;
24d2f90309b23f drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  =
2008  =

93b570464cce00 drivers/block/null_blk.c      Jens Axboe        2018-01-10  =
2009  		if (!null_setup_fault())
132226b301b545 drivers/block/null_blk/main.c Christoph Hellwig 2021-05-21  =
2010  			goto out_cleanup_tags;
93b570464cce00 drivers/block/null_blk.c      Jens Axboe        2018-01-10  =
2011  =

5448aca41cd58e drivers/block/null_blk.c      Jens Axboe        2018-01-09  =
2012  		nullb->tag_set->timeout =3D 5 * HZ;
6759b1a2013ba6 drivers/block/null_blk/main.c Christoph Hellwig 2021-06-02  =
2013  		nullb->disk =3D blk_mq_alloc_disk(nullb->tag_set, nullb);
6759b1a2013ba6 drivers/block/null_blk/main.c Christoph Hellwig 2021-06-02  =
2014  		if (IS_ERR(nullb->disk)) {
6759b1a2013ba6 drivers/block/null_blk/main.c Christoph Hellwig 2021-06-02  =
2015  			rv =3D PTR_ERR(nullb->disk);
24d2f90309b23f drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  =
2016  			goto out_cleanup_tags;
6759b1a2013ba6 drivers/block/null_blk/main.c Christoph Hellwig 2021-06-02  =
2017  		}
6759b1a2013ba6 drivers/block/null_blk/main.c Christoph Hellwig 2021-06-02  =
2018  		nullb->q =3D nullb->disk->queue;
2984c8684f962c drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2019  	} else if (dev->queue_mode =3D=3D NULL_Q_BIO) {
dc501dc0d9dc9c drivers/block/null_blk.c      Robert Elliott    2014-09-02  =
2020  		rv =3D -ENOMEM;
132226b301b545 drivers/block/null_blk/main.c Christoph Hellwig 2021-05-21  =
2021  		nullb->disk =3D blk_alloc_disk(nullb->dev->home_node);
132226b301b545 drivers/block/null_blk/main.c Christoph Hellwig 2021-05-21  =
2022  		if (!nullb->disk)
24d2f90309b23f drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  =
2023  			goto out_cleanup_queues;
132226b301b545 drivers/block/null_blk/main.c Christoph Hellwig 2021-05-21  =
2024  =

132226b301b545 drivers/block/null_blk/main.c Christoph Hellwig 2021-05-21  =
2025  		nullb->q =3D nullb->disk->queue;
31f9690e6eaf54 drivers/block/null_blk.c      Jan Kara          2014-10-22  =
2026  		rv =3D init_driver_queues(nullb);
31f9690e6eaf54 drivers/block/null_blk.c      Jan Kara          2014-10-22  =
2027  		if (rv)
132226b301b545 drivers/block/null_blk/main.c Christoph Hellwig 2021-05-21  =
2028  			goto out_cleanup_disk;
f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
2029  	}
f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
2030  =

eff2c4f108735d drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2031  	if (dev->mbps) {
eff2c4f108735d drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2032  		set_bit(NULLB_DEV_FL_THROTTLED, &dev->flags);
eff2c4f108735d drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2033  		nullb_setup_bwtimer(nullb);
eff2c4f108735d drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2034  	}
eff2c4f108735d drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2035  =

deb78b419dfda3 drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2036  	if (dev->cache_size > 0) {
deb78b419dfda3 drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2037  		set_bit(NULLB_DEV_FL_CACHE, &nullb->dev->flags);
deb78b419dfda3 drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2038  		blk_queue_write_cache(nullb->q, true, true);
deb78b419dfda3 drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2039  	}
deb78b419dfda3 drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2040  =

ca4b2a011948fa drivers/block/null_blk.c      Matias Bj=C3=B8rling   2018-07=
-06  2041  	if (dev->zoned) {
d205bde78fa53e drivers/block/null_blk_main.c Damien Le Moal    2020-04-23  =
2042  		rv =3D null_init_zoned_dev(dev, nullb->q);
ca4b2a011948fa drivers/block/null_blk.c      Matias Bj=C3=B8rling   2018-07=
-06  2043  		if (rv)
132226b301b545 drivers/block/null_blk/main.c Christoph Hellwig 2021-05-21  =
2044  			goto out_cleanup_disk;
ca4b2a011948fa drivers/block/null_blk.c      Matias Bj=C3=B8rling   2018-07=
-06  2045  	}
ca4b2a011948fa drivers/block/null_blk.c      Matias Bj=C3=B8rling   2018-07=
-06  2046  =

f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
2047  	nullb->q->queuedata =3D nullb;
8b904b5b6b58b9 drivers/block/null_blk.c      Bart Van Assche   2018-03-07  =
2048  	blk_queue_flag_set(QUEUE_FLAG_NONROT, nullb->q);
8b904b5b6b58b9 drivers/block/null_blk.c      Bart Van Assche   2018-03-07  =
2049  	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, nullb->q);
f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
2050  =

f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
2051  	mutex_lock(&lock);
94bc02e30fb8d0 drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2052  	nullb->index =3D ida_simple_get(&nullb_indexes, 0, 0, GFP_KERNEL);
cedcafad8277b3 drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2053  	dev->index =3D nullb->index;
f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
2054  	mutex_unlock(&lock);
f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
2055  =

2984c8684f962c drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2056  	blk_queue_logical_block_size(nullb->q, dev->blocksize);
2984c8684f962c drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2057  	blk_queue_physical_block_size(nullb->q, dev->blocksize);
ea17fd354ca8af drivers/block/null_blk_main.c Damien Le Moal    2020-11-20  =
2058  	if (!dev->max_sectors)
ea17fd354ca8af drivers/block/null_blk_main.c Damien Le Moal    2020-11-20  =
2059  		dev->max_sectors =3D queue_max_hw_sectors(nullb->q);
ea17fd354ca8af drivers/block/null_blk_main.c Damien Le Moal    2020-11-20  =
2060  	dev->max_sectors =3D min_t(unsigned int, dev->max_sectors,
ea17fd354ca8af drivers/block/null_blk_main.c Damien Le Moal    2020-11-20  =
2061  				 BLK_DEF_MAX_SECTORS);
ea17fd354ca8af drivers/block/null_blk_main.c Damien Le Moal    2020-11-20  =
2062  	blk_queue_max_hw_sectors(nullb->q, dev->max_sectors);
f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
2063  =

cee1b21523495e drivers/block/null_blk/main.c Max Gurtovoy      2021-04-12  =
2064  	if (dev->virt_boundary)
cee1b21523495e drivers/block/null_blk/main.c Max Gurtovoy      2021-04-12  =
2065  		blk_queue_virt_boundary(nullb->q, PAGE_SIZE - 1);
cee1b21523495e drivers/block/null_blk/main.c Max Gurtovoy      2021-04-12  =
2066  =

306eb6b4ad4f2d drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2067  	null_config_discard(nullb);
f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
2068  =

49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2069  	if (config_item_name(&dev->item)) {
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2070  		/* Use configfs dir name as the device name */
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2071  		snprintf(nullb->disk_name, sizeof(nullb->disk_name),
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2072  			 "%s", config_item_name(&dev->item));
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2073  	} else {
b2b7e00148a203 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2015-11=
-12 @2074  		sprintf(nullb->disk_name, "nullb%d", nullb->index);
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2075  	}
b2b7e00148a203 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2015-11=
-12  2076  =

9ae2d0aa5046c6 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2016-09=
-16  2077  	rv =3D null_gendisk_register(nullb);
b2b7e00148a203 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2015-11=
-12  2078  	if (rv)
ca4b2a011948fa drivers/block/null_blk.c      Matias Bj=C3=B8rling   2018-07=
-06  2079  		goto out_cleanup_zone;
b2b7e00148a203 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2015-11=
-12  2080  =

a514379b0c7708 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2016-02=
-11  2081  	mutex_lock(&lock);
a514379b0c7708 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2016-02=
-11  2082  	list_add_tail(&nullb->list, &nullb_list);
a514379b0c7708 drivers/block/null_blk.c      Matias Bj=C3=B8rling   2016-02=
-11  2083  	mutex_unlock(&lock);
3681c85dffda70 drivers/block/null_blk.c      Wenwei Tao        2016-03-05  =
2084  =

db060f54e0c53a drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2085  	pr_info("disk %s created\n", nullb->disk_name);
db060f54e0c53a drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2086  =

f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
2087  	return 0;
ca4b2a011948fa drivers/block/null_blk.c      Matias Bj=C3=B8rling   2018-07=
-06  2088  out_cleanup_zone:
d205bde78fa53e drivers/block/null_blk_main.c Damien Le Moal    2020-04-23  =
2089  	null_free_zoned_dev(dev);
132226b301b545 drivers/block/null_blk/main.c Christoph Hellwig 2021-05-21  =
2090  out_cleanup_disk:
132226b301b545 drivers/block/null_blk/main.c Christoph Hellwig 2021-05-21  =
2091  	blk_cleanup_disk(nullb->disk);
24d2f90309b23f drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  =
2092  out_cleanup_tags:
2984c8684f962c drivers/block/null_blk.c      Shaohua Li        2017-08-14  =
2093  	if (dev->queue_mode =3D=3D NULL_Q_MQ && nullb->tag_set =3D=3D &nullb=
->__tag_set)
82f402fefa50f1 drivers/block/null_blk.c      Jens Axboe        2017-06-20  =
2094  		blk_mq_free_tag_set(nullb->tag_set);
24d2f90309b23f drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  =
2095  out_cleanup_queues:
24d2f90309b23f drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  =
2096  	cleanup_queues(nullb);
24d2f90309b23f drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  =
2097  out_free_nullb:
24d2f90309b23f drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  =
2098  	kfree(nullb);
2004bfdef945fe drivers/block/null_blk_main.c Bart Van Assche   2020-03-09  =
2099  	dev->nullb =3D NULL;
24d2f90309b23f drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  =
2100  out:
dc501dc0d9dc9c drivers/block/null_blk.c      Robert Elliott    2014-09-02  =
2101  	return rv;
f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
2102  }
f2298c0403b0df drivers/block/null_blk.c      Jens Axboe        2013-10-25  =
2103  =

49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2104  static struct nullb *null_find_dev_by_name(const char *name)
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2105  {
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2106  	struct nullb *nullb =3D NULL, *nb;
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2107  =

49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2108  	mutex_lock(&lock);
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2109  	list_for_each_entry(nb, &nullb_list, list) {
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2110  		if (strcmp(nb->disk_name, name) =3D=3D 0) {
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20 @=
2111  			nullb =3D nb;
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2112  			break;
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2113  		}
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2114  	}
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2115  	mutex_unlock(&lock);
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2116  =

49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2117  	return nullb;
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2118  }
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal    2022-04-20  =
2119  =


:::::: The code at line 2074 was first introduced by commit
:::::: b2b7e00148a203e9934bbd17aebffae3f447ade7 null_blk: register as a Lig=
htNVM device

:::::: TO: Matias Bj=C3=B8rling <m@bjorling.me>
:::::: CC: Jens Axboe <axboe@fb.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9033355063467395638==--

