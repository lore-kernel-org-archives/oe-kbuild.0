Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022004685
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Mar 2025 23:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741821183; cv=none; b=e0DRT3QDCILt4hYnFe4+xi7BYeBRWhSaqJRv3InFfRklSy2wbc8ndv815/buBjLAKM2gYslQ9GGb4qtOiqR16rOFIReb3jO4Uv7UAzVRJS1Z3K1QAeCpEPlLW2WGYF2f0A2ijF3sDRDc8Z7ONKUuy5bHQqrnolqEx4De3KG3H3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741821183; c=relaxed/simple;
	bh=brckdh5lXnDFi4cwfDPxF63WlzpoY+L/7zJJoR9X+lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Itw/pufIA3NWlZHUgVFPymBZHRO3Ryvy9ssc/dlC0wRfJvQsWhBX6GOBPmrW8QEAqPssqTS6WZIpp6am6yhm+fXvgF7+rDbJ8g8gUBYMnDgih2a8fUXuu+pbwRwRA34QCivT9aRttugX3kIFV1UrvqklWWUp8wgA8aYfh49erpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCcuoeNM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCcuoeNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741821182; x=1773357182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=brckdh5lXnDFi4cwfDPxF63WlzpoY+L/7zJJoR9X+lw=;
  b=RCcuoeNMzOEhgznwAEbmrnGFkGPy3xSAQmVf2ijK/taZJAjDzAmKdb83
   jt2lHXgLVkJa6lk8vvkdDL3mkf6PrePP1jt/k31uG8p4AIQ8lAggfH9ih
   zUpYPxqA+61SBdXeAp8OYI0G7VsYspQ2RKhuSl5/KEC2PjT8pEHl3j2Dx
   cWfe8Zh5n4p/xTUCIoOBsPUbvq3oxNnPd+1Fr18Bp4x1DNR2DcMIfwPOl
   MOSDwRmkV700h9xHZDk2ojjn8PV4Zwg1a0St7gShPEvIPcsh2Y+U9uX+N
   8vTeTAB0XW+02AIe9lAGOK0+bzVlDF8XAW5FHvmmN2ZvF7NtBBKCTDLGn
   A==;
X-CSE-ConnectionGUID: T90+90vpT7ucAHhUXX8Vdw==
X-CSE-MsgGUID: O0cTDKQeTeiUfP7JfhcJlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42090146"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="42090146"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 16:13:01 -0700
X-CSE-ConnectionGUID: n7ErwwEcReS5LijANDq9ig==
X-CSE-MsgGUID: GVoX9PXIQ6Wzbg//sSl6KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="125399763"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2025 16:13:01 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsVFx-0008xa-30;
	Wed, 12 Mar 2025 23:12:57 +0000
Date: Thu, 13 Mar 2025 07:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8858/10719] fs/bcachefs/ec.c:1543
 ec_stripe_create() error: uninitialized symbol 'ret'.
