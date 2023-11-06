Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA953156D4
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSYdGwwA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699259436; x=1730795436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CdkzEmBMLLzvlyh2DV9tt8Q//VwnUiHxiWsZb1kviB0=;
  b=FSYdGwwAkLoipAk+qGBToa1wIM765YqNI7SKusnygRI3NJyOig33B82X
   iWn92PE944frSIVlm1JwVovZMriRDBDGG0g9NKkIfJbbYkKzy5MYUdk4n
   nSVFA4Zdp8Vhj4hNxb/Sy/II54MUJqQlptNshCogAA35M5ZxVpI6c4ldl
   i+NUAf3vpPxpam12ybsvcZsTQrhucDXkBArRQN2f2+zkC1rWHYMuxZY9D
   cf1XrW71WLR3LxxJJGeR7hhFCIpzlkwAmqvpa9beA3Id2z21uG4+B7Vva
   BeM60/X32+ZgiikzUIVaDbV0SWAAw7T35YHsKZ81mc5rtdPN9P/Wf5cd2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="392097985"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="392097985"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 00:30:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879359688"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="879359688"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2023 00:30:34 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzv0B-0006Gi-2d;
	Mon, 06 Nov 2023 08:30:31 +0000
Date: Mon, 6 Nov 2023 16:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/btree_write_buffer.c:162
 __bch2_btree_write_buffer_flush() error: we previously assumed 'iter.path'
 could be null (see line 156)
Message-ID: <202311061635.n2tEjwkF-lkp@intel.com>
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
commit: 920e69bc3db88d3825c69190cafd43f0a1918d3b bcachefs: Btree write buffer
date:   2 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231106/202311061635.n2tEjwkF-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311061635.n2tEjwkF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311061635.n2tEjwkF-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree_write_buffer.c:162 __bch2_btree_write_buffer_flush() error: we previously assumed 'iter.path' could be null (see line 156)

vim +162 fs/bcachefs/btree_write_buffer.c

