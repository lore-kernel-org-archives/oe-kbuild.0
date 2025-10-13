Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D23123F40D
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Oct 2025 06:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760338735; cv=none; b=ucPdef6+plDqdsGZSIu5PSS//6+mKqN1bn2MzbWJ+Du45bxPuKYiwWjR8VULgUVjifLXERU2X5wQV2nYAYGgI/PUFu8/b8QGqSyPmtHwmsSrWBw0VlZ/SjOvkIg0iPdG01E1PxA2NXpBAq3rTVgjpAkKTZHKmeg4S1l8acXHDGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760338735; c=relaxed/simple;
	bh=8llw2zykv+FQCjEfkgeFsxCCxXQT5QAJ4W5OW9mpRus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oJVgB+7WvqaznQS6ZncqEJmCTBP0gX1IDCGV4/LnENQnbfqVBAXKy+9q+U+B+lxPPzq8j+JJH+H3yMFcqr1i/ykSapEXYfpskhpm2hoywPuzK8smnZ3dJKdAv9COHkPWY3gdZDv6zeVT5a8X3s7fcV1S6cZAYPB+B0VdZbx7vMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hF/KLe++; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hF/KLe++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760338734; x=1791874734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8llw2zykv+FQCjEfkgeFsxCCxXQT5QAJ4W5OW9mpRus=;
  b=hF/KLe++p/SRnH8qFTQldee478+vCGpFyEdeyepXdUZhTKsa33+Abqir
   vl+C+xDD0dozkfUL+E0P7ZDY+KjOKWRlU9E2zBjEOr4U/qdXO2QyGpWxY
   Uw8/l3RrgAK3ObRnvK4H3JH43v19tsNjrjkRexzlp8dY8dusllo4EBJG8
   Jy5lQuimVfzdy8KavaStd+t36LlKt6l5S7cpLiregS5R51xcF3OOwOfPU
   nSWCA+q0vAbaw9GRmDVRRfpsq00vmXPPLdSnkP6bBLOgOLorrokMjXCaP
   tz8Qdc0q7I80VtV3BgcPWmWy2ZYuh1ZzLQjfhJijWeEmvEzbsZctIO+OR
   g==;
X-CSE-ConnectionGUID: Mov2JT5QT++0RazMjiGnNg==
X-CSE-MsgGUID: hN7szPRZRI6yDLmxNa+mFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="73817587"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="73817587"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 23:58:53 -0700
X-CSE-ConnectionGUID: FgD77hOCTE2DOx913fCRIQ==
X-CSE-MsgGUID: Bdxlz/5lS9uMeFtEXsdO9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="181959942"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Oct 2025 23:58:51 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8CW5-0000EF-05;
	Mon, 13 Oct 2025 06:58:46 +0000
Date: Mon, 13 Oct 2025 14:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:bcachefs-testing 549/555] fs/bcachefs/data/move.c:391
 __bch2_move_extent() error: we previously assumed 'u' could be null (see
 line 333)
