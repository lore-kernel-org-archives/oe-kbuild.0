Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDD4537E9
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763612122; cv=none; b=hVxRFHHDsroAaCwz4ydzo+Y5/pf48SGEZfpChbxs/97/dC8LmkzA+H3BLWxjkXxfij6QAGgEeq6qLWIfOv08DMu/uk22BjWMNKh8IuxlSMfFVMhSkV1P4skpPSHcdqAmMP4ujSkWUqsEobwegxIee+HJOOe5KYDqHa0UPPK+sU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763612122; c=relaxed/simple;
	bh=CxOpz78KflJsMXeuJhnUA9xVlvhk/hoGRWTHLlRqMD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uguZfcqCR05zcHBu1pprX5o+o8J5tKMUjFuGJ2Pp6YESAM3PfnpLzZ4JECyAismOXnXonIsYW+E0seLl1zTBSIEzHsJJmqoyazTd1pe7axlRUBZrfpdEI637LMXOKigl0xUqHg6AWFGfHD7tkwat/IAWdOsDlMUUB6TdxXgZ9I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGCXXFAV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGCXXFAV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763612121; x=1795148121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CxOpz78KflJsMXeuJhnUA9xVlvhk/hoGRWTHLlRqMD4=;
  b=bGCXXFAVEgXd/smrOK+swcPf5xJfA7CEJTh5u0RaQGeRZBNmwYnUziLd
   nkvWxyglygpTFRezRjU72+Bb5O7DlFZdFc2bvntIMFm2lcMSiMGKSQB0N
   BYlbNpytm/iydej6xas6jypoVpG/HXcnQscBk5i3QnjkcvJyOxLcAIW6B
   d8D9AtH18Dc3zLM/EHrfBf/fQHaOA/sCqcQ78o+dZXrG7N9KTRrHP1kqQ
   6zNx+3xhkLXS4F5qVIIg9E2SvkrpUe1dUzB713b3kRuIvi6EppzAbgub8
   vwoAmo4LENh0yhYYAk9ZOMC1g8FNNVp9ZKFgZBLP8WwcfE8Drcjc2tSTZ
   g==;
X-CSE-ConnectionGUID: G3vSzIP2T2GuBwp7hz2uIw==
X-CSE-MsgGUID: uQFFKHwoQ3GkRVlsg6Wqnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68274455"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="68274455"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 20:15:20 -0800
X-CSE-ConnectionGUID: mLnH6V8rTJel0RUqNUukxg==
X-CSE-MsgGUID: IXvUI2KgRCafqeO4b4B+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="221894208"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Nov 2025 20:15:19 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLw4i-0003b5-0Q;
	Thu, 20 Nov 2025 04:15:16 +0000
Date: Thu, 20 Nov 2025 12:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:bcachefs-testing 901/942] fs/bcachefs/btree/locking.c:816
 __bch2_trans_relock() warn: passing zero to 'PTR_ERR'
