Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E86E11722
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 15:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJC/T9fy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699199435; x=1730735435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mUse8Rx0MIxUSdRl5dnoAaB6oJIi6peHQJ+D3meP0NE=;
  b=jJC/T9fyjT0rWd0Trfei8IMqCwIqS9WO+g/ClmSTc6CbHrUShAhlJSM3
   EUGQvBOF2a9Q1022JL8HoYYcURsdz4tfY8zwQF6PsAv7U/KWJX96payWx
   ao4u8aZme3IO0lT/MjsnsF052W1SAkmK69cTihYyKHJdRF8w/Ga9uF91B
   AKraW5WDzAUKKR1CHxueXN4bLenwoQUb/h79Iba+gqGS2d/HSjY8voQEQ
   Go+kdKsR+XLUglOGLohVfJqMRemwk7cW5VGpa476gn21Pgy5OcMPfWK/l
   8b6lkirchRqPbY7aUOzEtWBIeXEy1G2l2PrHgpu1RA27fOYjuJldFe0+c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="368491611"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="368491611"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 07:50:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="10229033"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2023 07:50:33 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzfOR-0005ZT-05;
	Sun, 05 Nov 2023 15:50:31 +0000
Date: Sun, 5 Nov 2023 23:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/buckets.c:1412 bch2_trans_fs_usage_apply() error: we
 previously assumed 'trans->disk_res' could be null (see line 1369)
Message-ID: <202311052326.jiJldi3B-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: 35d5aff263629caf98305d12c02d8b64d6981625 bcachefs: Kill bch2_fs_usage_scratch_get()
date:   2 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231105/202311052326.jiJldi3B-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231105/202311052326.jiJldi3B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311052326.jiJldi3B-lkp@intel.com/

New smatch warnings:
fs/bcachefs/buckets.c:1412 bch2_trans_fs_usage_apply() error: we previously assumed 'trans->disk_res' could be null (see line 1369)

Old smatch warnings:
fs/bcachefs/buckets.c:1121 bch2_mark_stripe() error: we previously assumed 'new_s' could be null (see line 1082)
fs/bcachefs/buckets.c:2093 bch2_trans_mark_metadata_sectors() error: uninitialized symbol 'ret'.

vim +1412 fs/bcachefs/buckets.c

