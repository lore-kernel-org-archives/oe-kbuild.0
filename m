Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633D8328D7
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 17:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBypC7qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701105526; x=1732641526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YQxrwb1Bs8Ctq4b3+5WdzmNBuCcJ8Lhs1YVilJxqQN4=;
  b=GBypC7qyWAX6e+pZilklUO6WFWpHJ3jiMK5CIzmc0riwBt7r07F2xOl7
   orN9RNRD86WBv/WBsviln6QnUFzbe26trz9E0IHnJhK/Ckg7E1cYCGFDr
   CVNGAxPBxO8sUVqGXGz7MTyriAJt863kg9Da+p+WZ1nXSlfAx/aGSbZi0
   VPGcxpNjcg+JBQDyCOSOeEwrIsgujr85WYf+747L+dGvISiwnxcqjeZAV
   v6Ot51Hi1vTWesha25MiGua3ObVodOgFVP6HjjgEobPRzWqDUp8xXjaSP
   sWHt/IWRx6FzbG+OiTOgjHj4zvqSArm/+cunt2JeATqjFQEWoQeofUX/M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="457080126"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="457080126"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 09:18:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="802712395"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="802712395"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Nov 2023 09:18:44 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7fFq-0006Uq-0R;
	Mon, 27 Nov 2023 17:18:42 +0000
Date: Tue, 28 Nov 2023 01:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/btree_update_interior.c:377 __bch2_btree_node_alloc()
 error: 'b' dereferencing possible ERR_PTR()
Message-ID: <202311280036.ug2p4YLo-lkp@intel.com>
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
head:   2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
commit: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit
date:   5 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 weeks ago
config: mips-randconfig-r071-20231127 (https://download.01.org/0day-ci/archive/20231128/202311280036.ug2p4YLo-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231128/202311280036.ug2p4YLo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311280036.ug2p4YLo-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree_update_interior.c:377 __bch2_btree_node_alloc() error: 'b' dereferencing possible ERR_PTR()

vim +/b +377 fs/bcachefs/btree_update_interior.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  306  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  307  static struct btree *__bch2_btree_node_alloc(struct bch_fs *c,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  308  					     struct disk_reservation *res,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  309  					     struct closure *cl,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  310  					     unsigned flags)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  311  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  312  	struct write_point *wp;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  313  	struct btree *b;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  314  	BKEY_PADDED(k) tmp;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  315  	struct bkey_i_extent *e;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  316  	struct btree_ob_ref ob;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  317  	struct bch_devs_list devs_have = (struct bch_devs_list) { 0 };
1c6fdbd8f2465d Kent Overstreet 2017-03-16  318  	unsigned nr_reserve;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  319  	enum alloc_reserve alloc_reserve;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  320  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  321  	if (flags & BTREE_INSERT_USE_ALLOC_RESERVE) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  322  		nr_reserve	= 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  323  		alloc_reserve	= RESERVE_ALLOC;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  324  	} else if (flags & BTREE_INSERT_USE_RESERVE) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  325  		nr_reserve	= BTREE_NODE_RESERVE / 2;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  326  		alloc_reserve	= RESERVE_BTREE;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  327  	} else {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  328  		nr_reserve	= BTREE_NODE_RESERVE;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  329  		alloc_reserve	= RESERVE_NONE;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  330  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  331  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  332  	mutex_lock(&c->btree_reserve_cache_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  333  	if (c->btree_reserve_cache_nr > nr_reserve) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  334  		struct btree_alloc *a =
1c6fdbd8f2465d Kent Overstreet 2017-03-16  335  			&c->btree_reserve_cache[--c->btree_reserve_cache_nr];
1c6fdbd8f2465d Kent Overstreet 2017-03-16  336  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  337  		ob = a->ob;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  338  		bkey_copy(&tmp.k, &a->k);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  339  		mutex_unlock(&c->btree_reserve_cache_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  340  		goto mem_alloc;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  341  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  342  	mutex_unlock(&c->btree_reserve_cache_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  343  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  344  retry:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  345  	wp = bch2_alloc_sectors_start(c, c->opts.foreground_target,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  346  				      writepoint_ptr(&c->btree_write_point),
1c6fdbd8f2465d Kent Overstreet 2017-03-16  347  				      &devs_have,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  348  				      res->nr_replicas,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  349  				      c->opts.metadata_replicas_required,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  350  				      alloc_reserve, 0, cl);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  351  	if (IS_ERR(wp))
1c6fdbd8f2465d Kent Overstreet 2017-03-16  352  		return ERR_CAST(wp);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  353  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  354  	if (wp->sectors_free < c->opts.btree_node_size) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  355  		struct open_bucket *ob;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  356  		unsigned i;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  357  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  358  		writepoint_for_each_ptr(wp, ob, i)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  359  			if (ob->sectors_free < c->opts.btree_node_size)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  360  				ob->sectors_free = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  361  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  362  		bch2_alloc_sectors_done(c, wp);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  363  		goto retry;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  364  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  365  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  366  	e = bkey_extent_init(&tmp.k);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  367  	bch2_alloc_sectors_append_ptrs(c, wp, e, c->opts.btree_node_size);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  368  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  369  	ob.nr = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  370  	bch2_open_bucket_get(c, wp, &ob.nr, ob.refs);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  371  	bch2_alloc_sectors_done(c, wp);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  372  mem_alloc:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  373  	b = bch2_btree_node_mem_alloc(c);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  374  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  375  	/* we hold cannibalize_lock: */
1c6fdbd8f2465d Kent Overstreet 2017-03-16  376  	BUG_ON(IS_ERR(b));
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @377  	BUG_ON(b->ob.nr);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  378  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  379  	bkey_copy(&b->key, &tmp.k);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  380  	b->ob = ob;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  381  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  382  	return b;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  383  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  384  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
