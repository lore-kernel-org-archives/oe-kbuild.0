Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60B027A133
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 21:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769462256; cv=none; b=JuGW//qmEQVjfEzLfLeP1t6MoFOsX4+OmnA/e7dokylAeONf7ObqMI1wJ/TxFLkqzdcM9vs/6+01frB5TM5gQiryR6fM8qQ5ZjHKlNoKwhDIQalytYuRchKHD8rd1brQ8ANzZmncpaIhT7wJz6VjxZsegyDoNZ2NNLaVLmv9mr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769462256; c=relaxed/simple;
	bh=aqRo225RMvyW+eZ2wXhDW4Muagi0onR7UtlqVHSd0ds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WLmvIOKFxvBIxOjU9v1NDk+taeA7HIr9H0leeRndEeB0P4wxDy1fxn7jzJx9c+zC+45x8F9cyBEF1KMFwODxeKSJqwv2GRmZ743XeQxon10CuUDIpMEGmg6D6c274MaN6OCQ5CQn5/R8Yt+497ZpPuEeWGmT/s1bH+eQ7/wok10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8Jq6vGz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8Jq6vGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769462254; x=1800998254;
  h=date:from:to:cc:subject:message-id;
  bh=aqRo225RMvyW+eZ2wXhDW4Muagi0onR7UtlqVHSd0ds=;
  b=m8Jq6vGzmO9GNoBCJhPHn94Zp1io+S5UkDQLuibOLotj6nQnuziFTmou
   ylPAlg6NgN12fwsB1qyO9QzvYBkxP9QPaZQj1xlVLxCcvdlhaVqX7aCoa
   o3QUEWzdk9ut5ZszgeUFX0oRKz8xUSVVGjjSa/Vdyj7gzs65TYXnH2pXt
   iUaIb2we6w8F/U99A5LIm2TKm7wNh37NJMEboSsKUgdz65ZaVH/zVLm4Z
   mrer6FCtWfC/ecIKhlT7t+FiOrejm0Iqir2rB5M83NA4qkCtJGCAEh1sX
   +7LeughQx6t2TxdXKJYXlAtSOA6UbRITN3LlxXMsMyI0XDImuWcglZeIg
   w==;
X-CSE-ConnectionGUID: vZAADcI6Rvyyj2/QtR5Nog==
X-CSE-MsgGUID: axxYEmG0S/+lWlS6+nXRJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81366544"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="81366544"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 13:17:34 -0800
X-CSE-ConnectionGUID: A3ItdFYITyOZI/W4SfOLlw==
X-CSE-MsgGUID: mkhxxM7GQk+uAsjyckLO+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="230732223"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jan 2026 13:17:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkTxj-00000000Xhc-0tVv;
	Mon, 26 Jan 2026 21:17:31 +0000
Date: Tue, 27 Jan 2026 05:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 458/799]
 fs/bcachefs/btree/commit.c:423 btree_key_can_insert_cached_slowpath() warn:
 inconsistent returns 'trans'.
Message-ID: <202601270519.oH8B4Zs8-lkp@intel.com>
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
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: parisc-randconfig-r071-20260127 (https://download.01.org/0day-ci/archive/20260127/202601270519.oH8B4Zs8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601270519.oH8B4Zs8-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree/commit.c:423 btree_key_can_insert_cached_slowpath() warn: inconsistent returns 'trans'.

vim +/trans +423 fs/bcachefs/btree/commit.c

b0004d8dfac514 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2018-08-03  387  
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  388  noinline static int
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  389  btree_key_can_insert_cached_slowpath(struct btree_trans *trans, unsigned flags,
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  390  				     struct btree_path *path, unsigned new_u64s)
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  391  {
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  392  	struct bkey_cached *ck = (void *) path->l[0].b;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  393  	struct bkey_i *new_k;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  394  	int ret;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  395  
0971a72c3d1a8b fs/bcachefs/btree_trans_commit.c Kent Overstreet 2024-12-24  396  	bch2_trans_unlock_updates_write(trans);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  397  	bch2_trans_unlock(trans);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  398  
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  399  	new_k = kmalloc(new_u64s * sizeof(u64), GFP_KERNEL);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  400  	if (!new_k) {
09b9c72bd4b77a fs/bcachefs/btree_trans_commit.c Kent Overstreet 2025-05-28  401  		struct bch_fs *c = trans->c;
09b9c72bd4b77a fs/bcachefs/btree_trans_commit.c Kent Overstreet 2025-05-28  402  		bch_err(c, "error allocating memory for key cache key, btree %s u64s %u",
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  403  			bch2_btree_id_str(path->btree_id), new_u64s);
09b9c72bd4b77a fs/bcachefs/btree_trans_commit.c Kent Overstreet 2025-05-28  404  		return bch_err_throw(c, ENOMEM_btree_key_cache_insert);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  405  	}
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  406  
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  407  	ret =   bch2_trans_relock(trans) ?:
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  408  		bch2_trans_lock_write(trans);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  409  	if (unlikely(ret)) {
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  410  		kfree(new_k);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  411  		return ret;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  412  	}
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  413  
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  414  	memcpy(new_k, ck->k, ck->u64s * sizeof(u64));
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  415  
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  416  	trans_for_each_update(trans, i)
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  417  		if (i->old_v == &ck->k->v)
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  418  			i->old_v = &new_k->v;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  419  
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  420  	kfree(ck->k);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  421  	ck->u64s	= new_u64s;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  422  	ck->k		= new_k;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05 @423  	return 0;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  424  }
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  425  

:::::: The code at line 423 was first introduced by commit
:::::: 09b0283ee23a02094a43a9b93146d1060c58fc3a bcachefs: Make sure to drop/retake btree locks before reclaim

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
