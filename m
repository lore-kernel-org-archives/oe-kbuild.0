Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4212882B7
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774764; cv=none; b=BThmAipArcIgOS5UKBtv62KRNiFicN6gU0LJ44hYWHpN7m1wYDgutOJiAdTKa+Hu4OCnIUA9LfYatwjquMCDdSGW74kkAJU/PojhDXIdCv7/4WXoA7rBh6WXlGoDL/i8xKmKfuKy4x1o2+x4m/SlHPsdCoP+BRj1hAHD9tm21W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774764; c=relaxed/simple;
	bh=TceASc0mKGBXoswNa02+meioh/qksI8uGQypHv7X6JM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ABY5kCt8SjardE8tSysBXmk59sZGq8UfZTL0HlAstMj3Bl318c2STyl4ao6iXw+wMEkFbb4W0jF+70ZuE+PeNrCCxwGVh8tH1hEkRbCSjBfp4439QSDszKP0xiSVlllCi1np+HviaeIOyDVmTmtdg4jORvPCnH2Ld3RtHAeXeh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C621Uwd7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C621Uwd7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778774763; x=1810310763;
  h=date:from:to:cc:subject:message-id;
  bh=TceASc0mKGBXoswNa02+meioh/qksI8uGQypHv7X6JM=;
  b=C621Uwd7S0vRE3NLmgoi97v/9T6A04uppNbxJnbec6jUZWQX9kbI/fqP
   AXyhwx+C/fjxEfVtmvEoMYTL4P9Tsua8Rq85uKtuxWNXyL1yzjvwwkk+v
   fLoqdAc2kJriPuuGWCZJgz2fGfMFFsBnutZ3/EoD5mLI3U7K9N7yWC0fq
   6gI8EUKYLBfPhJfU7g6z9lz+TRdNfrrj2+OUCQbG8qS7ny+ZVy/o2oo5o
   KIqGBY10vDk42WLHkDPsiRiGa7OpyjoxSQZ0/pV9PPTqZE+UWnPxotIwV
   kIFB6nryfsWTMUaIEMSApucj0BBWLiHvDfuTYGbFA0CiiZKEXKgjpSLju
   A==;
X-CSE-ConnectionGUID: Ey85whRuQVi+s0XJkh4CmA==
X-CSE-MsgGUID: gVkYdoIUSEmekfTIG8DvXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79758817"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79758817"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 09:06:02 -0700
X-CSE-ConnectionGUID: 2X4cGIgTRK+eJgQx2/dAdg==
X-CSE-MsgGUID: Lf90ULe6TuySlgRic3E7qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="232023153"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 May 2026 09:06:01 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNYZS-000000006jz-2ADe;
	Thu, 14 May 2026 16:05:58 +0000
Date: Fri, 15 May 2026 00:05:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 458/799]
 fs/bcachefs/btree/commit.c:423 btree_key_can_insert_cached_slowpath() warn:
 inconsistent returns 'trans'.
Message-ID: <202605150013.fnJD2b4o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

Hi Kent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: caf90d22262c52f7c29c4b08bd50f2a27d3dbe25 [458/799] bcachefs: move btree files to subdir
:::::: branch date: 6 months ago
:::::: commit date: 7 months ago
config: riscv-randconfig-r073-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150013.fnJD2b4o-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605150013.fnJD2b4o-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree/commit.c:423 btree_key_can_insert_cached_slowpath() warn: inconsistent returns 'trans'.

vim +/trans +423 fs/bcachefs/btree/commit.c

b0004d8dfac514f fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2018-08-03  387  
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  388  noinline static int
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  389  btree_key_can_insert_cached_slowpath(struct btree_trans *trans, unsigned flags,
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  390  				     struct btree_path *path, unsigned new_u64s)
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  391  {
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  392  	struct bkey_cached *ck = (void *) path->l[0].b;
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  393  	struct bkey_i *new_k;
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  394  	int ret;
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  395  
0971a72c3d1a8be fs/bcachefs/btree_trans_commit.c Kent Overstreet 2024-12-24  396  	bch2_trans_unlock_updates_write(trans);
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  397  	bch2_trans_unlock(trans);
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  398  
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  399  	new_k = kmalloc(new_u64s * sizeof(u64), GFP_KERNEL);
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  400  	if (!new_k) {
09b9c72bd4b77a9 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2025-05-28  401  		struct bch_fs *c = trans->c;
09b9c72bd4b77a9 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2025-05-28  402  		bch_err(c, "error allocating memory for key cache key, btree %s u64s %u",
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  403  			bch2_btree_id_str(path->btree_id), new_u64s);
09b9c72bd4b77a9 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2025-05-28  404  		return bch_err_throw(c, ENOMEM_btree_key_cache_insert);
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  405  	}
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  406  
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  407  	ret =   bch2_trans_relock(trans) ?:
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  408  		bch2_trans_lock_write(trans);
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  409  	if (unlikely(ret)) {
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  410  		kfree(new_k);
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  411  		return ret;
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  412  	}
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  413  
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  414  	memcpy(new_k, ck->k, ck->u64s * sizeof(u64));
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  415  
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  416  	trans_for_each_update(trans, i)
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  417  		if (i->old_v == &ck->k->v)
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  418  			i->old_v = &new_k->v;
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  419  
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  420  	kfree(ck->k);
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  421  	ck->u64s	= new_u64s;
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  422  	ck->k		= new_k;
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05 @423  	return 0;
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  424  }
09b0283ee23a020 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  425  

:::::: The code at line 423 was first introduced by commit
:::::: 09b0283ee23a02094a43a9b93146d1060c58fc3a bcachefs: Make sure to drop/retake btree locks before reclaim

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
