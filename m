Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AF92E973D
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 07:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268285; cv=none; b=VvjmF2e/0kKQIn44rTqZOMRsp30ewXWfRQYUI+TFuJr07u7BkLevC03Yflk3MnRZWFnnrlAacXOwf4TWG4HiDyakUz0RV1n2vQ/uWztNswmsut3fyFG3geIbbE17G51WMrlmVIJ3BJIk8/zeR3mPy5wLFmaGPHzggdipuR4sAdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268285; c=relaxed/simple;
	bh=GEhDAzaPz82GkzvVD5d2pUkgfEK+bg/jQmAZ/1SykH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iNTQFifnHaV9GVoYXCxKD7xWGjndk5C0iR19yiIuIJ4pFGXUAcgD1/LwHd+vuQxFpuIOCMTU9SdCIZ12CEFZsh15fa3ZTHgxnTQ1VAgqT4PSXh5v55JPS53nQJJA78GPwyvLsH7641uGbxXKdRCHdjEuDrJ3IR/Yjb1+trSnhhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ksdDmmFS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ksdDmmFS"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45f2313dd86so15799185e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758268281; x=1758873081; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AoR6sX7977KTM78McnBCryAeUsXj1N3KYvPpEIo+aAw=;
        b=ksdDmmFSxtKTZevNcAsKzbjKAUl6hGvXe3Ho8KX0we/Y2C8kJzTTWM7TYvymGJW4kC
         f8h9dHCj3H4VSG6U/EjfSpeKwYW4FkRuT30Y9PCCoD5+zwBu8kQDuAMqgX6hmNY6/qCB
         XN15F8iGnTv4lOPjuliNS0PKuDclVfVBcbej5eUwBpZGw39+HaBO8G3caZP2f/b84NXV
         W+R2GSNd/rdZTCg9wQwsTEFhUaixQSd21yGVgoF+7jscpFgFN0W4uayreV2F0wfldWWx
         5t68xAPEadW6uJqHBFfwvtQ25lEWIj7qbPKdD11YkSU6jmUgb674KWIt8OIkcy4/EYY1
         5yMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758268281; x=1758873081;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AoR6sX7977KTM78McnBCryAeUsXj1N3KYvPpEIo+aAw=;
        b=Z8sNBd6sh23njH9TxAvQlabkNkK+/3kBgXWSDCdYks3miagd1hXRjBEhxF6kWA2l48
         qDT8/pPSfVM3SRa9YDlacTj+DwLLCodpSpuXC6k57EvRAvgRn2asNd/jAwVI+TxEng5a
         /aVGe01ML8cQkTwAeLeUwSrIKyz6chpFiJseNVpFp9K9q4iKaR4VD1c3z2Jtn3J4h8TQ
         LPoPXlDPIXSwdfUTvazk9llozUzBbFDX+Hq1DBHZyB8dAwMi8/owl4MeGltqyO/2jryM
         sPEsHgqDw/Xnh03S2FwNy/hKpRi/z+mspN8H2YMQdB85f/8hfWT43NZZdbELRNPOSEzP
         a95A==
X-Gm-Message-State: AOJu0YznEgDuwbCKhdnZZjzFS4as6h5xYLwGgZYoYTuIahxEVXcPzy1I
	TC6J4x42W3KYWWnHLu3olZurFRNFS6W3qFCgC1FD9rXvJVpf5iXfAFp/4fbKur3G0q6EH1IIZfl
	DJYBB
X-Gm-Gg: ASbGncuZwucdoYzgWIRMeiwk1ltJUmKg7JUG/O4L/vGCZkpLFMRRYPjvBlNquoeR5Jk
	Zj/N+t6JZHSwveFQk4FY8Xe/D7PCeAlT0KlDf3W24euKZlle6vyCg3lKQEHQYNst0ls976LOTs7
	JE7WkgaOp/trzokH1U2xqcO4Pyo1V8COZEkdntHlZS9Egwr7VPKTH3Lpp0m/jHXv1Dpb+KLYeX3
	xnUaG/d7jKHABzYZ+eWX+JTMzQnKgGdy9QQUZRPn/y1K8AElYDbiNhU0ExgWU5t8OxqhFfVNKbg
	jwaZGhxlljm8eRf5hlIp1niziCDSjBj8f6OhzvDtGEUVBnDRCNWcjdIWZyZO8JXvSBkdcMJqhIV
	JnLbViS4kbbF+3fP8lUHW4hDtvh24Qfdrej1ims8=
X-Google-Smtp-Source: AGHT+IG2y3ymgwjYLxUBVnnrtWk+wmqxx5F05UEMJJ8jYqfdiJS+URFqiBn4B6NQ5zmH4os7msh0hw==
X-Received: by 2002:a05:600c:8206:b0:45b:7c4c:cfbf with SMTP id 5b1f17b1804b1-46825c1257fmr14948285e9.23.1758268281269;
        Fri, 19 Sep 2025 00:51:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee106fd0edsm6332684f8f.53.2025.09.19.00.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 00:51:20 -0700 (PDT)
Date: Fri, 19 Sep 2025 10:51:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
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
Message-ID: <20250919075117.H384PBmROaklMs724oCh2DrPTK2nKxYRBMOLTQhE-jk@z>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   1a64c52bac4085601538041ff371480bb598809e
commit: f8a958f04d309e868f5d3f910aa1fc185772596b [406/423] bcachefs: kill struct moving_io
config: i386-randconfig-141-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191055.R9lEpLQ5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509191055.R9lEpLQ5-lkp@intel.com/

smatch warnings:
fs/bcachefs/move.c:385 bch2_move_extent() error: we previously assumed 'u' could be null (see line 327)

vim +/u +385 fs/bcachefs/move.c

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

We goto err when "u" is NULL.

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
                                                                                                                     ^^^^^^

ae4d612cc1f23a6 Kent Overstreet 2023-11-26  386  			prt_str(&buf, ": ");
ae4d612cc1f23a6 Kent Overstreet 2023-11-26  387  			prt_str(&buf, bch2_err_str(ret));
157ea5834133c02 Kent Overstreet 2025-02-03  388  			trace_io_move_start_fail(c, buf.buf);
ae4d612cc1f23a6 Kent Overstreet 2023-11-26  389  		}
f8a958f04d309e8 Kent Overstreet 2025-09-15  390  	}
f8a958f04d309e8 Kent Overstreet 2025-09-15  391  
f8a958f04d309e8 Kent Overstreet 2025-09-15  392  	bch2_bkey_buf_exit(&u->k, c);
                                                                           ^^^^^
Unchecked dereferences.

f8a958f04d309e8 Kent Overstreet 2025-09-15  393  	kfree(u);
327971cef509c63 Kent Overstreet 2025-05-27  394  
327971cef509c63 Kent Overstreet 2025-05-27  395  	if (bch2_err_matches(ret, BCH_ERR_data_update_done))
327971cef509c63 Kent Overstreet 2025-05-27  396  		return 0;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  397  	return ret;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  398  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

