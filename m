Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8418944C8F
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Dec 2023 15:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRFfzufD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702827203; x=1734363203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=owcyJCX53XI01KIAPs3YR+U70yF5ayMf94PJGhrT1Kg=;
  b=KRFfzufDzulRmSgLS6fH4uYiaryaA97W8F5zzV/4mFc3hmyz2EGfs/cG
   lwCb0BvyP7TcDCH62MKleSLXwF/R6zgwc0WvNsDhrSU4V4ayCwY6PS9m/
   PNpoIjNdPrjXyRsgzt7aGvDfiJZi7Y8mT3RZK63Nb8vk46h1G6zBokp0X
   +Uc+AdaXP747/njV3tsQo7yBW1nlZtiq6Lj3bZ6LqeerkQXSNGs6TCE1V
   PPDO+KJN1/YPX/hnZr7Lp4m2k69JkFuTILTy/OYDapVuB3gS8VPXVQ90O
   TgTbirqqAwzU9NlUooCctq9RWjXhmvXBtowT6/inPKdx3/nuNGLJddS2T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2511839"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="2511839"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 07:33:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="23446880"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Dec 2023 07:33:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEt8p-0003AC-1B;
	Sun, 17 Dec 2023 15:33:19 +0000
Date: Sun, 17 Dec 2023 23:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bcachefs:bcachefs-testing 155/174] fs/bcachefs/btree_iter.c:1545:9:
 sparse:    unsigned long [noderef] __rcu *
