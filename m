Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240D82580EE
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 02:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758248135; cv=none; b=olXuV0Exjg+EfNNgO2Gx/7u+FIcl5uD2CM5jc6GmJiuGXgXlGs1Y/YxDHgwc1I1pBdyRW7K/vu9p5496CX+6a/daL4QgC5fLclEqWli/4f4/NzmnLnp97l9uGTheMdXo4IhDBygMzk2uw7ARMI8KzhaVhhlFy3BWbaEpt4Qf8pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758248135; c=relaxed/simple;
	bh=KjxY1nXVtaacVW0SAE3YCEoRPqyUQnDhYZm7lLQSjfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d36k53G4xQnXQa7fPAxBc0BTQ6FwdntdAydCkE9AaYy9WnHzBC8U/+qePnZE/rHFGGXAeHz7x9AhvYRuXeBc22b4hynw03EA4Hpw7b/IhFrgVEqi+UroRb64Hn9xZqCl9Nta4ng1TPTqL9tQC9XI3jLdLxctuZo7RKK9M3/acLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dItXdSn/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dItXdSn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758248133; x=1789784133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KjxY1nXVtaacVW0SAE3YCEoRPqyUQnDhYZm7lLQSjfo=;
  b=dItXdSn/gHvRdbRqXfgV/7AGlKQvaaJkCpu0Yl3p8gblUjz3qnrcYv4w
   yP9Xkwru6UKeG9auRtoXr3vzGsRNwxrV08s8GpH15nnQssGupafWZArVW
   CZ4Xw6RoNUkqftAx0/sVE/cPsPQpz6mRhEEPs8ex6O1tuQXq6ZAhBtLQa
   75YZvrNUVAleKnwjTO63MLBtW6UtFul7Ork9nMTRzTfoaoTQzudmehYs4
   tuiaV/yeoP9SgpSGsmelL6lYk5QY5asE9Jk/JVajPj3/C1/pHSPiiK1vV
   XHBFtq1I33hz/tM/GMKxWQKcOZNb9EVYPmFMDkvjouC1Z7j+2oWKJeG2V
   g==;
X-CSE-ConnectionGUID: /kP1HeUMRx2wvKyhTS8D4g==
X-CSE-MsgGUID: bpThz+4ZQta/cfS8nYFXrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64396190"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64396190"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 19:15:33 -0700
X-CSE-ConnectionGUID: GKsj362SQAm3Q9Ibk8Wmlw==
X-CSE-MsgGUID: dNRfDiTaQr+fIh89sG6jDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="206653078"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Sep 2025 19:15:31 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzQen-0003uR-0m;
	Fri, 19 Sep 2025 02:15:29 +0000
Date: Fri, 19 Sep 2025 10:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-testing 406/423]
 fs/bcachefs/move.c:385 bch2_move_extent() error: we previously assumed 'u'
 could be null (see line 327)
Message-ID: <202509191055.R9lEpLQ5-lkp@intel.com>
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

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   1a64c52bac4085601538041ff371480bb598809e
commit: f8a958f04d309e868f5d3f910aa1fc185772596b [406/423] bcachefs: kill struct moving_io
:::::: branch date: 35 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191055.R9lEpLQ5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509191055.R9lEpLQ5-lkp@intel.com/

smatch warnings:
fs/bcachefs/move.c:385 bch2_move_extent() error: we previously assumed 'u' could be null (see line 327)

vim +/u +385 fs/bcachefs/move.c

