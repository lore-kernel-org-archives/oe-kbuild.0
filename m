Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EDC290B
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 23:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686439339; x=1717975339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xuhZ0GdHyGuBXQaq6SU5Gn5/WXADdw5PqMd7RhVvKNk=;
  b=cvhJfxVS2pdWOVTe8Zn23QVZlNhUuMtQ+xyvn7JQnld8F8XEoL5Z9WBm
   d40w571gEjrPcC38aK1JViDgZW5sdlayr5H6gBhxlfbeS4CzQq39z0LDF
   AF29N+bvwRiVBWi8uaHUTfG4/VhxIf2asn1JxR6Q6/f00TEMYH+F4lrao
   Moy97ii2ksj2Hu/LQWZhTPWM6BCR9iEQup98LWwHHrTvJ6IJDXJNrY9GY
   2dkJ+8nNOEQikqdMTkOCAlKNidWcsjC5K4oONMVt3zSxg7bVHrWepzdAo
   QWWY8cDBK5rNhS00UxO6AnZnudC3xGD850plF0SiZPPKWWbLUX1WS52El
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="360294209"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="360294209"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 16:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="710752329"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="710752329"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Jun 2023 16:22:17 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q87uS-000AUi-0x;
	Sat, 10 Jun 2023 23:22:16 +0000
Date: Sun, 11 Jun 2023 07:21:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [colyli-bcache:for-next 4/7] drivers/md/bcache/btree.c:1511
 btree_gc_rewrite_node() error: 'n' dereferencing possible ERR_PTR()
Message-ID: <202306110753.VR6S20cb-lkp@intel.com>
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
TO: Zheng Wang <zyytlz.wz@163.com>
CC: Coly Li <colyli@suse.de>

Hi Zheng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git for-next
head:   313c29cf50657b993b76a2df466b9c09ac8f3d83
commit: 71e765f4f8e55289201daa575331e011f80c0b12 [4/7] bcache: Remove some unnecessary NULL point check for the return value of __bch_btree_node_alloc-related pointer
:::::: branch date: 5 days ago
:::::: commit date: 11 days ago
config: parisc-randconfig-m031-20230608 (https://download.01.org/0day-ci/archive/20230611/202306110753.VR6S20cb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306110753.VR6S20cb-lkp@intel.com/

New smatch warnings:
drivers/md/bcache/btree.c:1511 btree_gc_rewrite_node() error: 'n' dereferencing possible ERR_PTR()

Old smatch warnings:
arch/parisc/include/asm/hash.h:44 __hash_32() warn: inconsistent indenting
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
