Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63145495D7
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 12:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJyl9aT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700568635; x=1732104635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FBVqPaFAA4iqmqb2TdLi/s/wZ0/2Flxo0370JGSXYgA=;
  b=WJyl9aT1pGgLkz9XZmyvw/VVYccG93KgiSKNmke4rLFRr3wDi2oU6p4B
   +ILWYaceXHKIv+0v52h49LEcAEN+VIyJNTQX5aauu5ZB+gcnNCQAezlMi
   Q4qBN0FbTw2dS2Bj3AnzfsS+M5QsIH+ETjs8YYfXP2pqLVr1ah9EJDpOa
   5Pzcs36FWkiQs33Aqf5ddw9SERu7oxwZt/UvhQjKmx96CdwRqedoW3Dni
   CE/+xZK+VZ4oO/yTv36qbZO9F/ScFy5rxZYQi9oSEiKREkUduwtnR9KmN
   Y1fg+azlxOmAdDX/wGL6DGvI4qbzs9ViEVKSjtWqw9Dktx34JtcN426Ll
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="458324183"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="458324183"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 04:10:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="837034919"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="837034919"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Nov 2023 04:10:32 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Pa5-0007ly-0c;
	Tue, 21 Nov 2023 12:10:24 +0000
Date: Tue, 21 Nov 2023 20:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1414/2217] fs/bcachefs/btree_write_buffer.c:206
 bch2_btree_write_buffer_flush_locked() error: we previously assumed
 'iter.path' could be null (see line 199)
Message-ID: <202311211942.eTZVqArz-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   07b677953b9dca02928be323e2db853511305fa9
commit: 7b12f530ce50035dac80c5883ff5c7e31f9a6d57 [1414/2217] bcachefs: bch2_btree_write_buffer_flush_locked()
:::::: branch date: 8 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211942.eTZVqArz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311211942.eTZVqArz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311211942.eTZVqArz-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree_write_buffer.c:206 bch2_btree_write_buffer_flush_locked() error: we previously assumed 'iter.path' could be null (see line 199)

vim +206 fs/bcachefs/btree_write_buffer.c

