Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86C333E35F
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 15:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784386980; cv=none; b=bGR9CGlcfLZzmQP5GkQkr1pxUccdtf89OWGR2Rgy66NYKKqUYd5aGk1rcHjj93THf25l4sZ49zdmPSMzRiwZ5YF65Eqo4zz6owAQFktBmUi9RqcYTO99CaMtVul0J9MQ6Id8mcIy5rAfiwJCb1eUKIq+EGUCICxBOViygqGG22c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784386980; c=relaxed/simple;
	bh=q4uUdeA4fkcSwSXoNdUV8CnxkXzSlBZpOsyqUuesDpE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WoqVuyDqXsvbE9/D6NQWKy1odUeUxK944K4qrAteuVP3oOCIycVsI6oIIOyz2LLdMsj9F10Cw1cjJwWUIdQ+E1zzciXiKRdNxRXuyzHbsuLbDVtjIAxk2rA88ZwrCHdsc3TZUE99TNZ+pD1LTRWvggjPqlQwmwZtlwLV128eNIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apwcMmYD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apwcMmYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784386973; x=1815922973;
  h=date:from:to:cc:subject:message-id;
  bh=q4uUdeA4fkcSwSXoNdUV8CnxkXzSlBZpOsyqUuesDpE=;
  b=apwcMmYDwI4RJZ1U6sbuF7nmoZWvOHoIZBybGfgCVNt2tZtrJVHUiPxW
   zlAc12CCTYRkwu8I+DOq1MT4iZDajh1dKAIxmCbkIZ2lrhVDn2yrntFIi
   pl8/8XpKk0QHicLNqBkATLDaKHFR37U3x0yUpTLjxhKMhJBtwxo3m/Mv0
   0RGAKBlX9cYWUlgXuN+y/MUL5UxZZ+QwBwe66mKEjqewRouv2jGXXCaYR
   /NWNJqKe/i4EYAFUqk43AlnY0Yp2p4TTE/1dosYssZ6HZCehz4QBIHJHc
   OVOpLug/21IzdIcfRKko53/sW2aEHrvWXzNUGhDj7LhU9hUrQ8Lc+KtJx
   Q==;
X-CSE-ConnectionGUID: xQ/yxB46TuGcBISvnIXvNQ==
X-CSE-MsgGUID: liHWjCQCTVGJ0wEMF6wJ9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="84883296"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="84883296"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 08:02:52 -0700
X-CSE-ConnectionGUID: oP8SB54RRnqCF6YdoSXnEA==
X-CSE-MsgGUID: tSriMmhjQFyfIwRlK5K+Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="252637008"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jul 2026 08:02:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl6Yy-00000000UqA-0q9V;
	Sat, 18 Jul 2026 15:02:48 +0000
Date: Sat, 18 Jul 2026 23:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:master 901/1155] fs/bcachefs/btree/locking.c:816
 __bch2_trans_relock() warn: passing zero to 'PTR_ERR'
Message-ID: <202607182231.joHvyT6v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: d7e34f5f64697fc5dae146ba03bf7e5016319409 [901/1155] bcachefs: improve trans_relock_fail tracepoint
:::::: branch date: 9 weeks ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260718/202607182231.joHvyT6v-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607182231.joHvyT6v-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree/locking.c:816 __bch2_trans_relock() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +816 fs/bcachefs/btree/locking.c

cd5afabea1acd2 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-19  775  
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  776  static inline int __bch2_trans_relock(struct btree_trans *trans, bool trace, ulong ip)
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  777  {
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  778  	bch2_trans_verify_locks(trans);
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  779  
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  780  	if (unlikely(trans->restarted))
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  781  		return -((int) trans->restarted);
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  782  	if (unlikely(trans->locked))
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  783  		goto out;
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  784  
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  785  	struct btree_path *path;
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  786  	unsigned i;
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  787  
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  788  	trans_for_each_path(trans, path, i) {
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  789  		if (!path->should_be_locked)
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  790  			continue;
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  791  
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  792  		if (likely(!trace_trans_restart_relock_enabled() || !trace)) {
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  793  			int ret = btree_path_get_locks(trans, path, false, NULL,
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  794  						       BCH_ERR_transaction_restart_relock);
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  795  			if (ret) {
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  796  				if (trace)
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  797  					count_event(trans->c, trans_restart_relock);
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  798  				__bch2_trans_unlock(trans);
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  799  				bch2_trans_verify_locks(trans);
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  800  				return ret;
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  801  			}
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  802  		} else {
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  803  			struct get_locks_fail f;
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  804  			struct btree_path old_path = *path;
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  805  			int ret = btree_path_get_locks(trans, path, false, &f,
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  806  						       BCH_ERR_transaction_restart_relock);
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  807  			if (ret) {
c0fdc625ea11fe fs/bcachefs/btree_locking.c Kent Overstreet 2025-07-14  808  				CLASS(printbuf, buf)();
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  809  				guard(printbuf_indent)(&buf);
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  810  
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  811  				bch2_bpos_to_text(&buf, path->pos);
8a6fa52e07bc8d fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-16  812  				prt_printf(&buf, " %s l=%u seq=%u node seq=",
8a6fa52e07bc8d fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-16  813  					   bch2_btree_id_str(path->btree_id),
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  814  					   f.l, path->l[f.l].lock_seq);
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  815  				if (IS_ERR_OR_NULL(f.b)) {
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16 @816  					prt_str(&buf, bch2_err_str(PTR_ERR(f.b)));
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  817  				} else {
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  818  					prt_printf(&buf, "%u", f.b->c.lock.seq);
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  819  
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  820  					struct six_lock_count c =
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  821  						bch2_btree_node_lock_counts(trans, NULL, &f.b->c, f.l);
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  822  					prt_printf(&buf, " self locked %u.%u.%u", c.n[0], c.n[1], c.n[2]);
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  823  
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  824  					c = six_lock_counts(&f.b->c.lock);
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  825  					prt_printf(&buf, " total locked %u.%u.%u", c.n[0], c.n[1], c.n[2]);
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  826  				}
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  827  
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  828  				prt_newline(&buf);
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  829  				bch2_btree_path_to_text(&buf, trans, path - trans->paths, &old_path);
ef6fac0f9e5d06 fs/bcachefs/btree_locking.c Kent Overstreet 2025-06-25  830  				trace_trans_restart_relock(trans, ip, buf.buf);
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  831  
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  832  				count_event(trans->c, trans_restart_relock);
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  833  				__bch2_trans_unlock(trans);
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  834  				bch2_trans_verify_locks(trans);
66782b2acbc329 fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-22  835  				return ret;
66782b2acbc329 fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-22  836  			}
313816363a843f fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-24  837  		}
d7e34f5f64697f fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  838  	}
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  839  
ff1dd05f82338c fs/bcachefs/btree_locking.c Kent Overstreet 2024-11-28  840  	trans_set_locked(trans, true);
650db8a87c343c fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  841  out:
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  842  	bch2_trans_verify_locks(trans);
313816363a843f fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-24  843  	return 0;
313816363a843f fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-24  844  }
313816363a843f fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-24  845  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