0337cc7eeed19e8 Kent Overstreet 2022-06-20  292  
633169035a7ccdf Kent Overstreet 2023-10-20  293  int bch2_move_extent(struct moving_context *ctxt,
49188a9313e2209 Kent Overstreet 2025-05-08  294  		     struct move_bucket *bucket_in_flight,
633169035a7ccdf Kent Overstreet 2023-10-20  295  		     struct btree_iter *iter,
99aaf57000b4091 Kent Overstreet 2019-07-25  296  		     struct bkey_s_c k,
cce5c6de6f8c77a Kent Overstreet 2025-08-23  297  		     struct bch_inode_opts io_opts,
7f5c5d20f01483b Kent Overstreet 2022-06-13  298  		     struct data_update_opts data_opts)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  299  {
633169035a7ccdf Kent Overstreet 2023-10-20  300  	struct btree_trans *trans = ctxt->trans;
f30dd8601262c74 Kent Overstreet 2020-10-16  301  	struct bch_fs *c = trans->c;
bf676ce1a766f25 Kent Overstreet 2025-07-18  302  	int ret = 0;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  303  
060ff4b794748ef Kent Overstreet 2025-05-26  304  	if (trace_io_move_enabled())
157ea5834133c02 Kent Overstreet 2025-02-03  305  		trace_io_move2(c, k, &io_opts, &data_opts);
157ea5834133c02 Kent Overstreet 2025-02-03  306  	this_cpu_add(c->counters[BCH_COUNTER_io_move], k.k->size);
189c176c5dd3245 Kent Overstreet 2024-01-15  307  
96a363a7e688320 Kent Overstreet 2023-10-23  308  	if (ctxt->stats)
96a363a7e688320 Kent Overstreet 2023-10-23  309  		ctxt->stats->pos = BBPOS(iter->btree_id, iter->pos);
5a21764db13877e Kent Overstreet 2023-04-20  310  
1be887979bc12a6 Kent Overstreet 2022-10-09  311  	bch2_data_update_opts_normalize(k, &data_opts);
1be887979bc12a6 Kent Overstreet 2022-10-09  312  
1be887979bc12a6 Kent Overstreet 2022-10-09  313  	if (!data_opts.rewrite_ptrs &&
f269ae55d2de9c6 Kent Overstreet 2024-12-28  314  	    !data_opts.extra_replicas &&
f269ae55d2de9c6 Kent Overstreet 2024-12-28  315  	    !data_opts.scrub) {
1426ce7ed5dbba4 Kent Overstreet 2025-08-03  316  		if (data_opts.kill_ptrs|data_opts.kill_ec_ptrs) {
8b0550942a7ea83 Kent Overstreet 2025-08-02  317  			this_cpu_add(c->counters[BCH_COUNTER_io_move_drop_only], k.k->size);
a34eef6dd179463 Kent Overstreet 2024-10-20  318  			return bch2_extent_drop_ptrs(trans, iter, k, &io_opts, &data_opts);
8b0550942a7ea83 Kent Overstreet 2025-08-02  319  		} else {
8b0550942a7ea83 Kent Overstreet 2025-08-02  320  			this_cpu_add(c->counters[BCH_COUNTER_io_move_noop], k.k->size);
1be887979bc12a6 Kent Overstreet 2022-10-09  321  			return 0;
1be887979bc12a6 Kent Overstreet 2022-10-09  322  		}
8b0550942a7ea83 Kent Overstreet 2025-08-02  323  	}
1be887979bc12a6 Kent Overstreet 2022-10-09  324  
f8a958f04d309e8 Kent Overstreet 2025-09-15  325  	struct data_update *u = allocate_dropping_locks(trans, ret,
f8a958f04d309e8 Kent Overstreet 2025-09-15  326  				kzalloc(sizeof(struct data_update), _gfp));
f8a958f04d309e8 Kent Overstreet 2025-09-15 @327  	if (!u && !ret)
bf676ce1a766f25 Kent Overstreet 2025-07-18  328  		ret = bch_err_throw(c, ENOMEM_move_extent);
f02d15327455822 Kent Overstreet 2025-05-28  329  	if (ret)
bf676ce1a766f25 Kent Overstreet 2025-07-18  330  		goto err;
f02d15327455822 Kent Overstreet 2025-05-28  331  
f8a958f04d309e8 Kent Overstreet 2025-09-15  332  	ret = bch2_data_update_init(trans, iter, ctxt, u, ctxt->wp,
f269ae55d2de9c6 Kent Overstreet 2024-12-28  333  				    &io_opts, data_opts, iter->btree_id, k);
f269ae55d2de9c6 Kent Overstreet 2024-12-28  334  	if (ret)
bf676ce1a766f25 Kent Overstreet 2025-07-18  335  		goto err;
f269ae55d2de9c6 Kent Overstreet 2024-12-28  336  
f8a958f04d309e8 Kent Overstreet 2025-09-15  337  	u->op.end_io		= move_write_done;
f8a958f04d309e8 Kent Overstreet 2025-09-15  338  	u->rbio.bio.bi_end_io	= move_read_endio;
f8a958f04d309e8 Kent Overstreet 2025-09-15  339  	u->rbio.bio.bi_ioprio	= IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  340  
a0bfe3b065cabc6 Kent Overstreet 2023-10-20  341  	if (ctxt->rate)
a0bfe3b065cabc6 Kent Overstreet 2023-10-20  342  		bch2_ratelimit_increment(ctxt->rate, k.k->size);
a0bfe3b065cabc6 Kent Overstreet 2023-10-20  343  
2f528663c5abf10 Kent Overstreet 2023-03-04  344  	if (ctxt->stats) {
2f528663c5abf10 Kent Overstreet 2023-03-04  345  		atomic64_inc(&ctxt->stats->keys_moved);
f8a958f04d309e8 Kent Overstreet 2025-09-15  346  		atomic64_add(u->k.k->k.size, &ctxt->stats->sectors_moved);
2f528663c5abf10 Kent Overstreet 2023-03-04  347  	}
2f528663c5abf10 Kent Overstreet 2023-03-04  348  
8fcdf81418f16ef Kent Overstreet 2023-02-27  349  	if (bucket_in_flight) {
f8a958f04d309e8 Kent Overstreet 2025-09-15  350  		u->b = bucket_in_flight;
f8a958f04d309e8 Kent Overstreet 2025-09-15  351  		atomic_inc(&u->b->count);
8fcdf81418f16ef Kent Overstreet 2023-02-27  352  	}
8fcdf81418f16ef Kent Overstreet 2023-02-27  353  
060ff4b794748ef Kent Overstreet 2025-05-26  354  	if (trace_io_move_read_enabled())
157ea5834133c02 Kent Overstreet 2025-02-03  355  		trace_io_move_read2(c, k);
b9fa375bab2786d Kent Overstreet 2023-03-11  356  
175d6c2cf1ad8a8 Kent Overstreet 2025-07-14  357  	scoped_guard(mutex, &ctxt->lock) {
f8a958f04d309e8 Kent Overstreet 2025-09-15  358  		atomic_add(u->k.k->k.size, &ctxt->read_sectors);
c782c5832e9251a Kent Overstreet 2023-01-09  359  		atomic_inc(&ctxt->read_ios);
b9fa375bab2786d Kent Overstreet 2023-03-11  360  
f8a958f04d309e8 Kent Overstreet 2025-09-15  361  		list_add_tail(&u->read_list, &ctxt->reads);
f8a958f04d309e8 Kent Overstreet 2025-09-15  362  		list_add_tail(&u->io_list, &ctxt->ios);
175d6c2cf1ad8a8 Kent Overstreet 2025-07-14  363  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  364  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  365  	/*
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  366  	 * dropped by move_read_endio() - guards against use after free of
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  367  	 * ctxt when doing wakeup
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  368  	 */
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  369  	closure_get(&ctxt->cl);
f8a958f04d309e8 Kent Overstreet 2025-09-15  370  	__bch2_read_extent(trans, &u->rbio,
f8a958f04d309e8 Kent Overstreet 2025-09-15  371  			   u->rbio.bio.bi_iter,
5ff75ccbbc3f262 Kent Overstreet 2021-03-14  372  			   bkey_start_pos(k.k),
a0bfe3b065cabc6 Kent Overstreet 2023-10-20  373  			   iter->btree_id, k, 0,
f269ae55d2de9c6 Kent Overstreet 2024-12-28  374  			   NULL,
f269ae55d2de9c6 Kent Overstreet 2024-12-28  375  			   BCH_READ_last_fragment,
f269ae55d2de9c6 Kent Overstreet 2024-12-28  376  			   data_opts.scrub ?  data_opts.read_dev : -1);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  377  	return 0;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  378  err:
f8a958f04d309e8 Kent Overstreet 2025-09-15  379  	if (!bch2_err_matches(ret, EROFS) &&
f8a958f04d309e8 Kent Overstreet 2025-09-15  380  	    !bch2_err_matches(ret, BCH_ERR_transaction_restart)) {
157ea5834133c02 Kent Overstreet 2025-02-03  381  		count_event(c, io_move_start_fail);
74644030098a0c4 Kent Overstreet 2023-11-27  382  
157ea5834133c02 Kent Overstreet 2025-02-03  383  		if (trace_io_move_start_fail_enabled()) {
175d6c2cf1ad8a8 Kent Overstreet 2025-07-14  384  			CLASS(printbuf, buf)();
f8a958f04d309e8 Kent Overstreet 2025-09-15 @385  			bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(u->k.k));
ae4d612cc1f23a6 Kent Overstreet 2023-11-26  386  			prt_str(&buf, ": ");
ae4d612cc1f23a6 Kent Overstreet 2023-11-26  387  			prt_str(&buf, bch2_err_str(ret));
157ea5834133c02 Kent Overstreet 2025-02-03  388  			trace_io_move_start_fail(c, buf.buf);
ae4d612cc1f23a6 Kent Overstreet 2023-11-26  389  		}
f8a958f04d309e8 Kent Overstreet 2025-09-15  390  	}
f8a958f04d309e8 Kent Overstreet 2025-09-15  391  
f8a958f04d309e8 Kent Overstreet 2025-09-15  392  	bch2_bkey_buf_exit(&u->k, c);
f8a958f04d309e8 Kent Overstreet 2025-09-15  393  	kfree(u);
327971cef509c63 Kent Overstreet 2025-05-27  394  
327971cef509c63 Kent Overstreet 2025-05-27  395  	if (bch2_err_matches(ret, BCH_ERR_data_update_done))
327971cef509c63 Kent Overstreet 2025-05-27  396  		return 0;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  397  	return ret;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  398  }
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  399  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
