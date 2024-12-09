Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F098E16C451
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720023; cv=none; b=IUPRW8AzV1+Pa2OKKoXJX/Xk6VTsruAhGUX7ZCJ/m3dxW/F43UPS8aozUgIMt+sgVztQbFzB5XQm0T+KUklOpf8jbldRFjbFqZ4q1jY74ktvO4Uw4JANmKSZFOiu6pTZJkWB3LQo2hIrYJ/906BxwJzzeTmQh8ZbcJUnMZAe3cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720023; c=relaxed/simple;
	bh=SYKxpkR5qXO3r+0lskNZNwmT16A4l9WN/AmKOxxDk68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=invlFu+FL0rj4799erIDPHzOyKvr/X8FJ4zNK02iM6TV7hAfeY5cI3+zeXyVe2lIfXFVGmFBiMxWn4jSTgqnNQ7v4FvC85aJB9NLIM8OMDlbWu4FYjZ6mLNsSCV2EXwRfAPc/6OmVmjTEsUMXE33a1hnJR7fwNrH1r58Fm1gSMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+sHJtrk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+sHJtrk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720022; x=1765256022;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SYKxpkR5qXO3r+0lskNZNwmT16A4l9WN/AmKOxxDk68=;
  b=J+sHJtrkKrtr3ec5x+Qu/5Z3lxUXtqkKdbXv/I+R4ddxRq5H6x3d7iuW
   S18uRnpdZWazQc1kjVJw0ox+6SxYYz90pQCkyiJdzhVjVPP/DYv6Rzi1J
   UeVHpn/PiqhDnpAMUimE4xVpiI0kkfpbF2EnObmBDEHl0o4yoFBnOTP7m
   nxR7+UDAO9Nqzc++ZJm7uIO0SuEm0tBfBW5FGeAKqWuRHRyWbGtLp5jrt
   0qmgwnNAW0zoDIJBiXhgTiqkCYmRItttQz2hAlJ8eHQjnyX5v1O02+zF3
   AhJwgORBpG9xv0xB0d2pohDh1Wfam665v+53zM6Th7WkkJUBD/6ZjI+Vg
   g==;
X-CSE-ConnectionGUID: VnjVPUB8SO67Sf2gKru/0A==
X-CSE-MsgGUID: 4WKfdzarRiS8VH9QgEQ/Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33917346"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33917346"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:53:41 -0800
X-CSE-ConnectionGUID: sJBoEa8dTwW4Ria/d8biGQ==
X-CSE-MsgGUID: 7ZEPnX1BQz+XHp4lbf35/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="118206245"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Dec 2024 20:53:40 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVm5-0003w7-2v;
	Mon, 09 Dec 2024 04:53:37 +0000
Date: Mon, 9 Dec 2024 12:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2563/2563] drivers/block/null_blk/main.c:1839
 null_add_dev() warn: missing error code 'rv'
Message-ID: <202412090230.RlMObRZI-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: sanglipeng <sanglipeng1@jd.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c8dbb3a6e214ad66d5d6099bf76e1f1c6eefc06f
commit: 35959f33a5dde63a001111516adda66dbe7a7027 [2563/2563] null_blk: Move driver into its own directory
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20241209/202412090230.RlMObRZI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412090230.RlMObRZI-lkp@intel.com/

smatch warnings:
drivers/block/null_blk/main.c:1839 null_add_dev() warn: missing error code 'rv'

vim +/rv +1839 drivers/block/null_blk/main.c

