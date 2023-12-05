Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3BC63DCF
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 16:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNVvZlUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701792352; x=1733328352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BIA0hAnRw9CDB9q6mGZspsSFA2OpGkrasfz58Ob6ohw=;
  b=BNVvZlUufZCjMIXD4eQCP6qZ702YjGM7dJtXvZWj6UchMOPMygBWGCVG
   NQ/IFDWotEZQzRvvaq5vaDOAv8oFFioFEwytFmNmlwR1YuE+S/XtnzDF1
   xyOOw0MceUsBBB2Fw8Pk7VCZwFkOpUDi5/xcQ7+ygV9r57JQsPD/wsi8i
   G0zqUzt2htwQWPQw3LTvzLZ++Q7nCFEAk9+EFw+q17oIN37vYPjf9Yime
   WTuzv5V5ZYk/8iUcUoLWRRBVd00S9Tsl4eY7hb6n26e84Uw1m2jrjjNqp
   xDC67iaqCpL9YXswbZzlt7CmI2wTPKc8/T79QN9gYgntgBo7iVZOgP19p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="425071415"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="425071415"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 08:05:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="720754089"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="720754089"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2023 08:05:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAXvb-0009J2-2f;
	Tue, 05 Dec 2023 16:05:43 +0000
Date: Wed, 6 Dec 2023 00:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/movinggc.c:173:12-13: WARNING opportunity for min()
Message-ID: <202312060055.WQaXbyUR-lkp@intel.com>
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
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 8fcdf81418f16ef878de7a7535e90599e396fd69 bcachefs: Improved copygc pipelining
date:   6 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-104-20231204 (https://download.01.org/0day-ci/archive/20231206/202312060055.WQaXbyUR-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060055.WQaXbyUR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312060055.WQaXbyUR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/movinggc.c:173:12-13: WARNING opportunity for min()

vim +173 fs/bcachefs/movinggc.c

8fcdf81418f16e Kent Overstreet 2023-02-27  126  
8fcdf81418f16e Kent Overstreet 2023-02-27  127  static int bch2_copygc_get_buckets(struct btree_trans *trans,
8fcdf81418f16e Kent Overstreet 2023-02-27  128  			struct moving_context *ctxt,
8fcdf81418f16e Kent Overstreet 2023-02-27  129  			move_buckets_in_flight *buckets_in_flight,
8fcdf81418f16e Kent Overstreet 2023-02-27  130  			move_buckets *buckets)
80c33085783656 Kent Overstreet 2022-12-05  131  {
80c33085783656 Kent Overstreet 2022-12-05  132  	struct btree_iter iter;
8fcdf81418f16e Kent Overstreet 2023-02-27  133  	move_buckets buckets_sorted = { 0 };
8fcdf81418f16e Kent Overstreet 2023-02-27  134  	struct move_bucket_in_flight *i;
80c33085783656 Kent Overstreet 2022-12-05  135  	struct bkey_s_c k;
8fcdf81418f16e Kent Overstreet 2023-02-27  136  	size_t fifo_iter, nr_to_get;
80c33085783656 Kent Overstreet 2022-12-05  137  	int ret;
80c33085783656 Kent Overstreet 2022-12-05  138  
8fcdf81418f16e Kent Overstreet 2023-02-27  139  	move_buckets_wait(trans, ctxt, buckets_in_flight, buckets_in_flight->size / 2, true);
8fcdf81418f16e Kent Overstreet 2023-02-27  140  
8fcdf81418f16e Kent Overstreet 2023-02-27  141  	nr_to_get = max(16UL, fifo_used(buckets_in_flight) / 4);
8fcdf81418f16e Kent Overstreet 2023-02-27  142  
8fcdf81418f16e Kent Overstreet 2023-02-27  143  	fifo_for_each_entry_ptr(i, buckets_in_flight, fifo_iter) {
8fcdf81418f16e Kent Overstreet 2023-02-27  144  		ret = darray_push(&buckets_sorted, ((struct move_bucket) {i->bucket, i->gen}));
8fcdf81418f16e Kent Overstreet 2023-02-27  145  		if (ret) {
8fcdf81418f16e Kent Overstreet 2023-02-27  146  			bch_err(trans->c, "error allocating move_buckets_sorted");
8fcdf81418f16e Kent Overstreet 2023-02-27  147  			goto err;
8fcdf81418f16e Kent Overstreet 2023-02-27  148  		}
8fcdf81418f16e Kent Overstreet 2023-02-27  149  	}
8fcdf81418f16e Kent Overstreet 2023-02-27  150  
8fcdf81418f16e Kent Overstreet 2023-02-27  151  	sort(buckets_sorted.data,
8fcdf81418f16e Kent Overstreet 2023-02-27  152  	     buckets_sorted.nr,
8fcdf81418f16e Kent Overstreet 2023-02-27  153  	     sizeof(buckets_sorted.data[0]),
8fcdf81418f16e Kent Overstreet 2023-02-27  154  	     move_bucket_cmp,
8fcdf81418f16e Kent Overstreet 2023-02-27  155  	     NULL);
8fcdf81418f16e Kent Overstreet 2023-02-27  156  
80c33085783656 Kent Overstreet 2022-12-05  157  	ret = for_each_btree_key2_upto(trans, iter, BTREE_ID_lru,
8fcdf81418f16e Kent Overstreet 2023-02-27  158  				  lru_pos(BCH_LRU_FRAGMENTATION_START, 0, 0),
80c33085783656 Kent Overstreet 2022-12-05  159  				  lru_pos(BCH_LRU_FRAGMENTATION_START, U64_MAX, LRU_TIME_MAX),
80c33085783656 Kent Overstreet 2022-12-05  160  				  0, k, ({
8fcdf81418f16e Kent Overstreet 2023-02-27  161  		struct move_bucket b = { .bucket = u64_to_bucket(k.k->p.offset) };
8fcdf81418f16e Kent Overstreet 2023-02-27  162  		int ret = 0;
80c33085783656 Kent Overstreet 2022-12-05  163  
8fcdf81418f16e Kent Overstreet 2023-02-27  164  		if (!bucket_in_flight(&buckets_sorted, b) &&
8fcdf81418f16e Kent Overstreet 2023-02-27  165  		    bch2_bucket_is_movable(trans, b.bucket, lru_pos_time(k.k->p), &b.gen))
8fcdf81418f16e Kent Overstreet 2023-02-27  166  			ret = darray_push(buckets, b) ?: buckets->nr >= nr_to_get;
8fcdf81418f16e Kent Overstreet 2023-02-27  167  
8fcdf81418f16e Kent Overstreet 2023-02-27  168  		ret;
80c33085783656 Kent Overstreet 2022-12-05  169  	}));
8fcdf81418f16e Kent Overstreet 2023-02-27  170  err:
8fcdf81418f16e Kent Overstreet 2023-02-27  171  	darray_exit(&buckets_sorted);
80c33085783656 Kent Overstreet 2022-12-05  172  
8fcdf81418f16e Kent Overstreet 2023-02-27 @173  	return ret < 0 ? ret : 0;
80c33085783656 Kent Overstreet 2022-12-05  174  }
80c33085783656 Kent Overstreet 2022-12-05  175  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
