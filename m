Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB773539D
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Oct 2023 05:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696398501; x=1727934501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6qou9P2lSuccMuNQADKw8ijZESqMBzUdNbKDiqA/zt8=;
  b=DvU/LfnYnJFG8O/dtcMNCxEyjplnRX/c++3y0Vbtxs0Ema/1R+/FekDV
   JCA+xCNO+MgZaUeOQc673snGUmwhr0kTRrhoUqNxisnVV9nrvHPeruKs+
   sxWm3D33Yc928LKYb6vhFPzxJzEBmuTowYMOa+k/beOC9Sj97X2zzZ9pR
   UFi32d8cuBLXvpPE+zfIdUaVktwmLg2d77kL8WOlxCuRn1NsH8ghR9Mjo
   umNP8mSTutiZBRIQdUn5aZ4SrmDmAD9lj/Ka91Bhx9q3yauW5iBusWvtv
   QC4fVja/ifDaMtQwv79PpS/Ho3PraKyiIPa3Db/HUhlLy/c23wN5bBaDN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="368122581"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="368122581"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 22:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="998328402"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="998328402"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 03 Oct 2023 22:48:17 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnuk3-000Chu-0R;
	Wed, 04 Oct 2023 05:48:15 +0000
Date: Wed, 4 Oct 2023 13:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/md/bcache/btree.c:1511 btree_gc_rewrite_node() error: 'n'
 dereferencing possible ERR_PTR()
Message-ID: <202310041357.5CbEneS7-lkp@intel.com>
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
TO: Zheng Wang <zyytlz.wz@163.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Coly Li <colyli@suse.de>

Hi Zheng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cbf3a2cb156a2c911d8f38d8247814b4c07f49a2
commit: 028ddcac477b691dd9205c92f991cc15259d033e bcache: Remove unnecessary NULL point check in node allocations
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20231003 (https://download.01.org/0day-ci/archive/20231004/202310041357.5CbEneS7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231004/202310041357.5CbEneS7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310041357.5CbEneS7-lkp@intel.com/

New smatch warnings:
drivers/md/bcache/btree.c:1511 btree_gc_rewrite_node() error: 'n' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/md/bcache/btree.c:1527 btree_gc_rewrite_node() error: 'n' dereferencing possible ERR_PTR()

vim +/n +1511 drivers/md/bcache/btree.c

cafe563591446c Kent Overstreet 2013-03-23  1496  
0a63b66db566cf Kent Overstreet 2014-03-17  1497  static int btree_gc_rewrite_node(struct btree *b, struct btree_op *op,
0a63b66db566cf Kent Overstreet 2014-03-17  1498  				 struct btree *replace)
0a63b66db566cf Kent Overstreet 2014-03-17  1499  {
0a63b66db566cf Kent Overstreet 2014-03-17  1500  	struct keylist keys;
0a63b66db566cf Kent Overstreet 2014-03-17  1501  	struct btree *n;
0a63b66db566cf Kent Overstreet 2014-03-17  1502  
0a63b66db566cf Kent Overstreet 2014-03-17  1503  	if (btree_check_reserve(b, NULL))
0a63b66db566cf Kent Overstreet 2014-03-17  1504  		return 0;
0a63b66db566cf Kent Overstreet 2014-03-17  1505  
0a63b66db566cf Kent Overstreet 2014-03-17  1506  	n = btree_node_alloc_replacement(replace, NULL);
0a63b66db566cf Kent Overstreet 2014-03-17  1507  
0a63b66db566cf Kent Overstreet 2014-03-17  1508  	/* recheck reserve after allocating replacement node */
0a63b66db566cf Kent Overstreet 2014-03-17  1509  	if (btree_check_reserve(b, NULL)) {
0a63b66db566cf Kent Overstreet 2014-03-17  1510  		btree_node_free(n);
0a63b66db566cf Kent Overstreet 2014-03-17 @1511  		rw_unlock(true, n);
0a63b66db566cf Kent Overstreet 2014-03-17  1512  		return 0;
0a63b66db566cf Kent Overstreet 2014-03-17  1513  	}
0a63b66db566cf Kent Overstreet 2014-03-17  1514  
0a63b66db566cf Kent Overstreet 2014-03-17  1515  	bch_btree_node_write_sync(n);
0a63b66db566cf Kent Overstreet 2014-03-17  1516  
0a63b66db566cf Kent Overstreet 2014-03-17  1517  	bch_keylist_init(&keys);
0a63b66db566cf Kent Overstreet 2014-03-17  1518  	bch_keylist_add(&keys, &n->key);
0a63b66db566cf Kent Overstreet 2014-03-17  1519  
0a63b66db566cf Kent Overstreet 2014-03-17  1520  	make_btree_freeing_key(replace, keys.top);
0a63b66db566cf Kent Overstreet 2014-03-17  1521  	bch_keylist_push(&keys);
0a63b66db566cf Kent Overstreet 2014-03-17  1522  
0a63b66db566cf Kent Overstreet 2014-03-17  1523  	bch_btree_insert_node(b, op, &keys, NULL, NULL);
0a63b66db566cf Kent Overstreet 2014-03-17  1524  	BUG_ON(!bch_keylist_empty(&keys));
0a63b66db566cf Kent Overstreet 2014-03-17  1525  
0a63b66db566cf Kent Overstreet 2014-03-17  1526  	btree_node_free(replace);
0a63b66db566cf Kent Overstreet 2014-03-17  1527  	rw_unlock(true, n);
0a63b66db566cf Kent Overstreet 2014-03-17  1528  
0a63b66db566cf Kent Overstreet 2014-03-17  1529  	/* Invalidated our iterator */
0a63b66db566cf Kent Overstreet 2014-03-17  1530  	return -EINTR;
0a63b66db566cf Kent Overstreet 2014-03-17  1531  }
0a63b66db566cf Kent Overstreet 2014-03-17  1532  

:::::: The code at line 1511 was first introduced by commit
:::::: 0a63b66db566cffdf90182eb6e66fdd4d0479e63 bcache: Rework btree cache reserve handling

:::::: TO: Kent Overstreet <kmo@daterainc.com>
:::::: CC: Kent Overstreet <kmo@daterainc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
