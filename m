Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88A112BE93
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Feb 2024 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708961313; cv=none; b=WC5x88EhqDsJ07nTSoVeEtEYfdEmjdVEJ+wf1N5W2WED1doFUxzN30yaDYMJQYunOOZ/hngGJpniVQgiH+oV2LUbl8Mhjm09FUd8I5jV09oopWPoplpGcpo+GunN91xE6Ca0/peoNpj4bz3v/Ea9OtEfRqqhi/e+o0YPcC2GcFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708961313; c=relaxed/simple;
	bh=fWiFgT9+hJc33jA6GMmlatRzkRS5KMTSVtLbvzTd4YA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E/4B71hUBXP1EIK5rCYVTrHvuy35x2qYrSdXvpcPBjcc+Dz2vThOwYF3I81qqH11MNbp3YaCAIGmokvdmn2ubXxqn3v/28VTTM5dn86XJw6jyE3ZANro0BG8C8AoCmZGRPMhoWO6ns4J6K9I3mY1/gc8ZSjo98MJUrg85cdNwPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XR/Ckask; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XR/Ckask"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708961310; x=1740497310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fWiFgT9+hJc33jA6GMmlatRzkRS5KMTSVtLbvzTd4YA=;
  b=XR/CkaskvbD1PrCYOKCk8lktsEarOOKA3mGlfM8oMavjMHRKfr5qEhiC
   thBzvZ+rn7E2jsv3FkJL73w/51J0M+hu/pDCvB3rpuOVRCR6gvIqNgwyV
   bbmStd32SH/RKM9GwW4P9Z/IDkshO6JNVEZCJwsLyyuSe6ncxPRPjC0es
   BdfaqDw3rmS22TSg+s5xqZS7uw6gqxAUVHC577I7GFry743Ra1zLNmKR0
   cQ7TzQv9bA8v4PklJNeh1bLzn/fnZ2hNGtvhaU+1ubgKV+PRGU4+uMo+i
   aBuXnvR82rwm/EGWyqRjBFBBT5zeM/tWkOvshmapfad/dX2RNs0c1O9Fi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="13894356"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="13894356"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 07:28:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="11294825"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Feb 2024 07:28:27 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1recu0-000APq-1A;
	Mon, 26 Feb 2024 15:28:24 +0000
Date: Mon, 26 Feb 2024 23:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-ci:regmap-test-format 3/3]
 drivers/base/regmap/regmap.c:1149 __regmap_init() error: we previously
 assumed 'bus' could be null (see line 814)
