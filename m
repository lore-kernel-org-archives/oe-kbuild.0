Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC71F18636
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H91xLnJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699271524; x=1730807524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ALD3o06F3WtnXhCQh/kGxKG9J+mNFmsPNydD9vhj6Q=;
  b=H91xLnJSz6rgj585pCawFcK/9coRz4bZrt6r4ouyLanWVd8Ise0TF8Oc
   aLEIjz1KHeeA3Y4IKUncs+uq1QmpZNqVyum10faRzCmWYGb5MzjZ2pjtj
   t/wFGkaQmoN3HPA7kWQczS1fWq6eR7VG6F1XUVhZR7yJuCW88yrV2mBeD
   gFl9zs8+taou0Th2/3oTOzFXRKJ5MZk7sYAvXGCQQvJc3e4azzY0HohBp
   gHeH97DeLC5KBQLvW88Sx6ReNKPzKjdaAlWbewOGEiAMGBGAef6oLjV1n
   a7rfvmU1gRAYQ0csKTp9ENqbvKGK+TcrpPxrUzRz8JXplXcmts4Foq9XO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="475494038"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="475494038"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 03:52:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="765928161"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="765928161"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Nov 2023 03:51:59 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzy97-0006NG-0r;
	Mon, 06 Nov 2023 11:51:57 +0000
Date: Mon, 6 Nov 2023 19:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/movinggc.c:246 bch2_copygc() error: 'f' dereferencing
 possible ERR_PTR()
Message-ID: <202311061954.wPQeaHrX-lkp@intel.com>
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
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: 32de2ea0d5b7e2bc2a4eeac47e38aceb0ff25cc9 bcachefs: Rhashtable based buckets_in_flight for copygc
date:   2 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231106/202311061954.wPQeaHrX-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311061954.wPQeaHrX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311061954.wPQeaHrX-lkp@intel.com/

smatch warnings:
fs/bcachefs/movinggc.c:246 bch2_copygc() error: 'f' dereferencing possible ERR_PTR()

vim +/f +246 fs/bcachefs/movinggc.c

80c33085783656 Kent Overstreet 2022-12-05  214  
8fcdf81418f16e Kent Overstreet 2023-02-27  215  static int bch2_copygc(struct btree_trans *trans,
8fcdf81418f16e Kent Overstreet 2023-02-27  216  		       struct moving_context *ctxt,
32de2ea0d5b7e2 Kent Overstreet 2023-03-11  217  		       struct buckets_in_flight *buckets_in_flight)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  218  {
8fcdf81418f16e Kent Overstreet 2023-02-27  219  	struct bch_fs *c = trans->c;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  220  	struct data_update_opts data_opts = {
8e3f913e2ab6ac Kent Overstreet 2022-03-18  221  		.btree_insert_flags = BTREE_INSERT_USE_RESERVE|JOURNAL_WATERMARK_copygc,
8e3f913e2ab6ac Kent Overstreet 2022-03-18  222  	};
8fcdf81418f16e Kent Overstreet 2023-02-27  223  	move_buckets buckets = { 0 };
8fcdf81418f16e Kent Overstreet 2023-02-27  224  	struct move_bucket_in_flight *f;
8fcdf81418f16e Kent Overstreet 2023-02-27  225  	struct move_bucket *i;
8fcdf81418f16e Kent Overstreet 2023-02-27  226  	u64 moved = atomic64_read(&ctxt->stats->sectors_moved);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  227  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  228  
8fcdf81418f16e Kent Overstreet 2023-02-27  229  	ret = bch2_copygc_get_buckets(trans, ctxt, buckets_in_flight, &buckets);
8fcdf81418f16e Kent Overstreet 2023-02-27  230  	if (ret)
8fcdf81418f16e Kent Overstreet 2023-02-27  231  		goto err;
80c33085783656 Kent Overstreet 2022-12-05  232  
8fcdf81418f16e Kent Overstreet 2023-02-27  233  	darray_for_each(buckets, i) {
8fcdf81418f16e Kent Overstreet 2023-02-27  234  		if (unlikely(freezing(current)))
80c33085783656 Kent Overstreet 2022-12-05  235  			break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  236  
32de2ea0d5b7e2 Kent Overstreet 2023-03-11  237  		f = move_bucket_in_flight_add(buckets_in_flight, *i);
32de2ea0d5b7e2 Kent Overstreet 2023-03-11  238  		ret = PTR_ERR_OR_ZERO(f);
32de2ea0d5b7e2 Kent Overstreet 2023-03-11  239  		if (ret == -EEXIST) /* rare race: copygc_get_buckets returned same bucket more than once */
32de2ea0d5b7e2 Kent Overstreet 2023-03-11  240  			continue;
32de2ea0d5b7e2 Kent Overstreet 2023-03-11  241  		if (ret == -ENOMEM) { /* flush IO, continue later */
32de2ea0d5b7e2 Kent Overstreet 2023-03-11  242  			ret = 0;
32de2ea0d5b7e2 Kent Overstreet 2023-03-11  243  			break;
32de2ea0d5b7e2 Kent Overstreet 2023-03-11  244  		}
8fcdf81418f16e Kent Overstreet 2023-02-27  245  
32de2ea0d5b7e2 Kent Overstreet 2023-03-11 @246  		ret = __bch2_evacuate_bucket(trans, ctxt, f, f->bucket.k.bucket,
32de2ea0d5b7e2 Kent Overstreet 2023-03-11  247  					     f->bucket.k.gen, data_opts);
8fcdf81418f16e Kent Overstreet 2023-02-27  248  		if (ret)
8fcdf81418f16e Kent Overstreet 2023-02-27  249  			goto err;
8fcdf81418f16e Kent Overstreet 2023-02-27  250  	}
8fcdf81418f16e Kent Overstreet 2023-02-27  251  err:
8fcdf81418f16e Kent Overstreet 2023-02-27  252  	darray_exit(&buckets);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  253  
80c33085783656 Kent Overstreet 2022-12-05  254  	/* no entries in LRU btree found, or got to end: */
80c33085783656 Kent Overstreet 2022-12-05  255  	if (ret == -ENOENT)
80c33085783656 Kent Overstreet 2022-12-05  256  		ret = 0;
80c33085783656 Kent Overstreet 2022-12-05  257  
858536c7cea8bb Kent Overstreet 2022-12-11  258  	if (ret < 0 && !bch2_err_matches(ret, EROFS))
d4bf5eecd78a90 Kent Overstreet 2022-07-18  259  		bch_err(c, "error from bch2_move_data() in copygc: %s", bch2_err_str(ret));
d73e0d2cd185c3 Kent Overstreet 2021-12-25  260  
8fcdf81418f16e Kent Overstreet 2023-02-27  261  	moved = atomic64_read(&ctxt->stats->sectors_moved) - moved;
8fcdf81418f16e Kent Overstreet 2023-02-27  262  	trace_and_count(c, copygc, c, moved, 0, 0, 0);
d73e0d2cd185c3 Kent Overstreet 2021-12-25  263  	return ret;
e6d1161530bcd6 Kent Overstreet 2020-07-11  264  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  265  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
