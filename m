Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850611B393F
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731947523; cv=none; b=lNtJvyjNv6hx4Qfdb6adiXqH0Gn9TuoE74tFACPxHqEqsqSc9zK2ysZjfMg5qVkMACWPwHkgXxzSqRFXQOmWJd/CojxhQ7QHoWrscD5eSh81oQBDgXB5HzEt6B4a5R8En+jeg3drbLoGgVFB22NxLIpAE8vEawPMtSKZI8ESDGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731947523; c=relaxed/simple;
	bh=Mt1ZuH8stPe5+9Xphw5VIpRRT+Qg3+iIU5fWBc+yrtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o8GWYW//JNx5KzQR98QoQF8TPq0SpxasAhWIp6cOEVph5qfxMQdW2H5fQp3yqZJj7cvRkjipP6CkgLWmGbrsqBXWBW2bcueV/0K4BLIFusYqgaFeGEX684G5yjHFH/Zw7e1HTdqUbXLDTOw9VgcX8IRNKZm7lcR3jX2/FyBfvnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9R8AyQM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9R8AyQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731947520; x=1763483520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mt1ZuH8stPe5+9Xphw5VIpRRT+Qg3+iIU5fWBc+yrtI=;
  b=f9R8AyQMQU6ucU0ItYLY2PZzopd/4dKxfeM4o/KMEPkHHMrktix5qCnL
   KwzLYOvuShjpoACFeHw9dByu+7PqaT8WmNM/0H+VX3dFqkl36SfoAInYJ
   L2qDFBcwa2Lh+SI9i/iN2/zpD70gM5Fdect67a5lIk7O0cXeX+ugl1qZV
   Q6RgQkmwPHl0fgulCRzIKopbUqH+pANbRpP3xg7tKtVv23brougsAxWLu
   0uF6MaFdQK8z3OqwcbvOrnBS9iKZoZ7KN+58kmQSpvsebkpwfP1L1VJHb
   n3oDT1m4ofSM7Re+IP+Ji/DhdHacLKIcmF/gy2UMMw361LcgAMJKErZlC
   g==;
X-CSE-ConnectionGUID: xkPisCjQRaK2STsBePrPSw==
X-CSE-MsgGUID: f29VBANNRNSPpV7HHG1OlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31851087"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="31851087"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 08:32:00 -0800
X-CSE-ConnectionGUID: fsvNjiprR4Ca/mpLevEjwg==
X-CSE-MsgGUID: Uk8mgijiTKSUEMJ/ISz/FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="94364865"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Nov 2024 08:31:58 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD4fM-0002X0-0K;
	Mon, 18 Nov 2024 16:31:56 +0000
Date: Tue, 19 Nov 2024 00:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11561/12140] fs/bcachefs/move.c:814
 bch2_evacuate_bucket() error: uninitialized symbol 'dirty_sectors'.
Message-ID: <202411190047.t84eN5f0-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae58226b89ac0cffa05ba7357733776542e40216
commit: 86a494c8eef94a7dc21f26b5c85cb10c5040f04c [11561/12140] bcachefs: Kill bch2_get_next_backpointer()
:::::: branch date: 8 hours ago
:::::: commit date: 3 days ago
config: hexagon-randconfig-r071-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190047.t84eN5f0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411190047.t84eN5f0-lkp@intel.com/

smatch warnings:
fs/bcachefs/move.c:814 bch2_evacuate_bucket() error: uninitialized symbol 'dirty_sectors'.
fs/bcachefs/move.c:814 bch2_evacuate_bucket() error: uninitialized symbol 'bucket_size'.
fs/bcachefs/move.c:814 bch2_evacuate_bucket() error: uninitialized symbol 'fragmentation'.