60a5b898007d76 Brian Foster    2023-07-19  139  
7b12f530ce5003 Kent Overstreet 2023-11-02  140  int bch2_btree_write_buffer_flush_locked(struct btree_trans *trans)
920e69bc3db88d Kent Overstreet 2023-01-04  141  {
920e69bc3db88d Kent Overstreet 2023-01-04  142  	struct bch_fs *c = trans->c;
920e69bc3db88d Kent Overstreet 2023-01-04  143  	struct journal *j = &c->journal;
920e69bc3db88d Kent Overstreet 2023-01-04  144  	struct btree_write_buffer *wb = &c->btree_write_buffer;
920e69bc3db88d Kent Overstreet 2023-01-04  145  	struct journal_entry_pin pin;
873555f04d81b4 Brian Foster    2023-03-17  146  	struct btree_write_buffered_key *i, *keys;
920e69bc3db88d Kent Overstreet 2023-01-04  147  	struct btree_iter iter = { NULL };
873555f04d81b4 Brian Foster    2023-03-17  148  	size_t nr = 0, skipped = 0, fast = 0, slowpath = 0;
920e69bc3db88d Kent Overstreet 2023-01-04  149  	bool write_locked = false;
920e69bc3db88d Kent Overstreet 2023-01-04  150  	union btree_write_buffer_state s;
920e69bc3db88d Kent Overstreet 2023-01-04  151  	int ret = 0;
920e69bc3db88d Kent Overstreet 2023-01-04  152  
920e69bc3db88d Kent Overstreet 2023-01-04  153  	memset(&pin, 0, sizeof(pin));
920e69bc3db88d Kent Overstreet 2023-01-04  154  
58485d8c7b8429 Kent Overstreet 2023-11-09  155  	bch2_journal_pin_copy(j, &pin, &wb->journal_pin,
58485d8c7b8429 Kent Overstreet 2023-11-09  156  			      bch2_btree_write_buffer_journal_flush);
920e69bc3db88d Kent Overstreet 2023-01-04  157  	bch2_journal_pin_drop(j, &wb->journal_pin);
920e69bc3db88d Kent Overstreet 2023-01-04  158  
920e69bc3db88d Kent Overstreet 2023-01-04  159  	s = btree_write_buffer_switch(wb);
920e69bc3db88d Kent Overstreet 2023-01-04  160  	keys = wb->keys[s.idx];
920e69bc3db88d Kent Overstreet 2023-01-04  161  	nr = s.nr;
920e69bc3db88d Kent Overstreet 2023-01-04  162  
d82978ca159389 Kent Overstreet 2023-07-12  163  	if (race_fault())
d82978ca159389 Kent Overstreet 2023-07-12  164  		goto slowpath;
d82978ca159389 Kent Overstreet 2023-07-12  165  
920e69bc3db88d Kent Overstreet 2023-01-04  166  	/*
920e69bc3db88d Kent Overstreet 2023-01-04  167  	 * We first sort so that we can detect and skip redundant updates, and
920e69bc3db88d Kent Overstreet 2023-01-04  168  	 * then we attempt to flush in sorted btree order, as this is most
920e69bc3db88d Kent Overstreet 2023-01-04  169  	 * efficient.
920e69bc3db88d Kent Overstreet 2023-01-04  170  	 *
920e69bc3db88d Kent Overstreet 2023-01-04  171  	 * However, since we're not flushing in the order they appear in the
920e69bc3db88d Kent Overstreet 2023-01-04  172  	 * journal we won't be able to drop our journal pin until everything is
873555f04d81b4 Brian Foster    2023-03-17  173  	 * flushed - which means this could deadlock the journal if we weren't
371ac8208486f5 Kent Overstreet 2023-11-11  174  	 * passing BCH_TRANS_COMMIT_journal_reclaim. This causes the update to fail
920e69bc3db88d Kent Overstreet 2023-01-04  175  	 * if it would block taking a journal reservation.
920e69bc3db88d Kent Overstreet 2023-01-04  176  	 *
873555f04d81b4 Brian Foster    2023-03-17  177  	 * If that happens, simply skip the key so we can optimistically insert
873555f04d81b4 Brian Foster    2023-03-17  178  	 * as many keys as possible in the fast path.
920e69bc3db88d Kent Overstreet 2023-01-04  179  	 */
920e69bc3db88d Kent Overstreet 2023-01-04  180  	sort(keys, nr, sizeof(keys[0]),
920e69bc3db88d Kent Overstreet 2023-01-04  181  	     btree_write_buffered_key_cmp, NULL);
920e69bc3db88d Kent Overstreet 2023-01-04  182  
920e69bc3db88d Kent Overstreet 2023-01-04  183  	for (i = keys; i < keys + nr; i++) {
920e69bc3db88d Kent Overstreet 2023-01-04  184  		if (i + 1 < keys + nr &&
920e69bc3db88d Kent Overstreet 2023-01-04  185  		    i[0].btree == i[1].btree &&
920e69bc3db88d Kent Overstreet 2023-01-04  186  		    bpos_eq(i[0].k.k.p, i[1].k.k.p)) {
920e69bc3db88d Kent Overstreet 2023-01-04  187  			skipped++;
873555f04d81b4 Brian Foster    2023-03-17  188  			i->journal_seq = 0;
920e69bc3db88d Kent Overstreet 2023-01-04  189  			continue;
920e69bc3db88d Kent Overstreet 2023-01-04  190  		}
920e69bc3db88d Kent Overstreet 2023-01-04  191  
920e69bc3db88d Kent Overstreet 2023-01-04  192  		if (write_locked &&
920e69bc3db88d Kent Overstreet 2023-01-04  193  		    (iter.path->btree_id != i->btree ||
920e69bc3db88d Kent Overstreet 2023-01-04  194  		     bpos_gt(i->k.k.p, iter.path->l[0].b->key.k.p))) {
920e69bc3db88d Kent Overstreet 2023-01-04  195  			bch2_btree_node_unlock_write(trans, iter.path, iter.path->l[0].b);
920e69bc3db88d Kent Overstreet 2023-01-04  196  			write_locked = false;
920e69bc3db88d Kent Overstreet 2023-01-04  197  		}
920e69bc3db88d Kent Overstreet 2023-01-04  198  
920e69bc3db88d Kent Overstreet 2023-01-04 @199  		if (!iter.path || iter.path->btree_id != i->btree) {
920e69bc3db88d Kent Overstreet 2023-01-04  200  			bch2_trans_iter_exit(trans, &iter);
da525760802b9f Kent Overstreet 2023-08-21  201  			bch2_trans_iter_init(trans, &iter, i->btree, i->k.k.p,
da525760802b9f Kent Overstreet 2023-08-21  202  					     BTREE_ITER_INTENT|BTREE_ITER_ALL_SNAPSHOTS);
920e69bc3db88d Kent Overstreet 2023-01-04  203  		}
920e69bc3db88d Kent Overstreet 2023-01-04  204  
920e69bc3db88d Kent Overstreet 2023-01-04  205  		bch2_btree_iter_set_pos(&iter, i->k.k.p);
920e69bc3db88d Kent Overstreet 2023-01-04 @206  		iter.path->preserve = false;
920e69bc3db88d Kent Overstreet 2023-01-04  207  
920e69bc3db88d Kent Overstreet 2023-01-04  208  		do {
d08be035a803c3 Kent Overstreet 2023-11-02  209  			ret = bch2_btree_write_buffer_flush_one(trans, &iter, i, 0,
d08be035a803c3 Kent Overstreet 2023-11-02  210  								&write_locked, &fast);
920e69bc3db88d Kent Overstreet 2023-01-04  211  			if (!write_locked)
920e69bc3db88d Kent Overstreet 2023-01-04  212  				bch2_trans_begin(trans);
920e69bc3db88d Kent Overstreet 2023-01-04  213  		} while (bch2_err_matches(ret, BCH_ERR_transaction_restart));
920e69bc3db88d Kent Overstreet 2023-01-04  214  
873555f04d81b4 Brian Foster    2023-03-17  215  		if (ret == -BCH_ERR_journal_reclaim_would_deadlock) {
873555f04d81b4 Brian Foster    2023-03-17  216  			slowpath++;
873555f04d81b4 Brian Foster    2023-03-17  217  			continue;
873555f04d81b4 Brian Foster    2023-03-17  218  		}
920e69bc3db88d Kent Overstreet 2023-01-04  219  		if (ret)
920e69bc3db88d Kent Overstreet 2023-01-04  220  			break;
873555f04d81b4 Brian Foster    2023-03-17  221  
873555f04d81b4 Brian Foster    2023-03-17  222  		i->journal_seq = 0;
920e69bc3db88d Kent Overstreet 2023-01-04  223  	}
920e69bc3db88d Kent Overstreet 2023-01-04  224  
920e69bc3db88d Kent Overstreet 2023-01-04  225  	if (write_locked)
920e69bc3db88d Kent Overstreet 2023-01-04  226  		bch2_btree_node_unlock_write(trans, iter.path, iter.path->l[0].b);
920e69bc3db88d Kent Overstreet 2023-01-04  227  	bch2_trans_iter_exit(trans, &iter);
920e69bc3db88d Kent Overstreet 2023-01-04  228  
920e69bc3db88d Kent Overstreet 2023-01-04  229  	trace_write_buffer_flush(trans, nr, skipped, fast, wb->size);
920e69bc3db88d Kent Overstreet 2023-01-04  230  
873555f04d81b4 Brian Foster    2023-03-17  231  	if (slowpath)
920e69bc3db88d Kent Overstreet 2023-01-04  232  		goto slowpath;
920e69bc3db88d Kent Overstreet 2023-01-04  233  
920e69bc3db88d Kent Overstreet 2023-01-04  234  	bch2_fs_fatal_err_on(ret, c, "%s: insert error %s", __func__, bch2_err_str(ret));
920e69bc3db88d Kent Overstreet 2023-01-04  235  out:
920e69bc3db88d Kent Overstreet 2023-01-04  236  	bch2_journal_pin_drop(j, &pin);
920e69bc3db88d Kent Overstreet 2023-01-04  237  	return ret;
920e69bc3db88d Kent Overstreet 2023-01-04  238  slowpath:
920e69bc3db88d Kent Overstreet 2023-01-04  239  	trace_write_buffer_flush_slowpath(trans, i - keys, nr);
920e69bc3db88d Kent Overstreet 2023-01-04  240  
873555f04d81b4 Brian Foster    2023-03-17  241  	/*
873555f04d81b4 Brian Foster    2023-03-17  242  	 * Now sort the rest by journal seq and bump the journal pin as we go.
873555f04d81b4 Brian Foster    2023-03-17  243  	 * The slowpath zapped the seq of keys that were successfully flushed so
873555f04d81b4 Brian Foster    2023-03-17  244  	 * we can skip those here.
873555f04d81b4 Brian Foster    2023-03-17  245  	 */
920e69bc3db88d Kent Overstreet 2023-01-04  246  	sort(keys, nr, sizeof(keys[0]),
920e69bc3db88d Kent Overstreet 2023-01-04  247  	     btree_write_buffered_journal_cmp,
920e69bc3db88d Kent Overstreet 2023-01-04  248  	     NULL);
920e69bc3db88d Kent Overstreet 2023-01-04  249  
920e69bc3db88d Kent Overstreet 2023-01-04  250  	for (i = keys; i < keys + nr; i++) {
873555f04d81b4 Brian Foster    2023-03-17  251  		if (!i->journal_seq)
873555f04d81b4 Brian Foster    2023-03-17  252  			continue;
873555f04d81b4 Brian Foster    2023-03-17  253  
58485d8c7b8429 Kent Overstreet 2023-11-09  254  		bch2_journal_pin_update(j, i->journal_seq, &pin,
58485d8c7b8429 Kent Overstreet 2023-11-09  255  			      bch2_btree_write_buffer_journal_flush);
920e69bc3db88d Kent Overstreet 2023-01-04  256  
920e69bc3db88d Kent Overstreet 2023-01-04  257  		ret = commit_do(trans, NULL, NULL,
d08be035a803c3 Kent Overstreet 2023-11-02  258  				BCH_WATERMARK_reclaim|
d08be035a803c3 Kent Overstreet 2023-11-02  259  				BCH_TRANS_COMMIT_no_check_rw|
371ac8208486f5 Kent Overstreet 2023-11-11  260  				BCH_TRANS_COMMIT_no_enospc|
371ac8208486f5 Kent Overstreet 2023-11-11  261  				BCH_TRANS_COMMIT_no_journal_res|
371ac8208486f5 Kent Overstreet 2023-11-11  262  				BCH_TRANS_COMMIT_journal_reclaim,
60a5b898007d76 Brian Foster    2023-07-19  263  				btree_write_buffered_insert(trans, i));
920e69bc3db88d Kent Overstreet 2023-01-04  264  		if (bch2_fs_fatal_err_on(ret, c, "%s: insert error %s", __func__, bch2_err_str(ret)))
920e69bc3db88d Kent Overstreet 2023-01-04  265  			break;
920e69bc3db88d Kent Overstreet 2023-01-04  266  	}
920e69bc3db88d Kent Overstreet 2023-01-04  267  
920e69bc3db88d Kent Overstreet 2023-01-04  268  	goto out;
920e69bc3db88d Kent Overstreet 2023-01-04  269  }
920e69bc3db88d Kent Overstreet 2023-01-04  270  

:::::: The code at line 206 was first introduced by commit
:::::: 920e69bc3db88d3825c69190cafd43f0a1918d3b bcachefs: Btree write buffer

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
