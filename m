Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E665A2DA755
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Oct 2025 05:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760333743; cv=none; b=qFhezWRfwN8DEobvR4pDoUPGX3o+tzVqY6ah2TeChZbupy+sSClExUKRhLDvIWVSke5fTj5PNfEt3AB7pWWvNUmdgpfrgC38diP8N+XDTX+mTGDK2FU/1P0BGagpDyPlxlpw5jE/a40bdHMtTwvtBH30hpXumBOppBpMUG+pCsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760333743; c=relaxed/simple;
	bh=B868WHENPyknIvHXOYVRWIMpMGe7exsZUklNMRy6LHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aOHFAu2m2U7HnYlDOR99fjySM3RQ6JkSVlXj/wLRjfcxBdct01OJccNyLaWWmi43cJY8lDUU3xX3Vc86RoseGaMv24AUJ2B9Q76JAcn9HkqUJAQeNCT50lJr9HC/eLYuDCL1fEoB7SbvbLPH8wIommOO5T/OgPrnn1aacpWnevc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OqAN/JH2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OqAN/JH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760333742; x=1791869742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B868WHENPyknIvHXOYVRWIMpMGe7exsZUklNMRy6LHk=;
  b=OqAN/JH2UG2UzjeGnpWbeBNkC4qvqmBPYM9SSxIWyK54UKHS+HqNo5qp
   u/LZoDFydoA0uDc1WTEu7g0pGhy+YhRY5p4rlBsLQOnJet8+Yve+vdP/O
   8WQ+dyPzBmkHETU5cvNhqccZ5HyKI088LQdnE/w9Ixpl9gBQCS0KXTrVW
   NVgoBFUkm6Wd2zcTfVYOlwQart+RFxiK4bfG6mvff81gBBl8JidVu0Gpu
   rjtPiR75NxAy646+W8qWFZg1Emq5B9mSVpRo2bVzo4vBF3vslLjDUbfbx
   WKVZrQkOM3gGJ2/PJDrqzmkq4381f3sAUUlSYS/PRmhT91K9WzaTWc+FK
   Q==;
X-CSE-ConnectionGUID: T6z67vAaSAW7azMAOyyuwQ==
X-CSE-MsgGUID: dd0h46swTo2XqtNTp9hN7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="66321201"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="66321201"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 22:35:41 -0700
X-CSE-ConnectionGUID: Edb0V7cTRu6a/egR3eEGNg==
X-CSE-MsgGUID: 1Bnz01+sT9qqC36EY6jmJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="181078061"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 12 Oct 2025 22:35:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8BCD-0000B1-0Z;
	Mon, 13 Oct 2025 05:34:26 +0000
Date: Mon, 13 Oct 2025 13:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:bcachefs-testing 457/562] fs/bcachefs/btree/locking.c:791
 bch2_trans_relock_fail() warn: passing zero to 'PTR_ERR'
Message-ID: <202510131331.shd8zRSf-lkp@intel.com>
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

Hi Kent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   da7f2ade2f42d556cfd7648f0fc78002520cb3a9
commit: a105e4cf62a7ccb8f1b8a15190bd7d738bdb4584 [457/562] bcachefs: move btree files to subdir
:::::: branch date: 4 hours ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20251013 (https://download.01.org/0day-ci/archive/20251013/202510131331.shd8zRSf-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510131331.shd8zRSf-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree/locking.c:791 bch2_trans_relock_fail() warn: passing zero to 'PTR_ERR'
fs/bcachefs/btree/update.c:387 __btree_trans_update_by_path() error: uninitialized symbol 'cmp'.
fs/bcachefs/btree/commit.c:423 btree_key_can_insert_cached_slowpath() warn: inconsistent returns 'trans'.

vim +/PTR_ERR +791 fs/bcachefs/btree/locking.c

cd5afabea1acd2 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-19  776  
66782b2acbc329 fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-22  777  static noinline __cold void bch2_trans_relock_fail(struct btree_trans *trans, struct btree_path *path,
ef6fac0f9e5d06 fs/bcachefs/btree_locking.c Kent Overstreet 2025-06-25  778  						   struct get_locks_fail *f, bool trace, ulong ip)
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  779  {
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  780  	if (!trace)
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  781  		goto out;
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  782  
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  783  	if (trace_trans_restart_relock_enabled()) {
a93dcd774eb28d fs/bcachefs/btree_locking.c Kent Overstreet 2025-07-14  784  		CLASS(printbuf, buf)();
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  785  
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  786  		bch2_bpos_to_text(&buf, path->pos);
8a6fa52e07bc8d fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-16  787  		prt_printf(&buf, " %s l=%u seq=%u node seq=",
8a6fa52e07bc8d fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-16  788  			   bch2_btree_id_str(path->btree_id),
8a6fa52e07bc8d fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-16  789  			   f->l, path->l[f->l].lock_seq);
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  790  		if (IS_ERR_OR_NULL(f->b)) {
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09 @791  			prt_str(&buf, bch2_err_str(PTR_ERR(f->b)));
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  792  		} else {
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  793  			prt_printf(&buf, "%u", f->b->c.lock.seq);
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  794  
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  795  			struct six_lock_count c =
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  796  				bch2_btree_node_lock_counts(trans, NULL, &f->b->c, f->l);
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  797  			prt_printf(&buf, " self locked %u.%u.%u", c.n[0], c.n[1], c.n[2]);
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  798  
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  799  			c = six_lock_counts(&f->b->c.lock);
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  800  			prt_printf(&buf, " total locked %u.%u.%u", c.n[0], c.n[1], c.n[2]);
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  801  		}
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  802  
ef6fac0f9e5d06 fs/bcachefs/btree_locking.c Kent Overstreet 2025-06-25  803  		trace_trans_restart_relock(trans, ip, buf.buf);
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  804  	}
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  805  
b97de453651f06 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  806  	count_event(trans->c, trans_restart_relock);
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  807  out:
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  808  	__bch2_trans_unlock(trans);
923ed0ae5ebd0b fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  809  	bch2_trans_verify_locks(trans);
cd5afabea1acd2 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-19  810  }
cd5afabea1acd2 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-19  811  

:::::: The code at line 791 was first introduced by commit
:::::: 923ed0ae5ebd0bb0dbc64a88348fa1835a3644ee bcachefs: bch2_trans_relock_fail() - factor out slowpath

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