vim +/dirty_sectors +814 fs/bcachefs/move.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  663  
74529338805d51 Daniel Hill     2023-11-26  664  int bch2_evacuate_bucket(struct moving_context *ctxt,
8fcdf81418f16e Kent Overstreet 2023-02-27  665  			   struct move_bucket_in_flight *bucket_in_flight,
8e3f913e2ab6ac Kent Overstreet 2022-03-18  666  			   struct bpos bucket, int gen,
8e3f913e2ab6ac Kent Overstreet 2022-03-18  667  			   struct data_update_opts _data_opts)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  668  {
633169035a7ccd Kent Overstreet 2023-10-20  669  	struct btree_trans *trans = ctxt->trans;
633169035a7ccd Kent Overstreet 2023-10-20  670  	struct bch_fs *c = trans->c;
415e5107b0dce0 Kent Overstreet 2023-11-28  671  	bool is_kthread = current->flags & PF_KTHREAD;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  672  	struct bch_io_opts io_opts = bch2_opts_to_inode_opts(c->opts);
86a494c8eef94a Kent Overstreet 2024-11-14  673  	struct btree_iter iter = {}, bp_iter = {};
8e3f913e2ab6ac Kent Overstreet 2022-03-18  674  	struct bkey_buf sk;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  675  	struct bkey_s_c k;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  676  	struct data_update_opts data_opts;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  677  	unsigned dirty_sectors, bucket_size;
80c33085783656 Kent Overstreet 2022-12-05  678  	u64 fragmentation;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  679  	int ret = 0;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  680  
cb4d340a10295f Kent Overstreet 2024-04-30  681  	struct bch_dev *ca = bch2_dev_tryget(c, bucket.inode);
cb4d340a10295f Kent Overstreet 2024-04-30  682  	if (!ca)
cb4d340a10295f Kent Overstreet 2024-04-30  683  		return 0;
cb4d340a10295f Kent Overstreet 2024-04-30  684  
5a21764db13877 Kent Overstreet 2023-04-20  685  	trace_bucket_evacuate(c, &bucket);
5a21764db13877 Kent Overstreet 2023-04-20  686  
8e3f913e2ab6ac Kent Overstreet 2022-03-18  687  	bch2_bkey_buf_init(&sk);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  688  
3e36e572f14bfa Kent Overstreet 2023-03-19  689  	/*
3e36e572f14bfa Kent Overstreet 2023-03-19  690  	 * We're not run in a context that handles transaction restarts:
3e36e572f14bfa Kent Overstreet 2023-03-19  691  	 */
3e36e572f14bfa Kent Overstreet 2023-03-19  692  	bch2_trans_begin(trans);
3e36e572f14bfa Kent Overstreet 2023-03-19  693  
86a494c8eef94a Kent Overstreet 2024-11-14  694  	bch2_trans_iter_init(trans, &bp_iter, BTREE_ID_backpointers,
86a494c8eef94a Kent Overstreet 2024-11-14  695  			     bucket_pos_to_bp(ca, bucket, 0), 0);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  696  
1bb3c2a9747c40 Kent Overstreet 2023-06-20  697  	bch_err_msg(c, ret, "looking up alloc key");
cf904c8d964fa4 Kent Overstreet 2023-12-16  698  	if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  699  		goto err;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  700  
cb13f471390ce6 Kent Overstreet 2023-11-02  701  	ret = bch2_btree_write_buffer_tryflush(trans);
1bb3c2a9747c40 Kent Overstreet 2023-06-20  702  	bch_err_msg(c, ret, "flushing btree write buffer");
cb13f471390ce6 Kent Overstreet 2023-11-02  703  	if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  704  		goto err;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  705  
633169035a7ccd Kent Overstreet 2023-10-20  706  	while (!(ret = bch2_move_ratelimit(ctxt))) {
415e5107b0dce0 Kent Overstreet 2023-11-28  707  		if (is_kthread && kthread_should_stop())
415e5107b0dce0 Kent Overstreet 2023-11-28  708  			break;
415e5107b0dce0 Kent Overstreet 2023-11-28  709  
80c33085783656 Kent Overstreet 2022-12-05  710  		bch2_trans_begin(trans);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  711  
86a494c8eef94a Kent Overstreet 2024-11-14  712  		k = bch2_btree_iter_peek(&bp_iter);
86a494c8eef94a Kent Overstreet 2024-11-14  713  		ret = bkey_err(k);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  714  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac Kent Overstreet 2022-03-18  715  			continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  716  		if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  717  			goto err;
86a494c8eef94a Kent Overstreet 2024-11-14  718  
86a494c8eef94a Kent Overstreet 2024-11-14  719  		if (!k.k ||
86a494c8eef94a Kent Overstreet 2024-11-14  720  		    bkey_ge(k.k->p, bucket_pos_to_bp(ca, bpos_nosnap_successor(bucket), 0)))
8e3f913e2ab6ac Kent Overstreet 2022-03-18  721  			break;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  722  
86a494c8eef94a Kent Overstreet 2024-11-14  723  		if (k.k->type != KEY_TYPE_backpointer)
86a494c8eef94a Kent Overstreet 2024-11-14  724  			goto next;
86a494c8eef94a Kent Overstreet 2024-11-14  725  
86a494c8eef94a Kent Overstreet 2024-11-14  726  		struct bkey_s_c_backpointer bp = bkey_s_c_to_backpointer(k);
86a494c8eef94a Kent Overstreet 2024-11-14  727  
86a494c8eef94a Kent Overstreet 2024-11-14  728  		if (!bp.v->level) {
86a494c8eef94a Kent Overstreet 2024-11-14  729  			k = bch2_backpointer_get_key(trans, bp, &iter, 0);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  730  			ret = bkey_err(k);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  731  			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac Kent Overstreet 2022-03-18  732  				continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  733  			if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  734  				goto err;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  735  			if (!k.k)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  736  				goto next;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  737  
8e3f913e2ab6ac Kent Overstreet 2022-03-18  738  			bch2_bkey_buf_reassemble(&sk, c, k);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  739  			k = bkey_i_to_s_c(sk.k);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  740  
54bfe068fe0050 Kent Overstreet 2024-10-19  741  			ret = bch2_move_get_io_opts_one(trans, &io_opts, &iter, k);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  742  			if (ret) {
80c33085783656 Kent Overstreet 2022-12-05  743  				bch2_trans_iter_exit(trans, &iter);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  744  				continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  745  			}
8e3f913e2ab6ac Kent Overstreet 2022-03-18  746  
8e3f913e2ab6ac Kent Overstreet 2022-03-18  747  			data_opts = _data_opts;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  748  			data_opts.target	= io_opts.background_target;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  749  			data_opts.rewrite_ptrs = 0;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  750  
0beebd92457c32 Kent Overstreet 2023-12-21  751  			unsigned i = 0;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  752  			bkey_for_each_ptr(bch2_bkey_ptrs_c(k), ptr) {
3f5d3fb4025a71 Kent Overstreet 2023-03-10  753  				if (ptr->dev == bucket.inode) {
8e3f913e2ab6ac Kent Overstreet 2022-03-18  754  					data_opts.rewrite_ptrs |= 1U << i;
3f5d3fb4025a71 Kent Overstreet 2023-03-10  755  					if (ptr->cached) {
3f5d3fb4025a71 Kent Overstreet 2023-03-10  756  						bch2_trans_iter_exit(trans, &iter);
3f5d3fb4025a71 Kent Overstreet 2023-03-10  757  						goto next;
3f5d3fb4025a71 Kent Overstreet 2023-03-10  758  					}
3f5d3fb4025a71 Kent Overstreet 2023-03-10  759  				}
8e3f913e2ab6ac Kent Overstreet 2022-03-18  760  				i++;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  761  			}
8e3f913e2ab6ac Kent Overstreet 2022-03-18  762  
633169035a7ccd Kent Overstreet 2023-10-20  763  			ret = bch2_move_extent(ctxt, bucket_in_flight,
633169035a7ccd Kent Overstreet 2023-10-20  764  					       &iter, k, io_opts, data_opts);
80c33085783656 Kent Overstreet 2022-12-05  765  			bch2_trans_iter_exit(trans, &iter);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  766  
8e3f913e2ab6ac Kent Overstreet 2022-03-18  767  			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac Kent Overstreet 2022-03-18  768  				continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  769  			if (ret == -ENOMEM) {
8e3f913e2ab6ac Kent Overstreet 2022-03-18  770  				/* memory allocation failure, wait for some IO to finish */
633169035a7ccd Kent Overstreet 2023-10-20  771  				bch2_move_ctxt_wait_for_io(ctxt);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  772  				continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  773  			}
8e3f913e2ab6ac Kent Overstreet 2022-03-18  774  			if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  775  				goto err;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  776  
2f528663c5abf1 Kent Overstreet 2023-03-04  777  			if (ctxt->stats)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  778  				atomic64_add(k.k->size, &ctxt->stats->sectors_seen);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  779  		} else {
8e3f913e2ab6ac Kent Overstreet 2022-03-18  780  			struct btree *b;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  781  
86a494c8eef94a Kent Overstreet 2024-11-14  782  			b = bch2_backpointer_get_node(trans, bp, &iter);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  783  			ret = PTR_ERR_OR_ZERO(b);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  784  			if (ret == -BCH_ERR_backpointer_to_overwritten_btree_node)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  785  				continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  786  			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac Kent Overstreet 2022-03-18  787  				continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  788  			if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  789  				goto err;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  790  			if (!b)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  791  				goto next;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  792  
652bc7fabc2829 Kent Overstreet 2024-05-24  793  			unsigned sectors = btree_ptr_sectors_written(bkey_i_to_s_c(&b->key));
ec4edd7b9d2038 Kent Overstreet 2024-01-16  794  
80c33085783656 Kent Overstreet 2022-12-05  795  			ret = bch2_btree_node_rewrite(trans, &iter, b, 0);
80c33085783656 Kent Overstreet 2022-12-05  796  			bch2_trans_iter_exit(trans, &iter);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  797  
8e3f913e2ab6ac Kent Overstreet 2022-03-18  798  			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac Kent Overstreet 2022-03-18  799  				continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  800  			if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  801  				goto err;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  802  
8e3f913e2ab6ac Kent Overstreet 2022-03-18  803  			if (ctxt->rate)
ec4edd7b9d2038 Kent Overstreet 2024-01-16  804  				bch2_ratelimit_increment(ctxt->rate, sectors);
2f528663c5abf1 Kent Overstreet 2023-03-04  805  			if (ctxt->stats) {
ec4edd7b9d2038 Kent Overstreet 2024-01-16  806  				atomic64_add(sectors, &ctxt->stats->sectors_seen);
ec4edd7b9d2038 Kent Overstreet 2024-01-16  807  				atomic64_add(sectors, &ctxt->stats->sectors_moved);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  808  			}
2f528663c5abf1 Kent Overstreet 2023-03-04  809  		}
8e3f913e2ab6ac Kent Overstreet 2022-03-18  810  next:
86a494c8eef94a Kent Overstreet 2024-11-14  811  		bch2_btree_iter_advance(&bp_iter);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  812  	}
8e3f913e2ab6ac Kent Overstreet 2022-03-18  813  
80c33085783656 Kent Overstreet 2022-12-05 @814  	trace_evacuate_bucket(c, &bucket, dirty_sectors, bucket_size, fragmentation, ret);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  815  err:
86a494c8eef94a Kent Overstreet 2024-11-14  816  	bch2_trans_iter_exit(trans, &bp_iter);
cb4d340a10295f Kent Overstreet 2024-04-30  817  	bch2_dev_put(ca);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  818  	bch2_bkey_buf_exit(&sk, c);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  819  	return ret;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  820  }
8e3f913e2ab6ac Kent Overstreet 2022-03-18  821  

:::::: The code at line 814 was first introduced by commit
:::::: 80c33085783656617d0d07e1bc9fba70a592ce5c bcachefs: Fragmentation LRU

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