b35b1925832e63 Kent Overstreet 2018-11-05  1362  
35d5aff263629c Kent Overstreet 2021-04-03  1363  void bch2_trans_fs_usage_apply(struct btree_trans *trans,
35d5aff263629c Kent Overstreet 2021-04-03  1364  			       struct replicas_delta_list *deltas)
35d5aff263629c Kent Overstreet 2021-04-03  1365  {
35d5aff263629c Kent Overstreet 2021-04-03  1366  	struct bch_fs *c = trans->c;
35d5aff263629c Kent Overstreet 2021-04-03  1367  	static int warned_disk_usage = 0;
35d5aff263629c Kent Overstreet 2021-04-03  1368  	bool warn = false;
35d5aff263629c Kent Overstreet 2021-04-03 @1369  	unsigned disk_res_sectors = trans->disk_res ? trans->disk_res->sectors : 0;
35d5aff263629c Kent Overstreet 2021-04-03  1370  	struct replicas_delta *d = deltas->d;
35d5aff263629c Kent Overstreet 2021-04-03  1371  	struct replicas_delta *top = (void *) deltas->d + deltas->used;
35d5aff263629c Kent Overstreet 2021-04-03  1372  	struct bch_fs_usage *dst;
35d5aff263629c Kent Overstreet 2021-04-03  1373  	s64 added = 0, should_not_have_added;
35d5aff263629c Kent Overstreet 2021-04-03  1374  	unsigned i;
35d5aff263629c Kent Overstreet 2021-04-03  1375  
35d5aff263629c Kent Overstreet 2021-04-03  1376  	percpu_rwsem_assert_held(&c->mark_lock);
35d5aff263629c Kent Overstreet 2021-04-03  1377  
35d5aff263629c Kent Overstreet 2021-04-03  1378  	preempt_disable();
35d5aff263629c Kent Overstreet 2021-04-03  1379  	dst = fs_usage_ptr(c, trans->journal_res.seq, false);
35d5aff263629c Kent Overstreet 2021-04-03  1380  
35d5aff263629c Kent Overstreet 2021-04-03  1381  	for (d = deltas->d; d != top; d = replicas_delta_next(d)) {
35d5aff263629c Kent Overstreet 2021-04-03  1382  		switch (d->r.data_type) {
35d5aff263629c Kent Overstreet 2021-04-03  1383  		case BCH_DATA_btree:
35d5aff263629c Kent Overstreet 2021-04-03  1384  		case BCH_DATA_user:
35d5aff263629c Kent Overstreet 2021-04-03  1385  		case BCH_DATA_parity:
35d5aff263629c Kent Overstreet 2021-04-03  1386  			added += d->delta;
35d5aff263629c Kent Overstreet 2021-04-03  1387  		}
35d5aff263629c Kent Overstreet 2021-04-03  1388  
35d5aff263629c Kent Overstreet 2021-04-03  1389  		update_replicas(c, dst, &d->r, d->delta);
35d5aff263629c Kent Overstreet 2021-04-03  1390  	}
35d5aff263629c Kent Overstreet 2021-04-03  1391  
35d5aff263629c Kent Overstreet 2021-04-03  1392  	dst->nr_inodes += deltas->nr_inodes;
35d5aff263629c Kent Overstreet 2021-04-03  1393  
35d5aff263629c Kent Overstreet 2021-04-03  1394  	for (i = 0; i < BCH_REPLICAS_MAX; i++) {
35d5aff263629c Kent Overstreet 2021-04-03  1395  		added				+= deltas->persistent_reserved[i];
35d5aff263629c Kent Overstreet 2021-04-03  1396  		dst->reserved			+= deltas->persistent_reserved[i];
35d5aff263629c Kent Overstreet 2021-04-03  1397  		dst->persistent_reserved[i]	+= deltas->persistent_reserved[i];
35d5aff263629c Kent Overstreet 2021-04-03  1398  	}
35d5aff263629c Kent Overstreet 2021-04-03  1399  
35d5aff263629c Kent Overstreet 2021-04-03  1400  	/*
35d5aff263629c Kent Overstreet 2021-04-03  1401  	 * Not allowed to reduce sectors_available except by getting a
35d5aff263629c Kent Overstreet 2021-04-03  1402  	 * reservation:
35d5aff263629c Kent Overstreet 2021-04-03  1403  	 */
35d5aff263629c Kent Overstreet 2021-04-03  1404  	should_not_have_added = added - (s64) disk_res_sectors;
35d5aff263629c Kent Overstreet 2021-04-03  1405  	if (unlikely(should_not_have_added > 0)) {
35d5aff263629c Kent Overstreet 2021-04-03  1406  		atomic64_sub(should_not_have_added, &c->sectors_available);
35d5aff263629c Kent Overstreet 2021-04-03  1407  		added -= should_not_have_added;
35d5aff263629c Kent Overstreet 2021-04-03  1408  		warn = true;
35d5aff263629c Kent Overstreet 2021-04-03  1409  	}
35d5aff263629c Kent Overstreet 2021-04-03  1410  
35d5aff263629c Kent Overstreet 2021-04-03  1411  	if (added > 0) {
35d5aff263629c Kent Overstreet 2021-04-03 @1412  		trans->disk_res->sectors -= added;
35d5aff263629c Kent Overstreet 2021-04-03  1413  		this_cpu_sub(*c->online_reserved, added);
35d5aff263629c Kent Overstreet 2021-04-03  1414  	}
35d5aff263629c Kent Overstreet 2021-04-03  1415  
35d5aff263629c Kent Overstreet 2021-04-03  1416  	preempt_enable();
35d5aff263629c Kent Overstreet 2021-04-03  1417  
35d5aff263629c Kent Overstreet 2021-04-03  1418  	if (unlikely(warn) && !xchg(&warned_disk_usage, 1))
35d5aff263629c Kent Overstreet 2021-04-03  1419  		fs_usage_apply_warn(trans, disk_res_sectors);
35d5aff263629c Kent Overstreet 2021-04-03  1420  }
35d5aff263629c Kent Overstreet 2021-04-03  1421  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