93b570464cce007 drivers/block/null_blk.c      Jens Axboe        2018-01-10  1802  
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1803  static int null_add_dev(struct nullb_device *dev)
9ae2d0aa5046c67 drivers/block/null_blk.c      Matias Bjørling   2016-09-16  1804  {
9ae2d0aa5046c67 drivers/block/null_blk.c      Matias Bjørling   2016-09-16  1805  	struct nullb *nullb;
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02  1806  	int rv;
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1807  
5c4bd1f40c23d08 drivers/block/null_blk_main.c Damien Le Moal    2019-12-03  1808  	rv = null_validate_conf(dev);
5c4bd1f40c23d08 drivers/block/null_blk_main.c Damien Le Moal    2019-12-03  1809  	if (rv)
5c4bd1f40c23d08 drivers/block/null_blk_main.c Damien Le Moal    2019-12-03  1810  		return rv;
cedcafad8277b3a drivers/block/null_blk.c      Shaohua Li        2017-08-14  1811  
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1812  	nullb = kzalloc_node(sizeof(*nullb), GFP_KERNEL, dev->home_node);
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02  1813  	if (!nullb) {
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02  1814  		rv = -ENOMEM;
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1815  		goto out;
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02  1816  	}
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1817  	nullb->dev = dev;
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1818  	dev->nullb = nullb;
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1819  
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1820  	spin_lock_init(&nullb->lock);
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1821  
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02  1822  	rv = setup_queues(nullb);
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02  1823  	if (rv)
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1824  		goto out_free_nullb;
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1825  
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1826  	if (dev->queue_mode == NULL_Q_MQ) {
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20  1827  		if (shared_tags) {
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20  1828  			nullb->tag_set = &tag_set;
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20  1829  			rv = 0;
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20  1830  		} else {
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20  1831  			nullb->tag_set = &nullb->__tag_set;
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1832  			rv = null_init_tag_set(nullb, nullb->tag_set);
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20  1833  		}
db5bcf87bb9e856 drivers/block/null_blk.c      Jens Axboe        2017-03-30  1834  
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02  1835  		if (rv)
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1836  			goto out_cleanup_queues;
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1837  
93b570464cce007 drivers/block/null_blk.c      Jens Axboe        2018-01-10  1838  		if (!null_setup_fault())
93b570464cce007 drivers/block/null_blk.c      Jens Axboe        2018-01-10 @1839  			goto out_cleanup_queues;
93b570464cce007 drivers/block/null_blk.c      Jens Axboe        2018-01-10  1840  
5448aca41cd58e1 drivers/block/null_blk.c      Jens Axboe        2018-01-09  1841  		nullb->tag_set->timeout = 5 * HZ;
8d96a1117c21faa drivers/block/null_blk_main.c Christoph Hellwig 2020-03-27  1842  		nullb->q = blk_mq_init_queue_data(nullb->tag_set, nullb);
35b489d32fcc37e drivers/block/null_blk.c      Ming Lei          2015-01-02  1843  		if (IS_ERR(nullb->q)) {
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02  1844  			rv = -ENOMEM;
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1845  			goto out_cleanup_tags;
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02  1846  		}
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1847  	} else if (dev->queue_mode == NULL_Q_BIO) {
c62b37d96b6eb3e drivers/block/null_blk_main.c Christoph Hellwig 2020-07-01  1848  		nullb->q = blk_alloc_queue(dev->home_node);
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02  1849  		if (!nullb->q) {
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02  1850  			rv = -ENOMEM;
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1851  			goto out_cleanup_queues;
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02  1852  		}
31f9690e6eaf549 drivers/block/null_blk.c      Jan Kara          2014-10-22  1853  		rv = init_driver_queues(nullb);
31f9690e6eaf549 drivers/block/null_blk.c      Jan Kara          2014-10-22  1854  		if (rv)
31f9690e6eaf549 drivers/block/null_blk.c      Jan Kara          2014-10-22  1855  			goto out_cleanup_blk_queue;
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1856  	}
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1857  
eff2c4f108735dd drivers/block/null_blk.c      Shaohua Li        2017-08-14  1858  	if (dev->mbps) {
eff2c4f108735dd drivers/block/null_blk.c      Shaohua Li        2017-08-14  1859  		set_bit(NULLB_DEV_FL_THROTTLED, &dev->flags);
eff2c4f108735dd drivers/block/null_blk.c      Shaohua Li        2017-08-14  1860  		nullb_setup_bwtimer(nullb);
eff2c4f108735dd drivers/block/null_blk.c      Shaohua Li        2017-08-14  1861  	}
eff2c4f108735dd drivers/block/null_blk.c      Shaohua Li        2017-08-14  1862  
deb78b419dfda33 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1863  	if (dev->cache_size > 0) {
deb78b419dfda33 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1864  		set_bit(NULLB_DEV_FL_CACHE, &nullb->dev->flags);
deb78b419dfda33 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1865  		blk_queue_write_cache(nullb->q, true, true);
deb78b419dfda33 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1866  	}
deb78b419dfda33 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1867  
ca4b2a011948fae drivers/block/null_blk.c      Matias Bjørling   2018-07-06  1868  	if (dev->zoned) {
d205bde78fa53e1 drivers/block/null_blk_main.c Damien Le Moal    2020-04-23  1869  		rv = null_init_zoned_dev(dev, nullb->q);
ca4b2a011948fae drivers/block/null_blk.c      Matias Bjørling   2018-07-06  1870  		if (rv)
ca4b2a011948fae drivers/block/null_blk.c      Matias Bjørling   2018-07-06  1871  			goto out_cleanup_blk_queue;
ca4b2a011948fae drivers/block/null_blk.c      Matias Bjørling   2018-07-06  1872  	}
ca4b2a011948fae drivers/block/null_blk.c      Matias Bjørling   2018-07-06  1873  
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1874  	nullb->q->queuedata = nullb;
8b904b5b6b58b9a drivers/block/null_blk.c      Bart Van Assche   2018-03-07  1875  	blk_queue_flag_set(QUEUE_FLAG_NONROT, nullb->q);
8b904b5b6b58b9a drivers/block/null_blk.c      Bart Van Assche   2018-03-07  1876  	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, nullb->q);
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1877  
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1878  	mutex_lock(&lock);
f85cd1a9bc972b6 drivers/block/null_blk_main.c Dan Carpenter     2022-11-18  1879  	rv = ida_simple_get(&nullb_indexes, 0, 0, GFP_KERNEL);
f85cd1a9bc972b6 drivers/block/null_blk_main.c Dan Carpenter     2022-11-18  1880  	if (rv < 0) {
f85cd1a9bc972b6 drivers/block/null_blk_main.c Dan Carpenter     2022-11-18  1881  		mutex_unlock(&lock);
f85cd1a9bc972b6 drivers/block/null_blk_main.c Dan Carpenter     2022-11-18  1882  		goto out_cleanup_zone;
f85cd1a9bc972b6 drivers/block/null_blk_main.c Dan Carpenter     2022-11-18  1883  	}
f85cd1a9bc972b6 drivers/block/null_blk_main.c Dan Carpenter     2022-11-18  1884  	nullb->index = rv;
f85cd1a9bc972b6 drivers/block/null_blk_main.c Dan Carpenter     2022-11-18  1885  	dev->index = rv;
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1886  	mutex_unlock(&lock);
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1887  
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1888  	blk_queue_logical_block_size(nullb->q, dev->blocksize);
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1889  	blk_queue_physical_block_size(nullb->q, dev->blocksize);
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1890  
306eb6b4ad4f2d5 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1891  	null_config_discard(nullb);
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1892  
b2b7e00148a203e drivers/block/null_blk.c      Matias Bjørling   2015-11-12  1893  	sprintf(nullb->disk_name, "nullb%d", nullb->index);
b2b7e00148a203e drivers/block/null_blk.c      Matias Bjørling   2015-11-12  1894  
9ae2d0aa5046c67 drivers/block/null_blk.c      Matias Bjørling   2016-09-16  1895  	rv = null_gendisk_register(nullb);
b2b7e00148a203e drivers/block/null_blk.c      Matias Bjørling   2015-11-12  1896  	if (rv)
f85cd1a9bc972b6 drivers/block/null_blk_main.c Dan Carpenter     2022-11-18  1897  		goto out_ida_free;
b2b7e00148a203e drivers/block/null_blk.c      Matias Bjørling   2015-11-12  1898  
a514379b0c77085 drivers/block/null_blk.c      Matias Bjørling   2016-02-11  1899  	mutex_lock(&lock);
a514379b0c77085 drivers/block/null_blk.c      Matias Bjørling   2016-02-11  1900  	list_add_tail(&nullb->list, &nullb_list);
a514379b0c77085 drivers/block/null_blk.c      Matias Bjørling   2016-02-11  1901  	mutex_unlock(&lock);
3681c85dffda70e drivers/block/null_blk.c      Wenwei Tao        2016-03-05  1902  
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1903  	return 0;
f85cd1a9bc972b6 drivers/block/null_blk_main.c Dan Carpenter     2022-11-18  1904  
f85cd1a9bc972b6 drivers/block/null_blk_main.c Dan Carpenter     2022-11-18  1905  out_ida_free:
f85cd1a9bc972b6 drivers/block/null_blk_main.c Dan Carpenter     2022-11-18  1906  	ida_free(&nullb_indexes, nullb->index);
ca4b2a011948fae drivers/block/null_blk.c      Matias Bjørling   2018-07-06  1907  out_cleanup_zone:
d205bde78fa53e1 drivers/block/null_blk_main.c Damien Le Moal    2020-04-23  1908  	null_free_zoned_dev(dev);
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1909  out_cleanup_blk_queue:
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1910  	blk_cleanup_queue(nullb->q);
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1911  out_cleanup_tags:
2984c8684f962c2 drivers/block/null_blk.c      Shaohua Li        2017-08-14  1912  	if (dev->queue_mode == NULL_Q_MQ && nullb->tag_set == &nullb->__tag_set)
82f402fefa50f16 drivers/block/null_blk.c      Jens Axboe        2017-06-20  1913  		blk_mq_free_tag_set(nullb->tag_set);
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1914  out_cleanup_queues:
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1915  	cleanup_queues(nullb);
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1916  out_free_nullb:
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1917  	kfree(nullb);
2004bfdef945fe5 drivers/block/null_blk_main.c Bart Van Assche   2020-03-09  1918  	dev->nullb = NULL;
24d2f90309b23f2 drivers/block/null_blk.c      Christoph Hellwig 2014-04-15  1919  out:
dc501dc0d9dc9cb drivers/block/null_blk.c      Robert Elliott    2014-09-02  1920  	return rv;
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1921  }
f2298c0403b0dfc drivers/block/null_blk.c      Jens Axboe        2013-10-25  1922  

:::::: The code at line 1839 was first introduced by commit
:::::: 93b570464cce0079c15832cbb8ea17debd541585 null_blk: add option for managing IO timeouts

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