Message-ID: <202402262352.fY2inNs2-lkp@intel.com>
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
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regmap-test-format
head:   af560701e366502504aebae54af374710e35b55b
commit: af560701e366502504aebae54af374710e35b55b [3/3] regmap: Provide a callback for bus specific initialisation
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240226 (https://download.01.org/0day-ci/archive/20240226/202402262352.fY2inNs2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402262352.fY2inNs2-lkp@intel.com/

New smatch warnings:
drivers/base/regmap/regmap.c:1149 __regmap_init() error: we previously assumed 'bus' could be null (see line 814)

Old smatch warnings:
drivers/base/regmap/regmap.c:2027 _regmap_raw_write() error: uninitialized symbol 'ret'.
drivers/base/regmap/regmap.c:2930 regmap_raw_read() error: uninitialized symbol 'ret'.

vim +/bus +1149 drivers/base/regmap/regmap.c

d647c199510c2c Xiubo Li                  2014-07-15   663  
3cfe7a74d42b7e Nicolas Boichat           2015-07-08   664  struct regmap *__regmap_init(struct device *dev,
b83a313bf25201 Mark Brown                2011-05-11   665  			     const struct regmap_bus *bus,
0135bbcc7a0cc0 Stephen Warren            2012-04-04   666  			     void *bus_context,
3cfe7a74d42b7e Nicolas Boichat           2015-07-08   667  			     const struct regmap_config *config,
3cfe7a74d42b7e Nicolas Boichat           2015-07-08   668  			     struct lock_class_key *lock_key,
3cfe7a74d42b7e Nicolas Boichat           2015-07-08   669  			     const char *lock_name)
b83a313bf25201 Mark Brown                2011-05-11   670  {
6cfec04bcc05a8 Michal Simek              2014-02-10   671  	struct regmap *map;
d36cb0205f034e Charles Keepax            2020-09-18   672  	int ret = -EINVAL;
141eba2e006dd8 Stephen Warren            2012-05-24   673  	enum regmap_endian reg_endian, val_endian;
6863ca6227598d Krystian Garbaciak        2012-06-15   674  	int i, j;
b83a313bf25201 Mark Brown                2011-05-11   675  
d2a5884a64161b Andrey Smirnov            2013-01-27   676  	if (!config)
abbb18fb4ad747 Lars-Peter Clausen        2011-11-14   677  		goto err;
b83a313bf25201 Mark Brown                2011-05-11   678  
b83a313bf25201 Mark Brown                2011-05-11   679  	map = kzalloc(sizeof(*map), GFP_KERNEL);
b83a313bf25201 Mark Brown                2011-05-11   680  	if (map == NULL) {
b83a313bf25201 Mark Brown                2011-05-11   681  		ret = -ENOMEM;
b83a313bf25201 Mark Brown                2011-05-11   682  		goto err;
b83a313bf25201 Mark Brown                2011-05-11   683  	}
b83a313bf25201 Mark Brown                2011-05-11   684  
94cc89eb8fa503 Charles Keepax            2020-09-17   685  	ret = regmap_set_name(map, config);
94cc89eb8fa503 Charles Keepax            2020-09-17   686  	if (ret)
8253bb3f82554c Bartosz Golaszewski       2017-12-13   687  		goto err_map;
8253bb3f82554c Bartosz Golaszewski       2017-12-13   688  
1d512ee861b80d Charles Keepax            2020-09-18   689  	ret = -EINVAL; /* Later error paths rely on this */
1d512ee861b80d Charles Keepax            2020-09-18   690  
c9b41fcf272b49 Bartosz Golaszewski       2017-12-06   691  	if (config->disable_locking) {
81e30b189f593a Bartosz Golaszewski       2017-12-13   692  		map->lock = map->unlock = regmap_lock_unlock_none;
21f8e4828c44da Dmitry Osipenko           2020-09-02   693  		map->can_sleep = config->can_sleep;
72465736adf2aa Mark Brown                2017-12-12   694  		regmap_debugfs_disable(map);
c9b41fcf272b49 Bartosz Golaszewski       2017-12-06   695  	} else if (config->lock && config->unlock) {
0d4529c534c1c6 Davide Ciminaghi          2012-10-16   696  		map->lock = config->lock;
0d4529c534c1c6 Davide Ciminaghi          2012-10-16   697  		map->unlock = config->unlock;
0d4529c534c1c6 Davide Ciminaghi          2012-10-16   698  		map->lock_arg = config->lock_arg;
21f8e4828c44da Dmitry Osipenko           2020-09-02   699  		map->can_sleep = config->can_sleep;
a4887813c3a948 Baolin Wang               2017-12-25   700  	} else if (config->use_hwlock) {
8698b9364710e7 Baolin Wang               2017-11-01   701  		map->hwlock = hwspin_lock_request_specific(config->hwlock_id);
8698b9364710e7 Baolin Wang               2017-11-01   702  		if (!map->hwlock) {
8698b9364710e7 Baolin Wang               2017-11-01   703  			ret = -ENXIO;
8253bb3f82554c Bartosz Golaszewski       2017-12-13   704  			goto err_name;
8698b9364710e7 Baolin Wang               2017-11-01   705  		}
8698b9364710e7 Baolin Wang               2017-11-01   706  
8698b9364710e7 Baolin Wang               2017-11-01   707  		switch (config->hwlock_mode) {
8698b9364710e7 Baolin Wang               2017-11-01   708  		case HWLOCK_IRQSTATE:
8698b9364710e7 Baolin Wang               2017-11-01   709  			map->lock = regmap_lock_hwlock_irqsave;
8698b9364710e7 Baolin Wang               2017-11-01   710  			map->unlock = regmap_unlock_hwlock_irqrestore;
8698b9364710e7 Baolin Wang               2017-11-01   711  			break;
8698b9364710e7 Baolin Wang               2017-11-01   712  		case HWLOCK_IRQ:
8698b9364710e7 Baolin Wang               2017-11-01   713  			map->lock = regmap_lock_hwlock_irq;
8698b9364710e7 Baolin Wang               2017-11-01   714  			map->unlock = regmap_unlock_hwlock_irq;
8698b9364710e7 Baolin Wang               2017-11-01   715  			break;
8698b9364710e7 Baolin Wang               2017-11-01   716  		default:
8698b9364710e7 Baolin Wang               2017-11-01   717  			map->lock = regmap_lock_hwlock;
8698b9364710e7 Baolin Wang               2017-11-01   718  			map->unlock = regmap_unlock_hwlock;
8698b9364710e7 Baolin Wang               2017-11-01   719  			break;
8698b9364710e7 Baolin Wang               2017-11-01   720  		}
8698b9364710e7 Baolin Wang               2017-11-01   721  
8698b9364710e7 Baolin Wang               2017-11-01   722  		map->lock_arg = map;
0d4529c534c1c6 Davide Ciminaghi          2012-10-16   723  	} else {
d2a5884a64161b Andrey Smirnov            2013-01-27   724  		if ((bus && bus->fast_io) ||
d2a5884a64161b Andrey Smirnov            2013-01-27   725  		    config->fast_io) {
67021f25d95292 Vladimir Oltean           2021-08-25   726  			if (config->use_raw_spinlock) {
67021f25d95292 Vladimir Oltean           2021-08-25   727  				raw_spin_lock_init(&map->raw_spinlock);
67021f25d95292 Vladimir Oltean           2021-08-25   728  				map->lock = regmap_lock_raw_spinlock;
67021f25d95292 Vladimir Oltean           2021-08-25   729  				map->unlock = regmap_unlock_raw_spinlock;
67021f25d95292 Vladimir Oltean           2021-08-25   730  				lockdep_set_class_and_name(&map->raw_spinlock,
67021f25d95292 Vladimir Oltean           2021-08-25   731  							   lock_key, lock_name);
67021f25d95292 Vladimir Oltean           2021-08-25   732  			} else {
bacdbe077342ec Stephen Warren            2012-04-04   733  				spin_lock_init(&map->spinlock);
bacdbe077342ec Stephen Warren            2012-04-04   734  				map->lock = regmap_lock_spinlock;
bacdbe077342ec Stephen Warren            2012-04-04   735  				map->unlock = regmap_unlock_spinlock;
3cfe7a74d42b7e Nicolas Boichat           2015-07-08   736  				lockdep_set_class_and_name(&map->spinlock,
3cfe7a74d42b7e Nicolas Boichat           2015-07-08   737  							   lock_key, lock_name);
67021f25d95292 Vladimir Oltean           2021-08-25   738  			}
bacdbe077342ec Stephen Warren            2012-04-04   739  		} else {
bacdbe077342ec Stephen Warren            2012-04-04   740  			mutex_init(&map->mutex);
bacdbe077342ec Stephen Warren            2012-04-04   741  			map->lock = regmap_lock_mutex;
bacdbe077342ec Stephen Warren            2012-04-04   742  			map->unlock = regmap_unlock_mutex;
21f8e4828c44da Dmitry Osipenko           2020-09-02   743  			map->can_sleep = true;
3cfe7a74d42b7e Nicolas Boichat           2015-07-08   744  			lockdep_set_class_and_name(&map->mutex,
3cfe7a74d42b7e Nicolas Boichat           2015-07-08   745  						   lock_key, lock_name);
bacdbe077342ec Stephen Warren            2012-04-04   746  		}
0d4529c534c1c6 Davide Ciminaghi          2012-10-16   747  		map->lock_arg = map;
0d4529c534c1c6 Davide Ciminaghi          2012-10-16   748  	}
b4a21fc275e99f Stephen Boyd              2015-09-11   749  
b4a21fc275e99f Stephen Boyd              2015-09-11   750  	/*
b4a21fc275e99f Stephen Boyd              2015-09-11   751  	 * When we write in fast-paths with regmap_bulk_write() don't allocate
b4a21fc275e99f Stephen Boyd              2015-09-11   752  	 * scratch buffers with sleeping allocations.
b4a21fc275e99f Stephen Boyd              2015-09-11   753  	 */
b4a21fc275e99f Stephen Boyd              2015-09-11   754  	if ((bus && bus->fast_io) || config->fast_io)
b4a21fc275e99f Stephen Boyd              2015-09-11   755  		map->alloc_flags = GFP_ATOMIC;
b4a21fc275e99f Stephen Boyd              2015-09-11   756  	else
b4a21fc275e99f Stephen Boyd              2015-09-11   757  		map->alloc_flags = GFP_KERNEL;
b4a21fc275e99f Stephen Boyd              2015-09-11   758  
0074f3f2b1e43d Colin Foster              2022-03-13   759  	map->reg_base = config->reg_base;
0074f3f2b1e43d Colin Foster              2022-03-13   760  
c212acccc368a0 Wolfram Sang              2012-01-28   761  	map->format.reg_bytes = DIV_ROUND_UP(config->reg_bits, 8);
82159ba8e6ef8c Mark Brown                2012-01-18   762  	map->format.pad_bytes = config->pad_bits / 8;
4a670ac3e75e51 Maxime Chevallier         2023-04-07   763  	map->format.reg_shift = config->reg_shift;
c212acccc368a0 Wolfram Sang              2012-01-28   764  	map->format.val_bytes = DIV_ROUND_UP(config->val_bits, 8);
5494a98f451d59 Fabio Estevam             2012-05-31   765  	map->format.buf_size = DIV_ROUND_UP(config->reg_bits +
5494a98f451d59 Fabio Estevam             2012-05-31   766  			config->val_bits + config->pad_bits, 8);
d939fb9a78b474 Marc Reilly               2012-03-16   767  	map->reg_shift = config->pad_bits % 8;
f01ee60fffa4dc Stephen Warren            2012-04-09   768  	if (config->reg_stride)
f01ee60fffa4dc Stephen Warren            2012-04-09   769  		map->reg_stride = config->reg_stride;
f01ee60fffa4dc Stephen Warren            2012-04-09   770  	else
f01ee60fffa4dc Stephen Warren            2012-04-09   771  		map->reg_stride = 1;
ca747be22fa57b Xiubo Li                  2016-01-04   772  	if (is_power_of_2(map->reg_stride))
ca747be22fa57b Xiubo Li                  2016-01-04   773  		map->reg_stride_order = ilog2(map->reg_stride);
ca747be22fa57b Xiubo Li                  2016-01-04   774  	else
ca747be22fa57b Xiubo Li                  2016-01-04   775  		map->reg_stride_order = -1;
d77e745613680c Marek Vasut               2022-04-30   776  	map->use_single_read = config->use_single_read || !(config->read || (bus && bus->read));
d77e745613680c Marek Vasut               2022-04-30   777  	map->use_single_write = config->use_single_write || !(config->write || (bus && bus->write));
d77e745613680c Marek Vasut               2022-04-30   778  	map->can_multi_write = config->can_multi_write && (config->write || (bus && bus->write));
17649c90ff4c52 Sergey SENOZHATSKY        2015-08-31   779  	if (bus) {
adaac459759db4 Markus Schneider-Pargmann 2015-08-30   780  		map->max_raw_read = bus->max_raw_read;
adaac459759db4 Markus Schneider-Pargmann 2015-08-30   781  		map->max_raw_write = bus->max_raw_write;
d77e745613680c Marek Vasut               2022-04-30   782  	} else if (config->max_raw_read && config->max_raw_write) {
d77e745613680c Marek Vasut               2022-04-30   783  		map->max_raw_read = config->max_raw_read;
d77e745613680c Marek Vasut               2022-04-30   784  		map->max_raw_write = config->max_raw_write;
17649c90ff4c52 Sergey SENOZHATSKY        2015-08-31   785  	}
b83a313bf25201 Mark Brown                2011-05-11   786  	map->dev = dev;
b83a313bf25201 Mark Brown                2011-05-11   787  	map->bus = bus;
0135bbcc7a0cc0 Stephen Warren            2012-04-04   788  	map->bus_context = bus_context;
2e2ae66df37a14 Mark Brown                2011-07-20   789  	map->max_register = config->max_register;
76aad392f75e6c Davide Ciminaghi          2012-11-20   790  	map->wr_table = config->wr_table;
76aad392f75e6c Davide Ciminaghi          2012-11-20   791  	map->rd_table = config->rd_table;
76aad392f75e6c Davide Ciminaghi          2012-11-20   792  	map->volatile_table = config->volatile_table;
76aad392f75e6c Davide Ciminaghi          2012-11-20   793  	map->precious_table = config->precious_table;
cdf6b11daa77d4 Ben Whitten               2018-10-19   794  	map->wr_noinc_table = config->wr_noinc_table;
74fe7b551f3385 Crestez Dan Leonard       2018-08-07   795  	map->rd_noinc_table = config->rd_noinc_table;
2e2ae66df37a14 Mark Brown                2011-07-20   796  	map->writeable_reg = config->writeable_reg;
2e2ae66df37a14 Mark Brown                2011-07-20   797  	map->readable_reg = config->readable_reg;
2e2ae66df37a14 Mark Brown                2011-07-20   798  	map->volatile_reg = config->volatile_reg;
2efe1642b73e74 Mark Brown                2011-08-08   799  	map->precious_reg = config->precious_reg;
cdf6b11daa77d4 Ben Whitten               2018-10-19   800  	map->writeable_noinc_reg = config->writeable_noinc_reg;
74fe7b551f3385 Crestez Dan Leonard       2018-08-07   801  	map->readable_noinc_reg = config->readable_noinc_reg;
5d1729e7f02f05 Dimitris Papastamos       2011-09-19   802  	map->cache_type = config->cache_type;
b83a313bf25201 Mark Brown                2011-05-11   803  
0d509f2b112b21 Mark Brown                2013-01-27   804  	spin_lock_init(&map->async_lock);
0d509f2b112b21 Mark Brown                2013-01-27   805  	INIT_LIST_HEAD(&map->async_list);
7e09a979404ed0 Mark Brown                2013-10-07   806  	INIT_LIST_HEAD(&map->async_free);
0d509f2b112b21 Mark Brown                2013-01-27   807  	init_waitqueue_head(&map->async_waitq);
0d509f2b112b21 Mark Brown                2013-01-27   808  
9bf485c955bcb7 Andrew F. Davis           2018-01-07   809  	if (config->read_flag_mask ||
9bf485c955bcb7 Andrew F. Davis           2018-01-07   810  	    config->write_flag_mask ||
9bf485c955bcb7 Andrew F. Davis           2018-01-07   811  	    config->zero_flag_mask) {
6f306441e97f8f Lars-Peter Clausen        2011-09-05   812  		map->read_flag_mask = config->read_flag_mask;
6f306441e97f8f Lars-Peter Clausen        2011-09-05   813  		map->write_flag_mask = config->write_flag_mask;
d2a5884a64161b Andrey Smirnov            2013-01-27   814  	} else if (bus) {
6f306441e97f8f Lars-Peter Clausen        2011-09-05   815  		map->read_flag_mask = bus->read_flag_mask;
6f306441e97f8f Lars-Peter Clausen        2011-09-05   816  	}
6f306441e97f8f Lars-Peter Clausen        2011-09-05   817  
d77e745613680c Marek Vasut               2022-04-30   818  	if (config && config->read && config->write) {
d77e745613680c Marek Vasut               2022-04-30   819  		map->reg_read  = _regmap_bus_read;
739f872e48d47c Christian Marangi         2022-07-15   820  		if (config->reg_update_bits)
739f872e48d47c Christian Marangi         2022-07-15   821  			map->reg_update_bits = config->reg_update_bits;
d77e745613680c Marek Vasut               2022-04-30   822  
d77e745613680c Marek Vasut               2022-04-30   823  		/* Bulk read/write */
d77e745613680c Marek Vasut               2022-04-30   824  		map->read = config->read;
d77e745613680c Marek Vasut               2022-04-30   825  		map->write = config->write;
d77e745613680c Marek Vasut               2022-04-30   826  
d77e745613680c Marek Vasut               2022-04-30   827  		reg_endian = REGMAP_ENDIAN_NATIVE;
d77e745613680c Marek Vasut               2022-04-30   828  		val_endian = REGMAP_ENDIAN_NATIVE;
d77e745613680c Marek Vasut               2022-04-30   829  	} else if (!bus) {
d2a5884a64161b Andrey Smirnov            2013-01-27   830  		map->reg_read  = config->reg_read;
d2a5884a64161b Andrey Smirnov            2013-01-27   831  		map->reg_write = config->reg_write;
02d6fdecb9c38d Christian Marangi         2021-11-04   832  		map->reg_update_bits = config->reg_update_bits;
d2a5884a64161b Andrey Smirnov            2013-01-27   833  
3ac170376f2c51 Boris Brezillon           2014-04-17   834  		map->defer_caching = false;
3ac170376f2c51 Boris Brezillon           2014-04-17   835  		goto skip_format_initialization;
3ac170376f2c51 Boris Brezillon           2014-04-17   836  	} else if (!bus->read || !bus->write) {
3ac170376f2c51 Boris Brezillon           2014-04-17   837  		map->reg_read = _regmap_bus_reg_read;
3ac170376f2c51 Boris Brezillon           2014-04-17   838  		map->reg_write = _regmap_bus_reg_write;
80215f133d5931 Baolin Wang               2020-04-13   839  		map->reg_update_bits = bus->reg_update_bits;
3ac170376f2c51 Boris Brezillon           2014-04-17   840  
d2a5884a64161b Andrey Smirnov            2013-01-27   841  		map->defer_caching = false;
d2a5884a64161b Andrey Smirnov            2013-01-27   842  		goto skip_format_initialization;
d2a5884a64161b Andrey Smirnov            2013-01-27   843  	} else {
ad278406b3b8b8 Andrey Smirnov            2013-01-12   844  		map->reg_read  = _regmap_bus_read;
77792b11409c92 Jon Ringle                2015-10-01   845  		map->reg_update_bits = bus->reg_update_bits;
d77e745613680c Marek Vasut               2022-04-30   846  		/* Bulk read/write */
d77e745613680c Marek Vasut               2022-04-30   847  		map->read = bus->read;
d77e745613680c Marek Vasut               2022-04-30   848  		map->write = bus->write;
ad278406b3b8b8 Andrey Smirnov            2013-01-12   849  
cf673fbc6342b1 Geert Uytterhoeven        2014-08-27   850  		reg_endian = regmap_get_reg_endian(bus, config);
cf673fbc6342b1 Geert Uytterhoeven        2014-08-27   851  		val_endian = regmap_get_val_endian(dev, bus, config);
d77e745613680c Marek Vasut               2022-04-30   852  	}
141eba2e006dd8 Stephen Warren            2012-05-24   853  
d939fb9a78b474 Marc Reilly               2012-03-16   854  	switch (config->reg_bits + map->reg_shift) {
9aa507505cdcd1 Wolfram Sang              2012-01-27   855  	case 2:
9aa507505cdcd1 Wolfram Sang              2012-01-27   856  		switch (config->val_bits) {
9aa507505cdcd1 Wolfram Sang              2012-01-27   857  		case 6:
9aa507505cdcd1 Wolfram Sang              2012-01-27   858  			map->format.format_write = regmap_format_2_6_write;
9aa507505cdcd1 Wolfram Sang              2012-01-27   859  			break;
9aa507505cdcd1 Wolfram Sang              2012-01-27   860  		default:
8698b9364710e7 Baolin Wang               2017-11-01   861  			goto err_hwlock;
9aa507505cdcd1 Wolfram Sang              2012-01-27   862  		}
9aa507505cdcd1 Wolfram Sang              2012-01-27   863  		break;
9aa507505cdcd1 Wolfram Sang              2012-01-27   864  
b83a313bf25201 Mark Brown                2011-05-11   865  	case 4:
b83a313bf25201 Mark Brown                2011-05-11   866  		switch (config->val_bits) {
b83a313bf25201 Mark Brown                2011-05-11   867  		case 12:
b83a313bf25201 Mark Brown                2011-05-11   868  			map->format.format_write = regmap_format_4_12_write;
b83a313bf25201 Mark Brown                2011-05-11   869  			break;
b83a313bf25201 Mark Brown                2011-05-11   870  		default:
8698b9364710e7 Baolin Wang               2017-11-01   871  			goto err_hwlock;
b83a313bf25201 Mark Brown                2011-05-11   872  		}
b83a313bf25201 Mark Brown                2011-05-11   873  		break;
b83a313bf25201 Mark Brown                2011-05-11   874  
b83a313bf25201 Mark Brown                2011-05-11   875  	case 7:
b83a313bf25201 Mark Brown                2011-05-11   876  		switch (config->val_bits) {
b83a313bf25201 Mark Brown                2011-05-11   877  		case 9:
b83a313bf25201 Mark Brown                2011-05-11   878  			map->format.format_write = regmap_format_7_9_write;
b83a313bf25201 Mark Brown                2011-05-11   879  			break;
b24412aff37c58 Antoniu Miclaus           2021-05-26   880  		case 17:
b24412aff37c58 Antoniu Miclaus           2021-05-26   881  			map->format.format_write = regmap_format_7_17_write;
b24412aff37c58 Antoniu Miclaus           2021-05-26   882  			break;
b83a313bf25201 Mark Brown                2011-05-11   883  		default:
8698b9364710e7 Baolin Wang               2017-11-01   884  			goto err_hwlock;
b83a313bf25201 Mark Brown                2011-05-11   885  		}
b83a313bf25201 Mark Brown                2011-05-11   886  		break;
b83a313bf25201 Mark Brown                2011-05-11   887  
7e5ec63ef57477 Lars-Peter Clausen        2011-11-16   888  	case 10:
7e5ec63ef57477 Lars-Peter Clausen        2011-11-16   889  		switch (config->val_bits) {
7e5ec63ef57477 Lars-Peter Clausen        2011-11-16   890  		case 14:
7e5ec63ef57477 Lars-Peter Clausen        2011-11-16   891  			map->format.format_write = regmap_format_10_14_write;
7e5ec63ef57477 Lars-Peter Clausen        2011-11-16   892  			break;
7e5ec63ef57477 Lars-Peter Clausen        2011-11-16   893  		default:
8698b9364710e7 Baolin Wang               2017-11-01   894  			goto err_hwlock;
7e5ec63ef57477 Lars-Peter Clausen        2011-11-16   895  		}
7e5ec63ef57477 Lars-Peter Clausen        2011-11-16   896  		break;
7e5ec63ef57477 Lars-Peter Clausen        2011-11-16   897  
0c2191c3da345e Ricardo Ribalda           2020-09-17   898  	case 12:
0c2191c3da345e Ricardo Ribalda           2020-09-17   899  		switch (config->val_bits) {
0c2191c3da345e Ricardo Ribalda           2020-09-17   900  		case 20:
0c2191c3da345e Ricardo Ribalda           2020-09-17   901  			map->format.format_write = regmap_format_12_20_write;
0c2191c3da345e Ricardo Ribalda           2020-09-17   902  			break;
0c2191c3da345e Ricardo Ribalda           2020-09-17   903  		default:
0c2191c3da345e Ricardo Ribalda           2020-09-17   904  			goto err_hwlock;
0c2191c3da345e Ricardo Ribalda           2020-09-17   905  		}
0c2191c3da345e Ricardo Ribalda           2020-09-17   906  		break;
0c2191c3da345e Ricardo Ribalda           2020-09-17   907  
b83a313bf25201 Mark Brown                2011-05-11   908  	case 8:
b83a313bf25201 Mark Brown                2011-05-11   909  		map->format.format_reg = regmap_format_8;
b83a313bf25201 Mark Brown                2011-05-11   910  		break;
b83a313bf25201 Mark Brown                2011-05-11   911  
b83a313bf25201 Mark Brown                2011-05-11   912  	case 16:
141eba2e006dd8 Stephen Warren            2012-05-24   913  		switch (reg_endian) {
141eba2e006dd8 Stephen Warren            2012-05-24   914  		case REGMAP_ENDIAN_BIG:
141eba2e006dd8 Stephen Warren            2012-05-24   915  			map->format.format_reg = regmap_format_16_be;
141eba2e006dd8 Stephen Warren            2012-05-24   916  			break;
55562449032c43 Tony Lindgren             2016-09-15   917  		case REGMAP_ENDIAN_LITTLE:
55562449032c43 Tony Lindgren             2016-09-15   918  			map->format.format_reg = regmap_format_16_le;
55562449032c43 Tony Lindgren             2016-09-15   919  			break;
141eba2e006dd8 Stephen Warren            2012-05-24   920  		case REGMAP_ENDIAN_NATIVE:
141eba2e006dd8 Stephen Warren            2012-05-24   921  			map->format.format_reg = regmap_format_16_native;
141eba2e006dd8 Stephen Warren            2012-05-24   922  			break;
141eba2e006dd8 Stephen Warren            2012-05-24   923  		default:
8698b9364710e7 Baolin Wang               2017-11-01   924  			goto err_hwlock;
141eba2e006dd8 Stephen Warren            2012-05-24   925  		}
b83a313bf25201 Mark Brown                2011-05-11   926  		break;
b83a313bf25201 Mark Brown                2011-05-11   927  
237019e7e356ab Lars-Peter Clausen        2013-01-10   928  	case 24:
060004431df495 Andy Shevchenko           2022-07-26   929  		switch (reg_endian) {
060004431df495 Andy Shevchenko           2022-07-26   930  		case REGMAP_ENDIAN_BIG:
060004431df495 Andy Shevchenko           2022-07-26   931  			map->format.format_reg = regmap_format_24_be;
060004431df495 Andy Shevchenko           2022-07-26   932  			break;
060004431df495 Andy Shevchenko           2022-07-26   933  		default:
8698b9364710e7 Baolin Wang               2017-11-01   934  			goto err_hwlock;
060004431df495 Andy Shevchenko           2022-07-26   935  		}
237019e7e356ab Lars-Peter Clausen        2013-01-10   936  		break;
237019e7e356ab Lars-Peter Clausen        2013-01-10   937  
7d5e525b9ceda0 Mark Brown                2012-02-17   938  	case 32:
141eba2e006dd8 Stephen Warren            2012-05-24   939  		switch (reg_endian) {
141eba2e006dd8 Stephen Warren            2012-05-24   940  		case REGMAP_ENDIAN_BIG:
141eba2e006dd8 Stephen Warren            2012-05-24   941  			map->format.format_reg = regmap_format_32_be;
141eba2e006dd8 Stephen Warren            2012-05-24   942  			break;
55562449032c43 Tony Lindgren             2016-09-15   943  		case REGMAP_ENDIAN_LITTLE:
55562449032c43 Tony Lindgren             2016-09-15   944  			map->format.format_reg = regmap_format_32_le;
55562449032c43 Tony Lindgren             2016-09-15   945  			break;
141eba2e006dd8 Stephen Warren            2012-05-24   946  		case REGMAP_ENDIAN_NATIVE:
141eba2e006dd8 Stephen Warren            2012-05-24   947  			map->format.format_reg = regmap_format_32_native;
141eba2e006dd8 Stephen Warren            2012-05-24   948  			break;
141eba2e006dd8 Stephen Warren            2012-05-24   949  		default:
8698b9364710e7 Baolin Wang               2017-11-01   950  			goto err_hwlock;
141eba2e006dd8 Stephen Warren            2012-05-24   951  		}
7d5e525b9ceda0 Mark Brown                2012-02-17   952  		break;
7d5e525b9ceda0 Mark Brown                2012-02-17   953  
b83a313bf25201 Mark Brown                2011-05-11   954  	default:
8698b9364710e7 Baolin Wang               2017-11-01   955  		goto err_hwlock;
b83a313bf25201 Mark Brown                2011-05-11   956  	}
b83a313bf25201 Mark Brown                2011-05-11   957  
8a819ff8abac9a Mark Brown                2013-03-04   958  	if (val_endian == REGMAP_ENDIAN_NATIVE)
8a819ff8abac9a Mark Brown                2013-03-04   959  		map->format.parse_inplace = regmap_parse_inplace_noop;
8a819ff8abac9a Mark Brown                2013-03-04   960  
b83a313bf25201 Mark Brown                2011-05-11   961  	switch (config->val_bits) {
b83a313bf25201 Mark Brown                2011-05-11   962  	case 8:
b83a313bf25201 Mark Brown                2011-05-11   963  		map->format.format_val = regmap_format_8;
b83a313bf25201 Mark Brown                2011-05-11   964  		map->format.parse_val = regmap_parse_8;
8a819ff8abac9a Mark Brown                2013-03-04   965  		map->format.parse_inplace = regmap_parse_inplace_noop;
b83a313bf25201 Mark Brown                2011-05-11   966  		break;
b83a313bf25201 Mark Brown                2011-05-11   967  	case 16:
141eba2e006dd8 Stephen Warren            2012-05-24   968  		switch (val_endian) {
141eba2e006dd8 Stephen Warren            2012-05-24   969  		case REGMAP_ENDIAN_BIG:
141eba2e006dd8 Stephen Warren            2012-05-24   970  			map->format.format_val = regmap_format_16_be;
141eba2e006dd8 Stephen Warren            2012-05-24   971  			map->format.parse_val = regmap_parse_16_be;
8a819ff8abac9a Mark Brown                2013-03-04   972  			map->format.parse_inplace = regmap_parse_16_be_inplace;
141eba2e006dd8 Stephen Warren            2012-05-24   973  			break;
4aa8c0694c731e Xiubo Li                  2014-04-02   974  		case REGMAP_ENDIAN_LITTLE:
4aa8c0694c731e Xiubo Li                  2014-04-02   975  			map->format.format_val = regmap_format_16_le;
4aa8c0694c731e Xiubo Li                  2014-04-02   976  			map->format.parse_val = regmap_parse_16_le;
4aa8c0694c731e Xiubo Li                  2014-04-02   977  			map->format.parse_inplace = regmap_parse_16_le_inplace;
4aa8c0694c731e Xiubo Li                  2014-04-02   978  			break;
141eba2e006dd8 Stephen Warren            2012-05-24   979  		case REGMAP_ENDIAN_NATIVE:
141eba2e006dd8 Stephen Warren            2012-05-24   980  			map->format.format_val = regmap_format_16_native;
141eba2e006dd8 Stephen Warren            2012-05-24   981  			map->format.parse_val = regmap_parse_16_native;
141eba2e006dd8 Stephen Warren            2012-05-24   982  			break;
141eba2e006dd8 Stephen Warren            2012-05-24   983  		default:
8698b9364710e7 Baolin Wang               2017-11-01   984  			goto err_hwlock;
141eba2e006dd8 Stephen Warren            2012-05-24   985  		}
b83a313bf25201 Mark Brown                2011-05-11   986  		break;
ea279fc5619e25 Marc Reilly               2012-03-16   987  	case 24:
060004431df495 Andy Shevchenko           2022-07-26   988  		switch (val_endian) {
060004431df495 Andy Shevchenko           2022-07-26   989  		case REGMAP_ENDIAN_BIG:
060004431df495 Andy Shevchenko           2022-07-26   990  			map->format.format_val = regmap_format_24_be;
060004431df495 Andy Shevchenko           2022-07-26   991  			map->format.parse_val = regmap_parse_24_be;
060004431df495 Andy Shevchenko           2022-07-26   992  			break;
060004431df495 Andy Shevchenko           2022-07-26   993  		default:
8698b9364710e7 Baolin Wang               2017-11-01   994  			goto err_hwlock;
060004431df495 Andy Shevchenko           2022-07-26   995  		}
ea279fc5619e25 Marc Reilly               2012-03-16   996  		break;
7d5e525b9ceda0 Mark Brown                2012-02-17   997  	case 32:
141eba2e006dd8 Stephen Warren            2012-05-24   998  		switch (val_endian) {
141eba2e006dd8 Stephen Warren            2012-05-24   999  		case REGMAP_ENDIAN_BIG:
141eba2e006dd8 Stephen Warren            2012-05-24  1000  			map->format.format_val = regmap_format_32_be;
141eba2e006dd8 Stephen Warren            2012-05-24  1001  			map->format.parse_val = regmap_parse_32_be;
8a819ff8abac9a Mark Brown                2013-03-04  1002  			map->format.parse_inplace = regmap_parse_32_be_inplace;
141eba2e006dd8 Stephen Warren            2012-05-24  1003  			break;
4aa8c0694c731e Xiubo Li                  2014-04-02  1004  		case REGMAP_ENDIAN_LITTLE:
4aa8c0694c731e Xiubo Li                  2014-04-02  1005  			map->format.format_val = regmap_format_32_le;
4aa8c0694c731e Xiubo Li                  2014-04-02  1006  			map->format.parse_val = regmap_parse_32_le;
4aa8c0694c731e Xiubo Li                  2014-04-02  1007  			map->format.parse_inplace = regmap_parse_32_le_inplace;
4aa8c0694c731e Xiubo Li                  2014-04-02  1008  			break;
141eba2e006dd8 Stephen Warren            2012-05-24  1009  		case REGMAP_ENDIAN_NATIVE:
141eba2e006dd8 Stephen Warren            2012-05-24  1010  			map->format.format_val = regmap_format_32_native;
141eba2e006dd8 Stephen Warren            2012-05-24  1011  			map->format.parse_val = regmap_parse_32_native;
141eba2e006dd8 Stephen Warren            2012-05-24  1012  			break;
141eba2e006dd8 Stephen Warren            2012-05-24  1013  		default:
8698b9364710e7 Baolin Wang               2017-11-01  1014  			goto err_hwlock;
141eba2e006dd8 Stephen Warren            2012-05-24  1015  		}
7d5e525b9ceda0 Mark Brown                2012-02-17  1016  		break;
b83a313bf25201 Mark Brown                2011-05-11  1017  	}
b83a313bf25201 Mark Brown                2011-05-11  1018  
141eba2e006dd8 Stephen Warren            2012-05-24  1019  	if (map->format.format_write) {
141eba2e006dd8 Stephen Warren            2012-05-24  1020  		if ((reg_endian != REGMAP_ENDIAN_BIG) ||
141eba2e006dd8 Stephen Warren            2012-05-24  1021  		    (val_endian != REGMAP_ENDIAN_BIG))
8698b9364710e7 Baolin Wang               2017-11-01  1022  			goto err_hwlock;
67921a1a6660d3 Markus Schneider-Pargmann 2015-08-21  1023  		map->use_single_write = true;
141eba2e006dd8 Stephen Warren            2012-05-24  1024  	}
7a6476143270d9 Mark Brown                2012-04-30  1025  
b83a313bf25201 Mark Brown                2011-05-11  1026  	if (!map->format.format_write &&
b83a313bf25201 Mark Brown                2011-05-11  1027  	    !(map->format.format_reg && map->format.format_val))
8698b9364710e7 Baolin Wang               2017-11-01  1028  		goto err_hwlock;
b83a313bf25201 Mark Brown                2011-05-11  1029  
82159ba8e6ef8c Mark Brown                2012-01-18  1030  	map->work_buf = kzalloc(map->format.buf_size, GFP_KERNEL);
b83a313bf25201 Mark Brown                2011-05-11  1031  	if (map->work_buf == NULL) {
b83a313bf25201 Mark Brown                2011-05-11  1032  		ret = -ENOMEM;
8698b9364710e7 Baolin Wang               2017-11-01  1033  		goto err_hwlock;
b83a313bf25201 Mark Brown                2011-05-11  1034  	}
b83a313bf25201 Mark Brown                2011-05-11  1035  
d2a5884a64161b Andrey Smirnov            2013-01-27  1036  	if (map->format.format_write) {
d2a5884a64161b Andrey Smirnov            2013-01-27  1037  		map->defer_caching = false;
07c320dc31d757 Andrey Smirnov            2013-01-12  1038  		map->reg_write = _regmap_bus_formatted_write;
d2a5884a64161b Andrey Smirnov            2013-01-27  1039  	} else if (map->format.format_val) {
d2a5884a64161b Andrey Smirnov            2013-01-27  1040  		map->defer_caching = true;
07c320dc31d757 Andrey Smirnov            2013-01-12  1041  		map->reg_write = _regmap_bus_raw_write;
d2a5884a64161b Andrey Smirnov            2013-01-27  1042  	}
d2a5884a64161b Andrey Smirnov            2013-01-27  1043  
d2a5884a64161b Andrey Smirnov            2013-01-27  1044  skip_format_initialization:
07c320dc31d757 Andrey Smirnov            2013-01-12  1045  
6863ca6227598d Krystian Garbaciak        2012-06-15  1046  	map->range_tree = RB_ROOT;
e3549cd01347ef Mark Brown                2012-10-02  1047  	for (i = 0; i < config->num_ranges; i++) {
6863ca6227598d Krystian Garbaciak        2012-06-15  1048  		const struct regmap_range_cfg *range_cfg = &config->ranges[i];
6863ca6227598d Krystian Garbaciak        2012-06-15  1049  		struct regmap_range_node *new;
6863ca6227598d Krystian Garbaciak        2012-06-15  1050  
6863ca6227598d Krystian Garbaciak        2012-06-15  1051  		/* Sanity check */
061adc064adbbd Mark Brown                2012-10-03  1052  		if (range_cfg->range_max < range_cfg->range_min) {
061adc064adbbd Mark Brown                2012-10-03  1053  			dev_err(map->dev, "Invalid range %d: %d < %d\n", i,
061adc064adbbd Mark Brown                2012-10-03  1054  				range_cfg->range_max, range_cfg->range_min);
6863ca6227598d Krystian Garbaciak        2012-06-15  1055  			goto err_range;
061adc064adbbd Mark Brown                2012-10-03  1056  		}
061adc064adbbd Mark Brown                2012-10-03  1057  
061adc064adbbd Mark Brown                2012-10-03  1058  		if (range_cfg->range_max > map->max_register) {
061adc064adbbd Mark Brown                2012-10-03  1059  			dev_err(map->dev, "Invalid range %d: %d > %d\n", i,
061adc064adbbd Mark Brown                2012-10-03  1060  				range_cfg->range_max, map->max_register);
061adc064adbbd Mark Brown                2012-10-03  1061  			goto err_range;
061adc064adbbd Mark Brown                2012-10-03  1062  		}
061adc064adbbd Mark Brown                2012-10-03  1063  
061adc064adbbd Mark Brown                2012-10-03  1064  		if (range_cfg->selector_reg > map->max_register) {
061adc064adbbd Mark Brown                2012-10-03  1065  			dev_err(map->dev,
061adc064adbbd Mark Brown                2012-10-03  1066  				"Invalid range %d: selector out of map\n", i);
061adc064adbbd Mark Brown                2012-10-03  1067  			goto err_range;
061adc064adbbd Mark Brown                2012-10-03  1068  		}
061adc064adbbd Mark Brown                2012-10-03  1069  
061adc064adbbd Mark Brown                2012-10-03  1070  		if (range_cfg->window_len == 0) {
061adc064adbbd Mark Brown                2012-10-03  1071  			dev_err(map->dev, "Invalid range %d: window_len 0\n",
061adc064adbbd Mark Brown                2012-10-03  1072  				i);
061adc064adbbd Mark Brown                2012-10-03  1073  			goto err_range;
061adc064adbbd Mark Brown                2012-10-03  1074  		}
6863ca6227598d Krystian Garbaciak        2012-06-15  1075  
6863ca6227598d Krystian Garbaciak        2012-06-15  1076  		/* Make sure, that this register range has no selector
6863ca6227598d Krystian Garbaciak        2012-06-15  1077  		   or data window within its boundary */
e3549cd01347ef Mark Brown                2012-10-02  1078  		for (j = 0; j < config->num_ranges; j++) {
d63aa09f7c53bd Jinchao Wang              2021-06-29  1079  			unsigned int sel_reg = config->ranges[j].selector_reg;
d63aa09f7c53bd Jinchao Wang              2021-06-29  1080  			unsigned int win_min = config->ranges[j].window_start;
d63aa09f7c53bd Jinchao Wang              2021-06-29  1081  			unsigned int win_max = win_min +
6863ca6227598d Krystian Garbaciak        2012-06-15  1082  					       config->ranges[j].window_len - 1;
6863ca6227598d Krystian Garbaciak        2012-06-15  1083  
f161d22081e9b8 Philipp Zabel             2013-07-23  1084  			/* Allow data window inside its own virtual range */
f161d22081e9b8 Philipp Zabel             2013-07-23  1085  			if (j == i)
f161d22081e9b8 Philipp Zabel             2013-07-23  1086  				continue;
f161d22081e9b8 Philipp Zabel             2013-07-23  1087  
6863ca6227598d Krystian Garbaciak        2012-06-15  1088  			if (range_cfg->range_min <= sel_reg &&
6863ca6227598d Krystian Garbaciak        2012-06-15  1089  			    sel_reg <= range_cfg->range_max) {
061adc064adbbd Mark Brown                2012-10-03  1090  				dev_err(map->dev,
061adc064adbbd Mark Brown                2012-10-03  1091  					"Range %d: selector for %d in window\n",
061adc064adbbd Mark Brown                2012-10-03  1092  					i, j);
6863ca6227598d Krystian Garbaciak        2012-06-15  1093  				goto err_range;
6863ca6227598d Krystian Garbaciak        2012-06-15  1094  			}
6863ca6227598d Krystian Garbaciak        2012-06-15  1095  
6863ca6227598d Krystian Garbaciak        2012-06-15  1096  			if (!(win_max < range_cfg->range_min ||
6863ca6227598d Krystian Garbaciak        2012-06-15  1097  			      win_min > range_cfg->range_max)) {
061adc064adbbd Mark Brown                2012-10-03  1098  				dev_err(map->dev,
061adc064adbbd Mark Brown                2012-10-03  1099  					"Range %d: window for %d in window\n",
061adc064adbbd Mark Brown                2012-10-03  1100  					i, j);
6863ca6227598d Krystian Garbaciak        2012-06-15  1101  				goto err_range;
6863ca6227598d Krystian Garbaciak        2012-06-15  1102  			}
6863ca6227598d Krystian Garbaciak        2012-06-15  1103  		}
6863ca6227598d Krystian Garbaciak        2012-06-15  1104  
6863ca6227598d Krystian Garbaciak        2012-06-15  1105  		new = kzalloc(sizeof(*new), GFP_KERNEL);
6863ca6227598d Krystian Garbaciak        2012-06-15  1106  		if (new == NULL) {
6863ca6227598d Krystian Garbaciak        2012-06-15  1107  			ret = -ENOMEM;
6863ca6227598d Krystian Garbaciak        2012-06-15  1108  			goto err_range;
6863ca6227598d Krystian Garbaciak        2012-06-15  1109  		}
6863ca6227598d Krystian Garbaciak        2012-06-15  1110  
4b020b3f9ba2af Mark Brown                2012-10-03  1111  		new->map = map;
d058bb49618482 Mark Brown                2012-10-03  1112  		new->name = range_cfg->name;
6863ca6227598d Krystian Garbaciak        2012-06-15  1113  		new->range_min = range_cfg->range_min;
6863ca6227598d Krystian Garbaciak        2012-06-15  1114  		new->range_max = range_cfg->range_max;
6863ca6227598d Krystian Garbaciak        2012-06-15  1115  		new->selector_reg = range_cfg->selector_reg;
6863ca6227598d Krystian Garbaciak        2012-06-15  1116  		new->selector_mask = range_cfg->selector_mask;
6863ca6227598d Krystian Garbaciak        2012-06-15  1117  		new->selector_shift = range_cfg->selector_shift;
6863ca6227598d Krystian Garbaciak        2012-06-15  1118  		new->window_start = range_cfg->window_start;
6863ca6227598d Krystian Garbaciak        2012-06-15  1119  		new->window_len = range_cfg->window_len;
6863ca6227598d Krystian Garbaciak        2012-06-15  1120  
53e87f88b14c01 Nenghua Cao               2014-02-21  1121  		if (!_regmap_range_add(map, new)) {
061adc064adbbd Mark Brown                2012-10-03  1122  			dev_err(map->dev, "Failed to add range %d\n", i);
6863ca6227598d Krystian Garbaciak        2012-06-15  1123  			kfree(new);
6863ca6227598d Krystian Garbaciak        2012-06-15  1124  			goto err_range;
6863ca6227598d Krystian Garbaciak        2012-06-15  1125  		}
6863ca6227598d Krystian Garbaciak        2012-06-15  1126  
6863ca6227598d Krystian Garbaciak        2012-06-15  1127  		if (map->selector_work_buf == NULL) {
6863ca6227598d Krystian Garbaciak        2012-06-15  1128  			map->selector_work_buf =
6863ca6227598d Krystian Garbaciak        2012-06-15  1129  				kzalloc(map->format.buf_size, GFP_KERNEL);
6863ca6227598d Krystian Garbaciak        2012-06-15  1130  			if (map->selector_work_buf == NULL) {
6863ca6227598d Krystian Garbaciak        2012-06-15  1131  				ret = -ENOMEM;
6863ca6227598d Krystian Garbaciak        2012-06-15  1132  				goto err_range;
6863ca6227598d Krystian Garbaciak        2012-06-15  1133  			}
6863ca6227598d Krystian Garbaciak        2012-06-15  1134  		}
6863ca6227598d Krystian Garbaciak        2012-06-15  1135  	}
052d2cd123e7e3 Mark Brown                2011-11-21  1136  
e5e3b8abeda1cf Lars-Peter Clausen        2011-11-16  1137  	ret = regcache_init(map, config);
0ff3e62ff119f2 Mark Brown                2012-10-04  1138  	if (ret != 0)
6863ca6227598d Krystian Garbaciak        2012-06-15  1139  		goto err_range;
6863ca6227598d Krystian Garbaciak        2012-06-15  1140  
a7a037c837cb0f Daeseok Youn              2014-04-01  1141  	if (dev) {
6cfec04bcc05a8 Michal Simek              2014-02-10  1142  		ret = regmap_attach_dev(dev, map, config);
6cfec04bcc05a8 Michal Simek              2014-02-10  1143  		if (ret != 0)
6cfec04bcc05a8 Michal Simek              2014-02-10  1144  			goto err_regcache;
9b947a13e7f601 David Lechner             2018-02-19  1145  	} else {
94cc89eb8fa503 Charles Keepax            2020-09-17  1146  		regmap_debugfs_init(map);
a7a037c837cb0f Daeseok Youn              2014-04-01  1147  	}
72b39f6f2b5a6b Mark Brown                2012-05-08  1148  
af560701e36650 Mark Brown                2024-02-23 @1149  	if (bus->init) {
af560701e36650 Mark Brown                2024-02-23  1150  		ret = bus->init(map);
af560701e36650 Mark Brown                2024-02-23  1151  		if (ret != 0)
af560701e36650 Mark Brown                2024-02-23  1152  			goto err_regcache;
af560701e36650 Mark Brown                2024-02-23  1153  	}
af560701e36650 Mark Brown                2024-02-23  1154  
b83a313bf25201 Mark Brown                2011-05-11  1155  	return map;
b83a313bf25201 Mark Brown                2011-05-11  1156  
6cfec04bcc05a8 Michal Simek              2014-02-10  1157  err_regcache:
72b39f6f2b5a6b Mark Brown                2012-05-08  1158  	regcache_exit(map);
6863ca6227598d Krystian Garbaciak        2012-06-15  1159  err_range:
6863ca6227598d Krystian Garbaciak        2012-06-15  1160  	regmap_range_exit(map);
58072cbfc522c2 Lars-Peter Clausen        2011-11-10  1161  	kfree(map->work_buf);
8698b9364710e7 Baolin Wang               2017-11-01  1162  err_hwlock:
a1a68fcaf165a6 Baolin Wang               2017-11-20  1163  	if (map->hwlock)
8698b9364710e7 Baolin Wang               2017-11-01  1164  		hwspin_lock_free(map->hwlock);
8253bb3f82554c Bartosz Golaszewski       2017-12-13  1165  err_name:
8253bb3f82554c Bartosz Golaszewski       2017-12-13  1166  	kfree_const(map->name);
b83a313bf25201 Mark Brown                2011-05-11  1167  err_map:
b83a313bf25201 Mark Brown                2011-05-11  1168  	kfree(map);
b83a313bf25201 Mark Brown                2011-05-11  1169  err:
b83a313bf25201 Mark Brown                2011-05-11  1170  	return ERR_PTR(ret);
b83a313bf25201 Mark Brown                2011-05-11  1171  }
3cfe7a74d42b7e Nicolas Boichat           2015-07-08  1172  EXPORT_SYMBOL_GPL(__regmap_init);
b83a313bf25201 Mark Brown                2011-05-11  1173  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