Message-ID: <202503130750.IAukaway-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9fbcd7b32bf7c0a5bda0f22c25df29d00a872017
commit: 06ae8829c7ec16ae8ef0cd28ebfaf4276e40aff8 [8858/10719] bcachefs: trace_stripe_create
:::::: branch date: 10 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20250312 (https://download.01.org/0day-ci/archive/20250313/202503130750.IAukaway-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503130750.IAukaway-lkp@intel.com/

New smatch warnings:
fs/bcachefs/ec.c:1543 ec_stripe_create() error: uninitialized symbol 'ret'.

Old smatch warnings:
fs/bcachefs/ec.c:452 bch2_trigger_stripe() error: we previously assumed 'new_s' could be null (see line 430)
fs/bcachefs/ec.c:1232 ec_stripe_key_update() error: we previously assumed 'old' could be null (see line 1212)

vim +/ret +1543 fs/bcachefs/ec.c

fba053d2aaca8f9 Kent Overstreet 2023-03-09  1460  
cd575ddf57af004 Kent Overstreet 2018-11-01  1461  /*
cd575ddf57af004 Kent Overstreet 2018-11-01  1462   * data buckets of new stripe all written: create the stripe
cd575ddf57af004 Kent Overstreet 2018-11-01  1463   */
cd575ddf57af004 Kent Overstreet 2018-11-01  1464  static void ec_stripe_create(struct ec_stripe_new *s)
cd575ddf57af004 Kent Overstreet 2018-11-01  1465  {
cd575ddf57af004 Kent Overstreet 2018-11-01  1466  	struct bch_fs *c = s->c;
cd575ddf57af004 Kent Overstreet 2018-11-01  1467  	struct open_bucket *ob;
bf5a261c7af80a2 Kent Overstreet 2023-08-01  1468  	struct bch_stripe *v = &bkey_i_to_stripe(&s->new_stripe.key)->v;
cd575ddf57af004 Kent Overstreet 2018-11-01  1469  	unsigned i, nr_data = v->nr_blocks - v->nr_redundant;
cd575ddf57af004 Kent Overstreet 2018-11-01  1470  	int ret;
cd575ddf57af004 Kent Overstreet 2018-11-01  1471  
cd575ddf57af004 Kent Overstreet 2018-11-01  1472  	BUG_ON(s->h->s == s);
cd575ddf57af004 Kent Overstreet 2018-11-01  1473  
81d8599e192e85f Kent Overstreet 2020-12-14  1474  	closure_sync(&s->iodone);
cd575ddf57af004 Kent Overstreet 2018-11-01  1475  
aebe7a679cbdd82 Kent Overstreet 2023-03-13  1476  	if (!s->err) {
94bc95c468344d6 Kent Overstreet 2023-02-26  1477  		for (i = 0; i < nr_data; i++)
94bc95c468344d6 Kent Overstreet 2023-02-26  1478  			if (s->blocks[i]) {
94bc95c468344d6 Kent Overstreet 2023-02-26  1479  				ob = c->open_buckets + s->blocks[i];
94bc95c468344d6 Kent Overstreet 2023-02-26  1480  
94bc95c468344d6 Kent Overstreet 2023-02-26  1481  				if (ob->sectors_free)
94bc95c468344d6 Kent Overstreet 2023-02-26  1482  					zero_out_rest_of_ec_bucket(c, s, i, ob);
94bc95c468344d6 Kent Overstreet 2023-02-26  1483  			}
aebe7a679cbdd82 Kent Overstreet 2023-03-13  1484  	}
94bc95c468344d6 Kent Overstreet 2023-02-26  1485  
cd575ddf57af004 Kent Overstreet 2018-11-01  1486  	if (s->err) {
858536c7cea8bb8 Kent Overstreet 2022-12-11  1487  		if (!bch2_err_matches(s->err, EROFS))
cd575ddf57af004 Kent Overstreet 2018-11-01  1488  			bch_err(c, "error creating stripe: error writing data buckets");
cd575ddf57af004 Kent Overstreet 2018-11-01  1489  		goto err;
cd575ddf57af004 Kent Overstreet 2018-11-01  1490  	}
cd575ddf57af004 Kent Overstreet 2018-11-01  1491  
81d8599e192e85f Kent Overstreet 2020-12-14  1492  	if (s->have_existing_stripe) {
81d8599e192e85f Kent Overstreet 2020-12-14  1493  		ec_validate_checksums(c, &s->existing_stripe);
81d8599e192e85f Kent Overstreet 2020-12-14  1494  
81d8599e192e85f Kent Overstreet 2020-12-14  1495  		if (ec_do_recov(c, &s->existing_stripe)) {
81d8599e192e85f Kent Overstreet 2020-12-14  1496  			bch_err(c, "error creating stripe: error reading existing stripe");
81d8599e192e85f Kent Overstreet 2020-12-14  1497  			goto err;
81d8599e192e85f Kent Overstreet 2020-12-14  1498  		}
81d8599e192e85f Kent Overstreet 2020-12-14  1499  
81d8599e192e85f Kent Overstreet 2020-12-14  1500  		for (i = 0; i < nr_data; i++)
bf5a261c7af80a2 Kent Overstreet 2023-08-01  1501  			if (stripe_blockcount_get(&bkey_i_to_stripe(&s->existing_stripe.key)->v, i))
81d8599e192e85f Kent Overstreet 2020-12-14  1502  				swap(s->new_stripe.data[i],
81d8599e192e85f Kent Overstreet 2020-12-14  1503  				     s->existing_stripe.data[i]);
81d8599e192e85f Kent Overstreet 2020-12-14  1504  
2a3731e34de9365 Kent Overstreet 2021-01-11  1505  		ec_stripe_buf_exit(&s->existing_stripe);
81d8599e192e85f Kent Overstreet 2020-12-14  1506  	}
81d8599e192e85f Kent Overstreet 2020-12-14  1507  
f6b94a3baa956ff Kent Overstreet 2020-07-06  1508  	BUG_ON(!s->allocated);
5be6a274ff7a7cd Kent Overstreet 2023-03-05  1509  	BUG_ON(!s->idx);
f6b94a3baa956ff Kent Overstreet 2020-07-06  1510  
81d8599e192e85f Kent Overstreet 2020-12-14  1511  	ec_generate_ec(&s->new_stripe);
cd575ddf57af004 Kent Overstreet 2018-11-01  1512  
81d8599e192e85f Kent Overstreet 2020-12-14  1513  	ec_generate_checksums(&s->new_stripe);
cd575ddf57af004 Kent Overstreet 2018-11-01  1514  
cd575ddf57af004 Kent Overstreet 2018-11-01  1515  	/* write p/q: */
cd575ddf57af004 Kent Overstreet 2018-11-01  1516  	for (i = nr_data; i < v->nr_blocks; i++)
81d8599e192e85f Kent Overstreet 2020-12-14  1517  		ec_block_io(c, &s->new_stripe, REQ_OP_WRITE, i, &s->iodone);
81d8599e192e85f Kent Overstreet 2020-12-14  1518  	closure_sync(&s->iodone);
cd575ddf57af004 Kent Overstreet 2018-11-01  1519  
81d8599e192e85f Kent Overstreet 2020-12-14  1520  	if (ec_nr_failed(&s->new_stripe)) {
cd575ddf57af004 Kent Overstreet 2018-11-01  1521  		bch_err(c, "error creating stripe: error writing redundancy buckets");
ebe8bd75a073c30 Kent Overstreet 2023-02-18  1522  		goto err;
cd575ddf57af004 Kent Overstreet 2018-11-01  1523  	}
cd575ddf57af004 Kent Overstreet 2018-11-01  1524  
a0d11feefb19982 Kent Overstreet 2024-10-13  1525  	ret = bch2_trans_commit_do(c, &s->res, NULL,
cb52d23e77a6e5e Kent Overstreet 2023-11-11  1526  		BCH_TRANS_COMMIT_no_check_rw|
cb52d23e77a6e5e Kent Overstreet 2023-11-11  1527  		BCH_TRANS_COMMIT_no_enospc,
6bd68ec266ad718 Kent Overstreet 2023-09-12  1528  		ec_stripe_key_update(trans,
cb6055e66faa0d4 Kent Overstreet 2024-10-13  1529  				     s->have_existing_stripe
cb6055e66faa0d4 Kent Overstreet 2024-10-13  1530  				     ? bkey_i_to_stripe(&s->existing_stripe.key)
cb6055e66faa0d4 Kent Overstreet 2024-10-13  1531  				     : NULL,
cb6055e66faa0d4 Kent Overstreet 2024-10-13  1532  				     bkey_i_to_stripe(&s->new_stripe.key)));
cf904c8d964fa47 Kent Overstreet 2023-12-16  1533  	bch_err_msg(c, ret, "creating stripe key");
cd575ddf57af004 Kent Overstreet 2018-11-01  1534  	if (ret) {
ebe8bd75a073c30 Kent Overstreet 2023-02-18  1535  		goto err;
cd575ddf57af004 Kent Overstreet 2018-11-01  1536  	}
cd575ddf57af004 Kent Overstreet 2018-11-01  1537  
dea5647e16d15ee Kent Overstreet 2022-10-09  1538  	ret = ec_stripe_update_extents(c, &s->new_stripe);
cf904c8d964fa47 Kent Overstreet 2023-12-16  1539  	bch_err_msg(c, ret, "error updating extents");
cf904c8d964fa47 Kent Overstreet 2023-12-16  1540  	if (ret)
4b1e669995a6c19 Kent Overstreet 2023-02-18  1541  		goto err;
cd575ddf57af004 Kent Overstreet 2018-11-01  1542  err:
06ae8829c7ec16a Kent Overstreet 2025-03-07 @1543  	trace_stripe_create(c, s->idx, ret);
06ae8829c7ec16a Kent Overstreet 2025-03-07  1544  
af4d05c46b1ef2b Kent Overstreet 2020-07-09  1545  	bch2_disk_reservation_put(c, &s->res);
af4d05c46b1ef2b Kent Overstreet 2020-07-09  1546  
6c7585b098c519c Kent Overstreet 2021-01-18  1547  	for (i = 0; i < v->nr_blocks; i++)
6c7585b098c519c Kent Overstreet 2021-01-18  1548  		if (s->blocks[i]) {
6c7585b098c519c Kent Overstreet 2021-01-18  1549  			ob = c->open_buckets + s->blocks[i];
6c7585b098c519c Kent Overstreet 2021-01-18  1550  
6c7585b098c519c Kent Overstreet 2021-01-18  1551  			if (i < nr_data) {
cd575ddf57af004 Kent Overstreet 2018-11-01  1552  				ob->ec = NULL;
cd575ddf57af004 Kent Overstreet 2018-11-01  1553  				__bch2_open_bucket_put(c, ob);
6c7585b098c519c Kent Overstreet 2021-01-18  1554  			} else {
6c7585b098c519c Kent Overstreet 2021-01-18  1555  				bch2_open_bucket_put(c, ob);
6c7585b098c519c Kent Overstreet 2021-01-18  1556  			}
cd575ddf57af004 Kent Overstreet 2018-11-01  1557  		}
cd575ddf57af004 Kent Overstreet 2018-11-01  1558  
81c771b26639112 Kent Overstreet 2023-03-08  1559  	mutex_lock(&c->ec_stripe_new_lock);
81c771b26639112 Kent Overstreet 2023-03-08  1560  	list_del(&s->list);
81c771b26639112 Kent Overstreet 2023-03-08  1561  	mutex_unlock(&c->ec_stripe_new_lock);
99a3d39893615ac Kent Overstreet 2023-06-10  1562  	wake_up(&c->ec_stripe_new_wait);
81c771b26639112 Kent Overstreet 2023-03-08  1563  
2a3731e34de9365 Kent Overstreet 2021-01-11  1564  	ec_stripe_buf_exit(&s->existing_stripe);
2a3731e34de9365 Kent Overstreet 2021-01-11  1565  	ec_stripe_buf_exit(&s->new_stripe);
81d8599e192e85f Kent Overstreet 2020-12-14  1566  	closure_debug_destroy(&s->iodone);
fba053d2aaca8f9 Kent Overstreet 2023-03-09  1567  
fba053d2aaca8f9 Kent Overstreet 2023-03-09  1568  	ec_stripe_new_put(c, s, STRIPE_REF_stripe);
cd575ddf57af004 Kent Overstreet 2018-11-01  1569  }
cd575ddf57af004 Kent Overstreet 2018-11-01  1570  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