Message-ID: <202510131455.wZ4NxjST-lkp@intel.com>
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
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   3a38f8512d3dea36e1d7ae81d8f0ed0c011fb1dd
commit: 06094515918d88816cbee2440b1393d6f4cb34e2 [549/555] bcachefs: Consolidate more logic in bch2_move_extent()
:::::: branch date: 4 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-141-20251013 (https://download.01.org/0day-ci/archive/20251013/202510131455.wZ4NxjST-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510131455.wZ4NxjST-lkp@intel.com/

smatch warnings:
fs/bcachefs/data/move.c:391 __bch2_move_extent() error: we previously assumed 'u' could be null (see line 333)

vim +/u +391 fs/bcachefs/data/move.c

0337cc7eeed19e fs/bcachefs/move.c      Kent Overstreet 2022-06-20  298  
06094515918d88 fs/bcachefs/data/move.c Kent Overstreet 2025-10-12  299  static int __bch2_move_extent(struct moving_context *ctxt,
49188a9313e220 fs/bcachefs/move.c      Kent Overstreet 2025-05-08  300  		     struct move_bucket *bucket_in_flight,
633169035a7ccd fs/bcachefs/move.c      Kent Overstreet 2023-10-20  301  		     struct btree_iter *iter,
99aaf57000b409 fs/bcachefs/move.c      Kent Overstreet 2019-07-25  302  		     struct bkey_s_c k,
d39d0be6570d60 fs/bcachefs/move.c      Kent Overstreet 2025-08-23  303  		     struct bch_inode_opts io_opts,
7f5c5d20f01483 fs/bcachefs/move.c      Kent Overstreet 2022-06-13  304  		     struct data_update_opts data_opts)
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  305  {
633169035a7ccd fs/bcachefs/move.c      Kent Overstreet 2023-10-20  306  	struct btree_trans *trans = ctxt->trans;
f30dd8601262c7 fs/bcachefs/move.c      Kent Overstreet 2020-10-16  307  	struct bch_fs *c = trans->c;
67fa80b9a6073e fs/bcachefs/move.c      Kent Overstreet 2025-07-18  308  	int ret = 0;
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  309  
060ff4b794748e fs/bcachefs/move.c      Kent Overstreet 2025-05-26  310  	if (trace_io_move_enabled())
157ea5834133c0 fs/bcachefs/move.c      Kent Overstreet 2025-02-03  311  		trace_io_move2(c, k, &io_opts, &data_opts);
157ea5834133c0 fs/bcachefs/move.c      Kent Overstreet 2025-02-03  312  	this_cpu_add(c->counters[BCH_COUNTER_io_move], k.k->size);
189c176c5dd324 fs/bcachefs/move.c      Kent Overstreet 2024-01-15  313  
96a363a7e68832 fs/bcachefs/move.c      Kent Overstreet 2023-10-23  314  	if (ctxt->stats)
96a363a7e68832 fs/bcachefs/move.c      Kent Overstreet 2023-10-23  315  		ctxt->stats->pos = BBPOS(iter->btree_id, iter->pos);
5a21764db13877 fs/bcachefs/move.c      Kent Overstreet 2023-04-20  316  
1be887979bc12a fs/bcachefs/move.c      Kent Overstreet 2022-10-09  317  	bch2_data_update_opts_normalize(k, &data_opts);
1be887979bc12a fs/bcachefs/move.c      Kent Overstreet 2022-10-09  318  
1be887979bc12a fs/bcachefs/move.c      Kent Overstreet 2022-10-09  319  	if (!data_opts.rewrite_ptrs &&
f269ae55d2de9c fs/bcachefs/move.c      Kent Overstreet 2024-12-28  320  	    !data_opts.extra_replicas &&
f269ae55d2de9c fs/bcachefs/move.c      Kent Overstreet 2024-12-28  321  	    !data_opts.scrub) {
63dfcfdf53de80 fs/bcachefs/move.c      Kent Overstreet 2025-08-03  322  		if (data_opts.kill_ptrs|data_opts.kill_ec_ptrs) {
799260d19d96e8 fs/bcachefs/move.c      Kent Overstreet 2025-08-02  323  			this_cpu_add(c->counters[BCH_COUNTER_io_move_drop_only], k.k->size);
a34eef6dd17946 fs/bcachefs/move.c      Kent Overstreet 2024-10-20  324  			return bch2_extent_drop_ptrs(trans, iter, k, &io_opts, &data_opts);
799260d19d96e8 fs/bcachefs/move.c      Kent Overstreet 2025-08-02  325  		} else {
799260d19d96e8 fs/bcachefs/move.c      Kent Overstreet 2025-08-02  326  			this_cpu_add(c->counters[BCH_COUNTER_io_move_noop], k.k->size);
1be887979bc12a fs/bcachefs/move.c      Kent Overstreet 2022-10-09  327  			return 0;
1be887979bc12a fs/bcachefs/move.c      Kent Overstreet 2022-10-09  328  		}
799260d19d96e8 fs/bcachefs/move.c      Kent Overstreet 2025-08-02  329  	}
1be887979bc12a fs/bcachefs/move.c      Kent Overstreet 2022-10-09  330  
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  331  	struct data_update *u = allocate_dropping_locks(trans, ret,
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  332  				kzalloc(sizeof(struct data_update), _gfp));
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15 @333  	if (!u && !ret)
67fa80b9a6073e fs/bcachefs/move.c      Kent Overstreet 2025-07-18  334  		ret = bch_err_throw(c, ENOMEM_move_extent);
f02d1532745582 fs/bcachefs/move.c      Kent Overstreet 2025-05-28  335  	if (ret)
67fa80b9a6073e fs/bcachefs/move.c      Kent Overstreet 2025-07-18  336  		goto err;
f02d1532745582 fs/bcachefs/move.c      Kent Overstreet 2025-05-28  337  
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  338  	ret = bch2_data_update_init(trans, iter, ctxt, u, ctxt->wp,
f269ae55d2de9c fs/bcachefs/move.c      Kent Overstreet 2024-12-28  339  				    &io_opts, data_opts, iter->btree_id, k);
f269ae55d2de9c fs/bcachefs/move.c      Kent Overstreet 2024-12-28  340  	if (ret)
67fa80b9a6073e fs/bcachefs/move.c      Kent Overstreet 2025-07-18  341  		goto err;
f269ae55d2de9c fs/bcachefs/move.c      Kent Overstreet 2024-12-28  342  
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  343  	u->op.end_io		= move_write_done;
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  344  	u->rbio.bio.bi_end_io	= move_read_endio;
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  345  	u->rbio.bio.bi_ioprio	= IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0);
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  346  
a0bfe3b065cabc fs/bcachefs/move.c      Kent Overstreet 2023-10-20  347  	if (ctxt->rate)
a0bfe3b065cabc fs/bcachefs/move.c      Kent Overstreet 2023-10-20  348  		bch2_ratelimit_increment(ctxt->rate, k.k->size);
a0bfe3b065cabc fs/bcachefs/move.c      Kent Overstreet 2023-10-20  349  
2f528663c5abf1 fs/bcachefs/move.c      Kent Overstreet 2023-03-04  350  	if (ctxt->stats) {
2f528663c5abf1 fs/bcachefs/move.c      Kent Overstreet 2023-03-04  351  		atomic64_inc(&ctxt->stats->keys_moved);
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  352  		atomic64_add(u->k.k->k.size, &ctxt->stats->sectors_moved);
2f528663c5abf1 fs/bcachefs/move.c      Kent Overstreet 2023-03-04  353  	}
2f528663c5abf1 fs/bcachefs/move.c      Kent Overstreet 2023-03-04  354  
8fcdf81418f16e fs/bcachefs/move.c      Kent Overstreet 2023-02-27  355  	if (bucket_in_flight) {
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  356  		u->b = bucket_in_flight;
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  357  		atomic_inc(&u->b->count);
8fcdf81418f16e fs/bcachefs/move.c      Kent Overstreet 2023-02-27  358  	}
8fcdf81418f16e fs/bcachefs/move.c      Kent Overstreet 2023-02-27  359  
060ff4b794748e fs/bcachefs/move.c      Kent Overstreet 2025-05-26  360  	if (trace_io_move_read_enabled())
157ea5834133c0 fs/bcachefs/move.c      Kent Overstreet 2025-02-03  361  		trace_io_move_read2(c, k);
b9fa375bab2786 fs/bcachefs/move.c      Kent Overstreet 2023-03-11  362  
21f4d575e0fecd fs/bcachefs/move.c      Kent Overstreet 2025-07-14  363  	scoped_guard(mutex, &ctxt->lock) {
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  364  		atomic_add(u->k.k->k.size, &ctxt->read_sectors);
c782c5832e9251 fs/bcachefs/move.c      Kent Overstreet 2023-01-09  365  		atomic_inc(&ctxt->read_ios);
b9fa375bab2786 fs/bcachefs/move.c      Kent Overstreet 2023-03-11  366  
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  367  		list_add_tail(&u->read_list, &ctxt->reads);
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  368  		list_add_tail(&u->io_list, &ctxt->ios);
21f4d575e0fecd fs/bcachefs/move.c      Kent Overstreet 2025-07-14  369  	}
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  370  
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  371  	/*
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  372  	 * dropped by move_read_endio() - guards against use after free of
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  373  	 * ctxt when doing wakeup
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  374  	 */
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  375  	closure_get(&ctxt->cl);
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  376  	__bch2_read_extent(trans, &u->rbio,
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  377  			   u->rbio.bio.bi_iter,
5ff75ccbbc3f26 fs/bcachefs/move.c      Kent Overstreet 2021-03-14  378  			   bkey_start_pos(k.k),
a0bfe3b065cabc fs/bcachefs/move.c      Kent Overstreet 2023-10-20  379  			   iter->btree_id, k, 0,
f269ae55d2de9c fs/bcachefs/move.c      Kent Overstreet 2024-12-28  380  			   NULL,
f269ae55d2de9c fs/bcachefs/move.c      Kent Overstreet 2024-12-28  381  			   BCH_READ_last_fragment,
f269ae55d2de9c fs/bcachefs/move.c      Kent Overstreet 2024-12-28  382  			   data_opts.scrub ?  data_opts.read_dev : -1);
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  383  	return 0;
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  384  err:
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  385  	if (!bch2_err_matches(ret, EROFS) &&
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  386  	    !bch2_err_matches(ret, BCH_ERR_transaction_restart)) {
157ea5834133c0 fs/bcachefs/move.c      Kent Overstreet 2025-02-03  387  		count_event(c, io_move_start_fail);
74644030098a0c fs/bcachefs/move.c      Kent Overstreet 2023-11-27  388  
157ea5834133c0 fs/bcachefs/move.c      Kent Overstreet 2025-02-03  389  		if (trace_io_move_start_fail_enabled()) {
21f4d575e0fecd fs/bcachefs/move.c      Kent Overstreet 2025-07-14  390  			CLASS(printbuf, buf)();
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15 @391  			bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(u->k.k));
ae4d612cc1f23a fs/bcachefs/move.c      Kent Overstreet 2023-11-26  392  			prt_str(&buf, ": ");
ae4d612cc1f23a fs/bcachefs/move.c      Kent Overstreet 2023-11-26  393  			prt_str(&buf, bch2_err_str(ret));
157ea5834133c0 fs/bcachefs/move.c      Kent Overstreet 2025-02-03  394  			trace_io_move_start_fail(c, buf.buf);
ae4d612cc1f23a fs/bcachefs/move.c      Kent Overstreet 2023-11-26  395  		}
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  396  	}
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  397  
8dfdc3e8bd6031 fs/bcachefs/data/move.c Kent Overstreet 2025-10-08  398  	bch2_bkey_buf_exit(&u->k);
8de098a6d8616c fs/bcachefs/move.c      Kent Overstreet 2025-09-15  399  	kfree(u);
327971cef509c6 fs/bcachefs/move.c      Kent Overstreet 2025-05-27  400  
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  401  	return ret;
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  402  }
1c6fdbd8f2465d fs/bcachefs/move.c      Kent Overstreet 2017-03-16  403  

:::::: The code at line 391 was first introduced by commit
:::::: 8de098a6d8616cad54ed5e56dbf5964ca54d2b86 bcachefs: kill struct moving_io

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
