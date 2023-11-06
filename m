Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97462E3EB
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joAJUOF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699302261; x=1730838261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2sZDXuTAqYnvXA3hEfbME6zc2Qi5G+dFQYIUQAjpzc=;
  b=joAJUOF2+i0QPic8JyeZGnqHDh6fiCy++p8OTX1l3yltiS6idSSB3Yf5
   q2BtsM4PjMOm1gLoNqwBpCE/Vscmv4NIYMPGqtP923ohhz6mcoMNJ0Vnr
   A9oEXTnHFLUOTfNSqsMdTaNlkHWYbR5wpw52VMrU9omCtJSARluk1NA2t
   sc1Y/BlCggrlCGez62A1M1SEIdU8A3OFZISNGG1nE0Iey5zEiDoqYYxKo
   UOyIZPc1j+b4JNPIZA/thzG1ea6bPH0COkxXLm4RP8fhd2Jh8LAMI27Z5
   hsCBB+QgygMDBL/OZuAxG4Feo8WOq5ngKcQ0waqht7l2jHyatsOyFXJFB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="475601491"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="475601491"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 12:24:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="712316207"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="712316207"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Nov 2023 12:24:19 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r068v-0006i8-23;
	Mon, 06 Nov 2023 20:24:17 +0000
Date: Tue, 7 Nov 2023 04:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/btree_update.c:471 bch2_trans_update_by_path() error:
 uninitialized symbol 'cmp'.
Message-ID: <202311070406.V3eDhAWo-lkp@intel.com>
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
commit: 8079aab085f2203960b352a153f07245d0507bf8 bcachefs: Split up btree_update_leaf.c
date:   2 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231107/202311070406.V3eDhAWo-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311070406.V3eDhAWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311070406.V3eDhAWo-lkp@intel.com/

New smatch warnings:
fs/bcachefs/btree_update.c:471 bch2_trans_update_by_path() error: uninitialized symbol 'cmp'.

Old smatch warnings:
fs/bcachefs/btree_update.c:222 __bch2_insert_snapshot_whiteouts() error: uninitialized symbol 'ret'.

vim +/cmp +471 fs/bcachefs/btree_update.c

8079aab085f2203 Kent Overstreet 2023-08-05  460  
8079aab085f2203 Kent Overstreet 2023-08-05  461  	/*
8079aab085f2203 Kent Overstreet 2023-08-05  462  	 * Pending updates are kept sorted: first, find position of new update,
8079aab085f2203 Kent Overstreet 2023-08-05  463  	 * then delete/trim any updates the new update overwrites:
8079aab085f2203 Kent Overstreet 2023-08-05  464  	 */
8079aab085f2203 Kent Overstreet 2023-08-05  465  	trans_for_each_update(trans, i) {
8079aab085f2203 Kent Overstreet 2023-08-05  466  		cmp = btree_insert_entry_cmp(&n, i);
8079aab085f2203 Kent Overstreet 2023-08-05  467  		if (cmp <= 0)
8079aab085f2203 Kent Overstreet 2023-08-05  468  			break;
8079aab085f2203 Kent Overstreet 2023-08-05  469  	}
8079aab085f2203 Kent Overstreet 2023-08-05  470  
8079aab085f2203 Kent Overstreet 2023-08-05 @471  	if (!cmp && i < trans->updates + trans->nr_updates) {
8079aab085f2203 Kent Overstreet 2023-08-05  472  		EBUG_ON(i->insert_trigger_run || i->overwrite_trigger_run);
8079aab085f2203 Kent Overstreet 2023-08-05  473  
8079aab085f2203 Kent Overstreet 2023-08-05  474  		bch2_path_put(trans, i->path, true);
8079aab085f2203 Kent Overstreet 2023-08-05  475  		i->flags	= n.flags;
8079aab085f2203 Kent Overstreet 2023-08-05  476  		i->cached	= n.cached;
8079aab085f2203 Kent Overstreet 2023-08-05  477  		i->k		= n.k;
8079aab085f2203 Kent Overstreet 2023-08-05  478  		i->path		= n.path;
8079aab085f2203 Kent Overstreet 2023-08-05  479  		i->seq		= n.seq;
8079aab085f2203 Kent Overstreet 2023-08-05  480  		i->ip_allocated	= n.ip_allocated;
8079aab085f2203 Kent Overstreet 2023-08-05  481  	} else {
8079aab085f2203 Kent Overstreet 2023-08-05  482  		array_insert_item(trans->updates, trans->nr_updates,
8079aab085f2203 Kent Overstreet 2023-08-05  483  				  i - trans->updates, n);
8079aab085f2203 Kent Overstreet 2023-08-05  484  
8079aab085f2203 Kent Overstreet 2023-08-05  485  		i->old_v = bch2_btree_path_peek_slot_exact(path, &i->old_k).v;
8079aab085f2203 Kent Overstreet 2023-08-05  486  		i->old_btree_u64s = !bkey_deleted(&i->old_k) ? i->old_k.u64s : 0;
8079aab085f2203 Kent Overstreet 2023-08-05  487  
8079aab085f2203 Kent Overstreet 2023-08-05  488  		if (unlikely(trans->journal_replay_not_finished)) {
8079aab085f2203 Kent Overstreet 2023-08-05  489  			struct bkey_i *j_k =
8079aab085f2203 Kent Overstreet 2023-08-05  490  				bch2_journal_keys_peek_slot(c, n.btree_id, n.level, k->k.p);
8079aab085f2203 Kent Overstreet 2023-08-05  491  
8079aab085f2203 Kent Overstreet 2023-08-05  492  			if (j_k) {
8079aab085f2203 Kent Overstreet 2023-08-05  493  				i->old_k = j_k->k;
8079aab085f2203 Kent Overstreet 2023-08-05  494  				i->old_v = &j_k->v;
8079aab085f2203 Kent Overstreet 2023-08-05  495  			}
8079aab085f2203 Kent Overstreet 2023-08-05  496  		}
8079aab085f2203 Kent Overstreet 2023-08-05  497  	}
8079aab085f2203 Kent Overstreet 2023-08-05  498  
8079aab085f2203 Kent Overstreet 2023-08-05  499  	__btree_path_get(i->path, true);
8079aab085f2203 Kent Overstreet 2023-08-05  500  
8079aab085f2203 Kent Overstreet 2023-08-05  501  	/*
8079aab085f2203 Kent Overstreet 2023-08-05  502  	 * If a key is present in the key cache, it must also exist in the
8079aab085f2203 Kent Overstreet 2023-08-05  503  	 * btree - this is necessary for cache coherency. When iterating over
8079aab085f2203 Kent Overstreet 2023-08-05  504  	 * a btree that's cached in the key cache, the btree iter code checks
8079aab085f2203 Kent Overstreet 2023-08-05  505  	 * the key cache - but the key has to exist in the btree for that to
8079aab085f2203 Kent Overstreet 2023-08-05  506  	 * work:
8079aab085f2203 Kent Overstreet 2023-08-05  507  	 */
8079aab085f2203 Kent Overstreet 2023-08-05  508  	if (path->cached && bkey_deleted(&i->old_k))
8079aab085f2203 Kent Overstreet 2023-08-05  509  		return flush_new_cached_update(trans, path, i, flags, ip);
8079aab085f2203 Kent Overstreet 2023-08-05  510  
8079aab085f2203 Kent Overstreet 2023-08-05  511  	return 0;
8079aab085f2203 Kent Overstreet 2023-08-05  512  }
8079aab085f2203 Kent Overstreet 2023-08-05  513  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
