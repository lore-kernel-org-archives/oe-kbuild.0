Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366A71EB3D
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 07:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733728154; cv=none; b=VmQzlsI/518OJsqzerkI4CfMOW1LOeE3fk+c0qSR1xkfFp75ojrIQnqNU0+G9uoItX6p7hb8il5nEbJ2Sfv28e6DHqJTVr7hbe7PSfmAY7IENxhkSjKsCj0gJRUQBS9fJudntyUvupbDXDMhAozpJYvC/DVYaDE1u65mPWDDlDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733728154; c=relaxed/simple;
	bh=A1Dj57cwqTAkQ0w0kV+pI60cQ0dIK/XnPoMWuzzs8EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A6JjUrYQ31Wup+E5rImcrxlBxsS9IGzHlExXX2ZRmzRDSEsu8/UGqFY0Hr6rXbZD9eQW2H99S4bsBkipD6sztGVtKQgRmC27xlP+Rne7RQ7BXuhb+BZJUXoWNbbZokuwq+qu/8kiBsxa2iQiIqeIa/+0QRes4FVEGRCosRQXZ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8UUKt1L; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8UUKt1L"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434e69857d9so9255035e9.0
        for <oe-kbuild@lists.linux.dev>; Sun, 08 Dec 2024 23:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733728150; x=1734332950; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZqVZywIpteq8+LKOFkdEOvIE5EvvecHIPHqCrLqtv0=;
        b=f8UUKt1L4wJtnAtYwV5aMuKpBJPjrbCvWl7XTgyoAuFS/gvh3RB5U7pNqSkZE+8HZX
         ruRc93zZPZux5cJzvsptCzhzVByECWtbqIBGLiMsWzTnrmhVFh9s4iUaiTVnbR4NsBRX
         Cfl+CO5K0/N1LhZZ2wRc9ViMhICWUp0HbRYCz6UBNTX95o8bBv9ERxA3k0L4qFJqq86s
         aS/pdByOxjObMFel/yvzfZpjMlVVx10bMMZ/d/sk/t14z9NvVQ/R6y3V1sQ69B89p+En
         lIEUDTwjNNC4tQexYldE0m2tjRdCtLmm615cSwuqF2H9snMaeWtAWi5rUm8OAeZZ+O8z
         JVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733728150; x=1734332950;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZqVZywIpteq8+LKOFkdEOvIE5EvvecHIPHqCrLqtv0=;
        b=n5YmxfABO5uNE1HRFAj92kuZF9t1VcCqc8RNQQJkbnMSEVh2mRjouH3EV4K94zaTag
         Vr6ojhQcCS4mcU2F7WFOdQrHW9REhMKFORVBLcO79fh2mJru7j8KcOtqRuYMul8I+dfI
         AcjAoCU59c31l70qurqK58EiqzfbbqSd54uN9L/B83wVBCiZTOMRmokzIwYrSLv6+GwG
         gSEkYPpHgw5C0E1HiVySYp4ATw6Z+z4o0glGWlQ8a+HlmLX2bNyZw2TsFuHf3hTM3uGV
         Wfl9QxcT8yUU//OTU5ae66oBpP4me9NRIXzOxdFZyMgnGSzcpU8KvTk2mH6Kx7ABFFW0
         R5PA==
X-Gm-Message-State: AOJu0YxLuQy4qJQLdIDyd52ogH8eW3+g4UlT1zYMLHjdn9zD4g0iH0iJ
	xT/WZEcfdpMpVmpfC3Mw5HlD8lkrZPhGLAOrMxwz0lpsuB2VgqN0ylFlU0T8vPfKO5P6dLVtaI4
	R
X-Gm-Gg: ASbGncv+oHH7nHFBh3YmcXdffgX3x5N4inpL2klNWxwCkic896nVpSdv0HBkctIduJk
	nWCSVjHydXVIWeUfAzVGHJwojBoazVgSnSNCM+SYs1pIlrEQxyzJ1bPWBXdRdh4NPg9uUg5vVSe
	F8HNUSxcKLbWiMjtQD+Zoc3i2Yl1c0NsjdU2crFelPwtcVzcajIeP/90NEl9b8kaww0FLY9Aazj
	uWaQT79rAygnJ247bax4Q4XXX/dWuB2tpne1iMUfcEMaxJKetavhCY=
X-Google-Smtp-Source: AGHT+IGvxFv3GHrja2zX2o8FdXqu71o/qvW9LeHgpLr9i+OW7fsC4WKg7e3TEoJzJFTsgrfAf/KK1g==
X-Received: by 2002:a05:600c:55c2:b0:434:9f90:2583 with SMTP id 5b1f17b1804b1-434d92bf6d3mr112685575e9.11.1733728150204;
        Sun, 08 Dec 2024 23:09:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0da4a1sm146718655e9.19.2024.12.08.23.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:09:09 -0800 (PST)
Date: Mon, 9 Dec 2024 10:09:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	sanglipeng <sanglipeng1@jd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2563/2563] drivers/block/null_blk/main.c:1839
 null_add_dev() warn: missing error code 'rv'
Message-ID: <4b55dc8e-036c-4302-a397-0e48c30b531c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c8dbb3a6e214ad66d5d6099bf76e1f1c6eefc06f
commit: 35959f33a5dde63a001111516adda66dbe7a7027 [2563/2563] null_blk: Move driver into its own directory
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20241209/202412090230.RlMObRZI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412090230.RlMObRZI-lkp@intel.com/

smatch warnings:
drivers/block/null_blk/main.c:1839 null_add_dev() warn: missing error code 'rv'

vim +/rv +1839 drivers/block/null_blk/main.c

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

Set "rv = " before the goto?

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