Message-ID: <202511201258.NXaTloLj-lkp@intel.com>
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
head:   d5b63d49fc651bd29a259346f82b1a7d690299eb
commit: d7e34f5f64697fc5dae146ba03bf7e5016319409 [901/942] bcachefs: improve trans_relock_fail tracepoint
:::::: branch date: 13 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20251118 (https://download.01.org/0day-ci/archive/20251120/202511201258.NXaTloLj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511201258.NXaTloLj-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree/locking.c:816 __bch2_trans_relock() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +816 fs/bcachefs/btree/locking.c

cd5afabea1acd2b fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-19  775  
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  776  static inline int __bch2_trans_relock(struct btree_trans *trans, bool trace, ulong ip)
923ed0ae5ebd0bb fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  777  {
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  778  	bch2_trans_verify_locks(trans);
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  779  
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  780  	if (unlikely(trans->restarted))
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  781  		return -((int) trans->restarted);
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  782  	if (unlikely(trans->locked))
923ed0ae5ebd0bb fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  783  		goto out;
b97de453651f060 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  784  
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  785  	struct btree_path *path;
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  786  	unsigned i;
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  787  
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  788  	trans_for_each_path(trans, path, i) {
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  789  		if (!path->should_be_locked)
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  790  			continue;
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  791  
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  792  		if (likely(!trace_trans_restart_relock_enabled() || !trace)) {
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  793  			int ret = btree_path_get_locks(trans, path, false, NULL,
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  794  						       BCH_ERR_transaction_restart_relock);
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  795  			if (ret) {
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  796  				if (trace)
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  797  					count_event(trans->c, trans_restart_relock);
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  798  				__bch2_trans_unlock(trans);
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  799  				bch2_trans_verify_locks(trans);
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  800  				return ret;
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  801  			}
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  802  		} else {
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  803  			struct get_locks_fail f;
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  804  			struct btree_path old_path = *path;
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  805  			int ret = btree_path_get_locks(trans, path, false, &f,
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  806  						       BCH_ERR_transaction_restart_relock);
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  807  			if (ret) {
c0fdc625ea11fe7 fs/bcachefs/btree_locking.c Kent Overstreet 2025-07-14  808  				CLASS(printbuf, buf)();
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  809  				guard(printbuf_indent)(&buf);
b97de453651f060 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  810  
b97de453651f060 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  811  				bch2_bpos_to_text(&buf, path->pos);
8a6fa52e07bc8d2 fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-16  812  				prt_printf(&buf, " %s l=%u seq=%u node seq=",
8a6fa52e07bc8d2 fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-16  813  					   bch2_btree_id_str(path->btree_id),
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  814  					   f.l, path->l[f.l].lock_seq);
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  815  				if (IS_ERR_OR_NULL(f.b)) {
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16 @816  					prt_str(&buf, bch2_err_str(PTR_ERR(f.b)));
b97de453651f060 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  817  				} else {
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  818  					prt_printf(&buf, "%u", f.b->c.lock.seq);
b97de453651f060 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  819  
b97de453651f060 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  820  					struct six_lock_count c =
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  821  						bch2_btree_node_lock_counts(trans, NULL, &f.b->c, f.l);
b97de453651f060 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  822  					prt_printf(&buf, " self locked %u.%u.%u", c.n[0], c.n[1], c.n[2]);
b97de453651f060 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  823  
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  824  					c = six_lock_counts(&f.b->c.lock);
b97de453651f060 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  825  					prt_printf(&buf, " total locked %u.%u.%u", c.n[0], c.n[1], c.n[2]);
b97de453651f060 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  826  				}
b97de453651f060 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  827  
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  828  				prt_newline(&buf);
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  829  				bch2_btree_path_to_text(&buf, trans, path - trans->paths, &old_path);
ef6fac0f9e5d069 fs/bcachefs/btree_locking.c Kent Overstreet 2025-06-25  830  				trace_trans_restart_relock(trans, ip, buf.buf);
b97de453651f060 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  831  
b97de453651f060 fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-15  832  				count_event(trans->c, trans_restart_relock);
923ed0ae5ebd0bb fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  833  				__bch2_trans_unlock(trans);
923ed0ae5ebd0bb fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  834  				bch2_trans_verify_locks(trans);
66782b2acbc3291 fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-22  835  				return ret;
66782b2acbc3291 fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-22  836  			}
313816363a843f1 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-24  837  		}
d7e34f5f64697fc fs/bcachefs/btree/locking.c Kent Overstreet 2025-11-16  838  	}
923ed0ae5ebd0bb fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  839  
ff1dd05f82338cc fs/bcachefs/btree_locking.c Kent Overstreet 2024-11-28  840  	trans_set_locked(trans, true);
650db8a87c343c8 fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  841  out:
923ed0ae5ebd0bb fs/bcachefs/btree_locking.c Kent Overstreet 2024-04-09  842  	bch2_trans_verify_locks(trans);
313816363a843f1 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-24  843  	return 0;
313816363a843f1 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-24  844  }
313816363a843f1 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-24  845  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