Message-ID: <202312172310.4AyvwEjU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/btree_iter.c:1545:9: sparse:    unsigned long [noderef] __rcu *"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Kent Overstreet <kmo@daterainc.com>
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   16609653d3eeb730d5a4b5d19266d52f9e7b8ea3
commit: e29e7a77e4132dc68611fe1d5c120c992295b4f6 [155/174] bcachefs: growable btree_paths
:::::: branch date: 5 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-123-20231217 (https://download.01.org/0day-ci/archive/20231217/202312172310.4AyvwEjU-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312172310.4AyvwEjU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312172310.4AyvwEjU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/btree_iter.c: note: in included file:
   fs/bcachefs/bcachefs.h:1007:9: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_iter.c:1545:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> fs/bcachefs/btree_iter.c:1545:9: sparse:    unsigned long [noderef] __rcu *
>> fs/bcachefs/btree_iter.c:1545:9: sparse:    unsigned long *
   fs/bcachefs/btree_iter.c:1546:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> fs/bcachefs/btree_iter.c:1546:9: sparse:    unsigned char [noderef] __rcu *
>> fs/bcachefs/btree_iter.c:1546:9: sparse:    unsigned char [usertype] *
   fs/bcachefs/btree_iter.c:1547:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree_iter.c:1547:9: sparse:    struct btree_path [noderef] __rcu *
   fs/bcachefs/btree_iter.c:1547:9: sparse:    struct btree_path *
   fs/bcachefs/btree_iter.c:1548:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> fs/bcachefs/btree_iter.c:1548:9: sparse:    struct btree_insert_entry [noderef] __rcu *
>> fs/bcachefs/btree_iter.c:1548:9: sparse:    struct btree_insert_entry *
   fs/bcachefs/btree_iter.c: note: in included file (through fs/bcachefs/btree_types.h, fs/bcachefs/bcachefs.h):
   fs/bcachefs/replicas_types.h:24:34: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_iter.c:3118:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree_iter.c:3118:36: sparse:    struct btree_path [noderef] __rcu *
   fs/bcachefs/btree_iter.c:3118:36: sparse:    struct btree_path *
   fs/bcachefs/btree_iter.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:285:9: sparse: sparse: context imbalance in 'bch2_trans_srcu_unlock' - unexpected unlock
   fs/bcachefs/btree_iter.c:2816:9: sparse: sparse: context imbalance in 'bch2_trans_srcu_lock' - different lock contexts for basic block
   fs/bcachefs/btree_iter.c:3035:9: sparse: sparse: context imbalance in 'bch2_trans_put' - different lock contexts for basic block

vim +1545 fs/bcachefs/btree_iter.c

69f0f3eda7236a Kent Overstreet 2023-11-26  1517  
e29e7a77e4132d Kent Overstreet 2023-12-10  1518  static noinline void btree_paths_realloc(struct btree_trans *trans)
3f3bc66ef0601e Kent Overstreet 2022-09-26  1519  {
e29e7a77e4132d Kent Overstreet 2023-12-10  1520  	unsigned nr = trans->nr_paths * 2;
e29e7a77e4132d Kent Overstreet 2023-12-10  1521  
e29e7a77e4132d Kent Overstreet 2023-12-10  1522  	void *p = kzalloc(BITS_TO_LONGS(nr) * sizeof(unsigned long) +
e29e7a77e4132d Kent Overstreet 2023-12-10  1523  			  nr + 8 +
e29e7a77e4132d Kent Overstreet 2023-12-10  1524  			  sizeof(struct btree_trans_paths) +
e29e7a77e4132d Kent Overstreet 2023-12-10  1525  			  nr * sizeof(struct btree_path) +
e29e7a77e4132d Kent Overstreet 2023-12-10  1526  			  nr * sizeof(struct btree_insert_entry), GFP_KERNEL|__GFP_NOFAIL);
e29e7a77e4132d Kent Overstreet 2023-12-10  1527  
e29e7a77e4132d Kent Overstreet 2023-12-10  1528  	unsigned long *paths_allocated = p;
e29e7a77e4132d Kent Overstreet 2023-12-10  1529  	p += BITS_TO_LONGS(nr) * sizeof(unsigned long);
e29e7a77e4132d Kent Overstreet 2023-12-10  1530  	struct btree_path *paths = p;
e29e7a77e4132d Kent Overstreet 2023-12-10  1531  	p += nr * sizeof(struct btree_path);
e29e7a77e4132d Kent Overstreet 2023-12-10  1532  	u8 *sorted = p;
e29e7a77e4132d Kent Overstreet 2023-12-10  1533  	p += nr + 8;
e29e7a77e4132d Kent Overstreet 2023-12-10  1534  	struct btree_insert_entry *updates = p;
e29e7a77e4132d Kent Overstreet 2023-12-10  1535  
e29e7a77e4132d Kent Overstreet 2023-12-10  1536  	*trans_paths_nr(paths) = nr;
e29e7a77e4132d Kent Overstreet 2023-12-10  1537  
e29e7a77e4132d Kent Overstreet 2023-12-10  1538  	memcpy(paths_allocated, trans->paths_allocated, BITS_TO_LONGS(trans->nr_paths) * sizeof(unsigned long));
e29e7a77e4132d Kent Overstreet 2023-12-10  1539  	memcpy(sorted, trans->sorted, trans->nr_sorted);
e29e7a77e4132d Kent Overstreet 2023-12-10  1540  	memcpy(paths, trans->paths, trans->nr_paths * sizeof(struct btree_path));
e29e7a77e4132d Kent Overstreet 2023-12-10  1541  	memcpy(updates, trans->updates, trans->nr_paths * sizeof(struct btree_path));
e29e7a77e4132d Kent Overstreet 2023-12-10  1542  
e29e7a77e4132d Kent Overstreet 2023-12-10  1543  	unsigned long *old = trans->paths_allocated;
e29e7a77e4132d Kent Overstreet 2023-12-10  1544  
e29e7a77e4132d Kent Overstreet 2023-12-10 @1545  	rcu_assign_pointer(trans->paths_allocated,	paths_allocated);
e29e7a77e4132d Kent Overstreet 2023-12-10 @1546  	rcu_assign_pointer(trans->sorted,		sorted);
e29e7a77e4132d Kent Overstreet 2023-12-10  1547  	rcu_assign_pointer(trans->paths,		paths);
e29e7a77e4132d Kent Overstreet 2023-12-10 @1548  	rcu_assign_pointer(trans->updates,		updates);
e29e7a77e4132d Kent Overstreet 2023-12-10  1549  
e29e7a77e4132d Kent Overstreet 2023-12-10  1550  	trans->nr_paths		= nr;
e29e7a77e4132d Kent Overstreet 2023-12-10  1551  
e29e7a77e4132d Kent Overstreet 2023-12-10  1552  	if (old != trans->_paths_allocated)
e29e7a77e4132d Kent Overstreet 2023-12-10  1553  		kfree_rcu_mightsleep(trans->paths_allocated);
3f3bc66ef0601e Kent Overstreet 2022-09-26  1554  }
3f3bc66ef0601e Kent Overstreet 2022-09-26  1555  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