920e69bc3db88d Kent Overstreet 2023-01-04   95  
920e69bc3db88d Kent Overstreet 2023-01-04   96  int __bch2_btree_write_buffer_flush(struct btree_trans *trans, unsigned commit_flags,
920e69bc3db88d Kent Overstreet 2023-01-04   97  				    bool locked)
920e69bc3db88d Kent Overstreet 2023-01-04   98  {
920e69bc3db88d Kent Overstreet 2023-01-04   99  	struct bch_fs *c = trans->c;
920e69bc3db88d Kent Overstreet 2023-01-04  100  	struct journal *j = &c->journal;
920e69bc3db88d Kent Overstreet 2023-01-04  101  	struct btree_write_buffer *wb = &c->btree_write_buffer;
920e69bc3db88d Kent Overstreet 2023-01-04  102  	struct journal_entry_pin pin;
920e69bc3db88d Kent Overstreet 2023-01-04  103  	struct btree_write_buffered_key *i, *dst, *keys;
920e69bc3db88d Kent Overstreet 2023-01-04  104  	struct btree_iter iter = { NULL };
920e69bc3db88d Kent Overstreet 2023-01-04  105  	size_t nr = 0, skipped = 0, fast = 0;
920e69bc3db88d Kent Overstreet 2023-01-04  106  	bool write_locked = false;
920e69bc3db88d Kent Overstreet 2023-01-04  107  	union btree_write_buffer_state s;
920e69bc3db88d Kent Overstreet 2023-01-04  108  	int ret = 0;
920e69bc3db88d Kent Overstreet 2023-01-04  109  
920e69bc3db88d Kent Overstreet 2023-01-04  110  	memset(&pin, 0, sizeof(pin));
920e69bc3db88d Kent Overstreet 2023-01-04  111  
920e69bc3db88d Kent Overstreet 2023-01-04  112  	if (!locked && !mutex_trylock(&wb->flush_lock))
920e69bc3db88d Kent Overstreet 2023-01-04  113  		return 0;
920e69bc3db88d Kent Overstreet 2023-01-04  114  
920e69bc3db88d Kent Overstreet 2023-01-04  115  	bch2_journal_pin_copy(j, &pin, &wb->journal_pin, NULL);
920e69bc3db88d Kent Overstreet 2023-01-04  116  	bch2_journal_pin_drop(j, &wb->journal_pin);
920e69bc3db88d Kent Overstreet 2023-01-04  117  
920e69bc3db88d Kent Overstreet 2023-01-04  118  	s = btree_write_buffer_switch(wb);
920e69bc3db88d Kent Overstreet 2023-01-04  119  	keys = wb->keys[s.idx];
920e69bc3db88d Kent Overstreet 2023-01-04  120  	nr = s.nr;
920e69bc3db88d Kent Overstreet 2023-01-04  121  
920e69bc3db88d Kent Overstreet 2023-01-04  122  	/*
920e69bc3db88d Kent Overstreet 2023-01-04  123  	 * We first sort so that we can detect and skip redundant updates, and
920e69bc3db88d Kent Overstreet 2023-01-04  124  	 * then we attempt to flush in sorted btree order, as this is most
920e69bc3db88d Kent Overstreet 2023-01-04  125  	 * efficient.
920e69bc3db88d Kent Overstreet 2023-01-04  126  	 *
920e69bc3db88d Kent Overstreet 2023-01-04  127  	 * However, since we're not flushing in the order they appear in the
920e69bc3db88d Kent Overstreet 2023-01-04  128  	 * journal we won't be able to drop our journal pin until everything is
920e69bc3db88d Kent Overstreet 2023-01-04  129  	 * flushed - which means this could deadlock the journal, if we weren't
920e69bc3db88d Kent Overstreet 2023-01-04  130  	 * passing BTREE_INSERT_JORUNAL_RECLAIM. This causes the update to fail
920e69bc3db88d Kent Overstreet 2023-01-04  131  	 * if it would block taking a journal reservation.
920e69bc3db88d Kent Overstreet 2023-01-04  132  	 *
920e69bc3db88d Kent Overstreet 2023-01-04  133  	 * If that happens, we sort them by the order they appeared in the
920e69bc3db88d Kent Overstreet 2023-01-04  134  	 * journal - after dropping redundant entries - and then restart
920e69bc3db88d Kent Overstreet 2023-01-04  135  	 * flushing, this time dropping journal pins as we go.
920e69bc3db88d Kent Overstreet 2023-01-04  136  	 */
920e69bc3db88d Kent Overstreet 2023-01-04  137  
920e69bc3db88d Kent Overstreet 2023-01-04  138  	sort(keys, nr, sizeof(keys[0]),
920e69bc3db88d Kent Overstreet 2023-01-04  139  	     btree_write_buffered_key_cmp, NULL);
920e69bc3db88d Kent Overstreet 2023-01-04  140  
920e69bc3db88d Kent Overstreet 2023-01-04  141  	for (i = keys; i < keys + nr; i++) {
920e69bc3db88d Kent Overstreet 2023-01-04  142  		if (i + 1 < keys + nr &&
920e69bc3db88d Kent Overstreet 2023-01-04  143  		    i[0].btree == i[1].btree &&
920e69bc3db88d Kent Overstreet 2023-01-04  144  		    bpos_eq(i[0].k.k.p, i[1].k.k.p)) {
920e69bc3db88d Kent Overstreet 2023-01-04  145  			skipped++;
920e69bc3db88d Kent Overstreet 2023-01-04  146  			continue;
920e69bc3db88d Kent Overstreet 2023-01-04  147  		}
920e69bc3db88d Kent Overstreet 2023-01-04  148  
920e69bc3db88d Kent Overstreet 2023-01-04  149  		if (write_locked &&
920e69bc3db88d Kent Overstreet 2023-01-04  150  		    (iter.path->btree_id != i->btree ||
920e69bc3db88d Kent Overstreet 2023-01-04  151  		     bpos_gt(i->k.k.p, iter.path->l[0].b->key.k.p))) {
920e69bc3db88d Kent Overstreet 2023-01-04  152  			bch2_btree_node_unlock_write(trans, iter.path, iter.path->l[0].b);
920e69bc3db88d Kent Overstreet 2023-01-04  153  			write_locked = false;
920e69bc3db88d Kent Overstreet 2023-01-04  154  		}
920e69bc3db88d Kent Overstreet 2023-01-04  155  
920e69bc3db88d Kent Overstreet 2023-01-04 @156  		if (!iter.path || iter.path->btree_id != i->btree) {
920e69bc3db88d Kent Overstreet 2023-01-04  157  			bch2_trans_iter_exit(trans, &iter);
920e69bc3db88d Kent Overstreet 2023-01-04  158  			bch2_trans_iter_init(trans, &iter, i->btree, i->k.k.p, BTREE_ITER_INTENT);
920e69bc3db88d Kent Overstreet 2023-01-04  159  		}
920e69bc3db88d Kent Overstreet 2023-01-04  160  
920e69bc3db88d Kent Overstreet 2023-01-04  161  		bch2_btree_iter_set_pos(&iter, i->k.k.p);
920e69bc3db88d Kent Overstreet 2023-01-04 @162  		iter.path->preserve = false;
920e69bc3db88d Kent Overstreet 2023-01-04  163  
920e69bc3db88d Kent Overstreet 2023-01-04  164  		do {
920e69bc3db88d Kent Overstreet 2023-01-04  165  			ret = bch2_btree_write_buffer_flush_one(trans, &iter, i,
920e69bc3db88d Kent Overstreet 2023-01-04  166  						commit_flags, &write_locked, &fast);
920e69bc3db88d Kent Overstreet 2023-01-04  167  			if (!write_locked)
920e69bc3db88d Kent Overstreet 2023-01-04  168  				bch2_trans_begin(trans);
920e69bc3db88d Kent Overstreet 2023-01-04  169  		} while (bch2_err_matches(ret, BCH_ERR_transaction_restart));
920e69bc3db88d Kent Overstreet 2023-01-04  170  
920e69bc3db88d Kent Overstreet 2023-01-04  171  		if (ret)
920e69bc3db88d Kent Overstreet 2023-01-04  172  			break;
920e69bc3db88d Kent Overstreet 2023-01-04  173  	}
920e69bc3db88d Kent Overstreet 2023-01-04  174  
920e69bc3db88d Kent Overstreet 2023-01-04  175  	if (write_locked)
920e69bc3db88d Kent Overstreet 2023-01-04  176  		bch2_btree_node_unlock_write(trans, iter.path, iter.path->l[0].b);
920e69bc3db88d Kent Overstreet 2023-01-04  177  	bch2_trans_iter_exit(trans, &iter);
920e69bc3db88d Kent Overstreet 2023-01-04  178  
920e69bc3db88d Kent Overstreet 2023-01-04  179  	trace_write_buffer_flush(trans, nr, skipped, fast, wb->size);
920e69bc3db88d Kent Overstreet 2023-01-04  180  
920e69bc3db88d Kent Overstreet 2023-01-04  181  	if (ret == -BCH_ERR_journal_reclaim_would_deadlock)
920e69bc3db88d Kent Overstreet 2023-01-04  182  		goto slowpath;
920e69bc3db88d Kent Overstreet 2023-01-04  183  
920e69bc3db88d Kent Overstreet 2023-01-04  184  	bch2_fs_fatal_err_on(ret, c, "%s: insert error %s", __func__, bch2_err_str(ret));
920e69bc3db88d Kent Overstreet 2023-01-04  185  out:
920e69bc3db88d Kent Overstreet 2023-01-04  186  	bch2_journal_pin_drop(j, &pin);
920e69bc3db88d Kent Overstreet 2023-01-04  187  	mutex_unlock(&wb->flush_lock);
920e69bc3db88d Kent Overstreet 2023-01-04  188  	return ret;
920e69bc3db88d Kent Overstreet 2023-01-04  189  slowpath:
920e69bc3db88d Kent Overstreet 2023-01-04  190  	trace_write_buffer_flush_slowpath(trans, i - keys, nr);
920e69bc3db88d Kent Overstreet 2023-01-04  191  
920e69bc3db88d Kent Overstreet 2023-01-04  192  	dst = keys;
920e69bc3db88d Kent Overstreet 2023-01-04  193  	for (; i < keys + nr; i++) {
920e69bc3db88d Kent Overstreet 2023-01-04  194  		if (i + 1 < keys + nr &&
920e69bc3db88d Kent Overstreet 2023-01-04  195  		    i[0].btree == i[1].btree &&
920e69bc3db88d Kent Overstreet 2023-01-04  196  		    bpos_eq(i[0].k.k.p, i[1].k.k.p))
920e69bc3db88d Kent Overstreet 2023-01-04  197  			continue;
920e69bc3db88d Kent Overstreet 2023-01-04  198  
920e69bc3db88d Kent Overstreet 2023-01-04  199  		*dst = *i;
920e69bc3db88d Kent Overstreet 2023-01-04  200  		dst++;
920e69bc3db88d Kent Overstreet 2023-01-04  201  	}
920e69bc3db88d Kent Overstreet 2023-01-04  202  	nr = dst - keys;
920e69bc3db88d Kent Overstreet 2023-01-04  203  
920e69bc3db88d Kent Overstreet 2023-01-04  204  	sort(keys, nr, sizeof(keys[0]),
920e69bc3db88d Kent Overstreet 2023-01-04  205  	     btree_write_buffered_journal_cmp,
920e69bc3db88d Kent Overstreet 2023-01-04  206  	     NULL);
920e69bc3db88d Kent Overstreet 2023-01-04  207  
920e69bc3db88d Kent Overstreet 2023-01-04  208  	for (i = keys; i < keys + nr; i++) {
920e69bc3db88d Kent Overstreet 2023-01-04  209  		if (i->journal_seq > pin.seq) {
920e69bc3db88d Kent Overstreet 2023-01-04  210  			struct journal_entry_pin pin2;
920e69bc3db88d Kent Overstreet 2023-01-04  211  
920e69bc3db88d Kent Overstreet 2023-01-04  212  			memset(&pin2, 0, sizeof(pin2));
920e69bc3db88d Kent Overstreet 2023-01-04  213  
920e69bc3db88d Kent Overstreet 2023-01-04  214  			bch2_journal_pin_add(j, i->journal_seq, &pin2, NULL);
920e69bc3db88d Kent Overstreet 2023-01-04  215  			bch2_journal_pin_drop(j, &pin);
920e69bc3db88d Kent Overstreet 2023-01-04  216  			bch2_journal_pin_copy(j, &pin, &pin2, NULL);
920e69bc3db88d Kent Overstreet 2023-01-04  217  			bch2_journal_pin_drop(j, &pin2);
920e69bc3db88d Kent Overstreet 2023-01-04  218  		}
920e69bc3db88d Kent Overstreet 2023-01-04  219  
920e69bc3db88d Kent Overstreet 2023-01-04  220  		ret = commit_do(trans, NULL, NULL,
920e69bc3db88d Kent Overstreet 2023-01-04  221  				commit_flags|
920e69bc3db88d Kent Overstreet 2023-01-04  222  				BTREE_INSERT_NOFAIL|
920e69bc3db88d Kent Overstreet 2023-01-04  223  				BTREE_INSERT_JOURNAL_RECLAIM|
920e69bc3db88d Kent Overstreet 2023-01-04  224  				JOURNAL_WATERMARK_reserved,
920e69bc3db88d Kent Overstreet 2023-01-04  225  				__bch2_btree_insert(trans, i->btree, &i->k));
920e69bc3db88d Kent Overstreet 2023-01-04  226  		if (bch2_fs_fatal_err_on(ret, c, "%s: insert error %s", __func__, bch2_err_str(ret)))
920e69bc3db88d Kent Overstreet 2023-01-04  227  			break;
920e69bc3db88d Kent Overstreet 2023-01-04  228  	}
920e69bc3db88d Kent Overstreet 2023-01-04  229  
920e69bc3db88d Kent Overstreet 2023-01-04  230  	goto out;
920e69bc3db88d Kent Overstreet 2023-01-04  231  }
920e69bc3db88d Kent Overstreet 2023-01-04  232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
